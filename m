Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0774F6ED12C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 17:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EF510E1B8;
	Mon, 24 Apr 2023 15:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71E810E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682349631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ybXQpJGX8ksVbqeQTg5aMwu/7o/goFFitwiYzrK7BM=;
 b=iLWSstTU8RFdFouf+/9bbF0wRY5a22XyOHsBZdBww1Ueumuu/zMB4dnk03Aqzid/ba0OuY
 DEMrGKXlRU0KHPsTfjPcNvLsghxKTlz3XFRIG2lBVk7DQIAeJAOdIDdw/Txe/1832IkE6k
 eChzSTmhKna7fjboE8L9lkDu3uYsJZI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-g5Hq6X0IOxW0QbhIzFUuhg-1; Mon, 24 Apr 2023 11:20:29 -0400
X-MC-Unique: g5Hq6X0IOxW0QbhIzFUuhg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so2670501fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 08:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682349628; x=1684941628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ybXQpJGX8ksVbqeQTg5aMwu/7o/goFFitwiYzrK7BM=;
 b=gkd+VzM3ToP10Ro292gDlqCUNAktjk1v2elA3o0Z7JMUw77HDi18OLEsU8Jp2vap7y
 29KdPIEDXjPmzQou1T3GSfmguzBCAHxlYWL1godPbIdiVFjThBOU6fhh+rI0+mps1ey0
 KHtFAJgmg16t+cL+pEHIWfpAr6NRLQNl9WddwIKq2RTx8YWEpr2dCzWqZnxOG7+R1Jh4
 WLJnzgswkpDb/89b5MsMJ3AZzylKiTNAd6ao/Tf53XbiQXfy8RXKktIzU3c9i+jDpkxX
 0A9Xgex01KvJhn2Xhxrh1ugYFYNjEWJWuXKHfOFlCqrQN5bDXy5sZ2ASLN3dHD86Rtgl
 /LrQ==
X-Gm-Message-State: AAQBX9fXnSOsi5fZjhafokGytIjy7zROI0vCVslYMwPQGQiYGpcjzEw6
 QFtTevsJw/30NkUGuzU93sX3KCtYhn1eLSX2nvtISNXA751wU5B3qDVJtEYUGKpbc2buG8u0fEA
 Z9Eo1zzvXCNyz2jjU88UqXvf+SNhJqqC8H+wrM4IRJzRb
X-Received: by 2002:a2e:924b:0:b0:2a9:f6f0:fc84 with SMTP id
 v11-20020a2e924b000000b002a9f6f0fc84mr3486694ljg.4.1682349628201; 
 Mon, 24 Apr 2023 08:20:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350brn3/2mvZw23jR8Revx5XmXXtkygZGuUo8HD5LLVeLxmu8zC85TkjrgP/HdRDXdUOJ1/BuBAsvCCX/3rAcWwU=
X-Received: by 2002:a2e:924b:0:b0:2a9:f6f0:fc84 with SMTP id
 v11-20020a2e924b000000b002a9f6f0fc84mr3486688ljg.4.1682349627904; Mon, 24 Apr
 2023 08:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230204184307.never.825-kees@kernel.org>
 <0a48d61b-6e11-9144-b11e-dd46de836c53@embeddedor.com>
In-Reply-To: <0a48d61b-6e11-9144-b11e-dd46de836c53@embeddedor.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 24 Apr 2023 17:20:16 +0200
Message-ID: <CACO55tv43F7TQGYCmifyzOxR-Ddt28wpj9t9RyK4sQPR6aU+bQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp: More DP_RECEIVER_CAP_SIZE array fixes
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 10:40=E2=80=AFPM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 2/4/23 12:43, Kees Cook wrote:
> > More arrays (and arguments) for dcpd were set to 16, when it looks like
> > DP_RECEIVER_CAP_SIZE (15) should be used. Fix the remaining cases, seen
> > with GCC 13:
> >
> > ../drivers/gpu/drm/nouveau/nvif/outp.c: In function 'nvif_outp_acquire_=
dp':
> > ../include/linux/fortify-string.h:57:33: warning: array subscript 'unsi=
gned char[16][0]' is partly outside array bounds of 'u8[15]' {aka 'unsigned=
 char[15]'} [-Warray-bounds=3D]
> >     57 | #define __underlying_memcpy     __builtin_memcpy
> >        |                                 ^
> > ...
> > ../drivers/gpu/drm/nouveau/nvif/outp.c:140:9: note: in expansion of mac=
ro 'memcpy'
> >    140 |         memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
> >        |         ^~~~~~
> > ../drivers/gpu/drm/nouveau/nvif/outp.c:130:49: note: object 'dpcd' of s=
ize [0, 15]
> >    130 | nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIV=
ER_CAP_SIZE],
> >        |                                              ~~~^~~~~~~~~~~~~~=
~~~~~~~~~~~~
> >
> > Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquir=
e")
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: nouveau@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

sorry for not seeing this earlier.

> Thanks!
> --
> Gustavo
>
> > ---
> >   drivers/gpu/drm/nouveau/include/nvif/if0012.h    | 4 +++-
> >   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  | 3 ++-
> >   drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 2 +-
> >   3 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gp=
u/drm/nouveau/include/nvif/if0012.h
> > index eb99d84eb844..16d4ad5023a3 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> > @@ -2,6 +2,8 @@
> >   #ifndef __NVIF_IF0012_H__
> >   #define __NVIF_IF0012_H__
> >
> > +#include <drm/display/drm_dp.h>
> > +
> >   union nvif_outp_args {
> >       struct nvif_outp_v0 {
> >               __u8 version;
> > @@ -63,7 +65,7 @@ union nvif_outp_acquire_args {
> >                               __u8 hda;
> >                               __u8 mst;
> >                               __u8 pad04[4];
> > -                             __u8 dpcd[16];
> > +                             __u8 dpcd[DP_RECEIVER_CAP_SIZE];
> >                       } dp;
> >               };
> >       } v0;
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/=
gpu/drm/nouveau/nvkm/engine/disp/outp.h
> > index b7631c1ab242..4e7f873f66e2 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> > @@ -3,6 +3,7 @@
> >   #define __NVKM_DISP_OUTP_H__
> >   #include "priv.h"
> >
> > +#include <drm/display/drm_dp.h>
> >   #include <subdev/bios.h>
> >   #include <subdev/bios/dcb.h>
> >   #include <subdev/bios/dp.h>
> > @@ -42,7 +43,7 @@ struct nvkm_outp {
> >                       bool aux_pwr_pu;
> >                       u8 lttpr[6];
> >                       u8 lttprs;
> > -                     u8 dpcd[16];
> > +                     u8 dpcd[DP_RECEIVER_CAP_SIZE];
> >
> >                       struct {
> >                               int dpcd; /* -1, or index into SUPPORTED_=
LINK_RATES table */
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers=
/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > index 4f0ca709c85a..fc283a4a1522 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > @@ -146,7 +146,7 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, voi=
d *argv, u32 argc)
> >   }
> >
> >   static int
> > -nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[16],
> > +nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER=
_CAP_SIZE],
> >                          u8 link_nr, u8 link_bw, bool hda, bool mst)
> >   {
> >       int ret;
>

