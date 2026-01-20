Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A29ED3BDC1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 04:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437610E54D;
	Tue, 20 Jan 2026 03:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RTv4TyDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0AD10E0A8;
 Tue, 20 Jan 2026 03:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBdhBJfZq4Wxak7tjKaAfopsf34wdy3UCd2oqpvtxvJUrHo8GlCxOLjCqyT3+0LpJt8KAjKXavXWd+Vsb3zDst6tYH2h9bq1S98/4J4oMsaCTMhU0MpkJsOOP1aczAhLLb0Mt1j4utfI35DZENmRJ6F7K0JScJUGkVRpzGBjCLmjxmacGNdgtzk51qamJiICXKKu1nbxAjCihHhe7/q5GgNA6PpqDv8959rxbevx5YmE73c0iC6ime6t2Yaeb10hYTBcOVgC5jHKMOMshTUVfLWp2v95k9V5s3QcqRjrlOBeP5PaAtLanjNU7U8AyqX1VixmADR2FZft3sEl8ymaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifspOPvAHjHKumkbivxuWVDY4dH23AyrQ1x0wCeSl64=;
 b=zF6CuOa8F6QGHuOWXPQmad+020WjuoikQWuidMtHPEBdKsh4EL6AaHf6yWVRBYuJbX/59cVrgx4H9aV320xgVJeAO/oF+v7freOaEThWiYWSh3+Gd23X5iTpSKe/M3a3CnPBRWLUqGQBaFUm7CsFdDJo+W1f9Dhg46qlvzFsxQAHI0gl04zVXbGTB7EliNF3N/p34LsAVGEl3lfu/mScIt/wDWfEC8CzTAhKZmWaaPB+JdkrFptfGpHYRXxaEAArwBu9U+48Z2ay8BUPKx3r4K7AIhwVPYAQ3PcJbfy8bgXnIeq42xwc1XNK42dSIssaukMWbuXL/hRycSw/W+23qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifspOPvAHjHKumkbivxuWVDY4dH23AyrQ1x0wCeSl64=;
 b=RTv4TyDVNI6RFPgRL1p0CqxhK25TLZCM1m3ychl0DD2G7+vhB0lRDLXjW2nQOaZzm+Y3aZiMklqr4SnIq5Wh7MnOtJmP1yGCcZydGNYt4IA9QR//81SQ6iMnm27Bzxv7C57N9OBEuu3q0w+Z9+EMUA5CJ3jUMqrUqGEKtPJ0EQ6uTKrf9eTjEyhAEurGrIyYigE3bBYcn6C75wZNLOgIHopAcxDscE9oHcCzz3A1ItGPWw+yGXUGtKWfbSHNlSUahqgf993cFyBOE8wirRi7zwqJPHIIvo9VDrCwb5IctzZxvbYvlf7ms5SGAhXpQHVyKKi/dIMo2P+SAnj054faVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH0PR12MB8461.namprd12.prod.outlook.com (2603:10b6:610:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:00:05 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:00:05 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Benjamin LaHaise <bcrl@kvack.org>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
 Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>,
 "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Carlos Maiolino <cem@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, David Howells <dhowells@redhat.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-sgx@vger.kernel.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-aio@kvack.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-mm@kvack.org, ntfs3@lists.linux.dev,
 devel@lists.orangefs.org, linux-xfs@vger.kernel.org,
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH RESEND 08/12] mm: update all remaining mmap_prepare users
 to use vma_flags_t
Date: Mon, 19 Jan 2026 21:59:51 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <34F72E48-5F22-4A20-BF32-917CDB898164@nvidia.com>
In-Reply-To: <24317e6f6b71e8b439e672893da8d268880f7ada.1768857200.git.lorenzo.stoakes@oracle.com>
References: <cover.1768857200.git.lorenzo.stoakes@oracle.com>
 <24317e6f6b71e8b439e672893da8d268880f7ada.1768857200.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH0PR12MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ff9f82-4c70-4599-06a7-08de57d002fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o6u8pGL/yFCvatiUOrPflzcBl3TmfzqDyeHJBJDRSNQEntPYpPaVbUil6NvN?=
 =?us-ascii?Q?kpmbdniDXi7KPGwbZTXOdVDRuY8n4jQGX9thWhtkDTXEppUWgxpdMGH1Qvxd?=
 =?us-ascii?Q?UFyZOlRp/bUX9IFBaZIzqS67dQwtPTtvDRqiSldCXxzPAy0LCJYLyCnMNrfc?=
 =?us-ascii?Q?MexbsCYMsqOaeZCD5L5LwiaR3Qq8fI/R70bcPaEPb+RVYUB9EOHemjFJmLcq?=
 =?us-ascii?Q?+fqTbPrIevdbB764L5Z9h6xmiBDSBUfuDV4IM5dJu8MXLg13yra5dqsAlYaf?=
 =?us-ascii?Q?MEJcNSchj2/czLrLSs84o292XUfPj43O0QG1jAAfksUCFc3tc6BRFPml38Od?=
 =?us-ascii?Q?drFFdohfJX6vmaOkG3emmkVzJU0bWTAFTcl/ReV5ryOgqaGl5yDbJDhUERqt?=
 =?us-ascii?Q?CyyAv65F6e0UEectKUZjpDj3vm6zmNCrjBnTooMNYI7kSRNpWtGMt1sMU0A4?=
 =?us-ascii?Q?Ivj+PNHX4ectUFl5/AsAI4pMUHpm8Aw9uFBbg/JljQGVorqYeG007T/YsQVt?=
 =?us-ascii?Q?lBBTfJmmaf1sBE4j5VJghl4TcadX3j2vQGeaeuOuQPr+2dOpHs+6YzDUGGNi?=
 =?us-ascii?Q?hCzeEEMvZBclxLWustXQw0Mc9RSDHaU/jTT7j5/GEmjb1sJgXdUZnvudaTVk?=
 =?us-ascii?Q?utiKrDC27z3CRaGaDYrRdUigx0gDte8TPAI+EifizyhmzNTiiZ8xvI25r1ct?=
 =?us-ascii?Q?hMuu9WviCFlIbH0Nk2hOa4uZ5HGyj5kmhcOA6wntdia6cc91y3Z/tqWvU4hn?=
 =?us-ascii?Q?Rguvs6tXmp+cMPHgFV0UiZ3okaF5QyQUeNmrRObjHxqeByxZwoqOi84dEsWk?=
 =?us-ascii?Q?uii4b+4Gy/ELFZGLBoWUjTDZRWP5uX1Sl3bV1Nttgifqm4FswwBHvaNBSoo9?=
 =?us-ascii?Q?aPTZYAC4dfmHRWVNbruD5HF6eqUgZHAn8Ttgi2kNG1jx9auDfaCWIBApm3fF?=
 =?us-ascii?Q?T2NJATQy5chzNV1kG5IbpQluEvBxRGlUVQyraKZuvcsPSGTp94eZCGP9UYnY?=
 =?us-ascii?Q?2pbqs1O+ZXt0XaXTza9iu2aahHl8x7h5fT3czgwT25toAvNxZ7OI6lrft4sq?=
 =?us-ascii?Q?SKaUQvoefF/xaz9wLzwCwg1dED6MQq2E6mBgkr8GIwkD8S5C5VXyVom4b8kP?=
 =?us-ascii?Q?1wWZCWaqCuMvlC4SOxsmN9Fd2K/8tlfCga6a5l/h5Ksj+S+sdbUCpK+M3mzS?=
 =?us-ascii?Q?xcMLxqfH9Q37sP562iNcHj733jP5A6chibJ5JA84YHTh84I9jIwenjqQ0GTZ?=
 =?us-ascii?Q?v3ezLwf/9gfM5/1DnKLEQUFuUBp297mWh56pV9NfDlZH+LrTJgOtUtWS+3CP?=
 =?us-ascii?Q?Fi3L15Qw62Vaz1sQEYup5eXBekq6sV0XfsTtwOrq2myoGEifh4eLwVqYo563?=
 =?us-ascii?Q?SqDVUtTrAcpcRb7MC2OICjsID4oOcmcLY9q7d0MRmOcifOM+7NkhUtcK5+Q7?=
 =?us-ascii?Q?amY6x+3HrsAvhOm9dGF5FQlhG4AEFCYLSyPe7t6BQKhC6H9KP97OGo4uAdOo?=
 =?us-ascii?Q?df8NB4hKka9nt3al52sPoFlx8iZWC+okYvXZNUU/9pOeroxpZ9F7q/uFafVj?=
 =?us-ascii?Q?vhA7nLr29yRO/zcFACc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jM1KVFEnXvSWWuDyNmgus2UW5CEhX/YbAcoXtiWiKhOc/y8YvPLjkVa3xAvw?=
 =?us-ascii?Q?HKXBml1rRutYzvKKGU63F/FdqlljkIuicghrrReyfSb8NVAoyyERiQ4MI1Kv?=
 =?us-ascii?Q?Ec2X6hwKWa0kaD9KnDqDbg7JdiBtHo47PSEMIbp5jRHd5+ihg8cMVfAQDeq7?=
 =?us-ascii?Q?4DqWtTYxpG45orz/Ge4C1Bhlv4p9GYvB4czXqzmpXUvrK639Yrm/BXVqf8M2?=
 =?us-ascii?Q?7j1ZwIRoWhDC5PCCDIjtKTRvEV3B5CTPU8BHMLlG4gsuMt138xiuhoOnWoBV?=
 =?us-ascii?Q?yOVNF2amGkBqDapr7Q8D2WWD2dQdiK3WUP2uCp9h/Azc6X7OvkfqIkCQdY1B?=
 =?us-ascii?Q?2dWgXHah6k6LfYWvUPbf/FXQIdUDXI1w2KWfKDq7OQVcBYFXI8PrWI6MArlC?=
 =?us-ascii?Q?LUJbTY6z7lY60QgMkp+Cjecoxj9OoDfIqYhil3VGT8Gz5uyYZg3pO0EeQLmb?=
 =?us-ascii?Q?dcpLqAHJsRfWBS4MxmVSgxElG3BXvm9YjSTnOX41q3jlEI6C/JY5o5K8sbDP?=
 =?us-ascii?Q?sabPbUgzuwFtZCrNa1rwWChq5y1M/syEixb5iTtnO0JI0eKM7SirDFQOnpMb?=
 =?us-ascii?Q?d+WOzs1CU3A5WgLm76OCdPUdgS9eShvjDaOvn+2bXIjj4Eb8zvBsbz4gxUQP?=
 =?us-ascii?Q?Tu+IvX3CrJ036G3WaPyVKBQIpKfqEa+nkn8qcfr0Lrkx01TI2tW/5tuxLUBM?=
 =?us-ascii?Q?ObtOmux6RQ+Uqj+S1t6vsA+2kPNo2zVH03CSpAG/1NI73sXHAJg1Lxewc0Ok?=
 =?us-ascii?Q?5piqvA+7XWoGOUXEvwOlEvFS0uJ+a1T2/LXCCV1GQUYoWb857UfK2ELobI0r?=
 =?us-ascii?Q?bJQfIPkddNYRCXGwYBub8rIZ/ubHf6tW5ct0Znr8JhWkSbzsS4DU2MDR0gyx?=
 =?us-ascii?Q?fb/mt7nyCd/kKNh69FeQPmfxi4hG+Rw9fyf+OHX4zarNsHJUTR0SEUPaXUyV?=
 =?us-ascii?Q?Zjz5WeLezEwrg5xNUKRtbLvmKVLjov0008gVvX0z8cszLWH7xMRPhwzEw8/d?=
 =?us-ascii?Q?PR+D/m8ll9vvs9UrHiBwHlUPSKmTFy84JyxRI2foFltMQLiSiJ+ITjF6gEFw?=
 =?us-ascii?Q?dHDq4fg6P/jdJBRG3+NfLoZb7rA2lnoDGofRVTUbEz9e+XdqPJvNm0sHDVkM?=
 =?us-ascii?Q?BFLApngnYlQF8VF1/nTjYb26OJvmiKP4QfUaGe2ZodD1my5zJesbDbLyvtAc?=
 =?us-ascii?Q?skOhCiV+L480gWzCpqJFW0uYToF6XkCYEShm2i9xTYmL4NmDNcH7Cyu7M2o1?=
 =?us-ascii?Q?ea1n+RWdsDdjleOWqCL1RMCTiK7hnFYTJZKJZQitGHbS/untWr1M3Mj5fVAv?=
 =?us-ascii?Q?/Cn2+EsgEf0KZoIKzW0vWndZ254RdjySA+g0IMLxZyiLJIHXTTGYlL8w2rV7?=
 =?us-ascii?Q?NyZwq2IM8NTT5USI4ZZfav/NZWjPTH22osxSlvmrhpVsVdMAZVI3Kq5G7/Lg?=
 =?us-ascii?Q?FKNFt1wDwGoqUJqOTGTVZUUW/f0rs4JR0+w/YYszh4n1WzlfChI3MmTgFawJ?=
 =?us-ascii?Q?bWfz2EwZGsIKH1rHlE1i80i5Xxu41KeTmw8p3RcAghxkewHEVcC4hUJM/An2?=
 =?us-ascii?Q?OAbEXBU8jEvqQW6sKx7GpLL/gExg/2lhI6WcOD3R97TbdVCffpXbB8d8JnsJ?=
 =?us-ascii?Q?6WlhQ5wrlUncH2ydmwDFKQnAejFCI6sJnO/ohcdndz0bTBYjG5e3qtzgocAs?=
 =?us-ascii?Q?1NzrTuS/BNJNkBsbdRWGseIblck7AHXYb60ma0LcvMo6BkmN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ff9f82-4c70-4599-06a7-08de57d002fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 03:00:04.9626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXZQrpVwbUMltY4PA6HgiQTPadV/zydOLSvwnlPlZtemGz7wNFN1SHYYusXBQb7V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8461
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

On 19 Jan 2026, at 16:19, Lorenzo Stoakes wrote:

> We will be shortly removing the vm_flags_t field from vm_area_desc so we
> need to update all mmap_prepare users to only use the dessc->vma_flags
> field.
>
> This patch achieves that and makes all ancillary changes required to make
> this possible.
>
> This lays the groundwork for future work to eliminate the use of vm_flags_t
> in vm_area_desc altogether and more broadly throughout the kernel.
>
> While we're here, we take the opportunity to replace VM_REMAP_FLAGS with
> VMA_REMAP_FLAGS, the vma_flags_t equivalent.
>
> No functional changes intended.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  drivers/char/mem.c       |  6 +++---
>  drivers/dax/device.c     | 10 +++++-----
>  fs/aio.c                 |  2 +-
>  fs/erofs/data.c          |  5 +++--
>  fs/ext4/file.c           |  4 ++--
>  fs/ntfs3/file.c          |  2 +-
>  fs/orangefs/file.c       |  4 ++--
>  fs/ramfs/file-nommu.c    |  2 +-
>  fs/resctrl/pseudo_lock.c |  2 +-
>  fs/romfs/mmap-nommu.c    |  2 +-
>  fs/xfs/xfs_file.c        |  4 ++--
>  fs/zonefs/file.c         |  3 ++-
>  include/linux/dax.h      |  4 ++--
>  include/linux/mm.h       | 24 +++++++++++++++++++-----
>  kernel/relay.c           |  2 +-
>  mm/memory.c              | 17 ++++++++---------
>  16 files changed, 54 insertions(+), 39 deletions(-)
>

You missed one instance in !CONFIG_DAX:

diff --git a/include/linux/dax.h b/include/linux/dax.h
index 162c19fe478c..48d20b790a7d 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -111,11 +111,11 @@ static inline void set_dax_nomc(struct dax_device *dax_dev)
 static inline void set_dax_synchronous(struct dax_device *dax_dev)
 {
 }
-static inline bool daxdev_mapping_supported(vm_flags_t vm_flags,
+static inline bool daxdev_mapping_supported(vma_flags_t flags,
 					    const struct inode *inode,
 					    struct dax_device *dax_dev)
 {
-	return !(vm_flags & VM_SYNC);
+	return !vma_flags_test(flags, VMA_SYNC_BIT);
 }
 static inline size_t dax_recovery_write(struct dax_device *dax_dev,
 		pgoff_t pgoff, void *addr, size_t bytes, struct iov_iter *i)


Best Regards,
Yan, Zi
