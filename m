Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A213D0888A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED6010E886;
	Fri,  9 Jan 2026 10:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KF9tGq8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC3910E886
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767954252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pym140T9WEuciOsv6f5sDVH99vBIoa9ppIjVo6ZnmJc=;
 b=KF9tGq8wix9it49Kt6UYaschTsAN1E+zBQWmljlQpG6k9oj1etSN9s+XG08k91ZjF7jHBA
 iG92Vxf7geCDwA1lZIeyzL25GDFafp/C3WxijJjWwt3Uiikg8vWNHf+8rzF3BN1OKzpXg8
 1d5fKnjyxuwHaso2aby/VKLLuQdb9Xw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-A-w-0cWfMwaxDtuD14lN4Q-1; Fri, 09 Jan 2026 05:24:11 -0500
X-MC-Unique: A-w-0cWfMwaxDtuD14lN4Q-1
X-Mimecast-MFC-AGG-ID: A-w-0cWfMwaxDtuD14lN4Q_1767954250
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477964c22e0so22956415e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767954250; x=1768559050;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pym140T9WEuciOsv6f5sDVH99vBIoa9ppIjVo6ZnmJc=;
 b=FFk9ekGYfFMAUojvSrDE+W+Gb5sPffChvxnvC4CPbSkYBte2DNaCvnhI2L5Uq8LN5q
 ziHtqyfnSjJ4hU/VZ97nHkbjtJUGi3xZuS4TcfqzUfdwh8lg7YJ4usbk2GhLVHEo3QuP
 swAfALGE+FRP8wNbA2nkV+YjmagSBVZwSE92xVQ9A7HfU6AEPxqH0JfTkuVoxlhdF0Mt
 Snjwpbcj7iaWIHbWXeMBW3fEpRFVWVCv5t1czc5z3KczFBhUVHUdAI3W3+lGtaZy3kDb
 CJ9qZmRbIk3kj/VKVHKwFV34T6+Q588aLssbyuZH4TOVJzKCooqaJiBhFg7wLom+mCRy
 11BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjVkNYbLpFPvPccTXnkIkxiVZf8+sOlbxPx5bzpv1V5GJnj3vwIVRb713bwQ1RLr1aTUq3sBvblrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE3uH701ZnwNjZ/Uo2L6ll6g71VgMygMG0gWDHdSC4fYULOy/2
 t8waleKO9NHuAOagOTZTnnvbNaHAf051hIZm/EKxSf7FDOqILjl4nDMNZYYS5unqHIVH9VnfIBt
 eZOmcNJ9QaZ4RhU3wweZMG5TeydQQtiGWxOrCzoR1jkz1tZbospv2/2+GUDSnMCCmrTkHiQ==
X-Gm-Gg: AY/fxX78s0GJzEve9bm2Q3YNxfw0zCIKtyPW81iHil46InLe4PcaccgKcp3hqT0vQl1
 ifyWvUPpZ0Hmc8dqu4/Gty0pfn39GK91sA4JeIhyO81pwaJ1f2jmRYKDBWngI7w808IfhdrL4gQ
 6V8xKe/bZHzrpaTsVoj3UgrSkCnGfoRp75515skQFjyqkQ2Ebf86y/1MawEp7J3Abz7/evynCpL
 E+1C1+mzFURXCwfQWJexW+FiuQSiELYCpgRjTstOZvTARDvaUSy6lxbxKsqFGRB5DqoxtrJK+Pd
 Zq9pLCaWxxet14m5sDMCtfYbkkNtm9RESZPPEB1dmUPwYF2XTb0bLC9PlcTU5240jDIBLzE20r3
 /4ZH//OCmKa/Ey2Qg/j4r62OEb3EsrUm8SAOn+k/40HWFfVREm5hOKoigaEWDgkRx8owx
X-Received: by 2002:a7b:c358:0:b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-47d7f616248mr101203945e9.11.1767954249739; 
 Fri, 09 Jan 2026 02:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhHr+oRWV9twPID3yI7aHXNGJDxSzEl4qHGGDumKDgymP0EGzgtIzqbhIhrME3WHKV5ytk6w==
X-Received: by 2002:a7b:c358:0:b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-47d7f616248mr101203795e9.11.1767954249369; 
 Fri, 09 Jan 2026 02:24:09 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f70bc4fsm196128645e9.15.2026.01.09.02.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 02:24:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/8] firmware: google: Init coreboot bus with
 subsys_initcall()
In-Reply-To: <20260108145058.56943-3-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-3-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:24:07 +0100
Message-ID: <87qzrzf5iw.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6c2rU8WxfG6GbgMjpl3D4x1iBingaBVxcTnubMo0_-E_1767954250
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Using module_init()/device_initcall() is too late to initialize
> the coreboot bus, as there might already be drivers that depend
> on it.
>
> So far this hasn't been a problem, as coreboot controls all device
> creation. Initializing the coreboot bus earlier in subsys_initcall()
> will allow for external coreboot drivers to register themselves
> with device_initcall(). Prepares coreboot to support additional
> coreboot drivers from other subsystems.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/google/coreboot_table.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
> index c34426e5002d..3bee22d2a7b3 100644
> --- a/drivers/firmware/google/coreboot_table.c
> +++ b/drivers/firmware/google/coreboot_table.c
> @@ -268,7 +268,7 @@ static void __exit coreboot_table_driver_exit(void)
>  	bus_unregister(&coreboot_bus_type);
>  }
>  
> -module_init(coreboot_table_driver_init);
> +subsys_initcall(coreboot_table_driver_init);
>  module_exit(coreboot_table_driver_exit);
>  
>  MODULE_AUTHOR("Google, Inc.");
> -- 
> 2.52.0
>

I agree and is also consistent to the init call level used by EFI, PSCI,
SCMI, DMI, etc.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

