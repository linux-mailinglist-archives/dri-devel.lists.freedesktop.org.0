Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGu0HMQtr2kgPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:29:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59C5240D3B
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0598910E00D;
	Mon,  9 Mar 2026 20:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tcz4dDkD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011057.outbound.protection.outlook.com [52.101.57.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D2310E00D;
 Mon,  9 Mar 2026 20:29:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBuGILSgB5t7tWweKeKVYj4dPxvxKnvbcV9j8pT20I/nr9b7xWrHIKQzf7Iya3OAoO2EHXQjfp0JkQk/sI/Yng5TjHgDMtYg1caUYPxsw9yNHhR99po0PFKc8imPuREahBgcEGlGg/VwBFUV96dHn4B5Ozket4hNbRKIxbYFlKbyhzKI6hcq0foWqjslVXfmN7cDm+84O0+LST56x1xwzQlEqECLUpMganvIy6A61CAKFTLxQim1MbQD8ycdWgwajrZLQU2SsKgTMp6OWbX57yDCu/T9tPUwSUO41jGvoPOOQlh6FmXtUI7/To2XH066+xjHC5bE1EtJsPX8tUlxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trG4S6tBXyBaF7YsavG5bnkNlyhWxgbB00x8AcAgAoE=;
 b=bL6rn/r43JUr61kh31Qpc2Lk00PULywbMO+RkCF2OSxGFhe4EZNvFN+V9SRTNH/kxYJeA1bKfA44+BZq5Cqe8AGQgNYTITtORGJDPeZqjDAILtNsAcXBiMeZQdikrm9eWajljtFmZtS51tqypyTEbl8uid7MkZkSWwb4I7m8kYdS4l5dqumWO1vxXDB3+jiZ2dtrGRn1id20kfr8zOM9ef/EWv/HMqCCaNgmtJfgrArJ1Ar8fi9IgG4XqdCK3aqDvIiJnPCsjRfbSnHMsxcYjtAXGQLSb13VoZx+nr8Fds0NRmpj30PAf/V0KH+pZTzhfPNOSTMDnOMH6Ou6Y27UdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trG4S6tBXyBaF7YsavG5bnkNlyhWxgbB00x8AcAgAoE=;
 b=Tcz4dDkDmkjxCFIZRwpAL5LPIB3GvA0m26AqIrJqeoWowREPYPdl5pCWJ9I9SLdW4M37Z/G0QsPa4gBQUbFlQRyi7T7GlWTz+cTzqG2d9mrGRzhjxNeqXuuaX0CnXqP1WWkMCvwl3UERzt50vvBZC54TWrt8w0sw6dwFHwAc6EYzbMrNNX/ZUHQtYfsEGS/RTFD4HygkGq8/mGuJtmichDsY+FsXpMB474F6ZTBbBPswFC0EGwXNss9eQin4uK5mKasU8uIsmsx2JpEoKs4xvDYZ8rySqIYK8qnxf9e0mtMjmZUzJ/F2A+raLhuMWWKdF/40oytGfcBXIxr9y4wUxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB7989.namprd12.prod.outlook.com (2603:10b6:a03:4c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 20:29:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 20:29:46 +0000
Message-ID: <fa3c5390-aea2-45c2-89ef-05a64070a44b@nvidia.com>
Date: Mon, 9 Mar 2026 13:29:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
To: Timur Tabi <ttabi@nvidia.com>, "ewan.chorynski@ik.me"
 <ewan.chorynski@ik.me>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
 <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
 <864ab8a502db872468d7b01e0adfff386d2187cc.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <864ab8a502db872468d7b01e0adfff386d2187cc.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d90c85-aa65-410e-1dd4-08de7e1a9a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 1xPf2Iw4WcLvoFgJGwNDJlVTMoxxC9Pl4qfyyfaOI3LmCb6R4DBhBkQCzwVx6U5NTxINgtCFIRuvSTZqXrx513/9HgPMGxoRhfGBOU/k3drwutNzRhAzNnB6jmlhW1ZHJ1XUQK6dh84v/qx0DcEo+iXcvJ8FGylma/SL2wIjwv+DedBgRYpyHxvAOA+xG7IKOcSR5J3853rB1WOfanw7qYtlenIJ5vQrWE8aaEN53Lb+G2G8DTH0cIPMMvdQCon5PIpE3iRppgpOlwzlBaAw8k4Q2SaG6+i2dMk3fOMgzsXkj9vF2TwY17ZlWKEC4BmC9wr/Q4YlpFiHSy9m5+hU7O5kVRIi4VAmE1RdxJY0ERKIHhLlYYz7TDTF9S2Q5vZIoGFs4cewqxVpcOadSO4eunnktBrYPBcD+wdvVLrDh4bJGhAgoCz2MQd1ZOOiVPiTl8bDuK6z/fi+hFMYR5DABEZb2AQSI43LQO+KWTkL5AoFVhdNovjcofZ+I9DEUYhI+ZyeyAeF+jlUO0huKz7JCJozvqhwZV49iL88xfPyly55+vGN/+BRNiQFAY9mqHHMBqzBFjx7wpQlnowV8OBd2d6ZanK4Y1+vja3Zm3urirzBvAQ+3uYNnAObRL47vE9wiU6DfVG0TNFaJ0Iv1+uiURFhR5Yiqph0FBdOh6v4ejr2XQk11CU7P/bwue4VT7Q0T1b0bbOG4b3qQdpisggW+S1I7wJtmwPIgxqS8FA5/5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2N2RWhlVTdtUUFCc2tISlh2YzVYTC9aQ3lqOElFdy9Oekdlb0Z2NnpQbWJu?=
 =?utf-8?B?cWp0UHc5UzIyeXF5Y0dqTHlUOXRuaGs0dW80cHBWZTI1OGdRVVdpbEhKYTk3?=
 =?utf-8?B?SjA5c0p2ZTh1d1RkeEtFbktKVU50VFZwOWpWdnAvdDlkK2VpSC9nSjZUUndE?=
 =?utf-8?B?NXBxZDFQMjczSzVCTjdKUjJVSks0SXkvS1h6N2dIajkzZ2JJbVNnakwrT29L?=
 =?utf-8?B?QW9HYjY1RitZc2FUamhyYmdubS9VMlltcmhoQjI0bjZndXd4V1FnUXZEcGp4?=
 =?utf-8?B?WDJ0VDVOMDNJbGJCa3ZVdVF4NHhBTHVkWElseUpYbjBQMnpXNzg4SVM4Z3hJ?=
 =?utf-8?B?L1ZpYnBENHBrYWk4SDZMQnlpeVpTUnd1cWZ2MzB6MGkzdU9Ua1hrSzNXeC9t?=
 =?utf-8?B?eHF4OUdyMVdBZ1dDcEQ0SGJiUWQyVzFIVWtsZWlLKzBXSHNPT3lsbnFrQ1pQ?=
 =?utf-8?B?L0EzdjFmK0V5c1pxRy9neGw2QWFLOG43ZEV1R2FIUFNSN1VlOU1Db1RCWWlZ?=
 =?utf-8?B?bk1IcmNVS1A3Zm9XUzF2ZVF3ZDg3TG9rQWxFVU5YaklsSzhZeGlqY2Zwb2Z0?=
 =?utf-8?B?RWdIbFJSeEhvSUtySnhiUXY5MVVjcDZnMWczeDR4NjNsTWI0NG5iVWhZbXVx?=
 =?utf-8?B?N1lmR3poMXdaMXhobWxxSUE0Z2RmOUpIUnpVeEdyWHIzTksrZXZuK3Q5cWxz?=
 =?utf-8?B?dmNnT2pjbzhPc2sxYkNuRGNsU2V3Q1BOdnJYaThIUHFzOXA4TDJKRFZ2MGpV?=
 =?utf-8?B?TjVxMHhmMmxiL2lKdDBvL0xNRGdWQUN5Z3RjSlBtN1kxS2tibDJwMWd4N2hy?=
 =?utf-8?B?SjQvZmlNZjBvZ29xcG0xb1MxSnFlQ20rOGpNRzJiZlVmNWxyUm04MHpLZXd2?=
 =?utf-8?B?M0wxR0Ryem93QVh0a0h1OXVmMURRREFyTmdKSE1CZ05BQm9YdWJuQmZEaWRJ?=
 =?utf-8?B?UW9aK25mT0x1ZXhLeG9PN1VoWnNRbFY1WGtPelFwN3RlclE0V1I4cWhHcys1?=
 =?utf-8?B?UHZ6bEVDYTRwTXFWc1padjZjTnk5YUJjNXVLMlkzdnd4WUZDNWN0UVBJN1hK?=
 =?utf-8?B?dHdoc3VMVG54bmIzek9FNGRRbEdqQjcxc3N2aUNUZEIwMXRMblErMHNjNFRn?=
 =?utf-8?B?SWRoVWhneWptN3VDck1PeUM4U2x3LzBLek1OdUR6V0Z0SEZnZVBiNUI1T0xk?=
 =?utf-8?B?ZVRXRUF1d3ZqbVByY3RQNi93RVkxdndCdlVVRTlNdFdlTnF3VVREbmRyM2lN?=
 =?utf-8?B?a1B2WHpRSEd3bGQ1U0Y1U0Q3all0R0VpNXpWUFVISXF4RnBQYmFvSlBMczFB?=
 =?utf-8?B?aC9PQUhWSUREaG9PYVEwMUYwSWYzeThSVlMybVFvNEt6WHlualpMRWZzU3RB?=
 =?utf-8?B?WU1lYXJtNDVHMkJ5WGxiS1lMUjRqUTNCbFN5UjlHZFFLZmw3c3cwSUUrSWR4?=
 =?utf-8?B?b0xGR3ZTUUJhNTloemNyRURoRkRlNTlVMHYyaTZxSmNKTzBsc2taRHhJSTVq?=
 =?utf-8?B?REhhT1Q1TTJMaFpiZ0VVNlZOSkxYK0drWWk2TkVZYnU2OVBmTnRzUENoZjhk?=
 =?utf-8?B?SkdlY0xFUVZhd2JkYVNEZFdxMUJUWnZiKzVqMVZpQmdhNHhRMGRWdDkvazhU?=
 =?utf-8?B?UVVBK3FiWWxTSGVxQisxTENjeE5UWkIzNlgzRkVKYjhsbkE2eHovMmc5Rlg3?=
 =?utf-8?B?by9INFRtbzY2bStHemllZmdlK2xsTG9zeUhFUVNOb3FaeU4zamN1NlM5VDJU?=
 =?utf-8?B?SlF1bm1nOEIyekdSb3pGb1BEam8yNFllSGw4R3JONjM2OUlEVXN6TEtESzBY?=
 =?utf-8?B?SGVxRVhKcnltMUMwcFllT0NpQW1CMFp1ckRrQ1BObFJvcFlyMm1oVkRjUVY0?=
 =?utf-8?B?NExQTm83RlVkWXNYUTZWZzMzbENxL0R5ZWtZVHBsblJWcHNidlhlRGhtUWdM?=
 =?utf-8?B?c0NtM0NJcy8wWVNHK0N0V1kxVC9wblZJYnVHSENDOCtWbHc4OVU3YUhQSndP?=
 =?utf-8?B?TEMwOGtPNXBabkJGMWt3a0tUKzdsZXdzYjBTWFVMbGdGdnlaaE8zbUZpZWlr?=
 =?utf-8?B?cnBDU2V5Wjg4b2dIZVczQ2lyQmhHMWFXK1VlL3ZZTFAyN1dIZ25VOXVEb1U5?=
 =?utf-8?B?d1hva29nRmdnTk93dWlQR2NTYkQ0bnd1ekZWQVpUZmJseVllYk56UjhQOSs1?=
 =?utf-8?B?K0lqcjMxbVJoZnZQTWYyNmlMbDFsZHFjMkVBT3ZFc3hJM0RVUlRVQ3pjWkxa?=
 =?utf-8?B?TEF0Ri9IZTdRQlZ3T201UHpidER5VWt1c05LY0toQUdXaEZFY0grUVlIS0Ri?=
 =?utf-8?B?TzlSbUJUcUloUWE3OGRlb2NiNUZmUXF3aTJWK0tZSkIzSEM5MTJIUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d90c85-aa65-410e-1dd4-08de7e1a9a71
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:29:46.0629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7U7Ud0Metc0WaFtDXOrbWQHNCMAjHlkmd7ErTbm1b1Ntc5uW6DkUJcBUPosCddhhaRXpMxAzymFTTwf1C0vhPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7989
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
X-Rspamd-Queue-Id: D59C5240D3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[nvidia.com,ik.me,kernel.org,google.com,gmail.com,ffwll.ch];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Action: no action

On 3/9/26 1:18 PM, Timur Tabi wrote:
> On Mon, 2026-03-09 at 13:04 -0700, John Hubbard wrote:
>>
>> I have that exact card available, so I'll give this a quick test and see
>> what's missing or wrong, now that Alex has pushed the entire Turing support
>> set up to drm-rust-next.
> 
> The TU117 is technically a mobile chip, and its VBIOS is different.  My initial version of the
> Turing patches would "ignore" the problematic VBIOS sections, so perhaps this changed.
> 

No repro on the latest drm-rust-next branch:

NovaCore 0000:e1:00.0: Probe Nova Core GPU driver.
NovaCore 0000:e1:00.0: NVIDIA (Chipset: TU117, Architecture: Turing, Revision: a.1)
NovaCore 0000:e1:00.0: Found BIOS image: size: 0xe600, type: Ok(PciAt), last: false
NovaCore 0000:e1:00.0: Found BIOS image: size: 0x11000, type: Ok(Efi), last: false
NovaCore 0000:e1:00.0: Found BIOS image: size: 0xc200, type: Ok(FwSec), last: false
NovaCore 0000:e1:00.0: Found BIOS image: size: 0x22400, type: Ok(FwSec), last: false
NovaCore 0000:e1:00.0: Invalid signature for NpdeStruct: [1, 1, 66, 86]
NovaCore 0000:e1:00.0: Invalid signature for NpdeStruct: [1, 1, 66, 86]
NovaCore 0000:e1:00.0: Found BIOS image: size: 0x1a00, type: Ok(Nbsi), last: true
NovaCore 0000:e1:00.0: PmuLookupTableEntry desc: V2(
    FalconUCodeDescV2 {
        hdr: 3932673,
        stored_size: 39968,
        uncompressed_size: 39968,
        virtual_entry: 0,
        interface_offset: 224,
        imem_phys_base: 0,
        imem_load_size: 38912,
        imem_virt_base: 0,
        imem_sec_base: 1024,
        imem_sec_size: 37888,
        dmem_offset: 38912,
        dmem_phys_base: 0,
        dmem_load_size: 1056,
        alt_imem_load_size: 38912,
        alt_dmem_load_size: 26168,
    },
)
NovaCore 0000:e1:00.0: FbLayout {
    fb: 0x0..0x100000000,
    vga_workspace: 0xfff00000..0x100000000,
    frts: 0xffe00000..0xfff00000,
    boot: 0xffdff000..0xffe00000,
    elf: 0xfe2c0000..0xffdf4ea0,
    wpr2_heap: 0xf7900000..0xfe200000,
    wpr2: 0xf7800000..0xfff00000,
    heap: 0xf7700000..0xf7800000,
    vf_partition_count: 0x0,
}
NovaCore 0000:e1:00.0: WPR2: 0xffe00000-0xffee0000
NovaCore 0000:e1:00.0: GPU instance built
NovaCore 0000:e1:00.0: GSP RPC: send: seq# 0, function=GspSetSystemInfo, length=0x3f0
NovaCore 0000:e1:00.0: GSP RPC: send: seq# 1, function=SetRegistry, length=0xc5
NovaCore 0000:e1:00.0: GSP MBOX0: 0xffffe000, MBOX1: 0x0
NovaCore 0000:e1:00.0: Using SEC2 to load and run the booter_load firmware...
NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX10x0
NovaCore 0000:e1:00.0: RISC-V active? true
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(GspRunCpuSequencer), length=0x820
NovaCore 0000:e1:00.0: Running CPU Sequencer commands
NovaCore 0000:e1:00.0: CPU Sequencer commands completed successfully
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(GspPostNoCat), length=0x50c
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(GspPostNoCat), length=0x50c
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(GspInitDone), length=0x50
NovaCore 0000:e1:00.0: GSP RPC: send: seq# 2, function=GetGspStaticInfo, length=0x6c8
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(GetGspStaticInfo), length=0x6c8
NovaCore 0000:e1:00.0: GPU name: NVIDIA GeForce GTX 1650


>>
>>>
>>> However nouveau does not probe either with this firmware so that's not
>>> really this patchset fault.
> 
> Now *that* is interesting.  Nouveau does generally work on TU117s.
> 

thanks,
-- 
John Hubbard

