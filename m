Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2AA361CCF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87D56EB55;
	Fri, 16 Apr 2021 09:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86A86EB54
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:27:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so1732076wmi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BqRj0LNCA4WBYZmT+NFPaGLh8/3JIeNWN0kNZbU1po=;
 b=p9vuhEWJ72/1jKNusXS3smwfCyriKDrf1mSy+nnr8fQsMoiNn1NKy7ZDKbn7p+wwtc
 Y7ZxsfaoIA7GjjO56ZWve3BjkwgisWOwzngPF/zdmhLZHX4ztcUbItMM/gtSAQzkeJJH
 T2C7TyUqaMAru2a88UqkUjsLOufrmb9e/Cz1fgQYBZygowAB+sMz7sHfdFhAdVksHepW
 Cr3K81jRE25GB4khUmPkhPovAMTJO9uBvP5uadZ4NH9OAdRo/yck6D8WO9EbqxW60MaM
 DpgFZsAwpIKy6+qU/6tHRjiqperbiltfKqbJycwL/cFeG+8NiguT7z+7YtZdQ0j0R+9f
 xlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9BqRj0LNCA4WBYZmT+NFPaGLh8/3JIeNWN0kNZbU1po=;
 b=IiM6v2WFIq5OuqG+MjS3E5E2lgpilV6TrHMRaa3ZdWnx9+wCWvzVCrUNh+4b4qoIp+
 mDL/57Xw1m6mZtzwiLElJMy5rseZHS6dBJ0c2xqXXhvo3urbvNieaNd3u2jfenGYq0Ew
 H252MdrvWtC4JYP/OlH0bfztRXbrsxU3DqWZZyUMrCuvJDM77qoHvAMnwvQx2T9Oa8CM
 sWdFHbd1yQRBoYgmswCV9zrmYm3iFN6R7T9jQq5Mx6XjEIxkCahb0zHcypkRrbSwBn5E
 4WGOjfP7uW0D/4pWkqC/q5y0nbomvW7PPvv92gDpZokVTgJhBzdLRpbbNnJaaezo0joq
 jrjA==
X-Gm-Message-State: AOAM531ecfgxt7dTvSFb1TWpiz/Glm9QPgfLEBkoPUUBm6fd7J28xA1/
 /7IqESRYHNhPzU91uq63N78Jjw==
X-Google-Smtp-Source: ABdhPJwn2tFqclBip9+el1SG+TFDi6VD+1YJ7fmLPq4JrBkmfmzo8sBE62ixZffYLJeBE0UMs5auUA==
X-Received: by 2002:a7b:c7c9:: with SMTP id z9mr7270490wmk.50.1618565262461;
 Fri, 16 Apr 2021 02:27:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id
 h8sm8805156wrt.94.2021.04.16.02.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 02:27:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jonas@kwiboo.se, jernej.skrabec@siol.net, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/2] drm/bridge/synopsys: dw-hdmi: Add an option to suppress
 loading CEC driver
Date: Fri, 16 Apr 2021 11:27:36 +0200
Message-Id: <20210416092737.1971876-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416092737.1971876-1-narmstrong@baylibre.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=Y2Kp96dW3X0U27vNrMM/XkOOWYrIUuOu1Mi+zc7UuTs=;
 m=8YzxMzRM2R/oOFCOZbnFjWww/0CRXwSKJOS10A7bahU=;
 p=In2Hgqc+nqwSrOrGnpYjxqY39B1rnskpZvUG56iaipo=;
 g=1623597293b4caa25ab43c3fbd39773cfca1dd42
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB5WDgACgkQd9zb2sjISdF0zxAAsPF
 S9X840FovT4celkzqEHde6wQVRpNvUWE4KfpsyuthouG4Ogh7m+mtKyMmMmQER6NI98m6UNn3Xbw5
 Qx99KHfaJJIDzeVKrURJGlExHSEpMuPeHdJ0RAe7bLK9WQEQPtzxAOjV6Fv1laxc0C3c0dOfy8vr4
 JZX5oSKvz9oZ6X4ORBzl2Ighs0m1oNE6+fVDA/Go3PF9hK75cBWYIkms1I+K8tbvzEzZ/qZHYkJMM
 7MdZj+Z8QXTj3HtlH0D3/Ir+WsE8g6vWtPbpiCYZQN20Qba8AIbNzlVgl5W4Bp9Ui+L/fbej+SOpF
 aEBcnw6wNLiKHAL3TxQDO8vkBR+JtaUespcIgE+/lqPeRJ7hsAfbsopzmkOz7kY6HCLvbAKtSlZbZ
 DhO86B1AKA7zjpTtuW+LijHIpzcK4kY7MRwuh+pFxFjOUv35K25z56vjnxJmLjo6zKyuhDR6WiFAY
 gscXpmhObHHjk36uTWeTJr87NINY7CH0pBu9ZFSzSp01gkLMx4phDLjm0+JayYtEWb3C4TQ7JEMT6
 83Pdk0v0cAmx9Zef/LH5+R5kpZDsDpIJ7MeGQOrHUqbzKJF7K9EFKhDwaxXbSJKhCaEp+AKawxo1e
 xNymIxJyVDqU92s+pABPeTAYzotm3k9rcTGAjvOMAJe4zZlBjgZxL2N8piBFhgP8=
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jernej Skrabec <jernej.skrabec@siol.net>

This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.

On some SoCs, the CEC functionality is enabled in the IP config bits, but the
CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
confusion when the DW-HDMI CEC controller can't communicate on the bus.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
 include/drm/bridge/dw_hdmi.h              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index dda4fa9a1a08..ae97513ef886 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3421,7 +3421,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->audio = platform_device_register_full(&pdevinfo);
 	}
 
-	if (config0 & HDMI_CONFIG0_CEC) {
+	if (!plat_data->disable_cec && (config0 & HDMI_CONFIG0_CEC)) {
 		cec.hdmi = hdmi;
 		cec.ops = &dw_hdmi_cec_ops;
 		cec.irq = irq;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index ea34ca146b82..6a5716655619 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -153,6 +153,8 @@ struct dw_hdmi_plat_data {
 	const struct dw_hdmi_phy_config *phy_config;
 	int (*configure_phy)(struct dw_hdmi *hdmi, void *data,
 			     unsigned long mpixelclock);
+
+	unsigned int disable_cec : 1;
 };
 
 struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
