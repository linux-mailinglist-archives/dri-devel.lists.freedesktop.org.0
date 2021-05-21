Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1934D38C1DA
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 10:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9923E6F5CF;
	Fri, 21 May 2021 08:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04966F5CD;
 Fri, 21 May 2021 08:31:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLX0CJ2QpRQphgD4681yOzNJNJwimiafVOsQboaN0FX83ui+KKuYAdbWSnlzExnSIEqPtT23Kf5H6+a7eNiKy6OJSR70jT7dQbsJd/y5xcn2OwsBXmXWo9F1gBQco8SKFo3jW05NMiF+aeGZkbKQwIMhXnU/iZtGk3DrwxyRoIrjyKPNsq+cciMQHa7+sPPk7CiqBD8e+RR6qc0a06Cv61jGn54Db0mgNOcAUZwb2GexwJgn++BwrZ2DV+mkuROxEAKiXyQNrZ+mKhitXFYTmjdXmrV8f4NwSE3zW0dlIUleka/fagv1OUwDMiCd+Xb63p3vjIsdBo3ifKtIbskCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FwFG/7BGaMpix5u/2gj7oszmocjpGn5biwzc0WLv0k=;
 b=lNRxZtu/p5vApvLPmAT76urZnxA27QBnkiM0w3e93u1GhNkAafC73Wcy+YDQaG/Q7577XY0RVDidnQElt2z6XK7Ga0YawoKirwpTefTy7f5/XCqFCedOZMZ1fwLLmUoA1y5mTMsQrZE86zlpcqINmmegNNv3eA1hyxdvMAwDLeno48463pA9DsyWBC1NReWFJbdUlPdNaRUoLV/WikJqijN11Q5RdrhxuE3gCdKtw/SPZyL0akvuh3epU+3nrzKmqMYy32pCXwjOvB17zNlzxlsXbQUT5LnoGX6F+5W6K1H29UN+Y4G11dx2bzcAZXaHFshVT6bYubKicX5rdLa4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FwFG/7BGaMpix5u/2gj7oszmocjpGn5biwzc0WLv0k=;
 b=YL0Mfy6Q2plS7A/IVQ97Mv2jCD0KFHPkq9cNi3ZEfCreb/syzQUI/gdUNcG/90t7SjXyv1Yg0RZTgSRNa/NNes0G2dzVs8Du8RGhze2BuK7ofND8uAwoU3pZWxhuACqds+WGqpm33WouGQc4EMgBXKSxzZicajsPnbLGWdln/HA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5133.namprd12.prod.outlook.com (2603:10b6:5:390::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Fri, 21 May 2021 08:31:39 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d%5]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 08:31:39 +0000
From: xinhui pan <xinhui.pan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Skip swapout if ttm object is not populated
Date: Fri, 21 May 2021 16:31:12 +0800
Message-Id: <20210521083112.33176-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.134.244]
X-ClientProxiedBy: HK0PR03CA0100.apcprd03.prod.outlook.com
 (2603:1096:203:b0::16) To DM4PR12MB5165.namprd12.prod.outlook.com
 (2603:10b6:5:394::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pp-server-two.amd.com (165.204.134.244) by
 HK0PR03CA0100.apcprd03.prod.outlook.com (2603:1096:203:b0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 08:31:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d83472a-d23e-4197-ab14-08d91c32da7f
X-MS-TrafficTypeDiagnostic: DM4PR12MB5133:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB513343535CEADC720221A58C87299@DM4PR12MB5133.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w1xMcJrnahg/zG6ROCnGfbA8046D6crEV48yrwrSSALXGgClejCkQWofVQwWy1lUwgVKMUnRtt6mYilMrYSHKEKQ45rH0RMk6YfNWF5W4oujHP/B/48e4uXna8NoLBad4MFVhJ1bbLW6Wp+i2Fnb2k6uueGqWldYK6/6lh0A3qpERo77k/B6JCxipQ/T/qfrEA1Iw3i75YjNZtUj7FeFoQa0iEyGBry6wxfS51bmjjQfEUcRo+MTSf8NfuUj+QEV2Q8ViZeYrxypQm/YsMLAoLR/u/h7+rszuvKBI5OaMiwCDytR76lK1jL9x+n0f5+K5UHYHniDwSXKNzajqtzU7jxpvWfizig4C0ySbHjjRG8IJeu8VdG2ervehpMlXjvTo4N4RsBbDYF35KE9pxXgezvr48eyKuzOeD94tarxGyquuMP9RIbh0slsRDfPFA0knx/aM3dHUy4+8cw/RSeODhqPfcIH516OShQDFPYGNAebDFt5F8kruFLYEf9jFf4cGq+HJ4KmCdg066GO+MxIJvFebG1TN6LW3zWs0LGPDY+lyyNGePb5qkOr9B5wToTqI96eojnAdQ2hrzoF1drTWUD+rMuLL4yJGD4VnoPNguqSOKZu4gd9ABalOq5y6dXs4SqaCr5QCJ9KpzzONITCRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(1076003)(66574015)(6916009)(38100700002)(16526019)(6666004)(186003)(38350700002)(8936002)(6486002)(316002)(956004)(2616005)(5660300002)(4326008)(66946007)(478600001)(66556008)(86362001)(66476007)(4744005)(26005)(8676002)(83380400001)(36756003)(7696005)(52116002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXBZMmRWUytjNXVNalUvOXhYRVlhcDBpUTZuTjl4QWlTaUdST0x6MmkvMjZu?=
 =?utf-8?B?MHl4YllIeU83V2xkNWxCNnRFVW1ZRUpMU29DZVRJM1BWNU1TSEtDMlF6WEVE?=
 =?utf-8?B?cHh1NTRhTTF6VlNmYkZsVnRJNE5rK2JkdGpHd081dzNLdmJYUDc0ZVd0UjBL?=
 =?utf-8?B?Qm40M3VuMi9QaXdLakdYOTE4QklXcHc2L0hVSHhJZFBQcnpFMkJxZTlyQy9n?=
 =?utf-8?B?VjNUSXpROGMxTTZDOUZ0WjhhalZZV2FIeXh4bUYxK1pybHM0QXk0WUJTcVVG?=
 =?utf-8?B?VjRwWStudVhCMDNYNmFZRVpzMVlmSTUvV2NMYnBZOFh5TGpCRkJoK3F2SHlJ?=
 =?utf-8?B?RUlyRWthOHNJUUJ2WGRnUG9ZbmxWNk9RUmhGU2ZxZUFaZGt5dk10U2JGbWRC?=
 =?utf-8?B?aGFpK0ZhTkdzNG5iNjNKQ2NpREZwQWt0YnY0QjZJVUpwTWVDVE5iN0hKNzJ3?=
 =?utf-8?B?dWF0NUt2NU54ZFlDaWdwZUQzMzc3WWZwMk50anVRZ25hcmNwY1lwdDliWk8r?=
 =?utf-8?B?K0EzK2V4V1JURWt0UWJETTZUM05PTnluT0JrTHZkSWcvRkpFOUt6Y2VZajFT?=
 =?utf-8?B?c1ZEc3lkYWhodGhrWEZiWVdBMXFRb2VJd3NRUzE5MkNrUWpUaEJyMStIQmta?=
 =?utf-8?B?eXQ5SExxS0liSjZuWFd6d25EVG10elRpZkF3TWJrS0cxRWdBdnUwRnJHcVh0?=
 =?utf-8?B?OUxlbFp1QVF3VUdRVVg3THZqYytBWTZhUkF2Qmx2bm9ja1YzRjg5cEU4V2RV?=
 =?utf-8?B?T1JEdE5lSXFteHNxWHBIN1hFbDZxcEVJc2ZGb3hNbGtLTnV5ZEljSlFkRzVy?=
 =?utf-8?B?TEJrQnRqRHNmUnB3ZDRnTkxreFZBR3d0WGxpMXlnOWNtVGpjaUxCdkxmcnQv?=
 =?utf-8?B?ajFvdDU5TVgzSWdlNHk2VzBkUTdoY1IyK3VTNmg2TEkzL2RXMVMxaS9BN24w?=
 =?utf-8?B?b25SMFVFdmpEREZUS3hIaWZ0b0FwWEJLMEZROXJtSUtuMFY5c1U5UVZ4TkRC?=
 =?utf-8?B?Z1NJRGFpcnIzWXpOeFNBT1FOZG9UVTJhekxPNUpUaXhkL2RrVkdLK0pGQUUr?=
 =?utf-8?B?MFJrRnY2bWJZc2V4YTRJbXhLdXFNeWI5VFdzc3l4ZmVWTlhtSXhVV3VRR2lC?=
 =?utf-8?B?enVCMVFjYU0zZTE3ZGhUb0xUVm5tM2hmZnJEWWZITVFLVU9PZ0xEaFZud2Ir?=
 =?utf-8?B?dzVSWGdCcU04MFg4MGQvazk1U2FTZlBldGhEckJHV0dvNFRwZU9URHlLRzh4?=
 =?utf-8?B?YXdMcmhySTJyeUE0eklOZnFVT3N0OGhpWUdwM1FWUGJDdmYxbFk4Ujk3Zk9j?=
 =?utf-8?B?aTViZmJnbE54bDIwZnkvM3hUWWlMd1kyU2hCeG5ZdlYvY3NzMUxnc3hETENt?=
 =?utf-8?B?UnYvakpqNnhyRnNURWpYR0F2VlRJak9UQzB4U3pWbGFTaGJxSmcxYm1oVEtx?=
 =?utf-8?B?V2cweHFLR3pGeCtRRmY4YTgyOUxYdEwveEVucG5LajdNTFkwS2FYYzBpNVB3?=
 =?utf-8?B?aFlSTmVxYmlZcHJjK3p4ZmgvbnZCZlVjMFpvNG9MZUx5Yi9PTUpwU2xIQmg3?=
 =?utf-8?B?ZTUzakNORzhvcDR3MldRRjlLSmJ4cEMxTkVGMm5UK1o4TlRxU2JUR3lieGk2?=
 =?utf-8?B?ZWpvOXAyVDV5N0wrY1FjWVB6SlljTGRIcG54MGZ1L20rNk1QMmcwbE81ejR1?=
 =?utf-8?B?U0JCeHEyQzlja0poaStqR2dScXI0YzZXbTE2R3NHQklQRll3dkF2NnFtVEVU?=
 =?utf-8?Q?XrpgS8QEjTQyu88JpOM8g8U6YeWsuqC8MzOnre8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d83472a-d23e-4197-ab14-08d91c32da7f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:31:39.0632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41sQ0phlproIOjo6D954YXsESI9Wew4JX8w70sd5H9v54mucqXPaYVbv8+M/im7W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5133
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
Cc: xinhui pan <xinhui.pan@amd.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Swapping a ttm object which has no backend pages makes no sense.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 510e3e001dab..a1dcf7d55c90 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -145,7 +145,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 			list_for_each_entry(bo, &man->lru[j], lru) {
 				uint32_t num_pages;
 
-				if (!bo->ttm ||
+				if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
 				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
 				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
 					continue;
-- 
2.25.1

