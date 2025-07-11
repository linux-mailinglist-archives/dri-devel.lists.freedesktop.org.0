Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA94B01D47
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C251C10EA53;
	Fri, 11 Jul 2025 13:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KMvaLyTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8B10EA4F;
 Fri, 11 Jul 2025 13:22:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxoSh+wHbZerQzckEQp6gBt5iYYU3ScJNxCwyINjKIR0aiBnU1RsKc5D4daIkC1QpEO/srymOt94t+WSD+MMGws+UXvuowEJ8uVoDCR2sZvCE9be/elGZU5ndGS58Uw0eMkNjHutkgyVjT4oxTfyPjzUufUGUrXKZeR3vM4bDh/FxpwE+iPAKJR2c4i7qgTUk4GIN5p0M0DjSZz8raywS9HC5hJJQp3vp1/UQX0A+Zy+cGWoFmAYInhSIq4DyNxsZJXxYK6Yz2tEZ2WAdofOqQ1gSD658EONEKC8GxH6fcOt8eFfyJt8Gft8FKE3Zyv01SaxYeWx4tvf57f1YhBbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj6GssssMs8RAbED6Qpm2RiKSy51hl/6mSv/Wv/azcg=;
 b=qzCoHopqg5s2Q/pEopY8+Mweh3He8aGmdq1CNjeBX8htjgv1YWbvUg4vI2hQHv9FRMQOj9XWw4C7ZUd1ocvZzO69eDs7J3pkTEeVTKwqc7u2Ul46PO6qFtOgUiqMcSDwDuhkdEOWGwZA2otgyPBkC0h6/gD0pa2llFK8goEDJryoahgLXEzymwdV4ZzzrquTEuwHgq5Il9FYJoz2oWALDCNMDTywst/2BSAy6uhsaxp9YsTLvX1mFXl9K4xsE9IO4rNHzs8QTHcYNlwSnr07dTWMZru4dcRc0fH6ZC7CBuZ5Ay2b+3uZTYSD14Y7+hSbHM4PI7zVA7Zv0fUlJonyyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj6GssssMs8RAbED6Qpm2RiKSy51hl/6mSv/Wv/azcg=;
 b=KMvaLyTTTWESYQhyYv9T/T7JWIcln6hXoGU/ABq60A8M7m+RwVbkcPCKxVsgaj+YnwQ1cvYDcQYZ3LEDA5TQLJ8H1tefShOoBE+VM0iT75qBICzgUAFid521MW2Hfe0vMZJSYuPlS+cmHqbY4R47UfsmWrbVtu23v8B8DqZr3r0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6845.namprd12.prod.outlook.com (2603:10b6:806:25c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 13:22:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 13:22:13 +0000
Message-ID: <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
Date: Fri, 11 Jul 2025 15:22:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0214.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: f50aca4d-b462-4ccb-2e5a-08ddc07df289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFhOMFcrY09tV3RzSHhMakxzRkVwZEh1Z2h6TXJzVituT1lTZnFhTWxDYzRF?=
 =?utf-8?B?MU1JTE5hSWR4TTV1RWtyN0F3Y0RnS1AxYjFoQW5FeWVIRnhFbUxmVVFmWUVz?=
 =?utf-8?B?OW1PUWJCZ0VlcHhncVdhS2t3aGF5U2lnTktKVE9vdDA2R2NqWEhDWldyckZt?=
 =?utf-8?B?VWNXbkFXZU54TTlJUWxEbmlMRnZVNXJyMmZES093WUJPV3d4bDB0YThISHlQ?=
 =?utf-8?B?NWorWGZ4dzQrdDBJMExvWnprdTR2ZHBaVlV2dU1LdVRPZ01TVXR6UzhGQlBH?=
 =?utf-8?B?SmltZTNYSHNjdTBqNWpnWmQwSkpxaS8xWGx0dHlpc1VLOUxncXBqR2MyYjJY?=
 =?utf-8?B?QXQ1WHd4bG0vaVhNVXRMYzF2eEpqMUI5VTczVVNhQTdxeUVubDE5engvOFF4?=
 =?utf-8?B?WG4vS2ZISGp3RjJGOHN0K2xkUC9XMEExWnJSRHhZYWgrVkxwY2d4dDlYM0dj?=
 =?utf-8?B?NERDaXN1SEd5eTh4NW5Ga3NWeThmbWFrY2gwRHpVVmI5WllkTCtPWmRjTXph?=
 =?utf-8?B?NnBqckRIeWk0a3lqVi9aN2pKUmJudDI1UTFqUkpRUEpmOHMyT1E1ZHhldFpv?=
 =?utf-8?B?dkZjZGFZUTRvL2E5SUU4aGsxbVdxcGhUd0ZBdk0wN3Y2eVZnTmtodENEQ3pU?=
 =?utf-8?B?Q1dxRGxQM2ZIV0NmMDVCMHc0WFVmdFN4akIrcUZTSzA2UzRvYzI2NjQ1bnFY?=
 =?utf-8?B?UFlxOWRtVS8wL0xxUFNmSmNLYld1T2p0L1JFd2ovVXErZWR6Mlo2V3cvS2Za?=
 =?utf-8?B?cEZYdjluWFM4cE5RbEsxbFdmeDZXa2JueXd1RWhwSDJOSFh0QkhRZVpTcmc3?=
 =?utf-8?B?RFArTlFXRzZBT0JUTlVCcytTSFZWZURzazVwZHNHZmhWc3FhVU9hc3M4N2lI?=
 =?utf-8?B?dktvUlNSeXVBTzFwamJta3llSmI5dDdMRHVVdGpPa3hBeWVibHQzTDFTbkVH?=
 =?utf-8?B?QU5id1FYemptWC9zOG9JM2tCNTZ2ZVZlQWw1YjZQZ2Ixa2FvK0pwYTd3czU2?=
 =?utf-8?B?SU40bEZabmRvWkFSKytHaDdSRS9zcXROTDJiZFFMMjYxM2xPSWVyUmxYdVQz?=
 =?utf-8?B?TW92aDMySFhhK2FIb1pPSHpQaTNzZ3g2cDJuTElmdkV3YW9oWnVaRzBGS0Rp?=
 =?utf-8?B?NWNxVjFiUkh3RnM3NUdTTVlNTk92aFdDaFowQlJsMVVQRXhqK0xkT05mZHUy?=
 =?utf-8?B?QmZjZDIwbVBhaDh1ZXUzb3A3V01KRGptUy9kaDQrcFZvQi90ZEJ0N2tMdFE4?=
 =?utf-8?B?TWRKR01tQUVkdURTbytDUXd0WmVMT1U1ZVJqRWl3VmEyUzA5dFdLQjF1SW5i?=
 =?utf-8?B?bFZXZVAwRW92RjBJVTZmdkpsWWM0K2FINEMwQkhzZjc0M2JKb0FJZE5HVFpL?=
 =?utf-8?B?bWVyYWkxdkFBaU5OUXRFS25BQVdGOVJFL2FYR1dFN3hkNFloNFg2QWVUUFBu?=
 =?utf-8?B?cHljYVdiTG9rQXF0bkhmNlpMTngvVkNiVjNhdWVIRnVyUlBpOUs4U0NJOTky?=
 =?utf-8?B?NjB1NjBYQXc4aTUxNCtjWG4vaFhNcEI3dlRGamtndUNNeldoZ3FIQlRjMVNC?=
 =?utf-8?B?bXRoOGxnUTRnakswM3NmOXJzazVSRDB3WEFKMWZJRUdEMUhuRzdqeEN4eUQv?=
 =?utf-8?B?clNlZG5rcDlnTzExc1lQZThOWXJRem5nRGNqTmlNRHhPcktBN1lWQ1VBTkY3?=
 =?utf-8?B?REM3WnVwWkNpODFkUGh4MjdsMWNLNUZEc1BJUWoxQUdiRWtVbTNOWU14Qjli?=
 =?utf-8?B?T3FVd0lBQkI5SFJHNlh6THpBelNNRy9OeXRiMk1ZYzhOSy9lKy84TEhTbU04?=
 =?utf-8?B?SE5UUjd6dHgyVUFZNnlQcCtwNUt3Zm9qaVFWaEsxNUZKVmVMQSt4aHE3SGNq?=
 =?utf-8?B?MjF6Wis0THpFOUNiMjFZOStnOHVyamFlb21KeUVJQUVBVzlCNnBjYU9EbHZ0?=
 =?utf-8?B?SXFObjJ0Sk9tMGVDcVIwT0p3S3hmcjR3bUFDTExRQThxR050b1BlUkNqN0ww?=
 =?utf-8?B?Zk1NOGZDRFpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjcyM0RjdGpVUUljT0dNN09KOXRDQW1HNjUyZTVEZFdPNEJ6dlpOY2pzWFBU?=
 =?utf-8?B?dzltRGFxQ2Y1VmhuVnNJRGNjRUJpL3VpWXg3dGlXZEdXdUUvTlhZbTJsSVBr?=
 =?utf-8?B?WUZQekRreGN5TTg3ZUZVWElLSUNiL2ZjR0R4YUx3dm45WWFwRWdndkw3Nmpk?=
 =?utf-8?B?RnNpdjF3VEt1ZjYxdUxLZDZQaVJvYWw3aHBoL3FKbkowUFBtdEpqYXhhYnBC?=
 =?utf-8?B?eHArZWlhWWNKV3hNVG1ZcmFUcG5wTGhvMThOU3VBNm9YUFlwUG1SVVJUKzFj?=
 =?utf-8?B?Z1NsQ1F6TXVLaC9Ldys0SjhOdG1kdjdjcXd5UTlXMDNnMURra0txS1A5ZkZ1?=
 =?utf-8?B?UVgrL2hnNmd4Q2Vyc1FxTlhGcWwwbFNyVEJmMlljQVNPK3N4K1hwUGp4RjhS?=
 =?utf-8?B?VkwwRldnVzZKdjFmUjlrL0ZSWUE2Ymc1OXgwRHJMSE5ObElPNk11cUxhSVZ0?=
 =?utf-8?B?ek9KTk8zdWZydnJQTU5VT2NiY2dSMWtTdWxjTm9HdkVudkdVeHFaQVdqWGlT?=
 =?utf-8?B?WTJDd0tyY3Q3dU1hS2pseTRzbFJMNlA3Q05CQmFzeU5rM1NoQmZYbXF6dU5T?=
 =?utf-8?B?QUxEczRQK3Zxc0ZZYmRyLzRaWlFUeEhMdWVXOVlXZ2lxRm1XeFp0QVdSTThH?=
 =?utf-8?B?MFJrM2dENUMxOHl5N0V2UUs2RmZvNVVpTEpVOUdNTlpxaDNrV2Y5T1pVUS8w?=
 =?utf-8?B?N1psVFZma0FYR3kwdHczRGpRMWgzMGd5RXNQL3BZTEp3MmxlNnA1YmtITjRX?=
 =?utf-8?B?QXhNWEFPbVVleUg3Y3ZncEFLRWx4RDB0ajhxTC9DSFpBNG5scVBUaTdKNk1i?=
 =?utf-8?B?QUd0VXpGRGV3VGQyQ1lNenRHdGtrbGZvK083NzQwZUl0TU5wWVpJdHN1bjBO?=
 =?utf-8?B?TlZQVHVPMkZkVTE0U1FmZFlsVlRjZGo1NkhWdVBUNEhJZld4YTZ3WHVENUpm?=
 =?utf-8?B?RWxhNjQwaVJpSENGaHp6SDNzK0EwaWJndHMxUktpRVllK3RIWmNScksvSnUw?=
 =?utf-8?B?S21pNWlTbktwRVNVYncvalBIOU05SGpuMFJXK3FxY3oyTlo4U21zRzBXVDZa?=
 =?utf-8?B?d2xibkM5VmRCYzV1bEloT2Jra1NGTHd4cTR1R2l6eUpzSDhvMFhrOUo0RnBk?=
 =?utf-8?B?UjFlU24zVmtVOFdlcEhOa2FrMG5SeG5lMDUySExUd0lNTnF5R1RQVVhnbDly?=
 =?utf-8?B?NlQ0dDJXeDIyTkljVEF5VVVYSDNoUGNSVU4vdnZVQzV4VzZOVTdZeWRMZVVw?=
 =?utf-8?B?RWtJN095dzFILzZHV1NRRDExYzcvMkJIUjFCTlpTcDJxNTlITUwxMllkaWNE?=
 =?utf-8?B?MDBJTFhiU3h5aXV4b2hEMjVMZjdUcG1BTXcySld4RFpIMHBXZ0UyTGxjNkI5?=
 =?utf-8?B?dllBbTQ5dGZ3Z0dTZGRld3JPT1VxRE1FNWpURVdLUndLOER5cmtaV2orbVpJ?=
 =?utf-8?B?MHJXK2pjUlo1M25QVlJrSzJMZENrVmJtOEczVkluSEZwM3pibnhWV2JqREZy?=
 =?utf-8?B?eFBhdWdiblV4NXFZekx2S1hlY2ZVL3RxRzAwa1NqMjBucUJRZXhjMlRON1JM?=
 =?utf-8?B?bm1TUERqaWFsUjhkQmw2c0ZQVFgvYkVaQWVRc0JFa3U1eWxmTm5aOEQ4eFNs?=
 =?utf-8?B?NS9ZU2I3QWVQYkg2OWFVM2pvdGFBMGZCTkx1eC80eVVzb1FhQkdoRVAwWTRX?=
 =?utf-8?B?SnNBWVZ0UmV5cVJ1Z3BISWpYTHRQdm1qcmtqRXRGMWo0ODZqTXV6VGE5ZHBn?=
 =?utf-8?B?bXZVaWlKc3NpcXB2L0x6WXFybU9rbWdWSzExNkV1MVFqcmM4VmswMXFxMDNF?=
 =?utf-8?B?SUFmTzlYMXZnbXY5Mk11M3pPMFA4dG9BV3FiODVPbnA2UkI3M3kyM0VnQTJ5?=
 =?utf-8?B?TDIyQjRST1NiSnE5ZzIxRDMzZmkvZnlFWVdSbEdoVFo2WlBJWmhTU2Z1VjVB?=
 =?utf-8?B?U3hHeWNCRWlENTdzUEtiUmNQbzR3S1dwc1AxMHlaWWxnKzdTd0dJUUVvcjYz?=
 =?utf-8?B?ZWpYVGtBckxMMVQ0dG85RDFFa3d1TVNrU1JlNVZONjVYRE5aYUZ4T3kvcXc1?=
 =?utf-8?B?M09XdEdIS1F2SUJEMzJ5WlBpRGUwSklvZWdEenlKSWhCbWZzYTZBVUpDbmZs?=
 =?utf-8?Q?4GYHTDR7tYI+rM2VnBlcTn0Az?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50aca4d-b462-4ccb-2e5a-08ddc07df289
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 13:22:13.2312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdxlRiJTZMQS1d5EbwAUwfdd/G5+W4nRDTnYzELBL+a8jBUp7OQNXwP3xVIX18Dr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6845
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



On 08.07.25 15:25, Maíra Canal wrote:
> When the DRM scheduler times out, it's possible that the GPU isn't hung;
> instead, a job just took unusually long (longer than the timeout) but is
> still running, and there is, thus, no reason to reset the hardware. This
> can occur in two scenarios:
> 
>   1. The job is taking longer than the timeout, but the driver determined
>      through a GPU-specific mechanism that the hardware is still making
>      progress. Hence, the driver would like the scheduler to skip the
>      timeout and treat the job as still pending from then onward. This
>      happens in v3d, Etnaviv, and Xe.
>   2. Timeout has fired before the free-job worker. Consequently, the
>      scheduler calls `sched->ops->timedout_job()` for a job that isn't
>      timed out.
> 
> These two scenarios are problematic because the job was removed from the
> `sched->pending_list` before calling `sched->ops->timedout_job()`, which
> means that when the job finishes, it won't be freed by the scheduler
> though `sched->ops->free_job()` - leading to a memory leak.

Yeah, that is unfortunately intentional.

> To solve these problems, create a new `drm_gpu_sched_stat`, called
> DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip the reset. The
> new status will indicate that the job must be reinserted into
> `sched->pending_list`, and the hardware / driver will still complete that
> job.

Well long story short we have already tried this and the whole approach doesn't work correctly in all cases. See the git history around how we used to destroy the jobs.

The basic problem is that you can always race between timing out and Signaling/destroying the job. This is the long lasting job lifetime issue we already discussed more than once.

If you want to fix this I think the correct approach is to completely drop tracking jobs in the scheduler at all.

Instead we should track the HW fences (or maybe the scheduler fences which point to the HW fence) the scheduler waits for.

This HW fence is then given as a parameter to the driver when we run into a timeout.

This has the clear advantage that dma_fence objects have a well defined livetime and necessary state transition. E.g. you can check at all times if the fence is signaled or not.

Regards,
Christian.

>  
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 46 ++++++++++++++++++++++++++++++++--
>  include/drm/gpu_scheduler.h            |  3 +++
>  2 files changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 0f32e2cb43d6af294408968a970990f9f5c47bee..657846d56dacd4f26fffc954fc3d025c1e6bfc9f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -374,11 +374,16 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>  {
>  	struct drm_sched_job *job;
>  
> -	spin_lock(&sched->job_list_lock);
>  	job = list_first_entry_or_null(&sched->pending_list,
>  				       struct drm_sched_job, list);
>  	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>  		__drm_sched_run_free_queue(sched);
> +}
> +
> +static void drm_sched_run_free_queue_unlocked(struct drm_gpu_scheduler *sched)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	drm_sched_run_free_queue(sched);
>  	spin_unlock(&sched->job_list_lock);
>  }
>  
> @@ -531,6 +536,32 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>  	spin_unlock(&sched->job_list_lock);
>  }
>  
> +/**
> + * drm_sched_job_reinsert_on_false_timeout - reinsert the job on a false timeout
> + * @sched: scheduler instance
> + * @job: job to be reinserted on the pending list
> + *
> + * In the case of a "false timeout" - when a timeout occurs but the GPU isn't
> + * hung and is making progress, the scheduler must reinsert the job back into
> + * @sched->pending_list. Otherwise, the job and its resources won't be freed
> + * through the &struct drm_sched_backend_ops.free_job callback.
> + *
> + * This function must be used in "false timeout" cases only.
> + */
> +static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sched,
> +						    struct drm_sched_job *job)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	list_add(&job->list, &sched->pending_list);
> +
> +	/* After reinserting the job, the scheduler enqueues the free-job work
> +	 * again if ready. Otherwise, a signaled job could be added to the
> +	 * pending list, but never freed.
> +	 */
> +	drm_sched_run_free_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +
>  static void drm_sched_job_timedout(struct work_struct *work)
>  {
>  	struct drm_gpu_scheduler *sched;
> @@ -564,6 +595,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  			job->sched->ops->free_job(job);
>  			sched->free_guilty = false;
>  		}
> +
> +		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
> +			drm_sched_job_reinsert_on_false_timeout(sched, job);
>  	} else {
>  		spin_unlock(&sched->job_list_lock);
>  	}
> @@ -586,6 +620,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   * This function is typically used for reset recovery (see the docu of
>   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>   * scheduler teardown, i.e., before calling drm_sched_fini().
> + *
> + * As it's only used for reset recovery, drivers must not call this function
> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
>   */
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>  {
> @@ -671,6 +709,10 @@ EXPORT_SYMBOL(drm_sched_stop);
>   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>   * scheduler startup. The scheduler itself is fully operational after
>   * drm_sched_init() succeeded.
> + *
> + * As it's only used for reset recovery, drivers must not call this function
> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
>   */
>  void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
>  {
> @@ -1192,7 +1234,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
>  	if (job)
>  		sched->ops->free_job(job);
>  
> -	drm_sched_run_free_queue(sched);
> +	drm_sched_run_free_queue_unlocked(sched);
>  	drm_sched_run_job_queue(sched);
>  }
>  
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 83e5c00d8dd9a83ab20547a93d6fc572de97616e..257d21d8d1d2c4f035d6d4882e159de59b263c76 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -393,11 +393,14 @@ struct drm_sched_job {
>   * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
>   * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
>   * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
> + * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's assumption, the GPU
> + * did not hang and is still running.
>   */
>  enum drm_gpu_sched_stat {
>  	DRM_GPU_SCHED_STAT_NONE,
>  	DRM_GPU_SCHED_STAT_RESET,
>  	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_NO_HANG,
>  };
>  
>  /**
> 

