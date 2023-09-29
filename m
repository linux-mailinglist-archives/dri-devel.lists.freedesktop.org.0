Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1143A7B2DBB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4C810E123;
	Fri, 29 Sep 2023 08:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4302610E123
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695975811; x=1727511811;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/WzEip24W8k3g6aleomP/ErXZzyKZQdSum96OHqR2qA=;
 b=EQe2Nu+yBvbL3Ng4iJwbTfFs/WNv7SsE2OBUiiHlj8R5MMNMm6mfmZRR
 s7czduTe06VaiMjl09HknQmj+H8wBhV/yMOAzIha1rZrOLupuHaRX/9uZ
 /l+DJIdJ8g1lHQPffe02DE3RF0GW6isQWXhEEzt9wYpjCcwqtzLkZd9zf
 VEjaGiFKyUjgcLCziXYR4OHc6MsfpLP2dQhHwGCjZO5I4IyPyTWr3kI8x
 q5CsKlZ2kZmhYcSqVWABkb1o62MmGuoSQe3l4MK1NVYYciZYoLwa1Ykte
 Cmj6LVx55KpAEJB2291bXjWo+iqpKgsA+yToUfIcSzZh3HQOtTjG+MFiY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="385071325"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="385071325"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873585164"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="873585164"
Received: from danielba-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:53:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ramya SR <rsr@qti.qualcomm.com>, Alex Deucher <alexdeucher@gmail.com>,
 "imre.deak@intel.com" <imre.deak@intel.com>
Subject: RE: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
In-Reply-To: <BN0PR02MB79512718F046A8C88BE359F181C0A@BN0PR02MB7951.namprd02.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
 <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
 <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
 <CADnq5_NQnQoheKv39DiuLjKY3Z83WpesrFRUO4FMdrn=YPhnSQ@mail.gmail.com>
 <BN0PR02MB79517B267D593DC484BA34DF81C3A@BN0PR02MB7951.namprd02.prod.outlook.com>
 <BN0PR02MB7951FFEB16011D2B1D3DA75181C1A@BN0PR02MB7951.namprd02.prod.outlook.com>
 <BN0PR02MB79512718F046A8C88BE359F181C0A@BN0PR02MB7951.namprd02.prod.outlook.com>
Date: Fri, 29 Sep 2023 10:53:48 +0300
Message-ID: <87wmw9ifeb.fsf@intel.com>
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

On Fri, 29 Sep 2023, Ramya SR <rsr@qti.qualcomm.com> wrote:
> Hi All ,
>
> Please review the reply comment.

Please read the responses you do get [1]. Please stop
top-posting. Please fix your mail client.

BR,
Jani.


[1] https://lore.kernel.org/r/877coak8o3.fsf@intel.com

>
> Regards,
> Ramya SR
>
> -----Original Message-----
> From: Ramya SR=20
> Sent: Thursday, September 28, 2023 7:55 AM
> To: 'Alex Deucher' <alexdeucher@gmail.com>; 'imre.deak@intel.com' <imre.d=
eak@intel.com>
> Cc: 'Lyude Paul' <lyude@redhat.com>; 'Jani Nikula' <jani.nikula@intel.com=
>; 'Jeff Layton' <jlayton@kernel.org>; 'linux-kernel@vger.kernel.org' <linu=
x-kernel@vger.kernel.org>; 'dri-devel@lists.freedesktop.org' <dri-devel@lis=
ts.freedesktop.org>; 'Wayne Lin' <Wayne.Lin@amd.com>; 'Alex Deucher' <alexa=
nder.deucher@amd.com>; Ramya SR (QUIC) <quic_rsr@quicinc.com>
> Subject: RE: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST po=
rt detect
>
> Reminder. Please review the reply comment.
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
