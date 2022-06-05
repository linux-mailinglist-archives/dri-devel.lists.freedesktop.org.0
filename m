Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520E53DB8D
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 15:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D35A10F36E;
	Sun,  5 Jun 2022 13:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E8810F36E
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 13:28:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A898E60F73;
 Sun,  5 Jun 2022 13:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9338C385A5;
 Sun,  5 Jun 2022 13:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654435703;
 bh=HierzychIYSfee9l8j1OTtj4tWyJ2mBt2LQfQBnykFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rUOLXX3zrCJW0VLSBgnwsV6+UDkVAMmy79GxbOk7fdLc2vwTbubEBMfk6lLCR8SP+
 4tx89jtNe0ovs1kAzbY1X0KLbrLv8vu2QysOGPHSJ1MVBmX9C4omjHic/DfechABkg
 5Bog0KunRk7wAi7E8NZ1C22JF94T2YOl8NGtdBs1JXXTQVrVfl/8G5rCQcZvxOYzE8
 on2ucRXTtqr/mL4Mm72xfxnWcR0SnR05xdeYBeHLr2kEyI/lPdKmLDZ1tak1S0A+Fe
 mVPaU3WRFvN0DN79O5iZseiyybXts2j/HgHgVK8xvYjZZwVR+1sJ0L7t1FPTCeFRCb
 E9zEkkXe/gLlA==
Date: Sun, 5 Jun 2022 09:28:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH AUTOSEL 4.19 16/38] drm/sun4i: Add support for D1 TCONs
Message-ID: <YpyvdSCoVwhAcpgs@sashalap>
References: <20220530134924.1936816-1-sashal@kernel.org>
 <20220530134924.1936816-16-sashal@kernel.org>
 <0f81cfb5-de3c-02eb-8d6d-e5aa1b69c439@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0f81cfb5-de3c-02eb-8d6d-e5aa1b69c439@sholland.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wens@csie.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, stable@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 09:41:59AM -0500, Samuel Holland wrote:
>Hi Sasha,
>
>On 5/30/22 8:49 AM, Sasha Levin wrote:
>> From: Samuel Holland <samuel@sholland.org>
>>
>> [ Upstream commit b9b52d2f4aafa2bd637ace0f24615bdad8e49f01 ]
>>
>> D1 has a TCON TOP, so its quirks are similar to those for the R40 TCONs.
>> While there are some register changes, the part of the TCON TV supported
>> by the driver matches the R40 quirks, so that quirks structure can be
>> reused. D1 has the first supported TCON LCD with a TCON TOP, so the TCON
>> LCD needs a new quirks structure.
>>
>> D1's TCON LCD hardware supports LVDS; in fact it provides dual-link LVDS
>> from a single TCON. However, it comes with a brand new LVDS PHY. Since
>> this PHY has not been tested, leave out LVDS driver support for now.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> Link: https://patchwork.freedesktop.org/patch/msgid/20220424162633.12369-14-samuel@sholland.org
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This patch adds support for hardware in a SoC that will not boot on earlier
>kernel releases, so there is no benefit to backporting the patch (to any
>previous release).

Dropped, thanks!

-- 
Thanks,
Sasha
