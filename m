Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACB03F7C28
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 20:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB656E40C;
	Wed, 25 Aug 2021 18:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 51677 seconds by postgrey-1.36 at gabe;
 Wed, 25 Aug 2021 18:24:35 UTC
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9B6E40C;
 Wed, 25 Aug 2021 18:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSadm+ebvcCM7JcUTTKmMmPKSmoqyJ8ytGKUyv3b8TggKjp1/UUHa0aFcF6tMzDGy/b3fcT+1SilLK89UU/xStNCmWx+zLVRTWD9YtCBn6DrMBPS/bKSZ9Eekrw7X63DavsTZnsCpMU20m9/EygMcG3EOk6u3knN1F1cXxj890JGW+N0wUxQ9PHkw8XjNpmMTPB0RpI6tXhlrZDqOIuPk40zFwRjcbSIkS77hlvigFZToOoU3qwmRkClJNUHu3cdeq29y5C6cS9drVnCR6ydPceFwMUEwzAXiox0dc3LODNiZXWYsqEKMhDvxlaALuOXMkAAZ78ChZ9X4f7JSHdCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppYb8aI2vaFQMXvIHUVuRdSJF/JkhoBnaRihSrtyOto=;
 b=XOn/o1ZFp6B6p5cwzphCQZFcFN9WjYqVeSwe6wMezvIsDsmKS3qCwduUsgE1hUzTCbIkdUrlmiiu0xyHcqJoYfSawqKM05vQ5ePAoTvetHd3iYGn8l+M1a/0ksdoLlKQviKq/LRyV4ewE4l5rzkmiSt5SaeuaFdcOnNLVCdxsuXKeCgLr5LC0O+pREVsa0+CUcIUYzkf96eJ+ZA6S/5liEH0axE+gSkZFDWdpkQZCZnjyyQt/FVaIVkTtMxW2ZJpuEhPfzDPZjovjnRGg/q8S9y3Jcx5aeYgCof6eLdzHgK0T3zmOK4Zh2uzfmixIZ0dSGuPIi9a/fAraBLxuSsylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppYb8aI2vaFQMXvIHUVuRdSJF/JkhoBnaRihSrtyOto=;
 b=aLZs93LShzO/ouVKX+1lVRjL2Ia163KJjW1BArge3iz6FXFuOaHobORyiK6HaehESNPmDYIsrfDcx6ZbPjDDdjnMVoPR67QVyD/Rly+OG2FUKWK/QSTf46/5N2pDac/T9V7RlSITFAiWUMLK8Gc6Hxf8RCoQRn36ezMvqGtOce4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2830.namprd12.prod.outlook.com (2603:10b6:805:e0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Wed, 25 Aug
 2021 18:24:33 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 18:24:33 +0000
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
To: Christoph Hellwig <hch@lst.de>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-4-alex.sierra@amd.com> <20210825074602.GA29620@lst.de>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
Date: Wed, 25 Aug 2021 13:24:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210825074602.GA29620@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA0PR11CA0146.namprd11.prod.outlook.com
 (2603:10b6:806:131::31) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.9.47] (165.204.77.11) by
 SA0PR11CA0146.namprd11.prod.outlook.com (2603:10b6:806:131::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 18:24:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 878ea72c-ca32-4bee-e277-08d967f59619
X-MS-TrafficTypeDiagnostic: SN6PR12MB2830:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2830A6793FC0EFB09B2D23CAFDC69@SN6PR12MB2830.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dGPzE6eqwgvbfTf9kLFHze+t9RvsCqvGIVnUj8L5An7Ow0IEEoww1UHRLuQQEmYQek58HLO9G1G3Z8howaSIZcq4zwsIEhCWvjtVXkdzzkMu/X/5o/luSN8teYkBBlhS3RbuHYUzwnedzoN08SD3eyOUv/ZdRtmXGU4XS+qNePwtA2CYRUL72OYzBbOaAhYDetXtBP6/jIZOWCmcCtK8qnJYJzfscHanKnN0o3uQXi48gjSnAVJFuEXL4KQNvzXpackDg/sM96xJJGghNKcjpH2sFOXuzIfAputkj+CzQuuy3f+s+6yrkSLAuUv8h5eQOnGyonGvHCOjae3DtwHO5lBhLF7mCx0bo4l9nvMTaVMmn9NJ4VCqOtioLFm9BPDA9CLlajkGz/dwL6j1BHF40ifRG3oKYDXvXemtj1BlUCm5qYWvTDDmbnxQgXANYMVTpym+zezxU+x2wfKrEG+C35CF2kxlYpac3lfmv0iCAnu4EU3SwdV4Khann9ew1nPgNCSt3JlqUSTqlNlBOQu3lm8yWsdLaohMKiZWgs+gkDN6vIW8pf0jfPVSfmiLxuX+CinJAt0Bh5qw27YYh98Knd0yEffQq+3J91lsQ1OoHZZv8XAjEqkNb1GneSe3ZI4YXHdDPODZCiS1OCz16jEBBr/dpWGgrANXCxaUY21e/iG6PGLsW9FijypAm4XhO7l1oE73GJGjYn6ttNh+t5LGqtaEfoPht86fqvi7d0CwpSIJoftGV8s0ab0Xp+gtlJ1giRXMXDKAVBjbrypOdxLhWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(4744005)(4326008)(5660300002)(7416002)(36756003)(6916009)(31686004)(478600001)(2906002)(2616005)(956004)(38100700002)(38350700002)(8676002)(186003)(66946007)(8936002)(66556008)(6486002)(53546011)(26005)(52116002)(86362001)(31696002)(16576012)(66476007)(316002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHpJNU1BckFuNFZpNnZEQm9CeWtSOUtIWSt4NXJYdVZWWFVkSjBaVVJycFhQ?=
 =?utf-8?B?WUhQYWZLN3VwcU81Z2pybHgyOUI0WlROVmNtWC8rSldrYWFta0hmSlZPcFVy?=
 =?utf-8?B?bWd6Z2ZQN2c4Nk5lTEtrTzdTdWdLVTdnUmFnMHFOaW1MU3JjYlk5cDN0dVlN?=
 =?utf-8?B?QmpzZ3pudEJTTGZ2NVlhQjRNZWFMS1NVekFXTkNKamlKWVRWTTVKZXQ2Uko0?=
 =?utf-8?B?ZTZCck1SQzlSQm9UeG1raFFXMWhiaDBpK29kRjV2Y29FcEtwK21Pdk1vaHEz?=
 =?utf-8?B?c2JMVHpiSDZpam1BZFU0WU93dDJaUnhSQ3REUzBDVEVadTIvMUd2V1pLL2lM?=
 =?utf-8?B?VjNRY1RsRGpCVHNpcDNzUFF0TXUzdUlKYXFqNjN6OElVOVdXb09CRGt6OG1V?=
 =?utf-8?B?dzgvNGhWSTU1REFhT1IzdmJneEFicTM3ZUp6Rmd6M1VIdlpJSVFMdVNGaTJY?=
 =?utf-8?B?R2MzSGFCaytWeDNWbUliRG10V1orNnhTN3FtNk9PRWg4WVUvT1Y5cFM2WVVx?=
 =?utf-8?B?Um1FTjdlREt3MXhXbW55OWRWckNoM2JPV2xKVWlmbE1yWUVxRlpuN0hwS0hm?=
 =?utf-8?B?MGgzdVhtaTRjSU9aUTZ0UGgycVdwU3lJV1JtZU5NRWx5NUVMa21pdVRxTXlw?=
 =?utf-8?B?VG4vOEZjK3ZMcnQ0OVZMeFB3ZGVVdTdoaWs1WWx4MjBlMi9wVHdBdzNoMGpS?=
 =?utf-8?B?cnN0OHV6QzZYcmFBcmQxT1REbmRYWFRxMHF5eUFIa0h0alExMExmQnh0YW9H?=
 =?utf-8?B?VE9janIwVlMwSFd3WXpzWUc0bjdENm1KaWE5WXQ3ZXFjUzZKZ3dhZjZmWjdk?=
 =?utf-8?B?M0xTU1BLQ0FzSE51WDBNK1BqQTNRN25yV29BS2ZhaTNnbFJqb2dNZ0U1Y3ZF?=
 =?utf-8?B?b0hpQlJ3c0dEcUFWZFVHR2FPUkttM1FkQXZ4WmlRTHFYWHpGSVhsSGR5NjE2?=
 =?utf-8?B?ZGNiWTJLRGFFbUI0UjdyWVBKNkNZMmNSNzh1UVhtdUhPc25WOC9ZOGRpQ2Z6?=
 =?utf-8?B?Tjg3OWhEWmp3OUJqZGsxaE9zQUVhTTZFUjlFcVpEMWxVZWwrUnVKYjk5ZVg3?=
 =?utf-8?B?YmNGcTA0QzBHRmYybTJDbExTaEw0M1FodzBvZWhYOGxXeVQ1cEFPL1Z6ZHVD?=
 =?utf-8?B?Wlp1N0Z2TVh5YWtOK0o4S21VQ1BrcnlMcGpGNlREdnFldllTMjZQTlB3dVpZ?=
 =?utf-8?B?b0dUbXEwUTZFWTZSL2V5OWdqZHZ3V0hvbyt5MTZ4Si8yQzFCbkxLNnFmcHc0?=
 =?utf-8?B?MlljVXJTaUhEVldyak85bHBUdGtTVzkzSVdhSGlCRnhsKzVZb3JYc01BZkJ0?=
 =?utf-8?B?L1prTEdscnVCZEJDZGlnRVBYNkZkWHBTS0ZsL084RytQeWJDVExiM25ITTBS?=
 =?utf-8?B?YnpRQk1FR2E4d0cxL0ozbTUvckpncXVpSVA1T3gxSWJtckplRDVyL2VmVVNs?=
 =?utf-8?B?S3pSZ2pYVHNwSUZxdXZFWFFTRU03b05xRVd3Mk5PL0Fjc0h3WW9uVGtvbllh?=
 =?utf-8?B?dEtBNWljOFRBU2o1a2tGWHdzSFFWYzQybjg5d01ObkhxRnlvSDdVUkNVRk9j?=
 =?utf-8?B?RU9hVSsrSGdtRVhMTEJGWU5mRXNabGpCTWF2R05UdWVWTzNCR2d1Qi9JY2hH?=
 =?utf-8?B?dW9WZGg0bVNXRFZkV2drY3VrSnpRMmYzcHRtWlkwanAzdDlUeStVZjEyTDRQ?=
 =?utf-8?B?dWRaN2s4WDlsM3lCc2U4R3hDTnN5L0pvVzZSYlk2eGpDSEJRMHdXc1hUZVNK?=
 =?utf-8?Q?NmN05rCS0OWlfe5cEXV31fD2UUpuboE2UXfvW4w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878ea72c-ca32-4bee-e277-08d967f59619
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 18:24:33.4195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4z8rivtQary1ywSjKfvvCiuGp/d4AqXURW77QzUE5KHMlVXlBliQde/YDWf+KuvbFaYlpDXWxnlX2WDNwtSatQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2830
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/25/2021 2:46 AM, Christoph Hellwig wrote:
> On Tue, Aug 24, 2021 at 10:48:17PM -0500, Alex Sierra wrote:
>>   		} else {
>> -			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
>> +			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM) &&
>> +			    !(migrate->flags & MIGRATE_VMA_SELECT_IOMEM))
>>   				goto next;
>>   			pfn = pte_pfn(pte);
>>   			if (is_zero_pfn(pfn)) {
> .. also how is this going to work for the device public memory?  That
> should be pte_special() an thus fail vm_normal_page.
Perhaps we're missing something, as we're not doing any special marking 
for the device public pfn/entries.
pfn_valid return true, pte_special return false and pfn_t_devmap return 
false on these pages. Same as system pages.
That's the reason vm_normal_page returns the page correctly through 
pfn_to_page helper.

Regards,
Alex S.
