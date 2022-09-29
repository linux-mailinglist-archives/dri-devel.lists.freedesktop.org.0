Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 910BD5EF9B2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E85E10EABE;
	Thu, 29 Sep 2022 16:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE1310EABC;
 Thu, 29 Sep 2022 16:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JspdDyTCTd1u3dxqvBKIBvCKhvXOAGctgdaaed3JTsq52Qs3FqYxSjJ7CBz5LGuPItOT9i4g7AmDawZxQ3FRRUhPI73NkuFyzqi4B8VhNmA2djdOK3q5f+kqmTtY8h0eMLyFIW3XRCCRI33qlFCfBwMK46L7z2VNTgIV4bM2xyEWam/DYg8icNmj990qXTHAwJOqd7a30RZYgB5XaTMDJSqJVqiNVTUwi4nJvK6qd+KpttxkJyB0d/Bi2ehHV2RFhEss9S9O/VOE3Oeqidhx1P7L7Vh4YVVYQhw9e6lnKgLpFXSO5J8Nunbor8BdGT2617uLjDtmoxxFf9ellNJgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YDOHE2pplnwJc9C9ifTHAumBxiLW9Q7yxuiL5O9OKE=;
 b=KArXbkero7baCBHTwnb2//do1J9GDYdm/M/mJibUQLSU3BVl4RPItvjp976A+95TBM06KWrtBGCDeKpSTsYyL+hgwD6yBC397v7IaHBvtIU8/p2VXHkfuVlghpeoc5KYjz6lDEWrvH0wKayY26B78mLzdaMV8QxUO73J3NL6EKIjfJf1/P33qEVcQPKAx/Kwm2zaTtpWT+FTj9enr3lZY3RU7uDOtrP1euGhYRRO8fa0vLTzaDfS3GQHml3sIA/RShBe3FepF6gN2bJaR5yl4OfZYtcpWmic/PLaHxmn2Y9qptKLRV8tUS+qz9EbZv1kIX1yx1UMc/mJStCjyGTJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YDOHE2pplnwJc9C9ifTHAumBxiLW9Q7yxuiL5O9OKE=;
 b=bIuggwBWdsvYviep4CVhKGYidd6M9sjtBAYBocvQF26h1o8BAC/0W7DS+xDLyt8fJ0IBmIUH1E6tgQoq3f4OvEPujL3PztVjMzc4pEEWD3k7aQ9IIQt6301PG2Hy8IqDo9iosQ2QRemDl35vSMMAuwPGAOfBh56fQBeKE7hf5sE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ0PR12MB6712.namprd12.prod.outlook.com (2603:10b6:a03:44e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 16:05:28 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 16:05:28 +0000
Message-ID: <36ad5d1c-b841-03bb-14cf-0b459df47749@amd.com>
Date: Thu, 29 Sep 2022 12:05:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>,
 "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220927191200.216488-1-hamza.mahfooz@amd.com>
 <CH0PR12MB5284EAC9E9D095B2624631228B559@CH0PR12MB5284.namprd12.prod.outlook.com>
 <13763d3b-bf7f-aaff-3bcd-60e69df86820@amd.com>
 <4b21a150-a567-dafa-1a55-8496cdb0cec6@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <4b21a150-a567-dafa-1a55-8496cdb0cec6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::16) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ0PR12MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 737560d7-3d2f-4e87-904d-08daa2346d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2NBje1gVrQnKNKxUINSZxtkBTuaIB855zZFWn4PvFV9Jk5aH1i70Abz3Lfm6AJsMkQYsjAp4SQkZkKNqEszg1IArgPtNVK5jSc8DhN0pYpFNzyvXCNQDiN7+yQW6aRDTJFLtVj17GYmffJ+KggkvnzfKRue1NemexxcRGpHES4+y6vJISCG0aZKnVaBzfr2yCWRXQKsiR3tSOlwu//1pzT8fpzJGvSs7yd/cKmwpI+mwb8OAL43VnNAoNge72rS2atYfBme02267F22pdLRAnLJYY9mirpZCxmXwWoKK/JTt3oPxjdjIz3C6At9j6B93ps34ba/2FmGG4kjXZljnnuKlW9sX5KzNNvZClOzFDeHAi2a/+0Kq6d3r+m55rHk0VEByaWg/zchgdfUNMbiGZcEn67tJ2yVdRyGsZ/2360poVD79bTncX4tw6WpT4ofiuaskdewtcLP8oNF9s14f7UIsSt+FXqZvgmL1XW0S78ulb66PKJqFTcFD9Tc/NVTji2SaW5r8bpV5OyPURqviasGtu2mgkDA7P6exU9HGUV2vnH+xfKZFXoAXUZH5+P6F0YdzsCjN5DDXDnwRKPZIVCEvuCy+jD/fNh7gI41eRvTW1Fu3uWsvloh712e3fZtyaspdho2aZ1xAxFdUMtaeLTfySsfewVGx2fBbWJ6bU1VjcNJQbp3Gb+ymYyrhuFhkeMny+VZDEEEz9xahF9G2bE3vlf/aKslJmkr3ma70zePcP9VHkz2bgMFOc5pALln5ZCLgg72BO5oTOEuqON+Ptz7r6ufXJI9jEMT1JqYsxRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199015)(6486002)(478600001)(44832011)(5660300002)(2616005)(31696002)(6512007)(316002)(8936002)(6506007)(86362001)(66476007)(36756003)(186003)(26005)(110136005)(53546011)(54906003)(66946007)(38100700002)(4326008)(31686004)(8676002)(2906002)(66556008)(41300700001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2xnZTNOMFBEc3U2d1p2OXpJNWc1cGpyY3N2WEgwSDJSM3ZldnRTNDBBWlQ1?=
 =?utf-8?B?OVdWajUyb2s4Q1BrbUZUR3BydHdQTGQzVUZOOGgwUWJvd2R5NFFtL1hxTXBz?=
 =?utf-8?B?bDJJTnVZczc5TVhkVEpJTjFwcVYzQXlQZ0MxbTFiSCt2eWQzSUlRWEpRVDRp?=
 =?utf-8?B?b2FWdzVRZVQxTEdwaEZzQ2h4M29uUVRDQ1pSbmhYMlo3Z2dzWTBOdFVzTDcr?=
 =?utf-8?B?c0N5WUZJZjI3enVzZWtuYjVGb0dVSk92cmFxeU9WRXVVMGk1aERZOGRYUFhJ?=
 =?utf-8?B?YUNadFBpOStYRlFWSDNrTWU5YU1kaEgveUlPSC9HWW5NZE1JdHhxaGJ5SG04?=
 =?utf-8?B?MFVQVDdyUXk2ZjVJcUhwM1l6bTlKeno0M2ZDdytmV1ZaVXVSNkpJTWRkZis1?=
 =?utf-8?B?VG10OHlNeFl6WnlQNG5kZ2ZudnhMUHIxdlFiQmRwMWJlTXFwVDFyaGEvWE5O?=
 =?utf-8?B?Mmg3dVBRakxwNWJyb3VoQ2pQMHA0OUdQVWNjS3A5NTdPMzNKem16d0szdVdr?=
 =?utf-8?B?bkFsVTJPaUoxNWkyeTl0VEE0YUJ4Tk0yOUxrZ1Vha0hhWXlNQTQ2VDg4M3lm?=
 =?utf-8?B?N0NHSjNqRzk2U3lqYnpTMmhXcFpXM1NCWlRnRjI2SUJGNHB3Nnh6SUE1S293?=
 =?utf-8?B?RnhSMzR6MzFpTGJkLzNQTFE4cHhyZ1pNbXNRWTliRVNEZlVTaWk1WkZlOHdW?=
 =?utf-8?B?Vmk0OGhUeVREYXJiMjZFWk1DTDJabzZURWYzbm0xUnpjWGVPMHNVRHUxL0wr?=
 =?utf-8?B?S3hzQkJGd0poK0VzWGJYUENFM1NjQkdORVc5RVRjdCtSYzdIbS9HbVhiTmlS?=
 =?utf-8?B?TFpFbVExbmNvZnR3SE1GRWEvbXhySmprRkUyR2NCV1FXN3NGZzJRRnVlYkZ4?=
 =?utf-8?B?ZTdTbEl0cm5xaURySmdJQlczOE45c3EvenFQVURqbnVqT1ZiOC9XTDk1SDNp?=
 =?utf-8?B?ZTZkWUQzMEtlQ2xUVm42dGhGY0pvTWVwRmFpOWJBdEVVL1lNRTZ3WkVkL0ZE?=
 =?utf-8?B?WE5PdngvVW9HcXBYRkJNYmIrTmNBMnJmSHE3Ny9GSEMzOVZhaWZVV3ZlbEQv?=
 =?utf-8?B?NEZvNS9zZjQ4Tmg3L2lZcGFWRVI3akYzalYwQ0czYmJwSTJhWnVGcER0c2pG?=
 =?utf-8?B?RnlhazgyZFpQd2VGVDJMOVdUK2dpSExDV2VLc2NadW9leisyNy9EbmNEM2tE?=
 =?utf-8?B?WHYzQzBCNFl3amtDQUpiWEc3L0V1aDBlTU03cXhwd2xkeEIycE0wUWZyMW50?=
 =?utf-8?B?ekF0TDZqTlovMXk4ZHNBbklSSkU4aXBPUWliTkgxSlc5Mld6NjladHdaUGxm?=
 =?utf-8?B?WWpTZE9KOUc0c3Vmbmk3UWU3Rm9vQ2xiQkpJWU5sODdXVm03Y01MRDJha0Q3?=
 =?utf-8?B?UzlmWFpFMVI4UDNuNFNXdFJQZEMramZiajNqOCtFZkp6L2ZXbG03SjBKOXRq?=
 =?utf-8?B?WTJNeEhad2hjcU9WZGNGYmhYNVZTUmd0clYyaGIyUmplcW5SMmhFdm4zUzZj?=
 =?utf-8?B?REppSVNSa0VBcGR1REVNazhmcW0xYWszaWl0MkxHOWh4VktIdGFaQ0hPaCtM?=
 =?utf-8?B?V1czV2J1NnJ1S2RGZUM3cHZ6WWNrZFdHU3FaQVhVTERLazJId3ViRXdEcHdK?=
 =?utf-8?B?di9BdlB3K0dxSlNwOWRIV0FXQ3RjV2NHVUhwRHFsYlpuMFdoOHd6QlYzVDky?=
 =?utf-8?B?ZkJyKzN5UWhrZTc1dzQ5RDVkY2t6ditSNHVJZ0w0TVM0MkpCSE9EWmZDQ1VG?=
 =?utf-8?B?SUw3MnQ5a2NaRU5obVpFb0xiM2RVeDRLWldMYW1XYlRCaEFQYU1UdDdUTHUx?=
 =?utf-8?B?UG5vWlUzR2dpM1FqN1RBV3RacDMzb3A0a3ZCRHZCUGZZT0wvZDdwYVlMNUdu?=
 =?utf-8?B?RUJycXNXLzdQdUpDQ0VKWktuREtYeEJvaytscDRrTzMzR0V2Znh5V3NBRjZJ?=
 =?utf-8?B?djF0MHQvdW9jendUZitUS04zRjBaRDFLTktwaVVzSDR3OEloMVNMR2w4Rk9w?=
 =?utf-8?B?YWluL2x3bVJ4WGtZd2lNaUU3Q0Q3SlB4RHdoSTJDTm9QRWp6MVNVK1N5ZDIr?=
 =?utf-8?B?RXpJd2pLcEJLTWxhWjRpNVNieXd3Nk1HVTRhbHdRREVzK3lLNFVZWEI1VVIy?=
 =?utf-8?Q?/u1NzQei9Djgb427HjQhd9tke?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737560d7-3d2f-4e87-904d-08daa2346d67
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 16:05:28.5737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7cDBwrrx0IB4mPTZilFv0JJmYWh8qAXjRg0XCzVLD9ZZV0qOmxkcR40sMVcetxfvhzRlJOnnwFdLudUIZlqow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6712
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
Cc: "Wang, Chao-kai \(Stylon\)" <Stylon.Wang@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, David Airlie <airlied@linux.ie>, "Hung,
 Alex" <Alex.Hung@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Kotarac,
 Pavle" <Pavle.Kotarac@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 Po-Yu Hsieh Paul <Paul.Hsieh@amd.com>, Jimmy Kizito <Jimmy.Kizito@amd.com>,
 "Ma, Leo" <Hanghong.Ma@amd.com>, "Lee, Alvin" <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-09-29 um 11:41 schrieb Hamza Mahfooz:
>
>
> On 2022-09-29 11:36, Felix Kuehling wrote:
>> I'm still seeing a warning even with this fix:
>>
>> /home/fkuehlin/compute/kernel/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: 
>> In function ?dc_stream_remove_writeback?:
>> /home/fkuehlin/compute/kernel/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: 
>> warning: array subscript 1 is above array bounds of ?struct 
>> dc_writeback_info[1]? [-Warray-bounds]
>>    527 |     stream->writeback_info[j] = stream->writeback_info[i];
>>        | ~~~~~~~~~~~~~~~~~~~~~~^~~
>>
>
> What version of GCC are you using? I don't see it on GCC 12.2 with 
> this patch applied.

gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

Regards,
   Felix


>
>> Regards,
>>    Felix
>>
>>
>> Am 2022-09-27 um 16:35 schrieb Pillai, Aurabindo:
>>>
>>> [AMD Official Use Only - General]
>>>
>>>
>>> [AMD Official Use Only - General]
>>>
>>>
>>> Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>>>
>>> -- 
>>>
>>> Regards,
>>> Jay
>>> ------------------------------------------------------------------------ 
>>>
>>> *From:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
>>> *Sent:* Tuesday, September 27, 2022 3:12 PM
>>> *To:* linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
>>> *Cc:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>; Wentland, Harry 
>>> <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; 
>>> Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexander 
>>> <Alexander.Deucher@amd.com>; Koenig, Christian 
>>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David 
>>> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Lee, 
>>> Alvin <Alvin.Lee2@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Kotarac, 
>>> Pavle <Pavle.Kotarac@amd.com>; Wang, Chao-kai (Stylon) 
>>> <Stylon.Wang@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; 
>>> Ma, Leo <Hanghong.Ma@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>; 
>>> Po-Yu Hsieh Paul <Paul.Hsieh@amd.com>; Jimmy Kizito 
>>> <Jimmy.Kizito@amd.com>; amd-gfx@lists.freedesktop.org 
>>> <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org 
>>> <dri-devel@lists.freedesktop.org>
>>> *Subject:* [PATCH] drm/amd/display: fix array-bounds error in 
>>> dc_stream_remove_writeback()
>>> Address the following error:
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In 
>>> function ‘dc_stream_remove_writeback’:
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: 
>>> error: array subscript [0, 0] is outside array bounds of ‘struct 
>>> dc_writeback_info[1]’ [-Werror=array-bounds]
>>>   527 | stream->writeback_info[j] = stream->writeback_info[i];
>>>       | ~~~~~~~~~~~~~~~~~~~~~~^~~
>>> In file included from 
>>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
>>>                  from 
>>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
>>>                  from 
>>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
>>>                  from 
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
>>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: 
>>> while referencing ‘writeback_info’
>>>   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
>>>       |
>>>
>>> Currently, we aren't checking to see if j remains within
>>> writeback_info[]'s bounds. So, add a check to make sure that we aren't
>>> overflowing the buffer.
>>>
>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>> ---
>>>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c 
>>> b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>>> index 3ca1592ce7ac..ae13887756bf 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>>> @@ -520,7 +520,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
>>>          }
>>>
>>>          /* remove writeback info for disabled writeback pipes from 
>>> stream */
>>> -       for (i = 0, j = 0; i < stream->num_wb_info; i++) {
>>> +       for (i = 0, j = 0; i < stream->num_wb_info && j < 
>>> MAX_DWB_PIPES; i++) {
>>>                  if (stream->writeback_info[i].wb_enabled) {
>>>                          if (i != j)
>>>                                  /* trim the array */
>>> -- 
>>> 2.37.2
>>>
>
