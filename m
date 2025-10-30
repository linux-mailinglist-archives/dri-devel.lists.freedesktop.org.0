Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3539C216B0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 18:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055CB10E313;
	Thu, 30 Oct 2025 17:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eHmNW0i0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7646410E30D;
 Thu, 30 Oct 2025 17:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owD+0aUMwNS/M8ajV07ZPzJ68HdD1dTldPO+71711QRKv2LnovZv/JVlQttwC8p2JNOP4ta6Mj9ezKNjm/aEf6/l7zrzmrC+WT6iQC891J7EKInK8FgwJkzOv+YMYcM2s+Au2ZIEmvfo6EGdHxtNj9ffISgIqrW1Zi/5mdPfOI20dMyFWKHuCd/ccfigpBLTyvnE76tZq4y8J+jbtcu7atmXY+DghL7vkn5/iU0/EwxaEeH8LTimL2vnD2eoSRLO8m0lZNsbPXLBuCZTFloMnlkcGE0cdy38eU/nqevCmwv9n55AogWP2Zx/0T4ygSMpfrSNooW1kb1MWd1vT15d0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nqxb2xqRp7J2vbFTEh2tqYfg8jPsXiWaWbj98txOKn8=;
 b=EZpMCWozHP4exNUIsE+5lV9mXlvWmbimj34zs3JoaA5x+gnlxm6Rna5upFyfbbYnosrqGwrjwqNhjgyu7E3Ol9J+vMQcMHWZXNUcAsg4E26/jorUh0UKjsarz+i9Cf4KiipdwzgMN+Dyl0Yo8GyCCwRWKtNUQcD/ZnTqNHrDggtXrXmWg6lgHSvDkftFqoCnJ5IMQS3htraz9WrhDQV2Nxw9KCRdx18TcFlfja36GLOXPvcgLg/e0fy0zpH1v7l1r8twnp8FFgC8NoldbPRO8BgZqRJXg5Fh5PvFW6njAfRAygRJV/tqoSeW31I0bj6+e0JrCYNZQLLUoro3gc/foQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nqxb2xqRp7J2vbFTEh2tqYfg8jPsXiWaWbj98txOKn8=;
 b=eHmNW0i0BKnNUG9dVuOs2pPwndxhPQkZ+6eBgO/GOydGOGbOKIR333eNU0NeVKgEjqq44xD9wvDyQnrGO6OGTeItvBNZon7hJe/Sgd+jZuIswTJ+jTsPiLXYKr5yXy4UV/K5VGG+FtuENzKum8N5I8f4GXkBrGUQQIDv3sLApoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 17:15:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 17:15:54 +0000
Message-ID: <690b3fd0-20a1-4245-8fc4-4e8b40695c98@amd.com>
Date: Thu, 30 Oct 2025 18:15:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] amd/amdkfd: WQ_PERCPU added to alloc_workqueue users
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Yang, Philip" <Philip.Yang@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20251030161011.282924-1-marco.crivellari@suse.com>
 <20251030161011.282924-4-marco.crivellari@suse.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251030161011.282924-4-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6abd2e-094a-4cc3-8054-08de17d7fbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2svQk42SmFwd2NxcXIxeHJqcU1IU0lKV3l4dW5nQ1hkS3gzQk03cHZ5K3Jp?=
 =?utf-8?B?WEJjN2FrRTRNR2p0WkVwWHZIYzdNalI2NXFPTC9WcHhUWVlhOS9DR0JEZVF5?=
 =?utf-8?B?TTBXT0gzM2NhQmlGaGhUaTZmUTNzazY0T281Z1dRY0VoMnNvVGJvTDhCUzRv?=
 =?utf-8?B?M1orYThaWHlpNnJsN1BhZ25nLzl6WHNiL2xMaENZK1dxemo2RDhHWDNTR25s?=
 =?utf-8?B?RG1acHdtU0Q1cTNJVGpkaG9USlFjeHBjOHhQYmVJclpiOEltdzNydXlIMEFx?=
 =?utf-8?B?WDVyRzJCdUo3alhoTkxmK0xTN0JONWdMNjRYS1RyYVJkZmFLUXYzS2xxZ2JQ?=
 =?utf-8?B?cnFTeU1IQmhEUDltNVRlY2JtV2dYT0Voc2hyUXN2NXRrc1JGVVNveWRiVFcy?=
 =?utf-8?B?Zithc29jZ1BIdzgyZlVGWHVYQkVlclZldjVGTmVxSkx3b1BPVW9Tb25hanJ2?=
 =?utf-8?B?VzRqZUREUTQzN2xrQlk4bDVPWlFqcjlJV28wbGgrYkVGRlY2V0dFdWNia1JF?=
 =?utf-8?B?QnMxR1g1elZLUCtZVXJYTXFSbDFTZjVVQ25ENHhJTkszcW84MUUxdmwrcU1u?=
 =?utf-8?B?VVJqMGNkWFhyRzZrbFp2ZXRTeUJ1TnFlTzFzcDA1eUphd1JxR3hZM3BBL1I1?=
 =?utf-8?B?MmlqY25zWnlRWXZMT0V0ZzZqN1RvTGlpanZ4clh6TTFQbUR4ZXJJYlkvU2xy?=
 =?utf-8?B?VWtoTXcyVGFKTkdOQUNNTkZqSisxbXlvZEJwaDZkREVIVDFkZVRyeXZ2NFR6?=
 =?utf-8?B?NDFPMG8zaTVBUDZhSjF1Y1VlbG1vZTF3UjhaZUpHZHdrZTArTlZ2dUg2UHQ2?=
 =?utf-8?B?NGdVT3gwVXlHR3RPU1YvZHY1SitZMTRBcGNGbHAzVDhuOXJZK0dDNVFNSjRO?=
 =?utf-8?B?SW8zclZwTzMyQUpIZXMvWlhpU3M1ZEtqMjAydWx6M0syWGtseVBoNGV5OEQx?=
 =?utf-8?B?WWJRL05nV0YrOXJyMmppK0lHNG9sc0dYeUh0OVYwbW9mVzNydWcwQkVYdVlI?=
 =?utf-8?B?QTZIU0R3RHdLOExpeW5vbW9SbW1RT1N0dmJmWWJRS3NiM0NzOWN0UHdoRE03?=
 =?utf-8?B?OFBQWWd6clVlczE5U0ZROUtrOW9EMjBTbHBmRlJCVjJTcHVqZVRBTlVYR0Fr?=
 =?utf-8?B?RlVYZVg1WjNGUW44UjhBN0tSUzN2S0NuaUg1ekNmQW9rODM3YkFrQmxaVlR5?=
 =?utf-8?B?L0ltV3pBZHMrNzdzUTVKMFo1UmZuQzBsalJNM2MzVm9kdjRpbk92Slp3UWw2?=
 =?utf-8?B?QnZ3c2tiNXN5NWlLVUJBUkNiSnB2ZjlyZHAwMUd4TTlvaFlva1gvUlh4WWVp?=
 =?utf-8?B?ZmQ4UkVNWURsYkpTMFNmbUk1VGEyQklXRkhFeGxITFM4VTFmd3VHWmhZVzZV?=
 =?utf-8?B?RUJ2dTVFejFnQmpPanlscm9FbW1rVlFTR1d4MjJsVUE5dmxMVkh2VktJd01T?=
 =?utf-8?B?YVp6bnJvRGFINmhiNFhDdG44SWhDd29iRzF1WFR2aEg4VTVmVGxxRmxZcGQ5?=
 =?utf-8?B?TUl5d1h0VzAvNXdWME80c2xWem9OWCtjU2FKOXQ5S3dkYzcxRUNrY0lkaEc5?=
 =?utf-8?B?OENHcm4rSlJGY1Rac25ZS2NqMEluSjlhcEUwTXhDWGJ4ejB4MDVNMXJJa0Mz?=
 =?utf-8?B?bFJteFliNTFOZ3dLNmdodG8yZjMxblFNa25raURrRG9Xa3hxM0ZvY256UzYr?=
 =?utf-8?B?QmxLTW8waWZOR0VjeVVObUpzOE0vcVdoMnpNZUdoYkh5RmRvZHFYazVWWHRZ?=
 =?utf-8?B?RHBJQXp5TTE0cnhXM3RxaTVGRWVibzFSaEErS0xOMFFnZk03YWdDRnNBdUZ2?=
 =?utf-8?B?UnpjelFydzgrS1JDZkZkQkRRSjNVc05tKzBxYUkxNzlyUmE5VCttY1RYaXNE?=
 =?utf-8?B?WkJESVIwTFc0SGNLUWRIRlQ0S1pDSUE4dVh1RFZZNWRWMy9HRDMyaFJLaXd0?=
 =?utf-8?Q?aUM2VwkLSdOlDQoc6juVa0zWcHEm6fmH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEJoTXVtS01XUTE0Q1oyTWdyMEVUcmVFK1lJYXU3TDRXYmFGSkt3TlVNb0hn?=
 =?utf-8?B?emgxV3Z6QUpSS3lHVXQ5d2NDY1F5RUZ2QnBmYVNYbzl6ekRubEcvc245TGVP?=
 =?utf-8?B?b3ZSS2RrN0RIbHl5V0pZRm5teVMwQ3R1SWEwM0h0SDVUWDZDWk1FVjFSRUt6?=
 =?utf-8?B?LzYyZ044NTdWOGZFN0RuaVphcjdJWmV4VXdTZ2ZLZG5TWVYyR0t6L0NOYm53?=
 =?utf-8?B?Ym5Ebk9QUGVsS1NhVXlzZWMzdWhKRUUrTjlxUHc4VWxOamFnQ0pDTjZFay85?=
 =?utf-8?B?SU1vRktBZWNhVnBZZnRyWG9uNDNYREVwd0E0a3dHRk43ZzczeENqYlBrR2cv?=
 =?utf-8?B?MDBNSC91RjVlckRVblRWK2p0RlIzMnB4ZHVCUmVmcHZzQzBXZnZsVThvQldC?=
 =?utf-8?B?a090Qy9jVkZhMkQ3OHlHSkdHOWVKVVc5S1VvWXJyUThDZjZ0T3pVSlBuTUx6?=
 =?utf-8?B?VllUWE9DdHBuN2tGL1pRdFYvenJka1VFcXd1SWs3Rk9uZ3FsTlZ5WURaRFNY?=
 =?utf-8?B?L0cwY2s4NDZQRjY5Sjk1UnFyWjVjU2pENDNvdFMvb01PbEo1TkRNdTNUUjRD?=
 =?utf-8?B?TTR4dnV3emFpS3NvZXc1amRHOVdWKzNLcjFzcSttazZyNzI2aWMycGVPblVQ?=
 =?utf-8?B?L3ArRFdCUEh4d2NFSzdYSjhiMWZ5RWRlVW1TeGFSbkFnR3krSFNvYmV6NXJP?=
 =?utf-8?B?eUQ5WThhYm8wSFZrMTBSVHJqcFhZcXpPNWZVcTFscXJETm1LMEU3OWw5cFM5?=
 =?utf-8?B?Nk9XbTk2Q1kvblF1NFZxeStGdFo3bytCQXUrbFFIcE9objM1cDFCK05mSG1U?=
 =?utf-8?B?Vkg1VnUrSW5OMGhaWGV4YlNKbnFjVTRVb3dSK2QydFRIeEhOVU5wVnhVRDgv?=
 =?utf-8?B?U20xdHhFdDhXUnQ2Q1gzeHN1S3piSEU0QVZxRkQ4V0NlR2lwRUc3TFRnYjh0?=
 =?utf-8?B?cGtGakFCeWtJdWMxdGtpR3krdzVBb3lXMlFhTTVzRTZpZlpnM3R0NUhDbzNM?=
 =?utf-8?B?eFFiQlNqT0FyQzZTcjJTNFZRTlVUNUJQZWVnVVUvU0ZvU0Zld2RIR3cwd1FD?=
 =?utf-8?B?bXBPQktUbDhvT212SEIrV1ZEM2I2eXltUGhWc3FyYkNnNkczeXJLVEJ5dEJp?=
 =?utf-8?B?bXVLeVlIQnZtdkVtaHJOc3VxZDZnc255a2tPN2tNZkJVUkpaRFVMOWZxZGxM?=
 =?utf-8?B?Sm5yNlBIOXNoVEtHdkptN3NYTFRVbm5XNWUxVFU5bW1YdS9IaFlDSUtXYUk2?=
 =?utf-8?B?Z1hac05EVGNkSlBLNEIyT3ZBeElXcDJEQlc5Q1FaeWpyQ3M5ZE5pbk1lQTBV?=
 =?utf-8?B?bkhjbDRnZzIrem5ZR3RENUpuUGFpQkd4TSt3UG9Dc2x6WmFlMllPdXJKNk9S?=
 =?utf-8?B?V1F2TEF4ZTVGdEFkNHhITkJ2dU1kaEE4ajJVdm40L1hDUlZnbnFSQlVYalpk?=
 =?utf-8?B?dVRpcERHWVVIVkVTbUxGVUJURVowSmVmSG01ZU1VSTkra2YyZU5TaklVcGla?=
 =?utf-8?B?WWUzSmM3bTFsVVhmTW1EWlRhNytGYllmRVdVTUxXM295VUxkbHhvaGtOcHhX?=
 =?utf-8?B?RFJnMHNtOEIwdXZxeWtnREp3eXJtVU91dFVhOXZXb0hvbzFETGNXYlpsVkY1?=
 =?utf-8?B?TWwyblpZQkVDcmI0MFFUL0oyRDhuekVTYzZPdnZZNWJuaCtrUFhncEJBZ1k4?=
 =?utf-8?B?UGF1MFpFcmpBQlJYMSttVUFlUHcxWS9JUzJ5MWpFOFhmZzdZTWs5cjVLL1g5?=
 =?utf-8?B?U2RTNUUwamhnb0NFaWlKSDF5Ri9XNldqNEtuY09XZ3poYWdPRGV5S3AwZnZs?=
 =?utf-8?B?ZGVha1JrQ0JYMjNlRFE3K3czWmpmOXdJbkM0WTljVzdrOFlMVDJ1aWgwL0po?=
 =?utf-8?B?RnU2VXhzcjZxcEE1a1RVOUxQdEEvRDU0dHYvWTRTaUpjQjVhdWpJS294NVcz?=
 =?utf-8?B?djl4dmZHanlpK1M1MlpyQys1bmM1TTI2TUdzNXhMQmZoYUtsSzVWWXE3Vksv?=
 =?utf-8?B?RWVKYkFhNWlmbEJCdFJMT0F6aStFdUNrL3VVODRyN2MvL3dsMFY3MzNiNHdO?=
 =?utf-8?B?RFgyUlI0ejR5WnI4YzlPYU0wOTlpeE1jL3BwNGxMK0F2cWw1NlVnVWRWM1M2?=
 =?utf-8?Q?vlS30cs0d/Ystl5Hiqc7B9Ltj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6abd2e-094a-4cc3-8054-08de17d7fbef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 17:15:54.6828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kc6Gnq1GR/gVCg6N402NKKsAQ2u1VOctVo0XfYhY1raA2FlNlT8cR9Yc5Q350U/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330
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

On 10/30/25 17:10, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistentcy cannot be addressed without refactoring the API.
> 
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
> 
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they’re needed and
> reducing noise when CPUs are isolated.
> 
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
> 
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
> must now use WQ_PERCPU.
> 
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.

Adding Philip and Felix to comment, but this should most likely also not execute on the same CPU as the one who scheduled the work.

Regards,
Christian.

> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index ddfe30c13e9d..ebc9925f4e66 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -690,7 +690,8 @@ void kfd_procfs_del_queue(struct queue *q)
>  int kfd_process_create_wq(void)
>  {
>  	if (!kfd_process_wq)
> -		kfd_process_wq = alloc_workqueue("kfd_process_wq", 0, 0);
> +		kfd_process_wq = alloc_workqueue("kfd_process_wq", WQ_PERCPU,
> +						 0);
>  	if (!kfd_restore_wq)
>  		kfd_restore_wq = alloc_ordered_workqueue("kfd_restore_wq",
>  							 WQ_FREEZABLE);

