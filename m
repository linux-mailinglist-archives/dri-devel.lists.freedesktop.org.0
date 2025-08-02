Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE21B18B1C
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 09:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B1810E0A8;
	Sat,  2 Aug 2025 07:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YW5RQ5S+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EBD10E0A8;
 Sat,  2 Aug 2025 07:38:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DDD65600B0;
 Sat,  2 Aug 2025 07:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709B1C4CEEF;
 Sat,  2 Aug 2025 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1754120319;
 bh=2vLf14wUZIg7Aa40PWmweWyk77F53nEKWVI/sHXH0+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YW5RQ5S+wS8w8bjrFrrmpEQxWCN1OoX0hrWQ8Qu7vDwfD69rWKN+zZ9Zw54z6T0iR
 SgpOdyyiSJBPC17LUzY6ELofT9SoWXlYJL7G5STU/V/aiAum+1Na5zwc5bF0OwiZuY
 ggfcJRwe/gRSo1kFy1e+PtTHHsbehAnqe93LsyB4=
Date: Sat, 2 Aug 2025 08:38:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Imre Deak <imre.deak@intel.com>
Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>,
 Nicusor Huhulea <nicusor.huhulea@siemens.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "cip-dev@lists.cip-project.org" <cip-dev@lists.cip-project.org>,
 "jouni.hogander@intel.com" <jouni.hogander@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "laurentiu.palcu@oss.nxp.com" <laurentiu.palcu@oss.nxp.com>,
 "cedric.hombourger@siemens.com" <cedric.hombourger@siemens.com>,
 "shrikant.bobade@siemens.com" <shrikant.bobade@siemens.com>
Subject: Re: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and
 build/runtime issues
Message-ID: <2025080225-attach-ravioli-3d3d@gregkh>
References: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
 <aIp6UgiwtDU1Ktmp@ideak-desk>
 <DB3SPRMB000631927D36A721EAE657F3E626A@DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM>
 <aIzcjMgUttb1UpVt@ideak-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIzcjMgUttb1UpVt@ideak-desk>
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

On Fri, Aug 01, 2025 at 06:26:04PM +0300, Imre Deak wrote:
> Hi Greg and Shradha,
> 
> could you please check the comment below about the 4ad8d57d902f backport
> commit in the v6.1.y stable tree and if you agree with the reasoning why
> it has an issue, then suggest a way to resolve it?
> 
> Also, AFAICS, other stable trees are not affected, since the original
> 5abffb66d12bcac commit got only backported to the above v6.1.y tree, but
> please confirm this.
> 
> On Fri, Aug 01, 2025 at 02:37:04PM +0000, nicusor.huhulea@siemens.com wrote:
> > > -----Original Message-----
> > > From: Imre Deak <imre.deak@intel.com>
> > > Sent: Wednesday, July 30, 2025 11:02 PM
> > > To: Nicusor Liviu Huhulea (FT FDS CES LX PBU 1) <nicusor.huhulea@siemens.com>
> > > Cc: stable@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > > intel-gfx@lists.freedesktop.org; cip-dev@lists.cip-project.org;
> > > jouni.hogander@intel.com; neil.armstrong@linaro.org; jani.nikula@linux.intel.com;
> > > maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.de;
> > > airlied@gmail.com; daniel@ffwll.ch; joonas.lahtinen@linux.intel.com;
> > > rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com;
> > > laurentiu.palcu@oss.nxp.com;
> > > Cedric Hombourger (FT FDS CES LX) <cedric.hombourger@siemens.com>;
> > > Shrikant Krishnarao Bobade (FT FDS CES LX PBU 1) <shrikant.bobade@siemens.com>
> > > Subject: Re: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and build/runtime issues
> > > 
> > > Hi Nicusor,
> > > 
> > > thanks for the report and the root causing effort. The patchset itself has a few
> > > issues:
> > > 
> > > - commit cfd48ad8c4a9 ("drm/i915: Fix HPD polling, reenabling the output
> > >   poll work as needed") you backport fixes d33a54e3991d
> > >   ("drm/probe_helper: sort out poll_running vs poll_enabled"), but this
> > >   fixed commit is not part of the 6.1.y stable tree which you are
> > >   targeting.
> > > 
> > >   Similarly commit d33a54e3991d fixes c8268795c9a9 ("drm/probe-helper:
> > >   enable and disable HPD on connectors"), which is not part of 6.1.y
> > >   either.
> > > 
> > >   This means the issue commit cfd48ad8c4a9 is fixing is not present in
> > >   the 6.1.y tree, as the changes introducing that issue are not present
> > >   in that tree either.
> > > 
> > > - The compile errors the patches in your patchset introduce would
> > >   prevent bisection, so fixing up these compile errors only at the end
> > >   of the patchset is not ok; the tree should compile without errors at
> > >   each patch/commit.
> > > 
> > > Looking at v6.1.y and the patchset I suspect the actual issue is the
> > > 
> > > commit 4ad8d57d902f ("drm: Check output polling initialized before
> > > disabling") backport in v6.1.y, which had the
> > > 
> > > -       if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
> > > +       if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
> > > +           !drm_kms_helper_poll || dev->mode_config.poll_running)
> > > 
> > > change, not part of the original
> > > 
> > > commit 5abffb66d12b ("drm: Check output polling initialized before disabling"). i.e.
> > > the original patch didn't add the check for
> > > dev->mode_config.poll_running. So could you try on top of v6.1.147
> > > (w/o the changes in the patchset you posted):
> > > 
> > > diff --git a/drivers/gpu/drm/drm_probe_helper.c
> > > b/drivers/gpu/drm/drm_probe_helper.c
> > > index 0e5eadc6d44d..a515b78f839e 100644
> > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > @@ -250,7 +250,7 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
> > >         unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
> > > 
> > >         if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
> > > -           !drm_kms_helper_poll || dev->mode_config.poll_running)
> > > +           !drm_kms_helper_poll)
> > >                 return;
> > > 
> > >         drm_connector_list_iter_begin(dev, &conn_iter);
> > 
> > Thank you for your thorough explanation, especially regarding the
> > bisecting issue. I hadn't anticipated that by fixing compile errors
> > only at the end of the series, I would make bisection unreliable.
> > 
> > I have tested your idea/fix and it works. HPD polling works reliably
> > on both devices. I can see the polling in logs when display cable is
> > not connected.
> > 
> > Since this fix is mostly your solution, would you prefer to submit
> > yourself, or would you like me to resubmit it as a v2 and credit you
> > appropriately ?
> 
> Thanks again Nicusor for the effort to root cause this and for all the
> tests.
> 
> Greg, Shradha, as described above I think in the 4ad8d57d902f backport
> commit in v6.1.y it was incorrect to add the
> 
> 	dev->mode_config.poll_running
> 
> condition, as the original 5abffb66d12b commit was not the one adding
> this, in that commit that condition was only part of the diff context.
> OTOH, adding the check for this condition causes an issue in the i915
> driver's IRQ storm handling in the v6.1.y stable tree: after
> dev->mode_config.poll_running gets set (during the first connector
> detection in drm_helper_probe_single_connector_modes()), the
> 
> 	drm_kms_helper_poll_enable()
> 
> call in intel_hpd_irq_storm_switch_to_polling() will not any more
> schedule the output_poll_work as expected. Thus after an IRQ storm, the
> HPD IRQs get disabled, but the HPD polling will not run and so the HPD
> detection will not work as Nicusor described above.
> 
> If you agree with the above and the above proposed solution to remove
> the dev->mode_config.poll_running check from the v6.1.y tree, then what
> would be Greg the correct way to do this?

Send whatever fix is needed please.
