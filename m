Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D79B2997
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 09:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1593E10E279;
	Mon, 28 Oct 2024 08:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NId5SLoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C3C10E279
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 08:02:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 50C8EC248D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 08:02:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF9131BF209;
 Mon, 28 Oct 2024 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730102543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMdiMphrDVa/6WG8AanOiRAHLQzTBE/3PK643L9hPJ4=;
 b=NId5SLoO5WQXKd5a1otqq2vpVAAhxGahPioxT21lCSi3VIM/jsNDRCtcGVVojv2prUmPCf
 o67wuBKsTOTBaUdCjAZPkK+av73f0yVoNWkMfx7tV0DJkXw3aBPavgULEROsZ5d8BDyLv1
 n39yty4ucmTC8D4BKYjODoil2Y5Q59Gch63hHuuzAHlBiaINn2207epgExQrk0e27zwrb+
 PPQAthe51DupxtM1TSBnNnOH+RkZcYAzQsl37n7pbkCrDWk2nsRJCdw/PTH9eOT1pQ+rer
 qdZ3KRsDw6cw2XsS1DfTP8C3bzkX24C6QmwNspwU64S7dnLOfo/5hrgWBwK1AA==
Date: Mon, 28 Oct 2024 09:02:20 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20241028090220.1fd803ff@bootlin.com>
In-Reply-To: <78a09625-6bad-4fda-8ee5-92b8dd0de381@denx.de>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <78a09625-6bad-4fda-8ee5-92b8dd0de381@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

On Sat, 26 Oct 2024 00:53:51 +0200
Marek Vasut <marex@denx.de> wrote:

> On 10/24/24 11:55 AM, Herve Codina wrote:
> > In some cases observed during ESD tests, the TI SN65DSI83 cannot recover
> > from errors by itself. A full restart of the bridge is needed in those
> > cases to have the bridge output LVDS signals again.  
> 
> I have seen the bridge being flaky sometimes, do you have any more 
> details of what is going on when this irrecoverable error occurs ?

The panel attached to the bridge goes and stays black. That's the behavior.
A full reset brings the panel back displaying frames.

Best regards,
Hervé
