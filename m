Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG/AGnS8nmnOXAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 10:10:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79B4194B44
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 10:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70E910E727;
	Wed, 25 Feb 2026 09:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="acsWNqIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA2210E727
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOEs/h5qV3LPKSnmzks4QombzCjbEYdnMErIRDHoYftb0koqJAiz9PGpD0wBWCGQCsMJ1ZEVSL6bAftBpAqMZ300e2VE94pzaeMzEanN3b0iDf+GiL3Z7mzhQ5uExr1Ky0Lqu3xeZpKnB5qSk5TN1RW6G6ykiO84UeYRluEfPKIcUhYjPj84VIfuXAq2AkWWb3xEkF0NTHY7xx6AWqNT0e/1moxa2r0B/d830tGIM3PSF5ayqfhywfmMdmS3qU9Y84o3DoMwyZmPyUnhEWX/838eQ7Y6SMGIaBVHu9Ddprx6iu2hF+VoDQQppsPgTsR79w0L9fzVgdYzYs6N/2zwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFAgKgCVRGPWfPGGJFG4naw0YNDlXmZVdBWO0IEPDj8=;
 b=k4YmOoiPTQqfYSD/YP4YJOgUJttggPNby3Ghrs7afNm9n2MNZ4Ibl8KEPjM/gitUWqbAkgCBoMaIwnYnKIBwA7Gn8rXthWVxL96LrRDx5vOF0TppYYxC6KjfVRYSkLYaVQ8LGF+durnmHmuADaIDH0Je6J22O31TYeNmkmd3Pn3TXYAlbBDCmO/h8LCYuC6L38pHs3xYKxELzvNFTO6Q0nV5Kackk8CzgFNuhFGc8C3ysY3Fz6rWCv+Sq8PQh5vlLHxkT8zDOhgNWzwbyvyNlSgnl859hHmzEvMkyCj1luMUfHChcFYz1IIrEE5arxFcLTJWCp8dIVb/xtSL9y5clA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFAgKgCVRGPWfPGGJFG4naw0YNDlXmZVdBWO0IEPDj8=;
 b=acsWNqIjNbdZzd8KiaZQPCxQnaHRkL0OSMTE1qjb/Qns347OsNp9wjLaEp/figZNXgfEWQiFD4OOhRaaog7pBd8AQsAWuoW4ykXytNXceIvqs3vcu+8i4BwgL2T4ykMClwVbH0QSpjKEylD8yDo2LwnMlaGtMxreZf3C9lhtfXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB8000.namprd12.prod.outlook.com (2603:10b6:806:31f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 09:10:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 09:10:04 +0000
Message-ID: <4fddf319-50c4-40ab-9e36-04d629a8855e@amd.com>
Date: Wed, 25 Feb 2026 10:09:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
 <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
 <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0409.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 2487fabe-609c-4840-df4d-08de744da96c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: Gid40Iehu5XtG4tO3pbR7S0egl1uRPNrFO0yYWFjyidvEgJgJsda0/tin20a4kghYtBZSSXPgNlSTq38GDVf5gM0gZ3VBkjM2ULXZAo7a6iBKT+7UB4Ggpp7nRKIrEK57od78FKgbgTF6F5e6iyrCzC8WCo2AoLMx5+SMJ0vhcbW1QaQ2VdKMSnQx6F9t2fGyTbiQTcB8hk8CBzz5uvlQhw9iSfejfcVCgSHQeDe6Fl5023so4VlKGjwTS//6CFxC/LGXUExjlGvtetofVad7i1gDygk5E5K1UHQNcRvg9hUZLYHWl/sR2mKV0ktObB8Zt3vPnN8EsEvIInVBMRERvv9uCY10lMKJ8d88HKCatXdo6Cz3Y2TLjx6L6oDQLyiu2omnKZbWxRMPWOPOKoQEqtb0ClZIbgUHxawV64vjyI+mF1Cv0DoEmQbhMp32XoSH/zJlT3L9OtYbVfJdDv5VX3mflVL+JI8+uEUE4QsK03Sm4TP7IjO+OV2zqH1HMe/lcStpYb3YDUJc9sKWT0nZvYsWiiYrJLu5exI/zrHNhOXZQ75ZsriPuZtIvK8mL7L9ugiOrg9w8cov6Imdsvo3BFIZ9NJMPpSm3yl+z3SwW8nON1H7vi3OrUSbc18CJLe7eq9dBBBH8ulaNweLYiaymH2sDZUSypKHDZouaotCt3V1eomP5n3G1Z+S2fibIgKN+y/Mw4TJiV8wsPVNZHTQsar0mmAAHIvyTXoi4E8jW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW9MVTJvenJqWGgyTmFJZHdVZzRkWCtNbVRIVDdPNnNyL1k2cnlIWTJqc2dj?=
 =?utf-8?B?NkhSZE9WUUFjcG4rYTE0dUNSSy9LbU5hRjRXdGVkU0tTS1FkZ3pYKzhxcVNS?=
 =?utf-8?B?dlNRQVVWM0xZakc5QndOWWZxb0N5RkdXN2pPZVp0RkdJWUtFWkRyaUdxYjVY?=
 =?utf-8?B?b3YzNmdhNURuZDRhZm5OaDl5R0trSkF2bHgvNTAxNzR6eTN4VDRhK3NsVFFv?=
 =?utf-8?B?ZjlTUy9YV01Lc3BmeVhmUXBwQXgwRElKeWhsR2w1aEMwOHFiR2ZPNHdWR05q?=
 =?utf-8?B?eFF4Y2hxVWlzUWp3LzVUUlF1NUc0eXY2YVQ1UWQwTEhsQ05Ca25JTHU0Smlq?=
 =?utf-8?B?RytJOW1oa1RBUENzS2w2bUdGR1ZhbGdlcVFkOTUyS2ZCOVZuYWZWeVFLVHAx?=
 =?utf-8?B?R1RrTzRib1VHYmhqaDNLekRDaWloWkpNNit0Rk1Db2JsL2ZXK01BaDc2VDJn?=
 =?utf-8?B?Q0ZzOWtwbXU5Q0UwVTVkZjVud05WRG9kWXN4THBvWEZ4Q1BkV0NtTmNRdDhR?=
 =?utf-8?B?SFJYTG1Wd1lpNGl1R2dMb282MDlkVWxjcWxWY2tuSmdaMVRlMis1VFh5ZFhU?=
 =?utf-8?B?K2Nlbzd4OWMzMW0zSzV2RUw3QlJ2dTVaZ1AvUEx6aEdML2ZBTlhPSHNyTFhB?=
 =?utf-8?B?Y1BrS2ViNldoRHMvaHlxeFBUR3Awdzd4bE9CWlI3bHJHWjB4YWp2cFRGa0VX?=
 =?utf-8?B?cUpQdDI3TzBkYXdzSDErSnoycmllNGZxQzlwem9CcW5Ga254WldJNnlGS0d5?=
 =?utf-8?B?bGM2V1NNU1VDQjUvOG9tKy80MTM5dDl6OWV4YUNTNmhRUmpNV0FtVG1nRE9H?=
 =?utf-8?B?SGZXNlNkV0c2L1huMUI3Rk5WbkJwS04rTG9tV29wU1RSYTJjMkxpenhsQ0pN?=
 =?utf-8?B?TmNETjNodk1nb1ZBbVRQWkZHMGZIckZJZndXV2lMeVVJRXBPU0NGYVYzQWZi?=
 =?utf-8?B?YWl2aVhMV0pmSkdaUVNEOWQ2RlVnV1JsWVJteHhPM2RkdjladHI2cTFkTFE1?=
 =?utf-8?B?Z3YxTzdodndwb3J5VStYdGRveUdsY0lTbHZ2Q3hCOXZJRVpTazNhbUxiQWtM?=
 =?utf-8?B?R01QTUtvaklzRjRzYzMwNUtzWTlJcUIxWGYyWENGUzk4M3ZlOGJWWUo4Yzk5?=
 =?utf-8?B?b0tRWHN4UWd4cmc2UUNrN2pVNW1lMWVOQTJubXM3Tk1tRnAyMmtaZkZWck1G?=
 =?utf-8?B?V1lWMktsS21qK05kTGRvU1hnUFRvUGxKQXF4UGRLKzc4MTZWYUI1d2NYbFoy?=
 =?utf-8?B?NXNPbjFTbEVrcGR3UmtFQTNRKzQyNlZPZlJDc25CU0lwWUdpUXV1amdST3JV?=
 =?utf-8?B?Q3VaYlY5ZmRoL0hESDhDaTJmUlIvT0QycjBucWN4d25LMW8vdTNjZTdXeXRu?=
 =?utf-8?B?YVFJWmZqNFMyRVhyRmdTRFRjV2ZOVmxpTGdNQVVRQi9BaW5DSmJoUXNEdnlv?=
 =?utf-8?B?U1Q5eGdkNUoxY2tBbGtTdU9OQmFyV3lSN0RYMm8yQTFFL3hDMmNuNXFZNC96?=
 =?utf-8?B?NERKY0c3a2piSzNKSks5bEQ2OFYwOFJLaTMrZG1Ba0FVQWd2T0M4Ym5kYUwy?=
 =?utf-8?B?WXg4d3hXRFN5NVlZdkFERzB3QmkrNzRhWk9RM25pVDd2QU1lbEU1SE9YU2Fw?=
 =?utf-8?B?dVBlZXQ3N1RnekJnUXgxNmo0UHdGOUxnSTErdmVuUDVjaS9wYndnL3NYdXRl?=
 =?utf-8?B?dlRtcFdPL2p1SGIwZjhPRHB0Q0FkNlRxN0tPR3FIT1pxN085WjRZVUFhd0ty?=
 =?utf-8?B?L2F5Qm9hdi94bzhZZHBza3luL3lEVVNpR2haZzZRQVBQQ2VjakY3TW9FOHdV?=
 =?utf-8?B?Ylp6TnJUTnUreDlxeEh6Q28yVE5BT1lsUVkyeWZGVEpsRjBEdzdnNkQ5cjB1?=
 =?utf-8?B?Z2JmN1NYZzJOaVYvcEt3OE1zdVBwbGhkbzdxS28ybFcrVm15ODBEZjUzVkdm?=
 =?utf-8?B?MmZCM0tSK0RGZjNEbkpqb0dJREdXSEJtbzFhcXFTVDd2ZGNoV1BmcGk4OU1V?=
 =?utf-8?B?TjcwWjZJc1RjMUtSa2h3cEo2Z2hmUzNLM3cvcTlZcjZCY1ZIZW1pSDdIMVRm?=
 =?utf-8?B?ampDMFFDTUZWNnVDeHI2OTM4bE1yRnBIK2ZoaU1PMUdnajBjSDhqSkRTUGNs?=
 =?utf-8?B?SURFakkza093d2R6RU5XTDh3WFpKVVlkK1MxZWR6L2R4QjRVOEFQSTFrSThS?=
 =?utf-8?B?cDd2QlJIVWJoc01vNXRLSlluVjFEWTBLK0ZvaW1IbkxIRXBLd3lLMzRpSHg3?=
 =?utf-8?B?RU11STI0UFBNVWw0cndiMTZqUVJVMjZiRG5DcDFVWVZBSVJVVElsZUl0UWx2?=
 =?utf-8?Q?+sdIIBYeh8VE9EeACj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2487fabe-609c-4840-df4d-08de744da96c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:10:04.0702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gFSLeLgGB5Xm6eMxm9Qa2cBv+t9XZGWzLwRWozMYVpuq23Wc31rJaaczusE211b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8000
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:shakeel.butt@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C79B4194B44
X-Rspamd-Action: no action

On 2/24/26 20:28, Dave Airlie wrote:
> On Tue, 24 Feb 2026 at 17:50, Christian König <christian.koenig@amd.com> wrote:
>>
>> On 2/24/26 03:06, Dave Airlie wrote:
>>> From: Dave Airlie <airlied@redhat.com>
>>>
>>> This introduces 2 new statistics and 3 new memcontrol APIs for dealing
>>> with GPU system memory allocations.
>>>
>>> The stats corresponds to the same stats in the global vmstat,
>>> for number of active GPU pages, and number of pages in pools that
>>> can be reclaimed.
>>>
>>> The first API charges a order of pages to a objcg, and sets
>>> the objcg on the pages like kmem does, and updates the active/reclaim
>>> statistic.
>>>
>>> The second API uncharges a page from the obj cgroup it is currently charged
>>> to.
>>>
>>> The third API allows moving a page to/from reclaim and between obj cgroups.
>>> When pages are added to the pool lru, this just updates accounting.
>>> When pages are being removed from a pool lru, they can be taken from
>>> the parent objcg so this allows them to be uncharged from there and transferred
>>> to a new child objcg.
>>>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>
>> I have to take that back.
>>
>> After going over the different use cases I'm now pretty convinced that charging any GPU/TTM allocation to memcg is the wrong approach to the problem.
> 
> You'll need to sell me a bit more on this idea, I don't hate it, but
> it seems to be honest kinda half baked and smells a bit of reachitect
> without form, so please start up you writing skills and give me
> something concrete here.
> 
>>
>> Instead TTM should have a dmem_cgroup_pool which can limit the amount of system memory each cgroup can use from GTT.
> 
> This sounds like a static limit though, how would we configure that in
> a sane way?

See the discussion about dmem controller for CMA with Mathew, T.J., me and a couple of others. It's on dri-devel and I've CCed you on my latest reply.

>>
>> The use case that GTT memory should account to memcg is actually only valid for an extremely small number of HPC customers and for those use cases we have different approaches to solve this issue (udmabuf, system DMA-buf heap, etc...).
> 
> Stop, I have a major use case for this that isn't any of those.
> Integrated GPUs on Intel and AMD accounting the RAM usage to somewhere
> useful, so cgroup mgmt of desktop clients actually work, so when
> firefox uses GPU memory it gets accounted to firefox and when the OOM
> killer comes along it can choose the correct user.

Oh, yes! I have tried multiple times to fix this as well in the last decade or so.

> This has been a pain in the ass for desktop for years, and I'd like to
> fix it, the HPC use case if purely a driver for me doing the work.

Wait a second. How does accounting to cgroups help with that in any way?

The last time I looked into this problem the OOM killer worked based on the per task_struct stats which couldn't be influenced this way.

Both me and others have tried that approach multiple times and so far it never worked.

> Can you give a detailed explanation of how your idea will work in an
> unconfigured cgroup environment to help this case?

It wouldn't, but I also don't see how this patch set here would.

The accounting limits the amount of memory you can allocate per process for each cgroup, but it does not affect the OOM killer score in any way.

If we want to fix the OOM killer score we would need to start using the proportional set size in the OOM instead of the resident set size. And that in turn means the changes to the OOM killer and FS layer I already proposed over a decade ago.

Otherwise you can always come up with deny of service attacks against centralized services like X or Wayland.

>>
>> What we can do is to say that this dmem_cgroup_pool then also accounts to memcg for selected cgroups. This would not only make it superflous to have different flags in drivers and TTM to turn this feature on/off, but also allow charging VRAM or other local memory to memcg because they use system memory as fallback for device memory.
>>
>> In other more high level words memcg is actually the swapping space for dmem.
> 
> This is descriptive, but still feels very static, and nothing I've
> seen indicated I want this to be a 50% type limit.

The initial idea was to have more like a 90% limit by default, so that at least enough memory is left to SSH into the box and kill a run away process.

Christian.

> 
> Dave.
>>

