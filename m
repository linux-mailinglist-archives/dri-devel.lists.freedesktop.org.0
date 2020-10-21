Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F8294BD0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 13:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542E16E104;
	Wed, 21 Oct 2020 11:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06E06E104
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 11:31:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LBVlQw027176;
 Wed, 21 Oct 2020 06:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603279907;
 bh=bSm+XbdrrxDgou+V+B5Ey7KPyehT6gn8sO8/XIWyDyA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=i/H9j7g8tuynNtFuTDqe3AhkBCcz9ABhzZkHtaYQrgu78nrQqA24LQBtO+mhIfVV+
 VL2TLD39WrfUOumScgOjir1g3QJjvz2GWFj4+VYIo/uk6hhz8jS4nlHRKkIOwM/0fZ
 EUYxlUszna3/q2aCaTax2V+lrAi6O9mxVQYfxE5A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LBVlIg078950
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Oct 2020 06:31:47 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 06:31:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 06:31:46 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LBVjkO089719;
 Wed, 21 Oct 2020 06:31:45 -0500
Subject: Re: [PATCH 3/5] drm: bridge: Propagate the bus flags from
 bridge->timings
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-4-nikhil.nd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fd65aa92-bc89-2420-bbc1-e131db1f6c25@ti.com>
Date: Wed, 21 Oct 2020 14:31:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016103917.26838-4-nikhil.nd@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/10/2020 13:39, Nikhil Devshatwar wrote:
> When the next bridge does not specify any bus flags, use the
> bridge->timings->input_bus_flags as fallback when propagating
> bus flags from next bridge to current bridge.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0effb52ac..8353723323ab 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -975,6 +975,13 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
>  	 * duplicate the "dummy propagation" logic.
>  	 */
>  	bridge_state->input_bus_cfg.flags = output_flags;
> +
> +	/*
> +	 * Use the bridge->timings->input_bus_flags as fallback if the next bridge
> +	 * does not specify the flags
> +	 */
> +	if (!bridge_state->input_bus_cfg.flags)
> +		bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;

According to docs, timings can be NULL.

And, hmm... It's too easy to get confused with these, but... If the bridge defines timings, and
timings->input_bus_flags != 0, should we always pick that, even if we got something via
output_flags? Logic being, if this bridge defines timings->input_bus_flags, it probably wants that
to be used regardless whether we got something from the next bridge.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
