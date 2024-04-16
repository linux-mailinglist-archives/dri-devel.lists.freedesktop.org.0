Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6658A6B59
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F210112083;
	Tue, 16 Apr 2024 12:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U0ek+2dt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D33910F6BE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713271374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jp49m6q3lvmw6iA15TwLy3GUIM4dsmTXh/SR2TtsRNM=;
 b=U0ek+2dts35NsgJNeaUv3mHxo0vpfGllhA1DkB+Nia9tOOmq9kdwoOizHUSaXSwW9rwm55
 56N80xxL6C9KrJ3MVg6td+QY3hLu7u4ILayQmQZS2sMRj6Xb3ts+g/ZDCfuMHO2tsCDv6B
 UHq4LwLHPRK09I4JZ9mcdaW5V+yL6F4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-JzkolZvQM1KZSe-obXSeEA-1; Tue, 16 Apr 2024 08:42:53 -0400
X-MC-Unique: JzkolZvQM1KZSe-obXSeEA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-34619c30076so3056271f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713271372; x=1713876172;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jp49m6q3lvmw6iA15TwLy3GUIM4dsmTXh/SR2TtsRNM=;
 b=aKtXfA9UvvISblpQf6hKNB8oLg4679X0OgO3Ce1Ruj3tS9YhCKkO5eVmOBnvYaI02w
 gSsNKFQZZBYMhMl360SYpHYFy5a1einGSKop+9PFNqZ+UMgHTFCDmGFd0hiEgUEwRXdv
 vvBkKYqKs4UiTunZzdqFZ6YBBpOpWlgEV/5zpBilMljG6NEzAYS26/FuRiSELGA7XZH6
 1ltTWi2MkH6B5UPZ0gsllnKDcSutD78UfRTqXulxIoss5cgbO4pwndCtZ+/B3QsJrkWM
 XYyTFjBcs6isN0YSMa1w8D+LPyKajIUFjf0lfHC7si0QMN6uJVFN8lARekJlgM1y0Lnb
 D3Ow==
X-Gm-Message-State: AOJu0YzhyX/UtjGlnESKsYGvJvDaWf8mWBlfUur2PnsU6sULe1odc5OE
 NsCX88pjVeESypk+qfZKH1/W5FQFKqdzOHfucM7APuPTNdabi+hfYa0Mq1thsuxwJsBiHCvpGkx
 +ZrouT3HoFq84AyJgjMvjBwTnrtn/MqPDQNs2Yse7CgmC/gDbHEHbtpXkDDkh3d6n6g==
X-Received: by 2002:a5d:59ad:0:b0:343:96b2:c12e with SMTP id
 p13-20020a5d59ad000000b0034396b2c12emr10492730wrr.15.1713271372086; 
 Tue, 16 Apr 2024 05:42:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWAwkGQawPnsu/BKlaYNsy3l/ywFd+6gzgL6urgpasKJvexa/njCiAedgEaXEOrEB/bm/ZGw==
X-Received: by 2002:a5d:59ad:0:b0:343:96b2:c12e with SMTP id
 p13-20020a5d59ad000000b0034396b2c12emr10492712wrr.15.1713271371692; 
 Tue, 16 Apr 2024 05:42:51 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r26-20020adfb1da000000b0033e745b8bcfsm14963657wra.88.2024.04.16.05.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:42:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 43/43] drm/fbdev: Clean up fbdev documentation
In-Reply-To: <20240410130557.31572-44-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-44-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:42:50 +0200
Message-ID: <8734rl5vhx.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Rewrite some docs that are not up-to-date any longer. Remove the TODO
> item for fbdev-generic conversion, as the helper has been replaced. Make
> documentation for DMA, SHMEM and TTM emulation available.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

