Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJieMOIDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756721521AD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75FB10E543;
	Wed, 18 Feb 2026 00:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e2cNllIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE2F10E2C3;
 Wed, 18 Feb 2026 00:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qf+mGpS1mTCxLhPqUUQcbzPn9s10vdPluHNuFTlgenpUvupIszGw+aTDmz0K8feBknzzbBH9/GeyVW+Fxyriear7SgUfDD7XQv3TssiORHMB1lW3vqu5YX2Rnw4lc4lVROoj1Z9XHtyoXvustLlzUxIQ+97ELeahQeyHzaQoo3JlzUPHY4BgNRW1tLTgpYjSTkv2hfuKkOmaW8ffz53MH4GXavZGHQBQ5MqKJnpDMI6ZmDlx+WAmqq2/b+pjsPyGBvpgdx2xkQWXTMx8Uu7qc5mULp+VVQz0GOZJ215xFYoJKHc+ZyF45Cojfq51yz1LvdG/t/kB6H1/kxUFMlJACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlhdTq13RIp8Pqg6hIaYJ1JzWsQtA/Cslpa4euyg/pE=;
 b=rOvS0oDcKkQLYHdvhBvywASDRzWam6nwKD5dZxPU5g8rtJpF73YOmPZNSH7V4+GKlolY4XLjRA/DLlIYNbPZNSLxm27alf2eXutCOwIl2A3dKp3Bk/Cb8O1vhiG2VnaX3Whnw3BWqodIcZGqQSHdJNlbf+aL35cuIJTdJdLBZNayWHm2FJ5v0HAFeE+glnTkcPCqD00WPB1xvwBiZf/NaibZuc5H8qgkWDhjHKHFy/4JeOa1HqkGRKwBqCmppKyeu5uLa4/TJvMZsrE8BpO+UfVq4uO1k0S51ID2TgwVHe26SOvqlHi2G8+71MT17mMazxNjUSwrXsj7IW/iekluyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlhdTq13RIp8Pqg6hIaYJ1JzWsQtA/Cslpa4euyg/pE=;
 b=e2cNllIfExMmiTmoPEHNY9VXMW8JJWikObJC0Ksy65bhQ1RJqFin3wswyv1K4iur3x6ZNZM/VONUeoFMZccJUin38TVRTzUOY8tQZwEKuGjgPZekFrht01lnP91vVR2wxlevQkD8A8slv28VJISr1pJOckNvEVNJfNtVSW6XDg4WQfGB3ddPcVOPpNl8DSNQJDOJ8M3/O7huUJP5GwIz42T9c5GDNR96qTLN6uUUHVsHtDOIhXSRpK1AFpprNmTm6atn4WiSDnuZyvUui9QKSGKo3eENGXC1ABL5USzS9+SbSFSFyNulU7PCVm9a2wkkKa2ziPAJwQr9oR2ll9ss+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:12:00 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:00 +0000
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
Subject: [PATCH RFC 19/26] treewide: Rename dma_buf_attach() to
 dma_buf_sgt_attach()
Date: Tue, 17 Feb 2026 20:11:50 -0400
Message-ID: <19-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: fdeafa03-c026-4f99-6549-08de6e82554e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fGZXh50InXcYVRixJVVIInwn4XuDDmWV0CcXu/XhfKlaeuOY8TBjsC8V3L66?=
 =?us-ascii?Q?rCZQvOlrLZ+jq9uOZJrbQRq/CoZO6FtNZiy5iRG3IEFDloAAcIPgwgpMTCU4?=
 =?us-ascii?Q?jgPajoGIG2zWMnBoHpdbh9RvlbflB8e8AdTpH7q9hbfJqlsGHyAzdI2D2nAr?=
 =?us-ascii?Q?coDuw4z1p2pE1gMNiItU+o763zv5hirIZjJnJ9qyg9xBd9bX+OqojHpHOb3c?=
 =?us-ascii?Q?zfnEcMrl0qQyoAq8wlqHsLwa991kJKYyQ58h6GUlkqX26SehX5g4DYYoxGiw?=
 =?us-ascii?Q?wIqrt2vMBmzu9dAwZPE83U3hfl3qlEtAlBmjBNTRZJahNeMGX1wDbNeSX0Ld?=
 =?us-ascii?Q?A6brcLBrbemouhQUW8X/zGYzELIqpEZeBmipdtdsjtIZu/CwMy5ch1xtF+oz?=
 =?us-ascii?Q?gT+oSGR7cTbGCxvUAHTIaRdL11LDVxyAa2lUJ+7AtQ0tA9nG0wOs3FqmsjOR?=
 =?us-ascii?Q?pIDFfgsEDiC6rC26iywZb4GPdQvPBPmTXTC9Hcjmp6+mAyyvvg0RjHYD0j+l?=
 =?us-ascii?Q?knrAlTHcygD+KeF2QIweezMUn/Mz1kUyre3kpBntXkW23BC7nbf5Ot+ZtZhA?=
 =?us-ascii?Q?6IfeeZrrOjzmrd/JHCgHgtW1beBIaKMxqPN8EY/2Jgt8ZaE9OCx6F5pq3dFL?=
 =?us-ascii?Q?c+Efp3xBMJeWLfAw8fGLBGo4MXOK5XwuRgD+x6hnSXrJIeBVG09n7pmKhE1r?=
 =?us-ascii?Q?iPWl8Gd6ScFwR6k1V0yAEKBs0Kqwx84YmVvP6tZIda7kcWDfMDJTGM2Gs8n5?=
 =?us-ascii?Q?FFHBIf4Egf0hquJxzZkXkVGVXOy/0zT2leBeG+B8roXC/JUfDSmEDS0eS4l6?=
 =?us-ascii?Q?zzUqybr2hmbUoGzEXFbEx43gZzXca5Ji5QPhPum063BlIkd7CASQAzxGFpy6?=
 =?us-ascii?Q?v3EAV6KVVYWjjnLUgFlErkvMXTkPLWB7B2QNZuAuj2cBAgEeSd1DQJemTSRq?=
 =?us-ascii?Q?ej0M58vBcr4awHpC74tY+OJ9v+xNNVOUJwXethklIYsTD1cPxwpKOxbuzsy/?=
 =?us-ascii?Q?P99cChAK632Z8R9HNuFJXssaiv+YDCMz5g68ekMFeC/TYentHYXV9yehwpru?=
 =?us-ascii?Q?au9hpyZgdToZcrYdtPZs6LF2u4n1EIpfRvzRlICrE820msDnoRWTxTkoxOCC?=
 =?us-ascii?Q?DcwHACO3ncjxD4Q/8zoDi8Fx5UgWz+4XuZMH1B1FxG0sWlt70k69Pd68TQql?=
 =?us-ascii?Q?Evn+qWORqv4LamsSFZiy4OdVGxpl+6REqu/BmVGW4/eT9doJld7ob/mxZN3f?=
 =?us-ascii?Q?USyv2P8VboC0kkwVBU32z1ZzWYdDKbUP4NBQM5rNwiTwrp35c/Rcboj4DV1m?=
 =?us-ascii?Q?Gjw2epxpg5ykgxmVM+dKlqV/1xk0/osqrQlKTQQ3JmsYkHPVsx2/qrMNpfdS?=
 =?us-ascii?Q?g9p0cbV9hvwnu3P9ACekft8QpyVKm72+FxWKzUwNC5YtrkomVCLXeDf80KyC?=
 =?us-ascii?Q?5lr08GUwYTnwlVp29V6CiI9L+4xSWMd3+w36KhE9sJ+nkmhNbFrTKk+o6BZv?=
 =?us-ascii?Q?XLMRnbQYqAnbSEFdEFkDZHD129w7oU8NQ+iAoZTFqPikSAplroX3Ijth8AFC?=
 =?us-ascii?Q?La2RcjmJ/SU93+CXqkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yn421dcj4fnO5iqlHMXDaUBZXGMg8a+5nAzyewQRmBSCmkDzav1jGSX8AP3l?=
 =?us-ascii?Q?96KhJP2FRETJJjI6yNrrIXzUM3+hMEXVIOVG3arp9lWNPnwdO/U2IMavrf/O?=
 =?us-ascii?Q?7ZvGu7jr0AkrCZpN8leeg0lBVpLm9Pn7xjlWwG8/wRKhJ1+5COVCUARzJmiy?=
 =?us-ascii?Q?iXE4BtWMvUzbI4Sctavm87V8do8UzJnlhgI118StjCrJIisUOkDAgfhyQso9?=
 =?us-ascii?Q?wvJkZRx2TywpbOONQzZTOfwGfKlOxqmtik47JPPlGAXd0RZcO9+Nl5zZHBTF?=
 =?us-ascii?Q?WoXJxIer6pvzqHRewE/fOydBqascBVrCecZZSZKXi4zdyUut1hWoT/GQvzrE?=
 =?us-ascii?Q?X3S3HzhutIkCcqtoMOeFveIh+I0ka27F6m7E83LEmNJ1MREZbAOqZ3bQ566t?=
 =?us-ascii?Q?FxzApUuIB0egjZNeEOFQWJIN8khkDK/gtlxnc10xOOkSZhhNI2iJW7Yvg5dg?=
 =?us-ascii?Q?EL9cJ+nM2vZ4JsdQnUeOxdZ465rEJ+6nJG9iFjp2qL944DvJpA7iJNGvBCrI?=
 =?us-ascii?Q?YJq9FZkZmC0ZdWC0P8pQmOYyBwlopuQR6N17HeRG4d4dabzJhfxQk0l+q1QQ?=
 =?us-ascii?Q?eypFHykCV+Fp5O+BVS+6j6y5lNxY2iKohoO+j4GmpnU/PzK8ru1WMFYd3okW?=
 =?us-ascii?Q?wGX5YqkTXWPIKvuwgDswbOQ3FP4zGr45eUeV/XDJKyV+6BlWPfRdJ3corLoa?=
 =?us-ascii?Q?RNlyVZBtdFWK3elr9+KQqku2ekT/2n2fII+GLPjVQIvhcqlAR/y335tM7nU8?=
 =?us-ascii?Q?pIV4i0RnULONs0p745XhVJXSfLWkTEdTsOXepVT3eLIVI7E9mRztYbPeT9Wl?=
 =?us-ascii?Q?dxfp2Wi+jTtepEur7aDOeJt0613D0D4wIKWkCmEMT+1UH53R5g2ZxhPvl2AO?=
 =?us-ascii?Q?FsXjpl3vU/zBA3Mb+s+cr+Kr5sV9ECKjG/CbascWtbYgq8iY6cg2hN7lc1y0?=
 =?us-ascii?Q?khpuKEyHx5QkBBK6yUdvK0I7Olo0kK/jQ+lwzoe6FG8q269o6ncoZEUL3fBy?=
 =?us-ascii?Q?sAOdzzjZkIHD5jMgmqr310S198fVCHCy9hQqfti4lH1ZvTxPM/rUlZbiY1qG?=
 =?us-ascii?Q?VoNjmRO41WUcE6/5cWjNOnE7skoZoidTY55M5cP0HoU9tycCrbiTEjrpFqdi?=
 =?us-ascii?Q?fgNgciN74onMhXe9GwAhZYfCoRGswOeBhbwy8rOtqPAIaDVDCoRM+sttAjpL?=
 =?us-ascii?Q?rQv49qEDobCYP62TesHFnmM28DJZn3Pt4uZlS82g6KpyxCKMLw1LMP7TXVOt?=
 =?us-ascii?Q?hjzmOG68eb8YWP4a3jks0anxlh4weSn9ojLPYMdEqWd9iRYxtVbn/aVaBTzC?=
 =?us-ascii?Q?785Oq+/M4FlcXxwhBLDEaQ072qzyonHHK3/QbmjUu3+j3KQxuUog05wuUNWC?=
 =?us-ascii?Q?HB2mRtPfePWU9z+Su0P93l/cHHG8gH5/M6Y/nO84IWmDPF+WX2MdHtYU9rmC?=
 =?us-ascii?Q?dZ0V8ODKpRAM/7Vom6AiA9r3YXyUBQ2gXYv3+R3UwQB1OuFeUNO2WQgvSZF7?=
 =?us-ascii?Q?3Y7PZiA/SKCYXE0yhmsk9vTFOXeOXQGae/TBdB2CfRkQKf2feI1pWGvjkhja?=
 =?us-ascii?Q?XwvtMlijAAb37P1BjzZaSbdN7TG5+ktdrqlYb52XbjOi8zRUOoJCkvxw2Aon?=
 =?us-ascii?Q?/CDqCc7c2JkmaIYTQ9D42HEiKaVbfjh/OfCUvzM9g5vh6ob9BE+W6NNZuKNF?=
 =?us-ascii?Q?wtB7wMd1eLsgxdQhoc+7UR/is7m33gYKPOmZWlNICDhCnuB+qlDf2AgbA+Jt?=
 =?us-ascii?Q?nSqOSYvFyA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdeafa03-c026-4f99-6549-08de6e82554e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:59.2236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF/xmvzmAxHVr2ayGAl9UBZhWxCBs6Rh1vY3aALMAokOd7LKdCSnbhkTsYinXkcl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 756721521AD
X-Rspamd-Action: no action

This attach function always creates a SGT mapping type importer.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 Documentation/gpu/todo.rst                         |  2 +-
 drivers/accel/amdxdna/amdxdna_gem.c                |  2 +-
 drivers/accel/ivpu/ivpu_gem.c                      |  2 +-
 drivers/accel/qaic/qaic_data.c                     |  2 +-
 drivers/dma-buf/dma-buf.c                          | 14 +++++++-------
 drivers/gpu/drm/armada/armada_gem.c                |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  2 +-
 drivers/gpu/drm/drm_prime.c                        |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |  2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |  2 +-
 drivers/gpu/drm/tegra/gem.c                        |  4 ++--
 drivers/iio/industrialio-buffer.c                  |  2 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |  2 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |  2 +-
 .../media/platform/nvidia/tegra-vde/dmabuf-cache.c |  2 +-
 drivers/misc/fastrpc.c                             |  2 +-
 drivers/usb/gadget/function/f_fs.c                 |  2 +-
 drivers/xen/gntdev-dmabuf.c                        |  2 +-
 include/linux/dma-buf.h                            | 10 +++++-----
 io_uring/zcrx.c                                    |  2 +-
 net/core/devmem.c                                  |  2 +-
 22 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 9013ced318cb97..9a690a1bf62b5a 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -608,7 +608,7 @@ Remove automatic page mapping from dma-buf importing
 
 When importing dma-bufs, the dma-buf and PRIME frameworks automatically map
 imported pages into the importer's DMA area. drm_gem_prime_fd_to_handle() and
-drm_gem_prime_handle_to_fd() require that importers call dma_buf_attach()
+drm_gem_prime_handle_to_fd() require that importers call dma_buf_sgt_attach()
 even if they never do actual device DMA, but only CPU access through
 dma_buf_vmap(). This is a problem for USB devices, which do not support DMA
 operations.
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index ccc78aeeb4c0fc..ddaf3f59adaf6c 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -605,7 +605,7 @@ amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
 
 	get_dma_buf(dma_buf);
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_sgt_attach(dma_buf, dev->dev);
 	if (IS_ERR(attach)) {
 		ret = PTR_ERR(attach);
 		goto put_buf;
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 1fcb454f4cb33b..4d26244a394daf 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -219,7 +219,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 	struct ivpu_bo *bo;
 	int ret;
 
-	attach = dma_buf_attach(dma_buf, attach_dev);
+	attach = dma_buf_sgt_attach(dma_buf, attach_dev);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 8e2e597bc1ff03..19126309105165 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -831,7 +831,7 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
 	obj = &bo->base;
 	get_dma_buf(dma_buf);
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_sgt_attach(dma_buf, dev->dev);
 	if (IS_ERR(attach)) {
 		ret = PTR_ERR(attach);
 		goto attach_fail;
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 35d3bbb4bb053c..ded9331a493c36 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -646,7 +646,7 @@ static struct file *dma_buf_getfile(size_t size, int flags)
  * 2. Userspace passes this file-descriptors to all drivers it wants this buffer
  *    to share with: First the file descriptor is converted to a &dma_buf using
  *    dma_buf_get(). Then the buffer is attached to the device using
- *    dma_buf_attach().
+ *    dma_buf_sgt_attach().
  *
  *    Up to this stage the exporter is still free to migrate or reallocate the
  *    backing storage.
@@ -875,7 +875,7 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
  * 2. Importers must not hold the dma-buf reservation lock when calling these
  *    functions:
  *
- *     - dma_buf_attach()
+ *     - dma_buf_sgt_attach()
  *     - dma_buf_dynamic_attach()
  *     - dma_buf_detach()
  *     - dma_buf_export()
@@ -999,15 +999,15 @@ struct dma_buf_attachment *dma_buf_mapping_attach(
 EXPORT_SYMBOL_NS_GPL(dma_buf_mapping_attach, "DMA_BUF");
 
 /**
- * dma_buf_attach - Wrapper for dma_buf_mapping_attach
+ * dma_buf_sgt_attach - Wrapper for dma_buf_mapping_attach
  * @dmabuf:	[in]	buffer to attach device to.
  * @dev:	[in]	device to be attached.
  *
  * Wrapper to call dma_buf_mapping_attach() for drivers which still use a static
  * mapping.
  */
-struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
-					  struct device *dev)
+struct dma_buf_attachment *dma_buf_sgt_attach(struct dma_buf *dmabuf,
+					      struct device *dev)
 {
 	struct dma_buf_mapping_match sgt_match[] = {
 		DMA_BUF_IMAPPING_SGT(dev, DMA_SGT_NO_P2P),
@@ -1016,7 +1016,7 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 	return dma_buf_mapping_attach(dmabuf, sgt_match, ARRAY_SIZE(sgt_match),
 				      NULL, NULL);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
+EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_attach, "DMA_BUF");
 
 /**
  * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
@@ -1048,7 +1048,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
  * @dmabuf:	[in]	buffer to detach from.
  * @attach:	[in]	attachment to be detached; is free'd after this call.
  *
- * Clean up a device attachment obtained by calling dma_buf_attach().
+ * Clean up a device attachment obtained by calling dma_buf_sgt_attach().
  *
  * Optionally this calls &dma_buf_ops.detach for device-specific detach.
  */
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index dee5fef5eb4f7b..a2efa57114e283 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -518,7 +518,7 @@ armada_gem_prime_import(struct drm_device *dev, struct dma_buf *buf)
 		}
 	}
 
-	attach = dma_buf_attach(buf, dev->dev);
+	attach = dma_buf_sgt_attach(buf, dev->dev);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index f13eb5f36e8a97..8e7c4ac9ab85f8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -865,7 +865,7 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 		return obj;
 	}
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_sgt_attach(dma_buf, dev->dev);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 6f98d0c123dc8d..6fecc3c1b362d3 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -999,7 +999,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 	if (!dev->driver->gem_prime_import_sg_table)
 		return ERR_PTR(-EINVAL);
 
-	attach = dma_buf_attach(dma_buf, attach_dev);
+	attach = dma_buf_sgt_attach(dma_buf, attach_dev);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 325442948fafe0..069367edcad2a5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -306,7 +306,7 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 		return ERR_PTR(-E2BIG);
 
 	/* need to attach */
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_sgt_attach(dma_buf, dev->dev);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 6b6d235fd3e9fd..3c193e6d9d11e2 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -287,7 +287,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		goto out_import;
 
 	/* Now try a fake an importer */
-	import_attach = dma_buf_attach(dmabuf, obj->base.dev->dev);
+	import_attach = dma_buf_sgt_attach(dmabuf, obj->base.dev->dev);
 	if (IS_ERR(import_attach)) {
 		err = PTR_ERR(import_attach);
 		goto out_import;
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index c549b94b2e8ad5..ca0962a995099a 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -115,7 +115,7 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
 		}
 	}
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_sgt_attach(dma_buf, dev->dev);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 6b93f4d42df26c..19c83556e147c1 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -80,7 +80,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 	if (obj->dma_buf) {
 		struct dma_buf *buf = obj->dma_buf;
 
-		map->attach = dma_buf_attach(buf, dev);
+		map->attach = dma_buf_sgt_attach(buf, dev);
 		if (IS_ERR(map->attach)) {
 			err = PTR_ERR(map->attach);
 			goto free;
@@ -472,7 +472,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 	 * domain, map it first to the DRM device to get an sgt.
 	 */
 	if (tegra->domain) {
-		attach = dma_buf_attach(buf, drm->dev);
+		attach = dma_buf_sgt_attach(buf, drm->dev);
 		if (IS_ERR(attach)) {
 			err = PTR_ERR(attach);
 			goto free;
diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 973db853525958..0d170978108cae 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1688,7 +1688,7 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
 		goto err_free_priv;
 	}
 
-	attach = dma_buf_attach(dmabuf, dma_dev);
+	attach = dma_buf_sgt_attach(dmabuf, dma_dev);
 	if (IS_ERR(attach)) {
 		err = PTR_ERR(attach);
 		goto err_dmabuf_put;
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 6c18a0b33546e8..0e40799687d4ee 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -789,7 +789,7 @@ static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
 	buf->vb = vb;
 
 	/* create attachment for the dmabuf with the user device */
-	dba = dma_buf_attach(dbuf, buf->dev);
+	dba = dma_buf_sgt_attach(dbuf, buf->dev);
 	if (IS_ERR(dba)) {
 		pr_err("failed to attach dmabuf\n");
 		kfree(buf);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index a5b855f055e358..a397498d669111 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -637,7 +637,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
 
 	buf->dev = dev;
 	/* create attachment for the dmabuf with the user device */
-	dba = dma_buf_attach(dbuf, buf->dev);
+	dba = dma_buf_sgt_attach(dbuf, buf->dev);
 	if (IS_ERR(dba)) {
 		pr_err("failed to attach dmabuf\n");
 		kfree(buf);
diff --git a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
index 04ea8ffd4836c9..02175c39cfddf9 100644
--- a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
+++ b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
@@ -96,7 +96,7 @@ int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
 		goto ref;
 	}
 
-	attachment = dma_buf_attach(dmabuf, dev);
+	attachment = dma_buf_sgt_attach(dmabuf, dev);
 	if (IS_ERR(attachment)) {
 		dev_err(dev, "Failed to attach dmabuf\n");
 		err = PTR_ERR(attachment);
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a7376d4a07c73c..391026b15a6dc3 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -772,7 +772,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		goto get_err;
 	}
 
-	map->attach = dma_buf_attach(map->buf, sess->dev);
+	map->attach = dma_buf_sgt_attach(map->buf, sess->dev);
 	if (IS_ERR(map->attach)) {
 		dev_err(sess->dev, "Failed to attach dmabuf\n");
 		err = PTR_ERR(map->attach);
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index a6adbd132669e3..e66715f289d497 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1502,7 +1502,7 @@ static int ffs_dmabuf_attach(struct file *file, int fd)
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
 
-	attach = dma_buf_attach(dmabuf, gadget->dev.parent);
+	attach = dma_buf_sgt_attach(dmabuf, gadget->dev.parent);
 	if (IS_ERR(attach)) {
 		err = PTR_ERR(attach);
 		goto err_dmabuf_put;
diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 927265ae7a5dc8..b53bf6d92d27c2 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -582,7 +582,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 	gntdev_dmabuf->priv = priv;
 	gntdev_dmabuf->fd = fd;
 
-	attach = dma_buf_attach(dma_buf, dev);
+	attach = dma_buf_sgt_attach(dma_buf, dev);
 	if (IS_ERR(attach)) {
 		ret = ERR_CAST(attach);
 		goto fail_free_obj;
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 7fde67e1b4f459..456ed5767c05eb 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -70,7 +70,7 @@ struct dma_buf_ops {
 	/**
 	 * @attach:
 	 *
-	 * This is called from dma_buf_attach() to make sure that a given
+	 * This is called from dma_buf_sgt_attach() to make sure that a given
 	 * &dma_buf_attachment.dev can access the provided &dma_buf. Exporters
 	 * which support buffer objects in special locations like VRAM or
 	 * device-specific carveout areas should check whether the buffer could
@@ -118,7 +118,7 @@ struct dma_buf_ops {
 	 * exclusive with @cache_sgt_mapping.
 	 *
 	 * This is called automatically for non-dynamic importers from
-	 * dma_buf_attach().
+	 * dma_buf_sgt_attach().
 	 *
 	 * Note that similar to non-dynamic exporters in their @map_dma_buf
 	 * callback the driver must guarantee that the memory is available for
@@ -473,7 +473,7 @@ struct dma_buf_attach_ops {
  * and its user device(s). The list contains one attachment struct per device
  * attached to the buffer.
  *
- * An attachment is created by calling dma_buf_attach(), and released again by
+ * An attachment is created by calling dma_buf_sgt_attach(), and released again by
  * calling dma_buf_detach(). The DMA mapping itself needed to initiate a
  * transfer is created by dma_buf_sgt_map_attachment() and freed again by calling
  * dma_buf_sgt_unmap_attachment().
@@ -558,8 +558,8 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 	return !!dmabuf->ops->pin;
 }
 
-struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
-					  struct device *dev);
+struct dma_buf_attachment *dma_buf_sgt_attach(struct dma_buf *dmabuf,
+					      struct device *dev);
 struct dma_buf_attachment *
 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 		       const struct dma_buf_attach_ops *importer_ops,
diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 623fb97b8c5209..acc7a0b48c660e 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -130,7 +130,7 @@ static int io_import_dmabuf(struct io_zcrx_ifq *ifq,
 		goto err;
 	}
 
-	mem->attach = dma_buf_attach(mem->dmabuf, ifq->dev);
+	mem->attach = dma_buf_sgt_attach(mem->dmabuf, ifq->dev);
 	if (IS_ERR(mem->attach)) {
 		ret = PTR_ERR(mem->attach);
 		mem->attach = NULL;
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 9a1393d144e404..d4a86faf18c2f2 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -216,7 +216,7 @@ net_devmem_bind_dmabuf(struct net_device *dev,
 	binding->dmabuf = dmabuf;
 	binding->direction = direction;
 
-	binding->attachment = dma_buf_attach(binding->dmabuf, dma_dev);
+	binding->attachment = dma_buf_sgt_attach(binding->dmabuf, dma_dev);
 	if (IS_ERR(binding->attachment)) {
 		err = PTR_ERR(binding->attachment);
 		NL_SET_ERR_MSG(extack, "Failed to bind dmabuf to device");
-- 
2.43.0

