Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E35B1207E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 17:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB0C10EA06;
	Fri, 25 Jul 2025 15:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="HGDvnuaI";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HGDvnuaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6A810E452
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:00:14 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Amp9ZRwbJgkRVLhpaCuqOG3CxSHtlpaXou3rNLvKilTtwuJ11QSKtRGhm3iO7nNy/DiQ9S32UMuUSqvYpnl1UlTRsz+zFFWemaH28vVE1UspORfMpyiZnM+puvTRthjEkLWLFNVL5eHt7Q2I5WpxesRRuz8G7h5BQnQfz30f2Fz+7AKHY2iKm3eVmBM/v5nsRR88XYiWJNaX6HpjtCvyrsER2uZFA8j27EfZL4FT4KNKGVxQDNhgMargpUzm96buVAibtbe5YzpEd9qyUTsVlqEOtwVcK4vpA++0fjQhti5velm3TTuDbauDuy99t2gkejWOBR6/YgiYJ8cXtJFwjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0NB25eAi/up1K3f2taKQ16Lsz+0UljFkXtckE5atNQ=;
 b=YmyjykKZQsOrC+zmEu0sSjWYTFSM/nxfzQ6rHTqj9fT7Na6bae50KkGGfIBZ163eqbVZYxDBO1+aguW+xAT+epHYsjWZyY+vH+j9T1gGNawYLTnlWFVnUlGM7R7E5tRvyrDIzDKjhZbzmBEVCUmcxqhTu1CuX8EN4ZP/XYMPRtcI0kTKEO1JefoAINzjVyZG6ZITzK/CbvJcTAsaJ6jQzPmk0ilERXRFDJqTw1+m4+NqcVg9LSlYSLuV9P38AB+Z105P09uefqCmOZeMZRK63UoWEmTCads9hG6MLeUcK4iRJ1Bi/cZIUXhFfc/ijwbZ/GHvkPUPLNzV1l3vfVGhEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0NB25eAi/up1K3f2taKQ16Lsz+0UljFkXtckE5atNQ=;
 b=HGDvnuaI/0UPfuE+fIxLQU2XtDzXLsYGTHIiKkMscrLgtcxarxEC70a/3x2Yhx7Y60vPs2ij8KRFSfldQ0xQNZX2+H3J0fedIpdpZGLWdorEk7iEsbcg9Jl835aRbtrDhhiN3PlKRuRGhipT77AF3+EdJlcMaoRgHOGxxpWqjXA=
Received: from CWLP265CA0478.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18a::22)
 by FRZPR08MB10902.eurprd08.prod.outlook.com (2603:10a6:d10:13b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 15:00:09 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:400:18a:cafe::2) by CWLP265CA0478.outlook.office365.com
 (2603:10a6:400:18a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 15:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 15:00:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1FzhsbO4qXp7Z6rV0D4Pynp5hK/UpH8PkPpjQ1SufuUCogHdXikW/3iN9eh5ec2vR0Jy+Ze9Ep0Z03kX9QlRo0uWPss5VH+dT3oY1XN6f82GD4Zy9wMGLvb/YnKXAKD2EVEPEDD8WGDEgvNLOpFucH6TKvMIi3dkifJI6H6nfUH9TUZEKkdBNVpjahTNTFOuz262iuomaOEvADZS0OxQRoSulUdnz3hB0mPuKVp8ymynbSXrktL5ZXZojGbVPa2Yvl90Ac8qHEj8BW2I8j5iLy7sRPEeG03TJiXxkyAfdHFli2ASH36yZX69yD0bIUnip05QpBorZS0twPehMfZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0NB25eAi/up1K3f2taKQ16Lsz+0UljFkXtckE5atNQ=;
 b=D7X1bL2VOgDu26lPcdHeiFU/QwcQTjq9Z9Qv60sS5UzJtyagpdF/uQ5mp8x20iMhoB3wB/ldNOG+RQqSR/BjNzks2+Meg0auqA880HTPHVJIk/z9xL5D8qTuVtX5Np2OtFFP7OhXISbLMcwXEteUYQXWFziT5B4Oy9y8GlkaxX3SwHVxy0xwC/c05j8964NSDBtDHaW3Ru3lzBiekbAaM+GTaUk4egUU9Dhwr5K7YeL6vx04PELTVBuclLsvJUJq3AnWPUNtDigauHe+uxeBmussJrQ1g+NNT9gD3YQQKWu539tFEfGzI48xr0F3vgboup+E6izuPCC+TBthXDd5Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0NB25eAi/up1K3f2taKQ16Lsz+0UljFkXtckE5atNQ=;
 b=HGDvnuaI/0UPfuE+fIxLQU2XtDzXLsYGTHIiKkMscrLgtcxarxEC70a/3x2Yhx7Y60vPs2ij8KRFSfldQ0xQNZX2+H3J0fedIpdpZGLWdorEk7iEsbcg9Jl835aRbtrDhhiN3PlKRuRGhipT77AF3+EdJlcMaoRgHOGxxpWqjXA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:59:36 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 14:59:36 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v5 7/7] drm/panthor: Expose the panthor perf ioctls
Date: Fri, 25 Jul 2025 15:57:58 +0100
Message-Id: <727fa1ec673d45abb51a393d4772cb0a861b409d.1753449448.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1753449448.git.lukas.zapolskas@arm.com>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::7) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|DU0PR08MB8471:EE_|AM3PEPF0000A79C:EE_|FRZPR08MB10902:EE_
X-MS-Office365-Filtering-Correlation-Id: 773bd907-7be4-4276-d2fe-08ddcb8bf288
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VFVnS2o2cktVV2hHRFovdlA3SndrMkpjbXQ2UlhPRU14eUxxNFFRSldwbG5H?=
 =?utf-8?B?aEFKcFdPaFNDTVFGeVVDRklyN2NYRzVGWVRHRU9tQ2h2ZWhkUFMwR3BTQktV?=
 =?utf-8?B?eGhqZE9MMTJDVE9KcUU4c3oreVEvN1BTMW1YaEhiMCt6V2szY0Q0T1Y2dlJB?=
 =?utf-8?B?cDUzejgvd0NKb2FEQVRRdkdPLy9pTXBWU0Q3N2I2aGQ3YTBTN0lWanRNVysz?=
 =?utf-8?B?UkNEdjNXY1NQaTliMVFqYS9yZTdUbzRncERPTVIzSUlYVU5VOUNSei9LNEFC?=
 =?utf-8?B?OVJSRVJBU1F0cTFzcGc4TlcyWnB0NUViM0Mxb2k2SWhjZFJ3RkJDbmhTZThP?=
 =?utf-8?B?amQvVSs0L0ZEMmxqOFR6bWcvQTVQR1lLNHJncjRxcDFOWWRNUVgxNWdtZzhk?=
 =?utf-8?B?aXZ1ZFdpbkR5UjZadFV1K2F5VHBjNERxVGRJMlpBSDY3a2dKamt5V1YxcXNW?=
 =?utf-8?B?UUxhUk8zcWFYRVAyQ3RhTzVmUzBwOGQvZThUSk9ldkZJUTdvMVhlaWxobWFQ?=
 =?utf-8?B?dGFic1JNUGRaOWxRT1dtSHFwa2kzVEE4SnlpK0hVemxyTnNFRFZtbXdLUldX?=
 =?utf-8?B?MFdTSHcxVlFpMjUwV2ZPM3VSTEtaeXlDU1VBRFVEbGk3THdkTGxpSjJydjVV?=
 =?utf-8?B?SCtNbjZIbTArcXd0Y3BTS2c2UUtLV2FRQmtRb3VRMFc0cDc4VmR3Sys5REJW?=
 =?utf-8?B?UjhjeDVGeW1KTjErOXZEbUdPRlNIYkJXQkhaYkRHVEQzenFveWY1czZVZlh1?=
 =?utf-8?B?SHdCYndaY3ZMbERxb0VLQjhaTGhWd1FPVkc2WW95aFgyaU9FVGhxUHo3R20v?=
 =?utf-8?B?UmZPL3J5b09wclBWaDVFdXhVRHBYb0xJYStnQ3BDM2JjTC8zMVVFU0ZlUnEy?=
 =?utf-8?B?YnpXNXoyRURWQWt5ZUtLTDBTNkdJTDFUUmZPZXZoQ1JHZ25WdDZ3Qm5pRnV3?=
 =?utf-8?B?T2JkUS9jR1Yzbkw5N1Jpa3RPOXFyMkVHVG5WNWhFMlY3WVkveTBUT0hiSGgy?=
 =?utf-8?B?NnJKeStmQ3F3Z0kraU9YQjQvUEJuWWlRYTRLalVRWGs3aFd1T2FrYk9GTkM2?=
 =?utf-8?B?RzlIZExCMUk5QXJKVDRlUnlZZGpYbHJ5ekJ1MW1vckloelJiMVNDRDRLYnQv?=
 =?utf-8?B?bDFmQ1VYUEtFemQ2M0lCUzRVL1BOTGxVZjYzMzE1WmpNNVRSUUtUdlR5cXBW?=
 =?utf-8?B?ZHkyQ2R6c1VWMzVnd2VBRVdWMmpObklBUi9WZ0cxWnMxRW9QYlk3OXhjNHAv?=
 =?utf-8?B?bFVoTUJvaHBYSzBRZCtTNVdPSjIyS1ViSFQ3T0ZVNFg4ZlVIbDR6QlVLK1o2?=
 =?utf-8?B?a1NGVnhrenZCWWRUSFhMeWlKcjVHYWJoV2JtYjhXSTM5TW9jeWZDS3VBVVFQ?=
 =?utf-8?B?MmNETG9JcWdpa0xDK1hTSEVneG9HUGlTcVljNG1NQUQ0VWJSTTJiYTAzS05O?=
 =?utf-8?B?VnBkMmNQTEY4SU9xNVk2c241SVFXZ0JBRVI4SStBYlJtdUJseTdsNEFyZDRF?=
 =?utf-8?B?N2VCdkRyeERJc0duRHZrUGdiM0haTmh3VktlZWdjOFQ5aEpSNlZrb013cFNO?=
 =?utf-8?B?U0JYRy9EUk42OEpIdTF1a1RWc2ZKSXoyWWJOdTNYQWNvVk5qa0cwUlcxU3ox?=
 =?utf-8?B?RHVOZmkrNGo4NVJXN0J2bWx6aEo0NDRUVzRqRi85bHdKMEx0c2E0WnBtV3dx?=
 =?utf-8?B?cmdYMkk0dkFoRGZ5WmVLL3M3YTRvREtoUXJPV2VZdWNEWVpQL3F5NE5wanNX?=
 =?utf-8?B?aVVUVUlEZlBEbU1ZWnhGTHYwRVEzVXgwcU9IVkFkOGVTalhFekNBQVdFbE8v?=
 =?utf-8?B?ZTZiMnFqUlVhVHB1c1VEK28yOGhzcW5xTGdWNTM4UGF3TDlMWVZhbVhPRHVS?=
 =?utf-8?B?M0FWVStjWTFGRXlFYllOOVRnN01YL2NQTytHOGV3SzI5QkNLQzJqM2hmeC9s?=
 =?utf-8?Q?DEahfrLv0T8=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0c474332-288f-4ddd-448f-08ddcb8bdf32
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlQzcUtzSmtiOFlXVE9jMUp3dy93ekZLRWErOWRCU2pZWVdZcmZMdUZRVVhF?=
 =?utf-8?B?U1BHTlVPRlJoNHg0eSsrbmJ1S0tkVTFTM2lpYUQ0V0RFQjhDeFJVMHNPMTk4?=
 =?utf-8?B?YlRUUUxrQTRKSnZuaENWZWM5SWZqdWJ0WUdWMjF1R2Eza21wckNlKzRlb21w?=
 =?utf-8?B?bXFuM2tvd3IzSDhnM0Izc1ozeC9mL0phZGllSFhQb2RXOU9OeTJDTG1XVEhs?=
 =?utf-8?B?RUJzNlQvTkZGRUEydTVxdExSdU1qdGRzbkkwMTFFKzdxODBLQkVYWEFqQVdm?=
 =?utf-8?B?Mjd2a3YvUlJRUFd0Z1RwOUIvYnVGMHpBak5iNVRIbWxTOHN5NXo0R0lYRy9J?=
 =?utf-8?B?WVIrT3VRS1NKVFVValVqRTdpRWt2SExLV1BmU1FPcHl4WkJFblphTlZwL1Yz?=
 =?utf-8?B?emhHWHFmb2piSEZpWG5QLzRWWUY5RXVnOFRPMklRUThnZTljdVJrSDlTSC9C?=
 =?utf-8?B?L25SSEJGZW1hcTNlZ25iQUlKb2VkVU1tb00rbWNLVlJPVkl6NnRTMmFRU3A5?=
 =?utf-8?B?bGtyMHkvbU1KNWsyd21NRGpBL0ZaemJUK3Z6eDRHeEtibUpnVnpxb0dWc3Q2?=
 =?utf-8?B?WVRkOEJpZ0VUckVnczhoY3I0a2EyREN5enlzQ01XRkZqeW1xOFNxZGxJeCt1?=
 =?utf-8?B?UmV0NlRKUjhaS01QQmFXT1JLdXIybjdtbk84ZWMyRDBzWGtKazN0T0tzcXQ0?=
 =?utf-8?B?TW56TmZlRGpYQUNieFJ3dUpjYXRIV01wam9QNzZFbUhpeVNUdytkQjFUenhZ?=
 =?utf-8?B?Z281ODdMUXhSYnBIdTN6RTBuSlpsMFJrUHRvbFlyTWVLQ1RFc3JQK0s3ZU9s?=
 =?utf-8?B?aktZalNwdytacXovVVZWSmpFQmUzNnBWaXVXVHE4QmpSYnhPRzZYRnZFdTJY?=
 =?utf-8?B?NGpKUkdoSGduSGdZTkFWaTZKRjkydHVRNDdTOVltK1ZyTVVndWI5aGwwMVNr?=
 =?utf-8?B?STN2a003V2NjaGF5UVJsbDd1RmhEM0JNTWZsb1ZybytoUmJJNWdzUnBSUVVu?=
 =?utf-8?B?OVZ0dXVJQU9vaUVpU1RmWllLL1RQeXhtR2J6T3hDa1FJSlBBcFVDRFpqR0dW?=
 =?utf-8?B?aG9oMjZnUDRaNGJzb3pIZTdKbFl1bUE5MmNVeVU2SUFJd0xMdmFKdFgxRXU4?=
 =?utf-8?B?UUtpQURZK0xwMVJ3dWo4elhvajRCak9pWjYyT2hUMUc3eFU2Nm5iVDVsOHQ3?=
 =?utf-8?B?SmRpTDY0blBIRXZPdGZGYXp4VXdLcGkvWmhxbU5hQWs1SllpSkJnQlFKVnB2?=
 =?utf-8?B?Sngrd0Y0a1VBZDh6cDc5VHROQmNnclNISVhXTkVucFllQ0hWMEp6K3I2TFNQ?=
 =?utf-8?B?SEVBRHA0YW9HSmszNzJJTjlBWGRSTXFUakNwS0ZWcVkvcHgySEZGSDM2ODJQ?=
 =?utf-8?B?VE1ZTWNIdmZEUHlXT1YvSlozNFdhL3JnTlljUUNkeUxHL0JJcXIrNFZ2Mity?=
 =?utf-8?B?b255bHlXc0RucjU3aWhwSmp2QkpsSWEydWNsU1dEM21hZkI0M3JjR3h2VWdK?=
 =?utf-8?B?UmN6anNGQ1MyNGUxbWNFWW05dXNNSGtuTHkzL3pWVzVIcUxzemZxa0xqYkZz?=
 =?utf-8?B?YzBFU2hlN3JYWHN1Wm9EMjdiT2g2MUZMUm1zKzA3Smx4Tm42YUZReFpVNmp2?=
 =?utf-8?B?NmZzNlFGNFB3ekxuZkRXeURHSmt6QWU4eERTWng0K2NsSVdnbXNCVWpIYVJM?=
 =?utf-8?B?UEZkT1k1dm9EMlZuSzYwYWlCVXA5YXM0blpaQlM1bk4wc0lGR2VFQ1did3Zt?=
 =?utf-8?B?QWhlZHkwbnlkUXJVSjlTVnJhOUQwSExSZU05T2tybHh2LzdaQVdIZ3Ayd2lo?=
 =?utf-8?B?MDJNZDBvVmM3TFJ0TVVaYmk3L0I4UEV6bmtLa3pxNUZlaWY4WEpWQVZlNE9a?=
 =?utf-8?B?Wlc0M1Y4eHpGQXJZcFNOMjUyWmFCbjhFQ1RVR3JBRnlUU3A1YTZFcDBsV1Nu?=
 =?utf-8?B?ZVFzYm1mNWJJMGtrT1grdG5mcERBNGk1REYyelIvazk1eHVJSmJyUkFEWEh0?=
 =?utf-8?B?SXBURlFQOXpRSGR3emdOZkxDWEY0SStKblp3V0VJWE1GZG5wOVZrUjVId2hr?=
 =?utf-8?Q?2p1A9W?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(14060799003)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 15:00:08.5400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 773bd907-7be4-4276-d2fe-08ddcb8bf288
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10902
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

This patch implements the PANTHOR_PERF_CONTROL ioctl series, and
a PANTHOR_GET_UOBJ wrapper to deal with the backwards and forwards
compatibility of the uAPI.

The minor version is bumped to indicate that the feature is now
supported.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 142 +++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 8b1e3e38b12e..05e3c83b8129 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -31,6 +31,7 @@
 #include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -73,6 +74,40 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
 	return 0;
 }
 
+/**
+ * panthor_get_uobj() - Copy user object to kernel object.
+ * @usr_ptr: Users pointer.
+ * @usr_size: Size of the user object.
+ * @min_size: Minimum size for this object.
+ * @kern_size: Kernel size of the object.
+ *
+ * Helper automating user -> kernel object copies.
+ *
+ * Don't use this function directly, use PANTHOR_UOBJ_GET() instead.
+ *
+ * Return: valid pointer on success, an encoded error code otherwise.
+ */
+static void*
+panthor_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size)
+{
+	int ret;
+	void *out_alloc __free(kvfree) = NULL;
+
+	/* User size shouldn't be smaller than the minimal object size. */
+	if (usr_size < min_size)
+		return ERR_PTR(-EINVAL);
+
+	out_alloc = kvmalloc(kern_size, GFP_KERNEL);
+	if (!out_alloc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = copy_struct_from_user(out_alloc, kern_size, u64_to_user_ptr(usr_ptr), usr_size);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return_ptr(out_alloc);
+}
+
 /**
  * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
  * @in: The object array to copy.
@@ -176,7 +211,11 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -191,6 +230,25 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
 			 sizeof(_src_obj), &(_src_obj))
 
+/**
+ * PANTHOR_UOBJ_GET() - Copies a user object from _usr_ptr to a kernel accessible _dest_ptr.
+ * @_dest_ptr: Local variable
+ * @_usr_size: Size of the user object.
+ * @_usr_ptr: The pointer of the object in userspace.
+ *
+ * Return: Error code. See panthor_get_uobj().
+ */
+#define PANTHOR_UOBJ_GET(_dest_ptr, _usr_size, _usr_ptr) \
+	({ \
+		typeof(_dest_ptr) _tmp; \
+		_tmp = panthor_get_uobj(_usr_ptr, _usr_size, \
+				PANTHOR_UOBJ_MIN_SIZE(_tmp[0]), \
+				sizeof(_tmp[0])); \
+		if (!IS_ERR(_tmp)) \
+			_dest_ptr = _tmp; \
+		PTR_ERR_OR_ZERO(_tmp); \
+	})
+
 /**
  * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
  * object array.
@@ -1402,6 +1460,83 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
 	return 0;
 }
 
+#define perf_cmd(command) \
+	({ \
+		struct drm_panthor_perf_cmd_##command *command##_args __free(kvfree) = NULL; \
+		int _ret = PANTHOR_UOBJ_GET(command##_args, args->size, args->pointer); \
+		if (_ret) \
+			return _ret; \
+		return panthor_perf_session_##command(pfile, ptdev->perf, args->handle, \
+						      command##_args->user_data); \
+	})
+
+static int panthor_ioctl_perf_control(struct drm_device *ddev, void *data,
+				      struct drm_file *file)
+{
+	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_panthor_perf_control *args = data;
+	int ret;
+
+	if (!args->pointer) {
+		switch (args->cmd) {
+		case DRM_PANTHOR_PERF_COMMAND_SETUP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_setup);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+			args->size = 0;
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_START:
+			args->size = sizeof(struct drm_panthor_perf_cmd_start);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_STOP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_stop);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+			args->size = sizeof(struct drm_panthor_perf_cmd_sample);
+			return 0;
+
+		default:
+			return -EINVAL;
+		}
+	}
+
+	switch (args->cmd) {
+	case DRM_PANTHOR_PERF_COMMAND_SETUP:
+	{
+		struct drm_panthor_perf_cmd_setup *setup_args __free(kvfree) = NULL;
+
+		ret = PANTHOR_UOBJ_GET(setup_args, args->size, args->pointer);
+		if (ret)
+			return -EINVAL;
+
+		return panthor_perf_session_setup(file, ptdev->perf, setup_args);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+	{
+		return panthor_perf_session_teardown(pfile, ptdev->perf, args->handle);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_START:
+	{
+		perf_cmd(start);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_STOP:
+	{
+		perf_cmd(stop);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+	{
+		perf_cmd(sample);
+	}
+	default:
+		return -EINVAL;
+	}
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1476,6 +1611,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1609,6 +1745,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
  * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
+ * - 1.6 - adds DEV_QUERY_PERF_INFO query
+ *       - adds PERF_CONTROL ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1622,7 +1760,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 5,
+	.minor = 6,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-- 
2.33.0.dirty

