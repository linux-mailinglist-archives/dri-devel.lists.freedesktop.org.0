Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F11BECF91
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 14:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868FC10E052;
	Sat, 18 Oct 2025 12:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ODBXIAxK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8FC10E052
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 12:25:47 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso2657391f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760790346; x=1761395146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qxh9yQnKYSbelXax4RapBIx42eIGM+JDvuTXPUm+30A=;
 b=ODBXIAxKjUlqUME+MSAUS/l2fuTeR3qzhqoJxCmQwn7tiMDEn9OomFhgwMzqsacuG5
 A2MpBADOSmyPwwUPC2fojOY2opT/7D06y/wd9IfDYCkYqbRO3VkOZnLqlcnUz4l2Ed9G
 dZ/3WJBYxdo0fzICHHlIlI8ipVLwXLbOdOF1IXR9lwVKxOiwNADugdDnM54RjiXztxwR
 lNUs/QiVQY2lSqoegWh1PY8TF69lJmWxSEhD1adrF5xd4OxTZ9FTsRDmfE2w7cCrlI4Q
 iRTtDIWxAtpW9rhLtbmReSCC2zC0xJiv1oUY2KPM7a120AW134IRBSf5i9ib+jXJEb6H
 rksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760790346; x=1761395146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qxh9yQnKYSbelXax4RapBIx42eIGM+JDvuTXPUm+30A=;
 b=VWbYm795HCQOgDY4KuabklMumghKHpLygKy84KyuC0tk1xiShjoL9FzORvUvsdYgOB
 G9saK3vzGRe7brd5G6cZmkx7pBFU+Z8tryEWJCwOuz/WcRxDj5wpHt5HOiX1W+6vOrAU
 +3rJm7d6u+Jf2VSd0VUCMuVE/KMXi2lTiD1/2euvaqL5j7lfbZjtm5DVfp9pQxka0IEU
 m75H0hpp758nAdjGtGbNLLrpHqTGOwDuQ4far2AOALB2ZrmGeFJrMr7wN/YU+i5fbSst
 wXLGv6t0ABVjtBG5ATbwQyFH7R//Ov+iqN9hd9kCmGJOFeJuh7uwp/Vl8BV+7LLE4piH
 NcRg==
X-Gm-Message-State: AOJu0Yz/DjxH2ySen0OdPomjRiQF+jbPJ6V6lyY81wES+pWcCPeNkJqd
 UEJtfK9E14OvDVcGb2M4POiIIjTz6pfYLCB6m39vboKp+qFCh00ifeYF
X-Gm-Gg: ASbGncsLZiXAYf51OxLTAg1EX/MF9uAQzLp5qtOkIJ/nDczgHhr5RO+viInT4GAoY18
 gE2XVjkKYbbZTjp3atW+5OIzKPhV68AaVX2UDo/4EJHT6uWa2i2pcOs4OCBNWy/esscDXaIHxKJ
 GD+6BjML+fnW1zi7oXfztc0PIyXZgm9ganK39eMGL2yFYH7mtjOpgp2LHe7VlDBNRJnJngkzPiL
 OaWOEQfL3r0fzI4mDO2JldF5QxTFSQcyVshByWQlC94RWkjWxUIcWFu2cbyM2lPu8haL5ivslqo
 g0BwbnnLvW4TefEZ/8N8XhRiph/NgdApqX3gNsv2Jy1AvIBlIkCZNTJhWlmwLplAr7xNYhp5wZa
 CeiHsGf4rwRTkEJi6Hbq2FHy2jkYWQsgpOx77oGsXrLLz+rkVU2B4TVdYb8XIw134unlAyt6pXL
 NIaSSXaLDMSTS0GB1nnOS+oJNlNGK+QDb4mweScQ1906hsHm8wky4DIQLjigo=
X-Google-Smtp-Source: AGHT+IHrvYmWU8VX2IjvdY7vhN8XWzCKvjWvIIW7b+tyYuQhrexcrdSS7qJwieJq0P0lR7mpRkRGsA==
X-Received: by 2002:a05:6000:4b08:b0:427:526:16aa with SMTP id
 ffacd0b85a97d-42705261894mr6353009f8f.58.1760790345945; 
 Sat, 18 Oct 2025 05:25:45 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5?
 ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3acfsm4828453f8f.14.2025.10.18.05.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 05:25:45 -0700 (PDT)
Message-ID: <e303c2f5-0868-445b-ab1f-dbb81dd173d9@gmail.com>
Date: Sat, 18 Oct 2025 14:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/sti: call drm_edid_connector_update when edit is
 NULL
To: Chu Guangqing <chuguangqing@inspur.com>, alain.volmat@foss.st.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251014065406.4017-1-chuguangqing@inspur.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20251014065406.4017-1-chuguangqing@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Thanks for this patch.

Please change the commit subject to "drm/sti: hdmi: xxx".

Le 14/10/2025 à 08:54, Chu Guangqing a écrit :
> call drm_edid_connector_update to reset the information when edit is NULL.
> We can see the following comments in drm_edid.c
> If EDID is NULL, reset the information.
> 
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---
>   drivers/gpu/drm/sti/sti_hdmi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 4e7c3d78b2b9..31a72f7f4d43 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1008,6 +1008,7 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
>   	return count;
>   
>   fail:
> +	drm_edid_connector_update(connector, NULL);
>   	DRM_ERROR("Can't read HDMI EDID\n");

Now that empty EDID has been properly updated, the DRM_ERROR can be 
removed IMO.  In our use case HDMI is not systematically plugged, so 
this ERROR is quite noisy when we do not expect it.

Best regards,
Raphaël>   	return 0;
>   }

