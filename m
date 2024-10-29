Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF889B553A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 22:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0C710E3B1;
	Tue, 29 Oct 2024 21:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wj15RK/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B1210E3B1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 21:46:13 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb4ec17f5cso52835191fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730238372; x=1730843172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2JblyV7WTsTnc5tXzfZ94G3EE4PGcp0Te58mEyBSswg=;
 b=Wj15RK/HAzrhcfItc+8Z0F4e7s7ZUbVpOClB8iOIVXJjBVKKU9Tuqxey3fJkB2/EKe
 WzJMs9kA5uTkIKh5k6efRKg5JCIU4RxWYkV7ln4n4QWMYidrxnb1fnESVmVuTdIopTgK
 9qeLQNhAhRXhqgrLvOc8W4DmEqhwnkAUfmAqb/CQy3aqEhS/oJkAaplNamFrKHzb44Jg
 GD+IlOowOUhGQcfuYBYVbUzu5mvNtNV/Vo+pDUEuvRec2uXWbia9OlzWCS95jEWmM4yk
 cADcsUQEoFzzLcMTJclqly7uOnaAFpe7cMnfaltOrneiZV+fi15eUpCCrGDjrDhBDpxM
 O/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730238372; x=1730843172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2JblyV7WTsTnc5tXzfZ94G3EE4PGcp0Te58mEyBSswg=;
 b=FhvaDb9Sd0HwLp9DlTtZwnqwdDaDWbAVnH2P+RGTIhDY+26qT2U2tTMkjkDq6b8WAH
 2VZzeIWK5kRi0PoXmh/Dzm1HlJmPp65OCUEc6YpbPvy242Jk2SlnJq2sOzvEo/JT5Dvz
 loRL5/KQ+qZL39w9oLHpjjqJuc5r+lR9HXgq+sG/XdecwTWIpmufJruz47lcbKyJ7mND
 2t3eLuHqqm9HU0X+3q2mLdpVkghVIvLBpB2EWDPHCNdY7D7pfc+WxlbKAPP1fQYQf9Gl
 uNWTbBMkvG3RYVeDVdx0S7tautoWhut5PTcFUi3cvsCg25CS3mWIT/Mfy9P3Wow3eqda
 0DwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXTz8XtJRdv4KFCLq18c/Cmqma7dJWs3Z4C8J0NdP8+bmoSn4IAq8A+hxda2pGVhbWYynY+rpLnRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhwMJFKip+OiNbFrkzdBCMFqFJWb+t2bZm9bJGDMnhnoe9+8wz
 MBuyEBA4fIm2HkRxH0OLlh6oAl3NQV2nq2Np6b0WPtJhG1ghHr19VD9Q4mXoOi9GSI+YiG5Gq5+
 MJ8nUotZAmTW4Na+bDZecgU7qhJE=
X-Google-Smtp-Source: AGHT+IHi88pfTT/7FGL5cee/QnViHlH7hwmFEHz8ie9yk7UIpmVR+ZWO36ke5t/IiJD3HDIGyxxtDXcGFtsxJ7egax8=
X-Received: by 2002:a2e:b8d1:0:b0:2fb:5786:251f with SMTP id
 38308e7fff4ca-2fd059e9c3amr6259081fa.37.1730238371622; Tue, 29 Oct 2024
 14:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241029191640.379315-1-festevam@gmail.com>
 <20241029191640.379315-2-festevam@gmail.com>
 <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
In-Reply-To: <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Oct 2024 18:45:59 -0300
Message-ID: <CAOMZO5AVPCLsoWbtKDzN2j8rUvvZUQQG_RkuLoF4BnKQDD-QhQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
To: Marek Vasut <marex@denx.de>
Cc: shawnguo@kernel.org, a.fatoum@pengutronix.de, andreas@kemnade.info, 
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Fabio Estevam <festevam@denx.de>
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

Hi Marek,

On Tue, Oct 29, 2024 at 5:16=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> So you wouldn't have to write three compatible strings for the 6sl/sll ,
> but only two ? I.e. this:
>
> compatible =3D "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> compatible =3D "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";

i.MX6SL and i.MX6SLL have a more advanced LCDIF version than the one on i.M=
X28.

The LCDIF block on i.MX6SL/i.MX6SLL has both overlay and CRC support,
corresponding to the MXSFB_V6 of the mxsfb_drv driver.

That's why it is better to have the compatibles as:

 compatible =3D "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
 compatible =3D "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This way they can match with a more specific fsl,imx6sx-lcdif entry.

If an OS does not implement the fsl,imx6sx-lcdif match, it can still
match with fsl,imx28-lcdif as a fallback, keeping the DT
compatibility.

I missed updating the binding example. I will wait for more feedback
before sending a v4.

Thanks
