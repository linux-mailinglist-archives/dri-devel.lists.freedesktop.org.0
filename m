Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EA7BBDB82
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724A710E3F2;
	Mon,  6 Oct 2025 10:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ySCttw3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0DE10E3F2;
 Mon,  6 Oct 2025 10:40:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D9A0D4510F;
 Mon,  6 Oct 2025 10:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346CBC4CEF5;
 Mon,  6 Oct 2025 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759747208;
 bh=d1RJmttUV9SjcOAsVtow8qlwV+/r9oLBzb7vHACoeo4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=ySCttw3iKtUdz14zeF6gQ3oefYcuO9oOADNkNFojp78IzUfnplDE08EqFSSO/zLOG
 GqG1a9bYik9nfslkZukaQwjUM+I11bqwgLWLbtkPEzcvjoTHkEBNRkeWwDVbq1WFMG
 3QMoie9KF+F/o10TsV6ItsoK4d2vwflCNxd0tJzY=
Subject: Patch "minmax: don't use max() in situations that want a C constant
 expression" has been added to the 6.1-stable tree
To: David.Laight@ACULAB.COM, David.Laight@aculab.com, agk@redhat.com,
 airlied@gmail.com, akpm@linux-foundation.org, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, andriy.shevchenko@linux.intel.com,
 asad.kamal@amd.com, christian.koenig@amd.com, clm@fb.com,
 dm-devel@lists.linux.dev, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, dsterba@suse.com, farbere@amazon.com,
 gregkh@linuxfoundation.org, jernej.skrabec@gmail.com, kenneth.feng@amd.com,
 kevinyang.wang@amd.com, lijo.lazar@amd.com, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux@rasmusvillemoes.dk, lorenzo.stoakes@oracle.com,
 luc.vanoostenryck@gmail.com, mpatocka@redhat.com, pmladek@suse.com,
 rostedt@goodmis.org, samuel@sholland.org, senozhatsky@chromium.org,
 simona@ffwll.ch, snitzer@kernel.org, tglx@linutronix.de,
 torvalds@linux-foundation.org, wens@csie.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 06 Oct 2025 12:39:09 +0200
In-Reply-To: <20251003121520.8176-2-farbere@amazon.com>
Message-ID: <2025100609-sacred-breach-69da@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    minmax: don't use max() in situations that want a C constant expression

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     minmax-don-t-use-max-in-situations-that-want-a-c-constant-expression.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-183172-greg=kroah.com@vger.kernel.org Fri Oct  3 14:16:33 2025
From: Eliav Farber <farbere@amazon.com>
Date: Fri, 3 Oct 2025 12:15:10 +0000
Subject: minmax: don't use max() in situations that want a C constant expression
To: <gregkh@linuxfoundation.org>, <kenneth.feng@amd.com>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>, <clm@fb.com>, <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <pmladek@suse.com>, <rostedt@goodmis.org>, <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>, <senozhatsky@chromium.org>, <akpm@linux-foundation.org>, <lijo.lazar@amd.com>, <asad.kamal@amd.com>, <kevinyang.wang@amd.com>, <David.Laight@ACULAB.COM>, <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>, <dm-devel@lists.linux.dev>, <linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>, <stable@vger.
 kernel.org>, <farbere@amazon.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Laight <David.Laight@aculab.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Message-ID: <20251003121520.8176-2-farbere@amazon.com>

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit cb04e8b1d2f24c4c2c92f7b7529031fc35a16fed ]

We only had a couple of array[] declarations, and changing them to just
use 'MAX()' instead of 'max()' fixes the issue.

This will allow us to simplify our min/max macros enormously, since they
can now unconditionally use temporary variables to avoid using the
argument values multiple times.

Cc: David Laight <David.Laight@aculab.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c   |    2 +-
 drivers/input/touchscreen/cyttsp4_core.c |    2 +-
 drivers/irqchip/irq-sun6i-r.c            |    2 +-
 drivers/md/dm-integrity.c                |    2 +-
 fs/btrfs/tree-checker.c                  |    2 +-
 lib/vsprintf.c                           |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -700,7 +700,7 @@ static const char *smu_get_feature_name(
 size_t smu_cmn_get_pp_feature_mask(struct smu_context *smu,
 				   char *buf)
 {
-	int8_t sort_feature[max(SMU_FEATURE_COUNT, SMU_FEATURE_MAX)];
+	int8_t sort_feature[MAX(SMU_FEATURE_COUNT, SMU_FEATURE_MAX)];
 	uint64_t feature_mask;
 	int i, feature_index;
 	uint32_t count = 0;
--- a/drivers/input/touchscreen/cyttsp4_core.c
+++ b/drivers/input/touchscreen/cyttsp4_core.c
@@ -871,7 +871,7 @@ static void cyttsp4_get_mt_touches(struc
 	struct cyttsp4_touch tch;
 	int sig;
 	int i, j, t = 0;
-	int ids[max(CY_TMA1036_MAX_TCH, CY_TMA4XX_MAX_TCH)];
+	int ids[MAX(CY_TMA1036_MAX_TCH, CY_TMA4XX_MAX_TCH)];
 
 	memset(ids, 0, si->si_ofs.tch_abs[CY_TCH_T].max * sizeof(int));
 	for (i = 0; i < num_cur_tch; i++) {
--- a/drivers/irqchip/irq-sun6i-r.c
+++ b/drivers/irqchip/irq-sun6i-r.c
@@ -270,7 +270,7 @@ static const struct irq_domain_ops sun6i
 
 static int sun6i_r_intc_suspend(void)
 {
-	u32 buf[BITS_TO_U32(max(SUN6I_NR_TOP_LEVEL_IRQS, SUN6I_NR_MUX_BITS))];
+	u32 buf[BITS_TO_U32(MAX(SUN6I_NR_TOP_LEVEL_IRQS, SUN6I_NR_MUX_BITS))];
 	int i;
 
 	/* Wake IRQs are enabled during system sleep and shutdown. */
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -1794,7 +1794,7 @@ static void integrity_metadata(struct wo
 		struct bio *bio = dm_bio_from_per_bio_data(dio, sizeof(struct dm_integrity_io));
 		char *checksums;
 		unsigned int extra_space = unlikely(digest_size > ic->tag_size) ? digest_size - ic->tag_size : 0;
-		char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
+		char checksums_onstack[MAX(HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
 		sector_t sector;
 		unsigned int sectors_to_process;
 
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -608,7 +608,7 @@ static int check_dir_item(struct extent_
 		 */
 		if (key->type == BTRFS_DIR_ITEM_KEY ||
 		    key->type == BTRFS_XATTR_ITEM_KEY) {
-			char namebuf[max(BTRFS_NAME_LEN, XATTR_NAME_MAX)];
+			char namebuf[MAX(BTRFS_NAME_LEN, XATTR_NAME_MAX)];
 
 			read_extent_buffer(leaf, namebuf,
 					(unsigned long)(di + 1), name_len);
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1082,7 +1082,7 @@ char *resource_string(char *buf, char *e
 #define FLAG_BUF_SIZE		(2 * sizeof(res->flags))
 #define DECODED_BUF_SIZE	sizeof("[mem - 64bit pref window disabled]")
 #define RAW_BUF_SIZE		sizeof("[mem - flags 0x]")
-	char sym[max(2*RSRC_BUF_SIZE + DECODED_BUF_SIZE,
+	char sym[MAX(2*RSRC_BUF_SIZE + DECODED_BUF_SIZE,
 		     2*RSRC_BUF_SIZE + FLAG_BUF_SIZE + RAW_BUF_SIZE)];
 
 	char *p = sym, *pend = sym + sizeof(sym);


Patches currently in stable-queue which might be from farbere@amazon.com are

queue-6.1/minmax-improve-macro-expansion-and-type-checking.patch
queue-6.1/minmax.h-simplify-the-variants-of-clamp.patch
queue-6.1/minmax.h-move-all-the-clamp-definitions-after-the-min-max-ones.patch
queue-6.1/minmax-don-t-use-max-in-situations-that-want-a-c-constant-expression.patch
queue-6.1/minmax.h-remove-some-defines-that-are-only-expanded-once.patch
queue-6.1/minmax.h-use-build_bug_on_msg-for-the-lo-hi-test-in-clamp.patch
queue-6.1/minmax-simplify-min-max-clamp-implementation.patch
queue-6.1/minmax.h-add-whitespace-around-operators-and-after-commas.patch
queue-6.1/minmax-fix-up-min3-and-max3-too.patch
queue-6.1/minmax.h-reduce-the-define-expansion-of-min-max-and-clamp.patch
queue-6.1/minmax.h-update-some-comments.patch
