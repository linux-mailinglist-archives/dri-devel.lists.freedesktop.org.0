Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05718663981
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 07:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2841C10E542;
	Tue, 10 Jan 2023 06:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706D110E541;
 Tue, 10 Jan 2023 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673333418; bh=3KaCdpCLhRbvvNI0DI23jFXuIUWpZ5VYOO2VZGDg4LA=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=UthIZuQsGBWU3ZoNHYDt3YRD3Je6JMr352tXPWTRrfrMHElR5kpF830/41B8x8M8l
 MJ0twekvggE+Ooe0MlIB7SXgYJnwxDA1/2IdHXantDyxIjrgQMZ8PNFYm3EaAf2Hau
 GfrEZjnHyhHGG1u4u1/urU99hDKUvkSD53U+E61I=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Tue, 10 Jan 2023 07:50:18 +0100 (CET)
X-EA-Auth: sY7JOkE2geYQPQNYTsUXSW5mVARRXg5Tda5wKW6gPAGmTE9v5gbkig2Bl1SRnXRzlUiEnqh7MwmdKhO8vsxKornoLTl8b/ng
Date: Tue, 10 Jan 2023 12:20:13 +0530
From: Deepak R Varma <drv@mailo.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/fbc: Avoid full proxy f_ops for FBC debug
 attributes
Message-ID: <Y70Kpcpueh2Zzm1x@ubun2204.myguest.virtualbox.org>
References: <Y6qmNW6cOHjGwn03@qemulion> <Y6sn1BmhFJFssW0h@intel.com>
 <Y6s0FSK9+F+/oKSf@qemulion> <Y6wl9NhYZG5RjJL7@intel.com>
 <Y7PG5Hx5dDE7aHSx@qemulion>
 <alpine.DEB.2.22.394.2301041850570.7216@hadrien>
 <Y7XABJ9MWCWO5IUA@intel.com>
 <991ac2b4-f458-f6f2-f494-648ed61efcff@inria.fr>
 <Y7nQHfbKNmZ1sRbO@ubun2204.myguest.virtualbox.org>
 <Y7xlpbEDspHaT5Gq@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7xlpbEDspHaT5Gq@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, Julia Lawall <Julia.Lawall@lip6.fr>,
 Nicolai Stange <nicstange@gmail.com>, Deepak R Varma <drv@mailo.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 02:06:13PM -0500, Rodrigo Vivi wrote:
> On Sun, Jan 08, 2023 at 01:33:41AM +0530, Deepak R Varma wrote:
> > On Thu, Jan 05, 2023 at 09:13:35AM +0100, Julia Lawall wrote:
> > > > Hi Julia, thanks for helping here.
> > > >
> > > > So, my question is why this
> > > >
> > > > make coccicheck M=drivers/gpu/drm/i915/ MODE=context COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > >
> > > > didn't catch this chunck:
> > > >
> > > > -		debugfs_create_file("i915_fbc_false_color", 0644, parent,
> > > > -				    fbc, &intel_fbc_debugfs_false_color_fops);
> > > > +		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
> > > > +					   fbc, &intel_fbc_debugfs_false_color_fops);
> > > >
> > > > When I run it it only catches and replaces this:
> > > >
> > > > - DEFINE_SIMPLE_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);
> > > > + DEFINE_DEBUGFS_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);
> > >
> > > There is something strange in your question.  You have MODE=context but
> > > you show the output for MODE=patch.  The rule dcf matches a call to
> > > debugfs_create_file, and the context rule matching DEFINE_SIMPLE_ATTRIBUTE
> > > is only activated if dcf succeeds.  So when the context rule gives a
> > > report, there is always a corresponding call to debugfs_create_file in the
> > > same file, it is just not highlighted.  So the request is that it should
> > > be highlighted as well?
> > 
> > Hello Rodrigo,
> > Not trying to speak for you, but I think Julia's comment appears to be the
> > correct interpretation of your observation. Would you mind confirming/clarifying
> > and suggest next steps for this proposal?
> 
> doh! newby coccinelle user detected! My bad, sorry!
> 
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> do shows everything.
> 
> So, could you please mention this line in the commit message so we don't forget that?
Sure, I will do that.

> 
> Also could you please provide patches for the other cases?
> 1 patch for each file is desirable in this case since it touches different areas.
Sounds good. I will separate patches one per file and send in a series as
appropriate.

Thank you,
./drv

> 
> > 
> > Thank you,
> > ./drv
> > 
> > >
> > > julia
> > >
> > 
> > 


