Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A0D3F778A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C6B6E237;
	Wed, 25 Aug 2021 14:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB4B6E237;
 Wed, 25 Aug 2021 14:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+zxrJk0M9+Tquygz/sgXbxgjiip4Wr0SKEdNlw7f4q5IzjvS7jc1Fc3NbQmM3Or9mrtEevgM6Og78j+6DHa6bU84eK35KzlkCbbJuZdQnXb5vEeJmzzOEabVhKhouRiXhzZbYeuIeK9hWaFWrbcWZOiotrrW7w0KG2OTlPalPijXfnPfg1Aximwkktf7GVMlqdvFi152Vj9kARfx0MvoyejjqFQ7FTf1sg/hLYuvtH3IhFdUM+Kj2kq5KI/muKCIHXCCDJ80+i4dgN88R7vfXV9NVurvuAFXlsGpYLerlOCdWr8lguUL3pwRuZawuKo2n6/QXOK/JK9mznQUSKmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7T19Sx3+hYt4ajzyqtoWhzzy8fY5AlRZ4NPBw8Cd/g=;
 b=gjDu3Qwfag+xJy9lEkb07MS82JMX1OjVzeLzz/YX+mTX3ClE2eASMDmU/monHeFgbOi6eSHh7ZlqTrzc9JS+8BftBm+8YTbHJ+e+GdZ2ZR1XvmDrs3/M1zndUw0yS9JNAa6JrnLqvw8epsKPWaan0JJQKJ464YGmzjdrQic4+Y3Og8YXmwm+eoepNXcCfm0ljbR/rPCET4I4aSprLOjcXvNKzApGiOIBwqHb5+98LuvGx0116m46+QrtfdUqT++mKotQ/9B8lKKzY/TgaZSWA7EjbStjpYggLwkgQnacTx8J4AcnkeygxvtXZmnbl1o/pE0ijYo1jhWc3XJHRIxAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7T19Sx3+hYt4ajzyqtoWhzzy8fY5AlRZ4NPBw8Cd/g=;
 b=IlwRk5M932zbofbLcwLSqg3wLCmrT6iIhn7JUVzCOuQ9sRz/marZjvdEooFNSYtNYbXSxRKvKy4JUmqqYwdDCcdjffzUGaUbOI2bCYFy82L2Pq2DAel3CjqgG13DEflyN0OmGnSJDgEGfoqmuBEkD4FUZT88RSf4L2lR+2whF0w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5116.namprd12.prod.outlook.com (2603:10b6:408:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 14:24:07 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 14:24:07 +0000
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
To: Alex Sierra <alex.sierra@amd.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-4-alex.sierra@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <fe3f234b-3998-da57-b141-6ea95070db6f@amd.com>
Date: Wed, 25 Aug 2021 10:24:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210825034828.12927-4-alex.sierra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::40) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 14:24:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 481e29ca-81ae-4a92-a5f3-08d967d3ffc5
X-MS-TrafficTypeDiagnostic: BN9PR12MB5116:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5116A6A35AD64F3DC8AF7EA092C69@BN9PR12MB5116.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5Z9A+I53zzJdrvITE7w7ZxTkj5BIZ1f/hYsst1bux9HC60kE5LOMgSLfPFuG/RH+S1sS6BS4grNQGVSS7hBx8isp4m2Nl2fRw7EH0UUtR7qrNdIWYYv7RQjSQJwO6EJiBzW5WVJCRWTU3XOME1DDycsAi3+Gcod+9jNkOn8APQAavwGWp8OM5AkPnI/pOpBCsglnPyhXEniDmzz63w/GC3hxTKETrXvKP9g10mPsSd+OMAl8E+cC6O76aXWbb/5hxGGKNWNATaZoVWUA1wWtXSzihObBv3a2ENluRGwUwnU5GkKYA0aznhaFLcQqOKRxW5CPoOajav/h7K1su+JvsfqLju/z1kxvllqDHOSQ07cHuMiLvdEgAtexWWWzRX87Z0CIfiKzD78u03EKklw7nKCm/i7vKbXHShFJ49173baqG2T3RmHbc58MrKQfKpzgpj2DUfcQZn0CeBbgvkFdcJMIgu1NTKH5gbC9urlSM84sFMgu4nCUTxELH9Wua0ZIiZoDukxWzBs0JDQNYgQ024loCA7ZgfD/T0YFK7OTQSHjiAMgWd2ZhmAP3huqqbR/l0kJ2qmqbtGgfTW+gCpJxrQb7McQgK0vlwxLJLD5TOny3mEU2LlntLYEFHQrscBfIiBe8RyZHHz8u583oQe60U9rQZGaw1+kFvDDND+f+SD0YXROg+fMWB4z1c+zuKkwDPZ9xvenf46tOU69WwYGqifdPRluvg1U+nAGWmhJII=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(31686004)(83380400001)(956004)(2616005)(86362001)(16576012)(7416002)(31696002)(5660300002)(8676002)(38100700002)(2906002)(66556008)(4326008)(66476007)(66946007)(36756003)(8936002)(26005)(316002)(44832011)(6486002)(478600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTByaXIyNkZhRkI5aVVSV2EwejdoeU56a3kwc3dIVEE3WFhhYysvRngrSzRy?=
 =?utf-8?B?M0pISUFPWWtOUDRvU0ZyeS9KRmZ1Vi9sR2tYZGROTHdPZlVyblpvOUtHZXZJ?=
 =?utf-8?B?YzJqaXZhdXNsYTAxUG9QYWJLbGRpa3dXRUQ4NUgreGpqa2NEekplclg2ak0y?=
 =?utf-8?B?bHUzajRMbG96VGorWVNRKzhNMkoxajU1cDNlS0p6RUtkOVBnWDhOLytvSkZi?=
 =?utf-8?B?cm5qUkJ1YllUaEVldVhHdU56K3NHVFFLOUtpTi9mNk44eTZEdHVUQ0RDVmxR?=
 =?utf-8?B?dXFaOGNkWGFmQXhncXY2dmVTY25DZTAzblFyVTcyeFNvRE0wZXczM0lwREJO?=
 =?utf-8?B?MzZEN0pxNVN6Y3VPZnoxWHNuUHJ1azhJdDFmVG03ckY2RzZ3QkNFZWpORktq?=
 =?utf-8?B?OFkrNEduWVpJcFZiWTY3K0JBVFVVOEZEY2ZMWVc3NUFUYmpXVGt6MnVVemlv?=
 =?utf-8?B?SVNrMEJXM2I5RlZRSnNZN0lDYkJFUHNQODhpeW5sa0p5V0poTkpUWXdKdVB0?=
 =?utf-8?B?cHBrMis0ZEV2SzdJSTdtTHRSb0IwRGFFV1ovRm9kVDU5amdPUTVnaCtUV2cw?=
 =?utf-8?B?TUE3MFJaRFN0a29GaTdJU3dwcVZTZ2FjTXpPMkwzYnFFaVdxandXaDh5eGQz?=
 =?utf-8?B?dTgxZVJtL29oRTY3cU1paUNNczNlL1c2cmJxYWF3ektvN0ZMcjlNb3VWQ3Jm?=
 =?utf-8?B?UE5oQVJFczhPZTFqb1VhV2RzUElEMG43WktiMngrcDN6UmVHOTJSNXZtWTcy?=
 =?utf-8?B?cGtvdlRPMmVHcjA1L0dmdmNQL01XcXZWTFROb1BzOHFUdVdSUjJ6Sk95WW80?=
 =?utf-8?B?M0JPV0tVZVNCcWZLbCt1K3E2Wk9QdGMvVVh2eENMNEFIdnc5dS9CNVFXSGRG?=
 =?utf-8?B?VnhOYmRVdkNCdW9qZUg2emxQM2RNQ0xSSzJpRmoycWp5eTFUT2Y3NGJYZkl0?=
 =?utf-8?B?OGZmN1BzLzB3bC91R2MzUTQ2UUpzLy9NZEcvelhDY3FVNC92Q04vMytMclpN?=
 =?utf-8?B?Z1J5dE43OHQzMHFEbDlDeWJEYmltVzR4VW8xdWtJdzBHSUEwOEpXUUFBRzZU?=
 =?utf-8?B?K2xnV2pHRDZUN2ZpcmVEWG9NbGQyVTBJZncrVGFObFpENy9CWmRvR0FoR2cw?=
 =?utf-8?B?NWlkdFpBb3R1QzlFK1BvbFR2SXdTQk1iSGVIL3pHaTE2SHd4L3VjWGJ6YUph?=
 =?utf-8?B?VEh2TzZteXBaZTBIVjZNNVY5M3JCd3dWZWRaS3pjaWdjNGZ3K3ZPcnh6T0pL?=
 =?utf-8?B?a1JqalZHMFlCWnNaU1NCd2RhdFBaOUl3TlZSSG1NNS9uTmJKYmZmNnRGWG5u?=
 =?utf-8?B?RUdyLzE2YnZYSzBnOTl6TS83Z2tSbG5nTTM0c0plN0t2S01nT09sWHZKQjNE?=
 =?utf-8?B?WEczYmRCdytteVdpVXQ5d0pVaHlNSWhPVWI0NWNaMFdhczJhY2Z0bzBSWjNY?=
 =?utf-8?B?YXdnR1h6S2RqZ3laT1pSWnVGdVgzRE1VR1VuTDQ4VFNMM3FieWdoc1ZPMW9I?=
 =?utf-8?B?ZkZwdU12MnNhRmpMSEQrNWRITmVVRmRNUjNxdW9Qd0k0U25xZDh1Q3pOalUz?=
 =?utf-8?B?eTRIa3ROYlVLcWErNGZpc3VYemVCVndCWU4wb21BNyt2eFNCeUM0RG8zNzBy?=
 =?utf-8?B?aXc5c3BjeThmV2hQSDR1MDZlQ2FkeEtjT1NlS2dGUGFENXovUjhscHkzWGlU?=
 =?utf-8?B?SmIwNWhQdW9TMHZQeVZjZzFmeUMrMUZrQ1lLNWhpeEI5RDM1Q1ZYQUpWeTJy?=
 =?utf-8?Q?pG3L72WeR0skwd261WDyf+bQlloZdspa4ecRu0A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481e29ca-81ae-4a92-a5f3-08d967d3ffc5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:24:07.7983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AKoE0CVoBREae21FQDVroaAANJAH2DihVYFeMkW4AvLMP5vCjQ/lHhTYGZyU0euLzP60b6rwzigI4+CmaAHSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5116
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

Am 2021-08-24 um 11:48 p.m. schrieb Alex Sierra:
> In this case, this is used to migrate pages from device memory, back to
> system memory. This particular device memory type should be accessible
> by the CPU, through IOMEM access. Typically, zone device public type
> memory falls into this category.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  include/linux/migrate.h | 1 +
>  mm/migrate.c            | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 4bb4e519e3f5..6b16f417384f 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -156,6 +156,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>  enum migrate_vma_direction {
>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
> +	MIGRATE_VMA_SELECT_IOMEM = 1 << 2,

How about calling this MIGRATE_VMA_SELECT_DEVICE_PUBLIC?


>  };
>  
>  struct migrate_vma {
> diff --git a/mm/migrate.c b/mm/migrate.c
> index e3a10e2a1bb3..d4ae2da99607 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2406,7 +2406,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			if (is_write_device_private_entry(entry))
>  				mpfn |= MIGRATE_PFN_WRITE;
>  		} else {
> -			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> +			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM) &&
> +			    !(migrate->flags & MIGRATE_VMA_SELECT_IOMEM))
>  				goto next;

For MIGRATE_VMA_SELECT_IOMEM/DEVICE_PUBLIC, I think we should ensure the
pages are ZONE_DEVICE and we should also check the page owner for
symmetry with DEVICE_PRIVATE.

Regards,
  Felix


>  			pfn = pte_pfn(pte);
>  			if (is_zero_pfn(pfn)) {
