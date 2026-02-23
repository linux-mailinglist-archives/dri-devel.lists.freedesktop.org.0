Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NRWJ6bTnGkJLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:24:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24E917E473
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FA710E1B7;
	Mon, 23 Feb 2026 22:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g1F/LzQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012068.outbound.protection.outlook.com [52.101.48.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD03710E1B7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:24:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tor9DzeGQSUZTbd9c4yE0ZfXGgXWyqs0Iy+BElB2lhv1nY9zmwkKpkMEk73w2tg4hU9dXaQa0q+NgZg2a77+ATsiEwqVmLPIiZGMlM1KdypQf4xCIuIn0F+8o7N2v83/yrLIanxIkg9R2g7ddfsaP4/aCWf2MbCyh0M4ZLvwKpxA0Zaueyi9AfoWp9CjeYuo8itF/WYa5FUQvHp1dpWUqBizwsiL9V40GKWhgHcVNSBBEeF+1N5bP31CkWlUpuvtWnO6h9udukwXFYJP+EzxF3V0/pg+eOOHFOXBz5AFmWIsap1+6bbIhTN0AUtipddy/Iog7KbcjUmwELnFHXDPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nT5m0QVGB16+L8OdxZBQyaGICH9mWW2zLvXxQCpl3MI=;
 b=mUFXKkUNTlkgzJV7a0S1a6Bmmr8qIXoZiZkKUWHXJyxPukRZauFwhpnbyp2Vfn90bAYNFF6Hy59EJmCac/+Q6TiiAux3dSYJQ9/rm/k66dKHpWz3s606B2T1NpVjFqyJuU9F08dEq6y+rKRgAg/wn+GxyPtxtC7Roms81rIhP6POLUtWiFgBQvAIFIOK24Z4jtZtWuqmis+rP5dUXZsQaf9QIa7UuSsaXt5LE4YjgCB+SWT9gH7dco89lEsOcYioOR9TEN2Rgk08dYDRFQLoZvogAeh/fk37lsT9lJG8UiEiqRfXmvdlI4z6heTF81aj7lHy0vXFtjMS87aGEGWmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nT5m0QVGB16+L8OdxZBQyaGICH9mWW2zLvXxQCpl3MI=;
 b=g1F/LzQv7951GkdHTtC/XoNH2WDMsZjForq4Rd4uNh4ls958ANWhWRmyJQrz6Qk7ipOSTqFmizpzP/joFb5c5ar5SgfUG/k6ql9JUmPg6dGpjn1A3SO7CHvf0ZlIn6sA2d12oKv9URBOXvUdUWyN6XOXY0K4IjO6xcJKijFCO5g=
Received: from DS7P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::14) by
 IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:24:25 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::c4) by DS7P220CA0019.outlook.office365.com
 (2603:10b6:8:223::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:24:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:24:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 23 Feb
 2026 16:24:24 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Feb
 2026 16:24:23 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 16:24:23 -0600
Message-ID: <226a61d5-bee8-f055-2fb1-871332aec307@amd.com>
Date: Mon, 23 Feb 2026 14:24:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Update FW Boot API to version 3.29.4
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <karol.wachowski@linux.intel.com>
References: <20260220160116.220367-1-maciej.falkowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260220160116.220367-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 14725a70-79b9-4127-71ab-08de732a4ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amVyU0xTRC9wLzhSMDc1ekZyTWRnaXNuQTRNUUJEdUN1MjJEN2RvcFU1UlRi?=
 =?utf-8?B?ZkJpbGJLRnM3VDVtYW5WWE9kcGYyUVhhRkV5MGNPMHFScjI0MHZaU1JEcEVx?=
 =?utf-8?B?YkNMcXZLbWhTQk5IY05GUGVSZG1WM1Q4UktDNFhNVW1vajh0Rlk5anlQTjBm?=
 =?utf-8?B?VHRSYm5nUVJ6MXpLVHF2M01CK3NudDNpODA4S1B4TnRVQTA3MHNLSS9LaGRB?=
 =?utf-8?B?VU4vYjdpMU8zK21JWjVyLzJSc0VqSDFmd1pndkdpK2RYT1lBR0IrcVBad2Vn?=
 =?utf-8?B?OE40Y0RCUFlrOEdmc054ZmZJQXI3cVl0WXRqejZ3TW1RVWFsNUZ2WnhxdkhS?=
 =?utf-8?B?YTZ5OS9YQ2thK3g3K3pDVGptN0szUnZMZVVKUTRoNTRGRml5UzlTQWhBK3pr?=
 =?utf-8?B?Wm1ITCs2VXNiWFNORzR0ZlVFa2grLzhGOGxhcG1HMjR0aWdxSHNrMTdqczZ0?=
 =?utf-8?B?a21nTkRBb0FyMFlyYXphOFhBd3M0WXBTbzJ0MUtUY2V2clZnUTRncU9wUHFt?=
 =?utf-8?B?SWJaeFlPeEhWRlgvWWFSb29NVGZ2dlJHem5RYTVBclhhNktHZzNpKytCUkNC?=
 =?utf-8?B?S2dpUTRyVHdscnUwZWE3RTlYVUFVL25qRWhjekR5MlJKMnlkTlNMOHdxKzBD?=
 =?utf-8?B?d3AyQlJOY3hMc3EyWDh5VzczamVoaEphNHBqcFl4K3VWaWpYY2E2Nm43NW9k?=
 =?utf-8?B?NDBUSlBxUzUyQ3hZdEdJcVIyL2YrSEtvWXhjSG8vV3E1ZlRQcE13MnZtc3FY?=
 =?utf-8?B?OG8wOW5nYktrM2xNRmtMZGxPOXp1Um1EQWtjY3NLR2hXck5RZTB1NmZOVG9q?=
 =?utf-8?B?RlJuNUs5czYwVjNWdFBlNnhEQUc1MG04dGFSQTRkQ3Rjd2tuYitWSDBkN1dv?=
 =?utf-8?B?dXJzc0dvMWlJS2xrRDlVVjFjTjVUUmZmd1M1MjZ6ZnBmb25WWWF6RnNmcTU2?=
 =?utf-8?B?UFRlcHdod1JFWlFXTFdHSkdWZkR5SURldmFSQk1UY3A4M3RNQVh5MTNZMHVy?=
 =?utf-8?B?eWs1NU5QSzYvaWJ5MDRVbUQxYzIxT2gzalhwa0tkaW9jb1AzUDBIeWhrTUxX?=
 =?utf-8?B?WFpKRXB3T2pQQ3o5Z0VlY0tJMkNRVXFPaEJWZ2tQQy8rcy9NdmFPSlIxbHBq?=
 =?utf-8?B?bkhheE5JeDkvdE00T2ZZblliSExNNEJiZWFZcFVsMjB0OTZQbHZJOC9lRUY2?=
 =?utf-8?B?MEZmVVBMSkNJUkU4RVVWK1JRdHdSQmhaZzZUejBqcC9GeUNNNWN2YXkyQis5?=
 =?utf-8?B?Y3JtTXZoVzFuNWE3a3ZDQ2NrODBvR212dFNpTVNBYTcxWFZsZkVZdlViV2sw?=
 =?utf-8?B?QzBnTWZqRXJ0elBJRE5qbktjdEU3a25GRkE1a2RsMURhb0p4RnRHM09MakVO?=
 =?utf-8?B?S3VtUWtYeEpDOXdodVhRRExtOVVYRmllQ1FFWEdFVkFueFp2N0lNd2kyRERR?=
 =?utf-8?B?VHRXRUhSRlJlR1R1RlRmNzZwSzJoZmNYYmZwWXBQWDZQbDVSTm0xUVBvRkVw?=
 =?utf-8?B?RldJMmx1Z0FBRzRVNFE0L3pqUHhUUnNPYm9yZm5laGlkbk53NDNGWlJnY2ls?=
 =?utf-8?B?c1RESnREMlRJYktxbWlja2RKd2FOL3graWt6L2ZBdG1MbEhWOEJ6cXFBbUsx?=
 =?utf-8?B?SC9nelRhNGgya3VYdkNvVVJnNDFqTVNhU044MTVLbUM5YUdFeHVjaVcyaUVv?=
 =?utf-8?B?K3dEYk5wY0x5SHdWd2lUcnkzdzNUb0tEZEMrK3V3K2EwcHdMUzl4QzhhRHIw?=
 =?utf-8?B?bGxUZEtaMzJrR3Z4cnhNYU5oNEgzS255ejlrcXdUOWJhbndWRFJtb1FiRC9I?=
 =?utf-8?B?R21ZNks0bHpEbWw1TnM2WUpObDhoYzlUeWwzSDhzZ1FmZEY5MDJUZmJvbWxH?=
 =?utf-8?B?cHlHYllVYU5iWUYzWlVMMjVqV0NUUldQNmEvTUtPU1h1R0lsV29UUlZzYkJL?=
 =?utf-8?B?bld6WnM5dWtvUU5rSXovMXJZbTYyeWM4SjJzbkZpbjRFR0YwL093S0orSDEx?=
 =?utf-8?B?ZFBsWVR1bE0yMHArMTBsbUlnTjJwaWFmL2Y1VUl2RkxsUjZWN2d1S3ZzU3gx?=
 =?utf-8?B?M2ZpTFNZZjhPQUx5eUNkTGVyYzFkOElUc01GYlkrVWphUFNhbEZoSU1HT2Mv?=
 =?utf-8?B?OXFGS0RuTU9ra2M0cmUwVlRTaHl6d0pxaS9TRjlvcHgrc1grSDk2ZldNTzFn?=
 =?utf-8?B?MXhOdE8wRHRRUjFoVVJ5cjVGOG54c1A3elFpRU5nN3IzdS9MTHB5L2dZYUhv?=
 =?utf-8?B?azkxNU9nQUJRenlBR0thOE8wY29BPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /TPP2yWLUKLiQ6JL4J+zxUp76Wzk8jvheDGPDLghPbC0HiTcMyksd2xmCqkq2kl30ZWsEwZwL+sx2e6RwGzVbvaYDmqF9s1ud/2jpRQ1kJ1DIe701T1FCdhH8IHHx9/Da5iQ+zGSloHpE4K8KZCzZ3aeiuh+lGRJi32/cANdgDk5EpXds7RLrE0sc5py1q/D0+uJqgROoXRRGmXOR5JKphv9gteTQ1+GocqRP2KaWQ4yi2cjM2l2/ErJSN8NSpQO6ji05IfiiHksUgH/iIJDa+j6zsqf4x9mfu5ph3XfFUFsW/xXHO80TtB104MfV296p8Yo7zmgKBTvLcxz66O2xn+WuCMb4ZQhgFBEEjV6Gb2tEgS6UKlFBgzhW705jHyVpyNLyiZpuTiPweo1Mbi5YDJoocO7gdYRAqgBX0AhzxnZnPa5pOJrqsKyceKYz1uy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:24:24.6979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14725a70-79b9-4127-71ab-08de732a4ccc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maciej.falkowski@linux.intel.com,m:oded.gabbay@gmail.com,m:jeff.hugo@oss.qualcomm.com,m:karol.wachowski@linux.intel.com,m:odedgabbay@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E24E917E473
X-Rspamd-Action: no action


On 2/20/26 08:01, Maciej Falkowski wrote:
> Update firmware boot API to the version 3.29.4.
> Remove unused boot parameters from
> the vpu_firmware_header structure.
>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/vpu_boot_api.h | 211 +++++++++++++-----------------
>   1 file changed, 93 insertions(+), 118 deletions(-)
>
> diff --git a/drivers/accel/ivpu/vpu_boot_api.h b/drivers/accel/ivpu/vpu_boot_api.h
> index 218468bbbcad..a41170bbc6b7 100644
> --- a/drivers/accel/ivpu/vpu_boot_api.h
> +++ b/drivers/accel/ivpu/vpu_boot_api.h
> @@ -1,12 +1,22 @@
>   /* SPDX-License-Identifier: MIT */
>   /*
> - * Copyright (c) 2020-2024, Intel Corporation.
> + * Copyright (c) 2020-2025, Intel Corporation.
> + */
> +
> +/**
> + * @addtogroup Boot
> + * @{
> + */
> +
> +/**
> + * @file
> + * @brief Boot API public header file.
>    */
>   
>   #ifndef VPU_BOOT_API_H
>   #define VPU_BOOT_API_H
>   
> -/*
> +/**
>    *  The below values will be used to construct the version info this way:
>    *  fw_bin_header->api_version[VPU_BOOT_API_VER_ID] = (VPU_BOOT_API_VER_MAJOR << 16) |
>    *  VPU_BOOT_API_VER_MINOR;
> @@ -16,24 +26,24 @@
>    *  partial info a build error will be generated.
>    */
>   
> -/*
> +/**
>    * Major version changes that break backward compatibility.
>    * Major version must start from 1 and can only be incremented.
>    */
>   #define VPU_BOOT_API_VER_MAJOR 3
>   
> -/*
> +/**
>    * Minor version changes when API backward compatibility is preserved.
>    * Resets to 0 if Major version is incremented.
>    */
> -#define VPU_BOOT_API_VER_MINOR 28
> +#define VPU_BOOT_API_VER_MINOR 29
>   
> -/*
> +/**
>    * API header changed (field names, documentation, formatting) but API itself has not been changed
>    */
> -#define VPU_BOOT_API_VER_PATCH 3
> +#define VPU_BOOT_API_VER_PATCH 4
>   
> -/*
> +/**
>    * Index in the API version table
>    * Must be unique for each API
>    */
> @@ -41,7 +51,7 @@
>   
>   #pragma pack(push, 4)
>   
> -/*
> +/**
>    * Firmware image header format
>    */
>   #define VPU_FW_HEADER_SIZE    4096
> @@ -61,44 +71,41 @@ struct vpu_firmware_header {
>   	u32 firmware_version_size;
>   	u64 boot_params_load_address;
>   	u32 api_version[VPU_FW_API_VER_NUM];
> -	/* Size of memory require for firmware execution */
> +	/** Size of memory require for firmware execution */
>   	u32 runtime_size;
>   	u32 shave_nn_fw_size;
> -	/*
> +	/**
>   	 * Size of primary preemption buffer, assuming a 2-job submission queue.
>   	 * NOTE: host driver is expected to adapt size accordingly to actual
>   	 * submission queue size and device capabilities.
>   	 */
>   	u32 preemption_buffer_1_size;
> -	/*
> +	/**
>   	 * Size of secondary preemption buffer, assuming a 2-job submission queue.
>   	 * NOTE: host driver is expected to adapt size accordingly to actual
>   	 * submission queue size and device capabilities.
>   	 */
>   	u32 preemption_buffer_2_size;
> -	/*
> +	/**
>   	 * Maximum preemption buffer size that the FW can use: no need for the host
>   	 * driver to allocate more space than that specified by these fields.
>   	 * A value of 0 means no declared limit.
>   	 */
>   	u32 preemption_buffer_1_max_size;
>   	u32 preemption_buffer_2_max_size;
> -	/* Space reserved for future preemption-related fields. */
> +	/** Space reserved for future preemption-related fields. */
>   	u32 preemption_reserved[4];
> -	/* FW image read only section start address, 4KB aligned */
> +	/** FW image read only section start address, 4KB aligned */
>   	u64 ro_section_start_address;
> -	/* FW image read only section size, 4KB aligned */
> +	/** FW image read only section size, 4KB aligned */
>   	u32 ro_section_size;
>   	u32 reserved;
>   };
>   
> -/*
> +/**
>    * Firmware boot parameters format
>    */
>   
> -#define VPU_BOOT_PLL_COUNT     3
> -#define VPU_BOOT_PLL_OUT_COUNT 4
> -
>   /** Values for boot_type field */
>   #define VPU_BOOT_TYPE_COLDBOOT 0
>   #define VPU_BOOT_TYPE_WARMBOOT 1
> @@ -166,7 +173,7 @@ enum vpu_trace_destination {
>   #define VPU_TRACE_PROC_BIT_ACT_SHV_3 22
>   #define VPU_TRACE_PROC_NO_OF_HW_DEVS 23
>   
> -/* VPU 30xx HW component IDs are sequential, so define first and last IDs. */
> +/** VPU 30xx HW component IDs are sequential, so define first and last IDs. */
>   #define VPU_TRACE_PROC_BIT_30XX_FIRST VPU_TRACE_PROC_BIT_LRT
>   #define VPU_TRACE_PROC_BIT_30XX_LAST  VPU_TRACE_PROC_BIT_SHV_15
>   
> @@ -175,15 +182,7 @@ struct vpu_boot_l2_cache_config {
>   	u8 cfg;
>   };
>   
> -struct vpu_warm_boot_section {
> -	u32 src;
> -	u32 dst;
> -	u32 size;
> -	u32 core_id;
> -	u32 is_clear_op;
> -};
> -
> -/*
> +/**
>    * When HW scheduling mode is enabled, a present period is defined.
>    * It will be used by VPU to swap between normal and focus priorities
>    * to prevent starving of normal priority band (when implemented).
> @@ -206,24 +205,24 @@ struct vpu_warm_boot_section {
>    * Enum for dvfs_mode boot param.
>    */
>   enum vpu_governor {
> -	VPU_GOV_DEFAULT = 0, /* Default Governor for the system */
> -	VPU_GOV_MAX_PERFORMANCE = 1, /* Maximum performance governor */
> -	VPU_GOV_ON_DEMAND = 2, /* On Demand frequency control governor */
> -	VPU_GOV_POWER_SAVE = 3, /* Power save governor */
> -	VPU_GOV_ON_DEMAND_PRIORITY_AWARE = 4 /* On Demand priority based governor */
> +	VPU_GOV_DEFAULT = 0, /** Default Governor for the system */
> +	VPU_GOV_MAX_PERFORMANCE = 1, /** Maximum performance governor */
> +	VPU_GOV_ON_DEMAND = 2, /** On Demand frequency control governor */
> +	VPU_GOV_POWER_SAVE = 3, /** Power save governor */
> +	VPU_GOV_ON_DEMAND_PRIORITY_AWARE = 4 /** On Demand priority based governor */
>   };
>   
>   struct vpu_boot_params {
>   	u32 magic;
>   	u32 vpu_id;
>   	u32 vpu_count;
> -	u32 pad0[5];
> -	/* Clock frequencies: 0x20 - 0xFF */
> +	u32 reserved_0[5];
> +	/** Clock frequencies: 0x20 - 0xFF */
>   	u32 frequency;
> -	u32 pll[VPU_BOOT_PLL_COUNT][VPU_BOOT_PLL_OUT_COUNT];
> +	u32 reserved_1[12];
>   	u32 perf_clk_frequency;
> -	u32 pad1[42];
> -	/* Memory regions: 0x100 - 0x1FF */
> +	u32 reserved_2[42];
> +	/** Memory regions: 0x100 - 0x1FF */
>   	u64 ipc_header_area_start;
>   	u32 ipc_header_area_size;
>   	u64 shared_region_base;
> @@ -234,41 +233,24 @@ struct vpu_boot_params {
>   	u32 global_aliased_pio_size;
>   	u32 autoconfig;
>   	struct vpu_boot_l2_cache_config cache_defaults[VPU_BOOT_L2_CACHE_CFG_NUM];
> -	u64 global_memory_allocator_base;
> -	u32 global_memory_allocator_size;
> +	u32 reserved_3[3];
>   	/**
>   	 * ShaveNN FW section VPU base address
>   	 * On VPU2.7 HW this address must be within 2GB range starting from L2C_PAGE_TABLE base
>   	 */
>   	u64 shave_nn_fw_base;
> -	u64 save_restore_ret_address; /* stores the address of FW's restore entry point */
> -	u32 pad2[43];
> -	/* IRQ re-direct numbers: 0x200 - 0x2FF */
> +	u64 save_restore_ret_address; /** stores the address of FW's restore entry point */
> +	u32 reserved_4[43];
> +	/** IRQ re-direct numbers: 0x200 - 0x2FF */
>   	s32 watchdog_irq_mss;
>   	s32 watchdog_irq_nce;
> -	/* ARM -> VPU doorbell interrupt. ARM is notifying VPU of async command or compute job. */
> +	/** ARM -> VPU doorbell interrupt. ARM is notifying VPU of async command or compute job. */
>   	u32 host_to_vpu_irq;
> -	/* VPU -> ARM job done interrupt. VPU is notifying ARM of compute job completion. */
> +	/** VPU -> ARM job done interrupt. VPU is notifying ARM of compute job completion. */
>   	u32 job_done_irq;
> -	/* VPU -> ARM IRQ line to use to request MMU update. */
> -	u32 mmu_update_request_irq;
> -	/* ARM -> VPU IRQ line to use to notify of MMU update completion. */
> -	u32 mmu_update_done_irq;
> -	/* ARM -> VPU IRQ line to use to request power level change. */
> -	u32 set_power_level_irq;
> -	/* VPU -> ARM IRQ line to use to notify of power level change completion. */
> -	u32 set_power_level_done_irq;
> -	/* VPU -> ARM IRQ line to use to notify of VPU idle state change */
> -	u32 set_vpu_idle_update_irq;
> -	/* VPU -> ARM IRQ line to use to request counter reset. */
> -	u32 metric_query_event_irq;
> -	/* ARM -> VPU IRQ line to use to notify of counter reset completion. */
> -	u32 metric_query_event_done_irq;
> -	/* VPU -> ARM IRQ line to use to notify of preemption completion. */
> -	u32 preemption_done_irq;
> -	/* Padding. */
> -	u32 pad3[52];
> -	/* Silicon information: 0x300 - 0x3FF */
> +	/** Padding. */
> +	u32 reserved_5[60];
> +	/** Silicon information: 0x300 - 0x3FF */
>   	u32 host_version_id;
>   	u32 si_stepping;
>   	u64 device_id;
> @@ -294,7 +276,7 @@ struct vpu_boot_params {
>   	u32 crit_tracing_buff_size;
>   	u64 verbose_tracing_buff_addr;
>   	u32 verbose_tracing_buff_size;
> -	u64 verbose_tracing_sw_component_mask; /* TO BE REMOVED */
> +	u64 verbose_tracing_sw_component_mask; /** TO BE REMOVED */
>   	/**
>   	 * Mask of destinations to which logging messages are delivered; bitwise OR
>   	 * of values defined in vpu_trace_destination enum.
> @@ -308,11 +290,7 @@ struct vpu_boot_params {
>   	/** Mask of trace message formats supported by the driver */
>   	u64 tracing_buff_message_format_mask;
>   	u64 trace_reserved_1[2];
> -	/**
> -	 * Period at which the VPU reads the temp sensor values into MMIO, on
> -	 * platforms where that is necessary (in ms). 0 to disable reads.
> -	 */
> -	u32 temp_sensor_period_ms;
> +	u32 reserved_6;
>   	/** PLL ratio for efficient clock frequency */
>   	u32 pn_freq_pll_ratio;
>   	/**
> @@ -347,11 +325,11 @@ struct vpu_boot_params {
>   	 *       1: IPC message required to save state on D0i3 entry flow.
>   	 */
>   	u32 d0i3_delayed_entry;
> -	/* Time spent by VPU in D0i3 state */
> +	/** Time spent by VPU in D0i3 state */
>   	u64 d0i3_residency_time_us;
> -	/* Value of VPU perf counter at the time of entering D0i3 state . */
> +	/** Value of VPU perf counter at the time of entering D0i3 state . */
>   	u64 d0i3_entry_vpu_ts;
> -	/*
> +	/**
>   	 * The system time of the host operating system in microseconds.
>   	 * E.g the number of microseconds since 1st of January 1970, or whatever
>   	 * date the host operating system uses to maintain system time.
> @@ -359,57 +337,52 @@ struct vpu_boot_params {
>   	 * The KMD is required to update this value on every VPU reset.
>   	 */
>   	u64 system_time_us;
> -	u32 pad4[2];
> -	/*
> +	u32 reserved_7[2];
> +	/**
>   	 * The delta between device monotonic time and the current value of the
>   	 * HW timestamp register, in ticks. Written by the firmware during boot.
>   	 * Can be used by the KMD to calculate device time.
>   	 */
>   	u64 device_time_delta_ticks;
> -	u32 pad7[14];
> -	/* Warm boot information: 0x400 - 0x43F */
> -	u32 warm_boot_sections_count;
> -	u32 warm_boot_start_address_reference;
> -	u32 warm_boot_section_info_address_offset;
> -	u32 pad5[13];
> -	/* Power States transitions timestamps: 0x440 - 0x46F*/
> -	struct {
> -		/* VPU_IDLE -> VPU_ACTIVE transition initiated timestamp */
> +	u32 reserved_8[30];
> +	/** Power States transitions timestamps: 0x440 - 0x46F*/
> +	struct power_states_timestamps {
> +		/** VPU_IDLE -> VPU_ACTIVE transition initiated timestamp */
>   		u64 vpu_active_state_requested;
> -		/* VPU_IDLE -> VPU_ACTIVE transition completed timestamp */
> +		/** VPU_IDLE -> VPU_ACTIVE transition completed timestamp */
>   		u64 vpu_active_state_achieved;
> -		/* VPU_ACTIVE -> VPU_IDLE transition initiated timestamp */
> +		/** VPU_ACTIVE -> VPU_IDLE transition initiated timestamp */
>   		u64 vpu_idle_state_requested;
> -		/* VPU_ACTIVE -> VPU_IDLE transition completed timestamp */
> +		/** VPU_ACTIVE -> VPU_IDLE transition completed timestamp */
>   		u64 vpu_idle_state_achieved;
> -		/* VPU_IDLE -> VPU_STANDBY transition initiated timestamp */
> +		/** VPU_IDLE -> VPU_STANDBY transition initiated timestamp */
>   		u64 vpu_standby_state_requested;
> -		/* VPU_IDLE -> VPU_STANDBY transition completed timestamp */
> +		/** VPU_IDLE -> VPU_STANDBY transition completed timestamp */
>   		u64 vpu_standby_state_achieved;
>   	} power_states_timestamps;
> -	/* VPU scheduling mode. Values defined by VPU_SCHEDULING_MODE_* macros. */
> +	/** VPU scheduling mode. Values defined by VPU_SCHEDULING_MODE_* macros. */
>   	u32 vpu_scheduling_mode;
> -	/* Present call period in milliseconds. */
> +	/** Present call period in milliseconds. */
>   	u32 vpu_focus_present_timer_ms;
> -	/* VPU ECC Signaling */
> +	/** VPU ECC Signaling */
>   	u32 vpu_uses_ecc_mca_signal;
> -	/* Values defined by POWER_PROFILE* macros */
> +	/** Values defined by POWER_PROFILE* macros */
>   	u32 power_profile;
> -	/* Microsecond value for DCT active cycle */
> +	/** Microsecond value for DCT active cycle */
>   	u32 dct_active_us;
> -	/* Microsecond value for DCT inactive cycle */
> +	/** Microsecond value for DCT inactive cycle */
>   	u32 dct_inactive_us;
> -	/* Unused/reserved: 0x488 - 0xFFF */
> -	u32 pad6[734];
> +	/** Unused/reserved: 0x488 - 0xFFF */
> +	u32 reserved_9[734];
>   };
>   
> -/* Magic numbers set between host and vpu to detect corruption of tracing init */
> +/** Magic numbers set between host and vpu to detect corruption of tracing init */
>   #define VPU_TRACING_BUFFER_CANARY (0xCAFECAFE)
>   
> -/* Tracing buffer message format definitions */
> +/** Tracing buffer message format definitions */
>   #define VPU_TRACING_FORMAT_STRING 0
>   #define VPU_TRACING_FORMAT_MIPI	  2
> -/*
> +/**
>    * Header of the tracing buffer.
>    * The below defined header will be stored at the beginning of
>    * each allocated tracing buffer, followed by a series of 256b
> @@ -421,53 +394,55 @@ struct vpu_tracing_buffer_header {
>   	 * @see VPU_TRACING_BUFFER_CANARY
>   	 */
>   	u32 host_canary_start;
> -	/* offset from start of buffer for trace entries */
> +	/** offset from start of buffer for trace entries */
>   	u32 read_index;
> -	/* keeps track of wrapping on the reader side */
> +	/** keeps track of wrapping on the reader side */
>   	u32 read_wrap_count;
>   	u32 pad_to_cache_line_size_0[13];
> -	/* End of first cache line */
> +	/** End of first cache line */
>   
>   	/**
>   	 * Magic number set by host to detect corruption
>   	 * @see VPU_TRACING_BUFFER_CANARY
>   	 */
>   	u32 vpu_canary_start;
> -	/* offset from start of buffer from write start */
> +	/** offset from start of buffer from write start */
>   	u32 write_index;
> -	/* counter for buffer wrapping */
> +	/** counter for buffer wrapping */
>   	u32 wrap_count;
> -	/* legacy field - do not use */
> +	/** legacy field - do not use */
>   	u32 reserved_0;
>   	/**
> -	 * Size of the log buffer include this header (@header_size) and space
> -	 * reserved for all messages. If @alignment` is greater that 0 the @Size
> -	 * must be multiple of @Alignment.
> +	 * Size of the log buffer including this header (`header_size`) and space
> +	 * reserved for all messages. If `alignment` is greater than 0, the `size`
> +	 * must be a multiple of `alignment`.
>   	 */
>   	u32 size;
> -	/* Header version */
> +	/** Header version */
>   	u16 header_version;
> -	/* Header size */
> +	/** Header size */
>   	u16 header_size;
> -	/*
> +	/**
>   	 * Format of the messages in the trace buffer
>   	 * 0 - null terminated string
>   	 * 1 - size + null terminated string
>   	 * 2 - MIPI-SysT encoding
>   	 */
>   	u32 format;
> -	/*
> +	/**
>   	 * Message alignment
>   	 * 0 - messages are place 1 after another
>   	 * n - every message starts and multiple on offset
>   	 */
> -	u32 alignment; /* 64, 128, 256 */
> -	/* Name of the logging entity, i.e "LRT", "LNN", "SHV0", etc */
> +	u32 alignment; /** 64, 128, 256 */
> +	/** Name of the logging entity, i.e "LRT", "LNN", "SHV0", etc */
>   	char name[16];
>   	u32 pad_to_cache_line_size_1[4];
> -	/* End of second cache line */
> +	/** End of second cache line */
>   };
>   
>   #pragma pack(pop)
>   
>   #endif
> +
> +///@}
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
