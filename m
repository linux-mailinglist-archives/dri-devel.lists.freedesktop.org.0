Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698DB6E2102
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685FB10ECCD;
	Fri, 14 Apr 2023 10:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D915D10ECC8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 10:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681468574; x=1713004574;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=s5uleElrBg/AucDBk9yGHTMW0O1Om4mwNTJtQQVVrt8=;
 b=Z9KAwVCBv82P9Hd6BGZlTcS5091MFyWk+1LZ69jG00/738xh3rPQqYXt
 E/Ou7SXeDKBv1BgLcahTnHE+S6qcIq3cYDHjn+d2Kx+GRmc2vMbnEVLpy
 UCp/Hor0FQ4KO4Xbr35LEWsz1L8tyScLSXUqFeBB8upUelkaY/37Txd4A
 JOv/F79D1fvPL1tfV9zW9wJb3FN7o6UhxmWTNk8SG8/+YHSAxo6ONNzFe
 6ndmBvKuBvRKShv1rPvUlVF1b5wLFH+BDdqqQR/xQ6hUoQ/JEVqgrwvTu
 agfrzozlcDw3fv29VJs5NmEo7VH/SpjaWzeK6lMzQDaIiDM+NlRX2W3YT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324785873"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="324785873"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 03:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="667152708"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="667152708"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.55.117])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 03:35:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jeff Layton <jlayton@kernel.org>, "Lin, Wayne" <Wayne.Lin@amd.com>, Alex
 Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle
 NULL state pointer
In-Reply-To: <4d8479f20ef30866fcf73f3602f1237376110764.camel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230413111254.22458-1-jlayton@kernel.org>
 <87edooarpq.fsf@intel.com>
 <CADnq5_PVnYMSiKO77+cfg_V-tDKYkVJYN3qGNb1vhQO3QtXskA@mail.gmail.com>
 <CO6PR12MB5489044012B2A96639470F38FC999@CO6PR12MB5489.namprd12.prod.outlook.com>
 <4d8479f20ef30866fcf73f3602f1237376110764.camel@kernel.org>
Date: Fri, 14 Apr 2023 13:35:51 +0300
Message-ID: <878reug394.fsf@intel.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> On Fri, 2023-04-14 at 04:40 +0000, Lin, Wayne wrote:
>> [Public]
>>=20
>> Hi Jeff,
>>=20
>> Thanks. I might need more information to understand why we can't retrieve
>> the drm atomic state. Also , "Failed to create MST payload for port" ind=
icates
>> error while configuring DPCD payload ID table. Could you help to provide=
 log
>> with KMS + ATOMIC + DP debug on please? Thanks in advance!
>>=20
>> Regards,
>> Wayne
>>=20
>
> Possibly. I'm not that familiar with display driver debugging. Can you
> send me some directions on how to crank up that sort of debug logging?
>
> Note that this problem is _very_ intermittent too: I went about 2 weeks
> between crashes, and then I got 3 in one day. I'd rather not run with a
> lot of debug logging for a long time if that's what this is going to
> require, as this is my main workstation.
>
> The last time I got this log message, my proposed patch did prevent the
> box from oopsing, so I'd really like to see it go in unless it's just
> categorically wrong for the caller to pass down a NULL state pointer to
> drm_dp_add_payload_part2.

Cc: Lyude.

Looks like the state parameter was added in commit 4d07b0bc4034
("drm/display/dp_mst: Move all payload info into the atomic state") and
its only use is to get at state->dev for debug logging.

What's the plan for the parameter? Surely something more than that! :)

Instead of "state ? state->dev : NULL" I guess we could use mgr->dev
like the other logging calls do. It's papering over the NULL parameter
too, but perhaps in a slightly cleaner way...


BR,
Jani.


>
>> > -----Original Message-----
>> > From: Alex Deucher <alexdeucher@gmail.com>
>> > Sent: Thursday, April 13, 2023 8:59 PM
>> > To: Jani Nikula <jani.nikula@linux.intel.com>; Lin, Wayne
>> > <Wayne.Lin@amd.com>
>> > Cc: Jeff Layton <jlayton@kernel.org>; David Airlie <airlied@gmail.com>;
>> > Daniel Vetter <daniel@ffwll.ch>; Deucher, Alexander
>> > <Alexander.Deucher@amd.com>; linux-kernel@vger.kernel.org; dri-
>> > devel@lists.freedesktop.org
>> > Subject: Re: [PATCH] drm: make drm_dp_add_payload_part2 gracefully
>> > handle NULL state pointer
>> >=20
>> > + Wayne
>> >=20
>> > On Thu, Apr 13, 2023 at 8:31=E2=80=AFAM Jani Nikula <jani.nikula@linux=
.intel.com>
>> > wrote:
>> > >=20
>> > > On Thu, 13 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
>> > > > I've been experiencing some intermittent crashes down in the displ=
ay
>> > > > driver code. The symptoms are ususally a line like this in dmesg:
>> > > >=20
>> > > >     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for po=
rt
>> > > > 000000006d3a3885: -5
>> > > >=20
>> > > > ...followed by an Oops due to a NULL pointer dereference.
>> > > >=20
>> > > > The real bug is probably in the caller of this function, which is
>> > > > passing it a NULL state pointer, but this patch at least keeps my
>> > > > machine from oopsing when this occurs.
>> > >=20
>> > > My fear is that papering over this makes the root cause harder to fi=
nd.
>> > >=20
>> > > Cc: Harry, Alex
>> > >=20
>> > >=20
>> > > BR,
>> > > Jani.
>> > >=20
>> > >=20
>> > > >=20
>> > > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2184855
>> > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
>> > > > ---
>> > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
>> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > > >=20
>> > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > > > index 38dab76ae69e..87ad406c50f9 100644
>> > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > > > @@ -3404,7 +3404,8 @@ int drm_dp_add_payload_part2(struct
>> > > > drm_dp_mst_topology_mgr *mgr,
>> > > >=20
>> > > >       /* Skip failed payloads */
>> > > >       if (payload->vc_start_slot =3D=3D -1) {
>> > > > -             drm_dbg_kms(state->dev, "Part 1 of payload creation =
for %s
>> > failed, skipping part 2\n",
>> > > > +             drm_dbg_kms(state ? state->dev : NULL,
>> > > > +                         "Part 1 of payload creation for %s faile=
d,
>> > > > + skipping part 2\n",
>> > > >                           payload->port->connector->name);
>> > > >               return -EIO;
>> > > >       }
>> > >=20
>> > > --
>> > > Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
