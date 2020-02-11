Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0AD158E58
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 13:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED6E8996F;
	Tue, 11 Feb 2020 12:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9618996F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 12:21:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 04:21:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="227485560"
Received: from dlubczyn-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.14.202])
 by fmsmga008.fm.intel.com with ESMTP; 11 Feb 2020 04:21:40 -0800
Date: Tue, 11 Feb 2020 12:21:39 +0000
From: Eric Engestrom <eric.engestrom@intel.com>
To: "Li, Juston" <juston.li@intel.com>
Subject: Re: [PATCH v4 libdrm 2/2] Add drmModeGetFB2
Message-ID: <20200211122139.pcf2xqtpfmgrfbn4@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
References: <20200131214109.6323-1-juston.li@intel.com>
 <20200131214109.6323-2-juston.li@intel.com>
 <20200205222553.xi6uv43a4hfgleqi@intel.com>
 <e7726590ddb5c8007f3d146a7182927d8b0d0050.camel@intel.com>
 <20200205232726.eoiiije62mdzv6tu@intel.com>
 <d3799f09639f763f548ba7fdbdea604c2c29e7f7.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3799f09639f763f548ba7fdbdea604c2c29e7f7.camel@intel.com>
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
Cc: daniels@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 2020-02-06 17:46:36 +0000, Li, Juston wrote:
> On Wed, 2020-02-05 at 23:27 +0000, Eric Engestrom wrote:
> > On Wednesday, 2020-02-05 23:10:21 +0000, Li, Juston wrote:
> > > On Wed, 2020-02-05 at 22:25 +0000, Eric Engestrom wrote:
> > > > On Friday, 2020-01-31 13:41:09 -0800, Juston Li wrote:
> > > > > From: Daniel Stone <daniels@collabora.com>
> > > > >
> > > > > Add a wrapper around the getfb2 ioctl, which returns extended
> > > > > framebuffer information mirroring addfb2, including multiple
> > > > > planes
> > > > > and
> > > > > modifiers.
> > > > >
> > > > > Changes since v3:
> > > > >  - remove unnecessary null check in drmModeFreeFB2 (Daniel
> > > > > Stone)
> > > > >
> > > > > Changes since v2:
> > > > >  - getfb2 ioctl has been merged upstream
> > > > >  - sync include/drm/drm.h in a seperate patch
> > > > >
> > > > > Changes since v1:
> > > > >  - functions should be drm_public
> > > > >  - modifier should be 64 bits
> > > > >  - update ioctl number
> > > > >
> > > > > Signed-off-by: Juston Li <juston.li@intel.com>
> > > > > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > > > > ---
> > > > >  xf86drmMode.c | 36 ++++++++++++++++++++++++++++++++++++
> > > > >  xf86drmMode.h | 15 +++++++++++++++
> > > > >  2 files changed, 51 insertions(+)
> > > > >
> > > > > diff --git a/xf86drmMode.c b/xf86drmMode.c
> > > > > index 0cf7992c6e9a..94dc8ce38a5e 100644
> > > > > --- a/xf86drmMode.c
> > > > > +++ b/xf86drmMode.c
> > > > > @@ -1594,3 +1594,39 @@ drmModeRevokeLease(int fd, uint32_t
> > > > > lessee_id)
> > > > >  return 0;
> > > > >  return -errno;
> > > > >  }
> > > > > +
> > > > > +drm_public drmModeFB2Ptr
> > > > > +drmModeGetFB2(int fd, uint32_t fb_id)
> > > > > +{
> > > > > +struct drm_mode_fb_cmd2 get;
> > > > > +drmModeFB2Ptr ret;
> > > > > +int err;
> > > > > +
> > > > > +memclear(get);
> > > > > +get.fb_id = fb_id;
> > > >
> > > > As mentioned on IRC, could you write it like this instead?
> > > >
> > > > struct drm_mode_fb_cmd2 get = {
> > > > .fb_id = fb_id,
> > > > };
> > > >
> > > > With that, consider this patch
> > > > Reviewed-by: Eric Engestrom <eric@engestrom.ch>
> > >
> > > Opps I sent v5 before seeing this but my code style differs and is
> > > probably incorrect :) I'll send v6 with the style corrected.
> > >
> > > Thanks for reviewing!
> >
> > Ah, sorry about that, our emails crossed paths.
> >
> > As for the other patch (I mean 1/2), did you follow the instructions
> > in
> > include/drm/README, specifically the section titled "When and how to
> > update these files" ?
> > Your commit message makes it look like you just applied that one
> > change
> > instead of syncing with `make headers_install`.
> >
> > Cheers,
> >   Eric
> 
> Yes, drm.h was copied from 'make headers_install' from drm-misc-next.
> It had been updated fairly recently so GETFB2 is the only delta.
> 
> Sorry, I didn't see the README so the commit message isn't exactly as
> requested.

I kind of expected that this was the case :)

All good then, with the commit message adjusted to make this clear,
patch 1 is:
Acked-by: Eric Engestrom <eric@engestrom.ch>

> 
> 
> Also, only drm.h was synced, is that preferred or would it be better to
> sync the entire header directory?

Usually people either update their driver's header and core, or just core,
so this is fine :)

I assume DanielS will merge this for you?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
