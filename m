Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1DF5AFE97
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3587110E3F7;
	Wed,  7 Sep 2022 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BB910E3F7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 08:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYIggystW6ztd3zZxRpoI50WNhtfuwrH2zlRe87xLC/pz6zQ0x0NAEpKbVSiqVLYnmRkox9OOw15vkzHtM3HMPRjzjhYPoLU32ZMqrvBWEmpQRI5Uu4Fo+vGSaZ9HYlyLAPfGRQpdeP/QWYoEogGAfNqMT+15rPmhZQWWI84mTaK1OYBK4afovcqAWyZDGbaTCSzSLSRf9ZYXWvxkDQFmd/bgbbruZzH73wfmGXPCVB2aF7ZvXai908tS8aNiATi5XuTkztAbXHbyFBuCg1OyzOUK/zfAULXj0IDvpJwraw7VtwhPYe6PLWW/Qu4VrFuJV9DngeYo7XlDQQ9ecHl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tg38s3b3N4lcJ9FJncQRPHLWZqBOawEdhMSIE+V2vl8=;
 b=b5L/Mbb2kWQsPg2JXlTcP8L8orYhvWyLWqHnxu1WWR97ApJ1H/ikmxtQcqwmXlCnsC+4NgAWF9y02O8mx42X7o6T0yxyEWtd+1VkucU/QEYz+7ixaCPm7fUONrA8dC/MyPyitNUdnA6gsCmfmUXvEe9CXGwpZdgBmWpYffcDMMmhdJIPM6x1wtp1mM76lEUgYqz5+wBuhGKczul1uX4Ho2mA0sfYwNGO1yWjFbr/xFDUyz2vSCaWuHjVjbSfRlYKzf9EdyWs5v1phmhAyOwQntcZoh17ZtNexMAovyaNVnIAdUZsEHPl7kClSIvwid94BwkF8fVEYTp6W0ddIDthcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg38s3b3N4lcJ9FJncQRPHLWZqBOawEdhMSIE+V2vl8=;
 b=1YhYIDXc3jTeKdGQMnDq0OSvhrq1t+cla+4WrNF467ulWi8ztGiEjZ58j3KCIS2W2BfL5MJHgMisMnibQiC3BjxfJ0QmB20x/pQ/LqjmgRwKea8XU0SdMjo51For/vpu1jgrbdNkmjvE0RRoyDzycKN9XSe6vHjafOPF0o82fO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5227.namprd12.prod.outlook.com (2603:10b6:408:100::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 08:10:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.012; Wed, 7 Sep 2022
 08:10:57 +0000
Message-ID: <ee27c832-a1fd-bc93-9f1b-33f828195e83@amd.com>
Date: Wed, 7 Sep 2022 10:10:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] drm/ast: add dmabuf/prime buffer sharing support
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 oushixiong <oushixiong@kylinos.cn>, Dave Airlie <airlied@redhat.com>
References: <20220901124451.2523077-1-oushixiong@kylinos.cn>
 <5bc77d8f-928c-1d41-9b3c-eaad1bf3cfff@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5bc77d8f-928c-1d41-9b3c-eaad1bf3cfff@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f126bf-453d-4995-bfc8-08da90a87e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w93y+u6S8Axg876PuP2bREoL75TtEN/gOfV4UvAdwb95PfdfpxIoXwAKMKF2EPFJHjAmAQHOsrquLFq5PqpnJenmDOar7jj5oTNmdcCjj7xarZ4U7D8xtcviv2ytSm7Wal85CZ39PoX/5ywZjkzXej5QTsR+fx1v4sQZtexlo8AWu3XBcwWHrs2WTuORf3BmQC+lX0NQDAPmBAP4s9C6SgdZzyvl1e5S7tR2GqJpHcplivJeN9VGKV3EaFXPC6XuuICxrubnb1x0s9e6xtBVfcsCNOmYnf1KHToHtCYjSVEKer91xRWA7v9+m62tTB+4HlAxnEm9dG/kTE9+Kkb20Breft3HQR3RQwzFIT3aTC4EfUnRZDfnQsj1g6Szlrdjxwd/QU5kYqFA717dRCAdVmJCubjyJMXHUTQZVOCTpqtH1vcjhkX2deijdBt8uqWALHDjg8x7argM03Bc3uEoS/LQqw2fDq0byoRD1ZGcdOb8+CQHRKDL3lF0R2ya396d2MkiQDjIo4PyN0GfpZqHWmNdwaP3U7EL6dvxnyUW88fjxpdlEph+E5l7fGjX1UYWUOQo30XmAhSqfmyayMureH6aSTEAHZN7EoUxxhmEchGO5QwWkqYKow9GGAJo58WGD3tIkeah/jVQ6ElP2i/s/fV6wfLZFxJHRDODrlHoiyYpf9Ds4oUUYO1estXOjpP2tJePSRs2WEmC2x5Q4Dz78sa4C9pu6BlZVNp9TVZjkRszER4W1pm/uSuDtm52HSUf88guSLAKNasICryFdeJ1rBcoTFBpweEbHQ14T6ojHv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(5660300002)(8936002)(31686004)(2906002)(83380400001)(36756003)(38100700002)(66946007)(66476007)(4326008)(8676002)(66556008)(6506007)(110136005)(54906003)(86362001)(31696002)(478600001)(186003)(2616005)(66574015)(6512007)(316002)(6486002)(41300700001)(6666004)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3M4eTZOa05uUE9RakU0Qlo4VlVSLytCSkN0N0hSeVlPakxIcjl4d241V2tQ?=
 =?utf-8?B?WWpyTzBBVEZzNmlpS0tqSVZNK3ZTSmN5cXJ2a1YzSmx6cVZvRUZ4dVl1bEpu?=
 =?utf-8?B?L3BxQTdsNE5yQXhNdFgzeEc0OUhuQkNZYW10d3RuR3NsNkM0dW55d3ArQnp2?=
 =?utf-8?B?UG44V2lhSjdkSzloaERvNEcrdmVQYlFFc1VGajlOaVNTanM2aExxV0hqUEw3?=
 =?utf-8?B?YU9rTGVUNXNUZzBYMlNVU1FNR2JBaXl6NDBqWVU0VGVxaWFYMmtKRHlLWUYz?=
 =?utf-8?B?cU43QVNtMTIybnYvZ2hQWldlUEpjalI4YjIrZVdaOXFOMUIxMWFIL2VJbkJ3?=
 =?utf-8?B?NzByemt4c0VvMjIrd2MvMi9Sc3BBUU9LRGVSUjZUZERtRHplWHpLTmlWUlg2?=
 =?utf-8?B?Z1d6Njl4ZWFYSDhyVXo5bjNQUlg5SEdzVklkc0YxS2x3QmRNMmdxdHM5NDFP?=
 =?utf-8?B?eHJxV2NleVRwTmhoTjVVeVVpeDlZd3piaWVvREZOcjdYUnNnSmlQdktyODhz?=
 =?utf-8?B?MnFyVVNKTENwQVZlUFVnMWlZemtESGlBcEpUZVZqSVh5UjlOT3UrRURpc3I0?=
 =?utf-8?B?dnJIUWdNZWcyTTZFdElBeXNqd3JIeW9YY3dhalUwVy9WdmV2bTdwUG9XL1RU?=
 =?utf-8?B?TjB3WGM2NEVsOFZsR1dhTisyUk9NeXZzTzVOc2R4WEVhSThwYzJkNkRWc2Fl?=
 =?utf-8?B?UDBlQms4cUs3UGozaU1mS3d6UGgxWG1tY0NSUWdEUmRkRytFSnBpMkl3WDNX?=
 =?utf-8?B?YzdrekYzU1BtdlM4V21oK0IxTGhaWXNzcHk2eWM4eTI3aXBrcnA1YWV1c09Q?=
 =?utf-8?B?OGo3TUE2eHEySmQ3Vk82bXBHdng2ZU1XczJoa1JIYzZBQlFqL2FFaHE3TXpv?=
 =?utf-8?B?Y3FxaWx0cWJxUU1iVDZTVkRhd1hwb3UySkdydEtJcUp6N1VINVNGbUJyWHNM?=
 =?utf-8?B?NFNTUUIzVWxzeVZqaXBYQjlBbGdxTXJ5empCK211K0xMUm1mVmNobkpIM0JJ?=
 =?utf-8?B?bWtQTVVJbkxGUmNjdU5qQVlkMFliM2xVcFVFelNSVERLYnFQamRaMlNVZmFD?=
 =?utf-8?B?RDhNSklNdG5XUjFjME1QTG1VZDVvZU9PRG13dkFuZVR4OHNud1dWSUV4WG14?=
 =?utf-8?B?R0ZOMGM1OC8rMERqVnhvMDZJNkRxZXJjRG9BV01vQ0MwWU1PR3o1NHUrNlhr?=
 =?utf-8?B?c0hEQWVRaU45RkV6bk9NbXp0SE1lOGNxVUx1eHJZMTRJNEVRak9rcW1nbHRx?=
 =?utf-8?B?WDRxa2pidm1LdGdZaG41b2RDMkZUQXBUcE8zeEliRlgxc0xSdFNocVBDbjVX?=
 =?utf-8?B?cWpOMWs4NmE0YS9GaW9pclNZSHhsZ3RvYTFQekJwc2NlcWNNYmpydjdyY3lY?=
 =?utf-8?B?d0wrUkw0eEFBcXVKQ3hja0VnaE5aQ0NPMzlDZ0hXbjBVWW9zbGorOWZ4TExw?=
 =?utf-8?B?K0R2SUgyZVlZMlVNWXNoU0tLbEo3aG9SWDA0dDVKSW5RbXhWZmROVlV4WWVr?=
 =?utf-8?B?MllaWlFudTUxcGV6ZnFEYkdGVXJCMW9NclU4Z3p4ZDhuQ1ZYbk1JWktGVlVD?=
 =?utf-8?B?V1BaVkdUL1pUZ2xpQmttQW0zNTFka21YSXNWNGo1QmFZRnRTa05Zc0E4TDNr?=
 =?utf-8?B?YmdPUVVWZXM1VWU5bHdqd0E2alpWYk1qU3dESzRVZXk1QldTSElvMFk3SUZQ?=
 =?utf-8?B?SlN5Qkt4N3QwQS90QTlVUUlIVDhlNHE5cVZRS1EzZjFmdWpPaHhmTlR6M3lY?=
 =?utf-8?B?dUdTNUdCNENtNGlzVkRWZkQvREpaaEhEakhiUzZEaDNFNlpwQ3dHcHpPWHA1?=
 =?utf-8?B?S2IwUEF3RkFqNVFabHJ2NXVWSkZUei9mL2FESnA0cDgzdUVNWXVGdVF6KzY4?=
 =?utf-8?B?NWoxMEwvQkNwN1ZFM0VSelN1NlNFYld3Tk1Sd2RNSHlRakVUK21ZZ1ZaM0hD?=
 =?utf-8?B?Y2NYZmxTY2JCRGpTZjQ4RERnYXdqSFB6Nm1KWlhuMWVPd0ZEbVZKeWVVaFhR?=
 =?utf-8?B?aEdXbDVCSXRGenY4S0ExWndkWEZ6cXQ0Vy9nenVsWldESUdXbEt2Uy9pSTN3?=
 =?utf-8?B?V0RoQXl1ZU9DWWtCeVQyVm56VUYxcGxTWXdxaXc0am5KNmdOSjRYa3VUUWlu?=
 =?utf-8?Q?jyi80i6kSuUe3WsFXtWqTcPK1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f126bf-453d-4995-bfc8-08da90a87e64
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 08:10:57.6877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mCiNO4RrzLi05mo+L7lFc4b771iYggITJ5ea4j6mmiqaM5vm0W/mz3km1VDgHVJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5227
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I was wondering pretty much the same thing, but then thought that this 
might be the first step to direct scanout from DMA-bufs.

If this isn't the case then I to see this rather critically since that 
functionality belongs into userspace.

Regards,
Christian.

Am 07.09.22 um 09:50 schrieb Thomas Zimmermann:
> Hi,
>
> on a more general note, let me say that your patch doesn't seem to fit 
> the ideas of how buffer sharing is supposed to work. Your patch does 
> the BMC screen update 'behind the scenes.'
>
> Shouldn't userspace set up the DRM state for mirroring the output of 
> the discrete card to the BMC?
>
> Best regards
> Thomas
>
> Am 01.09.22 um 14:44 schrieb oushixiong:
>>
>> This patch adds ast specific codes for DRM prime feature, this is to
>> allow for offloading of rending in one direction and outputs in other.
>>
>> This patch is designed to solve the problem that the AST is not 
>> displayed
>> when the server plug in a discrete graphics card at the same time.
>> We call the dirty callback function to copy the rendering results of the
>> discrete graphics card to the ast side by dma-buf.
>>
>> v1->v2:
>>    - Fix the comment.
>> v2->v3:
>>    - we remove the gem_prime_import_sg_table callback and use the
>>      gem_prime_import callback, because it just map and access the 
>> buffer
>>      with the CPU. and do not to pin the buffer.
>>
>> Signed-off-by: oushixiong <oushixiong@kylinos.cn>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ast/ast_drv.c  |  27 +++++++
>>   drivers/gpu/drm/ast/ast_mode.c | 125 ++++++++++++++++++++++++++++++++-
>>   2 files changed, 151 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_drv.c 
>> b/drivers/gpu/drm/ast/ast_drv.c
>> index 7465c4f0156a..fd3c4bad2eb4 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.c
>> +++ b/drivers/gpu/drm/ast/ast_drv.c
>> @@ -28,6 +28,7 @@
>>     #include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <linux/dma-buf.h>
>>     #include <drm/drm_aperture.h>
>>   #include <drm/drm_atomic_helper.h>
>> @@ -50,6 +51,29 @@ module_param_named(modeset, ast_modeset, int, 0400);
>>     DEFINE_DRM_GEM_FOPS(ast_fops);
>>   +static struct drm_gem_object *ast_gem_prime_import(struct 
>> drm_device *dev,
>> +                        struct dma_buf *dma_buf)
>> +{
>> +    struct drm_gem_vram_object *gbo;
>> +
>> +    gbo = drm_gem_vram_of_gem(dma_buf->priv);
>> +    if (gbo->bo.base.dev == dev) {
>> +        /*
>> +         * Importing dmabuf exported from out own gem increases
>> +         * refcount on gem itself instead of f_count of dmabuf.
>> +         */
>> +        drm_gem_object_get(&gbo->bo.base);
>> +        return &gbo->bo.base;
>> +    }
>> +
>> +    gbo = drm_gem_vram_create(dev, dma_buf->size, 0);
>> +    if (IS_ERR(gbo))
>> +        return NULL;
>> +
>> +    get_dma_buf(dma_buf);
>> +    return &gbo->bo.base;
>> +}
>> +
>>   static const struct drm_driver ast_driver = {
>>       .driver_features = DRIVER_ATOMIC |
>>                  DRIVER_GEM |
>> @@ -63,6 +87,9 @@ static const struct drm_driver ast_driver = {
>>       .minor = DRIVER_MINOR,
>>       .patchlevel = DRIVER_PATCHLEVEL,
>>   +    .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>> +    .gem_prime_import = ast_gem_prime_import,
>> +
>>       DRM_GEM_VRAM_DRIVER
>>   };
>>   diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 45b56b39ad47..65a4342c5622 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -48,6 +48,8 @@
>>   #include "ast_drv.h"
>>   #include "ast_tables.h"
>>   +MODULE_IMPORT_NS(DMA_BUF);
>> +
>>   static inline void ast_load_palette_index(struct ast_private *ast,
>>                        u8 index, u8 red, u8 green,
>>                        u8 blue)
>> @@ -1535,8 +1537,129 @@ static const struct 
>> drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
>>       .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>>   };
>>   +static int ast_handle_damage(struct drm_framebuffer *fb, int x, 
>> int y,
>> +                    int width, int height)
>> +{
>> +    struct drm_gem_vram_object *dst_bo = NULL;
>> +    void *dst = NULL;
>> +    int ret = 0, i;
>> +    unsigned long offset = 0;
>> +    bool unmap = false;
>> +    unsigned int bytesPerPixel;
>> +    struct iosys_map map;
>> +    struct iosys_map dmabuf_map;
>> +
>> +    bytesPerPixel = fb->format->cpp[0];
>> +
>> +    if (!fb->obj[0]->dma_buf)
>> +        return -EINVAL;
>> +
>> +    if (!fb->obj[0]->dma_buf->vmap_ptr.vaddr) {
>> +        ret = dma_buf_vmap(fb->obj[0]->dma_buf, &dmabuf_map);
>> +        if (ret)
>> +            return ret;
>> +    } else
>> +        dmabuf_map.vaddr = fb->obj[0]->dma_buf->vmap_ptr.vaddr;
>> +
>> +    dst_bo = drm_gem_vram_of_gem(fb->obj[0]);
>> +
>> +    ret = drm_gem_vram_pin(dst_bo, 0);
>> +    if (ret) {
>> +        DRM_ERROR("ast_bo_pin failed\n");
>> +        return ret;
>> +    }
>> +
>> +    if (!dst_bo->map.vaddr) {
>> +        ret = drm_gem_vram_vmap(dst_bo, &map);
>> +        if (ret) {
>> +            drm_gem_vram_unpin(dst_bo);
>> +            DRM_ERROR("failed to vmap fbcon\n");
>> +            return ret;
>> +        }
>> +        unmap = true;
>> +    }
>> +    dst = dst_bo->map.vaddr;
>> +
>> +    for (i = y; i < y + height; i++) {
>> +        offset = i * fb->pitches[0] + (x * bytesPerPixel);
>> +        memcpy_toio(dst + offset, dmabuf_map.vaddr + offset,
>> +            width * bytesPerPixel);
>> +    }
>> +
>> +    if (unmap)
>> +        drm_gem_vram_vunmap(dst_bo, &map);
>> +
>> +    drm_gem_vram_unpin(dst_bo);
>> +
>> +    return 0;
>> +}
>> +
>> +
>> +static int ast_user_framebuffer_dirty(struct drm_framebuffer *fb,
>> +                struct drm_file *file,
>> +                unsigned int flags,
>> +                unsigned int color,
>> +                struct drm_clip_rect *clips,
>> +                unsigned int num_clips)
>> +{
>> +    int i, ret = 0;
>> +
>> +    drm_modeset_lock_all(fb->dev);
>> +    if (fb->obj[0]->dma_buf) {
>> +        ret = dma_buf_begin_cpu_access(fb->obj[0]->dma_buf,
>> +                DMA_FROM_DEVICE);
>> +        if (ret)
>> +            goto unlock;
>> +    }
>> +
>> +    for (i = 0; i < num_clips; i++) {
>> +        ret = ast_handle_damage(fb, clips[i].x1, clips[i].y1,
>> +                clips[i].x2 - clips[i].x1, clips[i].y2 - clips[i].y1);
>> +        if (ret)
>> +            break;
>> +    }
>> +
>> +    if (fb->obj[0]->dma_buf) {
>> +        dma_buf_end_cpu_access(fb->obj[0]->dma_buf,
>> +                DMA_FROM_DEVICE);
>> +    }
>> +
>> +unlock:
>> +    drm_modeset_unlock_all(fb->dev);
>> +
>> +    return ret;
>> +}
>> +
>> +static void ast_user_framebuffer_destroy(struct drm_framebuffer *fb)
>> +{
>> +    struct iosys_map dmabuf_map;
>> +
>> +    if (fb->obj[0]->dma_buf) {
>> +        dmabuf_map.is_iomem = fb->obj[0]->dma_buf->vmap_ptr.is_iomem;
>> +        dmabuf_map.vaddr = fb->obj[0]->dma_buf->vmap_ptr.vaddr;
>> +        if (dmabuf_map.vaddr)
>> +            dma_buf_vunmap(fb->obj[0]->dma_buf, &dmabuf_map);
>> +    }
>> +
>> +    drm_gem_fb_destroy(fb);
>> +}
>> +
>> +static const struct drm_framebuffer_funcs ast_gem_fb_funcs_dirtyfb = {
>> +    .destroy    = ast_user_framebuffer_destroy,
>> +    .create_handle    = drm_gem_fb_create_handle,
>> +    .dirty        = ast_user_framebuffer_dirty,
>> +};
>> +
>> +static struct drm_framebuffer *
>> +ast_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file 
>> *file,
>> +                const struct drm_mode_fb_cmd2 *mode_cmd)
>> +{
>> +    return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
>> +                    &ast_gem_fb_funcs_dirtyfb);
>> +}
>> +
>>   static const struct drm_mode_config_funcs ast_mode_config_funcs = {
>> -    .fb_create = drm_gem_fb_create,
>> +    .fb_create = ast_gem_fb_create_with_dirty,
>>       .mode_valid = drm_vram_helper_mode_valid,
>>       .atomic_check = drm_atomic_helper_check,
>>       .atomic_commit = drm_atomic_helper_commit,
>>
>>
>> Content-type: Text/plain
>>
>> No virus found
>>         Checked by Hillstone Network AntiVirus
>

