Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DjoKnoAgmmYNgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 15:04:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11533DA535
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 15:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6B010E5A7;
	Tue,  3 Feb 2026 14:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BDdaTBNQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959D810E02B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 14:04:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9dj8Bmd0slwBUIseMdbQD+DJnXn0ZlyeTEsCCa8MyrSbZBqQNHdGDvdXZQcvWKqsX9AYz5VhMUXcEC4V6kgT6Qbz9x56MOtY9ZB5DyJCXEtlVJ49jMjx3p0Pa7bctpMmnVK6a3h0iJI4J5IaVxolYGpsebh0WducLR20nX8eUqhvAqyVBac939G9OlVRwAtysXBo2UxF7X8i0aWqdVRiDaJXuhxOvlupv16KTlyHFuXbjYg7QisJt4kE0RyAUHRs9WRpXaPMscp2v3/D/JPwWa+Au/l+4jTovRfaXfUVZ3xf1pO9K2HkLn4od0OtM5AQwHevMOgj8VPtoCf1Hhmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bB/pc2+SNsyLXYQjR6nFeszvzsgdoC0hWS+BHbWCLPI=;
 b=S0hzVQZHvBSU5cetZSjqXR+FLOPzsBzHBjJWMPPkCSGhgVLPIwQp7x+hXLo77E1mVBE708O2Dlrfblj8zfKGF7p+Q+wrQ9+uazLp/CZDKCQxukfO1Mgc4kFKdyoJr6RQ3iM9umiQybhwo3hXKMW+ct4N5eHaJfkwgtVffVlzgm7ilqvudYLEB7USz6ngKJN/LENk3BjIURHSYEh8AZsZ9/zLNGpqEjrSFU8/qSYSfYSh4XjK/C9sBWJBAdHobtjto3z0FoFlMvq9aGtIcgj1gFYXjeOY7o1YwCzEk1J09M14XRvVd8jWTbD65fwCJmCgSLVI5D/Nb2psO5ih47rfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bB/pc2+SNsyLXYQjR6nFeszvzsgdoC0hWS+BHbWCLPI=;
 b=BDdaTBNQ+TnhT1mkSD/VGkzdu4q/YZK2hBKHiSC27tJbRb+2dF1z1MB4mzauOok6gKLw+ESoYhysfTVPbSSBjYAb6GtANwgYFKbJc2gSIa6shLHrvX4WMxm34qf/uRqmjMoCqZTct7l2ggdxKMTudvLMl1V7ZJFNQoqtI0Y5rwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:04:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 14:04:33 +0000
Message-ID: <f7f9aa14-6fdb-4470-be51-edac7b54cf4f@amd.com>
Date: Tue, 3 Feb 2026 08:04:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Remove hardware context status
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260202212450.2681273-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260202212450.2681273-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::48) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ea6bdc-437a-477a-a13f-08de632d2821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGVITnBpblF5VVVTTkFFYk9sbWlxR3dvWnBrWVdaSjR4bXVaeDhOY2h4RFNJ?=
 =?utf-8?B?V3h0SHovb0d4VkMzek9QdHlsRmNaNUJMb3RZelUvMGZaNTlxVXZRK2hQVlhD?=
 =?utf-8?B?MFQrQXZaZ3JpTjUwSE5NbjNLZDZUanRCQUsyN28rQUVsaVBCZnR1VmptZXh4?=
 =?utf-8?B?YTdnSGxOSFpTOEFsOVkxcmVXcG9peFhZanAzL2lob0FCUmYzU2RtdFE0R0Zt?=
 =?utf-8?B?VU5ZSEFoc2hjQk9LeUF5UStDdnpoRzNYTVE3eWVlLy9xWGtOOFpzR3IxU3dt?=
 =?utf-8?B?bGpwZ3ZhRGFNYlhaVWlLT0czT0V2amg2a1o3MW1qS2k3R1VsbWl5b3pMRW9t?=
 =?utf-8?B?VHFJZUEvQ1FLZFhXNVBlSFRHNE1RK2JnOENwNkxMeCtmdS8xYTNaYnVIcHBS?=
 =?utf-8?B?cnozam9pME5hQ1NaY3V2VjdjdUZCM1NFR3NzUVJiam9hNFV0S1B1VXdMdWU4?=
 =?utf-8?B?MGg1d0djL1VKOUpZSmpzdXVRZmRBaU1tdTVxMC9XZGlUbE9aNVlKVlpGK0FX?=
 =?utf-8?B?a2F6K29KWVNFWXVXM09FVm1reW05Sm5oZ1JER0cyUko4WDhHMzNnMnM0T1cx?=
 =?utf-8?B?LzFLcGpGWG5QcHdNT01vMGZKMjBBcHdZV0dXTW5QbVNLQTRid1Q0WVlISHRl?=
 =?utf-8?B?RWFCRzd2SlNRU0JHY3lsQjVWVHJyUEEzQWQ1V042eDl3S2hIUit2SFNOaVhO?=
 =?utf-8?B?blBmMkxDTTZNUXc4RzJQbnV2NU43RUlDTDkyTFg4ZEhPckU2SzQwZEFOU2pz?=
 =?utf-8?B?bjdMeEEySk1KSW9YUDFINGRxbHhuZVloaDBoeFpFYlMrclpVK3JJYnVxOGIw?=
 =?utf-8?B?WVdUSFdNalcyNkJkTGkwcmEvRFlhTmpNamRuNFp4RkRxZnMyc1lJUUJHUk11?=
 =?utf-8?B?TFRmYlAxL3VjcHA1OGRlaU1uTG1EWksrUlpPalpZRmxLblpuUFRHeVB0cDRi?=
 =?utf-8?B?TFlXOTZFVFdaaExmN3IrbXR4R3NvME9RaWlobmptcGF5Qm9PQ3hBZFhKSHNM?=
 =?utf-8?B?bHFEV0pKZ2N6QVI0ZW1JcUxOYjU2dksxTHduNk44NDFYWG03V3JOOVZoQXAv?=
 =?utf-8?B?MUlvZk9uaGNKVTlHM1ZhOHFyL1JKY3J5RUIxYUVYNFNxT0xrcmhzTEI0VC95?=
 =?utf-8?B?b1F6eE5XOGhLQitZT2hCTEs2eXBHZXF4TVcvNG9OYnIzYlI4ejdwR1B5SEdU?=
 =?utf-8?B?dHRLcWxFVGpFVzF0TVdFdDV1WmQ5SlV1dzh3TDE1NkZoTzd5L1hjOGlQMFkr?=
 =?utf-8?B?RitkVWxRUGVZMHQrNXZLTEgxa2dNTm5IK0hpQWk2NExPWjlzNFFlYUt6RWpP?=
 =?utf-8?B?NDBZRTFUQVZXTDR0Mm90cGdLWTJvY3hQWkZVRjhXbkg2UnZGQmJmZEkrRjgz?=
 =?utf-8?B?TzVsV1J5dDhFeTNyU3hMWTVTaUgzV0YyTTRRQzhJYVpjR0dXMitnQ3FvWGRm?=
 =?utf-8?B?N080cmVNUi80bDY5K0tZVWRsZEM2WExERVB2b040QmlpS0dUaVQrWHNRd0cx?=
 =?utf-8?B?cndOWTk1cTBYZjJyeFBTY3IvcDdKa3kyMGxINkNDeHZZeGRpOHZUY0N3MElm?=
 =?utf-8?B?ODIyWTNWcExPandBZHhmUXphUGdHZUM5d2ZVSnNDN3dSTVNYeWtpV0JSOVZF?=
 =?utf-8?B?UDRLZFN2b2p2ajA2aHR0bkltSVNhZnFnOGwrVnhyWDcyRkFwNUhOcGp6UzZ5?=
 =?utf-8?B?Y0k3anRtb0t1dDdTK2xMVWZyUGFkazY1VjVjWEEwU05ZVTJMd1RpM0pCRWR4?=
 =?utf-8?B?OXJRVnFacmZnUU5GRGRVSnhVTXBMUWNQNGlJaXI2V0lLTnNXYjhBM25Bd0dh?=
 =?utf-8?B?S04vdndhV01XNHZ5Zjdud1VEQVJESjdQUkZsbEh0dGgxcDd1Ky9QUXlwUXI1?=
 =?utf-8?B?SXpFQkRDYk5HaVdqT1BQK2VNOW5kSUJNcWRlWFV2bVFKalZDemJSWUZQYXZ0?=
 =?utf-8?B?Wnh0aGpobURMV3EzdG02Tm4vSHJsbFVGUG9MMTNMVU13aFFKL1ZXdStMMGsv?=
 =?utf-8?B?NXpJTmZnZnFRbmtyQTgvU2dja0xpamQ0VjE2Rk5XRUZNS0RBQUJETnd0dUpR?=
 =?utf-8?B?V3JVLzhDais1NjRjeE5aamorRDlEUGRkY3d5d3RMTjhIbmQvWEM1S3REQllk?=
 =?utf-8?Q?C5yA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enMzZ0J4eWVBeUNnRmRqQllPS0lER0ZucVhveXlKNU8zcTNSMTZWeUpWYVlO?=
 =?utf-8?B?clFDMFRFc2I4bkxlQzZldmpQZld5QVBFNzkvYVVQWnhsdk9NTVMrY0RleHJ0?=
 =?utf-8?B?NlBodkRwQStNZjh3dy9RQmo0aVhzL2Exc2Qwd0FaSm52SzFJL0h4akhtTU5L?=
 =?utf-8?B?U0RDQUsrNERTRWRxcTlreUYvTStqSEVMVlhrSTg3d2IxbFNvdDdnQXFRcTNr?=
 =?utf-8?B?RkJoc0M2aXBhekhJRTc3bEVqeDlpalRyMDE5cCtmYUV3VUVnOHJGUWpYNmtF?=
 =?utf-8?B?aGVpdE1lem5RUElsR21Ib0RwTVlocEZSQVE3YUVQcGJJaUhqaGczVWovamhJ?=
 =?utf-8?B?emlrNnM3b3dyN09IR2NUQlE0L29HRUxPZ2xEdmZVNE45Ym1IbFZaSFZZM3RI?=
 =?utf-8?B?Q1JhQWt0czVGMXZQbm9WNUVDdDN1L0hVL1VHVUdTeXVCeHdRd1JHaXBMcjZu?=
 =?utf-8?B?YU8zdlkwL0k4QUtIY2pjMzVwT2xtMXRkZU5oaTh6dXhjMGc5d2xXN3VPMm5j?=
 =?utf-8?B?SjVDbm1iMGUzMzYvZFhYSU5sQW81MnNibzNDckM3dUFIZnQzb1VuZkt6M3hk?=
 =?utf-8?B?SEJ4RHRzWmdWRGdza3lzRm5wcmhJdmhMdkpRWllNcmZONmRVUGVEekV0T0FZ?=
 =?utf-8?B?U1l4U0FGbWlFT2pxK25oWC9iUjhkcUFrNzYyYnNqQ0VIMWU5YXRxUDRTT1Fp?=
 =?utf-8?B?VWg2Mm1GSU1JVTl4TWNFTmo1MWdzdXZCUEh5dVhTMUpaL0Q3VHFlZDQzRFdS?=
 =?utf-8?B?ZGVHTWZnRU5SWTg5SnRCai9sZElvMUhmTjhURS9HR2dHR1BEMWFlQkkzTmZE?=
 =?utf-8?B?WW5aTktXS0gzWlNGbDMyUmdqMk9LK3NnaDA3VThFRXhRMlpXV2xLdjk1NXUy?=
 =?utf-8?B?anBTTUJaTDJuRnBQMkNKVmNsUElZVHVpNnFsdm1HTnJzYitkZHkzQVBhbmFJ?=
 =?utf-8?B?MjJpSEhjYW9kTUI3cURpKzZhR1orSlV5cGx1VURQSFFpaUhLVEl3Ky82cVNj?=
 =?utf-8?B?SHVnMkZzMHlpZWxiL1pjVUtXbnBRZ2pTaWZ0NVIvTXZSV3cxdmF3NmdQemFM?=
 =?utf-8?B?dDlWMU1JdzRzcjlrK0cvbkMyM2F0UmRRZ0h1T3UrMjUrNEhJMjViVzdXOE5l?=
 =?utf-8?B?ZmcrT1AzM09HWm5GNXhKTlZacHU4blJGcXR1djR6TzN1VFo4NFlnMzZabzBq?=
 =?utf-8?B?SWoySUduNXAxQnZtNTA1alFMYi9OWWgyMkZUOFlTR0ZIcEoybHVUaFRNR3pP?=
 =?utf-8?B?eHRlZGN2UjBXczYxekhCTzA3YzZDcVNnZDdybUhBU3pkUjJ2RDROVnRadkNX?=
 =?utf-8?B?YU1ZSWZHNVBpTWxrWkszR09JTEsrcHpxazZueFZvektWZmMzaCtKQ2JOMkV1?=
 =?utf-8?B?QXo1Y2Z4WDZ0Y2RPT1BJTG5JSUl4bjVQbzFzWlBWSkluS0UzRVNvRWsvQTdF?=
 =?utf-8?B?VlZtTGxjWFhxWk0xTnFOc0NZSzRGSUNvUDJKcm01RmdSRGlXZTV0NU5uUE0y?=
 =?utf-8?B?U1lEN2NCbkdFdnhlNUdDaEFsUXFVRE1JTEZXR3dkTTJqbHo1UGpsR2l4d2px?=
 =?utf-8?B?elVad3BWYkFpUTAvL1ZLbmJzOVNoNXlLTmJBdEI3SitUQk1iaS92QTAybmho?=
 =?utf-8?B?NlZFZm96MjBXNnNKKzN0RXlUb1hpU2ZSRldDK2ovQXI5T3RFa3BqWXc0TWkv?=
 =?utf-8?B?NkhVMS9WditKMHZ3WXRQcTZZZ0RGMXhHSmppOVRTNVlsNTVZd3hVOU9QWm9h?=
 =?utf-8?B?WUlpQ3I4eE1QYXdnQmRrSHZmMHVMSk5KOVpHblNKTGtQSmg5Vm14MXpvWHpa?=
 =?utf-8?B?MFZvTXN6Q0J1TnpuRnIzR1ZHR0ZlV1grNHAwMmVwa24wbWEyb09vWHJOaDdH?=
 =?utf-8?B?MGFBcjJnQU5HMGhjZzJaZnVxSXE5V3RibFhJS29IS01UZFhHQlBtdlFGdmhK?=
 =?utf-8?B?M245UythMXllT2tERnhiMUl6SlpYV29IMDloODJ1Wmh0RmVlUGtLdy9sM1Bi?=
 =?utf-8?B?TjdOUnMyMDJHTk02czBBakE1eG5sK2RHUVBTWS9FYXdDcmNrS01MUkdkb1ZN?=
 =?utf-8?B?T2VMOUkra00rb1pCZ1J4SU05TDlOM01DZzh1eUtBbmJmZm9aYUMzRnMycDQr?=
 =?utf-8?B?SkovMHo0RDVUNnU1QkhKb2lvNVZ2QzhZRjdkQ2kxKzgycS9mWW92Q3ZOM2Nz?=
 =?utf-8?B?RHN6VllqT2hFR1BlYThmYi9IMXJUd1dCUnNmeFI0blZ6RitCTGFKbjJJZkM3?=
 =?utf-8?B?RmVueTFIYTNNS0FHa2JHSUFlTDY1cnlWUjRPZ1M0N1NrUktQcUQrWlQrZ1pp?=
 =?utf-8?Q?ig0VBikg2O8trIIqt5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ea6bdc-437a-477a-a13f-08de632d2821
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:04:33.3946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53FpH0uB06iHOzVMQ4CmBCzcR0pjNaVtQP3qudHdDoAoENd0X8xqgqww2QG41ZGA6+WWHDRCBMDSKcb9AB9L/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 11533DA535
X-Rspamd-Action: no action

On 2/2/26 3:24 PM, Lizhi Hou wrote:
> One newly supported command does not require hardware context configuration
> to be performed upfront. As a result, checking hardware context status
> causes this command to fail incorrectly.
> 
> Remove hardware context status handling entirely. For other commands,
> if userspace submits a request without configuring the hardware context
> first, the firmware will report an error or time out as appropriate.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c     | 25 ++-----------------------
>   drivers/accel/amdxdna/aie2_message.c |  3 +++
>   drivers/accel/amdxdna/amdxdna_ctx.h  |  5 -----
>   3 files changed, 5 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 208ac5b0579e..db0658fa03b9 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -56,17 +56,6 @@ static void aie2_job_put(struct amdxdna_sched_job *job)
>   	kref_put(&job->refcnt, aie2_job_release);
>   }
>   
> -static void aie2_hwctx_status_shift_stop(struct amdxdna_hwctx *hwctx)
> -{
> -	 hwctx->old_status = hwctx->status;
> -	 hwctx->status = HWCTX_STAT_STOP;
> -}
> -
> -static void aie2_hwctx_status_restore(struct amdxdna_hwctx *hwctx)
> -{
> -	hwctx->status = hwctx->old_status;
> -}
> -
>   /* The bad_job is used in aie2_sched_job_timedout, otherwise, set it to NULL */
>   static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx,
>   			    struct drm_sched_job *bad_job)
> @@ -93,11 +82,6 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
>   		goto out;
>   	}
>   
> -	if (hwctx->status != HWCTX_STAT_READY) {
> -		XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
> -		goto out;
> -	}
> -
>   	ret = aie2_config_cu(hwctx, NULL);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Config cu failed, ret %d", ret);
> @@ -149,7 +133,6 @@ static int aie2_hwctx_suspend_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   
>   	aie2_hwctx_wait_for_idle(hwctx);
>   	aie2_hwctx_stop(xdna, hwctx, NULL);
> -	aie2_hwctx_status_shift_stop(hwctx);
>   
>   	return 0;
>   }
> @@ -171,7 +154,6 @@ static int aie2_hwctx_resume_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   {
>   	struct amdxdna_dev *xdna = hwctx->client->xdna;
>   
> -	aie2_hwctx_status_restore(hwctx);
>   	return aie2_hwctx_restart(xdna, hwctx);
>   }
>   
> @@ -334,7 +316,7 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>   	struct dma_fence *fence;
>   	int ret;
>   
> -	if (hwctx->status != HWCTX_STAT_READY)
> +	if (!hwctx->priv->mbox_chann)
>   		return NULL;
>   
>   	if (!mmget_not_zero(job->mm))
> @@ -716,7 +698,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	}
>   	amdxdna_pm_suspend_put(xdna);
>   
> -	hwctx->status = HWCTX_STAT_INIT;
>   	init_waitqueue_head(&priv->job_free_wq);
>   
>   	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
> @@ -760,7 +741,6 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>   	/* Request fw to destroy hwctx and cancel the rest pending requests */
>   	drm_sched_stop(&hwctx->priv->sched, NULL);
>   	aie2_release_resource(hwctx);
> -	hwctx->status = HWCTX_STAT_STOP;
>   	drm_sched_start(&hwctx->priv->sched, 0);
>   
>   	mutex_unlock(&xdna->dev_lock);
> @@ -805,7 +785,7 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
>   	if (XDNA_MBZ_DBG(xdna, config->pad, sizeof(config->pad)))
>   		return -EINVAL;
>   
> -	if (hwctx->status != HWCTX_STAT_INIT) {
> +	if (hwctx->cus) {
>   		XDNA_ERR(xdna, "Not support re-config CU");
>   		return -EINVAL;
>   	}
> @@ -836,7 +816,6 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
>   	}
>   
>   	wmb(); /* To avoid locking in command submit when check status */
> -	hwctx->status = HWCTX_STAT_READY;
>   
>   	return 0;
>   
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 578eaa7bf137..53e13858077b 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -493,6 +493,9 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx,
>   	if (!chann)
>   		return -ENODEV;
>   
> +	if (!hwctx->cus)
> +		return 0;
> +
>   	if (hwctx->cus->num_cus > MAX_NUM_CUS) {
>   		XDNA_DBG(xdna, "Exceed maximum CU %d", MAX_NUM_CUS);
>   		return -EINVAL;
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index 4f641926a272..e90204edfb7d 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -107,11 +107,6 @@ struct amdxdna_hwctx {
>   	u32				start_col;
>   	u32				num_col;
>   	u32				num_unused_col;
> -#define HWCTX_STAT_INIT  0
> -#define HWCTX_STAT_READY 1
> -#define HWCTX_STAT_STOP  2
> -	u32				status;
> -	u32				old_status;
>   
>   	struct amdxdna_qos_info		     qos;
>   	struct amdxdna_hwctx_param_config_cu *cus;

