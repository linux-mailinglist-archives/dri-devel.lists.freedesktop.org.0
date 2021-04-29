Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707536F113
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 22:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1234B6F4DB;
	Thu, 29 Apr 2021 20:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFA86F4BE;
 Thu, 29 Apr 2021 20:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1KyteKDrnIeqY7Oqyx0dZdYCGOXSvogqmJ7HsMJyY6LTaNajc2+d+6PXXtpYZQqshjtywfBkmJ0Qut7DGxAlIRPwpJ4cASUHwXWEXXxq8sG5WBBNkevP5TC0KOjuGSSCJdODWx7wz6D3Vek9fqcoNGRW8dUUD6+d55ywTjqrmqrDHva5PvbcIsPrV3u8PqetFeCDyeKl7k7baWqCQbGSNYVVDaEbJOxUFCMhcJxtKmBi42uzv+wW8uPImOw2C5IvLHr1H0g/PeQkXaQbteovdBV9Fwi3pG1n/ZRsnrQNx1Mp1yHXhSIvp9wwdm2s/RTqeG5t/MIKivLnkVFBWeZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ba8bByW6fxSFhUO7QsLX8+WosYRa6kiMw1tWYLTCbxU=;
 b=BswxO0IJjnMEakAb9mx0EHenDmH2Z7O+aEs84r4hYaA3OMIvRjN3ds8P5IofELxQbV6ych8NnWbm1LSgi59N+0r/Q+ftCgHCktTQWs+IsZMZZVuntw1dqI0Uz0X/EETn0ysLrMbLU5wHFkWE9DB8AtRLgOclJZlbHZfrsD+OIFDa9hb+OnSW1nhNMZtLPnfYLE+V2zMz1brQY0eVfTXah9qPbLZ5k0wZ+dxo5pnRu75eieskkYPmiGyMDVMo/WfmYHmRlNEunwBKD/Fn8iF1xq8Hl+OCp49VY4gCpmTQeNfj3SHfTRDwOm+STyxZouuzMEUVg1O9WS05IMEoCy+5KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ba8bByW6fxSFhUO7QsLX8+WosYRa6kiMw1tWYLTCbxU=;
 b=AcJ+Dasx60HOHsr5wkSEudWjzAVufVQKGo5/1rKXxtA5ibaE0gSE+oCVT4wAOITUtczhC1dlww4xjNEqMMoyM0u/rLuCuiXe5Hzlc+Aim5LV9n7IcVi7DkIzP/u7pevFijm8vG7wS9LQV4q5ZysS5I98fDZcDXgE0VIFWGZa5OQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2703.namprd12.prod.outlook.com (2603:10b6:805:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 20:36:51 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 20:36:50 +0000
Subject: Re: [PATCH v5 08/27] PCI: add support for dev_groups to struct
 pci_device_driver
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20210429192308.GA510492@bjorn-Precision-5520>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <d95139ed-ac2f-6006-c5db-78e67bb7edc3@amd.com>
Date: Thu, 29 Apr 2021 16:36:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210429192308.GA510492@bjorn-Precision-5520>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:497:888:9bb9:54f1]
X-ClientProxiedBy: YT1PR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::28) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:497:888:9bb9:54f1]
 (2607:fea8:3edf:49b0:497:888:9bb9:54f1) by
 YT1PR01CA0119.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Thu, 29 Apr 2021 20:36:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 741795f4-6d90-44b9-a98c-08d90b4e8460
X-MS-TrafficTypeDiagnostic: SN6PR12MB2703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27030D99312FFAAF1A6C07E7EA5F9@SN6PR12MB2703.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7EmnEStXTXSytvgs4dKI6uqd2Tv8+/E+u2HaWE9GRdo9Q3fUZtmIT8q5a46JuzFLVkMTECsaxFyLGDyNI5L28JKaSunAcBj+C6KCKclTcm0QhbC3zk/egCEN/cMzvy9iWbiRtoi+YAVa3250vQegyslWaq+RBG1hj6vWobxIbLcYSIyImM3U3f3oPJGdFGXeEGbdU18qtRnwuwKEvwjvOooXOeK4GeoXIIKTXRxHL9f3JvEcJsUUvgwXoAeyk5NehLhh+Tbx8IDT+mL7EhjKUPFc/3x57MLZe/URpihNafkqooVg9EaQMndB5Qs6sKqVyFgJBuO0X737I3NueyGAMojFK1kAggxAKGhS2PiovjptZecJXd4+JugpXHB1LANJ/KE0fH62tky3nWtKJo3yFQqcxFY1GIuMQ2w3sPe6VAREL6b0vjpJiihisyQpjnLjkgwxQo+7diV3Go5uiXsvtbQI2qbXeV3Svg3Ug6UF/cVBg1NPAWVK59DUXpO6B63ns/2ZIEVSIuyS8nnxZuL4CQv+6egIRib8PggcZ0EZ8sOSOG9M5l+WGFGKyBvZeN6w2oMOmlvm11XU8sJqtQpS1e54U0ye2/sA/g3fB5cBYbyF3GS6BRnFMafhMZ8dJeIj2BzMU7DSKVXB4nBgUSirhdEsNEernT/jdoJbL2vOFFWrHFM1OYk17yFDWKTnLhUhROtRNv+AaZfRS1rjqj1PHixLikJIAYy6lsoWNuRLdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(66476007)(45080400002)(316002)(38100700002)(2906002)(2616005)(966005)(66556008)(66946007)(83380400001)(8936002)(6916009)(31696002)(53546011)(478600001)(52116002)(4326008)(6486002)(8676002)(16526019)(44832011)(86362001)(31686004)(36756003)(186003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MEU3RVdIMzF5NVJDbHRpYzh3MWU5S1Z4MjB6YTNwK0RVYmFJRWN4bzBIQVlB?=
 =?utf-8?B?TGlPWTZjbHdEZXdUSG9kd3NuSGVpb0ZBTXlLVXJ0NStVV3BFM0xHYnFlSSs5?=
 =?utf-8?B?Zm1WcGxqWmtFdzBWUm4vcDhuRlJaSnl2VDFCT1RwclgxVUFUeVJ3MW5CM0Y2?=
 =?utf-8?B?YUV3azBLRFRDYnhPZU9Lc3BMeUFsSGpXME5DaFg2WUpMWTk5eG9JWnN6STFB?=
 =?utf-8?B?UzRTZ1R4dDVDay83UnB1UHNGOTl0a0dKT29LcDRncWdpM1ZPTzlHU01DSXYx?=
 =?utf-8?B?SGRkZERsNCtGaFR6OEFtMHEzNDYrTDF1dkhPQmlVcnZCbW4wZTdkZEpGN040?=
 =?utf-8?B?WWhVTmwyTHVIOTB3MG5MU3FKMW9aYXlxZXpjcWI1MHp2LzFYWUdLU3BZd2tO?=
 =?utf-8?B?cFJkRkJpdmRNMHZSRHUva1lsTUYxRDIyRndsV0plS3FMMmNnYnliQUtpUGRL?=
 =?utf-8?B?cTF0L3A0MHp1R2krU3dYY2ZjbUhnNnl6MWI0SmdHZ2loUldtNmNuZHpBRjhv?=
 =?utf-8?B?RWc5ZGVnbmNDNCs4UEw0NVY4bU5vdWdSS3N2M3RMakRuQmt5bFNvaGxJQmdK?=
 =?utf-8?B?YkgzR2xMM3htWXR6UmVTMEF5TTgvSEtTVmJqMnNOd0tZOUxjMTJocWxzVDRp?=
 =?utf-8?B?OUluSVAxcTlXdW1aUHpody9wNWRtZjIrTXBmVXBReDJxRWNYSEZqVkdYNzdm?=
 =?utf-8?B?RUYydjVBQm5hclQzWGovNWRKZ0N2bjdhVGR3dXdzRGxOM2FydUdIaU1QQytz?=
 =?utf-8?B?MklLOVJNejZoVVJiT3lkNWtBcjR6WHNsT2pSc29YNGFFdWowK0FnY3hZWGd0?=
 =?utf-8?B?TStqSHBRYWFBRXFJcFpuU3o0UE8vYnFxa0NqbU1IOXBpbkhYdm9PRGl1MHFC?=
 =?utf-8?B?VXNtNTRRMDErdE1kMnNMY0licHBEcHpqRWsrSVM5S09ZeDR5R25udHRLd2pP?=
 =?utf-8?B?VkU3Vkp3N1Q1RkpCZXl1dnV0RmJRTVZRdW9VVkpTNUkxSkxLV0o5WjZIZ0ND?=
 =?utf-8?B?cEVZYXVpMFgzaGQxNXFPM2FlMFRsbThtL0xTd1JobkRRZER6ZUk1ckpGVVRi?=
 =?utf-8?B?Vk9QeEFCRUpZdVNWblYwWTJPNFBpYUZTQm01blBpa1Nlb01RMTFmNDNKVEhU?=
 =?utf-8?B?QUNodjNxM2lwajU0SHN2b01xM1Y4UTJpc3N5cjhMOHF0L3dIejdpaXV0OFNx?=
 =?utf-8?B?ZnFiSlN3b213a2NYeHkxSGJiTHVXU0ttSitmMFlLempqdmNaRXg4TnF4SDNh?=
 =?utf-8?B?STNKRDc4bUcwL0JhUHJYd01rSEZ4SmxtY0pqY01kVDRxRURselVaenpIRDZx?=
 =?utf-8?B?ZnB3ZnZIbVVvb3JNVEZxcTgyZCtKSWIrek43V1NnaXRsRTdBaHBFOEIrWWpC?=
 =?utf-8?B?eXp2Rm5XRzJRclZMRUJhM0F1QTJPUGV5UHErZnBybzNjQ09FU3NXdGFJZ240?=
 =?utf-8?B?Q2pXbG14MlZpejExNWRIeUFaVkRSR3p6MWRER0YyNnpjRG5DZ002NHhKTTZO?=
 =?utf-8?B?ejUzOFVFTDdDbDdacG5PWDJ2ZkJMeFRtVjhyd0Fvd05UVG9EcnF4T05CeHQ2?=
 =?utf-8?B?VVpDWTZtWUo4VkNINmlLS0NuUUJiQkFWVDJPd1hvT0x0S0lqSW9XVWJCbnNt?=
 =?utf-8?B?aDdpT2ROUVR2eFFGekd4OVdzVnNBL0VWR3VDUzR2RjY1TzBKNDBYa3Fhc1Bz?=
 =?utf-8?B?WSttN2pZSTVCVHVyeE9oNmt6dDFJOHlxTXdHc2c1UzdJVzhSS2dpWmNZeEFt?=
 =?utf-8?B?ejRHbngyUkFtcFZsTm1LemxTQ3R2VW9ycHRjaW9UdVkyZlFLc2F4dnloaWkx?=
 =?utf-8?B?VjNtaytKelI4Q2xSa2FObnBkbEt4UXVnVzdLK1VBNWhHMFJncDlTS3NLWVoy?=
 =?utf-8?Q?OTfXhjCmdiCJ9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741795f4-6d90-44b9-a98c-08d90b4e8460
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 20:36:50.8566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GQXA5vDDP9z7+5twHHrgd11C6Z+VK8oAmfhD6t2EmTC252pWm3peBuVLpqKLMveUr42tTfNOJaBn3v0eAGHZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2703
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
Cc: gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com,
 linux-pci@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com,
 Alexander.Deucher@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-04-29 3:23 p.m., Bjorn Helgaas wrote:
> On Thu, Apr 29, 2021 at 12:53:15PM -0400, Andrey Grodzovsky wrote:
>> On 2021-04-28 12:53 p.m., Bjorn Helgaas wrote:
>>> On Wed, Apr 28, 2021 at 11:11:48AM -0400, Andrey Grodzovsky wrote:
>>>> This is exact copy of 'USB: add support for dev_groups to
>>>> struct usb_device_driver' patch by Greg but just for
>>>> the PCI case.
> 
>>> ...
>>> The usual commit citation format is 7d9c1d2f7aca ("USB: add support
>>> for dev_groups to struct usb_device_driver") so it's easier to locate
>>> the commit.
>>>
>>> I see there is also b71b283e3d6d ("USB: add support for dev_groups to
>>> struct usb_driver").  I don't know enough about USB to know whether
>>> 7d9c1d2f7aca or b71b283e3d6d is a closer analogue to what you're doing
>>> here, but I do see that struct usb_driver is far more common than
>>> struct usb_device_driver.
>>>
>>> PCI has struct pci_driver, but doesn't have the concept of a struct
>>> pci_device_driver.
>>
>> Since we don't have pci_device_driver then pci_driver is the best place
>> for it then, no ?
> 
> Of course.  My point was just that maybe you should say this is
> similar to b71b283e3d6d ("USB: add support for dev_groups to struct
> usb_driver"), not similar to 7d9c1d2f7aca ("USB: add support for
> dev_groups to struct usb_device_driver").

Got it.

Andrey

> 
> Bjorn
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C9778eea1c3164f9fbc5f08d90b443ba6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553209952825202%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=tkycS4EST1Q%2BkEWlmzocPjCxaONVk5sPzPnWmrmbfcg%3D&amp;reserved=0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
