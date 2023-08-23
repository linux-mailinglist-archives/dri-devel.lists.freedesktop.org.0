Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787DA7861C0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 22:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F6910E0EA;
	Wed, 23 Aug 2023 20:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ACB10E0E9;
 Wed, 23 Aug 2023 20:51:43 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-570b6f82301so2800340eaf.0; 
 Wed, 23 Aug 2023 13:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692823903; x=1693428703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMgBXJyz4j+4W1iINiCAeqRriHTkzDpdbP8epuCcQ+c=;
 b=eozVk7W5leBAIZAjir3gI8REAZD8JCcPkc/M3KQhYESTaDkMUhGQDiSxOEPEK8UM6S
 QBVLEjB8cFtzrlG3JpOzs9WHPI0EvMf0WIahjkoZSTWCyL2GUEH/6Mezg90NtJhGIrvQ
 eBPKe8aveZvFRN15TGEaVA1rgkLsnveNweUtsnML5Ia5IEm2bQX1GROzmYft1v91mIPG
 D6tlS5DTv1Yn6jV/Hyt4NPH/leowXHZCgoGIqgoqFC6uvzqlN+i1Zhm78AVUDpt0B69X
 zarKS/XGC8q15mK6yGP+XRMWe3L1Ah7X5yAQEbWraTrTvFLQdbuiTVRiWmOVovKWwAUU
 QsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692823903; x=1693428703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eMgBXJyz4j+4W1iINiCAeqRriHTkzDpdbP8epuCcQ+c=;
 b=UIf+5EgIN4O3IpITYJruuvIlA4+2H5XWYXOoAqaSe2c/r3hRSibHVHE7+j+36qxqt9
 Ay2UYBxua4OpO2V8usA9lXbWz06XpDkeIvBHPuuQMBKj5aQ/KSQvOz1Fktb9TTz0ZQ+8
 FFaB7dSROiuBufUR0ePz55Yb5eS10U2Io8hFDEdNIM58qyvVUcJQia8jWs0SJnyRKPvl
 8JsVgHDuNba5DTPipJK6v3kHCEVBBO+HJQyfyyxB8bH9aa90JuGSKkni8QDuCDq2kR3j
 YRITlmFWQXgy69uJUEhclFW7iuDespCTKvWuhg8OqVN6cusK9/HR5Il0livIAQA26mWf
 QvXw==
X-Gm-Message-State: AOJu0YxbZe7d0q9s+rBkuFlLhUdp+jdtcXiegzVwFm3gSSw78A0r52Ij
 GHZIfhWcaaQZT7Lc7r83izs13srxvD0cXymz9gw=
X-Google-Smtp-Source: AGHT+IHgdmrbaLNqEUvEuYL9VRV0cTrFvNWgv5pxAYyjKRmaS85alJv6VNGoQ4yzx1Q6YlEJslEijFtTWsqHFGbHGcI=
X-Received: by 2002:a05:6870:700e:b0:1bf:dc25:a5aa with SMTP id
 u14-20020a056870700e00b001bfdc25a5aamr16861010oae.39.1692823902696; Wed, 23
 Aug 2023 13:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230815172700.255596-1-hamza.mahfooz@amd.com>
 <d1831afd-9e02-fbc9-69f7-e8f044f35ee0@gmail.com>
 <855aeab8-13e1-4dc4-841e-24d298c9c072@amd.com>
 <9855fa7a-dd9d-27b8-171e-b662d417b902@amd.com>
In-Reply-To: <9855fa7a-dd9d-27b8-171e-b662d417b902@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Aug 2023 16:51:31 -0400
Message-ID: <CADnq5_OZiTtWLMS-hh56c8KZj1eEHQGVKh6pah-qct74e4Nabw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: register a dirty framebuffer callback for
 fbcon
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

@Mahfooz, Hamza
 can you respin with the NULL check?

Alex

On Wed, Aug 16, 2023 at 10:25=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.08.23 um 15:41 schrieb Hamza Mahfooz:
> >
> > On 8/16/23 01:55, Christian K=C3=B6nig wrote:
> >>
> >>
> >> Am 15.08.23 um 19:26 schrieb Hamza Mahfooz:
> >>> fbcon requires that we implement &drm_framebuffer_funcs.dirty.
> >>> Otherwise, the framebuffer might take a while to flush (which would
> >>> manifest as noticeable lag). However, we can't enable this callback f=
or
> >>> non-fbcon cases since it might cause too many atomic commits to be ma=
de
> >>> at once. So, implement amdgpu_dirtyfb() and only enable it for fbcon
> >>> framebuffers on devices that support atomic KMS.
> >>>
> >>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> >>> Cc: Mario Limonciello <mario.limonciello@amd.com>
> >>> Cc: stable@vger.kernel.org # 6.1+
> >>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2519
> >>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> >>> ---
> >>> v2: update variable names
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 26
> >>> ++++++++++++++++++++-
> >>>   1 file changed, 25 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> >>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> >>> index d20dd3f852fc..d3b59f99cb7c 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> >>> @@ -38,6 +38,8 @@
> >>>   #include <linux/pci.h>
> >>>   #include <linux/pm_runtime.h>
> >>>   #include <drm/drm_crtc_helper.h>
> >>> +#include <drm/drm_damage_helper.h>
> >>> +#include <drm/drm_drv.h>
> >>>   #include <drm/drm_edid.h>
> >>>   #include <drm/drm_fb_helper.h>
> >>>   #include <drm/drm_gem_framebuffer_helper.h>
> >>> @@ -532,11 +534,29 @@ bool amdgpu_display_ddc_probe(struct
> >>> amdgpu_connector *amdgpu_connector,
> >>>       return true;
> >>>   }
> >>> +static int amdgpu_dirtyfb(struct drm_framebuffer *fb, struct
> >>> drm_file *file,
> >>> +              unsigned int flags, unsigned int color,
> >>> +              struct drm_clip_rect *clips, unsigned int num_clips)
> >>> +{
> >>> +
> >>> +    if (strcmp(fb->comm, "[fbcon]"))
> >>> +        return -ENOSYS;
> >>
> >> Once more to the v2 of this patch: Tests like those are a pretty big
> >> NO-GO for upstreaming.
> >
> > On closer inspection it is actually sufficient to check if `file` is
> > NULL here (since it means that the request isn't from userspace). So, d=
o
> > you think that would be palatable for upstream?
>
> That's certainly better than doing a string compare, but I'm not sure if
> that's sufficient.
>
> In general drivers shouldn't have any special handling for fdcon.
>
> You should probably have Thomas Zimmermann <tzimmermann@suse.de> take a
> look at this.
>
> Regards,
> Christian.
>
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>> +
> >>> +    return drm_atomic_helper_dirtyfb(fb, file, flags, color, clips,
> >>> +                     num_clips);
> >>> +}
> >>> +
> >>>   static const struct drm_framebuffer_funcs amdgpu_fb_funcs =3D {
> >>>       .destroy =3D drm_gem_fb_destroy,
> >>>       .create_handle =3D drm_gem_fb_create_handle,
> >>>   };
> >>> +static const struct drm_framebuffer_funcs amdgpu_fb_funcs_atomic =3D=
 {
> >>> +    .destroy =3D drm_gem_fb_destroy,
> >>> +    .create_handle =3D drm_gem_fb_create_handle,
> >>> +    .dirty =3D amdgpu_dirtyfb
> >>> +};
> >>> +
> >>>   uint32_t amdgpu_display_supported_domains(struct amdgpu_device *ade=
v,
> >>>                         uint64_t bo_flags)
> >>>   {
> >>> @@ -1139,7 +1159,11 @@ static int
> >>> amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
> >>>       if (ret)
> >>>           goto err;
> >>> -    ret =3D drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
> >>> +    if (drm_drv_uses_atomic_modeset(dev))
> >>> +        ret =3D drm_framebuffer_init(dev, &rfb->base,
> >>> +                       &amdgpu_fb_funcs_atomic);
> >>> +    else
> >>> +        ret =3D drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_fun=
cs);
> >>>       if (ret)
> >>>           goto err;
> >>
>
