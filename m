Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB1BB243E
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E6C10E75A;
	Thu,  2 Oct 2025 01:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MnofTNPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012048.outbound.protection.outlook.com [40.107.209.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DE110E758;
 Thu,  2 Oct 2025 01:25:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0rcHxauTcM1IqjLvCCpMs+zzJAeXpeLFpUTobUxhn2cn7L2gd95+hlbZgImqQ/8myk24Lf/wtZPPik4wX3RyDCTEhJQVMNy2GiIp6zC9AIHCNDwZL1FfxHQpgaa5vgtXtbL1YxnWwUeHBsXPj6Upj1MVn2GMDiE9TNIk2bArZwjV14Sj6dVcwk383YAXy/La4pJuRhnVOKyO66b8wjNcAS28SGa0+pTTfZRs05+9gBKOw1ctDmf5XBfOtxXYqZ3jB5Drxg44iDN7vepKqlCl3c2ve1MzAfPn5QJkB3D7IvgIfP7Q/R36J0FN3+icdDcm5gZm3btrOXAdvsjo/tfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAQI1zuLr1q0el9Pu7YWwWUyjNMRD4BnrQDfwoZrSnE=;
 b=UPF3MpR1FprpasE19uAy4Bf/GfsD33yG0sEHA+4ETRBwjZpaj3zel7LaxgPeBGHg1d55LDib0BGGju7sSivvXHSHi5CvOo9r5j0Tk4PCnv9TEY7+DtKYV2FJHvXH/Mklojq0QRmUG+yQoeyOtEKaRKqCykE/NqdHjEDzKOO/RVscT2v9h4F1KklIuLKJJ17CtGZgRbg4C2n9lKVLkTvuXW3Or5lus5gJuZY9b1T0zF7Gr92BGq6CutT1NkYL7h/mCkftbYHixYZZ/g7p1EwkzDv+ZfM1Ha7FREls/ENVx0chErzgdj7qRXwPQyw93UPhwUSFYWVB+Fax26TzOeuDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAQI1zuLr1q0el9Pu7YWwWUyjNMRD4BnrQDfwoZrSnE=;
 b=MnofTNPq3jw/tWW5nDX/D6XLhnkycbDRc7e73OovFfiK1mtGajqsbPT1loZ0vl9glXKeaNlmC0zyEKDdRktzO819+ThURWQvC2meBD5UMPX3ZEip0TY2LgYi96VfF7Sm868fbuCl3vKp2S2rXPGI9AeZfMZCCgbfAxj/WvLxZ7CTmv8UsdtsHmevqJCGa+sAzL8NPaggCfrtlJgUd2mt9MHipthNqiQADW1vAQbYPVDXIbbnkDSfAbhBxZgwhKxQX0iXqqwvYEIdY6Pecj/yqUGYYITLBEFcny9X0oWmAHC5FOeTRzidaTGKFVivLUvBO7UEMYJcUhD0hULWJcJ5PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 01:25:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 01:25:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 10:24:59 +0900
Message-Id: <DD7G0ERRKG3K.1AFE4FSLNBZCX@nvidia.com>
Subject: Re: [PATCH v5 0/9] Introduce bitfield and move register macro to
 rust/kernel/
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0161.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 3575ec51-a365-40e6-deb5-08de01528283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGFKMDhkcUhOZWMyeUp2T2w2YjByd3d6cWpJeW96dUYvSmNrMkVZV0NVZ0hK?=
 =?utf-8?B?VTBIWTI1MERMSFNSSStSTS9PdE1nWGdQdlFEcGtrbkEyTDVNNmlXWE1aSnQx?=
 =?utf-8?B?QmVIT3R4QnczZE5xSkdEOGtjQ3FxcHp0TFlkTUFYbW5yeHBsN2t3Yml3L2Vw?=
 =?utf-8?B?bEZlOTE1SGVUU2xKWStBMnNMd2IvKytQUzJZVVF3Tmc4dXgyZ3hPQjI4SWxK?=
 =?utf-8?B?d25ncGxPbUNqZTdXNjNPN3lPN2UrUVdqYmR6SENxRTlFb3E4a3NHbWVMVVkv?=
 =?utf-8?B?YmNOWWI2LzZZNkhPc041c0Y5d01pRUl5MEZuSnZraHFEV1JNRUFqSDZOQ0tz?=
 =?utf-8?B?MldwSC96ZXVlUE1jVXYzYTlYRkdLWEJ3MnhLU0F3Q2s2bWRMeTk2YXZDTzcz?=
 =?utf-8?B?aEVWaW5sUkRQSUtoY0h6TzNydnZhWTB3QWVLY1ArSW5VczVhVTVyd3lPMTZu?=
 =?utf-8?B?bkhPblpaSlJ3czdSTTQrYy9rWitMQWMyQ3pCYjFaOHhDVW9UTTFnRkl0dFdj?=
 =?utf-8?B?cVkyV2NEWU5iVFZZMG1WRHBpejUxbW5RS0Q4M1g5b0dVdkVEUHgxQU1neEV2?=
 =?utf-8?B?YnJMUFdiTHg0cloxejlUcitwL3pXODFiZnB1NHRkRzN5cVpiOFhFRVY3bzE4?=
 =?utf-8?B?SlNxMU96cjJnM0RnUS9QNmZvS2hoRjZPdi9NUjdhUkphLzVuVVlCanNrZjdG?=
 =?utf-8?B?VVhEMTZEbFU3MDNabDdicCtmVWJNa2JrYUpwK0c2WFVSVVB6UnRiUGlsSUt4?=
 =?utf-8?B?a2NRZlZmaUhQU2o2RE9sRUJmZk5lUHZ1aWhUNnBPVFAxMTdud0ZmTldlakJt?=
 =?utf-8?B?T004WTU0dE9kNkFJT1pqaThna3ZWKyt1WlB2L1hMaU9uNm5RL2Z6MXpMUmhm?=
 =?utf-8?B?WTJZREhpZFM5b1A0alIzR2pLY2dKdGsyTnN0ZzZMMFRFb1l4VTZiMEQ5S1RV?=
 =?utf-8?B?ZXRnbFczeXYrdmNUdldJWmxVM2J4QWFxdVAzcHp2TERDazFSK2w0bFIrSUtq?=
 =?utf-8?B?VUlnRm41aU1jaHZnZW5ranVKRTBKLzdVQ0E0MmZOdk9naWYvMWMwWmlDdWJm?=
 =?utf-8?B?N0xBdElNTlV3NTlQajRGN1BPaVM0OVdreS9nMkg1aFZoOGFBT2llWkpienVk?=
 =?utf-8?B?MTIrVVRuTEFncFFjUTMzb3Z5Tm40T1VpRWFRTVRNL1pXbDFhbGtlY0toU1U5?=
 =?utf-8?B?UFJESEJ4S3RIaE1PNmlnT1JPV1hheE5wZVAyMHNuRnRzcTdTSTllQ2JnOGhX?=
 =?utf-8?B?cEo5cTFaZEZMSEptczhRSmRzOFkrZ3hpMExiV2EwdVNyQTVCdVFOa3BYa1Vk?=
 =?utf-8?B?cHJDRGxpcUk2VmlNNUZUUUJKNUF1ZVNxV21TYi9YZko1VEVHcWZkdlhrc2t0?=
 =?utf-8?B?YmNMekJBSDNWSzdxc0x0OUxSbkFOZUxQVGVzai9PQ0F6Z1BlayswQjl6YXY2?=
 =?utf-8?B?TXZsQzhqWEx0S01mMFJQMjg5NXAyUVZ6bjB0S1N6aGJSNWxab1d6bVhxYmE3?=
 =?utf-8?B?T0JZWnpVVm8vRUlWV1dBVXdldDBmT1dIYVdMM2JqQmRhRDY2SVN6SnZWL25r?=
 =?utf-8?B?RUMyNzIzLytYc25PYjdOcWFJSWZTRys1bitxVGJFQmxnS1orZ0VRV2lob0JZ?=
 =?utf-8?B?anJoZ0JFZEoxWHRpL3IxQVBsNVZ3NUZMdzdTaGlyRmRjVGpYRlVkYksvdEpI?=
 =?utf-8?B?L3g0V1Z3QWtNa3c3Sm45NGZXS2ZST2toM0ZQNkpvU0t0M2d1ZERiUTYyMFRP?=
 =?utf-8?B?TXBQOVJDVmplTVFSMlFJU245TkZwd0d1OS84eEFlaVNmVVJTeTUrZ3BJbnNh?=
 =?utf-8?B?RGhic0pYQzd6SFhDSEFYY0VOYzI0V29ZSjNmOUEvNVFDZ1drZGpJQ1RiOTZz?=
 =?utf-8?B?NGFzM1NBUVJFZllXei9ONVlJUFYxMFZjZ1B4alF6dzNudkFsallJN3RpVmhk?=
 =?utf-8?Q?RvRxSOVztIhBq0Dc0KxnBSzRgxpYpWcv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW1jdEkvK1prUGNsc2U0SStJYUFxNzJIR05NTm9Ma1c0MERsb0pZZW9UaUpY?=
 =?utf-8?B?eGwzdHFkaUVOREtiYTFkN3lyTE9Xbkk0UkdzSmZjYVo5eTJURGM3OFMxY2hj?=
 =?utf-8?B?RCtNTENLYWVqTW1PSW5paWY2Wk5wL1VObmszaG1ocHAxQWJ1bXIzdU0yaVZJ?=
 =?utf-8?B?cFNNTDdMbkViMXJTcFM3Q3Y2ZDlQa282cTlEWDIrN0NpNW1GS3hQRjYvUFF3?=
 =?utf-8?B?WXpBTXNKemR6enFJdEJmRmp2eXlOSGxsQmU4a3M1SE9ySkFLNjZ4Tm16eS9Z?=
 =?utf-8?B?SDh3OTVCU05aRHRxZi8xc1REdFcvV0lzWlI4NzNjUHpHN2tqdmg5Ulo4Y3lW?=
 =?utf-8?B?QlIyaWp3NSthWnBac3VpSitHN01rbW4zS1VxTjAwRW10L01ZS0FjQjl0QVJC?=
 =?utf-8?B?VU4rejIxTy82TUFsVGxWOWJIcXpET0tjdDN2ZVI1OGZ2aG1KbTgwRkkvV05x?=
 =?utf-8?B?VmhDNC9XVVBKLzh6RXo5dlM3MzRaNHhiUWpSUUtidXg4cmxsaitsalF6clBR?=
 =?utf-8?B?ZmluSkdPd2pDYlA5TXJLb1NzVHYvZFRqQ0VESldGTmErNll6Zlc2WHgzU2JK?=
 =?utf-8?B?ZkFxVVRQNzR1WjVid2FHcGFzdzJDRHRXdHVqNHJQcmZlMWNmenlJQlFMTFFJ?=
 =?utf-8?B?RjBGeE82MU5iNTBlcjlaTk5XL0JFV21NYkdYSzdHaDdCOXc3Y2pjVGhGb0hC?=
 =?utf-8?B?MXF2RC91YmtSTDJEZjR2TzBXQUFwSlJ6UHJHL2QxRFQxbTlxV3FUaksvc0tB?=
 =?utf-8?B?T2FKTWtCejZUWWVSbmpCSU9aSERYM09KMWRHMFNtbE1DeHBWZHFXNFJ5Y1JX?=
 =?utf-8?B?dkJpYzJHWEVXNWZjT2R0M2Y0R29OTGN3RjREbkhBUGVYaVlLcStyaTdxcncz?=
 =?utf-8?B?TzZmdnpmOFVBOFU0Y3Rod0FyY0t1M3BkTTZBUVBlaFo5eFRLQXl1YzZVUFpF?=
 =?utf-8?B?eHBKOEhBOUtoejlvbW1PaFVWQmNock81alVRNDVmT01ERHh2aXliSU13NitU?=
 =?utf-8?B?OXAxWEVRZDZEMVk2SFR6MXJqODFTcjZwMi9QYmhGRXRvOHprQXZ0d2hYS3hP?=
 =?utf-8?B?cDI3Yk0rRVdESm9EakNjUXZJNzM0VDhSR2QxUVRCQTQya3UrYVFaaG5Ucncz?=
 =?utf-8?B?NVhVTzZ3d1I3N2RvSXpSTUtmb0d6K3d5Y2ZEcHJOL1RvUTY0eDFSNkN4dkV1?=
 =?utf-8?B?RzQ3SGJxdGRrMXhmWldWSHk2Rll1UkxnSUZhZ04rTENhcUx6M3hTSUVhR0Zy?=
 =?utf-8?B?bW1vYXVtN1J2U3lVUHhjcVZTeW9tSDViOUlMQjdRdmhnL21QcHFOT3Rib3FW?=
 =?utf-8?B?b2tXUFFPVU9KdEI5Q3lwQTFxY01pY0Y4T1FTOEp6TnRhZTF6S0FLTXJvdEpp?=
 =?utf-8?B?WmZITXhSN2hzayszTXU2TWg4UUZHNTM5dUQxekYvd0svaTAyekVWWXBEODRv?=
 =?utf-8?B?amk1MmZtY3ZCcktpMjNsa1FWS3dhbjRnblFtNW1JRWN5VHVpSkdKbUY3ZEw5?=
 =?utf-8?B?RHF5VVNobjlkcVdhckx1UFQzcEpxSDFKRmJvQ1hHeFI2RXNXdHNFRVc0TEdK?=
 =?utf-8?B?R2dSb20zQ2E5QWhQNTM1WDdJZ0g0b0gxMHIzRUR5RDJJZXU0WUI2WW5SbXNQ?=
 =?utf-8?B?aGtEb0ZkNDI4dk53WFRLNFdTNVg2QnN0aDVselFPbmlhZ0lhN2U0dVNPNVdu?=
 =?utf-8?B?NVV3Y2pjbGhubUhLeisrOW5XZEZKOGMvS3EzRlRuWmpyNFRtZUZtWTAzVG5E?=
 =?utf-8?B?TXFyeEh6eWlvdG9nbCtFNVJlb2xvZjkzaXlxRzF5bFpCUnl4L0ZEWCtIQkpw?=
 =?utf-8?B?TU0rWStzWUgxUDRxRXpVVjRvdWgwb0EzYnRzRG5Md0VYdGVQS29zRVlsdTRn?=
 =?utf-8?B?b05IZDl4QStKNTduSVc2UzdyS3FrTWJwc21GV0RmR2hPaGM1Y1lsZVl2a01M?=
 =?utf-8?B?SlZHcVpGaVhhWmk0OWFwcDRQbGdWT2JPMnZVQ1g3eE85TXVKQ095VGFCS0FG?=
 =?utf-8?B?UnFuWEJYTGh4bG8vTFQvOVhya0YzSWVqaTFmWWppT3BZemxYR1cvMUY3dlNw?=
 =?utf-8?B?ampSQ205Rlo2OVFYZDh3ZldGSXhBaTNsbmNMUGtnUFp3c2p2dllDVTJTRnBs?=
 =?utf-8?B?UUFtZURlb0w0TlRRNWM0V09KcktSMDh6bkxjZSs1cEdEenlMbDF2MFZrWmdS?=
 =?utf-8?Q?WJMir8xmk2Rgw65QW5TdGHDBHABgSDOHyybV1t3nXvgY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3575ec51-a365-40e6-deb5-08de01528283
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 01:25:02.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIwAtu91+nJvwUsehlWMt6M3WfGpB1An+/r3oqB8Au+lTZJxMLvZnSr6RR7wRUsYr5gteJoD/Dm7KmPwgkTlIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063
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

On Tue Sep 30, 2025 at 11:45 PM JST, Joel Fernandes wrote:
> Hello!
>
> These patches extract and enhance the bitfield support in the register ma=
cro in
> nova to define Rust structures with bitfields. It then moves out the bitf=
ield
> support into the kenrel crate and further enhances it. This is extremely =
useful
> as it allows clean Rust structure definitions without requiring explicit =
masks
> and shifts.

The extraction and move in themselves (patches 1-4 and maybe the KUNIT
one) look good to me. For the remainder, it will depend on whether the
BoundedInt idea sticks or not as it changes the design in a way that
makes most of these patches unneeded. In any case I think this can be
worked on after the split and extraction.

Patch 5 should probably be dropped as it has the potential to clear
register fields that are useful to the hardware but have no entry in the
`register!` definition, making read-update-write updates of registers
unpredictable.
