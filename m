Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141465E74F8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F6C10E476;
	Fri, 23 Sep 2022 07:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151B610E476
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663918760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EKB1pxw/+88ogDwhxsBJE4vNVsjb3L0GyQoT48Wyfg=;
 b=aUzxwtDniZ+2erGNnyoMEU/v9AUybVQsewV3WbyQp+l1VVLSQdNy9i+YYJL/88CgMAaQ5q
 lmQa9wz1X5h5NdoBMmz8ARU2FA+FkWwFLvyFbeqsf2378Hm7wwgpN6WjdwXPLMnUCpYyMW
 G3sfdJgP047AT8YUf5BJM/gKVThxLbs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-4ei9ZPXLNy-cz_6qelDduQ-1; Fri, 23 Sep 2022 03:39:18 -0400
X-MC-Unique: 4ei9ZPXLNy-cz_6qelDduQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d30-20020adfa41e000000b00228c0e80c49so3744941wra.21
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 00:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/EKB1pxw/+88ogDwhxsBJE4vNVsjb3L0GyQoT48Wyfg=;
 b=zVfTsWduX2KU00eh0HlgeuhY8OL7PsYwf1ZfhoSmPYKy4oE4PUEhJMrVlYaXq/Ptv/
 eLO6YQLJmCwHuCSH3vurM3BaVpopxpwSxoSFoKbU/kke2l6+svsw2Ny9/gXI/QoDnAYf
 hH6zVsDGQNnpiu4jmiyU9XBfuUrtbWk4Wt4h01Cq0bT+Dm6G7CY2VkZ6bklBuVgxYQ19
 6aqVn6gB1gX3ybk5t+8FElRTpt/oQ7lXzJZNi4cpYaaH5cboRMT/DRzvitxxhU2xMrBv
 JPDbqUM4r6wPbn9OEKgzoyqSOlVPelLhRbd9LYlO+pnPN0sgeUVYZx5SpQzNA89oeDrH
 5vng==
X-Gm-Message-State: ACrzQf18UXX2tT5v4X+JRjkq9Jfye3w39NQ3+rYm4GIggKalijVxESjE
 9/I3IWDVMb9NCrPX/jc8X6xXois7mDpsAK2BhVTzLvffDMM4VnTpNJIhbCxdhvTTYsk40EO/ZoM
 HETSVe/pxmG2ySyzoFjJayHTpHmOF
X-Received: by 2002:a05:600c:19cc:b0:3b4:b15a:7df with SMTP id
 u12-20020a05600c19cc00b003b4b15a07dfmr4856935wmq.185.1663918757296; 
 Fri, 23 Sep 2022 00:39:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM46CNiD4MZzohy16L/0Rz6prGt1f2s/UHMRlozsQGmceJ8NvHvy/v7MRF+IkE6sLbZViId1pg==
X-Received: by 2002:a05:600c:19cc:b0:3b4:b15a:7df with SMTP id
 u12-20020a05600c19cc00b003b4b15a07dfmr4856919wmq.185.1663918756971; 
 Fri, 23 Sep 2022 00:39:16 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b003b4fdbb6319sm1985248wmq.21.2022.09.23.00.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 00:39:16 -0700 (PDT)
Message-ID: <981d723f-33cb-002c-ff60-2b83032aaae8@redhat.com>
Date: Fri, 23 Sep 2022 09:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/5] drm/simpledrm: Compute linestride with
 drm_format_info_min_pitch()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220922130944.27138-2-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 9/22/22 15:09, Thomas Zimmermann wrote:
> If not given, compute the stride with drm_format_info_min_pitch(). It's
> the standard helper for this purpose.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: fd9e3169e42b ("drm/simpledrm: Compute framebuffer stride if not set")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

