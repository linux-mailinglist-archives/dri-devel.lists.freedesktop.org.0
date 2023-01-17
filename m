Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095666DDA9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 13:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF2210E1AF;
	Tue, 17 Jan 2023 12:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B624389798
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 12:16:04 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C000C10C;
 Tue, 17 Jan 2023 13:16:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673957762;
 bh=KvclwtnjuRaXVCzpDi7t1ah9crNcHEqRblsfDbwF4gg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xs0vlI7l299xFyHd/Zh7oo0K/OpUzw6cEH1SkpohZ/nC+DFBdYXB5RMpTsaEV7+12
 rkIbIu3qbJ4DRC4ZYdyYK+mhzFPmjQBvPw6kO0Y4UUBkUD85rqGrbnd0Aiu9dYpv1x
 8AUPJJtb5Il39P4XdMb85Qu7jnUByzo7XWX56HxA=
Message-ID: <92c277d7-73a5-5d3f-b6fe-6328a5dbde54@ideasonboard.com>
Date: Tue, 17 Jan 2023 14:15:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v11 0/5] Add support for CDNS DSI J721E wrapper
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230103101951.10963-1-r-ravikumar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230103101951.10963-1-r-ravikumar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 17 Jan 2023 12:33:05 +0000
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

Hi,

On 03/01/2023 12:19, Rahul T R wrote:
> Following series of patches adds supports for CDNS DSI
> bridge on j721e.
> 
> v11:
>   - Wrap commmit messages at 72 chars
>   - Fix the order in Kconfig and Makefile
>   - Clean up the includes, move macros and some headers to .c file
>   - Add missing forward declarations
>   - Add __ prefix to header gaurds
>   - Change dsi_platform_ops to cdns_dsi_platform_ops
>   - Add documentation to struct cdns_dsi_platform_ops
> 
> v10:
>   - Rebased to v6.2-rc1
>   - Accumulated the Reviewed-by acks
> 
> v9:
>   - Fixed below based on review comments in v8
>   - Added more info on wrapper in the commit message
>   - Fixed the description in Kconfig
>   - Fixed the formatting of of_match table
>   - exit -> deinit in platform ops
>   - Remove duplicate of struct declaration in cdns-dsi-j721e.h
> 
> v8:
>   - Rebased to 6.1-rc1
> 
> v7:
>   - Rebased to next-20220920
>   - Accumulated the Reviewed-by acks
> 
> v6:
>   - Dropped generic definations for properties like reg, resets etc..
>   - Fixed the defination for port@0 and port@1
>   - removed the ti,sn65dsi86 node from the example, which is not related
> 
> v5:
>   - Remove power-domain property in the conversion commit
>   - Add power-domain only for j721e compatible
>   - Fix white space error in one of the commit
> 
> v4:
>   - split conversion txt to yaml
>   - seperate commit for addinig new compatible
>   - conditionally limit the items for reg property, based on the compatible
> 
> v3:
>   - Convert cdns-dsi.txt binding to yaml
>   - Move the bridge under display/bridge/cadence
>   - Add new compatible to enable the wrapper module
> 
> v2:
>   - Moved setting DPI0 to bridge_enable, since it
>     should be done after pm_runtime_get
> 
> Rahul T R (5):
>    dt-bindings: display: bridge: Convert cdns,dsi.txt to yaml
>    dt-bindings: display: bridge: cdns,dsi: Add compatible for dsi on
>      j721e
>    drm/bridge: cdns-dsi: Move to drm/bridge/cadence
>    drm/bridge: cdns-dsi: Create a header file
>    drm/bridge: cdns-dsi: Add support for J721E wrapper
> 
>   .../bindings/display/bridge/cdns,dsi.txt      | 112 -----------
>   .../bindings/display/bridge/cdns,dsi.yaml     | 180 ++++++++++++++++++
>   drivers/gpu/drm/bridge/Kconfig                |  11 --
>   drivers/gpu/drm/bridge/Makefile               |   1 -
>   drivers/gpu/drm/bridge/cadence/Kconfig        |  21 ++
>   drivers/gpu/drm/bridge/cadence/Makefile       |   3 +
>   .../{cdns-dsi.c => cadence/cdns-dsi-core.c}   |  83 ++++----
>   .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  84 ++++++++
>   .../gpu/drm/bridge/cadence/cdns-dsi-j721e.c   |  51 +++++
>   .../gpu/drm/bridge/cadence/cdns-dsi-j721e.h   |  16 ++
>   10 files changed, 391 insertions(+), 171 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
>   rename drivers/gpu/drm/bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c} (97%)
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h
> 

Looks good to me. As Andrzej gave his Rb, I presume it's fine for me to 
push this to drm-misc-next. I'll do this a bit later today.

There was a small typo in the 5th patch, about which checkpatch gave a 
warning. I'll fix that while applying.

  Tomi

