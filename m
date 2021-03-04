Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A119632D750
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 17:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D086E4C5;
	Thu,  4 Mar 2021 16:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700045.outbound.protection.outlook.com [40.107.70.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A476E4C5;
 Thu,  4 Mar 2021 16:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InENAle+SjD/pCnOvN4gNo2scB1dXRk45CpvuA3eyMVLnk9BFkLxq2ysbOmwUgcYK4ny3WFGhL4KiLab+vu+YDPWclkwWsaHDt4RmotmRLkMoDpHZIUUeWBnPo9hx3gy96/z1UTYYSVSUMr8fJA+jQ33M9SZrjz8ayRjS+wCADJoTPxGecZ1JBIHWOsU8Fik13d9RCr5si6nv7t08euHXDRDMs3rYbbx4l0iFrx8apcetmbPHJaFfI//oxM1ZP9HtT47aZDf+du+5T1wR6mMkJis7sjJP5k5/f68dQnkQ2p1LlSh6AUuAbIKk/OTzkqxD+FdYE+U3VRV5zPcJ1FjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaQmUdi+/33j/VOjtfYbIDG3+8YrBouXLD3Ap94/+rI=;
 b=eQy03LdpVP3z40zJczQevK3Zeo02+0LzZwLWJp0X/faI995sE8vcX/apYMG49ku9LZjD4WHAfLBH+/cGj0RVdxL5KDe8KJ7Qde9AP5UeCYpa903vn45Bk2XmDchUXM3vlSNNg7q8FNUAIB8/FVwE5TUsqRKsUy0ftwQlNcRcZ5cTTSIt4kbQ24LnMbtisEIiNte0X0GIzbtUgnUsTaiM0CXyTcnYPp0A8wgGL0o+Xi6Ce6D7AriI/hfBrzJ0rFWZpGDN1COtFX1YZDGrNFfjpwh7gcBsWH4yhNKT61gUOZBNoMoQmxqn/ntqIpsmXrKMjD6HjAPsaDYpQf7Zn9rM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaQmUdi+/33j/VOjtfYbIDG3+8YrBouXLD3Ap94/+rI=;
 b=UONp3WTVnQLgrLwiY+98YxIGJvYq2dId1OtrjHRNIXt0eZCasDvHcvrZEWDl2MUfqS0G4ZRnTeGKEGMoYa1GnJ9FW9BheqzSM0Y3tOec3pz3HcLzNUePeRRRbhY4R6UBFtbpvahq5cfWfChms/yv/c+KdjRMY6nEBrPPysfYM90=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4734.namprd12.prod.outlook.com (2603:10b6:805:e2::20)
 by SN6PR12MB4736.namprd12.prod.outlook.com (2603:10b6:805:e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 16:05:05 +0000
Received: from SN6PR12MB4734.namprd12.prod.outlook.com
 ([fe80::2984:fa58:6c16:469e]) by SN6PR12MB4734.namprd12.prod.outlook.com
 ([fe80::2984:fa58:6c16:469e%3]) with mapi id 15.20.3912.018; Thu, 4 Mar 2021
 16:05:05 +0000
From: Oak Zeng <Oak.Zeng@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 brahma_sw_dev@amd.com
Subject: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching setting
Date: Thu,  4 Mar 2021 10:04:51 -0600
Message-Id: <1614873891-5836-1-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTXPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::42) To SN6PR12MB4734.namprd12.prod.outlook.com
 (2603:10b6:805:e2::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ozeng-develop.amd.com (165.204.55.250) by
 YTXPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3890.26 via Frontend
 Transport; Thu, 4 Mar 2021 16:05:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c275cafc-948f-4851-bc54-08d8df274626
X-MS-TrafficTypeDiagnostic: SN6PR12MB4736:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47364549C83F2ED35BA98BA780979@SN6PR12MB4736.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nuAMQQ0yRiOqBev4LDp/7zICl7QF0NTjYPdbrbIhn4/fr3HbBq9qx7GBIK4RKdhMp2xOEwuu3r7CIuKQbYzeNf/c1T/qETFWA1WjyLlENLwHPGv/Edu1023+Vko04c3FlRGlVUPFbLgO64sYBKk+0VtlvStauP3HnM+39ueWFdvOnPlwQWCejtWuo4TwlaogIEHSfYwQHZlb4+ABb7VnUxhRi5MK/LiX2JCVu/3QVtV4HT1th7J2m+iCliiDcVyl2aBT1kMRM71PmeqgJaaltWTcyJUUyYPoxNwxV1h06AbozeYwK8LvlYNTcny2lV/aIR0zPiDp3FM0W7h/TDSCVkhj1zd/4BOy1U7L5q7fqBzdOxvcLdZzBF1awDeRHTysKlIvaKBJzbid7NKZ4o0R6iAD2qt1u27A6g5GzHQukFzrbYbRL0OvdkOe2C9soRU8DPXP/2NDkSsa5E6akAIUcjEWSmUdJOnji2zgRvmbumgF24jBSxdWJo66INTE0la+Br02DzPsh6h0QZtYJZ9N6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4734.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(8676002)(66556008)(66476007)(26005)(66946007)(36756003)(186003)(8936002)(478600001)(6666004)(16526019)(450100002)(86362001)(2616005)(5660300002)(956004)(52116002)(7696005)(316002)(2906002)(6636002)(6486002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?m/em8CNRWZRtjX59XDsNocS2ipNhu0UgqiSDkgC54DAzuiwUL3ePc7AP5bNi?=
 =?us-ascii?Q?fikihq7r423cojKJ94MFN1V7eSzFHfViUHxB/DIYaZQxnY0mme7c4xK/UVMo?=
 =?us-ascii?Q?Kf2VL22okGCOA/xZ0kq9C0Ts1S2WvpaJhRHw5XsjdL+iNftj66ewsIHasvxD?=
 =?us-ascii?Q?EDw78KxEpMIpVwX80130nNAXGyqPRlEZVCd13lNl9GUUI5a+V7g0w61Yw45A?=
 =?us-ascii?Q?9kPFYcUuQ+2MNWOY1iiUgCspOjJlQDJpLFINDBdHuKuuncn6bmcqMezjSmuK?=
 =?us-ascii?Q?ZO5HpLhFZVYX/f6eilON6Aox13dWyVyaDFzhXC+9QGzhuOT2rFkViC1rxuJb?=
 =?us-ascii?Q?048ZEhTrTJ5ZofDgOm7eoH/DNwBwaqOWrkCGbDGf7shXKqkNoGOtRK7mfbZT?=
 =?us-ascii?Q?GvIymmPbzuoLzrP6nq+4B/dMb5T6IPgheApnqXPhBkNGn3vcpcbxkbXu/wkv?=
 =?us-ascii?Q?U5m6pJ21xfKSzJOPt6HpKPBv1gpGOmF6gjWc293TorTq2T5XfXfRXMDHOXGl?=
 =?us-ascii?Q?zfYVxdQb1ufqzoyHMrTjj7YqfiBFAoQ1eJEFe9b2Qn9GGZk/bDFhD4VE7s0H?=
 =?us-ascii?Q?CDyp66xn1okRwg4zYXKQpi2PiDFwJdYlBREMNLcBxwHEABnE1DdpYhGN59O4?=
 =?us-ascii?Q?s5ZZd/9jtbce4rZOB0R/hXqpa/YEhLxPQC/ZFQUSkNb4jNSGp6QfJA5P9f5z?=
 =?us-ascii?Q?ecRqdn/1EZuB2J0EKvq9yYu8Bvi5Rmff6ybJrxNkWFpragVE509KsVIo8Inz?=
 =?us-ascii?Q?VJt6yO1mw0n1/HHYGJL2pyLTMoaWfhptUyJzYmuqOup4YaRHOmE8Yqmzo8eR?=
 =?us-ascii?Q?vTxzBtU6tegv3tauh0lsXEa8382+m/7vQnerkoQWI/+rdmgqW4B3SP5Qe4LY?=
 =?us-ascii?Q?FaNrFqjeRF5FEbWpCDKLFdiQndOPkVsn/JyS/+yi7HlrGaFTKR+p7P803nrc?=
 =?us-ascii?Q?kow6lYE6rk5YEB8hg607lzwE3BGOzFJ/WEwwseqSVVZeY3nRpb6TC7muYOKl?=
 =?us-ascii?Q?yvgy4QgNXyoVnazVZndYGfDVSjoJGZhakphV4to21bjOjqRSkCgvh1/01JX/?=
 =?us-ascii?Q?9BUvy17v/zAi7wKOINGWVGtnPRYCfLVrn/aZFD7/HHOB0msIVVFziw6g3esq?=
 =?us-ascii?Q?hLK+Kg3736Gsy3HBwjjJyCQM1rkFjTBmDq4iXO4CvcTmrP30Ts+wHl0WVpwW?=
 =?us-ascii?Q?UUuN9a3tXEEbvsnXd3zqHoTlRTDjY/z0Hu4dxuMuJy4jZBZ4B3lPx4tqHpdc?=
 =?us-ascii?Q?AHUqxEeKo4qR8CVmN0D0CA4OBZbvkdWGap3lH4f2D6DP2Yts8MKNoS19JARV?=
 =?us-ascii?Q?4KSjL7ozDaJ4Lgfe5e1t6TQf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c275cafc-948f-4851-bc54-08d8df274626
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4734.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 16:05:04.8876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOG83LdKH1yZIh1Qcd0uDWSLT5224LTXBsRUqPPRSBKla8ZKvAf2WybPgdsW50k2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4736
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
Cc: Felix.Kuehling@amd.com, harish.kasiviswanathan@amd.com,
 christian.koenig@amd.com, jinhuieric.huang@amd.com, Alexander.Deucher@amd.com,
 Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If tbo.mem.bus.caching is cached, buffer is intended to be mapped
as cached from CPU. Map it with ioremap_cache.

This wasn't necessary before as device memory was never mapped
as cached from CPU side. It becomes necessary for aldebaran as
device memory is mapped cached from CPU.

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reviewed-by: Christian Konig <Christian.Koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 031e581..7429464 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -91,6 +91,10 @@ static int ttm_resource_ioremap(struct ttm_device *bdev,
 
 		if (mem->bus.caching == ttm_write_combined)
 			addr = ioremap_wc(mem->bus.offset, bus_size);
+#ifdef CONFIG_X86
+		else if (mem->bus.caching == ttm_cached)
+			addr = ioremap_cache(mem->bus.offset, bus_size);
+#endif
 		else
 			addr = ioremap(mem->bus.offset, bus_size);
 		if (!addr) {
@@ -372,6 +376,11 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
 		if (mem->bus.caching == ttm_write_combined)
 			map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
 						  size);
+#ifdef CONFIG_X86
+		else if (mem->bus.caching == ttm_cached)
+			map->virtual = ioremap_cache(bo->mem.bus.offset + offset,
+						  size);
+#endif
 		else
 			map->virtual = ioremap(bo->mem.bus.offset + offset,
 					       size);
@@ -490,6 +499,11 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
 		else if (mem->bus.caching == ttm_write_combined)
 			vaddr_iomem = ioremap_wc(mem->bus.offset,
 						 bo->base.size);
+		else if (mem->bus.caching == ttm_cached)
+#ifdef CONFIG_X86
+			vaddr_iomem = ioremap_cache(mem->bus.offset,
+						  bo->base.size);
+#endif
 		else
 			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
