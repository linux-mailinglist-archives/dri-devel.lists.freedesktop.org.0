Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0361BDC1D0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 04:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261D110E6CF;
	Wed, 15 Oct 2025 02:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SeTmi9Un";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FDF10E6CA;
 Wed, 15 Oct 2025 02:09:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4NccOo1fiLwlfyiajyukt9Zw86CD8KkRbe/DBSkVfRZNSa8v4KEhZPHGII5ZXpFSzAQUkrMM9igfqQmxw//J0kgJ9mlCUTOa6WofNmwFDnJhCmoGWerVgeBrozI9xCV5Yp8EIJvDU7o5Ha1UtYpDjD0UkWE/pvRaBI5ZEuzdzbkxbIigS3HMOwJxrSKGWB1MJpeHRahuy44gQj/zFP4wREC/vPwb0R1jH3bB8hZB+if44UEx6vLQOBkbmk0b/IzIZOyFY6sBSEuoS/qZncdLVoa0Xt09Wc+PrbswP6fadKgqAlRKsmrF1KU/CiFbqswh4DcgYJgecIaBAwSUVTJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE1C5vLqETcsaUuiwgwgcxjOC1AsUcvitrthm+m/rrU=;
 b=gM8AldzBRsO2RM5KMKAUXCQXQAFGIxPfswivdqwiVXdSTdwYbS2xbYR7cGEqutAfRYIPjwqiixZoBjpFQkqxhcb5e+/pjkgE64Ltjq9Y8ALZcE9h4j6fGxkRZAQXV9R5KrvedFq3MxYYeoLxx09gEXIJuN2OxZeb0jt90sZ9yzLXKsjYQQgBouZL119XVq/TIPPFdTpxjY4HBxhSi3S3jAvjLI9prrDRLiJUjUsFImeenqY9mNeG0Ut7h7SVhoGzW8UhXy4a0ax6HP83eeFSejibaMHWFDVllGcSf+eDTznj71IpOtvN/O2zxo+JfOTgUgcE/Dqnar2Fv12zvAfRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE1C5vLqETcsaUuiwgwgcxjOC1AsUcvitrthm+m/rrU=;
 b=SeTmi9UngkFp3lA+hPPOK0oDJ+aCpkUaGCCY0z3CrrDwAm3+5IBdYgdYh3ykX3RRl29GaHhHR1irvqlkPYzQ/utgXxX5u1NifwKNQ12BB6BM7r0tj4Ndmdr2tnGL66mkr+ZSSqT19vzztgnvDvlDewjjQjZxtwdEHcHvO9QaqdCs6KEq4k7Xxe43VXhFe8r3Nbw2ySXuJa5zSNw5snmrTtJMnFQJ75HdUNjm95VKetG4xAus3gmt0FbJb36XGths53B4J4uLnoxwh9Ga79jt/Joqt8s9aYVwz0vuvLdjjTJ4nF3MuNyhlnf9zyPgqDDfyIp7/vkg//dfFbwl6dQJCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 02:09:42 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 02:09:42 +0000
Message-ID: <9da480a7-f8ff-4b58-b474-378485762c7c@nvidia.com>
Date: Tue, 14 Oct 2025 19:08:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] nova-core: mm: Add initial structures for page table
 management
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20251006210956.3232421-1-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251006210956.3232421-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::25) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 566954b6-6956-4969-42d3-08de0b8fe732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk1DbE13V0xPWkZWN3kzRmRDZGxKaDNubGNzbFRhOENhazNjRlBjMXdNakhi?=
 =?utf-8?B?eWFGMUI4K2hoekNjUU9YcHBQSzdJMys5Vzl1c1UxYXYxTklWaktUcWV1SStq?=
 =?utf-8?B?VEZJaWpYTUZFVTQvMWg1aTlnQXQ5cmJXb2Nyam1CdC8xcUpxcnUzbWJIOXRu?=
 =?utf-8?B?Y1hqeG5La2JzVzRmbFZsaGhZZEp1eFJsZGZZRGFpRmhpWWowbWxKdjdjbEtm?=
 =?utf-8?B?RWgrWkFQTzc1NElNWm1ERG1ZeEQ4RkdmSWFyUVBZMVpDQWVzWWdrM1BDVEJn?=
 =?utf-8?B?NGxuZ1pzSzJLWld2WFZJT2FraVdpRkdUUXNEcWVOT09sbWduUCtWVkgvMjlv?=
 =?utf-8?B?emFOSmNuQ1hPT1prampBcDFhLzh3dzZDSzVWT2Z0U1VTc3ZveVkrZW1YTHQv?=
 =?utf-8?B?N3JKQ1lSTUlBMzFwT21aZE5PUTVsaG5JblNJc1h3OExLQnZaV1JOVFdpYWNH?=
 =?utf-8?B?U2huWkZjN1ZHV0M3ejQrb3pkSkFVWFdaZXpZWlZCZ3RlRE5lT0FPVWJ2WDMz?=
 =?utf-8?B?bmM0WDdVRVpCWHdJZUdmTkdqY2dySFdqTUZsYmhTMW1JS2ZwSUpwYVVodTR4?=
 =?utf-8?B?Qk9rV1dPKzJvTDZmT3lQWmJIZWpSUFVPSmJCM3N0cjNMWHErK0dzWTNhWEYx?=
 =?utf-8?B?dG5ma1BEKytjSmlLdENPTUQwdUc3ZjRHV0hwWGFKTS9kbGpFSitJeitMcmVK?=
 =?utf-8?B?SnRSWmlqU0FNeHh3VTFVNnkvV3JXcEppc1hXNk5iUWFmSStmclE3eXlld1gv?=
 =?utf-8?B?WmlXQk5KakJyWkMyZk1UZ0NrUlAySTY4V1VVRGovc2RnMUMwNHpUUXFzUUxB?=
 =?utf-8?B?QlBSeHFzeFJ6YlErNEhPNlRsWTMvdXdONi9uRnZ4RHhxcjkzaExmdUFaWlpl?=
 =?utf-8?B?dnJJRmtRQ0VCVkhubFRNem44NFM4QW00YkI5VHdiSHRwNlVvS0x6Tm9EcmNH?=
 =?utf-8?B?TUlkSVBiaG9IOHdxMWlLYWY1MElqOWFlQ0prY0VXWno1bnlpZHhNRWtEMmtI?=
 =?utf-8?B?RTJXT05xb0t5WU5mRTVWa2RnSFg4QStyNXRGSzhNSXdON2xKbXF2TysxdmYr?=
 =?utf-8?B?YWJaam5PdFlLRGVPdXZiOXpKZVVjeW9vbTYxRmhHb0d5bDZsQkVoU0gzQVJo?=
 =?utf-8?B?NWxFS0pSSEhiRUxxY1ZVbmo2TWxMNmV5bGl0dWppV04vZGdyYkhsdVJpZ25S?=
 =?utf-8?B?UGtEWWFrR2RMVjdFUTNmVTg4NHFVZlZDSGN1WHdlWFRiQi9QeWhVLzJwdUtp?=
 =?utf-8?B?TEdZOU9yUm5KUDV0eGhJZG1pRE5JaEg1MjFnRXpuT2N1R25rSHJvRW1FMURH?=
 =?utf-8?B?QmdoM3BtbnNPQ0FxMkEyS2FFUHFRNkVDQkkwMWVURXVkNVU1MDFSUDhnSVBM?=
 =?utf-8?B?S2tzVVJDUC8vU2p4Sm5Ob3gvRFRXcHhhTW5wNmdhclY1ZzVzMTg1dW85YTY0?=
 =?utf-8?B?WkxuYmFUQ3BnSXJoajZPc1JKcWgzYVo0MGR1NDZnRmhPbGhuK3RzQkptaW14?=
 =?utf-8?B?TDVnY2FOM0lsTFBaNVgrK1pPMWRKVTVTNW1lZUxvTm5Jc2IwekZXNzkyYjBB?=
 =?utf-8?B?RENVQ0MvU3N6ZklyeWF1YmxEelV0Q1lkMk95Rk9US01iUHQ2YjYrSjA0Qk8r?=
 =?utf-8?B?dzNVVytRWityVlpoYWJnbmRiaENVbGs1OFh0Y3JSOHhSTzZLQlA2YWdtSFlj?=
 =?utf-8?B?SVplNEFxRnIrVStKNllmaTgxbVY1QWVZVjFyaFRNSjhjL1IrZnZQY0RvWVA3?=
 =?utf-8?B?UEduMlhnMmhYOTd4dzNmdDVoaVJ3Ynd2cWRFTUliUHFUTXB2blRyN2o1dnFW?=
 =?utf-8?B?UTcrT2grWkRuMDRkUDJLeWJ4RFB4Tk1vT3hxRkxpZzg1QmNtUkJHeDQ5Q0dz?=
 =?utf-8?B?UlVQcEQ4aDZVeXNKb0JOUkN1b3JCUmxLWSs0RHpVQ0FwQWF2d25mZFhhZTZv?=
 =?utf-8?Q?X5WC8zuWU57DPANWCLU3nHyopHMMKHH/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjB0ZzlKZEdxbUxYdWZPbGRyV0RFTWJDTnJON0lRYTBtNzZxSk45alpNUUVR?=
 =?utf-8?B?aitkYWF4NHZVMHBxZ2xjR0VLaHF6cmdEYVU0OUFpYVo5Mm1PMXRqME1rd2Fn?=
 =?utf-8?B?bkMyVHN2aVRsS2p3cXVKZkdPazhCRFhKMXVyamJ0VXBoRGpOaHNTRGh0S0Zi?=
 =?utf-8?B?K2F1RTBmTG80dUprR2lyNVNkbkxUK2hQOWNDMXkzSEVML3MvOUt2cWE5Y3NL?=
 =?utf-8?B?STQxYnJCdURZMFdsa2RaY2dHaUFlamtzQU9ZeXdJc2svY05OeUtsNFlVZnVQ?=
 =?utf-8?B?cVRtYVo2SXRPS2IzY2FPZWF2eEFycHVjS1ZNZDM2WUlSTGNtTnhwYVh2anIz?=
 =?utf-8?B?QVUvOXRHU1UxOExLME5BOHFXYXN4eXpHb09YK25Rb2RBUktyaG1hc1ZuUm9P?=
 =?utf-8?B?NEF0WGFScGdQZzYrUlgvTGh4a1A5Q21vYUQxM0sxdUN1MTJNOEt4ZncyRnBE?=
 =?utf-8?B?QXU0Z0lRelFOUEJ0MXZIamdWRlJoMklrOU5HQ0FsNzdrcGptaWU0c0Z5SG92?=
 =?utf-8?B?YzBNQWZ4S2xBaGkyTVQ4ZXhqT2c4VHRScmRtcUlMbjkvaXdIN2Vza0ZhZVE4?=
 =?utf-8?B?N1RlNHlBTFptRmt0cjFwRFN4UFRzYWNuQitGTm5QUUpKcG9BdnZCc2FtVFZm?=
 =?utf-8?B?NDZxSUZRN1N3WkhNaXVtKzIwZG0yTk5lQlFTbUNFdzNVUjJvSHFXREk0SUgz?=
 =?utf-8?B?U2t2alc4N0dRYUNhdHZpSW9SejlKSHZGVXdHSjJ1d1FDamdCQUFsQkYvcHkx?=
 =?utf-8?B?YzJWSE5VdlFQbGZ4ZDdhWFdXb2lvRmg2bXRSSEtnWXJHZm9XaHZtZFVLRmo0?=
 =?utf-8?B?bFlUcUpQdmpHK2lTUnpPeGw4aE5vdmdmY1BWVW01NStWUXg1US91dy9XSUtG?=
 =?utf-8?B?bnVBUXNvWFpSeDJ6NGh0cWJFbFlmZmxaOUFxWWE2dlF3dmNSd1BHUUh5aFRK?=
 =?utf-8?B?ZWY0YnhlOGlRU0xmcEhvckNkWjJXTFBNQ2dzWHl3dUJ5Rk8xZStFSUJLTTV4?=
 =?utf-8?B?TkQwdDhKdnIrY29lRzNGL2N3NXRuNStNK2F3bXhHZ1JnblB4WDdUcGg1MGRm?=
 =?utf-8?B?cGVwZHo2d1Y5cStDanVUODNvcDQwNEk3cHlYeWxQUFp3RjhBVmx5bVI0S1FB?=
 =?utf-8?B?dmxkYVNHd3owRmNBSjdsR3hjTmlKWisxY2hTUDE5M09LaFdETjBNOGRtOXJl?=
 =?utf-8?B?ZEN1cmtxYlRzL1hKejlwcnBUY3dOclBtekRQM1d3b3U2M3BDWXYxRXJLamNv?=
 =?utf-8?B?aUltZWFoVHJQbmgyNElrS0Z5L1V5RHRybHVuMU1wbmdqTzQxZmcxNy9aUXlJ?=
 =?utf-8?B?c25STUlFWFVMaXRFODduRFRZZGZSb3VHczhlVU52MVpPTi9PU1VxcVR1K0d0?=
 =?utf-8?B?QWEza20wbGRDREVuVERTNEl0N3Y1am93T2FMUnkrYXJhOVhUdGV6QmFhWE1H?=
 =?utf-8?B?QWRzZ2JPcFB1b3pLOFcwOGhlOGNBWUFiRU04VS9jeFNXMUVWZ0ZiNXk2TU5X?=
 =?utf-8?B?Z2U0bVBsZXdCSk9zQnY5aGlFMzFzZWhaamtuc29GSk9WTWdIc2N1UHRiZVJy?=
 =?utf-8?B?RkZmVTI1UG0zeEFzRzUwOHRzemVicDRjWHlpdFU3NkZveEdCeWloamFzcHVT?=
 =?utf-8?B?d2k4TnF5ektNUERvT3lGYzc5R0wybVY4dzVncDVDQTZjSklYS0o0cng2dFFK?=
 =?utf-8?B?YmxwTExDREZhb0h2N0lnaUFzL1Ixak9IUWxYQVVvNzdnMXpyb3NBKytGaHVQ?=
 =?utf-8?B?Mk81Z1J6RzlvYVJycnJBcnZqNzd0QnorVlNRYmRMUCtrZHpwa21OY3dxTEk0?=
 =?utf-8?B?NjVoTmxEODlpREVaY0N5WnBKRWdobmpOeGNML3ExNmtUSU40RWFzcVNOaWRT?=
 =?utf-8?B?RlJ0a2FBTzRWUlI3Zmh5Nm9WRVpUaWVFWUpXY1pMSTNoVkozMVZSSCtxTEVy?=
 =?utf-8?B?QWV0WEQzeE9xWHdPL3p5UVF1S2U4cDlaK05nS2hiT2V4L3daZWZJbjVISkV0?=
 =?utf-8?B?eUFDdWdlcWpjOEpGQ3VzQTI4UDFsOFNvVHJwQ2lGbFJVZzEyb2MzT2JnRmxJ?=
 =?utf-8?B?N2Q5QVVCc3laSjVXNTROM0Z6bE45bFhBL0djcGNURUtzREl5UE9SMVcwcUtu?=
 =?utf-8?Q?cnf6NUNBqRgNoTX26u8Hz0nli?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566954b6-6956-4969-42d3-08de0b8fe732
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:09:42.1898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q84RdBtkrDWF3i8yA9GzQdXqMkE6mDiQc/QBg3ZPWIyAyLSZDg4Py/aHxyP7f1DDKOdrjCXdABx/n85p6m+NQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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

On 10/6/25 2:09 PM, Joel Fernandes wrote:
> Add initial structures and helpers for page table management. Will
> expand and build on this in later patches. Uses bitstruct for clean
> code.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
> Rebased on rust-drm-next + bitfield patches [1].
> 
> [1] https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.com/
> 
>  drivers/gpu/nova-core/falcon/gsp.rs |   2 +-
>  drivers/gpu/nova-core/mm/mod.rs     |   3 +
>  drivers/gpu/nova-core/mm/types.rs   | 382 ++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs  |   1 +
>  4 files changed, 387 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/nova-core/mm/mod.rs
>  create mode 100644 drivers/gpu/nova-core/mm/types.rs
> 

Hi Joel,

This will be easier to provide a meaningful review for, once there are
some callers to look at. Structures alone are very difficult to review,
in the absence of behaviors (callers).


thanks,
John Hubbard

> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
> index cd4960e997c8..839c803001b5 100644
> --- a/drivers/gpu/nova-core/falcon/gsp.rs
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -5,7 +5,7 @@
>  use crate::{
>      driver::Bar0,
>      falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
> -    regs::self,
> +    regs,
>  };
>  
>  /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
> diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
> new file mode 100644
> index 000000000000..4cebfa3cf184
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/mod.rs
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +pub(crate) mod types;
> diff --git a/drivers/gpu/nova-core/mm/types.rs b/drivers/gpu/nova-core/mm/types.rs
> new file mode 100644
> index 000000000000..6eca8bcb24a6
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/types.rs
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//! Page table data management for NVIDIA GPUs
> +
> +#![expect(dead_code)]
> +
> +use kernel::bitfield;
> +
> +/// Memory size constants
> +pub(crate) const KB: usize = 1024;
> +pub(crate) const MB: usize = KB * 1024;
> +
> +/// Page size: 4 KiB
> +pub(crate) const PAGE_SIZE: usize = 4 * KB;
> +
> +/// Page Table Level hierarchy
> +#[derive(Debug, Clone, Copy, PartialEq)]
> +pub(crate) enum PageTableLevel {
> +    Pdb, // Level 0 - Page Directory Base
> +    L1,  // Level 1
> +    L2,  // Level 2
> +    L3,  // Level 3 - Dual PDE (128-bit entries)
> +    L4,  // Level 4 - PTEs
> +}
> +
> +impl PageTableLevel {
> +    /// Get the entry size for this level
> +    pub(crate) fn entry_size(&self) -> usize {
> +        match self {
> +            Self::L3 => 16, // 128-bit dual PDE
> +            _ => 8,         // 64-bit PDE/PTE
> +        }
> +    }
> +
> +    /// PDE levels constant array for iteration
> +    const PDE_LEVELS: [PageTableLevel; 4] = [
> +        PageTableLevel::Pdb,
> +        PageTableLevel::L1,
> +        PageTableLevel::L2,
> +        PageTableLevel::L3,
> +    ];
> +
> +    /// Get iterator over PDE levels
> +    pub(crate) fn pde_levels() -> impl Iterator<Item = PageTableLevel> {
> +        Self::PDE_LEVELS.into_iter()
> +    }
> +}
> +
> +/// Memory aperture for Page Directory Entries (PDEs)
> +#[repr(u8)]
> +#[derive(Debug, Clone, Copy, PartialEq, Default)]
> +pub(crate) enum AperturePde {
> +    #[default]
> +    Invalid = 0,
> +    VideoMemory = 1,
> +    SystemCoherent = 2,
> +    SystemNonCoherent = 3,
> +}
> +
> +impl From<u8> for AperturePde {
> +    fn from(val: u8) -> Self {
> +        match val {
> +            1 => Self::VideoMemory,
> +            2 => Self::SystemCoherent,
> +            3 => Self::SystemNonCoherent,
> +            _ => Self::Invalid,
> +        }
> +    }
> +}
> +
> +impl From<AperturePde> for u8 {
> +    fn from(val: AperturePde) -> Self {
> +        val as u8
> +    }
> +}
> +
> +impl From<AperturePde> for u64 {
> +    fn from(val: AperturePde) -> Self {
> +        val as u64
> +    }
> +}
> +
> +/// Memory aperture for Page Table Entries (PTEs)
> +#[repr(u8)]
> +#[derive(Debug, Clone, Copy, PartialEq, Default)]
> +pub(crate) enum AperturePte {
> +    #[default]
> +    VideoMemory = 0,
> +    PeerVideoMemory = 1,
> +    SystemCoherent = 2,
> +    SystemNonCoherent = 3,
> +}
> +
> +impl From<u8> for AperturePte {
> +    fn from(val: u8) -> Self {
> +        match val {
> +            0 => Self::VideoMemory,
> +            1 => Self::PeerVideoMemory,
> +            2 => Self::SystemCoherent,
> +            3 => Self::SystemNonCoherent,
> +            _ => Self::VideoMemory,
> +        }
> +    }
> +}
> +
> +impl From<AperturePte> for u8 {
> +    fn from(val: AperturePte) -> Self {
> +        val as u8
> +    }
> +}
> +
> +impl From<AperturePte> for u64 {
> +    fn from(val: AperturePte) -> Self {
> +        val as u64
> +    }
> +}
> +
> +/// Common trait for address types
> +pub(crate) trait Address {
> +    /// Get raw u64 value
> +    fn raw(&self) -> u64;
> +
> +    /// Get the frame number (upper 52 bits)
> +    fn frame_number(&self) -> u64 {
> +        self.raw() >> 12
> +    }
> +
> +    /// Get the offset within the frame (lower 12 bits)
> +    fn frame_offset(&self) -> u16 {
> +        (self.raw() & 0xFFF) as u16
> +    }
> +
> +    /// Convert to usize
> +    fn to_usize(&self) -> usize {
> +        self.raw() as usize
> +    }
> +}
> +
> +// VRAM address representation - used with Pfn for GPU video memory allocation
> +// and page table entries.
> +bitfield! {
> +    pub(crate) struct VramAddress(u64) {
> +        11:0    offset          as u16;    // Offset within 4KB page
> +        63:12   frame_number    as u64;    // Frame number (52 bits)
> +    }
> +}
> +
> +impl Address for VramAddress {
> +    fn raw(&self) -> u64 {
> +        self.0
> +    }
> +}
> +
> +impl From<u64> for VramAddress {
> +    fn from(val: u64) -> Self {
> +        VramAddress(val)
> +    }
> +}
> +
> +impl From<usize> for VramAddress {
> +    fn from(val: usize) -> Self {
> +        VramAddress(val as u64)
> +    }
> +}
> +
> +impl From<Pfn> for VramAddress {
> +    fn from(pfn: Pfn) -> VramAddress {
> +        VramAddress::default().set_frame_number(pfn.raw())
> +    }
> +}
> +
> +// Virtual address
> +bitfield! {
> +    pub(crate) struct VirtualAddress(u64) {
> +        11:0    offset      as u16;    // Offset within 4KB page
> +        20:12   l4_index    as u16;    // Level 4 index (PTE)
> +        29:21   l3_index    as u16;    // Level 3 index
> +        38:30   l2_index    as u16;    // Level 2 index
> +        47:39   l1_index    as u16;    // Level 1 index
> +        56:48   l0_index    as u16;    // Level 0 index (PDB)
> +    }
> +}
> +
> +impl VirtualAddress {
> +    /// Get index for a specific page table level
> +    pub(crate) fn level_index(&self, level: PageTableLevel) -> u16 {
> +        match level {
> +            PageTableLevel::Pdb => self.l0_index(),
> +            PageTableLevel::L1 => self.l1_index(),
> +            PageTableLevel::L2 => self.l2_index(),
> +            PageTableLevel::L3 => self.l3_index(),
> +            PageTableLevel::L4 => self.l4_index(),
> +        }
> +    }
> +}
> +
> +impl Address for VirtualAddress {
> +    fn raw(&self) -> u64 {
> +        self.0
> +    }
> +}
> +
> +impl From<u64> for VirtualAddress {
> +    fn from(addr: u64) -> Self {
> +        Self(addr)
> +    }
> +}
> +
> +impl From<Vfn> for VirtualAddress {
> +    fn from(vfn: Vfn) -> VirtualAddress {
> +        VirtualAddress::from(vfn.raw() << 12)
> +    }
> +}
> +
> +// Page Table Entry (PTE) - 64-bit entry at level 4
> +// Note: PTE has V=1 for valid, and includes aperture bits
> +bitfield! {
> +    pub(crate) struct Pte(u64) {
> +        0:0     valid           as bool;    // (1 = valid for PTEs)
> +        1:1     privilege       as bool;    // P - Privileged/kernel-only access
> +        2:2     read_only       as bool;    // RO - Write protection
> +        3:3     atomic_disable  as bool;    // AD - Disable atomic ops
> +        4:4     encrypted       as bool;    // E - Encryption enabled
> +        39:8    frame_number    as u64;     // PA[39:8] - Physical frame number (32 bits)
> +        41:40   aperture        as u8 => AperturePte;   // Memory aperture type.
> +        42:42   volatile        as bool;    // VOL - Volatile flag
> +        50:43   kind            as u8;      // K[7:0] - Compression/tiling kind
> +        63:51   comptag_line    as u16;     // CTL[12:0] - Compression tag line (partial, shared with PA)
> +    }
> +}
> +
> +impl Pte {
> +    /// Set the address for this PTE
> +    pub(crate) fn set_address(&mut self, addr: VramAddress) {
> +        self.set_frame_number(addr.frame_number());
> +    }
> +
> +    /// Get the address from this PTE
> +    pub(crate) fn address(&self) -> VramAddress {
> +        VramAddress::default().set_frame_number(self.frame_number())
> +    }
> +
> +    /// Get raw u64 value
> +    pub(crate) fn raw(&self) -> u64 {
> +        self.0
> +    }
> +}
> +
> +// Page Directory Entry (PDE) - 64-bit entry at levels 0-2
> +// Note: V=0 means valid for PDEs (inverted), aperture=0 means invalid
> +bitfield! {
> +    pub(crate) struct Pde(u64) {
> +        0:0     valid_inverted       as bool;    // V - Valid bit (0=valid for PDEs)
> +        2:1     aperture             as u8 => AperturePde;      // Memory aperture type
> +        3:3     volatile             as bool;    // VOL - Volatile flag
> +        39:8    table_frame_number   as u64;     // PA[39:8] - Table frame number (32 bits)
> +    }
> +}
> +
> +impl Pde {
> +    /// Check if PDE is valid
> +    pub(crate) fn is_valid(&self) -> bool {
> +        !self.valid_inverted() && self.aperture() != AperturePde::Invalid
> +    }
> +
> +    /// The valid bit is inverted so add an accessor to flip it
> +    pub(crate) fn set_valid(&self, value: bool) -> Pde {
> +        self.set_valid_inverted(!value)
> +    }
> +
> +    /// Set the table address for this PDE
> +    pub(crate) fn set_table_address(&mut self, addr: VramAddress) {
> +        self.set_table_frame_number(addr.frame_number());
> +    }
> +
> +    /// Get the table address from this PDE
> +    pub(crate) fn table_address(&self) -> VramAddress {
> +        VramAddress::default().set_frame_number(self.table_frame_number())
> +    }
> +
> +    /// Get raw u64 value
> +    pub(crate) fn raw(&self) -> u64 {
> +        self.0
> +    }
> +}
> +
> +/// Dual PDE at Level 3 - 128-bit entry containing both LPT and SPT pointers
> +/// Lower 64 bits = big/large page, upper 64 bits = small page
> +#[repr(C)]
> +#[derive(Debug, Clone, Copy)]
> +pub(crate) struct DualPde {
> +    pub lpt: Pde, // Large/Big Page Table pointer (2MB pages) - bits 63:0 (lower)
> +    pub spt: Pde, // Small Page Table pointer (4KB pages) - bits 127:64 (upper)
> +}
> +
> +impl DualPde {
> +    /// Create a new empty dual PDE
> +    pub(crate) fn new() -> Self {
> +        Self {
> +            spt: Pde::default(),
> +            lpt: Pde::default(),
> +        }
> +    }
> +
> +    /// Set the Small Page Table address with aperture
> +    pub(crate) fn set_small_pt_address(&mut self, addr: VramAddress, aperture: AperturePde) {
> +        self.spt = Pde::default()
> +            .set_valid(true)
> +            .set_table_frame_number(addr.frame_number())
> +            .set_aperture(aperture);
> +    }
> +
> +    /// Set the Large Page Table address with aperture
> +    pub(crate) fn set_large_pt_address(&mut self, addr: VramAddress, aperture: AperturePde) {
> +        self.lpt = Pde::default()
> +            .set_valid(true)
> +            .set_table_frame_number(addr.frame_number())
> +            .set_aperture(aperture);
> +    }
> +
> +    /// Check if has valid Small Page Table
> +    pub(crate) fn has_small_pt_address(&self) -> bool {
> +        self.spt.is_valid()
> +    }
> +
> +    /// Check if has valid Large Page Table
> +    pub(crate) fn has_large_pt_address(&self) -> bool {
> +        self.lpt.is_valid()
> +    }
> +
> +    /// Set SPT (Small Page Table) using Pfn
> +    pub(crate) fn set_spt(&mut self, pfn: Pfn, aperture: AperturePde) {
> +        self.spt = Pde::default()
> +            .set_valid(true)
> +            .set_aperture(aperture)
> +            .set_table_frame_number(pfn.raw());
> +    }
> +}
> +
> +/// Virtual Frame Number - virtual address divided by 4KB
> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +pub(crate) struct Vfn(u64);
> +
> +impl Vfn {
> +    /// Create a new VFN from a frame number
> +    pub(crate) const fn new(frame_number: u64) -> Self {
> +        Self(frame_number)
> +    }
> +
> +    /// Get raw frame number
> +    pub(crate) const fn raw(&self) -> u64 {
> +        self.0
> +    }
> +}
> +
> +impl From<VirtualAddress> for Vfn {
> +    fn from(vaddr: VirtualAddress) -> Self {
> +        Self(vaddr.frame_number())
> +    }
> +}
> +
> +/// Physical Frame Number - physical address divided by 4KB
> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +pub(crate) struct Pfn(u64);
> +
> +impl Pfn {
> +    /// Create a new PFN from a frame number
> +    pub(crate) const fn new(frame_number: u64) -> Self {
> +        Self(frame_number)
> +    }
> +
> +    /// Get raw frame number
> +    pub(crate) const fn raw(&self) -> u64 {
> +        self.0
> +    }
> +}
> +
> +impl From<VramAddress> for Pfn {
> +    fn from(addr: VramAddress) -> Self {
> +        let frame = addr.frame_number();
> +        Self(frame)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index fffcaee2249f..ff994f1ec9b9 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -10,6 +10,7 @@
>  mod gfw;
>  mod gpu;
>  mod gsp;
> +mod mm;
>  mod regs;
>  mod util;
>  mod vbios;


