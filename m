Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E3B84D087
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 19:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C967E10E633;
	Wed,  7 Feb 2024 18:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="E//Vzu3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F7D10E633
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 18:04:03 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dc6d2e82f72so887292276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 10:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1707329042; x=1707933842;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvQ4fAVDXNjYDUYr9E9G3/mg9Ijr6WIUtV7FtkH9EwY=;
 b=E//Vzu3feA/r0+ZfD/L5W2v/DTMcr/lAFPKTWQCD92Mush7RE9cs06Tr6tvC1c1ojH
 WwDsoQUUtTxYGCj2hWOFEyP14sXiPah9RjknkdmflmjCmVz1lYgs8SBFETQYD1JKVtSX
 gYWQJmFhAQtnC6yWbjUS2bcUcs2EAq+CnIynI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707329042; x=1707933842;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvQ4fAVDXNjYDUYr9E9G3/mg9Ijr6WIUtV7FtkH9EwY=;
 b=hb2Xxs0UMN7OX5zDfotzvFbx+qT7BABFzEtBNs3xZ5LU2GcSkKUF5M4OdJ/6n3u7Hn
 UKu4zLHT6tJjyM7yamVDZniWzV3EAJvcyl6OEiyicqKumAMByaRp9LwxwJCKOi0HHNvF
 wkukZ89ItnnH0XzgY7TWs021dCV6sqyzYT9Q+q2+bekMQheQTInN3SgPL6qpJY6zvKDE
 mxdHDiiCDlFCNQrM/1NMzI0cJ2oebnUHQXpo7SBH8dBJosUfHB8QDFrIxl0IezYYkkLJ
 CCSiFb5DbVuwbvQaD+CvQBNEh1E8Opd+Zlc95pY30Ww7d97HffG7ip4CAMF1gIPYmF99
 uUsA==
X-Gm-Message-State: AOJu0YxL+uA0BLKQcbzFRcAIVLq7AW7w5+N3kdklPsUGNr+z1JhiXiUN
 Vcv9RruJPcAQaB71CD3loRYKwPu/jvVTHebL8iYj598Dk7DE2G8p11QOExDsmPUGXUgDdcHKgfm
 LNn3DiPklZoLkBgeUXSh8bc1jU5fHB0PFOMVbPVhZ7WmVxggfVA==
X-Google-Smtp-Source: AGHT+IEW3feyBstZTbP9PdGbl7AOynJ21hxtlChVfDiwwYnwxF0IQDzE0gTaR5cmupSVxUt3c2+B79SG6Indtcb46r0=
X-Received: by 2002:a25:6b47:0:b0:dc6:be1f:6d98 with SMTP id
 o7-20020a256b47000000b00dc6be1f6d98mr5779838ybm.16.1707329042512; Wed, 07 Feb
 2024 10:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <20240201051343.9936-1-ian.forbes@broadcom.com>
 <CABQX2QPru=0O2nWinQEC-GrpvDpvNkECDKQT_CDJGhqnf_mGpw@mail.gmail.com>
 <CAO6MGtiHQXzX73jOxW_uSh0UB6FGZ4KoaLgKr-HfEmDwdZ83Ow@mail.gmail.com>
In-Reply-To: <CAO6MGtiHQXzX73jOxW_uSh0UB6FGZ4KoaLgKr-HfEmDwdZ83Ow@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 7 Feb 2024 13:03:51 -0500
Message-ID: <CABQX2QO6S-QgR0gsW63r+-zK1odTHjz6Ncm74uL74DrZej47fw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com
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

On Tue, Feb 6, 2024 at 4:30=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com>=
 wrote:
>
> So the issue is that SVGA_3D_CMD_DX_PRED_COPY_REGION between 2
> surfaces that are the size of the mode fails. Technically for this to
> work the filter will have to be 1/2 of graphics mem. I was just lucky
> that the next mode in the list was already less than 1/2. 3/4 is not
> actually going to work. Also this only happens on X/Gnome and seems
> more like an issue with the compositor. Wayland/Gnome displays the
> desktop but it's unusable and glitches even with the 1/2 limit. I
> don't think wayland even abides by the mode limits as I see it trying
> to create surfaces larger than the mode. It might be using texture
> limits instead.

So the SVGA_3D_CMD_DX_PRED_COPY_REGION is only available with dx
contexts/3d enabled/gb surfaces. With 3d or gb objects disabled we
should fall back to legacy display and that command shouldn't have
been used. Is that the case? Does it work with 3d/gb objects disabled?

There's a few bugs there:
- SVGA_3D_CMD_DX_PRED_COPY_REGION should only come from userspace, the
userspace should validate that the max amount of resident memory
hasn't been exceeded before issuing those copies
- vmwgfx should be a lot better about determining whether the amount
of resident memory required by the current command buffers hasn't been
exceeded
- In case of high memory pressure vmwgfx should explicitly disable 3d
support. There's no way to run 3d workloads with anything less than
64mb of ram especially given that we do not adjust our texture limits
and they will remain either 4k, 8k or more depending on what we're
running on.

But those are secondary to making resolution switch work correctly on
basic system, i.e.:
1) Disable 3D and gb objects
2) Check if in the kernel log vmwgx says that it's using "legacy display"
3) Check if the resolution switching works correctly
4) If not lets fix that first (fix #1)
5) Disable 3D and keep gb objects active
6) Check that the kernel log select "screen target display unit" and
have 3d disabled (i.e. no SVGA_3D_CMD_DX_PRED_COPY_REGION is coming
through)
7) If that doesn't work lets fix that next (fix #2)
8) Enabled 3d and gb objects (your current default)
9) Check if max_mob_pages (i.e. max_resident_memory) is smaller than
what we'd need to hold even a single a texture limits * 4bpp, print a
warning and disable 3d (this should bring us in line with what we
fixed in point #7) (fix #3)

So basically we want to make sure that on vmwgfx all three
configurations work: 1) 3d and gb objects disabled, 2) 3d disabled, gb
objects enabled, 3) 3d and gb object enabled.

z
