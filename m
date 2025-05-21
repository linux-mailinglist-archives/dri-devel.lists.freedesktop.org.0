Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381BAABEC23
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6013210E648;
	Wed, 21 May 2025 06:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OGiksIbk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A5310E63D;
 Wed, 21 May 2025 06:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoHJ2JDbBlQZzXFle4QdEu9iSL/OrZiD2QhWiZtmpROR/TZTWdQpHGXz2M5Fs+m/IEWmuFj2IU/gqFgP6Dd7a14vKnOUXDZJw1yqNIYEVtCc0VTAjFqM0Eq+pfzYE6iVicbOEVyB5PRV+fqSIuWfUkLZBWu6VG9O23vc0wMXV4zx9MeyKGCRHwB9zCRQwFu+XjMHrWGojdYVGYTh3KtgFqPiADy0fxUgwbgL/fg9uqgoE+UNPhe87o2oII+EDIFhdITBGuWh3mtmjgUYrmLFZmtZ7qjoSv78ohAVbCdkuyNHTBtCiYHMNBZcMJfHZX3KsONIdH8wZItUnK47LbXSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v0KeIATTJKlPQtIIYyrg2WIP1JJxWbMHsPnRowxvEs=;
 b=sgK+gOAUlAdvRSAlBJxBam+pmgP1agIQAKTXcCIjijJeP4TjVzvIE3lcAmqMHNIaSOeP3vS8zcGs8v372R0s2aRTSw8Zz10EjhPuwK0p74ErIA7DL01VFx/eAnFZvpBDRbb0V9JIwnjdjfkAulEXneBNVXyrTetjACfZJRGxHDzN6BDbzBpONztpWCwFMAre9jbsXQkNkuP0mToyP8fnypJpvgn3IdkYjCD8KFGpx4QnmeZi2t3+Zl2VNZPYrihD7RsUmfsIELKdXFmBW0OFy8VV25ND7By9v+NKSds7jXBPoYZJVn2sk0WwYTj2ClQiQJEG4s8civS3JQeqAW3WNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8v0KeIATTJKlPQtIIYyrg2WIP1JJxWbMHsPnRowxvEs=;
 b=OGiksIbkki4V9lciPMyjSFRYLTTs2i/ltPbMJqkRDfhIkRzi3UJPYjn0koFLHJILwlXw/v14+6DLCjfDG4Mj43AeS/Hk1G8ErsK6mELO56fiVU2hE7joTL12IGtQOgURY0TXf09tF+2MYFlXwk005g/TFVqMeFlQtyc+hcX5pUmTBLW+SBBnry7YWezN8AM4DyzNtkmbgnwuPpN1aI5BBFlasve9LLfCvtHU5AzeTxLu2hldO/MgwCMM2LlT250vgunuqJlhbefluy0Kdw9OMXLq1cBmqTUzOkAvr5t1Ybab/MJFPhOws1IJJH0I2fPSsvBM0F+zc50YVOYifccwfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:00 +0900
Subject: [PATCH v4 05/20] gpu: nova-core: use absolute paths in register!()
 macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-5-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: de0256ef-4aca-48ea-aba0-08dd98330ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVRPZFI3bzZ6NzUxeXFEMTMzSjZVL09qd21wRGdFcHZnTkovWW5Iek05U0lS?=
 =?utf-8?B?cE03RTJaNVNrdFNyaEhROVozUmhqYmI2c1pKQnl5SWxLNXBCSWthYVhqL0t1?=
 =?utf-8?B?RE1ES3BlRjM1aWMvSDV1MmlYandUb0F6SU1BaWl0UkZXc28wNG1NQUpPVjBo?=
 =?utf-8?B?NXVhazM2N1pFRXMrT0xUbHdObVJtRWFocXpnU1dNT2dSVXpGTVlnVVIzSlhh?=
 =?utf-8?B?aEowSkloVU5oNy9VbGFmYU1LNnlWT3AyWXFCNk1JK2RxSWdJTDkway9GNk5h?=
 =?utf-8?B?a3ZYOHVZWklZd3hYU1d4ckRlNGYyT0k5dHFTbU5OTWcraHFhbGpPNHRiZEpp?=
 =?utf-8?B?clQ4ZjZQTjV6bkd2NkFycHNudkE2c0ZDamQ4ZmVHbWlxQUJKZW9MSGR4cW85?=
 =?utf-8?B?TklTZE14d0JSbWtqL0V6bXJwckpIOVFFMk41bkU5a0dEVVEvVzhYK2ZsUVFR?=
 =?utf-8?B?N29Mb1l5cE92R0t6ZHpkS3RPUlJwbkRST203Y2NvL2J6YzBBdGttYWc3aFpH?=
 =?utf-8?B?Y2ZyaFNNRi9NUmtMMEw2TkVOT0Y1UUxhZFBsa29mb25Db0UxTmRxaHJKSW45?=
 =?utf-8?B?UlhpOUFtQ1I2UFd2MlJSNXNTeDdaek82amxETDFVL2hOaG1pZFRtZzhxUVd0?=
 =?utf-8?B?dWZKZ0xVbU9RZjJ0QWZrVHVzQi9ydEgxWXZabURRNXJVVHFMa1ZiZ0pvQXAw?=
 =?utf-8?B?cWd3OVRxQVNadkpNd1hvSm44RURwNHdKL2xicHdaMk5TbjduWXY5WkYrWTJp?=
 =?utf-8?B?NTdVTzZHK3NMMFovOWRaNkh4MkdtcmVHK2xFMVVwdnREUUwvZ05DVlNNU0ZR?=
 =?utf-8?B?NjlxWHdCQ2l3aUM4QkpoT1pBSzVUODZFUmpjZitxL1hvNXVkNFdLT3loZ25W?=
 =?utf-8?B?d1BMb1NXcjIyNHRZYlprZHU2QjF5ZEF5cU44ckdTWXYwZEFERjJQN2I4UThE?=
 =?utf-8?B?UEZva2ZMYmdPVTZPZTBKTTNNaEd4UTVJK1MzcVpQZTRDWURoVm50eTI4dGRE?=
 =?utf-8?B?UkNYd2NXRGNhQ3pVSnhZNzdkalRqNVdQd3RDWVNXRXJjcWE4UGs5UjlVb2ZS?=
 =?utf-8?B?R2xMcEtWUVREV1FDalJpZDUzaHU0UFNxc2UydmJrc3diMUpQblNlMk43ek9s?=
 =?utf-8?B?WjhtZFlrcEQ0MEhvdVowZWlIbWJYRnhmSENIRTA3TVlQbGgvUHBPczMwcnU3?=
 =?utf-8?B?N3pHb2RIOVliWVp2NnRvNWE1bTVnc2F2ajFDUS9pR3dyWkZkSWhqSjg2eWhC?=
 =?utf-8?B?dlFBbERSZ0xLdHRLeTI0MXA2OFR5ODJ4WG44UXU2ejF4azQ3S2hzUEtyYVFT?=
 =?utf-8?B?MGZTNm90Qjh3cGpKNEQ2RjFrc1V2Wm1WdlVVdXdISTlIRFZTbDVEL3JKcHFl?=
 =?utf-8?B?VFVtMVFudmxRM21NdEREaG9JTzhaTW9DbnQwaEoxeVpyZEI3N2tXbDYvem9t?=
 =?utf-8?B?ZVdaT0EzOUl4MjB3UDZYZkZLM1BXTVV6dmE0VHFPa3MyQXFVWGFiRnJIbmNJ?=
 =?utf-8?B?TDlWLzFDbDE3bHVjRFJuN2llcXpjanFPRGFFRktZRkpMWWtzaU9zeUVuYkFx?=
 =?utf-8?B?V0FNS0JoODNuMGh4QVZVbnVjdUJLMXlIWC9ndG56Z29OeDMwVUhsa3JnT2Mw?=
 =?utf-8?B?bURvQldHZk8yUHdKalJTZzY2OG5mQ0VTNXJVeGhrYnBGb25uN3VTdVNDVlNk?=
 =?utf-8?B?UkFYcTIzc01DWFEzN0F4M2JzeGtQMG9nSmx5dlZFQkdmays5MGo0SUM4QURB?=
 =?utf-8?B?R2IzTTUzd3V1TTZRd2s0eFNUdTlheUJZeFM1TUFBMkhqWlZYakFaWG1wSlJr?=
 =?utf-8?B?b3hYOFRsS1o0bll3ai93N2V6Z2ZQQVN0aTgvRjAxV0Nra3FacGhESE9hS1J2?=
 =?utf-8?B?SWFSdWVtVkFmakN3QkJrNHdDbHR1dHBZdGNvNTN2N2g4czZ1TDFSak44UkY4?=
 =?utf-8?B?UWlpckcrWVY5SndQTURzVktHTE9HZldLS0hXZ29sUU0xMHpkNnZrQzVzNy9h?=
 =?utf-8?B?aU5HaHVYa3BRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2VFNlFTNk5EUkpKUXJ5bjZWbkI3THpuOHFpM0hzK3p6ZTZwTUV5YlE5aDVp?=
 =?utf-8?B?V3pjWkxwV1U4anRuRnVhbXZuR2k3VXNtUVFPZWZUdi9uOW0wOVo3NWFlZWh3?=
 =?utf-8?B?QW1zUzZwTzZCQW1kVjF5NDhDR1RrV0doUG5vMTMwV2Rna1pjWm02MUhlZHg4?=
 =?utf-8?B?OFVIMWhhNFI4SXcvQkUvbXE1TytjNjl5dmNtMnVFNkNBRmNLMzdxSTRteWpa?=
 =?utf-8?B?SmROMml1RlI2MkRiRGFHa2JnZjRpN3RUMnJDUDZwUU9mV3M4NG9IL2ZYN3gx?=
 =?utf-8?B?SGM4UE9SNFNDZHhLVXVkRzRYUnE5VEZ6UlBXTFdrSW0wU1NiMCtiRTVuV3hr?=
 =?utf-8?B?MXZuYnlhayt1T2tEWlNMMmVBTkZCNVRMampnTm02emtaRE5maTcraWw4QWxv?=
 =?utf-8?B?a1ZuNlRSYWtiUTlFYklWWm80UHlIUVU1cnJwK3dUVkRnNkNXeDRmYkZsYnVm?=
 =?utf-8?B?OVczdmpQRUh1NnBmcnNLdHVNai82ZDVhd0xwMXF5bk91dTlWMUwrcDJkeFNN?=
 =?utf-8?B?RFVhdlg3b2VMOGY1bGo5Zzk0aWFYWG1TK0ZYVDZjeHV0ZHUyODRFdDNVczRP?=
 =?utf-8?B?b1FrNi85aFZKbmE0ejNiTHVxVTd5RG9mYnBzaHFxdjFqbktTQjF0RUQ3ZFIy?=
 =?utf-8?B?cVB0c2dKZThRSzZpem8yUDJ0a1VqdmVzV2o4dkFWaGZtczNFMllTK0tjQmpm?=
 =?utf-8?B?QUZRVk5VV0xXTDMvM3UxWE1IYU9mSzJ6WTFpV3k4YTZYM3RXOUppemNHL3N0?=
 =?utf-8?B?ZjlmbWZQNHVDeldYYitBRmsrMUo4YVhFa0hVeGpXUmNYb0xQYjB0cmdwYzBs?=
 =?utf-8?B?ZW9WSmtjc2hGZ21VUlpzdzV6NnZjVWxYZzh5VEdic0VVVTJ2OGlvdzlONWRH?=
 =?utf-8?B?RTBYQjFIL2tlWFBaYmtkKzk1Q29jM05wZmVzMFFlUU9ZWnBaU0N2K3dVRm96?=
 =?utf-8?B?WU9SeWQxNTdpWTMvQlJLYlFzVUcralZiTGMxRVFZUXZqcFc5OUg3MnNGQy8w?=
 =?utf-8?B?UmRzT01oa1cxZmZGVGJmZENCU0wrUzBLcXlrbEVkTFZmZXlHcDl0cFl4TlR3?=
 =?utf-8?B?MEc0cnN5UU85STN5dElqOGhOTXIrNUZ3YWhQTURJUjV6SitCVTZ1akhXS2tT?=
 =?utf-8?B?Z3A1a1l6Rk4yVGd1TjVwZG1mQWl5QnBVbFNQUmFPUlJKS2tDRkZrQVZ4Kzkr?=
 =?utf-8?B?Y3NvTHRXUWFMMnFNWjdrajRYOHFJV1puaUp5Q0psaDFETFpBd3pLMXFMdHk4?=
 =?utf-8?B?TEtoL3BMTUU0Mk4wdi92V0R0WTFoalBLS1Z4aFdFZEJlZ25hcGh3blN5bDVh?=
 =?utf-8?B?UnV0UHJiQ0ZtUG9RbUMzMEFEMG4yOFhjREhCbkRQYjkxRGVMYWJ4cG1sd2xH?=
 =?utf-8?B?NkxJZEJyOWQ1cHA3Mk9FcTJJcktXS0VKcnFNLzdCaUROS2lEQU1Od1BtcWNF?=
 =?utf-8?B?RFIvQ2dpY0syQmRuTGhMRTlWeWRNVFJLYyt0eEUzYWF0TnMzRHVkVXB3UTV3?=
 =?utf-8?B?dVF6QzhTOUhjNVh2Y3FKMnhybUp3TERQVE5nYmYwVTRxN3kvNFQ4U2FkV09G?=
 =?utf-8?B?TUNIVjhMLzY3UVhqdXIyMUk4eEYwYUJHamp2WXZpeU45Y0VxeWl4Q25uTUlR?=
 =?utf-8?B?Qy9vWUtJRGJMeS9sTG9peFl4US8ra0dvLzg4WWkzdWZXR2hlT0JROHNXcnc0?=
 =?utf-8?B?RkxnSDI2OGJ4T09QK3NGNjQ1Ujc4djJkVEVqUnYvVGJsc3dpNFNpa2ZMeW1q?=
 =?utf-8?B?NVNUbGN2YUZrVkJZdnpEVkQxNThjWTZ2dmNTN3k4ZDZRTmRLdjBUQ0tzUGl1?=
 =?utf-8?B?UzluNnJwZE1Db2hzM2tBenVkaXFaWXI3SllBQVZtUDc2WmNRbU5YWjBWemxS?=
 =?utf-8?B?SFJJN2Y5cXAzWWJEVW5NeHc2QkRSQkxNYlZsK0FiS3lsT1dIZXJTRTQ0d01M?=
 =?utf-8?B?VVNmaitvTjR1RDRpb0pSK0ZqUmZiM1lxSUZIWDFhbjk2RDNqKzBxd1hFcnZF?=
 =?utf-8?B?emdxdUdNZU43VEllNkdCSmV2WGJ0SGZ3RmxuZTlxQVVTL01sMTJVQUNIT2hr?=
 =?utf-8?B?VGZ6TmwyVWZ5cWloV3RJRWE1c2paZitVcFpFTGpnVkF5VHI1VjlCdzdDTG9E?=
 =?utf-8?B?d2h6bks2akR3bytoL0tHUkNOdnFnSklFVksyZVd2WDZVQWZSaS8waDJ0d2gw?=
 =?utf-8?Q?Th5PVsV4CZnO3DufLF5s4X39pGbG6a/6vj2OMjA3sazQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0256ef-4aca-48ea-aba0-08dd98330ed2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:21.7325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgDCui+XkL53/pGG7opsDoF+1LGswBiywS/oAMyFs7xpNrAvqhbCPekIRM4CLgSRyyM++eXksLUajeIASXUXJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Fix the paths that were not absolute to prevent a potential local module
from being picked up.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 7ecc70efb3cd723b673cd72915e72b8a4a009f06..40bf9346cd0699ede05cfddff5d39822c696c164 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -114,7 +114,7 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
             }
         }
 
-        impl core::ops::BitOr for $name {
+        impl ::core::ops::BitOr for $name {
             type Output = Self;
 
             fn bitor(self, rhs: Self) -> Self::Output {
@@ -161,7 +161,7 @@ impl $name {
     (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
         #[allow(clippy::eq_op)]
         const _: () = {
-            kernel::build_assert!(
+            ::kernel::build_assert!(
                 $hi == $lo,
                 concat!("boolean field `", stringify!($field), "` covers more than one bit")
             );
@@ -172,7 +172,7 @@ impl $name {
     (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
         #[allow(clippy::eq_op)]
         const _: () = {
-            kernel::build_assert!(
+            ::kernel::build_assert!(
                 $hi >= $lo,
                 concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
             );
@@ -234,7 +234,7 @@ impl $name {
         @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:ty
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
-        kernel::macros::paste!(
+        ::kernel::macros::paste!(
         const [<$field:upper>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
         const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
@@ -246,7 +246,7 @@ impl $name {
         )?
         #[inline]
         pub(crate) fn $field(self) -> $res_type {
-            kernel::macros::paste!(
+            ::kernel::macros::paste!(
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
@@ -255,7 +255,7 @@ pub(crate) fn $field(self) -> $res_type {
             $process(field)
         }
 
-        kernel::macros::paste!(
+        ::kernel::macros::paste!(
         $(
         #[doc="Sets the value of this field:"]
         #[doc=$comment]

-- 
2.49.0

