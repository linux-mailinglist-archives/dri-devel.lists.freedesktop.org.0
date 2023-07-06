Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147B749892
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 11:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE0710E4B8;
	Thu,  6 Jul 2023 09:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA7910E4B8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688635972; x=1720171972;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vhGuAtDC0kLsTJF3Z93j+2l6YdwFdnGCbvxAz4NPd8E=;
 b=QxokKuFs79ONQgvvTtuFKqsv1DRgpuwTdAr29HBoTwybUw0opzKogvrb
 r2UAZfeW/bsGRWSCNH3op4gHC6m1p+MbVWa6RoNIPLmsXYVhVPLf08aoP
 VGnoybBBxwPTXRLVfuCdJ9wxfGtlZXvTKe8md0NFNcW0wxuMr+89kfZgV
 zuDbd4VDarc0FLNsAA7OzO1kSuvSpq8Zl7YKCKQruROHlSec9pJ/5zkgm
 AjUSfwpImFv+VibXjqv08l3dTa6ywCQMY6/079xePUOigY6f8BO1A/u4W
 xfsBRuZoG9l84BYx+wYQRpU1Cco0UlacusD+z52JvwZmOTAgSCm/UvAC2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="361027825"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="361027825"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 02:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="893491841"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="893491841"
Received: from jmvuilla-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.105])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 02:32:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
In-Reply-To: <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com>
 <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
Date: Thu, 06 Jul 2023 12:32:46 +0300
Message-ID: <87h6qhxu4h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 06 Jul 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> On 04/07/2023 18:45, Jocelyn Falempe wrote:
>> On 04/07/2023 16:54, Jani Nikula wrote:
>>> On Fri, 23 Jun 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>>>> =C2=A0 EDID on DP")
>>>> The default resolution is now 640x480 when no monitor is connected.
>>>> But Aspeed graphics is mostly used in servers, where no monitor
>>>> is attached. This also affects the "remote" resolution to 640x480,=20
>>>> which is
>>>> inconvenient, and breaks the anaconda installer.
>>>> So when no EDID is present, set 1024x768 as preferred resolution.
>>>
>>> This conflates "monitor connected" and "EDID present", which are not
>>> necessarily the same thing.
>>>
>>> The fallback in drm_helper_probe_single_connector_modes() is for no
>>> modes, but connector status is connected or unknown.
>>=20
>> When debugging the issue, I found it surprising that the status is=20
>> "connected" when nothing is plugged in the DP port.
>>>
>>> You could add a connector ->detect callback that returns disconnected
>>> when there's no display, and the problem should go away. If there's no
>>> ->detect callback, it'll default to connected.
>>=20
>> ok, I'll try that. I don't know how the hardware detect something is=20
>> connected, but looking at the dp code, maybe checking=20
>> "AST_IO_CRTC_PORT,0xDC, ASTDP_LINK_SUCCESS" would be good enough.
>
> I've tested this approach, and it works.

\o/

> But on the server I'm testing,=20
> there are VGA and DP output. I think on a server that has only one DP=20
> output, if no monitor is connected, then no modes will be reported to=20
> userspace, and the remote BMC may not work ?

I couldn't say, but having the driver lie about the connected status to
make it work feels wrong.

> Also I don't have physical access to the server, so I only tested when=20
> no monitor is plugged.
>
> I will send shortly a v2 with this change, so others can help me test=20
> this case.

Thanks,
Jani.


>
> Best regards,

--=20
Jani Nikula, Intel Open Source Graphics Center
