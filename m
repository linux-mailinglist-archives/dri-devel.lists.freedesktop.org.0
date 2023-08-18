Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C152E780CE1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8796810E50B;
	Fri, 18 Aug 2023 13:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BB610E50B;
 Fri, 18 Aug 2023 13:48:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUK3ScCOeHhG8MobQTqNCPW1mhXeV4lf8WMdWv7QoCwm323RDMk56NRJM35ehH412sV5T8EVGLt12aPxY/c4mEWE/rcGf6H4ON3yReEXPbz+NgVdWoPyqPpF6LZ7BrA6L1ht/zNWFx4z23oCypOnSz/evcLJcnP0hM0n8GL4lr0jhWUQU/0BGB63Py7YVE6sP3vInpJVtZVN3fEKgTAa8Qa2YCWRH5hP5yb8TC7A8DiZMViyvkwwKPSAwDPLJiz0wlxZKC4tEePJpFqPWu8+IYDGGz8snL2fP+Vm9YmXp3GfgXfrfRqw4v6ofYwtW+04Bk3ihDtwY77qfHlaCNzUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NAmk9jgo9breKYwJ1rtQtHGL2wRe7EuxEpTIKlN+zk=;
 b=IFX6hoXfbE94Bz2bDPdbbPyeayGfW3LjEzgJ+SfxiHpTysJGps2dx66/09RPrkyMXLNgbJxFu+PTNnidNXXwcq51qzRoR0D94kIifI5dLwmO3FN26MReqeuSDMYt2E/7e8WKcc+qePio31bkCiJYdQ9NMEZ+/XXKP2omX3gMP/9A3yZIJZBxhqUBkTc23hLHnTQsw6+xjGT257bI3bf1RynDA+CIaoepy7PFGRyrxw8K220OCWQpiZzgiSLViNvNNOu9VZccOR9bpm4g1MAlUGvxAY0iGB9IWF+6y5PpXCNn3nC15pLIVPgAtrh4YgYG6LFQn8P+g14QXLeY3QDgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NAmk9jgo9breKYwJ1rtQtHGL2wRe7EuxEpTIKlN+zk=;
 b=aNvXeLLf/Z3QmLtB1P++ydzlo0eUE5DK2+MOYzsCrG+VKGTch35inMHJaA34DySlHVBnq0mz+uwuEp1KsO04MLs8eIuq7uM6OpnFCOzcCQ5EMieAwjJ2Bnc9dYnb98BFpxPyb1fVZHyMWDrugj2pXtWtVAayv/CnlaldpHH+JZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 13:48:01 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 13:48:01 +0000
Message-ID: <e4bfdda1-5f40-483d-820f-4ac4574fbb90@amd.com>
Date: Fri, 18 Aug 2023 09:47:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix mode scaling (RMX_.*)
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230818131742.88763-1-hamza.mahfooz@amd.com>
 <CADnq5_PjGmULp42JLcOZy1r-_S0t+FTz5H1MTz55GFcDgJQobA@mail.gmail.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CADnq5_PjGmULp42JLcOZy1r-_S0t+FTz5H1MTz55GFcDgJQobA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0284.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::23) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0463ab-57d0-4cbe-85bb-08db9ff1bce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vc/pevD9g85pkwLryBVlAdU9UJ74GJlRB6n1GlRSW8Z3wpSNTD2I2q+B0V1kW01HKaqP+ABqd2vNepb1xn2kNEJ7KmhsZybp4WXG42+IfV+wPBw7Mq/8AduQZZNG4aseUGOZN1C2yWC7Ww/XkzuWf0sb7uGBzht5mKsCdl4sX5uIg503hTIM1uj5Q5sfdy8otGHIb5lT7ioMncSaQ8iXaWALXAM8xyu3WoEp9gPeXXM4sX+7zrSLkYRrEphpjUcq6yH9mO2tpiEqnGy1dRm1Y5Ya3Hkj3pjiZaCm9mW2W4xMU3xTyE+/RcsONM1n4f9Bfl/VOw3I+yNgts230rFB0NKPT17I/PWh+Jgrw1uJDalFGH86ViaKtmvBgkl6GtkGqUJ5s90IsLhY6AI4GE7qOy7awhP5AYdBC9RjOcdml74TWt1q0595Sxt+R2s0k9m8PH+qXHHFFH9cN3ZY6LdDU/MeCtuhLTQNjOVnlZPOvjqzhlQTE8LF01PFxZW1BW3dzymlb68/l31BD124HUBhARvWjeQ8i6yzclNTJZtuiqrjIIMAwHn68bWQeU6BhUersVDlfz2iUh2KjSAd00QIbHwhGV3WNZVZ4J/+YVqMMwOLaJqzBz3CcLu0FBpn4u1Gzd9r3PQznfENTVZOw+6d+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(83380400001)(966005)(66556008)(6916009)(66946007)(38100700002)(316002)(54906003)(66476007)(478600001)(44832011)(2906002)(41300700001)(8676002)(4326008)(5660300002)(8936002)(53546011)(2616005)(6512007)(6666004)(6506007)(6486002)(26005)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk0zR0RJQVJBQnlKcHBLa0ZHYm9KVzV1bXczaHhlVVBQUEVBKzlsOGI0eTBp?=
 =?utf-8?B?aERTWmg1TEJMNnR0cmh3bEtheU9zY1ltNTBPRHg5M3FlaCtHM2VvYzhIbjFj?=
 =?utf-8?B?V0RicVF0aDRHUkwwUWVqMUhDNGU0eFlyeUFMbFI0WmpURHZhT285dUZQRFV6?=
 =?utf-8?B?cTdmWmkxeSs3MHBpeGxGV3EvaVJ2aXBLV1dhUkl6NnU2KzhxT201ZC91Q3Bk?=
 =?utf-8?B?Z3hYT0xnUkYvMXBvV2dmQU1mZldmUG4wYTVHMHNQbjh1QXJzR3IxV1g5TXlv?=
 =?utf-8?B?U2NLdkUwdGlnUWl2NmlyaWJLYmtSdXJySHhkTzZWYmJDRmE2WHhPY01TVUo0?=
 =?utf-8?B?MERTajIrVXVYdGovQVlaV2N4U1lMY3lCRStPUlpMb3NWUEFkT1J0U29qdWFo?=
 =?utf-8?B?d2RMK3VWSldjb2lmcWV3dTgweVJuNm9GM2orYXBzalR3bkN6Uzc4MWJEVDA2?=
 =?utf-8?B?dzJtNWtzekUvUnBWSzZPL3h0bHlobkpjOUEzVi8rNGtJb213TEtVdjFSTlBO?=
 =?utf-8?B?RElhSDBnOTNJZ3hGZXBwc3BMeTF0NXV2anhnanQrdEFqU1NJL1FrSVhUczlH?=
 =?utf-8?B?cFFiZWpHOEpTTGFFT3p0T2doMW1QeXJod3lXL1hxOTdOSHpJTi9hL3FXVXpV?=
 =?utf-8?B?YWVSQlJyaXFxZFFRejhWZitFdlFQRjVFQlBUdnJLYndTZlZaSHpQazFjQmla?=
 =?utf-8?B?Y1F2TFdQMjFyc1pqM01hTS83ZUc3UlExK1lGakZMYVdwVlVvNnVZQjdJQzVB?=
 =?utf-8?B?d2NmaTZIbUlVRFpJdmlDY09wRlBqUGE2VGtCTm15cXRVRVdjVHNkNFIzZ3hl?=
 =?utf-8?B?S0JUOW5DaGRobHk2ZDZXdjh1aU5Nd251dlpXenNJSE5hYjNqcXNnS1o4MHpO?=
 =?utf-8?B?UlZibHR3RHlEdGVzY0RFamx1aENjc1diQlFFQmM1YnV6OHhzZDFreE5NZHR4?=
 =?utf-8?B?N1JRQkFWcjBWcFljdUdrWitxVURsMXM2bUdsYXhWcnlFVEoxSWdGdjFwR3Nk?=
 =?utf-8?B?OStFbFAzQU95TThRejVNTDZUTDBTanVUbnFJWDJnVzJvcTA4Q3lkZ1VTVURi?=
 =?utf-8?B?NWJXTC9hSU92Y2JubGlCb2NoT3JwRUxZQ2xIVzFaTndzcTlLcUxLR3Z5MHVL?=
 =?utf-8?B?b3BNRkFWWFFqV0dzMnRULzk1elNKSVpWV0c0aEVsUjBCWUQza09YUVVubXZX?=
 =?utf-8?B?TUpOREZoUHRzQlJCM1o3bm5CbGNhdWFFWE52dEt2OEcrczNxQ0JTeTcwMHFB?=
 =?utf-8?B?Z2xaeTJkMi9uQmVXSXkzRkxhSXJlNm92L0MvRnVYcmY1WnMwdW15NjM2UkhN?=
 =?utf-8?B?Sk9pY2E4MjlpaW1yWnVCSGZTM1ppVTBVemhjbTA3TSs2S3RTNjNFN3FzRXhi?=
 =?utf-8?B?Y2VzaUxvcTRLNDJKMnRhb016dXpjbVZEeDBIOFFLQlJCV3I0UWtadGt0UkFj?=
 =?utf-8?B?WXdhTzllSTNSSzRHZkVUSWNNZDVOa2dzMmtNN2x2RFY4enJrRDA4aXgyeG55?=
 =?utf-8?B?VER3L2RFay82dGs3Z3d6NTdoZVFaQjFWRnN5NTRKd0ZZTCtsVGxuMk41MTVz?=
 =?utf-8?B?WDNkK0w0MmVkNHZ1VjREVXRvWDkvczFMcHZSTGtzUkZ6RkVtQVdIMzVHbHhR?=
 =?utf-8?B?M0tWODhWeWtybytPbnovamVDaG9BKzZ6NFFXemRFc0QwZVdOWDdyVkZGVU9q?=
 =?utf-8?B?Tkd4VDBSbmlZSWxabWNaaWFYNFBwNndDcDZZZkFDQlBqdDk2bE5sTnhMOVdF?=
 =?utf-8?B?ckNMNHB2T1IwaFpkVUdDUkRNU2xjN2h3YUhtclhwT1BjVW1COGNXU3NEWWJs?=
 =?utf-8?B?eUJGY0hrc1BmN3dIMENoSmxWeEJSYVAycXlEbkVEdUJwSGxPcmdnV1dmSkRy?=
 =?utf-8?B?RjM1eWNRYWZKaEtiNHVYdzZGUVhvY2ptV1lmb21OWm1va3NuY1UvQ3FMZGw0?=
 =?utf-8?B?Q0lMV1N1UndLUENrbS93d2NmdGFoWnhjMWVHYkgrZFh3NEd6bVNtdFdmK3NI?=
 =?utf-8?B?Nk1oV2ZDYnR0NVpLR3c4bThqNEsyQVgwNWlJZlpib3dtdTN2d1pLUDFRcEsx?=
 =?utf-8?B?eDQzdjVJcDhtVkpwb2V2MjJnenEwZzZuVFFkajhHOHBjeVNGU042Q3BtVDR2?=
 =?utf-8?Q?gFzUsNTcwJV371zQHxqCSbWjt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0463ab-57d0-4cbe-85bb-08db9ff1bce7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 13:48:00.9807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wm5NIDqh3UjpcAMymn+VhCmpcyeCuq04sx7BviUP+fu+MK5sEr2bwcmY8iF3mbEGjxnvX0SKGS3xWfVY7O8D+Q==
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
Cc: Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/18/23 09:28, Alex Deucher wrote:
> On Fri, Aug 18, 2023 at 9:25 AM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>
>> As made mention of in commit 4a2df0d1f28e ("drm/amd/display: Fixed
>> non-native modes not lighting up"), we shouldn't call
>> drm_mode_set_crtcinfo() once the crtc timings have been decided. Since,
>> it can cause settings to be unintentionally overwritten. So, since
>> dm_state is never NULL now, we can use old_stream to determine if we
>> should call drm_mode_set_crtcinfo() because we only need to set the crtc
>> timing parameters for entirely new streams.
>>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
>> Fixes: 712237a4a1b4 ("drm/amd/display: Always set crtcinfo from create_stream_for_sink")
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> 
> Does this fix:
> https://gitlab.freedesktop.org/drm/amd/-/issues/2783
> If so, add a link tag for that.

The issue I'm addressing is specific to the colorspace patches (which
weren't ported to 6.4.y to my knowledge). So, that's probably unrelated.

> 
> Alex
> 
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 3b27b7742854..e9aff5014e39 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6035,7 +6035,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>>
>>          if (recalculate_timing)
>>                  drm_mode_set_crtcinfo(&saved_mode, 0);
>> -       else
>> +       else if (!old_stream)
>>                  drm_mode_set_crtcinfo(&mode, 0);
>>
>>          /*
>> --
>> 2.41.0
>>
-- 
Hamza

