Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA78Co8cj2lQJAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:43:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE191361CF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA98310E802;
	Fri, 13 Feb 2026 12:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="EPRwNFjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F75310E802
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 12:43:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dsq5r/JNEABp6lB9qdjPKZdH8AgfdyQKrO6qtk4fqUuRwZBOt/w4dtUXbl9yMDRVsKotCgUIlPtF9beAlqXGCgZP+Zquk5bppI4Ftc1B2l11ffr/k/rprTwsbmKBpS9ja/zsiqcOEEIXGQAPmG6xPohPVlWm6ZX8nu1VTb7+njsqO6XNxTAn7Q2ORcUsZVaEJi8BpYSKxTarHpaKGGEXE/iNrsesuoR2GZJjo9edB1kMN7oVSUsrK8p/lAfvIW+6NqsRyFdNM763h9SD9mARSxmCN20Ej9d6cZE5bmnye2EDjkiFIWAal3KCJMKSSNguPnQIKahmqaf5N3RmXfzyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sKmYptfCsNPF8rwN/cnBEXUwFww38kEmAB6KrkJz6k=;
 b=b1T81Jj52hw6+ph8bi3l169mSlLtef9q2oSpS4At12vce3UNyqqQRhLNA4PFsUItSvaZLQZ/SKcxcipMoB+uC7asDYiltIejgam5AUJ27ifkXLUg/NShm+KasCidShDnyCGv8VpmWb5wiQmRz2FkBKHmy2S3CVeiVYGxAe0fImPkGAy5jKHWvKoYNG45o5/PStptSowvue3dWcjUTmSBMjHIXPeqGtgPn/7f9ocSdjcJthRT8Wj4sYie3JlyjaMS9i5ASWwmsJQQAKViNRDCp4+XeB+gHekPPXo+w4PM9Ih6OZcWS/0PGyFT5vWpMivfd6kYQTUo+ixmc+zdNWM4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sKmYptfCsNPF8rwN/cnBEXUwFww38kEmAB6KrkJz6k=;
 b=EPRwNFjhv+F1WUb3TdIoYzkss8rX7UjrkCUTRVrMHj+0eK8Slg/EvPLe4GTrYb/C6xaIWoj3Begdd2ewpfCNMiVNb13LSd3XkfTvaAgWeEcXy4xjyL3MwMUNLS182pjPMMOaa9zE2nf68g1RF060HO3zMFLBB+0uHQWqG1bdWzM=
Received: from CH0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:610:b1::34)
 by SJ2PR10MB7082.namprd10.prod.outlook.com (2603:10b6:a03:4ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 12:43:51 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::92) by CH0PR13CA0029.outlook.office365.com
 (2603:10b6:610:b1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 12:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 12:43:50 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 06:43:39 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 06:43:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 06:43:39 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61DChYNt1207665;
 Fri, 13 Feb 2026 06:43:35 -0600
Message-ID: <bb6e51c4-8427-44c8-bf55-ffa948157409@ti.com>
Date: Fri, 13 Feb 2026 18:13:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display: ti, am65x-dss: Add am62p dss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>, <mwalle@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>
References: <20260116095406.2544565-1-s-jain1@ti.com>
 <20260116095406.2544565-2-s-jain1@ti.com>
 <34759368-6b0f-421f-81dd-20006ee19a1b@kernel.org>
 <1cc5e036-12b6-4b0d-9393-21bbb0dd3f48@ti.com>
 <3c8203d0-499f-42be-9cc7-c205b03e76b3@kernel.org>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <3c8203d0-499f-42be-9cc7-c205b03e76b3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|SJ2PR10MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: d60b677d-ff30-41da-febf-08de6afd89a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjhBc1hoZGFYOFhIdnRzL3IxUmdTUzEvZE5nZ2FTdUVseG9USlgzdVFITTMx?=
 =?utf-8?B?ZHgwTWdBM0JGYlh3eTM2Q0VNZ1R4N2I4TFA5K2RxdjA4L0tnUlZUUFU0L21F?=
 =?utf-8?B?RDZnTjVyQkFqTVppTVNRcnJTZi9HcytKNndOVGo4bllvNkZ0K0RaVW5BSHpS?=
 =?utf-8?B?U1plWU1OcGJ2MGdMVTR4SVQ4KzI5emM1Sk9QQnd6ZEg2L1p1RnpUT2IzOXhy?=
 =?utf-8?B?UHB1Qm16aDBEM05Dem5hNGw1UTVaVDliU1g4STFWZzhPM1hWUDRNaEVpRnoz?=
 =?utf-8?B?aE9MNGFuSUE0a2RsUE1vcjZyNEpleFpJbVBEUXlmOGFYbnRMMzJHc0JJdnMv?=
 =?utf-8?B?czJ5ei9sd0l6NUVvVURUWENiMGNOS0NydWxZcFJDVkJVdGFVOWtMNmdHUHh6?=
 =?utf-8?B?RjczVm8vL2oyZHl6MGN3aktFZnhzWlN3cDlVWlFadm4wL0hxeG10V3kyaVlO?=
 =?utf-8?B?bHZSd0FnNjZRODN1eHJMaGJ5Q2hzeFJiSEx3N2cxWHZIODBWM2tYR1REOEll?=
 =?utf-8?B?V1I5YXNVRU15RC9PVDYxM29lMWFEeXNjejF6MlFwZHVwQ09CUDNLcWh0OGxR?=
 =?utf-8?B?Mi9wTFNYZHcrRnd6V1p1U3FVU2FYc2I4ZFBxUXAvMjBPVmFMTjRwYnI4Q0lI?=
 =?utf-8?B?SE5JZEtqQUhjOTBGS1N0R0pZTm5ia1Y0Z1Q0ZnRDVEh4cm1TYjBFODhqNHlw?=
 =?utf-8?B?dTY5dlZUMFBYeDRtRkg1YjlPUWNwK2xMMXN2MlJRTFRmZXA0QjRycks3b0Qv?=
 =?utf-8?B?WWI0a2lqNDhWYzJyeTZWRVhrdDZVZExjTGRjandZTFJsSm53VVAzZmY1cFJ1?=
 =?utf-8?B?aHo2a1dXK3RzVi9hQ3Zmclg5cEtEL0NxVGN6bFpUNlk0T0RkR25VckZNMy91?=
 =?utf-8?B?eFpTUU1CZWQvMVU0Y0FON1VQcERQYjV5eTkvVjQ5TkNMajRBT2VuZWJ6OENO?=
 =?utf-8?B?UmMrdE9JUFVwVmRRR3IxY1VJK0xCbGQ5ZzJBYzZ1c3RYVTZQY01lM0hnOFpG?=
 =?utf-8?B?cGZjMnlORDZsL2w2aFkvTjBOaGhKcTBvenJyY3UzZERtTy9RWTZMSEtib3hR?=
 =?utf-8?B?R1o0MkpETjBFRVdla21qWkZ5U1p3Y3dNVkowcjRVOGhpS0pkMUdNZngzU0F2?=
 =?utf-8?B?SU1UaGlMV3ZSc0E4cG9FR00zaytqSkxqV2oyc2Y4U0Y1cXVycGcxVDF5VSs4?=
 =?utf-8?B?UXI1dDdUWkRvODVwMUlqUUhzZFZ3WUc2RVNoaU1KU1ZBbG5ReXdLNXhaakkw?=
 =?utf-8?B?VVV3Qk5kQyt1bTVCZnZYUUt3eFh2cjNubWN2YVEzcjhzTVkwN0tucGROeUI0?=
 =?utf-8?B?eUFFdmsxNFhIL2ZoVkZlcktUK21tOW13WWpyQk5BWmxQelR5eU1pK2xSQlA1?=
 =?utf-8?B?OUhJSWNrRG84UGJ6NW5oWW81cDZZb25zUHB2eXpudkdYQk5nL3djclFnTGZz?=
 =?utf-8?B?cXd3OVpYZUxTZGI1UlQ1UW8vMEIrY1V6blk4djdkY3J0Q2p3UVBhenN3dzVI?=
 =?utf-8?B?emN2dVZqazdSZVdwVSs5cVovQ0U1b0g2dDZmVEhZOVY3SUJSNkVEa0NVZ21Q?=
 =?utf-8?B?Uzlnc3ZjQjFKOVNKTjg2ZlkyVUliVTg1ZjdyUW5WcmRQNzRVTjdXZTVSYWRl?=
 =?utf-8?B?MTZ1QXNUNHlLemFBYVZnemFNS2t2UjV4dVQvSzkyVkNObVhYNER3NG9XL0d6?=
 =?utf-8?B?WnpEMnEvYXRJTUtQWVBvcFBSS2NGVUZrR1haY1RjQklkMzVQcmp3NytOT0tR?=
 =?utf-8?B?U21LY0EvVXM0YmpnY3U1aDZtV1NpSEFpd1NBR1d0c29kRnJ2MlArK2lNeVF3?=
 =?utf-8?B?Z3plQTVNak5sT00ydXhQMFduSkxyaWVmRWdrbXNuMXZodEE4WG5XL1IwcFVx?=
 =?utf-8?B?b01CKytEcG5LUk1YdUJFcmcrcHhPbDNyWXJsMHU5Q1VOUFNjc3VnVlB5Y1Bs?=
 =?utf-8?B?QVdPNTFwcFkxaUtscTYvd0xTcGxUQk1pM3VRaS82dGh5bUJpTEZlclZTbnE3?=
 =?utf-8?B?WjZVY09xa3VwTnhuK1d3cVpwY3JSUHd1WndvbkF1S0djTS9nU0hhTmtyNXgy?=
 =?utf-8?B?ZzhGRW8wWjNUNmVLN2hqaW5FQXJzMTVzaXdmaytLaGhHSnBUbWhOQmxJSEJt?=
 =?utf-8?B?S3cxL2doUVZONExIQUZFZVNLRFhmbzJHNGh2K1hsYk95d2NKT2lscEdKVG9R?=
 =?utf-8?B?YVg0R3doMGlMcnNLY2I0ZlNtUXRZd1VCV0lDTVRrbGUwaW5Mbjhud3Vra2w5?=
 =?utf-8?B?REdjOUZ1MDU0NnA3QWExZUxxR213PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JIZp79eePMzNgeIQJ7rBRPSGYNETcUnbZq+JNcjzxtKXlaS7BzxrGKqGyebJiKf9ydcKi9ebvRYykY4oZsgi1ntRZFXmnKfDubbQFKTp84vQnjZyWt+Mmcok0s1wU4NkYhxkUhjIfUwP7QpWuIDgmYmbgzzcyKRaNHzyAiDoAPB47REYnIP7Y5CVhDqn3ZUJgF848ElzpDOBYj84I0IVpo54I8shguhRdzalkXSafF1X+vJy0QaefiHbc3TffAJtgAICq8jT9F8c6GqR0QSwYOOUDEGfzKKHVl/d2Xe13/qmmsauCtW5mMKqZIyU6M1sXgU/eUKQqdFRiVDLKhFX1n9cYSHqd/3uv//CGYbtWRLkuNAYzfmJaU7if6LnP7hnbd79X8l4M9aS/QTyO6Z16ZzUUOVznzmKxUfxNiJUnT5rKcrApyblJoboqo5CyBpN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 12:43:50.0900 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d60b677d-ff30-41da-febf-08de6afd89a7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7082
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
X-Spamd-Result: default: False [4.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aradhya.bhatia@linux.dev,m:mwalle@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devarsht@ti.com,m:praneeth@ti.com,m:u-kumar1@ti.com,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[s-jain1@ti.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,iki.fi,ideasonboard.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[ti.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s-jain1@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8AE191361CF
X-Rspamd-Action: no action

Hi Krzysztof,

On 1/16/26 16:54, Krzysztof Kozlowski wrote:
> On 16/01/2026 12:09, Swamil Jain wrote:
>>>
>>>
>>> This is not how review works. Look:
>>>
>>> 1. You wrote patch on 7th Jan.
>>> 2. I replied ONE DAY LATER.
>>> 3. You waited one week to give reply.
>>> 4. Then two days later you send new version not waiting for my reply.
>>>
>>> If you have one week to reply, then so do I.
>>>
>>> NAK, go to v3 and implement comments.
>>
>> Sorry, we weren't aligned then.
> 
> Aligned on what? Did I respond? No. How much time you gave me to respond?
>

Sorry, I should have waited for your reply.
As per Tomi's suggestion, we should move the OLDI power-domins to 
respective OLDI-TX nodes, then DSS will have a single power-domain.
This doesn't require dt-bindings change for power-domains property.
I will re-spin the series with required changes.

Regards,
Swamil.


> Best regards,
> Krzysztof

