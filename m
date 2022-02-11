Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D34B2B4C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 18:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1EC10EAD7;
	Fri, 11 Feb 2022 17:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F5310EAD7;
 Fri, 11 Feb 2022 17:07:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qce9LY45lLdRVZoG0GgO+NX0CIFRUGdzvmfCEyk0wYbOdYUeufF8QZgb8UYHxIuOpEPGaWblkPff2KB0uBlhNnMytuDBgMt5wkPaEcKYiMoILn2ASXWgTGjCPYqDTiEXF+tJP/yFnT5TFav8gupf7ODCFsG+qzghKS3WPZ2ngrULLx19VQaDXWX+ceAHDGkisucrFlgJCFYIfFGJxjfHeetH3TjIyB1gAg01OsvEAIMz51ahJVxyesmGhGCM0TdH6lJeu8VfqtfEYYOkcdCsuwXR1uaBc251ly3lFhj93LQSyBpVG5ccgjNEzPzvMuO/L5S13tSHe+rV2tETbXB7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49+uABlHoF/XzoYLH/FogMU5ku/SkUq3CWWdN4lxGb4=;
 b=ecH7HNJD3/1pSO03tShMA1I+eqbiVzG7uYe9BNYDPncZomfO2XhysP8ysL351+naLqwUB7XYjCxLsBl48KF0E+zT+OrsPQy2fdShhZLDNirSOP5+DeGR56lJ/3bQ+7GMK4jdAocaPM9lAMNOHpk4XoUNj8ls5u0kLApqgK7ryXmVw5SNwigl0rxIflj5R35cTP4mJVjwjB7JG0GTROYp95gb8QFKBlLmWqx8RQsmcyArTqWlHyyj+ZGbcE7PfQdRol2PPbLdNmLkaTW4OY/4f2IYUxy48bt5Ax6GOgtuHHpdmaO1iTBwdnzBi/OlZplAmofmU0PAKSjkNRzwXsun+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49+uABlHoF/XzoYLH/FogMU5ku/SkUq3CWWdN4lxGb4=;
 b=xqhN/kBBxNi/jcTiBdZTM9Df3L5fBL741kiHIbs/uPn4PDnygUTLjq5fl1yFCNC5ObnzMoc2763Sfg5k1Kk1j2ej3HrMd8h86gFx/8lfvNjrz4xiJbzGy2z84JCdEdMFzPyB0HtYDLVsfpz6fL/xedva6MAPAWRxBEfOq3CYUEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY4PR12MB1925.namprd12.prod.outlook.com (2603:10b6:903:120::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 17:07:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 17:07:13 +0000
Message-ID: <a24d82d9-daf9-fa1a-8b9d-5db7fe10655e@amd.com>
Date: Fri, 11 Feb 2022 12:07:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alex Sierra <alex.sierra@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b65f081-ee5b-49bf-546e-08d9ed80f2a8
X-MS-TrafficTypeDiagnostic: CY4PR12MB1925:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1925241C51B7366D3470B40392309@CY4PR12MB1925.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHOSERCs1T0TNGvbXZkqFmAw9k3kTcVZ0xA3R6NKOPhhiWUFiv2NLTjk8TQCbOf/4JQ0KbskB2kKorkmbLgAtzHKDetAvKEADfomArP82dz7E0henlwQgkisVktVeTgs0/EQ+VQuLvj4JlRyGkOpTv4bNJbVq4WsWwtNsUoID7FT7G9mL5DIIJralLC9pnz9dsQEc1CL3TmHz+11JR8gVaV9si74E/L5fmqaZS8Nvqpa8uxTBdBrpAh43KkKuzxoiqF8d6IE0xxSZOFiTH4JYFYTIdp0PM9ml4FghiyTkKe8VP9zC6hqX2QwXjaEEJUYQY+Iwhq4rEXAE74s/fYm1YHBpg/14s1pAID3APsytaRZ2SxdtXfW02P4/5Y0xvD0g02e09jrGZh+23limhvjRh8SwDZsD2CYTQp7mK2N8R9owpjEkOmmdeH58J45a8wYiOHJt2MFT5Rn571mKW6ikhTfzVlM+JpNYBumqZlOYziUZ4jLlVju+LjgFQnNLzsq/XlwLs6EE/2baGuv2pHNRqrqaOU/e9ycKvjNqGS8dRum3s62OrOOFIRqihPLC6EWfYjTZA3Fi+uoOur19BPRZK4N6rfaAZmWMFpXzJxH3FBN13mLFcXcKQ8O1wRxIJCxAC/WDLguF5fOaB6jVR9psXEsZRalxZ64YrzTOayc6LP3re8oD586MCGg1/jDS2pBJh5GxUJ9Pdf/eb1z5JhInuIRuBJPJYmSINHOuG4JU0eUdg3DDA3UuA0J3C6tj9TY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(6486002)(110136005)(53546011)(508600001)(8676002)(6506007)(38100700002)(31686004)(6512007)(66946007)(2906002)(66476007)(83380400001)(26005)(31696002)(36756003)(44832011)(2616005)(5660300002)(8936002)(316002)(7416002)(86362001)(186003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdKdjRFVkYyTnY2R2ZvVWwzMTJiOGZyZlo2RjNWako3VWlpV3VRdWhVK2Zj?=
 =?utf-8?B?WFYwdWNrbDk4U3ArSlAwVWV5QUxoUmhBNFluem9uYXpZS1ZVc0JXQkRLbUdw?=
 =?utf-8?B?YnF6SGlXbVBSMmRUcnFyQ0I1dGRycm5PbGdXRFVGc0FnaUlqOTZlN2NsYXky?=
 =?utf-8?B?TlpVK3djL0R6ME5HYmxYQVlBMC9KeVdFcTAvVmpQQmNBUEZHNE9FNDlmWTlJ?=
 =?utf-8?B?K0E4cWRMczBrSmlrTGFkeXZzY3VibG5MWGZkMmltNkVDWkpZdVFKcEVMUS9G?=
 =?utf-8?B?cjQza2t4SlhweXV1dTh2Zi8rMnU0bVBZM2xRcW5ESUhybGQva1ZrVmF4YzNN?=
 =?utf-8?B?UnFlS3NlSFVldURSamR0a1djME9QdTFhL2UwdVlKMnp5QllZcUo2ZEh1YWNW?=
 =?utf-8?B?RlNyNjRpbkJickJZRmhoTmpEZlJ5SXRxckNkbDU5QWxQRXZabENYVnBFampu?=
 =?utf-8?B?bWRZWnoxdWw5T0ZKZW11ZDkvdEVxYkEyem5sZzgvR1JLaXl6ZTEyMkpFTjZG?=
 =?utf-8?B?Q09sM0NqWHZXY3NRRkJ3RTI3eWJ0MjR2cDZKRFh0eDgxRHRtVmVDNmtKeU1L?=
 =?utf-8?B?REVqRUdUa2xGWDQ5YVpjRnZONGpQaGorb1ExdjlhMlVIWCtaaTF2QXdmNXQr?=
 =?utf-8?B?NEVvR0k1MlVIQStsZCt3cm83alNoWGNaRWdsQUxVdmV6dTdXYXJmTlJTMFY0?=
 =?utf-8?B?MGVtV040bzJ2REJQU0hTdDJWN2pMV3BmbnRxRGdTZWFDd0pWVGkzbWNWWldB?=
 =?utf-8?B?cEQ4a2tXeUFnbS9rOU9yZk1kTHRyRk92K1dnYm9DTUVpNlhDYm9JaEltVGRQ?=
 =?utf-8?B?eHpsM3hGeVdMa0FEWC9wTjRHNWVQVmw3Y21ZVVUwMnRBaUhnb2txelJiNCs0?=
 =?utf-8?B?KzlYYzdXYlFTWnVSamJpSVUvSE40Q2Z6ZnIwRlRLQTdyYzNINEkzZk1ncWlv?=
 =?utf-8?B?UkNUb243VTBWbzA4MUxUR1krTEU0YlZjVmxWelFuOVlNb3cwS0Z6LzBuQVdq?=
 =?utf-8?B?L0dwWGQrVzB5VmFHbDEyUzErVFZ4aU9nVGI0Ylp3OTRSQWh6ZW1yZkJiczAw?=
 =?utf-8?B?a21iQ2pUb085UUVZNlJQQktzOXQ3S0d2NVVINkJNRTJ5OFB4UVJrVnIycDdp?=
 =?utf-8?B?b21sVFZjTDVFRlVTSytQV21RVUpqajNCYlhKWkZnZldJMUxaOTY2YU5kZzMz?=
 =?utf-8?B?cDJkSDAxSWd1dGNObXdlZjVDTXFKbFBtRmtwR1VQeXpyM20wL3RKRHdFck9j?=
 =?utf-8?B?R0c0NGxyNW5GMEdmdlRkaXRuck5tZmF3cldwUXkyYzhnQmZ6NVhhb0ZxSHRM?=
 =?utf-8?B?bkE1SDcrM2s3K1dxUDBYWTF0RWQyTnRnN1hBdElMcHdXUDRDeHpPK1lGTmE1?=
 =?utf-8?B?THlBV2ZlR1oxVkNCbVRtRG1MN3ZWeC9vcHl4SVhZbnVMV3FLTVpwRlFKZ05C?=
 =?utf-8?B?eElpY3R0c2UvNE1aNE1SeWt4THlmVlU1QUMwek11d1lPdkx6NFYrTDZGYy9k?=
 =?utf-8?B?QTJsK1E4UlAyZW5qTUN5bWkxNWpvNzVNd3FmOXkvblo0cGd5M0krNjBUYWlz?=
 =?utf-8?B?UmFWN1dFOFd1V1JVL09zUWN6eWhwSWZpc0grSWNkNGtOVjJnNE9kbnVhMUti?=
 =?utf-8?B?WjI4RnE5RHViMmQ0UGRMSUdKS29yZ200VXh4UlFHUitXMms0bklnRGVJNDJr?=
 =?utf-8?B?MlNtbERLTE1hRWZob0YvbmtwTFBMT3lEYWYybFJDUHl3QXhrSUtwR2RGd004?=
 =?utf-8?B?Vzh1YUdMOGlwNHQ0akVOcUhHNjNET3Uwd2hsOXhoTWtFWFlWSVM1S0c1azdp?=
 =?utf-8?B?R1FEVTRtZWR4RytTVVNRdjZQWlFGRTRmZzV3Z1E3dUtMWFVJZXpVSUlPRUlq?=
 =?utf-8?B?OGpGUzVBR1dvZkU2dGxmQXMvMXFDMVc0ZEVsM1NUd3ppdVRnUkUzRXl0dHpx?=
 =?utf-8?B?aE43SDFaNlZ5ZHdBd0F2WUpuYUsvS3NON2s0WG5pZWM4WmtwQnM3SmY1bk9S?=
 =?utf-8?B?alhhK0xzWHd4MFRFMnY4ejJMVUZ6UDVmQytTOUVMN0pnVy9yN3dKSHpZbEpU?=
 =?utf-8?B?RE55MnpkUkVGNXZkR0pDVmdxRlJzR2xTUU04SkRYRGdKcUJNQUM5TTZQZm5U?=
 =?utf-8?B?empneGxieGQ1Nkh0SC9RUmkzRklCOGpqdXNSTVVjQTd1V0hpSnM4TitqUFgr?=
 =?utf-8?Q?fQEqHi9zliDap43iP9X5btI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b65f081-ee5b-49bf-546e-08d9ed80f2a8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 17:07:13.3444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKbA+uuO0Vvo3mqirdvZIipYvNqwJxlwnWZXPzzlghUj1nZWX72Vqk/fQ35SUd7yHstsoudwIQhRK2F/HX4yQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1925
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-02-11 um 11:39 schrieb David Hildenbrand:
> On 11.02.22 17:15, David Hildenbrand wrote:
>> On 01.02.22 16:48, Alex Sierra wrote:
>>> Device memory that is cache coherent from device and CPU point of view.
>>> This is used on platforms that have an advanced system bus (like CAPI
>>> or CXL). Any page of a process can be migrated to such memory. However,
>>> no one should be allowed to pin such memory so that it can always be
>>> evicted.
>>>
>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>> So, I'm currently messing with PageAnon() pages and CoW semantics ...
>> all these PageAnon() ZONE_DEVICE variants don't necessarily make my life
>> easier but I'm not sure yet if they make my life harder. I hope you can
>> help me understand some of that stuff.
>>
>> 1) What are expected CoW semantics for DEVICE_COHERENT?
>>
>> I assume we'll share them just like other PageAnon() pages during fork()
>> readable, and the first sharer writing to them receives an "ordinary"
>> !ZONE_DEVICE copy.
>>
>> So this would be just like DEVICE_EXCLUSIVE CoW handling I assume, just
>> that we don't have to go through the loop of restoring a device
>> exclusive entry?
>>
>> 2) How are these pages freed to clear/invalidate PageAnon() ?
>>
>> I assume for PageAnon() ZONE_DEVICE pages we'll always for via
>> free_devmap_managed_page(), correct?
>>
>>
>> 3) FOLL_PIN
>>
>> While you write "no one should be allowed to pin such memory", patch #2
>> only blocks FOLL_LONGTERM. So I assume we allow ordinary FOLL_PIN and
>> you might want to be a bit more precise?
>>
>>
>> ... I'm pretty sure we cannot FOLL_PIN DEVICE_PRIVATE pages, but can we
>> FILL_PIN DEVICE_EXCLUSIVE pages? I strongly assume so?
>>
>>
>> Thanks for any information.
>>
> (digging a bit more, I realized that device exclusive pages are not
> actually/necessarily ZONE_DEVICE pages -- so I assume DEVICE_COHERENT
> will be the actual first PageAnon() ZONE_DEVICE pages that can be
> present in a page table.)

I think DEVICE_GENERIC pages can also be mapped in the page table. In 
fact, the first version of our patches attempted to add migration 
support to DEVICE_GENERIC. But we were convinced to create a new 
ZONE_DEVICE page type for our use case instead.

Regards,
   Felix


>
