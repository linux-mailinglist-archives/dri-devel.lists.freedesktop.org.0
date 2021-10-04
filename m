Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E7421122
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 16:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4ED6E9CB;
	Mon,  4 Oct 2021 14:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BFD6E1B4;
 Mon,  4 Oct 2021 14:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjkvBqmWD6oipXfkOl4OqybCzHUNUpvb7nTvhXBpfPySJ0+qfJc9r2368SiDOeJTCZE2dHafMBylwgiha5Driz7wyrR7hsCFt06j0Cs0fP9Hnr29kBq6VCqeOlykrEhCKQU1rUrjA+N8whMVQpHZmEwnOCrZlIoc9lyP3RsDpPApSzh7T31zHMr7XF+H8xQghmRczvtjQZQEx4XUyWMcaqDBgpSsNcOPu8Ws+yOHfN4QOgFOUkXxtQbB2I+jOeGRDXWnORMqw40n6RyZ0vBHiMZZzXWJehoTQpSYUko0OdnlsdgoCtZ28o1MJnGSK4hrNNU614/atOrxzmSr6gbSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDVATnGbkdb9PL3hAbIhcMOr0m7f1IVNFYJIOHL4/1I=;
 b=Zb3Ku69937T18cOgcwrBaUlGEKKYp4PA00RBnJPCtArpPoQ0ZHswb3lHrRm/5D1B82hhBo3TdDrZ1pTLaCH0IgAGR6m3qfkbFBvp6ssu7AxPzgKac8FCwbKxpRmVWlJGpWQARnGaqYx/b11dsssLxzg1CCPs4+HguQLYV/tAXfEqKxyrfds4RAAE8+Mqta0HEC6nAy/byBmndXTSbUoqRH+gzuiq1tskqNFS//kpYOrOZjE/0/1xrU+LADl+Ea4B1Jn8XOpSLZy5Y0XV0G0hwHj5/nrbp5Ir1zD3KoW/1X1iYLQXO0qUWfdLGuldmVS+KW8v1OdJ8KaNvF/6QvIdJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDVATnGbkdb9PL3hAbIhcMOr0m7f1IVNFYJIOHL4/1I=;
 b=RPzgYF7NRlSv2dh2SZmLQKF2otBz9x6uskH3mEqbMWNpu2paIBqziZs5xG+blOMwiSRnLm1G+fi0kJ9W8aDnfVPVLGae0U6ipeQmfe5Yd36gJ4CtAPHFZxkLMF/RGDjiQw4ESma6ZRVO3uhMBNWtw9IVyT+hz1QM8SHOcou7YG8=
Authentication-Results: poorly.run; dkim=none (message not signed)
 header.d=none;poorly.run; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5458.namprd12.prod.outlook.com (2603:10b6:5:35b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Mon, 4 Oct
 2021 14:12:55 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%8]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 14:12:55 +0000
Message-ID: <4ec235b1-3ebc-8128-5b68-119f24bb602f@amd.com>
Date: Mon, 4 Oct 2021 10:12:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 2/2] amd/amdgpu_dm: Verify Gamma and Degamma LUT sizes
 using DRM Core check
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, Mark Yacoub <markyacoub@chromium.org>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 seanpaul@chromium.org, Rodrigo.Siqueira@amd.com, anson.jacob@amd.com,
 Mark Yacoub <markyacoub@google.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210929194012.3433306-1-markyacoub@chromium.org>
 <20210929194012.3433306-2-markyacoub@chromium.org>
 <20211001195650.GX2515@art_vandelay>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211001195650.GX2515@art_vandelay>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0220.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0220.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Mon, 4 Oct 2021 14:12:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce7793e3-a619-4592-bc30-08d987410f4b
X-MS-TrafficTypeDiagnostic: CO6PR12MB5458:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5458B582B9FFDDBD9D456FE38CAE9@CO6PR12MB5458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7UGBCSoNm9NqG6kpiCxyyJyuMEEa67zQbEnFzBvZo0V6A5M8U60hwtCL67oyXY3JQB2dd2dsCMymECsNMbOxyk5SLTZPGg7/zsrK7ik54hLDmZXdkC/jJgBVAWOYq9rWSet69fNf/JiNj9zBIqm45NJcy16GKTfGnAbP8R1ZvR8KorA92Y3LDJ2G43Q4uJ1u+KE4EtZHIQC7XSsqVjZXkpWWrJSLAA7UT5G+jtRo1UuMJGvzrI7SGWUYxUXTQO38uFQxyDLLrC/MUqm1hWeOZ2zj64/aMtrbx5R34BiNmbvYcbMHvXVODrbGJUGjOPPbqEACOFoL8GlA90J8tbgeH1aXT0rpOPDtyhKXHJKWJAPnNNuWZzbpRsvfXZI2yeSsY5+p7rJ4F+aezNmUl/d3Ok4IAy7RUPetsAe9aD09CosIoAXOZvsk2mgRVuKNIDz6jHjErwj9rThaqp+wR8qmVsbTC0wb+uIb1wUH0fxc7wUQErYASXwUkESdtnewNi06T+rwnJ2BieB/IsVXc2ntJiTtt9/N3iF7adB5czP+E3zjbgcf5VDQOBIQT1OYuZiyfZhanuwdeJaxioOb5vyL2FieBv/7mFeaWqUdBj/nPDqzWYrElXtpaOHB6Gt0xUwjCXFRA+aTTvw1AojdGJQyAliZqleZPJMjjTWD2S18oSiPmpu79P1PW8iFm4cB2MQ6nMvn8wR1B32ef1gSOUzjv4gtdIUdh/8pWaMCdsKhkHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(8936002)(6666004)(44832011)(2616005)(956004)(66556008)(83380400001)(66476007)(5660300002)(86362001)(4326008)(31696002)(15650500001)(8676002)(16576012)(6486002)(26005)(53546011)(508600001)(36756003)(186003)(54906003)(31686004)(316002)(110136005)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHhIZ3FsTjVxbWIxd3NSRWFBSUdoMzExVk81SktzYzdWZFdlbUxIVnlzNk10?=
 =?utf-8?B?TXJxMy8yNFp5LzRVekM2THBkUjdybkdNNU80S1NOYTNoM2FDRlBNWWo3OEky?=
 =?utf-8?B?SC9XSUp0YXdiUVVlQlg3NDZoTnBranllRmF1ODM3Ujh1Q3pUUHlUdXAzc2Ix?=
 =?utf-8?B?aVJHREVXN1lPa3h2QnBaQmN6YmozQitrOFJ5cHJkVTkxUkd5cE1wL3ZDZUFI?=
 =?utf-8?B?SCt3am9PWldtRFpwYTJkNVdnVUVKMlZwUXR0b0E4cVRPL2pBbDNDTVJWWHBm?=
 =?utf-8?B?amw1dTdMWjJSVmhlWU44allVYlFuZGgwdUI4NEoyc0lnSnV3UEQvZGpWYjlw?=
 =?utf-8?B?NlBPUGdwbUk1VDg4bFdGelgyNU9VaHpBd1VuV2pXQkRjeG5UaVhEM29kaVFq?=
 =?utf-8?B?Uks1bUdFUUpvMTdQQkNlSEthVGF1NUlUdDdqMnEzZ3plUW1nUzhhL0dtMWFs?=
 =?utf-8?B?L05WYXFhQzBUMWY4SkJYRTRHMlhjRExJMjFXbC9JN1hLbVphWFdOaGdFU2NX?=
 =?utf-8?B?NnRIY1JSQStzWVpKczlYcTJjdjUxdVBvSUY1bnNzRWthRnNCRU9iVFR6YkZn?=
 =?utf-8?B?NGZPM3dNTE1GQmYwYXFQNWY1aUNOY1pXY3FHVjlNckQwU0tzVWJsUVM1L2lN?=
 =?utf-8?B?b0pQUVBWU1Nic0k5NG90Y2ppdFA3Yk1GQkdaWkQ3OXM4MnR0NlZyOTRHTjll?=
 =?utf-8?B?alZ1alREVTFvbURsTWNtbURmSUM2bzJtcWw1Z0pBRHg4dFNhOE9CNkRVU25w?=
 =?utf-8?B?WXFLdWxjdFVqbE85bEFZTVROQXJjM1FBclpwbHlwOFlVMGNHcGV3OTFiUldJ?=
 =?utf-8?B?bURTM3pKK1hld0NSbGtVUm54NHdtU2ZrYiswMGpNczVncXphbTVQaGtSanVL?=
 =?utf-8?B?eW1SVHl2bkVzbHpZTkU5alJvTi91RTd4VDRFQzZ6a2U5TDJyTmNSd2JFTHZ5?=
 =?utf-8?B?QlJUTnJFRFZqZjBNWFVUcTVrOGY0MzBrWEJWS29JSjVpd0lSNitZK0xnZldw?=
 =?utf-8?B?c0wyUEhwS1FjL1hnaThQd0hadkZRNGZ5ZWw2RWxuYkFtUE0yUmZJQ21ZRVpy?=
 =?utf-8?B?eEp0Qytxc2d5RXh6bUdRMmpLWFBkL0cwdGh4aTk5ZTUybjdJMHMwZVA5Z2pU?=
 =?utf-8?B?YlFSMWp4S1NjWWZhK1BoNGxHWHlKN2hBK01hZVJWaVduYmw0OHNVY1Jrc0Ez?=
 =?utf-8?B?SVJYbGNzUW5LWG52U3ZPTW9lN0NjY1NqRmNja2M0QzVwRFVjc3ZkWnZLeUVz?=
 =?utf-8?B?NldUbjRUVHpDdzViQ1IrOW56bnRjV3JZVkwrTlZQZzROQnZZcVRGMjNPS21B?=
 =?utf-8?B?amtqcjlkTkxHcm8renFVNjdmZHRtVC9VUUQ3NFJjSm1pb1JGUDRYOVBPOVRr?=
 =?utf-8?B?NElFQzltNEU3NThnd2tlakRodzFSZWF5RUpkY003YXlUdnBjVzR3UUp2QXFq?=
 =?utf-8?B?azl4eFREVVdZZ1BSdjhLTmluZ2UvT3o5MHNLZHo5dXJoa1B1ck9WVTlkZmY2?=
 =?utf-8?B?bmVNZ2p5UFh6MzRpcjZXWmxjVTFGcDQ2NkVTU254dE5URHlnN1BEemlYdlYz?=
 =?utf-8?B?YkxvOFZWMXNtbVBHQVdHWllzeE5PZGFLNXBQSFhYeDlhdWRaZE1hVTBDTFhm?=
 =?utf-8?B?bisyMk1VQVVWZFE3bU1xbWN2WHM4Y3dmQ0FheUN6RWhiMG8xd3FtK1M4eXJZ?=
 =?utf-8?B?dTFpYlNGRkZIaElidjZuMUdZTDBRUHFqWlFwUzl6WWtyb2ZzWkNrb1drdGFW?=
 =?utf-8?Q?tadP86j2xcjXI320lLzdCttU1jZSjy7j9TSYc4w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7793e3-a619-4592-bc30-08d987410f4b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 14:12:55.1400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqdmjQ+Gyt3OK0htUqrjiexEdeYTi06xR2ietB+yPqrl6OBxwcNiGOJ+I5bLh4c2sMJ0oVYMoKKrwNHHuJYraA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5458
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



On 2021-10-01 15:56, Sean Paul wrote:
> On Wed, Sep 29, 2021 at 03:39:26PM -0400, Mark Yacoub wrote:
>> From: Mark Yacoub <markyacoub@google.com>
>>
>> [Why]
>> drm_atomic_helper_check_crtc now verifies both legacy and non-legacy LUT
>> sizes. There is no need to check it within amdgpu_dm_atomic_check.
>>
>> [How]
>> Remove the local call to verify LUT sizes and use DRM Core function
>> instead.
>>
>> Tested on ChromeOS Zork.
>>
>> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 07adac1a8c42b..96a1d006b777e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -10683,6 +10683,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>>  		}
>>  	}
>>  #endif
>> +	ret = drm_atomic_helper_check_crtc(state);
>> +	if (ret)
>> +		return ret;
>> +
>>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>>  		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
>>  
>> @@ -10692,10 +10696,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>>  			dm_old_crtc_state->dsc_force_changed == false)
>>  			continue;
>>  
>> -		ret = amdgpu_dm_verify_lut_sizes(new_crtc_state);
> 
> From a quick glance, I think you can now delete this function. It's called from
> amdgpu_dm_update_crtc_color_mgmt() which is part of the commit, so the lut sizes
> should have already been checked.
> 

I agree. Would be nice if we could drop the extra call in the CM function
(after confirming that it isn't needed).

Harry

> If the call from amdgpu_dm_update_crtc_color_mgmt() is not possible to remove,
> you could replace it with a call to the new helper function. And if _that_ is
> not possible, please make amdgpu_dm_verify_lut_sizes() static :-)
> 
> Sean
> 
>> -		if (ret)
>> -			goto fail;
>> -
>>  		if (!new_crtc_state->enable)
>>  			continue;
>>  
>> -- 
>> 2.33.0.685.g46640cef36-goog
>>
> 

