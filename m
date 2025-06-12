Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006CEAD731D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD9610E85B;
	Thu, 12 Jun 2025 14:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EkteZd6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2078.outbound.protection.outlook.com [40.107.102.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1223810E859;
 Thu, 12 Jun 2025 14:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhw31BZaRmeRIqmwt+w9YWFEqsnLdCz39+FnLdiV0hfUvyT6oRick+4QOk+84h2QsIwE5IrLQ55eDj9DQy6vjmbZUqQ/70EcgFWaYCp6/QFQcrut8GJY8/2txivhCUV+AUkuqRjCfw6yZdX5eQA7UH6rh24lUSTJeD4Jhi94joJpEEeIgk5QuOzHF2b9DHbcAXsD0yaW7cNCYkNMjPBGupTeZ2dJob9YjR9yOgHA+1R+CNx8QNal+V1xqFOPWSOQSEmWNkdH5Rn3MGLp+hCdWvvSQ7jR0yenLOR+Y5hzn3dw4LSCXX7K0OpJuud/Nwlih0L9o/o3NtCiMoE6JvsQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PoNN8FyNfwDxQl78G6JnqH7kwRP2WQXa23PJZ5l7Hs=;
 b=OQQ2NEvdMnt/QUyizSwUxivLXHhA28FKiHc+dEYlSCfe/wmSklgNiPfL360oWzQzoDu0jqWuQTzNLS9DjDzx1TYhpzPGI6EcGeI2kVwRmKp4x44i0dmbsik0Uahs3zpmPPXzqZv5PFEM0Y1w4zkvfCqlmmvtju6djOHAfYUFi3FN6Ml6/WuQgbBfEdKcb2lBkc5EF+UxYoN8d3YT8gUPLIgrmnY/h3okEpGnu9GxjUQOKFa/0CSLLe3Wd2ZCj5qZYu2HjMsoOi7gpKhrin9aK+l9IPX/xpRJuKxhCmHFva7vRWxhYJ31M6AWEaiID6DWQac37Uz5jT+A4BZmCyc48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PoNN8FyNfwDxQl78G6JnqH7kwRP2WQXa23PJZ5l7Hs=;
 b=EkteZd6h6czTAc5pAYeTyFaT1QznXXUr3mY11CFPitA+8XKQc4tpVXwDmV7B++6S2QXwV3/g3tIPy6Ac9tPlPfV8LIV3PLinvZYNwVvupnVNbR9ATJsj81IlKa0Ntf2zGaq4yGFH7uWf6aUfyqBye079Ag3NlARu2+UGMWi6lciE8WMmG91IcI3SnM84CiCBWolTy/mKLTBEpKYQ7jdmA5mz8H/YUka2nkUI5ZCoEEAJ5tntGlMEeh4DyW/0ChomYzZ5gv3RI7bG9krxeOFlErYXmeEZAgcmhSCDur6c6A+ptWu/jf2Xa33XY+m9lgzo1ggXqNwUYv+RfTpP/jRCVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:51 +0900
Subject: [PATCH v5 23/23] gpu: nova-core: load and run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-23-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY4P301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a40f3e-c22d-490c-07d6-08dda9b9f3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TThpTElmRnk1cnRIbmpoSFpnT2JHT2R0OGlQS2VEN1RNZVlaNWFMdEpFbnU2?=
 =?utf-8?B?amlKT3FJaG9iRHIrQkJvZS8ySzFSVlBHMGhDdGxOYUN6OU8vRGZwYTh2bzZF?=
 =?utf-8?B?TTV5UHRhSkdWbDBHdEhuUXFjeitLSkRpRmNzOENoenVvTkQ5djBQOTI4VzBR?=
 =?utf-8?B?L1ZxcnhxZzJFVjdnV1FIa01SRkhoQW9lMVVXWEtVVGcwcFpwK3RIQWxRTHUy?=
 =?utf-8?B?RmQycjZDMlZxQUdHM0dWTkFGdkM5WEp4RElVVEFsTURHbFdIdGFIc0loT08y?=
 =?utf-8?B?bW91cHlJUXo5OHhXb0RrMnp6R0g2WTZSY1MzTS9OMkRLU2JtMThQTEJMM2Zt?=
 =?utf-8?B?WEEwWDV4bGpua2UwTUN3VnBiNlpIMGZudXNKU0xNQmhuLzNjelZWOXJxeFRv?=
 =?utf-8?B?VjBmNXdRdWNicVVkekVjSERneGZIUm9vSGJIWkY5VGtMT3hhSFRTS0dxMWl6?=
 =?utf-8?B?N2orc2tydTdvamhOMVoraTlmM2lXdms2emxCY1ZIQXlXOUhIL0xvUVp2d3o1?=
 =?utf-8?B?bWdEQ1hqSFpnZzBCV1VJMERzUzFVRHpyWkZBbDc4RGI0dmVvR29EZWJveUNn?=
 =?utf-8?B?TjhsZTdTOVJ6blNvOGRrVHYrQnFOazlpeDE0MlJDMHM3UzNMRU5YY29YLzQr?=
 =?utf-8?B?MmVNZWh5YzBmaWlOdW9GaTZtTHVVazJ0U2RzNWphaEJzeE5BcWgwbGFxSHJK?=
 =?utf-8?B?QXFOUUFZdnFUNzJWcGFSWWN5Vm9YZkY3NmJ5TGNsWEtrNDZNQ3A0QjJHbFdS?=
 =?utf-8?B?amRjZytKSGE3THJBa0xMYnh5L2h1RnpSa0ljM3hyTWhZclZUTlRSeGZsblM0?=
 =?utf-8?B?ejMwTkhPd1ZFMWJHN24rbnA5M2lTWEhzazF0a0pXOExQMmtDZWNrTEMybFVV?=
 =?utf-8?B?S2l6b0RRUW5BWk9qZElkRkVkMHBETUVlK1NReEhObXJyRHoxb3o2VXd5bThV?=
 =?utf-8?B?OW5LOHZ1SnpSWTNxUmFOOTYwOXBxWVBEemRrSGNtUXRvaS9mRXVVeFBpQjRY?=
 =?utf-8?B?QTFjSVl6eFVVOEdrVlVBRC9UeEd5OTFYeXIwTXkzZ3lqKytkd1lORWZ0eGVO?=
 =?utf-8?B?N0hRSWJzemNVMExtWWxPTDJtMFFwcVFQTHdkeVFqWEtwZFlXYmlBdVZRdGFj?=
 =?utf-8?B?cWljVThTZktDWVM5UHNhaGxlWnlHUG5Ea1JEemtENFpEd1NORUZqRHBCQVFh?=
 =?utf-8?B?M0Y5bjV2Y092RjlLaWFqUG5BT2F1NlBlYVhab3MyT0NDaEIrRHdCSGhHVVVV?=
 =?utf-8?B?aWZWWlRMZXoyVDl3OUtGVFJYQmlvdm9KaVkvZjAvWUQwdFdCSHMvSVZPMUV2?=
 =?utf-8?B?NWJEeDVtalNZMjFlYjAvZmJwVlpQeERNWkMzd09OZno5aisxOTYvd09VQ1gv?=
 =?utf-8?B?SVJlOUdUb2dsTHJsMndtSC9yU3hTWG5LQU5PaWpNZEtSNkEzblUwc1ltU040?=
 =?utf-8?B?dFpUb1BMbkloZnAxaUM5d2FIUTJ6aWloTFcybHZnSE1Ocy9DZjJLbFI2RnE1?=
 =?utf-8?B?MkVkTnNib0NYR1FlTnk3ZGphSStBcEl4Mnk1bUVsUHJwbksvOEJPODMxeVk4?=
 =?utf-8?B?RkFMM3JPQVZKVDFFNXNTY3BMczhZWWNieXZwMml5bjY0akYvZkVjTmFzQ0o3?=
 =?utf-8?B?V0JBeE8ya08zY2tub2l2RCtsK0txWEU1NlFWOHBLeHJrTUNkcnIzZVhmZm82?=
 =?utf-8?B?NHIzc1lDVVNqVUpIRnRUWG5ONGpLbzN1YVAwNGxjSDR6T3ZBMTBzbnJEQ3pP?=
 =?utf-8?B?SUZndEhQTCtTa0JkYmxPVGsyZUk2djRRY3d5MTRJSSsxZGU4d2E4TmdUNmph?=
 =?utf-8?B?cWQ0V1dEK1lEazVQc0ZvS1NaeVg3M0dwYnB0em9vTU5nK1FSeW9telhvSzFk?=
 =?utf-8?B?emN3Yytjcm9iYWlSRHB6d2N6dzVMK0JPVitHRG9NMDBKRHV2aEhsMnl3TVFn?=
 =?utf-8?B?ZnZrNjFYWmgyTndBSysxalRQMjUyTVhzYU1rUkpFQVVTYXViQXlJYjE1SHVu?=
 =?utf-8?B?Nm9sSFgxVndBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STVjbzl1WDJhdXpDcUtFOXBDR3AzMjNTSEdSbUlHMVpkN0Q0QytTdVg2dFk4?=
 =?utf-8?B?NG5lei9aWWZTdlFWNVBJWVBHRVpheEp6ZFYyYzBuaUdxZHdDaVNEbllqdHpP?=
 =?utf-8?B?OUllWU92TTBpaThleFJYclBVNG1rcUNhTVdGclJiNkJNejFRV0dDYlBncVll?=
 =?utf-8?B?VHNVZ3BsMU9Xb016U1docUljdVBSemxHcjd3RHowUUxpV0xpYk40U2tOc3Rz?=
 =?utf-8?B?b0NhOG1jL29DRXA2RkVYVDF0TjAwK0ZKdUtHMzB0ZlAwOFNrT2E4TlRlaCtF?=
 =?utf-8?B?cUxvVEc2MmRJNVNEZnBlcE5UTEdZK3pvaXRGbGRHQUdXRjlmcGU4SjdXMHhU?=
 =?utf-8?B?Q3lqazdTMCtLLzhpclNPc1pMZXFuQWdKNXlkMG1ROUZ2VEpJR2JUZ2RWKzZK?=
 =?utf-8?B?OVJadWJtWE9UbEVtS3ZWUjZIbkpoMEt4bE9iVWdoZjZJU3pWMllQSVV1bkVH?=
 =?utf-8?B?K1NUUXlkaUFjWUFObzQ0R0tNY0czUWpNazR6c21PNjRyNmZLWFlndGhLclFm?=
 =?utf-8?B?UGE4Z1poWWJzUE1lcTRyNUpjbXQzUHIzaC9jTnhqYU5ZTW05T3lJYjVka1hR?=
 =?utf-8?B?ZVFISVJzRUNQY2lDTEUvRjlvVm02czk5di9pWDdBRDgvTVJBdndBaUc1ci9s?=
 =?utf-8?B?K1BNekdpMlMyaVFmTjJLYjV2SnVUaC9NK3hkQTBTQllFb0YyeEhyREloV2s3?=
 =?utf-8?B?VmtqMDFucGhVUzdXRzFtNGwvTDM3MExKS0dUQTY5V1oxNTFzenp0K2pQS0ZK?=
 =?utf-8?B?VnFJMDBrVzl2c1ZDWTBWUmNXanhWM2hvVVB5eC8zNFV2M1NBTnM5Yjc4R2Fi?=
 =?utf-8?B?Y04zalBocUNVdExpSGNHSWZmQm1BR3dmZE1ObENWVloyVGY2bVBMMVVjQjMz?=
 =?utf-8?B?MFpocExOTEc1aHdiK2NObWx5U3NIYklHNWsxUHBHWG1SZlU0Z2ZRR3RZZUNQ?=
 =?utf-8?B?WlZwVjVDTVpBQ3UvUGp6c3dVajE3Rmd1WlBJRHlTZVFkY0lzc09PSjd5VGJI?=
 =?utf-8?B?ZXByR2gxcjJDTkd1NlU4TEhVTWw0Z1hMUW90aHVmNWQvTXZiT1NLeFlJNHlG?=
 =?utf-8?B?STFqQllsaW1mNitIeTJkdVpwK1p6Zk0wZzdaWVk2bkFmV2FzbElQRUxsaFpl?=
 =?utf-8?B?enBBSjcwZjdCc0NqcnZvZGVBQ0d4eVNidkZnZEJoUFVNclNjZndZeEtISUcz?=
 =?utf-8?B?UDgvdDQvZGM5SjJvSW1WRVZHblZGMUJBaHEvVTZhYWNjRHE1YmF5anhGTnVu?=
 =?utf-8?B?R0tsbHU4T25rang4cnpiNTdIZjErVVAvQjJ1VDhnZlhpWmExS3FCQmNoZzE3?=
 =?utf-8?B?eXlRU2YyeFFwTloxY0phMjB2c0JDbkhiMk5tOVNrNHdnd09sTlRmd0hLRjg4?=
 =?utf-8?B?U3BYQ1hHNHB5MzlLWUlVUmgzRHZyRXptMHdOS3l0KzZPSjVrZG1rQ3pMd3dK?=
 =?utf-8?B?R2lXMHJ2UFl6bDVnR21ydEFKeHRJTm9MOE9mUmxjcmtyMlZsRElnM240YmI5?=
 =?utf-8?B?MTVyMXVYZmNEY1YzUXN2L084SmRvMWJLSG5SRmM3aVd3eXdOS3RsUTc2Y05q?=
 =?utf-8?B?RW1rUEd4UlBtUW9LM0ZFRTVYNlVjaG1Rd2s2REovQU1RVE9uMGFFQVlsZ29a?=
 =?utf-8?B?NnJmQXI0UERpVXRjbElGRE45enN4UE0vQ09mc1l0aERPL1czaFo0UzFCdkZo?=
 =?utf-8?B?OXdYREYzcHl5UGhhU2FWMG51STkza214Slc2Z3JkaDBpUU5wZkdZVDlXdkdH?=
 =?utf-8?B?bk5PRXFNYjZNdVJPVDRzWFdOOGRGM1FpeXBrSEVYcG1vdzdvN1lkNXFLdGVi?=
 =?utf-8?B?TWVQMDRwSDdCT3Z4cTVIZks0R3J4cDQxMG9YbVM2dkN2Nm5VV21Yb1R2Ujhx?=
 =?utf-8?B?ckJpNlFTaGtCUlBaK0lpalpleHNXTEY5TG1acEs3TWVHeFdhUDFHYzhmblFD?=
 =?utf-8?B?bkxmR1NMSXpQMU1lcXdTVlRvaWR0aVFSTlY5TWZ3dTBNOXFueWd4UWlnTTRQ?=
 =?utf-8?B?U2ZHSnRnZVhhUzF2R1l1eGRldU5MdStlM3hlV2VxbUZ1TVRsWVRQMXNNa2FI?=
 =?utf-8?B?bGs5NHN4OU5sVWRiaWpYNWc2aDhVbS9peG4zMzJkMndTWmR4WTg4eGtxVWhz?=
 =?utf-8?B?bVkyamNoVUpUR2pNSzVnd2FoWU9QNXhoMDJaNFNNUlAvYVdSeFhNT3ZRM205?=
 =?utf-8?Q?Cc0sD4Wb25BJSL8NGUeo2w/n0hqADW4aetjQ+IUazUOF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a40f3e-c22d-490c-07d6-08dda9b9f3bd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:48.1313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nLbczCdsKNjzqEkOvh8itkencqZ5rRYzG2T8OTdrPj1NdgzYwWIdOhJLj3p5yjrBTARFHgUzbsRzvT0fw0/rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
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

With all the required pieces in place, load FWSEC-FRTS onto the GSP
falcon, run it, and check that it successfully carved out the WPR2
region out of framebuffer memory.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs |  3 --
 drivers/gpu/nova-core/gpu.rs    | 63 ++++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs   | 15 ++++++++++
 3 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 25ed8ee30def3abcc43bcba965eb62f49d532604..486be64895a0250ae4263de708784a8fdf1d54b5 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -2,9 +2,6 @@
 
 //! Falcon microprocessor base support
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::ops::Deref;
 use core::time::Duration;
 use hal::FalconHal;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b0bc390b972b5e75538797acd6abffd013a8a159..7af35ffa1d2f900e0117a55ec41312d16d718f67 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -226,7 +226,7 @@ pub(crate) fn new(
 
         let bios = Vbios::new(pdev, bar)?;
 
-        let _fwsec_frts = FwsecFirmware::new(
+        let fwsec_frts = FwsecFirmware::new(
             &gsp_falcon,
             pdev.as_ref(),
             bar,
@@ -237,6 +237,67 @@ pub(crate) fn new(
             },
         )?;
 
+        // Check that the WPR2 region does not already exists - if it does, the GPU needs to be
+        // reset.
+        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region already exists - GPU needs to be reset to proceed\n"
+            );
+            return Err(EBUSY);
+        }
+
+        // Reset falcon, load FWSEC-FRTS, and run it.
+        gsp_falcon
+            .reset(bar)
+            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to reset GSP falcon: {:?}\n", e))?;
+        gsp_falcon
+            .dma_load(bar, &fwsec_frts)
+            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to load FWSEC-FRTS: {:?}\n", e))?;
+        let (mbox0, _) = gsp_falcon
+            .boot(bar, Some(0), None)
+            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to boot FWSEC-FRTS: {:?}\n", e))?;
+        if mbox0 != 0 {
+            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}\n", mbox0);
+            return Err(EIO);
+        }
+
+        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
+        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
+        if frts_status != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "FWSEC-FRTS returned with error code {:#x}",
+                frts_status
+            );
+            return Err(EIO);
+        }
+
+        // Check the WPR2 has been created as we requested.
+        let (wpr2_lo, wpr2_hi) = (
+            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lo_val() as u64) << 12,
+            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() as u64) << 12,
+        );
+        if wpr2_hi == 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region not created after running FWSEC-FRTS\n"
+            );
+
+            return Err(EIO);
+        } else if wpr2_lo != fb_layout.frts.start {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region created at unexpected address {:#x}; expected {:#x}\n",
+                wpr2_lo,
+                fb_layout.frts.start,
+            );
+            return Err(EIO);
+        }
+
+        dev_dbg!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
+        dev_dbg!(pdev.as_ref(), "GPU instance built\n");
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 54d4d37d6bf2c31947b965258d2733009c293a18..2a2d5610e552780957bcf00e0da1ec4cd3ac85d2 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -42,6 +42,13 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
+/* PBUS */
+
+// TODO: this is an array of registers.
+register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
+    31:16   frts_err_code as u16;
+});
+
 /* PFB */
 
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
@@ -73,6 +80,14 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 }
 
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
+    31:4    lo_val as u32;
+});
+
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
+    31:4    hi_val as u32;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

