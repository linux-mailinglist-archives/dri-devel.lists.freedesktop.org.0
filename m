Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5D5CBF318
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3426D10E679;
	Mon, 15 Dec 2025 17:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="rPqnuhls";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rPqnuhls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F8710E685
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:16:27 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qY2aJkY8kpSzG5gVZVIu9Sotx0xmfgeszKw06sApaxz7EhS6+2SrUaPI2RqEgTeuymQ0HYf9fclyyXoMbwN3kZlz5AAi2TBcumFXvM7hhT770PS3AVIDAHKCZJKKw7Prfy05P2Jc11SeluXI7Y1c/6xbgghRzOrFVCrvXFvsIFYtCjJK9oM8Lz0RSCHdBzyNIn3zRqJVuvU0znsdLGat+txL8sIxilNNRmPwUf87PBtT0eZY4GFq0DWZPe74nFJ9rsFIoMRu1Jbo0H2oPdkGjADF6PlwS2XOMQEM8NgoFHduiNM8iBqrW3Jwj00n6byU82f8CwUsgg8DEEG2tIdjkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2USbQcS11Z7da2b0QhG0w6y7bOj1D6REDcwscG5Ejs=;
 b=h2LuBDzzbD9vfdd9xlW7nW8YWlqIrlONxSC4qcERf3ye0CDX8I/DQyWbsebalrj7Ff9m9lOd+/8S0Ho6d2MjItvDvVv0sfu1Iyad7U0xB3e3gKu48rR5xRYLuPgfMS4ieUkZFX/bF+eVtxp1ggkU163OwsxkrZwCM46m87i4m3/9j8iWMNLGqjE1LqQU1xglXDTTjK4Hj69jstpgNInEaQ6LAvEWjfDfwaIm78KGJo0258snsZyQBxKRoYnd0pUwo2SkxXyB63CZHKZKYfE2yo+OdnxoSxsLYkYklSygiWgu+ckMuPJnHyoj7mGD/IDt8jclJs4XjoZTLriLxCe3Hw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2USbQcS11Z7da2b0QhG0w6y7bOj1D6REDcwscG5Ejs=;
 b=rPqnuhlsRFZGezBg3aZUD+cpQSIf84WScJtaMEDUU49kLp2J8seSJ+vlYY13bCr+p8L9z+dFHVQiacQ/3sTpqpNhyBOZmG09vwmDOEWIItKPWFb6rdx6EfPx4XFzF8TlNHL7ViXRFXx2IOFzaOlUvwRtsC4HAUsLKwKvomXKPjU=
Received: from DUZPR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::8) by AS2PR08MB9414.eurprd08.prod.outlook.com
 (2603:10a6:20b:596::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:16:21 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::d7) by DUZPR01CA0017.outlook.office365.com
 (2603:10a6:10:46b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 17:16:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 17:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEjZDWwdbnO+TBQpfFhXZKBlvmN6lqxzfda4i2nE4WiH+MjVNzqamBp/sJcJ/tjc7A0yTXGAWWIiUhq3EwNBkgaoldg2zTfzQpXPzC7TDJDZ3EH9JhTRSbokAHKJKfuF27rW/3rIZJCqtKcHHdk8hr8LOMbovH4pT+l7jcYrTzHDC7mvLnz9QMSi64wgmRllRgtg4Vy4YMcidY75IBMKVihFbxr+p8Hsp/PcQn79LI2p0isRozcJP5v89K2LlBFPrTf9KSVdhV9h9uFcuh7eD1Dl+TbdfkeJwLHhtYQaVvkl0+pVxswaXOxS1Fe+YNMFoHL05rPdr8Bpu3CVGye4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2USbQcS11Z7da2b0QhG0w6y7bOj1D6REDcwscG5Ejs=;
 b=WqSkV+vqaE6QhBW4oZQw26z0zA3hlsVCiLo4aUclqaFNwMn5xIY5B2EK5QRrh7OrzTq7bcc93HIX6GSM5Z3a4QK648Q1IxGAYW9E+SEIyER90IpqZmftugZPL+Lue7FSTFjJCToDWjbqYzV6iTgUgGoU6AcwJn5hyvoGAp5vAcxzn0fj2jTZ2rft0jOqoYo0jpKjGo9Q0GOYK4SNIsyLFh1c/Q80A1uz1BCxRpmEgaMOoa/4kvTAsXCL6NczGHOLwFh5BGtAbOkX7Pmc/zfzxR0fNmiw8KNT5JLfH1M1e/u8ZLQLZqZ6dh0+N1aXx3ZqalTwZp/LUJd11lDqecV3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2USbQcS11Z7da2b0QhG0w6y7bOj1D6REDcwscG5Ejs=;
 b=rPqnuhlsRFZGezBg3aZUD+cpQSIf84WScJtaMEDUU49kLp2J8seSJ+vlYY13bCr+p8L9z+dFHVQiacQ/3sTpqpNhyBOZmG09vwmDOEWIItKPWFb6rdx6EfPx4XFzF8TlNHL7ViXRFXx2IOFzaOlUvwRtsC4HAUsLKwKvomXKPjU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by GV1PR08MB10607.eurprd08.prod.outlook.com (2603:10a6:150:16c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:15:18 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:15:17 +0000
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
Subject: [PATCH v6 7/7] drm/panthor: Expose the panthor perf ioctls
Date: Mon, 15 Dec 2025 17:14:53 +0000
Message-Id: <20251215171453.2506348-8-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0621.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::21) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|GV1PR08MB10607:EE_|DB1PEPF0003922D:EE_|AS2PR08MB9414:EE_
X-MS-Office365-Filtering-Correlation-Id: f7648c28-d539-445d-5b67-08de3bfdab14
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MDErcTl0OWZmNGpvR3FNY3RrMVhjd0hYRitHTW4yL1pVV1dzZ08xbkFhOVEv?=
 =?utf-8?B?cGFJdWo5b2JYQ0l0NTFQN2gzUXczRzJZTXk1VVA0eVBiTTlkNWVERi96VDh1?=
 =?utf-8?B?Vm1Rck9vNjFjUDlwWDMwbWRxUDZ0ODA5dTloUmQ0ZmY3WTk0ZkdhVjMxdWZx?=
 =?utf-8?B?bWJzaWhuMFU0aHIxbjBxOFVOUWxtR3hVeWIwTzc3ZCtpSVJPaUQxVEVrWitj?=
 =?utf-8?B?VU9oaitQZnJORkkraU1iU0dRK1FKUU1acFE4c3AvamozWjlVeUFJZjk5RStL?=
 =?utf-8?B?MVdSOE14WVp1Q2x0NEkwWTVpK3NYVGdFRUJ3V0k2eHF2elhvVC8rYVQ1akgw?=
 =?utf-8?B?NythYzBSQitrZGZCR2RvTC9qMzZMOWtmR3I0d1gxSTh5bzhYU1REQXNGNFJs?=
 =?utf-8?B?WWExd0ZhQnVvRG5IZkZaSVo5MnJsSXlWdHNKN1F1UlhCa2NFeTVJQlB6RlFU?=
 =?utf-8?B?VzYwbXdGSzRUOERXMlJhbW13VCtRTDV6VW5zYVpGb1FHdVE4Zm9OL0NRVGow?=
 =?utf-8?B?ZlVJVTNCQzFINGw1ZHIvYTBadzJnQ3cxZ2oyZmdsZ3dWYXlIUGtqQTBZNHE1?=
 =?utf-8?B?OW5DajMxZmxtQ0FoS3VNUkxZWmpCWERXN0NhSFJoRHliMWhnc0Uyd1Y0WFRM?=
 =?utf-8?B?UHd6M25YRVoxRmhwOGx0S3RXeGZ5d3VIWlNYbXhUN2NObURLQjdGME9FRUhF?=
 =?utf-8?B?VGRpRXhyTXRiU0NONC9IUmZOM3BueXNkSzJ1Y09WY0lZeFg4M0drdVBralhP?=
 =?utf-8?B?aWNKM0NpMDUvSnM3aU1DekJFYXoxTkx2ZVZvcXpoelEvcGgwZjBiVXFLMDJz?=
 =?utf-8?B?UnB0V0t0bjdGN1dDcC92bWRPcmM1Y1pOdGpJMGx1ZjhXQUtGbFFIL2tTOWgw?=
 =?utf-8?B?Y1Y5RmVIeXROV3BHWkxrbk9ZcUl1UVhXRFNzM2RVcVJ5ME1WckNtdXFkS3BP?=
 =?utf-8?B?VnF6clhJV2VHa0swOStuZzEwUjI5cVAyUHVITHNFKzl1U1Z2bFNweTdmMHg0?=
 =?utf-8?B?UTd6LytHSVFyY2VzQXpsM0k4V0hGQXVOU2ROVGJXVDkyVmM5VWNvTDBzMXJH?=
 =?utf-8?B?cFR5dEVLZ0lkT0pTYnhnenF3dVljRldGbURHZ1Z3aldWVVhNeXRDZHRkQXIx?=
 =?utf-8?B?ekEvY3FETTZkU25UaTdKR3dNTms2UU8vempVakUvakZiV29jYlBudWlRTlFo?=
 =?utf-8?B?cHZCdDBCeEs0NjI3K0VCQURVT1hlMU5jVEJDWnArUmtQQStMMlBvRi9DZU5p?=
 =?utf-8?B?RXp5NjF5bkVKWWYrTmJJWVRhNThGdkU4UjFHcXNaMjVxNmhRRWw5Z1lnTVdM?=
 =?utf-8?B?UUlOcGZQZUZiNEhvMHYyNjlheUs0MDlmMFprTU5jS0kvSG1tR3ZxRlBWZmVn?=
 =?utf-8?B?N0VhOFFTMzFaUm9INFlJMnJ4cVNlelo1QUVQTzR2UU5oV1J6MEk2bWlOMHRB?=
 =?utf-8?B?ZlVJa21HQjQvMVp4eWtHZzdRZTdtUi9LK083aStzcHN0MUg3UjIrZTlQRmVP?=
 =?utf-8?B?UTVxZU9QT01weUhLWmRpZUY2SmdiTEQ4VVFFTWRLUmxIT1dJeXZCaENwRk9Z?=
 =?utf-8?B?RDZoVGlmMEpncFYyTGlNclZtejBxb1paZWNKbFdsSDJNUzhsOFpKSmhvclR0?=
 =?utf-8?B?RU94a2d3MmQ2QmR6SndLL2pya3FQWktDMCtDaFhwNFZMM3M5ZDlYV3pTTlNG?=
 =?utf-8?B?QjArTmhBWmNhTTN1a3ZQZ2dzR0pwY05YOU8zQThjdkxKQVM2TVhiT0ZVNDBi?=
 =?utf-8?B?ZHNwMHpKMXlkRjB0cFBBMDBGM0JyRlpGUlJ1YkhXekE2UWh5K1g1UVFKY0ZC?=
 =?utf-8?B?VURRUHVycTdYaGFUY0U0UWhBcFpocXR3YkpLSlUvdzlwbmtDd1lBcFMyaVFB?=
 =?utf-8?B?WGVrZ29IbS8weEI4SEk1TVpCNldzL09KZVB3S3lQSmd0N0VvS3JiQ1JMdjJT?=
 =?utf-8?Q?+TDInsw8KyMlvu2MGYzALUmNyZMc5sQJ?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10607
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0235ff5f-c912-4cd8-af5c-08de3bfd84b1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|35042699022|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXM4Tlp2QVFnbk5WVHA5Vm1Sd0ZnVHVXdS9sMTZHZkNoNmkrQXdoYjVsN2Zv?=
 =?utf-8?B?ZnhmQ3B6YmNXK0RFSm1HSmtXSG9mVVZFOG9GM0JNblJYd1VaUWNMb2xhSWIr?=
 =?utf-8?B?djBudkkxVTlMcnVNaWhyY1VlOGh4ODZVVERVeHZ1MldRWGsxazRoaXAvVUZk?=
 =?utf-8?B?TVgrZGYxM1cwUUVPOGd4N09keFRmUEQybWtRcDRXVkg1djU4SHFPSDNvR1Np?=
 =?utf-8?B?K25ZbkFHY0JOSDZEc2w2b1pvRkR4RWVUL2tNUDRHYkoreXowUy9Kb3NtTkF5?=
 =?utf-8?B?cGlYcXJPeVByUU5BWjg5M1BoRno4d2ZtaHVEemNZcU1ZUTBxQTQzVjFwaGE0?=
 =?utf-8?B?Zy8vWjloYU5hZ003WlRQd1lpcE03SVB6dDNVMEhyYXdXS3RyQXBLRHNMTTRL?=
 =?utf-8?B?T29RVm5ZbzNIcWt0dEdNZnJyTjRRTU11ZVVBYXdlMktaQStFSEVQcWRKRDU2?=
 =?utf-8?B?aGQrUWhtMktYUFNxQlF6Z0M1V3RYSWRtMTgxV1Bta2V2djNUUjhLK2hrMkJP?=
 =?utf-8?B?NlZ4Z3UrWC9UL2p4aGZEaUdVT1lWeURjdlNWS2ZnYldSdTRhbVR2Y3czRVhT?=
 =?utf-8?B?OC9HblBlSWY5eVpObmZMck1EWTlJZVhZcXJTSHRRWlJ3VVNOSmpSZUdVdHZ6?=
 =?utf-8?B?UUdFSEVRNThkcURtOUVQUEM0NitYTENJdW1KYzNsdnQ0ZmwyR2JyZ3pnbDRk?=
 =?utf-8?B?SnkrYmlLb0ZHQWNMczNNcGh1WnJwUlArN213REZZZVNqc1pNQlpaMkJFOXpz?=
 =?utf-8?B?N0xkTEJUQVFhbjAyTzZxeGNzS2RlTitINjhWeDFhNUV6Zyt2SnRsMnRVeHFT?=
 =?utf-8?B?OXlqU1htYkpFK0xld0Q3VWVINnRMT0FFSTVuUlQvT0NFZy9hOEE2UU5vUHNB?=
 =?utf-8?B?c0dPbkpDQjJRbXFMVGExc1RFNnlsbHh0VmMrUTBBYTE1akZlRWJqckY4NEhj?=
 =?utf-8?B?emdWMWxGUEhybnlCTkZla0dGTzVlM2R1bVBMTVpWVDhhRjRoWWVnOTRFVmhv?=
 =?utf-8?B?N0xNU2dUeHl6WTZwK1EraHJ6aWpzMW1xWVpoVTFWSGJja3VJbStHNzZFaytV?=
 =?utf-8?B?OFZCM0FtcS9aTW5QcjYzTFNCR3ptaTZHYVhPdmY5YVhlU24vRkhtYnB2NGZh?=
 =?utf-8?B?a2xaS1JGYUJIdDdEYThpbG5wWThtbC8zR01WR1QyOUNmeVozc1kvUWhHRDhr?=
 =?utf-8?B?RytkMUZFZisyM2JRNVBTVnlkZElOUGc1TVVZNzY2OTYzSDkzbGIrMEFMMCtL?=
 =?utf-8?B?cWk4K2JMMkhpQlU5Q0ZodzNYR1VueDF1VTYvOCszakJQVkxLSGtkWkhuVkoy?=
 =?utf-8?B?UjVoOWF5b1c1Z0FuM3JQUEkrck5YUFhsL1RJWE9VQWgydWdHV3h4dFhDVVZB?=
 =?utf-8?B?STE3aUJEN0twVnVZbVRmSkprU1p0UjYxOEMwQkdmaDZxRWVqMTVhT1o1cit5?=
 =?utf-8?B?RUpGcGVRZGFuUUpaTmoxSkhzNEkxY3NhUXVFL0VkaXBpcWNuUzlENmNhMWIv?=
 =?utf-8?B?MWVDSVdxaG5WdVZ3NlVOcmRJRi81dE5JUXIzWllHOVZDWGJZUlF1Z1p4N0sy?=
 =?utf-8?B?SjRhc2kwLy9GaTdlMC80eVFxTWpDQ3BiVTYwMTNyenYrOFIvcHNhZ0ZFeCtB?=
 =?utf-8?B?Zk1uczZpZWFtWHNBVi92ajl6dnFwWjR6QllBSk5yei8zMy9xSTR1MDhyYzkv?=
 =?utf-8?B?Mm9wa3ovSVZXeUx1K29NbHVBSWtnclM5NFFFMVRVU3hGbytudnhCb2pYZ3dN?=
 =?utf-8?B?WVdNVWZSREJMOHFWckJPTUJYZzNmV2pqbk5DRitaSUZkTnJKSEFyUDNLNml1?=
 =?utf-8?B?aWJJSllxZW9BdUV4bGVsakJESTN3cHoza0hCNWw2U3VaMkh0ak14NHo2THBY?=
 =?utf-8?B?ckc0bC8zTmpoeExUR1hwNHZlR2IvN2szUXFqbllSL1Y2bTNsa3B6czByREZt?=
 =?utf-8?B?S0cyVnAyeGt3dmtLTHdQTFhhazNjUElRdDhjc3paVktqaXBUS0lDVVoxeDFz?=
 =?utf-8?B?V1JvaU8wcnp6aTNMRTlnakhybDNmd0NxUWlxUGN2QWo1YkFUcS9naHhmelJE?=
 =?utf-8?B?N25uL25JM082dU1UZmNJVXdvT0ZsbEgvZXY0N1l0OVZma29qZlJKWnJ6c0Rq?=
 =?utf-8?Q?IUZE=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(35042699022)(36860700013)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:16:21.5072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7648c28-d539-445d-5b67-08de3bfdab14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9414
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
 drivers/gpu/drm/panthor/panthor_drv.c | 141 +++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index f9e01c42d237..276c87985422 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -33,6 +33,7 @@
 #include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -75,6 +76,39 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
 	return 0;
 }
 
+/**
+ * panthor_get_uobj() - Copy user object to kernel object.
+ * @usr_ptr: Users pointer.
+ * @usr_size: Size of the user object.
+ * @min_size: Minimum size for this object.
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
+	out_alloc = kvmalloc(min_size, GFP_KERNEL);
+	if (!out_alloc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = copy_struct_from_user(out_alloc, min_size, u64_to_user_ptr(usr_ptr), usr_size);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return_ptr(out_alloc);
+}
+
 /**
  * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
  * @in: The object array to copy.
@@ -179,7 +213,11 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -194,6 +232,25 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
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
@@ -1470,6 +1527,83 @@ static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
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
@@ -1546,6 +1680,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(BO_QUERY_INFO, bo_query_info, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1686,6 +1821,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  *       - adds DRM_IOCTL_PANTHOR_BO_SYNC ioctl
  *       - adds DRM_IOCTL_PANTHOR_BO_QUERY_INFO ioctl
  *       - adds drm_panthor_gpu_info::selected_coherency
+ * - 1.8 - adds DEV_QUERY_PERF_INFO query
+ *       - adds PERF_CONTROL ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1699,7 +1836,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 7,
+	.minor = 8,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-- 
2.33.0.dirty

