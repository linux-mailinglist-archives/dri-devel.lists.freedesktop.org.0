Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C43C32F32
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 21:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0353A10E66C;
	Tue,  4 Nov 2025 20:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hsKhbnnn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1692A10E66C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 20:44:27 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5943d1d6442so254209e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 12:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762289065; x=1762893865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2ENbKwT7lv9tz28/K2qju3sHWO/1gvFfQERib9t/N8=;
 b=hsKhbnnnffRP2fbdyO+k9Z9dhqSiZdyKZZe5/VtRPTOlYm5Al4EkckhnRVAw3MSlp1
 y++J8m+JWhC1kXLYoFShiRoGi4tZR5AI9W3HWhfZPMGK8BN38ztLZe/5LR5v1fwW4HOf
 2QIhMBOjZ2VkO/Fv+h/fTLfN+7ErSHpcen59TkdAnjnLW+nSccNeppnd4+QzefePyFRE
 zrS+JI0FSPslJTdZRnsrA3Mn/DdspPjY+aCH26cb1Qx2vyLo8uRgpNnEtDC55QCHDSTz
 l1+Zs7b9U3wqySXOY8WhwBEGjOurG61jeaqmf8QM1F89blw5lGS31IQ+CYBPV5tBIuLt
 3GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762289065; x=1762893865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2ENbKwT7lv9tz28/K2qju3sHWO/1gvFfQERib9t/N8=;
 b=oEjfEW3g/gOfLot69rTHFgPPc4UJc9rhKc7/1cAC39ymPoULS/4QrLj8R6t+qOYjcK
 g90M2PqJ/ReZATuCNFqDDfRMHGwuIlWL/kXbPMlMWC0HMdp/G447cadsDgljAfl49ZQ+
 a63R9Iey4xLMdfpMIiudsaNbdtgMErdDsXaBtcPtYjEkrvSs21GXJqb1w/0PpmSMKiuY
 /caiKEE7F8ALe9NajzQBu9ExO0mJC0gmuBPqd12r6WQP7C76j/en5dA+PJR7pyMtweOe
 xvwsOdf97+FrWdyygICKpIDpZSb5nfVd6wK1+z7AoxS0WUpRvFsU/XcLsOUhlA+ULPL6
 bXmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7/dK3EmSP/w6a7bORLUUfNF5G1GX1QYKwUOdnWWU/CKu/qhq6oymRQWGhacLxr/efOiiPsmOVOxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5wfJZ5qKw+Hk5xj7uoqG1lSWxWp7iaI0T+W0gYPJT0mUy0za+
 flLY1BlmOF0aYubdEuNR3T/oEnxJ/SbbN3dYIzpkY0ufxzaPHPFwjfW3ri9902IXQceSj2dwyFY
 6BKS2CLXbQAhO1A2+C1DUzIAY3YB+GL8=
X-Gm-Gg: ASbGncsOHqwcBGSnCLwH0u5BxIHELDXOJuc9sQz9wPX2baAOaB8k1JYfi+D/2/SAG7n
 nLiTz5ExEDHuFbJIL1lmIS3SHyZXKXqJAhTr6bXqZP/i5O9L0da4BYLEbVqlVHumL+CpD+ViFln
 qBjST797KmHzAC/E4SLq5rZyX/0TqlWL9Byti9Xrb8Y0v3ZAP06WLZb7uPGDYJSPt5FrW6v7aoM
 wONrNupZ1Bw01wyOp0h7GkslXfFOENBIpBTL5PA0UzgwC3VfN9gDbOUux2beLR8jDT0xPyjsrZs
 T5RBTGJzRyR8Wxqb
X-Google-Smtp-Source: AGHT+IEgyDz6GgQ36aOhYZfcy+M9mJYKbg+MSqwHomwdqA+8oevBdUI0GcxGO3WedYpy3mCE8otuQ+c7+LgGwJyJeBc=
X-Received: by 2002:a05:6512:114f:b0:594:3c08:4f05 with SMTP id
 2adb3069b0e04-5943d74dd99mr147323e87.14.1762289064896; Tue, 04 Nov 2025
 12:44:24 -0800 (PST)
MIME-Version: 1.0
References: <20251013205155.1187947-1-festevam@gmail.com>
 <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
 <CAOMZO5AGRejEwNvkH0Di0HVi8QPduTeCSud+_GqOkD4tqEcsdA@mail.gmail.com>
 <37b8d968-a725-404e-8fd4-84c2a0bb464c@nxp.com>
In-Reply-To: <37b8d968-a725-404e-8fd4-84c2a0bb464c@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Nov 2025 17:44:13 -0300
X-Gm-Features: AWmQ_bn9ScRQzwOew3nNnHj8C-mT5iCyP0mJjFFvOaLk_a5CcV4aEWSlDVa3aoE
Message-ID: <CAOMZO5B+VcGxx9Xa6FFXxeka0qcqBmATrartguqMLMDK4fGduA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
To: Liu Ying <victor.liu@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 shawnguo@kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
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

Hi Ahmad,

On Mon, Oct 20, 2025 at 11:53=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrot=
e:
>
> On 10/20/2025, Fabio Estevam wrote:
> > Hi Liu,
>
> Hi Fabio,
>
> >
> > On Tue, Oct 14, 2025 at 1:12=E2=80=AFAM Liu Ying <victor.liu@nxp.com> w=
rote:
> >
> >> Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX=
28 LCDIF
> >> because at least i.MX28 LCDIF has the version and debug{0,1,2} registe=
rs(at
> >> 0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.
> >
> > There are some DT users, such as Barebox that matches against
> > fsl,imx28-lcdif, so we cannot remove it.
>
> Hmmm, it looks like software projects like Barebox don't really follow th=
is DT
> binding.  Is it possible to fix Barebox to avoid changing this DT binding=
 by
> this patch?  I'm assuming that Uboot has already been fixed.

What do you think?

Thanks
