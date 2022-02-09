Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794394AECAB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD2510E3C2;
	Wed,  9 Feb 2022 08:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2091.outbound.protection.outlook.com [40.107.215.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10D810E3C2;
 Wed,  9 Feb 2022 08:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLsXvINHlzcRhUtQC1qlH3cNGs1wFhobVdQ+qC77ElAtc7knT3IuM+ggVyOTzIJa0/ikHH3kbZYL0MjVT/7ivkySlj739JSc2vWhkiftP7f6/c+boLTQ7lxoxaTRSuWq13NqGawSewYLDb2WhREoEGv8Mz0TmpuefRNFiuqvRra3suW+iGeRjQA44fBjrF5IqINOsftJtf5IT9biY39gSBMwWOZKCQKxLS3pvunaA+j41sD7qs98XxAqXMk0uvaFtxM82vEFxCBfhn+yj7VTymZ8kmubev1JrhJCYINEiQGPlrU0l/fRQKm1mtJZeyVlH9Hu1Tb6FRG2KojVpLTXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fy1pirMYwcJbp5qsalfXm+LghMjolsmI1AScfV6O3Pg=;
 b=PO09So7MWbZldw++OlGrtJZFf77jBmui+cIrpwXeDDkICzXMjP7HntPIQbGjENyGenKQsfD7mxiEFdFSOPjnrt62CnD8mpmxSFj4dWR1vpm6Dbd5lQAxSzU/JDSng2XQmLbFy9K7FN8CojkbS03q4x5Ahk111dg47x+KJY63G2p5Srwdxl6zKdTM/mdAk48ymUBLVtbJwyViYrNOkwWLLaMqaX7IwfdjFDSryblH4ViFamgfQEw04NIiGnyTG2EvuaM1EBlBn2bApjGRy2zFLh7kYxMII6RSUBTPitBscbsNuyr7SDtjmAeADKaGZZz7J04ptfNdxerjVKK6lUhCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fy1pirMYwcJbp5qsalfXm+LghMjolsmI1AScfV6O3Pg=;
 b=St0mVUG+slmIIDZDJnq4v8xz5hZQ3HGaF0EDxXJjvph6VP6VINKxBNsvSi8s9rJlfhFM+2BgbT2oTqkAP4MO0o3/Kb7q3/ptrPoSHAQgY+xf7S+TfyYmZMgunpMkorC4PugIN5BWsFlJ+X0vwnRkqkamFYA5cdYt4gOzct2J+7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PS2PR06MB3559.apcprd06.prod.outlook.com (2603:1096:300:6b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 08:37:25 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 08:37:25 +0000
From: Qing Wang <wangqing@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: msm: use div64_u64() instead of do_div()
Date: Wed,  9 Feb 2022 00:37:17 -0800
Message-Id: <1644395837-3845-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27d35d51-edd8-41be-a475-08d9eba765ea
X-MS-TrafficTypeDiagnostic: PS2PR06MB3559:EE_
X-Microsoft-Antispam-PRVS: <PS2PR06MB3559940EA90B7CBFF9CD69DBBD2E9@PS2PR06MB3559.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5gWAT3H8xFFuQqoUCX3iu/whfkJerl5Fq68j1PnAe2F8zx2kuterMK/cQJBJVrVMv2YL9rNsAGa6rVIFSobKvuKv5MLPMrEeGYRnroudhxEicP/n2bjDc6Za+3/8v/tqVFKcC4+L4BTt7S7HD8rGBsXeUBZ31b1txCxGzDvO5oiZcpMAMMZ+XXScHk4iZfZavG3dxdiGTd+6BkEePVX9+OwybcpDVi4IhO+CPGrCrlPY/vScHGW/HVVL9MfhpgZ+vr7A1fQssqZpszMzLdjkjcZmK5WmOc2GSPneFChbpCnmcnUDaCvv4CrvrWqngAJ1mYlh/7FAoOs7wnmk3k8DxCp3UgNmm+sAETU+36hg7exlO/2bKTDudUM0731fS1Bd+gAPB/f+X2+sf+8zfOU0azP+LTmlTzpiXPRQpTO0Zl+vfzZeR9k5J56ra8sit91PAHr5eX8sJxXCwR3vWecwHAitgB0gHDKGycAO1GAs4EqWpztyJLIfDTn/6gUsW6kn/K5+qt3WYfK/KBmhPPRfsZOArlkyrKyQQ7eR0uG7RyVOyy/MGsianVMMxfWKHI9irg95NFQO+/dh3kA18g3s6leL/V1PMbTJCY6zqqfQKz2tFSgFhREi0+E2xMo8xRxVte283cDPCwHmRPLC71UAhMK07vtrZ+UsqRt25oI1Z36oa79LRzoJI65GL0Gq7rR5tA3yjE9k0GqoxD6SxhrCvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(8676002)(4326008)(66946007)(66556008)(66476007)(186003)(26005)(6486002)(107886003)(6512007)(38350700002)(6666004)(86362001)(6506007)(38100700002)(316002)(110136005)(8936002)(52116002)(4744005)(508600001)(36756003)(2906002)(83380400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p7bICybPQ806gzeBzsIlC5jH2n9rQ+WJTE7a+KMHJiKXr9trv23w1EzrvNG7?=
 =?us-ascii?Q?fMttR4t+QM/DHKDg7W5cikzRqJKXhFL+p3WsegqEN7PrroC5Hv9TE491AXtW?=
 =?us-ascii?Q?DoMhv5b+NOjROa7ERfJ0+6h7OPQjrPwE1HfinkALnOpytJw/857A5npkKpKR?=
 =?us-ascii?Q?oxyqoyWsqsNSxOAbQl9qy1LVmYljIq9pG/AhHG1T0X+W6/yAWP4b6wtF1Fdx?=
 =?us-ascii?Q?viF7t9rFQfCV5/lMDU44o52CXnxhFmTa0CxHniMVtt1YgBtRWEyakhV7k/RA?=
 =?us-ascii?Q?91hmo4PGA/KvuFUWWNxXGHE+BsizUapjrcg9aAGaVc2sKY5DS85+asP3fkoz?=
 =?us-ascii?Q?Zga+25QVSnoxrhb3kKyThBm5SxT5QWN15SblPCLTbMnawIKZz1eiqUPZX5I+?=
 =?us-ascii?Q?4JKxh9chLAktc5ROJIFKkJ5dVtq5fbnJUjDl8vWuh1SvepN+EdnWoS4SLr50?=
 =?us-ascii?Q?IHyhArSf+v4/o1Szscld3UhAa9lYrxautkBmEZuhRRwQ3Q/Gw+uqO8SlWRG2?=
 =?us-ascii?Q?jhjB7kn5Ut9nZFzSmdRzGOHZV0nehzyLGNOqYVYX5JV8hmnVOJ/VK3qflu7y?=
 =?us-ascii?Q?luzaOwoiRT2bBhBZpU0BuBqQpLeovpHXbu5v4V0sn9Ioh8PcCh3dUy21N6Dq?=
 =?us-ascii?Q?9s8C0iJ29NVXk2XhVscURi5BbUDMvBU1od0W1Lh2s+Q6kfSZCTEtebEmQuPK?=
 =?us-ascii?Q?8UaOJk82Ikrd5rBBH5S9aAFdvrJ1O94L38J/VuqTUb9mvKR1OgMPE887WlLL?=
 =?us-ascii?Q?WCT2FmduDs4C27w5bWviXvJ6SxfpLPDT76+Wk42uRVhVTS4K6qhwVw4hhPXL?=
 =?us-ascii?Q?sWLCnReYxOkH8Oyz+waXL9DKvG5phvCCj0gOyv0iYskQ6XyQUYIj+ZE5rO+D?=
 =?us-ascii?Q?VuqOmFFsTuYSd5zOIb3Tp5eG3TXOeq8oJD9ttkbfcGdWSSLOoh8dKypFqxfq?=
 =?us-ascii?Q?s/lIMVcYEJ6OqHiwyL5W15rm4zKPpa5b8AIbu65bxBzUcLGPxlLS8O+6NhbJ?=
 =?us-ascii?Q?+u68yzoUFcjP+rMGBB7w8FrabSiu22hbRg180XnkeJ6QSH4imhtetj3QTZSV?=
 =?us-ascii?Q?1dFJWcHB1+GjqEnnB38lf/xUe9zLXsN3vTv2LuyLAcvQH2BBKCguCsLO1F6J?=
 =?us-ascii?Q?bRW9wTFWs6CtZeSOmISoFQ6Gngh2AxkK28IAn3G+kj/2BnNQVbRma5rIAA2r?=
 =?us-ascii?Q?cCC9gOjul7FA8wjd16ICQCwvH9cyrwnBUQZBWT/TApV/di97+OC98LkIYWx7?=
 =?us-ascii?Q?l90WukQCpHYnxeorUDpo38CAdsNFX9n8+m7/hyqsFUa4JHOR3JB7AmHYRdFr?=
 =?us-ascii?Q?owwIWE0LoUbnvJXxx1pcAtW0YRIixE2JilMKrOI++G5a3Hzf0//l1Rr3vQ69?=
 =?us-ascii?Q?kCHwTA9jrq57Dal5XU3xmQpftnkNLVfp5aUG5DUZgLKgW3SyzaZmWQxiswOV?=
 =?us-ascii?Q?lDJLtGUMKLCB+nkX+lrpDee4TIF87oxfe3zWeLUEXIglj0bhYvMdkYTypztq?=
 =?us-ascii?Q?WCDi5T7JAiM8PmEmG5iavHbF5Wy9/G8d+Ndadcly1upxglu2iGknQaOopY8y?=
 =?us-ascii?Q?g9WrkR76/aIWA4AQaZQTqFnqQC5fpyJMFCvMBdS1Z2Nzx50WO2XDbW7OrO9J?=
 =?us-ascii?Q?ZLS80N2Sg9T2juplfCBKugk=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d35d51-edd8-41be-a475-08d9eba765ea
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 08:37:25.3452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDv6QqhTuxOIJ29k9+GlOwFPGrEE6Kb97/11tmvQjZPEVuyrtOAB0cML46OtwRc4IpejfIJ4m2bfTQ/t0yNGGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB3559
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

do_div() does a 64-by-32 division.
When the divisor is u64, do_div() truncates it to 32 bits, this means it
can test non-zero and be truncated to zero for division.

fix do_div.cocci warning:
do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2c1049c..aa4617b
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -648,7 +648,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	/* Calculate the clock frequency from the number of CP cycles */
 	if (elapsed) {
 		clock = (stats->cpcycles_end - stats->cpcycles_start) * 1000;
-		do_div(clock, elapsed);
+		div64_u64(clock, elapsed);
 	}
 
 	trace_msm_gpu_submit_retired(submit, elapsed, clock,
-- 
2.7.4

