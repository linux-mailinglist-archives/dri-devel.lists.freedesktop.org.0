Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D285CB911D7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231CB10E464;
	Mon, 22 Sep 2025 12:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V84LpWZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705410E464;
 Mon, 22 Sep 2025 12:27:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECE1744F9F;
 Mon, 22 Sep 2025 12:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162ECC4CEF7;
 Mon, 22 Sep 2025 12:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1758544038;
 bh=92DBN3bMcFz8vIRdBZNpPrekIoZC1bozepvmjOs0AUA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=V84LpWZQKz0fN+oNTS7CQG+5BaEaSfOrRCwA02aLtlfFAJAXI3Lfnb55+cE1RtZAe
 TuEEGyHcpkKxuUx+8hQ8++E0yiQ/OlSgOmgOy0cGiSqN/PNkCtehWG2L8Un/Zz4F8E
 QXWtUhRm+hUsIfl9CZn9LmoqUgFDEnD6xm89KgqM=
Subject: Patch "minmax: fix up min3() and max3() too" has been added to the
 6.6-stable tree
To: David.Laight@ACULAB.COM, David.Laight@aculab.com,
	Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com, agk@redhat.com,
	airlied@gmail.com, akpm@linux-foundation.org,
	alexander.deucher@amd.com, alexandre.torgue@foss.st.com,
	amd-gfx@lists.freedesktop.org, andriy.shevchenko@linux.intel.com,
	anton.ivanov@cambridgegreys.com, arnd@kernel.org,
	artur.paszkiewicz@intel.com, bp@alien8.de, christian.koenig@amd.com,
	clm@fb.com, daniel@ffwll.ch, dave.hansen@linux.intel.com,
	davem@davemloft.net, dm-devel@lists.linux.dev,
	dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
	dsahern@kernel.org, dsterba@suse.com, edumazet@google.com,
	evan.quan@amd.com, farbere@amazon.com, gregkh@linuxfoundation.org,
	harry.wentland@amd.com, hdegoede@redhat.com, hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com, james.morse@arm.com,
	jdelvare@suse.com, jejb@linux.ibm.com, jernej.skrabec@gmail.com,
	joabreu@synopsys.com, johannes@sipsolutions.net,
	josef@toxicpanda.com, keescook@chromium.org,
	krzysztof.kozlowski@linaro.org, kuba@kernel.org,
	linus.walleij@linaro.org, l@freedesktop.org,
	inux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-staging@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-um@lists.infradead.org,
	linux@rasmusvillemoes.dk, linux@roeck-us.net,
	luc.vanoostenryck@gmail.com, luto@kernel.org,
	maarten.lankhorst@linux.intel.com, mailhol.vincent@wanadoo.fr,
	malattia@linux.it, markgross@kernel.org, martin.petersen@oracle.com,
	mchehab@kernel.org, mcoquelin.stm32@gmail.com, mhiramat@kernel.org,
	minchan@kernel.org, mingo@redhat.com, mkl@pengutronix.de,
	mripard@kernel.org, pabeni@redhat.com, peterz@infradead.org,
	pmladek@suse.com, qiuxu.zhuo@intel.com, richard@nod.at,
	rostedt@goodmis.org, rric@kernel.org, sakari.ailus@linux.intel.com,
	samuel@sholland.org, senozhatsky@chromium.org, shuah@kernel.org,
	snitzer@kernel.org, sunpeng.li@amd.com, tglx@linutronix.de,
	tony.luck@intel.com, torvalds@linux-foundation.org,
	tzimmermann@suse.de, wad@chromium.org, wens@csie.org,
	wg@grandegger.com, x86@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 22 Sep 2025 14:26:59 +0200
In-Reply-To: <20250922103241.16213-9-farbere@amazon.com>
Message-ID: <2025092259-reprocess-reward-329d@gregkh>
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

    minmax: fix up min3() and max3() too

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     minmax-fix-up-min3-and-max3-too.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From prvs=353d6d59a=farbere@amazon.com Mon Sep 22 12:37:42 2025
From: Eliav Farber <farbere@amazon.com>
Date: Mon, 22 Sep 2025 10:32:34 +0000
Subject: minmax: fix up min3() and max3() too
To: <richard@nod.at>, <anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>, <dave.hansen@linux.intel.com>, <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>, <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <james.morse@arm.com>, <mchehab@kernel.org>, <rric@kernel.org>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>, <evan.quan@amd.com>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <tzimmermann@suse.de>, <jdelvare@suse.com>, <linux@roeck-us.net>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>, <dm-devel@lists.linux.dev>, <mailhol.vincent@wanadoo.fr>, <wg@grandegger.com>, <mkl@pengutronix.de>, <davem@davemloft.net>, <edu
 mazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>, <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@linaro.org>, <malattia@linux.it>, <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, <markgross@kernel.org>, <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>, <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>, <mhiramat@kernel.org>, <pmladek@suse.com>, <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>, <senozhatsky@chromium.org>, <minchan@kernel.org>, <akpm@linux-foundation.org>, <dsahern@kernel.org>, <shuah@kernel.org>, <keescook@chromium.org>, <wad@chromium.org>, <farbere@amazon.com>, <David.Laight@ACULAB.COM>, <arnd@kernel.org>, <linux-um@lists.infradead.org>, <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>, <amd-gfx@lists.freedeskto
 p.org>, <dri-devel@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>, <linux-media@vger.kernel.org>, <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>, <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, <bpf@vger.kernel.org>, <stable@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Laight <David.Laight@aculab.com>
Message-ID: <20250922103241.16213-9-farbere@amazon.com>

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 21b136cc63d2a9ddd60d4699552b69c214b32964 ]

David Laight pointed out that we should deal with the min3() and max3()
mess too, which still does excessive expansion.

And our current macros are actually rather broken.

In particular, the macros did this:

  #define min3(x, y, z) min((typeof(x))min(x, y), z)
  #define max3(x, y, z) max((typeof(x))max(x, y), z)

and that not only is a nested expansion of possibly very complex
arguments with all that involves, the typing with that "typeof()" cast
is completely wrong.

For example, imagine what happens in max3() if 'x' happens to be a
'unsigned char', but 'y' and 'z' are 'unsigned long'.  The types are
compatible, and there's no warning - but the result is just random
garbage.

No, I don't think we've ever hit that issue in practice, but since we
now have sane infrastructure for doing this right, let's just use it.
It fixes any excessive expansion, and also avoids these kinds of broken
type issues.

Requested-by: David Laight <David.Laight@aculab.com>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/minmax.h |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -152,13 +152,20 @@
 #define umax(x, y)	\
 	__careful_cmp(max, (x) + 0u + 0ul + 0ull, (y) + 0u + 0ul + 0ull)
 
+#define __careful_op3(op, x, y, z, ux, uy, uz) ({			\
+	__auto_type ux = (x); __auto_type uy = (y);__auto_type uz = (z);\
+	BUILD_BUG_ON_MSG(!__types_ok3(x,y,z,ux,uy,uz),			\
+		#op"3("#x", "#y", "#z") signedness error");		\
+	__cmp(op, ux, __cmp(op, uy, uz)); })
+
 /**
  * min3 - return minimum of three values
  * @x: first value
  * @y: second value
  * @z: third value
  */
-#define min3(x, y, z) min((typeof(x))min(x, y), z)
+#define min3(x, y, z) \
+	__careful_op3(min, x, y, z, __UNIQUE_ID(x_), __UNIQUE_ID(y_), __UNIQUE_ID(z_))
 
 /**
  * max3 - return maximum of three values
@@ -166,7 +173,8 @@
  * @y: second value
  * @z: third value
  */
-#define max3(x, y, z) max((typeof(x))max(x, y), z)
+#define max3(x, y, z) \
+	__careful_op3(max, x, y, z, __UNIQUE_ID(x_), __UNIQUE_ID(y_), __UNIQUE_ID(z_))
 
 /**
  * min_not_zero - return the minimum that is _not_ zero, unless both are zero


Patches currently in stable-queue which might be from farbere@amazon.com are

queue-6.6/minmax-don-t-use-max-in-situations-that-want-a-c-constant-expression.patch
queue-6.6/minmax-make-generic-min-and-max-macros-available-everywhere.patch
queue-6.6/minmax-fix-up-min3-and-max3-too.patch
queue-6.6/minmax-add-a-few-more-min_t-max_t-users.patch
queue-6.6/minmax-improve-macro-expansion-and-type-checking.patch
queue-6.6/minmax-avoid-overly-complicated-constant-expressions-in-vm-code.patch
queue-6.6/minmax-simplify-min-max-clamp-implementation.patch
queue-6.6/minmax-simplify-and-clarify-min_t-max_t-implementation.patch
