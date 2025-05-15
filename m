Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD39AB7DF1
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 08:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADB810E164;
	Thu, 15 May 2025 06:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QGMRMMEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC06F10E164;
 Thu, 15 May 2025 06:26:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+9x3QY3Ma/rcJ6qIMmGTGBqeQmSnxrkHMkvPNhgPE9yjWSRswWy/YhGglAB0kuuvZOb7CSAy+bJ0VhORZnPhj5dZBFxQaL68FXsh2E7QQxoJSXOncW8QHfNRQgMbJHUkVYCNjKmC3ms5sXEy9OJ/6ZmXrLkOkjTvpC04O3g3i8UnMsEj/qfo48na+bciDMKlN0DjRviDkPQqGvzh65Q+tsnOIOcU9BCvg9Oa0X5RcpT5dOikwkBHSXv9MZNjWB0Z5JNZe3AKbMUiH5vtpff7y12gsoenUvygEBZ5MOQauG6cDJshxq9v1B0gAK8j6fWBZF9plczHXYLhy40J2wrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsdvgS2nHo0gqWl4cskRtDqVRXL5RerSNCtPd3ZTC8I=;
 b=oWID1mVFV4dJU34dsL5BGQOqU7A9nt1cBQjKQSIsKq04XuZmCXGz/nU894wCemPFwZylHOlkKcL6xWtNj07koiKJZsy4zLLiiOrUDyfr9d952Y68kCZhF8Wk8JkKGDQZh/AeIpfahuULPsJz4Cjnd4QcQwrdIgy/MGCqZlklFC/QWewhEwUPceQuPVu2dbRPYQ3Zqu/lcd0O5L/b+0IjrFzbwc+v3gfGXJoUUrJBOKtHzP0botCB4PWeAZEynINWR7WRaJ2ITama/j2LR8EEVxVNee9YPnGzaMsGHuTUdFBgvPcz3x6RIzKBzv6sj5vxpDREJIqlZwuFAC8zevIrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsdvgS2nHo0gqWl4cskRtDqVRXL5RerSNCtPd3ZTC8I=;
 b=QGMRMMEO1SKM6PERAheKb1amVNitzh3T0BcFyW+N5N1xV+C+XXNCeR7BVAo0zt2Ua2NEbqqFv+Y4zxxKdu+UeLUt+BiLPscgBG92VHbv2XkXiDndiwKlAvOXKlnUNk83YAGP6PQab/O+ZQgqsQVVNTt1478vqm335i42DE4Zuc+/AfbTkAA3Z1vcHsKQqG94WCjY2C1Tn3Z6FmBYvILR5UW5ijRU12hHlz1dmDnZYJC5ALD51gFRjUhJd3854UNLN/mELfXjCU02UX9/+e3Ark3mcwDyplYqVswsmXW0ahKgqzkwJmrqaOQSsO4tLgstEJLCqh2ST6dWfhhnVD+knA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 06:26:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 06:26:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/3] rust: select AUXILIARY_BUS instead of depending on it
Date: Thu, 15 May 2025 15:26:12 +0900
Message-Id: <20250515-aux_bus-v1-0-1781b54424e4@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASJJWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0NT3cTSivik0mLdZMuUREsDgyTzZOM0JaDqgqLUtMwKsEnRsbW1AJF
 JgPBZAAAA
X-Change-ID: 20250515-aux_bus-c9da900b7c3f
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:404:28::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 0364698b-2adf-4e05-49c2-08dd9379664e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDROZ2xwVFJlZTFZTE5MMStnN3NOMzhZNUhXam8rbkhaVGQyZityMnp5WEhW?=
 =?utf-8?B?eTZoSWlqZkhKc011VXFqYlNrRUQ2SUd4Q1NaNGdKVWVDUUh3QzRRelE3RGd0?=
 =?utf-8?B?bnFPeWQ1L3FHTHZTTkNtaFZ4ZUFRZVZzM2FzZGFxeTVDVVFsa3dmNCtNcGto?=
 =?utf-8?B?Q0JzbDVzbTJYa3podHgzdXZ6TUhWTDgxL2Uwa08rZS81UmpBbHNFSThidG5L?=
 =?utf-8?B?UGNwN3BOd0ZiSDNUT2Zsc2h2MGpzR3hpZEZhLzYydXg5MjR5bEx4ZXJXckxk?=
 =?utf-8?B?WDRNemJPMjBIOFE2QlJHM0xHUE95RXhZblRGaGdNdTdmdUY5MVZ5R3FWMnl4?=
 =?utf-8?B?OUJkMlBENFI3MTRWbVh5UGl2VEJQT3RpZUtRZ0V5U0ZYd1Z6RndqeFJaMzBI?=
 =?utf-8?B?dWJ6bmE0SU5oV09CRmtZZ3RiSmRYa1lBcnFtRW9sZFdKY2l3SDRMOUpGcVFO?=
 =?utf-8?B?NGZYdjlXWGkwU2QwcWQrZFhMSmM3aERRd2tuUE5vZVZlakhIMjBMSEtuR1BF?=
 =?utf-8?B?dXZ1YnNnRkNaUm5kNlJyVlF3bHpiaE1KY3V3WVpzeGhKck5yQzF4Q3A3eGFG?=
 =?utf-8?B?VW1tbnBYaU5NSVFVZXBqUHE3b0ViL2gwbUF3eU1nb0pLVkwrMHdWbDBQcm03?=
 =?utf-8?B?UGtXTTVRaktkQXowWlZBZnVaNFIvVXlLckdKRU9VMituT0NySjA2bTcxdnhJ?=
 =?utf-8?B?WDlCZHZFVEIzczB3U0xqWG12TG52OS9aRWZ3Y2J3dDgzajdEOTdTT25NM2Jo?=
 =?utf-8?B?QitSazhqMXhvdUJpUkx6dnJrMmJJZDVYb3BlY1ppL2ozQkZnOTgzeXJOQWxJ?=
 =?utf-8?B?b2FRZVR3cWlwN1ZlZU9pcVdVcW9zeExaRCtFRDZqV0oyN1lIZWxxNGdMV2Fx?=
 =?utf-8?B?TVZ1ZTkwZGVrbDdSYkdtRGF3OFVTMEtmaXN4cGJnZ3BNVVo3N3ZPYUJ4MG5p?=
 =?utf-8?B?UTNzVjZtVXRUdUFwZnVueGZiaUxxZmJIZkdPd2JFMFlEVGNvWUd2UzF3ME5K?=
 =?utf-8?B?YkUvTllSSGZSd1UwS3NxYVNaMXpDaGpxRTZ3RFVOUGw5MGE0aHJhVGRTUkZ2?=
 =?utf-8?B?aWpjYVJPTFY3eDV2THQrVFo4VDRFT0hiM25jUkd5T3J1ZXU3a2lEUS81S2tD?=
 =?utf-8?B?UHFOb0R1UjJndlJtRkx3M3htUGoreUkzcjBFK1g3N0RKTGZ4bHVUeTdOOUt3?=
 =?utf-8?B?U2JMOGx0RmxZK1VKT0UyRXBwdjFEV1VpQ3RJU3ppMEQ4SWJoYmZOM2JGZ3Ja?=
 =?utf-8?B?UFJQakhJRzhDYitTYjU5YlhTV3N3ZmdRK0Y0Mlc4L3ZsNHlsYUwzWWdtTHFK?=
 =?utf-8?B?cElpVmdoUmNNS1ZzUDR1OWNlbHRkU2VHZzVMdFdpQy9iNlFCNVNkT085VjVF?=
 =?utf-8?B?aHhvYVYzRUdDcG5WaFpnTjlIUGZlenlscC9mWDJZMTkzZXpKdjBFMUxWUUJV?=
 =?utf-8?B?SjUwTmhvcmNLdDUvRm9iUGNZNDlJY1hFeWxiSjlvQVBxNUpoQU1oRDBzWWta?=
 =?utf-8?B?VnJNek9xNzJFM3p6SDI0K2N4dE8wdnJJRzl3Y005endUVi9qczZBTC9Ua0U2?=
 =?utf-8?B?T0tkZlJCTzRadCtya2tKbnY3alZqN054eDltYVJTbHZNSEpMa3lNOVJaZ2pN?=
 =?utf-8?B?OWJtSUZFMy9mNm9Rai9OR2paaGJCcDZQaDdKck93RGFGR1YyMEFCK01zZXRQ?=
 =?utf-8?B?SnUvdE1STm1UWFVsZ1k2bFhaZ3BiMUVxRTBPelM4bjRYQzZWUmdtUDBtNkRD?=
 =?utf-8?B?WjhWOFBhemRIbmFFampsK3p4TFhKMTJzUERCdnBuNzFuZHFNUG41RGVJdzBI?=
 =?utf-8?B?ZVM2dDVmd2w4RVRUTkRkc2Q2WmY1R1Bsa05mRGcvcFRKZjJlNi9MVUNVRlpp?=
 =?utf-8?B?Q01HQTI0YnJLWUY4U05xSVp6VFVBQnVkN0VFaC9LQUdZWjBnZUhCVWNpNlBE?=
 =?utf-8?B?Z2c4MlRncXVjRVhvcmJvcnJwN3JUVEZDblYxSE9qdmQvZUVWQWExVWt6V01r?=
 =?utf-8?B?UzlnZmNIazVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXY5ZHpWVjVuVlppdVJ3eHRkZDlNSnJVRytlSFNCbFU4dDBHWmtUT3lWVnpr?=
 =?utf-8?B?T2JQcStzNnNlQ1FWd1pOKzh0di8rTVN4U2s5bkpuZG5INEx3dE43dUtkVnZI?=
 =?utf-8?B?ZE5qMjdjWm9VbjExTGdScC9JOEZhWlhhSUovTjVuejVxZkFwbDhncG5uQlZJ?=
 =?utf-8?B?bTEzMjM4UHhxaXJERjhTWGVpTElUSmlJTFlkYjM1Z1hZa2JmWElvbkNsSnVK?=
 =?utf-8?B?VWlmam5YZkJIRHhFRWJqelY0bmYzblc0R2RjV3J3SndCRHEyd2NMUEozdzYz?=
 =?utf-8?B?UVMwSVlOLzlLeW9ESVE2VnRlSFQ1Q1VaTDFjOWVuYmZQdXdOSHJPM3J3Y0JT?=
 =?utf-8?B?a01UN2dRL0V1Unl1K3Q4ZlBlN0swZE1SOXRWWnFyUzZBNkRlSHFkWWpmVDg4?=
 =?utf-8?B?UWdEVmR4MWJUSFYrZVZTZnkyNDJlYzRvRjZsSlNuOXpISDIrL1V4QnAwQjEv?=
 =?utf-8?B?dFNaZTBER1NoM3ZyNDJCaDl5YTZoVkFDcGhkWG1MQkFBSzFISzVOaDlDMUcx?=
 =?utf-8?B?UFdxNmpMM1dkZFFLTitCMnNDdGNjQ1ZVSksxdkxYazNuQmlFc3ZsZGZsaGVu?=
 =?utf-8?B?akdyV3lNUzJjWEo5Ymhrc3ZKNHpBODlhQkxCSUhuUmVBN2V6cVpnMmRDUU5C?=
 =?utf-8?B?UjQ1emxRRGM1dXZ2aUFIZG84VmpqNVY2ZE9ESzMzNXIzdTRwbTN6NGp6dEVX?=
 =?utf-8?B?Tit2ZmYzeGYwSVlpTDNBYzNMZzlrVTJPRG5YQ3AzRHRTSmJ0Y25qdU5xQTJh?=
 =?utf-8?B?dmo3Mm1YT3Via0duQUVxYUtYWUpIcFROOTJPSWNTNFRuK0cvRXZTMGt5TDBO?=
 =?utf-8?B?TnNEamU3eE1mQ01oSnhMWGtNeWZCRmVxTVRXSkt1MVR4NVYzcWJ3Z3BtUnNm?=
 =?utf-8?B?a2QvMTUydm8vNHY2U213VXRId3ZTNWFlOUNBNUVVQWNSVHZwS1BVd0pEWVdh?=
 =?utf-8?B?aU5VMUxWRjN4UWNBZEJOd1BuQ2x6K0lHQW1aSVRKMFBXSGdjREMxNCtBZlZ0?=
 =?utf-8?B?Q0RnbHZ0VjNJeDRUY1NIMnJPbkl3eFhEK1k4NitLdXdHcWJlNWRpZEw2bDBu?=
 =?utf-8?B?ZytBeXB5MGlseExsZllzREJMWncyL2hsQ3ljZXNMVUwrWVI2OTZpbnVSQStj?=
 =?utf-8?B?d1NIaXpwcnlnNGdTQ01IUzF4WWJ6QVRxVXBxNEZWV3lXWGV1eFNKb3BDcW10?=
 =?utf-8?B?ZENFRXJZNjFCTTBoZXVLMTIwOW84Z0NFcVRmUUptOFkybURldUFZZXZ1aDRq?=
 =?utf-8?B?eENKMVM0RE16cjVDMUhtMGZjRnlmUGhuU1NyNEpQaEIyRmVwME1KeGVxS25u?=
 =?utf-8?B?YTlOdDM4cFJFM0E4dmtlb215SWVMSlhqb2Z0dVVSRDl5Q0dhWmNBa3lwbkhK?=
 =?utf-8?B?eEpkRS9hQXFVUVpyVXgxYVRLRnNWWmU3UnpHeGY1MW9IY1BSRkFoNGdFcmVv?=
 =?utf-8?B?a1lvaFczd2lUMk1SV0FodkpWdlRRQXpMQ1hmZWZQbTgwSi9uekpKS3lSZVQx?=
 =?utf-8?B?MmdIelRkMHd1ZkRXOEpzVFZ3WUlvWGcwbmhnbUhnTWNHS1dOYjhnVkcwUS9x?=
 =?utf-8?B?SEVqclhEMzlIWDQ4OXFNTHc3ODM2NXRPMDRiRWZYOHZnRkg4OUpZVUp6RU9Z?=
 =?utf-8?B?dldXRy9HdHVQazAzbFphUTZURXB3MkNCckF5UTlZQzVvVkpnUk0yRW15UlhZ?=
 =?utf-8?B?NDcxdXl5ZjdkeGZUOEg4aThia3hGVUVSdS9lencxT1Vsc1BtTXArblhzR0lZ?=
 =?utf-8?B?eVovblI5M0dwcUR3SDdUZGNIdXZCbnV2MnIvS1VqVzBBZmZtUldlTjJJaExt?=
 =?utf-8?B?L05IK3I1TzVqL21WWHROSjFpV0NFbWlvUks5N051dXBjS2ZSYTVmL0t6dXR6?=
 =?utf-8?B?SUxtY2RRTWNRblBQL0RvZjk4cWhIT1RRcldmZVF1OW9wcWQwdGM4bzlDbjVZ?=
 =?utf-8?B?NTM5M2ZUSkNIME85RGtRTUV0a3BNT3I4ZEhxVjZUb3cvdWdYUUwzZElqc3Zw?=
 =?utf-8?B?Q3ptdWwvNTFJMVFTWTdWdXkyU2hzaURxY05DZjErMUJLYzkwSEdHK2ZRcU92?=
 =?utf-8?B?YkpBdVl5a3EvOSs0YktIK29GYUdXVFlIMXExaG5ENzdyVlg3SmpVMXh0SWl4?=
 =?utf-8?B?a0FvMGtNM09iUVUyNStQTSswK3FrNjQ5S3R6MUoxbU9kOFBDVktWR3cyTkRD?=
 =?utf-8?Q?BwHiPKPuNVoM4oJYjNUBTIYucdMJGyvBbyyhaX0s8AFb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0364698b-2adf-4e05-49c2-08dd9379664e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 06:26:17.8131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MzmU1NhgHglVHyMupVioyQ9dZWhdLDPB4TNAmdPsOISMwSiKQbi4fT1hbthSTKgUOvZAE4tsugzWbbg5YnVvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
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

I noticed this after trying to understand why my minimal Nova defconfig
was not selecting NOVA_CORE anymore and why I couldn't even find it in
menuconfig.

CONFIG_AUXILIARY_BUS cannot be enabled directly and must be selected by
another module. Options that depend on it thus cannot be enabled unless
a different module selecting AUXILIARY_BUS is also enabled.

All non-Rust modules using CONFIG_AUXILIARY_BUS select it, so it should
make sense for the Rust ones to use that scheme as well.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (3):
      samples: rust: select AUXILIARY_BUS instead of depending on it
      gpu: nova-core: select AUXILIARY_BUS instead of depending on it
      gpu: drm: nova: select AUXILIARY_BUS instead of depending on it

 drivers/gpu/drm/nova/Kconfig  | 2 +-
 drivers/gpu/nova-core/Kconfig | 2 +-
 samples/rust/Kconfig          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 61479ae38cb7bf6083de302598b7d491ec54168a
change-id: 20250515-aux_bus-c9da900b7c3f

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

