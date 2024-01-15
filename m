Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43FB82D6C2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA510E191;
	Mon, 15 Jan 2024 10:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340BB10E239
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 10:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etUdDYQekrSULZP9yXxQ9+AdVYZ1f8SIFaRuPveYjWf5NnIvbEe06fcsC5uAQm+087+mopa57JEa9nBkGWgZTBSbihAF0CvvePNI+vPmOvcBj9TBKpyt+cVVoi6+4eFbx1RBpREnaUo+hmpKvCKk0MwZ55iL1NM79oxpIMy9wAkhZ95W8+TJ3kMeeT+tViAxgGl9jTUyhP44MvLgLC2I3iTTfr98QY+/+3hBVDQ1MSwqfqanX2IEqq0Qks2naF9V7A1nwsnQYbIUNZHHa9D55nZ4HBBvUwkqtYfinN83Ki2EIJY25IJYM4BW1GHX25xDuVHccP83LchJdkgc70qA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyWoOSC+/yPN/cxdCoCOeuoipEJ/NmP/UZKwLtBhhXI=;
 b=mNWO1mmNxYAoV9BRYbje69xtu4gEaTw0BkKP8r/XFiF3A9EV3NxxMWkO+ugmfk/JPSO5ZLUq05Ub93CK8TWT7Lp11h5fsLnyIMfO1AI/+HXCsEGPNtdMDTEM+RRLgdjWM1AhbGZ07WvhRCR/qPdCPeN6FZpdtS/d9hFkPjhvnkBRzH6+HbJnb4fS6RbAhzD2WaHfxHuULOTUmsfcl8Z5LXbBXj1jhydfUn7qncoox1hPlXeGW06GSByuoFguyAhkrnYhlrZPDy/tRoJxX7sZCLfFCQ9AUJRz6+M+Cl0D8U6hNjXtHkw8L/zljbboZYCKt7KBLVucNMOkX6q7TaTu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyWoOSC+/yPN/cxdCoCOeuoipEJ/NmP/UZKwLtBhhXI=;
 b=lOaTvEhFsHxZLEUM+OMRbmn/ofFkJQl18IrnqvNb/ADeiqXWi17MO21zFFxUL8zNJ0DzpkGnRja8JFN/AoOSpsGqMyWyz5YpXUnUq3hfcv+vny4Zyv/iblozCdXCRR57HT2n7U/aCc5TPkr/P5s8GcraeQj9eWMtChjV55JkLUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9117.namprd12.prod.outlook.com (2603:10b6:408:195::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Mon, 15 Jan
 2024 10:07:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Mon, 15 Jan 2024
 10:07:50 +0000
Message-ID: <a90f3781-b7c1-4c43-8541-3024968a01d8@amd.com>
Date: Mon, 15 Jan 2024 11:07:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: fix ttm pool initialization for no-dma-device
 drivers
Content-Language: en-US
To: Fedor Pchelkin <pchelkin@ispras.ru>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
References: <20240113213347.9562-1-pchelkin@ispras.ru>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240113213347.9562-1-pchelkin@ispras.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bf4c7e-305e-4261-85e5-08dc15b1d4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2581H2XL8lTlVmfLtltGv59QHCtJMSTmkFx1oXqnljKMCxJtxjdlHQzzuCo30Ik7zbX41dwmGj6lhdtIzJMV4A0dlrn8HAFSwfWTiB78vOXmCUYtD1x7I4MU5sS2bEihk2cAokF2+lUy9Xl9UJaC0S0OJ/GOPrqVIPinyfTZ0pv50tYbKnywlQ1zXOIernPP1Pfa2MRfJ+sdSBcyhbwMg86vDKVpU0SnxGtbVOdpnkMRaLn6KofX4XPMU2I1hztbEG4DG2Vo3U5wFEbsDuux78mlctVRXNLJEQkZ+1+y35RepGu4I8+cWmrNQVedWYXFTbDe3Z0YbZw0Mdw3hsKeoY0hf15b50gi8T3ivKlCZLSnSYq5oaDUb43E9KqpJdinyPRvumhdPgpOQYL4gC3lzGshio4Jttx4BNsD4H/vJyuX0VGXg91kKRLxAXtvDfYfv0KB4KauQXVt8KN28Dmg73IKgOl8xcq5QTaqXB+4GQo7MGQl4XxlTKCGATxCP+UT7i85teLI7B6n8yil/NK5JXAsJCfbFqTKauRnI9zDv6hLLLGnfe74vAFEsnAbq3ZCzu01lzrD6h43ahX6g1oNWlfHl4pnyGVBylhSlMEqCofePm4mmjFSmaz28T+sspGzRSyXMITV983ieR/iRw4Cww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(36756003)(7416002)(5660300002)(2906002)(8676002)(31696002)(45080400002)(6506007)(6512007)(478600001)(6486002)(6666004)(41300700001)(2616005)(66574015)(26005)(86362001)(8936002)(83380400001)(4326008)(66556008)(66946007)(54906003)(66476007)(38100700002)(110136005)(31686004)(6636002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGtGYU5LdVBJeHlydW9Zb2JKTUdsdUN5WCtwNkhnMVpYbmROMFFRRHJDeFhR?=
 =?utf-8?B?SU8zUjM0dUtrT1hTaXEyNWNSMGRqakp3YkxNRWlPL2NUQlE5eFVrSWU4V0dk?=
 =?utf-8?B?N2gwQ1RleTY1QTJtbWpMMG9icTJVNlRlYk9KNGZScmxQbFNoUUhEbG5oam5F?=
 =?utf-8?B?aUdPSmxDTWRzSkNCclVYbEU5eEVLeDhUaGcyZHp5V0lUS2FaZmR4aXBqYko0?=
 =?utf-8?B?dHIvYTNUWUdYcmVuV0Y2M1BxV3ViS2t6R0cydnpwdjFXWisvQXcrR3RYMDFS?=
 =?utf-8?B?aExRWmVKb3JvUnd3Q1hjUEprMklKcTFTYnpXcmFJTUZSbW9KUU4vRW1BT2hB?=
 =?utf-8?B?NlQ3TE16M3Q3TkRFODJkQTNPNEphMXlSd21WVkE0REk4ckhHbDl0VTZIeDYx?=
 =?utf-8?B?cWkwcGxuczh3V3kzaEhWZWp5UlQySzdWMFpuem50bjI1eVh3QTUwMGg3QXd3?=
 =?utf-8?B?YzJ2SVo1anZMNEkrM1l2cFZwYUQ3dTN3TnhCSjloNmNxd1JaTnZNUGEzWE55?=
 =?utf-8?B?L2lVMWZDZUFDc21aL2hGNWRRTVBMeHJkbEZGUUxKdHNST0hkTlRGTFNGNnBk?=
 =?utf-8?B?Tzl5NmRUN2F5V0hhNmVUSklQMEFDWHhkOXRTSVJYaVZ1d3MyNVV0dW5mQ0Fz?=
 =?utf-8?B?eFF0N09rbzZMM3pVdmIxWFVkK3h3cFdOY25VbXpmZit5alVTZzRFZzRDeDJ0?=
 =?utf-8?B?cnFEdE1UWC9ZMkFOQmVMRksrdDJia2hUWXBrMnEyZ3JuV1ZBcldoS0hOeWVW?=
 =?utf-8?B?TkRnQzNlZDFEWTJRUDZFZkdGQkZaOXIweFpxS3ZESVJTczhBZzJ2Y2l3ZEZO?=
 =?utf-8?B?QXd1b25obGhZT2NFRlBPaG13Zm9IL1lsemdleGViQ3UrWTNwaW1RbitpSXJY?=
 =?utf-8?B?bG1kRXcxM0NkVjRIZmpHOGZHOFN1Y1ZwR29xV3h6K0NUd216THlrejJseHky?=
 =?utf-8?B?eFl3RXpkQXFyWGU1dkNGdVJ3LzVoekxwTzgwMHdDVklXcTRDSFFzc3dOYkNB?=
 =?utf-8?B?cGZvcUE5b3ZleFhSOFVkUVlETkd1citzUXBzUUlqeE1YQTFFaFhNTnlXdHJa?=
 =?utf-8?B?VncvNjh5TEdsQWc4S05meTd5ZWRmd0hJejhIc1laY2oyZEZJdFA0SHdsU1dt?=
 =?utf-8?B?NE1mazQrMmpqNzRwU2liM2E1aEsvbldvY3FjaDc0OFkvdXVuNi80Y0cxV1Yw?=
 =?utf-8?B?TEdwMC80aW45V0RXS1kwanJJbXRkU05YRkgxaFBxcjdDdkRrLzdkbG5GUDFy?=
 =?utf-8?B?Yzg1OE9MNXh4azl1dzU5aVBoWk0vMDlHVTBWNkZiM0gxZGRwQTd1aWI2QVFj?=
 =?utf-8?B?YzVWblNQRHRZVFN1MjF5WTcySkVJTk16SFZrSjNERXBmNEpUMGxqd3NrZ2d1?=
 =?utf-8?B?MmM3ajNJSjVRMldtbHJvY1RlTU9kQy9ZcjdGeWxOQlQ1SGcva1BydnU0RHds?=
 =?utf-8?B?Q0Q5K0o1QWxXTmF5SXI2RGdIdzBBTDNIKzNHbGZKd3dCNEh4TzZ2TzBSdVA4?=
 =?utf-8?B?RUt1cXN2RjM5aXhFazNMQjBjK2lLRDIzOUczbXFhN3NkS2ZCTi9yT0szdWRR?=
 =?utf-8?B?V2dvQUxzWlhXUDVrcGM3WmQzN2tBSUR4RFp1V1lUSGlnUjdsNWNRb25uV21Y?=
 =?utf-8?B?MjFYUzMwNGNlWGN6MllSdmk0dWR4dHJ4ZnFyMjZwTU10NExXM2RNOWl0ejRZ?=
 =?utf-8?B?VExyZmdEWXcrQjBDVms3YmZjS3BsNWtwSm1STEJXYnUvNlJUM1paT0FoR1Iz?=
 =?utf-8?B?Vnkrd0Jtb3N3cWlnMmNnTU5wdU5jWDNaTjNpQ2NUeDF0bVg5TXEzaGNHcXBV?=
 =?utf-8?B?YkJGUTBnSjJ6dENiSFZ2WW1WMTc4RkZoL0s3ZzYzY0EyemRhamdMS3VjMDVD?=
 =?utf-8?B?eFp4WGRYQnQzbkJybzdEZG9pdVRKS0Z0aWJVRUhiQ01PQVRIVkJydjJWYVVN?=
 =?utf-8?B?K2ZYNXFwWS81RktjUUp5aFlWNkdkL3poQzJFYm1XTzhWZ2RVQ3JwTnBha1E1?=
 =?utf-8?B?YWljd3dBdWVzbXJIQkl3Q0h4SnF3Q1pGU20wdVpMbWRpODkrRHdXMHIyQzEz?=
 =?utf-8?B?M3BMVUJHRWlYTURwS0E1Z3VMMHZxaTQxRUFaREs0ZDFUWVFRT0tCZWVCb1Ir?=
 =?utf-8?Q?7gleV0/NQytATP3nK/XCek8dV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bf4c7e-305e-4261-85e5-08dc15b1d4aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 10:07:50.3633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95trVhstmDfw6xfAc0aNiNfQz2srBaL3Ls8/5N0d+ZEHr0fUj4jKQpis6+Kdk1aZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9117
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.01.24 um 22:33 schrieb Fedor Pchelkin:
> QXL driver doesn't use any device for DMA mappings or allocations so
> dev_to_node() will panic inside ttm_device_init() on NUMA systems:
>
> general protection fault, probably for non-canonical address 0xdffffc000000007a: 0000 [#1] PREEMPT SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x00000000000003d0-0x00000000000003d7]
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.7.0+ #9
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.2-3-gd478f380-rebuilt.opensuse.org 04/01/2014
> RIP: 0010:ttm_device_init+0x10e/0x340
> Call Trace:
>   <TASK>
>   qxl_ttm_init+0xaa/0x310
>   qxl_device_init+0x1071/0x2000
>   qxl_pci_probe+0x167/0x3f0
>   local_pci_probe+0xe1/0x1b0
>   pci_device_probe+0x29d/0x790
>   really_probe+0x251/0x910
>   __driver_probe_device+0x1ea/0x390
>   driver_probe_device+0x4e/0x2e0
>   __driver_attach+0x1e3/0x600
>   bus_for_each_dev+0x12d/0x1c0
>   bus_add_driver+0x25a/0x590
>   driver_register+0x15c/0x4b0
>   qxl_pci_driver_init+0x67/0x80
>   do_one_initcall+0xf5/0x5d0
>   kernel_init_freeable+0x637/0xb10
>   kernel_init+0x1c/0x2e0
>   ret_from_fork+0x48/0x80
>   ret_from_fork_asm+0x1b/0x30
>   </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:ttm_device_init+0x10e/0x340
>
> Fall back to NUMA_NO_NODE if there is no device for DMA.
>
> Found by Linux Verification Center (linuxtesting.org).
>
> Fixes: b0a7ce53d494 ("drm/ttm: Schedule delayed_delete worker closer")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

Oh, thanks for that fix. Reviewed-by: Christian König 
<christian.koenig@amd.com>

Going to push that into -fixes in a minute.

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index f5187b384ae9..4130945052ed 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -195,7 +195,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   		    bool use_dma_alloc, bool use_dma32)
>   {
>   	struct ttm_global *glob = &ttm_glob;
> -	int ret;
> +	int ret, nid;
>   
>   	if (WARN_ON(vma_manager == NULL))
>   		return -EINVAL;
> @@ -215,7 +215,12 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   
>   	ttm_sys_man_init(bdev);
>   
> -	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32);
> +	if (dev)
> +		nid = dev_to_node(dev);
> +	else
> +		nid = NUMA_NO_NODE;
> +
> +	ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc, use_dma32);
>   
>   	bdev->vma_manager = vma_manager;
>   	spin_lock_init(&bdev->lru_lock);

