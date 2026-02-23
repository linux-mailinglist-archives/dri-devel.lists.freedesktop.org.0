Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ7ZBdupm2mb4QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 02:14:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294D1711EA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 02:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7542F10E0BC;
	Mon, 23 Feb 2026 01:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DUiGuMy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A390110E0BC;
 Mon, 23 Feb 2026 01:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnAY7vEyZ1x5TZhrRZ8efhhcMHKhaNFla5rr0rauvUkvqtPdDXZy7WIvE+ZeB7D7KE0kkWfPS5AM+vY19Euk4FtsJ1llz9n/5GkwnbTYsH0+62FrK82BRMN9bkCG0cgnbWbqNQGJL+51QMirAscjCyFpGJEKimZCxEmXNfrawD5uzqBrQ2uPdzVl0qgliyyS/C/njacZsz/SobenbMpMlKmipiSq1ceh+neVy2BvdIZvflc6pv/03GH+seqKUB+xKfrg6VinfmE3f/OOVvoNBtLEsLOvwHCrn7KrAsknDwa6RaQS053hzGhvJxZi81heg6jDqcntjTjEgNff7oU4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wIidq+q31N9H6VrgBtD8WcQ6VCdY82Fy7tMK+Xbd3A=;
 b=FWK3R7mzBUaHLeXEvRSUFxj6fUw+o+LjAYZHccvC0UQdCNB8/VEHq+AIid4mW2knKSSzK3g+QEIPsDUjCdk24pfoTcrfmq/GrwidXzTA5XITMop/hB7Q5Rvfvk2ldr6kyA4XwOHss4/sqX2JmnhVftrqqdJNwE70wlAL54uI1gXpeceCuyTozyXDPsyRKghJgG0bv0DKzcwmDmWct1KKhT3RoxyqFYQUZ0/LrlCpi/Ce4OMnCXivB/K4OEv5WW99ag8OvCfPPjR74Euk6WEEQAHDzbpAlaZMOU7XbvdClyQHjiDw4WcXHGnQ62o29VZkhVD948kIt7A9sFzWKWZuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wIidq+q31N9H6VrgBtD8WcQ6VCdY82Fy7tMK+Xbd3A=;
 b=DUiGuMy9585e6siPvHk0CEjAo84kYi1PHUM4LcM9t0LSTxf8G68s+YRVoPw9gFgZ1TWwXPbh3ZVGRqCZ4a1EKOUkCtdLSp9gRtPgkJmNhE+s7lBfb460yDhdujHT0Gyd/oO7AdKW2HTnqfi51rOj0cPmJ5zYW8nJKvaG7LnN5TDEtgzsIo1nHcVKARcy5LcR5dGKlacLOceXasDIueM8v24Mi92HTecHHwfSUD/XRxlNyTKaJv5SwtrsYNVb0QzXlWl87O88+g0fDR3WiYbjIm4z4QR0wmKwPU9cVJmE2Qi2ql2pbqwlfmiUjdBrZ7KsgWBETl7zDX+QenUstetGtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6983.namprd12.prod.outlook.com (2603:10b6:806:261::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 01:13:52 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 01:13:52 +0000
Message-ID: <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
Date: Sun, 22 Feb 2026 20:13:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: IA4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::11) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: f5640752-1434-4e94-2b2d-08de7278ce98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjVHZGE2SDQ0Ykh6NmgxTnlaNGxJTDBQYksxaUk3SzBmQnpuMWZQSG55RjY0?=
 =?utf-8?B?b3NwcWp2WkFqRkkycy90TkJDNlIrbUNVWmpQWGQraUdkcFV1cWJzYWdQU1E4?=
 =?utf-8?B?WnlFR0JjZG1PT2VoSUdjdndaMVU5UHJiYlBWeW94a3RHNytsT05LaFcvZVAr?=
 =?utf-8?B?eGNxUENJMTBBbk5pd0ZYQ0c4aHlnOTQ5bWx6NWhVT0xRT2h3R00zTUlVOVFw?=
 =?utf-8?B?Q0c5c1JwYllpdUF2U2pLbERGZCsxaTlIbDZyY2U2TXN5NFVPYXZWQmpLaWhh?=
 =?utf-8?B?K0FUU0pNd2dFRGNVUHBWVmtOMlpNTFpOcUhBS3lSVGcyeExWRytJc2tWM2or?=
 =?utf-8?B?ckFReHozMGt0NmdwdFBoTTFZWnNIaFdnaXpqRlRUS0hRYjQyL3M2MktQQTZj?=
 =?utf-8?B?bVEvL0RZc2lKeXBsZjZXWkJSY3A4KzEwMnZsUm9xK3h0LzE1WEFwMWFwNThp?=
 =?utf-8?B?QU5rYTN2S01tcXVYbURxVmxWY0dhV0RLbndnVWpoeXFEekU5U0lGTlptWlhu?=
 =?utf-8?B?bzNVYWo1UlNvOHpTUngweExaSi9CbG10QlJkeVRaeU92MCtQa3NVVnZ5Q2lx?=
 =?utf-8?B?MTZCVk51MEJKa0NOVnVNbldKSFZ3b1g5TEE2T0cydzlqN3FJUnpYYU9RR2p6?=
 =?utf-8?B?WHU0V2dvd0U3ZEpyTTFzUWNnblgwcGlGc3I4UUp1UEhFWFIwTnBXYmZrbmpL?=
 =?utf-8?B?bjlKaThYWmlxSFNzR2lUbThwd2Njc0hZQmxZRHhPZTB3V0xSY1hJaWJVR2V5?=
 =?utf-8?B?WkhkMjhFdldhSUJFMjBKdWhudjVPd295M3pHNnRMbE16QVQ2RCtmZldRcTdG?=
 =?utf-8?B?cnZLZkZTSHBUSXF5TGdXem9NYVNjV1NRMERnSHp4cXNPTTFpR3BMUFVPTzhj?=
 =?utf-8?B?bUl1Yzh6WGpoVkV6OXRFenVVT1BnVGh2S3dBc2tzN3JWYWkwMm0zVEQvTUJj?=
 =?utf-8?B?R3k3dCt3bmRMcnh3N3JHTmVhSzNsUTFyczFNMkFxVVQzczZSMnFYNEdITzFa?=
 =?utf-8?B?UjJHSC9WNVJMdU5UNC95dXRvTm9YTGY5UmI4ajhVV1NmNjdoRXk0cERBTC9F?=
 =?utf-8?B?ajZ4YytYTjZiZTdnM3hrM3FtWE1JenhqKzNQRytYbUNNeHl3WUxLaHVURlVx?=
 =?utf-8?B?S1UxYVpOV1pud3Z1Z1VzMzFZRmNhaDNjTWdyYmZrSzdMK2VaaWt4b04zRjJD?=
 =?utf-8?B?NVJVaTk5bGlVbHpQeCtXUGpBYkZXUlV2Q3JXMU1iZGxMOTVDV0UvR0F0enFr?=
 =?utf-8?B?MU1nVzArV2hJTm1SdTRtNzFLUDBKT2NQRXRnTEErQm83QWsxYmVISHVsWCtk?=
 =?utf-8?B?YTZxTVFVL2E1OUU4V3B1UjhPaHZDRkhaSDZvOE9scFVCZVVBd3kyRVJLMXJh?=
 =?utf-8?B?a1Vhamh4RDNkc1dkUTdUQURweFhTa1grbW5uQk1NYWprbXA2WWRsU3psRjEz?=
 =?utf-8?B?VWVFSUFnWXExQk1nYmJlOXAxRzZaSlRXM3Z3cU1UN1VwUGxuQllJdXR6d2l4?=
 =?utf-8?B?TGVPY25pYjlhTE1SQ29SY0dWQmROU0tXVnBCMENEY09GT3NBQ2pkbHFZOW95?=
 =?utf-8?B?Mm5oZ0RGWk1OUXF6OWJNeGRpRGxvTkt4ZUoxaUlTQjlIeDZ0bG5OUUhEamFo?=
 =?utf-8?B?aEVwdW5GYnQyK0ZRemZVcC9ER1dQOUlNdjFRbytJeExzeWhIUEZlVVo3SDlH?=
 =?utf-8?B?bXBwc2QvdXlLaFpZY2NkQkpTOWcrSm4ySEJGanhYSjdjS25KdlN0dDNKUmhI?=
 =?utf-8?B?RjJlOE5oT0Fzb0xUaEVsWnBBbWdvbjh4bkxBZzk3cjRDQTlabHR3Wk1jYXFl?=
 =?utf-8?B?MHNWVDNRWEcvTUk4VjhJNU8yS1VrK3pjUDNxVlphN29YOVZZNmVacXprbzBx?=
 =?utf-8?B?MjcrYTMzRUZObkZQL2orR0VaU1JYMlZpRmk2NWZ3eXZmMmpiNkR6ZEhzQ29i?=
 =?utf-8?B?cldVY0pHeUU3K0k0MmoxSzI3aEtWb2lVbTBEeWxMc0tZcUJOTVllcXlVL3ps?=
 =?utf-8?B?U2RGU1k5L0lnUXVHTklISkEwdHJiSVZJN29YaFk0VkdhZEQxc3I4aWRVdFp5?=
 =?utf-8?B?RmdlOEE4QXJQMVY2bmRaUFNldG9DMitveTFMS1lkN2NtUU9vZFBDdzZqZEVI?=
 =?utf-8?B?NVZpOHBia3RWWTFEQW9XcldmQXVFajBSbzJscHJMempabHBKVFJMeHRubGQ0?=
 =?utf-8?B?SkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGcxNFphWFBUZ0tLU3BTNHpodFJIc3pvREc4YXZNWVlTUmxsSXc4UExVSUVI?=
 =?utf-8?B?WUdVVkFmLzNTbkdKWFN0TTJKb2FySkFGTWFMUmh2d2xGUnNVaTUyTUNBOUta?=
 =?utf-8?B?MjZCOCtuRlNad2wxR1V3a1RxUnpYVTRUMjBUeUJRTEZJdFpkNlNCTlcvalRX?=
 =?utf-8?B?djQ4SjJJNFQ2UTk0eUFkeGJ5WUd4Q2hyMEYyYWxkWmZiNVdtTng3a0t4Mkxv?=
 =?utf-8?B?UVNqczdQaDdQeno2RDBNK1YvVUVnNXdrTWo0UFN2aDhvRm1QK1R1UEROTGJS?=
 =?utf-8?B?T3NRcFlPSk1qQW92Q1pxNFJ0THdCeThVN0R6N0xxSDk3QnZhYnZZYlgyaXBl?=
 =?utf-8?B?eERrLzFPeFlYaUFQTXVRMlZHQ1NDdFhWRTd5MGdhS0pKemFyM3U3YkJvQU9N?=
 =?utf-8?B?MmlzSTIrNUw4TEpERFdLNUVoWkdTWFI3anNEUEp1Mmt4U1BYRnUyYkN5d0x1?=
 =?utf-8?B?ZXZiU1haQ2hHcjZlNkQvTUlVOFRZaUc1R2FaTXdkdVdXOTZvRklDQ1B4OWVU?=
 =?utf-8?B?Z3BQWHZabm5IbndBYU8zUHBicnN5ajNucjJ2aHU5UjdmVW1qbitFQ1JJWWd4?=
 =?utf-8?B?TmN2MGxBaUxUTkV0TkFsczRNVlJWWE1aWWdmbnd2dVpOWUdscElxb1lGd1pa?=
 =?utf-8?B?N0lDakFuLzl6clRQVjdNdXRUSlpydVFiY0lrdTlPZGVFYnAyaW15aWFUMURG?=
 =?utf-8?B?M3BJL2FaNWd6dDhNOXdBd2tOdkhFaWJxOWswc2t0REd2VklUZ1B3V05uc3g3?=
 =?utf-8?B?L3lMdU1UU3VlRXFPbXFoVG9HemdyWU43RXg4S2pzN2xIRitrWHBKczh1VVdP?=
 =?utf-8?B?UC9KWDJuQnVMZmVYRGt1ZjlCSGxLdHJSWnZjOXd0MVlxc0RuREFRdHZiMkJ4?=
 =?utf-8?B?WGJpa2FJUUQzejVZUnE0SXhBa1dGdWkreUY0eks0bGFvUFRoblpjbS8vZGF6?=
 =?utf-8?B?VVBSRWQ2aHEvZjVXeDI5Q1pvdzNyNDJZc0tLbDFvZGlMQ2FRbmt3RE9ZWUEr?=
 =?utf-8?B?ZW1YRHozQ3Q0Q0oxelo3RWdzNmUwNUJISXNkSGQxYkV2a04xUVZ4WkYrbkhK?=
 =?utf-8?B?Nk9qYnRGbHhHM0I2NCsyQzhPcjJEbWRzazdlOTBoVkhqcnF3S1UzVW1ET3ZN?=
 =?utf-8?B?bk9sZnNEaVBZc3Q5U0lxZ0k2M2d0SU5ObzlvUExuL2pBNllkN3F0L2YvaFNi?=
 =?utf-8?B?NDN4Z1k4emNxT2FEVnduejYrT3hvbzJwR2dZQXE5dXJDQ1JqbUR3WFNKaitE?=
 =?utf-8?B?NjB4N0JSUmxRNmtZR1U2Rm12WjFMcWVudFEzc1AvZ0N0bXdsTjZmNXowMENW?=
 =?utf-8?B?UlJWM0x4Z3g0czluYndxdUhoMnQzMlZRbUo2VWtTUHF4eGJtdHlzMmtDZmI4?=
 =?utf-8?B?Y1JaMFF6Vjk2YkpHVGNwcXNOaXVTVVp0REoyYXRiME4vbmNiUzk4aEFHdVJK?=
 =?utf-8?B?TnA3YU9tbVFvZjdUR1BDY0NReTJESXVCQ0I1dytSVzVrRzRZMEdMUHRGMlkz?=
 =?utf-8?B?TDE1U0FNeDc3N3gvbUdQeWtuS2c4cys2Wkp5YUVkdXUydEc5Z3cwUWpURzZL?=
 =?utf-8?B?cGdRdEFPR29NVWdLV3Aza1Axb2d0aE1MTjRpeEt0cDJaYVE5T2NDelBheWU0?=
 =?utf-8?B?VTVUMlJQdUp1cll0TVNZQi8yU0NkZ1JoQWRLenc4ZlZXVDdPNTJUYnM4SFRa?=
 =?utf-8?B?ZXlFQ0ZLRDUwY2NqRVFKaUxVTCtSN0NpUUkwenFjWkNrcmN2TmcrU09jbkRn?=
 =?utf-8?B?NVdvT0R1YWt4SVUycGJXKy9iLzhhM25mdXVJVTkwZzJPVTdwVDliRG9uTjJj?=
 =?utf-8?B?R2RxRFVTd0ZzaDhXa0F6d3JVb3Vqb2NPRHlMVmFrQ2V1YzNBRytUS0ovb0pQ?=
 =?utf-8?B?Qk9NK1diaHFjWGg5V1BGQXVBOUppWTRVcGRiQnBEUFEydXViaTFLN2hweWNy?=
 =?utf-8?B?TmkxS0g5amMzZEpJWkpzNmt3WUtGVVVMdFVUU0ZOOUw0UU81YlR2TUdFcXRt?=
 =?utf-8?B?bmJVYk1QS3RRVFhiWWgxcHdWa080OTg5M0ZWTS9QZExneUhNQ2FwQlZZQUE5?=
 =?utf-8?B?T0o3REJFNHhQa1NxS2g1UzdON1o5cWp4VEVIQTZ0WHFpMjBnYmt5bjUzWTJD?=
 =?utf-8?B?bkowdEc0NEdaOEdQQmFRajFWVlpIY1djQmZjelJsRDcwQm5LTk1oYTAvek9O?=
 =?utf-8?B?ZnVYVnF1YXBpdDEwcnFaVUVsNWtLRXIydEljQlFtVjhZV0cyemdta3RPM0dh?=
 =?utf-8?B?OFppSjBES2hLTElvRzJtVGVYNTRMcUM1WDFTQ1k5eVhFTDA2Z05VaXByUTA3?=
 =?utf-8?B?MUZncEJIQzlpblNVMXphU1Y1dnFYV0VPYXFhMGcvQm9FdEpjZ3hudz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5640752-1434-4e94-2b2d-08de7278ce98
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 01:13:52.4005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2imtI1c9woMzjWbzNN2vmWb+RkFbjMSuu+Fb+hZnTmCcreQoaA1DwN64jZTDLD/iz2fgSt6IioZBwxHx5F+uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6983
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 5294D1711EA
X-Rspamd-Action: no action

Hi Eliot,

On 2/20/2026 3:16 AM, Eliot Courtney wrote:
> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>> +/// Create a C doubly-circular linked list interface `CList` from a raw `list_head` pointer.
>> +///
>> +/// This macro creates a `CList<T, OFFSET>` that can iterate over items of type `$rust_type`
>> +/// linked via the `$field` field in the underlying C struct `$c_type`.
>> +///
>> +/// # Arguments
>> +///
>> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
>> +/// - `$rust_type`: Each item's rust wrapper type.
>> +/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
>> +/// - `$field`: The name of the `list_head` field within the C struct.
>> +///
>> +/// # Safety
>> +///
>> +/// This is an unsafe macro. The caller must ensure:
>> +///
>> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
>> +///   unmodified for the lifetime of the rust `CList`.
>> +/// - The list contains items of type `$c_type` linked via an embedded `$field`.
>> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
>> +///
>> +/// # Examples
>> +///
>> +/// Refer to the examples in this module's documentation.
>> +#[macro_export]
>> +macro_rules! clist_create {
>> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
>> +        // Compile-time check that field path is a list_head.
>> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
>> +            |p| &raw const (*p).$($field).+;
>> +
>> +        // Calculate offset and create `CList`.
>> +        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
>> +        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($head)
>> +    }};
>> +}
> 
> This uses offset_of! in a way that requires the offset_of_nested
> feature, so it doesn't build in rust 1.78.0. The feature is already
> added to rust_allowed_features, so I think it's ok to add
> #![feature(offset_of_nested)].

Maybe I am missing something, but why should the feature be gated behind
that if all compiler versions (>= 1.78) support it either in a stable way
or via an unstable feature flag?

thanks,

--
Joel Fernandes


