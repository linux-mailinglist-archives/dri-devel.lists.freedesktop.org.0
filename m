Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DCBCA5667
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222D210E21D;
	Thu,  4 Dec 2025 21:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="PyNV+ZOz";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PyNV+ZOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9779310E1F4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 15:19:49 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=p//7kenbTxNcvV9LoZDIeCrILRLNUVXFJ7TTmuzBdZw3D+m0bhHcPAft5alw5fL8Az/9ar9YCw8OHI1L9WBK+Gx7U8iyFSeKPOPjYjk0kX+Nln3by4o9/hhfwmNAlAcGU9U3pQdst5TMNa8KEMleAIbZ8LIdXAJx4HSzJKuQjrJmTphfd3+o0EWjmr1cHpCuwzhqYBbgOAaiO3xI4Q4YjKBqR/h6rWsAaxpW3cs3a4VgvJmyaI4dVsxmP6o7p7eHmU18ZdiH76gjWyVrL12JRakzbUsvPWZyxI0HkVDgvFVAQTFMW1A2SYwIQjXW9u82TW/pVRxdDhI4J7JSPF5p8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x4kpVz3dB+eBvhLH0IKcCGoS/cTCFF4hM5T7NjWMGg=;
 b=LdI69LgloL5Q+APaHCoUGm1P80nR53mXPn2DVVv8qZK720/NC3yXh1O9/crYDHg1kTh2os11zJG7r3w09PV4LCICCwm4KQDTRaUoEhlrM1Cx85t6RT0NV7Dr+/wnVXHnTHU58OtIVvHrrll7m7xcFiwquJhmVH28F7I9fiI0TZyORHavYlmws2NQRBOKc2CNQ8HGe+jDheECP4PTEA6mYcVWhRY6JNCm/e6Hw66U4zzuvfiyxTHpycxFIJqFQVJF0YHHc3zhx9qfX4rQ8891OdzIO5p/7GaxUnRQ32sd505YsGynGXJE0NARmiMD8A1F2mbl+YD5OQ9Ll3nooteyYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x4kpVz3dB+eBvhLH0IKcCGoS/cTCFF4hM5T7NjWMGg=;
 b=PyNV+ZOzt9/gAVm/aG8WQDypUEjXblPp6f91GOytNxwraC7u7oesae0xiIsexK0i/NhLaDDhrsR8JjiffeynX/XxB/eizBEZceEbXPrnwx76knIp9JlIMz5R480SFfKKz6rubWUkGh0+OV33SQgGZhf4Jyp3m8+dkex+QYKtV9Q=
Received: from DU2PR04CA0235.eurprd04.prod.outlook.com (2603:10a6:10:2b1::30)
 by DU0PR08MB7948.eurprd08.prod.outlook.com (2603:10a6:10:3e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 15:19:42 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::fc) by DU2PR04CA0235.outlook.office365.com
 (2603:10a6:10:2b1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Thu,
 4 Dec 2025 15:19:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 15:19:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtdR2ocUM67XJjdqBH3sTCg/XXHXzU6+vsbUDcfE5L+7jE8nvAcz8XFkxHjRXZwCOzlikynEjaC2PwnxKW6uJjuK6Ue0quyNUT6V4dpPM2sonDIponQftJIhAgd5/PeU7xZoqP4WKF99pWkoOHFIzJORKzLYbV2Yj215NxpBzyy0qQ7gNXmwyGpVhbMdXLcq2SPp7k5kG2Ayeiau7+LPwwfMJyRQ2+OdpsYDjGhNBcI5M6xAUUB//dRwmSS66B3W9Gj+iR7A9I/dxvikjthB/IIpi/87QMDifbOpWxUWRYuQ7BX1LmSnPwt1dgH9mKVxryD8jQi0URRTeQJaOwfa2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x4kpVz3dB+eBvhLH0IKcCGoS/cTCFF4hM5T7NjWMGg=;
 b=tAJVFIGtg7I1MdTYoGbMFBebVJpMbWduqb87ecTv3+wN1EbEDXn2XGNESxWo7YTUa7jgVLuEQa/+lrrmeLCJaDA7PnKdI7QPRmjcjiUFPs/Dy6Y5eYqCh7x+9siMoPe9XJNG6DcBOgnowqj33CNnKdqkqoU8m2tbuebzmRl6VcAowo0iivy31uVdYVxmxY9ep92D7GoB7lNlLmSLfwp3NFktzbJwnWYdmiBv5XzHfBm7yvVtyWLwmfsAnkGFqM0S3sPk5v66GkheNOMxGfEOLy7CmGLa1b6t0dDHahhcc4pwpcUFf+CRI4nkDYi4a4qmmJnCYM1CFKwI/fj1q+n7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x4kpVz3dB+eBvhLH0IKcCGoS/cTCFF4hM5T7NjWMGg=;
 b=PyNV+ZOzt9/gAVm/aG8WQDypUEjXblPp6f91GOytNxwraC7u7oesae0xiIsexK0i/NhLaDDhrsR8JjiffeynX/XxB/eizBEZceEbXPrnwx76knIp9JlIMz5R480SFfKKz6rubWUkGh0+OV33SQgGZhf4Jyp3m8+dkex+QYKtV9Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV2PR08MB8368.eurprd08.prod.outlook.com (2603:10a6:150:bb::7)
 by VI1PR08MB5341.eurprd08.prod.outlook.com (2603:10a6:803:135::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 15:18:39 +0000
Received: from GV2PR08MB8368.eurprd08.prod.outlook.com
 ([fe80::f88b:b5a0:3f87:e5a]) by GV2PR08MB8368.eurprd08.prod.outlook.com
 ([fe80::f88b:b5a0:3f87:e5a%7]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:18:39 +0000
Message-ID: <07577e37-9e37-4a95-b91c-d72330156835@arm.com>
Date: Thu, 4 Dec 2025 15:17:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/mcde: Create custom commit tail
To: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-2-f1bffd4ec0fa@kernel.org>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@arm.com>
In-Reply-To: <20251202-mcde-drm-regression-thirdfix-v6-2-f1bffd4ec0fa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0237.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::8) To GV2PR08MB8368.eurprd08.prod.outlook.com
 (2603:10a6:150:bb::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV2PR08MB8368:EE_|VI1PR08MB5341:EE_|DB5PEPF00014B9C:EE_|DU0PR08MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 03746036-da8e-436e-1bec-08de33488c93
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?OExyOWFhbUIvMjVpSW1vY2d3WTlsT0R2MEpncGZnblBQbUpqUzRON05IVFlS?=
 =?utf-8?B?VGw0Qkt3ZlZqM1BuS2JKQzlEQzVMRHRSTENGUjBhNTN1dXJ2OC9aSTNiOTRw?=
 =?utf-8?B?NmtaSlVuNzVWaFNISFdIU2g0eThXc3BXdmNxMDVLbjYvd3RRSGp4ZlVWZU45?=
 =?utf-8?B?Mkh1eFp4MEJSdkpreS91UUZEZUdseFJHRGF0Q1ZGdEhpeGhQZ0VnalNEQTU4?=
 =?utf-8?B?ZXlpMTAxTmJJNW5DYWJHNnBKaGIrcjNpVzhyV2VoNmN2bXhNRXcvbUVXL1k0?=
 =?utf-8?B?YW5MaDF4SHk5QjIrNUNZek9BMlVXUi9BLzZHTnVVc2pFOU1OalJwNTh5ME95?=
 =?utf-8?B?cm1kVG92OUtTWkl0SHBBY3hlY1UwNTFXbnZBK0pILzdNbjk0bFBSb2NCN05z?=
 =?utf-8?B?blVRSTMxZ2d0OTNHUWhxeXh1VTNadnFabmZMMmhPbEt3Ny83SUN5U3l0anFO?=
 =?utf-8?B?VzRXQWQ1ZVJsU3BPcFh3VlFZd3JlbkZ3eVZucHVBMFZHNTUxNWxjSFQxbFVq?=
 =?utf-8?B?ay9tVERXZjN6M0RhTXpBd2ZyRzk2QXFmQkxOMXVsZmZ6VVMrQVVCNU5SaDN3?=
 =?utf-8?B?UTNKZEkzZTdSZThRNmt2SGcxdXZ2eWJjU3E4ejRULzYzKzArdHBDS0gzTW9o?=
 =?utf-8?B?S0UwR0ZmNU8va1FzZnRLQTlMdzFLaUVjVkhWbThxbmZzTFU5UWgyaHpvTE1W?=
 =?utf-8?B?VHFTcmVkQTAzSW1abmJ1Q21pVTVYdHNwOXZFU3BWdHZHNXJQczVuSE8vRENG?=
 =?utf-8?B?TFRNdElsQUZ5b0xqbmQyMVM0MG9xd1ZNNlZZR2VvTlJkQnp2OUNIUDhKSm9M?=
 =?utf-8?B?cXMzK1pjUDRMSG0zajZvYld2WUVqZE0wSWg0OXJwL3ZDMGhkMStQVC94T2VG?=
 =?utf-8?B?UTVSQzRpbUxUcTZIaGpBZkZ1bHNtOU1GZHc2VTc3eVJDWjg2bTQ0NmFjakxV?=
 =?utf-8?B?clh0YU8vc09pTTlSVzB0eFBKVVBLN2NOR2UzcWFKUDBYaGFVSFkrNTZWQWhM?=
 =?utf-8?B?R2ZBZk1NdkxzSnByNm9jUitqNzh3b0xFekRYSFBZd0ZPWVU1Yk9aZ1FGeDE4?=
 =?utf-8?B?amhCZEwxYTJVdDYxUnNCc1RuSndsQTlxVzJ6a1gvMDhzakdFT2l0bkUrZ3Y3?=
 =?utf-8?B?RkRrU1F0Y0duMXlld21ZVnJhTm03MDRVbGpkQ2IyYkJRdjZwNzRMYkFKOWtw?=
 =?utf-8?B?Ui9yU29QTzR3ak9ZWVQ0UTNiQ1k5bkpEcTA2NmRWR3NRa055R24ybzhJRWNM?=
 =?utf-8?B?MmU4T1RYbjh2bWZVaHVhRldEd2NSaFVxSWNWZitaMHpGQnFMK2lYdlFUeFFh?=
 =?utf-8?B?SHpoSng3UjUrdWFINVYwSmlCN2JHVFFKMTk2TFp1eGRiTVZVVDhVK2htYkhY?=
 =?utf-8?B?ZGNKM3Mwb1Z1QjVHYm9IWHdnbnZabUdPSmlVaTdMSDNVWGNUK05TVTRjVmtX?=
 =?utf-8?B?U1IvY3RyckFYMFdjMkw1bjNqNkZvTVhuWEFORFZyTUJrZUQ4aGJTZXFZNmt1?=
 =?utf-8?B?dnRhMXZjSXdHMXE3SEkzTnNnRHFYM3NVUWx0Y2hNb3NhTE1TRlNzNENOSURY?=
 =?utf-8?B?N1hNcW1iSFpBMFNveW5tNXFCZDFXRDA5R0hHNWpOTndDbFFHbXpKVmxRV1ly?=
 =?utf-8?B?Qm5STDYyRkVGTm5lTXpncFozNTh6dDNVaWYxSTBKc2NzU1BnTzhUM29UdnNQ?=
 =?utf-8?B?c3VkejVIcjdiUnFKbEtvMDVzYWFDUjdUVExHU3g1N2JTNlE1cGNZcWJydlRC?=
 =?utf-8?B?Ym1yNjJybjlmVnFKcjhDZkZmQzVWWmE5NExqOEdCWnlUWWRpcUtGRldRcy9o?=
 =?utf-8?B?VG1xbTJPN09GYjZVelR1Mk5lQk9NUGk5dDlQYi96UVFxdnB3VktNdzZ1dlF5?=
 =?utf-8?B?SG0zM3JCajJqalI2ZFZuRGNVK0VEZnUzdlQ0ZGFjd3E3YWJJVDQzU0hHM3ZE?=
 =?utf-8?B?ZFFGdU5xRVdwUk1PeGJYdkVweDBMR0d6K09aSUhqZnJyRUYrcnJ5cGMxSW1o?=
 =?utf-8?B?UUR0eERqenpKajV5eCsyQzE0ZzZxQ2VRQ1dOMDBaM1RSMWxGeUhyTW5GeU1Y?=
 =?utf-8?Q?vn0gre?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GV2PR08MB8368.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5341
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 44e6a59f-7878-4679-d8ec-08de334866da
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|1800799024|376014|82310400026|14060799003|35042699022|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0ZVaVRDak1tV3MwMm83bFhzYzVha1VYeEJJMTlET3hTTHJNd2p3QW81dmNZ?=
 =?utf-8?B?Qk02M2ptNFJKa1I1cmVwMFlHSkRPM2lVZU9JOUlyeVc0MlJTZG0vMUZwb3Rk?=
 =?utf-8?B?V2c5ZUpGbU5SUjMvRkVKWTl0eld4L3BkNWMvRmNmUm02ZncrWkNqaDdqS29z?=
 =?utf-8?B?TkF3bmt0aWVHNWEvQTdiUGlEU2hVVzUxb0tyNnVLbEJ4dmxnb3V4V2NwOW96?=
 =?utf-8?B?d2R2K2RnVHg1Ui8wK2NWakVWQ3JSVFBTbnVnMkYxRmtRc0pvQlJSSHVVbUMw?=
 =?utf-8?B?NWYwNml1cnpKMWJhWCtRRjB6cXM4TlRITFFqSU4yU2NTZW5BTWQ0YVhoaHBk?=
 =?utf-8?B?eThTTVhJUkZSWWdqTk5jRzl6MjlBdFVoNXNtbkNWQ2xndFhURHI5eEx6QVVX?=
 =?utf-8?B?dVBXVktrNndLQUowMWhWMlJzYnpUL2NwblBkSEdPZkJPUHN6Q3hhK2tTQXJ1?=
 =?utf-8?B?TW9oWEtaWHhCZ0ZTMVJweEZ6cVQwNlorUXVhdzRBdkZteWFQNzJZcjBKdHkr?=
 =?utf-8?B?a2RJR1JJY2N2Y2NSS3VaWkFGS3YwTFNSVmVSZFRyZXVnd2h1MHB2VGtQT1lV?=
 =?utf-8?B?bFd0a21qc28vd1NYSHJ1am0yOUxyWjl3VUNFRWl1bW11Z3RXelpxYmczT25K?=
 =?utf-8?B?NmtOQlhuaml4emtwZFJwZ0F1MExlWWh3Zm1uRzVQN1pVelJZWGIxWFBNVmFh?=
 =?utf-8?B?bFNHZEIwWlRMRm1YWjNGTVNpVlh6SVdYMExUZjRqbWhKRVg0VnFrMGdrZytr?=
 =?utf-8?B?NDB2L3ArZUh0NUQ2SVZsbzZqRXorcU9pclBtUWpQZ1BvZ010MXRNcEdycjFs?=
 =?utf-8?B?SlQ3R29QQUJRWnJQTnRZVGNVV2l5T1VvZTZkVlA0dURMNkFuQW4xZG03a01V?=
 =?utf-8?B?c0lwQzlPMDcwdlVNT2JvakJSU0hXTHNEc2NsVUN3ZzdMQ1RIekxyYUg4UWt4?=
 =?utf-8?B?R3QzaHhSUjNrQi9SS0VMUkVJSnUxUWJ2YU91VDNvZitDdGJoMVIxdUdDTVdh?=
 =?utf-8?B?NkVGMS9jK1FxN2tZRTkxVGFUeGxxQ3VRWU9Ebnh5V1pSZEQ0YU5lb3JzVUFR?=
 =?utf-8?B?bUJLMXJQSUsxS3MrZ01SbmliazdYNTZjeUdnVVFzM2ZJTjRPWExYdDlDc2k4?=
 =?utf-8?B?em9kazhjV0xIVUhRbzhJNWdpN0dYMjA4eU9pN3ptVUxGY1l1bGRKME5BTENC?=
 =?utf-8?B?dlhCUHdlN1dKTS9rOTQwYVd6N3ZNSFY1cGwxdlBSWTE3YnB4dTFPYVhsbnh4?=
 =?utf-8?B?dTlnS3VONENlMmVCWVB3bWFLd1ZpTkZJdnVBZDNCeW5ZN3dQSmVWMDU3eUcx?=
 =?utf-8?B?ZWN6UTdscUZYQkM3OE9MTDRWRFFCWDdJSXNLRDF0NWJ3c2RYaE5sVTdoYUhn?=
 =?utf-8?B?TTFsaWdjV2l5ODkyTkRhc0JkWUpOYkwxUG45WitmNkNqU2h5cUZldnRxc3dV?=
 =?utf-8?B?emhmWGg5Uk52YU9LeVJjRkFiUkJnc2JJdWcyNk8weElIaWpSbWhCVUlrR2ZX?=
 =?utf-8?B?N08vazRkOVZRcVZIY0dveHlWc0YzeVNodGZjYXdWT0VNeUFYbm5xck0xRER6?=
 =?utf-8?B?M1VOWXM4NFJqN0VoZGltK2F3NGlqVVlYWUgzQXgrSlcvZXlpUEdaeUFHd1Fw?=
 =?utf-8?B?ZjhQMFFsWHhqY3pZLzNCSThsNmdXVkMrZm5JczJsSWVaQ2krUDUyOUF5SkZ3?=
 =?utf-8?B?dkJXaXNsZG8xMTZJY0FzQTdYNVVXUjZzaGZTSS95NWluc0NTSi93d2VNU3dG?=
 =?utf-8?B?b2cwckcrUjZweW9LdytpTmtzaHJtL09HV1F2ZW1zRERWTk5ScXdqeDdNOGF2?=
 =?utf-8?B?VGJkcUNTc0NGeG1YdDJkSlVZSVNJN1F1ZUFKTTJZTzZURTh1RFFVNmtMeWlh?=
 =?utf-8?B?MVZGVjdtSEU2L1BiSVNtWGtDYmRISUhMY2t1RHJSSmpOelJyQlhQeWE3Nzdu?=
 =?utf-8?B?KytWR3hlU0w3dFBYTGxHMXFLT2U0aHdzcDF0NURmR3JYWEZ1VnZSN1FnREdt?=
 =?utf-8?B?aU5aWEZIQ0pPODIzZFVDMEtlQ2NSYU8rc1BkbXF2YVY1bXQycTY3QUlzanND?=
 =?utf-8?B?SGppOFJPMzhtalRBMG1UUlFiQytaeGx5SDFzbTcxYjVSbFZ4UitCOTBvNVp2?=
 =?utf-8?Q?oBzDXOPfICz3wXXoq5usSoNKf?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026)(14060799003)(35042699022)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:19:42.1218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03746036-da8e-436e-1bec-08de33488c93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7948
X-Mailman-Approved-At: Thu, 04 Dec 2025 21:01:44 +0000
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

Hi,

On 02/12/2025 21:02, Linus Walleij wrote:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks when used with MCDE.
>
> As the CRTC is no longer online at bridge_pre_enable()
> and gone at brige_post_disable() which maps to the panel
> bridge .prepare()/.unprepare() callbacks, any CRTC that
> enable/disable the DSI transmitter in it's enable/disable
> callbacks will be unable to send any DSI commands in the
> .prepare() and .unprepare() callbacks.
>
> However the MCDE driver definitely need the CRTC to be
> enabled during .prepare()/.unprepare().
>
> Solve this by implementing a custom commit tail function
> in the MCDE driver that always enables the CRTC first
> and disables it last, using the newly exported helpers.
>
> Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-=
v2-0-8d799e488cf9@linaro.org/
> Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Br=
enesas%40mailbox.org/
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable=
 and post-disable")
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/gpu/drm/mcde/mcde_drv.c | 45 +++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>

Acked-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
