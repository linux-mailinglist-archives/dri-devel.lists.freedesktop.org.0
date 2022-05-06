Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8B51D1BF
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 08:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C7B10E9E7;
	Fri,  6 May 2022 06:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA7510E9A2;
 Fri,  6 May 2022 06:56:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPpqqLXeeVQoYE7XK7A8qsvIKAIVbOv6xoJYdZHYHzM09GyvYiF4vBsjw8O/w+AiHF/A94lWEpuoPpSbHFOxBfSWAQV6AorDk2bgoPUGG88x0NYsmlCrMuzvuzp8ORCuA18VxoLv7tgWb62Np4Ad3hbN8a6hppBHhvxLzHL8jzir5Vdgs7PdrHsX9P/eI7OiWX5H6ocFLoO0ZYrK92KMgNB3znDNo4ShJjXx5OYEh4N5LesQytrSPQ+NmmhWzeoL2VfMqU03cgn6CfCUJwIXlTvxN0JzNlDJYPrJ6wkDQGuNNWx6wvY3UXhDHfoc8iEkQOImNrfWPnKL5CUVv1chSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzzPBeF5uqK4o1bBjWL4AQ4eTD14KpyELR7zXv5pWfY=;
 b=QpN+mhI+5InipW7YjRnt6dYcYZnZeqdPOTuhATnvB/W1NlNmJ6+0sLK3qvdoL+C+GduvdEd7aq2FO69c8IuMBek7748hbFpYPKY3J51CWiSO56p1L+1AW2cGCJXXKtCEHqtYoaExAYQCtj+nF3lOFUQwOIAw7gtLrEbWomqmNXFOYP2J2m8E/bGWdjj6BO/nNzdZqFk6MUGaNME1A3QJ00+yp2uHyxzN20AN+VnC4A1nAthalF4euhwizxDJ+IFzF1ksD6dPrZVSvworHAuPPeO+1LBohQIGFnjriQEsmWbLCccb8tlIVqNnVLtv7r68dVCNcCLB/C8By+aGmLhE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzzPBeF5uqK4o1bBjWL4AQ4eTD14KpyELR7zXv5pWfY=;
 b=HB5GtJlzfttqEUb5yWi0MeNJl19mIw3QqlUuxzZT77GrCnzxGee31JMjWlYkMCNvPpSD93xVykjsjwS4q6lfSE2h65rW08P1OXzKMEPKaezAMOmbxJX8Pu0veT+p+/xeVecZQc0Tbkb1dNOGTXSNvTLaPO8HTg5laow+ED2jgsI=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by BN7PR12MB2788.namprd12.prod.outlook.com (2603:10b6:408:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 06:56:45 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::1c90:f807:7b0b:a862]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::1c90:f807:7b0b:a862%8]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 06:56:45 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: 'Lyude Paul' <lyude@redhat.com>
Subject: RE: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
 histories from debugfs
Thread-Topic: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
 histories from debugfs
Thread-Index: AQHX0D+AE15V0cuVgkqFgVkq+XJhhqwbv0zAgAwd2gCAAEwcgIASwW2ggCVww4CACbQzgIAJv2yQgA1ywICAIuyLMIABQxUAgATGo4CAAcvdAIAJb+bAgAyKrgCAAKMZMIA30wAAgAas6ZCAEWl5MA==
Date: Fri, 6 May 2022 06:56:44 +0000
Message-ID: <CO6PR12MB5489700C0B9B5143FBE526A9FCC59@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20211102231502.286654-1-lyude@redhat.com>
 <CO6PR12MB54896F2BBF20F6C04D187D1AFC679@CO6PR12MB5489.namprd12.prod.outlook.com>
 <37497a7c6ce031bf4c99decdd4eecfacf95969b5.camel@redhat.com>
 <CO6PR12MB5489E282DA251241843EF4E4FC6F9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <CO6PR12MB5489D4C51655B1D8B817A50FFC7B9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <4074c2ad21ebe692022d4e097209910e9f32383e.camel@redhat.com>
 <4516b3a53a7d673ff451ca4c7542b40f4e10713a.camel@redhat.com>
 <CO6PR12MB54899D612BCEB3D485367045FC5F9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ad5c80b1f9bd0087b87903b0156bdfa80b8043ca.camel@redhat.com>
 <CO6PR12MB5489AA5549DC251E202BD58AFC3E9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <660715cddbf8284531972c77ee16570ea6d66267.camel@redhat.com>
 <55113c2ddb041bf73b9363df94cca9544aa7f9bb.camel@redhat.com>
 <4607907a7cf6937b2c2fee1b7c0ce077e8f3d10c.camel@redhat.com>
 <CO6PR12MB54892DC34D5D2FA0886657BFFC099@CO6PR12MB5489.namprd12.prod.outlook.com>
 <c0e30cebdf986ff3a70a9941148002bd32f26fe2.camel@redhat.com>
 <CO6PR12MB54895A5B1E30DC619B95C7ABFC119@CO6PR12MB5489.namprd12.prod.outlook.com>
 <9930fd40c7b7877fcf20d7483916a9090245dbd5.camel@redhat.com>
 <CO6PR12MB54892529AAE073053489DF9FFCF89@CO6PR12MB5489.namprd12.prod.outlook.com>
In-Reply-To: <CO6PR12MB54892529AAE073053489DF9FFCF89@CO6PR12MB5489.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-05-06T06:56:40Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=9f5c7889-a5d2-4024-a39c-7d62324cb6c3;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17e52184-8daa-4c1b-0f70-08da2f2d952e
x-ms-traffictypediagnostic: BN7PR12MB2788:EE_
x-microsoft-antispam-prvs: <BN7PR12MB27880D434CB1820A785BFEAFFCC59@BN7PR12MB2788.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ulTALUrWsQqooXFLM2Yl+UzdrwZx5KdeDMlN0Iq5eYrUA/q4ogg/PWaf9Sp4RX2k6CFMV1clLzHX7JmiWoMVn8O+ygkyqX/aYKsp8TNLgDYSsPptitXdvOkTaZ+aFWN4NbXJKgrLstz0s5k2beV4tTqIxYGCDiF/cuyuVBFYmmsZbfSN1d3/77SjVFIwmsUbwb74m88qD8m7wRSHB61/u9h7coHh3tzGOqnrNF30RT+vwamAZzpgDyoE6Wde1PTCUZSgL551eo+8yV5iq5HylO2hdzNTV/Hekkfz1ahvSWiIU/pXDDy3hnJHtE+HpQX9CUSw4B+/o67Dx7z4af9I8X/QUAb1JV49cJ5wHjlJ6WnkW5A0oAzB861AeQ/oLGMiwIFOzFoVO6BnBaSQXEiBmvehbOnzajEGrvWA1IWViLLERPGGTbrgOwId3PgLQf2bifZ63CSQPbtH78/gLH3AoBiNbd/uc83AkRIWWx+2aTga0FZcRaXAgUoOel0RiLrOtfnvmPNkDVcd679oMV8dlNte/FEe3gfiVADxndLMctu8pB3Sdl9/91aPp3DUdLdNsi5Ktu32g+jIojeSw4/MVN9eu9ueycj/B4exfYC6T7nVLz3B9DsHWfcDLfkm4gBqpqgbvBzx6Skays144DQVZ7BLqwaCOmQdtYMi9azyeU93Bx83QL1eJ+FwDPh1hq3oBHa+SFCAueagiMBn38G8a0uBpkowwKVfCbx7mucbaYycEO3mNpxhoDs8noZnhRQlCNM4toZ2A1xxzbVDbNf2tHM7Gqd56puGDFV8luGqrgr83FS4dXJ5+poq87tEgdNquT+TQMYSblJ1ms/5lQzINw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(4326008)(8676002)(66556008)(71200400001)(64756008)(66476007)(55016003)(86362001)(66446008)(66946007)(508600001)(2906002)(6506007)(26005)(45080400002)(76116006)(122000001)(53546011)(7696005)(52536014)(9686003)(186003)(54906003)(30864003)(6916009)(83380400001)(4001150100001)(8936002)(38070700005)(38100700002)(5660300002)(19627235002)(33656002)(316002)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HIOxde2y1cW00sFvGfLoW8GmylXk4yv0Nv6IGtIuQPpNzFCrPt6WrLl5Fp?=
 =?iso-8859-1?Q?DfIpVHhJO5/xjQDN1jEYvS+rVeplHuYLv3OTP71HNSUXGLDDzS+XOSI3hn?=
 =?iso-8859-1?Q?pVh0VV/kRntO8KR++cvjK8J/Y+8G9Ze9YQur+rsGiRfZDTwbMlj3/pOUpJ?=
 =?iso-8859-1?Q?Ns6cW230Q4tUJ+Ej7FxyuEJY/vBISz2m94TTtVdLXhNDSDI3psVr1X0XeU?=
 =?iso-8859-1?Q?z7Uf8Xbfikyup7sOFLPubH6TMsNHo4s3n95uC9twFcPV2BSv/dK48oCt8m?=
 =?iso-8859-1?Q?HdbkKQuGv7gYmi1epG1luELksnT+UD7QGdh8kzyY614mDvebkE9GbXCOza?=
 =?iso-8859-1?Q?F7yBgwD2sX/8hwN6eojWyFY7vXwmx23z6KjCfKaM8GEmE1lksIEwnHM0wt?=
 =?iso-8859-1?Q?Ourcbtbwl3lWS/0ROwyIyOXOtGza11LqBWQOM5BQOmzASK804VFmN2bdXh?=
 =?iso-8859-1?Q?maWP5quT/mvXq9H6sSo95Dr6dHHoay1oE8R0+hMto2tRE3lQJ7jjRCqs53?=
 =?iso-8859-1?Q?IbPpbAqqWeKOdQJoY3+PxEmJBXYdgVQP8trU3cx7rn0Rmg7VtM0tf1njor?=
 =?iso-8859-1?Q?Y1s7lkgNZk9fg5JWjWVfMntpYO/nETUPMfCZy4izEP6QImI8HFJbNA9uzA?=
 =?iso-8859-1?Q?bO5BKdFjBaLYEhHIHI2vGfpBHIKh8pTcMPuymCl4hWyP1TAO8M2Koyx/Iy?=
 =?iso-8859-1?Q?gOKEftHD10fAS+00bKMoKPBj46jmHtBxDH0+lfPGdUS75RQ1Gic2qH6APz?=
 =?iso-8859-1?Q?Ru79DKix/746gTbRhszD1kVuJUb/tMwI/DWiegvT36kpLnPMdqbneSfNh/?=
 =?iso-8859-1?Q?Q7sZqL9+1xru6vuokPUfembqHLbgf7X+tUHWj9RAlWbXXspits/YavJHRw?=
 =?iso-8859-1?Q?jk6XKw07+LO6H1UOKNfzzEnvg1QuODGQDAA47RlZHy77SiGaS6JaDzw+EC?=
 =?iso-8859-1?Q?J2yai1JFjYQqZVn0ljYzZDsk0/OhkxCu4Yj812eo/KOPwZNy+uwO9MBU/c?=
 =?iso-8859-1?Q?yVeg2rf7ffOgCDFq2q6np3wvstx4HkRTvrSGaxRSh9AsKZPCigzIev3KGO?=
 =?iso-8859-1?Q?77nH8yJ1JWLMlZIVExcjCi96a+fAkDF4KTY4OWAViVsi63Jp/labFnE9mQ?=
 =?iso-8859-1?Q?71SXQS2DQ6t6Aop46huVVx703fW65Kya6hJDR/jlNZra2NPxAb6qnW68RN?=
 =?iso-8859-1?Q?niLC/WDixSKkn2RAMpdiuHi3eRRoTXcPH7yg/KoRW2EtKiIQcQeND8D/JB?=
 =?iso-8859-1?Q?kyzPSngD5ErR+Wv0X2Vig5O6pxjVBTTk98sKYlpRYPTyT+9mhwNtRMSVg2?=
 =?iso-8859-1?Q?FV5PrFKDJmrkBe00AnjTc2WrFPXXlci6VUDif5rkJ0h8Z4GbJbWZvqKD0R?=
 =?iso-8859-1?Q?RYgReCksU69SDdSLaXq+FviCbCJLo0QgATk1uKaKp9mnZ5WByfd8QL1Ex0?=
 =?iso-8859-1?Q?DmemntyYUAFfnU+56bd76V235igXfhfetfoNDXhgjMO5uchRPmT6rdtCSd?=
 =?iso-8859-1?Q?oQhEkvLQ4u6IISiALDcfH7QSHkL5QtBL2/teUed6on2hSar76TqXJu1bsT?=
 =?iso-8859-1?Q?TM1y+rwivHJT6nesyu8q0okjq/aY8hRiqUCcFtgYGkCE7XwOzzU4DeUOdh?=
 =?iso-8859-1?Q?4agxE42DeiG1lqwPeg+p9IJKR9gWZPOH89zHAM7uz0rPksnMcraoZRaYuP?=
 =?iso-8859-1?Q?G+ydBTew8bbqiCIkCfSaoPgAqLWadDorphFN6Lcx/FrLiAxJ0fbDCPllNP?=
 =?iso-8859-1?Q?b/+OHB9RN5co0tsWrpbXu/GZlnZpE3bCei9wCumMNGuzhrfjInQRrkcCCw?=
 =?iso-8859-1?Q?LZjQD17QtQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e52184-8daa-4c1b-0f70-08da2f2d952e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 06:56:44.8892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bcKZWPD7NVornXhMCt73TohF59O0rPR5A9DklgcwgFQBAAbWdwFWpNMwi6rB2RmvjDhJigKWbKfMBwCU6jSvLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2788
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
Cc: "'amd-gfx@lists.freedesktop.org'" <amd-gfx@lists.freedesktop.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Hi Lyude,

Just a heads-up that I should be able to push my patch set out for code rev=
iew
next week. Thanks for your kind help all the time!

Regards,
Wayne

> -----Original Message-----
> From: Lin, Wayne
> Sent: Monday, April 25, 2022 1:02 PM
> To: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Subject: RE: [PATCH] WIP: drm/dp_mst: Add support for dumping topology
> ref histories from debugfs
>=20
> Thank you Lyude!
>=20
> I just have a tentative patch set to deal with this. Would like to give a=
 test on
> some platforms first.
> If the result is positive, will send out for review immediately.
>=20
> Thanks for tracking on this : )
>=20
> Regards,
> Wayne Lin
>=20
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Thursday, April 21, 2022 7:01 AM
> > To: Lin, Wayne <Wayne.Lin@amd.com>
> > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping topology
> ref histories from debugfs
> >
> > Hey! Figured I'd check if there's been any status updates here since it=
's
> been
> > a while, just to make sure I haven't dropped this issue from my radar. =
No
> > problem if you're busy :)
> >
> > On Wed, 2022-03-16 at 10:46 +0000, Lin, Wayne wrote:
> > > [Public]
> > >
> > > > -----Original Message-----
> > > > From: Lyude Paul <lyude@redhat.com>
> > > > Sent: Wednesday, March 16, 2022 8:48 AM
> > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping
> topology ref
> > > > histories from debugfs
> > > >
> > > > (Adding this back to the dri-devel mailing list since I didn't noti=
ce it
> > > > got
> > > > dropped from there)
> > > >
> > > > Hm, some comments on this issue down below. Sorry for the delayed
> > > > response, I
> > > > was going to try this right after I finished the MST legacy removal=
 but
> > > > that's
> > > > ending up taking longer than I hoped.
> > > >
> > > > On Tue, 2022-03-08 at 01:46 +0000, Lin, Wayne wrote:
> > > > > [AMD Official Use Only]
> > > > >
> > > > > Oops...
> > > > > I didn't notice that I replied to wrong mail previously : P
> > > > > Sorry for the confusion and reply to the correct thread.
> > > > >
> > > > > Good day!
> > > > > I probably know why you can't reproduce the issue there. Please
> refer to
> > > > > the
> > > > > attached
> > > > > patch file which makes me easier to explain this.
> > > > >
> > > > > In dm_dp_mst_get_modes(), we will create a new dc_sink by calling
> > > > > dc_link_add_remote_sink() and add that dc_sink into the array
> dc_link-
> > > > > > remote_sinks[].
> > > > > However, if we find that aconnector->dc_sink is not null, then we
> won't
> > > > > create a new
> > > > > dc_sink for that aconnector and won't add the sink to the array
> dc_link-
> > > > > > remote_sinks[].
> > > > >
> > > > > When the issue that I mentioned before occurs, we won't be able t=
o
> > > > > release
> > > > > the dc_sink
> > > > > for the aconnector when we unplug the sst monitor. Hence, we can'=
t
> > > > > create
> > > > > new dc_sink
> > > > > for the latter on connected new stream sink of that port. Which l=
eads
> to
> > > > > two
> > > > > issues
> > > > > 1. Unplug monitor and plug in another monitor "to the same port"
> > > > > =3D>=A0 Since we use the same dc_sink to reflect the capability o=
f the new
> > > > > connected stream
> > > > > sink, we might send out inappropriate stream to the new connected
> sink.
> > > > > 2. Because we can't release dc_sink in the array dc_link-
> > > > > >remote_sinks[],
> > > > > when we
> > > > > plug/unplug sst monitor to more than 4 different mst port, we wil=
l
> break
> > > > > the
> > > > > criteria
> > > > > "dc_link->sink_count >=3D MAX_SINKS_PER_LINK" in
> > > > > link_add_remote_sink_helper().
> > > >
> > > > Ok, a lot of this seems to be happening in amdgpu which certainly
> explains
> > > > why
> > > > I had so much trouble following along with this originally (also, h=
aving
> > > > learned a bit more about how DC works definitely has helped a bit).=
 I
> > > > already
> > > > see a bunch of issues though with how this code is structured that
> would
> > > > definitely break things, though note I haven't sat down and tried t=
his on
> > > > a
> > > > real machine yet - will try tomorrow.
> > > >
> > > > So - it seems like dc_sink =3D=3D a bunch of hotplugging state for =
a dm
> > > > connector,
> > > > which actually tells me for one that this is definitely the wrong s=
pot for
> > > > this code. get_modes() really should just handle filling out DRM mo=
des
> and
> > > > pretty much nothing else, because callers from DRM aren't going to
> expect
> > > > side-effects like this when get_modes() is called - which could
> > > > potentially
> > > > lead to all sorts of weirdness down the line if the DRM call paths =
that
> > > > use
> > > > this ever change. i915 and nouveau have good examples of what these
> > > > functions
> > > > should typically look like, and amdgpu actually seems to mostly fol=
low
> > > > this
> > > > advice for it's other get_modes() callback.
> > > >
> > > > Note there's also another problem here: the assumption "no EDID =3D=
=3D
> > > > disconnected" isn't correct. It's totally possible to run into EDID=
-less
> > > > displays if the display is some ancient pre-historic relic, or if t=
he ROM
> > > > (or
> > > > EEPROM? can't remember what type of chip computer displays tend to
> use...)
> > > > chip
> > > > in the monitor containing the EDID has died. Note that the second
> > > > situation is
> > > > suprisingly more common then one might think! I ran into a 140Hz 4k
> ASUS
> > > > display where this happened, and I know another friend of mine who
> had the
> > > > ROM
> > > > in their display die randomly as well.
> > > >
> > > > So with this being said: I, think the solution here is actually jus=
t to
> > > > add/remove dc_sink from dm_dp_mst_detect() based on the CSN, and
> drop the
> > > > calls from get_modes()? detect() should always be called before the
> > > > connector
> > > > has been removed, and we could use the return status from
> > > > drm_dp_mst_detect_port() in order to tell whether or not we should
> > > > add/remove
> > > > the dc_sink.
> > >
> > > Thank you Lyude for guiding me through! After your elaboration, I thi=
nk I
> > > roughly
> > > know the idea from drm perspective now. Let me get through this and
> will get
> > > back
> > > to you.
> > >
> > > >
> > > > If you don't get to it first tomorrow, I'll see if I can reproduce =
this
> > > > locally and try writing up a patch.
> > > >
> > > > Also a final note: I don't think it's a good idea in general for th=
ere to
> > > > be a
> > > > fixed size array of dc_sinks like this. Those probably should just =
be
> > > > stored
> > > > somehow on a per-connector basis. I say this because in addition to=
 the
> > > > fact
> > >
> > > Understand and agree with that. I plan to remove the constraint as we=
ll.
> > > Thanks!
> > >
> > > > MST connectors aren't destroyed immediately (which could lead to a
> > > > situation
> > > > where we have more then 6 connected MST ports briefly before their
> > > > destructors
> > > > run, e.g. during suspend/resume reprobing).
> > > >
> > > > Also, one question below:
> > > > >
> > > > > Anyway, these are my steps to reproduce the issue.
> > > > > I use a startech mst 1to4 mst hub, a sst monitor and a mst monito=
r.
> > > > >
> > > > > 1. boot up with sst monitor connected to the hub and plug the hub=
 to
> the
> > > > > system.
> > > > > 2. unplug/plug sst monitor to all left three different DP output =
ports.
> > > > > Which is used to
> > > > > Pollute all four aconnectors to have them keep the stale dc_sinks=
.
> > > > > 3. plug in the mst monitor to arbitrary ports. Since the new conn=
ected
> > > > > mst
> > > > > monitor will
> > > > > have us add new mst port to the topology and attach a new
> aconnector for
> > > > > that mst port,
> > > > > we'll try to create a new dc_sink to that new aconnector and brea=
k
> the
> > > > > sink_count
> > > > > limitation. As you can see in the log the error message : "*ERROR=
*
> > > > > Unable to
> > > > > add a
> > > > > remote sink"
> > > > >
> > > > > (Note that different hub might influence the result. Some hubs wi=
ll
> pull
> > > > > down the HPD
> > > > > when there is no monitor connected to its downstream ports which
> will
> > > > > run
> > > > > into different
> > > > > code flow)
> > > >
> > > > by "pull down" I assume you mean doing a long HPD instead of short =
(or
> > > > vice
> > > > versa?).
> > >
> > > Yes, long HPD!
> > >
> > > Thanks for your help Lyude!
> > > >
> > > > >
> > > > > I also attach the dmesg log under different debug level (0x104 &
> 0x116)
> > > > > for
> > > > > your reference.
> > > > >
> > > > > Please let me know if you can reproduce then : )
> > > > >
> > > > > Sorry about that Lyude and hope this time I send to the right thr=
ead..
> > > > > Really appreciate for your help!!!
> > > > >
> > > > > Regards,
> > > > > Wayne
> > > > > > -----Original Message-----
> > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > Sent: Wednesday, March 2, 2022 9:10 AM
> > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping
> topology
> > > > > > ref
> > > > > > histories from debugfs
> > > > > >
> > > > > > Ran into some issues with my system yesterday (hooray being the
> first
> > > > > > to
> > > > > > find
> > > > > > a rather annoying zsh bug that broke my scripts!), but I've fin=
ally
> > > > > > got
> > > > > > things
> > > > > > setup. I'm not able to reproduce this issue though (I've tried
> > > > > > hotplugging
> > > > > > the
> > > > > > way you mentioned here, but nothing seems to leak), which makes
> me
> > > > > > think
> > > > > > there's something special in your setup we might not have notic=
ed.
> > > > > >
> > > > > > Do you think you could get some drm logs with drm.debug=3D0x116
> > > > > > log_buf_len=3D50M
> > > > > > from when this happens so I can get a better idea of the drm ev=
ents
> > > > > > leading up
> > > > > > to this? Also, if you've been testing this in a GUI could you c=
onfirm
> > > > > > whether
> > > > > > this happens when you're just in a plain old VT?
> > > > > >
> > > > > > On Mon, 2022-02-28 at 16:43 -0500, Lyude Paul wrote:
> > > > > > > Alright - starting to look into this now and setting up a sys=
tem to
> > > > > > > try
> > > > > > > reproducing this, will let you know as soon as I've got resul=
ts.
> > > > > > > Sorry
> > > > > > > again
> > > > > > > about all of the delays
> > > > > > >
> > > > > > > On Fri, 2022-02-25 at 15:47 -0500, Lyude Paul wrote:
> > > > > > > > I didn't get a chance yet, but I've gotten through most of =
my
> > > > > > > > backlog
> > > > > > > > now.
> > > > > > > > Sorry about the delay - I've been catching up since I had t=
o take
> > > > > > > > two
> > > > > > > > weeks
> > > > > > > > off work very unexpectedly. I'll put aside time to look at =
this
> > > > > > > > first
> > > > > > > > thing
> > > > > > > > monday.
> > > > > > > >
> > > > > > > > On Fri, 2022-02-25 at 01:33 +0000, Lin, Wayne wrote:
> > > > > > > > > [AMD Official Use Only]
> > > > > > > > >
> > > > > > > > > Hi Lyude,
> > > > > > > > >
> > > > > > > > > Good day!
> > > > > > > > > Sorry to bother you, but would like to know if you can
> reproduce
> > > > > > > > > the
> > > > > > > > > issue?
> > > > > > > > >
> > > > > > > > > Thanks!
> > > > > > > > >
> > > > > > > > > Regards,
> > > > > > > > > Wayne
> > > > > > > > >
> > > > > > > > > > -----Original Message-----
> > > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > Sent: Thursday, February 3, 2022 4:12 AM
> > > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for
> dumping
> > > > > > > > > > topology
> > > > > > > > > > ref
> > > > > > > > > > histories from debugfs
> > > > > > > > > >
> > > > > > > > > > JFYI I should be able to respond to this soon, I think =
I'm
> > > > > > > > > > following
> > > > > > > > > > your
> > > > > > > > > > issue a bit more (haven't gotten to go through the patc=
hes
> too
> > > > > > > > > > so
> > > > > > > > > > I'm
> > > > > > > > > > probably
> > > > > > > > > > going to see if I can reproduce it locally as well. Sor=
ry for
> > > > > > > > > > the
> > > > > > > > > > delay
> > > > > > > > > > -
> > > > > > > > > > dealing with some X.org stuff and work issues at the
> moment
> > > > > > > > > >
> > > > > > > > > > On Tue, 2022-01-25 at 08:32 +0000, Lin, Wayne wrote:
> > > > > > > > > > > [Public]
> > > > > > > > > > >
> > > > > > > > > > > Hey Lyude,
> > > > > > > > > > >
> > > > > > > > > > > Sorry, just got chance to get back to this and BIG TH=
ANKS
> to
> > > > > > > > > > > elaborating
> > > > > > > > > > > in
> > > > > > > > > > > such details!
> > > > > > > > > > > Following are some of my comments : )
> > > > > > > > > > >
> > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > > Sent: Wednesday, January 19, 2022 9:59 AM
> > > > > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support f=
or
> > > > > > > > > > > > dumping
> > > > > > > > > > > > topology
> > > > > > > > > > > > ref
> > > > > > > > > > > > histories from debugfs
> > > > > > > > > > > >
> > > > > > > > > > > > Hey - so, the original issue here was that payloads=
 were
> > > > > > > > > > > > not
> > > > > > > > > > > > always
> > > > > > > > > > > > deleted when we expected them to be - correct?
> > > > > > > > > > >
> > > > > > > > > > > Actually, what I was trying to do is not relevant to =
payload
> > > > > > > > > > > maintenance.
> > > > > > > > > > > What I wanted to do is having a way to notify
> > > > > > > > > > > amdgpu to release its enumerated resource "dc_sink"
> when
> > > > > > > > > > > unplug
> > > > > > > > > > > event
> > > > > > > > > > > occurs. Currently, under specific scenarios,
> > > > > > > > > > > we can't release remote "dc_sink" and ends up can't
> allocate
> > > > > > > > > > > resource
> > > > > > > > > > > for
> > > > > > > > > > > new connected monitors. I'll explain the scenario
> > > > > > > > > > > underneath.
> > > > > > > > > > >
> > > > > > > > > > > So, get back to the main issue that I was trying to s=
olve
> > > > > > > > > > > when I
> > > > > > > > > > > pushed
> > > > > > > > > > > the
> > > > > > > > > > > patchset:
> > > > > > > > > > >
> > > > > >
> > > >
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatc
> hwork.kernel.org%2Fproject%2Fdri&amp;data=3D05%7C01
> >
> %7Cwayne.lin%40amd.com%7C5f734314a44c4f8f82b908da2321b4c2%7C3dd8
> 961fe4884e608e11a82d994e183d%7C0%7C0%7C63786092
> >
> 4939974636%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000
> >
> %7C%7C%7C&amp;sdata=3DVtrMzZ2Evr%2BRCUCHIAUPUxqsRuuH9CW3jrNczu
> bY%2BFc%3D&amp;reserved=3D0
> > > >
> ayne.lin%40amd.com%7Cd77e829cfd3a466e25e508da06e6a9dd%7C3dd8961f
> e4884e608e
> > > > 11a82d994e183d%7C0%7C0%7C637829885024
> > > >
> 474689%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
> luMzIiLCJBTiI
> > > > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> > > >
> ta=3DMvKilTT1CkBqZVK1N24JyNPjiPYORV%2FsCwvEzwx%2FIAk%3D&amp;rese
> rved=3D0
> > > > > >
> ayne.lin%40amd.com%7Cbbc27043edc04bf8067c08d9fbe9620c%7C3dd8961fe
> 4884e
> > > > > > 608e
> > > > > > 11a82d994e183d%7C0%7C0%7C6378178020798
> > > > > >
> 98960%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
> uMzIiLCJB
> > > > > > TiI6
> > > > > > Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat
> > > > > >
> a=3DRVUc8KgTO3mhFL9qemshHJqiyXJs%2Fvytx21AMyUaW%2Bs%3D&amp;res
> erved=3D0
> > > > > > > > > > > -
> > > > > > > > > > devel%2Fcover%2F20210720160342.11415-1-
> > > > > > > > > >
> Wayne.Lin%40amd.com%2F&amp;data=3D04%7C01%7Cwayne.lin%40amd.com
> %
> > > > > > > > > > 7C2e
> > > > > > > > > > 19d9
> > > > > > > > > > 32
> > > > > > > > > > 1b
> > > > > > > > > > 5f4e948c1208d9e6884f24%7C3dd8961fe488
> > > > > > > > > >
> 4e608e11a82d994e183d%7C0%7C0%7C637794295422403301%7CUnknown%7
> C
> > > > > > > > > > TWFp
> > > > > > > > > > bGZs
> > > > > > > > > > b3
> > > > > > > > > > d8
> > > > > > > > > > eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> > > > > > > > > >
> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DrvtwQioO3pT1BoH
> > > > > > > > > > b7S5
> > > > > > > > > > 32ms
> > > > > > > > > > Ra
> > > > > > > > > > 61
> > > > > > > > > > gP1vIyE8AB7M9I4E%3D&amp;reserved=3D0
> > > > > > > > > > >
> > > > > > > > > > > I was trying to fix some problems that I observed aft=
er
> > > > > > > > > > > these 2
> > > > > > > > > > > patches
> > > > > > > > > > > * 09b974e8983 drm/amd/amdgpu_dm/mst: Remove -
> > > > > > > > > > > > destroy_connector()
> > > > > > > > > > > callback
> > > > > > > > > > > * 72dc0f51591 drm/dp_mst: Remove
> > > > > > > > > > > drm_dp_mst_topology_cbs.destroy_connector
> > > > > > > > > > >
> > > > > > > > > > > With above patches, it changes our flow to remove dc_=
sink
> > > > > > > > > > > (by
> > > > > > > > > > > calling
> > > > > > > > > > > dc_link_remote_sink()) when connector is about to be
> > > > > > > > > > > destroyed. And let's see below use cases:
> > > > > > > > > > > a). Disconnection happens between mst branch devices
> > > > > > > > > > > e.g.
> > > > > > > > > > > src - 1st_mstb - 2nd_mstb - sst_monitor =3D> src - 1s=
t_mstb
> > > > > > > > > > > (disconnect)
> > > > > > > > > > > 2nd_mstb - sst_monitor
> > > > > > > > > > >
> > > > > > > > > > > In above case, after receiving CSN, we will put topol=
ogy
> > > > > > > > > > > reference
> > > > > > > > > > > count
> > > > > > > > > > > of
> > > > > > > > > > > 2nd mstb and its port which connected to the sst moni=
tor.
> > > > > > > > > > > As you suggested before, we will destroy 2nd mst bran=
ch
> > > > > > > > > > > device
> > > > > > > > > > > and
> > > > > > > > > > > its
> > > > > > > > > > > all
> > > > > > > > > > > ports due to there is no more mst path can route to t=
hem.
> > > > > > > > > > > As the result of that, we at end call
> > > > > > > > > > > drm_dp_delayed_destroy_port()
> > > > > > > > > > > and
> > > > > > > > > > > unregister/put the drm connector and eventually call
> > > > > > > > > > > =A0dc_link_remote_sink() to release the dc_sinck we
> enumerate
> > > > > > > > > > > for
> > > > > > > > > > > the
> > > > > > > > > > > specific
> > > > > > > > > > > stream sink of sst_monitor.
> > > > > > > > > > >
> > > > > > > > > > > However, in below case:
> > > > > > > > > > > b). Disconnection happens between mst branch devices
> and SST
> > > > > > > > > > > monitor
> > > > > > > > > > > e.g.
> > > > > > > > > > > src - 1st_mstb - sst_monitor =3D> src - 1st_mstb (dis=
connect)
> > > > > > > > > > > sst_monitor
> > > > > > > > > > >
> > > > > > > > > > > In this case, which is the case having problem, it
> > > > > > > > > > > definitely
> > > > > > > > > > > won't
> > > > > > > > > > > decrease
> > > > > > > > > > > the topology references count of the port of 1st_mstb
> which
> > > > > > > > > > > was connected to the sst monitor to zero since the po=
rt is
> > > > > > > > > > > still
> > > > > > > > > > > existing in
> > > > > > > > > > > the topology. Same as the malloc reference since the =
port
> > > > > > > > > > > can't
> > > > > > > > > > > get
> > > > > > > > > > > destroyed. Hence, the port still exists and we won't =
call
> > > > > > > > > > > drm_dp_delayed_destroy_port() to unregister and put
> the drm
> > > > > > > > > > > connector.
> > > > > > > > > > > As
> > > > > > > > > > > the
> > > > > > > > > > > result of that, we can't release corresponding remote
> > > > > > > > > > > dc_sink
> > > > > > > > > > > under
> > > > > > > > > > > this
> > > > > > > > > > > case. And after few times hotplugs, we can't create a=
ny
> new
> > > > > > > > > > > dc_sink since the number of stream sink is exceeding =
our
> > > > > > > > > > > limitation.
> > > > > > > > > > >
> > > > > > > > > > > Hence, what I'm thinking here is to register a callba=
ck
> > > > > > > > > > > function
> > > > > > > > > > > for
> > > > > > > > > > > notifying us that the remote sink is detached. This j=
ust
> > > > > > > > > > > aligns
> > > > > > > > > > > what
> > > > > > > > > > > we
> > > > > > > > > > > do
> > > > > > > > > > > for handling long HPD event (unplug monitor from syst=
em)
> of
> > > > > > > > > > > legacy
> > > > > > > > > > > DP
> > > > > > > > > > > (none
> > > > > > > > > > > mst). For which case, once we detect long HPD event
> > > > > > > > > > > indicating the monitor is detached, we will immediate=
ly try
> > > > > > > > > > > to
> > > > > > > > > > > release
> > > > > > > > > > > the
> > > > > > > > > > > dc_link->local_sink and fire hotplug event to upper l=
ayer.
> > > > > > > > > > > Same as here, once receives a CSN message notifying a
> drm
> > > > > > > > > > > connector
> > > > > > > > > > > is
> > > > > > > > > > > changed from connected to disconnected, trigger the
> callback
> > > > > > > > > > > function and we can try to release the dc_sink resour=
ce.
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > If I'm remembering that correctly, then (and I'm no=
t
> 100%
> > > > > > > > > > > > sure
> > > > > > > > > > > > on
> > > > > > > > > > > > this
> > > > > > > > > > > > yet) I might already have noticed something very
> possibly
> > > > > > > > > > > > wonky in
> > > > > > > > > > > > how we handle payload allocations currently, that I=
 found
> > > > > > > > > > > > while
> > > > > > > > > > > > working on
> > > > > > > > > > > > the non-atomic removal branch that I linked to you =
in my
> > > > > > > > > > > > previous response. Basically, in the
> > > > > > > > > > > > step1() function it looks like that we follow this =
general
> > > > > > > > > > > > flow
> > > > > > > > > > > > with
> > > > > > > > > > > > updating
> > > > > > > > > > > > payloads:
> > > > > > > > > > > >
> > > > > > > > > > > > =A0* Loop through proposed payloads and compare to
> > > > > > > > > > > > previously
> > > > > > > > > > > > programmed
> > > > > > > > > > > > =A0=A0 payloads
> > > > > > > > > > > > =A0=A0=A0 - If a payload has a different allocation=
 then it
> > > > > > > > > > > > previously
> > > > > > > > > > > > did,
> > > > > > > > > > > > update the
> > > > > > > > > > > > =A0=A0=A0=A0=A0 payload
> > > > > > > > > > > > =A0=A0=A0 - If the payload is new, create it
> > > > > > > > > > > > =A0=A0=A0 - If a payload no longer has an allocatio=
n, remove the
> > > > > > > > > > > > payload
> > > > > > > > > > > >
> > > > > > > > > > > > At first glance this seems totally correct - but I'=
m not
> > > > > > > > > > > > actually
> > > > > > > > > > > > entirely
> > > > > > > > > > > > convinced it is? Particularly because it seems like=
 the
> > > > > > > > > > > > order
> > > > > > > > > > > > in
> > > > > > > > > > > > which
> > > > > > > > > > > > we do creation/deletion of payloads is totally arbi=
trary.
> > > > > > > > > > > > To
> > > > > > > > > > > > explain
> > > > > > > > > > > > what
> > > > > > > > > > > > I mean by that, consider a state transition like th=
is:
> > > > > > > > > > > >
> > > > > > > > > > > > vcpi_slots=3D15 vcpi_slots=3D35 vcpi_slots=3D14
> > > > > > > > > > > > > 1 | 2 |xxxxxxxx|
> > > > > > > > > > > >
> > > > > > > > > > > > Let's say we want to increase payload #1 from 15 to=
 50,
> > > > > > > > > > > > and
> > > > > > > > > > > > disable
> > > > > > > > > > > > payload #2 in the same atomic commit on DRM's side.=
 If
> the
> > > > > > > > > > > > order
> > > > > > > > > > > > we
> > > > > > > > > > > > update payloads is entirely arbitrary, we could end=
 up
> > > > > > > > > > > > doing
> > > > > > > > > > > > this:
> > > > > > > > > > > >
> > > > > > > > > > > > =A0* Increase VCPI slots payload #1 from 15->50 (to=
tal VCPI
> > > > > > > > > > > > slots=3D99,
> > > > > > > > > > > > overflow!)
> > > > > > > > > > > > =A0* Decrease VCPI slots payload #2 from 35->0=A0 (=
total VCPI
> > > > > > > > > > > > slots=3D50)
> > > > > > > > > > > >
> > > > > > > > > > > > Notice on the first step, we've technically overflo=
wed the
> > > > > > > > > > > > available
> > > > > > > > > > > > number of VCPI slots in the payload table. This is =
still
> > > > > > > > > > > > before
> > > > > > > > > > > > step
> > > > > > > > > > > > 2
> > > > > > > > > > > > though, and I could be totally wrong here - perhaps=
 this
> > > > > > > > > > > > is
> > > > > > > > > > > > entirely
> > > > > > > > > > > > OK in
> > > > > > > > > > > > the real world, and we're allowed to overflow VC sl=
ots as
> > > > > > > > > > > > long
> > > > > > > > > > > > as
> > > > > > > > > > >
> > > > > > > > > > > I think it's forbidden to allocate time slots beyond =
64 when
> > > > > > > > > > > we're
> > > > > > > > > > > updating
> > > > > > > > > > > payload ID table of the branch in the real world. Bra=
nch
> > > > > > > > > > > probably
> > > > > > > > > > > will NACK the DPCD write.
> > > > > > > > > > >
> > > > > > > > > > > > we repair the issue before step 2. But so far I can=
't seem
> > > > > > > > > > > > to
> > > > > > > > > > > > find
> > > > > > > > > > > > anything in the DP 2.0 spec that explicitly states =
this
> > > > > > > > > > > > would
> > > > > > > > > > > > be
> > > > > > > > > > > > OK
> > > > > > > > > > > > -
> > > > > > > > > > > > which
> > > > > > > > > > > > makes me think we might fail some payload allocatio=
ns if
> > > > > > > > > > > > we
> > > > > > > > > > > > don't
> > > > > > > > > > > > always
> > > > > > > > > > > > ensure we avoid overflows in between VC payload tab=
le
> > > > > > > > > > > > changes
> > > > > > > > > > >
> > > > > > > > > > > Agree.
> > > > > > > > > > > For amdgpu, I think we always do deallocation (call h=
ws-
> > > > > > > > > > > > funcs.reset_hw_ctx_wrap()) before allocation
> > > > > > > > > > > (apply_single_controller_ctx_to_hw()).
> > > > > > > > > > >
> > > > > > > > > > > > Note that avoiding overflows would be as simple as =
just
> > > > > > > > > > > > making
> > > > > > > > > > > > sure
> > > > > > > > > > > > we
> > > > > > > > > > > > send all VC payload table changes that free VC slot=
s
> > > > > > > > > > > > before
> > > > > > > > > > > > sending
> > > > > > > > > > > > any that take new slots.
> > > > > > > > > > > >
> > > > > > > > > > > > Again - I haven't actually confirmed this yet and a=
m
> > > > > > > > > > > > hoping to
> > > > > > > > > > > > test
> > > > > > > > > > > > stuff
> > > > > > > > > > > > like this very soon as I'm pretty close finishing u=
p the
> > > > > > > > > > > > initial
> > > > > > > > > > > > attempt
> > > > > > > > > > > > at removing the non-atomic MST code in the DRM
> helpers
> > > > > > > > > > > > now. If
> > > > > > > > > > > > my
> > > > > > > > > > > > theory
> > > > > > > > > > > > ends up being correct here, I can fix this in my re=
write
> > > > > > > > > > > > of
> > > > > > > > > > > > the
> > > > > > > > > > > > MST payload management code. But I figured it might=
 be
> > > > > > > > > > > > worth
> > > > > > > > > > > > mentioning in
> > > > > > > > > > > > the mean time in case you think it might be relevan=
t to
> > > > > > > > > > > > the
> > > > > > > > > > > > problem here :).
> > > > > > > > > > > >
> > > > > > > > > > > > On Wed, 2022-01-12 at 16:47 -0500, Lyude Paul wrote=
:
> > > > > > > > > > > > > (CC'ing this to dri-devel, since this is basicall=
y patch
> > > > > > > > > > > > > review)
> > > > > > > > > > > > >
> > > > > > > > > > > > > Alright - so first off sorry about the broken deb=
ugging
> > > > > > > > > > > > > patch! I
> > > > > > > > > > > > > thought I had tested that but I guess I hadn't te=
sted it
> > > > > > > > > > > > > well
> > > > > > > > > > > > > enough,
> > > > > > > > > > > > > I'll get it fixed asap, but feel free to try gett=
ing to
> > > > > > > > > > > > > it
> > > > > > > > > > > > > before
> > > > > > > > > > > > > I
> > > > > > > > > > > > > do.
> > > > > > > > > > > > >
> > > > > > > > > > > > > As for this patch... (comments below)
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Mon, 2021-12-20 at 02:17 +0000, Lin, Wayne wro=
te:
> > > > > > > > > > > > > > [AMD Official Use Only]
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hi Lyude,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > No rush and thanks for your time! : ) Just want=
 to
> > > > > > > > > > > > > > help
> > > > > > > > > > > > > > clarify
> > > > > > > > > > > > > > what
> > > > > > > > > > > > > > I mean that "registering a callback function"
> > > > > > > > > > > > > > for CSN of disconnecting
> > > > > > > > > > > > > > stream sink device (not mst branch case). Attac=
h
> below
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > tentative
> > > > > > > > > > > > > > patch that I planned to do. Thanks so much!
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Regards,
> > > > > > > > > > > > > > Wayne
> > > > > > > > > > > > > > ---
> > > > > > > > > > > > >
> > =A0.../display/amdgpu_dm/amdgpu_dm_mst_types.c=A0=A0 | 53
> > > > > > > > > > > > > > +++++++++++++++++++
> > > > > > > > > > > > > > =A0drivers/gpu/drm/drm_dp_mst_topology.c=A0=A0=
=A0=A0=A0=A0=A0=A0 | 16
> > > > > > > > > > > > > > +++++-
> > > > > > > > > > > > > > =A0include/drm/drm_dp_mst_helper.h=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +
> > > > > > > > > > > > > > =A03 files changed, 68 insertions(+), 2 deletio=
ns(-)
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > >
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_
> > > > > > > > > > > > > > type
> > > > > > > > > > > > > > s.c
> > > > > > > > > > > > > >
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_
> > > > > > > > > > > > > > type
> > > > > > > > > > > > > > s.c
> > > > > > > > > > > > > > index cc34a35d0bcb..d7343c64908c 100644
> > > > > > > > > > > > > > ---
> > > > > > > > > > > > > >
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_
> > > > > > > > > > > > > > type
> > > > > > > > > > > > > > s.c
> > > > > > > > > > > > > > +++
> > > > > > > > > > > > > >
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_
> > > > > > > > > > > > > > type
> > > > > > > > > > > > > > s.c
> > > > > > > > > > > > > > @@ -472,8 +472,61 @@
> dm_dp_add_mst_connector(struct
> > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 return connector;
> > > > > > > > > > > > > > =A0}
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > +void dm_dp_notify_csn_disconnection(struct
> > > > > > > > > > > > > > drm_connector
> > > > > > > > > > > > > > +*connector) {
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 struct amdgpu_dm_connector =
*aconnector =3D
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 to_=
amdgpu_dm_connector(connector);
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 struct dc_sink *dc_sink =3D=
 aconnector->dc_sink;
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 struct dc_link *dc_link =3D=
 aconnector->dc_link;
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 struct amdgpu_device *adev =
=3D
> > > > > > > > > > > > > > drm_to_adev(ddev);
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 ASSERT(dc_link);
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 if (dc_sink) {
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mut=
ex_lock(&adev->dm.dc_lock);
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*c=
lear the remote sink of the link*/
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dc_=
link_remove_remote_sink(dc_link,
> > > > > > > > > > > > > > dc_sink);
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dc_=
sink_release(dc_sink);
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 aco=
nnector->dc_sink =3D NULL;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mut=
ex_unlock(&adev->dm.dc_lock);
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 }
> > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > =A0static const struct drm_dp_mst_topology_cbs
> > > > > > > > > > > > > > dm_mst_cbs =3D
> > > > > > > > > > > > > > {
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 .add_connector =3D dm_dp_=
add_mst_connector,
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 .notify_csn_disconnection =
=3D
> > > > > > > > > > > > > > dm_dp_notify_csn_disconnection,
> > > > > > > > > > > > > > =A0};
> > > > > > > > > > > > >
> > > > > > > > > > > > > I still don't really think this is a good idea. T=
his
> > > > > > > > > > > > > seems
> > > > > > > > > > > > > like
> > > > > > > > > > > > > it's
> > > > > > > > > > > > > just adding another hotplugging path to the code =
in
> > > > > > > > > > > > > order to
> > > > > > > > > > > > > avoid
> > > > > > > > > > > > > sending hotplugs for non-endpoint devices. In add=
ition
> > > > > > > > > > > > > to
> > > > > > > > > > > > > the
> > > > > > > > > > >
> > > > > > > > > > > So, what I wanted to do is to add a callback function=
 for
> > > > > > > > > > > endpoint
> > > > > > > > > > > devices
> > > > > > > > > > > case as described above. For disconnection of non-
> endpoint
> > > > > > > > > > > devices
> > > > > > > > > > > is
> > > > > > > > > > > already taken care by current code.
> > > > > > > > > > >
> > > > > > > > > > > > > drm_connector issues I mentioned before, we also
> really
> > > > > > > > > > > > > need
> > > > > > > > > > > > > to
> > > > > > > > > > > > > stop
> > > > > > > > > > > > > doing any kind of payload maintence in hotpluggin=
g
> > > > > > > > > > > > > paths.
> > > > > > > > > > > > > The
> > > > > > > > > > > > > reality
> > > > > > > > > > > > > is any kind of payload maintanence we do outside =
of
> > > > > > > > > > > > > normal
> > > > > > > > > > > > > modesetting
> > > > > > > > > > > > > paths is a relic from legacy modesetting that I'm
> > > > > > > > > > > > > dropping
> > > > > > > > > > > > > ASAP
> > > > > > > > > > > > > (more
> > > > > > > > > > > > > on this below), and we can't keep adding to it be=
cause
> > > > > > > > > > > > > it
> > > > > > > > > > > > > dramatically
> > > > > > > > > > > > > complicates maintanence as well.
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > Sorry for repeating this point so often but - the
> > > > > > > > > > > > > biggest
> > > > > > > > > > > > > issue
> > > > > > > > > > > > > too
> > > > > > > > > > > > > is
> > > > > > > > > > > > > I'm still not sure what it is we're even avoiding=
 here.
> > > > > > > > > > > > > We
> > > > > > > > > > > > > know
> > > > > > > > > > > > > resources aren't released consistently, and that =
we're
> > > > > > > > > > > > > able
> > > > > > > > > > > > > to
> > > > > > > > > > > > > reproduce the behavior with repeated hotplugs. We
> also
> > > > > > > > > > > > > know
> > > > > > > > > > > > > that
> > > > > > > > > > > > > if
> > > > > > > > > > > > > we
> > > > > > > > > > > > > skip sending certain hotplug events, that fixes t=
he
> > > > > > > > > > > > > issue.
> > > > > > > > > > > > > And
> > > > > > > > > > > > > we
> > > > > > > > > > > > > know
> > > > > > > > > > > > > we can workaround it by adding a special case for
> > > > > > > > > > > > > forcing a
> > > > > > > > > > > > > payload
> > > > > > > > > > > > > release in DC. But none of those actually tell us
> > > > > > > > > > > > > exactly
> > > > > > > > > > > > > what
> > > > > > > > > > > > > piece
> > > > > > > > > > > > > of code is leaking and why, which means that any
> > > > > > > > > > > > > workarounds
> > > > > > > > > > > > > we're
> > > > > > > > > > > > > putting in to avoid this mysterious guilty sectio=
n of
> > > > > > > > > > > > > code
> > > > > > > > > > > > > we
> > > > > > > > > > > > > don't
> > > > > > > > > > > > > entirely understand either - which means we're ju=
st
> > > > > > > > > > > > > adding
> > > > > > > > > > > > > more
> > > > > > > > > > > > > code
> > > > > > > > > > > > > in that no one actually fully understands. This j=
ust
> > > > > > > > > > > > > ends up
> > > > > > > > > > > > > making
> > > > > > > > > > > > > maintence difficult because every change in code
> nearby
> > > > > > > > > > > > > workarounds
> > > > > > > > > > > > > like this has to strugle to try to figure out sai=
d
> > > > > > > > > > > > > workarounds
> > > > > > > > > > > > > in
> > > > > > > > > > > > > order to avoid breaking things.
> > > > > > > > > > >
> > > > > > > > > > > Thank you Lyude for the reminder and I totally agree =
with
> > > > > > > > > > > you by
> > > > > > > > > > > avoiding
> > > > > > > > > > > adding workaround since it will get the code maintena=
nce
> > > > > > > > > > > harder.
> > > > > > > > > > > And
> > > > > > > > > > > I
> > > > > > > > > > > think the root cause of the issue that I observed bef=
ore is
> > > > > > > > > > > quite
> > > > > > > > > > > concrete.
> > > > > > > > > > > There is no code path for us to release dc_sink under=
 the
> > > > > > > > > > > unplug
> > > > > > > > > > > scenario
> > > > > > > > > > > that I described above.
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > I'm actually currently running into these "later"=
 issues
> > > > > > > > > > > > > right
> > > > > > > > > > > > > now,
> > > > > > > > > > > > > as
> > > > > > > > > > > > > recently I've (-actively-, finally!!!) been worki=
ng on
> > > > > > > > > > > > > trying to
> > > > > > > > > > > > > remove as much non-atomic MST as I can because. A=
s it
> > > > > > > > > > > > > turns
> > > > > > > > > > > > > out
> > > > > > > > > > > > > -
> > > > > > > > > > > > > a
> > > > > > > > > > > > > huge amount of the payload maintanence code just
> isn't
> > > > > > > > > > > > > needed at
> > > > > > > > > > > > > all
> > > > > > > > > > > > > when we stop caring about non-atomic drivers and
> stick
> > > > > > > > > > > > > everything
> > > > > > > > > > > > > in
> > > > > > > > > > > > > atomic state structs. Step 1 for updating updatin=
g the
> > > > > > > > > > > > > payload
> > > > > > > > > > > > > table,
> > > > > > > > > > > > > e.g. drm_dp_update_payload_part1(), is a great
> example
> > > > > > > > > > > > > of
> > > > > > > > > > > > > how
> > > > > > > > > > > > > messy
> > > > > > > > > > > > > things have become. Here's a small sample of some=
 of
> the
> > > > > > > > > > > > > stuff
> > > > > > > > > > > > > I've
> > > > > > > > > > > > > seen from just that one function so far that eith=
er just
> > > > > > > > > > > > > don't
> > > > > > > > > > > > > make
> > > > > > > > > > > > > sense here or is totally redundant. I should note=
 that a
> > > > > > > > > > > > > lot
> > > > > > > > > > > > > of
> > > > > > > > > > > > > these
> > > > > > > > > > > > > things also come from patches I reviwed, but didn=
't
> > > > > > > > > > > > > really
> > > > > > > > > > > > > look
> > > > > > > > > > > > > at
> > > > > > > > > > > > > as
> > > > > > > > > > > > > closely as I should have because I was swamped at
> work,
> > > > > > > > > > > > > some
> > > > > > > > > > > > > are
> > > > > > > > > > > > > historical artifacts, and others are less-than-id=
eal
> > > > > > > > > > > > > patches
> > > > > > > > > > > > > I
> > > > > > > > > > > > > got
> > > > > > > > > > > > > wrote myself when I was first started working on =
MST
> and
> > > > > > > > > > > > > didn't
> > > > > > > > > > > > > know
> > > > > > > > > > > > > the code as well as I do
> > > > > > > > > > > > > now:
> > > > > > > > > > > > >
> > > > > > > > > > > > > =A0* We try to avoid some sort of userspace issue=
 by
> using
> > > > > > > > > > > > > =A0=A0 drm_dp_mst_port_downstream_of_branch() to
> avoid
> > > > > > > > > > > > > releasing
> > > > > > > > > > > > > payloads
> > > > > > > > > > > > > for a
> > > > > > > > > > > > > =A0=A0 branch if we can't prove it's downstream o=
f the top
> > > > > > > > > > > > > of
> > > > > > > > > > > > > the
> > > > > > > > > > > > > topology. This
> > > > > > > > > > > > > =A0=A0 seems to workaround either a userspace bug=
. This is a
> > > > > > > > > > > > > redundant,
> > > > > > > > > > > > > since
> > > > > > > > > > > > > =A0=A0 that's what topology refs are already supp=
osed to be
> > > > > > > > > > > > > doing to
> > > > > > > > > > > > > the
> > > > > > > > > > > > > extent is
> > > > > > > > > > > > > =A0=A0 reasonably possibly. It's also unfortunate=
ly racy
> > > > > > > > > > > > > solution
> > > > > > > > > > > > > because
> > > > > > > > > > > > > we have
> > > > > > > > > > > > > =A0=A0 to be able to handle the situation where a=
 connector
> > > > > > > > > > > > > is
> > > > > > > > > > > > > removed
> > > > > > > > > > > > > from under
> > > > > > > > > > > > > =A0=A0 us. That can happen at any time, including
> > > > > > > > > > > > > _immediately_
> > > > > > > > > > > > > after
> > > > > > > > > > > > > we
> > > > > > > > > > > > > call
> > > > > > > > > > > > > =A0=A0 drm_dp_mst_port_downstream_of_branch() -
> rendering
> > > > > > > > > > > > > the
> > > > > > > > > > > > > call
> > > > > > > > > > > > > not
> > > > > > > > > > > > > really
> > > > > > > > > > > > > =A0=A0 useful.
> > > > > > > > > > > > > =A0* If we fail to validate the sink in
> > > > > > > > > > > > > drm_dp_update_payload_part,
> > > > > > > > > > > > > we
> > > > > > > > > > > > > don't
> > > > > > > > > > > > > =A0=A0 update the payload table. I think at best =
this
> > > > > > > > > > > > > solution
> > > > > > > > > > > > > is
> > > > > > > > > > > > > racy
> > > > > > > > > > > > > and
> > > > > > > > > > > > > not
> > > > > > > > > > > > > =A0=A0 useful, at worst it leaves us with a paylo=
ad table
> > > > > > > > > > > > > that
> > > > > > > > > > > > > doesn't
> > > > > > > > > > > > > match what
> > > > > > > > > > > > > =A0=A0 we attempted to set in the atomic state - =
which at
> > > > > > > > > > > > > worst
> > > > > > > > > > > > > brings
> > > > > > > > > > > > > us
> > > > > > > > > > > > > into
> > > > > > > > > > > > > =A0=A0 undefined territory where we're just plain=
 out of
> > > > > > > > > > > > > sync
> > > > > > > > > > > > > with
> > > > > > > > > > > > > the
> > > > > > > > > > > > > reality in
> > > > > > > > > > > > > =A0=A0 hw.
> > > > > > > > > > > > > =A0* Actually fun fact - mgr->payloads and mgr-
> > > > > > > > > > > > > >proposed_vcpis
> > > > > > > > > > > > > both
> > > > > > > > > > > > > can
> > > > > > > > > > > > > and
> > > > > > > > > > > > > =A0=A0 definitely should be removed entirely. All=
 of the
> > > > > > > > > > > > > info
> > > > > > > > > > > > > for
> > > > > > > > > > > > > mgr->payloads
> > > > > > > > > > > > > =A0=A0 could just be in the atomic state, because=
 that + the
> > > > > > > > > > > > > magic
> > > > > > > > > > > > > of
> > > > > > > > > > > > > atomic state
> > > > > > > > > > > > > =A0=A0 duplication means we'll also have an accur=
ate view of
> > > > > > > > > > > > > the
> > > > > > > > > > > > > previous
> > > > > > > > > > > > > state's
> > > > > > > > > > > > > =A0=A0 payload allocations: which renders mgr-
> > > > > > > > > > > > > >proposed_vcpis
> > > > > > > > > > > > > redundant.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Apologies for the long explanation again, but I h=
ope
> > > > > > > > > > > > > that
> > > > > > > > > > > > > explains
> > > > > > > > > > > > > my
> > > > > > > > > > >
> > > > > > > > > > > Really really thanks for your kindly help on this : )
> > > > > > > > > > > I'll try my best to get to your WIP branch soon. Than=
k you
> > > > > > > > > > > Lyude!
> > > > > > > > > > >
> > > > > > > > > > > > > point here a bit. I'm going to be trying to get t=
o
> > > > > > > > > > > > > moving
> > > > > > > > > > > > > amdgpu's
> > > > > > > > > > > > > DSC
> > > > > > > > > > > > > code out of amdgpu and into DRM helpers as well
> soon, so
> > > > > > > > > > > > > I'm
> > > > > > > > > > > > > really
> > > > > > > > > > > > > determined to clean stuff up beforehand as every =
time
> > > > > > > > > > > > > I've
> > > > > > > > > > > > > done
> > > > > > > > > > > > > so
> > > > > > > > > > > > > it's become substantially easier to make changes =
to this
> > > > > > > > > > > > > code.
> > > > > > > > > > > > > Things
> > > > > > > > > > > > > used to be even worse before I started cleaning t=
hings
> > > > > > > > > > > > > up 2
> > > > > > > > > > > > > or 3
> > > > > > > > > > > > > years
> > > > > > > > > > > > > ago, where simple changes would end up getting me
> stuck
> > > > > > > > > > > > > spending
> > > > > > > > > > > > > hours
> > > > > > > > > > > > > trying to dig through lockdep or memory manegemen=
t
> > > > > > > > > > > > > issues.
> > > > > > > > > > > > > As
> > > > > > > > > > > > > well,
> > > > > > > > > > > > > I
> > > > > > > > > > > > > would be entirely unsurprised if bugs like this v=
ery
> > > > > > > > > > > > > payload
> > > > > > > > > > > > > leak
> > > > > > > > > > > > > we're working on just disappear once we've gotten=
 rid
> of
> > > > > > > > > > > > > all
> > > > > > > > > > > > > the
> > > > > > > > > > > > > extraneous workarounds and state tracking here -
> > > > > > > > > > > > > especially
> > > > > > > > > > > > > with
> > > > > > > > > > > > > how
> > > > > > > > > > > > > many special cases we have for maintaining the
> payload
> > > > > > > > > > > > > table
> > > > > > > > > > > > > right
> > > > > > > > > > > > > now. That's certainly ended up being the case in =
the
> > > > > > > > > > > > > past
> > > > > > > > > > > > > with a
> > > > > > > > > > > > > number of other difficult to track down issues I'=
ve
> > > > > > > > > > > > > dealt
> > > > > > > > > > > > > with
> > > > > > > > > > > > > in
> > > > > > > > > > > > > MST.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Anyhow. I've been way more productive this year t=
hen
> > > > > > > > > > > > > last
> > > > > > > > > > > > > because
> > > > > > > > > > > > > I
> > > > > > > > > > > > > had over a month off work and am finally not supe=
r
> burnt
> > > > > > > > > > > > > out
> > > > > > > > > > > > > from
> > > > > > > > > > > > > my
> > > > > > > > > > > > > job, and so far I've been making progress on the
> payload
> > > > > > > > > > > > > state
> > > > > > > > > > > > > cleanup
> > > > > > > > > > > > > far faster then I was last year :). I think if yo=
u can't
> > > > > > > > > > > > > figure
> > > > > > > > > > > > > out
> > > > > > > > > > > > > where the leak is coming from even once I get the
> > > > > > > > > > > > > debugging
> > > > > > > > > > > > > patches
> > > > > > > > > > > > > I
> > > > > > > > > > > > > mentioned fixed up, it might be a good idea for u=
s to
> > > > > > > > > > > > > try
> > > > > > > > > > > > > again
> > > > > > > > > > > > > after
> > > > > > > > > > > > > I've got some of this code cleaned up. I've got a
> > > > > > > > > > > > > currently
> > > > > > > > > > > > > WIP
> > > > > > > > > > > > > branch
> > > > > > > > > > > > > here:
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl
> > > > > > > > > > > > > ab.freedesktop.org%2Flyudess%2Flinux%2F-
> > > > > > > > > > > > > %2Fcommit%2F624dd68fa804e64b5b
> > > > > > > > > > > > >
> 2060e4735d7317090692b5&amp;data=3D04%7C01%7Cwayne.lin%40am
> > > > > > > > > > > > > d.co
> > > > > > > > > > > > > m%7C
> > > > > > > > > > > > > d4
> > > > > > > > > > > > > bd
> > > > > > > > > > > > > c7
> > > > > > > > > > > > >
> 59eb274bfccc8208d9daef41fe%7C3dd8961fe4884e608e11a82d994
> > > > > > > > > > > > > e183
> > > > > > > > > > > > > d%7C
> > > > > > > > > > > > > 0%
> > > > > > > > > > > > > 7C
> > > > > > > > > > > > > 0%
> > > > > > > > > > > > >
> 7C637781543416430632%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> > > > > > > > > > > > > wLjA
> > > > > > > > > > > > > wMDA
> > > > > > > > > > > > > iL
> > > > > > > > > > > > > CJ
> > > > > > > > > > > > > QI
> > > > > > > > > > > > >
> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> > > > > > > > > > > > > ta=3Dn
> > > > > > > > > > > > > FpVl
> > > > > > > > > > > > > %2
> > > > > > > > > > > > > BV
> > > > > > > > > > > > > oF
> > > > > > > > > > > > >
> 40JPabfRMcR6Cz7ZHDwt%2BBpLDBNdXftJaA%3D&amp;reserved=3D0
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > =A0void amdgpu_dm_initialize_dp_connector(struc=
t
> > > > > > > > > > > > > > amdgpu_display_manager *dm, diff --git
> > > > > > > > > > > > > > a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > index 857c5d15e81d..a70e26c5d084 100644
> > > > > > > > > > > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > @@ -2508,6 +2508,7 @@
> > > > > > > > > > > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > > > > > > > > > > drm_dp_mst_branch *mstb,
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 u8 new_pdt;
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 bool new_mcs;
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 bool dowork =3D false, cr=
eate_connector =3D false;
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 bool notify_unplug_event =
=3D false;
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 port =3D drm_dp_get_port(=
mstb, conn_stat-
> > > > > > > > > > > > > > > port_number);
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 if (!port)
> > > > > > > > > > > > > > @@ -2520,6 +2521,9 @@
> > > > > > > > > > > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > > > > > > > > > > drm_dp_mst_branch *mstb,
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 * port, so just throw the
> > > > > > > > > > > > > > port
> > > > > > > > > > > > > > out
> > > > > > > > > > > > > > and
> > > > > > > > > > > > > > make
> > > > > > > > > > > > > > sure we
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 * reprobe the link address of
> > > > > > > > > > > > > > it's
> > > > > > > > > > > > > > parent
> > > > > > > > > > > > > > MSTB
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 /* should also consider
> > > > > > > > > > > > > > notify_unplug_event
> > > > > > > > > > > > > > here.
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 * but it's not a normal case
> > > > > > > > > > > > > > for
> > > > > > > > > > > > > > products
> > > > > > > > > > > > > > +in the
> > > > > > > > > > > > > > market
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > drm_dp_mst_topology_unlink_port(mgr,
> > > > > > > > > > > > > > port);
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 mstb->link_address_sent =3D
> > > > > > > > > > > > > > false;
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 dowork =3D true; @@ -2541,10
> > > > > > > > > > > > > > +2545,14 @@
> > > > > > > > > > > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > *mstb,
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 port->ddps =3D conn_stat-
> > > > > > > > > > > > > > > displayport_device_plug_status;
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 if (old_ddps !=3D port->d=
dps) {
> > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if =
(port->ddps && !port->input)
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if =
(port->ddps && !port->input) {
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > drm_dp_send_enum_path_resources(mgr,
> > > > > > > > > > > > > > mstb,
> > > > > > > > > > > > > > port);
> > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 els=
e
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } e=
lse {
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 port->full_pbn =3D 0;
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 if (port->connector &&
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > drm_dp_mst_is_end_device(port-
> > > > > > > > > > > > > > > pdt,
> > > > > > > > > > > > > > +port-
> > > > > > > > > > > > > > > mcs))
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 notify_unplug_event =3D
> > > > > > > > > > > > > > true;
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 new_pdt =3D port->input ?
> DP_PEER_DEVICE_NONE :
> > > > > > > > > > > > > > conn_stat-
> > > > > > > > > > > > > > > peer_device_type;
> > > > > > > > > > > > > > @@ -2557,11 +2565,15 @@
> > > > > > > > > > > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > *mstb,
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d=
owork =3D false;
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 if (notify_unplug_event &&
> > > > > > > > > > > > > > +mgr->cbs->notify_csn_disconnection)
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mgr=
->cbs-
> > > > > > > > > > > > > > >notify_csn_disconnection(port-
> > > > > > > > > > > > > > > connector);
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 if (port->connector)
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d=
rm_modeset_unlock(&mgr->base.lock);
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 else if (create_connector=
)
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d=
rm_dp_mst_port_add_connector(mstb,
> > > > > > > > > > > > > > port);
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > =A0out:
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 drm_dp_mst_topology_put_p=
ort(port);
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 if (dowork)
> > > > > > > > > > > > > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > > > > > > > > > > > 78044ac5b59b..ff9e47729841
> > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > @@ -525,6 +525,7 @@ struct
> drm_dp_mst_topology_cbs {
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0 * IRQ pulse handler.
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0 void (*poll_hpd_irq)(stru=
ct
> > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > *mgr);
> > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0 void (*notify_csn_disconnec=
tion)(struct
> > > > > > > > > > > > > > drm_connector
> > > > > > > > > > > > > > +*connector);
> > > > > > > > > > > > > > =A0};
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > =A0#define DP_MAX_PAYLOAD (sizeof(unsigned long=
) *
> 8)
> > > > > > > > > > > > > > --
> > > > > > > > > > > > > > 2.31.0
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > > From: Lin, Wayne
> > > > > > > > > > > > > > > Sent: Wednesday, December 8, 2021 11:39 AM
> > > > > > > > > > > > > > > To: 'Lyude Paul' <lyude@redhat.com>
> > > > > > > > > > > > > > > Subject: RE: [PATCH] WIP: drm/dp_mst: Add
> support
> > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > dumping
> > > > > > > > > > > > > > > topology ref histories from debugfs
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > No worries Lyude!
> > > > > > > > > > > > > > > Thanks for keeping helping on this. Take your=
 time :
> > > > > > > > > > > > > > > )
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > > > > > > Sent: Wednesday, December 8, 2021 7:05 AM
> > > > > > > > > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > > > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add
> support
> > > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > > dumping
> > > > > > > > > > > > > > > > topology ref histories from debugfs
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Sorry! I will try to get to this tomorrow, =
if not
> > > > > > > > > > > > > > > > then
> > > > > > > > > > > > > > > > sometime
> > > > > > > > > > > > > > > > this week.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Tue, 2021-11-30 at 08:41 +0000, Lin, Way=
ne
> > > > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > > [Public]
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Hi Lyude,
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Finally have some bandwidth to get back t=
o this
> > > > > > > > > > > > > > > > > problem!
> > > > > > > > > > > > > > > > > I roughly went through this patch and I'm=
 just
> > > > > > > > > > > > > > > > > aware
> > > > > > > > > > > > > > > > > that
> > > > > > > > > > > > > > > > > we
> > > > > > > > > > > > > > > > > already have such kind of convenient tool=
 for a
> > > > > > > > > > > > > > > > > while.
> > > > > > > > > > > > > > > > > I think it's definitely useful for us to =
track
> > > > > > > > > > > > > > > > > port/mstb
> > > > > > > > > > > > > > > > > reference count issues and I'll start to =
embrace
> > > > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > > > feature
> > > > > > > > > > > > > > > > > for cleaning up those issues. Thank you L=
yude!
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > However, I think the issue that I was try=
ing to
> > > > > > > > > > > > > > > > > fix
> > > > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > > > not
> > > > > > > > > > > > > > > > > related to what you suggested:
> > > > > > > > > > > > > > > > > " The idea here is that if stream resourc=
es
> > > > > > > > > > > > > > > > > aren't
> > > > > > > > > > > > > > > > > being
> > > > > > > > > > > > > > > > > released, my guess would be that we're no=
t
> > > > > > > > > > > > > > > > > dropping
> > > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > > references for the port which means the
> > > > > > > > > > > > > > > > > connector
> > > > > > > > > > > > > > > > > never
> > > > > > > > > > > > > > > > > goes
> > > > > > > > > > > > > > > > > away."
> > > > > > > > > > > > > > > > > The issue I was trying to fix is about re=
leasing
> > > > > > > > > > > > > > > > > dc_link->remote_sinks while receiving a C=
SN
> > > > > > > > > > > > > > > > > message
> > > > > > > > > > > > > > > > > notifying
> > > > > > > > > > > > > > > > > the connection status of a sst connector =
of a
> > > > > > > > > > > > > > > > > port
> > > > > > > > > > > > > > > > > changed
> > > > > > > > > > > > > > > > > from connected to disconnected. Not the
> > > > > > > > > > > > > > > > > connection
> > > > > > > > > > > > > > > > > status
> > > > > > > > > > > > > > > > > changed of a mst branch device.
> > > > > > > > > > > > > > > > > e.g.
> > > > > > > > > > > > > > > > > src - 1st_mstb - 2nd_mstb - sst_monitor =
=3D> src -
> > > > > > > > > > > > > > > > > 1st_mstb
> > > > > > > > > > > > > > > > > (disconnect) 2nd_mstb - sst_monitor
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > In above case, after receiving CSN, we wi=
ll put
> > > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > > references of 2nd mstb and its port which=
 is
> > > > > > > > > > > > > > > > > connected
> > > > > > > > > > > > > > > > > with
> > > > > > > > > > > > > > > > > the sst monitor. As the result of that, w=
e can
> > > > > > > > > > > > > > > > > call
> > > > > > > > > > > > > > > > > drm_dp_delayed_destroy_port() to unregist=
er
> and
> > > > > > > > > > > > > > > > > put
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > drm
> > > > > > > > > > > > > > > > > connector.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > However, in below case:
> > > > > > > > > > > > > > > > > e.g.
> > > > > > > > > > > > > > > > > src - 1st_mstb - sst_monitor =3D> src - 1=
st_mstb
> > > > > > > > > > > > > > > > > (disconnect)
> > > > > > > > > > > > > > > > > sst_monitor
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > In this case, which is the case having pr=
oblem,
> > > > > > > > > > > > > > > > > it
> > > > > > > > > > > > > > > > > definitely
> > > > > > > > > > > > > > > > > won't decrease the topology references co=
unt
> of
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > port
> > > > > > > > > > > > > > > > > which
> > > > > > > > > > > > > > > > > was connected to the sst monitor to zero =
since
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > port
> > > > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > > > still existing in the topology. Same as t=
he
> > > > > > > > > > > > > > > > > malloc
> > > > > > > > > > > > > > > > > reference
> > > > > > > > > > > > > > > > > since the port can't get destroyed. Hence=
, the
> > > > > > > > > > > > > > > > > port
> > > > > > > > > > > > > > > > > still
> > > > > > > > > > > > > > > > > exists=A0 and we won't call
> > > > > > > > > > > > > > > > > drm_dp_delayed_destroy_port() to unregist=
er
> and
> > > > > > > > > > > > > > > > > put
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > drm
> > > > > > > > > > > > > > > > > connector.
> > > > > > > > > > > > > > > > > I looked up the code and
> > > > > > > > > > > > > > > > > drm_dp_delayed_destroy_port()
> > > > > > > > > > > > > > > > > seems
> > > > > > > > > > > > > > > > > like the only place to call drm_connector=
_put()
> > > > > > > > > > > > > > > > > which
> > > > > > > > > > > > > > > > > means
> > > > > > > > > > > > > > > > > we
> > > > > > > > > > > > > > > > > can't put reference count of drm connecto=
r
> under
> > > > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > > > case
> > > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > > can't release dc_sink resource by destroy=
ing
> drm
> > > > > > > > > > > > > > > > > connector.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > I would also like to point out that this
> > > > > > > > > > > > > > > > > resource
> > > > > > > > > > > > > > > > > (remote_sinks) is specific to different s=
tream
> > > > > > > > > > > > > > > > > sinks. So
> > > > > > > > > > > > > > > > > if
> > > > > > > > > > > > > > > > > we're trying to release this dc_sink reso=
urce by
> > > > > > > > > > > > > > > > > destroying
> > > > > > > > > > > > > > > > > the drm connector, it conflicts the idea =
that
> > > > > > > > > > > > > > > > > you
> > > > > > > > > > > > > > > > > suggested
> > > > > > > > > > > > > > > > > before that we should always keep the drm
> > > > > > > > > > > > > > > > > connector
> > > > > > > > > > > > > > > > > until
> > > > > > > > > > > > > > > > > it's
> > > > > > > > > > > > > > > > > no longer reachable in the topology.
> > > > > > > > > > > > > > > > > Releasing dc_sink should be binding with =
the
> > > > > > > > > > > > > > > > > disconnection
> > > > > > > > > > > > > > > > > event.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > I understand your concern that we should =
not
> > > > > > > > > > > > > > > > > just
> > > > > > > > > > > > > > > > > easily
> > > > > > > > > > > > > > > > > change the logic here since it's the resu=
lt
> > > > > > > > > > > > > > > > > after
> > > > > > > > > > > > > > > > > solving
> > > > > > > > > > > > > > > > > tons
> > > > > > > > > > > > > > > > > of bugs before and might cause other side
> > > > > > > > > > > > > > > > > effect.
> > > > > > > > > > > > > > > > > So,
> > > > > > > > > > > > > > > > > just
> > > > > > > > > > > > > > > > > my
> > > > > > > > > > > > > > > > > 2 cents, what I'm thinking is to register=
 a
> > > > > > > > > > > > > > > > > callback
> > > > > > > > > > > > > > > > > function
> > > > > > > > > > > > > > > > > for our driver to notify us that the remo=
te sink
> > > > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > > > detached.
> > > > > > > > > > > > > > > > > This just aligns our flow handling long H=
PD
> > > > > > > > > > > > > > > > > event of
> > > > > > > > > > > > > > > > > legacy
> > > > > > > > > > > > > > > > > (sst) DP.
> > > > > > > > > > > > > > > > > For sst case, once we detect long HPD eve=
nt
> > > > > > > > > > > > > > > > > indicating
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > monitor is detached, we will immediately =
try to
> > > > > > > > > > > > > > > > > release
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > dc_link->local_sink and fire hotplug even=
t to
> > > > > > > > > > > > > > > > > upper
> > > > > > > > > > > > > > > > > layer.
> > > > > > > > > > > > > > > > > Same as here, once receives a CSN message
> > > > > > > > > > > > > > > > > notifying
> > > > > > > > > > > > > > > > > a
> > > > > > > > > > > > > > > > > drm
> > > > > > > > > > > > > > > > > connector is changed from connected to
> > > > > > > > > > > > > > > > > disconnected,
> > > > > > > > > > > > > > > > > trigger
> > > > > > > > > > > > > > > > > the callback function and we can try to r=
elease
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > dc_sink
> > > > > > > > > > > > > > > > > resource.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Would like to know your thought and insig=
ht
> > > > > > > > > > > > > > > > > please :
> > > > > > > > > > > > > > > > > )
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Btw, I got some errors and warnings while
> > > > > > > > > > > > > > > > > building
> > > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > > have
> > > > > > > > > > > > > > > > > some code adjustments as below : ) Thank =
you
> > > > > > > > > > > > > > > > > Lyude
> > > > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > > > your
> > > > > > > > > > > > > > > > > always kindly help!!
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Regards,
> > > > > > > > > > > > > > > > > Wayne
> > > > > > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > > > > > > > > Sent: Wednesday, November 3, 2021 7:15 =
AM
> > > > > > > > > > > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > > > > > > > > > > Subject: [PATCH] WIP: drm/dp_mst: Add
> support
> > > > > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > > > > dumping
> > > > > > > > > > > > > > > > > > topology ref histories from debugfs
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > TODO:
> > > > > > > > > > > > > > > > > > * Implement support for i915
> > > > > > > > > > > > > > > > > > * Finish writing this commit message
> > > > > > > > > > > > > > > > > > * ???
> > > > > > > > > > > > > > > > > > * profit
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Signed-off-by: Lyude Paul
> <lyude@redhat.com>
> > > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Hey wayne! SO-hopefully if I did this
> > > > > > > > > > > > > > > > > > correctly
> > > > > > > > > > > > > > > > > > then
> > > > > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > > > > should just work on amdgpu. What this p=
atch
> > > > > > > > > > > > > > > > > > should
> > > > > > > > > > > > > > > > > > do
> > > > > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > > > > add
> > > > > > > > > > > > > > > > > > a debugfs file to amdgpu called
> > > > > > > > > > > > > > > > > > "amdgpu_dp_mst_topology_refs", and when
> you
> > > > > > > > > > > > > > > > > > read
> > > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > > file
> > > > > > > > > > > > > > > > > > it
> > > > > > > > > > > > > > > > > > should print out the topology reference
> > > > > > > > > > > > > > > > > > history of
> > > > > > > > > > > > > > > > > > every
> > > > > > > > > > > > > > > > > > MSTB and Port in memory, along with how
> many
> > > > > > > > > > > > > > > > > > times
> > > > > > > > > > > > > > > > > > we've
> > > > > > > > > > > > > > > > > > hit
> > > > > > > > > > > > > > > > > > the codepath in each backtrace. An exam=
ple:
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Port DP-5 (0000000005c37748) topology r=
ef
> > > > > > > > > > > > > > > > > > history:
> > > > > > > > > > > > > > > > > > =A0 1 gets (last at=A0=A0=A0 58.468973)=
:
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 drm_dp_send_link_address+0=
x6a5/0xa00
> > > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> drm_dp_check_and_send_link_address+0xad/0xd0
> > > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > >
> > =A0=A0=A0=A0 drm_dp_mst_link_probe_work+0x14e/0x1a0
> > > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 process_one_work+0x1e3/0x3=
90
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 worker_thread+0x50/0x3a0
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 kthread+0x124/0x150
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 ret_from_fork+0x1f/0x30
> > > > > > > > > > > > > > > > > > =A0 1 puts (last at=A0=A0=A0 58.469357)=
:
> > > > > > > > > > > > > > > > >
> > =A0=A0=A0=A0 drm_dp_mst_topology_put_port+0x6a/0x210
> > > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 drm_dp_send_link_address+0=
x39e/0xa00
> > > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> drm_dp_check_and_send_link_address+0xad/0xd0
> > > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > >
> > =A0=A0=A0=A0 drm_dp_mst_link_probe_work+0x14e/0x1a0
> > > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 process_one_work+0x1e3/0x3=
90
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 worker_thread+0x50/0x3a0
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 kthread+0x124/0x150
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0 ret_from_fork+0x1f/0x30
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > The idea here is that if stream resourc=
es
> > > > > > > > > > > > > > > > > > aren't
> > > > > > > > > > > > > > > > > > being
> > > > > > > > > > > > > > > > > > released, my guess would be that we're =
not
> > > > > > > > > > > > > > > > > > dropping
> > > > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > > > references for the port which means the
> > > > > > > > > > > > > > > > > > connector
> > > > > > > > > > > > > > > > > > never
> > > > > > > > > > > > > > > > > > goes
> > > > > > > > > > > > > > > > > > away. So, if that's really the case the=
n once
> > > > > > > > > > > > > > > > > > we
> > > > > > > > > > > > > > > > > > unplug
> > > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > > offending connector we should be able t=
o find
> > > > > > > > > > > > > > > > > > a
> > > > > > > > > > > > > > > > > > pair
> > > > > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > > > > gets/puts for the offending leaked conn=
ector
> > > > > > > > > > > > > > > > > > where
> > > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > > get/put count doesn't match up. Also, i=
f the
> > > > > > > > > > > > > > > > > > frame
> > > > > > > > > > > > > > > > > > count
> > > > > > > > > > > > > > > > > > on
> > > > > > > > > > > > > > > > > > the backtrace isn't long enough you can
> > > > > > > > > > > > > > > > > > increase
> > > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > > value
> > > > > > > > > > > > > > > > > > of STACK_DEPTH in
> > > > > > > > > > > > > > > > > > drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > > > recompile to get more frames.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > To enable this, first enable CONFIG_EXP=
ERT
> for
> > > > > > > > > > > > > > > > > > your
> > > > > > > > > > > > > > > > > > kernel
> > > > > > > > > > > > > > > > > > which will unhide
> > > > > > > > > > > > > > > > > >
> CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS.
> > > > > > > > > > > > > > > > > > Then just enable
> > > > > > > > > > > > > > > > > >
> CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS,
> > > > > > > > > > > > > > > > > > recompile, and it should be good to go.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Let me know if this works for you, and
> > > > > > > > > > > > > > > > > > hopefully
> > > > > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > > > > should
> > > > > > > > > > > > > > > > > > tell us exactly what the problem actual=
ly is
> > > > > > > > > > > > > > > > > > here.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > =A0.../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > > > > > > > > > > > > > > > > > |
> > > > > > > > > > > > > > > > > > 35
> > > > > > > > > > > > > > > > > > ++++
> > > > > > > > > > > > > > > > > > =A0drivers/gpu/drm/drm_dp_mst_topology.=
c
> > > > > > > > > > > > > > > > > > |
> > > > > > > > > > > > > > > > > > 173
> > > > > > > > > > > > > > > > > > ++++++++++++++----
> > > > > > > > > > > > > > > > >
> > =A0drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > > > > > > > > > > |
> > > > > > > > > > > > > > > > > > 35
> > > > > > > > > > > > > > > > > > ++++
> > > > > > > > > > > > > > > > > > =A0include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > > > > |
> > > > > > > > > > > > > > > > > > 18
> > > > > > > > > > > > > > > > > > ++
> > > > > > > > > > > > > > > > > > =A04 files changed, 228 insertions(+), =
33
> > > > > > > > > > > > > > > > > > deletions(-)
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > >
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu
> > > > > > > > > > > > > > > > > > _dm_
> > > > > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > > > > s.
> > > > > > > > > > > > > > > > > > c
> > > > > > > > > > > > > > > > > >
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu
> > > > > > > > > > > > > > > > > > _dm_
> > > > > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > > > > s.
> > > > > > > > > > > > > > > > > > c
> > > > > > > > > > > > > > > > > > index 1a68a674913c..1a14732c52b4 100644
> > > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > >
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu
> > > > > > > > > > > > > > > > > > _dm_
> > > > > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > > > > s.
> > > > > > > > > > > > > > > > > > c
> > > > > > > > > > > > > > > > > > +++
> > > > > > > > > > > > > > > > > >
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu
> > > > > > > > > > > > > > > > > > _dm_
> > > > > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > > > > +++ s.c
> > > > > > > > > > > > > > > > > > @@ -3063,6 +3063,37 @@ static int
> > > > > > > > > > > > > > > > > > mst_topo_show(struct
> > > > > > > > > > > > > > > > > > seq_file *m, void
> > > > > > > > > > > > > > > > > > *unused)
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 return 0;
> > > > > > > > > > > > > > > > > > =A0}
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +#ifdef
> CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > > > > +static int
> mst_topology_ref_dump_show(struct
> > > > > > > > > > > > > > > > > > seq_file
> > > > > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > > > > +void
> > > > > > > > > > > > > > > > > > +*unused) {
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct amdgpu_device *ade=
v =3D (struct
> > > > > > > > > > > > > > > > > > amdgpu_device
> > > > > > > > > > > > > > > > > > +*)m->private;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct drm_device *dev =
=3D
> > > > > > > > > > > > > > > > > > adev_to_drm(adev);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct drm_connector *con=
nector;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct drm_connector_list=
_iter
> > > > > > > > > > > > > > > > > > conn_iter;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct amdgpu_dm_connecto=
r
> *aconnector;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 drm_connector_list_iter_b=
egin(dev,
> > > > > > > > > > > > > > > > > > &conn_iter);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 drm_for_each_connector_it=
er(connector,
> > > > > > > > > > > > > > > > > > &conn_iter)
> > > > > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
f (connector->connector_type !=3D
> > > > > > > > > > > > > > > > > > DRM_MODE_CONNECTOR_DisplayPort)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 a=
connector =3D
> > > > > > > > > > > > > > > > > > +to_amdgpu_dm_connector(connector);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /=
* Ensure we're only dumping the
> > > > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > > > > a
> > > > > > > > > > > > > > > > > > +root mst node
> > > > > > > > > > > > > > > > > > */
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
f (!aconnector-
> > > > > > > > > > > > > > > > > > > mst_mgr.max_payloads)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s=
eq_printf(m, "\nMST topology
> > > > > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > > > > connector
> > > > > > > > > > > > > > > > > > +%d\n",
> > > > > > > > > > > > > > > > > > aconnector->connector_id);
> > > > > > > > > > > > > > > > > >
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drm_dp_mst_dump_topology_refs(m,
> > > > > > > > > > > > > > > > > > +&aconnector->mst_mgr);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 }
> > > > > > > > > > > > > > > > > >
> +=A0=A0=A0=A0 drm_connector_list_iter_end(&conn_iter);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 return 0;
> > > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > >
> +DEFINE_SHOW_ATTRIBUTE(mst_topology_ref_dump);
> > > > > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0/*
> > > > > > > > > > > > > > > > > > =A0 * Sets trigger hpd for MST topologi=
es.
> > > > > > > > > > > > > > > > > > =A0 * All connected connectors will be
> > > > > > > > > > > > > > > > > > rediscovered
> > > > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > > > re
> > > > > > > > > > > > > > > > > > started as needed if val of 1 is sent.
> > > > > > > > > > > > > > > > > > @@ -3299,6 +3330,10 @@ void
> > > > > > > > > > > > > > > > > > dtn_debugfs_init(struct
> > > > > > > > > > > > > > > > > > amdgpu_device
> > > > > > > > > > > > > > > > > > *adev)
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> debugfs_create_file("amdgpu_mst_topology",
> > > > > > > > > > > > > > > > > > 0444,
> > > > > > > > > > > > > > > > > > root,
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 adev,
> > > > > > > > > > > > > > > > > > &mst_topo_fops);
> > > > > > > > > > > > > > > > > > +#ifdef
> CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > >
> debugfs_create_file("amdgpu_dp_mst_topology_re
> > > > > > > > > > > > > > > > > > fs",
> > > > > > > > > > > > > > > > > > +0444, root, adev,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > &mst_topology_ref_dump_fops);
> > > > > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > > >
> > =A0=A0=A0=A0=A0 debugfs_create_file("amdgpu_dm_dtn_log",
> > > > > > > > > > > > > > > > > > 0644,
> > > > > > > > > > > > > > > > > > root,
> > > > > > > > > > > > > > > > > > adev,
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &dtn_log_fops);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > > a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > > > > index 1aa8702383d4..0159828c494d 100644
> > > > > > > > > > > > > > > > > > ---
> a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > > > > +++
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > > > > @@ -1366,23 +1366,6 @@ static int
> > > > > > > > > > > > > > > > > > drm_dp_mst_wait_tx_reply(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > > *mstb,
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 return ret;
> > > > > > > > > > > > > > > > > > =A0}
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -static struct drm_dp_mst_branch
> > > > > > > > > > > > > > > > > > *drm_dp_add_mst_branch_device(u8 lct, u=
8
> > > > > > > > > > > > > > > > > > *rad) -{
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 struct drm_dp_mst_branch =
*mstb;
> > > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 mstb =3D kzalloc(sizeof(*=
mstb),
> > > > > > > > > > > > > > > > > > GFP_KERNEL);
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 if (!mstb)
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r=
eturn NULL;
> > > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 mstb->lct =3D lct;
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 if (lct > 1)
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 m=
emcpy(mstb->rad, rad, lct / 2);
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 INIT_LIST_HEAD(&mstb->por=
ts);
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 kref_init(&mstb->topology=
_kref);
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 kref_init(&mstb->malloc_k=
ref);
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 return mstb;
> > > > > > > > > > > > > > > > > > -}
> > > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > > =A0static void
> > > > > > > > > > > > > > > > > > drm_dp_free_mst_branch_device(struct
> > > > > > > > > > > > > > > > > > kref
> > > > > > > > > > > > > > > > > > *kref)=A0 {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 struct drm_dp_mst_branc=
h *mstb =3D @@ -
> > > > > > > > > > > > > > > > > > 1642,12
> > > > > > > > > > > > > > > > > > +1625,20
> > > > > > > > > > > > > > > > > > @@ topology_ref_type_to_str(enum
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_type type)
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 return "put";
> > > > > > > > > > > > > > > > > > =A0}
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +static const char
> > > > > > > > > > > > > > > > > > *topology_ref_history_type_to_str(enum
> > > > > > > > > > > > > > > > > > +drm_dp_mst_topology_history_type type)=
 {
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 if (type =3D=3D
> > > > > > > > > > > > > > > > > > DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r=
eturn "Port";
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 else
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r=
eturn "MSTB"; }
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0static void
> > > > > > > > > > > > > > > > > > -__dump_topology_ref_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history *histor=
y,
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 void *ptr, const
> > > > > > > > > > > > > > > > > > char
> > > > > > > > > > > > > > > > > > *type_str)
> > > > > > > > > > > > > > > > > > +dump_topology_ref_history(struct
> > > > > > > > > > > > > > > > > > +drm_dp_mst_topology_ref_history *histo=
ry,
> > > > > > > > > > > > > > > > > > struct
> > > > > > > > > > > > > > > > > > +drm_printer p)
> > > > > > > > > > > > > > > > > > =A0{
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 struct drm_printer p =3D
> > > > > > > > > > > > > > > > > > drm_debug_printer(DBG_PREFIX);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 char *connector_name =3D =
NULL;
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 char *buf =3D kzalloc(P=
AGE_SIZE,
> > > > > > > > > > > > > > > > > > GFP_KERNEL);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 void *ptr;
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 int i;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 if (!buf)
> > > > > > > > > > > > > > > > > > @@ -1656,14 +1647,29 @@
> > > > > > > > > > > > > > > > > > __dump_topology_ref_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history *histor=
y,
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 if (!history->len)
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 goto out;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 /* Get a pointer to the a=
ctual MSTB/port
> > > > > > > > > > > > > > > > > > so
> > > > > > > > > > > > > > > > > > we
> > > > > > > > > > > > > > > > > > can
> > > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > > +memory
> > > > > > > > > > > > > > > > > > address to the kernel log */
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 if (history->type =3D=3D
> > > > > > > > > > > > > > > > > > DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p=
tr =3D container_of(history,
> > > > > > > > > > > > > > > > > > struct
> > > > > > > > > > > > > > > > > > +drm_dp_mst_port,
> > > > > > > > > > > > > > > > > > topology_ref_history);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 else
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p=
tr =3D container_of(history,
> > > > > > > > > > > > > > > > > > struct
> > > > > > > > > > > > > > > > > > +drm_dp_mst_branch,
> topology_ref_history);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 /* First, sort the list=
 so that it goes
> > > > > > > > > > > > > > > > > > from
> > > > > > > > > > > > > > > > > > oldest
> > > > > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > > > > newest
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0 * reference entry
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0 */
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 sort(history->entries, =
history->len,
> > > > > > > > > > > > > > > > > > sizeof(*history->entries),
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 topology=
_ref_history_cmp, NULL);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 drm_printf(&p, "%s (%p) t=
opology count
> > > > > > > > > > > > > > > > > > reached
> > > > > > > > > > > > > > > > > > 0,
> > > > > > > > > > > > > > > > > > dumping history:\n",
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 type_str, ptr);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 if (history->type =3D=3D
> > > > > > > > > > > > > > > > > > DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s=
truct drm_dp_mst_port *port =3D
> > > > > > > > > > > > > > > > > > ptr;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
f (port->connector)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 connector_name =3D
> > > > > > > > > > > > > > > > > > +port->connector->name;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 }
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 if (connector_name)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d=
rm_printf(&p, "Port %s (%p)
> > > > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > > > ref
> > > > > > > > > > > > > > > > > > +history:\n",
> > > > > > > > > > > > > > > > > > connector_name, ptr);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 else
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d=
rm_printf(&p, "%s (%p) topology
> > > > > > > > > > > > > > > > > > ref
> > > > > > > > > > > > > > > > > > +history:\n",
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +topology_ref_history_type_to_str(histo=
ry-
> > > > > > > > > > > > > > > > > > >type),
> > > > > > > > > > > > > > > > > > ptr);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 for (i =3D 0; i < histo=
ry->len; i++) {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 const struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_entry
> > > > > > > > > > > > > > > > > > *entry =3D @@
> > > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > > 1682,24 +1688,92 @@
> > > > > > > > > > > > > > > > > > __dump_topology_ref_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history *histor=
y,
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ts_nsec, rem_nsec /
> > > > > > > > > > > > > > > > > > 1000,
> > > > > > > > > > > > > > > > > > buf);
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 }
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 /* Now free the history, =
since this is
> > > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > > only
> > > > > > > > > > > > > > > > > > time
> > > > > > > > > > > > > > > > > > we expose it */
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 kfree(history->entries);
> > > > > > > > > > > > > > > > > > =A0out:
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 kfree(buf);
> > > > > > > > > > > > > > > > > > =A0}
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +/**
> > > > > > > > > > > > > > > > > > + * drm_dp_mst_dump_topology_refs -
> helper
> > > > > > > > > > > > > > > > > > function
> > > > > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > > > > +dumping the topology ref history
> > > > > > > > > > > > > > > > > > + * @m: File to print to
> > > > > > > > > > > > > > > > > > + * @mgr: &struct
> drm_dp_mst_topology_mgr to
> > > > > > > > > > > > > > > > > > use
> > > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > > + * Prints the topology ref history of =
all
> > > > > > > > > > > > > > > > > > ports
> > > > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > > > MSTBs
> > > > > > > > > > > > > > > > > > +on @mgr that are still in memory,
> > > > > > > > > > > > > > > > > > + * regardless of whether they're actua=
lly
> > > > > > > > > > > > > > > > > > still
> > > > > > > > > > > > > > > > > > reachable
> > > > > > > > > > > > > > > > > > +through the topology or not. Only enab=
led
> > > > > > > > > > > > > > > > > > + * when
> > > > > > > > > > > > > > > > > >
> %CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is
> > > > > > > > > > > > > > > > > > enabled.
> > > > > > > > > > > > > > > > > > +Can be implemented by drivers to assis=
t
> > > > > > > > > > > > > > > > > > + * with debugging leaks in the DP MST
> > > > > > > > > > > > > > > > > > helpers.
> > > > > > > > > > > > > > > > > > + */
> > > > > > > > > > > > > > > > > > +void
> drm_dp_mst_dump_topology_refs(struct
> > > > > > > > > > > > > > > > > > seq_file
> > > > > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > > > > +struct drm_dp_mst_topology_mgr *mgr) {
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct drm_dp_mst_topolog=
y_ref_history
> > > > > > > > > > > > > > > > > > *history;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct drm_printer p =3D
> > > > > > > > > > > > > > > > > > drm_seq_file_printer(m);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 mutex_lock(&mgr-
> > > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 list_for_each_entry(histo=
ry,
> > > > > > > > > > > > > > > > > > +&mgr->topology_ref_history_list,
> > > > > > > > > > > > > > > > > > +node)
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > dump_topology_ref_history(history,
> > > > > > > > > > > > > > > > > > p);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 mutex_unlock(&mgr-
> > > > > > > > > > > > > > > > > > > topology_ref_history_lock);
> > > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > >
> +EXPORT_SYMBOL(drm_dp_mst_dump_topology_refs);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +static void
> > > > > > > > > > > > > > > > > > +__init_topology_ref_history(struct
> > > > > > > > > > > > > > > > > > +drm_dp_mst_topology_ref_history
> > > > > > > > > > > > > > > > > > *history,
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > > +*mgr,
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum
> > > > > > > > > > > > > > > > > > +drm_dp_mst_topology_history_type
> > > > > > > > > > > > > > > > > > +type) {
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 history->type =3D type;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 INIT_LIST_HEAD(&history->=
node);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 mutex_lock(&mgr-
> > > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 list_add(&history->node,
> > > > > > > > > > > > > > > > > > +&mgr->topology_ref_history_list);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 mutex_unlock(&mgr-
> > > > > > > > > > > > > > > > > > > topology_ref_history_lock);
> > > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +static void
> > > > > > > > > > > > > > > > > > +__destroy_topology_ref_history(struct
> > > > > > > > > > > > > > > > > > +drm_dp_mst_topology_ref_history
> > > > > > > > > > > > > > > > > > *history,
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > > +*mgr) {
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 mutex_lock(&mgr-
> > > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 list_del(&mgr-
> > > > > > > > > > > > > > > > > > >topology_ref_history_list);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 mutex_unlock(&mgr-
> > > > > > > > > > > > > > > > > > > topology_ref_history_lock);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 kfree(history->entries); =
}
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > > > > +init_port_topology_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_port *port) {
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +__init_topology_ref_history(&port-
> > > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > > +mgr,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > >
> +DRM_DP_MST_TOPOLOGY_HISTORY_PORT);
> > > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > > > > +init_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_branch *mstb) =
{
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +__init_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > > +mgr,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > >
> +DRM_DP_MST_TOPOLOGY_HISTORY_MSTB);
> > > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > > > > +destroy_port_topology_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +__destroy_topology_ref_history(&port-
> > > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > > +port->mgr); }
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > > > > +destroy_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > > +*mstb) {
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +__destroy_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > > +mstb->mgr); }
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0static __always_inline void
> > > > > > > > > > > > > > > > > > =A0dump_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > > *mstb)
> > > > > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > > __dump_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > > mstb,
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "MSTB");
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 dump_topology_ref_history=
(&mstb-
> > > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > > +drm_debug_printer(DBG_PREFIX));
> > > > > > > > > > > > > > > > > > =A0}
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0static __always_inline void
> > > > > > > > > > > > > > > > > > =A0dump_port_topology_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > > __dump_topology_ref_history(&port-
> > > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > > port,
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Port");
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 dump_topology_ref_history=
(&port-
> > > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > > +drm_debug_printer(DBG_PREFIX));
> > > > > > > > > > > > > > > > > > =A0}
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0static __always_inline void @@ -1729=
,6
> > > > > > > > > > > > > > > > > > +1803,14
> > > > > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > > > > topology_ref_history_unlock(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr)=A0 }=A0 #=
else
> > > > > > > > > > > > > > > > > > static
> > > > > > > > > > > > > > > > > > inline
> > > > > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > > > > +init_port_topology_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_port *port); s=
tatic
> > > > > > > > > > > > > > > > > > inline
> > > > > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > > > Should also add the bracket, otherwise wi=
ll get
> > > > > > > > > > > > > > > > > warnings.
> > > > > > > > > > > > > > > > > =3D> static inline void
> > > > > > > > > > > > > > > > > init_port_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > > {};
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +init_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_branch *mstb);
> static
> > > > > > > > > > > > > > > > > > inline
> > > > > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > > > Same as above
> > > > > > > > > > > > > > > > > =3D> static inline void
> > > > > > > > > > > > > > > > > init_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > *mstb)
> > > > > > > > > > > > > > > > > {};
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +destroy_port_topology_history(struct
> > > > > > > > > > > > > > > > > > +drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > > +*port); static inline void
> > > > > > > > > > > > > > > > > destroy_port_topology_history() takes one
> > > > > > > > > > > > > > > > > parameter
> > > > > > > > > > > > > > > > > only
> > > > > > > > > > > > > > > > > which
> > > > > > > > > > > > > > > > > is port.
> > > > > > > > > > > > > > > > > =3D> destroy_port_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > > {};
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +destroy_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > > +drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > > +*mstb); static inline void
> > > > > > > > > > > > > > > > > destroy_mstb_topology_history() takes one
> > > > > > > > > > > > > > > > > parameter
> > > > > > > > > > > > > > > > > only
> > > > > > > > > > > > > > > > > which
> > > > > > > > > > > > > > > > > is mstb =3D>
> destroy_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > *mstb) {};
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0topology_ref_history_lock(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > > *mgr) {} static inline void
> > > > > > > > > > > > > > > > > > topology_ref_history_unlock(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr) {} @@ -
> 1740,6
> > > > > > > > > > > > > > > > > > +1822,25
> > > > > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > > > > dump_port_topology_history(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > > > {}
> > > > > > > > > > > > > > > > > > #define save_port_topology_ref(port, ty=
pe)
> > > > > > > > > > > > > > > > > > #endif
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +static struct drm_dp_mst_branch *
> > > > > > > > > > > > > > > > > > +drm_dp_add_mst_branch_device(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > > +*mgr,
> > > > > > > > > > > > > > > > > > +u8 lct, u8 *rad) {
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct drm_dp_mst_branch =
*mstb;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 mstb =3D kzalloc(sizeof(*=
mstb),
> > > > > > > > > > > > > > > > > > GFP_KERNEL);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 if (!mstb)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r=
eturn NULL;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 mstb->lct =3D lct;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 if (lct > 1)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 m=
emcpy(mstb->rad, rad, lct / 2);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 INIT_LIST_HEAD(&mstb->por=
ts);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 kref_init(&mstb->topology=
_kref);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 kref_init(&mstb->malloc_k=
ref);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 init_mstb_topology_histor=
y(mgr, mstb);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 return mstb;
> > > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0static void
> > > > > > > > > > > > > > > > > > drm_dp_destroy_mst_branch_device(struct
> > > > > > > > > > > > > > > > > > kref
> > > > > > > > > > > > > > > > > > *kref) {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 struct drm_dp_mst_branc=
h *mstb =3D @@ -
> > > > > > > > > > > > > > > > > > 1747,6
> > > > > > > > > > > > > > > > > > +1848,7
> > > > > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > > > > static void
> > > > > > > > > > > > > > > > > > drm_dp_destroy_mst_branch_device(struct
> > > > > > > > > > > > > > > > > > kref *kref)
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 struct drm_dp_mst_topol=
ogy_mgr *mgr =3D
> > > > > > > > > > > > > > > > > > mstb-
> > > > > > > > > > > > > > > > > > > mgr;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 dump_mstb_topology_hist=
ory(mstb);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 destroy_mstb_topology_his=
tory(mstb);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 INIT_LIST_HEAD(&mstb->d=
estroy_next);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > @@ -1856,6 +1958,7 @@ static void
> > > > > > > > > > > > > > > > > > drm_dp_destroy_port(struct
> > > > > > > > > > > > > > > > > > kref
> > > > > > > > > > > > > > > > > > *kref)
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 struct drm_dp_mst_topol=
ogy_mgr *mgr =3D
> > > > > > > > > > > > > > > > > > port-
> > > > > > > > > > > > > > > > > > > mgr;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 dump_port_topology_hist=
ory(port);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 destroy_port_topology_his=
tory(port);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 /* There's nothing that=
 needs locking to
> > > > > > > > > > > > > > > > > > destroy
> > > > > > > > > > > > > > > > > > an
> > > > > > > > > > > > > > > > > > input port yet */
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 if (port->input) {
> > > > > > > > > > > > > > > > > > @@ -2135,7 +2238,7 @@
> > > > > > > > > > > > > > > > > > drm_dp_port_set_pdt(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_port *port, u8 new_pdt,
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D
> > > > > > > > > > > > > > > > > > drm_dp_mst_register_i2c_bus(port);
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 } else {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 lct =3D
> > > > > > > > > > > > > > > > > > drm_dp_calculate_rad(port,
> > > > > > > > > > > > > > > > > > rad);
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 mstb =3D
> > > > > > > > > > > > > > > > > > drm_dp_add_mst_branch_device(lct, rad);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 mstb =3D
> > > > > > > > > > > > > > > > > > +drm_dp_add_mst_branch_device(mgr, lct,
> rad);
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 if (!mstb) {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -ENOMEM;
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drm_err(mgr-
> > > > > > > > > > > > > > > > > > >dev,
> > > > > > > > > > > > > > > > > > "Failed
> > > > > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > > > > create MSTB for port %p", port); @@ -23=
66,6
> > > > > > > > > > > > > > > > > > +2469,8 @@
> > > > > > > > > > > > > > > > > > drm_dp_mst_add_port(struct drm_device
> *dev,
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0 */
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 drm_dp_mst_get_mstb_mal=
loc(mstb);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 init_port_topology_histor=
y(mgr, port);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 return port;
> > > > > > > > > > > > > > > > > > =A0}
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > @@ -3745,7 +3850,7 @@ int
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr_set_mst(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr, bool ms
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 }
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 /* add initial branch device at
> > > > > > > > > > > > > > > > > > LCT
> > > > > > > > > > > > > > > > > > 1 */
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 m=
stb =3D
> > > > > > > > > > > > > > > > > > drm_dp_add_mst_branch_device(1,
> > > > > > > > > > > > > > > > > > NULL);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 m=
stb =3D
> > > > > > > > > > > > > > > > > > drm_dp_add_mst_branch_device(mgr,
> > > > > > > > > > > > > > > > > > 1,
> > > > > > > > > > > > > > > > > > +NULL);
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 if (mstb =3D=3D NULL) {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -ENOMEM;
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 goto out_unlock; @@ -
> > > > > > > > > > > > > > > > > > 5512,14
> > > > > > > > > > > > > > > > > > +5617,16
> > > > > > > > > > > > > > > > > > @@ int
> drm_dp_mst_topology_mgr_init(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 mutex_init(&mgr->delaye=
d_destroy_lock);
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 mutex_init(&mgr->up_req=
_lock);
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 mutex_init(&mgr->probe_=
lock); -#if
> > > > > > > > > > > > > > > > > >
> IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_RE
> > > > > > > > > > > > > > > > > > FS)
> > > > > > > > > > > > > > > > > > -=A0=A0=A0=A0 mutex_init(&mgr-
> > > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > > -#endif
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 INIT_LIST_HEAD(&mgr->tx=
_msg_downq);
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 INIT_LIST_HEAD(&mgr-
> >destroy_port_list);
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 INIT_LIST_HEAD(&mgr-
> > > > > > > > > > > > > > > > > > > destroy_branch_device_list);
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 INIT_LIST_HEAD(&mgr->up=
_req_list);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +#if
> > > > > > > > > > > > > > > > > >
> IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_RE
> > > > > > > > > > > > > > > > > > FS)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 mutex_init(&mgr-
> > > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 INIT_LIST_HEAD(&mgr-
> > > > > > > > > > > > > > > > > > > topology_ref_history_list);
> > > > > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 /*
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0 * delayed_destroy_wo=
rk will be queued
> > > > > > > > > > > > > > > > > > on a
> > > > > > > > > > > > > > > > > > dedicated
> > > > > > > > > > > > > > > > > > WQ, so that any
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0 * requeuing will be =
also flushed when
> > > > > > > > > > > > > > > > > > deiniting
> > > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > > topology manager.
> > > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > >
> a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > > > > > > > > > >
> b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > > > > > > > > > > index 1cbe01048b93..53ec7c1daada 100644
> > > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > >
> a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > > > > > > > > > > +++
> > > > > > > > > > > > > > > > > >
> b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > > > > > > > > > > @@ -29,9 +29,13 @@
> > > > > > > > > > > > > > > > > > =A0 */
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0#include <linux/debugfs.h>
> > > > > > > > > > > > > > > > > > +#include <drm/drm_dp_mst_helper.h>
> #include
> > > > > > > > > > > > > > > > > > +<drm/drm_encoder.h>
> > > > > > > > > > > > > > > > > > =A0#include <nvif/class.h>
> > > > > > > > > > > > > > > > > > =A0#include <nvif/if0001.h>
> > > > > > > > > > > > > > > > > > +#include <nouveau_encoder.h>
> > > > > > > > > > > > > > > > > > =A0#include "nouveau_debugfs.h"
> > > > > > > > > > > > > > > > > > +#include "nouveau_display.h"
> > > > > > > > > > > > > > > > > > =A0#include "nouveau_drv.h"
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0static int
> > > > > > > > > > > > > > > > > > @@ -68,6 +72,34 @@
> > > > > > > > > > > > > > > > > > nouveau_debugfs_strap_peek(struct
> > > > > > > > > > > > > > > > > > seq_file *m, void
> > > > > > > > > > > > > > > > > > *data)
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 return 0;
> > > > > > > > > > > > > > > > > > =A0}
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +#ifdef
> CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > > > > +static int
> > > > > > > > > > > > > > > > > >
> nouveau_debugfs_mst_topology_history(struct
> > > > > > > > > > > > > > > > > > +seq_file *m, void *data) {
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct drm_info_node *nod=
e =3D m-
> >private;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct drm_device *dev =
=3D node->minor-
> > > > > > > > > > > > > > > > > > >dev;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct drm_encoder *encod=
er;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct nouveau_display *d=
isp =3D
> > > > > > > > > > > > > > > > > > nouveau_display(dev);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 if (disp->disp.object.ocl=
ass <
> > > > > > > > > > > > > > > > > > GF110_DISP)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r=
eturn -EINVAL;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 drm_for_each_encoder(enco=
der, dev) {
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s=
truct nv50_mstm *mstm;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /=
* We need the real encoder for
> > > > > > > > > > > > > > > > > > each
> > > > > > > > > > > > > > > > > > MST
> > > > > > > > > > > > > > > > > > mgr
> > > > > > > > > > > > > > > > > > +*/
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
f (encoder->encoder_type !=3D
> > > > > > > > > > > > > > > > > > +DRM_MODE_ENCODER_TMDS)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 m=
stm =3D nouveau_encoder(encoder)-
> > > > > > > > > > > > > > > > > > > dp.mstm;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
f (!mstm)
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s=
eq_printf(m, "MSTM on %s:\n",
> > > > > > > > > > > > > > > > > > encoder-
> > > > > > > > > > > > > > > > > > > name);
> > > > > > > > > > > > > > > > > >
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drm_dp_mst_dump_topology_refs(m,
> > > > > > > > > > > > > > > > > > &mstm-
> > > > > > > > > > > > > > > > > > > mgr);
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 }
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 return 0;
> > > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0static int
> > > > > > > > > > > > > > > > > > =A0nouveau_debugfs_pstate_get(struct se=
q_file
> > > > > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > > > > *data)
> > > > > > > > > > > > > > > > > > { @@
> > > > > > > > > > > > > > > > > > -213,6
> > > > > > > > > > > > > > > > > > +245,9 @@ static const struct file_oper=
ations
> > > > > > > > > > > > > > > > > > nouveau_pstate_fops =3D {=A0 static str=
uct
> > > > > > > > > > > > > > > > > > drm_info_list
> > > > > > > > > > > > > > > > > > nouveau_debugfs_list[] =3D {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 { "vbios.rom",
> > > > > > > > > > > > > > > > > > nouveau_debugfs_vbios_image,
> > > > > > > > > > > > > > > > > > 0,
> > > > > > > > > > > > > > > > > > NULL
> > > > > > > > > > > > > > > > > > },
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 { "strap_peek",
> > > > > > > > > > > > > > > > > > nouveau_debugfs_strap_peek,
> > > > > > > > > > > > > > > > > > 0,
> > > > > > > > > > > > > > > > > > NULL
> > > > > > > > > > > > > > > > > > },
> > > > > > > > > > > > > > > > > > +#ifdef
> CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 { "dp_mst_topology_refs",
> > > > > > > > > > > > > > > > > > +nouveau_debugfs_mst_topology_history, =
0,
> NULL
> > > > > > > > > > > > > > > > > > },
> > > > > > > > > > > > > > > > > > #endif
> > > > > > > > > > > > > > > > > > =A0};
> > > > > > > > > > > > > > > > > > =A0#define NOUVEAU_DEBUGFS_ENTRIES
> > > > > > > > > > > > > > > > > > ARRAY_SIZE(nouveau_debugfs_list)
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > diff --git
> a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > > > > > > > > > > > > > > > 78044ac5b59b..e3a73d8d97c0
> > > > > > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > > > > @@ -35,6 +35,11 @@ enum
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_type {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 DRM_DP_MST_TOPOLOGY_REF=
_PUT,
> > > > > > > > > > > > > > > > > > =A0};
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +enum drm_dp_mst_topology_history_type =
{
> > > > > > > > > > > > > > > > > >
> +=A0=A0=A0=A0 DRM_DP_MST_TOPOLOGY_HISTORY_PORT,
> > > > > > > > > > > > > > > > > >
> +=A0=A0=A0=A0 DRM_DP_MST_TOPOLOGY_HISTORY_MSTB, };
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0struct drm_dp_mst_topology_ref_histo=
ry {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 struct drm_dp_mst_topol=
ogy_ref_entry {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 enum
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_type
> > > > > > > > > > > > > > > > > > type;
> > > > > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > > > > -43,6
> > > > > > > > > > > > > > > > > > +48,9 @@ struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 depot_stack_handle_t backtrace;
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 } *entries;
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 int len;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 enum
> drm_dp_mst_topology_history_type
> > > > > > > > > > > > > > > > > > type;
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct list_head node;
> > > > > > > > > > > > > > > > > > =A0};
> > > > > > > > > > > > > > > > > > =A0#endif /*
> > > > > > > > > > > > > > > > > >
> IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_RE
> > > > > > > > > > > > > > > > > > FS)
> > > > > > > > > > > > > > > > > > */
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > @@ -769,6 +777,12 @@ struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr {
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0 *
> > > > > > > > > > > > > > > > > > &drm_dp_mst_branch.topology_ref_history=
.
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0=A0 */
> > > > > > > > > > > > > > > > > > =A0=A0=A0=A0=A0 struct mutex topology_r=
ef_history_lock;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 /**
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0 * @topology_ref_histor=
y_list: contains
> > > > > > > > > > > > > > > > > > a
> > > > > > > > > > > > > > > > > > list
> > > > > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > > > > +topology ref
> > > > > > > > > > > > > > > > > > histories for any MSTBs or
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0 * ports that are still=
 in memory
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0=A0 */
> > > > > > > > > > > > > > > > > > +=A0=A0=A0=A0 struct list_head
> > > > > > > > > > > > > > > > > > topology_ref_history_list;
> > > > > > > > > > > > > > > > > > =A0#endif
> > > > > > > > > > > > > > > > > > =A0};
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > @@ -873,6 +887,10 @@ void
> > > > > > > > > > > > > > > > > > drm_dp_mst_put_port_malloc(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_port *port);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0struct drm_dp_aux
> > > > > > > > > > > > > > > > > > *drm_dp_mst_dsc_aux_for_port(struct
> > > > > > > > > > > > > > > > > > drm_dp_mst_port *port);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +#ifdef
> CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > > > > +void
> drm_dp_mst_dump_topology_refs(struct
> > > > > > > > > > > > > > > > > > seq_file
> > > > > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > > > > +struct drm_dp_mst_topology_mgr *mgr);
> #endif
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > =A0extern const struct drm_private_stat=
e_funcs
> > > > > > > > > > > > > > > > > > drm_dp_mst_topology_state_funcs;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =A0/**
> > > > > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > > > > 2.31.1
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > > Cheers,
> > > > > > > > > > > > > > > > =A0Lyude Paul (she/her)
> > > > > > > > > > > > > > > > =A0Software Engineer at Red Hat
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > --
> > > > > > > > > > > > Cheers, Lyude Paul (she/her) Software Engineer at R=
ed
> Hat
> > > > > > > > > > > --
> > > > > > > > > > > Regards,
> > > > > > > > > > > Wayne Lin
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > Cheers,
> > > > > > > > > > =A0Lyude Paul (she/her)
> > > > > > > > > > =A0Software Engineer at Red Hat
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > Cheers,
> > > > > > =A0Lyude Paul (she/her)
> > > > > > =A0Software Engineer at Red Hat
> > > > >
> > > >
> > > > --
> > > > Cheers,
> > > > =A0Lyude Paul (she/her)
> > > > =A0Software Engineer at Red Hat
> > >
> > > --
> > > Regards,
> > > Wayne Lin
> > >
> >
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
