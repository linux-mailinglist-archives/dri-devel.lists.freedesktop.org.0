Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C46B18B48
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 10:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA9C10E282;
	Sat,  2 Aug 2025 08:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PSIsFgI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D2810E859;
 Fri,  1 Aug 2025 14:01:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsqsH5pACeGuL8X//9JZXxmH90cEneVCWmdN9tfOd0M287DkasBJBoT3GkoMS2UDLBEuEITZSywqfi+8jeZCkt+cF/RnnNohNFIMJu9yc3USUVngxzalfc2xnwhoSyJ2MGNWjv1P1o7gOfW3nd7J/tB7TlMK7BZVTruz0Bgh4HPCPCMzMajPMu4yv1e221RE915KwZtTsqPxO0qoCiJofjscqnutoGOXWHbq08gV8YdDJs3dp72ZTu5Zr7L9iXsU4JpTcceMbiDnsQuZYMghIv778y4IXGMV9ruZAscF5iMrFD7rMkq2dk2i6MgRObaGb3NonW5OHoj2gLUj/5SF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt/M3svWgTjCDi1RQUj3qb7LyI/mcYjTVEYAqEdno7U=;
 b=DCVeD32an78Lsc/OZYYCg9BEJhQ2PS9n6Ditsp0BygV6ynendx1gmORd0b1jk2oIqodEiiP0+HuPm58ME3y9xMVrXoxrruLWmiqt78NWUvAYRmIhN0SPoKwTc67wsr60Xr3uB42E7YiRrGx5Hb4ACrJM2i84ilnLb6MfbMCkTMl/pb3rBezcaZEL2aYa27ZAxOs/LgH+9HUW56x87kb3qVyLgj3kDYIapGnjc4VS6zXLhYyra+l5MLarMVuZNN9I+sSx27caUqWVwGcng0gRHaJhDUzvFW3Oi/+tQZI8ZP8oCH54GMg7q82W7vYCAqc5BWFjhFPEB/Lh7lCVwsUyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt/M3svWgTjCDi1RQUj3qb7LyI/mcYjTVEYAqEdno7U=;
 b=PSIsFgI01jAoPjZquNgONb4yDHpG2Knko8cNfxBOLSJsIHKiGgRA295ICK3zIPXHo0B4iKHnUEd/yEBobrmnAqfvhrT5ntL29zfkQLH9usVmDeUDM6ZqsEdehRVRQPguctFrIzBMLQwFMuuyZhpw38M2Wyv4lO5guZ1OGUBm0hBvGz3MrjSijFJ6bH8aBQPkCrl7jTzr6jGgm5cX6+koRdKpFUlW08PQLIqUbkEuKwvknAVbbA+tC74dcYUPUaTu1UtaYUXJWsa1hfO9fMBSf3OxUYHiRCfPXxzLAbJBGNhLSdB+x3KPxlu3JT5zr+tLvngwAKApxrfJFW8lalXQnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 14:01:02 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 14:00:58 +0000
Date: Fri, 1 Aug 2025 11:00:57 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jens Axboe <axboe@kernel.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Benjamin LaHaise <bcrl@kvack.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Amir Goldstein <amir73il@gmail.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 Kees Cook <kees@kernel.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Yangtao Li <frank.li@vivo.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Bob Copeland <me@bobcopeland.com>,
 Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@manguebit.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>, Carlos Maiolino <cem@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-aio@kvack.org, linux-unionfs@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-mm@kvack.org,
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-um@lists.infradead.org, linux-mtd@lists.infradead.org,
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev,
 linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, nvdimm@lists.linux.dev
Subject: Re: [PATCH 00/10] convert the majority of file systems to mmap_prepare
Message-ID: <20250801140057.GA245321@nvidia.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: YT4PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::8) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW3PR12MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: a37152e6-539f-46d4-6f7d-08ddd103d734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vI39CfqqpciPkPsBTDxIc7hsYNEIQLOLncZOFwL5irNaZqnVIzm+D+j0kSG7?=
 =?us-ascii?Q?cpbRZ1PDyfZZTNOW/mPmlqiSsCM0bedpyJPCzX2reKAiZZGr4k0Fp1HDC21y?=
 =?us-ascii?Q?5bwVtys0ze04p2s1SrSYwg3pUGnrJpSTqwxN1Ar0xQBwIRe07BEMfG/i5Nto?=
 =?us-ascii?Q?1UEmOK7QCDScRy8Mbu4LTEyEYJ/g/PCWxkIPMbR65omPzIJJ7XRY/UfEpQZV?=
 =?us-ascii?Q?R15gKSmFZ4dHo69FNB/muA9cwktFBHEc8s0QFiDcXaUrWCVFKu0a57lQVlHu?=
 =?us-ascii?Q?LVhBaZZz6ExJmeJbAmlnZ4EBMvNOcxjscc9uO3o50VaHCFg9DiATensJAitw?=
 =?us-ascii?Q?bh26BYdpGR5MKDfBieWEtl74AlLByl94T/4IoeAXxag3W71KsQRGZgHN0BwG?=
 =?us-ascii?Q?KMFO7Di9Djvohcg3xP8mqePeCM32WawzYwogMx3XIOR9AcDeYQBPZjrGSy8D?=
 =?us-ascii?Q?L2mXLYqjyZDNuioe1qoIUSff8EucEYDKOIbbMukzyjutOjGvOzhJdz48clGt?=
 =?us-ascii?Q?nG59YQ/HROWfFkTZ+N5XQobuLbhct7HG8kq5BRTjxp5TAdqsYYRLJvtbAtis?=
 =?us-ascii?Q?J41d0xqKp034jIhffbuEh/3kK+wAZ9EzmJcUg6NAF5JwzL+pu7I7JdG1ZH+l?=
 =?us-ascii?Q?0jmhlv/LSfBR+uijhK3XjGwyqHaPfeOD2/Lh3yaromKgOrX+YnkJDSw8yhYX?=
 =?us-ascii?Q?uDFniJKzdSr9KKpDoxCNeHXUL6YPDiQs0IV8o8X2hQtmurwj7GtSmjK/TKEP?=
 =?us-ascii?Q?2EzBPwNaruojw/k0cLTuWVT+9JLdQm6K0VBavQj8oQQfWvZchOaUl5cfJhkk?=
 =?us-ascii?Q?eiR12HfMKu3g8AdRvJlSbjDxdQ23OMjKkmvU4PL0EiQJ7X6olgGpPN4UOMGY?=
 =?us-ascii?Q?+l2WNZNQ42crMhlpF8g3DRlK5SyYZE52ipFfK53KuefcdSWUXn/7PZaqr+Cj?=
 =?us-ascii?Q?4E2ntY1AQBKb4O0eeYPADldCOS8LbTIBdHvHLcaj3oDQdvMkO5EybEobcBI7?=
 =?us-ascii?Q?HRcQFhRAII2Fs1tNTnfHvm9tS5pbtdHcD2CmG1AqATv76uNBpnH1l4dzq30A?=
 =?us-ascii?Q?uE6+6Fj3fm9ciF3yVghaP8d4XzWwuhq6ZIfXAUEudk4GEiMSqFgHWDwsGK2C?=
 =?us-ascii?Q?JQXIdqhAKkHR0tnO0i1vrtUHxBbRfE+XALHnHP0+BQlAQGuFujZMAHojgcke?=
 =?us-ascii?Q?zMb5EBblD3TERfpQMsxUkMZvpIL5A1fCRZ29vQw49zeFI7XSdGLoU8oXYAtz?=
 =?us-ascii?Q?1/cI7xAwVaz0ohHJlTF7rFEZ48wE/mu11+IPd8SvvGXUsRoumNG1cgP0UlwC?=
 =?us-ascii?Q?Ox5TTXbo4pA2XN4QnqDrYmKeLT+46hFmVWQBwf3aPjFQwGmMbRrlpXV1fwHA?=
 =?us-ascii?Q?mj+NFUcsph437tXfgYbB4IMHEZXTteS4VKq8Td18uDfMZWZN/U9WTOPBi02X?=
 =?us-ascii?Q?D1oIzNcqMRk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w10bs08ifbMst9RcDhZxfY1wg0Uz6Bxx2Y95qotAmDsjQrIDXT0ec9/bzTHV?=
 =?us-ascii?Q?9uSZsU1Dp3pllME1dGNC+NJdGxbHXQ4ZNLcpybxrR3PapFjWEl24113B+sQq?=
 =?us-ascii?Q?L75wClwqOmBAT/BhfbzW0fblb5jvsBNgBxpSoNM/dFC9hUMA5YxdipL1FafJ?=
 =?us-ascii?Q?euoiFRmpzl0eJfOmvQ+TzTVYsuFsCubUaDgb3Gh/x/aeiGjOz603SsKT/7wP?=
 =?us-ascii?Q?n4bNHD8RFL2SMfioVOUKxhU/PztVWXdT3Q0w5i1Lcoi9/mhzKa/UCLI2kn/A?=
 =?us-ascii?Q?BhXuZffD9DsjMeavjXbFMMGTF9GdCYW6mwG+9IILKAKSzlHp8EPxDmZvDtps?=
 =?us-ascii?Q?cfwg5vn/8QDdvSl5oEX8Yoo2PSZC32U9SwkHoMk07XKT7LQfx7WPJaBRBjwj?=
 =?us-ascii?Q?VGzkrdpBW+RwYZS3Ot7syBv6JyIbXn3JsSNiPOHBCWqHoqzMLIgNbcHlCWMf?=
 =?us-ascii?Q?lkQwG2M58VxLQrR7U77jbztMG8I4m/Hp+HtBlfFjr3pyniaxzxvPaYVRWi5K?=
 =?us-ascii?Q?eBp/+j04jNvpoTBqEJ2y6Z2QiSy0BHdDHEZzL1zXuq56RsNNrMFOIGggJbp5?=
 =?us-ascii?Q?t15ashWTn2on3L5WuV0yxGF68/fh3eseTJ+2As5WcPNLczAu3wNwzNImkj4q?=
 =?us-ascii?Q?2gdYAwalQ0MWWHSSzZQhwz58W8bI0IVEwB2ReYHZtGvMUtkeeP3L7/TMAtK0?=
 =?us-ascii?Q?HvyH7TZy8JtwjRtihICyR+tml0jpNU3bxEl3R2lEc4RT3DKWy7m7K5Hmog1D?=
 =?us-ascii?Q?IBmc+F1q0RiScLgrKXqj03i58EYiGmtEL1LBTpWDJAKElWzfPKoGgloM2A2f?=
 =?us-ascii?Q?Xp5KElUwJaKlJzGXH3PLV9S0HzI5xppJebIGsHqwedUU/M6SK+1bL2kE8ov4?=
 =?us-ascii?Q?lJ7ld1yoVnsJCMxG+P2Mg98WcfHaZA/f+mk4NwJS5GNzKa3JNmDqB9lYiatB?=
 =?us-ascii?Q?94Rrn2T/ngevftf2jKVsczsPI0Qd24/3S4qPQ2oxO5VXiULXNVeZpR+trcE+?=
 =?us-ascii?Q?RZ5hccnhvYRDcxYzvR8MMa71agM9F/qiJHKJ4Pvr4jMtSRqHSoKK/njRzxPh?=
 =?us-ascii?Q?E502jH5keViQ8G6gNxy7WcQ7btubtmxj+J107cw54mECx1OWQsWIt1HA+Av+?=
 =?us-ascii?Q?eauGDbHLcNJoLMbOjQHIukT38h8ymba1M2Nn2tEZRO+5XqOP8hLYYynJqS9N?=
 =?us-ascii?Q?VpfHEZHP868esxOi9V95kqc921Aw9aH6dk8b/8pxKvFQpaMPw7/ci05egSMx?=
 =?us-ascii?Q?U0UGM4TDOnVHiS1SUoeVRNKYY1ZqSsy1CcuSdhFHKRPFTaRSDnxmXUESXwt2?=
 =?us-ascii?Q?GVEelYVII+fZlnCTamfCCzKam7q4KciniAEKUmZeLPu+5Wug+Rb/xk8q3KzV?=
 =?us-ascii?Q?vxwsFLOzCkE8e8isR8jE6eQHi8gEkW6fSXLenuSLnzJR7xIoz5k7PqYDPTzh?=
 =?us-ascii?Q?snpAptOyEfPtJcK+eko/0NksHw1tDNA2H2KkzfrMbZmpQH3pM/v4Cy8+QvS0?=
 =?us-ascii?Q?2PNv5GNs3Y4BvmMUYbwF1thJKDIpHBhmxF1bCD2uRH/PpkjZk4XCixVlxY/o?=
 =?us-ascii?Q?PduvfoZxFMq0kd+Bnjk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37152e6-539f-46d4-6f7d-08ddd103d734
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 14:00:58.4998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCPpk3AM48XA/POOSU0zCe+pvO7xmB70bIvT+bKdmAkO4GNiCDQrmS8fR5LTASJJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
X-Mailman-Approved-At: Sat, 02 Aug 2025 08:22:22 +0000
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

On Mon, Jun 16, 2025 at 08:33:19PM +0100, Lorenzo Stoakes wrote:

> The intent is to gradually deprecate f_op->mmap, and in that vein this
> series coverts the majority of file systems to using f_op->mmap_prepare.

I saw this on lwn and just wanted to give a little bit of thought on
this topic..

It looks to me like we need some more infrastructure to convert
anything that uses remap_pfn/etc in the mmap() callback

I would like to suggest we add a vma->prepopulate() callback which is
where the remap_pfn should go. Once the VMA is finalized and fully
operational the vma_ops have the opportunity to prepopulate any PTEs.

This could then actually be locked properly so it is safe with
concurrent unmap_mapping_range() (current mmap callback is not safe)

Jason
