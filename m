Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB9E19D087
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26BC6EAFA;
	Fri,  3 Apr 2020 06:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB796EAD3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 17:54:51 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e8626b90000>; Thu, 02 Apr 2020 10:54:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 02 Apr 2020 10:54:50 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 02 Apr 2020 10:54:50 -0700
Received: from [10.20.23.163] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Apr
 2020 17:54:50 +0000
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Lukas Wunner <lukas@wunner.de>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <fafd3a20-7da4-f370-0356-576bca565bd1@nvidia.com>
Date: Thu, 2 Apr 2020 12:56:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200402113925.2zvatduiyqld7pj2@wunner.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585850041; bh=ikTVoKhJRVXsCCdQNJBmRLyc1D+tpq+ch3vuRJMjhp8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=ZWjZOodXz2Vum9RHhY/QEZuquDXMiA/D2EGGnvgHpEgtMA+mARVA/cNwQzhitKL+B
 WoGgME+itDLksgmDdAgIhJHZ5aFXtHDlZkjWGOM9f67UmGB/vAV60V54gLScJ2D1L9
 iN1YMwsO2P0ffmgZfWyTKMngUHZbKCHmMdOi8CeFpmVxd5F3TKUT/DJgNX/UyJduc9
 i+jw8SxXQRHZntDf/2RbGVcCRCKaWYNdeBrTW1mWlj/PIsISo03e761WG6HlgZzGZ7
 OzWNvp1G1sYyBjO6lGeKzFpSGA1GOwANPzUmL4jy2ZdD+f0l8Bsutdbi1UCjJStURC
 G4+lJ6eXQy+Gw==
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


On 4/2/20 6:39 AM, Lukas Wunner wrote:
> External email: Use caution opening links or attachments
>
>
> On Fri, Mar 27, 2020 at 04:25:19PM -0500, Daniel Dadap wrote:
>> A number of hybrid GPU notebook computer designs with dual (integrated plus
>> discrete) GPUs are equipped with multiplexers (muxes) that allow display
>> panels to be driven by either the integrated GPU or the discrete GPU.
>> Typically, this is a selection that can be made at boot time as a menu
>> option in the system firmware's setup screen, and the mux selection stays
>> fixed for as long as the system is running and persists across reboots until
>> it is explicitly changed. However, some muxed hybrid GPU systems have
>> dynamically switchable muxes which can be switched while the system is
>> running.
> As you may be aware, there's drivers/gpu/vga/vga_switcheroo.c (of which
> I'm listed as a reviewer in MAINTAINERS) to support such hardware.
>
> It also supports muxed configurations, including those that support
> switching at runtime (and not only at boot) such as the MacBook Pro,
> which uses drivers/platform/x86/apple-gmux.c to interface between
> vga_switcheroo and the hardware mux.
>
> However, so far switching only actually works on LVDS-based MacBook Pros,
> i.e. all pre-retina machines introduced between Late 2008 and Mid 2012,
> because that hardware is capable of switching the DDC pins separately
> from the display, so we lock and switch them when probing the EDID.


I have observed that on at least some systems, the EDID for the internal 
panel can be read via the ACPI _DDC method regardless of whether it's 
actively muxed in. I don't know whether that's true for all systems 
where the DDC line can't be switched independently, but maybe 
vga_switcheroo could also export an interface for GPU drivers to cache 
EDIDs so that a muxed-away GPU can read an EDID that was previously read 
by another GPU? I guess the utility of that would depend on how 
prevalent the combination of no DDC muxing + no ACPI EDID reads turns 
out to be.


> The retina machines introduced from Mid 2012 onward use eDP and run
> into the issues you're describing:  The AUX channel cannot be switched
> separately from the display, so link training fails unless the entire
> display is switched.  Nevertheless macOS can switch the panel seamlessly.
> So how are they doing it?
>
> Well, I don't own a retina MacBook Pro, hence never got very far with
> supporting them, but I did some research and experiments in the 2015/2016
> time frame which a colleague, Bruno Bierbaumer, tested on his machine:
>
> First of all, there's DPCD byte 3 bit 6 (NO_AUX_HANDSHAKE_LINK_TRAINING)
> which is documented as follows:
>
>      Does not require AUX CH handshake when the link configuration is
>      already known. [...] The known-good drive current and pre-emphasis
>      level (or those used in the last "full" link training with AUX CH
>      handshake) must be used when the link training is performed without
>      AUX CH handshake.
>
> That bit is set on the MacBook Pros in question.


I'll check one of the eDP-based systems I've been experimenting on to 
see if setting the VGA_SWITCHER_NEEDS_EDP_CONFIG capability in the 
handler is sufficient to make i915 avoid poking the AUX channel when 
it's mux-switched away. (This would be in addition to hacking the 
can_switch() callback in the GPU drivers to allow switching while there 
are still active KMS clients for the purposes of this experiment, unless 
somebody can point me to a tree with the WIP per-output switching Daniel 
Vetter mentioned.


> So I think what we should be doing here is that the DRM driver which
> happens to be muxed to the panel on boot performs link training and
> informs vga_switcheroo of the drive current, pre-emph level, etc.
> The other DRM driver is notified when that information is available
> and uses it to set up its eDP output, skipping an actual AUX CH
> handshake.
>
> At least i915 probes various capabilities in the DPCD without any
> consideration that the AUX channel may currently not be available.
> Back in the day I experimented with a read-only proxy mechanism
> to make that work, whereby the inactive DRM driver uses the active
> DRM driver to access the DPCD:
>
> https://patchwork.kernel.org/patch/7000591/
>
> An alternative would be to have the active DRM driver cache the
> required portions of the DPCD for use by the inactive DRM driver.
>
> Note that vga_switcheroo is currently controlled via debugfs.
> That is a historic artefact.  The kernel has since gained a
> mux subsystem in drivers/mux/ which could be used to represent
> the display mux in a standardized way in regular sysfs.
>
> Thanks,
>
> Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
