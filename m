Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95119F7CD2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 15:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883BB10E31B;
	Thu, 19 Dec 2024 14:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PB6Q5Jgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F4510E22A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 14:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734617306; x=1766153306;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=c7D41ZzagNhqWWNZmCWnkgbrWY21o93XuI9h6+fDFlY=;
 b=PB6Q5JgmZCacFRx9ZrJMcKUqVIqAWNNYa6pkk8sJYu2eF1iMvzZkBQBn
 p5Lfe0Z5icnGmmQx1KBeF8YT8UxZlSqhRm+GkufLQXdvtb2BkH/n6AZg6
 vtCrP5riJINoRcv76yHq/nqtVO16fEAtYzEDUH8pqePZJ3+YLDZcGX6pv
 ebFgcFXjBnC7QNjZRJLy5JWK2Z/hqxKGF6cXqDdN8VAD6n32EiEd7RhM5
 yeKCTl40sDEvAXh8kg5q3MH1vwgIYoF+DT/DuoHRNh7gPKURb+wnu9GEL
 uGSb56QZKEd1zt0siQ2aLjzHSkyKNZ6fgTMOUHzfKi1TIRWPTmOcBdZG5 A==;
X-CSE-ConnectionGUID: hGzu+b+sS/Ol2abOIlIfkA==
X-CSE-MsgGUID: xe0e9GgWToupWCqysxUDGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45725111"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="45725111"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 06:08:25 -0800
X-CSE-ConnectionGUID: maLhaODsQK20okSYH5k8dQ==
X-CSE-MsgGUID: KEG5wSuUQqamjpXHiNQyeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="98262780"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 06:08:23 -0800
Date: Thu, 19 Dec 2024 16:00:08 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Lucas De Marchi <lucas.demarchi@intel.com>
cc: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Alsa-devel <alsa-devel@alsa-project.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Maarten Lankhorst <dev@lankhorst.se>, dri-devel@lists.freedesktop.org
Subject: Re: hda: how to implement component master_unbind?
In-Reply-To: <itxamqrgaiukl3u63zz73brvqpfr6kjdwifrvx7ntjvzdewrlb@miy5fjm4v7ds>
Message-ID: <alpine.DEB.2.22.394.2412191343280.14041@eliteleevi.tm.intel.com>
References: <alpine.DEB.2.22.394.2109221456080.3554566@eliteleevi.tm.intel.com>
 <s5ha6jxnekp.wl-tiwai@suse.de>
 <itxamqrgaiukl3u63zz73brvqpfr6kjdwifrvx7ntjvzdewrlb@miy5fjm4v7ds>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi,

On Fri, 13 Dec 2024, Lucas De Marchi wrote:

> Thanks Kai to pointing me to this thread, trying to revive it.
> Also adding dri-devel as it may be relevant there and Maarten who worked
> on the xe integration recently

ack, given fresh wave of bugs this year (even if these are all (?) bugs 
triggered in test configurations), probably warrants another look.

[1) prevent/block the unbind if audio device is busy]
> and there's no way to block unbind from the pci level neither, so this
> is not really possible. There's nothing blocking someone to unplug the
> card if it's on a hotplug-capable bus and/or someone calling
> 
> 	# echo 0000:00:02.0 > /sys/module/xe/drivers/pci:xe/unbind
> 
> to tell the module to unbind from the device. If that involves multiple

Ack, I think we can put this option to rest. 

[unbind the ALSA card]
> yeah, since it depends on the i915/xe side to power up the display
> engine, I think handling that esssentially the same as a hotplug would
> be ideal
[...]
> I'm not yet very familar with the sound side and checking if something changed
> from when this thread started: for cards that can't work without the
> other component, would it be hard to escalate that event to handle it
> the same as a hotplug? Because from this thread it seems usb/pci hotplug
> is already available.

I don't think much has changed. I think this is (still) a doable option, 
but just requires effort put in (which so far has not happened). I think 
the problem can be roughly divided in two categories:

1) discrete graphics - controller on discrete PCI device

Here the problem is more acute (as may affect register accesses done from 
audio driver), but potentially also easier to fix. There is a single 
driver (snd-hda-intel) to handle this case in ALSA and the sound card 
created only exposes the HDMI/DP PCMs, so if graphics side unbinds, 
disconnecting the ALSA card seems ok as well. The open I have is how do we 
recreate the ALSA card. Audio driver probe is triggered by attach of the 
PCI device, but here the PCI device is not unplugged, just unbound by one 
of the drivers. But doesn't sound like a unique problem to audio, so I'm 
sure there's some example solution to follow.

2) integrated display codecs

The regular laptop case is a bit more iffy as there are more audio drivers 
using the display codec driver stack (each need support), and in most 
cases, the ALSA card is a mix of HDMI/DP but also internal codec and 
speaker PCMs. If we use the card disconnect infra in ALSA (i.e. same infra 
as USB hotplug), this means display unbind will not just disconnect the 
HDMI/DP PCM device, but alsl the interal audio codec and speakers. And 
there's a bigger issue how we reenumerate the full card again.

I think the longterm solution is to move the HDMI/DP PCMs to their own 
ALSA card. We in fact some work going on to this direction in the SOF 
driver, but it's far from complete, and we are not sure whether we can 
change the existing platforms to use this approach (as changing the card 
topologies will be visible to user-space as well and potentially break
stuff).

I did file a bug to track this in SOF 
https://github.com/thesofproject/linux/issues/5276 .

Br, Kai
