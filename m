Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IH0FyAGlWmmKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D023715237E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CD510E550;
	Wed, 18 Feb 2026 00:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NWi2Kvv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA6810E54F;
 Wed, 18 Feb 2026 00:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6rB1AW5uGvrF/GL/VxHSAI08RjnUkTMS2LQPsyFb7wAanRO4RKdZbO+qBnB/QtgrfhZBL8gw3NAUP6xk6OGWEEJqBqsrq1aUxQmjfydA3m+5Zr1y8ra7AcHtp+X3XSJJ2EWV/ybAaFO5iyzI0wqZDeWkfkWk8Q719kv57vEp7+9MtMku/7rybG9hzuvniCdtKvVYVFLAXf3AZj7ImWpyk8sAJ3NTprnsmKuW5VcOZEeruy1+X/qqjteWaw9+LKuJgb7tK3JFA+gteSE0rrDzYRPTXxT6AXNk+S5mIXkI299vcXdH+H9me4feTDDaAACNVn82i4JUSH8IFujLDoSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mZnUPDwtP+h9UOqgeqXFP6BVgKRc//1U51XG6J7wJM=;
 b=HiWdqsOLp8NEyGFgjdI/djZJS8k4wFo5KjDdys0qjih+/Pyuk5Jdim+5yuP1cAgZa48f7Dtom1qwhFmK7pN2ruFC8QE9yoiVBKzNneXQqx8IKUxNJsGkmqgkYydoD0QyskceRAAFmBMcRDfDqV83rO1omer0CdvKQ8VqoaZj9lVG6MLyeMtB1K9KXE9eBg31ZYIJppbAYM7U1CLaifpJwIRrPisrpdG5ao65GKtzobUbUV++HiSYDvSSLvwFcqF+ce8CJ7ezMUe2IGIacUGJu1++NhECvXv/yFjWvyJl+AqC1KsXfWezrLX+gCh4m5mBGS3sBL211tEuISwl7Hv2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mZnUPDwtP+h9UOqgeqXFP6BVgKRc//1U51XG6J7wJM=;
 b=NWi2Kvv6AqInOOcW63B5w0hxGqyLx3U65Y5P9PjcbBM2C1Cl5E6pf2MBQ9C+KHvJCzdhFmEGu1NzmaNj5sbobVqa7+hmw+zzXPCUHpKYlyETcmD/Gd+FHRnHNaLbhy55bWA3V/rmMtKdxblpINKoRRrcivFAj7jvn8/HXNAq+fS2sSwLEkFEDLL6iq5CiyWOLGkBE+rNvhz6eKWRWABvNs9NKpNQskgMqUyK4YDW1a7l7Wm7Gke1g0GQeD3WOLwDrzyr+m5U0TNT2+KuwogId+Pn0rnn85j885D5wGz891xBQuF0vzzcgFoVWGdTtLPEBdGMgGZI5i0e00Br/XjmdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9629.namprd12.prod.outlook.com (2603:10b6:930:101::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 00:21:39 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:21:39 +0000
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
Subject: [PATCH RFC 06/26] drm: Check the SGT ops for drm_gem_map_dma_buf()
Date: Tue, 17 Feb 2026 20:11:37 -0400
Message-ID: <6-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0003.namprd22.prod.outlook.com
 (2603:10b6:208:238::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c41bae-cdf8-40a4-f0d6-08de6e83af5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UWebg2fXhf8gBZZrU2wc6w8APMCn6p9DgjZnfDuErvioBKEr9MGoqEULGS89?=
 =?us-ascii?Q?ozRQGOxV2CbfXfiE5NhhYvPbq8CIV0muzQTB3p8XTGGKiaQKWMqzRczWR6Cn?=
 =?us-ascii?Q?J/ARUYI4nql/kQKkjj/ZNp24gFXwLLiNsIWn/c37FCJlBvDQJJBP/C8hNW3O?=
 =?us-ascii?Q?4LpkO2WQt5N3MJVGieJhvN2Oqaly4emOSqluEet5HyVakvpYJAp7vAIajv4W?=
 =?us-ascii?Q?rmquJg4CLA7KlNKvIkUgF2XOJoupWHKsPemaca4s/EcQH6SZ3ZXYP+mix/YR?=
 =?us-ascii?Q?ChDkiQ2S/Xki925j5TTK+p7PsrePsKfFWwOAeHxnh0D1HOV63/+Ci9aUBLsh?=
 =?us-ascii?Q?vondyqAMHwmZ7DPrDTD3O/n9w4HP8P3xo28JMfPsKesmKbqmPKSIiuKXfENY?=
 =?us-ascii?Q?aFAMrXYaAFHeHGvsKWk6Oy7m7XfcC24aTTBY2vJAp1pi27O3iScFCiTYJaV9?=
 =?us-ascii?Q?2SFFukWdkpcrlvkx6nxW+URI9DqXUET0CSICIxdalLEYvdvVtzQH4gOtoZlj?=
 =?us-ascii?Q?qlK40WAoohN/GLMIq9I2O/opzrhVVy1n1FMUGJDHzn4TrU65x5chUV4QHt4V?=
 =?us-ascii?Q?G9l+bsQxJf7yWkjgq9yFdcFwFIblKKuQpOuWz14pSWWeYaNzCsoK1W91OOUR?=
 =?us-ascii?Q?dkFSi/f/wcoN6J5vpL+KfgcpIl5BDzvOTiaP2ZvcTmhaIADFsUrVutHqNFcG?=
 =?us-ascii?Q?mZws9L3xiZlisqcw/jfC8/4ummhNXAo3BF7sL3bhR7LMMiJSD+XwaNyVdTJI?=
 =?us-ascii?Q?NjK/rv2s61lj57JtTTR6MweU/RyVTSm7uSu5iXNb/cuyXVTJ3ds3jX90RqNm?=
 =?us-ascii?Q?AjcCBLi7xNaNTOaaHFNdPJCvH8O8rsgpkkNQunrqDPVFt4fV+IZudCUveIno?=
 =?us-ascii?Q?bIW9vNPasUhx8BVDkQjg5D4nar+FOu5XoRbqtr7e/6mx2Gp5fwnQk535g47t?=
 =?us-ascii?Q?YQFaweKT2RwRl0haoy0oouGckreWI6iDWBQiCiiK+mfp+5smaDiSDKY/QNXm?=
 =?us-ascii?Q?2OgnewM1fWjsvAVDpnk30azovwCGY+iv1723qiVwS66hkpukknZf0tc0XV70?=
 =?us-ascii?Q?W31johY9HUBsFIimVWY7IOQgTH/E2uMcz1KNVxJcvnVCiEkec7qTDVJz4p00?=
 =?us-ascii?Q?1BfJBn0gDiUDU92czhgBT4eO429vrf0TW9Mp1pjA3bHlcBvaZHSkd0nLM0QF?=
 =?us-ascii?Q?Fqbl67bBavfCL5VtU4vc2QKZYZ7+Lh8MkmhpHp6dlGIamFrMewIqamWP77ap?=
 =?us-ascii?Q?MSvqoMabdT57SgfBb3l9F3tsUBdCrqNH/918N1P7gCbSRGA2kOMb8kN1yPCW?=
 =?us-ascii?Q?Rzlz1HIjx/DNIpmkaxeqC7tm3Cw1lL2AC86eOM3j0P8Ly7b0xaqjTXcszSDS?=
 =?us-ascii?Q?1j3TZLL3KI9Q+x+rF2hUdm8ibEwCXsxTew106uhl+arb+4n0/vdK0UJJFDYI?=
 =?us-ascii?Q?lx01FAm5s4oLJ7XX4ox12yci4DdTycdLRjf3yJuYVZPnyw532CqPqvpCQLUR?=
 =?us-ascii?Q?62OmKI6I3d5za2CrYRjFklPX+Qhycmh4dHzMZGGvRt6XXQKcbu/n3MFTkEHf?=
 =?us-ascii?Q?yExOqQgLW5rBhFurp78=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cIv7gmW/JOjgeJ+fnLoed5/ejpjVryca2suQySW3zpEGvTRs1oVUwmZjXBg/?=
 =?us-ascii?Q?1KWcDRf7r5pMygDa7X1mdk0ByM6Gii+XQe2Awh0chVQFoAn4QOBi8yeOgm5c?=
 =?us-ascii?Q?eDrk2YbgJfvBQgof8n1WIUqdGenJaOTfVfVW/EZDkvvPyA3HRDI8tuDx3MCe?=
 =?us-ascii?Q?fcZRldy4zvVp2HxgW/y3DIL6t0M8DHy9fSOm9/77q66hm+yQHxDB6qOkf97+?=
 =?us-ascii?Q?DVIAeclde6ZUJR4dy2T/WJLy92ZwADxyt7Dylc/UDpEeMiROlN687iC05Kmm?=
 =?us-ascii?Q?2HQcKlFk5eZVUdMqhrlldzUAPD0NnLE+f7zLeZZtxWGck8hBY15YOY8SpRM8?=
 =?us-ascii?Q?r0jRxiNHEH6RuwAwpVkc2ajrDgjCmA4zpg9h7Sfg7gED31BcntAzw2DFLGVd?=
 =?us-ascii?Q?GoSGkHQvR+rW7+Wr2wPiuksW70ztsQhiTfULwxHbIlKnUofrcQ/7ZjF/Nw9B?=
 =?us-ascii?Q?F/MEDoZLcGOpMDsmab4QDSlxdXIH0KyOkgPeeRiU7eZiv8BzdpUHo5c8uBpf?=
 =?us-ascii?Q?0lhC7Hk26jD+McTG0LvUlp4GAzUKG5d2pj2WzuhXNEt5hO2Z7Tx5fqpZ/6hh?=
 =?us-ascii?Q?ifTIppHygbZmLnM3hDPTaNrm2ecSPJnqBM6sQ3rtLzlg9I3buaHkogu/geCZ?=
 =?us-ascii?Q?nkelgH9NYVghPGTXROI70cRI8+/a0fXvgbF6lmrT3sPhznyttxHgK44f8z/c?=
 =?us-ascii?Q?aZ9KpbOupCML688g9YwdFg44aG1DlXZHrgXMw2I8G1kKpnYjCLnNrTtwSWL4?=
 =?us-ascii?Q?JMAfeMpUNNn5Rf7ejpx5TDy6MItEGAMrZT5RPHi+ekUaxa2Uq8dydG6wBs+/?=
 =?us-ascii?Q?2JoAsfJqy6oJMs0x862a4RsBkJa3nRSdcPnRtaeHEx47CuR7RZM7B5E0ifjB?=
 =?us-ascii?Q?RABACY0smZGY9lJtf4sX3OHkdG48VsD5kS1btdv91S7sPHGI9yhE97iMGFhT?=
 =?us-ascii?Q?9vckSRgyVp3Mjd9ssW4fMBf4EVVlHkUc74PpAEcg1I3CWcYtLht5JdZj9xIy?=
 =?us-ascii?Q?7sQ00MOiqfRUzUqDwWasjQXhBAWFCd5Yb2f3U23CEOPGdlg9QY3of1oU43i8?=
 =?us-ascii?Q?n54wvZn3Pwwc8LAcT+zckacRH/9J/qQ1s+KZwhw3Su9CVrS0/Pt+uERBTXft?=
 =?us-ascii?Q?YS02EJjWqebqkWH4zpvflEnsjTHgqvkzTZ2ty1w+VtoHMVH5ms/6HFx6Y2kf?=
 =?us-ascii?Q?MlXg4Df4CYwwkpZ+St57xGVlaVAeoIQ6wtIsIO0b9N2ztue/5ffI5bZ2RdG6?=
 =?us-ascii?Q?hv7PKqiYfpEgUTk6u6y8VOnb4l8Zoaapk4gT1Ths+rqNQ96AXKqozpFuJa8N?=
 =?us-ascii?Q?GhVn5hdK04pUZjdCxrt3IOFPfbEX4KJB072UcbqxC4kQzL4ju0KTZPjMk5ss?=
 =?us-ascii?Q?swbLZ1BouvW7eilesZiGZoZidU82PSlRz1JPxb625f4hGys6klYzaoXe1F+p?=
 =?us-ascii?Q?txMthi4vpt81Xybdb7+WQ4TXp/EpDN0p+RY8KASCMAYjJA2hDbzEXTepkV+Y?=
 =?us-ascii?Q?cyXWmk8ARxZiuZHVESV5SSpfh3p3o8gAFjus0WKjumK+cOUMvCUGahlgqZrC?=
 =?us-ascii?Q?2wiElMZ+byK+FcNfb8gYGIxHdifVeJHBAODIfsWHso3XcoL8J6jmT2c2QtcW?=
 =?us-ascii?Q?S+jEvaII59c62WiQafXEPM94oJQ3762sGRsz8cGXqeqhcUlfClIfbCr/mSNT?=
 =?us-ascii?Q?rA2noNzevDH91HkS4CM3QG1jRErWxe7GTB4mDVvFjRjT2pD/G3DiICzbN/Pn?=
 =?us-ascii?Q?ctT51ABTPw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c41bae-cdf8-40a4-f0d6-08de6e83af5f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:21:39.7717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: labc2XCxIro9PKC2IaW7zEE3A6AFAGFn8Lp/5uTTzmQ+s9ItEBYlu+hUoFT/8wVR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9629
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
X-Rspamd-Queue-Id: D023715237E
X-Rspamd-Action: no action

When the next patch converts exporters to use SGT natively, the
dma_buf->ops->map_dma_buf will become NULL. Additionally check
sgt_exp_ops to see the new location.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/drm_prime.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 21809a82187b12..d093a888b0df8f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -28,6 +28,7 @@
 
 #include <linux/export.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/rbtree.h>
 #include <linux/module.h>
 
@@ -587,6 +588,18 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
  * option for sharing lots of buffers for rendering.
  */
 
+static bool is_gem_map_dma_buf(struct dma_buf_attachment *attach)
+{
+	const struct dma_buf_mapping_sgt_exp_ops *sgt_exp_ops =
+		dma_buf_get_sgt_ops(attach);
+
+	if (attach->dmabuf->ops->map_dma_buf == drm_gem_map_dma_buf)
+		return true;
+	if (sgt_exp_ops && sgt_exp_ops->map_dma_buf == drm_gem_map_dma_buf)
+		return true;
+	return false;
+}
+
 /**
  * drm_gem_map_attach - dma_buf attach implementation for GEM
  * @dma_buf: buffer to attach device to
@@ -608,7 +621,7 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
 	 * drm_gem_map_dma_buf() requires obj->get_sg_table(), but drivers
 	 * that implement their own ->map_dma_buf() do not.
 	 */
-	if (dma_buf->ops->map_dma_buf == drm_gem_map_dma_buf &&
+	if (is_gem_map_dma_buf(attach) &&
 	    !obj->funcs->get_sg_table)
 		return -ENOSYS;
 
-- 
2.43.0

