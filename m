Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21A66C266
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 15:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A3A10E18E;
	Mon, 16 Jan 2023 14:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B7B10E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 14:41:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv6kh/gTJ8a1PBwAYGeiBpKKzW40CFl0VMHVK5aM6dUNbqbaQD0njTzZMxDee3rOpBrp2qhf/JIpAWAcn+zUOX7nTwlujGYojXSJUpqPKvPdOWOOpuRd0z5CUJ2XEJwkcJ2Vpd0a9OOlVcma5MxzWq/n/wZu75wKwFeH/YDAF5XUengUaB2GuvgZgIytFrSDXemI1VfVg67M9GDyviCkCBSQxgGMxVR/OXoq4TTHp+v57hG0HmPzTdRxOYly6afZXyHzjFS9Fqq22DALKJdnBm44IbtpcYeFqr4hXN9AF+QB6x1OCcE4JA6i00ay+g00X6/XtWSz/ffJdpxPwDBR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeiYnRJwNI5aOyhAnEzcyPLUsGa99qDxhIBfc+5adoI=;
 b=gKtfLC9Kg39esDTj5fYRsrk5ZNSBEVOJaHtoUkwB0qKKA1ySatuJwhfFcQpx0xp0tT8eiVKvn0q5uquhqUBWkLFo3eCkJH2rnIxCVFzg3FoU43XYLd85jZ0jqDN/zmk1rOoo7SSwZf5LhzFCkgPfCUsVLxCKcoEXhPvPZy2JUWq6NqceMPaG++iuKvhM9XCfMB5TTBM06rAhlP+L6G+DD9sdqacf5TpRaY6FVM0nv/pJbY+x7ANzRqZs7DmMtprrNQcKVfyp9wqH3DTGdK8d0HS9RjBrWD9M38UhCZJCdDYZvtf9SfOwUSwGb2H4228mOxIxXaBTIUwRcFqyMaNCwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeiYnRJwNI5aOyhAnEzcyPLUsGa99qDxhIBfc+5adoI=;
 b=pCGrTlK7QGndihsk8uLjtCHDT7r+k+OJV+PuiJ7O2GVfMIVrhWYsuaLNd+wny9lZ1fEW13EU1vhVSTKGFfAF7FNlp0VV7+m+nQUqZb3tJUWHp/sqb53walfqjgv4nzoFYx3kdp7bq79/7O+x7dSRh2fC9OmMaPA/yYgtPpIWvhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4316.namprd12.prod.outlook.com (2603:10b6:5:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 14:40:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.022; Mon, 16 Jan 2023
 14:40:59 +0000
Message-ID: <904299c4-9752-40d5-854c-95fc1583993f@amd.com>
Date: Mon, 16 Jan 2023 15:40:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/ttm: Include <linux/vmalloc.h> to fix MIPS build
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, ray.huang@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230116121023.14245-1-tzimmermann@suse.de>
 <ee7ef7be-7d9d-d6eb-7adf-0b03a2abb3ab@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ee7ef7be-7d9d-d6eb-7adf-0b03a2abb3ab@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4316:EE_
X-MS-Office365-Filtering-Correlation-Id: db2acca5-673d-4d90-35a5-08daf7cfaf07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xWaxMkDz70Fom0rXJtDURnO9VeJGBw1qmPOEEojXvnSsivylZRO5q5R5miILa31jbh1RvY72JUh7QnMRaEgN9A9lhWnWHvGcYrOG++eVYSUGxqyBYdrxPVEnHmqIMCosv/2xbA+x7HPtJD+iJ04di5+AIUIl3olLvN92QV5FBtuNEAGwZsDjOp61huKGXSSeBpXIMiKOigswX4ABP7+tFSnHoJxymlAzZrNz/+cCkzePmRbVJoe+H5ofFASVM+S5lOlcaiZA49U0rEIxfV/D6g/aDfgVYmrJDDqm0ohdhpW9oFNcYFrvO08RsKjKoBH/uggVzXpBo8WrhEAYr2Qo6KCxYud1ZxZXOpsjz5brNyXekIDjRSQWFIl5IwUHxH2s011xQNMeLJO9fwye4gsB9QDtpw2X8JQvkQIUEomMJScYp5DKilXlFZtN6qSmpwpHDbq26X2LEthDp1jK77l5M9gQ05Xp1n/vr9l9WFReTg68dNbPXQLIItgZJm01GLM8dKt7fn/DGeuCabG0xekZfxB+l3zcOMrS1u8daJxcEdSJTEl7FNbLB5Sj4CKYfVJIVpEC56W9npDuQEWr3ppnir1AV9mVRYL1Mmw4VcKU93jkYFWA77362lM0lqYpTM4cavPeVg3OC53DwHFh10RPYXby5E1xFv+mikhEETVQhpySYV/nd7rr+wkA/Ovotf0iWxx8Ci/nWtbmWZYYzCcIu9vN2lMAk52OII0AiYsd74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199015)(31686004)(36756003)(86362001)(8676002)(4326008)(31696002)(66556008)(66946007)(66476007)(5660300002)(8936002)(2906002)(38100700002)(83380400001)(41300700001)(316002)(6486002)(6666004)(478600001)(2616005)(6512007)(186003)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K01UN2xsMHcxdktSajBTOURFdXpnd1V1cjlkU0JmbjdRVDRIUmN4V1BlYWdW?=
 =?utf-8?B?dDdJdW5qSEwrSEQ1TnJtRitQbEMzOG9BeFdqNVRrV21yemVpQ2RsMSsyRnlS?=
 =?utf-8?B?c1JFNDBQZ3VvSkkzWlRSWTZTQnNRNVRWNmdhemk1MlZnKzVJSHNOajIweWxG?=
 =?utf-8?B?ZkpidlM3Q2ptZXVrMjQ3KzgxaTJMdTlZS01aOUppY2F5VHVZVEZSYmxNVm9P?=
 =?utf-8?B?cFEwNWluejYzRFdGaVY2MGRGR3lQQ0tXYmhXbGhEMDZ1TTZWdWdhcnNMTGxi?=
 =?utf-8?B?NmhZdFhzK21CR1VRekl5aUp0QlFQYlBOMGJ2SXJGMjZEZnpzdm5Mem5PK1E5?=
 =?utf-8?B?UHpVSW5YMndRd2pUb09xenk5YUM4VDBSRVNLNE9ZWnBZMDBvOXdMeDd4b25y?=
 =?utf-8?B?TlpyditpL2FsYzNVZW5razRCQWlzZzlTYnQ2Zks1eEFRRkZzVVZaQndlTm9m?=
 =?utf-8?B?cnVKbHRFcEFwb1A4Wk51T0JaOFI3VEppbm9JV1BXZmdJMFovUkk3SEhSKzM3?=
 =?utf-8?B?Yk9QZVFIWUoxZmloWFpiRURQdnR3TjduU0JxdmpCK1RkUGVQcTVTbkNpRGFv?=
 =?utf-8?B?ZmpoaW5INWpUVGFLNkJQRDdmOVk0M1pYYXQ3ZHErV1NPZGJTSTUzSXUvODhB?=
 =?utf-8?B?YnlTU1pUYzJwOGhnNXN4S00wZWRsT293U3Uzei82a1JoLzJTWnYyNzB4dWRN?=
 =?utf-8?B?cmpTd1VvQ3dWR0N2dlhOU2VzSE5FeUJER3RkOU5hMEJOelBNVTM0OFBwODNs?=
 =?utf-8?B?L2FKMHgrL0tsZ0xWWmh4eE9oSHdJemd6Z1RPa1RCUGJFY0U4T016NTRMR0Z4?=
 =?utf-8?B?aExJd2VLMzFmem1qNVI0KzZzVjZPR20vREpkZnI3L2VxVkNUZnF6eFBDSnMx?=
 =?utf-8?B?QmN4a1BMSE1aTy83bk9qYjBzazh0ZmVoS0RxemRPRFJLaEpRamRPYXdDL21z?=
 =?utf-8?B?UnM3b2FjUU9vUm5LdFVITlgyNStQYUQwY3Azdm9PeEhqaEp6SElHcGVmcHNL?=
 =?utf-8?B?N1F2eVAzR1pkUktjV1UwcFVCNEFicUJrTC91TlpMc0dxeDZLR3g4WWpoZEIv?=
 =?utf-8?B?bktPODgxampWaXIzaVhWSnVpR0IreDRVV2hTbldjNFlKbHhhZ0RpMHJSeDVI?=
 =?utf-8?B?bEZoWjU0RFNWMFc4RVdPazVOUHJTSTNUQlcxbjlEWDlxT1FkVjBMWkZ4QW9F?=
 =?utf-8?B?UGdWWXpFSlMxOFF0RzM5NTdxQ3ZxZk9jTmg4NkdleDREdjF4TEVBODB5bk1m?=
 =?utf-8?B?bm9tV1RUTTRnZFFmU1BWMyt4RUJrT2dGcXRieU1WSCt1YWxrbk5MTDZmY0xm?=
 =?utf-8?B?UVNqdndpNGUrOCtuK0ZwRXJadHVwM2E0emliaUUrUXVwS1BOamo3cGpPV1gr?=
 =?utf-8?B?cmJ1WnArSHFMc0JuZHVneTVyOHBZaVpaY3E3dmRueGR0Y01tT25rUkJuOHFQ?=
 =?utf-8?B?UDU1TWV3R09lRGxjVlJoK2V0cURBMzBaQWpINjhnckcyWWlDL21YYm82Vmxk?=
 =?utf-8?B?TjgyQ1I0Rk9KYVBvekwvdEExWUNhQUlxSkw3L0dUUVhnYTN3eUFqMGxuUGpW?=
 =?utf-8?B?cldHdTNqbTV1cHBmOFBuQkJvakxvZEFyblJTc0hjRVFJRDFEcmIvbGdrWXpE?=
 =?utf-8?B?Y29vRmlNYkw1ZmZraU05MjM0QzAvUDhhbkpJZHcxTmxrNTJ1YnpEZThINzFU?=
 =?utf-8?B?ZXI5bjM1ZVExcTVhc28zMUIzT3F4VHhHdjRvNmovQ2lSL0lrNnZJL2MxQ0dw?=
 =?utf-8?B?TWpybE9DbFBzUUNUQkZrYVpLNlozMHJQeWdsYjBDZmx2L0Nhd1JjWjJIcGli?=
 =?utf-8?B?eW16R0dJVEZzTFVrMElhWHZoVWZhQmhjeVd3RnA3R0xTMWJNTzFzWGpaUlBr?=
 =?utf-8?B?UGFDMTlhSGpIdjFBZjNOWFJWdVI5NDk1Z0lCM0RtU1VXNVVnQXEzRldLRXlh?=
 =?utf-8?B?UXJJUTIrRHpqR2dqT280QnlFV3JTdlpkYlY4S0l5S2pkeVluY29RaVA1bUta?=
 =?utf-8?B?c05EdytjaC8vK3cwRk4wOGZhbCt1MDZWTVpTaW9rRE1oclVkREVpcHAvekJy?=
 =?utf-8?B?Q2VxNmJTYkhuVHM3SFNqalVGeFIwS2RpS09KWWpBQnZGekVOMVJIY3dON2p1?=
 =?utf-8?B?ZFYzQXIxTmVoRXE3WjMyc3ZyK0F4YzZIbzczNnprd2ZVbkdxbU5pWFlJSHht?=
 =?utf-8?Q?HvhTPQZjUyDoonT1HWgn7BnkEzgw9+KbMnsrZZ4o8wdj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2acca5-673d-4d90-35a5-08daf7cfaf07
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:40:59.5622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RX4UIwC7/L1dwY7/pc76nQ0KACGEBWOgJ2/NMLqRRcU+KdUsmcAw7KLvZaUVLmUL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4316
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.01.23 um 13:13 schrieb Thomas Zimmermann:
> I'd add a Fixes tag, but don't know the commit when this was introduced.

Mhm, that code is 10+ years old. My educated guess is that we somehow 
pulled in vmap/vunmap through a header which was now cleaned up.

Anyway your patch looks good to me, feel free to add my rb.

Christian.

>
> Am 16.01.23 um 13:10 schrieb Thomas Zimmermann:
>> On MIPS, vmap() and vunmap() are undeclared in ttm_bo_util.c. An
>> error message is shown below.
>>
>>    CC      drivers/gpu/drm/ttm/ttm_bo_util.o
>>    ../drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_kmap_ttm':
>>    ../drivers/gpu/drm/ttm/ttm_bo_util.c:364:32: error: implicit 
>> declaration of function 'vmap'; did you mean 'kmap'? 
>> [-Werror=implicit-function-declaration]
>>      364 |                 map->virtual = vmap(ttm->pages + 
>> start_page, num_pages,
>>     |                                ^~~~
>>     |                                kmap
>>    ../drivers/gpu/drm/ttm/ttm_bo_util.c:364:30: warning: assignment 
>> to 'void *' from 'int' makes pointer from integer without a cast 
>> [-Wint-conversion]
>>      364 |                 map->virtual = vmap(ttm->pages + 
>> start_page, num_pages,
>>     |                              ^
>>    ../drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_kunmap':
>>    ../drivers/gpu/drm/ttm/ttm_bo_util.c:429:17: error: implicit 
>> declaration of function 'vunmap'; did you mean 'kunmap'? 
>> [-Werror=implicit-function-declaration]
>>      429 |                 vunmap(map->virtual);
>>     |                 ^~~~~~
>>     |                 kunmap
>>    ../drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_vmap':
>>    ../drivers/gpu/drm/ttm/ttm_bo_util.c:509:23: warning: assignment 
>> to 'void *' from 'int' makes pointer from integer without a cast 
>> [-Wint-conversion]
>>      509 |                 vaddr = vmap(ttm->pages, ttm->num_pages, 
>> 0, prot);
>>     |                       ^
>>
>> Fix this by including <linux/vmalloc.h>.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 12017ec24d9f..8e19a40cb41d 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -29,6 +29,8 @@
>>    * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
>>    */
>>   +#include <linux/vmalloc.h>
>> +
>>   #include <drm/ttm/ttm_bo.h>
>>   #include <drm/ttm/ttm_placement.h>
>>   #include <drm/ttm/ttm_tt.h>
>

