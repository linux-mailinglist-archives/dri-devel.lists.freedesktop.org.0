Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB00969CDA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C09510E51D;
	Tue,  3 Sep 2024 12:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C4MYhrF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A188010E51D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NHMOo9WHt2Js8QMS+ivCDnsW0bhD6c2SxEScDuVLqTo=;
 b=C4MYhrF4Q2v2qEFKHC07jj+Q+dL4DT/kPdhoeG3VY1ty+vL5z5GKQE4q2V0doP+THhuvHY
 vHRcaoWeWRs4gkMU5Q41ilvrStCV51SH2twnsfDz083g3jLTKuKJGLd7rAtsjWYUaujJMw
 wN4LQ+7BoajJgBOwBfjQpR6mDqbg9cM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-4njbeCQJOsqHf1fPhD4rRg-1; Tue, 03 Sep 2024 08:05:32 -0400
X-MC-Unique: 4njbeCQJOsqHf1fPhD4rRg-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5343d2af7easo4768450e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365131; x=1725969931;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHMOo9WHt2Js8QMS+ivCDnsW0bhD6c2SxEScDuVLqTo=;
 b=O7Zuz48WtZaFfoEvgQPCXsf9EzgnBToQZc0HuvKbA2F+53tAn7Y/kWo5bJ8t7qZSAs
 G1ObWWhsXkYFtnNgEM64hunlwKM7S/ZTU876KI9kWL6F7hCutSI9+DmVI9wrb6mRjEu8
 uZMpyqo1eHhy0KzndPgBSI36h66ClrD4YXJ3qgy7DqyWWtBvn/7Qea/QO0PLszaS7GcD
 pA1KViEyWwkUU4FTEJxZlR8HHmSD18ZF4dDp3j1zUPVnaPLk08MFIfX/hNS+oF4IkSi8
 B4ZmyUw8UZISs+PlId4kziJYCeeaIPGq17etMHp7UVBjHn5+9ZEKg4MXjpeINfAhA7yR
 xuFA==
X-Gm-Message-State: AOJu0YxYinyngBmh3OnrPUISzBxW+ruT3AaG6rLxalySm6lC5/56sIi8
 OIlXpCODqiTm66oCkJG/8WbuVFhunJIyjEZQF2cGAqHoPVEQKyyzQxgsIVhG3wzH3sotXQDDvP3
 4rsUoGubFol4VZenKHtS8ow92sDpZFrgKJK/jZxLebBumHyebpN/VZ3q8p2iZq9+8uQ==
X-Received: by 2002:a05:6512:10d2:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53546aff5a3mr8192620e87.20.1725365131111; 
 Tue, 03 Sep 2024 05:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpghN3bq0VjJ2vU/J5Df8ul1O4uqOm+Qk8JhPzaDhtvMoqfngbzTsco324Pw6cFzJjTlVtzw==
X-Received: by 2002:a05:6512:10d2:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53546aff5a3mr8192591e87.20.1725365130473; 
 Tue, 03 Sep 2024 05:05:30 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4ddc8sm14049200f8f.21.2024.09.03.05.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:05:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 64/81] drm/fbdev-ttm: Support struct
 drm_driver.fbdev_probe
In-Reply-To: <20240830084456.77630-65-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-65-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:05:29 +0200
Message-ID: <871q21djsm.fsf@minerva.mail-host-address-is-not-set>
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

> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and reimplement the old fb_probe callback on top of it. Provide an
> initializer macro for struct drm_driver that sets the callback
> according to the kernel configuration.
>
> This change allows the common fbdev client to run on top of TTM-
> based DRM drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_ttm.c | 142 +++++++++++++++++---------------
>  include/drm/drm_fbdev_ttm.h     |  13 +++
>  2 files changed, 90 insertions(+), 65 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

