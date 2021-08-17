Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3247E3EF035
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 18:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0C089CAA;
	Tue, 17 Aug 2021 16:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331D189CAA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 16:32:07 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E86DD3F10B; 
 Tue, 17 Aug 2021 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629217925;
 bh=GQiZ4NCYIdMlQCu6k9AbZJfoOt7wFTTTHg5Ly6rcD3c=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=DbFta4S9x0rtecgklYwYCzYbjr/LcPVip9RUs/PJC/PaTEdO7zuD5UoP314D/4PX/
 w+GVEdaNmI8+s9xw/3LpmhEooNg+f5HtGO5S2cpLj7aNondxMC5LBD8XmNFwpo6fNz
 /aZoHmzdpDAvUmij69QuaNEo8S06k0fmqjSo3u7vluqV7/t6lLWPSdeZhuuAsu2bFj
 evfN36Pkh88s3ZBfDX49wpzI5u+aWcQ70AomNvj8Oipp1bC5fj3/ucH3TwLubZOnW/
 uFYBlyxr2U9hJNouKAJRtEuYgxAWOB/N7EAVrNd6vKClP8GzKtnc3jVi2lHZahQ67z
 vgpmiqWLX4hpA==
From: Colin King <colin.king@canonical.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/mgag200: Fix uninitialized variable delta
Date: Tue, 17 Aug 2021 17:32:04 +0100
Message-Id: <20210817163204.494166-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

The variable delta is not initialized and this will cause unexpected
behaviour with the comparison of tmpdelta < delta. Fix this by setting
it to 0xffffffff. This matches the behaviour as in the similar function
mgag200_pixpll_compute_g200se_04.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 2545ac960364 ("drm/mgag200: Abstract pixel PLL via struct mgag200_pll")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/mgag200/mgag200_pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_pll.c b/drivers/gpu/drm/mgag200/mgag200_pll.c
index 7c903cf19c0d..18f1a6dd019a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_pll.c
+++ b/drivers/gpu/drm/mgag200/mgag200_pll.c
@@ -125,6 +125,7 @@ static int mgag200_pixpll_compute_g200se_00(struct mgag200_pll *pixpll, long clo
 
 	m = n = p = s = 0;
 	permitteddelta = clock * 5 / 1000;
+	delta = 0xffffffff;
 
 	for (testp = 8; testp > 0; testp /= 2) {
 		if (clock * testp > vcomax)
-- 
2.32.0

