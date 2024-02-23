Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA338615B1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 16:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C0B10EC30;
	Fri, 23 Feb 2024 15:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NtXSJU0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2377B10EC30
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708701992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NMMUmN0rsAKL+5iBGI5E5zfAAFbk9zQW3IiqyJQ5Rkc=;
 b=NtXSJU0Gh85K1PjZ1Ohkd6sSteMHWNtW1fORXXZ+ieKj+ySXo2RjpH0RuK7Fn2pa6N+KR6
 Cktbwl+CFrbynPLGNKSb/drc7zTZu/DWlOkQrWJvi+J6obWmYMwlyA0WbGEV20dcd0ZOMg
 c/Cn9uJDVbcPb1jDPfvqyPJ+d3T9J3A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671--dA7jA5MP621G7R60JDHOg-1; Fri, 23 Feb 2024 10:26:30 -0500
X-MC-Unique: -dA7jA5MP621G7R60JDHOg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4125670e7d1so2325215e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 07:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708701989; x=1709306789;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NMMUmN0rsAKL+5iBGI5E5zfAAFbk9zQW3IiqyJQ5Rkc=;
 b=TPzs0DhA31oEK+AjavSACVQXtkoKIKstK7EF8mH1oDXlCkif758B78ZFqlS4NhFSaK
 ncSXQ6GUsCgaTbcpX4eb57xHFTD/OpgC4+QMeL/DkQCBUvosd/wdDqsBfN9dslncwwQS
 5sD0GAyYhcA7rWfxSTpYsfWF+2CFq0SPX+91szl8hzV+HK5dPeuBFu/PVSc/Rj056wM6
 kCHo/tkyPyu+ZUnWXyUMP2u1zvEqtopEDquPJ74zB5rqB2ApNvBGyrLwZq79fh0nw7vh
 cOOucD6eLmp+Bn5XLkN1owpSb1j1NPGnwbtoqGk/6nME4RdA3+Hro36hfcmXbwkHd4Jz
 PJJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnOSuv397mLjPMawtMwJUfTS0wJOYyXjoMIjJ/W8r+oLt5bIgh66HLcTVvUPyQhZivsJJNFIppuUV3fcls6lJkqcpAOsNIC3RHShUpCfIP
X-Gm-Message-State: AOJu0YyBe1ufhcEdsJRHZYq9nsGZpSI1qYVZm98KvxB+yOPmVS534kWA
 zKc83CcJdlXiUw6u3RAp4ExxUs1Lrv7DBt7Rpv0B5F4OSXXldoTBiiHus3hSwXajr2Q5Oyey14m
 JlymhAHfIeTo9wcPKFWNhS6e0Yh4uUytPSIXObe4+FX+LEKzjvedhtzHW1sMrvXauQw==
X-Received: by 2002:a5d:5267:0:b0:33d:47c6:24fe with SMTP id
 l7-20020a5d5267000000b0033d47c624femr97467wrc.12.1708701989504; 
 Fri, 23 Feb 2024 07:26:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrjCqKcGbCqYyjSk784Q5WPDu5Uj5ZfIqXNtJ4iF/sM0sITpc89qmAng+UPf7QsynuMGvlOg==
X-Received: by 2002:a5d:5267:0:b0:33d:47c6:24fe with SMTP id
 l7-20020a5d5267000000b0033d47c624femr97452wrc.12.1708701989155; 
 Fri, 23 Feb 2024 07:26:29 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 bh9-20020a05600c3d0900b00412945d2051sm2516910wmb.12.2024.02.23.07.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 07:26:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <20240223150333.1401582-1-thierry.reding@gmail.com>
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
Date: Fri, 23 Feb 2024 16:26:28 +0100
Message-ID: <87o7c76w2j.fsf@minerva.mail-host-address-is-not-set>
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

Thierry Reding <thierry.reding@gmail.com> writes:

Hello Thierry,

> From: Thierry Reding <treding@nvidia.com>
>
> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> not to remove any existing framebuffers in that case.
>
> v2: - add comments explaining how this situation can come about
>     - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

