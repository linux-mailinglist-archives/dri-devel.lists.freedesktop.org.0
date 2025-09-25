Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D805B9D409
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 04:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F93C10E825;
	Thu, 25 Sep 2025 02:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g6NTesBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4D10E825
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:57:35 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-27eda3a38ceso209435ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758769055; x=1759373855; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jO/X08ImXnlJLtZODeURBgewU5TmbSWs4cNn87Dfvnw=;
 b=g6NTesBRrDrUmsVXjJIqumvMulSNSvzq9tMIAOX4k204oHkmStL3cFAwCaAds3UNro
 pHxzu1jtHaWOYJRUK2FyB5L59byPtr8aAzG6Ri7w3DkTn0zksa5IIQMC6d9eItM4DH9d
 CiZgGAUAsQgYmE9ZJbL9LZNik1YL7DcFS+Wn3UfFq0g5Dh+8rqNVdIQqqBUf0Zpbqiwf
 6jd0m+pRzTzKZoGmFApln0L6nxkdk6Xm2nqHW9gE8K/L5dBUB+YonM8CVjLKAMYY9wT8
 t+4IfDUbJcZXsCXTnf/I/0hICOz89L3m6oPvdGPq/hTd1vMW7bQxyuhpiFkFma8DAFiD
 elhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758769055; x=1759373855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jO/X08ImXnlJLtZODeURBgewU5TmbSWs4cNn87Dfvnw=;
 b=IFOlJhyIZFLkpXPnFs9hsZ7388LDViQZDviEX1l6FqXnEv/ep/x3P3Prqugzf6D5f9
 5iauzzRwEv1cMTuaBu4x35sqUcs6ctl0ABKzWpUtmPZ3bM82Zd4sawwCuFG7Uh006Zsb
 B6Z2SVnxQTy5AIfVrfvprwmWjljCWqQ7o/yw07CU2GdlLzdA5pWFJ5nsIAqhpWam4vco
 +tt5bxFG549c1a9laAn6LYVpgHLoyd0qyNQDXbc51AQesBQDpmHFTrVezL5fqJ4xC5Eh
 up5PnJZBduXKpDn+8mwXsE1+XsEgvRG6qtsPEmLdHbX7RSmSkRz8f4Vj84hDib3AR1sF
 meLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcDMJbhxQBzF8P30MXKWZZuarzhj2d91HGLD1lZ83CzGkVNmtqGGW9vEIAyqS0YMiO/xzg3frmhh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtmeSSkPF6wgKuixM2BUsnfDIs9ySXGymLEl9lKn3Y1jpGA0Jr
 KzdmNWlvoRAikb0QtpeMCLXQoHLmoHrBcvTa9L/95lqN4ymnxlfaXRgt
X-Gm-Gg: ASbGncspy9/GaqQgxJuEvwP7l0DRPpCmCOzjS3RkLs8nOPBec7OE1j90hVC1lNd1GHJ
 rvrjoAyDgLPr8czGtXx9vhCnDWjGRJHeEfbcWiG+NHbHhqP4dtbTZ1aolZZGlWN8iKWrJAFfIHR
 8lyAFCJaKn1TN96UNmEwA632d6Cgj/6lObFaBkM/vPbMZj08pFytNveCyAqhT9nLueQR7aCQsof
 vMvBjIWrsca7t3GN5xubDmFDQmcki1jg/aW5gmTuAd0+d9w4uALDDfjKEFX+72kxqul9P3RHJmb
 zwBQ10Qn3JDOrOckeHp5dzpI3/RvjubKJIQrh6RiG3tbSRjKhdjbFE9w6uyEOwTx/dmP26cBrx+
 6IyUXaiNQUpMYM8LTqdNZf/w=
X-Google-Smtp-Source: AGHT+IGhAyjSgkqQcjQzf9J9hcNvGanR1Lw4+TA+GtCM6Eqw/j9sgyv1kMSgHwLk1Yp+OR0ToC7EWw==
X-Received: by 2002:a17:903:1d1:b0:27d:6f24:ceb9 with SMTP id
 d9443c01a7336-27ed4a16b79mr12216545ad.3.1758769055210; 
 Wed, 24 Sep 2025 19:57:35 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ad15e6sm7402485ad.143.2025.09.24.19.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 19:57:34 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: airlied@gmail.com, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 liujianfeng1994@gmail.com, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 quic_abhinavk@quicinc.com, simona@ffwll.ch, sophon@radxa.com,
 tzimmermann@suse.de
Subject: Re: [PATCH] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Date: Thu, 25 Sep 2025 10:57:14 +0800
Message-ID: <20250925025714.20121-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6mq5morx4kuwmxa3dhpxf42uqedtveectlbeodl5oj74rqk4gy@oweda3unauqj>
References: <6mq5morx4kuwmxa3dhpxf42uqedtveectlbeodl5oj74rqk4gy@oweda3unauqj>
MIME-Version: 1.0
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

Hi,

On 2025-09-25  2:18 UTC, Dmitry Baryshkov wrote:
>When does q6apm_lpass_dai_prepare() happen?

q6apm_lpass_dai_prepare() happens both before and after hw_params/prepare
of hdmi-codec:

[   14.055198] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.067225] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.089925] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.105988] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   14.106027] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.122707] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
[   14.132017] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.197843] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.633992] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a660_gmu.bin from new location
[   14.635452] [drm] Loaded GMU firmware v3.1.10
[   15.929293] rfkill: input handler disabled
[   19.406507] qcom-soundwire 3210000.soundwire: qcom_swrm_irq_handler: SWR Port collision detected
[   19.415672] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.465864] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.581446] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.693965] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   19.694012] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.706621] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
[   19.722543] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.775071] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started

Best regards,
Jianfeng
