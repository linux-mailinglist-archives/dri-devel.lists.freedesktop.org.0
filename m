Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04378447E76
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 12:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E627E6F4F8;
	Mon,  8 Nov 2021 11:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212CC6F4ED
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 11:07:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/ViaW8lNNpihCCVCWSvxxGFBGHtvRiza5Fs4PNGblH5A450iDtFGlqF2cMa+XoxCdu9DJkp4or7YS9lhqTcogm4zu/wlCFimfEIgm9mVBNJfbX6WEO12lzttdBqK/Ec6OJ2piY7p6UQdcB9TGeDhkDZ2tlh/GsHelV8Kl8sPOlnmp/oDJ1dUEc3MgRie6Zx+RkOowiEYd0aLj4lxohkCAqneRcaL8xjDAh792c2qP2YIK1EnoKNqCjQDGQi9POY/2uDlFdRYiKqpzQ7Z8Dk7VYxdwFccaL7onPQ7RkdeAhVJYmYFQXYJSPBF4sqdAd73WDNp3s1/H6yzDtilQfuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaGirqbbEJtqjds+A26p5npYrlvT8fN6LRdwrWtT89I=;
 b=js7De5cpVXRhUTLKMqRhxzCNu6zTSNlxJjvEm9rHdXhP0jU1WIWLIYS9W+Wo0Ino1RKaL+IJIIkEL1FTtLT3ElEDr15KH+KAWzL/b7YVil9Om/op+zPsZ2XScJIAWuuK/C8uQUNLpStqgkZWfsrBd7e+w4EJezbYx1eloYM/o1zQJC4o+9TFne44HFM76AoSxW7Y4/T2fb/xAD53gOPpgzshBUMFgkf31A6u65EJB05HC6rX6eH3GCMG3p0fS2UAy8AZN92qMbL3F3Ok0dNDdVJKt+j1vU10nsi1cObI+iEp5pIqevZHlIEQSTKUhE7iKicNeVZADpCW3eSB1hr3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaGirqbbEJtqjds+A26p5npYrlvT8fN6LRdwrWtT89I=;
 b=knTxai0XLhU5A2L/d3DeTv9bsKhuk8UCMupO0Sj31uh8zbIFETjzDH7klNTLElFfCOhZgsMTOSza3Q1ZhN5+oFuBW1CnpQ9BhoE9ohxuttg/t+JBpkk9EZJXdbI626iUpUnyepli4U4N8pOmJ18Fge9qA6buXvWB/00Y+rixSNI=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1934.namprd12.prod.outlook.com
 (2603:10b6:300:109::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 8 Nov
 2021 11:07:19 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 11:07:19 +0000
Subject: Re: [PATCH v2 6/6] drm/ttm: Clarify that the TTM_PL_SYSTEM buffers
 need to stay idle
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20211105193845.258816-1-zackr@vmware.com>
 <20211105193845.258816-7-zackr@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
Date: Mon, 8 Nov 2021 12:07:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211105193845.258816-7-zackr@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0102.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::43) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:308a:d18e:268b:408f]
 (2a02:908:1252:fb60:308a:d18e:268b:408f) by
 AM6P192CA0102.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.16 via Frontend Transport; Mon, 8 Nov 2021 11:07:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69e6246b-08d5-4b13-f6b7-08d9a2a7ee55
X-MS-TrafficTypeDiagnostic: MWHPR12MB1934:
X-Microsoft-Antispam-PRVS: <MWHPR12MB19342230459E49D9DEBA297F83919@MWHPR12MB1934.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVUc6g/uvtj2ZY2DvwdEL9hQBJdq4RYYek2Oyc/pL316bSflRp4qcWYzTvMDQVjqD/UenFYEwzAWLV4duDvTiso6BSSfhkPs1OUKUGikEnj38yD0VGFnMOj460eEJnER+HdSIsqGbkB6jH7Zn04wmxBbWgKoAx3jaVD+Tk8nJq/Ek9zDQ6PR2IHlTYjeRS0g2e+V79Sa60+eT6rgL0ic51rr262lRZfJJFh3e2KbepG2tVPcWloZOo7yFb63xXoa9iTDvv2f5hCxzOqI0YtnZa+QHEH3aiyx9mSdjY3K9Dd3ddlH9ojuEUP3ZjtTfIEVjiJFz1PnlMfGCgLuH41Pd4UUu3GYoWamFqxluNzWnOD7N3ekaHSmoeEg6RS4Gq8unJVs5C7OyTn2UpjHNaTSkaHxIR2rubjWoFLcmHloIivsVVWxb1hck0FV0NWnArLZ6Zst7uyX+whR+u+cjsjC07stpamqVIhD8gL0G6P987KSnbV1MZDaTkk2QIFidpOUvAEg+osRJZxTqjcDklNfWQs9Wi2fVL/E5CQh3Zkf838OeZY36skBeEx0n9gQwZCqrnS4y3/3Sr8RWyM2aVzZx6lps8o+sMjw0nWEBahn3TIoOn7EG6aJYiDg9+f6W2iZkmd4yNDWx5C8KNQbenC8Vw7NFUkREr1970gN8IlnXerDVPOM0K47LwPStCneCStA0LBzYIYARGFdL64pc6ckL/eJKIy6jTHAK3sAw3P/IRXTX2bUBXh6guAz6siZ3Bf0eYxFMmFEK45+cjR5kxQPiQ+Mn4jOv9JATF5KJT2SOEGQLc0l7B11rdJPCC0cpqV4JZAUrEqxs8ZTJ8iqyNV+Dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(8936002)(45080400002)(8676002)(6666004)(5660300002)(86362001)(2906002)(83380400001)(4326008)(66574015)(186003)(31686004)(2616005)(38100700002)(66946007)(966005)(66556008)(6486002)(66476007)(36756003)(508600001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2ptUVcwS3U4MisrU1JhZ3lFWFp1ZTdYbE91TzBzNWkwRzh5bnVLb0V0UzFz?=
 =?utf-8?B?SGhyZXh4TlhyV1UyZitXRzFhOUkrOUlDMmluQk9ZeHgxVkRkSm9kTUcyTVFL?=
 =?utf-8?B?b1dxejFVdlNneDIyMTl2U2UyUFpEK1ZFR1hJTGN0NFIydFpFMVg2K2NYNXNB?=
 =?utf-8?B?aGRoWjRLZERjcS94OXdKMG53UFdRK3M0Yko3b2tPeU40aWJHNVFEZG82RWE3?=
 =?utf-8?B?eVhpUlZ3RmREQ1NEanVNNGxaalBZOEE1OFB5c2p1VllYZXQ4eGxCYzBwN0U1?=
 =?utf-8?B?SHRGN2VBUEdtZS9hZ2N2L2krcWdrQXdOS0xCM3BmbTNraHd2ZC9WT2ZMd0M2?=
 =?utf-8?B?VERQMTZHdzFsUEV0bzlHRzdCY2xMWE45aTloOW96bFc3YTRwYUZ5WWFOODJO?=
 =?utf-8?B?amNWWVE2WTZTMlVkK3dnWWE4V21rV1lOWnAwWWhJUnkzU3JGejM1NCt1akpI?=
 =?utf-8?B?bWFLTVNhRXA0NEZtUUxYTzFVYmVoY0NrYXAyL2d1ejFXVHlhZEFnTXFjbEN0?=
 =?utf-8?B?cmIvUldXaUJGSWFnSEkxRXdKOGp6UjhLeURxUTMvaC9YK3ZPQlBPZ1VBTXh5?=
 =?utf-8?B?ZlA2elQvclZLamgvOGc2MythQ2VuMlhXUHFLZXF6cXFUZFFvaGd1MVg2VGR3?=
 =?utf-8?B?NmdUUUhNZkRud3VHREVSZk9zcDdCR1JtaGRmczYvaEdUMENTUkxqVXdob0Uy?=
 =?utf-8?B?VnZURjZCdTFLbmRFZmJEZm9URzdERTE1SnVodVhQQXFIS2FsNVVicUkxMXBQ?=
 =?utf-8?B?K1NPQ2FOeGdwUVQ2QnN5K3F6a01uRUxIT2dnN1R0MGl3OWZ4V3NCQlBqMlZD?=
 =?utf-8?B?SmVhSzg1amd0VDRWM3V6akhXZHp2a1diZXl0YUZDMGw4bEpmR3JYS3dXekQx?=
 =?utf-8?B?M2d1K0srR2ErQ0U4OW05VzlIVUo1WWdUekFvaGt3N013QzhGdmNZc3RFL0l0?=
 =?utf-8?B?VTBQa3VBaVEzNm1nS2tPcWlUYXBpbjhzVDgzVzVxUFJPdThPMlRxMVNvV1pq?=
 =?utf-8?B?dkZQZ1RXMy9pUFJ2TXZKam5rTEN1Y2pBMUJzeDd5ZEtDMWpVRnRVRTNMTTFM?=
 =?utf-8?B?eXhxTmhXTFBpU3ZOc2oxRHNRR3JiTHB0ODA1dENTeEJ0Vi9DaHdPcm15KzZZ?=
 =?utf-8?B?MG9OSE5UZkZYT1Y0QlVQOXN2c2ZMWHJoSTVxUEIvK3JXWmJBVVhudThnVUV0?=
 =?utf-8?B?M2ZvbTV5ZWxvRTlNN1M5Y1ZWZUdhdzMydHVYS2ZTcEpsVmNtTUpMMk8wb3g0?=
 =?utf-8?B?ZlIyVDlrQlRUWGdpQi9xWW1lQ2VFbE05SDVyQ2ZqUFhiWktpSUVZMTNoV3R1?=
 =?utf-8?B?ZzZMeklZQTNUVUhLM3hjdWMwQnNia1pRcXFUeXZJTk4vVFhkMXA3L2p4R3R4?=
 =?utf-8?B?UzFHcWV5QjJ0bXNaZzg3QVhaS281WVFsTE9ycmdhSVU2U0Z3V1cwVGZSQ2JP?=
 =?utf-8?B?Z3ZmR3VWTnk4Zm9nRWNjRDJ5WTZQWnZObEV0bnhyV0xPS0VNOEwxbXdjaVQ4?=
 =?utf-8?B?cFE2TFZKQmJOL0JTTCtRL0tKZE51THhUZ1lwTGIrUDJTK1ZKMm1jdVRRcjJm?=
 =?utf-8?B?RExFN3lPSS9oajVTMU56RkwrMHpkZWR4TkxzQzF0S2dkV3dVZW50T3hPcVV0?=
 =?utf-8?B?RXhscmk2c3orMTlicGp3VmtOOU5EcklrVmxYVjN1Zy9SczRLaUxqR2R6UTFs?=
 =?utf-8?B?VmJwSEZQaTJVSW5tR3ExMzMxZTlrK05BYWVuS2ROMVhLU2xHekw1WlhWb2RJ?=
 =?utf-8?B?NHBQTndrOTRmUUh2TlVuQ0JuK01pYmQ3aUt4UzQ3Vk9jeURPZzhFV0FwTDY2?=
 =?utf-8?B?cURORVViR0RLYnNlQ1BKOTIrQlR4VkZhRTlCaXZPUXN6enVEMEVndlJNZzhn?=
 =?utf-8?B?RHowcGtzb3VYakx1ZCt6ZjZxWEhkRytPN3hqMTRmcXpFR2pVSzVlT2Q3Y3dV?=
 =?utf-8?B?K0trMDhMeDBDT2Y2c0hpc296c1BXTEhLTThkUU0xWkNMbDh3VlhrYWh0YktU?=
 =?utf-8?B?cUxUYzROMnRoMGdkakhEckNGMk00c1RDT0FVWVo5Y3dJTUlCL2Rock14VENm?=
 =?utf-8?B?UGxCa1ZpUzRtOVNhd00xNkJQa0o3YVUwZVZUenkrNk5GajdoVlNPcmdOR0h0?=
 =?utf-8?B?dFhlM3hmRUJLUUF2VXhHVUo3Z3ZXejZnUGlnT0o5N09lait5Q0QrTklXZ2Fv?=
 =?utf-8?Q?AYmWU7RLIFDMtxq8ghTon1Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e6246b-08d5-4b13-f6b7-08d9a2a7ee55
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 11:07:19.3644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pDXa+W+Re7CdLxpoBtGSy92G8MoCesYBn1ml0AR7lu/uVTtBVMgpi9ENgC/Xhig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1934
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.11.21 um 20:38 schrieb Zack Rusin:
> TTM was designed to allow TTM_PL_SYSTEM buffer to be fenced but over
> the years the code that was meant to handle it was broken and new
> changes can not deal with buffers which have been placed in TTM_PL_SYSTEM
> buf do not remain idle.
> CPU buffers which need to be fenced and shared with accelerators should
> be placed in driver specific placements that can explicitly handle
> CPU/accelerator buffer fencing.
> Currently, apart, from things silently failing nothing is enforcing
> that requirement which means that it's easy for drivers and new
> developers to get this wrong. To avoid the confusion we can document
> this requirement and clarify the solution.
>
> This came up during a discussion on dri-devel:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F232f45e9-8748-1243-09bf-56763e6668b3%40amd.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4f4ed0ab73894a482abd08d9a0942b98%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637717380521122147%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1lGhEIESDwizXnC7APtlhGws8miB4xeh%2FsTewsEPfBY%3D&amp;reserved=0
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   include/drm/ttm/ttm_placement.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index 76d1b9119a2b..89dfb58ff199 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -35,6 +35,16 @@
>   
>   /*
>    * Memory regions for data placement.
> + *
> + * Due to the fact that TTM_PL_SYSTEM BO's can be accessed by the hardware
> + * and are not directly evictable they're handled slightly differently
> + * from other placements. The most important and driver visible side-effect
> + * of that is that TTM_PL_SYSTEM BO's are not allowed to be fenced and have
> + * to remain idle. For BO's which reside in system memory but for which
> + * the accelerator requires direct access (i.e. their usage needs to be
> + * synchronized between the CPU and accelerator via fences) a new, driver
> + * private placement should be introduced that can handle such scenarios.
> + *

That we don't have fences on them is just the tip on the iceberg and 
mostly nice to have.

The major problem is that TTM_PL_SYSTEM are considered under TTMs 
control and swapped out whenever TTMs thinks it is a good idea.

That needs to be handled manually in the driver if a TTM_PL_SYSTEM is 
ever considered a valid placement.

Christian.

>    */
>   
>   #define TTM_PL_SYSTEM           0

