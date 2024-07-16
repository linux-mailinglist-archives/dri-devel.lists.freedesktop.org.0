Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068A2931E8D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 03:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCF110E4CE;
	Tue, 16 Jul 2024 01:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=schmorgal.com header.i=@schmorgal.com header.b="BDGDV0sm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897DE10E080
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 01:44:35 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-75abb359fa5so156186a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 18:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google; t=1721094275; x=1721699075;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Qt/SPI9w4Ydlf5F3lgn/F+VMPpJrd+IRMvd2pRUL/U=;
 b=BDGDV0smd341oy4F6aSTDh2VDWEVSUM314PuW21Z7QI5KXq0XFPoomfVxaxPkTmWM0
 xcDnih1A9LBjyEm33tc2IHaVDzLqJsE26XkfawjsSimBX83x92mUTBkF7BmPQK626MY9
 ax3jAAHmC3JB346v6+GbrVAZlue6pEMTFa+dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721094275; x=1721699075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Qt/SPI9w4Ydlf5F3lgn/F+VMPpJrd+IRMvd2pRUL/U=;
 b=SeTBk6t8nMpvbGqQ9aTnnPSCdDzBGKDc1I81TV+dGqgDaV16kMcMcMoMIUAZfTtikC
 PANGjymsDvShZydPBloFvigw/TeBPqpuS9ZSmRCyPi44CgoSDHqilMsH7Qa5D6wrTO29
 QYGcmYnaZOC5aSnTUDkFAus4RQt0l8KBJmQetW0ZfyZ9InejTTvE+w2R20hlX6vnpwc/
 dha9vHwgwg9jjUISJzKT+oS6TPoiYSRtfbr1OOgmGKRe2Yxt8WKQcpmVAj70pXz/8jjh
 HaXH9B0fT0FvMKYeQmbIFYcqq4elfK9XY79OeUIPhtWbKoNO9MZHD7OFX1sxSf8PqVuY
 PXEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsgQCcQjq909USbtSY0LjopoCv6/BkKddcEZzeLusQMiJsGhr7UpAx1N8mUFUH98RayMQT3cP96wxG6R03r/NoQ61p9jBCie8FEFRW39qf
X-Gm-Message-State: AOJu0YwIlODMISylkKOQ2VKxXl5W22mfx+uurZqO5Y5ubwlfej69GtwC
 A9uq9gBQ1xc8cj4OO+RQSrkC+6RWdxQd+0U29gNRvCknIVQtOn/KtdF+q+IGCH4=
X-Google-Smtp-Source: AGHT+IHW+WnJXZahgXnwYzOQ47BHvXthzkNIwiv+2EdlxveKcdFOl0yH2UivBrARch0QR2rf9MWqpw==
X-Received: by 2002:a05:6a00:6584:b0:70b:705f:8b12 with SMTP id
 d2e1a72fcca58-70ba48e76efmr1093813b3a.4.1721094274807; 
 Mon, 15 Jul 2024 18:44:34 -0700 (PDT)
Received: from [192.168.1.33] ([50.120.71.169])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-70b7eb9c8f2sm5073301b3a.41.2024.07.15.18.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 18:44:34 -0700 (PDT)
Message-ID: <1e7be166-30bf-46ee-b5d3-93def3465b07@schmorgal.com>
Date: Mon, 15 Jul 2024 18:44:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/vmwgfx shows green Xv instead of actual video
 (bisected I think)
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com>
 <CAO6MGtjxnm3Hc=T8jv-upP46XBzAc0ZNmLVF3=KNN8buGBwg1w@mail.gmail.com>
Content-Language: en-US
From: Doug Brown <doug@schmorgal.com>
In-Reply-To: <CAO6MGtjxnm3Hc=T8jv-upP46XBzAc0ZNmLVF3=KNN8buGBwg1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Ian,

On 7/15/2024 12:32 PM, Ian Forbes wrote:
> Hi Doug,
> 
> Can you try this patch with 6.10.
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> index c45b4724e414..e20f64b67b26 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> @@ -92,7 +92,7 @@ static int vmw_overlay_send_put(struct vmw_private *dev_priv,
>  {
>         struct vmw_escape_video_flush *flush;
>         size_t fifo_size;
> -       bool have_so = (dev_priv->active_display_unit == vmw_du_screen_object);
> +       bool have_so = (dev_priv->active_display_unit != vmw_du_legacy);
>         int i, num_items;
>         SVGAGuestPtr ptr;

I can confirm that this patch fixes the problem for me. Nice! I did have
to manually apply it -- looks like email converted the tabs into spaces.

I don't know if I'm supposed to put tags here for you to include in the
final patch or not, but I'll do it just in case:

Tested-by: Doug Brown <doug@schmorgal.com>

Thanks!
Doug
