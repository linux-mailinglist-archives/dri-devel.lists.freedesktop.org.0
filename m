Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED2BE29C1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6496810E999;
	Thu, 16 Oct 2025 10:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="pxY08bdI";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pxY08bdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2FA10E999
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:02:50 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=emzgjvxcVTtMv2l7c2eWtk1XdSB72YA3P4yzCBvV3Cwbag20+NDy+hMt66MhTTiqMaWaaJLJa5Sa2EzTsPBbcDslfiLbhjyTYysnADu+k7QbX1CPTDfRRbuhh36DI0C85FN1k4z4+dnvEuHFsGLetjegrMs9SQRlp6ro12/VURgPnOgfA4re7hfkyWx+6eSR5ezomeVPTaWbmHjmgH1wm7sc0ADwb3TooHtZscAShzO96jTz1xpb/vdN4uADxrqrdjUxiQUp/Hv/W/DDf0mr3DKeD4wnTA2kUelq+Y1m8uRe65o3b9Wvs4+dSDJhggAwgqHhfArL1HmoS/E4AfxwBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXtaHHBB4WolqMAMDLenPTgKMy0JzdC4sSRFcvphTok=;
 b=T52quYYXBNaIvwX5chcbA1QFO83QsyMLp2gpd/UeHtvH/QUsxHCTw2Kfl3S4dG/lmYVVBFpO31f8UnRuKoclBcgnsSdLBWgrzp3yzpfrlV+J1NMbAq+NvpoyAerZytzjgIz2iGgJ9xio4l/Mos8+mjl786dcqhheEIjcc+E6Di+syB0Dtr7rywUqKfLI+X2YwgwKx+EiLwvr4mUV2+irMXdfbQjMhTkDn8dQpmBtkkDQjcOED9YktZTNuAl4cA87rUu02nBfXv4KmnX29A/GqeEISWY7nc7JW7saGEwT34X/GbxZ9z4Qp06x2jNC3X8jw15Nw5JYAzUwdHCfKROmFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXtaHHBB4WolqMAMDLenPTgKMy0JzdC4sSRFcvphTok=;
 b=pxY08bdIl78FTXNKgq5lmLv7MESxYXCHKfGbZEcpmXN9ihRQMIYDymNxih1nQ+EY5wrlvRZzfzjJe8Ao0e+6WXhN+/xzUFivASzS+k60f0GFD1BpOhObTiieYPmcf7U/0Ke2UCU1D9X3MXkMZiy+CaylEoLnHOHC0WADsH9/czI=
Received: from AM0P190CA0016.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::26)
 by VI0PR08MB11356.eurprd08.prod.outlook.com (2603:10a6:800:301::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 10:02:47 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::a3) by AM0P190CA0016.outlook.office365.com
 (2603:10a6:208:190::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.12 via Frontend Transport; Thu,
 16 Oct 2025 10:02:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Thu, 16 Oct 2025 10:02:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtZRPSa7FHH92qNIB3sQtlaodxR7vAP7wl5OAcr4/DZaZ2/d/k/iEJN0liOzIhf+ZmUdNPuIZpVbfGHgtlrrem7McTkK7M8AyZr4++tB9BV0bq45Y3wWIpwIhMbq8IxtKNweY2yfSCn/xQ0DII6sf/jNnNaRrFN6qQ0QIIGXf1oB0XigyBFmgjKOE9xj6md04Mhqen/djK2v3gndzXc/kqvrHp9l4MRDHVZtjpZ4Jcnf+BCFsyK+DeXUgiRopF7msHmD4r7OAfc8gAxIkjGDJkDVc0cTsXPY8E5gUWiLJ5MCd1DTim/mjOrmHxjW9iYur1/OvtbBl49QM0zd0RW5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXtaHHBB4WolqMAMDLenPTgKMy0JzdC4sSRFcvphTok=;
 b=dAFzPdxf6kXkPWjjSyzvw9Avx5MRBDiNfhXp40Ftf5If2hz3oG+7iOk+EdkcsEYORbziEVfYqOVl8SdvSPOKWpLYVxk9vd8JQMwSwA4fRx2VXfccyaiPzGt2ihRDwfhcAQmJl98r8NbDcTWslQ+3UVyvH0LoRWw5Hn3x9cFlygRX5PohPDqMm3/SexFpJ88OizTN96m59THa78f2si1MbwyVG64zrTvU/swcO8JEXMBNWOjaxJEs6V9EhLm9IyPyRwsW7u9WPoRSW7jZ8I3s/vtIspM30IOVH0bcF34WmWBd+VLoPSV299Fe+t7Hi6WiaoZYsfmpgSQZdSq6SQ4ahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXtaHHBB4WolqMAMDLenPTgKMy0JzdC4sSRFcvphTok=;
 b=pxY08bdIl78FTXNKgq5lmLv7MESxYXCHKfGbZEcpmXN9ihRQMIYDymNxih1nQ+EY5wrlvRZzfzjJe8Ao0e+6WXhN+/xzUFivASzS+k60f0GFD1BpOhObTiieYPmcf7U/0Ke2UCU1D9X3MXkMZiy+CaylEoLnHOHC0WADsH9/czI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB10359.eurprd08.prod.outlook.com (2603:10a6:10:416::17)
 by DB9PR08MB9561.eurprd08.prod.outlook.com (2603:10a6:10:452::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 10:02:13 +0000
Received: from DU0PR08MB10359.eurprd08.prod.outlook.com
 ([fe80::d10b:a33:84b5:cbd1]) by DU0PR08MB10359.eurprd08.prod.outlook.com
 ([fe80::d10b:a33:84b5:cbd1%6]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 10:02:13 +0000
Date: Thu, 16 Oct 2025 12:02:10 +0200
From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 nd@arm.com
Subject: Re: [PATCH v4 11/14] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Message-ID: <aPDCoqMEq_XzYWZz@e129842.arm.com>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-12-boris.brezillon@collabora.com>
 <aPCv7ZZ3t2fJvG4W@e129842.arm.com> <20251016115224.01478b1f@fedora>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251016115224.01478b1f@fedora>
X-ClientProxiedBy: LO4P265CA0188.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::17) To DU0PR08MB10359.eurprd08.prod.outlook.com
 (2603:10a6:10:416::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB10359:EE_|DB9PR08MB9561:EE_|AM2PEPF0001C70B:EE_|VI0PR08MB11356:EE_
X-MS-Office365-Filtering-Correlation-Id: da5acd6a-fc54-4f75-89e7-08de0c9b2812
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TDJTN1F4RmY1VUp6WHNJbWlRSm9weEUvUUlSMkVRWmNvODFyeElHRiszZ1ZH?=
 =?utf-8?B?TFNkQXA0ZjRodWdjRmRpZnR5T2pNQkZNMlJsUUxSUFA4UlROTE4yaW1waTVN?=
 =?utf-8?B?Qkt2MlRGSFBGalFoYTFLdVlQZHo5bERDUUlJTFhRZjYrVlRmd0pBelFpWGhH?=
 =?utf-8?B?aTU5K2N5Y1Mva3FPdG54RjI5cmtRbHpCeHh2UjIzTXVZcXplV29mbWtVa21k?=
 =?utf-8?B?TFd4MUVSczE4SnRqeU0xeVJCck9VL01IUXlUc3ZuTEdNQTg0bXBGekNQQThY?=
 =?utf-8?B?WFhDNlA2Y00rSmZRams3ZE8vMkdIUGlyUFlXZU9ERmkwWHlHQkh4bWZsR3JK?=
 =?utf-8?B?WXI4NXpVdDlkZEdiSzRnQllTS0xvZ2NVUFRyQ3dFMzJzNy9wV2hiUzNvb2Y1?=
 =?utf-8?B?YnFlbkFRKzMrbkRRREFTa2tieHBObkVzU2xFeDI1WS9oakVHUDc5OVNJVFFV?=
 =?utf-8?B?UmZKWjNsUTJxbFB4UEVoTlhpSld6VUdsQ1lZaUxCMHFHSkkwOHRLeVRXeFJO?=
 =?utf-8?B?ZUxZMExZN2piZVpYVTdmOFlpalBzNjdnNzFqRCtiS29BQmUzdyttMGRVZUdl?=
 =?utf-8?B?cnFKZTl5M2gyZXN6UDVBVnZYWCtaSnR0RUxjYjFxeHhpUTRtTFR5a2N5d1JO?=
 =?utf-8?B?WHBxN3AwYUthb3N6SlpZZy9GTzQ2eVFibGp5MXpOMkI2aG1VWC9oaW9rNTZa?=
 =?utf-8?B?WHJTNmZFQUc2aFBmR0g0bTd2dWNtYWZjU2grdi9GTlhNWHJ0VGJRSFhDQ2s5?=
 =?utf-8?B?dk1qcXhmMGNOYnh4T1djKzNEaWs3MkxSVnZHREE5ejZhNDhiaVJXWTFjUzgw?=
 =?utf-8?B?eW9HenV6NjNPTXQzM1BMV0RUdFE5b2lZZHcxa2hxbVJ6UkZXYjlFZy9SUk9u?=
 =?utf-8?B?bHlRaU1tZTZDTXBvRzVOM3pyZjRQRW1YeU54VVh3TTk1MFpyZ2UvRkhZWjE1?=
 =?utf-8?B?czFXU3B0QW1vSnpibmVoU3grbU9rYXJiSVpFd3hld1JLaE1DenlDc29pV0tC?=
 =?utf-8?B?cm9XYTM3THpxblJHaVdGdFBvbVNSK084Y0ZJKy9xTFlmdFhNSkdUT2ZWc3RJ?=
 =?utf-8?B?ZkpzOGtEYXRTVndLV0xQUkNaYzExY0NwcmNDb25PWDc5QWNzZFdHZDE1WElS?=
 =?utf-8?B?dGhSdjhqYlFTcGcvcXF5djFJQVBpMDh6UVNmcHpUc2kwTlhnS0FUOHNtR1RX?=
 =?utf-8?B?c1hmSWIrRFdyUys0bWxmMWVaZUNCcU4zMFhhK0I4YXFIYzJmMVpSVjA5MU5E?=
 =?utf-8?B?VkRKSWR6YmhJb1dDeEhRdUJkc2pEc21CQW9RdEdvUnN4RkRQMUhNVHF4OFBs?=
 =?utf-8?B?ZGNMUWQxcUZ5cW9jOUhmdElmWlBBZFRldU9lZ3p3Mk10L1BucCtHZXRGVXBs?=
 =?utf-8?B?MUFFVm9tbXpBbE1RYXZoZXRrdm94WlhwWmtCQjg1L1phVmVWa3F5elBzdTV5?=
 =?utf-8?B?dzVJdzN1M2MwMTFOTVVWTHJyWkhwaFVxaHBQSmF5Mm9kdVh3N0RVcHl2SnpW?=
 =?utf-8?B?VGNaeURkSU45SFRTWWQrbU9EVjhRVExKWmtqcnRQRUxzb2JPblRTRmRqN0Fy?=
 =?utf-8?B?bnVLQWMxaXJkQXRxeUl1ODBtb25VZ292T2VhbDVrdEpJQ0JuM3VBdzY4WHRW?=
 =?utf-8?B?ZlluWDJxVTBLZ3Zod1hETjFqTjRGQUxTMUdpcUgyZWR1S2Uya1lTbU9FcE81?=
 =?utf-8?B?Q1gvV20vMmJENkdvdmhQeW1VSFM4Y1o4NFJmUHdib3l0aGFsL2RnUnFSdnJ0?=
 =?utf-8?B?a0RmcDhsWXdMNFc2K2xoQWszRFByUGdYejMwSGVGenE3dTFiYnJuQmEvUHlT?=
 =?utf-8?B?eDNnY2JvU2VtRHZxVG9QazR6RTlxb1JVVVdRZUw0VFpvZ2o2d2djdXIvZlZn?=
 =?utf-8?B?MVNCTmFydENFVlVLTE9qbG1CNEpwL2d4cHFiem1xK1pCcmFib2VMWDJDMUhB?=
 =?utf-8?Q?aHwTONqQsphSqyxbalJ5O76szzoWeX1S?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB10359.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9561
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 64da770f-5f13-40b3-c062-08de0c9b141e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|14060799003|36860700013|35042699022|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkNTTUk0dEgyMXN3MUtFMXA2c3VjM244K1JKMHlVNjdnUUNSczFvR0RDYmpZ?=
 =?utf-8?B?RndNSE5QTjFWUDhNeHdKaWNMNUNvRkNVNGlraG15SElVQWNjMEE0RmFMKzBT?=
 =?utf-8?B?aXd0TWs1aXExU2wrRTZyWVJzRGExY1dBdlJjV3dtTnRZVlV1MUcwVDBRa294?=
 =?utf-8?B?NVZWaEE0dXFIVitKQ3hkWGh4THdDbHcvazlUUzZaOEJweEw3Rm1mZlYzZ3lm?=
 =?utf-8?B?T2ZFcUl4QVZoNllUbEJ5anZSQ1VhVytJeWRZdmxpaHpWNkRXcDVlR25JZlZs?=
 =?utf-8?B?QXRFZ2trSzZaVDNOVlhGMG5oaWJHV09qQUozTlE3MW51ZUd2Z1p6WFlDYUhE?=
 =?utf-8?B?bHFOUDJqeGpJeXJiRHVZSEE3T0NnY3hRaDBIbFc3ZkJKTGNobEZWZTRHenYv?=
 =?utf-8?B?YVFlVHlIaTkycFFuSW9nUVN4R1pjK2VzZFBBb2xCcXF2cXQyaDZwdHdUZDlw?=
 =?utf-8?B?R2I4SXdZUC9aN3hra0N2ak1CQk0wbjc0d2x5aFdpUE9yaUFMUk9DeTl4OCtG?=
 =?utf-8?B?SWlSSlpaamhwUjVmMnkxdlBITEYvWUVlV3NudVlobk1obWZWM3orTHVOcC9u?=
 =?utf-8?B?TTAzK3FSa0w4MFhoZ1FvMEx0NFhvcnl3cjNjaW1WY3JLQWFDU3hTK1Yxbzc5?=
 =?utf-8?B?b3VmbERHdHJaMjlGSkcxaWZTT2h4S0syaG04NENhaHZmYVduRUJRbVUya2Y1?=
 =?utf-8?B?dFR0UlJoM1lsMndoUzJMTWlYZ2NsTFhqdFRXbXoreE9ZZUpaOEEwYW01Znd3?=
 =?utf-8?B?aS8vTU91cjdHeXVXcy9jQ0UyV1JJbVI4YzVuY3M5NXJWMXJPWjQ0Ny9SSlcy?=
 =?utf-8?B?TTlIZ3VlUlJYeVJpdTdMMUtuR1ZuTllZOWF1eW5uaWtnVFVnWEw5a1BFMEda?=
 =?utf-8?B?RytvQlpOWUpLb01HYlY0TFByRU80dkpZZ0RRQVFBWjhhWDBsdHU0bXFFMjRq?=
 =?utf-8?B?c0xpb04xL1RmcXQvR2Z0SEt6Rld0UnRQK0JwTUNXY1VYRE93bzh5eW44SGtT?=
 =?utf-8?B?Wm5hR3ZuZ2lXQ2t5a3JPZ3phTVd2MU52QWlWVGxmc2VKTHVmMVg0VFNlKzVR?=
 =?utf-8?B?MWRmaEZYbFBaOFJrYTg2RWVKRGU0eURabUNUaldPMkx5aVA4TjNCdHFXUVJJ?=
 =?utf-8?B?OTlCbHNJUlREbmVpcFVzbFk2TG5XZ1VhQnF6NEZPbHlGWHBsZExoTUdrSGt1?=
 =?utf-8?B?dHJ5QUdTZG44ZE5yZ2tsaUROYUoxVkpEaEloemRFV0U0U1ZlYTVEK0xqVlJo?=
 =?utf-8?B?Rk9xY0hTRVhrajRNU2haQ3NCdE42ZXB2cXI4OGFTK2pkMTVENUVzQ28xMyty?=
 =?utf-8?B?cVpRcyszaWlVT2F1MkZjN2hEakl2OVlIVWJyTXhVbTJRZzlQN0RUcWtPU0Jw?=
 =?utf-8?B?Wk5mdE5nRlhsYndPRW5yUE9Kck9CTkQxdml3Ynk0S0EvT2V3Vjk3M0ZJL0Nh?=
 =?utf-8?B?RmIyWFZTZjFLWGlMNmoySW5lL0NodWVBWFNJdXVZOTRwV1RqaWV4bnA3dFd6?=
 =?utf-8?B?U29QZ2l0QUJaR1dlWXF6VDVTZ3ZOQjFmamYxazY2MjVlVStaeXlVMXdTQnh2?=
 =?utf-8?B?ejh6eHpEV3hWY1JBQTNvb3hMYVo2VTNoV2xwNzNmdmZmVjQ3KzZsYWpNK0lE?=
 =?utf-8?B?cFBTWHZWc0dLZXFzUWV4RXltb3pZM29aMFloOFlNR2JvQjV4UEFBcWxXa1JC?=
 =?utf-8?B?NlNkcmsxSW5heHkwckZuejNxR1NkemFNWHN3M0hWRDM3bHhKTUJJSzQxWGtE?=
 =?utf-8?B?cU9mdU5TbS9CRlJacVFGdGpKNzJNVGZzek5rYnNsbENGSjhlMkN5QllBTU1E?=
 =?utf-8?B?UXhZcU5hckJaR2I0Rkl5ZXdtNllxa0xqV01wUTVxSWhqSndiN0FzVE8yc3kz?=
 =?utf-8?B?cVBaTkdzY3EwUVB2Zkw4YUdQdUN6RFlIN1NhMWVxOXBtTXZiS0U0d0NmQWVN?=
 =?utf-8?B?aXQyY2U3R2t3WW5YQ0tEMUIwcWxiamNlSnhaNTNkbXZoNFBsSmdybTVMSVlH?=
 =?utf-8?B?bDEvOHdUdHg3TERsNjFMSmNMWUx6WmljcTkrMk5YalJNSzBlQ2FKd283T3hs?=
 =?utf-8?B?L3dmamlIQ0dVbDF1QmxHMkJaQ2RQd0VxKzN6RURjZVFRR2o4b1NYYVNtVFZW?=
 =?utf-8?Q?Sm5s=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(14060799003)(36860700013)(35042699022)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:02:46.4069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da5acd6a-fc54-4f75-89e7-08de0c9b2812
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11356
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

On Thu, Oct 16, 2025 at 11:52:24AM +0200, Boris Brezillon wrote:
> On Thu, 16 Oct 2025 10:42:21 +0200
> Marcin Ślusarz <marcin.slusarz@arm.com> wrote:
> 
> > On Wed, Oct 15, 2025 at 06:03:23PM +0200, Boris Brezillon wrote:
> > > +static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *data,
> > > +				  struct drm_file *file)
> > > +{
> > > +	struct drm_panfrost_sync_bo *args = data;
> > > +	struct drm_panfrost_bo_sync_op *ops;
> > > +	struct drm_gem_object *obj;
> > > +	int ret;
> > > +	u32 i;
> > > +
> > > +	if (args->pad)
> > > +		return -EINVAL;
> > > +
> > > +	ops = kvmalloc_array(args->op_count, sizeof(*ops), GFP_KERNEL);
> > > +	if (!ops) {
> > > +		DRM_DEBUG("Failed to allocate incoming BO sync ops array\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	if (copy_from_user(ops, (void __user *)(uintptr_t)args->ops,
> > > +			   args->op_count * sizeof(*ops))) {
> > > +		DRM_DEBUG("Failed to copy in BO sync ops\n");
> > > +		ret = -EFAULT;
> > > +		goto err_ops;
> > > +	}
> > > +
> > > +	for (i = 0; i < args->op_count; i++) {  
> > 
> > If args->op_count is 0, if I'm not mistaken, kvmalloc_array and
> > copy_to_user will succeed, but then this function will return
> > unitialized value. Maybe add an explicit check for op_count == 0
> > at the beginning and avoid going through all that code?
> 
> If args->op_count=0 the loop would be exited right away, so I'm not too
> sure where the problem is.

Maybe I didn't explain it correctly, so let me clear that up:
ret is not initialized and not set anywhere if op_count is 0.

> This being said, I agree it's not worth
> going through kvmalloc_array() and copy_from_user() if we know there's
> nothing to do. And it's probably a bit fragile to rely on
> kvmalloc_array() not returning NULL when the size is zero (I actually
> thought it was), so I agree we'd rather bail out early in that case.
> 
> > 
> > > +		if (ops[i].flags & ~PANFROST_BO_SYNC_OP_FLAGS) {
> > > +			ret = -EINVAL;
> > > +			goto err_ops;
> > > +		}
> > > +
> > > +		obj = drm_gem_object_lookup(file, ops[i].handle);
> > > +		if (!obj) {
> > > +			ret = -ENOENT;
> > > +			goto err_ops;
> > > +		}
> > > +
> > > +		ret = panfrost_gem_sync(obj, ops[i].flags,
> > > +					ops[i].offset, ops[i].size);
> > > +
> > > +		drm_gem_object_put(obj);
> > > +
> > > +		if (ret)
> > > +			goto err_ops;
> > > +	}
> > > +
> > > +err_ops:
> > > +	kvfree(ops);
> > > +
> > > +	return ret;
> > > +}  
> 
