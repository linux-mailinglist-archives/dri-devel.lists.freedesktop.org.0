Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB12B5E12
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 12:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FAB6E183;
	Tue, 17 Nov 2020 11:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9056E183
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:13:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4E27221FB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605611620;
 bh=V0x+1pEXNBlvGUPnKAReGNwIfbkuR60mZL6nJ7gbrnQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dv0evZp0cTeljFd/OiTsuDTJEZxffLbMi1q++hlVJwJe8P/rJ9MyRD7mYisMeI2pN
 2Cabpf7UjyeGWM5UaQEnsn9EIG+83vLeFylFZSYEgvrpWT/hkfXOwbLzgpQfw/w+2Y
 UmOFA7EIONfb1VILj3n4OXFQrM/7/k/uBL+fqbn8=
Received: by mail-ej1-f51.google.com with SMTP id f20so28870955ejz.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 03:13:39 -0800 (PST)
X-Gm-Message-State: AOAM531BMhGQEn88F1hlLojUhUzEl3mErn1LAea3MJBck3/wbmCvOqEr
 OfHOJLuyBd883r8nc0qus3gnWGtC8OAjIsrtYrM=
X-Google-Smtp-Source: ABdhPJymrgfvDJlgkyYhZ5Wb8RW+1mCW3euZsQjWepsg9t0L4FnHN9gM+xXqCtB9tgGllPRjsB6hbrWMq4BPBPwvF+E=
X-Received: by 2002:a17:906:491a:: with SMTP id
 b26mr19730991ejq.385.1605611618119; 
 Tue, 17 Nov 2020 03:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20201116181400.543718-1-krzk@kernel.org>
 <3e91fe4dd8437ffbb02bdae85c7028dafc356df8.camel@pengutronix.de>
In-Reply-To: <3e91fe4dd8437ffbb02bdae85c7028dafc356df8.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 17 Nov 2020 12:13:26 +0100
X-Gmail-Original-Message-ID: <CAJKOXPeHAGF8iu8=D=n9Zrqurc7KWumw+d3bL2GoBWVJC7wsUw@mail.gmail.com>
Message-ID: <CAJKOXPeHAGF8iu8=D=n9Zrqurc7KWumw+d3bL2GoBWVJC7wsUw@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: depend on COMMON_CLK to fix compile tests
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Nov 2020 at 11:56, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Mon, 2020-11-16 at 19:14 +0100, Krzysztof Kozlowski wrote:
> > The iMX DRM drivers use Common Clock Framework thus they cannot be built
> > on platforms without it (e.g. compile test on MIPS with RALINK and
> > SOC_RT305X):
> >
> >     /usr/bin/mips-linux-gnu-ld: drivers/gpu/drm/imx/imx-ldb.o: in function `imx_ldb_encoder_disable':
> >     imx-ldb.c:(.text+0x400): undefined reference to `clk_set_parent'
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Thank you, but could this be added to
>
> config DRM_IMX_LDB
>
> instead?
>
> The core DRM_IMX code does not use the Common Clock Framework directly.
> DRM_IMX_TVE already depends on COMMON_CLK because it implements a clock.

You're right, I even wanted to add it there but somehow it landed in
the main entry... Thanks, I'll send a v2.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
