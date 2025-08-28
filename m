Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9E2B394EF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 09:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCD410E1AC;
	Thu, 28 Aug 2025 07:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XVK27Biu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A1810E1AC;
 Thu, 28 Aug 2025 07:20:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHQ8EkrHjx6Cslydw6/xwWaL3E0/6uw6B/VUCBhied+Yx0Th/RT0PUt7N/kmjFi6RX749DS4achExIEjydmF15nsjHDx8+iTnRYjRqaMM//vS3RIPzJkNhMY1Y/BT0OxolXwt4iSRAEtJiUrP3I/s86YiKD+qoD8zU76eVQCDJz8kUEUxYsCBQe1pClX60K4fyMv7TUxWXcg9lUyaWSkKwIAC2DE/GqFs3kMEkUEzWmsBeno5+of4U1F/1aXpd4U/8EB9EnuUQiRwUj1JHqgMQ6j3bwsZS8By5mGtRdgHOBPmmGMTtAOz/ac3rSjeAAu5FnoQcR6TkNkFYoRnFvtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upSX9TbQ47ZjRZoiLnxtSmokGoQAAqupe8DLJXbu5Xs=;
 b=SPDA3EZ7Qa0FMScvIi9GWyd87nLtLyv0WY8vwZzrI1tyOkltkbmXiS9tAYz3d9SQdwFz/rZ5jh51B3IUB4hTSl6XJZ5W/RW9/xmfk4D4nH8QPw3LCn/xP2n4QrF/LrkuxWtAkhnMWuc5VuT3wM8vzAlt3dQVvWiqRx2yO6d1IE6i6Dw0K/ah8Fcxb1As9+Jbjazdhs3FfvDsl+8Bfi3a5u5lfb4zAgYTDncpaEs+YfRFDuOsV4n29Hf86N9rFFtk0YtnqEqM/Sn5pVdSMOXmfpsLYHuaxdj4yBhGDm+mWnXASzXKtj5CtA4pryjejaKI4U60adA+ezNB06ZkvhZEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upSX9TbQ47ZjRZoiLnxtSmokGoQAAqupe8DLJXbu5Xs=;
 b=XVK27BiuhYeVckzWQJfufbopIkCl7LlirhwLExzvP2vrn+6nVnkLw101t1i0Bp7hEI/pkdJwK0Uw5EOeWBORBR4T5T29AhuLg/lqkbk3CGfg5UxW7SSdWHm8UsgpdqQkr7uxUmkumwCpQcx4iWN7rl7ui8YLfF2THUHEPVr1V3R4xAMTRPehWGcPDsYgF4ExXQwc8nTcXTiaXTEcynSWWFYLESxUgjVzzgeTRA6pI1sNvklMIBt9sXX5mcLs1wf64n2gbflTzjJt3KPd+7rGqGgH1Rl9FIqQvQwZFImOpguQ2IUfWmmTN1oXpR1hpHTq2VpAxUenj8A20Yc3IQzm+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7032.namprd12.prod.outlook.com (2603:10b6:303:1e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 07:19:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 07:19:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 16:19:48 +0900
Message-Id: <DCDVN0P2EGAE.1W3K2ZB9D54FY@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/8] gpu: nova-core: firmware: process Booter and
 patch its signature
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-3-93566252fe3a@nvidia.com>
 <a9467dd4-6551-4ef2-b231-02d7696e2d8f@nvidia.com>
In-Reply-To: <a9467dd4-6551-4ef2-b231-02d7696e2d8f@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:604:25::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: f924b1a8-1713-4c33-a379-08dde60347ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGE5cTNUVzZDZnhreUk4VjIwdTdMSE9ZUHBWRjFraTk4bWxxTWtwaGRpd1dW?=
 =?utf-8?B?K0U0YWJDU3JpeVcrUjAyVVZ1TVpZd2VicDFMNXdoTmNqb21BbUFDZ1ozRFIr?=
 =?utf-8?B?V2tBQmY1TWl6ekxUWkcwMUNwa0xRZHNRa01aVVhqaHBjc1ArUVA0TU0rWVR5?=
 =?utf-8?B?N29DdmFiaHdpSCtua2ErTjY2ZzAxWTdzR2dHdXdnZzJwbmlERGF2TkNCcWYz?=
 =?utf-8?B?dE5VUHdRWERiYytrV3EyVHFpZ0kwZDJWTmR1T2FoM3V1RlBiMW8rZTMyNThX?=
 =?utf-8?B?bzZtTHUvY2RyVjVIOEQxMCsxV2xuTTJvSUZHM3VabGcrdkNzVUZreExjKzhk?=
 =?utf-8?B?VC9IbWZqR1RaWmNKaW5PN2RFMzdkTDVoN0t0NzZFcUlpN3JoU1hETit0bUpK?=
 =?utf-8?B?NVpWUzM1aFhUMk1DL1ZKZm56b1pWelpzWTFMMGpjVlVFYVMxY0wzY3NjWFEx?=
 =?utf-8?B?TUtOQWNoU3JTMnhoNncxSUx1OW5QWG5jZmVUQ283MGpBTGI4RXNNOHlwY1JI?=
 =?utf-8?B?TTZ4WnlPS2xPZUNpZXB3Ris4eWdPL3VYSW5DY3RocXpRdk5nRlE5L0E0QmFw?=
 =?utf-8?B?V0RobW1VTUpvejF6T21USSs5S1A1bjZVZ3AxdTVSUzVJUW1CdVhKM251Y3Z6?=
 =?utf-8?B?dUt5OHg1UGc0eno4eHVJbEs0NEV3Z2hQbDJhenZWMnpUYzNTZTRhTytxVlNj?=
 =?utf-8?B?cW1RZGpLbHY2UGt0amdnQVdtMll0QXhYWVlOdzFJTkRWWG4vSFFudzFCMXZq?=
 =?utf-8?B?RmxIeFkzTzdIVHlmeC9PclhKbnd5S0hCSG1ScHFvVWJlU1pPbGZkOGJicWV3?=
 =?utf-8?B?dVRQdnlrbXAzT2huLy9Bc0FPVFBLRWVuUkFRRi9tUEFEaDlON3BmUHZmM0FL?=
 =?utf-8?B?TjBZamJ6OWhuRVdoZDQwVmY2OUVseFl6ZWgwUlV5K3VYZEp4NVZaaWdXai81?=
 =?utf-8?B?MmNWMkdoRUdkVTEwQ2cxM0FjZnFEM0tNTEkvWUJ6YjRUZEUrTUJhRFRRVDgz?=
 =?utf-8?B?U1NxLzZxdGR3cnZBd3M2blJ6MVBCM1FNaUdzSng5N3ltdGluWHgwNDFSSzZP?=
 =?utf-8?B?b29xQ0ljY0JsSUlmMVREWlhBMVdTZ2Y4VUJhTkxJRXVRSDErRzY4RWF3RnZm?=
 =?utf-8?B?blRNck9CN3hCeXpaZDQyVmdTWlZLTTVnbUt3SU9UbGdxUWdzQmJBZVNsRzY0?=
 =?utf-8?B?TzdsSWtMbGlBWHdKSFJDN2pWNnpaK3JFbjlBN25lTFZyaGxJR1NCNmNLNkpW?=
 =?utf-8?B?blM1V0lHTHlFNTd3QzFjczdwNjRSTFZxaGpwVythT0lJcW12TXYvSEo4cmtS?=
 =?utf-8?B?RWpJY1Z2c0xjWWhBdk5FQ1VwOFB4UlJVaFE1NFVBV3dmNnN5dmlyR1J6S3lu?=
 =?utf-8?B?T2tkMGIrMnd6NnpjQ0ZyK0Zib1NJSUp1K2pWcDN1QkREbjFOY2o5TzlybmNW?=
 =?utf-8?B?OHFRNG5ESDhQa1RtSHdaNVd4bHF2L3RUUUt1T2xZWDYwK1ZWM0IwK2VoMWFx?=
 =?utf-8?B?a0x0dUtpZW14LzJqN0lDL0x0bHRWYmxnWWZ3cUo1N1A3VFRWR0c0WXBDTWN4?=
 =?utf-8?B?aWg1RUZCQjBRenViTmsvVU9hS0RWby9ZOENtd204dWhWb1pCNmVnZEFkYnFi?=
 =?utf-8?B?WkdycU1rZGRRcnhMaHIvYjkvMDkyV2VvZzVCbHVoYWRDU2Y1S093Uy9RaGQr?=
 =?utf-8?B?TEpXZlZra1lVbVJVdGI1Q21ZYVJNSzF1Z0ozNkRqMmpkUkt0RHVGSEhBRmc5?=
 =?utf-8?B?SjduWXpGWllaNnAwR3NEbjhoam5Bazg3QVpaOHlFRE9aaWhqaWhlOFBTdGM5?=
 =?utf-8?B?UC9OOEN3YUlCWWxFTkNyV0c4U3RqZ1lSMXlveFZDekVFRXp4QlM2TWNjY1dF?=
 =?utf-8?B?YVZCSGdDQnprMmkreHBYVE9GTTdncGNySzRiRDNBd2Zjc2FjdjlSWVk1VWR3?=
 =?utf-8?B?ckFRQm84NjAwSE5kOEJmcGk5SGVLd09LUmFoK3djUllybTV2VlJzZEs4RC9a?=
 =?utf-8?B?ejlzMFZ0RkpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzNXeUtJU1lwQzRHNDMrUWpTN3RwTEVzZUJ1VUJhUmtnQzgxS2huTytJUTdu?=
 =?utf-8?B?TElKMHYvNnlTdzJoVFlrSi9DbXJhZEZtalY4S2RUcldFTGNsT2M2T0IwUmhS?=
 =?utf-8?B?ZlpVa0NhOXY2eG9DU3JDSWM3dmdrSE5ZZ2MwK3c0YkxYcy95NG9RU0dpQ0Nj?=
 =?utf-8?B?Ync2Tkt0cG9MYTF3NHlFNThEeVQvN1RpUnQxMkszQUorSVo5Ym5PUWdHOE5a?=
 =?utf-8?B?VkVrR0RwaW5DZHROYmZKek00cHFyTll5TkY1TlJDOVRlYWNwOXZzdEhIemNk?=
 =?utf-8?B?WGZsUnAwTDgrSU8wWlZhdVZ0WGQ5SHRmVmo1YkpsSisrcFVuUDg3S1dKaWxj?=
 =?utf-8?B?akkxQmFUaERLY1ZBZ215cHpJZFN5R0NiMG1YdWJIS0VFV2FORGhQei9yTFU2?=
 =?utf-8?B?L2VES2pFVUZZaGhnZHc4eXNkUmZ0RjhyVjMxOUI1dVVlNmEwclgvWEJHV2RC?=
 =?utf-8?B?RGNNa0NhTG53ai84anozUThwNkQ1cit4MDdDQUZTd0VGVHh1WUpHVWhyVHdv?=
 =?utf-8?B?d2NGRExPWXJRTnhZcDRweFk4a25jR1JxSkVVdll1TkhyZWtuRG54Vm1PWU9n?=
 =?utf-8?B?Qi9hUzQ2dEpidHZRNmQ3b1NpU0RyWWVLSkhncldQbUpSQUErd21Zam1ZUUlV?=
 =?utf-8?B?Rml1cHJnUTFiNlkxZ2srdnVkcnRKZkdubFJVME5oUHVRay9NdnQvMDAvWElq?=
 =?utf-8?B?d3BYVmZLN1M1M1NaTjJXYTYrU0V6QTN6eHRzWkJXMnpaYUJabDBTc0p2Z2o3?=
 =?utf-8?B?ejVMTEVLOU9iZzMvclNVVnJpS1hFNXc4L2VlUzFmc0tZaE5ETTJ2K2wra0hI?=
 =?utf-8?B?VzlIc1FqbWpYazJ2UERVY29VQ0NzOEtpL2RHVWlOUmIxcERuUEtDWnJub0F1?=
 =?utf-8?B?NThtL3N0QmU4VmJwL0dvSHViVVZ0UU1QQTJWMTNEQnNZNklhWmE0QVRyczB2?=
 =?utf-8?B?b2ozTFUzSXM0TkcxdXNtWU43WnRXWkZwZklTU0dnZnJyK1JUUDV5bXpvUERG?=
 =?utf-8?B?VGZER2RiSXFTejVxWm5ISmpIcTVvVFIwRyt5MGlscHMrVHpSdXJWbXZZSGdR?=
 =?utf-8?B?U2tockdIV2thZlJyTzdMRm1USG1yRDhXdnIveXNmYXpyNVBwYkovWGd1L1J0?=
 =?utf-8?B?ODdzVE5jSFJ6Tnc5Ukg1T3hYQVdyOTBwL25JYkErM05UWjdHQklIRzNqUTJK?=
 =?utf-8?B?bHBzamtuN3pmSm5EVVRpVmJsTGtCdWNXNWUvQ1dpdGFzc2RhTzJLMGlhTUEw?=
 =?utf-8?B?QTNMMElMMHk0cnE5YWZ1b0hkRVRyVkhHK2FRbzNkSk5iYlEvQVBlZFFpSlFq?=
 =?utf-8?B?aW9HWTlqUTZtZnRKRWlYa0VLcVRaL1RXNi9sWXVxeVdBbHEvWTFyaVBidnBL?=
 =?utf-8?B?YjdYb1RUWitCTzY5cUhKd2NCUnMwTFFXSGVtc1p4OW9RMGFwMGNUbFZaVzY1?=
 =?utf-8?B?ZVlKY3ZJZmV3Mlo5ZzgwaDE3QVNlOEdWdzdDNzJWbUNQMyt1NUpLa0tkeWpT?=
 =?utf-8?B?UmtIZGF5RCtzTkxJSFRpZW1RSTZ4bU9VRmdGTVlwNmRlUjZncE1UQjRPRnd3?=
 =?utf-8?B?S2hQNHdLN2Q2bWloYU1CTHNNTHZqQ1FQMzhwWnRGNzY4TzFoc2ZKbjlSZncy?=
 =?utf-8?B?bTM5b0dDQ3dacjRKZWxMbzFPU0FkL1JraVBQeDdiUHJGZm1IVkZQcVUvN25s?=
 =?utf-8?B?V01zMFNaTXA4UU8xVkN5aldjTjdRaDdGRHNTa1k0d1hXeGNWa3pzblZKRjk4?=
 =?utf-8?B?eG5EYng1Rkl1OXJ1Z1JaWUNvaDkraVFxSkJUVE5uUE1XWS9FSVEyamtDWVcx?=
 =?utf-8?B?Z0hBeTNGdUlLdkt6V21OdW9JMjJyR2FTSExpaTVuZWNXbDdpTktjdUpkSEdZ?=
 =?utf-8?B?UDV1bS9td3R1WEo3L0ROdWFPd1ZhT084b2xSemZMVytiNTZIallGdmp5djcz?=
 =?utf-8?B?Z0VLeDhaZ1BVano2WnhNWVEyL3FkRytSZXpCMXp4WEVjWnNEN2dwek9vU3RL?=
 =?utf-8?B?WHl1Y0tkZFBIbTBUU2t0YmNkNFhwU3NCOFIrZTNrVEhQb0VFV1p5b21CMW13?=
 =?utf-8?B?Ym91eS9mei9YYUtaOW5MRmV0L3ZNNE00aVFaaFl2cXJyOC9YRS84NDl4N1ow?=
 =?utf-8?B?UFdtQ0xDdEg5dUQ1Rm42OTlOdklLTXJWYXd5MjgyU203a004K3ZnekZTdkUz?=
 =?utf-8?Q?FjoxwlpgO59N07ilJBjXrNWi984QJk0tO3nf8p847Tb5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f924b1a8-1713-4c33-a379-08dde60347ee
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:19:52.8348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHUetbRAZAO3TmYhopI685I5wqGpl7NrmmHe7UOS2jLH4iaVYeT6+khg2oOs6SR1WKRu/a4Z1HC2VUB9P7BRVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7032
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

On Wed Aug 27, 2025 at 11:29 AM JST, John Hubbard wrote:
> On 8/25/25 9:07 PM, Alexandre Courbot wrote:
> ...
>> +/// Signature parameters, as defined in the firmware.
>> +#[repr(C)]
>> +struct HsSignatureParams {
>> +    // Fuse version to use.
>> +    fuse_ver: u32,
>> +    // Mask of engine IDs this firmware applies to.
>> +    engine_id_mask: u32,
>> +    // ID of the microcode.
>
> Should these three comments use "///" instead of "//" ?

Absolutely! Thanks.

>
> ...> +pub(crate) struct BooterFirmware {
>> +    // Load parameters for `IMEM` falcon memory.
>> +    imem_load_target: FalconLoadTarget,
>> +    // Load parameters for `DMEM` falcon memory.
>> +    dmem_load_target: FalconLoadTarget,
>> +    // BROM falcon parameters.
>> +    brom_params: FalconBromParams,
>> +    // Device-mapped firmware image.
>> +    ucode: FirmwareDmaObject<Self, Signed>,
>> +}
>> +
>> +impl FirmwareDmaObject<BooterFirmware, Unsigned> {
>> +    fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> =
Result<Self> {
>> +        DmaObject::from_data(dev, data).map(|ucode| Self(ucode, Phantom=
Data))
>> +    }
>> +}
>> +
>> +impl BooterFirmware {
>> +    /// Parses the Booter firmware contained in `fw`, and patches the c=
orrect signature so it is
>> +    /// ready to be loaded and run on `falcon`.
>> +    pub(crate) fn new(
>> +        dev: &device::Device<device::Bound>,
>> +        fw: &Firmware,
>> +        falcon: &Falcon<<Self as FalconFirmware>::Target>,
>> +        bar: &Bar0,
>> +    ) -> Result<Self> {
>> +        let bin_fw =3D BinFirmware::new(fw)?;
>
> A few newlines for a little visual "vertical relief" would be a
> welcome break from this wall of text. Maybe one before and after
> each comment+line, just for this one time here, if that's not too=20
> excessive:

Indeed, that block was a bit too dense. :)

>
> here> +        // The binary firmware embeds a Heavy-Secured firmware.
>> +        let hs_fw =3D HsFirmwareV2::new(&bin_fw)?;
> here> +        // The Heavy-Secured firmware embeds a firmware load descr=
iptor.
>> +        let load_hdr =3D HsLoadHeaderV2::new(&hs_fw)?;
> here> +        // Offset in `ucode` where to patch the signature.
>> +        let patch_loc =3D hs_fw.patch_location()?;
> here> +        let sig_params =3D HsSignatureParams::new(&hs_fw)?;
>> +        let brom_params =3D FalconBromParams {
>> +            // `load_hdr.os_data_offset` is an absolute index, but `pkc=
_data_offset` is from the
>> +            // signature patch location.
>> +            pkc_data_offset: patch_loc
>> +                .checked_sub(load_hdr.os_data_offset)
>> +                .ok_or(EINVAL)?,
>> +            engine_id_mask: u16::try_from(sig_params.engine_id_mask).ma=
p_err(|_| EINVAL)?,
>> +            ucode_id: u8::try_from(sig_params.ucode_id).map_err(|_| EIN=
VAL)?,
>> +        };
>> +        let app0 =3D HsLoadHeaderV2App::new(&hs_fw, 0)?;
>> +
>> +        // Object containing the firmware microcode to be signature-pat=
ched.
>> +        let ucode =3D bin_fw
>> +            .data()
>> +            .ok_or(EINVAL)
>> +            .and_then(|data| FirmwareDmaObject::<Self, _>::new_booter(d=
ev, data))?;
>> +
>> +        let ucode_signed =3D {
>
> This ucode_signed variable is misnamed...
>
>> +            let mut signatures =3D hs_fw.signatures_iter()?.peekable();
>> +
>> +            if signatures.peek().is_none() {
>> +                // If there are no signatures, then the firmware is uns=
igned.
>> +                ucode.no_patch_signature()
>
> ...as we can see here. :)

Technically it is of type `FirmwareDmaObject<Signed>` even if we take to
last branch. The name is to confirm that we have taken care of the
signature step (even if it is unneeded). Not sure what would be a better
name for this.

>
>> +            } else {
>> +                // Obtain the version from the fuse register, and extra=
ct the corresponding
>> +                // signature.
>> +                let reg_fuse_version =3D falcon.signature_reg_fuse_vers=
ion(
>
> Oh...I don't want to derail this patch review with a pre-existing problem=
,
> but let me mention it anyway so I don't forget: .signature_reg_fuse_versi=
on()
> appears to be unnecessarily HAL-ified. I think.
>
> SEC2 boot flow only applies to Turing, Ampere, Ada, and so unless Timur
> uncovers a Turing-specific signature_reg_fuse_version(), then I think
> we'd best delete that entire HAL area and call it directly.
>
> Again, nothing to do with this patch, I'm just looking for a quick
> sanity check on my first reading of this situation.

Mmm, you're right - on the other hand I don't think I would have added a
HAL method unless I saw at least two different implementations in
OpenRM, but of course I am not 100% sure. Let's keep this in mind and
simplify it if we see it is indeed unneeded down the road.

>
>> +                    bar,
>> +                    brom_params.engine_id_mask,
>> +                    brom_params.ucode_id,
>> +                )?;
>> +
>> +                let signature =3D match reg_fuse_version {
>> +                    // `0` means the last signature should be used.
>> +                    0 =3D> signatures.last(),
>
> Should we provide a global const, to make this concept a little more self=
-documenting?
> Approximately:=20
>
> const FUSE_VERSION_USE_LAST_SIG: u32 =3D 0;

Good idea.

>
>> +                    // Otherwise hardware fuse version needs to be subs=
tracted to obtain the index.
>
> typo: "s/substracted/subtracted/"
>
>> +                    reg_fuse_version =3D> {
>> +                        let Some(idx) =3D sig_params.fuse_ver.checked_s=
ub(reg_fuse_version) else {
>> +                            dev_err!(dev, "invalid fuse version for Boo=
ter firmware\n");
>> +                            return Err(EINVAL);
>> +                        };
>> +                        signatures.nth(idx as usize)
>> +                    }
>> +                }
>> +                .ok_or(EINVAL)?;
>> +
>> +                ucode.patch_signature(&signature, patch_loc as usize)?
>> +            }
>> +        };
>> +
>> +        Ok(Self {
>> +            imem_load_target: FalconLoadTarget {
>> +                src_start: app0.offset,
>> +                dst_start: 0,
>> +                len: app0.len,
>
> Should we check that app0.offset.checked_add(app0.len) doesn't cause an
> out of bounds read?

If the data is out of bounds, it will be caught when trying to load the
firmware into the falcon engine. I am fine with adding a check here as
well if you think it it better.

>
>
>> +            },
>> +            dmem_load_target: FalconLoadTarget {
>> +                src_start: load_hdr.os_data_offset,
>> +                dst_start: 0,
>> +                len: load_hdr.os_data_size,
>> +            },
>> +            brom_params,
>> +            ucode: ucode_signed,
>> +        })
>> +    }
>> +}
>> +
>> +impl FalconLoadParams for BooterFirmware {
>> +    fn imem_load_params(&self) -> FalconLoadTarget {
>> +        self.imem_load_target.clone()
>> +    }
>> +
>> +    fn dmem_load_params(&self) -> FalconLoadTarget {
>> +        self.dmem_load_target.clone()
>> +    }
>> +
>> +    fn brom_params(&self) -> FalconBromParams {
>> +        self.brom_params.clone()
>> +    }
>> +
>> +    fn boot_addr(&self) -> u32 {
>> +        self.imem_load_target.src_start
>> +    }
>> +}
>> +
>> +impl Deref for BooterFirmware {
>> +    type Target =3D DmaObject;
>> +
>> +    fn deref(&self) -> &Self::Target {
>> +        &self.ucode.0
>> +    }
>> +}
>
> OK, so this allows &BooterFirmware to be used where &DmaObject is expecte=
d,
> but it's not immediately obvious that BooterFirmware derefs to its intern=
al
> DMA object. It feels too clever...
>
> Could we do something a little more obvious instead? Sort of like this:
>
> impl BooterFirmware {
>     pub(crate) fn dma_object(&self) -> &DmaObject {
>         &self.ucode.0
>     }
> }

`Deref<Target =3D DmaObject>` is a requirement of `FalconFirmware`. That
being said, we could turn that into a `dma_object` method of
`FalconFirmware`, which might be a bit clearer about the intent...
