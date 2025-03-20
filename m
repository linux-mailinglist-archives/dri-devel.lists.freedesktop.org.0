Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33366A6A764
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6301C10E612;
	Thu, 20 Mar 2025 13:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bT3Rv5bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E84910E615;
 Thu, 20 Mar 2025 13:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBxJi9+W2sukfHRTNquhMRNCEXwXmJXpqFzh4mQlLu/yiYxIMuhSLwVPN04j8V38HtNa4DSsjm2TuDh0cp+GESb0uYsJ5S9KDwyuNYTEyHvRkxqgvnKitpewLcgJ34QDB0NfYchLsgnDu/XYcnxXox0xpqWXEyIxyS+4TZAZqrl48JjEmgtbYRTwpmX5ymZZ9GhL9Q0QXCeV9uE1jyf51Fp72sMm9LerVwQiA+v7qEfHUEGO2FIGvqGqDCK08t1zrr2U7NP7xY/HEbFs05Zn+UJFT6L08AyStbhk7rTbxKLONU2jfFI1ytY8SAGKBF2/7rby1Q6PVY0Q3fivVCyJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkDX3TDS0XklbkcH2iPRbaS9Dg2KD039wFANALj3KfY=;
 b=WXYSmCrKQlI1nqM6DIv/xLtc4YgYlfUVp6x/HBQzzV16qGff3eRdWQuGi9nSl5a1H55EtdGal/JzFlo7UtygmpQSoQSgJhJXWJyS0BmrXHpKRV63es/pkLSqws5n99r5pqlpuICfPFemyaGPcuEssW5J2/5gVrU//svaxfqy7ctqvYO/JHgCmFAtM08+7rTiDdehGuJwIUSu+zSsVgGvq3MlTzrF9qylZqRJR4lHj2GyZK0W9PsY2XxBR7rNcJQVqnKKma9P8zVSgyXPU5wG4jisIwBK4w5IZGNKp2lssaqA8qnxK/pDBXn0xNLYTK5JelCaPx6LLCpoFeMxHOotzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkDX3TDS0XklbkcH2iPRbaS9Dg2KD039wFANALj3KfY=;
 b=bT3Rv5bmpP7JHG+cOJ962J31T61w59ZxzsAKea0XzdCDTV7e1GtoZzttQ9vE9DJXD120OIxkfgWWs21FL4SDwObV4HcJeOq2WMNX5sqpSsZZxkFVOqyHSyY8HSJosXOLcMxsfBusti3OAEoRR6QgWBGrurCyr+JD5qSn/ZAwlzRRTUvW8a2yKLUAvPDB0Wh+ptwIEmKNopbt4vwjsZe4SGSKACcm0YMRKeK6DcsjMB3mT0y6RUXQRTS2SnetmFMiMMGfKCel7Ya8qq9CrHoj+tfgUfgSTuaOiLDF+/j2RyYpMb9lwdrcD9562A+GApCZxzUZ/zslqmH39QaR3YTdTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:39:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:39:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 20 Mar 2025 22:39:13 +0900
Subject: [PATCH RFC v3 5/7] gpu: nova-core: use register!() to define
 register layout
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-nova_timer-v3-5-79aa2ad25a79@nvidia.com>
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
In-Reply-To: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0326.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 482406bd-198d-4ff6-8e01-08dd67b4af01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3BkNlBJSXZlSWtSS09wWG9HVHRUb3RPTXZUZWFIVjRKY3h2VXNGUXpHZlhQ?=
 =?utf-8?B?R0JwVkZVbVRFYXdjZm5vM3NjMzd1UXpCcC9SMHZkNXhCQ2RNWElLL1ROSFFH?=
 =?utf-8?B?Q2lBR0JMTFdQMWxFc3BvVG9nZW9oQlZ4aWgrdmRoUm1OaDBOYTd4TzBXcEdp?=
 =?utf-8?B?Q1ZsazdoZzZyTW1HOXpTejVvWEtqUVdJTGdncEd2T3NJRG52Z3BwZDZ4OXJx?=
 =?utf-8?B?R1pzRXZ1RXFSNGJFVVRWc2lha0xDclJtRUg5SzFMMXlLQ3ZwY2h0MlJLTC94?=
 =?utf-8?B?bVlzQlJIbTlKWFZrQUtEdU9NL3B5KzBja1UvOEs3bXk5MlBNV3d3OWJBbmU3?=
 =?utf-8?B?T1AxTGJxa1NSdzFVMENoZ1Z4dUVxTlNsSUNFQWtObDRQSXlvUCtkZCtoNnN3?=
 =?utf-8?B?aVJZU3pDZ3hzNTU3MUZiOU11YmZrdDdrS2wyQzFGUG5BbDlieEp6M20zNXh5?=
 =?utf-8?B?VkcreHl0eS81UFY0RGwwamhPM3gzRTBPVS85d2hNNERtZ242Y2lTcmY4UDFT?=
 =?utf-8?B?L0hPUmtNVjZCNzZzMGMzTlNTZ2xIdDRjUkNSTE10NnBOViswMXF3UlZlekdV?=
 =?utf-8?B?K3dVeHBZQ3FzOS8zWWt5ZFpITy9NVmNGYlcwVnlSSzFucnB3QzJqK3Y4ejFz?=
 =?utf-8?B?ZitaK2lNR0VjVzcvQUVQcDJSVm5zMEpjMmdFT0pacStvTUhLMzY5VmM0TG5V?=
 =?utf-8?B?eWJVTnlXc2dKdW9DT2Zra1ZwYm55V2UycU8wcU95ZzErTnNHeE0rVDNtbE9z?=
 =?utf-8?B?RnhKeVFhQ0wwVzhlZjNpRFFNcTJaeEFzS3h5ZS9sTlhLTjcxRHdtWWtSdmxl?=
 =?utf-8?B?cXYwVEtvUFhqUHpqNHZFbjdsaVkwK3VqOUIyZEdGQzFSQ1h6aTRKVEF0Zmtz?=
 =?utf-8?B?WTJ1S2gwOUdYekw2NE00bXNRU2REb3lVcytOamdzejFJWmtZN0wvMXEvTkFW?=
 =?utf-8?B?RFFVRVMvOXZHTjhEQmhTMVZEQ2laVmIzVVBqS202bmRVZ1d2U3d3RTlqN2Vt?=
 =?utf-8?B?bFFEOGZxVFRudjIyVHJ1MXJjelptVng1N2hlSkNTaU5zaW81SUJqMFRKQ2V5?=
 =?utf-8?B?SG5WYzkwWStUaGpHV2tUcUhZWTZ1NU1pREtFaVM1YWZ6em5mTUF1SC9JaW5T?=
 =?utf-8?B?eVA2OFdBRTIrbjl0LzV2VU9ZOU9tc2szVGxKR0Y5bWNZa1BhMWh6M3kvWXM2?=
 =?utf-8?B?Ui9vc2ZsUWhtRmRHSmJjaG1QWUF1eGNCOEF4c1VnejhPcnV0Z2F1VkJ4Sm40?=
 =?utf-8?B?eXJYWmszUW82SmJ0ZUJHMjNlNVFWbjYyTlMrNmV3b1UwckZwUWhmZHZLTG5q?=
 =?utf-8?B?TDlqRzlmZWc0UDUxUUJXSTlGVytQd3dUOUxoNGhhUk9TUU5laUVhcVRnQTFr?=
 =?utf-8?B?Y3p4YnEvVCtIdVhpdVY0SUo0N08vZkorcnROeVFwQ3Q1eDJUSDcrVXBJZ09p?=
 =?utf-8?B?cWZxcWJsMElLSWw0UFQxNk0wMWp0RDBWMGJrNWlLUWNBZEd3dGV6cGdORi9t?=
 =?utf-8?B?UE1oN3pFdDE5NXl1RitFTnRWVU5KYU9zakhqc3VjOU1zQmwrN05GcXlkVTIr?=
 =?utf-8?B?b3p2VzcrbDRDN1ZWMkhyTWpqbm0ycWlEN2tGaFpyODFQZ2hCaDlRd2cvQlFn?=
 =?utf-8?B?MG8vTE16dWZzR2xZN3NuQWl4NnY2bk9YbHBUY2RKSG5SbTZLY3hZcjZMSmtn?=
 =?utf-8?B?R1RMVkVTdUxGZ3lkeXNSVEVxV2QzSFBJR0VPZDBscHlmYzk4NmhVMGlXUk5u?=
 =?utf-8?B?VWx3Qi9ZaHVTUHFhMCt2ZXo5S2JadnZVTEVkQW8zbk1BdGRUd2VTNFh1VVVj?=
 =?utf-8?B?REpoREpQYUZzeTVjN3BXU1gzTjFyTUpLTkhIY2NUdjN4bzZaWFhoMzcxamtY?=
 =?utf-8?B?bVJiTnRPOWkxYTJ3MG9pUi9ranBKaHFYQzhSV2wxclVKV3dsL3FnTUIzc25j?=
 =?utf-8?Q?rWeXB2BGuD4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjRKN0xwZXlFamdjLzdDVmxNS1JaVEd1U3IwbXhBTUtkV2N0WlJ2OGlMSWFR?=
 =?utf-8?B?czBBS240dlVXVVB4NU9XTzZFZEMxd2VJSEJ2djN5YklHUlUxa1FuS0NvTjlY?=
 =?utf-8?B?TTdLdUNZd2RFUXF2cm8rUEN4SnlOeDhHTjJHbzJ0dU05YU1GQ3dNR2V3YVFE?=
 =?utf-8?B?V2xvNkpPNHpYWTdveDMvaFN1Nm1DeVlsZVRCaGx0TGk1cUxaNFp1MHNCKzN5?=
 =?utf-8?B?T2FpR3FST2dGMnROQ0lEcnJxMDRVdGhiWHBpRFUxSXg0QmpRWElOOUYyaGZX?=
 =?utf-8?B?NWN3R2ZXZzhpY1dHVDJ6TU5OeXhsYTlVY0ZVTzA2TmZVVnlrR0NiNFpVTE1j?=
 =?utf-8?B?cGJlcXFHdmNqQlZxRUtUZHdBellNdklReU9ITDA0bnpGMUZrcWxCL2poMGRa?=
 =?utf-8?B?c3NxNE05VlZ1LyttZUoxNnZBN3hVNVBWa0NZeGFKb0pEZHQxRk9KK2J4MHBV?=
 =?utf-8?B?MTZZaFRTY1ZVcGE1SDRNb29HckxjNmhmOE9lQzl1TkF1N2IwNVNnZXA5c2VR?=
 =?utf-8?B?NW8ySjUyR001UE5Rd2RDSFZDeCtwdWxmMGUveFNEd1ZUY3ljSjJjTFMrVGN5?=
 =?utf-8?B?OXhQdThXTWJ4YUxjMmZQMU95Y0JEL3lsNXNlNjRCRDdLMVpQTWtZdFVyRXM0?=
 =?utf-8?B?L0duS2dxeXlOVmhjZFpSaU5LRitlTU1kQ3p5YWt5OGdEbzM1NVFjVkllQjRp?=
 =?utf-8?B?VGdTR0l0V3oyTC9lZExPMlhCeldKQy8zMmI2ak94Y1liRStlZEVMSitWTlJQ?=
 =?utf-8?B?ai9tK0RPZHF5QWd2RW93VnNqUmo3WjNTYjhEZlFWRXI2K1JuZldxeWdZcnd6?=
 =?utf-8?B?QXFBTnN3ODQ5TFo0VUVOMGFmNElxOEdjRi9SdkpVMW0vS0pZTmEzUXZiN2FI?=
 =?utf-8?B?WjZzbzBHYk9zd2UwRjNtSFhKMGlsR2V5MXJ4NVVoTWpPbmZ6RnAwS3Y2NFNI?=
 =?utf-8?B?dUJ1UnlGdWh3Z0ppYVRYUXE1ckY4NFREWGRWTjZUVE1ZazV0YTZQakZIYVlm?=
 =?utf-8?B?V2F2eWF1ZVkwZG5vOUQzRDQ0bllFeGZJeWFWMmRobkNLVFU2MlUwVWNGaXNk?=
 =?utf-8?B?b1dnTnhIRlpiTGEwcmR3aCs3d3ZycTE5c2cxRHlsd0cvZ2pYc2paMGVab2Fa?=
 =?utf-8?B?LzcwQkh4Q0g1SWZhay9Mb0U4WmhrcGNqMmxTdUlIL1ZMUTNjNEw0SWFFSmFw?=
 =?utf-8?B?S3ZHTGlvTmlWTW9iNjJ1NVBBTHhUQ1lPSkZSTUQ5dlRjeTlxWDg5T0M3R3BT?=
 =?utf-8?B?UW9iRXpLcEtDOTRLSk9ORUR1b3d0cDNNaFJUVUpwclpsYzg1YWVnaE1BRGhD?=
 =?utf-8?B?SW1Sa1o0bThOY056UXUyNTBSbDduY3RSeTFKNE5nMVpBQzJXN2NRdHJsckgy?=
 =?utf-8?B?MHpBZGpCYmxBMktLTG1tcHFFWm9Sa2R5U3JKSWVCWlA3cStVWVN5LzRxbE9H?=
 =?utf-8?B?aEpVNG5ZbDBuUzNTbjhGc1ZKa05xZld0Mis5UzdQOUhlOEJBSHBtNStnMnlX?=
 =?utf-8?B?WGFTYi9PcmlYVm5SaisvY1NXZmRPL0Y4bUZhRUlFZndhZ0ZhUzkyK1Blc0VQ?=
 =?utf-8?B?ZVBNZGhRVmZWYk9GL0RDNDIwT0MxK1E1eitnZ1FsVmV6WmRRRmlxMVlUbGFS?=
 =?utf-8?B?T0xkS0IrSEZidGlxTVZVUGhUM2NobFJsZ1RGYjZYYVloUnFTMklidGFlc0VF?=
 =?utf-8?B?aXJ0NUkxV1pzNVNGZWxMMTdNMDdDRFZ2cWNTTHJGUCtkUmx4MkpYWFkva1Rn?=
 =?utf-8?B?MFNXZkhjNmdmUzdvQjByNHlRU1BWOUFCRmw3bCtzNWhQMy9wY2JwTjloRFlH?=
 =?utf-8?B?N25FMGp4ZnFiNmR6MHduMjBJVlF0UmtBWjYrczh6dkR6NDlsblJjaC81ajMy?=
 =?utf-8?B?dnpDbDQvczYrZkpRYmRPczVSS2VSUEZlMTF3VDF4SXdZcE5HUVpTK3hCMmZE?=
 =?utf-8?B?OEw5QUJxamFEOWhHY0J4ODc2eTNsNnpCU3h1Y3RQazZ1alFKZGtnbUw0YndM?=
 =?utf-8?B?WTEzU1JFRFY2Z1JoOUZ2S3NralMrSlZ5TlZjTzk5L2tkYVNQK00xRDh0VVds?=
 =?utf-8?B?b0htM0ZFNys4QSthS3VPRzhhdllpbnJhamtDdkdHRnJ5cFVsaHlDV2NUS1JK?=
 =?utf-8?B?cFc1WE8xbGtJbTB4VUExRkVqSDk3cWQzemk1Skk1Mm9CT1dJbVQzTGRxVVlj?=
 =?utf-8?Q?pYRi4mHfanru0XRKx2HrjjXKSzIGfyYhCzm9RouNa7TD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482406bd-198d-4ff6-8e01-08dd67b4af01
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:39:48.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxtzrSd/SCycHiBWNX3hdtuwkioensFXbcxxU8tD+b03KaS7cSB2igKmRttUqe0YgCZ1G1XXpRe7i96kypH9dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409
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

Use the register!() macro to define the layout for the Boot0 register
and use its accessors through the use of the convenience with_bar!()
macro, which uses Revocable::try_access() and converts its returned
Option into the proper error as needed.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs       |  5 ++--
 drivers/gpu/nova-core/nova_core.rs | 12 ++++++++
 drivers/gpu/nova-core/regs.rs      | 60 ++++++--------------------------------
 3 files changed, 23 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9fe6aedaa9563799c2624d461d4e37ee9b094909..d96901e5c8eace1e7c57c77da7def209e8149cd3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -135,11 +135,10 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Devres<Bar0>) -> Result<Spec> {
-        let bar = bar.try_access().ok_or(ENXIO)?;
-        let boot0 = regs::Boot0::read(&bar);
+        let boot0 = with_bar!(bar, |b| regs::Boot0::read(b))?;
 
         Ok(Self {
-            chipset: boot0.chipset().try_into()?,
+            chipset: boot0.chipset()?,
             revision: Revision::from_boot0(boot0),
         })
     }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a91cd924054b49966937a8db6aab9cd0614f10de..94f4778c16f6a4d046c2f799129ed0cc68df6fd4 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,18 @@
 
 //! Nova Core GPU Driver
 
+#[macro_use]
+mod macros {
+    /// Convenience macro to run a closure while holding [`crate::driver::Bar0`].
+    ///
+    /// If the bar cannot be acquired, then `ENXIO` is returned.
+    macro_rules! with_bar {
+        ($bar:expr, $closure:expr) => {
+            $bar.try_access_with($closure).ok_or(ENXIO)
+        };
+    }
+}
+
 mod driver;
 mod firmware;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 50aefb150b0b1c9b73f07fca3b7a070885785485..7bfd2b575fe2184565d495012e55cd0829b0b1ad 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,55 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::driver::Bar0;
+use core::ops::Deref;
+use kernel::io::Io;
+use kernel::register;
 
-// TODO
-//
-// Create register definitions via generic macros. See task "Generic register
-// abstraction" in Documentation/gpu/nova/core/todo.rst.
+use crate::gpu::Chipset;
 
-const BOOT0_OFFSET: usize = 0x00000000;
-
-// 3:0 - chipset minor revision
-const BOOT0_MINOR_REV_SHIFT: u8 = 0;
-const BOOT0_MINOR_REV_MASK: u32 = 0x0000000f;
-
-// 7:4 - chipset major revision
-const BOOT0_MAJOR_REV_SHIFT: u8 = 4;
-const BOOT0_MAJOR_REV_MASK: u32 = 0x000000f0;
-
-// 23:20 - chipset implementation Identifier (depends on architecture)
-const BOOT0_IMPL_SHIFT: u8 = 20;
-const BOOT0_IMPL_MASK: u32 = 0x00f00000;
-
-// 28:24 - chipset architecture identifier
-const BOOT0_ARCH_MASK: u32 = 0x1f000000;
-
-// 28:20 - chipset identifier (virtual register field combining BOOT0_IMPL and
-//         BOOT0_ARCH)
-const BOOT0_CHIPSET_SHIFT: u8 = BOOT0_IMPL_SHIFT;
-const BOOT0_CHIPSET_MASK: u32 = BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
-
-#[derive(Copy, Clone)]
-pub(crate) struct Boot0(u32);
-
-impl Boot0 {
-    #[inline]
-    pub(crate) fn read(bar: &Bar0) -> Self {
-        Self(bar.readl(BOOT0_OFFSET))
-    }
-
-    #[inline]
-    pub(crate) fn chipset(&self) -> u32 {
-        (self.0 & BOOT0_CHIPSET_MASK) >> BOOT0_CHIPSET_SHIFT
-    }
-
-    #[inline]
-    pub(crate) fn minor_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MINOR_REV_MASK) >> BOOT0_MINOR_REV_SHIFT) as u8
-    }
-
-    #[inline]
-    pub(crate) fn major_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MAJOR_REV_MASK) >> BOOT0_MAJOR_REV_SHIFT) as u8
-    }
-}
+register!(Boot0@0x00000000, "Basic revision information about the GPU";
+    3:0     minor_rev => as u8, "minor revision of the chip";
+    7:4     major_rev => as u8, "major revision of the chip";
+    28:20   chipset => try_into Chipset, "chipset model"
+);

-- 
2.48.1

