Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C6FA90466
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 15:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A8E10E911;
	Wed, 16 Apr 2025 13:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mHR7EuuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60F810E918
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 13:32:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5493b5bc6e8so7921586e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744810333; x=1745415133; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+D5+uNrYNcwYfX/ZNFoFaIyUI3jWBOn1hJYAwymFvk=;
 b=mHR7EuuWHUiBETjF0yQ3DbyD5mVrr9LlzPLY6S0O5F/oDDuSOqxddggC7PkM0BD7i8
 wdHsBV+VCqSQWuoTDlRx+xdr2wAaNXn4jRPVZ0lMiYTbZEAVfsuQ4DpmWhRknc4YpEV+
 GzJIDXfxdRzUJndxidgDC6VVrG0tuxgp957AWXa34sC5qQHuJ+LVXCs9Xoxbg8HzZqXQ
 wgbh7XAaVClJdnjcfPAxcGawNeJNxYKewNeNHVU3MGFYiX+zbu+NQODWn5QZpW6NLzWC
 C51LsBA+3XdeItD6x1xfquQJAYygyxcuvymplkp/ENsUbkmoVDxANbx4reWLFYjAmCha
 9s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744810333; x=1745415133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+D5+uNrYNcwYfX/ZNFoFaIyUI3jWBOn1hJYAwymFvk=;
 b=gePyBocNG0UwJMzD5zIoVLvTduT23TWm/39dRUtyuQec86jx1cUVMJQ7hOwwuA/W9m
 DCqyNLaDImHBzCqT3fDg0/LHa90BG3YuEPn/GbIxyXytRwAlhe9HqZy5lfNTd4yqZ0+6
 z3DmF1Ufk/4L6sr0cmP92J21n9RxbaJhaq7R0M0HG+Ak/aEs0e4T2hkTm4KBJbFQC3Ql
 pDpdJ991Ogdk4vQQFcQo0bLNneb6PVCxNVj0SaaVxRGcRm2sKtezVlVv0E8O/bjH9bxq
 oWIzj4GZQy5bT3GAZ+pwGGUazDxBFQsYG7p3vI6S+qXTo4UfzVxMfMe79V13ZyU5fhZp
 WYuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1akpoGxJht3eSBRpQj+2GH9QjX3uoadvBnwCTTLUJnqLiNWhZdrJURPT2Wnxs2BZFU6GOY9HuaKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmFl44onAOoihBrqcErNAY7t4gpFS2w3KWS8gARY7r0m8jkwSs
 C0GFRhn0NkZTkJVHV5kGU1OEfOcjJCDPgV81JwdT9ZjlHRyjPyfmtRcwoKPjkb2dUfGMB+lRT6/
 Tw2Cv5Q/Cf9bTLh2fRe2qETZvbyM=
X-Gm-Gg: ASbGncvwOpW/7M6TkJ9Zbe5NhmrTsG5PWll2kklnUDVy6t3t+0whyX7fuUjyEhNFvMs
 Tu/oBy4DzZr7Efqyns2Edh3cvMseVSA11SFlDrPAHCEva7QlHXdRhHzDhGwBbqcq1KYQkBR65na
 d5VjvO3lOr2o8XRxYF4DNSupqmh2EyKImHXFQaXf7mS+6bDVRYkzNQ0Q==
X-Google-Smtp-Source: AGHT+IGJlLh5tPWD0pehjZiHE4BQl013ZBsrUn9c+BlrxY+5HyM4uF2C42/ZlKMfRWd4Vow+1rZG0XuE3PSxUqbNUzE=
X-Received: by 2002:a05:6512:3b10:b0:549:38eb:d690 with SMTP id
 2adb3069b0e04-54d64ae6c83mr634627e87.36.1744810332489; Wed, 16 Apr 2025
 06:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Dw9O_8E72ZsQhm7j+PX9XQfj9_w-WrkzaxczyyCGndVA@mail.gmail.com>
 <b24d22a3-5206-4738-8ccb-2f2ec8ec9194@suse.de>
In-Reply-To: <b24d22a3-5206-4738-8ccb-2f2ec8ec9194@suse.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Apr 2025 10:31:59 -0300
X-Gm-Features: ATxdqUGPf4SxOMtsLBI_bIEnlDRWL-IZsGY2ABTI7UPaK2B98xGJpQt0bxXxy-8
Message-ID: <CAOMZO5Do5NsigXiTguY8gHjV=yX_fDnRkU3=2XOPe0TyyD03vw@mail.gmail.com>
Subject: Re: Reggression caused by "drm/fb-helper: Don't use the preferred
 depth for the BPP default"
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>
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

Hi Thomas,

On Wed, Apr 16, 2025 at 3:41=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> The proper fix would patch the driver to support 32-bit correctly. It
> looks like the panel only supports 16 bpp and 24 bpp, so format
> conversion would be required.
>
> For an easier fix, you can replace drm_client_setup() at [1] with
> drm_client_setup_with_fourcc() and pass DRM_FORMAT_RGB565 as the second
> argument.

Your suggestion works, and I have just sent a patch.

Thanks a lot for your help!
