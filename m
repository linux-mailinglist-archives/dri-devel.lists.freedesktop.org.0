Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA62749683
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 09:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2C710E457;
	Thu,  6 Jul 2023 07:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2103.outbound.protection.outlook.com [40.107.255.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F188010E42A;
 Thu,  6 Jul 2023 06:46:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtrlTwe8Nx0eN/69QU15GgyW5Ig7zB/LxadIGABkqTTlVrhjornnXVXDuzXhVyxceRY1T5XE/hAGKqKvX0KGCv/E5JZGyqkdjWuDAepPWYBHuhEqSF7jSj09JlufW6W7BD/cTvedd6fq4cU2HPfrAGL1J3GfuZwlw+i5zKqgJ1vo8RkO4fWHGUT1W9m3hUEKOirjmo/NrquUHGxlDMZaqnT9t+Jrznbry0mfHLADUbPw+u+A7BgTDEkRKoM4DFcrOBFpZuXdfIJKNlS4zHtcdgPV10zuVvV9bUpS++MIy0eiepqEyomYphw6k9zaNqfph/jGJ3psjjTOo+5vcA8H2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWH3isqpK2z1sqNAB0zxDQ1hmqaqS80cxXeh+3zhlLk=;
 b=ZjAj4OnHtp/wWccoh4AclSQQopTW5s46qW1MAEFVglGyext0sjsmcBlVPryAHJoWgR/nuxMVfTkrvvFez/tIk8Ji1bICOlmtI/4wYF7XYDIdCChr9GvVhdCkKTtSRUEKUZ8UpqlZHMwL6RsGChMkxVyHy/KsHJ2z64zNosDfog86C09Sa0rFlZxvaPyrtPOVCeCmZYMjXx1yT+mU4LHOT7wFN+g4aYBciTCbjwHsCOk6FjbuLAPEgm5sIAbRmPZMz0HFOltHKH1nsFRDAGbPahBtcV3JxpBx9cFVcsY9MXPTW8S11AL9EqHidQsqzIUoZRhtUVOxJ3sKfbhkXTN7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWH3isqpK2z1sqNAB0zxDQ1hmqaqS80cxXeh+3zhlLk=;
 b=h5EYFxY99GSzBqT7CZx7OIZIwprK8iMnrC9fxXQnocEbH49reE+azIUypMnd9BCWK/A3Ri/0+Sas2pjQhCOWpE7+a65cUcNZQn8iPs3+Xd6XSZyDlUN7eCC/Z0tHr9EVGFUz1pGBUbp6GW9ZeBL8S46PRoSAcDAV9dx4FK5I84OOW4Yr6fPT7rpXqLKL4frPfiMGzb0YjhxK9TH1cWmt4aUDKoqNZGo6owLBWY6AgezbMz9bHB16yRhaABsAEFNcGN9EgCBESHBTA2qbDHj6904PrL5ofi/UX4hHcmrgZeGyWYPE7N58isH1wFy6WmpBp7Ae/l57Amy/SLmd9b5p6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5706.apcprd06.prod.outlook.com (2603:1096:400:272::6)
 by TYZPR06MB6237.apcprd06.prod.outlook.com (2603:1096:400:33f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 06:46:54 +0000
Received: from TY0PR06MB5706.apcprd06.prod.outlook.com
 ([fe80::d6ff:1295:38d7:a019]) by TY0PR06MB5706.apcprd06.prod.outlook.com
 ([fe80::d6ff:1295:38d7:a019%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 06:46:54 +0000
From: Zehao Zhang <zhangzehao@vivo.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, zhangzehao@vivo.com, luciano.coelho@intel.com
Subject: [PATCH] Covert to use time_before macro
Date: Thu,  6 Jul 2023 14:46:41 +0800
Message-Id: <20230706064641.2296-1-zhangzehao@vivo.com>
X-Mailer: git-send-email 2.32.0.windows.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To TY0PR06MB5706.apcprd06.prod.outlook.com
 (2603:1096:400:272::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5706:EE_|TYZPR06MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 91bb20bf-7b04-4e18-a89b-08db7decc931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cn/BDU1S1MeoH4EdlRG3G+MSagDnTlhix5jXNmN55M06oIRsTfjjkiuM6FIBV8IyRZFxT6npIVo78ubO+WjgU14m5g3v5yzbOiGyCdFUO6vScV4uUQ2PyPGd3zVR+DZVoblbdCZCe9XUSEXOecqiP6psovstVvhQYgV2UWVEPDvkvTE45VfP+ggJlNgqfRwDZX1E8XFYu6Yax4lVu13Er4zcOcrmI1BroPJfX1G+Q35TaKTSN4ZASsP3w7Ne4e5efO5KVyKCSa+5U5pTmXaGt8AxuRvi9LPKoNb2k/RF8wZ8cS+aw4RdSpGJCXBRiAtNTIdqZCF1ZxzjPg1k3sewoqosQ0oZoLIlIKULyS9yaa2HC2PA5eVGnwCKQeYbU0q4twgQ6iIgiB2K01SX1+h9/hungFckQJFWVupD0yCzwRM7BkXXzRRZAwrKVfICG9Hy0DcQRIFADccA2vJddzUmpkURg1wAePbzh1eUGVQwiR+rfK8fEHD86YV0WdOuaFXtfOJHqXSY1HSyGBgZwx7s7vq4EG91qbDUSh1FwX+tQVxH5TLFfXffMoC+I7qpWBhElqy63ZvhhwhvSz5TNmxXY5IIaJThjEF7uPsDnBpwvHmUQ95coqkwUrmI8+3nZjvI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5706.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(26005)(41300700001)(38100700002)(4744005)(6486002)(52116002)(38350700002)(2616005)(83380400001)(1076003)(6506007)(6512007)(6666004)(316002)(36756003)(66476007)(2906002)(4326008)(66556008)(8936002)(8676002)(186003)(86362001)(66946007)(7416002)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?shMPVmUdfudC9avnPpUXzao3QMg+2/Qd/NwHXQUIwvIYrOGvum6oBRtWIpT8?=
 =?us-ascii?Q?VqrE1c9sKBbMHALh3Ud/3LBRZoz+kVvz/Ax9yKd9UNY8EWx3nl8REflgubK4?=
 =?us-ascii?Q?MxNQCsTzHSQsBY7IwNuS12n9cRvwhCik2hacIt78DjX75Jh5NKkKfUaqk7ZF?=
 =?us-ascii?Q?lvVcodcM4fI1eMxJkmpxypjdF0Acjnle0nQOopCXRkgW481FopYD0MApFL7T?=
 =?us-ascii?Q?bWohcBt2EUFHXEJVBLeL2/Ir3jOvFIUE8SHbeJa7FPe5a6W4+B2ozo/ke4Pd?=
 =?us-ascii?Q?J0yu5TT1/55PvCXpiTlTaDw1+u8gqIAjD/Vlk4sUksyTAS8PkVslN82GfXZ/?=
 =?us-ascii?Q?oFBimuiY+5JEZFol+uifAPDAPr0TBptpRiugrOxCBmTKjtpab2arP0WjKtA7?=
 =?us-ascii?Q?H9md3P4DtcmT6sxFoKuTTOPsv6+hAq1i0YkWYPu+3n4pw3+IZCnF8nC+yTcO?=
 =?us-ascii?Q?8uHxho7PmHYhMZETgpD5Yc6bGpaTmgEuQyQs/1Ni+Jmae60a1bfpkDV8du6b?=
 =?us-ascii?Q?FZQUJQ+lOGWldJiXztKUpl3nydONFate9laTMBXg8LcU9JaDrNOWqu5rx3XH?=
 =?us-ascii?Q?YOUeLXs+9Re+559OercdxmJmgd9ZqXgbLhOPRcFdLPrOisebEkqDHiMxOOA/?=
 =?us-ascii?Q?fGWR3sE0m1BEZ7KHCkS9kzkr73nz/OGLtxxyFllvni4rwLLlx7iMhO+RyhoB?=
 =?us-ascii?Q?kRUemadZxOp3+uvtLqeQbH1SOHELKnRbr6riBFS1byrR9VjrR9bX/3zvG/IE?=
 =?us-ascii?Q?L8OvqHMp8ViPu8CN+bj+aB7jqfaYEw7fGDjWbrm0vKPd8phj6QWZWGCVfBSn?=
 =?us-ascii?Q?/vsZS/WCjLMlZzOBSnGJIMcdKgJEPCXNPAiEqt03vEskIEznV+yFmTE0uIHY?=
 =?us-ascii?Q?OLV3IUfacwiLL13xac/mfbq87jfE6QVlt5OJhZfIYZuWo76Qu1uMqur73h6f?=
 =?us-ascii?Q?sEJiOBZpAn8TqbmkqW9rZ+003o9e3BPoJg2nn1BoWTePbknLPdl1I8ZFP7Z4?=
 =?us-ascii?Q?VQ5E7cGR+XwKBbCKHATzJw4JhMm12na03bVgJLmYJjVyTP0NhMPtJhanxCf3?=
 =?us-ascii?Q?3dq5DN/wYGVpnRYF5ZkmIqbSCObCdEzCDb0KXuFl/XbXbGZGU4QLoaNUZ4Pi?=
 =?us-ascii?Q?jJ62H1jqwJ+Bm7ffCU8hxCXOEh8LY2iffP8NzorTk2ZmNzqViplil8CQlp4m?=
 =?us-ascii?Q?i9GXTlJdvgnBDJ2Z0IV6TnfWjNjJSKRq4rETKqmBp61tSZ69zgwlg1PVq4ZR?=
 =?us-ascii?Q?QH4Dl1WxAHeHsJoAsVxZw8ow4oPhAvM7NqmDeL2VF4SpNm+JOYR6CE5WYb3v?=
 =?us-ascii?Q?pLeVla08WAWlVOZsN4QxDlvxEZP+NdHoP8EVsQv4wTx2PGhpyJL12i3rEEUo?=
 =?us-ascii?Q?Vyz9TwQEl0EqYQDhNTZnGZAZXPnFgCzTQKsaV1HFws5lQ/z40KGVHj6O2xkI?=
 =?us-ascii?Q?YNeQuaKh0w5NnhTtBvBN49/ssuNqYEzElFnGOpXS7/v+cEan2OYlRlLtq/1l?=
 =?us-ascii?Q?oK0FcFKsUv8u63rtFMStH401/k7vTgXI/p0HJTBEhKwBkl3FDr6/6aTXRrg+?=
 =?us-ascii?Q?JJRc5t+kOzaHWn8MlFC80gC7Z6OY3w1FN3H/BD4p?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bb20bf-7b04-4e18-a89b-08db7decc931
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5706.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 06:46:54.6092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMArdJS9jaxfPfpz+TiATIBBHFMDobAWolRsk8iSYTrFayM+38I0PQkWQJuzYKxy/e7wz5B/C0QId1DV8EFlEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6237
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

