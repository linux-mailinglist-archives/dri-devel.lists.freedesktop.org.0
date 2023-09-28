Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E27B15F8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACD810E5E9;
	Thu, 28 Sep 2023 08:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166DA10E5E9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695889443; x=1727425443;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TyMgPO9xKuZX9+DtwK+jLszO2vVv48pm1cqLQAEdhB0=;
 b=Gz7+9n2Dwh2z/dMV3MkKQ4UxqPMTtLOGJy4IQ7O+ez0KTRFLz6bFocUH
 PetzBmFhBo3vyos9kr+q5AkyKu1KPnjkk1eZll2l1s8B0lxOhCEqiLa10
 lvdfCBCJcCXCaAqxUiu0MSEVzioR4JWiDbdNt23in+Z0gpfG2CuG4RYET
 mhrZ/z3RIzPiKtM/dRzkJ8QqtBCI84LNCVMd1zPojVnrYyLH1Mb6wgc3J
 Y/rm1R55gFVK/9GXnRHeOPmGZaboBXBkoyuhXKdJGqvPFLwy5qExuV40U
 1tOpke3eO8A+RPZimHvdvvAgvUy4BVnmbo38jeqMvLm7uzHCCFwXw5nep Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384809750"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="384809750"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 01:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="778823641"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="778823641"
Received: from vrohpcvpnmu01.ger.corp.intel.com (HELO localhost)
 ([10.252.54.82])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 01:23:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ramya SR <rsr@qti.qualcomm.com>, Alex Deucher <alexdeucher@gmail.com>,
 "imre.deak@intel.com" <imre.deak@intel.com>
Subject: RE: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
In-Reply-To: <BN0PR02MB7951FFEB16011D2B1D3DA75181C1A@BN0PR02MB7951.namprd02.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
 <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
 <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
 <CADnq5_NQnQoheKv39DiuLjKY3Z83WpesrFRUO4FMdrn=YPhnSQ@mail.gmail.com>
 <BN0PR02MB79517B267D593DC484BA34DF81C3A@BN0PR02MB7951.namprd02.prod.outlook.com>
 <BN0PR02MB7951FFEB16011D2B1D3DA75181C1A@BN0PR02MB7951.namprd02.prod.outlook.com>
Date: Thu, 28 Sep 2023 11:23:56 +0300
Message-ID: <877coak8o3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Ramya SR \(QUIC\)" <quic_rsr@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Sep 2023, Ramya SR <rsr@qti.qualcomm.com> wrote:
> Reminder. Please review the reply comment.

Maybe send a patch to review?

It's also not helping that your previous mail looks like it's just
quoting other messages [1].


BR,
Jani.


[1] https://lore.kernel.org/all/BN0PR02MB79517B267D593DC484BA34DF81C3A@BN0P=
R02MB7951.namprd02.prod.outlook.com/


>
> Thanks and Regards,
> Ramya SR
>
> -----Original Message-----
> From: Ramya SR=20
> Sent: Tuesday, September 26, 2023 4:12 PM
> To: Alex Deucher <alexdeucher@gmail.com>; imre.deak@intel.com
> Cc: Lyude Paul <lyude@redhat.com>; Jani Nikula <jani.nikula@intel.com>; J=
eff Layton <jlayton@kernel.org>; linux-kernel@vger.kernel.org; dri-devel@li=
sts.freedesktop.org; Wayne Lin <Wayne.Lin@amd.com>; Alex Deucher <alexander=
.deucher@amd.com>; Ramya SR (QUIC) <quic_rsr@quicinc.com>
> Subject: RE: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST po=
rt detect
>
>
>
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Monday, September 25, 2023 8:27 PM
> To: imre.deak@intel.com
> Cc: Lyude Paul <lyude@redhat.com>; Jani Nikula <jani.nikula@intel.com>; J=
eff Layton <jlayton@kernel.org>; linux-kernel@vger.kernel.org; dri-devel@li=
sts.freedesktop.org; Wayne Lin <Wayne.Lin@amd.com>; Alex Deucher <alexander=
.deucher@amd.com>; Ramya SR (QUIC) <quic_rsr@quicinc.com>
> Subject: Re: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST po=
rt detect
>
> WARNING: This email originated from outside of Qualcomm. Please be wary o=
f any links or attachments, and do not enable macros.
>
> On Fri, Sep 22, 2023 at 3:22=E2=80=AFPM Imre Deak <imre.deak@intel.com> w=
rote:
>>
>> On Fri, Sep 22, 2023 at 03:02:23PM -0400, Lyude Paul wrote:
>> >
>> > Oh! wow thank you for catching this:
>> >
>> > Reviewed-by: Lyude Paul <lyude@redhat.com>
>> >
>> > I will go and push this to drm-misc-next in just a moment
>> >
>> > On Fri, 2023-09-15 at 10:24 +0530, Ramya SR wrote:
>> > > Modeset mutex unlock is missing in drm_dp_mst_detect_port function.
>> > > This will lead to deadlock if calling the function multiple times=20
>> > > in an atomic operation, for example, getting imultiple MST ports=20
>> > > status for a DP MST bonding scenario.
>> > >
>> > > Signed-off-by: Ramya SR <quic_rsr@quicinc.com>
>> > > ---
>> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
>> > >  1 file changed, 3 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > > index ed96cfc..d6512c4 100644
>> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > > @@ -4154,7 +4154,7 @@ drm_dp_mst_detect_port(struct drm_connector=20
>> > > *connector,
>> > >
>> > >     ret =3D drm_modeset_lock(&mgr->base.lock, ctx);
>> > >     if (ret)
>> > > -           goto out;
>> > > +           goto fail;
>> > >
>> > >     ret =3D connector_status_disconnected;
>> > >
>> > > @@ -4181,6 +4181,8 @@ drm_dp_mst_detect_port(struct drm_connector *c=
onnector,
>> > >             break;
>> > >     }
>> > >  out:
>> > > +   drm_modeset_unlock(&mgr->base.lock);
>>
>> Isn't this supposed to be unlocked only by
>> drm_helper_probe_detect_ctx() / drm_helper_probe_detect() ?
>
> Maybe adding a comment to that effect would be helpful for the future.
>
> Alex
>
>>this is different lock, above function mentioned is locking/unlocking the=
 global connection_mutex, that is required always locked during the atomic =
>check/commit. Here we are talking about MST topology manager mutex "mgr->b=
ase.lock".
>
>>For normal non-bond MST, it's ok, the calling sequence for detecting=20
>>MST connector status is  dp_mst_connector_detect=20
>>->mst->mst_fw_cbs->detect_port_ctx =3D dp_mst_detect_port=20
>>->drm_dp_mst_detect_port (where mgr->base.lock is locked)
>
>> Then for the bond MST case, to figure out if the sibling connectors=20
>> are also connected, so that the bonding is possible, we need detect=20
>> two or more connectors >in single dp_mst_connector_detect call
>
>>dp_mst_connector_detect ->mst->mst_fw_cbs->detect_port_ctx =3D=20
>>dp_mst_detect_port ->drm_dp_mst_detect_port (where mgr->base.lock is=20
>>locked) dp_mst_find_sibling_connector=20
>>->mst->mst_fw_cbs->detect_port_ctx =3D dp_mst_detect_port=20
>>->drm_dp_mst_detect_port (blocked by mgr->base.lock)
>
>>
>> > > +fail:
>> > >     drm_dp_mst_topology_put_port(port);
>> > >     return ret;
>> > >  }
>> >
>> > --
>> > Cheers,
>> >  Lyude Paul (she/her)
>> >  Software Engineer at Red Hat
>> >

--=20
Jani Nikula, Intel
