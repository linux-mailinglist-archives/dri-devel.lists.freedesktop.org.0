Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A093C9F10DD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 16:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF58610E070;
	Fri, 13 Dec 2024 15:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eF/XYGXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7F810E070
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734103429; x=1765639429;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/L2BRum8V73qtETJCILZboD8K816tH5sCP1OEzZP+ys=;
 b=eF/XYGXtLZZ6qD19Htvp0YPxDBKK9zh1doyRFXxpaceeLE6ZJAzl3wht
 MRj4iKb5vNMMluL2nZLSAZPudqpHRliAbhC1k5zCwV3FUKElF+xBpjO2x
 QvUbPVn7+dOW5z7235p20SgyjjQDyjoujvDxHCJvjkHKaYJ+1EGl2BRFW
 jnpHp/94fGNvui8ZVPwcg64O2d3Sx18lx6zDS+Vy6aHRLwOBhym3hKOa+
 SQBPnF63QiiUJASlVEY5YVhyJOVEtfqEHhq8mMCJE4v4ZK2K17q3+1PEC
 7Qts+AQyinprIj2bIzcNDHizyftsux2fBoDK8ZsKdrzetRz6qvFxU08D0 w==;
X-CSE-ConnectionGUID: LMKsPW0vRayW45SPDC23VA==
X-CSE-MsgGUID: +FuhaUj6QK6hmTtsdz7tSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45945116"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="45945116"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:23:49 -0800
X-CSE-ConnectionGUID: 6OlwYim/Tau/E5xNYYaxxg==
X-CSE-MsgGUID: JJsHhcarQ6uQPQpJ8iVJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="101583297"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.169])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:23:48 -0800
Date: Fri, 13 Dec 2024 09:23:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, alsa-devel@alsa-project.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Maarten Lankhorst <dev@lankhorst.se>, dri-devel@lists.freedesktop.org
Subject: Re: hda: how to implement component master_unbind?
Message-ID: <itxamqrgaiukl3u63zz73brvqpfr6kjdwifrvx7ntjvzdewrlb@miy5fjm4v7ds>
References: <alpine.DEB.2.22.394.2109221456080.3554566@eliteleevi.tm.intel.com>
 <s5ha6jxnekp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <s5ha6jxnekp.wl-tiwai@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Kai to pointing me to this thread, trying to revive it.
Also adding dri-devel as it may be relevant there and Maarten who worked
on the xe integration recently

On Tue, Sep 28, 2021 at 01:07:34PM +0200, Takashi Iwai wrote:
>On Wed, 22 Sep 2021 14:40:19 +0200,
>Kai Vehmanen wrote:
>>
>> Hi Takashi et al,
>>
>> I've been having multiple discussions with our i915 team w.r.t. audio
>> driver behaviour when the aggregate component is unbound, triggered by
>> i915 unbind. This came up again in the recent regression with devres
>> allocations and I now dug into the topic again.
>>
>> In short, I'm puzzled how to really implement this. ALSA (or ASoC) don't
>> really have support for individual components of a card disappearing in a
>> hotplug fashion. At card level, we do have such support (USB, firewire and
>> recent work for PCI hotplug). But not individual components of a card
>> getting unplugged.


I think we will need to add some support here and handle the component
going down the same as a pci hotplug.


>>
>> In current code we have this:
>> static void hdac_component_master_unbind(struct device *dev)
>> {
>> »       struct drm_audio_component *acomp = hdac_get_acomp(dev);
>>
>> »       if (acomp->audio_ops && acomp->audio_ops->master_unbind)
>> »       »       acomp->audio_ops->master_unbind(dev, acomp);
>> »       module_put(acomp->ops->owner);
>> »       component_unbind_all(dev, acomp);
>> »       WARN_ON(acomp->ops || acomp->dev);
>> }
>>
>> ... when e.g. i915 driver is unbound (but could be any driver using the
>> component framework, not jus Intel hw), i915 calls component_del() and HDA
>> gets call to the above. After this, acomp ops are null are audio no longer
>> has ability to talk to i915 driver (which makes sense given it's unbound).
>>
>> If audio was runtime suspended, this kind of works (but relies on some
>> good luck). Upon HDA controller resume, we note acomp ops are NULL and
>> HDMI/DP operations (like snd_hdac_display_power()) silently become no-ops.
>> PCM streaming will go to /dev/null, but this is ok'ish since no monitor
>> can be connected anyways.
>>
>> If audio was active, we start to get warnings or worse. Audio expects hw
>> display codec to be powered and programmed, but suddenly it mey lose
>> state. If the audio controller is actually part of the display hardware
>> (e.g. discrete GPUs), then controller registers can stop functioning (they
>> should be still available, but given the main diplay driver is unbound,
>> odds of suprising behaviour are high).
>>
>> So this is less than ideal. I've been looking at options:
>>
>> 1) prevent/block the unbind if audio device is busy
>>
>> The component framework does not allow individual components to return
>> -EBUSY, so there's no way to let others know that unbind is not possible
>> now.

and there's no way to block unbind from the pci level neither, so this
is not really possible. There's nothing blocking someone to unplug the
card if it's on a hotplug-capable bus and/or someone calling

	# echo 0000:00:02.0 > /sys/module/xe/drivers/pci:xe/unbind

to tell the module to unbind from the device. If that involves multiple
components, I think they all should treat that as a device hotplug
rather than handling it differently.

>>
>> This would force anyone testing DRM driver unbind to first unbind
>> the audio driver and stop any active audio use-cases if needed.
>>
>> 2) unbind the ALSA card
>>
>> I've experimented doing a device_unregister() from the above callback, but
>> this has not really worked (onion peeling exercise of new probelms). The
>> code is shared by multiple controllers, so getting a handle to an snd_card
>> object is not straighforward (drvdata is differnet for SOF and
>> snd-hda-intel for instance). But with some new work, maybe we could call
>> snd_card_disconnect() to detach the card and inform user-space.

yeah, since it depends on the i915/xe side to power up the display
engine, I think handling that esssentially the same as a hotplug would
be ideal


>>
>> 3) continue as-is and try to fix bugs
>>
>> If audio is active, maybe we could force a acomp->put_power() to ensure
>> a clean unregister of the display part. But this leaves a big chunk of
>> issues especially with HDA controllers that require the display to
>> be powered on, to function.
>>
>> ..
>>
>> Any ideas, and/or has there been prior work? It seems Takashi it's been
>> mostly you who has been active working on the acomp integration recently.
>> I also included Chris, Daniel and Jani who've had patches to
>> hdac_component.c.
>
>Removing a component from the card is a PITA for now, indeed,
>especially when its influence is over different APIs (PCM, control,
>whatever)...

I'm not yet very familar with the sound side and checking if something changed
from when this thread started: for cards that can't work without the
other component, would it be hard to escalate that event to handle it
the same as a hotplug? Because from this thread it seems usb/pci hotplug
is already available.

thanks
Lucas De Marchi

>
>One thing I can think of is to perform like the vga_switcheroo
>handling in hda_intel.c; it's essentially a forced runtime suspend,
>and disable the whole card.  But in the case of audio-component
>unbind, we need to think about re-binding -- or completely ignore
>re-binding until the whole driver gets unloaded.
>
>
>Takashi
