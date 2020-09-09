Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCF02635C8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 20:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335FF6F47E;
	Wed,  9 Sep 2020 18:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4036F47E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 18:20:16 +0000 (UTC)
IronPort-SDR: 70ir+569DpcKtyvzuNxEgMVyUDG2PJl4a8MRSYUCwxqpHRnWn5Vise6sN6zJUrbNoJeDI1ibNz
 /A4vmtFi7/vQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="146107018"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="146107018"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 11:20:15 -0700
IronPort-SDR: cSPFvWkeYJDKN+Z0GgBxBfjV5HB1QVMzc0QvYXiLFB/PK957/GoRXZ75RkdqM9wRMgBPzP2eWt
 Vhus2SZT4sfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="341655830"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 09 Sep 2020 11:20:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Sep 2020 21:20:10 +0300
Date: Wed, 9 Sep 2020 21:20:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/dp: For MST hub, Get max_link_rate&max_lane from
 extended rx capability field if EXTENDED_RECEIVER_CAPABILITY_FILED_PRESENT
 is set.
Message-ID: <20200909182010.GO6112@intel.com>
References: <20200827053053.11271-1-koba.ko@canonical.com>
 <CAJB-X+WPiUR8N5sLMS2UC-rPHj=TGJy2ezeBPjjeUXzbN5bfcg@mail.gmail.com>
 <b1dcaf433b7ebe2d0284693724f0e7d8a7fa4825.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1dcaf433b7ebe2d0284693724f0e7d8a7fa4825.camel@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anthony Wong <anthony.wong@canonical.com>, Koba Ko <koba.ko@canonical.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 09, 2020 at 12:33:09PM -0400, Lyude Paul wrote:
> We just added a new helper for DPCD retrieval to drm_dp_helper.c (which a=
lso
> handles grabbing the extended receiver caps), we should probably make use=
 of
> it here =


Someone should really rework this whole thing so that the driver can
pass in the link rate+lane count when setting up the link. There's no
reason to assume that the source device capabilities match or exceed
the MST device caps. It would also allow the driver the dynamically
adjust these in response to link failures.

> On Wed, 2020-09-09 at 14:31 +0800, Koba Ko wrote:
> > On Thu, Aug 27, 2020 at 1:30 PM Koba Ko <koba.ko@canonical.com> wrote:
> > > Currently, DRM get the capability of the mst hub only from DP_DPCD_RE=
V and
> > > get the slower speed even the mst hub can run in the faster speed.
> > > =

> > > As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> > > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1, read the DP_DP13_DPCD=
_REV
> > > to
> > > get the faster capability.
> > > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0, read DP_DPCD_REV.
> > > =

> > > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index 67dd72ea200e..3b84c6801281 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -3497,6 +3497,8 @@ static int drm_dp_get_vc_payload_bw(u8 dp_link_=
bw,
> > > u8  dp_link_count)
> > >  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *=
mgr,
> > > bool mst_state)
> > >  {
> > >         int ret =3D 0;
> > > +       u8 dpcd_ext =3D 0;
> > > +       unsigned int dpcd_offset =3D 0;
> > >         struct drm_dp_mst_branch *mstb =3D NULL;
> > > =

> > >         mutex_lock(&mgr->payload_lock);
> > > @@ -3510,9 +3512,15 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > > drm_dp_mst_topology_mgr *mgr, bool ms
> > >                 struct drm_dp_payload reset_pay;
> > > =

> > >                 WARN_ON(mgr->mst_primary);
> > > +               drm_dp_dpcd_read(mgr->aux,
> > > +                                DP_TRAINING_AUX_RD_INTERVAL,
> > > +                                &dpcd_ext, sizeof(dpcd_ext));
> > > +
> > > +               dpcd_offset =3D
> > > +                       ((dpcd_ext &
> > > DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT) ?  DP_DP13_DPCD_REV :
> > > DP_DPCD_REV);
> > > =

> > >                 /* get dpcd info */
> > > -               ret =3D drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->=
dpcd,
> > > DP_RECEIVER_CAP_SIZE);
> > > +               ret =3D drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->=
dpcd,
> > > DP_RECEIVER_CAP_SIZE);
> > >                 if (ret !=3D DP_RECEIVER_CAP_SIZE) {
> > >                         DRM_DEBUG_KMS("failed to read DPCD\n");
> > >                         goto out_unlock;
> > > --
> > > 2.25.1
> > > =

> > Add Lyude Paul
> > =

> -- =

> Cheers,
> 	Lyude Paul (she/her)
> 	Software Engineer at Red Hat
> =

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
