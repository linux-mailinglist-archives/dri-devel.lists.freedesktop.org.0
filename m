Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32336E45E3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 12:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C3F10E40B;
	Mon, 17 Apr 2023 10:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E5A10E427
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 10:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqMXE/O45hpzYJt3MDVdPFSGPZVdqsLSfbMMy3ycrpBs3KQnTtGoxRvlHbrHY/lSp7BOn65vxLuaIS/JSgC3o53RrbrRdvJLo5yCwVvh137U6XxEqOs8Nv3a3oXIVhtHYiaUEPY2xkKtrq06Rwa5lyTJ0g0LBRGMtfXsyJucRY326dUvxZ7GNvhGQw6kW2QDFDSYBxGbSJfDg4m0MFU5CrtMWvGMsQ19bseDcjBIQ5A42TM9rz/ySKzujtIBI1yaxybz96kYh8669fln2Pv9lH2FsmcAn6rcunf9MYKUX0fedrYn4qyhWhaLvFMmrWvXJQzSVQMcml7i1rkFdcT5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rH8lsCn10xgxYD8UkMBh6IPk1LCcV1IV7+wzNFuQkgA=;
 b=Y+4pNAA750dl2bZP/EjNi+xupdYF/eQdXvOBmVkgr3Y7Bh06P+IfTfjzkzTyEnMw171QyvIvlEq6kG8xDSQxKW7M6WFelKSpgXxwddNsz93aFVZprlGABpxEukSnm8QMDaYvekx8pCkd5Q4MdYTq7G6vTqSLHUWqqsAOgkoGfcoZvwYhjlJgnsJJIpmndjVS2jmKO6PJiLcllM036zvtICni6Pt8nrNjonLeth+YhXSywLU2gqm9wTRuvtazaP4Of1b0q/W3yGBP+XmMnHGsZJcX/dZs/8Ro2AhMF5yVBHXklYRIGx2ckTISl5ALOHjN0YF+C55+sfT6Dxf0IwaWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rH8lsCn10xgxYD8UkMBh6IPk1LCcV1IV7+wzNFuQkgA=;
 b=fag35qTxdVhwAINr1qBWgP/vIUktq/gnb4fsg7rRIghTRjclXedcXQHiuSS4gl9gv0IC6qA/jAmzgKnwUuxSulhV6/DM/+ZYmo1mvDP+nGhAPP8PmNaZvQAwK/NvrSyW7aATxthogHyLmbk0SCz3TskaiQduLTr88TFZtWy+SPo=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by SJ2PR12MB8928.namprd12.prod.outlook.com (2603:10b6:a03:53e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:58:39 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::2dba:b4a2:1765:9eb7]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::2dba:b4a2:1765:9eb7%6]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:58:39 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Jeff Layton
 <jlayton@kernel.org>, Lyude Paul <lyude@redhat.com>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle NULL
 state pointer
Thread-Topic: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle
 NULL state pointer
Thread-Index: AQHZbgevOkIvuDaCukWSs5CyyZSFR68qOfSggABeKQCAAAWXgIAAzaiAgAPKT4CAABbdgIAABn6AgAAGMFA=
Date: Mon, 17 Apr 2023 10:58:38 +0000
Message-ID: <CO6PR12MB548998DE5E97B8EA9EB92AA6FC9C9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230413111254.22458-1-jlayton@kernel.org>
 <87edooarpq.fsf@intel.com>
 <CADnq5_PVnYMSiKO77+cfg_V-tDKYkVJYN3qGNb1vhQO3QtXskA@mail.gmail.com>
 <CO6PR12MB5489044012B2A96639470F38FC999@CO6PR12MB5489.namprd12.prod.outlook.com>
 <4d8479f20ef30866fcf73f3602f1237376110764.camel@kernel.org>
 <878reug394.fsf@intel.com>
 <7a1b00f02b125bd65824b18ea09509efe3cf777d.camel@redhat.com>
 <874jpegao0.fsf@intel.com>
 <b99732f7c0dd968c0702ae7629695e8fb9cb573f.camel@kernel.org>
 <87leiqer8g.fsf@intel.com>
In-Reply-To: <87leiqer8g.fsf@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-04-17T10:57:53Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=41c48230-4d05-44cc-a0df-e3756e2b77ed;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|SJ2PR12MB8928:EE_
x-ms-office365-filtering-correlation-id: 021e6b08-fd9d-410e-49a5-08db3f32b2f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hOPLvNRUmwCqojePY3RFzRnVOD8FyEfh9bskCf1Lbd84cwtbnUG5oaWcT8WFq3Hu9veVbGsZmDp8WUsP4Ge6Btxp4bRr7EJTY164Ua6XzQ1M/k+qfut+tjCxOBAANNZafB29yVSquhGZkPobBUPGQqsV5an4PW1zwXzI/iJDHV4Pak6MneVde9cN95OCjIofgEOcWsLwY4zaNToWu2paiAQenXX0fg0oghOcXJLP5De02aSy1FCFdAptx3iiQ7/8vjhMVz5TwWFl1+RDSyeAtqew02x4RRWAQDP/lGLcHHS3zuPRooXazwamZo6wAbQyCW0fRsvcOAZqpBSOO8b6IGI0LPkxuSLUSSSlI2UVbc0e/DpS4VZ4RB9q2ERBxkHmfOV7MhT4t/jY3XTmKDJPumSXYODX778IfKm2zTeV/iTywtnCwgWDDjNkRlWiNi1lhRRrbGwY22VBm+rWgNaCxwN+yM6wNb3KVd8Tz8Djioz+WBbLzXyNva7/iLQr2jVS8Pi0TPIEjH228RNZprodMYxr0vVCaqAQkHZRLjbz+aXCjN6yKD57lJA4DyJPr73KSXqT1JIYa4wlBLnWhIUymCZR8PiMFIO4BN2Aa3UhFSmv0wFfv9qUEeALuqeU3jgt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(86362001)(83380400001)(38070700005)(55236004)(53546011)(6506007)(26005)(9686003)(186003)(2906002)(33656002)(7696005)(52536014)(5660300002)(64756008)(38100700002)(71200400001)(8936002)(8676002)(478600001)(122000001)(54906003)(110136005)(41300700001)(316002)(76116006)(66446008)(66946007)(66556008)(55016003)(66476007)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7whbsIc0QFqLQMgtMAIdcAYd+pPN4I/3aK80hIcZ0Qz15IR1Qip56zDZUm1t?=
 =?us-ascii?Q?OVoRTs6k1xK8+4jWBTe19lyDNLkAkBrVvtSMTlL/mzjXnokDcZpuzxvkLiLG?=
 =?us-ascii?Q?eySe1PWhsvAAUQqYb3jNKFg3bX7VZjx+iB5ZkN90sfVAZpim0ZyEExQKyoXE?=
 =?us-ascii?Q?9k06+fyhJEJQxBnqZ9B/kRM2awu2lL5dcYdmdmTEnCM4B8fCF2KRb8+NDzIR?=
 =?us-ascii?Q?vDvE2w79jHnE+ir9ZVZ+8VszgxkduelMYVpfuzGx84KnJ13v4Duqr8kfTBr0?=
 =?us-ascii?Q?k7WS2429Pv4/lQGWwewhl0viCtBURDcgCN3iVdEvtDcviWW9S6Ig/9q0IEoZ?=
 =?us-ascii?Q?OuDKB/ONdq0TpeY38HHjOmOmmfq8Gh7Pa+pMlXfzhZ4JfsfjJQ+hXUuuUtg/?=
 =?us-ascii?Q?Hwv2WyG/5haLx5xg74F1RWYOKA4tfXTmVgYCa46DYZXpk9azx+WhBeP1OURz?=
 =?us-ascii?Q?Z+JYkGlOZIhaf78AL0fonk6eKbnQ4dhMgWm8B5T0P4t1ywX32aemURgqepV+?=
 =?us-ascii?Q?yWHpvmHaGL8hUzGlnf1WZn+uRK6ZH8NgyBq3da1wQYe/aqqWJUA/extvot6g?=
 =?us-ascii?Q?DYjAk6G1Xe2wyubsBV2HEXnbEF8ceV4so37BAUYXfYC/3o85BpUql9UnKWV0?=
 =?us-ascii?Q?nUSG2txsWIOQvHd3ZSLjslUeC7uXITtUKmR2Mf3RYa6s80Ymo/g93YBr1EY4?=
 =?us-ascii?Q?HrClW8e4IgXMv6edXxWJWJb1uB4o6igziYT5J8odvI8g9Hv6i60ouxMQ0i3z?=
 =?us-ascii?Q?p+C+zzVywfg5KhaN+VLCmjichtvvd0F6Djgg0XE69vvUfZ29wYPwE2Q77Wov?=
 =?us-ascii?Q?Tk2HGNiu4y93g0ZOWJ7EfUe6QsDOZPT0t/MPAwJ3+28f81aHRpI1mDiNjaub?=
 =?us-ascii?Q?7PoBPuAA+morCW3PL0tHXJKGEhSspgsM3hrxtdLDOCAYzNpfSLewsp/YK7L7?=
 =?us-ascii?Q?9Gp1GkfR0a7acuyLR5O7efqzBLSJjXJEeR8v/8wGSMOqIt/Bo1x2yqlwRima?=
 =?us-ascii?Q?x7d7OLUD6KIqyeeDEbzh+6Q6i8KEOfRx5dvgZETuCUSCZQ1Y14lYGOiEOrdi?=
 =?us-ascii?Q?CiGAYlQFxCFCupgmcvhd3P8sDNjImh+LNqWGdPzguDCGS4CVfHDTAci3ovaZ?=
 =?us-ascii?Q?0nluXlY6Hjm6CLHP/X7lzycnqqTE89L5gBano7Ztf9ojHYwBUJJ0+QAwrl4Q?=
 =?us-ascii?Q?L6kU6/OZ81Wd2qDuYcQOyIMaJdONO1q/l3kwKL2wpiNmIqeHJF1JRXfs023P?=
 =?us-ascii?Q?5JoV5RUgdUvqB4A4muRs4jSebuuER5JE8DmV6EIlIbvfMGZW1t+RTBVOpUUp?=
 =?us-ascii?Q?M2mREd/t26rNP/+BU2V4q6Z2kUOzziFwP0U+XVJCtZDY+fiXOjLFdtWHdvtS?=
 =?us-ascii?Q?96DSwvb8CVLvNlvKqC/wD4QvGdQmkcu+seW/vav7VONWE9Wd4tOnBk3sOswq?=
 =?us-ascii?Q?fmGPSK2iRaItBsvVvw3/GnHxMOAKWTZX0/cyqsc0dHJUQwbtGWPYdQeiufc5?=
 =?us-ascii?Q?LP5bvkLOIQ5TDg7GVOzwPgo5Qvfj7X+/eWijPnxuIuOiPD3HabxTF6wxHSbr?=
 =?us-ascii?Q?1xNEt32sY3esslUAQfs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021e6b08-fd9d-410e-49a5-08db3f32b2f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 10:58:38.5802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGChfEmQPb7CC8vRRW/+lGOAdSOcUmY1jPqgB4NPv7UiitSY12XVznZRXTD+jF00R9BF0HjCOeMHg3LsX3UPBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8928
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

[AMD Official Use Only - General]



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, April 17, 2023 6:30 PM
> To: Jeff Layton <jlayton@kernel.org>; Lyude Paul <lyude@redhat.com>; Lin,
> Wayne <Wayne.Lin@amd.com>; Alex Deucher <alexdeucher@gmail.com>
> Cc: David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; linux-
> kernel@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH] drm: make drm_dp_add_payload_part2 gracefully
> handle NULL state pointer
>=20
> On Mon, 17 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> > On Mon, 2023-04-17 at 11:44 +0300, Jani Nikula wrote:
> >> On Fri, 14 Apr 2023, Lyude Paul <lyude@redhat.com> wrote:
> >> > On Fri, 2023-04-14 at 13:35 +0300, Jani Nikula wrote:
> >> > > On Fri, 14 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> >> > > > On Fri, 2023-04-14 at 04:40 +0000, Lin, Wayne wrote:
> >> > > > > [Public]
> >> > > > >
> >> > > > > Hi Jeff,
> >> > > > >
> >> > > > > Thanks. I might need more information to understand why we
> >> > > > > can't retrieve the drm atomic state. Also , "Failed to create
> >> > > > > MST payload for port" indicates error while configuring DPCD
> >> > > > > payload ID table. Could you help to provide log with KMS +
> ATOMIC + DP debug on please? Thanks in advance!
> >> > > > >
> >> > > > > Regards,
> >> > > > > Wayne
> >> > > > >
> >> > > >
> >> > > > Possibly. I'm not that familiar with display driver debugging.
> >> > > > Can you send me some directions on how to crank up that sort of
> debug logging?
> >> > > >
> >> > > > Note that this problem is _very_ intermittent too: I went about
> >> > > > 2 weeks between crashes, and then I got 3 in one day. I'd
> >> > > > rather not run with a lot of debug logging for a long time if
> >> > > > that's what this is going to require, as this is my main worksta=
tion.
> >> > > >
> >> > > > The last time I got this log message, my proposed patch did
> >> > > > prevent the box from oopsing, so I'd really like to see it go
> >> > > > in unless it's just categorically wrong for the caller to pass
> >> > > > down a NULL state pointer to drm_dp_add_payload_part2.
> >> > >
> >> > > Cc: Lyude.
> >> > >
> >> > > Looks like the state parameter was added in commit 4d07b0bc4034
> >> > > ("drm/display/dp_mst: Move all payload info into the atomic
> >> > > state") and its only use is to get at state->dev for debug logging=
.
> >> > >
> >> > > What's the plan for the parameter? Surely something more than
> >> > > that! :)
> >> >
> >> > I don't think there was any plan for that, or at least I certainly
> >> > don't even remember adding that D:. It must totally have been by
> >> > mistake and snuck by review, if that's the only thing that we're
> >> > using it for I'd say it's definitely fine to just drop it entirely
> >>
> >> I guess we could use two patches then, first replace state->dev with
> >> mgr->dev as something that can be backported as needed, and second
> >> mgr->drop
> >> the state parameter altogether.
> >>
> >> Jeff, up for it? At least the first one?
> >>
> >>
> >> BR,
> >> Jani.
> >>
> >
> > Sure. I'm happy to test patches if you send them along.
>=20
> I was hoping to lure you into sending patches. ;)
>=20
> Anyway, I'm not working on this.
>=20
>=20
Hi Jeff,

I probably know the root cause.=20
But it doesn't need to use the state in the end, I will just rely on the pa=
tch=20
that Jani suggested to fix it. I can help to provide the patch later : )

> BR,
> Jani.
>=20
> >
> > Thanks,
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center

--
Regards,
Wayne
