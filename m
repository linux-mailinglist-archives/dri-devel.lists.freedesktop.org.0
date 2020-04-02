Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE2919D085
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421EC6EB00;
	Fri,  3 Apr 2020 06:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA356E157
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 20:20:29 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e8648db0000>; Thu, 02 Apr 2020 13:19:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 02 Apr 2020 13:20:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 02 Apr 2020 13:20:29 -0700
Received: from [10.20.23.163] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Apr
 2020 20:20:28 +0000
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Lukas Wunner <lukas@wunner.de>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
 <fafd3a20-7da4-f370-0356-576bca565bd1@nvidia.com>
 <20200402182504.jf3mvgc2vbu3vldm@wunner.de>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <61253db5-1287-c021-43e2-899cd5ebfb8e@nvidia.com>
Date: Thu, 2 Apr 2020 15:21:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200402182504.jf3mvgc2vbu3vldm@wunner.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585858779; bh=ojjgxjbnZFANk4GNcjWlLihtkdM+yCCkGuD5svAYIPM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=N/AV3pzYKK/wHF7ESq+UpjcSHIPVAxjZd0IqBWW5R7vkXDSuzN953yvJim7fqux94
 a/JJBSVFBUL3Zun5JM5FfcrJjZbptADjouA2en8ZOGf3pCxoa5F1UXPCNiNQv1fEe/
 hVEp9nNK0f0uFuxkr1aYUbh4zmxYJfZbDUWxll3jpaE/TV7Bz1Y2rypCrATGUuT9Sl
 SKqrby6wgsxExFndjvuyhPadSfkAvVPYgKzisYhK3AGPjLmOTDQahRHtkAq7f+x0Jx
 wNJbP+c5U9p2RNYq34au8uhCoD4FhRBPBJgfp5jURgj7SalBOH7v2pR0aCAG3O946p
 6lHMXtIYrNOMw==
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/2/20 1:25 PM, Lukas Wunner wrote:
> On Thu, Apr 02, 2020 at 12:56:04PM -0500, Daniel Dadap wrote:
>> I'll check one of the eDP-based systems I've been experimenting on to see if
>> setting the VGA_SWITCHER_NEEDS_EDP_CONFIG capability in the handler is
>> sufficient to make i915 avoid poking the AUX channel when it's mux-switched
>> away.
> That will not be sufficient I'm afraid.  The capability was added in
> preparation for taking advantage of pre-calibration by the active GPU
> as permitted by the DP spec, but that feature only ever existed in the
> experimental patches I linked to and which I never got around to
> completing (so far).


Ah, I see. I'll take a look at those patches and see how far they go, then.


I just remembered another issue that falls out from the assumption that 
eDP is always connected: in my test setup, i915 always sees and 
advertises a connected eDP panel, even if the mux is switched away from 
i915's GPU before e.g. starting X. Presumably the panel was probed when 
starting up i915 to drive the console, and since eDP can't ever be 
disconnected in i915, it just remains "connected" forever. So I'm not 
sure that just proxying the aux channel through the switched-to GPU's 
driver will be quite enough, either, if we're not going to be hiding the 
mux switch from clients.


> BTW, if the inactive GPU sets up the eDP output with the precalibrated
> values and the mux is switched without using the PSR trick you've
> mentioned, will the transition be glitchy?
>
> If so, is there a chance to switch the mux in a vblank to avoid glitches?


I don't know. In my current PoC I'm just using X11 DPMS to shut down the 
head when it's muxed away and bring it back up when it's muxed back in, 
as a way to trigger link training when muxing back in and to shut off 
the head when muxed away. This leads to a rather lengthy and conspicuous 
blanking glitch on systems without PSR, and a conspicuous hesitation on 
systems with PSR. If we can refresh the display without doing a full 
modeset (I think DPMS in X.org's modesetting_drv.so does a full modeset, 
but I didn't investigate particularly closely), then I expect the 
duration of the switch can be reduced substantially, but I don't know to 
what extent it would still glitch.


>
>> (This would be in addition to hacking the can_switch() callback in the
>> GPU drivers to allow switching while there are still active KMS clients for
>> the purposes of this experiment, unless somebody can point me to a tree with
>> the WIP per-output switching Daniel Vetter mentioned.
> I'm not aware anyone ever bothered implementing per-output switching.
> Which hardware supports that anyway?  I documented the situation on
> the MacBook Pro in apple-gmux.c:
>
>   * The external DP port is only fully switchable on the first two unibody
>   * MacBook Pro generations, MBP5 2008/09 and MBP6 2010.
>   * The following MacBook Pro generations replaced the external DP port with a
>   * combined DP/Thunderbolt port and lost the ability to switch it between GPUs,
>   * connecting it either to the discrete GPU or the Thunderbolt controller.
>
> So only very old machines can switch the external DP port separately.
> We just switch it in unison with the LVDS panel on those machines for
> simplicity.


Yes, I noticed that apple-gmux switches both muxes in unison when I was 
initially evaluating vga-switcheroo. Daniel Vetter mentioned per-output 
switching was possible, without shutting down the switched-away-from 
GPU, but I didn't see any evidence of such functionality in the 
torvalds/linux tree or the drm/drm-next tree. I didn't search anywhere 
beyond that. Daniel, could you point out where the per-output switching 
support you mentioned can be found?


> I'm not aware of other contemporary machines besides MacBook Pros
> which allow switching the panel at runtime, let alone switch
> external ports separately.  Are you at liberty to divulge what
> hardware you're working on?  Just curious.


Sorry, not at this time.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
