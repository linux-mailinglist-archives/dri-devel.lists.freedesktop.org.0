Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C5EA6A760
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5094A10E61E;
	Thu, 20 Mar 2025 13:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Etlzwl4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4DA10E60E;
 Thu, 20 Mar 2025 13:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHipzJYtl22yr7il1HF9GNV7sFoWdupVAaeSQpbmbSsf5qa6kN5+2qR1fw9/dx1Do3Jhf6mtIq2psP51ZI4r1hVmCU66/vbQseG0lsaC8im84kX+gE3wbxURy/PuPwnX1gkC+Jg+3LpCG9Cdne625nFOt4mvNPZHaEkVklOi8llGuniNzx2SuKib0RaD1eS3Er0kLBFZMSlC8p67dTL538jtw5BPGRetl9EC6OuT71n6fiCfWfOPIq2wmf2VBTcGTOF5R100EoS9E17SKlyO2/9c3BThxT8aw5ihFyuUHaZxsD0og3qKXzMSZkBQ+jO1bdfeXC/Lzt/tHAjQxMfgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jM7eInqwyqwd3lwvGhTayJyjwZi/AO8HeJSbkEZnBg=;
 b=AoNYnWjfenNiyZ1FizU0CaoXtcmO6GbTSxehSwcHXp6MyaQ4Ece2RMH5oqgTJVHUng+QNIsthQEsiD7zNJAgNuIeDtXnVkA1+poTcnsh2h2SLeIxOy6xZ6pqYXS1Fdyjtx4mSAoyFYi6x8fnc0JvTOz47Aex9y15cB2USya8uAkkClE3MG4d69J3936KXyC8Y56ZX6L/zzU0ckPTc78tzvGhGu3yN72PObQ7pA0DMpNhG3jTcnaxXo4Q/hY0aYjHIwK/6oKkAL26GxZuQxAfOK54dXxpyuqsmJ4x94QKyKOWPM04QMZRxNHlh1zOOnYDUBCxXK9H/RD97K7x1NN5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jM7eInqwyqwd3lwvGhTayJyjwZi/AO8HeJSbkEZnBg=;
 b=Etlzwl4mHO52fRf4WjpZwjTWfqy1NvooLrDz7U6H6z4ynH0lhyZtdU/GX2DkQxKcDZKyMoZ7oQUkVurrlBMmB1RebWOnvQaW2wNgC4Vm0ajbXceP6SX4isZ1EuCj/JwcbfKxY2mJsdu3jrjnJXrleV8w71aGA9p7IwkMroeXEwd+ZQrB6edvPsrDWTHm2KQ1fzFIS/4NW2t2/+YUtFl28KlWvSsKflNvOiTUNxHtjjpHKlzZEp6WHfWA63II3Uty1k+3S4iKiAu+IA7P7gYyd2n48thH0lElYBGYDcyuyB2k2BDzttfLIpzCDjnBfmHZoM/pix559x5wz731pKTqTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:39:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:39:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 20 Mar 2025 22:39:12 +0900
Subject: [PATCH RFC v3 4/7] gpu: nova-core: add missing GA100 definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-nova_timer-v3-4-79aa2ad25a79@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f654dda-a2c1-4dc1-eb9d-08dd67b4acf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDhBWGFzRkU2bEhoSThBYU9SNU1yQjNhaDJkUFhONFJVVDBpRW5kVEQvZm8y?=
 =?utf-8?B?NEw2WXBvQ3ZWSEhDQjkrM28wYlgxcmlOa0RoK3grbU9PNXNFY3lwYnpuVDM3?=
 =?utf-8?B?SFV6TCtORmxrRTllb1dpKzYxRzVuR1ZZWFgvdHJvQXJUVEU3akRjWWtKVUFH?=
 =?utf-8?B?bHpRODlGeTZRTGd4alorajVhVUdkV3NOKys5UFNSUGVjUEZ1L0QxZzBLMUlT?=
 =?utf-8?B?V0JJSVJDQ1ZHZUV3dE9oc1NhaVczSC9GNkk1WWkrQjlRSTRFZHAyM1h0QnpZ?=
 =?utf-8?B?eEVZbUp3UGFBSkFYWnVKQm9WTnRwZGFhNGJjTnZXZitmUThRd2JQaXMrNHZC?=
 =?utf-8?B?SUxNVXFsTS9GOSt1UjV4QUVmRnU4K2EwNS9UU0lCZnN6Kzg3akluTUFZOHhZ?=
 =?utf-8?B?UnRHZUFlR0NRUHMrTG5oK05iY09YQ0puZzcyeEVSNzZsVlg3UHVJWXlPTm5k?=
 =?utf-8?B?MjlYdUlrWUtlK2ZmVVdVR0NYNzZOY2RxQ1hVV2ZBcEJ5MWxkNmVMc0ZCRWFk?=
 =?utf-8?B?b1hxaFRrUW5XUzh5TWxXNk5NYjIwRU1tUFZKc0Uwa0FoWHRHTlBKMHpiOW5D?=
 =?utf-8?B?UllkZVRORFBxVDFhbXNzMHdNdFlIQ0l0bjNmY1RuL2puYUo2bnhSVXp3cDYy?=
 =?utf-8?B?L0thY2xqZU5pb0hCSzI5ZEt4R2lQRS9CVHF6OU15cnY3UVBtQUthK2ZWRnVU?=
 =?utf-8?B?RFIrYnFuV3VpYXpFWEhlV203UzlDV0gxK2NiR3RJV2ZONG9McG5VYzRpT0J1?=
 =?utf-8?B?TVlsYVpIeUhkU3pKbVIwYjV1VnZyOEFuWXJVeUliMnJoVEpVMW5mNWpZMk90?=
 =?utf-8?B?RE9rTTlyVDVuSEsxVFpGM25pOG42YXRnNHdpaXByMW1FV0J0ZjNVY24xc2VF?=
 =?utf-8?B?am9nblFvWDRRQWZGbVFFZWpGNlF6ZndRcTFvdzdjY3J4TTNWYzhnME9uK2h5?=
 =?utf-8?B?ZGh5am1iZmg5djZwNERPRmNoMis2U0s3cFIzeXFvUWZ0WUhiWm1GeVp6bjEy?=
 =?utf-8?B?czlwUENFOEFITlFrV2wzQTVQM3M4ZThDUUhhKzVBbmgxUDVieXMxY3JZNVFC?=
 =?utf-8?B?eVE2ZlRzL1oyWXE4S3hvdjZtcE9aNEhPblFjd0N5SHpSTXQ1eUxzdXJmQkxa?=
 =?utf-8?B?L20zSEQ1aTFvVjBHWkh2Q1ZMY3ZTUGZUczhqLzZ6UTY2ZmJlV0tuTjhNQXF3?=
 =?utf-8?B?NldaV2RmWlBFSFF6a0JRczdvUFFRWHlUNlNBYStEUXU3MDFFQlFqWUpoY1ll?=
 =?utf-8?B?c01Db3BZMThZWk02QXhWMnBYUDYvVmFDQUlKanVIdnJOSmptK2l2ZlhtUWh6?=
 =?utf-8?B?RjZmV0MxZGw0RjJLcXhvNU5oVC92MXBjSW95WmZ6L3h2cmM3Ujhaa1c4MUNl?=
 =?utf-8?B?MjFZQ21oK0hHdmdVNWlETVhRNzQrRTQ1Rmd1cWwvTEdxRU5UaER3eEhJMVNT?=
 =?utf-8?B?eEIrUTBRSVRlUWtER3NicjZvWk9HSFNPR3dZTm1HNm85OGpPeDNrU1ZGc3du?=
 =?utf-8?B?QVZwWE1rdGpwNENWb1RMVDJGR1Q0MTVDbW9TK0taeWZIZm5DSUtkUWpIeVJn?=
 =?utf-8?B?VkdsM1hmNThhSk9IYnBvR1hQVmxVREdva09uY2tpSS9xdkVVR0QrajBYUUwz?=
 =?utf-8?B?bEZwblhscHZWUHRHa3VscjZKU3V2VWhwd1ZjVURvYzVvWmxJc2RLU2xuODlS?=
 =?utf-8?B?VW5rcTJGQ0JFOVhENVgvNmp0ekYvQTUxMXJIWStUZjdUOEVjUmtDQUNKMkRz?=
 =?utf-8?B?NVFkU2RFZ25LVGlaYVM5YVdiVEJta3M4UnoxZUhUYjJPY29IM3BYcmwrSCty?=
 =?utf-8?B?NEFYM3BpV0RkSTNsRHBuRlNsUSsxR1FydVFzYnlTL2dyUDg3eFhidTZsR2x1?=
 =?utf-8?B?cEM1UXhOYW1rK0F4Q0o0emFMZEpuemZWMjFWMWs3eHM1ckUreHQwblBmSzJY?=
 =?utf-8?Q?iVlYHLV9GW4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGxYRlpnMVQ3cFFlbzI0N1VvVjhMWm5NWVJ3NlZJQ212Skt2eFA3RDdxaXpv?=
 =?utf-8?B?bUR1M05McUFidUxxZG82UGNmeWFOZVVNSGFTU2VtbnBOdGNuZ1MwaHJ3c1dy?=
 =?utf-8?B?MytDeUgzQ2x3WGRqeTg3dnZxOXJrbnhLRW1qVmVuRlVXVkc2eDBDaVRWcmp5?=
 =?utf-8?B?ZFBCdFpRdTI0VGtqYXo0VHo3ZGtuZHBSbGRtZFM2TlFuSU5EWEl0ZzZhU1U0?=
 =?utf-8?B?d0JsT1dsV2xFTm9UM0JGT2pZY2ZCZUZhOHRUOGZnS2JBaGxSZGg5dGZhZFpC?=
 =?utf-8?B?VlBzd2VMYzFIMXh0STU5dzBQWnh2ZUlQTU5XT1ZtYmcxTndrWFUzRVZJZ0VG?=
 =?utf-8?B?UExvdGZGREhBUXpoSHBIV2VuZkw0NFU2cS94eU0xT2czSEMrcExOeGppY05z?=
 =?utf-8?B?dkhTL3BWNzJmUXBBRGZieERZRWFQNzRUOUp5SzFyRSsrMWR6TGRVSVI3NXg4?=
 =?utf-8?B?NUxKZ1lEODR4MGdGY0d6SXp5aHQ5UE1LS21DWHcyc1J3b05RQjVCYUFDMVhB?=
 =?utf-8?B?OUxiRUExNUZ4WXFzMVNuQUJxeFZsS1AveWMyYkZ3TUdmTWZqUk16NWZBTlVt?=
 =?utf-8?B?TFlaMDVJNGY4UUlWQ2orbDVYYkIrV2lqNFJ0MDVqeXpOOVRWc0NFalpJUzh5?=
 =?utf-8?B?UnAzRzlISzdTc2wzRjJJKzMvc0VwR0l6ZFR2YjczT2Z4WC9yYjU0dTdDeDJm?=
 =?utf-8?B?M1NxYUNwUUVoeDdHM1NoOGl1dTRoTnhaSXkyK3NGa2h2OVRnQlMxN2lJVDA2?=
 =?utf-8?B?cTMxQW9SSFZWUHB1ZXA0ZzIxTEU1TlJWRmc5UzVnV0RSRmhDclFvanFsaWxl?=
 =?utf-8?B?NkZMLy9jZmhLcmtMWUVjL1VOeHF4VGZ1ZkF5M1Zzak1iZFJIeEx6YzU5UVRj?=
 =?utf-8?B?eFcvYW1yK29jS2lWd3g3SUszSGw3WGkza1FicVMrb3NiK095U211UmNObDE3?=
 =?utf-8?B?MjM4TVpZaldhZytuNlJDdUZyc1pYeEFiclV4V0F6cFBEVSthejg2eXlucmVj?=
 =?utf-8?B?Ky80QTFnalc0eW9TL3dGVHY0UG80cEU5QzJWaWlyaHZWRGg1aEpUb0U3bW80?=
 =?utf-8?B?NThTRnVxcG1SZUJoUmxxaUNqSTRTNXZZTTBNaDRMVVFVRkdKeE45elpTWi9T?=
 =?utf-8?B?QVBVOVFoSzc2UnlLOS8wZmZ1S1dPOW5rcVlpcDdMTE5zUkhrY2NPQUNvU2xW?=
 =?utf-8?B?a1B2N0s5UkV4K3Axa3V6TncvUHFDamE0SmIxTjNGL1pJU1VJYkVZcVVXTUVm?=
 =?utf-8?B?UVVTeHdWdGtMTDBwSTYzQ2R4RHZkbTRzQlF5S01UcFhzZElWdEZ1SjlKVGI3?=
 =?utf-8?B?VHRBV2xqR3Uvd1VSVUt0TXdndkhObVpWWGllYnFhYy9oRVBxQTg3VFdNSkNU?=
 =?utf-8?B?c25sTDduRnJJYnNRSnpiZlNXVnl5dUNlOUUxa3FLaVR1TkhzZk42RUlpdnQy?=
 =?utf-8?B?WlE3MkF6RHlEQ0kwaHppMktaTkR1cXJrbW15blNwdVFYUDNKM21WMEdzZjdr?=
 =?utf-8?B?T1FBYnRjUmp5c2tnaW1peWJpc0I3VWhnRGxVNnlWbnNEdmhPZFNJQXdPNDFq?=
 =?utf-8?B?TnJTYzhHUDRMOHd3T0tuN3ZBenpvb1k3UUZoOWJwSU1IWlJmSkJvWTBkTW9Y?=
 =?utf-8?B?YmZjTUVlOUd4bGtJNWV4dDRtTzFaR25OdUk2SUlVeW4yOXFVNkM0aVgvM0Fm?=
 =?utf-8?B?YmpMNlNnQlgyOFIyYktYakZaTDF0U0VjM0ZlNDJpU2tjalNOcXZjUk5DRURh?=
 =?utf-8?B?b0xUVi85WnFGc0FvU1AwbFhFN21ZVjVWQ2R2QmY1c2Q1U2NlS1lvNENNYllX?=
 =?utf-8?B?aGtxUWs0NVFtS216eHdZWWoveFJ5bllraUYybVJHTCtPUlNOc3JKaUxLeUww?=
 =?utf-8?B?eVkyQ0VtSkNMZkpjSFdGNWtqaGJIeFhkZG8zTDFablZRUWg5ODdZalEyako2?=
 =?utf-8?B?dU9pOFdGR1hlcjdFckJCUVQvRFN4SkZ3cHQySVNFUkt5cFFlSnR3VExtSmZq?=
 =?utf-8?B?L083RlV4Q0MxaEFsemwyeGF5Yjd2VU54dFpKY2pNS2ZkTTRlUkF2NmNqL2xW?=
 =?utf-8?B?UGJHSm9pdU9YU2t1Sy9JZUNLWjBTdmREdUl4YUVkZEtpY0F1aWErTys5Zk1O?=
 =?utf-8?B?RHA0Q3M4eDJHYW11QjQxb1dpVE55V2FZeEFMc1NmNjIvY2djYVpJTzA4M0RS?=
 =?utf-8?Q?Oa7tkDdWcoFoDwj2Rh5LeTyskmmhj1i215AHqWvi6PhY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f654dda-a2c1-4dc1-eb9d-08dd67b4acf7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:39:45.2754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnYr+LoNzUr7IoYYd80GeNxRx1WDtG+BjXiHlRzlfKOaNQw93bEcwcH7gLCkD4Ug3Lf/7fQ1WEy3MtRd1Twc5g==
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

linux-firmware contains a directory for GA100, and it is a defined
chipset in Nouveau.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4de67a2dc16302c00530026156d7264cbc7e5b32..9fe6aedaa9563799c2624d461d4e37ee9b094909 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -54,6 +54,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     TU117 = 0x167,
     TU116 = 0x168,
     // Ampere
+    GA100 = 0x170,
     GA102 = 0x172,
     GA103 = 0x173,
     GA104 = 0x174,
@@ -73,7 +74,7 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing
             }
-            Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
+            Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {

-- 
2.48.1

