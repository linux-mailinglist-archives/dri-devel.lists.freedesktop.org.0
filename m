Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB610A2C518
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC0D10EB17;
	Fri,  7 Feb 2025 14:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="c7eYIrRe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A56210EB17
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:21:32 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso14444485e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938090; x=1739542890;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=;
 b=c7eYIrReHgoaaq3LYcrvY2XPdxbrgZVjWZaKrro0mjzos8sov4KgrKyqYQTvzn6nXs
 FmzQX7Ekx8Cnc0lwUQLTxyfeu/d8TQ3llUPk+cgzdoC11mN4yMTJcAoVPpABI8eoTgqq
 CAE7UWpGFFThWPtqbT8O9zFSYhLFSKzfbtlFFTHfiLVv2Xr2E81p27WXLdU9x2db1IzM
 Ex3QywlHYdFfE7A6f0N1jes7h0nxPyJhS/9l0VAtcwuVsTXGtnqJOFCujaVC/r95xyq5
 4VmvwOuTv/41NNK7RRJ6Iz335TuDnhF4H2yWP5YZCzyBwZ41t/qwx7bfA63JHyaFw4fG
 Bb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738938090; x=1739542890;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=;
 b=o0kJnRvWjUEKeGMQ35beCq/Y2q1VoBVzjipz+NDLIXuXiQFNFvao4E3DpMKjWbow1Y
 n0dh67JHH8i4EOkeZ61p4DAatMxpFUhT4dFMVvIhsT8cBcIRyvsVc9zsfx9wHPy6smFw
 IHXvneckT53tyCJM4+U79eDyH1HDXAf488Fdjq0vJbSgkQBFybOh9BXpQ5rVY4wHyG8b
 5AZ0DPqN4YVBWJwgCSa9g4AjX3QoDACSNXxE1FbPbPEUlnp09+xMrw+7ZGACGpeUW8ty
 AAXINF8aKa9i7MVbNx/7P9E9/+AVQzxL+kT92rEGpUUFVCdwXyMUGrfRtcoxl4MaK9MA
 2vcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbWmppvyHY12nDpwTw1clOJFYV4C24eeVOHLFU72UTx0ZaNeNhiaq/0s2opH3ywi0YfnSGNpiIuIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfNO7oZmYK2IrgRFrxSxqKLSZiHyP/IrdcuaDw3tQZr6ASQZgP
 Lq4rxrNLHg/8f2n3ExtxmfrgrF0l8UKHOTJpmB6/JmHJ++1W/d+rcY/+ziZlj0Q=
X-Gm-Gg: ASbGncssJ0mLkVEDuNC3EhhG5kQ4/ppuYvaBrZonfGhWD5sw3x8OBOuXFQzgMfbFZw/
 8RpLCHPH95giH6FXK6S8S1ykOIgT06j8sgC7qru65+1ctDSv6Ba72Nk7OF1PP1CbicY6grTLhUa
 zGSmD2rdlzr3eFD7z27E8glUGOwQBCCYPON6J6ElOFnWKTdb/f1HqOQ2lDio4sMLKOFLHQWnjuH
 Dg/aSb9nK709puseZEIzqbp4k7QTq482YJa4G3SCmj8D1+J3CK8i3DS0P1F24kV7S6CjujJm/0G
 rNvN1JuUWUo6TKzlvtLDDbn5Kse4yWt/b8ikZjTnUtcqxFWhE5C7DHw80G97h2I=
X-Google-Smtp-Source: AGHT+IHsAn/5NuVWMfrT0WHyD1iRvhJHcQ1HOD5ajIz8v5VPfyCTgBqaPudj3dtejQe1G4pbiVMvEw==
X-Received: by 2002:a05:600c:1c8c:b0:434:a468:4a57 with SMTP id
 5b1f17b1804b1-439249ca925mr25071915e9.26.1738938090624; 
 Fri, 07 Feb 2025 06:21:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8?
 ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391d5283b2sm58939355e9.0.2025.02.07.06.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 06:21:29 -0800 (PST)
Message-ID: <f2e04ad9-c846-40e0-80c4-1b0e443dd14e@baylibre.com>
Date: Fri, 7 Feb 2025 15:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/34] drm/mediatek: mtk_hdmi: Convert to
 module_platform_driver macro
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-12-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-12-angelogioacchino.delregno@collabora.com>
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



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> Now that all of the mtk_hdmi subdrivers are a platform driver on
> their own it is possible to remove the custom init/exit functions
> in this driver and just use the module_platform_driver() macro.
> 
> While at it, also compress struct of_device_id entries and remove
> stray commas in mtk_hdmi_driver assignments.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
