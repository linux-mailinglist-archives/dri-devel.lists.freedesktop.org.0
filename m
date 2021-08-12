Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0623E9E7E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3976E1FB;
	Thu, 12 Aug 2021 06:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA2F6E288;
 Thu, 12 Aug 2021 06:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZNud3JgavIQie9uTmLPhg4Ha5793TU1VkIJ+UZFOJcaW9dTnrPs9jQNlGOy/8DSiZyL3ZnXiyqt8fAK5A6b8YnHP2pNbt4kGgV4vOZZyw0IYWxBf6JwkPs2HKhJv7rpcKCVUpTaSo/IisXlLzbzRlSdckhVNsPO+CIg9k/rQxz4uZyGvIFcjiU3/fwah4AX5a+2CTGZM19QaEnE1i6fcT+rMBBKhJUG4NYeQOK24U8Xlmcp2J8rZgeNUDfCIl03AxLLIYSf2KRkLhOSNlOnUxPKsDAsil5zjp7laTQV913H0GpDTAZ4ytQqC9vk5EPAKTNVm79+ADyHNfZfCiw3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxrvynOQm5mdJ0GlILkM1OPtdEPAJCOolXRNhpHhR/g=;
 b=gGNQLt7MRYKGyf3wZQNUd9QSYJVPN9XwPZJjpZMYP4pPaDcqNbXyVXtrbLtmAOsfQbS2gvJpitmdWe8rVgG5oiQdUT9bqXDMAlUFIIi3/6MBF4bZ/h9d00cB16xN3+nYnVEkCLIXeve4bxC/1g7nWcaq4LTqPloHgW7k/tvlnSXnxrFK/q+FuDrNa3UagkOdkWlpf1q45AeNWFgMdtmL6ZmSlGPFno6oHC0ARntYGj+lnBZQE7QPObcp6iPoUeJ7eUrVTK7K3X7Dw7+HVfCveHJkNsiyHZQ8FSb9rYjaQP76JmkX18EhyXXb37MZ+4SETmLWuSiToUHIJk+p355LLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxrvynOQm5mdJ0GlILkM1OPtdEPAJCOolXRNhpHhR/g=;
 b=j60zU16Dvj1xvQT7wu6wyBRH1ieYrR4Ls5mEPETZqPQS0KyLa+avO0Q+sexR/ghkrY86T+Si3hVYUBoJszmV9BkaSnbNc1Lkv63256O95WJFIkxe2mVZ4roqM5pSItQ7Sn3Iiu892yP98TqyeoqJDjjqf4LYL5cP+lnxwpsKRNk=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:23 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:23 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 06/13] include/linux/mm.h: helpers to check zone device
 generic type
Date: Thu, 12 Aug 2021 01:30:53 -0500
Message-Id: <20210812063100.31997-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812063100.31997-1-alex.sierra@amd.com>
References: <20210812063100.31997-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5d75ba4-41d2-44bd-c0f3-08d95d5acdfd
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2448FCEA43B22F42F0FCBEDCFDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6RND57u446b1Y35z4ciIHJ0wGw8HxLUDnGlh8iiTPybRwKVQEhkgmPVXdYJbWjvhJ4sDkJNkk25GVkfGhA+cnF/ky74lS/tltS+/OMlh3weCkPPTczFTeX0LyTbNG7L0FKfQXQ7fQ92oi/Qc/2PYkiyB/c4276UFdaFxWExOXgeF5D51K26YVapCbeetdVjgccAazO0w7v6k8DuYyC/xiabnoNnz9n1Pp3g7Ci+IMeAzYbtgSmpjjCM+v0AQDM9wWXKlgHDxCJ7dxcDE4/d5Skj2CnITtE5pU1GM6iFidaKDoz6Kw54Glo2Ga2UDnOSZ8+p3tx0aeW3TD2BSrFoI0mxAMmnwM80DkVDKSJALD4UMkYYgcGXskmj+BubMwVIJs7VWtoSWHpVDQeCZJwLqkXZzQSmUAFTLKnHh1C1GNedRIpIQRk4w8tWlI0IfW1uaIXE2wUO4viftMzOzfAQRLLx8Y8nZ/pBCDmo5N/KzBT+dLRN0M00z44/qtH8MfNSn1tBsWXOmak9AZY08t8IdRwpU6V4PrNo66EMg8rjfuXd5BqgVAMCK8Z/tsA14fRPK3PBJg0LFz5ivbUBvoVLSPXy6Ar0FEr4Xj5Ejypiz1wLWIjdqeUwpS0c256Wv4kbI8Z7rXKXZ9j1OzQVconU+50/zO8z0H3WZFSsNP4q6lv27GFY+zfkMEukGEhwvsuIZN1nBUCt+V2Qq892l0BT7mkhc+Tmdk2Uew1Z215FoTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(4744005)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0DOQy/39tX2dr+OO35LnpZsPBT8tOv3KBTHuEKB1qzOHVH02V/qoMoqd6Ahx?=
 =?us-ascii?Q?LRphuz7seAOH9jy4XyS3QPU05JeNEVw3oGE3mFwPaZYKy6MSCsHGgMycQ6a8?=
 =?us-ascii?Q?NuemBKRch6LUHzXGom4AGX3HaHFdmAaA6glaKkmsO4ntqTIjsGpKjEcuT6kc?=
 =?us-ascii?Q?wx2048n0DRutyUXGeBquSw1CK6+8U3SlM1OaIx0J34WWi1OiHdk0yNJX6kLh?=
 =?us-ascii?Q?qQF6jiWukw5wnHqLLFepoXfwCms74GYjkuP4nwBwwrgqnE1AvXV1k71NUljq?=
 =?us-ascii?Q?F8kT/xBGCZPMwbL88GLjZsM2DET/ait9LlbVv7vEojuWL7HgRLLogVhrsES5?=
 =?us-ascii?Q?xDBMlouX8Ls5LXFVNEnHHd3S6HKqe647uWT/l1ZOHNA8agX+rTT/aNPQSv7t?=
 =?us-ascii?Q?zTodJEm9AWDYNONCLF5qI87V7NDqX2LVwlD9fCU2cXoZ0i8aXfZJxGxesJ6b?=
 =?us-ascii?Q?9IyN+JpkaPGU67kSAb7RfMBLjxb8lGPI+mbPAi57mme93ESYF5PbsJpqxXDU?=
 =?us-ascii?Q?pqAdVq3PNm0C4cxnliTkeAi4JmeaRWOyiyLYKoiI7xxfo+njsJDwqv7ANjgI?=
 =?us-ascii?Q?KjfElAFYl/DeKNslWWRKFSRirQZwsimZkBdCRUF0ZZyERe7Bao7IuZeYN5H+?=
 =?us-ascii?Q?Ps8LFJnxZUfbwrPuc++4cnXWlqwY36hq/+L/p19IHc21e3XhaQ25Z5ZV8iyZ?=
 =?us-ascii?Q?NrIWMbtjT+7rCzstz1XxGG/ob9u9EAeHLQGFqM5U3QEhY3Vf9A1SWAcJZ6nv?=
 =?us-ascii?Q?MsU+LmPFbGP26ZtTgXto06N5VF5cr0E/01j8Lp4AfKNr6sYAIEaOVjqFoNfR?=
 =?us-ascii?Q?elAYsow2Bop5Bf1P8D6MTVSDywLAyEwM78SQQUYw08XVgemWW6Wr1lCAiNqZ?=
 =?us-ascii?Q?dDtKE2Y9pefkRMZjNLh9WzJ+Kp2Oe7oLeQ0lsJETPWIpn7V8iJ+mohMTmyf5?=
 =?us-ascii?Q?6xTjm5WI0153rbwYQrvOV8uZdUpC16il2LjkeVRuVm22a9qJpCQaFC0TbHtB?=
 =?us-ascii?Q?qsOVfZe7D0njz9vs5+qzicNGHRjLHiqSlYbQJKb451m7mbR6CtK3ab0lRmxZ?=
 =?us-ascii?Q?b1MLHVIJDod0l5R+y+0xEd39QxuDCTJoo4FmgsNmGRMD6BbaZi34eoBfx6Hk?=
 =?us-ascii?Q?f+/naMoip+gnGpXuqnzrBZb9k9yYaNSp0AUB64+TtyiLKVwMi9QLucF5rfg6?=
 =?us-ascii?Q?UyQVS4JphSSck21i+IAYwoxqxgk2GyyXevmIAKumlPsuDaf7jc5DVWf+pU0n?=
 =?us-ascii?Q?zweMyq7Ms/HyozbTYbPltyHytIRQnOrOUV/McJTJ/tpd9wk/SnxkThvdplAp?=
 =?us-ascii?Q?u0zGDGGH02Tufaca3BAyD790?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d75ba4-41d2-44bd-c0f3-08d95d5acdfd
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:23.5229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjeaspAxeqWtOGGnqdMzvtVegvjqPA8MyIEEwZU9Y0EybtA9WnQDJTm9279TokkY2Uf3+uN43YikIfhH1We7Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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

Two helpers added. One checks if zone device page is generic
type. The other if page is either private or generic type.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/mm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c0fcb47d7641..8853acb89b1a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1125,6 +1125,14 @@ static inline bool is_device_private_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
 }
 
+static inline bool is_device_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		is_zone_device_page(page) &&
+		(page->pgmap->type == MEMORY_DEVICE_PRIVATE ||
+		 page->pgmap->type == MEMORY_DEVICE_GENERIC);
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
-- 
2.32.0

