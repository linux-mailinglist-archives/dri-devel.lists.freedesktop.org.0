Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2A1C91198
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 09:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0DC10E025;
	Fri, 28 Nov 2025 08:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CQGZ+4kJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46C410E025
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 08:09:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1983A1A1DF5;
 Fri, 28 Nov 2025 08:09:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E138760706;
 Fri, 28 Nov 2025 08:09:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0E31F103C8F28; Fri, 28 Nov 2025 09:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764317363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SJJd7mb7+crqWHVBGQwC9fg4ZOK2TA2FhZTDzbQ6I5U=;
 b=CQGZ+4kJ3npgGBheCP7k755UGb3ooVxj3nc6hYwDV/px7uUbFZu5vPDx+zrXVwdk1rQqZL
 +ecxzKwIn4p1NqfOPLaaRW89/+PJPVFEeu2qhJFSpV+YK7kHSPNnhI2CXg65Zqh4BrwvZV
 1PrJveH2C5iAkxSPspt6kMTJS2ZFjfOTiFOieS2RgLQnsIpY1DPxLws+jhdSxpGhqsraJz
 mtODTQL0SydaLZv8qAqnFertisDqaE6X2wreUffzGdwf5ClOL0oh+qIcc3k4S6QrnehZpQ
 MwAJZvVOvr9JsgeH/P57Pnr/SSGsbJPOJ0FHhL5+izY4SwJCO6lWOuhe5tyEeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 09:09:17 +0100
Message-Id: <DEK6B0KMDCCN.3U4FLO44L04FC@bootlin.com>
Subject: Re: [PATCH v3 0/2] drm/bridge: handle gracefully atomic updates
 during bridge removal
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Francesco Dolcini" <francesco@dolcini.it>, "Emanuele Ghidoli"
 <ghidoliemanuele@gmail.com>, =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
 <546bc098a35360c659b6dfb88d5cb451@kernel.org>
In-Reply-To: <546bc098a35360c659b6dfb88d5cb451@kernel.org>
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

Hi Maxime,

+Cc Emanuele, Francesco, Jo=C3=A3o

On Thu Nov 27, 2025 at 7:35 PM CET, Maxime Ripard wrote:
> On Wed, 12 Nov 2025 17:34:33 +0100, Luca Ceresoli wrote:
>> This is a first attempt at gracefully handling the case of atomic update=
s
>> happening concurrently to physical removal of DRM bridges.
>>
>> This is part of the work to support hotplug of DRM bridges. The grand pl=
an
>> was discussed in [1].
>>
>> [ ... ]
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks for reviewing!

Two alternative patches [0][1] have been sent to address the issue with
PLL_UNLOCK, and both would conflict with patch 2 of this series. So I'd
keep this series on hold for a while, waiting for a decision to be taken
about how the PLL_UNLOCK issue will be handled. I'll then rebase this
series as needed.

[0] https://lore.kernel.org/lkml/20251127-drm-ti-sn65dsi83-ignore-pll-unloc=
k-v1-1-8a03fdf562e9@bootlin.com/
[1] https://lore.kernel.org/lkml/20251125103900.31750-1-francesco@dolcini.i=
t/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
