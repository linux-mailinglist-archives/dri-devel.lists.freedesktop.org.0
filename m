Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46530CBF306
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB5410E643;
	Mon, 15 Dec 2025 17:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OtYZlZeg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OtYZlZeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013065.outbound.protection.outlook.com
 [52.101.83.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446FB10E643
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:16:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jZ06sUw5ktXo5gLSoEqFrUng3I2XnsFIFWz/280ZBx806lxoGKxVbxEer/G3Knu+njUJqpUMYRt4iQYEKaX4qsLgE7P1RSJIv9/muC/1ZcvliWRqezeibCjCTfiwq3Dg/bbovgU8vhwoCpERmkyA1DjXVn6Ml/sDrSW/rwDVM0xPQkArsMFADDdbpOyMWdsyZ9VXvJzdX2kEud4wRT3Jyd1S8bo75ICXwFOi24TG4acGNJgARd41TyOffBAgooL0A8T38OAKLlP7+VfSFtEsL0Cx03FT/XcC75RWStSWFVOXF9bSaI4DbOgg4EiLyXwP3eTEHV6JgJxpXDKhzDGGYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1f0KFW5TZ8OReC6yLiqS81tJc9p1eT7LrY3Pj477r84=;
 b=FMgNybqoPu26NGgbxWjL2mFfEoSHNy31VJtPKIFTHBT34Crz/oslyiHJz7ygX+v5qXwQWTrNwQhDT2hENB3ljTsHgHXOOoEPn/mK326D/jCFHVwmXOnplP9f6+V92UFwXfa/wFJzQcIoJFm62tQJq0omaumWrGGg4Lh/pHClMQXwN8rwlHETokQGUqOHdfK2RoobK2S2ffxKMy4omR49g9Igp4Ip13RpwXVSCTkfEP2Ao1J8v2p1ZPgdGvInTO5f+gwTIsIC6a/zcGQBITH5rclr4Wd1O5W5+/yeYmR/+cnEENZ9NlDhqQIj1RRe5muRv9Takzvm2hN0+YLSuInu+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f0KFW5TZ8OReC6yLiqS81tJc9p1eT7LrY3Pj477r84=;
 b=OtYZlZegCuUaUQM5JleoNPU/sDf426ADnMFGOE3byKWoQdTTSqnX5z2MRGWyq4kj/2/09zPmBzQ9vXvtCnkt1Cwd/S8uYkqenKa1kdanOX22hLeHbE1uti33ih6sxCL/d2UUkTCi93oXD9xgUx6VI6g3eR1xzjvc/LQk8OHcyzU=
Received: from CWLP265CA0430.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::12)
 by PAVPR08MB9331.eurprd08.prod.outlook.com (2603:10a6:102:303::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:16:09 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::b6) by CWLP265CA0430.outlook.office365.com
 (2603:10a6:400:1d7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 17:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 17:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOq94mBWNh8ZouQmsASE1xegQNH7EZKYXfgM0/nc86L1zyA3qZfO8FdSn/6c8kBsreMgtdMyUrcEEkBgU+uX1zWMRCqxlXExjFcd0Pik/i7n9GD0dO+mmkEX0WDf4JzPddPDMw+2fiqEucViDbdvwK0TWKOiAtwjRMMnadTFJmN3cVyjPiojju/GGTMUgkEh5EaXk6okQisbUVjOz/H14TrZYVesu1fV46XWf80aVH3bpr10iHA+jRGq88WvmHTsE7eS4BumLCpWjF20fjK9+RI8RC1uXaC8X9jKGg8GA4LP9JGPtIyNseqtYtLLNQLr3WJk9P+IGjgFKBZB3HeJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1f0KFW5TZ8OReC6yLiqS81tJc9p1eT7LrY3Pj477r84=;
 b=xFW6Op5IS7RyeEy7BqrCtO0kZKgWMKWxWTGxCTCyXCkBhUAiItqrzcaaGYkA+7pMdy3RU/X5VZjiceRKxum0zBLNUI+rnMOx6vCiUKxL9ZC9JnQERMohDV8MDUKUbZcWrXDcys/o+dB9J+htNftMP1m7JnlJeCdT4Iomdr5SjiKtwwjOzRrkIejPp9nnHfIjyQqF7hxgNaPhTiNm7dD0ecj7BtGlQtXDnlrsnH6SeAdz1PC/Go8ur5btziLDQyO9Y81PiSKZWb1ILmM04EDEmuhDxBHVuoVeCsO0iuPp32E//lrsv1bdeOhwd9c+xKEF9rdYZ0XcvMkGUCt7floqDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f0KFW5TZ8OReC6yLiqS81tJc9p1eT7LrY3Pj477r84=;
 b=OtYZlZegCuUaUQM5JleoNPU/sDf426ADnMFGOE3byKWoQdTTSqnX5z2MRGWyq4kj/2/09zPmBzQ9vXvtCnkt1Cwd/S8uYkqenKa1kdanOX22hLeHbE1uti33ih6sxCL/d2UUkTCi93oXD9xgUx6VI6g3eR1xzjvc/LQk8OHcyzU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by GV1PR08MB10607.eurprd08.prod.outlook.com (2603:10a6:150:16c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:15:06 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:15:06 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v6 3/7] drm/panthor: Add panthor perf initialization and
 termination
Date: Mon, 15 Dec 2025 17:14:49 +0000
Message-Id: <20251215171453.2506348-4-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|GV1PR08MB10607:EE_|AM4PEPF00027A68:EE_|PAVPR08MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: ed666543-8e9e-407e-8421-08de3bfda3df
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SjFnc2l2dHlOcnlKUnRrT0FPTFhzaTlJdlcxZk4yWHprdTA1eVo4djU1NjJO?=
 =?utf-8?B?SGRpSzlmazJHY0FKdGlZLzNNbmRTWlVYT1FEZWUraWxXSmFqdGhpdU5MMisy?=
 =?utf-8?B?am8zTjl4SFptNE9mSHZIOEliaU02ZDR5QkpUeWN2WHovRTRBZ1E1THpDa0FL?=
 =?utf-8?B?UzZxZzhrUVNpdDJJMGhIRzRWcVpTRllraUQ4TnVuNXpENlhobmIyU2tBUFdC?=
 =?utf-8?B?djFaV1hKbVFwYytBWlFtYW01T0VkTHF1YThRdWNYdDh4TTZLYkhjZU81UkRz?=
 =?utf-8?B?V2haWjdDVHZBNlJxZ1ZiNWFUTjByc0dscDVBTkgzK21PbHpIL2thdW1kTldD?=
 =?utf-8?B?MG9TZmpDV0lRTlRRb1lGbnp5NEl2R2VoUHQ5S0tPdTgzQm5nektZWkRvd2to?=
 =?utf-8?B?dVZsOUY2NW11M0RwRThGWGNNWFFNTGRPVm8wa2Z6SW8ySjBhcWNSS3E4TUh5?=
 =?utf-8?B?RVRyR1lSQnc1S0tHMWVIaUlvUExrVzJCTUE3WWp5YnRIY1hkM2ROMjlLVnNs?=
 =?utf-8?B?MWFJdEhYRHM2WXc0SG02dzhZTVJaNFNxNmZXMThac3JPQXd2aFBvQ2FIWGE2?=
 =?utf-8?B?VzFtaVFjOHh4c3NXZjFMQmRsY0FaYTROZHpnZTkrTzcvbFdJZndyYm5vMzEz?=
 =?utf-8?B?NGVKV2JmbE56QUI1UkE0Zk9uWmVtWE5LdUpiWktTWnZwak9qbTJqYmp0aERW?=
 =?utf-8?B?TE5GbGFDcmN5ZmQ3SWF2czZMTlUwaGRrMjJUR0ozMEZlNDRZSjZvRCtzenRp?=
 =?utf-8?B?Y0pCRmxnOXFTU0RhVmJkdWh3ZndrWXhtS29pSG1oWThTUTgvSTNCUnhydXhm?=
 =?utf-8?B?TWhtNUF2RGhuOG1wdTgvc0VtbGhrY1RoUk52aXM1Wk1yYUtTd3BKWnpWaG5M?=
 =?utf-8?B?ejcwYnlRaXRjVEo4WU04VjRsdksrbGdkR2l0eWVrR0hqVWZsMFJPeWpHejA1?=
 =?utf-8?B?WW5zY0F1WjdRQnMvVHdQZngxaUtTcnQwOWpLM0g2SC9NNlFaSDJYTGNhSlBS?=
 =?utf-8?B?cDRkRWovVGw3OHI4NS9WZ3c2dFp3RnZFSC82WlhGUkNxbVBzUVVZdVdzbDFn?=
 =?utf-8?B?YStUempVd0liTVZmeGNSZTgvY1RNUUhna0VXRWxrSkt6U0cyWmJYdVVsZEpI?=
 =?utf-8?B?WkIzeHgwUGhabGh4V280Mm9JMmJFR09DSW9ZNWRUak1wNkVxRURQYWRqQzhq?=
 =?utf-8?B?NjE0MW9reUxwMTdvWGRTektIVEN2TkZGQUNCZVEyN3A1eUlha3R6aXBMSkpr?=
 =?utf-8?B?RlQzaXlsdHREdlA5MEVIWWl0RXZVYU02dk5wTm9BTEtiQ1pibmpiM2g3S0tv?=
 =?utf-8?B?L2dVTkVDdDdVTFlpZ3Y5bnhXTXptQmJvOUxwdGhrMFJSNnZka3F2T0l0d2xa?=
 =?utf-8?B?eXpwYm96elEyWW1WdUdVaGJaZzhlYlc0TUdtRTVCRlh1RlZ5OFNSc0I0d1VR?=
 =?utf-8?B?UjU0aEVUb2tBTWp6YnhTdURrT3BrNEQrd2tVR1EwOFo5dVZvTzZwNkdWTHdR?=
 =?utf-8?B?UjVBVDZXcG03SU9oKys4akxTYjdXbFREdHREMktxM21XZXcvL1Y3SVArNGpH?=
 =?utf-8?B?NGdieDJzKzZvcmhqREViTVRkTm5PT0NuMmhkc1pJWVZPSTZURVNzNjFSRkdx?=
 =?utf-8?B?UnFscWRNWkt4SmptOHdIRDArYkVoN2pxdnl4RDRGR3gxZ0FMcWZRb0tnek91?=
 =?utf-8?B?VXg4YWNnTzdmTGZFYkhkZWdESllYRG5lUXVHQ2FUNjBzQkFSZjAvVjhORmFm?=
 =?utf-8?B?aFlpZ0tieXVEL3ZiTGR3aEd3ajY2cmRrNVlTUUlqWnlSN3N1czFseTBXdE1m?=
 =?utf-8?B?blVTNUpZVWlSSEU1MGpPbVhEMmt1TG9MUFVaQXRQY2xQQUdVM0VKamhIcDdn?=
 =?utf-8?B?RVhiRGwvUmpyL0dtbWJLLzB4dE96cEcxNjJSZy81L215bDJydVBodGVxT2xn?=
 =?utf-8?Q?HEw2ALS8wu7PxbIUoprItd6u4yGe+tKP?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10607
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1e2c86f0-0fd3-400f-74e4-08de3bfd7e30
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFhwbmphNUJFNEh2QXJOMWN5cnJYbHhKcGxkNjFqSGlWbFlFNi9OVStGNzJR?=
 =?utf-8?B?STc0Ui90aWtRRVdIR1FZRXpibjRHaUVXUTVUSXFYVWpBMS9Pa0ExZzl2Tkth?=
 =?utf-8?B?QzVrRVplNkdTQ1k2WHVzUmFKU251by9xdWxtMlZkQ2JMMkpmdVlkaGFyY3RW?=
 =?utf-8?B?cEFUT016ZTVBTGpZQkxtRUI4eTVJdlpBYUFjWHdCTE0rZHVxUlJqOFBIUWxs?=
 =?utf-8?B?OURLRFQrRE9IVCtOT2F0dE9SeEIwMFpwVkRTS2FXd1E3WTVBV1hHTnhoY285?=
 =?utf-8?B?d0VFQ29uR1JycWZkVlJYdGtvWG1MVFVmWUh3Vms5N1ZHc2x0cmlEOU16Qjlp?=
 =?utf-8?B?NWJGR0pabjdLRlduNGxWTnladHRkamhXaU9LU3ptV2E0MS85ZEFqYTEyaHRs?=
 =?utf-8?B?M0V0eHhGbElrZE5WbW1jaVFhVlkwcFdzR01pYURyRFM4R24zUU9XajBkVzRH?=
 =?utf-8?B?dElMbisrMXo1VnNGbGJXV1BOK3hDdVlDZWdNRTUvdE53OFI0bzg1NUxvdWE3?=
 =?utf-8?B?bHNuZWNzWlAzOTF6bjhSdFlFbXJKeXgwWUI1bmsrT1Y1TEQzUG00ZWgvMFUr?=
 =?utf-8?B?eDZ5RXNGbkdUNEZlZWpieTNpUWNoUXNXeDdpZS94bjVkQklTeW92RFhVVjZP?=
 =?utf-8?B?Q0hQU0NsRk5ERUpBdFBhdzI4c3pCTi9USEhqakg5N2gwNWx5VFUvaGxZZDdv?=
 =?utf-8?B?OE81Mm4yS0h5US9oLzBaRkdwS0MzSUdNZjRjdFFDVW1NYkx0QTlSZUlyYjQ3?=
 =?utf-8?B?eDRhYzN0cmxHSUh4WWZicGcwM1Q3c0xsL0dNT21IOGIzenpYOVZ4ejFTTndX?=
 =?utf-8?B?RjVMdGdaNWtEU1Rleit4cFU4VzNoN2Y4MlNEMnQzU29HRlNONCtRcUZtd2Rs?=
 =?utf-8?B?UDdXR3lCOURZT013a1BkYUtwUUw1ZXZsL1BZU3FSNXZib1Fta1BvSGpEN2lN?=
 =?utf-8?B?ZTRqRWVXR1VuY2RudDB3VlFZK0kvQ2FlS1hEQzZjazFBdllzV1hybmptNU9a?=
 =?utf-8?B?WCt5emFRcC9TZkEvRS9MVTNBYjN1RjJBSHVkNFhuZE1pYkVEd3JhMEgrUXJw?=
 =?utf-8?B?RFFEbHJ4cXJiVGlSWjlCdExVSWRGREN1ZE9DaUQwY0JmK0Z5MytaVlJDejI5?=
 =?utf-8?B?MzZjMkRBNmFBOTZlUzBQV1UzUmNKUDBUU1Q1SnJKbmMxUFBCbnhOY3krT0po?=
 =?utf-8?B?K21VQWJXR2prMGhLY1VmaW9EbmZsMnBhcHc2a3ZVVmJtdmlFd3F5VTNFYjJC?=
 =?utf-8?B?MnVqSGFSbTh4MXdGdlhRUzRvZ0t4Y3V4MWs1OXFJQW1RL2NNdExld25XNTJ4?=
 =?utf-8?B?UkFJanJmZkthakxQS0VSVUdKRTV1Y0gvQ05OTXR3QnlIMjUzTmR6N1lZQVlz?=
 =?utf-8?B?M3ZVWXppT1VRL2lDZit6Um9hbG5rYUEycEFNZ0J0bS8rYWJZcFZreS9EWW92?=
 =?utf-8?B?bnJoYlorQmVtZ1RmRGw4aUtOT21uWEpvSFlPRXIwelZuMTRQc1N0TitNNGN2?=
 =?utf-8?B?T3kyaEVDb2hNMitoR0gwUWxWMXlNQm1INDNYM05oL1FuTjlCTGkwOUlzdkVT?=
 =?utf-8?B?N0NZbjlEdStGbEdVWWtrZWpsTTYxeGxiSWFaYjlnaTBtbTVKNzVsZDkzaDdE?=
 =?utf-8?B?elpvRloxYXJCM1Mwc0VBYjdhOUhkNGZYM2RqdE92ZngzTWxoYW5sV01lcnd5?=
 =?utf-8?B?dWR4UUFaZ2xtQUdjd3VTYnRaV2MzNUFLNHVnQytzNW9SMk0vUWg3VlJQMXZh?=
 =?utf-8?B?MHhvbFpoYklaRWpCaXk2cGNQdUorY1dzUFV2NFEzcmRmdE05UndrUmhDUk5l?=
 =?utf-8?B?MGdJcGZGSUNMaU92RzFWRVdzaC82bzVJQldsbUZKR0l2cFNYSXIwSmpnL0Qw?=
 =?utf-8?B?VlF5aTRiM0Y2UDloUXg0ZTJWYS9TR0I5UGhRd3ZmSm1xTDZaaTVqQjZ2MEg0?=
 =?utf-8?B?ZkJhcVVZOXVqcnF0eG0wSVVrZ2ErazRWdDdndVhGRVJVSFBaWVZIT09ZUXly?=
 =?utf-8?B?cXhCUFJ4Sjc3bEROL2ZhUXRpVnI5UnlMU0JKZlFuRnl2ZTZQcE5lY2pYSk01?=
 =?utf-8?B?ckdsczU0dXJxQVVSdXdTelgwWTg2TExJdzVjaTVHV1pwWmJmbWorakRkKzR4?=
 =?utf-8?Q?baaM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(36860700013)(376014)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:16:09.4200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed666543-8e9e-407e-8421-08de3bfda3df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9331
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

Added the panthor_perf system initialization and unplug code to allow
for the handling of userspace sessions to be added in follow-up
patches.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  2 +
 drivers/gpu/drm/panthor/panthor_device.h |  5 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 63 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.h   |  1 +
 4 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index dc237da92340..3063ffbead45 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -120,6 +120,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	/* Now, try to cleanly shutdown the GPU before the device resources
 	 * get reclaimed.
 	 */
+	panthor_perf_unplug(ptdev);
 	panthor_sched_unplug(ptdev);
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
@@ -323,6 +324,7 @@ int panthor_device_init(struct panthor_device *ptdev)
 
 err_disable_autosuspend:
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
+	panthor_perf_unplug(ptdev);
 
 err_unplug_sched:
 	panthor_sched_unplug(ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 64b0048de6ac..e1a6250cecc8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -28,8 +28,8 @@ struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
-struct panthor_perfcnt;
 struct panthor_pwr;
+struct panthor_perf;
 struct panthor_vm;
 struct panthor_vm_pool;
 
@@ -160,6 +160,9 @@ struct panthor_device {
 	/** @devfreq: Device frequency scaling management data. */
 	struct panthor_devfreq *devfreq;
 
+	/** @perf: Performance counter management data. */
+	struct panthor_perf *perf;
+
 	/** @unplug: Device unplug related fields. */
 	struct {
 		/** @lock: Lock used to serialize unplug operations. */
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 842d62826ac3..3a65d6d326e8 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -4,6 +4,7 @@
 
 #include <linux/bitops.h>
 #include <drm/panthor_drm.h>
+#include <drm/drm_print.h>
 
 #include "panthor_device.h"
 #include "panthor_fw.h"
@@ -22,6 +23,19 @@
  */
 #define PANTHOR_HW_COUNTER_SIZE (sizeof(u32))
 
+struct panthor_perf {
+	/** @next_session: The ID of the next session. */
+	u32 next_session;
+
+	/** @session_range: The number of sessions supported at a time. */
+	struct xa_limit session_range;
+
+	/**
+	 * @sessions: Global map of sessions, accessed by their ID.
+	 */
+	struct xarray sessions;
+};
+
 struct panthor_perf_counter_block {
 	struct drm_panthor_perf_block_header header;
 	u64 counters[];
@@ -76,14 +90,61 @@ static void panthor_perf_info_init(struct panthor_device *const ptdev)
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
  *
+ * The performance counters require the FW interface to be available to setup the
+ * sampling ringbuffers, so this must be called only after FW is initialized.
+ *
  * Return: 0 on success, negative error code on failure.
  */
 int panthor_perf_init(struct panthor_device *ptdev)
 {
+	struct panthor_perf *perf __free(kfree) = NULL;
+	int ret = 0;
+
 	if (!ptdev)
 		return -EINVAL;
 
 	panthor_perf_info_init(ptdev);
 
-	return 0;
+	perf = kzalloc(sizeof(*perf), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(perf))
+		return -ENOMEM;
+
+	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
+
+	perf->session_range = (struct xa_limit) {
+		.min = 0,
+		.max = 1,
+	};
+
+	drm_info(&ptdev->base, "Performance counter subsystem initialized");
+
+	ptdev->perf = no_free_ptr(perf);
+
+	return ret;
+}
+
+/**
+ * panthor_perf_unplug - Terminate the performance counter subsystem.
+ * @ptdev: Panthor device.
+ *
+ * This function will terminate the performance counter control structures and any remaining
+ * sessions, after waiting for any pending interrupts.
+ */
+void panthor_perf_unplug(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return;
+
+	if (!xa_empty(&perf->sessions)) {
+		drm_err(&ptdev->base,
+			"Performance counter sessions active when unplugging the driver!");
+	}
+
+	xa_destroy(&perf->sessions);
+
+	kfree(ptdev->perf);
+
+	ptdev->perf = NULL;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index 3c32c24c164c..e4805727b9e7 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -10,6 +10,7 @@
 struct panthor_device;
 
 int panthor_perf_init(struct panthor_device *ptdev);
+void panthor_perf_unplug(struct panthor_device *ptdev);
 
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty

