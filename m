Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169FC1E110E
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAFF89F45;
	Mon, 25 May 2020 14:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6893E89F45
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:56:18 +0000 (UTC)
IronPort-SDR: Pda6hFGe/GIR2dZRfwM0smBPGdYi2s+fAPXL+ghilINa3eRqdlD2T3kDo/KoqmOntnGbk89i8/
 qa+6xPEEdNlQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 07:56:17 -0700
IronPort-SDR: B44q6ENq+sjvMZghAEYZYCb1gmzAhhgnKk5yUhY1iwnBYuji80kJ0EylSOFOIiIA5FZ/dCYkla
 HnHpoRegjUPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="310021532"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 25 May 2020 07:56:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 25 May 2020 17:56:14 +0300
Date: Mon, 25 May 2020 17:56:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: chenxb_99091@126.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: fix setting of plane_mask in pan_display_atomic()
 function for linux-4.4
Message-ID: <20200525145614.GB6112@intel.com>
References: <1590205747-19599-1-git-send-email-chenxb_99091@126.com>
 <20200525143428.GG206103@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525143428.GG206103@phenom.ffwll.local>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 04:34:28PM +0200, Daniel Vetter wrote:
> On Sat, May 23, 2020 at 11:49:07AM +0800, chenxb_99091@126.com wrote:
> > From: Xuebing Chen <chenxb_99091@126.com>
> > =

> > The <include/drm/drm_crtc.h> provides drm_for_each_plane_mask macro and
> > plane_mask is defined as bitmask of plane indices, such as
> > 1<<drm_plane_index(plane). This patch fixes error setting of plane_mask
> > in pan_display_atomic() function.
> > =

> > Signed-off-by: Xuebing Chen <chenxb_99091@126.com>
> =

> What kernel is this patch against? Latest upstream doesn't have any such
> code anymore ... I'm assuming that Ville fixed this in one of his patches,
> but I can't find the right one just now.

Looks to be gone in
commit e00fb8564ee9 ("drm: Stop updating plane->crtc/fb/old_fb on
atomic drivers"), in 2018.

Also seems this 1<< bug was already fixed in
commit 7118fd9bd975 ("drm/fb-helper: Use proper plane mask for fb
cleanup") ... in 2015!

Might be a good idea to invest in an upgrade if you're still using
such old kernel releases.

> -Daniel
> =

> > ---
> >  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> > index e449f22..6a9f7ee 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -1256,7 +1256,7 @@ retry:
> >  			goto fail;
> >  =

> >  		plane =3D mode_set->crtc->primary;
> > -		plane_mask |=3D drm_plane_index(plane);
> > +		plane_mask |=3D 1 << drm_plane_index(plane);
> >  		plane->old_fb =3D plane->fb;
> >  	}
> >  =

> > -- =

> > 2.7.4
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
