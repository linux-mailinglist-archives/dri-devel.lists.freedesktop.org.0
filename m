Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 825EB1CFCEF
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 20:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BB36E95B;
	Tue, 12 May 2020 18:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Tue, 12 May 2020 18:16:00 UTC
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32236E95B;
 Tue, 12 May 2020 18:16:00 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 12 May 2020 11:00:53 -0700
Received: from localhost.localdomain (ashwinh-vm-1.vmware.com [10.110.19.225])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 9B7624051F;
 Tue, 12 May 2020 11:00:52 -0700 (PDT)
From: ashwin-h <ashwinh@vmware.com>
To: <x86@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
Date: Wed, 13 May 2020 07:19:21 +0530
Message-ID: <d29f87f3f3abb4e496866253bd170faad976f687.1589305630.git.ashwinh@vmware.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: ashwinh@vmware.com does not
 designate permitted sender hosts)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, stable@kernel.org, Ashwin H <ashwinh@vmware.com>,
 srostedt@vmware.com, Linus Torvalds <torvalds@linux-foundation.org>,
 srivatsa@csail.mit.edu, srivatsab@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Linus Torvalds <torvalds@linux-foundation.org>

commit 594cc251fdd0d231d342d88b2fdff4bc42fb0690 upstream.

Originally, the rule used to be that you'd have to do access_ok()
separately, and then user_access_begin() before actually doing the
direct (optimized) user access.

But experience has shown that people then decide not to do access_ok()
at all, and instead rely on it being implied by other operations or
similar.  Which makes it very hard to verify that the access has
actually been range-checked.

If you use the unsafe direct user accesses, hardware features (either
SMAP - Supervisor Mode Access Protection - on x86, or PAN - Privileged
Access Never - on ARM) do force you to use user_access_begin().  But
nothing really forces the range check.

By putting the range check into user_access_begin(), we actually force
people to do the right thing (tm), and the range check vill be visible
near the actual accesses.  We have way too long a history of people
trying to avoid them.

Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Ashwin H <ashwinh@vmware.com>
---
 arch/x86/include/asm/uaccess.h             | 11 ++++++++++-
 drivers/gpu/drm/i915/i915_gem_execbuffer.c | 15 +++++++++++++--
 include/linux/uaccess.h                    |  2 +-
 kernel/compat.c                            |  6 ++----
 kernel/exit.c                              |  6 ++----
 lib/strncpy_from_user.c                    |  9 +++++----
 lib/strnlen_user.c                         |  9 +++++----
 7 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 9718303..82cd874 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -711,7 +711,16 @@ extern struct movsl_mask {
  * checking before using them, but you have to surround them with the
  * user_access_begin/end() pair.
  */
-#define user_access_begin()	__uaccess_begin()
+static __must_check inline bool user_access_begin(const bool type,
+                                                  const void __user *ptr,
+                                                  size_t len)
+{
+	if (unlikely(!access_ok(type, ptr, len)))
+		return 0;
+	__uaccess_begin();
+	return 1;
+}
+#define user_access_begin(t, a, b) user_access_begin(t, a, b)
 #define user_access_end()	__uaccess_end()
 
 #define unsafe_put_user(x, ptr, err_label)					\
diff --git a/drivers/gpu/drm/i915/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
index f08c547..7110e8f 100644
--- a/drivers/gpu/drm/i915/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
@@ -1604,7 +1604,9 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 		 * happened we would make the mistake of assuming that the
 		 * relocations were valid.
 		 */
-		user_access_begin();
+		if (!user_access_begin(VERIFY_WRITE, urelocs, size))
+			goto end_user;
+
 		for (copied = 0; copied < nreloc; copied++)
 			unsafe_put_user(-1,
 					&urelocs[copied].presumed_offset,
@@ -2649,7 +2651,16 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 		unsigned int i;
 
 		/* Copy the new buffer offsets back to the user's exec list. */
-		user_access_begin();
+		/*
+		 * Note: count * sizeof(*user_exec_list) does not overflow,
+		 * because we checked 'count' in check_buffer_count().
+		 *
+		 * And this range already got effectively checked earlier
+		 * when we did the "copy_from_user()" above.
+		 */
+		if (!user_access_begin(VERIFY_WRITE, user_exec_list, count * sizeof(*user_exec_list)))
+			goto end_user;
+
 		for (i = 0; i < args->buffer_count; i++) {
 			if (!(exec2_list[i].offset & UPDATE))
 				continue;
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index efe79c1..d55b68b 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -267,7 +267,7 @@ extern long strncpy_from_unsafe(char *dst, const void *unsafe_addr, long count);
 	probe_kernel_read(&retval, addr, sizeof(retval))
 
 #ifndef user_access_begin
-#define user_access_begin() do { } while (0)
+#define user_access_begin(type, ptr, len) access_ok(type, ptr, len)
 #define user_access_end() do { } while (0)
 #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
 #define unsafe_put_user(x, ptr, err) do { if (unlikely(__put_user(x, ptr))) goto err; } while (0)
diff --git a/kernel/compat.c b/kernel/compat.c
index 8e40efc..e4548a9 100644
--- a/kernel/compat.c
+++ b/kernel/compat.c
@@ -354,10 +354,9 @@ long compat_get_bitmap(unsigned long *mask, const compat_ulong_t __user *umask,
 	bitmap_size = ALIGN(bitmap_size, BITS_PER_COMPAT_LONG);
 	nr_compat_longs = BITS_TO_COMPAT_LONGS(bitmap_size);
 
-	if (!access_ok(VERIFY_READ, umask, bitmap_size / 8))
+	if (!user_access_begin(VERIFY_READ, umask, bitmap_size / 8))
 		return -EFAULT;
 
-	user_access_begin();
 	while (nr_compat_longs > 1) {
 		compat_ulong_t l1, l2;
 		unsafe_get_user(l1, umask++, Efault);
@@ -384,10 +383,9 @@ long compat_put_bitmap(compat_ulong_t __user *umask, unsigned long *mask,
 	bitmap_size = ALIGN(bitmap_size, BITS_PER_COMPAT_LONG);
 	nr_compat_longs = BITS_TO_COMPAT_LONGS(bitmap_size);
 
-	if (!access_ok(VERIFY_WRITE, umask, bitmap_size / 8))
+	if (!user_access_begin(VERIFY_WRITE, umask, bitmap_size / 8))
 		return -EFAULT;
 
-	user_access_begin();
 	while (nr_compat_longs > 1) {
 		unsigned long m = *mask++;
 		unsafe_put_user((compat_ulong_t)m, umask++, Efault);
diff --git a/kernel/exit.c b/kernel/exit.c
index 54c3269..894fca5 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -1617,10 +1617,9 @@ SYSCALL_DEFINE5(waitid, int, which, pid_t, upid, struct siginfo __user *,
 	if (!infop)
 		return err;
 
-	if (!access_ok(VERIFY_WRITE, infop, sizeof(*infop)))
+	if (!user_access_begin(VERIFY_WRITE, infop, sizeof(*infop)))
 		return -EFAULT;
 
-	user_access_begin();
 	unsafe_put_user(signo, &infop->si_signo, Efault);
 	unsafe_put_user(0, &infop->si_errno, Efault);
 	unsafe_put_user(info.cause, &infop->si_code, Efault);
@@ -1745,10 +1744,9 @@ COMPAT_SYSCALL_DEFINE5(waitid,
 	if (!infop)
 		return err;
 
-	if (!access_ok(VERIFY_WRITE, infop, sizeof(*infop)))
+	if (!user_access_begin(VERIFY_WRITE, infop, sizeof(*infop)))
 		return -EFAULT;
 
-	user_access_begin();
 	unsafe_put_user(signo, &infop->si_signo, Efault);
 	unsafe_put_user(0, &infop->si_errno, Efault);
 	unsafe_put_user(info.cause, &infop->si_code, Efault);
diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index e304b54..b8570a1 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -115,10 +115,11 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 
 		kasan_check_write(dst, count);
 		check_object_size(dst, count, false);
-		user_access_begin();
-		retval = do_strncpy_from_user(dst, src, count, max);
-		user_access_end();
-		return retval;
+		if (user_access_begin(VERIFY_READ, src, max)) {
+			retval = do_strncpy_from_user(dst, src, count, max);
+			user_access_end();
+			return retval;
+		}
 	}
 	return -EFAULT;
 }
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 184f80f..f5fa5b2 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -114,10 +114,11 @@ long strnlen_user(const char __user *str, long count)
 		unsigned long max = max_addr - src_addr;
 		long retval;
 
-		user_access_begin();
-		retval = do_strnlen_user(str, count, max);
-		user_access_end();
-		return retval;
+		if (user_access_begin(VERIFY_READ, str, max)) {
+			retval = do_strnlen_user(str, count, max);
+			user_access_end();
+			return retval;
+		}
 	}
 	return 0;
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
