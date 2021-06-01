Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925FB397B0B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8026E0B6;
	Tue,  1 Jun 2021 20:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27496E047;
 Tue,  1 Jun 2021 20:17:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rb58OkucjsaHnYYpQwGfUehGTNzswbOq8DTM7zjwuWolh/ZtKVpFAqAOHKWapst5II/XBqtwSJx9ni7byXitGMz1wgV6PE5PnGUqKc9wsPeMH7pru/Eaf9QGRr8gJbz/qryIfWvjPW3x3SjE4ASpLY6KJsp3JuVhy9v9dl2Ro0GC2+gtHZlxSscpA9bClEAug91UBw/3X8NjQomwEyEUdVpKAOmlvd9lHNWO6TyK8ld16FNpikQwAeBSe95KNAjcWxWyZcOC3ogzZOkQ0OEKSU9kEQV2rqO7hyEO3EZJtqfs7OhIywSLdqSMLzg0Vs9HaXN9WwCSIrFMNZ9bw0LMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jA80MuY8Zbhhd8oApgQyfJdkbuzObrwD6LK/+Mp2CiA=;
 b=O3J9CCGWMR58DTeIkR/ZkYsm12+Jd1iInysSMBLKB5IW2AME9CeJGLwk7kfpXKwKz7+Vrg88to7EqOGbtnjm8KHSKXwtJdSLdPjMHpi8I77f7f9ljtkaRY45ISfmsDOtV6newSQorF0CFSbpVhiF+BI+ti+Qt+Bsr6bghnB9SUtpSrMXxW/jV8mbiA70oiHip22dcmjJAQFpRslajEIN5SHwhyYTgSsPHOlw2JQBGvM85ZFf8IX3cLHiSQO1/OO6MTe7QUYaGDjGizGbNa6Tx8GHuLE/DrSmCUIXy2QJs5T8UQ0CC7H5g3O8TdCt546kkjZ043yAnYr3S2nVfv9C/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jA80MuY8Zbhhd8oApgQyfJdkbuzObrwD6LK/+Mp2CiA=;
 b=27Cvx/deJDnn2zSHo8mj1WRCxs+QaWFaBij51fQtMEInB/V++2Wn2eFv2hbYdOnaNKcdSUQ0kMvj/DSNLPGukkXnUT+YKh9H+ezeRAwJjvrbB+86+xLktTuCP5GYa4WYmhFf9k9I/rxHK97iMjhX6qQ1TJVaxX6HBYc02AXd1gg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 20:17:17 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 20:17:17 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] libdrm tests for hot-unplug feature
Date: Tue,  1 Jun 2021 16:16:55 -0400
Message-Id: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:5b64:13a3:c94c:964b]
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:5b64:13a3:c94c:964b) by
 YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24 via Frontend
 Transport; Tue, 1 Jun 2021 20:17:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 644ce4bf-aee5-4a43-fd42-08d9253a40bc
X-MS-TrafficTypeDiagnostic: SN6PR12MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2702C94B5EBEB48F4D1654A4EA3E9@SN6PR12MB2702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rohUzeCEGBgbsAxSBS9hnbUYuI/7kt8onkXD/i8Ggg89h3uaYnhmM1beCWT9vLmlPbg+cZuFjzp59mEn2lpVAsUl9bapHQvth+VCmjur2938BkjlLQRi0Ff9bxDr1l0dA0D2LryvN/zCG+iFX3RS/OHcCqkMenT13/ip7s2Z7OCts0MD2E4VY0LVydjagZVga7FACCpgWj36i8hk+rMzM+zJjIXFU+jrq+LZNeFOpw9Ms6SxHITmXfAuOP2lIOeYHHhRK54Q6o30O//GkuFoYvI+6+e7IwmBB11KNba9szIm09CZglfWZOIxyYypXd9ZDubb6YK/ZgCrHp26wjgPRekMeVDUMYZFBVni700ppFz74AgaK3VcKcc+ctyuejykwsAs/j+c+kcy81ojnD8jGh9fUc5h0MmMzMLhVm1M4X8wxpojpGEjndpVXRcnQFMQEgWbYw9w+OOBqm6gZGXtu6mvVPfOy8UGU5T9cdPmxg2UkiVFeW1a+TLPaY+srgXSIHgaCSXUAyGNhuMYsJ9kTGDMAzHQ+k5E+xom03e7+aWFF4YrEMLsSAr7jkrUcF+PyBiHUF9tYWoMnQ99BPnE/4FIydF8MTLqyMgHx3IlGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(16526019)(6506007)(2616005)(38100700002)(1076003)(6512007)(5660300002)(83380400001)(52116002)(478600001)(186003)(6486002)(316002)(66946007)(8936002)(8676002)(2906002)(66556008)(66476007)(4744005)(6666004)(86362001)(44832011)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lwgYBnuO32/Nq+5kf8/1ZhaOo1UsG7DFxqJ4c0Rxmmydvg/ckXjPMdawGKTd?=
 =?us-ascii?Q?VhrKC8WAHY1B8NYdtVyTHSJoJl7613CuYVM036oIWB4QNTj7eCqYkvuREaAw?=
 =?us-ascii?Q?4s8/NOVHyr2biHYEuTTREmW5TdswHNwppFSCZZfVwrmM3emLRwwYR9xgmVDe?=
 =?us-ascii?Q?bPSy5egJVzPHNZb4JvSFUQk7qCIguFnA05XwKZtCEB5GFj1MAAYj2t6UurNN?=
 =?us-ascii?Q?xTWcyjRhyN3CMU30psywEtVx5x2lkfiWx2gNbDXDOQocngUSyez6q7LYWDmj?=
 =?us-ascii?Q?/HJQ3usMeek3+nuwfWLYUa6I09lpHUB3BB7rOJ5lkwhHO0tr0snjyhNFMUHP?=
 =?us-ascii?Q?qEFYVaBRvOFrIBpC0RGOFPexnyBCmHn2mNYTekY0LrtiM3Y7hdANKBXEqAUt?=
 =?us-ascii?Q?kMchEb7J11Gd3wImhKSFL6t4y+6SYBFope5/WJzg7SRYXi9piqS2dqp09hR8?=
 =?us-ascii?Q?rl4mWYB+3lOuERmDke1KadgAoCE4Jv6vWUnyDAkrDwTGdPsl42Ejc14alOIK?=
 =?us-ascii?Q?dBYHs/zLmUTbD1mqmSV9HU0c5mneQxOKbAimuhP4Jm8fXQ0u0+fGMUUArAmU?=
 =?us-ascii?Q?VSvMWN0G1uAgvZS+OUTuG73gjcajug7PClmu+PmVjxcH10LEksN+JBUSk1DL?=
 =?us-ascii?Q?B0bwcEmKwJvpTQtqQET6m+sqyeDH9GjOslW72baEfyQyXz4lG8bTFLJ0zj71?=
 =?us-ascii?Q?py+dRU2yfLLILNTgoswAtn2TNiBTBIn7KJ2cyp8mJKUW6966mxS2dIcNnnyk?=
 =?us-ascii?Q?WPHigrpqOZZE2rXQa3tOlJw5BTR6l902U4UIWLlueUTac1a9OtJUdK7DYC/U?=
 =?us-ascii?Q?/wWKxpB/NkNsiviDfA4GGHTleSfXPPEunnm6nQWK6b8fuRQdqhBMF1muXvqu?=
 =?us-ascii?Q?sKrpi53ko8w/H6XRxs3KjU7hsxjBRTF2EhKd0xJ9vSIhe+RK2QEIgywqQFCS?=
 =?us-ascii?Q?+wVG+0gjv0qmXWVSNc3+JBk22KtGFU4KKDjUG0OombAKB/4LvwoZaf20+rN9?=
 =?us-ascii?Q?1r8pgw9rlSEFqrZwW2GZ9R4nbLlusgR9eBamp8FWRNfLjVHz9IfNNSqrMpgN?=
 =?us-ascii?Q?RcDtF4YBTWH6DQ73ElDWWqLzJZWNcLg1lT0U+7sZ+njKwQ1LcpgdUorZNS9W?=
 =?us-ascii?Q?nf821lz35Zqwx5t/zWmhSiyFJr2DOAPaQI06bk/Jabq9Z5AgxSjL3qr4bX+M?=
 =?us-ascii?Q?HjuLl+mKXfMXARTanhgM+BmZrZw1ptr6KvGvyedZ5pMi1rt0bnIy+GCqFvVH?=
 =?us-ascii?Q?RGA/DjlAgHGY8pGfU1YK/2l4p7L94xNBhesr1HEuKoFU2bzPKCqiRSDfTH01?=
 =?us-ascii?Q?IyyvLt+zZJAbnqSyXhHF6rJxam970wgYYCmV8Pf19iohmMzXCjaIpmyMcPM/?=
 =?us-ascii?Q?cLuA7wA852zTaSE2xonKEqf91wta?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644ce4bf-aee5-4a43-fd42-08d9253a40bc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 20:17:17.8751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsR6RHmw2GlFcZwVNsjhTna0xuct7hnVaJFr3mYutwGJ6oQZJ46KNLstbf8Gm7+v5m48UOzb5Hk/FVqHv6bJsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2702
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
Cc: Alexander.Deucher@amd.com, ckoenig.leichtzumerken@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding some tests to acompany the recently added hot-unplug
feature. For now the test suite is disabled until the feature
propagates from drm-misc-next to drm-next.

Andrey Grodzovsky (7):
  tests/amdgpu: Fix valgrind warning
  xf86drm: Add function to retrieve char device path
  test/amdgpu: Add helper functions for hot unplug
  test/amdgpu/hotunplug: Add test suite for GPU unplug
  test/amdgpu/hotunplug: Add basic test
  tests/amdgpu/hotunplug: Add unplug with cs test.
  tests/amdgpu/hotunplug: Add hotunplug with exported bo test

 tests/amdgpu/amdgpu_test.c     |  42 +++-
 tests/amdgpu/amdgpu_test.h     |  26 +++
 tests/amdgpu/basic_tests.c     |   5 +-
 tests/amdgpu/hotunplug_tests.c | 357 +++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build       |   1 +
 xf86drm.c                      |  23 +++
 xf86drm.h                      |   1 +
 7 files changed, 450 insertions(+), 5 deletions(-)
 create mode 100644 tests/amdgpu/hotunplug_tests.c

-- 
2.25.1

