Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB0245067
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 04:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA346EC5C;
	Sat, 15 Aug 2020 02:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8056EC59;
 Sat, 15 Aug 2020 02:49:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7y49Q4wEvbhcKIOt9szy2W/pFlZcwwNuDihFzDuK7a01Umsi3G7CB5hYL/AhNmiA4LfIJOTUXPz4Eu0pxoSSXTx62a2wtbq3THOhn2hE5vrjTcguXMJuM+A2R0N8Ua4acE0vqUwfpcYldlSIIvGjbLWsM8lpmIplzn/SwRlr5RtyB2QJU2WD6hPdaRkA7iCkv4USLlwgTzlASt3kNxAc/SjnMRgWQVz6nxSzL9l3657QJ4NrVuDPikZN0Zye82lraZycR/hZ60dsyeTDFoDdUO7IlBjGeNiQr87O8xy1CBY56fi9l6Z39PnH6t8ShQ0zXkV02NCK02bOBoGyhdLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03aF/ubXZDyNV20zrNvbhhBifBW87semM6y4gdgxGJ8=;
 b=Tw+GjbVpFTD4kDwmKQ3+hyhsyfSrKdEU3MGpELb0kCUpc/JMAlvJfMuCWcXa30A3OexQfSQz40ZSubGe69+VgR6nj2pn0O+51OlrKWKJ/btk0KOt4khjsUD6VMCdEMkbba6Iu2Wdh6hs2p2ttWJ4Lhg3Ip9UEl7fhckOYvcD/0ecI//FBNvekiVzMtxDcsOiZlMqtleOzV9OPUTxN1qTWq3wb3nrn5nf643oMwQuy2tzDuzac97T9q5g24ul0KmvdrmwnrH6nWamF4+VqbSNke2hUYEp8uIKWrVa2hSwThPv90Kk5Kwffb2OSKP/OhvRb+dTIWme1ejjqlLeI2p5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03aF/ubXZDyNV20zrNvbhhBifBW87semM6y4gdgxGJ8=;
 b=U2HsvfCbZ//wFt3cA20ncXOcYFgkEF2hvLI1LbtPHcExqZlxCP/4qkTtb3BR1eEfm6tVQ9qibLysS2oOxCColUgSPYwjeOgRdMAxsAS28Zt9nm4mDrQXglfukXfRsYj0aZNoA3prVkRbcxfXj6LqLsWoUI5XgOffUJUFtaMEnLo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2620.namprd12.prod.outlook.com (2603:10b6:5:42::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Sat, 15 Aug
 2020 02:49:09 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3283.015; Sat, 15 Aug 2020
 02:49:09 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Fixes to drm_sched_priority (v2)
Date: Fri, 14 Aug 2020 22:48:50 -0400
Message-Id: <20200815024852.4355-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.215.g878e727637
X-ClientProxiedBy: YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::49) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Sat, 15 Aug 2020 02:49:08 +0000
X-Mailer: git-send-email 2.28.0.215.g878e727637
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 057eaae9-9902-49c8-62b1-08d840c5c859
X-MS-TrafficTypeDiagnostic: DM6PR12MB2620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2620DFDC1CD532DB6A12AF5C99410@DM6PR12MB2620.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZIGVwg/8ekSHL+VGfwNECjhPyT8vQt262A2q/x1n+BdeVK0xk4vvq3CewW+/dv0FqXtR71rw0qT/s9Oxk2zEF05hfdlbZq9KRRJv7J2taAug0AVF4TCirkFmzH8ppyjRCWCTyKD9bhwVnUzm5Qb9q3mQBfNenl7WQfOH78sVOooDf6MD2ie7jECH22IALvL8Bxyt4oR2bh4wt5Wto1H4u0tLMHLP2tA+yjx6n3Otr4DP3NdcaEQl/r/ZXyUoP+CQ0+qqxfNcAQDN/xCjtREINuBxnECbb3WJzs/cbUEgFgF8kdDo6Yj+396Vt2JEFpWD4oCPZscHywEtwKaDIhYyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(8676002)(2906002)(7696005)(52116002)(66476007)(26005)(8936002)(6486002)(66556008)(66946007)(6666004)(2616005)(83380400001)(54906003)(16526019)(44832011)(5660300002)(4326008)(36756003)(316002)(956004)(86362001)(1076003)(450100002)(186003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aUxM1Dn6VgVWOpAHO76twGJldk5X5BIu2pBFY4IrkwLTs1Q/1P10VcfP7FDJ2RBd8LYysOichukDLvS1v48LozEN6jY2DCChV7SzbfqP31JVuUMFVX8+/qbfprNd6k0p6wyus+Mi3+niKNDphlFqoVS5ZZ8T14586j2ylXpAkjGbOI8K8KDFk+XhfCW0e1f8UFoF+gEADtM5GkQWFLw6c3FQKVA+yxwmxYEVPxVf2gGWOM7z3Yfy0xqWVC3sxUi6SikTUCIwXOzqe4laLSRP0w9XdSRsuOqh+wHzEM3FffwZbq0/16R3ucLQdXcI+VE0xYqwdxEMo4WRzCxuOTf9Jx72R4M5yjaDIKiqPKbmeTFG8ire66cwMYESzjweGNtnw3gjitY3tl5Hc6c39NQSxN4zG61ssBOgcdCdTpOzSypHkSvehO/FgfN+wuibNUOYgjW2kCogVjwG4ptT4a2R6mpTiqjyjdN7WV7V2nT2thhPomKDmSnbFtp1pSrc3HZvPmM0aa/ucITESfy0rQ2tghUBxL+zBjWAT0NSUrAWh6TK7SpGTCRh/1rAk7JixCErqmbZPWIcgeNbwJxGhAyBhzli1EcvzXnto2xIrQ4LMwbXLERuE5u08Vc9nBNW2EXU38jZrB4mOK/eWZwhWvOn4g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057eaae9-9902-49c8-62b1-08d840c5c859
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2020 02:49:09.0109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDXlQD5e+Zr5VXoAgVr8PnbsqD2nvJUug+rETp9NmAroU7lzmUlf4jyp5JkMUHNU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2620
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

Some fixes to enum drm_sched_priority which I'd wanted to do
since last year.

For instance, renaming MAX to COUNT, as usually a maximum value
is a value which is part of the set of values, (e.g. a maxima of
a function), and thus assignable, whereby a count is the size of
a set (the enumeration in this case). It also makes it clearer
when used to define size of arrays.

Removing some redundant naming and perhaps better naming could be
had for PRIORITY_SW and PRIORITY_HW, maybe "moderate" and
"temperate" respectively. However, I've left them as "sw" and
"hw".

Also remove a macro which was used in only a single place.

In the second patch, remove priority INVALID, since it is not a
priority, e.g. a scheduler cannot be assigned and run at priority
"invalid". It seems to be more of a directive, a status, of user
input, and as such has no place in the enumeration of priority
levels.

Something else I'd like to do, is to eliminate priority
enumeration "UNSET", since it is not really a priority level,
but  a directive, instructing the code to "reset the priority
of a context to the initial priority".

At the moment, this functionality is overloaded to this priority
value, and it should be an IOCTL op, as opposed to a priority value.

Tested on my desktop system, which is running a kernel with
this patch applied.

v2: Some reverts; eliminate SW and HW for HIGH, and bring back
    KERNEL--the highest!

Luben Tuikov (2):
  drm/scheduler: Scheduler priority fixes (v2)
  drm/scheduler: Remove priority macro INVALID (v2)

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   |  9 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 40 +++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c    |  4 +--
 include/drm/gpu_scheduler.h               | 13 ++++----
 9 files changed, 49 insertions(+), 28 deletions(-)

-- 
2.28.0.215.g878e727637

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
