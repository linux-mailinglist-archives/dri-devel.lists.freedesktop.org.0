Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1D6BC9ED
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEE910EA4C;
	Thu, 16 Mar 2023 08:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7483C10EA4C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678956747; x=1710492747;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=T9mQ8sxIQb2uf8TfweMRvq1t+6hv3jrWGoUDNdPA40g=;
 b=nJVC32+UO8vczJNt+loCZ/Zw8C6ZXQ23VQ06zrXLRsWyEmE+iq2GHo1u
 u3VpojeuLrA5vcMXrlTNJlg8L3Bnpla4m0Qztglzvtfm4PdscMb/LcG32
 gDg6N/g35Tr/+a94xqTyVtY+vmxUEBUzn9WUiWfZGUa9g1ojsw4DI4cIB
 f3RlI9L+WLMQCPXpeGAmlzzLRActlwfC/V73BrNot2ak+zabdg0Emr1NE
 KubDiosPEsJ59hhUSm3piH3Th73Q9i8wFC/j7oaO4GopAw700jpQHyoPs
 qcyADbpXK8MbqTdIzSIq9uIw8WErr6ANMOFord/TdnS3GmcIdQDHjOGHF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="339459299"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="339459299"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 01:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="925690664"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="925690664"
Received: from janvanof-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.88])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 01:52:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, "Luis R. Rodriguez"
 <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-modules@vger.kernel.org
Subject: Re: enhancing module info to allow grouping of firmwares
In-Reply-To: <CAPM=9txaQfHkjs6nWcwBtnYQXtr996dyht7wasJ7QOovjepmAw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9txaQfHkjs6nWcwBtnYQXtr996dyht7wasJ7QOovjepmAw@mail.gmail.com>
Date: Thu, 16 Mar 2023 10:52:22 +0200
Message-ID: <87v8j19iyh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Mar 2023, Dave Airlie <airlied@gmail.com> wrote:
> Hey moduly/firmware people,
>
> We are facing a problem in the future of NVIDIA providing giant
> firmwares for their devices that are version locked with unstable
> APIs. Even if they weren't version locked we'd likely have to support
> multiple major versions over time.
>
> Now this becomes a problem because when you generate multiple
> initramfs and stick them into /boot over time the number of firmwares
> MODULE_FIRMWARE will match will increase and dracut will shove them
> all into the initramfs.
>
> I think one way to mitigate that would be to provide some sort of
> grouping of module firmwares that are acceptable, and having dracut
> only pick one from the list to provide in the initramfs (hopefully the
> latest one). That way the driver can provide a list of MODULE_FIRMWARE
> lines and userspace knows they are a group.
>
> I've just little idea how we could expose this via current module
> info, happy to try and come up with an enhanced scheme maybe with a
> fallback to just include all of them but was just wanting to get some
> feedback on whether this was something that anyone has ever considered
> before now.

A related problem is platform (or hardware generation) specific firmware
blobs that are listed with MODULE_FIRMWARE, and thus added to the
generic initramfs. What if there was a way to limit them to the specific
platform you have? Sure, a generic initramfs would need them all, but
the vast majority of installs would only need the firmware for the
hardware on the system.

See 'ls /lib/firmware/i915/ | grep -o "^..." | sort | uniq'

I don't want to distract you from your original goal, but if you're
adding some grouping mechanism, maybe try to keep an avenue open for
grouping and filtering like that too?


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
