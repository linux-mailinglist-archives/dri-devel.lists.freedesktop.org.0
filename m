Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AdBLwKub2nxEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:32:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1C47995
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D63210E5C7;
	Tue, 20 Jan 2026 11:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WesA/p25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7E010E5C4;
 Tue, 20 Jan 2026 11:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768909566; x=1800445566;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VfkdrEkuxGBt0yQebKVLiNCY5ulSNr8bK3vrF4D2C7I=;
 b=WesA/p256JifGLToOxSbvOJwBGuOJuvNHVJOosX2Zft9mDFhpAFT3gq2
 dOxQ6K63CpTdORsC8vPOV41VanCZLn6IWA6woJG2Ku5S3IIqjbf4/E1Zw
 i0QXB4RJ/0GrmNServKEoGaVQtSLBs5xpY174DV5zN/Aq4nfrUAy/vYNP
 SME6wL0m+iROA2pSVDMqjX50+yUSTL++7YwAI3gj/tJj65mQvHmPxl6Qe
 Wxpoqjy+CEVi3xDHNMT6NT+aNeInGnmU3teeqS7TLQPKx3gwT17HP6ZDu
 /fUpPt4RMlzLsgatHe+4C6Nwy6kJHjCDWI58DDpYBQtcQbQ7Lw3ngSita g==;
X-CSE-ConnectionGUID: aX3aG4EpR6i/tjHFc7u9fA==
X-CSE-MsgGUID: 3ZPgtJ6xTfGsDWFJAOWQYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69126911"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="69126911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:46:06 -0800
X-CSE-ConnectionGUID: TAxA7YP6RlS42cqtIE4aaA==
X-CSE-MsgGUID: Cl2Gk52kQYSrQXOFlgBWww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205901516"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:46:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Stone <daniel@fooishbar.org>, Michel =?utf-8?Q?D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>
Cc: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 15/17] drm/amd/display: Trigger ALLM if it's available
In-Reply-To: <CAPj87rPyt2+cWjM7KmpRzY4sBgaUzZBOS3FJoxF+PjkijapTag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
 <20260119011146.62302-16-tomasz.pakula.oficjalny@gmail.com>
 <82645a06-2d15-48fe-a250-56d736d636da@mailbox.org>
 <CAPj87rPyt2+cWjM7KmpRzY4sBgaUzZBOS3FJoxF+PjkijapTag@mail.gmail.com>
Date: Tue, 20 Jan 2026 13:45:57 +0200
Message-ID: <34863839c6d54e911597192bba6a54c3b9c97b75@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,fooishbar.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:email]
X-Rspamd-Queue-Id: 1BC1C47995
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026, Daniel Stone <daniel@fooishbar.org> wrote:
> Hi,
>
> On Tue, 20 Jan 2026 at 10:33, Michel D=C3=A4nzer <michel.daenzer@mailbox.=
org> wrote:
>> On 1/19/26 02:11, Tomasz Paku=C5=82a wrote:
>> > [Why]
>> > ALLM automatically puts TVs into low latency modes (gaming modes) which
>> > we basically always want for PC use, be it gaming, or using precise
>> > inputs like mice and keyboards.
>>
>> How about e.g. video playback though?
>>
>> It might make sense to let the Wayland compositor control this, e.g. via=
 the Wayland content type hint protocol.
>
> Yes, I think this should be a connector property. We'll happily
> implement support for Weston as the uAPI vehicle.

Content type might be a useful policy hint also for content adaptive
brightness control and the like.

Ville and I have also tossed around ideas for passing the "power mode"
to the DRM drivers (e.g. Performance, Balanced, Power Saver). There are
various cases where the drivers need to make policy decisions that would
be better decided by userspace. However, it gets complicated and
unweildy if all of them are individual knobs. A power mode input might
be useful in making the latency decisions too.

BR,
Jani.

--=20
Jani Nikula, Intel
