Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669073884CD
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 04:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B316ECC8;
	Wed, 19 May 2021 02:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E823F6ECC2;
 Wed, 19 May 2021 02:29:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMMxE41HGMfUsOBd3gtviS2IWYPZDo10xbiiV3k7zEjXBxHNoJNytjs/tLF89ZDhS+3Lp1zIg9V7tujCCAaXj3kCAAoo5l4uooAsNMSMzQD4UxjGqoYhP/ka0r41ncXFJ0MWahQAlNIAqGngEqvuYro+4BZmIc0moafW/7rxYfYnZyaP4W0OPmw+a76rJFouW2dS1UutXLwc1BrxSkcQ4F5hCsnx75J525HDkSDJ13ONlQ+0gpW5bZuQQrcnCF0Hjbcp9TFhnfyEZ9zhSE8bb3zygwiR/I4ZdFwGObtTDe/tZegFGAFqB0W9s/CamvFUj7F4pqmgHTBcYoktuvueGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LgGqmSV94FJAYv7BGAIWu/q8vTfUTTKY7tuZHKfNtg=;
 b=i1JXQxuMcDW/6pEMx+/y9VYTYxqFtqdwZk9pkG2CjkdXRBJnzxtKw/6gDIa4ZKCDAY2DGEvZrgCVBIZrb63qjrxOlPt4XCGivbZhaxJP46HS/KWFf9OYdM2J5nudtufpplUXdctJJOd+ObH9yuXljMa17c8QrZf5Ty7FSQzWBerKNPiTWf3Ejt/HiPMyIqIZ53JQzXXPJYay5CrNjLLRjHMQzp08I6QucgG1Zc3DgPS/H5CdeWh+B1zXmMlnjIsLXNbYoUyetLJiMf+nMBEqzodm3ZX8unZIcRRc1PogeW9VkNzqW95CHJ1/Xe6z8dY9IIxD90ktYR/V9HkS/8FdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LgGqmSV94FJAYv7BGAIWu/q8vTfUTTKY7tuZHKfNtg=;
 b=U6CTNiPLVRxt6LCsf5uInnTZSRPLd2QvojOCjJYBUuvIDHlUSUNisPo8kZZtMTQ9VjpOYn+CROuPjmgdc9eKiXu4f6s4uYdIykyAkcM63yAWtfOqN+wsazWFnK8FD+ITEBr0jOgoTwgeVGXkpjVYL6O2VLfQKFDiS1Q+YefGJKw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5102.namprd12.prod.outlook.com (2603:10b6:5:391::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Wed, 19 May 2021 02:29:32 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d%5]) with mapi id 15.20.4129.031; Wed, 19 May 2021
 02:29:32 +0000
From: xinhui pan <xinhui.pan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 2/2] drm/ttm: skip swapout when ttm has no backend page.
Date: Wed, 19 May 2021 10:28:52 +0800
Message-Id: <20210519022852.16766-2-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519022852.16766-1-xinhui.pan@amd.com>
References: <20210519022852.16766-1-xinhui.pan@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.134.244]
X-ClientProxiedBy: HKAPR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:203:c8::18) To DM4PR12MB5165.namprd12.prod.outlook.com
 (2603:10b6:5:394::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pp-server-two.amd.com (165.204.134.244) by
 HKAPR03CA0013.apcprd03.prod.outlook.com (2603:1096:203:c8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Wed, 19 May 2021 02:29:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bae3dfc-f594-464f-a530-08d91a6defa6
X-MS-TrafficTypeDiagnostic: DM4PR12MB5102:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5102E4D4B8E2899C991B4594872B9@DM4PR12MB5102.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N+3i9ueyV18wW8+C++bvpC6E7rgQbHDHuO0UGGXc8CgnIbLgqn06/CAGdbo2+M2ygk11JXQ2Tmx69L6b2MrNUNosKVuOsglA4FnwaX7UNowxn8QHfrUDpReRHBn3opDq0+Sl+hcRUZ0IpwCsFOHd52oYhzgAB0RyvGscglga7voguXl86jJX5ID+vFKh3f34CrIBSgCmmKy4IjHZoEhVjlLQHDrKZmWyG+cDuC0SHXxmGZz0nUPdKyo2iaYcsKpvtdJVZ6pdE6XAXiM9D/DXSccMVjxVDq3xX6DLhcoQGp4n1la84YEBzcqKCeb/6mvSl+GjEAsUGXp3GJzvXTX6CYzeSN5bkdZReDuoZwNheZwOa0YwTRFwEwywT5Zu4KyurXggE0PR0U+MY+D8s40Z0PBXqVNRQc15/5jWb5Pwph07tlb//oBdNtpYZZ0MK416jVNxzO/yjX+ynjtzmZViCjj19WEzmb+Mo0UOKBXJaggEwewJ9g2KOMJzx7k9o7pJmkRaEQ9bfJvBIwLqbvDRRXyyA6h4T22k1cLg4o+uMxqjxlV5jHCcNnttiBDa30tdJdSpikeoGn1bjc+4GYt4FaqOBYjReiyFyfvtDYvVZQ4noP++hlu0Jelhi8VTaG2nriodsl8MhhdIfVZllRG5HfMesiK38mOZhghRqNIesqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(36756003)(26005)(8936002)(5660300002)(956004)(2616005)(4326008)(316002)(38350700002)(38100700002)(7696005)(52116002)(6916009)(6486002)(478600001)(66946007)(66476007)(66556008)(4744005)(1076003)(86362001)(16526019)(2906002)(186003)(8676002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?J0RcvSek1oPu904LS34Nd1mY5zjz+bwS38lHDT4DLtrxKlDUExZ2CNYrV1it?=
 =?us-ascii?Q?PvBxT3Q49rst/cOpfzZLQCOt/3tW0QPZUtJfGuyF5zeT9mJJFw9Xs4DjHxtD?=
 =?us-ascii?Q?uMmKtTo8TR+80xfRi6MCwCeNdbvU38WX8O3JhOfBOVwmFbCXGXZ1eTFk7vbi?=
 =?us-ascii?Q?IfTefVVekSbV5Guyfm3qg00omljuLcOx6H3NjZBcGxEvmZRvojvULUpHOCtZ?=
 =?us-ascii?Q?NEqmZfWsMgKR3v3o4JaYtylWcdfz5TR0bpYHL7dOO8fOs5iOp80w8R8E6MLx?=
 =?us-ascii?Q?kiw4H+Tf+rrmOVTkAlDEKL28/blcdPsDLAy59fK6LLdOaYQxIjvBb65k8EzD?=
 =?us-ascii?Q?zUHscn7pgxHoJ4ql2WmkQm1UrvqDG2TCALCj8zNgIHjC/zqK2O9ZCew9+mo0?=
 =?us-ascii?Q?fTfoxGPH6xcX+PeySCHwlvQMUzjEdRqN99JvDLtlaK5A0q815F7Oavtfa9Nt?=
 =?us-ascii?Q?EzaWBA8+PPmlDyVHGto7njONirO2xnPPfS/VWBNpn9NOSy1KoE8MUovY6IlJ?=
 =?us-ascii?Q?raiv0qd4Y6AEZywAFJGtNbR4id+Toqv5URGPaMaiV851dTeeh5rbPEDUtAck?=
 =?us-ascii?Q?mM49AGyEZmEwABQzREqHFfZtDehkxw4DD0MPnT29VmGE+c4vhIyOOeUycYeZ?=
 =?us-ascii?Q?nFFx3xeDaFrrHK8kBaPDOZT85gkaYxNnVGxvaIQ4ZUo4hIDoElF5/qpfOmlI?=
 =?us-ascii?Q?dtEYHykhAKffhbcBHh+ugJynuRFNsqTuqOy6XgbEBQjguDTWMob4MkjIOlc4?=
 =?us-ascii?Q?JUZGvEsXufFO9ROlI9hoDCY3HxwAZigs2mE/7dAcV++s47EkujrtE87Q6uHj?=
 =?us-ascii?Q?jIGj/tfaBTDJq+A/GbvDjucS9COYBjFyxKei83/BVrkZn12HyRKLHYaCBRtE?=
 =?us-ascii?Q?Qj8Gw0/TUL4aVnrsSBCmpinDl5vrXu6uPuvQfQe9qCEf+6TuJPWTuzKfSkPz?=
 =?us-ascii?Q?iF3rT/OMCrH6bTJuKR0mlp3aDuY0V71vSlj1KcUpT2ZdWEsIiGtDL6Kz+LZl?=
 =?us-ascii?Q?G+hdXAAy1W+/mUXUUc53pfPyXdl3BEucQCBSSQj4D5wbXYcopsZQuvMZiPGM?=
 =?us-ascii?Q?jC45lmU1te54eF5b2+70Ord8X2fOF1yF6dcwlOS+ZL8gBLVfrPkgLRBn63UM?=
 =?us-ascii?Q?ras0uN3QZk1BE3WleAbyiiWMXydB8X4e9qJcJhCvQGSzTAkrClDE7AeSmnAX?=
 =?us-ascii?Q?l/B1RI3QvADqP/5q7odhNYzz+eO+ydJo+X9Xqnif67g+dy1cvS02ULHqBxD7?=
 =?us-ascii?Q?cid3+PCecZbh5crhCl3xUToT1Euo4dqYloLtEOsPgctg5tm/m9Z5Hf8p59dq?=
 =?us-ascii?Q?CxxTQtaXpHf4eD75yhHYjKKW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bae3dfc-f594-464f-a530-08d91a6defa6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 02:29:32.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUvXggI+cXDNSKU2fznyvgEJK5D4SGCQH1rkidlg5jLPlLgzOu3rTBcww/U7gIf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5102
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
Cc: Felix.Kuehling@amd.com, xinhui pan <xinhui.pan@amd.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 510e3e001dab..a9772fcc8f9c 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -146,6 +146,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 				uint32_t num_pages;
 
 				if (!bo->ttm ||
+				    !bo->ttm->pages || !bo->ttm->pages[0] ||
 				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
 				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
 					continue;
-- 
2.25.1

