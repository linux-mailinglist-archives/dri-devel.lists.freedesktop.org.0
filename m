Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739CA48E2A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 02:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F05B10E105;
	Fri, 28 Feb 2025 01:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AEgTbo6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B44210E105;
 Fri, 28 Feb 2025 01:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBAsWJ0RFcMlM/w4YDBFI0VsDqFSvtZrR532qHfaNdArmg8x8AcSnICKsuE8DeDPTfBKFZ3x6/i6T3TcYoaaDnHsTuUE2Vd4GVIVwYNR9JTW5uF5kyMaTd4zo5aUxWjEeeDHL5ryVwgLv/gd7Nu5dYpkIHa0fcD/j81CJlMIhE/nJVftLE2yMx9TqMzgp+otZ2L6CQ6r2eQyQlpbsZoObFND11fGfVrWRH+tGH9QfNbJakgpzT6/77JGT5NXi7MUG2njjfsRx+ZY2s9HAjIBEnA6+GAumiCG4oncNuKnl0V74fu3p/xvMOLxvD6exvcWWN+FBZEVB+fL0OYu/P81cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQYk5yD/a6BkzlTeJcPmW3CRAB/049S2JTFHuXaTAnk=;
 b=oj3k+jN8+4eOyBO4awocWpHHOFKoXw7NL/ej95qz9pYMyoPs5ofjDTel042LvknCcdKMSb3IhwMqfhsd6Qy/OAVhM0M0gGRLt0q6DN48A7RL8KtIOVpXTxeChm8xd9DJffasAJo0yHWmcJ3Gd3sN1tif+7vU8YEWOm45b1qQButb9e1vyaunU9LU0YfIaR3kAwgrdavaOBKaEaDUuVdDnWn85RS8Fd3A8WhRChkslYjfNMB23HIzmNBtqmPZWmHqZkJDwbrWV1H1DcFWlGfFJY7w1MgeohZHvBjBROyUynf4OQjdVjWFUSmt09avW0C63uPwdNfHN3LXoU2l74NA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQYk5yD/a6BkzlTeJcPmW3CRAB/049S2JTFHuXaTAnk=;
 b=AEgTbo6a/U/K53daRtRgnbHUt3/AXJFPOvMllsVCQv1xB4AOi12k1Trbxm3eOwmU01gbqjpoDheMBNAEwaxa7ImCdO+2JiBL8sQNDf1oIxiZ9rV+b36JBQ1V9ZH60jdKLFGAovSHm2NIf+SGO+fmnGOnn4lnFWZGBx37Mu7ms2EBE2fi3hHjGe6WqgJBk0bYowjFIIvJ6vnbuQu+EMKfjVnePOOC30mMUpSBA7s0pC54Geg0S2tjvEiV+ke5ZjIDC8mjCV+k8lNEKZzxLq3AWU9tYb+o0lMy6ycWFKEuMbwnEeeAhrXUTuVsrs2tnmknX8ZEuXG5l+ycJ7XS5dwkjQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 01:49:31 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%4]) with mapi id 15.20.8466.016; Fri, 28 Feb 2025
 01:49:31 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>, John Hubbard <jhubbard@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, Ben Skeggs
 <bskeggs@nvidia.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Thread-Topic: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Thread-Index: AQHbgUTvmeYidffAF0KVP6y8BIp7/7NMBKGAgABGrACACWwxAIAArz8AgAG08oCAA6E/gIAARoqA
Date: Fri, 28 Feb 2025 01:49:30 +0000
Message-ID: <d9c7e8ff4b32f06650b2ad4e3b993d217b286aa9.camel@nvidia.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <D81L5PE1SPWC.O56MB6SRS0XK@nvidia.com>
 <CAPM=9tw=8WtR9093EThr0aY6yTYtef9SBgjN5S1xZUXaWN8aWQ@mail.gmail.com>
In-Reply-To: <CAPM=9tw=8WtR9093EThr0aY6yTYtef9SBgjN5S1xZUXaWN8aWQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA1PR12MB6435:EE_
x-ms-office365-filtering-correlation-id: d52e2d71-227a-4750-272c-08dd579a24d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NVArS29wemJxRnNqWTN3SmNpRVRITDhjOHRXOXJVbmg5SnZZNWhrY3NXZW5G?=
 =?utf-8?B?ZmJBS2MxS3E4L2pLZW8wTVRhOWY5Q3I2OUxZcjhvNjNhUkIrZDM3ZW9Pajd5?=
 =?utf-8?B?VUFWdGxtZTZFZ1BCT25yYkFIUFJoZDNiMHN5NnB0RkRBWU1BOTNIMnhVenhm?=
 =?utf-8?B?Ly9DZHlmZ1l0dUlleUZzYkVNOW13anZnaGVGdXR2YVZPZDJIUXpzNVpnQ2Vp?=
 =?utf-8?B?UVdrVktZSHIvM0RNaEx6bE0ra0pMaDFuTGhRQnBFTXdQbzFmY3lyM0EvZkRz?=
 =?utf-8?B?QzZBdGNtSUZzZjFrRUxvbWxXR0k5R2NlclAxZ0ZCSjNvejJOTlhLYUxIZmhi?=
 =?utf-8?B?aHNwYlB6SEx3Q3M0N0xBNFcyTEhYa0NieVR3QTFjMngrcU5IeC9OQVJFLzNJ?=
 =?utf-8?B?MnVILzBzOXpZaFg4cEhKZndIaVJqTEVwSmdyMTJTdGdaTGNaV3l2bG8xQzY2?=
 =?utf-8?B?ZFk5UHZLNytQOWh6alBDL0VWY0RVcUt2MlJWbng3V0VLOWJPUUhDTnhHRlVK?=
 =?utf-8?B?d2JMd1VaejVNTmdPZ1lmOE1CamVWTXplS003emM5d255amIydGFiMXptSndD?=
 =?utf-8?B?aGZGVDZFLzZwNWVaczRGL1VzK3dIeHZVMXgxR0Q1QkxZeG1lMFdtY0pveWRw?=
 =?utf-8?B?aUdFekRWZWRkZFZxWWd3NHcwa1VkMVFKTVlxd0Y1Y2p6TVJETDE1UEhMOEdD?=
 =?utf-8?B?N0p3UitGTjdrc09lQTZGN2RHV1ZOM29UUFpKbGF6a1RWVmdQVThBcmdiYmNv?=
 =?utf-8?B?dXdjd0pIMDIrVmNjdGpteDNVUG9KZ3Y2VVl6QmRkQmNIWENoL1lsNUNRQnhM?=
 =?utf-8?B?Q1I0cGZXTnJBd2NtRjVHb1RCcHZpZzNhNDBsakpxdGZYZm5MK1hpUUZ1T3Nq?=
 =?utf-8?B?SlZ6U0FSVW4rRi90bHZSUVFXU1RiOHBvbEhFV1lkR280REg3VnFzWng2Yll2?=
 =?utf-8?B?azNyb1RWZDdjL1V5VHpMVDhUTkVyMFJCQzJRdUU0MzQ2bHRvcEw1VytmTDBN?=
 =?utf-8?B?NCtMQ3czKzhwWkZQMDU1RHBUTUR1Tlpabjhuc1c2R2FJMExrQ0xCYklhOU1H?=
 =?utf-8?B?MkNOMGl1bERuS0ZiVW45R21kQkJSajFKdndzWTBQVWNTYitvVktIQXRRcWJ0?=
 =?utf-8?B?TUVXMGJmazJEc2R2dWdZSVVkOE8wcVgwTTdUM2FpajI0YmRjYXJsbjc3aTFI?=
 =?utf-8?B?QXVvRy9FZmdnWDN4RndVTm56VnE2NWI3TW1rK3pYc1ZwYkNLSlFNb2dMR2Uz?=
 =?utf-8?B?WDZDTzBGdTVxTXE0ZXpGVWZTa0o1M29ZbnNkUWlFK3BLRFFhNXVoTDdsOVlr?=
 =?utf-8?B?WXhqNEx0RVREMG1NSFR5bXh4VmtZYUJ0QW5PeS9zeGFkYmRtWUpiUlI1d0Nn?=
 =?utf-8?B?TGdmY2RIbHQxMUkrK3UzTTRQMVFFK1d0TmZmUkJhY0tBblQvNEROZVF0cnU3?=
 =?utf-8?B?aUowZjYyRm1zdlpyOStQRVo3anlIdkJXNitmeUs0bytpUXJpV2VoeVFFVGVK?=
 =?utf-8?B?Q1FxUytsbDZMWTJuc2ZQYzZxMmNCbVFsS2c1aGc5UWZieFlIeStidXNkcTJC?=
 =?utf-8?B?cVZrdnNza2N3R3NPdEJ5bER2dXh2aGF6UEY3TDlTZGU4eHorcDROcXV2T2NV?=
 =?utf-8?B?dHhsTmRzekE4QzJzMWx0MjBsWksrWGtDRVAweDdPeXM5Vk8xVHhsb1RmU09D?=
 =?utf-8?B?TnFFUGhaKzJOZUVTSzVWOStPcXlYS3JMS0V2aURKV2RQNkRaM2VKQlUyR2l0?=
 =?utf-8?B?OFdFTGdKL01oMFh6R3JwYTRvdkVHNk43N2NXbjdoUmg5ck1oN3dNRnFCL1VV?=
 =?utf-8?B?YjlPZUZSd0lpajVUUzNTbkJzb3hEaFd0SGo2QzdLb0FKUTRsdXdPSW9BL2JC?=
 =?utf-8?B?WUkzU3E4ci94UnVuSWJ2SGR2dHFjOG1HMnZnUkZNMlFjTGFGL0lSd29pOThO?=
 =?utf-8?Q?H8kNh+9lfb3KUgQy2ZUJ34ysfWtTwS4K?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0txR1lCb09LOWZIcWltZUE0MGtGekx3L1Qzd3BkRmxvRVdwUTZ1bHVacnBT?=
 =?utf-8?B?ZUhxS3FCT2x0KzBMcjhJZjJLVC9mcHY1cGg3VWIzYldJT2FyMkhGb3BOc2l5?=
 =?utf-8?B?cDd5eFJXZmlIQVh3YmlzMXhuclNxdGpmcDRCbjZNV2VYcGJFZmxOU3FVY3ZC?=
 =?utf-8?B?ZnhyUVo0bnN0WkFqRk8zeTdhS2ZYUEwwZGFNTG9uMG9NOHVjSHJrUmM3cncr?=
 =?utf-8?B?SWE2RzJyY3c0Z1Y4YklweTMwMWdwN2k5MlRRalpDWHNYbWV4TG0zWHVSWnoz?=
 =?utf-8?B?QjhDRTF3bXBHN0hLNlpFdE1rUGt0SURnOGdiMXhsQnJqL3BHMTA2M0ZkejNO?=
 =?utf-8?B?Ymo3Zk1RRmNXK1FiK01LSWRpejdVVlEwTUhlVE4yL1J0aGs1STlkd3VDcFFi?=
 =?utf-8?B?SjR6blJhN0pVSkRJZXhXSmhWZ0RvS1ZGZ3NBcDh3dGp3enVFZEF6QTZVODBH?=
 =?utf-8?B?cmNDY3JNYmg1clRkaFRzTUFmWGpGeUtka3krbmVlQjBuTWk4L3hzT3Z5eUZn?=
 =?utf-8?B?NlRmZmtvSDVRM0FUSGFWTFk4TnMxVFJCMUNBVG5rUHJLM0RzbWVnaEdsVWJS?=
 =?utf-8?B?OGY5SDd0UVZQemR3Wm9FQ1B3QWxSRVNzNkZHL1hMVGpiVUhZbXdWYzhkMnY3?=
 =?utf-8?B?aVN4bVRmVkN4RUg2bFhDMDlTemF3M01od1lBWEJIUEVKWm42VEwzSjNVNnFh?=
 =?utf-8?B?MEgrcGlGV2VMc2paU2dvczFSdTNjRlMzYnovc0FUVmlBc3IwWHZ1TE0xNEpU?=
 =?utf-8?B?dm1XVm1CMVBXZEdFOE5peThZaGtKZXFHSlFleUJhaEo2QmlhaWg4MC9aNytq?=
 =?utf-8?B?b3ozR21VQW5lRk43T200MGo3NlhGTkliQzhZZGRHN2RNbERwUkN2d05YZEZB?=
 =?utf-8?B?cUYzRFdJbVRmRG0rZ05RUmttbEdMY0YrZEVBYVZEbHJXbjVsaUJPOW5XNTQ5?=
 =?utf-8?B?d1M1U21HT3NWZFFtYXpqRktzRmc4aTJaT3lwclJjaTBzQWVFdERoMmxPd1pI?=
 =?utf-8?B?Z051Q2xlVWJETWlKM0h4UGI0czZseGZ0TURUOXM1MTlXYUhwaHV6OUpKSGNa?=
 =?utf-8?B?Umg2UjlpbklmQ0NOcDdQSkNFcDN2a0Rzdzl6a2dKTW4yYzZ4RzN6OGk3cHha?=
 =?utf-8?B?UGsvWVRrbG42Q2tSR0FrUTJ5TTlXOXFxSUlUS1dZTUNuNEZxQy85YjR5OVpn?=
 =?utf-8?B?cWI0NjBGdm1pL0NnVkhuL3o1eldvek1PODJGZFFuM25na0tjNHJpbTNoVElE?=
 =?utf-8?B?NGM1Tmd1UHVUNkl1bDVDQldRZ0dnR1gyS0N0Z2FnUWxIeDk3dlJ0Vzllc0Zl?=
 =?utf-8?B?bzJadVUzcU1BcWk3d2d3Q2M3NjBtc25CNzBQSnkyWnFGd0Y1eGxxZEpkQWZi?=
 =?utf-8?B?SENlT0w5VFlRdXN3a3NGQTFiU0tOQ25kU0o5YjZEWG94S05GczhUSXdGK2E5?=
 =?utf-8?B?M2ZjcXdaZDR0QXZUempodzBka1BWMkZXRTF5TTZzdk96eUZTd0dma250aGxz?=
 =?utf-8?B?RFVMZnY5MVVPaTNTQ2R6a1A2aEF2NFdpYkpERmMwYm5lWkVwZkhxVG1wU2Nh?=
 =?utf-8?B?UDNTcTAyUSt4SVlwQ1pEK2V0Q21wOG1HZU1iblpwbnh6RGhnTllmak5DMTZL?=
 =?utf-8?B?Y3FINzd0YzB2OWFRcEtudWE0VXBGNkl4RGw5b3o3dUlkcmdjcXFXOXNzbE41?=
 =?utf-8?B?bjBFNmFGWUlTa1RMTUNiWkVnV1lsQytINXlIVmwvS3RrRTM5amxYWll5VWN2?=
 =?utf-8?B?cmhDMkxkd3dFUG5IcFJDMkxHUDc1QXNqWTJsUXdEMGFUYWpOM1V2L1prd1c3?=
 =?utf-8?B?Q3VNanMwUlpxaExHZSttTHZsNGhMS3RXRnFnZUNQek1GN1kwQ3Vyc01wWUYv?=
 =?utf-8?B?dUNjcnBZQXRaTTdxWmZCWUx3a21Cc0EyeFhORU5WcHo0QmRmaVl4MTVLc2ZH?=
 =?utf-8?B?UXMvTFA2NmpzUnA3ajF3ejVIblJlaThWa2RqSDhUTi8wcmJDRzJFNjlqb3hl?=
 =?utf-8?B?MWRoRklDc0E2UmJaSS80blkxSGc0K0RNaGo5Q2tzdXpYUGFxZVR4akR2Rm1Z?=
 =?utf-8?B?Z2RKajVDSmVKb1phN3M4NzVqMDlRTHFjbk9nMXhOTHNGZytoMEFtUTBlRUlX?=
 =?utf-8?B?V25DTlhWRk11bmFiWFdSMk1SdU94ZEwwb3JoVEFpckZxZmNRcm94UTArTWRD?=
 =?utf-8?Q?DKp4gRBQPXuRoIfXlFlVl/WakOyUTim2TzCof6wKMJwH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <892CC9B9194DCB45AAAA1B85B2739AA2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52e2d71-227a-4750-272c-08dd579a24d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 01:49:31.0211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUO95rs/m8iTaj9SVz6jsYDBu7qBb9BTlHIYimpjFq9UbKYxsnXFAlLNZBzL+JBKan6+itLFrPZdPPPzH/rO3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6435
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI1LTAyLTI4IGF0IDA3OjM3ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
SSd2ZSB0cmllZCB0byByZXRyb2ZpdCBjaGVja2luZyAweGZmZmZmZmZmIHRvIGRyaXZlcnMgYSBs
b3QsIEknZA0KPiBwcmVmZXIgbm90IHRvLiBEcml2ZXJzIGdldHRpbmcgc3R1Y2sgaW4gd2FpdCBm
b3IgY2xlYXIgYml0cyBmb3IgZXZlci4NCg0KVGhhdCdzIHdoYXQgcmVhZF9wb2xsX3RpbWVvdXQo
KSBpcyBmb3IuICBJJ20gc3VycHJpc2VkIE5vdXZlYXUgZG9lc24ndCB1c2UgaXQuDQo=
