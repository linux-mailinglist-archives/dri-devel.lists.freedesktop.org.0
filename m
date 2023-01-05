Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CCC65E679
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 09:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB27610E6C1;
	Thu,  5 Jan 2023 08:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3C310E6C1;
 Thu,  5 Jan 2023 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=fzV0HKTUGAzAK8YFWAsxGc2YnLeue6G6Fo1KiDz9FnA=;
 b=M1m68CEYHog5YQ/a9PchNLN0AlK8Zpc3DIEZYEhBgFGGI364c0m+3acX
 DtKG3ZTaM4up9xYAGM6WRlp9tw6igobXQJBcg0vtt0MzCpSskx0frIbSf
 F6z1g4j6bPVOrf8rZjzGYeCibHT6Y8beld2quKQiwo8OY+5LnjNTWf5pL I=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.96,302,1665439200"; d="scan'208";a="86036273"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 09:13:35 +0100
Date: Thu, 5 Jan 2023 09:13:35 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/fbc: Avoid full proxy f_ops for FBC debug
 attributes
In-Reply-To: <Y7XABJ9MWCWO5IUA@intel.com>
Message-ID: <991ac2b4-f458-f6f2-f494-648ed61efcff@inria.fr>
References: <Y6qmNW6cOHjGwn03@qemulion> <Y6sn1BmhFJFssW0h@intel.com>
 <Y6s0FSK9+F+/oKSf@qemulion> <Y6wl9NhYZG5RjJL7@intel.com>
 <Y7PG5Hx5dDE7aHSx@qemulion> <alpine.DEB.2.22.394.2301041850570.7216@hadrien>
 <Y7XABJ9MWCWO5IUA@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Saurabh Singh Sengar <ssengar@microsoft.com>, Deepak R Varma <drv@mailo.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@lip6.fr>, Nicolai Stange <nicstange@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hi Julia, thanks for helping here.
>
> So, my question is why this
>
> make coccicheck M=drivers/gpu/drm/i915/ MODE=context COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
>
> didn't catch this chunck:
>
> -		debugfs_create_file("i915_fbc_false_color", 0644, parent,
> -				    fbc, &intel_fbc_debugfs_false_color_fops);
> +		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
> +					   fbc, &intel_fbc_debugfs_false_color_fops);
>
> When I run it it only catches and replaces this:
>
> - DEFINE_SIMPLE_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);
> + DEFINE_DEBUGFS_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);

There is something strange in your question.  You have MODE=context but
you show the output for MODE=patch.  The rule dcf matches a call to
debugfs_create_file, and the context rule matching DEFINE_SIMPLE_ATTRIBUTE
is only activated if dcf succeeds.  So when the context rule gives a
report, there is always a corresponding call to debugfs_create_file in the
same file, it is just not highlighted.  So the request is that it should
be highlighted as well?

julia

>
> But looking to the .cocci script or at least to its description,
> I believe it should catch both cases.
>
> But if it is not a bug in the cocci script, then I'd like to hear
> from Nicolai why. And have this documented in the script.
>
> Thanks,
> Rodrigo.
>
> >
> > julia
> >
> >
> > >
> > > Thank you,
> > > ./drv
> > >
> > > >
> > > > >
> > > > > >
> > > > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > (to both patches, this and the drrs one.
> > > > > >
> > > > > > Also, it looks like you could contribute with other 2 patches:
> > > > > > drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c:64:0-23: WARNING: pxp_terminate_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> > > > > > drivers/gpu/drm/i915/gvt/debugfs.c:150:0-23: WARNING: vgpu_scan_nonprivbb_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> > > > >
> > > > > Yes, these are on my list. Was waiting for a feedback on the first submission
> > > > > before I send more similar patches.
> > > > >
> > > > > Appreciate your time and the feedback.
> > > > >
> > > > >
> > > > > Regards,
> > > > > ./drv
> > > > >
> > > > > >
> > > > > > >
> > > > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/i915/display/intel_fbc.c | 12 ++++++------
> > > > > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > > > > > index b5ee5ea0d010..4b481e2f908b 100644
> > > > > > > --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> > > > > > > +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > > > > > @@ -1809,10 +1809,10 @@ static int intel_fbc_debugfs_false_color_set(void *data, u64 val)
> > > > > > >  	return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > -DEFINE_SIMPLE_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> > > > > > > -			intel_fbc_debugfs_false_color_get,
> > > > > > > -			intel_fbc_debugfs_false_color_set,
> > > > > > > -			"%llu\n");
> > > > > > > +DEFINE_DEBUGFS_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> > > > > > > +			 intel_fbc_debugfs_false_color_get,
> > > > > > > +			 intel_fbc_debugfs_false_color_set,
> > > > > > > +			 "%llu\n");
> > > > > > >
> > > > > > >  static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
> > > > > > >  				  struct dentry *parent)
> > > > > > > @@ -1821,8 +1821,8 @@ static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
> > > > > > >  			    fbc, &intel_fbc_debugfs_status_fops);
> > > > > > >
> > > > > > >  	if (fbc->funcs->set_false_color)
> > > > > > > -		debugfs_create_file("i915_fbc_false_color", 0644, parent,
> > > > > > > -				    fbc, &intel_fbc_debugfs_false_color_fops);
> > > > > > > +		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
> > > > > > > +					   fbc, &intel_fbc_debugfs_false_color_fops);
> > > > > > >  }
> > > > > > >
> > > > > > >  void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc)
> > > > > > > --
> > > > > > > 2.34.1
> > > > > > >
> > > > > > >
> > > > > > >
> > > > >
> > > > >
> > > >
> > >
> > >
> > >
>
