Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0359F569B92
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 09:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286F710FC8D;
	Thu,  7 Jul 2022 07:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Wed, 06 Jul 2022 20:09:04 UTC
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0915E11BF19
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 20:09:03 +0000 (UTC)
Received: (wp-smtpd smtp.tlen.pl 19338 invoked from network);
 6 Jul 2022 22:02:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
 t=1657137740; bh=/S//IAWVRTbBPPNIHjPWh5PsIkJnvKQ93EBXncvo+ss=;
 h=From:To:Cc:Subject;
 b=jYN/rGwwnfPbTq9wy+40wbPLVoq6ZBRLrtb1nxN5pLMzk5x8EGxQbl5DtjHfS4wkK
 N4WYuQK8PeX5IDE/limNYstVfuEcmZSwTf8ZxHahhhIHxh1bbWGRyR+kBx+WNDd+Io
 APIBanZVIdh1VXKmxMcLRAw7tBT9d4rE4TZfM9rA=
Received: from aafi210.neoplus.adsl.tpnet.pl (HELO localhost.localdomain)
 (mat.jonczyk@o2.pl@[83.4.138.210])
 (envelope-sender <mat.jonczyk@o2.pl>)
 by smtp.tlen.pl (WP-SMTPD) with SMTP
 for <amd-gfx@lists.freedesktop.org>; 6 Jul 2022 22:02:20 +0200
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: avoid bogus "vram limit (0) must be a power of 2"
 warning
Date: Wed,  6 Jul 2022 22:01:44 +0200
Message-Id: <20220706200144.68851-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: e277a5e13a496bf62bb0d4eefa7f83b2
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [cfO0]                               
X-Mailman-Approved-At: Thu, 07 Jul 2022 07:29:50 +0000
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
Cc: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was getting the following message on boot on Linux 5.19-rc5:
        radeon 0000:01:05.0: vram limit (0) must be a power of 2
(I didn't use any radeon.vramlimit commandline parameter).

This is caused by
commit 8c2d34eb53b9 ("drm/radeon: use kernel is_power_of_2 rather than local version")
which removed radeon_check_pot_argument() and converted its users to
is_power_of_2(). The two functions differ in its handling of 0, which is
the default value of radeon_vram_limit: radeon_check_pot_argument()
"incorrectly" considered it a power of 2, while is_power_of_2() does not.

An appropriate conditional silences the warning message.

It is not necessary to add a similar test to other callers of
is_power_of_2() in radeon_device.c. The matching commit in amdgpu:
commit 761175078466 ("drm/amdgpu: use kernel is_power_of_2 rather than local version")
is unaffected by this bug.

Tested on Radeon HD 3200.

Not ccing stable, this is not serious enough.

Fixes: 8c2d34eb53b9 ("drm/radeon: use kernel is_power_of_2 rather than local version")
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Gray <jsg@jsg.id.au>
Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
---
 drivers/gpu/drm/radeon/radeon_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 15692cb241fc..429644d5ddc6 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1113,7 +1113,7 @@ static int radeon_gart_size_auto(enum radeon_family family)
 static void radeon_check_arguments(struct radeon_device *rdev)
 {
 	/* vramlimit must be a power of two */
-	if (!is_power_of_2(radeon_vram_limit)) {
+	if (radeon_vram_limit != 0 && !is_power_of_2(radeon_vram_limit)) {
 		dev_warn(rdev->dev, "vram limit (%d) must be a power of 2\n",
 				radeon_vram_limit);
 		radeon_vram_limit = 0;

base-commit: 88084a3df1672e131ddc1b4e39eeacfd39864acf
-- 
2.25.1

