Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03965770404
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21FD10E720;
	Fri,  4 Aug 2023 15:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2D310E720
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:07:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0B016206A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3D4C4339A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691161637;
 bh=w545Z+d9TiXeg8V59l+wEz1UXwdM7KzVmVGqDmBSgu8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jf8zI10ODNKOXDods6xTXrfk3BmH077KaEN42Yj1Q6+waPX8RAhCMNm/+dTBVqhUV
 duqdkjFUrLvuo+NwChgtmlvQFT0dy2RcoVEXj198ZSveNO2BbaMGeXhRYZCf0koDFf
 y/gSfHTMK9Pu6fFu4JJOzyYJiWju+YlqeK4IAo60EVf/lOwamOJQlsOLn38rwiKH9M
 yWAkVOzr8qRA0uwtONWrk0RdXL6Z3eXNZp9bw7vmxqgA70WgWV11a8nsADt39eUW/f
 i/h27bblAo9YWi4F245h1UTGvv6wakuA8nrvg8YUJSaJPVRoqVM0n24MRJhvZ2trJJ
 iOqD7u1eQwbPA==
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-564cd28d48dso23532a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 08:07:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YzlHGzXJZ4CkUjQgf/qEZJjOi9UkhJS9Ln8k2ZCPU29PYttxpMy
 WFMx4y1BXSZRcr2ny9XUKJCzulyJrjcsE9UOKhkTxw==
X-Google-Smtp-Source: AGHT+IE/m2IH6dm0mgAq62QwDDxUm16U8hVFqqZBv8MRTU+FQdghR5KPxptx8eT7rxij+h67ZYNqU0BCQRYQrnxmjzk=
X-Received: by 2002:a17:90a:3b0a:b0:268:4314:2dc6 with SMTP id
 d10-20020a17090a3b0a00b0026843142dc6mr1705121pjc.37.1691161637007; Fri, 04
 Aug 2023 08:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
 <20230804-lt8912b-v1-2-c542692c6a2f@ideasonboard.com>
In-Reply-To: <20230804-lt8912b-v1-2-c542692c6a2f@ideasonboard.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 4 Aug 2023 17:07:06 +0200
X-Gmail-Original-Message-ID: <CAN6tsi72WM28b=-u+6x_nbar7YF9=eX0RH=jYcmSc5pN4y2KZw@mail.gmail.com>
Message-ID: <CAN6tsi72WM28b=-u+6x_nbar7YF9=eX0RH=jYcmSc5pN4y2KZw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge: lt8912b: Fix crash on bridge detach
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 12:48=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> The lt8912b driver, in its bridge detach function, calls
> drm_connector_unregister() and drm_connector_cleanup().
>
> drm_connector_unregister() should be called only for connectors
> explicitly registered with drm_connector_register(), which is not the
> case in lt8912b.
>
> The driver's drm_connector_funcs.destroy hook is set to
> drm_connector_cleanup().
>
> Thus the driver should not call either drm_connector_unregister() nor
> drm_connector_cleanup() in its lt8912_bridge_detach(), as they cause a
> crash on bridge detach:
>
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
00000000000
> Mem abort info:
>   ESR =3D 0x0000000096000006
>   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 0x06: level 2 translation fault
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
>   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=3D00000000858f3000
> [0000000000000000] pgd=3D0800000085918003, p4d=3D0800000085918003, pud=3D=
0800000085431003, pmd=3D0000000000000000
> Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> Modules linked in: tidss(-) display_connector lontium_lt8912b tc358768 pa=
nel_lvds panel_simple drm_dma_helper drm_kms_helper drm drm_panel_orientati=
on_quirks
> CPU: 3 PID: 462 Comm: rmmod Tainted: G        W          6.5.0-rc2+ #2
> Hardware name: Toradex Verdin AM62 on Verdin Development Board (DT)
> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : drm_connector_cleanup+0x78/0x2d4 [drm]
> lr : lt8912_bridge_detach+0x54/0x6c [lontium_lt8912b]
> sp : ffff800082ed3a90
> x29: ffff800082ed3a90 x28: ffff0000040c1940 x27: 0000000000000000
> x26: 0000000000000000 x25: dead000000000122 x24: dead000000000122
> x23: dead000000000100 x22: ffff000003fb6388 x21: 0000000000000000
> x20: 0000000000000000 x19: ffff000003fb6260 x18: fffffffffffe56e8
> x17: 0000000000000000 x16: 0010000000000000 x15: 0000000000000038
> x14: 0000000000000000 x13: ffff800081914b48 x12: 000000000000040e
> x11: 000000000000015a x10: ffff80008196ebb8 x9 : ffff800081914b48
> x8 : 00000000ffffefff x7 : ffff0000040c1940 x6 : ffff80007aa649d0
> x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff80008159e008
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> Call trace:
>  drm_connector_cleanup+0x78/0x2d4 [drm]
>  lt8912_bridge_detach+0x54/0x6c [lontium_lt8912b]
>  drm_bridge_detach+0x44/0x84 [drm]
>  drm_encoder_cleanup+0x40/0xb8 [drm]
>  drmm_encoder_alloc_release+0x1c/0x30 [drm]
>  drm_managed_release+0xac/0x148 [drm]
>  drm_dev_put.part.0+0x88/0xb8 [drm]
>  devm_drm_dev_init_release+0x14/0x24 [drm]
>  devm_action_release+0x14/0x20
>  release_nodes+0x5c/0x90
>  devres_release_all+0x8c/0xe0
>  device_unbind_cleanup+0x18/0x68
>  device_release_driver_internal+0x208/0x23c
>  driver_detach+0x4c/0x94
>  bus_remove_driver+0x70/0xf4
>  driver_unregister+0x30/0x60
>  platform_driver_unregister+0x14/0x20
>  tidss_platform_driver_exit+0x18/0xb2c [tidss]
>  __arm64_sys_delete_module+0x1a0/0x2b4
>  invoke_syscall+0x48/0x110
>  el0_svc_common.constprop.0+0x60/0x10c
>  do_el0_svc_compat+0x1c/0x40
>  el0_svc_compat+0x40/0xac
>  el0t_32_sync_handler+0xb0/0x138
>  el0t_32_sync+0x194/0x198
> Code: 9104a276 f2fbd5b7 aa0203e1 91008af8 (f85c0420)
>
> Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 0e581f6e3c88..2d752e083433 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -589,9 +589,6 @@ static void lt8912_bridge_detach(struct drm_bridge *b=
ridge)
>
>         if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
>                 drm_bridge_hpd_disable(lt->hdmi_port);
> -
> -       drm_connector_unregister(&lt->connector);
> -       drm_connector_cleanup(&lt->connector);
>  }
>
>  static enum drm_connector_status
>
> --
> 2.34.1
>


Reviewed-by: Robert Foss <rfoss@kernel.org>
