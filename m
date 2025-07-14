Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C60B0403B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 15:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929C110E49E;
	Mon, 14 Jul 2025 13:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FfMkvnWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7062810E4A4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 13:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ca3KyEofp6zSGpAci1Khlyw2cv1q93myJWeggtn01pybCqzT32FGpQtt2Xaiwpq1mC0d6EqcL3TNh1vWcTsMrb0LWQvKHb86Vub+guE5qXkZKSXqC3Yufd3wV0Q7SMk/rSu+JnXeZRcp6XfulZOy4NKLRiaori7Rs9w/4sWeIB6KBfu3Vsmd+GG1mMptl/mH0DYFwJE9Qz12eq/lWq7RTLHGeI7S9dv+aFAvxgp3Oaq9Sk0PEWd/YR9AKHhx7v05r8Fycvq6SaeoOdIxwjjBcObtWBNkqrMIjrrpIdDiY1XzWMzdSxP5igftXFnx5ZZWnui32GM3OY63mvIyZPOSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHAjXV3GtSja6nA3VKCmNgTczdxxaiQO1IYPQy1dMUI=;
 b=cOQaZUpc++NRXtDVXLg7KfqRo8eQi49FJwIKCbWsuZXnVsz6iJlaIuN+w5AnPzFwJYdR2IZNQKkQY4TxBxqnRM3Cuk+c9Y7d56gq4snkUy9n+TsBGt/UODK5HlZ94b8WpETtmgpwg6FREdPJG5jhr/kBSMqNFjrwuO+KFuUWTCqeEP9BnAXAMb8QI6rpI+kEKerSrv9stvlOKiRGJTu/7HpGWmSlkD1KP4JxHg0cGv7LHazHfnQu1LTB+KygYiLp2jSDBewCLN6KwHC+WYkpN3hnsu3nRcrkxtSx8XeRXPVUh+yHjRB5e/fWwyIzAg5U6W9tdoOS0sOTDUm6nFHV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHAjXV3GtSja6nA3VKCmNgTczdxxaiQO1IYPQy1dMUI=;
 b=FfMkvnWcnU7jw+j/Ze3i0FUvXKXD5n6ZVOS1IAGseMGcfid3RBScObZozzdWo/0LY0YeJ/CGetK8dgbAkEps07lMTgnN8MWx6V1wW8oPC9lPak4HH0KK2YMr2H+klMiNNqtowQvAcMB5m6Ze33sp1BaB5zlkQDR2Px5F+EBsWxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 13:39:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 13:39:33 +0000
Message-ID: <164c69fe-9ab1-4e04-8103-b25e4804e74d@amd.com>
Date: Mon, 14 Jul 2025 15:39:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
To: phasta@kernel.org, "Lin.Cao" <lincao12@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: zhenguo.yin@amd.com, Emily.Deng@amd.com, dakr@kernel.org,
 matthew.brost@intel.com
References: <20250714062349.588235-1-lincao12@amd.com>
 <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
 <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
 <70d9c6a43846c3a3c266d4a7a431c1c4b3fcd05f.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <70d9c6a43846c3a3c266d4a7a431c1c4b3fcd05f.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a06c8b0-d1af-4c22-3fb7-08ddc2dbddad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWJTUnZFTUhoTk95L3A1ZGx5SHJCUUxFaTFObWZwOEdDSjdvMVpFMm9aN2pL?=
 =?utf-8?B?UEwyYkU4SjVsZng3TEZEZEVvbktVUzdadWJqbjA0YUVONFBzcW03RmFhaXh2?=
 =?utf-8?B?WXowZlRnQWVDUFlpTS9oYkZaU296NkRFVUpTY0htVHM4TDhMQlZEWFIzNnVK?=
 =?utf-8?B?ZXZiem5HdmlGMWNWUCtMY3hxeElVRW5IWkRTRGJIWERJekhSU2lZKy9wYlN4?=
 =?utf-8?B?cDhnTnM0WHU1MHRDTFc0SDg3YkNscFpVcG4rMnFuZ3RqODVBZWxoUVFhelNs?=
 =?utf-8?B?clRpSncxOURYVWVXTjJUNUJFaVZRMTliZk1MaUgraUlWRm4zZVdJRDltaUl4?=
 =?utf-8?B?OWNkdXlaM3dFYnJ5Mk80WW53cXdqVFhrS3VGdlJUakE2OXVRcDVucE9VVm5K?=
 =?utf-8?B?VmJNS0RlcEVvSk9yUjJQeXlnTVpCMmJIUXR3dlpOZXZkL2pjZE5aVGhWdnhr?=
 =?utf-8?B?dmlXWC8wTEs1d1hsV0FYck5ZU0liS0xTeEJsdmphMjRFcHAxeVFhaUlTb25J?=
 =?utf-8?B?SGlmaVo0ZWJ5VEhJUmNIY3BGWW84SHlzT3plc0llNjlRcFZFck0vY2UvQVA0?=
 =?utf-8?B?cVJ2WUdlR1B2dVlNNHRXQy9zcStiaGU2SUFxTnVvSEFkR1lDckdmN1d1QzVD?=
 =?utf-8?B?aDl4NmZkL2ZWUkdDb1BGN0E1UytCMWtUS3pQdWE3cFRSbEJTZGl3MGYxdlBs?=
 =?utf-8?B?WUR3b1FIbmlQeEcyNGhiV3duNndRMm5WWWk0LzczdmxhdStqcTJiT1dJQTBU?=
 =?utf-8?B?OUxFSGNxeVUwU01iNUkrSjdHb1RmMEJtbmxxWkJnL3dhWWRxREFOV2pLTGhX?=
 =?utf-8?B?M25LQzZpbzFJaXdBVktvZ1IrbWYvMGpBNk4zeEhrOTJkVmlHcUpNSXJ1Nklz?=
 =?utf-8?B?SnN4QUpuWDhhczliUld1bWpIN1FiODlieFpSSUhySWpoOFZWSTFiTUpRSWFJ?=
 =?utf-8?B?b2tPN294UFJSWXJpcVJKZ0lOVVhYbUxLRVFFKzVSR3J5cEh0U1l3eWVCQ1Zq?=
 =?utf-8?B?OUlBQU0reVFMVmFaTytHRTFDVkxxQ0treVZBeVpVUm5mVW1xeENxU1JicUt6?=
 =?utf-8?B?Tk0yM2V1ckZWRkdybWswQzVKZDVpa3FNSlJXc1lxcDg1L2hpeTlSenI5ZUlI?=
 =?utf-8?B?dndhVThZOGVCT1hGUWEvWVZQRjZkNXFxVTVzdU5rRTEvL2xyNHBRZDB0Q25q?=
 =?utf-8?B?MzVQWFNBL0RMZFJpT1ptUzlXdjRkdjEweHpQM3N4aHVWZEtEVXc0cGxpZW15?=
 =?utf-8?B?KzJMQUtVWmxRZWdYWmlETWN3VU1neWtsSW02bDBLM3lNY3o3TUdZTHNEaG5u?=
 =?utf-8?B?OWhCVUVKWWZCdnA0ejVka1lXeEZGNVRaUGkyV1N2d015a1RsRXZqdno4RVZW?=
 =?utf-8?B?R2REMloybjVyRXpDdTlYNXVrQzJuTHNjWXpsMXhDeDlZTzVDZzduSEd5T3o2?=
 =?utf-8?B?S1BNczRkZGdNRXZiUG1kZjAzV2VGZ1k2SHVlcWx1YmI0ZGZxTlplRnl4UzlG?=
 =?utf-8?B?Z1NCbWNuWlYyWnFkdGs0TXhnYjN4eDJkMisvbW10MWU2TkRVcVRGUkY5LzJC?=
 =?utf-8?B?T0p2am9lbURTa01adTQzYXZDVE9lSG4rV0o5dzlGQkp2TmEwRmd2bXBKZXJh?=
 =?utf-8?B?NFA4c3FueTJncmkzTVFETHc1Ly80NW5YNk00enBZSFpIdjdueXZrT2Y5bjNy?=
 =?utf-8?B?c09TbVFyajRqcWJHbk9ieGU3MEl4TkVQSG91MldkQW5sa1gxWk81Q040OVFo?=
 =?utf-8?B?aEgzWlRTazhQbVdTSmx4TjE5dkMwYktCWDkrTENIY05LZExGQm5MNGIyeHNa?=
 =?utf-8?B?TUM0YWJ5dGszNXpQWU4yQ1dxcktzQ1M4cm8wTmF4L1c1WkF4cEJRdXkybGFL?=
 =?utf-8?B?MS9qN1JwOGtMeGZ4RnJHNVI1Y3EzVGVzQ1FQZDlHSFRwWjhtc1F3ejQ5aFFj?=
 =?utf-8?Q?gSUj9fKeGJM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWRJMHV4emhxcnNROFp2RXBHVFA2M1RhRzkzZGVZUjNtdk0veHAzNEFSdWVL?=
 =?utf-8?B?dmVrdDBFWDMwdWJLZjlSY3FSS1BGUjhTZHp1dnY5V2FwSDRhRDhXZDFZZjU3?=
 =?utf-8?B?eEd4dFlTVTY0Qy82SjlhQkZyT0R1SVErL2ExSUhGQWg1WkdXSlF0ald2eXlV?=
 =?utf-8?B?R1B2R29rVk14cFYwaTdjdHpmSllRcUVyelR1Ri9BUU9vMU5LcE5uNFJuemF1?=
 =?utf-8?B?MHRza2d1ZDdmbE9YYnFObHFHMlRRVmJWL1hzMDNZMU5FSUJIZE1oTzQxbEZy?=
 =?utf-8?B?dkIwd3YwS09iY1FNTWw5NVRzYlEvWEd5S3lqMUcwMVZxZit4aGFDMmZGRkMr?=
 =?utf-8?B?Y3VjTFIrVmlqbjJNbldJQVRPaFZCSllYSUdtaE1JeElRMWl2aUVpK2tUZWh4?=
 =?utf-8?B?TzB3TWxsenB2eEhTTXE2QTBONXlNblNvVkV5RTZTdFR5VGc3UFlGWFM0R1Uv?=
 =?utf-8?B?RkN4NXc3Qm0xa0hQLy9KVFZwNC9uVzV0ekl6OHZxcVNPdjJmNldzOStkYVh4?=
 =?utf-8?B?WWFuTWJXem05em92VXNEaHVoTWNsYXBZa1BselVoQmV0TTFUTDlzVk1VSWZv?=
 =?utf-8?B?MTErMzlKakZmUzN5eko2TFlwYU9jeWZXNEJteGMxNHAwTjRPWGlrY1lXaXA3?=
 =?utf-8?B?QjhQSW5LdlovUG9BTzJyZzRiM2VyUGRjSVZoUUI3Z2ZuN2ppdWxSOWNGN0Vj?=
 =?utf-8?B?WjhsOW5YdHNoYmJKcUhsT2RtMmpYempjYXVCQ0ZlWFh5VzJVelVsa3dCMWFa?=
 =?utf-8?B?MTQwcGkyZEx1UHBvNFFWMmlKR3ZvSjhUbHRLcmVvdTRLbXVCOEs0amV1WERW?=
 =?utf-8?B?a0RGbXh6SXF5N2JJMEEyNXhWeTV0QldhS1M1VGhRcUY5RFRwSFNOa29mWS9Q?=
 =?utf-8?B?VHFuNFRDYUI1dklVNGpZUUVMUWUxV3ZGK2ZmUThaZVV6RlBtdEFmaWt5V1cx?=
 =?utf-8?B?R3dXZ3o1cGxOUmFkTys0bDlJMGlkcWRSZnNiVXFFcXdzVDJ0TE4ydVMrL0t4?=
 =?utf-8?B?NTdQWDZxUXJzYVRIK3VqSStYTjVzMHcwR0szQmsybUlDWXhtWTJpV0Z3WWNZ?=
 =?utf-8?B?YkQ4SmM5Q25LQnU5OW9hak1ic0NYcXdZZkNoWFJKVzN5K1Q3RGs4TVdHN2N4?=
 =?utf-8?B?emN5N1RVcFowUGlGNVEzOFlvdFVSN2NpSzRuZUFaSy80bWxmeE1QTE9KZXBI?=
 =?utf-8?B?WVRiQzFkVzBRQ1hBMms0OUt4QmcveGV3QUxRZ0xxUWtFMWhxUkRKTTR6WmRn?=
 =?utf-8?B?MUVqaS9VTEYyMnA2U0hUTERYMmtzbG5pMWJ2cWprUjRCRElUWEtJa2Z1bEJI?=
 =?utf-8?B?d0l5djlKang2aUhGUXhoVC9mWWR3WWJVSEYvd0M4Nm0zZUhYTUVPSFk0SEs3?=
 =?utf-8?B?bjMwTzkvNnh2OFowRkU2Q1ovVnRJTUNhVGExcWVqQjB0SmJGb1FleGl6VFBt?=
 =?utf-8?B?OGdMRVRBR2pyaWxIWGN0SXdiVi9LNndaZGtscitIMUd5cjBYdUJ6QWZDOW84?=
 =?utf-8?B?bTdqNHdHbkxyTzBvNENGOWlnNjltR0d2Y2pIbE9TQjRFZ0JSSlVDUngwQ2Q3?=
 =?utf-8?B?d2pJQmhkd1FFVjROSThaYjhnSldxYXRsdVgxbjd4aU1Qd3M5TFVBaHBXNXJ6?=
 =?utf-8?B?YVc3TlBocVZFZXdFaG9HYmFCUEVXeTdjRnpiN3FMSTgyT0tqYmNGcEFZb1Rr?=
 =?utf-8?B?cXU3THNuQlRuS3Z5b05DVlgycWJrd2xTdEV5d1VMVW5PanY2NUNOL3FPaFdK?=
 =?utf-8?B?Szg1RkxWcGVVRWhrV1gwZkJzYmhMMm5ZUHNVU3JZYnZJNEplT3kzNHV4NFlG?=
 =?utf-8?B?d01kaC85L2lRVEZ6Mk15VjBtVzN0ZjZLd3p6RXhLYkU2SVpwY0ozVmJ2elRx?=
 =?utf-8?B?TkVlYmo4YkRTaEVwN1JvN2FhMWJoUEZGOU9RT2VtVXEwY0RsSjA3WlRyNitj?=
 =?utf-8?B?cGw5dHpQbkZncDdkS01XQlc3VWVWeG5OQXJGeXg2aWFFSDFqVWJqK1NwN3FI?=
 =?utf-8?B?MGo2UHNkcmpWcWNlbFhnS1BjeHhobDFEQlFuVEdSVFVJY2dQUmlMYVhwRXhT?=
 =?utf-8?B?UG5CeGV2eU04UlhVZnB1WFhzSnhqcU1xeVZGZUdHZlNjWmxnZGZFSzh2bGFo?=
 =?utf-8?Q?NtJab8uZKzXnFKGRshEHa26PZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a06c8b0-d1af-4c22-3fb7-08ddc2dbddad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 13:39:33.1399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkfu3X1x9Kpz01FCJaRO5khYqIRRCL9EOUW68CLlZr+kdg0mFXtKow8W4XGIoSz9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835
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

On 14.07.25 15:27, Philipp Stanner wrote:
> On Mon, 2025-07-14 at 15:08 +0200, Christian König wrote:
>>
>>
>> On 14.07.25 14:46, Philipp Stanner wrote:
>>> regarding the patch subject: the prefix we use for the scheduler
>>> is:
>>> drm/sched:
>>>
>>>
>>> On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:
>>>
>>>> When Application A submits jobs (a1, a2, a3) and application B
>>>> submits
>>>
>>> s/Application/application
>>>
>>>> job b1 with a dependency on a2's scheduler fence, killing
>>>> application A
>>>> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to
>>>> force
>>>> signal all jobs sequentially. However, due to missing
>>>> work_run_job or
>>>> work_free_job
>>>>
>>>
>>> You probably mean "due to the work items work_run_job and
>>> work_free_job
>>> not being started […]".
>>>
>>> However, the call you add, drm_sched_wakeup(), immediately only
>>> triggers work_run_job. It's not clear to me why you mention
>>> work_free_job, because drm_sched_entity_kill_jobs_work() directly
>>> invokes the free_job() callback.
>>
>> Yeah the description is rather confusing, took me more than one try
>> to understand what's going on here as well. Let me try to explain it
>> in my words:
>>
>> When an application A is killed the pending submissions from it are
>> not executed, but rather torn down by
>> drm_sched_entity_kill_jobs_work().
>>
>> If now a submission from application B depends on something
>> application A wanted to do on the same scheduler instance the
>> function drm_sched_entity_add_dependency_cb() would have optimized
>> this dependency and assumed that the scheduler work would already run
>> and try to pick a job.
>>
>> But that isn't the case when the submissions from application A are
>> all killed. So make sure to start the scheduler work from
>> drm_sched_entity_kill_jobs_work() to handle that case.
> 
> Alright, so the bug then depends on B setting a dependency on A _after_
> A was killed, doesn't it? Because the optimization in
> _add_dependency_cb() can only have an effect after A's jobs have been
> torn down.

No, application A and application B submit right behind each other. Application A is then killed later on.

The optimization in _add_dependency_cb() just waits for As submission to be handled by the scheduler, but that never happens because it was killed.

> If there is such a timing order problem, the commit message should
> mention it.
> 
> The commit message definitely also needs to mention this optimization
> in drm_sched_entity_add_dependency_cb() since it's essential for
> understanding the bug.

+1

Christian.

> 
> 
> Danke
> P.
> 
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>>>  in entity_kill_job_work(), the scheduler enters sleep
>>>> state, causing application B hang.
>>>
>>> So the issue is that if a1 never ran, the scheduler will not
>>> continue
>>> with the jobs of application B, correct?
>>>
>>>>
>>>> Add drm_sched_wakeup() when entity_kill_job_work() to preventing
>>>
>>> s/to preventing/to prevent
>>>
>>>> scheduler sleep and subsequent application hangs.
>>>>
>>>> v2:
>>>> - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
>>>
>>> Changelogs are cool and useful, but move them below the Signed-off
>>> area
>>> with another --- please, like so:
>>>
>>> Signed-off by: …
>>> ---
>>> v2:
>>> …
>>> ---
>>> drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>
>>>
>>>>
>>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>>>
>>> This fixes a bug. Even a racy bug, it seems. So we need a Fixes tag
>>> and
>>> put the stable kernel in CC.
>>>
>>> Please figure out with git blame, git log and git tag --contains
>>> which
>>> commit your patch fixes and which is the oldest kernel that
>>> contains
>>> the bug. Then add a Fixes: tag and Cc: the stable kernel. You'll
>>> find
>>> lots of examples for that in git log.
>>>
>>>
>>> Thx
>>> P.
>>>
>>>> ---
>>>>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index e671aa241720..66f2a43c58fd 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -177,6 +177,7 @@ static void
>>>> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>>  	struct drm_sched_job *job = container_of(wrk,
>>>> typeof(*job), work);
>>>>  
>>>>  	drm_sched_fence_scheduled(job->s_fence, NULL);
>>>> +	drm_sched_wakeup(job->sched);
>>>>  	drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>>  	WARN_ON(job->s_fence->parent);
>>>>  	job->sched->ops->free_job(job);
>>>
>>
> 

