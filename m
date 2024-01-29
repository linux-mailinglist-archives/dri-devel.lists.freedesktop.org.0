Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25B8403EE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A5410E9B0;
	Mon, 29 Jan 2024 11:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FDA10E9B0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706528307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MapLRoPeuEFrrH0tJJpiZIJsI8BXc3+tcezhCX1GwpY=;
 b=BMo6d6VJgVrvU1osAqY6mOkiRLBWxrY4bQg5W24nDkoRYvvqHVj7SmQJNc1GWfHC4YYK6i
 slEFuBhCilPoZEV8kxm/y/CdqkFvpA4LcCASJ1c+zktxf2e0h8rTgZebAurMYN/yR0mukZ
 c1+Su/0h55gUQ5l/uuWyl3I+1Sgxdg0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-6c7Q6O2aMWKlIRyh7esaDw-1; Mon, 29 Jan 2024 06:38:25 -0500
X-MC-Unique: 6c7Q6O2aMWKlIRyh7esaDw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40efbba82c8so1002795e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 03:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706528304; x=1707133104;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MapLRoPeuEFrrH0tJJpiZIJsI8BXc3+tcezhCX1GwpY=;
 b=v3KrW8dEuNbpsADtkhS0HBAEuPnvRWV9nsNsFUq10qR6X4Rg8K42eS473jS/Jyoq8M
 RxzS82XkfDEaTiPoiC7JC9KVtRmpmj5epeNgFBacCqmwamYKGCnYKl8bGdUKS1Q04smv
 yaBcX9XdXMp+V9a5Ajabgy/Aw4OrmhfBXH4H23s2FjIBypvB380RFP44vBEBLwf6v3vj
 1tz6GotBwEB/FX6zCjxMXF4J2okrjT4Sn5XgDquubh7IqT2hipBkoakwowinfrQg4kJA
 3G0t/W5zXHI/EMUS4lO4dGUofw2aPn+ywmoVvx1uXmX8HKQ3rb8zJZgQA+Smu5j+T091
 LWXw==
X-Gm-Message-State: AOJu0Yx3/UoUkraHVexmmUhqQgol2Gm0rhBS4sr7yWJEKJTrgfujGKd9
 uL0UDleNOc7pMfs8FAmXLTTTC5QwaQ4iEKxsTpLA6mnxCjViQm8mf3Va9K3h4jiQYgYm7azwrZk
 ACnYuuqr9QouovK3Dd4hHDZDxaVL3by5st/Ty7l8XOapS2lwkj+ZcNZvgxLhTomY6J1Vb94nNhw
 ==
X-Received: by 2002:a05:600c:4f11:b0:40d:9057:41f0 with SMTP id
 l17-20020a05600c4f1100b0040d905741f0mr4912035wmq.8.1706528304699; 
 Mon, 29 Jan 2024 03:38:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkfybKQE+/gcxapqh/FqbHFBr8PruLoUynoBGLGAl6tJpemFut/QmnhuNabpStubh/jkMPNg==
X-Received: by 2002:a05:600c:4f11:b0:40d:9057:41f0 with SMTP id
 l17-20020a05600c4f1100b0040d905741f0mr4912017wmq.8.1706528304394; 
 Mon, 29 Jan 2024 03:38:24 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t5-20020a05600c450500b0040e9d507424sm9886873wmo.5.2024.01.29.03.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 03:38:24 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 6/8] fbdev/efifb: Do not track parent device status
In-Reply-To: <20240117125527.23324-7-tzimmermann@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-7-tzimmermann@suse.de>
Date: Mon, 29 Jan 2024 12:38:23 +0100
Message-ID: <87il3cv07k.fsf@minerva.mail-host-address-is-not-set>
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

> There will be no EFI framebuffer device for disabled parent devices
> and thus we never probe efifb in that case. Hence remove the tracking
> code from efifb.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Nice cleanup.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

