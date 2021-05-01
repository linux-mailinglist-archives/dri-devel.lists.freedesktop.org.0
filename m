Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10423704DC
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3470D6F638;
	Sat,  1 May 2021 01:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9DF6F634;
 Sat,  1 May 2021 01:58:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA5sXZYFPiCZZdP3Sw1ba+0ZWhhf8o+NTu1MLFGqIITqsIssNjT4kxFSohtR8QSaLEbVnaRkotD8vYMUrV1fa0TjszE6pWxmSImpINCUCwqGGmaeT+DvBCTWlntnErqF2VcbIzhkWTGsvt6gYEimE1xnFT0PeS9w4XNMi0ldt0u4eX+RiS/v1LAh1HN/cCjNAvLHeAveyF+WQcqugSeuJ4TkMnwWYYGRYGUpOokFPs0t+y63cjuFFVasgE/Z0yhkTYqBOkjLH7XgnwAhka++28BZJlgkyd3gZ9/b6Vc1FWZBxTTngqY9OLsypwmuAQvHLubR8dCorrnV2S0gJzqTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LV3/7Vy7xGW2JB7dtx6UKMz6q0cD3/LeXt9qXceFMWY=;
 b=meoY9mSPL5cUAOzZl3JaOu/LKvObHPyaKVq/QO96/Bqm2oTV58jO8qz8j1bycdU7XO5v5Jbqet07R4MT/CspK7hHbp//O4FuJ3zaGzJIBwgi8rI5k3BDiGH83pMMqxoDbbFyPjiEUDnc1waA0P3insZgxSto7C+gwqwuqsCMvWfIdRkZuUq/7vx+iYxwcUmDe9rnvyRgH9qLq6iZrp/Jr1+rZ3y/GVcSoo9KT0K09mAh9v420KEC4uaJlpNj5l7iI+9GHCnmsEtlLTDjRg8RA7OJaEkJpd4gZso8r1K3XtoilObhM/lGbqvWa5UNTAs4/WpTEljTmlMywWc2MP1MNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LV3/7Vy7xGW2JB7dtx6UKMz6q0cD3/LeXt9qXceFMWY=;
 b=rDubAKHbkDKiDnMtuo1iWhgu9MEZ8fVWdEx/QNypvSIHZmk6cUP+HntMk4Q+AkISmYS2USHM9OCWf8Cl1uVjCIffPwbd3Keix1/XdRNH1XoKfyCf7wD5V788iT+/8YPbcTKc8rK9r9U6UUDALnRKa+wtJap3AIAgns/j1+yPayU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Sat, 1 May
 2021 01:58:35 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:35 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 17/17] Revert "drm/amdgpu: Remove verify_access shortcut
 for KFD BOs"
Date: Fri, 30 Apr 2021 21:57:52 -0400
Message-Id: <20210501015752.888-18-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501015752.888-1-Felix.Kuehling@amd.com>
References: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31138db1-9e14-4ad1-017d-08d90c44a0f1
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4932E9A55E635C5DDDC6EBFA925D9@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0bj92ns5F2fZriONlYw5iGP4wehWtix7+sIA5zlLizgrQyAa53x4hqCKQ9or0AjK5geweL78uDwIvPaFL3wnAxRMldB8AGs7Ej2Gge+TVf9DxLGgy1KFDThpjKpLUAraNaJM0N49MdFunNaVXf1QKSm9Y0nQ35nKweybRHsBRRsdlBp8F1N9KgR5lGEAA9Nyj/C4P+MrWhuqhVEPpIGO+ExkIJ9+Ox93uW2Zw+H2elwdylhVu/Tb6vtNy70ZZtJlZ3WC5ZU5GrfGqwqYqcyj+Gw/bC/TRmSCwHkPWgKiMqmuRStg7tkue8Ul+fMlTp1RvatELTJOTi3HnhHb+uHJ3KGPnJKnrvBJhK5DgwhAS2LOjaudG+JDrWoCXsgUq/TXM1Uy0wK950M0E2be+CQgpshZ6gaB7i6X85GBemn5pqxRC/663LPyYq3hZ+yyijUSvdC/HohU7UH2Rhvi9kvDC/E8uSFegGBJwODtrEHMQaduzzHol2vVnQz2HuVx465s3qYCOlWoWGnP4uCBN8zqZ7PxhKk6S2K2rs7uuh1AkftYGTQFZzu6AtAthzFKv8NhwKKxd83Jg2h6wXSqUN+cglKiBSXqLWcOpPbJhuUUbsmevyGhdKZMd/Feo5MM4II4NUtVuj+gL62/Q/dkyPhaHeRRRLfv98aWxf/gKkgTuqZ+2ETbfm5ez32m0sTZ7/D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(6512007)(83380400001)(38350700002)(38100700002)(478600001)(26005)(16526019)(186003)(6486002)(86362001)(4326008)(316002)(2616005)(956004)(450100002)(5660300002)(6666004)(66476007)(66556008)(52116002)(2906002)(6506007)(66946007)(8676002)(36756003)(4744005)(8936002)(15650500001)(1076003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PTxfpg/GBFQJEvigi2pHNGJk5BzjSFVJKpaVwNKg+XEXbmFZaHA8CeL/Oj56?=
 =?us-ascii?Q?Rhw1v+KgC93QGMAFxRMXN/Vy3mr9jBTOGk6dC0mvxn75rJk89O39BPLmMpBn?=
 =?us-ascii?Q?Z4dXmfkEeHFmNLihgRyT/oohW8I1scFkm0Rchoc6Uif5WChdXc/DThzpmHGR?=
 =?us-ascii?Q?sfNz4O9VKnfZ1SJ29SX09RFmajpabcoau8sSnfNlmlEXtF3mYvz+pGcN+lti?=
 =?us-ascii?Q?WZKNebAuXELbs/BgfzZIhmPkltLZN//C8zYHsnlQ4oV0ZhXZJAcGELdxcR+B?=
 =?us-ascii?Q?rn+CduFdYzrzalNCtcRS30UJbZXeL5XwgK9CFuKMc4I0X6v6yn4/pMkKEey2?=
 =?us-ascii?Q?RZpqVI6FA8/6Sfl30AkLsHszP3+nmrkQ6RKrBn8pPtvfXsw029SKjvBBU3oq?=
 =?us-ascii?Q?ivWE+dxZRagWDM2mZ+2ePV9XAGV7m42Y4S7Lfkes9yDgIEVb81AHBMVNu/bz?=
 =?us-ascii?Q?FgVcEKKctqyPEUnvToYlcZuwCw3fZfUlNM1/Y6qBfJatrvO/HKFqyeyJMno4?=
 =?us-ascii?Q?ZY7eV4RZG0DeFctNi+GfJG2S7+tEhBXF+9P/aznPuhPZxWyYC5Wx/1QYKxKO?=
 =?us-ascii?Q?XGQGke6OjSJiLqT6mSGRPYXIExhAleMX3ynqdUEriJw6+9g0aigCV6i6ayM3?=
 =?us-ascii?Q?bAubtYjClCmnT5mU+OTtz2NfW57rWrt7Gn6Uwrq3P0kaMXssg/0pMI2NdYDm?=
 =?us-ascii?Q?aR11KpGvhOnqX86sXYHEQOXQbqqmze+y5OaAPDjxfqeqjA2pw7691IrteC6d?=
 =?us-ascii?Q?cyHVdQtHB4JNqjAw0/xP6CauaGNmd3/hwAuQdi17KpjL3yIQ7nfJAq9ZosI4?=
 =?us-ascii?Q?1WquI8catOYbUwrjDjtwBk/JkibvCz1YcX6LKvXyf8b0ClIcN27d9EgB1Py5?=
 =?us-ascii?Q?9rJZkfQL09geEcrEM0uqhRkDF19YTYEv8TXh9FowGNJk9uyrwXlqcpbAY/88?=
 =?us-ascii?Q?x0iKk1WeDjPMqUd2fyh7v96h6idfSV27gvfRluczjmVRIx4c1V82cUaGXJAJ?=
 =?us-ascii?Q?ALSt7uSY3FUZ6It1vReH2YZDrhINIzujBfarmQtAsAO7WipAEQxQKFyy+ohM?=
 =?us-ascii?Q?Vmvzj9Jy8nFoO3GbmEHXa2QOKVBzYCpSMXvjOalvvds9JtIKQRlx19KICwg2?=
 =?us-ascii?Q?Y/IOiNZyBElQfn7xoq2kwGweJ8ztbQBvghn17Hu5nUxNwZf7SnBNizs2+VJ1?=
 =?us-ascii?Q?Q6iEjlVr5WIEjAjpS6JE8PqTDmo0HToh9Z4SFPpsqA7mtqtQBIug0ETWsBic?=
 =?us-ascii?Q?MdKUT9hz/Xn6SqECj05v0nYmEAjlg2RgohlphvceSViwpaAQACYwdNiVDZjm?=
 =?us-ascii?Q?Ky8p1omcT8IdB4twt25Rg7tt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31138db1-9e14-4ad1-017d-08d90c44a0f1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:34.9573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8y/qaDb9UsbPycsuYqQyteWmnGOXmHtg6zsvkmtMc5g2csBI3o4t7MiR1ecjATIFWZMMu1U0FzTaubZm42b7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
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
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

This reverts commit 12ebe2b9df192a2a8580cd9ee3e9940c116913c8.

This is just a temporary work around and will be dropped later.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 99ea29fd12bd..be7eb85af066 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -178,6 +178,13 @@ static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 {
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
 
+	/*
+	 * Don't verify access for KFD BOs. They don't have a GEM
+	 * object associated with them.
+	 */
+	if (abo->kfd_bo)
+		return 0;
+
 	if (amdgpu_ttm_tt_get_usermm(bo->ttm))
 		return -EPERM;
 	return drm_vma_node_verify_access(&abo->tbo.base.vma_node,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
