Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7F654DB3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1985310E5FA;
	Fri, 23 Dec 2022 08:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE40010E452
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:57:17 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F15DFB;
 Wed, 21 Dec 2022 11:57:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671620234;
 bh=NEpOfS56/yLzB83ZMRxsHhwGoWpFbzaQagcinoT0hU4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BFPQumQjvP87bN20iHSFPGT01gZlr+AULllteYWgMbz0eUrGgI9tZGum4CvIdyQ6f
 hTNFGjtcEkul0rqNiDRxu89rNNCLwBF/iSVjKSM8jcTvnyPAFBckxbnndVRrlefz4T
 n9d3WJLWXPdCF7rWce/sU5WPGFKp5HoVwREzTPuc=
Message-ID: <1d5bbb7f-19f1-1582-85df-35134da918a0@ideasonboard.com>
Date: Wed, 21 Dec 2022 12:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 5/5] drm/bridge: cdns-dsi: Add support for J721E wrapper
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20221031121924.29974-1-r-ravikumar@ti.com>
 <20221031121924.29974-6-r-ravikumar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221031121924.29974-6-r-ravikumar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 jpawar@cadence.com, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, vigneshr@ti.com, devicetree@vger.kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, sjakhade@cadence.com,
 lee.jones@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/10/2022 14:19, Rahul T R wrote:
> Add support for wrapper settings for DSI bridge on
> j721e. Also enable DPI0
> 
> ---------------      -----------------------
> |      -------|      |-------              |
> | DSS  | DPI2 |----->| DPI0 |  DSI Wrapper |
> |      -------|      |-------              |
> ---------------      -----------------------
> 
> As shown above DPI2 output of DSS is connected
> to DPI0 input of DSI Wrapper, DSI wrapper
> gives control wheather to enable/disable DPI0
> input. In j721e above is the only configuration
> supported
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>   drivers/gpu/drm/bridge/cadence/Kconfig        | 10 ++++
>   drivers/gpu/drm/bridge/cadence/Makefile       |  1 +
>   .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 35 ++++++++++++-
>   .../gpu/drm/bridge/cadence/cdns-dsi-core.h    | 13 +++++
>   .../gpu/drm/bridge/cadence/cdns-dsi-j721e.c   | 51 +++++++++++++++++++
>   .../gpu/drm/bridge/cadence/cdns-dsi-j721e.h   | 16 ++++++
>   6 files changed, 125 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

