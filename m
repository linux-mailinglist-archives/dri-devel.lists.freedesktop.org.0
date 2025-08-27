Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86845B377BB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 04:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0749110E0F4;
	Wed, 27 Aug 2025 02:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I8DqSL8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D143610E0F4;
 Wed, 27 Aug 2025 02:29:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHLuMNMtkAOPswtugcT/rKu2zgPQdcyrkILx3iBD4J6vvWzeydAq/AAQ7q+DuGPGkrCG7589IB89uO4GacJvNZSnLfaRFXOIdZwArjGMrp4kj2L3EeujUBnD9dRyZyLEcnD7iG0SfisCxlfsdIvFacgaOPkuTxe8WTdOuLOX7cJeAV0Ab26NnkFrZYWfI4VdVNccunSTyLmw3mtGTHiqH+jzPm1/MMLsKKwwWm2v+a4z/2VQWoI+sK0vKv3sLXmpRFDIWD85rwy3tRKuzQ4FfTISt4LGf3SJUKQwOuvlEXTKFiKj4v4UqvpnE/f186xR4QJl2bvAhJ6LixguVIOq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/pb5fBmoRhwEOO3IDrNjU3FsHGxN7fRQMg58bhPKk8=;
 b=utVDjpJeALPm7rZbTqjmdNvJ9gKNqkVZLIGdSnWYn/V8CFP97rswpTihKMhoceiUOT8LGweczpbbpNX4J8bb0tnQg4DPJqFCLGnhqIZyjdA8rVKCfQe02BcyMlFR6N2gScgMRTggE+KxzHeB1pLONyGxH6HT52ybu0MLyTYdgZ4bFC8fH07dwoHZ2wzfIXqE+5tvduWK/K2xkzpSUnYDr8TvP5AULHfHX3cQV72Og0bXBiUGmHY4itjkujRim47KWAuq9ORM6PeUH5hZAH9bpjhwihWBnZKLA2WAGeDE4A4e9gXtwEz4BRM2AybjUl5FdYF1AlyKC2wF8UK/vgOUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/pb5fBmoRhwEOO3IDrNjU3FsHGxN7fRQMg58bhPKk8=;
 b=I8DqSL8BYfG7HPaH6gds1GJfbBkyMpV8kWVryhBEU8Odl92bUxdV+RUip0TmxsGdm+EpWho07awe/0TcgjFQ+fvAFdzJPENanhvBRkWok7lK9r2zYXt0Wglcq88olbYOKx0jgLVao8dqknhAr5rNBJIi6wyjzAVBoZjY+nvga9/G8VtwBfu+xdIJkfxFNUVxQoOxpdjYJoshZd/Cm4I5RrOjWPRauaBL+nJ908GhCBU0oXuZxTeC1cm2JgxvSfdtMuFlF85MzDKFanOheU0vq4r2u98VeNqMoxrPeVc5PR2XWlu0wy2yUabY9qdKQGmoAqjZyzRHn7pb2hKr3pAfDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DM4PR12MB6009.namprd12.prod.outlook.com (2603:10b6:8:69::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 02:29:53 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 02:29:53 +0000
Message-ID: <a9467dd4-6551-4ef2-b231-02d7696e2d8f@nvidia.com>
Date: Tue, 26 Aug 2025 19:29:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] gpu: nova-core: firmware: process Booter and patch
 its signature
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-3-93566252fe3a@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-3-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::16) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DM4PR12MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a55ad6-5128-4d06-bfab-08dde5119a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2ZiTDVwY0YrN0RaYmYzTHZmZi9wMEhFcGZqcmdPV2VvUk1CUW1vZXFFV1Vi?=
 =?utf-8?B?c0w1WEliUHdKWUNtd0JLd01rZzQxT1kvQm5hNWprelRnVkhlZjgzd3dJN3ly?=
 =?utf-8?B?Si9lMFNSMmwyR2YvS1phNG5LZUFjbDBRRVN2ZnZESzJ6WS8yd1BuZ3pjQUJ4?=
 =?utf-8?B?S1VEcWZCaW1wNWxzS2c0VVhqVGFyQjVmUy91dkI0Y21uQnNTaWFodm9GU2tm?=
 =?utf-8?B?Zmg1Q29ob1NOWUlwWEFiR3JSRXViVGQ3c2ZadmF2a0ErNHFHVzhPazEvWndv?=
 =?utf-8?B?cXU4c1FJQWFVZFFGWTVVYVBVT3dkTU5YV2hhSGp4S0JzOHBnQ2g2WVg4Ynhk?=
 =?utf-8?B?QVlUZCs5QTZiL2sxL2h1MTlEU3ppczBzb2Z5bVdzWTJLTnZFYUJ4TDU0V2l5?=
 =?utf-8?B?Q0cwTTIxNWxpSEl3SGd1Q0dDL3o3bDV0Sk80NzhIay9QSDJIZ0VKZXV5UXFy?=
 =?utf-8?B?VHIxMDVjaFVRa0JoZG5Ed2VMZ1NBS3B4d2xoV25VckJkcFpkeDd6VXFtUVZN?=
 =?utf-8?B?S1BFVVpEc1ZzRmFVdHVwRDRmZVJEbEU0RXhuM2dOOXpjb0dWOFRudWYyR2dL?=
 =?utf-8?B?YUtVRDFJRkxKV3U2cW5xNk05UzA1Ti9HOG1rTUdPYi9hcHl3MURXa2IwdUhE?=
 =?utf-8?B?VGNKRDhISGNtYk5GNkR0N2NEdHdvb1pnT3ovbjhISCticzU0azZnb3JPem1Q?=
 =?utf-8?B?dzB5UlBXeGt0R1hkcUx4VmEzM0ljR2hOdWVGb3pyMUpNL3piZFZEVVIvRHZJ?=
 =?utf-8?B?UDRBVTBvaWtTWjY1TGtmZDlnTmMrY2hLUVFZTnVuYkRMZFI3dXd0QTUyZVZW?=
 =?utf-8?B?WGoxMUc1d1JsWjJqditiK3YvbUxBRUd2YXFkTWJ3dGFOcmtWOFg4eFpKK1M0?=
 =?utf-8?B?cWN1bjVtd29qYUJ4RHBiV2x5dTIwRld6eUJzUWhLYzVyZ3dmamlYWVZRNGVD?=
 =?utf-8?B?RzB1WlBRQUZqd3k2Q1RMQklXSEVET0M1UUF4RVQvdHV5Q0gzT3NVNmw4MTVI?=
 =?utf-8?B?aUZvUFJ2Mmw3WTVBSDVpZG96ZklHRjdJL2swN1dOejVxR1R6RHZOcjNqK2FN?=
 =?utf-8?B?Vk54aHRBT0I2TTBSQy9ZaStSRUN5ZEdMVzRkK0xZODI0S29hZ3dvWEVtTndt?=
 =?utf-8?B?ditwcnN3ZVFGNU1sbnNrcDFIaVRTR0cyejF5SUk3OHFlMkZ1N0hGUm56Smt5?=
 =?utf-8?B?RHJCa1ZtQ044M3FKekR3R2xVQTVpZlFCUXZYSUpSYTFTWm9HZmlZWDJXUmVG?=
 =?utf-8?B?Rm1ObjVNSm11WWJlZzBYMVpWSGpZZG9aNE9xazFJUUkxaXk3L0hHV2hHaVp0?=
 =?utf-8?B?RCtReVNQS3FaWU9DRjEyNEdyU3MxdlQ1dDdZYTUvYXlYdzBPSEcrTTRBcWc2?=
 =?utf-8?B?bFNyODNaeFdydWdxMG9IZW5oUm9td0RwcUhKdVhIVGtLcEZzRTN5Qy9JNTAr?=
 =?utf-8?B?MEhwUFR3b0lkanNWM1pHN01VaUpyRWVTckxYaHI1OVNsczBpZFVxQ3VJYndv?=
 =?utf-8?B?N2lvcVo0NzFqYzhhd2JrUTZUMGFIUlA1cmVSbWd6TWJyTmhDaWxzVWZ0RHpF?=
 =?utf-8?B?Q3liUWVyQ21sWFdzMGFWQ2Fsc3lCSTh6cTBEYXdlTDhSdDRGM3AxZTlYN3ly?=
 =?utf-8?B?ODdGZ1QvTU1FV3U1ZVJva3RCdGl3d1ZmZHB3SEZoNjh6L2ZDRTJCSW40WDhI?=
 =?utf-8?B?WWltTmVJdmFvV3ljK3VtRVZ2dU1BcjlJeDdkWmRDRWhyUGxPQThmczBiMk5w?=
 =?utf-8?B?Zk01bG1jY25JR2ZXTFQ1MGNYWTk5TzNSODJHMUs2VWYzbEV6dXphV1hlZ2pD?=
 =?utf-8?B?RGJTRXV3bG5oNmF0dFBZQXp2bU14RFRIWHc0RGJCWEN3K0VnajJiTHZheXRP?=
 =?utf-8?B?RjdMSnNYVmFxZTFvOEZLc2xndXkvZlIvNGZQNVdQNlljYytwWGhhV0x2S01V?=
 =?utf-8?B?c1NKdy9hZ2JQM0EzNitnYWRHM1pQMmNlRGh2UmlKVGtEY1VCOTRuMTAwWFlq?=
 =?utf-8?B?aG0ydFdoL0tRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aENGeERET2JNTktjcEhySFpjMnRCbVVqbzNBQ3QyaUxlVEY1NmR0SVkvZWZp?=
 =?utf-8?B?NzVldXpvcVJUZG00NnRrTDJoQ1N3MFo1eHdGbW1UMGI5VHV0c1FDdlM4dTBw?=
 =?utf-8?B?UkY0Q1pncVJmUkEyN2pIaUR0cVQ0Y0lyUzdzSzZtdEJvVDJQTnpXQXVkaGQy?=
 =?utf-8?B?VExRVlVHdk1BSnJWcHFSR1k5Y04zSjJESldaQ1BEeFUvc0E5TlNTWjcxY3Jn?=
 =?utf-8?B?LzJPSVlVVTk1VTAyWHVDNWpoZEZhNzQwb2NacWpWR0NBdGdIRU5sNWZGL082?=
 =?utf-8?B?VGMrelZCUmFyMVVJVTlMaUZqSDE0NzFKR24wcEpuUCtPbFpCcU5mVFJ6RUhO?=
 =?utf-8?B?TFBtcThIUTg4TlprQjJKeEpSdVZsT01USys4MlM2dENMa0gydzNWdkdkdVAz?=
 =?utf-8?B?aHhISWFQWnQ3My9zcVdhS3gva0RXVWlSRkZSUVA5YzdzcHFCT09GRFVWNU5P?=
 =?utf-8?B?NkRyYnVPc25ZdVVHVWZCNDFLQkJ5U0FEYnNhZm9COWw1U1o0dUhReGRENjFh?=
 =?utf-8?B?VmpnUTNnVUdUU0puZHluSnVUTmRjSFVsbzY4MGd3Qkpla3lCQ3l2RnZnOGpj?=
 =?utf-8?B?WFd0Q0orVS8zS2xQSkJGeVdBM21kSjMyUXozQkphdGtXcGlOaStHUnNxZFVW?=
 =?utf-8?B?L1drTUN2Y2lnYkpYZ0JIOHo1ejYwcll4RC85ZjlYRmhKNXVJclZ0dDlLN3hB?=
 =?utf-8?B?b3ZJV1MybXdNNWRaRkdDTXV0Z2JCb1pjZ284SDREcmFQbUY0K2xuQmU2aWNr?=
 =?utf-8?B?dlNNZG5UZkNqTVkzVWZwMzVKK1l2a0V3WkFzSXM2Z3pyVndEQ0xtMVQ3RHlX?=
 =?utf-8?B?RVVaQUVLaWU4K0h3SGR0QTVtQ3hUaEZoTzdzS0NmcWNyM2hZRWtiTk42a3kr?=
 =?utf-8?B?UnJaa0l3NjFEazBrWHlqZENMOStYOHhnMmY5STFuYWJWUHRLRmI2TmFpQXdl?=
 =?utf-8?B?UzhXTWNpQ0JPMDBjUE50bWdOY05ydjJhUnpabkloaFdxdG9ZdVZpWlVxVWFS?=
 =?utf-8?B?M3RlYmJzYjNwWUsvKzNSYzJWcmR3ODVhNkZlQ1g2SGtaTElqNzVFMG45amsz?=
 =?utf-8?B?UEhhM1ptV2MzUW4yd1NmeEtRT2F3TXRFMXpWeEd5TmQyb2o2U09CRmtpRFBn?=
 =?utf-8?B?MGFPT3hHQkRwZXVWWCtFN1dBdWNORmxaTzl0ZjhQcHI2cWdvRFZiV2k2akNW?=
 =?utf-8?B?cTBJNGNSVHhUWWFncEdXVE1KemhDdVhseWtneUpJRllLUlBobTNFZG5HTTZm?=
 =?utf-8?B?KzgvTi9nTmZ3eUdVckQrTG9YcExCV2w2RnRRaWZidEZ0aURVWlBjdlZmQXJT?=
 =?utf-8?B?YmlmdVVpb1VFNUJLWFlNZmlhMUVoWjlhVlg2cnB2YVgwdERCYXJ0NllmMFh0?=
 =?utf-8?B?UXUxTE5hanRINkhpc2QxUlIyVUNNKzBTTVpQZjNxckZUeTd6KzdGSlNJN3RX?=
 =?utf-8?B?Tk9WMUNxbUtTVmVWczBIajJCeEN3ZThWQ0JTSmNCYUxtL0dJSnBsM0M0Vkhh?=
 =?utf-8?B?QVFxN0pLSzZRZ3pmdmRmQU9jTFpOMjZBRk5YVTVhVEloS2xTemI1bHBDelE3?=
 =?utf-8?B?UDdudis4ZE1McU9qbnBDQnIyaTl0QlR3WmhXeUl0NW5IRGh0TitlSkQrWFdI?=
 =?utf-8?B?SmxyTDFRd1ZPMis3RGhTdkZHanVzMERhYVJzeUVXTkRBSWM1S3NXRWxQSXh3?=
 =?utf-8?B?WVNSajNMblRwZzgrMm1jTFFFTXU0R21OTXlPdnNQTHVQUTFMV0xJQ2g2UThJ?=
 =?utf-8?B?UnZWQXVZdDgwSERpWEJTeFJJSFY4eW9HT0tGYzY5NGIwY0lLMEVVYW83U1FF?=
 =?utf-8?B?UEVlZDJ0Q2tVRVJheHpZeFBQVE9vdUJTcVBCcjVVbUFpNVNLVFdQOHhkcGxn?=
 =?utf-8?B?bGIxWk5Sa0NsRUdGZzc5TWcxOFVTYUlqM2RtV1JKejg2RnNiNk1RK1h6c2Yr?=
 =?utf-8?B?S3N1QkJLMzM3OE5NNUxKMk5QOThsRU5LV3ZJUlJrVGFiRXVCU01Vam1LcXgy?=
 =?utf-8?B?ZVhUc2RnTEwxcWJ5d1FKV2VLSGhWS1YyaWNyT05DSjBVLzM4K21kM21uU2dT?=
 =?utf-8?B?ejRBY2lQNTZMZWFNSzR2NFdWR3FZdzZ2QWN6cXlPUFo2QlVDcjFYSko1RGJv?=
 =?utf-8?Q?jGWGXj3eX489v9Ty7sBGooUmj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a55ad6-5128-4d06-bfab-08dde5119a8d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 02:29:52.8850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1Cl/Dx6/RMvv+cv8W0/OjwagMkKE9dPsh3PfV7NwdcoKfewUaX23/4k2XdTAyuj5PQ6chp7K4RLPatkpR2QOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6009
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

On 8/25/25 9:07 PM, Alexandre Courbot wrote:
...
> +/// Signature parameters, as defined in the firmware.
> +#[repr(C)]
> +struct HsSignatureParams {
> +    // Fuse version to use.
> +    fuse_ver: u32,
> +    // Mask of engine IDs this firmware applies to.
> +    engine_id_mask: u32,
> +    // ID of the microcode.

Should these three comments use "///" instead of "//" ?

...> +pub(crate) struct BooterFirmware {
> +    // Load parameters for `IMEM` falcon memory.
> +    imem_load_target: FalconLoadTarget,
> +    // Load parameters for `DMEM` falcon memory.
> +    dmem_load_target: FalconLoadTarget,
> +    // BROM falcon parameters.
> +    brom_params: FalconBromParams,
> +    // Device-mapped firmware image.
> +    ucode: FirmwareDmaObject<Self, Signed>,
> +}
> +
> +impl FirmwareDmaObject<BooterFirmware, Unsigned> {
> +    fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
> +        DmaObject::from_data(dev, data).map(|ucode| Self(ucode, PhantomData))
> +    }
> +}
> +
> +impl BooterFirmware {
> +    /// Parses the Booter firmware contained in `fw`, and patches the correct signature so it is
> +    /// ready to be loaded and run on `falcon`.
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        fw: &Firmware,
> +        falcon: &Falcon<<Self as FalconFirmware>::Target>,
> +        bar: &Bar0,
> +    ) -> Result<Self> {
> +        let bin_fw = BinFirmware::new(fw)?;

A few newlines for a little visual "vertical relief" would be a
welcome break from this wall of text. Maybe one before and after
each comment+line, just for this one time here, if that's not too 
excessive:

here> +        // The binary firmware embeds a Heavy-Secured firmware.
> +        let hs_fw = HsFirmwareV2::new(&bin_fw)?;
here> +        // The Heavy-Secured firmware embeds a firmware load descriptor.
> +        let load_hdr = HsLoadHeaderV2::new(&hs_fw)?;
here> +        // Offset in `ucode` where to patch the signature.
> +        let patch_loc = hs_fw.patch_location()?;
here> +        let sig_params = HsSignatureParams::new(&hs_fw)?;
> +        let brom_params = FalconBromParams {
> +            // `load_hdr.os_data_offset` is an absolute index, but `pkc_data_offset` is from the
> +            // signature patch location.
> +            pkc_data_offset: patch_loc
> +                .checked_sub(load_hdr.os_data_offset)
> +                .ok_or(EINVAL)?,
> +            engine_id_mask: u16::try_from(sig_params.engine_id_mask).map_err(|_| EINVAL)?,
> +            ucode_id: u8::try_from(sig_params.ucode_id).map_err(|_| EINVAL)?,
> +        };
> +        let app0 = HsLoadHeaderV2App::new(&hs_fw, 0)?;
> +
> +        // Object containing the firmware microcode to be signature-patched.
> +        let ucode = bin_fw
> +            .data()
> +            .ok_or(EINVAL)
> +            .and_then(|data| FirmwareDmaObject::<Self, _>::new_booter(dev, data))?;
> +
> +        let ucode_signed = {

This ucode_signed variable is misnamed...

> +            let mut signatures = hs_fw.signatures_iter()?.peekable();
> +
> +            if signatures.peek().is_none() {
> +                // If there are no signatures, then the firmware is unsigned.
> +                ucode.no_patch_signature()

...as we can see here. :)

> +            } else {
> +                // Obtain the version from the fuse register, and extract the corresponding
> +                // signature.
> +                let reg_fuse_version = falcon.signature_reg_fuse_version(

Oh...I don't want to derail this patch review with a pre-existing problem,
but let me mention it anyway so I don't forget: .signature_reg_fuse_version()
appears to be unnecessarily HAL-ified. I think.

SEC2 boot flow only applies to Turing, Ampere, Ada, and so unless Timur
uncovers a Turing-specific signature_reg_fuse_version(), then I think
we'd best delete that entire HAL area and call it directly.

Again, nothing to do with this patch, I'm just looking for a quick
sanity check on my first reading of this situation.

> +                    bar,
> +                    brom_params.engine_id_mask,
> +                    brom_params.ucode_id,
> +                )?;
> +
> +                let signature = match reg_fuse_version {
> +                    // `0` means the last signature should be used.
> +                    0 => signatures.last(),

Should we provide a global const, to make this concept a little more self-documenting?
Approximately: 

const FUSE_VERSION_USE_LAST_SIG: u32 = 0;

> +                    // Otherwise hardware fuse version needs to be substracted to obtain the index.

typo: "s/substracted/subtracted/"

> +                    reg_fuse_version => {
> +                        let Some(idx) = sig_params.fuse_ver.checked_sub(reg_fuse_version) else {
> +                            dev_err!(dev, "invalid fuse version for Booter firmware\n");
> +                            return Err(EINVAL);
> +                        };
> +                        signatures.nth(idx as usize)
> +                    }
> +                }
> +                .ok_or(EINVAL)?;
> +
> +                ucode.patch_signature(&signature, patch_loc as usize)?
> +            }
> +        };
> +
> +        Ok(Self {
> +            imem_load_target: FalconLoadTarget {
> +                src_start: app0.offset,
> +                dst_start: 0,
> +                len: app0.len,

Should we check that app0.offset.checked_add(app0.len) doesn't cause an
out of bounds read?


> +            },
> +            dmem_load_target: FalconLoadTarget {
> +                src_start: load_hdr.os_data_offset,
> +                dst_start: 0,
> +                len: load_hdr.os_data_size,
> +            },
> +            brom_params,
> +            ucode: ucode_signed,
> +        })
> +    }
> +}
> +
> +impl FalconLoadParams for BooterFirmware {
> +    fn imem_load_params(&self) -> FalconLoadTarget {
> +        self.imem_load_target.clone()
> +    }
> +
> +    fn dmem_load_params(&self) -> FalconLoadTarget {
> +        self.dmem_load_target.clone()
> +    }
> +
> +    fn brom_params(&self) -> FalconBromParams {
> +        self.brom_params.clone()
> +    }
> +
> +    fn boot_addr(&self) -> u32 {
> +        self.imem_load_target.src_start
> +    }
> +}
> +
> +impl Deref for BooterFirmware {
> +    type Target = DmaObject;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.ucode.0
> +    }
> +}

OK, so this allows &BooterFirmware to be used where &DmaObject is expected,
but it's not immediately obvious that BooterFirmware derefs to its internal
DMA object. It feels too clever...

Could we do something a little more obvious instead? Sort of like this:

impl BooterFirmware {
    pub(crate) fn dma_object(&self) -> &DmaObject {
        &self.ucode.0
    }
}

...

I'm out of time today, will work on the other half of the series tomorrow.

thanks,
-- 
John Hubbard

