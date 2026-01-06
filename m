Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF80CF70BA
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 08:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0AD10E10C;
	Tue,  6 Jan 2026 07:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QA9jJ/P9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59C710E10C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 07:34:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3A0211A2690;
 Tue,  6 Jan 2026 07:34:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 01C3560739;
 Tue,  6 Jan 2026 07:34:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B79E1103C8092; Tue,  6 Jan 2026 08:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767684876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/ihofIBxFPwXzfBzLTBtqfZNBkL8peU6izBU5CnFXCQ=;
 b=QA9jJ/P9eRhkdrxb0HptLgAtibWjUt8jFktKgN/YWUb+JLe+KkcDoyyEQD2Ppn5+/jwo5o
 9PuhkdKrKHCFJmwvVHHrNuIRKapqHvtfMGKFtPfB8JkUZq7apk7/qR0ykO/WlNWhf7kDVi
 Bl/ifnbmCGIsRzIc4uM0olnGsE4sW3ojxqibPYiiCO3NDqYB2afR4RvGjjLapoi56PC66n
 5HJ/fOFerReyEAfARTdLDLeTJDoRQlIofWvp4plIFdiL3u195e1w/IEB3kmwrWJz73Gj1E
 uQIdi3lYtAHnUwekMK3xvZVQnq9ev3kSCj8zKXKrEixDRgt59+RNM9n5WrdQ1g==
Date: Tue, 6 Jan 2026 08:34:26 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com> (by way of Kory Maincent
 <kory.maincent@bootlin.com>), "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 05/20] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260106083426.6916d687@bootlin.com>
In-Reply-To: <20260105181838.1f307964@kmaincent-XPS-13-7390>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
 <DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
 <20260105172220.2d2edd28@bootlin.com>
 <20260105181838.1f307964@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Köry,

On Mon, 5 Jan 2026 18:18:38 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

...
> >
> > Modifying some properties after applying the overlay could be not seen by the
> > driver.  
> 
> I disagree here. This driver is loaded at subsys_initcall (initcall 4) while
> the panel is loaded at device_initcall (initcall 6) so the panel driver won't
> probe in-between.
> 

You're right. the driver registers at device_initcall().
You can modify your node at subsys_initcall(), the driver will see modified
values.

Best regards,
Hervé

