Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11436D75B0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 09:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003B510E845;
	Wed,  5 Apr 2023 07:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC9010E845
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680680151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Gs4oYHygPkNfavsNs94EZMj1vBBbRSFyRlj7XxfcA8=;
 b=eywclKPEjkATwrOMX6GkKhlSq36m3BXEbUq1V8r76xXlPeU87jsrZxsIav25aoEOrz9iHv
 cyQmRHFkeXnMsHQA32JNDfJtfTNuK+HuU/q0hHdth73zoCJqz78bSQiC71w92hyb1bX5y0
 +HTay5ENxcpkH7xpVzHRdPc3AhZD4Ho=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-tBJZg4wrOT6lbbRiuaLkcw-1; Wed, 05 Apr 2023 03:35:48 -0400
X-MC-Unique: tBJZg4wrOT6lbbRiuaLkcw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi27-20020a05600c3d9b00b003ef6ee937b8so13553037wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 00:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680680147;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Gs4oYHygPkNfavsNs94EZMj1vBBbRSFyRlj7XxfcA8=;
 b=4iD/WVsn+9g9ykfSPUW7/ppefblzya1AQ/A7uaFq7EyB67oBEHhzpsZdCUHvM5ausr
 958428gAh6V7xG+aiZaBDr/sAX/2WEZh/+2cQy7zvMQSDhl6GTs9k8xXUiqid+/0DjkK
 3NtZgvYXIssKzlqi2Mqr3dosrzLbdnXtuASUQfowQbAXJXiP/g8UAuCDXppYTQnWQ4Os
 NrieglHZN4i2JF2rHp3LhqO5rszTnNwb6e+DEsi2KxHI1ToiJvxjsByf/X2ZwGK4IIfe
 36otC2+fEYyZk/18xFJh89a2ySb5KoFCMl16w3KRU2+wTdeKju2mCTuOcknXVG/sjv2I
 GNMQ==
X-Gm-Message-State: AAQBX9dMOqiUlkw8GBqpz2hERDFrdW9qElMXxZ4VIAiqps8Rukc17Bve
 tJMBwjl8pcoIPiE5on+Q9kcUP+7ELGvgE8IrqxQpcS2qqUq9vmkRHI9Qgmxz1ubhicP5VFcbkks
 NEzVKzaj9LQATAZGSHua9T0tDE9y6
X-Received: by 2002:a5d:6884:0:b0:2ce:ae4b:6971 with SMTP id
 h4-20020a5d6884000000b002ceae4b6971mr3379660wru.57.1680680146894; 
 Wed, 05 Apr 2023 00:35:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350YUaODcpIAASJfgobsEppYYLjRyrg6hVaNH2QlSoJ+mkoAfAnyU2sApzrV6NlxQ1XodB5N4Ew==
X-Received: by 2002:a5d:6884:0:b0:2ce:ae4b:6971 with SMTP id
 h4-20020a5d6884000000b002ceae4b6971mr3379641wru.57.1680680146575; 
 Wed, 05 Apr 2023 00:35:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o7-20020adfe807000000b002e4cd2ec5c7sm14309636wrm.86.2023.04.05.00.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 00:35:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/atomic-helper: Do not assume vblank is always present
In-Reply-To: <20230405045611.28093-1-zack@kde.org>
References: <20230405045611.28093-1-zack@kde.org>
Date: Wed, 05 Apr 2023 09:35:45 +0200
Message-ID: <87mt3mdbn2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 banackm@vmware.com, krastevm@vmware.com, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hello Zack,

Thanks for your patch.

Zack Rusin <zack@kde.org> writes:

> From: Zack Rusin <zackr@vmware.com>
>
> Many drivers (in particular all of the virtualized drivers) do not
> implement vblank handling. Assuming vblank is always present
> leads to crashes.
>
> Fix the crashes by making sure the device supports vblank before using
> it.
>

[...]

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 299fa2a19a90..6438aeb1c65f 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -997,12 +997,16 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
>  {
>  	unsigned int pipe = drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
> -	struct drm_display_mode *mode = &vblank->hwmode;
> +	struct drm_display_mode *mode;
>  	u64 vblank_start;
>  
> +	if (!drm_dev_has_vblank(crtc->dev))
> +		return -EINVAL;
> +
>  	if (!vblank->framedur_ns || !vblank->linedur_ns)
>  		return -EINVAL;
>  
> +	mode = &vblank->hwmode;
>  	if (!drm_crtc_get_last_vbltimestamp(crtc, vblanktime, false))
>  		return -EINVAL;
>  

Rob already posted more or less the same fix:

https://lore.kernel.org/lkml/CAF6AEGsdT95-uAKcv2+hdMLKd2xwfPeN+FMuDTRMc-Ps7WbRjw@mail.gmail.com/T/

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

