Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A326444FB7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 08:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADA26E8B7;
	Thu,  4 Nov 2021 07:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57556E895;
 Thu,  4 Nov 2021 07:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgXGSWxQfjOtLj8ZWCtUbhDAJTtRfyRx3Oz2t2BaS/KCiERNg9nMmVCQH3nVzzzRjF7VJXQ2JY4vGu6SBV+ZFshqsqEmTWr2Oo3el+PWi01+YldC+S0nNkX1OYrlWKwZofW9HoegLU7+DHhsD5UTbFZ6lnQNQpsbgVOOXYRF9HB3kBWrdlGBjZBF6CS9wTf9Bb/e14sTs8P5kqEWXtiTB+KGq25D/ov0xUR1CGT4s9nyof6ume2fmEnDtXPgTxQCCTBGmQMKSJLbUbirVwno22RGLWeh7y8ZdAlKRVYBMJMT7vOwzJyC61MHvJyMacOA41eTkZPTBYtlJSd++PHJ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1C6kdU9pfF/e0y4w4E/s2GNMvgyYzs6Od0qQXHlTPVM=;
 b=fKCn5NBKkoXZYXq0ssZpmveR082H3LVKXoprkkiOSR0Bmy4KTD7wy1M2YyKA8g0kw8mgEgXwiOG50VgwuL0Um3Vixr87kKCdv9pRkTJfY7r8+kg6AlzANUqZyVDn37sfl6rsFj15Xk4uujVrCIdu1gCFkQIJn3Q2iIfHQfI1Cv1ZCN+wwRwxMhLLPJiylFMjQkucjo9kusNi8WbfBnkdfXkSSrLqScpN1EXedVcDa4k1ezwhGPq1zgSE93Ilvi1NwWdR3MtQ6n75Js3CKV/fxGt8lV2dFff7VigXKEgJVNDkgiaq1Eb3FVvuvM2MafLUpnoQHmr7L/EdI7/YFJq2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1C6kdU9pfF/e0y4w4E/s2GNMvgyYzs6Od0qQXHlTPVM=;
 b=32FxcVFtbY6iYPHIqQ0HqweweIdgphsou6f+CV5VLKCMj9oOlE1qHH99Z7E5BNcFcjOKfutRiUw4X8DhMQo9DdRwkOgyjeRX/YuWziqp5lA65WPo9EdSLHFST8UHoUCCWXy5XoUdHhkahxxMDU1AaQbVynVAmdL3qy97YgDTCag=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4410.namprd12.prod.outlook.com
 (2603:10b6:303:5b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 4 Nov
 2021 07:34:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4649.020; Thu, 4 Nov 2021
 07:34:53 +0000
Subject: Re: [PATCH 8/8] drm/amdgpu: add drm buddy support to amdgpu
To: Matthew Auld <matthew.auld@intel.com>,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-6-Arunpravin.PaneerSelvam@amd.com>
 <55adb714-45f9-5af5-33df-ce4f4526a8c8@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3b5fb9bb-13a0-a7db-cea2-1515aec96742@amd.com>
Date: Thu, 4 Nov 2021 08:34:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <55adb714-45f9-5af5-33df-ce4f4526a8c8@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR01CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::39) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM6PR01CA0062.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 4 Nov 2021 07:34:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71865c35-fdfb-4864-b9d7-08d99f659792
X-MS-TrafficTypeDiagnostic: MW3PR12MB4410:
X-Microsoft-Antispam-PRVS: <MW3PR12MB44104FCA8909CCA9C52E8D37838D9@MW3PR12MB4410.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hi4IOokaMj15CbERCMEeaRqNe6Ka7T0+cfao/P81elCsOBjg1VCmCsBAgwoFXceAYVoteislJ9EJLFl+fifB92R4/xs8Nlysn8XJrzYKhSxogk+4MrZg4CkdgYq5D7vBvX1Es5+v5i00i0uLQHX8GdH7i4whNmSefMeNSiuidYIVPW2CzpEG4IUZmoUdwF+CU6PHnfpuC+ad/3E7/SP5Sje/sO/n713GlEk3gFfBWOmi/aE+FvrO0vWZZQwN1evqj1wF1uxG69t2OOjmLan6o0yCRFhHNehOEt+xgf9jgsQofbujecbURe1EWFan5MdkQJb12LzwBbc9F/2/gia7KH+q0e8Ab8O0V7mR9bQskRbv/uhCGf8xBRRB8gtwMczvJF9lFHNCwqBuZNuE2vfewPLhHYbIaB4n5QNXP5RPHFCfYr/csTXJBQ3dwBat4ql/K6VSYtG97tt5RPvtqH0R/1WE4h5SveYwBcH/BwYSGatRNTgxyoSUB5ziZpgdHDC5IG8/AhT6U3sMK2pUnwOm9UyliUmEkaXthii2o2KWTMwgLFecwVeEkKatCzR7KPg0ercdR99N9rbOqUKx6JZQtPqxde3F+uZidqPpmuAxw1pAPwiA4AkftKZbJbsv93qMEmq876x6Xk7keWjFthyMLFYFo7bQJuB+ig1WfX70G7xdOO1QtZbJJjBtGu3HixHyz25dRcpBVCc5iNS9UJY6fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(31686004)(31696002)(508600001)(6486002)(316002)(36756003)(26005)(186003)(110136005)(83380400001)(16576012)(86362001)(6666004)(38100700002)(53546011)(66476007)(8936002)(66556008)(956004)(2616005)(5660300002)(2906002)(66946007)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkNvbm41TUhla2xranBGVTdIS0R0OWN6dDl0d1VrUEtWdms4cjRnRWhNMzdL?=
 =?utf-8?B?N2NwYWdBVUpqbHJEbGMrRytYSXVMeWQ1bCtlRE5uL1RQeHlHSTBLalEyZ0Va?=
 =?utf-8?B?S1Vvb1d2akFYNFd0TzJmeHNMWDJSbXR5Q1BOeUsya00ra0V5TTBGa2JodFgw?=
 =?utf-8?B?ZnNNb0ZDUWUya1JQVFl3eWw2SS9Jdm9XSGZyanhBSVhTMnBlOXNWMmVycm5s?=
 =?utf-8?B?T2pqNU10VHZFZGhxZ0lFS1dlQVpWa2pnMmJrOHVDc2p3VThMaklKYmZSZ09v?=
 =?utf-8?B?QWJNcWEzdVRScDZ2UGZvUERZYWpuRUtwd2ZsZVhGRCtINWQ5TEhYMzU2bzdr?=
 =?utf-8?B?SjZDcnpwUjU2aVQ5YmhmYzNCNGlIVWJJeHVHY3lGQzVqckdsS296WEp5MG0z?=
 =?utf-8?B?aWE4MFFmdUdpMHZ1MGY2UlQ0aHRrR0RrWUlEQm1uNHNFYS9VcG01bWFPVUVr?=
 =?utf-8?B?SkwrYWtJTzVyQTNCMWdXYTlPZUIwaGkvMjhSY2NYeEl5SExiRjFWNWVZeUlw?=
 =?utf-8?B?MVlGc0IybW9ldzRrQ0VEZU8xaVhVK1ZodnFxU2krR2E3cXI3SEtiMWxrM0Vq?=
 =?utf-8?B?ejA5SUk5dHdVYVNpd0JyZ1p4cFZhVUk3ZDBkdUE0RFFpeWJNdFFjWVN6UUdm?=
 =?utf-8?B?L0Z6KzErdVZJd1hjS1EwS3B6cTdwajlsY1lkcmlTK3d3ZDJubEpuRHZwU3d1?=
 =?utf-8?B?ZS93aEsybTF4TGEzREFjSGIzVFJUeHhDOUdWditkWGI0YUF4aWNBVC9VNTd2?=
 =?utf-8?B?ejYxL3M0dUFEZ3g2MWh0Zld3TWhOVEMxTXRVN3VEekV4dnVCVVFCUWRGREJs?=
 =?utf-8?B?WnJ4ZGtTdHBMOGxYc3gwRzcwdHFrUHppMnhzN2h5THVPYkhJVVRSeFZ6S2JN?=
 =?utf-8?B?SWFWM3VMQ0pUaC9rWHB6Y3dHSU9iN2E4S3hLd1VlWnVYd2hqZldXYTV5NWM5?=
 =?utf-8?B?Q2RZRzNXVWgxcnNOc2hHdmJqZHZ1eXhKOHlmeHpRbzBuUlF0WEJsUzVxQ1hZ?=
 =?utf-8?B?NkdRUFc0ZlMvU1hsZXJQNXhDZThVa2tWZHIvVFpPdG5CanJpTFpMdzlUZDNW?=
 =?utf-8?B?T1c1NkpxbDUxQTloaitUWE8wRmlJQ3I5T3VTeWJWcHVHNHZtVlgyRTIvYzdH?=
 =?utf-8?B?b2xTRVMwaUYvQitWTWhHWlRHeC9uei9NY3BYYnNaRUFSRjA1VnJOS1hvMkZr?=
 =?utf-8?B?dGg2ckpXMUgzSkJNY1p5d25TVDltUnFSdEZqMzJFb3RYWW1pRnlPSFIwaVEw?=
 =?utf-8?B?SWY5Rmp4bm9vUXNQclBGTURkbFY4VUFPaW1BYTB1eDAvQXErNjBISis4ZHpD?=
 =?utf-8?B?T1hZNjRONDdvZzFpK0w5MnRGb3RiODhnamNEdEJZRGp1M0I5MnZpb1FIUS8r?=
 =?utf-8?B?cys3czRpTWFkbmNHeElQcmpoQlhlTmFCOFE0R2IrR1ZmMmJjT0xSNGt2clZG?=
 =?utf-8?B?a2hRYXpTT0NaNktLMDVsSzdic2JuWDI3ckZ5aTBhaUJpYUJsMFlLUHhCNHpp?=
 =?utf-8?B?TE5Ec21EOUltSHhBUkRnVm9GNGE5bTY1ZHJKY3RjZ2ZaeW5iQm4wNlZGYTZh?=
 =?utf-8?B?SFMrOWk2VW9zTEtCcTBIMm4vdjNiUWRwOEdmYW9BU1l1L01sSnBzZ2RoSkdq?=
 =?utf-8?B?M2szWEtMOVNidHdjU3pteXdJSm1PcHQveW01L0lMelluRXZtTVNnWGwrUVNi?=
 =?utf-8?B?SGlmSTB3YkpncllCMnFzditINURxMDRkSXFoWkJSQ29TL2VFMTJhZUtwMnRt?=
 =?utf-8?B?cWdieVl6cW1mNUlCQnpQWk5NNEVZRC9JMjUveWRnOU1wVGtaYnZoN2ZRZzVI?=
 =?utf-8?B?dnZYREMvQldZUjA5WjJtSENSNFpuZ1NOVEkwYzFRZkFwUnNHUUI1VmdRcEJi?=
 =?utf-8?B?QzI0SnBGelFrSzc1dFNJanRJdXVwaHQ5TXVDQU41K0VucndjdnBpOE5yUUtP?=
 =?utf-8?B?VUR0MjdxSVp6UjRNWStKUlIwRFl0TWxBK1puTlRNKzFIeDhJd3ZmVmhoZU9O?=
 =?utf-8?B?dXZ6MDVQZEMxMDEyWVEvQ0VqekcyR3BmOGJ1bFFBU1Z3aTI2N2tuT1lqQnRN?=
 =?utf-8?B?dlBEMWxSOTRXNE5uTTJPejhBMlBWOEdTY3QwK0hpTitDSWtpYVE5TTJDL0Iz?=
 =?utf-8?Q?ZdAM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71865c35-fdfb-4864-b9d7-08d99f659792
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 07:34:53.5293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vX9JppMV/ZNNvRBKPElFniU85wpVeSbt8Xz7t12jusqI60o9/0DWEhvJ4l7UAcrn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 03.11.21 um 20:25 schrieb Matthew Auld:
> On 25/10/2021 14:00, Arunpravin wrote:
>> - Remove drm_mm references and replace with drm buddy functionalities
>> - Add res cursor support for drm buddy
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>
> <snip>
>
>> +        spin_lock(&mgr->lock);
>> +        r = drm_buddy_alloc(mm, (uint64_t)place->fpfn << PAGE_SHIFT,
>> +                    (uint64_t)lpfn << PAGE_SHIFT,
>> +                    (uint64_t)n_pages << PAGE_SHIFT,
>> +                     min_page_size, &node->blocks,
>> +                     node->flags);
>
>
> Is spinlock + GFP_KERNEL allowed?

Nope it isn't, but does that function really calls kmalloc()?

Christian.

>
>> +        spin_unlock(&mgr->lock);
>> +
>> +        if (unlikely(r))
>> +            goto error_free_blocks;
>> +
>>           pages_left -= pages;
>>           ++i;
>>             if (pages > pages_left)
>>               pages = pages_left;
>>       }
>> -    spin_unlock(&mgr->lock);
>> +
>> +    /* Free unused pages for contiguous allocation */
>> +    if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +        uint64_t actual_size = (uint64_t)node->base.num_pages << 
>> PAGE_SHIFT;
>> +
>> +        r = drm_buddy_free_unused_pages(mm,
>> +                        actual_size,
>> +                        &node->blocks);
>
> Needs some locking.

