Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E171C2E0BC
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 21:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5989210E48E;
	Mon,  3 Nov 2025 20:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Y1yiZ6AS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y1yiZ6AS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235B810E492;
 Mon,  3 Nov 2025 20:35:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vhl09djwwrttwLUgPgvMEHvkGdoeQ/P/zS1422FEdvZ5rXBFahHu1w4awGmcT1bDL6L+CAJYg5DW4gGLl4f8CbCQ/3jeKzGApub5RFcGynwdIxC+jRz9KMHq+vl60MMaAX6366mAda0QsWo55VInMwefNFX3wPbotebwR3onjzp/O2aXpIRr6DbQZlACbAq8m2pPgh1VdOi5Zr6Uj/eCTysRPFby/JOlVYa8lDVoU1UwBeKNFSp8rCffyhCwyW92rS9irmoptvJjOken3K/fgWruMcj+FS6v/NSjWCkJ/85kPJ85/CXMQaJm0d3HwYHBYL4zb8picBLVF+5V4133kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByeA4YKC4/BFyxnyP1RNeikd33Lpi/8y28ume2oVFk0=;
 b=gCKelL89rKCD0rVy4gCBunykzkmodLdru6aljE6InDiQti+J/vneOAqnYZ0eXWoCQ+Q7U4jmnhD4Rf+0wVGaSi4ycJ+2E0lq57IrUbA6uB7xbDtevtgli+D4ler7x8tVkH5gqE5GcpGovHqoUyeiMTLwiep0OBQ248BJ3HHBbqFtBw8u8WH9gTjLaE8vpHw825VxNT9jLjyAD1RdedyjhIL8pbgffoGIB7FQENiCnsWGBulZmx8pWY2X4H0iD8CmGR1MIfR5WsPp8FRKV5Y2LOxRP7ASGXGKHpNsC3g+UcsdFuZsMg1ATbxd6JBhf9uSyp2KhuklPgkKTWiRyI0FyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByeA4YKC4/BFyxnyP1RNeikd33Lpi/8y28ume2oVFk0=;
 b=Y1yiZ6ASgQsubSbTEOaB3RecpaE6NYc4tYH+2Fr/b17mALfVuKaWx3nA91B0KDvbgdOuVWJsQJkI1E/MAi/x+0LEWUzk0MynCR3FR+ZIW5KaVmwC95mzr8Uepso8NHrPkpscZpYD3S6oQvBxrlX7PTVZoyyQuQCbl2NxEr06sIw=
Received: from AS9PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:20b:46a::12)
 by AS8PR08MB6248.eurprd08.prod.outlook.com (2603:10a6:20b:298::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 20:35:13 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a:cafe::94) by AS9PR04CA0054.outlook.office365.com
 (2603:10a6:20b:46a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 20:34:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 20:35:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhzqyjmMBMX/PsTA9f7SKEHpuMe5RpWvClzH5DdyGBIV+VzmqzVXNCO1zlLw9UqgbGtETLCYHoY8mtbWA9hC1BKwllsGJNQB1PokKrEVBxMipY+5j7J9C34zwadV0pZMzt06Onxpl7/XRlVD2QhMgVdUqVX42hHT7rHtGVY+3rBc8pXp+W07Q38/9lX/Y6oCa0YP2if7JO4M9mb8NJt2CBV5nkmFy0zP1KzEe6O1FxHIAmBGK738Mwm0vtalpQPRTvgMZH/yR5fLPV3Ep4x3cmImqxK9MJjUXB6d7dPIH0FG8oZMgf3GD75nB9HgrrXcDMbA0DebillPbVs7f7NA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByeA4YKC4/BFyxnyP1RNeikd33Lpi/8y28ume2oVFk0=;
 b=xQFGta1MB9gts5OtWfgugb1kwuQcP2dClqbJBZTMFeheGBWIOqAcA6tD1bZB1B48pjgAZSDpFjso9MdYUC87GLKwSe6Tm0z+xPhcCsuiIdm0zVj0ZXt4NyUGXhyle6hkVtNTx5f+M+Vodg+cY4t/6cg67tKMwRvrhjLbTyNH8deVGW1Jri2HfjdupmDQQmyOHXi1YdyOffUvqV6bNHiLaOEOpauqnrGO5IlnnGODUK7ZTU0dJxrFPlngDpCrS/IZAnnA9igHE2Bx/hf8xvLm9P1aCknMh/B8wBBSShipK5qPY790tWmOBH+hmhGQE6NABBFeQfOQ8UrKuwbzNAwmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByeA4YKC4/BFyxnyP1RNeikd33Lpi/8y28ume2oVFk0=;
 b=Y1yiZ6ASgQsubSbTEOaB3RecpaE6NYc4tYH+2Fr/b17mALfVuKaWx3nA91B0KDvbgdOuVWJsQJkI1E/MAi/x+0LEWUzk0MynCR3FR+ZIW5KaVmwC95mzr8Uepso8NHrPkpscZpYD3S6oQvBxrlX7PTVZoyyQuQCbl2NxEr06sIw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PR3PR08MB5643.eurprd08.prod.outlook.com (2603:10a6:102:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 20:34:41 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 20:34:41 +0000
Message-ID: <662c54eb-1ecb-4383-9405-a2d200a0bea6@arm.com>
Date: Mon, 3 Nov 2025 20:34:39 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] drm/shmem: Provide a generic {begin,
 end}_cpu_access() implementation
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-3-boris.brezillon@collabora.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20251030140525.366636-3-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0263.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::12) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PR3PR08MB5643:EE_|AM3PEPF00009BA0:EE_|AS8PR08MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd06b3b-6611-42a1-0cf0-08de1b187dda
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?d0Zmb2JtOUZFTkpLSHcxSFk4U202ZnFRbDRsQ2xHKzVUSzZNM2k5a2dxa09x?=
 =?utf-8?B?TWZIYmFWRmR1enJGNFZrTzBDaHB2R0xIRzlrb25BOU91NG04SDhuV1A5Sm93?=
 =?utf-8?B?cDZwOEZ1Yjd4SXNaNGhFVWZ4ZjVTVWcwZjVmNXUraURPNG9zcU16NUFMdlFT?=
 =?utf-8?B?T0VXaVZ1Nk5XYzZpWHl4TmE3R1JkU2p5c3kveEdZWjJObVpkTEV2dndQSEYv?=
 =?utf-8?B?REp5THJpS3hyTWxjNWJVWWFkTmE4eXpzWXFORGtlRVltbkU4azJDME9zc3g5?=
 =?utf-8?B?S3o2Vk02WFQ1R2dLdVhTdlpNajBERlBnM0F6S0FuQWFLaXprL2UycWdORFNQ?=
 =?utf-8?B?MXVwUFo0Y01CaVRSTXpjWXBIL1ZMekFCN2ppSVBrQUFBRDh4R05RdXppNW1o?=
 =?utf-8?B?ekt6WmwzOEhxUldKQVNJMXZ4L040akIzeDBGblhIQUE3WUgyOTR5WUFwOUUy?=
 =?utf-8?B?cTEycHFnWlRlMDViVEpBSzczUlFFQ2NvUHJ6WjRuR1pSOTFOa1p2UysrSEFZ?=
 =?utf-8?B?MllPb0lSa1E5K2RwS2VjeSt5dHJsYWhsdXV6T05sR3VUeFhMalJHMXdmT3Jr?=
 =?utf-8?B?NjJyM01XOGxKMi84Mm5OVEc0OW4vYWo5YXlNczFkQStDN0VITHFpVnE1dE1w?=
 =?utf-8?B?VHFXQVB2dVF4Nk9xendodEVRUDYvSEJWbTlxQUZxOVdHYTQ1RldvUWRXYThh?=
 =?utf-8?B?WThaVUFXZHpmYi9KcXlZT1RWSkdTYmM0YlU2SUVsb2V0VVAxOVhtMW1EODB6?=
 =?utf-8?B?NEo3QUY5SFJlNzFvaWFsb0tCWFlsTW9VQy80Qi8vK0c2dnloNWovemNGYnN3?=
 =?utf-8?B?TzBsNUVsWUdncnFEN0xXeDdnNnV6a2ZTOTdJV1VQREwwM0lNc2Z1T1RhSWY0?=
 =?utf-8?B?OEVIbktEUDRQcVAzZ0tNYkN3SVFnVUZzbTlTdmwyNWNnenhNQlRBMVhSMEFH?=
 =?utf-8?B?UTRidkQvZkwyL1VEVUxMMUdhajRlQmhFZlU2T0NqSTIyTXc4cmV0SXhJb3BQ?=
 =?utf-8?B?MC9mb2NhaHh3dFVVWWVnMEp6eHc4RHpZOW9qK2dIZ1FLQUt3aG1rZkh1b1BR?=
 =?utf-8?B?SW5BV1hKYWUrOUQzRzg5dFI0WDQvNVl5d2h1RkVWZ0NkRmxPRVUvemFuNHBS?=
 =?utf-8?B?ckJ4blJyRGJwZ0s0SXRrZVZqbnc1a1FvQWNYeEVRWmpWRGNZZUkvTHFvc0Nj?=
 =?utf-8?B?eHpJdkQwZVFyeXc2dkJzMzVkYS9iUW5sZklVVVB1NExQOVF6Ym5SMDdZVUIr?=
 =?utf-8?B?Q1lYZk1wd0RHOUtIMDhmN3ZGcFI2SmJ3MDFoOVl0aUVSUDlFZTRKQnJSbzBm?=
 =?utf-8?B?ckQ0YUVCcFR5NlUrYmQwbGEyNHBrQ0RzWFhVNlpKVElIRWRlTUtvd0hkdjdZ?=
 =?utf-8?B?ZTN6WlFhNWNJYXJBdVZESnowNGNNWVM1VFJCdlRKbG81NW9ERHYwUVU3Y09y?=
 =?utf-8?B?Y0k5eCtSQzRKUUNwclNNUGF1WS8xMTJVcmljWXU0ZEo3RVBEMFlhS0hta0xo?=
 =?utf-8?B?ZUZ6WHVEaGpuMlVTMC9zekc4bXFHUlFnYnkweDVXdkZlV0d0eHhjNVIyVzF0?=
 =?utf-8?B?MnBlYUJhQU5DK0dZcEM2a00zVjJDZjRrMkdOaDhXeHFBUXE3Rm4zKzNKTW9n?=
 =?utf-8?B?ZVprTlFnYndBV3NnQmNPRWlGTUtoOXEzMzRwZG9PZG14QWJwdXVScE1FTm5u?=
 =?utf-8?B?NjI3MU9SSm1hSW8zSDBUa2xIb3BQUEo3RVYvTjJUd3BBbjlDcmlDdkgzYUVs?=
 =?utf-8?B?aXhDdS9xV0lPN2hWZlhRZ0hFVVR2WnhZbURidWM4WVd4UGtPcDNnRlBHQWxp?=
 =?utf-8?B?Uk9XamVybmpBOXh6NzJweEkxZUkvOGYzZVE1dnNyelVrUG5nZEF3WENJdi9O?=
 =?utf-8?B?YTcwckJ5anBJcDd0ZzN1M2tRSEJGdzBHdzFURG9qU1E5M3dpZG1XZ29TTkhw?=
 =?utf-8?Q?PuymH6vFp0baE5/F7By2FwdG/wiVUAaN?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5643
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 188bcb68-1f37-4259-6d80-08de1b186a37
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|14060799003|82310400026|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTAwaWErNm5oWGVSOW5uRUwwdWh0aGpwYUtDMkt1V3dDcEg0VkxiV3AwZ0VO?=
 =?utf-8?B?T3BxUjA5T1NuTGJySGg0MGlpU24yZyt6RGhEUjBNZWtVNkxxZ25vTkN3WVJP?=
 =?utf-8?B?Rkp4UVdpV2hLUkpMQjd1T21jajBGYmxkL0xrNjJucTAvVVdHVU1leFVTSTRI?=
 =?utf-8?B?QVFkb1NYVkovVVBnanB0YUxvdzZ5SXNOZVlSYUlIVXZNWnA0R0U0bndPbmNw?=
 =?utf-8?B?dy9pM0tmMFJvMGptN016UzNLNmhvelRDdW9xQTNiYThuMUxIY29lZ1pkckNq?=
 =?utf-8?B?VU9WVkY5K1NhcVcwRHcxUCtoTUhhdjQySHdlSUlYVXVIbEFwN05rWm9HbEVO?=
 =?utf-8?B?ZmxKZldteUovMkdPZHdyZEVpd3UxTkJtWG9DWTZGNll5OU9kdWE1TDFQc2JR?=
 =?utf-8?B?YW1uclYrL05oeHU2dkpGM0MzRmdwZTNIVENUcm5lT0Z4S1pZZGZQUCtDVXBC?=
 =?utf-8?B?eHJUdmxQbzFWajVhb3RQYnpBYkFxRXlKRTVkenZpMmo2a212UWNQOXNzOUpw?=
 =?utf-8?B?TEFwaTBwL0FaZFVTS28xZVJHUHBoRWhKbFJ0QUtwVDZWMzhkMHlWYnVoaWZL?=
 =?utf-8?B?S2VJZU03UmtMUjJTVndhcUpuYWNaQnFFcG9LSCtzVzBMVDZVeE1EWXZDQlEy?=
 =?utf-8?B?eVhvc2UrdVhLVFYvYkhVNml0UjR4SUY1VVNhZEFjUmMxZGtIRFJiS0Y3K0J6?=
 =?utf-8?B?U2ZiaEdjV0JTNmE4cGVoV2hpWjYzcjl6K2NFanB2L0JTYkxNUHFzSDFFNmFv?=
 =?utf-8?B?bnFhZkM2aTJMbGNQRFF3VjM0am13bjhzaWdER0Q0cGtuSGdQMWxRQjRBWGRm?=
 =?utf-8?B?YTlLNU5hQWZRSTIxSThqSitjVnBqYUNkKzk1bCtDUitLai9MaWpaVlduY0pP?=
 =?utf-8?B?M3dRU3ZrSVBDWmwrS015Mi9xamkzQnNmb2l1V2RXcEVwNmxXb0o2UHBTZS80?=
 =?utf-8?B?QzhRWGxIdzBSNDM0aXNCN3VGc1NIVHIyZXpVc21lYUd0bVJ6ckdPV0tjUzBH?=
 =?utf-8?B?dVVINFlLcnI0QnFCWFNVS1cvaXJ2cEVZSGF5bkVXOWpGOElVNVJvTjBXaUVu?=
 =?utf-8?B?ZUVCV0ZuQWhmcFJjRW5uTzhlZ1g4a2M2N1ZWOXVaOFFQYkUycnhSWkdBWVFr?=
 =?utf-8?B?YXlGbk5zZ202KzVmVUlPVDBHbEZaVlgrYVJMZFJuRlV5WFBIQ3cyL0xnUGpt?=
 =?utf-8?B?amNaeU5EVUxSZ2VTajdpbnMrSExqYXR0eklSTlhDTFRMQnBacUE1VzBKenlI?=
 =?utf-8?B?ZjFSNUZwdTNhN0dVRDlOSVNDZk4rcFA4cUtweWltdlE2QnpHOHZvdWtTRU5T?=
 =?utf-8?B?blNsdlFiUEtLV3J6MGluVXNrUHZ2c3RpdE9IUUNGamVzK3E4d2MvSitUSUtp?=
 =?utf-8?B?bzMyQ1RFaFRIaWx3MmZyL1c2SFRScFRINUNQRC9Ed1FPMXdLNFRtaHhlWVM3?=
 =?utf-8?B?R1BhTS9PSlBtTzQ3anZQQjI4dGMrQ0VQaGYvVnZUc29RYlBuQXlKYU54SWVD?=
 =?utf-8?B?b1RvN2hjM3R4ZFZjcTZkVkI3NCsvTFQwUjgrM3c5NFhxSlgvOElwdjF4NmV0?=
 =?utf-8?B?SGIwUThyRFlyRlBKTTIzVHd0VDRxelpUKzZzQjExT1BQUnJhRjNHWnNVbDNL?=
 =?utf-8?B?eVU4aFRsZHdYNllHS2NXQWdBN0xuQVEwSzAxelEyTGNiNnV3Tlp4U05qSDR2?=
 =?utf-8?B?eE05cytySmNBSzBkQ210cTRyRUVjTHlhNm5IL0J2NWtaWExlbnRzdkZ6dktF?=
 =?utf-8?B?QkVYemJVaEQ5TEVxaEFvb0taVUVjMWNuWnluQW9IVmVtRVdpVWJlRXhkWVB6?=
 =?utf-8?B?S1ZScDNUV3BQM2dBdDl4WkNndFBNYjNrbWJiTitXVnRpTVlsR3NBRUVtbTBL?=
 =?utf-8?B?QmhYV1N5Vk8wOW1xSTRCSVdPcHY1dDQxOGtwcElwKzZxOEx5R3ExQ0Z6cVQ2?=
 =?utf-8?B?cnZjdHhySU93U2gxMHgzL29BSzNZTVpFQlFoeTNuL3d3cEFVUEtaeGxiMHFC?=
 =?utf-8?B?Q25weVE2Ky9XM0srVUkrdTFKRHhlS3BoNG9KRmh2SzAzQnUyRGhqVy9nZG1E?=
 =?utf-8?B?MDFiUyt4VXlTU0t5dlJNdWRwb3A0ZFdtN0RjTnJmUExaeU1LZTZyM3NXNkZF?=
 =?utf-8?Q?Vd+M=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 20:35:13.6807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd06b3b-6611-42a1-0cf0-08de1b187dda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6248
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



On 10/30/25 14:05, Boris Brezillon wrote:
> The default implementation simply takes care of invalidating/flushing
> caches around CPU accesses. It takes care of both the exporter and
> the importers, which forces us to overload the default
> ::[un]map_dma_buf() implementation provided by drm_gem.c to store the
> sgt.
>
> v5:
> - New patch
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 114 +++++++++++++++++++++++++
>   include/drm/drm_gem_shmem_helper.h     |  10 +++
>   2 files changed, 124 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index dc94a27710e5..e49c75739c20 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -893,6 +893,120 @@ struct drm_gem_object *drm_gem_shmem_prime_import_n=
o_map(struct drm_device *dev,
>   }
>   EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
>
> +/**
> + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for expor=
ted buffers
> + * @attach: attachment
> + * @sgt: SG table to unmap
> + * @dir: type of access done by this attachment
> + *
> + * Default implementation for dma_buf_ops::map_dma_buf(). This is just a=
 wrapper
> + * around drm_gem_map_dma_buf() that lets us set the dma_buf_attachment:=
:priv
> + * to the sgt so that drm_gem_shmem_prime_{begin,end}_cpu_access() can s=
ync
> + * around CPU accesses.
> + */
> +struct sg_table *
> +drm_gem_shmem_prime_map_dma_buf(struct dma_buf_attachment *attach,
> +                             enum dma_data_direction dir)
> +{
> +     struct sg_table *sgt =3D drm_gem_map_dma_buf(attach, dir);
> +
> +     if (!IS_ERR(sgt))
> +             attach->priv =3D sgt;
> +
> +     return sgt;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_map_dma_buf);
> +
> +/**
> + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for expor=
ted buffers
> + * @attach: attachment
> + * @sgt: SG table to unmap
> + * @dir: type of access done by this attachment
> + *
> + * Default implementation for dma_buf_ops::unmap_dma_buf(). This is just=
 a wrapper
> + * around drm_gem_unmap_dma_buf() that lets us reset the dma_buf_attachm=
ent::priv
> + * field so that drm_gem_shmem_prime_{begin,end}_cpu_access() don't cons=
ider it
> + * as a mapped attachment to sync against.
> + */
> +void drm_gem_shmem_prime_unmap_dma_buf(struct dma_buf_attachment *attach=
,
> +                                    struct sg_table *sgt,
> +                                    enum dma_data_direction dir)
> +{
> +     attach->priv =3D NULL;
> +     drm_gem_unmap_dma_buf(attach, sgt, dir);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_unmap_dma_buf);
> +
> +/**
> + * drm_gem_shmem_prime_begin_cpu_access - Default end_cpu_access() for e=
xported buffers


Sorry nitpick. There is a typo here. Should be 'Default begin_cpu_access()`=
.


> + * @dma_buf: The exported DMA buffer this acts on
> + * @dir: direction of the access
> + *
> + * Default implementation for dma_buf_ops::begin_cpu_access(). This only=
 takes care of
> + * cache maintenance.
> + */
> +int drm_gem_shmem_prime_begin_cpu_access(struct dma_buf *dma_buf,
> +                                      enum dma_data_direction dir)
> +{
> +     struct drm_gem_object *obj =3D dma_buf->priv;
> +     struct drm_device *dev =3D obj->dev;
> +     struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> +     struct dma_buf_attachment *attach;
> +
> +     dma_resv_lock(obj->resv, NULL);
> +     if (shmem->sgt)
> +             dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
> +
> +     if (shmem->vaddr)
> +             invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.size=
);
> +
> +     list_for_each_entry(attach, &dma_buf->attachments, node) {
> +             struct sg_table *sgt =3D attach->priv;
> +
> +             if (sgt)
> +                     dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
> +     }
> +     dma_resv_unlock(obj->resv);
> +
> +     return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_begin_cpu_access);
> +
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
