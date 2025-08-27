Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0908BB38AFD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3234310E8B7;
	Wed, 27 Aug 2025 20:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z6r/eh33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1448510E05B;
 Wed, 27 Aug 2025 20:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKJgX1HdVBDNL0Rx0ZMBHDsHUZjg6qqpzEnq6jC6mkhQpmeFQhLujVHM7ufoAAPsxBl0y+DXGmAWCzmFSMhCpGlnca8vj3j86LZzsaNeb62qQ06W+dDjoqYWlwFyODKiiI3WsU5Hz+nCh3M/RPJJO/ZgBpT5qftHPQZV0MVfLSjVtba0xFYs1ctLl14AeapWMRoxhxiV0+DAX+BdMggKlhrTkvV7Vg4Rg2C8QEamezQ3lPO1FcDWZh44SCMFJXf0D5coOhtA1B250YkJwpo3t9vY8H5zLrclnsHm4POBslGbVnDmdH9ARaiGGrA27CGhLoy52KSS4MB5Va2Xv+gdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGBSGicHbflGhsd3etAVsVuEYiddXi0FlEk3/ZxRfKs=;
 b=YyIlR+J6JEZZZMN5JWjtysI8dnXlkcX5UWq+P8arLF/+7z+5uvof1QwYjylKMAVhzIfXfBQOse1pPtU/H74Gy5R6HstQD3mszC6vCIuqwFlUJee1bg8Y5XTEzHkYnfzfioGnwBI0Os7nK+KhO3FsxZFno3uwpkASiF7GD5uwW0x0pcTvG4Y3/qIXXP5Xj5cmA3CcMjMnlRN3f8qokOueBtIJcL5hSex6OW++ZbZRnEFEk9EnlRndjIf+8jq7ytmNiEONMzd8kyx2urvTA0LdMJ2RDfn7y4MaHc6edGrE3ihryBg4e2zH4kJ2h4elRGuP2kSW+HpU/RVZWcAH3F8XIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGBSGicHbflGhsd3etAVsVuEYiddXi0FlEk3/ZxRfKs=;
 b=Z6r/eh33w8RJOV0GFR+302lZXLRM8aZZ+qyCD8iCtmWJHS5fWNdju1YzadILyEfDk2JcIO2McDLec8/0HEwMe1JTEoVdvn8RGC++Pu3UV8B8hZcrQOtzVpuBFWNC1lIbnxRuqvBvRJsF92x/+cIoFdJx1BisJRg/Q4CGqJwMCc2v5DXL9vzOOYYFEWDTnM1WnoCrgIm1fhdJ3/2Hvy3NdBUu1RECwGUxMZy8iWUye6XftFKX5795BimwwM9Fp0fr2F+02jO85CF679lPeRJH7RHPLSbpJ9kepzgg3D2nOl+yhgF1yDQmkrsJH7GOSJ+2C/TrtZEc09ScRGih7k6/ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 20:35:19 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 20:35:18 +0000
Message-ID: <b95522a8-3d92-47dd-a130-b0a85ea841e9@nvidia.com>
Date: Wed, 27 Aug 2025 13:35:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] gpu: nova-core: gsp: Add GSP command queue handling
To: Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-6-apopple@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250827082015.959430-6-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: fc285a2d-1252-4139-75e6-08dde5a93c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzcybVRYSXBublNVUVdSem1XU25OSzVCTHF5ellFMVE3a2dPdmxiSkRTTXVj?=
 =?utf-8?B?MFI0UThsSGY1eFJMK3RFbTJxTUFDZjdPNHZDSkdTNWp0cjlYOUJrZkRRZXI1?=
 =?utf-8?B?RHlQVXNKNlJFam0yeHJ1emo1SmJrcnVvVUw5NjlDZWsyaHJmN3NKYlA1TS9J?=
 =?utf-8?B?YXVPNFJIOEtEQUlNWTI4TjJUa0E4cFQwQWh0QW4xNUVzOWVzRjRhOFZwTU5D?=
 =?utf-8?B?UGhPZkszWjkvZWxoeTN2Z0t0TlpZOFpIaXcvNThqLzJjNXdlWmRnMDJiY2dG?=
 =?utf-8?B?S3M5TGZDT2tLRk1UQW4yNnU4a1FhY2FOSEJnTzZ1QW5XTjN5MVBrV2J5bTFS?=
 =?utf-8?B?VkhkSzZmbjFTdHQrcDdmN0sydzZJMmRmcXM4d1BDaCs2Z3JnaEZLdGdvZHlS?=
 =?utf-8?B?eU5STXJqZ3RZRVMyNVl0eEEyZkhRbTd1UnpzWVV4b2kwNFZ4blE2WVJjdmVW?=
 =?utf-8?B?ZjVIYnBXSXpPbWxHaEpRdGVqR3dLOVowc2RSalhqRXVmWEZ6V21RaEgrbVZT?=
 =?utf-8?B?S3NNa1RJZGhWL0dzRHpwVXFsOTRLTmFZZjhYSTFWRVFNMWtxVDU4N0FjRlZG?=
 =?utf-8?B?bjZvK3daYm9GbFhLOENpMVRmcHczRXA4VXB6ajZZbDQreWRabGdQY0FwSHR5?=
 =?utf-8?B?dmtWTWQvRVcxallJbk5HWVRaSlF4VXhINUZ4UmxMcHRjV0lKRFNuczFZSnZw?=
 =?utf-8?B?V1NtaThuYjcxdmtnYnFSbk5XaHQrVnBqbGxkZFcveGNpUnRrYUFsZzMyNVFH?=
 =?utf-8?B?WmdBZTV5ZWZ6c2xKRit2bGUrNVlKWVk2OGdVZVFpTERENW8xS0xHM1NUbE9I?=
 =?utf-8?B?NXg5azU3YWJiMkNpUjJNQzM2cE5HWnJaK2w4SWZXamNYZ2ZWb0VWbDBKZlJv?=
 =?utf-8?B?cmpDOE1kSUZuYzQyU090NzA2MVVHR2RKQW5BVDI2WmpIR04velNFcmdWcG5i?=
 =?utf-8?B?Tnd3ZUVRY1ZMeWx3U1hCUS8va0ozZTFRdmlhang5emVCL3ZxeEcyODMzWDN1?=
 =?utf-8?B?Nm5MOXkyVzRCbEpONnNXU24rbW1LSlpRaTQ1SmszK2VFek0zenJSTk5pMktW?=
 =?utf-8?B?bHJTa256cW9lNWxlamtmSGp5OVJUOXozMU84RGgyd3QwVWd6WE1ZM2NtbzU2?=
 =?utf-8?B?Qm91L2ozVHRFY2hYaDFtMHl0MHU5YlQyNm5SczBJL3NtSWthb3RNNFpSeit1?=
 =?utf-8?B?b05NQlo0RUZibm1GVDZGcGxQaDZ3VWNVNFVXMTJnOWJsK2dtRHp5WE1YSFpJ?=
 =?utf-8?B?MzRsYkxmbFJrRFd1MVJGT2UwamdiWkVnY0VTQVQwQnBDc2NxaUIrWHN4SXlj?=
 =?utf-8?B?VEtSMVUxQlpwVU4vanBLNEUxMkp3ai9lWSsza2kwdHg0ZzBlc3oyWVQvVjFU?=
 =?utf-8?B?dVF1dXdqNkZaNzJnYmVTOGhrak40L3dabzNlSG9KUWo1UDVMM3AwajhtQUJy?=
 =?utf-8?B?SmF6NW1vbTFrallmS0h1VFdtcnkrMFVkYW5FaTNhbmIyOTNTSWxjRW10WGJ3?=
 =?utf-8?B?ZXVzRUR3RlVVYjJzT2w3WGdKakNhMjZFQm15QnNvZXd5MVFFVlVhY2xndVpB?=
 =?utf-8?B?YVFad1c0aC9FTm5TUHUzbStxalgrWU15WGdGMDRmOXpuYkdJSlpHSVlWcXdQ?=
 =?utf-8?B?TEl0VlBuU29UdWZHc2F0YUg0YXp4MjFuNGdicFVrZm12eW51UnhkYUd4V1h1?=
 =?utf-8?B?MGpzTlFjelp5bmExVFh2dk5rZFdQUmJGRkhVTEM3cDBTNUVaTnp3alJGQTNI?=
 =?utf-8?B?eGNtbk54bDFVSzFNMGNtemNUbHAyK0R5ZXJVTXB2elMxT29XWUVPdmltY1FP?=
 =?utf-8?B?KzVST04vOVdqT1dVM3NZV1pHbjN1ZHR6MXd0a3V3T21WdmdPdFZwSW51MGVZ?=
 =?utf-8?B?ZUo2TkluQVBpMXA5Y05lMHpOeU5aS2lvV256SkU3UThyL0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9NV0NrTzB2UmQ1N243Y3BKY3pUVmpyMHlMRnJ3V21hdmdCWnczOVFOL0lh?=
 =?utf-8?B?Y0krT2V3cTNpdHpQMEk1QjhiOXhjSS9TZXR6WmYyT2FpTVExN0xrWGI0b3ZL?=
 =?utf-8?B?T3h1SUl4UWpNZXB2bzVDdmJXakdqbkhQenY4NGZQY0g5VDVOZDZQUXZnNGk5?=
 =?utf-8?B?bmVjYkhWbHZSR0k5aWtKc05ZQ1NLRjZrV0liRUw4d0NtTjFjZnZkb0ZKY25N?=
 =?utf-8?B?OXNBUzJhaUY1WEU1UUc2ai9Hd25SVlpJRExXNndhdFlEei9XWHFzUEYxQXY2?=
 =?utf-8?B?bnNoOTB6RENodWtLaEVmc0tXR2p4U0orWDQyWkw5RlNtOWZxMndnV1BTTCtZ?=
 =?utf-8?B?clF2cDdSRThDRE03d3IyVUpDc2RyUHR4b2FvejdKd2l3alBZWlhPWmJOYVB4?=
 =?utf-8?B?b2MzYXJZaGkxWm9YbTdKMENNUThoeXJ5K3o3WTBlYWxBWGlabTQwV3JXbUZy?=
 =?utf-8?B?RmdKMklBcStiaGg3N09BczZZTmhRQmtPZGlVdzFyME91bEM0d2pNemUyV2gv?=
 =?utf-8?B?cnRQM2xhNDFGSnY0OEtTQU5WazM4Z3V1c29XMWxBZHN0Q0sycThEZFkzRHJ2?=
 =?utf-8?B?SEhva0ZyS1pBMDYwODNOeDVJaVlOT2p1NjNtUGlpT056LzlINkV1dEMvWHBi?=
 =?utf-8?B?QVM2RENWMzZtd3BOdkRwQmlCVm83d0Y5OVJLWmdGZVZ5OElKN2V3QW1hL3Ji?=
 =?utf-8?B?Y1pxTjAvTGlsWC9EQmgyL21XRTlKV3UxMjFzdG8xZWp4aHpxUXdsKzVGSi9W?=
 =?utf-8?B?VkZ1ZWprQUFaWTU2T0NMYklwMEpFVzFOcHRZNGs4WU5mSnR6Z2RBNFRwZld5?=
 =?utf-8?B?R1V6VC9TNGgvWm1uYnRjdUtQSmlPNkNLcGFNMzQxdjBzYmF0RXZ0OFowTUFT?=
 =?utf-8?B?UjFKeUlURFRKZkVlRWtCaVE3cE1oZy90dW1iN1hyeWNOcGdSQSt5VXNsOEI2?=
 =?utf-8?B?M01zV2ltWG1IcWlIRi9pQm1Nc2JSZVBDR1lQKy9vTm1OclVhc0hpY2lJemxK?=
 =?utf-8?B?KzZkbDd4M1VtM1B1cDE1dEMzZFR0YmwrMlg3Q0dkeVhUQ29kbW0rbVlLKzJR?=
 =?utf-8?B?ZnpqdmV1Y1R4UEhveURVYnFrelp5Zk1HUWxYejZIMHpOVDVsUGlzdS9pMFg3?=
 =?utf-8?B?cWJvblBkWlV2aGoyS0dOa1EzbVhyNTNwaS9sQjN6WitIZ0UvK0JVVHF5N29J?=
 =?utf-8?B?bTEzU2JwWDBlRUVDWlJHdi83bjU5SzAzTC95djN1MGFrM2p4KzhzbU9yZm5y?=
 =?utf-8?B?YmtBbGh1MnBQdHBHaEZyMGJZSGJVRmtSeElKMjJIVGpZekJkN09zbVdreWxi?=
 =?utf-8?B?elVtWkxUYkJXYlUzblNXcmdrdk1vSEJZOGlvZFJBSXNUVUZJOTFUM2RvS01r?=
 =?utf-8?B?ZlJ0VEVkQlZJbFhZSGpLTUg2Q25YQWtxN0ptczJDcFVxRVArWHB2RU9nRkFY?=
 =?utf-8?B?V2NsOTNRZE1zUjBZV1JVUkNHK3JDdjVxdk1SQ1c4cGVQcDlhVDdqR0JKRU1r?=
 =?utf-8?B?QzBtV3dNdm5mbW8xVVlNWnZUQVFDdW5ueEpBQlhCTnZKZGhQcm93SThhOHBv?=
 =?utf-8?B?NHNuR1ZJcHRqQWs1eDI3K25VUTJFYmlLSi94eld4eS9NTkQ1dEEvUUdJVlMx?=
 =?utf-8?B?TWZUTTExL0Y1TXhkZjN1WlBTZ2Rob05HOXYzNTBDQlp4VXA4dnFlZXhnZEc5?=
 =?utf-8?B?V3FNRkhSQlhod3pkcXg5TUZNK25NejhxRkFTVEx1VGZ1NzkxVjhxZ0VZaXo2?=
 =?utf-8?B?aUM3T0F3Z256RE92TUQ2ZGlYZUJzVVROZ0xqWmEzOTdaT0ZuV3ZYcXZKSjNn?=
 =?utf-8?B?SkVkS0RaV3dza243bXA0N0U5RlU1dnNGaFdpOEdtSHZBTDBhUXpoNjArL3B6?=
 =?utf-8?B?UkhYMVFlaEdzM3hhSTZwbDdtU25VUFkyZityU01NNjg4WlE2RDNSeUdNNXB2?=
 =?utf-8?B?U2I2bWhaK3lLUE1sWTRteHEyQzJlL0RhNit5K3pOVHFrb3VBMlRTdWlPTnpM?=
 =?utf-8?B?NGt6MkZSSHJ5S0dVemdvUTQ2SzhURnd0UE9qRkdsVU9CY0VmZFlQZVl1YW9R?=
 =?utf-8?B?czZSWG9PbUlTY2NkK2ZjdlMzSnZ3MG5KTGhMUDNmeFVpZkdRejlsQUlkWXZh?=
 =?utf-8?Q?kwKmfVNlw7+4DbqOvb17XC0Nm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc285a2d-1252-4139-75e6-08dde5a93c6e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:35:18.4930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYO5ZPnFMcP+C7mcivGcViQQ9E0vWDO/ENedEjyOGGzg+kkejzWtlqI0qaHciYJcFnSY2Uf0tttsqxy3KVpEWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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

On 8/27/25 1:20 AM, Alistair Popple wrote:
...

Hi Alistair,

Not a real review yet, but one thing I noticed on a quick first pass:

> +    pub(crate) fn send_cmd_to_gsp(cmd: GspQueueCommand<'_>, bar: &Bar0) -> Result {
> +        // Find the start of the message. We could also re-read the HW pointer.
> +        // SAFETY: The command was previously allocated and initialised on the
> +        // queue and is therefore not-NULL and aligned.
> +        let slice_1: &[u8] = unsafe {
> +            core::slice::from_raw_parts(
> +                ptr::from_ref(cmd.msg_header).cast::<u8>(),
> +                size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>() + cmd.slice_1.len(),
> +            )
> +        };
> +
> +        dev_info!(
> +            &cmd.cmdq.dev,
> +            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> +            cmd.cmdq.seq - 1,
> +            cmd.rpc_header.function,
> +            decode_gsp_function(cmd.rpc_header.function),
> +            cmd.rpc_header.length,
> +        );

Let's please make this (and the corresponding receive) a dev_dbg!().
Otherwise the driver is too chatty at INFO log levels.

I suspect that I'm to blame here, because I recall pretty-ing up the
output of these, and I probably set dev_info!() at the same time. doh!

...
> +        // Log RPC receive with message type decoding
> +        dev_info!(
> +            self.dev,
> +            "GSP RPC: receive: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> +            rpc_header.sequence,
> +            rpc_header.function,
> +            decode_gsp_function(rpc_header.function),
> +            rpc_header.length,
> +        );

Here also: please use dev_dbg!() for this one.


thanks,
-- 
John Hubbard

