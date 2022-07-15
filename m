Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE468576EA8
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E8910EECC;
	Sat, 16 Jul 2022 14:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525BE1133F3;
 Fri, 15 Jul 2022 14:27:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgzrwsvA1Uu4cW6q2JS9CkfZktaB2TwdO623MFwIPqLlTXi/rjEEF1ed5VZrI4cxVh0khtPsuazucsYdd1pinLHqzf9qHYHXKyh3NCqgfrGviEamIVEEoRhsVBfn2NBWCCE++lhPQ7AOe6N/HtfoocSMDZYVVgIZD+GjDIH8J8WrmgjkdHhnvcudczafDmLVwyAD5zup5liC2qEWm0H6i7BP45+2hmXTZy6P2WFeiSTWCMLfDXT9OMS9KTM1wCY2w05Yw3uOPyDsqultBD9JpC5kuGLWV6a1I70gEgF2O6Sr1HHqRCZl6JESYaTHKek5G02esTuBIJg8HqwAxXavvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d6WZzKQQdvxCUVPAGjVdiWbjd6rQoADr04cbPc5maU=;
 b=O1hA1nh5SUXCPKuEtvLskUc6feJ97GlmIOcex5tEDDwiKNPc6/K/sPG0HGzwoz7Ls3+v+gTD9KxYoCuEMQTAg44QcBysoUtL19wPKdraWRQjPLzehDZ+ynF3dPZyjUsflreDKICTn6F1GVUFVylKtPy2iIUYBhZZyoC6TpE2GmMprIR6saU5lvXcYOwInxSPFHLVnHIETeqbij+8z3xM0BZQMDgrYznHKfod9RQ0dOmuFGvuIHSibW8s1qja2HISH9hyfZSUCmelBgLaIAezrHhL0qvqZK5pvgOy3J7GYnoENxS0Iim0OhQbgWee76qb21tE5vSxB6gaSHiuRBKrNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5d6WZzKQQdvxCUVPAGjVdiWbjd6rQoADr04cbPc5maU=;
 b=1jEWbJ90b/yXg9XlQP6lmnpxHEsrfTXgvKQKyso6LnhfF6dbwcpHiqjm+juRaVLKZlSOt+oyVWU+NDSobdYy92S3NeB5oMs58cGIELZ8U2Ow2dobCrahXdOgrqrVoeEaV+SAw/wxeFCsv8mxQfMqvjGzdxjrg+6+7/7F6PYPxZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by SJ0PR12MB5610.namprd12.prod.outlook.com (2603:10b6:a03:423::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Fri, 15 Jul
 2022 14:13:03 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::406d:a54b:5cd4:9b4]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::406d:a54b:5cd4:9b4%2]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 14:13:03 +0000
Message-ID: <74dcaab4-7857-c181-44cf-f1c273843520@amd.com>
Date: Fri, 15 Jul 2022 09:12:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] mm/gup: migrate device coherent pages when pinning
 instead of failing
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>
References: <4b2f9a61-ca67-6a34-41c9-c191cac756b3@redhat.com>
 <20220715021109.2225886-1-apopple@nvidia.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <20220715021109.2225886-1-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0052.namprd16.prod.outlook.com
 (2603:10b6:208:234::21) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfffa335-9f42-4f1e-a3bc-08da666c2158
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5610:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dteG4ohwzMfyz/km7fXgb0HsPaRb/a//VnZUDLil9Kv7pw8N1MADNm8gnlhS5aDBkfS0NutkjlpdU+2bA4fNI5pvj4fxMgc/yXIligHYc0ZGoGzqqYf+88PVQggk6uT08zld3F0lEnFdfNdx1WmoK0d8XgmFAelJvRiK7FpTcf2BZeVyPnS3vCzCM5mdyUr6b9a/DkqAUDWOUZlsBYNWTD8lmLldwgxlQZM8DyX5LNFy59OQjIcbC8bKSzBIAQzyi19g1XpqBAQ/cvtWyyn752uMDNyE5me7WihoJ9rGZp9MkVxth2EDc7tFBQGmoX1Rgjy/1GK6a2WGTKz6IEQlL2kCI2+WkQzzYIPTX6F17KpWc98gf8lJ5LavpOA9XFkp14pAZKadxkCTVCWFXW4OC4D2M4pywAp4tf0XG/M4w4yoU3wRflyeZBXKsd9LxRI28ro1P5487Yr6H9zIfe2Ic03LfP0B+oYKm0aYzLN2bwzfhiWuct+Uim+SAf8J8dOwsS9oKTpYUDIL9QpFPlSW53dICBju9Sd8WiW6nCyiUjVGIj2+O7WGlC3rMw2k+07xEH1HjfpU1cab1nLDyQIrV+ep9up6MZc75b5mm5mQlaZSDzS8kBnxRqAhzfMe3j/0p8mBFdkut0KvgJVsffbswecQoTaGXInG6S8MpRmMhKUNVzVAq7H5MYNmb39yfhE5NOhdtrTWELfjYoIsNlDpev2fwmbYSW1rZ2/bR8CxYWBg/g4RsC5DARBJVHZGCaE/d46Xmp6UNBu508QPpR607vptY0mptvXHUNrSu7O7GgxWRJlN+b7Z3SIf8kuEEQ4M36dABeMaxc4RW7lOgbGqlUd9BY3AYsonsHnSXAZZ0X8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(7416002)(2906002)(5660300002)(316002)(66476007)(66946007)(8676002)(66556008)(31686004)(53546011)(6512007)(26005)(6916009)(478600001)(6486002)(8936002)(6666004)(186003)(6506007)(2616005)(41300700001)(31696002)(38100700002)(86362001)(83380400001)(4326008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUlQUFp1K2VYSys4OGo4QnN2alJsQ3B6WnFHWmpYWUVJbnhYYTNsaFBWRHpm?=
 =?utf-8?B?cmFwTS9Ydm5xb1hoL3hkUUpMUnpaYzdxU0syR2F5S1RoVE9DdTNhVWZEaGpy?=
 =?utf-8?B?c0Z4cUVEZTByNDhDd20wSnNWdWZ6TmdKT1ByQUYvZkZjMXZRRnpTVldoek14?=
 =?utf-8?B?MHBoUlZPTkNVby9KVHVNd2NoMVcrTjA5bDlETSt6Rk9GdWRYT2hJRUJyZk9s?=
 =?utf-8?B?eEw4SjZVRStsejgvMXlMQTFDMjZWQ2dIZ3RFZWttdVZyQnNCL08vZWxKeHc5?=
 =?utf-8?B?U2FPQVErZTZvRG94YThmbWIvWTBXRW5ibUtURlVxMnVoYjRWQzZ1LzhsN3lj?=
 =?utf-8?B?OEs0ZjYxOVZUMngwbUtsTWVVVVV4Skx1U0VwZURoWTdHY3VISXg5WlpsbzVQ?=
 =?utf-8?B?ZmcyQ1ZvYlN6aXVGZm45VHdjZm83VExxRUQ4YmlMeUJJWGhvR0l2UVpydUVv?=
 =?utf-8?B?NHZtRm1ma3dNeTlrWnhBK2haZzloN1JFQXFuUThhN25TcHdYbkVVWkNTd3Qr?=
 =?utf-8?B?N0F0SHVXWFJ2anc2cnAvTkE3WktGN0VKQUNVMnNKY0hFOHF6bHd3Nm15Nloy?=
 =?utf-8?B?cnpRSWpwcVpHQ2JNQTdSeVU2Y2RDU09Pd2x3VXhJTTRQM21McTRwbXUxTlNk?=
 =?utf-8?B?ZjI1UlpualM0VHJkTCsxZGIxWG1yc3QrZ25aQTBoUDczS1pSRzY4azUzMHFr?=
 =?utf-8?B?SEwyS3MvZElVRmlsM2xpNG0wTHQ2Q1FmbWUwazdsMTVCMUV1Wm9SakVwcjNF?=
 =?utf-8?B?UWFzT3oxMjlBTmU5bHJmNFNpK0ZuTy9OMEFKc0QzcDg5OEhjL3NOcGJtY1dv?=
 =?utf-8?B?WjNhTUFUTFVTUk5QUWlUbkpQbWJVRE1xYzBlS0ZoRmkwNXdVdmtqR3dtVGUr?=
 =?utf-8?B?OHNOWnMwb3JIWFZUTHZMUFA5c1NNWW5IbENDZHlZMHhTOXJDMW9vSFMzQlMx?=
 =?utf-8?B?VldhSGFDeTlablNJSkxDM1UyMjI3b3hPdmdwSFpBWE1udEN3eVlDYWpZTS9S?=
 =?utf-8?B?eFJwVWRQZmg4aXZIUDFrN0hJRGM2QnNjY1JMdkV1WHJzbFd3U0xraTQyMklP?=
 =?utf-8?B?aldYWUdSNDNtOWsya2FZcG1UVlRtSDBHbEEyNXRER0kyY2JQZkVGc2NDbGxC?=
 =?utf-8?B?clY3WDQrSkd6MGdFTnB4Sk1UOE9IU3M5eVpWK0lTcHNIZTNzTVFVMVVqbmFG?=
 =?utf-8?B?czdTZmZVRXd4RjZaQUpCdXh2YnE0SHFNVHpOR01LU2lkZThPT2grc1pEQXZC?=
 =?utf-8?B?Yjk1OU1OcmpHTUYwTkwreEp0Z3FMY2dxRElIVkxLbldCODArRnVRSjE3QnFj?=
 =?utf-8?B?Z2VsdG9JZUY4NWt6ZWpmZ0F5aDdnWXM5UmNaQy9GaHhRLzRHYUkwc0xlNVAw?=
 =?utf-8?B?VTlHbDlyUjRLS1RNczNIdHhoVU0zZ0kwbGZNekt1SittR2VmWmVMS3B2cGFq?=
 =?utf-8?B?M1AwSEhuZ28vdU9iSDJMKy9SWDZ6dVNLS01OUHIveUh0MmM1OWROWUl3ZXda?=
 =?utf-8?B?R0lMOVNyNHphZ2pxN1YrekFSQTl4b0d0NFptNzZ1Qi9GSHByWFJxVnNkUlcr?=
 =?utf-8?B?VHdjcjJUQUZycFdzeTA2bmJoUjY3S1FucmJXZS9JcFZsLzV4a2VoaE9XT1o4?=
 =?utf-8?B?NC9GL04zV0RURXpJL0l5cVFYYjllMXFUV0NTOE14V201ekRJQlpJcDdmd2Yw?=
 =?utf-8?B?TDVNd0diRXRCNWkwRlE4c0tBMVI1cTJUUVZwRzN0RnZ1QWNCdzRnTUF4MEtO?=
 =?utf-8?B?aEtVc0luQzAzMEJTM2RHeFltOS9SRWRxemRxN2lWaFF1TG9XNzYyVHJDNHBu?=
 =?utf-8?B?blFlVzVxbmhVWXZwWTArc1BNMyt1SmZUN3pHRjRGTTBTcmpZbVdBQTVzNWhx?=
 =?utf-8?B?RXRRQngraEp3SXh6bytaMEo5QmxMN1hLbXZUaEpYbVhGSHdPRFVMZU9QVFFw?=
 =?utf-8?B?QytaOGU1SmZQaERnNUlaNGgyQXNvMHpHOHVjc0tMR2VBN2UwVmRQRFVKQm93?=
 =?utf-8?B?MjZTY2NJa1RlQlB1TFpQUWppZDk0RHJha2FkR28wckhYUHhjRnFDZVB0SEV2?=
 =?utf-8?B?OEdJOUtMalBxSUZTSHN5YnpwbkFJM1ZneVVubHo0eHg1TFNoOGVROS9PUGJs?=
 =?utf-8?Q?C4TTch/PpGOSL62mpsHMzfnhK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfffa335-9f42-4f1e-a3bc-08da666c2158
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 14:13:03.0023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhUxWggwswgipSfw3oz+YAg6tNY5+0nB7II23dH5bdIE3b60yNeATe4PV5JI09TAPug6Tq5ezfN9um7kMWXHlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5610
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
Cc: rcampbell@nvidia.com, dri-devel@lists.freedesktop.org,
 Felix.Kuehling@amd.com, Matthew Wilcox <willy@infradead.org>,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 amd-gfx@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/14/2022 9:11 PM, Alistair Popple wrote:
> Currently any attempts to pin a device coherent page will fail. This is
> because device coherent pages need to be managed by a device driver, and
> pinning them would prevent a driver from migrating them off the device.
>
> However this is no reason to fail pinning of these pages. These are
> coherent and accessible from the CPU so can be migrated just like
> pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
> them first try migrating them out of ZONE_DEVICE.
>
> [hch: rebased to the split device memory checks,
>        moved migrate_device_page to migrate_device.c]
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>
> This patch hopefully addresses all of David's comments. It replaces both my "mm:
> remove the vma check in migrate_vma_setup()" and "mm/gup: migrate device
> coherent pages when pinning instead of failing" patches. I'm not sure what the
> best way of including this is, perhaps Alex can respin the series with this
> patch instead?

For sure Alistair. I'll include this in my next patch series version.

Thanks,
Alex Sierra

>
>   - Alistair
>
>   mm/gup.c            | 50 +++++++++++++++++++++++++++++++++++++------
>   mm/internal.h       |  1 +
>   mm/migrate_device.c | 52 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 96 insertions(+), 7 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index b65fe8bf5af4..22b97ab61cd9 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1881,7 +1881,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   	unsigned long isolation_error_count = 0, i;
>   	struct folio *prev_folio = NULL;
>   	LIST_HEAD(movable_page_list);
> -	bool drain_allow = true;
> +	bool drain_allow = true, coherent_pages = false;
>   	int ret = 0;
>   
>   	for (i = 0; i < nr_pages; i++) {
> @@ -1891,9 +1891,38 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   			continue;
>   		prev_folio = folio;
>   
> -		if (folio_is_longterm_pinnable(folio))
> +		/*
> +		 * Device coherent pages are managed by a driver and should not
> +		 * be pinned indefinitely as it prevents the driver moving the
> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
> +		 * to migrate the page out of device memory.
> +		 */
> +		if (folio_is_device_coherent(folio)) {
> +			/*
> +			 * We always want a new GUP lookup with device coherent
> +			 * pages.
> +			 */
> +			pages[i] = 0;
> +			coherent_pages = true;
> +
> +			/*
> +			 * Migration will fail if the page is pinned, so convert
> +			 * the pin on the source page to a normal reference.
> +			 */
> +			if (gup_flags & FOLL_PIN) {
> +				get_page(&folio->page);
> +				unpin_user_page(&folio->page);
> +			}
> +
> +			ret = migrate_device_coherent_page(&folio->page);
> +			if (ret)
> +				goto unpin_pages;
> +
>   			continue;
> +		}
>   
> +		if (folio_is_longterm_pinnable(folio))
> +			continue;
>   		/*
>   		 * Try to move out any movable page before pinning the range.
>   		 */
> @@ -1919,7 +1948,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   				    folio_nr_pages(folio));
>   	}
>   
> -	if (!list_empty(&movable_page_list) || isolation_error_count)
> +	if (!list_empty(&movable_page_list) || isolation_error_count
> +		|| coherent_pages)
>   		goto unpin_pages;
>   
>   	/*
> @@ -1929,10 +1959,16 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   	return nr_pages;
>   
>   unpin_pages:
> -	if (gup_flags & FOLL_PIN) {
> -		unpin_user_pages(pages, nr_pages);
> -	} else {
> -		for (i = 0; i < nr_pages; i++)
> +	/*
> +	 * pages[i] might be NULL if any device coherent pages were found.
> +	 */
> +	for (i = 0; i < nr_pages; i++) {
> +		if (!pages[i])
> +			continue;
> +
> +		if (gup_flags & FOLL_PIN)
> +			unpin_user_page(pages[i]);
> +		else
>   			put_page(pages[i]);
>   	}
>   
> diff --git a/mm/internal.h b/mm/internal.h
> index c0f8fbe0445b..899dab512c5a 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -853,6 +853,7 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
>   		      unsigned long addr, int page_nid, int *flags);
>   
>   void free_zone_device_page(struct page *page);
> +int migrate_device_coherent_page(struct page *page);
>   
>   /*
>    * mm/gup.c
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 18bc6483f63a..7feeb447e3b9 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -686,6 +686,12 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>   		}
>   
>   		if (!page) {
> +			/*
> +			 * The only time there is no vma is when called from
> +			 * migrate_device_coherent_page(). However this isn't
> +			 * called if the page could not be unmapped.
> +			 */
> +			VM_BUG_ON(!migrate->vma);
>   			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
>   				continue;
>   			if (!notified) {
> @@ -794,3 +800,49 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
>   	}
>   }
>   EXPORT_SYMBOL(migrate_vma_finalize);
> +
> +/*
> + * Migrate a device coherent page back to normal memory. The caller should have
> + * a reference on page which will be copied to the new page if migration is
> + * successful or dropped on failure.
> + */
> +int migrate_device_coherent_page(struct page *page)
> +{
> +	unsigned long src_pfn, dst_pfn = 0;
> +	struct migrate_vma args;
> +	struct page *dpage;
> +
> +	WARN_ON_ONCE(PageCompound(page));
> +
> +	lock_page(page);
> +	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
> +	args.src = &src_pfn;
> +	args.dst = &dst_pfn;
> +	args.cpages = 1;
> +	args.npages = 1;
> +	args.vma = NULL;
> +
> +	/*
> +	 * We don't have a VMA and don't need to walk the page tables to find
> +	 * the source page. So call migrate_vma_unmap() directly to unmap the
> +	 * page as migrate_vma_setup() will fail if args.vma == NULL.
> +	 */
> +	migrate_vma_unmap(&args);
> +	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
> +		return -EBUSY;
> +
> +	dpage = alloc_page(GFP_USER | __GFP_NOWARN);
> +	if (dpage) {
> +		lock_page(dpage);
> +		dst_pfn = migrate_pfn(page_to_pfn(dpage));
> +	}
> +
> +	migrate_vma_pages(&args);
> +	if (src_pfn & MIGRATE_PFN_MIGRATE)
> +		copy_highpage(dpage, page);
> +	migrate_vma_finalize(&args);
> +
> +	if (src_pfn & MIGRATE_PFN_MIGRATE)
> +		return 0;
> +	return -EBUSY;
> +}
