Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9DE8B0F40
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815FF10E7BC;
	Wed, 24 Apr 2024 15:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mAyUWXGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E9310E7BC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:59:01 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-56e477db7fbso11370551a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 08:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713974340; x=1714579140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FJ64wT6PzFAn8qjBgPSgjNXp6jZV103lzTHcm0eFcDM=;
 b=mAyUWXGhPAGMXXOcH+H6dTCdpibAUzRHpHVzBfhMd2kPSprj+xnBJEVAOw2URXPhmx
 ZM32oJx/nyjQlgFStsRj1dXyL+0MbzcxR7Cn3HHlcQlfhCmN3NmuGDxRC8XfUyxlpOvS
 AsaNoh2RNX1Z84o0J/x3Nllqm9t2IEKC4D91m4JjsG4O0VYLPbTie02yRS1UBSvMNE46
 cyHtFjY1qJZRcWQZtq+Cp4bqtPBd5jb2I/1Uk5MquLvEauLLvmR7eNJ3+iBZHDkl2ZrU
 wq/Mu8GAqX71wpTK9xHZiJJIWm+bG8wi4KNC2nCAN9RVlobl60k8WvqlI8wH3LQkoLr7
 NmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713974340; x=1714579140;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FJ64wT6PzFAn8qjBgPSgjNXp6jZV103lzTHcm0eFcDM=;
 b=tSHmP2cUHaEhguM4mVROi3WYAVKmPeqDM7Gz0qeJK5+hnxve71OB2GY9no5Ze5kds0
 NOavsp57bezgyOGzeLgF1NTdcMXaRqmKrNGZqN9NNjM21Y/fEmeSK7HMQHBPy+3tfBcL
 XPEsMKXN2GZGAWLcrBTbKglN2e0jeY3MQbF1tmVdm9jAK6bfEne/zkq2y1gXsZDISV3A
 HBQIr4i17HJINo4Ctee2MUIhrAS/mQQfSl7dnvucFqyAo2RYwHgN6sQ0+XjdLsAtEjJZ
 rYTkN9UMULzRo6YrU4DNZ1JSRJ0+oVDlYImL7ZRzQMBMvbGw95MTrSPeaTwctBdBagMa
 d6Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/tnMQ7wcXJTIRyahxjF6ulRxLvWlWlZak2sJWUVAkwReGpeRERrykjo8rRq6tYYdo10WiSrDlBDeDbihTRTKsOc8kRDJmLGtbBNur3PsB
X-Gm-Message-State: AOJu0Yz+hzBbKDoMxhwSe8cdE88aAQtZCbg076ynVgtAfj+raq6e1jWh
 civD4aS3911UiegmBYm19FrzRf4PDLMzLeggzSvPgkNe5qbgYMGx3IZ/3F+gxXU=
X-Google-Smtp-Source: AGHT+IGQsIGDTrEkkFZ0d7BzpTqrals6W9oWwDLo3KADefDZvUVftQF2XJ0m/McclRYDcXaOpGRFfQ==
X-Received: by 2002:a17:906:91c8:b0:a52:58a7:11cf with SMTP id
 b8-20020a17090691c800b00a5258a711cfmr2030787ejx.2.1713974339977; 
 Wed, 24 Apr 2024 08:58:59 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
 by smtp.gmail.com with ESMTPSA id
 ef15-20020a17090697cf00b00a55a5384f7asm5059033ejb.165.2024.04.24.08.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 08:58:59 -0700 (PDT)
Message-ID: <c792a2dd-3183-4d39-bda5-4a8c30a476ff@linaro.org>
Date: Wed, 24 Apr 2024 16:58:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/panel: Add driver for Synaptics TD4328 LCD panel
To: wuxilin123@gmail.com, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-4-e0aa05c991fd@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240424-ayn-odin2-initial-v1-4-e0aa05c991fd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 24/04/2024 16:29, Xilin Wu via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> Add support for the 1920x1080 LCD panel driven by the Synaptics
> TD4328 IC, as found on AYN Odin 2.
> 
> Co-developed-by: Junhao Xie <bigfoot@classfun.cn>
> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>

checkpatch.pl --strict somepatch

CHECK: Alignment should match open parenthesis
#207: FILE: drivers/gpu/drm/panel/panel-synaptics-td4328.c:150:
+static int td4328_get_modes(struct drm_panel *panel,
+			 struct drm_connector *connector)

total: 0 errors, 2 warnings, 1 checks, 269 lines checked

---
bod
