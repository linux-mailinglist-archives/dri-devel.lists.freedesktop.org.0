Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CEF39FEBF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 20:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F876E58A;
	Tue,  8 Jun 2021 18:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190236EC34
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 18:13:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lo9w1lifa1lecj+iX3E4gPSJA9Sro3tFjEIjWcciJXNga0/V18PnNqGNxrjcji+Pg/gAxDglrSI1FM2vkStMb2izQSnKZEvx11+4ee080C+mElKl6qG8yZbR5Z7AlMa1eiBF6w8ZrEINocFarXZFeQHVIFoymEgFz/5AmKgYm17aeR+/PgWVS6HYGDNGLy7YpFzxbJLhl5tBxMBvfcMDB0MHmIDzzDGr8Q7zs+4Li7j1oW3MDJOOW9yg7PtD0b/wPxjXAT6q1wnAPjwxjlaAgtcd6sx43zRhZsRWJijF44FE+IH8gVWVTMDxz6IoV2JYmQBsnR7L208Qc9DJRhlNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2F7N+cfxxAAuJG89aZ+g2ri5GnVh7d418iTD4Qx+d0=;
 b=U0iV7uXhonUqGgxroK36nJVw3eNWpSJFcGvY3cfF8MOKsZyB0kijcr7oiqiwXRAjZ43H+BSUkaSZ5e4/vEIo6a+izLoQdIxm1GDVSHoIq09lWlwQg1q+bIaGjeD8F9AhYCeqzDKwSIsIwSR0sZnRU+etj/EMUDAw+eA/Fh3mB9UVRekbpAF9+ybV73a8qM3zjXkFTgjEhyuUyNbPXi/fXtb++muIpFqmdpqgJUs9sPQBTmeRNOFSA/lpKSmBhViurhkahcUEn9Z5UrXvl80kY6HgGNeW+PuyPpwxUNEDR/RZPEZKX6Q8hLt9lDV4EQqzJnjFfm3z50ZYclm12frDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2F7N+cfxxAAuJG89aZ+g2ri5GnVh7d418iTD4Qx+d0=;
 b=KaMGRxbOgIzufevjlsHcFfkTOmRIXpjEdNzslXuNo5yuLQwRUDECfxqSR4d5uQHnfhW6Wct8CZgMNflGa6V3XdSQNHgtBYH8kXw++4H8VWnyyxKwAkOtM40AnNs97xGEgqmeltYjaeeZsP4B4z9g1YKBjgxwT/bzpd1qy9FxL2A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20; Tue, 8 Jun 2021 18:13:22 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Tue, 8 Jun 2021
 18:13:22 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/vmwgfx: use ttm_bo_move_null() when there is nothing
 to move
Date: Tue,  8 Jun 2021 20:13:06 +0200
Message-Id: <20210608181306.90008-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
References: <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0954.namprd03.prod.outlook.com
 (2603:10b6:408:108::29) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.amd.com (165.204.84.11) by
 BN9PR03CA0954.namprd03.prod.outlook.com (2603:10b6:408:108::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 8 Jun 2021 18:13:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b44a18c-f93b-40be-581c-08d92aa91a1e
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5431422732088964ACC55F438B379@DM8PR12MB5431.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9PKf+qgdk/UdLjxTlXNEUnC7wZsdOPWWdMWLcVmf74a4OXIYHIxowE6ngueu9IWw/uxVHd++gXInD5Ykmp4oAg6KaJEInNc8iq4Ece8xWKfX1sZGGj4UlvNJyE+Gy+WiPeAKp/4A/3IKHYHOhEn6u1J5MSfo5HyDhkosr98BWVdzsmuW/ZSr0N7v5Kh7VDLSVLFtMP20UbTtchXXUMmMMW7vYcWhTHR6cIdAgXzK89Vdg703Q/8ojGXmChhMISr2f5Fd9YtP0ihOp4cWutUdOYoDKnqUAF4qfRO2cIURAY1q7PnXk+ZicpWbaM4bofJ67fCnjZCOvTOhHIezEBtFtpYifXr9ia5AqBYnIzSdrwnYynuzpBHIzWt6teqsoy/MeH8OydL0KlcWzTiaitwshPSB47XwO/ESh1ClJ5CRHk02zqa2qRgPP47HT2VJk40BStm7r9rsmI7CQ41eQ9hSDnUOwRIvsjEzKTU+IqWvDwQnCvryUxo1kQ/z7AzXgOtVCH//8OMQ5MvPlGgD58R6/5FDJSfdfm/CmQNKBRHqmFvgOhwJQzTlZ4jR8f3alFdQwJ/ZzSLy9bEG8hzP7HTT8kuIOAdKN0ftwMWvXbScgZuLifZrNsQE2Y8lmPMPq52vzroucphU7MJFJD7ZXwFzjMDSjdgvaiuvSDxT76KsNto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(6666004)(38100700002)(1076003)(186003)(316002)(16526019)(4326008)(38350700002)(83380400001)(4744005)(66946007)(5660300002)(66476007)(2616005)(956004)(36756003)(54906003)(8936002)(66574015)(6916009)(52116002)(7696005)(8676002)(44832011)(2906002)(26005)(478600001)(6486002)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDQ2SzFaYUFiNDc3LzZXUHIwOVFseElMbVIybHE1OEp1SlZJdXp1Sk9JV3dr?=
 =?utf-8?B?UWUwbnI1d25ZTGpLMm9QNE54U2dlT0kzQnJZcW9ubHdLMjdMdHp3Q0NmSG9m?=
 =?utf-8?B?SG1EUkQ5UnFKVTVSWUxTbCtlMkhIb2dnN0poQ3dNaXVya2lVV05QNmM4NEhL?=
 =?utf-8?B?TmVrdGF6WXFJaW9wL1MyUzJxa3FSdVZDRDVnMG94S1k3Rk9TTm5LTVo4VlZC?=
 =?utf-8?B?dzVidVc4Z1lWaHVGSWdnZnZxMFZoY2dtM0ZvQ1Q2TVBOK01Sb2NKQmZZS1lB?=
 =?utf-8?B?SVFLRmdZRlMyYVh3eU1kUk4rRWtTU1ozdmVmak5Sa1V4ZFhEUmhLWHArNjdB?=
 =?utf-8?B?UWwwM3NabnhKemtHNXN0aTNNMDRXYWpLNVRrb2JFZk0waE1DRlRNLzU0a1o2?=
 =?utf-8?B?a2I1c2RxZEdlNDk4dTc5SXV3OURkMDdPa0JEMlZLdDRocFRaQ0x2NTJGcGEx?=
 =?utf-8?B?U3NHaUxUZC94Y0t0aVYrWnp5bU1mVngyVTJOMzZjOWFqM3kyMnp1QTlwKzZm?=
 =?utf-8?B?QTd4RW5NM2xHa3ZhZHFQRmxwMEtseXVKdW11bnZlMkM4NXNGaFlkbVBZa1F6?=
 =?utf-8?B?bHpvNzAvU1ZYdHdML0Y0cTR6c3NYOUtYa29WYnNTcWxhSzl2UGxlNnd0SDBw?=
 =?utf-8?B?NHRva0hYQmtBRWs4aGNLbUhRRkZkSUJKS2pnc3JQUDRxeXdRV0w2b3lEZlpP?=
 =?utf-8?B?T0d5aUZHMUx0eEVLY2d1OVVvRnBnUjJqZGxWSkk0NWxuSDhsQUcrbzBGeVlq?=
 =?utf-8?B?dXJiUmJPZUgwTTVSTmNMdmFSQ1dsVm1jR3NRczJoRVJzRytFTnhKbXdsdEhu?=
 =?utf-8?B?T0k5eVFsakxTMy9sQW02L1JNYWc0clV4bUk2ODRJU1RNUWUwbzUrbHZud0JQ?=
 =?utf-8?B?VjFKRERQM3hWTTcvZmVienJqTG9vYldwVGlaVlJPSU1iYTFmZlc2eUJBNVZQ?=
 =?utf-8?B?RjdXWVlrWFc1dHA2S2xaNUlBekd0WjkxVTYrTUxGRWVWMk05N21KU09oa3Jt?=
 =?utf-8?B?RVdidjlMZVFBSVFMVnJtZmRRTndNZUl4SnJJL25BVmEwRzg4NjhzSXBPaWQ5?=
 =?utf-8?B?Z3FteDdUa3ZrUkU0NDNkSGtoL0FBUW9aZlV5WFVlbDVSZUhOUDRHZTlxZkwy?=
 =?utf-8?B?QmRsTmZSSkVzenNzL3BjY0NHNitsczErRHg5WXAxQ0cwUGVOTDRPYU43Tk1O?=
 =?utf-8?B?TTg5ei84ZWdtdEZBQ2x0clVyVzZvR2Ezcyt3ZnJYY1psdFU5eHpZeFdhaE1X?=
 =?utf-8?B?czhMYWtZN29NWi9hSk1lUWkweGxlSytJNlptTWlYbUFpNFNMYWhhWThYdWxZ?=
 =?utf-8?B?dWVDYjZBVmRpVlJWOFJwVW0yZDVuRkhnU0VocTdVZHJIMlAzMnZoUW4zNnhu?=
 =?utf-8?B?a2FwYmVsL3pCTUg0RnVnS2pZNFkreENzK0JTcnFtMTBWN0V5UElmQXMxVEx1?=
 =?utf-8?B?MlV5S0FUeFg5MEYwUmdqdnlLRE5OZWxQSnBiNmcwUTYvZGRvY2c3em1DVG4z?=
 =?utf-8?B?dnRVS0kyTXBiS3FhdVVONVdNN2hjWkdudG5QQjFCVzF4ZEVJa01Ub3V4RUJS?=
 =?utf-8?B?dlpWZ0lKTDIxRnpWMk5DNlkyU283ajBYK0tlYmJMWWNvbzdmanRKTXNkTXBG?=
 =?utf-8?B?QUNJZWxkM1o2LzJYNDYxcnhaNVBoQVpRK2MrNUpYS1F5clhtRUxmdzdXY29u?=
 =?utf-8?B?UHdKeWYwUmpnY2IvcjBmVGp1K0hFY3BySWJGVDhIQk5mNFRWTVhRWmZnUFR5?=
 =?utf-8?Q?HZK2cMu/NHvaXuZ1JDXdjRrQXeBTtTVkBmOUoQi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b44a18c-f93b-40be-581c-08d92aa91a1e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 18:13:22.7991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PATPRB6j3BGs8zrdADOg51Mmq+wgXiflcveLcR0eiqsv51h0ehvuHhI8O2HeOhR6hXPjS87NapoxRhsSMO6nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5431
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
Cc: thomas_os@shipmail.org, Nirmoy Das <nirmoy.das@amd.com>,
 linux-graphics-maintainer@vmware.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use ttm_bo_move_null() instead of ttm_bo_assign_mem().

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index bfcf31bf7e37..0488042fb287 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -733,7 +733,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
 
 	if (old_man->use_tt && new_man->use_tt) {
 		if (bo->resource->mem_type == TTM_PL_SYSTEM) {
-			ttm_bo_assign_mem(bo, new_mem);
+			ttm_bo_move_null(bo, new_mem);
 			return 0;
 		}
 		ret = ttm_bo_wait_ctx(bo, ctx);
-- 
2.31.1

