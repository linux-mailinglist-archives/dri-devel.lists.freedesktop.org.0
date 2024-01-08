Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E99826B88
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 11:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A9B10E210;
	Mon,  8 Jan 2024 10:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F3F10E220
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704709446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Buc+32PLIexm5t35yGxT34SjG5qC1HYmYNySMobADFU=;
 b=FcZB/WwDWpHKJ0tGhXv4QbpmxgL+bQMRR0D0SZR8qS6vq4z5YjTtigla5gRG7mnT5Sp80l
 NMXpWynyVlxJlRQ0z/v0Y82JahhOwd9TJTYfQW9Mf9JC6xnp8vHoklZsMW0JnnwR1tZr8f
 UnfzADzqdGgJmv5AxHEE8qViPuh6axs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-yQuH6SJ5PFuNGe4cLAfECg-1; Mon, 08 Jan 2024 05:24:04 -0500
X-MC-Unique: yQuH6SJ5PFuNGe4cLAfECg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40d5d0de143so15127725e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 02:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704709443; x=1705314243;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Buc+32PLIexm5t35yGxT34SjG5qC1HYmYNySMobADFU=;
 b=M2z7Sy2zU4Dl6xgKO/V4zsH+iegpWNTQwnEcNr+N9odiuunB4i9HNA3kDXFRwNyqgg
 uLOpqdlLINbu7Y9Hq2B3Sny992Y0N2+eIoc4YE7Trq0BC1bfjFcXt+x5BRUhQvy6ORPI
 N3SvBRYaus3G7g0nLq++Bi2/f2m8WMbsi94ZqABueRbb+rGYZdT9qTf/pyRAs6Ll7iT8
 6wC/G0wqpQxf2kQTkCvbZ1bA6ECwcudX0UBOQjxbb0gSjCzY+q0cVvv+2dLJ16Hkj9VR
 oEwAgrclfRW2+rnyXAmGARrKNwsG/fkPkWqoeskQx+nCdNnLUYGRBqYX36Xjl8IVv940
 mtyg==
X-Gm-Message-State: AOJu0YwebPg7MM8nj8ZVFFAJjWnupLyR2W2uxCgo5VNTT0oZ/E7yVibM
 2Z2bV4QEmbm3ai3a+4xRo2lI/fNXf+sNLD3GdQBj9erAgPbNmvcz5FCeUVPxqBpf3lurqSyMDqQ
 8EmSOl1WbuJU0bJ1CaRt9/fOX/jlBfBrz8etE
X-Received: by 2002:a05:600c:3d99:b0:40c:2c42:ea56 with SMTP id
 bi25-20020a05600c3d9900b0040c2c42ea56mr1209240wmb.273.1704709443099; 
 Mon, 08 Jan 2024 02:24:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBZqq2lp3xQmRA81e+1BQ6msCXy7KSoUJKKlle/cMQ/kt9vkfYvvZ4sa9fXCl/7ooduo3E+w==
X-Received: by 2002:a05:600c:3d99:b0:40c:2c42:ea56 with SMTP id
 bi25-20020a05600c3d9900b0040c2c42ea56mr1209225wmb.273.1704709442790; 
 Mon, 08 Jan 2024 02:24:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4cd1000000b00336a0c083easm7415338wrt.53.2024.01.08.02.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 02:24:02 -0800 (PST)
Message-ID: <bc0f66cf-877a-4a58-b4ae-daeee3088398@redhat.com>
Date: Mon, 8 Jan 2024 11:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/9] drm/plane: Add drm_for_each_primary_visible_plane
 macro
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-4-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240104160301.185915-4-jfalempe@redhat.com>
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com, mripard@kernel.org,
 gpiccoli@igalia.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi checkpatch maintainers,

This patch gives me the following checkpatch error:

ERROR: Macros with complex values should be enclosed in parentheses
#30: FILE: include/drm/drm_plane.h:959:
+#define drm_for_each_primary_visible_plane(plane, dev) \
+	list_for_each_entry((plane), &(dev)->mode_config.plane_list, head) \
+		for_each_if((plane)->type == DRM_PLANE_TYPE_PRIMARY && \
+			    (plane)->state && \
+			    (plane)->state->fb && \
+			    (plane)->state->visible)

total: 1 errors, 0 warnings, 21 lines checked

I think this requirement cannot work when you use list_for_each kind of 
macros.
Do you have any suggestion ?

Best regards,

-- 

Jocelyn



On 04/01/2024 17:00, Jocelyn Falempe wrote:
> To support drm_panic, most drivers need to find the current primary
> visible plane with a framebuffer attached.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   include/drm/drm_plane.h | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index c6565a6f9324..41c08a2ddf8d 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -948,6 +948,21 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
>   	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head) \
>   		for_each_if (plane->type == DRM_PLANE_TYPE_OVERLAY)
>   
> +/**
> + * drm_for_each_primary_visible_plane - iterate over all primary visible planes
> + * @plane: the loop cursor
> + * @dev: the DRM device
> + *
> + * Iterate over all primary, visible plane, with a framebuffer.
> + * This is useful for drm_panic, to find the current scanout buffer.
> + */
> +#define drm_for_each_primary_visible_plane(plane, dev) \
> +	list_for_each_entry((plane), &(dev)->mode_config.plane_list, head) \
> +		for_each_if((plane)->type == DRM_PLANE_TYPE_PRIMARY && \
> +			    (plane)->state && \
> +			    (plane)->state->fb && \
> +			    (plane)->state->visible)
> +
>   /**
>    * drm_for_each_plane - iterate over all planes
>    * @plane: the loop cursor

