Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F753145FF7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 01:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DB76F956;
	Thu, 23 Jan 2020 00:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90616F956
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 00:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rc9UNgzgrNNM+fLQkhmD/D6uOr4iwomiTGcuIoxcaAo2b1wYyW5uh065eMcy7PlGKPQOPSBq4qqXOuqQDxwwOlRjq+75NLZ+aOK9Z8skkYrxwTFc6r1KfiwqGpF+XfPOvGwBbvFY2rF6tnMwmH1FUSGiLwRvZ3mfyrbjyBErQ2E3E+HBGYzoKlaFTE5zl2bAPauzeZcMpRn86MhYydDqUp7jkBXxSoc/3i5t8HZws98X64u7sLn7e7GCfGZh/HWsM/pecXtAubZZ0jJNJNGheP7A9VeHqyizJ+U3TAEvcDBL3LZIWxmkcb2nBX5ba0bkngAk1CPv7WxSVtaHvvyBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ib4jdq7Vcm+xSkAqgsPrziprXHKdMPMLm9wG+OuaYU=;
 b=R+36tpURzpJ76F+UE2VGTOHzYNdmdBstuALeQWrPR685fCskY6OGqlX0yVcSvsE9koppKUxCZj+yLcfDYNspwD/KnH+uy1KxrJJPbnpxbu6sNKlQwXTPrwV1KicfR5uO+XTIP4Qfe3HJw/e3Rrp/ik+AKuPZfYGQx4QSjvwbqhiMDnpLu00h/4YRq8901SQZgIRqK9C+tctyoMykxe2pj34dvRwiuLxQT1CigSnGCy7+gtHwFx+fxzICUDrRM83sM68PbfoxIM7/4AYkD1UGlgbQZ+MySJOHgHXw4QxGvVXLhX2D4tgBBWVKFLwW6UH7w1PygxhOuuOFBEdurKrdIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ib4jdq7Vcm+xSkAqgsPrziprXHKdMPMLm9wG+OuaYU=;
 b=oXIX/9sAuuA2lE5wLYAxqwwt0X7CbQ6d9gnoyyheaV1dH8fHDMY11ztcpN1buEGAn1pywimVOJyMCjr+s8sRlJiEzQTmGvvxR4uSyAdstY/O0CoG06lLF0LE5G8YfnNLbq383JS8ZDkJIAuET6WkMLhI6M6SuVsusX0NB968PKc=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3324.namprd12.prod.outlook.com (20.178.31.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Thu, 23 Jan 2020 00:34:41 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2644.028; Thu, 23 Jan 2020
 00:34:41 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/dp_mst: Fix clearing payload state on topology
 disable
Thread-Topic: [PATCH v2 1/2] drm/dp_mst: Fix clearing payload state on
 topology disable
Thread-Index: AQHV0VxCwRazO7Mmy0yv3474u+MZzqf3KNSAgAAwCwCAAApA0w==
Date: Thu, 23 Jan 2020 00:34:40 +0000
Message-ID: <DM6PR12MB4137CC54FA54CB02C3CA8A23FC0F0@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200122194321.14953-1-lyude@redhat.com>
 <20200122205153.GJ13686@intel.com>,
 <bedb14c54b1cbd93117e2a64675ea31ad4b23d5a.camel@redhat.com>
In-Reply-To: <bedb14c54b1cbd93117e2a64675ea31ad4b23d5a.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-01-23T00:34:40.349Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [211.75.160.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32ad8865-07f0-405c-33a9-08d79f9c08f2
x-ms-traffictypediagnostic: DM6PR12MB3324:
x-microsoft-antispam-prvs: <DM6PR12MB33243E18E13E3700BACB6B52FC0F0@DM6PR12MB3324.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(189003)(199004)(8676002)(52536014)(2906002)(5660300002)(66946007)(110136005)(76116006)(91956017)(33656002)(8936002)(7696005)(71200400001)(478600001)(55016002)(66574012)(81156014)(316002)(81166006)(6506007)(66556008)(186003)(53546011)(26005)(66446008)(86362001)(9686003)(64756008)(66476007)(4326008)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3324;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YkSqAatHMdTLHPzNDsI/Cizz2fcOk9UFNj42r/YUgtrLBw0NSqtHUpul9whp7VAH1q6FqV2Iit8blq+XlKXCKGF5i850U0gTh7BYPwYFsExKkLh3fAPp30pYR1UJQZmX9Cpg12BJ7X7pm7qlDrigBpB2+p4e5N6Qa4HCl1BHhCK6yhHSWu6DmO0dBdu/lF+O6GWypEOgRtfltau50qncUxdOz4nNQVXxKA2bJrMvZDCdqqnbcTbdabi6Brn2Vhlmh8TnGzCt57FFtwTUmFXLFS/p/J6tUdl535fo+mNiMtpBhe8sG+CRMbD5CGqpN8coYaViyTRX1sJPSDJsk6NxAQwL3bgIvE7mb+LNJuWw3O9twOMZoOhCj5CyvC95al9DBreBLjSoLi79SxRRWwc+QkC4ycs8HM+qTH8xUmIJXjmixlPqC3Msr9Bi51CkzExT
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ad8865-07f0-405c-33a9-08d79f9c08f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 00:34:40.8586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ug/5nolnOKZ/n8DtWAbYIH1GTpGMCFBPvFqjbd+67uXgx54r+m2i5UjdmxHgiJYOaFZftAppNULSCp3QHvjwNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3324
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Hi Lyude,

I also notice one thing that I was not aware of before. Since we're clearin=
g payloads here, maybe we should also call drm_dp_mst_put_port_malloc() to =
put malloc refcounts here?

Appreciate for all your help! :)

________________________________________
From: Lyude Paul <lyude@redhat.com>
Sent: Thursday, January 23, 2020 07:43
To: Ville Syrj=E4l=E4
Cc: dri-devel@lists.freedesktop.org; Sean Paul; Lin, Wayne; Maarten Lankhor=
st; Maxime Ripard; David Airlie; Daniel Vetter; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/dp_mst: Fix clearing payload state on topol=
ogy disable

On Wed, 2020-01-22 at 22:51 +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Jan 22, 2020 at 02:43:20PM -0500, Lyude Paul wrote:
> > The issues caused by:
> >
> > 64e62bdf04ab ("drm/dp_mst: Remove VCPI while disabling topology mgr")
> >
> > Prompted me to take a closer look at how we clear the payload state in
> > general when disabling the topology, and it turns out there's actually
> > two subtle issues here.
> >
> > The first is that we're not grabbing &mgr.payload_lock when clearing the
> > payloads in drm_dp_mst_topology_mgr_set_mst(). Seeing as the canonical
> > lock order is &mgr.payload_lock -> &mgr.lock (because we always want
> > &mgr.lock to be the inner-most lock so topology validation always
> > works), this makes perfect sense. It also means that -technically- there
> > could be racing between someone calling
> > drm_dp_mst_topology_mgr_set_mst() to disable the topology, along with a
> > modeset occurring that's modifying the payload state at the same time.
> >
> > The second is the more obvious issue that Wayne Lin discovered, that
> > we're not clearing proposed_payloads when disabling the topology.
> >
> > I actually can't see any obvious places where the racing caused by the
> > first issue would break something, and it could be that some of our
> > higher-level locks already prevent this by happenstance, but better safe
> > then sorry. So, let's make it so that drm_dp_mst_topology_mgr_set_mst()
> > first grabs &mgr.payload_lock followed by &mgr.lock so that we never
> > race when modifying the payload state. Then, we also clear
> > proposed_payloads to fix the original issue of enabling a new topology
> > with a dirty payload state. This doesn't clear any of the drm_dp_vcpi
> > structures, but those are getting destroyed along with the ports anyway.
> >
> > Changes since v1:
> > * Use sizeof(mgr->payloads[0])/sizeof(mgr->proposed_vcpis[0]) instead -
> >   vsyrjala
> >
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 3649e82b963d..23cf46bfef74 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -3501,6 +3501,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > drm_dp_mst_topology_mgr *mgr, bool ms
> >     int ret =3D 0;
> >     struct drm_dp_mst_branch *mstb =3D NULL;
> >
> > +   mutex_lock(&mgr->payload_lock);
> >     mutex_lock(&mgr->lock);
> >     if (mst_state =3D=3D mgr->mst_state)
> >             goto out_unlock;
> > @@ -3559,7 +3560,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > drm_dp_mst_topology_mgr *mgr, bool ms
> >             /* this can fail if the device is gone */
> >             drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
> >             ret =3D 0;
> > -           memset(mgr->payloads, 0, mgr->max_payloads * sizeof(struct
> > drm_dp_payload));
> > +           memset(mgr->payloads, 0,
> > +                  mgr->max_payloads * sizeof(mgr->payloads[0]));
> > +           memset(mgr->proposed_vcpis, 0,
> > +                  mgr->max_payloads * sizeof(mgr->proposed_vcpis[0]));
> >             mgr->payload_mask =3D 0;
> >             set_bit(0, &mgr->payload_mask);
> >             mgr->vcpi_mask =3D 0;
> > @@ -3568,6 +3572,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > drm_dp_mst_topology_mgr *mgr, bool ms
> >
> >  out_unlock:
> >     mutex_unlock(&mgr->lock);
> > +   mutex_unlock(&mgr->payload_lock);
>
> Locking order looks sane. Not entirely sure what the implications of
> clearing all that stuff outside of a proper modeset is, but at least
> it matches what we already do. So

fwiw - it's not clearing anything currently programmed in hw at that point,
it's just clearing the arrays we use for keeping track of pending/current
payload allocations so there's nothing in them the next time we enable MST =
on
a display. This is basically what we want anyway - once we disable MST thro=
ugh
the DPCD, we won't end up sending any payload updates anyway so these don't
get used in the modesets that follow.

tbh, part of me wonders if we could handle more of this in atomic state in =
the
future, but I haven't seen a good enough reason to try that yet.
>
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>
> >     if (mstb)
> >             drm_dp_mst_topology_put_mstb(mstb);
> >     return ret;
> > --
> > 2.24.1
--
Cheers,
        Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
