Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A533A8F9C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 05:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AEA6E456;
	Wed, 16 Jun 2021 03:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C51A6E456
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 03:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pbxv4anEbkX9DY9xGRR5uGytXmBs2qs+q0TOWNHOTPU9OZ1vembXgqT3aaBNE7p2hL4y+NNoJhoybmKhj/ajno4zX5z1GHUn93PP/VqT7D99jDm4pRnWgy/ygZjOE0wMX/g6DXyoaCAbDrCeJ3P7LaoYuiW7DDFye838zFmDPGI5EnRQbIiRox5LR1Vt/7sbbIYLej+RFpa2IF7o9vTwIXxYLY8VELX7tOEiYDX7jYUjtq12fsvxjQ4LM5kvFkwxdDrJoScCvwkqKTWQqcJKpP2U01tu+s8gCeoKSXbfrRKmb12nK+CmNFdXQZTL+wCcOe5e1tg6Y8KegrosWRtF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVpqjOD6jvINQ0ZSG5mPZxTp8sbtNXetggGzAKFnJ1A=;
 b=mJrPZqTQHas76Fu9ErZA1dojnQ9yhsn7QqKS9+7ea5QwKqeEgvNZgYi3G2OQ5opi9FQuPNVILMLCHyop33owKQNJ2uBaajoZf8be3jA+o8J4dGm/x+0cUR2L1vRvM14BC2B8WMKRc2BG5NFvwOF2B3BJon5mKF2M5OH/20F9K5aI2VPU5uvTL9JJ+V3h35kwcjO8OMP055v4nDb4GhLyD0ISdOQLMQ3vPBllPTwdbYlcs6BgtXEJ4btw/U3kApI/K/x/LXymSljwHrJ6fuwNTSYJQlpn0VUg0sKzofCn9m8JBq4IYcQ3GNMtR0LHQPN7Zax2g+dCkWHrVaDvj80uBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVpqjOD6jvINQ0ZSG5mPZxTp8sbtNXetggGzAKFnJ1A=;
 b=F990ANwukjoDFNfqBfAzYunmUnyX70a4mr/Xh/E+eQwLcu7cvSE5PiwWBA/MtE2OTPnb5Q07nsLLt+tsIRuqazbkH0EDQN0f+Qd2FaDPR7npdBik3VtzB5OI3zXv1bNhxbKJljjFGmtFLWJr5GOrTJ4MgTfVs8KMsyPcVHrxz3E=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CO6PR12MB5425.namprd12.prod.outlook.com (2603:10b6:303:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Wed, 16 Jun
 2021 03:48:17 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::704a:9f7a:1c8d:db6]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::704a:9f7a:1c8d:db6%4]) with mapi id 15.20.4242.018; Wed, 16 Jun 2021
 03:48:17 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/dp_mst: Avoid to mess up payload table by ports
 in stale topology
Thread-Topic: [PATCH 2/2] drm/dp_mst: Avoid to mess up payload table by ports
 in stale topology
Thread-Index: AQHXU8lilHqpoYUkOEKBIq1wICBRCKsVlh6AgACFEdM=
Date: Wed, 16 Jun 2021 03:48:17 +0000
Message-ID: <CO6PR12MB54892FEE70A3FF9D5533E243FC0F9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20210528135557.23248-1-Wayne.Lin@amd.com>
 <20210528135557.23248-3-Wayne.Lin@amd.com>,
 <6865def1e959a42b41a9661c7037fd0118482671.camel@redhat.com>
In-Reply-To: <6865def1e959a42b41a9661c7037fd0118482671.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-06-16T03:47:46.109Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5f3c9cc-5c07-4478-2fdd-08d9307993b3
x-ms-traffictypediagnostic: CO6PR12MB5425:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR12MB542561888FD7ED8C6AD78577FC0F9@CO6PR12MB5425.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C1rWd7MMUhdH+cFhHqwfHIfIp2wPmzgFhXtPug6sMsiputE4z0oUL+fW1nIc4NrDLV6QIh/Bgsi5H/gsvmGqsolWdMPfVCYLSkAEVnh2VdYLVtkiZMf+LbNVAhxPUL6US5KvDOb/ckn9y/fXcIA7GiekaS9PcLGPZeJfZ/HnjtR0ItgPSJhfPVWIDp+yHyzxungdJoiW8AT3VeBjNwHtFQ7HtHVDi9e/6K8q0ddTk9DiLr3xFBVBtdwc/pn7jW4vXoFGDPSIEBewIUyTunbZuGfI5c80fyXBdMZsXHjGCRt+axOV5rWD6h30Pp72WO9QLPrOqIKSPAo85ZvzwJYWYiewbPiF4LYNiSJzsnXPPl1w96ml1Ftp+5uX7nqPSoJxKhqXOdXAYbHkl33oM4nGU23jP+UeyPUc/tUcIy9GVaHlHenioDgY6lq4Ys9hIBIpLgFQG5I8niq9ShlnXs8aIAAWD0ZYZ5Sk5d6SpLYCobsNUJ7ac5JrhrjIU1DoYTHaLvTGoyNz5lyotv5iwpyXQf72840gIqpBHe8dpzW87mVw4WyKnm/b7JhNzeJtX2HedTk+orAvCUZHZAA09By/Fr1kpMp62Io3ZfDztB7WowoxVXuTQak4SBmTLD/GUAc5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(38100700002)(83380400001)(316002)(66946007)(186003)(66446008)(26005)(8676002)(54906003)(33656002)(8936002)(66476007)(64756008)(66556008)(52536014)(4326008)(9686003)(71200400001)(91956017)(966005)(2906002)(55016002)(6506007)(478600001)(110136005)(53546011)(7696005)(86362001)(5660300002)(122000001)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fjpFbt3BnpwCawyfVmYWRaN64La3uvxdP4Rk/u4s9DJHB4ZxmZBjjKrT2O?=
 =?iso-8859-1?Q?qjsDZ36oKjmGadWsNCa5Ex8w7G8/f1wzu91YMcWW5ontz8mHclvlUTp3i0?=
 =?iso-8859-1?Q?EwY96Sp0oIqpwz6FBB5lavmOyqoqna52RCFgda0R19mM6utQuFdCsYz3pO?=
 =?iso-8859-1?Q?tFSlqOz1W+fGnlE3YGx0GpfogvoxI4UdHZ5B+cQCl5ORrHCFvPT1dEFdaE?=
 =?iso-8859-1?Q?Fzsb0X0v/T9KFPYG5q50xiJ4QICfQKUdm6hS77AwrhHCir77LCS4nxBqKf?=
 =?iso-8859-1?Q?3wkrIizAtKpIUeP/yEvm4MkaZrRCHSz4i4U7X0W1HMsEtwHogvOvTB6MxW?=
 =?iso-8859-1?Q?tfBuZ1R/S7fdxyrD2DRdvlAQhZiOy2TkyJLcwDDLcHfkoTw0WZCD0P8uqm?=
 =?iso-8859-1?Q?NPzMV80iZO5n5qKZsySQgJYBsgRmGukUrYipawUKKib77EjSeWZ7QrTsra?=
 =?iso-8859-1?Q?YPS2Yhahbf9wWL1JpmcEuJqKqsWCXqS7xZlh2K3R9h7J7C7F9DL2hNhmPk?=
 =?iso-8859-1?Q?g4NVsRdF6gNgg3yIoZwXvbkWAEBmmGNAqRz+ANrfoinWFxkXtjYlaElr2F?=
 =?iso-8859-1?Q?JBCfF2EMeo9JG3IhOA74epcx1Wcw+nBatRImCfxmuQz2l8J7UVQG/9Aqum?=
 =?iso-8859-1?Q?Z136xXU4Gb0v6cOMMNUsn3ePb1UQdat03a7+cKfscSqRyMfuuoM246or7i?=
 =?iso-8859-1?Q?TlIEADh1q8dA4BkE/DjAIzagyoFCnQQ8zSJl9xoejuAl6dM4jiwC+D9sxN?=
 =?iso-8859-1?Q?YbtP0zU358TEtf1CX1szD9PmPb6BoPWo1os1h9uMlsHnS2slhqIEPejrjM?=
 =?iso-8859-1?Q?fhP7Q+SiaaWGgGYXWYnLRjPaTIHaAfbjRBfAtuqoF4WQUkaw5jFEvlT6m2?=
 =?iso-8859-1?Q?d/ihD0jNREFVOp3J3n3dlxJV/IiDjbkNyLpSsOVR4DPVngn1RYZ+cYAJi9?=
 =?iso-8859-1?Q?+5qH5l4GjvpbjXROuKEagJDzJDZTFZlMsBKVC2FgmYh1nQiso4ahv1+Z0y?=
 =?iso-8859-1?Q?I7N0a+pbj1Qge8BppSAD7sVBGwgOLBlpR3pfouWh7Qc84dcu9sRZPaQjkS?=
 =?iso-8859-1?Q?NFwXMxCiumPGWn9A2j0Oiqs2J0pNJjgSap0m2A75x53D3qQXTgvNXTcWUp?=
 =?iso-8859-1?Q?Eifl1wPTD2UQlekj3jfB8upezMH8HRwv0KZ7uVTW/YcKR2KVIaHYeFKlgn?=
 =?iso-8859-1?Q?Rdsp0pm5JqAa9+CAxUofVcP2ueoGcZvk/Fns8rTN7330OUosgAYtEvcQKT?=
 =?iso-8859-1?Q?dkL+zMwYVHl13Pq3TtZxP+SduDtPi0jS+LPSwN1HoeTTfbT8dALw0fYgZ2?=
 =?iso-8859-1?Q?pcLDcRRg8jS82D+BqFWCM+nCbYyYuKaSIGdFv+fYeuvwDb8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f3c9cc-5c07-4478-2fdd-08d9307993b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 03:48:17.5591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTJAg3gA/6TPMxSGcSqx17/8fHu8az8Nc6eOWzHZNJSnJFGU5+8xB1HV1rl6XuNGBAH8ej7FznYfWQmNjwti3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5425
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

________________________________________
> From: Lyude Paul <lyude@redhat.com>
> Sent: Wednesday, June 16, 2021 03:44
> To: Lin, Wayne; dri-devel@lists.freedesktop.org
> Cc: Kazlauskas, Nicholas; Wentland, Harry; Zuo, Jerry; Pillai, Aurabindo
> Subject: Re: [PATCH 2/2] drm/dp_mst: Avoid to mess up payload table by po=
rts in stale topology
>
> On Fri, 2021-05-28 at 21:55 +0800, Wayne Lin wrote:
> > [Why]
> > After unplug/hotplug hub from the system, userspace might start to
> > clear stale payloads gradually. If we call drm_dp_mst_deallocate_vcpi()
> > to release stale VCPI of those ports which are not relating to current
> > topology, we have chane to wrongly clear active payload table entry for
> > current topology.
> >
> > E.g.
> > We have allocated VCPI 1 in current payload table and we call
> > drm_dp_mst_deallocate_vcpi() to clean VCPI 1 in stale topology. In
> > drm_dp_mst_deallocate_vcpi(), it will call drm_dp_mst_put_payload_id()
> > tp put VCPI 1 and which means ID 1 is available again. Thereafter, if w=
e
> > want to allocate a new payload stream, it will find ID 1 is available b=
y
> > drm_dp_mst_assign_payload_id(). However, ID 1 is being used
> >
> > [How]
> > Check target sink is relating to current topology or not before doing
> > any payload table update.
> > Searching upward to find the target sink's relevant root branch device.
> > If the found root branch device is not the same root of current
> > topology, don't update payload table.
> >
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 29 +++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 5fc261014a20..3d988d54df89 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -94,6 +94,9 @@ static int drm_dp_mst_register_i2c_bus(struct
> > drm_dp_mst_port *port);
> >  static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port=
);
> >  static void drm_dp_mst_kick_tx(struct drm_dp_mst_topology_mgr *mgr);
> >
> > +static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_por=
t
> > *port,
> > +                                                struct drm_dp_mst_bran=
ch
> > *branch);
> > +
> >  #define DBG_PREFIX "[dp_mst]"
> >
> >  #define DP_STR(x) [DP_ ## x] =3D #x
> > @@ -3360,6 +3363,7 @@ int drm_dp_update_payload_part1(struct
> > drm_dp_mst_topology_mgr *mgr)
> >         struct drm_dp_mst_port *port;
> >         int i, j;
> >         int cur_slots =3D 1;
> > +       bool skip;
> >
> >         mutex_lock(&mgr->payload_lock);
> >         for (i =3D 0; i < mgr->max_payloads; i++) {
> > @@ -3374,6 +3378,14 @@ int drm_dp_update_payload_part1(struct
> > drm_dp_mst_topology_mgr *mgr)
> >                         port =3D container_of(vcpi, struct drm_dp_mst_p=
ort,
> >                                             vcpi);
> >
> > +                       mutex_lock(&mgr->lock);
> > +                       skip =3D !drm_dp_mst_port_downstream_of_branch(=
port,
> > mgr->mst_primary);
> > +                       mutex_unlock(&mgr->lock);
> > +
> > +                       if (skip) {
> > +                               DRM_DEBUG_KMS("Virtual channel %d is no=
t in
> > current topology\n", i);
>
> sorry I totally missed this on my first look - but this is the wrong debu=
gging
> macro (drm_dbg_kms() should be used) and as well, this patch doesn't actu=
ally
> apply because it needs to be rebased against drm-tip. Could you fix this,
> rebase the patches, and send a new version along with the fixes tags I
> mentioned earlier? You can generate them using the dim tool here:
>
> https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-intel.ht=
ml#labeling-fixes-before-pushing
>

Thanks for your time! Will do.

> > +                               continue;
> > +                       }
> >                         /* Validated ports don't matter if we're releas=
ing
> >                          * VCPI
> >                          */
> > @@ -3473,6 +3485,7 @@ int drm_dp_update_payload_part2(struct
> > drm_dp_mst_topology_mgr *mgr)
> >         struct drm_dp_mst_port *port;
> >         int i;
> >         int ret =3D 0;
> > +       bool skip;
> >
> >         mutex_lock(&mgr->payload_lock);
> >         for (i =3D 0; i < mgr->max_payloads; i++) {
> > @@ -3482,6 +3495,13 @@ int drm_dp_update_payload_part2(struct
> > drm_dp_mst_topology_mgr *mgr)
> >
> >                 port =3D container_of(mgr->proposed_vcpis[i], struct
> > drm_dp_mst_port, vcpi);
> >
> > +               mutex_lock(&mgr->lock);
> > +               skip =3D !drm_dp_mst_port_downstream_of_branch(port, mg=
r-
> > >mst_primary);
> > +               mutex_unlock(&mgr->lock);
> > +
> > +               if (skip)
> > +                       continue;
> > +
> >                 DRM_DEBUG_KMS("payload %d %d\n", i, mgr-
> > >payloads[i].payload_state);
> >                 if (mgr->payloads[i].payload_state =3D=3D DP_PAYLOAD_LO=
CAL) {
> >                         ret =3D drm_dp_create_payload_step2(mgr, port, =
mgr-
> > >proposed_vcpis[i]->vcpi, &mgr->payloads[i]);
> > @@ -4562,9 +4582,18 @@ EXPORT_SYMBOL(drm_dp_mst_reset_vcpi_slots);
> >  void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> >                                 struct drm_dp_mst_port *port)
> >  {
> > +       bool skip;
> > +
> >         if (!port->vcpi.vcpi)
> >                 return;
> >
> > +       mutex_lock(&mgr->lock);
> > +       skip =3D !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_p=
rimary);
> > +       mutex_unlock(&mgr->lock);
> > +
> > +       if (skip)
> > +               return;
> > +
> >         drm_dp_mst_put_payload_id(mgr, port->vcpi.vcpi);
> >         port->vcpi.num_slots =3D 0;
> >         port->vcpi.pbn =3D 0;
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
--
Regards,
Wayne Lin

