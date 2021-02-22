Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AC8321DB8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 18:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132FC898C4;
	Mon, 22 Feb 2021 17:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3436E192
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 17:09:24 +0000 (UTC)
IronPort-SDR: WcXGqcw+4UUPr/19QfeqDi0ZoX0A4rnf2ZnAOm4j1vhVVQmPY0LR6m15ZhO9fkPmGm8uuWI3SQ
 luqxjygRBf1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181075289"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="181075289"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 09:09:23 -0800
IronPort-SDR: UYI7pOe9Ti6xsV+k3UgqhFluHEF2aBqgzG3+W/lVv8zdILt6R50KGVyaxpY835NCtl1WQHDFg+
 Ps+75/XmkjGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="402689444"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 22 Feb 2021 09:09:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 22 Feb 2021 19:09:17 +0200
Date: Mon, 22 Feb 2021 19:09:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Subject: Re: [PATCH 1/2] drm/dp_mst: Revise broadcast msg lct & lcr
Message-ID: <YDPlPRJXVYfPZenQ@intel.com>
References: <20210222040027.23505-1-Wayne.Lin@amd.com>
 <20210222040027.23505-2-Wayne.Lin@amd.com>
 <YDPjiz4tiMRo320Q@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDPjiz4tiMRo320Q@intel.com>
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
Cc: eryk.brol@amd.com, qingqing.zhuo@amd.com, dri-devel@lists.freedesktop.org,
 jerry.zuo@amd.com, stable@vger.kernel.org, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 07:02:03PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Feb 22, 2021 at 12:00:26PM +0800, Wayne Lin wrote:
> > [Why & How]
> > According to DP spec, broadcast message LCT equals to 1 and LCR equals
> > to 6. Current implementation is incorrect. Fix it.
> > =

> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/dr=
m_dp_mst_topology.c
> > index 17dbed0a9800..713ef3b42054 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -2727,8 +2727,14 @@ static int set_hdr_from_dst_qlock(struct drm_dp_=
sideband_msg_hdr *hdr,
> >  	else
> >  		hdr->broadcast =3D 0;
> >  	hdr->path_msg =3D txmsg->path_msg;
> > -	hdr->lct =3D mstb->lct;
> > -	hdr->lcr =3D mstb->lct - 1;
> > +	if (hdr->broadcast) {
> > +		hdr->lct =3D 1;
> > +		hdr->lcr =3D 6;
> > +	} else {
> > +		hdr->lct =3D mstb->lct;
> > +		hdr->lcr =3D mstb->lct - 1;
> > +	}
> > +
> >  	if (mstb->lct > 1)
> >  		memcpy(hdr->rad, mstb->rad, mstb->lct / 2);
> =

> We should also do something about RAD no?

Just skip the RAD stuff by s/mstb->lct/hdr->lct/ here I guess?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
