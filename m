Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F38931DF1A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 19:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC3F6E9A2;
	Wed, 17 Feb 2021 18:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8059B6E5BB;
 Wed, 17 Feb 2021 18:27:58 +0000 (UTC)
IronPort-SDR: Mbs4/YGs4gCMFDJyLgBxpHRDXZmhJ3zQJ1AaT21Sm6/5lFL2Z4QMi76rWQVMhAIowCz1FO4dj9
 iKglafC3X3NQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="202509624"
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="202509624"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 10:27:58 -0800
IronPort-SDR: l67wVA0rwp9jRDOMJqK74CFXHgMsPPjBbUpNwcN920dqNzFHJ677cdRarX2qrEZshBFetg+oPV
 9YmlbYkNiXcg==
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="400078128"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 10:27:56 -0800
Date: Wed, 17 Feb 2021 20:27:53 +0200
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Tune down the WARN modesetting a port with
 full_pbn=0
Message-ID: <20210217182753.GA557342@ideak-desk.fi.intel.com>
References: <20210216123448.410545-1-imre.deak@intel.com>
 <d070b8fa29ee357eae1943e7d3ede6c7b9a92a40.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d070b8fa29ee357eae1943e7d3ede6c7b9a92a40.camel@redhat.com>
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 17, 2021 at 01:07:11PM -0500, Lyude Paul wrote:
> On Tue, 2021-02-16 at 14:34 +0200, Imre Deak wrote:
> > It's possible to modeset a connector/mst port that has a 0 full_pbn
> > value: if the sink on the port deasserts its HPD and a branch device
> > reports this via a CSN with the port's ddps=3D0 and pdt!=3DNONE the dri=
ver
> > clears full_pbn, but the corresponding connector can be still
> > modesetted.
> > =

> > This happened on a DELL U2719D monitor as the branch device and an LG
> > 27UL650-W daisy-chained to it, the LG monitor generating a long HPD
> > pulse (doing this for some reason always when waking up from some power
> > saving state).
> > =

> > Tune down the WARN about this scenario to a debug message.
> > =

> > References: https://gitlab.freedesktop.org/drm/intel/-/issues/1917
> > Cc: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> > =A0drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++++---
> > =A01 file changed, 7 insertions(+), 3 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 0a54506c27738..dcaf4bf9b62f6 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -5118,11 +5118,15 @@ drm_dp_mst_atomic_check_port_bw_limit(struct
> > drm_dp_mst_port *port,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (!found)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return 0;
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* This should never happ=
en, as it means we tried to
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * set a mode before quer=
ying the full_pbn
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/*
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * This could happen if t=
he sink deasserted its HPD line, but
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * the branch device stil=
l reports it as attached (PDT !=3D NONE).
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (WARN_ON(!port->full_p=
bn))
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (!port->full_pbn) {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0d=
rm_dbg_kms(port->mgr->dev, "[MSTB:%p] [MST PORT:%p] no BW available for the=
 port\n",
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 port->parent, port);
> =

> Shouldn't this use the atomic debugging level? With that fixed, this is:
> =

> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks, yes mixed up the debug level, will fix that.

> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return -EINVAL;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pbn_used =3D vcpi->pbn;
> > =A0=A0=A0=A0=A0=A0=A0=A0} else {
> =

> -- =

> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>    =

> Note: I deal with a lot of emails and have a lot of bugs on my plate. If =
you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email t=
o check
> on my status. I don't bite!
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
