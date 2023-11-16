Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1F7EDE2A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A24E10E2E6;
	Thu, 16 Nov 2023 10:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A46E10E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700129124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JSNlp1+/gXMtVqoR/aOQ3Vuht8AOWTyGnk7nVUalkfI=;
 b=bAjWQqvmMUS55wU7WG/5AHFCLuHPa5Jc5VV4sx+Y7K/09mxTH9caV3VOWXdrX136csZ/uY
 wXN6dmM7DWVQdlnWyGxkaeooOZ7JyfBrzvHsHvfbW5ZSrjrYtfNDoqqXYmmY42v3SAIDjl
 XSaIQG3RgTW0F4KkEPw2m0bB6T6UrM8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-tro6BsmgMc29rptaQxyO9A-1; Thu, 16 Nov 2023 05:05:20 -0500
X-MC-Unique: tro6BsmgMc29rptaQxyO9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-407d3e55927so3207585e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700129119; x=1700733919;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JSNlp1+/gXMtVqoR/aOQ3Vuht8AOWTyGnk7nVUalkfI=;
 b=fskzelnL/t378NtcxC7tLdj9UMbmVuIwb2NwOQOnpG/gHk6o7MINg+NT57jEpCH573
 4A5sYuuUrhtiJstDKK8r7OcYT8YJGb6tK4Ev9WdofmhkXCTedL2CYs1x1VzvgynyXStx
 rIDWsI2F6fdsZo4NWoce9delQLMv/HFxHSW3m95lUFxyq5pMbds5ZdzckjNDzHy0QDrE
 kbdsRokZaGQsF0sl6XzyuL/leolLQdm/nB2D58+Sc6usrbCnWmzT4S69YPQJ8t8lju+6
 IDZCETYO5PKVpABGgiz8pk6HGhuQgLbAvkB4MXrcFih2MmoN7PDtEl9M7aB5saAgenCS
 lf6A==
X-Gm-Message-State: AOJu0YzMOs5iX9uGoxFUBZhfU3TY7rwrWjaeysKhC0hGOW0w4aJscgWm
 krUfLE1tvvN2nZzNJwqOvfy1ZnPIlXwStobjqFVHCQisX8eduEOMoI5srEpwPz3PI67DmiaIBy6
 eprE+F5RUVmkkd1eGtidEqeBuGDnJ
X-Received: by 2002:a05:600c:35c2:b0:408:80bb:ae80 with SMTP id
 r2-20020a05600c35c200b0040880bbae80mr1643803wmq.7.1700129119542; 
 Thu, 16 Nov 2023 02:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxq1W8dzn6d2MNNVy3msexF8xkL5g5RWLNAmn7R8Fnb73BFw9CCJrcGUUn/q5NdHTcxCRO3A==
X-Received: by 2002:a05:600c:35c2:b0:408:80bb:ae80 with SMTP id
 r2-20020a05600c35c200b0040880bbae80mr1643785wmq.7.1700129119125; 
 Thu, 16 Nov 2023 02:05:19 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b0040a45fffd27sm2953271wmq.10.2023.11.16.02.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:05:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 05/32] fbdev/arcfb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-6-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-6-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:05:18 +0100
Message-ID: <875y2257z5.fsf@minerva.mail-host-address-is-not-set>
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
 dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The arcfb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jaya Kumar <jayalk@intworks.biz>
> ---
>  drivers/video/fbdev/arcfb.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

