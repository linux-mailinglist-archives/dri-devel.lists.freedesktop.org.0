Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE8735D5B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 20:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7405C10E13F;
	Mon, 19 Jun 2023 18:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E9710E12B;
 Mon, 19 Jun 2023 18:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9ASOTf0Ae4N/pA3NDmw9V6KJ7fCfxxUuVVscJ/yGvAO/jMZx+V0dcUoRgDxrOqsdSiANX/ZSlacT0jdMRDFq71djiOaheL7CK+VkfcGalPz3vKc+/1QiEJtmX1fdfQQxPWReCDzgDd0H2qiFcrSGl3/AK6SSZJaTQCxAu9OokL+uHPXWJlXiXh79q+au8xOMeh/MSuzoJ6G+Nb79XC7WRyKmtOH565RcCYFVUHdZDH6u9gMcnjl7o3x67e8DBsYFkQ+maHkrkh/NjN9Mbows/8Luh+NWWNLKM7E8ooPfgvgUz/cj309qw7r4wqJ+XkgbE0Tke0MjWYNwo+8LRGF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNx2tuIqkkYvNYrFmw2RBueysxlbi+wGA9aBScBp59s=;
 b=NNtW2dKKoC4yXoTCR65k09SjJvm2H08ckF5Cpkdz/f0dy+9uu174ApCCg4hrG7Y//EjGIOVv/xGLqV0wGP02oY4TxyyMSCg+7OP90xTckUMZfCAE/2rujv4I5kwhbk2J8F2Ee46stnzI5Ugjpj7DgohYFySn7TyFUReHUbbWG8O2sIvCpZ0eWQc7XymbBsQTpEnPcEOdIZrj2OwMtqwq4a4M+sg47DRpPIfbNjYu5amlxAvi7f0HJFC/e0tFWClHTvLWUBqUBlTxhZOPNhvSvg/oHpPUK4S6tnJfTHp5FfUDOJz4ZT+YjyN8fPbQzLWlQrayOesPIz7R19CEtnBwQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNx2tuIqkkYvNYrFmw2RBueysxlbi+wGA9aBScBp59s=;
 b=sYLNZC81/VFddJ9CRRLiEVs8BKS3Bnldwjg4LxyN+mHYkuonoVKwJMyRwFDgwzEOI9d7+wRHWCHSTf1GNYzzGmFrdWjHaelmsnEbd7KwUYBgK/jqDu++d8K+slFb+/hHT9EPN21Geo8/2pmm+D3rV/jJyRa6LJLCRzVss5ugL1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB5884.namprd12.prod.outlook.com (2603:10b6:208:37c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 18:12:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 18:12:56 +0000
Message-ID: <5b6fdf65-b354-94a9-f883-be820157efad@amd.com>
Date: Mon, 19 Jun 2023 13:12:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v6 2/8] PCI/VGA: Deal only with VGA class devices
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Li Yi <liyi@loongson.cn>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Abhishek Sahu <abhsahu@nvidia.com>,
 Yi Liu <yi.l.liu@intel.com>
References: <20230612192550.197053-1-15330273260@189.cn>
 <20230612192550.197053-3-15330273260@189.cn>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20230612192550.197053-3-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0050.namprd07.prod.outlook.com
 (2603:10b6:5:74::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da40299-46c0-46bd-f82c-08db70f0ce8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ZDmG/WaUMkOoeDfjtgZMVBMu7T2io108gmgJ+QvkLSHk/lvRFBXxPbdU+YeE9R4dLQuFDjTEsMcfyzUIFNEHXHIUMIPGVXzifeULILL08jHXHclE4IzjhZG1zJ+QinPeuDUgukhnHh3ZrkMoxHtqFm98oAtbLgjZeIUnzbJ8cwxPpTwWTpqsbzYeOEBg4NRGls5gwcJtehz4fptNrjMIj5oVl+VrJWfm56W37dWC17loEY76cKHAcMwFiy9EVvi83HoGn+dGwnWTdzO4MHWh+SZsom3kbKBwWcqXSQYyDhObSRLXwPx9eBQ1TEat6tSiOo5u3kfA3UhSnnCxx1RZdmpEvvZ7RjcIgcSDtvtjwjDj2Oy4huMxvHiT1LB8MBANKnCKW63pm8TkfIZu35H19bvHD6YKQe7c7wLjB2/oVt3f6NmXgZLK6JxSe+PsMcd/SSBvFES8lJWACoziRRm+vK1YJPY/S134KjtqpF+z6ZLFwDlqUQnjjnXRbVTXSZkkeIyjO2tpsOkb4VMQKW0ZX0jlhU5ff1GuXhDlwqoEnXusLo7J5yLf9LKC3zwaYE22yufuoav15Wl+2qAi9WcFjdRSDQAbs3EHaWIy4jAHuhOiAfyOvKnheElOFRgFUQ8XMWzXcsrlL3defOQTziaOzY9vHOnqCeIt2Oz9j9h/X0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(66899021)(31696002)(7416002)(31686004)(83380400001)(38100700002)(86362001)(41300700001)(8936002)(8676002)(7406005)(5660300002)(66556008)(66476007)(66946007)(316002)(2616005)(921005)(6506007)(53546011)(6512007)(26005)(6666004)(186003)(6486002)(478600001)(110136005)(4326008)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejJvSHZiVzhNemdmOGdENG54cnBWWGZGUGV6ZmVZU3BNRW94MjJLZE9sa3ZS?=
 =?utf-8?B?elJxSVRjZlRNTThhQVFZbWdaMjFVYjdlTEk0MkJzeWFGWi9Tb2xsaU9CUDFy?=
 =?utf-8?B?RzVWZlJhdmREWlBraXRzYkNxNXhWcXhxcUUrVjIvYmtaRkViM3pRaDlmdU4y?=
 =?utf-8?B?cy9Ic0N5TnFoMEVkcmQ5R1diSEFUbXdqVzkrZFBSVTVvcXRsaUhOMTJCaWd2?=
 =?utf-8?B?Q3FtMC9UNVhTNGpUMk5XRUxaZ3ArRjlsMkR6dzJzU2xZUzhMMUR3WldVbVhI?=
 =?utf-8?B?MW9oVjB0V25ZbFdhdWI1enM3SHcwYzl3RzB0WWlQUGpqdXhBZytnOVlGdVRC?=
 =?utf-8?B?SWl1dVVKOTJ4bm5ESmN2b3R3Y2Rva2xRMEpVeVlVc3BrSERDbVA3L2t3alBB?=
 =?utf-8?B?UTdFQnQ0WDR6bENKTnFkcWwwTzBPc3ZwMEFDbExuUUM5Z1Jxa2tzVGlHQ2hF?=
 =?utf-8?B?TjJZTHZ0WkFQdmJObE9YbG5BVGxNWlhsV0VFOUo3d1VoRUVTNXJVd0h2cVg1?=
 =?utf-8?B?bzhRcmVhMEpLY0xHT3dVUlMwWEtuZ2lKNC9vYkhnVkxKdzZQYjJyYlQyQ2dE?=
 =?utf-8?B?NVRNenRjRjhZKzlIbmNIbSszaTZUNEVpRS93TXhPL1VmRnJVKzN5Tk1tUjhE?=
 =?utf-8?B?RmZjZUtxMWZDOVR6TGhWM0lDWEFSSmt0eDNramtzcC9pejNiOFl1SmZKYnFF?=
 =?utf-8?B?OGY5OWNlZm5NaDBXSWJOajJXQ0hoeVRTa2dhR3FFZ2hJYmY0bHV2eTk4MVls?=
 =?utf-8?B?dXNUZGx0YzRMN0hFTjNYc2Nwd2JXWmZJRlhhZEVjUGR0MGJScGZDU3RBaFNB?=
 =?utf-8?B?bmg3bVFieEdwMzVNbU4vaTgrVlRPelBoU25RQkF4aEZiSUNSN1oyckxVZkNp?=
 =?utf-8?B?SzFET0pZM3hpWW9MT0c5QnNnd0ZjQTRodFVDK1BMUkczeHMwcTNLMmpKcXNX?=
 =?utf-8?B?bklnRThxdHc2eURmS2pZUjFsMjRyRGFLb0F3d0FndGw0a2VRTGRRMDRMSllI?=
 =?utf-8?B?YTVRS0ZYMVdPVE1PTG5yU05UV0lGbUd2Z3Vnc0UxdHU4WmozTENqcnZTQmFH?=
 =?utf-8?B?MXFIWE96WENEcjBkNGw3NDZiVzFtcHZudWNRNGhRa29ReFB4MXYzaGZZWEtp?=
 =?utf-8?B?TXlnbTNDdU41QWNPTmJXNmZxK2o5eUIxV2diVXZoRUg4b2xpa3k0OVVPcktR?=
 =?utf-8?B?MGdYWHJPV3ZRQ3hmZG9ZTElIbHZrU2pXZUxpSVpmY0QxZm1Edy9iMytudEtx?=
 =?utf-8?B?ZzM0MExZNmR1WVFySkJERHh6NlpnZVU0TkRUL0x3VkRndFBPYWtpQkxleUFw?=
 =?utf-8?B?Um9uelQxcHdiMmxhTUVtNnRWVm5hOTBuWS91dWpPc0NYTWV3Z1NpcUE5YjVh?=
 =?utf-8?B?L0VyUEhzQ01pTEMxVDE4U1dYMTVBUlpvZ0RWaFFQL0N3QW9lVFlPdnhpKy9G?=
 =?utf-8?B?bFBRRmpKSDErd1l0SGxrRFNmbTFlZHRtQUlMVHVxV1haNk8xM3JjRlM1dzNP?=
 =?utf-8?B?dHdROUtqNGVZdHdQclVFTTNNeStOWmVBZWd4ZU40dmFVTC9STldoczFDaGtO?=
 =?utf-8?B?WjVzc1pnc0UvK0w4SjVUSU1ySm1obFhrMm83VUhQemxzalBVZFdvbTNzYXhP?=
 =?utf-8?B?bVB0Q1haTjBIS0NCMi9KR2s3Q2c4ajFhNTVQL0t2amdlcE5aSG16S29LSG1l?=
 =?utf-8?B?QlRvTXFkcnhuNUUwNTlxUU5kTWp4Q3M4bmJNMXFPV2pvRnlUSjdrVjJ6UE1m?=
 =?utf-8?B?QmRuaFBRcS84VjY1TW8vdUV5ZHhwWmlDREh4NTlHOUhTdDMxRGRtKzZSOTV6?=
 =?utf-8?B?eVBmalJjcm9objQ1NDlsbXZNMWgxUmY2TnBqNnQ2Vy9zTXg5UWlCbzBzS0k5?=
 =?utf-8?B?UExacElXZC9VTzdMMEpVbDJSS05GdURYclk1Nk5sRDlVZUFmTkErNjNsNVRy?=
 =?utf-8?B?eXFPR3NpVTRGMWIzSGUzS01OLy9RUEZWaEk4MWV5c1NIaUdxejl4MHlOT1V1?=
 =?utf-8?B?NnNJWkJUSHdsQXZGemhhak84clFPZkVFbUZQNjVTZHJFTExObVQ1d1p6am51?=
 =?utf-8?B?VDV2K0pTRDZWblZHeVRSUTJOMGlhMUg0eGFUdUxTb1dCVHI1YVVqSEpxQjFV?=
 =?utf-8?Q?Vw9rcaGqFOQjQCbeoqrafFMr7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da40299-46c0-46bd-f82c-08db70f0ce8a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 18:12:56.4165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMkootrrO50AhxHV+7OpkOcMREW6hR6ZM6Fgt1SsvV3toYrbEGsYxDzRgI6lWeBNwqAG787tSJpk/7HD4SCI5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5884
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
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/12/2023 2:25 PM, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> Deal only with the VGA devcie(pdev->class == 0x0300), so replace the
> pci_get_subsys() function with pci_get_class(). Filter the non-PCI display
> device(pdev->class != 0x0300) out. There no need to process the non-display
> PCI device.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
This also means that deleting a PCI device no longer needs
to walk the list.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

>   drivers/pci/vgaarb.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index c1bc6c983932..22a505e877dc 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
>   	struct pci_dev *bridge;
>   	u16 cmd;
>   
> -	/* Only deal with VGA class devices */
> -	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
> -		return false;
> -
>   	/* Allocate structure */
>   	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
>   	if (vgadev == NULL) {
> @@ -1500,7 +1496,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	bool notify = false;
>   
> -	vgaarb_dbg(dev, "%s\n", __func__);
> +	/* Only deal with VGA class devices */
> +	if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
> +		return 0;
>   
>   	/* For now we're only intereted in devices added and removed. I didn't
>   	 * test this thing here, so someone needs to double check for the
> @@ -1510,6 +1508,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>   	else if (action == BUS_NOTIFY_DEL_DEVICE)
>   		notify = vga_arbiter_del_pci_device(pdev);
>   
> +	vgaarb_dbg(dev, "%s: action = %lu\n", __func__, action);
> +
>   	if (notify)
>   		vga_arbiter_notify_clients();
>   	return 0;
> @@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device = {
>   
>   static int __init vga_arb_device_init(void)
>   {
> +	struct pci_dev *pdev = NULL;
>   	int rc;
> -	struct pci_dev *pdev;
>   
>   	rc = misc_register(&vga_arb_device);
>   	if (rc < 0)
> @@ -1545,11 +1545,13 @@ static int __init vga_arb_device_init(void)
>   
>   	/* We add all PCI devices satisfying VGA class in the arbiter by
>   	 * default */
> -	pdev = NULL;
> -	while ((pdev =
> -		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
> -			       PCI_ANY_ID, pdev)) != NULL)
> +	while (1) {
> +		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
> +		if (!pdev)
> +			break;
> +
>   		vga_arbiter_add_pci_device(pdev);
> +	}
>   
>   	pr_info("loaded\n");
>   	return rc;
