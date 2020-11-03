Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9182A3870
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 02:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A5E6E14F;
	Tue,  3 Nov 2020 01:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA026E14F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 01:19:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0F7B223C7;
 Tue,  3 Nov 2020 01:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604366360;
 bh=oXlw0sds8OBpAbuRT1r3BD4nyWUh0fJiKDc4ixL3VTo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fPKzYLcGgAlwAdX3OKFECL+HF8AbnU/3HpG4gm2VTdd6vLlI+3ElWc6uClaoYYD37
 LRTJ66obn8K14vOjZdWFStluMT0t+BZ3lsYjH6uhqz9dAITqPuLwmXgk45gD4258ul
 01+8fz/8gp7DDw3unIxAfLsLwElgkytNCU8Gp+xs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 30/35] drm/vc4: drv: Add error handding for bind
Date: Mon,  2 Nov 2020 20:18:35 -0500
Message-Id: <20201103011840.182814-30-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103011840.182814-1-sashal@kernel.org>
References: <20201103011840.182814-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hoegeun Kwon <hoegeun.kwon@samsung.com>

[ Upstream commit 9ce0af3e9573fb84c4c807183d13ea2a68271e4b ]

There is a problem that if vc4_drm bind fails, a memory leak occurs on
the drm_property_create side. Add error handding for drm_mode_config.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20201027041442.30352-2-hoegeun.kwon@samsung.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 38343d2fb4fb4..f6995e7f6eb6e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -310,6 +310,7 @@ static int vc4_drm_bind(struct device *dev)
 	component_unbind_all(dev, drm);
 gem_destroy:
 	vc4_gem_destroy(drm);
+	drm_mode_config_cleanup(drm);
 	vc4_bo_cache_destroy(drm);
 dev_put:
 	drm_dev_put(drm);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
