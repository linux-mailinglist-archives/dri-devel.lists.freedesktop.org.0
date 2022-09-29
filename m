Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8415EF944
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 17:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B1C10EAB6;
	Thu, 29 Sep 2022 15:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E295A10EAB5;
 Thu, 29 Sep 2022 15:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjHI3wPArXLsnDQzG1llbOvfKpkx+IpsPK0XyvpCB7W5ZvIpKGncBQgABPIKM5hXMIKlbDy8JTbK2vvY7Ra5VX0SpZHBpYmvtTS6o5Wf5TfFxpd+nov2HkQw3AcIbt8ZO+E1EnkuEMfsv4f6NJWC/nuc8RjNxfFv5jZ2vN5amB3FCxmtGr1QYgiMZ3DmUFVr5I9ee0M0cngSWg7mmhtR1E7Xs1iG23u4OBWstAPYswPe08swHT8/LSkA1anOInfFEXhmTDFRXskc6m4O8iFTlDraS3g4zdspjToemNrLo6u4qJWpftp859dKP7AXwhI45SVAVFp8WYbXOKqhklY5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khTbcs/bgvE176u6a6oh8sPHyEbpz+7cKc2BcUjOxg8=;
 b=W4j7exyO3a3JwwstmI7pkWvtosUycgAWHnKp5wm5ciVEQMRTbFfk3qY13/X4FJzSStrMZuEZ0ZtcGYpeFPTS6Xk/neYM5iKrdf6b36dH52NqZcW6gJ2IEQmKGb13g6jt0UGxkEjgJ1RsWB3pVr0gVRCs+MsrAU0LlK2qV6Psfc17BW1tX/4Zmrg0fsdoMHOeI6UyKb38XWTMWu8Qw3zpum0kyjqjm6I4HCd9iEdtXQgAptcUv7sP5/INotURA4V5oH2o2ZXrC7JQiK/2p588Lo8GF97oQynjmtugT7jyF0i7VlCaHy2it8yBdjrajQDi+Fs3mSNqt/0/8XUC+UNMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khTbcs/bgvE176u6a6oh8sPHyEbpz+7cKc2BcUjOxg8=;
 b=Ifqk1SgGZxnZVS+vUcLtzYrGWRRDifMu/pdV55ZcMdJrjpXLhyk42rFjuc5Ua4PXc4++TriRpHqIXvBGvnOBjWffW7HvCe1KJsuCjlpqHnXAidSgt7oOWU7/YyWabRPtMEJrX/8QZg1cvqqCjoKDPxA/OHza7F6hss6u4VtahnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.18; Thu, 29 Sep 2022 15:41:37 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8423:8031:a9f3:20d5]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8423:8031:a9f3:20d5%8]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 15:41:37 +0000
Message-ID: <4b21a150-a567-dafa-1a55-8496cdb0cec6@amd.com>
Date: Thu, 29 Sep 2022 11:41:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
To: Felix Kuehling <felix.kuehling@amd.com>,
 "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220927191200.216488-1-hamza.mahfooz@amd.com>
 <CH0PR12MB5284EAC9E9D095B2624631228B559@CH0PR12MB5284.namprd12.prod.outlook.com>
 <13763d3b-bf7f-aaff-3bcd-60e69df86820@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <13763d3b-bf7f-aaff-3bcd-60e69df86820@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:610:52::20) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH2PR12MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: 0482b3d7-45a6-4c34-a30f-08daa2311852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyyiPUyIL7BTC8U21ANbsw13NDRZQe4v4pqLCi16uL5TlQ7834kh720++PZMoe21CYmYwjGmIHWKSOBDSpGKLzHUoPo2Wh/oF42QyQxQM56cdj5B2EdP5vR/CMvvxL8j0dURY9iMtoE77dK9qMW15l5CQ9YK0kVpNj1UHiNBP1byuMwkDcfjbJyqJcLF1T8b0CDfM+Vz9P/wluyZXG9mNEJDt1motHPv+5vbYGJrXh7gtJGgpastPPD6xO6rDmjonrYT/SSyvMT+0cWtcQhZgLnoD1H4DOTmdfQhxK3AXnlVggShnb926WS8gXvro4rECPIZ1+h0gHng6KwospwgV+TmCZINCaUHaoUf/Zl2cfXHx6j62RseNRdDi53udRm0NefDmdf3hcaRJHF2w0PGucHDExZPipcpIQK3zPVAI0Nk6ID7IqlbX3efWUrqv3R+kFdA0u2j8t/qRWt0nnayHCClfFffXLE4TkChFwztEp7Moc5xamDbJqcxa0gcGNgcy9bn9tOUUa8eNysVt7tPH4W8F2QTYeFEXJXQkN2BFfq9ye+QpzFWOhu6lUFmkuAtU2k7e37kqOcVOewpVvDXZ+Gb8m75Z5pY+8HGpaGv3h0aJPjstLH+denRwwmjEiRf6/Pza7jNQ+KTzClhHfn4WZeXzUEQ9BcaAmkAHGfMkDnJeXJLjjTXPgKYC+rdxSZ86lFjvCrqLN6wIe5+xQUEdcyo3YbaKCh0PLCA+rs6Cs9oVsHDK5dHEDccLUYKcr/zLNSb2xQuS2+kQi5esEE4/rV9LIC1j6SnjNKfix2DpOA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199015)(31696002)(38100700002)(86362001)(36756003)(66556008)(2906002)(186003)(44832011)(5660300002)(2616005)(6666004)(6506007)(26005)(6512007)(478600001)(53546011)(83380400001)(8676002)(4326008)(66476007)(66946007)(31686004)(54906003)(316002)(110136005)(8936002)(6486002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzduK2dUZkFROUNaRzNFZEtqN1pGajk4UXBEQWNzUm50QWVvMHpxTk94bXdL?=
 =?utf-8?B?S3piMEJZTTN4MTdabG5PSlVMQmZsbmcxTnBsU0M0S2YyTUhxaWhKZWw0aE51?=
 =?utf-8?B?RDNDbVFsQURmSUkyci8vNmFjdTR4NnhaTUk3VERSOU9SazRxRWx2VVhiUGEr?=
 =?utf-8?B?UFZsc051ZWdQSnRCT3dycWZOUkR1eUFiUVFxSlJXWTRmWVpPRE90VmUyNm1J?=
 =?utf-8?B?V1lNaU1PYVNTbU9hWEo5eHFSUkdXRHRGU2VUWUE3WHdYUzZiUGpnalZFRUFY?=
 =?utf-8?B?UHd0anpuUEtNWEhmWkZLeVZOVVZzSlZYNmptcTlYei9mZVI0Y1I2dlBnZ2pQ?=
 =?utf-8?B?cHd5bzVtSVlwekdUSDY5Slc2bnRzbEV1ajR5UEMyUEROVlIzQ2RwRVJESTg5?=
 =?utf-8?B?L0dJYzQ5RXdWQ1lCc2V2dFE4Y3J1ZlQ4dHhNTTdqRnZKS2lac2tRRGZpR0dj?=
 =?utf-8?B?WVN6enowZk54NnJKVFNlOG41Q3V0UGN0emYvbVdsSHVNcjZFVkhZdnV5bHZy?=
 =?utf-8?B?ZFR4UmVuNHVkWnQ3T2VZL3lBTjJ5NmlJNWk0WWl0SjAyNmx4VEhFYmpxK21R?=
 =?utf-8?B?RVVwZm1YNkt3czRhOGFsOEZSbWQ5RDZodkNiL0FmZkpxZFVUSitORVp2d0Fs?=
 =?utf-8?B?WU9CMWR1NXRpTXByY1dQdzN2UmhHeGxVQmRPcmRHdXlNb3VpdDlCV3RDQloy?=
 =?utf-8?B?M0poQ2V5UGNqaVIzUm8vWEhKTSt4WjNLS1BwK1M0MzBKS01MTEIrbWF5YVBi?=
 =?utf-8?B?QklFRkJlbGRUTVA1dy9WQVpCWURXQUxrSFNpOHZyR0lyUTBhWVYyd1lVM3M5?=
 =?utf-8?B?VUhzQ0tJZ0lDT2o1d0xEMWxOZlluQ0V5VHVtblVrUzIvenJtZkQycmIvNlhF?=
 =?utf-8?B?OUptY0MvUktISFNXTHhrQkJPa1U5dGZySUcrTzNFczNONDZjRDgzWS9lVWxj?=
 =?utf-8?B?YlBUdGF0QXFxWGpDRHlVK1RzSXFLdEdRdkRVdFcyVk40WTlGemcxRkx3UDNM?=
 =?utf-8?B?Q3F1TkRjd2s4SlJrUnF1NnpBanJjNndqdWtpdXlkZ3l2V1hoM2xFRU56UHJx?=
 =?utf-8?B?a0lKd3drbVhwQ2ZqZGxGUldVZUN1RVZJQnVGWFg4cUF6SStRenhseUEwcmhx?=
 =?utf-8?B?ZThzNDRISE1nWWx6Uko4UDNHUkc4OGpETHJlNFdrUjcvbms4MDUrVTJWNjBB?=
 =?utf-8?B?Ty9EalJWemxWSUt5WTUwYmhoK3hiTTZKaHpzNjEzc2VwTmhnb0JONFcyemZo?=
 =?utf-8?B?K3dLQXdQektXTVJtVUJuL2YyVktmOENZZXMyNmtIS09QenJubVZoVjNldHlS?=
 =?utf-8?B?TWRxNVhrZlZ1ZXhKWUNmOXRrUmVsNDdQU2hOTGVqNTJIQUNrbi93OUZQcVpp?=
 =?utf-8?B?Ukl6bzZNaUhoeGdIVEVhYmdlV1JPWFZGcHZUcDBCMzZGQkdLWTU3VTd2M0tF?=
 =?utf-8?B?Tm95VjRsNU8ydDBrK1Y4bE56RGZ6Mm42cVdvN3dQL1hRemFwM2JNVlZCTHZk?=
 =?utf-8?B?S0RQQXduZW1FL1BHQUQwWitDcnFuQVZaUm1zMUZ1dEdlOWp0TlBGQVozV2JQ?=
 =?utf-8?B?SExqSG9KQUdjMUFOTkhnMEZpZGs1UEsyQTNSVkdDSUxQTmh0ZGRxMisxSE1w?=
 =?utf-8?B?RVRMdmtQRkt6L2U2cjdQMG9QWDZjL0lmcVlXc2Fsa2xZNU9hYUlIZUcyTllP?=
 =?utf-8?B?N3dzTVpPUnJTVkFuZU5nUVU0am1VL2xjTWgybVI0UERURnVWT2pQWFNMb2J0?=
 =?utf-8?B?Q3Nkd1M5QXgxVWpzRTd3UlBmamxQM2NTMk1tZzZ2UW9EK0dBcWszM01BSU1t?=
 =?utf-8?B?TzNXSGl1c3FWOWVJTXVnckpYVmQ3c0R2MDBwbHp4OFhPaEM4TVZ6dnN6VjNZ?=
 =?utf-8?B?VFhuOWIrMnVJRjdrb2xsVU45N1VtdHZDeHhRalpTb1JyMkZXaGxlYlR4OHBK?=
 =?utf-8?B?NjlSUnNEOEZyT1NyN1l4WHdjc2g2WlhjcHE3MlBnajNOZ3lGMDhOZHgyTW5O?=
 =?utf-8?B?YTk3akFzMk9GRUFpaDBhYzNqOEw2VXo5RVhJb0N4K0lqV2pVZTdsbHI3R2li?=
 =?utf-8?B?aDQ1MmYzYjM3YmVNVVZQcnRjSDlONVY0bXhpUUc2VzRDcDVIR1UvZHN1Q0NR?=
 =?utf-8?Q?ksAtIt981PRiSpsOTuIJmZ/6c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0482b3d7-45a6-4c34-a30f-08daa2311852
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 15:41:37.2918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpsClb9fUxgrNGFZRdQHc6q7tQs8EHrO1hj+YfP/jfBiMxn2Y7n9KFSvCwF7zEKHSoNn/qmjWMda/l4J8lqCyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
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



On 2022-09-29 11:36, Felix Kuehling wrote:
> I'm still seeing a warning even with this fix:
> 
> /home/fkuehlin/compute/kernel/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ?dc_stream_remove_writeback?:
> /home/fkuehlin/compute/kernel/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: warning: array subscript 1 is above array bounds of ?struct dc_writeback_info[1]? [-Warray-bounds]
>    527 |     stream->writeback_info[j] = stream->writeback_info[i];
>        |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
> 

What version of GCC are you using? I don't see it on GCC 12.2 with this 
patch applied.

> Regards,
>    Felix
> 
> 
> Am 2022-09-27 um 16:35 schrieb Pillai, Aurabindo:
>>
>> [AMD Official Use Only - General]
>>
>>
>> [AMD Official Use Only - General]
>>
>>
>> Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>>
>> -- 
>>
>> Regards,
>> Jay
>> ------------------------------------------------------------------------
>> *From:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
>> *Sent:* Tuesday, September 27, 2022 3:12 PM
>> *To:* linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
>> *Cc:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>; Wentland, Harry 
>> <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; 
>> Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexander 
>> <Alexander.Deucher@amd.com>; Koenig, Christian 
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David 
>> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Lee, Alvin 
>> <Alvin.Lee2@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Kotarac, Pavle 
>> <Pavle.Kotarac@amd.com>; Wang, Chao-kai (Stylon) 
>> <Stylon.Wang@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; 
>> Ma, Leo <Hanghong.Ma@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>; Po-Yu 
>> Hsieh Paul <Paul.Hsieh@amd.com>; Jimmy Kizito <Jimmy.Kizito@amd.com>; 
>> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; 
>> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
>> *Subject:* [PATCH] drm/amd/display: fix array-bounds error in 
>> dc_stream_remove_writeback()
>> Address the following error:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 
>> ‘dc_stream_remove_writeback’:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: 
>> error: array subscript [0, 0] is outside array bounds of ‘struct 
>> dc_writeback_info[1]’ [-Werror=array-bounds]
>>   527 | stream->writeback_info[j] = stream->writeback_info[i];
>>       | ~~~~~~~~~~~~~~~~~~~~~~^~~
>> In file included from 
>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
>>                  from 
>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
>>                  from 
>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
>>                  from 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: 
>> while referencing ‘writeback_info’
>>   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
>>       |
>>
>> Currently, we aren't checking to see if j remains within
>> writeback_info[]'s bounds. So, add a check to make sure that we aren't
>> overflowing the buffer.
>>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c 
>> b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> index 3ca1592ce7ac..ae13887756bf 100644
>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> @@ -520,7 +520,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
>>          }
>>
>>          /* remove writeback info for disabled writeback pipes from 
>> stream */
>> -       for (i = 0, j = 0; i < stream->num_wb_info; i++) {
>> +       for (i = 0, j = 0; i < stream->num_wb_info && j < 
>> MAX_DWB_PIPES; i++) {
>>                  if (stream->writeback_info[i].wb_enabled) {
>>                          if (i != j)
>>                                  /* trim the array */
>> -- 
>> 2.37.2
>>

-- 
Hamza

