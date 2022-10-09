Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6815F93D7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAED10E101;
	Sun,  9 Oct 2022 23:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F26B10E101
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 23:49:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C66360C57;
 Sun,  9 Oct 2022 23:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4797DC433B5;
 Sun,  9 Oct 2022 23:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359378;
 bh=S/I8Db7hLIbRM3PUf798Ca3ZgHM9rw+HgU88xibN3X0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NNaVZskFznScArpYGXS8Wi1e/A6iLRGZCxkiLw9Yf8dNLE2KwvS3mBCZq/NPqIiS9
 M1+THfSE6THlkn8BVcBddMeAQCCYP3MUkOz41dIXlrN95jW+3HNRZ0fN0A8Mb99q2e
 FbQ+0sIPsLzi4LSzKg96JfS3EQH9VWE3H8pUfyc3QFzrHkGVx9EwebJnYE31ds0lhb
 OCE0z+5lghVIYNbRH1c4kfPOoAmwz/CIiC0tA4EHEm61HDfTuG83ulRzXf9A5zsm6L
 oK3aaV6JIdyWavWq2Hue+t5b3urSeF0A3vxcyRo3n4Lmu3AxZrlQ64wX67BWdEmXDj
 pb7/XDx0Oxp/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 03/44] drm: Prevent drm_copy_field() to attempt
 copying a NULL pointer
Date: Sun,  9 Oct 2022 19:48:51 -0400
Message-Id: <20221009234932.1230196-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Javier Martinez Canillas <javierm@redhat.com>

[ Upstream commit f6ee30407e883042482ad4ad30da5eaba47872ee ]

There are some struct drm_driver fields that are required by drivers since
drm_copy_field() attempts to copy them to user-space via DRM_IOCTL_VERSION.

But it can be possible that a driver has a bug and did not set some of the
fields, which leads to drm_copy_field() attempting to copy a NULL pointer:

[ +10.395966] Unable to handle kernel access to user memory outside uaccess routines at virtual address 0000000000000000
[  +0.010955] Mem abort info:
[  +0.002835]   ESR = 0x0000000096000004
[  +0.003872]   EC = 0x25: DABT (current EL), IL = 32 bits
[  +0.005395]   SET = 0, FnV = 0
[  +0.003113]   EA = 0, S1PTW = 0
[  +0.003182]   FSC = 0x04: level 0 translation fault
[  +0.004964] Data abort info:
[  +0.002919]   ISV = 0, ISS = 0x00000004
[  +0.003886]   CM = 0, WnR = 0
[  +0.003040] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000115dad000
[  +0.006536] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[  +0.006925] Internal error: Oops: 96000004 [#1] SMP
...
[  +0.011113] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  +0.007061] pc : __pi_strlen+0x14/0x150
[  +0.003895] lr : drm_copy_field+0x30/0x1a4
[  +0.004156] sp : ffff8000094b3a50
[  +0.003355] x29: ffff8000094b3a50 x28: ffff8000094b3b70 x27: 0000000000000040
[  +0.007242] x26: ffff443743c2ba00 x25: 0000000000000000 x24: 0000000000000040
[  +0.007243] x23: ffff443743c2ba00 x22: ffff8000094b3b70 x21: 0000000000000000
[  +0.007241] x20: 0000000000000000 x19: ffff8000094b3b90 x18: 0000000000000000
[  +0.007241] x17: 0000000000000000 x16: 0000000000000000 x15: 0000aaab14b9af40
[  +0.007241] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[  +0.007239] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffa524ad67d4d8
[  +0.007242] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : 6c6e6263606e7141
[  +0.007239] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[  +0.007241] x2 : 0000000000000000 x1 : ffff8000094b3b90 x0 : 0000000000000000
[  +0.007240] Call trace:
[  +0.002475]  __pi_strlen+0x14/0x150
[  +0.003537]  drm_version+0x84/0xac
[  +0.003448]  drm_ioctl_kernel+0xa8/0x16c
[  +0.003975]  drm_ioctl+0x270/0x580
[  +0.003448]  __arm64_sys_ioctl+0xb8/0xfc
[  +0.003978]  invoke_syscall+0x78/0x100
[  +0.003799]  el0_svc_common.constprop.0+0x4c/0xf4
[  +0.004767]  do_el0_svc+0x38/0x4c
[  +0.003357]  el0_svc+0x34/0x100
[  +0.003185]  el0t_64_sync_handler+0x11c/0x150
[  +0.004418]  el0t_64_sync+0x190/0x194
[  +0.003716] Code: 92402c04 b200c3e8 f13fc09f 5400088c (a9400c02)
[  +0.006180] ---[ end trace 0000000000000000 ]---

Reported-by: Peter Robinson <pbrobinson@gmail.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220705100215.572498-3-javierm@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index e1b9a03e619c..ca2a6e6101dc 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -474,6 +474,12 @@ static int drm_copy_field(char __user *buf, size_t *buf_len, const char *value)
 {
 	size_t len;
 
+	/* don't attempt to copy a NULL pointer */
+	if (WARN_ONCE(!value, "BUG: the value to copy was not set!")) {
+		*buf_len = 0;
+		return 0;
+	}
+
 	/* don't overflow userbuf */
 	len = strlen(value);
 	if (len > *buf_len)
-- 
2.35.1

