Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF103EB026
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CA76E504;
	Fri, 13 Aug 2021 06:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136636E4D0;
 Fri, 13 Aug 2021 06:32:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqsN9jPA9tBoyLZi1pELWlrIJWZbuSDz37U8blwOVzhREBhykPjc4QHpTiseLRrUsDiVkj4uROXg2CEnpLjRbULIfjlxGaMlst642KZ3Lgz3gSKX0XuK9On9qnPxdrztym2dw8HEbUnVoN2eos/IBESBDMO8fCtVvNkv2IQT6FdUnCxwPDK/RaUNCwfZc7s5cPaUuKBYA1eEubAjdaXbN+fQwGqlAVQoJJa425BNNAMBua0jbDTL8TK+zgIrSgBjb0oqJSL897Pro8i5CRyygk0reHvKgVZo89CfepUjgkSM70XXatI56Ad1mRnEUO+B1DgpCH/crU7KCHJvoKMl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUEROg2UDTQq5LhzAavd4Vw/sWGqA8IarIMmnrPNAZ4=;
 b=diWRcy/oDBmdOmIsBEC4w0RBGYIWLP97nR11wxeTl7e4pddQuz3gNAXQFBj4/zUByNuQ2HPXP43hbyAGYdal2TwhmhZXPeQSSJCJQSPQn7PVC7R0XnqeDjfZW0/Y4Ctvg+hDYZs1+nht+bhA/33xYdOF6XIR6OTFJcuqzvGUlqiaOws7wpY1dwOapcPRIFpltrSfnRuHWYIYbYFGG5/+l5BIr3Yibtw4Zv+JAJRNTYDtQ8lkHdISHqkKZdin9v4UYfFFjztEf5U6I+ZxSj/8t1IAvqWKiDKoMTTEhiyqpT6UtjqffCG1V2hcxcNtCDQWWGzUEyyRguFtG0uJowZlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUEROg2UDTQq5LhzAavd4Vw/sWGqA8IarIMmnrPNAZ4=;
 b=aB/Icd5F5T19wjDbkiD/2UfWrAFeU1kUPgOZ3g+660f1G7kWaHxOg6OV9Z9ip/hCEOIyV/s2zoSUJ/IJFFGhraVHn+cGYMBGZwgI3GE2ABoYvFdsQQqoQDA3N+tNrDIDF5krSuGTEdbwJCAhdTskkxT2MMqzsqHYMBjqWe1k1Hg=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 06:32:05 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:05 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 03/13] kernel: resource: lookup_resource as exported symbol
Date: Fri, 13 Aug 2021 01:31:40 -0500
Message-Id: <20210813063150.2938-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813063150.2938-1-alex.sierra@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed368a08-2203-4a96-3de0-08d95e24111b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27185A41E3ECEA5F88AB3757FDFA9@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JSl1y8LmsF0MDUnrKYz4sK0LovH2bCsYEuGs29cc2XU1vPr7TdJm7VG+JwVgbZ0SNxAcj34uExPTK9vIQCEi3wjoZCu+lwDR4dWRa3cyRX4EiQRvEmMeHdjELd3kzEzoMVJzRj9QQhmY8QDjV09bIyVu8BTALyE0nClISFylxSdPUDoMK6Ze5o9eqZr6YEy3xN9udwjYaqg1nF0+YNsH35Z/qXSFxciaVravozzCc/3pBiUNqWHcdLKHQSyNbah0xU2XC7ZB+35MiaigglH+KvvH6m4IQEVwj+3ehoLWMXrEB4X5bqbrj8vhDrw696l7RSEq1tSFtxGs1hVETlsAfFrieolCxRwT0HkTolBsBkWhKJ26lY4Lrf2rB3ST/QVq+ooMwFSxxTfYQ3vCXBCTt321UteSoheeXQ2r/TYnO4uTbHB7UY+2wcSx72DYrd+gBPYORmFTNei5oT2UvJhL2Vg18CHbq5v9MSea/nD+SnkaVRsRiToaO7sgN3du758INmzTibAfcSJPlZ0SehRzH4xgzvBJXP13AYVdvYoRXEyaPvTnAlquaBYLV5uVnA1x4GWq+fj5PbbPCqVGjrTPBlQjqfPhvDlm5cJ5T/Tka0ggvipbg+Nog1ZGydy5nv3vVBtwkmYPWKnzj7BzjUwVRmEEYdOqnd0RKgXEk95jT6cYdTNrm0Y1ZDVmX5d/57feam8BSuy/66XK4qJXeAKp7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(956004)(44832011)(2616005)(6486002)(4326008)(4744005)(86362001)(1076003)(5660300002)(478600001)(8676002)(38100700002)(8936002)(316002)(38350700002)(7416002)(2906002)(66946007)(6666004)(36756003)(66476007)(186003)(26005)(7696005)(52116002)(66556008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YrTkPXnRKUidADlzdXj7gJYeoRZKektg/zp4xb83SJfDnNyLuN591A/6gF/v?=
 =?us-ascii?Q?QZ2q0UbINzanZ91xAFbXio2zyaKGhwCg2uuhg5Ob+juzuezyjL3NWMwJE2ah?=
 =?us-ascii?Q?cdR/E2fMEG/g7oxn49Hf6u0p345YH/KFUSLf44Gy9ZSXIJCUQ9PlqS1uPygL?=
 =?us-ascii?Q?MuYG2JooXaxI4Fp1yzTE/1iL3ImTgoccnwYSwYmhkdLVpkJrKUPZj/c7iorA?=
 =?us-ascii?Q?/UtNiRS4fQ4YViUGJQWYC16yM0SVCPDgv/yYKGvCMXisD9VS7kepomKHmAHk?=
 =?us-ascii?Q?Boq/upf9NxyTHkARbTUcRRNqoORb2BOg64fszSsPql7tefMk4KcN02/wJgNl?=
 =?us-ascii?Q?h8l3YTgpdUbRtD3KVxbZdZrsHfBqokYevmTUwCYNfn8VOni7Ro8jKQuUwxtP?=
 =?us-ascii?Q?eltmgV0z1sYdnmDJxMYnGwDi/E7MSjS0xo/u6RLuIyfqJWrUKnnE5TLlmEr9?=
 =?us-ascii?Q?n+hKC+hE+26VGzuKM31ENQ/NZVJ8/Jl3L1xLTSE62dP9xK01/YEjwTZFtYny?=
 =?us-ascii?Q?czxnmaLCbzqPfZQyESA5bc/R1XH/n4GSEiAr8xXcACRo7C93OiKGp3YfVnZF?=
 =?us-ascii?Q?g4dLW8rkBQl1SHvt3imTnitoJjOAMmbd662XI8F6bTlBmOl+ig//528ofKEs?=
 =?us-ascii?Q?9Tq7F73l+AgyMqcV7fJgiJSKqR43vx7B0IzlzNkFTPQjirkrOMadfdT45nBl?=
 =?us-ascii?Q?cBKt1D8i2WHjcjJp1bhaFT9Y1reu6QAM/wssfDI0qCeiyqF1XVeDMATib84l?=
 =?us-ascii?Q?7vwrWBV8Mw/zFRgaUa3k3N2PLg0CYwD0eWLyu8gDhCQT3KHcHLVCNcnHKtUl?=
 =?us-ascii?Q?GzKOwWTeSt2Z509Vf++QGN+Vgc1dhGUE4ftGj95JMqJ7T4rwZOi5lV1FKOtJ?=
 =?us-ascii?Q?rTy5gycmkzx7sbZ8cVsAkFw7kvss86Y6m+YezO1bNtwPCnaZvSL0l6YVLQQf?=
 =?us-ascii?Q?m6MjPxFcrA9xat8JUI+/mQibmWCDdWSNPz7imta6RlKzpl1y2QyOb11YHP0E?=
 =?us-ascii?Q?WooyvwwSrAI2t3igO/t54xBTp2mMlVCNcNOewQ79SNcn4FoArLt07i5sHTmR?=
 =?us-ascii?Q?LmWI599h/ym46vZiXhKrD9hhz2Vp8vFWP9AILGzAeqkS4OxSzYs4QzN87ZMI?=
 =?us-ascii?Q?3zS7q70FtCTaeFWmrHvgr9mqdRXSXwWlmcvH1+kfkgFAiFANIBOwOg5MNIeA?=
 =?us-ascii?Q?vSttt5PFjnQEmKUF3LjTugjbz40BpzT01JqWCIorvnBWzUzXP48dZga/z4Of?=
 =?us-ascii?Q?om644x9978jh39uCxRhmuDN6CgjckecH3kv0lf9BkAJ9nx3ec9xCcbIan1k2?=
 =?us-ascii?Q?mgl9q7QVuGS8eyks+N3KaCTb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed368a08-2203-4a96-3de0-08d95e24111b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:05.0150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YK64d9WEmVwWNTig8PLcffU0yWCg5RybJhihVDE3q0zUNIOZw9L/hGv+pTelQEE7nR2EPuJkkmIpb/IJ/cJb+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
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
index ca9f5198a01f..227fc9fab573 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -772,6 +772,7 @@ struct resource *lookup_resource(struct resource *root, resource_size_t start)
 
 	return res;
 }
+EXPORT_SYMBOL_GPL(lookup_resource);
 
 /*
  * Insert a resource into the resource tree. If successful, return NULL,
-- 
2.32.0

