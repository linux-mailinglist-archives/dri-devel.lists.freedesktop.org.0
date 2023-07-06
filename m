Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A8B74967C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 09:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9312A10E44F;
	Thu,  6 Jul 2023 07:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112DD10E446;
 Thu,  6 Jul 2023 07:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foaKSCNzd8AMVD1Lj84p5x/sjOQMxU9jWsIEMP+ayiBzA65LIk9US6pkO8vFRUKedBsKkBm9V8wTznsvMIM4cWE+Ws4CrWg19uUO8isvXiA6+z4B1YG+eDPPPZ7NldZsLAFDOPdUWlh8ufRt+d0Ny5vpV1ocd4xkyf/K8eL5efqhFvK7fKGyY5LSXvlrOfUSdNH5pLgP1SMRogWYmtkD8pbHmRhNvEBtRhogJQ3kyHGv5ImuwLP6onXjIasq1F/k5980DAK6kRb0dQ54m29vDPT/UaJBioUXWt49BVrRSmG2zb/bdRWcZIjfWQcTjOlg9PESnM7/pZ9JK0l5IIIilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkEieuObEcdF7JwrsqM1GI+VytgKbTEom9/HS8tWEvA=;
 b=Gd2rxcfNkJh44dRp3v68+ImptP/isWUor7vLswagx+0hNM8qwSThSJRo/vxzVvr595aupeNwOzY/c3N7NzUUTHcWLtb37TagTJFrcjv4iNyTUvPpoIEkitApQscfDuAtkypfd51piuEm97Tdqc85WOslrY2YvaKhrRT5Pecr6IshvDrxVyX2bYE1IKVarJ+KIx5wWf4roMXyTmuxvM/7Y4WVph3VoYyrEZwzmg2Fep2qIG79S1tFLOUwlDkoO0H6caON2Mp08/8/VjohE2c+PjGLBGZBJoGZqP0gQEDWaSwUEAvuZod4LnUec8br93J5VMRarhjEMY4LBeCuy+6jKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkEieuObEcdF7JwrsqM1GI+VytgKbTEom9/HS8tWEvA=;
 b=Zak6UE2dJXO4U8IB8cU+kRxoUGJnNjfKIYt0cY+CFcbq8sGdAu1LT51spinoYDcREoe+wII3wUTTCtnGRZmXtFeInEP2OJZG8Rq5NpuifsQLN/vM3rXlLwLwkq5cLURsam6OUZsXdS105aoS88frP3LrrM8o/USn/fwQqduJRbvIW7LYBKVzcfkegHRlgSIL8uRa5WNlW3XmWGKt6FOWVXCjpB8dk3J/SUYcubpBGmNWKk9ozzF9sL2V+esBTkn8nf7giDtdebLmm4KHybMYWFvrHpCg4cLHy2gktx38qctMYu1nXscO+UJcZdTWX99oPiiVnGT2JvkZLPrO+lzwgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5706.apcprd06.prod.outlook.com (2603:1096:400:272::6)
 by TYUPR06MB5948.apcprd06.prod.outlook.com (2603:1096:400:353::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 07:29:38 +0000
Received: from TY0PR06MB5706.apcprd06.prod.outlook.com
 ([fe80::d6ff:1295:38d7:a019]) by TY0PR06MB5706.apcprd06.prod.outlook.com
 ([fe80::d6ff:1295:38d7:a019%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 07:29:38 +0000
From: Zehao Zhang <zhangzehao@vivo.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, zhangzehao@vivo.com, luciano.coelho@intel.com
Subject: [PATCH v2] drm/i915/gt: Convert to use time_before macro
Date: Thu,  6 Jul 2023 15:29:24 +0800
Message-Id: <20230706072924.2562-1-zhangzehao@vivo.com>
X-Mailer: git-send-email 2.32.0.windows.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To TY0PR06MB5706.apcprd06.prod.outlook.com
 (2603:1096:400:272::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5706:EE_|TYUPR06MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f4cc27-653b-4a78-ebd8-08db7df2c148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W/iD42L3WutYgYE/1OTp5Lzk6SYF8mzHsuHxOFWVpPojeiq94ZEHu8sCavfUu2fqoNz2AUyqO2Mz/VxbyiOxb3i67yw2QLjp6pU4TLQ48ut5l85PHeV3Ac+0QAISgb9dCqqUgqATTKwOrrtcn16Uw4aKdVdlqC2qjx4k/aUO3Ld1xrzFTH3pHidRW+1yvbBFQW2OxmZ6kAnhvINp2ColP6ubwhcJS9UXwQMqvgaSl6Ux29QU4KaS5AR0u2LeNELFpznh2G7jogcuPfxbiZ80qrQo79i1FaIcODt8e4rBFYs0rY4ebnYiSpX0mnIIhZ2y9qXV0MkFWbRkq7V1TZRQijbIyp0x8GE3ikIRssIqvvakHPegTiOJ+fsRQ65juhC0UbipVUzrhA7fD4e9iKWk5cBmRHmZ8EbfvZgTodt7IzpgQ3LAMrT/eVxMTd1qzw/8gKHdTTmvUeoyR92fBV1uBAAGsGhS5d6QwA+MuFTwg4ssizBr7zm9ql8ODtng5I8IZTp19pziBMRarhY4fMn1lPyhd62nrIWNuhSMPMSH/+w2in6rvPFQACa6tkJES0yl7g0lzm/fECUA3JB7pjVrjZZoY6X7M9kZNvAx4ZP6tfOzzT/UykemqO4vXqUrADPo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5706.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199021)(7416002)(316002)(66946007)(4326008)(66476007)(36756003)(478600001)(66556008)(2906002)(8676002)(8936002)(5660300002)(83380400001)(41300700001)(86362001)(6512007)(6666004)(38350700002)(52116002)(4744005)(6486002)(38100700002)(186003)(26005)(1076003)(6506007)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?75Zuy3I9JKP2HUAakHYk8X3xnJr8r3wATtMYBaM7+o+Z37JtsCrfGzzdRnWu?=
 =?us-ascii?Q?WNBJ58lEK5DNxoNd1ZlFtQF58xwy1gbIpdEs55w1OJdAto5Q5cIMnun47nnV?=
 =?us-ascii?Q?NqCwdRMedWmnZv8K/1729w32uY3jS1p6QiHpntwYZ1gN5v+K771AFl6Oo5w1?=
 =?us-ascii?Q?FE9/rFxOY8ElrYgsWxzBYAj2RKz1PlPDZC20MdI9rVCzWtUdOFimO5MPZr05?=
 =?us-ascii?Q?yQvn5LGSF9yOn0zQS3goSjHZ7crAcnw6tLgq9UAo4C3LdQdrAB6aFh6Jo5pB?=
 =?us-ascii?Q?VVx3CvKK3s1RLi0q3GPD0oOs7UHA8H6JG6Pt+3Kd0TTZ7JfxV9oFjkGp3pik?=
 =?us-ascii?Q?CVa2tkNxKIiOPlkycxqkpDEqtAqXfA0cxN+oIiIVzgy2KDwjfxOkdyNQYsgE?=
 =?us-ascii?Q?oKLJouTSGtN1c+aH2wz8v+UfQVeQjoK8NLa2riWD62w4ViNN/b4y/AZiCLtZ?=
 =?us-ascii?Q?v99CNIeWwTKFhQjBuHE9SGsTLv2EyuBWEXzP71aJMTlicfrCsERUOq9Fw/qc?=
 =?us-ascii?Q?aSZwyazMpw6Ymamhnsy86W+iEMNi9VpQMClKB6g+qw/lALqBHPnqBQ0fwKdE?=
 =?us-ascii?Q?gU/uiZROdJaCCODDBnMvhHtz6qknCtKCk9RjI0yZ8rLHkGGE1CDC0q7u9sms?=
 =?us-ascii?Q?zykpbUOS8jYPPpaJ/5igH/zlZomd8mDcnHTRJFM3LGAFMyXpaHvjSVI7edkT?=
 =?us-ascii?Q?zR0URNk9qhfTqQH0EaeOrIQWJCJk91ezXlVocmcRxiR+xP7wiK2HVQ9nJlWg?=
 =?us-ascii?Q?rqSKODj/i14gmxdg54ux49N9JK/2Ld1VTofi7a8f41K90swP2+psZ6xS0opg?=
 =?us-ascii?Q?sC8bMmduaw26grt6rIuopoopyW4NHTaP47tUDm7SMONwLXjnHg1O4nQmDC8G?=
 =?us-ascii?Q?AmXerq+TH6DpKR+In9aINab09CzgeXMi6lwDRbp1Dyuzf84WoHdCavCOHX5E?=
 =?us-ascii?Q?dY+zpQQWcn+5C9fbozjUYFHzK3QZYvZvYC3TtOJGKmUihkvGzzJwvoOUSH6J?=
 =?us-ascii?Q?i5ziZJMgT8/GBuuqjlg9mYx5w4HeafQB1T9Itz7PplTsY9StH22Pw/XtARK4?=
 =?us-ascii?Q?j9YlPTjlSHmCLrqe6U1qR/qwt+gnuM6RWsT/0AvfUXdSfiuzoMJhjYJ8A+YB?=
 =?us-ascii?Q?+jwg6d5VQmO8hL0pkVGZAiGtcaLb9DmOeFCoAaWwA2UItZUVULqSWlkJGgSM?=
 =?us-ascii?Q?FHQhSx3YSSz7ZWN0VU5H6uodrHIXCZAQ+ApJeCvRaiXxvzNM5liBL7V3T+tM?=
 =?us-ascii?Q?UiD3KH5YYS8avGXht8ltFiNQCEifPhl+IFZJCHigqbPaXlW41C0egF7sBmB+?=
 =?us-ascii?Q?MpavH6vnjQnjfoP2gpZ8tcRt2ttSVSxTEN8/Ks8Kbba5PL/ORb/xJPOg+Xrn?=
 =?us-ascii?Q?7NKRWPQY5DdEfYAtNPia+M/PO1TlSyzOY5U/l6p3We6eGaduLRBe/96iphv3?=
 =?us-ascii?Q?p8M8y7QNTglrGcwZYAQ78ImwrnVls7FwB5kInkAGZUAwoI2PDK0lnJOx1Wd2?=
 =?us-ascii?Q?06bTvGRqezCj2zk5c0hexST0I2157HNOB+2VWAXu4A1t2PratjpJ//U+my4d?=
 =?us-ascii?Q?lpoNLxYVhrf5VpBP5Vf/SZtB/WUHMQmF3jnfln8r?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f4cc27-653b-4a78-ebd8-08db7df2c148
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5706.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:29:38.3205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOoG2GOyflToXB/GSv5r51X7kcKXv8KA3eYN0FtGFXDL4UMd29T1FUjeWqj/lzrM3wGrr1Y2oFN6X0bhEaHa/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5948
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use time_before macro instead of open it for readability.

Signed-off-by: Zehao Zhang <zhangzehao@vivo.com>
---
v2:
-update subject
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
index 86b5a9ba323d..9145f9e22860 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
@@ -57,7 +57,7 @@ static bool pool_free_older_than(struct intel_gt_buffer_pool *pool, long keep)
 				node = list_entry(pos, typeof(*node), link);
 
 				age = READ_ONCE(node->age);
-				if (!age || jiffies - age < keep)
+				if (!age || time_before(jiffies, age + keep))
 					break;
 
 				/* Check we are the first to claim this node */
-- 
2.35.3

