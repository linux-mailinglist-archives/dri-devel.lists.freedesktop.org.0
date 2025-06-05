Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED38ACF44B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5171710E0E6;
	Thu,  5 Jun 2025 16:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WLZSzm2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F79D10E0E6;
 Thu,  5 Jun 2025 16:28:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJTXBqoeHkfzpxiFNsSTgPjpaHXD8VqZXjiQpFhALwv+7zOBY4qjI4qxzqu/U9A7UtJ4hJRELDsr5NItCNS1aS5ujp1qiONY9jG0HlZ5gDwyJMeq3exl9LtBvuB5v0YrmZgwH3AtxhMPNRhYZc69ch/c7PUEJqbyOa4pJrhjs8ulL8irYV7gxh/UojU5Uf7rWMTayD75IUjqQSOVJgeR3TnLWPuBduRddpRUUdZd2+gGef9AjAuk17NuOXB+XQia8StEffVTPOrlCIZ/sKbF63o4X6c7u/Ep8K5ljYVm9bF1e7c5whTsvB1Yvb9KSJ70rbGgx+mx1tSo3Ax++3rHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaNpH+laq7jMg2fbuRXm2IS2BqW2w41JHGgW4S5owIA=;
 b=AjwqyKGSPTMR44VAh6FeSejftsQoS09fR6AWVEwntr54tAoIJITatQiAKpTaOl29fJr0dnkifxRswVBwgZZuCTFeyozHEPz+Kz3gxzOtDRSNjecsaeA2om9fF0FJLK0QbfGp6qJJg0/WSveCmnDGpPs05uK5fx9YjTYrtRIzXK7Tf9rCnpBlf7+c6BR7EEDheEoFeceFnjpJQIGq268i0MayCeOC/jxhrQkuRY25NBMRwxq/10Bwf29jd7wSY2K7bYpad3iBflyNZV4bD7Sy65PILY+kDhaz9w33/fWYt9VPOQkotSnuElUa/JzuHgcco0FyJdjL/POYlDCADgOfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaNpH+laq7jMg2fbuRXm2IS2BqW2w41JHGgW4S5owIA=;
 b=WLZSzm2O5TEKfNLTFkLKlkZSQjxp2IJzOkyfEw4PIAoqOO1vWA16PfHtyMXFO+Gm1PAgC4hlwNz3PeTY+J1dz/NMR0I00kOPUses5EGTLYxtARrHCBucdwgqoFD2+tYFGux7Ha8hdAkmgg57YwLiXJyUnKvhYIYysdo2NXNCFQYILO0H7f0LdiIqE5e0njuCB6X7i5wFAXCLrq6mH8xICX2u0MkU5/ql67gDflwdWFqDtDhnp/8CzF8K4+nXXQ7i0FqnGb0SCzTyw2D4Jcw6Hb2hu+EMOPBJvjcV+jrruJXwXb7XGiVgroKo9tsUtYkFu1Aeprj0bAcKKlHUtoa5nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CYYPR12MB8656.namprd12.prod.outlook.com (2603:10b6:930:c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 16:28:44 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 16:28:43 +0000
Message-ID: <ad09976c-07ed-4ba4-b103-4433cab59c5e@nvidia.com>
Date: Thu, 5 Jun 2025 12:28:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
 <f528cd2d491f15404f30317dd093cc7af5a00fa7.camel@redhat.com>
 <9de086d3-e441-439f-9ff5-aa66a99643ba@nvidia.com> <aEHEIId4Fp0cCWMH@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aEHEIId4Fp0cCWMH@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAP220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CYYPR12MB8656:EE_
X-MS-Office365-Filtering-Correlation-Id: c21019d3-7aeb-4f7d-8301-08dda44e09d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dC9NK29oOUhRbGNCWkNTUXh6VmhyMklCdUxOOVozVkRvcWhSZy9DVTFNSUxv?=
 =?utf-8?B?M3FMcERJajVBQkIyYlNGQ0E0S0xyc2lQTXdpYmZVVTFFaitsQStFMFFBYWh0?=
 =?utf-8?B?QktBVEt1eFFYTUhZbXhXQjB3VkY5RVdHbStYeE1ENXJJbVpOSnpOdWJPSVZ4?=
 =?utf-8?B?dkxBSlNkRXJsSlA5ZnZkVTJMK044cjFNWitpU0NJWUpaSkdjb2NwUE45N05R?=
 =?utf-8?B?emZLMlVTL1RSQzFSdDhvZ214VWEwQStTUE5JVjlPclFTQzE0SjVwMVBzZmVl?=
 =?utf-8?B?dUp0aXJoaUtyTnhxbjFCNElzYWFjaDY4WEc4bVZ0MldSZ1R3SElSeEFEZkpL?=
 =?utf-8?B?SVppVHNDYmZjcy9EMXJDeFc0TVVGdkNzRHhad1oyL0JJdHExOTk2MWNSV3Ft?=
 =?utf-8?B?R090bGlLYndsOHM1M3FXMFJUcFAxbzh2SWJPS0tOZ3dYWDFMRjVyaDZpR3lm?=
 =?utf-8?B?aC9hbDRLa1h2UzZlNjFkcVNGY1RXN1pmL0k3U1AvNCtlWUFhZTZ6c2JzbzBj?=
 =?utf-8?B?QnE5WHJBU1dCblV2cUE3S1NDZWhpdjI3T1NtclJuaHQxZ29mdXJLdWlBdzVx?=
 =?utf-8?B?clN1OHViazN1amhFdmN4YUxwS01vOVVySUVlMDNZVXhIMkJRSFQ4ODBpbk4x?=
 =?utf-8?B?eVBac0V4SFQ2Qk94bHNsVE9Tc28xdklGc2JFaDdoaGZCcmRZNWtoM0ZRUndr?=
 =?utf-8?B?VHZPbXBYUFBsWjl6MzBiTXc2UDFBKzdvNTFtYjd2ZklWcllFZkdEQlpXQ0xi?=
 =?utf-8?B?UjhsbEh6QWJqbU5XWWdmd0srTFVVaENUa1RuY28rbWlSNXdNeHM1eVNKd0JR?=
 =?utf-8?B?VG1ob1JQUWg4MW5CTFljdk9JR2RKcys1OWZuZUNDQXdUQjRhdnVjdW1xV0I2?=
 =?utf-8?B?S1VVd014ZWxYbE5uWnFOSnY3djhESGJUWWJnc3B6Z1VVR3dsRWZWMWkyQ2Vk?=
 =?utf-8?B?VG9yTmY1NXQyNDZxWktnOTk5TDNMZzRYSkNQOEJweTYveU9WQXNQYUNSNVJj?=
 =?utf-8?B?Vjh4UUp1Q3FoV2NObTFPaE1nZmwyTkk2N3hnOWJOU3Y0NFVaemJjUmNWVS90?=
 =?utf-8?B?d3FXNCtuN1gxWVJEa0drRXlWWEhMSFZrNFgxQ2NxNnczN1hJb0p5N0ExYktH?=
 =?utf-8?B?SzgwVjF2aXowbEdwU1h3OHlVSDlXNzUveitaMGtmWElYM1dBZFNQOHdKYkFj?=
 =?utf-8?B?SXVlUDU1RXYrMWljNGU0a3NqWjluYnY1Y2VjUnUwUEZ1d0czZEVlSCt4M3ZY?=
 =?utf-8?B?dFVxdkZVcHN5WkVKS3pFQmJPSXlRRmlqTXVqS3ZicnJoN0FFTWxVY3MxVFVa?=
 =?utf-8?B?T2k5MUsxV2ZzV1B2djFYQ1kwVTBMK0xiL0VuSmx6aTE5eElja0FtSjhVWjZn?=
 =?utf-8?B?a3gwY1BJVG41dE15ZzNab29vY09Ka1hxemZ1NTBPZ2pkalhTZUx4UkpYR2VF?=
 =?utf-8?B?Nk5GVXhyWUFWbW9OQ3AzcERscTVoMXNveklrRGk3RUdLcTVOUkRnVERsa25j?=
 =?utf-8?B?WGsxV0w2ZjBIWjBsRmNVZ2hXRnB6a0tMUWNSTWdhMGVmeGNmVmdDQ0dsTFlr?=
 =?utf-8?B?U200eEUzeE8wUG5xTWJ6ZzlHRmg3OTFlYTdMbDF0QldvdnRUaUJEVEZOdXlZ?=
 =?utf-8?B?MFQrSXBrWnloeExDbUdrU1A3YzNERUIyYUF0cVlqdnJrcCt5aDdvU1B6TnFM?=
 =?utf-8?B?SDE1cjR6OXlDcHYzSkxmOEZOSDUwSml5SlNQSitZK0lVYzhYa2tsQUtOUXgz?=
 =?utf-8?B?Qld5dUt3MG5tY09IN0lBd1U5MDY2SXhBY0J1ZHNjak16dmtIaTYyY251SkNE?=
 =?utf-8?B?MEt5QjFGSHJQQ1dOS2MwM3VGMkFSeFNlaXpPd0JrZUVyTVR4aTR0RVFackM0?=
 =?utf-8?B?ZHdtNXlEdU5FWW1lb2RwWGtKNmZZYXdHdjdUek1KQ3hHdjhpZ3JxQVJweDNX?=
 =?utf-8?Q?iF7XOPBTPeg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VktLUkU0OTA3TWxCeVI0Y2dHSVplT3ZyY0xLMS9iU3JYK3c2ZGF2VnlIdHFI?=
 =?utf-8?B?bDBWVEhtdytqYWJUcDhKVFRsWk9EOVlabHd6dGxnejdlSXhUVHkyeGx0bTJo?=
 =?utf-8?B?S3N6THBqVkkraGpXNnlOYVI0ZmxEMHptam1WYUxJZXd5TnBPUTIrNzRYZGRD?=
 =?utf-8?B?Yy96bCsrQ2hQcXp6NGtQL3h6YTJPMkErcTJWam5BVUk5WFBwc0M1ZFNRNFlp?=
 =?utf-8?B?RmhXL3dRR1E0ZExPNTFkeHU2ZG9yT1hRalA4ZlI3U2o3MTBoVVRJVnRFS2dk?=
 =?utf-8?B?M0Uvb2I3c0l4Z3A2eXRUMzdTdnRlUWpBZEZIblJPMXlWUDhmbTJIMFk2dEN4?=
 =?utf-8?B?U09QOFdOOUhQdG9ob0hSYW5OWEgycTMrT3BSU1JheDN3TzI1STdRZ0FYSHhD?=
 =?utf-8?B?dENmNnZQT2FkNVpzb1pTSFg3MUtBRkVCS1lnVHZBTHVUV2JGVEFkQzcvQzBT?=
 =?utf-8?B?eVFXUGVGRXpyTEZQbWVnNTMzR3pjeFc5VlZjbWpPcDZQTWt4NnQweGQ4WU4w?=
 =?utf-8?B?QVpnKzFNQmRBU1dZck9nWjUyNEZtMk90Y2NQY0xVSEtpSXpJMitRUmJ2QVZn?=
 =?utf-8?B?N29kckZCVHRZYXZGRHBSeXp6YW11eGg0UzJjbjJrSUVIYm5vcmJMeHhDTUpm?=
 =?utf-8?B?MmNBRzBhR2I5MWxZOFBkSjhKVUZBVCtnU25mUWxYNEVZMlhJRjUrUFBraTJR?=
 =?utf-8?B?Q0Rxb0E4UHkwYTFpMnVuYVMvRG9xdmtCdTJWeC9pMHRLODd1dlZVK1JGRkRy?=
 =?utf-8?B?WGxGM2o2MVFNdWlTWmtnOC92dE5HL0k1STFZWDNhVldERFhWT3Q5WTRsRzNX?=
 =?utf-8?B?RVpOQlc3bnRIa3VZRktsaHVwbXo2Y0h4YVI4alZ3OXlsT0dLbTl3R0ZuUzhP?=
 =?utf-8?B?S3VYUTI1d3UzamQwK2tsOWI3ZHVxNDRIcElXTmE1WkE3UzAwQVlRbUoxWnJH?=
 =?utf-8?B?ZVJBUTNoaGJvSDhneFNTV3A2UHdDZ21rKzhTbHFTNGRZSjUxZG1JSmVYTUZT?=
 =?utf-8?B?cXVPMTBpRm9POEVTSWtiNENZVnI5Rlh5WGZSY1RsTC9WT2gvclloaG9oK0JD?=
 =?utf-8?B?UDJOREk4VG93M2ZOMEEzMWVTTXY1bDByOUR5MndSUDBVRis4QWdpNk55dk1R?=
 =?utf-8?B?NW9yeGlwdWthTHVkQmEzTnN5dDlmekNYRmRpOUVvVlJNcnJUMStLUXZXVUlQ?=
 =?utf-8?B?NTFoQ3AxUFBjYzB1aEhCSkg5ckI1Z2hKd3ZVTUJqeXE4ZWJzc25CbXFlMmRF?=
 =?utf-8?B?aWVkeWx6ZHJqNXlYbGtpcXgxOHFPQ1lGbDRTNGx0cVNVR3dORzQxRGhKYWcv?=
 =?utf-8?B?aThJVTRIWWl6WjV4RUxickd3cG4wY2M0RnJvL1ZTZVRyd2xPbXhnM21zK1g5?=
 =?utf-8?B?bkVWRGFwSFhRdS9GdjdzMzAwQWQvejI2dEEyNVBUbE91ckYvdVBubUU1Tmt2?=
 =?utf-8?B?RDRTemtTSVh3SGVpTFcvVCt5djZISlVtTng5eHlyL3FydEFOaVVZaVlVT0dM?=
 =?utf-8?B?TEtUNHY4VnJWSGxOVDVmT3FBcVN1MFlkSUZWWkhlQXpVbkM0eHJxSEtPOVFB?=
 =?utf-8?B?TDZoazg0NHE0b2l0YW1yd2h1YlgvRVduNm83ZW40VW5sbGtoLzN6U0J5T1c4?=
 =?utf-8?B?VEltU0luSXFvZXhkTjh4VWprWWlqY0Y2ZVhVUk10UEhKMi8xU1RmWXNiOSts?=
 =?utf-8?B?SlFFdVdRelBFNUlnbDltdVpZdjVQL2V5Nk5OVHdNM2JSVDJyMEZjRnhzbWRx?=
 =?utf-8?B?QlkzaE5GWmZtRlo5Zy9Lc0tmREdYYlk1YWdNQ21jS2kwLy8rNDc1WERzL05m?=
 =?utf-8?B?TEsxam5sc1ZEdGpvL1RqaTlJRTNRYWlaOWJ6a3lJcHdwSnlZczRlbG1yU1Zw?=
 =?utf-8?B?UTB5cnB0L1czMDVSZFA1dFg0cEVTRXJIUVdxT29JV1NrQzhqd24wQVVQNVVW?=
 =?utf-8?B?NVJveWJPQ2pZa3cwQ3RJUzVrcFpXVHlTMmlycFdCZWtDNHBVNCtIZDF5S2pB?=
 =?utf-8?B?KzFkMC8vZ1RhRTdta3RLVjc2OHoyL1EvV0p0eFNad2dkcjhuRXJ3NWNlT0hD?=
 =?utf-8?B?YnExYWpnNVNJM0V3cGtORHliTFBLY2ZMNXJEeEVReGpvOUhuQyttMG5qMEI5?=
 =?utf-8?B?alU0cVdDZU9pNFByckVSN1psV25ZQnpHWDhhQ2RkL0pQU3M2T2Mxb0dkZGph?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21019d3-7aeb-4f7d-8301-08dda44e09d7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:28:43.8426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mm/f4oxENt2KN3vIlxbQUH5fkh0EOXyyCdIsLUIsvXzOYAh1zEqBqt/o1QwJ+6xl/mmcZFDNKMpjkz3PcI17bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8656
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



On 6/5/2025 12:21 PM, Danilo Krummrich wrote:
> On Thu, Jun 05, 2025 at 12:09:46PM -0400, Joel Fernandes wrote:
>>>> +impl PmuLookupTable {
>>>> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>>>> +        if data.len() < 4 {
>>>> +            return Err(EINVAL);
>>>> +        }
>>>> +
>>>> +        let header_len = data[1] as usize;
>>>> +        let entry_len = data[2] as usize;
>>>> +        let entry_count = data[3] as usize;
>>>> +
>>>> +        let required_bytes = header_len + (entry_count * entry_len);
>>>> +
>>>> +        if data.len() < required_bytes {
>>>> +            dev_err!(
>>>> +                pdev.as_ref(),
>>>> +                "PmuLookupTable data length less than required\n"
>>>> +            );
>>>> +            return Err(EINVAL);
>>>> +        }
>>>> +
>>>> +        // Create a copy of only the table data
>>>> +        let table_data = {
>>>> +            let mut ret = KVec::new();
>>>> +            ret.extend_from_slice(&data[header_len..required_bytes], GFP_KERNEL)?;
>>>> +            ret
>>>> +        };
>>>> +
>>>> +        // Debug logging of entries (dumps the table data to dmesg)
>>>> +        if cfg!(debug_assertions) {
>>>> +            for i in (header_len..required_bytes).step_by(entry_len) {
>>>> +                dev_dbg!(
>>>> +                    pdev.as_ref(),
>>>> +                    "PMU entry: {:02x?}\n",
>>>> +                    &data[i..][..entry_len]
>>>> +                );
>>>> +            }
>>>> +        }
>>>
>>> Not sure this makes sense - debug_assertions is supposed to be about
>>> assertions, we probably shouldn't try to use it for other things (especially
>>> since we've already got dev_dbg! here)
>>
>> This was suggested by Danilo. I don't really feel strongly either way, IMO I am
>> also Ok with running it in production.
> 
> When I suggested this, the code looked like this:
> 
> 	// "last_entry_bytes" is a debugging aid.
> 	// let mut last_entry_bytes: Option<KVec<u8>> = Some(KVec::new());
> 	
> 	for &byte in &data[header_len..required_bytes] {
> 	    table_data.push(byte, GFP_KERNEL)?;
> 	    /*
> 	     * Uncomment for debugging (dumps the table data to dmesg):
> 	     * last_entry_bytes.as_mut().ok_or(EINVAL)?.push(byte, GFP_KERNEL)?;
> 	     *
> 	     * let last_entry_bytes_len = last_entry_bytes.as_ref().ok_or(EINVAL)?.len();
> 	     * if last_entry_bytes_len == entry_len {
> 	     *     pr_info!("Last entry bytes: {:02x?}\n", &last_entry_bytes.as_ref().ok_or(EINVAL)?[..]);
> 	     *     last_entry_bytes = Some(KVec::new());
> 	     * }
> 	     */
> 	}
> 
> Now the compiler probably optimizes the loop away, since dev_dbg!() turns into a
> noop. So, now we can indeed probably remove it.

Makes sense, Ok then I'll drop the "if cfg!(debug_assertions)".

 - Joel

