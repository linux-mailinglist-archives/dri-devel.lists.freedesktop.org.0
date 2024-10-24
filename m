Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EC9ADBF0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 08:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A949D10E8B1;
	Thu, 24 Oct 2024 06:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3hEfQCzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C497E10E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 06:17:05 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-71e5a62031aso395505b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 23:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729750625; x=1730355425;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kDqeaAprBXUkM4Fq1Ym36ZhnawEXTDWt16M3cGZQYI=;
 b=3hEfQCzfnIpL/SxwrpeOcZ4piXrXBdLYB+buPUlPCW/x/We5VQtZYpPCeJIB3HFYfu
 BUSPpfajA0SLUOok+xCsEBWg858T1B+NI0KlhZbBBblgob6pj73AwdgX/+zG3LV3SKoU
 W+38CWQVWdfe0GIOcfmZIj7app2G4fSHINlbC8Fj0TNin8TsTbNH5D/tQclrnab1luHc
 m2ysXLZ0oVQqCUnltxsbsdvIbf0tdY1gxJGtvnjlIG94qHVbiI1lMsg9/r9JaRq54rKT
 cvjVMgoxJ0XR6Q9xl1o+vr8Enx0b3wNIKddMBxyEfTC/YkIWyCUNj7zigsOUiNx92pHn
 Ypvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729750625; x=1730355425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kDqeaAprBXUkM4Fq1Ym36ZhnawEXTDWt16M3cGZQYI=;
 b=llbYI5LqgajsAD5fn/lwT+gmGthprrSPlaBRoA7t5LutX94cgYhT498+S+XKeSmt6d
 b6RNixy94+Xm/rQ1PXz20VpkGDG+kfm+zhEWtwgd6uo6UVYq+zXCdeNU63IHl9pt5aEo
 p6pz1qdtTPVD3Vmg4DLLdV0Z+UsZSQib6PN5xLpj1/pYYLJ0YVrgs40fOc40idOw3R9V
 nYZBEZbIetwy5WCxJgp5OzJnvIotkWkEWhDeHCV659gjvGPby/IIlLGJK4zCoS1HAzQK
 mj9/AqAeBQHJOp3G1GRiwkOTREK2rNsmrOWre8xy73ibKJ4sHbwLM8zWmQdT5V9Hv+Rk
 0hcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYWKSrO8+93lEo/jZxEy7dcxi6nzeN1p4mvoKK/5fJmY9RiZuMrkLSxmSKsf49oj0+b168gTHvY9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTIqfID2Ym7H38oqPmwp3l+7VctJsk12v48ttwKimuOBgHjLJl
 +wwibcmxBNG5hV/Yk1uAZRucfHBz5azQX5k059YuWtXc/EBl+kR7rEHfSy2oiGDJB7MtjZtFrXC
 lqUN42WuZrPbpl3JsVrIQBC6hkvk9Y5G5T4mP
X-Google-Smtp-Source: AGHT+IFcCYtp7nVgkoJ5rzaztD8OtipNso126UyODrDbPTgNIyDaB+s9edBYS51aMEHDl37/TiPH24OOcDTayFV74a4=
X-Received: by 2002:a05:6a20:5da3:b0:1d9:83cc:ef90 with SMTP id
 adf61e73a8af0-1d983ccefdamr1940597637.8.1729750624651; Wed, 23 Oct 2024
 23:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-4-saravanak@google.com>
In-Reply-To: <20241024061347.1771063-4-saravanak@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 23 Oct 2024 23:16:26 -0700
Message-ID: <CAGETcx_0gqbo5Xf9mZGrBZszZsmKBdqRreb-=O_PvOR_2Yc5Cw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a
 bit more useful
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

Greg,

Can you fix up the commit subject prefix to "driver core: fw_devlink:"
please? Don't want to send v2 just for that.

-Saravana

On Wed, Oct 23, 2024 at 11:14=E2=80=AFPM Saravana Kannan <saravanak@google.=
com> wrote:
>
> It would make it easier to debugs issues similar to the ones
> reported[1][2] recently where some devices didn't have the fwnode set.
>
> [1] - https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@no=
tapiano/
> [2] - https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/base/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index a4c853411a6b..3b13fed1c3e3 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2181,8 +2181,8 @@ static int fw_devlink_create_devlink(struct device =
*con,
>                 }
>
>                 if (con !=3D sup_dev && !device_link_add(con, sup_dev, fl=
ags)) {
> -                       dev_err(con, "Failed to create device link (0x%x)=
 with %s\n",
> -                               flags, dev_name(sup_dev));
> +                       dev_err(con, "Failed to create device link (0x%x)=
 with supplier %s for %pfwf\n",
> +                               flags, dev_name(sup_dev), link->consumer)=
;
>                         ret =3D -EINVAL;
>                 }
>
> --
> 2.47.0.105.g07ac214952-goog
>
