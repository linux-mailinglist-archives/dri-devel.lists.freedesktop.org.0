Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CFA7EBF70
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 10:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2994510E516;
	Wed, 15 Nov 2023 09:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50FE10E505;
 Wed, 15 Nov 2023 09:27:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KB4jXWaMHQocntYZYp4+TiuX4tQAFA4GUgw9ALQBvDliUvqSXrt84dGFNkg3wTHIsxmGklB4V54TOFQ3hACH/meww69hVUcLWCbz767bQtsU6xlzNKt6WBhkGybxHwp6JTLtrYQRCAfwX+YLzrbZedvP0ioGcEUqFBNOKAbEfdGRLH7OjOvzFLiPa3pZO1eVmBrzq4xNkMDeQg+CexpiEuDxlTvGTnfxYnx9wGKCy6iNHmWgTZH4QTiwJgWpRPM5GTelf0m9cwse7N7sKN0Og4fls+Uau17rr2Fn2Px2nOEMplaGUgy3hw4pvD+zKKq1ideWIc9YyLxXow9PR69Jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZPyNGxoeVgDtj8QVEiAyklHT19cFxs3qEW/nOdus/o=;
 b=cuWge0SW8jQS4tld9IZLoWqGAF1E/9ckLNmB8TFRdNxrr32IyhSJl0ePfi9zgRZtPT+ggPUGlwvjBn6rFBbBgH7hD/nlMvty91iEKoEf7PCyt8g/JXKgWLFuGkq9fNVtd20MvNxvlL7JVZFBuUndSqp5a8XJtdd6WdXWYvdsJTvm3iyjmhLaZ9hoMxumFpi5qsdH33uhpDdwM2VIQJCNaFXKuQz9ntwEWaj8Ja2S4JYWP3wIlpfLf3ew1UfoCYNF4CX45Q9WONPXqBRQ5ajusw2GQ9Aw88iSr1G0oubgU0D5lRtG1o/ZmjsT25dRd20PBi2TBNMukeGr0Na/+QOjyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZPyNGxoeVgDtj8QVEiAyklHT19cFxs3qEW/nOdus/o=;
 b=t1yyerzs38ZUckQVafeEfpDapJNb3rsGau2B6i4ne91LNcd8rWgXQDcycWAhZTuzNtWOYClxXHTMizSfGjlDR/7H8XKFvYOHQtM45Mx2tF0nONoKztjWyn+myf9Sx3Yg5o2xQPGkTXl2mjBk5m0JfBJrXKl5TlF7cuB1G3THp70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 09:27:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 09:27:41 +0000
Message-ID: <5fa7aab7-3bf9-4491-a822-fd686efa5376@amd.com>
Date: Wed, 15 Nov 2023 10:27:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/radeon: Switch from
 pci_is_thunderbolt_attached() to dev_is_removable()
To: Mario Limonciello <mario.limonciello@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-3-mario.limonciello@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231114200755.14911-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 9838de35-dc39-486e-96b5-08dbe5bd1d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LK3jqHBnRo450t+gkHEjXGxCcJQUQgLWMQ0+JMk5b6KIVgVwNSHwoZvk2a4isChY5PZyYS0kOV7JUqbddO5WbWWcac+qT9z5b1d9VoMJqrAn1DbjDRdZNedAc7kE1IUdetsm9tPke7shKLaKfYefSR0YRSBGDX40nisy3HrKyspyuaQ2CY4Gcgr5hCaMrCbaLuPWD6jXiP9GBIYuLcw+QE8N0HXwBMaZt8WE7J3p6P+N5UzeJGkJnUsbDcYON7R2lZBVsJa2MOm2AFalSxoU2+IRH6U2Tq4VjIFyam0eiix0/k5vKSMuLy8tTeodeOgvNleL2P5WhDTErLPk/Jsran4guktZ3tYHLI2BNm9gq5j1ZkQxah36XJgpBIdOMPp8Xv779OJeDkeAx8+h/lhUK7R6zdQmv75BXw5zYkvsEED4JQpvjkSSBFPCuZmPwgqaCtRqQc29zmN40zfOok4EcanGJ1Drx6c3B+bDAX+GEmPOb9hNy/g0Zj4Z+Sb9N9djwt0HyYZVcmR7twC8cdq0KOhmUG+BfvN/z0O+NNyT9bSiLFmgs+9+UtuSuRPD1dBGlWGjukkY6U5Hxa/8Xw38+/ZPvtzgeh8qdF4W2jcIxPRdPIKX4RUaG+JhapCzUoedzyzf82RiXYvNfWzJxnC8oLUxD+ko2bYU4r5D7zR5mv+f0dzJRM3ag/PrcOycih3a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(366004)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(66476007)(6506007)(41300700001)(26005)(2616005)(6666004)(66574015)(6512007)(83380400001)(4326008)(8676002)(7416002)(5660300002)(8936002)(2906002)(6486002)(316002)(478600001)(110136005)(66946007)(54906003)(36756003)(86362001)(31696002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXJYdjRlODYwQkFaN253QkNlRUVmWEtrd1dGenQ3V3JGbXhhN216dm9UTUMz?=
 =?utf-8?B?MDN6eGsrZlhockZOREQ3eUJ6OE9ueE83NnVUZ29Camp0eWlWSFpxa2hXM0tr?=
 =?utf-8?B?YUFxdjg3c3hrRmEvVTBta0licXljQzA1M21TL2IvczRSN3NYNXVucWI2UTQy?=
 =?utf-8?B?YTNiYVdzV3dOeDNqUnNwRXB0eER0ZFI3WlNYcGxtQUpwdy81bHgyeHFrUjRZ?=
 =?utf-8?B?bE1VT085dGRudlNXOVdwVVdRZDB5TGlTTlowR1JjQVEzdEZKZkc1dFFWZDB6?=
 =?utf-8?B?dEFHUHpucGZkcGc5MXFOVHR5OVdnRzhIckZSQzBlVFVFd0ZYUzNBcFltWkEx?=
 =?utf-8?B?NldlTVduVWZrWHFaUmNWT0EwTVArNTJnTkdGYmVhY3pEOG5aWFJGa0puRmdw?=
 =?utf-8?B?dHM1eTc2VlFPTitHRWNrZkEvNDRhWFNwZFgzUE42cFhKYUlXVUxIVjVnOEw0?=
 =?utf-8?B?RmxaVGNyMmk4Rk1IZlZjcldkQmhZU3RmL3RWc0VmRGpxbmc2UStSYjRaYTNx?=
 =?utf-8?B?c0N3K3ZGdFhZemxac2tSQmQ0eC9VNXh5cER3SjFMTVFMaEc2ZG10bE9IOUsv?=
 =?utf-8?B?dnJZVUhTckhjM3pUQ0EzUEZLSmZzcnhtZXRXNTdsbGMwRm8ybEYxRVkrQXhp?=
 =?utf-8?B?ZVJTWDN6SHBsRzJjQXBjR3d6MkowZnFveVdIRVgxTWt2TEFscWluWUJKb25C?=
 =?utf-8?B?cWNmZ0hnMDR4T0tFaDk3cjRBclBTN01jZ2RjalowUXZmVFlaM1dOYWJtQVpP?=
 =?utf-8?B?NnQ1YzRsd2llQ0pvc2RrNjd3ODk0VmhaMm1BeGMrQTBhVExWVzM1MXhYcUt0?=
 =?utf-8?B?TlJqeDlEbGdyNldoQTlPWFpnTkdEb2NYZVJjRTZadERTeWw2Ny9FN0pTcDFq?=
 =?utf-8?B?ejVPSHBJdGVva0I3WUQ3R0tidHU2RHUwd2V2WVJnYlYvc3Z3Yk54N1lickN2?=
 =?utf-8?B?SVBQR3pIR2w3ZlA2eVd5K1JJYlppazVNbWNvYlhaVC85VDdVRmtiUnNxNXNi?=
 =?utf-8?B?ZXZtK044RElrRi9FS0RFUTV3MEtxTExCRkszc1FoRUptZVBPYkNBVk5pdkZU?=
 =?utf-8?B?Vm1Od1F2UVhmQjBtWmkreHRZQUV5cUxmUGtSOXRMbFBZKzYyYWpvRlA5WjRC?=
 =?utf-8?B?eVVibGU5eldyYXJ2UEwrSUpnZHZnOE9FUDYyZ2ROM0k5RGRZL1lsTTRtTXFG?=
 =?utf-8?B?ZTdUVjB2Y3JvRTB1NU5QaXB6RUlENm5jbVNqbDRZQ2RxKzM2Y01hZEFaUEJa?=
 =?utf-8?B?aDQ1b3RPamdjakRicDNPeWJCQlRsamRCbGFlYWhUQ0RreUZ3dG9Cd29UZTlI?=
 =?utf-8?B?Z29meHVPZmNBMStxait2TVFXMUxwQzdRK0F0S2hPY0IzeHhmcmJPRzh2THpw?=
 =?utf-8?B?NGoybHJCMXZpNjhTT1JxdTY0c2x0Y3lJS0ZTWFpSNTVmYW5YK0kvYjR2a0xS?=
 =?utf-8?B?dm9aeERDbXp6dE9Pd25DZVlMenRCeGVBbmtOSnlURnE4MXNzRGRWcGRiUFZv?=
 =?utf-8?B?VVlFVU04anUycFhZUnA5LzY1TjZjQ0NFRGZjYTROb3FjYVNiNExqVHV0UEVE?=
 =?utf-8?B?aGx6bHpyOEF4dk0zUmdzVWtGK0tpMUwyN1VOaDhVUStwYXYxUlJ3Uk9FZ0M4?=
 =?utf-8?B?T1Z0Uk03ZzZUSTc1a1ZxQ3NEZ2Y5Mzg0OVowZk1BNTA3YjhpQzBTenRTS0hO?=
 =?utf-8?B?T0pBVllhcTRJU01OdkR3ZnAvUWNCVXhvNGlFWWlEVEVyVGNKcndaR01GVkFa?=
 =?utf-8?B?U1hBSzJ4cllaQWNpNk1YYWVLMkRhQVZrbERBaHdFSCtSTkpLT0RBakQ2MG81?=
 =?utf-8?B?TGZBTXFLTnpmNEJ3Rysra3VlQWo3YkUxL09LeVpuTkg4RkR3WE1IakZrcW9v?=
 =?utf-8?B?Z1JjRkJnWHQ1YVlETVhFS3BMNEFQVWcvSkNLcEpiRDYvMTlPcEIzVm1PNU9z?=
 =?utf-8?B?a1RocTBJMnJxN2dSWnRrcElJdmNWVkJnUmNwcHFDb2xDakRTdmdqTDZjMzNn?=
 =?utf-8?B?YllReWl2N1NlK0ZoWG8zRXNoYUNJYjRVcUtjOGF2ZFI1ZUlYTFhrN1lINEYy?=
 =?utf-8?B?SDBGa2FBYmxFcGE4dkEva0pXTFhyR1d5cElZTlArSUhteHB1K3A2dmlIQkp5?=
 =?utf-8?Q?OjVY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9838de35-dc39-486e-96b5-08dbe5bd1d7f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 09:27:41.1544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvgEbFTAbdDZz3cgVD6DopAkmg9xa5k20G41pCVcC3cF2DRqBDrj/tbP0cPLQhcl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406
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
Cc: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.11.23 um 21:07 schrieb Mario Limonciello:
> pci_is_thunderbolt_attached() looks at the hierarchy of the PCIe device
> to determine if any bridge along the way has the is_thunderbolt bit set.
> This bit will only be set when one of the devices in the hierarchy is an
> Intel Thunderbolt device.
>
> However PCIe devices can be connected to USB4 hubs and routers which won't
> necessarily set the is_thunderbolt bit. These devices will however be
> marked as externally facing which means they are marked removable by
> pci_set_removable().
>
> Look whether the device is marked removable to determine it's
> connected to a Thunderbolt controller or USB4 router.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Christian König <christian.koenig@amd.com> for this one.

> ---
> v2->v3:
>   * Update commit message
> ---
>   drivers/gpu/drm/radeon/radeon_device.c | 4 ++--
>   drivers/gpu/drm/radeon/radeon_kms.c    | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index afbb3a80c0c6..ba0ca0694d18 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1429,7 +1429,7 @@ int radeon_device_init(struct radeon_device *rdev,
>   
>   	if (rdev->flags & RADEON_IS_PX)
>   		runtime = true;
> -	if (!pci_is_thunderbolt_attached(rdev->pdev))
> +	if (!dev_is_removable(&rdev->pdev->dev))
>   		vga_switcheroo_register_client(rdev->pdev,
>   					       &radeon_switcheroo_ops, runtime);
>   	if (runtime)
> @@ -1519,7 +1519,7 @@ void radeon_device_fini(struct radeon_device *rdev)
>   	radeon_bo_evict_vram(rdev);
>   	radeon_audio_component_fini(rdev);
>   	radeon_fini(rdev);
> -	if (!pci_is_thunderbolt_attached(rdev->pdev))
> +	if (!dev_is_removable(&rdev->pdev->dev))
>   		vga_switcheroo_unregister_client(rdev->pdev);
>   	if (rdev->flags & RADEON_IS_PX)
>   		vga_switcheroo_fini_domain_pm_ops(rdev->dev);
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index a16590c6247f..ead912a58ab8 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -138,7 +138,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
>   	if ((radeon_runtime_pm != 0) &&
>   	    radeon_has_atpx() &&
>   	    ((flags & RADEON_IS_IGP) == 0) &&
> -	    !pci_is_thunderbolt_attached(pdev))
> +	    !dev_is_removable(&pdev->dev))
>   		flags |= RADEON_IS_PX;
>   
>   	/* radeon_device_init should report only fatal error

