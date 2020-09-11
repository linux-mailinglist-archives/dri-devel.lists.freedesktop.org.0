Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24212669C2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 22:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1076E0CE;
	Fri, 11 Sep 2020 20:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269846E0BF;
 Fri, 11 Sep 2020 20:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hsf+SCGkrsswpwGhilN46ypKPntlYSFwHreBkBhLMmjtiI4+sd776d8uS7PuwA+9tD4+lU/ogH+U0NQ+i4t5p57oDqEhaZYgQPfNCFWt71FhR0C5UIr6wT80Y0EhC3LH1IoZd0xF+oshEkPbN9kdzOqLC9WEmW4mYWm8Hdm19nheOUPINInRWR0NvcJZEV0bdNDPMurE2J+n57h+QfhnuYjZ4L4oHJEwGrrTkjgpd2T4mGi/J0EOAmnbQrzIffYIE5Kya/VURuao4kJU5z3+uUwcGJHRL0sdeqVwnkR9WykPjcbopBFxlme9PJxKPXGsukKxmYHX5imMjrQWd2K0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xepuNOJDUAiZUvu15u7YPooLQWFssVBVOPSAjM0yJ40=;
 b=kJW9NaQMwU5qhHzLloKgk/2ZzxStpaSn/EVLWh66Zw5mJwohRF2SlGle/YCMWtHEOGzT5tTjGMieZEsS/qmh8URTsgML8622fRqJyVquc9xSEsLvqjII7SB8niOw9NUVUmBi8sSQ71T85C2SMhdCU3nTPHiPGor7HTsZ3DZ7ADByoxIEPzNJZN8ras5O19uUOqtYbFWvDM1tzn9Irfx5KVjvnxIFYZkRsL2smWt7M4x5ut2ubbo38HxyP+iEZ22+zZ2BFv+nIamWhEqYzkBpDJamKwPeEu2vPIZyZi6J7BmcjEWFK43i7ra0N+UTmCOymRqDL/z8/qgUuhD2w25/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xepuNOJDUAiZUvu15u7YPooLQWFssVBVOPSAjM0yJ40=;
 b=xzTr6LBNYzYsMFYeeNsiSyHEwcMQqQgniN9a3UY4sVTmJpwLB11qBMRTMtft/z6Xp1GEhzI0Bg4n4YwrOGeYdC/6gFkeaVlLO72QEdedKhxbcW7F+WGmTGhPrqyQtnp/NtGGhgFIOCJ+I6zXOuUIWHvHbT5vllpuAKKbTWVf/zk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB0122.namprd12.prod.outlook.com (2603:10b6:4:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 20:49:58 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 20:49:58 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc()
From: Luben Tuikov <luben.tuikov@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <20200904012218.4971-1-luben.tuikov@amd.com>
 <20200904012218.4971-2-luben.tuikov@amd.com>
 <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
 <20200907080608.GP2352366@phenom.ffwll.local>
 <20200907080726.GQ2352366@phenom.ffwll.local>
 <6b97cb7f-61f2-8e89-c7bf-f98166accf39@amd.com>
Message-ID: <bae5883a-0edd-7510-321f-2ae6fffeacf4@amd.com>
Date: Fri, 11 Sep 2020 16:49:56 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <6b97cb7f-61f2-8e89-c7bf-f98166accf39@amd.com>
Content-Language: en-CA
X-ClientProxiedBy: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.35.64] (165.204.54.211) by
 YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 20:49:57 +0000
X-Originating-IP: [165.204.54.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0f1471a3-c3c2-486d-2f6f-08d856943ec5
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0122:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0122DFFA413B5AFE8E18550099240@DM5PR1201MB0122.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGnTzR3CqJGRyJ73KxQpOMPCxQkA61+XHdLQdb/BLPbJaKWAgqHrcwbm8RBhdE+fI+sh2162/nUckogyxXcceeT5h5Ex/G3hk9Y94YEH/ORS4S2fL1gXHJpF4JtTRkPTAuQ/A5mNns+9tHT6/EQ2a9lGLF6lI4NuCvCVC8Kpfv3g/U14r5Dmo1AlidBx7Una9lhdONI5eYivXlRjLBPfGo1/yXqjwKkSfatzWKw4mupnWry/dRVL6Wy9GrjPo6Ny604A8aZd2taR5EGI6SmWIH61AzdTmxLhGAWVsFSfq/sAZtSr7Ai/PfzkrtCjrE18vEEkdylhz2dHmR0ynDOmPOZa5y4YZPFDzE72mVoaXzDJH8o5nVrUzlYvkQo5lQzXaxG52GY+jGtDtBB/AXoalP7FUgMdbn258IiDHZvaeAms89NSLg9CXS0fiEr7Dhqi0wLS1wFzOmAIukG+7hlwKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(478600001)(45080400002)(956004)(54906003)(26005)(2616005)(53546011)(36756003)(16576012)(316002)(16526019)(66476007)(110136005)(44832011)(66556008)(5660300002)(83380400001)(186003)(6486002)(66946007)(8676002)(8936002)(83080400001)(4326008)(966005)(86362001)(2906002)(31686004)(52116002)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ZsOnTWAm+alG3QfqLYyKWQCMIJ6c2bubcDdpL11YqRQAKPxwDFMxNyF1JJRwUCxN4bpK4HEmK5UlCRcAflWT9UHXSAlXjahtdJrNhKjMs1dLuRpTZp7xZ5YMeNtwDIg46GcYmuMzukagrELEuDmg64QewITnKHP6BLDSONO6l3aaxZtyTxqRvh+DUrF5pTzrwz6M4mLJfgVJEKlrotkZgQEQbbbSUAh8a/SMNAgBsb2P+RC9OpnI9nmKcW/1S5vIq1p2C9Cn6HnJAqYgG4WVtjLVSyFHTENTKhfgsn2mTNRl54zuS2BBUcLqKrj/0P6BDEDNPk5C0atx3y1nx1qJGGISNhze9BCEe58qGthLdiSIJ0C64HUsITcyvYJ6sVjFTPMtEf4+3qtEqBK4XzczcZjljER4Q9UqLrbGd0LZg6SVsRazgqZzR1onuxb6lzsilWMSYo4LugLSXSgAX2drvxwFePzsuVLm6PjVUQ5Y9FSZBADtK47YTyDqkNS8kZkWdGh2hjjsZ2DpO6nhG0Iy2ABmmZgccWC675mUFK6Kpgy3Mhd7w/sm/kyIO4tSUUw75F0d+jHBDUAmDe4fdxRlH0HJ5pao8ycsuJ1Gc5FlQ4/HsXCdPUZxnAG44H66Yyd520XMIPJYnhghMjmAGNXHOQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1471a3-c3c2-486d-2f6f-08d856943ec5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 20:49:58.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FBcoK2QRSD6byrcdI/cHbP/aM4+992QguB/Uap1gaJEpt4sadF6lRavB6L+Slpx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0122
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-08 16:09, Luben Tuikov wrote:
> On 2020-09-07 04:07, Daniel Vetter wrote:
>> On Mon, Sep 07, 2020 at 10:06:08AM +0200, Daniel Vetter wrote:
>>> On Sat, Sep 05, 2020 at 11:50:05AM -0400, Alex Deucher wrote:
>>>> On Thu, Sep 3, 2020 at 9:22 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>>>>
>>>>> Convert to using devm_drm_dev_alloc(),
>>>>> as drm_dev_init() is going away.
>>>>>
>>>>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>>>>
>>>> I think we can drop the final drm_put in the error case?  I think the
>>>> unwinding in current devm code should take care of it.
>>>
>>> Same applies for the pci remove hook too.
>>
>> KASAN run with unload should have caught this. 
> 
> But it didn't? Why?
> Could it be that drm_dev_put() actually got
> the kref to 0 and then drm_dev_release()
> was called which did a kfree()?
> 
> Could you try that same unload KASAN run but
> with your suggestion of removing drm_dev_put() from
> amdgpu_pci_remove()? What do you get then?

Hi Daniel,

Have you had a chance to run this unload KASAN run with
your suggestion of removing drm_dev_put() from
the PCI release hook?

If it "should have caught this", but it didn't,
perhaps it did catch it when you removed the drm_dev_put()
hook from the PCI release hook, when you did a KASAN unload run?
Showing that drm_dev_put() is still necessary, since,
1) we're still using kref,
2) kref is kref-init-ed under devm_drm_dev_alloc() as I pointed
   out in my reply to Alex in this thread.

I believe KASAN (and logic) show this patch to be solid.

> 
>> I strongly recommend doing
>> that for any changes to the unload code, it's way to easy to mix up
>> something and release it in the wrong order or from the wrong callback or
>> with the wrong managed (devm_ vs drmm_) functions.
> 
> Sorry, I don't understand what you mean by "doing that"? Do
> you mean "not calling drm_dev_put()"? Sure, but what
> are we supposed to call instead?
> 
> I also don't understand what you mean by "easy to mix up something
> and release it in wrong order or from the wrong callback..." etc.
> 
> If you want things to happen in certain order,
> you can either put the correct-order-sequence
> behind the non-zero-->0 transition of kref, say in
> drm_dev_release() as it is right now,
> 
> static void drm_dev_release(struct kref *ref)
> {
>         struct drm_device *dev = container_of(ref, struct drm_device, ref);
> 
>         if (dev->driver->release)
>                 dev->driver->release(dev);
> 
>         drm_managed_release(dev);
> 
>         kfree(dev->managed.final_kfree);
> }
> 
> Or you can remove kref from DRM dev (which I do not
> recommend), and stipulate the release sequence
> as I asked in Message-ID: <165961bb-3b5b-cedc-2fc0-838b7999d2e3@amd.com>,
> "Re: [PATCH] drm/managed: Cleanup of unused functions and polishing docs".
> 
> Then we can follow that and submit patches to conform.

Eagerly awaiting your response on this so that we can conform
to the direction you're setting forth.

Are you removing kref (release() cb) from DRM and if so,
what function should we call in order to do the "final"
(although without kref, the notion of "final" is obviated)
free, OR kref stays in and this patch, which conforms
to using devm_drm_dev_alloc(), as postulated by you,
can go in.

Regards,
Luben

> 
> Regards,
> Luben
> 
> 
> 
>> -Daniel
>>
>>> -Daniel
>>>>
>>>> Alex
>>>>
>>>>> ---
>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
>>>>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> index 146a85c8df1c..06d994187c24 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> @@ -1142,18 +1142,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>>>         if (ret)
>>>>>                 return ret;
>>>>>
>>>>> -       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>>>>> -       if (!adev)
>>>>> -               return -ENOMEM;
>>>>> +       adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
>>>>> +       if (IS_ERR(adev))
>>>>> +               return PTR_ERR(adev);
>>>>>
>>>>>         adev->dev  = &pdev->dev;
>>>>>         adev->pdev = pdev;
>>>>>         ddev = adev_to_drm(adev);
>>>>> -       ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
>>>>> -       if (ret)
>>>>> -               goto err_free;
>>>>> -
>>>>> -       drmm_add_final_kfree(ddev, adev);
>>>>>
>>>>>         if (!supports_atomic)
>>>>>                 ddev->driver_features &= ~DRIVER_ATOMIC;
>>>>> --
>>>>> 2.28.0.394.ge197136389
>>>>>
>>>>> _______________________________________________
>>>>> amd-gfx mailing list
>>>>> amd-gfx@lists.freedesktop.org
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7C0c811cf4c16d4f79bc0d08d853051125%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637350628521258815&amp;sdata=k9GiFNi%2Fu6Y1AlW7ea1cQINYigfYbrvPk2RkmUJkY8U%3D&amp;reserved=0
>>>
>>> -- 
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7C0c811cf4c16d4f79bc0d08d853051125%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637350628521258815&amp;sdata=aIT9t6q0qCTy%2BZhHPH0XIJgZ%2FYNF8xwzAQ2HlbxxMDk%3D&amp;reserved=0
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
