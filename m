Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1E97E0E28
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 07:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC9C10E1F8;
	Sat,  4 Nov 2023 06:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F0710E1F6;
 Sat,  4 Nov 2023 06:57:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Awr5OqHnvV1hmC29geWUbSlec4qzr4u9TGgQvdheDfnWvRMW030gWPLnBkIT2mJb/oF0EOfbKz9KRee7ITZfrm1o2VwI/tbZW6x/OJ6YmjzJOrvhrYOHUoi2iOTUW1AUeUVV30NGJRtVOLjHX6MyVYekTb1oZQVHip6ubONq1pQEgJLgsD82DcSC85uOAeONj1pgZD9cPYRreS/+1dVt8TmPAtorrP7/WoaOfp9FWfCQ/2MIk68QZwNPXNrai7x9iCNw1rsLjD/dl5+kL1MNhDu9LQRRRXLzSE/5a7iy/f30SBw531FtegRCtSju47VLHGXndHnT29LABL4ERzzgSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxiayzGVQs0Dlew/58DoZQz3IwGgGxDbtVfrFx/w480=;
 b=Ucl+ltdX0TB//dxxVrmu2snnUD8/rwHoiOpLqoeoZzFbHBM1ZA+hnkChSOIswOuXVPNfnUZFN0DhIeh8vTjT808/1c4m3mdHyQgicGA/Lux/WcYrxtbOJWf7WtDTeBFPjX6Nh/EmOp5fR+p1j92psi67qd1JfDDzzz42lcKl2dx84IJXJdTFyznxvoKakfpg2QvOjEPYpcnprV2QRH2RHrzt52yggxwMMoacwXvca7Psj3Th2YMgB4wIhubbY3TaPqDB6W1YbodNk57cjGNgAAYut47l0nAxey8DpaUHkA/mnz6CQs4LArwJaxJ/9cy4kdmJ8v1q01je/0DAdNOI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxiayzGVQs0Dlew/58DoZQz3IwGgGxDbtVfrFx/w480=;
 b=r+RoXsvLAvHMrU7CbpY91pgOCUTdR8Fd5GMIPiYhtbfLxoalBRcRPPRQg87Hx67KHHaUtu6yvSwsKwdW6iWyIC3we9jN88wCbgOUW7MsDVRgPaHjRD4Ud7kOFSZaPo3zWhdf7q7JxXQwJswMc4dSV8sIw84RP7ysnDuwXTtoyos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by MW6PR12MB8899.namprd12.prod.outlook.com (2603:10b6:303:248::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Sat, 4 Nov
 2023 06:57:38 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892%6]) with mapi id 15.20.6954.024; Sat, 4 Nov 2023
 06:57:38 +0000
Message-ID: <b8097564-dcba-e4bc-2d65-5c6936373772@amd.com>
Date: Sat, 4 Nov 2023 12:27:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 8/9] PCI: Exclude PCIe ports used for tunneling in
 pcie_bandwidth_available()
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-9-mario.limonciello@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20231103190758.82911-9-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::15) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|MW6PR12MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: 770d3860-f64f-433a-68ba-08dbdd03548d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3W83KYT0vAGW0hDnzK57G8/eSxaTQ7d2aBtMbTbaoA/Bcqy+ljZL714yiuOBt2bMuJ3Zr86WN7mUNj3iBr/fpM2feKONYDg0jyMsNUjK6aS+7cEoe43C+Xx2wrzPJwqB+l0KCtAwRpmpNSbTjFi6+psufw9ePOix2sz8+3PApLvJI7qiyzEkfKZMRRBKq0knEsZP5kkIwhCgf5xFgCw2EBISIKhr7y5EykUG9Wv3our/9+bNhXDN4ikgpPWvkDzOAZfPl32MCR6f8ziMCmPENq725hP9qyuN5TFmnRhkyhMKziwFCirVKJb6WqnHzF47aWCNzUQRsyHQS2x4UsujmNpUPvWCytYuop68RXf+Zqz3r6ImIPhkLmY6v5Riey1/SjY5z9WURunZlpH7f/HF52FlWng/4t2/JTd8NIM+lwbTCt2FAFopMzd/DX1UmLHPQQNkXCYP00+u2OoWuI9SNSMuiHhJprFRJj5GpV5CJdx7RQce6dQ75P4/Cg/xm4mptkZjLeEfNQ6WK7z63WOm+mhUvWF9ub68lLzxPAGTb2xLPDFvKul2cdQm4Yq+AmQgGT7m+ggAmX7zAsqP7D2ZJVaxkGdToVRCwkd++pZ8Wtlv6gBj+FEK1ulUo1wGSwBnigQX7STs6XAtGgVAXu5a5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(26005)(53546011)(2616005)(6512007)(38100700002)(86362001)(36756003)(921008)(31696002)(2906002)(8676002)(7416002)(478600001)(6506007)(6666004)(4326008)(66476007)(6486002)(66556008)(316002)(54906003)(8936002)(41300700001)(5660300002)(110136005)(66946007)(83380400001)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGhpZ1ZJLzJ2QWZlVjZHdkl5ZWduVmlMU2cvM1R5VkVTUURack84ZEZMc3dl?=
 =?utf-8?B?Sk5wcGdWM0hBL2FJaTRMejVIQ3ZIaHFURUNkMWtkRVZ1cEdLMXdPams5d29m?=
 =?utf-8?B?a2Y2TWxPUjZDU1ZBUCtIV21IUkZjcVdXRUwxYTdTV1RKY1Z1eDZjMTdXQVFi?=
 =?utf-8?B?RmZ1OVJVMC81V1hwZUd4QXVIbVJjV2xkY3ozNklCV0p1TGFCQzNlNzVZQmN2?=
 =?utf-8?B?MFY3L3VxbDdZK3pVRDU3ZEErSXJOcnZock5PM05YTFdZUGlWU202L1RIQ0xW?=
 =?utf-8?B?WVpjLzdWSzNKTk5lM1ROaVRGclo5RzhoSmVIcVJLM1JNV3Nxa3JTN2xhWXpw?=
 =?utf-8?B?SjNUNzg2SE9RUnExTk5VaDZ3bE5XczhOYzFRdWQxMUJsSERtWlJxTmhVeXcx?=
 =?utf-8?B?TnlzVWZSNzNwVGIxa0JtMkpmUThIR0dnd21SZW5XSjUyNmdSVmdJcU1TRk14?=
 =?utf-8?B?NWRGcVRpcHg3VlROZGlWOHc2aENEdCtvc3RuWm0ySXhQVXdTYkMrS0VpZEN5?=
 =?utf-8?B?d2VsaFplRENrUVpZUXhNODVwRUN6Q3oyVGVTSnI5TUtoeWFxc3EzWlIxbnNl?=
 =?utf-8?B?MHBqVjh3akRtL0QwN0N2TndqbW9KNnJXMGdpOWhRVG9aS2JhZld3NVIwMzE3?=
 =?utf-8?B?MmlmR3d4VE9HS01NQVVqQSs3Z1J6dEtUVGJlU1B5M1NxMkFmQzN4ckREZURW?=
 =?utf-8?B?RCs0R2JnZHlDbk5vU3JxUVpVZ05IZGpuUjFvRzJmNGNSS3lZQUozd0FOVVJk?=
 =?utf-8?B?eXBKMnduYXVDbmplRnNLY3BpZEhwZm1LWlc0NXRiTkdzbWdSdk5EODFETEM2?=
 =?utf-8?B?VHVOOXNZNER0ZlVyaUtwTVBqZTZENTdDZTVlUnBqMDBZSk93dkk4QjB5MlRn?=
 =?utf-8?B?Y2dyZXg2MUx3cUlkejBuT05HTEVSQ1hXdlN0MStJQXJBTWVNWXhOTWNBenI2?=
 =?utf-8?B?R1RCSEdSNlFRWmdKSHZBejVTVlAxTkhlRCtoa29qZ05ob0xkbnJuRG5ncXVo?=
 =?utf-8?B?WUJ5UjRYcDBaNVczRkFncG16a0dIVUJtbWxZSWs2NmZFc0lzeTZNbHhyQVN6?=
 =?utf-8?B?Mk9nSktxaFNjQkxMUWswaUZVNWhVVkUyRStpRHBaK0Z5VS80aDZuWmZSRXVV?=
 =?utf-8?B?Z0h5YzRsdmw3aTI2UHpQd0h1M0t5N2JmZTA0dzhqY2N4elJIdWUrQm5pNDd6?=
 =?utf-8?B?QWJCa1lIU1ZkV0JSdlRzT3I0OTFIaTdKUUsvaDF2Q0JXb3AvTTRGTFpuNk1y?=
 =?utf-8?B?ekZENWFodFVQVUMvMDNYYnBLOHFvdEo3R2s3WEF3YjBtRFdxVDV0bDhOdU0r?=
 =?utf-8?B?WkJac0NhVWtIV3J0cXFQRDh6ZU03QkJDREJEbm9NTHBLY21kZmdpUDhSM0dw?=
 =?utf-8?B?Slpsd3pOSmphTlVOM3p3QzRTMkp1Q1Nyb3ZBSGtLakhodzNLcVhhQjhubXEv?=
 =?utf-8?B?cjk5L09xS05jdGxsazlRdGFuVTB0aTJZdUNwKy9mSFZMaElpMjZ3RUpYc1Ur?=
 =?utf-8?B?ZVRORnlxVk5lM1FuUHZ0RWc0S0RxL0MxWkFDZE5wODdhTFNwVmNhOEp2RWdB?=
 =?utf-8?B?L1VmMHVjZ3UwaDR0U1dlL0QvK3MzaUFOY1owdmtmaloyT21qY094N2Jpcisv?=
 =?utf-8?B?RzdUSUdhMGlzSHFjd0ZnVzNycmJic3pObU9UeWZKQldhUnJaaUs2dTZzWFNa?=
 =?utf-8?B?UzF1ZS9pVHpKS1BWM0pFREU0K3N6OWpNMlg5MkR6dlRjSkRMTXBEMmtKVXlF?=
 =?utf-8?B?WkZiMnBvLy9Fdk1Ock9hL1U5dzl5UU9pMk96WlA2YkFCTmViQkJQQ2QzQ1ZO?=
 =?utf-8?B?cnFPeEN1dUt2OHUxZE8wdkpqSCtYQWZFdkJrU2VsWTAzSHJVSlJ1MUxxR3RK?=
 =?utf-8?B?WXQzc1JXQ2tZWk83dlIzVHJUU05IbzRGQ0tkbklZYzJCK21BRmRWcGxuUFp2?=
 =?utf-8?B?N0N3N2Jqa0h6Tm1KaCtUZ1BZQjVHYW9RUGQ5TXNHMXQzYit5VE1JNk1FT1dC?=
 =?utf-8?B?SUZXd0txUUxBdjN0L0hySE9QL0IvRnJXM2dXd1ZTQVJDbjZWZU5OU1pwNnJh?=
 =?utf-8?B?cE0rb3p1MkFGNW10dUdHdmlQckJ0eHdIemNjdE83UXZ1eE1CVW9LeXc4emdR?=
 =?utf-8?Q?+K88K9LCO9Jyk3+gOE7Fbzh26?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770d3860-f64f-433a-68ba-08dbdd03548d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2023 06:57:38.0334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyJ0pRlwA/k8XKAkIoRBW6B0gkDQ2SwjiDarsWw3DTo71MWvnNMP05Br+ABeokQB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8899
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
 Xinhui Pan <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Mark Gross <markgross@kernel.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Andreas Noever <andreas.noever@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/4/2023 12:37 AM, Mario Limonciello wrote:
> The USB4 spec specifies that PCIe ports that are used for tunneling
> PCIe traffic over USB4 fabric will be hardcoded to advertise 2.5GT/s and
> behave as a PCIe Gen1 device. The actual performance of these ports is
> controlled by the fabric implementation.

The code below ties a generic term 'tunneling' to USB4 spec. I think it 
should be something like if (is_USB4 && is_tunneled), exclude from 
bandwidth calculations - it should specifically identify usb4 based 
tunneling rather than applying to all 'tunneled' cases.

Thanks,
Lijo

> 
> Downstream drivers such as amdgpu which utilize pcie_bandwidth_available()
> to program the device will always find the PCIe ports used for
> tunneling as a limiting factor potentially leading to incorrect
> performance decisions.
> 
> To prevent problems in downstream drivers check explicitly for ports
> being used for PCIe tunneling and skip them when looking for bandwidth
> limitations of the hierarchy. If the only device connected is a root port
> used for tunneling then report that device.
> 
> Downstream drivers could make this change on their own but then they
> wouldn't be able to detect other potential speed bottlenecks from the
> hierarchy without duplicating pcie_bandwidth_available() logic.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925#note_2145860
> Link: https://www.usb.org/document-library/usb4r-specification-v20
>        USB4 V2 with Errata and ECN through June 2023
>        Section 11.2.1
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/pci/pci.c | 74 +++++++++++++++++++++++++++++++----------------
>   1 file changed, 49 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index d9aa5a39f585..15e37164ce56 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6223,6 +6223,35 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
>   }
>   EXPORT_SYMBOL(pcie_set_mps);
>   
> +static u32 pcie_calc_bw_limits(struct pci_dev *dev, u32 bw,
> +			       struct pci_dev **limiting_dev,
> +			       enum pci_bus_speed *speed,
> +			       enum pcie_link_width *width)
> +{
> +	enum pcie_link_width next_width;
> +	enum pci_bus_speed next_speed;
> +	u32 next_bw;
> +	u16 lnksta;
> +
> +	pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
> +	next_speed = pcie_link_speed[lnksta & PCI_EXP_LNKSTA_CLS];
> +	next_width = (lnksta & PCI_EXP_LNKSTA_NLW) >> PCI_EXP_LNKSTA_NLW_SHIFT;
> +	next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
> +
> +	/* Check if current device limits the total bandwidth */
> +	if (!bw || next_bw <= bw) {
> +		bw = next_bw;
> +		if (limiting_dev)
> +			*limiting_dev = dev;
> +		if (speed)
> +			*speed = next_speed;
> +		if (width)
> +			*width = next_width;
> +	}
> +
> +	return bw;
> +}
> +
>   /**
>    * pcie_bandwidth_available - determine minimum link settings of a PCIe
>    *			      device and its bandwidth limitation
> @@ -6236,47 +6265,42 @@ EXPORT_SYMBOL(pcie_set_mps);
>    * limiting_dev, speed, and width pointers are supplied) information about
>    * that point.  The bandwidth returned is in Mb/s, i.e., megabits/second of
>    * raw bandwidth.
> + *
> + * This excludes the bandwidth calculation that has been returned from a
> + * PCIe device used for transmitting tunneled PCIe traffic over a Thunderbolt
> + * or USB4 link that is part of larger hierarchy. The calculation is excluded
> + * because the USB4 specification specifies that the max speed returned from
> + * PCIe configuration registers for the tunneling link is always PCI 1x 2.5 GT/s.
> + * When only tunneled devices are present, the bandwidth returned is the
> + * bandwidth available from the first tunneled device.
>    */
>   u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
>   			     enum pci_bus_speed *speed,
>   			     enum pcie_link_width *width)
>   {
> -	u16 lnksta;
> -	enum pci_bus_speed next_speed;
> -	enum pcie_link_width next_width;
> -	u32 bw, next_bw;
> +	struct pci_dev *tdev = NULL;
> +	u32 bw = 0;
>   
>   	if (speed)
>   		*speed = PCI_SPEED_UNKNOWN;
>   	if (width)
>   		*width = PCIE_LNK_WIDTH_UNKNOWN;
>   
> -	bw = 0;
> -
>   	while (dev) {
> -		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
> -
> -		next_speed = pcie_link_speed[lnksta & PCI_EXP_LNKSTA_CLS];
> -		next_width = (lnksta & PCI_EXP_LNKSTA_NLW) >>
> -			PCI_EXP_LNKSTA_NLW_SHIFT;
> -
> -		next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
> -
> -		/* Check if current device limits the total bandwidth */
> -		if (!bw || next_bw <= bw) {
> -			bw = next_bw;
> -
> -			if (limiting_dev)
> -				*limiting_dev = dev;
> -			if (speed)
> -				*speed = next_speed;
> -			if (width)
> -				*width = next_width;
> +		if (dev->is_tunneled) {
> +			if (!tdev)
> +				tdev = dev;
> +			goto skip;
>   		}
> -
> +		bw = pcie_calc_bw_limits(dev, bw, limiting_dev, speed, width);
> +skip:
>   		dev = pci_upstream_bridge(dev);
>   	}
>   
> +	/* If nothing "faster" found on link, limit to first tunneled device */
> +	if (tdev && !bw)
> +		bw = pcie_calc_bw_limits(tdev, bw, limiting_dev, speed, width);
> +
>   	return bw;
>   }
>   EXPORT_SYMBOL(pcie_bandwidth_available);
