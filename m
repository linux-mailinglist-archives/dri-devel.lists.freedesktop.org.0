Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLmtKe0DlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7F152216
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8039410E552;
	Wed, 18 Feb 2026 00:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZSRQBCMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013044.outbound.protection.outlook.com
 [40.107.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A22610E548;
 Wed, 18 Feb 2026 00:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkEr7V4ROSs5mKHh9+vWwLfT/kwrmHsFu72WmjSAWfuLveaSJJGpTQ114rCbQR6JLQhnp/QnLdiL+o0BvAo5O6yHtmsy8jg9SQZiZrVA2Och1sEBkUJT3mEDjTSGJIefuG9hRqC8rUuWACqPBKz1YPhP9RUB2Gfc/RnMZbw2vo0jPyOvbOeHLy8ZhlZVD251ecH4JPOvoDPw7lqBgJ5nJEAu2oO6c6v7wC9W8GdG/un6Y9A1teL/F4hS1TAktaOiqlpY+3IC9Jm+H7diwgFsk1NFn+r5ah83QHGaF63PRKBc9Kny1UGdZS6o0uG7LLBEdvlMA4JqCIpRndRyN5bmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiublPf1By/lIWovDbncuRRE6L83GGw++m8oRq9I+/g=;
 b=pfgZCHhIDFpdHmXOkdMBVUMnhB7Cv5BUo7ZUH7IBwYSYk0kJJYGn3lovgsa1oOKyFaDjyD+PX6adAIMLUJguFno6evdQvzeFQGTcYJVzy7/zimEEThN9vkP15NbiNVzSXdTxWwtOYxjx7JtB/G9X2AeBmoRZtu/Kz4sa4jXMGtjsgU8i3rPQ62aPfAqjIXoh/z6FtMxqZtFXMi1BdgLn7Oeo/79UREdLWN3Xutleski0BDhq92iUL5FRXrwm47wkuJ9Q4tZUUHCtM1MmFfq9EmHwBRcHgy9ybbWi7FNpIlttbUzfK9fePresxr8mg7j5zu/ogny3TB6QRQElf3OQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiublPf1By/lIWovDbncuRRE6L83GGw++m8oRq9I+/g=;
 b=ZSRQBCMcn2gUFlN4P0PiuVgrDdZdiaksBrgVRARsYRG8SOsyayhyB75ykPyBGGqSy1HleGL8EhtVBywFwcoeRV5zGI6J1fLStbZp/qFY5ZSdgJ9tMhuir70zrjXVW5mIo6J6Ouye27ic9DYclPg73CKmF3HIcShd8OpIDioBk1B/5kKcW0qN4QQnz9m0apni40rvVcNt7LNMGqZt3Ge04ewU9ZGqlqgv+MQutjxNG8Rtw4xg8oyhhdWY5w0/Wd9UDL1j1+Z8iR+Zo+FWugH91QdHfqTz9hRsqE7JEcWHGNFuEN3IsLZUtK58E4wqcF1li8gx1/VcmXnV6kwgPkitXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 00:12:06 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:06 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 23/26] iommufd: Use the PAL mapping type instead of a vfio
 function
Date: Tue, 17 Feb 2026 20:11:54 -0400
Message-ID: <23-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::23) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d88e7c0-1ab2-429e-15ca-08de6e825664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mRH1i5p61VVcz8N+aydUPjh8AMumSM/PrLn5j0yMv3dBmzJOCofsRhmowpIy?=
 =?us-ascii?Q?+D0EfhaWBkJAZYwXMBowp5HpsjxStNNcGe+jgGkdpOtQQtMJSG2MIMIIs+gQ?=
 =?us-ascii?Q?kbJTTVaMSrzLMxGxfAzunMj+W7mWPntOcopTwoJGA+q8URzl6m8V9yacK/GJ?=
 =?us-ascii?Q?E7hW0UM08diZdwT6pFiECgp9VMOHXuJ8HgVzuH1LCWh1Mlynvh7MMbdEvoFp?=
 =?us-ascii?Q?aN8lEjWAK4xThbW9ump5Ou7LOGZ2K0s90Ijx1R6xfwMg0MdpWT56zbJc/uVd?=
 =?us-ascii?Q?csdAt/LSp4RaUiPkF6HkSZKzSAuDZgczFoz/EMZQ5WCfkh8lyoeNmMyYKLHp?=
 =?us-ascii?Q?1Txm9VHH5ck82GhK/F0B+d0yvSXrglF+y6ogV1jT9MXjbIuTRdgkiz/I3yoq?=
 =?us-ascii?Q?gAfm+wPHhi4WZmtZ+bTcmVzWo4okzwwCMnLtwB9HZvZhhisjHp1dgifFGPWA?=
 =?us-ascii?Q?UfdclPMEfG2rQg+YYOgtkIFN6CAzCqooYJxVDNCLZFt6+oVg1hQf8/pKOC8o?=
 =?us-ascii?Q?E8U9pIzAMBSgMw8osOpezv08LX0GPp3iVQWdtTswLOChSsUTul4yg2c+NPlo?=
 =?us-ascii?Q?glEwiPdKzMgc/GA9LC3x/y7yL8qa7VLkHc4YeLhhR42WecKH0UM+/Mhr2p5O?=
 =?us-ascii?Q?hL1eNTEItddho9iReysYQ+AYiUShNSd33KaJdVHeDzItr0S9LRC4c6fZGGL8?=
 =?us-ascii?Q?MQr2nGJezBvi9qpW9O/WR+ZyCd+SL09idQLRwBsySruCVQ+hIDepP+OziLiQ?=
 =?us-ascii?Q?K8acfvWqBG0RyUeTRYQO0p/ERZt86mXaQB6pY6l/z+3vw7dAqorCym/sea07?=
 =?us-ascii?Q?IIAtRSwb0YdXMxGUXlIRJXgLiTziwc/eLHgplXY7DZwI+IgUkx5WjafppnVu?=
 =?us-ascii?Q?2GFD63HANYbtTqgdbhT/OU9/AYJZW6VEkLNJP/B/auq3BmYy708icgpJhmqV?=
 =?us-ascii?Q?n8iYcDpF4TL7sUUZgkyXiB4nmqqXFawk69LNaY5tR7S0zzDPVU0gLezcJXY/?=
 =?us-ascii?Q?sWe2FPR5TTs+a/oRQS7B8nZWXu8gGWsJIOZ5VsrJVeYAJCLJDgaoH5+/V7uE?=
 =?us-ascii?Q?n5fcjxGj3CKnFIEUXpnHHvaCi79SsWTIGCzswY4p83PUj8YImu5DzI00eZic?=
 =?us-ascii?Q?NDuC+hh7tUGLL57PRO/H2+kvKMSLQ3cyzk9/NxpI94BvkLMv7pTsbKTvHXDK?=
 =?us-ascii?Q?w+smMj1oergHUoEv5PxP9uiq79n6Tb6YiTBVD8B83QGTX/6qSUssibVb+5DC?=
 =?us-ascii?Q?Kq5qwliDaRV1+Km8QNHyS1B7s0xX6klJzUxGanjO4K6iEkOTyJkTc+cG/hlW?=
 =?us-ascii?Q?rxda1eVzElpHsQ642kD2v9zFxU2rz8q+IBYumaid7PfDjpwqTQ46Yl1/eW+q?=
 =?us-ascii?Q?YSqNQiGpxdaZ5C/pH89zbmkNVoc+BkQzJZdijEpOERnVr/d3PfIkrOuNX5Yo?=
 =?us-ascii?Q?JQSzcUEsGTtiaxEjeet6W6HAE1KZ5eCYC+0S0/VdqGmAs1J66fuo427jpPlX?=
 =?us-ascii?Q?Leikd8BezfR/U8BlNQNon/FQqC03lB47TsNeLFppGLX5y6Wtu14YNNJBgQ/J?=
 =?us-ascii?Q?welzZMMr0R0oeI1NyHo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WUqm053uJ+RobGeMrjCqzHLc9puFT7TsMDjVMNnvHlLr/0l0W8gsiHutE8Ij?=
 =?us-ascii?Q?x2icn37vuHTGw4VKdaus61GndBQVnj92fpO1juYY0nZIG2Lf9NphuXMRA9qM?=
 =?us-ascii?Q?YsyXWY0RSkvjq3Snj4PyNkYgudXjEZWR87THfdQlDJHD2H9goVGieXh8LJwZ?=
 =?us-ascii?Q?JhaTftBI8yi/JnHnoR8i/1yXBCZXix6iyp8T9ma57KvFfjc5JaDdqzVWt1r4?=
 =?us-ascii?Q?gtqGxys1eLmFwFFR09jysxsvO2WsUbc9VN4rsXVd6gSCB+iO30nUe1h0djFe?=
 =?us-ascii?Q?t10+XuMguCmt3I/jQ7k1Nl5UntdfpacvX569ao8R/dKO1rax0fxwHKsmVqB2?=
 =?us-ascii?Q?Q61mjQB5Esziy9C/8qIUBrLg8izyI7a7FfpKZNCHUEaEJBnC26eJzRtoQjxB?=
 =?us-ascii?Q?Qbi7XA0KriRRp/cI5TSw6jOz5zegeiRSSYfwSNnvMkcKIJQrQaZ2SPDATsOu?=
 =?us-ascii?Q?FCgdjMEfr314DEVcunXa/EeQB56d5nh+X14e3SrJ9RsxX/QVEp8bampwzkMW?=
 =?us-ascii?Q?IlEfC9s7crEUhJ/Q0qpweK5LjEx2TFFtDH3z9XTZG8zZMQcVznznd4umkdtE?=
 =?us-ascii?Q?2Wl5bceDaFa+/MJ8mEw3hItc8LSCFNJLbTn4Hl3XLjJ8xsv53XEebmHHU0XS?=
 =?us-ascii?Q?6tVxPyv8UYBfoEjB/0Pqnwf8z0YPfDqkblhr2pUlqr20Pi1rLo9XjwX9kEQt?=
 =?us-ascii?Q?FY1CpGQ4nRx1BwnsUCMJdVykunxzjNGh8kyCrz6ucLiTqJVkuoekeQDjYTgG?=
 =?us-ascii?Q?Etx2Eu14ySyA5z9M9pH9OOXQ0ZaM4NKqQhaOkgasu3FnY09eG77a9AJZgKdS?=
 =?us-ascii?Q?dPtvirH8ckVkHDUNULZ4+NWPncGKuZSUn/deygZ2hpdMfYFxWuh7OHpxVaQf?=
 =?us-ascii?Q?C5N3AYc550p39q9slO4nCyWnnEQI+pwEKFZBVoCmq6KPCVZBW30q16OAHf9g?=
 =?us-ascii?Q?ZN6skFW35iaokTd7vkuvw7rfIoxQUMptVsLksIL+KBPHZJKKp4ZPKu7R3h+w?=
 =?us-ascii?Q?6PJse1ALbS7WmoY5z3mF9XDEX5sCCtCuw67rxZ1Z+sIqE1XLWp2mk7FML7zI?=
 =?us-ascii?Q?C9l0BOr/4jlzMi2YaoqwJZ7ZJx7yTJ9Kiahwu4te3Z2cdGZI7Xj2Jn0Cl5kx?=
 =?us-ascii?Q?U5rlc7Js64lwS8j9u8ePlmyC7Zng78ChFW4U4390aYYKCpILaEhsSA0P3E8H?=
 =?us-ascii?Q?QWtawlP3po1sEGHeGBVBycjrW0sX3Y1S9opxcg7xWRRMMUCwE6X64ptYHe9B?=
 =?us-ascii?Q?JJvvW3a4sVHeW3ohkOAtKJsFmMG3YiwuiW+ITNc5OPwPxLMdc2MxTJPXXMsi?=
 =?us-ascii?Q?kIf3YAUXqbnXCfQLYq5urEASJlv/eS+uQOYXwbE6TGkrkJmgd+vBYb5bvvg4?=
 =?us-ascii?Q?1Ag1ovKx7Y3bGNjoiPzCwqFfzxDC7spIQJURGAxHDWu2lWW77tSGZwKlJzhH?=
 =?us-ascii?Q?l4kMc2xAPgsTnEW8ZZcNwQ1wJh4eSlQ9GDb1yya9ywqwFN4/dnFh5u85VkOr?=
 =?us-ascii?Q?Q8tgnbxzWN7eTDeEaqtvG5jWTE6lJKlizYy0Ba3RxwCyfpijWwrAKvvOhxmo?=
 =?us-ascii?Q?HK5QxTIna4jHgNGFw5oWzQVH+svMqj/o1c4gQNdktwQ8BeDdeUyh5WG1puOM?=
 =?us-ascii?Q?UqTUN+sTViKMhdERT5zJJyqFCIdfo7MmgqYvUj+5rxswS04LinV6Pmi5EDmd?=
 =?us-ascii?Q?3IrIfBp9NEBfRhtHE39pSJ9T7LFF7FuUkJkZneZkmT2IbMGUZvTPOKQlSUZ7?=
 =?us-ascii?Q?MofUDzGyVQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d88e7c0-1ab2-429e-15ca-08de6e825664
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:00.9928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJZFIM71xc+pF0s/riQHGhXRCIpycbBmR1+bURKwFmxj7NbxOAXXXEsMsCZrcSZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 29C7F152216
X-Rspamd-Action: no action

Switch iommufd over to use the PAL mapping type. iommufd is the only
importer permitted to use this, and this is enforced by module name
restrictions.

If the exporter does not support PAL then the import will fail, same as
today.

If the exporter does offer PAL then the PAL functions are used to get a
phys_addr_t array for use in iommufd. The exporter must offer a single
entry list for now.

Remove everything related to vfio_pci_dma_buf_iommufd_map(). Call the new
unmap function.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommufd/io_pagetable.h    |  1 +
 drivers/iommu/iommufd/iommufd_private.h |  8 ----
 drivers/iommu/iommufd/pages.c           | 58 +++++++++++-----------
 drivers/iommu/iommufd/selftest.c        | 64 ++++++++++++++-----------
 drivers/vfio/pci/vfio_pci_dmabuf.c      | 34 -------------
 5 files changed, 64 insertions(+), 101 deletions(-)

diff --git a/drivers/iommu/iommufd/io_pagetable.h b/drivers/iommu/iommufd/io_pagetable.h
index 14cd052fd3204e..fcd1a2c75dfa3d 100644
--- a/drivers/iommu/iommufd/io_pagetable.h
+++ b/drivers/iommu/iommufd/io_pagetable.h
@@ -202,6 +202,7 @@ struct iopt_pages_dmabuf_track {
 
 struct iopt_pages_dmabuf {
 	struct dma_buf_attachment *attach;
+	struct dma_buf_phys_list *exp_phys;
 	struct dma_buf_phys_vec phys;
 	/* Always PAGE_SIZE aligned */
 	unsigned long start;
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index eb6d1a70f6732c..cfb8637cb143ac 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -717,8 +717,6 @@ bool iommufd_should_fail(void);
 int __init iommufd_test_init(void);
 void iommufd_test_exit(void);
 bool iommufd_selftest_is_mock_dev(struct device *dev);
-int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
-				     struct dma_buf_phys_vec *phys);
 #else
 static inline void iommufd_test_syz_conv_iova_id(struct iommufd_ucmd *ucmd,
 						 unsigned int ioas_id,
@@ -740,11 +738,5 @@ static inline bool iommufd_selftest_is_mock_dev(struct device *dev)
 {
 	return false;
 }
-static inline int
-iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
-				 struct dma_buf_phys_vec *phys)
-{
-	return -EOPNOTSUPP;
-}
 #endif
 #endif
diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index a487d93dacadab..9a23c3e30959a9 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -46,6 +46,7 @@
  * ULONG_MAX so last_index + 1 cannot overflow.
  */
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
 #include <linux/file.h>
 #include <linux/highmem.h>
@@ -1447,6 +1448,8 @@ static void iopt_revoke_notify(struct dma_buf_attachment *attach)
 					     iopt_area_last_index(area));
 	}
 	pages->dmabuf.phys.len = 0;
+	dma_buf_pal_unmap_phys(pages->dmabuf.attach, pages->dmabuf.exp_phys);
+	pages->dmabuf.exp_phys = NULL;
 }
 
 static struct dma_buf_attach_ops iopt_dmabuf_attach_revoke_ops = {
@@ -1454,41 +1457,16 @@ static struct dma_buf_attach_ops iopt_dmabuf_attach_revoke_ops = {
 	.move_notify = iopt_revoke_notify,
 };
 
-/*
- * iommufd and vfio have a circular dependency. Future work for a phys
- * based private interconnect will remove this.
- */
-static int
-sym_vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
-				 struct dma_buf_phys_vec *phys)
-{
-	typeof(&vfio_pci_dma_buf_iommufd_map) fn;
-	int rc;
-
-	rc = iommufd_test_dma_buf_iommufd_map(attachment, phys);
-	if (rc != -EOPNOTSUPP)
-		return rc;
-
-	if (!IS_ENABLED(CONFIG_VFIO_PCI_DMABUF))
-		return -EOPNOTSUPP;
-
-	fn = symbol_get(vfio_pci_dma_buf_iommufd_map);
-	if (!fn)
-		return -EOPNOTSUPP;
-	rc = fn(attachment, phys);
-	symbol_put(vfio_pci_dma_buf_iommufd_map);
-	return rc;
-}
-
 static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 			   struct dma_buf *dmabuf)
 {
+	struct dma_buf_mapping_match pal_match[] = { DMA_BUF_IMAPPING_PAL() };
 	struct dma_buf_attachment *attach;
 	int rc;
 
-	attach = dma_buf_sgt_dynamic_attach(dmabuf, iommufd_global_device(),
-					    &iopt_dmabuf_attach_revoke_ops,
-					    pages);
+	attach = dma_buf_mapping_attach(dmabuf, pal_match,
+					ARRAY_SIZE(pal_match),
+					&iopt_dmabuf_attach_revoke_ops, pages);
 	if (IS_ERR(attach))
 		return PTR_ERR(attach);
 
@@ -1502,9 +1480,19 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 		mutex_unlock(&pages->mutex);
 	}
 
-	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
-	if (rc)
+
+	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
+	if (IS_ERR(pages->dmabuf.exp_phys)) {
+		rc = PTR_ERR(pages->dmabuf.exp_phys);
 		goto err_detach;
+	}
+
+	/* For now only works with single range exporters */
+	if (pages->dmabuf.exp_phys->length != 1) {
+		rc = -EINVAL;
+		goto err_unmap;
+	}
+	pages->dmabuf.phys = pages->dmabuf.exp_phys->phys[0];
 
 	dma_resv_unlock(dmabuf->resv);
 
@@ -1512,6 +1500,8 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 	pages->dmabuf.attach = attach;
 	return 0;
 
+err_unmap:
+	dma_buf_pal_unmap_phys(attach, pages->dmabuf.exp_phys);
 err_detach:
 	dma_resv_unlock(dmabuf->resv);
 	dma_buf_detach(dmabuf, attach);
@@ -1657,6 +1647,12 @@ void iopt_release_pages(struct kref *kref)
 	if (iopt_is_dmabuf(pages) && pages->dmabuf.attach) {
 		struct dma_buf *dmabuf = pages->dmabuf.attach->dmabuf;
 
+		dma_resv_lock(dmabuf->resv, NULL);
+		if (pages->dmabuf.exp_phys)
+			dma_buf_pal_unmap_phys(pages->dmabuf.attach,
+					       pages->dmabuf.exp_phys);
+		dma_resv_unlock(dmabuf->resv);
+
 		dma_buf_detach(dmabuf, pages->dmabuf.attach);
 		dma_buf_put(dmabuf);
 		WARN_ON(!list_empty(&pages->dmabuf.tracker));
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 7aa6a58a5705f7..06820a50d5d24c 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -1962,19 +1962,6 @@ struct iommufd_test_dma_buf {
 	bool revoked;
 };
 
-static struct sg_table *
-iommufd_test_dma_buf_map(struct dma_buf_attachment *attachment,
-			 enum dma_data_direction dir)
-{
-	return ERR_PTR(-EOPNOTSUPP);
-}
-
-static void iommufd_test_dma_buf_unmap(struct dma_buf_attachment *attachment,
-				       struct sg_table *sgt,
-				       enum dma_data_direction dir)
-{
-}
-
 static void iommufd_test_dma_buf_release(struct dma_buf *dmabuf)
 {
 	struct iommufd_test_dma_buf *priv = dmabuf->priv;
@@ -1983,30 +1970,51 @@ static void iommufd_test_dma_buf_release(struct dma_buf *dmabuf)
 	kfree(priv);
 }
 
-static const struct dma_buf_ops iommufd_test_dmabuf_ops = {
-	.release = iommufd_test_dma_buf_release,
-	DMA_BUF_SIMPLE_SGT_EXP_MATCH(iommufd_test_dma_buf_map,
-				     iommufd_test_dma_buf_unmap),
-};
-
-int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
-				     struct dma_buf_phys_vec *phys)
+static struct dma_buf_phys_list *
+iommufd_dma_pal_map_phys(struct dma_buf_attachment *attachment)
 {
 	struct iommufd_test_dma_buf *priv = attachment->dmabuf->priv;
+	struct dma_buf_phys_list *phys;
 
 	dma_resv_assert_held(attachment->dmabuf->resv);
 
-	if (attachment->dmabuf->ops != &iommufd_test_dmabuf_ops)
-		return -EOPNOTSUPP;
-
 	if (priv->revoked)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
-	phys->paddr = virt_to_phys(priv->memory);
-	phys->len = priv->length;
-	return 0;
+	phys = kvmalloc(struct_size(phys, phys, 1), GFP_KERNEL);
+	if (!phys)
+		return ERR_PTR(-ENOMEM);
+
+	phys->length = 1;
+	phys->phys[0].paddr = virt_to_phys(priv->memory);
+	phys->phys[0].len = priv->length;
+	return phys;
 }
 
+static void iommufd_dma_pal_unmap_phys(struct dma_buf_attachment *attach,
+				       struct dma_buf_phys_list *phys)
+{
+}
+
+static const struct dma_buf_mapping_pal_exp_ops iommufd_test_dma_buf_pal_ops = {
+	.map_phys = iommufd_dma_pal_map_phys,
+	.unmap_phys = iommufd_dma_pal_unmap_phys,
+};
+
+static int iommufd_dma_buf_match_mapping(struct dma_buf_match_args *args)
+{
+	struct dma_buf_mapping_match pal_match[] = {
+		DMA_BUF_EMAPPING_PAL(&iommufd_test_dma_buf_pal_ops),
+	};
+
+	return dma_buf_match_mapping(args, pal_match, ARRAY_SIZE(pal_match));
+}
+
+static const struct dma_buf_ops iommufd_test_dmabuf_ops = {
+	.release = iommufd_test_dma_buf_release,
+	.match_mapping = iommufd_dma_buf_match_mapping,
+};
+
 static int iommufd_test_dmabuf_get(struct iommufd_ucmd *ucmd,
 				   unsigned int open_flags,
 				   size_t len)
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index f8d5848a47ff55..247c709541a937 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -133,40 +133,6 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 	.match_mapping = vfio_pci_dma_buf_match_mapping,
 };
 
-/*
- * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
- * It allows the two co-operating drivers to exchange the physical address of
- * the BAR. This is to be replaced with a formal DMABUF system for negotiated
- * interconnect types.
- *
- * If this function succeeds the following are true:
- *  - There is one physical range and it is pointing to MMIO
- *  - When move_notify is called it means revoke, not move, vfio_dma_buf_map
- *    will fail if it is currently revoked
- */
-int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
-				 struct dma_buf_phys_vec *phys)
-{
-	struct vfio_pci_dma_buf *priv;
-
-	dma_resv_assert_held(attachment->dmabuf->resv);
-
-	if (attachment->dmabuf->ops != &vfio_pci_dmabuf_ops)
-		return -EOPNOTSUPP;
-
-	priv = attachment->dmabuf->priv;
-	if (priv->revoked)
-		return -ENODEV;
-
-	/* More than one range to iommufd will require proper DMABUF support */
-	if (priv->nr_ranges != 1)
-		return -EOPNOTSUPP;
-
-	*phys = priv->phys_vec[0];
-	return 0;
-}
-EXPORT_SYMBOL_FOR_MODULES(vfio_pci_dma_buf_iommufd_map, "iommufd");
-
 int vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
 				struct vfio_region_dma_range *dma_ranges,
 				size_t nr_ranges, phys_addr_t start,
-- 
2.43.0

