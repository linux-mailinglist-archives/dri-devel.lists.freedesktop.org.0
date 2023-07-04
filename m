Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF2F7478EF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 22:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFAA10E07D;
	Tue,  4 Jul 2023 20:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AE310E07D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 20:19:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51dec0b6fecso5702592a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688501981; x=1691093981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O07gPTs5NO83T6w1RLtLnKZP418bav+Sd3y8HtTNF9Y=;
 b=cPRmVnbDq74/9zTQAnR2NRJiDcmPwWi15ugh8hF6Q+RGikQUgHOZ1YmNxVpX/zKCDv
 NPBl9SGX6ARAwAKHDVXHt5+95Ql+EQbexo2B3cRCRvD6Hgjf8T6j6g3QGXIFJAZr4rph
 O3uyIhRYvuU8TNH+TFnVQfeIX7gHZ67J2mjf+kE4SdQtVlqDPPqNxaAkmowKleyqYzmb
 o7E4uCkp6KN5IOkK9fbWa5NJHnklMiqtu9QzXhm9y4i6RrGNhD5apBS3cq5jOF/q8SFZ
 PjayQCZDzEgHZiRtu1KcSRriEiwCxV2KZzg/SrsQPCYHfdyBDY0b+JgPmVGO4a8XHIco
 wIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688501981; x=1691093981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O07gPTs5NO83T6w1RLtLnKZP418bav+Sd3y8HtTNF9Y=;
 b=Ucv9wxMAyL3PD+s1uFZ8X4ThDdFBFC28EWa1CwhiGrnFpD7w8wDKnsQuZth2LD2nv6
 t+Q+aI/cQPbMSsiOllTMlOp3W/WBfxiY1DtWV+JYSjKYue0oVtWbvqw6HLZyJ1+Ho5Dh
 WQJBtNP1oZF6Kz60YoPvn4/C8rIdCCTvE2CBOuKY0OlJXqmmBf7fDocXzz81imlSPGz8
 rqMWb05pI/ZTWPDzERzeYHaQHgdtTxaj1LhIkoba2xVtvht0PTsMcmcqkDgQkuXuUQku
 VciHjt4jkGixtTanLG31Mgi5tQHr/fPu+S+OT5ki5VvNqxtchCCZDPLtzzNA8+h7iw7U
 KeAA==
X-Gm-Message-State: ABy/qLbMEbGg/vUGkJnmYfX8AtbHg/5i5PPHBG4M9Dmq+KaZWVgyNJcz
 MWcekLp0BWJNvwMpCDwXqUar8++qMVKhthWNF0ajZ3tz
X-Google-Smtp-Source: APBJJlE5qZM+5iDjlUPTTXElEMwOJnFEsu5i+AUsNiVOOudPZy3ZzTquzP/IcAED1k6/CAS7xpMKp4VWsuz1UeFCxMo=
X-Received: by 2002:a17:906:5653:b0:992:5cda:69f1 with SMTP id
 v19-20020a170906565300b009925cda69f1mr11045696ejr.61.1688501981176; Tue, 04
 Jul 2023 13:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230616190934.54828-1-zack@kde.org>
 <51c40394-9b5c-7643-b973-b54ae5e642e0@gmail.com>
In-Reply-To: <51c40394-9b5c-7643-b973-b54ae5e642e0@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 5 Jul 2023 06:19:28 +1000
Message-ID: <CAPM=9tw3we55MLVGqaauNApwu3mpYAgFUrpn1UVTrXVOjP9nHw@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix shader stage validation
To: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

What tree has/is this landing via, not seeing it upstream yet.

Dave.

On Sat, 17 Jun 2023 at 20:25, Martin Krastev (VMware)
<martinkrastev768@gmail.com> wrote:
>
> From: Martin Krastev <krastevm@vmware.com>
>
>
> Looks good!
>
>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
>
>
> Regards,
>
> Martin
>
>
> On 16.06.23 =D0=B3. 22:09 =D1=87., Zack Rusin wrote:
> > From: Zack Rusin <zackr@vmware.com>
> >
> > For multiple commands the driver was not correctly validating the shade=
r
> > stages resulting in possible kernel oopses. The validation code was onl=
y.
> > if ever, checking the upper bound on the shader stages but never a lowe=
r
> > bound (valid shader stages start at 1 not 0).
> >
> > Fixes kernel oopses ending up in vmw_binding_add, e.g.:
> > Oops: 0000 [#1] PREEMPT SMP PTI
> > CPU: 1 PID: 2443 Comm: testcase Not tainted 6.3.0-rc4-vmwgfx #1
> > Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Refer=
ence Platform, BIOS 6.00 11/12/2020
> > RIP: 0010:vmw_binding_add+0x4c/0x140 [vmwgfx]
> > Code: 7e 30 49 83 ff 0e 0f 87 ea 00 00 00 4b 8d 04 7f 89 d2 89 cb 48 c1=
 e0 03 4c 8b b0 40 3d 93 c0 48 8b 80 48 3d 93 c0 49 0f af de <48> 03 1c d0 =
4c 01 e3 49 8>
> > RSP: 0018:ffffb8014416b968 EFLAGS: 00010206
> > RAX: ffffffffc0933ec0 RBX: 0000000000000000 RCX: 0000000000000000
> > RDX: 00000000ffffffff RSI: ffffb8014416b9c0 RDI: ffffb8014316f000
> > RBP: ffffb8014416b998 R08: 0000000000000003 R09: 746f6c735f726564
> > R10: ffffffffaaf2bda0 R11: 732e676e69646e69 R12: ffffb8014316f000
> > R13: ffffb8014416b9c0 R14: 0000000000000040 R15: 0000000000000006
> > FS:  00007fba8c0af740(0000) GS:ffff8a1277c80000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00000007c0933eb8 CR3: 0000000118244001 CR4: 00000000003706e0
> > Call Trace:
> >   <TASK>
> >   vmw_view_bindings_add+0xf5/0x1b0 [vmwgfx]
> >   ? ___drm_dbg+0x8a/0xb0 [drm]
> >   vmw_cmd_dx_set_shader_res+0x8f/0xc0 [vmwgfx]
> >   vmw_execbuf_process+0x590/0x1360 [vmwgfx]
> >   vmw_execbuf_ioctl+0x173/0x370 [vmwgfx]
> >   ? __drm_dev_dbg+0xb4/0xe0 [drm]
> >   ? __pfx_vmw_execbuf_ioctl+0x10/0x10 [vmwgfx]
> >   drm_ioctl_kernel+0xbc/0x160 [drm]
> >   drm_ioctl+0x2d2/0x580 [drm]
> >   ? __pfx_vmw_execbuf_ioctl+0x10/0x10 [vmwgfx]
> >   ? do_fault+0x1a6/0x420
> >   vmw_generic_ioctl+0xbd/0x180 [vmwgfx]
> >   vmw_unlocked_ioctl+0x19/0x20 [vmwgfx]
> >   __x64_sys_ioctl+0x96/0xd0
> >   do_syscall_64+0x5d/0x90
> >   ? handle_mm_fault+0xe4/0x2f0
> >   ? debug_smp_processor_id+0x1b/0x30
> >   ? fpregs_assert_state_consistent+0x2e/0x50
> >   ? exit_to_user_mode_prepare+0x40/0x180
> >   ? irqentry_exit_to_user_mode+0xd/0x20
> >   ? irqentry_exit+0x3f/0x50
> >   ? exc_page_fault+0x8b/0x180
> >   entry_SYSCALL_64_after_hwframe+0x72/0xdc
> >
> > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > Cc: security@openanolis.org
> > Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> > Testcase-found-by: Niels De Graef <ndegraef@redhat.com>
> > Fixes: d80efd5cb3de ("drm/vmwgfx: Initial DX support")
> > Cc: <stable@vger.kernel.org> # v4.3+
> > ---
> >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     | 12 ++++++++++
> >   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 29 ++++++++++--------------=
-
> >   2 files changed, 23 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwg=
fx/vmwgfx_drv.h
> > index 3810a9984a7f..58bfdf203eca 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > @@ -1513,4 +1513,16 @@ static inline bool vmw_has_fences(struct vmw_pri=
vate *vmw)
> >       return (vmw_fifo_caps(vmw) & SVGA_FIFO_CAP_FENCE) !=3D 0;
> >   }
> >
> > +static inline bool vmw_shadertype_is_valid(enum vmw_sm_type shader_mod=
el,
> > +                                        u32 shader_type)
> > +{
> > +     SVGA3dShaderType max_allowed =3D SVGA3D_SHADERTYPE_PREDX_MAX;
> > +
> > +     if (shader_model >=3D VMW_SM_5)
> > +             max_allowed =3D SVGA3D_SHADERTYPE_MAX;
> > +     else if (shader_model >=3D VMW_SM_4)
> > +             max_allowed =3D SVGA3D_SHADERTYPE_DX10_MAX;
> > +     return shader_type >=3D SVGA3D_SHADERTYPE_MIN && shader_type < ma=
x_allowed;
> > +}
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/=
vmwgfx/vmwgfx_execbuf.c
> > index 6b9aa2b4ef54..d30c0e3d3ab7 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> > @@ -1992,7 +1992,7 @@ static int vmw_cmd_set_shader(struct vmw_private =
*dev_priv,
> >
> >       cmd =3D container_of(header, typeof(*cmd), header);
> >
> > -     if (cmd->body.type >=3D SVGA3D_SHADERTYPE_PREDX_MAX) {
> > +     if (!vmw_shadertype_is_valid(VMW_SM_LEGACY, cmd->body.type)) {
> >               VMW_DEBUG_USER("Illegal shader type %u.\n",
> >                              (unsigned int) cmd->body.type);
> >               return -EINVAL;
> > @@ -2115,8 +2115,6 @@ vmw_cmd_dx_set_single_constant_buffer(struct vmw_=
private *dev_priv,
> >                                     SVGA3dCmdHeader *header)
> >   {
> >       VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXSetSingleConstantBuffer);
> > -     SVGA3dShaderType max_shader_num =3D has_sm5_context(dev_priv) ?
> > -             SVGA3D_NUM_SHADERTYPE : SVGA3D_NUM_SHADERTYPE_DX10;
> >
> >       struct vmw_resource *res =3D NULL;
> >       struct vmw_ctx_validation_info *ctx_node =3D VMW_GET_CTX_NODE(sw_=
context);
> > @@ -2133,6 +2131,14 @@ vmw_cmd_dx_set_single_constant_buffer(struct vmw=
_private *dev_priv,
> >       if (unlikely(ret !=3D 0))
> >               return ret;
> >
> > +     if (!vmw_shadertype_is_valid(dev_priv->sm_type, cmd->body.type) |=
|
> > +         cmd->body.slot >=3D SVGA3D_DX_MAX_CONSTBUFFERS) {
> > +             VMW_DEBUG_USER("Illegal const buffer shader %u slot %u.\n=
",
> > +                            (unsigned int) cmd->body.type,
> > +                            (unsigned int) cmd->body.slot);
> > +             return -EINVAL;
> > +     }
> > +
> >       binding.bi.ctx =3D ctx_node->ctx;
> >       binding.bi.res =3D res;
> >       binding.bi.bt =3D vmw_ctx_binding_cb;
> > @@ -2141,14 +2147,6 @@ vmw_cmd_dx_set_single_constant_buffer(struct vmw=
_private *dev_priv,
> >       binding.size =3D cmd->body.sizeInBytes;
> >       binding.slot =3D cmd->body.slot;
> >
> > -     if (binding.shader_slot >=3D max_shader_num ||
> > -         binding.slot >=3D SVGA3D_DX_MAX_CONSTBUFFERS) {
> > -             VMW_DEBUG_USER("Illegal const buffer shader %u slot %u.\n=
",
> > -                            (unsigned int) cmd->body.type,
> > -                            (unsigned int) binding.slot);
> > -             return -EINVAL;
> > -     }
> > -
> >       vmw_binding_add(ctx_node->staged, &binding.bi, binding.shader_slo=
t,
> >                       binding.slot);
> >
> > @@ -2207,15 +2205,13 @@ static int vmw_cmd_dx_set_shader_res(struct vmw=
_private *dev_priv,
> >   {
> >       VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXSetShaderResources) =3D
> >               container_of(header, typeof(*cmd), header);
> > -     SVGA3dShaderType max_allowed =3D has_sm5_context(dev_priv) ?
> > -             SVGA3D_SHADERTYPE_MAX : SVGA3D_SHADERTYPE_DX10_MAX;
> >
> >       u32 num_sr_view =3D (cmd->header.size - sizeof(cmd->body)) /
> >               sizeof(SVGA3dShaderResourceViewId);
> >
> >       if ((u64) cmd->body.startView + (u64) num_sr_view >
> >           (u64) SVGA3D_DX_MAX_SRVIEWS ||
> > -         cmd->body.type >=3D max_allowed) {
> > +         !vmw_shadertype_is_valid(dev_priv->sm_type, cmd->body.type)) =
{
> >               VMW_DEBUG_USER("Invalid shader binding.\n");
> >               return -EINVAL;
> >       }
> > @@ -2239,8 +2235,6 @@ static int vmw_cmd_dx_set_shader(struct vmw_priva=
te *dev_priv,
> >                                SVGA3dCmdHeader *header)
> >   {
> >       VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXSetShader);
> > -     SVGA3dShaderType max_allowed =3D has_sm5_context(dev_priv) ?
> > -             SVGA3D_SHADERTYPE_MAX : SVGA3D_SHADERTYPE_DX10_MAX;
> >       struct vmw_resource *res =3D NULL;
> >       struct vmw_ctx_validation_info *ctx_node =3D VMW_GET_CTX_NODE(sw_=
context);
> >       struct vmw_ctx_bindinfo_shader binding;
> > @@ -2251,8 +2245,7 @@ static int vmw_cmd_dx_set_shader(struct vmw_priva=
te *dev_priv,
> >
> >       cmd =3D container_of(header, typeof(*cmd), header);
> >
> > -     if (cmd->body.type >=3D max_allowed ||
> > -         cmd->body.type < SVGA3D_SHADERTYPE_MIN) {
> > +     if (!vmw_shadertype_is_valid(dev_priv->sm_type, cmd->body.type)) =
{
> >               VMW_DEBUG_USER("Illegal shader type %u.\n",
> >                              (unsigned int) cmd->body.type);
> >               return -EINVAL;
