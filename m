Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E3B45630D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 19:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F170F6E17B;
	Thu, 18 Nov 2021 18:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA7B6E0D9;
 Thu, 18 Nov 2021 18:59:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjsycyjlGnkK9bBUtr0GSQsoOnQkk0iKB6WD85qWXlWVgFdVW5h+iVz3qq5regmwLX2kigC/ISOViWc0GQckh5lcysPOdb7zqNNBJn39WFVJNi4TUpdrQ9gZLAD+U2ybxomhPImtpwGo9Eu4O3b1AryYee7yo7dDZnMlriL/M813+LX5soe/iDa1fSelWX0Vo8WzMg0EvQ8WVI53D/TGzRXWMGLkJXYzyoCEedWDRWV9us6BBQQVdtUmvC5WLt8XkfDi+8qTqVWKQx15wxqCzPhvOlMwbJaln4sGwL/vVX3wgbKkx3Hh5LycKZ/s/EidSiWP5dMdpu+GllpPqrwXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/YRX/4D3IapxQNDSeEEg0+0Zz0p0ALe25qHC19LuIA=;
 b=k9YbeIVzJgJbDCP0OCKjzItgnG1QN5FJAVhgoo0GPLq5KQBd12r/8rOnv5IMdJ1dUERbXdb11YgY3PPYqoaf/WkLNr28xfu7iILvyBkkt0KVYNHMB/XjTKOzUgqvfQekydsCT1FOiHVwWbQ5tJ0qIaraVGOWTNLhBRfXQ/dLtXr+0uDd3hJFhZFQr3aryBoktO2+/GbwpOA1Q3tnbMHvpLrjvbjWM81995ZEVRuD01bI275/J4u+cUkb9ZyP//vMDTZuRJ4TOu38VXlwyjgyghATl2XHbeQPmjhFppZJ3l7f8jPUGMUw6tsEklT4zNtBmKAw0rCCjVIKYih3i7+Lpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/YRX/4D3IapxQNDSeEEg0+0Zz0p0ALe25qHC19LuIA=;
 b=vSpiQ74RCaPF3j4OK/efWvHUyVA2H7uRyKMqHNZlLe/jav+EFm98W7cxaH3eQQf3o1xnXpuqqvwRff5iDGePV2MCOPkSp4imZ8UqpwstG7QcsFAtbCtHqA/JwpXFmaN6kcosDE+U18WdoKAUSktaX5zNsu/bg/NPqPOcWw7Ngk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5368.namprd12.prod.outlook.com (2603:10b6:408:105::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 18:59:21 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 18:59:21 +0000
Subject: Re: [PATCH v1 1/9] mm: add zone device coherent type memory support
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, Alex Sierra <alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
 <20211115193026.27568-2-alex.sierra@amd.com> <1997502.P62F5Z1OZk@nvdebian>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <637b19c0-5ec4-b96b-f6f6-c17313f03762@amd.com>
Date: Thu, 18 Nov 2021 13:59:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1997502.P62F5Z1OZk@nvdebian>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YT1PR01CA0145.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 18:59:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eba6858-f5a4-4e88-2167-08d9aac58784
X-MS-TrafficTypeDiagnostic: BN9PR12MB5368:
X-Microsoft-Antispam-PRVS: <BN9PR12MB53683C3A289F88EAAE5EAABB929B9@BN9PR12MB5368.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trjKjO+k9xlsrQgT+KUwyd/PZGhX4fWAJgwVcL5c4UPejTGx3mhTptbekTv9RX+Qn5eiKohL2HQROlOWabWilmA2+Ah7YSxozKheqFC3EhT5u0YSaSrcAyRl+pUlGCBe1Wz9w7SiO+FKCCD5+vOzaTjRrjG4y31pQdKCQtUDZtXIkTgF/KgKlZwHtISSiLiQ0lDsvTW+PngYS2BxWOUFgT4CPiVFr9uWZus2J3e8Vjtg3jS+YgdV4Ji/iP5wKWDBowuMP8c36k7/Y1d1J+voZGiqwDAGyrFpAtmURE03P+Wr/kCsabRECQaKPyw5lrjmciZUUOo7vbmKuqPPp3oDLxA5WSUisrJ4NP7bMTfisaaH5HzFcw0snfnKUa7H0B70MRQftjf2fGZALCanZl2YYR2RiwusAfIfXP34tGmV6O8IKeo9SwewjB3vh5zRnKkeeHd9SLDhnvZU6naS8VWkHnmlF9vqwUabzzeQ7XBSBfnB7mzDVBf1QV2SL0dRH0GPVzSWnhtiqg83ziOYyWa7WbNUzlmXmkB6F3kV4y7DWN8tNO7MrzbbAYyeBPg2exEW0j7LiOa4+apjqnIognmV+D44mrBGjS9Mbm8lUTDfDdgSBop7B3YmG7ADxQZ0BYulNvvFzQPOE+tLP2EajQafUBLajgW2zbq5QdKleqMQq2Z885wax1ptlzt17KhK95mcTMGITiiE1gKM6Qp8WC15m7rGI2mVl2YNqMv9o7LA8lUfDIkqYqMgBX3spPyvyP1keSrBFPUNnag9CU8MtMSY/leKXCQ0uk6OsSf2dMB5+gCJqt/OcKs93dk3LDg10pCyxGeQGLODJYGdT/mlA/V4uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(66556008)(2906002)(86362001)(66946007)(36756003)(66476007)(83380400001)(316002)(26005)(4001150100001)(956004)(2616005)(16576012)(8936002)(110136005)(5660300002)(6636002)(508600001)(966005)(7416002)(186003)(31686004)(44832011)(38100700002)(8676002)(6486002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFl1eTFuZG9UVWdUM2ljSVF2eVNJWmFYN3JqNm9sa0RRd3k2d1ZESHNabmpJ?=
 =?utf-8?B?NStodE1ZYTJPM3R6WEppY1BpZ3VnVklJVFZESytma1p2dWRGV2swd3RCMEIw?=
 =?utf-8?B?UldWVTlMSDdScnlwT2ZWK3Y2K1hkT1NKcmhEMW5CU2drUzhYZit0dGhaL2J3?=
 =?utf-8?B?SGx3VTFyQks0Y3diRWNGM1ZFSTdkbks1SWVSK0lkdmhDV1dDZUtkSVB4YnJL?=
 =?utf-8?B?V2NTMEFMa1lDTTZLK1FZOXJOdlN2UjVtQlVJdmFFT2tFYnhBNFUrSjgzSU92?=
 =?utf-8?B?ZGdlNnBETldFdUJpN28vSmNLbDBiSlRVTUVVZGZsZE9mWk1KdXhzMnpyaXlt?=
 =?utf-8?B?a1ZyQlljN1o3aGFuK0lkKzJ1c08yKzZJQUJscGJFQU9JS0FqSGx4TnpQcUs4?=
 =?utf-8?B?NkgrM0l3eTNVMWJwL1ZMSzNYVktHdm50TE9wZGFIeC9qNFRSdklaRWRwbFFQ?=
 =?utf-8?B?THlDU0FJT3B6VmVGUkYzM1R2Z0pleXhPK1VtUE5XcXpGK3NBbnd5U01ETzJX?=
 =?utf-8?B?T3hXL1lDdzV0SllEMUk4U1hBUkpmVkplazV5RDFYckFzTVVIOGJ0cmpOZ01S?=
 =?utf-8?B?alpxNlhKVGN5MHRpR2lPVkF6aWd4L084QmxOcVBuZG5GSC9sZGpWMnpPemp3?=
 =?utf-8?B?SW5HWkV4NmlQVkNOOHlaYmpseTlMUE8zeS92UThncEdKZkp4Zy9IeHBjWUlB?=
 =?utf-8?B?YzA2R2o0VTlCMWloQnNQRDZrVFBoYlNRamRremkwNktYVFpCZ0xyY1BjREl5?=
 =?utf-8?B?ZEU2NUZkU0ExVTBtQzJ5VWJLbXlmaWMxREVoNVJxWmNuTmJQdWRQYU8zbGVC?=
 =?utf-8?B?Yi9mNDZRSEtyYXlkVGkvSHU5U1Z5bnIrMjRDTVMremRMRlhqcURYWlNobGpn?=
 =?utf-8?B?SnlKejA4aEFjeGhVZkM1aGZWNUhHS1hFM1N4SWJ0R1hNM3J5V0V5cHRSc2ZB?=
 =?utf-8?B?RTVHcTF2eTlKMmFPbUhsTmtTT0RJc3BtZ0xyUzB5Y09zc2c3UnRkcno4QUps?=
 =?utf-8?B?VzZwaTk2Y0wyTHlWN1NrNmJ4TUVTa0I4N3huTDlOc0IzTHVwU0tEMDA1TVlo?=
 =?utf-8?B?cEU2TW5wWGZFUzhUODQ4bFllZkU1UjUwZ3BYZVB2S1crQlFCSWtKUjdDdWNl?=
 =?utf-8?B?UnI5NHVhUGVjSUNodW1Cb1kwSHM2L1VzZU5KMlZMLzRiNnByeCt6MjhiemF3?=
 =?utf-8?B?WDNPeEZqUXBWQUVtbENoc1IvNHpMK3lWUDJydHp0WXdqbkJnVVVFdUt0U1Vr?=
 =?utf-8?B?dUxtbko1SXMvTjE0WGc4Q205V1E3dXVnYWgvUzd6Vk1PZ2VqK3YvcFFHL091?=
 =?utf-8?B?WTdWTTBXaDdIOEY0Z1AyZlpLUlIxUlF1czhRdHk5eldJbFdtb3REYWY1UnJz?=
 =?utf-8?B?MkhBVm5DSldFd0IxOVZYRE1VVnAzSUlGaFZ0NUYzU1oxNGp4eGV2RzQ2UFBF?=
 =?utf-8?B?MEFoMVBNSDFpN1VWNTMwakNrZ0I2ajhqVXNqT2VwamJxVWk2d3p0aXhLUFVB?=
 =?utf-8?B?YnVTeHJBQ2hveXZEeWlkQ1ZiYXJVbGlVTkh6aDBIOVk2MmRzSTBjc0Z0VEtS?=
 =?utf-8?B?Vm5QWGd3VmdqTkVYSDE4RE9lVStuSjAwRjRjNHR3WEpVU1RudVhxZlFjQ0NO?=
 =?utf-8?B?YkhjWW5QMHNlMnhJUHBOeE82ODN0c296eDRKOHhIYmxjUjc0dXNJQmFkcUY5?=
 =?utf-8?B?UFZxNFdtZ3RjYWY3cFYwU3dsS09nKzR4SnlWbGdSTFgyVHlUZm9ZYzlXa2JL?=
 =?utf-8?B?NWxobWVnMFR1OStTc1dTalFldVlBc2NwT2szWjZ5RndVdHhXbWs3a0VtcjFX?=
 =?utf-8?B?N1czazN4VzcwV1dVU1FNSSsxSGpMN29DaG4vSWJLOFRubXNDbHBNUXR2ZjFC?=
 =?utf-8?B?dWxkeVNuNjhXUVpZQnB1NUdRTm9rVDBleHVWSERLc0xNR0NBUEN1d1loSTRL?=
 =?utf-8?B?czNsZWpXZVdmSWJoRlYzY0FvZmZ4R0pjZWcrSmxoa2VyWmJmRnU1bzQyakh0?=
 =?utf-8?B?STdtNHRIVEtkSGlUeTJuQS94ckxLMzV6VHdCb3NCc1h0YjZHM3RtRUtpcGMx?=
 =?utf-8?B?eGlVNzBnNnF4TUtlOGp0WVh6NzluOUpycXI1eGFweWlseE43ek9XdCtjcktU?=
 =?utf-8?B?TnhCS1dQVzZ4c1dEcko2Yzd3YWZGMU9GTUlZeU5ISDErZWxwYUo1M0RrM1N6?=
 =?utf-8?Q?ZEXWug6Phu5l57AfMWkmP00=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eba6858-f5a4-4e88-2167-08d9aac58784
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 18:59:20.9917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqRGmXZR6XO/6N/BMyBAy1FY/ZAAqKEe3nakbA7HsJXH/7/eRuRHweCbCl/kQVjox1EtALUgOc56dFNSZ4U1og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5368
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2021-11-18 um 1:53 a.m. schrieb Alistair Popple:
> On Tuesday, 16 November 2021 6:30:18 AM AEDT Alex Sierra wrote:
>> Device memory that is cache coherent from device and CPU point of view.
>> This is used on platforms that have an advanced system bus (like CAPI
>> or CXL). Any page of a process can be migrated to such memory. However,
>> no one should be allowed to pin such memory so that it can always be
>> evicted.
>>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>>  include/linux/memremap.h |  8 ++++++++
>>  include/linux/mm.h       |  9 +++++++++
>>  mm/memcontrol.c          |  6 +++---
>>  mm/memory-failure.c      |  6 +++++-
>>  mm/memremap.c            |  5 ++++-
>>  mm/migrate.c             | 21 +++++++++++++--------
>>  6 files changed, 42 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index c0e9d35889e8..ff4d398edf35 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -39,6 +39,13 @@ struct vmem_altmap {
>>   * A more complete discussion of unaddressable memory may be found in
>>   * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>   *
>> + * MEMORY_DEVICE_COHERENT:
>> + * Device memory that is cache coherent from device and CPU point of view. This
>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>> + * type. Any page of a process can be migrated to such memory. However no one
>> + * should be allowed to pin such memory so that it can always be evicted.
>> + *
>>   * MEMORY_DEVICE_FS_DAX:
>>   * Host memory that has similar access semantics as System RAM i.e. DMA
>>   * coherent and supports page pinning. In support of coordinating page
>> @@ -59,6 +66,7 @@ struct vmem_altmap {
>>  enum memory_type {
>>  	/* 0 is reserved to catch uninitialized type fields */
>>  	MEMORY_DEVICE_PRIVATE = 1,
>> +	MEMORY_DEVICE_COHERENT,
>>  	MEMORY_DEVICE_FS_DAX,
>>  	MEMORY_DEVICE_GENERIC,
>>  	MEMORY_DEVICE_PCI_P2PDMA,
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 73a52aba448f..d23b6ebd2177 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1162,6 +1162,7 @@ static inline bool page_is_devmap_managed(struct page *page)
>>  		return false;
>>  	switch (page->pgmap->type) {
>>  	case MEMORY_DEVICE_PRIVATE:
>> +	case MEMORY_DEVICE_COHERENT:
>>  	case MEMORY_DEVICE_FS_DAX:
>>  		return true;
>>  	default:
>> @@ -1191,6 +1192,14 @@ static inline bool is_device_private_page(const struct page *page)
>>  		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
>>  }
>>  
>> +static inline bool is_device_page(const struct page *page)
>> +{
>> +	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
>> +		is_zone_device_page(page) &&
>> +		(page->pgmap->type == MEMORY_DEVICE_PRIVATE ||
>> +		page->pgmap->type == MEMORY_DEVICE_COHERENT);
>> +}
>> +
>>  static inline bool is_pci_p2pdma_page(const struct page *page)
>>  {
>>  	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 6da5020a8656..e0275ebe1198 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@ -5695,8 +5695,8 @@ static int mem_cgroup_move_account(struct page *page,
>>   *   2(MC_TARGET_SWAP): if the swap entry corresponding to this pte is a
>>   *     target for charge migration. if @target is not NULL, the entry is stored
>>   *     in target->ent.
>> - *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_PRIVATE
>> - *     (so ZONE_DEVICE page and thus not on the lru).
>> + *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_COHERENT
>> + *     or MEMORY_DEVICE_PRIVATE (so ZONE_DEVICE page and thus not on the lru).
>>   *     For now we such page is charge like a regular page would be as for all
>>   *     intent and purposes it is just special memory taking the place of a
>>   *     regular page.
>> @@ -5730,7 +5730,7 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
>>  		 */
>>  		if (page_memcg(page) == mc.from) {
>>  			ret = MC_TARGET_PAGE;
>> -			if (is_device_private_page(page))
>> +			if (is_device_page(page))
>>  				ret = MC_TARGET_DEVICE;
>>  			if (target)
>>  				target->page = page;
>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>> index 3e6449f2102a..51b55fc5172c 100644
>> --- a/mm/memory-failure.c
>> +++ b/mm/memory-failure.c
>> @@ -1554,12 +1554,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
>>  		goto unlock;
>>  	}
>>  
>> -	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
>> +	switch (pgmap->type) {
>> +	case MEMORY_DEVICE_PRIVATE:
>> +	case MEMORY_DEVICE_COHERENT:
>>  		/*
>>  		 * TODO: Handle HMM pages which may need coordination
>>  		 * with device-side memory.
>>  		 */
>>  		goto unlock;
>> +	default:
>> +		break;
>>  	}
>>  
>>  	/*
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index ed593bf87109..94d6a1e01d42 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -44,6 +44,7 @@ EXPORT_SYMBOL(devmap_managed_key);
>>  static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
>>  {
>>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
>> +	    pgmap->type == MEMORY_DEVICE_COHERENT ||
>>  	    pgmap->type == MEMORY_DEVICE_FS_DAX)
>>  		static_branch_dec(&devmap_managed_key);
>>  }
>> @@ -51,6 +52,7 @@ static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
>>  static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
>>  {
>>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
>> +	    pgmap->type == MEMORY_DEVICE_COHERENT ||
>>  	    pgmap->type == MEMORY_DEVICE_FS_DAX)
>>  		static_branch_inc(&devmap_managed_key);
>>  }
>> @@ -328,6 +330,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>>  
>>  	switch (pgmap->type) {
>>  	case MEMORY_DEVICE_PRIVATE:
>> +	case MEMORY_DEVICE_COHERENT:
>>  		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
>>  			WARN(1, "Device private memory not supported\n");
>>  			return ERR_PTR(-EINVAL);
>> @@ -498,7 +501,7 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>  void free_devmap_managed_page(struct page *page)
>>  {
>>  	/* notify page idle for dax */
>> -	if (!is_device_private_page(page)) {
>> +	if (!is_device_page(page)) {
>>  		wake_up_var(&page->_refcount);
>>  		return;
>>  	}
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 1852d787e6ab..f74422a42192 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -362,7 +362,7 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
>>  	 * Device private pages have an extra refcount as they are
>>  	 * ZONE_DEVICE pages.
>>  	 */
>> -	expected_count += is_device_private_page(page);
>> +	expected_count += is_device_page(page);
>>  	if (mapping)
>>  		expected_count += thp_nr_pages(page) + page_has_private(page);
>>  
>> @@ -2503,7 +2503,7 @@ static bool migrate_vma_check_page(struct page *page)
>>  		 * FIXME proper solution is to rework migration_entry_wait() so
>>  		 * it does not need to take a reference on page.
>>  		 */
> Note that I have posted a patch to fix this - see
> https://lore.kernel.org/all/20211118020754.954425-1-apopple@nvidia.com/ This
> looks ok for now assuming coherent pages can never be pinned.
>
> However that raises a question - what happens when something calls
> get_user_pages() on a pfn pointing to a coherent device page? I can't see
> anything in this series that prevents pinning of coherent device pages, so we
> can't just assume they aren't pinned.

I agree. I think we need to depend on your patch to go in first.

I'm also wondering if we need to do something to prevent get_user_pages
from pinning device pages. And by "pin", I think migrate_vma_check_page
is not talking about FOLL_PIN, but any get_user_pages call. As far as I
can tell, there should be nothing fundamentally wrong with pinning
device pages for a short time. But I think we'll want to avoid
FOLL_LONGTERM because that would affect our memory manager's ability to
evict device memory.


>
> In the case of device-private pages this is enforced by the fact they never
> have present pte's, so any attempt to GUP them results in a fault. But if I'm
> understanding this series correctly that won't be the case for coherent device
> pages right?

Right.

Regards,
  Felix


>
>> -		return is_device_private_page(page);
>> +		return is_device_page(page);
>>  	}
>>  
>>  	/* For file back page */
>> @@ -2791,7 +2791,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
>>   *     handle_pte_fault()
>>   *       do_anonymous_page()
>>   * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
>> - * private page.
>> + * private or coherent page.
>>   */
>>  static void migrate_vma_insert_page(struct migrate_vma *migrate,
>>  				    unsigned long addr,
>> @@ -2867,10 +2867,15 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
>>  				swp_entry = make_readable_device_private_entry(
>>  							page_to_pfn(page));
>>  			entry = swp_entry_to_pte(swp_entry);
>> +		} else if (is_device_page(page)) {
> How about adding an explicit `is_device_coherent_page()` helper? It would make
> the test more explicit that this is expected to handle just coherent pages and
> I bet there will be future changes that need to differentiate between private
> and coherent pages anyway.
>
>> +			entry = pte_mkold(mk_pte(page,
>> +						 READ_ONCE(vma->vm_page_prot)));
>> +			if (vma->vm_flags & VM_WRITE)
>> +				entry = pte_mkwrite(pte_mkdirty(entry));
>>  		} else {
>>  			/*
>> -			 * For now we only support migrating to un-addressable
>> -			 * device memory.
>> +			 * We support migrating to private and coherent types
>> +			 * for device zone memory.
>>  			 */
>>  			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
>>  			goto abort;
>> @@ -2976,10 +2981,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>>  		mapping = page_mapping(page);
>>  
>>  		if (is_zone_device_page(newpage)) {
>> -			if (is_device_private_page(newpage)) {
>> +			if (is_device_page(newpage)) {
>>  				/*
>> -				 * For now only support private anonymous when
>> -				 * migrating to un-addressable device memory.
>> +				 * For now only support private and coherent
>> +				 * anonymous when migrating to device memory.
>>  				 */
>>  				if (mapping) {
>>  					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
>>
>
>
