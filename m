Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9765A7EB4BD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A398110E46F;
	Tue, 14 Nov 2023 16:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CE910E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699979317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zT55sICneOruB98vZghCPIaAQzAuT2+qJvhhUcjEcFU=;
 b=XkBq32wEBh2K4uBSL0gBD4FbCaIaLCkSfXN9oHb7Gi8BKTYLsKuMNqtuHEg8wcmLjclaEM
 BfAjOt8gVbwC7n2iE91LCm4EKwZQayNeFx8BVSqaCrLbETAl+lBX8x2vvTdL0E3C5bRF+7
 TQOzKaQlNXZJYpfs/3JFnmkeUVFzSME=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-sg3o7EMiPm-vv-wmYqo-qA-1; Tue, 14 Nov 2023 11:28:35 -0500
X-MC-Unique: sg3o7EMiPm-vv-wmYqo-qA-1
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3b2ef9e4c25so6840681b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699979315; x=1700584115;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zT55sICneOruB98vZghCPIaAQzAuT2+qJvhhUcjEcFU=;
 b=lRushDoMYLYiL+8QsgA93JApIPa9kLh+plS5anod2/Dr8AzNPv5aT7R//x5DF7g/py
 I0q2EBJC5gIahgDQ9eWTf4TeJudDkoUDpVe1/hQ5lQVYVhq+7vfWTzRdJLbteYVYrT8Q
 DqOm1+2nXSZAChjXiZy5dpdylNpC19gEGjsr/O6UBI8U18CUzKyc7fRke5l1PKHdxbqY
 4AAVPkPo1VjzWhgO9H8my0Nzh16b1DeeJS5QoMTgBh42xBJFbjj8Dani6KJWpVmBQbys
 ESfqagLThnKHZT/cbCiyTdUbWjJfUa4RXNKk2EHHl5GfhHF3Yh7Dpqa6ff7+LOJDnBJL
 EOyQ==
X-Gm-Message-State: AOJu0YwGijPODrW8l0LRgEvdc2LJnHRHwDti4XVZeVp0edueaF/9TapZ
 oD97SVTwNYsrKT/bfy7P8uuGX0p3y2/aJnoz4z4ho4m9VmGdNlrlCbacgTRdJlyry34GsH1mGb7
 IEGrYmd2VGYh3xW4WMCf268tIEKKn
X-Received: by 2002:a05:6808:1b13:b0:3b6:db1b:67be with SMTP id
 bx19-20020a0568081b1300b003b6db1b67bemr12820707oib.16.1699979315231; 
 Tue, 14 Nov 2023 08:28:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCs4OZHiYJNQd+EbwIGjg3wDC1a9KzyEDPS/n5hkAeLDacLMu9zBSwKsOA9Yp+3SBU3M3l2g==
X-Received: by 2002:a05:6808:1b13:b0:3b6:db1b:67be with SMTP id
 bx19-20020a0568081b1300b003b6db1b67bemr12820694oib.16.1699979314953; 
 Tue, 14 Nov 2023 08:28:34 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 t26-20020a05620a005a00b0077263636a95sm2768517qkt.93.2023.11.14.08.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 08:28:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm: Allow the damage helpers to handle buffer damage
In-Reply-To: <9296c184-22c1-4d71-8b11-2d26f49a5790@suse.de>
References: <20231109172449.1599262-1-javierm@redhat.com>
 <9296c184-22c1-4d71-8b11-2d26f49a5790@suse.de>
Date: Tue, 14 Nov 2023 17:28:32 +0100
Message-ID: <87wmuk5mfj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-doc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sima Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier
>
> Am 09.11.23 um 18:24 schrieb Javier Martinez Canillas:
>> Hello,
>> 
>> This series is to fix an issue that surfaced after damage clipping was
>> enabled for the virtio-gpu by commit 01f05940a9a7 ("drm/virtio: Enable
>> fb damage clips property for the primary plane").
>> 
>> After that change, flickering artifacts was reported to be present with
>> both weston and wlroots wayland compositors when running in a virtual
>> machine. The cause was identified by Sima Vetter, who pointed out that
>> virtio-gpu does per-buffer uploads and for this reason it needs to do
>> a buffer damage handling, instead of frame damage handling.
>
> I'm having problem understanding the types of damage. You never say what 
> buffer damage is. I also don't know what a frame is in this context.
>
> Regular damage handling marks parts of a plane as dirty/damaged. That is 
> per-plane damage handling. The individual planes more or less 
> independent from each other.
>
> Buffer damage, I guess, marks the underlying buffer as dirty and 
> requires synchronization of the buffer with some backing storage. The 
> planes using that buffer are then updated more or less automatically.
>
> Is that right?
>

In both cases the damage tracking information is the same, they mark
the damaged regions on the plane in framebuffer coordinates of the
framebuffer attached to the plane.

The problem as far as I understand is whether the driver expects that
to determine the area that changed in the plane (and a plane flush is
enough) or the area that changed since that same buffer was last used.

> And why does it flicker? Is there old data stored somewhere?
>

It flickers because the framebuffer changed and so the damage tracking
is not used correctly to flush the damaged areas to the backing storage.

This is my understanding at least, please Sima or Simon correct me if I
got this wrong.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

