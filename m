Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMIMLQrKm2kJ7AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C831718B7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E37410E204;
	Mon, 23 Feb 2026 03:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tMc4QXQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013062.outbound.protection.outlook.com
 [40.93.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4692610E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:31:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGjHWDQKDRzoOuIS5I0p4T2wi+cF5as6m8hZfx8ELi5wjdq19s4xo2lchaXVZvm0e01xa7+gtw80/fcD3003GXqJ3xkh3UQjmBkGwCPY+E2WgWupzvMqsIbLvxUVfzpnL2cbtMRgMj5MXPBadavwy7hRCftv/zwLjrOLIpH/ybAakaO7lgVh4Y9yC8Mt6wq1A3vxVad7DQTlL8GYsAsodez1n1YuoCJdqat5R0HWPQqAWZTTAbXtYxmiDkR5TkW9Na+0b4ArbgGeDmJ/pJOMjM7omxBWgUwqDORR7B4oc1XVUJljo2StCL+HkokdzI7Ljhm6uU1s5qlJLEOdvefKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjUF0d4QsflH9XKowPzKdRadyVdtlMGRJbn9sUse+Ao=;
 b=dFE4oYmAE8Gf5ZNCKQWoZVKlLLZjo5q0XxOeyzeIntwK/d0nAYGJXwjWzxwcoNKJfnjYyvgdSKeBznmR4xtmGgVDQzyobs0woiPi2mJ8g/QsRAHdTN0XHprKVe9uoQNVVeA5s1O8gz8Z6wKHaSX7s14VWy+ymsNBqwT4vj3JlRTyj1YP0v+mQBSb3U9220MOFI5nKLuoePTbF4KD9uBnEEewnqpmNfG0tagMURtIZT5XCBJS4Xj4/Qr5cSWF65sgx2RbmQ91cgpasUoPTMC5EFgCA1FyfNehTUM2yJQKscfU/DHkNfWCtZYxyGFDFrpFA1mcYXrm/CP1refH+5kAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjUF0d4QsflH9XKowPzKdRadyVdtlMGRJbn9sUse+Ao=;
 b=tMc4QXQGxFTaMZN7/p6NXVnN98n1D6fDzzbNiyns2btAcxU+auaP84FuejeWjp2PyGzDcbNyU49FapeOzVwamfgHrX8yVhtvjtD6hVtZI9Z0NIRPEk+pRSvu5tnCZr9x6bsz5Gkk+RxNS8O6erTS1QmtwyelKVyr637vhaiu289o1marEjNsbYQ/sy5KJx0/t2SIrY6HYtF/riabuwZcVbuBWaDMy9OjTf5jEvxWegFIEVMxYUgy+hlo6esMx9oF9I1pu/fa4AfyRMGfMndwIZXfAQD5mjIOnyT6lcUO0Mj0ohRLFyrCq1mx7lxrNUCDoX99geisCuNSwxmJwyBw6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB8908.namprd12.prod.outlook.com (2603:10b6:208:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 03:31:06 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:31:06 +0000
From: Zi Yan <ziy@nvidia.com>
To: linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [PATCH v1 07/11] null_blk: zero page->private when freeing pages
Date: Sun, 22 Feb 2026 22:26:37 -0500
Message-ID: <20260223032641.1859381-8-ziy@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223032641.1859381-1-ziy@nvidia.com>
References: <20260223032641.1859381-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:208:335::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c2dd34-18c0-47bd-08e6-08de728bfa96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3/2D/I8DDlhytMFEJFJJH4BheJLlk1XYVxcWbQeQWEmCI1pCuN11jxyfFHxx?=
 =?us-ascii?Q?y8M9tLU0jHlyBzlZweLWZrg9DB3GjFZdq6pDo4urK4jyC+Z+o/skP2CnN+pC?=
 =?us-ascii?Q?nf0j3P/R0jf1RehJOfrt8JksdRYuTbz1khZl35OYBB1GYnpPf6TexvdN+KP0?=
 =?us-ascii?Q?/ShojhXIM1UwV8Pl8mtDB1esytcMu8ZVXzrOY+rD/qskxNmsfG+6D3Rs9Hyr?=
 =?us-ascii?Q?MsGF+Zayd3VWDnWepquututsIe88ey/jxCquXTXwxRP3D+38m+cp+LhvpeND?=
 =?us-ascii?Q?sAO8v/LK118aa853HPV/ckuoFgN45ts1fAFWu5kaHPWztfUDGvdZEhsqSSsl?=
 =?us-ascii?Q?0TpuFIOXjyzZZLtCEpL9ik7d1CZJGhm6xXwlOWQqok568Coz0ZFK3jJLIzS2?=
 =?us-ascii?Q?lYejuZfTeqPDIUTDl2ev1AOBfLzlP4+5lluEEW4hbetiKA0YP60uh8Mr+QeR?=
 =?us-ascii?Q?XnOvte1x1KR7+cU5HIL+Ro74J3Vs+lKaLPnDeqdnEATcsTwbCzVIP1JMo3NS?=
 =?us-ascii?Q?IPv08tg9bMIzUePjGNVjB2sDICuzj2zM8q3SaFqVqjdSbKidh6ttYlLPb74/?=
 =?us-ascii?Q?irOBAAuWGUChkbcjVC5VKC3+uvFuySf8O53y5CLmerEXade4QlqKvONSocEB?=
 =?us-ascii?Q?u3m9LNVGEpAeGgSGOCl0AI8ujYgfeWW6NK2z7s6y9htUK+Wyi+aKqbzceb9T?=
 =?us-ascii?Q?Lcd5S7vPtosCR4sc/6N5qAfiT9WEty6PG9S58XV4nJXfrieEAjOeKakC743e?=
 =?us-ascii?Q?zGQxjZO90kQfVeTR0Znn6cc9Kb65plAkA4PY4H+YgSYmQBXhLhejS6izbaTI?=
 =?us-ascii?Q?sd5+SV4jlboAiyxNOZOkWvQ68jTh60XaHZEJcKxc67q2iDpo5fvElbenIedY?=
 =?us-ascii?Q?PXACL1EnEyGX8tOvHfxROmANdCDp0i9sCmO6RIXF/Mm+6ZABvsz+2zMcVgKG?=
 =?us-ascii?Q?3CfhKJL8USSiKnxCAxops0Goy8XMklyveYHzVbMQOULPpC7iXUPIgbGyupaU?=
 =?us-ascii?Q?GIZLDqCqWeLG3Xyvse/m5AOi7Cbs/MhwTQG9LtNTYl/i0lD9mekVYMxV5Zut?=
 =?us-ascii?Q?oXMBjKv7MtdFsHpZCu/in1qvS3jgT+xqCVcn8xhfJHG1znx4c7poqS2OGt+H?=
 =?us-ascii?Q?9xvZD+iw5bEi6g8AnZ0GnF4oxpAnBd6WPPyrZlVY1YfiXYd2labqBKUw1Lyx?=
 =?us-ascii?Q?edsm+vOiXjmd3YiSkTK9JqU3nSi0zqoKSY+/aFKZRAVrh/sk6i41gi4ZcK4X?=
 =?us-ascii?Q?QJoldjLWwugjausfWFPsvQADhFECgNePxw4N5o0/WmctVKgnMmNMUjFPCs9y?=
 =?us-ascii?Q?/IrYBy6iqERBd0G49uSBJ7j7QVzcjt0pl7EY27ZswiPNCsR6gejKTGRohj9N?=
 =?us-ascii?Q?xTCcZ8HpqhVi3rD8JHT/TDbHevF3KQZ+iz9li9UabvrtqX0FeI6/z7lfkKb6?=
 =?us-ascii?Q?DjadzwpPMkzPzCVjoodZhA5g5JcAU/9ORWMAje9+EpdghIqvI+LNelzGR5ES?=
 =?us-ascii?Q?jp5jAXjcJ83qd0g8eSW8qQThANJwkHoJEBe10RoPPOzLL96VnxdmZmAxWGr7?=
 =?us-ascii?Q?H++Be/bkeuB/cxOCOJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vxInXFkLFxu9I+gSiqXgjcR/96Hc+u+NxNO0DAC+hYTPcJa3t9XsRPhyYIyC?=
 =?us-ascii?Q?VAZILGCL3uEtVLyeloj5Fv8Uu9ojM0MqDXBRkq+hSm1anXAYsSK+IJ9zRMHb?=
 =?us-ascii?Q?ZGE/oEThai4ITT1C5mAWJoGmlNzNIMGhqK169TKiz+W5sz9hfQCMCw6dc6/Y?=
 =?us-ascii?Q?UItYwkHCxsUZJrZC7QEBU/RHR1WWKRIfPaN5fhKBMQt4/Gzgjr/tY0vj4WuL?=
 =?us-ascii?Q?2P3wLSZ5gMSylWF9YbGL65On7by2imPkyXsfkUuaDMQtYld49Ojs3mNnYpMR?=
 =?us-ascii?Q?ktr2Fje4lrkbwh631ctOaG4fEVgfLREcaqu4HbIeJr6NMMXLGpNO/4jV/RO8?=
 =?us-ascii?Q?LQMsESotKISbLHWPV9NIU2E+XknEvPycRUNX3ytZIXl1ew7tfEvBFS+ZesFl?=
 =?us-ascii?Q?Az6Lg1yknOB6k4/HiIexe+RiAcpUA+ypho+zuaCvZjVIgCYsCoT9TrLEfx01?=
 =?us-ascii?Q?KgU88c4K9HIEhvIWCTFMpZ+iAj4EtQuD8s3/YXsyVGj7Bp53YXMj1+Obl5ja?=
 =?us-ascii?Q?459GaHW4T+lz2VXT0+mkF/n9ZqyH/zy9m5RVW8zlDZfQG3CG24lnMDtCz5Q2?=
 =?us-ascii?Q?bdPCHTyCQHBEl0sKkZgsx5NHxaKSPJ1rx7fDarEBw13tYV2eQ1/BhNEGt3+l?=
 =?us-ascii?Q?4GRIRn91o7UpmOBHTX+bBMTGi5S3quAv+/xxx5eTmlyOHONsWfiS7MWFhWsu?=
 =?us-ascii?Q?st5pvzkCbrz01KoXvw/14Hw3ILoBT4ECNGYPa/zH7AOL3b0JFSdSjdZ7KYEL?=
 =?us-ascii?Q?Hi6lC+a8YqE30Expy12KX49AUhFrOn60rJ7SF4JoS/WkG0fRgp+gUOdZvftL?=
 =?us-ascii?Q?Q1MwjvFIVpV3y8u5d4tcNpevogxjwUuMugllN2AjZYN76AvDJLrKysZfrVTK?=
 =?us-ascii?Q?GkCJGYFoac3eOdzT5EJN67H6IAXf4dE0iCknzrU7CdjPJVp/zi+s/wbjmd5X?=
 =?us-ascii?Q?CMQ9znufLKTYugvVHi1jMV7Y4cJQ8iKJ4X30KilmdihDxeL1ekN8RxCuwZ7P?=
 =?us-ascii?Q?wPAJS6aldp8pUo/w/poi8IbFFEfXNAMC8oZ1jNqnmvx/jcIP99duJZhw6jc5?=
 =?us-ascii?Q?gIUERh52epOwLnmIeqDlYVI/35TPHPmeEBfxiSMaUqcNZbYow01ytRAM0YCF?=
 =?us-ascii?Q?4CFJgrF94kN1Y0Z2MADQtqTmNA4W1DkAK4opSuMmbmDqNJOLfTHnSu/TFyG+?=
 =?us-ascii?Q?OsdRmpiM2SwkysHiDD4vRM/sVGgLh5gajF/i3yxqI1m1FdkFObALD5Z2bzBs?=
 =?us-ascii?Q?gpN+dn/nSp0n1mw6pptzFrYRBJMf3G+VvDQ8gPp8De3DZDPAEmb4YJTPoA3j?=
 =?us-ascii?Q?OCY5U8AUR34QyswzgD7n7Negt2m08mwQXI55QRyVykpYez+31WD/UZiH52mT?=
 =?us-ascii?Q?Al3Kl5IyAJnZ8gr6KexWwrRs1tm2s7zH5J1KYwjN2VhyX6u1WAWMMSwI/4pL?=
 =?us-ascii?Q?TnfOPcjKCeh0ECOPDhqpCk0yiPnFrrQtnjrBxYPV8Iixj0WBjw+jKR9Zpt6t?=
 =?us-ascii?Q?BPdXXp3KgU+0R+z3eByxlfuzuflAqW32e+ppD2kwpTKsYhH6kJ6HHcfaN2Nj?=
 =?us-ascii?Q?HGlsB+mCN+d5kguNl4t8gVQpUuzRP9cKEPgiDHq1d2C1HggY1aCMGqu446u9?=
 =?us-ascii?Q?I9Qi81xE+QxZsFvbmXz161eJnJ8DVhlqX8g0PTt+9xk3wNNEE3WVxrZ+WuMq?=
 =?us-ascii?Q?C7d7ulJYArsIuVh3ZXf0aB7YWvHuY0Pupxv75R+8opj/WaJq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c2dd34-18c0-47bd-08e6-08de728bfa96
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:31:06.4198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYiBd15LmjVQPpW6KUV2lLuhDITUw5wbrHufWk1w4w1humNAJZ5MOc7vJjW09YDD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8908
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ziy@nvidia.com,m:axboe@kernel.dk,m:dlemoal@kernel.org,m:johannes.thumshirn@wdc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,kernel.dk:email,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,wdc.com:email]
X-Rspamd-Queue-Id: 07C831718B7
X-Rspamd-Action: no action

This prepares for upcoming checks in page freeing path.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: linux-block@vger.kernel.org
---
 drivers/block/null_blk/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 740a8ac42075..86ea2644080f 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -886,6 +886,7 @@ static void null_free_page(struct nullb_page *t_page)
 	__set_bit(NULLB_PAGE_FREE, t_page->bitmap);
 	if (test_bit(NULLB_PAGE_LOCK, t_page->bitmap))
 		return;
+	set_page_private(t_page->page, 0);
 	__free_page(t_page->page);
 	kfree(t_page);
 }
-- 
2.51.0

