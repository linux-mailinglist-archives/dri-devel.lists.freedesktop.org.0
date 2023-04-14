Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430F6E2C8E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 00:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5153A10EEB7;
	Fri, 14 Apr 2023 22:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9159C10EEB7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 22:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681512718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xzg1uEhhBGkSbd3wSQjxiynbNYfCWbcMjiTfelS4Yzw=;
 b=Gy9Jm0jehybTKcb590aFwjOv8jSJzROc+BIYWSVINwe6TMiH6QEJ1E4LKXSRRLyBJ/ysKb
 hTdxV8H4eewvS7Y75yFXQOxHBW3nAZVMdSezh3k4fz0z5N4UFD/8GkUMROXlR3I2oAHVmj
 UH4INSM9GucUu5X3CGDeSdvyzqpctQM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-ccHyIdKcML-aovBVpXHtqA-1; Fri, 14 Apr 2023 18:51:57 -0400
X-MC-Unique: ccHyIdKcML-aovBVpXHtqA-1
Received: by mail-qk1-f197.google.com with SMTP id
 1-20020a370301000000b0074681bc7f42so9541150qkd.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 15:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681512716; x=1684104716;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xzg1uEhhBGkSbd3wSQjxiynbNYfCWbcMjiTfelS4Yzw=;
 b=YhY0iETY6SG999pT+qpwkDmHLhHlGqScCzn5HruRVdv4IXxW9iwYECeOXQ62P3bcCv
 sVoIYZZrZ2QPeLrCFwwfPyPEtEHExV13TpbKIht6winr8+g7L4khYrp6QMPr36BVMaKH
 8NZKfokP+zNowORvNlyNzCcWvebh7R7HS3xp17ndxKBewjIw7Zw+B1fGenIojHjPSz03
 fH5JoCwqhrOeW+S2HnBng9GvVB0o23mA6B6B4j8szoVtZeROJPWAmxWyyBEJH+PmyHlx
 Emr4m5aVwryzk2PU242x+gxeY0Uz7D8vaZ+wc0RtNi92SuUejkrHOwJ1zujDDL9w6oDx
 4r9A==
X-Gm-Message-State: AAQBX9cmurkhlpaOCN0G+HP50X/lWqmLQAzzCMf00/qPgrpoVActqp0a
 rDD12H8yQxlHK3wZ67ZN4XAlgp8iJsomKd3aJEDUOm8bcbsBZ0ltADnOaC0GKQw9UBIKDQmBRNx
 nUS0pXqcxOF0WdyXI184AI/JVF++9
X-Received: by 2002:ac8:5bc2:0:b0:3da:e3a8:b01a with SMTP id
 b2-20020ac85bc2000000b003dae3a8b01amr10483558qtb.0.1681512716675; 
 Fri, 14 Apr 2023 15:51:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bq+nyFZeqoJ0c2ttgmXGuKaQG8bk9r8rd3vo02jf/CzwDaHZcBXoi9bOyI3iTHqKqMN9Ym5w==
X-Received: by 2002:ac8:5bc2:0:b0:3da:e3a8:b01a with SMTP id
 b2-20020ac85bc2000000b003dae3a8b01amr10483542qtb.0.1681512716374; 
 Fri, 14 Apr 2023 15:51:56 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a05620a2a0a00b0074acb58d489sm1545132qkp.32.2023.04.14.15.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 15:51:55 -0700 (PDT)
Message-ID: <7a1b00f02b125bd65824b18ea09509efe3cf777d.camel@redhat.com>
Subject: Re: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle
 NULL state pointer
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Jeff Layton
 <jlayton@kernel.org>,  "Lin, Wayne" <Wayne.Lin@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>
Date: Fri, 14 Apr 2023 18:51:55 -0400
In-Reply-To: <878reug394.fsf@intel.com>
References: <20230413111254.22458-1-jlayton@kernel.org>
 <87edooarpq.fsf@intel.com>
 <CADnq5_PVnYMSiKO77+cfg_V-tDKYkVJYN3qGNb1vhQO3QtXskA@mail.gmail.com>
 <CO6PR12MB5489044012B2A96639470F38FC999@CO6PR12MB5489.namprd12.prod.outlook.com>
 <4d8479f20ef30866fcf73f3602f1237376110764.camel@kernel.org>
 <878reug394.fsf@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2023-04-14 at 13:35 +0300, Jani Nikula wrote:
> On Fri, 14 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> > On Fri, 2023-04-14 at 04:40 +0000, Lin, Wayne wrote:
> > > [Public]
> > >=20
> > > Hi Jeff,
> > >=20
> > > Thanks. I might need more information to understand why we can't retr=
ieve
> > > the drm atomic state. Also , "Failed to create MST payload for port" =
indicates
> > > error while configuring DPCD payload ID table. Could you help to prov=
ide log
> > > with KMS + ATOMIC + DP debug on please? Thanks in advance!
> > >=20
> > > Regards,
> > > Wayne
> > >=20
> >=20
> > Possibly. I'm not that familiar with display driver debugging. Can you
> > send me some directions on how to crank up that sort of debug logging?
> >=20
> > Note that this problem is _very_ intermittent too: I went about 2 weeks
> > between crashes, and then I got 3 in one day. I'd rather not run with a
> > lot of debug logging for a long time if that's what this is going to
> > require, as this is my main workstation.
> >=20
> > The last time I got this log message, my proposed patch did prevent the
> > box from oopsing, so I'd really like to see it go in unless it's just
> > categorically wrong for the caller to pass down a NULL state pointer to
> > drm_dp_add_payload_part2.
>=20
> Cc: Lyude.
>=20
> Looks like the state parameter was added in commit 4d07b0bc4034
> ("drm/display/dp_mst: Move all payload info into the atomic state") and
> its only use is to get at state->dev for debug logging.
>=20
> What's the plan for the parameter? Surely something more than that! :)

I don't think there was any plan for that, or at least I certainly don't ev=
en
remember adding that D:. It must totally have been by mistake and snuck by
review, if that's the only thing that we're using it for I'd say it's
definitely fine to just drop it entirely

>=20
> Instead of "state ? state->dev : NULL" I guess we could use mgr->dev
> like the other logging calls do. It's papering over the NULL parameter
> too, but perhaps in a slightly cleaner way...
>=20
>=20
> BR,
> Jani.
>=20
>=20
> >=20
> > > > -----Original Message-----
> > > > From: Alex Deucher <alexdeucher@gmail.com>
> > > > Sent: Thursday, April 13, 2023 8:59 PM
> > > > To: Jani Nikula <jani.nikula@linux.intel.com>; Lin, Wayne
> > > > <Wayne.Lin@amd.com>
> > > > Cc: Jeff Layton <jlayton@kernel.org>; David Airlie <airlied@gmail.c=
om>;
> > > > Daniel Vetter <daniel@ffwll.ch>; Deucher, Alexander
> > > > <Alexander.Deucher@amd.com>; linux-kernel@vger.kernel.org; dri-
> > > > devel@lists.freedesktop.org
> > > > Subject: Re: [PATCH] drm: make drm_dp_add_payload_part2 gracefully
> > > > handle NULL state pointer
> > > >=20
> > > > + Wayne
> > > >=20
> > > > On Thu, Apr 13, 2023 at 8:31=E2=80=AFAM Jani Nikula <jani.nikula@li=
nux.intel.com>
> > > > wrote:
> > > > >=20
> > > > > On Thu, 13 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> > > > > > I've been experiencing some intermittent crashes down in the di=
splay
> > > > > > driver code. The symptoms are ususally a line like this in dmes=
g:
> > > > > >=20
> > > > > >     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for=
 port
> > > > > > 000000006d3a3885: -5
> > > > > >=20
> > > > > > ...followed by an Oops due to a NULL pointer dereference.
> > > > > >=20
> > > > > > The real bug is probably in the caller of this function, which =
is
> > > > > > passing it a NULL state pointer, but this patch at least keeps =
my
> > > > > > machine from oopsing when this occurs.
> > > > >=20
> > > > > My fear is that papering over this makes the root cause harder to=
 find.
> > > > >=20
> > > > > Cc: Harry, Alex
> > > > >=20
> > > > >=20
> > > > > BR,
> > > > > Jani.
> > > > >=20
> > > > >=20
> > > > > >=20
> > > > > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2184855
> > > > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > index 38dab76ae69e..87ad406c50f9 100644
> > > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > @@ -3404,7 +3404,8 @@ int drm_dp_add_payload_part2(struct
> > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > >=20
> > > > > >       /* Skip failed payloads */
> > > > > >       if (payload->vc_start_slot =3D=3D -1) {
> > > > > > -             drm_dbg_kms(state->dev, "Part 1 of payload creati=
on for %s
> > > > failed, skipping part 2\n",
> > > > > > +             drm_dbg_kms(state ? state->dev : NULL,
> > > > > > +                         "Part 1 of payload creation for %s fa=
iled,
> > > > > > + skipping part 2\n",
> > > > > >                           payload->port->connector->name);
> > > > > >               return -EIO;
> > > > > >       }
> > > > >=20
> > > > > --
> > > > > Jani Nikula, Intel Open Source Graphics Center
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

