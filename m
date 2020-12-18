Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD82D2DDF66
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB50B89944;
	Fri, 18 Dec 2020 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B41389944
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 08:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9QedSD8eP3fSIqDMUVLYIGVdeiTruYgTniRC69e5Km5F1PxBU22GpsJQ7cJMSOUf4xQ6krPEMfz164sXgY7ct3hfKBNgzFxazHhN+yrv6y8l3DSSeB6zLmbH2EO49bcJXTjxRcTXwpzNLPfv4Bebu5qDYHoKlnuGr8IEAWuyfnU68RsMuDIU4O75OAimJ7bE4S+l5mIIel5j3ORdyonD2tGTbDKhEao8QvHrDUIEKSttBUXtA/XJf8gv7oBjeu3iAnMRRVqZt+JofBoElScELcJqVcs5c08QEfHO+IezRrfsTJoQldOQ/IkX+wFzJ5QKKy9/A75wN91+iypAGgD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6y0RmwMrVN2RO45XQl5Vrs8eTm58QsWR7xoe3XKB1TI=;
 b=cra5479jaCBlUk6e9//dGWIVeQhQab0T2CLHI4GKSdDQSeMI+/dC/LsPyVFyHPSeQa2TFdQ7W4ImcNdZmGn4gCf06KiNCyoo7m28Rin2SWJw27RHivd4QvoS8LDSSECtuBDpdRrk5xoGnp4fK52J6XK3UYFqZcnfpLuOOfuzkeUTFqBZYyi1Jm/xvPeIK46FozluZnZjsIpZlzbVuiCU0YLRcWbdE/whUOmgS9Os6h/9zQIOtPMUjHvTz8yCCc08yWkXcxG1DkH+YakTSRzX3Nl9gQ6OkRHhKv2uRD40QLLObE/RuF9sTVr0+VSdItxGmXo/goOUpCWRImeqnKGxhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6y0RmwMrVN2RO45XQl5Vrs8eTm58QsWR7xoe3XKB1TI=;
 b=BjTgaoQS4HA7s3gxVTfujT946uEsMIOk/YShdVJWzVgpJYv+k7uiriLj4IfwxfYnZ9BZdu8A3jmR//6viahKu48spxLsruYLdRM4ClnSTsfmFuBW5BzMnA4Je1OBws7qT7qul8TxPT0KMfpSqVAhwjzchauhFtH0oB3TVf8NPl8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 18 Dec
 2020 08:10:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 08:10:18 +0000
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
To: Chen Li <chenli@uniontech.com>
References: <877dpiz4sf.wl-chenli@uniontech.com>
 <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
 <875z51zwsq.wl-chenli@uniontech.com>
 <90b625e2-2409-d13b-2456-483ad4eef18f@amd.com>
 <873605z1du.wl-chenli@uniontech.com>
 <7920fd29-3f95-2109-07ee-15659e80dc40@amd.com>
 <877dpgimec.wl-chenli@uniontech.com>
 <b21a574d-ca11-c139-eaae-61a75cc4278b@amd.com>
 <87y2hvydox.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0a449ae3-c55b-e1da-836c-3192eea5cb92@amd.com>
Date: Fri, 18 Dec 2020 09:10:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87y2hvydox.wl-chenli@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:208:be::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0089.eurprd04.prod.outlook.com (2603:10a6:208:be::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 08:10:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 82296dfc-ca38-4f6c-9fff-08d8a32c5baa
X-MS-TrafficTypeDiagnostic: MN2PR12MB3775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3775451F0B56E245672DB99183C30@MN2PR12MB3775.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pALOM2DqL+1SZ/sroKf6hZgIbJzyVcsV6ol03b23q9JuH7FNuE/JKzVSUqzWtS3Y6kZWe8gpZHpmXmTYXYeMmtsVdBNMQXBApTM80zlPPVkiAnFVfzUAyQStuswYqyqNckJvlDMK8yvVO45wqwHx++guta/Og8TkO5AuJ9MLwrbP0R4xtqBK6dYE7acEUgSr+PYhAulgBkjTxd9scvjqsLQ81FGfZH2fdg5psOIQSD3XkO7Xu2fxheuJeef8q3h+iB4/urRvoq4253nfT5G3PFmLweQYAiQtcd/PUVLPPHUAiDiJPTGMEj0oDCTwkjl+KkEopDUNE2DhE6AZ14h8xa4oSGWig03TACt6rnQp+1Pgfj8SiqJpg9dhaJqpUvgDXq9QkRMoIyy0ZzvlKmv6gQP+l1iidxZ2ONC+WERnZi8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(36756003)(478600001)(8936002)(16526019)(2616005)(5660300002)(6666004)(6486002)(6916009)(52116002)(66476007)(86362001)(4326008)(8676002)(83380400001)(31686004)(186003)(2906002)(316002)(31696002)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OW1aeXhFSStKbVVXaXUyTzRDTCtkem93elVTOGV2blhwY1JINFFxblNHUERx?=
 =?utf-8?B?aUtrYWJnM2RaNmR2VFdtMGdWaFdURnFGamh4eWl3U2VHUmJmK1M5VmhZMjBN?=
 =?utf-8?B?SmRhcE5FbUYwM04zNG96R3RTRXBkZjhxSW1jSTdnRG9YNlJQTUtWcUJoOUIw?=
 =?utf-8?B?NTFPbGRkdGJSZDVSbWQ5UCt1SWRGT0NZUVNBSndSajNBOW9uL2F6UjEvUGhr?=
 =?utf-8?B?aitWYnI3MGIyL2tKMXhMN0xUV2xhOS8xYW1xSmtoNlV4eS9meDhLYjdrcVZO?=
 =?utf-8?B?VmNyQU5aMlEwUHh0ODhsbmpWU3IvYW5GTnU3VTloc0EyQ2FadDB3MXRsTFBN?=
 =?utf-8?B?Y1hRUzVyOC9kb1FnMmNjcWtKZWYrMTJGS3l0bHZ1L294SUZCU1d6eE03SDB5?=
 =?utf-8?B?dUtoKzNaWFlnZTVsNU1TV1R5cFBmbVlxQzZ6TytxcTFLZWx2Y3F0Y3ZtMW40?=
 =?utf-8?B?d1M3b3p4cnV4cDlCR05ta1plT05sWVJmSmtoRjNiMEN0Wnl4b0YzaGVVM1Zs?=
 =?utf-8?B?SGVyRW1sWjBjRThtdmRKSW8yR0dDOGZZVUxqVjd3UlFUNmhvcysyamhGbU5C?=
 =?utf-8?B?NWN4REl0SGsrSjYwTkE0M0U4Y0JJMkx4VE9KRXVFTksvYWRjRXhnMnlaSXZC?=
 =?utf-8?B?YzNWQ2xudVBPTEgyWXowbDF5OW5qVC90cjJKREdFeENBZ0JqcnBxZFUvYlRj?=
 =?utf-8?B?MmNJQUQ1dGRYSUFsd2hHQ3pENnF4Vlo4VmY2cHA1dEFCRm41NWg3SGMyUXh3?=
 =?utf-8?B?RXpnRVRVVXVlUWJUTklicmx1ZS9wd3owR0lKRTBXU1lqK2N5dkl1YkxCVmdj?=
 =?utf-8?B?UFl6bmRoajNRbDRnbDN5dWJYbm02TkxnWWRid2pBYWNFbW1pN1VXS2k2Umxq?=
 =?utf-8?B?UmNVSCtEazZ0V1RvZlJxTVc1YVByNERGVTlzeFlMR2ZNeGVvNmNkaHd4OEJr?=
 =?utf-8?B?aVIwajNCMXZDVlhsNG01MHVFS2ZXZmVPb0tuQklSM2s1bTJITzAva0JCbkJX?=
 =?utf-8?B?T2VXMnhkYzRkNDRGTzJseHdxTkV3cWI1UUEyQTJESkMrZk5hUXdWTFk2ZHFs?=
 =?utf-8?B?akNMU0Q1dG4va2dNQWlHYkFkRkZTbENkQVhqcWR5bldEZWJMZGJmeXc0MGVJ?=
 =?utf-8?B?amxkUElTUVp0c1N1d1FBNWI5UU5DeHNpYUl4TmNZMG83bkkwc2Q2Y3E2NTZu?=
 =?utf-8?B?VUw1SXl3dXgrdGJqUi92VHBGWWE3aUViTk5jZW1yVHFQUmorMVZHbU9nUlBx?=
 =?utf-8?B?clFCYW0zNU5yUndDMTlud0tuRnF1ei9sRUw4R0drNTk3eUJ0dmcwYW05bzdP?=
 =?utf-8?B?enNXVXVvc0xrbncySWNKTUhXYzI3ZDNPUDAyZHZKa3ZPRjZHSVA0eEtFbWdu?=
 =?utf-8?B?bERKaGxZOFY1Y2xJc3E1WFJWcGVwSWFHUlRiV2pONlN4cXZyYkMySmRyNlBo?=
 =?utf-8?Q?22w+cQ+W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 08:10:18.3533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 82296dfc-ca38-4f6c-9fff-08d8a32c5baa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faoqo10snpuH8mJS0DMbEqyFH50z8D2WCaY/20gBIjcF1cVmNIASLfHdlnHZnX3W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3775
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.12.20 um 04:51 schrieb Chen Li:
> [SNIP]
>>>> If your ARM base board can't do that for some then you can't use the hardware
>>>> with that board.
>>> Good to know, thanks! BTW, have you ever seen or heard boards like mine which cannot mmap device memory correctly from userspace correctly?
>> Unfortunately yes. We haven't been able to figure out what exactly goes wrong in
>> those cases.
> Ok. one more question: only e8860 or all radeon cards have this issue?

This applies to all hardware with dedicated memory which needs to be 
mapped to userspace.

That includes all graphics hardware from AMD as well as NVidia and 
probably a whole bunch of other PCIe devices.

>>>       The graphics address remapping table (GART),[1] also known as the graphics aperture remapping table,[2] or graphics translation table (GTT),[3] is an I/O memory management unit (IOMMU) used by Accelerated Graphics Port (AGP) and PCI Express (PCIe) graphics cards.
>> GART or GTT refers to the translation tables graphics hardware use to access
>> system memory.
>>
>> Something like 15 years ago we used the IOMMU functionality from AGP to
>> implement that. But modern hardware (PCIe) uses some specialized hardware in the
>> GPU for that.
>>
>> Regards,
>> Christian.
>>
>>
>>
> Good to know, thanks! So modern GART/GTT is like tlb, and iommu is forcused on translating address and not manager the tlb.

You are getting closer in your understanding, but the TLB is the 
Translation lookaside buffer. Basically a cache of recent VM 
translations which is present is all page table translations (GART, 
IOMMU, CPU etc...).

The key difference is where the page table translation happens on modern 
hardware:
1. For the GART/GTT it is inside the GPU to translate between GPU 
internal and bus addresses.
2. For IOMMU it is inside the root complex of the PCIe to translate 
between bus addresses and physical addresses.
3. For CPU page tables it is inside the CPU core to translate between 
virtual addresses and physical addresses.

Regards,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
