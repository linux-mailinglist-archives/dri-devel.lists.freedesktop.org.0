Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C540671485C
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 13:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8948710E272;
	Mon, 29 May 2023 11:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3DC10E272
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 11:12:32 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B211B836;
 Mon, 29 May 2023 13:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685358729;
 bh=ADkBV2LVS+YgVqFYYD4O2XlRfoS6+tQg/VZ+VEf6b1Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hohLMmFWvioA5RJ9d0FwjFsyEu/C+X32za6b6Q8VbtETTJPfBcpsbBO2UTP6fWEpX
 0Tu4bHMD5+YLxhDhQdTyuFl8hBfvh1VzjQxLBAlp4pPUNhp1FPdtJridqyTs+sp0G1
 NarhUBv1yVAKKVnq4jzH1bgbKVVHsyCiXAz0itis=
Message-ID: <5d207be0-c8f0-7c68-91b2-d5ef873ca6cc@ideasonboard.com>
Date: Mon, 29 May 2023 14:12:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 3/8] drm/bridge: mhdp8546: Add minimal format
 negotiation
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, neil.armstrong@linaro.org,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
 <20230509093036.3303-4-a-bhatia1@ti.com>
 <db9b4117-b030-49a7-3732-2fc39d089ee2@ideasonboard.com>
 <d2777edc-151d-7f06-30c4-4634fdb6a63d@ti.com>
 <305382fd-2312-59d9-e2d3-25a17e0a2158@linaro.org>
 <363d3089-48d4-5663-68e8-ecf0eb4e3e0e@ti.com>
 <9f98fb99-eaf4-657c-fd2e-b2e81d9cb109@ideasonboard.com>
 <c8712ef7-c0bc-e6e7-7319-68238d011dd9@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <c8712ef7-c0bc-e6e7-7319-68238d011dd9@ti.com>
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

On 29/05/2023 08:37, Aradhya Bhatia wrote:
>> Btw, we seem to be missing get-output-fmt from the mdhp driver.
> Yes, we are.
> 
> With the drm_bridge_attach call added, the display-connector bridge will
> assign MEDIA_BUS_FMT_FIXED as the default output format. And most
> bridges support only their primary output bus format in their
> get-output-fmt hooks. I suppose it would be RGB121212_1X36 in mhdp8546's
> case.
> 
> Do we require this when there is no comprehensive way to determine if
> another bus format may be more suitable (depending on the hardware
> configurations)?

If I recall right, mhdp supports other formats than RGB121212_1X36 on 
the input side (different bit depths and also yuv). On the output side, 
even if the input is 12 bits per component, when connected to a normal 
monitor, the output bpc would be 8.

I'm not sure if any of that matters, as nobody (?) will use the output 
format of mhdp, as it just goes "outside" to the monitor, and it is the 
mhdp driver that negotiates a suitable output format with the monitor.

  Tomi

