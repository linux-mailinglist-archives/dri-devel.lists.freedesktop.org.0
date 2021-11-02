Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3444258C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 03:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2CE6F882;
	Tue,  2 Nov 2021 02:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461226F882
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 02:19:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBVg4r41R8SotCsOYh2qJKpi4PKHSIJ4lSjtZhx10WvYJwjfyi9u3VUob0gOVoXNIQRMAOzhgBrxm8y32HC6vSf3i3mCucOF84XZJDUBGg5rAb6eSW/nnQCS+tWkvbNvOEu4aTLB15l10k6bI+NZ+U6Dw0PSvBxBc8C1jQMGnps5vA31dUFmZIbBC6cTOQKkvsh0bbcegjen1+MVquLg3fOdzV9Ovv6oyudP2zLjhFp6phQsCikIi5mIH6oMgAd4l0k4vLnqBiaP+AAwcrtChCE2kL3oc5xoJu1HE9NDcZhGgQ1HAYeVeTqxa7BPlmn+/uR9/uIOOWqGaKtUwSRLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMc40WzOvF4eA/CE2avahAj7lqbLdhD//BFg/yMhJEQ=;
 b=QVxovuZvZyBi0XJJeZQ0SHFjAiKxuge6wFwXe0BUBYD66q/K8/YqRyIEOYvtO0lEmQWsMbsKKnLQ+znuZEwWthenk6ljAXmT8PDSAla/5sfLItXS6TuPCSeZgodqLPxO0ZqHB6tDpO2LOrDWocIkgaNd0jovkFgZZ+jp+e7oqaWLViUUzRAIVUkzirDG27+l2W93ygUgYf9JpQ+TzbjSuQx9h29wc7p/Zzs+/jmmnWij2EBGaKbsTGz7WXDXezagHQtrn8y6KrJd8actajojuPnJVAU0Cz7vNoJ50DSuQm9eqGGcuAzFfMgRrnsz12dJvNg3nhoneHbC3iRU5Cq2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMc40WzOvF4eA/CE2avahAj7lqbLdhD//BFg/yMhJEQ=;
 b=NDjxvpNv6ufmN6Te4ceH9v16tmnkBj8N7TnX3IrXXkTR+zKfBye1E3QLw1VELiID4zNWrzg34XDdLelmcpTeT7iHGLNlXWqvCUutVLr7rzFsKdJr19GStnpjeO4KbR1+2aXwwXRhMohHDDARw+DnwaYkYf7bzs8EKae9ybWDbsE=
Received: from MWHPR12MB1631.namprd12.prod.outlook.com (2603:10b6:301:f::19)
 by MWHPR12MB1903.namprd12.prod.outlook.com (2603:10b6:300:108::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 02:19:23 +0000
Received: from MWHPR12MB1631.namprd12.prod.outlook.com
 ([fe80::48ee:f48:5a1:dcd8]) by MWHPR12MB1631.namprd12.prod.outlook.com
 ([fe80::48ee:f48:5a1:dcd8%8]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 02:19:23 +0000
From: "Yuan, Perry" <Perry.Yuan@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
Thread-Topic: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
Thread-Index: AQHXzudL2995hzb9gUSl5xB6lKH0RavupMsAgADbG0A=
Date: Tue, 2 Nov 2021 02:19:22 +0000
Message-ID: <MWHPR12MB1631610D235FCC3B47064F6B9C8B9@MWHPR12MB1631.namprd12.prod.outlook.com>
References: <20211101061053.38173-1-Perry.Yuan@amd.com>
 <87a6iodnz7.fsf@intel.com>
In-Reply-To: <87a6iodnz7.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-02T02:19:20Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=ca4486da-c024-46a4-b6b7-bdb796a56ed2;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75df1b40-5b1b-4e11-7fea-08d99da72f69
x-ms-traffictypediagnostic: MWHPR12MB1903:
x-microsoft-antispam-prvs: <MWHPR12MB190344B1A03F21D1A9945CE29C8B9@MWHPR12MB1903.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HiLNDwOD/3gk28O1rTtwpu2jVLTicPzfkx8vAY0gNUwikP6J0A48HKNSsPK4m29qgdhHtk/hzE1Z5pB8AbqllIPZ//cCZrY84RxnuHIEDXG1/8Pdhh+U4w0VbIKq0wjzN7B8LozKK0EifiZVR9Tq8ZwFHC2HnhpGoxYpVvrfzdLS+DG3QW0HE7g+AqDHCWvRfepVK4eXljTyLXpIUHkx+MHzHRZzamS3AfBxfEztWmUq+ksxFCxtBARYjlDuMyJldvhJeXtA/9jvLa4tUQ0jNyv51ZCPHDkNsxcCipmj6LspeQnZzuZtKTca2ownBRrnymVXe/1reM4JdprMMuTkljRJQ0RPKP9eZT+83XwWQCnVYPNfHxh25i49dFsBJn4JIYN0Xs2ynpuLLwjZr5Z2kOELjwHJ8xhceW1YzBkjPQu4b+0Le3nulHyeTgeatmzetEtwsTBfmn14G1jj7BKSWN05jCTsARUojsXfJQHB8cgJIlJ9Y3nDcEwYkdjPUfVKuPG8Y/9Y8QhOwBUAOOJhIVTpKHy/MjClQwDzOj3QsUcMvYUyPGLZUhofxiBbpK471HmMwFeZeiVIGYGFe9/Pbywxt6U/SRs/4EaYAVH87yE4cT3sncmQDogQYRQ0PbkWXYKOdaD5ZdZVn211/qdTko+y4to9abLhDNsmYxuFPzSs8cYWK6YhLhoxk4SqZ+88O5dhZx1i3VxKkpleuLDp8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1631.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(64756008)(26005)(110136005)(5660300002)(54906003)(316002)(38070700005)(52536014)(9686003)(8936002)(55016002)(966005)(38100700002)(66946007)(86362001)(186003)(76116006)(71200400001)(2906002)(4326008)(66476007)(66556008)(66446008)(508600001)(7696005)(6506007)(53546011)(122000001)(83380400001)(33656002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XPyoYAm+Sf5aVTy2ld7Wi+ptLvQXPgy8NEEtHlv3gknAl+ER8eJSvEOD+ie/?=
 =?us-ascii?Q?nYVDJbxwLsrBnM0hww3UlqiZkvrJYRCkaxEovr5iNA+cpYVtDuEWDcfYiMjX?=
 =?us-ascii?Q?f2bRW54K0aPMUeLjT3twfU91GPLJYYNyn7E3uFg6fZYFa0aY2tpmXPXoE3Oh?=
 =?us-ascii?Q?T9pGDCwWffO5/goYnNqeUJabiGA0SG26jSmyvjMK3/jdbaVqvxwsgRuisExA?=
 =?us-ascii?Q?l/dWnEc15LDmhmnuvd0/roLlaluW8pBNJxObAyPvfAzKYyHxjHN8Z1drdMqZ?=
 =?us-ascii?Q?xhdCFq1xXEEugjoQCoDK6fBq/lsIUHEk6XbtoH9GDqjGudAdcIMwsdk7kVpq?=
 =?us-ascii?Q?bjqQqAMn+1cuyoX4oRpidzgeuGe0YxkMgvkFNFMrViuXyvT89zFhyn0zu/by?=
 =?us-ascii?Q?VXm1Id7ljAqh2BJ3M3BaHoU8KQv0/5HcnVy52oyL65RA0mgvP23PrVWFN2O4?=
 =?us-ascii?Q?DKApXIKE2YrS1n7A2Rga5T3lXLkTHvAjKU/io0HsE1u+VF80xLQZrt1VfZRp?=
 =?us-ascii?Q?q/nac403160bmEch1eAM0h/zdY0P9TqTMObn/8yylH1xzTgCphByFULvzB16?=
 =?us-ascii?Q?KP7RDJn4jmuqzcaThFyaTgBX7gse7s1Wdl8nMNwkffdid+MgIRMRvEF0EMDd?=
 =?us-ascii?Q?pa67oQmQUrcfb4yXmJ9ngknB2+NjjvT1ktXqXAzeQn3LAGWy4fJeZ4ORADds?=
 =?us-ascii?Q?4l07mTUmROOeeBAlMJm8t/39OeXwr+pZ6l357mVFhl4DI5uYHcIv1ORn7+ie?=
 =?us-ascii?Q?Cyz97xxREaWnBTXVFkSDBarfL90JtTl2cz9vBC9h4wiZ//lSQwb7vzJZr2wq?=
 =?us-ascii?Q?JBhj/UcgNWf1/v5gyilelhA3fEAHiXsf72FrYFTlse5eEMHxQVXkjs1dgDvc?=
 =?us-ascii?Q?5j0Jyfj0wSSBU8X2ULK6UqgvQXGkRf3Os/4i6jNhjEw1chhAifOi3ZiWcChA?=
 =?us-ascii?Q?FdBxffBv0xOa8cTnjUHDmys6lxzhtXEaZkbkGFdS3KnJkCw7IJjpL+tOO14l?=
 =?us-ascii?Q?XaF5O9yhPbLcgQVR7Wa2pxdh5w9XBqsInc9ks92zPXcbhvWMvQIiJ/1aoSA/?=
 =?us-ascii?Q?MnYq6p3gfFTw+bRnr/pNeqX+bjiFYmnYDUbVpr/AA1ZC5F1rVmXzG2zGK/e9?=
 =?us-ascii?Q?31TuXVDzdZkBLQ1HmzSlNEqu6IC8W5oZ39MEJl37NeS5fdghu83pxBQaHSRf?=
 =?us-ascii?Q?8Mr5FBT0/J9ViUo2ig9Td1u4qkiRGFHX27EGU0caKRqT5h8Qb7WDfEChGQ8J?=
 =?us-ascii?Q?M38McVBWa2P7ITWpiffJf9j/ZtPlqnMVYSnrFveBG5c9fSStr/2S1kNnMg6G?=
 =?us-ascii?Q?kPYtBZqETa+IW0kDTNkJSsvmCXYJPGW5bqtBP/ugv7KcJ1PuzM4EZ+wliCGZ?=
 =?us-ascii?Q?c34z/PznOilwVleTFXL2SHcDBJmiTQuADSGvA9YAmwbWQ9uEQMVxGKBENeK5?=
 =?us-ascii?Q?j3D8DqlPo1kPuAVWFQYMTAlgCQgm7u++upQ6JRuaWUb60Q7O1rR/I5W5jq4k?=
 =?us-ascii?Q?lWKWDvgtTuvXAG8/Y0V037owMAuZuF3lFuf7flm9HK0Yyz6JOHrXjk+8xJKc?=
 =?us-ascii?Q?NlLBaof0nVzyc+C0xFT2ToY53gwsMq1lXbA75xpzNlEBlkNwOmFcXO3+LbWK?=
 =?us-ascii?Q?Qw7grcJLHT8YyHKFjSpq6C4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1631.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75df1b40-5b1b-4e11-7fea-08d99da72f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 02:19:22.8638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9N8PPHNdxY5r6afiuwHn9Pl4+IHZsRq5h+mZEnaJ7XJ7/6nh7ztiehHFFrLBPf6X6HFBv6Gio7HuIvmCTFWDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1903
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
Cc: "Huang, Shimmer" <Xinmei.Huang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Hi Jani:
Thanks for your comments.

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, November 1, 2021 9:07 PM
> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel@ffwll.ch>
> Cc: Yuan, Perry <Perry.Yuan@amd.com>; dri-devel@lists.freedesktop.org; li=
nux-
> kernel@vger.kernel.org; Huang, Shimmer <Xinmei.Huang@amd.com>; Huang,
> Ray <Ray.Huang@amd.com>
> Subject: Re: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereferenc=
e on
> drm_dp_dpcd_access
>=20
> [CAUTION: External Email]
>=20
> On Mon, 01 Nov 2021, Perry Yuan <Perry.Yuan@amd.com> wrote:
> > Fix below crash by adding a check in the drm_dp_dpcd_access which
> > ensures that aux->transfer was actually initialized earlier.
>=20
> Gut feeling says this is papering over a real usage issue somewhere else.=
 Why is
> the aux being used for transfers before ->transfer has been set? Why shou=
ld the
> dp helper be defensive against all kinds of misprogramming?
>=20
>=20
> BR,
> Jani.
>=20

The issue was found by Intel IGT test suite, graphic by pass test case.
https://gitlab.freedesktop.org/drm/igt-gpu-tools
normally use case will not see the issue.=20
To avoid this issue happy again when we run the test case , it will be nice=
 to add a check before the transfer is called.
And we can see that it really needs to have a check here to make ITG &kerne=
l happy.

Perry.

>=20
> >
> > BUG: kernel NULL pointer dereference, address: 0000000000000000 PGD 0
> > P4D 0
> > Oops: 0010 [#1] SMP NOPTI
> > RIP: 0010:0x0
> > Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> > RSP: 0018:ffffa8d64225bab8 EFLAGS: 00010246
> > RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffffa8d64225bb5e
> > RDX: ffff93151d921880 RSI: ffffa8d64225bac8 RDI: ffff931511a1a9d8
> > RBP: ffffa8d64225bb10 R08: 0000000000000001 R09: ffffa8d64225ba60
> > R10: 0000000000000002 R11: 000000000000000d R12: 0000000000000001
> > R13: 0000000000000000 R14: ffffa8d64225bb5e R15: ffff931511a1a9d8
> > FS: 00007ff8ea7fa9c0(0000) GS:ffff9317fe6c0000(0000)
> > knlGS:0000000000000000
> > CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: ffffffffffffffd6 CR3: 000000010d5a4000 CR4: 0000000000750ee0
> > PKRU: 55555554
> > Call Trace:
> > drm_dp_dpcd_access+0x72/0x110 [drm_kms_helper]
> > drm_dp_dpcd_read+0xb7/0xf0 [drm_kms_helper]
> > drm_dp_start_crc+0x38/0xb0 [drm_kms_helper]
> > amdgpu_dm_crtc_set_crc_source+0x1ae/0x3e0 [amdgpu]
> > crtc_crc_open+0x174/0x220 [drm]
> > full_proxy_open+0x168/0x1f0
> > ? open_proxy_open+0x100/0x100
> > do_dentry_open+0x156/0x370
> > vfs_open+0x2d/0x30
> >
> > v2: fix some typo
> >
> > Signed-off-by: Perry Yuan <Perry.Yuan@amd.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c index 6d0f2c447f3b..76b28396001a
> > 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -260,6 +260,10 @@ static int drm_dp_dpcd_access(struct drm_dp_aux
> *aux, u8 request,
> >       msg.buffer =3D buffer;
> >       msg.size =3D size;
> >
> > +     /* No transfer function is set, so not an available DP connector =
*/
> > +     if (!aux->transfer)
> > +             return -EINVAL;
> > +
> >       mutex_lock(&aux->hw_mutex);
> >
> >       /*
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
