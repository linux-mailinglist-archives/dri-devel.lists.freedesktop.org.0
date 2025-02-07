Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E8EA2C513
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967CC10EB0E;
	Fri,  7 Feb 2025 14:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZAfE6Qkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B4E10EB0E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:20:45 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38dc73cc5acso658891f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 06:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938044; x=1739542844;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nc124+i3gOWUcLL+MRlZMX010tcJdonEHZUPHfaiwDo=;
 b=ZAfE6QkqIRnZsY/GMTdz4OgIP16auHcp+UyVucYvThOaKx4pwQiAhZUhgaDF9SMAlY
 boew8in9867/loJgG9G6RaO8s7rESplhkywHRIhJ+2Tk0U1WCUvCXu7SMLUSzYXD5wMY
 nSZRcqrzeMvlOhx0m4yQg5dHO3Mq6Pxb+pl4wBLdMOKEsMpqcPkhJlYGMI2AwEQBpjAR
 cgCXOMNmLECIQBjygLhH81crzgfFjoL9fsZVchRu/obbKesIrHrA08yXjRZc88cQslyT
 hzpr7RKQsgH46I32GMFO3ZB92k1KO3I+GTC8Xt9E3lpG0k6onDhTT7Nyy+n33CzBnjSA
 TREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738938044; x=1739542844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nc124+i3gOWUcLL+MRlZMX010tcJdonEHZUPHfaiwDo=;
 b=MAwqOIYk4ADxk0ztFAGeEvsmBY2ng2mZvdMyRsB6H4EJD5Tj01zR6FIA2m6Tt3G2Ms
 NZnZhbBQCRCblwghEeVDqimgMMsuFFHwNjK/HWRnqr/uAwW3SWyTDgh6Dn2/82MiUBST
 64kVYYZbpwdCkzVSYWwk79cK05S8liZWo3LhF8CGHqPq1w24BPCaugNd/Xg0iXtNjUJs
 EE3ZQG8p3vTMeM1io11xlsnU9/TzBGslZc3XEhPSAWF8BuiUL6y4a8y9rwQuxb+5K4Hc
 smxKHLSklyYOK1nGkzUa1UCJpvRQNXQyL4F0lB1M0QYp+PQWaaQf68Oh4x2JkUU5t3Vz
 dICw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUibBgTfp0nOd+Kymrblxi5PnsHvvVKJcsHopSk2c4rArcP7kyY2xHEgoX8T/uA3OhXr3htvQkDcVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEjpNY9FMA8ezN8+sTcnqDB9jNgJfJ5qORPGvta7OuGFSWr4/Q
 +twhqJxHjPTz2wFtqrmxzu9nJIz99kjfzty//qenSihACMJLUNVA1FEmlKKOUtA=
X-Gm-Gg: ASbGnctNrn/qTWcNoxOR86s9oXI6KEAUBxrqITpPdxLMNUIgn3M8vUoaiwu+RIMBdDk
 f+EGv4QDFnzCWRpf2XmOhwR+kzY1Ym8m+k4rAr+MwLFJgHrGxo1WPSdigp21uzISgvL8draopXL
 bVWdJA0fjP1JL7j3AwwctwPvTEK9bTE2mBvATtJghd2Q9Lj2irR2sKJeJ2IOSU5lkskZneozvtC
 b4bhsP0jbRMx5K4FsatZBYoBLeTEnYYvTxPlcYCaJRlUg6VvBx+oTwXLsQ20oskaJW0nitrmBC5
 5Hp79z3AuKA9OWVmZsqsC0uY+zmKEGGaRIFqkfS7NuSdOuok7IazPhxSPAzw5bg=
X-Google-Smtp-Source: AGHT+IHb8NiDsyLlRIFbUrauOpegRl5HcLPG5P5HG+ThsLlczAtmqh5c1eeSyDNXReTt5f+HIp7+9g==
X-Received: by 2002:a05:6000:154b:b0:38d:c6b8:9fe1 with SMTP id
 ffacd0b85a97d-38dc9ba7670mr2614925f8f.24.1738938044458; 
 Fri, 07 Feb 2025 06:20:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8?
 ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5839877sm3151857f8f.3.2025.02.07.06.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 06:20:44 -0800 (PST)
Message-ID: <f2f07151-ecba-4e28-b156-8a85388cd064@baylibre.com>
Date: Fri, 7 Feb 2025 15:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/34] drm/mediatek: mtk_cec: Switch to register as
 module_platform_driver
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
 <20250113145232.227674-10-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-10-angelogioacchino.delregno@collabora.com>
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
> In preparation for splitting out the common bits from the HDMI
> driver, change the mtk_cec driver from being registered from the
> HDMI driver itself to be a module_platform_driver of its own.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
