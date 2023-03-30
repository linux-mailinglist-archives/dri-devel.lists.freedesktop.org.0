Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233976D0961
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E044010EECD;
	Thu, 30 Mar 2023 15:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE45B10EEC9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 15:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uq+Yu6VVI2OWiWMA/oCvWZ/rxMImTwAmvr8kJnMqXHdnWvXY05BfdNxpTb0sHFolGjdV2f4BNvN06A+iqawiUitEQVw1RH10lIz/4L+IN8mca1MJQaeUj3WHfhG3vJ4OxIdkxsiLC3ETOPiGjMz44kFe2cUY1FesRkVK8WGJY8RqF6pNxZq1XSX2QIVCDVe1dUeSd8ShKQVAFKZL+iN2jlcVTCLE7kjahVxhL6gY+LueBMnn5X2cUoyhaTgasrvYNAmzViDP7IWA1BIUnC0aO4PN3kOdsCkd7xrLPAtARO/1k+GGwNMRP4sQl9CxZh1NvqP2mVpe5H1PTOYkR54kOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xhzJd2oF5Cz/48OmloTIGUXeMholY67InXW31Jnab0=;
 b=bMzSzP9q1GUCzvLGFFW5p77poT55xh+UJW8dw8PREE9cJjLnoiAgKfgZYkWmTZWWWBRdJn1k527xi4+GOE8rSHAitBtRjfNtnn1Xdf7c/LXuNTOEL4Wuo5+JS9vxu4kgEHybJxq+tNSA5nTBUqaCvEGcfMero7bcdgCQ8DRzamxNKw0cGMagAbg+L/RLFM91du3SyGVHUwIafMaUXdA7TsIuR5BgnM50bxZSgBYs3XYUxOR8eVgQF144kogR7a2d8cn5w31Cr9QnR8oDqp3fTSjBkxe/H6AtsSERpmJX+tpFCrURbmp60zMPKBZfDyEDEChmehW/eSzCAWA6CLVJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xhzJd2oF5Cz/48OmloTIGUXeMholY67InXW31Jnab0=;
 b=Wtmup/rJKSBr41oEAVnACAHrE9Yh8GjQBgXC2GNTMWaXKinFa4tFB7nm0blQQ4dEg9teor3vVOSllaRiGnwuKyEcRQ6Cf2pfzcweLcfFhN5oZniUqdfXMSqXgMXUnM0TLzOB8fohaGhRF5X9hHWjpK4lWEkvzM8/iFQCDVs+GhM=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 15:22:34 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2dc6:e9da:297c:75c1]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2dc6:e9da:297c:75c1%6]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 15:22:34 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Julian Wollrath <jwollrath@web.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [Regression bisected] v6.3-rc4 Error scheduling IBs after resume
 from hibernate
Thread-Topic: [Regression bisected] v6.3-rc4 Error scheduling IBs after resume
 from hibernate
Thread-Index: AQHZYxEBKuSmtUILr0O8E/65PIYTo68TcKyw
Date: Thu, 30 Mar 2023 15:22:34 +0000
Message-ID: <BL1PR12MB51448B5D88C17FE50CA34763F78E9@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230330160740.1dbff94b@schienar>
In-Reply-To: <20230330160740.1dbff94b@schienar>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-30T15:22:33Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=24674d4e-241a-4e04-aa48-d529a93b896d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-03-30T15:22:33Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: eeffa42c-eac6-451b-8f0d-ecb54cb1f89c
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CY8PR12MB8196:EE_
x-ms-office365-filtering-correlation-id: 28fafe02-e3ff-45e3-e9e7-08db3132964e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tnOo9HSKG2UKdEciosvegJBi4NES8xvitnATr3DgkTWVjvStD7TWMqapvY+tAIyW08Cw78lHRT4VErelP9FpE9k+SJKI/IIeQl2xjH+HEwomlJAbJvP1a57miG2cJwJYjv1fE9HHMz1MKe/Gnt2qQFHmzOFybWn6AO5aN4vvA0C7/elI9C5eVqcJ6g7boZPrLaQ9ouQBIP6oLJy7033kxvlSlA6VFxKSK/E3FFbYVjrAgRMDsjh9LkS2iwzw8pOYF8mi0YG6v+neX5b9LIgWFdhgVwwpjEta3M+aDdK43shw2sr1Ngimg3r4aDUjGSkGUus72yvt1gUr3dgznXzMpyXQW0o+1qEyIxgiUJJOYHJthuPplQqFzl02vpI/lGcBUZMGlr1qI8OhxZQC1GAhGtogecWnhHTt7jsvxA+Q1Q6N67Bd8twhFs6pduOO1b/Gp+45DA+P6Q3ZpJEVCf0ckZvFmpmmPwPHuHgymv+ivPZYO8H/PiSF5ydLpOyc2XEG0tUT7ybCXGBFKWYiUH+KmlvmMEx9I/SU9pvnTQebw4lwM/0pVKvqqyg8WZw0kZl3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(33656002)(122000001)(8936002)(38100700002)(76116006)(5660300002)(86362001)(4326008)(38070700005)(8676002)(66946007)(41300700001)(52536014)(55016003)(66446008)(66556008)(64756008)(66476007)(966005)(83380400001)(6506007)(53546011)(478600001)(26005)(9686003)(2906002)(186003)(7696005)(71200400001)(316002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?McoYUhzjizIyxLG2P5oUW/JfWP87xFSA7x1lWW02Gq4+n4in6gMUJFm6+cYY?=
 =?us-ascii?Q?Uw1k7DFipEg+g7meZgKxcM6EdvJtnj+pit1eWWm4b+O+OG2KIFmgIXcobB+9?=
 =?us-ascii?Q?nSSJF1OVeDU8pPEg/E7d1ByMlYYwphbybHn78fZcJwsJUA6tafnTreB2DQzi?=
 =?us-ascii?Q?4YGhnj086aHGigs5oTYe6WrBqjfHmBnK/+hOtyQoVD7sputIDr6GJd42nZpW?=
 =?us-ascii?Q?Wx7MGxsrCkgQhuVoXL54fFsJqQfbMA3KF6x2+QZDitNbsvhpvG4okHz1jS5N?=
 =?us-ascii?Q?tLS+JgNOCpG/UIYyLo/JSFjDkMBrvIMmaD3Hl838Z0FPnSMhRijtdRjwAN+T?=
 =?us-ascii?Q?UyCJF6/5bY8lqKsoqZothIGZEKxzAOLCUTfHESVrHvRPIvl7yfDlhDf3O4D7?=
 =?us-ascii?Q?KBo8HiTPIljpSGOdvMDg7dxj0LpMPWFZmVtiv3D6yDc8T7j3IXofeXVbfmki?=
 =?us-ascii?Q?1e7Lm9yIMhV3Y1b9aTNXASlUStIpCYiQ3thhu/ja1npStbjSn8CG1+i7wSDB?=
 =?us-ascii?Q?NWToRt67vlATbI/Ds1E3ThxLxfGtnUXGwakGJVMuvwI4gFXHbQ/iFxof1FOS?=
 =?us-ascii?Q?PiQASGyW8z2Bfe5QqIcLDiehqiLPmVwI7YQs4Y1aqtUcbC2ZnxwQFGZO+ey/?=
 =?us-ascii?Q?tkQfiVbBIXSzqQeENzjqTz1KpR2oSBKM4+wRf5ulLmAcdv3MzhuLaMB5wZxn?=
 =?us-ascii?Q?N+xa43dse3C512j8OuDiMo6yIWekDVDnEvopLdB86vegps32v9Z17cI9MqnN?=
 =?us-ascii?Q?k9Vzm80NgdwXr+iseur0FvWoyaeGnjljvdj39MevbYMbueonABQthr6Pp3vz?=
 =?us-ascii?Q?Su55YLMyHpnQMTw9w0V9kKbSUI4PVIG6E+mryMY5RgYu5N5Um/mqDkD9hiB1?=
 =?us-ascii?Q?mqXd1I1fzedp70IpYTxtxvquZEeeVtreJExD/3o0JOJcbKjFxg7YPa3RyYl1?=
 =?us-ascii?Q?0sXaVpuZo5QQqVARr6WgfZBqnz3AQr0fI6AmBNWnx01cxc3YNlzUiUGmVeys?=
 =?us-ascii?Q?fN84Co6mGdwpnd0W0dapxO4e/WgZUhWwIbRxj4PBCY1rrm00R3dH59+chHdh?=
 =?us-ascii?Q?phxKx6IT4G09BxbdCET6eMx27hpgdFGJ5yCYPDLB9DFf3hMerCrvhxBUflAD?=
 =?us-ascii?Q?4K62ZkTUrIDMI2/zUiLBEYzY489i7Mk3VfwgmgY8Y972nNJfLNu1bDP3CDkW?=
 =?us-ascii?Q?WJAv9UZH4FUld496JmZ2wtg/6K7/mtzQR2BDBB6UzEa0UAfTvnfpwDNVO3Vj?=
 =?us-ascii?Q?FBS9BwqgU3+9nMRHdC8n9wlKdkOLxQ4jkTwr+u2j5NbNBfBPT+80NH1LA9BI?=
 =?us-ascii?Q?Xvb2IB/qFSAbEPpkrKfO1t2a2wBfVFaep3qhjHMLBWhiRSuEZuc1ORBFkYXo?=
 =?us-ascii?Q?aKjlW+Hld35+N8p/mKurBFe44J3Ws7NoT7uVBFrDYQ9dBpK8o6pvJa08Rr21?=
 =?us-ascii?Q?Kuym+Sml/LmJorIxnZAclxxA748OPgy2oiPyXHqegFQ6RmJoXArOQgWb5q06?=
 =?us-ascii?Q?Q5HyMG+hrxnhQ0Gj9zoUUlLSUSWdp9sKakEo8zMOx+mf4x1Y0RbJcRk2HSmV?=
 =?us-ascii?Q?X3l+C7Y40D5ZT5MlBPE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fafe02-e3ff-45e3-e9e7-08db3132964e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 15:22:34.2137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4OePnGgSO7BLycBKFaUG+ryTdUDdO1itDrKwkxhF37KFeWsdh//My8rQ+yMQkMTCIO2zgTV2gM62WjtpwrFDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196
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
Cc: "Huang, Tim" <Tim.Huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Julian Wollrath <jwollrath@web.de>
> Sent: Thursday, March 30, 2023 10:08 AM
> To: dri-devel@lists.freedesktop.org
> Cc: Huang, Tim <Tim.Huang@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: [Regression bisected] v6.3-rc4 Error scheduling IBs after resume
> from hibernate
>=20
> Hi,
>=20
> on an AMD Ryzen 5 PRO 4650U / Renoir (amdgpu: added device
> 1002:1636) I the screen basically freezes and I get the following errors =
with
> kernel v6.3-rc4
>=20
> [   26.214541] amdgpu 0000:03:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]]
> *ERROR* IB test failed on gfx_low (-110).
> [   26.379624] [drm] ring 0 timeout to preempt ib
> [   27.387884] amdgpu 0000:03:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]]
> *ERROR* IB test failed on gfx_high (-110).
> [   27.392945] [drm:process_one_work] *ERROR* ib ring test failed (-110).
> [   27.400370] amdgpu 0000:03:00.0: amdgpu: couldn't schedule ib on ring
> <gfx_low>
> [   27.400384] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling
> IBs (-22)
> [   44.440532] amdgpu 0000:03:00.0: amdgpu: failed to write reg 28b4 wait=
 reg
> 28c6
> [   61.177118] amdgpu 0000:03:00.0: amdgpu: failed to write reg 1a6f4 wai=
t reg
> 1a706
> [   61.189275] amdgpu 0000:03:00.0: amdgpu: couldn't schedule ib on ring
> <gfx_low>
> [   61.189286] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling
> IBs (-22)
>=20
> I bisected the issue, the first bad commit is
> b589626674de94d977e81c99bf7905872b991197 reverting it on top of v6.3-rc4
> also fixes the issue.

Fixed in:
https://patchwork.freedesktop.org/patch/529751/

Alex

>=20
>=20
> Best regards,
> Julian Wollrath
>=20
> --
>  ()  ascii ribbon campaign - against html e-mail
>  /\                        - against proprietary attachments
