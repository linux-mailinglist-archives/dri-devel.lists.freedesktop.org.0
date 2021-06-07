Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3549939E89F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 22:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A768C6EA09;
	Mon,  7 Jun 2021 20:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790FF6EA02;
 Mon,  7 Jun 2021 20:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=We7gtbAzR5a8GcGuaDbH419c8PNERooEcvJ2Lt1ghEQWBu6+eWcF9RHx3RV/3ln3waOU940gMEGx+iWm+Ojm02NYADx0VDPbZW8xQ4Z/l1xiIRz5y3Qseg8DZGJFZGhdIq9cYFRRnQEiwYJk1GyU0XIl8mUL9dssmIOMZuF6Htmeqa6I5VpIj7+L8XFbQvvdRoimgRR7/mZXhffptYfpZpulc1F+Ng15ZeOrCbDMsmK0RkYED7AIyzIf23eRkU3eiQMlx6Xuy2v/4ppOapDbmniy509keXWlekJ1z5jIeL16M0kSx3ukxhwJmL0A7Tgo2MDhPFULRVRna6Fp8+uZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAyEHlM08oFq0MP6MAe6GPLU2sVEDRrXuDLmfsvY/H0=;
 b=TfNhKx/u2rJDt4qkOFZMJytXd3ZQuF8YrgBy+DStfCMSQQWxQZwC7m++IEyNSWZ+3hUXiAYNFYdkfgQYlWffoJkTHUjOHCjvzW9ffK6w0+CCVyd0cGc8ukt3TR/uFdvD1apsDRj3hMlfpIQYwdqy/lzFRzm5dsIBFUAUj2YKNgLWl/pn/HT1zn/Y3zMbCEjMgI7mcBIObO8rSi+oI+4/nzWk6cyoHIWV3ARjt5C6Iz6v6gQdxD7VBCS+h5Dv3RDdzWviNQFp7x0iYcADhvYKShCVxvI8DneoUa77R1wA72Gq2gFeFrqPEHHlLJA/QOJbnHg9cvq6N5sdVK+bk8E7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAyEHlM08oFq0MP6MAe6GPLU2sVEDRrXuDLmfsvY/H0=;
 b=YGlMBJd48qCmf8GN63ebWc86Z2bwM4S5W7YIwyGdf1WrfvQPcGNqYJmIo3f+3yhWZ/ymhtjs4OwdDLVuhUmoK5QF5BvvyeX8ZasYA3U/I5OdEay76blJD4VzYtb6NLBp10C9K5pOW4gfCLaomkT1Zmnfh5svHZXsIlQTgsd++X0=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 20:42:41 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:42:41 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com
Subject: [RFC PATCH v2 3/8] kernel: resource: lookup_resource as exported
 symbol
Date: Mon,  7 Jun 2021 15:42:21 -0500
Message-Id: <20210607204226.7743-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607204226.7743-1-alex.sierra@amd.com>
References: <20210607204226.7743-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0601CA0018.namprd06.prod.outlook.com
 (2603:10b6:803:2f::28) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0601CA0018.namprd06.prod.outlook.com (2603:10b6:803:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 20:42:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0a704f9-956f-4e97-75f1-08d929f4cb79
X-MS-TrafficTypeDiagnostic: SA0PR12MB4495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4495A74340C43DFCEF9F0196FD389@SA0PR12MB4495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4E/OYJKCHRzkcwSnt6QFWPDFdw1NgvVNBXxn04n6k2aalmoVDz+cNgQF8o5zjUcoqfW3hjZ4n7j9LoIxKjzsoRgaBUHP1F7i0PaaVJzEi0y6dqh6ksw31nD8pv6c/fehaluBUzWJbdqCFWTwpgbM1VcyZFPwYDZWDrCEXThhJ+KWpu6d/iDFOImJ1KBrv8Nj6s03hx22NLmPqiPtoaZCCIjy/iD5lO+xM3veN4OCqP8LnY7KKIskMnJ7WtB1QFInmEAJgeIP4vuoITV1E8fNEu0Mld4/JwjyZ1t+XwmwZZJ8Bvh9vDnPYabdymExJIHYcImOxSfXxjDF2O/gk5xk6WVp9nfWaiv4q9k92Ak1st/IdDu2LgXbWb9/RcE1SmRFAtzeP1ypuVPbJ0k2lGYeqBQiSuLOB48KRuLGkay3bWEENCGtUUnAv+46NwNCiTxhdAW+PEA1qPjcHAnF/OphiqGytryyU17/9xFUs+xSaFmRpit+xvzRtQ1RMzPcYm0C87OW7q9dRoo77bcoT383YUZ7Yi2QCChfLeIvh4+mHLK3l8d/zp6IS96UnqizgHUyhITKWEOHhNXmBveh1vwGUlYDbbbNFISC5xQFpvcrL+cY9hiq/IThUquAFJ4rf1uXgTFWVZmcEZ2WEQFdetCwBYZY+aI9HwqYV7tyGG/HnA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(956004)(2616005)(4744005)(6666004)(38100700002)(316002)(26005)(5660300002)(1076003)(2906002)(6486002)(66556008)(66476007)(186003)(4326008)(16526019)(66946007)(44832011)(52116002)(7696005)(478600001)(83380400001)(36756003)(8676002)(38350700002)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?juX3muZuYFzxjg+Z5Rcm8TsdBc9OIDKt0xfR9nOCHHo+0jxNG54UTCje1kDd?=
 =?us-ascii?Q?1djmoIC1fJNRKNdOQjDJDgKMsiGCMcg/WZU6xu5/W1awczUsVLRdT8yWBNgn?=
 =?us-ascii?Q?NAO76gaPDM/aEHlV61VeIs6/8MVKuTKOjIbimSLrbOEZJMawK8XX5PHvNk9R?=
 =?us-ascii?Q?njjBrqLaejexXB+7Vom+/Ve61DeCW90rLT5z7Eoq7OLjqC5CyBU4aegyiO16?=
 =?us-ascii?Q?hmHAGFNdZezXIF3Ql4KILy2mWoxgOaMo8a3dAjdssbwEBHMuzijUTb5iNY3a?=
 =?us-ascii?Q?0tyi6pmzqXVFX5EWdLz9hb/7SASPdj2WizbiRHRYxVGyE1QPy/F5OZpK4WMf?=
 =?us-ascii?Q?+ftotbmtAl3s+K+JIYrxn0+eiq2PoD+mCFk9RYFkwu2rsS3V8jZwSEw8+QTN?=
 =?us-ascii?Q?130aEhW8uNNdY/LPhATG0g6erMJAG8IYgpf2g4ON8NIL+etMTRT/w837FHLi?=
 =?us-ascii?Q?/30AUflqQaoFDi46hCN+QzjhPMdgoci7G8fMu2z/w1FC0ao24O3muJFknmwT?=
 =?us-ascii?Q?bBIJyf+vLU1At0NBz5kKsvo1zMB/OTLT2Cx8OWZWee9Ug1kbk811hut7XDY0?=
 =?us-ascii?Q?2pcW6K384XuD87qO9skG0yVgowa7YmQbYP/6F761yNAXHKHAmvjoMpkeOVJl?=
 =?us-ascii?Q?dHZThDXFh2E9ax9aOk5UVwYtyKWd6tm66WV0aGPKFNcWpKJ1VdxBwywJdFhU?=
 =?us-ascii?Q?a21KGuJKx3tlkehLDI7if8iGZaRUu2o1Uo7pcRnPfHC0IpPKUIdvnN+dVIP2?=
 =?us-ascii?Q?AkpncOTujtu+a+ufV3sCl/PEU39EQJKoG+wlhjHflFiZNdk+NIgdi0jDAFVU?=
 =?us-ascii?Q?bYhDcUVGH3gyjtNY49865HWOtozseHuEOjnV2kQZA9Kffw9p4ckX0H/MutLi?=
 =?us-ascii?Q?y7b8CZDgNhgylm6xTCxih8tfrzmKepESue6YyGbN3XgYnvZLzScXf6ZWwIoD?=
 =?us-ascii?Q?LwZixqHKe/vTCOwQGcrum3nGfguIyNSmZHB3oVegYAYqCgVMXhXoMnU4oCdE?=
 =?us-ascii?Q?cjfH+N2r32MgDvksk535aMkYnvs9lNEQ1Rc/Dyrlrr6uAeTBCfQWGyd4wTsl?=
 =?us-ascii?Q?MSjtigy9Xhl2odkK365+IqRwRrPwHbvacizGkYALYro8uyyH3TMv5otauBHb?=
 =?us-ascii?Q?5NiRlZbgZ0Mt0j2cFEt4BTZjQhKKhteUKPNdNpnswg488P2ku+ZQoBFRbK0O?=
 =?us-ascii?Q?vwFtq4U9hTjTV4fSC1X4vcj3FS9cRF04XaEGiPU/Jg0nST5nivOu040x0qB9?=
 =?us-ascii?Q?VekgE9Z+b7O62p/KARXWf8/+kL5j/ST8/Bz/CXe3QJqGOueIwPihpmMR2QSi?=
 =?us-ascii?Q?opwLqOKIkB9fJuCsOQ3TNw4n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a704f9-956f-4e97-75f1-08d929f4cb79
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 20:42:41.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+GvFoiuZbUoMFsLuLEQ0+Kdkyc+pS+JnNZ/3ibJAOxKmxVQRXEBkVCH9Kz7SFKdEieKP8YxuyBdvTlr2uw9jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
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

