Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C79E6FD2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 15:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5676510E3EF;
	Fri,  6 Dec 2024 14:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="irIgA5r7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B878A10E3EF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 14:08:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D403E240004;
 Fri,  6 Dec 2024 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1733494104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+QoINEIs3iYd7klqkDjgE8vz29lWLrSSK4cMCLMcHE=;
 b=irIgA5r73L7aHzXQdRqtzHBqnYOWmWJCeLQ9PfehV60L3rh1ofLKxeK0hSFzoQQKH7sExW
 OyFExifYco5dV5LRYdmw1a9ckCYjScFRAhlvjL76OmsGExMzuD/VNkv+vn18oG6KV4w83p
 5byNVPN6M1e28sIM/8wKeJgJ2W71CAIRzSdZ+rKU8F5m8UIIY8omiqztQsh9Ab/TurxwhU
 zxL5SN65WePMqgKbhM7MxNCS0vhpNx1I9HVskQoDmLZy2j4R00QariNaTwJxA2RRzXU92o
 U3k8d+xL2TZEtAPoU0J0s6b4ZltZaWYooQYH6N/6kmc3uuQmwHcIMeqgbm5aOQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikolaus Voss <nv@vosn.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,  Liu Ying
 <victor.liu@nxp.com>,  Luca Ceresoli <luca.ceresoli@bootlin.com>,  Fabio
 Estevam <festevam@denx.de>,  Marek Vasut <marex@denx.de>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 nikolaus.voss@haag-streit.com,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: bridge: fsl-ldb: fixup mode on freq mismatch
In-Reply-To: <20241203191111.47B56F7@mail.steuer-voss.de> (Nikolaus Voss's
 message of "Tue, 3 Dec 2024 20:09:52 +0100")
References: <20241203191111.47B56F7@mail.steuer-voss.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 06 Dec 2024 15:08:23 +0100
Message-ID: <87zfl8oqeg.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

Hi Nikolaus,

On 03/12/2024 at 20:09:52 +01, Nikolaus Voss <nv@vosn.de> wrote:

> LDB clock has to be a fixed multiple of the pixel clock.

Not only, IIUC it also needs to be synchronized, ie. share the same
source.

> As LDB and pixel clock are derived from different clock sources
> (at least on imx8mp),

Wait, what? I am sorry but that is not at all recommended, both should
come from video_pll1 which the de-facto versatile PLL to use, no? Am I
missing something here?

> this constraint cannot be satisfied for
> any pixel clock, which leads to flickering and incomplete
> lines on the attached display.
>
> To overcome this, check this condition in .atomic_check() and
> adapt the pixel clock accordingly.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale i.MX8M=
P LDB bridge")
>

Nit: No \n here.

> Signed-off-by: Nikolaus Voss <nv@vosn.de>

Thanks,
Miqu=C3=A8l
