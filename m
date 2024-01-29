Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282884048C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 13:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19F2112875;
	Mon, 29 Jan 2024 12:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A1310F6D3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706529829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DPGFMKgvwDs0VIMi/vYwseO/McEuakTER7jhLMz5YMo=;
 b=Ih0eEp8+DzdR38N2pCknpzwiEDc7CU+cDVnyRMtNz/ww7A/x8mQCgAniyTpBGOnqPKdoGD
 jgO8Y6wrjJjYSqPA3ntKmPdQ6UpsC5mwPKwznUx34hpWeNAgnJgyNLA2uqxpEFmNcLWQ99
 VHTmNbsXWCOuQILrQZO+v4XA2R10+dY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-xf7aZakKOPOXZ6GGdXqpsQ-1; Mon, 29 Jan 2024 07:03:48 -0500
X-MC-Unique: xf7aZakKOPOXZ6GGdXqpsQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40e4caa37f5so26506355e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 04:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706529827; x=1707134627;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DPGFMKgvwDs0VIMi/vYwseO/McEuakTER7jhLMz5YMo=;
 b=VFuHv1mRNmcZq83kc4GW5jRKzNiul7TIiNDaH4ewKNvirTTwLQbtoHE1600M2W5Ie5
 2zUAx1G1uKTrOZK87ajd8OB7yCMeI4gjbsuclT7j1cQ/44QXupxDT5HLddzt1FpoENQW
 Vo845DNiianf72wwFjlQHhfbHzI9z+GlKIwJAS3z4qdv3m5DkEEQbYluYMnK1tAzKApe
 cZVDogy7U0Q7aJhYN3uT2Omz/ZC7yQ2rqmRpgGE0vGL+fxxapQvchbycE6Gq0a2VJAbw
 Ncy5PJmTrQGIkJ8yGBiCTt2xn0qCoCKS+cPD0CSvL7vilVZMZt0MxjBdo6KLLyqsPf7B
 kF2g==
X-Gm-Message-State: AOJu0YxQBBKqx5I/rFF8UJdipUF8BWT2TfWbHJIHDtyA3EWoL6EBeIM5
 lS4FBwsuGYcnjqhTdrpG6kgTV4ANnvFsmnCwANkS2nWXJoLuk/U5pd6kZxjCp5nqVgFXjYlR9GQ
 RK0w4BsQpGUnVHgpTptItPFDhNt6uhl04s8eKDqkDzXly6VcHFBi1/Xu0YGhD2IISYw==
X-Received: by 2002:a05:600c:3b28:b0:40c:4904:bb72 with SMTP id
 m40-20020a05600c3b2800b0040c4904bb72mr4293882wms.18.1706529827154; 
 Mon, 29 Jan 2024 04:03:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGVZlCHfW1w5Cy1UVaPYsDyCgS09754O46MznaJdDB8+pq2pjRnOyx/vIqTreeAZgsZqappg==
X-Received: by 2002:a05:600c:3b28:b0:40c:4904:bb72 with SMTP id
 m40-20020a05600c3b2800b0040c4904bb72mr4293874wms.18.1706529826930; 
 Mon, 29 Jan 2024 04:03:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w7-20020a05600c474700b0040ef622799fsm3619172wmo.37.2024.01.29.04.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 04:03:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 8/8] fbdev/efifb: Remove framebuffer relocation tracking
In-Reply-To: <20240117125527.23324-9-tzimmermann@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-9-tzimmermann@suse.de>
Date: Mon, 29 Jan 2024 13:03:46 +0100
Message-ID: <8734ug73dp.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> If the firmware framebuffer has been reloacted, the sysfb code
> fixes the screen_info state before it creates the framebuffer's
> platform device. Efifb will automatically receive a screen_info
> with updated values. Hence remove the tracking from efifb.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

