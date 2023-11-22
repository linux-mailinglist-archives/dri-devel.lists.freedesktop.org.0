Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668B7F44E4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 12:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B99E10E5FE;
	Wed, 22 Nov 2023 11:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87C210E616;
 Wed, 22 Nov 2023 11:26:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xi1KMQVEv/I9HtDk2iIKCQLEWlx18HjtLk802d0KLp+dpE+4BK3Av+utKJoBKn15NQTOkEUWtamg1vXflGJBCX/ADNMHYZmzMeYPOp0L3x+Hw3M2ZQo83Wz/LyAnleld3Nu9COdj2CaOYMagKshfsaKW6f1o/LksW+g5qdUZNqw01QsJFhPliZxVJhL4bgJddHG51EJTu2RUot1YCgnj1tcao484a7Hw7Ow9FaA0lCzXU56TmtVjCKqMByGEo1bG8Pg7PPQpFGzt4q9pjT1yxzeQRAJRSmJ++FKZVGf1YqASCidYtmnVE4NyWr5n1VG7x8wjv7ZMTRcWe3ZklNopjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKZzOYdGkwEcj1X8BCU06lxd6U0NuSK4eDUpsEKNudU=;
 b=OcWmgDFpuggnp+gj0F37wQh8hWaTJTvBucrzLIaFe+Fh3EnOT+UuuTqOpf+Pa3ea32N4+fBwA45hNZGTTxvQEuQo154SC4Ntrn+4Hr2AJxwZAVf88D12Msh3cxpbuHr+siEzNK9ZcDBlzFjXelgs2Mw2CPmFYgOmf61fSkBF4JU4Leb6TB39bs2KhyKseyNOdroj8/wy/kqgjgCiPmImXKUDTT93sPz9tS4sEzfHsY6iSx3s62UJL0iLpdsLTkm6jaBlO+V1dDXgX2j+HI2d550rG2F8dv94NXBo8Nb9RH7NbfgdJeNTqFoUimxz9QV09lGtmV8Lhmwkj2V6NywchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKZzOYdGkwEcj1X8BCU06lxd6U0NuSK4eDUpsEKNudU=;
 b=atKsFZ0ixZJzDsgBfnWz+xH1uUvo9Ncy6cWW6eyvkeBwO9cXB1GFIRe97TLQuHpysBerGHC0bLifl2DQMj6eDOkwI2o3Uc4uao5fk/cP7/kHHgC3iUZscGa81h0RlHlGsRCseWk65Rf343CxhKPT2Nn3L6o3hmXTzmRiv1Gg21Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4922.namprd12.prod.outlook.com (2603:10b6:610:65::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 11:26:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 11:26:39 +0000
Message-ID: <8e0d44ee-e3f3-43f7-9f83-6a4349fc1dc7@amd.com>
Date: Wed, 22 Nov 2023 12:26:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes
 kernel null pointer
Content-Language: en-US
To: Lu Yao <yaolu@kylinos.cn>, airlied@gmail.com, daniel@ffwll.ch
References: <20231122093509.34302-1-yaolu@kylinos.cn>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231122093509.34302-1-yaolu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ccca10d-4a3f-468e-2438-08dbeb4de54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XiY7JcIpvVKo6an4EI4XcmhJn9TWQIPAlZATJTCZ8NAcqco/IkIdiOX/8PgrkA1w0URI3BOE4nf+1PBl+r7YMml5wOmFkzjHOlAcpOU7HYWTtMa/Xtvnr2Keg2od4XbufXViy8laluHLfODxsXbSw86dtA/FhdOgZ/z4OhMRJoq1eElIEJcjv7ViguG/S+axJ0FkuteQg+CHT83uz7YsYVf19K0pwBUgZfgV/siXty1WNWTv005khQlX96VGRej09H+GsNl9JAySjytCWQBce25yRa8/CSFayDyTYyXuIOH5FR5/DGk6+dvl+qnpx1CDMqDRV4xULLDKrX3F50HQ7aO/10+5Nnuc/OtZiS0IWDCc9IRyf0qna3B+cJQdxjuJwLCGDnVU2SyQualV3FSWg1iGJVnUp557MCV3i0r548bFuuWc6RCEr5NC3KOEyhIhjT2SB1uVEfPAtkwlqLQLZUMaQXW5CKFT7LfGFpKgU80Nxfypmjc3DmTIXR5sb4oQrUIvztgpsly2OQ5Hc+Dy+OGWnvCXUQVBZ5Ah4lVoyJsEjtS0rkNLcLjBFfT9VWXPWyW8hiEgPheaWQNsGwRfIQb4vs7FRi7lAq+TE1j1sY+efY48/Dho3NqSeJzyidokREnjvIf7b8RgAWLOzTph0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(41300700001)(31696002)(5660300002)(2906002)(86362001)(26005)(6666004)(478600001)(6506007)(6486002)(2616005)(6512007)(8936002)(8676002)(83380400001)(4326008)(316002)(66946007)(66556008)(66476007)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWhGSFVUV2hpdy9DSjNCcHAzMGNOOHNCUUhtQkd2cm1UUWxFZFV6ZkNwZElW?=
 =?utf-8?B?SVBTR3JoTVBZcFdmV1YxSzZqVEsyYmlQbERUbnQwRVBFMjJJK01mZEVwMlNF?=
 =?utf-8?B?VGd0bmd6bCtSTGNJaDY0aWVteUIzMmN4dzR4cmhYNzJFQlA4VkRYVmJzc1Zz?=
 =?utf-8?B?UW1ISmRQZE1Td1ZqSFJtUzc3Sms0MHJYT0xlTUpZYUtHTU5tMHJoaUJudlRT?=
 =?utf-8?B?aFQxbWQzdkJtVGk3UVo3THR6ak1WM053NERTZUNjNHdSSERKNXNVRXdMQmJM?=
 =?utf-8?B?T1JQR1ZkUDFpWHpYQ0xMeDg2YUlnWkhld1dkWG1VZmZkZHlDY2V5TWMycGpR?=
 =?utf-8?B?bzNCdmpDbDI1aDdmNXl1T256NjRWcEhFRGlhY1lpdXowSVNMVFc0TzEwbTcx?=
 =?utf-8?B?NEVDZ25OcDhpVDNsT1VRUjkvWlo4VEdrOWY4TndwNzd6SlNJbmozVUVoR1Y3?=
 =?utf-8?B?dkd0djJBRGVVeUY0cm93UTRSbVltS2E5NndCODdmeXN6Z0hZM05Vck9jQUEz?=
 =?utf-8?B?MFNIY0k2bE0wQ2lBMFdhNndWeEhlbGdycVFsaXQxS2dpUzFuWWpNRmlJNG5W?=
 =?utf-8?B?L2dxdXBCZE04c1M5bE90WUx0TXVOR0JEcG0rMlE0UXZBOVdoTU9uZk1SVldL?=
 =?utf-8?B?YzFOVFh2T1JvRDhJbWlHc1ZMaGtvdFFldGZ6c0ZYMmhlQTdUVE5qak13VXZQ?=
 =?utf-8?B?YkhsZTNyTEszaS90RFlIVXk0dGQyMFB2USt2MWkyRUQremt5cXdrSi8zWVIy?=
 =?utf-8?B?OHFwcWVLTXU3QzhnV3RIbStiZjA0WjhBVWlWRzJ4eW1mZVZZWmxBbHgxNWdq?=
 =?utf-8?B?c05lMFFSMzZJUXJIRitnV2Q3U1ZiZEs2c29WanZrUmk0YXpRbG02UHhVRHc4?=
 =?utf-8?B?dzlxc0JtTDVXUUdCYlVwYjVJZWJmRkZUR0FpZnpPUmg0NzJwQXJLVEdlRjhn?=
 =?utf-8?B?U0Yxd1ViemJrMGFCaWpXOUJITi9pTkdETWIyNTRsSTRHNHUyenhrYzZxc04y?=
 =?utf-8?B?Q1QwTWh4RVAzR3RScHBsekdjQUVYbms2MWhuOVloRVkvbWRhS3VDQ210QmNV?=
 =?utf-8?B?NFErb0FWb3VRNmpqM09EdllkSkVpQzlSU3JremdLL0xRM0t3eWo2cVlpNllL?=
 =?utf-8?B?dzNpc3FNZHpPOCsyaUlNdFhKSFhSL1dXSEduSU1jY2RyK2dhRU1pVmlkNDEr?=
 =?utf-8?B?NW4vYnZSdi9IYWxiQTBEZ2JRMkFUSDRXSTJkUG1uWnI3RjZUcWdFVUFQcjJV?=
 =?utf-8?B?QWF4U3lxUnhjV2xxdm80TmgxT3BCRWZrQS82ZTljZHZxQ2NoK2IrM0Z2SU9L?=
 =?utf-8?B?SzRSaHhKRW1aYVo4bGtMQkNPUXZOWjE0d051TC9nVEJNNmttc1VaOEFHaU1Y?=
 =?utf-8?B?T3d1bDZIZmZUb2hFMFVuOHJtOUVoNzJpL1ZocVpTTFJyT1oyLzBIdkZ0MjRl?=
 =?utf-8?B?ZUNPNnRPRmNTM0NLZ09KOWZ1dnFLb0c5MzRpYXM2aEpmeWsvR3FWN2hjYlNh?=
 =?utf-8?B?d3VKak9rZG1FK2YrTnlLRkdwbis0OGFFSTR0c01IdDl1dUNPU29PTVc1ZnFm?=
 =?utf-8?B?eDlzRVEyUVFBNVNUVjMvY3QyOGhjK05aZklyU0lJVUViOEYwaFNUL2x4cmt0?=
 =?utf-8?B?ZVUvMzVTYUE1WFNHcTJ5c3VaVkQ3b09jdUNmNVp0OVV1RWhhSVZJVFRuM0Q5?=
 =?utf-8?B?WlV2b2pNWnhtNFoyeEU2dEh4Mm5rK0lzMllLbDBBOGtpajQxanNQanh4Y3dM?=
 =?utf-8?B?Tk5aVXJWYkM4RmFOUEtqMERwZXgvUkI2N3ZlNnhNNVhtZ3QzV0xtb0JTb1FR?=
 =?utf-8?B?ck12V3FWNUtaRU13dW1IL005b3MwbUl1THZIZC9RZ2JvbDk1bjZmMmhHb0l0?=
 =?utf-8?B?bCtGVlF3MW44bEFlazFkVXJVTnZVaU1UYU13cjlVZWxETkJXWHNYNEQ5c0FT?=
 =?utf-8?B?TFd3Y2NVZlVWb0tiRjN2TXZlMnJrR3FPOTI0MC9QM0ZuUmlJcUNRMEo4bW1z?=
 =?utf-8?B?VEZ6UHNoNDRKaGxFa05XUENNSmZLT3lGYzkwWHduSXNHaHhpMXJCcDZuME9p?=
 =?utf-8?B?cUhuTGdCaXlvRUhGODdITEorY0wvekpkNU5XWlRpRnp3bWlaZ1pGWGRVdmJw?=
 =?utf-8?Q?TTkqO1sLenQqcOZdfWwJjyahK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ccca10d-4a3f-468e-2438-08dbeb4de54b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 11:26:39.5882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmMSE2QA5SR3z/B/pZrZYBAWjxnpRCkkRUusuMdw175f9BhlaAWvtEMf7yeDrT0s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4922
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.11.23 um 10:35 schrieb Lu Yao:
> For 'AMDGPU_FAMILY_SI' family cards, in 'si_common_early_init' func, init
> 'didt_rreg' and 'didt_wreg' to 'NULL'. But in func
> 'amdgpu_debugfs_regs_didt_read/write', using 'RREG32_DIDT' 'WREG32_DIDT'
> lacks of relevant judgment. And other 'amdgpu_ip_block_version' that use
> these two definitions won't be added for 'AMDGPU_FAMILY_SI'.
>
> So, add null pointer judgment before calling.
>
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index a53f436fa9f1..797d7d3bfd50 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -638,6 +638,11 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
>   	if (size & 0x3 || *pos & 0x3)
>   		return -EINVAL;
>   
> +	if (adev->didt_rreg == NULL) {
> +		dev_err(adev->dev, "%s adev->didt_rreg is null!\n", __FUNC__);

Please drop the dev_err(), this is not a device error but rather 
userspace using a functionality not applicable for this device type.

> +		return -EPERM;

Maybe rather use EOPNOTSUPP here.

Regards,
Christian.

> +	}
> +
>   	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
>   	if (r < 0) {
>   		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> @@ -694,6 +699,11 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
>   	if (size & 0x3 || *pos & 0x3)
>   		return -EINVAL;
>   
> +	if (adev->didt_wreg == NULL) {
> +		dev_err(adev->dev, "%s adev->didt_wreg is null!\n", __FUNC__);
> +		return -EPERM;
> +	}
> +
>   	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
>   	if (r < 0) {
>   		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);

