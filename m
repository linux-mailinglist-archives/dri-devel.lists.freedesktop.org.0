Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD77BA7464
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 17:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9663410E051;
	Sun, 28 Sep 2025 15:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wE7gI57D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E151110E051
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 15:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJ90z0m06GqxFphyAWb4Dk6/KR291yY1QPxwacfNgZs2pIHBJAVQtl7+DWQ8dTOTHv55B3d/EaJTY7W0bSAW3yZxBjLL16qlBpXGl3ww9e8OssoiEO4IitU+QJZsyRBcnQ8lhNeLRdVGINGSK9DFJa2+xvpnCpswS0yhOpoxEnM4z20BzU1Fq2FAklvmC/Arb4xJcE/xsxBuHjXtnY0CtHOPm9yzEpv4ebFix6RbdiLNls7ku0ZCtSaxFpJB12ybZBtnG9RRqmrehmXPeA31PrmWibUM1l/Yu1Y3w5lCuxX6cmGGckYDbxd79RBEVZI46EtWtZNju6m1W50tklSrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSZyfO4+bsl6WEZR+0HwS1Q+LboHwEmO7AIr5I9tEWE=;
 b=HG0utKCyR2cHGArV2+RoSXWTijnVDD6gKFCqrdPrKHMuxM0aj69ARxj8+ULpH9shyolyUBYQcL6pQx6KWgc/uoZHjgWYZCF/Hz7T5hoSq9xQVlDaQgqFKszdM8ybd8JdxEt1d1LdsxH5xK18MMSTHnl0sxk+Ml3Tyq7eyM4GLgRFWGjvgqa0mbohmFMz8fqzwVohnkvjGQFYvgfVZHg42MXdvVQ1tsN8oAzmsFPaHinS0KzB1GscqOV5T5J9JKc0nGkdZqKFXK/80KyhbNqG0/8hS/67tcitmTAXsBRdsf2BSHfDRCvPV1wja1FbachCrwbk+xJ8hlns0NRQYTyceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSZyfO4+bsl6WEZR+0HwS1Q+LboHwEmO7AIr5I9tEWE=;
 b=wE7gI57DIfudxgpChlZlWDgBm3qK4Fz9RQTORtd5ZWMg67av/fY6gDg3AVTKrGT3GQkOsHoydFc0/O9OBqvcYKcvf9ApGLdB7aRjrYgcTW0z7n/BZ/iDr3jAplY5qxTw7lLLnTFl+4+5/851u43VQnLxdUZEt/MddBJlaEQm8Gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by SA1PR12MB7104.namprd12.prod.outlook.com (2603:10b6:806:29e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Sun, 28 Sep
 2025 15:57:40 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9160.010; Sun, 28 Sep 2025
 15:57:40 +0000
Message-ID: <3d3304ea-e229-4fca-bea2-5675d24684bc@amd.com>
Date: Sun, 28 Sep 2025 17:57:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
To: phasta@kernel.org, Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Mitchell Levy <levymitchell0@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20250918123100.124738-2-phasta@kernel.org>
 <aNa7BDpKS2KA__4M@tardis.local>
 <2aa5150d913fcd4d321db52bc6bad1770f68e778.camel@mailbox.org>
 <5873bc43-1d60-419a-9c5b-e623fc5e9c47@amd.com>
 <63b1274d05f9ad307f29dd0276f0f3014235225e.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <63b1274d05f9ad307f29dd0276f0f3014235225e.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:208:234::18) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|SA1PR12MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 1faf0b18-404a-45ac-a081-08ddfea7c098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlRIYVVQK2g2anBQUWhxazAzcFovMjM1ZVJ3WlRLMUN2cjZKZm5RQUJNZ1FL?=
 =?utf-8?B?QVZwTllVRzRTSFlUcy9kQXlHZjJpcTc0cy9hVzdNMzUvU2FBeUtkbEJ3RmFo?=
 =?utf-8?B?OFA3dFV4OW5YZzR2eFc3ZmNPcUI5L2ZXaUpHYmJLT1BhUklsQ2I0SCtHTEpo?=
 =?utf-8?B?Wk9naURoaFVmM2lRUWVrb013SkZkb3FQR01YbDk4M0twbU5GTUR3ZGsvYUhE?=
 =?utf-8?B?RjA3N1ZzSVNNMGVXd2IwYWpkOHJVTGJvejFRejY0dWNSL3FUMUxPY3l4TWI0?=
 =?utf-8?B?OUJZMTJQR3IrTkxxZkpZUWMxTWJKcm4zeWE1RmFNMUVRalZtZXY2NU15ME53?=
 =?utf-8?B?WkVpMkQ1Sm1FQnVrblk0VDc5dHB4eGw2dDhsZ2xlTkVhRzhSangrL0dZalRk?=
 =?utf-8?B?ZUZpeVdzN3NTM2phYTdPbC92QTFpS3U2UUgyT2MvTG14cFRkZE9BZWdvRDBQ?=
 =?utf-8?B?K1FjQU1HYmhkMVFZc3BwTHNXcFArbVN0TGpad0NvV25zZmJZZGxaeng5Qmdm?=
 =?utf-8?B?RmdBNlNxTUNCcjRPVVJ0bU1Ba1hXVWg0NGpFcTJaT0trNnNTdW0vc296SEtX?=
 =?utf-8?B?WTVDR0NPelRCR3NYYTJORWZ5SGhtQjA0c0xoSlFpN2hnMTRGVndYaDRKYnB1?=
 =?utf-8?B?ZHl5M0E2U3BpYk9maHhNWDNrcFRZbDZvN203ZG9pQi82QmFHRVJXcHc4QzZW?=
 =?utf-8?B?eDVuZGU5R2hCMlA5MU5zbXFMeTAvNXhSVGFWOTgyZFNuYXVscXN3N3RMZUdJ?=
 =?utf-8?B?Sm0rSUVrSDViYkQ0a24vcEVOa1BPdkw0M09UbjBUd2w3U0dZbEdYbDZNUWVH?=
 =?utf-8?B?TURlamd6OWlyYmt2TUFORWRld0xCZmxBQzE3TVlwUXBLbXh5aTlXY0F4Mk5s?=
 =?utf-8?B?SWd6OG9kZG11cFBNdlFIMXlWL3NLd3NqWkpUSi9zUkZxN210aW9JRzBQT0x3?=
 =?utf-8?B?emlDV2gyekhRMERzTHdmYzdzSVFYSk1MUWo4V0REZSsvWk1NQ2VOL25mUnR0?=
 =?utf-8?B?UEROcThYRjZIa0FMU1RhQSttUlVJYUNJMlN0bVVOSUxHaURvVVNmbjlNMjJ3?=
 =?utf-8?B?UkhSUWxqdkJJRytQSFh5N1dZeVJXNGZtNDFxUTNQQ0VFRWFwcHZYcUxZakdi?=
 =?utf-8?B?NHR6RHdKQ2g5YWs2bXF3Wm5NRmphaTMvbUd4UWlIU3E4aVIrZkh4N3lpckMy?=
 =?utf-8?B?TE9Ca1hLcmZJV3k0aE13bm9oK1c2SXNyb1UvK3J3VXB0RVhMYmgxdlJobVl6?=
 =?utf-8?B?bTJ5MkIwb0JZVkhPL3FyZmZoU3VXVVhXZUMxUWhoVmU4Z1JCTERPaUZkTVo2?=
 =?utf-8?B?TElteGxUQm5ETXJvUE9jR1NlV2dGWS9jY1NzTTVYaU5QdUs5NEN3TXJ1QW82?=
 =?utf-8?B?TStLMkY0aHduSXlwVGptdmZwZEJNK1E4Ylg0R1MxWG5Cd2ZXend1QkhzaHpC?=
 =?utf-8?B?NnBtZ0g0OW0zcVBjNnplWHZ4Q0twWlNFNzBJRnhnbytaMEpNQ1B5cUluVEwr?=
 =?utf-8?B?TURhamZFKzVZcVZvSllQVEM2RjZlMHJsV3Q3czNWMGNudkdyaExvQjJyb1Nl?=
 =?utf-8?B?VVRqaStqUE9JR0JlcG5pMEZqbVFTNTZyVW5SWUp1RDBiazlSNFJORXFZUlFq?=
 =?utf-8?B?cFJKNHFpWjdtcmd2UWh4OThIeERwd0xhVnZGbzZEcTNkK2xkbWxIVkJTc0NI?=
 =?utf-8?B?TldMMk9TSFY0SWVOWlBuSDR2ZlRvTEwwOHRGMnEzMFp1TExmdUtiT3YzWWRo?=
 =?utf-8?B?dktpQzRnR0F1RDFIeTVPUWdvM2s5U1gzSEFQRUlEeDYwU0ZuSjdlcHRLQlB0?=
 =?utf-8?B?MkhTVllTVG1sa0ZJMXI0N3Ava2RYa0ZWYzU1c2FOMnJmc09yR01zYmhVZmow?=
 =?utf-8?B?ZWFkOGxsSnpOQlNQR1p3QkxEQ21GUkVyOXYxUzZOTDlSUmRzSXFFRVpmU0pH?=
 =?utf-8?Q?nTHxMh2sMvPRLwcVD4fxUZ/9oCPCGBT7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlhPVFJiUHRleVV1OGJoSTYvbEdQMk5wbVR4R1BSdm9pT2QrTW5HTzluNmsx?=
 =?utf-8?B?TjVnQ1hFaFNyd09LTS9OK2J2Mms3M0ovOGM4RjNFY0ZIMmg0K2pET242c09R?=
 =?utf-8?B?cU9jSXEyNSs0aHdPY0UrQU9JdXJNY1lyVmIzREF4cVhrRThqME1yQTd2UzB1?=
 =?utf-8?B?NTloazZUZnN3NFo3V2FQWTV1MElHVUV5WXd1K2FXL2pLak9mSHV6R3l5SjZK?=
 =?utf-8?B?dkNLV28wazNaMUZwZkxGazlDeTJFTE1BMERJNW9ybngxUXZqY0Z6Z0x6elRv?=
 =?utf-8?B?ajZwbE5qNGdhcW5NaWJobStEd3N6VkRyZUM4MlVaVlAyR3BKbDJXUXoyaTJT?=
 =?utf-8?B?U21DMVdTcis2eEk5eE1mdzFFU2poRnd0UytwelVHb0RRM0F1c1REdVE3OVdF?=
 =?utf-8?B?aXpSa0tCMFd4dWx1cTZKOC9qZUQ4UTN2Z3AzZjFIRzNxZ2Z5c3ZLenNsak0r?=
 =?utf-8?B?NWdDbVhUTEdkUnFBanZxTjhFaVFwdFVTbkZidm4vTDI1UDNjL09Pd2UzMzdi?=
 =?utf-8?B?U2pCQ1JBZ1hSR1JxNmQ5ZlJJL3NLRis2b2l0Nms0WXVHTXp1U29acC9HbHBC?=
 =?utf-8?B?bXROR1pNc3NoQVBnY2EyV1J3YnVaSEhsZ3Bla2NLZkdISWlCUWFqM2lneDFu?=
 =?utf-8?B?S3NvZThkcHVkMGxGblNTR3NYKzNOUzlWRWZMRk5TRHVwR2pGUzNUUXN1Ri9p?=
 =?utf-8?B?ZUNqa3hmQUorZFY3WlY2REJpY2RJeTB4dyttd0tmdU16aE9GMHM2b2tGeGRZ?=
 =?utf-8?B?WnliWEdTZXQxNklwa2xJNUxYbksxOTBmUFdVS01RZHcyZlVHNXpRREQ1ejhp?=
 =?utf-8?B?cndaMnMxY2N2RWdVd0FJN0xwMDR5Kzd2c1hFMzlBZnhJVEMwc0VIdUc1RWcw?=
 =?utf-8?B?b2Z4cDUrOWNGRjRnaS8wSG0zT25HOXZtMlliajIxanZRanowRWFvb3k4RzZB?=
 =?utf-8?B?aCtKWUorUkN2UVNDR21HYWVDWUxpSW9tQ3lnNWZsU0pPSGtnL0NBRUhnZVM3?=
 =?utf-8?B?L21hcHo4aTh3S3g1eUlDK3ljeG91Q0xhUXk4MjI2dGVzWnFiZ3Y1bk1nNDhm?=
 =?utf-8?B?UzZ1S1BORHF5NitVOUVkMXhrdEVSMlBDZkRIei9JckNpdUF1V1lMeWdUbUc3?=
 =?utf-8?B?R0xDUG5OdUs1VmhBMmg0VmdaUnJJTEwzZS95Zld4OXhrbTFBYjlmY1J1WlRk?=
 =?utf-8?B?TEEzSGdRRnoyekV3UjRLbURvQ0FjUXJCdW55TmhQbE5PdG1TeWkrS2l5SUxr?=
 =?utf-8?B?VXlIZ3RGZEI5em51aWdQdTNlWGhYYjd2aGs2STdPeTFOOHRJRlBIWWhYTXRm?=
 =?utf-8?B?YnBMdkVYNzRKYWhVOUZZazlnTFdRUDJyN1Z3V1A0TXJoZlA0WTlxS0VFYkZD?=
 =?utf-8?B?eUVrV0ZJVXVQQTZqYi83V3RzNGNpa1dvV2ZFeUF2WHNGb0Z6b0ZMQnBJd0NO?=
 =?utf-8?B?UUFkSEpqYzdURENBdTc5citNVG9Yd2kzNnFoeGYzN3lUSVA1Sk80YTBaK0tQ?=
 =?utf-8?B?ekM5azRrazFSV0NNTkNrQjAvUng2akFnbTZXR1dZY0p1UFpEUHFDWkdXTWs1?=
 =?utf-8?B?eG9Sb2RZVXExdDVRWm9uVklNOUJxTmV1YzRYaUQzSlJWbmRYUTBUaEdkNm5F?=
 =?utf-8?B?SGxySWthQkZOdjFzRFBUNXgvdFBtRUNBRjVkRkE1TjN5RTRtNjdmOUFZZk9P?=
 =?utf-8?B?L3ZPNEw1NXdEcjdRWm9qVkxHbXhRQVNrTnR3Vzc3UklMaE9tZDdIRGR5MXNq?=
 =?utf-8?B?b2oxNklOZ0cxdUxOcUFTYVNYb3NvWUt2Y3ByejExT2M2NHBkb3FaYmR4T2Ir?=
 =?utf-8?B?YVJETXhzTk5JdUZCWm5xbzllejFldy8zZFk0ams2WVJiU2pPYzRDUDlHTEpt?=
 =?utf-8?B?OWUyRFNDa2xFdE9VSjdjNmtFY0dMN20ybFlxNUNyekFhK2hMRm5oZ1d5Z09u?=
 =?utf-8?B?OUNrVE1TdnF6T0J5dXpET040SmpzbTFudFhWQXYwaCs2ekhUUmZDa052ZXNu?=
 =?utf-8?B?WWZpU2dVaW1ENWVkdUQ5MkFWMnhzeU9PR05nbUhRWVg3ck9id3MxajgxVG5j?=
 =?utf-8?B?ZXlyNExvcFMwUDJYRkk2SG5XdmRicndlWlZ1cmUrU3NtWVVGSWhNY09MeVAw?=
 =?utf-8?Q?Z02g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1faf0b18-404a-45ac-a081-08ddfea7c098
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 15:57:40.2899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLeblBOMkKgK/Cg90uvcRXIRiP5d8JV04k38l9ohay93vF/CswhEe0mykyyYnSbX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7104
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

On 28.09.25 17:26, Philipp Stanner wrote:
> On Sun, 2025-09-28 at 16:34 +0200, Christian König wrote:
>> On 27.09.25 11:01, Philipp Stanner wrote:
>>> On Fri, 2025-09-26 at 09:10 -0700, Boqun Feng wrote:
>>>> On Thu, Sep 18, 2025 at 02:30:59PM +0200, Philipp Stanner wrote:
>>>>> dma_fence is a synchronization mechanism which is needed by virtually
>>>>> all GPU drivers.
>>>>>
>>>>> A dma_fence offers many features, among which the most important ones
>>>>> are registering callbacks (for example to kick off a work item) which
>>>>> get executed once a fence gets signalled.
>>>>>
>>>>> dma_fence has a number of callbacks. Only the two most basic ones
>>>>> (get_driver_name(), get_timeline_name() are abstracted since they are
>>>>> enough to enable the basic functionality.
>>>>>
>>>>> Callbacks in Rust are registered by passing driver data which implements
>>>>> the Rust callback trait, whose function will be called by the C backend.
>>>>>
>>>>> dma_fence's are always refcounted, so implement AlwaysRefcounted for
>>>>> them. Once a reference drops to zero, the C backend calls a release
>>>>> function, where we implement drop_in_place() to conveniently marry that
>>>>> C-cleanup mechanism with Rust's ownership concepts.
>>>>>
>>>>> This patch provides basic functionality, but is still missing:
>>>>>   - An implementation of PinInit<T, Error> for all driver data.
>>>>>   - A clever implementation for working dma_fence_begin_signalling()
>>>>>     guards. See the corresponding TODO in the code.
>>>>>   - Additional useful helper functions such as dma_fence_is_signaled().
>>>>>     These _should_ be relatively trivial to implement, though.
>>>>>
>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>> ---
>>>>> So. ¡Hola!
>>>>>
>>>>> This is a highly WIP RFC. It's obviously at many places not yet
>>>>> conforming very well to Rust's standards.
>>>>>
>>>>> Nevertheless, it has progressed enough that I want to request comments
>>>>> from the community.
>>>>>
>>>>> There are a number of TODOs in the code to which I need input.
>>>>>
>>>>> Notably, it seems (half-)illegal to use a shared static reference to an
>>>>> Atomic, which I currently use for the dma_fence unit test / docstring
>>>>> test. I'm willing to rework that if someone suggests how.
>>>>> (Still, shouldn't changing a global Atomic always be legal? It can race,
>>>>> of course. But that's kind of the point of an atomic)
>>>>>
>>>>> What I want comments on the most is the design of the callbacks. I think
>>>>> it's a great opportunity to provide Rust drivers with rust-only
>>>>> callbacks, so that they don't have to bother about the C functions.
>>>>>
>>>>> dma_fence wise, only the most basic callbacks currently get implemented.
>>>>> For Nova, AFAICS, we don't need much more than signalling fences and
>>>>> registering callbacks.
>>>>>
>>>>>
>>>>> Another, solvable, issue I'm having is designing the
>>>>> dma_fence_begin_signallin() abstractions. There are TODOs about that in
>>>>> the code. That should ideally be robust and not racy. So we might want
>>>>> some sort of synchronized (locked?) way for using that abstraction.
>>>>>
>>>>>
>>>>> Regarding the manually created spinlock of mine: I so far never need
>>>>> that spinlock anywhere in Rust and wasn't sure what's then the best way
>>>>> to pass a "raw" spinlock to C.
>>>>>
>>>>>
>>>>> So much from my side. Hope to hear from you.
>>>>>
>>>>> (I've compiled and tested this with the unit test on the current -rc3)
>>>>>
>>>>> Philipp
>>>>> ---
>>>>>  rust/bindings/bindings_helper.h |   1 +
>>>>>  rust/helpers/dma_fence.c        |  23 ++
>>>>>  rust/helpers/helpers.c          |   1 +
>>>>>  rust/helpers/spinlock.c         |   5 +
>>>>>  rust/kernel/sync.rs             |   2 +
>>>>>  rust/kernel/sync/dma_fence.rs   | 388 ++++++++++++++++++++++++++++++++
>>>>
>>>> I missed this part, and I don't think kernel::sync is where dma_fence
>>>> should be, as kernel::sync is mostly for the basic synchronization
>>>> between threads/irqs. dma_fence is probably better to be grouped with
>>>> dma-buf and other dma related primitives. Maybe in kernel::dma? Like:
>>>>
>>>> rust/kernel/dma.rs
>>>> rust/kernel/dma/dma_buf.rs
>>>> rust/kernel/dma/dma_fence.rs
>>>>
>>>> Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?
>>>
>>> @Christian König's opinion would be valuable, too.
>>
>> Oh yes, please don't mix dma_fences into SW synchronization, it's a HW synchronization primitive.
> 
> So do you agree that it should be regarded as a part of DMA_BUF?

That works for me.

> 
>>
>>> I'm not super convinced of that because dma_fence has not really much
>>> to do with DMA. They're not very different from completions and are a
>>> mechanism to synchronize consumers and producers.
>>
>> That we mixed up fences and completion events caused a lot of trouble in the past.
>>
>> It's astonishing how often Sima and I had to reject peoples ideas to use the dma_fence as SW sync.
>>
>>> Actually, before f54d1867005c3 they were just called "fence" and then
>>> renamed to "dma_fence" because someone wanted that name.
>>
>> That was also partially done to make sure that people understand that this is not for inter SW sync.
>>
>> On the other hand the rename didn't helped much :/
> 
> gpu_fence might have been appropriate?

No, it's also used for think like RDMA, V4L etc...

There was also a proposal for HW to HW synchronization at some point, but we abandoned that after we found how problematic HW to SW sync already is.

Regards,
Christian.

> 
> 
> Grüße
> P.
> 
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> Anyways, I don't have strong objections and mostly care about having
>>> them available somewhere.
>>>
>>> P.
>>>
>>>>
>>>> Regards,
>>>> Boqun
>>>>
>>>>>  6 files changed, 420 insertions(+)
>>>>>  create mode 100644 rust/helpers/dma_fence.c
>>>>>  create mode 100644 rust/kernel/sync/dma_fence.rs
>>>>>
>>>> [...]
>>>
>>
> 

