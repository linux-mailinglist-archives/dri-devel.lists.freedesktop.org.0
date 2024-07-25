Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238D93BB22
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 05:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3FF10E7D1;
	Thu, 25 Jul 2024 03:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="HpRwtIKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FB810E7D1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 03:18:50 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e08a538bf7bso1310813276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 20:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721877529; x=1722482329;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnF+7YcXxYn9VtNS/vQw430HJSJXsi8M+Er7ErZBJD0=;
 b=HpRwtIKcQftLOSPEs55/X3uUL05HM3SeQQq07w8aneo1HM4lpYMG0YhSIGTiDhQ9vr
 HkuQCz8HjzFJTCLqDVt7vYY7WxUhmLXj37Ftm+vmJR9GfOOTAR7e0oVzGbiYFT/n6c8Q
 wE2U80q/lCQSTGkm0AKokiJlzCvr0lIbYTrLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721877529; x=1722482329;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnF+7YcXxYn9VtNS/vQw430HJSJXsi8M+Er7ErZBJD0=;
 b=r7P6blVzeb1fyy0VV/cAmydfNhhEGQmpUEhT8DIwZZtpxAuvBL37EJdfXCklSJqgx+
 GYsdcaLxnaO5Ou1FmKMug1c/UbSfbPHYJ+0vN7IN2Ttm3wjy5Glw+G0sjzTt9vKZ2eRn
 qh4A+8sr6kOoyFKuymZKKUgUnd5NnPswe6iFGjNDFiZaFW3TzXwTKxEN7yb/DIoE/fGU
 XnzFPqyngP+HkEdzToVKrNmke/j00jedKhJOwJT+Szl63JO9L4T7CI7vFKfiDUq6NSn6
 cHr5PDVc1tQIQpWsxPrC/AshHg/Q9Vg3OOEMs9rjfyTJhoVAtl5CE6kqoBS4Stzkgkmp
 5aJQ==
X-Gm-Message-State: AOJu0YyiP9snA8YYPHqGghzEkEMZk24Wtsi01FpX1S2A/tuyXUXAitTx
 9cPP24/pafzTugrVggReBO/BnxIxSBl2UxepD+/83JxJ5ruHcJun/oCLL2Z6Fa/Jh3d7AWHG+fE
 UPc1LtDoMCIZB/Q9x4CjDWg0VnXHiu1PuJpKM
X-Google-Smtp-Source: AGHT+IEDuUMNgeaTEaLsheRGs817IE1VjsunvdmPX9HWw7aYG4FfYgrAWwGjaHzZ9nMk6Ae8VYif2z9ZgHl5FlYevQM=
X-Received: by 2002:a25:838f:0:b0:e03:a9fd:7030 with SMTP id
 3f1490d57ef6-e0b115751e4mr2759712276.12.1721877529197; Wed, 24 Jul 2024
 20:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240719163627.20888-1-ian.forbes@broadcom.com>
In-Reply-To: <20240719163627.20888-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 24 Jul 2024 23:18:38 -0400
Message-ID: <CABQX2QPUmEY71i5w+hUCMyNXxiY=SFN5hJP4zWr961CzkrfDpA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix overlay when using Screen Targets
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com, 
 doug@schmorgal.com
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

On Fri, Jul 19, 2024 at 12:37=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.co=
m> wrote:
>
> This code was never updated to support Screen Targets.
> Fixes a bug where Xv playback displays a green screen instead of actual
> video contents when 3D acceleration is disabled in the guest.
>
> Fixes: c8261a961ece ("vmwgfx: Major KMS refactoring / cleanup in preparat=
ion of screen targets")
> Reported-by: Doug Brown <doug@schmorgal.com>
> Closes: https://lore.kernel.org/all/bd9cb3c7-90e8-435d-bc28-0e38fee58977@=
schmorgal.com
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_overlay.c
> index c45b4724e4141..e20f64b67b266 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> @@ -92,7 +92,7 @@ static int vmw_overlay_send_put(struct vmw_private *dev=
_priv,
>  {
>         struct vmw_escape_video_flush *flush;
>         size_t fifo_size;
> -       bool have_so =3D (dev_priv->active_display_unit =3D=3D vmw_du_scr=
een_object);
> +       bool have_so =3D (dev_priv->active_display_unit !=3D vmw_du_legac=
y);
>         int i, num_items;
>         SVGAGuestPtr ptr;

Thanks. I pushed it to drm-misc-fixes.

z
