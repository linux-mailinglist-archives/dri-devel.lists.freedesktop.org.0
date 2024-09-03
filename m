Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF7969D49
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A96A10E562;
	Tue,  3 Sep 2024 12:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QRXbedfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B8210E55E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=agFMB1xAtcWm4AXKS6Y4zMlSOya0yRuTuGxykObZEjk=;
 b=QRXbedfXe8G3tYryAy2Xvbo+/RhD9AULbNT/PwIDpW0yeCHNzOxKuFW0V0BJBAUWEV1cUn
 UXsBjezJtALgF056D0sHXxA4XaUj/4DpK7IU3qft8nU0nQgzmxKuQ5An6AscMRIRbnWvAr
 YNjmNPKWP2ljG2KeByYfVdp8qZeQI94=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-2pP2QTXjMJ6CKwv9XGj7Yg-1; Tue, 03 Sep 2024 08:16:57 -0400
X-MC-Unique: 2pP2QTXjMJ6CKwv9XGj7Yg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42c78767b90so28959595e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365815; x=1725970615;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=agFMB1xAtcWm4AXKS6Y4zMlSOya0yRuTuGxykObZEjk=;
 b=JUXJlJqCR0drIqva70b0iXxXawzZZUhYlfE6i0gKajOfsgd7unBTGhGw3lakTSaxJQ
 T+SWsHNFK2S1IuO1j6b9R/Dn5CMX3UQpFxzlP7SxVL721QR6GrFxxUme/I3HuViCfs1X
 0pVWhCbIaJhMPg19lWMVBVS2pXXklrX/yuR//y0cBLFGF73nhPHR+nDl7fEFNtzIeDk3
 /I4nCXIONsu5PHKCT+uaoZYcIHVOWjjiQZrEcCd4R1w//xC0T7uj3iU35J1VcBjg7EM1
 nhZM8xuQYD6TwobGkmWvnI65hWinyAoh08t152bLQeYHUR3bifVgECOjWUJJtienYSLF
 N0uQ==
X-Gm-Message-State: AOJu0Ywlg4RY9ODX8Zmcm6cW1VlqRniP/pgPTDEbSeqLeTdn5EpR73ng
 +0ZDNdi5NdHCX/BchNs388vjZ4XuKz/e4Y29X29mfEy5r5D0udlsarkHVfAyK5chLFDErE1h+jZ
 zmmSgYEqr24PDK0VpG0rAhEU8pXCV/4kpAKMV0A1lw+5EtnknZSB1evnaXIGebjqlQg==
X-Received: by 2002:a05:600c:310a:b0:42b:ac55:b327 with SMTP id
 5b1f17b1804b1-42c880efb88mr26637245e9.12.1725365815302; 
 Tue, 03 Sep 2024 05:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4j1HQbJZ4tQ+5HUrU1wf3ZhSaYNsES3j6jps+inrau18KybLARTHZrpwsf2i8vLhskKlqcQ==
X-Received: by 2002:a05:600c:310a:b0:42b:ac55:b327 with SMTP id
 5b1f17b1804b1-42c880efb88mr26637005e9.12.1725365814792; 
 Tue, 03 Sep 2024 05:16:54 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df100csm168841155e9.20.2024.09.03.05.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:16:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 77/81] drm/msm: Run DRM default client setup
In-Reply-To: <20240830084456.77630-78-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-78-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:16:53 +0200
Message-ID: <878qw9c4p6.fsf@minerva.mail-host-address-is-not-set>
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
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The msm driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c   |   4 +-
>  drivers/gpu/drm/msm/msm_drv.h   |  13 ++-
>  drivers/gpu/drm/msm/msm_fbdev.c | 144 ++++++--------------------------
>  3 files changed, 38 insertions(+), 123 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

