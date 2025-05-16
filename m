Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C7ABA075
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0635610EB11;
	Fri, 16 May 2025 15:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="d0EgJgrH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d0EgJgrH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE7810EB12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:58:54 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Sm7g6QO6WUG3esDJypSNHrE+9ORh4WXC7iaH90q5+nlcSBXyIgq+JJ2Rf5f/QPEumnHxN4Zt8Ogo7NWIEfIgEnO3Ra/ndNU/HOgcpx5UOnhyzeE1JRJOj4eewkaz3bZyKVfgTgKyYNnFwG7n4y7Q8QpF2xZN0wz4LRfZvtwtqj6z20rT8/oYI9ri6N14Vcz8YOtcMkUYCBqVxRttqhtNl8yWtl8c1r3Ipgqmc9bJUM3CasZNfDpyoA/8kiUVJUyK89UKMJupkm50uAV30UIKxPajIDx639xqNGUkVetsFg+CyX9JTjdRexVudqQXoruwUgExJZ8AryxTCqD/Moeydg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITFe9p8//BzBVoxsIkM8w9zd6tCrOdO7FXt/saEJqds=;
 b=Wu/CrT1f6VXT7BrZpoYJlpKyUVP/6q4hk/giSGVg0T6hF6sVNDviRZhOJY7VV56TOp6XRrPXMOSaxcpIGdbYXyGeUH0IyFPAaYYXWoEGJ2eI07COTOUSVHACd3wv3mdrZuHa2Q3siAMkr9NbM2tozN3BcEjqc7yTrR9tc6lE3m569NSegLK21HNFKfOOlDf4awYVhR6Xl3hOgOwiSYe5lHy4z3zIygwBDFtZGEiiLssPg5gHRRrWLHEV9uAjllml3DIy2DkcXWjIYFDVCzJriKC6+nxdaBZxlHKZv63GUcF4XUAOowK/3rUmO+OYs48ZB/fhE8MX1g6qnH5KqNPu2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITFe9p8//BzBVoxsIkM8w9zd6tCrOdO7FXt/saEJqds=;
 b=d0EgJgrHxjcUefF4xAhkMc7QSwxeKR8qxBRuQYbJuIuyIkTCMp0I7gcmdALQHkKoQ7umqVEAFQ8kTn7C6Y3cO6Hgr5jvC31+ZAUi2KWa67sHlU+UTHN1NOS50PmL6jbbceWPYb2OhRioWtgJfoZXpbxOCJ7RkeCSKAxMalNnrGc=
Received: from DUZP191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::28)
 by AS2PR08MB9269.eurprd08.prod.outlook.com (2603:10a6:20b:59e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 15:58:46 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::ef) by DUZP191CA0036.outlook.office365.com
 (2603:10a6:10:4f8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Fri,
 16 May 2025 15:58:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 15:58:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAIxGOYJj1VTndtKb96ova/ty827VoTPTc4VbLgC4GpQZFzwAffaj7GKpfXXZHUPevR93zlsQA8ZW3G6YF8fK8vYyTFNzjmPJkI0DIkYigf1Cy0tSaRADMFUKf6HC42RWS57K9cmLIGkpb2Q+jC3R6bLhYEh+hkqwVJguHKG0DJzYIOmiUQG40z+t6aMAJCYufTSyPl8EYQRVLe/ruZSf/IhohFj5ni2kbE0GFo0EOroZ7XRTLaTGy0jW3zZvz7oa4fZWaID05axy5RMK6TznlrGph2lBzbO74vBlkEKa33j0mo8JW+PxpkcGLuc+rOHifMPMShRNgZS3i4Toec/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITFe9p8//BzBVoxsIkM8w9zd6tCrOdO7FXt/saEJqds=;
 b=c0DvK/onsqkpi4dmmjsflhh6nRtfEfow9NEbnZzUWcR061mrFIkmEuT+m+viu1KzyqD5IgnddFGr+dWvJS6DI73rsrOw6P7HgrWViOV/F4rxboq/i2YnNvu/acQ+aIqtkrarIRGxy9CRMhFzGbTt45yXN/r21QrKyKGesjX3KZBPPGCrkTB2QQOsKtcOwQFLqKKliiy7E3vPeyJfiFXri1PK+PDb+O7SX6A2YB5UNpw2trDvLFD1xQY2xv27I3ttdnYIJWhLibVbNYXr1snb2DwJvrCMNU2CH4Ot6xUecxVB6wdW2cetKHcIsU500i2EZyaavCEMDEx2YGYkZGjovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITFe9p8//BzBVoxsIkM8w9zd6tCrOdO7FXt/saEJqds=;
 b=d0EgJgrHxjcUefF4xAhkMc7QSwxeKR8qxBRuQYbJuIuyIkTCMp0I7gcmdALQHkKoQ7umqVEAFQ8kTn7C6Y3cO6Hgr5jvC31+ZAUi2KWa67sHlU+UTHN1NOS50PmL6jbbceWPYb2OhRioWtgJfoZXpbxOCJ7RkeCSKAxMalNnrGc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU4PR08MB11174.eurprd08.prod.outlook.com (2603:10a6:10:577::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 15:58:13 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:58:13 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v4 5/7] drm/panthor: Implement the counter sampler and sample
 handling
Date: Fri, 16 May 2025 16:49:39 +0100
Message-Id: <7005fb2eba3abbb2ee95282d117f70c8a7c8555f.1747148172.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1747148172.git.lukas.zapolskas@arm.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU4PR08MB11174:EE_|DB1PEPF000509F5:EE_|AS2PR08MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a92362-4c8f-4fc0-9204-08dd949289c3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?eHVORXpJdGtqYWNCT2lvZWlxVFZWVHRyaXdSMlFHTUhpVlpOU0JwMWV3SS92?=
 =?utf-8?B?bmd6QU1oenlIRVpGYTZFSkJuSHh2SHNJQ3EwN0R2enorM1NsaWFBUlRsZGdF?=
 =?utf-8?B?eTdmZ25ic0ltc1BEb21XcklJZGxXWEo0ZHJ6NTZnbUxSVDF6Yis1Q29zdE04?=
 =?utf-8?B?bnhPaTQ5ZGEvRWhSdTRLc1JycndWeENBQVRKQlE5YXl4UytpZGpjQnBiZW10?=
 =?utf-8?B?T0R6YWZzQkI2VnIzSnlkWllQZXpaWnVORGh4Y2txQ0FpOHdsUStWdHgvcGcr?=
 =?utf-8?B?UGkxMTlhNDdqVDZBYk1OSXpMdCtNYXpiOHpkL011dG9kZTVwSncvVWVoQjhw?=
 =?utf-8?B?RmFrck4yekhpOGlxb1lhUjNCbzNGb1A1Q2lWbkp5TWlGS3cyc3hUMENrdHZz?=
 =?utf-8?B?NitaOTdCdURSbTgvRTRFMzhtVWpYZG1mczJaa01URGQvWEdldXNUNkRScGo5?=
 =?utf-8?B?VGlzVUFON0NtS1JLaGtVNC9QcmZJMm9CTWxXZDlSSS82TU4vNU9BeWVHcGdj?=
 =?utf-8?B?cjhEOXE0Q29KT3hxSkFNV3dUVU1ISHl5RTVWODdPTzlmdFdIWXVXWDFocXBO?=
 =?utf-8?B?QVNWNlBmRWdNWi96anBGcWNpLzQvSW5JcnVKNjIvSXlLNEFBOUZadm9PK01Y?=
 =?utf-8?B?aTU1b2dDWVVBVXNDNHNtbjVseE1rak95cGVYeWZvamRvRk1hY1ZyUytUaVhz?=
 =?utf-8?B?NVE1Z1dPMnpOb3YwWGh3L1NjNGd0ZmtkVmhBR05mUnVFanAvL3h0bTlWWFpp?=
 =?utf-8?B?VE1MT25rcEc5NENWZ3V0Nm1qNzQ4SmJaM0xva0dFdE5MeHphU29Falg2cXl2?=
 =?utf-8?B?VmI5OTQ1bmQyOWVobHdSaGYvbmFGMDRHRTl2dGt0MU9BS1FWbHNqeTlQYTZo?=
 =?utf-8?B?enBFbXlVUzdyZkcvdms4M0ltWjdLa0Y3dkdjY0ppZnpUTTNlcWhKVFJEWTBU?=
 =?utf-8?B?L0dFWG5IbWpKbE9HTW9GaEVtTXdWWXNCUlBmOURrajc1TlVqTWxXNW5MUDNI?=
 =?utf-8?B?L1FwRmRHZ3RuM2JPM3h6cGpKZWxXK2xyS0Q0VnZGRk9EdEtnV05WeFR6V0Jt?=
 =?utf-8?B?SzFyUU9wdWZsdkdzUGpxN2dBWE9tZVoyajdzZXdON1c4YWIzTGhqWTdZbDVt?=
 =?utf-8?B?OHhkUWpGNkZWQngxM2k2TzlTcGxVVWZMaDVuQ3cwU1daWlgxbG1BWWtVTzUx?=
 =?utf-8?B?czYxOUdWS0o0b3JMTFAwdHI2RkE1NUQxa1FHL21Jb05rTHFpRCtzaFFvcUtQ?=
 =?utf-8?B?QkU2YUVVbWlmQnJjdENITys1eExkc1Vma3NXdXJFd2p3TVdFclU3RzFpSmJs?=
 =?utf-8?B?cVNyQTlQR1FtdEsxSHNmcW0xWGZ5Y1o4OVdNSHExQm5vNGpvTjBuWjJqcUNk?=
 =?utf-8?B?Y0NaRDQ1a2RKbERWR2hSOXEwK2lZd2loTDZmc3AxeDlha01rQ0VOMTh1MjNY?=
 =?utf-8?B?S08rc0ttbnZYUHZwVHhhdFNmWVVvbUdEaG9ZYmtKTFRWQlptT2hrdENqV2Nt?=
 =?utf-8?B?Z25xT2JKMTRUYjhxWlRTVk5kcDVlUVNtTXhvUE5VMEtVRTVhaU4vUDF2WER2?=
 =?utf-8?B?eFcwbzk1MXJzclNweVpjZ09FT3NMWWUxeDlRYjZSeDNuZzk5cEdibHRvekls?=
 =?utf-8?B?bDhUclFvMWZ0STNIQVRmV3lMQkZCQUVLcFB3cW5GNkdmRDdwQytPTCs4enNV?=
 =?utf-8?B?WGQxRUNONzJGalBibm5jdWQ3cVQzM3FzYlVxQWVhZkRTR25UbjlHVEIxeDdu?=
 =?utf-8?B?bkYyWXBjYzR6anpBbFhVcy93TFBPQWZnMWVaMVYyYW9FdzZlbW5mcFlmMURD?=
 =?utf-8?B?KzR2VVpZWjhGSVlKRmxnTGJkMlRiMGpVaE1TSEhPTC90YUw4SkNVYmlTL0Ft?=
 =?utf-8?B?VEg4UmZPYzFZb29XWWRGcWpjV3NzTExTTmdLMlU4alJiYlR0ajJpUmFteUov?=
 =?utf-8?B?OW9OaTJkdk8yZnJmUk9pbzVyVUZPMUM4dCtGcGNndjMydmNZL1FWZzlHd245?=
 =?utf-8?B?WlUzUC95eld3PT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11174
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7ed1cefd-1531-42c1-16aa-08dd94927692
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|14060799003|1800799024|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmtmSlI4dE1ETEdsM3lCT3VSMnp4RkpjSzJqMTZmWXJLNS8rUnlkN1BqeVVw?=
 =?utf-8?B?QmNnR3VFaXNrVVQzNTQ0WWV6K3hWL3pZUmJHZ3RoN1hqcFQvK2VpVzZMem0r?=
 =?utf-8?B?RjJ3MG9IZ1BCTzdKMnZvZWtTZnR6N05VZWVYR1cvREJrd3Vtek02aTZXcHBP?=
 =?utf-8?B?VDc3dWx5WGRTVktwQXhTT3BWVkFXcWgyNzFDWGhVNCtYK0M1UXZTWmxJQTlU?=
 =?utf-8?B?UUdpQnZyWGxaR1VaYkcwM0F6QUo1S29iVkI5V29zekV6RE5QR2E1cEFtVUJ1?=
 =?utf-8?B?ZHk3T3MxTUI1WjJlMTNOYUNzeTJiTVVZT2F3MGRSMzJ4d3JocHlMdjBjUVhs?=
 =?utf-8?B?VVQvWjZrUXRDaTA0MFl4dVovN0JydFRGWW9yYjNISWNhQTFyME5pSGpvWWYx?=
 =?utf-8?B?aVZhTUIvR1JEYlZuTHNaaER0Z2liMHlJU0lVcG0wSkxTQ1RIVHdBYUNLWVgr?=
 =?utf-8?B?c3M4cFhqV3BVR21Md05CRHZDNUc0SGs2RTlqV3VTdHIraFJFNSsxaU0yMFdw?=
 =?utf-8?B?ZTU0MGd2ZXVENVcxdTZEWTA1UnVJUDVXWUxETjN4b3c2VW9kYWM1QU8rTWlj?=
 =?utf-8?B?NU80cTZkVU80SFo0eHJ5RllmNm94MWl2eDhCZk0yVEVZVjVLRWZUMFk5ZlJR?=
 =?utf-8?B?emhNeStsa2ErTlM0LzRORXJOSE9MYTEvbkEwT2tWWnFaZTE3UEs0SFFBamU0?=
 =?utf-8?B?VHp5bG4rczdhMStyTHFXVmM5VXhCVjU4VDFhaUM0a3NkOE1sNE5tYnlaS1Vy?=
 =?utf-8?B?QUg3cTV2L0xXN1QzMmt2eW55Nyt2cjhQWTJaSjhoQUh2WmVrNXFFRTU1ejNN?=
 =?utf-8?B?VTBrRmsrR1hmZTBKc2thOG44SGFGS3JTMkNTQmY1MUJZUUNWZ1RZYnFyalhh?=
 =?utf-8?B?UHdCU202K2VqTUFCUFFGL21leHdyTG85WEJxOGxwR2h6Vlc1bE1iQy9nVkdI?=
 =?utf-8?B?czJZMFlIVE9zWFhuTFNqakpyUFZLL0hRdlcrM3A2VGNhUUVVWi9iOTUrb3Zv?=
 =?utf-8?B?emtkRnY2LzFldTE1M3pBc3l0SVJMam1lUFI4a1NtNXIwMTFzNndCdWRWUUU1?=
 =?utf-8?B?VnlaYUxZaVBHcnhoWEFOTFZ2RWNYMkNidlVmT0ZFQjJhaTFQRys3L0pCb3Ry?=
 =?utf-8?B?ZkdYd0tnSmx5VnFLS1BqM01HeVNITllXeGMxQVl1N1JBVGVxRkZBbk5IU0Nx?=
 =?utf-8?B?WE1xaXYzMS9GOTZicVZWK0F5ejQ3NUZNc3N0WW1DSzNsd0xKR3NRWVZITngv?=
 =?utf-8?B?REhiZVdFbGRMenExTi9iRFU1WDUvTUNrRDBMcTRJYlJJNGVBZXpSVU05N1F2?=
 =?utf-8?B?c255RG1oaWlWM1RCdGVNNzNiYTNwUGpzS0hkQ1pHY1BHVURjUnFvakx4VmRm?=
 =?utf-8?B?ZkFNWFJQSXlHU1JRbXYvMVNJZXNFUmVhK25HcWgvNis3RGsrRTJQT2dkTmc2?=
 =?utf-8?B?WHF1OGQ0amFYN096U1BodXBwL2ZFYVR5Tkx2SzVEYk8vWGNmRWlGNXNaOXRZ?=
 =?utf-8?B?T2ZXekhlaWN0cktrYTB6NXBIcGoxVGhGN1hPNnNNQnN5YWdrYWdwbXZEeEQz?=
 =?utf-8?B?eXRhSGxzT0ZxOGF4UXRhbzFpSHZNNzhtWkpnUUFScDJmeVpVTXVBWm5ZV0xV?=
 =?utf-8?B?OU5hVkZZcEhjUXJUOGtHZzkvTUJJQTlqYmZMZVMzY0tUcXd5bmg4dVlNT3Zv?=
 =?utf-8?B?Yk9ZdEp5Y3RIN1Bid0RNRVVOTEtYU1RyYy9lcWxOdXhLOFdFT3VHQmRkdi80?=
 =?utf-8?B?b0pWU3Rxb01za0dMNWZIckVyOEtybWlraDM4TkNTcElnUERqRE9vdHRjMzlh?=
 =?utf-8?B?Q0tYeVp3RDVjY3lnVGZUTTd1WEloRWpzV2JyaC9YZzRNQ1RsMk5NeGhWdnll?=
 =?utf-8?B?S05DYUJnUFdraG1sUG9Tb1FabEhxRDVXdUhJU3hNQUhEcStRY3BBQlF1NXhM?=
 =?utf-8?B?SGczV2hudFU0eHlyaXc5QWFyajYyWlRrdjhhcms2SU16VXJjQVNNVGZpZHFL?=
 =?utf-8?B?VEIrUkxZSUtaMFBUQXBid2JubjBsWDNWaGx3cDhvUXZOOW5CZzVWNCtQc3NU?=
 =?utf-8?B?emtUY0NNMHkya0xldHFGK0lseTRQbUVsTUNXZz09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:58:45.2838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a92362-4c8f-4fc0-9204-08dd949289c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9269
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

From: Adrián Larumbe <adrian.larumbe@collabora.com>

The sampler aggregates counter and set requests coming from userspace
and mediates interactions with the FW interface, to ensure that user
sessions cannot override the global configuration.

From the top-level interface, the sampler supports two different types
of samples: clearing samples and regular samples. Clearing samples are
a special sample type that allow for the creation of a sampling
baseline, to ensure that a session does not obtain counter data from
before its creation.

Upon receipt of a relevant interrupt, corresponding to one of the three
relevant bits of the GLB_ACK register, the sampler takes any samples
that occurred, and, based on the insert and extract indices, accumulates
them to an internal storage buffer after zero-extending the counters
from the 32-bit counters emitted by the hardware to 64-bit counters
for internal accumulation.

When the performance counters are enabled, the FW ensures no counter
data is lost when entering and leaving non-counting regions by producing
automatic samples that do not correspond to a GLB_REQ.PRFCNT_SAMPLE
request. Such regions may be per hardware unit, such as when a shader
core powers down, or global. Most of these events do not directly
correspond to session sample requests, so any intermediary counter data
must be stored into a temporary accumulation buffer.

If there are sessions waiting for a sample, this accumulated buffer will
be taken, and emitted for each waiting client. During this phase,
information like the timestamps of sample request and sample emission,
type of the counter block and block index annotations are added to the
sample header and block headers. If no sessions are waiting for
a sample, this accumulation buffer is kept until the next time a sample
is requested.

Special handling is needed for the PRFCNT_OVERFLOW interrupt, which is
an indication that the internal sample handling rate was insufficient.

The sampler also maintains a buffer descriptor indicating the structure
of a firmware sample, since neither the firmware nor the hardware give
any indication of the sample structure, only that it is composed out of
three parts:
 - the metadata is an optional initial counter block on supporting
   firmware versions that contains a single counter, indicating the
   reason a sample was taken when entering global non-counting regions.
   This is used to provide coarse-grained information about why a sample
   was taken to userspace, to help userspace interpret variations in
   counter magnitude.
 - the firmware component of the sample is composed out of a global
   firmware counter block on supporting firmware versions.
 - the hardware component is the most sizeable of the three and contains
   a block of counters for each of the underlying hardware resources. It
   has a fixed structure that is described in the architecture
   specification, and contains the command stream hardware block(s), the
   tiler block(s), the MMU and L2 blocks (collectively named the memsys
   blocks) and the shader core blocks, in that order.
The structure of this buffer changes based on the firmware and hardware
combination, but is constant on a single system.

This buffer descriptor also handles the sparseness of the shader cores,
wherein the physical core mask contains holes, but the memory allocated
for it is done based on the position of the most significant bit. In
cases with highly sparse core masks, this means that a lot of shader
counter blocks are empty, and must be skipped.

The number of ring buffer slots is configurable through module param to
allow for a lower memory footprint on memory constrained systems.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Co-developed-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |    6 +
 drivers/gpu/drm/panthor/panthor_fw.h   |    6 +-
 drivers/gpu/drm/panthor/panthor_perf.c | 1082 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.h |    2 +
 4 files changed, 1080 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0f52766a3120..e3948354daa4 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -22,6 +22,7 @@
 #include "panthor_gem.h"
 #include "panthor_gpu.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -987,9 +988,12 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 
 	/* Enable interrupts we care about. */
 	glb_iface->input->ack_irq_mask = GLB_CFG_ALLOC_EN |
+					 GLB_PERFCNT_SAMPLE |
 					 GLB_PING |
 					 GLB_CFG_PROGRESS_TIMER |
 					 GLB_CFG_POWEROFF_TIMER |
+					 GLB_PERFCNT_THRESHOLD |
+					 GLB_PERFCNT_OVERFLOW |
 					 GLB_IDLE_EN |
 					 GLB_IDLE;
 
@@ -1018,6 +1022,8 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
 		return;
 
 	panthor_sched_report_fw_events(ptdev, status);
+
+	panthor_perf_report_irq(ptdev, status);
 }
 PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
 
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 8bcb933fa790..5a561e72e88b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -198,6 +198,7 @@ struct panthor_fw_global_control_iface {
 	u32 group_num;
 	u32 group_stride;
 #define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
+#define GLB_PERFCNT_HW_SIZE(x) (((x) & GENMASK(15, 0)) << 8)
 	u32 perfcnt_size;
 	u32 instr_features;
 #define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
@@ -210,7 +211,7 @@ struct panthor_fw_global_input_iface {
 #define GLB_CFG_ALLOC_EN			BIT(2)
 #define GLB_CFG_POWEROFF_TIMER			BIT(3)
 #define GLB_PROTM_ENTER				BIT(4)
-#define GLB_PERFCNT_EN				BIT(5)
+#define GLB_PERFCNT_ENABLE			BIT(5)
 #define GLB_PERFCNT_SAMPLE			BIT(6)
 #define GLB_COUNTER_EN				BIT(7)
 #define GLB_PING				BIT(8)
@@ -243,6 +244,9 @@ struct panthor_fw_global_input_iface {
 	u64 perfcnt_base;
 	u32 perfcnt_extract;
 	u32 reserved3[3];
+#define GLB_PERFCNT_CONFIG_SIZE(x) ((x) & GENMASK(7, 0))
+#define GLB_PERFCNT_CONFIG_SET(x) (((x) & GENMASK(1, 0)) << 8)
+#define GLB_PERFCNT_METADATA_ENABLE BIT(10)
 	u32 perfcnt_config;
 	u32 perfcnt_csg_select;
 	u32 perfcnt_fw_enable;
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 15fa533731f3..97603b168d2d 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -9,7 +9,11 @@
 
 #include "panthor_device.h"
 #include "panthor_fw.h"
+#include "panthor_gem.h"
+#include "panthor_gpu.h"
+#include "panthor_mmu.h"
 #include "panthor_perf.h"
+#include "panthor_regs.h"
 
 /**
  * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
@@ -18,6 +22,81 @@
  */
 #define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
 
+/**
+ * PANTHOR_CTR_TIMESTAMP_LO - The first architecturally mandated counter of every block type
+ *                            contains the low 32-bits of the TIMESTAMP value.
+ */
+#define PANTHOR_CTR_TIMESTAMP_LO (0)
+
+/**
+ * PANTHOR_CTR_TIMESTAMP_HI - The register offset containinig the high 32-bits of the TIMESTAMP
+ *                            value.
+ */
+#define PANTHOR_CTR_TIMESTAMP_HI (1)
+
+/**
+ * PANTHOR_CTR_PRFCNT_EN - The register offset containing the enable mask for the enabled counters
+ *                         that were written to memory.
+ */
+#define PANTHOR_CTR_PRFCNT_EN (2)
+
+/**
+ * PANTHOR_HEADER_COUNTERS - The first four counters of every block type are architecturally
+ *                           defined to be equivalent. The fourth counter is always reserved,
+ *                           and should be zero and as such, does not have a separate define.
+ *
+ *                           These are the only four counters that are the same between different
+ *                           blocks and are consistent between different architectures.
+ */
+#define PANTHOR_HEADER_COUNTERS (4)
+
+/**
+ * PANTHOR_CTR_SAMPLE_REASON - The metadata block has a single value in position three which
+ *                             indicates the reason a sample was taken.
+ */
+#define PANTHOR_CTR_SAMPLE_REASON (3)
+
+/**
+ * PANTHOR_HW_COUNTER_SIZE - The size of a hardware counter in the FW ring buffer.
+ */
+#define PANTHOR_HW_COUNTER_SIZE (sizeof(u32))
+
+/**
+ * PANTHOR_PERF_RINGBUF_SLOTS_MIN - The minimum permitted number of slots in the Panthor perf
+ *                                  ring buffer.
+ */
+#define PANTHOR_PERF_RINGBUF_SLOTS_MIN (16)
+
+/**
+ * PANTHOR_PERF_RINGBUF_SLOTS_MAX - The maximum permitted number of slots in the Panthor perf
+ *                                  ring buffer.
+ */
+#define PANTHOR_PERF_RINGBUF_SLOTS_MAX (256)
+
+static unsigned int perf_ringbuf_slots = 32;
+
+static int perf_ringbuf_slots_set(const char *val, const struct kernel_param *kp)
+{
+	unsigned int slots;
+	int ret = kstrtouint(val, 0, &slots);
+
+	if (ret)
+		return ret;
+
+	if (!is_power_of_2(slots))
+		return -EINVAL;
+
+	return param_set_uint_minmax(val, kp, 16, 256);
+}
+
+static const struct kernel_param_ops perf_ringbuf_ops = {
+	.set = perf_ringbuf_slots_set,
+	.get = param_get_uint,
+};
+module_param_cb(perf_ringbuf_slots, &perf_ringbuf_ops, &perf_ringbuf_slots, 0400);
+MODULE_PARM_DESC(perf_ringbuf_slots,
+		 "Power of two slots allocated for the Panthor perf kernel-FW ringbuffer");
+
 enum panthor_perf_session_state {
 	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
 	PANTHOR_PERF_SESSION_ACTIVE = 0,
@@ -63,6 +142,116 @@ enum session_sample_type {
 	SAMPLE_TYPE_REGULAR,
 };
 
+struct panthor_perf_buffer_descriptor {
+	/**
+	 * @block_size: The size of a single block in the FW ring buffer, equal to
+	 *              sizeof(u32) * counters_per_block.
+	 */
+	size_t block_size;
+
+	/**
+	 * @buffer_size: The total size of the buffer, equal to (#hardware blocks +
+	 *               #firmware blocks) * block_size.
+	 */
+	size_t buffer_size;
+
+	/**
+	 * @available_blocks: Bitmask indicating the blocks supported by the hardware and firmware
+	 *                    combination. Note that this can also include blocks that will not
+	 *                    be exposed to the user.
+	 */
+	DECLARE_BITMAP(available_blocks, DRM_PANTHOR_PERF_BLOCK_MAX);
+	struct {
+		/** @offset: Starting offset of a block of type @type in the FW ringbuffer. */
+		size_t offset;
+
+		/** @block_count: Number of blocks of the given @type, starting at @offset. */
+		size_t block_count;
+
+		/** @phys_mask: Bitmask of the physically available blocks. */
+		u64 phys_mask;
+	} blocks[DRM_PANTHOR_PERF_BLOCK_MAX];
+};
+
+/**
+ * struct panthor_perf_sampler - Interface to de-multiplex firmware interaction and handle
+ *                               global interactions.
+ */
+struct panthor_perf_sampler {
+	/**
+	 * @enabled_clients: The number of clients concurrently requesting samples. To ensure that
+	 *                   one client cannot deny samples to another, we must ensure that clients
+	 *                   are effectively reference counted.
+	 */
+	atomic_t enabled_clients;
+
+	/**
+	 * @sample_handled: Synchronization point between the interrupt bottom half and the
+	 *                  main sampler interface. Must be re-armed solely on a new request
+	 *                  coming to the sampler.
+	 */
+	struct completion sample_handled;
+
+	/** @rb: Kernel BO in the FW AS containing the sample ringbuffer. */
+	struct panthor_kernel_bo *rb;
+
+	/**
+	 * @sample_slots: Number of slots for samples in the FW ringbuffer. Could be static,
+	 *		  but may be useful to customize for low-memory devices.
+	 */
+	size_t sample_slots;
+
+	/** @em: Combined enable mask for all of the active sessions. */
+	struct panthor_perf_enable_masks *em;
+
+	/**
+	 * @desc: Buffer descriptor for a sample in the FW ringbuffer. Note that this buffer
+	 *        at current time does some interesting things with the zeroth block type. On
+	 *        newer FW revisions, the first counter block of the sample is the METADATA block,
+	 *        which contains a single value indicating the reason the sample was taken (if
+	 *        any). This block must not be exposed to userspace, as userspace does not
+	 *        have sufficient context to interpret it. As such, this block type is not
+	 *        added to the uAPI, but we still use it in the kernel.
+	 */
+	struct panthor_perf_buffer_descriptor desc;
+
+	/**
+	 * @sample: Pointer to an upscaled and annotated sample that may be emitted to userspace.
+	 *          This is used both as an intermediate buffer to do the zero-extension of the
+	 *          32-bit counters to 64-bits and as a storage buffer in case the sampler
+	 *          requests an additional sample that was not requested by any of the top-level
+	 *          sessions (for instance, when changing the enable masks).
+	 */
+	u8 *sample;
+
+	/**
+	 * @sampler_lock: Lock used to guard the list of sessions and the sampler configuration.
+	 *                In particular, it guards the @session_list and the @em.
+	 */
+	struct mutex sampler_lock;
+
+	/** @session_list: List of all sessions. */
+	struct list_head session_list;
+
+	/** @pend_lock: Lock used to guard the list of sessions with pending samples. */
+	spinlock_t pend_lock;
+
+	/** @pending_samples: List of sessions requesting samples. */
+	struct list_head pending_samples;
+
+	/** @sample_requested: A sample has been requested. */
+	bool sample_requested;
+
+	/** @set_config: The set that will be configured onto the hardware. */
+	u8 set_config;
+
+	/**
+	 * @ptdev: Backpointer to the Panthor device, needed to ring the global doorbell and
+	 *         interface with FW.
+	 */
+	struct panthor_device *ptdev;
+};
+
 struct panthor_perf_session {
 	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
 
@@ -184,6 +373,9 @@ struct panthor_perf {
 	 * @sessions: Global map of sessions, accessed by their ID.
 	 */
 	struct xarray sessions;
+
+	/** @sampler: FW control interface. */
+	struct panthor_perf_sampler sampler;
 };
 
 struct panthor_perf_counter_block {
@@ -237,7 +429,7 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
 }
 
 static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
-		*setup_args)
+								*setup_args)
 {
 	struct panthor_perf_enable_masks *em = kmalloc(sizeof(*em), GFP_KERNEL);
 	if (IS_ERR_OR_NULL(em))
@@ -257,6 +449,23 @@ static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panth
 	return em;
 }
 
+static void panthor_perf_em_add(struct panthor_perf_enable_masks *dst_em,
+				const struct panthor_perf_enable_masks *const src_em)
+{
+	size_t i = 0;
+
+	for (i = DRM_PANTHOR_PERF_BLOCK_FIRST; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
+		bitmap_or(dst_em->mask[i], dst_em->mask[i], src_em->mask[i], PANTHOR_PERF_EM_BITS);
+}
+
+static void panthor_perf_em_zero(struct panthor_perf_enable_masks *em)
+{
+	size_t i = 0;
+
+	for (i = DRM_PANTHOR_PERF_BLOCK_FIRST; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
+		bitmap_zero(em->mask[i], PANTHOR_PERF_EM_BITS);
+}
+
 static u64 session_read_extract_idx(struct panthor_perf_session *session)
 {
 	const u64 slots = session->ringbuf_slots;
@@ -267,6 +476,12 @@ static u64 session_read_extract_idx(struct panthor_perf_session *session)
 	return smp_load_acquire(&session->control->extract_idx) % slots;
 }
 
+static void session_write_insert_idx(struct panthor_perf_session *session, u64 idx)
+{
+	/* Userspace needs the insert index to know where to look for the sample. */
+	smp_store_release(&session->control->insert_idx, idx);
+}
+
 static u64 session_read_insert_idx(struct panthor_perf_session *session)
 {
 	const u64 slots = session->ringbuf_slots;
@@ -326,7 +541,7 @@ static void session_put(struct panthor_perf_session *session)
  * Return: valid session pointer or an ERR_PTR.
  */
 static struct panthor_perf_session *session_find(struct panthor_file *pfile,
-		struct panthor_perf *perf, u32 sid)
+						 struct panthor_perf *perf, u32 sid)
 {
 	struct panthor_perf_session *session;
 
@@ -352,6 +567,761 @@ static struct panthor_perf_session *session_find(struct panthor_file *pfile,
 	return session;
 }
 
+static u32 compress_enable_mask(unsigned long *const src)
+{
+	size_t i;
+	u32 result = 0;
+	unsigned long clump;
+
+	for_each_set_clump8(i, clump, src, PANTHOR_PERF_EM_BITS) {
+		const unsigned long shift = div_u64(i, 4);
+
+		result |= !!(clump & GENMASK(3, 0)) << shift;
+		result |= !!(clump & GENMASK(7, 4)) << (shift + 1);
+	}
+
+	return result;
+}
+
+static void expand_enable_mask(u32 em, unsigned long *const dst)
+{
+	size_t i;
+	DECLARE_BITMAP(emb, BITS_PER_TYPE(u32));
+
+	bitmap_from_arr32(emb, &em, BITS_PER_TYPE(u32));
+
+	for_each_set_bit(i, emb, BITS_PER_TYPE(u32))
+		bitmap_set(dst, i * 4, 4);
+}
+
+/**
+ * panthor_perf_block_data - Identify the block index and type based on the offset.
+ *
+ * @desc:   FW buffer descriptor.
+ * @offset: The current offset being examined.
+ * @idx:    Pointer to an output index.
+ * @type:   Pointer to an output block type.
+ *
+ * To disambiguate different types of blocks as well as different blocks of the same type,
+ * the offset into the FW ringbuffer is used to uniquely identify the block being considered.
+ *
+ * In the future, this is a good time to identify whether a block will be empty,
+ * allowing us to short-circuit its processing after emitting header information.
+ *
+ * Return: True if the current block is available, false otherwise.
+ */
+static bool panthor_perf_block_data(struct panthor_perf_buffer_descriptor *const desc,
+				    size_t offset, u32 *idx,
+				    enum drm_panthor_perf_block_type *type)
+{
+	unsigned long id;
+
+	for_each_set_bit(id, desc->available_blocks, DRM_PANTHOR_PERF_BLOCK_LAST) {
+		const size_t block_start = desc->blocks[id].offset;
+		const size_t block_count = desc->blocks[id].block_count;
+		const size_t block_end = desc->blocks[id].offset +
+			desc->block_size * block_count;
+
+		if (!block_count)
+			continue;
+
+		if ((offset >= block_start) && (offset < block_end)) {
+			const unsigned long phys_mask[] = {
+				BITMAP_FROM_U64(desc->blocks[id].phys_mask),
+			};
+			const size_t pos =
+				div_u64(offset - desc->blocks[id].offset, desc->block_size);
+
+			*type = id;
+
+			if (test_bit(pos, phys_mask)) {
+				const u64 mask = GENMASK_ULL(pos, 0);
+				const u64 zeroes = ~desc->blocks[id].phys_mask & mask;
+
+				*idx = pos - hweight64(zeroes);
+				return true;
+			}
+			return false;
+		}
+	}
+
+	return false;
+}
+
+static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
+{
+	const size_t block_size = get_annotated_block_size(info->counters_per_block);
+	const size_t block_nr = info->cshw_blocks + info->fw_blocks +
+		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
+
+	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
+}
+
+static u32 panthor_perf_handle_sample(struct panthor_device *ptdev, u32 extract_idx, u32 insert_idx)
+{
+	struct panthor_perf *perf = ptdev->perf;
+	struct panthor_perf_sampler *sampler = &ptdev->perf->sampler;
+	const size_t ann_block_size =
+		get_annotated_block_size(ptdev->perf_info.counters_per_block);
+	u32 i;
+
+	for (i = extract_idx; i != insert_idx; i++) {
+		u32 slot = i % sampler->sample_slots;
+		u8 *fw_sample = (u8 *)sampler->rb->kmap + slot * sampler->desc.buffer_size;
+
+		for (size_t fw_off = 0, ann_off = sizeof(struct drm_panthor_perf_sample_header);
+				fw_off < sampler->desc.buffer_size;
+				fw_off += sampler->desc.block_size)
+
+		{
+			u32 idx = 0;
+			enum drm_panthor_perf_block_type type = 0;
+			DECLARE_BITMAP(expanded_em, PANTHOR_PERF_EM_BITS);
+			struct panthor_perf_counter_block *blk =
+				(typeof(blk))(perf->sampler.sample + ann_off);
+			u32 *const block = (u32 *)(fw_sample + fw_off);
+			const u32 prfcnt_en = block[PANTHOR_CTR_PRFCNT_EN];
+
+			if (!panthor_perf_block_data(&sampler->desc, fw_off, &idx, &type))
+				continue;
+
+			/**
+			 * TODO Data from the metadata block must be used to populate the
+			 * block state information.
+			 */
+			if (type == DRM_PANTHOR_PERF_BLOCK_METADATA) {
+				/*
+				 * The host must clear the SAMPLE_REASON to acknowledge it has
+				 * consumed the sample.
+				 */
+				block[PANTHOR_CTR_SAMPLE_REASON] = 0;
+				continue;
+			}
+
+			expand_enable_mask(prfcnt_en, expanded_em);
+
+			blk->header = (struct drm_panthor_perf_block_header) {
+				.clock = 0,
+				.block_idx = idx,
+				.block_type = type,
+				.block_states = DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN
+			};
+			bitmap_to_arr64(blk->header.enable_mask, expanded_em, PANTHOR_PERF_EM_BITS);
+
+			/*
+			 * The four header counters must be treated differently, because they are
+			 * not additive. For the fourth, the assignment does not matter, as it
+			 * is reserved and should be zero.
+			 */
+			blk->counters[PANTHOR_CTR_TIMESTAMP_LO] = block[PANTHOR_CTR_TIMESTAMP_LO];
+			blk->counters[PANTHOR_CTR_TIMESTAMP_HI] = block[PANTHOR_CTR_TIMESTAMP_HI];
+			blk->counters[PANTHOR_CTR_PRFCNT_EN] = block[PANTHOR_CTR_PRFCNT_EN];
+
+			/*
+			 * The host must clear PRFCNT_EN to acknowledge it has consumed the sample.
+			 */
+			block[PANTHOR_CTR_PRFCNT_EN] = 0;
+
+			for (size_t k = PANTHOR_HEADER_COUNTERS;
+					k < ptdev->perf_info.counters_per_block;
+					k++)
+				blk->counters[k] += block[k];
+
+			ann_off += ann_block_size;
+		}
+	}
+
+	return i;
+}
+
+static size_t panthor_perf_get_fw_reported_size(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	size_t fw_size = GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size);
+	size_t hw_size = GLB_PERFCNT_HW_SIZE(glb_iface->control->perfcnt_size);
+	size_t md_size = PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features);
+
+	return md_size + fw_size + hw_size;
+}
+
+#define PANTHOR_PERF_SET_BLOCK_DESC_DATA(__desc, __type, __blk_count, __phys_mask, __offset) \
+	({ \
+		(__desc)->blocks[(__type)].offset = (__offset); \
+		(__desc)->blocks[(__type)].block_count = (__blk_count);  \
+		(__desc)->blocks[(__type)].phys_mask = (__phys_mask);   \
+		if ((__blk_count))                                    \
+			set_bit((__type), (__desc)->available_blocks); \
+		(__offset) + ((__desc)->block_size) * (__blk_count); \
+	 })
+
+static size_t get_reserved_shader_core_blocks(struct panthor_device *ptdev)
+{
+	const u64 sc_mask = ptdev->gpu_info.shader_present;
+
+	return fls64(sc_mask);
+}
+
+#define BLK_MASK(x) GENMASK_ULL((x) - 1, 0)
+
+static u64 get_shader_core_mask(struct panthor_device *ptdev)
+{
+	const u64 sc_mask = ptdev->gpu_info.shader_present;
+
+	return BLK_MASK(hweight64(sc_mask));
+}
+
+static int panthor_perf_setup_fw_buffer_desc(struct panthor_device *ptdev,
+					     struct panthor_perf_sampler *sampler)
+{
+	const struct drm_panthor_perf_info *const info = &ptdev->perf_info;
+	const size_t block_size = info->counters_per_block * PANTHOR_HW_COUNTER_SIZE;
+	struct panthor_perf_buffer_descriptor *desc = &sampler->desc;
+	const size_t fw_sample_size = panthor_perf_get_fw_reported_size(ptdev);
+	size_t offset = 0;
+
+	desc->block_size = block_size;
+
+	for (enum drm_panthor_perf_block_type type = 0; type < DRM_PANTHOR_PERF_BLOCK_MAX; type++) {
+		switch (type) {
+		case DRM_PANTHOR_PERF_BLOCK_METADATA:
+			if (info->flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
+				offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, 1,
+									  BLK_MASK(1), offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_FW:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->fw_blocks,
+								  BLK_MASK(info->fw_blocks),
+								  offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_CSHW:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->cshw_blocks,
+								  BLK_MASK(info->cshw_blocks),
+								  offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_TILER:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->tiler_blocks,
+								  BLK_MASK(info->tiler_blocks),
+								  offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_MEMSYS:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->memsys_blocks,
+								  BLK_MASK(info->memsys_blocks),
+								  offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_SHADER:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type,
+								  get_reserved_shader_core_blocks(ptdev),
+								  get_shader_core_mask(ptdev),
+								  offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_MAX:
+			drm_WARN_ON_ONCE(&ptdev->base,
+					 "DRM_PANTHOR_PERF_BLOCK_MAX should be unreachable!");
+			break;
+		}
+	}
+
+	/* Computed size is not the same as the reported size, so we should not proceed in
+	 * initializing the sampling session.
+	 */
+	if (offset != fw_sample_size)
+		return -EINVAL;
+
+	desc->buffer_size = offset;
+
+	return 0;
+}
+
+static int panthor_perf_fw_stop_sampling(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	u32 acked;
+	int ret;
+
+	if (~READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
+		return 0;
+
+	panthor_fw_update_reqs(glb_iface, req, 0, GLB_PERFCNT_ENABLE);
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
+	if (ret)
+		drm_warn(&ptdev->base, "Could not disable performance counters");
+
+	return ret;
+}
+
+static int panthor_perf_fw_start_sampling(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	u32 acked;
+	int ret;
+
+	if (READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
+		return 0;
+
+	panthor_fw_update_reqs(glb_iface, req, GLB_PERFCNT_ENABLE, GLB_PERFCNT_ENABLE);
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
+	if (ret)
+		drm_warn(&ptdev->base, "Could not enable performance counters");
+
+	return ret;
+}
+
+static void panthor_perf_fw_write_config(struct panthor_perf_sampler *sampler,
+					 struct panthor_perf_enable_masks *em)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
+	u32 perfcnt_config;
+
+	glb_iface->input->perfcnt_csf_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW]);
+	glb_iface->input->perfcnt_shader_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER]);
+	glb_iface->input->perfcnt_mmu_l2_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS]);
+	glb_iface->input->perfcnt_tiler_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER]);
+	glb_iface->input->perfcnt_fw_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_FW]);
+
+	WRITE_ONCE(glb_iface->input->perfcnt_as, panthor_vm_as(panthor_fw_vm(sampler->ptdev)));
+	WRITE_ONCE(glb_iface->input->perfcnt_base, panthor_kernel_bo_gpuva(sampler->rb));
+
+	perfcnt_config = GLB_PERFCNT_CONFIG_SIZE(perf_ringbuf_slots);
+	perfcnt_config |= GLB_PERFCNT_CONFIG_SET(sampler->set_config);
+	if (sampler->ptdev->perf_info.flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
+		perfcnt_config |= GLB_PERFCNT_METADATA_ENABLE;
+
+	WRITE_ONCE(glb_iface->input->perfcnt_config, perfcnt_config);
+
+	/**
+	 * The spec mandates that the host zero the PRFCNT_EXTRACT register before an enable
+	 * operation, and each (re-)enable will require an enable-disable pair to program
+	 * the new changes onto the FW interface.
+	 */
+	WRITE_ONCE(glb_iface->input->perfcnt_extract, 0);
+}
+
+static void panthor_perf_fw_write_sampler_config(struct panthor_perf_sampler *sampler)
+{
+	panthor_perf_fw_write_config(sampler, sampler->em);
+}
+
+static void session_populate_sample_header(struct panthor_perf_session *session,
+					   struct drm_panthor_perf_sample_header *hdr, u8 set)
+{
+	*hdr = (struct drm_panthor_perf_sample_header) {
+		.block_set = set,
+		.user_data = session->user_data,
+		.timestamp_start_ns = session->sample_start_ns,
+		/**
+		 * TODO This should be changed to use the GPU clocks and the TIMESTAMP register,
+		 * when support is added.
+		 */
+		.timestamp_end_ns = ktime_get_raw_ns(),
+	};
+}
+
+/**
+ * session_accumulate_sample - Accumulate the counters that are requested by the session
+ *                             into the target buffer.
+ *
+ * @ptdev: Panthor device
+ * @session: Perf session
+ * @session_sample: Starting offset of the sample in the userspace mapping.
+ * @sampler_sample: Starting offset of the sample in the sampler intermediate buffer.
+ *
+ * The hardware supports counter selection at the granularity of 1 bit per 4 counters, and there
+ * is a single global FW frontend to program the counter requests from multiple sessions. This may
+ * lead to a large disparity between the requested and provided counters for an individual client.
+ * To remove this cross-talk, we patch out the counters that have not been requested by this
+ * session and update the PRFCNT_EN, the header counter containing a bitmask of enabled counters,
+ * accordingly.
+ */
+static void session_accumulate_sample(struct panthor_device *ptdev,
+				      struct panthor_perf_session *session,
+				      u8 *session_sample, u8 *sampler_sample)
+{
+	const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
+	const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
+	const size_t sample_size = session_get_user_sample_size(perf_info);
+	const size_t sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
+	const size_t data_size = sample_size - sample_header_size;
+	struct drm_panthor_perf_sample_header *hdr = (typeof(hdr))session_sample;
+
+	hdr->timestamp_end_ns = ktime_get_raw_ns();
+
+	session_sample += sample_header_size;
+	sampler_sample += sample_header_size;
+
+	for (size_t i = 0; i < data_size; i += block_size) {
+		size_t ctr_idx;
+		DECLARE_BITMAP(enabled_ctrs, PANTHOR_PERF_EM_BITS);
+		struct panthor_perf_counter_block *dst_blk = (typeof(dst_blk))(session_sample + i);
+		struct panthor_perf_counter_block *src_blk = (typeof(src_blk))(sampler_sample + i);
+
+		bitmap_from_arr64(enabled_ctrs, dst_blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
+		bitmap_clear(enabled_ctrs, 0, PANTHOR_HEADER_COUNTERS);
+
+		dst_blk->counters[PANTHOR_CTR_TIMESTAMP_HI] =
+			src_blk->counters[PANTHOR_CTR_TIMESTAMP_HI];
+		dst_blk->counters[PANTHOR_CTR_TIMESTAMP_LO] =
+			src_blk->counters[PANTHOR_CTR_TIMESTAMP_LO];
+
+		for_each_set_bit(ctr_idx, enabled_ctrs, PANTHOR_PERF_EM_BITS)
+			dst_blk->counters[ctr_idx] += src_blk->counters[ctr_idx];
+	}
+}
+
+static void panthor_perf_fw_request_sample(struct panthor_perf_sampler *sampler)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
+
+	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PERFCNT_SAMPLE);
+	gpu_write(sampler->ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+}
+
+/**
+ * session_populate_sample - Write out a new sample into a previously populated slot in the user
+ *                           ringbuffer and update both the header of the block and the PRFCNT_EN
+ *                           counter to contain only the selected subset of counters for that block.
+ *
+ * @ptdev: Panthor device
+ * @session: Perf session
+ * @session_sample: Pointer aligned to the start of the data section of the sample in the targeted
+ *                  slot.
+ * @sampler_sample: Pointer aligned to the start of the data section of the intermediate sampler
+ *                  buffer.
+ *
+ * When a new sample slot is targeted, it must be cleared of the data already existing there,
+ * enabling a direct copy from the intermediate buffer and then zeroing out any counters
+ * that are not required for the current session.
+ */
+static void session_populate_sample(struct panthor_device *ptdev,
+				    struct panthor_perf_session *session, u8 *session_sample,
+				    u8 *sampler_sample)
+{
+	const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
+
+	const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
+	const size_t sample_size = session_get_user_sample_size(perf_info);
+	const size_t sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
+	const size_t data_size = sample_size - sample_header_size;
+
+	memcpy(session_sample, sampler_sample, sample_size);
+
+	session_populate_sample_header(session,
+				       (struct drm_panthor_perf_sample_header *)session_sample,
+				       ptdev->perf->sampler.set_config);
+
+	session_sample += sample_header_size;
+
+	for (size_t i = 0; i < data_size; i += block_size) {
+		size_t ctr_idx;
+		DECLARE_BITMAP(em_diff, PANTHOR_PERF_EM_BITS);
+		struct panthor_perf_counter_block *blk = (typeof(blk))(session_sample + i);
+		enum drm_panthor_perf_block_type type = blk->header.block_type;
+		unsigned long *blk_em = session->enabled_counters->mask[type];
+
+		bitmap_from_arr64(em_diff, blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
+
+		bitmap_andnot(em_diff, em_diff, blk_em, PANTHOR_PERF_EM_BITS);
+		bitmap_clear(em_diff, 0, PANTHOR_HEADER_COUNTERS);
+
+		blk->counters[PANTHOR_CTR_PRFCNT_EN] = compress_enable_mask(blk_em);
+
+		for_each_set_bit(ctr_idx, em_diff, PANTHOR_PERF_EM_BITS)
+			blk->counters[ctr_idx] = 0;
+
+		bitmap_to_arr64(&blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
+	}
+}
+
+static int session_copy_sample(struct panthor_device *ptdev, struct panthor_perf_session *session)
+{
+	struct panthor_perf *perf = ptdev->perf;
+	const size_t sample_size = session_get_user_sample_size(&ptdev->perf_info);
+	const u64 insert_idx = session_read_insert_idx(session);
+	const u64 extract_idx = session_read_extract_idx(session);
+	u8 *new_sample;
+
+	if (!CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots))
+		return -ENOSPC;
+
+	if (READ_ONCE(session->pending_sample_request) == SAMPLE_TYPE_INITIAL)
+		return 0;
+
+	new_sample = session->samples + insert_idx * sample_size;
+
+	if (session->accum_idx != insert_idx) {
+		session_populate_sample(ptdev, session, new_sample, perf->sampler.sample);
+		session->accum_idx = insert_idx;
+	} else
+		session_accumulate_sample(ptdev, session, new_sample, perf->sampler.sample);
+
+	return 0;
+}
+
+static void session_emit_sample(struct panthor_perf_session *session)
+{
+	const u64 insert_idx = session_read_insert_idx(session);
+	const enum session_sample_type type = READ_ONCE(session->pending_sample_request);
+
+	if (type == SAMPLE_TYPE_INITIAL || type == SAMPLE_TYPE_NONE)
+		goto reset_sample_request;
+
+	session_write_insert_idx(session, (insert_idx + 1) % session->ringbuf_slots);
+
+	/* Since we are about to notify userspace, we must ensure that all changes to memory
+	 * are visible.
+	 */
+	wmb();
+
+	eventfd_signal(session->eventfd);
+
+reset_sample_request:
+	WRITE_ONCE(session->pending_sample_request, SAMPLE_TYPE_NONE);
+}
+
+#define PRFCNT_IRQS (GLB_PERFCNT_OVERFLOW | GLB_PERFCNT_SAMPLE | GLB_PERFCNT_THRESHOLD)
+
+void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status)
+{
+	struct panthor_perf *const perf = ptdev->perf;
+	struct panthor_perf_sampler *sampler;
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	bool sample_requested;
+
+	if (!(status & JOB_INT_GLOBAL_IF))
+		return;
+
+	if (!perf)
+		return;
+
+	sampler = &perf->sampler;
+
+	const u32 ack = READ_ONCE(glb_iface->output->ack);
+	const u32 req = READ_ONCE(glb_iface->input->req);
+
+	scoped_guard(spinlock_irqsave, &sampler->pend_lock)
+		sample_requested = sampler->sample_requested;
+
+
+	/*
+	 * TODO Fix up the error handling for overflow. Currently, the user is unblocked
+	 * with a completely empty sample, whic is not the intended behaviour.
+	 */
+	if (drm_WARN_ON_ONCE(&ptdev->base, (req ^ ack) & GLB_PERFCNT_OVERFLOW))
+		goto emit;
+
+	if ((sample_requested && (req & GLB_PERFCNT_SAMPLE) == (ack & GLB_PERFCNT_SAMPLE)) ||
+			((req ^ ack) & GLB_PERFCNT_THRESHOLD)) {
+		const u32 extract_idx = READ_ONCE(glb_iface->input->perfcnt_extract);
+		const u32 insert_idx = READ_ONCE(glb_iface->output->perfcnt_insert);
+
+		/* If the sample was requested around a reset, some time may be needed
+		 * for the FW interface to be updated, so we reschedule a sample
+		 * and return immediately.
+		 */
+		if (insert_idx == extract_idx) {
+			guard(spinlock_irqsave)(&sampler->pend_lock);
+			if (sampler->sample_requested)
+				panthor_perf_fw_request_sample(sampler);
+
+			return;
+		}
+
+		WRITE_ONCE(glb_iface->input->perfcnt_extract,
+			   panthor_perf_handle_sample(ptdev, extract_idx, insert_idx));
+	}
+
+	scoped_guard(mutex, &sampler->sampler_lock)
+	{
+		struct list_head *pos;
+
+		list_for_each(pos, &sampler->session_list) {
+			struct panthor_perf_session *session = list_entry(pos,
+					struct panthor_perf_session, sessions);
+
+			session_copy_sample(ptdev, session);
+		}
+	}
+
+emit:
+	scoped_guard(spinlock_irqsave, &sampler->pend_lock) {
+		struct list_head *pos, *tmp;
+
+		list_for_each_safe(pos, tmp, &sampler->pending_samples) {
+			struct panthor_perf_session *session = list_entry(pos,
+					struct panthor_perf_session, pending);
+
+			session_emit_sample(session);
+			list_del(pos);
+			session_put(session);
+		}
+
+		sampler->sample_requested = false;
+	}
+
+	memset(sampler->sample, 0, session_get_user_sample_size(&ptdev->perf_info));
+	complete(&sampler->sample_handled);
+}
+
+static int panthor_perf_sampler_init(struct panthor_perf_sampler *sampler,
+				     struct panthor_device *ptdev)
+{
+	struct panthor_kernel_bo *bo;
+	u8 *sample;
+	int ret;
+
+	ret = panthor_perf_setup_fw_buffer_desc(ptdev, sampler);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"Failed to setup descriptor for FW ring buffer, err = %d", ret);
+		return ret;
+	}
+
+	bo = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
+				      sampler->desc.buffer_size * perf_ringbuf_slots,
+				      DRM_PANTHOR_BO_NO_MMAP,
+				      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
+				      DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
+				      PANTHOR_VM_KERNEL_AUTO_VA);
+
+	if (IS_ERR_OR_NULL(bo))
+		return IS_ERR(bo) ? PTR_ERR(bo) : -ENOMEM;
+
+	ret = panthor_kernel_bo_vmap(bo);
+	if (ret)
+		goto cleanup_bo;
+
+	sample = kzalloc(session_get_user_sample_size(&ptdev->perf_info), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(sample)) {
+		ret = -ENOMEM;
+		goto cleanup_vmap;
+	}
+
+	sampler->rb = bo;
+	sampler->sample = sample;
+	sampler->sample_slots = perf_ringbuf_slots;
+	sampler->em = kzalloc(sizeof(*sampler->em), GFP_KERNEL);
+
+	mutex_init(&sampler->sampler_lock);
+	spin_lock_init(&sampler->pend_lock);
+	INIT_LIST_HEAD(&sampler->session_list);
+	INIT_LIST_HEAD(&sampler->pending_samples);
+	init_completion(&sampler->sample_handled);
+
+	sampler->ptdev = ptdev;
+
+	return 0;
+
+cleanup_vmap:
+	panthor_kernel_bo_vunmap(bo);
+
+cleanup_bo:
+	panthor_kernel_bo_destroy(bo);
+
+	return ret;
+}
+
+static void panthor_perf_sampler_term(struct panthor_perf_sampler *sampler)
+{
+	int ret;
+	bool requested;
+
+	scoped_guard(spinlock_irqsave, &sampler->pend_lock)
+		requested = sampler->sample_requested;
+
+	if (requested)
+		wait_for_completion_killable(&sampler->sample_handled);
+
+	panthor_perf_fw_write_config(sampler, &(struct panthor_perf_enable_masks){});
+
+	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+	if (ret)
+		drm_warn_once(&sampler->ptdev->base, "Sampler termination failed, ret = %d", ret);
+
+	kfree(sampler->sample);
+
+	panthor_kernel_bo_destroy(sampler->rb);
+}
+
+static int panthor_perf_sampler_add(struct panthor_perf_sampler *sampler,
+				    struct panthor_perf_session *session, u8 set)
+{
+	int ret = 0;
+	struct panthor_perf_enable_masks *session_em = session->enabled_counters;
+
+	guard(mutex)(&sampler->sampler_lock);
+
+	/* Early check for whether a new set can be configured. */
+	if (!atomic_read(&sampler->enabled_clients))
+		sampler->set_config = set;
+	else
+		if (sampler->set_config != set)
+			return -EBUSY;
+
+	panthor_perf_em_add(sampler->em, session_em);
+	ret = pm_runtime_resume_and_get(sampler->ptdev->base.dev);
+	if (ret)
+		return ret;
+
+	if (atomic_read(&sampler->enabled_clients)) {
+		ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+		if (ret)
+			return ret;
+	}
+
+	panthor_perf_fw_write_sampler_config(sampler);
+
+	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	session_get(session);
+	list_add_tail(&session->sessions, &sampler->session_list);
+	atomic_inc(&sampler->enabled_clients);
+
+	return 0;
+}
+
+static int panthor_perf_sampler_remove_session(struct panthor_perf_sampler *sampler,
+					       struct panthor_perf_session *session)
+{
+	int ret;
+	struct list_head *snode;
+
+	guard(mutex)(&sampler->sampler_lock);
+
+	list_del_init(&session->sessions);
+	session_put(session);
+
+	panthor_perf_em_zero(sampler->em);
+	list_for_each(snode, &sampler->session_list)
+	{
+		struct panthor_perf_session *session =
+			container_of(snode, typeof(*session), sessions);
+
+		panthor_perf_em_add(sampler->em, session->enabled_counters);
+	}
+
+	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	atomic_dec(&sampler->enabled_clients);
+	pm_runtime_put_sync(sampler->ptdev->base.dev);
+
+	panthor_perf_fw_write_sampler_config(sampler);
+
+	if (atomic_read(&sampler->enabled_clients))
+		return panthor_perf_fw_start_sampling(sampler->ptdev);
+	return 0;
+}
+
 /**
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
@@ -382,6 +1352,10 @@ int panthor_perf_init(struct panthor_device *ptdev)
 		.max = 1,
 	};
 
+	ret = panthor_perf_sampler_init(&perf->sampler, ptdev);
+	if (ret)
+		return ret;
+
 	drm_info(&ptdev->base, "Performance counter subsystem initialized");
 
 	ptdev->perf = no_free_ptr(perf);
@@ -389,6 +1363,69 @@ int panthor_perf_init(struct panthor_device *ptdev)
 	return ret;
 }
 
+static int sampler_request(struct panthor_perf_sampler *sampler,
+			   struct panthor_perf_session *session, enum session_sample_type type)
+{
+	guard(spinlock_irqsave)(&sampler->pend_lock);
+
+	/*
+	 * If a previous sample has not been handled yet, the session cannot request another
+	 * sample. If this happens too often, the requested sample rate is too high.
+	 */
+	if (READ_ONCE(session->pending_sample_request) != SAMPLE_TYPE_NONE)
+		return -EBUSY;
+
+	WRITE_ONCE(session->pending_sample_request, type);
+	session_get(session);
+	list_add_tail(&session->pending, &sampler->pending_samples);
+
+	if (!sampler->sample_requested) {
+		reinit_completion(&sampler->sample_handled);
+		sampler->sample_requested = true;
+		panthor_perf_fw_request_sample(sampler);
+	}
+
+	return 0;
+}
+
+/**
+ * panthor_perf_sampler_request_initial - Request an initial sample.
+ * @sampler: Panthor sampler
+ * @session: Target session
+ *
+ * Perform a synchronous sample that gets immediately discarded. This sets a baseline at the point
+ * of time a new session is started, to avoid having counters from before the session.
+ */
+static int panthor_perf_sampler_request_initial(struct panthor_perf_sampler *sampler,
+						struct panthor_perf_session *session)
+{
+	int ret = sampler_request(sampler, session, SAMPLE_TYPE_INITIAL);
+
+	if (ret)
+		return ret;
+
+	return wait_for_completion_timeout(&sampler->sample_handled,
+			msecs_to_jiffies(1000));
+}
+
+/**
+ * panthor_perf_sampler_request_sample - Request a counter sample for the userspace client.
+ * @sampler: Panthor sampler
+ * @session: Target session
+ *
+ * A session that has already requested a sample cannot request another one until the previous
+ * sample has been delivered.
+ *
+ * Return:
+ * * %0       - The sample has been requested successfully.
+ * * %-EBUSY  - The target session has already requested a sample and has not received it yet.
+ */
+static int panthor_perf_sampler_request_sample(struct panthor_perf_sampler *sampler,
+					       struct panthor_perf_session *session)
+{
+	return sampler_request(sampler, session, SAMPLE_TYPE_REGULAR);
+}
+
 static int session_validate_set(u8 set)
 {
 	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
@@ -417,8 +1454,8 @@ static int session_validate_set(u8 set)
  * Return: non-negative session identifier on success or negative error code on failure.
  */
 int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
-		struct drm_panthor_perf_cmd_setup *setup_args,
-		struct panthor_file *pfile)
+			       struct drm_panthor_perf_cmd_setup *setup_args,
+			       struct panthor_file *pfile)
 {
 	struct panthor_perf_session *session;
 	struct drm_gem_object *ringbuffer;
@@ -510,6 +1547,10 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
 	kref_init(&session->ref);
 	session->enabled_counters = em;
 
+	ret = panthor_perf_sampler_add(&perf->sampler, session, setup_args->block_set);
+	if (ret)
+		goto cleanup_xa_alloc;
+
 	session->sample_freq_ns = setup_args->sample_freq_ns;
 	session->user_sample_size = user_sample_size;
 	session->ring_buf = ringbuffer;
@@ -520,6 +1561,9 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
 
 	return session_id;
 
+cleanup_xa_alloc:
+	xa_store(&perf->sessions, session_id, NULL, GFP_KERNEL);
+
 cleanup_em:
 	kfree(em);
 
@@ -545,8 +1589,10 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
 }
 
 static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
-		u64 user_data)
+			u64 user_data)
 {
+	int ret;
+
 	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
 		return 0;
 
@@ -559,14 +1605,17 @@ static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *
 
 	session->user_data = user_data;
 
+	ret = panthor_perf_sampler_request_sample(&perf->sampler, session);
+	if (ret)
+		return ret;
+
 	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
 
-	/* TODO Calls to the FW interface will go here in later patches. */
 	return 0;
 }
 
 static int session_start(struct panthor_perf *perf, struct panthor_perf_session *session,
-		u64 user_data)
+			 u64 user_data)
 {
 	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
 		return 0;
@@ -580,12 +1629,11 @@ static int session_start(struct panthor_perf *perf, struct panthor_perf_session
 	if (session->sample_freq_ns)
 		session->user_data = user_data;
 
-	/* TODO Calls to the FW interface will go here in later patches. */
-	return 0;
+	return panthor_perf_sampler_request_initial(&perf->sampler, session);
 }
 
 static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
-		u64 user_data)
+			  u64 user_data)
 {
 	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
 		return 0;
@@ -608,14 +1656,16 @@ static int session_sample(struct panthor_perf *perf, struct panthor_perf_session
 	session->sample_start_ns = ktime_get_raw_ns();
 	session->user_data = user_data;
 
-	return 0;
+	return panthor_perf_sampler_request_sample(&perf->sampler, session);
 }
 
 static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
 {
+	int ret = panthor_perf_sampler_remove_session(&perf->sampler, session);
+
 	session_put(session);
 
-	return 0;
+	return ret;
 }
 
 static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
@@ -691,7 +1741,7 @@ int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_per
  * Return: 0 on success, negative error code on failure.
  */
 int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
-		u32 sid, u64 user_data)
+			       u32 sid, u64 user_data)
 {
 	struct panthor_perf_session *session = session_find(pfile, perf, sid);
 	int err;
@@ -724,7 +1774,7 @@ int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *
  * Return: 0 on success, negative error code on failure.
  */
 int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
-		u32 sid, u64 user_data)
+			      u32 sid, u64 user_data)
 {
 	struct panthor_perf_session *session = session_find(pfile, perf, sid);
 	int err;
@@ -755,7 +1805,7 @@ int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *p
  * Return: 0 on success, negative error code on failure.
  */
 int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
-		u32 sid, u64 user_data)
+				u32 sid, u64 user_data)
 {
 	struct panthor_perf_session *session = session_find(pfile, perf, sid);
 	int err;
@@ -822,6 +1872,8 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 
 	xa_destroy(&perf->sessions);
 
+	panthor_perf_sampler_term(&perf->sampler);
+
 	kfree(ptdev->perf);
 
 	ptdev->perf = NULL;
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index 89d61cd1f017..c482198b6fbd 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -28,5 +28,7 @@ int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf
 		u32 sid, u64 user_data);
 void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
 
+void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
+
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty

