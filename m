Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B097D41AC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 23:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D526E10E1EF;
	Mon, 23 Oct 2023 21:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA45710E269
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 21:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698096570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcPd91tcHUqGQ8cwQ4BFcEpBug5kyk/HqJ75ngdNbWY=;
 b=KbM/YjteJ7k/4nNP8FI+2EvNYE3Nqobm2vg0cQrWwimbxEJeO2GHqGnzLUVUdIE5uryJDs
 TNnp5ljuGjD9uVINYf04TS0Cb6VZpIBfjkgWSyDQmyD+Xv5rOpmcdxcLZvLfRCJ87lrE5V
 BOzYvyoQ1gbJNsJv8d7AdSZfmnjmfV0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-klrysPm0NQWnLvx6EfXLCQ-1; Mon, 23 Oct 2023 17:29:26 -0400
X-MC-Unique: klrysPm0NQWnLvx6EfXLCQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-50798a259c7so3753586e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698096565; x=1698701365;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rcPd91tcHUqGQ8cwQ4BFcEpBug5kyk/HqJ75ngdNbWY=;
 b=Ly1sWt+JWcepxbql+a+1y7nDTO/dFdB09E/t4LKNe+lgvqAo2iXG9lLOuOzNrdG9Mi
 c2XMtsbnJ7krXl6QaU26eTZgvFixxhFCSX70uaGMC/pReed9RjGsuj+15/NYI+u+UWmS
 LK8+DeD0O4qwiLR2EG7zUrd9W2bO3GSKUxdE8n4fBSUl9+Il1ozDfBQ4WgiKcAwmyVSn
 9soqiRXFCh5MMqhzjdGRUKduYXRq4/gvYvzvN+LenZvjWbtdKtJkgwCSmiZgcL6EF95t
 pfOWJ3SiCVXnEMkdmWA00KAg94AvWyJ7qVoRZzHY6gpoymZLNDAyRwRiSBqimPXgBush
 wX3A==
X-Gm-Message-State: AOJu0YzHHG2lFLly5YvZu14sxD/D46WlDGZvaGCt963JAP6GZKrraDV4
 lqwsBRQG9Ntvh7qpWZuzxxFmuIFnnbD9ORmG+O+sTknMeWqvFIn8ns4dN/eXxQ5oOl+41xcAsHm
 DsWvSufTcvjTSrW5ZvAhtN3tC0IBS
X-Received: by 2002:a05:6512:1382:b0:507:a1dd:5a86 with SMTP id
 fc2-20020a056512138200b00507a1dd5a86mr8401825lfb.13.1698096565317; 
 Mon, 23 Oct 2023 14:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnF8cqoxrlrOT9P0v4zs+TvviuGD1NXYsIxxUywKDSj03aKaf/bFvjifDaAO0+t237pvZMQ==
X-Received: by 2002:a05:6512:1382:b0:507:a1dd:5a86 with SMTP id
 fc2-20020a056512138200b00507a1dd5a86mr8401805lfb.13.1698096564991; 
 Mon, 23 Oct 2023 14:29:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 vg18-20020a170907d31200b009adc77fe164sm7193030ejc.66.2023.10.23.14.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 14:29:24 -0700 (PDT)
Message-ID: <6ddcac19-70c1-4f94-ac11-9d864721ff62@redhat.com>
Date: Mon, 23 Oct 2023 23:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] [PATCH] drm/nouveau/dispnv04: fix a possible null
 pointer dereference
To: Ma Ke <make_ruc2021@163.com>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 noralf@tronnes.org, mripard@kernel.org, jani.nikula@intel.com
References: <20231013011850.103967-1-make_ruc2021@163.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231013011850.103967-1-make_ruc2021@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/23 03:18, Ma Ke wrote:
> In nv17_tv_get_hd_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference on
> failure of drm_mode_duplicate(). The same applies to drm_cvt_mode().
> Add a check to avoid null pointer dereference.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

For this one and the previous patch, please add the corresponding
'Fixes:' [1] and stable [2] tags and split the commits accordingly.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
[2] https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

> ---
>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 670c9739e5e1..9c3dc9a5bb46 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -258,6 +258,8 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
>   		if (modes[i].hdisplay == output_mode->hdisplay &&
>   		    modes[i].vdisplay == output_mode->vdisplay) {
>   			mode = drm_mode_duplicate(encoder->dev, output_mode);
> +			if (!mode)
> +				continue;
>   			mode->type |= DRM_MODE_TYPE_PREFERRED;
>   
>   		} else {
> @@ -265,6 +267,8 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
>   					    modes[i].vdisplay, 60, false,
>   					    (output_mode->flags &
>   					     DRM_MODE_FLAG_INTERLACE), false);
> +			if (!mode)
> +				continue;
>   		}
>   
>   		/* CVT modes are sometimes unsuitable... */

