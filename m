Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423F7AB02E8
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AAF10E958;
	Thu,  8 May 2025 18:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R/Tq5pyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C35A10E958
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 18:35:01 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso9192755e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 11:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746729300; x=1747334100; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IVDbdK6tFT4p5qSPziDFcg0ZPFHZewJeUyaEpzkNkuw=;
 b=R/Tq5pydRuQvvP7lkk2bTa8SNaAGaPqAgAga5vUTGH7cc+c2YSP0Zr3SSATDmnK7fZ
 FkBYKRjjdJTIksp0oTLjIfZ+VQiGwC+GE1b3n68CNQpYnEPyLwkA9Kh48ukz5OXIeQbi
 LX3IZV5q3pGhpUL7bWhYzH9kKaTGk9lmaoALMAo1SJ4LiK7yqpCgVtA0vcNGu4CiXVlW
 TYkysFHNwO6RLJyqPqtiIsJQDe6igvPuMD/oOHqhcBr1EKIa2gP6vCTwrL/rkPXN+CSS
 YJ4pWHmAkS8JnOGTglxotMldosvr5jVhy12cBUAQ1VnNnMBniDrtxw65DJkmcXF+qQzR
 4DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746729300; x=1747334100;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IVDbdK6tFT4p5qSPziDFcg0ZPFHZewJeUyaEpzkNkuw=;
 b=tvAZqvOXW76z02FMsupbx1rTw0eI+9FKifIFFwz6VPE5ny04d3d5+OIP1GaPq4/VN1
 5S2YJ38rp0kUqUTkYzqq9SxVSlhgYybggUrKV+cDLGla0DcBs21Dgps0wnWkTW5WR494
 SJbXXsEAGu3/ZMTuy/MrE7H0eNaVPs/MD6+XYe9dSUseYMow/5cHsJC2aSm8sx/uQ/rJ
 q6jykfiwNcwSzJnbO5f40JCZSRAilsSiUu54iQUYFJ7+tEBDiqTJl04dvO9nhOAFtepS
 dU9qRjj10Yw+M7/wS4EsSQaTpZcmj2o+YXUGxfVa0HgtUvhgrS8Y1vqTe5itRdpNcfrl
 WKQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAlRSui/1qaKqoXFXcnvZ6UdtAwsx+LdeyL66H9POXcJmO73P6f8gJ133VojqerASqrMjq1Qe6jaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwolsgXMq6VB1LD5tS34jn3c9AMYV0VcHExzyo6ahhu/BSbD8+R
 4GlpDJBZ5+15Fqnzd6KGGyf2ON9RuaKaPwSBW8M2gS5wfLJeQb9A
X-Gm-Gg: ASbGncuE6lXYGrRsaSiRLL2jk/K8xTVno80YqpWGgxyJLn/mtkZsye9FxDTYDiSgbFJ
 1IF0kODfXK9+5CW1yZTz6z0bUjwcZKFrPmZHd+olVxBLyR2aifWzjf5LzWo9KNqjRyAVl1xxyrJ
 HoDkBd5W9mOMJ8nJEyylQ1QmlaUES3X2a2Cv1Ofj42aePFSTtTjJvr3hd2X3txJyGqnrmj43jQf
 Sm/JaDd5mXvl22D9RW5nHNmGXkXSh2afoGOgiqwjRQWCuh/HsMQ6azZiSJ5TxQD8DNeMCQmIEY7
 CfjjuEc5XyB1lf+RgjojQmZLReGINSfimyEp8gIo2GeTrBZ5MaLd
X-Google-Smtp-Source: AGHT+IHYSEjULgZ4gpU3lysdol2P4WoCbN6EmeFoDVpmXCq4aDj8KwVvWdJr2UTxFLSQOh9srCA+Tg==
X-Received: by 2002:a05:600c:1d16:b0:43d:2313:7b49 with SMTP id
 5b1f17b1804b1-442d6d44ac2mr3297615e9.12.1746729299349; 
 Thu, 08 May 2025 11:34:59 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7dd5sm45158365e9.35.2025.05.08.11.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 11:34:58 -0700 (PDT)
Date: Thu, 8 May 2025 20:34:55 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33) support
Message-ID: <aBz5T-jAnv_RVAmh@Red>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <CAL_Jsq+gtVi1XG7b2g+n-H=fDrkZRqVA0wNSAA5-Ot7EXqG2QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+gtVi1XG7b2g+n-H=fDrkZRqVA0wNSAA5-Ot7EXqG2QA@mail.gmail.com>
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

Le Wed, May 07, 2025 at 04:13:38PM -0500, Rob Herring a écrit :
> On Wed, May 7, 2025 at 3:22 PM Chris Morgan <macroalpha82@gmail.com> wrote:
> >
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > I've spoken with Ryan and he agreed to let me take over this series to
> > get the display engine working on the Allwinner H616. I've taken his
> > previous patch series for Display Engine 3.3 and combined it with the
> > LCD controller patch series. I've also fixed a few additional bugs and
> > made some changes to the device tree bindings.
> >
> > Changes since V8:
> >  - Combined the DE33 [1] series and the LCD [2] series to better track
> >    all patches necessary to output to an LCD display for the Allwinner
> >    H700.
> >  - Added a required LVDS reset as requested here [3].
> >  - Added compatible strings with a fallback for
> >    allwinner,sun50i-h616-display-engine, allwinner,sun50i-h616-tcon-top,
> >    and allwinner,sun50i-h616-sram-c.
> >  - Added binding documentation for the LCD controller.
> >  - Renamed the de3_sram device tree node to de33_sram.
> >  - Corrected the LVDS reset for the LCD controller binding.
> >  - Removed the PWM pins from the pincontroller bindings, as PWM is not
> >    yet supported.
> >  - Reordered the patches so that a binding or a device tree node is not
> >    referenced before it is defined.
> >
> > [1] https://lore.kernel.org/linux-sunxi/20250310092345.31708-1-ryan@testtoast.com/
> > [2] https://lore.kernel.org/linux-sunxi/20250216092827.15444-1-ryan@testtoast.com/
> > [3] https://lore.kernel.org/linux-sunxi/38669808.XM6RcZxFsP@jernej-laptop/
> >
> > Chris Morgan (24):
> >   dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
> >   clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
> >   drm: sun4i: de2/de3: add mixer version enum
> >   drm: sun4i: de2/de3: refactor mixer initialisation
> >   drm: sun4i: de2/de3: add generic blender register reference function
> >   drm: sun4i: de2/de3: use generic register reference function for layer
> >     configuration
> >   dt-bindings: allwinner: add H616 DE33 bus binding
> >   dt-bindings: allwinner: add H616 DE33 clock binding
> >   dt-bindings: allwinner: add H616 DE33 mixer binding
> >   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
> >   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
> >   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
> >   drm: sun4i: de33: mixer: add mixer configuration for the H616
> >   dt-bindings: allwinner: Add TCON_TOP and TCON_LCD clock/reset defines
> >   dt-bindings: display: sun4i: Add compatible strings for H616 DE
> >   dt-bindings: display: sun4i: Add compatible strings for H616 TCON TOP
> >   dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
> >   dt-bindings: display: Add R40 and H616 display engine compatibles
> >   drm/sun4i: tcon: Add support for R40 LCD
> >   arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
> >   arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
> >   arm64: dts: allwinner: h616: add LCD and LVDS pins
> >   arm64: dts: allwinner: rg35xx: Add GPIO backlight control
> >   arm64: dts: allwinner: rg35xx: Enable LCD output
> 
> What's the base for this series? It didn't apply for me (using b4).
> 
> Rob
> 

I tested it on top of linux-next next-20250508 and revert "arm64: dts: allwinner: h616: Add Mali GPU node"


