Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4719706F
	for <lists+dri-devel@lfdr.de>; Sun, 29 Mar 2020 23:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5AA89DFE;
	Sun, 29 Mar 2020 21:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E0B89DFE
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 21:05:10 +0000 (UTC)
IronPort-SDR: eDK8oDXHZ8DnQQyMx1LJAixszofwyqm8nEO7GT4jcX1s8VhkfSE3UWN6zndWOXM++viGrT5+U8
 w+BRwgHTxIbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2020 14:05:10 -0700
IronPort-SDR: eTz+lnqaMCuevlYdcGYkjANmaTlKolvQXHI0BHh681ykRC9KizfVDKKLvvHiUbtzwMTvRBaorL
 C7x3jNLHfJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,321,1580803200"; d="scan'208";a="266746453"
Received: from shahidmo-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.134.40.232])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2020 14:05:08 -0700
Date: Sun, 29 Mar 2020 23:05:07 +0200
From: Eric Engestrom <eric.engestrom@intel.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH libdrm] meson.build: Don't detect <sys/sysctl.h> header
 for linux
Message-ID: <20200329210507.rgthhxyrawupswmu@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
References: <1578562330-25594-1-git-send-email-sw0312.kim@samsung.com>
 <1578630641-5301-1-git-send-email-sw0312.kim@samsung.com>
 <20200129095313.3uhaqa6ada2jpaie@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129095313.3uhaqa6ada2jpaie@intel.com>
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
Cc: zeising@daemonic.se, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 2020-01-29 09:53:16 +0000, Eric Engestrom wrote:
> On Friday, 2020-01-10 13:30:41 +0900, Seung-Woo Kim wrote:
> > The <sys/sysctl.h> header is not required for Linux and GNU libc
> > 2.30 starts to warn about Linux specific <sys/sysctl.h> header
> > deprecation. Don't detect <sys/sysctl.h> header for linux.
> > 
> > Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> > ---
> > Fix meson.build script instead of code itself as commented below:
> > https://patchwork.kernel.org/patch/11325345/
> > ---
> >  meson.build |   15 +++++++++++----
> >  1 files changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meson.build b/meson.build
> > index 782b1a3..b1c557a 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -183,10 +183,17 @@ else
> >    dep_rt = []
> >  endif
> >  dep_m = cc.find_library('m', required : false)
> > -# From Niclas Zeising:
> > -# FreeBSD requires sys/types.h for sys/sysctl.h, add it as part of the
> > -# includes when checking for headers.
> > -foreach header : ['sys/sysctl.h', 'sys/select.h', 'alloca.h']
> > +if not ['linux'].contains(host_machine.system())
> > +  # From Niclas Zeising:
> > +  # FreeBSD requires sys/types.h for sys/sysctl.h, add it as part of the
> > +  # includes when checking for headers.
> > +  foreach header : ['sys/sysctl.h']
> > +    config.set('HAVE_' + header.underscorify().to_upper(),
> > +      cc.compiles('#include <sys/types.h>\n#include <@0@>'.format(header), name : '@0@ works'.format(header)))
> > +  endforeach
> > +endif
> > +endforeach
> 
> Stray `endforeach`.
> 
> Could you post your patch as a Merge Request [1] instead of on the mailing list?
> The automatic testing there means it would instantly catch mistakes like these :)
> 
> [1] https://gitlab.freedesktop.org/mesa/drm/merge_requests
> 
> > +foreach header : ['sys/select.h', 'alloca.h']
> >    config.set('HAVE_' + header.underscorify().to_upper(),
> >      cc.compiles('#include <sys/types.h>\n#include <@0@>'.format(header), name : '@0@ works'.format(header)))
> 
> Can you drop the `#include <sys/types.h>\n` now that sys/sysctl.h is
> being split out?
> 
> Note that since https://gitlab.freedesktop.org/mesa/drm/merge_requests/8
> we now use config.set10(), which means you'll need to refactor a tiny
> bit (move the !linux condition inside the config.set10() call).
> 
> The new code block should look like this:
> 
>   # From Niclas Zeising:
>   # FreeBSD requires sys/types.h for sys/sysctl.h, add it as part of the
>   # includes when checking for headers.
>   foreach header : ['sys/sysctl.h']
>     config.set10('HAVE_' + header.underscorify().to_upper(),
>        not ['linux'].contains(host_machine.system()) and
>        cc.compiles('#include <sys/types.h>\n#include <@0@>'.format(header), name : '@0@ works'.format(header)))
>   endforeach

FYI, I have posted a variant of the above as a merge request:
https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/53
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
