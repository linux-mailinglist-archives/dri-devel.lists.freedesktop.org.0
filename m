Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6F5EF91D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 17:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD5F10E60E;
	Thu, 29 Sep 2022 15:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351CA10E605;
 Thu, 29 Sep 2022 15:36:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iagBf/QlSncgaJf9mynGHziiDJioDfT9ZQBhIl+9I65LhsqP9Ktsn2aFBiB7Y0/3sPp1+WzXeDmhwy6c7VJbtUY7Bu6F/T6d918sz8kvWkaMdVnxoP/bTrqWJP0/8xHCpv1yrCVp/4ifme+NsHshrdQ27Fyj7DgVA7f+3x9O146/ciVIL6RKw/gTnqqP69Ao1BQUifixv6cbqv63KOm/xbDY8q61t1QBNi8JThm/AF0MlgJVp+O8oj138PS8y6r2mp4F0ku5EttPT0IyqOaF9REuu8TwM5u6Zz9Clk35fx8688WWLsk2b3Ezy64aQtlD9KS9dh4iFIf69MiRuYG36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXFoZX88IwGLUDd4tLsrnL+xC/zHVOHDTLSyxHBYdVg=;
 b=ambIBqNRCr+T7aUvBmG7YniUmHKlEXI0wnC+3kYz7mgK6VnHuTleyIQZwM772yMtqzjUfYkVI2jUW7p6Hnndiv15jQb2+JX4yzzXeXEsrNm2mU3iJgodL5P5Np7mPtJn8J2z0nbGtdz+DqIQ9ScACEUP5lgJ+++c/Tl/18njE8MMmmN+h3ix8HsqBO85CH5Qg3WyAhYXmBAlblSgv20TKtfjwJBx09Nhrsh+Z9HWw5oafkntkgR9i13REm8Jav8tCgIaLAy0Fgj4L3evzEIUYA6kQN6snRewMHifLMPQqkpBJL6ij/Q9jx8gXEvCro71Xe1upR49e8n9dCiudSK+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXFoZX88IwGLUDd4tLsrnL+xC/zHVOHDTLSyxHBYdVg=;
 b=EXuuQgB5wEs1e/Rx3PEyH23kHI5LdMfyGz955kJVUB1CCUCLow77KNPhIFLIqcsm/C6SoDpM4k4RJQjO8Qhhujz797Q3qV2CSBKlN+KxpOvdgm14Ret+jb9js1wLvkP1rJ5vK8iMndfdOBelqac4bBXIU7/1gfWsaZUbpL/6iss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 15:36:29 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 15:36:29 +0000
Message-ID: <13763d3b-bf7f-aaff-3bcd-60e69df86820@amd.com>
Date: Thu, 29 Sep 2022 11:36:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
Content-Language: en-US
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220927191200.216488-1-hamza.mahfooz@amd.com>
 <CH0PR12MB5284EAC9E9D095B2624631228B559@CH0PR12MB5284.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <CH0PR12MB5284EAC9E9D095B2624631228B559@CH0PR12MB5284.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::6) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: fb83329c-b0d1-4984-cb10-08daa2306092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: whtSRxZnqhh6Bv4sZ7ohdN0/c8Vj0PzQmHtFWQagyjVKKrhF1y3KuAIDJx3XQxpDoJczja3DcLHCwAd5rpI12KxrMDxnccQOPjczKBcFgOiH/OhpaASoj7GhCJ6DSKPuwfZsxVaw5JuTIYGCvrEV9ASCuBBYuIIJ4f4p0Nbklhq0SZCMzdJWXK4TncLGibKi+z55r0eyW4LfOwSlTqAUZcnGyF+beJAEraj3520rbkdI3TViJQyO2D8n2n8c8FgzTI0aF2unfVbS/yf/u7CIr3HwiLyzuTvdxfhSqOjWubvc0xWDBaKRWnWEM41l8QzI7R66tLCcC2aQfc2gMkwHRk4/N48l3caRIGQeTNWxtXH5gkOcRJ5H6KMtQ1xnRsb4Phr4iRzQm/qnOoS+Zvj4o5/zvOnKjuaUVgxy54YjBLmjj5gQh+5r5+ByOIexgYL2TT29PlzW6u47IG3dtw7+9h4X/0qsWtCZcD3Mbxp9+vaMyOXlJ9KiMXDQnh0beiAN1ws96/4ivt+ZkNQ78ODk1CO4zGfyT0M1YSqyqQU4GEA45RAvi0TQQ09QH4JpbO9ddIudWX7h6Oh2iCYgjE84uJKRqFw0q6LFgFIWobL3mkmqOZ9C/KEkdSvKYXovJ0eBpQJIGYQxXB+Cybl10qcsDMXlrWSrBLL8qgEdCC7dCeftrWflwkCX7xdH5AghGwI17NNerjDv1vTTZGPaF9A40JmWHaHZ+wL1LGIrR9qns7iP1EYnmrKSw0Bd5J6lIcXsPY9cEzIrav6usflVYG5vXz8uxReTSETOiDz4pgRMGJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199015)(86362001)(31696002)(36756003)(38100700002)(316002)(110136005)(4326008)(8676002)(54906003)(44832011)(66946007)(5660300002)(2906002)(8936002)(66476007)(41300700001)(66556008)(186003)(83380400001)(6666004)(478600001)(2616005)(6506007)(6486002)(26005)(6512007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnNMZVEzOTJUa0luVGdJQlVFcXE0bmEvNnVwNTJnU2VpcHBoQWJ4QnhVMmps?=
 =?utf-8?B?ZmViWUVoK0Q2SnlCUml1YWJyVlpWL3pqQ2xBOVdNZC80SVo5aUYyanpsT2Ra?=
 =?utf-8?B?RFVZcmtzV2FVZGpqYnQxeDRKVlpSUE44b2JYc2RwUFJpQ3ZjMHFQek1odTgw?=
 =?utf-8?B?K2tUdm8zek40bDdvVklnWTV0djJrdkpXNUVJZXBJdlJOTkFibU9reHJRTFhD?=
 =?utf-8?B?V0JkYkV4VFpOQnNNRzdFazR4MG56cmNCWG83VitWaVpucWtpUU45TGp6eUIw?=
 =?utf-8?B?L21KNXJrWm1BVHpVOEJjdndXemJmODU1SEVvNTZRQ3d5WWV2dXd6UERQN3RB?=
 =?utf-8?B?RURyTUNDbEN0ZUVFaWwzSkU3YlpNeGJKRGRvM1lqbmgxWE5nNVNJeDNOZmJk?=
 =?utf-8?B?ZzFRME9iamtnTTRNU29xMmsxOVEvZ24wNVBsYll4Qkk4WlkyVE9aVUVDM2V6?=
 =?utf-8?B?RFJnbTlXb2RVVTFEcTduUkhjU1hLRWh1VzBGTHNCNEY2RzM2MFdpZlB2TjRB?=
 =?utf-8?B?ZmlOaStvMkg4K29XQk1RRHUwdDdBZ3dMOGV5RmtMREdXczlESElSYUZnK1NF?=
 =?utf-8?B?NDhvaXB4UHZLL1p3cFdteVNqeUtLZjMwUlFLOXZSNVFMa2NQNkJSanlWT0VL?=
 =?utf-8?B?NVZ5ZE0xR0JPRis0NkpOQ1lVNXJqQWFEMnRZNUg1MjA1U2wyTVBMekNVOG9z?=
 =?utf-8?B?UlR5N0VDdGpoNVM3V3RmUUFQNjA4eTBsSzBZSnJCbXVsdFBBOXhPaFlpSjRr?=
 =?utf-8?B?R3ArTkpuR2RqR1ZFTW50dExKYi9mZDZVL012Q3kvREZDL2I0ZC9yRHBXNEFq?=
 =?utf-8?B?QjNvMiszd0JWQUdDaGlIaUt4ZUtQQTM5dFpSSjFtQ0Q1bllWdWVlWlkxLzls?=
 =?utf-8?B?dThhRWswbXdXNm5kWGxCKzRPQ3ZzcFdROUVyQ0lsYTlpTHhTekF4VlRFMGNC?=
 =?utf-8?B?TGpZSElxWXNQWEVhZkIxQ3RZb21IOXRtMWJoeVdBakk2OGNsR2xmWVdvdmxF?=
 =?utf-8?B?UGtjektTUXhKNk80Sk90NmJDVTJKRnNmcWVnLzQyS1VsWXZzVkNHWWF3MEJC?=
 =?utf-8?B?Ty9Md1d2UGtmV1FiVlliOWZud2VBcWRpbldDSGREVWlJS1F0dEhlVy9UZDBh?=
 =?utf-8?B?djJTdHhNdTllRjBsdGUrdE03TmZrWVNkZnZsY1N5SFRlUmxDZEpabnlTT0JE?=
 =?utf-8?B?eld2V0JPdUVUVjhzUzBVcWljbEl3Z3Z4cGo4a2ZhM0dFK2xsNWpiVHEvTVRq?=
 =?utf-8?B?S2k2RGswaWVEd3FjNy9HRmdUMzNtYzRMTDU5bWtLM1dtY2ZhYTEwN3QxUm5M?=
 =?utf-8?B?Z01pYiswc0t3NTJTa1lOUVNRRU0zaXVRT3pJNDY5K0NiZjA0aVpOak4xbnlS?=
 =?utf-8?B?WG5BSnl5M0tTUENwUXNnYW1iMDNPNW5oK3U5MkpXS1BQQ2NUM0ZqK08rWVVx?=
 =?utf-8?B?VlRDQm15OXd5c0c2a0ViWkVMRTVFMERZMTlWSnpHcEFDcnJpdEZSSzVvMFFB?=
 =?utf-8?B?UVg2Q2wrbitwWGNldzlBWU5jbnExVFhVallEcEpMRXNjbkVoczc2dUY3VVFR?=
 =?utf-8?B?d1Y3NlgyYnhyZlNUUmJmMmpWdTkvZnFSNUJBeWRwNi85MEx4RVNIWWpJOGZp?=
 =?utf-8?B?U2JUNEx3bzBiMGhxM2RJOGNPYWtOZVU0Q1IxMGJLTThwMWlNNVBYeitkVDNM?=
 =?utf-8?B?bjIxK1B0QWFHSEwwc3lTR2lhTHpmREYwRzdEdGpwRU9nTWEwWnMyeE9JcXk2?=
 =?utf-8?B?UEFYbEY1VzJpOEdIMTRqaGUzSmdJcjB0dWJ2K1JMa2Q5c2JPaHpNUXJBZUp5?=
 =?utf-8?B?TXpmcGpuL0dEdHJ5ZkxjVTREZnp4TFBRWGNtUENKMENTVkhFUjBEWGViVjQ2?=
 =?utf-8?B?TUFQVnF6MUpvb1piSllqQUJSKzJMdkdrUitKUDZnbEQvbTV5ZGY2VnJJbFJq?=
 =?utf-8?B?TkNkOFVScHNJWSthb2lmV1RNM1dwWmVZa0JuT2YvYWwwWG9wcGRXdUxFcVR5?=
 =?utf-8?B?U0JwbWFDYXkydVFsb2FUaXdnWFZvRFlLQ0RXUVlDWnBSTEs3VURRV1NVOXlu?=
 =?utf-8?B?VldEUnVIYXdBTTlUKzFUN1BPNCtzQ3Iwdml6NzFTSUhhbVNCWDNnWXVQeWEw?=
 =?utf-8?Q?IcLzAdmR9XCuyyB7BtPj+UsO3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb83329c-b0d1-4984-cb10-08daa2306092
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 15:36:29.1052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4rPpUDsM9000wVG8cMYut8bcQhqE8ORCv1sechJYldZBONRj4Gs+1heRp5fCLRqUyNKSTM7/aiIT14RcgKhGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
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

I'm still seeing a warning even with this fix:

/home/fkuehlin/compute/kernel/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ?dc_stream_remove_writeback?:
/home/fkuehlin/compute/kernel/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: warning: array subscript 1 is above array bounds of ?struct dc_writeback_info[1]? [-Warray-bounds]
   527 |     stream->writeback_info[j] = stream->writeback_info[i];
       |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~

Regards,
   Felix


Am 2022-09-27 um 16:35 schrieb Pillai, Aurabindo:
>
> [AMD Official Use Only - General]
>
>
> [AMD Official Use Only - General]
>
>
> Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>
> --
>
> Regards,
> Jay
> ------------------------------------------------------------------------
> *From:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
> *Sent:* Tuesday, September 27, 2022 3:12 PM
> *To:* linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> *Cc:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>; Wentland, Harry 
> <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; 
> Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexander 
> <Alexander.Deucher@amd.com>; Koenig, Christian 
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David 
> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Lee, Alvin 
> <Alvin.Lee2@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Kotarac, Pavle 
> <Pavle.Kotarac@amd.com>; Wang, Chao-kai (Stylon) 
> <Stylon.Wang@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; 
> Ma, Leo <Hanghong.Ma@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>; Po-Yu 
> Hsieh Paul <Paul.Hsieh@amd.com>; Jimmy Kizito <Jimmy.Kizito@amd.com>; 
> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; 
> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
> *Subject:* [PATCH] drm/amd/display: fix array-bounds error in 
> dc_stream_remove_writeback()
> Address the following error:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 
> ‘dc_stream_remove_writeback’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: 
> error: array subscript [0, 0] is outside array bounds of ‘struct 
> dc_writeback_info[1]’ [-Werror=array-bounds]
>   527 | stream->writeback_info[j] = stream->writeback_info[i];
>       | ~~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from 
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
>                  from 
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
>                  from 
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
>                  from 
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: 
> while referencing ‘writeback_info’
>   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
>       |
>
> Currently, we aren't checking to see if j remains within
> writeback_info[]'s bounds. So, add a check to make sure that we aren't
> overflowing the buffer.
>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c 
> b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index 3ca1592ce7ac..ae13887756bf 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -520,7 +520,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
>          }
>
>          /* remove writeback info for disabled writeback pipes from 
> stream */
> -       for (i = 0, j = 0; i < stream->num_wb_info; i++) {
> +       for (i = 0, j = 0; i < stream->num_wb_info && j < 
> MAX_DWB_PIPES; i++) {
>                  if (stream->writeback_info[i].wb_enabled) {
>                          if (i != j)
>                                  /* trim the array */
> -- 
> 2.37.2
>
