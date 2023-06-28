Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EDC740B83
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 10:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D34810E0D8;
	Wed, 28 Jun 2023 08:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF8910E0D8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 08:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687941016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ApG6hMWlnS9hoH62vhH0JNe7ckxdS6FY4NP6m2BcCZ4=;
 b=QqZ7SwI9I9GGyXxAyoIWtysK2E3G9ZSSp+8eK9gIXOdBRR/iG/EQDjpdANkxK3MCNnrKma
 jYhxbdrLgWhf/pcoi8MH1KOqJlpzgN9m7nKcupZcP5YouT2TIyfJQTRubPHxZNdMVxhx9B
 6KCeWjtQvQcsVuSXBd4+L6R2AalNKXY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-joV-mzr2NDCaCSVu9DATNQ-1; Wed, 28 Jun 2023 04:30:14 -0400
X-MC-Unique: joV-mzr2NDCaCSVu9DATNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f81dda24d3so69903905e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 01:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687941013; x=1690533013;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApG6hMWlnS9hoH62vhH0JNe7ckxdS6FY4NP6m2BcCZ4=;
 b=dxX7EJsbvc7rvwSKLhuDjGQFObtH7pmZa/FK6puBPAgSNDA9pazAHiCvBGQqX+kVSa
 X8pO0diylTmzBZH4KX6UpL49ZqqBgRBOqPkCGm6jM10jVL5xhCjW2SUA+sg/jlpto6zH
 DMZygvVDaQXWynL5Lg/Q78ubfHlrUrVXr+Gfz29KipvmxGk8UML12lsib3FqN6X4bHDB
 RPdktqNCcHR5UF+XsBKrBek/WFZzyxCYvqgEm1DYZdn0Qcv52ht1wYf8YZ7cWz1fI/JO
 vLMldJxLgDYCgZIWQ2DQQIGpcxotHVonjLCd2lbpHg1iABOafrrMs6C+IKHv+dHQoOKo
 d9VA==
X-Gm-Message-State: AC+VfDxl/tIYgj8JnpPbIe49PN76xcXuu+3374IrTojq7ArjN4nvIUW2
 PEzdNkXfEOQVKbqfr0ZMZr/WFBN4xW0ryH2nBaIDQK0/xOGuM+28cDCVA1kdXIPw8ilSjUIDpfK
 fLaKNJ/IpEHzNzSZGY1XQn6SRyu11
X-Received: by 2002:a7b:c3cf:0:b0:3fa:85ad:6672 with SMTP id
 t15-20020a7bc3cf000000b003fa85ad6672mr14912338wmj.41.1687941013010; 
 Wed, 28 Jun 2023 01:30:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4H90ckBjmpbrFqmN6S5qxkRXqL19nad9ZdwOqm43Gr7bDntrPFCkeFr1JYMnB+FTX580R+dg==
X-Received: by 2002:a7b:c3cf:0:b0:3fa:85ad:6672 with SMTP id
 t15-20020a7bc3cf000000b003fa85ad6672mr14912314wmj.41.1687941012676; 
 Wed, 28 Jun 2023 01:30:12 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 hn10-20020a05600ca38a00b003fba586100fsm4093706wmb.6.2023.06.28.01.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 01:30:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
In-Reply-To: <20230628105424.11eb45ec@eldfell>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org> <20230628104106.30360b55@eldfell>
 <20230628105424.11eb45ec@eldfell>
Date: Wed, 28 Jun 2023 10:30:11 +0200
Message-ID: <877cro2dm4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, banackm@vmware.com, krastevm@vmware.com,
 dri-devel@lists.freedesktop.org, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pekka Paalanen <ppaalanen@gmail.com> writes:

Hello Pekka,

> On Wed, 28 Jun 2023 10:41:06 +0300
> Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
>> On Wed, 28 Jun 2023 01:21:27 -0400
>> Zack Rusin <zack@kde.org> wrote:
>> 
>> > From: Zack Rusin <zackr@vmware.com>
>> > 
>> > Atomic modesetting code lacked support for specifying mouse cursor
>> > hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for setting
>> > the hotspot but the functionality was not implemented in the new atomic
>> > paths.
>> > 
>> > Due to the lack of hotspots in the atomic paths userspace compositors
>> > completely disable atomic modesetting for drivers that require it (i.e.
>> > all paravirtualized drivers).
>> > 
>> > This change adds hotspot properties to the atomic codepaths throughtout
>> > the DRM core and will allow enabling atomic modesetting for virtualized
>> > drivers in the userspace.
>> > 
>> > Signed-off-by: Zack Rusin <zackr@vmware.com>
>> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > Cc: Maxime Ripard <mripard@kernel.org>
>> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> > Cc: David Airlie <airlied@linux.ie>
>> > Cc: Daniel Vetter <daniel@ffwll.ch>
>> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>  
>> 
>> Hi Zack,
>> 
>> I still do not see any UAPI docs for the new properties in this patch?
>
> If you are wondering what there could be to write about, maybe this can
> give a good mindset:
>
> Let's assume that I am a Wayland compositor developer who has never used
> "hotspots" with KMS UAPI before. As I have never tested anything in a
> VM, I have no idea why the kernel would ever want to know about cursor
> hotspots. Display hardware never does anything with that, it just puts
> the cursor plane where I tell it to and composes a single image to be
> sent to the sink. The virtual driver VKMS does the same. To me, a
> cursor plane is just another universal plane that may have weird
> stacking order, pixel format, and size limitations.
>
> Ideally the doc for HOTSPOT_X and HOTSPOT_Y documents not only their
> possible existence and allowed/expected values, but also the reasons
> to have them and what they are used for, and that if the properties
> are exposed they are mandatory to program in order to use the plane.
>

Agreed with you that this documentation would be very useful. When I first
noticed that the virtio-gpu was in a deny list for atomic KMS, it took me
some time to understand that this was related to the lack of support for
cursor hotspots in the atomic API.

Another thing that could include this document is how user-space usually
deals with the lack of cursor hotspot properties in drivers that need it
(i.e: falling back to software cursor rendering as Weston does). And that
for this reason the cursor plane is disabled on these drivers, unless the
client advertises support for it with DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT.

I think though that this could be added as follow-up and not block this
series, which IMO are already in a good shape to be merged.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

