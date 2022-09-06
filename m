Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899075AEED7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D491610E6DA;
	Tue,  6 Sep 2022 15:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10DE10E6D9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 15:30:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e13so16045183wrm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 08:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=deNM8qIhqEaf1BX3jHfJgbq+ntr7dEybvk2vQtWGvA8=;
 b=hQ2ek4yNVW7yd3MqyzdOpp9dpyjXZQcaP3Ka31WgTs7bJBdonNXKn9nFKFVfCZxIkP
 qwaxe2flVffWR6WHNb5hREtROfAUl2UX9FdyCHFuwXGCrxlBJJYGDIa1zulG11zNHl+w
 JliIq5ET9TIyvOpGqpx51TD0uG7Ib21wVAdwhYCZmCy5Iqp/aCVgvVZrMmX6OM0pukAU
 hSKJTFfk8Gka5a2gWpHQa1AzFjYNuSWBgImwH/LyzOrPDOWiEG9hdheSOGjurtS7/HdI
 5ENk2RmhTXaaL954QfXE/uc/tR9z4iHn4T0c+Qhgio3RCAWy1hvmzL9S821lInjlwyux
 /9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=deNM8qIhqEaf1BX3jHfJgbq+ntr7dEybvk2vQtWGvA8=;
 b=6CPXzSbSdG8l3YRDGEoTiEUVqHltM+d/K8a2wFBtXTHh4qjuT0xph9xpUX751ooPzf
 Bf4gCXqVxfhYGmjB5LeIbosjFZ/Fno/IKJ5iUlxzKoy9nBWn/zkmNdjgwhhttzbr/L06
 NUbYqpkq/3fCli1SeFXk0qcuhk6KJiQ1qEO+vhYEyrkDrrNmY1y9wjKbHHF2DnX/ojFo
 pt8MmWdRyYuIDGM+4CFKdSxd/xLeu84J2bS3+ukf+kScysgZosnZ7E3ncXhj1MBdXE1K
 BoN+VW/wttzky4lodtZDHCaQXZ4yezcIifPbF17lxaSADvnBlgb+0FCzI+bQp3/VfasR
 QeyA==
X-Gm-Message-State: ACgBeo23aTgtjOyQBCQJodFvM1jtjlPAa2Cq4x0Jl5FuBcewiwXhWVk7
 jWbgz7qCYqrFUMgrRmLK67w=
X-Google-Smtp-Source: AA6agR7XgMMod/UzqnVyMp/Du84+AgxUL59KAC6k2gnekD3iXBLrlQFzXfkAgYjmWGxaKnWPSA2U5A==
X-Received: by 2002:a5d:6e8e:0:b0:220:5fa1:d508 with SMTP id
 k14-20020a5d6e8e000000b002205fa1d508mr29501866wrz.337.1662478243202; 
 Tue, 06 Sep 2022 08:30:43 -0700 (PDT)
Received: from Clement-Blade14.outsight.local
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c22d800b003a6125562e1sm14922731wmg.46.2022.09.06.08.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 08:30:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 4/5] drm/panfrost: devfreq: set opp to the recommended one
 to configure regulator
Date: Tue,  6 Sep 2022 17:30:33 +0200
Message-Id: <20220906153034.153321-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906153034.153321-1-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enabling panfrost GPU OPP with dynamic regulator will make OPP
responsible to enable and configure it.

Unfortunatly OPP configure and enable the regulator when an OPP
is asked to be set, which is not the case during
panfrost_devfreq_init().

This leave the regulator unconfigured and if no GPU load is
triggered, no OPP is asked to be set which make the regulator framework
switching it off during regulator_late_cleanup() without
noticing and therefore make the board hang as any access to GPU
memory space make bus locks up.

Call dev_pm_opp_set_opp() with the recommend OPP in
panfrost_devfreq_init() to enable the regulator, this will properly
configure and enable the regulator and will avoid any switch off
by regulator_late_cleanup().

Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 5110cd9b2425..fe5f12f16a63 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -131,6 +131,17 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return PTR_ERR(opp);
 
 	panfrost_devfreq_profile.initial_freq = cur_freq;
+
+	/*
+	 * Set the recommend OPP this will enable and configure the regulator
+	 * if any and will avoid a switch off by regulator_late_cleanup()
+	 */
+	ret = dev_pm_opp_set_opp(dev, opp);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
+		return ret;
+	}
+
 	dev_pm_opp_put(opp);
 
 	/*
-- 
2.34.1

