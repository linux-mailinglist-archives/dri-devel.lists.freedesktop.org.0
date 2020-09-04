Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D212225CF0C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 03:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8619B6E218;
	Fri,  4 Sep 2020 01:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21706E218;
 Fri,  4 Sep 2020 01:22:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaK0aPuJjR87pgKKdKqDDXgAjiAYHEaVS36+siJoQWa2rrVD0ZzcTFQ9hFkB+WA6S6MPYoCEFWbtJ1DKk8n48VYAfxX+kE2Oz4Difc6+PLL7GOf8xDfCrI5SzXsWlL2PsjxCwoLfEStejmiryWooRN7a4usgkAEuyzyTUxYCZ+eUGdhCf2KzFHuv9Ux1cSTYUcY3OETEM5r8+CxImpQGjE2STFC6i63VZ3bA8ko8SW0hRgJBt1rqJpT+fIRyn3E8wEF/8YBjjMgVZ2k9E/k1wSNyk2kEddBSpyBF5WzZwuuLN+BgVjtiie2mnhjJuadH971jcwzvRmC4tRHKoz0iQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYC1rWmi/Rz9Q/Yn7NN7xFgPrD9Qj+OQCaFSqgEtU+A=;
 b=dGoaM2MovvQxCj3qa5zGI8UsEQGT6Xf1wNiE1WBIkjcBawu/bLme7cJxUPzK3xC9bDeiOtWN8yfgpELY9+ijbCCsTidxxX2h58Q2Bygfl6ebmb+Akt4qW6ye0EroaJn5ppJ5EL2Itw3d8fVmVe37vhtOPWWxsywJpf+qzdhxjTnd9GAkTIgwE370B0AcSuce5/CGLjdLikABWB0JJCSernXz9P6jDzidS47idX2gVqsMjMCo5BGOpZ9XfmQsAdYHUAtvf0EXwTkyK59BhL0AzNCAbDKiZnFdPz01kH7EcFzw/UYe85nUXlX/nGypC7vNFNuOareCQ0HrdVi0/Vi3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYC1rWmi/Rz9Q/Yn7NN7xFgPrD9Qj+OQCaFSqgEtU+A=;
 b=umPGVwiej+P8WRUFoCpGz5BQ2KWoSaVv+3e2G5yIkeyWBUYavYOzBoO8F2Pq8s5X7vPYMZOB/0DvMijGYSp7EkHn0In3ie1yqRFkzz2shp+7jLMQFaj73NbcjawMhmfYl2DCjtBLR5eNCDgeOcuHCTE3vpeANKEFp9ci8qYHcbw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB1868.namprd12.prod.outlook.com (2603:10b6:3:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 01:22:31 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 01:22:30 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] Convert to using devm_drm_dev_alloc()
Date: Thu,  3 Sep 2020 21:22:17 -0400
Message-Id: <20200904012218.4971-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.394.ge197136389
X-ClientProxiedBy: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Fri, 4 Sep 2020 01:22:30 +0000
X-Mailer: git-send-email 2.28.0.394.ge197136389
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7df43ffa-1f94-4c37-f6eb-08d85070fe0c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1868370D805C901D3A1A4035992D0@DM5PR12MB1868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7bNBlD0e0fyiAVfIDdHZx3p84Ju68a1jy2k8aJl/S9ztBJR6ZMlMdY/M2VxbEsoZcSLjpi5thBo9jf26HAKxZWUToZm1/dCg/vff4u5YPfUHSgXXkwlXrTpCQNpkFYSPDRhVggrQrMIBpx2gEYHIhpvyFSofhZHBRd48e6hH+GVn1vqi9HKcIqL5UNutkw6rwZ7xjxcYpnI4kjGDsP1tavBl94dwvCenOizatgZlYGDbgp7EE/AJBet8ypAQnEtoPX2ybG6j66QDzd4Q9gE0jeRCc0GCqYxgR0WvYlN26kM6BK30EkuZpkNbUZS09daIxYIh7+yWEuePwxKXrzhIFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(54906003)(1076003)(7696005)(52116002)(4744005)(66556008)(16526019)(6486002)(66476007)(6666004)(316002)(5660300002)(186003)(66946007)(36756003)(8676002)(4326008)(83380400001)(8936002)(956004)(478600001)(86362001)(2616005)(44832011)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: bajdAVV1gqb02WN0QH+H5xnqW/p0lho3D/pLQf5JesNgRBWnle+2TLXPJ+eYxdjcpNmhdXYMihvqZTNSr9dYU4iIbO3mT4FDVP4EmDJkKEqx6xVwffBuoXUMFc/xjEjvvM2DBa4ukmRoa5KT/lh0B2Q1uR4WamRu3Z4UBSAnIRVk40JOtToemXIqeoo5apuW7pmlse62tOAe2HAEoFJA0WTCdQbopdWY6yYTDOQ5sJSfZzm+DqKJ81feviT+yeIRC5pmGxrADjUIXw4Dm5/aLsfETifAED/xWkWAT13GKPxTWvKC81XYObLPeXW3pHMphqD720MqlLebFjhFRzulFuabWmOHeNHXLpvhTQlrKOi/E+zJ8r9LrgN4XBwqN4p0b+nSd9ioqqkTpwgcUIDIFHpFFFuIW3GUSbt69hMyWoUYxcc2Vnl06bMj96gshI/hLKeaceQ699Oilk0RcvSn8BqpHORh4/iPcyiHp69Kdhoq6XPb3wQl15/5EBgx+zh8N2jowyYoqIn/7o6m347dKhXN0Icd7Wvmb/xokLI5cnbl0ne8qFE0vehpmVW3RxWD9Zp6Ywtsf8ph4cMk/JCC5vat+ibeIyHabKaGbr2Wf/MXnXh/87HbP1cBHQ6lwSGPkmGuBBEU8pzhFl6c+AoxQg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df43ffa-1f94-4c37-f6eb-08d85070fe0c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 01:22:30.3725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuCGTz1aZX+7huVJ1+uiI8qd2LewsY6y6I/xbLHlgjnFdG0zx7xh42TJhPNs2x2W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1868
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is based on top of Daniel's documentation
patch and it applies cleanly onto amd-staging-drm-next.
I'm also running this live.

Luben Tuikov (1):
  drm/amdgpu: Convert to using devm_drm_dev_alloc()

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.28.0.394.ge197136389

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
