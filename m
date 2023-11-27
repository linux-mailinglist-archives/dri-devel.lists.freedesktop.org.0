Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5987FA2C3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B8810E2B8;
	Mon, 27 Nov 2023 14:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17ECF10E2B8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 14:31:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B27261281;
 Mon, 27 Nov 2023 14:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568C2C433C8;
 Mon, 27 Nov 2023 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701095512;
 bh=iugwmqYRf+o6ZULdzB0347RuwISU5ZoccVSgJEsSJP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mC4cbMO7w4hP6MVmh14mk4ITlEIEbhZvG3xlfUbvW2ULFpje+/oHkteFICiqYrN5N
 IJpeZggFhb1HTXvrX3HTM7wVhB7VpTZR9lulWHFAweA7eeNkQaTUwjnMnY1tMO8WDd
 4qlnz/skerxsuf6+XH1v4PBkRLkSnyce3x6y+FXbfpa+OgUc7KoGJ7oFY/04NUsxHI
 i9UXGzUd1QKuxwHB5phkWYuwMQ/m6YeBZNlu/sJtDdRtikJwp/KLIUByDuUV5Rq2px
 Pvpl7VYWGM4BL/tvG/sQz/jD262xkEEj3++o/vDHyEdHZw6vbuv/Mm10gxt3stSLxm
 NjEYQHT8UtHIg==
MIME-Version: 1.0
Date: Mon, 27 Nov 2023 15:31:44 +0100
From: Michael Walle <mwalle@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/6] drm/bridge: tc358775: Fix getting dsi host data lanes
In-Reply-To: <20231127131947.GE5166@atomide.com>
References: <20231126163247.10131-2-tony@atomide.com>
 <20231127130941.2154871-1-mwalle@kernel.org>
 <20231127131947.GE5166@atomide.com>
Message-ID: <48e9584ca904397ac0b0771d7e8b81ba@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: pavel@ucw.cz, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, sam@ravnborg.org,
 ivo.g.dimitrov.75@gmail.com, rfoss@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 jernej.skrabec@gmail.com, simhavcs@gmail.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, jonas@kwiboo.se, merlijn@wizzup.org,
 mripard@kernel.org, Rob Herring <robh+dt@kernel.org>, philipp@uvos.xyz,
 neil.armstrong@linaro.org, sre@kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dt maintainers

>> I actually have the same fix, but with one additional detail, which 
>> I'm
>> unsure about though: This looks at the data-lanes property of the 
>> *remote*
>> endpoint whereas other bridge drivers (see tc358767, ti-sn65dsi83, 
>> lt8912b,
>> anx7625) look at the local endpoint and I'm not sure what is correct.
> 
> Yes I've been wondering about that too. Let's just move it over to the
> bridge node? We could produce a warning if the dsi host node has the
> data-lanes property.. No current in kernel users AFAIK.

I haven't found any in-tree users either. In my patch, I first try the 
remote
end and then the local end. But thinking more about it I don't think
this is correct. Maybe we can do it the other way around, first try
data-lanes of the local endpoint and if not found, then try the remote
one. That way, we would at least be backwards compatible in the driver.
And for the dt-bindings, make it mandatory to have a local data-lanes.

-michael

> FYI, for omapdrm, we already have a legacy dt property "lanes" for the
> wiring that tells number of lanes used and the order of the lanes.
> 
> Regards,
> 
> Tony
