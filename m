Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB35914391
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADD610E385;
	Mon, 24 Jun 2024 07:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=synaptics.com header.i=@synaptics.com header.b="IYGJF+iM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2091.outbound.protection.outlook.com [40.107.237.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A02710E370
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgncJYpnUZW57epdWm23x+xLlLVhQlqxMrr3CdrYsWdRgvI8rizNUPcEGlqKAJBWG5A2T+gHCQzSUvXxADMTeqVhHAiOO8GzgBxripRzIHxq+1tYN7xNSTZ7T+4Im0UBH/+75AStg71/B/eOsAdCwgj7fDu4TfsNSZUeebp+Hj/Y8vNPDqgx/m7bxOJAWLOoi4ZtRGifleEKTDQ/52r+xDi9y1D/5EvGRadqP6/L1R9hw2NCyXR2/C3kIZqQ1e9HU1MFf5wWazqFAEKgrfSJRLK8oxJuFdoGUDEaXIZQfYaJRCqJll2nLWRrhNt7RqA7dA3+/WK2Ibu8M1TlseTRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzjPdwKz9ljC2BwYLgVlAcJVpgG2p4+yBnna8imPKo4=;
 b=kmCE1PeOsPnjqUBCkvI4jvzFhRZIM4jw/294xIzz7WW1EFYRerbRrCWDdWy4Rf+Lq4cHqxpM9aJlJOmsDBPnigqkipgpH3jijwbVTMKosP/X0ERn3kNl/TWaYLmi5ZaUByx5Fr2iCvbrGNoIEmHRPsq8exLadGL3d44WlxT719OXkmfvQOdeuUeF4/EU3pWk3w58wJc3lARGp5Zh8ibRzdZU6OyfiarUnVSqWGGCwcNKnhNdWY1n0a20KXCefl0vzFLPYOdjhm5WVbJ9Fkl+Q0fXdRPmt1Xte9Ir1gQDPZfrk/cSj105W98nLOkhdretcaNToF60+XELBU1rvRMoWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzjPdwKz9ljC2BwYLgVlAcJVpgG2p4+yBnna8imPKo4=;
 b=IYGJF+iMPDCrQGg9eO0Yk7n5h9mOlD2BPiqPxh3Lhjks3ISSPlUCHXjaWK4AQHp7zUI4qTBy0YhLi0+18QR8BM0X9+Vths6aLGq2UTZVA524SVV5hX5Elwt0SdyyeoZRHkbLJgC7RFaADSLhwhgACrhHUZ9djPRR9na2zZoIwuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 by BY5PR03MB5063.namprd03.prod.outlook.com (2603:10b6:a03:1e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 07:11:25 +0000
Received: from BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990]) by BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 07:11:25 +0000
From: lukasz.spintzyk@synaptics.com
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?=C5=81ukasz=20Spintzyk?= <Lukasz.Spintzyk@synaptics.com>
Subject: [PATCH 4/4] drm/udl: Shutdown all CRTCs on usb disconnect
Date: Mon, 24 Jun 2024 09:10:41 +0200
Message-Id: <20240624071041.5087-5-lukasz.spintzyk@synaptics.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
References: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To BN9PR03MB6188.namprd03.prod.outlook.com
 (2603:10b6:408:101::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6188:EE_|BY5PR03MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7ae828-3fc1-4218-5342-08dc941cdc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|1800799021|52116011|366013|38350700011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzZTODVQWk5QS1QycUozczE0TjZoZnUrZktwdWN4Z2d0b1ZtZEdrNm93b0gx?=
 =?utf-8?B?RHJWNFF2VnE3RGlUYVVlbHlZRElvUVZiSVExc2NWS2g2Sm9Ya1F3Y0FxMWxH?=
 =?utf-8?B?VzMydmM1NVlSME1IWkFVRCsyZHJpakgvbzl5QXFEOFkwYXZCeDdINldWVEJW?=
 =?utf-8?B?NVhmd1Y1ZGkwNktwK0IxUGxCczdjMHVYZWR5WmZOMGlBOTVXOVNlUldmalpE?=
 =?utf-8?B?L2F3by9qRnpnNE41Tko4YmoyQnVNU1dEM1FJVUlFV0l2YzlEcENsYlcwQnMy?=
 =?utf-8?B?UDJwVVlrQW9JNm5VM1R2QmpMWk1oUTRhS1RkTFQ3a3ZzcFhyU0VrK1Q0NGpQ?=
 =?utf-8?B?S29PQUx2b3Y5N2hiRmhaOVU4enBFTTRwSmY3bGEwMTZhR3lJaTJPOUpjeXls?=
 =?utf-8?B?Zk5oMTE4aXozZGlaYWk2ZndsNXpZaFlFK0xjbjNuWEVnWEY4NTFoa0Fxb1Rh?=
 =?utf-8?B?d2Q4NUhST21UVTRmc3VrT3FhN0pTV1AreDR4K3JibWtwcWpGQ3dCUFNXbXJj?=
 =?utf-8?B?dkNvaEdJRlUzRUs2dnJpQnJ6RmVJV3gzcy82VUNiY0FtRExTUFZ3MG5IY1Rl?=
 =?utf-8?B?Vll2Q2RucjZpalFKb2JQWDgzTjIwSC9nTlpUT1ZRNjRPVEg0K1RMaUFOMDdZ?=
 =?utf-8?B?YitnL0QvbzJhMWFBLzhLL2JnaGF1b1VpekFuSzNVckdVTkQ2a3hxVmpYaXRt?=
 =?utf-8?B?Yks5SzlxYjFyblBhUGhoZEQ5ZU1mb21oYWxKeTZFaEp2MWV2aTJXNWdEWVNa?=
 =?utf-8?B?MGNjdUdKK2MvL0NiZWRxVUM0WFBJd0tsWkNxendtOVRETExnOXgwajRQVUQ0?=
 =?utf-8?B?RGNUY2NMZTd1bTB6Q3E0Q2RTajhwTXZhUUwxNWE0cWtoVmtOTmtIcDdWWlg1?=
 =?utf-8?B?SkFNY1dDaVlSWnV4c0tSaXN4MldLOHpqQWsyYlY2c0pWVEZDRUJOZENMUk5o?=
 =?utf-8?B?eUZPelFFd05vcndlaERjUFAvUHZyejVUeHB4bW9IcytuVTV5OU9WZE8rTThJ?=
 =?utf-8?B?cWRldUhPQnBCNy9QdVM4dm0zSWhsbmNWSnZVekFhWGhYS3lmVmdEZ0d2WGdB?=
 =?utf-8?B?N0FlWU82VGFzOWJldUNqM2M3YzZKTGtsUUN3eWN5ek1YOEE0TXlVTlBDY1NT?=
 =?utf-8?B?WUdnNCt2TkdrMENTNG9hVzM2b1h0SWNIN0NkQk1Ma3RKMmIrKzVtT0hBVlRD?=
 =?utf-8?B?K1JZMWt4bEhuK2E1emVkNjN3WWIvSU00OC9MQXRYS0xHejhFWmNndDlrSGwz?=
 =?utf-8?B?T1VaN0dCWG5wUkxuUzY2cEdkbGdjVmlFZGpkVUtuYkZhL2tzQUdCbDRNUHNq?=
 =?utf-8?B?NEY3V2hJTG5RWGxSRzhvU3dGZXpRWEpQQUNIWjMzZnN2WEFRZzhoanV6VEFn?=
 =?utf-8?B?NHhCWXVMc3pHNitZZXlmSjZPc1JHQ1RQTTd5d0hWUnBmSlNNYkxoY3MxU1Yx?=
 =?utf-8?B?bitUZERaRHpkZWJZTDdoeENHYVUrd2hjdzloZlIyMTJFVE4vRFg0eG1IY1JP?=
 =?utf-8?B?WkJ6OFltY1dmM1VZUzNUQ284VVZ2akUvdUUrNmlGd3ZRYzlGN0t3dWp4WHAr?=
 =?utf-8?B?UTdwUGFyYmJKVis4WXpnZXk0a3RqSlNkZ0tPOHZBQ1o1aE1MdWM1cEpFZi9h?=
 =?utf-8?B?UWpLVEZMN1U0akplcU8yMU8yOTEwWDdJWU16YXBjVjVqamJ3MHZmUWpFcTJ5?=
 =?utf-8?B?azhXck1rK0RkTVVDMHZvNTFBYjlOOWJ3TXQ4MjgzUVJQVFRnOUhEVFNvODlM?=
 =?utf-8?B?WWhWWnZoTklqaThCemVVb0c0dWx2RXN4eERZSEk0M2NqcSt1eXpNV294MGtW?=
 =?utf-8?Q?ZsAj2fMsYAvhGbWZ8vxskuLCbhZx/34aTEuVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6188.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(52116011)(366013)(38350700011); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW53emJ6a1I5VEJJSGdPUVhsYy83QS9NVmNweWhlTnhKa1ljbGtueEJ6ZzQw?=
 =?utf-8?B?OHpBZ1ZlT0VHNjQ1a2lsLzRtb3h0STNGWjZXc3ZzcE9lMEpwT0F1YnhYaWdu?=
 =?utf-8?B?T1lDYTNXMFpzckcwems5NnNRY1lzTFFtV3l5TlpieGd5aGNtaE5uaUwvSmZI?=
 =?utf-8?B?dHZmTWM1WnpMSVBheUkwNG1MUzFJcERyWkt3UWhlMWdMc3dVNFY0Nytxbytv?=
 =?utf-8?B?cHN5ckpBa2FhMDdveGZwblJDaXdEMVBVQW9tS0ttV25ZWFcxL0M4NEN0SzNP?=
 =?utf-8?B?M2NsaXpUd3RSbVkxYUI3N3JCN25sQi82VnB2aHJjU0sySlVxSEppTVp6SnVU?=
 =?utf-8?B?QWY5TDdlRnVzSjdKclBPdXU0MkMwRUdwRmZPYmdGYTZkZGEvSlh0SmVRTElq?=
 =?utf-8?B?dU5YS3lEeGVSVklVUUhPYXljemVEeXpGMW1FejgvMllJSzV3WlRLL1ZLUFpW?=
 =?utf-8?B?TjFuVWg1clliVUowMGdYWjRKYmRUaC9nZnl6TGxQZkNxSnZmc0xRWE1PVTVY?=
 =?utf-8?B?R2pyMDZqc3Z3Q3NxZ3JvM2EwTzhzcFQrc1hISWpJeFJBSXR6YU4yTTdiUVhX?=
 =?utf-8?B?TXhiZ1pPdGZIQVVSaXpldVFGVmJteS9vMjhGbGkzdlVndDdhN1EvV1phbi9T?=
 =?utf-8?B?MkM4Z3FkLzI2cCtvcFJDcmF3eVU4OTRWNmNLaEg1bEZXZWZta2N3dGJFcDE1?=
 =?utf-8?B?MWkwclBnYmpwaWNuTmkxMXhFV2lSNEZqVXRwQmRBbkxmaTd2VnhzVHcxc0VD?=
 =?utf-8?B?YytHL2ZLSExWWVNlTWlCREExYkhkQllCeUpyUGdVY0J3YUtOU2E2VFJ5ckhR?=
 =?utf-8?B?VEVxNXlFVFp0dEc0aGVaYTBBV1VrWlI2ZkpOMmc3R1VOcFhXRGpJSHNscnk1?=
 =?utf-8?B?WHlJaEE2aHdzb2dKdnM2akNNSit4TWhrMkhNOUJ6RGg4WEh4S3FiOTZqQ24w?=
 =?utf-8?B?WjZjZWRncmkycEdnVlRmVlk0WG1rU1V6eHJxQy85NDlGQ1ZKQ3MxZmFiZmZn?=
 =?utf-8?B?OE54WmZJMjErZ3gyZCtYY0xQTng2cEF6RnlpUHA4eTJFeCt6YThqZnFLeHV1?=
 =?utf-8?B?TXpkZlFQemxGVlk3Q244VUNqamR3RW52TVZGZnhwVHVIWmQyelM3dUlFdFFH?=
 =?utf-8?B?VE94UHNmdnNHbWhrUkVHQ2luK2FFeDBUQW9VTVVMYmJjdUNKQ1hqUXRiem5y?=
 =?utf-8?B?SjFiWnd5TUw3WUpYSG1Dc2dGREtCd3NLMVA2Y1V4MWZ1NTF6YlU4NnR0NmZU?=
 =?utf-8?B?S2dFVmNQVC9uODN6SksrQjB4QmkxTzlucS8rV0FkOFlOSS92SmJGMlBNTjdL?=
 =?utf-8?B?MGNQTUJKdVplRjdRb1VVcGxEcHBNVTJBR2IxYUJGbEkzNi9kVlZvMFN2QWF3?=
 =?utf-8?B?bm1LR2tTclQvRTdvdUkrdTV1VElUTmROOURPZEFtTGlVcm4wT2FaOWs4bkRR?=
 =?utf-8?B?cG45TE9IOVlxU2Qra3Q4YUQyNHZ0N2JyTjFOckpabGJmdG1LZG0vcHpILzkr?=
 =?utf-8?B?dzNSbmhPcE9YSUVHUzdZSTF1V282aU5XRW1OcTFuVUZNcEhkVVlhUXM2N2cv?=
 =?utf-8?B?dkRQV1E0akFtd0xtUU14YTBTQzNTb1J0cFNyOVBrUFpqeWM5RHlsVEo2N2dT?=
 =?utf-8?B?S0Q5TlBTd2s5eDB2bHoyd0pqMVN3VXMvMlJ6OVJ3TnZVU3ZSUzk0Y20zMFJT?=
 =?utf-8?B?MUE4TkJ1N2FydG1mOUc3SHNQNmVvbmtoOHpoeFMvaG5hcG43ZlB1UENZeFRR?=
 =?utf-8?B?cVh0NFhIQ2VIZytmczcvZk9nVXFISDFkLzAyL1liYm9OZkZwajJ5TmNlRjQy?=
 =?utf-8?B?ZlNUYm45MDFDK0h6ZnFNT05zSjYxZmExOUdhdCtrWGV1Uy9OK0ZLQXVIdkpr?=
 =?utf-8?B?aWcxcXByNGVCNVR4Y0RHMWZjNEdjUWMvVkFsUFlPUEVUN1RSanlxQW9LZUds?=
 =?utf-8?B?WlVvL09kWmRFM3dBdUYxNGZuU1dPR1AzRVdPbzJnaGhEb2owVG5MNEUxckVF?=
 =?utf-8?B?dTdOM1N3UlpyUUI0L3hyd3dxajBxUzRLSXZCL041cHlrQlNPK3h1Z01LSmZS?=
 =?utf-8?B?VnltRHM3TENxdTd1UjE4RHpvdkpFQmNGcVB3YlE5a3hMa29laDljZHlIOWVu?=
 =?utf-8?Q?EetS6Srax3DlJqt6++pPJuRxB?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7ae828-3fc1-4218-5342-08dc941cdc09
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6188.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 07:11:25.3380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o060mj9cvK7ENgOHgrxUnC09fRPriNsLdLiwwofIM7OEff7y/2wswmYsWSh9l4G281qaWgowdMjPLB5EsPLeXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063
X-Mailman-Approved-At: Mon, 24 Jun 2024 07:22:58 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Łukasz Spintzyk <Lukasz.Spintzyk@synaptics.com>

This is fixing some kernel panics on device unplug, that started to be
more visible after implementing cursor plane support.

Signed-off-by: Łukasz Spintzyk <Lukasz.Spintzyk@synaptics.com>
---
 drivers/gpu/drm/udl/udl_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1506094a8009..adaa7703c118 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2012 Red Hat
+ * Copyright (c) 2024 Synaptics Incorporated. All Rights Reserved.
  */
 
 #include <linux/module.h>
@@ -14,6 +15,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_print.h>
+#include <drm/drm_atomic_helper.h>
 
 #include "udl_drv.h"
 
@@ -129,6 +131,7 @@ static void udl_usb_disconnect(struct usb_interface *interface)
 	drm_kms_helper_poll_fini(dev);
 	udl_drop_usb(dev);
 	drm_dev_unplug(dev);
+	drm_atomic_helper_shutdown(dev);
 }
 
 /*
-- 
2.34.1

