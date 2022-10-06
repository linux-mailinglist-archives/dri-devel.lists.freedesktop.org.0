Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AAC5F6EC9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 22:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCBF10E896;
	Thu,  6 Oct 2022 20:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9440410E896
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 20:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665087503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXIqHT1bXDqNNHjDtsYXHWx+csCd/LuyRTzTVqxKO1M=;
 b=SHuZWMS+E1IhicVHagEVYM8QO3UxFKtc+T8jncXZEtYnczpGQG3FmaIm24p8rSX5ene+hL
 zJNLGFOUB7+O5w7WtL2uP57dDXbn1LRs3iCt3lscC8unF8qAY3tW/u3jG//ACH7keUYGCE
 MC+njmbnJ6AFwbxpcoCwwbf4+vG3yIc=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-GmK6tKSUMtytBKt3Il_UzQ-1; Thu, 06 Oct 2022 16:18:22 -0400
X-MC-Unique: GmK6tKSUMtytBKt3Il_UzQ-1
Received: by mail-il1-f197.google.com with SMTP id
 i3-20020a056e020d8300b002f90e6fedcfso2353000ilj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 13:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vXIqHT1bXDqNNHjDtsYXHWx+csCd/LuyRTzTVqxKO1M=;
 b=O+N8no0WX4ZRUR+CyBmN5KDyCok1kRd7KAamx4eo3IsooAQBIu/17jjAJEHBsVCewr
 gC+d4A6OPj9ZaFSiY0YNPItuRVfS3RTbif8khiWMx4iRXIlxABzykqCRO7yAVKhcoZhO
 2/C0uiafR8NU0XwEJEVnoDhxNepDkydOIRmDsuWrWs2iE0eh7L2k7QS6hpU2F+P1CXAe
 u8t7apuXJ1ngj3H2jSWm3QMTdwxSvQDshYV2D0EqmjFASn0f7w9QmXur7QXTTQ/dDurh
 WMOs80ZH3tbINCRGpGrnn5qa8rWEcOz2i7fR0Iqd+QugqoOiiVeqiEew6c/GRSBhvKPA
 19Kg==
X-Gm-Message-State: ACrzQf2czelx1RXvFEmPbYrEiiWU50eRFFFd0ra/h/L9z+yReIghO0ba
 91EK0sMBupU32vSf8baHJJ3p3a3jTZU1yXznzIvXUr1WNtEGrmtHfp2bmN32ZHVWD4FUtsWdfUE
 MPO8hqqWMsPjRLSlLWrqey37ZRv9L
X-Received: by 2002:a05:6638:1396:b0:357:148d:8705 with SMTP id
 w22-20020a056638139600b00357148d8705mr711198jad.61.1665087502164; 
 Thu, 06 Oct 2022 13:18:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Smvg475P6HNshzV88KXHfAI6y88bKg0iKGNmhfyf+n7eZ02U9P/tAiyx1wy/OOWdJNabUNQ==
X-Received: by 2002:a05:6638:1396:b0:357:148d:8705 with SMTP id
 w22-20020a056638139600b00357148d8705mr711191jad.61.1665087501942; 
 Thu, 06 Oct 2022 13:18:21 -0700 (PDT)
Received: from [10.157.9.147] ([97.64.79.183])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a022203000000b003585ff0233asm119073jao.150.2022.10.06.13.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 13:18:21 -0700 (PDT)
Message-ID: <24dfef10-da19-1dc2-4dec-7d0231a920c2@redhat.com>
Date: Thu, 6 Oct 2022 22:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 1/2] drm/atomic-helper: Don't allocated plane state in
 CRTC check
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, ville.syrjala@linux.intel.com,
 daniel@fooishbar.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221005114002.3715-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 10/5/22 13:40, Thomas Zimmermann wrote:
> In drm_atomic_helper_check_crtc_state(), do not add a new plane state
> to the global state if it does not exist already. Adding a new plane
> state will result in overhead for the plane during the atomic-commit
> step.
> 
> For the test in drm_atomic_helper_check_crtc_state() to succeed, it
> is important that the CRTC has an enabled primary plane after the
> commit. Simply testing the CRTC state's plane_mask for a primary plane
> is sufficient.
> 
> Note that the helper still only tests for an attached primary plane.
> Drivers have to ensure that the plane contains valid pixel information.
> 
> v3:
> 	* test for a primary plane in plane_mask (Ville)
> v2:
> 	* remove unnecessary test for plane->crtc (Ville)
> 	* inline drm_atomic_get_next_plane_state() (Ville)
> 	* acquire plane lock before accessing plane->state (Ville)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d6b9af1097fe ("drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()")

This patch makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

but I've a hard time parsing the subject line. Did you mean instead:

"drm/atomic-helper: Don't allocate new plane state in CRTC check" ?

or "drm/atomic-helper: Don't add a new plane state in CRTC check" ?

In any case you can fix that while applying so no need to resend IMO.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

