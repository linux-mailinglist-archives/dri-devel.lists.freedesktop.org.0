Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB81CFE838
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9B410E618;
	Wed,  7 Jan 2026 15:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="qv3+5zVW";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qv3+5zVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3984310E611
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:16:06 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QH40OZ8nXTONznBKRAY1P40CvOhzIDrDtMBu1tzlL63ymwvvyykPJ/Xe8woZ1UtB8qH1ui9kfV9K8vJ0wQdoV4RXSx61t0FuebYgZ/MkUX5TxD9BUbEKVBUa+glQCIkJxCHEQ3BpxrzkYDXTeps/A2J1EY5Hd9JC4N9/jVqsVql7zZly5Ch3fX8gIWMc/wuFYAAPeRLljp1df5JoP5VZVSb5iwLUNfYhXhQxldxvx6UlDoMJkYJ0MnAJoYSI4R/ln/gnWEcCdpst/kbyYvRsDYSn8kv1nIYrd8cv6EWI7UvIwATehR3CW6u3Orms2UhWydK6CH/xObFPz9CBRgi8HA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrBiHqHv/bXh7HIGLFSwh3LwluowNfWeIK4ADWcf4Vg=;
 b=EJ1222PfJW7jQ95Ww2RTOBTZ75PNik6CIcpy4bblzJype36W+XcTLDBPiNFlWaO3yB+AGyab7X4/3Bh7j+cl2aQR4ykWr3RSt+IOxPaH5HdzWOn5NkXJ7Xuhwjou/jiQk3g8BXsrsYKHJJyfLCa1/0sUI5wshh86CwjAqRiJhZMvbNy/PfCI1cZalBQBJByDuDuY3UbuyaXlPKnL4WYT83nR1RMQwGKAatL+bttaOioJH9jOjvmnNFwyBvu6t983tXscQoclzgPhoD65fh7Yd/neoWDEvu4OD2ghCjV/p4VRPQ8I3j65QLZX88vvwo19l3yF0OdRnQIatO+WZVK41Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrBiHqHv/bXh7HIGLFSwh3LwluowNfWeIK4ADWcf4Vg=;
 b=qv3+5zVWnzry8rtXKhUBh5e8fObM1wFq82arxbVXzHNbLKgG4QVKlR3pRwZU9Iz/jfV3Em1GjupJvQ0siPjKMmJ8FMVCZHb2gVQ7Bd9RiiaMuMulC5fNeAbeGumQUc5IqDv195sCP6KF6OADiuGzTBVZlkyvkFz8NEN1HyXTdXM=
Received: from AM8P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::11)
 by VE1PR08MB5664.eurprd08.prod.outlook.com (2603:10a6:800:1ae::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 15:15:59 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::5c) by AM8P251CA0006.outlook.office365.com
 (2603:10a6:20b:21b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 15:15:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Wed, 7 Jan 2026 15:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTwERGv8i/J2ahfLbCa1suGEfk2FDFsNMkp3O3W5S4TbZ7jXlXjJZRKqg64GdurLqMR5tKYCxTSD2+u1T/optsNBDNhOC6kiEWKYtJlgkalfuNWhaAYA4CENlAYy9KgTRsTB0n35NKJXBptzOZe+Fwo02VsFZQClcGjv814QaKvN2llOLnu55wQx7xKEukFJ8FOhKW/9L1VLsVnv0f/oIouSaJ5uAEd7aUFHJQpWaOzXahdOSp+b00tjYNtRnD62nzo5hjfLedLt/cLHw6NqGZ2n/QMXUcR7HtyWfpy4DUHISkud3CGhSa+WqeV9JMNcclFJKZz8ANGhmoxbGWrzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrBiHqHv/bXh7HIGLFSwh3LwluowNfWeIK4ADWcf4Vg=;
 b=PvPLAjyME6kNATpFj1W2Ldl/Gscw/CLLyL6Fw/DCET8NMw8iz5nnsR1Ncl8TrIWeNTOheEIU+feE44Cfyw9226J/kqcS5hYyhfwOeZh8U5iJK47T6veU5R33fpOUlwRJ1pX1NRxoz7vjJxh3zWWPyB+sa9aTo7+lzkErlCMxHCtMNem+wos/+s7KZ+DmHelv05FJiZTdbaeQ8E4xX7YcQXOpJxTi2MzbFr784QYZX+f6WlgwDRsui2fYnxOW4KcX+gnR+8/PNf5SY8SSbi7oqmQ/Q4oL//xT3fj1ryK7Ks7drPRae0gM88bHUow9OA0kTpNf/XcPfBVPF5r37RTCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrBiHqHv/bXh7HIGLFSwh3LwluowNfWeIK4ADWcf4Vg=;
 b=qv3+5zVWnzry8rtXKhUBh5e8fObM1wFq82arxbVXzHNbLKgG4QVKlR3pRwZU9Iz/jfV3Em1GjupJvQ0siPjKMmJ8FMVCZHb2gVQ7Bd9RiiaMuMulC5fNeAbeGumQUc5IqDv195sCP6KF6OADiuGzTBVZlkyvkFz8NEN1HyXTdXM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB4787.eurprd08.prod.outlook.com (2603:10a6:20b:c9::12)
 by MRWPR08MB11233.eurprd08.prod.outlook.com (2603:10a6:501:77::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 15:14:53 +0000
Received: from AM6PR08MB4787.eurprd08.prod.outlook.com
 ([fe80::dde9:c555:e55f:bda4]) by AM6PR08MB4787.eurprd08.prod.outlook.com
 ([fe80::dde9:c555:e55f:bda4%5]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 15:14:53 +0000
Message-ID: <c1448b71-5921-48f3-8ab1-0431f7dfa53b@arm.com>
Date: Wed, 7 Jan 2026 15:14:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-2-lukas.zapolskas@arm.com>
 <20251216183029.50cab821@fedora>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <20251216183029.50cab821@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::13) To AM6PR08MB4787.eurprd08.prod.outlook.com
 (2603:10a6:20b:c9::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4787:EE_|MRWPR08MB11233:EE_|AM3PEPF0000A78F:EE_|VE1PR08MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f18cad-43e3-4a83-f6f9-08de4dffa9d0
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dUhZWmFic2hPVmZDc3E1UWpQZ2x6NkZwTis3V3htdG93emdIOG1nZWtkS2hG?=
 =?utf-8?B?aVFnekpWNC9aVVRqSkc5M3lndGRXZmhnTmU1TFRjcWZKQXBjMjROZjEyZEQv?=
 =?utf-8?B?blU5OEkzTFF6cEYrMEVWSFdqUVdEUkJDN1MvZ2dzOXFHVUliaGtpT25odVdv?=
 =?utf-8?B?bDNSdC9YdXh2RXVMTldYQWhUZm9KbVJ3MzlOL0lDaCtYS21rWU5sVXEvQXdR?=
 =?utf-8?B?cUcxTGdLa0c2Qm5TZFVXTEN1OW9CL1RMMWtvVW5jaVU2dlM2cGZEUjlLeXNU?=
 =?utf-8?B?WUxWemNKV0R6N3Rsdjg5bU1KS2lHenpZRUdOK0dUMmZDUVZtR3liZ2NuRmp0?=
 =?utf-8?B?R1ZweGxWWWFUNnJFSHd4T3dPb3pHZDhCQXRRVTNiYVNpc3lPalJlMTJzVGds?=
 =?utf-8?B?V3NXWDNKc0prQTc0SlZQcE8ySTg4SEM5ZTZOSjZzZWFoK2ZobzhpaW95QlBJ?=
 =?utf-8?B?RlNSY2Z4ODhhbnVhS3dPS2NrSm05NlBaaHlIdG9XQTJJWHFRRmh2cHY0VG9Z?=
 =?utf-8?B?Rkg1S093ZW5CenNzSW84ZmExdHRRdXY3dG1BcWE4UzZBVW9jM2tTR2ZCZXpH?=
 =?utf-8?B?QktGSGF1TktEM3BZaUdGNkxmb01VM2Z5THJIUlB0Y1huSzZEc1NhTE5nKzFh?=
 =?utf-8?B?NzlPeU5HK21GcHozK2NZYU8vYnFYeU1Ub00rUS9uWUlabXNZdDI1ZytNNUhF?=
 =?utf-8?B?YXdyejdwVVVaWkFrYzZzUGRkUWFZZ0MyVmFHWmtqckVDQSt0b0tZZTVKUGx5?=
 =?utf-8?B?Tm8rY0ZEZitWbGVSbjFXd1YvODNrbzdMOWZ6WDRZOEdtMFErenZZMk9UczBt?=
 =?utf-8?B?OUR2R09SVmhDN0N3UzRhTVJCbnN5VmhqNnIrdDg4NW5XVTVjWnhHbHhWTk9W?=
 =?utf-8?B?VVhaOU5JQmNsWlI3SmhuemVReHU5eUN2ZUJDQS9Pc21pSDdqREdvVFczazY5?=
 =?utf-8?B?ZlFjdlB6VFFOei9SOFBLZGM4czZZWlJaUTZaNmpXcGNUNVdydVdYYXA1UlBW?=
 =?utf-8?B?VVRmWGloTlZDbnZ0K0licVFOMnBMQnF5QzEvYlJuTHpKaWFpVTFjQVdoYUIw?=
 =?utf-8?B?OWRsYzd2QkxsMC9nd2Rjc01WM29JWmtDbGZ2eWRadzJUOGRLSnh0Yk5sK3lV?=
 =?utf-8?B?NDdqUjRuWDFtR0g1eFJZQ2Rza2ovTGwrSGxCNmVDbVdFcTJjd3dUOHNMeHV5?=
 =?utf-8?B?ZThId1VmWUZKYWNJb01va2JMYzF4Y0NCYnNsQ1grK210MVRzdGl0U2wwMzNj?=
 =?utf-8?B?QUIwYjU4b1lCZlpPOTZKMCszdkNrZkRkcHhIS21zNmFVQnhnbHh2VWpnVVVa?=
 =?utf-8?B?MTcxZlphQWdYdjVLQXE5SkoybHpTWEhEQlpvbE81OVNZVjFwK3UrT3lnQlkz?=
 =?utf-8?B?WjQ5cDRLTTMxbXVxcFFQWXF0dXpzTFVzQk0vQUI0WkhUYTVGTHRha2VJc1ND?=
 =?utf-8?B?a2QyMG51T1ROVUZUQ0FFYnl3YklVMk9PVFdKR2lTdmRtOW1ETG5Vd3NNWUI2?=
 =?utf-8?B?eGRycHRPL2xGMG1RU1NlL2pvbGJENS82VjBVRTJhVWRTZmMxZ3lhQ0VhOW5x?=
 =?utf-8?B?RTVMVFBJMUVDdHFCVTRJVlc0VUhHN1o4eW1lRWcxUGNweGM2TjRKY0oxQzVa?=
 =?utf-8?B?eU5CSzVRYXlDVktONi96V1REQkhxVGgwWldYdThPbEFTTGV2TGIxRFQ1ajU3?=
 =?utf-8?B?VklFYjZaK0FtU05paHJ5VGxZY2dGN3A2RUtJdk9xTUtLRHllM0xMSHNzU2pp?=
 =?utf-8?B?cWI1NmxmMmM3TnFxMXNxR3djLzAxbUsxMGlhcjMwcnZmNHFFUk9zeXFoM3Nw?=
 =?utf-8?B?aVVxWlpIYVJkM0hyMUxjUE1Pa3lWOHBkNjlyM2JWbjJ0dGdORlJpdjViMGoy?=
 =?utf-8?B?ZjQxcHlQK2tzUUhpdDREUW5pTEszL0t0NjVuSjFua1JlVHhqYVJsUEVXT3JY?=
 =?utf-8?Q?vKiBIzRkZUl8ygiBCc2aeXveyQIOd1Hb?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB4787.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11233
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 97d58947-e288-4b21-5f2c-08de4dff8266
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|14060799003|35042699022|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1JHY1NOSUh3c1dYM1RYMkFFR3phQUZIdWc2VHhaa09QcGh5UjVXN3MwdnJU?=
 =?utf-8?B?QTBzWHh6M3gwdUVseTN1YnJsREl5V3B3LzByL2hVbjByakhzN2dDSDdiZ0h3?=
 =?utf-8?B?WXVGU3VFWlYvT3o2eUF0VEFuZ3JGbUE0QUVkWU4yOE02ai8yOE8xL0l0eDJF?=
 =?utf-8?B?WEQ5VklZSjQwWmJLYUZ3Qy82dHkxTEVGM1dEejNWNnU3a0VnK1BaVllFdmo2?=
 =?utf-8?B?QWU4Z1MyQ2pjZHBkcTI2VXJ4dUJQSk84R2xnRy82L0EzQUFFOUh2ZTZpTEhL?=
 =?utf-8?B?V3BrYVVCNys1WWNTa3hlUUpqNTBLY0JkN0RieWNRR0J3YVFTUy9YekJZdElV?=
 =?utf-8?B?a1E3Z24zTGNIQnlsamFCS0VQM3F1SDZqUlpGS2p2cXZxWXVLU25vbHBlYlUv?=
 =?utf-8?B?ZUZlZEJXSWUxU3VsNm8xdVRMM0pYcHNDWm9BNk9yR215SVN4QkVuRVI5bUYx?=
 =?utf-8?B?aTR1OGdVNi9ZclNQdzBLQzJzUFBZTWxkTk1tc0ZWMXBNdXZISE5jVjFhbjFY?=
 =?utf-8?B?TXVFVTV1Tlk0VjBKMkZ3bGd0SEtKbUI0dXpEeVJtYjU1cXY0bmZEN08vZmwy?=
 =?utf-8?B?aURXUitxbm1IdFA4OUZUSGFFKytFNEtiRHdrQjBhdEpCb3g3TnN2WVZGU0hD?=
 =?utf-8?B?d1FSYzdZMVFWLzVxMGFLTXNLWFdTb2hZV3dMTm1jR1VkMVhyNmZlNVFJUjV3?=
 =?utf-8?B?bjhkZzIrdWtlSjg3SHFjZE1WSVdsY2pvS2tLVGN0bXFKaEg1WWpPN29rS2JO?=
 =?utf-8?B?dGJ0blREaElZa0N0UWdXQkhjdDRNcmZ2ajIvSjFvZHhhYkZlcDFEMTFuVXda?=
 =?utf-8?B?TmtsNHBIMWZvWFE4b2tDQ0pqbnhtTXg4REJ3aUtucHJoRklSSkVQRTRmNU9L?=
 =?utf-8?B?bmIzSjd5T1dtd0hvQXdmSDByYjJJekF4WDk5NjRxZDl3cVhweGlpUExsN1k3?=
 =?utf-8?B?UVNGdHdwYmdOSlppZy9wMVBXbWNQdDN5Y3lBNnp0Qk1xbEtpcmR2ZzVhV3Rw?=
 =?utf-8?B?b1FrMzlHM1lTT21YdlowUjFPdVR4NlJxNlRJSGdydWxGOFFEdEZzd0ExU3lJ?=
 =?utf-8?B?YWl5MXMrTkZGclBxV1ZzUlZSN01pakpBRzFOWXE0Mnc2MGw1bDJWUXVHdzB0?=
 =?utf-8?B?WS9mREwzZEVjQkM1Z1ZIZldQcFZKVWd2Q2NPSzBaVm1qT2gwQkZhZHY2b00z?=
 =?utf-8?B?TjRVVzZLM3RINlFJRWI4MHEyODdyZERmcWhuV3NrY2xldXdWbHZmM21ZaERw?=
 =?utf-8?B?ZUhVeldOTFFhYzlFMlIyWEV4a1pKeVhrTTAwNnoyUEVwaHlBQ25WVjFGbWZp?=
 =?utf-8?B?MjBWWE5jbWVzTmg0MnZBYW9taWhCcHdQZjRoUzBjMGdUQWlMcmpNbDBLSDhR?=
 =?utf-8?B?SGxVcGJtRG5Zb0UzV3FLelRrTk9pcUZaOTNLVjhsaDZlTnpCVXIzYlNWNnhw?=
 =?utf-8?B?eC8zWHgrVEZla3YycXBuS3lESk4zeWd0QURUaHJCenJ0TzNobG9IZDFZaDZR?=
 =?utf-8?B?cHh3UzFNNVpqc3NFRnc4UXpGQkVTT2VyeXBwLzg2cW4yeWdsa3V0NjFTeG9W?=
 =?utf-8?B?S1BJbXZJV2RhaEpJS3Zaa3pHaFF6TGJVZXNOeUM4cDRnSHpVV3FxbUdFMjBW?=
 =?utf-8?B?Um9HbnQwSysrbHFEeDBMaVB0OFBvSnNDMk5FUEg0VjRmWXZxTlBNNFh0YkpN?=
 =?utf-8?B?akJOZ1h1UWxzZEk0dmp5K0plN3k5UXU1QmdFNmtRd1ZGY1ZtUTB2SHlFOG5z?=
 =?utf-8?B?K1llQkhIUVp0Sm9IbDIrako3ZXpiOHJldGMxbHpJWlRUZHRjc3ZVZ2RtMytJ?=
 =?utf-8?B?SzBvVkdkcUNIZDk5cFVCb3dLeC9VSEI5SGFvcXF6OXlFWUJrOVN6QTdiZDdG?=
 =?utf-8?B?Y2FQVDdjU3Boak9odGdrWGo5T2ZGeWE0NHRtWVpoOHJvM3J4SWM4TVZIUTZu?=
 =?utf-8?B?L0liNWdPUERoMmh1N29xV3NxYWJtWkU4VWFqMlJkb2RYNWtQSmJ6dFJtU29r?=
 =?utf-8?B?OHNzU3VsK1pIM1NFWGszZE5JSXlLSnJKcmNxSWV5eG4vUElraFArU3BGeEk1?=
 =?utf-8?B?MXdzWUdUcnBoaUxMWEJYRzdIZjk3VjBtV0pZK1pReWt3L2d6M1Q4TjFITHFD?=
 =?utf-8?Q?wIdY=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(14060799003)(35042699022)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 15:15:59.3216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f18cad-43e3-4a83-f6f9-08de4dffa9d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5664
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



On 16/12/2025 17:30, Boris Brezillon wrote:
> On Mon, 15 Dec 2025 17:14:47 +0000
> Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:
> 
>> +/**
>> + * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
>> + * hardware block went through in a sampling period.
>> + *
>> + * Because the sampling period is controlled from userspace, the block may undergo multiple
>> + * state transitions, so this must be interpreted as one or more such transitions occurring.
>> + */
>> +enum drm_panthor_perf_block_state {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
>> +	 * the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
>> +	 * the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
>> +	 * sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
>> +	 * some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
> 
> Missing blank line.
> 
Ack.

>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
>> +	 * some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
>> +	 * for some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
>> +	 * for some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_block_header - Header present before every block in the
>> + * sample ringbuffer.
>> + */
>> +struct drm_panthor_perf_block_header {
>> +	/** @block_type: Type of the block. */
>> +	__u8 block_type;
>> +
>> +	/** @block_idx: Block index. */
>> +	__u8 block_idx;
>> +
>> +	/**
>> +	 * @block_states: Coarse-grained block transitions, bitmask of enum
>> +	 * drm_panthor_perf_block_states.
>> +	 */
>> +	__u8 block_states;
>> +
>> +	/**
>> +	 * @clock: Clock used to produce the cycle count for this block, taken from
>> +	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
>> +	 */
>> +	__u8 clock;
>> +
>> +	/** @pad: MBZ. */
>> +	__u8 pad[4];
> 
> Why not make it a __u32?
> 

I don't think there's any good reason not to, will change it in the next series.

>> +
>> +	/** @enable_mask: Bitmask of counters requested during the session setup. */
>> +	__u64 enable_mask[2];
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
>> + * period.
>> + */
>> +enum drm_panthor_perf_sample_flags {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
>> +	 * of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
>> +	 * the sample duration.
>> +	 */
>> +	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_sample_header - Header present before every sample.
>> + */
>> +struct drm_panthor_perf_sample_header {
>> +	/**
>> +	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
>> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
>> +	 */
>> +	__u64 timestamp_start_ns;
>> +
>> +	/**
>> +	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
>> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
>> +	 */
>> +	__u64 timestamp_end_ns;
>> +
>> +	/** @block_set: Set of performance counter blocks. */
>> +	__u8 block_set;
>> +
>> +	/** @pad: MBZ. */
>> +	__u8 pad[3];
>> +
>> +	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
>> +	__u32 flags;
>> +
>> +	/**
>> +	 * @user_data: User data provided as part of the command that triggered this sample.
>> +	 *
>> +	 * - Automatic samples (periodic ones or those around non-counting periods or power state
>> +	 * transitions) will be tagged with the user_data provided as part of the
>> +	 * DRM_PANTHOR_PERF_COMMAND_START call.
>> +	 * - Manual samples will be tagged with the user_data provided with the
>> +	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
>> +	 * - A session's final automatic sample will be tagged with the user_data provided with the
>> +	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
>> +	 */
>> +	__u64 user_data;
>> +
>> +	/**
>> +	 * @toplevel_clock_cycles: The number of cycles elapsed between
>> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
>> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
>> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
>> +	 */
>> +	__u64 toplevel_clock_cycles;
>> +
>> +	/**
>> +	 * @coregroup_clock_cycles: The number of cycles elapsed between
>> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
>> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
>> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
>> +	 */
>> +	__u64 coregroup_clock_cycles;
>> +
>> +	/**
>> +	 * @shader_clock_cycles: The number of cycles elapsed between
>> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
>> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
>> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
>> +	 */
>> +	__u64 shader_clock_cycles;
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
>> + * IOCTL.
>> + */
>> +enum drm_panthor_perf_command {
>> +	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
>> +	DRM_PANTHOR_PERF_COMMAND_SETUP,
>> +
>> +	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
>> +	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
>> +
>> +	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
>> +	DRM_PANTHOR_PERF_COMMAND_START,
>> +
>> +	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
>> +	DRM_PANTHOR_PERF_COMMAND_STOP,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
>> +	 *
>> +	 * When the sampling session is configured with a non-zero sampling frequency, any
>> +	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
>> +	 * -EINVAL.
>> +	 */
>> +	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
>> + */
>> +struct drm_panthor_perf_control {
>> +	/** @cmd: Command from enum drm_panthor_perf_command. */
>> +	__u32 cmd;
>> +
>> +	/**
>> +	 * @handle: session handle.
>> +	 *
>> +	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
>> +	 * It must be used in subsequent commands for the same context.
>> +	 */
>> +	__u32 handle;
>> +
>> +	/**
>> +	 * @size: size of the command structure.
>> +	 *
>> +	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
>> +	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
>> +	 * struct_size) to the pointer and update the size accordingly.
>> +	 */
>> +	__u64 size;
>> +
>> +	/**
>> +	 * @pointer: user pointer to a command type struct, such as
>> +	 *            @struct drm_panthor_perf_cmd_start.
>> +	 */
>> +	__u64 pointer;
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
>> + *
>> + * The hardware supports a single performance counter set at a time, so requesting any set other
>> + * than the primary may fail if another process is sampling at the same time.
>> + *
>> + * If in doubt, the primary counter set has the most commonly used counters and requires no
>> + * additional permissions to open.
>> + */
>> +enum drm_panthor_perf_counter_set {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
>> +	 *
>> +	 * This is the only set for which all counters in all blocks are defined.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_PRIMARY,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
>> +	 *
>> +	 * Some blocks may not have any defined counters for this set, and the block will
>> +	 * have the UNAVAILABLE block state permanently set in the block header.
>> +	 *
>> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_SECONDARY,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
>> +	 *
>> +	 * Some blocks may not have any defined counters for this set, and the block will have
>> +	 * the UNAVAILABLE block state permanently set in the block header. Note that the
>> +	 * tertiary set has the fewest defined counter blocks.
>> +	 *
>> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_TERTIARY,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_ringbuf_control - Struct used to map in the ring buffer control indices
>> + *                                           into memory shared between user and kernel.
>> + *
>> + */
>> +struct drm_panthor_perf_ringbuf_control {
>> +	/**
>> +	 * @extract_idx: The index of the latest sample that was processed by userspace. Only
>> +	 *               modifiable by userspace.
>> +	 */
>> +	__u64 extract_idx;
>> +
>> +	/**
>> +	 * @insert_idx: The index of the latest sample emitted by the kernel. Only modifiable by
>> +	 *               modifiable by the kernel.
>> +	 */
>> +	__u64 insert_idx;
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
>> + * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
>> + */
>> +struct drm_panthor_perf_cmd_setup {
>> +	/**
>> +	 * @block_set: Set of performance counter blocks, member of
>> +	 *             enum drm_panthor_perf_block_set.
>> +	 *
>> +	 * This is a global configuration and only one set can be active at a time. If
>> +	 * another client has already requested a counter set, any further requests
>> +	 * for a different counter set will fail and return an -EBUSY.
>> +	 *
>> +	 * If the requested set does not exist, the request will fail and return an -EINVAL.
>> +	 *
>> +	 * Some sets have additional requirements to be enabled, and the setup request will
>> +	 * fail with an -EACCES if these requirements are not satisfied.
>> +	 */
>> +	__u8 block_set;
>> +
>> +	/** @pad: MBZ. */
>> +	__u8 pad[7];
>> +
>> +	/** @fd: eventfd for signalling the availability of a new sample. */
>> +	__u32 fd;
>> +
>> +	/** @ringbuf_handle: Handle to the BO to write perf counter sample to. */
>> +	__u32 ringbuf_handle;
>> +
>> +	/**
>> +	 * @control_handle: Handle to the BO containing a contiguous 16 byte range, used for the
>> +	 * insert and extract indices for the ringbuffer.
>> +	 */
>> +	__u32 control_handle;
>> +
>> +	/**
>> +	 * @sample_slots: The number of slots available in the userspace-provided BO. Must be
>> +	 * a power of 2.
>> +	 *
>> +	 * If sample_slots * sample_size does not match the BO size, the setup request will fail.
>> +	 */
>> +	__u32 sample_slots;
>> +
>> +	/**
>> +	 * @control_offset: Offset into the control BO where the insert and extract indices are
>> +	 * located.
>> +	 */
>> +	__u64 control_offset;
>> +
>> +	/**
>> +	 * @sample_freq_ns: Period between automatic counter sample collection in nanoseconds. Zero
>> +	 * disables automatic collection and all collection must be done through explicit calls
>> +	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will disable manual counter sampling
>> +	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
>> +	 *
>> +	 * This disables software-triggered periodic sampling, but hardware will still trigger
>> +	 * automatic samples on certain events, including shader core power transitions, and
>> +	 * entries to and exits from non-counting periods. The final stop command will also
>> +	 * trigger a sample to ensure no data is lost.
>> +	 */
>> +	__u64 sample_freq_ns;
>> +
>> +	/**
>> +	 * @fw_enable_mask: Bitmask of counters to request from the FW counter block. Any bits
>> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
>> +	 * corresponds to counter 0.
>> +	 */
>> +	__u64 fw_enable_mask[2];
>> +
>> +	/**
>> +	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW counter block. Any bits
>> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
>> +	 * corresponds to counter 0.
>> +	 */
>> +	__u64 cshw_enable_mask[2];
>> +
>> +	/**
>> +	 * @tiler_enable_mask: Bitmask of counters to request from the tiler counter block. Any
>> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit
>> +	 * 0 corresponds to counter 0.
>> +	 */
>> +	__u64 tiler_enable_mask[2];
>> +
>> +	/**
>> +	 * @memsys_enable_mask: Bitmask of counters to request from the memsys counter blocks. Any
>> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
>> +	 * corresponds to counter 0.
>> +	 */
>> +	__u64 memsys_enable_mask[2];
>> +
>> +	/**
>> +	 * @shader_enable_mask: Bitmask of counters to request from the shader core counter blocks.
>> +	 * Any bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
>> +	 * Bit 0 corresponds to counter 0.
>> +	 */
>> +	__u64 shader_enable_mask[2];
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_cmd_start - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
>> + * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
>> + */
>> +struct drm_panthor_perf_cmd_start {
>> +	/**
>> +	 * @user_data: User provided data that will be attached to automatic samples collected
>> +	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
>> +	 */
>> +	__u64 user_data;
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_cmd_stop - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
>> + * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
>> + */
>> +struct drm_panthor_perf_cmd_stop {
>> +	/**
>> +	 * @user_data: User provided data that will be attached to the automatic sample collected
>> +	 * at the end of this sampling session.
>> +	 */
>> +	__u64 user_data;
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_cmd_sample - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
>> + * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
>> + */
>> +struct drm_panthor_perf_cmd_sample {
>> +	/** @user_data: User provided data that will be attached to the sample.*/
>> +	__u64 user_data;
>> +};
>> +
>>  /**
>>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>>   * @__access: Access type. Must be R, W or RW.
>> @@ -1237,6 +1800,8 @@ enum {
>>  		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
>>  	DRM_IOCTL_PANTHOR_BO_QUERY_INFO =
>>  		DRM_IOCTL_PANTHOR(WR, BO_QUERY_INFO, bo_query_info),
>> +	DRM_IOCTL_PANTHOR_PERF_CONTROL =
>> +		DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
>>  };
>>  
>>  #if defined(__cplusplus)
> 

