Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE022AAE17A
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D798910E7F3;
	Wed,  7 May 2025 13:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FStYYapd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D6110E80A;
 Wed,  7 May 2025 13:53:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAzjFueXTsKcS1Vl+b8eJbww2tXMfAUFe1ZiwRoB7lfYElAt/c+rT/p3oamt67gJZRq0nZEKqGEktXiP4KyjlvcBZVT1aBAg1DoNGljwWukPXM6Ye4d8+G+e8fM55jcNmFBrscP7vwdOOCEtFAWbk9Ju+qvLy1D2T5Dyfs1dO8r2kHYBJ8zbIkXZ3Xi+W2Qm43LeJwWNcyK9re1w0gWP6WfaYjuqEvRVn8B52p4HKkBbbY6gsnjxv01NNrz56rJf/NQGwf2V2gTHiG6vFQiJ12blgTEVb0MBYAGt+g2Mz6PT+626L5vOh5L0pS7XCplDSWTaGoizTji1bhlVNkOOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmknQLtDocR20Y5JcumpoH/7yqN91PIUyWKzKEPIzSw=;
 b=vAdfjJ1tp9L+4y0r/A1LDS0s8NNUAIr5GFRQssld3a0SD6bn5x6GAfknhxBJc/z/PXyWL5+EDJH3/zDOhXckzxTdRfVYmjC0QVqIPPnR2R2GYAgOu89O/It5yE/thBbWFwP990Af3fue4L5sxTG+0rvkxyZ1G12/TBXd47gf4Be+aGc46dH0sjnVbN33NthMjBHImbHLxM/lxXMo09+f4lsNOrOOlsKz7a1nxttaEUd+xXTaM98QRqmSVOSQTs8J8/9q20kUDZCmx2VNxJ+evTA5NXG0J38Oa0jTa32kGQ3thnm/JpLsuQ78FR2h9eo4wHuqae+mTzETFxOiiWviRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmknQLtDocR20Y5JcumpoH/7yqN91PIUyWKzKEPIzSw=;
 b=FStYYapdYdxtDa6xZ1VQ0zTKFURLsQLdkCbL7dT8F4SFDK06WH+fX8zinV/JXjwe6U5Vdb4OvfkUU7M/tXsKYTKi+8/bmoI7ekDXo9GgBjiK4JnPjnBVzFksioUy/OCW1z0+3H6METZMnPodwRUBf8lmWr059sPNmLQ5WptZbZYojL5SlyBwyNlPdc4buA9kBphsodAkcAPldSA1uf7BFNMeHWp9I7x7MSK726z94EWVfKnKrXVspO9oJjfVEVm5XFoqQyXBcEhH+P4kTEsZKbZzKqqdUT+wWouPQAvTOaAfuU5oCMp23Cw6Su4hGTHVngBtW9mzs8RoWzCkZI9oHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 13:53:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:45 +0900
Subject: [PATCH v3 18/19] gpu: nova-core: extract FWSEC from BIOS and patch
 it to run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-18-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0371.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: ee22d00f-390e-4190-c62a-08dd8d6e97ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW5wYittemIxM0xnOG01U2NRdGw4RE9OMXhzSE1ZTWc3ZERNWUdpUmdrelRl?=
 =?utf-8?B?RHU2OWIxeEtiR29nU0o2Z2lYc2ltQUZXbjdWc28yd3IxZzE3R0p6UVhCYVQx?=
 =?utf-8?B?ZWYyNVZicDBjT2ZwelBTYmtFeEEvZ2Z5Ti93THkyeVdvelhPUWlwZzR5VGhY?=
 =?utf-8?B?ajJyVFFQb1AwMUQybXc0am0vajV4V1JSM3RNVStzNjBDMEFhb0VyejRwNzl2?=
 =?utf-8?B?Z2xaVmo3Nk1ESnFTb1U2VlFtdEZnNXFLS3VQUCs0ZnA1RVcwdDBMWENubkRB?=
 =?utf-8?B?MC9UZ3h5cHMxUWhKOFptdHh5QmlJcHh3WHFiWC9HUm55NjJIci81MmJPcjFI?=
 =?utf-8?B?blRlakNHdzE0ZHgvRS9pVE1QTkhkSDZhdGxzWGJielg2a1JmeXZXS0V4S2RC?=
 =?utf-8?B?T3VvSHFCd2VLcmp2NGhWbVcvRDBDZDJJMmFzRVpqRWljWEZUSFVscE50WDVw?=
 =?utf-8?B?U0lyNy9kbkNqeHRCZmNMTERhdEkvMEZZb0NjRHNKbGM5TExtekIwZTdLVnZW?=
 =?utf-8?B?cmI2eis4b2dIRm1haEd4cWo4U3F2UmhMS2lFOFpnZEpwbThaWlpsSGRadUVm?=
 =?utf-8?B?TmJiM0xvOG4yZlVDWTlleFNsQnN5RXI1MDQvV2k2YzNDSDJGZjFGOURzUnlE?=
 =?utf-8?B?WCtSOGJCR0pRczBmbkd6eGNFNWVQRHlvdG0zTnRkRlFYSkZkeEhrTkNOTUZs?=
 =?utf-8?B?ZDZPakd1ZklHZHNHRm9FZHZlRnR6ZXhrS3JJeHFoeFMwSHhNcXhtSU8zN2ZX?=
 =?utf-8?B?WmMrazdqTlduUVhNamV0U0N0Q0N4TUhCbGRCek9udFd3SkFjbHhhdk9zZGRS?=
 =?utf-8?B?dkYrUitsNkxiQXRKWEJNa1pJejdyRXgzTUx1a3czK09wblFKemxpNWdMS2Vi?=
 =?utf-8?B?TVdMSDJnbnBJRmd5RUFUb1lvMmFybUh6RGRTTERPN21STWZYRXVIaHNWWU4v?=
 =?utf-8?B?ZTY3bkJnd0JIRmxyWkx1WER2OTR2Y21KN21RM3NXRXJKdjA4S1lHTXhUMmVY?=
 =?utf-8?B?NEE5WVBKb1ZXTFpWOE5xa0NUS2xIVE1HZGFPbVFsTWVLZFZKMTZzL1dPSm50?=
 =?utf-8?B?YURscXd0RzdubjlXNEgvYlBRQ092REI2QngzeE80eHBjeHZvbk9DZWVvOVBz?=
 =?utf-8?B?WEZvaHJRbkIxMkZ3akpES3M0QnhKZ1ZOZmpyMWZnTVlNQ0JXRzhTa1p4ZndH?=
 =?utf-8?B?NGNQMVZiY0licFp6OU9RelVJY2phS0ViMlJnOTRROEs3by8vb1BvVFpBSEEv?=
 =?utf-8?B?UHR2aFJtaEE1R2lTVWVLQTFvWHVWZ2xPU3krYytTOXNlc1Rhai9rMVRXMVFT?=
 =?utf-8?B?K2kzdTA1QitPRGRtN0xQR05ISlB5Vmg2TGZQY1VHc1JkR2NxSS9MVStERFA1?=
 =?utf-8?B?aXpQVk9oQTcrVjlXNnYzOG9HYjFCbkk3bEQ4eGtRS09Yd3o1enRMd2xlalpN?=
 =?utf-8?B?RXRrbG5iaVFjTmdxUi9jb1Z3S01mNlN4aUlEbmQyTyswVFpDL1k0STRBdjlm?=
 =?utf-8?B?NGlGdnAxWDI0T1RNQ2U5aTlaUkk2azg0eW1LaGVMRzdsR2VkQzFpVUMxQUlx?=
 =?utf-8?B?WjVaN2IvZ1JrZVpkNmUrUU5tL1JzcVk0RXM5NDIzdnpVUHlIZFhaZEpheEd6?=
 =?utf-8?B?VDY0dHhCME9sTTNOMHMydE1BSW1nUm9EbFFlQ2hVS21ZSmlrdjlVa0k0K3Fr?=
 =?utf-8?B?YytOL3JLU0hvWDczT1J3TnBNd3MrT2tLWDFUbys3VDRBd0VhRHE0THdYOWxr?=
 =?utf-8?B?c0VLSk1iMU80Z0l4TVE1RVcrYjVFOXBRY2NXb1pYTEdNNFJJaHM2c3ZzMUVu?=
 =?utf-8?B?ZW40V2pGUkZTS3R5aUtNRTFSNnFHRUY3NEFjeXhjdlhXZnlESjBaSjdZaTJS?=
 =?utf-8?B?TmFUS05uZmVSSTI2NlFDU2dLSHI1ZTRWTXJGcVFoUWF3YXFlRW94bWN2RVE1?=
 =?utf-8?B?aGw3aUNlQ1RVUk5qRUZ3WENUKzlFY2JIMVBES3pBbnB6L3N6N0w0Ny9WazMz?=
 =?utf-8?B?dVd4ZGlMUzdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE1kS2xaemkyS0M3M0dRS2FKWjVkMnMzSktMT0xIYWp1SVk2MUp1ZXRPeVVJ?=
 =?utf-8?B?SWdrWDdEZ0tVU2huNHNJU3FCU1BIQ29kbi92TzVhKzVxUWp5L0NreUg2Y3d1?=
 =?utf-8?B?SVBqT3NQZDM2Q1JoYlZjUFJISWhzVENnS3hYcVhqd1lZc0xqclVDeVN3WEpw?=
 =?utf-8?B?NENsb2dkMVBGMnkzZS80Q2wzOVlOL0pmZW9VQ1RFclYxNEgzdmpNV1BLNWll?=
 =?utf-8?B?c1RHMzF4VWROdHhVSW9tR0xCUUhFQ0R4R1JHVnRQcGxibTdLN2phZVdSZHdC?=
 =?utf-8?B?TWI5NW4xU0xvUUltdDJvYWFWbVhrQ2FDaWR3SittTDQ0WERDUjFXbmhRdGkz?=
 =?utf-8?B?SWFMZGttbzFWWnFnMmROZ3JtRGRQWWZUb0xQbGZBcGwyNTV0TDc3Vm1URS9s?=
 =?utf-8?B?N3JUUDlwRFhhNEdsL3kvSEdiaWxMMy9kS2xMZkZuR2lhbW43anFQZnpsNWVO?=
 =?utf-8?B?cllHTFdGU1lvZThMMXVzTjhqZmk5R04vK2FEdEJiaG9iby95Mksydlc0ZHZV?=
 =?utf-8?B?UnRBRW80YytISE1IZTFuamFUSDFDU3dqWXh1MEEwN0VOTVluR2xkeFB6Zlhl?=
 =?utf-8?B?aTdLNzN1bkxpNnk0K0h5aGt4RFFWTmpzWU44Q2RTL1AvUGJxcVp2UlVjZ1gx?=
 =?utf-8?B?L29jWGxPbUZEbFp1NzVrRG4wWFptS3FrdkxueERWZEYydjl6eDExZkxGUzJD?=
 =?utf-8?B?TWtUNmNjM094ckNEQ1RFN2cxa2c3K1RvUnh5Vk5XazFSZTRTT3NTemYzYVdy?=
 =?utf-8?B?NElHc3hGN1ZxbjFZcnY3QTZTNkM3VnVwejh3ZzZOV0hYUzdReWtRU3c4YW1M?=
 =?utf-8?B?L3lybThYbDBmWUJrQ0xaWHhZTDRDdmd5N2FwWTBOL3E3S1lFMGlmalJqVXlL?=
 =?utf-8?B?MkwwbGFjTlhuNzBScVlrUENTNEh1d3huYWR2WWt1dUw4QllPYWk2cGFOZXU4?=
 =?utf-8?B?R1pnOGJXMzVFYWpOWmZSUkxFS0t0TGtwNlByUkNCanJYOEI0TW5CdERpQkZL?=
 =?utf-8?B?SlhOaEpLUWZwb3hFcHQ2QWNDckMvelJIVHBWbDNxUWFQRDJFbjIvNFIvbmpL?=
 =?utf-8?B?eE5JL0lYZ2pIcnVHeGJRcnZmZXNIbVZDREhjWEs1amkzRlE4NG9aTmhQamJO?=
 =?utf-8?B?NlFmUVkzbEN0U25LaEdTS3lsNTVYQytMYXVYc1hGdUpSd1FtVzBEeFd2Zjlv?=
 =?utf-8?B?bjE0Q2d0RUdSQ2FJZzNmcEJ3RWo4TGhzMm9NSHVzNExBWjBlQzMra0kyQTBs?=
 =?utf-8?B?T0JUcXN2OW5EVGNUa015SjZqTFBlUGowWnlUZHBLYWtINzV4bnE5TktKaTBk?=
 =?utf-8?B?V3lHS0hBWEtNY0RPNFhEYittT2ltNVVpUlZ4QUYzZmVWZGdHRWpaeVVFQTZC?=
 =?utf-8?B?MDZaQWU3bW9FOW1ZajdkcG56RmZrTFdsL0NkNzZCUW5wLytzamtjY3JsV3Yw?=
 =?utf-8?B?V2JoZ3RDZUVMZ2svalRzWHZpL3NBM1lqWTZVQWxGVjNwd0NMMnlsM1VGS2lV?=
 =?utf-8?B?c0RVQ1l2bHplZm8xRloxTDlQbEFlYmhCa1JtRVlvYWFDU1ROekwzU3F0Q2N6?=
 =?utf-8?B?RzdGdk41SzdVWk1IT0RVb2xvSHJxUkxnaEdTeVAyRlNBNUJFKzJqa3RKN1hj?=
 =?utf-8?B?YWJQeDVUZXBYWVBmOEMzd0M0cGdkU0FFejM0RFBnajdlSEZwc0QxWWNqZ1Iz?=
 =?utf-8?B?c1RpVmRsMHBDeGRrRkloZ0NZdWtsZlJHSXpwRE5OUzdrR2gzMlYvdS9jMndI?=
 =?utf-8?B?RnNReDBnNjZ3QUdBaCtZeWtjL0UzWTdWYWhiZUVMeFliQk1IVG81VnY5TXBI?=
 =?utf-8?B?M1V3aVFGQlBKUm91OTh1US9tcVZyakQrdzg1MGlTOCtjaXRDZUV1dHFWMmxF?=
 =?utf-8?B?ZXNWNVRjYVEvcTlvN09LWittT25ISlJQbjdDa3FVWUVLMXdUdkZZbGhyZGpk?=
 =?utf-8?B?S3I0dFRldTBRMFIxeXlYUm9aZW0vc096MkV3ZkdGTG8yYlg2K3RPUXBlSm9G?=
 =?utf-8?B?b1lrWmd6Q3RjVVIzQUNwKzBxc0FTOFFSSXlWdTRRc2M3VzJ4dndBV1N4eDNW?=
 =?utf-8?B?cEF0UU91YitwcHhqeGRqNERtY21vS2J4Z3RDa1JSMENmTGNOTjR2bWY1MGxQ?=
 =?utf-8?B?b004bXBZV0dmaUUrSFNrS2JtZUVtbVkraUlXTUY3TlkzYUZZYXdxaFg2cFNE?=
 =?utf-8?Q?q0wiZGdZ0S2VO9G36K2JlC8/gQxTef4Lcht69GpoDsB6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee22d00f-390e-4190-c62a-08dd8d6e97ec
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:49.3839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4Ou+t6yPT9nzA7MnqrzfdeDXi8C0tlP8p9CgS2Ui1zncPjl87Ll9w9Nqycqe8uVyNKV//NzLi9XxlRSp6iL1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
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

The FWSEC firmware needs to be extracted from the VBIOS and patched with
the desired command, as well as the right signature. Do this so we are
ready to load and run this firmware into the GSP falcon and create the
FRTS region.

[joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs            |   3 -
 drivers/gpu/nova-core/firmware.rs       |  18 ++
 drivers/gpu/nova-core/firmware/fwsec.rs | 359 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  20 +-
 drivers/gpu/nova-core/vbios.rs          |   3 -
 5 files changed, 395 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 9d90ae01d0044eaab4ddbc3eba216741d7a623ef..a12d0dff574aa38fb5eb8f4d759611af2f8ba3ec 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -2,9 +2,6 @@
 
 //! Simple DMA object wrapper.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::ops::{Deref, DerefMut};
 
 use kernel::device;
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 960982174d834c7c66a47ecfb3a15bf47116b2c5..3945fd18499555ddd6fb2e0ea69535b40fcc4b08 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -8,9 +8,12 @@
 use kernel::prelude::*;
 use kernel::str::CString;
 
+use crate::dma::DmaObject;
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod fwsec;
+
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
@@ -86,6 +89,21 @@ pub(crate) fn size(&self) -> usize {
     }
 }
 
+/// Patch the `ucode_dma` firmware at offset `sig_base_img` with `signature`.
+fn patch_signature(ucode_dma: &mut DmaObject, signature: &[u8], sig_base_img: usize) -> Result<()> {
+    if sig_base_img + signature.len() > ucode_dma.size() {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we are the only user of this object, so there cannot be any race.
+    let dst = unsafe { ucode_dma.start_ptr_mut().add(sig_base_img) };
+
+    // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
+    unsafe { core::ptr::copy_nonoverlapping(signature.as_ptr(), dst, signature.len()) };
+
+    Ok(())
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d7e3418b49ab4ad478e73c0d447a832ed68ecd0a
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FWSEC is a High Secure firmware that is extracted from the BIOS and performs the first step of
+//! the GSP startup by creating the WPR2 memory region and copying critical areas of the VBIOS into
+//! it after authenticating them, ensuring they haven't been tampered with. It runs on the GSP
+//! falcon.
+//!
+//! Before being run, it needs to be patched in two areas:
+//!
+//! - The command to be run, as this firmware can perform several tasks ;
+//! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
+
+use core::alloc::Layout;
+
+use kernel::bindings;
+use kernel::device::{self, Device};
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::gsp::Gsp;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadTarget};
+use crate::firmware::FalconUCodeDescV3;
+use crate::vbios::Vbios;
+
+const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
+
+#[repr(C)]
+#[derive(Debug)]
+struct FalconAppifHdrV1 {
+    version: u8,
+    header_size: u8,
+    entry_size: u8,
+    entry_count: u8,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifHdrV1 {}
+
+#[repr(C, packed)]
+#[derive(Debug)]
+struct FalconAppifV1 {
+    id: u32,
+    dmem_base: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifV1 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FalconAppifDmemmapperV3 {
+    signature: u32,
+    version: u16,
+    size: u16,
+    cmd_in_buffer_offset: u32,
+    cmd_in_buffer_size: u32,
+    cmd_out_buffer_offset: u32,
+    cmd_out_buffer_size: u32,
+    nvf_img_data_buffer_offset: u32,
+    nvf_img_data_buffer_size: u32,
+    printf_buffer_hdr: u32,
+    ucode_build_time_stamp: u32,
+    ucode_signature: u32,
+    init_cmd: u32,
+    ucode_feature: u32,
+    ucode_cmd_mask0: u32,
+    ucode_cmd_mask1: u32,
+    multi_tgt_tbl: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct ReadVbios {
+    ver: u32,
+    hdr: u32,
+    addr: u64,
+    size: u32,
+    flags: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for ReadVbios {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FrtsRegion {
+    ver: u32,
+    hdr: u32,
+    addr: u32,
+    size: u32,
+    ftype: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsRegion {}
+
+const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
+
+#[repr(C, packed)]
+struct FrtsCmd {
+    read_vbios: ReadVbios,
+    frts_region: FrtsRegion,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsCmd {}
+
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
+
+/// Command for the [`FwsecFirmware`] to execute.
+pub(crate) enum FwsecCommand {
+    /// Asks [`FwsecFirmware`] to carve out the WPR2 area and place a verified copy of the VBIOS
+    /// image into it.
+    Frts { frts_addr: u64, frts_size: u64 },
+    /// Asks [`FwsecFirmware`] to load pre-OS apps on the PMU.
+    #[expect(dead_code)]
+    Sb,
+}
+
+/// Reinterpret the area starting from `offset` in `fw` as an instance of `T` (which must implement
+/// [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not written for as long as the
+/// returned reference is alive.
+///
+/// TODO: Remove this and `transmute_mut` once we have a way to transmute objects implementing
+/// FromBytes, e.g.:
+/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
+unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a DmaObject,
+    offset: usize,
+) -> Result<&'b T> {
+    if offset + core::mem::size_of::<T>() > fw.size() {
+        return Err(EINVAL);
+    }
+    if (fw.start_ptr() as usize + offset) % core::mem::align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &*(fw.start_ptr().add(offset) as *const T) })
+}
+
+/// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
+/// implement [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not read or written for as long as
+/// the returned reference is alive.
+unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a mut DmaObject,
+    offset: usize,
+) -> Result<&'b mut T> {
+    if offset + core::mem::size_of::<T>() > fw.size() {
+        return Err(EINVAL);
+    }
+    if (fw.start_ptr_mut() as usize + offset) % core::mem::align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset) as *mut T) })
+}
+
+/// Patch the Fwsec firmware image in `fw` to run the command `cmd`.
+fn patch_command(fw: &mut DmaObject, v3_desc: &FalconUCodeDescV3, cmd: FwsecCommand) -> Result<()> {
+    let hdr_offset = (v3_desc.imem_load_size + v3_desc.interface_offset) as usize;
+    // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared `fw` with
+    // the hardware yet.
+    let hdr: &FalconAppifHdrV1 = unsafe { transmute(fw, hdr_offset) }?;
+
+    if hdr.version != 1 {
+        return Err(EINVAL);
+    }
+
+    // Find the DMEM mapper section in the firmware.
+    for i in 0..hdr.entry_count as usize {
+        let app: &FalconAppifV1 =
+            // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared
+            // `fw` with the hardware yet.
+            unsafe {
+                transmute(
+                    fw,
+                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                )
+            }?;
+
+        if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
+            continue;
+        }
+
+        let dmem_mapper: &mut FalconAppifDmemmapperV3 =
+            // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared
+            // `fw` with the hardware yet.
+            unsafe { transmute_mut(fw, (v3_desc.imem_load_size + app.dmem_base) as usize) }?;
+
+        // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared `fw`
+        // with the hardware yet.
+        let frts_cmd: &mut FrtsCmd = unsafe {
+            transmute_mut(
+                fw,
+                (v3_desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+            )
+        }?;
+
+        frts_cmd.read_vbios = ReadVbios {
+            ver: 1,
+            hdr: core::mem::size_of::<ReadVbios>() as u32,
+            addr: 0,
+            size: 0,
+            flags: 2,
+        };
+
+        dmem_mapper.init_cmd = match cmd {
+            FwsecCommand::Frts {
+                frts_addr,
+                frts_size,
+            } => {
+                frts_cmd.frts_region = FrtsRegion {
+                    ver: 1,
+                    hdr: core::mem::size_of::<FrtsRegion>() as u32,
+                    addr: (frts_addr >> 12) as u32,
+                    size: (frts_size >> 12) as u32,
+                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                };
+
+                NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
+            }
+            FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
+        };
+
+        // Return early as we found and patched the DMEMMAPPER region.
+        return Ok(());
+    }
+
+    Err(ENOTSUPP)
+}
+
+/// Firmware extracted from the VBIOS and responsible for e.g. carving out the WPR2 region as the
+/// first step of the GSP bootflow.
+pub(crate) struct FwsecFirmware {
+    desc: FalconUCodeDescV3,
+    ucode: DmaObject,
+}
+
+impl FalconFirmware for FwsecFirmware {
+    type Target = Gsp;
+
+    fn dma_handle(&self) -> bindings::dma_addr_t {
+        self.ucode.dma_handle()
+    }
+
+    fn imem_load(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.desc.imem_phys_base,
+            len: self.desc.imem_load_size,
+        }
+    }
+
+    fn dmem_load(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.desc.imem_load_size,
+            dst_start: self.desc.dmem_phys_base,
+            len: Layout::from_size_align(self.desc.dmem_load_size as usize, 256)
+                // Cannot panic, as 256 is non-zero and a power of 2.
+                .unwrap()
+                .pad_to_align()
+                .size() as u32,
+        }
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        FalconBromParams {
+            pkc_data_offset: self.desc.pkc_data_offset,
+            engine_id_mask: self.desc.engine_id_mask,
+            ucode_id: self.desc.ucode_id,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        0
+    }
+}
+
+impl FwsecFirmware {
+    /// Extract the Fwsec firmware from `bios` and patch it to run with the `cmd` command.
+    pub(crate) fn new(
+        falcon: &Falcon<Gsp>,
+        dev: &Device<device::Bound>,
+        bar: &Bar0,
+        bios: &Vbios,
+        cmd: FwsecCommand,
+    ) -> Result<Self> {
+        let v3_desc = bios.fwsec_header(dev)?;
+        let ucode = bios.fwsec_ucode(dev)?;
+
+        let mut ucode_dma = DmaObject::from_data(dev, ucode)?;
+        patch_command(&mut ucode_dma, v3_desc, cmd)?;
+
+        const SIG_SIZE: usize = 96 * 4;
+        let signatures = bios.fwsec_sigs(dev)?;
+        let sig_base_img = (v3_desc.imem_load_size + v3_desc.pkc_data_offset) as usize;
+
+        if v3_desc.signature_count != 0 {
+            // Patch signature.
+            let desc_sig_versions = v3_desc.signature_versions as u32;
+            let reg_fuse_version = falcon.get_signature_reg_fuse_version(
+                bar,
+                v3_desc.engine_id_mask,
+                v3_desc.ucode_id,
+            )?;
+            dev_dbg!(
+                dev,
+                "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
+                desc_sig_versions,
+                reg_fuse_version
+            );
+            let signature_idx = {
+                let reg_fuse_version_bit = 1 << reg_fuse_version;
+
+                // Check if the fuse version is supported by the firmware.
+                if desc_sig_versions & reg_fuse_version_bit == 0 {
+                    dev_warn!(
+                        dev,
+                        "no matching signature: {:#x} {:#x}\n",
+                        reg_fuse_version_bit,
+                        v3_desc.signature_versions
+                    );
+                    return Err(EINVAL);
+                }
+
+                // `desc_sig_versions` has one bit set per included signature. Thus, the index of
+                // the signature to patch is the number of bits in `desc_sig_versions` set to `1`
+                // before `reg_fuse_version_bit`.
+
+                // Mask of the bits of `desc_sig_versions` to preserve.
+                let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
+
+                (desc_sig_versions & reg_fuse_version_mask).count_ones()
+            };
+
+            dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
+            let signature_start = signature_idx as usize * SIG_SIZE;
+            let signature = &signatures[signature_start..signature_start + SIG_SIZE];
+            super::patch_signature(&mut ucode_dma, signature, sig_base_img)?;
+        }
+
+        Ok(FwsecFirmware {
+            desc: v3_desc.clone(),
+            ucode: ucode_dma,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a3d96639706e808305cce66416778d2bf6e7e683..ad71402dbfced2aaa84800a32dbac276b9706803 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -6,6 +6,7 @@
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
+use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::Firmware;
 use crate::gsp::fb::FbLayout;
 use crate::regs;
@@ -197,7 +198,11 @@ pub(crate) fn new(
     ) -> Result<impl PinInit<Self>> {
         let bar = devres_bar.access(pdev.as_ref())?;
         let spec = Spec::new(bar)?;
-        let fw = Firmware::new(pdev.as_ref(), spec.chipset, "535.113.01")?;
+        let fw = Firmware::new(
+            pdev.as_ref(),
+            spec.chipset,
+            crate::firmware::FIRMWARE_VERSION,
+        )?;
 
         dev_info!(
             pdev.as_ref(),
@@ -243,7 +248,18 @@ pub(crate) fn new(
         let fb_layout = FbLayout::new(spec.chipset, bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
 
-        let _bios = Vbios::new(pdev, bar)?;
+        let bios = Vbios::new(pdev, bar)?;
+
+        let _fwsec_frts = FwsecFirmware::new(
+            &gsp_falcon,
+            pdev.as_ref(),
+            bar,
+            &bios,
+            FwsecCommand::Frts {
+                frts_addr: fb_layout.frts.start,
+                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+            },
+        )?;
 
         Ok(pin_init!(Self {
             spec,
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index cd55d8dbf8e12d532f776d7544c7e5f2a865d6f8..71846dbbd512b6996d9f3a3c76aecde9d62460c0 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -2,9 +2,6 @@
 
 //! VBIOS extraction and parsing.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use crate::driver::Bar0;
 use crate::firmware::FalconUCodeDescV3;
 use core::convert::TryFrom;

-- 
2.49.0

