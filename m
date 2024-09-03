Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABAF969BC1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7520210E4CF;
	Tue,  3 Sep 2024 11:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fwBl5q46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5E410E4CC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SOwnsv9Ex7Dst0oT+vzWucUQJDjqV43haxzxxhRT6eM=;
 b=fwBl5q469qlqd2Jyq5g4IqDetaUSswqIrZc1zAB18e1uw+JSUEAbsIuBKn5yr7/N27SUSP
 BVNFSTiMD2TlcHxyj8LSAPrnMOC/eqpxGuXrYm47+FkRYOP8RT9Sr/dnVywMvYYwt/3HiU
 zWUNgXKit0fP349xNsKQDIRNKsbENhk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-uVmSFHNIMjqJWLxAKfvnDg-1; Tue, 03 Sep 2024 07:29:08 -0400
X-MC-Unique: uVmSFHNIMjqJWLxAKfvnDg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374c294d841so2331020f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362947; x=1725967747;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SOwnsv9Ex7Dst0oT+vzWucUQJDjqV43haxzxxhRT6eM=;
 b=F1srgeUJAhz04F3rG+fxW1U57UOT13udk9kjmfh8k8TlOQNnou6Ck60U4PpMldGykI
 C6Bpjr2Ben4F9QUrmhu03/AOO8hdQDAZxK9jnXdaZTkTB8THf7GjthkQJ3V4jMrupckN
 44w9XWt58YDAKeIcRrc0bqUDdnlSeq77roRyeQSZhMOMgPyhaUV/k3qBEb9Wt6Dsh+J9
 X7uuEz+eEHUicod4r/tP5VH8vsNFFEKKbwMQWDAEzI+CpIenbw8dAyvcGCw5yaeTVRBp
 rXGq2/Haxr+4jmgrG4OyDID2BBUnP8mUTYOugJgV9610/EOinjt8fnVAQfxLaDL70U7Y
 KSjg==
X-Gm-Message-State: AOJu0YwUO/Yej4tPCa2bLqI/fopffUEhr/0H3YFGChK1cr6eHWyd/JWI
 c0RjzQOAOkeSWELMHT+wO1l4oDL6FKcSUbVmCWtRaob1otFBAk6ZKCH4lbVzo7sVWNZCjf+4n5d
 OibhWdKmtEXqBo16yphEsAwz6X1v/HQv0SIbIvHunw+d8rzBuraiq1hPaAKrK7APxFg==
X-Received: by 2002:a5d:5309:0:b0:374:bf85:7d74 with SMTP id
 ffacd0b85a97d-374bf857f23mr7600177f8f.61.1725362947576; 
 Tue, 03 Sep 2024 04:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFplzXWPnS8z1FVY1e2/1mWosdqwoo68I7PXq6d9DOV9oX5IACg3DEStSkSK8s6tqHoRzr8g==
X-Received: by 2002:a5d:5309:0:b0:374:bf85:7d74 with SMTP id
 ffacd0b85a97d-374bf857f23mr7600141f8f.61.1725362947101; 
 Tue, 03 Sep 2024 04:29:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c9487bebsm6146536f8f.94.2024.09.03.04.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:29:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 30/81] drm/mxsfb: Run DRM default client setup
In-Reply-To: <20240830084456.77630-31-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-31-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:29:06 +0200
Message-ID: <875xrdf01p.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The mxsfb driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> v3:
> - fix driver name "msxfb" to "mxsfb"
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

