Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D68D632AC7B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 23:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B3189FC5;
	Tue,  2 Mar 2021 22:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355B989D61;
 Tue,  2 Mar 2021 22:13:19 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603eb87d0002>; Tue, 02 Mar 2021 14:13:17 -0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 22:13:15 +0000
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 22:08:25 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 2 Mar 2021 22:08:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVTI6QQaqzcdAgRW3AK4cLE0F/+s9fc0xAyclHLsbBRbliDGgAv9kaxQZc1P1Otyw0HXASQurKZNn5fu9tlYMOZOMQkNAeYNbCMZ39ivUKmqoOX+JlFvhX+VtGtXahmpEL0WKr8j5VqmfsfzJqSzMhNTYKhonuMv13FSKJiT9GY9UaMqH1dXktXxap1ruzImNL/BdPCN/++iPVNhr2yyIvdCmTBs2gvNiLdlELoTql0NdG17epwtPdtAXTdx40IOebUvSTny15rmqStxK8eOvM9Wj/smfPbBrYs65UoSJBoZEEjn/1sks9YAIV6UrmYjjpAkzfo9ZDIuxO+09M1VBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RypgdQ13sxBsHXvYYgu32NR7rdgR5XVbnvNdjrfqb5E=;
 b=Wb7hQSAjwebeFH60lIaQXKZ2nWrS7IfMDTq11sBTZl2lLzPebhbMmszqk73Pg7RMrqHR4LfQo+Is7U1r0Kg4wjELg+H2H4bzMlSn4qUjpVMwjyGLVgncLDrHt8D9EGRlktUBqSTKYaXvfFeRYHvnL36aMlyzgxxliX83TJZ/mwK1SBj+W9fRB17U0+lD8wA/nDFK6hLP0GzZK3NUJUNYwSlh/MLSJDhvWhRrZ9S2rTNtC65gY1a3Kc9DvWQEPSLPqg6treIPUNLc6Z1a51c5I6r68HaDSQ7rZ+dkIvMLs8ajYavB7NvTNTsEtSekTcWlH7c+i9mt1S90fIlguGXbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 2 Mar
 2021 22:08:22 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a1b1:5d8:47d7:4b60]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a1b1:5d8:47d7:4b60%7]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 22:08:22 +0000
From: Zi Yan <ziy@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 4/8] mm/rmap: Split migration into its own function
Date: Tue, 2 Mar 2021 17:08:15 -0500
X-Mailer: MailMate (1.14r5757)
Message-ID: <E93F89E1-3CE2-4CA3-97D9-6BCED78E1001@nvidia.com>
In-Reply-To: <20210226071832.31547-5-apopple@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-5-apopple@nvidia.com>
X-Originating-IP: [216.228.112.22]
X-ClientProxiedBy: MN2PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:c0::39) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.62.13] (216.228.112.22) by
 MN2PR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:c0::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Tue, 2 Mar 2021 22:08:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95f9009d-9650-4b25-2547-08d8ddc7b16b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB387241F83492D81B57531F91C2999@MN2PR12MB3872.namprd12.prod.outlook.com>
X-Header: ProcessedBy-CMR-outbound
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAy1zuUDlEVCDWc4qO0NJCP+H2bJVQ6wsS7FmNua68Q6eYlE5OwYs8+jLpmMyaWJso3Krj8mfX4FKC1VjCYbwTVPWfp7lhkK7ZAg167n7dAW5LmhcPqXM58d3hYqXEDgIj0lbg0Iwj48/K+/+Cjsio9AJ/YMTuyAJD+EBpr6ASYJoZiFUq6q27iN8zCH0y5hqQP/btqwYLXZzDft2VzKjR1FLKzVeLnawQcVvbMO+yOao0HLzHATJo7HIv8tUvhKWpo8nxUE6LAZGqTKfbV8tDpvJT5gVEi3DD97JIkB5NhtrXm2gV4DrUgNK+/zM/2+xI3PChiVwny56jLqVj7PmwdcFog3UtGTO09T27GDmfR8VAnsU7iamy3CV6JSMDLQmIehCMR7dz0i2SkPOuyI7dCO8NYy4FbKHAkSd3D6XRkeRhNM46dVrb7wMhZizofem2jRyssnRDF96kfsAx5a5iL+S+3vLl7PcMxBJdh6ka1HrvC6OFahsjqk3k1WXHuIZsQabtOrhJAvNwqPDwLMg6Cd8LV+r084nldEEItTGdHiQ1vrgxjezbCkNIBzl0fadRisvsIFYLZUhmBFj/L178hN1Tfvf+bIZXiikNk5EDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(8676002)(2906002)(36756003)(6486002)(8936002)(186003)(53546011)(7416002)(33656002)(86362001)(33964004)(478600001)(2616005)(26005)(16526019)(83380400001)(956004)(66946007)(66476007)(5660300002)(235185007)(4326008)(37006003)(66556008)(6862004)(6666004)(6636002)(316002)(16576012)(45980500001)(72826003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RzF4R2NpNXQvanRtdmdhWEVDTE5VOS81SWY5TlRBRW5yVnk0cEZiM1o3Y2dC?=
 =?utf-8?B?ZFVGbWF2UTVEb2JxbmlKZ2pnbmhsS1JyTUhDMFM5Vi9SWk5rRnVHZWlZVlJH?=
 =?utf-8?B?Ym14QjlsTGR3SDZxazVqWjU1bWJGOUJIMVAvb2c3MVd4NnpMQTVNaU9ld1gw?=
 =?utf-8?B?WlZRUjhUS2twVTAwWEhhMWxqaVh6YzVDZm1rK3B1amtVNVRxL3lMc0I0M1pa?=
 =?utf-8?B?OGlMeGNoMS9IMm1Qc0FCdVRzSHFsK3VCbWMrcWphSG52cVJmL25zckhyYmsy?=
 =?utf-8?B?Mk40TUQ0Nk9od2Z5UGk3d2VZVlg0TUdnZjQ1UWZaaUtlTHR0c3IvTDFpcWdU?=
 =?utf-8?B?cVROMmw5NGdlbjZzTGVQallEQkVNYzJpdzc2VThQUmFlRmdmZFYvRi9jV2Zm?=
 =?utf-8?B?Yk04YUFKalVxQWhZVHJvNUpub0t0RWdINzhPRlNmSnZpNTk5eWF3SWpaR25S?=
 =?utf-8?B?MWlTdEpDeVppMFdoWFFIUTMvZDdlOWVEWDgvUlVUSEpxQ3FreFpBaGgrTVFi?=
 =?utf-8?B?VkxLSEFMTnN6Y1JsVVozUC9tYmwwNmRFODlIVkRHdHZuWDVwQTFCb3NZb3Qx?=
 =?utf-8?B?c3JuaVRzaDlRUlAyT3ovWmZDSWxrSnJyUDZYNEYyaFl3OGZtYW1BZkFyUnEv?=
 =?utf-8?B?OWk1c3dNU05Pb1d6NTZGOWt6cmJXRWhmT2FmcDBPMk1Dam9mbUxZOFVVV1NQ?=
 =?utf-8?B?WWdnUEpUTUNUSXRRSEF3UlNVTDJ3cEVvS1IrM1F4eXFad1lFZWUyeGZYYi9E?=
 =?utf-8?B?bkRxWFdQV0dCM1ZnR29zRjBaSGc3NjA1Y2NFQmdtend4N1o1WVVjMEVNTURJ?=
 =?utf-8?B?VUJWMCt2T0hwS1pXVDBVWnFzMnBydG16WmxiamFlZGJDUm1FU0tSL3kwRkZm?=
 =?utf-8?B?V0FVbmdUTWN1YXZSeW1RMmxUUy9ZV0VJbHJHTzh6VURsREJ0QzdaaTFTbnRW?=
 =?utf-8?B?cFo5VHE5aXUxeEg4QTg4dDJOT2IwRXVyMEh6STBYb3V0ZGs5NVhMWHd1ZVVl?=
 =?utf-8?B?MEx0dVF3Q3BXK0tLQVozN3pidlBUS3hPTC9KYU1DK2VxZjNKQVJUa29SMGpI?=
 =?utf-8?B?Tks2ZnZ5VjN4eE5Lb095Z0ZNSWhESFhldjA1NURKUTZHYmVwVkRMZHU4VWFu?=
 =?utf-8?B?NmdVY0JKOGVJTFpkUTNWVFlUQk15REtzRWdjZkQrSW9XcnB5VzZXenpZUzhl?=
 =?utf-8?B?cERLZWxSN01zNHUvOFhKajVjSWZFWFVvdkRyUGkrQ1F5Zk85L0xRVXlTTDBX?=
 =?utf-8?B?b2pISkJGWmhhOWYwSHBSa0FlTkVkVGJRNVRwVTB6RkgwMWJuMnI1aEduTHly?=
 =?utf-8?B?MlJTQWNBTWhNd1NpdDRCTk9zcU1HT1pVOHIzTEQxN0VvbVV4bzAxUlBNRkJu?=
 =?utf-8?B?UHROZmhwdUM2QjNITXhrOXEzSUtXY1ZYSTMwT0IrMVk1TTFTaXBESW85SnIw?=
 =?utf-8?B?QTNJTEVqL0pJZkozMnIzUGFBZlBOWmtsb3V3STNiTTBRUDZLbzROaDB1alI5?=
 =?utf-8?B?K0NWT0pLZGJLSUozUVhDSEFQNDVoMlovaFpwWnBJM0FTd2h0Z0plWFR6S29l?=
 =?utf-8?B?WDg4azk0cU1GY2FISkJueXZHSDJhOUd5a2RnN2xKNkJvMUV3NjlXYnE2d293?=
 =?utf-8?B?NDhJbzNBRG45ZkhhSXoyeWVaMXFMcW1zTUVIUmttYURPZTFLWXRDVjVJem5L?=
 =?utf-8?B?STd2ZVY3OVNYU3g3TVhJTDcwVzV2c2I4Rm1taUJCdGRSTWN3R2R5WTIzQnM5?=
 =?utf-8?Q?wNl5JoNdS0bhMfwQxLsgqqmLDjg0wHZYDmJNhyF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f9009d-9650-4b25-2547-08d8ddc7b16b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 22:08:22.0363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQCmOzZqo+DkoocBlQ/+GoJA6vq/jZSy7M/141rUVAVYMSg7FQ2jdzWAz4M1hVdH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3872
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614723197; bh=70/aSWgmEbCaBsQQZXx/gYqdKWYogko9i/UtfOSND0M=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:
 Authentication-Results:From:To:CC:Subject:Date:X-Mailer:Message-ID:
 In-Reply-To:References:Content-Type:X-Originating-IP:
 X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-Office365-Filtering-Correlation-Id:X-MS-TrafficTypeDiagnostic:
 X-MS-Exchange-Transport-Forked:X-Microsoft-Antispam-PRVS:X-Header:
 X-MS-Oob-TLC-OOBClassifiers:X-MS-Exchange-SenderADCheck:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-Forefront-Antispam-Report:X-MS-Exchange-AntiSpam-MessageData:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
 X-MS-Exchange-CrossTenant-UserPrincipalName:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=NAo7oHz/fM3lElrP091HQvEXQX4ESI0nHyA4WnwOzKFk0+F0zeSpcXP5ng+pgW1kV
 oWezxvknxsiRzHOuI/aWQb8LSCZkusX7URW1q+3de2/qQqlYfWytmcO6ObMUaB5CIp
 LLYk9QzWKZIEFNZ3rklEEIAe3BboGF4l/XnrcIOHTfbxO+eJwP6iDVtcUw1YOMG2TF
 PlEF1BmlSPeVwJ8Q3vOsgqwzwhBLAz10prkjaQVgykwZgi4AVOnww2LldPigQ1CHHZ
 /LO/aWgb38yZSCziipNP/9otPIfDBs9ys+5QyIpbWn/s3whMYF50s7zsbEUBUTSpeG
 EDrE8bme+i/Fg==
X-Mailman-Approved-At: Tue, 02 Mar 2021 22:21:34 +0000
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: multipart/mixed; boundary="===============1677972144=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1677972144==
Content-Type: multipart/signed;
	boundary="=_MailMate_6AC1FF45-9158-42AD-A419-9574088A750B_=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=_MailMate_6AC1FF45-9158-42AD-A419-9574088A750B_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 26 Feb 2021, at 2:18, Alistair Popple wrote:

> Migration is currently implemented as a mode of operation for
> try_to_unmap_one() generally specified by passing the TTU_MIGRATION fla=
g
> or in the case of splitting a huge anonymous page TTU_SPLIT_FREEZE.
>
> However it does not have much in common with the rest of the unmap
> functionality of try_to_unmap_one() and thus splitting it into a
> separate function reduces the complexity of try_to_unmap_one() making i=
t
> more readable.
>
> Several simplifications can also be made in try_to_migrate_one() based
> on the following observations:
>
>  - All users of TTU_MIGRATION also set TTU_IGNORE_MLOCK.
>  - No users of TTU_MIGRATION ever set TTU_IGNORE_HWPOISON.
>  - No users of TTU_MIGRATION ever set TTU_BATCH_FLUSH.
>
> TTU_SPLIT_FREEZE is a special case of migration used when splitting an
> anonymous page. This is most easily dealt with by calling the correct
> function from unmap_page() in mm/huge_memory.c  - either
> try_to_migrate() for PageAnon or try_to_unmap().
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/rmap.h |   4 +-
>  mm/huge_memory.c     |  10 +-
>  mm/migrate.c         |   9 +-
>  mm/rmap.c            | 352 +++++++++++++++++++++++++++++++------------=

>  4 files changed, 269 insertions(+), 106 deletions(-)
>
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 7f1ee411bd7b..77fa17de51d7 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -86,8 +86,6 @@ struct anon_vma_chain {
>  };
>
>  enum ttu_flags {
> -	TTU_MIGRATION		=3D 0x1,	/* migration mode */
> -
>  	TTU_SPLIT_HUGE_PMD	=3D 0x4,	/* split huge PMD if any */

It implies freeze in try_to_migrate() and no freeze in try_to_unmap(). I =
think
we need some comments here, above try_to_migrate(), and above try_to_unma=
p()
to clarify the implication.

>  	TTU_IGNORE_MLOCK	=3D 0x8,	/* ignore mlock */
>  	TTU_IGNORE_HWPOISON	=3D 0x20,	/* corrupted page is recoverable */
> @@ -96,7 +94,6 @@ enum ttu_flags {
>  					 * do a final flush if necessary */
>  	TTU_RMAP_LOCKED		=3D 0x80,	/* do not grab rmap lock:
>  					 * caller holds it */
> -	TTU_SPLIT_FREEZE	=3D 0x100,		/* freeze pte under splitting thp */
>  };
>
>  #ifdef CONFIG_MMU
> @@ -193,6 +190,7 @@ static inline void page_dup_rmap(struct page *page,=
 bool compound)
>  int page_referenced(struct page *, int is_locked,
>  			struct mem_cgroup *memcg, unsigned long *vm_flags);
>
> +bool try_to_migrate(struct page *page, enum ttu_flags flags);
>  bool try_to_unmap(struct page *, enum ttu_flags flags);
>
>  /* Avoid racy checks */
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index d00b93dc2d9e..357052a4567b 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2351,16 +2351,16 @@ void vma_adjust_trans_huge(struct vm_area_struc=
t *vma,
>
>  static void unmap_page(struct page *page)
>  {
> -	enum ttu_flags ttu_flags =3D TTU_IGNORE_MLOCK |
> -		TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD;
> +	enum ttu_flags ttu_flags =3D TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD;
>  	bool unmap_success;
>
>  	VM_BUG_ON_PAGE(!PageHead(page), page);
>
>  	if (PageAnon(page))
> -		ttu_flags |=3D TTU_SPLIT_FREEZE;
> -
> -	unmap_success =3D try_to_unmap(page, ttu_flags);
> +		unmap_success =3D try_to_migrate(page, ttu_flags);
> +	else
> +		unmap_success =3D try_to_unmap(page, ttu_flags |
> +						TTU_IGNORE_MLOCK);

I think we need a comment here about why anonymous pages need try_to_migr=
ate()
and others need try_to_unmap().

Thanks.

=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_6AC1FF45-9158-42AD-A419-9574088A750B_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmA+t08PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKMPcP/iragrQDG9fHhAhGaOLXryO1NDTUnr6ZKG/E
wyWsTmjtZx0bbypoiil6dpZ64CJYMpFSNYg8Ric0xM365ylSNmNpdCGA+D1Ilwxg
ghSiI7u9c2nNvMH0v79CQ6QKgU14dCYzZY7+Wy3z8HY8kdLOrLx3hOKNB7bjdlVu
V4bKKWhsdJpIGgbI9RnKzzsI8GI2/OASdR9X7vXlqk8eL+LtGud6T/ZjS9XzogSz
QXOoaGVVQ6VwOsA/L4lfBE+vQnLQMEYgSFXgMPhUh38Ku8pujjkJiuCLngKGk4Yk
KZrFzO94kgpdPpcV/9l6SD8tpFNI+qDSylDw/jNNgKz+NHY9r5XOKa6Tare7u4jc
wF30wUbpx+b4U9dxfi0CCfKKckbY8u4+X2PF12+V6KTNkW3Zl98tIYebZsczR1pd
bc1iPwRXM0bNbi6L7jaSHGhgTx3329NR2NVLNWRNiTO1KgWq7JOZBN+sSEZ3U1kO
XGkKhAwYIfE+R94oekR0wcxOzpeU3Ah1vXHHeki+LeExiML0Usz2NFqknNbdp/UO
ETAr7hDX3sTUu4OALPNfUA8AEyDt9m4Ea1xwE7FXRAEJPBmHboty1sC1/xkgb22C
zDz62isPdgZD5PhRf3jvxEKF/KRfd4S9Lpe6IWKv+wLeNauHRhWr018tz2AMkeFy
EFG3uxhp
=tDGm
-----END PGP SIGNATURE-----

--=_MailMate_6AC1FF45-9158-42AD-A419-9574088A750B_=--

--===============1677972144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1677972144==--
