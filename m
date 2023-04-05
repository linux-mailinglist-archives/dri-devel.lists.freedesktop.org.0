Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B36D7B62
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA75710E8EF;
	Wed,  5 Apr 2023 11:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FC710E8EF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680694308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DdvlAOB2HBtoxdSNuZT4WKN+Yt+RUmrcPHkXhNSXjuo=;
 b=g8WdMuY81EJmL5GZxq9i3ONAMJU+dwkuBob3u2BD66IPTpyzERouTJzVugQ7D8pRR/hjRz
 1NOJcF9uiQq7v6hRR/sVXorGQxpHKLDJLOPXxPwerHfQPLWDp2Lzyu7zW2ra9MZ5rj08mo
 UZ1dlmcIFgZn4BtXN+xVq+Csaqzm3OM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-LZFl6N2TMUKX4tdtQ5dw_w-1; Wed, 05 Apr 2023 07:31:46 -0400
X-MC-Unique: LZFl6N2TMUKX4tdtQ5dw_w-1
Received: by mail-wm1-f72.google.com with SMTP id
 l16-20020a05600c4f1000b003ef6ed5f645so13996659wmq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680694305;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DdvlAOB2HBtoxdSNuZT4WKN+Yt+RUmrcPHkXhNSXjuo=;
 b=Y2vJLlxX8UT+fAfDfBLJV95zPGAhDE10ILalsp4+H0kF718g+43BdChAndpaEU9sZo
 F812rOgWyJ4dJt7oNyccCCStGdlBd2VgjcV9WMx2DfCmqtqqkEUlPp0z39sxjj6k/7VO
 +C0unqKHz6AVI/N9bBYEnR/MpYNi9QXTMfzh+oLqQ55LMRIKf0PmbuSiJxr7/JjZzbbR
 GATxDdoRAktoIH353ivIKWL9hCiKdYpVur7Bs5Z6qAl/HXRCeoiQsp8bbs2MCzGiGHL4
 X5UkTqZVbiIy4Vop4tJNaRpcL1Sn3f1lz0T0ZcFn3xF39niJrdYtxsGr7UD7IUjIseKy
 9rOg==
X-Gm-Message-State: AAQBX9dov6RFfLo5DKucW/Jg7WXrRRiQjYZvm8usPANSspH/qfx6lYoR
 gOOW2KEZ5YiplTlNhFNQSeAT/lFKXQMjlD4ovSuuCA2HCwQMxKffOvXk424H3j/n422iRaib9QR
 /YObkcdUuG668Yhka3JDNCIbT5Pwj
X-Received: by 2002:a05:600c:22d6:b0:3eb:2da5:e19 with SMTP id
 22-20020a05600c22d600b003eb2da50e19mr4612740wmg.27.1680694305744; 
 Wed, 05 Apr 2023 04:31:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350bgJR+9jItxcQrvJsguKxNFfDjUdTz+JTjRLTm6qB71szWLKTQghclWZR4h05St1GZL+1Uwmg==
X-Received: by 2002:a05:600c:22d6:b0:3eb:2da5:e19 with SMTP id
 22-20020a05600c22d600b003eb2da50e19mr4612726wmg.27.1680694305488; 
 Wed, 05 Apr 2023 04:31:45 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c210d00b003f0373d077csm1879783wml.47.2023.04.05.04.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:31:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/8] video/aperture: Only kick vgacon when the pdev is
 decoding vga
In-Reply-To: <20230404201842.567344-4-daniel.vetter@ffwll.ch>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <20230404201842.567344-4-daniel.vetter@ffwll.ch>
Date: Wed, 05 Apr 2023 13:31:44 +0200
Message-ID: <87y1n6bm5b.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> Otherwise it's bit silly, and we might throw out the driver for the
> screen the user is actually looking at. I haven't found a bug report
> for this case yet, but we did get bug reports for the analog case
> where we're throwing out the efifb driver.
>
> v2: Flip the check around to make it clear it's a special case for
> kicking out the vgacon driver only (Thomas)
>
> References: https://bugzilla.kernel.org/show_bug.cgi?id=216303
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> ---
>  drivers/video/aperture.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

