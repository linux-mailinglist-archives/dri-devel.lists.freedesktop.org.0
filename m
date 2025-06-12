Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E05AD6D31
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4AA10E76D;
	Thu, 12 Jun 2025 10:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c9MVRztx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB72C10E76D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 10:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749723094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pGBy51vLwHxiRFzlFG6sAE4XXz4ixGxJT7JNZmx6ya0=;
 b=c9MVRztxT7N9fkYi6XwKUP8uPc1dqdE5cKtzuayNWQyd+55ZmUSuJEKI4ZKra4oT9OEgM4
 Y4qJgzOYuDkNjLTp2iy251On6MgioK8KgtiFcpC6Yi14EdCG4HR1aRCRdY7mExUaSJKepq
 Um53b/FeM2SG46TgI4Q45XLlqjyrKcc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-62ymOTIAMR-nsknXAGnsdg-1; Thu, 12 Jun 2025 06:11:33 -0400
X-MC-Unique: 62ymOTIAMR-nsknXAGnsdg-1
X-Mimecast-MFC-AGG-ID: 62ymOTIAMR-nsknXAGnsdg_1749723093
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450df53d461so6098925e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 03:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749723092; x=1750327892;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pGBy51vLwHxiRFzlFG6sAE4XXz4ixGxJT7JNZmx6ya0=;
 b=nsjXwSxF2yoRM00PMTe6DbkEFrmCocNWE4zC/KnusY9Jliq0dYxncDw6a+vQjcKNR5
 LrfB2+6VpbKY4UVb9uSr+KuFOfPUMbbGDigepxtNQOmNyQUqnIDqg2nHdbazViqqCbRd
 bRPPChbMQ9ym+x0vbrhALXASO3d/szweVX4dL9aVSWZav6cL/SoLAyerp7pkmv5ErY0b
 4p5kHw6l3VtW4CXAuuvJYcCFmr1cZocsR/6PM2U7r09YNyxbCp0pAWzMAs9jtagmU1K7
 BucAtrE8jRwC8xr34U5NK+6cE85ls5sZk7ePIJwZeuE8BsvVHwBgJCZSC362/bG88V3r
 KRYg==
X-Gm-Message-State: AOJu0YxO1ZCBvK3ksMKdSYW7N89AL88dSYMrD42f4EOFM2nFG+mfGoZj
 9aRUSh01JUZUSl3YuhSyJ1TOGkav8SZ0WKq+3XE3ZO8shGDWUperHCYXxd6Y4lRSiX71ef1gzKQ
 mhtl4AxNP6xicvXF9pRP5GJ4us5VuZ9FeXic2jhblU/hHoQmnpHww9tlD27M3v7r1YAEu7Q==
X-Gm-Gg: ASbGncsCdIATo3UyLX1j7VdaEgOWWjMPqCRk0yc51843oqrP8S5ebal1RdyXwvwtRPn
 lGw6cqBo9/R+Epm4GJG9+GTkOPVIw5EvKjnTrF4EgKdFWu5VFgdKqRkgS9FpRyPuSLeXncPm7mD
 0YOSTWTpLRAGC7DmurUEJbQuCTXg9ie0Y+LFsAvyYqna0giR4pDSsN71mimc5mBYif+J3ApYc2S
 WpATZtT4EhpKuVQ5Nt3Re9E9btpoXZH8NPBWGCSnHaVsdl0/V/aTPlpvNIuT0aMhdZa+yxS+gP7
 fLxuAP+CdFmycM8FkSEpEPzZKiFBd8GaO4+dlPIB0dqn/iBUdP/Z92ixXRYGrJ+LIUmKrulAqmG
 XFGsJ
X-Received: by 2002:a05:600c:3487:b0:442:cd03:3e2 with SMTP id
 5b1f17b1804b1-4532b8c566fmr31029965e9.2.1749723092561; 
 Thu, 12 Jun 2025 03:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIRwSDETjsZDvA9ygkTiRFeiyQOH8GnjwgKrGOBot/g2hhj30nslnq4PXXYLc3PE0ueXti5Q==
X-Received: by 2002:a05:600c:3487:b0:442:cd03:3e2 with SMTP id
 5b1f17b1804b1-4532b8c566fmr31029745e9.2.1749723092226; 
 Thu, 12 Jun 2025 03:11:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453305a0d9dsm7950045e9.21.2025.06.12.03.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 03:11:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arthurgrillo@riseup.net,
 jose.exposito89@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/format-helper: Move drm_fb_build_fourcc_list()
 to sysfb helpers
In-Reply-To: <20250604154844.28995-4-tzimmermann@suse.de>
References: <20250604154844.28995-1-tzimmermann@suse.de>
 <20250604154844.28995-4-tzimmermann@suse.de>
Date: Thu, 12 Jun 2025 12:11:30 +0200
Message-ID: <87ikl1w9pp.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q4RjUqB-nsU4YlJbWFDj4RygoRGcDlBe-GipQMC9vHw_1749723093
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

> Only sysfb drivers use drm_fb_build_fourcc_list(). Move the function
> to sysfb helpers and rename it accordingly. Update drivers and tests.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

