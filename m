Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42493C718D2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 01:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B2B10E6BB;
	Thu, 20 Nov 2025 00:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DxuHy5s/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EF010E6BB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 00:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jb1RIy4bxyLy+nC9k1g2nNO6ddyu49eDaH5UtSVKTdpIYkBdWV4FHeF3dkJ19V+G6ScFLLEXdzf6ukNWbtSpcxFhQHiG7kPDVV9LOZGWFGjxBf30uNIh+H8mBjZWHbDTosbPK7bwSD9mqR7Lw/nzTgdzlAZ6bCj/Y8rWDdnSk5rO1DAAEwZoNN4HgPDt4it80MRRigqT/X5VOa9Tw7zXTGmoMAtOjgcq2WlfWi35Oz0zCGdtYS63sfXIux5xExoDhoer+YBz4C7qrb4mFS2SNB12n4QINRY0sE9RMrR5aKo0LRik+e3udGvEPJiUVOGSi/7ddpjZTQgdPD694Gh88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9VhusN2Xu3sP0OFXQou+GYanXAxw9pXfQ6AwdiTHYQ=;
 b=LYA/3kzL+v17BoroLNGtSnLJdYxrgzLVBUCkcD56JQ6SIOUDUU3P5ut/kpp22M4gy97PWM0Mj1RoVSmClAQCWKuLKgq3W5Oa23KcpOmRTXg7YcTS0Gg2qZZFMw6mD475IIj451NASRw8Wo380z7eyU2a7/+IWt2JLQm94cGF9HLOpJD1nhmORUb3/VxkJ8lcM9XZEYt0paYNN7zFTShLM6aKldx2kYIr40NHlUNWmzxVyF7Rb5p3b0m5GvO62W2LHAgYsizWtQ/JX/QLD2SGuBRzPTCeGofMqzDVR+6PA1PicwYXzqetcltREhhRlr/SS7lzk8H397VvaooONaDphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9VhusN2Xu3sP0OFXQou+GYanXAxw9pXfQ6AwdiTHYQ=;
 b=DxuHy5s/ictxZmGkBgq0uLNRDKqHQCimdQoZbtQPJ7a/S9Wkyu+h2kKu+jeJ1VPeKoFuNcQMC0xNMkXFiPt9MDZDOnQkzFW1g91tjl7lj+tzhm5hBorqo8mr4rXaVbgoeBycYENjEMEQ8ABKome70phTZaBJdL0sDhkMvS5V4n3hIFxr67Sa0NaP4Asf0CbTwa9FYQdvNqiPP+NvIon+eb3U7fKCDEPJKBUrY8WIE7ffjwOs9Umh8hod8ObG7KThFD7VXitKWCdLjXIRzDk9mmJLC3C1JFR9iwHJ/hbdxGZ5I4TxdM2mLXkm359Q2RX7fk+CXU6HMWE3oexKu8rgLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 00:29:51 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 00:29:51 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
Date: Wed, 19 Nov 2025 19:29:44 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <162AE429-9D4E-4280-8349-2C545D03D182@nvidia.com>
In-Reply-To: <661d1f3b-0f04-43fc-85ef-d29d492a2b06@nvidia.com>
References: <202511151216.rhK2ItOb-lkp@intel.com>
 <661d1f3b-0f04-43fc-85ef-d29d492a2b06@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR16CA0066.namprd16.prod.outlook.com
 (2603:10b6:208:234::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: b581772d-5755-489d-77a4-08de27cbeb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0sMzH/JZYqJhIQNPKLzbeblRHAIcHktyeGySm7YPVGqDCZI05/KHjPceU5CY?=
 =?us-ascii?Q?K2hsXapNCq6JSINRa6NkwksQpuVNBjeDI7I3njg0D4VypeDVgDRvI1vuDqxK?=
 =?us-ascii?Q?cXyWrzDKL0JD/gVIQDuLxCTm3MvYL5S7yN4vDVNHhXo4JWDZPw2Qrw5cEaPL?=
 =?us-ascii?Q?uN2Qg44a6yUxEjklM5ixPu57+gvlSuteVwYSZLTrYcABwvI3cK/89nB0C/1I?=
 =?us-ascii?Q?Yg3qcUapLSVoBcSLbplw1eaVylDGwWK0xQhYWjxTbA5zIZGMQxIos1sWCR33?=
 =?us-ascii?Q?qofB9QTSVm8QYQE/V9SketZIIBSirYKHD8T/X3GnNxYKcScCA36bBXa1crI1?=
 =?us-ascii?Q?PLFwUTCFtL97wvo6mckid0BHY+ZBny5SSwKARYBTpliP7wYx1qkxAt5FiIn8?=
 =?us-ascii?Q?PC4V5kQpTT3pHpYfvUfCoIvRVrV6R+beekJdENkmYt5YYgJcYvpTAjT5F6Uk?=
 =?us-ascii?Q?nBU/gOdJ+L7CCwmvu8FTw0BS4xQIBkk1Dvl6noNOBTMUP4a4LPNUzreChU5I?=
 =?us-ascii?Q?ySc2iSRsw1awrJQOv72qcrX/0rs4LgamR6w/uzbPm2vr1NNDzhKnteQYP5Ey?=
 =?us-ascii?Q?7g9m8+63Mq+x7Fd1fsFJJoyewCofZRSQbUvGq6E7y3/sb/JTL+TRH1j7i5jA?=
 =?us-ascii?Q?LLqZvwZsTU7Hzhn9v8+wy4uNcDxScPSKqWww6PcwvpoASnSSFw76gi50+UVZ?=
 =?us-ascii?Q?10CJolsySnoECvBEf+rmOz4DegYTUbewLQlwlqQ2jAJG1p4/XzDBvYQpPjng?=
 =?us-ascii?Q?JMkN6q/549L0uwWsK/m63QoZi6qlm3NpnKOfRbftMIpMddrXxnuCLF53fZB0?=
 =?us-ascii?Q?29GWdDieRWw5RQfVxYl5VxZvqbl8pXLCKjInlI4YW1R04IlJcIGFNxtBgwW9?=
 =?us-ascii?Q?qOKqXDx3jYX7rK2IgGtTcnzKbVTVDmfzjp9M1d5tVwkiSKhRdM1LM/CceWl6?=
 =?us-ascii?Q?obqTGxkrg1wF7KFo6MJ/2gHxtvn257kYsKHQRrWO25vmGA7SI/Xc5sLnP2T7?=
 =?us-ascii?Q?GaypDojtD9PPdcAeuUiSr5UMxXducjoG+/kajkGP8JcrD4Was10BZ+ILjZwP?=
 =?us-ascii?Q?M0iAbGiyKlT93SPiMCYgBtCEAfXacxZ8LS5K3GDTdjOq7UF1ADVm//7Wze66?=
 =?us-ascii?Q?4KnJNxUmy6PqtBD/9A43DnELDBMrolrb++NdZarVRDPeeBFyDvYQjqxT1Qu5?=
 =?us-ascii?Q?KHDAToDlxeg4QVR6ex8G68zX8gQRrq2hk6NdEAGb9bLZnDQReORxqsd3Vp4I?=
 =?us-ascii?Q?2v1EygQVsYUfRwvyZi66SgG+DiR09Jp8gTsahAIO7PMJ3PbfrvEqFnW1acOf?=
 =?us-ascii?Q?shhLtsrk2dQ/xrhzusupZMBRzh+MCXqFGJYTHQ6pah1u/FY5kfaTjUs4LGKd?=
 =?us-ascii?Q?MRHfyICE0U3IG7abC6o+6+yYUKvvtIBUcfWmf1jDQxbbBtLzIB1zodbP6yM9?=
 =?us-ascii?Q?hOsrw3+KolNFeLiQYCxrMuCLdolor7SZIWH8jZXGrk1EyEmjFH3fPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b4wpVzDsWCk3qsvvbvTlnbx+t7v2y9MetqTfst5+Wn+En7tY5zrQ/u3Tt2+S?=
 =?us-ascii?Q?w+EuhmTNnbqsSuQ8PkuhDbtapmUCTQhwaKM1IEoq0NIpSvXjbobvdWzBxHnf?=
 =?us-ascii?Q?fM7ZH2Rd8jGRn98Sdaye0mhC8LcT0UBaxR0cV8bIYOwLebfUPk1G/sMGwCZy?=
 =?us-ascii?Q?i3GtnDx0jiQgQdlPlPvcnmgbtl6iH54wRqI0/hQNZpL79SCZwKd36QYUmjsw?=
 =?us-ascii?Q?0Jvpx2WMu0/XztGwJKm4ZWhXHlxwPdSlpVFSxOBvP+YStuV95Vluhow62RIO?=
 =?us-ascii?Q?o7IhbugBt2y+qqCmQ9tAeZvB0hwbXFju/784XSoEgBr7mqEaJ26YeDnWNamC?=
 =?us-ascii?Q?KM6eUTrfbMg6gbvMsKsvb0NWIFtAIqVYvpJhCr9ny4LDxc6lEe7o02yJFiON?=
 =?us-ascii?Q?uVjEmXqmOxOU5FX4ckFxtWFc1bnX55eX5c7zmHowBMRVKwh5dF3ba13PgOFC?=
 =?us-ascii?Q?U+LTC1LwSGIfAvFPcVqUS+wEND4zFa44vmNQjCMDCXDcYRw0imZoFrqiqplA?=
 =?us-ascii?Q?pxnjwEn7egduJ84loQl4P+ZSMQPN4YxYZcgx9u+SnZjRCILovLU398CjgPcx?=
 =?us-ascii?Q?5OFOwp2SrNuzg3bobqi17enMygRFCiAxK0Wdo842Ng0a439RxTXA8rQte1rv?=
 =?us-ascii?Q?HTabNDmMUZCCvZP77Oghtvu7/H95JNcb7x6dkX2pdelmCH6iHCvby+pink3I?=
 =?us-ascii?Q?GxcowCy9unwtBIXo8mbKycQd2QB2KoV0mOilviskndC07LZ1kaeZsBLzT7dA?=
 =?us-ascii?Q?/lKhjzqCpjq8RKxA8cviR6gDu62HZL3sV20K4G95mjCPsY/VdKWMa7pnRFhh?=
 =?us-ascii?Q?lk1F7CJMdMyvFGdDhfpu1/KT8cbvZXZFaqb+1+Om0UvLTs5bG6iQwD6nz7qT?=
 =?us-ascii?Q?+doooTi9Y8VzdFpin7QbOdf09O0oCYWeFsR0RFAw+xg2Hkms7Zkw2dgUqbHi?=
 =?us-ascii?Q?k4JvY2mLIO7ld8tzqI44pzccWIla5jnB7qGqaGtjYsox7KaEbDIEEsXtMSH2?=
 =?us-ascii?Q?4i5WgXkqP1d6eVAX9dEQiBZ8hY0vdSBjDarlXYfXpXoo3PzQBuenD5xO38Pr?=
 =?us-ascii?Q?s+LaIHu9AxD2smuuXRLBZUg65bsO4Ub3Ro/tX/wUtIaATzXOmXfWOcpoO17k?=
 =?us-ascii?Q?ZELMyfrccyPBYPqK1579WSfaLx34zAkBKY3PGS8mhH2SW4tuDkub4BJ+JCIt?=
 =?us-ascii?Q?Zk1T48kdDE+rOXoTtk+d+QBy/vISGlIYcIdrlPpcpxn+kZN70PVCuNtF9Fp5?=
 =?us-ascii?Q?kDQk5CFMMn1hc4RQrS0j7rWtGqFDTrtS7A+P2gW4ypYYQn+cHe0/5imMGYcm?=
 =?us-ascii?Q?PhoBxPtR5gXxGxb7y0a+YeMSbpPF2iv2xitEGKAKc/Z1OhqJ0fn5otGEj7kt?=
 =?us-ascii?Q?y++IcC4tvwkd+IAFMct0k7KX/CV0VopVBU+bs5urL5fcpaV3og9XV+7ZsSJA?=
 =?us-ascii?Q?qjt9y1F080bhFlya4sOqt++Fu0u+MsOFP6+lj66iyIHlmp8azWnh8VcZqxcA?=
 =?us-ascii?Q?MZlBw6cGNm0YvyX+z7bAalQ0GfoXcLxm00ljIEUwLNBbZit+npBfrLonOSJx?=
 =?us-ascii?Q?dW0r7MDvCcR2oFAkW7iaYxW4xzv8ZA1eGb5Zvjt5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b581772d-5755-489d-77a4-08de27cbeb33
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 00:29:51.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYOAJ5wx93wudm8waXp1gdgYT0G0A6bJ83FvfAZfdL6VJvbs4YWlxySvc9CGEGPf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275
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

On 19 Nov 2025, at 18:58, Balbir Singh wrote:

> On 11/19/25 23:32, Dan Carpenter wrote:
>> Hi Balbir,
>>
>> kernel test robot noticed the following build warnings:
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm=
-huge_memory-c-introduce-folio_split_unmapped/20251114-093541
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm=
-everything
>> patch link:    https://lore.kernel.org/r/20251114012228.2634882-1-balb=
irs%40nvidia.com
>> patch subject: [PATCH] mm/huge_memory.c: introduce folio_split_unmappe=
d
>> config: i386-randconfig-141-20251115 (https://download.01.org/0day-ci/=
archive/20251115/202511151216.rhK2ItOb-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> | Closes: https://lore.kernel.org/r/202511151216.rhK2ItOb-lkp@intel.co=
m/
>>
>> smatch warnings:
>> mm/huge_memory.c:4044 __folio_split() error: uninitialized symbol 'end=
'.
>> mm/huge_memory.c:4052 __folio_split() error: we previously assumed 'ma=
pping' could be null (see line 4046)
>>
>
> Thanks for the report!
>
> If mapping is not NULL, end is initialized. More comments on UBSan belo=
w

Maybe initialize end to -1 and add
VM_WARN_ONCE_ON(!mapping && end !=3D -1);
in __folio_freeze_and_split_unmapped() to make static analyzer happy?

I assume end cannot be -1 for file-mapped folios. Let me know if I get
this wrong.

>
>> vim +/end +4044 mm/huge_memory.c
>>
>> 6384dd1d18de7b Zi Yan                  2025-03-07  3908  static int __=
folio_split(struct folio *folio, unsigned int new_order,
>> 58729c04cf1092 Zi Yan                  2025-03-07  3909  		struct page=
 *split_at, struct page *lock_at,
>> f6b1f167ffe29f Balbir Singh            2025-11-14  3910  		struct list=
_head *list, enum split_type split_type)
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3911  {
>> 58729c04cf1092 Zi Yan                  2025-03-07  3912  	XA_STATE(xas=
, &folio->mapping->i_pages, folio->index);
>> 6c7de9c83be68b Zi Yan                  2025-07-18  3913  	struct folio=
 *end_folio =3D folio_next(folio);
>> 5d65c8d758f259 Barry Song              2024-08-24  3914  	bool is_anon=
 =3D folio_test_anon(folio);
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3915  	struct addre=
ss_space *mapping =3D NULL;
>> 5d65c8d758f259 Barry Song              2024-08-24  3916  	struct anon_=
vma *anon_vma =3D NULL;
>> 8ec26327c18e1d Wei Yang                2025-10-10  3917  	int old_orde=
r =3D folio_order(folio);
>> 6c7de9c83be68b Zi Yan                  2025-07-18  3918  	struct folio=
 *new_folio, *next;
>> 391dc7f40590d7 Zi Yan                  2025-07-18  3919  	int nr_shmem=
_dropped =3D 0;
>> 391dc7f40590d7 Zi Yan                  2025-07-18  3920  	int remap_fl=
ags =3D 0;
>> 504e070dc08f75 Yang Shi                2021-06-15  3921  	int extra_pi=
ns, ret;
>> 006d3ff27e884f Hugh Dickins            2018-11-30  3922  	pgoff_t end;=

>> 478d134e9506c7 Xu Yu                   2022-04-28  3923  	bool is_hzp;=

>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3924
>> 714b056c832106 Zi Yan                  2025-07-17  3925  	VM_WARN_ON_O=
NCE_FOLIO(!folio_test_locked(folio), folio);
>> 714b056c832106 Zi Yan                  2025-07-17  3926  	VM_WARN_ON_O=
NCE_FOLIO(!folio_test_large(folio), folio);
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3927
>> 58729c04cf1092 Zi Yan                  2025-03-07  3928  	if (folio !=3D=
 page_folio(split_at) || folio !=3D page_folio(lock_at))
>> 1412ecb3d256e5 Zi Yan                  2024-03-07  3929  		return -EIN=
VAL;
>> 1412ecb3d256e5 Zi Yan                  2024-03-07  3930
>> 8ec26327c18e1d Wei Yang                2025-10-10  3931  	if (new_orde=
r >=3D old_order)
>> c010d47f107f60 Zi Yan                  2024-02-26  3932  		return -EIN=
VAL;
>> 58729c04cf1092 Zi Yan                  2025-03-07  3933
>> aa27253af32c74 Wei Yang                2025-11-06  3934  	if (!folio_s=
plit_supported(folio, new_order, split_type, /* warn =3D */ true))
>> 6a50c9b512f773 Ran Xiaokai             2024-06-07  3935  		return -EIN=
VAL;
>> c010d47f107f60 Zi Yan                  2024-02-26  3936
>> 5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26  3937) 	is_hzp =3D i=
s_huge_zero_folio(folio);
>> 4737edbbdd4958 Naoya Horiguchi         2023-04-06  3938  	if (is_hzp) =
{
>> 4737edbbdd4958 Naoya Horiguchi         2023-04-06  3939  		pr_warn_rat=
elimited("Called split_huge_page for huge zero page\n");
>> 478d134e9506c7 Xu Yu                   2022-04-28  3940  		return -EBU=
SY;
>> 4737edbbdd4958 Naoya Horiguchi         2023-04-06  3941  	}
>> 478d134e9506c7 Xu Yu                   2022-04-28  3942
>> 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3943) 	if (folio_te=
st_writeback(folio))
>> 59807685a7e77e Ying Huang              2017-09-06  3944  		return -EBU=
SY;
>> 59807685a7e77e Ying Huang              2017-09-06  3945
>> 5d65c8d758f259 Barry Song              2024-08-24  3946  	if (is_anon)=
 {
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3947  		/*
>> c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3948  		 * The call=
er does not necessarily hold an mmap_lock that would
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3949  		 * prevent =
the anon_vma disappearing so we first we take a
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3950  		 * referenc=
e to it and then lock the anon_vma for write. This
>> 2f031c6f042cb8 Matthew Wilcox (Oracle  2022-01-29  3951) 		 * is simil=
ar to folio_lock_anon_vma_read except the write lock
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3952  		 * is taken=
 to serialise against parallel split or collapse
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3953  		 * operatio=
ns.
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3954  		 */
>> 29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  3955) 		anon_vma =3D=
 folio_get_anon_vma(folio);
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3956  		if (!anon_v=
ma) {
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3957  			ret =3D -E=
BUSY;
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3958  			goto out;
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3959  		}
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3960  		anon_vma_lo=
ck_write(anon_vma);
>> 3d4c0d98eb8572 Balbir Singh            2025-10-01  3961  		mapping =3D=
 NULL;
>>
>> end is not initialized for anonymous folios.
>>
>
> Yes
>
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3962  	} else {
>> e220917fa50774 Luis Chamberlain        2024-08-22  3963  		unsigned in=
t min_order;
>> 6a3edd29395631 Yin Fengwei             2022-08-10  3964  		gfp_t gfp;
>> 6a3edd29395631 Yin Fengwei             2022-08-10  3965
>> 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3966) 		mapping =3D=
 folio->mapping;
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3967
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3968  		/* Truncate=
d ? */
>> 6384dd1d18de7b Zi Yan                  2025-03-07  3969  		/*
>> 6384dd1d18de7b Zi Yan                  2025-03-07  3970  		 * TODO: ad=
d support for large shmem folio in swap cache.
>> 6384dd1d18de7b Zi Yan                  2025-03-07  3971  		 * When shm=
em is in swap cache, mapping is NULL and
>> 6384dd1d18de7b Zi Yan                  2025-03-07  3972  		 * folio_te=
st_swapcache() is true.
>> 6384dd1d18de7b Zi Yan                  2025-03-07  3973  		 */
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3974  		if (!mappin=
g) {
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3975  			ret =3D -E=
BUSY;
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3976  			goto out;
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3977  		}
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  3978
>> e220917fa50774 Luis Chamberlain        2024-08-22  3979  		min_order =3D=
 mapping_min_folio_order(folio->mapping);
>> e220917fa50774 Luis Chamberlain        2024-08-22  3980  		if (new_ord=
er < min_order) {
>> e220917fa50774 Luis Chamberlain        2024-08-22  3981  			ret =3D -E=
INVAL;
>> e220917fa50774 Luis Chamberlain        2024-08-22  3982  			goto out;
>> e220917fa50774 Luis Chamberlain        2024-08-22  3983  		}
>> e220917fa50774 Luis Chamberlain        2024-08-22  3984
>> 6a3edd29395631 Yin Fengwei             2022-08-10  3985  		gfp =3D cur=
rent_gfp_context(mapping_gfp_mask(mapping) &
>> 6a3edd29395631 Yin Fengwei             2022-08-10  3986  							GFP_RE=
CLAIM_MASK);
>> 6a3edd29395631 Yin Fengwei             2022-08-10  3987
>> 0201ebf274a306 David Howells           2023-06-28  3988  		if (!filema=
p_release_folio(folio, gfp)) {
>> 6a3edd29395631 Yin Fengwei             2022-08-10  3989  			ret =3D -E=
BUSY;
>> 6a3edd29395631 Yin Fengwei             2022-08-10  3990  			goto out;
>> 6a3edd29395631 Yin Fengwei             2022-08-10  3991  		}
>> 6a3edd29395631 Yin Fengwei             2022-08-10  3992
>> 3c844d850e4486 Wei Yang                2025-11-06  3993  		if (split_t=
ype =3D=3D SPLIT_TYPE_UNIFORM) {
>> 58729c04cf1092 Zi Yan                  2025-03-07  3994  			xas_set_or=
der(&xas, folio->index, new_order);
>> 8ec26327c18e1d Wei Yang                2025-10-10  3995  			xas_split_=
alloc(&xas, folio, old_order, gfp);
>> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3996) 			if (xas_er=
ror(&xas)) {
>> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3997) 				ret =3D x=
as_error(&xas);
>> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3998) 				goto out;=

>> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3999) 			}
>> 58729c04cf1092 Zi Yan                  2025-03-07  4000  		}
>> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4001)
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4002  		anon_vma =3D=
 NULL;
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4003  		i_mmap_lock=
_read(mapping);
>> 006d3ff27e884f Hugh Dickins            2018-11-30  4004
>> 006d3ff27e884f Hugh Dickins            2018-11-30  4005  		/*
>> 58729c04cf1092 Zi Yan                  2025-03-07  4006  		 *__split_u=
nmapped_folio() may need to trim off pages beyond
>> 58729c04cf1092 Zi Yan                  2025-03-07  4007  		 * EOF: but=
 on 32-bit, i_size_read() takes an irq-unsafe
>> 58729c04cf1092 Zi Yan                  2025-03-07  4008  		 * seqlock,=
 which cannot be nested inside the page tree lock.
>> 58729c04cf1092 Zi Yan                  2025-03-07  4009  		 * So note =
end now: i_size itself may be changed at any moment,
>> 58729c04cf1092 Zi Yan                  2025-03-07  4010  		 * but foli=
o lock is good enough to serialize the trimming.
>> 006d3ff27e884f Hugh Dickins            2018-11-30  4011  		 */
>> 006d3ff27e884f Hugh Dickins            2018-11-30  4012  		end =3D DIV=
_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
>> d144bf6205342a Hugh Dickins            2021-09-02  4013  		if (shmem_m=
apping(mapping))
>> d144bf6205342a Hugh Dickins            2021-09-02  4014  			end =3D sh=
mem_fallocend(mapping->host, end);
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4015  	}
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4016
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4017  	/*
>> 684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4018) 	 * Racy chec=
k if we can split the page, before unmap_folio() will
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4019  	 * split PMD=
s
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4020  	 */
>> 8710f6ed34e7bc David Hildenbrand       2024-08-02  4021  	if (!can_spl=
it_folio(folio, 1, &extra_pins)) {
>> fd4a7ac32918d3 Baolin Wang             2022-10-24  4022  		ret =3D -EA=
GAIN;
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4023  		goto out_un=
lock;
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4024  	}
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4025
>> 684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4026) 	unmap_folio(=
folio);
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4027
>> b6769834aac1d4 Alex Shi                2020-12-15  4028  	/* block int=
errupt reentry in xa_lock and spinlock */
>> b6769834aac1d4 Alex Shi                2020-12-15  4029  	local_irq_di=
sable();
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4030  	if (mapping)=
 {
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4031  		/*
>> 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4032) 		 * Check if=
 the folio is present in page cache.
>> 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4033) 		 * We assum=
e all tail are present too, if folio is there.
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4034  		 */
>> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4035) 		xas_lock(&x=
as);
>> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4036) 		xas_reset(&=
xas);
>> 391dc7f40590d7 Zi Yan                  2025-07-18  4037  		if (xas_loa=
d(&xas) !=3D folio) {
>> 391dc7f40590d7 Zi Yan                  2025-07-18  4038  			ret =3D -E=
AGAIN;
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4039  			goto fail;=

>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4040  		}
>> 391dc7f40590d7 Zi Yan                  2025-07-18  4041  	}
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4042
>> f6b1f167ffe29f Balbir Singh            2025-11-14  4043  	ret =3D __fo=
lio_freeze_and_split_unmapped(folio, new_order, split_at, &xas, mapping,
>> f6b1f167ffe29f Balbir Singh            2025-11-14 @4044  						true, l=
ist, split_type, end, extra_pins);
>>                                                                       =
                                                          ^^^
>> Passing uninitialized variables isn't allowed unless the function is
>> inlined.  It triggers a UBSan warning at runtime as well.
>
> end is expected to be unused when uninitialized, are you suggesting we =
need to have a default value even if unused inside the function.
> My daily build has UBSan enabled, I'll try again
>
> CONFIG_UBSAN=3Dy
> CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=3Dy
> # CONFIG_UBSAN_BOUNDS is not set
> CONFIG_UBSAN_SHIFT=3Dy
> # CONFIG_UBSAN_UNREACHABLE is not set
> # CONFIG_UBSAN_BOOL is not set
> # CONFIG_UBSAN_ENUM is not set
>
>
>>
>> 391dc7f40590d7 Zi Yan                  2025-07-18  4045  fail:
>> 6c7de9c83be68b Zi Yan                  2025-07-18 @4046  	if (mapping)=

>> 6c7de9c83be68b Zi Yan                  2025-07-18  4047  		xas_unlock(=
&xas);
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4048
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4049  	local_irq_en=
able();
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4050
>> 391dc7f40590d7 Zi Yan                  2025-07-18  4051  	if (nr_shmem=
_dropped)
>> 391dc7f40590d7 Zi Yan                  2025-07-18 @4052  		shmem_uncha=
rge(mapping->host, nr_shmem_dropped);
>>
>> Smatch complains that mapping can be NULL, but this is false positive
>> because nr_shmem_dropped is always zero.
>>
>
> Agreed
>
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4053
>> 958fea4c1e2eb6 Balbir Singh            2025-10-01  4054  	if (!ret && =
is_anon && !folio_is_device_private(folio))
>> 391dc7f40590d7 Zi Yan                  2025-07-18  4055  		remap_flags=
 =3D RMP_USE_SHARED_ZEROPAGE;
>> 958fea4c1e2eb6 Balbir Singh            2025-10-01  4056
>> 8ec26327c18e1d Wei Yang                2025-10-10  4057  	remap_page(f=
olio, 1 << old_order, remap_flags);
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4058
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4059  	/*
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4060  	 * Unlock al=
l after-split folios except the one containing
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4061  	 * @lock_at =
page. If @folio is not split, it will be kept locked.
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4062  	 */
>> 391dc7f40590d7 Zi Yan                  2025-07-18  4063  	for (new_fol=
io =3D folio; new_folio !=3D end_folio; new_folio =3D next) {
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4064  		next =3D fo=
lio_next(new_folio);
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4065  		if (new_fol=
io =3D=3D page_folio(lock_at))
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4066  			continue;
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4067
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4068  		folio_unloc=
k(new_folio);
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4069  		/*
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4070  		 * Subpages=
 may be freed if there wasn't any mapping
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4071  		 * like if =
add_to_swap() is running on a lru page that
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4072  		 * had its =
mapping zapped. And freeing these pages
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4073  		 * requires=
 taking the lru_lock so we do the put_page
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4074  		 * of the t=
ail pages after the split is complete.
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4075  		 */
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4076  		free_folio_=
and_swap_cache(new_folio);
>> 6c7de9c83be68b Zi Yan                  2025-07-18  4077  	}
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4078
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4079  out_unlock:
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4080  	if (anon_vma=
) {
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4081  		anon_vma_un=
lock_write(anon_vma);
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4082  		put_anon_vm=
a(anon_vma);
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4083  	}
>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4084  	if (mapping)=

>> baa355fd331424 Kirill A. Shutemov      2016-07-26  4085  		i_mmap_unlo=
ck_read(mapping);
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4086  out:
>> 69a37a8ba1b408 Matthew Wilcox (Oracle  2022-06-08  4087) 	xas_destroy(=
&xas);
>> 8ec26327c18e1d Wei Yang                2025-10-10  4088  	if (old_orde=
r =3D=3D HPAGE_PMD_ORDER)
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4089  		count_vm_ev=
ent(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
>> 8ec26327c18e1d Wei Yang                2025-10-10  4090  	count_mthp_s=
tat(old_order, !ret ? MTHP_STAT_SPLIT : MTHP_STAT_SPLIT_FAILED);
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4091  	return ret;
>> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4092  }
>>
>
> Balbir


Best Regards,
Yan, Zi
