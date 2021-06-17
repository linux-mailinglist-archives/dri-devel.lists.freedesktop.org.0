Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F63AB732
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079E26E91C;
	Thu, 17 Jun 2021 15:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEC56E91B;
 Thu, 17 Jun 2021 15:18:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyA2+3Gd0I6nT/0RLGx+6EJTmE10p+79A3gCCvYv15H2rz8ilXT5n8o/KFw+CSt4bjbl3N5XzWNbOI0zAJP8kwasEPaiVgCJ2HLvjvcUINsu2lS2kaypk2BkCxNyvGHTyGkreCmvMA0hU/hKfDNQfF+kxgU+Ac1fu2u6Zk5D/6Kx5NzRN+KHcqG1WRYkYudXrvhUwIW+o69rjSKX/9w7lmgbUn6jRWrcbH5lcPS0ZhJOWEb9QPKgFrhQ1wRP/rVoWT2IiJdlkq0FcklxyzBAqxXVHtKRvv7XRAcUuBUyzfO1qJUgv4dqv3rfCbrLO1maBPKBy3/Zoo2hNj3QtCxH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAyEHlM08oFq0MP6MAe6GPLU2sVEDRrXuDLmfsvY/H0=;
 b=d45rdXTpGpA0tTGo2Zh8AiC5s6Rvmz37X/yzhX6xvzl9jvKKAhCg3FesBlRtT2Xg0c/f2lKdW+84Qv6ItXCGymk7vwH4msFtL+tc8jpfL544WttrReUnF28v+5VfkMTdFITIxlasvefX8S4x8yFv7i8MbuqaPNQhOMCMCnZHzR5ff/7vgsF9j01XKZHsApPpKyzcMXkczGSwbO6COtN1hV01PECWkDa6MG/xMTDZ747QccHR7dtPdpgGFKykqcuET742Cp8e5/3pDfW3Ybp8jbQd2/BJFPubUmmaHbqac4XR0OnVleVuuyCQ6oqZJbrGLcP4H8/fRI2wih3p+CKyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAyEHlM08oFq0MP6MAe6GPLU2sVEDRrXuDLmfsvY/H0=;
 b=XhL5O2S7yQIGGkyIVIWiob50bNfe1Dnri4fw+k60S4Jm3kaP1xkcZ202NWaR1KpkmFa3da701660U0SD7DpvppJIm49GPp3UujX4OhJ5bn9vyPIgwqBIpptPS0lTFLBv4nxcdC24YkhZKkJLQVLcfjodFfpHY0N2pk5pIMH8kHQ=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM6PR12MB2970.namprd12.prod.outlook.com (2603:10b6:5:3b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Thu, 17 Jun
 2021 15:18:14 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:18:14 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 3/8] kernel: resource: lookup_resource as exported symbol
Date: Thu, 17 Jun 2021 10:17:00 -0500
Message-Id: <20210617151705.15367-4-alex.sierra@amd.com>
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
 Transport; Thu, 17 Jun 2021 15:18:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d163c79c-44f7-4f4a-a116-08d931a32028
X-MS-TrafficTypeDiagnostic: DM6PR12MB2970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29707E9E8D46CE599CEB7B54FD0E9@DM6PR12MB2970.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kx7bObyg6Zv7+O+CQOnpHh+Vo3IoQDPp0TiHFt4U6XXNxAn9iEoU7tPwcN+dM8Y14Dp1t8g/1lTCcQr94FDzFXroH46JfCHOniso9m/jXgYMsTd9ZxOi/xMVhr5Swz4F+zHsc0hpEpzBkWG9k9Te+JyElgfi7r1OKxeZgBv/igSAe2tN0GL8T0CzN8T3YH8ct+uq+RuHcrL1wVfFTn7eDKV8agT+K57Gj9vJFcx/wPymmW29leurYUa0zDLBWxRxfmSBcxlXHyc9qEZSq1mT1FQIFCcRv8C0wVgihjRxFY5VScoT4JQj6rPKSXipwrwCjDGutHyXj8EKZ6H3Xm3WLGnetCgUL+/guaB2bFqJxg6fTcjBJBr73WimGhER30mPBRX7/o9o5kBsO4htdhokjsq/JEegE+FUAcdgXI+MmDH4R65sEfbjB8OhMFEyqJsnMB7VA4CfQwaYeI4LQpvlz3DkKhxOBe++8LKikL9w0MVuVFRB4ct6MgDZIWug2zEJhdcbKUoSdfhVUlimIoOMp4u94L9Js/Abf+vqAYNI/PA8+63vjC7S8r6sSdaPDtCrTtA//N3wj4gw1nf/SfvVZIxArAdkNty5OSrPJmYmn1pV9K7US92KoqoA3tm0P2fhPBy182W9wro2KiMIQBKN/rz8GHom+svW2GX8VA487qo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(83380400001)(8676002)(38100700002)(86362001)(4326008)(26005)(316002)(4744005)(2906002)(2616005)(1076003)(38350700002)(956004)(16526019)(66946007)(66556008)(44832011)(478600001)(36756003)(6666004)(8936002)(7416002)(52116002)(186003)(7696005)(5660300002)(66476007)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6la5hMQ6ghu8zAjX4Qe/5QOEU3yY60ECrfi5D7Vx2PzwGYrqja+0zrdA70DI?=
 =?us-ascii?Q?bpj3AjTYT6vLloHPUrVgsV7FbU6dBmj5eGQp9Rjc7tePcvrGyPJkxLGOT26e?=
 =?us-ascii?Q?E/2um+mRVnXVMtLY2vqdTeJ/OOUNKptXh5WfdnGRyHXtvJCyY2NwEjLnSnUt?=
 =?us-ascii?Q?lIGw8n+VS9LRuG0L7JC5jBQ08raJeBahtyal0HTREhEwNzf7N5KH+c0rJkFO?=
 =?us-ascii?Q?gEE7XyBwuQytIE/mi9iICpu0EW4tCTx/ubB9qDsuxDxgo8MywV0+OX4roEeI?=
 =?us-ascii?Q?lvmEzX4FT4xUUdsSZLUf/JLiOm8Qa9xLHhIBPQOhfgTm102BwgCgsyGuAhfO?=
 =?us-ascii?Q?gqvOLZa0HhF6axi1BRK1GnGdoqyMt42ugc02I9b1yFt5W4/d6NN/7m1R0bVL?=
 =?us-ascii?Q?5a1TQJSLJbuJmNnlaOHxnZ/MPcfze0kroSlHkZPB4Ef0NLfqgnRwV+iHrX3u?=
 =?us-ascii?Q?vcqcwReqfbOBIL7u81ZbOgdUcy6Ok5fH7kFLeD0i6tN25hNsTVXUPMqm9Oud?=
 =?us-ascii?Q?Cf9f7cDxPsINGvDI9J//v2Mylhw19OfoSk6mkTnu4Fv9pzOm4PKDkbjcb/r1?=
 =?us-ascii?Q?foNQ7DIFMw/2t+Z/IXQr8OviVd/BPWZ17kB3L3aoVhIcFmaW5MG4tOVWWJE+?=
 =?us-ascii?Q?SItdTKxyfeZnHs90Y7YpXcPRiREWzLUitk3KXVHhFrkYvQTBLFPgQ0pRhmD0?=
 =?us-ascii?Q?WP5tnVrMrRDhTBzYQ1Oinm2rwOYsonilPKdGeAEDsq3mY5JHUvwJ463mbtta?=
 =?us-ascii?Q?imoskHv2ganKlwTkwCQHUAe0PkiwexysCbQ/wd9TQi+1OQAg1TED+AiS6aKn?=
 =?us-ascii?Q?M4DLEdjbFZ5TPbRUBcbtdH/uk40Y6aYInz9IfliMjng2LgvzVVTg2zA78s60?=
 =?us-ascii?Q?Euzw19VsSiizJ7aCCh8h/ef5LyYDgxLcFp8uKhNTVzdCo1sjPtK53V8TGAUf?=
 =?us-ascii?Q?6Aw7RG+CL5dU1s4mbKP9O/+vc4QW4xI7aSu+MLq8zlIvDzgx3OsJBjltmBF+?=
 =?us-ascii?Q?Wo9aW3ANUoLA1g/aNjG6cw26Y+eYj1dIxHqAbT56IMd3fDFRZr06L8V1h0bY?=
 =?us-ascii?Q?bBR1WMyUgAQ0RRgIRpjgVuetPD1Q9AMBKvRHvruglmGqhwF1+WffbL2RNrQM?=
 =?us-ascii?Q?GQU1K1D/8TVEqVKXZhPWQi/BfWn76bnne/MOOKd2MgC+uswVcoBDX/tR2sf1?=
 =?us-ascii?Q?NUSdu6REGoS+lCBDFShb3JCPk2pRTeZFIA5RAF/VNtCclSmcxyRGBz0VI0rX?=
 =?us-ascii?Q?Ue0zUU+S0IDPq9xdv4kYUKDFJrZ3X14tWfr6vZK+fGpaznnG1fSqI0ECJAol?=
 =?us-ascii?Q?8TqFm3FztvJPANOs42lxXQ8V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d163c79c-44f7-4f4a-a116-08d931a32028
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:18:14.0959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0KNQDuCw1IyqTnabmyEPSJf7cxuUWVat+EIW2Bb06yFCE35l864pOsnJBlBnPvlB+tOUP9uL62lsQpMFUPfeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2970
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

The AMD architecture for the Frontier supercomputer will
have device memory which can be coherently accessed by
the CPU. The system BIOS advertises this memory as SPM
(special purpose memory) in the UEFI system address map.

The AMDGPU driver needs to be able to lookup this resource
in order to claim it as MEMORY_DEVICE_GENERIC using
devm_memremap_pages.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 kernel/resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 627e61b0c124..269489bb7097 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -783,7 +783,7 @@ struct resource *lookup_resource(struct resource *root, resource_size_t start)
 
 	return res;
 }
-
+EXPORT_SYMBOL_GPL(lookup_resource);
 /*
  * Insert a resource into the resource tree. If successful, return NULL,
  * otherwise return the conflicting resource (compare to __request_resource())
-- 
2.17.1

