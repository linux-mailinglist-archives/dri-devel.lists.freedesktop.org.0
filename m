Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E9BE4D97
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999F110E03D;
	Thu, 16 Oct 2025 17:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i3Jb0o4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013000.outbound.protection.outlook.com
 [40.93.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB89C10E03D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAoFjYG3CzOVZqIa4Wf1XmSGUyeaUYu3wshrIGG83ELHpKV2UpPBcqw3lDR961v2TwyulotgNLkZTE9TfYNJRSujXMEhZHTsQgB6gnOXr5RsXauINH8IwHHiIpYfITMBnLKC9dBBOa2Y0rIXR5bQJwNnwjef3/LhLxD7pckcH4Ye0nYsbzChvHSiG2CRgvxMsbNQ1eDc/zlXqk4wr+KN49mPOqF7wGJ3DdWiaEigRJ/DdnIWjliLSgZkahJw8qB1uERZky5hmI8KNPwIyS08Mv1edgQdvZBgFKpnYQWBBE9BQri6ySJNuCRJkTgxz4nvY0ZFwRRpjMaK5HdyGDGhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUaYjz6GfbfUlGJdDYVgR4vWvJLtgqC3dCHKoQa/DN8=;
 b=iMzGdvcr89xR3C+fsMdHjFltHQDnNW6MLBF1pZfO78dpkCxDyW7YRI1Qpt0A7AzB4oOZokAPWMWV+AUKOmfdoUiHLKQ834v0n4c84pRleYQje04ho8DIUkWuQhbi+tLZOX1o16zZEPGxPnD1FQn4zqhZlz72ZHiMqpslDjkbeOolU3j7DmZQLwmJyZOmbDyPCgfcVr6m1mTbbDtERvUpxTWrhSZ9TprCXq4wrZajmSSMn++BGNHe9NYZeT2aycxRRFvIwOwV8rTia1PF91cEPdQx0ZlrYlLqJGmUnxzvVecJ3/7tfCoKHmrS/iljg/L8TEUBhqttF5vuouyyYKwW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUaYjz6GfbfUlGJdDYVgR4vWvJLtgqC3dCHKoQa/DN8=;
 b=i3Jb0o4lFKO9TDqBy8zXddgZOUDhl0tVM+GZYpjboGDCcYb6CrolYoF7ETZpLXSpkyCN1fqBpbMezdql01NAKt8WfYW7KYbkRtEo49acTeqWuarCYN0DZHX8LT1w8LEZERcxb1cmKd8DDLli7rjl2RMZJ8+NsdkvpyFXk6kg4hU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8738.namprd12.prod.outlook.com (2603:10b6:a03:548::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 17:31:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 17:31:06 +0000
Message-ID: <9cd42e6d-8fff-4b16-aea7-2cc534e2d833@amd.com>
Date: Thu, 16 Oct 2025 19:31:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v3
To: phasta@kernel.org, alexdeucher@gmail.com, dakr@kernel.org,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org
References: <20251015140128.1470-1-christian.koenig@amd.com>
 <1a83e056df0a0096f85897b569993b0eca3892df.camel@mailbox.org>
 <08c5d03f-d099-43f9-a26b-d333e394d862@amd.com>
 <090dcd8ef59f5c4faa0370669bf69eca6a881634.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <090dcd8ef59f5c4faa0370669bf69eca6a881634.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: d0342428-d7ae-428f-cfcf-08de0cd9c975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MENCaWFRTjBKQU9XM3ZZQm43QjA3V0hjVWFnSmpWVTN6RjBUR3ltVHpkMnBL?=
 =?utf-8?B?aUJ1MW94T0xicHBRQ09XMm9SeDNsZmdnb0d4R2ZaNUw3WDZQZkh5ZHpmNGJ2?=
 =?utf-8?B?ZmQ5MEZja3pMSEtGVUF6NC9TZzhEeWwzWFFZRUhWdUVremdsNWVLRnhHUldi?=
 =?utf-8?B?RnZzbHVCRnZHQUJlMU94ZFR5RE5RMTVralRoekZYNDM0NEhlMGtNeXpaZ0VU?=
 =?utf-8?B?eEt6SXhCTUpvYWZyTlZqZWxadUpJN1YvM0Vnb2hjSTd2ejNhL0VqQzRZbGhv?=
 =?utf-8?B?RmtFZDZLWkI1ZXViN0ZYaXFQck5aSzNDUlZLaytNWWN5UUpLNlRQL0lGQTFV?=
 =?utf-8?B?SlVhbjVhNWJDWFRYRzlrWFJvWEU0Si9waFJBQjBzU1JFZExvTGl0NzFsYVFD?=
 =?utf-8?B?N3RNOXZScUNGMC9ZWkZLUFVtbW1scVJaazllZjV2QW1yNzZ3ZmFwTTVmczlt?=
 =?utf-8?B?Q1JiWHpEM2tsQlFoZmVIMlNmM1RuWUJSZEZBalZYTVBZWE04OU10UjBvZFpt?=
 =?utf-8?B?c293WUF3OHJBUHhzRjkrcklyRTZrMFhaSmYxVnc4Z2xGL0pBQnBjUHV0cU03?=
 =?utf-8?B?Y3psU1EyZGpPNytmK0hieW5KU09LUEkwaEk1eFBYVWpHZkRZOE5Ib2w1VDZn?=
 =?utf-8?B?RkswV2VMb1JnOFFvQ2hxbTF6dlN1TkFBeFp3cWFXeTZBVFJqZmxrTGRaYVN2?=
 =?utf-8?B?bXJRTHRaWVl0TGlhL28vazRIUityaEhVOVRNK2FiOVVEa0tidG9JQ3B1UzRj?=
 =?utf-8?B?WkgxellJOTBDUXk1TjhMUUczblcxRzFYclFQMXdCejZ1VzlnV1IyR0xVY1hp?=
 =?utf-8?B?RThudHIxamFkcWRzdE55Q3VwQnVuSkJoNjRta3lWanR2UW5VT2oxV1RTcHlt?=
 =?utf-8?B?OVhoTkdGL3JnaGh6QTZVT3pnZlQzVjRDMGtLKzh4QkpMWTJrRCtGcEdoUXFn?=
 =?utf-8?B?NEpKQ2FaNStWdVM4dTMvc3JzQVM2RHNjMUJDeUVXeEQ0WVpoM2wzYkRsOHJ6?=
 =?utf-8?B?N1VMaHJiQ1RQZE5OWnM0cjJwNGoyK2R6cDdXeGVwT1hENkpROUlXOEdKeVYx?=
 =?utf-8?B?Nit1eGl5MUNFSlpaTXk1YWd1Z2U2ZDQ3VFUxbnNVM2UzTjUyL2cxRWNlTGg1?=
 =?utf-8?B?ekk1Q3lVZGNrQ1VPNkQvaTNVVThGeVZDYzM2UTVNK3FOUXZMZml5N1h1anR5?=
 =?utf-8?B?RUVCNjhjUUNMQkVVeW5Yb3VXL3NPd0I3RFRVcU1JbjNHUkVQaUxDdXc0K0dX?=
 =?utf-8?B?S1FydTVVVE4yalRPZEo0V29FWjVzL1lMRm93UEVDenVzU1BLLy9LbHFHelZR?=
 =?utf-8?B?YmhNQzZvZmVka2RzcmpxbDdicTNsbDFQN2lGVzVpSWR2QkkyM2czMnljVzEz?=
 =?utf-8?B?ZzFaOGVWQm1OZG9LcXJQTThGR1I5dmpSV0VndW1FRkhydmFUTUgyNXcwQ3Zu?=
 =?utf-8?B?a0NJbTVtQmFOb2FnanhxbVg3NUtsZ1VYK0J3dlV5VVhrZEY0L05xWGR6bGgx?=
 =?utf-8?B?d3FaNTEwVkJvZ0VYUTlvRzlvazZucHlhSy96b0V3cS9JSThYL0k1cUFtRFNL?=
 =?utf-8?B?RHBNOGU5ZGFEWVo2UUVBSnZJa21tRjZkWlVBeFYyL2RQYWRyS2V0VVVwWUQ3?=
 =?utf-8?B?dmFqSkRCNDRpVkYxdFZtaHN6ZEkyb0tNMG1lM0YxNDJYVktpQzdVZi9icE03?=
 =?utf-8?B?RFhBaEtRZnE2UFBzbDdZWVdObWs3SitpeC9oZ1p2OVB5cUZ0ZE9tWkluUWU3?=
 =?utf-8?B?M1pCc1ZEZzRoM0Z5QUo4RHRhSEJsSmw1c3B1OXhQWGpCY2wwSjRvbWt3TFpF?=
 =?utf-8?B?eGtXMjQ2Tndmb0prUkphUkhGREdXTUQ4LzRSU2VaOW40a0pwbVFibmZSc0FI?=
 =?utf-8?B?dDg5MG0rc3lGaXhSVzdJem9IeXovV1NoQTZIWmpteHJSMUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXY2RFRKaTJ6Y1BEbjZBWDlTYUxKSXExVk1nTk8vOEY4VEJ6enN1NHU0Z3Bi?=
 =?utf-8?B?aU5DS1ZWRUVPVmhVZ1c1RmVvTm95WTBFODBhQUVPbmoreFFaeWtXeXVjWjV3?=
 =?utf-8?B?cWwrdjJIZXVDWUhIUWpEWnAvOTBoMzcvbkhsY0lzVjMrVUpsVUQ0cUdpTytQ?=
 =?utf-8?B?T3lnQTIwTVRWRk5PY0F4R3g4RzJ2aGN0MGkvWDMzaEV2bm40MGE0Y3hrYUVE?=
 =?utf-8?B?L3BLSFpJM2VGY2xEM3p4aGRhQi9xa2Jwc0FERHB6TzBtN1JBRHpvam95UHVq?=
 =?utf-8?B?NGlNdVU4dldNM3NoK0dTajcvRHh3V0swV09yTytjRHNEdTFQWnJNbTNEY2NQ?=
 =?utf-8?B?d0wrLy9ZMFBTMjVRcmRsOHY3eVBseDR1KzFiMGVObEhHaDVyM3RzWjNwR09D?=
 =?utf-8?B?MFZWdU5TOWZpaTJtd2ZwRnhJeFFWSXpKSTRXT2pnY3B1Sm01WHByZ3pEQUJB?=
 =?utf-8?B?alJ0ZG1sRWVaUDF3aVpoVkFTUVRUYW1nU1hxeXBweENUQjBvWVZxNjVKOTAx?=
 =?utf-8?B?SGJUYVR5d0V5c2NmRFBwYmtrc0I0Sm9BWlYzaWRQTnRGdXR6TDM4cXIrUmhB?=
 =?utf-8?B?WUlQc20zR21wL0Z1NEdsL3dOVHY1YkdNTGQ0WG8zdE1zb2RlV2MrU21BVEJu?=
 =?utf-8?B?OVNKWVlpaWcxd2VJUStvb0xnUGRnRnBuZ3pVaW1RR2dVQ1ZZL1VMZHI3UGxU?=
 =?utf-8?B?S0o5Z2xZMEVNMEVIaS9VMko3anJySmtZVU9QbFp2STRQcnV0djNyMUtrZExv?=
 =?utf-8?B?eFF4SVF5NE1uV2FnRDBmNGNvUFhMWFQrRW5jbmNyMnMySjZ1TzRTb3YyWDhj?=
 =?utf-8?B?UzJEZ0FVbmcwK2ZBRVhLOUZXS2NxSGRlZ0hSWkowTmc2YXl3R1lzSmt2bWQ4?=
 =?utf-8?B?LzlBdVF0V0VNZ0phNjRDTEJNUlA0YUN4OXRIcE1VOFIxcHRySHBEekpWVXFi?=
 =?utf-8?B?c2oybE8wajNaT2FqZlBUSUM3anBSbzJSOU5LQUo3aEpDcllsSVF0Z1F0Ukty?=
 =?utf-8?B?cE82ZWxGRlF5SzVlUnp4cXVSMjlCeDU5SGVPOGMyVUFJa3lPNHgrTVFpaVNm?=
 =?utf-8?B?VHpIdkRXckllMTBhc1VJVHJmcWZPK1Y5TEZKaVlnd3BPMmsvVTF4djBZWnUw?=
 =?utf-8?B?WGQ0TDY5QU1sY29TanVlbC9TN3R3aHJoSnJGeWFrczJPdHVpNXF5dHhEUXZy?=
 =?utf-8?B?VFNPNnNTSXVhdXp1S3JNdFo0ZTJOc1R6V01iS2k2YUVacG10TmpHK3MzOTVh?=
 =?utf-8?B?MjFMUHlVQnZaMmRXMFFuMm9JUEcra1JqTzNBSkU4c2g1NFNJTFhVN203RWsv?=
 =?utf-8?B?eE04R2tjNUE0c0wvTjR0YWNWelAwcXI1bXVGNzJFbEYyOTJJRjBCY3JjUXc5?=
 =?utf-8?B?Ny9nTC9ZQ0RpMjFna0g3WmVxZmgxZ0VOYmM1dG5Gcm1tdWhSOExXa1NSNWVa?=
 =?utf-8?B?RVk1cDJtWVFCRDZMOE1zMEVBZ08wWk1yL0Jxd1VjWXRnS1VEVjQ2cEcxaWEr?=
 =?utf-8?B?czdaVlhwQzcvMDRRcEh6VjBpeUJKOW1EaW5jR2kvbW9wVVBJWWVZQmx2VUdW?=
 =?utf-8?B?a3ZEU0ZRYXY5bFZVNU5nZ0tOcUI5ckNLOTZNeStqc0JTTnFGbGt0Y2h0b2pT?=
 =?utf-8?B?MjJ0azhZc0VpVis1eEEzaDZUOXdPRVFEcThKcVpCZjFhUS84SE40TjBhZ2pw?=
 =?utf-8?B?WWZBaXorZnYvNHZ6cUV0TWgwdXB4N3poSTkrd2J2RXRpaDlCeFJlT3RLOHhK?=
 =?utf-8?B?WXpqM1ZheS95WGU5ZkVhN2VKeTBsK2lITlVxSjRVTXBFVmlpQWdxVEhwYTV0?=
 =?utf-8?B?Q2l2YStadnJRN3R3dVZaYlVVQWNzbFpLNWVlOTZMamp4UkZVaE9UcVZmeTBu?=
 =?utf-8?B?ajRnVXU4MDlId3UxZjlEbGt4NjhnT3JIb0k4NDhYZDVvUU42aHNGUzNHY2I3?=
 =?utf-8?B?OURxMXVwTGRNWEpuNWVCYUFmcWpOcUdzODZHZE1nWE1BeTZqVk82cmFJT3J3?=
 =?utf-8?B?SjlyMitlK0lFZXBhbms4WmtIcTlKWTgyeFl6UUVZYXNvend0SnJBb1BxLzE2?=
 =?utf-8?B?TWZnRHV5bVhCVW0rVUdNMUZyRkxBcWlNQkpUMWQva2JZZ2NFOEZlZ0RPeFdr?=
 =?utf-8?Q?cPs3GMJy3uXSEQkIFz73Z8D5o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0342428-d7ae-428f-cfcf-08de0cd9c975
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 17:31:06.2320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuejqIJZofosKl4JrKMEyAGu85O31EAW9XNfS3j9JQC+UoNp9pf3jYUUTc3LSIHZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8738
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

On 16.10.25 19:20, Philipp Stanner wrote:
> On Thu, 2025-10-16 at 15:11 +0200, Christian König wrote:
>> On 16.10.25 14:31, Philipp Stanner wrote:
>>> On Wed, 2025-10-15 at 16:01 +0200, Christian König wrote:
>>>> From: David Rosca <david.rosca@amd.com>
>>>>
>>>> The DRM scheduler tracks who last uses an entity and when that process
>>>> is killed blocks all further submissions to that entity.
>>>>
>>>> The problem is that we didn't track who initially created an entity, so
>>>> when a process accidently leaked its file descriptor to a child and
>>>> that child got killed, we killed the parent's entities.
>>>>
>>>> Avoid that and instead initialize the entities last user on entity
>>>> creation. This also allows to drop the extra NULL check.
>>>>
>>>> v2: still use cmpxchg
>>>> v3: improve the commit message
>>>
>>> For the future, commit messages in the patche's comment body are to be
>>> preferred since it's common kernel style. Same applies to the patch
>>> version in the title, which should be in [PATCH v3].
>>
>> Ah, just forgotten about it!
>>
>>>
>>> But that's just a nit. More important:
>>>
>>>>
>>>> Signed-off-by: David Rosca <david.rosca@amd.com>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
>>>
>>> Should this have a Fixes: ?
>>
>> No, I've actually removed that because the patch which made it obvious that something is wrong here is correct.
>>
>> It's just that this seems to be incorrect ever since we added the code.
> 
> Then we should just add the Fixes: tag for the big bang commit,
> shouldn't we?
> 
> At least maintainer-tools/dim doesn't like the missing tag at all. When
> trying to apply this patch it just added the following:
> 
> Signed-off-by: David Rosca <david.rosca@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> CC: stable@vger.kernel.org
> Fixes: 43bce41cf48e ("drm/scheduler: only kill entity if last user is  killed v2")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Link: https://lore.kernel.org/r/20251015140128.1470-1-christian.koenig@amd.com
> 
> and then it complains about the tag it added itself:
> 
> Applying: drm/sched: avoid killing parent entity on child SIGKILL v3
> [drm-misc-fixes 2a3e82c80bd0] drm/sched: avoid killing parent entity on child SIGKILL v3
>  Author: David Rosca <david.rosca@amd.com>
>  Date: Wed Oct 15 16:01:28 2025 +0200
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 2a3e82c80bd0 (HEAD -> drm-misc-fixes) drm/sched: avoid killing parent entity on child SIGKILL v3
> -:27: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: 43bce41cf48e ("drm/scheduler: only kill entity if last user is killed v2")'
> #27: 
> Fixes: 43bce41cf48e ("drm/scheduler: only kill entity if last user is  killed v2")
> 
> -:48: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'current->exit_code == SIGKILL'
> #48: FILE: drivers/gpu/drm/scheduler/sched_entity.c:306:
> +	if (last_user == current->group_leader &&
>  	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
> 
> total: 0 errors, 1 warnings, 1 checks, 15 lines checked
> 
> 
> Which is weird..
> 
> in any case the big bang commit helps stable to apply this correctly,
> too.

Last time I talked with Greg about it he mentioned that the Fixes tag just makes sure that this fix is applied everywhere the original patch is applied as well.

Since the original patch is so old CC: stable should be sufficient as far as I can see.

That dim complains about missing fixes tags is news to me.

Regards,
Christian.

> 
> P.
> 
>>
>>>
>>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>>> CC: stable@vger.kernel.org
>>>
>>> So we want it in drm-misc-fixes, don't we?
>>
>> Yes, the patch is based on drm-misc-fixes. I can push it when you give me an rb.
>>
>> Alternatively you can push it yourself, whatever you prefer.
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> P.
>>>
>>>> ---
>>>>  drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 5a4697f636f2..3e2f83dc3f24 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>  	entity->guilty = guilty;
>>>>  	entity->num_sched_list = num_sched_list;
>>>>  	entity->priority = priority;
>>>> +	entity->last_user = current->group_leader;
>>>>  	/*
>>>>  	 * It's perfectly valid to initialize an entity without having a valid
>>>>  	 * scheduler attached. It's just not valid to use the scheduler before it
>>>> @@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>>>  
>>>>  	/* For a killed process disallow further enqueueing of jobs. */
>>>>  	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
>>>> -	if ((!last_user || last_user == current->group_leader) &&
>>>> +	if (last_user == current->group_leader &&
>>>>  	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
>>>>  		drm_sched_entity_kill(entity);
>>>>  
>>>
>>
> 

