Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F9372012
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 21:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AF16EA00;
	Mon,  3 May 2021 19:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E656EA00
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 19:00:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isy2lPRUXCBMvUGGi9+7EecdcPtm1ShxpE3DTF7TUX9APPUWMOzdZVEVXpkwQxXsdyVAoqKwiRcj54NjIHjaFfprpMBUN2KFIy8Kk95X+0vUxruvMdAYKr+fmUQTVZWqtkQYCkmwkPBtBHFkzHy+Xllvx6FX2KmlNI0sy6IP191xUiFVspcApWtnWNTWMXs9M+Daimv9ivfAcM4c73t3jlRR9ObwNvhdEDD3k1qsO7m4wPWTIyFyXrGP3xBACDdjgu4lgQ1VqNRgddN3MBPMU1dL8kv2yeacO6I9Uh7q/T1qsyI4D0aJ6qy4+Ix2t+tQ42qTDjYkQz225mI0q62Rvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNZQsvt7ghDIE1Mr4NDatgHC47z9kXQRTZic7dSr5B8=;
 b=ezbo1NvFtWeUBCZ5rVInturQ/ADkz2xVSfmBlwMo4/FWdkLjkmctaER85wa3/bRTYAVMhWTNJNXRd50OZ7DNzonJenhnAKJez9FymEMnzASfe76ubnW9exx/WC0CmcM6XUU3EA9XjkjBGJNBd7g/uyZ2oi/cIvyCOKt2QxnHDj7ENndK01yscSxbe2UOBmvGwmxulyAnRa8uzBVZ/l492YK3dCaUcWaxZbj2mwkrzT5ajSm5UvyxNfWYg4nLsnFrElPxSse622GPFPn1g7k61iDtIkLdxJfQ/5slZTjaZosSr/WQxunvQyVL1va+jQ4Wwz4YcSzm5pNiMc4Xsnb4xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNZQsvt7ghDIE1Mr4NDatgHC47z9kXQRTZic7dSr5B8=;
 b=nd6HLT9GNGmf9xTi3LdsD5kF5eiOx4P24KcYQ5XBGXWlx8Qz1CdQcK6wNQz7nb/K6Fa+Mpm3J7g4tLGx+Vtx0MMq40eKRIHgRQfM9VzvwrneKdFc3izLkRt9XhF4UA+52xrQKAsKadLLZvmUhRuBBeUE13TTIrhEdn+xt0KPlBs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB0197.namprd12.prod.outlook.com (2603:10b6:910:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 3 May
 2021 19:00:24 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630%9]) with mapi id 15.20.4087.044; Mon, 3 May 2021
 19:00:24 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/vmwgfx: use ttm_bo_move_null() when there is nothing
 to move
Date: Mon,  3 May 2021 21:00:13 +0200
Message-Id: <20210503190013.91732-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:408:ff::10) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.amd.com (165.204.84.11) by
 BN9PR03CA0245.namprd03.prod.outlook.com (2603:10b6:408:ff::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 19:00:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c500e86-d4a2-43b4-1eaa-08d90e65b500
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0197:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0197BB507EB05ED9D74674068B5B9@CY4PR1201MB0197.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RNb8quHGSBHO3dh0BWinHPPNJEWKYb6u5uWzW7Ev/kyoprxnwRqjRAnXDSRko9Kw0VRpf8KcHscKnJPt6AYIDvybpVrI6i3af69VoCRAUVPrArvB3FqeevavyA9ahFq/MltLRx6kh2W793wTxKsXG8DO6dtonY4gElNY1OFRSQ+SxlGbwjX9nUAe6XwhHnZBMaBzXI4tSNaTuSIDrdTdVqZUUoWfeU1YnL20fVSvAWbb4Nw7bvPc1jKjCcd3qIEeDKVLmDIyUGKEpQqhxKhAW9vqEOlE+Q1DLFSETXY91BkEnNU+3UfYCFZTmemomVUpPGrk04xaXLLOOC0oXnTjTG1d88SL/VEmjFocKLIrLFKexqN/eFd92kuSenkyBv5cux2XDw6WskQW2MX2//VWyB11o7O1WqbU+EsAaY7+GkZ3C3KbyezVIanrR/x3ngl7rKa1l3YcJHUH24hjO95cMo0Cpnbe2LKQf0AEt5rI9ZCJ5B6rL9pLPTQgeA4npbqIDHBXZQxqMkpC7VMV2X28Ls+/pJ1xnJdr1EExO2I7ZFLMcRy/jdj3OZkU4GOAD7zjsDXboBHMQqKP2QS2TPoHEaEVuF73cOFpklFumpoJhtWfgT3hFTo44m7CQa7oyJXE9MwLW7p7grt3BL4hsSQJSl2SrMmYgoU3obok9HRmSDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(5660300002)(4744005)(66946007)(4326008)(6666004)(8676002)(1076003)(316002)(86362001)(956004)(478600001)(52116002)(6486002)(66556008)(66476007)(7696005)(38100700002)(8936002)(38350700002)(44832011)(2616005)(6916009)(36756003)(2906002)(26005)(186003)(16526019)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?p5aKr3Kd7Fc99xTNgrdXxr9reKDlDsPWI7JBjpblp68IgWRPDbqSPxJQHWVM?=
 =?us-ascii?Q?jZww7Ui5A4Vv7AxqDSRtpHglpvOCJw1ziyOhZlqlCKyxTic/VYjV/Pputuqi?=
 =?us-ascii?Q?a98mmI3MST1wgI8061ufz2X6QGjpbKK2lv60tw2iXduXSOSQ7ozoLYSf8O67?=
 =?us-ascii?Q?dIwCcED8SjGzs9fPpRnsb/UpQvQeaOXs2IfhFyx4mnYdYCs/BIyzaGbpqDOK?=
 =?us-ascii?Q?z4zCUCtALwFNJo5L8P2MoYz18NGST06LTgQ7jj024ftu2X0FoMm2m8KadQcZ?=
 =?us-ascii?Q?+KAj3Jf+rqkCshBoWR1XrXgGiQaVUU3Pa3dzDKZGc176cZpsRMVDG8Ia2Jjx?=
 =?us-ascii?Q?UTLKiKf7UWqctDg/31oFPnzhc3tVNHYIaUCKU7vjbpu6aSRZAZIG2rb3nEMf?=
 =?us-ascii?Q?4iUshs+i1djpu6NEM7FQZIdkbZhsZGd71FQt3X4t1T/Ea2FknOS/whqoPZkV?=
 =?us-ascii?Q?ykPb6kl+8koIFJfVVQ2US1LmrbsBfyLWf7SL0xS8phFo2oK+TwXxXrrSSpxx?=
 =?us-ascii?Q?O2YGhv8DW0GjpY/nfLo3EH+RvpwUBgVOM3XEjp75gEawZszxT+PbrW9AxM0g?=
 =?us-ascii?Q?iEavvpfdZ5om+HYRlJOGehW3p/TQqfPUgTEuODkTv0A+K5D12aYYzi2rhbaJ?=
 =?us-ascii?Q?Jx7pe7o9EGeC+Lup3DDbKkW3sW0wNJWXS7sb8Y5kZuxt/k7fKLC4sDhuweiF?=
 =?us-ascii?Q?8Fw4WW18MG6IA1GLMb8b9JqCNWGWMQhdt6xmQR6hi0i0f8/puRMf3gQsLdXV?=
 =?us-ascii?Q?ZuNl9N9X/3mlVnAaiNVqMeSullhFbMhatOOMRdU/GCnuviMO9wV+x7T4KdnT?=
 =?us-ascii?Q?rv0fy8Zq+jpstK+FMF6xqbnJlgb6v8wWhSSBLjymDOUvomZ6vQfNdgbnPq57?=
 =?us-ascii?Q?qHteywQ07LfqvphVOY0bp7yHdg1KomyUJaXdMdPd3O8P7gyY5AJL7hpZo4aG?=
 =?us-ascii?Q?dSnxMGjJ0emF4P1XonbhkgZmua7yyGBN7Oq+CwOWWGV40ByYbGTgl7irMbkE?=
 =?us-ascii?Q?An9NNaXFj6KxH77MMLMRdCVrh4M9wHkVJgYglLPjdFJSWqwWi2DgOCXLX3As?=
 =?us-ascii?Q?OWd6oJ2pekhCohlFwNoGVS6t5CbvT/o5OOpOAzf9cSH1IAX+qEYWkf0mB4zD?=
 =?us-ascii?Q?+vHoijQ33OEh39eo0KVa/msWDxXiXFNWIiWtOyoCBvDXaOVXLz3D8WpKhYCb?=
 =?us-ascii?Q?Bypu2vRGnOJMHxD00aHZvBJvELC7ymgnaV9EBcpxH7eUX36tlYPJLaSyOq4s?=
 =?us-ascii?Q?sMauw2JAiiBEo8U/jtKXyE7ouly6J2otfwvuNkrLWJZJ0yBAsplInxnyMzTd?=
 =?us-ascii?Q?6VvY4/FwVO5tLs6p/EclssUy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c500e86-d4a2-43b4-1eaa-08d90e65b500
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 19:00:24.4563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ey7l6lTCAa9lZWuGeQ0a1zKrgB/6yu46IQGyDeBq6YjeKWV2Afbq3Rdj/OFFNSuejqjOkpGoG//s3dY/Ow7WJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0197
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

Use ttm_bo_move_null() instead of ttm_bo_assign_mem().

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 2dc031fe4a90..beaf42f84f03 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -738,7 +738,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
 
 	if (old_man->use_tt && new_man->use_tt) {
 		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
-			ttm_bo_assign_mem(bo, new_mem);
+			ttm_bo_move_null(bo, new_mem);
 			return 0;
 		}
 		ret = ttm_bo_wait_ctx(bo, ctx);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
