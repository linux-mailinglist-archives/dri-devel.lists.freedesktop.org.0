Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C12AB9D103
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 03:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D62810E265;
	Thu, 25 Sep 2025 01:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSuM9z6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D395010E265
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 01:51:19 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2697051902fso1182915ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 18:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758765079; x=1759369879; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wylch9loNlrlm/gdqX++SpQPAdfvuaHRHNeZw5G58hI=;
 b=PSuM9z6EA2TQ14RKKIVNohab3RCE6cAwDDlD/jE0BPp+EjbGQXKLf+pLGR3TFckA2t
 8N4k4wBzorD1gl2ABwyOXIAyQzp9QYBgujjMZE55Te3bVPzCjeJFOgpiLziS9vMqxM2s
 sXgQM37tp0dQUKJBT+ZzYXkWESeBCYDAM+xnsCWCTbZ/OnO0W7tZxwRTaIAUiTJy5qgC
 pI8w+cTA3+EwzewDqSFG4Vivj7BrIPGO1SveI0t/5qSytOU2xwKJTn/fldyEG5IiSduT
 AdwL/23vcP/xAXqelkt/1cVkN9BpzvjvV9EHF2yINAmffB6ef03sgi8ncfzgHrnqFGc8
 309w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758765079; x=1759369879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wylch9loNlrlm/gdqX++SpQPAdfvuaHRHNeZw5G58hI=;
 b=ZmL/MMIhT/87iesyzN8K5IemkKOyi81ls94ITAwTz6qLvRPorNmjusv4pRGEeHnAbm
 ErmQ8iwPVWYAQ1szhh/RVOAPMEcyv3/8bx+Vr70gmSpRx9XN0e1zzQmyVlyRRqE+/hgP
 rlgHeN8wW4uJTlb8aoX91CKztGZmRQI/oMUdzXbLqPsdiDNxIgikeu1KPD8vi/UJphfi
 Zi9VcA9UP0lCmli9LXk+unR3FTvxFEnWrrAa0uZKZ5snQFYKxw/42e7NK/iJxnR3Kgga
 MH7WfzvPss7DMuAAjusvsIbOACYXOGzEoQjr4EKkSRLEGwlH0KH7yfhDQTerfz6I/bqd
 tr8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzh8rzRcdrrl0GTC7B3lvh+3+ORCg6HU4crRHgE7VlPVigxFxCOOOG1P8DyOPXXzp6M0eBWC8tdZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmGWt0JGgen6BWmPQbU59MnIO5vWXd9j8hTwkMDqnBYPrdaVod
 b9/9R7aXQzbiSx4xGk5adftZmJwfUcyEvDRVl+ApLfIA6M4msjOvLzM9
X-Gm-Gg: ASbGncuq2uOwULV9YQDvUNmp2YEv3/J+Ari9KEV6pYKqjPEu7xdvDVscCImJlgPL15A
 DVbUXV1WU9IT0bzFX6GrHZiw3CAt7H01U/hY3UUBJ3BLJrWRBq78gXCQGm4WxgO9MSJ1ynvCzwU
 +Qv97EU8pSiV26zCASgp+6oBw20KwwbkIw5VvTQ8V54KgPS63YZEIvIhWLcoCAhFu4ZwQ+iY8x4
 B5HSm53b5n8RwvESAZ/LtTf35ov3Ax5UhLlTTKxZuI/D8Bi0qg4hJkMSOhKi9fL88m7Miyjnbmc
 ot2kL1ukf7eYBM7eBpKYzIWFyuYeDt1V50LIkDWKGGEajkY/quHx27PcR74ZEKreB/izP6LNuJo
 HVR2EIdFQDr1Cnsd5Cz+rU8ivkM0hfL09vgfW
X-Google-Smtp-Source: AGHT+IHZMt3s05k7yF2B8bpN39GlF03OcYjt5vMVEDXyJVmJ8V3q7J99e2MFEqR2RprtgIinmW0n+w==
X-Received: by 2002:a17:902:dacb:b0:277:c230:bfb4 with SMTP id
 d9443c01a7336-27ed49d5fe1mr11369745ad.3.1758765079211; 
 Wed, 24 Sep 2025 18:51:19 -0700 (PDT)
Received: from rock-5b.. ([27.17.240.77]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6adaf31sm6514825ad.145.2025.09.24.18.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 18:51:18 -0700 (PDT)
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
Date: Thu, 25 Sep 2025 09:51:12 +0800
Message-ID: <20250925015112.19499-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <zopgbudg67lygconkv3bl43xogzl6rncif7wdpclbyc4wblan2@n7v75dbnaqqd>
References: <zopgbudg67lygconkv3bl43xogzl6rncif7wdpclbyc4wblan2@n7v75dbnaqqd>
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

On 2025-09-24 20:17 UTC, Dmitry Baryshkov wrote:
>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>> and runs hw_params. This commit will add hw_params callback function
>> same as drm_connector_hdmi_audio_prepare, so that hdmi-codec driver can
>> work with userspace alsa.
>
>I think something is wrong here. The prepare callback also should be
>called. Is it that the prepare callback is called too late?

I have added debug log to hdmi_codec_hw_params() and hdmi_codec_prepare(),
but only logs from hdmi_codec_hw_params() are printed without this patch.
After applying this patch, hdmi_codec_prepare() is called after
hdmi_codec_hw_params():

[   14.218445] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   14.223004] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
[   14.534614] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a660_gmu.bin from new location
[   14.535750] [drm] Loaded GMU firmware v3.1.10
[   15.727443] rfkill: input handler disabled
[   42.647157] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   42.656774] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started

Best regards,
Jianfeng
