Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BA291438E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EF810E380;
	Mon, 24 Jun 2024 07:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=synaptics.com header.i=@synaptics.com header.b="Er09ZNeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2109.outbound.protection.outlook.com [40.107.237.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBEF10E370
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9xil4iKrk1r8eOc7bvr7gH7Tvm3Lvg8cyWK8D3Qt7QU7RMcZAkk70wEKCpk2niIccIVZjpTTo8eqHKIz60P3tGChlsBQxwI5V9nAK81UHkcdABcrvIsisey1qsWDEwgi8GtfCRkcCo1C2DNRrNGGmQtsivz2PiON6vb2R863ZF5RVvqrAo76fM94IfPe3cFqM9NFzTabNmPyb1We6UmhDgb1QkMpmQVragZmqTW6vq5AssHv9j8DxTulD18GsMKadmUOWdVRASdaFq5DgTTUiV0LxtRvB1JtWNprpfYXSgmoz+PcYdS5PefzG1BXGzByCYH/NnEsDPdS3f2xT0xcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1qsqQxyeIkVl4m1ralVr8fCs/KQZ0LDaQY4i3NVcAw=;
 b=e9VTI5M17o1YxTnoVKlCmf2uiI+gDA85XOAWVtJJRkYeUGZ5jZFfM4S2zPbRtLzqpUdqsBc79j8TGE+Qt/r4APmz9wPGMMDjp6B9CPR1R1cPMPNq7U9F4Ez7SYrZCdGSkEmdrapflMoeBVb4CLPIA+JFrM5NLwQ+XQwwZZ+SnGSg6ErkDkwgxdF+UxNpu9RtDoginFLoq74YRXjYPhRO+6iipUbtaom/0bcY0O0GWdONLP8/EtlgfysquUxHvK/88IbjS0rL19d0tyDQM/AdFG0XVp7j/0lG3nQh5lJftu6iW83FdWdrjbn+XVwmRa/Stc1adVAa74qb5FI//V17Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1qsqQxyeIkVl4m1ralVr8fCs/KQZ0LDaQY4i3NVcAw=;
 b=Er09ZNeFJ4MfvB0dW1mHTDpPRVVBH9cQIl8pEJDtPCJEloPxaqS4G3wAREy0DIGV2xnOsKcHUZLczmNSRMFgto0m1HI3mm/9oSSgcHnRxkqb954AruFeO96e9iER2D0J9u24jzGi3wvpZcS3FpGrhSQvdl2Kx9SrwgBwdXurj20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 by BY5PR03MB5063.namprd03.prod.outlook.com (2603:10b6:a03:1e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 07:11:22 +0000
Received: from BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990]) by BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 07:11:22 +0000
From: lukasz.spintzyk@synaptics.com
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?=C5=81ukasz=20Spintzyk?= <Lukasz.Spintzyk@synaptics.com>
Subject: [PATCH 2/4] drm/udl: Add cursor drm_plane support
Date: Mon, 24 Jun 2024 09:10:39 +0200
Message-Id: <20240624071041.5087-3-lukasz.spintzyk@synaptics.com>
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
X-MS-Office365-Filtering-Correlation-Id: 60bd867f-f574-4986-d535-08dc941cda2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|1800799021|52116011|366013|38350700011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlpzMjVraytDKzZPY1ZsZnZkcXRydmNTZnp0ZXdzMG0yUU1PWlZvbFFmWFhE?=
 =?utf-8?B?cFRhR0UwbUJtZUhmcXZaS1dqWnRROFRjaXk5OWtxdlR2RmYzZDJIYVp0ZFhw?=
 =?utf-8?B?WDdHUnJWeTF1TnFqUGVucFdtRldaY09IWWd3elhoOEJtakhJS21TN1o0Nk1F?=
 =?utf-8?B?OVQrSFo3MXhiSGVKN2RkRnYxMXZmczBUaGZIcGRIQzUvT0dpb2U5UjFTNzdO?=
 =?utf-8?B?S3lXaXZrbCtndG5mdjI0cVUzeVFpZjM5KzJRTlgvSzdTZUxJai9yQ2tBMmMz?=
 =?utf-8?B?RlNDTWh0VzB1dlpwZzhUVGhHQmd2Rm5tWHhWRjlqVzZhTURVTWU2V0pTZ2JR?=
 =?utf-8?B?REVKb0RuamRCK0tKWFB0L2w1QlB1Z2FXM2NtelZaY3RJVEpnUW5Mckh0bnRX?=
 =?utf-8?B?QUNDME1kMStiMkFwUXd4VmJac1dZN05OUDNyanZWVVp0N2RhbVVGazZONWFL?=
 =?utf-8?B?c3RGZXJOdzEzdFhtcEtZUXYyTFZFUlhJaFYzZjZySUlQdlg5QjEvbnBVb3BU?=
 =?utf-8?B?YWRPeXhFUkJEeGlOaEpyVnVUNnd0Vm5qT0EvOHBVSmJjMDR2aGs0MXZobnlD?=
 =?utf-8?B?cXk5MmErMWZ0eGtueC81anVnMVpOMDRvWWxZT2FRcnZzekh0VHVxZzVNOXhE?=
 =?utf-8?B?WGJoWndJeU9CN3ZxWXpUSkNHNVdGMjlyRTdQcXlIWjhheFJKcU51SHVrc3Z1?=
 =?utf-8?B?cUx1UGVzcUVCWGZWOFJnVERORkhBL1lkekZxZ3lSN3BvNFdodkJUbExLc1M2?=
 =?utf-8?B?bHIvRVg3UmpuMVVMaFkzWlpRNUVDamJLWlRnZktXYWtIZGhXUVJBUzZBZ2JB?=
 =?utf-8?B?eHN0aUx1TmNhYU9OY1VkRkpVeERQS05Cdmw4N0pGTzl4ZjY1RDk5Nis5SHA5?=
 =?utf-8?B?aVlabGxxb09tUFVubTlMQ1MrMUwvSVM2THc1eDZUTStNWWp5UEVzU2ZqcjJ4?=
 =?utf-8?B?aUgvMDc0V084VWFiVTZBVzJLOWIzUlVEcmFjUG93cDJjeE5RQXh4TndzRXlm?=
 =?utf-8?B?U0tkelptVkJTVXRweXkwVGtMK2x4NDNsdHJ1cHZiMUduQlJid3VCbVVOd21h?=
 =?utf-8?B?WEtpQmx5OVNzWGNRK3FlcnYvMGx3Y0pncGx4M3NVbUNNS2xzRS9wdjBZSTRW?=
 =?utf-8?B?NTFuNG1TZVdXbFdPLzljRWpXcVFscE1pb0JjckxENmFkS083QXNJNy9yR0pJ?=
 =?utf-8?B?YStQZUpVNEE3M1JTNWRuN3VjK1Q4enZzTXJkR09lUEJTRHBVVkdKdDFtV3g2?=
 =?utf-8?B?QVAxRXNtYis0UFEydHFmbHZWcng3U3Z6bGNVeStHN3JMVTNQSG1EWWRNREtN?=
 =?utf-8?B?WEZYY1d6d2hzc0VSMit0RVVIUmZ4eUpZWktjMjlIU2hlanpOeE0xMUVmVlNt?=
 =?utf-8?B?aC9lWlJodWpjRTdSdUt1MFBITUVvS3VTc3ZRMVgrbjBNcVFZZmJMTDVTTVFE?=
 =?utf-8?B?M1NHMm1pdncyaVYvYkFqUGVCb1p1TFlQUTMrdThSLzJtZlB2M2lGUGt0S053?=
 =?utf-8?B?UDNQMjRxWkd3Rm1TN2QrSktGWjlUUCtGb3U5WU9mdVJoM1U5VUM3UE1NZDRB?=
 =?utf-8?B?TDRJaE13OU5XU0FScGlWWENkWk45NHZEbW1jd1ZGSVc3Tm5iMHVEaFRwQ3hx?=
 =?utf-8?B?MXltdnhQYSs3TFl4d3IzS2grRmllR2hSRjNTREF2dmJrS1doRDdXSXphU2xU?=
 =?utf-8?B?RkxaM3Y2RmpVU0JtcUt4aG5oUUJVMkRHY2Fla0ZhMHBwQXI0bUtLM2FVZ1pX?=
 =?utf-8?Q?LoRJlwThr68AMMsaEMPpWxW8BHs6CMgnWmjnIae?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6188.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(52116011)(366013)(38350700011); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0VWTnNCcGwzQW9nKzg3dzVoM0V0K3hkQm9tMnBZQTAwd1FmckYyWERrTFFI?=
 =?utf-8?B?SXRTVG53a2x3U2NPUkt4NHNSd2NNYm4zeHZmLysweG9IdGZNOEFPMFV2VlNJ?=
 =?utf-8?B?MUJnMSt0WHFNNlFSOTZjZzNlbHdodzNhY0RJcUVvcHk0cXpvdHRDbmRWUktR?=
 =?utf-8?B?WmRrR2I3dWpoUUxVSmhjL1VsTEtBUVBFNm1RM1RDS0lRS3Jnb1BCOFlrYkVX?=
 =?utf-8?B?cGFnZk1US3YwY2dQbThDSmlPK2VreDhFTlZ5LzZYYnVRdnlobjlrb3pDMEFt?=
 =?utf-8?B?ODk5ZlBvSU4yVGVxWnJOY0ZaZlNUekQ4RU1lN3pGM3h6cjFieStnS1YzSXBY?=
 =?utf-8?B?TFkzZVRYSklyQjdRRGRZbEhYdjlFUFpPVmhIQmY2L25OaUlXSkE0U3ZqMkNX?=
 =?utf-8?B?aXA0SGN2NHJzcnhzV0dJNm9SRWpzMWVDTkhGaFlEOUdHRFRUWTR4SHhoNll1?=
 =?utf-8?B?bk5sbjdFTGxOTTBaNFQ0d0FFdkF0ek02dDJ2bTlNTE02Y2tvdVJiMnAzS0gx?=
 =?utf-8?B?aVdnU2tUYldUb1lobDdORDNWYUx4T3pqcWEreTgzRS9qaXFESmlsMnE2UG01?=
 =?utf-8?B?dUlITU95QXF6bWJ0cnhRUmRYUENkKzR0ejdnZDFMQ0VSeU1vYi9uSHlDWHFS?=
 =?utf-8?B?UHdCdVF1cmZJYkcrcTlTL2VQa1FFemxIUEh0NWRFSmgyWWtrOGZMeGFmMzlk?=
 =?utf-8?B?NUo5NE81eExER1VPZm1XTFQvT0IvNDVXQ0cxMGd5TFBLMUdiK3dvNkpMNmVv?=
 =?utf-8?B?K3plSTRvUEYwRm85ZFlmcU40QU52R3ducWZwZDZCNVl6UlRkTmpPbXlsZGVM?=
 =?utf-8?B?ZkVuemJRUkZ5anlsUnpNQzkyeTNBRHZhWlJhUDdHS0R1dkJvMW12Y2xJekN5?=
 =?utf-8?B?TmwrWnQwODg1MUZuSEo3S01ZNExrYXV0OVVVYUY5RFhlb055VllpOEc3aHcx?=
 =?utf-8?B?cU8xc2lDa2dZMUhZSmk1UHhKTSs5RHhxWFk2ckVGZ08wL21wVGlVeU5HVFdE?=
 =?utf-8?B?cG5aenRiV1dCaE1lWlVvbDBiOU5TblBLdWt6YTBtNzZLb1lnSHIwMlA5SUlQ?=
 =?utf-8?B?WThkQk9ZRmdnb1laSXE3c3ZJenFoZTBiV1orcy8xblNnQm5IZnJ1M2F4Tmxw?=
 =?utf-8?B?MWNKekhwbUtKRDlmTXdnMlNVaG9Lc0pXZm1JZ2lWNStuMXhPVzR0cXR3SGlZ?=
 =?utf-8?B?N2NaMXE2K2k2ZGZaVzZzU212eTdJRG5KRHVGMWdrbkNZSFZUdS9RYXB3QUVq?=
 =?utf-8?B?VENndHQ1emwxN2pCTnU5SGNrQUs0R3FVUzAxSitrMkxuWnE4c3krZFBmNzY3?=
 =?utf-8?B?bjlKYkZNdjZCL2pMVEVyeW9ERG9RQWZjM2lBN2pib3Y1U2tic202MXl4VmVI?=
 =?utf-8?B?SDV4NlRWWU9KWVhsOXF6NVNuaUhoUmlSZHVESDdhbnJZS2tNTmtVOW9xb3VP?=
 =?utf-8?B?WVdBeGJXbkY2cm9pSGo1WEliTmdEZVpOQStRb0JPcHNmcHZ1NXJ3Zmx4TjRZ?=
 =?utf-8?B?ekVadFpjSWJjRGNyTzcyelg3T3Z0Y3ZqTDMzeG0rbUpOb2phY0FWSE5lQjR5?=
 =?utf-8?B?SnlHNkxPK1p0ZFBUa0YxODNiM2dRT1YwRVVhaUdlREtUYk9qUTlSeFJJcHpa?=
 =?utf-8?B?MHNJVVgyenRnNm9zSEdsOE8vSjl1b3R6SW5BUkI5NUY4ZjI0VFkvcUY4czdv?=
 =?utf-8?B?TGs2S2xTTXRuczA3d0Q4U3Z2TlhuT2p3dWxYdlhMMkZGUjd2VFhjTTFEdTQ5?=
 =?utf-8?B?b0RzTnN2V1Y0Wm5SSlFjQTZ5ckg0dktCczZSTnFuVk0wQUxRclorY2lwVjB6?=
 =?utf-8?B?WVIrREo5cnpVRGJleXFQK3lwcUd0RE8wcG8zMW1QNGE2alpPZC82V2ZnQm9O?=
 =?utf-8?B?RDVYUWZUQTkwQnpZUHdVWjFBMndXN0haSlh2U2pYY25FSmFYUUU2OFl4a0F5?=
 =?utf-8?B?Yno4bEZXY2NUOUVzeFNIdjBoZVRPZVJ4bXlFcVp5amdyTWJvVUhHQkdNbGVV?=
 =?utf-8?B?ZVNjVHdRM3pMSEF3dm5RYm5ucEVuQUVGN0J0TzJibHdQbUgrWENLSk0xRzdk?=
 =?utf-8?B?aUhFTi9kOGJHL2lxbWdISkZkSkN5V3RqeGNUdXJzY25MaHNKWldvVlp2TkZI?=
 =?utf-8?Q?gus6rRVQw7N87n1ExReB82vys?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bd867f-f574-4986-d535-08dc941cda2a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6188.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 07:11:22.2126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtNcinXNI6q1LV3Rx7Z0UST7sNYWGbqhFqedb0GPN1RZds64Qj8gfmngLCYxsgLoCAsWBcfHYaW2RJQZA44Mag==
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

Atomic support for cursor plane was inspired by evdi drm driver that is maintained on github.com/displaylink/evdi.
Also added ARGB8888 plane format as it is used by cursor plane.

Signed-off-by: Łukasz Spintzyk <Lukasz.Spintzyk@synaptics.com>
---
 drivers/gpu/drm/udl/udl_cursor.c  |  32 +++++++-
 drivers/gpu/drm/udl/udl_cursor.h  |   8 ++
 drivers/gpu/drm/udl/udl_drv.h     |   1 +
 drivers/gpu/drm/udl/udl_modeset.c | 129 +++++++++++++++++++++++++-----
 4 files changed, 150 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_cursor.c b/drivers/gpu/drm/udl/udl_cursor.c
index 594bb3b6b056..d60eccb704f4 100644
--- a/drivers/gpu/drm/udl/udl_cursor.c
+++ b/drivers/gpu/drm/udl/udl_cursor.c
@@ -3,6 +3,7 @@
  * udl_cursor.c
  *
  * Copyright (c) 2015 The Chromium OS Authors
+ * Copyright (c) 2024 Synaptics Incorporated. All Rights Reserved.
  *
  * This program is free software; you can redistribute  it and/or modify it
  * under  the terms of  the GNU General  Public License as published by the
@@ -69,10 +70,39 @@ int udl_cursor_download(struct udl_cursor *cursor,
 	return 0;
 }
 
-
 int udl_cursor_move(struct udl_cursor *cursor, int x, int y)
 {
 	cursor->x = x;
 	cursor->y = y;
 	return 0;
 }
+
+void udl_cursor_damage_clear(struct udl_cursor *cursor)
+{
+	cursor->damage.x1 = INT_MAX;
+	cursor->damage.y1 = INT_MAX;
+	cursor->damage.x2 = 0;
+	cursor->damage.y2 = 0;
+}
+
+void udl_rect_merge(struct drm_rect *rect, struct drm_rect *rect2)
+{
+	rect->x1 = min(rect->x1, rect2->x1);
+	rect->y1 = min(rect->y1, rect2->y1);
+	rect->x2 = max(rect->x2, rect2->x2);
+	rect->y2 = max(rect->y2, rect2->y2);
+}
+
+void udl_cursor_mark_damage_from_plane(struct udl_cursor *cursor, struct drm_plane_state *state)
+{
+	struct drm_rect rect;
+
+	rect.x1 = (state->crtc_x < 0) ? 0 : state->crtc_x;
+	rect.y1 = (state->crtc_y < 0) ? 0 : state->crtc_y;
+	rect.x2 = state->crtc_x + state->crtc_w;
+	rect.y2 = state->crtc_y + state->crtc_h;
+
+	udl_rect_merge(&cursor->damage, &rect);
+}
+
+
diff --git a/drivers/gpu/drm/udl/udl_cursor.h b/drivers/gpu/drm/udl/udl_cursor.h
index 6a848accc106..2375323bae55 100644
--- a/drivers/gpu/drm/udl/udl_cursor.h
+++ b/drivers/gpu/drm/udl/udl_cursor.h
@@ -3,6 +3,7 @@
  * udl_cursor.h
  *
  * Copyright (c) 2015 The Chromium OS Authors
+ * Copyright (c) 2024 Synaptics Incorporated. All Rights Reserved.
  *
  * This program is free software; you can redistribute  it and/or modify it
  * under  the terms of  the GNU General  Public License as published by the
@@ -27,12 +28,15 @@
 #define UDL_CURSOR_W 64
 #define UDL_CURSOR_H 64
 #define UDL_CURSOR_BUF (UDL_CURSOR_W * UDL_CURSOR_H)
+
 struct udl_cursor {
 	uint32_t buffer[UDL_CURSOR_BUF];
+	struct drm_rect damage; // damage on primary
 	bool enabled;
 	int x;
 	int y;
 };
+
 struct udl_cursor_hline {
 	uint32_t *buffer;
 	int width;
@@ -43,5 +47,9 @@ extern void udl_cursor_get_hline(struct udl_cursor *cursor, int x, int y,
 		struct udl_cursor_hline *hline);
 extern int udl_cursor_move(struct udl_cursor *cursor, int x, int y);
 extern int udl_cursor_download(struct udl_cursor *cursor, const struct iosys_map *map);
+void udl_cursor_damage_clear(struct udl_cursor *cursor);
+void udl_rect_merge(struct drm_rect *rect, struct drm_rect *rect2);
+void udl_cursor_mark_damage_from_plane(struct udl_cursor *cursor,
+		struct drm_plane_state *state);
 
 #endif
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index ccd813bec1a9..935bcabcd593 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -68,6 +68,7 @@ struct udl_device {
 	struct device *dmadev;
 
 	struct drm_plane primary_plane;
+	struct drm_plane cursor_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 21594144fec5..0bd4e2f02dcf 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2009 Roberto De Ioris <roberto@unbit.it>
  * Copyright (C) 2009 Jaya Kumar <jayakumar.lkml@gmail.com>
  * Copyright (C) 2009 Bernie Thompson <bernie@plugable.com>
+ * Copyright (c) 2024 Synaptics Incorporated. All Rights Reserved.
  */
 
 #include <linux/bitfield.h>
@@ -202,6 +203,23 @@ static long udl_log_cpp(unsigned int cpp)
 	return __ffs(cpp);
 }
 
+static void udl_trim_rect_to_framebuffer(
+				const struct drm_framebuffer *fb,
+				struct drm_rect *clip)
+{
+	if (clip->x1 > fb->width)
+		clip->x1 = fb->width;
+
+	if (clip->y1 > fb->height)
+		clip->y1 = fb->height;
+
+	if (clip->x2 > fb->width)
+		clip->x2 = fb->width;
+
+	if (clip->y2 > fb->height)
+		clip->y2 = fb->height;
+}
+
 static int udl_handle_damage(struct drm_framebuffer *fb,
 			     const struct iosys_map *map,
 			     const struct drm_rect *clip)
@@ -254,20 +272,21 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 }
 
 /*
- * Primary plane
+ * Primary and cursor planes
  */
 
-static const uint32_t udl_primary_plane_formats[] = {
+static const uint32_t udl_plane_formats[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
 };
 
-static const uint64_t udl_primary_plane_fmtmods[] = {
+static const uint64_t udl_plane_fmtmods[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
 };
 
-static int udl_primary_plane_helper_atomic_check(struct drm_plane *plane,
+static int udl_plane_helper_atomic_check(struct drm_plane *plane,
 						 struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
@@ -280,7 +299,36 @@ static int udl_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
 						   DRM_PLANE_NO_SCALING,
 						   DRM_PLANE_NO_SCALING,
-						   false, false);
+						   plane->type == DRM_PLANE_TYPE_CURSOR, false);
+}
+
+static void
+udl_cursor_plane_helper_atomic_update(struct drm_plane *plane,
+						   struct drm_atomic_state *state)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct udl_device *udl = to_udl(dev);
+	struct udl_cursor *cursor = &udl->cursor;
+
+	WARN_ON(old_plane_state->plane->type != DRM_PLANE_TYPE_CURSOR);
+
+	udl_cursor_move(cursor, plane_state->crtc_x, plane_state->crtc_y);
+	cursor->enabled = fb != NULL;
+
+	udl_cursor_mark_damage_from_plane(&udl->cursor, old_plane_state);
+	udl_cursor_mark_damage_from_plane(&udl->cursor, plane_state);
+
+	if (!fb)
+		return;
+
+	if (plane_state->fb == old_plane_state->fb)
+		return;
+
+	udl_cursor_download(cursor, &shadow_plane_state->data[0]);
 }
 
 static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
@@ -291,6 +339,7 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct udl_device *udl = to_udl(dev);
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int ret, idx;
@@ -305,24 +354,39 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	if (!drm_dev_enter(dev, &idx))
 		goto out_drm_gem_fb_end_cpu_access;
 
-	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
-	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		udl_handle_damage(fb, &shadow_plane_state->data[0], &damage);
+	if (plane_state->fb != old_plane_state->fb) {
+		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+		drm_atomic_for_each_plane_damage(&iter, &damage)
+			udl_handle_damage(fb, &shadow_plane_state->data[0], &damage);
 	}
 
+	udl_trim_rect_to_framebuffer(fb, &udl->cursor.damage);
+	udl_handle_damage(fb, &shadow_plane_state->data[0], &udl->cursor.damage);
+	udl_cursor_damage_clear(&udl->cursor);
+
 	drm_dev_exit(idx);
 
 out_drm_gem_fb_end_cpu_access:
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 }
 
-static const struct drm_plane_helper_funcs udl_primary_plane_helper_funcs = {
+static void
+udl_plane_helper_atomic_update(struct drm_plane *plane,
+			       struct drm_atomic_state *state)
+{
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		udl_cursor_plane_helper_atomic_update(plane, state);
+	else
+		udl_primary_plane_helper_atomic_update(plane, state);
+}
+
+static const struct drm_plane_helper_funcs udl_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = udl_primary_plane_helper_atomic_check,
-	.atomic_update = udl_primary_plane_helper_atomic_update,
+	.atomic_check = udl_plane_helper_atomic_check,
+	.atomic_update = udl_plane_helper_atomic_update,
 };
 
-static const struct drm_plane_funcs udl_primary_plane_funcs = {
+static const struct drm_plane_funcs udl_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
@@ -393,8 +457,20 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 	drm_dev_exit(idx);
 }
 
+static int udl_crtc_helper_atomic_check(struct drm_crtc *crtc,
+	struct drm_atomic_state *state)
+{
+	int ret;
+
+	ret = drm_crtc_helper_atomic_check(crtc, state);
+	if (ret)
+		return ret;
+
+	return drm_atomic_add_affected_planes(state, crtc);
+}
+
 static const struct drm_crtc_helper_funcs udl_crtc_helper_funcs = {
-	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_check = udl_crtc_helper_atomic_check,
 	.atomic_enable = udl_crtc_helper_atomic_enable,
 	.atomic_disable = udl_crtc_helper_atomic_disable,
 };
@@ -573,6 +649,7 @@ int udl_modeset_init(struct drm_device *dev)
 {
 	struct udl_device *udl = to_udl(dev);
 	struct drm_plane *primary_plane;
+	struct drm_plane *cursor_plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
@@ -589,20 +666,34 @@ int udl_modeset_init(struct drm_device *dev)
 	dev->mode_config.preferred_depth = 16;
 	dev->mode_config.funcs = &udl_mode_config_funcs;
 
+	cursor_plane = &udl->cursor_plane;
+	// Add cursor plane first as this is an order of plane atomic_update calls
+	// That allows to gather cursor damage before primary plane update
+	ret = drm_universal_plane_init(dev, cursor_plane, 0,
+				       &udl_plane_funcs,
+				       udl_plane_formats,
+				       ARRAY_SIZE(udl_plane_formats),
+				       udl_plane_fmtmods,
+				       DRM_PLANE_TYPE_CURSOR, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(cursor_plane, &udl_plane_helper_funcs);
+
 	primary_plane = &udl->primary_plane;
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
-				       &udl_primary_plane_funcs,
-				       udl_primary_plane_formats,
-				       ARRAY_SIZE(udl_primary_plane_formats),
-				       udl_primary_plane_fmtmods,
+				       &udl_plane_funcs,
+				       udl_plane_formats,
+				       ARRAY_SIZE(udl_plane_formats),
+				       udl_plane_fmtmods,
 				       DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret)
 		return ret;
-	drm_plane_helper_add(primary_plane, &udl_primary_plane_helper_funcs);
+	drm_plane_helper_add(primary_plane, &udl_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
 
+
 	crtc = &udl->crtc;
-	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, cursor_plane,
 					&udl_crtc_funcs, NULL);
 	if (ret)
 		return ret;
-- 
2.34.1

