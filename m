Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C9976AC7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560A110EB83;
	Thu, 12 Sep 2024 13:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QMd5rozE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1FB10EB83
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1Iwmt9sTkRV0ZmpvpKUhBxgVtFjW6lz95SN6og9FQo=;
 b=QMd5rozEgIBKhPdQu6re0rojfnPYBrgLuizNdA43lAI5Xlsojc4Sz1xsTK3fQrWrmFiynM
 +tLGbjknZgmV0BFLyYWO8guRix2Y6h//7AZYyl3/CYv1Fan3HeFYRk4niHZbCREfQnQDoP
 KEamZ7Q4CqMLE/Vdyw0Phmb2n2lTVSY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-ZLHiORHYMMC_4meNwhI8Hw-1; Thu, 12 Sep 2024 09:37:04 -0400
X-MC-Unique: ZLHiORHYMMC_4meNwhI8Hw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb0ed9072so8385425e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148223; x=1726753023;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m1Iwmt9sTkRV0ZmpvpKUhBxgVtFjW6lz95SN6og9FQo=;
 b=XtsFZzHbG77UDo2yU71Ihro7Y9UGdCLsvQFzkj6fDHT5s1HiUQAnN9MjPNQyskdoZb
 E4be7/Gsg2bPLEH2c6HR/1fQCnCbUImUaPCXhjIvpU8AgtcgkBFDj03mHzHfLvEAsTd/
 nLZAVNrBWxnRW+LZ0gf571sWdCfB05lcrOB0u2BSfUa/VjbE2tkOPZIyqU+FHLysPiZt
 UTPD19fEqTMpIV4cfW+Lv4L2CvjsxMhkR8LxmknDGdG9IDns1zZO14eUemNkdH1Ip/tz
 YAQ4quxtM/uTGtWzZdbz6is7dmW/no6riuFosnH/CX7mkQAuxIM1LhpNliqx9C8bvKTL
 wPAA==
X-Gm-Message-State: AOJu0YwSk3LUsqNMU65eImCxnDfaPJ11inZStXLBagn+vfZPHkp/X1vO
 dLnZMmD1UjSuURKkVfCemzeVeMkSZc4PNMeDaYtxhjV0Tl9EM7lXo9N2qXSfHkSnOJfUDOzt/Yd
 RcNY2YYxa0EDy9ZTryRoNyROzS4xFlNSBmZ7/nqP7pN/0lOKm8bD+OJZXsWbPY92OCw==
X-Received: by 2002:a05:600c:4695:b0:42c:bb58:a077 with SMTP id
 5b1f17b1804b1-42cdb53cac5mr29259945e9.14.1726148223106; 
 Thu, 12 Sep 2024 06:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGVtnaN2yARSQTwHWx+mlM6qCU81zGWjZPVLfBNd23iI9L3t30QhB905/vlAKKvEJSKcKHDA==
X-Received: by 2002:a05:600c:4695:b0:42c:bb58:a077 with SMTP id
 5b1f17b1804b1-42cdb53cac5mr29259615e9.14.1726148222578; 
 Thu, 12 Sep 2024 06:37:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de023sm14318778f8f.106.2024.09.12.06.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:37:02 -0700 (PDT)
Message-ID: <a69511f5-d957-44dd-b37a-30595acc03cb@redhat.com>
Date: Thu, 12 Sep 2024 15:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/ast: astdp: Inline ast_astdp_connector_init()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 11/09/2024 13:51, Thomas Zimmermann wrote:
> Inline ast_astdp_connector_init() into its only caller. The helper
> currently only does half of the connector-init work and is trivial
> enough to be inlined.
> 
> Also set the local variables for encoder and connector as late as
> possible, so that the compiler warns if we use them before having
> initialized the instance.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 45 ++++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 23 deletions(-)
> 

