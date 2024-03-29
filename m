Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBFF89104E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 02:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8393910F023;
	Fri, 29 Mar 2024 01:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="caJUw0xA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3025010F023
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 01:22:13 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso1475843276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 18:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1711675332; x=1712280132;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQHwsmK10rM2rYfOfM9pFzqqWmWWFqzZftrHg7hbHEU=;
 b=caJUw0xAZ4EPLvkyv2hNcRXMaPAPyQSILYcQD+yZz+gG8G10xgxLd3eZOySiOnhpL7
 qwAzw4Hm/TYSO9gcohG2xvtVuv3XGFGfYtDM9SGhL1OZKmD12B3nGt7RFTSyukp6GgmZ
 Z7K14lzfQEH4VY0Yn0LDllnodRnj9e+UaJe1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711675332; x=1712280132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQHwsmK10rM2rYfOfM9pFzqqWmWWFqzZftrHg7hbHEU=;
 b=E87P/TfxztJMFQRB727OhQV4rVz1vmtrdtDNLxj+aQplRb6rvpF9tcpafUR/NZhN3v
 WdeDcT0RCvM0/+ExlIsi9kmHssib+m3G5zL7UXg89kYLKvgmbjlJIB6hzeesfxLhj5nk
 jyP3HlsDXUD4C+9NCkTNOZn+Fp5SWz9e91ocdGhgU2guQI3nSVJXInReA48QTAU+gdCc
 dlJMq8PUmuf5btS4HnMFIdHHp2GFhJtOl2+7dB6hrbwwoX5xq9ekEAg7R7eHJVIZbyYI
 m8TPyCB68cZe4nIvWe0wOxdze/tEt2ogR4O8K9JHSuc5fDfuUqKMkig0CUAV9WHxmU5z
 TmVg==
X-Gm-Message-State: AOJu0YzAFrNCaLazVdMe5CoLsQ+VK+mePKjUQLOX/2WEHXgZTJjxIaiu
 tJMnTlfOdsJyZXHmOSk/101wgic5Q3E4G63QKZhqtH4zIBc2pYuN2IbD91l0Tirc/tNaKmjoNBF
 WEocY0f++QXmZ2cLM/f0W4bLyVbB8HJ4Nqtkk
X-Google-Smtp-Source: AGHT+IH0FkZVHSwRIdgLMY4yn8/aN92+BSpTLdhIV5bbwxUY7yMdlwUy6lc80+4S2LpX4++p1pQ4xmwiPFcu36MQBEg=
X-Received: by 2002:a25:b118:0:b0:dcc:7131:ad4a with SMTP id
 g24-20020a25b118000000b00dcc7131ad4amr944642ybj.62.1711675331974; Thu, 28 Mar
 2024 18:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240328190716.27367-1-ian.forbes@broadcom.com>
In-Reply-To: <20240328190716.27367-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 28 Mar 2024 21:22:01 -0400
Message-ID: <CABQX2QOm3EcpMKT=YB=1wd86WdDY_Uy2jEGD=n3Qz_huGGkVuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Don't memcmp equivalent pointers
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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

On Thu, Mar 28, 2024 at 3:31=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> These pointers are frequently the same and memcmp does not compare the po=
inters
> before comparing their contents so this was wasting cycles comparing 16 K=
iB of
> memory which will always be equal.
>
> Fixes: bb6780aa5a1d9 ("drm/vmwgfx: Diff cursors when using cmds")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index cd4925346ed4..fbcce84e2f4c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -216,7 +216,7 @@ static bool vmw_du_cursor_plane_has_changed(struct vm=
w_plane_state *old_vps,
>         new_image =3D vmw_du_cursor_plane_acquire_image(new_vps);
>
>         changed =3D false;
> -       if (old_image && new_image)
> +       if (old_image && new_image && (old_image !=3D new_image))
>                 changed =3D memcmp(old_image, new_image, size) !=3D 0;
>
>         return changed;
> --
> 2.34.1
>

The patch looks good but please use "dim checkpatch" and fix the
issues it found. For the "Fixes:" line you also want to use "dim
fixes".

z
