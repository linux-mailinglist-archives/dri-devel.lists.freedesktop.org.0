Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E392153BDA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 00:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EC26F979;
	Wed,  5 Feb 2020 23:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645FD6F979
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 23:27:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 15:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,407,1574150400"; d="scan'208";a="231865616"
Received: from jmoran2-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.23.5])
 by orsmga003.jf.intel.com with ESMTP; 05 Feb 2020 15:27:27 -0800
Date: Wed, 5 Feb 2020 23:27:26 +0000
From: Eric Engestrom <eric.engestrom@intel.com>
To: "Li, Juston" <juston.li@intel.com>
Subject: Re: [PATCH v4 libdrm 2/2] Add drmModeGetFB2
Message-ID: <20200205232726.eoiiije62mdzv6tu@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
References: <20200131214109.6323-1-juston.li@intel.com>
 <20200131214109.6323-2-juston.li@intel.com>
 <20200205222553.xi6uv43a4hfgleqi@intel.com>
 <e7726590ddb5c8007f3d146a7182927d8b0d0050.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7726590ddb5c8007f3d146a7182927d8b0d0050.camel@intel.com>
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
Cc: "daniels@collabora.com" <daniels@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 2020-02-05 23:10:21 +0000, Li, Juston wrote:
> On Wed, 2020-02-05 at 22:25 +0000, Eric Engestrom wrote:
> > On Friday, 2020-01-31 13:41:09 -0800, Juston Li wrote:
> > > From: Daniel Stone <daniels@collabora.com>
> > >
> > > Add a wrapper around the getfb2 ioctl, which returns extended
> > > framebuffer information mirroring addfb2, including multiple planes
> > > and
> > > modifiers.
> > >
> > > Changes since v3:
> > >  - remove unnecessary null check in drmModeFreeFB2 (Daniel Stone)
> > >
> > > Changes since v2:
> > >  - getfb2 ioctl has been merged upstream
> > >  - sync include/drm/drm.h in a seperate patch
> > >
> > > Changes since v1:
> > >  - functions should be drm_public
> > >  - modifier should be 64 bits
> > >  - update ioctl number
> > >
> > > Signed-off-by: Juston Li <juston.li@intel.com>
> > > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > > ---
> > >  xf86drmMode.c | 36 ++++++++++++++++++++++++++++++++++++
> > >  xf86drmMode.h | 15 +++++++++++++++
> > >  2 files changed, 51 insertions(+)
> > >
> > > diff --git a/xf86drmMode.c b/xf86drmMode.c
> > > index 0cf7992c6e9a..94dc8ce38a5e 100644
> > > --- a/xf86drmMode.c
> > > +++ b/xf86drmMode.c
> > > @@ -1594,3 +1594,39 @@ drmModeRevokeLease(int fd, uint32_t
> > > lessee_id)
> > >  return 0;
> > >  return -errno;
> > >  }
> > > +
> > > +drm_public drmModeFB2Ptr
> > > +drmModeGetFB2(int fd, uint32_t fb_id)
> > > +{
> > > +struct drm_mode_fb_cmd2 get;
> > > +drmModeFB2Ptr ret;
> > > +int err;
> > > +
> > > +memclear(get);
> > > +get.fb_id = fb_id;
> >
> > As mentioned on IRC, could you write it like this instead?
> >
> > struct drm_mode_fb_cmd2 get = {
> > .fb_id = fb_id,
> > };
> >
> > With that, consider this patch
> > Reviewed-by: Eric Engestrom <eric@engestrom.ch>
> 
> Opps I sent v5 before seeing this but my code style differs and is
> probably incorrect :) I'll send v6 with the style corrected.
> 
> Thanks for reviewing!

Ah, sorry about that, our emails crossed paths.

As for the other patch (I mean 1/2), did you follow the instructions in
include/drm/README, specifically the section titled "When and how to
update these files" ?
Your commit message makes it look like you just applied that one change
instead of syncing with `make headers_install`.

Cheers,
  Eric
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
