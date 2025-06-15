Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08847ADA194
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 12:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C39010E222;
	Sun, 15 Jun 2025 10:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n5lTSeAf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D084C10E21B;
 Sun, 15 Jun 2025 10:58:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cquLmja+BFX0L7LhDPlr0/yDMrbktf6+d2ps8Ag8hordFLSOq448JJys2GiYGjA55xuIL3VXk1PoSB8yUeEq7/KCMduJ33ZRIB05/KpGNofEsAtTPP6mHQVBFWRwOSHwuVn03yCLNMuTRTfzOtNz5J+btfj9AtPlsBSsNkjCn15b8NTTybCHDm9VS34wZ4rwONG3v3H36MgK8GOuZxzumcyW7i0DHJrG7q25Z+zvrzSaydSxJ0sGbkxd995Unhq2hUI9WAGLqcHkJM8cLnULHOHtuPZmYZjLiA/VkcbcWMIhRRzawJ3IgMURzAiG1/mAsmJwcBhvLpz65o8RbsSAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YF9bBTl6SHpKVHzVYhdnxYVd0Oj/sVYO2PxGcF3Oz3k=;
 b=TLCAZewhurVeRC4gVJ7+d7SDHAHHjwLYXc2SsdwktLbLf+yGQElrBqRHSv/68/AFeFLdYi2DsFG0mbWxSJHJubfM3uti7SPb9rsCfvpa4Yp92wlFEKMPn/+t/thH7RXwpAkj2b3hTxIV+VkyecaRpFsgf35r9RbbF+tAVfntjPX/7/r8BUBwrU9lJFSrPrU1UcwMBBAyCBTF7dySgAHUaXeFTsHtbQIJ8gsXqiJip5K+b8mcwvtiFr4UzQ9weLDG5/0tsszMZq0qRvv19RWVvlC1TIyBeBbzAo/QEQLCH1S/UM2lrLDhI9V6VKVo4ugaYnfsjkfiougME+BYah/rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YF9bBTl6SHpKVHzVYhdnxYVd0Oj/sVYO2PxGcF3Oz3k=;
 b=n5lTSeAfwlgVEM0iDFeVE4dB397TSSdLaLxvuXyM5j9XPY+o9IUwWbfd/w+aVnpzShLVVFVj3ESAPY9I/vVEDQLbmTNlYpeK7Vlo+iX/4jzUgHgn910E9r4e59tA9rUwi/mpieGiS43EXQX4sg9exwxh1fO/bGEe60vIsIXOfgRiq3QKeVyzly67cLYTvxHBVl0IaRvar19tyhxSafEWiZsWBJZ07/tP2qugQdb3DymN7Hc8xJrGh+nic/Ezz2h5c187bxLIHYTl6amQTJYYhl+3o1f5AsFOKCB6C/c99lMbSATrTaPAW3UZ4z3gD7XhYNmVY8CP1VD8vs0vfTvtjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB9059.namprd12.prod.outlook.com (2603:10b6:8:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Sun, 15 Jun
 2025 10:58:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 10:58:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Jun 2025 19:58:01 +0900
Message-Id: <DAN1XS7Z0AFO.3S7PRNH5FWWV4@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno Lossin"
 <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
 <CANiq72=3nDR=J2OXu9nWwZW_kcWfZ4KhZ3aS12_dcB=1EP2icQ@mail.gmail.com>
 <DAN1SGG5DPVE.UUW0B523LQHO@nvidia.com>
In-Reply-To: <DAN1SGG5DPVE.UUW0B523LQHO@nvidia.com>
X-ClientProxiedBy: TY2PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:404:a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 61351a3d-2fdc-45f9-d3f2-08ddabfb810e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2ZzcnM1RU9CcHNnd3FVeHB5WFdXaFkvYXUxWDE2bnlrNnlMa1IreVlYUFlO?=
 =?utf-8?B?cjcycEF1bVg3Y2Y5Tjg2MG9iQllxcHBRS0NvSms3S0hGd25oVDdSWC9OdThR?=
 =?utf-8?B?SnFuaTJYd2FycmY1blg0d0RRczBLRzBtUUF5UGdoeVJRVmhBd1dsZVRySndu?=
 =?utf-8?B?d1VGV1BTa0JDZ3hCeEt2TUZRYUI2Rk9URzF6azVqSVN5QjJkeC95Z3BXbURZ?=
 =?utf-8?B?bkJuaGZvRkpLdkVtNnhDb1VzUTVOazlWOGRybXd3QlhxZlc0YnN4NndsYWJX?=
 =?utf-8?B?Zy8vL295V1lQbFJUaGQ0cHZHS0ovK0N6dmExTG5IUDhSUkhUeDJ6U1RPR1pZ?=
 =?utf-8?B?MGtSVmhMNlJtZUFjbWhGTkJpRnZOaVdSWnZnZVZkQXdxQnZxSTB2cDU5cmk5?=
 =?utf-8?B?bEhkZFc3RENlUFFnbUZoY25uTEQ4VFlXOUw0SnRPV0E3UlVVbWpMOXJYY1NE?=
 =?utf-8?B?NDI2TzlhTlRpNVQ0WjhyZHpjV2lhS1lLQVFJTXJSYzMwdWMyVVBYbzlTaFlU?=
 =?utf-8?B?QzY4c1ZVcmZXSjVKT2J5ekthNnB1UFBIMVp5SHU0RENhdFdqUGNmdkhVbkRy?=
 =?utf-8?B?Q3JJYVlGSDlVMXJQWmJRTzBXYXJrNStYNWVzZE14Q1lGUDQzWHJ2cWl6QXVN?=
 =?utf-8?B?TGM4Z1gwcXpuQ1ZQaUlMenEySW5WYk94ejEvQjB5RlRtbXZHWGs4dm9mWmho?=
 =?utf-8?B?TmY3ekFSNktqcWtxeHpmQTBpSk1ML1BZcS9nRGtHaHFJdngvb2JhckRGTWNz?=
 =?utf-8?B?V0xMY01kMXRrZ2VYNWZMSHpmSmZyNm9iK3lGanBnZC94WlB2d1p6bmRZNEdp?=
 =?utf-8?B?WVk5ZzJKU1NDYW1mUWQxSWt6ckh2ME0xVWVrZVZiem14dWY2OHd0eXJKM1hS?=
 =?utf-8?B?WFkyZWE3aFJvL2VoUWZhOTN3WnI5U2JCR1k2a1hCR1RXaGZWSWg1RmJxbHQ3?=
 =?utf-8?B?NXlYbmsrWDFwN3U3cFl0MnlQRzlFaXhGa3dmOS81S3hZMlA3N0hjcm9TQU53?=
 =?utf-8?B?YW1OMVFJS0VoNVNtWU93ZldRVHJ6bVBERnpFTVZqam5WMVY3eC9qSFNPdWV6?=
 =?utf-8?B?VzNucGYwQldlRFM5S3kwZkx6VWlnY0FlTkdnT3Fad3pJYTZMZXg1dVNWRGto?=
 =?utf-8?B?YngyMzlpMFVEQTYvZmpia1ZUMHo5S1pMUzBrTllQbVl3aTZZbk1BWUFVYVl1?=
 =?utf-8?B?MkZXTXVoOHFIRGRtTUNvQzBtdmtGbUNMR2N3TGsyS0VXLzI5ck5jZ25xVkxF?=
 =?utf-8?B?WmN5TFNKYkNiSTR4dExIdWRqdVFhQXFaU2U2MVZEa3hQRXhtR1VHbkpDZ1Vx?=
 =?utf-8?B?VDBGN2g0YitHbUw0YzhnQnV6N2xjcUYrblR2M3FiODU0KzU0amNwbStrdDF4?=
 =?utf-8?B?UXpDM2hyVFBod1lIN2tsSDJjZFJtREpybEkzaDJjSDJaVnUwNGJpYkZXRUJk?=
 =?utf-8?B?Qy9wTzZWTVM4Uk54c3kvb2c5TUNWeXkrbjZ2cWZEL0EzcGJLSVovYmNYeFVp?=
 =?utf-8?B?dWZrMkFCQVhlblZDek5kM3dLVndEek1MTDcxclA4aE5qMy95S1Frdmc2clEy?=
 =?utf-8?B?M1hzazJ6OVM2L1NSaStOYUpQR2k0VTJSUDRqUGNscGtZKzZ6NnFTKy9rNjh3?=
 =?utf-8?B?VjRWNGtzNmFSZkQxcEpHWjd1bUVwVTRwaExlR1NoZm1LbExQVVA5bVNuQWZK?=
 =?utf-8?B?eFlucllhN2I0VHZXN25yTjRkSjNya2pDVEdZN2cvU0dhMThQZWxndk5rM2FQ?=
 =?utf-8?B?bHRKM29EMU9mL2hZK0x6WmJpdkpVSEMrZmt1S2hncHRpQkl6N085ZXhZZjhM?=
 =?utf-8?B?Q3pJdWZDNVBjTFNBSG52Z29OWkRqM3lQRC8xL3VjTVI5WmIzM0JORFhHRUp5?=
 =?utf-8?B?RmZpNFJKeW5FTnk4VWo3WDc1MFh1UlAwbWF5VmpYWHRwVER2TUd3Ylg0Tk1q?=
 =?utf-8?Q?XDHJMTH/bC0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGMwUU05SzNTT2x4MHNXV1Z3bWFja3VKV1dtZlpZVFQva0MvamRTT3JSRmdF?=
 =?utf-8?B?Q2crOG9mVVFWcEdHZE9oRmk0ZjVsNTE3M0VYVFkwZUt4NXNtaFNRczVydndL?=
 =?utf-8?B?VXlQR29PRThQQ25OL0ltS01vajRLWWxVek9vQ1EzUTJxdWwxdEFJZVUwMGN5?=
 =?utf-8?B?NTFnMHFxaWc2ekh6RDNvbDRTRjdUY1VlZHB5Z1NMd0pXelMrMUlvVUk3WE9P?=
 =?utf-8?B?d21ZNG9vVzF3ZW9INGJqWlVKbVIwUWlhNGlqT29DYTdOaVVnUDNBcUkwczhq?=
 =?utf-8?B?SHRwZW9ObFA4ZGtoQ3RBQjhVc1lrQ1MzeC9NSlNvV3laTi95czYvQmFZRUVv?=
 =?utf-8?B?MUNtZkxsQXRTQXhobHVDTEErYUVKbjdpaGpGWDVEbkxvOGlxMEhlZzhScnVR?=
 =?utf-8?B?TXIwSExvVitlV2tsTS9zOHgzZ050VVpwVnJWZk9QdVpiUmxoYkp6bFhNTGNi?=
 =?utf-8?B?VVZnVFRweUhOaUtEN082VVQ5RWgyMzBKZzU1Q0NWMEcyaFM3aUxjVkhrby92?=
 =?utf-8?B?T3k1YkpOYWR1NE9zMGdwVG1nRmEvYVVqYXp1VHMxbzJvV2NPcm1rdWdwM0JH?=
 =?utf-8?B?UGptYW81Y0d1cGM5Q3FsczZlUHIwUmZPd0R3czJMYUthZi9ydEVWODh4U2ZI?=
 =?utf-8?B?RzdxemZSRUtCMXFDazk4WUJXNVhPeHYxWTc5U3hmVktKUHdSZzc1OXhpaXo4?=
 =?utf-8?B?K0pNU3dMYnF0UlJFVDVPaVlQb1BwNXI0QUdtT2NpcHc4VHVKUjc5bnl4MHRj?=
 =?utf-8?B?V2M3U3d4S2MwdW9BS1JyRmhnendnUzVQRWZlTUNPVjBRbncyWnJqelN0TnVn?=
 =?utf-8?B?QmtUZmc2VTFIMzllTWNNZEt2eUZBOHJ3bnkwUldRSjk5UHRRTlVyKzZ0bVFz?=
 =?utf-8?B?YkhZMlpnVE42Y2JpMU1JTWpvL3doejZnUjZXRjkrWWFYcVc3MmFpZmhCMjRW?=
 =?utf-8?B?cWh6STQvTjNxLytGcDBYM05TREo4VU92cUtKejBDRnJvQ2pEZDRwQjE4bXJO?=
 =?utf-8?B?QnU1czljVEtlQ25Mdm5CS2RjelN4emlpaktjakNjOGhHNDZhd2VwK0p1aGZv?=
 =?utf-8?B?OFR6VVNlandmejV4cDMvaG1lUnpGRVdMYWQzQ1JQdnBTZnlSUkNIbEVmRGpL?=
 =?utf-8?B?MmFQSkdWWmNmK0RVc3hvdTFmMXRXMXVteGdCK29meHFwVW5VUDhvbWpnL1FW?=
 =?utf-8?B?TWZGM0w3SUtvRjh1UXorV1NPVjFDclYycEZrc3AzTm5HUVBtOTFXOUFqSXFa?=
 =?utf-8?B?Sld4akV6RVRENzRwWEZzai9Ra29SakQzUm5DNytaMUk0UlVqbitVK0hMNVVo?=
 =?utf-8?B?WlBWS24xbjBWeGlsTVUvZFhOOWpXeloyVVY0dVducVRlaktJREF4d1NXWCtV?=
 =?utf-8?B?QlBJSGJKaDhodENnM1RaT0wwUWM4RFBsRXlZVG5ISWJTbXNsbEZFYW9vTjVG?=
 =?utf-8?B?bWdSK1k0c1dPSk9FSGkvLyt3T1F4QlNkOEk3QTR5NkpmcHY5bXZrNE5TQ2JN?=
 =?utf-8?B?VWFWOGUrRFdQNHo4L09PSkRuckh0eVhzUzNkZW1UVDBNbWNCbEphY1dWOGpE?=
 =?utf-8?B?R1dhdmVoQk5XZGdlR3dSRXVSRmJFZzFMWjh0TllaanVwcEFkOFNiZHBFbjBC?=
 =?utf-8?B?QzFoRkY2T0lvYlhyY0xGbEJXQkU1UERkOVpXT1NNem1DdkJ1SUh1SE01VEVX?=
 =?utf-8?B?TmNMek1RVFNsZ2xDZzIwMzd6UWpRS2tlU0ZaZ29ibDFTWThtTDVVVVljbU9D?=
 =?utf-8?B?L1BDa3BuQzZsa1pIK3JMRkpIeVJEU0thNGI2OFJkZ2JLRXZwNFhhL2JFS0dP?=
 =?utf-8?B?QitxdkNxWGMyVkMzbE53UDlMazhIeHN1UWJnaG9YY1JLRnc0VExVdVVJUnd1?=
 =?utf-8?B?TjQ4SWtzODVpSTZrZVcwNk5SMzE2a2d6SXlwSFhESXExZVJIaXRxZXUycXY1?=
 =?utf-8?B?ZlFsMzI5NHFub1R4dWxkZ0k5eVphTWx0YVRsQlVTQlNvRUs2VVRzY3UxNm1W?=
 =?utf-8?B?eUxIUXFSWGY3ZEZ5ZWtyYmxDQXdERjhTbmtBNllFc1h4M1pybWhTTjhVUUZx?=
 =?utf-8?B?KzB1US9vajhkOGErRVBSS2NKQ0trK1RyVVZ1WWhPTTNLSk9kM0E2OEZmR0tY?=
 =?utf-8?B?ZHRYQkZOelVNajQzZkRPQU4rTE4xOVYzVzZjWXEwNWFkT1hTRk5UcGZqeE04?=
 =?utf-8?Q?m5PmTbJmHQ0rte5Uaxu80QIRc0GldqAbDu6SRsqDAhtt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61351a3d-2fdc-45f9-d3f2-08ddabfb810e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 10:58:04.8472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA2w/l7XLW/B7f69S7ldUtBzMLEtHLHxWwvFuJPmZyiib0V/yZg8SyVTCQix3UJNVMtfftMGiaoVtXpX6YjmiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9059
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

On Sun Jun 15, 2025 at 7:51 PM JST, Alexandre Courbot wrote:
> On Sun Jun 15, 2025 at 6:37 PM JST, Miguel Ojeda wrote:
>> On Thu, Jun 12, 2025 at 4:02=E2=80=AFPM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>>
>>> +            /// ```
>>> +            /// use kernel::num::fls_u32;
>>> +            ///
>>> +            /// assert_eq!(fls_u32(0x0), 0);
>>> +            /// assert_eq!(fls_u32(0x1), 1);
>>> +            /// assert_eq!(fls_u32(0x10), 5);
>>> +            /// assert_eq!(fls_u32(0xffff), 16);
>>> +            /// assert_eq!(fls_u32(0x8000_0000), 32);
>>> +            /// ```
>>
>> For a future patch series: this could provide examples per type
>> (passing them in the `impl_fls!` call).
>>
>> I can create a good first issue if this lands and it is not somewhere al=
ready.
>
> I was worried that the examples would be mostly duplicated, although
> it is true that seeing how the function behaves at the limits of each
> type is valuable. I'll prepare a patch to either squash for v6 or submit
> as a follow-up.

Also, although this will work nicely for `impl_fls!` which is a single
function, I'm afraid this won't scale well for `power_of_two_impl!`,
which defines 6 functions per type... Any suggestions for this case?
