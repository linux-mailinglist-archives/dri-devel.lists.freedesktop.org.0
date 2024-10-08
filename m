Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D30995708
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 20:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2151210E113;
	Tue,  8 Oct 2024 18:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QezONMuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5A110E113
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728413105; x=1759949105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ICDucJGelq34xkXJWM4N5Y1R19TZD/hVFfeCgqMVV38=;
 b=QezONMuuivVvzVaaty/9rA2ta+7lsx0ziKthstauL73z9nq5fZywB2+j
 9Zi1kx/IIcS9nWPb9qs4n+Pa/h23x8z+OjZ90lIgu6n7UsN5SRjab+9Xv
 ll7IH4ksJi/pyiUrov9XOVmvXfj4psB3Hlwbwscr2AHOEOvNHPGuxX3nF
 vwwqMAqzDSFThJAu6LE8DgV7PY8ikp1XHJUQvc8+FTRBebnATY2zKMF9I
 X3wNDSu8COinXUreoiKa8jKGs4dgdHf6GDWnhpgxiNji6E8MeCDRni4GJ
 GBpjuV7zs12Ol8PH2yRsZtegoxcM33p4k9qvFthSf4Sd6Ab18PEDw8SED A==;
X-CSE-ConnectionGUID: 5HPS0ElkQuKdMIlnkIhc1A==
X-CSE-MsgGUID: wQDcMZy0QWOX8IuSqdkyIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="30520940"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="30520940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:45:05 -0700
X-CSE-ConnectionGUID: cwMvMJ5fRPOJ1it0S0q+WA==
X-CSE-MsgGUID: iXO4RLKTSoatGgtT0Qd+ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76054897"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 Oct 2024 11:45:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Oct 2024 21:45:00 +0300
Date: Tue, 8 Oct 2024 21:45:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Luck, Tony" <tony.luck@intel.com>,
 "jfalempe@redhat.com" <jfalempe@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Message-ID: <ZwV9rD6-zJP3qVy7@intel.com>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
 <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
 <Zv-84gdD85CqVeh5@intel.com>
 <1437f8b3-bf67-4474-849b-1964615227b3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1437f8b3-bf67-4474-849b-1964615227b3@suse.de>
X-Patchwork-Hint: comment
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

On Mon, Oct 07, 2024 at 03:37:40PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 04.10.24 um 12:01 schrieb Ville Syrjälä:
> > On Fri, Oct 04, 2024 at 11:17:02AM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 02.10.24 um 18:15 schrieb Luck, Tony:
> >>>> Thanks for the bug report. Can you provide the output of 'sudo lspci
> >>>> -vvv' for the graphics device?
> >>> Thomas,
> >>>
> >>> Sure. Here's the output (run on the v6.11.0 kernel)
> >> Thanks. It doesn't look much different from other systems. IRQ is also
> >> assigned.
> >>
> >> Attached is a patch that fixes a possible off-by-one error in the
> >> register settings. This would affect the bug you're reporting. If
> >> possible, please apply the patch to your 6.12-rc1, test and report the
> >> result.
> > Didn't one of these weird variants have some bug where the
> > CRTC startadd was not working? Is this one of those?
> > That to me sounds like maybe linecomp has internally been
> > tied to be always active somehow. Perhaps that would
> > also prevent it from generating the interrupt...
> 
> Impressive debugging skills! The broken chip has vendor id 0x0522 
> according to commit 21e74bf99596 ("drm/mgag200: Store HW_BUG_NO_STARTADD 
> flag in device info"). And that's the same type the Tony reported. [1] 
> I'm just not sure if it's worth special casing the chip again or simply 
> revert vblank irqs.

Heh. Though I'm not sure if my theory is quite right. It
seems I've been confused about linecomp all these years;
I thought the split screen effect affected both VGA and
MGA modes (at least on the older chips), but looks like
it never affected MGA mode. I tested it here on a 2064w
based card, which is almost as old as you can go (I do
have an older Athena based card somewhere as well but
didn't bother digging it up).

-- 
Ville Syrjälä
Intel
