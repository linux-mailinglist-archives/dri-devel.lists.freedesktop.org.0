Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905369A7AC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85F410E2D9;
	Fri, 17 Feb 2023 09:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ECF10E2D9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676624447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B97UIS8ie9w9KzGcrCkLog9xnQRWw2knn3o4yQp4rpI=;
 b=MwYIGAWc8S5LqW4Nuv0J7smDVWTC/n6+7Da+Syno07+L6jz0buX/vggwRMuJpDw5yjeGCE
 s9lUTxwy1+q9++AIKW6/nKA89zG6YbL5SN9l1VkBBHnid5WLPATFXeUUC+fIZ20p9JChn4
 6kZeXz42XYbZHWisBPzdfcM2/RyLgoc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-iAfde2KGODy-di6m2JyLQg-1; Fri, 17 Feb 2023 04:00:46 -0500
X-MC-Unique: iAfde2KGODy-di6m2JyLQg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n21-20020a7bcbd5000000b003e21fa60ec1so833735wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 01:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B97UIS8ie9w9KzGcrCkLog9xnQRWw2knn3o4yQp4rpI=;
 b=5kANjIgVGvOCXPlmCxV2mBE3ChlQ1066j2bn4FtWnp8gaacidqNyFV7ttpNX1EpHap
 RiiBE0SmtEBvtCaIY3E48vay67t88X0z5kmdxKDIZUm7/Z7Er1HLUVYukh9OmgvoDNUo
 F1/vN8EMOizF3cQeODIvFfEUAA3FNr6ujgF6n6UQ8T4TOGSGHGFiRhwNR70TeubwbNaK
 XLsnGcaT4M9FBzD5A9ZzNFU2fO/EeFGa7RmmjEY+alqNFgVeV4B7x7RZ1uNsFPekaxTs
 j0wt6Vxj2zCGnZq6bXHSFe9VVU9j+BNPUKI/aDbCbjNyEq1k+w3mhraS1uKarDY+Ysem
 oelg==
X-Gm-Message-State: AO0yUKW31Hbri+OhUiRTlxQsAMUfdRm1DJKelf88dJHOwOeC367+aUXo
 M5GLCfe0LhhLA6VcA/FTrUYDCHCkXUL4nalfUBFJ1gH07pwY3B7rxxRK2oVeRwVqIa0rZw0Jdil
 7wl6LoR3OcQjaT/I917lGGkSKptjA
X-Received: by 2002:a5d:5144:0:b0:2c5:5d1d:b244 with SMTP id
 u4-20020a5d5144000000b002c55d1db244mr7050966wrt.29.1676624445658; 
 Fri, 17 Feb 2023 01:00:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+GAEaS+cnDn75pZnbKNpaEwNXZM1nwMs4PYXOVZhHBD2pvwDjNBKmLaq3OkX/jJUVj+CLJgg==
X-Received: by 2002:a5d:5144:0:b0:2c5:5d1d:b244 with SMTP id
 u4-20020a5d5144000000b002c55d1db244mr7050941wrt.29.1676624445403; 
 Fri, 17 Feb 2023 01:00:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f18-20020adff592000000b002c592535838sm3149086wro.2.2023.02.17.01.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 01:00:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 08/11] fbdev: Handle video= parameter in video/cmdline.c
In-Reply-To: <20230209135509.7786-9-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-9-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 10:00:43 +0100
Message-ID: <87pma8wts4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Handle the command-line parameter video= in video/cmdline.c. Implement
> the fbdev helper fb_get_options() on top. Will allows to handle the
> kernel parameter in DRM without fbdev dependencies.
>
> Note that __video_get_options() has the meaning of its return value
> inverted compared to fb_get_options(). The new helper returns true if
> the adapter has been enabled, and false otherwise.
>
> There is the ofonly parameter, which disables output for non-OF-based
> framebuffers. It is only for offb and looks like a workaround. The actual
> purpose it not clear to me. Use 'video=off' or 'nomodeset' instead.
>

s/it/is

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[..]

> +#include <linux/fb.h> /* for FB_MAX */

I believe including <uapi/linux/fb.h> is enough here.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

