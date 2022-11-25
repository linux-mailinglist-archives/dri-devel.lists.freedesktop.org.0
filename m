Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B756397E8
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF49F10E16F;
	Sat, 26 Nov 2022 19:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5E210E772
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 17:32:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id f7so7258320edc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 09:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BS344EZ01Swu2ynnOXhwyOBzth0IMIZXcxGTSI686xc=;
 b=XpcMQbiaFOJya7+qzk3tnkNJAE8KKxSFEXhrvtyFqav0cioW2lMSpRfguFb7I1aa4A
 lioHIqrmVRCYOUMFDWf61SAhSWxCIGfwgQfMjs0y6N5bBm9vjb2ts1xUJfKQ8//WATah
 LmIBVB9FqZj3yoLKuSrquIe4J+0V3dbXwcjlumFQLphwRAVsCq6R605AIPJbzLdJrxJ6
 P35u+du2aQakbPkN+M3/6G5t3Of8Hz/K74V3T4/3G75B9m1K8ssYpciBhJsAji53S0K5
 9tOFtdLxxEXfDWS1/UuOv02+0L3ZGjs+EEh/lWKaaxX67keIAIVQKW7iF6GQrF4+gElx
 ZmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BS344EZ01Swu2ynnOXhwyOBzth0IMIZXcxGTSI686xc=;
 b=08GKxIFiPVrci3Gq6xm1SKF50XIGdTRMzLaKOINWGYilOgvexwp5hIyzfuS14Fj26z
 f/75E5Dzir1hHxismJ6cwEqCTT6V2KnyGmyqlj//DRNYwXCB9NmXm5XXaiawILxhZ/sp
 1dplFLmJOUl3eEl9e8rWOZR/21jDzZ/P7clMxR3x3ysqye22dWaXtglq8vuOXMytCPdh
 dtkQIB94VDsG8AIEoRhuwtyXlL6u/Dc2Mj37UjnGIwyWHOPQ6A41wTtPAH4Fk9L7rrq2
 z2ivXu7ZRPi8lPvQ9aieiZO8j/Lqmo/kdDhQj3rUK3JntOMtAUC/wZx4bLuZrzg4nVsj
 EYtA==
X-Gm-Message-State: ANoB5plYQnTy+PuEiFT8DdmMww6fNMHqIag1ElawAfBmwQm96RzqpAus
 9pmptTk8xlZYWUbkc4JazNU=
X-Google-Smtp-Source: AA0mqf4izwakw2gafJPDqWGogXbrDNIRO5y3QcetsRjPQBUysZcYUXpN2rDFH3P7EnbYBJUJ5FfGXw==
X-Received: by 2002:a05:6402:1a28:b0:469:7546:60fe with SMTP id
 be8-20020a0564021a2800b00469754660femr21831195edb.408.1669397519015; 
 Fri, 25 Nov 2022 09:31:59 -0800 (PST)
Received: from [192.168.178.2]
 (dslb-092-072-004-196.092.072.pools.vodafone-ip.de. [92.72.4.196])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a1709066dc900b007ba46867e6asm1823024ejt.16.2022.11.25.09.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 09:31:58 -0800 (PST)
Message-ID: <f5668d69-806a-f8c6-5279-7e84b824bd7a@gmail.com>
Date: Fri, 25 Nov 2022 18:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <affenull2345@gmail.com>
Subject: [PATCH 1/4] drm/mipi-dbi: Support separate I/O regulator
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 26 Nov 2022 19:00:23 +0000
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

The MIPI DBI specification defines separate vdd (panel power) and
vddi (I/O power) supplies. Displays that require different voltages
for the different supplies do exist, so the supplies cannot be
combined into one as they are now. Add a new io_regulator property to
the mipi_dbi_dev struct which can be set by the panel driver along
with the regulator property.

Signed-off-by: Otto Pflüger <affenull2345@gmail.com>
---
  drivers/gpu/drm/drm_mipi_dbi.c | 14 ++++++++++++++
  include/drm/drm_mipi_dbi.h     |  7 ++++++-
  2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index a6ac56580876..047cab93a041 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -427,6 +427,8 @@ void mipi_dbi_pipe_disable(struct 
drm_simple_display_pipe *pipe)

  	if (dbidev->regulator)
  		regulator_disable(dbidev->regulator);
+	if (dbidev->io_regulator)
+		regulator_disable(dbidev->io_regulator);
  }
  EXPORT_SYMBOL(mipi_dbi_pipe_disable);

@@ -652,6 +654,16 @@ static int 
mipi_dbi_poweron_reset_conditional(struct mipi_dbi_dev *dbidev, bool
  		}
  	}

+	if (dbidev->io_regulator) {
+		ret = regulator_enable(dbidev->io_regulator);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "Failed to enable I/O regulator (%d)\n", ret);
+			if (dbidev->regulator)
+				regulator_disable(dbidev->regulator);
+			return ret;
+		}
+	}
+
  	if (cond && mipi_dbi_display_is_on(dbi))
  		return 1;

@@ -661,6 +673,8 @@ static int mipi_dbi_poweron_reset_conditional(struct 
mipi_dbi_dev *dbidev, bool
  		DRM_DEV_ERROR(dev, "Failed to send reset command (%d)\n", ret);
  		if (dbidev->regulator)
  			regulator_disable(dbidev->regulator);
+		if (dbidev->io_regulator)
+			regulator_disable(dbidev->io_regulator);
  		return ret;
  	}

diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 14eaecb1825c..e4efbd8ffc9d 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -122,10 +122,15 @@ struct mipi_dbi_dev {
  	struct backlight_device *backlight;

  	/**
-	 * @regulator: power regulator (optional)
+	 * @regulator: power regulator (Vdd) (optional)
  	 */
  	struct regulator *regulator;

+	/**
+	 * @io_regulator: I/O power regulator (Vddi) (optional)
+	 */
+	struct regulator *io_regulator;
+
  	/**
  	 * @dbi: MIPI DBI interface
  	 */
-- 
2.30.2

