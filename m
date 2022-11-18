Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552CB62F6D1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD6110E745;
	Fri, 18 Nov 2022 14:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661F410E743
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668780507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9sDJba7wP+7FL+i0RMUHcNkXVICQB5a3R3cWcWEJsq0=;
 b=iJ6X85ufvznqRkUhJRBYxMG09FWjmpMFdBZtpmEJnZN7ZV9aXy+Spo+I29dPoZ0d1WJS8t
 4nyD+tm80L5hsJJgORobB8cyqly0asGK0NxVVKMQa1+WKkZfBNnWk3yqNqtUbvnLprmRqW
 14zP67RRrUI7Lyy2D5CH3LGFSFY0n94=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-84PAK44jNxCSZ-3Bm7FopA-1; Fri, 18 Nov 2022 09:08:25 -0500
X-MC-Unique: 84PAK44jNxCSZ-3Bm7FopA-1
Received: by mail-wr1-f72.google.com with SMTP id
 g14-20020adfa48e000000b00241bfca9693so641587wrb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 06:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9sDJba7wP+7FL+i0RMUHcNkXVICQB5a3R3cWcWEJsq0=;
 b=YduCbU+XFQBQF0QdyHa7HMcquPRT6niPGpMFW4OXw2FcLfyM68dmOg3f16mevG6CjO
 U4J7DbZxHBirj0MwC5mkZBvE+j/Zuus8Re8ezcTZKDZ4VAPmtt7GB3vdcQY7OdjrGK06
 Zxsyx/DMY54SJfFpUqVB4882EzfEya47FiUPmjZiw5uxAELupuf8aSuNPTJURE+LVcR5
 7E4Miwjs/OlbCJzIdyKZhkOcq0hAMEjWf4J+Vwd0+Hx141Tx2Z51vPu7ajP2RXDtginv
 JQ9QE56lLhWfCpy1wtIKt6K0MZVudM7rlzJ7dJZ5FYY4EKHAG0QOaDlo4i9gTo0VAJxR
 UF2A==
X-Gm-Message-State: ANoB5plcWVyMij0Mn9dnQyHeSYrRnI5cI7btX+3aU3mww6DR2UtpnULs
 3X4c5xCfLo4LfZiCYt/oIOPT8vr71WDz/7dBO6cKTcHEttVsPs3IeLP2bES12J96gUmSXiZmPPR
 5E5vlvAoCY92Uf6vyYr/zI/w1ZwBA
X-Received: by 2002:a05:6000:1a41:b0:236:f365:b778 with SMTP id
 t1-20020a0560001a4100b00236f365b778mr4483410wry.515.1668780503958; 
 Fri, 18 Nov 2022 06:08:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7++EepGmlVVpGhRwHhkHFa3GXhXbWwcHrLf3UF3sazBx5byu+mZa5ox0T8iMQ105x24WYV3g==
X-Received: by 2002:a05:6000:1a41:b0:236:f365:b778 with SMTP id
 t1-20020a0560001a4100b00236f365b778mr4483397wry.515.1668780503754; 
 Fri, 18 Nov 2022 06:08:23 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x2-20020a1c7c02000000b003b4935f04a4sm5453237wmc.5.2022.11.18.06.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:08:23 -0800 (PST)
Message-ID: <fed27981-711a-7481-ab4a-68874e5f1475@redhat.com>
Date: Fri, 18 Nov 2022 15:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 6/7] drm/solomon: Set preferred color depth and bpp to the
 correct values
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221116160917.26342-7-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/22 17:09, Thomas Zimmermann wrote:
> Set the preferred color depth to 24 bits and the fbdev bpp to 32
> bits. This will signal XRGB8888 as default format to clients.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

