Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFFF44634C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 13:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046D46E161;
	Fri,  5 Nov 2021 12:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3480D6E15E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 12:20:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="211939114"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="211939114"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 05:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="490304718"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 05 Nov 2021 05:20:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 14:20:00 +0200
Date: Fri, 5 Nov 2021 14:20:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: Questions about KMS flip
Message-ID: <YYUhcCxQ6LhL8Xyn@intel.com>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 12:44:34PM -0400, Harry Wentland wrote:
> +Nick
> 
> It looks to be the old drm_plane_state->fb holds that reference. See dm_plane_helper_cleanup_fb() in amdgpu_dm.c.

BTW looks like you have a possible leak during fb init;
amdgpu_display_framebuffer_init() grabs the refs to the BOs,
but drm_framebuffer_init() might still fail (at least
theoretically) which will then leak those BO refs.

> 
> Harry
> 
> On 2021-11-04 08:51, Christian König wrote:
> > Hi guys,
> > 
> > adding the usual suspects which might know that of hand: When we do a KMS page flip, who keeps the reference to the BO while it is scanned out?
> > 
> > We are running into warning backtraces from TTM which look more than odd.
> > 
> > Thanks,
> > Christian.

-- 
Ville Syrjälä
Intel
