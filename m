Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19649B5947A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EEF10E7B1;
	Tue, 16 Sep 2025 10:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x0QIBxDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BD910E7B1;
 Tue, 16 Sep 2025 10:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcgnMIXo/XVKZIUHMLLWvAF6tb9RljXpvRc8Gc0QWxR/vrgnRPYwQiyvhAc7Y0X3J5K1LGg8ynLVm7YMomGU21TOzgbrKHLnGm2hYAlBSPFbDXFFZsDxfPK/5JMes0/pKOdtNaanyId875ryIDTUpJgr0xszEUC2XgJpfZTAowCq/Qae9SPmiARRf20MxsOWkx8d2gDu45ADlQpH9Xj+bPyW9dCxFccSNERT7z6m3NfkCzd+1v+5EF+jTY4AtxgYd2zyPPvkLB7RECjl/5qQ8+Tx8WX7HXkCgTtFdquHUdebfCHB29TWympVBTjhnsNbjhIpBYwucTBc8oowVg+Evg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMfdc8RhkmT454itKfT6H3L/iW/ldbE+gg2e4UTQYTY=;
 b=kpti71QwWimuyz9nESTd/VT4QJfrLBVx7SFBvkP5aTPhQ/k8UpYknyxuKjcL9rQ14gkUJM2QHdAUfRsqQAYG9SzG2xxFlyzftMQAj5uFXYT6Q7mENC9qMJPRjByS8RiLnnc2aUV7XnbvdWkgEhYJNtD9WrDbJNz83GE6ZV1t2h3bLzO6E/eTP92liWPy173YXfL9gBUxzASYzckv1yzDyuiEs+tGgq2T2nPg19QrmXq20B50U3oOXYh+17AcLhNNHuAl2j1tqzqC2oXFTx9jtdUgy6EIQtT8ghPLkBKcPB/yZctP9L53Jkc2lvrap+XjjTg/RBD0p748LFZbROgqbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMfdc8RhkmT454itKfT6H3L/iW/ldbE+gg2e4UTQYTY=;
 b=x0QIBxDvledp1ajFVeXkPhIhuw4NcH0XH9fgM8mqPS8AzSvdRBgtyAxXOaaJqLN6EaO+iEJSqq5Mczo41yzkiWzOrE3DnAsrONp4gOI4bhe07uQI6Lgt30z08Q4uVabTMfEoiOR8J7HKoi/l5NwckFzwo5MbSF99yn8WTeWh3Hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 10:58:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 10:58:26 +0000
Message-ID: <b1897f06-bac3-4677-aa38-c959dedb6c39@amd.com>
Date: Tue, 16 Sep 2025 12:58:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/syncobj_timeline: Exercise signaling of
 awaited points
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20250916095707.918819-2-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250916095707.918819-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0126.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: e116085a-b366-4bd7-c194-08ddf50ff699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTdQeTNLUkg3U1c4d2E1TEh4bHlTdE5yTTJ3WVJsN0dYUWtkTERqWXhjM05Z?=
 =?utf-8?B?QnhuSGxyWE5QakkwWFBXMHMwNktQWUN4Q0pWYmM3MkJUUW5EbEY2KzQxQjdn?=
 =?utf-8?B?OStMcUxTMkdpd2NmS0crczlFVHZONUZWSkJKSU9hZDlzYzVzSnpnVDVmVTRU?=
 =?utf-8?B?TUtGVDhhR3JVRUd4V3RUczdHbDdHN3pGSlJMdndYWmxhWXpZT1d1OGJ1UUpV?=
 =?utf-8?B?a2FtRXhCMFEzNzF6eGxhSE5YYjFMT1hUQVRtNForajlmQTRwU21Xcml2RERT?=
 =?utf-8?B?anEvOUFHT3VoYTZ6Skg5NmJGMHlPc0E2QWtvOE40ZTY5OHZLU0NmRFkrZWQz?=
 =?utf-8?B?bXorNUV6aW84VXpCaWtFZG84MEFUUVpSKytRSVo2T2pNRmlVdmJ2SjVmZzAy?=
 =?utf-8?B?bXpCcVpBRWVnOFFtVldMYWs2NUxJclh6N0NxVGhDc2tXbGxnQjE0aWJZWm9S?=
 =?utf-8?B?cXMzRmZDZGpDemJzaitFb1p2SkRncjdmc3NPWE85V3l1MDlQQmd2ZkdRVzAw?=
 =?utf-8?B?cmdZN1N6YUozQTdYdzJVclJqOHJXVGRCRlovUzdOWGtVOE5YN01MWlZkbVRy?=
 =?utf-8?B?SmNpTVdqYmZoM3Nxb2YrOE9VeXUyVFVuMUVnTVZ3bzJHbVNxWldEbjlWNk1h?=
 =?utf-8?B?bzVVVkh3NzVjbHpTOTU1a2crR1pBOVBJQzh6alZRQzRPMzNjUFBwTVpMRS9h?=
 =?utf-8?B?OUdNaUNpc0lmVTdub3F6bHc4Z2pvMjhUcmRnYkNnMVI3b0NZcmRHaGtYaitr?=
 =?utf-8?B?YUg0ZUJ3Ry9iZGZwZXl0Qk8zaGErNTU5Rkd0dWw5aFM3NEpsYmxGZkI3S1l0?=
 =?utf-8?B?ZE9qWmtaY1VhZCtJdktNTGhscmFBclFtUGI4MHhlRVRkcENoWHBva2k5M0JE?=
 =?utf-8?B?Vnh2ckFQdG1ESnZURDZZcVBWWGFlS2ZwbU5ZSWd5R0VGVnIvUGNUclo2cEJL?=
 =?utf-8?B?U0dzMTN3TUpqby9yeVYrZ3FpYlRubldxNndMVjJVaVFZb0JQNmJMZEtZZytQ?=
 =?utf-8?B?dEIwL3czSWdheXNCSkpwNG5LTjNZL290VFdJZXNQaGFDN3lITThmdHdCT2w0?=
 =?utf-8?B?S1AwVGdzYWNKb2tqUThjdHJXZWtzT1RzSFRMTld2N1VwbHVIT3VYWlhzZjlY?=
 =?utf-8?B?VlZORFF4Qk9WbVU3dTR1TG1yVHVmZjhDMFdCMmRJTUlPTm1WZ2ZDRHFNamdS?=
 =?utf-8?B?eXg2R3FtazNXS3g1bW8xdlZVL2JIUlFodG1IQnpKejA4eU9TWUt1RjlPUXdO?=
 =?utf-8?B?eWdLMDNvWkhlckMxenozdnppY0Qwb24yM0ZVdWE4anV1Vk5vVXdCSGVlT25x?=
 =?utf-8?B?UUg2Vk9WaWwrTm1iL3RUQ0dUVDF3cnpMTjN5d2NUQzVaR1VvbVBmZ21RbWI0?=
 =?utf-8?B?TGM1TkwxRm1KaHJXanBLRE9LVUl4ZHdPS3ZCOVJBYklsZjd5b1l5U01oQVNi?=
 =?utf-8?B?T2VPVStLMDRKRXJvc0wvRmhUZi9rQS8wWnRvZk9nb2RaZEFKam8xbWhsNEZ0?=
 =?utf-8?B?aFpranIveDlFVHVDODF5d1VRZEdvMHBqZ0xseXJ3dlk0aWdreFI2VGhpNThD?=
 =?utf-8?B?dEQrTGVQaXVKait6VDhnRmtNT3Ayc2FtTWJRV3VTUWEzNG1WSjFSd0hxdVBq?=
 =?utf-8?B?Z0xMNW8vd0pvZDBaaGpEaXNXYWtyL3FFakE3Q2RhMVRoMW9YQ1ZsUFJNTSt4?=
 =?utf-8?B?N3k0MVordEJ0dVk1RFJrMmNlNW9RR0lpRzFxRDc2TkxDVEdJQm5YbGc4Umpx?=
 =?utf-8?B?TStYWUlGWGZSQnU4anVzcGRWeWdMUmdKcCtWeVZwSUt1UzRkMklpQmxhVHB0?=
 =?utf-8?B?UDBsd3pvZm9XcUlGSDVDR2FpYkw1QW1GWjJaUVU5TU5aUmZYY1V2cWpCY0pO?=
 =?utf-8?B?RXlWODlyYjYzN1hRUmptTkJabXBPQ0s3T05WckJ2M2thSXFLQVBoRmZOZXBw?=
 =?utf-8?Q?eo6CRdkFcgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUNOZ3FmL21MVjB0NW9hcllIYXNqZWRxanRrMkNIZ2tyL083WEtUYVlzU2dD?=
 =?utf-8?B?Uy8yOWZvQTFTZWZzMTR3VDY4Mys0dEJvdVdod3dBSk9icXEzS1o5bGk3TE8y?=
 =?utf-8?B?MkUzVVRSR0IvNHNuNUZzSEhjM2dOUlVSWkttZms5NEhCelpRTXNKYmVuODJD?=
 =?utf-8?B?c21zM1dORmtYeTBCZmswUzNwcFA5RWtXVGppbFg0NUxadDMyZFVPTm5XcC9S?=
 =?utf-8?B?QzN4OXhPRFdRczI2b2dpWVVkZFhPRDgrajcxdVFPL2c2ejllNjN0SnY3QU13?=
 =?utf-8?B?NE5XSXM2V3ZPMElqK01OVnJKRWNiR2JXQmZxcmNUcmg5SDRyWGtWUUtORUps?=
 =?utf-8?B?ZU5NdHJtaXd5TlNnV2xtSDhHSXpKSUwrNmhFOWMxWlUrWGtnTnJBdk8vbjB6?=
 =?utf-8?B?OEZIbFNDOHQ2cFFueXdQa2MyL0poMm1QR0RPNFdFdi95MGVOQnhEWUpCdit1?=
 =?utf-8?B?VmJBa1dsNDltay9pRmFQZTUzcGZ3eWN1MFN3VDUvVWxvVzgxZUZ6dFVqSlhO?=
 =?utf-8?B?TUFmWU1iRjBndVZXTTFQOWJDRWFOdVdXOTJCeDN4eWJmd3J3V3F0YU9LKzZv?=
 =?utf-8?B?UnFscDlUYTU0RWM2R1BFSXloRlhoRitkUTV3Zml2NTNDNmNhd0s2eW9ETTNG?=
 =?utf-8?B?dFA4ZTBFTVhMZWpoRlRicEo5VFhlK0hneXZ5R2FEQUFMcFF4QzRDbEU2Nk9G?=
 =?utf-8?B?V055ZzFHOGExWGNNNmVlQ0oycG16b1pqcFR2ZHZoWEFMRmltbUdrbCtyTG9s?=
 =?utf-8?B?UWRySGdSQjZtUFhITXBnbVFNTXZySko2T2hWK1MrRU5rTGhpajRiY3BZQzZZ?=
 =?utf-8?B?Ujl6a3pLQllFbmNVNU1RT0pVZFlBdDl4QmEyWDZwTFIwRmgvMFJ1UWs0Ri9X?=
 =?utf-8?B?RjVNb0Z0aVJxdzE2VWx2TmN3WXFrTkJxSE8vY3RkalI1dEl0eDNidDQyd2NO?=
 =?utf-8?B?TWdVOFk5NWFXYXZWb0gyN0FxazlYSkd4dnpIUyt3RHk1SXZ5dVhwdzlCS21E?=
 =?utf-8?B?eWlROXRtLzN2Y1FpV29COElHZEFISkhCNmY1c3JiNDkwcVBSRnVGZDl5RGJC?=
 =?utf-8?B?aXJscitCMHhVek52bHcra3Q3c0NmbjVmTGR1RUthN0FEc0hUbTZML3RTVERn?=
 =?utf-8?B?WjFRRlFWT080Njg3VGJHY2xQbWFMK0hzQ3Q1Zk9NQ0JZSlZCREt6cnJ3Mlc1?=
 =?utf-8?B?MnJaUk15dVAwbDJnZU1FbzBRU05vQy9xQTlhVytIZlFYMDQxU3p3cjVpR0tR?=
 =?utf-8?B?SFVQUEVkSkNFV1QralBJWnl2bEhYMTdZRmpiZWNQdmdHVDkzYVBkN2hpSlZV?=
 =?utf-8?B?ZWdVSFJ6dVdldnlMNm9nUkZjM3RteWVtTW0wbTVkY0JOOVlheGpoSms5bjNj?=
 =?utf-8?B?TWRnVUx2aUZ6cG1JNGQ5REg4YkFKbW9UR2VHL3k2OFYvd2dTUkd6N3ZTK0xN?=
 =?utf-8?B?MHZCZ0JWMHlWS1M5K0dlN0NRNlJFVm1ldmVDOW9QR1ViNGZmM3cvS1NRRVps?=
 =?utf-8?B?cWFCN05HVDRWNVBoeVhOTjFwTkRuQ1gzTTJ4UTRTSS9LZGpaQmNvdTNlRElv?=
 =?utf-8?B?a1FaWU14R1BuK1VHeG9OL296clF2aFpsWS9HazBqVm1Nb3FkYU9iMm81WUZv?=
 =?utf-8?B?dEg2MnQrcTFxNGJSOHpkTUt1cEdxWkRwSENMMWUyN3RNMFZIcUdCek91VktG?=
 =?utf-8?B?QVY3NmwrcTE0YUNNSXRvT2svK0tTWWRSTU9RVTZmVlhjK3VoMVF0UTZOeUJI?=
 =?utf-8?B?cVcyNDB2aSt2M1N6VVVvaUxyQ2FNZlRNbVJuQThDcGV0K202K0VuUVVmVmFa?=
 =?utf-8?B?LzNqdUVrNnorUldpaldNb3A5SjZjY0lNUVdxWDJrSHpDVjBSb2MyT3hPc2k5?=
 =?utf-8?B?bms2cG1yOTA5RmRzSXkyR1ZCdUMwMlVBejNjUzVPN3NHcGVuSkRrbFN6NkNQ?=
 =?utf-8?B?TDNoYmMySnB5ZHJRbnN3MkdvekFFZkM0Nmt5Y0lCaWNoUUNuQ0pIdmZ5RFBL?=
 =?utf-8?B?UFBBRjYxZEwvZE1LUmVNa1lRb2lib21EMDZZM0Q0TU9ueHIvaGJMZDdMblkv?=
 =?utf-8?B?bjQ5ZzFVWHFrYVUvblYvV2FSaTFYSEZJUWRSTnZ1Q0VVV2RySzRFak43Z1Rj?=
 =?utf-8?Q?kN4Id8d37T5EB1Qw5tanS+viU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e116085a-b366-4bd7-c194-08ddf50ff699
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 10:58:26.8553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QokOg/MNmOMJgUVedUABoHwQ7ERQZiQYO8nKOQjHSlYGCRUS/F0BiacJnhdP8ZBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
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



On 16.09.25 11:55, Janusz Krzysztofik wrote:
> CI reports kernel soft lockups when running a wait_backward test case of
> igt@dmabuf@all-tests@dma_fence_chain selftest on less powerful machines.
> A kernel fix has been developed that has proven to resolve the issue, but
> it hasn't been accepted upstream, with a recommendation for dropping that
> test case as a "nonsense".
> 
> Before we decide to take that path, try to implement the problematic test
> case in user space as an IGT subtest.  Since no kernel uAPIs have been
> found that allow strict reimplementation of exact algorithm of the
> problematic test case, where every link of a dma-fence chain is signaled
> one by one from a loop running in kernel space, provide two approximate
> variants, one that signals each fence with an individual system call, and
> one that signals them all in one shot with one system call.

Those tests are unrealistic outside of the syncobj framework.

E.g. a test which exercises signaling each fence individually would require HW which would do that to happen in reality.

Regards,
Christian.

> 
> For more comprehensive testing, also implement the _forward and _random
> scenarios from the original selftest, as well as simplified variants that
> don't enable signaling on each link of the dma-fence chain, and yet others
> that not only enable but also wait on every link of the chain.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  tests/syncobj_timeline.c | 289 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 289 insertions(+)
> 
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index a77896ec1d..80c5970687 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -427,6 +427,61 @@
>   *
>   * SUBTEST: wait-zero-handles
>   * Description: Verifies that waiting on an empty list of syncobj handles is accepted
> + *
> + * SUBTEST: stress-wait-last-signal-forward
> + * Description: Signals each fence of a large timeline while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-backward
> + * Description: Signals each fence of a large timeline in reverse order while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-random
> + * Description: Signals each fence of a large timeline in random order while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-all-forward
> + * Description: Signals all fences of a large timeline while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-all-backward
> + * Description: Signals all fences of a large reverse ordered timeline while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-all-random
> + * Description: Signals all fences of a large randomly ordered timeline while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-forward
> + * Description: Signals each fence of a large timeline with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-backward
> + * Description: Signals each fence of a large timeline in reversed order with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-random
> + * Description: Signals each fence of a large timeline in random order with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-all-forward
> + * Description: Signals all fences of a large timeline with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-all-backward
> + * Description: Signals all fences of a large reversed ordered timeline with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-all-random
> + * Description: Signals all fences of a large randomly ordered timeline with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-all-signal-forward
> + * Description: Signals each fence of a large timeline while another thread is waiting on each point of that timeline
> + *
> + * SUBTEST: stress-wait-all-signal-backward
> + * Description: Signals each fence of a large timeline in reversed order while another thread is waiting on each point of that timeline
> + *
> + * SUBTEST: stress-wait-all-signal-random
> + * Description: Signals each fence of a large timeline in random order while another thread is waiting on each point of that timeline
> + *
> + * SUBTEST: stress-wait-all-signal-all-forward
> + * Description: Signals all fences of a large timeline while another thread is waiting on each point of that timeline
> + *
> + * SUBTEST: stress-wait-all-signal-all-backward
> + * Description: Signals all fences of a large reversed ordered timeline while another thread is waiting on each point of that timeline
> + *
> + * SUBTEST: stress-wait-all-signal-all-random
> + * Description: Signals all fences of a large randomly ordered timeline while another thread is waiting on each point of that timeline
> + *
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
> @@ -1675,6 +1730,217 @@ test_32bits_limit(int fd)
>  	close(timeline);
>  }
>  
> +#define STRESS_FLAGS_WAIT_ALL		DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL
> +#define STRESS_FLAGS_ENABLE_ALL		(STRESS_FLAGS_WAIT_ALL << 1)
> +#define STRESS_FLAGS_SIGNAL_ALL		(STRESS_FLAGS_ENABLE_ALL << 1)
> +#define STRESS_FLAGS_SIGNAL_BACKWARD	(STRESS_FLAGS_SIGNAL_ALL << 1)
> +#define STRESS_FLAGS_SIGNAL_RANDOM	(STRESS_FLAGS_SIGNAL_BACKWARD << 1)
> +
> +const char *stress_descriptions[] = {
> +	/* stress-wait-last-signal-forward */
> +	[0] =
> +		"Signals each fence of a large timeline while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-backward */
> +	[STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals each fence of a large timeline in reverse order while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-random */
> +	[STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals each fence of a large timeline in random order while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-all-forward */
> +	[STRESS_FLAGS_SIGNAL_ALL] =
> +		"Signals all fences of a large timeline while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-all-backward */
> +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals all fences of a large reverse ordered timeline while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-all-random */
> +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals all fences of a large randomly ordered timeline while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-forward */
> +	[STRESS_FLAGS_ENABLE_ALL] =
> +		"Signals each fence of a large timeline with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-backward */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals each fence of a large timeline in reversed order with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-random */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals each fence of a large timeline in random order with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-all-forward */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL] =
> +		"Signals all fences of a large timeline with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-all-backward */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals all fences of a large reversed ordered timeline with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-all-random */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals all fences of a large randomly ordered timeline with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-wait-all-signal-forward */
> +	[STRESS_FLAGS_WAIT_ALL] =
> +		"Signals each fence of a large timeline while another thread is waiting on each point of that timeline",
> +	/* stress-wait-all-signal-backward */
> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals each fence of a large timeline in reversed order while another thread is waiting on each point of that timeline",
> +	/* stress-wait-all-signal-random */
> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals each fence of a large timeline in random order while another thread is waiting on each point of that timeline",
> +	/* stress-wait-all-signal-all-forward */
> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL] =
> +		"Signals all fences of a large timeline while another thread is waiting on each point of that timeline",
> +	/* stress-wait-all-signal-all-backward */
> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals all fences of a large reversed ordered timeline while another thread is waiting on each point of that timeline",
> +	/* stress-wait-all-signal-all-random */
> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals all fences of a large randomly ordered timeline while another thread is waiting on each point of that timeline",
> +};
> +
> +#define TL_LENGTH 4096
> +
> +struct stress_timeline {
> +	int fd;
> +	int swsync;
> +	uint32_t syncobj;
> +	int tmp_fence;
> +	uint32_t *syncobjs;
> +	uint64_t *points;
> +	unsigned int length;
> +	unsigned int flags;
> +	pthread_t thread;
> +	int retval;
> +};
> +
> +static void stress_init(int fd, struct stress_timeline **timeline, unsigned int flags)
> +{
> +	struct stress_timeline *tl;
> +	uint64_t point;
> +	int i;
> +
> +	tl = calloc(TL_LENGTH, sizeof(*tl));
> +	igt_assert(tl);
> +	*timeline = tl;
> +
> +	tl->fd = fd;
> +	tl->tmp_fence = -1;
> +	tl->length = TL_LENGTH;
> +	tl->flags = flags;
> +
> +	tl->swsync = sw_sync_timeline_create();
> +	tl->syncobj = syncobj_create(fd, 0);
> +
> +	tl->syncobjs = calloc(tl->length, sizeof(*tl->syncobjs));
> +	igt_assert(tl->syncobjs);
> +
> +	tl->points = calloc(tl->length, sizeof(*tl->points));
> +	igt_assert(tl->points);
> +
> +	for (i = 0; i < tl->length; i++)
> +		tl->points[i] = (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ? tl->length - 1 : i + 1;
> +	if (flags & STRESS_FLAGS_SIGNAL_RANDOM)
> +		igt_permute_array(tl->points, tl->length, igt_exchange_int64);
> +
> +	for (i = 0; i < tl->length; i++) {
> +		tl->tmp_fence = sw_sync_timeline_create_fence(tl->swsync, tl->points[i]);
> +		tl->syncobjs[i] = syncobj_create(fd, 0);
> +
> +		syncobj_import_sync_file(fd, tl->syncobjs[i], tl->tmp_fence);
> +		close(tl->tmp_fence);
> +		tl->tmp_fence = -1;
> +
> +		syncobj_binary_to_timeline(fd, tl->syncobj, i + 1, tl->syncobjs[i]);
> +		syncobj_destroy(fd, tl->syncobjs[i]);
> +
> +		tl->syncobjs[i] = tl->syncobj;
> +		tl->points[i] = i + 1;
> +	}
> +
> +	if (flags & STRESS_FLAGS_ENABLE_ALL)
> +		igt_assert_eq(syncobj_timeline_wait_err(tl->fd, tl->syncobjs,
> +							tl->points, tl->length, 0,
> +							DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL), -ETIME);
> +
> +	syncobj_timeline_query(fd, &tl->syncobj, &point, 1);
> +	igt_assert_eq(point, 0);
> +}
> +
> +static void *stress_wait_syncobj_thread_func(void *data)
> +{
> +	struct stress_timeline *tl = data;
> +	unsigned int count = (tl->flags & STRESS_FLAGS_WAIT_ALL) ? tl->length : 1;
> +	uint64_t *points = &tl->points[tl->length - count];
> +
> +	tl->retval = -EINPROGRESS;
> +
> +	/* Wait for the timeline signaled */
> +	tl->retval = syncobj_timeline_wait_err(tl->fd, tl->syncobjs, points, count,
> +					       gettime_ns() + 600 * NSECS_PER_SEC,
> +					       tl->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL);
> +
> +	return &tl->retval;
> +}
> +
> +static void test_stress_enable_wait_signal(int fd, struct stress_timeline **timeline,
> +					   unsigned int flags)
> +{
> +	struct stress_timeline *tl;
> +	int64_t dt;
> +	int i;
> +
> +	stress_init(fd, timeline, flags);
> +	tl = *timeline;
> +
> +	tl->retval = 0;
> +	igt_assert_eq(pthread_create(&tl->thread, NULL,
> +				     stress_wait_syncobj_thread_func, tl), 0);
> +	igt_assert_eq(sched_yield(), 0);
> +	while (READ_ONCE(tl->retval) != -EINPROGRESS)
> +		;
> +	igt_assert_eq(sched_yield(), 0);
> +
> +	dt = -gettime_ns();
> +	if (flags & STRESS_FLAGS_SIGNAL_ALL)
> +		sw_sync_timeline_inc(tl->swsync, tl->length);
> +	else
> +		for (i = 0; i < tl->length; i++)
> +			sw_sync_timeline_inc(tl->swsync, 1);
> +	dt += gettime_ns();
> +	igt_info("%s: %d signals in %ld ns\n", __func__, tl->length, dt);
> +
> +	igt_assert_eq(pthread_join(tl->thread, NULL), 0);
> +	tl->thread = 0;
> +	igt_assert_eq(tl->retval, 0);
> +}
> +
> +static void stress_cleanup(struct stress_timeline *timeline)
> +{
> +	if (!timeline)
> +		return;
> +
> +	if (timeline->thread)
> +		igt_warn_on(pthread_join(timeline->thread, NULL));
> +
> +	if (timeline->points)
> +		free(timeline->points);
> +
> +	if (timeline->syncobjs) {
> +		int i;
> +
> +		for (i = 0; i < timeline->length; i++)
> +			if (timeline->syncobjs && timeline->syncobjs[i] != timeline->syncobj)
> +				syncobj_destroy(timeline->fd, timeline->syncobjs[i]);
> +		free(timeline->syncobjs);
> +	}
> +
> +	if (timeline->tmp_fence >= 0)
> +		igt_warn_on(close(timeline->tmp_fence));
> +
> +	if (timeline->syncobj)
> +		syncobj_destroy(timeline->fd, timeline->syncobj);
> +
> +	if (timeline->swsync >= 0)
> +		igt_warn_on(close(timeline->swsync));
> +
> +	free(timeline);
> +}
> +
>  static bool
>  has_syncobj_timeline_wait(int fd)
>  {
> @@ -1934,6 +2200,29 @@ igt_main
>  	igt_subtest("32bits-limit")
>  		test_32bits_limit(fd);
>  
> +	for (unsigned int flags = 0;
> +	     flags < (STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL |
> +		      STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_RANDOM);
> +	     flags++) {
> +		struct stress_timeline *timeline = NULL;
> +
> +		if (flags & STRESS_FLAGS_ENABLE_ALL && flags & STRESS_FLAGS_WAIT_ALL)
> +			continue;
> +
> +		igt_describe(stress_descriptions[flags]);
> +		igt_subtest_f("stress-%s-%s-signal%s-%s",
> +			      (flags & STRESS_FLAGS_ENABLE_ALL) ? "enable" : "wait",
> +			      (flags & (STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_ENABLE_ALL)) ? "all" :
> +											    "last",
> +			      (flags & STRESS_FLAGS_SIGNAL_ALL) ? "-all" : "",
> +			      (flags & STRESS_FLAGS_SIGNAL_RANDOM) ? "random" :
> +			      (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ? "backward" : "forward")
> +			test_stress_enable_wait_signal(fd, &timeline, flags);
> +
> +		igt_fixture
> +			stress_cleanup(READ_ONCE(timeline));
> +	}
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}

