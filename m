Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA31034F1A3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 21:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD68E6E95C;
	Tue, 30 Mar 2021 19:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA5E6E95B;
 Tue, 30 Mar 2021 19:32:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4mcptxhUrD5agO8aP1Ket9xR1Fb3XuYV76TCuyMEpx3x1XE0/w54Hht4mBhJQQNooAWmoAs4GFPMsqG2+Oqc1kX+vslCUWRFC3m+KU88VDFGTDCPeXWAZhkrO+r/rMsu3x7o0SckEpLEPCjMSvAz57ks1sMYplSPS4TEYSHe2uuGqTQfkwu5ph+q8k0ZO++53oMPtRXfovH1twIJXX3y1Kb/fjF8FCUE1fcr5CqpDsALfPz9zPhqwDgglGnIBbdox+gdV2o0xf5nY8JXevhGlywEgmECeF8d5Rroqg6/yDhq8ldBX5wfSgoY5OnNLIie2n1Zh4oJDCBAYVLZvgk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PhcGFNlYjLV9XW95SmKtHxN8eoffs4BbapQaYBQ1UA=;
 b=ROhwzOImRxDMu8iUUztUR80UIUnAZmwXKkxkNJmCgMWMM0MYaXKqIZ48PdAnGUONdrj12NuE6S5S71qoNpEO92ayq0K3vFPiOPYAWVhWY8qFS/U6/jXQPxTFUdhyUTgWPoXpm59WpSmn6bn+sQX0zLv07gWL4J+VFX7DZdY6HU3gSem9sDKkAZTZgMQRN7YsN80o9NwT943dFyM7VBwgMJFRimwmL4HGrBfX1HMa3ylGO6VB5XK5LzlCQ6feGhB61L/0r5LSVDhudOnJ7haD2KnyIP/Vbe7vSPHRYL/EyRF3SatxdsG5KmYvbjpgY9z9RZxL3xsAtGeFr8G5MqZLeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PhcGFNlYjLV9XW95SmKtHxN8eoffs4BbapQaYBQ1UA=;
 b=c33WOS1+64r9W829u0ONKjgNrUnWqFQZGECxx8j47q6kqkSOf9rlmZcLVQGw/TJyNxkZS+3y7sMBCtNrpggCb6XNm8k3qqHxeE5s8uQSSQk8sJBeK8IeEgGAwx+Xw7v+QAONqXzMIuFpmxglwkS6FXyFTJleKSdIz0rnEufoCOD8lHj/iT3pFTDDB9YCxIwZTWKjHc48AhA0+QsSPH9LFQ57+bfu0cjCXfue0Ah2GKzKJLXmUCoOQaPNkOVikTSfR+5UkgI4bAJq2mol5E0b+AydzIX0eLtfLdvZaqwS6MITU1AbqtR6NfZFHDpZE4zL1qZbpwtDPc+uNTb9v5bAnw==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1146.namprd12.prod.outlook.com (2603:10b6:3:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 19:32:36 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 19:32:36 +0000
Date: Tue, 30 Mar 2021 16:32:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v7 5/8] mm: Device exclusive memory access
Message-ID: <20210330193234.GA2356281@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210326000805.2518-6-apopple@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20210326000805.2518-6-apopple@nvidia.com>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BLAPR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:208:32e::26) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BLAPR03CA0141.namprd03.prod.outlook.com (2603:10b6:208:32e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend
 Transport; Tue, 30 Mar 2021 19:32:36 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lRK6M-0060w4-Is; Tue, 30 Mar 2021 16:32:34 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37fe68d8-06b5-4a41-ad3c-08d8f3b29286
X-MS-TrafficTypeDiagnostic: DM5PR12MB1146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB11460C0455FAD4792D2007F0C27D9@DM5PR12MB1146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rw/XrX6AXfYloHbskeYOeLPsHyNYLcxZg9mqf7xSYK5QvP/2wB0rK1h9GRcaV4R83EbtXfuKzolT/Lh684mkIuexpNIGyZdwIJErVeb6cki6DpsKlwlVoZrNgZPh1xPS7Q99L9YIXl6qcaPxJHbgqFYFFvDBq7JCiWNUyvfw2CGtYSIRvOipeSlsyb0mHsSu4PkLdbDLPgBOJZ5UMt1R+CQ3Lo34FUH3OrraCBAJhiFRWNh9TUCNZuYaVV/5xJThKJeWJp8b/EEx8N6Y68/A+lomGLLXvaBN6Rgw0z1i6QWKDuzSOXkpuBI+HYf+u70I54VwfFnqkIclGW0W0MFWoZJHqGXx4A5CyNKm4sOG0HIRfglCCs2pIhIbzF47OnSLepaeU0buxBi2/y95+P+EVHNcH59HgYTJu8AKfhtCMcBxjNWEq17qTyU8xynJ4iLSDQH0IuU0yyaYbVO4LkxYvxwhpRKTiaF7UogRTIHdrmcqhxVfUuHAM66DZaV0X+ztYYolJPGmxGCvPMPyDTvzFaDPVRuQNxoq24TCJ2oQ+Wni4aCUquwML9BjJYSFQL0lPwq0v8GHnSDsQNI1uFA+QNOgv1XY2uKyh5OptlmCjNj2a2st6lwrJEILCJCrNBi7foqt8LoM3VyHHyU3kdAjU9dei/nXn662l6fnNNXlZqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(4326008)(6636002)(8936002)(316002)(37006003)(26005)(38100700001)(7416002)(2906002)(2616005)(86362001)(33656002)(426003)(186003)(6862004)(8676002)(478600001)(5660300002)(9746002)(66476007)(1076003)(66946007)(66556008)(9786002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MDIS8/wu7soJaecqBUztEe5bkfyPOy1ItblRAEcrwsMe1HIcz85kqW3pkqZ9?=
 =?us-ascii?Q?sa4ANWUN879JGxX4Un77YY8CV9YrilOuGQ3wOtLNeMat9qMS1jJ99KTiPftJ?=
 =?us-ascii?Q?oe7A1jnUuuX5vaACnJx0OxokihEtyhYfpdb0HRO2JPgcAkcaxru4ZaAJLasW?=
 =?us-ascii?Q?gKPpKCmpQS1GmZVYY6pXe1Jj7y/aVaJ4o6WqvYRdGVfOODvFKG+a3/v9nmMx?=
 =?us-ascii?Q?fuzjpBQsKstz6bopnbiePCtiGV5BHseYI+ZX3kDPobW4tSK30px63QSWRt8j?=
 =?us-ascii?Q?VOnnzikj2xCtFFyVLjfWAsY70MUwjT0uFtgmrPKq6p6KIbUIiDEzVMMVLc0J?=
 =?us-ascii?Q?tvk+X2Gw2fJQu7Jht88k3FOPaf6NB4nK/fdOL24KMPLk2rI3Xzrb31h1+yDh?=
 =?us-ascii?Q?1rnHT1Gn8eiwYiBd5FUDHezsTjvvSbLaxyueOvM1Nif2KvTz76Fd6Vz7/URq?=
 =?us-ascii?Q?Keif9XVz8yAm4KpaZBUU+DJCMgkVaoudajJ/zThK/A4GdG5HpAMbaKD2ekb1?=
 =?us-ascii?Q?eE6HumMoOc8u5CJ3xprR6uhM7s/vhOk6fmLTiFoGThTJUWA6+5eMz8JSUwqs?=
 =?us-ascii?Q?YgAeX575yiq+FaobMPXdRMgGsyrBmOYczKWZELiNwz7eq3l+7IE9ssM1N5lv?=
 =?us-ascii?Q?ss7/vs/V1VVQY2VISzlpz8NYPQKOlkP75jB8Tod8q2nTXao7Gq2FnQCDIqtJ?=
 =?us-ascii?Q?/5plX6q5+MRHYeiESeBfmwgCa+/QpfmRTfiOjkfvJj7QNOUXGQlpiz0UFRr0?=
 =?us-ascii?Q?kdP3RhGiYMb55VU6Zv55aAOumBN773cznx8IoX6jNBx5I31Xy885kXK+8APL?=
 =?us-ascii?Q?nNxPSNiaz3+aykzxKbOURcKU+zBhWbHMACI1Dk285q9CJrZP8W4lFzPTD0B7?=
 =?us-ascii?Q?FjQWfYgb3ML0eKJJjFud5zpitkH7AYK6hsGL1FAQeMaIlSgIlTXw85z4nzn6?=
 =?us-ascii?Q?+zNxY/UNQPuo0h21r2kyaf8AWGTEGf/WSXNPROSf0iuuT7XRpJMI+89LzRAl?=
 =?us-ascii?Q?cn+kMqAhCPZEEj1iB8A0gsrSNrUrptJrAmwuDYav2NNzdd9avPFETYgUEV/a?=
 =?us-ascii?Q?0pRVJhaN6Z5Kf4wBxVYKmCH+Rlq1pe4wAgo1w+QS/UE6cTB2LL4PchsZJTbu?=
 =?us-ascii?Q?a4kET2LWL+wm2U0qo2qOKp2cr8eCxMD8Eh6AM+NKWkturGEwc7fFgjXMYbiz?=
 =?us-ascii?Q?ilYdCq8+rMsTpG4/Glm/MywO7NHmbCUxYTuZGz5GUa/vhzmTlRmdJEhLuuJU?=
 =?us-ascii?Q?rLi+3aTd9ErUBtmZ9ByqpiGAn0Nadrp2rL4nLNPA0xJzCyRuy0JdszxQqhZy?=
 =?us-ascii?Q?6fcsLtMVgtre0Gbku48lgZC1PMDBOtGV9cbT800G1oIpPg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fe68d8-06b5-4a41-ad3c-08d8f3b29286
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 19:32:36.8209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JImXeaAgtp/05FnYQTtLdXkback4yZpTgLANfcnB+9nF2JnHckQagdb/Xg1bpjaJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1146
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 11:08:02AM +1100, Alistair Popple wrote:
> diff --git a/mm/memory.c b/mm/memory.c
> index 3a5705cfc891..33d11527ef77 100644
> +++ b/mm/memory.c
> @@ -781,6 +781,27 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  				pte = pte_swp_mkuffd_wp(pte);
>  			set_pte_at(src_mm, addr, src_pte, pte);
>  		}
> +	} else if (is_device_exclusive_entry(entry)) {
> +		page = pfn_swap_entry_to_page(entry);
> +
> +		get_page(page);
> +		rss[mm_counter(page)]++;
> +
> +		if (is_writable_device_exclusive_entry(entry) &&
> +		    is_cow_mapping(vm_flags)) {
> +			/*
> +			 * COW mappings require pages in both
> +			 * parent and child to be set to read.
> +			 */
> +			entry = make_readable_device_exclusive_entry(
> +							swp_offset(entry));
> +			pte = swp_entry_to_pte(entry);
> +			if (pte_swp_soft_dirty(*src_pte))
> +				pte = pte_swp_mksoft_dirty(pte);
> +			if (pte_swp_uffd_wp(*src_pte))
> +				pte = pte_swp_mkuffd_wp(pte);
> +			set_pte_at(src_mm, addr, src_pte, pte);
> +		}

This needs to have the same logic as we now have in
copy_present_page(). The page *is* present and we can't copy the PTE
value hidden in a swap entry if we can't copy the PTE normally.

The code should be shared because nobody is going to remember about
this corner case.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
