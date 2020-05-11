Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380511CD90F
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 13:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E6F6E446;
	Mon, 11 May 2020 11:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692EE6E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs6OjW6hd5GqHN7qC8q0o0/t4M6oFk/4tX1ZFpexjjOIBOY0Ay+nZS7vg9q7RZEm0FIyyJFDfpMZaR+sZUeP1XY0oOdLdn2bpuQH9CbtzndBH3OAAlpiG9n5My3W7dy2CF8a/mmOAE16q7z67KA/EQlSLw+zxGIjT84lS6YDYZcCr7GbHH58uuMqxG9bPBxHEFe8kAddspmcK1E8NzAUmzF/EShGigL/zEmGKuLWWOplRMXJx162KpuLjfSNlN2cnHXbK5r2sJJjqusgeBotns4xszErjMQpEt5bqWytSb0t+RGOwbKLPEM4lSsqYEOzPa5Cmfw9wKgEMLBXKSbhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVM2gluDSkR1MjGCqSk4Gsgw+aRMEnhzDkjhScP4TCk=;
 b=fadG9jlb+lybd6aH37Lnf3MK5OMpBTZKyIVlLRahYblEIr+DfEKe5fI9MenxoKFQESfTpVegMaQE2RESuWx/bLrqjADw6MyPqmRG7SkbncPzs0Ove9/nsEsdw3QKCXACJs0zLKEsTIsKtmLTzultJXHwD7WfUnXMvtQGq4qF/PqA5rk5vyF44MPM5ViS/LU7eCZbvSJHZ7jyyByAXEN5Exkx8cu88D/I9D3cCZbb7SXrqJWJscQIMHORxMBAH6jOi4aqvJbTcN9sYf08JqOjbjYaAh6QQqs9T4h2zRUc/GxduL0uTi9rz/qx3n+nDMSyUkm+MoZmhr4ylV7oSHy+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVM2gluDSkR1MjGCqSk4Gsgw+aRMEnhzDkjhScP4TCk=;
 b=gTN1iBN4wmk/s78U7Nc+DZp5x7kwFHUPojQGr8PFUCMGerbg3kTgscVqhG0WuNKv5cz+OjEkX/mLXwwcsYI4VQ5vBMmxCyj6ndMGSK90zN8fo88N2aOJgsSNoKYwk9MiVNjlP+uogJgsNmCVdZid408Dfh0bolpOKYxzzJJx+YE=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1159.namprd12.prod.outlook.com (2603:10b6:903:36::17)
 by CY4PR12MB1944.namprd12.prod.outlook.com (2603:10b6:903:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Mon, 11 May
 2020 11:55:40 +0000
Received: from CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7]) by CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7%10]) with mapi id 15.20.2979.033; Mon, 11 May
 2020 11:55:40 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Brian Starkey <brian.starkey@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Helen Koike <helen.koike@collabora.com>
Subject: [PATCH V4 0/3] drm/vkms: Introduces writeback support
Date: Mon, 11 May 2020 07:55:21 -0400
Message-Id: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.26.2
X-ClientProxiedBy: YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::13) To CY4PR12MB1159.namprd12.prod.outlook.com
 (2603:10b6:903:36::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56a0:11a1::2) by
 YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28 via Frontend Transport; Mon, 11 May 2020 11:55:39 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [2607:fea8:56a0:11a1::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d85039c-7aa6-47de-f4eb-08d7f5a23a05
X-MS-TrafficTypeDiagnostic: CY4PR12MB1944:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1944E64B28F7CAA67551F6D698A10@CY4PR12MB1944.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJAzY+kitmP+ImE/OCfviNFD3XNA14OfeV1VRI2hP28tefBRFfvEBxAPWWz2cMjUTrL0R4YgTN6MI8bH/YvEhsExnldVDtBEwHuR4Kqf3Go7e26wEpisTE1lH+N95GI/ExZAaIeEzEfi8Sre8To0xHprZ4W6/J+MPdAxZQ7FP2lpqy95jY8QCIKh94kIzAsXIep5Ufac4qTKyjgphkszBazFIaK0D3XVKH4/0/X7hl5cI1Z/7vN3RtrYFCF4OkqZQ4nUm5d8Q7aCcMbQ8b+VbU8Glb1h+cQdwBz2fU+lk2FtmVLqK2DtHvVuwxowiQkgVf1ZUQSPK5n39Z4xVSxbD8QQUUTKsk7ty0VZwU6HWDKT1CTV806vljh0mt4bpjgT2WinN6+GP5ny13l7uqKJqjpaQypU+XzcP9GEL+hvNWdoKR27EySv2CpcmkxZ/FXQcVKFR97P+HdSNv+wO7m6pO/4OAuMDpIFoZD9ym8hOJZ39C1mqVxuto6ktsKSYB3UV+h1Snizh0FJa0xSMujQiP0V3JVo5UGZlY4Kx4OUsIFTFPzmcqKrh9A3AHxwGe+L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1159.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(33430700001)(966005)(36756003)(66946007)(66476007)(86362001)(66556008)(1076003)(6666004)(6506007)(16526019)(52116002)(186003)(316002)(110136005)(2616005)(4326008)(478600001)(6512007)(2906002)(6486002)(5660300002)(33440700001)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /7h6M8L5RhXeUM0anFNXMIf6095JdG6sXSPhIrTVHWMKCsCsPY0sgD+5c1asK3K40bPe2KyfYjpbXO32OKrVOYWityjPZpuT2dswCeWsq5/4HvIwn4XSIHwcyv+a+AH7FR6XmkO5VyEr8jULLAdJGUYSNklxQPtllbglPBrNObGJa0GffDQMPAPQdyj7BLwX49mcMDcFuRbKPzrURGSrnBt9KPI1KgYegRxwJOwDRvVWvYkD3hJXqQjZ38y1etkpw1RCizfzJkpsb7jKIFodRnVlmP+utjhqbn9urLcHW1WxMOSl2m0N69lCQDOC/uXW/t5bncMZC9jMS2gp+dYHNnJQb5gFApwXptRFI620ONwwuujRV4XIwVp/xTYQu9oPU2sEt03MkOIakOyTJ//qIOmxDfQsppmmbpin5AP29w/eZ+aAUCtkqKA3CTEjbPgxZ/sJIN82NlEIQeVdhEc6FfAc2efTuw5lu7BOEGhH2ihzi7WEDaXZLup0Cscuf4jMWRUfFiTIV99Cj23PXzIzzw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d85039c-7aa6-47de-f4eb-08d7f5a23a05
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 11:55:40.6129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqqRGWaIJVkzJaH7yCXbkfa4dPMPRFyZhXfRMjSyi6W/NPFo1jBzcO4l5AeibrD4xUY9JhgB/cdmm/WcV6reng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1944
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the V4 version of a series that introduces basic writeback
support to VKMS. This patchset starts with a pre-work that aims to make
VKMS composer operations ready for getting the writeback support; it has
updates on the CRC functions and reworks a small part of the VKMS
framebuffer operations. Finally, the latest patch introduces the
writeback support in VKMS.

The previous series was reviewed and tested, this patchset only rebases
the code on the latest version of drm-misc-next (I also tested it). It
is important to highlight, that we have an IGT test for validating
writeback feature as can be seen at:

IGT writeback tests: https://patchwork.freedesktop.org/series/68352/

Best Regards

Rodrigo Siqueira (3):
  drm/vkms: Decouple crc operations from composer
  drm/vkms: Compute CRC without change input data
  drm/vkms: Add support for writeback

 drivers/gpu/drm/vkms/Makefile         |   9 +-
 drivers/gpu/drm/vkms/vkms_composer.c  |  94 +++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.c       |   4 +
 drivers/gpu/drm/vkms/vkms_drv.h       |   8 ++
 drivers/gpu/drm/vkms/vkms_output.c    |  10 ++
 drivers/gpu/drm/vkms/vkms_writeback.c | 142 ++++++++++++++++++++++++++
 6 files changed, 233 insertions(+), 34 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_writeback.c

-- 
2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
