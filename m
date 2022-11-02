Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AA66163CD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 14:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7858A10E198;
	Wed,  2 Nov 2022 13:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2E882B5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667395709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mH0NB+X8xUaPriPvz6l7EtFMABMdU/W4ukmhMxYJ2Ak=;
 b=aq9kHYSivCPpRHKydFpNE0reC2cFbQQrXImhawbxZZ2xvrd4TIzaUetGGNhqQ2AxQRWm+8
 A2VSGgRksv+o+bbab/A4uD/Ve1zT0J7P5IAsf0ZHX/lqezmI8OM02TvyxeZs+J9A0wfckc
 8T3wKF6qsAmqpbwGrd5TpPrEw7ehX/M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-8m6jB0WkOYmR4pOgTqikAQ-1; Wed, 02 Nov 2022 09:28:28 -0400
X-MC-Unique: 8m6jB0WkOYmR4pOgTqikAQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso1086713wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 06:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mH0NB+X8xUaPriPvz6l7EtFMABMdU/W4ukmhMxYJ2Ak=;
 b=xrPMLQPxCZDFB61ZOdSfYpVUE69kw+RRFXmj4eAnjFszChOGfYi+QEl5JDEo+XXZnC
 DhGVleiCIcYGvRlcqPYnj2wjl3Ps8bdRJ4cLYcWoe/3C7oV0YRfcJJCd06VGbj5l1slp
 nnA4nO7mGLsobDNvYryDwPbSc8VgWlq/Ia46ixDMXD4Ij8dyHofDr9Zmg9S1ozhdYN6H
 bB0YKC0McJ3oU6QVbKAyM9a//PRMh0s+2qSBRI9ejsEuNF3q+zo7UspvVWNBMfcB4Qod
 e2p3sAGwkAgYhhnPMMlkFpET+0Crtvt2j6Swv9glrb4UJIE4E3jQpJBvM8tXxzzNiorQ
 u9BA==
X-Gm-Message-State: ACrzQf1XL9dW6JxnjWfZa3lQ+vxreq5db7urp4LC/CdABm1cqP3AAmVq
 0Mi8uzFvit+C1OTgxVvMWfMRV9zANtG6fkxSj01kJnkvQppLln+0T4q/DIp1rTIxqO39aLT7vCR
 Kbdsy+uEEIxWRrwuRbkWSZR5HwPKz
X-Received: by 2002:a5d:6288:0:b0:236:dc84:1f70 with SMTP id
 k8-20020a5d6288000000b00236dc841f70mr7892012wru.549.1667395707166; 
 Wed, 02 Nov 2022 06:28:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7B+h6qhKkyS4NRbxQwRnAF2DjvNCQncW8IAEVaDilHd0RzkDCFj8KnhHaHNKFDcnHCLqlVvQ==
X-Received: by 2002:a5d:6288:0:b0:236:dc84:1f70 with SMTP id
 k8-20020a5d6288000000b00236dc841f70mr7892001wru.549.1667395707003; 
 Wed, 02 Nov 2022 06:28:27 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d59ca000000b002362f6fcaf5sm13095440wry.48.2022.11.02.06.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 06:28:26 -0700 (PDT)
Message-ID: <6f380ea2-f35a-5fbe-38af-9f06a624d78a@redhat.com>
Date: Wed, 2 Nov 2022 14:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] drm/ofdrm: Convert PCI IDs to CPU endianness for
 comparing
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.stein@ew.tq-group.com, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20221028122229.21780-1-tzimmermann@suse.de>
 <20221028122229.21780-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221028122229.21780-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/28/22 14:22, Thomas Zimmermann wrote:
> Properties of 32-bit integers are returned from the OF device tree
> as type __be32. Convert PCI vendor and device IDs from __be32 to host
> endianness before comparing them to constants. All relevant machines
> are old, big-endian Macintosh systems; hence the bug never happened
> in practice.
> 
> Fixes sparse warnings shown below.
> 
>   drivers/gpu/drm/tiny/ofdrm.c:237:17: warning: restricted __be32 degrades to integer
>   drivers/gpu/drm/tiny/ofdrm.c:238:18: warning: restricted __be32 degrades to integer
>   drivers/gpu/drm/tiny/ofdrm.c:238:54: warning: restricted __be32 degrades to integer
> 
> See [1] for the bug report.
> 
> v2:
> 	* convert endianness (Alex)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/202210192208.D888I6X7-lkp@intel.com/ # [1]
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

