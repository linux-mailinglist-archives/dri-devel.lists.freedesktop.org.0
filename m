Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 116F0794412
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F5F10E209;
	Wed,  6 Sep 2023 19:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A1F10E1EC;
 Wed,  6 Sep 2023 19:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhIFQuXaL9/e9tIDM0yxKsXOGLV7YoJpUd1vGDED+a+hVJ/B1+01v2YKyFB+zrB0WR9URAKlVcAfcVl26If7O6wJYKRyoCgarZ2GA54eYXOd3Rqf8FzCIGGjtONQZEpYDnY3tVQU+yg/gzAjlBomg5g/iqX69+WTvB4LHEYWTbxbahSoflmPTfb9jVe+wm6hNdZAtlassd8NXNOmIlPwWEcLReSx6avY61uJDK9jVM5LDf8VEOJGwvwjQWCO9pa5MjLwQnPC0Iz6SOx8C5J1cGqJpD64tsHxSzOVhU3wiHfs6VLWEMIUdiE6gYD/oj1nloY/DZ6rlD/Dp5+kbhnuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6VgZ0VakzPk85/RZqTEap1Au+pM8wZVStirYHfOrEA=;
 b=HVxHoEAapF5ir+cHPpmJAU4AHgEEoC/6m3gpxrzNLH0DduBIwqiReKbXQpNadF7zGQY7MfrE8lU18Er0DB1yGg52DK5DbluTvklizHrfgNIM9S3WSg2bIvQ/JGIR8uZCAgiOALzaTSMAsBRbWYVW5LI01uZZD+cbmd2IFv/ih1ikSHilDL31TJR+esNbBdc9yv1foKaGIHg7k3Zr8fzrQb/6wn5AGTmvObtHZNV+ma1T2FEaYN45TMjA9Ks5Ng8n2rIG/nTSlGSNjF+DNR5fT2aeFFBNWnlCZ7kiiCzKpMk/0jX601+ojQR1WEHq+ldTAN1Xvi/AF62LtOVT/Wot7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6VgZ0VakzPk85/RZqTEap1Au+pM8wZVStirYHfOrEA=;
 b=Ga+QkiueWl8V0pUI18OGPpHnFECcB8Bm4MGjNfHvGwuTGC/ymy+J9v8uVYmLpoqmVACNhsWdwSEcrgMvhIwipwBdl1WUrX3A40b+/gltcSLz/vseNRf9HjAma6sRyu71QaUEwcymyZsOThaRkz3LXdgoLDmqgFO5Ds9I2s+4AQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Wed, 6 Sep
 2023 19:58:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 19:58:04 +0000
Message-ID: <83068c44-a4a7-41b9-84e2-b751deb1e093@amd.com>
Date: Wed, 6 Sep 2023 14:57:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V11 3/8] wifi: mac80211: Add support for WBRF features
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Evan Quan <evan.quan@amd.com>,
 lenb@kernel.org, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alexander.deucher@amd.com, rafael@kernel.org, Lijo.Lazar@amd.com
References: <20230831062031.1014799-1-evan.quan@amd.com>
 <20230831062031.1014799-4-evan.quan@amd.com>
 <ed695b0d-fb98-4a46-8689-101a3d3f9819@quicinc.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ed695b0d-fb98-4a46-8689-101a3d3f9819@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0071.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f91b14c-dc4a-47f9-bec4-08dbaf1394b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDUaycexte93asHXO63FN4AneHl58yT27mbPrFNRWmYnKBaHAT2n1iV3IOUylgKPbNbJmYPMofIjX1+DYT2TItnfYI5ZmdJfN5Fg5rk1n7iJ9J6sJF4zth2NVvmTKRgboTPoDGnMAIiBX6L/U6j+/K4Kqzp/gSZS8VIekO4ihZViUQ6lTa5feOXvACzihbYhNrQQNb23iPE20RjLx1BnV3kioi/lfxllds2Ke3ug5zqsozSOcOMAB3RlL/DlPL2crmLSEW+Pn9YRtHsbuAqFKCtHXUAr7JnfzT0gvTbAlkCjl719Lml2VLwWNuhkWONW9JP6Nx6D2sKc9s1KMxrFKESHp26rrpWy3Jy+OVAl3zifD+MQttey+z2gOf+KoC/GLolSU/OdWa7KxNPfa4tKI9cyxc1/ou6xcQBHdFavCXIarb+LmkfSQObP/0W4bPXj9JrgDH1n4jO85U39HXKJ3EzT1NIwYsN1BXoV2f+1IfiocSR0c1TIZICHbccXy/f/tUZ634S9ExIulqMc2VuOOccR7zlafGKqn+QO4ooC/tTccf0mV0H/qMBeCj/c6WnJ6uh/ef9PGKRyx10s6sPyeb7pdbeC/zQOZQZaRgGMVA9mouyGPK+kzJjTXRXvFRd9stEFFexSc668iANHhx208O3wqveJ6CPrTACC3q3jx1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(26005)(6506007)(53546011)(6486002)(6512007)(38100700002)(86362001)(31696002)(36756003)(921005)(2616005)(83380400001)(44832011)(30864003)(7416002)(8936002)(41300700001)(6636002)(316002)(110136005)(4326008)(66476007)(66556008)(66946007)(5660300002)(478600001)(8676002)(31686004)(2906002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlHTTFkSy9iQVdPTFNzaFRBRkFZQWFCRE9lWE5nWkQxaGZ1SFhtWjJqNms2?=
 =?utf-8?B?QmM3bjhTWkRYczJzczk4aWFmek8vYTY5QXRCWTZadW43UzJ6YW5lclBsMnlm?=
 =?utf-8?B?OWR6enh6QTR1U3hDYW9qWjlKVEttSUdYcWVtTXMwWjdpamVOZGpwTFBxalUy?=
 =?utf-8?B?c1QxV1NiU1JJUy83cDhqT1h0cC9tdHZSUlIxUnBjRU1tZVRwZnFhZk5BYkJN?=
 =?utf-8?B?MlhNOXJXVDRLTENVUUIxRUJNdElCamRTcUFSR2J4dUV6bjU2ejJ3YWpUR1Qv?=
 =?utf-8?B?MlJoNnk5ZHorWFI4QThwUFlCMC9reTZ1Q3AwY0prRElQaDE5SXdjcFU2U1ZU?=
 =?utf-8?B?NXQ5TmxKN0Y4M2F0VFU1OVVSLzRVWDJiZS9KVlNza21PYkNRV3E4cTladTZE?=
 =?utf-8?B?S2FUVlB0R0d6OTFOK2R2ZEExQWtIYkxuSjI3RHRPeHk2c3VoUjIvV0l0TjEv?=
 =?utf-8?B?N2ZSWTNPZUdHY1JZZ21lcG1UK0ZFQXVLcEJzblR0Vksya2puK2xuU0FOdXdo?=
 =?utf-8?B?STl5MjZGTnlMdll4ZUNJYmFxU0o2bzF0Q1AwbmVjYkVXVkcrVWxuWlVDckZN?=
 =?utf-8?B?TTVDbVVmRmxndVkyNzlRbThDRVNDVWdIT28vemJiUW5DUHc1U3huVVBYVDgy?=
 =?utf-8?B?Nlc4ZG4zbHZmejFjL3ZRTEc0bGk3Ykhud1FWWDFpMHVMWDFNUjU4UnpFSW5H?=
 =?utf-8?B?cVZ4em8wRzhGZGVCc2RjYStuaXN6MnFYYUpIdk5uSTV2aHZheFVhWHFzOEZY?=
 =?utf-8?B?TkFReDlYakJhMUMwcUdUbkJqTEpqWnR4TytzOHhsUFQwOE5zOWFGODJRbk1p?=
 =?utf-8?B?ZHk2eDNVUkI3T2FVSGN6ajZreVlsemNqT2VpU3FWWjhCYkNPVWluOVZBWjVE?=
 =?utf-8?B?QUx2UVhtVHdsUFh4UmlsNUFFa2UzeGxCWTkyOWc4OHRxNTEzVW80Nkw0amJC?=
 =?utf-8?B?OFdHNjNSRnFFRUlNK25Xa241UWN3SWxUQkwwQmNXK0xZV1YzbmV4SCtNSHpl?=
 =?utf-8?B?ZFhuWU1nTXZ5U1pxOXlJckcvckdyQ2hoR2NhVEVnRWM5bXpveWJXZG1SemdD?=
 =?utf-8?B?ZUlzeFI2ZlFCeVVpc3lTT0F3UGhWY2NJTGxhcFJRVjZvVFJ6Z3NFT2ZURzEy?=
 =?utf-8?B?TFFQVTdKb0lHaXVYYXVSRGJTa2NPcDVHRUI5TmZTVzc5bVR5NHRhQzU0bis1?=
 =?utf-8?B?U2MvMDhHaktxZ2MxRDZxb1N3QWdXMXNmTWtndlAxVlZuMXo2TGJ5ZUlzRVZL?=
 =?utf-8?B?cnl2L2hiZVExWElDZnB5SFlOWDNwK25jZHBvMWtXSmZVeDhWK3F2L0tnWEFZ?=
 =?utf-8?B?ME03Q0lDd25SQ0ZJMnRyYUc5bzc1aDh4VDBlbXBFenhlMXVIOVVNdXRnbW40?=
 =?utf-8?B?WGg0SHlsKzg3WUw0VTRnZmxtTUJLbzBuSU1RY3BMc0tzbGQxUlI3ZzV0dkQ3?=
 =?utf-8?B?R25IYVZBL0VZTWpEMzRubDJEYmdPTFFwQXFDcVV0TzVMTnkyQXBqWW9vQmxP?=
 =?utf-8?B?VXNJYlBObDVrZDlhRlh1VmlBWnRpS3ErcENKOWJ2TW9JT1hLNnE1MVo4QXdK?=
 =?utf-8?B?a2IvSnBLN0d0UmtqZEtrbkVVOFlZcTJvK2ZoU1YwUFIyREFTVEdhMkphQk4y?=
 =?utf-8?B?UmJiLy9KdUM3OFVscnk3ZWNad2RDckd4YzM4R0tNbXhxdTVsUk96R1c3TFJL?=
 =?utf-8?B?eXpCN3V4ZmQvRXM0S01ZSXpBa0N3UHkwOGcydysxYzZFdmgram1QOFQ4QytM?=
 =?utf-8?B?bnd2a1dBRkl4MlAzYjJReCttbmJUaDR2MkdJZnIyRTN3dDZvYnptcE41dndp?=
 =?utf-8?B?elNvY3U2ams0VXo0Yk92dGNlZXhTZ24xM0xXb0N2SWh2cmFsc3hrUGwwRHlS?=
 =?utf-8?B?VlBwMWRxRDZwZTI4dTRHbmlhL3RsSG5KR1NmZ3RyeE1xN0JOQ2t2YktrWXph?=
 =?utf-8?B?by9Eck9sR3JoR2M3WnBzTVRzZE5oTVdnMmd3ZzJiM3FrVDlxb2dkUWR5VDVZ?=
 =?utf-8?B?T2hXN3BxZGZ0MTY4aWk3VCs2MmdWM1JDSmkzWXpuK3NGZHZLaWRCemxNOE83?=
 =?utf-8?B?c2c4T2tacFc4MVZEZFN1STlkR3MyWTE5ZERCNS9yWWowT1l2S1I4ZkdOeitY?=
 =?utf-8?Q?zapaOhUL0t5Wr6Eus3gZbS9Z1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f91b14c-dc4a-47f9-bec4-08dbaf1394b6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 19:58:04.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTjlI+prRngxhA/1/cizSkUPjjG45MmThAZQpMGG1GHBDTLE869AdcPuQ7Hs57+YBPKIb7pkUuKBNRVcm5buKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/2023 09:32, Jeff Johnson wrote:
> On 8/30/2023 11:20 PM, Evan Quan wrote:
>> To support the WBRF mechanism, Wifi adapters utilized in the system must
> 
> Since this is the first mention of WBRF in the core wireless code IMO 
> you should indicate what this is an acronym for and briefly describe it
> (or add a lore link).

A lot of information is captured in the cover letter and earlier 
commits.  I think you raise a good point that 10 years from now someone 
looking at random commits will have a hard time understanding what 
exactly WBRF stands for.

How about if we introduce a wbrf.rst somewhere in Documentation/ that 
explains the basic principles of how/why for it.  This Documentation 
patch could be the first in the series and then the commit message for 
wireless subsystem can tell people to look at that path for more 
information.

> 
> I'm wondering if WBRF is just a special case of frequency avoidance, and 
> that more generic naming/terminology should be used in core wireless.
> For example, I know there are vendor-specific solutions which allow 
> Wi-Fi to avoid using channels which may conflict with cellular or 
> BlueTooth, and those may benefit from a more generic
>

It seems to me that most vendor solutions that exist don't operate in 
the kernel code but usually in firmware based solutions, right?

I think to come up with a generic solution we need to first have a 
vendor that "wants" to participate in a generic solution to design it 
properly.

>> register the frequencies in use(or unregister those frequencies no longer
>> used) via the dedicated calls. So that, other drivers responding to the
>> frequencies can take proper actions to mitigate possible interference.
>>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Co-developed-by: Evan Quan <evan.quan@amd.com>
>> Signed-off-by: Evan Quan <evan.quan@amd.com>
>> -- 
>> v1->v2:
>>    - place the new added member(`wbrf_supported`) in
>>      ieee80211_local(Johannes)
>>    - handle chandefs change scenario properly(Johannes)
>>    - some minor fixes around code sharing and possible invalid input
>>      checks(Johannes)
>> v2->v3:
>>    - drop unnecessary input checks and intermediate APIs(Mario)
>>    - Separate some mac80211 common code(Mario, Johannes)
>> v3->v4:
>>    - some minor fixes around return values(Johannes)
>> v9->v10:
>>    - get ranges_in->num_of_ranges set and passed in(Johannes)
>> ---
>>   include/linux/ieee80211.h  |   1 +
>>   net/mac80211/Makefile      |   2 +
>>   net/mac80211/chan.c        |   9 ++++
>>   net/mac80211/ieee80211_i.h |   9 ++++
>>   net/mac80211/main.c        |   2 +
>>   net/mac80211/wbrf.c        | 105 +++++++++++++++++++++++++++++++++++++
>>   6 files changed, 128 insertions(+)
>>   create mode 100644 net/mac80211/wbrf.c
>>
>> diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
>> index 4b998090898e..f995d06da87f 100644
>> --- a/include/linux/ieee80211.h
>> +++ b/include/linux/ieee80211.h
>> @@ -4335,6 +4335,7 @@ static inline int 
>> ieee80211_get_tdls_action(struct sk_buff *skb, u32 hdr_size)
>>   /* convert frequencies */
>>   #define MHZ_TO_KHZ(freq) ((freq) * 1000)
>>   #define KHZ_TO_MHZ(freq) ((freq) / 1000)
>> +#define KHZ_TO_HZ(freq)  ((freq) * 1000)
>>   #define PR_KHZ(f) KHZ_TO_MHZ(f), f % 1000
>>   #define KHZ_F "%d.%03d"
>> diff --git a/net/mac80211/Makefile b/net/mac80211/Makefile
>> index b8de44da1fb8..d46c36f55fd3 100644
>> --- a/net/mac80211/Makefile
>> +++ b/net/mac80211/Makefile
>> @@ -65,4 +65,6 @@ rc80211_minstrel-$(CONFIG_MAC80211_DEBUGFS) += \
>>   mac80211-$(CONFIG_MAC80211_RC_MINSTREL) += $(rc80211_minstrel-y)
>> +mac80211-y += wbrf.o
>> +
>>   ccflags-y += -DDEBUG
>> diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
>> index 68952752b599..458469c224ae 100644
>> --- a/net/mac80211/chan.c
>> +++ b/net/mac80211/chan.c
>> @@ -506,11 +506,16 @@ static void _ieee80211_change_chanctx(struct 
>> ieee80211_local *local,
>>       WARN_ON(!cfg80211_chandef_compatible(&ctx->conf.def, chandef));
>> +    ieee80211_remove_wbrf(local, &ctx->conf.def);
>> +
>>       ctx->conf.def = *chandef;
>>       /* check if min chanctx also changed */
>>       changed = IEEE80211_CHANCTX_CHANGE_WIDTH |
>>             _ieee80211_recalc_chanctx_min_def(local, ctx, rsvd_for);
>> +
>> +    ieee80211_add_wbrf(local, &ctx->conf.def);
>> +
>>       drv_change_chanctx(local, ctx, changed);
>>       if (!local->use_chanctx) {
>> @@ -668,6 +673,8 @@ static int ieee80211_add_chanctx(struct 
>> ieee80211_local *local,
>>       lockdep_assert_held(&local->mtx);
>>       lockdep_assert_held(&local->chanctx_mtx);
>> +    ieee80211_add_wbrf(local, &ctx->conf.def);
>> +
>>       if (!local->use_chanctx)
>>           local->hw.conf.radar_enabled = ctx->conf.radar_enabled;
>> @@ -748,6 +755,8 @@ static void ieee80211_del_chanctx(struct 
>> ieee80211_local *local,
>>       }
>>       ieee80211_recalc_idle(local);
>> +
>> +    ieee80211_remove_wbrf(local, &ctx->conf.def);
>>   }
>>   static void ieee80211_free_chanctx(struct ieee80211_local *local,
>> diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
>> index 91633a0b723e..719f2c892132 100644
>> --- a/net/mac80211/ieee80211_i.h
>> +++ b/net/mac80211/ieee80211_i.h
>> @@ -1600,6 +1600,8 @@ struct ieee80211_local {
>>       /* extended capabilities provided by mac80211 */
>>       u8 ext_capa[8];
>> +
>> +    bool wbrf_supported;
>>   };
>>   static inline struct ieee80211_sub_if_data *
>> @@ -2638,4 +2640,11 @@ ieee80211_eht_cap_ie_to_sta_eht_cap(struct 
>> ieee80211_sub_if_data *sdata,
>>                       const struct ieee80211_eht_cap_elem 
>> *eht_cap_ie_elem,
>>                       u8 eht_cap_len,
>>                       struct link_sta_info *link_sta);
>> +
>> +void ieee80211_check_wbrf_support(struct ieee80211_local *local);
>> +void ieee80211_add_wbrf(struct ieee80211_local *local,
>> +            struct cfg80211_chan_def *chandef);
>> +void ieee80211_remove_wbrf(struct ieee80211_local *local,
>> +               struct cfg80211_chan_def *chandef);
>> +
>>   #endif /* IEEE80211_I_H */
>> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
>> index 24315d7b3126..b20bdaac84db 100644
>> --- a/net/mac80211/main.c
>> +++ b/net/mac80211/main.c
>> @@ -1396,6 +1396,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
>>       debugfs_hw_add(local);
>>       rate_control_add_debugfs(local);
>> +    ieee80211_check_wbrf_support(local);
>> +
>>       rtnl_lock();
>>       wiphy_lock(hw->wiphy);
>> diff --git a/net/mac80211/wbrf.c b/net/mac80211/wbrf.c
>> new file mode 100644
>> index 000000000000..63978c7d2bcb
>> --- /dev/null
>> +++ b/net/mac80211/wbrf.c
>> @@ -0,0 +1,105 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Wifi Band Exclusion Interface for WWAN
>> + * Copyright (C) 2023 Advanced Micro Devices
>> + *
>> + */
>> +
>> +#include <linux/acpi_amd_wbrf.h>
>> +#include <net/cfg80211.h>
>> +#include "ieee80211_i.h"
>> +
>> +void ieee80211_check_wbrf_support(struct ieee80211_local *local)
>> +{
>> +    struct wiphy *wiphy = local->hw.wiphy;
>> +    struct device *dev;
>> +
>> +    if (!wiphy)
>> +        return;
>> +
>> +    dev = wiphy->dev.parent;
>> +    if (!dev)
>> +        return;
>> +
>> +    local->wbrf_supported = acpi_amd_wbrf_supported_producer(dev);
> 
> 
> I haven't been looking at this series closely so perhaps this has 
> already been answered, but is this layered correctly? I'm surprised to 
> see core wireless code directly invoking a vendor-specific API.
> Instead should there be a registration mechanism with associated callbacks?
> 
> As I mentioned above I could envision multiple registrants for such an 
> interface.

This feedback was previously shared and earlier versions of the series 
had added another layer to make it generic.

The major complexity is that the semantics of how such a registration 
and notification would work are highly implementation specific.  So the 
generic solution just guessed at how it could work generically and fit 
the ACPI one into it.

The key tenants for a generic solution are:
1) Knowing that you need to notify frequencies
2) Knowing that you need to know about frequencies
3) Knowing which devices in the specific hardware design can be problematic.

It's a lot of complexity that you need deep knowledge of the design to 
do properly.  When this generic concept was brought to drivers/base 
however there was no interest in a generic layer at that time.

So this version of the series returns back to only introducing the AMD 
implementation.  The idea being if another implementation is proposed we 
can look at the overlap between how the two work and could jointly 
introduce a new generic layer.

Hope that explains it well.  As products that need this solution are 
entering the marketplace and can benefit from this kernel work, I hope 
this can be reviewed again soon.

> 
>> +    dev_dbg(dev, "WBRF is %s supported\n",
>> +        local->wbrf_supported ? "" : "not");
>> +}
>> +
>> +static void get_chan_freq_boundary(u32 center_freq,
>> +                   u32 bandwidth,
>> +                   u64 *start,
>> +                   u64 *end)
>> +{
>> +    bandwidth = MHZ_TO_KHZ(bandwidth);
>> +    center_freq = MHZ_TO_KHZ(center_freq);
>> +
>> +    *start = center_freq - bandwidth / 2;
>> +    *end = center_freq + bandwidth / 2;
>> +
>> +    /* Frequency in HZ is expected */
>> +    *start = KHZ_TO_HZ(*start);
>> +    *end = KHZ_TO_HZ(*end);
>> +}
>> +
>> +static void get_ranges_from_chandef(struct cfg80211_chan_def *chandef,
>> +                    struct wbrf_ranges_in_out *ranges_in)
>> +{
>> +    u64 start_freq1, end_freq1;
>> +    u64 start_freq2, end_freq2;
>> +    int bandwidth;
>> +
>> +    bandwidth = nl80211_chan_width_to_mhz(chandef->width);
>> +
>> +    get_chan_freq_boundary(chandef->center_freq1,
>> +                   bandwidth,
>> +                   &start_freq1,
>> +                   &end_freq1);
>> +
>> +    ranges_in->band_list[0].start = start_freq1;
>> +    ranges_in->band_list[0].end = end_freq1;
>> +    ranges_in->num_of_ranges = 1;
>> +
>> +    if (chandef->width == NL80211_CHAN_WIDTH_80P80) {
>> +        get_chan_freq_boundary(chandef->center_freq2,
>> +                       bandwidth,
>> +                       &start_freq2,
>> +                       &end_freq2);
>> +
>> +        ranges_in->band_list[1].start = start_freq2;
>> +        ranges_in->band_list[1].end = end_freq2;
>> +        ranges_in->num_of_ranges++;
>> +    }
>> +}
>> +
>> +void ieee80211_add_wbrf(struct ieee80211_local *local,
>> +            struct cfg80211_chan_def *chandef)
>> +{
>> +    struct wbrf_ranges_in_out ranges_in = {0};
>> +    struct device *dev;
>> +
>> +    if (!local->wbrf_supported)
>> +        return;
>> +
>> +    dev = local->hw.wiphy->dev.parent;
>> +
>> +    get_ranges_from_chandef(chandef, &ranges_in);
>> +
>> +    acpi_amd_wbrf_add_exclusion(dev, &ranges_in);
>> +}
>> +
>> +void ieee80211_remove_wbrf(struct ieee80211_local *local,
>> +               struct cfg80211_chan_def *chandef)
>> +{
>> +    struct wbrf_ranges_in_out ranges_in = {0};
>> +    struct device *dev;
>> +
>> +    if (!local->wbrf_supported)
>> +        return;
>> +
>> +    dev = local->hw.wiphy->dev.parent;
>> +
>> +    get_ranges_from_chandef(chandef, &ranges_in);
>> +
>> +    acpi_amd_wbrf_remove_exclusion(dev, &ranges_in);
>> +}
> 

