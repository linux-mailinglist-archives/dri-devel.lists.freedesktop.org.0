Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5BFCC0A69
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 03:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB5810E64F;
	Tue, 16 Dec 2025 02:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WiPq7+Md";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4FC10E406;
 Tue, 16 Dec 2025 02:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSQ+FYRULkxW9K1owsQsAT9GFo5Q32q4dD84ZkRvH55hDCgutOGVDqUCNCQvlQrZOzH10iFeQ8A7Y5w+KT5on9bLl66i4umlAbybqvRR0WeDcIvdYQt0feLjhvEgOdujHb2MvMnfR+6OKfBVkaLY+RtBRZ5fZBFLoTk2mcyBeEeF4jzVSpm0sTqZogNM5doL7yjjJ54A0Qvzz0HiwH1z/ewZ7vZMxs/dyb2LdVEBe/zfi+QNos+zLfk2IrPea0gy6f5Sl4BWAeL5kDAtFJBT3nFBObOnoLJM4tjAanyGCo1+vrSI79TCecd1KX5uz7ftnFSgt50bKSgUaNjEC0utLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZI8Gb+TvFO+uvMMwnvuXgZaZrxvSQEC4Pdp/MlHjzbE=;
 b=g7ZexFtlid9mxFQEiuudegSDmJBYmYc73mblthvYC24jQQAVESCnDqYiRNZDd8J4IGQMy2EMDIdLRydvUP86mq7Pg1xjGhBjrhZ38htlyjzP3QV+MVONIlV5oJXRLH8gq3RiHLBtXn265weaSgSDFl1KHUWu4lR/oyOOha0P36Z9eAab0jOaLZEWgFBLBAZ6yU+vbH4+8HXqZ6qy0Zqzj6a5n/19N4CqjEcaQYraGLccQvyp54XejhDX3q5VEX3L5S68lV3Ojmo6oaSiTpnoPlPX6ElF/hyo8SsQcl1qjbTOaT/gNgf2pm01OcuvBX9BqU0mHu5tFVHzOr4gOZRtoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZI8Gb+TvFO+uvMMwnvuXgZaZrxvSQEC4Pdp/MlHjzbE=;
 b=WiPq7+MduAzHH6QxXbAksfskmIbCDPdA7CaN0cz8BQ2PrKhIc27Pv6j8CaSwWJsjdo8h1lSHWD/w1Z5zN9AleWb7HjTsUJh7igfC0xaPE+Jr/25s5bT20Ulx+ibWX+D75PF3LtkoTMFNepH7JD6d2VqFLZg2WjXCsrIc5q4d6cZY3TpKdp9c8zTIfYAw97GU1r+a01uTgjOrgv3prXTYTtm5TQh3LrbXILwtY8Ks4tJ/WvI/EXdSXL3APCpua2oYymcAg43yUciKLdyOYXHUnWP7pUosOUId9zE1pye0jpwno9FBA5bJO8MahE3jLxNd4BEf0EmUMHs8yxW/z0VDRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:57:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:57:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 11:57:07 +0900
Subject: [PATCH v3 1/4] gpu: nova-core: bindings: add missing explicit padding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-fixes-v3-1-c7469a71f7c4@nvidia.com>
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
In-Reply-To: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0142.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b541eb-23e2-4b96-ea19-08de3c4edd36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3AwcnZhRVF4SXN4T1QwTVU2M0VaeGZuN1l5SnN4a21UTVowdlRIajlwR2s5?=
 =?utf-8?B?OElsNHZYTTU1WTVRTHpuRkhZNmdaazVhd3VBME9jMjZ6OG5sRlZOaGk5KzZx?=
 =?utf-8?B?VGczU0srRFhEWkgxd0FiL3lUeTRHY20xdDRwb0ZGeVh6b3B1aENtY3dvMjVM?=
 =?utf-8?B?aVh0WHFnWVRyN3lJY3NCc1duWE90Qkl0ck9PeDY2MGdVYU9ZdnhtYVJ5cGN3?=
 =?utf-8?B?eFFYayt2QVZ1aWE1N29IMTlJY2lwd0RNQVYzZHQxQ0hrWmFYYis4MVBOMGpT?=
 =?utf-8?B?VFRZQXh4b1JmZENKL3BNZDJ1U1RrOXNvOVppSFlaWURidUpUMW5Pc3RhOGU2?=
 =?utf-8?B?R3ZicXRib2hCWDNXeEpxK0pUQXpNaHVja2tNUXFwTkdzVGN3b2Z2ZFo4NTgr?=
 =?utf-8?B?cUZ6QWVwbEJ3elA1WVZCRVFrVnlCUGVCSjlUSUZwblYrSUcwOUZDM3FjQjg2?=
 =?utf-8?B?NjIyK1hoYi9KK1Q2U2RDZTFuQmttMko0TEJUa0lVSnJQaTZuem50UDRiRVA3?=
 =?utf-8?B?YmZLS2MxNzJTSCtxd2kzaGpiUGY2MmUybWVMbkE3WTZEMytDeGRqM1NUU0pm?=
 =?utf-8?B?MjhnbTRHNlN4cEMrU1lFREtmSE9OTXJlcm9XbG9YY1diL3pLWW43aUZUTnll?=
 =?utf-8?B?U2M3bDZrb3VvN3JhY09IY2Z0cXd1emN2UXFHSzQ1bVRjL013cFlJMnNYMDl2?=
 =?utf-8?B?MllnWXNMcVc4UkxwaWJzUUtGeUovZDhVaG1aaC93YjFXakVXekIreXV0enYr?=
 =?utf-8?B?MFYvKzk3dDUweWlwSURpakZOeWdSR2pFdDBVN21SZVNxaittVUVzcUkwWEdM?=
 =?utf-8?B?QVNway9HL2lFZVd3c3YweU1yWFBsQTU3ZUZYS2ljSC9lVkRPaXRPaDZsa25C?=
 =?utf-8?B?SGExOFlLQVdIc3hSbEs1RjdQd0hUTE1Valp2am1VdUV2UmVrMkswY251WDla?=
 =?utf-8?B?SGtKamtSZ1AxRmJvbHA4Y0RqY2FoVjZQR3pYckp0OEF4WGlsdWVsOWd4Zk5w?=
 =?utf-8?B?UldRZ1NFYWFGNU9yUmpTc254YmttZWQyR29aMTRDZDhWTGQrQzhCMjVmWW5y?=
 =?utf-8?B?ZE5yUzV0SWFBOEtzWXN4MnZVa2FoQzNBOUdpSklISjNobEs3TjVGSmYyTWxF?=
 =?utf-8?B?aTMrSDFFM0JHWE40cTNwaG14WDV5RlN1anRZeWNjdU1aMys3U0JkaDdIRHla?=
 =?utf-8?B?bm1aWTV6aDVFeUFvSEJkSGpobmEweUxMWmRhY2ZLdWo0NFNmczU1RXdyR0tw?=
 =?utf-8?B?eHBuNDNpeHZ3ZUJGakpJUEZsN2JjMk1WUXVveGQrK0E0NjJoYW4ySENVWWVx?=
 =?utf-8?B?SUNITEcrY2FCWmRnVTFoQ1NOQ3N0TEd0ZW12djVWWndZdlExMnhKeFlobEFu?=
 =?utf-8?B?MWFYOUtMckhXSnZnejVFcUlXd2k1Q0ZMcC9OUTlWYVdQWjliaGFBUzBOTEsz?=
 =?utf-8?B?SVlEY2Z3Q1dLVDJhUFFUanVDZG1WeFhmVVREQW9OQUYvYnZ6MDR3VVg3QzFt?=
 =?utf-8?B?cFF4TjFVay83UGJKYlgyT21MVEFmRFBHd3paNUFvR0czdTJ2MjJ6ZkdZRnUz?=
 =?utf-8?B?emtwTFBjSTZFbjNnKzJXZmgvS2xzM0d3OEEzQ213ZDRPSjNtaDcrYkZweW1o?=
 =?utf-8?B?N1RFWGErSENsQStWUlhYK3BOaGR3eWR1VzNneE11MUtYQTFoMVQwbzlia2hV?=
 =?utf-8?B?MCtiWTVHdUJoakdxTlpWWTlTbG8xbGpRL2Niem9CeEo2a2pqdXdwYWhXM1RB?=
 =?utf-8?B?TFJqQXBxUkpXRUJ4NnQ5dnBKdkJyVkxkWVhsbFZ6dStaSFBmUmRITmpmSTVN?=
 =?utf-8?B?SnRXcW1SRGEzeWFIbFVsTWU4OGpjQ3dzYlFMYUlHNU1rdVp3KzNNNjkxQkhV?=
 =?utf-8?B?b1JKc1pHbDdTUDRYeERJZC84alhldjlVak9HN2cyR0tiaXEzTEJiZFQ4QzBK?=
 =?utf-8?B?MUh1RDROZCs3ZnRGMWdTUEl5Vis2VDlxd0YvMmdJRkdiNHNGamV1NTRVc21N?=
 =?utf-8?Q?rStExPPylVjte55ebP4Ky1Hf9CcqA4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWYySXRjNHRNSjFjTVNzV3hucnhsaHZtNXB3LzFwU0tuTkd5ZS9KRmtleGFX?=
 =?utf-8?B?RzFDUHJCTUVEYlE3SXhVZ1RpTkV0Wk1WazFJdUFCc0w5VGxNc1RJdUFmdGxM?=
 =?utf-8?B?UEVqazZlcXM4UUZDUzBSR1ZOY3AzcGkxa2xnZ3JjYkxkQllURjhMNUsyWUlp?=
 =?utf-8?B?RkVtU1ZTcnk2VDhkNHR0Q2t6UXRMcWVORVdyTzRFMXJ0Z1RpQ0JFTTUzUFF4?=
 =?utf-8?B?Smdrck9RaGhRRDMwajRyK1N4WkJyQ0QxQmdWNmlOQjZIVnVWbUN0bVdOQy9S?=
 =?utf-8?B?bXJFb2lITHNsdElEcWw0b1d3RklhSXQxb1BRUDIvZDBETjVPaTBaWDJCcm45?=
 =?utf-8?B?b0hVRXdYb0YyQnc2N1JsSUtjMUlKbTk2eEw5U0FQbXdvOGIraDlaMkFVWlAz?=
 =?utf-8?B?WFB2RTBEbmR5aGE3WlR4RU1LTXlSUzA5b25SUkFsYzV5Rnc3Mm9kNEpTMUVu?=
 =?utf-8?B?S3QyWmhFR3VSejA2VlN5SEFQekFOcWVJWmQwMXZoM0hIN0ZvZy9tR3R2UEEw?=
 =?utf-8?B?c0t6Nm9WRU1XOERPOFE2OThOb0F1Uno1b2czNk5lQ1RGckRiRDFUQTFNSGFk?=
 =?utf-8?B?QmhGMXgyUlZHNlI5L3BSYVBTS1hlTVpocm5PaDhSZnhKTDlUUFh5L2VxM3ZL?=
 =?utf-8?B?RUhWZklicGFjZlFiZk1ZejNmQkp1bVJzQWhUam9ZL3pjOUxpVEZTRDkyRkpa?=
 =?utf-8?B?M1VCc3ZQVk13K0RWTC9YeFpMZDZkWUkzNktPOWNEbzhNY1g5NElXbnNiUWQ2?=
 =?utf-8?B?U1ByTndLdjR2Q0ZXeHRxTjlWdGcvWGZsK3lwRlhzTk95ckhBTFNHOUJrS3FI?=
 =?utf-8?B?MzVCNHAyY1ZHR29UNWNDNXdoZElsc0JURDB6d0ZabURNY2IrTCtjSEx5OXNh?=
 =?utf-8?B?cWUra0RqVGU2TTlWV1ZJdXA1RWREdmxra1J0aU00eE9GYnJ5WnVJcGFOcVVk?=
 =?utf-8?B?SnVOSEw3UERWNWRZTjRJeXg1QVF6eFIyMUhMWlJyYWp5SkMxcUJRek14eUpS?=
 =?utf-8?B?K1RGaXBZYVp0dDdOQTVQZHNYRlhjY0cyaDdTN0JoSkFkR2NpaDNRdm0xNzRp?=
 =?utf-8?B?Q2dGU2ZJVWhZYUlUbXZ0Y2VGUXM3dWxxbGliZjhOaHBldnh2MG4rOFdLa1hw?=
 =?utf-8?B?NVRuWFhoeE1QTVplQ1EyOWVZazhUMGRSeXVPR3c3dHltbExmWGwvYnJib1pY?=
 =?utf-8?B?eW84eEI0ZjBoTlNKRGNOellvZS9Gb2tlM2VETG5ZUzZ3RGhTV2ZuQ2lsN2Vo?=
 =?utf-8?B?eGVscnJISmtJL0wvQWxqeWpMb2xSVHZMMFltSnBiMmRJRDM3NWM2YzNGcFpt?=
 =?utf-8?B?ajNBR0hLVG5SVlpsN2JOZWZtTXYxQzAva1Y3VEk4TWhGeFUrVGZXV0huNFlk?=
 =?utf-8?B?YkZQbkRnQzRDTENpYXZiWXllbWVWZmJHVmxtOVg3TjRMNDNFcVk4NXp0OTF3?=
 =?utf-8?B?bEVVMUJyWFZiN0YrSjZ0VFBHSVJSaVJiS3FFYWd3MERRU2tKeVhlSzhXaVZB?=
 =?utf-8?B?bElIUkY2YkNCOW0zUWZ2TGtSWndHQ1VqaktRMlpuTEttVHJUdWxtWTUyS3lL?=
 =?utf-8?B?WXZEMFY0aUlXTlFrdG5VT00zcE1ucUtxajZleTgrMStlcTJzRng2cTZ0V3Vp?=
 =?utf-8?B?UGJEaEZ2dFRVR3RkaWxqbUFodTE0OXliNEM5VjhwMDRweUpxUnJ5QlFLRTJT?=
 =?utf-8?B?WVMxNkp1VnRqRVBuUUlhRVBHYkE1Um50VzMwSTEzY01tdmlSYndscldlb0U4?=
 =?utf-8?B?K3IzSE9kM3BZa0pWdXN6OHBkandDYkdBVnd0aFU1VkRDMFJKMDMwMVdTbFZE?=
 =?utf-8?B?UkcyT2xIRENaY1hIMHNrVUxtM3FjNWhseXlUSVlXRXFiTjVFWjNiU1VvTDlS?=
 =?utf-8?B?dEpGV1VNbyt6SENLRjdrRmg1SCt5TFBiYnRKeldET3JMYVRLV0NwTG1Ralc5?=
 =?utf-8?B?QjJYa3EwenUvSXllQS9PS29UZWlWWmZtRnBkbGQ0ZEpNS0lnWnlLSTdpbVJB?=
 =?utf-8?B?dVp0RmxlL2syc1VpWTJYSTdSNmZxM1lxWi9EQ21ZTFZxYzUwQVFvcEFITFpG?=
 =?utf-8?B?S2NSbU50UnJCL1JPeTVmOGtIL1BYNXkwcGZjRFJHSUtzcEtNQnpGUWw4TnpB?=
 =?utf-8?B?ZUwrV1RyM21JZDdRMUVyQ0c1a0pHVTJRbkswNndxaHVCd3RkZk5TQ1g4anJF?=
 =?utf-8?Q?Z7BT+CZkgzJc2MmZx7y0lw18roGD7fmPQvr769oALQq/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b541eb-23e2-4b96-ea19-08de3c4edd36
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:57:35.0781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xz6+N1LlXPRtovhDIrCvunc5oap0m/xT+gu5sDUczafL9NbrI9MCpHogOXSxX9S3VY1hKmvVNTxV/JcWj1IDpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

Explicit padding is needed in order to avoid uninitialized bytes and
safely implement `AsBytes`. The `--explicit-padding` of bindgen was
omitted by mistake when these bindings were generated.

Fixes: 13f85988d4fa ("gpu: nova-core: gsp: Retrieve GSP static info to gather GPU information")
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 5bcfbcd1ad22..5f0569dcc4a0 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -325,6 +325,7 @@ pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub totalVFs: u32_,
     pub firstVfOffset: u32_,
     pub vfFeatureMask: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
     pub FirstVFBar0Address: u64_,
     pub FirstVFBar1Address: u64_,
     pub FirstVFBar2Address: u64_,
@@ -340,6 +341,7 @@ pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub bClientRmAllocatedCtxBuffer: u8_,
     pub bNonPowerOf2ChannelCountSupported: u8_,
     pub bVfResizableBAR1Supported: u8_,
+    pub __bindgen_padding_1: [u8; 7usize],
 }
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
@@ -347,11 +349,13 @@ pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
     pub BoardID: u32_,
     pub chipSKU: [ffi::c_char; 9usize],
     pub chipSKUMod: [ffi::c_char; 5usize],
+    pub __bindgen_padding_0: [u8; 2usize],
     pub skuConfigVersion: u32_,
     pub project: [ffi::c_char; 5usize],
     pub projectSKU: [ffi::c_char; 5usize],
     pub CDP: [ffi::c_char; 6usize],
     pub projectSKUMod: [ffi::c_char; 2usize],
+    pub __bindgen_padding_1: [u8; 2usize],
     pub businessCycle: u32_,
 }
 pub type NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG = [u8_; 17usize];
@@ -371,6 +375,7 @@ pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
 #[derive(Debug, Default, Copy, Clone)]
 pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
     pub numFBRegions: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
     pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
 }
 #[repr(C)]
@@ -495,13 +500,16 @@ pub struct FW_WPR_LAYOUT_OFFSET {
 #[derive(Debug, Copy, Clone)]
 pub struct GspStaticConfigInfo_t {
     pub grCapsBits: [u8_; 23usize],
+    pub __bindgen_padding_0: u8,
     pub gidInfo: NV2080_CTRL_GPU_GET_GID_INFO_PARAMS,
     pub SKUInfo: NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS,
+    pub __bindgen_padding_1: [u8; 4usize],
     pub fbRegionInfoParams: NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS,
     pub sriovCaps: NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS,
     pub sriovMaxGfid: u32_,
     pub engineCaps: [u32_; 3usize],
     pub poisonFuseEnabled: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
     pub fb_length: u64_,
     pub fbio_mask: u64_,
     pub fb_bus_width: u32_,
@@ -527,16 +535,20 @@ pub struct GspStaticConfigInfo_t {
     pub bIsMigSupported: u8_,
     pub RTD3GC6TotalBoardPower: u16_,
     pub RTD3GC6PerstDelay: u16_,
+    pub __bindgen_padding_3: [u8; 2usize],
     pub bar1PdeBase: u64_,
     pub bar2PdeBase: u64_,
     pub bVbiosValid: u8_,
+    pub __bindgen_padding_4: [u8; 3usize],
     pub vbiosSubVendor: u32_,
     pub vbiosSubDevice: u32_,
     pub bPageRetirementSupported: u8_,
     pub bSplitVasBetweenServerClientRm: u8_,
     pub bClRootportNeedsNosnoopWAR: u8_,
+    pub __bindgen_padding_5: u8,
     pub displaylessMaxHeads: VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS,
     pub displaylessMaxResolution: VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS,
+    pub __bindgen_padding_6: [u8; 4usize],
     pub displaylessMaxPixels: u64_,
     pub hInternalClient: u32_,
     pub hInternalDevice: u32_,

-- 
2.52.0

