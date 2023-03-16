Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5FE6BC7AD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 08:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E5F10EA61;
	Thu, 16 Mar 2023 07:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2045.outbound.protection.outlook.com [40.107.247.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BD010EA61;
 Thu, 16 Mar 2023 07:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7lLmvfD+dkWTLrOG1FSTHpOvx/R7v2ObuqOCx+Ckdhx8vIcYs1EKbo1ZQY+1ORFB0X+kzI0JaeMGjoXlUkBOs6TGAi/9W6Nf6Q0wDlWIMr87dHLW7VXe4PpeOCbCXOkEIf0cRJhxeZSGKpLZ+qfDlfyln3ob4CmbdzgfvsamnIWuEF5wDAzzdHj1CsMllW7kFTSboKah5xQNLzAMU6mMvubb8jJJni9lMGpnLRDEBMy7R9Ae9BCxU1mmZqZ8S5wxH8UrJ4vi1wSEiSfiF4C1ii3PHP+0JyJ0pWmoZMn/YvfGv/PnOWdQMosKQTPwhqEKvcuQRFNzjRjATZfNtaQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Og14EUITHXvbPrh4W/a1B77ZpP0NHk0P5pkLDv47/BY=;
 b=WemiUV/ASNXTQgM2DMyifiJ53+ZwsXKErqTGFWlc3gV1r5amZSjq9yjesZIW5DNiP90JfO0n3Fkqnr0nPnskMkp+J5ok6wYIkuIBohErfGPWbfcoBhaQfyvRH8Kl1VZM8YMQwdF5stVnA4yzoZnS2PSWxJa5apfT2R9/tljvUh7ebdqOFWDFkY6c37aQABDfJblqg5U6WHHNIv7VY8aau8WucS13KOy9PwRxaQ+3yE2ZxJF4WdXypqZwU5xOHbBGabxU7m/9ILVpsNE0fWd46rzCJ3MQb6UOn6cMw2y+g8rcjIraXm8iVhVYH70yowt7Epn04V/0PjVRuBkG+8q7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og14EUITHXvbPrh4W/a1B77ZpP0NHk0P5pkLDv47/BY=;
 b=3sQF2tqUficQITP/yFXRgPsPiJJXg965Nf28nfav4KFPEkPi4w2Qb5SE0sAQlNlBRNg83LgFZWsVOsRkSCf4hDQJB0viK8gLAKjmNJFu82WVmm9Cu3+UYlMlxhl0UOCUZJztlFjGfyaB8i7BM8ottkZHPXrxFtj0+EiNPfMAEgTJFfiRZbtvcfesPAAv+gz6X7+evMYl0Q4hbZw8K5oYTczaygrnIuaOKG8LTzjnle9XYQXzj8KSvLy68gKcoK4Kr1beW43c7KhG7cwEDcPmBCKyLd5mBdVhNAZoST+IycYEA0QQYjF4EjQja6zLj2VkaO/2y3gfoYe+SgRnpenuoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 07:50:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 07:50:13 +0000
Message-ID: <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
Date: Thu, 16 Mar 2023 08:50:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: c70dcd48-1648-4c1e-196f-08db25f3135c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j//oK4L/bXGLAW5r5/FunPeuYcAT234CNuzAxmTk5w4e50Klsj2o/FABu/yhjw7kNIy1xRtSQ6tfmqCVwGmdicdjt6c8OkuUdC5kkgsporvDuMrsG9NRENH6q/qSx0XrGLx87kHMFzM/IC58aNBjVLg1c5Kh1hjnJk13bo1gFZWRhh/syATra6QC+KtafGZ46Xsxez5I+huwVdK/noiycVRlCcCSn3cE0T9hKg/k4ye1TPFG4n7Wqj6hKYJzwbFoO1KQRiCILh6GNAm6SpxawZRtHYJPC3Xpu8AZ8+pPjsuPw2Y8IhBhFc4H1vhc38lTBeBAwhkepSmt3cs/93IMhRcydH3JIvmcsDGZrvbkVGS0FwMAbsWqgZfDdYTDj2nI49OGAUgyYGraS+a1K2EpqqVToIr04LQWc1h/pnsm6FvDEZQoJ/+JlNNa1RtP3MilAqMpdDsKclFLw6POA4HWeK+25/9/HuNMBgbN8Gv1KF4Bam+I8aPSrSxO0Dml3YUs69xGci+qXcR5Aqyg/E5HMokh7e9hMpQTcCTgcm/b5gnVY+4HR3MqEhYZkZfun4J9qxHa7yT8Q55nNSKwNwMxQmh9j+9WHNePdj9D2XVfqdUoUr+d+FMRhF26B1Mo1smXvlfIlB6v0rHpq6ZuiNWhQkyXisbES8g4VQZHtWrgEgJdtF+nw5o1bXnKW8hxgOjLE5zYNDMSjBscuKTa/Qufw9hSPYtbi1hzz9acT/mlQlc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199018)(6486002)(83380400001)(478600001)(2616005)(186003)(53546011)(6512007)(6506007)(31686004)(66556008)(66946007)(54906003)(66476007)(316002)(26005)(4326008)(8676002)(41300700001)(6916009)(8936002)(5660300002)(7416002)(38100700002)(2906002)(31696002)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2VQMEF6WFppZDJKL3Y4MEtMdzFFNys3MjlzRVVQU1lzSTBISWFtR290RmtC?=
 =?utf-8?B?RkZZMUxFa2hOcWhza0NpQ2NKREhKTzlLOU1nTFFuTCtaWHVyYTZTbldEOTk4?=
 =?utf-8?B?YzZYWDNncWl4UXR2alVMZ0J4b3pSUWttbUU3UmRqMVJoemJkRVovcWJuVCtz?=
 =?utf-8?B?eVVVejM2MVdKYmUvK2xRcHNpUmw2clhhTWtsQVdHTlIwNURNV1Rqd3cvL2Z0?=
 =?utf-8?B?V2hNdVJzWGdTdEZUa3VPZnYvaVlJaFdJaThVaGkwbnM4SXgvQVdUdE0zeVVr?=
 =?utf-8?B?YXRrcFRuQTFrMDcrTDhiUzY5a0FORFZFWlVWNDhYOWdpNGVsWWdVUDFDRXVa?=
 =?utf-8?B?K2ZXSDVxMGRZUjVCZXBtTC9LSXJDeVFsZmxUV0lVSE1ZTVdlYXBHR1ZhSUYx?=
 =?utf-8?B?bXlWTGU2UWJXSFprYVMvSTNWQXBQbFgzL0o4Q2F4K0x1V0lFdis5bG16VTly?=
 =?utf-8?B?L1QwOHBYRFFQMG1VSTh6NE1Zby9va0VJME5ONEJZcjZLQVQwQytjY0NrejRi?=
 =?utf-8?B?emFSZVNmbHN5d1p4QldOWkxLOU1mdXJnVVo3bDhlaGJ3TnpUWFQySDRPOUtS?=
 =?utf-8?B?S0Rtb2xrK2tCYis0TDR5cDBXSVNua2Zwd0V0OUUwaytOdVlpMlpqMEFYSlNR?=
 =?utf-8?B?RVNidXl6aUVpeFF0SWkxM1VreEE4QkQ1dnBoZVJLVjBrV3FQd3grRFZNaUUv?=
 =?utf-8?B?VzBxZ0JGM05heFZhanBLU2l4VHF0YUovS1BONTVNbVJNOVdpbU5WN3F1bklI?=
 =?utf-8?B?c0FSRWd4NWRiZGRBNnY4KzBtVzIvZVBPUUd6NnRsaEd4emQ0VVI0bS9pQ3JL?=
 =?utf-8?B?Q0dUVXd1dnBMaUxjRWtyR0ovci94MTNoMVpWYTNxdWpHRCt0amRxV2IwSXZ5?=
 =?utf-8?B?MFl2VjduVzA1NUtIbS9hWUFxdVk1OWNuK0xkdDd2TWQ0MEZEeVRMdmFSNk1D?=
 =?utf-8?B?ck04Mk5ubHVET05BRjNwU25TRVJES1dyazFVZTFoR1F4cVBIZjF4cEFPbW5P?=
 =?utf-8?B?c3NVT3FUYndMUGIwZWFiWXVERzVCQWJLeU9pSm5zSXJ4VHN1NFo0Qmp5OWNP?=
 =?utf-8?B?V3lNRzg3NmUxRU9sc0xBc3lLa0ZITXdzY0FmY3NIc2J2emZzSi8reHc3Uzcx?=
 =?utf-8?B?aXA1VFNLM2R5UTJ5eVlJMTc3NWVPZmMraUx3dG1xWHd1Snp1Q2VOTTYxaHhX?=
 =?utf-8?B?UnJiV29XVlhNTUprWklPbWo4Wm5FZmdKR092S094aS9QRVh3QWY1ODRCTWc1?=
 =?utf-8?B?N0pFM3hTMzRlVHhVRlZYRC9IYVVlV0lYdkpoUDhEeTkwRE9ZellMNERGOWhY?=
 =?utf-8?B?SzNCb1R0emxWeDlLQjVQajc2bW5lTExmOEhyS29aS2htOFZGYjN5b1EwV2Jw?=
 =?utf-8?B?cmZ0OVR0cFRzR3JwY3JsQ1h0QWdDQTl3RXdaZlNxa1gvM3ZRb0VlWVByWjNZ?=
 =?utf-8?B?aWxGWWV3UnVhSnhhVXc1ZDBBekpXaXlORDBWRjQxcVEzQk5KRmtoWmYwMkc2?=
 =?utf-8?B?ZytXVXh3N01hNmhXdnYxV0JPQ01mZ25kbDlwRFNzOWpkVkt5Tnp3Q2doZGZ3?=
 =?utf-8?B?MjIxK1R2b2hKdnNZL3BRVHQ2eXpYWnRWSGtMamp3SElHM29TdXFEWFpLbE9J?=
 =?utf-8?B?aVRsV2gwTXZKWklYam9NUnhPZTVTcU9rMHovQlA3Sks0SVZnVG85MDgrdWtX?=
 =?utf-8?B?cUxJNFNNa3hHY0pVV2lac3IvYy9na2ZWMUN6RC9UWm41YUxJNzhtenhSSEY4?=
 =?utf-8?B?bHV2a2JzN1EzTDhoRUxuQ216ckJqd1V5RE40bC90K3ErY241NG1nY2t5Q01H?=
 =?utf-8?B?RFBmdkltN0ZXaWYyYjIyZlhuZkpJakU0WmNlSVlQVGNwU0xvenhXbXFzdWlU?=
 =?utf-8?B?Rm9pM0oxeHkxRjdIRWhGamdTQTl2VEF3TlJZU1RGcUozYTh3aEpXQ3p4ZUp4?=
 =?utf-8?B?Y0huN25qRlVnSWdSa04wLzhYOE1VOXEwK2JOUG9XOU1WR2dmdkJwc3lYMU9s?=
 =?utf-8?B?QmdnZ1lBN0hUakJFYUhXODkzY0FHR0FOZTF4dXFLai9BamROWmV0aVpCbE1U?=
 =?utf-8?B?MW9SbFVPMnRKeXU0SEdTOS9LZGdCUkhyWjcxNE5Pck1OWHFINyt2ZjVMOVRy?=
 =?utf-8?Q?mf/cSfr6cC6h35ttcyEv6+UNO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70dcd48-1648-4c1e-196f-08db25f3135c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 07:50:13.7015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVzglH9PIFd0ZVz/JCljg7wZ45aIbpShfJ4hjz534e3JtfFrgVmEs9l0sorxHf9GQ0NuMbkMUejzZ56aQ/RBlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <honglei1.huang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.03.2023 00:25, Stefano Stabellini wrote:
> On Wed, 15 Mar 2023, Jan Beulich wrote:
>> On 15.03.2023 01:52, Stefano Stabellini wrote:
>>> On Mon, 13 Mar 2023, Jan Beulich wrote:
>>>> On 12.03.2023 13:01, Huang Rui wrote:
>>>>> Xen PVH is the paravirtualized mode and takes advantage of hardware
>>>>> virtualization support when possible. It will using the hardware IOMMU
>>>>> support instead of xen-swiotlb, so disable swiotlb if current domain is
>>>>> Xen PVH.
>>>>
>>>> But the kernel has no way (yet) to drive the IOMMU, so how can it get
>>>> away without resorting to swiotlb in certain cases (like I/O to an
>>>> address-restricted device)?
>>>
>>> I think Ray meant that, thanks to the IOMMU setup by Xen, there is no
>>> need for swiotlb-xen in Dom0. Address translations are done by the IOMMU
>>> so we can use guest physical addresses instead of machine addresses for
>>> DMA. This is a similar case to Dom0 on ARM when the IOMMU is available
>>> (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the corresponding
>>> case is XENFEAT_not_direct_mapped).
>>
>> But how does Xen using an IOMMU help with, as said, address-restricted
>> devices? They may still need e.g. a 32-bit address to be programmed in,
>> and if the kernel has memory beyond the 4G boundary not all I/O buffers
>> may fulfill this requirement.
> 
> In short, it is going to work as long as Linux has guest physical
> addresses (not machine addresses, those could be anything) lower than
> 4GB.
> 
> If the address-restricted device does DMA via an IOMMU, then the device
> gets programmed by Linux using its guest physical addresses (not machine
> addresses).
> 
> The 32-bit restriction would be applied by Linux to its choice of guest
> physical address to use to program the device, the same way it does on
> native. The device would be fine as it always uses Linux-provided <4GB
> addresses. After the IOMMU translation (pagetable setup by Xen), we
> could get any address, including >4GB addresses, and that is expected to
> work.

I understand that's the "normal" way of working. But whatever the swiotlb
is used for in baremetal Linux, that would similarly require its use in
PVH (or HVM) aiui. So unconditionally disabling it in PVH would look to
me like an incomplete attempt to disable its use altogether on x86. What
difference of PVH vs baremetal am I missing here?

Jan
