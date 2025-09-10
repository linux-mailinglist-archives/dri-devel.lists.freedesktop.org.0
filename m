Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E8B51E00
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D7110E976;
	Wed, 10 Sep 2025 16:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="Ao6jSOZv";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="eAs3umGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB2E10E971
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757522447; bh=uxOG//dCZ2ttzLEjwimxxM920Akc8lBjHA5Df1qVSH8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ao6jSOZvI4eYuQhAOVYudo5ZVZuzLaStBHo2Udj7o7eGNc7PBmg1jKa6kSzCrYqDz
 42GVDaCDQ9IMJDkBgxiQlHVCor229SJgy2OZHuiKw2fVWqmFifwhCxJ9mmC0VKc+Zv
 yDXxLAQyQegpQdklwjazj0JTWRwoq4q9Uy6jwURJuIc3470W52DlWZJrmk4Wma0hEB
 Gpb9pm1I9lElrKc16+DlkeWIJDIuD3jOzYhJW6C2iwCMkOLYjJv8M5aMFBguAz90WY
 qHDMRNurLtUOL4JiJdChXEfngEHdBE2FLh/P7BjYZWcSO8Wo8LsFUZ/FYM7hhlQfIm
 cYikzrrzv43Bw==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 31875FB02;
 Wed, 10 Sep 2025 18:40:47 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYp5uqBiyFwJ; Wed, 10 Sep 2025 18:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757522442; bh=uxOG//dCZ2ttzLEjwimxxM920Akc8lBjHA5Df1qVSH8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eAs3umGNOboYL8sw290wkCngWZgmKLIlSikZ7fdjKzeLkcrEZeVyctIx6oEgTj0+Y
 N/FcnHjrZQX71XWIiVB5NgDtvnNzLVMxklsIDyyZesAG3kjkwCKyyQ+5DfFVed3VzJ
 qnic2AMNSQkz5crpYNQsVEqhDmF2Sml54fGbwnn+F8ZHLaxj9rCU6WlgxZJM5yCm59
 iFn6tijMphlqnUHJaSBT839sevKjNCHkotXew7vldCsQs7r7rxKVrGQ3oQbpUC5Unq
 9seq2jMU2VHFjaSQqFfes9wEWYlL9Ke3lGNYmgUD2M5KIYgNHi7dwaSMVcoCkQC4W3
 oVnto6lc6sZyw==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Wed, 10 Sep 2025 18:39:56 +0200
Subject: [PATCH v3 1/3] drm/panel: visionox-rm69299: Fix clock frequency
 for SHIFT6mq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250910-shift6mq-panel-v3-1-a7729911afb9@sigxcpu.org>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
In-Reply-To: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=uxOG//dCZ2ttzLEjwimxxM920Akc8lBjHA5Df1qVSH8=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm93YW41RU5obEFMWEFIbDdHNFVnL3JxbEhFdTNXCnUyaEZFNUkyUlZGUEhqVmJl
 MHlKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYU1HcCtRQUt
 DUkFsdjRaU1N2ekI0K05wRUFDQmh3ZkMzVzdjYm9HeU5zemJUWFlFNUk3Zk5jZHY4cXQwYjJQUQ
 p6eTk0U1JBNFh0OFJiNXE1MlJQVVdZelI0NzVtTnFEYTNJZk5lUGZaaTc5OFJFK2t0Y0lzdVpsV
 UR3TmlaZ0hXCmtaakliRVB6SVR0NEdFMC9ZKzEyeFE1eHV5Y1Z3Y2hCeWtkVDEyc1NKQmxJWXdV
 bndYRDFTODc5cnZRSjFOT28KVW5pVW41dTZ4NjRtRk8wTkpCMEloTXNvVjlIbkVBOUxqeDg2UXl
 sUXJQQ25ZUkhPOW9kYzZhWlYvVlVzRVNDegpvZ2VRaVdhclRnRmh0NVdkYzVXZ0twekNOYTdvN2
 puem9sbzVtc2R0VGNWbmlhb2d4dzNPcVgvUmNJY3RsTjE1ClNLNEM1NElVN0ZFSkdpa3hPN2UrK
 0FuTFRnVnFUZkFCMnp2elhVSlA2Qkx0SkpjcUgwV0pLd2ZJOHE4RW0raFAKVkFiUUk4ak9najJm
 a3dSSjVCZDNkS2ZZWkdRcXMrVjZjd0wySS9mQUF2MS9kOGpEZ1dPVGFQeVFWbGRpckJYdAp1dUU
 yVm9la1k2YlpNV2wxSlhhNnNXR2E3TnNrSmFnNmYxODhnSHRPcnd1Wk9rRmVFSUJKUTBoZ2NkLz
 FRV0JmCnVjQmNhcEdBL29MR084dWI0TytWTGtjVXNlL25aLzVZK2JRcjdoNUFCY2x1N05Sd3ljS
 TZOSnVKcGZlS1M1U00KVDUvL3RyRTI4TisxRTVITTZVVW41ejNNZGllV2E5UXIrbVhlSkE2U3pH
 M1JvQ2tJMlErZTNrNlZPNnlhbmRTRgpLdnlOdFJQU2dabGQ2NmgvcVpvTktQTndwUTBHNXNYQjY
 4QzBVMEIyRDJNUHJrNnNVODBCUUk5bUhGWC9TTDRzClRmb1FIQT09Cj00SEVnCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3
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

Make the clock frequency match what the sdm845 downstream kernel
uses. Otherwise the panel stays black.

Fixes: 783334f366b18 ("drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq")
Signed-off-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index 909c280eab1fb408a713d84051a1afbb252c45e8..5491d601681cff52eca1d72ad4489731d2276c30 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -247,7 +247,7 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
 };
 
 static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
-	.clock = 158695,
+	.clock = (2160 + 8 + 4 + 4) * (1080 + 26 + 2 + 36) * 60 / 1000,
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 26,
 	.hsync_end = 1080 + 26 + 2,

-- 
2.51.0

