Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336A77D9D82
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3095110EA02;
	Fri, 27 Oct 2023 15:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB8D10EA01;
 Fri, 27 Oct 2023 15:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYyXF3d23qiuwFsdsK4/oymUyWVuWILhHZtMlsSbNBT5eWd+3M50Y8mqrAGpG+lrwKvmQZo+OqohmRkCBIbf21dTuic8WR3zj4tAavobT243pEgPLUQQb1YqAKUXMx+zZcHjy77QgoT/F6xShQhRupxObfMR9cPZ/sDPJWHBQKDJfRN8bvaabWwI/HvNAbFP4JApAq9zuLVP8sfXjM6gHBwp/6Dq6/cvldoEIr3V9rq69dnknJ3epMg2BAjss61hVejWwLf2Cj6JABPY6bARotaw5RbSEGMX2e6yDCljwH0BZhZ4D685X+Zq+RPt0SOMG6WyKJz2USbqsjnEjKvvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2HJuJCrVH9NRO86esRGOSYRmmcGOUPQ88kEGe4vSdA=;
 b=O2VfwZ5OukVzpcFv0AvPlUhv5Flm7/PFRatwcZnDNzSb5rqOHjZZVoApJymSO3Ps5OpKDX26atnbpxXTeijtquRxPW0AhcgIO/kxI3iDFNTj0u+qHNeRBjjwHuhbNXqCtnGGZ8MK2EW2ikQWSC6WgJIVxV0OpkLcg79XHJtMNOqfgln5xPUveyF9hc5pe8Fv+/xwObQW+KqgHgBDPSw6c/ZNxjkF+FLAOuTXowiuDgKQZMNQteNgwsvZ5hM0xuYr7gA67nScBFYH3trdIFQDaYLppNq0YCzTPnS55IYs0UGHmAhMmIKrAkMezQfLtjUdgyyiRmJdWmbn35e3h9K4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2HJuJCrVH9NRO86esRGOSYRmmcGOUPQ88kEGe4vSdA=;
 b=4Me7Uj4NGxfDu0xGM3V0L9CRZmUzEvkYxEbGKYHSsEPbNrzwfmrWucIRTs/0QSBy8ziDxSgyHmVVmM3R1MfIqymORoXRX4Tlirb11GSFBtBGxWUdczrrD8CJ9iauiL9w/wtGBEfdhmSEAVSjR9mHm+yA+eUlicohCQwD2ArDzoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Fri, 27 Oct 2023 15:53:54 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 15:53:53 +0000
Message-ID: <1c88d721-75ea-4c3b-9e50-706c4ec87899@amd.com>
Date: Fri, 27 Oct 2023 11:53:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: Yuran Pereira <yuran.pereira@hotmail.com>, airlied@gmail.com
References: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <dc2242cd-6522-4073-b376-edc2a9abc3d9@amd.com>
In-Reply-To: <dc2242cd-6522-4073-b376-edc2a9abc3d9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0284.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::23) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6797af-c04e-4c09-6af5-08dbd704ebc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvco4FqklP4QKv1VrlmnDEMjBIvvDyzk5aFUpjNLHlkw0RKHF5/+wpXpG2gSZn4XdHf3ys0T9bEXfEw7nuaPt9XTB+RNvqGWNGY/CUvUhjM6CuULpPu+R/aMK2hO5/R8FEfBM21bOEr+zEwgECs8uK7YXXVVilS6/kFjmm939E0scYJKNTcVbon5cysFoBFC8sKHTgr0RpZcWsAmsIbLfv54UB4dkf2iawWxyqnzVlM1uaMHI9EkK6d2D9MSN4YXr6xoHDGqo1KM72hmT4+rdddD103lGnXhMITpQtlN4EiIzFZlZtAvpALBoO+RJa3lZG67v/NLWOY5O/0xuXjNyfMhIe1ulyyjJxrxtIY2cTNjEJErVVfC1p6pePQSD+BAP438jHM7IL8QkQD5fKWXd7rjWCQ6a6JakLvE7fPuzD7fSXVa6SEgtA8Vp2RcBxLBlLonI/vkBwcBl+ijmXyeCahB3TSGPQCRuhoXUqscsCKq+H8fFs6h2xdbEu7LsjLR1tLQFY9COPwuMZEXT9p/tfZBSmWa90EOXes9QEtbmIwGg6woh3Dh4JTzmudUfao/CEJXhAN6YemIEzXiSRbznuBq41aBR7RPv5CG9S+mi4S/+axlO+3IOO9MLsL9BkwXJOCrPvB9up3G5ZrPz68/JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66556008)(478600001)(66946007)(316002)(66476007)(8936002)(8676002)(4326008)(45080400002)(6486002)(31686004)(5660300002)(53546011)(6506007)(38100700002)(31696002)(86362001)(6512007)(41300700001)(2906002)(26005)(44832011)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU91UEt5TWpucHB3YWpiMmorUWtTLy9jeVZZdFpXdlBHT3U5d2J5akdzSEd5?=
 =?utf-8?B?dDZZcDMrUTFDTkNFNXZ2bFFjeVgxL1Vmcmc2VTB2Ujd4aTlkVFVEbkNkTGkr?=
 =?utf-8?B?Sk1mUm93YW9pYWViTDFZdjhCaTkzVXZRTy8zYTlaUisyNW9xMG9teHBBeVRB?=
 =?utf-8?B?bUdHdTdZTmtqY0xHa3JRUFFiRU9oQmNIR05qcTIzZ1hMWkdlSVovNkJkMFd0?=
 =?utf-8?B?VGxlbXJBZUNXM002amE4Q3Y1Qm0rS2tpK21OVC9vSGFxbVF3Mm5MZVl1NHdh?=
 =?utf-8?B?NklVOWVNSmF1WHhrNkc5bVRiajB6VVFBTjVzWmp6czZFYVlDVjdjL1dtLzJ4?=
 =?utf-8?B?ZGh3WVRMSllIVlJuNTgwTlNuanY2dndFUDVDNGNreHdEaFdkczZ3VmNmUDF4?=
 =?utf-8?B?c1NYaWdyUmdZenBZM2RaRUpJK3Q5aDd6UE5temswZkNROFJxV3hSaFZ2MWRR?=
 =?utf-8?B?eWwzS2FpNkUvWGVGQVIyMk5FdjVOZmtudlJtNzJyOC9XWjVVengzSzdwRWV1?=
 =?utf-8?B?S2ZONVRldE9nY1N6SzdQSy9TbndnUGY4RHdCRGt3d0orUDMyRXFhMGhNZVFs?=
 =?utf-8?B?VlJkd1A2Nk1ySVZMYzcvK0JtY1NWWFE2UUw1Y1g3KzZhTktKVmFyS3Vya3E1?=
 =?utf-8?B?alN6bW54RUFJeWswalBOaGREZ3dMdWRWMVlONlNJRnQ2eUgrMXhJdjZsVWZP?=
 =?utf-8?B?cnBGWVBzd2JHOWVnL2JGclFrVFJIcFd3V3ZsOFdsMVVnYlFId1duZEZKQkpC?=
 =?utf-8?B?THoyWFZEOG1HeExrR1RKd3RUQytIMjJMb2sxZTZmb0p4aTFpeXdudi8zcjBT?=
 =?utf-8?B?ZStuQ1hRVWZkWTdvdFdqQWNvK3dnc0VyazJydXdXc1lLdlpIbndwdzRaTWp6?=
 =?utf-8?B?V3hKdzI5dStUbDBjVGQzQ2hBRHFiTCsyYm5YWDg0S1BWTFFFRmo5VCswTnh5?=
 =?utf-8?B?WkZEcmNtYitjaWlSR1ozRDBDNitycDEzN2tQeHpkek1PL2lYcmdqSGp1OUdN?=
 =?utf-8?B?bkJyMTRyMTFGcHdNL3ZkdGpWU1JIclduck9RQUVlcWl0WkY3b3U4ZUg1bGVT?=
 =?utf-8?B?ZWora1hUNVJYdHdDb1JBR2V0WER0d2pWb3ZQRWlPdkduSC90WE5VKzA2bEVG?=
 =?utf-8?B?ZGNvY0llKzg3T1JQTXNCdkh5RFBqZUV3UFk5Sm9wT2F2VTdMUTB2WC9vSWhM?=
 =?utf-8?B?bG9LSk0wazlMdFdETEN6Ums1aW56R2s1UWlBK2JpUTRHL0FWaE9kRnZMa0c2?=
 =?utf-8?B?QmVod3BNL3ZJL210V2RmQWxLU2RaR0lwVElZVExmZHpxRVkreDZNenRxTDdF?=
 =?utf-8?B?MjhhNXEvUWVjUmJ5eC9PTDA4czdxRFM1d1ZMSEhFU3RjNjlwQWlFU215dVZO?=
 =?utf-8?B?bkpSaStFT2ZsVjhNbEsvbWNnVmR4NDJMU3RiaE9xckh2WGZ0b3pHZ3lVUEtI?=
 =?utf-8?B?MjJrQ29hbFppKzRpNC9CWUtSL1NUNWc4QVYxVUJSeFVyKzF0VDF1Q3Z2d25G?=
 =?utf-8?B?ZGFoSG90RWpyUURrQ1RmaXhsek1sMFR4Yit1RkxucU5jdEZGaG5ZMXZuUTBn?=
 =?utf-8?B?em5YMnl2S2ZzSTdRM2UvaEJodWxveGxLTEQxMTI1QlRhZ3cwOFR6NlJ2ZkQr?=
 =?utf-8?B?RGQzL0s0Znc2R0gwWlI0U1d3RGU2SEtySEY3RUFHMThzMjJNZmZ6WjVKMGpO?=
 =?utf-8?B?R08xY3g2eUliYWhJVVdqTFBaK21kdU9YalJxb1l1QitSQnlNQ2xwUkhOdk5E?=
 =?utf-8?B?NndFQWNwL3VQb2o1S3ZSeFVVenllMStuSjdiK2E1UWI0dS84cGZydWdnU3ph?=
 =?utf-8?B?YU12ckg0dzdaemswY2gzMjBFU0FnUHlxREp2a0h1YmhKN2ptT1Z1SjF2VWox?=
 =?utf-8?B?K1hzei83NGdNUEdiZDAvak9XUjhyZXg0SGZ6SUhHVzJ0RDBPeUhnaklhd2ZL?=
 =?utf-8?B?OVZGMHZadmFNcHZ5VktqaVhYMUxmd1ZDeThPRTNDdjM1UFQ3azRDVEFEcjNr?=
 =?utf-8?B?TGExYi9GbEpWZWpQUE1OTDQ5anJZOGIxUlZ2L29QM2pDYmovUkVuSFArRmIz?=
 =?utf-8?B?cWZpY3BEMEcrSGF0dW1GK2FhMzF5YkZ5ck5VUUdJZkJIOTJKQmpsUkhSVS84?=
 =?utf-8?Q?SB5mqJ9Zp2bjys5SJCATnHRQJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6797af-c04e-4c09-6af5-08dbd704ebc0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 15:53:53.9109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfQ76IlKzQN9b4SJXPlx+V2gR9lzmn8dT6+S+EehqrMXmAkO4sPaHUBykzpDDNgnKqdcU33Sc+/BczaY35WdEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
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
Cc: sunpeng.li@amd.com, Bhawanpreet.Lakha@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also, please write the tagline in present tense.
On 10/27/23 11:53, Hamza Mahfooz wrote:
> On 10/26/23 17:25, Yuran Pereira wrote:
>> Since `pr_config` is not initialized after its declaration, the
>> following operations with `replay_enable_option` may be performed
>> when `replay_enable_option` is holding junk values which could
>> possibly lead to undefined behaviour
>>
>> ```
>>      ...
>>      pr_config.replay_enable_option |= pr_enable_option_static_screen;
>>      ...
>>
>>      if (!pr_config.replay_timing_sync_supported)
>>          pr_config.replay_enable_option &= ~pr_enable_option_general_ui;
>>      ...
>> ```
>>
>> This patch initializes `pr_config` after its declaration to ensure that
>> it doesn't contain junk data, and prevent any undefined behaviour
>>
>> Addresses-Coverity-ID: 1544428 ("Uninitialized scalar variable")
>> Fixes: dede1fea4460 ("drm/amd/display: Add Freesync Panel DM code")
>> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
>> index 32d3086c4cb7..40526507f50b 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
>> @@ -23,6 +23,7 @@
>>    *
>>    */
>> +#include <linux/string.h>
>>   #include "amdgpu_dm_replay.h"
>>   #include "dc.h"
>>   #include "dm_helpers.h"
>> @@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, 
>> struct amdgpu_dm_connector *ac
>>       struct replay_config pr_config;
> 
> I would prefer setting pr_config = {0};
> 
>>       union replay_debug_flags *debug_flags = NULL;
>> +    memset(&pr_config, 0, sizeof(pr_config));
>> +
>>       // For eDP, if Replay is supported, return true to skip checks
>>       if (link->replay_settings.config.replay_supported)
>>           return true;
-- 
Hamza

