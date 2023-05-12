Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006970037C
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 11:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2DD10E65A;
	Fri, 12 May 2023 09:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F11710E65A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 09:20:17 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27AE62D8;
 Fri, 12 May 2023 11:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683883207;
 bh=VWGt5kixjdflXkuIyYInfnTF9iqkcIMqcEq7zHEeUyg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LfeCd0790PtQdJvMeHHStWDDAJYIIxXLA5QR3V/hZ0qhjo2DsJlxOmtj86PnaMsWF
 RCaiF7djORTh6qc7BUOzt3kg4sfO63Ud8mQ7mPomLXPU5DlcfjzFlQNb0m/wG9RTkc
 ZByDZZfcZUynwdw3yypt3+Gj65+Qq5oVJ2rYUV5w=
Message-ID: <37799ac8-b3ad-ad0c-a104-82249ba7b387@ideasonboard.com>
Date: Fri, 12 May 2023 12:20:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 0/8] drm/tidss: Use new connector model for tidss
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230509093036.3303-1-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2023 12:30, Aradhya Bhatia wrote:
> Hi all,
> 
> I have picked up this long standing series from Nikhil Devshatwar[1].
> 
> This series moves the tidss to using new connectoe model, where the SoC
> driver (tidss) creates the connector and all the bridges are attached
> with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR. It also now creates bridge
> to support format negotiation and and 'simple' encoder to expose it to
> the userspace.
> 
> Since the bridges do not create the connector, the bus_format and
> bus_flag is set via atomic hooks.
> 
> Support format negotiations in the tfp410, sii902x and mhdp-8546 bridge
> drivers as a first step before moving the connector model.
> 
> These patches were tested on AM625-SK EVM, AM625 SoC based BeaglePlay,
> and J721E-SK. Display support for AM625 SoC has not been added upstream
> and is a WIP. To test this series on AM625 based platforms, basic
> display support patches, (for driver + devicetree), can be found in
> the "next_AttachNoConn" branch on my github fork[2].

Not exactly related to this series, but I was testing this with J7 EVM 
and a Dell DP monitor.

I'm seeing DPCD errors quite often, which also sometimes cause link 
training errors. E.g.:

cdns-mhdp8546 a000000.dp-bridge: Failed to read DPCD addr 0

cdns-mhdp8546 a000000.dp-bridge: Failed to adjust Link Training.

I tested retrying the read/write when it fails, and that seemed to help 
a bit, but not always. Are you using the firmware that's on the upstream 
linux-firmware repo?

  Tomi

