Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06566766969
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028ED10E6CC;
	Fri, 28 Jul 2023 09:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2CA10E6CC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690538023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bXp6qs20yFk9EnCdEdqi8l6MUy4tyubsvE/mVKYrLNU=;
 b=ShAv+G4XPGYKtra8PNtTJqTAfwTIYteN9MivMFBLZB1L9+n5vgWdBTnU8Whzc8uBXh1ASm
 oTgiwzI9zmBxCAnbVo2awmM5oHxcE99DiZhNjUPIy2dZavzLubEy4kDKeJB6M6l4O1KipE
 EXXFGpmn38YqUvw0l2Mm4uSVGukqgfA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-tV1ocSd0PGW4K_n99lzl3Q-1; Fri, 28 Jul 2023 05:53:40 -0400
X-MC-Unique: tV1ocSd0PGW4K_n99lzl3Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-313c930ee0eso988726f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 02:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690538018; x=1691142818;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bXp6qs20yFk9EnCdEdqi8l6MUy4tyubsvE/mVKYrLNU=;
 b=NxgpuuzxzQwIpPhz+vN7Rt/r5eMyWM4frwE0+UFGrBCU16tohK8vnK2LMhld3CXFij
 hlijc5meeMRoeM7NYAWpc/VSU7WtURQK8MDQHgSLzvzo40yPXkAp91egvm5/0aaHkFGe
 54cS4XhTjcJjHRFnJfNPwZCZoCLjZCW/CqhfXbnr8lWujtMfWuM4GcOmtKLT/z8I9dlf
 jneDhPa0BNLDvTT9S+FWjJezXPZiGY34c8+GmjVO4LwVy1mX9+rxoJ0zBzzc+RiwFEj5
 IZNO9S5I73n/58Gvq9amLRj+maX92GXFUKkGBRecVxsViiODRcw07mQh3wZymDRa+zHM
 xjmA==
X-Gm-Message-State: ABy/qLaz2IFwpfa4wCHK7cGh9rZp+aiehnffC07uqLapxeApoXPfzlxn
 aQfBMn6Cg8GDUHEVKhRxqlIWW56yoHUhqsT6kU5FBD0f2S/8r+pN2nlSldN+gqmp9ufuDW8VT4S
 7u2D0Jjwerok8cQxKNXiRs82rptiS
X-Received: by 2002:a5d:60c3:0:b0:317:708e:1c29 with SMTP id
 x3-20020a5d60c3000000b00317708e1c29mr1393979wrt.40.1690538018141; 
 Fri, 28 Jul 2023 02:53:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGHdh4k9+XqI2M+biACVcTzpApaOdCFQjcSh7sREZeHXtgOn2EBmD38pGCEOnj4stb3RQNh+g==
X-Received: by 2002:a5d:60c3:0:b0:317:708e:1c29 with SMTP id
 x3-20020a5d60c3000000b00317708e1c29mr1393966wrt.40.1690538017820; 
 Fri, 28 Jul 2023 02:53:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b00314367cf43asm4294848wrx.106.2023.07.28.02.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 02:53:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: Re: [PATCH v2] drm/atomic-helper: Update reference to
 drm_crtc_force_disable_all()
In-Reply-To: <b8c9c1a8a05dbf0be8e8be98cfdeafa9cecd8cef.1690535002.git.geert+renesas@glider.be>
References: <b8c9c1a8a05dbf0be8e8be98cfdeafa9cecd8cef.1690535002.git.geert+renesas@glider.be>
Date: Fri, 28 Jul 2023 11:53:36 +0200
Message-ID: <87pm4ctl9b.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> drm_crtc_force_disable_all() was renamed to
> drm_helper_force_disable_all(), but one reference was not updated.
>
> Fixes: c2d88e06bcb98540 ("drm: Move the legacy kms disable_all helper to crtc helpers")

The dim tool complains that:

-:10: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")'

So I've fixed it locally to only use the first 12 chars of the sha1.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

