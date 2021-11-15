Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4663F451523
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 21:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4AA6E42E;
	Mon, 15 Nov 2021 20:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8FB6E42E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 20:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+/+Blvc9YMxFeQx1JNhX33g9MwMNWn/4bCcNpUxaoYuL5cfmU2rmiaD0FtJU/pOr4nZm8AQYtGNwQV49/YmZPvHhTaSpO1TdtlENzCsjhnhBLGLQ095uaDHo0eOX9C/n30LBUu3SsimWi3CtGBGdMdM6BkjslV6YCBYhE3NbmC+KN28laY6P6y8oCz7mimN2LgOIGhi4a41ZWymlB/0KneLvniz7KymMi8dpWlzmcJaSN66DmUI0eiS5DwsevCHK8OSiXTtMytJnlvifSe/Wt5J87qvAQW7r0G2hRuWvA/l1mIN1+rHhIa1siwvYyORZUW+unF72cHwfSxJXcZ50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MADoCqmqmpWE3frzMXRUzE/GD0E1i0QFKGr1jNbh/g=;
 b=NmWsXDuPzCCdJ81nLg41RpJ0It4iGM6ocR9O2XizI3x9iAK5CAV2pQXX2KvO4CdRPPXzFL+LiLkI+RqlJwlhY1+6fOhO+6Cqg6hbjhDOfFGo4K8Nz646tXXiVjIteDpJ05X/+C8NoGPeaLGDVzguGR5Th2xTqFlfiVa9wUEstRldxuhr0b4XxVIBwEbDaDb+5QCp1gt9cEjjtur2sLG6kXvgZYanCzIeYGRzfdweG84axNHsCEGe4VmyMQYXXi8yogBdF1PvJrLMtp3ykSvQT+WfaM+FJal9h6avtLXT/pLP7yRgRdRMPFDsd/FgER0Pxcv7y3pRYDEDn4CM+sA+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MADoCqmqmpWE3frzMXRUzE/GD0E1i0QFKGr1jNbh/g=;
 b=U5SsS3HjKmjR/VRzAzhfdUCtZofcMVuakuSqBIe3xr6tuw75jfMkSXhnz+Jc+PuCfc3E+H2dk+3/Moj8wNi/b8SbTT/88nSduC2HoK3wRcchuXI/mZkPzZGt1+psu8DZopGIOf8bBOiA/yv78INDCbFKznU+FGZ3Zu6t1m0GzOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1614.namprd12.prod.outlook.com
 (2603:10b6:301:f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 20:23:40 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 20:23:40 +0000
Subject: Re: Panic with linus/master and panfrost
To: Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
References: <20211114234045.cc5tearljna2ywij@core>
 <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
 <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fd82ad9c-2b48-9bf3-0552-6f103847260b@amd.com>
Date: Mon, 15 Nov 2021 21:23:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9P194CA0011.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::16) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:f6a2:bc13:dfeb:7039]
 (2a02:908:1252:fb60:f6a2:bc13:dfeb:7039) by
 AS9P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Mon, 15 Nov 2021 20:23:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65a1cb4e-8526-421e-0731-08d9a875cfbe
X-MS-TrafficTypeDiagnostic: MWHPR12MB1614:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1614D8D700FF8B734DD60F9883989@MWHPR12MB1614.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HYhPqRg6Gh+qr3Lny8kjM4154pMbOdslmpdQGPZoPwwsm8+fCKkFiHBqixGseh87VFZnVHABiSWjT45WHxJSlmrFh5tvqppaWLgsdKx+xu06mGNs0/YZu/jQGxKlylEp5ymbF7BpEcQaTJlpio+icriqS8JNRmTGLGiuaYclY5Pzn/HFr05V1wgl+B5BBwbY42ocNOAT0LvO7CkPA95+tfUPYBaKnmSaqij/NQYM9C47AUKhFZW3zQD6h0YTm0Pjoi0NuGImQdpUfMg53f3iYZ2QC0XIRMjQK5T/iX5/VL3K5+6JfM1ZFZ//Fa9c64LXsYHgtw6S8OXRVfNF5Iu3lQEZ0ykvS68uuvIPk29Z/0Cl9X+qReC3siNKBhIFBNhVEsb4e/d0wUNMhTODgE1kpk/XYc5RivmVfF0tSMmixtgFl3M3iT1PBnoTeawrcUAxlOMOgp/1tPVZkaBXYSnI4+wCcSkDglWHLZEbaqarx6rn7DIiiE5WY5aucXG5PyR2t+lkHBz0g/epwKncKPw/9tsyX1z9D286zM9AGDUfk68X17XDMsgiZ/c2+fDiD8292UMnI96JqvnP1bNxbmQQpbAoWSwYqcCh6X2dD/REUyLCkhH/5aLdsD/ECjMv08fJp9V43JeQzNe1JVQWjFt5Jx5bPF3KtUZcfXOe6qsYMU2NZjdtVn+5sYmHzvoMJ0ZhvYin7/6lRkqX9kig4KFp6z8aRS/ZpQ5Az8JMk5Ya2HnfFUknRI/Zhs9kQQNZpkX8PFPqitUFdj40gzmeBC7Oee39v2Pj7xDO1QDuydZYLwfqNCkzfZQfmlgtACWDtwQAP7ZERkFS7QCAwEiJ4bHKhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(316002)(6666004)(45080400002)(5660300002)(31696002)(36756003)(8936002)(66574015)(53546011)(4326008)(54906003)(31686004)(110136005)(66476007)(6486002)(66946007)(66556008)(2906002)(508600001)(38100700002)(8676002)(186003)(966005)(83380400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEE0aFVuN3JYTUU3Vlp3bXI3Smh2d29sUXFoQXFNVG9pVStmclVEdmZ6M2hT?=
 =?utf-8?B?aFNJakpHWENVVnFFZWc3SVN0eS9Cdm9JVUtGWlE3VmJLSDR5dXkyQjZ0eG43?=
 =?utf-8?B?M2dlYjFxN2QxQVpFTHdMS0lzaE1lWFB0bnFLa1YxbUlqTkZjYnJrTnM1eUov?=
 =?utf-8?B?NlpnUlMyV1gvSnRRbHV5SXMyK0VZYi9IWjQzQjhIRjhna00yMHdIMlQwSVhL?=
 =?utf-8?B?K1BwMFVMMjUrU2VTN0hOeXREbnNlWUw4QitHRXM4R0h5VkIvZ1grWm11ZENZ?=
 =?utf-8?B?UXdmSG1rTHFDT0ZhUGtQeFR4aURKRTAwOXJmTWw3TTFGOG5qVzdjRXBqTFVO?=
 =?utf-8?B?SVhJSHhkak0zWmFNSDhVWkZtSHBUMWEwbTY5bTZQWmVUTXhXajdxbGNGTVk2?=
 =?utf-8?B?aGtsQkVxWlBmMndQaGlvSW9TREVEdHRXV1g5T3BaS0x1MHNFbTBFcDRWVy9S?=
 =?utf-8?B?eGNVMDArM09LdTVwYlQyZHp0c3VaNG9WZlhPZzhRLzlob24vSTQvWGc2cVRL?=
 =?utf-8?B?VTdwOG5wK2toekExMkh6Ulh4T2c3aEF2cmFJTEQ0RWhkVmlocjVibGlPV09U?=
 =?utf-8?B?cEJSR0dLMmJucC9PL0phM2Ura0xQczQyNzhmS3NEaTkzcGppbTEzWTY4c2l0?=
 =?utf-8?B?Lzc2U0xxb21ReW9MSkE2WjVESWpzb3hRKzFwV3FGemlIYWVTeFBWRHBoWUNm?=
 =?utf-8?B?bVhDUWkrM3JDajV5MVZlanBlVGhiVGIwdUJWTFcyd0dzSUdKZmhQZXlmdWhm?=
 =?utf-8?B?R0JGbGFSRnp4TTBzblYxdlFRbXB2ak9BWTVwSnhJcjRZZVhoVzBRaHBlaFRR?=
 =?utf-8?B?UE1CRlJqL2gvcWFmOEhhS3ljN1NyZURnYlU1ZUIzaDIxRnp1Rm5vTmV2K3Jl?=
 =?utf-8?B?S1BoN3BXYjRVRDJLd05MNlBDbEd3WWJTQ2xYa1d4SFpzS2FvODJjUThkSzIv?=
 =?utf-8?B?ZkUzaGdLRTBtbHR4RkxFYzRpWEU5WlMzQmZoblJrUDlDaXVDdDRtVXc2blpo?=
 =?utf-8?B?TU5IVlE0aW1ndUFMN3dXeVNiZjZjdkZRU0NlNXUwV00xbFRGSUhjMTJOTnhx?=
 =?utf-8?B?eE8rbWJrb3hOY1Z2ZlQzdnUrOW43VVpOdjRuNmNwUFRGNXRqbUlrUmwvT2lJ?=
 =?utf-8?B?eDBtMjNhcnRVZnV4SmdaRW5yMy9GWXFveGZ5VG1oSWxsY2pOR2tzb3lRbjQ2?=
 =?utf-8?B?SDRiL1diUS92UEhrTXBNZjZFNlovWi9yaEFhZlR2YzRHMGlyOXM4UkxzTGNj?=
 =?utf-8?B?ZDJvNGgzVEFudmpFbkEwRDR2bEZoaGpwcXYrYTQzQTNnQ2FoR1RQMXlKYXZr?=
 =?utf-8?B?RjRabmRaVHVDMmthMGl1K2R1VUZsdXJKNlNWS3RCSUxZalA2QlduK3JTeVhY?=
 =?utf-8?B?cW9heFEzdTB5RnhiMXliS1Z5L0pmK01Sb1k2RHZGV3lMc0VnUjl6V1RSdmNv?=
 =?utf-8?B?bTI1bHZIWlN0NmVyQVBVbEZXUjNxZVJPLytnbzRFMWFua0dUM0g2aWZ1QUpK?=
 =?utf-8?B?OFFieS8wc0FoV00rcVlaa1pJTXc2bjBHUGdlcG9keFpDSnZ6V2s3Q3Y3UjFH?=
 =?utf-8?B?MVpKVmJ4TUFQOW1JVWRwc0FmRUw1dHB4bjM0bXJ5YVM0ZWlhYm01U3JQcFRC?=
 =?utf-8?B?dE1ZUEN0UGdWNC9pcWxock5oN2xEUXFzWThRYXR4WUVuR2M5YnBlbzA5Q1pX?=
 =?utf-8?B?TGErV2VCY2JkOTVaWDkydnNVVDR6Y3g4Y3QzbHMvZkxSV1RUcHdhaW9DNjJ1?=
 =?utf-8?B?S1hDOWh2Y0NmS2d6OE5CazVGZnpQZXpUVTBCTW53OWlyNG9SaGZKYzBQcU1j?=
 =?utf-8?B?MkdwTXE2NVdqTEkvcE5NbTdwMk9DdWc1bFc4Mitta3FkZDdtckVpVVV6ZVE4?=
 =?utf-8?B?cXNmK3M2UjJMaCt0WVZ3bWpucy9ld2NxUkpYTjlrZTBvQkVXS1hqSjJzeTBy?=
 =?utf-8?B?QTdoa1NNbkVMSWltZllJVGFmMTNKbnpnU2krNEJWSkl4K3B5SzdrK3c1ZVpR?=
 =?utf-8?B?aTh2bVVCeW9kTGR3dkVNQzFHcjhLTDkrR3RoZmVyUnBzck5yWmJVUWtvSU0x?=
 =?utf-8?B?cTA3YkIvSkg1OFdTV3hvbXdMMUp1Rjl3T3JNdHZMZjBDRzdKNWhIMGJ5N1JO?=
 =?utf-8?B?OTJvMC9ZVmNvRThManliUm9Wa1dtbGdsTHV2aktTZWFoRkkvNk9zaTZPZ1JH?=
 =?utf-8?Q?idmjc4xP64yCUiny5bsZgjc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a1cb4e-8526-421e-0731-08d9a875cfbe
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 20:23:40.4061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2lpYZ8kqjUCKDCBzeRD0S6Zvu1jNUpWQX2h9M+J92FfoaudrX4dvyRTwK3cnTx3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1614
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 15.11.21 um 16:05 schrieb Daniel Vetter:
> You need
>
> commit 13e9e30cafea10dff6bc8d63a38a61249e83fd65
> Author: Christian König <christian.koenig@amd.com>
> Date:   Mon Oct 18 21:27:55 2021 +0200
>
>     drm/scheduler: fix drm_sched_job_add_implicit_dependencies
>
> which Christian pushed to drm-misc-next instead of drm-misc-fixes. I
> already asked Christian in some other thread to cherry-pick it over.

Sounds like you haven't seen my answer to that request.

I can't cherry pick the patch to drm-misc-fixes because the patch which 
broke things hasn't showed up in that branch yet causing a conflict.

Regards,
Christian.

> -Daniel
>
> On Mon, Nov 15, 2021 at 3:56 PM Daniel Stone <daniel@fooishbar.org> wrote:
>> Hi Ondrej,
>>
>> On Mon, 15 Nov 2021 at 07:35, Ondřej Jirman <megi@xff.cz> wrote:
>>> I'm getting some fence refcounting related panics with the current
>>> Linus's master branch:
>>>
>>> It happens immediately whenever I start Xorg or sway.
>>>
>>> Anyone has any ideas where to start looking? It works fine with v5.15.
>>>
>>> (sorry for the interleaved log, it's coming from multiple CPUs at once
>>> I guess)
>> Thanks a lot for the report - are you able to bisect this please?
>>
>> Cheers,
>> Daniel
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cc541030e445e472b082808d9a84954cc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637725855208408806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=LVQEVyNFPE1hpZjlD%2BApOVsfUBEPYPiRVVp5Gkut%2BcU%3D&amp;reserved=0

