Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29EFA68651
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 09:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7E310E037;
	Wed, 19 Mar 2025 08:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tX6xQxi4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6BB10E037
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 08:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XURcicEqMvKDfO3tx9BS6id/l4CqOJ7qglEBXgEQVy4l9O55CWLQ2LlYcsqCXc/8gMsXbYF5b+QX1Z/U1UXTdKKOa65+uDqA7apCILnJ3NQ4VmooJ/97VZkkyDfi/wfE3bhNrtpi56PMd7UdIw4FfzldZBpmb2a4RJFDwQfvjV/yzEHMPeYC2pxbD226ZSPStbwmQJpkIMvOux53OAeTZt5dAbvJAL/1zloEAcl8efzxBMX3ax2Vk6ev91bv8fHkdjez8nYa2BcYV28Bvy0OQsK7IwTH4gt73fjg5nIlBPt629wz+vOXrNmm1rTRCpknc+tIJkYjOvg2o9ggyH4DwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dfsXc7DEtf8jF7tSjXsUt80X/fXp5kVLJn3uRlyN98=;
 b=OdRb6xEdSb8ITN7PnT4rHcXBmQAX6hypMfB1Gjv32YMGRagBYRMADNdS4ksGhub61KwqDZ5zOBD2XkZ2+28csG4STHfI8/jX/C4lt0xIlTOe7yiGq1DWDziyouBk2yEmvHzV4PAI0HKh4IB1YH1YwSbQuAbDxSF+8G5/PmvJIDCjl1IBWGlU5Ah75KLfGigrZtJC2ivFMdx1x8Hy6T5AFyOcfaeCff9Ul4cGZ4rbVa+BFCJ0kH2FKRAFNWGoG4OT3QAimuTJDYHyd6h0jPyAkduq1GWikpMuy+EtL3ydhBJrygj+5R4JBkgM8QUowvKAnf3n6QiBKyXD6vI2/KtgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dfsXc7DEtf8jF7tSjXsUt80X/fXp5kVLJn3uRlyN98=;
 b=tX6xQxi4XQxQttmiT8T5M0BFzfmRtfN9a0vnuGg5BtG+Vs+wbNiJGfBM3skPzj7XrEOXJe1yrEY1FJgOHSOXrex+GCyNnZAZkbbRoBOAMrsYlSqt1/nOlLsvcZC4jqJGTIz6ZkWn5Bsot00ZRQWWPoyi67Lxi0OiDUQN165/weg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7865.namprd12.prod.outlook.com (2603:10b6:a03:4cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 08:04:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 08:04:49 +0000
Message-ID: <0d6f762f-a5c7-47e2-8fac-b946b090f2f9@amd.com>
Date: Wed, 19 Mar 2025 09:04:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/gem: Add a flag to control whether objects can be
 exported
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Asahi Lina <lina@asahilina.net>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
 <20250318-drm-gem-shmem-v1-5-64b96511a84f@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-5-64b96511a84f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 868b2580-14e5-4d73-a332-08dd66bcb8d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzJKbDd1aHllZDhEY1NyQVErMUNJM21ORlVSR0FscmZDR1JwcUxHL0R0dmVo?=
 =?utf-8?B?dUI3Y0VrcW1tQURVbzFXMmdhY084ZTY5N2dBbm14TVJPekl4OGJ6QW5PQTho?=
 =?utf-8?B?bWRIR3dEQTVrOEp3M2hVUFJiN1lYMXh2WmYzNGVFMTc1NzBSTU5GT2dLZGdh?=
 =?utf-8?B?ZVUwVGtFdFI5RjdrZkpwL09JMWNOWGcxTnk0U09kMzNKUGlYVzVNSS9MdmZM?=
 =?utf-8?B?MDBaWDNOZzl2eUNBVkloVlR5Q202WmtmeWZwVWdmb2t2TTZnWVVVQ3grYjlq?=
 =?utf-8?B?U2gxZ3JyU0IwdnV5VVlYQ21wbktnazliRm9ldHAwTmpJQlVya0ZrVEdRM1Zp?=
 =?utf-8?B?eTgzY3dPN3RReXhybVhmdGZjMHBnNDYycnQ1QVZmYmRMSkRNTnhzZjhKbUV5?=
 =?utf-8?B?eVZlZEU4L0pZYWRGZ1QzelV4ME1vNThMZURUdjhKVmtiV20xZDlqTGRWU2c5?=
 =?utf-8?B?OGd2bDVzci9KNWkzeXZEUkJxVVp6c01uRnNNNUhGcGhJYkNPalNnTVYrTzJF?=
 =?utf-8?B?VHF5QXBaa3JLZGNQYUtNMzlWbCtkQnJTWlNnVG9NaU52Ui9qNDRnTTh2enAz?=
 =?utf-8?B?SXUvOUlQdm9OczJlQjcweDRlV3BpRTZ3dERwZUtoR05FTnkvVnJVUFhOZlNq?=
 =?utf-8?B?dHJOK0JsS3U5ZDA3c0JxbWVhL2l0TUhCRHJoZldxTGNQOXFyMVE3UnNCVFFi?=
 =?utf-8?B?d3BFMHBXZHRUVzB4WU5LOHk4ckpOWmg0Nm5kMU5aNU1oZjNMNmhKbjN5YzJ6?=
 =?utf-8?B?LzE0L3JJZFNEVkRPc1A0MkN6Q3hBQnJYd3dxcGJ4Q2IyTFZoSmUyVGZxYTJM?=
 =?utf-8?B?ZmZQdnNyS2hIdkkrM3V3NWxGT3hnLzhPTGhiQ1hRNk5UQm1EeEc1NGxqS3E0?=
 =?utf-8?B?NjhmdExvNVdRS0ozckh1WlhkM1RnRXM5MGhlcUNIeVV6Zi93dHI0NzhlQkRv?=
 =?utf-8?B?SE4xcURuM1U5OTh3ZEhKR2M2Y1d2MDVNRVdrd1BjWFVuV3o1c0JKSyt2M0ZG?=
 =?utf-8?B?SjJIRFJzM2d5NWtwT0FYRmdWMkdLRnBSTnBpTVUrWWw1SDVaQ1lPN201Uk5r?=
 =?utf-8?B?K0hRcVJnN2NsQTIrYk1kQ0o5Sk5MdmVSVm1lem40S3QzdU5mR2xXZ2NxMk9E?=
 =?utf-8?B?cWd3RndEZUFvUTBxRFBrOUtsNlBkbFlKOGpKZWJwUXNYd3BSLzVzZmlJQndv?=
 =?utf-8?B?cGtZSk1UZzZ4R1Q3cDRCRk5DOGs3YkRzblhBcW5odnZaRlVnTWFKRzY4UVdz?=
 =?utf-8?B?YmpqenVjVE0zNkRtdTFibTh2QkZ3cGE0Z0svTnhORXdtQ3p4dzBITFFETEN1?=
 =?utf-8?B?di95MVR6LzNrUlB5NWd2SUlQSEdsSkkwKzcwU2JIc3h2Sy80Q3hUR0tlcVU0?=
 =?utf-8?B?Q1hTYm42M284MDUwTG4xNitta0pSRUFrTWJPK2krUEVuWTNQdDR3QTFJWmRo?=
 =?utf-8?B?RkJlOFhVQW9rT1JlaG9pNFFDajN6YXJNUDBHRTI3aE1vd3BkdFcvSjA4U1Uy?=
 =?utf-8?B?L0RtSXZZS0xKWjJ4NmlhMFhiSlRxV3FzRTUya1hCcHp0MGJ2c1YyWkI1dVBP?=
 =?utf-8?B?TFlPVUwvVWZqYTFUbVFkWU1PcERLL0ErQjFhYkphdW52eThuU3hZNmJRai9E?=
 =?utf-8?B?bFZacEVmRlBUaDdnRUZpRjQzenl2V3dtek1XcmpyRzFUVE8yUHlkSFlRamw4?=
 =?utf-8?B?T1F0L2NuRnYvSURGRi9yUElYaWN6bjlacTMxSlpWVnd6dlQvVHZSbVJGc2xC?=
 =?utf-8?B?TmNLUEtYbmc1V1hxcDlTN0hkalB2U1pldEJGZ1NCL3d2OTRQcmdtRVo3VWxH?=
 =?utf-8?B?TG1vTkdtSGxKL1VocitCd2RQcHQxL1cxUlNicVRRVHdKdndSQUFyVVg2VFZO?=
 =?utf-8?B?cDVrUFYxdi9rNHYvSlowUDVTTVQwZXBURVBtWVI4dmJCS3BWdHBaSlU0Nlp1?=
 =?utf-8?Q?5OwYRBBag6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUozbjJaY1RiUG8xVEY1bGVUT2Q2cDVYS0tac1UzdVFUWWhKNmkrNHB6M2ZX?=
 =?utf-8?B?TkdXdDJRNU9jZGFLRmI3SHlJTDQva0F0TDVzSm5zODVsMkc4TTdPL09FbGxU?=
 =?utf-8?B?V2hqeXdxVkM1OFlvZ1JTS2d2VWh0Q1E5L0tJVXBuUnVMeS9kdlVBbDNRRHgv?=
 =?utf-8?B?UU5xdUpZQ2ZhTzlGWURvaW9GTjlqSStCK2NwOWFidzk2NVdsVzcxQVlycDZK?=
 =?utf-8?B?OGt1eHpscCt5ZGFkUWNpU0xqdzlROElOekZjSVBpeTNwSkgxRjh4dFZvYTcw?=
 =?utf-8?B?RlgvWHpKeW5Zd0NTMnNhN1FwS0szUXZBMlJOelBwRXk5YWFCMTJWKzQrRXd5?=
 =?utf-8?B?emVDWFB6YVZHQmhHN2dxQ3dXSENhK3M4UjMrYmMwSGtKTkNWMHFLQkI0WTFa?=
 =?utf-8?B?Y3BSblh4YjhOU1BNSTF3SytGMXFzOGxOSEg2NnVMM0hWOGFSb1o1d3IyeTMr?=
 =?utf-8?B?eEhpcDg4aFRyNm9IWU16VjJkQmdjaWpHbEhoN2ROeFNZOWw5R0xJSGF1TVAv?=
 =?utf-8?B?aEtlTi9ZK3lHSXNzMi9SeEtOaUs4dkQxa3hLc3JQQUJRUHZNeWFVZVI1UkxS?=
 =?utf-8?B?MFBjZFpyQUVUdjQyNDc4dWZ5WjNMOEdHSWRvZGladWxoQnpQS2RENVQ3Tlhi?=
 =?utf-8?B?SWd3WlRUeHh4elZKVEw5S24vaXZRS0szKy8rVjB3bno2WVAxNWl3Wjd1azlk?=
 =?utf-8?B?aWJxelFmT3gzT01MQnVsOGc3RmRpNkhEZTlVUU5McENnUFBGRzlYd0xXeVRQ?=
 =?utf-8?B?enNabWYyd3Z0Y2FPS253ZS9QUDZMc3VYQlY2Q3YwbU5GaHkrZ2NCMmdhWFNj?=
 =?utf-8?B?djAraHNqMm1HakNpSWEvRkg4NEJ6b083Nk4xam50WFhmRzVHN0RqN2UrME9t?=
 =?utf-8?B?MG1pZHBGcWFyVXptTEIrOVFDTHNPZk85dDRpcEpmNE9LVXFwRTRHeVZVZWFu?=
 =?utf-8?B?anNidmdwUXFrQittSVhhZHBYekdmNmtwazc4NGFPMHNBK3hjc20vZ3J4OXpt?=
 =?utf-8?B?UUwrRnV1bFZSMUJ4Mmc0NE9Yamo0RmU2eHVZWDNQeFVzY1IvY2h2VzNyRzZO?=
 =?utf-8?B?YmEzNEdpTkk5TCtub0dlUFJldkQxNE1PZm5YMHVJblJQTmFVNDNHOWRXblg3?=
 =?utf-8?B?dCtUK2Jnckl5Z0VjWi9ENGsraWZ6cFlibXJ0WTU1TThVZTA0MWowMzhvMTBI?=
 =?utf-8?B?VHp2OHNxckd5djdoS3NpeWxDbjBhVDV4Q1pKdGtiV2ZuZDBiR2RhVnBGUkJB?=
 =?utf-8?B?cTVSOWdiQkZoUlc0aThkTkpSd1I1bU1VQTlFM0Z6M2NLdS9iNjFLQ0gzZXda?=
 =?utf-8?B?VW1aYkdaQkF1VGxsNStFK25MUlMreXhab211SUI2U2VkSXJUV1BrQmZzSGtB?=
 =?utf-8?B?T043M0ZZZFJDL2lxdW5BYU1HeVFYeGtLUmN2VHo4Sjc2SmxlM3ljOWRtMnRE?=
 =?utf-8?B?TkNXdlJPM3RUekhQMHVHZTBZbElrV3p0MDFneXI1WjNBWEZoTmt0akp5K0dj?=
 =?utf-8?B?dTBOMVpLbEdBOUYvRkhlbTNZU1NlQ25jU3R4OGZBVEpUMHlmSnNkT0FuVVVv?=
 =?utf-8?B?ZWp5WmoyMEFGa2lvcDhjZCtMRW9mRnBoQkVvL3h4TTFiT1d3YWVwL0txSjYr?=
 =?utf-8?B?OVVHWnhZcldVVkFTK1dXZlYwUThncGtzZFZqdFExQUp2ZHJXcUZnazRDMkZS?=
 =?utf-8?B?eE5PM2MzUzVWSEdlTXlta2ZML01RRTQ4ekVQUDhFTjJaUldsVTIwOEY3N0di?=
 =?utf-8?B?VlQ4R1JPdlFOSzRGVXhhbXZWRS9obkFOR3gzNFN3a1gxUVcyME1zWE4yeU1I?=
 =?utf-8?B?d0cvNWoyWFRSL1JFeVc1N0t6U3RhWCtkbFlHSnV4enhJMFR6dE0vYTNMR21E?=
 =?utf-8?B?MURFMTQ2Sk9pY3hnMW1jZGVOU3ZORWZuc0c0Vk1lZzdGWjZEYUdLbEthbkF5?=
 =?utf-8?B?MVBrZkU0Y3Y4UE5ZanY2Njh3NFNpeXBqcVhTZHVvQWpBc1JMdkxHL1d3azk5?=
 =?utf-8?B?T2wxanBJUm83MUJVV3BRUEtpbWYwV2Qrd2ZZN0xORE5qNlg3WnBzQTRHNDd3?=
 =?utf-8?B?cXBwQ2VheWsrUTRyb0FXeWhXYVpTUFVicDQxNWl2ZlhqN0phZVlUT0trRVBE?=
 =?utf-8?Q?ky30lzqsChmGX4hKtULj+Xz2D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868b2580-14e5-4d73-a332-08dd66bcb8d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 08:04:49.8323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAVjeUZQd9TXwWtAfCvMMpH7fKs8K0ZEKeKS22m2f8ciacSmpnSOnv/mJY3FJzqq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7865
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

Am 18.03.25 um 20:22 schrieb Daniel Almeida:
> From: Asahi Lina <lina@asahilina.net>
>
> Drivers may want to support driver-private objects, which cannot be
> shared. This allows them to share a single lock and enables other
> optimizations.
>
> Add an `exportable` field to drm_gem_object, which blocks PRIME export
> if set to false. It is initialized to true in
> drm_gem_private_object_init.

We already have a method for doing that which is used by almost all drivers (except for lsdc).

Basically you just create a function which checks the per-requisites if a buffer can be exported before calling drm_gem_prime_export() and installs that as .export callback into the drm_gem_object_funcs.

See amdgpu_gem_prime_export() for a simpler example.

Regards,
Christian.

>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c   | 1 +
>  drivers/gpu/drm/drm_prime.c | 5 +++++
>  include/drm/drm_gem.h       | 8 ++++++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ee811764c3df4b4e9c377a66afd4967512ba2001..8f998fe6beecd285ce3e2d5badfa95eb7d7bd548 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -195,6 +195,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
>  
>  	drm_vma_node_reset(&obj->vma_node);
>  	INIT_LIST_HEAD(&obj->lru_node);
> +	obj->exportable = true;
>  }
>  EXPORT_SYMBOL(drm_gem_private_object_init);
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 32a8781cfd67b82ece7b7b94625715171bb41917..20aa350280abe9a6ed6742e131ff50c65bc9dfa9 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -387,6 +387,11 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>  		return dmabuf;
>  	}
>  
> +	if (!obj->exportable) {
> +		dmabuf = ERR_PTR(-EINVAL);
> +		return dmabuf;
> +	}
> +
>  	if (obj->funcs && obj->funcs->export)
>  		dmabuf = obj->funcs->export(obj, flags);
>  	else
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index fdae947682cd0b7b06db5e35e120f049a0f30179..f700e4996eccb92597cca6b8c3df8e35b864c1e1 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -432,6 +432,14 @@ struct drm_gem_object {
>  	 * The current LRU list that the GEM object is on.
>  	 */
>  	struct drm_gem_lru *lru;
> +
> +	/**
> +	 * @exportable:
> +	 *
> +	 * Whether this GEM object can be exported via the drm_gem_object_funcs->export
> +	 * callback. Defaults to true.
> +	 */
> +	bool exportable;
>  };
>  
>  /**
>

