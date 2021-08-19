Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0B3F1F8B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 20:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A817588647;
	Thu, 19 Aug 2021 18:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675B288647;
 Thu, 19 Aug 2021 18:07:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216346739"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="216346739"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 11:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="424132370"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 19 Aug 2021 11:07:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 21:07:26 +0300
Date: Thu, 19 Aug 2021 21:07:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Dave Airlie <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [BUG - BISECTED] display not detected anymore
Message-ID: <YR6d3nU1R14Eqpic@intel.com>
References: <YRe7I67h4gMVOWuu@osiris>
 <YRztFhtGS9RkP2Bf@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YRztFhtGS9RkP2Bf@osiris>
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

On Wed, Aug 18, 2021 at 01:20:54PM +0200, Heiko Carstens wrote:
> On Sat, Aug 14, 2021 at 02:46:27PM +0200, Heiko Carstens wrote:
> > Hello,
> > 
> > I have Fedora 33 running, and with the Fedore kernel update from 5.11
> > series to 5.12 my external monitor was not detected anymore. Same is
> > true with the Fedora supplied 5.13 kernel version.
> > 
> > So I tried with vanilla kernel 5.11 and latest git head from Linus'
> > tree. 5.11 works while latest git head does not. Bisecting the problem
> > points to commit 32c3d9b0f51e ("Merge tag 'drm-intel-next-2021-01-27'
> > of git://anongit.freedesktop.org/drm/drm-intel into drm-next").
> > 
> > Unfortunately it is a merge commit, so it looks like conflicting
> > changes have been made in the parent branches.
> > 
> > Hardware in use:
> > 
> > - ThinkPad X1 Yoga 4th / Carbon 7th
> > - Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
> > 
> > The Thinkpad is connected to a ThinkPad Thunderbolt 3 Dock with a
> > Thunderbolt cable and a monitor (Eizo EV3285) is connected via
> > Displayport to the docking station.
> > 
> > The monitor is detected and works without any problems (4k@60HZ)
> > before the above mentioned merge commit. With the commit and
> > afterwards it is not detected anymore and only the Thinkpad builtin
> > display can be used.
> > 
> > Any idea what went wrong? I can provide more information, or test
> > debug patches if wanted. Just let me know.
> 
> So looks like I made a mistake when bisecting (it literally took me
> two days due to the low power machine, even with a minimized kernel
> config). Anyway, looking into it again the first bad commit is
> 
> ef79d62b5ce5 ("drm/i915: Encapsulate dbuf state handling harder")
> 
> With that commit the display is not detected anymore, one commit
> before that it still works. So this one seems to be broken.
> 
> Ville, Stanislav, any idea how to fix this?
> 
> commit ef79d62b5ce53851901d6c1d21b74cbb9e27219b
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Date:   Fri Jan 22 22:56:32 2021 +0200
> 
>     drm/i915: Encapsulate dbuf state handling harder

That has nothing to do with display detection, so very mysterious.

Please file a bug at https://gitlab.freedesktop.org/drm/intel/issues/new
boot with drm.debug=0xe with both good and bad kernels and attach the
dmesg from both to the bug.

-- 
Ville Syrjälä
Intel
