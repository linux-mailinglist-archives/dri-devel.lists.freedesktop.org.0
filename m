Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D73186BC29
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 00:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BF310E215;
	Wed, 28 Feb 2024 23:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SUY66pP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FB110E2A0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 23:26:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-513235b5975so273567e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709162815; x=1709767615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7eYiCisy9EvDzPpdsA8EnqFrzrb2WGQGdFzfYxWz3OE=;
 b=SUY66pP/dgcLxtcahy0RYDRWVzL0ljDxqm5n630oQTqviTWywLJh2z4rOMIVC4huNC
 XNumPZ+RPWWlAos7guWeYz4YzSLnFQATl/wP13vqUUx3FI8p7NNBXXkw/5mGEo5obA0O
 IUZt+I6tXp8FjdJ5w2x4OJOj+hdQr0wYF+yw2VQE8Q0E+osAPfwD6ZQrj+dtIH+athy0
 3zagxbgJUjZuUi8LKhZbOuTb+tcOwggzRc2dPmggk1P05jSe4CSb3FoQe45TxpfdExYo
 RTYSAZlgmv1xW8Nvn/Iult+CtsRL/eksl0OLFxEG2XaX1NWZVX2bhY2S8zTSyPJsAmAW
 IWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709162815; x=1709767615;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7eYiCisy9EvDzPpdsA8EnqFrzrb2WGQGdFzfYxWz3OE=;
 b=tmPSyvr0gEV4n6I8YeL4Aj+AUsn3ZM/rG3lK7Z2IfdgaM1q/bkLOVFq815eeuYj5HT
 Tu9wBbS0JGV8XQvjgSCqobjqHx4BBGOPdFvlkkxwzbb2xnDltO0OLUIqqImTYgKgzblx
 UasbRzKNXUAChZNR9F/bCqqyCEP9Rq031SsNg8vxEadycjbpAwQjUEjOvVm9h0Ttq8cL
 qf8gLmgbPaC2JcTbHt51YWXFWtgpPPcIXpcyKJBF0sk+wXPBeMghglzRmXUK2B5dyvqW
 AU/HJInCIwlBjVWlWWNlCfBQBfkLMyXOHOA46UI35j+AKKcpzUqtZ2Wnmx3YJ3FC+YmI
 YC9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHquKR/iPPhgw4BCTe7NvuIwQSBI+QtIrTXOzdsPCy0Gj9KZagQbZk+Cj4hxIPbMQ02Ukn/mRy/Yw274WMflfWvseq/IP/E7cQ9GUAhwAU
X-Gm-Message-State: AOJu0Yw9efUt6k9Jb9ZTLLyu4tao9IZAgdFLD3i+VaLL2NS+RH+5GBN/
 aK2X3PF/Oxuvj0P2Xg0Ts3Xt1TSSjuwZ+nbZefjEhytVcz+5iEICOriS7QYG5/E=
X-Google-Smtp-Source: AGHT+IEauPA8YU76AZ2HWn9YzhqJSaQh/sxY5dBOq9kCUqmFc1a7D67zChdJwrqxqulBHP/Mq3mKqg==
X-Received: by 2002:a05:6512:34d3:b0:512:f6a0:1311 with SMTP id
 w19-20020a05651234d300b00512f6a01311mr236650lfr.47.1709162815082; 
 Wed, 28 Feb 2024 15:26:55 -0800 (PST)
Received: from [172.30.205.146] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 j10-20020a056512028a00b00512dec300dcsm28686lfp.2.2024.02.28.15.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 15:26:54 -0800 (PST)
Message-ID: <c25aa425-f350-4ad2-b92e-67de996daed3@linaro.org>
Date: Thu, 29 Feb 2024 00:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Use common error handling
 code in pmic_glink_altmode_probe()
To: Markus Elfring <Markus.Elfring@web.de>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Zijlstra <peterz@infradead.org>
References: <29b63eb4-2342-4ca8-a313-5de2a6ec6a83@web.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <29b63eb4-2342-4ca8-a313-5de2a6ec6a83@web.de>
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



On 2/28/24 19:05, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 28 Feb 2024 18:45:13 +0100
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function implementation.
> 
> This issue was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

(+CC Peter)

Hmm.. this looks very similar to the problem that __free solves
with <linux/cleanup.h>..

I know no better, but wouldn't the same mechanism, down to the
usage of DEFINE_FREE work fine for _put-like functions?

Konrad
