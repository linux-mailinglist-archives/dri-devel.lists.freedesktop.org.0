Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15AA962E67
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 19:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FE110E28E;
	Wed, 28 Aug 2024 17:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="VLlud/nZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VLlud/nZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F0210E28E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 17:26:35 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Rjm1T+V8oLr1lwi7+D2+4pGFl9MK4zCOLgvQh1ETVKHtRyitpZBa4/h+E/dTbPHTdxA/lgZbRsy9pnd36uYyGgp5QiUP9iUIJB61lFcEBi1UFZuYTqncuhQC0uaj8ISFLE22PGjmMt5/4C4U9D+4UQqAdwUGM3C8OFs+B03u/CZBMU1DaPfEyVmHR96rnvOcqoF0zpgt4MNfhT/dU56M/ATDFctyPfThsDbmWLJ4PpYG4KZ8sRD5y1zhTHYcHePhc9Hrk2Ind2CY2s7kxFdeJW3dyEZWTYTTF3toTDQYwchmSxnNG7OrXgJLahZLIYGRAuaIFNMj2+Fw/n4vXWK1UQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml9krNOY1z3lu2uy4dgfvpCfoKPiLSWDheMD1MelDPg=;
 b=Chs2ExOr+K1R9cOSjLtJRPElDD4NeANpsLpM0sV6kPhWkDyy3kY24o1CxRKbvTQZTINkQ0B2cKAuJenbYHMlgsKKJbKMXAEAjbxN8RrIOCxuzSYwnKqZzEDZL0wAmasv7sG4eeyuyEUTsg93/f6T5gKCrpvTYZMRDEj2qI1PHLfmQUXf4GyKwRxGnkKEFeHAIu+JcbKG2fltoALGKPHkRVA3wievTvSFe0jGAvr8egTbnVo5bWmfvEHipA7GkpU23u4tpmuSFuOhnIkFSOICe3tvSybu5SCoEtQb4V5rmDpA50AS5Wl1hXssTH1uPP/HOHZ/Rd5cwivGlZ1qLoIhXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml9krNOY1z3lu2uy4dgfvpCfoKPiLSWDheMD1MelDPg=;
 b=VLlud/nZe0uaQ0L2WMnOKXldTbhbGDmiH996cmBywqk2ItpA0JiAch6+g1dWwwsTXoEyZD5wWdCfXyS/WU2y0RU+Gtu+JWZ7D9M8zOgnZ9i/E6Uk5RzJFrgDYfjZVSF3OfvWYGjxQvI31i9xJcNVTOk0EC97qhIuOdAIEMhIAS8=
Received: from AS8PR04CA0090.eurprd04.prod.outlook.com (2603:10a6:20b:313::35)
 by AM8PR08MB5859.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:26:18 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:313:cafe::d7) by AS8PR04CA0090.outlook.office365.com
 (2603:10a6:20b:313::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Wed, 28 Aug 2024 17:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 28 Aug 2024 17:26:18 +0000
Received: ("Tessian outbound 7d86ec5dfeb5:v403");
 Wed, 28 Aug 2024 17:26:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 749c5843b15c9026
X-CR-MTA-TID: 64aa7808
Received: from Ld778b74ff0d4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F828FFC-9A6C-431B-8699-757598A84704.1; 
 Wed, 28 Aug 2024 17:26:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld778b74ff0d4.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 17:26:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVMMg/yJeXqX8DGPS3gFPmzY9CL1szfhjHkLFZgEaMr71bEVNLQ4W7uoNnL80wSkjMBH2pO6xE8fVj9g7/UeApNTJ6Td12E7KCm1O7J6Eu+eGaSs8IRdMqUwWMyAMGDT7Prj32l3mQwK4j2i7G9IW1FiM4W0WSQ1BeGuDIG6472beYgPYq+YBwDtlbAqh+LuMwMexeU1tc4n/2PwoqcRCG/Eo+2ZCIrhDp99tgQdCrXYynw6zVvNPsbZIj0dz4+3NZ+e6NOtv0h7PnZJn8vgfV5wplGCvzZ8Ukdht8fYAlX1FW/2Xnfh1RKqsqMpf8R2wm9IztqBS27JpS17bw3GuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml9krNOY1z3lu2uy4dgfvpCfoKPiLSWDheMD1MelDPg=;
 b=VWp+ycz1zm3lIzUbXjD5S7/kY/D96esaHbuU3oS8k0zWUqTsbZCglNArTvKDZfgks+DncP4XncGj+KIbl8YB8Ec5noM/VHr3kHfwa4HHTXvDFFqjtW9uPjQIgun2eI+0BufUVadL3wb7DrbAiYu+ZsoN4QG0sgmCnOeRXfR8wgNVppIT7PASrJVY/aZh5udukyWpwySm8n5zP7RgNuqiplsAXZ8t48BpvEvje0qS4yLTn11pN6ZPc9sWbUhXSwR0Ot3W3wgKuIZS28Y05PteXbBBSNltIk6ELXV7wQ5XpoGKsXbA+4P7GLlS+GMDX7/kEcAZrG639ZLEWpz2kvPXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml9krNOY1z3lu2uy4dgfvpCfoKPiLSWDheMD1MelDPg=;
 b=VLlud/nZe0uaQ0L2WMnOKXldTbhbGDmiH996cmBywqk2ItpA0JiAch6+g1dWwwsTXoEyZD5wWdCfXyS/WU2y0RU+Gtu+JWZ7D9M8zOgnZ9i/E6Uk5RzJFrgDYfjZVSF3OfvWYGjxQvI31i9xJcNVTOk0EC97qhIuOdAIEMhIAS8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:26:08 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 17:26:08 +0000
From: Mihail Atanassov <mihail.atanassov@arm.com>
To: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [RFC PATCH 00/10] drm/panthor: Add user submission
Date: Wed, 28 Aug 2024 18:25:56 +0100
Message-ID: <20240828172605.19176-1-mihail.atanassov@arm.com>
X-Mailer: git-send-email 2.45.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::8) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB6551:EE_|AMS0EPF0000019A:EE_|AM8PR08MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e29e71d-c9e9-4d32-e699-08dcc78686d7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?M1dBcWxJOEhzMHY4aDUzWjhrWTBmbjgwMjF5WVJTSHJ0eE5hTUhhR2ZBd1FB?=
 =?utf-8?B?RUlPZFpZOXdkWW9Ra01LL252UnVoNkVuUis1dEY2dFAyZTNrK3IrRC9YTGJ2?=
 =?utf-8?B?OW5VMW05UklHTC9KblNZMTVBdEhVd1IzeTM3VEV6b3AweFcrb2MvcEdRdXFP?=
 =?utf-8?B?OTdHaEpUV3JPZTdSa05rNW5KTElZQTZ4dWtMS3ZCVXVkM0RQYUxidjVuS3hL?=
 =?utf-8?B?NFRrRU52S3dOMkw0YjFuR0t0R0FWQVdEU1pDTnZNQTFWWlRKUzBraGZDc2dn?=
 =?utf-8?B?SjRDdlE4dGducmZrbDBlOGJna2kzaUlZVWdDTHZ2SHNaM0dpblM2TGZjQm1X?=
 =?utf-8?B?OEpaRDlFTGp4M1dxTnUwTWZWUEtNNjZ6NTJOT21ZYkxnNzh0Si9pMTNueWVx?=
 =?utf-8?B?dXJRakVUYUZMeUhZYjQ1NVQ1R0NWV0xPcTQ2SDd1WU52OXk0U2x5MzQ2L3VN?=
 =?utf-8?B?WWdHQUVWeFRWU0VHUDN0SmRZdEdvT0ZrbHlGYXRwTnljMXNMWGZaK3lId2J3?=
 =?utf-8?B?bEZydHFtN09oclFaazI4ejc4QkJSQ1ZRaDhMNGJRNENJVjJpckN2Q2ZhbkRU?=
 =?utf-8?B?OGRyandnZGdZcThRZ3NtQVlIcm42bEkxb3o0Z2JaZlJlRDZIcXQ3eVJrUzd0?=
 =?utf-8?B?aWJCeERBUXVqc3BJZFN3TXd3UGZrQ3JFQ2tQVzFZTHNzdFlrTjJuTk4wNHZO?=
 =?utf-8?B?OFphNFFOcytvNUJIMmJWaG0vZysrOTArTzIwcEZsR3JWU2JEM3hCc0lsT0pl?=
 =?utf-8?B?bDBVUzZnNnZMMjcyb1lZQVhVbnVaSENiRFR5QUlOMFFkZlUrd3FkaFZrNzJy?=
 =?utf-8?B?VXNtWktCLzFYWnd3NW0xTjN5M3d4Y0FVQ0QrMGcveVRqcXZmK0hOTVpSTzlJ?=
 =?utf-8?B?eW5ITzVIRWRObnBuQy9pcUJCQm52ZzEycUFIZkY3OFdmcS9ObzdxYm1LM0Fr?=
 =?utf-8?B?bHJYck5ZTVg0dWQ3S1lTVzNVcXl2L3MzRWJJN3hKN1VIb3Nlb2ZCcHBIZTdN?=
 =?utf-8?B?ZklPRkZodHhtVCs3UEVCajVKa2ZRUlJ1SGRxY3N3S00xVGFYM2psZXRGOS80?=
 =?utf-8?B?bTRCVGw5TVk2OW13eUVFRlMyZnZCd1M1TGw5QmtPVUU1RXNMZWtPYmZtUVd4?=
 =?utf-8?B?MGpraWJRaTJQTFhjOFBPd0szYVlPdi9yMmYxMzlSdmE2TEl2bmlqY21nMHlY?=
 =?utf-8?B?clBTLzZtR1FXSVBYS01nbnJzOUMvTUttR3hnRXM4SncxY0w4bERHcEw2dDhu?=
 =?utf-8?B?NmpUOEErZFhQOFpxYUtFWTVHd3A5VEJGQUxxL2o0eGtwVWFMaEczQktLOC8y?=
 =?utf-8?B?cnI0dlVkVlNLRWN6U0lEaGg4Q3pIakdkZ3cxZU82SE4xYXJiTWlJMXJpUkVi?=
 =?utf-8?B?TzBwWDhBUlpFckdnd3RNZnNTUVZGSnNNMGtZalJyWThCQkhLYk55YTI0VWV2?=
 =?utf-8?B?cmlCYlExL3hxQ2ZmN0ZycEpDeVd3TlJ4TGZJUUJ0RFMvMHZiWHgwRndVYTQ3?=
 =?utf-8?B?WEQ1eFJvaEFtQys3VUQ4WW5KYlhNVytTakZnSEE2c0JJdWxJS1ZIV1UrZkp1?=
 =?utf-8?B?cUFkaDU3NjR5RzR0azVaQktyQjBiUGFMajhFL2VYZlFadi9vcHhHcWdBVU9N?=
 =?utf-8?B?M0QwRk83ZHNTWlhBcFhCbVFPZWJIdzFWbkZESUlPemdPZ1k2RDBRRlNOdzVB?=
 =?utf-8?B?d2Z3dXU3MkZZVW5idWErUkl4eDNRSjdlTm0vQTRCbEtsRDJqdEhOdFVSbk9V?=
 =?utf-8?Q?9EoFSqq+wph5GeD5Ek=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f0b9c133-4b40-4654-78f6-08dcc78680fa
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|35042699022; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2l0Sm5JRk5XVzk5eWNUeGZPWTlkTFNNYzNlRVdIZE1vWmJlSDJWYkxXYmxt?=
 =?utf-8?B?UVFCS1VDeDV5K3BDRjFnUVR5UDRLSWh1d0g1OVlYaHRPU1ZXRTRkdXhJM0lx?=
 =?utf-8?B?czBuVnQyeUVBTmFxUExoeTA1N3p5Skd3NE1IeGYvVXl3UFNMR0xTdTVJTVFj?=
 =?utf-8?B?R0I2N2NqSVlxUzdkbkVrUHBsYVU1Q0hpZlNCWTVGcjJaSk0vdGVlSkdLTzVw?=
 =?utf-8?B?a293aXd0QmZxK1ovU1Q3Mk8yMWJiRE5TNFI1U1o3MlV3VTdOTGJ3cE5PNkFB?=
 =?utf-8?B?VVEvOUJobHZPTmtuZjI0VThTUWlnTmdyM2I4ZFZwTkVMYzZReXpPdVZBSFdD?=
 =?utf-8?B?VlFpQ25SSDRMMWhXM3ZnUWZYRFBnS1V4Y08wajVUWFA1M2VVSVpZQ1ZJd2FR?=
 =?utf-8?B?SnlCWmdqc29KQlUyU3paN3Jva0hKUGhBdnA4NDk4eHJHNVF1WUdlQ2k4NTVN?=
 =?utf-8?B?cWl0V2U2UnVYWnBtTVY2Q1ZPZVE3dk9mWnE0akh3eklkRFN1b1ZEZTdLKysw?=
 =?utf-8?B?T0lkOENWampUNmZTNXdjMkgyUWNkSzRNY0RkazJOaC9DcDBDc0tqLzNNd0ZE?=
 =?utf-8?B?STNxUWVySGFSU3Y2bTQ5RlNDL0MySnlCV0ljODZMbG41VXZlVGs4d2F2dytJ?=
 =?utf-8?B?NlFBM2hsRTJXRUtSOEdhbVJCMmpsWm5RUXZFdEZlbDJXaTNFT1ZjejhpOG5Q?=
 =?utf-8?B?MTh2V1RzMWpuRTZOY0JaNmV5TmlVeTRhc1dmSU5TQ2lkemtrb05TSHBkSXNQ?=
 =?utf-8?B?TWZhN1phVklUck9ienZQTkZTdHFFRjVXWG1WNDhxc08yKzVyTVBRN1U5TDRM?=
 =?utf-8?B?MTVUem42N0piLytvWFlOS3Q1VEdIeER2VjRmQTJrRGsrSUdzWERKai93VC9N?=
 =?utf-8?B?T2dVTDQzQjJ0RklSR1lKNVkySUxCQ1JOYkRwRnh4SnNRWXB0amhodlIwYVBw?=
 =?utf-8?B?a0RqTk1DYlJDSHd1dncybkpkczNFWDNibU5WNktpN0ZmVkpRSDFyckhDQVR2?=
 =?utf-8?B?MGN6VlZGdkdFbnAzWEZRUk5HRG1XaVdXOFVaVlR4U2NESXVnUHI5cVpLb3hW?=
 =?utf-8?B?LzUycHNkSnhVSWJ5RDk0Q0g5NER6alRuV0JzcmFLc3lQQWlCVzRVWHZiZkN2?=
 =?utf-8?B?cDg5elZJRmxHSGFZa056M0IwSXpVVnZxK1BMN1VMbnJzNUQ5cHFaUFlmeXNG?=
 =?utf-8?B?NmtMUDJrS1gzQVd5dnFJVUpsczdMSExhTFZtdCt6U1ZQNHVMZW1DUC9UQWhW?=
 =?utf-8?B?MitJcDdvL29jcDJ6QXZ4YmFScVdHeXpyaktDK1ZVQUd1MVdwajJlSjJqTXVt?=
 =?utf-8?B?ZFV1bTBqb05LN3lEUXZlWjE3RjhMVFc3NmorNWpJME00N2tPNkdGTE9rbHgx?=
 =?utf-8?B?ekQvZHUra2tqcE14VDFPc2ptNUs5ZGcrRmdNajhNN1ZzWmZsbEtiV0gvUTEy?=
 =?utf-8?B?ZUZUZ0huRUE2aERId0g2ZjV6b2RMb0tKcXFKZlhCakdQUmZoUGFUZi9neHB1?=
 =?utf-8?B?Vi9HRFZmRURmVTdWbWVJbWd3KytWTE9ZYXZoZ2cveGZkV3NWSU9pM3lDMW9W?=
 =?utf-8?B?M0huYVd4ZEZGcUt2QU1yb2sxWW4xRFpMR29uQjB6WWJjL3k1YmpSYUVOeFJ2?=
 =?utf-8?B?Q0hDU1JyZGl5STBZK3Q5Y0dsemM1WlJ5NFZNbjhVVHE1SmcyYjJEbmZtQ1lp?=
 =?utf-8?B?WHFaS1hPSEUyN2dZcUFQdXpCWTJrSVgzTFlrcEJZMmtvRngrOEVzYkxxR3BZ?=
 =?utf-8?B?TC9RTjEwYkNFblIzQTFiVGhWMkRtSEdBK1YwVVAzSDArTWhILzdlK05EbW03?=
 =?utf-8?B?OFRoYTRUYWUzYmtUanNpRjZONUNkTzRLbjZXNUtueXN6WFV6aEpNZFlkZGpm?=
 =?utf-8?B?OTJIOUtyT1Q0ZkdrY2VTeWRYM0VvRG1PaHlGeHEwSFVmV1E9PQ==?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:26:18.0827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e29e71d-c9e9-4d32-e699-08dcc78686d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5859
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

Hello all,

This series implements a mechanism to expose Mali CSF GPUs' queue
ringbuffers directly to userspace, along with paraphernalia to allow
userspace to control job synchronisation between the CPU and GPU.

The goal of these changes is to allow userspace to control work
submission to the FW/HW directly without kernel intervention in the
common case, thereby reducing context switching overhead. It also allows
for greater flexibility in the way work is enqueued in the ringbufs.
For example, the current kernel submit path only supports indirect
calls, which is inefficient for small command buffers. Userspace can
also skip unnecessary sync operations.

This is still a work-in-progress, there's an outstanding issue with
multiple processes using different submission flows triggering
scheduling bugs (e.g. the same group getting scheduled twice), but we'd
love to gather some feedback on the suitability of the approach in
general and see if there's a clear path to merging something like this
eventually.

I've also CCd AMD maintainers because they have in the past done
something similar[1], in case they want to chime in.

There are two uses of this new uAPI in Mesa, one in gallium/panfrost
(link TBD), and one in panvk [2].

The Gallium implementation is a naïve change just to switch the
submission model and exercise the new kernel code, and we don't plan
on pursuing this at this time.

The panvk driver changes are, however, a better representation of the
intent behind this new uAPI, so please consider that as the reference
userspace. It is still very much also a work in progress.

 * patch 1 adds all the uAPI changes;
 * patch 2 implements the GROUP_CREATE ioctl changes necessary to expose
   the required objects to userspace;
 * patch 3 maps the doorbell pages, similarly to how the user I/O page is
   mapped;
 * patch 4 implements GROUP_KICK, which lets userspace request an
   inactive group to be scheduled on the GPU;
 * patches 5 & 6 implement XGS queues, a way for userspace to
   synchronise GPU queue progress with DRM syncobjs;
 * patches 7 & 8 add notification mechanisms for user & kernel to signal
   changes to native GPU syncobjs.

[1] https://lore.kernel.org/amd-gfx/CADnq5_N61q_o+5WYUZsZ=qu7VmeXTFHQSxLwTco05gLzHaiswA@mail.gmail.com/t/#m116a36a598d8fad1329e053974ad37a4dc0f28ed
[2] https://gitlab.freedesktop.org/larsivsi/mesa/-/commits/panvk-v10-usersubmit?ref_type=heads

Ketil Johnsen (7):
  drm/panthor: Add uAPI to submit from user space
  drm/panthor: Extend GROUP_CREATE for user submission
  drm/panthor: Map doorbell pages
  drm/panthor: Add GROUP_KICK ioctl
  drm/panthor: Factor out syncobj handling
  drm/panthor: Implement XGS queues
  drm/panthor: Add SYNC_UPDATE ioctl

Mihail Atanassov (1):
  drm/panthor: Add sync_update eventfd handling

 drivers/gpu/drm/panthor/Makefile          |   4 +-
 drivers/gpu/drm/panthor/panthor_device.c  |  66 ++-
 drivers/gpu/drm/panthor/panthor_device.h  |  35 +-
 drivers/gpu/drm/panthor/panthor_drv.c     | 233 +++++++-
 drivers/gpu/drm/panthor/panthor_fw.c      |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c   | 408 +++++++++-----
 drivers/gpu/drm/panthor/panthor_sched.h   |   8 +-
 drivers/gpu/drm/panthor/panthor_syncobj.c | 167 ++++++
 drivers/gpu/drm/panthor/panthor_syncobj.h |  27 +
 drivers/gpu/drm/panthor/panthor_xgs.c     | 638 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_xgs.h     |  42 ++
 include/uapi/drm/panthor_drm.h            | 243 +++++++-
 12 files changed, 1696 insertions(+), 177 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.h

-- 
2.45.0

