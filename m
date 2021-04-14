Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D518A35ED80
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8917D6E8CC;
	Wed, 14 Apr 2021 06:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22726E8C8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZwvw9Wm1VdvGs1y2IAvH9qMzCs2VzFzeheHpdfaULjQ0obMLvFRahiLwOcuyf077EskmH5yesHblONpNRy1odRlWxPaI6S1qev0qAqn8C1NExw0AEP1kj4zNLyF2hE5DEGvxezJORtwY6WlsYM719J0qGu+gGWw1HGiW66PMeDD9lXcL27UGIvvzz9wMkLqKAR7EaUZM9sHO27ylBvWsamCgbm95Ffq6maWZIYsOlyLzbQwC3g57TKgKrGi7EhhCZi/ZIXjjjdNe6q2YOiBPtnI2Rm1OZreHQNRXcqFi2yHoxfjIq7eN1dS9jNS5PslHPzARF7IRN+GPR5sMz4W8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6cYmo3dLmpw5Ddu0zE/rP1cYO7LSD0YBQ2wvpnQCJg=;
 b=iIYfWwrXl7vPtoh8Lfuog7F1jqvLmz/6RYrqr9MX5gUM6SpBvxSSYEV2xeo8sh8A6X5odqA9CtlwAjrPl7ePLzG/KgfPJ+DB532X4UxdtTOZTAp4CQWCdZrzqCv7qVm3o68tNwUkauaninkb3e3ebKlTeQ4J73mr6p0Q3JUQmc2l0YCtvqSAq3Ls3ss8odAdMPG7pTW4B5WxxJiYHPyxIqGelhaVvi5ECqGnmGNm9j3gYWlJOz9NOv8JDa9gnxwR7vgXzfUNQubDtji3gA+hM6kiHcmT10sgjqlI4d+OiM1NubTVPyAHAQbvvujiGQRHCkG4BbAGr5CXkP5eGh9U0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6cYmo3dLmpw5Ddu0zE/rP1cYO7LSD0YBQ2wvpnQCJg=;
 b=l/pRtc5OTXKLB4+9voBZCa4IJ0yNRpMGyrRc2g9naBxN9ngl3x/AHQAhTtPRhnnHDHw23qc1ZsLrfGidhZxwvI3NBDCi0E6cmj1Vi2KY0Qgl4l84U5CvPhzIl1rZ0mx5Dwu//g+7eW9eioUOFs63EQ3AWw+OEjRAEchKMnJK7KE=
Authentication-Results: lists-freedesktop.org; dkim=none (message not signed)
 header.d=none; lists-freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4689.namprd12.prod.outlook.com (2603:10b6:208:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 06:46:54 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:46:53 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/amdgpu: Lock the attached dmabuf in unpopulate
Date: Wed, 14 Apr 2021 02:46:21 -0400
Message-Id: <20210414064621.29273-10-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064621.29273-1-Felix.Kuehling@amd.com>
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 06:46:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b79af60-56e6-4ec3-a3ad-08d8ff11160a
X-MS-TrafficTypeDiagnostic: BL0PR12MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4689E9566D147EA04845AB74924E9@BL0PR12MB4689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sASXfb9ZNWGJy3vGPx/+eZg9T9zzwpIgG1aJBaABEx8ZPz+QkfFmw2oI5Hq5pTDfaDlve9CUDrFs319xuHj+V7T1ivB146fRCJAoUKK9s3y3TkgrVWjKAY2uw9CeGmC53F+H/wv3vi/oPlWCScr+zy74YcWdvp5Tk48yt9S+zDks/L/YnDfTS0RD2/bnAdRclbL0Ay1qGYws/EFMOwUlCPH/79/NCO9ES3w3fqSNGEOEphz3cbk8Ce6Ha/5y/rGl4529udFz99D7oC51XW/OjmKHraouKG8mwFYb6c8lBnX+SeEPavfvzB4rQ9DkYpR3Cn/pRTo0/1nvLiKViI15jCv6LiD9/y6WLH9yJWwtXzMcq4vXDoauEaWmKrQkUgITkjyocaGqPZZP9uWE9pByFvoh5XxenqP9v3OhhXQIzo3wrid7SxFHm/Fg1v81OJFh5m6MB63h+XmIJr512AYFPJVNMRaHCNpWeSYvEAdk9aCi5LxHsyUl7no1BNIjoB6O26r62c+OBm1ws8Nj/VESlcHidLVMx+49T9RYX/AZs7TxoKfwoaWA3ZFoG+at090hpdPg4S+TMktIPZkW1ZIWMp9EF0pf0COyjjjFSA3bGz9x6lfK8cM8GmtmkXheXZrkSHzSnwcx3JWtOTIctzrJmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(6486002)(86362001)(2906002)(2616005)(38100700002)(83380400001)(5660300002)(478600001)(7696005)(1076003)(956004)(316002)(26005)(52116002)(66556008)(6666004)(16526019)(8936002)(66476007)(186003)(66946007)(38350700002)(8676002)(4326008)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EFKoOSDMpozgUjRYBfACVn6jPtZKYlkYNeSnqfa/Q5XrmcfBQRZWBZsRrOKQ?=
 =?us-ascii?Q?Z4kEl0MISJwUKac2iefUbrFVTzAQrA9YhkU6PLMAY3krn4hUd0LXj4X7T4P8?=
 =?us-ascii?Q?mBD+xbwXtly0U+4JgaFr1xFpqx2bUvgeWLCrT2AUz7/U6nmqSqdHZee/F8B2?=
 =?us-ascii?Q?qV6R3VBvsax7oUgH54pzeLh7WK5X8TGDYrkFKhSl9LBpvDMi43PMleaJmwWG?=
 =?us-ascii?Q?mQyA0uf8BwLIM/gMfPBe0QJLfz1HPezkBXqkxrfn9GLfv1ZiCwPyMEspReWt?=
 =?us-ascii?Q?J9cA5APnucgntD+I6eHmo/sLarKixwQu38lWTFQqNd6U68jbiBNNRL47ExQV?=
 =?us-ascii?Q?2ctt8pnEu74ZPJUeSWgBAp1p2wuahBWgqH2un0u96vY9m5I3IgJpNvsJtVeR?=
 =?us-ascii?Q?jisSLA4ReTOY+4DSCmsalV34aOoJnBOGUnfIPwkTOeZxUMNU+Dlp9EcTEPRB?=
 =?us-ascii?Q?ay6HOHVBAC/TDyl5enV2/zAZmxvZX1ppvT0PaDSqG0S2X1NiiIfO8iTknJkM?=
 =?us-ascii?Q?J5i86jtLXFrV6r+zI4zL9f7cACGhHx6BFntEx5AbjiBnCe3fdxRF3ippYeki?=
 =?us-ascii?Q?wDd4XRU42oNr2O35MZV7ZKE+qRl9fYecPAcMLfaxvfYL0gzK2rvczgFJKnx/?=
 =?us-ascii?Q?Xc6SGsA6kEv/ZD9Te5kFKBk0jCl5j/W5KArCtcGuZ8xw/NI7YdulzYc6qppM?=
 =?us-ascii?Q?SzJJFV3QThkWI/T2q5o+dgJ0rPqrA/Rd7Up6IxZQKH2ve+prdiZ3/x12C6c/?=
 =?us-ascii?Q?NY5ykOpYcHvGBFdd8EJsxJ66KPikpXAqRHcTdNYCPToMZ+0HWrn5R+LYHDj+?=
 =?us-ascii?Q?3+kghgh5EezM7CGIxVA9aSueNnuMCJjbUklPVzvJWeSfI7vuCGq+MTOBN9PH?=
 =?us-ascii?Q?n4B+zFg6qdGYxb4NvVQH1aQdg4B5dgSvREM1jCcnCwMFH1oEL2YUpe3ueFfM?=
 =?us-ascii?Q?QYo2AOb/ubDPmwd7epNUvc8PcKWuWlsVhpJfXtlzxR7bZUIlCDQWaoA1UJ6r?=
 =?us-ascii?Q?PC5UNDLB7YF9nRyRQ5RIps4ACv4s0I7um6b8lcKu7OcL7YqQnczjgQyFNbRK?=
 =?us-ascii?Q?+wRJcdR+ILWlVW9E6dpJ3JM0HmVGtVYa8SdTYMBRpRw0DGCRUW0CBpMK/jCq?=
 =?us-ascii?Q?ctXE/ar3vzdV2eT9JpQBPuYpqUHYV+pJsztEysuK6xoIBPNHdKEqC3oa7hyR?=
 =?us-ascii?Q?nIu52rr1e2sAzJnKydHWQQqETNcjzMLT7So0rxAG5ac20dtEBf7rwv0vGFtq?=
 =?us-ascii?Q?SFJD2n5S3Qh3PM8r6oG50Bon9q9jFvOcaVwvapkwv+EhKOEnvUkRp6J84v2b?=
 =?us-ascii?Q?q6hvt00NtR8XOvpfQCDQdNNi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b79af60-56e6-4ec3-a3ad-08d8ff11160a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:52.3651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79uiDwUwOxuyXU4YSPoTo1l1oSgBYWJWtIqMuBRq5TYcsTx3JM/E/QSq61qTJs3vcFfLuvyFGLLRrR7xrqGThQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4689
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_ttm_tt_unpopulate can be called during bo_destroy. The dmabuf->resv
must not be held by the caller or dma_buf_detach will deadlock. This is
probably not the right fix. I get a recursive lock warning with the
reservation held in ttm_bo_release. Should unmap_attachment move to
backend_unbind instead?

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 936b3cfdde55..257750921eed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1216,9 +1216,22 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 
 	if (ttm->sg && gtt->gobj->import_attach) {
 		struct dma_buf_attachment *attach;
+		bool locked;
 
 		attach = gtt->gobj->import_attach;
+		/* FIXME: unpopulate can be called during bo_destroy.
+		 * The dmabuf->resv must not be held by the caller or
+		 * dma_buf_detach will deadlock. This is probably not
+		 * the right fix. I get a recursive lock warning with the
+		 * reservation held in ttm_bo_releas.. Should
+		 * unmap_attachment move to backend_unbind instead?
+		 */
+		locked = dma_resv_is_locked(attach->dmabuf->resv);
+		if (!locked)
+			dma_resv_lock(attach->dmabuf->resv, NULL);
 		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
+		if (!locked)
+			dma_resv_unlock(attach->dmabuf->resv);
 		ttm->sg = NULL;
 		return;
 	}
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
