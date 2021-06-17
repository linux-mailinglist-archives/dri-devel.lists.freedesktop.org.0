Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48BB3AB72D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7CB6E916;
	Thu, 17 Jun 2021 15:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406D16E914;
 Thu, 17 Jun 2021 15:18:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7nre5yNlIl5sQnoujTPlLXw41IVnf2AwaKpfy7oYGMrTaFL9uXhcoJajAzsQuOmgRC92oEkSaEqnCl6uUf2gfmCjhK/4e33gKOpjRt7VfQNOHeOww+Fl/crxQRDvdFCjhBNdqQmFoJVbXJci5Fi63VJfs0FfeD6IO44VgPhZhNkJZXMTMTulkdmABuCA6qKoZzDgV4RnpsOvQxnEGFZHvZ4GYGF7ewl0XL6p++NPMjIodoC9bbpEzwAx36twzhBTHOZAQ3jHgM6ro8TMBVEkeF32bACcLw+pH2jojxrVZerDEX12mELAz8LRJVUwsx2iTf4MGT2MozpK6aLdAUTKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcNNmSNZt2b8SXEAB5nQGZIgnY0pi/9xR5K7kdrUWjc=;
 b=nw+cgrijAEoTJZ2dtSSrtJMqDcix07NKsDnGqTDC9vvkit+ZcxMLCS46OYEKVnfuwdjwUn/5FqyfYUHSQwjsgaP6Q7zqW2U7aGKYDjTdRTjwl0W8OQvdMYo8+yndCLL/VTpjD77VU1mqmIZz72Hx1F4yryYzZQgFZD0IiKQ6/Kug4wzYB71AG4h0DJ5OiMQmgluYukLXlaGDSKtiRNlDj9GRNfTGvwyeTk0FWIBA3iaIGbGCXJN909xLrhula33EQrZ4TsglKlUozHDU6Ojkiz9OsiWOns3puuNj7fmgIutpsKUk5fxGcp1WtMUJ+7hgZxjCHzFlZrJTVuu7LQoijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcNNmSNZt2b8SXEAB5nQGZIgnY0pi/9xR5K7kdrUWjc=;
 b=i9RIR9/cESLE7syUb4QVJFJV55NzeqyL3OqJWVpjEFtJ0b6uouMBezxBqrsxUlqCl2IJcLIUNgRO/jsknRjH5wE+7Wf9S1ltnQo0dXXK7t1rcOai2aIVqIEL2Tjtxi+J/N5WgFhzWwk1Bf750h/NIY2SFskE/jUSY3nkL+Q94f0=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 15:18:06 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:18:06 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 1/8] ext4/xfs: add page refcount helper
Date: Thu, 17 Jun 2021 10:16:58 -0500
Message-Id: <20210617151705.15367-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617151705.15367-1-alex.sierra@amd.com>
References: <20210617151705.15367-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0501CA0088.namprd05.prod.outlook.com
 (2603:10b6:803:22::26) To DM6PR12MB4419.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0501CA0088.namprd05.prod.outlook.com (2603:10b6:803:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend
 Transport; Thu, 17 Jun 2021 15:18:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65d9aeef-d0cc-4a37-e2f7-08d931a31ba5
X-MS-TrafficTypeDiagnostic: DM6PR12MB4419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB441986B65D66C6DF7164DDD0FD0E9@DM6PR12MB4419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GL4LsBA7EUAXwyeBCfBPoNDYN3dNsbzAkqjtwD+IGGG+juTMX27OxrceP8Cq6IfRcgfeh2eTVuJGmOVjHSAc0L9NnitSnTU2cqKL5l5EzYr6xL5DkewzrXSvdpu1J1J6QJgNnaahYOc1zAojEbmfGoNd4Yoe7WAUyhjWvEmvN2v2MdOBJAf5+46/VvuxRrtUzNCVyCzw8x/xgt8yvrwDMZbVyb7f8owm6HfvYmU5zF2hoaoMnNPw5Jjf6UMYIiIbJ8TifsUMS08JBTG9i+u4GdnlfwuDeHNkrbl7P3K7fgCnfZEzv/h2H2O5nQVJooxDd/6DgtNCBNxVQ1xsz2mnX2OMZBoMl7lzY8KUlkGSxJLTirl+mHUYNdiAU10idV3TT/wjZ84idTbPamU3jWwQ40AMb1C9oNpC/PPOCS7gPp2DJaQ2imCO9niOc5Jd+en6HMefXUOH9LaimlUSA0k4GJ7cRwHTb2GjFp09xZ4VVoi5Ujr4DEEkLyIKS0pVW+qpwABngwdnR3SmbJAzh1Qwai4+6GqwcOAIssCshnVwaLVIfnlbkYi9smmvi5P5v3PVb++uzN+Y9g1/5f0m8MIEc6SD0P2V302hIJwm28pSN3/QSm903Vo4C3Hr4I+XndeNwjlfuuYHhbwe5Cazflmp1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(8936002)(6486002)(36756003)(478600001)(66476007)(1076003)(7416002)(4326008)(2616005)(956004)(2906002)(6666004)(44832011)(38350700002)(83380400001)(316002)(38100700002)(26005)(8676002)(5660300002)(16526019)(186003)(86362001)(66946007)(66556008)(52116002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sh9tu2tO7f1wQ1GV3W+2c68TCRxspxnsvjn2MxshilugZ/XFv5aOI8dLsIjL?=
 =?us-ascii?Q?jbEAddRge0VQHV6eU1dHqzjAK8UwFGR9HKr1hhu80bq83UPmSIQDpL9p8I0p?=
 =?us-ascii?Q?1fi/RwMmMVSl+CTR+vYeSLhSr7mRhltFgaypR1r6m4E8IacUPVjKqD9Mo1wV?=
 =?us-ascii?Q?dtSWwNSS8+v/RIL+0gHOqiHAU32TLJ+MMIm4qVodvtDBQF+hqgNRTWYUOlce?=
 =?us-ascii?Q?dBtzA7IeqcNmlIbxiWsBJYjJDTckwholl4dlSg1ryt4OFPG6soBNLZlj7/Jt?=
 =?us-ascii?Q?Pl2/ldcCVFL9zS7/OQ2ZG1WrFofpWL+azedzrJkpBkh1qgYOOsiOlxHjV1p8?=
 =?us-ascii?Q?RHC0Oq3bUqFpx+HEejdemPYmwVEwrP4v7n5AXZ0eU9RNf1zFuutuWG8cOiU0?=
 =?us-ascii?Q?zK8thxzlpJ+Hfgph9XKsglTK0BfNVwN0/64+xJnyZBE0L8S7epaGxeFCpkU1?=
 =?us-ascii?Q?UdI5rCpfB49xDIqIrDs74l8SzZGFxDOMZFD77uZ/Ot+OKXXFeHo/SN/RcdDL?=
 =?us-ascii?Q?X0VckHaMOJomB00SkHw7qTcSF67n6iF/xPTD9ZGmKDRvTcCPZSYluMAEex6S?=
 =?us-ascii?Q?rojB2jpqHFU5aewFe0cxsBiHFoUyPxGUELan2nXWQqUIKfUb+z6WYVC+oc1V?=
 =?us-ascii?Q?am/opZNagXdi6lXtMjuG+r9EJgevAWxg/FN/d67XtYkmWOnR6+mfXedYOzqc?=
 =?us-ascii?Q?4WfQv9t3YrMQD+xcLS8uvqfVY95/kY0f21k154pN20+8T9tBEoaMNLq552wD?=
 =?us-ascii?Q?K7C2BMpuxyLVRrgJree0b9KKAJGQLZ3pozjfX7g12S/gdY5M1P6VEFL3eEn6?=
 =?us-ascii?Q?zT2xGt089DRWRvuPjciymeBJoGsqY4YUUgUyC7Epise2/NWWraCN41XK4N7v?=
 =?us-ascii?Q?iyD8itRmjrRrcH896lIZlaQ55LIByGetUaUY6CCVvGei4kLkSe4DgqYZP6n0?=
 =?us-ascii?Q?AkFTQVRq/484wopN3YDiOLWXI/L+5OXCFBI1tmLafjrONo3xKbde7asEdpcy?=
 =?us-ascii?Q?nSyBi22KEMFwRWxKpfaglJYTtwsvZcrvRHHPbp2k3gyAw50zEbuuKVNXJfu2?=
 =?us-ascii?Q?e2iWBDwYhwuPc1NusckA+/fdr2dXurtqObNyZxgNndFwZoAh27KcSkjJ9st/?=
 =?us-ascii?Q?KeYK0YRnlZSBNLLPH5AqJbHyIT9yXl/hcMHxYKKxN9eMeLnlSNXxz+GIaILE?=
 =?us-ascii?Q?3RaKuaUYMsLdP9g8XV7GYB2Jp1HmhI5fhR7CIi0rNlqSq0KYgL72BKYcBSw+?=
 =?us-ascii?Q?ufNZfsmJMR0aYPFqvCLbnow3ToZTUxQ5yEieGXsnKnsRkM3SZy8G0JTs1v4x?=
 =?us-ascii?Q?0wi33GRD3tke+XgXwl1os4y+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d9aeef-d0cc-4a37-e2f7-08d931a31ba5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:18:06.4386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wFF5XxHEu4TLM4XCXMCipS5ZHZRAom+6uLbmA1hAnqEXq2iyM7XlsyIWKLKHNc91Jqvpp2HAxCGKIoGbUK2Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4419
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ralph Campbell <rcampbell@nvidia.com>

There are several places where ZONE_DEVICE struct pages assume a reference
count == 1 means the page is idle and free. Instead of open coding this,
add a helper function to hide this detail.

v2:
[AS]: rename dax_layout_is_idle_page func to dax_page_unused

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 fs/dax.c            |  4 ++--
 fs/ext4/inode.c     |  5 +----
 fs/xfs/xfs_file.c   |  4 +---
 include/linux/dax.h | 10 ++++++++++
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 26d5dcd2d69e..321f4ddc6643 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
+		WARN_ON_ONCE(trunc && !dax_layout_is_idle_page(page));
 		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
 		page->mapping = NULL;
 		page->index = 0;
@@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (page_ref_count(page) > 1)
+		if (!dax_layout_is_idle_page(page))
 			return page;
 	}
 	return NULL;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index c173c8405856..9ee00186412f 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3972,10 +3972,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(ei));
+		error = dax_wait_page(ei, page, ext4_wait_dax_page);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 5b0f93f73837..39565fe5f817 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -782,9 +782,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page(inode, page, xfs_wait_dax_page);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index b52f084aa643..8b5da1d60dbc 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *mapping)
 	return mapping->host && IS_DAX(mapping->host);
 }
 
+static inline bool dax_page_unused(struct page *page)
+{
+	return page_ref_count(page) == 1;
+}
+
+#define dax_wait_page(_inode, _page, _wait_cb)				\
+	___wait_var_event(&(_page)->_refcount,				\
+		dax_page_unused(_page),				\
+		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode))
+
 #ifdef CONFIG_DEV_DAX_HMEM_DEVICES
 void hmem_register_device(int target_nid, struct resource *r);
 #else
-- 
2.17.1

