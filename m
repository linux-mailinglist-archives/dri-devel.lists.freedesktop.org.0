Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F63CB89961
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7BC10E9F3;
	Fri, 19 Sep 2025 13:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="hdm7n6w5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [52.28.197.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53B410E984;
 Fri, 19 Sep 2025 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1758277216; x=1789813216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QGaAvozmIqIzV143yBTS5nQtsGF8X9DZFIMkdv4YYLs=;
 b=hdm7n6w5aNvK1Kjo0IJOp0xje8pxL9SI5ac1DUxLMHhcHqHPhiaPaIML
 ULXFDtDIBM9D7WUhY4qrwqcrPARvPE1+BzJIP4H35hyy6j+6UxKQqPVdT
 xXpKZe++ZDgl7VLSb52Yv+Uyl1F3bBqsJG+7nZnnzp4IKH29+YnoLu0VF
 R0XpxvyLQFOS3Po2S02KbP1ieSGSbzaIBQRD8I0z+50of5HROzP9jA0BM
 vfEJXXpZgirWVEfTNpntS3CFqm5rVhfL1psPohtjKvbREqaqOlT9DImBg
 3bhjSUbBUd+kCezV8maKpL3PzBy8gnBr1ci4Fk6lhStmKCiNhu46cG/Xr A==;
X-CSE-ConnectionGUID: bNGyTyr9Tluytx4xpBWYaw==
X-CSE-MsgGUID: NUPh/j/ESIquMv5V2VCWqg==
X-IronPort-AV: E=Sophos;i="6.18,277,1751241600"; 
   d="scan'208";a="2263473"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
 by internal-fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 10:20:05 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.226:21045]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.8.212:2525]
 with esmtp (Farcaster)
 id 156d81fd-6821-4347-8cba-062f59dcaca0; Fri, 19 Sep 2025 10:20:04 +0000 (UTC)
X-Farcaster-Flow-ID: 156d81fd-6821-4347-8cba-062f59dcaca0
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 19 Sep 2025 10:20:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Fri, 19 Sep 2025
 10:19:36 +0000
From: Eliav Farber <farbere@amazon.com>
To: <linux@armlinux.org.uk>, <jdike@addtoit.com>, <richard@nod.at>,
 <anton.ivanov@cambridgegreys.com>, <dave.hansen@linux.intel.com>,
 <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>,
 <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <mchehab@kernel.org>,
 <james.morse@arm.com>, <rric@kernel.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <evan.quan@amd.com>, <james.qian.wang@arm.com>, <liviu.dudau@arm.com>,
 <mihail.atanassov@arm.com>, <brian.starkey@arm.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robdclark@gmail.com>, <sean@poorly.run>,
 <jdelvare@suse.com>, <linux@roeck-us.net>, <fery@cypress.com>,
 <dmitry.torokhov@gmail.com>, <agk@redhat.com>, <snitzer@redhat.com>,
 <dm-devel@redhat.com>, <rajur@chelsio.com>, <davem@davemloft.net>,
 <kuba@kernel.org>, <peppe.cavallaro@st.com>, <alexandre.torgue@st.com>,
 <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <malattia@linux.it>,
 <hdegoede@redhat.com>, <mgross@linux.intel.com>, <intel-linux-scu@intel.com>, 
 <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <clm@fb.com>, <josef@toxicpanda.com>,
 <dsterba@suse.com>, <jack@suse.com>, <tytso@mit.edu>,
 <adilger.kernel@dilger.ca>, <dushistov@mail.ru>,
 <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>, <pmladek@suse.com>,
 <sergey.senozhatsky@gmail.com>, <andriy.shevchenko@linux.intel.com>,
 <linux@rasmusvillemoes.dk>, <minchan@kernel.org>, <ngupta@vflare.org>,
 <akpm@linux-foundation.org>, <kuznet@ms2.inr.ac.ru>,
 <yoshfuji@linux-ipv6.org>, <pablo@netfilter.org>, <kadlec@netfilter.org>,
 <fw@strlen.de>, <jmaloy@redhat.com>, <ying.xue@windriver.com>,
 <willy@infradead.org>, <farbere@amazon.com>, <sashal@kernel.org>,
 <ruanjinjie@huawei.com>, <David.Laight@ACULAB.COM>,
 <herve.codina@bootlin.com>, <Jason@zx2c4.com>, <bvanassche@acm.org>,
 <keescook@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-um@lists.infradead.org>,
 <linux-edac@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>,
 <linux-ext4@vger.kernel.org>, <linux-sparse@vger.kernel.org>,
 <linux-mm@kvack.org>, <netfilter-devel@vger.kernel.org>,
 <coreteam@netfilter.org>, <tipc-discussion@lists.sourceforge.net>,
 <stable@vger.kernel.org>
CC: <jonnyc@amazon.com>
Subject: [PATCH 03/27 5.10.y] minmax: clamp more efficiently by avoiding extra
 comparison
Date: Fri, 19 Sep 2025 10:17:03 +0000
Message-ID: <20250919101727.16152-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250919101727.16152-1-farbere@amazon.com>
References: <20250919101727.16152-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D045UWA004.ant.amazon.com (10.13.139.91) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
X-Mailman-Approved-At: Fri, 19 Sep 2025 13:06:01 +0000
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

[ Upstream commit 2122e2a4efc2cd139474079e11939b6e07adfacd ]

Currently the clamp algorithm does:

    if (val > hi)
        val = hi;
    if (val < lo)
        val = lo;

But since hi > lo by definition, this can be made more efficient with:

    if (val > hi)
        val = hi;
    else if (val < lo)
        val = lo;

So fix up the clamp and clamp_t functions to do this, adding the same
argument checking as for min and min_t.

For simple cases, code generation on x86_64 and aarch64 stay about the
same:

    before:
            cmp     edi, edx
            mov     eax, esi
            cmova   edi, edx
            cmp     edi, esi
            cmovnb  eax, edi
            ret
    after:
            cmp     edi, esi
            mov     eax, edx
            cmovnb  esi, edi
            cmp     edi, edx
            cmovb   eax, esi
            ret

    before:
            cmp     w0, w2
            csel    w8, w0, w2, lo
            cmp     w8, w1
            csel    w0, w8, w1, hi
            ret
    after:
            cmp     w0, w1
            csel    w8, w0, w1, hi
            cmp     w0, w2
            csel    w0, w8, w2, lo
            ret

On MIPS64, however, code generation improves, by removing arithmetic in
the second branch:

    before:
            sltu    $3,$6,$4
            bne     $3,$0,.L2
            move    $2,$6

            move    $2,$4
    .L2:
            sltu    $3,$2,$5
            bnel    $3,$0,.L7
            move    $2,$5

    .L7:
            jr      $31
            nop
    after:
            sltu    $3,$4,$6
            beq     $3,$0,.L13
            move    $2,$6

            sltu    $3,$4,$5
            bne     $3,$0,.L12
            move    $2,$4

    .L13:
            jr      $31
            nop

    .L12:
            jr      $31
            move    $2,$5

For more complex cases with surrounding code, the effects are a bit
more complicated. For example, consider this simplified version of
timestamp_truncate() from fs/inode.c on x86_64:

    struct timespec64 timestamp_truncate(struct timespec64 t, struct inode *inode)
    {
        struct super_block *sb = inode->i_sb;
        unsigned int gran = sb->s_time_gran;

        t.tv_sec = clamp(t.tv_sec, sb->s_time_min, sb->s_time_max);
        if (t.tv_sec == sb->s_time_max || t.tv_sec == sb->s_time_min)
            t.tv_nsec = 0;
        return t;
    }

    before:
            mov     r8, rdx
            mov     rdx, rsi
            mov     rcx, QWORD PTR [r8]
            mov     rax, QWORD PTR [rcx+8]
            mov     rcx, QWORD PTR [rcx+16]
            cmp     rax, rdi
            mov     r8, rcx
            cmovge  rdi, rax
            cmp     rdi, rcx
            cmovle  r8, rdi
            cmp     rax, r8
            je      .L4
            cmp     rdi, rcx
            jge     .L4
            mov     rax, r8
            ret
    .L4:
            xor     edx, edx
            mov     rax, r8
            ret

    after:
            mov     rax, QWORD PTR [rdx]
            mov     rdx, QWORD PTR [rax+8]
            mov     rax, QWORD PTR [rax+16]
            cmp     rax, rdi
            jg      .L6
            mov     r8, rax
            xor     edx, edx
    .L2:
            mov     rax, r8
            ret
    .L6:
            cmp     rdx, rdi
            mov     r8, rdi
            cmovge  r8, rdx
            cmp     rax, r8
            je      .L4
            xor     eax, eax
            cmp     rdx, rdi
            cmovl   rax, rsi
            mov     rdx, rax
            mov     rax, r8
            ret
    .L4:
            xor     edx, edx
            jmp     .L2

In this case, we actually gain a branch, unfortunately, because the
compiler's replacement axioms no longer as cleanly apply.

So all and all, this change is a bit of a mixed bag.

Link: https://lkml.kernel.org/r/20220926133435.1333846-2-Jason@zx2c4.com
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/minmax.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 8b092c66c5aa..abdeae409dad 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -38,7 +38,7 @@
 		__cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
 
 #define __clamp(val, lo, hi)	\
-	__cmp(__cmp(val, lo, >), hi, <)
+	((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
 
 #define __clamp_once(val, lo, hi, unique_val, unique_lo, unique_hi) ({	\
 		typeof(val) unique_val = (val);				\
-- 
2.47.3

