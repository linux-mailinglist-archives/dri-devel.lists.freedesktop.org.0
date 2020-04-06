Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838D19F224
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 11:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B5F89DF7;
	Mon,  6 Apr 2020 09:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EF989BB2;
 Mon,  6 Apr 2020 09:11:40 +0000 (UTC)
IronPort-SDR: m0rdf1h397I0SFc6KKq3iMu3DbrQ3Q2GzthhAPAlURfxXYDDQrqSXoFTF/CtWT7gJx50YihASL
 j6NG/duO812Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 02:11:39 -0700
IronPort-SDR: U/7yDPrLtYunTdbwKyXMOoY4ReiX8XnjIuq37cKWO9ZNo/NOrYfPnk8zA/9ubT3ezfozmivQ8/
 +9xpwGaATDCQ==
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="397440298"
Received: from maytarsh-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.38.121])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 02:11:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: abhinavk@codeaurora.org, Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 16/17] drm: Nuke mode->private_flags
In-Reply-To: <7cd8b081a383125732dbddd32116e46e@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-17-ville.syrjala@linux.intel.com>
 <7cd8b081a383125732dbddd32116e46e@codeaurora.org>
Date: Mon, 06 Apr 2020 12:11:32 +0300
Message-ID: <87r1x1kmgr.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, jeykumar@quicinc.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 nganji@quicinc.com, pdhaval@quicinc.com, sean@poorly.run, aravindh@quicinc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 03 Apr 2020, abhinavk@codeaurora.org wrote:
> Hi Ville
>
> Thanks for the patch.
>
> Our understanding of private_flags was that we can use it within our 
> drivers to handle vendor specific features.
> Hence we do have several features in our downstream drivers as well as 
> some planned work based on this.
>
> This was the only method to pass around and consume the driver only 
> information which we have been using.
>
> In the current qualcomm upstream display drivers, the only usage of the 
> mode->private_flags is what you have removed in 
> https://patchwork.kernel.org/patch/11473497/.
>
> However, for other projects which do not use upstream drivers yet, we 
> have several features already which are using the mode->private_flags.
>
> We do have a plan to remove the usage of mode->private_flags for those 
> drivers as well but its not ready yet.
>
> These downstream drivers still use the upstream drm files for 
> compilation.
>
> So how it works is we use all the headers under include/drm and also the 
> files under drivers/gpu/drm as-it-is from upstream but maintain our 
> drivers on top of this.
>
> Removing this will result in compilation failures for us in the near 
> term.
>
> Can we keep this one as-it-is and when our changes are ready to post it 
> upstream we shall remove private_flags from the drm_modes.h

If your driver were upstream, Ville would have fixed it in the process
of removing private_flags. It would be part of this patch series. That
is the only guarantee you get for kernel internal APIs, and you only get
that guarantee for drivers in the upstream kernel. Otherwise, all bets
are off.

Taking all the upstream considerations into account is complicated
enough. It is simply not reasonable to hold back internal kernel changes
due to out-of-tree or downstream drivers. I know it is painful, but
that's the cost of maintaining a driver out-of-tree.

Sorry, but no. Further reading [1].


BR,
Jani.


[1] https://www.kernel.org/doc/html/latest/process/stable-api-nonsense.html


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
