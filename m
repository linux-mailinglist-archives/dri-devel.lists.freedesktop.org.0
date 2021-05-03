Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F391C371E8E
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA296E9EE;
	Mon,  3 May 2021 17:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4165A6E9EE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 17:27:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaOQuhmHlw3rFeLrY1X3eY2DZ3yZAMB/o2+yibNmiXNA4G+wYfsjMCOiMyNfAyfYdLKRE0pXQf7fx0SCGNGDReE+F/cvbLlNPKHE5Bf8Up+inSVOdsFcdYPaPucw+8SGu40iE7A7hAqUIiS61OiDtFIhTTV+mzo4qqDYvQCguOe8RhEFItK6wnATjcM02W/Mh9aMOxPfYQN0BfaLLI2X9Brt9PVpdTirnJpJ3kaa7Z6HqGXZz8Rfbhy0YcYn7crpIo+E2j24AXiuMvomsrYlxWA3rZtpNnHwqax4GJ0JLoXEhg60tPWdDl4bDTFC/rf1wp2NDIpyMZY+XNdmIRv3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkO7l9IA80BxXnLnFRBk8jzcLh4ypAnlowDprbWVb4c=;
 b=g6u3bladtmG+OVZC6VRZWel3fdNucspCTVVzyAsMP5nF7olBkoRwcVxMyazo79kiJ977y8PyHTYtGCEG7lEBsH9YT14ZyGlH91n+ayBtmYVddIz95T7NbMEe7VlSWFKgndInKYKZJce0bDBo7YmkjHTsjVbt1s2Xg2A6MYyVYTiJfGSmK+rBMQNJcxvfBdRevd2NIio28TC+bWB/87LXxt+31kTWUiudleX1WBM7fKZtC6tDBZ0t67hl1wcUNfzsAqkYmAJNGLjRTN68T8CyJrskpez9l6i4oB7smYaAE6rL3tL3gO24mNivQ9+TZ0USOP4g2T0hFgL0tsZ6Qmf8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkO7l9IA80BxXnLnFRBk8jzcLh4ypAnlowDprbWVb4c=;
 b=KjdjDGb2hwST4v0Jh++Fxh9ZAfW762elp4Qfr19qo8zG1H00gSmoWFDIpw98n+1fIeRau6jAHXon7gxJihQGod4MalklPno3oNJF/44w2K8fi0CR1qvpX2yEDg7V+Si5cR46v/mDjOoEFnbgFQx5xK5j4qhRcqNk8WxD1gUbewc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR12MB1864.namprd12.prod.outlook.com (2603:10b6:903:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Mon, 3 May
 2021 17:27:04 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630%9]) with mapi id 15.20.4087.044; Mon, 3 May 2021
 17:27:04 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/vmwgfx: free ttm resource before assigning a new one
Date: Mon,  3 May 2021 19:26:41 +0200
Message-Id: <20210503172641.58541-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [217.86.111.59]
X-ClientProxiedBy: AM3PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:207::23)
 To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.111.59) by
 AM3PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:207::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 17:27:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46ab7528-512f-4597-877c-08d90e58aaed
X-MS-TrafficTypeDiagnostic: CY4PR12MB1864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB186454E14941BD95E939AE9B8B5B9@CY4PR12MB1864.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KC9CLnQH5DYw5ZweSV1Y1L0pQghqXPtUNOd7Q7TpcEqNjGc/qqUbSmVlG9dZJBPKE4++fBQSiBHB77MOkujDHg70Rwd1e5CNj4yBnpjgjh/Z8oLuJGbnzHeGX4wilaRbfogGIBb5VyAKlb0fHogDKDTuWToeAsWTr8RklxsrqduyUyzxdZIOqAr1K146XZAHcxk4LaeCvf+SZRCBaeJJot4OZKAa1XpeOD2lCU9vO+raWsrmuXa80hlqBuQTX3DQAG9boJHU8MWLq943EQuzikPxCsH/rgq1UHnIKNDylqzyqGRD3m1XQQhReaaao35Xb4MJHVHK0QvYDwSfI8craOxJZ+E3ju5hCN/DQc2gFWMKmSqcowQqA/SlEgGVYZVI7sDYgoQoGeOnPH/17KfZQOLGfUH8NsXeU/k9ENhD9XLka19LbJLTgMBL4DRt83qqYU2b40GDC2Cgd5VX23Y0JmtpLSsuqgsIrehjeyQXBDkpjnplRRiMR3PqEofnlsxbxAZmQH7Nz1iPOZCK9fpiuwakTWM6epyxlgFvSpybqQ3RqsZQUHHWzmXuDHfOzY4pvnlXr5hrlcZENXeotdl1/LX4ebN4cm0vlmoec1+HBYIC6OmAFRBuBS9qcmfJuq0qtKKMNRlwgtFUGCLaQjAOS9hey8ZI4ZeX67jtu1aeRsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39850400004)(4744005)(26005)(6506007)(956004)(316002)(2906002)(8936002)(44832011)(5660300002)(16526019)(186003)(52116002)(6512007)(4326008)(36756003)(6486002)(66476007)(38100700002)(6666004)(1076003)(66946007)(66556008)(86362001)(8676002)(478600001)(6916009)(38350700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5w7jTSYgKxOSaYG3P1FD4rsq+h1ZZ3xdfQwzObRfICi7IbmqbGJoicY/kH+F?=
 =?us-ascii?Q?BfZtWD8G06GZzL0S58Mv2WE/dZgz+7A0hLuA6oQ2spUMt6K5NK7BUgt/f5ez?=
 =?us-ascii?Q?fMG3gaouV3K06tdSTZxYn5MOWJXpO4JdBVj23/DTZwO0m4UpMqY12tiuM8e/?=
 =?us-ascii?Q?EYHV4KGWbMY79AjPhICtgmZaj9BuIzOC/RPvQHQDrpIOZEENt/8GktLJ6Cdc?=
 =?us-ascii?Q?MvqGnGi4M+oSt6u2vEmur1aOiUCJN9AeSwYvnETD430wap9EraE9CFWTRdyy?=
 =?us-ascii?Q?6j1rpx9mKbXxh1uHxHyjjw1xSAeeDYmSvy3g8EH66NzFcAoEu6Y1hVzAz/q+?=
 =?us-ascii?Q?USAlpSsrc8XgrWHb4FJG5F+WL0/eVSdKJzp8O1Tag0f+zkFsqpwhafFfAUAP?=
 =?us-ascii?Q?TssWULgVnXWisifI8jHstd5/pCURlIDkKgS9GQwVhIDi9bTLYyisjiP56E2P?=
 =?us-ascii?Q?DLVO1n1xZI3EJKsKLGHy24ktbQ1bPswFBnrnPXuNsxZf0rnr9PFWohXjuo+A?=
 =?us-ascii?Q?hudkfvNMTlLRUNeA4+jRZDOeF8C0F3gaesTTKsmqyA8N+8HdDsoAnBvbQ4NF?=
 =?us-ascii?Q?CqMZwH+XJeDMPSvkHWXEbwL1hctU2c2oBbcYpI9XtcSk1PliZJfL3+bc/iWp?=
 =?us-ascii?Q?Q/sk526s37itwKcgidQZ6FaGiL5GoOiJMi7DIPZrVfjW9K4ufTfZNNriseH1?=
 =?us-ascii?Q?i0wlnywja68yYFyInHhVeHaUeRyn/xdMvrXqXP+/5wef0NXMoM9WbRM6oXX5?=
 =?us-ascii?Q?L5LXkVJBh+w+CRt+WdYmFhKR46nPOWBh3lBKLkkkVq752afY4gOLk1KlZM4r?=
 =?us-ascii?Q?vau3ww/VUWpjeg3dBmY8l67E+QJxk9m7FZJlM5Xb4liiFy01HO2s3044JQp/?=
 =?us-ascii?Q?V0+GVfCXkEmzlDJZZHmJuxB+fPOw0GBj+WyLmZ6seVqTL0Z6hjiQFMK31/Rd?=
 =?us-ascii?Q?1zit2CTBcNHlHRdEzxEsmkP8cL4pk5faemwx3qB7ARcOmUwGNvdBDUZ0FzfD?=
 =?us-ascii?Q?tpT8q0PbPWcegTGWoB42yop6h+2s+jl1sAR3r4NzhgSu+BZb8SwCZyxZYa6z?=
 =?us-ascii?Q?g5VLl2VboTBjHYFVE5WvTiE4iAWtm0teoYfapZ0LDJZywdt119GGKLHjolyv?=
 =?us-ascii?Q?Mhjm291VyySebJM0+Ooe63AqcfWRVo/ebp61/ZxK5ui9Au1fICQMZnAHRq2h?=
 =?us-ascii?Q?fjDTRza5tdOqbnnGW2EDe2yn7HowIxANPvr9BlJaKMdp6gGnAyp2QT3b9GXa?=
 =?us-ascii?Q?nWMqUV4HEICs/LP2THxumghQV59p9YbcpWxlL//6/IsuEyDx1C2IcMlJjrZG?=
 =?us-ascii?Q?liEahu3UNk+USk/+TnXxN02g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ab7528-512f-4597-877c-08d90e58aaed
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 17:27:04.0628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysk2yJ1MT6x4oB3vakqAIgzM/McsQAcyqYbDJrLOGPlh5RD2L6XpQmhykvKCxOg8KNB9DnWMyo+i5rBiMsvt9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1864
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
Cc: daniel.vetter@ffwll.ch, Nirmoy Das <nirmoy.das@amd.com>, sroland@vmware.com,
 Christian.Koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM BO resource need to be freed before calling ttm_bo_assign_mem().

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 2dc031fe4a90..93e4cf34a3a3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -738,6 +738,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
 
 	if (old_man->use_tt && new_man->use_tt) {
 		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
+			ttm_resource_free(bo, &bo->mem);
 			ttm_bo_assign_mem(bo, new_mem);
 			return 0;
 		}
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
