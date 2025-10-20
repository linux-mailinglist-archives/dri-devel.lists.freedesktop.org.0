Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DEFBF2B12
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 19:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D1D10E33A;
	Mon, 20 Oct 2025 17:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MX08mmGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CC010E33A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:24:19 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-367444a3e2aso56651281fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760981058; x=1761585858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJL3ymzyML+diLAVT9nhgdl7Vx9TWLZbPp7QEm8FssI=;
 b=MX08mmGRCuZfrvKthxr9x+VmWUK7w+Pl/4xQZt/A+ejxf58UN+tBq1Gx1n944NWBYL
 //mzgJMg4uBp2qR8icK/SoGdOIJoX0x4a4Pqf6qy+lBrmJMa2n9ENfBMkRTBVmaUFk3t
 41GVzXSejGGjW3WLAiU2UP/EJvuIGQTnBiUpSrGj6rM13fBNBUxu2DWqoPkt3+xbpE5N
 DMBr48Pils5KARomT2Yu22U2TU1v5rjXEmslRilFGrY8GnNGS/40EHyYlZB5eGF4mJKg
 b2RuP2BuPYmBMVzQ+q4wXpxt67BPNeCBqb19X5bx1AC4MHX2BMQ/n3J5sqlGbwzyxv87
 G1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760981058; x=1761585858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJL3ymzyML+diLAVT9nhgdl7Vx9TWLZbPp7QEm8FssI=;
 b=aHVcBWv5V6t7oOERC9fClpfPJoOyHhu6zDXjTR7h8ZTWEYUjmaN9fs3O13RQVux4Z2
 /K+6VXfJG08GH5nGOs28R5FSbuZcqZeWcrfEi6I/+sxttAMhofuJb9gMPczdMKCkiteH
 KaTyTTheuBce9m1iFQb8BQzkYAoUZNjP/PNJs9jSlbriedBC7Dkf95D1KobjP/BO9yjI
 QGYtLlkOA44KoR5i7yIshat5qfC9yWqFTQUjNgMjHak5segXV4NcZWnN8MVQ3UuOD8BT
 vGA7ub4cZj+r9WhstCJfnQ7Wvod6Im+q0/DwgNOhkzsAevrMiffSqtL2pbeG3UY6v5jr
 Gmkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj0Ac345OooU0tX1I+IK01gExGzuBirSHg8zXVhBN+JeWPCupB6K0UdLhSJZ+t4BMk7fUuS4mULH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1+ZJFRDgK06Kj04SXDQgZNQ66snQ9lnPehYhH2rsk8BftVJ2Y
 vaYC3NpuPGdYPhtyLLTlNUKXTPhnI+16b3BYJvMK7xF//j2supNr3NE7aa7G9Aqb3Op2e7JkQiC
 v8CmX3c5EDu1HzrFj0H8XlLZWy0FKywQ=
X-Gm-Gg: ASbGncsgirtxlFgZQPuNGr2Wn9EceeXzY210pNcaA/OiUYR3tcoKSfq4ZXd+ILa+Vxh
 tXsDCE78lbjz0r4KOKvyO+Buxht6vfmgu3Eukbk2XyMuvFQpuVtMRCg6TgZgRlbwJVD/Wk7pahq
 Wt3lpCzUbhoC5GFTInuqmU2okFc2m360EBLQlg4rccG3695y8Ses7ogDpEzw/0asBb099IUU0HA
 Dzz/hN3FaGj3ZckXzJpGHhuHfEBcbiR3HwLZBt1BKp+8tZwhvLC74G2bNd+dZBzdQiiLfoIC7Hn
 nEgBWqKmjrHIGzqg
X-Google-Smtp-Source: AGHT+IFGvquo7dKjulQge3D4nLth2WI8das3/MTTYuoViw5UYS7r0NQDoBhHAaPE++J0d5/68a7BWV0yZERz90yIgHQ=
X-Received: by 2002:a05:651c:1990:b0:375:f6b9:c948 with SMTP id
 38308e7fff4ca-377978d7927mr37082001fa.15.1760981056694; Mon, 20 Oct 2025
 10:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251013205155.1187947-1-festevam@gmail.com>
 <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
In-Reply-To: <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 20 Oct 2025 14:24:05 -0300
X-Gm-Features: AS18NWDxC1BDffoJ0EW6ktW9w7SITyz7Fejydue0HKFG2UIjYNHc8u5VIdoiknI
Message-ID: <CAOMZO5AGRejEwNvkH0Di0HVi8QPduTeCSud+_GqOkD4tqEcsdA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
To: Liu Ying <victor.liu@nxp.com>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 shawnguo@kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
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

Hi Liu,

On Tue, Oct 14, 2025 at 1:12=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:

> Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX28 =
LCDIF
> because at least i.MX28 LCDIF has the version and debug{0,1,2} registers(=
at
> 0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.

There are some DT users, such as Barebox that matches against
fsl,imx28-lcdif, so we cannot remove it.

In my first attempt,  I tried removing it:

https://lore.kernel.org/linux-devicetree/20241028180844.154349-2-festevam@g=
mail.com/

but this was rejected due to potential dtb compatibility breakage:

https://lore.kernel.org/linux-devicetree/4addc413-dd13-4867-8c49-45539af7b4=
5b@pengutronix.de/
