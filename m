Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E23A6397E1
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7E610E169;
	Sat, 26 Nov 2022 19:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0614C10E772
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 17:44:22 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x2so7315580edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 09:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:autocrypt:to:content-language:subject
 :from:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LmTj6KBl4Q3qwIactzR8h7ojaUWUX5o+9sZ1ySt88z0=;
 b=TaJSyGtfFhftQwH8zOLh7ZXLOt8XjoLqOL5D0Y4yoVTLAaBxC1uoqYf9eLaTmSjcU6
 m81SHOxaq41k++R5WAYAYDEPpvCnc8xkB6MDA1MHFHL0z049XlZqjjqwJ8hMfBNTS8Pr
 8Yu1Fy0Wn+xzabUSOVp4CEs6wBTmVJ4N+AogW3Bpb1azDHDOl7Fesf9+zi19cKR8utmG
 sS4WD+GbcMwQpDDd4o8qMkYJLSoS2KLU3YUUYOupM+ZafuJfe3lhpEpuHMM/0c/t71kg
 jEekW0FZCsCYQ53GQYvkKGmDWD1T6xrT56a7r9oGogQQnliEl4QZNDo+3P+f9SKSb1bO
 92fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:autocrypt:to:content-language:subject
 :from:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LmTj6KBl4Q3qwIactzR8h7ojaUWUX5o+9sZ1ySt88z0=;
 b=AtQQQYiUBcHzCYB+RS0JjjC0oPAkiixyZm4XO9ZPENYq7rDBXZIaikNfNF+YQwUq9f
 VZl+zpW7+cdzEeqTm2fslVV8NuStEH5uMAm3QuAc98Pgnj14HqOnFBN4Id7ytmq056CV
 mFozC5STlzFcGm+ERq2E/rXmo2oOLTNM+yeJBxE9+f2nLpTHIHz/fv0QRWndpGfAQbOf
 WO7L60lTud2eXc66rDWIIwYO3iXt1rlO+fYvVn0FiteNETj0QzpgddGYHaMg6b3sDBxI
 Wc85LH5pgLzd3pmhnRM0nwU0jjgEDbjFzScRSCO9EJ83wlbCwOsmuk3VFoIo+JhhrhVE
 sn3Q==
X-Gm-Message-State: ANoB5pnUCuTrgRUhQS58qJU6hO+o6N8iYgbNDV+jhtO+bNetGiYsVp4T
 tfnLxAz8E/Q6ZYtjZott248=
X-Google-Smtp-Source: AA0mqf5n4EPNMQoMcu0KuY79HY0sosyLL9NqQ02KkKq6jyn/vJaWHcAMhqZnI1izwHz1hU7sMUuUAg==
X-Received: by 2002:aa7:c04f:0:b0:45c:f13b:4b96 with SMTP id
 k15-20020aa7c04f000000b0045cf13b4b96mr1770602edo.129.1669398260431; 
 Fri, 25 Nov 2022 09:44:20 -0800 (PST)
Received: from [192.168.178.2]
 (dslb-092-072-004-196.092.072.pools.vodafone-ip.de. [92.72.4.196])
 by smtp.gmail.com with ESMTPSA id
 lb5-20020a170907784500b007b27aefc578sm1769251ejc.126.2022.11.25.09.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 09:44:20 -0800 (PST)
Message-ID: <3d778b47-afc0-8487-1df5-f68601b9a543@gmail.com>
Date: Fri, 25 Nov 2022 18:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <affenull2345@gmail.com>
Subject: [PATCH 2/4] drm/tiny: Read separate I/O regulator from DT
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Autocrypt: addr=affenull2345@gmail.com; keydata=
 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
 Ywm6apB0M8rLLW1wrFnadKziONJM
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

Some platforms have a separate vddi supply for the panel I/O interface
(as defined by the MIPI DBI specification), so one power-supply is not
enough. Introduce a new "io-supply" property to set the vddi regulator.

After getting the regulator specified the device tree, use the new
io_regulator property of the DBI device so that the drm_mipi_dbi driver
can enable it.

Signed-off-by: Otto Pflüger <affenull2345@gmail.com>
---
  drivers/gpu/drm/tiny/panel-mipi-dbi.c | 5 +++++
  1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c 
b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 03a7d569cd56..b09d2a47a409 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -297,6 +297,11 @@ static int panel_mipi_dbi_spi_probe(struct 
spi_device *spi)
  		return dev_err_probe(dev, PTR_ERR(dbidev->regulator),
  				     "Failed to get regulator 'power'\n");

+	dbidev->io_regulator = devm_regulator_get(dev, "io");
+	if (IS_ERR(dbidev->io_regulator))
+		return dev_err_probe(dev, PTR_ERR(dbidev->io_regulator),
+				     "Failed to get regulator 'io'\n");
+
  	dbidev->backlight = devm_of_find_backlight(dev);
  	if (IS_ERR(dbidev->backlight))
  		return dev_err_probe(dev, PTR_ERR(dbidev->backlight), "Failed to get 
backlight\n");
-- 
2.30.2

