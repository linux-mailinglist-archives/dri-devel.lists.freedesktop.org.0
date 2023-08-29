Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BABA78CE9A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 23:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F20210E002;
	Tue, 29 Aug 2023 21:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613EC10E002
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 21:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693343551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jy+2K1yLANLa7lYSBwfRxxzOwoci1VeMwKfXVR7mlYU=;
 b=CYqlqQYM071ULUQPECaE+OWAg2D/tX5Pi5pzhVCYmdATFganjjAAdW7MvtIFU8f3YHeUKR
 jHLOS5d8M/SHfKeVebSgTHlkbpgeMqNf9/woGgVyUjz/7sXrKVbTY6bskxNgpUBRuXYgnh
 R1Z1zQS3Y+LYW3PbkR8XnsHWjJGSP8I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-FZ__bq0uMYiluefapMyc4A-1; Tue, 29 Aug 2023 17:12:28 -0400
X-MC-Unique: FZ__bq0uMYiluefapMyc4A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-401b8089339so29683125e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693343547; x=1693948347;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jy+2K1yLANLa7lYSBwfRxxzOwoci1VeMwKfXVR7mlYU=;
 b=dUGpVs7tFaOEZR2ViucBoVgEtePUgIt72rTpstj7WAT63n+3C9QeISN3i4HemSjXw8
 cODY18GKoGJxxb30rvfvDYPUoLOsWVfxR56vvodFzsCA3q0e3XhcQt09hYFkVC0Q06xW
 Ots4905eBKPsB0wdvZe7GUgStGshSkNU62PmvPgTNd9rqUGhcR08u5Gyp4Kzvkozm6xr
 KopqZia6XBfrd/EaaxhDpxwimbYduFKn7s0AQeKq5yrtByikmS3P/Ftp4uVFwUwnKh+P
 SwnCdEoRZJ6jqqCejTE6VI0EvXuJ2ImwB5kfgwdAR1naqFeWP9QpIV97cUtyU41ASDyq
 YPEA==
X-Gm-Message-State: AOJu0YycHMtwhO4xQOwpbE5ra4+YkyViHff8SkbviW4Mq9b3ZMuIuHpN
 s1HRnd6DZD+XoNqLiTLrA80EnyGKzC76K6JE6RVPVrHd0vGe0xxXJAXjs3GQ+qnkaVHQoptDFCT
 WlXQqI5xoqJ+HTrDkjMw4kh5ssegO
X-Received: by 2002:adf:e9ce:0:b0:31d:d977:4e3d with SMTP id
 l14-20020adfe9ce000000b0031dd9774e3dmr190715wrn.19.1693343547185; 
 Tue, 29 Aug 2023 14:12:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH42PUKWhgWABC41K1eUctlcT6IxKHduBUV2k8w1BSLQMhzChfk2sRp5Y6Kzvuv8mAoQ3Ogrw==
X-Received: by 2002:adf:e9ce:0:b0:31d:d977:4e3d with SMTP id
 l14-20020adfe9ce000000b0031dd9774e3dmr190702wrn.19.1693343546891; 
 Tue, 29 Aug 2023 14:12:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f10-20020a7bc8ca000000b003fe29dc0ff2sm84275wml.21.2023.08.29.14.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:12:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 2/8] drm/ssd130x: Fix screen clearing
In-Reply-To: <87zg2atf50.fsf@minerva.mail-host-address-is-not-set>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <c19cd5a57205597bb38a446c3871092993498f01.1692888745.git.geert@linux-m68k.org>
 <87zg2atf50.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 29 Aug 2023 23:12:25 +0200
Message-ID: <87a5u9d03q.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

> The change makes sense to me.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

I've also tested this patch now and found no regressions.

Tested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

