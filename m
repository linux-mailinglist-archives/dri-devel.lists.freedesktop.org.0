Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD2D26200D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 22:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B836E20D;
	Tue,  8 Sep 2020 20:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8326E20D;
 Tue,  8 Sep 2020 20:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaytlSiKb0WYcsvXJcnZBhDwuhyTR6bwN6bd3nbXckXUcwJd6jA/GSbHqoKDvaCJnUf643AY+XqEToXfO9GJKrBXqLBHfJHS5xBGAAfWBJ/OvrWxddk/6MJ897y4vg0q7QYPUEiQRhA/GJj1YgN+Jf63hcl5oHi8nQxDwPIEurzhKRnAjyywVhw4rtv5eZj3dyiGH7dxdmq0lOz71acvwDg6ngAhZyo/3Byc8UfkJ0aMWKxTSZ3HH2LzNN59yuQD5QJi046drH412vJIltgPHq8sjsFv8SRHnA8LbGPVQ6NcB6NWBTqZLLp75QlY7TPxZSrDPT2DwyIR8rBpdobL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4e+5MMIIL+Mvs1LnNMPKLxEXV+yDw8b76dG9Tv/uDQ=;
 b=lY22Vbj7jkVOGDSE3vkENry0Ulf+vqiAWiasEd6F/oCtvzbMaUpjDb6r/ZVGRg/LmkTu9/G5v2HDhoxk0whYXqt5Io08RjN3NQuzfm56Ipyz4daA6IOBLRPsgYvAn7pYF4GMxodF3IZIngDbpwn9y8lmXITGemN1BFtgJgmiPcrX0jo1v1JB+rL3dw1bE0NWPU7Ls4pZDJpR3amFAPloRptQHP/PdnIZrIy3mcDcOfaTeuNTPpfckysWveqv6OnhWeSqzlOluyUn3mbio+yQXDRNVC3oHvYcxduHO+3SXDM03f8y95/W6hCBWYHrJprY8Q78701eciuBi11Hdrecyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4e+5MMIIL+Mvs1LnNMPKLxEXV+yDw8b76dG9Tv/uDQ=;
 b=KyuYG9MMl6M0tXHHfwZC9U7ZzOcq79gLDcwT+Z1/WEhaKvZxsjSlmJWOu9DSIC1eVfuPpdj0OzN1amNTPUangIp08sn4lMAnfvEUGumHmpQt4TJwGsPwo/g9maFjZ1RMfMOOTH0RRq8S6XaelmbtjhXWmC8eP2FMM3NZo1tEdd4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 8 Sep
 2020 20:09:05 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 20:09:05 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc()
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <20200904012218.4971-1-luben.tuikov@amd.com>
 <20200904012218.4971-2-luben.tuikov@amd.com>
 <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
 <20200907080608.GP2352366@phenom.ffwll.local>
 <20200907080726.GQ2352366@phenom.ffwll.local>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <6b97cb7f-61f2-8e89-c7bf-f98166accf39@amd.com>
Date: Tue, 8 Sep 2020 16:09:02 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200907080726.GQ2352366@phenom.ffwll.local>
Content-Language: en-CA
X-ClientProxiedBy: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.35.64] (165.204.54.211) by
 YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Tue, 8 Sep 2020 20:09:04 +0000
X-Originating-IP: [165.204.54.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 974209dd-56d8-430f-4cdb-08d85433097a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4075:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4075BBDC2B5BCDBF51E2403599290@DM6PR12MB4075.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flxaznIkBA/bztuMTeYAVMvf1YfE9Y2aXF72BSNafXK9bbRYSczovsXhprK2UZ+I3rKw8I22n+n43EzSKY49gQL9/dVbDdICWy2oGY+h1APwf/7yGZrBYbXw5htetDZ2NB7kgSxT5qrRrJoCpS72yKbNG7R0jA768/3QYYBqS2RB9K5ocz0Wxvydv6YWkA8L+NYwexmIGXr5kc1Kvw7/eI75lB1lxwdq8C3hyZ4woUR7vvW23kE6wmuZZb35ZqUkI5m+tEPL/SZG3VEDSAP0D4Zwq+IDtfccXdOxBs658linwmfaFQHDqHLrtYOMk3lBfyk9Y+Z2auH+veGoyGnX8amRwqO5LqbmA0P098bjs+5TBW6vRKAQz5egq4NEYwFKIxW3G5aAzRM6ME6atYFZGsQVWj2Tgqn73v7exJPwd0UoEJWMSSmZ5cdz6CsxiFX7+5kLlISkYA0861vIjwOnKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(2906002)(4326008)(86362001)(54906003)(2616005)(956004)(31686004)(6486002)(83380400001)(36756003)(478600001)(31696002)(45080400002)(83080400001)(44832011)(8936002)(8676002)(26005)(966005)(110136005)(52116002)(316002)(186003)(5660300002)(16526019)(66556008)(66476007)(66946007)(16576012)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lzFUMu9pKDcbKVtFoKn0+xN8xYj2c/JDijLL+tHJ7j3S2SVECoQtGTyoG9t3wVPCL0EsRrBoPbDsTMj3Zh2FfB7Qaw6vozFrTH/blbpdoE4QAQ2N4wSHaeit6wYLew9cmg9woyo/ugtCE1TE0P/xpBtPdFop9tD1c2qbNfPkt0dCt27RD+UWlTujPWIEvwppiTm5JdpjBlEChqgxN95m8dUDrtaBnhxMKtqZU6VXjzW0TbrcyeFzf1PqgkzxYN4taztqPlrUN+s+pOYzhfGCzKkRu8zKyALrSMJuXjFLT6oNPnYOBV+lD9IvE/LOnpP6IRP/s5BQqV8R32K3kP6gJwENE8Iah6c+mwr1B70nHWr8r65gBQJXDxGFBefDwICiBxIl5l4DIylPhsZmbo0bF1PHXdoA1SwvKeIbYYOJTC3N1u5wMqQabdCaunLyFc2+gew093B1PHZXfmAGGxuisOqEAcibHu7NSvXpVoDBA7X8/wReZBptsWd+x4o5xcZ3QX/hvHKWWdPD9XvRpUuPBFEuBw5/MHXbhKDyLv1SieiJrhMZ96eIlrGLc6BxBBZ8EjubYWIMwuNBr0ydjCFaSLGolmXFE40iFSFFxoVua7lkKouQRg22f+L8FhHXoosIcqX9npYCIG/dliE0NhFF5Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974209dd-56d8-430f-4cdb-08d85433097a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 20:09:05.3439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkF9kHxXg/1eSreqUPG4GdvqTxIynK8tcBXnFzBfoAx3O9jzst/4sJ1w6Pqvc286
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-07 04:07, Daniel Vetter wrote:
> On Mon, Sep 07, 2020 at 10:06:08AM +0200, Daniel Vetter wrote:
>> On Sat, Sep 05, 2020 at 11:50:05AM -0400, Alex Deucher wrote:
>>> On Thu, Sep 3, 2020 at 9:22 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>>>
>>>> Convert to using devm_drm_dev_alloc(),
>>>> as drm_dev_init() is going away.
>>>>
>>>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>>>
>>> I think we can drop the final drm_put in the error case?  I think the
>>> unwinding in current devm code should take care of it.
>>
>> Same applies for the pci remove hook too.
> 
> KASAN run with unload should have caught this. 

But it didn't? Why?
Could it be that drm_dev_put() actually got
the kref to 0 and then drm_dev_release()
was called which did a kfree()?

Could you try that same unload KASAN run but
with your suggestion of removing drm_dev_put() from
amdgpu_pci_remove()? What do you get then?

> I strongly recommend doing
> that for any changes to the unload code, it's way to easy to mix up
> something and release it in the wrong order or from the wrong callback or
> with the wrong managed (devm_ vs drmm_) functions.

Sorry, I don't understand what you mean by "doing that"? Do
you mean "not calling drm_dev_put()"? Sure, but what
are we supposed to call instead?

I also don't understand what you mean by "easy to mix up something
and release it in wrong order or from the wrong callback..." etc.

If you want things to happen in certain order,
you can either put the correct-order-sequence
behind the non-zero-->0 transition of kref, say in
drm_dev_release() as it is right now,

static void drm_dev_release(struct kref *ref)
{
        struct drm_device *dev = container_of(ref, struct drm_device, ref);

        if (dev->driver->release)
                dev->driver->release(dev);

        drm_managed_release(dev);

        kfree(dev->managed.final_kfree);
}

Or you can remove kref from DRM dev (which I do not
recommend), and stipulate the release sequence
as I asked in Message-ID: <165961bb-3b5b-cedc-2fc0-838b7999d2e3@amd.com>,
"Re: [PATCH] drm/managed: Cleanup of unused functions and polishing docs".

Then we can follow that and submit patches to conform.

Regards,
Luben



> -Daniel
> 
>> -Daniel
>>>
>>> Alex
>>>
>>>> ---
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
>>>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> index 146a85c8df1c..06d994187c24 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> @@ -1142,18 +1142,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>>         if (ret)
>>>>                 return ret;
>>>>
>>>> -       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>>>> -       if (!adev)
>>>> -               return -ENOMEM;
>>>> +       adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
>>>> +       if (IS_ERR(adev))
>>>> +               return PTR_ERR(adev);
>>>>
>>>>         adev->dev  = &pdev->dev;
>>>>         adev->pdev = pdev;
>>>>         ddev = adev_to_drm(adev);
>>>> -       ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
>>>> -       if (ret)
>>>> -               goto err_free;
>>>> -
>>>> -       drmm_add_final_kfree(ddev, adev);
>>>>
>>>>         if (!supports_atomic)
>>>>                 ddev->driver_features &= ~DRIVER_ATOMIC;
>>>> --
>>>> 2.28.0.394.ge197136389
>>>>
>>>> _______________________________________________
>>>> amd-gfx mailing list
>>>> amd-gfx@lists.freedesktop.org
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7C0c811cf4c16d4f79bc0d08d853051125%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637350628521258815&amp;sdata=k9GiFNi%2Fu6Y1AlW7ea1cQINYigfYbrvPk2RkmUJkY8U%3D&amp;reserved=0
>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7C0c811cf4c16d4f79bc0d08d853051125%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637350628521258815&amp;sdata=aIT9t6q0qCTy%2BZhHPH0XIJgZ%2FYNF8xwzAQ2HlbxxMDk%3D&amp;reserved=0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
