Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8436604A3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 17:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAE510E88A;
	Fri,  6 Jan 2023 16:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5060110E896;
 Fri,  6 Jan 2023 16:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6QWb64c0zZmxfNgnj+wLGFiu1MDyli5rIKAFVZq7soXdIyTHfXesxdKlRL/pF0vFxLUDga7sEQfzdNIKNZwyuSrycd/sqtAqn+rCAVRGUYmR4Wt5djQW7+7+Q07Tiw8BVGZtHVebMA0kDAz2aNc/HKUox4+VcgRalCiTIBWOJQ6/tJnTDD5FqTPy6KYVsRyRW0/vyHw+2kzlYw5450f+TyzKTjZ7OxbA8dIDq8toKa45h7pKXpHHDkZomcFwTmXHhwPJ2FQrGRH2aTR4xsJm2qEa+l1D+6PiKDzvuvjn8EUiIs9qGxYadeyq13WgfimmQpFlrYwX9CH1V0UDY/YHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i28832YwpvUJbHlTSOfIPaYAPWwxtMVLBQ1NJ2uFvIs=;
 b=NI02jSdhxwcM5zNn988uE+VJC4DTnc8dyJQQtDUT8HSu+EVHiXQ3NppiRqV3nih318JE8nxqN6Rz5ukIfVwUZjqu7sDZpwf8Uft6wapXLzk01FaNZ5KRZ+sBbSLLuAsk0xwEPSq22AI2fj0f1RIlSaRk5tnLlJzSLliT8S5wozU40i5Y46J8aH8fu6XBs5LaQHngUmYwwpz6yy+wR1n348rr35YXq6PytFmdLc7KWwDZMmiZin/FNbUih9GPKHRV/LEa5QwMdd5jXwWCthhvvPT+TXm9Bka1a+WNjRyjQ3suEF28G+x+by+tbis4+DiokmKVMd0ZZFDdzm0JSAVH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i28832YwpvUJbHlTSOfIPaYAPWwxtMVLBQ1NJ2uFvIs=;
 b=tsaPCw1N72JRtdxnD7sKt0fRT8boUbUEPlJnCdW1D4HHble403Na2nM+uk4spNIJ4DG5RiweUv0VTmLkAK3JVv1PwP3sEQwHv7B1LkImZgYtn6RFH/tIVCvDwFUCSEUEXRjm9sHAW5GTZemXZO1gTVYyGX1ZOlcmtxDzZgbQyOgCWvmEltvpGdS70rBcQ3pcMFAcO0B/MyPnqCciQt5OvpsUYHeoPkaXhtXEOy7Gk1ErYYOm2nLo1jKPBGLgsNYgL6e5yk0SFaJnbCpdNibt5lrZgAlxR3Rq+30mpCzublzU7c/u2TSpy5ptVw7KlOuO51/eXfwf9UrY1eMYMdwZRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB6437.namprd12.prod.outlook.com (2603:10b6:8:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 16:42:50 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%9]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 16:42:50 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 4/8] iommu/dma: Use the gfp parameter in
 __iommu_dma_alloc_noncontiguous()
Date: Fri,  6 Jan 2023 12:42:44 -0400
Message-Id: <4-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
In-Reply-To: <0-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:208:fc::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 948d41df-dd87-48b7-b918-08daf0050c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcoBH1cHeDRzV0pqDL9xjawTEIufoTJsYghueqDZjMIInkM98Zkub2FOMmjBTX8jbpaiuWh0a3ekNRSXBVYRdIi3XRaN+kguUBLdi+NEbmXa/wFYhuR6rSqgi6p6iC0aFAyNULI94UU7YMS6LmtP9pHbGJlyURpwmkMqFRPGk+FYduCXuJFTIgHE1PzYRDmNwS7wsy3jz6BtGzR96dhprGX/1oQuoTz4GI2mNC8o4nKu1fKTqKJUhoKiqqWR1DXKWTTQFuCa9bbdyb6kJ93bFd/7EMGYEOH3YC7Ok3LoWvb4+xYuQLehZEnqWxvjnr/ZuL1k/5Wea1ELx7G7g0/R+o5nAdeLO1vw/+tliyklyR5FB75n71M8gzsJ9lpYxxcVfo26GOUC24wbH98T7MpsDskqA8JTaCVgUGn428QWSPp21JC57dd5HjA+MAUrEjN0f5KGihmtKGSOvCkERXcI4ZYT8oVdUJoyLhmb6nBhU1JD3V3cqwXtH3sXduNZA/F+8XNM2zeAZCllB0KhGDx9mGTIwIGAk8Q+oJ3AfZk1tKJWOmQtaNYXsytF4g5xiPqRQZeydS6c5dFH0EB76bpS8sJXIAw7ENEHsTCgFTIACpD9ppmtHhktVP8s3/dyYIK+wBROrEL8gPZKMroveU9aaGdoqAG7mzkXIr3D7m5nY/8NEacdCVjYZweocNl5Qrx6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199015)(7416002)(4744005)(5660300002)(54906003)(2906002)(41300700001)(8676002)(66946007)(8936002)(66476007)(316002)(4326008)(66556008)(83380400001)(6666004)(478600001)(110136005)(6506007)(36756003)(186003)(2616005)(26005)(6512007)(6486002)(86362001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nt6ne+fFDPHGhrmGfGAhZulvthyPoqU5JoLp4Fc5TPx30II9W76q3TwlWP8h?=
 =?us-ascii?Q?VQRjfyZ5Sid62D7Sx7RhCNDXp72oSekeAHyznFxGVBf0kdzXTzjbayPVC7bi?=
 =?us-ascii?Q?cBtCYfL/2Cl4joJV+v6ySQByHjPPsepM1jdotbjM0apbne1s0NtJwTFGbI70?=
 =?us-ascii?Q?BamZ3Pud5hwBdUXDXnxhEk+b4bZXggqV/WnkdkgB/ntF+oaRCyjCbfXx/2lm?=
 =?us-ascii?Q?584TuVN6MiCUkUeOWnHEXOZnaFnBVNDM9vM46v5zgvAMD6R7T2nV3u6XDRmT?=
 =?us-ascii?Q?kwB5/HIcV68IrNx3bJ/UknWdtxbxaL8YpL7FZ6uZOif9VFavxgMbbxXBStJQ?=
 =?us-ascii?Q?D9Wpmr+IcINHup8q3HChbJYaxUCsmiSFYbqiM2atcB0Pb2t6jLF3UDbRTucK?=
 =?us-ascii?Q?lbFJTrZHPyVBtS9FOMCo9mHlCksIprEug1D3Q1wWFEEeUwgtzoXuZ7MSAD9r?=
 =?us-ascii?Q?R0piYZyD+v55oq1h6XT9UC0EedUBtAuox5WlhMB7fw26K4JSo2b4CY70Gf6R?=
 =?us-ascii?Q?b5n3DTuIFt3nBXT/cmVYlmcLQme3pJY05W4ihyaeljLKcM41S4/aq+Q7oLZK?=
 =?us-ascii?Q?HDuB3WKv3ayxK2jWeK7lpfCLk6QorVGYuq7O54P99feZK+Tv0SY1QrMbyCui?=
 =?us-ascii?Q?EJNQtqQmHLsyt/uwTWntoiOUeiYJQfdPdAOANodW47LgpVeLhjQ5eKwogQld?=
 =?us-ascii?Q?1XLTXbIBK0JtbRx1swEm2m/c1qylNI9cQvy+Sem5/RL3oU7NZ90DCx+3V2MZ?=
 =?us-ascii?Q?O5cNPPpnhJci8OAbh5yZQ/Do805MQhX43qhXf8m3yt9OOe6v0PuZi7S5zhBw?=
 =?us-ascii?Q?pqx1r4OPNdvaUReTBLAztuzPXKocSLEEjCdnhH9Ke+xtzGARwW1ldjQbyEAb?=
 =?us-ascii?Q?4zLZ3iXXJoM/8j2SMkSjKaPb0NglfST/ZBhIPz7f1oX32Srb++BfgQDydgVN?=
 =?us-ascii?Q?lzkZT2JBuE6oaWcIUiSOnoxAepA7aie6DYBEFfc8Hl9LATljiGy7UTjw7jhQ?=
 =?us-ascii?Q?pw8trWNh7ecZsObycW9u9QwsNK/FmsW6O5u02CztP/Oci/pdpiEPiXIF+Ium?=
 =?us-ascii?Q?ddNfus6Mil4uMe5tDsZxLVH03rgNtrFIomqB+wSC7gXdpV1etYDFF0TwwCzW?=
 =?us-ascii?Q?Z30JGsuyTRhOQMa9eBf5kXzEEgqHPMYQJt8HxDhhM4sm3gKhuIi2CJxqyQT+?=
 =?us-ascii?Q?e8PYsp3C59p34hg6AM34WbszrtqkHfFH0b1SS3o4e8Vd4k8bYdDKuqdYMCzs?=
 =?us-ascii?Q?9Vg1Vw4JMZCP4PI+nxbcCYZ3nKHri+LGAtfqV75gheefVuUmmNyVZpmOMD+L?=
 =?us-ascii?Q?gre/sVvl0O1INEyvGucZdCMushvehnfznaY19nRRKExUj31WGnyGyefvunxB?=
 =?us-ascii?Q?Y0WucJ5sMgaqingVyorBk3Oq7Fz6cdU19rSkDTfGoJOoLxV7MFl3PpkDXKbU?=
 =?us-ascii?Q?Kzlp4XPjmYiQW951bGg68H6IHVUgPtzyT2Qiu8gn/jktkAwbJgznghoNzBP1?=
 =?us-ascii?Q?4WRXi+ssa0mYcsDh473yxk0MhHj/8NVoO8khnQdJET4zOOzntzZmB7Hgfyaz?=
 =?us-ascii?Q?bWVjTQ+oGQKMmjGbh5/+bIFQ26m5q1M/S/+JiBWp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948d41df-dd87-48b7-b918-08daf0050c52
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 16:42:50.0315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /D60ZqaifkkKSCcn36hiBozlR7v/UtRcDdOJv0+yGkWdXfblQ6DTipFSgN0Aaahw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6437
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-remoteproc@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Alex Williamson <alex.williamson@redhat.com>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-tegra@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, ath11k@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the sg_alloc_table_from_pages() allocation that was hardwired to
GFP_KERNEL to use the gfp parameter like the other allocations in this
function.

Auditing says this is never called from an atomic context, so it is safe
as is, but reads wrong.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 8c2788633c1766..e4bf1bb159f7c7 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -822,7 +822,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
 	if (!iova)
 		goto out_free_pages;
 
-	if (sg_alloc_table_from_pages(sgt, pages, count, 0, size, GFP_KERNEL))
+	if (sg_alloc_table_from_pages(sgt, pages, count, 0, size, gfp))
 		goto out_free_iova;
 
 	if (!(ioprot & IOMMU_CACHE)) {
-- 
2.39.0

