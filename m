Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C7261DD6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 21:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D566E1B1;
	Tue,  8 Sep 2020 19:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2710F6E1B1;
 Tue,  8 Sep 2020 19:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpcbdFgh7tEqmOX6vWKSPug3atkJiQzlAu0z3Zp0i23jt+xlEz6+THNYfkz4TxpVv24exByug7RayclGcmb05E+WdjUgmZnDylCWUF/8b3o8oBxdaWQDW87InErXeuFQiVF7/Wt8iPjGgAnLVLb7QLtNwNuR6FO+uQ3Z+9eExI7vbU5x+RnunbsyKfeFDDfCXR5Pt5v0Ty4zal78ueMOjVsepvbJvUmerE2H9CrgP5cqqjBNI3PLZgKBShZADKQCC+82Su42WGwKhP50GHffaU79sPIy5ax4HcMoUo6tBWMersBXCYYd95BJ4kdEP2Tydf+SHqVMP9IvTqIE+o3D4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3Bd0kGfWwBh5+8MHbjl8s28BQEIb0uVxk3wBRqKPxc=;
 b=dMPrlK0A26wTceSR69GA0/2UorSSh5XbPfVY/kL8SEVNmkkiEGJ+5QQT5sH3yLc3qQEmLZohQ5Cs6q1oKGLx+QpsZMqbxhlaNyg0e05Sl+p3NLOP5Z8IOegs8j3disGll9UG3d8GhVc97/QKLwrxMCzv9hbYOLySp2c61n+INyqUz7RjnED5XgVT84N2U+MXXzNunsHIOux/UueqN/kiRSrd/yc3xv6BICLollj5foBefPwhnxj/pxAlekLQOD1FZ2Es0JM26tvq6KpPzCa8uHorhrqGgwLZ9p8PWnYygdWLvZ+DRf825bHVH4Yu4QyNj09Aaq7LItFCdsfGqHkSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3Bd0kGfWwBh5+8MHbjl8s28BQEIb0uVxk3wBRqKPxc=;
 b=AN84vfyI2/2qraL9TOoCVGA6GHqIsxqqfNrMDGP4xAlI3P3JeWlzjKxLcc6vUkaiD2/vh0W7aSAjbGeRldTrVDW6Dg2dlZSTmUt0faKrSwGsYZe6hOVn9EwhTt0ehGoc+xzLeJ1T+21WQ6aWJmLQa/MQ91lQI7qywARZZ8wuJDc=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3691.namprd12.prod.outlook.com (2603:10b6:5:1c5::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 19:43:03 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 19:43:03 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc()
To: Alex Deucher <alexdeucher@gmail.com>
References: <20200904012218.4971-1-luben.tuikov@amd.com>
 <20200904012218.4971-2-luben.tuikov@amd.com>
 <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <43526b84-53d7-3ea2-165f-345666a5bad2@amd.com>
Date: Tue, 8 Sep 2020 15:43:00 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
Content-Language: en-CA
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.35.64] (165.204.54.211) by
 YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Tue, 8 Sep 2020 19:43:02 +0000
X-Originating-IP: [165.204.54.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 17da95b8-bd2f-41c9-424a-08d8542f667d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3691C6D590CF4657F23FBCD999290@DM6PR12MB3691.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YpT91KiMZbYoL4353LHH1qXz0Gl1p8JsEdCPd7CI/VAaktVUot2UYdA3UTPBaEGOIeeqRNDZfAp9Pz6ktB8EnM4rFppBjskIlPJ5WgRVAnFcw7KQWk7X6KqSyWIOtZKpljiCPQZ99iTtjkeTN10bv2wWopIG5bqyTpI1vOwbmh0SgBQXod20jGD2nOUNAuXI/gJdgwOmO5CJCs+3rt2pauY7BdVHtYFTEq6YjLyVGu2gdlwVJ/0B02vOt7hcKm0bGIpjkmQUgzpRsUIVinRD6P+W0R/I+VYZEMOM8TOtbywUsMRM9fs65C3YG6YXa6BKyIbUGu2zZJbY9K4gnshQrLP1ZfoJ82SB2JxCR0vhj+zZbjg2Ay2HdjgholFfKE/Mu1t9/SFU4MayTxpwoTE6fQlgKnn8E6W1ICi6ifT7dQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(6916009)(8676002)(2616005)(956004)(54906003)(44832011)(966005)(53546011)(478600001)(6486002)(45080400002)(26005)(52116002)(36756003)(83380400001)(186003)(16526019)(4326008)(2906002)(316002)(16576012)(31696002)(5660300002)(31686004)(66476007)(86362001)(8936002)(66946007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PKmGjpEYgVNw9tyXhdHCDDpm79uT7n9zVtc6qZJCs+T893DZMLPLX2FNk0cTXcJp/AySR4yyKWSkViYkcPua0DhJVGUrj7QOKO0XEYsvGDhJyQeAvM3JLNS4AdYusK2oaudB5ZK7wOC0Z0x1XwP2n4UZoXVMM5keQjiPSFyXosnKc5W+Ljt9jgHtnkqE+qVW3eCIUkPzwP8Dw3y8FWDs+SqJosmA5ax0F+2SnhIN6Bx4jLu4ImfebHjaLd+Q2XYxhHsru9E2avXLs/VdkaUxHLJomPbhx6zJT1fkD11zyKKmx40oVZmPu2+WfChDxe5A/CJ2dK0LWee+wptURlahxaRYzN5W9I+JaoDUSQipjWdE+9u7GFWBXDaDFmNentocchyrKaHzbAoZun3DmWDYiXgKGdVq8Y1qyLpQjll62CXEQp4r2kjM0ysgZbSou1Vq76iUWS8pwf2xmSCk1CuWX28SojJgxF8M3pqQjo5IBOoEnHkVFvlMz9+rLeVYTFRKGTE4O5yZIeJM2heo9P+d9hBJzIiDZjSgaqYIsShoYOq/9CO7ZNC65HvnitcytN8TN26AHgIimixWcvC3ub6/uQxK9KkUKbkLrKmDuHPIxNS8ASgNA9kJlMCC7Y+hkUxbf323VB+6VYTS9mvhLpjeuw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17da95b8-bd2f-41c9-424a-08d8542f667d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 19:43:03.3635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWsPVFRbBT/NB13VVRV++yuQ1gZLbc38Uzja8Ovm6CoiiOkd2MenBf0FYTJw7FpR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3691
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

On 2020-09-05 11:50, Alex Deucher wrote:
> On Thu, Sep 3, 2020 at 9:22 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>
>> Convert to using devm_drm_dev_alloc(),
>> as drm_dev_init() is going away.
>>
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> 
> I think we can drop the final drm_put in the error case?  I think the
> unwinding in current devm code should take care of it.

We get to the error case if devm_drm_dev_alloc() succeeds,
but we get an error thereafter, thus we do a drm_dev_put()
past the err_free label, all in amdgpu_pci_probe().

However, devm_drm_dev_alloc() calls devm_drm_dev_init(), which
calls drm_dev_init(), which does a kref_init() on &dev->ref,
which sets the kref to 1.

The drm_dev_put(), in the error case, would decrement it,
and if it is 0 after being decremented, then drm_dev_release()
is called, which does the "managed" free.

Regards,
Luben

> 
> Alex
> 
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 146a85c8df1c..06d994187c24 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1142,18 +1142,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>         if (ret)
>>                 return ret;
>>
>> -       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> -       if (!adev)
>> -               return -ENOMEM;
>> +       adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
>> +       if (IS_ERR(adev))
>> +               return PTR_ERR(adev);
>>
>>         adev->dev  = &pdev->dev;
>>         adev->pdev = pdev;
>>         ddev = adev_to_drm(adev);
>> -       ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
>> -       if (ret)
>> -               goto err_free;
>> -
>> -       drmm_add_final_kfree(ddev, adev);
>>
>>         if (!supports_atomic)
>>                 ddev->driver_features &= ~DRIVER_ATOMIC;
>> --
>> 2.28.0.394.ge197136389
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7C17ffbdbf1cfb4aa34d1c08d851b362cb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637349178195046108&amp;sdata=tSTqRZ27GuQVAP8g7jmXAmM%2BhiGn3RUa72flIapYp9c%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
