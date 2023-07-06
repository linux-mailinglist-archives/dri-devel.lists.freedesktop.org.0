Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAE9749678
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 09:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D8910E44D;
	Thu,  6 Jul 2023 07:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2138.outbound.protection.outlook.com [40.107.117.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EA810E445
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 07:29:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMx5zXUgoKocmCmqrUFCE1X1gFDT8qdA3qaIlVkHjdXGZE4MTwyQ/gsLrw4YFmnj4JiSlAX2kEJ2jotVMFffamOXP02VQ02WEU3Ufup/RjWwnPLLJ+N+Qn8QotuH3bMrbJ40OxE9/Oq3s7Hf7+3qJeT1YLNbMBZ2qbAyd4c+KlW7ymh47fJThT6j0evLvuXFkqMJ18XjVyPgcEFMvDZLmXbuO6w25ZB9UbZie3MHXPnG7O9fFMjVQeWvHq53SrqHEAlYqomIyfr4bbokKiK+BqGVF+egJOhuJjPugOko8Kuwlqf2LR8y8OskNreFtVru6BSKqvH3DkOlYuLGFEEjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIArpoztvLmwof0IqHw6DFvFFgtAcQlgNVZCMR8hHkM=;
 b=e5cgeVNVR2h+nuZKei0692+8CX8/FW9pcWkD2EUpjEIKR4LZLQoWMAPDBcClXHm5wP8jpp3BEjZxpT+vGuCMubwaer7qEBV0Aqe6fsC4mUxk+z2HSFZYVSKB0hsbocbIvRWyqZSW34k8+JkJn/RD1rZwDJRdr2UpyW6qTLZjfF8EkHKz1BEOy/b/fMAYR8vyEBYbehnbrTuqlrkq8+UmffPFAYl9hbWw1g1RnJyRmnJ6v0V/es0XLnD7Cfeea5vYN97byONwOezqxFiPr5qLqX03l5UZIQGCPynRIDctZtGHJiNclm/B7VnSgDjd00uexgxHpQ0Hr1GtJdoIULS+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIArpoztvLmwof0IqHw6DFvFFgtAcQlgNVZCMR8hHkM=;
 b=WNFgNZAzwdSSC4H3GlWeQ2fTN80DldwEs7ySRPm6v7ZMRPZQOwScxhrWyIatPJm6IAaEoaIhbSe76qoNkZLHpgTfas4QaHjOIne2OdaNAV/qJg1nbamCv6EurAvI7acPWrmoEgQUE0RQdiKWr5xcgMGiLsb/qPPtWs9REJr+mVgdkIAig3710B/zP/zFJIdK+VO0wnNQsnEhiqZE6E3BHdqUOlRcLb322vBMbPBTgX9pcQ16NSSJGT3kji9ypbyieIyDVLCfhl4vo01U4195m6msrD87xDHeUVrYvwABffxhloT2oB6dEwBOm/4oPYGSOxvNu+BeWzV93sD/OlfKMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 SI2PR06MB4316.apcprd06.prod.outlook.com (2603:1096:4:155::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17; Thu, 6 Jul 2023 07:29:11 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::c2b:41ab:3b14:f920]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::c2b:41ab:3b14:f920%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 07:29:11 +0000
From: Minjie Du <duminjie@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Minjie Du <duminjie@vivo.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] gpu: i915: display: Replace define function
Date: Thu,  6 Jul 2023 15:28:59 +0800
Message-Id: <20230706072902.4845-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To SG2PR06MB5288.apcprd06.prod.outlook.com
 (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|SI2PR06MB4316:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e44b62-9600-44a8-a7d1-08db7df2b11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0EjXvCImAqksnQ6zn7tnhHGcw8E7buh/QRhqY+vkrNB7J6HYiZmA65mg0P72kckwXK5rKlwYauSs5yQ9GHIGz49f5JRJchSNBwUZ4/xIZHvOYur5fZwjfzkDmSIO15YThKN/qP4C7WjvE7Owa9omHbirHC1Df77phAza5wAtyxH1Hwpf3NdMnogjJOLwilVhBywF+QQX8YzqKggMYtfyvTaFnCgkGysgw1Md6bmm8KUu+Y+mVrk9c5v9JVhPdHKHQ/lpAOpWOxjAHIwmKSPP7cM4Cd4j+ikmQ3fHtUX+s/B6srSrYoHWAQlzLDUYTcfEtg9kd03tg+fyWl4PQaWFxLxsw7KkXoZOTDoLOe/f6j65QmjLFkC1Y/F47FEqpUV/jS+HoWsbVfAy/MnNKnmNxCVceF6Oz8OyjA1LK1mBkLkPqQXalpuuIlIJHWUEz+N4GK2WBBiOBCDGFhq9XBaDFLgdINXkKsbnlSx47xCVbPrDC6zUsK1aNAlLUIZ3f989nVUbhRIzzNreH5hssmEzYH8VWgrh3aLiyvOH7pcentPZw6ntvNu8lFl9lOTb5VGvr7NUfxMP8+w3qZH41g/KXW/0fJ8iEI00SbN09kUKF8DfGnCEbs9+lbNhOyBhrGX41Uy8bhewrAEihYtfPAgKPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB5288.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(38100700002)(38350700002)(66556008)(921005)(66476007)(2616005)(316002)(66946007)(5660300002)(8936002)(41300700001)(4326008)(86362001)(8676002)(2906002)(4744005)(6506007)(52116002)(186003)(107886003)(1076003)(6666004)(6486002)(83380400001)(26005)(478600001)(6512007)(36756003)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J+6b7doOBhm5dNSXahmcZ1n6NgFlae+K/a5cPb0zezIcokv8GTu2W33rzh85?=
 =?us-ascii?Q?l/MIXq7gQ0G4gLe+YxAwtqmkqJVCkU6L0wuwdervYjlM3FNLlQnqs/j2Nw8f?=
 =?us-ascii?Q?gsYbO2Fyt+hbi6lrDpWHfKw+EddRnnUJzv6RNPInNVallUfqar+jIRXzxyEf?=
 =?us-ascii?Q?jnKxCKCZQt7sXhtLEfQzQfjNxfsT3AY7Ep7NrXaz4KyEBC/pck59/d3LYNS9?=
 =?us-ascii?Q?1Q+f6SP6Nav3tQ7y1BOvqCLWCAOkSsVbWi6EtiF6M0rnq/gnEuSHqsw3tOGJ?=
 =?us-ascii?Q?DBzD1iGQlbiax2ktRSnHqIdpwa8C/214cBqSkq+WZMd/LuQbtbRd3uXoAyMk?=
 =?us-ascii?Q?HdsOMwiEHSaemlVJjC2mrDY4AUabOawriuLYOfoLKmXd7Y9P2Lhuo5clo+w4?=
 =?us-ascii?Q?X5mX492NsTYmPJ7hB+WR/WjDqxGTvvmURZ3mUR5i9a65dlafvL4foH7WDBov?=
 =?us-ascii?Q?/VgoAgPsNRGPcqkSU3uAG9uo8h/JrM6wr4fZLp4DkMmJJqOIFrJyxDBC+uop?=
 =?us-ascii?Q?udDmxglTOt9uLySgFn0N9DDy+Jb+yWr/pIDjxK7sUFpIxYUHMZ2WQPZwKFyk?=
 =?us-ascii?Q?PfQsOQ/kjKEIOlLPyyGpFkO0OO57R0xadb7Mhyj1y1GBeCTjXMqxeHFxwqcS?=
 =?us-ascii?Q?6GWf1dtxdFN9JtjoDUC/m8/p40wjP+djXlYT7ZUmQuWpZ2p129YFU9Tk3i9O?=
 =?us-ascii?Q?ktwgFfkxSEne3i0pQ4No8gQ/ctwT2q86vcs2m59zFvdclGjszsJ70XiJgkJJ?=
 =?us-ascii?Q?Fx0+zSkX1kO7Qe0YrNzdcds9JmF1IrCA1FAcd1RAZdGD2EpWT3Atw2pevYoD?=
 =?us-ascii?Q?kdvobe+5m6R3tQiTfG4HfuyRUkaWMEytak0RRjuMQDMPOU/ltDVq42AgCLGE?=
 =?us-ascii?Q?j1zWGc4INbu+cA7M8Xy+agQLg818xhJM7gOtYofakYUGyvHGoQun80mxVCiz?=
 =?us-ascii?Q?8KrQb6yxFdP8lHQt8KJ0CMlmwETshf+45vJVgFHduPSiR43ho6uFDdGW0wH6?=
 =?us-ascii?Q?mAC6wuc6uFrSQTpZ9M/ZhbLvE4DxGjP+tVrKVTBxjZFHqo03mlzEsWTlfyEa?=
 =?us-ascii?Q?r5HXlD9Aph5XuSSgU51a0Rk3w/Bj/kCLEs6GDLfDXXtW+iC1pMovhONg5/Cn?=
 =?us-ascii?Q?itq63oiURWkn1FNPiZQNBv6dubNBfmrsm/NWSSbTxBDmvj0GMwwtaQMn9RXA?=
 =?us-ascii?Q?CrZEkRGTq5Wy1qwBXMgfQTOFbDZ96bNJjE/Emmz+rXq873noqqGt0OK9Tqri?=
 =?us-ascii?Q?pUiX1iuOEtHv7LCinUagkI7E4uHQBaoW5BT8SkxRti09dbr5rqjJ1jHPaW6x?=
 =?us-ascii?Q?fsB9I0UerBtpccUM0emwvGAgkOtY9MFIdEDKvX6s8wdX131GlS8v15Hf482K?=
 =?us-ascii?Q?HkPyk3QN3Fy5X1yYeUM+nqcStvkq7nx7WI77d9rirtihvfrqgLnXClsW0+yN?=
 =?us-ascii?Q?VjbE9GBd97wjl4cv1jPX1Nq6O1SD89A/uCUVAxbXidDPwY61VpKyLhRSrYch?=
 =?us-ascii?Q?xtbB09LGiO5zEgE5YBqDdWQfL08cW7DH5RudTx+lW84FuJJCar/HIiJIHFPd?=
 =?us-ascii?Q?aNBXj/yzk+LN71AUoCcoQ9gKj/QS9TH3Py0MwIMm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e44b62-9600-44a8-a7d1-08db7df2b11d
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:29:11.2780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1P9QWRIoJ9QYDAX6P7tovgzNcJiuVzEbT9Gj858p8bhCgvcE/biF33PZCAj1NVl9wBPHSZpPMxY6gpPNPI7Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4316
X-Mailman-Approved-At: Thu, 06 Jul 2023 07:37:10 +0000
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE.

Signed-off-by: Minjie Du <duminjie@vivo.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 56c17283b..822858f3e 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2998,7 +2998,7 @@ i915_edp_psr_debug_get(void *data, u64 *val)
 	return -ENODEV;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(i915_edp_psr_debug_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(i915_edp_psr_debug_fops,
 			i915_edp_psr_debug_get, i915_edp_psr_debug_set,
 			"%llu\n");
 
-- 
2.39.0

