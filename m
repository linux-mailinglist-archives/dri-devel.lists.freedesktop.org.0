Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AECB747F8B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4F710E223;
	Wed,  5 Jul 2023 08:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE9D10E338
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688545501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eZJh75bw9w7BaC88TjfKOAwS7yZRgwUVKM0cKS0Ap4c=;
 b=YImK1i87DQoN6KxAIUzxBJGc/k84VEANJfnZPqK6/8AK+eo8t6zdNzx9U/9xldauH+dBVJ
 R6kFzSl2GeoKbuCGRIe3IZmy/YvzTDRo5S6YguQAn4GNNNxteVh9MQ+O+9To+0P4+atkue
 UlMfShLxMBcCxTDedlMmHVHxhVykoZ0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-aVh7vQG9M0Cb5sK8tfIcag-1; Wed, 05 Jul 2023 04:24:59 -0400
X-MC-Unique: aVh7vQG9M0Cb5sK8tfIcag-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4fb913e8cddso6205840e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 01:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688545498; x=1691137498;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eZJh75bw9w7BaC88TjfKOAwS7yZRgwUVKM0cKS0Ap4c=;
 b=R8GmVFHi0DyowC01OhMr/ai27ys34GlsInQ4WBBHdZfCxIFZq1jkuAr+TgeB2KCdO4
 7pd7oR28wqW0YLmjxw6MOQT1sim1MJTsNNMq1g1r7Y+iczYVLpIrQ6a5lQnIIoTTsdpE
 Kw1PhFTIiKwJo+g2nNopIiR5Phza+6W61AkOk34bhAdDrbAHg4H9ZaqqEWDQLmIE1YPI
 PPusX+u7vmlFGpQZ7a+JOrILp6x//oKoiyErrWWjiV07UOFbpBA9zzyXbEW+iyC3xSNL
 Wo6PPMjkaiSVcjKA5LvEK/Vq50pKoxJd6DEm/oMWByusgtbWhpZBJVOx3m5NHe575wFk
 /yqQ==
X-Gm-Message-State: ABy/qLZAHE8HEEHVWgzyV0672vrOzaUZO8xtLSDcu3TCtd3jsnfg0fqS
 X4QZPugx1N2Z2HeJGpJlbkgyjQf0/NquB40J0WfBXRDLo97VB0ZechohJBfBFDXvfHR+bvVFQRu
 ZR3Yk3vy3YO6VovdSYR4DGE+2xv8FS0VUSDjy
X-Received: by 2002:a05:6512:214a:b0:4f9:710f:f3a9 with SMTP id
 s10-20020a056512214a00b004f9710ff3a9mr8987196lfr.58.1688545498072; 
 Wed, 05 Jul 2023 01:24:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGmVl6rLLB6OUt7bROr01892dqkjNHI5vlj2R/On3xPNUheSZKZaL6NJ+PF67CBojymc/sLhQ==
X-Received: by 2002:a05:6512:214a:b0:4f9:710f:f3a9 with SMTP id
 s10-20020a056512214a00b004f9710ff3a9mr8987187lfr.58.1688545497921; 
 Wed, 05 Jul 2023 01:24:57 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5d69cb000000b00313f07ccca4sm26118306wrw.117.2023.07.05.01.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 01:24:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 03/10] drm/tegra: Use fbdev DMA helpers
In-Reply-To: <20230704160133.20261-4-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-4-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 10:24:57 +0200
Message-ID: <87zg4arciu.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use fbdev's DMA helpers for fbdev emulation. They are equivalent to the
> previously used system-memory helpers, so no functional changes here.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

