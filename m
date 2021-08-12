Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034AB3E9E87
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA0D6E288;
	Thu, 12 Aug 2021 06:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C106E25B;
 Thu, 12 Aug 2021 06:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grivRs59TKQ6upshOKzaAGNYjqWUtgdQtG9x5x/urH+Vxfw6LKCeyfr3EU81kbw4SJq7KEEpwMTyFU1HhchOtLY7+Ebv3JsNCvbrf38/C3bq7VmetoeUtGx47l6iz4X/0/4jmlfdLawpL6TAg5Ajs9KD3/Qww/Z9ZWRRI5EpM63xniCZGqHqGGRo46NcgAmobhsR7nG6/vNWBAIOJmqPWgdP6z4WJWdDkjdN+dD0LQ6/z67RPsc40f3ThGJZWx+Lj36tRSHIBbml5m04LHvoWHSS55SZyLUO2wS++ER8sfRBuMBqQWFvqdSH8WGNq+a6aztADTec2lbx4ng5gb9k4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQqct4y+lc691CTi5Wn+sZG3/jsWoy6WSYX4uljx2Ro=;
 b=TxiqcCHUd6oBq0OKOciljZAtieez33C1SjZOsx4FQwzuoxMUbttCPXwvQBDeIivKgyaoqhM2oS8dB4w0dZOTX+KhZiyo5AYHtQIKQJi/m+jxoNZoibLjD9C4o2H4mvWwKeNcgCyDHohdG9yLaxH3Io1OLPGqQylfvyYUTGt98ieNUtH5KeuGNb2kHs3aGRCxRt2V0i07H6fjv3X1pxOCOIgL8B4PWY9aKm+XOTcQ6FznDoe61uWW00Pq/Lfzjx9jy3YT0HFk6mcAC/uAkJDKLbhD7/O4XQ7clf+PrZxGEQmRO2Bk4+bpPBrDqDRyMa3pqGStGnqrpj0zRUp/pFygnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQqct4y+lc691CTi5Wn+sZG3/jsWoy6WSYX4uljx2Ro=;
 b=p4GPBHsD3a7a3KugzgQnPRn9JJJGF5HTFHmc1hJgKgpE1TXtzkRu4ygXlsAEDqsUdOlIsvOyB/LUeSSfyMGsGI0LlfpyuTYHDiJzgeZcEga7wz6y40OPVTvCTzPuwGmM7ECC7QFZGlMIGZ3QKSReVW35QnqEVaYB9pMWnk5GUvI=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:21 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:21 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 03/13] kernel: resource: lookup_resource as exported symbol
Date: Thu, 12 Aug 2021 01:30:50 -0500
Message-Id: <20210812063100.31997-4-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2415ccb-8831-4457-4a8c-08d95d5accc2
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24489496902F2CAA9FD3E17DFDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dRNlp0Dj4Pnl91ya9J/qTvnW8v+rWfYsdTUujIBUyp1VqfQBo3VSzPYCLIXnA8j6RMTGvMJ5pTgHO9R/wycTmmwcCwhiJ3DfchCn5lsjF8xiQXmzf8K7DjWAEt+ovVYPNxVC/v0oxxX1zUMmNr4DNsahXYM6uyxJjb0nZRmnzHXizQDrdZMR6ITdTXtIxGyMvetikVfv0u0IwSFpfEiMWJy6KQ/3DPCEenIzJB9YV4zw94CF95oHEqSei7cJH+pNIqAuK4etdFKflNucp3vN36/ejz6nhyMj4060RwT9UUU+uenU31ixay6xzABpyuEHBC4eUPe8RdNRjanRlOt5prb5pMu6h1FSIn+EeY4YxnRTopGlIt7q5PWxMyuw9L/za6wBoh8DXRpOkHf3stFK6eMlQMBRKl975GwgG+MqwrB9IxXI1NtpLK6hy/irfvmZQhbgt2KIpiO2hWHYkkFfo8cFrV4PGhzyp0tbnBP4NfpifhU7sR5ivIlbiZaouTCI4p/L9hRWatsRd+KTHZpjCEoqLZp124qg6Uncb1HoRnNGnZJxZPQV/I8ZK4ru0IxvVmKG2EA1HbPwlAiazEjUknOPmqfqjbhLRhKUftVLqJCTNSrWxttA9a17FzXlXC8essP6ueLSmltmUp90pXeq65mRQxWP6s1Hwdglb+LnukLCsCCW0KkXV20O71MB0DRxe1g/mqMmeqJECKeA75RA/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(4744005)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jBnFbCgrApDLP5z+dpQ536Cp55kj/OrJQZuNOZLYgbJTFn9i07rHUOZg55nC?=
 =?us-ascii?Q?inbf1Lo99OOAU4XOW++wvyHJ2KabgElHwMVTadfblHqQAOH7JAUkV7Y1BfQt?=
 =?us-ascii?Q?kHgMCNiB6FJn++tdG1jbeVkWtYESfuy84jv5JQig3z+0ORHt0U1Rw6YHw6I8?=
 =?us-ascii?Q?GFYRAa1DB5uDstf02JLyJARv47JVcTtdCbM7udMzvKV5yIZeZxEB+QvMQmyp?=
 =?us-ascii?Q?gor7vZMiR+jfskJ2MzzOI9xEGNCWyI4XbOiExsEFb1bG1FsKwk6XjkZS9+Lm?=
 =?us-ascii?Q?mPr/j00kcPJVdkaes9gKJDzA/h5aP9FhfliOHH5qy+9NALkWodHCtx76M6Ye?=
 =?us-ascii?Q?y8MUDspSghQdVKlkNdAbYmjNNR7B7Z+vM/L8ls7jexY7crm58ZF+Wqt9kgyh?=
 =?us-ascii?Q?VBJ9oor+0DIymEt0Fj7v618oS059KWMr0LNEfw9CqZ2bs6rybHyvGAjncjm2?=
 =?us-ascii?Q?/pTNGV6FryHJ9CUaU52rDERr4XbpN4BJZyUPdY0AqkZwXRKRy0r7vy+JkR6u?=
 =?us-ascii?Q?qKy3ZF4w6rU+m3jx48JcNASLL13B894zVLDgzGgpox+KVOIgRgAlqs+T4cA4?=
 =?us-ascii?Q?1SAJViiYL4KMSEvz5WPW4FhvuVKoQIDlNjTLy0Lu8iZWZUvRTN1K8KQI4t3D?=
 =?us-ascii?Q?W01RnOU54ADZ+cmfxdnT+CtWQOO43FHmT47ca/2lSbMsDoy9Hzu7/6TQ4jSc?=
 =?us-ascii?Q?bR+KwY6yKCd8te78WehfQXEA8qjWGDjLL9J7rW61ANXjSiBkysS6NZrVx/TU?=
 =?us-ascii?Q?5fBQtWw7EAEk6CXUJPvQOrRj/5GGOAiIB53W8541kmX3D9rcHEB++CTR/EVl?=
 =?us-ascii?Q?DpZy5Xt90C3Lk+109BH1MYWsCfhc0q8hX4YJYbypyaEsISRhy2FXN/ZTLtb1?=
 =?us-ascii?Q?sBPZDSlpDI3o9o+VAbNEQZ0DJ9t8EM98N9vM4zQMDkmCzddMTOTQVVHx+xyX?=
 =?us-ascii?Q?jqRoXCDfkKfWCRoXEZ82rOuNxAzq3afcQq7ZERgnbL2gPYGbAW5fAEUReR8Y?=
 =?us-ascii?Q?tVsMiHqNlqB4OY5L95Ou5XlDZkcnMNX8O7kDkB+iOrvVQxUfMfEM5/IXkEbK?=
 =?us-ascii?Q?BbnOSmeQSru8KfJA7oovBnjXpq9XZyTbfqoi92Uj/NE0QeH1KnSTw98Alzpt?=
 =?us-ascii?Q?dewdWuX2eDgAoCqF+T4hfyrtrvZeAVasbf+5aNlXZtQNhItGtqUTNDaBWfnO?=
 =?us-ascii?Q?+GNxdOHXj/a8wXnuspOxeXniR23ahZGeF+TeT/Fn4qBDTTMAvy5AlZyKzFca?=
 =?us-ascii?Q?kzTJEJVvxu2F1rruJvEOXdcf5k34cmaf8dX2qZxDyHRz6AmIZCaI3zQzfO+K?=
 =?us-ascii?Q?k48Txk47DnAcfZQDL+yCHIZW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2415ccb-8831-4457-4a8c-08d95d5accc2
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:21.4739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUjX4hIj9YRoepM8Y1Eb+16S3kALh1IdrFzwQx0SZkVEdLaFc0KrmcKnG7uhudBzo8BDZ3dQYddp4ZeH97oH1w==
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

The AMD architecture for the Frontier supercomputer will
have device memory which can be coherently accessed by
the CPU. The system BIOS advertises this memory as SPM
(special purpose memory) in the UEFI system address map.

The AMDGPU driver needs to be able to lookup this resource
in order to claim it as MEMORY_DEVICE_GENERIC using
devm_memremap_pages.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 kernel/resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/resource.c b/kernel/resource.c
index 627e61b0c124..2d4abd395c73 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -783,6 +783,7 @@ struct resource *lookup_resource(struct resource *root, resource_size_t start)
 
 	return res;
 }
+EXPORT_SYMBOL_GPL(lookup_resource);
 
 /*
  * Insert a resource into the resource tree. If successful, return NULL,
-- 
2.32.0

