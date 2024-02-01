Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC20846351
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 23:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F390410EBE8;
	Thu,  1 Feb 2024 22:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="haxmBHVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3403310EBE8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 22:17:45 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-55790581457so2127140a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Feb 2024 14:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706825863; x=1707430663; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H5FxhcLv5qt61Bot8nd609pAKj24jXJR+vudDR0/c4M=;
 b=haxmBHVbAoIWpZ/hC48oQRcAtJzB6pt5p75Ef7wUts0DRYN8tNplLm6x7gu4Cu/dkw
 YnvSL6+KfeMYHBqV3IK2kg1NMGrP7Iz7mnu+OKOhOjuWoWfpJbhbs18Mq1jiye7et5zy
 xolSFXf+V83UvP8lHy0KhPq2g5wg7O4tZzITEHl2uh9YqFT7aKwFmUeWCDh0WF/QqMJi
 HbcOR4xgsDmGGAGb3/pxRWINzk7Ss1ZEvxQxae+7EUwjAbRLxnC2kgQd9Tp2nMyajc2t
 WDsyRZYqPXWsfVdjZhXIp/j1J28ZL//oKwwmDbt/g6DNskQLihNiUTh8HEGsmpcQsNa8
 v5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706825863; x=1707430663;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H5FxhcLv5qt61Bot8nd609pAKj24jXJR+vudDR0/c4M=;
 b=f42T38r4pc70SKzc114gdsgLgiJrstjG3NfQLIyKAEeaWJZZpubuUQNLgqkSF6AVeI
 zrzrtxFYTVLJulPTOZwQCjMdTnksVYTHUXzWvFJIPV8mDQ/bqxr8QB373Cktpu/HT4h+
 gXiwQ+FjMlXzKFkdXOEcIxALGb/CH0ZuxHRwPuP7FbW3q1QGUPks1OPDI9Y5ZmPLMAwt
 oxHvrVYwbKxsEZmqwj9tx+1mdqA60Zywc6AOlKkKB1bMOchFufLoeT+azyugc3/6DE2F
 1aBApiDM2VPwWre4iKLSA863UL9Pk6zVgFst3CBtapgFj1a/KGKGWVVn5dJdORmiYKJZ
 rjvw==
X-Gm-Message-State: AOJu0Yy6NaYnRJolDaV0t7SKDheLJneDb+YmtS1+7QIJ5uAdd0N7Orar
 SncIG+Q6D8UBQ5ZkHEvL52W2oupOkGgmIGq5dTe4F0bV8zGWLVzqYnvobxe7ZMI=
X-Google-Smtp-Source: AGHT+IFJ6EHmx0YJ2thZJU4PB6f8gtc5YBURP5MbpmvfA9IxhlEOjKueAP4bvunCOE9xVHZHKrwLZQ==
X-Received: by 2002:aa7:c690:0:b0:55f:b217:4215 with SMTP id
 n16-20020aa7c690000000b0055fb2174215mr91663edq.0.1706825863515; 
 Thu, 01 Feb 2024 14:17:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW1UUR612wXs4/EqcaQQs1drV3Gqekft5m9dM2k6X0PdnjWzRtS0Gwcpt+vYTDu09ug5prp+Ur9E3Rxusj8lTXR+CHyCc1dICjiApnVJrr2ozLp0587KhEGB9ve+7SJ+n+gKWYVDCdB+cGzcYbYrf1e0d6hjF3n0iwMTgpQIjD5Oyi4GIlBB7dcifB1rjgO3j/aMwlE2iAhjHTjZhmrSuXuYChrcnwe7tqBvaOHzSjPne+eHpgXR+grx7RWQWJD0qNhEW6ozJMA51RaEnk65zE9P++Dxg8qbAQXfgPydjhlbQnfaiNgcZU/MngFtyo5xoNc/vvEhctUao8XHR2LdJJmm5aWB/RVLRrhFMOpPgCh0/xvs8yr4vklVUSmF4NyQlTvFQoMcsvMX4+P3tnACh1lS4ScGImPdvt0eypLbQBE
Received: from [10.167.154.1]
 (178235179129.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.129])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a056402124f00b0055f0de1166csm225297edw.26.2024.02.01.14.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 14:17:43 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 01 Feb 2024 23:17:40 +0100
Subject: [PATCH] drm/panel: novatek-nt36523: Set prepare_prev_first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240201-topic-3623_fix-v1-1-86ee6f20876e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIMYvGUC/x2NUQqDMBAFryL77UISUzVepRSJcdUFiZK0Ioh3d
 +nnDG94F2RKTBm64oJEB2feooAuCwiLjzMhj8JglLHKKI3fbeeAVW2qfuITnXat1Y5eZBuQaPC
 ZcEg+hkWy+FtXkXsi2f5f3p/7fgDqclg7dQAAAA==
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706825861; l=1022;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iZHKh2zliymJZpYaEKcxSCcIowDn/Ybs7gN4/3MkGSE=;
 b=w1RN+2cCKHYNfNmB1ZoJSveJxUYPydExEMBIZ3s/hSAJ+vyUBX0r2tASV9T13V9iiLdwNRex1
 Uwx+TC31FpyCgZKEFIajVnXkYfpYjQozMOmMv6cKrTN1+6K+HE/mTmk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

The .prepare callback contains the init sequence, so the DSI host *must*
be enabled at that point. Set the prepare_prev_first flag to ensure that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index a189ce236328..32cae1bc9162 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -1270,6 +1270,8 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
+	pinfo->panel.prepare_prev_first = true;
+
 	if (pinfo->desc->has_dcs_backlight) {
 		pinfo->panel.backlight = nt36523_create_backlight(dsi);
 		if (IS_ERR(pinfo->panel.backlight))

---
base-commit: 51b70ff55ed88edd19b080a524063446bcc34b62
change-id: 20240201-topic-3623_fix-9198419e5e47

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

