Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BD987AE66
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE2A10F511;
	Wed, 13 Mar 2024 17:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="IoHKpXZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1801110F511
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:57:12 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dd14d8e7026so752276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1710352632; x=1710957432;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01bhDM3sgbMCVy0wA7pMlXqjUXnnMg0Fx0xhubvbwtM=;
 b=IoHKpXZ0lwxxhdjzgN+EbsZz0Q2egUrH4jT6z5IM/XJGWlIp6nwuokDoz8R3ZxgAO3
 keb6ZjFoUKeLHtAmnPV7/gaN3yWtFp0lpZcSo4Xc+QnRR5M+FbDi7lZtZrWbF4Ie87nT
 h+cjwQ5HO3bN67m0EzssrK/XhC7N+QCWaVuME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710352632; x=1710957432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01bhDM3sgbMCVy0wA7pMlXqjUXnnMg0Fx0xhubvbwtM=;
 b=Jg59cyLjgE+9CDVFiX7A5nEXZvWhTcmuK3su2DmD+fHDMOlGniYUN7qQwfdaC08Zbd
 lFg0PdC5O4NlW+yIGLkh0P1hCfDKiMzbMgf8G/tm4L7TzHST92hWIvOsh1DvZjtUM8hj
 J0lB1Jif3PE55jFiNw8oIO2U1f8uP8aQu2is8QcQtbECvngTTuhg2r0Jkf1kFv1s9Bnj
 B5363f66bttNo0AFkynZ3+eFuNz5jPR4q7PElU+8nSWLokYhrAGIFgUtZSu7dbMxakej
 LLDuKZIL1ISx8gk9mhs4yW+W/hEtpOA9JRM5yfXTIfr1p9eLj7JiwqsCjDTIRaLN3uXB
 v2lA==
X-Gm-Message-State: AOJu0Ywvon8UU3oZkRhHP4WDPPPGKc98t0BczZkEoDzL1Yw/QoG0SUN8
 7k9+BOF/+nCF+kX+/5totwEtju5/HuyVl7q3N5wV1N2HaSm8lIeiPDXrjNP7UDMV7/Tt2KZm/k/
 jSVa00uX+dDob5ymqz7Z1gGmM8NJcX1IsJGOC
X-Google-Smtp-Source: AGHT+IEkAZO78oDndyJfmxsMlcdlD0RuRua6PWTKx+M6sfIsCscvGyELnd8QyAHN/7Zx/pEiL7sgBzbEQQX3YUR74R0=
X-Received: by 2002:a5b:a:0:b0:dcd:2d3a:b528 with SMTP id
 a10-20020a5b000a000000b00dcd2d3ab528mr2867472ybp.9.1710352631869; 
 Wed, 13 Mar 2024 10:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240312093551.196609-1-jfalempe@redhat.com>
In-Reply-To: <20240312093551.196609-1-jfalempe@redhat.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 13 Mar 2024 13:57:01 -0400
Message-ID: <CABQX2QN729DjtdOzAS9jeEP_xHXT4zNaOcP59pa-KyXnME=xaw@mail.gmail.com>
Subject: Re: [PATCH] vmwgfx: Create debugfs ttm_resource_manager entry only if
 needed
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, daniel@ffwll.ch, stable@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 12, 2024 at 5:36=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> The driver creates /sys/kernel/debug/dri/0/mob_ttm even when the
> corresponding ttm_resource_manager is not allocated.
> This leads to a crash when trying to read from this file.
>
> Add a check to create mob_ttm, system_mob_ttm, and gmr_ttm debug file
> only when the corresponding ttm_resource_manager is allocated.
>
> crash> bt
> PID: 3133409  TASK: ffff8fe4834a5000  CPU: 3    COMMAND: "grep"
>  #0 [ffffb954506b3b20] machine_kexec at ffffffffb2a6bec3
>  #1 [ffffb954506b3b78] __crash_kexec at ffffffffb2bb598a
>  #2 [ffffb954506b3c38] crash_kexec at ffffffffb2bb68c1
>  #3 [ffffb954506b3c50] oops_end at ffffffffb2a2a9b1
>  #4 [ffffb954506b3c70] no_context at ffffffffb2a7e913
>  #5 [ffffb954506b3cc8] __bad_area_nosemaphore at ffffffffb2a7ec8c
>  #6 [ffffb954506b3d10] do_page_fault at ffffffffb2a7f887
>  #7 [ffffb954506b3d40] page_fault at ffffffffb360116e
>     [exception RIP: ttm_resource_manager_debug+0x11]
>     RIP: ffffffffc04afd11  RSP: ffffb954506b3df0  RFLAGS: 00010246
>     RAX: ffff8fe41a6d1200  RBX: 0000000000000000  RCX: 0000000000000940
>     RDX: 0000000000000000  RSI: ffffffffc04b4338  RDI: 0000000000000000
>     RBP: ffffb954506b3e08   R8: ffff8fee3ffad000   R9: 0000000000000000
>     R10: ffff8fe41a76a000  R11: 0000000000000001  R12: 00000000ffffffff
>     R13: 0000000000000001  R14: ffff8fe5bb6f3900  R15: ffff8fe41a6d1200
>     ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
>  #8 [ffffb954506b3e00] ttm_resource_manager_show at ffffffffc04afde7 [ttm=
]
>  #9 [ffffb954506b3e30] seq_read at ffffffffb2d8f9f3
>     RIP: 00007f4c4eda8985  RSP: 00007ffdbba9e9f8  RFLAGS: 00000246
>     RAX: ffffffffffffffda  RBX: 000000000037e000  RCX: 00007f4c4eda8985
>     RDX: 000000000037e000  RSI: 00007f4c41573000  RDI: 0000000000000003
>     RBP: 000000000037e000   R8: 0000000000000000   R9: 000000000037fe30
>     R10: 0000000000000000  R11: 0000000000000246  R12: 00007f4c41573000
>     R13: 0000000000000003  R14: 00007f4c41572010  R15: 0000000000000003
>     ORIG_RAX: 0000000000000000  CS: 0033  SS: 002b
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Fixes: af4a25bbe5e7 ("drm/vmwgfx: Add debugfs entries for various ttm res=
ource managers")
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index d3e308fdfd5b..c7d90f96d16a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1444,12 +1444,15 @@ static void vmw_debugfs_resource_managers_init(st=
ruct vmw_private *vmw)
>                                             root, "system_ttm");
>         ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, =
TTM_PL_VRAM),
>                                             root, "vram_ttm");
> -       ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, =
VMW_PL_GMR),
> -                                           root, "gmr_ttm");
> -       ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, =
VMW_PL_MOB),
> -                                           root, "mob_ttm");
> -       ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, =
VMW_PL_SYSTEM),
> -                                           root, "system_mob_ttm");
> +       if (vmw->has_gmr)
> +               ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw=
->bdev, VMW_PL_GMR),
> +                                                   root, "gmr_ttm");
> +       if (vmw->has_mob) {
> +               ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw=
->bdev, VMW_PL_MOB),
> +                                                   root, "mob_ttm");
> +               ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw=
->bdev, VMW_PL_SYSTEM),
> +                                                   root, "system_mob_ttm=
");
> +       }
>  }
>
>  static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long v=
al,
>
> base-commit: b33651a5c98dbd5a919219d8c129d0674ef74299
> --
> 2.44.0
>

Thanks! That looks great. I can push it through drm-misc-fixes.

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
