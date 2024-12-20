Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0BC9F96D9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 17:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E1810E3A4;
	Fri, 20 Dec 2024 16:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y52qe8M7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F92610E3A4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734713273; x=1766249273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K+IAyVV6uYzSnEM/kInSC/ZiUi+9E8IFwxwlwVeUewA=;
 b=Y52qe8M7Ds9wwOrCLq022x7gxPoPXsp4ZF8IQBe9JuqoUVXII4SdBiuj
 xFof+D28pnrTNQVvpfXOgPi2OGrC0vcF9+VTKE7XxMl77t9vzg5jkz4I+
 Oi0yItK+Fzwkzx5NNPCRM6MOsOV0uatOqEdaW9N448ZwXHJ9tuoPss2iO
 ADCNxQde1Hw2nR/dLvE2dJ8sgaM+dzabSjKxsh4ZYWpxIeFQCxE3PuSpa
 zGk+IGHewXhGlMitOGiSL9SNbuu0ZNiRQLKXOWBnoUDFhZQSAeVGyHnV9
 5GQGT2Y/bynJajPapdjmJcFtQObbF6Kahs2BBWApwVz+bNsIJA1k89ywr w==;
X-CSE-ConnectionGUID: YdJlI0V6TsCdC+qokzgMxQ==
X-CSE-MsgGUID: 3OR2EoniRM6Ayxo1iEsSwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52671012"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="52671012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:47:52 -0800
X-CSE-ConnectionGUID: 3Y7ykk91Q2+JFYmyfHDzFQ==
X-CSE-MsgGUID: bgTXGys2QHGJzk3h2Haa2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98334337"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.128])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:47:50 -0800
Date: Fri, 20 Dec 2024 10:47:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Alsa-devel <alsa-devel@alsa-project.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>, Maarten Lankhorst <dev@lankhorst.se>, 
 dri-devel@lists.freedesktop.org
Subject: Re: hda: how to implement component master_unbind?
Message-ID: <bjirj7rd3ekt4ysbiwhets3grjq3xegz6hzraqhsuhbnvpqsx5@vohnnoczp26r>
References: <alpine.DEB.2.22.394.2109221456080.3554566@eliteleevi.tm.intel.com>
 <s5ha6jxnekp.wl-tiwai@suse.de>
 <itxamqrgaiukl3u63zz73brvqpfr6kjdwifrvx7ntjvzdewrlb@miy5fjm4v7ds>
 <alpine.DEB.2.22.394.2412191343280.14041@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2412191343280.14041@eliteleevi.tm.intel.com>
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

On Thu, Dec 19, 2024 at 04:00:08PM +0200, Kai Vehmanen wrote:
>Hi,
>
>On Fri, 13 Dec 2024, Lucas De Marchi wrote:
>
>> Thanks Kai to pointing me to this thread, trying to revive it.
>> Also adding dri-devel as it may be relevant there and Maarten who worked
>> on the xe integration recently
>
>ack, given fresh wave of bugs this year (even if these are all (?) bugs
>triggered in test configurations), probably warrants another look.
>
>[1) prevent/block the unbind if audio device is busy]
>> and there's no way to block unbind from the pci level neither, so this
>> is not really possible. There's nothing blocking someone to unplug the
>> card if it's on a hotplug-capable bus and/or someone calling
>>
>> 	# echo 0000:00:02.0 > /sys/module/xe/drivers/pci:xe/unbind
>>
>> to tell the module to unbind from the device. If that involves multiple
>
>Ack, I think we can put this option to rest.
>
>[unbind the ALSA card]
>> yeah, since it depends on the i915/xe side to power up the display
>> engine, I think handling that esssentially the same as a hotplug would
>> be ideal
>[...]
>> I'm not yet very familar with the sound side and checking if something changed
>> from when this thread started: for cards that can't work without the
>> other component, would it be hard to escalate that event to handle it
>> the same as a hotplug? Because from this thread it seems usb/pci hotplug
>> is already available.
>
>I don't think much has changed. I think this is (still) a doable option,
>but just requires effort put in (which so far has not happened). I think
>the problem can be roughly divided in two categories:
>
>1) discrete graphics - controller on discrete PCI device
>
>Here the problem is more acute (as may affect register accesses done from
>audio driver), but potentially also easier to fix. There is a single
>driver (snd-hda-intel) to handle this case in ALSA and the sound card
>created only exposes the HDMI/DP PCMs, so if graphics side unbinds,
>disconnecting the ALSA card seems ok as well. The open I have is how do we
>recreate the ALSA card. Audio driver probe is triggered by attach of the
>PCI device, but here the PCI device is not unplugged, just unbound by one
>of the drivers. But doesn't sound like a unique problem to audio, so I'm
>sure there's some example solution to follow.

since we are using include/linux/component.h, i915-display will call
component_del() on unbind, which should trigger all components to be
unbound - snd should release all the references it holds to display
power.

once we add back the i915/xe side with component_add() it should
complete the aggregate driver and bind again all sides.

Lucas De Marchi

>
>2) integrated display codecs
>
>The regular laptop case is a bit more iffy as there are more audio drivers
>using the display codec driver stack (each need support), and in most
>cases, the ALSA card is a mix of HDMI/DP but also internal codec and
>speaker PCMs. If we use the card disconnect infra in ALSA (i.e. same infra
>as USB hotplug), this means display unbind will not just disconnect the
>HDMI/DP PCM device, but alsl the interal audio codec and speakers. And
>there's a bigger issue how we reenumerate the full card again.
>
>I think the longterm solution is to move the HDMI/DP PCMs to their own
>ALSA card. We in fact some work going on to this direction in the SOF
>driver, but it's far from complete, and we are not sure whether we can
>change the existing platforms to use this approach (as changing the card
>topologies will be visible to user-space as well and potentially break
>stuff).
>
>I did file a bug to track this in SOF
>https://github.com/thesofproject/linux/issues/5276 .
>
>Br, Kai
