Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFE1A237F4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 00:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A6D10E9F5;
	Thu, 30 Jan 2025 23:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IzH/ffTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C90E10E023;
 Thu, 30 Jan 2025 23:36:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXxAxR84M43E1JIZuCtLiRzX1H9WTnJd8bZqcxIl55b38H6YaoJNAb4cUEZUH5xNzz0eDuLmk0d99U1LRL6848GJKQZI0mfiX1nCV8vfuSySGdrXzTAFE0+McXQ3I1MGLJxlC+WLUfXt/p+ymdlNLqfQUTUlXTxzeXKn/LmiX+/SkfddGtsANUAcZ7w0AcXIJyBvTr6fmnZfdzY7SJGDCFBQKTr0Vc1ufz/gAbbvKRueEZf22RBu/jiITOI4TjBDl4uc2Zzn+MglAjI11G6lKuC1da90M1oKjjMpcXlRG16KHRidJhx4cKwfLg1n3fu/4WgGxbFEr7tP/hkSyb2ywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbKRYeBHgdsriDX+P7chTMPuScSJYNaAXrdb2UNuSBI=;
 b=fKMQyx6l+7XnTzgbleoZDyqFU7/A+/UZE8z41xWxKtU27IGIwHSV/b5GqU5vpx33QL6FSrSUSzl5XbcIRHLHtVmmdYOmtfHWHB/jZOMyqO2/gNCcgNlMfUMuQoXKrNrEGSv06s4LktW20gCt1EViyFZ9687AQMtdNOoEK9y+e1+s715l+CdeYWSHVcqNO6+VPHy6RSG0KQpaCNejbIk/jN5rRYPndrDOHTlhpHXhSSdbu3C0g5l+96MFh1SQr41qBbbpoelpFx3U/ZBmQ9F3tCmzwWXmn3gtO9FLi+E8oeipdKiFXY0yaVw/NG7kirMYcDSq05WyPiUB0Wdf9j/ooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbKRYeBHgdsriDX+P7chTMPuScSJYNaAXrdb2UNuSBI=;
 b=IzH/ffTB2Lex1sIWjQCGm1V5Zqjc73EQ9JPSxKhJlycH6vK77qwPBdU6TAGJc+P6AYm3OYGby42aV/nbm6a+kNqCtUZBOf3PwB4J0bCQjEi7lWYuoqqFtpJa5LUgcKwz81qQpozzVEB1ziFxIBB85kLG6yRB0HDwQjgyCXvgBfn014jiqmilFCm1k3wLrHdZy6SPhMu3pMg62wOIyNFk+vOtxSoNnx3vDxEkcGloH13mD5Rs7kgiuAFEyKqlRQISw+IUxFx66qBsn4+rMr/UQrbzFZ2cyBNTlU5Z7PrflVUbjNMdpYjmRvh5n5fuMQ9yBu+vw4vOfNrxwNT2LTc8ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 23:36:28 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 23:36:28 +0000
Date: Fri, 31 Jan 2025 10:36:23 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 07/12] mm/page_vma_mapped: device-private entries are
 not migration entries
Message-ID: <baraw2czilsofpedok3jtxxshfaxjrmef6u42pitibtcst6mel@scoukpiwnvvc>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-8-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-8-david@redhat.com>
X-ClientProxiedBy: SY5P282CA0135.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:209::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: af107aab-e92e-47ff-6951-08dd4186eaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mak3mCXpjr7oUwRLSE2iFG/lnL+30G66mY2BtRTwIirTf0C17yTMzyw2gGXe?=
 =?us-ascii?Q?EXSLynC3qXyE7QeI4A+eyhgxO5L7TbFX+4G5yRIo+xw48qhPqx1i5JES+5XF?=
 =?us-ascii?Q?TlFGoIxGxQ5uThb1zgTocQSTIuhORnN2RdXCA59RNW4TVHw8GwJM0Y1TPA0P?=
 =?us-ascii?Q?7R9tN7S7rYBHLw5AmVajVNY2gN6Bk+ND6ygknog1mQFiAcu2ms5/xKITR5au?=
 =?us-ascii?Q?2qo2x6Cowj+wYl4cQocGjkNEvRc0JWtLtIM84810B0XSZmu8OHbc8eiLSLdV?=
 =?us-ascii?Q?vh/cPq8ZQSWRnvjHjdzhiYBzTX2USrGz45Esfx2IUaUWMTqM0Rc1Nmn6Arf0?=
 =?us-ascii?Q?IFKKJ2TiWpVOYURcOVQbp6SQKDTydAZsmupRwPNXkR/5wRCVqwNp9M5mcmeg?=
 =?us-ascii?Q?LdCCdF3PR2PdT7TtBffmMY2Xql6fB3JZnGJOCSc5f3Y7/q88AB9mBQ69kaKq?=
 =?us-ascii?Q?dYFXZGDV34B/w6+ldehst4cXsNSHLEObU37TNH57JjowS12BJQrHPPLLTLoB?=
 =?us-ascii?Q?Kj54OKtqQK7lLZMGQ7FrNyBMCLBHy6xXHKtTfyuNlpp93OoSu1VX1RLVEige?=
 =?us-ascii?Q?ZehdYeGcq8I7CI9qmi32dbzSVfgJUHvXQ49DMyNawjmk01oRItameeoZl2UK?=
 =?us-ascii?Q?B/RdY4cE6wxgrwRxn4y3WDOhNWraqJk05HSkenY+lX0GYnzaLimL/mLGDRbh?=
 =?us-ascii?Q?0aOqhwcU7E01KiCUj7OLwWQ7vmqkHrM0VNpY0YI24ETUw7D2Sd8ta6/QC1Dn?=
 =?us-ascii?Q?0VFtfDJ5O0u4rcQmh/7Bw5Ai9mEeNnDuPvpxmNnlHhKPecPszGd2iPZ0kxou?=
 =?us-ascii?Q?prBwwZRu0dmKCQ7rRJ162OJe7ox2spk27eTT7ZVehq89DiM079KVJDf2kJbW?=
 =?us-ascii?Q?+OSLrAnQpq/QcfFH9b8RtjrDLgghoM4QrYqLhYm2vLWOpBDg15qPvJAiiH9d?=
 =?us-ascii?Q?SIw2UBEkA4hmpdFDXtoBYnwUnq8V+mb/WwdC96R1gs7kHzhMAmA/XP1TOwlv?=
 =?us-ascii?Q?rasHKFKp0CoSvlcbx2r4vEebd7uyF1O4JKyb49upTMZ2Bbp2FQIsVHm/5oiY?=
 =?us-ascii?Q?CD01evhvPX7+s7F5Z89LEmR6iadWcJTqU9vcPBeXFiDBRVKzvOF9JJOSNf0m?=
 =?us-ascii?Q?cVvKelCRaacayj9EZI39ZoVt5KSrkrXiMY9wXqLd0mBSYmHJKps1OOVFFlJ9?=
 =?us-ascii?Q?PtzvMs9FGZ9zNfo98SlM3byPNp+kj/3T/2qHD7npCbKllNpy51cfvZn28b+c?=
 =?us-ascii?Q?7QJx004hCG0RjQpZXa4zGSwJhK6457NZBTARyfZBaOggA0HM03piMHA4cmO7?=
 =?us-ascii?Q?PoOeAFQLlkA3AD6vSCVlFriZhZg9RWoqd3bM3UPsDQZ38l5akuV1GUtqNdiq?=
 =?us-ascii?Q?ASOZQRjFOSXaCmoCHsJs/bScojmcZTAmQGLK9Xgl0XX4FRjGI1PiMdiaWfE4?=
 =?us-ascii?Q?bTf1sHYI7Y+g0vAzUUdHByUiOqmvRNDp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bJaDKxtqPbzbhk+xRfjUiIznrdQSo95K3RaHW8AbrAYtseedsFpU9lHsUVWw?=
 =?us-ascii?Q?f25vsMFrueOcEuHnDk1BOTpFLMVW+sgd2zIOqCdFwhVtyFTW+xeNuEPD/A67?=
 =?us-ascii?Q?pIea5eGrAf684ZBU3x9Blc/ScqJSrFwuh3p562+2f0Q3GDC2ZPtGF8gG+o2V?=
 =?us-ascii?Q?i7urHPuIxtU+vKTMDOl3XRRxRXciuHsDq6z+V1gIbpXgLVLdJpKMR5oSSZfs?=
 =?us-ascii?Q?bt4U7eg3FaA/Jn/P3tKZmIg3M4g1actrzemhCT5/bfNgRdqC2PnojeapsTn7?=
 =?us-ascii?Q?eexc5DyvXioV1QhO8NP4TrJnkrNGMnHEMMmG/8LoMKNjx/l0UrM77kLFUP1+?=
 =?us-ascii?Q?VGa/OURjlpq54HIYQ/jHl1Jh9OPE0CJGWKxFRH3XHJa3ttZuU0ExJKF8AmnU?=
 =?us-ascii?Q?slXpVQegcboW40G/ia8j6dEX8R2vNNdPP+aYunBOTV51qjxjJPrVTn6BWy9x?=
 =?us-ascii?Q?DDju9j9bL95jcN/QzNZyJkgF2HtSrqkyDzQusNA71ijXKD++KZgSuzFHjh6J?=
 =?us-ascii?Q?YTtliWOkqdk5nBf4FuqS9pJkF1OSpwL51XS4AuUNeX/PmbWXhBTipu1HIAeE?=
 =?us-ascii?Q?wztAhsj/ynsKJ85HXYUmctKuGRQ35bxWYy9m78vWftoRl/KUi5llT9P5DBVe?=
 =?us-ascii?Q?iXBFqASarug/XQT1TSLR9oSDf49APdD7vvAtlfQ/0898/XBjqIVJjWqtBAxn?=
 =?us-ascii?Q?fsYDVMGWn45eC1oe7id0tOX42ce8KGRjVWzPf9BDZ/3hgAhqVhrkiQGOuOH2?=
 =?us-ascii?Q?ShqOxUo3dLhbJHQkoWo/0lMSRLH21JneiukqjSXl1Ok9ngpIk0HIC4/oInGi?=
 =?us-ascii?Q?N7jtgLqVguVBpgLujrx0tAcGTbBJGr+EJ+yy9H2Tsy6sqKLgYEaB4Lloo/yo?=
 =?us-ascii?Q?dV03PinQvw1rAjD3lUwe2m9ujlmb7/Jf1j4ZR5vdgdsHVrY3PvGdnIcEPMkm?=
 =?us-ascii?Q?ciDxGEBATzveuOJc68t0xkK4ncmEd7o120zke5WWuSBn8DnpKj4z5GUrc7bd?=
 =?us-ascii?Q?hWUEFlmBixgZpvTFSAxo/H8QjwVs4sYzEVo114KmYAYQm7IHkOBbTFxtUMqn?=
 =?us-ascii?Q?pl/lWHgeDLPm5g0tnEmbBHuDekcUSChUQck7jayuIUI/leklVfHz4rjNEdTT?=
 =?us-ascii?Q?9Lto+VwTPtB+Nyz/zWc11vTn9XjCNXkaRAk41RxVnAoGjECLXjlQ/PHbqzjg?=
 =?us-ascii?Q?t9zmVKHEHDjr8fZrp20+zCWvTMBUIENNWgs8Q1nTk+WfVdjsbkkFWzJzBAMm?=
 =?us-ascii?Q?5sf7mX94aYxQIJnp7eODazednYYsStE7zlpdV+AbPytNwuoyKXXOFT/0+BeD?=
 =?us-ascii?Q?yx3NsyIEc1I1ZW2ULz+UlCqqBjsqiE1V1mAprRNs3jLmnC2ci5K3jPa7M0+z?=
 =?us-ascii?Q?qcJ0oAyeN/duJrEiTXFUy/dSS87NkhET9YLQVD6FRntEAjQRw33NXFEFaC7C?=
 =?us-ascii?Q?+Kg7aNsvZ7JwRw80dogq01tdRLTJ2IOQy782o51Kd4EXTbPfcZC5Mjjt8dHw?=
 =?us-ascii?Q?5RV1RFkXlWd7FxSQ4CJLfRtNrye71ybWMXoMCmONpuoYTsEjifHW6z5nES4G?=
 =?us-ascii?Q?H3di8hjk6mkoEKdhpaFJwObPOSVk2s0z69V+3MiY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af107aab-e92e-47ff-6951-08dd4186eaf8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 23:36:28.1513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGikKxGOuw2esDF1ScOBmLDtqPAci2jp953Z6UAfzfVa/OiAXUAhbiTrpZ6XJPWtY97AuTzG58mI7S2e6A3vcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
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

On Wed, Jan 29, 2025 at 12:54:05PM +0100, David Hildenbrand wrote:
> It's unclear why they would be considered migration entries; they are
> not.

Yeah, I agree that doesn't seem right. I suspect I was initially modelling
device exclusive entries similar to migration entries but obviously went too
far. So thanks for fixing:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> Likely we'll never really trigger that case in practice, because
> migration (including folio split) of a folio that has device-private
> entries is never started, as we would detect "additional references":
> device-private entries adjust the mapcount, but not the refcount.
> 
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/page_vma_mapped.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index 81839a9e74f1..32679be22d30 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -111,8 +111,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
>  			return false;
>  		entry = pte_to_swp_entry(ptent);
>  
> -		if (!is_migration_entry(entry) &&
> -		    !is_device_exclusive_entry(entry))
> +		if (!is_migration_entry(entry))
>  			return false;
>  
>  		pfn = swp_offset_pfn(entry);
> -- 
> 2.48.1
> 
