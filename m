Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB0B7EBBAB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 04:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E6E10E398;
	Wed, 15 Nov 2023 03:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0A10E38C;
 Wed, 15 Nov 2023 03:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeiSE9rI38MZG4U03PIXdS7LiAGYUk6gG96pKK9qizHctB6SwIf4G/D3BMAMRdIPrQhTJsCSNGQfX5ZBzhsLfzcUA2nDr788u3EAyoh9XHlcIMWG1PPhuxTG1fBj17rsbhDumRZX/Pxt6XIXbafQM3BeEve+k5PyxiAfT6nd9Wp/ILSXEpURaNehRX6YMj/k3nSQ/GI93PnrvrxxFTVs2DVYzsS3M7fu+tXn7PAIwwJQBdMBs57Ru8UH8oM39v5D4Tqvz3a6pVj6JV/H/T1GtoLOlcHwCyYH2uIfAinrL+y/SuqtjQzqoG722g06N6QA+H4NgE5f6CtX7wUsma52JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7duwcchnGJmsBPzCJAX3XXVi+GgUmWqwevm8DZZwzSE=;
 b=WVFaNa6qqkjjJTq+uE8cOiuZsl6KgRi5az/Km8E/OvPAdVTY4yIdMatxWC0YlVahCxXMOS0m3ex0TX6ej9Zdda/juBXeDTTI9xPUeLs+Bfa5aXMvt4LT9vuRO8JFA4TtHUJtJss/kJ4fFJkdxOPXhEX/MjLW+duwBNo1o5E+xEwMVWwcFMQGjEdkhl9VA9cpDrelJNivPfQXgjhJsFf2VL9b9RcXJKxGjQNJjs7i0cnkqr/HT0V7qByfgkVSS0CjY0T8QFbwnnt2aagJZXNyBKIEVnzHO1i3ONLiwUiZbunUuuNPQ3dg4xhpFH0njFeIL+FPFt2fkUfkakwozoQZ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7duwcchnGJmsBPzCJAX3XXVi+GgUmWqwevm8DZZwzSE=;
 b=JlJnyZVWb9LT7xLcEfpr6qzeeKuLKJvoCVf/OyN0hjEKYR3Xi3COerolknYe9Slr21hkksLmLGymwQkeI0kdP4fyWZj+DAuTgDoewBIcG8PJiZRLJRvJQwEzpzxXsWDe+R5KT8g5bAo2WqcyK5MFJQXCfnlCASIgr8UnPIk4gfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Wed, 15 Nov
 2023 03:23:17 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::c258:1e94:a85b:1510]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::c258:1e94:a85b:1510%4]) with mapi id 15.20.6977.032; Wed, 15 Nov 2023
 03:23:17 +0000
Message-ID: <e0e76948-a0a8-b6c2-163b-1d00afb6650c@amd.com>
Date: Wed, 15 Nov 2023 08:53:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3 7/7] PCI: Exclude PCIe ports used for virtual links in
 pcie_bandwidth_available()
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-8-mario.limonciello@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20231114200755.14911-8-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::15) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|PH7PR12MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: cb127c4d-ecb1-47cb-a3fd-08dbe58a353c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bh7gLHm32YpcvljvyyJpfmIuEnVdOCZIz/sL4Woh+nkDlAmpGpC5WG5FCj7qtrB8ocxO4C9z+eKW4c7VWuHOZqp/8MoW6Dm6e/PZzCJcnDQzMdENxjGIpq6F1WpD9RAfSIg7ty8iJ1nxSCawDTMRe/UWlKXBIEaFBcG+VGo774zVA3zUBjLhbfJ738BWqa3GpFhdPdPd1rjCiKfrJXdjFw+HluEqi/UfQKD8u2c1I2QmexKZvC1VFvXvCrvF5IS0ap4p0ekgkFI3tK9Zc+8pdScAuCO93jFyMJgUvLaXRcXNnVX97rjjSWQvxNJYjN43oYSzKGKBz6lwyPCbzHDzOdLOmUbCWSeLGqLDmCe0FRCokKJvhkmeZv9KX5D6RiPK68SDMqBNc00c/BQwNIqgOxAPIlhA25nhoUyAQ6U1ye/JQ6/y9ocgDptKntQ2bsCYS7K2XchijGGzl4yoTLCwOrO9Hq5utcdoD/LfvCp/6vFQj4PQP6k7lkDw+ttavvJL+11UhojOnzR14/t4OibGXwjIw4NpszFSVRBiYtFMtOIDfRAd3lcuCOH6cayGj2u9N2xVs6jrYewJlRaRLiG1sD72ZVYjGMDuKLjLhFwE+eEdhmhszUQ+7k8wbs/TtQrp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(31696002)(38100700002)(6506007)(53546011)(6512007)(7416002)(2616005)(2906002)(26005)(5660300002)(4326008)(8676002)(8936002)(54906003)(66476007)(66556008)(66946007)(36756003)(316002)(110136005)(83380400001)(41300700001)(6666004)(478600001)(31686004)(6486002)(966005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzFzYVVOd3FMbDhlNUNvRDN1RzhWY25MWnBLbFpRd0JJSWkwSUtaZVZkQis2?=
 =?utf-8?B?djZvMzN5Tlk0OE1MWFpDVWV1bDVBMlRTRkFBNU9CT1dUK2xyQnpSbFIxR3Av?=
 =?utf-8?B?cnRsaEk2QlNRTnhQRll1YVhKWVFEOFdVWFNwWlJCcVFGWlVYcUhvNTlSTjdD?=
 =?utf-8?B?L3hzQlpqc2FobXdURGJFRW5hZEp1STU3dFNlM21DYUNMNmVnSjNjTnNQcW5X?=
 =?utf-8?B?R0RTeXlVM2Rob2UvMzg0dGRPdzZIOHJlcXluR2oyUmV5TEFhNG80a0pwVTgw?=
 =?utf-8?B?ekY3MFFmK1FNUEhXWmVZLzdaSXlWbUdiazV6NmQzTlRPcERWbXZmV3NXSi9z?=
 =?utf-8?B?RWNpM21HREdFa0JmUEVTVXdMRXZETS9GdDZKQWdHTk5aVTR6b1lFZkh6bHRx?=
 =?utf-8?B?eERwaU1ybTFSU1dxUXB2NmFSc3NGU0VxMTZjN0R5OHpPUmVWa0cyeHhvbC9L?=
 =?utf-8?B?aloxVFFrdldwMnV5a2hzeTlUcCt6T3ZYYi9Fa2RuTjV1eTByTkQ0TkluRWc2?=
 =?utf-8?B?STFPZGVjTEFmd2dOdklTWVNxUTMwaktqZGRNNXVScXJWdjdvL0xBSHNRUlV4?=
 =?utf-8?B?UUg5ZldLR2xnQUdxQkdhdmRMelkyTlFsVldYWERUNFdIcXZMdFdCbXVXeEFk?=
 =?utf-8?B?YTA0YitzQ25lOHpURkJDYWx3T3llSnE2d0k5L3hTYVh5UEVIMjJ0VE1MOTMx?=
 =?utf-8?B?K1hma0FUc0FGKys3M2JDbk83dWRlcWpPQmczQmtoV0gzMEFub3Z1aUZEQWNP?=
 =?utf-8?B?MTFMaHNOUDFtS2xTbERjQ2R4a3NxanF0YmV2dnlwU3YwTnBvejllUU9PSkxo?=
 =?utf-8?B?TGRFaFk0VE9mRVBZbG9CbUZSNlpJZTg1RFk3TW84amQ1Z01sMDI0d0RRSzJ4?=
 =?utf-8?B?SkVtOGxET0tUNitpS3dBRGJQZUE2NHhPb3duL25HRzZwcmpFdVQrdEdQckpY?=
 =?utf-8?B?Mmh3dmNGdVNtTHZZd216VUJBZE9GT1ZyZVJzK2VqVG12YkpJNTRkVGtHZWlU?=
 =?utf-8?B?SUVYa1lUZnoyQzdSUitRejNBRjRRbURRekR4dTNVcSt2WXltT0ZrRHc2RW52?=
 =?utf-8?B?RUlNNll3RnhacVhaQjVxM3luZG82enNyV1BMRFl6ZjJKSlNEYnMrMmxyOUVG?=
 =?utf-8?B?UjZPZnRxMm45Z2dSR0lzNmdYbVVsUWhtUDZJdUdKK1ZvRFlvSGR1MGZQUEp1?=
 =?utf-8?B?NUMvT2M4QTNnOG4ydlZabHVqanpKeEU1QW1FUHo3d3MycWN0T043SFNjbEJN?=
 =?utf-8?B?RGV3UU02enFRd2hIRk55U3MyVExOOGRxVXMwZTNtOEZvUDBWUGxRRm1KMld5?=
 =?utf-8?B?Y0R5WVhFT25VMzBVRGR5VkhwSWRPRVBHU2h6bTBUa3NqZElsRnRxbXdqOEx6?=
 =?utf-8?B?VmVFbmpNeEFmOXYyY0NMWFIycVhCdXJxRWVXWHpseVBHeUtLZE9mSEpLQlFO?=
 =?utf-8?B?Z1NsOEZ2MUhSK0w3VjdPVG1LMTAxNTQ2cm9XUmpXeTB2R1NmdE9sTFpKQllw?=
 =?utf-8?B?OWVMNlFpVC9mbWpJKy9mb3ZDSCtsZThmVDdnTStqTU11U2dWaVBBUlJMWkJY?=
 =?utf-8?B?NnphdTNIOFZVYk5ydHZ2cXdvclprWDVrNUVST1RjTzlJeGFlYktZK3IvQnlo?=
 =?utf-8?B?Y1FlMkN2c0pNYjh6WlBTUGpId0FPa0I3NjBnV0d0Q1NBczRXK3FqSGNGNTk5?=
 =?utf-8?B?L2xQZy9seXNibHR2Szc1aUZJdzlyQXF3TEdZMWIzL3RzNUorb3J0NVBxK2hQ?=
 =?utf-8?B?cUlMdlc4UnNPSmoxVUEweWlkMW5kZitwOHRLbm8wQzZzaU1aY2kyeXRmamU4?=
 =?utf-8?B?ZHRRSjhnUE96aS9mejdkNXhqbnZvc3lMWkYwSWhyY3ZGYUFlSDA0czdyaDFn?=
 =?utf-8?B?clY1TlBZeTFzWEMvZ3hzTWU5ZGFmSXczN0hWWGdpMURjVFczRm5SZVJEUjlE?=
 =?utf-8?B?NklPV256eGFxMis5ZUY0K0VTWFB5cUtNalJjbGJLSVRBV0wvQzc3UmhRcWZl?=
 =?utf-8?B?a1p3S2srL3VHTUQyd2tacTA0Z0JiMjJIdE1ISFBuUXFIaHArV050S2pnMVpx?=
 =?utf-8?B?dG1qSHdyRTZxSGJoQktMUzdJSjR4dGluSkk5am5Da2hCVkE1cDZYZ2p4M1RP?=
 =?utf-8?Q?7vYuXPtVYlUoPGGLT1gtg4BQz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb127c4d-ecb1-47cb-a3fd-08dbe58a353c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 03:23:16.8701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3JnXrgk1GsJj1tuaIhVpHAmQSBisTGpxkVJCWLXcaABYAf/OfZyiaxU4saO/ZUo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6467
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
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Manivannan Sadhasivam <mani@kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/15/2023 1:37 AM, Mario Limonciello wrote:
> The USB4 spec specifies that PCIe ports that are used for tunneling
> PCIe traffic over USB4 fabric will be hardcoded to advertise 2.5GT/s and
> behave as a PCIe Gen1 device. The actual performance of these ports is
> controlled by the fabric implementation.
> 
> Callers for pcie_bandwidth_available() will always find the PCIe ports
> used for tunneling as a limiting factor potentially leading to incorrect
> performance decisions.
> 
> To prevent such problems check explicitly for ports that are marked as
> virtual links or as thunderbolt controllers and skip them when looking
> for bandwidth limitations of the hierarchy. If the only device connected
> is a port used for tunneling then report that device.
> 
> Callers to pcie_bandwidth_available() could make this change on their
> own as well but then they wouldn't be able to detect other potential
> speed bottlenecks from the hierarchy without duplicating
> pcie_bandwidth_available() logic.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925#note_2145860
> Link: https://www.usb.org/document-library/usb4r-specification-v20
>        USB4 V2 with Errata and ECN through June 2023
>        Section 11.2.1
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2->v3:
>   * Split from previous patch version
>   * Look for thunderbolt or virtual link
> ---
>   drivers/pci/pci.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 0ff7883cc774..b1fb2258b211 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6269,11 +6269,20 @@ static u32 pcie_calc_bw_limits(struct pci_dev *dev, u32 bw,
>    * limiting_dev, speed, and width pointers are supplied) information about
>    * that point.  The bandwidth returned is in Mb/s, i.e., megabits/second of
>    * raw bandwidth.
> + *
> + * This excludes the bandwidth calculation that has been returned from a
> + * PCIe device that is used for transmitting tunneled PCIe traffic over a virtual
> + * link part of larger hierarchy. Examples include Thunderbolt3 and USB4 links.
> + * The calculation is excluded because the USB4 specification specifies that the
> + * max speed returned from PCIe configuration registers for the tunneling link is
> + * always PCI 1x 2.5 GT/s.  When only tunneled devices are present, the bandwidth
> + * returned is the bandwidth available from the first tunneled device.
>    */
>   u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
>   			     enum pci_bus_speed *speed,
>   			     enum pcie_link_width *width)
>   {
> +	struct pci_dev *vdev = NULL;
>   	u32 bw = 0;
>   
>   	if (speed)
> @@ -6282,10 +6291,20 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
>   		*width = PCIE_LNK_WIDTH_UNKNOWN;
>   
>   	while (dev) {
> +		if (dev->is_virtual_link || dev->is_thunderbolt) {
> +			if (!vdev)
> +				vdev = dev;
> +			goto skip;
> +		}

One problem with this is it *silently* ignores the bandwidth limiting 
device - the bandwidth may not be really available if there are virtual 
links in between. That is a change in behavior from the messages shown 
in __pcie_print_link_status.

Thanks,
Lijo

>   		bw = pcie_calc_bw_limits(dev, bw, limiting_dev, speed, width);
> +skip:
>   		dev = pci_upstream_bridge(dev);
>   	}
>   
> +	/* If nothing "faster" found on hierarchy, limit to first virtual link */
> +	if (vdev && !bw)
> +		bw = pcie_calc_bw_limits(vdev, bw, limiting_dev, speed, width);
> +
>   	return bw;
>   }
>   EXPORT_SYMBOL(pcie_bandwidth_available);
