Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D4B11A93
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 11:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B9B10E0C9;
	Fri, 25 Jul 2025 09:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="g4Wgyv1w";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g4Wgyv1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9729B10E0C9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 09:10:25 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G+pjhVquvDzK4phC+aXcx01Ow04IJk7Fst1HNIQif3TmxqL9ynDIdmxXGK4vrz51AveAe18x/5XnXRxZm3cPp0lc8E8rQhb7pgLEn4B58W1orhqMK4v5Ldmefh/9ZLEtQHkNbasPzkjWiu9FamQeRVst/8I77AQ3ViJkDIT1lcHdSCNbRCgpDrmPdiplSPbvlWndYOh7cIbov4rIOxafVc+Qjkw3Vd9HFKoqkG6yEjk/sKVMjnP8LHUG/Hg9VlIOiDYxnWGsnnFOJrTm7Caf0savvfZ5WM1PCueRxE+EZgY8w9wkXq9RLLbIjhXGLJT33ui/DEwyP+e60RgLktolaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyyDuD9f1VcWxszrTAYYROTgrBnmiTZr2Z0IQMZfSpA=;
 b=jqGQLxI6lZ1xK5OWxtWU8cM9ERnclCWD/mHeaZ9sNnvLr07SmVZ2c9D+Q6UhrXW9ufNgOtGw/UVv0iZsAtQoBZBhO8Q2UMgdTL8lVziUu3RinpoyN6Vc1T/jYDlkmgJj7VoEk95rD5tnsQZbp8lQCfw+VIoFASJkaVsP4qvJppiQ7PSHcg/WeKf8rzx52PzznOwU1I7GKWn/8Ete/lJop31xXMmiIYeK+T8zulRsTUkANQFr5RHV1dGsUYpDpw4KmEYJH8YRY3KK/D9wOUHPbG/5aOs4mwjmNvuCEDf2uj/FsMbLhgMf+rGyAH0aJ1F+L95wsPNWZFSspZW/wvDxPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyyDuD9f1VcWxszrTAYYROTgrBnmiTZr2Z0IQMZfSpA=;
 b=g4Wgyv1wOuLXn62wM+hwia1hWGOfLDDo5Lp/+ySIabJrA7sf20YHto0FNPxcWv8R2n0rnx4PoprwiXjmlaHWHrFw6XJxoKac6WPbL+hzwn4vRdLZmwWuHGScNqB9lR+Pebq9Wn1+K1VS5Ngj7uZeKHua5+MaexxSdqT2N3hTwOQ=
Received: from AS4PR09CA0016.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::8)
 by DB9PR08MB7700.eurprd08.prod.outlook.com (2603:10a6:10:393::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 09:10:18 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::51) by AS4PR09CA0016.outlook.office365.com
 (2603:10a6:20b:5d4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 09:10:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 09:10:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7xlqgVp1fLbJjBU9MTSeABoHd2Zw0hHUETsnt0LQRSjUIVDCTAqYshjjoI1+3C54AOyg1JLl93U0fQzNLA3WmlnHNG6oQwagp4d4PCLalC71QlGwGJHFvo04Ug/CLJnqMnes908J/wEWAZ3YAGP8AJcKZe9kAb48xL4Ibjh+eC6xbHcWVpeobf1p0ThyqCPFEOrSAPD+zdH6OOpPAi+yGkQTI4emopZIGvnSb1y8FsE07ur7Xqv8h+sYFzqTB8nRkGRYpTod+Dsz/Dj53mLu77mjYzmpasF0uW5jQMFX2CAvcuZlq9H0TTb1LBPwgBIxg3bvLUt5t3BreYVOnbiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyyDuD9f1VcWxszrTAYYROTgrBnmiTZr2Z0IQMZfSpA=;
 b=wEzjp4Jh4thrwHC2/KlxPba15evuhywFPWKQ1XJ3o04t492hWa8HrbSdleFGlYyl7AROOpCBPIDR7MTT0uoYVSQvABf77/KYVs7IH7W/NwNQAMFvDV8LB/Di12NHQczPZRVUKvHgqJ1DnEwnAe/JIWbeL1nT1mvu54V55BT840YMOe9DHmRwpEAnWamsrcpj/Q34JxS4xe9tEKZPmf0FE80eVSIdiCyNi6OdrqJlAM7Te0/ABeX4bJSaq0JX/ttw2jYdo5dVEuCoIHXB+FS8t4rdROIcsstDLni+8gGtDgmZw/NV+cybfjMBTip6zzo5IStT7WkiutozxmfwTwmrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyyDuD9f1VcWxszrTAYYROTgrBnmiTZr2Z0IQMZfSpA=;
 b=g4Wgyv1wOuLXn62wM+hwia1hWGOfLDDo5Lp/+ySIabJrA7sf20YHto0FNPxcWv8R2n0rnx4PoprwiXjmlaHWHrFw6XJxoKac6WPbL+hzwn4vRdLZmwWuHGScNqB9lR+Pebq9Wn1+K1VS5Ngj7uZeKHua5+MaexxSdqT2N3hTwOQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by PAXPR08MB6624.eurprd08.prod.outlook.com (2603:10a6:102:dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 09:09:41 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 09:09:41 +0000
Message-ID: <424cfb2c-c693-4197-89c8-6c3b13477141@arm.com>
Date: Fri, 25 Jul 2025 10:09:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] drm/panthor: Expose the panthor perf ioctls
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <d196bcce96cf0e3672905c3cb0336505728ddc52.1747148172.git.lukas.zapolskas@arm.com>
 <xbia7yhrqgmagxqaa4c34ngj5gksy7saxlsnea6aarlvolqj6a@ebvrj2vhmy3z>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <xbia7yhrqgmagxqaa4c34ngj5gksy7saxlsnea6aarlvolqj6a@ebvrj2vhmy3z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0525.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::8) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|PAXPR08MB6624:EE_|AMS0EPF000001A6:EE_|DB9PR08MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 6786adc2-4070-411c-1363-08ddcb5b1337
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Tkt0YzVGRjJmV1ZXV0xZNnR0bEEyaytXUEJzY0ZGbkZiUnFPVkpNWEZlYXVr?=
 =?utf-8?B?dTVCMWhyekVpd2x2b3N6TXhsaGU1Wkd0R2tNcnlBdEMrdkhjNUEyLzhEamxn?=
 =?utf-8?B?dEJmK3IrTlVxaHEzVzJZREJKczcwK2NTMHhyRDRnaFFRYUZuNDFYL1VyVmRV?=
 =?utf-8?B?Umh6NTEyUWJpVTY1a29vdWFJRzdhZ21CWWVJVG44dlVVQ0tVSU9EL002ZW9q?=
 =?utf-8?B?RGVmUFVRSmZpUm5HWk05THFxazRRN2xpajBGWGZjdlZ0bFIwTFN3K0RqL0Yv?=
 =?utf-8?B?S2hyTUYzS3VldFBjZURxN2pqTVdGbDM1TjVBcm80bGh4SmxEYkIzVEc3dWNJ?=
 =?utf-8?B?YVFkQm9UL0FPMWI5NjgzamFmYTJPVXk2ZUxzajB4MGhiSHFCZk9qQXpCNFZE?=
 =?utf-8?B?Q2IvaG80R3BWM3padHpVRVlCOStDWXlzTWUvd1NPeFF1T3d4RFNWcVpFdS9w?=
 =?utf-8?B?bWx0dXpwMlc5QVNzT3hmdHkwSGhsOW5XdmNCOG85bmxkMnBCUzVGK3dWMFh4?=
 =?utf-8?B?WnduTFpNRjk4ZmhEU01lMVVwUUVWYTcvMGlvMXRBQitTYTErNkgzcy9aVXFw?=
 =?utf-8?B?cTd4VWJTSXpjK0ROL3E5Q0ZjVE8rWjhtaFJIajNXUlp1OFFBQStoUkFBanZK?=
 =?utf-8?B?My9CVGxEUDFOVWd6eU5xcGo0Mng0QnI0UnJha013c1k1aFViYVVzaUFoTHlm?=
 =?utf-8?B?N0ZqdjBZNy8wYStIMFFWQzIrVGRLaG1oSmtUeDcyWG8rVkZ3bzc4ZFBxMk9P?=
 =?utf-8?B?UWhlamZUcjVhOU9RekpwWDFEN3BRUElMOVdVVHFFV3JsZGliRUlyQW14eCtC?=
 =?utf-8?B?NDN1VEJpc2p1WDlRR0N4MHUvNjFkQ1ZyUmJrWXlVK3RYM3lJdWpFOHF3OGpY?=
 =?utf-8?B?SVY1STJmMUM0TjBWV1BkeGVrZmdid3FoVlo0Qkk1WVk3VUduZGJBOVRmYTN4?=
 =?utf-8?B?NmN1T0p5MHdWUlRlaU9ncGlWekM2UFhDK0txR1J4SzY4TzR2bU1DVGlmelJw?=
 =?utf-8?B?aWNtR0Q5aWp5TGd5d2taRU9zcGI3blZwdEZSQ2ZzeElXb2lEWjlXeWVxSFor?=
 =?utf-8?B?cms3ck1abU5jaUxTK24wYWRhUHUvdCtxWnhTWlV0ekxhUGhyUzRXdGhiVXk5?=
 =?utf-8?B?R29XbE5BTlYyc0VOUC9HUUhPUS9McWFrbDJZMVZPbkNqbUt4QjAzZ21lQ2ZV?=
 =?utf-8?B?eEltQzVUSFdpWVVqRVd3MHZyemdHNWgzS3RCZXdFWEVMMWZqdFQ0d3dOenB2?=
 =?utf-8?B?VGdPc3U3Y0pNa0pmU2FQQ2RTTDdVNFdaOXdEUm54c2Rub1c1YXQzdmFVRkJK?=
 =?utf-8?B?MlJjNFBsY1NnaFhMbnpVbFlkMjBMSGVmblgrT2hmaE0xMzlPTUp5SlBIT3Rw?=
 =?utf-8?B?TDlMRUp1ckJHYlhmUHgwVnJSaXU2dm82cGc1and2YnVqb2x1d3AwUFJUcHVM?=
 =?utf-8?B?M0RoTzRQN2lPYmkzenRSRWRjdzlubjFzd0Y0TFdacTdCM00yZ3oxQVVoeTNj?=
 =?utf-8?B?UHM2ZTFkeHJkVGdSVDIvVkplU3FEalVzUFQwYVFFV3BsUVhVOWs0dGtEeXlx?=
 =?utf-8?B?VU12R1d3ZEdna3lSWXBXWjA5WGFScDk1empuZS9qLzV5cHVMVWZ1cVNEQnV4?=
 =?utf-8?B?ejN4OHBUa0I5VGxSSmEwQU9DdkRMUUVTRTNISUJHQThOSVptV0lFNkdpQkNH?=
 =?utf-8?B?dlMwVCt0UEFKTk5DaXpkNkZpbmdHVHgvcWxVRWRYeDQ3SXVXNzQvemEyUXBO?=
 =?utf-8?B?MWR0QUdUUmgvcFU4K3BHL1l3NkU0YUlWaERvSWdXVHdURTJkMVdIOFo4Y1dt?=
 =?utf-8?B?Q2Vma280eUVzbStEM2JBSWlPYzdyYkxqdXZ5aVVMNEJ4akxSdEJFWlRzbjNy?=
 =?utf-8?B?MTl4QTFUVVBLTzlUKzJDdzZVbCsvWE9UbGJsci8zRVZreU1TREFLa05yelpk?=
 =?utf-8?Q?Y2q4SCt9kL0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6624
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 73420943-f1d3-49af-e90a-08ddcb5afd2c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|14060799003|35042699022|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWZvZHl1K1l4R29HM2p3enFIR0NXNGxxSUw4SFBIUDV4eU5JSlpkTTdWcUNY?=
 =?utf-8?B?VHFEc3FoUDhYdEtzRnAwMWJjbU82Q0psWThWVFA5V2Y0WXFTSVRCNzVmZmZT?=
 =?utf-8?B?ZElVTE9Ec0xVaGl3M3dmMmJNSHhxYmlGVDFyTjQ0RWJyQTkvQUtvUGxlMHdN?=
 =?utf-8?B?UURrcXZLQnZRUkZMM2xUM1BLYlo3TUhhTG9SR0V0T1Q2SG1yVTdWbDU1dmtJ?=
 =?utf-8?B?aG8yUDRvUFFYQ1F6Skg3eVQ2aTNiU09yTDBoRGFaVFVFL1gzRlNxSURaa3Fm?=
 =?utf-8?B?SXJGV082WEUvT1VLVDZROVJtQUwyZkpTcTJBdXUrNU4wT2JMeEVwQy8xRUtH?=
 =?utf-8?B?dTBzNzIyZXh0N1dkSWFiWFZ5VXFaZHh2TEloK2RTMmc4N0pwTDFEODdaYVFx?=
 =?utf-8?B?M2Znam1EZkZVdGFEK0tzS0FQY01IODV4YzRQTVhGQnRON2V6c0ZvT1A3Q0V6?=
 =?utf-8?B?VE5rUUZxSnUvb2M3Mmhhb3Q4cWgySXJSNCtjbzlpSGhpWlBXTHFjTmxJMzBB?=
 =?utf-8?B?NEhySXJqYUxYMlh3UXpyc21BNTJ1S0xQZmhOVnp2bnovYTRsL3BMbDdZcWs0?=
 =?utf-8?B?dVYwa3B3STVnNWNTYW9HNWJDVlVUTXhHcnorL2lxVStnK3JSSVZaSVByd3Iw?=
 =?utf-8?B?S0ZPZElaY0ZkSUxqMDBxOTNsTFFmUzE3RjNKYzdMeU1KZGhBaUlrd1QwUGhW?=
 =?utf-8?B?UGhXY29IODV3Qkx0NFJvZnFXdVY5eXVXekVQb0lYRTJQai9rY0MzS25EZWl3?=
 =?utf-8?B?Z2I2cDFiNkNjRVhhTXZvSWtKM2FPSUJsUXJzKzBnYjhETGtwZVB1Y3g1N2FR?=
 =?utf-8?B?UXBxcjN5RnIxSSt2OXJ4RjNYTngwZENjTXhIcWNlNWk5aHlzZlNoeG5hTW1D?=
 =?utf-8?B?WklpcGQ1SlNUNlZuZ1A4YXhjZFZyU0pJVTY2WHZlcDdRMERyQ0NlVHVMWDhW?=
 =?utf-8?B?bmFhc3lvUnZCVzJPL1E3WWJTS3pTNVZSVi9UVWtLYVlXMjNCZUNOODZXSGdL?=
 =?utf-8?B?bjh4OXpwSVczK21ML3kzVDRWWFQ3Ry9sV1FUM1NqT3R3MUxHczlSRis4a1FC?=
 =?utf-8?B?Q20zSXJSSFgxeko1SkRPemZLK1BwcFpyOUt6M3QvN0w0Sld3OW00QmxFd0NT?=
 =?utf-8?B?eDdHVUdoejVlNTlydWc4ZDR3ak8wOEdIMnhLR0J4TzlVNzYzWUtQTWJnTDhY?=
 =?utf-8?B?dmdFYUYvWGhaK1ovbDJHY3ZBbWpkWmUycjh4R2hDMXAxQ3BWTVlKbDFqZE1n?=
 =?utf-8?B?alNuV3NLR0V3OTlFOGl6VVR2eGN3OHA3U0liTWFPWm1CVVBjZGk5amI5SitH?=
 =?utf-8?B?QUNmNGVnSEE5cnhNUDdhVGtNd2dOaW9id1JpTmZBSTIwZThnVlVHdFpod0l2?=
 =?utf-8?B?MTZhRlBXZnlYQ3JORDR5T24rUUgvdGxGQ2tENHNReWs5eHJEQkFqek5FQ1Q0?=
 =?utf-8?B?WnNxN0tKandIQnhOZFFVMTFtc0xCZjFvQWtZUU9tbWltbTFTUURZKzdRNkhQ?=
 =?utf-8?B?Tm5EWGkySmUvTXNMWGFOeGs0ai95Y0l0WEJMSkFOTXkrbjI1Y3BUbFBKMXFT?=
 =?utf-8?B?bzkwN0NDSnZwOVFxZmJLbjFWeHhRcWtBN2IvUXVlOE5kdlBjTEpsQkJmWmhK?=
 =?utf-8?B?d0tWYnlmeEZrNmdtM2FlTlVxR3lJQVpvcE10QnNSUlh4YTg5aDYyNy9meWN4?=
 =?utf-8?B?ajVMeXNBV2dFVHM1MzJJdWc5Q3ZXbno1OEFMZUpYekp0UEVsWTJQcWFBallZ?=
 =?utf-8?B?Qy9LWVQ0RlNJNHNYVk43MWZpdmN6Z2dYRGkvYmIrWHhtMjNUM2hhK2tpb1dK?=
 =?utf-8?B?OFo3VEI3dE5ReWFRSzJrU3g2RzFvME5sZitwNHo1Z1dEN21ZU2ljZWtTZXZq?=
 =?utf-8?B?cDhZeW5Gd24yOWdibDAwY3BubWJjSURpVzZSUnpLbm04T21XTlFuLzFGVnEv?=
 =?utf-8?B?R3pJSDZxYm04SGV3ZzhKQmdVRjdDNmhDV1BwSG90ZHh5Qzg3V0Nta2F3bmo4?=
 =?utf-8?B?bUhmSlhBeWkvdVlVNDUvdElmTkZ0TVlIVGdjUDh5VGVsWnpqRC9Ga1MycW8w?=
 =?utf-8?Q?FW1aGI?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(14060799003)(35042699022)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 09:10:18.0301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6786adc2-4070-411c-1363-08ddcb5b1337
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7700
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



On 18/07/2025 16:19, Adrián Larumbe wrote:
> Hi Lucas, another missing remark from the original review,
> 
> On 16.05.2025 16:49, Lukas Zapolskas wrote:
>> This patch implements the PANTHOR_PERF_CONTROL ioctl series, and
>> a PANTHOR_GET_UOBJ wrapper to deal with the backwards and forwards
>> compatibility of the uAPI.
>>
>> The minor version is bumped to indicate that the feature is now
>> supported.
>>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_drv.c | 141 +++++++++++++++++++++++++-
>>  1 file changed, 139 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 4c1381320859..850a894fe91b 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -31,6 +31,7 @@
>>  #include "panthor_gpu.h"
>>  #include "panthor_heap.h"
>>  #include "panthor_mmu.h"
>> +#include "panthor_perf.h"
>>  #include "panthor_regs.h"
>>  #include "panthor_sched.h"
>>
>> @@ -73,6 +74,39 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
>>  	return 0;
>>  }
>>
>> +/**
>> + * panthor_get_uobj() - Copy kernel object to user object.
>> + * @usr_ptr: Users pointer.
>> + * @usr_size: Size of the user object.
>> + * @min_size: Minimum size for this object.
>> + *
>> + * Helper automating kernel -> user object copies.
>> + *
>> + * Don't use this function directly, use PANTHOR_UOBJ_GET() instead.
>> + *
>> + * Return: valid pointer on success, an encoded error code otherwise.
>> + */
>> +static void*
>> +panthor_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size)
>> +{
>> +	int ret;
>> +	void *out_alloc __free(kvfree) = NULL;
>> +
>> +	/* User size shouldn't be smaller than the minimal object size. */
>> +	if (usr_size < min_size)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	out_alloc = kvmalloc(min_size, GFP_KERNEL);
>> +	if (!out_alloc)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	ret = copy_struct_from_user(out_alloc, min_size, u64_to_user_ptr(usr_ptr), usr_size);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return_ptr(out_alloc);
>> +}
>> +
>>  /**
>>   * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
>>   * @in: The object array to copy.
>> @@ -176,7 +210,12 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
>>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
>> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
>> +
>>
>>  /**
>>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
>> @@ -191,6 +230,24 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>>  			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
>>  			 sizeof(_src_obj), &(_src_obj))
>>
>> +/**
>> + * PANTHOR_UOBJ_GET() - Copies a user object from _usr_ptr to a kernel accessible _dest_ptr.
>> + * @_dest_ptr: Local variable
>> + * @_usr_size: Size of the user object.
>> + * @_usr_ptr: The pointer of the object in userspace.
>> + *
>> + * Return: Error code. See panthor_get_uobj().
>> + */
>> +#define PANTHOR_UOBJ_GET(_dest_ptr, _usr_size, _usr_ptr) \
>> +	({ \
>> +		typeof(_dest_ptr) _tmp; \
>> +		_tmp = panthor_get_uobj(_usr_ptr, _usr_size, \
>> +				PANTHOR_UOBJ_MIN_SIZE(_tmp[0])); \
>> +		if (!IS_ERR(_tmp)) \
>> +			_dest_ptr = _tmp; \
>> +		PTR_ERR_OR_ZERO(_tmp); \
>> +	})
>> +
>>  /**
>>   * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
>>   * object array.
>> @@ -1339,6 +1396,83 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
>>  	return 0;
>>  }
>>
>> +#define perf_cmd(command) \
>> +	({ \
>> +		struct drm_panthor_perf_cmd_##command *command##_args __free(kvfree) = NULL; \
>> +		int _ret = PANTHOR_UOBJ_GET(command##_args, args->size, args->pointer); \
>> +		if (_ret) \
>> +			return _ret; \
>> +		return panthor_perf_session_##command(pfile, ptdev->perf, args->handle, \
>> +				command##_args->user_data); \
>> +	})
>> +
>> +static int panthor_ioctl_perf_control(struct drm_device *ddev, void *data,
>> +				      struct drm_file *file)
>> +{
>> +	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
>> +	struct panthor_file *pfile = file->driver_priv;
>> +	struct drm_panthor_perf_control *args = data;
>> +	int ret;
>> +
>> +	if (!args->pointer) {
>> +		switch (args->cmd) {
>> +		case DRM_PANTHOR_PERF_COMMAND_SETUP:
>> +			args->size = sizeof(struct drm_panthor_perf_cmd_setup);
>> +			return 0;
>> +
>> +		case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
>> +			args->size = 0;
>> +			return 0;
>> +
>> +		case DRM_PANTHOR_PERF_COMMAND_START:
>> +			args->size = sizeof(struct drm_panthor_perf_cmd_start);
>> +			return 0;
>> +
>> +		case DRM_PANTHOR_PERF_COMMAND_STOP:
>> +			args->size = sizeof(struct drm_panthor_perf_cmd_stop);
>> +			return 0;
>> +
>> +		case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
>> +			args->size = sizeof(struct drm_panthor_perf_cmd_sample);
>> +			return 0;
>> +
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	switch (args->cmd) {
>> +	case DRM_PANTHOR_PERF_COMMAND_SETUP:
>> +	{
>> +		struct drm_panthor_perf_cmd_setup *setup_args __free(kvfree) = NULL;
>> +
>> +		ret = PANTHOR_UOBJ_GET(setup_args, args->size, args->pointer);
>> +		if (ret)
>> +			return -EINVAL;
>> +
>> +		return panthor_perf_session_setup(ptdev, ptdev->perf, setup_args, pfile);
> 
> I think this is something I had already brought up in the revision for v2 of the patch series,
> but I think I would pass the drm_file here straight away rather than the panthor file,
> then retrieve the panthor_file pointer from the file's driver_priv field inside
> panthor_perf_session_setup, and that way you can get rid of struct panthor_file::drm_file.
> 
> I think this should be alright, because the only place where it'd be essential to keep
> a copy of the drm_file is in the session struct, to make sure sessions match their DRM device fd's.
> 

Thank you for pointing this out, I hadn't quite understood the suggestion for v2. Will update 
the patches accordingly. 

>> +	}
>> +	case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
>> +	{
>> +		return panthor_perf_session_teardown(pfile, ptdev->perf, args->handle);
>> +	}
>> +	case DRM_PANTHOR_PERF_COMMAND_START:
>> +	{
>> +		perf_cmd(start);
>> +	}
>> +	case DRM_PANTHOR_PERF_COMMAND_STOP:
>> +	{
>> +		perf_cmd(stop);
>> +	}
>> +	case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
>> +	{
>> +		perf_cmd(sample);
>> +	}
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>>  static int
>>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>>  {
>> @@ -1409,6 +1543,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>>  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>>  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
>> +	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
>>  };
>>
>>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
>> @@ -1518,6 +1653,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>>   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>>   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
>> + * - 1.4 - adds DEV_QUERY_PERF_INFO query
>> + *       - adds PERF_CONTROL ioctl
>>   */
>>  static const struct drm_driver panthor_drm_driver = {
>>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
>> @@ -1531,7 +1668,7 @@ static const struct drm_driver panthor_drm_driver = {
>>  	.name = "panthor",
>>  	.desc = "Panthor DRM driver",
>>  	.major = 1,
>> -	.minor = 3,
>> +	.minor = 4,
>>
>>  	.gem_create_object = panthor_gem_create_object,
>>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
>> --
>> 2.33.0.dirty
> 
> 
> Adrian Larumbe

