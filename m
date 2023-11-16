Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B47EDE61
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496C110E5B5;
	Thu, 16 Nov 2023 10:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E0110E5B5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700130189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QKlQrhqsBoYf+hk0vg7TpTavnWCYL+e+GgtfpdfkoBw=;
 b=Y1LgOyOqeS0WFpnpyw6U6fvJ0VH6vERhGsXdM/K9VYiRqE9eFBYfhzR7+iOEu+K15/Lo+p
 7iv2F+Uhin1GcHCPsIuIBrQioQMH1Th6yjOsaaj5A2kVwAR053IPxp8vjJN83sMeWVMi/e
 NL31Bn0Wrl6v9qa7F2HVsbNTFJ6ExBg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-zR1U8EQ0N8aUIENZqxvXGw-1; Thu, 16 Nov 2023 05:23:08 -0500
X-MC-Unique: zR1U8EQ0N8aUIENZqxvXGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4083c9b426fso3239135e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130186; x=1700734986;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QKlQrhqsBoYf+hk0vg7TpTavnWCYL+e+GgtfpdfkoBw=;
 b=KGRYnR3I0+A93+YQFwZ+pJFdW0FF/g8zBrKjaCE/NA7FoXUU0PZLDXOHZEEPknX7BQ
 2Fg/2qPtSfsh/LndT8Psz8jVmRsaXE3mxH+/lOxiswPzmrkvdEOeAk8zbDdhxazDQmp7
 uoP2JsDEr6tyyE8UDiBoBhh/TVd1AXksHs7gp0EkuKgAaRX78RaoleqhVM8kgNr5JtKQ
 GVk2ut2FnC0twmH3EWKZGyzjbV445cLvDF+lSFCmjl2NGTvfyJtZdgKy0noGiL/qIren
 dn4z/ifLv91VZo7lWYRmfeew37NAfm45KVZd51KbLPigogy3rsqhm2GGK3F/wJNLoD5W
 FqTw==
X-Gm-Message-State: AOJu0YydoiWWU8EF7yxgmfFOOlC0waT6do5pnmzYaoHd77EZ4xG2RaLw
 fXc4MM2tFvu9T2VhLOy4I4zAxjuoQkjxg7RlXNC5WlvQTeqIzrjYY35eN9Q/XNFuNfOS3Sg3UvG
 yTMrSBGCi/Rn0GA6PyOvKEHql9x387qWqn6YN
X-Received: by 2002:a05:600c:3501:b0:409:1841:3f42 with SMTP id
 h1-20020a05600c350100b0040918413f42mr1450106wmq.13.1700130186776; 
 Thu, 16 Nov 2023 02:23:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmsPSg5RpSpbHftJGzRUwc+ZPBT7s0miHBuCtvWrca9PPzS4s3f504W/4AegmjrLfXmUevNA==
X-Received: by 2002:a05:600c:3501:b0:409:1841:3f42 with SMTP id
 h1-20020a05600c350100b0040918413f42mr1450087wmq.13.1700130186451; 
 Thu, 16 Nov 2023 02:23:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b0040841e79715sm3015109wmo.27.2023.11.16.02.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:23:06 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 09/32] auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-10-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-10-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:23:05 +0100
Message-ID: <87ttpm3sl2.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The ht16k33 driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Robin van der Gracht <robin@protonic.nl>
> ---
>  drivers/auxdisplay/ht16k33.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

