Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B676261E45
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 21:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D816E20B;
	Tue,  8 Sep 2020 19:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14A06E20B;
 Tue,  8 Sep 2020 19:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2jK7PQSbw3wlOpc5e/Ct4g1MYeDDfOiWakOit2xPlo29nL4+ulGdREzKgTgT8G5xXqNLUwbxvxdMd794KFujY2Lews6kZxFv+miEMa/wFTXVJx2osAeOLuuljHWF3EBPi4XWEZTIi9GhOT9GVJlZT8k/A3hqG5JEJ5wsC4BxqISdHK3roZDjmDXK6U59AuUcpCX1o6Dm+HLl6vkpi8yBRF9bYwpIav/ZEb7nt/Li1ecYV71yHRjgXn54Mwd3PUdAyEhvZW+TFTrGtwuKck2G0VzR8aTJTtJktPiw9Nu546HGxcwJUYV2M2z4BLoRtRrUTvc6C/+4SfN+pm2llD03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2reqO25Mxanv3ioLO+havKU/nNf3bc4ROVQ06POjdLE=;
 b=UwcwqYVJzzTJAAFerY9tEOWF7m13uuZk83ZwsLfAHl4unXvBMmidNQbKIPhq9aAJHSonNf0QumU4bEYbvDLNKkEnCMjaAIzm6yybUvQ6the2zSTM5ssmxQCItDWS4ImtMYo9Ww+ts4Z9GRBpACt9NJ///ldaM2Sb7lGYrDr4kP3RAzkDYU6Djphb5NHB4TqzUkrFk0SKjkSi1o6sR7oR7xlAPj/ffAu6RGS6D40r9ZKwLG3s+EopRgGCEJkG6c5x9Zh8xeLk/vP5lp1KSOPNCLQKngaJj25av327FAh+1XOsq0fPhzK5Fje7KYNU9uyvBXbIt4D1xw/Dn1g92ZFylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2reqO25Mxanv3ioLO+havKU/nNf3bc4ROVQ06POjdLE=;
 b=CQgcRmdnfgXzjwQvqilY4Cva+dvqbT5Q9CDMexWjrQ9MQVvH0Hc2p27aQFGivoymfB6YRmGlpdu5PTbuNadI3bIdzoFO70G47kkLtdoE2EGImuHyW7hKtBCTZttWtiZpgHs+xMk2AsJTWhRi3+34Ge/+KYc4rXbLMfa1+WXdBDw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4436.namprd12.prod.outlook.com (2603:10b6:5:2a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 19:50:22 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 19:50:22 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc()
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <20200904012218.4971-1-luben.tuikov@amd.com>
 <20200904012218.4971-2-luben.tuikov@amd.com>
 <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
 <20200907080608.GP2352366@phenom.ffwll.local>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <812f524b-08f2-4079-657f-9e00f48e2ef0@amd.com>
Date: Tue, 8 Sep 2020 15:50:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200907080608.GP2352366@phenom.ffwll.local>
Content-Language: en-CA
X-ClientProxiedBy: YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::28) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.35.64] (165.204.54.211) by
 YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Tue, 8 Sep 2020 19:50:21 +0000
X-Originating-IP: [165.204.54.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48342f01-fa54-44d1-333a-08d854306bd4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4436:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4436FF6F4CCBC5548756D8BF99290@DM6PR12MB4436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z6w787luDQIzeyim7dR+baUOajDgBC33pIrOPCkjNoNCrBami5ENwDJOtDIPerzjmzwUzUe4PC5+MYvhna32aGC1qqzOmhb7k/d0Y43+Ie5Yy0QHpz9QGYenkVW9Tqp/kcrw77WymBw1T4eHywjFwG/s913nJmHB9f8gTMRax4iTf2iVD/OAAiaYDdiMsuFrhygwSY14u3y+YIWqz7GwF3RmYtFFpW5WwF9apdpMAb5rYIG43cMDTGPwqSFa9olPd4ND1/lxS/xxXZS+bi8nzqBoURlGKLEB5R38qTM+Cm73DAmfXDxWADmoElfxYjTZGW858d1U5KY9VDjafu9lTBmBht9RfnybBJqpdZRw2CULjPNyFa5sceoXk6lDvXUsVoJYuoa88DmaS9G+8h8M2O4pxXYuL0pNp7MwSLaxG7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(83380400001)(4326008)(478600001)(45080400002)(6486002)(66946007)(8676002)(966005)(36756003)(8936002)(186003)(66556008)(66476007)(16526019)(16576012)(53546011)(2906002)(5660300002)(44832011)(956004)(26005)(31686004)(54906003)(86362001)(2616005)(31696002)(110136005)(52116002)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 9FOlivIyTiavulZ3Frw9VtF9mHY9E5At7mTJFQLaX6p35cCKyJlehJAODT59HUARu94TB+hvUvslYnreEQoeGtMYhqhzLPLcpmsYQQALATsKDgrEq59nP2HkBtsBXAE3dcicerCS3nQBRlCiMBYNz09CNo3kOrMwBpTbMdxJxr0g6Ew8ncUvXSS+Xfo4tC4xKOpoo0UAYYHi7Cw8OO/p7O+XFcAceB5U/jIXA4feb6sp1u7DOCAsPOWusC8wU6i6DCsnoD1h1qzkFJrTH26A/DxY85F5J6EjCBcclm7hvcDZsrlQXU0l0b90aC9wHMEX0pW2u6qc/W+mADbMeK7vwZNmW1ewfRgObhof4PPUfbhmL4OZR0lGUrsbMwCb9u7rnnt47ac26R7JC2E5ax7ZN8edsvamE3V6CtI68OfMHi+VNllHQa++Hlo+x2W36PmuZFdv4Mqjvii5VuZwdBX+IVWY31h1Od/n0IrHGPpQaMVyPH/SpGdcWo+hVsZELCTBSWFkYmaSml6XzJk/vvoUZOQRokAjM+PvzZgQadF626rEJ8Lt83/3jVGytLa3iky+78cmtghIA2FjOZYNiB2xjwwLg30B/JU+RCE0Ah3r7aJRTEGjxkH70BemSMlo4QwtBMSz2sbiLYdRX4DwNDLjjg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48342f01-fa54-44d1-333a-08d854306bd4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 19:50:21.8496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKdPmWO3dYHslMq/uvBwV88Ln3yyBUw6iE0U9ezjdb4T/+NCcGF4c4oCxSuE1kYT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4436
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

On 2020-09-07 04:06, Daniel Vetter wrote:
> On Sat, Sep 05, 2020 at 11:50:05AM -0400, Alex Deucher wrote:
>> On Thu, Sep 3, 2020 at 9:22 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>>
>>> Convert to using devm_drm_dev_alloc(),
>>> as drm_dev_init() is going away.
>>>
>>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>>
>> I think we can drop the final drm_put in the error case?  I think the
>> unwinding in current devm code should take care of it.
> 
> Same applies for the pci remove hook too.

What same applies to the pci remove hook? Removing "drm_dev_put()"
altogether?

Well, amdgpu_pci_remove() doesn't call any devm_ or drmm_ functions--it
only calls drm_dev_put() at the very end. This in turn decrements
the kref and if the kref is 0 at this point it calls drm_dev_release()
which does this:

static void drm_dev_release(struct kref *ref)
{
        struct drm_device *dev = container_of(ref, struct drm_device, ref);

        if (dev->driver->release)
                dev->driver->release(dev);

        drm_managed_release(dev);

        kfree(dev->managed.final_kfree);
}

Regards,
Luben

> -Daniel
>>
>> Alex
>>
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
>>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 146a85c8df1c..06d994187c24 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -1142,18 +1142,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>         if (ret)
>>>                 return ret;
>>>
>>> -       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>>> -       if (!adev)
>>> -               return -ENOMEM;
>>> +       adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
>>> +       if (IS_ERR(adev))
>>> +               return PTR_ERR(adev);
>>>
>>>         adev->dev  = &pdev->dev;
>>>         adev->pdev = pdev;
>>>         ddev = adev_to_drm(adev);
>>> -       ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
>>> -       if (ret)
>>> -               goto err_free;
>>> -
>>> -       drmm_add_final_kfree(ddev, adev);
>>>
>>>         if (!supports_atomic)
>>>                 ddev->driver_features &= ~DRIVER_ATOMIC;
>>> --
>>> 2.28.0.394.ge197136389
>>>
>>> _______________________________________________
>>> amd-gfx mailing list
>>> amd-gfx@lists.freedesktop.org
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7Caa19e7efd2304d998c4008d85304e2c8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637350627736412131&amp;sdata=4LzuUUOQSu5GiYSLfIymvUewNaJwwq%2BJR%2BAK60sfkpA%3D&amp;reserved=0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
