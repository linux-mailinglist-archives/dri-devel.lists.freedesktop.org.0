Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A94E4D1F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 08:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5DA10E073;
	Wed, 23 Mar 2022 07:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08D210E071;
 Wed, 23 Mar 2022 07:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdGA6WWX9o7vt3d3Uc+F3K3nKueYb8nFFcO9VQ51xB1n5ldQ+1zCftCUkeKT8uZbZiBv4hTmu9xz8tgzU9H/1Lpl9H16zdooXLcxo0baPpQ17c21wY6HY7JsIYUZQLg77u6hbpzMs+96wp9peE/YpezXP4G6YplLvimjNBxdvztpdpX1DNFT3II1esA3+tKr5VtpPfGjjaB4TzXsppJx2QABIjbmix/gpcAyev69FMC1gOy1HxaX3EFBhH0BSZVvQoA1dkNw1N8BSnt0jWlZrpRXL+hBA7UxAOvpFzeA6EoJfPvnF4l2rc10NPIHSunqyaC1PsKKyug8rwXHF25R3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3yMgg/1dlk+WpXuOXBKTBfWOKCuVOFBUMXy4Pl5r+Y=;
 b=To0aBMVZpqV89SK4462I2ACvPLggNlujTtrPTvsJHoliRVp466QsF+57/O5jjRAJGp3WeOTiX8vRg7yGrJWNTyQQg/JHOBNOLMFMp73rVVqxOBcPK0eMXSr4Y9HmLgbZSL/0QkkOs50knZ5ZvFfQIp4IC9Ald77Ug87AC772L5QnfWs4tAdPqpcYCdfrixt8B/HWJx9XJzn7ZEivMTHqxecXQaxwt/Ze4qsfqfGn2fiRkk5m1XosKwGI/Js6pao8zdknVSG42TYGeyJlduP3nXOQ3oWLR6k0c/LK822NU3sF1Hru5XKlMIdWjxDmam5G1P2XVW3mNfCEf6gWPqDHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3yMgg/1dlk+WpXuOXBKTBfWOKCuVOFBUMXy4Pl5r+Y=;
 b=nsO45w2ebXQhp/h5ScP2dKtVOm+syTVANoJgrj2oJWW2jVqLIBub+7Q35TnAtL1Sx9E+HbZ/ausLdg3NcqNiBu/1ZwMBh+zP/S1tHehnRi/FHB7xbHUWL5JxDfG4QOTLZncQjLvDU6OedMvqb4uIoDaF445fknxDGKTTGYQx8NQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4517.namprd12.prod.outlook.com (2603:10b6:208:267::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 23 Mar
 2022 07:15:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.024; Wed, 23 Mar 2022
 07:15:34 +0000
Message-ID: <e2bc20e4-41e1-7162-257c-f2ad3309f1cb@amd.com>
Date: Wed, 23 Mar 2022 08:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/2] drm/qxl: replace ioremap by ioremap_cache on arm64
Content-Language: en-US
To: Cong Liu <liucong2@kylinos.cn>, airlied@redhat.com, kraxel@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, ray.huang@amd.com,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220322093444.1236582-1-liucong2@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220322093444.1236582-1-liucong2@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0005.eurprd02.prod.outlook.com
 (2603:10a6:203:69::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 635901c9-9a00-43be-c974-08da0c9ce246
X-MS-TrafficTypeDiagnostic: MN2PR12MB4517:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB45174B1FCEF1D7FB9F1C7B0583189@MN2PR12MB4517.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAUl8rVvS6H3a/J4fPJycCepbASDO4vOSc1ddtAS32iCoRI6g6duFuUultwM2U5mUb/PI4tjy4O2HkwcaoDF8i+qUxxoDfjzXflPNsNpTO8lCthO4vDo9u7BT2a9mm7ntZrLTCMeXAJps5ykrOi6aMWBRNZF/B1Wp4BADSS2wExpjX/xp/sTpoZNidaDTHvpQgW6/qaiRk6owo0SMmw7QbisPIGF1lpLEy5z5Oa6hTMX147dSo+t5oMGN6erYtxfpXoi/ngSliWl3ugaqLJF/wjDrBf9Ots9NU3VbYsE7gAIyLVTLQLxqGRS9BNtntrh4WLroAZ62AmaNGPH/xaaFPL01QevuimHY+1iU9KSMu4U6HZKyUr1usC9n2WKybeBHl10l4RbvgO/wE1DwG5wvPLyMmLUh/TpJNZSu+YXcs4ck5aT7qBWvPiNogKlEEV7XA851ZgnEU3GgqWRFq91YZO0Fvk/yPdoYyl9ft7g8BIbcncFs9nKgQH5D2gVOSzM+hfMJyrCmoM6/Rqjn7NsmlCAf1wMOWURWvsVFCkxke2w0Ww+0hqnqFTFZqoRMx96Yrhl+RJfbV4mdfAIKBHTo88BZRBwP+BYmSRKJA8d9QoaMb6PTOkfUSd4E77inz6oG2iUseWbO8SiuMlhN/76r9KtUDYa+PAvqxvLbU5nNrDzRrm4br5XUkzCQGWFEosq5bTW1VAaWvzwrkcG0jEoumsgfRsWm6+QVo0JEUYLACs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(316002)(26005)(186003)(8676002)(66476007)(66556008)(6666004)(66946007)(86362001)(31696002)(508600001)(2616005)(6512007)(5660300002)(6486002)(6506007)(8936002)(36756003)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWN5MGoyRWVjUzEvcEdQTFBrUnFGYW4raTdzbmJ5d2tvZ3J2WU1xYjNuOExB?=
 =?utf-8?B?VVkvUWdmSlZoVFlmaW4wdVZWOHZmMlBLazhaemM2engrNXpGNE91OEpIdFJE?=
 =?utf-8?B?MGpUdzRiQUpJSHRiMHhyTUFXUmZpN1p2NjJXQ0lTcERMc3NrQ05Ra0EyK0Ru?=
 =?utf-8?B?ME1lOTVCUUc4QjY4dThYNGM0cG1SK0lyK3MxQTZlL3lEc0lLOUNBcHIwWElh?=
 =?utf-8?B?Q0ZTVUZ6a3FlbU5OSVJaNXpkcGtrWDIrVEtlMncwMzZXUEEzekJ0QjU0MDZt?=
 =?utf-8?B?WHI0QWZ3QWFiemUzallhOWhoSnFQanRKTTFEQkFrc2c4R1AwbVdrWkxUUlgr?=
 =?utf-8?B?dnZWRWYzUzd0dWRURXlVNkN2anZ0cjYrUTdqWUdNMUl3dU1vODVQbHNqQ2tn?=
 =?utf-8?B?MFFGbzVNWVhSdjFBQVNxUVRWZnVyUm1XZ2M0YTBzRDN6RVpiKzRwemZUUDJ6?=
 =?utf-8?B?MGZTWjYxRFZXT1BKTG1PcElkVEVqQkpSUUMyWFRUOGxoeUpNL1ZhWDJTd2Fs?=
 =?utf-8?B?eTVLOTV6WmVTZmx0NXpSU3NwU0x4ZUpHUVRMVUF3VU4wZmRKTG85UVZIaVBa?=
 =?utf-8?B?N0dFRHVOUno2SFZramhVbTU3Y0xiZ0dQQWFKbUcwdVoxRldTR0hGamZzUnVx?=
 =?utf-8?B?MGhHOGdvR3pGaEM3bkMwNWdQV2w4WDJBV2dCSWtYb0J1NVVDM3hYNUlsLytE?=
 =?utf-8?B?UGIrd1NzNXRvSVd6UlQ5eGd5Z2M5L0ZFRlhaTHhMRTJBRldiNkh6dlZnY0Q4?=
 =?utf-8?B?RUhWYkZ3cVJMS0FHTGtFSkVlQTRGSDZGVVZwSnd6MDV6RWd3WWtHUlpOUThW?=
 =?utf-8?B?djhsNkhLSWpsWjJLUnZJMGxDd1lYcmVyWmlqdzR3M2dBVDdBdUp6eWRKSmlr?=
 =?utf-8?B?WDdLRFRoekxVZm4ydXpjNlBHYU9pWHQ2MEdTL0ExQndqV20rT2taZUo4elJ1?=
 =?utf-8?B?d0NtMHBZR1I1Q1JpNzZFcVZzK1hwY25MbGpMMG5NSEc4T2hjSVo2Z0toaWNa?=
 =?utf-8?B?MVlVNWtXU0paZFI5VmdXbmpkRVIwRXI3Wk5MR0VPbWdjM0RDckh3UHYxWjhX?=
 =?utf-8?B?K3dYaEpHbkdQZC9OMkZNSkR5ZTN3VEtmeUUyelVzc3YxR05JbmIwU00vcHh1?=
 =?utf-8?B?eFMwd1dHaXBETHY5WDIrMXAzMy80T0VXaHRHUlAxVGFGcWJCdVlrNWFveU9x?=
 =?utf-8?B?UTRFNlFjN3NPd3ZTRE9aV1p3NDZJdE9sWURWRHNYcFFleWZPUlJrVkh0VlZX?=
 =?utf-8?B?bTl0SGhYQXFyV29UOTJYcm95ZTBGR29Gckp3U09rck43c25VanBUUGtwQlRC?=
 =?utf-8?B?L3g0VVJzR1R2RmR5eTRkblloM3grQXYxVEo4NDJySEhac1AxcXBqOFBhUVFF?=
 =?utf-8?B?aE5CeDJCR1RLcFFiclh3RjVhcXZnMk9LeW52VVZMZC9DVnR4TUVkcmFUNGxU?=
 =?utf-8?B?cFdmOGxUS3VCNENZT3dXb0FtVmJZSlJ6aFdSRFM2aHBQd1hCVnRva0kzeERQ?=
 =?utf-8?B?cmZ5MWI3dlUrTk4yTTEwQ0VtT2FWVVYvSlpvRDdWU2cwd1JVY2N3WmNvNHhx?=
 =?utf-8?B?MDgxWDZuMjZSTlNMWStxQ0V4T25PcVB6RC9qZi9CNmNyUDByek01NngrdHIx?=
 =?utf-8?B?cmx5YS9hK01VUUNiSnVOcjVxZjh3UDU2TTlzL2l1TzFKOWdUbGF6dkZ0ZU1R?=
 =?utf-8?B?eW1QYlJWUlRIZDJaU2ZPTVl0ZEhVT0hFYjkvYnJnNWlJVjJQVTdSQk5iYW1w?=
 =?utf-8?B?UFJGaTFxOExCNEpkWFBXdXpud0ZVdVdxZ001c0p0dEhuYmNlOHY3TnN6allO?=
 =?utf-8?B?VnJ6c004ck9UcEljZHlwbE5mU3hBZ1NtNG1LQVhoMnRLUUlpcllSbHM2djhh?=
 =?utf-8?B?VzhHRHkxSEFDQ3pyUXRzMDdkdjRnMnh0ckkxMzd4REYwYUI4c0t4d3NzazlL?=
 =?utf-8?Q?M4pSjFI0NLppeim/jN0Vjv/2FpGmbHy9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635901c9-9a00-43be-c974-08da0c9ce246
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 07:15:33.7212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnNpwi32qEZnllr5QmuCac2aIzHQSK4NPLUFpUuY3ZqdX86tIjQQ39CFNdzNukoo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4517
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.03.22 um 10:34 schrieb Cong Liu:
> qxl use ioremap to map ram_header and rom, in the arm64 implementation,
> the device is mapped as DEVICE_nGnRE, it can not support unaligned
> access.

Well that some ARM boards doesn't allow unaligned access to MMIO space 
is a well known bug of those ARM boards.

So as far as I know this is a hardware bug you are trying to workaround 
here and I'm not 100% sure that this is correct.

Christian.

>
>    6.620515] pc : setup_hw_slot+0x24/0x60 [qxl]
> [    6.620961] lr : setup_slot+0x34/0xf0 [qxl]
> [    6.621376] sp : ffff800012b73760
> [    6.621701] x29: ffff800012b73760 x28: 0000000000000001 x27: 0000000010000000
> [    6.622400] x26: 0000000000000001 x25: 0000000004000000 x24: ffffcf376848c000
> [    6.623099] x23: ffff0000c4087400 x22: ffffcf3718e17140 x21: 0000000000000000
> [    6.623823] x20: ffff0000c4086000 x19: ffff0000c40870b0 x18: 0000000000000014
> [    6.624519] x17: 000000004d3605ab x16: 00000000bb3b6129 x15: 000000006e771809
> [    6.625214] x14: 0000000000000001 x13: 007473696c5f7974 x12: 696e696666615f65
> [    6.625909] x11: 00000000d543656a x10: 0000000000000000 x9 : ffffcf3718e085a4
> [    6.626616] x8 : 00000000006c7871 x7 : 000000000000000a x6 : 0000000000000017
> [    6.627343] x5 : 0000000000001400 x4 : ffff800011f63400 x3 : 0000000014000000
> [    6.628047] x2 : 0000000000000000 x1 : ffff0000c40870b0 x0 : ffff0000c4086000
> [    6.628751] Call trace:
> [    6.628994]  setup_hw_slot+0x24/0x60 [qxl]
> [    6.629404]  setup_slot+0x34/0xf0 [qxl]
> [    6.629790]  qxl_device_init+0x6f0/0x7f0 [qxl]
> [    6.630235]  qxl_pci_probe+0xdc/0x1d0 [qxl]
> [    6.630654]  local_pci_probe+0x48/0xb8
> [    6.631027]  pci_device_probe+0x194/0x208
> [    6.631464]  really_probe+0xd0/0x458
> [    6.631818]  __driver_probe_device+0x124/0x1c0
> [    6.632256]  driver_probe_device+0x48/0x130
> [    6.632669]  __driver_attach+0xc4/0x1a8
> [    6.633049]  bus_for_each_dev+0x78/0xd0
> [    6.633437]  driver_attach+0x2c/0x38
> [    6.633789]  bus_add_driver+0x154/0x248
> [    6.634168]  driver_register+0x6c/0x128
> [    6.635205]  __pci_register_driver+0x4c/0x58
> [    6.635628]  qxl_init+0x48/0x1000 [qxl]
> [    6.636013]  do_one_initcall+0x50/0x240
> [    6.636390]  do_init_module+0x60/0x238
> [    6.636768]  load_module+0x2458/0x2900
> [    6.637136]  __do_sys_finit_module+0xbc/0x128
> [    6.637561]  __arm64_sys_finit_module+0x28/0x38
> [    6.638004]  invoke_syscall+0x74/0xf0
> [    6.638366]  el0_svc_common.constprop.0+0x58/0x1a8
> [    6.638836]  do_el0_svc+0x2c/0x90
> [    6.639216]  el0_svc+0x40/0x190
> [    6.639526]  el0t_64_sync_handler+0xb0/0xb8
> [    6.639934]  el0t_64_sync+0x1a4/0x1a8
> [    6.640294] Code: 910003fd f9484804 f9400c23 8b050084 (f809c083)
> [    6.640889] ---[ end trace 95615d89b7c87f95 ]---
>
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> ---
>   drivers/gpu/drm/qxl/qxl_kms.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
> index 4dc5ad13f12c..0e61ac04d8ad 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -165,7 +165,11 @@ int qxl_device_init(struct qxl_device *qdev,
>   		 (int)qdev->surfaceram_size / 1024,
>   		 (sb == 4) ? "64bit" : "32bit");
>   
> +#ifdef CONFIG_ARM64
> +	qdev->rom = ioremap_cache(qdev->rom_base, qdev->rom_size);
> +#else
>   	qdev->rom = ioremap(qdev->rom_base, qdev->rom_size);
> +#endif
>   	if (!qdev->rom) {
>   		pr_err("Unable to ioremap ROM\n");
>   		r = -ENOMEM;
> @@ -183,9 +187,15 @@ int qxl_device_init(struct qxl_device *qdev,
>   		goto rom_unmap;
>   	}
>   
> +#ifdef CONFIG_ARM64
> +	qdev->ram_header = ioremap_cache(qdev->vram_base +
> +				   qdev->rom->ram_header_offset,
> +				   sizeof(*qdev->ram_header));
> +#else
>   	qdev->ram_header = ioremap(qdev->vram_base +
>   				   qdev->rom->ram_header_offset,
>   				   sizeof(*qdev->ram_header));
> +#endif
>   	if (!qdev->ram_header) {
>   		DRM_ERROR("Unable to ioremap RAM header\n");
>   		r = -ENOMEM;

