Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18BA3EDD7B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 21:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E8489973;
	Mon, 16 Aug 2021 19:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCEB89973;
 Mon, 16 Aug 2021 19:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8HjiwFgQImQ3CYaSkgqrG6uKWFBYVoGxM/yD68iRwNOe3dW8QOHRZt4Yxk8JJL9Nnkfur4tAh1Wl1wPLCKOwjRVl+0CUTmBXVs0l+jXZ6x+qJdsuVug8JidwcnFZ4PO8TTWvL6XxSh4M5nlrWybK8c1wsdAT19wp8k4+2QuJZnWM2FjUgMLv4961GAFQprYXA+Y0HXa3RRS+EV3kH1Z4MDAsPIs4eexA5od7HrSWBEAwRGnOP/nQ2j/R9BcGHb7zKUxlz/gtjOckUsJxKio4nsxrbTJ38hJY0jV7Mt8Qc46ack2dWiqNIMjadXQnIcYiWFNoJz90mPwYE4spFNqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JcCm0CsOBBRQ69CzZh8+DlwPdfWX2yk3KrDlzRXWo0=;
 b=RkDjeRG6gOaCN24AiCVU3NAY1gU9z25UEBucNJuyIOP+sFJjFQgS7eq415djSAV9uOFDHXi87Trac8/P1UDmrgF4Z1DjLOIUGJsKSyBKMaSHs4oeOgIB25GC6H/NrjxSY+goxR+BF0bmahVeHZWAY8S/EluO6asz78FHlY2nn/3HZ+pXFZGNQqR9RL64LEtTWX/4zjvD8ckdKbNAlYtlHuDITVLO3FHLcgBdkNgyAeg5TXXAC9UbzuOe2so5G+LJLRs+a6RduaiHK0TVVuz69oI2fC0Zd7cwKNnCbT3nXCdnR0beZxlWvmrBYBzWmvnam90jo5tTG5Lex154h0+TXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JcCm0CsOBBRQ69CzZh8+DlwPdfWX2yk3KrDlzRXWo0=;
 b=Q4xfa5zoinzkD3dSAgPfT+lshzqOLAOyOzgF/cWhmcghs10LgZd0b1q/9Q2zdB6CbX393GklCwmPbCp3v8mIKLZLHRPz0dD3Iq4+aAjAN4BAh6o9bl22BmLRYyMhWHVT4OXKQNYIQZF4nOBc59hgW+4o/x9qSTc0AWAMacP4D3M=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5148.namprd12.prod.outlook.com (2603:10b6:408:119::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 19:00:52 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 19:00:52 +0000
Subject: Re: [PATCH v6 08/13] mm: call pgmap->ops->page_free for
 DEVICE_GENERIC pages
To: Christoph Hellwig <hch@lst.de>, Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com, Roger Pau Monne <roger.pau@citrix.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-9-alex.sierra@amd.com> <20210815154047.GC32384@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <7a55366f-bd65-7ab9-be9e-3bfd3aea3ea1@amd.com>
Date: Mon, 16 Aug 2021 15:00:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210815154047.GC32384@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::29) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 19:00:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c08c98e9-7265-49c1-df0b-08d960e82ace
X-MS-TrafficTypeDiagnostic: BN9PR12MB5148:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5148B233795E6DE5F74AE4F792FD9@BN9PR12MB5148.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KedPQs9YclYWOxcz/vmk3XtOEEM2/RcFylEIAKi896lxTp4G+CRMToCBH9AkGyGJgLZwrY+1Aud7TrB+VWF6rl0LlF3GnIY4l1+RZfJ1tklKSI99LAwoeEt+o6MukLv0r5vOmE6WUEDSC3C910oMdTstbvm3tnhpiSvICAi4dgM5zkueVnjgWqL5dtb4yYOykRO0qLf1M8a6VoT6HBAkvuFehM5MY7w6ra5Ty2iyZ1POnEyVuqfCF1NC/1VzB8SCiaermkN5NYpUm9jG0iR5Buyj0OS+0DYHf568+DFh2tm8x7mdT7zuE9aJxYtBiLOmufrkpKRWV68xOpUBEmAvhCelekp7GkqRKzmJGIqenq0HZBWySuk6S8vrJCvq2WX3yWDEtKzbTDk64QK/dRGTjmMGVkR3no+kpnzt2D94dNIrqnqxjPpbAoakFiDAuTFeiwJv2rHiEKvgCTJiNqnAFYPKiDmwgiskDqr5pYN/qVY/YMU4L6ttfs44m7eoyfZxt80pgyyHONYZ+KOjw/9niJTtETV42CZ3qA9LaTfyLG/cTc2H7WDSChENjCBbS2eVhwKOuhnsaSQeW5M6BcopQ5JsrXg0P2sY2XmXpjz9Yht4k2IFLp/Qxh751oEhWLqCbnu1r3XbfgkW/d/IEQTYQIncl5vwjCOj9zc6/bJn6r5WvZbafPrzLAiHFJwO2UKpqkLqiq3npT+qOlZn8FOTcTocqCua48ne7t8pTFOj1nXReHDOvLerEOfzfJtp3i6LNbpkuOUeYl4FEXqhIzJmHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(186003)(26005)(6486002)(86362001)(66556008)(2906002)(36756003)(66476007)(7416002)(31696002)(83380400001)(66946007)(4326008)(5660300002)(6636002)(316002)(16576012)(478600001)(44832011)(8676002)(8936002)(956004)(2616005)(31686004)(38100700002)(54906003)(110136005)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFCUUVZbERqUTEwbFB3aUZadW0xVW5YZFdLNXV0dHpKV3dwTzN5V2ZKNVRn?=
 =?utf-8?B?ZzE5NXkya1YzRlB0UU9qd2wyejl3WEtLY29PV0tNQmI4QTErV2s4YVMrNC9K?=
 =?utf-8?B?dkN1REpaVVJxajVyNzNMTWUyeVpwaGdsZHBQZG0wNDR6cVVNVVRwTTA5Ykd4?=
 =?utf-8?B?NWhiclkvSFNJSExtcVc3a2ZqN054bHB6d2RsaGcwOG9oSzMyQXNENGdFTHE3?=
 =?utf-8?B?UXNkcmo3K0JGa29zVit5SUFyV281bS9IdXJacWxLWnlIeEpWdUpiSUNsN1Mw?=
 =?utf-8?B?S3ZHRndCajIvL3oyVlY1SUMrUmpUa0Z5MXZ4cnRNM1IraXNQSGg4ZXBaQzBh?=
 =?utf-8?B?Tlo0TCsyVWZTQ1M5bGlaNGJGaStTYTlnT0duaWZnVjRldWp2UnBJTkNPcnc3?=
 =?utf-8?B?OEJ2TndhY290OEdYTXhWSkpObGhqWGEyU1RNbm10MGRrQTZNVk5SeTBFTmFU?=
 =?utf-8?B?Snk0VFZFR3huQXcrMkFvTS9DVjZmWkJrZjIxeXpLZWtnRW9XQS9SOVlmZlU1?=
 =?utf-8?B?N0NiRVZ6c1lFMVJoRHUyTDRMemFPaENoSXJzNUlIcjRUaWRueUJ5c0lSR3Z6?=
 =?utf-8?B?Q2lUdmVUNnZ2aXExUDZOMmFSRGE3MzZWdlVIREJPM0NDYTM3TUlnTHVWUCs2?=
 =?utf-8?B?SUlhOU9rb3lxSEgxeklieUdTOXMwVWhWNDdEYkIxdWZxVkc0a1BDTUxVclox?=
 =?utf-8?B?SHQ1S2pCWFN5blBuOUFYUVlTMDg5Z0xEYW5mMkxPdkR1ckJJZGNxcDhvUGw1?=
 =?utf-8?B?b0VTWnQ4UUtLdWlTVGNvT3Z4YnUxbkN3Yy9RQ2Flbit4aHpNeTdUOS9PMWc1?=
 =?utf-8?B?eWkwQkhubFBJZXBmR0c1b013N3gvU01JUG1OSHJkS3lnY0c0aTQ3b0t2YzUy?=
 =?utf-8?B?aGUzSXpsZk5jdEplS3h5UVRLZ3RvVVJ0TUg2SzYwbkt6NVkzOGhic1lsRWVN?=
 =?utf-8?B?WmVLVys2NDluU3FRRXBwcmcvR2dVWndRY3diMllGWk9mMzh1cUhGczFLSTJq?=
 =?utf-8?B?bVJQMVhubDQ2a2lncXRFdlBKaVI2ZHc5L3MwdWw5RU1mdEJRZWY4L29saHl4?=
 =?utf-8?B?bHRLQUxRU3lsSHlPRFdzRXZsaCsySWlEMVI3TXl6WHRRTWxYYm9mY3F1QzA2?=
 =?utf-8?B?Tm83MDJza0NQbUdYQlhPL0RjUXNwQnRvSUVORkpNNmUvRGovdUhOcE53NERL?=
 =?utf-8?B?S3JDY2JqTTI5QWZJRmVMbDRtM0pKVkQyVG10RDY2akJqL2trcTNMSmhhSDQx?=
 =?utf-8?B?czNiMldHSGVyaldvVlByUWhiM1JqZmpvK0F1RWI0RkRpUW56SWxsVWQ4bnFP?=
 =?utf-8?B?OUtQQitocUJpLzdCMVhHMjBzU3V3OW0zWmVZcWpzODhuc0o2WkxGWmZLSWJC?=
 =?utf-8?B?TGVCRHNjT1B5OXpPa3JQbUphVDF5RVM1eE95aFd1SkJTWWZ1NWJSdkxSY3dw?=
 =?utf-8?B?QUtGRzFHTFRrWE14Rlk5Q0pEek80QkJLRTFHM1ZlbUtVUFF6cEV1NWIwcytN?=
 =?utf-8?B?V3RwdDIzM3JiTHFPQ0VRbmdSeEhkU3JkeWpNbVIwQllkNUZzSDRhcEdmb21n?=
 =?utf-8?B?RHhhRnhLSG9yeXd4VTVRWlQ0UWhPbk9CZUhsWUNvanJHMEMzL2xPTWloU2px?=
 =?utf-8?B?L2tpbXgreGE4L1dIUjJFTlBNRDBQZFppc1lwd0dldDZjY3V3V3p1dlhtZXJh?=
 =?utf-8?B?ZGoxbzJmcjZBT25Fckc3czRkcVBuVkhVYzJCZzIvRElZT0JpT2dwOXMrb0t0?=
 =?utf-8?Q?vpOByH2P75PPL2WLQmYIU+c/L1H48vO3Ngy/6Lf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08c98e9-7265-49c1-df0b-08d960e82ace
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 19:00:51.8725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEXYp7tkm/6Xj6EEg6yLPo5NJFcITDJ4Q6qFZT4THgiC9knLqlfrZKe9K1PuanU3loFjnG+YlhKW5SzQmoHgdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5148
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


Am 2021-08-15 um 11:40 a.m. schrieb Christoph Hellwig:
> On Fri, Aug 13, 2021 at 01:31:45AM -0500, Alex Sierra wrote:
>> Add MEMORY_DEVICE_GENERIC case to free_zone_device_page callback.
>> Device generic type memory case is now able to free its pages properly.
> How is this going to work for the two existing MEMORY_DEVICE_GENERIC
> that now change behavior?  And which don't have a ->page_free callback
> at all?

That's a good catch. Existing drivers shouldn't need a page_free
callback if they didn't have one before. That means we need to add a
NULL-pointer check in free_device_page.

Regards,
  Felix


>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>>  mm/memremap.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 5aa8163fd948..5773e15b6ac9 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -459,7 +459,7 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>  
>>  #ifdef CONFIG_DEV_PAGEMAP_OPS
>> -static void free_device_private_page(struct page *page)
>> +static void free_device_page(struct page *page)
>>  {
>>  
>>  	__ClearPageWaiters(page);
>> @@ -498,7 +498,8 @@ void free_zone_device_page(struct page *page)
>>  		wake_up_var(&page->_refcount);
>>  		return;
>>  	case MEMORY_DEVICE_PRIVATE:
>> -		free_device_private_page(page);
>> +	case MEMORY_DEVICE_GENERIC:
>> +		free_device_page(page);
>>  		return;
>>  	default:
>>  		return;
>> -- 
>> 2.32.0
> ---end quoted text---
>
