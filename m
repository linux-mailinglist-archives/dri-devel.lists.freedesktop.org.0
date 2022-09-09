Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34225B3EF0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 20:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B9B10EDAF;
	Fri,  9 Sep 2022 18:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8E010EDAF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 18:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662748765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdLhczu0CMi+mDnVz/QrauXucQKKVCzqETWjwaQHd38=;
 b=Hy4UNHc3NwzlSWfJckqeURBaLiGx4rsocTfZtNJXMnXkQXOX03c/OhKX/eV+lo4eEfCefI
 2WW2rJ+UWIRibsRztRodDqh3grUIlbjb0PSKWyBxfBlI7Wn2fUiLcWaFTx3h79xA9h1MWJ
 wvRgTpc/GRSJSUo0fYTnYO4wQLCbaMs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-XP5SgBcoMLmhzPpuIBUEnQ-1; Fri, 09 Sep 2022 14:39:14 -0400
X-MC-Unique: XP5SgBcoMLmhzPpuIBUEnQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 s17-20020a05620a255100b006c9cefbc68eso2183744qko.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 11:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=EdLhczu0CMi+mDnVz/QrauXucQKKVCzqETWjwaQHd38=;
 b=edpLQcK+uSPDivMkiaSIFhvtA7rsQBTiAgaSpSz6ptj2c+YEdDzB1lo4L+NjTTbIc5
 CKxbO3N2VHDZollOKZ3D0RzKYNJY26cLpuWPtj4gIgHPSUDn8iSImTTFeX8c+Gg+oG1i
 0eWPsvfO3m7oBfnBr0Br6jNM3PJJ/6ZrqTW2Yu1SyXXhQ5PBtSwpJu5BoSjHi0Hl6sHH
 8d3PxJMrpJqEA60f9kXiWe8Pk5iMlf1UgnvtbK0OLU1LgQwIVl2YyaILRUzb1UEpl3G3
 whElNO8BxT6CSMEZ2+WYyDYx/Y9MBwUWxytmLnbFXCIJVAlzerNATM29q3S/oN+dZcF8
 5ovA==
X-Gm-Message-State: ACgBeo2PuCaHfvzX0fcmGbNydYD84Cf/Gtr81B8o41Vb3/mSJS5VIABj
 59hK+9mohiRAjOpoIRexDqrxW8Vd+Frpj0SATIo7rEVx23uDoEnak84f+klafUM8eH6qdDKVEUr
 oD3bqNykt+0mINB3/1rqkOoYey2n5
X-Received: by 2002:a05:620a:2409:b0:6bb:d417:c8b6 with SMTP id
 d9-20020a05620a240900b006bbd417c8b6mr11021738qkn.304.1662748754341; 
 Fri, 09 Sep 2022 11:39:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hJkqeVfTbw7cuxek5gomVvLkSerw4ZzxC0N7zAg5c4TbdTJmbRg/kK4DEJejexdZcRhNvDg==
X-Received: by 2002:a05:620a:2409:b0:6bb:d417:c8b6 with SMTP id
 d9-20020a05620a240900b006bbd417c8b6mr11021713qkn.304.1662748754013; 
 Fri, 09 Sep 2022 11:39:14 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::9e6? ([2600:4040:5c48:e00::9e6])
 by smtp.gmail.com with ESMTPSA id
 64-20020a370543000000b006bb619a6a85sm965016qkf.48.2022.09.09.11.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 11:39:11 -0700 (PDT)
Message-ID: <1fb0323d201ef2d9b00fe9bdb65efa97e5bd1e8f.camel@redhat.com>
Subject: Re: [PATCH 0/4] drm/plane: Remove drm_plane_init(), plus other
 cleanups
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie, 
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, 
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
Date: Fri, 09 Sep 2022 14:39:10 -0400
In-Reply-To: <20220909105947.6487-1-tzimmermann@suse.de>
References: <20220909105947.6487-1-tzimmermann@suse.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the nouveau bits on 1, 2 and 4:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-09-09 at 12:59 +0200, Thomas Zimmermann wrote:
> This patchset does cleanups to the plane code, most noteably it removes
> drm_plane_init(). The function is a small wrapper, which can easily be
> inlined into the few callers. Patch #1 fixes this.
> 
> The other clean-up patches #2 to #4 affect plane creation. Modesetting
> helpers and nouveau share some plane-allocation code that can be shared as
> helper function. While the function is already outdated, it's now at least
> well documented. As suggested by Daniel, patch #3 adds a warning to
> non-atomic plane helpers when they are being called from atomic drivers.
> Patch #4 adds an initializer macro for non-atomic plane functions. It
> should not be used in new drivers, but at least documents the current
> practice.
> 
> Tested with nouveau on Nvidia G72 hardware.
> 
> A possible next step would be the inlining of drm_crtc_init() and the
> removal of drm_plane.format_default.
> 
> Thomas Zimmermann (4):
>   drm/plane: Remove drm_plane_init()
>   drm/plane: Allocate planes with drm_universal_plane_alloc()
>   drm/plane-helper: Warn if atomic drivers call non-atomic helpers
>   drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS initializer macro
> 
>  drivers/gpu/drm/drm_modeset_helper.c       | 68 +++++++++------------
>  drivers/gpu/drm/drm_plane.c                | 70 ++++++++++++----------
>  drivers/gpu/drm/drm_plane_helper.c         | 10 ++++
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c    | 45 +++++---------
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c | 13 ++--
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c |  7 ++-
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c      |  9 ++-
>  include/drm/drm_plane.h                    | 52 +++++++++++++---
>  include/drm/drm_plane_helper.h             | 12 ++++
>  9 files changed, 162 insertions(+), 124 deletions(-)
> 
> 
> base-commit: f2c3a05d33693ad51996fa7d12d3b2d4b0f372eb
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

