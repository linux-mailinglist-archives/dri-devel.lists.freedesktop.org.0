Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655843FB116
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 08:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B7589B33;
	Mon, 30 Aug 2021 06:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21DD89B33;
 Mon, 30 Aug 2021 06:16:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCUWK2kPv+L8rn1EDFk9MLqYhvuMavEm/iXhHM+RxoPl3KDGkvFGmnkP3j0bjnvrVtphxalLqOtpCOrLLEuIedARYBV+ddNCauK/IL6yvSDjsG1LnRZNByLIqpD1c7x+9Eop6WE/+c7bUJ4wl4Q9AZTpYgVf0MGq1VjODMLwsujp0kfFQ+qNdFwOdFo3EwOKYt3NFiv4fuPn9DXAqiYJQlzaGQ8CywcFKC/TdOdG/qgUBI8Jtwn7C1nBQEvwCMv3yimlXRvKSajq5uOpCtsn6p28u+OplS3JjdPfdR2NRmUOBek6t1F+ZVClrk06JpZY+nj3H5b6Ck57VhFfqvGJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLDJ2mIawJjrmX7PEDg+UCbuHiFXugJplLeQ5ofVR/g=;
 b=mt0knw5I17NCErP05aIGXQbkkihoGStL+vZ6thfrqfeoxP1/VpIRNfrhCdIGtAEmApG7KoJOdLyThnps6BC38J7NGP4biX1PMnWC7aSrq1KWuBUt+nnL3U8VvgiYBRsf9lZG5ZTRWmgp+DQ0mHeIgufZD3LGUOIYcCOKvsLhwVOCqLyLqcG55ZUzDftqoFqwvg3WcN++IlT7TSrXKdEXASOQ90d/XkTXKXwZxnVZR86bR7LG2CZFc78UfqLpewGpBxREYdLu0cg5N4GisamyMWjttSQdVJXjNNOm2svFvFrBSTV2apNRrmaJa6JdScJiB9LAXHcTLrTrzl5P+x5Vrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLDJ2mIawJjrmX7PEDg+UCbuHiFXugJplLeQ5ofVR/g=;
 b=ONk4uQDNlV8s1anJ5hedjzeLdNNoUCxFmkDuQR3i/hTSxj7BL0EjTfhNQZbVGmdfZ4Umwr1N4ullvkEvI8AfdwWpRL2/AZZ2MT6fz5Q9R4r8KT+emt4y7xoZ+vfJ+jeQ9y2FgM32UQct6KnJQgJmzgaQP3QHrHHJ+EJ0/ZUODLs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3727.namprd12.prod.outlook.com (2603:10b6:208:15a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 06:16:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 06:16:26 +0000
Subject: Re: [Intel-gfx] [PATCH v10 03/11] drm/ttm: Add a generic TTM memcpy
 move for page-based iomem
To: Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Ben Skeggs <skeggsb@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210602083818.241793-1-thomas.hellstrom@linux.intel.com>
 <20210602083818.241793-4-thomas.hellstrom@linux.intel.com>
 <CAPM=9twjYTME6CPuNmn3S7A_ACUNhMOAY1QcpoOqAZ5RHM6JzA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1c8ee7b0-97ef-0c04-8e92-ec6bdc56bd40@amd.com>
Date: Mon, 30 Aug 2021 08:16:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAPM=9twjYTME6CPuNmn3S7A_ACUNhMOAY1QcpoOqAZ5RHM6JzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0106.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR01CA0106.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Mon, 30 Aug 2021 06:16:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba573dfd-86f6-4b9d-fee4-08d96b7db25e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3727:
X-Microsoft-Antispam-PRVS: <MN2PR12MB37271428086C10AE56F41F4383CB9@MN2PR12MB3727.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LZe86yGcGL+FlLGqsTESJFt/LBmWEg4n3lCB5L+jyO89vRdKK5dxwl/EZTIcAGEO4pwRXBfdY5Ri0Ob5n6VsPAyyJbb+Jt+nWLTGeMQcB+V8oU9FD7j+4+luC0mIhmFdHae8mlLVyKExScFW8jyq5tkOj6NLud8qr9oFfDxZPwc/5q+kIBck5IYIzM+lTTkXZ4pumIYJVWLwbciZyLdRuMBFaWEXDRxMg195H49WPlpl1/XW1SAJKLSOLkgIm+z2mbT+R5nYUXI3xsjTWn7YGP7uapt5djF9i3c3NV2j6eGUg9BSD9lZD2IkESoI7h/U+9cwGgkYwbZI1zYWdgcPV+zUfupRlTR7hEue/7syS7Bra0P7BVYZPTSA9UFKktCBP6RpjIRa+0C2X4ypwpjQO15Sj2jM/OBI9Uf9GQdwmH7gB8bedJA+q4Fo08X9h+Lxz3M7PuiPxvpCrmX3+UNA1w2SqBp8Y8O5WFvdLZf4h1F7U6ps5DkG3GWVA98pVI/YNI61l4opI2dU9QU2aGQxMCBF8i0uP5+o7cReJwLEmcJczYeQspfb7y/2MRv+TEAzGWKbj8pmKdH2hvNYH0gp8hgevySpoMB3viU8ESKZzYRIsQOaoPRT59FOOXXKAyuM4QOoEY6sPJZyoKLgiCdY0NpFVyqS4r9uVx83aqzQMgTMsEchdFEnQsee1eEAba2k6tDIQwiMGGF1ETJlGCdRpYUVygq426/XlaDAtge+7Gw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(2906002)(956004)(6486002)(2616005)(4326008)(6666004)(8936002)(31696002)(66476007)(66556008)(26005)(31686004)(66946007)(8676002)(110136005)(54906003)(186003)(38100700002)(36756003)(16576012)(478600001)(316002)(86362001)(5660300002)(41533002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkI3cHIvOGJLNUp4b1VGcHFJZG1sNm1uOVFLYm1TNjQ1c3hkMmpCbUtESXds?=
 =?utf-8?B?TnhPM1FCZCt1QzBuemlobDRJQkNYTyt0K3JPdUlvZjJTUzJIOTBScVhsUG9W?=
 =?utf-8?B?T3VPVFFTQkVlRUJTU0YvbXArSEU4cDljeEVxdGpQdmMrYWl2UFNYUHdPNStJ?=
 =?utf-8?B?cVVGaDBLUHFZS004alJkeG5UOHhXdlR0UW91aUthV1hudS9lQkVHVDFaNG1Z?=
 =?utf-8?B?TDNqbW1oQlRCOGtUejAzaUczZVppQVRFVVBzdlZLcUJTVTdGOHZCLzg1SHlD?=
 =?utf-8?B?bWZpZ2dWbUdTdzRHNjBxZE5UYmx5eVc0NllYdWpsTWczdzUyTk1uL0N0aTVS?=
 =?utf-8?B?RFFMQTBaaHp1TndSU3cwZEI3V2w0b3dJSHh3cEJPaXBrc2JLbUFrNUg1Yzdm?=
 =?utf-8?B?N3lZWFNDNjE5eFk3M3YwWVRMbmRZa3I0dVduVDA3QllCOTA4a3pybmJlMVgz?=
 =?utf-8?B?Mkp0ZzRtcjQwUGIxSDdHelhjMlo5WVI5S1FiTFhwN2UrM3lMWWlacDVJVmhn?=
 =?utf-8?B?V2dDNVNXcGlSSHNON2o0VVVycUJRMW0ybG1mMTJGNnZ6RVdjMnZWWi9MNnNO?=
 =?utf-8?B?eS9EV0psOTlnSEM4WXkvRm9TOWIvRkpIcUpSRjIzY09XMzZpbXFMMWxwbm44?=
 =?utf-8?B?RVVVY1BmZkdwdTNxYVc1T3RzK2MvY29UV1QxcW5KdjBzSFhOTjFOVFBjQVA4?=
 =?utf-8?B?aW0yeGwvZmI3bVVOYVI2L3Exbnc0dmw1QjZqMGU4TE9xUHVHRTN6aXZKRGRr?=
 =?utf-8?B?amhTS2tqcnRiTmtPWkVRTGt6QWFyME9ET2czVXoySldnbVBQeGROK01uVGU4?=
 =?utf-8?B?RFVrckNnOGZsb1gxMThTdW1xUzFlNXNPSFBPQXNYK0tMOU9mOEcwUjg5eU5H?=
 =?utf-8?B?a25zV3J2M3g3V2E4K2tSUkpET0V5M1ZNSzUyRWFrZ0Z1elVUbkZ1RXMvVzNE?=
 =?utf-8?B?MllQQXNzMndKSE81R2V0cXhyQXFNVW12RHQ5M3VSeGlIS2FUMTIvTVJ2ZmlB?=
 =?utf-8?B?MHF5Q1lIN1FtWFczUXFjR3ZvZGpsTnlwVisxUUdYclNHa2J3WENiRVhOZE1N?=
 =?utf-8?B?aTBKRU1jSGRUY3FTWDh6cFFLemFvV1lMMWhMTis1aUwvTWNJeVI2VDRUSkJn?=
 =?utf-8?B?cmswRXROL3VtVzYxK29YdXJPNGF2Q1Y5RGlseDFkZzduWDE4RXFUeWlWcmdR?=
 =?utf-8?B?Y1pFSTduZEZZN0krY0doZGVuajBybWNIOTRna25MTkpreExVdjJBSWZWdzNy?=
 =?utf-8?B?ZDhlRWE0OXQydUcrZHZvZjBnUEpkclJLei9YdzFsbGlXOXdUV0hGeVFXMGd2?=
 =?utf-8?B?UmRqRDdNTGhVMGVxOG0vaGNCZ1Job29SV1JCMjhpbkZGK0JiRUtVQzJPUUVl?=
 =?utf-8?B?UjdwK0FBQlpyTnZVRFcwa0YxTy9mNk9tOXdpdzY4Y3NpWGFsUXEvSUVPejlZ?=
 =?utf-8?B?K2xVUlYrWmFwMkJWbjNFdHhCeTJnSzA5NUduRUJDYjlqQnNtc0tKc0VQMTZH?=
 =?utf-8?B?TEdUaUU1bXpoOHk5cnhIQ2tsZU1VZVlXOGNwU2N3TjlpcmlSZitncXpXdGIz?=
 =?utf-8?B?SXlZNkVweEVrN0JtcWtWWEh6azVjM2xhVHhBaEpnRkRWaHg1WEpkSWJlSXNU?=
 =?utf-8?B?Q29Nd1NKbXlZaVJLTmZpdGozNzU0ZGVYMk80UUNaOWl1RHYzMmNySWJPUWJN?=
 =?utf-8?B?aVNvQzZJYTF1S2daNTRsMStJNHF5Sk5kYUxYc296NzhFZTVnK3g1RmdrVm1w?=
 =?utf-8?Q?/Y1LShzfXpk0JLkSJ4nDUdSnJfLtKdFLsa0EGAh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba573dfd-86f6-4b9d-fee4-08d96b7db25e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 06:16:26.1587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyflwI8pRBCk95LOUnCCRkbBIyjvg6vSYJaM7MROYSgQeOxeJKADlHEYAYv29Ieb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
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

Am 30.08.21 um 03:54 schrieb Dave Airlie:
> I've just been talking with Ben about nouveau having some issues since
> this path,
>
> ttm_resource can be subclassed by drivers, and the code below that
> copies ttm_resources around pretty much seems to destroy that.
>
>
>> +       struct ttm_resource *src_mem = &bo->mem;
>> +       struct ttm_resource_manager *src_man =
>> +               ttm_manager_type(bdev, src_mem->mem_type);
>> +       struct ttm_resource src_copy = *src_mem;
> This here ^^

Mhm, that's most likely a rebase/merge conflict between my change to 
subclass ttm_resource which came in through the drm-misc-next tree and 
Thomas change here.

Thomas can you take a look?

Thanks,
Christian.

>
>> +       union {
>> +               struct ttm_kmap_iter_tt tt;
>> +               struct ttm_kmap_iter_linear_io io;
>> +       } _dst_iter, _src_iter;
>> +       struct ttm_kmap_iter *dst_iter, *src_iter;
>> +       int ret = 0;
>>
>> -       /*
>> -        * TTM might be null for moves within the same region.
>> -        */
>> -       if (ttm) {
>> +       if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
>> +                   dst_man->use_tt)) {
>>                  ret = ttm_tt_populate(bdev, ttm, ctx);
>>                  if (ret)
>> -                       goto out1;
>> +                       return ret;
>>          }
>>
>> -       for (i = 0; i < new_mem->num_pages; ++i) {
>> -               if (old_iomap == NULL) {
>> -                       pgprot_t prot = ttm_io_prot(bo, old_mem, PAGE_KERNEL);
>> -                       ret = ttm_copy_ttm_io_page(ttm, new_iomap, i,
>> -                                                  prot);
>> -               } else if (new_iomap == NULL) {
>> -                       pgprot_t prot = ttm_io_prot(bo, new_mem, PAGE_KERNEL);
>> -                       ret = ttm_copy_io_ttm_page(ttm, old_iomap, i,
>> -                                                  prot);
>> -               } else {
>> -                       ret = ttm_copy_io_page(new_iomap, old_iomap, i);
>> -               }
>> -               if (ret)
>> -                       goto out1;
>> +       dst_iter = ttm_kmap_iter_linear_io_init(&_dst_iter.io, bdev, dst_mem);
>> +       if (PTR_ERR(dst_iter) == -EINVAL && dst_man->use_tt)
>> +               dst_iter = ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm);
>> +       if (IS_ERR(dst_iter))
>> +               return PTR_ERR(dst_iter);
>> +
>> +       src_iter = ttm_kmap_iter_linear_io_init(&_src_iter.io, bdev, src_mem);
>> +       if (PTR_ERR(src_iter) == -EINVAL && src_man->use_tt)
>> +               src_iter = ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm);
>> +       if (IS_ERR(src_iter)) {
>> +               ret = PTR_ERR(src_iter);
>> +               goto out_src_iter;
>>          }
>> -       mb();
>> -out2:
>> -       old_copy = *old_mem;
>>
>> -       ttm_bo_assign_mem(bo, new_mem);
>> -
>> -       if (!man->use_tt)
>> -               ttm_bo_tt_destroy(bo);
>> +       ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
>> +       src_copy = *src_mem;
>> +       ttm_bo_move_sync_cleanup(bo, dst_mem);
>>
>> -out1:
>> -       ttm_resource_iounmap(bdev, old_mem, new_iomap);
>> -out:
>> -       ttm_resource_iounmap(bdev, &old_copy, old_iomap);
>> +       if (!src_iter->ops->maps_tt)
>> +               ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, &src_copy);
> passes a copy into linear_io_fini which calls the driver io_mem_free
> without the subclass data.
>
> Dave.

