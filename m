Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229317D9DA7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC2610EA05;
	Fri, 27 Oct 2023 15:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347C010EA05;
 Fri, 27 Oct 2023 15:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYOcwkFf28AGqYZO9WnsAvILLE6rHnMlE4VwOCiG3yHdfwN6Q1VWZHfFlUJ1xsIbIXT34km88DpVRb0DJDHa0sJZA8EwsFjx/woJnmhTL5kaS6++R4tuvHDSZjMW74IndOggE4hbSIppemDIzB0U01WIssWtLmcNFdlsJFuZ3hN3NaVe2uNcjZ9WBZYkpcz4x+VwIFUypnDoHc0ktQUL6zYEFJAPAOF+63eML/lKmLr6Yfz6hrmJGFICg3lSdoP3nTdfqtGdjTvbqqa+e0/KVz6AxF5S+f8fDNjHg24l1nfs+c61r16DOjNJp0FJdprtn0qtTGvLCYyPpwsCNVCDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1TfIPt1cbjW3DLMs2D2GJ99nbyoR1htOI41It5+/e8=;
 b=Y0OJAAltMVbl/sBl1nK28twFCPdUyMkZPXz34xj7YhIy4v8mg5WfoIJd8pAUczqy0KPKQc9NFKKznTA1hsAfdrtvMBpC1VlwAnQZy9CbdTtLvTnfHfORgwvNjVDTWeAPsVISoYZ/UAFfuHjpRfesuPdP+3RW6UQ0+sKRgVWj5mWKJg60OJEmhhnjKiNDGQ/Pnt6c9FwCB2GmTN/CfJKPhaRuvv61yHf7skTcQDVe52+4Tw+enme6x15HOrbAweH3aOpYR87IOIcB+m7gqC/01cqiA+MTN6HVbMRX9CLhDUWNVI+TKd2Ylz2thv51aBA6lpTEROnYkiGO544Qr3OC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1TfIPt1cbjW3DLMs2D2GJ99nbyoR1htOI41It5+/e8=;
 b=UCQz0TQp6Zu9BV18Ce3iLa0Nex1w4UhA8Q2KCxpZkbnhplfbRkQVhnlSNBAtZ6E3SWu6Vv8Al8SaKRhf2YE27+vYqRT1I2enZZ9qS1129ltuZ/G8AqG6fO5aH7miYRCCPVLoGKPQ0SKhwe5Qmaf5KdbichcZk6xffmAFzPpTSOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 15:57:49 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 15:57:49 +0000
Message-ID: <39ab34ec-209d-4176-b271-1a02e2976497@amd.com>
Date: Fri, 27 Oct 2023 11:57:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Content-Language: en-US
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>
References: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <dc2242cd-6522-4073-b376-edc2a9abc3d9@amd.com>
 <PH8PR12MB727953EE85D593EF25650454F9DCA@PH8PR12MB7279.namprd12.prod.outlook.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <PH8PR12MB727953EE85D593EF25650454F9DCA@PH8PR12MB7279.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0024.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::32) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ0PR12MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 541d9933-34a8-4d4e-15a1-08dbd705780f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nAZyN5C/+YrxEVURsQrU7kvEK6MuK9dWC3Nds77KH58Ddc5p6oGO1o1MoQ9/8FFjKQsAQy2EbuWilWyDk1eA6Tj+ndWfbZMLxPhN2vpBWi9x9TaIzEpUzI3Oq5YJkV+iSkc7y9AI54USX/x0f2zu6Zxx4U1o5Vr2Ylh85UB2u5arX5+A5U2wzox+plL6yu1UYwgqKQBY2jZMvQ7ifVoGH7mOsjAQZQw9WsUQ5E+NrkNdM0zMI9oq6+hrrT+GTAqghIB96/MdHgzJO6eaHb5bVDnNrEgEACgd0zqKtpYQn9PCeXggCpyGEK5lEL3GmwOpDGhDAp1lm/Y91VqC6yAQO8oB5mh70D5INOM6Byog09fCclD/7GNcPGKM8685Ryzg9dmRihcENDfOj0GUOy/10tfD66HsnCp/GdWiK3cqQXkYi8p7dETQ+EEAAL8b2CQCUcUtt9NO76WxIzNZdDTb5w2o9xSkh+obm1S/156WoTeITUTj3jmL7X9gwrYmRc4CEcskJwb3ibu6A9jHyQ/R0CMZklMDne8bJPuxCC+y7b0bxUsTxpwtvw+G9cbUSKdngF9JQgkLy8rHOShkNoWz6xItcqkmzCaaI/ysyJ0ipvmssdG88n9tBK8aEBz+PE8p2gOKXI9rWf/odgMiiWspeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(110136005)(66476007)(66946007)(66556008)(54906003)(26005)(316002)(478600001)(6666004)(6486002)(6506007)(45080400002)(6512007)(53546011)(44832011)(41300700001)(31686004)(38100700002)(31696002)(2906002)(86362001)(5660300002)(36756003)(4326008)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXV0bXdNdHJQcEJLTEIvcEU4ZExqa2YxN1RRSnVCUUpBSUIvL0d5dnp5aFBV?=
 =?utf-8?B?OGxHbXNZSWZsMVRGc1Z3MEU4UWFSVXdSZVJNU0ZQNTZRa2pDVE12c0dYNzFq?=
 =?utf-8?B?VzhLRG5lSVFqc0F1THQ0MGZGdDczYVRmNW9uTy90dGtVTVNvMHZSWTg1NkIw?=
 =?utf-8?B?eVZKTXNwRmpTT2RKR0VxWmF6SXhKdUZWZlpKMmErYk9PaDZ6YTBKOUQzaVZv?=
 =?utf-8?B?UGZhY2FCWi96VUp0Q211ckJXWEQxYzhkV3ZBYTcvdTZSaFR0VGEzZURhTHpM?=
 =?utf-8?B?LzZLQ2lsVkRjS3hKOGxIdWJoWkJTWlB5T1Q4ZWFmOFl2dmNkQjhacmtvTkVK?=
 =?utf-8?B?NE1WUFNyclE2Wk9ZNWQraGQ1dGFqSUFCSWRTamFtMHFaYUtQSkpabFFER1p0?=
 =?utf-8?B?QXZNaEt4TWJyNG5GYWtRelQ4cmw5akNwQ3d5TzJxY0xuQTN2OTkxSUJmQzVa?=
 =?utf-8?B?UVZrUXNtNWt4YWIzbnFKdUpPMm9ncmRoK05BNHNmUTdLbVlEbGJCWnRJOHV3?=
 =?utf-8?B?MEJnTmNRZE5JV3JGNkFUY1UwckxndVhnT0xnVDRXZHFNTEl5cis2S2x4di83?=
 =?utf-8?B?NnhNVDFGMlNuNEd3L0N4VzB4S1hYNFlrNUo5Z2N0UlJJVjkrRVhMMm1qTmF5?=
 =?utf-8?B?RkFmK2FQVk16aUxQMWIwT3laakhXemxDMWZabkJ4RDRnV1J1VmNqeHJzT3Yv?=
 =?utf-8?B?UnZOc080bWFKdTliZlJFSFB4dHhEejkrTFl5S3BTR2FXcTc3dng0QjM0MUph?=
 =?utf-8?B?SkNxdkJaQUFxMTlEcUJLM0tqZkt1RFNTeE5zbzN3K3VORkdjRzhqUjRmZ3kz?=
 =?utf-8?B?OU55aE9zem1XNmZpeGZucXpUY1g5R2FwOG5NQ2VWeWlQQkhNeDFGMjhXWFBh?=
 =?utf-8?B?T1J4MGJUK1U5SlRWeVVnRFpxTmdyc1o5NHRJTEpRTmIwY2htNm95bm9ZcTNq?=
 =?utf-8?B?RzR6WHYvWjFNUXRKbVkybDNyenhzYUpNZU9MNTh3SGNJYldxZVlwV2NlcUY2?=
 =?utf-8?B?TnQ4M1lwNUNyZGwwcDJ5bVFpZVBLU1dLWnB1QkYwZzVWV0xaMUtmZmN6ZE5h?=
 =?utf-8?B?aUVEV29BbkNRVi9jeGJkNHFqR3I1RlZxRWNvQTdyV3QrTGZSRnRjdEU1cE1p?=
 =?utf-8?B?TWNMRUpNY0Mxdng4dmxNNVVpVFg5WmZ2VVg4UzdRTXlGcnVOTjJzVEZWZjF6?=
 =?utf-8?B?RWRYTk8wUWNKK2EvSDNlUXU0MzJuMXlRd0ZHQzJINURiMkx0aWNCY2R5SFVn?=
 =?utf-8?B?enZYT01nNjJISy9jZnpqOE83c0ZMWU9ZcHZpRHMzV3IrY3dVc1ZFN290TExv?=
 =?utf-8?B?eUJZTVpVdnFHVitpZ1AyeDdTbzYxWVVDOTljMzdLSjc2bUNLK2pYMmJCSXpJ?=
 =?utf-8?B?dCthcFJKd2VxVkJCaStlcWZJUW9DcStWRDZMVjkxU25kaGFKWXJpMlZoY1hL?=
 =?utf-8?B?QzBkY0xZMXhBVitlcFY1T2ovOVJPM0hnRTFsRVkyMmc0WnZ1WkRqTlRlRENz?=
 =?utf-8?B?Y0k0aVdSUmgwZE5sRnFtSERZUUxJYXZxMXBERnQrREg1YzJUMURJS1JBa2Yr?=
 =?utf-8?B?czdIOUxteDh6VkVPSlB6VVduU2ZNN0hGdHpVZjhHYmhSbmFycks0Mkk5UWhJ?=
 =?utf-8?B?aGxwVTI1cG5hUlcrOC9QZTdEZnc4OXRad1FTVVlmM1V1K0sva3d1U29ibkY4?=
 =?utf-8?B?YnFLNnFmZEdrVTRycXVkTm5JSVBkVlVJeWJFUEw1aUxpMS95QzRnaFV5OHIw?=
 =?utf-8?B?ZTRJcFIyd0NZcTJoNmpaOGtsdGhHWUd1d3Qrak1QNU5NMmlXYWlpNkFueEhu?=
 =?utf-8?B?K0hTRC9Henp0NDBaZnJnVGY1L3MwakRaTkdkOGVvWnNjT2xYTVMyeXNLaGlU?=
 =?utf-8?B?QStYekxYUnJTZEs2WFJ1M2hRMG1yOVVwcG9pd1VMM3ljWkdPY3JLTlM1WmZZ?=
 =?utf-8?B?bXpVSktPa1RqK3BONUZFSTJ5aEpaNTkwc01PNk5GM0xpZEprSkdRL1FocHNn?=
 =?utf-8?B?bVNWZzk2bVlXWEtLSlZuV3B4RUVsRjA2VHV2QUdqVE90K0Zvb25MbGJiUE0w?=
 =?utf-8?B?OGNhRENCbER5c1Erd01rcklPQmVBdGNHTVRIZS9zZ1RxeVRISjRpSHR1ekNW?=
 =?utf-8?Q?FTMhWhV0kz7xLKvNMvI/aXf9b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541d9933-34a8-4d4e-15a1-08dbd705780f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 15:57:49.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANAGuT+5wNusWTathOgj8fxwDbSjagMlfKylVUTbR64aC9pPjJyQ0+J9gtUv+/KqH4/0MnvBhIzdTNfmkee2tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5673
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/23 11:55, Lakha, Bhawanpreet wrote:
> [AMD Official Use Only - General]
> 
> 
> 
> There was a consensus to use memset instead of {0}. I remember making 
> changes related to that previously.

Hm, seems like it's used rather consistently in the DM and in DC
though.

> 
> Bhawan
> 
> ------------------------------------------------------------------------
> *From:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
> *Sent:* October 27, 2023 11:53 AM
> *To:* Yuran Pereira <yuran.pereira@hotmail.com>; airlied@gmail.com 
> <airlied@gmail.com>
> *Cc:* Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Lakha, Bhawanpreet 
> <Bhawanpreet.Lakha@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira, 
> Rodrigo <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org 
> <linux-kernel@vger.kernel.org>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; Deucher, Alexander 
> <Alexander.Deucher@amd.com>; Koenig, Christian 
> <Christian.Koenig@amd.com>; 
> linux-kernel-mentees@lists.linuxfoundation.org 
> <linux-kernel-mentees@lists.linuxfoundation.org>
> *Subject:* Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in 
> amdgpu_dm_setup_replay
> On 10/26/23 17:25, Yuran Pereira wrote:
>> Since `pr_config` is not initialized after its declaration, the
>> following operations with `replay_enable_option` may be performed
>> when `replay_enable_option` is holding junk values which could
>> possibly lead to undefined behaviour
>> 
>> ```
>>      ...
>>      pr_config.replay_enable_option |= pr_enable_option_static_screen;
>>      ...
>> 
>>      if (!pr_config.replay_timing_sync_supported)
>>          pr_config.replay_enable_option &= ~pr_enable_option_general_ui;
>>      ...
>> ```
>> 
>> This patch initializes `pr_config` after its declaration to ensure that
>> it doesn't contain junk data, and prevent any undefined behaviour
>> 
>> Addresses-Coverity-ID: 1544428 ("Uninitialized scalar variable")
>> Fixes: dede1fea4460 ("drm/amd/display: Add Freesync Panel DM code")
>> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 3 +++
>>   1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
>> index 32d3086c4cb7..40526507f50b 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
>> @@ -23,6 +23,7 @@
>>    *
>>    */
>>   
>> +#include <linux/string.h>
>>   #include "amdgpu_dm_replay.h"
>>   #include "dc.h"
>>   #include "dm_helpers.h"
>> @@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct amdgpu_dm_connector *ac
>>        struct replay_config pr_config;
> 
> I would prefer setting pr_config = {0};
> 
>>        union replay_debug_flags *debug_flags = NULL;
>>   
>> +     memset(&pr_config, 0, sizeof(pr_config));
>> +
>>        // For eDP, if Replay is supported, return true to skip checks
>>        if (link->replay_settings.config.replay_supported)
>>                return true;
> -- 
> Hamza
> 
-- 
Hamza

