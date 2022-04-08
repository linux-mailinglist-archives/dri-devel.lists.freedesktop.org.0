Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3314F9A5C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE83510E505;
	Fri,  8 Apr 2022 16:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3770B10E43D;
 Fri,  8 Apr 2022 16:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neL9Vs8P2CQoe+T+tEAmuaTaG0yDlA2plVQN7GoL8GetoOzeKvTxnJvFpABUKyzAsQUysWf1F+XL47tB1zoPB/WnVX2bXHa2PK8Aotc6XEH+SPp9MHIDTNCcWPR2iZvDfZiPKC5QZblr4t6AdfAbOeaUHg7gNj550Cac8aFdNAdBJ0XojYv1ZvMkSv240cXEHUE8H8b3GzlmPneSOcyWS6jjIaa+y2A8Q7+OtR1khTgnf3EbPjTPuHQxwyjY6/2i5BvQ+L85cGKtx6hs4jIog3zq9mWLjy/evUtK6SrIoNxCfxwyDpa+YSYCLmE0rOd3YDlH0865ZyVp+hxTzlMR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NwKpZkQxqo3Kw0WQGbKlr19KbKAMQN0+aav7z5MEDE=;
 b=ghrXDOOHasq+81e8CZN66pe1g4Bs8wtIjioUn3EA/aWtCVJLnXzktAMc1p5lj4Ub8er3+bzIWLAsvpLCfXdzaLIOXDYqCcQZlUWafRP9u7e3WicioyE3eHOT7T1Xm2a9u1Gwhb5Nj/T9V2mpavoHdEFSj2fNyHR+2KGUCIanQqIuaq/nyXBwy+7+fnLciF8UmPKg9Rib7qF/Y+42pHf7wDZT6Nl8vlnKvwthD3w3cEOTaAZRtNPCILjmEGi9gW2O00lApFqLH7S64lT9qs4EFCAeGxkK+wjyNr0wg51slNn1j43WztFN/p4jxPluyA1x+8kT8H43tVgNVEYy4gH7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NwKpZkQxqo3Kw0WQGbKlr19KbKAMQN0+aav7z5MEDE=;
 b=0i60NP5P+lT4W4v5tTdoWOfd/41qiowjktgI6S0bq3ndlt0Z/DEoqqJ93lX9P2fPcH/qnvnW0KEpVwMbukD1cBRwSoHn9Xx8hpgl3mC+qr8EW6dS3C7jaX6QpxUyw98RYd+alMqrLYyAA9E2PjpqGDj2KdZk7MwlNLEwruJU2bA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 16:19:59 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f%7]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 16:19:59 +0000
Message-ID: <768e8812-ecbf-93e7-ffad-feec1b36d924@amd.com>
Date: Fri, 8 Apr 2022 11:19:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
 support ASPM
Content-Language: en-US
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20220408154447.3519453-1-richard.gong@amd.com>
 <BL1PR12MB51576654D3EEB10F5DF862A7E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <BL1PR12MB51576654D3EEB10F5DF862A7E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:610:53::20) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8633b7e-5e83-44dd-2f25-08da197ba079
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5674:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB56746427D4582526BB1F1BD195E99@SJ0PR12MB5674.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: olblxAv5uYaxxuOiCzWzV/0g5tLeC13vJdE9PaRg0jIuCn/M278chX8C0dUWQgcja7KMpJ0GEuCyjjPNMWUDvNG9X3v09P2c53ebCP7k7FC/DiM0jOX6ykf9WeDkFf2OycT4wr+gsZsH3OYXbMMi6e6FwvE5lUT5KBenAS3TuUURNm2IQcyx6QLqbjdEXSxFmCvWXpA2BdRQatGWJLXbbZ6f4RVgGuLpeWMNuyBPqD3VwM7AM+/Jhb8VpxdFkINaTST/LJ2bjzeFMUXZoRtfXGGkEQM0GU0EodpbQdfvjwV0eiX53dD7T4uQj9i9SjYMJZOvRe6fLxAuROHFKKYslfJloHhao1rC9MNnlf2zLKK44VGjbhn+s2Mt+TcJWQ0PPuU2Pq5Y1qGDwVQke4jssCaf7adoJ2FacRh6vsz6VCmZLL6W1YavzlXZSNgBSw4KcrM8x4BeARva9hFYtfJ7Y5rk+Z24nxhsfuEQnzVbEqUS08Ir6TY8oSeGPWVxlA6XOF8tT2IaYk6b6jijEV0cqkuRVnTT047GksrI32h8vz8NqSW81LmO0RFyN4qPwcUoRpB9UIdke6SBEAa6YCiiFZt7RE9anF9HhhLaMm89d8bUjonijcgko3YyhHXkvXZhkVnT4ZHB+re1cz/sUGoxY6LBEBpwhajVlxhL/M2jYBxDonWYwnM0sAGDEkku7T7Aj+yStpTLliw269aEjT0K8dMlj8gZz3jS4XdVEbnzQg8VTHS5eJ62kup8PCwIi400
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(2906002)(508600001)(966005)(6666004)(54906003)(921005)(4326008)(8676002)(66946007)(66556008)(38100700002)(66476007)(8936002)(5660300002)(83380400001)(6512007)(110136005)(316002)(36756003)(31686004)(2616005)(6506007)(26005)(186003)(53546011)(86362001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnhpazBzcWVhQlpGQUxMRTlWTk5vcUpqTUN4NUJSRi9iZmVBa05WbW8xeTVI?=
 =?utf-8?B?NHhjZjk5bDVFNzYzckQwNHp5TW1Dc1Q4TElnZm82QmRtOTQ2ZHo1VjFoaDRP?=
 =?utf-8?B?MHpvcnRzNmhaQlhpaCtmRXFaaW9sY1hwNFBhanAzRkt3Tll2VDd2V3N6VGZW?=
 =?utf-8?B?YXVBY01mSnR5dHN2bzFrYnQ2SW95aFV3blpsYTVmTWFYbDhScDd5N3hxamdk?=
 =?utf-8?B?NlFuZVlJNkFpemlJemlUbW0xQUcrRzR2Ri9CVkMzV1pacjY3ZzFidUlUaXg4?=
 =?utf-8?B?ajF6V21JMUVtT0pTUWFpSUp6ZmN4eThKZ2Z0clBOSmx0bXU2bFVmeERhZjRm?=
 =?utf-8?B?OWRicDR1ZE14ejIxV0s0bnVHd2YzcFFHek5hdDBmcnZSVzFyUEV1RVVuaVRM?=
 =?utf-8?B?NWRjUmk3VXhlSXVubVpFMzk0RlF4aERzTGQvSG5qZU5JbkVYQ3dxVXJNQUQr?=
 =?utf-8?B?Y1cwVTJCaUtJdy9OeEg0U0tlM1pOZ2lGbHlCRzFMdlkrVkw5OU45RTM5YkF5?=
 =?utf-8?B?alhEbThsUXo3YkZDeHVPNUc1YVNzUGRZblBDSDdsSHUrU3FBODZUQXpCajcw?=
 =?utf-8?B?dlVwTG9WaHFqQlpESDZoNnJlU21rT1JqSFc5Nno2ZG9iRWNINjNURGNMcS9F?=
 =?utf-8?B?UVdaWGJvRjFwYWYzSlVDL2VWMWJ4OWhITWhzdUh6UENXa2tsL1ZMc2JUU2tW?=
 =?utf-8?B?eGpqNFp5dkJlenZtNTBObnlwUENWRUlxYzlhNTNYNUh3THkrbldtTk1pRW5I?=
 =?utf-8?B?c01xSHhnWEJmNGkyMThUMmxjZDk0SUtDU2hIc1o2MTQxZzdRbk5DRE9lSWhv?=
 =?utf-8?B?VXZzcjExWXQrOWt4QjJ5Y20wVGd0dDVYTUV6VUlaY0J2dWxFRUE1a2lkWmkx?=
 =?utf-8?B?b2E0SXlSeUJKci9oOTkrQ1Y2bzc1amkyUjRWWThRa1BPM2JNL3doWkkxa3pU?=
 =?utf-8?B?eW56aWh6MlNMUm1XZFNxcWQyeDVMbHRUckRLOTNVT3d0YlIrMFMrOVhqTEM3?=
 =?utf-8?B?VnloM2JNNXpFdkRqWWZEWktxN014QmRQcWx0a1ZDNTlGb0tlTWdlQlV5WmVQ?=
 =?utf-8?B?WjI1d2lFenZBcFYybVYyTlhNNEJzTFJBbm1UblJkV29yUEQrcU5kYkNWL0xy?=
 =?utf-8?B?M0hpanhlWC9Iby9Dd0crcXcvTktOZDFZV0NNRFhrVVpvblYyQmNtRC8vRlI5?=
 =?utf-8?B?YTRVYWJvVTVKcHlIYW9hT1NaVmxBd0ExSlhWbEYyb283VGFGall1R2loS0U3?=
 =?utf-8?B?NFBFWCtwUnJ1dzl0MzdYVVc5eXdaampGeSswTlB3VzY5aWxLUHFVeUpUbTVm?=
 =?utf-8?B?bGJadjJKaDVWMm8xMS9STGhTaHd0NUJKYnNQR3J4VVpVRmF6V3RobWpwT2s5?=
 =?utf-8?B?YVlVZnlYd1JhNU5aU3gxa2QzdFdxWllLM2lmKzFaQ0t1aVJKV0Q1T0dzU3Ro?=
 =?utf-8?B?SDlWNVdiOXRQeFFsV0R5MGhCQVdCcEVJNkF3dmh3Y0NHb0RuL2NVYlhORHZ6?=
 =?utf-8?B?MEtQMzhDOFVVNVh5QUVHV1RaamhBYUJwazdkUG9jcHlhOCtaMTNjYW85TmpE?=
 =?utf-8?B?a0pTYTVWYllacFVWVmtPNVU1K2xZRjlpdHVSSzk0eU9YSTNnNUV0RGpFQkZs?=
 =?utf-8?B?eVVVYUxiQ05MZk13S1NTdnlUWjM3Q3l6elFnSlFDbGRiVTVjUTcxSk5lY2JM?=
 =?utf-8?B?d3lQa2F6U3R4RkZzdWRid1gxem4wYlM1d2hoNTdEZVl4ZEsrclNJZFNqU2N6?=
 =?utf-8?B?c3JNd0RWNXQwbUcxU3VOMldiSXFrQkUzY0tGcVZScTBKeUN3VUF3OU02cFJR?=
 =?utf-8?B?YlNGRzF4elVSZGZsTlM2eFY2dU9yMU9yVXBZaWJqdGlaVXp4RGhNZkNtTDhD?=
 =?utf-8?B?TGl2S0FYakpyR3FvN2VLV3h5SjlxSWkvYnFuUEgrVk96NlZCRHl5dFJEcWdD?=
 =?utf-8?B?L2g1bEowODhVajJiRGcrZG5RV0lkR1hFdzQ1cDEyaGlENVBZZEJnNWIwN0s5?=
 =?utf-8?B?VlptUWtmWWJaL1JVM0czOWJpSHBsd1dlNkZWY3d0MEZuT0JZVmZhN01QWENm?=
 =?utf-8?B?T2tlWWgyWTZZak1qbGgxOURPakQvcDl3R2NKejU2MURJbVB3Z3djK0swc1pD?=
 =?utf-8?B?K2RZTzRJU0Y5dEtrT01ZQ2dkMjFiZkRvYW9Zb1ZuSGt3L2plUjNabS8wUUFi?=
 =?utf-8?B?QkxWamsxUDVaemU2YlEyU2Q1MmRWTitIWkFJK2xRQnA1OXl5a0l2UkFidXJU?=
 =?utf-8?B?UnNTWm5qdzlkWlNQN0pYVHpuNWlocGwvY2ZjclR2bGtGNlVTN1NlVXJMRFVI?=
 =?utf-8?B?NHJGRFJRQVVoejIxS1hNOE9jbWg1QXBnRjhPYUlmeFQxZUdHbmJ6Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8633b7e-5e83-44dd-2f25-08da197ba079
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 16:19:59.1564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drVDJcx4p+vDXyGEMwLkHOdNSJCcx8BwmnsdkvNZXMbqldEU7Fg6fiZwh9eIcT9BrxIFsptEK2NA4jJ0Idiy+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/8/2022 10:47 AM, Limonciello, Mario wrote:
> [Public]
>
>
>
>> -----Original Message-----
>> From: Gong, Richard <Richard.Gong@amd.com>
>> Sent: Friday, April 8, 2022 10:45
>> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> airlied@linux.ie; daniel@ffwll.ch
>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
>> kernel@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>;
>> Gong, Richard <Richard.Gong@amd.com>
>> Subject: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
>> support ASPM
>>
>> Active State Power Management (ASPM) feature is enabled since kernel
>> 5.14.
>> However there are some legacy products (WX3200 and RX640 are examples)
>> that
>> do not support ASPM. Use them as video/display output and system would
>> hang
>> during suspend/resume.
>>
>> Add extra check to disable ASPM for old products that don't have
>> ASPM support.
>>
>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index bb1c025d9001..8987107f41ee 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -2012,6 +2012,10 @@ static int amdgpu_pci_probe(struct pci_dev
>> *pdev,
>>   	if (amdgpu_aspm == -1 && !pcie_aspm_enabled(pdev))
>>   		amdgpu_aspm = 0;
>>
>> +	/* disable ASPM for the legacy products that don't support ASPM */
>> +	if ((flags & AMD_ASIC_MASK) == CHIP_POLARIS12)
>> +		amdgpu_aspm = 0;
>> +
> I think it's problematic to disable it for the entire driver.  There might be multiple
> AMDGPUs in the system, and others may support ASPM.

The "problem" are WX3200 and RX640, both are from the same POLARIS12 family.

> Can it be done just as part of probe for Polaris?
>
>>   	if (amdgpu_virtual_display ||
>>   	    amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
>>   		supports_atomic = true;
>> --
>> 2.25.1
