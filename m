Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D032F647C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 16:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FBF6E426;
	Thu, 14 Jan 2021 15:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E4B6E429
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 15:27:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAdV4guOsAl/g3r6h6sheXjNSMpluUgmSk+LWTnpJbAK+bsdVXB/GLK3vEVQs89aQSZ5FDFuCfDHjfbic4cQbZAeJouQFf5hNXZJmcZQFsfmh3oS9xssGe6Y7BKQgwbrriKpYT2c5Zw3j16WxKEG9tv8oxmG5ET5bGWsKS0aibyUa6+yTNB3jp9KtivpXfTxkNWMwPEabnvQcTkdyNk+lczDibHXXlKOlxZmB3BBRbmHQSzPdvmqABpQuwnJJCiZ1p9uyV/lwz/snJWNYwTM04w7U3ID1s73tCUNw2gRXcu9z53IOsGwn2Iev99kYO6gBEI12APHwosAFNzul6/FMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4nlda8W1Y1fdVDW/9wylOl7ymCmhuSoIMqKrJS65No=;
 b=HKl3E8pf1n6ugseIWGgkNCJlfFm2dRKOt6OAMfuCnzKyMJz1MiN/fsXZWQ6mNpHY13kFsQhg4wyRobzV7+nR/rrbvJq25w+BHcT+kB6cAlpBda5e3IbsqrXpzpKGrP7wasnjOi7zipE9xEz+IWwDRgHysShThjTIgTAfkbYRR177xH3SWl1utesb7qNrxfnVnURO3B7PNqVdrCI3LGlTVQvflZEh8/IAeM7t7KVQK5aI6+fIqgnX+bmDRL7acJkE8/Fe3Hn8J77wI9Q8oTeukA7JNkXKbzkOt1Q0H1fap1Wuhb688gDVENOP924JA693WTF2Oej/a5E43xWDijvkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4nlda8W1Y1fdVDW/9wylOl7ymCmhuSoIMqKrJS65No=;
 b=L5SaMhyMkmTs4ClsFkXpOIakFrqsozbU8Fe3uEDLNY1nIcEN52e7Imvg6LzfhZj5rQLRIdtu/RpBreiNxAVFs06lFwPQB/aW8tX02hs0PfKnfWaVSIoI0vyIFlVZEv9tcBcJmDtuqnibx6bHyRu9YafIT9zZQ58aD1PaIZYDr9w=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by BL0PR05MB4804.namprd05.prod.outlook.com (2603:10b6:208:2a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2; Thu, 14 Jan
 2021 15:27:03 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6%7]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 15:27:03 +0000
From: Zack Rusin <zackr@vmware.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/vmwgfx: Drop svga_lock
Thread-Topic: [PATCH 1/3] drm/vmwgfx: Drop svga_lock
Thread-Index: AQHW6L/R4odxZD4Z4E+XLyWi283KU6onQecA
Date: Thu, 14 Jan 2021 15:27:02 +0000
Message-ID: <A16DCE54-A884-4489-AC49-CE3FFBA5C351@vmware.com>
References: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
 <CAKMK7uFjeJHS9siPfY4swYyHi92Ee2eEVw1syQ0h-efOHEKPig@mail.gmail.com>
In-Reply-To: <CAKMK7uFjeJHS9siPfY4swYyHi92Ee2eEVw1syQ0h-efOHEKPig@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4aa3e7c-f237-4900-8535-08d8b8a0d7f9
x-ms-traffictypediagnostic: BL0PR05MB4804:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR05MB4804932FD73FF45FFC9B2EC8CEA80@BL0PR05MB4804.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nt9cT5Qn1h9lJ04CHQrs123G7L39ZHROxmCV6GrzRyreR3Wnu7vfbudOPbur09iLO+v4nVTB8vWmM4Ak3BHwpD59H6JXvcW7pzzO9RltX/dO7NG1t4B3PrKbgwgyG7Cb/GdXf2cEB8NarBb3yAgwQlDNDrhjSDRdasAK/QFB+3yNMJNPm2xOlUsk1nIdZ3qTHoQP6oL2Y7suw3dDRcFGqv3oL3T0PljZNn+fMWzCD/RiMjYrUQserj++dFlQC13NTyfs2qJ4I5VELHAZvA8G8n1ap34v8DaibLK4uQe7eEf5bu35FkGb4YJGmIgxrfSl1DCovgQm+BstUZLk2ziUKtjgRVqLlqJf+TPkv7J8iRPG7pf+73OSG1wdKAwJEiPRGDIYhK1HAqGN8Sbf7U9whA4A3AZLs5nQ/NRTHKyym2JlzO58cSFntgRuV608q0ea7qr0+kvy9qr9uPeY2aYTrOFopiicPXMgTdO4xGd0HNfmOjS8BpiDysa6J0ktOTDmhGjbNla7feYYyiDdm5RhsJT2U6herUOX1jm7lkDAKYeFuJH/Agl1DsqiQCox9kql
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(5660300002)(64756008)(66946007)(6512007)(66476007)(6486002)(478600001)(36756003)(8936002)(6916009)(2616005)(316002)(66556008)(83080400002)(66446008)(26005)(86362001)(76116006)(45080400002)(6506007)(53546011)(2906002)(71200400001)(966005)(33656002)(54906003)(4326008)(8676002)(83380400001)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pThk8S2DhMHefwO7L7dA4imvr4nDQKlmmPJOZBANm26+azBZuG7UnFSjaMus?=
 =?us-ascii?Q?NTFYJBi/2klVp1cCV+b8j3AGOW4zKS1DZcVbefHJTO80Es3AwOoe64pmzJgf?=
 =?us-ascii?Q?8MpnF+ivNxAbWc0puv86VV2HKL8smblFNiCodIvqdGTEugtYPG3Isx/+rvXv?=
 =?us-ascii?Q?NMDQQDJQQ1tTIsrilIl7ht8hhjQ380RATolmQ59Ue5ZbskI+PgZUtoTXxKES?=
 =?us-ascii?Q?jHaGEKEyTmQUyMkTmHCPdUqpFM3r1FduUNsGEMCiSmr6qpxsOK70klEyAQ5D?=
 =?us-ascii?Q?HAvi5FCVLe7Tnkw1/81WyzR1K6E5yvKqID3vETqbswRlYPck0x2T2Q5dMxhL?=
 =?us-ascii?Q?LbngvU3cgOi1O1mpEoNG+FGsHDWCq56kC7+07hpdWZ6B9Tj634eUTm3WLxO3?=
 =?us-ascii?Q?gs51YChcKJQoGxNoW9G6H2HqMHI5g9Pfcidd2d7JJwumeZgbE24tMT5Xe8DO?=
 =?us-ascii?Q?Hfy5GOVvyLaA1wdgAb36EPpbs8o1NwJMrqT+dIoOEIkMGegeUYVg/N/GdDqI?=
 =?us-ascii?Q?/P3ahxxADJ8Cee4spwf2yQA0LofUq2q8nOo+QDK+N74wXlTM7lT3rMm3PkfH?=
 =?us-ascii?Q?PRvaSjP9Z+dtKrQsUZKTd+e2PZgoMfpBdLzfaYhezG4A3ReQO/K9Q/ghxIzQ?=
 =?us-ascii?Q?xPswKppfapWdlPRpoxDyx0dEVnayoamnu3jmbz+Ag5IrYAXOqFVW2LkC5CnP?=
 =?us-ascii?Q?h/ybsbQ4yTmRzibp6ZnTgTUANcAIvK6ixxkAB3tdG87JFUbjtsEYSNUZlbgp?=
 =?us-ascii?Q?5dZph60ioZV5e8punIOw3D1mgnkcPaf0fU4k/IDUalOGgEbG61iBN3305H2L?=
 =?us-ascii?Q?XBDXyJf1Nb37eVQdGUvW31rpxDvm/MiDOxehXK00LthHRPmEVGTP7pC6EhFc?=
 =?us-ascii?Q?anMrAxPTOtpVPV80SRWKWuzIsp3H9Z4z3g8dnBIZsoYKief9Ytv8vB8CpwCV?=
 =?us-ascii?Q?xJsJcbHUg6+AFq8sq9T2JoSJdhkJ6b84cFHI0TrzfSLadtW7DHHQkOAaSjWm?=
 =?us-ascii?Q?A5pk?=
Content-ID: <81834B1888CA964A8940D89966052DD9@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4aa3e7c-f237-4900-8535-08d8b8a0d7f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 15:27:02.9448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I/7+5biQGnNOl/3BG7wdkGf6q1u0VNzGWgqUBR586YN3QpYu7EwqqeaNat0lM5vzbw5ZN6k6k/Hl52tfJ2RDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB4804
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good. Thanks!

Reviewed-by: Zack Rusin <zackr@vmware.com>

> On Jan 12, 2021, at 03:49, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> 
> Hi Roland,
> 
> Hopefully you had a nice start into the new year! Ping for some
> review/testing on this series.
> 
> Thanks, Daniel
> 
> On Fri, Dec 11, 2020 at 5:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>> 
>> This isn't actually protecting anything becuase:
>> - when running, ttm_resource_manager->use_type is protected through
>>  vmw_private->reservation_semaphore against concurrent execbuf or
>>  well anything else that might evict or reserve buffers
>> - during suspend/resume there's nothing else running, hence
>>  vmw_pm_freeze and vmw_pm_restore do not need to take the same lock.
>> - this also holds for the SVGA_REG_ENABLE register write
>> 
>> Hence it is safe to just remove that spinlock.
>> 
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
>> Cc: Roland Scheidegger <sroland@vmware.com>
>> ---
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 10 +---------
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  1 -
>> 2 files changed, 1 insertion(+), 10 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>> index 0008be02d31c..204f7a1830f0 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>> @@ -672,7 +672,6 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>>        spin_lock_init(&dev_priv->hw_lock);
>>        spin_lock_init(&dev_priv->waiter_lock);
>>        spin_lock_init(&dev_priv->cap_lock);
>> -       spin_lock_init(&dev_priv->svga_lock);
>>        spin_lock_init(&dev_priv->cursor_lock);
>> 
>>        for (i = vmw_res_context; i < vmw_res_max; ++i) {
>> @@ -1189,12 +1188,10 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
>> {
>>        struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>> 
>> -       spin_lock(&dev_priv->svga_lock);
>>        if (!ttm_resource_manager_used(man)) {
>>                vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
>>                ttm_resource_manager_set_used(man, true);
>>        }
>> -       spin_unlock(&dev_priv->svga_lock);
>> }
>> 
>> /**
>> @@ -1220,14 +1217,12 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
>> {
>>        struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>> 
>> -       spin_lock(&dev_priv->svga_lock);
>>        if (ttm_resource_manager_used(man)) {
>>                ttm_resource_manager_set_used(man, false);
>>                vmw_write(dev_priv, SVGA_REG_ENABLE,
>>                          SVGA_REG_ENABLE_HIDE |
>>                          SVGA_REG_ENABLE_ENABLE);
>>        }
>> -       spin_unlock(&dev_priv->svga_lock);
>> }
>> 
>> /**
>> @@ -1254,17 +1249,14 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
>>         */
>>        vmw_kms_lost_device(dev_priv->dev);
>>        ttm_write_lock(&dev_priv->reservation_sem, false);
>> -       spin_lock(&dev_priv->svga_lock);
>>        if (ttm_resource_manager_used(man)) {
>>                ttm_resource_manager_set_used(man, false);
>> -               spin_unlock(&dev_priv->svga_lock);
>>                if (ttm_resource_manager_evict_all(&dev_priv->bdev, man))
>>                        DRM_ERROR("Failed evicting VRAM buffers.\n");
>>                vmw_write(dev_priv, SVGA_REG_ENABLE,
>>                          SVGA_REG_ENABLE_HIDE |
>>                          SVGA_REG_ENABLE_ENABLE);
>> -       } else
>> -               spin_unlock(&dev_priv->svga_lock);
>> +       }
>>        ttm_write_unlock(&dev_priv->reservation_sem);
>> }
>> 
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> index 5b9a28157dd3..715f2bfee08a 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> @@ -596,7 +596,6 @@ struct vmw_private {
>> 
>>        bool stealth;
>>        bool enable_fb;
>> -       spinlock_t svga_lock;
>> 
>>        /**
>>         * PM management.
>> --
>> 2.29.2
>> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam04.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Czackr%40vmware.com%7C87dbfc543ea847f8e13808d8b6d6f273%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637460381607335152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=TttOwJzt5g8Sk45jqfa9qFkVCQrslhOmdjDyKQJzkIk%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
