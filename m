Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A612AEFC2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 12:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B963589EFF;
	Wed, 11 Nov 2020 11:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE5C89EFF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 11:38:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABBclCi015094;
 Wed, 11 Nov 2020 05:38:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605094727;
 bh=96Z3O5TPxBmqDLC5CCLYfH3S+4/EqBXhKlyUA6z23cs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ExlsZ0sx6s/mJ6xwwgpFzUbsjqZ1KvnFkEUlkTNLVVpOKmPicqz/Flxi3+jELS8z6
 7N1YzD0mO/gYhDrIIhdgVsvKaRSovMwaGkhPBoFYwdgX3Ow4IWECrpTKH45bwO7Bzv
 S2+W3jn4yzq30VzyivOVoriwPrSZhaqEJuqZJZf4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABBclUO013733
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 05:38:47 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 05:38:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 05:38:46 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABBcjDW004916;
 Wed, 11 Nov 2020 05:38:45 -0600
Subject: Re: [PATCH v2 1/6] drm: bridge: Propagate the bus flags from
 bridge->timings
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <20201109170601.21557-2-nikhil.nd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <4314c4b3-ee1e-d742-34fa-27371a6d2bf2@ti.com>
Date: Wed, 11 Nov 2020 13:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109170601.21557-2-nikhil.nd@ti.com>
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
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 19:05, Nikhil Devshatwar wrote:
> bus_flags can be specified by a bridge in the timings.
> If the bridge provides it, Override the bus_flags when propagating
> from next bridge.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0effb52ac..2bbd6ffe82ce 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -975,6 +975,14 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
>  	 * duplicate the "dummy propagation" logic.
>  	 */
>  	bridge_state->input_bus_cfg.flags = output_flags;
> +
> +	/*
> +	 * If the bus flags are provided in timing, use those even if the next
> +	 * bridge specifies something
> +	 */
> +	if (bridge->timings && bridge->timings->input_bus_flags)
> +		bridge_state->input_bus_cfg.flags =
> +			bridge->timings->input_bus_flags;
>  }

I think the comment could be more clear. Maybe something like:

If legacy bus flags are provided in bridge->timings, use those as input flags instead of propagating
the output flags.

Other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
