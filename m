Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE025A023
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 22:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94FD89D60;
	Tue,  1 Sep 2020 20:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A501289D43;
 Tue,  1 Sep 2020 20:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIEQGm83Ha7XMVLD42Ooo5nDP4X/QgOHORweND9dt6Bp2emtwwKmIT5yCx0ihq4F92FqBjyK/2Q2YiK4YxfBR57/kSprKytHjy0TvxH+0QJ9noppbNrV9EzaDQIu/iwmRvZ/xkPYD1hetpJDfKfIQ5Ny3ehVOihbpGS7BgHcTz4QIyWhD3EgEmuuKNKqKbHW5BRAnQLB17zofBhufWVQOsv7uVK9dOC/m9P+tDLZCu62Lpr/G8c2C0FLZRWqrU1dufNgo5YAM6zMsflO6mbtGSnAQlgLsY66Ou6piFMHgbl3XNux48tAdEF4ghBRO7+LujnlHR8ssEC5n8CVIiLXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfiY9ad+95tBb/BE9NU+gbxHiD6d/cVV9cpXvNu2VvU=;
 b=mPVuP/PBJFfQ/Y9agEWhW9W6ODOPROF+buL5wE8szSjzkA2QAJubLw+ssujUZL1qNgk551QKUnTjeJ2gZZ0PPkhi2NzqzeRNRv6cZ95ezv7TmeT15cnhG9lwBsmDXBhkXTT9rbINkuaDUaAIRW1lYIzEypcoMR9HLeUOWZnLM9M0X0WitY2aseCYtTE1m0syxL5HoGJY5WP0PU4PCpQB7fvu++LffjuQOZFNWxsH5w5wsTYYmj/oya1bEipbYRowwUxGpl0jxw8TXOzMK3Vz/RPNhKXvgXQBkJqGoZivWY1U0ZHGdRC1BIauDQMzAOh9iXKJTV9qIDa5oj3Qmo10yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfiY9ad+95tBb/BE9NU+gbxHiD6d/cVV9cpXvNu2VvU=;
 b=SGklm0wrpy5/Z/s8ClObk/ttadwosS5SnyX04c/T2dEqsZ/wcNRtCxRG2EnGfZuv+uI/pV212Hixd9JP1jYW8jtQCymIegYtWsJ6EMZfC8v+kl2c9NTecjoK56rmLcUif/3EggjdO/HuwsE8qiTdUuCxVHy3bwQ8dwB81koTctA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4433.namprd12.prod.outlook.com (2603:10b6:5:2a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 1 Sep
 2020 20:41:34 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 20:41:34 +0000
Subject: Re: [PATCH 3/3] drm/amdgpu: Embed drm_device into amdgpu_device (v2)
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20200819050042.7370-1-luben.tuikov@amd.com>
 <20200819050042.7370-4-luben.tuikov@amd.com>
 <20200901074430.GU2352366@phenom.ffwll.local>
 <CADnq5_ONe-myo-2534QG9KKU2Xs1RWD7s+uBt6ffNj=RgBgT6g@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <d4315ce3-036e-5ecf-fafd-6d77fb3e0321@amd.com>
Date: Tue, 1 Sep 2020 16:41:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.0
In-Reply-To: <CADnq5_ONe-myo-2534QG9KKU2Xs1RWD7s+uBt6ffNj=RgBgT6g@mail.gmail.com>
Content-Language: en-CA
X-ClientProxiedBy: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Tue, 1 Sep 2020 20:41:33 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c146bae7-4d2e-4175-6706-08d84eb76a2f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4433:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB443359C370D19CD209898B3C992E0@DM6PR12MB4433.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QKHuvwuItPY2NXkqQdQqeU/+NRErHDkkSL0fsAUryUgklHkvn2yUtVa99pacvp0CiVXkHACG/UoVnQ2sCQpc/7v15r/v9FEZnSHJMDsrRBi9XcSVjvX+KNmCaYyxPbvweONqVjuv+JGC8EGaBhtcND21AzOrJGWCeK6Grq+xO+pSRwps3ipcyJepglQgVvvc/ivTtgrvftdwWc6RAqW9YIGarEnjS6WweGwTM79oUJ5Ejip/efxbbO+cSea4O0icIlvcJr4aCMMGnh+ikFcjdR4zhIEF2VENxpm/6n07oWXw3sV5DZCh0n8NmYbrp1/FJcUCd65WJzuFNAdH1aEq2l6+t82V9xK+hXdKSa7Gx/9guPe/8fviijCv6jKpXwL9aHOI2Q2+wkmcXtr3PO2pswgYb3HfOqmWS2e4vkllB6wUxlt0f9ofDFXjBIK91fVbZMU73aaGIf1LBtsrV2tsFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(31686004)(110136005)(316002)(30864003)(45080400002)(2616005)(26005)(66556008)(54906003)(2906002)(8936002)(66946007)(66476007)(83380400001)(8676002)(5660300002)(44832011)(53546011)(31696002)(186003)(36756003)(956004)(478600001)(83080400001)(86362001)(4326008)(52116002)(16576012)(6486002)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: dBlBcREvZa7uGKpHDpqMq4evUrNyXjJn970Q832aFaXYUnihEvFhosaI80V9CVg3cfT104Kz1meC9gcRJbtUtQb8veCuGoiRTu08fT2bNcaOIq6t0LJvYQPrbatAZDetPk7kNEPNJO9v8Zj1umjKHBeyp1wrfTCYZKo0mXxNiB5KzoX/e2SHlj7G3//yU9tMN8O4skCOfR2DNPN/4lPRujHx2iArLBNf+TmSmeo9CwL8c/U07opSk3cIZi3ERth/4ZnSvTRLBiVf59gIHDeO4M0hjcB8xyOLt3VaSRP9ivS4LGHMfeCtVx6lzj4Y1wyRe4B1G5waKuaQMs3DApmuH1eUkQcJKvldJf4lOD3ZN6v3Pw55wLZc4pR340YVNAHWMvaOsiw7UKpidp4QBeAKRCVuu342g8eldC+CL+U3GbZM1kerbpvwDUFvziQOhuSenkpFq5xXjE/guRCSRowiKs4jkyjl5fuSmKv3Y56c7sH9jiFYUst6PlrZaeLqtTt1dcJbQ3f5bJ0M0ti5hYEMhZJcStavwbZJYBvqYqP4Ua8lUYcXs4cEqw+8lh4fyIouvwkl3HMSotnRKHj4Sm/lJkSzxowwbff+r6z+rGlyJYOG72T6j60NhcCgRSAraWEk3SwH9dmuMGkJev49zuFqNQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c146bae7-4d2e-4175-6706-08d84eb76a2f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 20:41:34.1857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpCwAh0D/Q9YsT4lt8K0kARvr6f4Cw53G9yNUcZs6AKhk+tEYXOnTgs8yJwSyXGU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4433
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-01 9:49 a.m., Alex Deucher wrote:
> On Tue, Sep 1, 2020 at 3:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Wed, Aug 19, 2020 at 01:00:42AM -0400, Luben Tuikov wrote:
>>> a) Embed struct drm_device into struct amdgpu_device.
>>> b) Modify the inline-f drm_to_adev() accordingly.
>>> c) Modify the inline-f adev_to_drm() accordingly.
>>> d) Eliminate the use of drm_device.dev_private,
>>>    in amdgpu.
>>> e) Switch from using drm_dev_alloc() to
>>>    drm_dev_init().
>>> f) Add a DRM driver release function, which frees
>>>    the container amdgpu_device after all krefs on
>>>    the contained drm_device have been released.
>>>
>>> v2: Split out adding adev_to_drm() into its own
>>>     patch (previous commit), making this patch
>>>     more succinct and clear. More detailed commit
>>>     description.
>>>
>>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 10 ++---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++-----
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 43 ++++++++++++++--------
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 20 +++-------
>>>  4 files changed, 43 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 735480cc7dcf..107a6ec920f7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -724,8 +724,8 @@ struct amd_powerplay {
>>>  #define AMDGPU_MAX_DF_PERFMONS 4
>>>  struct amdgpu_device {
>>>       struct device                   *dev;
>>> -     struct drm_device               *ddev;
>>>       struct pci_dev                  *pdev;
>>> +     struct drm_device               ddev;
>>>
>>>  #ifdef CONFIG_DRM_AMD_ACP
>>>       struct amdgpu_acp               acp;
>>> @@ -990,12 +990,12 @@ struct amdgpu_device {
>>>
>>>  static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>>>  {
>>> -     return ddev->dev_private;
>>> +     return container_of(ddev, struct amdgpu_device, ddev);
>>>  }
>>>
>>>  static inline struct drm_device *adev_to_drm(struct amdgpu_device *adev)
>>>  {
>>> -     return adev->ddev;
>>> +     return &adev->ddev;
>>>  }
>>>
>>>  static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
>>> @@ -1004,8 +1004,6 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
>>>  }
>>>
>>>  int amdgpu_device_init(struct amdgpu_device *adev,
>>> -                    struct drm_device *ddev,
>>> -                    struct pci_dev *pdev,
>>>                      uint32_t flags);
>>>  void amdgpu_device_fini(struct amdgpu_device *adev);
>>>  int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
>>> @@ -1195,7 +1193,7 @@ static inline void *amdgpu_atpx_get_dhandle(void) { return NULL; }
>>>  extern const struct drm_ioctl_desc amdgpu_ioctls_kms[];
>>>  extern const int amdgpu_max_kms_ioctl;
>>>
>>> -int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags);
>>> +int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
>>>  void amdgpu_driver_unload_kms(struct drm_device *dev);
>>>  void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>>>  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 07012d71eeea..6e529548e708 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -1216,7 +1216,8 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
>>>   * Callback for the switcheroo driver.  Suspends or resumes the
>>>   * the asics before or after it is powered up using ACPI methods.
>>>   */
>>> -static void amdgpu_switcheroo_set_state(struct pci_dev *pdev, enum vga_switcheroo_state state)
>>> +static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
>>> +                                     enum vga_switcheroo_state state)
>>>  {
>>>       struct drm_device *dev = pci_get_drvdata(pdev);
>>>       int r;
>>> @@ -2977,8 +2978,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>>>   * amdgpu_device_init - initialize the driver
>>>   *
>>>   * @adev: amdgpu_device pointer
>>> - * @ddev: drm dev pointer
>>> - * @pdev: pci dev pointer
>>>   * @flags: driver flags
>>>   *
>>>   * Initializes the driver info and hw (all asics).
>>> @@ -2986,18 +2985,15 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>>>   * Called at driver startup.
>>>   */
>>>  int amdgpu_device_init(struct amdgpu_device *adev,
>>> -                    struct drm_device *ddev,
>>> -                    struct pci_dev *pdev,
>>>                      uint32_t flags)
>>>  {
>>> +     struct drm_device *ddev = adev_to_drm(adev);
>>> +     struct pci_dev *pdev = adev->pdev;
>>>       int r, i;
>>>       bool boco = false;
>>>       u32 max_MBps;
>>>
>>>       adev->shutdown = false;
>>> -     adev->dev = &pdev->dev;
>>> -     adev->ddev = ddev;
>>> -     adev->pdev = pdev;
>>>       adev->flags = flags;
>>>
>>>       if (amdgpu_force_asic_type >= 0 && amdgpu_force_asic_type < CHIP_LAST)
>>> @@ -3451,9 +3447,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>>>       struct drm_connector_list_iter iter;
>>>       int r;
>>>
>>> -     if (dev == NULL || dev->dev_private == NULL) {
>>> +     if (!dev)
>>>               return -ENODEV;
>>
>> Random comment, but is this really still needed?
>>
> 
> Probably not.  I think it's just left over from when we forked radeon.

Indeed! Since DRM dev is embedded into adev, it always exists.

I'll submit a patch to remove this check.

Regards,
Luben

> 
> Alex
> 
> 
>> This pattern goes back to dri1 shadow attach trickery where everything was
>> horrible and we could end up with a device but not a device and trying to
>> suspend it.
>>
>> With a proper kms pci device you shouldn't ever end up in this situation
>> where the drm_device doesn't exist or isn't completely set up, but we're
>> trying to suspend. Maybe wrap in a WARN_ON at least?
>> -Daniel
>>
>>> -     }
>>>
>>>       adev = drm_to_adev(dev);
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 38023c879db1..6866c515f00a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -1082,7 +1082,7 @@ static struct drm_driver kms_driver;
>>>  static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>                           const struct pci_device_id *ent)
>>>  {
>>> -     struct drm_device *dev;
>>> +     struct drm_device *ddev;
>>>       struct amdgpu_device *adev;
>>>       unsigned long flags = ent->driver_data;
>>>       int ret, retry = 0;
>>> @@ -1138,36 +1138,42 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>       if (ret)
>>>               return ret;
>>>
>>> -     dev = drm_dev_alloc(&kms_driver, &pdev->dev);
>>> -     if (IS_ERR(dev))
>>> -             return PTR_ERR(dev);
>>> +     adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>>> +     if (!adev)
>>> +             return -ENOMEM;
>>> +
>>> +     adev->dev  = &pdev->dev;
>>> +     adev->pdev = pdev;
>>> +     ddev = adev_to_drm(adev);
>>> +     ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
>>> +     if (ret)
>>> +             goto err_free;
>>>
>>>       if (!supports_atomic)
>>> -             dev->driver_features &= ~DRIVER_ATOMIC;
>>> +             ddev->driver_features &= ~DRIVER_ATOMIC;
>>>
>>>       ret = pci_enable_device(pdev);
>>>       if (ret)
>>>               goto err_free;
>>>
>>> -     dev->pdev = pdev;
>>> +     ddev->pdev = pdev;
>>> +     pci_set_drvdata(pdev, ddev);
>>>
>>> -     pci_set_drvdata(pdev, dev);
>>> -
>>> -     ret = amdgpu_driver_load_kms(dev, ent->driver_data);
>>> +     ret = amdgpu_driver_load_kms(adev, ent->driver_data);
>>>       if (ret)
>>>               goto err_pci;
>>>
>>>  retry_init:
>>> -     ret = drm_dev_register(dev, ent->driver_data);
>>> +     ret = drm_dev_register(ddev, ent->driver_data);
>>>       if (ret == -EAGAIN && ++retry <= 3) {
>>>               DRM_INFO("retry init %d\n", retry);
>>>               /* Don't request EX mode too frequently which is attacking */
>>>               msleep(5000);
>>>               goto retry_init;
>>> -     } else if (ret)
>>> +     } else if (ret) {
>>>               goto err_pci;
>>> +     }
>>>
>>> -     adev = drm_to_adev(dev);
>>>       ret = amdgpu_debugfs_init(adev);
>>>       if (ret)
>>>               DRM_ERROR("Creating debugfs files failed (%d).\n", ret);
>>> @@ -1177,7 +1183,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>  err_pci:
>>>       pci_disable_device(pdev);
>>>  err_free:
>>> -     drm_dev_put(dev);
>>> +     drm_dev_put(ddev);
>>>       return ret;
>>>  }
>>>
>>> @@ -1197,6 +1203,14 @@ amdgpu_pci_remove(struct pci_dev *pdev)
>>>       drm_dev_put(dev);
>>>  }
>>>
>>> +static void amdgpu_driver_release(struct drm_device *ddev)
>>> +{
>>> +     struct amdgpu_device *adev = drm_to_adev(ddev);
>>> +
>>> +     drm_dev_fini(ddev);
>>> +     kfree(adev);
>>> +}
>>> +
>>>  static void
>>>  amdgpu_pci_shutdown(struct pci_dev *pdev)
>>>  {
>>> @@ -1491,6 +1505,7 @@ static struct drm_driver kms_driver = {
>>>       .open = amdgpu_driver_open_kms,
>>>       .postclose = amdgpu_driver_postclose_kms,
>>>       .lastclose = amdgpu_driver_lastclose_kms,
>>> +     .release   = amdgpu_driver_release,
>>>       .irq_handler = amdgpu_irq_handler,
>>>       .ioctls = amdgpu_ioctls_kms,
>>>       .gem_free_object_unlocked = amdgpu_gem_object_free,
>>> @@ -1525,8 +1540,6 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>>>       .driver.pm = &amdgpu_pm_ops,
>>>  };
>>>
>>> -
>>> -
>>>  static int __init amdgpu_init(void)
>>>  {
>>>       int r;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> index 47cd3558f9c7..f2a4fdcd542d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> @@ -86,7 +86,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
>>>       amdgpu_unregister_gpu_instance(adev);
>>>
>>>       if (adev->rmmio == NULL)
>>> -             goto done_free;
>>> +             return;
>>>
>>>       if (adev->runpm) {
>>>               pm_runtime_get_sync(dev->dev);
>>> @@ -96,10 +96,6 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
>>>       amdgpu_acpi_fini(adev);
>>>
>>>       amdgpu_device_fini(adev);
>>> -
>>> -done_free:
>>> -     kfree(adev);
>>> -     dev->dev_private = NULL;
>>>  }
>>>
>>>  void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
>>> @@ -130,22 +126,18 @@ void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
>>>  /**
>>>   * amdgpu_driver_load_kms - Main load function for KMS.
>>>   *
>>> - * @dev: drm dev pointer
>>> + * @adev: pointer to struct amdgpu_device
>>>   * @flags: device flags
>>>   *
>>>   * This is the main load function for KMS (all asics).
>>>   * Returns 0 on success, error on failure.
>>>   */
>>> -int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
>>> +int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
>>>  {
>>> -     struct amdgpu_device *adev;
>>> +     struct drm_device *dev;
>>>       int r, acpi_status;
>>>
>>> -     adev = kzalloc(sizeof(struct amdgpu_device), GFP_KERNEL);
>>> -     if (adev == NULL) {
>>> -             return -ENOMEM;
>>> -     }
>>> -     dev->dev_private = (void *)adev;
>>> +     dev = adev_to_drm(adev);
>>>
>>>       if (amdgpu_has_atpx() &&
>>>           (amdgpu_is_atpx_hybrid() ||
>>> @@ -160,7 +152,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
>>>        * properly initialize the GPU MC controller and permit
>>>        * VRAM allocation
>>>        */
>>> -     r = amdgpu_device_init(adev, dev, dev->pdev, flags);
>>> +     r = amdgpu_device_init(adev, flags);
>>>       if (r) {
>>>               dev_err(&dev->pdev->dev, "Fatal error during GPU init\n");
>>>               goto out;
>>> --
>>> 2.28.0.215.g878e727637
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7Ca578357aacfd4c2147c208d84e7dcf9f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637345649545602871&amp;sdata=x0xLEA1jH2HdoD%2FKXpu2NA1eHDsT38yCw%2B5TepuiYNQ%3D&amp;reserved=0
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7Ca578357aacfd4c2147c208d84e7dcf9f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637345649545602871&amp;sdata=wamEB%2F1DRtIA7Rj3tkwbdnLbve9QPexn0IMqUNSznfs%3D&amp;reserved=0
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7Ca578357aacfd4c2147c208d84e7dcf9f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637345649545602871&amp;sdata=PscoJjYrNIXOqtoroiI2006OamEy%2BqMd9hBF6BhJYwg%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
