Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782DC768155
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5854110E117;
	Sat, 29 Jul 2023 19:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36CF10E117
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690658832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FF7YMNnJw4aG4W8Tlud2PZiGmCkxcL5PSVDcb1rl9Nw=;
 b=EPkr81QF15P9S+KJtX8wACNH99zAwJkLzyCz295ALwVIWKw0LgaGcuHwiQUlknX33luAm0
 l0SlHbAUw/4DfdtHlz4J0Zxh14Zsed8TjhiZ/3n0taARoKtKdyrZvWPr25+zLNFOCzMCtm
 53UnIVsLXtxQv8bgKwE17K0iHrqy/EA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-qTvUJjEzPzCDQqQKXZosTw-1; Sat, 29 Jul 2023 15:27:10 -0400
X-MC-Unique: qTvUJjEzPzCDQqQKXZosTw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-314256aedcbso1650087f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 12:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690658829; x=1691263629;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FF7YMNnJw4aG4W8Tlud2PZiGmCkxcL5PSVDcb1rl9Nw=;
 b=jHEFFKY//62d9C9ZjGF3FY5llAul1gxk02PCj+oen4+uuQ2paN4hb72ZZnpR9NvCJ4
 F57XPfSVcTWQDBfwIl6vwyoiThumFntOQAI2zwbp78g/i+VbndbAakLuavsz8duGumuT
 CpqvdhN66iCo42aob0iDJRoX620Up/2SL8L9lqeJ2gagzvm69MNho4dABEKgX+ukBCLs
 Hiq4Rj9TMrtIu4zrQHLHF8RdM8xXLX8z7E5IiWfr5vM7k0hKM4C6WeVZL8w1vv3sHGYP
 R2RSY+uulYI8xFciYJUf0Y/RkZoVznGkYVb5eMPTy7r1+0HrN3nSsBnPdBmoP2LL4FrB
 m/5A==
X-Gm-Message-State: ABy/qLbYw54e7d35S/hY9TGu2wVO3rS/zvs1yX3IeE6gpQ2hsuT2lUu1
 AdYIj6E794iaWHyn9pg4+hAL6xFNAqfZDS0uTGzws64khU/xTroIExa0cfPSO18MXF+8HOWpdZB
 aKJCQ7FzXsNJ0rtble/HTlPpIHbUC
X-Received: by 2002:adf:ec06:0:b0:317:5948:1fe0 with SMTP id
 x6-20020adfec06000000b0031759481fe0mr4433300wrn.45.1690658829301; 
 Sat, 29 Jul 2023 12:27:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE4P4YiFhuI4ynzieVdKtm1Z/PFipBTRtmnhicR2Fu7fVK2AwNkVjGHHEaf2sFTV/ye9YNVSA==
X-Received: by 2002:adf:ec06:0:b0:317:5948:1fe0 with SMTP id
 x6-20020adfec06000000b0031759481fe0mr4433290wrn.45.1690658828986; 
 Sat, 29 Jul 2023 12:27:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x1-20020a5d54c1000000b003176f2d9ce5sm8194584wrv.71.2023.07.29.12.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 12:27:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ville =?utf-8?B?U3ly?=
 =?utf-8?B?asOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 0/4] drm: Atomic modesetting doc and comment
 improvements
In-Reply-To: <cover.1689779916.git.geert+renesas@glider.be>
References: <cover.1689779916.git.geert+renesas@glider.be>
Date: Sat, 29 Jul 2023 21:27:08 +0200
Message-ID: <87sf96wmb7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

>         Hi all,
>
> This patch series contains various improvements to the documentation and
> comments related to atomic modesetting.  Hopefully, it will ease the job
> of DRM novice who want to tackle the daunting task of converting a
> legacy DRM driver to atomic modesetting.
>
> Changes compared to v2[1]:
>   - Make main text read correctly when ignoring the footnotes,
>   - Add Reviewed-by.
>
> Changes compared to v1[2]:
>   - Add Reviewed-by,
>   - Drop double space after full stop,
>   - Use footnotes for references,
>   - Remore reference to unconverted virtual HW drivers,
>   - New patch [2/4],
>   - Drop "first part" in drivers/gpu/drm/drm_plane_helper.c.
>
> Thanks for applying!
>
> [1] https://lore.kernel.org/r/cover.1686318012.git.geert+renesas@glider.be
> [2] https://lore.kernel.org/r/cover.1685696114.git.geert+renesas@glider.be
>
> Geert Uytterhoeven (4):
>   drm/todo: Add atomic modesetting references
>   drm/todo: Convert list of fbconv links to footnotes
>   drm: Remove references to removed transitional helpers
>   drm: Fix references to drm_plane_helper_check_state()
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

