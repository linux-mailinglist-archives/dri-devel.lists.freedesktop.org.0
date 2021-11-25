Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324AF45D305
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 03:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759D76E140;
	Thu, 25 Nov 2021 02:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C616E140;
 Thu, 25 Nov 2021 02:12:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kip1vggvGef2fc//9pIKYxLGT/fgQb85GWruPGfJuNxbNVFhIX2BD0PMbyXnsvUmmh5NsrcYC+z7TwbjWea4+NzpNAR2juYS0Y2yOcFttxq20m5J6gngZA94CwH5sSLeW2fzB6FluubFxrkyrO46f7sHbJLZriHmmOH4mNjXBN5nrPLFL8MxFGGuABEUBY1PQjmhUCOLYdxvcP1cZyyjrik+Dkpd+/nLDyLq7LzuE+0Zjd/nvriJ56lFSlxYAU/NBdtFZC9a5zYeEmCcAWWDPzD7XJdxOIEIdYfHJ7uf3xiZgZ0CqERmDlqunBMOFiO5oTJmVyQ9Favo45jtknbDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6niT0qPzdZTVauqM89nm+f283p33YioZQX0WIs4Gjo=;
 b=EzK/fWCk3Lwj7Ut0krVcOg5yfOvIxLFcs+pSSJwBeq72tJQAavLHraywS8w1btCQSsyft609i8NsNrb0XNWdCTY3iS93zERdNyKgY/7bUmgdRej5qU0G2/5OToqL9wDN1nhnjtQ7u2mNnvTHv2fjcv/rI7jzfdu/eeNtyBTwJ/QF9ITdv/EeyDsaW1ltdE7lyVhHuWOqmHpxcYBAS0PDx8pIjAh/rnl1Yh+OmQvOotaRWoLnGEdSDfSJPyDI9gauC5OHHk7klmxyS+2tWSZrVBC81sJ34Uh5RSpN7oc20JldDuKXQecCmRAvCoKEfVhCsULRPJeiBOxU5pSmn7twnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6niT0qPzdZTVauqM89nm+f283p33YioZQX0WIs4Gjo=;
 b=0VsHqWKwrH+5tKzLP244Dn5sLctXxXK99quk4V5vmmEW0jC+YO4L57tSEBSHniBBpG4TiCq9SVw+IhN+jlp/sSEr/XhdSJ79L4S4Wmk3iNZ/CkTToEUDgRoCY/wDlzalTK+W4a/Hy/krXrCP4P35v7ArYuf9islx16jQ4fkr2Wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5035.namprd12.prod.outlook.com (2603:10b6:408:134::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.25; Thu, 25 Nov
 2021 02:12:51 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%8]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 02:12:51 +0000
Subject: Re: [PATCH v1 7/9] lib: add support for device coherent type in
 test_hmm
To: Alex Sierra <alex.sierra@amd.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
References: <20211115193026.27568-1-alex.sierra@amd.com>
 <20211115193026.27568-8-alex.sierra@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <f75cda76-6095-de98-0cc8-4d9130a4c97b@amd.com>
Date: Wed, 24 Nov 2021 21:12:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211115193026.27568-8-alex.sierra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::35) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YT3PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:82::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Thu, 25 Nov 2021 02:12:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db050b76-4c09-4e99-31fe-08d9afb91578
X-MS-TrafficTypeDiagnostic: BN9PR12MB5035:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5035C351A69C46E3CC570EB992629@BN9PR12MB5035.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIDPxOZUVlQnF4pL5+zmC4lrZi5Um6iE7zdHhO6g4VKhXD+cBqfmGybqYzCtdtyocA+oCZpF9IjI36ZJdY1fsnmqfk+29Bd8zmjSTByHCfryGYNcn5eeV83l/mNl+EREKKUqbZNBP8eQyw5ekJg+/ZqgDCQNxYriOQdOQII4S5Up3wfYASzpzCT0EhExQq2GiVURGoin7fwRGmcyChAC96+MctMLmrutxVN8z5BObBawtDLWn+2bSR8O4td7meTxsbr6Ox3rwgCf8/NIt3jXxLuJDNp744mSEms9ICCFf+fls2lgZAk5GiwYbpD32nBGRCV2oA3HkotA+ai6hhTbg+C+8tepczrsq/q+g9qwsbPscfcp5VFxx7LWUCjvjWXgBJFwEHJMug55iNIPmMIsiLDouGFizFyC3AmT9yHC9Xhgj556LNFsIJ/CClYDbaEMksf/G7eRe7SNhTKkn+h7I4RrZ6fwYvy3VfFQKNOijAcPreGL3MKvxylnnyWjqSM11033X8FQseYImkCDr8zZ46ObBTMldOEA08LIRPTQkqS9uyg6ahSGpz21SkOrLkT+zWxBda+lXZm15LCwroNTG8MEdIzoP5ph3v2iAwW647kh22VHGbLvd2Z+S/k/ULIufLdbYxeMcC2VUL49yNggPW7ExOGdZqf6M3jTJqEtqAm5ELRWVdAsv1FXFeESPbepYBfrRwaUsp2bY4Vd3Zm9m87F+yFc+G9T3HGH5kBdqT4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(8676002)(16576012)(26005)(6666004)(86362001)(7416002)(2616005)(30864003)(83380400001)(31696002)(316002)(508600001)(31686004)(66556008)(8936002)(4326008)(956004)(66476007)(6486002)(66946007)(36756003)(38100700002)(4001150100001)(186003)(5660300002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmNlZEcrQnpEZ21NTFAzSExXLzZvNWlHU1JkOVhjaEpQM0NVSVJXSVBQQ2Rx?=
 =?utf-8?B?V3RJNzR6RzJldjlGaHRlOFB5WWVsbCtwczBYOG5ObFF2a0VLYU16eFk5VnAv?=
 =?utf-8?B?YUlMaTFwQVp4bTJibWVkNk9UcXcxMmFIQUZhTXhjK3FEZjh3L2Jrb1lFbUw2?=
 =?utf-8?B?NnN5SFlEeUgxUkRLem41dytHOHpYVG01dWFudTNyTWVnSFB1aE13Si9qYjdN?=
 =?utf-8?B?UnFQZ2VCUlk3VktWRGRwQURtWURpOEY3TFV1TzFxVXJHaVhBcXpRZjRkY3NI?=
 =?utf-8?B?QU5jZ2tZNTdNYU5DQ1MvK3hCZ3NsYWxIdXRPbks0clpOTGVNaGRuZmw5OUJ1?=
 =?utf-8?B?Q3FKZ3liTWxKd3ByUHZNVzFuNFdETFpVVzhyOW4wNGlSdDhHVWRKYjQvL25Z?=
 =?utf-8?B?MDl0a2JyeHgwNHNwVzRoODV4dWJ2MVBmQ1FIWTFwTmQ4bVNIRkxSUHlCL1RE?=
 =?utf-8?B?MWF3S2FIVm1BT1RGZDBQRzJIb0hZSFA4NWF2Z2EzWDNyZEpJb0VubmVPamI4?=
 =?utf-8?B?VWY4WFlydWJCOThoajdTYkt4ZCtVVFFITEQvZVp4LzRLTGRFdGdrbE82eWJF?=
 =?utf-8?B?NXZVYWVwTm9TYzVFRGFPd0pUODRJcWp1UDVieS9nZC82T2g1RW9HQnhoVkVU?=
 =?utf-8?B?b21iR3BDMDFNRnlrVWVNL0kvR2Y0ZFZuZ1UrUVNYLzEzaTZMeWx5dFVsUys2?=
 =?utf-8?B?dEdaM0RWRUNLNFpTK05keVkrVFVqL0lYNkp6V1o1UWlSWjJWV0RCRXh3U0FJ?=
 =?utf-8?B?aFFPdUpIQytNdzBucVhCVjBHWlg2clZXTVpycmxpaVlVTzhMTUV3c3JMV01h?=
 =?utf-8?B?aWo5czdrd3YwRy81M2FKUm5tZkhRTWNHR1BUTmxRQS9Ma0hwcE1BeHd2SXNu?=
 =?utf-8?B?Y3BwaU41WEx0ODIzZnczUjRiTjdWMWdla1pHZm41RWZ2cW9CQ3JNSlRWTm9y?=
 =?utf-8?B?aCtVT05iUW01K1ZpVW5VcGYwWWFkcVVhcnkxR3RKdDJIMEtkc0VtLzBtTlA4?=
 =?utf-8?B?OWx6MmM1ZE9ROWlTV2FSby8zZ3J1Ri9Mck1aN0Y2TTRrOEZJaXh2OElPRHBR?=
 =?utf-8?B?bVU1MGxENVdvSTlUbFlPeWhPYkpqWU5ZV2xpY0JnZHFyRU83SExROW5aOC9y?=
 =?utf-8?B?MVd1MXgyMHlsbkdOMkl4Y24xYUhWOHpKM25HZTNxd0gwVUI1N3kvWjRQWTA4?=
 =?utf-8?B?dUVlaG5OQ1NvUjZtRkc0aG8xTnAxTWZIOEJtNFJ3OGNzNENTeGVQeENtSFM2?=
 =?utf-8?B?b2lHUUIrZW5IME1MZ1ZNQW1LQTgwWEdLQzRFMUFlcU5lbm9Fc2haZnFoMEph?=
 =?utf-8?B?MnBaWi9rUUh6TW82UmNzb1ZKWHlPMDVTS2l1ZG5oUG9pT2xKR0p5TjlPcUc2?=
 =?utf-8?B?cXBKTG50d3RsU3E2Q0g5c1kvUDhsY01hYlRtUkIyOC92MkUrc3NEWSs2NlJZ?=
 =?utf-8?B?amh5VlpQU1VsSXE2RmU0SnQ4M1diQkJpdkx0dmthclA2MTZoNEdaSCsxdFlz?=
 =?utf-8?B?c1BLcVBUenNEUVltYXl3VFdDdUR2aklJN3Ayc2draGtaa09hQnMrTjh4Z28x?=
 =?utf-8?B?ZTdkc0R5MzUvR0VTWUV2Qy95aS8vMVRFdVV2blBGbjlmWERXVWNzZCs1d0pT?=
 =?utf-8?B?bG0yZXlhTFp4anUrNzltUG9aN2RPTUpoT3prM1RiWUVNSk1QeDJCRjJiOTFt?=
 =?utf-8?B?emt2SHkrbS9INlVzZTFmQ1RFTVYvMk1na00vZEx2Zzh5TzBqSmR2L2xYOEhB?=
 =?utf-8?B?YjJHQ05rb3NiL1FKZDRONlZiclFoTnJrK3Y2T3ExeVV3bjQ5MDBxVTFZem95?=
 =?utf-8?B?dERjWVd1NzdCMnhwRlg1WERHRC94bXRwME5BeCtlVHVrUmNJWkdlbkwxOG9o?=
 =?utf-8?B?WFBkWnVocG9SRjJrWXB5REZPNFVmQTlNS0kvWXp4azFFV0x1R1FvQUV0YXMy?=
 =?utf-8?B?NWtYZm9tdnA0c0ZTY0k3UVYxSTFjL2ErSlZIK2NMbmxYVzNjdlliRW9GNUZK?=
 =?utf-8?B?TjJkYXRId1NTQzcrWTI0MUlndEpROUZQREt4YzIxUU9xeGhKbTgzSU5pcTBt?=
 =?utf-8?B?K2hvTmxudlFwVEhFR09HZm1IRWlOYWZhYXRhb3RTSm1RUUwvdDFXN1plcEl5?=
 =?utf-8?B?eERHVUljUlM5YlF5cWJCUHNFT2FFdmhYWUhEK0UrOU9ONSs2ODZWL2RpVFRH?=
 =?utf-8?Q?e4FqO5VlP4sDLmTVGqD//JM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db050b76-4c09-4e99-31fe-08d9afb91578
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 02:12:51.5148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMDM9dlfuzTeGSBLiAX2RHszRAzlBYjATmJP7w8XpzVoFK7tzprOuhbjbTwkWtzFgkxTo0optoethSp87zBUyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5035
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

Am 2021-11-15 um 2:30 p.m. schrieb Alex Sierra:
> Device Coherent type uses device memory that is coherently accesible by
> the CPU. This could be shown as SP (special purpose) memory range
> at the BIOS-e820 memory enumeration. If no SP memory is supported in
> system, this could be faked by setting CONFIG_EFI_FAKE_MEMMAP.
>
> Currently, test_hmm only supports two different SP ranges of at least
> 256MB size. This could be specified in the kernel parameter variable
> efi_fake_mem. Ex. Two SP ranges of 1GB starting at 0x100000000 &
> 0x140000000 physical address. Ex.
> efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  lib/test_hmm.c      | 191 +++++++++++++++++++++++++++++++++-----------
>  lib/test_hmm_uapi.h |  15 ++--
>  2 files changed, 153 insertions(+), 53 deletions(-)
>
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 45334df28d7b..9e2cc0cd4412 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -471,6 +471,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  	unsigned long pfn_first;
>  	unsigned long pfn_last;
>  	void *ptr;
> +	int ret = -ENOMEM;
>  
>  	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
>  	if (!devmem)
> @@ -553,7 +554,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  	}
>  	spin_unlock(&mdevice->lock);
>  
> -	return true;
> +	return 0;

You're changing the meaning of the return value, but you're not updating
the callers. I think at least dmirror_devmem_alloc_page will be broken
by this change.


>  
>  err_release:
>  	mutex_unlock(&mdevice->devmem_lock);
> @@ -562,7 +563,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  err_devmem:
>  	kfree(devmem);
>  
> -	return false;
> +	return ret;
>  }
>  
>  static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
> @@ -571,8 +572,10 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>  	struct page *rpage;
>  
>  	/*
> -	 * This is a fake device so we alloc real system memory to store
> -	 * our device memory.
> +	 * For ZONE_DEVICE private type, this is a fake device so we alloc real
> +	 * system memory to store our device memory.
> +	 * For ZONE_DEVICE coherent type we use the actual dpage to store the data
> +	 * and ignore rpage.
>  	 */
>  	rpage = alloc_page(GFP_HIGHUSER);
>  	if (!rpage)
> @@ -623,12 +626,17 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  		 * unallocated pte_none() or read-only zero page.
>  		 */
>  		spage = migrate_pfn_to_page(*src);
> +		if (spage && is_zone_device_page(spage))
> +			pr_err("page already in device spage pfn: 0x%lx\n",
> +				page_to_pfn(spage));
> +		WARN_ON(spage && is_zone_device_page(spage));
You can write WARN_ON inside the if-condition:

	if (WARN_ON(spage && is_zone_device_page(spage))
		...

But I don't see why you need both pr_err and WARN_ON. You can add a
custom message by using WARN instead of WARN_ON:

	WARN(spage && is_zone_device_page(spage),
	     "page already in device spage pfn: 0x%lx\n",
	     page_to_pfn(spage));


>  
>  		dpage = dmirror_devmem_alloc_page(mdevice);
>  		if (!dpage)
>  			continue;
>  
> -		rpage = dpage->zone_device_data;
> +		rpage = is_device_private_page(dpage) ? dpage->zone_device_data :
> +							dpage;
>  		if (spage)
>  			copy_highpage(rpage, spage);
>  		else
> @@ -640,8 +648,11 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  		 * the simulated device memory and that page holds the pointer
>  		 * to the mirror.
>  		 */
> +		rpage = dpage->zone_device_data;
>  		rpage->zone_device_data = dmirror;
>  
> +		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
> +			 page_to_pfn(spage), page_to_pfn(dpage));
>  		*dst = migrate_pfn(page_to_pfn(dpage)) |
>  			    MIGRATE_PFN_LOCKED;
>  		if ((*src & MIGRATE_PFN_WRITE) ||
> @@ -721,10 +732,13 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
>  			continue;
>  
>  		/*
> -		 * Store the page that holds the data so the page table
> -		 * doesn't have to deal with ZONE_DEVICE private pages.
> +		 * For ZONE_DEVICE private pages we store the page that
> +		 * holds the data so the page table doesn't have to deal it.
> +		 * For ZONE_DEVICE coherent pages we store the actual page, since
> +		 * the CPU has coherent access to the page.
>  		 */

I find this explanation confusing. The comment in
dmirror_devmem_alloc_page is much clearer. I think all we need here is
that dpage->zone_device_data points to the backing page for
device_private pages. Device_coherent struct pages don't have a backing
page because they represent a real CPU-accessible page already.


> -		entry = dpage->zone_device_data;
> +		entry = is_device_private_page(dpage) ? dpage->zone_device_data :
> +							dpage;

I see this in a few places. Maybe better to wrap that in a helper
function or macro. Something like this:

#define BACKING_PAGE(page) (is_device_private_page((page)) ? \
			    (page)->zone_device_data : (page))


>  		if (*dst & MIGRATE_PFN_WRITE)
>  			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
>  		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
> @@ -804,8 +818,110 @@ static int dmirror_exclusive(struct dmirror *dmirror,
>  	return ret;
>  }
>  
> -static int dmirror_migrate(struct dmirror *dmirror,
> -			   struct hmm_dmirror_cmd *cmd)
> +static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
> +						      struct dmirror *dmirror)
> +{
> +	const unsigned long *src = args->src;
> +	unsigned long *dst = args->dst;
> +	unsigned long start = args->start;
> +	unsigned long end = args->end;
> +	unsigned long addr;
> +
> +	for (addr = start; addr < end; addr += PAGE_SIZE,
> +				       src++, dst++) {
> +		struct page *dpage, *spage;
> +
> +		spage = migrate_pfn_to_page(*src);
> +		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		WARN_ON(!is_device_page(spage));
> +		spage = is_device_private_page(spage) ? spage->zone_device_data :
> +							spage;
> +		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
> +		if (!dpage)
> +			continue;
> +		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
> +			 page_to_pfn(spage), page_to_pfn(dpage));
> +
> +		lock_page(dpage);
> +		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
> +		copy_highpage(dpage, spage);
> +		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +		if (*src & MIGRATE_PFN_WRITE)
> +			*dst |= MIGRATE_PFN_WRITE;
> +	}
> +	return 0;
> +}
> +
> +static int dmirror_migrate_to_system(struct dmirror *dmirror,
> +				     struct hmm_dmirror_cmd *cmd)
> +{
> +	unsigned long start, end, addr;
> +	unsigned long size = cmd->npages << PAGE_SHIFT;
> +	struct mm_struct *mm = dmirror->notifier.mm;
> +	struct vm_area_struct *vma;
> +	unsigned long src_pfns[64];
> +	unsigned long dst_pfns[64];
> +	struct migrate_vma args;
> +	unsigned long next;
> +	int ret;
> +
> +	start = cmd->addr;
> +	end = start + size;
> +	if (end < start)
> +		return -EINVAL;
> +
> +	/* Since the mm is for the mirrored process, get a reference first. */
> +	if (!mmget_not_zero(mm))
> +		return -EINVAL;
> +
> +	mmap_read_lock(mm);
> +	for (addr = start; addr < end; addr = next) {
> +		vma = find_vma(mm, addr);
> +		if (!vma || addr < vma->vm_start ||
> +		    !(vma->vm_flags & VM_READ)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
> +		if (next > vma->vm_end)
> +			next = vma->vm_end;
> +
> +		args.vma = vma;
> +		args.src = src_pfns;
> +		args.dst = dst_pfns;
> +		args.start = addr;
> +		args.end = next;
> +		args.pgmap_owner = dmirror->mdevice;
> +		args.flags = (dmirror->mdevice->zone_device_type ==
> +			      HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ?
> +			      MIGRATE_VMA_SELECT_DEVICE_PRIVATE :
> +			      MIGRATE_VMA_SELECT_DEVICE_COHERENT;
> +
> +		ret = migrate_vma_setup(&args);
> +		if (ret)
> +			goto out;
> +
> +		pr_debug("Migrating from device mem to sys mem\n");
> +		dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
> +
> +		migrate_vma_pages(&args);
> +		migrate_vma_finalize(&args);
> +	}
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return ret;
> +
> +out:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +	return ret;
> +}
> +
> +static int dmirror_migrate_to_device(struct dmirror *dmirror,
> +				struct hmm_dmirror_cmd *cmd)
>  {
>  	unsigned long start, end, addr;
>  	unsigned long size = cmd->npages << PAGE_SHIFT;
> @@ -849,6 +965,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
>  		if (ret)
>  			goto out;
>  
> +		pr_debug("Migrating from sys mem to device mem\n");
>  		dmirror_migrate_alloc_and_copy(&args, dmirror);
>  		migrate_vma_pages(&args);
>  		dmirror_migrate_finalize_and_map(&args, dmirror);
> @@ -857,7 +974,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
>  	mmap_read_unlock(mm);
>  	mmput(mm);
>  
> -	/* Return the migrated data for verification. */
> +	/* Return the migrated data for verification. only for pages in device zone */
>  	ret = dmirror_bounce_init(&bounce, start, size);
>  	if (ret)
>  		return ret;
> @@ -894,9 +1011,15 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
>  	}
>  
>  	page = hmm_pfn_to_page(entry);
> -	if (is_device_private_page(page)) {
> -		/* Is the page migrated to this device or some other? */
> -		if (dmirror->mdevice == dmirror_page_to_device(page))
> +	if (is_device_page(page)) {
> +		/* Is page ZONE_DEVICE coherent? */
> +		if (!is_device_private_page(page))
> +			*perm = HMM_DMIRROR_PROT_DEV_COHERENT;

Does it make sense to distinguish between DEV_COHERENT_LOCAL and
DEV_COHERENT_REMOTE as well?


> +		/*
> +		 * Is page ZONE_DEVICE private migrated to
> +		 * this device or some other?
> +		 */
> +		else if (dmirror->mdevice == dmirror_page_to_device(page))
>  			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
>  		else
>  			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
> @@ -1096,8 +1219,12 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
>  		ret = dmirror_write(dmirror, &cmd);
>  		break;
>  
> -	case HMM_DMIRROR_MIGRATE:
> -		ret = dmirror_migrate(dmirror, &cmd);
> +	case HMM_DMIRROR_MIGRATE_TO_DEV:
> +		ret = dmirror_migrate_to_device(dmirror, &cmd);
> +		break;
> +
> +	case HMM_DMIRROR_MIGRATE_TO_SYS:
> +		ret = dmirror_migrate_to_system(dmirror, &cmd);
>  		break;
>  
>  	case HMM_DMIRROR_EXCLUSIVE:
> @@ -1152,38 +1279,6 @@ static void dmirror_devmem_free(struct page *page)
>  	spin_unlock(&mdevice->lock);
>  }
>  
> -static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
> -						      struct dmirror *dmirror)
> -{
> -	const unsigned long *src = args->src;
> -	unsigned long *dst = args->dst;
> -	unsigned long start = args->start;
> -	unsigned long end = args->end;
> -	unsigned long addr;
> -
> -	for (addr = start; addr < end; addr += PAGE_SIZE,
> -				       src++, dst++) {
> -		struct page *dpage, *spage;
> -
> -		spage = migrate_pfn_to_page(*src);
> -		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
> -			continue;
> -		spage = spage->zone_device_data;
> -
> -		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
> -		if (!dpage)
> -			continue;
> -
> -		lock_page(dpage);
> -		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
> -		copy_highpage(dpage, spage);
> -		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> -		if (*src & MIGRATE_PFN_WRITE)
> -			*dst |= MIGRATE_PFN_WRITE;
> -	}
> -	return 0;
> -}
> -
>  static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  {
>  	struct migrate_vma args;
> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
> index 77f81e6314eb..af15c35a90f4 100644
> --- a/lib/test_hmm_uapi.h
> +++ b/lib/test_hmm_uapi.h
> @@ -19,6 +19,7 @@
>   * @npages: (in) number of pages to read/write
>   * @cpages: (out) number of pages copied
>   * @faults: (out) number of device page faults seen
> + * @zone_device_type: (out) zone device memory type
>   */
>  struct hmm_dmirror_cmd {
>  	__u64		addr;
> @@ -32,11 +33,12 @@ struct hmm_dmirror_cmd {
>  /* Expose the address space of the calling process through hmm device file */
>  #define HMM_DMIRROR_READ		_IOWR('H', 0x00, struct hmm_dmirror_cmd)
>  #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_MIGRATE_TO_DEV	_IOWR('H', 0x02, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_MIGRATE_TO_SYS	_IOWR('H', 0x03, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x07, struct hmm_dmirror_cmd)
>  
>  /*
>   * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
> @@ -51,6 +53,8 @@ struct hmm_dmirror_cmd {
>   *					device the ioctl() is made
>   * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
>   *					other device
> + * HMM_DMIRROR_PROT_DEV_COHERENT: Migrate device coherent page on the device
> + *				  the ioctl() is made
>   */
>  enum {
>  	HMM_DMIRROR_PROT_ERROR			= 0xFF,
> @@ -62,6 +66,7 @@ enum {
>  	HMM_DMIRROR_PROT_ZERO			= 0x10,
>  	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
>  	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
> +	HMM_DMIRROR_PROT_DEV_COHERENT           = 0x40,

Does it make sense to distinguish between DEV_COHERENT_LOCAL and
DEV_COHERENT_REMOTE as well?

Regards,
  Felix


>  };
>  
>  enum {
