Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28056ACD5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 22:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F05114A9D2;
	Thu,  7 Jul 2022 20:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF1714A9BD;
 Thu,  7 Jul 2022 20:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb2gNLQ9INo33szWLWDrE4P/wuFpux8HHfZuozEMDOkYXfWHpOUlU2oDOIfOZ9EHDGUWloyv5ckDw0yTn1uSVUKbQoY7glP4yT9PaCOf/H3ROp+HgqlOAGS794BUd7uy5OCoiWOqGzeGWtCVR93HrCz/wRCpXzvPVPdMYR9NQVgs4o7lJ6zTVr/+o/SHQUMgYwSiA64pwxqsWLLbuSp8SK1+2QYk/9reO87+Itrsu2WgJnd346t2KlWGJ2NfIa6MuR2jsFVku/4J+vJRuqfskH5/qXfRO1V4uB4dNIToiDuH1C0n+bNwMEBwTUAadVBrFGxhkqxCvK7nECZpoeJzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eyu7KY00neJiVZ84gSfZCtpWxTGAo9aXeMGPqWvu1dw=;
 b=WlEC2sTkVkGy/AAa0AuVtvD44DAXrLGzf49J463J1i1zx3Xa0QsMNV6LwBKX4MxRNmgUyTYwactkOPtk9iBCP5/G+99Z5hFhlNWPcX0zTQR9E+/aQiKXHLBSd/uAdVCPr+YWUb9J6ykvFBcW0be6P0U+iECOFYoObgzkuBnPSKJiGy3IKGoDjoZnpgnUAcWg8RKnj7W8lQtnNDbbZ1nlKUDIpR3aZxzj9y3/4HbtqK3BOUfAb2rDpqETg/owJ/lHzMyTNvf7/f/Vs0HZpsUhI11DbNjZBjUqfRus5k/FqgtEzx+gdOJsusqOQ9rcXPeb7ocZCaT1wtBoljXlg5ETng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eyu7KY00neJiVZ84gSfZCtpWxTGAo9aXeMGPqWvu1dw=;
 b=qTrKSkS08/FcG47fQr0OWrNK9FF3N5isL4Qlon4CyCLLOf6k7Cl7y1qq5Krz6J8FZkXXBuLJW0GKS9ZJIh1LD/ByMLJjE36fjT8ndcVmJypVfpvRSgpv+mGhtIoWDQVL47M6AO6GHxhmXBKztpFVQ5u6l7bQX+aElvQGPpoi6sA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH0PR12MB5266.namprd12.prod.outlook.com (2603:10b6:610:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 20:38:14 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a%7]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 20:38:14 +0000
Message-ID: <51186366-a040-f99d-f43b-bb6ac771f20d@amd.com>
Date: Thu, 7 Jul 2022 16:38:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: Fix unsigned expression compared with
 zero
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Zhongjun Tan <hbut_tan@163.com>
References: <20220706063951.54122-1-hbut_tan@163.com>
 <CADnq5_NpXcua54cSeSGaG2X_afcvoGswKgSb=Gysr5gpoT0AHw@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CADnq5_NpXcua54cSeSGaG2X_afcvoGswKgSb=Gysr5gpoT0AHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cab3168-2eae-4759-6f6e-08da60589d8a
X-MS-TrafficTypeDiagnostic: CH0PR12MB5266:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h+kCn7xx77Doo0M4nt6e0QPJqzplSfGhaa5Qi0kodeaA0QDPmfUYfQA5wZCo9MYWLWpLEgNxZiXIbI9ez4tXEOdStzNUzmedn8JqEKCfp8wqZTF7/Con+qTyz2RveOColnNpkUVngUOF7atH03ppsBM1mePBHs+CBmTiNqB2cE7GwWuMMAB6mrv9Il6q8Nv1QV9xSeOelUyNUPCogSVQYRvbCkhSnjSUFp4RHUvqLA757TsPbFHbSLMMQclMP09sHDwY+70EUWY//3+TbQSa6Ozs1Gboya9dAXCTqmoGE+qARW69rQgE4DTHv28PaO79SOZJ1eYEiR2hPoHMc4M1Tq31HMzfmx1JrK0dKcr1lcEF/DOYjBCoGPPesCrIt55kvsa9WacLAoDVIM2WcVDyOlL+0/zorT5y3a4WaVn982Gp1l47HgZsYv+w3iydp/sdXYWq2+U8u8InN6XsdlD6zQtGBXyjsuUztoO3pO7Cf5Hp4BTVRrqvuWYuojR0wbZLqEE3C1hZuLUoIU6bdGfQSm+n8KsMF5+mEx/hjEfltlA/rxqA2M4KtDp5oQ1Xqhs6TYe+JfP3Yh4fcP+fQhk/9i9gWBAe8tb4losRYPZtSrDXde3q42zF5vbDwB384mWqWpHfcwEsTnNE2xBQwcLrEvQQkxeNhbJFDUJguogrCE5JDrCCfyNpoJsvBjnLTEOaBh9Z/9ubZZbhr+NSQSUbqXMOUu28w3sY0BtcHBb8WMZTgYiZ3rXbTqbq1VurkwZv7+aWx27UHWj1qXypMNaN26+cHhSPNejd1aBqXcD4S/FsnAo6CCTSt2FBrYlATJPCqprWB1nI0ZgJMHtQmMq/JfNeBO4CAVPejUkZCpuC27Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(31696002)(316002)(7416002)(54906003)(8936002)(5660300002)(66946007)(83380400001)(66476007)(6512007)(4326008)(26005)(86362001)(44832011)(8676002)(186003)(38100700002)(6486002)(478600001)(53546011)(66556008)(2906002)(110136005)(6506007)(6666004)(41300700001)(36756003)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTlERWFIamhjZUVVaEl2cmh0L2tRS0ZQeDdOQjNFRkxrMFFkOEtjQ1FQdkt0?=
 =?utf-8?B?ZHBpa2lPUzhWSmhrWG5YbFU1bGRlem1ZU09jalpFdnFsenU5ZWpFRUsrb2dq?=
 =?utf-8?B?TkN4RXFMd2RqU3N3NllhT0RWdzZVR29scmV2Z1Fqd091M0d4SEd2VVpMWWJM?=
 =?utf-8?B?MnUxeW15MDVwYmRyS3NSQ3ZOdm0zRzVNVC9kY2JVd0o0OXN6R2NLTCtvWHAr?=
 =?utf-8?B?OTRQc1hoSXRBZXdNdUU0UEhTQTJUelJEcHRMWUZMaHZtK1Y1VGJEWGtwbnFV?=
 =?utf-8?B?TkJIcXRlYjFrYVR1TDZPeXl2ZSt3bkNsbWY1V3YvdVlpdElsS01iWkpnaEhj?=
 =?utf-8?B?THRRRXdrMXRLcmVmZmp0L2tJS0Rudjk4RDErYXlDOGJUQUl1VFhkODNVZ3JC?=
 =?utf-8?B?VmkrS2ZJMUNLaWlGQ2FRNHVkaEVLTjdvc0x0SlhTd1U5aHhYQm40MXlkOEpX?=
 =?utf-8?B?NFVXbjNFOWdJTS9rV2d2bkoybXdkRjI4eFVNdnJkazhuZUdsQUxtcWtyU1E4?=
 =?utf-8?B?YWM5QUdtbE5kWExIRG1DeTlFZGs1dHVGWXJtVFRGa0RyVXExQzlOckxHQmFU?=
 =?utf-8?B?d3J6SmhhMWNQOTFzKzVjT0Qra0J0ZkJnZ1dqUks3ZnZSaStCMFJXc21mSktJ?=
 =?utf-8?B?Q0lSU285Y05DdGIrWTc3QnNUNXl4VHBqbkxKNWo0TXo1bTNjUWcvMTBKSlJw?=
 =?utf-8?B?VHV5dWVzYVlBTmdoeVAxUUlCb092M003RUQxSkxOYzI3NDZaSUxQRnFBME5u?=
 =?utf-8?B?UlM5MHJPUW1PTEZObTJSQUQwR1ZacEsxREJzZE9LaGJUTk9GTzNVSUFVbkVH?=
 =?utf-8?B?cnNoZnRqYWoyL3RFRVlqY0VZWXpvaFo4Ti9YdWNYZjZkVjc0VU5kVUM3RDRY?=
 =?utf-8?B?QURBQTVjaW5XSmRWN3laSFl6SC9wbmZ0KzlXOFE0ZTZPSFNTbVpWQ0FNR0lh?=
 =?utf-8?B?QjlGcU9VcXhldzhmYXBTTlFDT0o2dGx4YUZ5bEZ1OXJRSk1lNE5jS3Z3Q1dh?=
 =?utf-8?B?cEN0cUc0NjcrV3VZNjlIa1llejFCazVabTVVbUw5ZU85UVJjQ3p0dVFkMXZS?=
 =?utf-8?B?cWQzNFNaT2Vua2NNT0lNMmNFcFdWbEhySmJtVXI0ZlNpa2Z5aWgwOGVwUEVX?=
 =?utf-8?B?ZHJUdW1yVWNUMVRBZ1lmWkhrTno3Z1ZXckxhNzQ3akswSkRiR3l4VFNSME1W?=
 =?utf-8?B?Z2Jmay9SN3ZoQ2NXUWNtdnVmN2JmRldBSGZ6L1NRZE5xUnZkdHlRQjRKanNi?=
 =?utf-8?B?WTBmMzNNMmtxbDBZb24rUmdzc2dzc21VZWtkN2ZPdFBsc1NWdEc4MWwzNGN3?=
 =?utf-8?B?ZUhxRzRzaGVqQTBoS2VsMlNBVi9ISEtyVWFsRFozaTRRSUJBWXJHUVgvRGxi?=
 =?utf-8?B?TGcvTGJKVS9LaDhxdC9XOHF3RjdBRUVhd3k2R0NiWG1xNnAwajZBQm5seDlO?=
 =?utf-8?B?SUhyRERYQS9RZUJ5VWVzTlJYRVNxcWdHSG9TcU9Ed29Rank2M01ZNnljRkJw?=
 =?utf-8?B?VUIvSEZxdk4rN2Nab3dZRVJYRVN2US83Umw2dDFWTEpiRVVDTUdWVExMS1kr?=
 =?utf-8?B?S1A4ajNlU0pvMkdWWFM3TTNhdmhXc2FwSXprSk1RalZHYVJzMWlaZSszb2RB?=
 =?utf-8?B?SC9CYWdmN3VUYmx5Tml5MXo3MmU5MUpUeWQrUThRK1NJQ0hMRnFDc0NpT2Iz?=
 =?utf-8?B?U2hGT0hxRmhsN25HM1RsYnZOVnkwU016VW5aUkM2MDROTEFBa3U5d0hpalRR?=
 =?utf-8?B?WXFoVUZDVUpFVlAxc0l0R0NDYWJqMGJuVDFJb2NaTElNSnJQV1gzbEVUVnVO?=
 =?utf-8?B?d3Axd3NmNUVJaVpvWUhVSzJYSGRKOHhBazVZcG9zL3ZGMG1VSmw5cEZaWkR5?=
 =?utf-8?B?cGIxY2xmVVQxS1NZMUFSWVpLczF0N2FOTnMxVjBGZ3dHRDMrVGxYdTZXRnZH?=
 =?utf-8?B?S05EZGljaGdPa0pEdUJVTTFvRmQ2V2pxNHhWTFpUcUJMWjZ6YmpCOWwrQXBD?=
 =?utf-8?B?NmhGSWNDLzVWTDR4R0UyUkFLZUljQVFZMHFKdmRtb3c5TnQ1aTc5VWdzdEFP?=
 =?utf-8?B?Mk9IYkl0d3BRbjRRei9NMnhEWlBFK0Fhdm1MNnFxUmRYZlFZcDJJSTJiVGE2?=
 =?utf-8?Q?ZQYxaNn1cLRVMWQFb2krWjAKt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cab3168-2eae-4759-6f6e-08da60589d8a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 20:38:14.4548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSZ7pHeecPVrDSh2WZKFtK0AzCZ+pFUM7rsqMADJ07u5R+2Up2D9MpZM/k6bZbcGMox36OgXk3PK4HY7vGJZhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5266
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, Zhongjun Tan <tanzhongjun@coolpad.com>,
 Dave Airlie <airlied@linux.ie>, cai.huoqing@linux.dev,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-07-07 14:22, Alex Deucher wrote:
> On Wed, Jul 6, 2022 at 3:41 AM Zhongjun Tan <hbut_tan@163.com> wrote:
>>
>> From: Zhongjun Tan <tanzhongjun@coolpad.com>
>>
>> Fix unsigned expression compared with zero
>>
>> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
>> ---
>>  .../gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
>> index 548cdef8a8ad..21e4af38b8c1 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
>> @@ -244,8 +244,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
>>         bool req128_c = false;
>>         bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
>>         bool surf_vert = (pipe_src_param->source_scan == dm_vert);
>> -       unsigned int log2_swath_height_l = 0;
>> -       unsigned int log2_swath_height_c = 0;
>> +       int log2_swath_height_l = 0;
>> +       int log2_swath_height_c = 0;
> 
> @Wentland, Harry Can you comment on the required range needed for
> these integers?  Maybe it would be better to just drop the comparisons
> with 0.
> 

I'm not sure I see the problem we're trying to fix.
An unsigned int can be 0, so a x != 0 or x > 0 check
is still a valid check.

Harry

> Alex
> 
>>         unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
>>
>>         full_swath_bytes_packed_l = rq_param->misc.rq_l.full_swath_bytes;
>> --
>> 2.29.0
>>

