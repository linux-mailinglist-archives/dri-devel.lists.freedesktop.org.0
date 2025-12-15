Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EDACBE5CB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 15:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E46A10E1F4;
	Mon, 15 Dec 2025 14:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="XsxfDH/0";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XsxfDH/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013000.outbound.protection.outlook.com
 [40.107.162.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE20E10E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:44:56 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LO28YUpcw8X20CvRXVhiwCJbJE1pboK6954nimFqljxUjevKSDU4QZH872PsDEjD/QG4QXz9NxmDi0zmKN9F4DuG8hTiVVlq0UhVKBXo32Wyy4TFIoU/U5wg5gxtP//wtEgequ7KLD+9K/znG4sjOpppQDAz4t4tFqENjn3M9OemTe0vUAeF/zFt8IMh3o571SueFtGKmRlg1n7lNHbXtpo2/7CI1eKQPOgHejQPBd109GcpVXIE8EMnyaXhWZh7wH0HJxUTzXkliEtj3GYiGXNRgHNJHCClMhdNpAJHChewLNxjuCczZDkrHRF+B1tI8G+3gzcRwJogZVGSwT60DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0Cl1VWrMzPvygUUZU9kc37Zi3+/IfVMVXud6rXg7jo=;
 b=mboUtxkBV4DNNNtkWM4K9QPgdIRgYjkqn/vWeKpK4HfiSJr7gDlebDB+k34xqsD1gs+keQaDuYbBTk7EeqjAcQAjTTU2M5xn3b2iyy314HqJwVBib6AKEMFMOyZ22jrGAy9GatDQyH1kiSLqX55jzF/x7vQU2yINvh8d/uhORI14+qPWTM13GOave1jPYJLqJCusvX1skVebW4RNuxh8HHzn494Hk/EwglpDCxUhgy7baAkFO6V/ZPxAJqMaEf5bco/daZscjLJO+5S8eWItN6ao/dXC84BTwksNYD+5lBgK3PWqbwx/IEACpTUcLC/Q6HzQoL60LR6oh7MOM+vdlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0Cl1VWrMzPvygUUZU9kc37Zi3+/IfVMVXud6rXg7jo=;
 b=XsxfDH/0hLBBqQ7HFYFb/ypWHcEeAc/DKpCVDcGckXJupFP9+pQk32+lyEnqk+8h70vuXp3Egz4XXUo6ln9Vb1uuxs/JXomXF2RK3mdeNPRMbn/j5z0S7xyAS4oB2PQy/9M6ayMz4oKn32OxQW27ABTV5N1Ey5BVZqmhb5/GYrY=
Received: from AS4P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::8)
 by AS8PR08MB10247.eurprd08.prod.outlook.com (2603:10a6:20b:629::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:44:46 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::61) by AS4P191CA0013.outlook.office365.com
 (2603:10a6:20b:5d5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 14:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 14:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A62uahEfim+x1UJ+gUvCRn6mLWxqv5yM2eXUhJXxUxsvLcUv9q/QLnORkW2d58ZdzUoeyH7KgyVNXUGMoFC8EQNpwyU2IH/CZiofk43ztlRwq7IULXaPzvIIKBfbXU6QpPrTC38dJNBNf+zYSXCK2RS52NcxP2qdmdu3ad6/XcqinamYxEBMs0h4pzK94ibYD/LfV80iW2vy5NIBSXSjcJa1ccJBGVYZnrb9vDHjth9fQL5AX0sKBBtDKaUKnmTOFM/wxPOFydyDMs93e1NPmEWVBdctW0lZrL2UUqg4Np/kvAl4cIK1a5MdLulCu6GlVwrSbUfrBp0OjnVCfmNOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0Cl1VWrMzPvygUUZU9kc37Zi3+/IfVMVXud6rXg7jo=;
 b=EcXH1KKSaTISgXf5u0TRrxWk5xU9TienFyyoAHEs6CBYgDJ94fwMZXVKLu1qGPHRp0zeogq53SlhaYTauSHFu1J/3urzUEpEUxN0GEEOPGd+xC+htuqHlyhM/JLQzSE7KSvAOQmaLyAHavZb3Iy/hbFXnouNNwJFFIpKyDxGN6sD1k0rSWiO0hGbnkV5wvLirwfOFkvLa25K1FIaKZ2E2z1xXUHhZEgZVExpn9gIRLqQ3FaO6Mu6WMC+G+B90cF5/wCQCKF0wgrbj0wYA7F3tF+Oqq8opLVEDxLI1VQC0t7Y3QwRjJ5xhD97jM3gSqfoP1utOY4z7dMpskbsy3kbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0Cl1VWrMzPvygUUZU9kc37Zi3+/IfVMVXud6rXg7jo=;
 b=XsxfDH/0hLBBqQ7HFYFb/ypWHcEeAc/DKpCVDcGckXJupFP9+pQk32+lyEnqk+8h70vuXp3Egz4XXUo6ln9Vb1uuxs/JXomXF2RK3mdeNPRMbn/j5z0S7xyAS4oB2PQy/9M6ayMz4oKn32OxQW27ABTV5N1Ey5BVZqmhb5/GYrY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by AS8PR08MB6213.eurprd08.prod.outlook.com (2603:10a6:20b:23d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:43:44 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 14:43:44 +0000
Message-ID: <f675addb-5e3f-41d7-935e-a60c59292c2e@arm.com>
Date: Mon, 15 Dec 2025 14:43:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/panthor: Introduce sampling sessions to handle
 userspace clients
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
 <1a56b67cf8849bc3a6140d2163a0206d03bb9a60.1753449448.git.lukas.zapolskas@arm.com>
 <gmsfigibuepnexjl5plh5ur6fi3pqhs3vy2pa3fbfck6j5nd6x@keexhnktnzc2>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <gmsfigibuepnexjl5plh5ur6fi3pqhs3vy2pa3fbfck6j5nd6x@keexhnktnzc2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0516.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::9) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|AS8PR08MB6213:EE_|AM3PEPF00009BA0:EE_|AS8PR08MB10247:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd558be-00b4-4c50-7848-08de3be87dfb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dDlwUXRXNU94TTBuM0J5SUl5L0c2V1VSN3NPNnc0UUZIdDhWeGhuVjJyZ1Ux?=
 =?utf-8?B?VzNvMS9CSVAzQTZSbGxoaTlIZDZmaUVBQ0YwU29DK29lbDIrK1FhcFc2QmV0?=
 =?utf-8?B?OGFNRkhBbk96MmdaTGlWMDcwWUNxZWVYSnFZcVgvL0U5UUwrc2VnV05UMUtl?=
 =?utf-8?B?cit1Ym52QnFsS2sySmFuT0ZOWnI0YXBDWjJVWExBMytDWGVnMTUzeUdSRFcy?=
 =?utf-8?B?dng4dWJLdDhFd0poNnVSRDNRb2o4b1JCN3AzYVlocW01NVVFSE9XVWFSR3pr?=
 =?utf-8?B?OTVkbUZGSzR6bldDbk1Ramg2TWxlMUUwTWx1ZUtQVkp1SEdwdDRweWFBSlFm?=
 =?utf-8?B?eThLSExxUXYxYm8xNm03ekM3WFU0WnNtQ0F2N0V0RlUzU2x6MG9MUWRmRUcv?=
 =?utf-8?B?TkdvZHBwM0I1MnFFRTFWRmNnaUEzNU55bXV6M2M4M05MeDFCWDR0c2N0OVA1?=
 =?utf-8?B?REJXYkMvclY0Z1d3ZENtVE4ybkUvMXJtQWpDK3puSUMyRHFCd3pyMENwSXAv?=
 =?utf-8?B?dFJzeVUyck9XRkgveEtudExTKzlCN2dqRU1ERnNEWlQwRzQrMnA5TmdPZFdm?=
 =?utf-8?B?V1hjVXZlQ3ZaeDZpY2RsS3lNUlg2RDgzK1o0bmZtK0d1WGZRS0lEdUpCNm12?=
 =?utf-8?B?S1ZjUXR1WDRKbEIyVEFYdlYrcW8wcUZBa3d4cGp0N3VjcE81VkxTMzZIemxW?=
 =?utf-8?B?Nm9FTU1nNlB5Vlo0LzJOVHlzQmlBdGJaaDJNN3hFdkM5Z3UxRG5oSmFVbW43?=
 =?utf-8?B?RnMvdkUvdHgxRnlXVW5TOGFBcC9lcTAzeFRranpmdkhRYURKWGd6b3ljeVQw?=
 =?utf-8?B?dGF5VUljNGJ1eHdXOFVJeVlOcXJ6WGxBdm8wSkk4OTE2YnBKcmVNNWZQTWtV?=
 =?utf-8?B?SVAyckRQS3BtZllFcjlCSTJPVVJRNUtOVE5pTG5PUSt0ZTA0UTl4d096bVBD?=
 =?utf-8?B?Mlk0YjJlUTEyNEo2dis2Z0piUUJ1SnFHRUIrTGlsMmw3UTZ2aFJSWnJjNnZW?=
 =?utf-8?B?MHRhKzMwSG16UjRQa1YwOGFubnNnUE50Umd6azJib05uNExZakFDZGp3ZUVo?=
 =?utf-8?B?Mzk0Z2R3czdjZDNEWEU1bGNoeHVoOHA4NTFaam85MlNSUjBrZEs4UjNxT3hZ?=
 =?utf-8?B?L3FHdzREdUhUZXA0NDliZmwvZ3hIYXF0TWY1Uzg0L3k5OTVqcE9hREI1QUJw?=
 =?utf-8?B?YVlsSjNNUXhaOFU5VFdiL1RmUjh4cUZmdk1hT2pxNVNvRmJyUzdoOUV0MFRi?=
 =?utf-8?B?V1M3WkpYQXlCcDc5cjFEVGZGZG94a3FUaEJCaWdWelg1K3BpY21mSTdLNmNV?=
 =?utf-8?B?T3hzZ0RNYTdIQlN6N241RlhEcUJYSGdteUlRMDZkcTZHVzFmQmo3WXV5UlpK?=
 =?utf-8?B?KzIzU1RJWFRsOWZhcStJZ0pwVWw3NlJYMkJsZ0hQNG44cEVIRVUxWm05MG9p?=
 =?utf-8?B?MEp0d3RBbDhRNERXenAxTmtRUWRZaVQ5Njg2STA4OHRieHQwUkFVZFVoQjZh?=
 =?utf-8?B?RUZVUnBEclFLMHVYME00M1haYncwK1pnTzE3aFhzcExuYlhEempOUEpIazdE?=
 =?utf-8?B?aHVONFhsWVU0a0dZcWNHenRDbURyVlVmVEFDcGpuTUZoQUgwQU1SWmV3S0JJ?=
 =?utf-8?B?S29pT1dDMWNnNGtId2lDd044a1B2V290eUxjMUc3MW1MNW13MEk1aUk3bGVE?=
 =?utf-8?B?UFZieE5FKzZWMGRmUU45Mkc2MlZ4ZVZVVTZFTFdqSENhbGtGVzhRWjRZLyt5?=
 =?utf-8?B?OVBYSE1SUHhJTlNkS2pKd3BMMHorcUFmMW5LWUw2cElFWk9BNFErem5hc2E2?=
 =?utf-8?B?THRXMG5tekNCTWxwMmRaUVgwU1RjYVJPZ2tHcVhLOGVLZlZCRlQ1Y3UzaC80?=
 =?utf-8?B?NDFpMWlYR3pRUURIMUNndXZ2M1h0UW85Y28yWHZBZHhxSzZvZmlreTBiWWpk?=
 =?utf-8?Q?Ia8wlV81ayB/yT41yIQyOae/XBq46BWk?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6213
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f8a5b7f0-1be8-4c8b-ca2c-08de3be8587a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2RJM2c2M1lMK0tuemFmUXhvWlcwaVgvZDdhQ3VqcDVuRGlYYnAyOERMZnI5?=
 =?utf-8?B?S0VtZW1SZUFaRUhtRW9RVEhuc1ljQjl5WEJSc0lSZzJHeW95ZVQxd2Rqb3Ru?=
 =?utf-8?B?KzRxWG0rb09OQVJLWlR2MU1tMTlkemE2QWZhbGxpb0V0d2Z1NDNmOVFWTTRV?=
 =?utf-8?B?NC8xdnZUT29pbU1sbjhhMTM4RDJPaFZsbCtCYmQ0bGNWS2N6QjhmU0grTXhz?=
 =?utf-8?B?L1BQZXhzYW5aSGxsSjlRVHlJVUtxVnFLSDJrRk56RHRHbVJObjN2UDU3NnhQ?=
 =?utf-8?B?aUV1d0tVSDhkdkh6VTRMSzBJSVVCRTVsanZBaXFmNlhWaVIrMDJWRE9jWDNP?=
 =?utf-8?B?UHFCcnIwNVRseEhBOWh0cHBnanJUWHNBdUxwNjVpbllTV2xwUGR1eE10SG8v?=
 =?utf-8?B?ZXJjZWMyTjBLYmo3ZEFOVE1SOTM0dFI3V3k0R2NnWEI2LzZXalNsNDNUdnJ4?=
 =?utf-8?B?WllIREZFQ0dZUG43cWV0ZFpuMDJXeXBBSGVXVE44V1d0NHpueStCT2taSEth?=
 =?utf-8?B?WExDelNXSkh3TUhra1U2WjExN2w3K0xCZS9XU0xSVVNnZEFWSGt6bHl1S2Nz?=
 =?utf-8?B?WWRwSzV4cU43M1dtK0lrVzZKVkVSU0FKNjNOaXNtV3NCWC9uZTNzSzhIbFpQ?=
 =?utf-8?B?U1AwRmJuQS9oYVVhOFU2Rk1iVHRMODd6aUovR1I5eU9pdHJCNHlDNldhU2Zx?=
 =?utf-8?B?VHF0TzNRSXdocXJTWXRDMlYvOVRvYXZyUmx2U25FcEdKc1JIaXBJVWhNcy85?=
 =?utf-8?B?ZHZuTDBlQ284SldHRDFvVWR3Y1JuNk1qc3NlS3lKbW9IRFUyeFRGOEFlTEpl?=
 =?utf-8?B?azR1cUVYL0l1QUV6ZFFlRDAwRkhjMTUwdEh1LzczQStJVWM0clpHSXZWRnRV?=
 =?utf-8?B?MmZ3dHI5KzFwRXVaMktRaDF4aFNKNkRVVS9BMWVsOUhRL0FWVlpnaU94QmFF?=
 =?utf-8?B?UmNldGw4d3hiVGFrZ2gvZVhybFBvcUt4d01xVUZIZVRrY2R6VXZpcWg4TWl6?=
 =?utf-8?B?eVdHZGprMVdaMGNlZ1pHTmlWSTNlWTRkdmhtS0dTaWhuRmMzNklDc0l4bG93?=
 =?utf-8?B?SlRZdWs0NG5pZW92RXRlYVgxVnpnYlE1U0R3d0hXdm9IdFhGTGhrQ2hTRS9s?=
 =?utf-8?B?WlliNGxna212SjBJWWhuWktlYTZna2drZG9JdlEyMnFMSXRzUUF2TmplU2FZ?=
 =?utf-8?B?c1UvNzJITi82UVEvTXQ0cndJQnllNlZZNGNJcm42b2tYeWpGcklsSElzTFZn?=
 =?utf-8?B?RWIzZm5JWGJZc1RNSW5NYTF0K1Q2NlhXa3RDZnlFMmgvZlhPb0k0MkN2SVhj?=
 =?utf-8?B?OUs4ZDFwQXFNVG0xdzdwSnhhSFE1RGlldUUxaG5aMzVUd2tmQk1Vd2RwMEFR?=
 =?utf-8?B?ZncxajV4WDJSeEhZSi9ncWFqbHFndjlFTjhSaVNpNTBLc0ljaWM3dzZSbTRX?=
 =?utf-8?B?NXh1bms1VFFWeHFCMnBYYTJLL3JaL1pvRjFac21NOUJzSkxhWmJGRjVmenlJ?=
 =?utf-8?B?VnJyc2ZFeDZyYnNoblRtb05tS0tGckMzUEtMSmRFR0dIK3NCelJCenJUUkg1?=
 =?utf-8?B?TW1qd2JhbStyYkxXYXZrSFlVZy96SmNsWnR2ZEFHMVdYbkp6eklNU0JvNkxx?=
 =?utf-8?B?OGhuTmhnd21selJZS0ZPVm96cjRhSVd4ekhRSldTZ3p4UkFtVkdReDVvYjMw?=
 =?utf-8?B?Q0FUclRpbTJiTEJGMVR1c0tORXI3TWg1MFR6NEFVMFlnQ2JqeWZSMnRGNUZo?=
 =?utf-8?B?aXdtQStRbmxwdDZESnVVMWFnQVNFbDZ5VFhSTmtLdVZNbFVJMk5QZDBqekdN?=
 =?utf-8?B?ZjZWYTlSVUl1QmZ4NnhETk43TTQxUnFzaEl5RmZuRkNKVzBjNEJoeFlMVFRs?=
 =?utf-8?B?UWJaa0Nrc0p4b1lsYTBHWmtvaENDdG1lY216bDdyWWk2bjhsY0F1RWsycWVI?=
 =?utf-8?B?WEJzRHArUG5Fclc1MkhxeGUrZnVLbHFTMG9FdHkvZGVKS0ozRXlQVDA5eWU5?=
 =?utf-8?B?b0M1cDU4NEZpM05DNCttdUNkUWR4M01QWGl4MnhZU1daRkZMU0FZL1JWZGtH?=
 =?utf-8?B?R2NvVGlmNE9xSHZXdUp5WSsxeURwYXRLNVFUOHA5SkhSNEFJWERHdGdiak9T?=
 =?utf-8?Q?TBjo=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(14060799003)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:44:46.4290 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd558be-00b4-4c50-7848-08de3be87dfb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10247
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

Hello Adrián, 

On 11/08/2025 15:28, Adrián Larumbe wrote:
> Hi Lukas,
> 
> On 25.07.2025 15:57, Lukas Zapolskas wrote:
>> To allow for combining the requests from multiple userspace clients,
>> an intermediary layer between the HW/FW interfaces and userspace is
>> created, containing the information for the counter requests and
>> tracking of insert and extract indices. Each session starts inactive
>> and must be explicitly activated via PERF_CONTROL.START, and
>> explicitly stopped via PERF_CONTROL.STOP. Userspace identifies a
>> single client with its session ID and the panthor file it is
>> associated with.
>>
>> The SAMPLE and STOP commands both produce a single sample when called,
>> and these samples can be disambiguated via the opaque user data field
>> passed in the PERF_CONTROL uAPI. If this functionality is not desired,
>> these fields can be kept as zero, as the kernel copies this value into
>> the corresponding sample without attempting to interpret it.
>>
>> Currently, only manual sampling sessions are supported, providing
>> samples when userspace calls PERF_CONTROL.SAMPLE, and only a single
>> session is allowed at a time. Multiple sessions and periodic sampling
>> will be enabled in following patches.
>>
>> No protection is provided against the 32-bit hardware counter
>> overflows, so for the moment it is up to userspace to ensure that
>> the counters are sampled at a reasonable frequency.
>>
>> The counter set enum is added to the uapi to clarify the restrictions
>> on calling the interface.
>>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_perf.c | 706 ++++++++++++++++++++++++-
>>  drivers/gpu/drm/panthor/panthor_perf.h |  16 +
>>  2 files changed, 716 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index af1c58e70a78..d1f984b3302a 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -2,14 +2,179 @@
>>  /* Copyright 2023 Collabora Ltd */
>>  /* Copyright 2025 Arm ltd. */
>>
>> -#include <linux/bitops.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>>  #include <drm/panthor_drm.h>
>> +#include <linux/bitops.h>
>> +#include <linux/circ_buf.h>
>>
>>  #include "panthor_device.h"
>>  #include "panthor_fw.h"
>>  #include "panthor_perf.h"
>>  #include "panthor_regs.h"
>>
>> +/**
>> + * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
>> + *                        to the maximum number of counters available for selection on the newest
>> + *                        Mali GPUs (128 as of the Mali-Gx15).
>> + */
>> +#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
>> +
>> +enum panthor_perf_session_state {
>> +	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
>> +	PANTHOR_PERF_SESSION_ACTIVE = 0,
>> +
>> +	/**
>> +	 * @PANTHOR_PERF_SESSION_OVERFLOW: The session encountered an overflow in one of the
>> +	 *                                 counters during the last sampling period. This flag
>> +	 *                                 gets propagated as part of samples emitted for this
>> +	 *                                 session, to ensure the userspace client can gracefully
>> +	 *                                 handle this data corruption.
>> +	 */
>> +	PANTHOR_PERF_SESSION_OVERFLOW,
>> +
>> +	/* Must be last */
>> +	PANTHOR_PERF_SESSION_MAX,
>> +};
>> +
>> +struct panthor_perf_enable_masks {
>> +	/**
>> +	 * @mask: Array of bitmasks indicating the counters userspace requested, where
>> +	 *        one bit represents a single counter. Used to build the firmware configuration
>> +	 *        and ensure that userspace clients obtain only the counters they requested.
>> +	 */
>> +	unsigned long mask[DRM_PANTHOR_PERF_BLOCK_MAX][BITS_TO_LONGS(PANTHOR_PERF_EM_BITS)];
>> +};
>> +
>> +struct panthor_perf_counter_block {
>> +	struct drm_panthor_perf_block_header header;
>> +	u64 counters[];
>> +};
>> +
>> +/**
>> + * enum session_sample_type - Enum of the types of samples a session can request.
>> + */
>> +enum session_sample_type {
>> +	/** @SAMPLE_TYPE_NONE: A sample has not been requested by this session. */
>> +	SAMPLE_TYPE_NONE,
>> +
>> +	/** @SAMPLE_TYPE_INITIAL: An initial sample has been requested by this session. */
>> +	SAMPLE_TYPE_INITIAL,
>> +
>> +	/** @SAMPLE_TYPE_REGULAR: A regular sample has been requested by this session. */
>> +	SAMPLE_TYPE_REGULAR,
>> +};
>> +
>> +struct panthor_perf_session {
>> +	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
> 
> Do we need this to be a bitmap? It would seem from the description of the states
> that so far they're disjoint, in the sense that no session can go through overflow
> without being active first. And then I'm assuming going from session stop to
> session active would maybe entail toggling the overflow bit too?
> 

We don't really need this to be a bitmap, no. It was convenient at the time, but it could very well 
be just the enum value. The session active will transition to overflow, which should then go into 
inactive, and then to active again, in order to clear the overflow. 

>> +
>> +	/**
>> +	 * @pending_sample_request: The type of sample request that is currently pending:
>> +	 *                          - when a sample is not requested, the data should be accumulated
>> +	 *                            into the next slot of its ring buffer, but the extract index
>> +	 *                            should not be updated, and the user-space session must
>> +	 *                            not be signaled.
>> +	 *                          - when an initial sample is requested, the data must not be
>> +	 *                            emitted into the target ring buffer and the userspace client
>> +	 *                            must not be notified.
>> +	 *                          - when a regular sample is requested, the data must be emitted
>> +	 *                            into the target ring buffer, and the userspace client must
>> +	 *                            be signalled.
>> +	 */
>> +	enum session_sample_type pending_sample_request;
>> +
>> +	/**
>> +	 * @user_sample_size: The size of a single sample as exposed to userspace. For the sake of
>> +	 *                    simplicity, the current implementation exposes the same structure
>> +	 *                    as provided by firmware, after annotating the sample and the blocks,
>> +	 *                    and zero-extending the counters themselves (to account for in-kernel
>> +	 *                    accumulation).
>> +	 *
>> +	 *                    This may also allow further memory-optimizations of compressing the
>> +	 *                    sample to provide only requested blocks, if deemed to be worth the
>> +	 *                    additional complexity.
>> +	 */
>> +	size_t user_sample_size;
>> +
>> +	/**
>> +	 * @accum_idx: The last insert index indicates whether the current sample
>> +	 *                   needs zeroing before accumulation. This is used to disambiguate
>> +	 *                   between accumulating into an intermediate slot in the user ring buffer
>> +	 *                   and zero-ing the buffer before copying data over.
>> +	 */
>> +	u32 accum_idx;
>> +
>> +	/**
>> +	 * @sample_freq_ns: Period between subsequent sample requests. Zero indicates that
>> +	 *                  userspace will be responsible for requesting samples.
>> +	 */
>> +	u64 sample_freq_ns;
>> +
>> +	/** @sample_start_ns: Sample request time, obtained from a monotonic raw clock. */
>> +	u64 sample_start_ns;
>> +
>> +	/**
>> +	 * @user_data: Opaque handle passed in when starting a session, requesting a sample (for
>> +	 *             manual sampling sessions only) and when stopping a session. This handle
>> +	 *             allows the disambiguation of a sample in the ringbuffer.
>> +	 */
>> +	u64 user_data;
>> +
>> +	/**
>> +	 * @eventfd: Event file descriptor context used to signal userspace of a new sample
>> +	 *           being emitted.
>> +	 */
>> +	struct eventfd_ctx *eventfd;
>> +
>> +	/**
>> +	 * @enabled_counters: This session's requested counters. Note that these cannot change
>> +	 *                    for the lifetime of the session.
>> +	 */
>> +	struct panthor_perf_enable_masks *enabled_counters;
>> +
>> +	/** @ringbuf_slots: Slots in the user-facing ringbuffer. */
>> +	size_t ringbuf_slots;
>> +
>> +	/** @ring_buf: BO for the userspace ringbuffer. */
>> +	struct drm_gem_object *ring_buf;
>> +
>> +	/**
>> +	 * @control_buf: BO for the insert and extract indices.
>> +	 */
>> +	struct drm_gem_object *control_buf;
>> +
>> +	/** @control: The mapped insert and extract indices. */
>> +	struct drm_panthor_perf_ringbuf_control *control;
>> +
>> +	/** @samples: The mapping of the @ring_buf into the kernel's VA space. */
>> +	u8 *samples;
>> +
>> +	/**
>> +	 * @pending: The list node used by the sampler to track the sessions that have not yet
>> +	 *           received a sample.
>> +	 */
>> +	struct list_head pending;
>> +
>> +	/**
>> +	 * @sessions: The list node used by the sampler to track the sessions waiting for a sample.
>> +	 */
>> +	struct list_head sessions;
>> +
>> +	/**
>> +	 * @pfile: The panthor file which was used to create a session, used for the postclose
>> +	 *         handling and to prevent a misconfigured userspace from closing unrelated
>> +	 *         sessions.
>> +	 */
>> +	struct panthor_file *pfile;
>> +
>> +	/**
>> +	 * @ref: Session reference count. The sample delivery to userspace is asynchronous, meaning
>> +	 *       the lifetime of the session must extend at least until the sample is exposed to
>> +	 *       userspace.
>> +	 */
>> +	struct kref ref;
>> +};
>> +
>>  struct panthor_perf {
>>  	/** @next_session: The ID of the next session. */
>>  	u32 next_session;
>> @@ -23,11 +188,6 @@ struct panthor_perf {
>>  	struct xarray sessions;
>>  };
>>
>> -struct panthor_perf_counter_block {
>> -	struct drm_panthor_perf_block_header header;
>> -	u64 counters[];
>> -};
>> -
>>  static size_t get_annotated_block_size(size_t counters_per_block)
>>  {
>>  	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
>> @@ -73,6 +233,125 @@ static void panthor_perf_info_init(struct panthor_device *const ptdev)
>>  	perf_info->sample_size = session_get_user_sample_size(perf_info);
>>  }
>>
>> +static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
>> +								*const setup_args)
>> +{
>> +	struct panthor_perf_enable_masks *const em = kmalloc(sizeof(*em), GFP_KERNEL);
>> +
>> +	if (IS_ERR_OR_NULL(em))
>> +		return em;
>> +
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_FW],
>> +			  setup_args->fw_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW],
>> +			  setup_args->cshw_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER],
>> +			  setup_args->tiler_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS],
>> +			  setup_args->memsys_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER],
>> +			  setup_args->shader_enable_mask, PANTHOR_PERF_EM_BITS);
>> +
>> +	return em;
>> +}
>> +
>> +static u64 session_read_extract_idx(struct panthor_perf_session *session)
>> +{
>> +	const u64 slots = session->ringbuf_slots;
>> +
>> +	/* Userspace will update their own extract index to indicate that a sample is consumed
>> +	 * from the ringbuffer, and we must ensure we read the latest value.
>> +	 */
>> +	return smp_load_acquire(&session->control->extract_idx) % slots;
>> +}
>> +
>> +static u64 session_read_insert_idx(struct panthor_perf_session *session)
>> +{
>> +	const u64 slots = session->ringbuf_slots;
>> +
>> +	/*
>> +	 * Userspace is able to write to the insert index, since it is mapped
>> +	 * on the same page as the extract index. This should not happen
>> +	 * in regular operation.
>> +	 */
> 
> So when could it happen?

Misconfiguration, for instance. Short of mapping the indicates on different page boundaries and having them 
have different protection bits, I don't know if we can prevent that from happening.

> 
>> +	return smp_load_acquire(&session->control->insert_idx) % slots;
>> +}
>> +
>> +static void session_get(struct panthor_perf_session *session)
>> +{
>> +	kref_get(&session->ref);
>> +}
>> +
>> +static void session_free(struct kref *ref)
>> +{
>> +	struct panthor_perf_session *session = container_of(ref, typeof(*session), ref);
>> +
>> +	if (session->samples && session->ring_buf) {
>> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->samples);
>> +
>> +		drm_gem_vunmap(session->ring_buf, &map);
>> +		drm_gem_object_put(session->ring_buf);
>> +	}
>> +
>> +	if (session->control && session->control_buf) {
>> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->control);
>> +
>> +		drm_gem_vunmap(session->control_buf, &map);
>> +		drm_gem_object_put(session->control_buf);
>> +	}
>> +
>> +	kfree(session->enabled_counters);
>> +
>> +	eventfd_ctx_put(session->eventfd);
>> +
>> +	kfree(session);
>> +}
>> +
>> +static void session_put(struct panthor_perf_session *session)
>> +{
>> +	kref_put(&session->ref, session_free);
>> +}
>> +
>> +/**
>> + * session_find - Find a session associated with the given session ID and
>> + *                panthor_file.
>> + * @pfile: Panthor file.
>> + * @perf: Panthor perf.
>> + * @sid: Session ID.
>> + *
>> + * The reference count of a valid session is increased to ensure it does not disappear
>> + * in the window between the XA lock being dropped and the internal session functions
>> + * being called.
>> + *
>> + * Return: valid session pointer or an ERR_PTR.
>> + */
>> +static struct panthor_perf_session *session_find(struct panthor_file *pfile,
>> +						 struct panthor_perf *perf, u32 sid)
>> +{
>> +	struct panthor_perf_session *session;
>> +
>> +	if (!perf)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	xa_lock(&perf->sessions);
>> +	session = xa_load(&perf->sessions, sid);
>> +
>> +	if (!session || xa_is_err(session)) {
>> +		xa_unlock(&perf->sessions);
>> +		return ERR_PTR(-EBADF);
>> +	}
>> +
>> +	if (session->pfile != pfile) {
>> +		xa_unlock(&perf->sessions);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	session_get(session);
>> +	xa_unlock(&perf->sessions);
>> +
>> +	return session;
>> +}
>> +
>>  /**
>>   * panthor_perf_init - Initialize the performance counter subsystem.
>>   * @ptdev: Panthor device
>> @@ -110,6 +389,415 @@ int panthor_perf_init(struct panthor_device *ptdev)
>>  	return ret;
>>  }
>>
>> +static int session_validate_set(u8 set)
>> +{
>> +	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
>> +		return -EINVAL;
>> +
>> +	if (set == DRM_PANTHOR_PERF_SET_PRIMARY)
>> +		return 0;
>> +
>> +	if (set > DRM_PANTHOR_PERF_SET_PRIMARY)
>> +		return capable(CAP_PERFMON) ? 0 : -EACCES;
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_setup - Create a user-visible session.
>> + *
>> + * @ptdev: Handle to the panthor device.
>> + * @perf: Handle to the perf control structure.
>> + * @setup_args: Setup arguments passed in via ioctl.
>> + * @pfile: Panthor file associated with the request.
>> + *
>> + * Creates a new session associated with the session ID returned. When initialized, the
>> + * session must explicitly request sampling to start with a successive call to PERF_CONTROL.START.
>> + *
>> + * Return: non-negative session identifier on success or negative error code on failure.
>> + */
>> +int panthor_perf_session_setup(struct drm_file *file, struct panthor_perf *perf,
>> +			       struct drm_panthor_perf_cmd_setup *setup_args)
>> +{
>> +	struct panthor_file *pfile = file->driver_priv;
>> +	struct panthor_device *ptdev = pfile->ptdev;
>> +	struct panthor_perf_session *session;
>> +	struct drm_gem_object *ringbuffer;
>> +	struct drm_gem_object *control;
>> +	const size_t slots = setup_args->sample_slots;
>> +	struct panthor_perf_enable_masks *em;
>> +	struct iosys_map rb_map, ctrl_map;
>> +	size_t user_sample_size;
>> +	int session_id;
>> +	int ret;
>> +
>> +	ret = session_validate_set(setup_args->block_set);
>> +	if (ret) {
>> +		drm_err(&ptdev->base, "Did not meet requirements for set %d\n",
>> +			setup_args->block_set);
>> +		return ret;
>> +	}
>> +
>> +	session = kzalloc(sizeof(*session), GFP_KERNEL);
>> +	if (ZERO_OR_NULL_PTR(session))
>> +		return -ENOMEM;
>> +
>> +	ringbuffer = drm_gem_object_lookup(file, setup_args->ringbuf_handle);
>> +	if (!ringbuffer) {
>> +		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->ringbuf_handle);
>> +		ret = -EINVAL;
>> +		goto cleanup_session;
>> +	}
>> +
>> +	control = drm_gem_object_lookup(file, setup_args->control_handle);
>> +	if (!control) {
>> +		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->control_handle);
>> +		ret = -EINVAL;
>> +		goto cleanup_ringbuf;
>> +	}
>> +
>> +	user_sample_size = session_get_user_sample_size(&ptdev->perf_info) * slots;
>> +
>> +	if (ringbuffer->size != PFN_ALIGN(user_sample_size)) {
>> +		drm_err(&ptdev->base,
>> +			"Incorrect ringbuffer size from userspace: user %zu vs kernel %lu\n",
>> +			ringbuffer->size, PFN_ALIGN(user_sample_size));
>> +
>> +		ret = -ENOMEM;
>> +		goto cleanup_control;
>> +	}
>> +
>> +	ret = drm_gem_vmap(ringbuffer, &rb_map);
>> +	if (ret)
>> +		goto cleanup_control;
>> +
>> +	ret = drm_gem_vmap(control, &ctrl_map);
>> +	if (ret)
>> +		goto cleanup_ring_map;
>> +
>> +	session->eventfd = eventfd_ctx_fdget(setup_args->fd);
>> +	if (IS_ERR(session->eventfd)) {
>> +		drm_err(&ptdev->base, "Invalid eventfd %d!\n", setup_args->fd);
>> +		ret = PTR_ERR_OR_ZERO(session->eventfd) ?: -EINVAL;
>> +		goto cleanup_control_map;
>> +	}
>> +
>> +	em = panthor_perf_create_em(setup_args);
>> +	if (IS_ERR_OR_NULL(em)) {
>> +		ret = -ENOMEM;
>> +		goto cleanup_eventfd;
>> +	}
>> +
>> +	INIT_LIST_HEAD(&session->sessions);
>> +	INIT_LIST_HEAD(&session->pending);
>> +
>> +	session->control = ctrl_map.vaddr;
>> +	*session->control = (struct drm_panthor_perf_ringbuf_control) { 0 };
>> +
>> +	session->samples = rb_map.vaddr;
>> +
>> +	/* TODO This will need validation when we support periodic sampling sessions */
>> +	if (setup_args->sample_freq_ns) {
>> +		ret = -EOPNOTSUPP;
>> +		goto cleanup_em;
>> +	}
>> +
>> +	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
>> +			      &perf->next_session, GFP_KERNEL);
>> +	if (ret < 0) {
>> +		drm_err(&ptdev->base, "System session limit exceeded.\n");
>> +		ret = -EBUSY;
>> +		goto cleanup_em;
>> +	}
>> +
>> +	kref_init(&session->ref);
>> +	session->enabled_counters = em;
>> +
>> +	session->sample_freq_ns = setup_args->sample_freq_ns;
>> +	session->user_sample_size = user_sample_size;
>> +	session->ring_buf = ringbuffer;
>> +	session->ringbuf_slots = slots;
>> +	session->control_buf = control;
>> +	session->pfile = pfile;
>> +	session->accum_idx = U32_MAX;
>> +
>> +	return session_id;
>> +
>> +cleanup_em:
>> +	kfree(em);
>> +
>> +cleanup_eventfd:
>> +	eventfd_ctx_put(session->eventfd);
>> +
>> +cleanup_control_map:
>> +	drm_gem_vunmap(control, &ctrl_map);
>> +
>> +cleanup_ring_map:
>> +	drm_gem_vunmap(ringbuffer, &rb_map);
>> +
>> +cleanup_control:
>> +	drm_gem_object_put(control);
>> +
>> +cleanup_ringbuf:
>> +	drm_gem_object_put(ringbuffer);
>> +
>> +cleanup_session:
>> +	kfree(session);
>> +
>> +	return ret;
>> +}
>> +
>> +static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
>> +			u64 user_data)
>> +{
>> +	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return 0;
>> +
>> +	const u64 extract_idx = session_read_extract_idx(session);
>> +	const u64 insert_idx = session_read_insert_idx(session);
>> +
>> +	/* Must have at least one slot remaining in the ringbuffer to sample. */
>> +	if (WARN_ON_ONCE(!CIRC_SPACE(insert_idx, extract_idx, session->ringbuf_slots)))
>> +		return -EBUSY;
>> +
>> +	session->user_data = user_data;
>> +
>> +	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
>> +
>> +	/* TODO Calls to the FW interface will go here in later patches. */
>> +	return 0;
>> +}
>> +
>> +static int session_start(struct panthor_perf *perf, struct panthor_perf_session *session,
>> +			 u64 user_data)
>> +{
>> +	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return 0;
>> +
>> +	set_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
>> +
>> +	/*
>> +	 * For manual sampling sessions, a start command does not correspond to a sample,
>> +	 * and so the user data gets discarded.
>> +	 */
>> +	if (session->sample_freq_ns)
>> +		session->user_data = user_data;
>> +
>> +	/* TODO Calls to the FW interface will go here in later patches. */
>> +	return 0;
>> +}
>> +
>> +static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
>> +			  u64 user_data)
>> +{
>> +	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return 0;
>> +
>> +	const u64 extract_idx = session_read_extract_idx(session);
>> +	const u64 insert_idx = session_read_insert_idx(session);
> 
> Maybe defer reading the indices until you need them in CIRC_SPACE_TO_END()
> 
>> +
>> +	/* Manual sampling for periodic sessions is forbidden. */
>> +	if (session->sample_freq_ns)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Must have at least two slots remaining in the ringbuffer to sample: one for
>> +	 * the current sample, and one for a stop sample, since a stop command should
>> +	 * always be acknowledged by taking a final sample and stopping the session.
>> +	 */
>> +	if (CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots) < 2)
>> +		return -EBUSY;
>> +
>> +	session->sample_start_ns = ktime_get_raw_ns();
>> +	session->user_data = user_data;
>> +
>> +	return 0;
>> +}
>> +
>> +static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
>> +{
>> +	session_put(session);
>> +
>> +	return 0;
>> +}
>> +
>> +static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
>> +{
>> +	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return -EINVAL;
>> +
>> +	if (READ_ONCE(session->pending_sample_request) == SAMPLE_TYPE_NONE)
>> +		return -EBUSY;
> 
> Are we sure we don't want != here instead?
> 

!= is definitely correct here, thanks for spotting it. 

>> +
>> +	return session_destroy(perf, session);
>> +}
>> +
>> +/**
>> + * panthor_perf_session_teardown - Teardown the session associated with the @sid.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the perf control structure.
>> + * @sid: Session identifier.
>> + *
>> + * Destroys a stopped session where the last sample has been explicitly consumed
>> + * or discarded. Active sessions will be ignored.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf, u32 sid)
>> +{
>> +	int err;
>> +	struct panthor_perf_session *session;
>> +
>> +	xa_lock(&perf->sessions);
>> +	session = __xa_store(&perf->sessions, sid, NULL, GFP_KERNEL);
>> +
>> +	if (xa_is_err(session)) {
>> +		err = xa_err(session);
>> +		goto restore;
>> +	}
>> +
>> +	if (session->pfile != pfile) {
>> +		err = -EINVAL;
>> +		goto restore;
>> +	}
>> +
>> +	session_get(session);
>> +	xa_unlock(&perf->sessions);
>> +
>> +	err = session_teardown(perf, session);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +
>> +restore:
>> +	__xa_store(&perf->sessions, sid, session, GFP_KERNEL);
>> +	xa_unlock(&perf->sessions);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_start - Start sampling on a stopped session.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @sid: Session identifier for the desired session.
>> + * @user_data: An opaque value passed in from userspace.
>> + *
>> + * A session counts as stopped when it is created or when it is explicitly stopped after being
>> + * started. Starting an active session is treated as a no-op.
>> + *
>> + * The @user_data parameter will be associated with all subsequent samples for a periodic
>> + * sampling session and will be ignored for manual sampling ones in favor of the user data
>> + * passed in the PERF_CONTROL.SAMPLE ioctl call.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
>> +			       u32 sid, u64 user_data)
>> +{
>> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>> +	int err;
>> +
>> +	if (IS_ERR_OR_NULL(session))
>> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
>> +
>> +	err = session_start(perf, session, user_data);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_stop - Stop sampling on an active session.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @sid: Session identifier for the desired session.
>> + * @user_data: An opaque value passed in from userspace.
>> + *
>> + * A session counts as active when it has been explicitly started via the PERF_CONTROL.START
>> + * ioctl. Stopping a stopped session is treated as a no-op.
>> + *
>> + * To ensure data is not lost when sampling is stopping, there must always be at least one slot
>> + * available for the final automatic sample, and the stop command will be rejected if there is not.
>> + *
>> + * The @user_data will always be associated with the final sample.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
>> +			      u32 sid, u64 user_data)
>> +{
>> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>> +	int err;
>> +
>> +	if (IS_ERR_OR_NULL(session))
>> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
>> +
>> +	err = session_stop(perf, session, user_data);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_sample - Request a sample on a manual sampling session.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @sid: Session identifier for the desired session.
>> + * @user_data: An opaque value passed in from userspace.
>> + *
>> + * Only an active manual sampler is permitted to request samples directly. Failing to meet either
>> + * of these conditions will cause the sampling request to be rejected. Requesting a manual sample
>> + * with a full ringbuffer will see the request being rejected.
>> + *
>> + * The @user_data will always be unambiguously associated one-to-one with the resultant sample.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
>> +				u32 sid, u64 user_data)
>> +{
>> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>> +	int err;
>> +
>> +	if (IS_ERR_OR_NULL(session))
>> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
>> +
>> +	err = session_sample(perf, session, user_data);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_destroy - Destroy a sampling session associated with the @pfile.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @pfile: The file being closed.
>> + *
>> + * Must be called when the corresponding userspace process is destroyed and cannot close its
>> + * own sessions. As such, we offer no guarantees about data delivery.
>> + */
>> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf)
>> +{
>> +	unsigned long sid;
>> +	struct panthor_perf_session *session;
>> +
>> +	if (!pfile || !perf)
>> +		return;
>> +
>> +	xa_for_each(&perf->sessions, sid, session)
>> +	{
>> +		if (session->pfile == pfile) {
>> +			session_destroy(perf, session);
>> +			xa_erase(&perf->sessions, sid);
>> +		}
>> +	}
>> +}
>> +
>>  /**
>>   * panthor_perf_unplug - Terminate the performance counter subsystem.
>>   * @ptdev: Panthor device.
>> @@ -125,8 +813,14 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>>  		return;
>>
>>  	if (!xa_empty(&perf->sessions)) {
>> +		unsigned long sid;
>> +		struct panthor_perf_session *session;
>> +
>>  		drm_err(&ptdev->base,
>>  			"Performance counter sessions active when unplugging the driver!");
>> +
>> +		xa_for_each(&perf->sessions, sid, session)
>> +			session_destroy(perf, session);
>>  	}
>>
>>  	xa_destroy(&perf->sessions);
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index e4805727b9e7..c46f94ed8a96 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -7,10 +7,26 @@
>>
>>  #include <linux/types.h>
>>
>> +struct drm_file;
>> +struct drm_panthor_perf_cmd_setup;
>>  struct panthor_device;
>> +struct panthor_file;
>> +struct panthor_perf;
>>
>>  int panthor_perf_init(struct panthor_device *ptdev);
>>  void panthor_perf_unplug(struct panthor_device *ptdev);
>>
>> +int panthor_perf_session_setup(struct drm_file *file, struct panthor_perf *perf,
>> +			       struct drm_panthor_perf_cmd_setup *setup_args);
>> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
>> +				  u32 sid);
>> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
>> +			       u32 sid, u64 user_data);
>> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
>> +			      u32 sid, u64 user_data);
>> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
>> +				u32 sid, u64 user_data);
>> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
>> +
>>  #endif /* __PANTHOR_PERF_H__ */
>>
>> --
>> 2.33.0.dirty
> 
> 
> Adrian Larumbe

