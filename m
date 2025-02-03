Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB1A2653D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 22:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35A210E56F;
	Mon,  3 Feb 2025 21:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YiVHWzPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E7A10E56F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 21:06:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 14D55A41D7C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 21:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46D1C4CEEA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738616769;
 bh=cBsOd6wcSiVV2e1fytZZdNGIp2DUe5yMg3BzjkT0Yr4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YiVHWzPtlFs/18y4Romt7+lyBFBS25JplkyfSQcxB29D2FoKYbQ4Aw/5KKvjyuRLI
 /lIO4dYQ3p/Nan5o+RYfxhHhxaZcVqLG+g4WNNRlprjIhvDOKjNYSigE+uffa9McQ2
 5A4/Dm7GGlnBF11woKgObVLHAe8oCF+8RjgwLAwM/790TN/WOuk8rHt0eCkGx95sB6
 3fVD4SNgx/qizouzCfTuYz1oEQtW5R2Gy7/a8KwE8vKDIA4Tt9cotw643csplzkOPn
 CYq3K+yTpYuAl4OUUbaX7evNp+uiyJZgRJVXdeETvJvxis7LajfE7FXFdt2R/mlYk4
 /kWffAxfaLpKg==
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9a88793so7777877a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 13:06:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLrRD5B5tm//IpiFazwPq3fKsjqfPrt7tphKaS8SA/A//fywqQtOejUE80LUHD2nSjJMDGsmIMk5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoA4a1qtjxjUbN97RGSjq0j4x0ltlLVOJzvnk9RFsiIxCoTDYp
 80qqHb4i23F5emX+hyUEMp9OMdqcnwoeq0rCUAlzt1KD7eEghRCTeV9g3TZDXmnAymXk+Km2xqi
 U93/4E1wrExV+k5PbNatloltE1g==
X-Google-Smtp-Source: AGHT+IHeWZHdJjC4YN+OOJHAB8++nTLMgl7MUL+pvf+VvcXzFyBuc+YptThIQgLhGlBcwS62U/h/TbXO0dgmymUExPY=
X-Received: by 2002:a05:6402:274a:b0:5d1:2535:84d7 with SMTP id
 4fb4d7f45d1cf-5dc5effb1c0mr22570412a12.29.1738616768432; Mon, 03 Feb 2025
 13:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
 <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com>
 <TY3PR01MB11346E1FA592E731E0D32E96686F52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E1FA592E731E0D32E96686F52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 15:05:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com>
X-Gm-Features: AWEUYZnrMYgeFmznny2afQJcB_ErB5ngAuWrI9ehgUSHGdkfF9dpCy3oKUhDEGQ
Message-ID: <CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com>
Subject: Re: [PATCH v2] of: base: Add of_get_available_child_by_name()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 "biju.das.au" <biju.das.au@gmail.com>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 Network Development <netdev@vger.kernel.org>, 
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-media <linux-media@vger.kernel.org>
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

On Mon, Feb 3, 2025 at 11:17=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Rob,
>
> +Cc relevant subsystems.
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: 03 February 2025 16:53
> > Subject: Re: [PATCH v2] of: base: Add of_get_available_child_by_name()
> >
> > On Sat, Feb 1, 2025 at 3:31=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > >
> > > There are lot of drivers using of_get_child_by_name() followed by
> > > of_device_is_available() to find the available child node by name for
> > > a given parent. Provide a helper for these users to simplify the code=
.
> > >
> > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > > ---
> > > v1->v2:
> > >  * Updated commit description.
> > >  * Updated kerneldoc comment block
> > >  * Avoided code duplication by using of_get_child_by_name().
> > >
> > > Note:
> > > grep showed the below files will be the users for this new API.
> > > I will be updating these drivers once this patch is in mainline.
> >
> > No need to wait. Please convert all the net ones and send this patch wi=
th them.
>
> Thanks for the feedback.
>
> Subsequently, I have send the patches. However, Andrew[1]/Krystoff[2]
> mentioned me to wait till this patch appear in -rc ,
>
> Can it be fast tracked to 6.14-rcX?? Otherwise, it needs to wait till 6.1=
5-rc1
> and other patches will then appear on 6.16-rc1.

Most maintainer trees are based on rc1. So are you sure everyone is
going to be fine with a rc2 dependency? Generally, new APIs don't go
in without a user.

That being said, if this was 10s of different trees I'd reconsider,
but since most of the callers are in net, I'm less willing to apply
"not a fix" to fixes.

> [1] https://lore.kernel.org/all/96fbccd3-fd79-4b2f-8f41-bd0e3fdb2c69@lunn=
.ch/
>
> [2] https://lore.kernel.org/all/7fe9dad9-85e2-4cf0-98bc-cca20ff62df5@kern=
el.org/

It's not like they are saying to do the opposite of what I said. If
the dependency is not part of your series, then it needs to be in rc1.

Rob
