Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F69E717309
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 03:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E1910E459;
	Wed, 31 May 2023 01:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77A310E459;
 Wed, 31 May 2023 01:17:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e36TgvXA2rrMzMmBFVpGsuCFQ7e+S1BIdGg9FWcLw+LmRo2j0Zx7LmyJPLgUcqBlHu3LfHil00TmTu9j9rYWcMqZgfay4J52kpA/XtnD/CSsoMB6gVUdd+jK+Wf3A8dW/8bvBjSR3oqbHKxZJwIyo6Way6IgYX9CDiTbXcOjRvjeUWiI0txze5gAhpfDnE5i0W+o5n5DqjPFYPTrJMuvoiK43cm/yNQOlCT9PFXexOvwxs6hjzjKRgy2Wuy4aBaHUKuAJnY4Wvj9haak3FZVwb/OlYt9krEDS5HxNH8J8J/ZsBttKWIeMSO+1Gqf0oKzuf/C8kNSk30rZ2MdvY2GAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aPks0j4i9RoFhibssKStz8SDX6FTu4Tc15P2SQLdwA=;
 b=PD8gw1JvIZ7lolD7ahZuGLCQsDDPkhPY0yKzrA+Hxt3kCtUb7MLtsVOb1A92F9HFz3DrJrSFRdJOUjiuebHMQ8HCMrWESvN7yNkmTjCziQbOcuNBWJgXGAcjVYK4UiPGd0CBKAUDclUOv/JV9iTJ8Z2c3GSO0FhtkR9Zg7Zov8iozVvmtHNhUpaWbDrt4/GVwf47YW6U/qjKiQIBgSBbiB1FYHLEI8gNwqN3/xbDdpv7m8tUGTEk+zDK01dntktwcAjQyOeaOc42E53WKPkL1FVG7AFnxJfBiJoMlR9c5+OMdZbXMP0NmBpXKi9qcnDevSzmj/wZ0yq3YXKunD8HWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aPks0j4i9RoFhibssKStz8SDX6FTu4Tc15P2SQLdwA=;
 b=Yf8PoHsJ1sRYMi0kBgr1JEuuffYRRVFD3wmD8DU9i60x0ctZOWwBAmVk121tCqcm/xFjmYE8GOUXVvyzTWwjyTXlD6i2BeV4Vws65hDTIKRvJ/7LxNAF5lZKdwtwOXdaHHztOApww4wDwnLI/kcVMXXF+on+p6Z1jKAT5oCDSCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 MW4PR12MB6729.namprd12.prod.outlook.com (2603:10b6:303:1ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Wed, 31 May
 2023 01:17:41 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::cdf:2ed1:1f52:9f65]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::cdf:2ed1:1f52:9f65%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 01:17:41 +0000
Message-ID: <69d33272-6b2a-6a89-da5c-dd49d17b798b@amd.com>
Date: Wed, 31 May 2023 09:17:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] drm/ttm: Remove redundant code in ttm_tt_init_fields
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230529092853.3430546-1-Jun.Ma2@amd.com>
 <420e2658-37e8-3f1c-84a5-ca24e9d104ff@amd.com>
Content-Language: en-US
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <420e2658-37e8-3f1c-84a5-ca24e9d104ff@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|MW4PR12MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a625c3-de76-4815-17ac-08db6174d495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ucojn77lXmeGNYAIINa/+YGZxGtT5kc8K2wASaKtip7XknBHh+8BWSFAFTJzvHBteW7/3wZ0G0OwvT+sak4GHit6KTwpfwqnKDvIlREM0JAIkgZHOfp8f8AgDd0XH7pjgWnIMZ+ea224xxqdST2j26hMG4PUVQtlEbMyrJK2Zi2Yk8tby0FIuIbkYMGkjYRM+ocTuvpywywSuJswgiqnXRhwTTpe4457MgKl3cAA+PbXNVR9UhXHy7HHmgzD817XwSK8YP64FKR7BkEj7Sqm2AQsjWJ6jkIkzL6cNrWJqK00W9ywWj6otq0EWY+XC9AAvrQ7yBl7uz2rjvD1ayNtHrCn/cZPzyrkvwWJL9bIICH7GAc3z0HriodFNEZu3es0qAv3yOAx7roDlTgKV81dEkd0Kuk1jUH/JkUatgrShzjYTZyqvGdd8Uk/JS41JIkyVB9iz9iOuDm7KWPYYr35kzTHeuJBWYz76yD2ObhayC+iI9QJK6Z9C6jz0aG4MJZbfdFp/qWBxT6jyNXlgK9IbU+o73wNqdQNmsdp4Mwy6rOoiWqP5mvKYOzgu9jHxvvj+gegO17MNwRf7H24YE8FLRs/MqsiythOlcX8vthkVrkB8VcqdUVENUTE4sFyM0zg/8wmUV0ud0+VWsMbcU+Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199021)(31686004)(38100700002)(316002)(41300700001)(6512007)(6666004)(31696002)(4326008)(2906002)(8936002)(6486002)(8676002)(2616005)(450100002)(66946007)(66476007)(36756003)(66556008)(53546011)(110136005)(6506007)(26005)(83380400001)(478600001)(5660300002)(66574015)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFRnM2JxOVhaYnVFelMzcWZCR2pTZ1M5a1JXTGFpcnlyVVoyeEVVZ3hTRi9l?=
 =?utf-8?B?MWRmWGdKNnJoS3J4UlFDNzkzMFhVNFJWK1FqNUFkRG5DRUNNVFNrQVIvN0hU?=
 =?utf-8?B?WW9KN29Wd29qN3FsTTJCNU1pNnVPNzZOM1ZqQkRKZUt1WG5xd0laM2NaZXhY?=
 =?utf-8?B?bFpQRjhqYmhQM1Vxb0JlNG5zakJFQ0NCdFFkMzkzWC9PVVk2NEdGQ3NBVFkr?=
 =?utf-8?B?a1lsT2oyRjdycUhyUDNlN292K3diT2V4LzQ0V3dkMm5waGdjeWVoeGVJU2R2?=
 =?utf-8?B?bjVnSDlUdlRheTM4YUpYSjYvcnBaeUtOWjNjVmlDeVJ5ajVaRkV4Y29EU0Uz?=
 =?utf-8?B?a1JSNzJ1OHdwbUdabUcrK05PZExBZnUvWm1hSDJVVEpWd3dDRTdYRHZiMGZY?=
 =?utf-8?B?bTJQRWowQ1kvMzEybTlLNzgzVUJIVU5jWFAyUzhidnU4RkxOTkNqVWhiZkRJ?=
 =?utf-8?B?Qk8rNjFoWmFrUk5LaGlwUWpuSHlFTFZRTjZ2ZjBHK1dFeGY3czh1eDBhYmxq?=
 =?utf-8?B?Vk1BcEFIN012SE95TzkzQ09paGxseUxWWmZHbVBhYjV6c2xXUFlXV0lZNFZC?=
 =?utf-8?B?MUpmelFUQVVnSUVDcmZIWlAxdys3MDRxVzdJRk9CZUJ4UU9XL0FzOG4xdzJK?=
 =?utf-8?B?dUZ1QnJhOVFZTXBIZmI2bUtndHBhZTA2Y1hZdGZMVW1oaWNiN2NjbUpCc0c1?=
 =?utf-8?B?YS81cjlYMW02KzQraFNienpXTWNFUG1EQ3FPNFp3M0RSMnpLazJ3QW9vRUJI?=
 =?utf-8?B?TXQrRE9UNlJDZzNEQXJmNWYvMDAxdWNNTjREMGZ0bkNBSDV5Y1o1ZVR4aEJ0?=
 =?utf-8?B?TUZzcXhoQ280b3RUVHIwa012RTE2TDNiZ01kMEMxcUQwSExwZ1IyZGFxalhJ?=
 =?utf-8?B?aU4zQmRLZk9wQ05SVWwxRmZQL05wNlhXMXkvZExveXNjeFNBNkt6Zm1zVWpn?=
 =?utf-8?B?V3ljcEJxUjRLT3dlR0dKVWY2dTlocFdXdHB0S08zRFdkRXVJcG45cnpzM1Rw?=
 =?utf-8?B?U2ZzY1NkMUsySXE1VXU4cndvUWFST09HNG5nVFdibURnMVNJbnFrTS96UGI0?=
 =?utf-8?B?cWUyQ2QxWE5wb0d6TDUxdzFCVGxqU0dGT0hhVDNJWDBNWDN0elRQYzNTa1ox?=
 =?utf-8?B?QkM1MStsSUhLWWJXTzNScWh3ZDYvMVJmcy9MSGVCakFrc1IrcDhOT0VueFdX?=
 =?utf-8?B?Q3VDckN0Rkk5empSOXJTanNiRGpIMmJzZmQweTBPM0Q2K0lFOEpiM1F4UC9u?=
 =?utf-8?B?MVM5bXppR3JrM041dkpIaExuY09jb0JsWGlVZnp3c0h4QUNBVXFSQTJmY0sx?=
 =?utf-8?B?eW1VbEwvc0VicDNYQi8vTW4vaFJQRyszd2NHZHgzTGpxZUU5YnpmM1k0NFZU?=
 =?utf-8?B?bHZmV0Q5eXV2SHUyNWE5Si9BbEhwZWtFZ3dxdkdrd0ZnR3duTmJQdGtpR0I4?=
 =?utf-8?B?UEs1cG1YMWVFSFBuNGJLblFwWUxwSVROU1hGMnJUR2ZYU1c3amN5QU5KYjJM?=
 =?utf-8?B?Rk9oN0hCbDM0Nnd6Q1ZZSGo3dmtMUFFOSHhDS1lGKzc1SGNBMkxDRENRbTFw?=
 =?utf-8?B?TmtFeU13TjlRZ3JJT3hqVDlYb1p4MzFkdXozM1UzbXo4aCsrYVQ2andrV095?=
 =?utf-8?B?cUgwSkVqUEhIc1pSNU5SWUVrMXp4UkpBcTVPVFhiVzVsK3dSRGo4Y0ZETFNV?=
 =?utf-8?B?Y0Y4ZlBRdlFrM2dxbXIwUWoybjJHcU1XNWV6L2M0dnBIRWNSYTJmemFZSFBN?=
 =?utf-8?B?RytseEVBM01taHcydHY2UnJBc08xR0d4d0hqRjhKeEs5WE02d1RSdXk0Q3hl?=
 =?utf-8?B?Q2RaZ1lWYlFiNTJndm90WWMwNzVoMWtkK1R0SnNGaU9wWTN1aWRlNFV5Qy9I?=
 =?utf-8?B?NFJ1SDR5TzhNeTM0OTZrTGJwVzFGZDk5OHB6L1lmRnNyMkNCTnNDaVdNRE1x?=
 =?utf-8?B?RmhwWXd2K3BXM1ZUUkNUWG5VSlJjdWRxY052aENNZlNQRDVtN2J4V2VNcHYr?=
 =?utf-8?B?TGRhcUxaSXkxNGpBTDBGNHo3cUNwUE5BZEh0SzcrZlVIVHllTXN4WFJ1K0Jy?=
 =?utf-8?B?TlR4L3pXWCsxcVJ0c2J3VnFEQjg3eGR1cGNZVHUza1NvN293ZGY1cXBwWWM4?=
 =?utf-8?Q?CKjA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a625c3-de76-4815-17ac-08db6174d495
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 01:17:41.5976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTMVlkdV7NSAaoFGVtDuhsxLlzcce7WtOLvdYGGkyQFy9DHO96qJziFpGbd+RTS1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6729
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/30/2023 4:59 PM, Christian König wrote:
> Am 29.05.23 um 11:28 schrieb Ma Jun:
>> Remove redundant assignment code for ttm->caching
> 
> The explanation is missing why this is redundant, e.g. something like 
> "this is overwritten just a few lines later"..
> 

Thanks for review. Will update the commit message in v2

Regards,
Ma Jun

> Apart from that looks good to me,
> Christian.,
> 
>>
>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_tt.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index 02b812dacc5d..45a44544b656 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -143,7 +143,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>   			       unsigned long extra_pages)
>>   {
>>   	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
>> -	ttm->caching = ttm_cached;
>>   	ttm->page_flags = page_flags;
>>   	ttm->dma_address = NULL;
>>   	ttm->swap_storage = NULL;
> 
