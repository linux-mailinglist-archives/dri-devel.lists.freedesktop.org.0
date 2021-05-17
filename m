Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49B383D31
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA756EA53;
	Mon, 17 May 2021 19:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548486EA53;
 Mon, 17 May 2021 19:22:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duY+j8K/v+gR3mqd0iWyXYkK1XNDTtqdSnUACH/Cx3HGcwNECNg6aNzFuFUpHyo2e/PzoYjXxeLiSnBaIuREpJqjgRRcsxzqmP9IVcP2zHV+F2ERWmkzK6hqEZeaP5LHwm/NtOdaNeq4ljhzxm2dut3czLuMX8Y+vmoCnzaNr125WSFw8T1qJ7cbt5ZURlnxVzl8SvQzQ4Wit+PsjlMJrKVCTs65FdcBNMP9DkUNSMqjNoXGBTzVfMIGfY8813jN9l2vW2Q3XtTHJLDiSWMD86W+LmaVmPBGcOym2EcA2s+5gw/iISIkxZ6TE00HIpR7IUtdWWEil+q8C7kGbgfRkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQZdSvZHF2AAms4DBUH3p43uk0ND3PoyNistaJ8d+74=;
 b=kQtgKCZQtRlAy7IMd2OpVhdIjlVXzxx6dV1HTUaLQZICFHXab7H46mF68Cv8q/BNRlYSjVYvd03/ABFgoItOYc36+XksSNbO1+l9cekhpllyeciXkTTtgSqg7798JdtbnNhjSzUKAFwlaq6j/5RAsryGgszPIhpYWktx/Uh2I+nEtcGg9lQdKaiPAwhCkTGhYDU/cyJ4KUuguhcCUIa92m/NvCCTvKAHbMFslahHBA9KhzoH5bbtJkLH2jY2NV9+Sm3lDwuKs99ok1cdRHMqPZ18yHtKUGFmKna4NCaHmPgmdU7jjWgUEgcGedh2DY/ajSrL1LRA68tUeCT9D2oAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQZdSvZHF2AAms4DBUH3p43uk0ND3PoyNistaJ8d+74=;
 b=pjCaATl6gK7sVvBJeWCvm4XLKM3SzHgzNyXILrx5R8sYkgU/Yhi91Z+sUWgIpg9M0Ys4/Ip4A7rkHlDmWKAb9DTD6SKXUY7Xg/HijB/5EcDcMP2BdEa16do3MToBYLnKjtzMUbzjdcHJ0rQVhNqhr5qxiIbXT00xClA/2Pdoro4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2496.namprd12.prod.outlook.com (2603:10b6:802:2f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 19:22:11 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 19:22:11 +0000
Subject: Re: [PATCH v7 16/16] drm/amdgpu: Unmap all MMIO mappings
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-17-andrey.grodzovsky@amd.com>
 <CADnq5_M-Sy3cF762044Ub9J=N_U6uQ2h2j40Y=fof04dXL5h7w@mail.gmail.com>
 <1882dd85-7ac6-8e54-b66d-fe09718d0262@amd.com>
 <CADnq5_N1EDO326hwG_3QKk9hsDwVZq1CqbEHgveN4pg6rF3zww@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <158d6c45-8389-c8ff-d5b4-2500088ef48a@amd.com>
Date: Mon, 17 May 2021 15:22:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADnq5_N1EDO326hwG_3QKk9hsDwVZq1CqbEHgveN4pg6rF3zww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
X-ClientProxiedBy: YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::22) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
 (2607:fea8:3edf:49b0:19e2:b915:59c1:4860) by
 YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Mon, 17 May 2021 19:22:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c537a4c-a97b-4dce-86ac-08d9196911aa
X-MS-TrafficTypeDiagnostic: SN1PR12MB2496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2496FB2D25468B74A9A16325EA2D9@SN1PR12MB2496.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZHP4L+Z8WzauTETx9pKEs1nlbnA0+Hl2UnnutvxgqW7z9++5EX6N8foJjEAJU+Jt/oI7t5+Jlp4H3jQlqtRZQLcvSuJbF4xxWXfHIj6wipoL6pg5dk7mcxmYMhC/dFBhXeQpaJ6MBRP9Uu0SjaR99RVClxAkxzyXTxXUGwK+IbQSJQReOn43Ro5Or//A03Z+gIuJn+AZevUyQ8XuNgD6B2o/PBK0qVVxgeGf4H8mlHZq+KjLntMSnoO+Wt3JFROIXuGix71K+8jLNomp/bnVHIeSYAdes6qM/uGgP/VPKXjE87IqYftj5YBzsdjaptdLr+cco7gzeeBUCIUauod7ddbS4h0Lx0e6GYjvhmJw35acAVQJ/vXjLrzOmIN1HHCx9GM6hwR4f5ozW3B6064hv0j2yS8lDHDqSqf1fhm1nTjFj29V4pZ7HcGK5c9fQ5/3wn7i7jAQ3kljSnNPSzAlzCvg+0ScOSl2E7pQv7cu1dbhzhMDJGFx/7Jy0lcTBRoU0L/y+CuH0dX/IHIP6rVCOQGKTnRtLMyR2ckxpZhamfF8bTCAUbht+As9NN1d9WcKVRRRSfNv3yw5HG9C5OXpmDTf25VkVVVtIG6w+ka0mVCvlCzSojxmc9ECRFV2rzu7HzqpbXFU+jlQLcgKQR1xYttoAkPeJxKbNwFnrWNg0cWUXy4djKH1y+x+8hEGx4U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(5660300002)(2616005)(86362001)(66556008)(66946007)(54906003)(16526019)(8676002)(186003)(66476007)(8936002)(6916009)(4326008)(31696002)(2906002)(53546011)(38100700002)(6486002)(83380400001)(31686004)(478600001)(316002)(52116002)(36756003)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2NnTmRpVmc1OU5PRWY1ZFZBbFJvcWRSc0dlb1lQUHg1NmZURjZCTzh3VGNV?=
 =?utf-8?B?VFoyUHZpaGo1aFh1dWpyNlZ6aXQrcGp2c3g1anhlc1cwOFQydGlIT3QrY0J6?=
 =?utf-8?B?cDFJRHNQd3hNazB1NnpHQVNWbUJKZlFqY211WXcrbnlIeVVWeG1VYjJnZkUw?=
 =?utf-8?B?bVpHeXFZNWxWNjY3d2FtRml3c3p4WkRFOWRRYlRVeU5FYk5uYWVCYkJweGxR?=
 =?utf-8?B?M0hKVmRLSUN1SElIdzNTODVaRnd4b1RvYjUyZXhIS3pKVW9VU1YvWkpXcDlG?=
 =?utf-8?B?bHJ0NWphU0k4SFhoclZQM1FkcHJvTHpmb3VNaVB2L29TWThvRTdzcFdZV2RR?=
 =?utf-8?B?bjRGWmJaUCtOaUxha1pBMDYzMGNnRVNXVzk4Uld2aGRtVk9rVjBtOTZUWmZh?=
 =?utf-8?B?d25RZ3RBakpRUFhpLzQrY1pxbENNR1VZOFNoR1JZRE9LS2doalI3OEtyQUIw?=
 =?utf-8?B?NmFEWThzQjJyQ2tnNW5OQmkwMExVZTRaUmVmdHJiYklkVEpwemxiMFlvRGJq?=
 =?utf-8?B?dDdxNWhrN0NFcndtVC9kNnVlZFNCQnJWTlpQVVFNN3lXZy9raG9aZDFhR3Ji?=
 =?utf-8?B?RUw5Q2pnLzRDR2xNaEVMMkZxbjV1ZTBqeU5OcE5zb3FrU3FXSy9sOFlveDcr?=
 =?utf-8?B?aFlSNWdHY1lyYk9FQXFYZzJ2OURLazUxN0lYNjJJS1p3alE2bnVTSWQySTRD?=
 =?utf-8?B?S0xaazBWWGxoZ1pjeDhQQy9xRVhHb3hNdEE0cG9Ycm1ORkhPMWd0Ri9ZRTUw?=
 =?utf-8?B?ZDQxZzN3Q3VWS3M4NitDcGNZWE5CQzUzME5MUlFxN2dJK2xwR0huOWRhc2FB?=
 =?utf-8?B?U25CVkN5bzRFZXNFUzk0Y2xMaURSc3lRZEhubllvdG9JVmp4TGp3alJwS2tY?=
 =?utf-8?B?d3dKQ0JiM3pvNjFIK2Zmano0UDhtM3NnYzdsQzdaZkwrVHhBYTE4MHFhTFBo?=
 =?utf-8?B?VTVGQzB3SHhyeE1XU3dOMVNMYzFYZVp4RWltVTM1U2hqTTNrS09xMWV5cllY?=
 =?utf-8?B?T2Y3OVU0SnAxTjJTcHlVZVAvTUxBV1RMbktlNXdVUVVjRHRtcnZ5Y2NZenNC?=
 =?utf-8?B?SVhSWmRQSTByaitOVm5JNWZpS2VUZ21CY2JrazVNeGxNOVJEcXZzUCtCenla?=
 =?utf-8?B?ZTgwV2p6VlZpck9BRFVtMkJrckVabVNBcFRNSEI1R0lCQ1V3ZUxiSTVTUzBR?=
 =?utf-8?B?U2hwckxqR0FzQ3pRQWJxT2poYm51Rm9IUndOUHlqc1hRM3hSbFQybnk0OUJV?=
 =?utf-8?B?OGZLajdZVTVWNjFPRXlNY2hKSmR6ME9KR2xKU0RsMGhrUVhDYlp2eDVUQmlh?=
 =?utf-8?B?UzdObHYva0hGNFIwalF1Y0tsN0lBcTFHNjBDYXJmREs0QkMrTktST3N5Uzl4?=
 =?utf-8?B?Qm1Wa3Vzd3hyVU54TWFpckw2R0hYUTRvTWlwcVEzTTYzV2NZVGtuMktISVky?=
 =?utf-8?B?VDFGK3lVWE5Tc3VHbUJRdnlQL2t3d2EreUlwT3IzOERhck0rRlZFcExGUnJz?=
 =?utf-8?B?RkJ2cjFuRzNrZ0p5OE9wT0Qxdk1BUUVWakE5ZCtqUU1oWlFlcFdzdFdBamk2?=
 =?utf-8?B?aDRtdzEvYmNQa2dTbEFORUFXR282amJlOHZCQWRDM3kvN0xEYjMyRUttcEVQ?=
 =?utf-8?B?RlgrNFBkL250enY2NDRQYUUyOXlmNDhHN0ZXNnY5VHE4QVJ4SU9kRkVrVTkr?=
 =?utf-8?B?YXR5L2Vwc0JjUTNqUU1SNEU0azZBNnNocU9tdjBOdEpOeWRNQ04ybGNldFBC?=
 =?utf-8?B?SU1aaFBVQXhDYjlydDNGTGRYa0Jwc2hOVlFNNEh6L3NIeU1jSG1NalptaHZu?=
 =?utf-8?B?V1ZjbGVydzNyTTEzMktjNDFIVVRwZ3FtT05LT1FhN25pYjd5TldHQlR5ZkEy?=
 =?utf-8?Q?vQiR/cSNmVktQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c537a4c-a97b-4dce-86ac-08d9196911aa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 19:22:11.0063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuM4kQKJKK+NOhlpGo4nM9NoXka0WjdINDg5GhHOIoj//11UN1FeL5RY8Kli9s3f0rXWDEMAJXhPteXY4un4Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2496
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-17 2:56 p.m., Alex Deucher wrote:
> On Mon, May 17, 2021 at 2:46 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>>
>>
>> On 2021-05-17 1:43 p.m., Alex Deucher wrote:
>>> On Wed, May 12, 2021 at 10:27 AM Andrey Grodzovsky
>>> <andrey.grodzovsky@amd.com> wrote:
>>>>
>>>> Access to those must be prevented post pci_remove
>>>>
>>>> v6: Drop BOs list, unampping VRAM BAR is enough.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 +++++++++++++++++++---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  1 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
>>>>    3 files changed, 22 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index f7cca25c0fa0..73cbc3c7453f 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -3666,6 +3666,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>>           return r;
>>>>    }
>>>>
>>>> +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
>>>> +{
>>>> +       /* Clear all CPU mappings pointing to this device */
>>>> +       unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
>>>> +
>>>> +       /* Unmap all mapped bars - Doorbell, registers and VRAM */
>>>> +       amdgpu_device_doorbell_fini(adev);
>>>> +
>>>> +       iounmap(adev->rmmio);
>>>> +       adev->rmmio = NULL;
>>>> +       if (adev->mman.aper_base_kaddr)
>>>> +               iounmap(adev->mman.aper_base_kaddr);
>>>> +       adev->mman.aper_base_kaddr = NULL;
>>>> +
>>>> +       /* Memory manager related */
>>>
>>> I think we need:
>>> if (!adev->gmc.xgmi.connected_to_cpu) {
>>> around these two to mirror amdgpu_bo_fini().
>>>
>>> Alex
>>
>> I am working of off drm-misc-next and here amdgpu_xgmi
>> doesn't have connected_to_cpu yet.
> 
> Ah, right.  Ok.  Do we need to remove the code from bo_fini() if we
> handle it here now?
> 
> Alex

My bad, I was on older kernel due to fixing internal
ticket last week, in latest drm-misc-next there is
connected_to_cpu and so I fixed everything as you asked.
Will resend in a moment.

Andrey

> 
> 
>>
>> Andrey
>>
>>>
>>>> +       arch_phys_wc_del(adev->gmc.vram_mtrr);
>>>> +       arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
>>>> +}
>>>> +
>>>>    /**
>>>>     * amdgpu_device_fini - tear down the driver
>>>>     *
>>>> @@ -3712,6 +3731,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>>>>           amdgpu_device_ip_fini_early(adev);
>>>>
>>>>           amdgpu_gart_dummy_page_fini(adev);
>>>> +
>>>> +       amdgpu_device_unmap_mmio(adev);
>>>>    }
>>>>
>>>>    void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>>>> @@ -3739,9 +3760,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>>>>           }
>>>>           if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>>>>                   vga_client_register(adev->pdev, NULL, NULL, NULL);
>>>> -       iounmap(adev->rmmio);
>>>> -       adev->rmmio = NULL;
>>>> -       amdgpu_device_doorbell_fini(adev);
>>>>
>>>>           if (IS_ENABLED(CONFIG_PERF_EVENTS))
>>>>                   amdgpu_pmu_fini(adev);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>> index 0adffcace326..882fb49f3c41 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>> @@ -533,6 +533,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>>>>                   return -ENOMEM;
>>>>           drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
>>>>           INIT_LIST_HEAD(&bo->shadow_list);
>>>> +
>>>>           bo->vm_bo = NULL;
>>>>           bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
>>>>                   bp->domain;
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> index 0d54e70278ca..58ad2fecc9e3 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> @@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>>>>           amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
>>>>           amdgpu_ttm_fw_reserve_vram_fini(adev);
>>>>
>>>> -       if (adev->mman.aper_base_kaddr)
>>>> -               iounmap(adev->mman.aper_base_kaddr);
>>>> -       adev->mman.aper_base_kaddr = NULL;
>>>> -
>>>>           amdgpu_vram_mgr_fini(adev);
>>>>           amdgpu_gtt_mgr_fini(adev);
>>>>           ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
>>>> --
>>>> 2.25.1
>>>>
