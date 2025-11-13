Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F46C598E5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 19:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853EE10E1F1;
	Thu, 13 Nov 2025 18:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="F9sCgoI1";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F9sCgoI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013057.outbound.protection.outlook.com
 [52.101.83.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C218110E1F1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 18:46:34 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MFjYmwqiowFQzcg2HuHsirZBwdXElqMC2y6m+aIOfMKBK0r44xi+J0UmwUZSENftt8uNSkiPQaSRWC1UkpjXqcl9/PK9NEZ7k73AHBDCk8XZSuIK1Q9UYHndhC1H1RLXEdJI4u5PVrKimJup2K7ENc42Wj04j3GacSkccioT0LlJk3kZPA5v9EnRYyKZPv+Ap9/1fRqbBdxuX1nxq5pH828Au/JrpJuKn1eVx0y6QxnnIgoRvyTkagkhdXq5tDrdCueQzMjQOug8T22Ne5h/OhvfBSqvlj/S0tLbkqBMZOY2VPBLIAgMj+wxX/d+Pq3qGyvw0r6KwF1CSgExRa3GRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib+m+kGzZ1pT1uhcnMzsat0gSzH3aEjQiJMwuSmiMrQ=;
 b=Rkkhh2VenF3xxZZlbmCScmVsUKpt7doLxwEzHcU6xfnMctAprkTWLjZQAn9iyKZUY/k689B/GK/hfDG5+90678VO0bKsWLy+yAWtd8r/QuomoZHGfX0Yt//P9PvOkWNoLQ0bkE3cQ48F5JItJPGZFRKEnF6QgqVHLMwCwCCm20tYBSjOCO2fj2FetuMA3BEgaTM6WhhGUEpoDWzp7ykdkcI8iP161ckoT7kgBGwBA5FIy/ljMN3gnwKNXlZUQ5zBLCo9tChfZM3guopjV0UZhFMOFwt0mipZEGCCGFdEDjuG0jHMjwA3qvbu9QtkGcv4kSOCoTD3kf1yHJWacfaxMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib+m+kGzZ1pT1uhcnMzsat0gSzH3aEjQiJMwuSmiMrQ=;
 b=F9sCgoI1odPWpdpZEfeSyKhmwet5nbSOzLxrMpIkmub6e17WaEIcODmYW4iriRuQoJmn9PGHfTknLH7rgQlp08EEbl36OsouLzvKYAV4NWjxklRPg6mCzO7+krFIurWzp5pVDD8iJv+tXTEEnhAutr76sm68tWd1jSVR9i6IafA=
Received: from AS9PR0301CA0060.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::18) by VE1PR08MB5680.eurprd08.prod.outlook.com
 (2603:10a6:800:1a6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 18:46:29 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:469:cafe::3f) by AS9PR0301CA0060.outlook.office365.com
 (2603:10a6:20b:469::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 18:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Thu, 13 Nov 2025 18:46:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVlA9gVS7fSVPP1TdwIk0rCY1BQGaDwPn0rr8CQzNxJ/b4mZXe4bK/TKNebE/RxfaTHD5QtAtbHDmvuFcd+Ib4xENIYgcACpplTQuB3LVv0gaZNu802KAIm42PtwSQbrRX238NXnE+2NFaA5HXebh85Jaqu+HS2hWbmuB4SIyi+p7uRUIShQaXOXz1ZqdRwhWyd2qfStG1tr6Jy0yKbXcS9Wl4/fSeb1OUpj6bUrcGwH6xIt8PWFYAOz6yIuE0uQsOmxUngzss1cWdI5hYfp9yzSR+V12iQPEbAB5N+ueYA+x/x7yor5Oro8DQWYy5uVgx/oPlNrVtM8AW2abZ6dZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib+m+kGzZ1pT1uhcnMzsat0gSzH3aEjQiJMwuSmiMrQ=;
 b=rBIRCfjQ+L8D/vF79hX4+GutWiguaCGj13KfKaHrWOpCM2UznA+eOQ2uzzaTBTHjREQvLO7MZpE34QV6RBYfm6FgQYfUQ29J80Y4IcCEFiAHqtgJLzFWu6PSYP9az3KeGUD3u+8bHR5Z1szJznwZlJBy5vA4cNj++xYauc8UOQW62c32YHsm7pQHDxcGOBQPf/gvxaGHpbchCc3mZb4LDTKioYCs8iMQ10hR/D6KYo43tlSFZ/+Y73pzso6CIxKZyIVckPwksrgHc2RPolyV547Jk2BBS8iArXpsN1pPJXWlQwpbVgKq0B8vXUpxfiRACQjfajNyD//m9NJLjVUBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib+m+kGzZ1pT1uhcnMzsat0gSzH3aEjQiJMwuSmiMrQ=;
 b=F9sCgoI1odPWpdpZEfeSyKhmwet5nbSOzLxrMpIkmub6e17WaEIcODmYW4iriRuQoJmn9PGHfTknLH7rgQlp08EEbl36OsouLzvKYAV4NWjxklRPg6mCzO7+krFIurWzp5pVDD8iJv+tXTEEnhAutr76sm68tWd1jSVR9i6IafA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by GVXPR08MB11663.eurprd08.prod.outlook.com (2603:10a6:150:325::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 18:45:48 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9275.015; Thu, 13 Nov 2025
 18:45:48 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH] drm/panthor: Avoid adding of kernel BOs to extobj list
Date: Thu, 13 Nov 2025 18:45:44 +0000
Message-Id: <20251113184544.1832461-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0275.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::10) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|GVXPR08MB11663:EE_|AMS0EPF000001A8:EE_|VE1PR08MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: da261d7c-c606-4560-8fe9-08de22e4f4aa
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?KxsHncNWtwY/0z2VKUk13a5aeXNOSDwnAoS8Bx8DC4wAzGlYtEbhGvujKzsp?=
 =?us-ascii?Q?e8S7hocvHGojdqWWkqM3soVN8kTddRGRjyxqUT5BvJxMDFuGu0fuwTcsChef?=
 =?us-ascii?Q?uyMIkYKo5A9SqwDO/1zPprIh3E0Vn26XM9GHzAw9WQhT0eSKMlx6AI+SQIGN?=
 =?us-ascii?Q?uciCsP6Hq74na7BloZ24ZygYb/aPMp1atJ9SKRf8M/YD3eq9+R85567p4abf?=
 =?us-ascii?Q?vrljJTHCeFg/8L/xAk6kU8PYqnFisD49YRJCKn2DovxPqcYBdXnUBs9V+Men?=
 =?us-ascii?Q?43d0wIaqhv8zGvHxocvUD1ZHYbCvpv5KAEAzBPkWId0r0T9vXRg3qu6Ofo3J?=
 =?us-ascii?Q?F7R+JqHaRPH7+QlKr3WsitQ5VJbEC8gB/brlEXwf0MIJsvLMU5WJlgTz+dMy?=
 =?us-ascii?Q?wm93xxNdr+kW0blTThbbmB/gpKKH+GA+pf0IN934xqjKSamSdJ3Z9wQRNwXT?=
 =?us-ascii?Q?bvaMdBWFEb5V7XSjzqLUFD6jj5+RmBOpGEDCgUFUMAL92yHmBVq4lWo3vAlc?=
 =?us-ascii?Q?YGuTt7UxNRk2F/qOMmxnBXdNrb3+bhRkFs5HF46tYcUDIjWVM2GQAHOS5Uny?=
 =?us-ascii?Q?JrbTC4rdfTwSmvezzOfXOoo5FbQQnZG9JA8fMNMi+Ski00kwTnv/oP9eZrwL?=
 =?us-ascii?Q?jTliHPkP5OCx0eRsdMFAxmFqtyWr1KTI+MlsP4tVrgwBtxCImQsVrN7SXfH1?=
 =?us-ascii?Q?/lQ+ExGTXRD820AtpDolgybnIceBcHHWO+xfCChU1cYA3Fv5rUx6qfWiky7U?=
 =?us-ascii?Q?8otdWasVMtt9po4UQqrhNFCbmvrAcTYecrFqHQKY3kVI5CqU7j0CYmC695qG?=
 =?us-ascii?Q?pp+2W3oGTUbhQypzJnF3G8/SVbo783YtVKCR1UmWd3d8aqYdV5Ug/bPKIkSN?=
 =?us-ascii?Q?JW1Wop88Uf2XycR/oSLGLkjgmcCWwbiVAk2UoyUpQft1WnLixmCzIsADNkxN?=
 =?us-ascii?Q?jgtj1NCpbIERtdeX2ifVC3dzTtBKWpWTzCPNwYXl9wStUi2MxMydalKnGgdL?=
 =?us-ascii?Q?HChnMHmeWI7Vga9YQEqJnVNxLI6pmPgCNzsOCpZLGivRpHy0aagI6NZAPd0Z?=
 =?us-ascii?Q?oc8Er6emO1w9t6URbsXRkBk10Ob4wZRHv0U6/xhPAnq9v72JGvMYamy5Zci6?=
 =?us-ascii?Q?Vdjt6niaPrIGoODP9vLMunqwmVX80lhoc+PgaBK2S+WUfmnJ5OsVzueD6qr+?=
 =?us-ascii?Q?50t8gQf2ziDojnTostdQma5sMAgoJzewILR3uOOJuK110w/mMqMu612TCS5K?=
 =?us-ascii?Q?LFGlmB35pdLqFFfpagZjl8R/T8lSF1PoXGuXCF79y3WAN9hPIqH2tLg31hJb?=
 =?us-ascii?Q?gDCA1Ar/IVrZmMfKCGee822A3dpqhd9yuW0jwswGp1glcptF0KARo5Tbwtfi?=
 =?us-ascii?Q?eCUMsWXdpLQ2M5s5yz5P6/U1smVDZUAEkusoZELxVL06SH/lm//owIm4tvlM?=
 =?us-ascii?Q?VUbraRW7/TooDC6VlkfecqzKNucEMkaG?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11663
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 317b6be3-2c09-45a1-e2d6-08de22e4dc7b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|376014|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Zm4QMrpbVZehsCPqUfRtIst0jGdpRQWAdH9mmPOw2+xiv7PYWPUmYf0cD+o?=
 =?us-ascii?Q?g9uj4t9HPWYS7mXVG/AKWkK46KhJ7DxaL/tHTGgEEhN6k33CENnnTvW4CjBn?=
 =?us-ascii?Q?/iRcFLMlv+pYpKmjBw57L3acIFD0ykJ5PU5kFlgXoTNuc42aXjExOxmphwhR?=
 =?us-ascii?Q?RpQnXfuiYdE9eruK7yPCBkLdv952WyM9byhKAI4Gp/0Sr1fGBYj+RAVmKuCu?=
 =?us-ascii?Q?UC+rX0uAZh68eR8iJwq2nv3iAYkLsJy80BEHD9EoyF9AqoAQtVN5eGE8MgNl?=
 =?us-ascii?Q?9KzXVTDJR4Dh04/uL2Q54KdqOTG6qeNe6AOroHQ4QswW1KQk6YX3OQPT0J+A?=
 =?us-ascii?Q?GLwOCe8CHkBLTB0IJJ2ti46Jm8cZq2YCwTuOSxJUxVWnGEFRlU/b1xKqMdMh?=
 =?us-ascii?Q?o9SWtu5Au+dQBleY98kb5YV2nseXss+Y1jX/lFCBY/ZzhhoJdyAKWlba7eMv?=
 =?us-ascii?Q?wzbLH1Ga0nKpnGOUAZVyaLPWcCnX3hOUiwRlrxoSDHqA71w6Eujy+w6TKnD7?=
 =?us-ascii?Q?nfxSqHDyE5rlfRS8jhcZyQ8txhcaaCxGP1hyI8kUhW0ZsoYhAzA1zB2JDjQt?=
 =?us-ascii?Q?gmWcI59oPpFrQbWxYZNkhZ/i2dVDnFPuRjovzmf3Aw3XhPi/0yE5Z2h3Lxfz?=
 =?us-ascii?Q?29NavpB0t3OZs0xQmpF/a0ISxszgFolcGtJ/Td6WQxrfazcauMFJftgWJvhE?=
 =?us-ascii?Q?XJKFLuT4gXG36vZeQ5PgkckX4pXRIXd9CTRcrItq3BIC+kC47Pw32DXrhjPg?=
 =?us-ascii?Q?MKoCBxwjtrg7zU/QmrkIDs1M0mRGvyAagnrK7twGmQGBeiORV94OuMht5he3?=
 =?us-ascii?Q?nlHObfopkf2k668kFRRU9duJb6msihDUlxrhUKlgfJ8INilnJnvIdQl+vlHJ?=
 =?us-ascii?Q?/qSzT62vpioVyrNHKZXY9lyVA3wFgv7Fu++aXGB03OHRzi4DzlCZVlkIr50N?=
 =?us-ascii?Q?4V0s9i2oQmjT9U6PActI5Ua/Pk0KNwcISApYUTArimCzaF+bmxocEsiz0SUI?=
 =?us-ascii?Q?h1R4PlBGboRxtESl7338xZM+S7F3sF57DMiF8/E2fjlvW+Xn8ejUVZruKHyI?=
 =?us-ascii?Q?Sma7iulVSq9QtHu6q0XBo1H35T6ai5JXQRyjct5YhBmGs++yzgyDkB5DdkHp?=
 =?us-ascii?Q?1TZvxelJ7RLrsoxvhREeZuicZeF03voYsTg/jz01o2Y3HBwUtt10rCOxjPEh?=
 =?us-ascii?Q?+gMGPKSmQvK2t6bJFcN6fcHYQ37ZocCf2vmbDQRH50eEIa24jDnv9oEuKXiS?=
 =?us-ascii?Q?xXCuF/8dhDAkjJl35HSyct0iSwfR93FtpioRlRsXrdx4ThKTW0z+2oYgPiKl?=
 =?us-ascii?Q?HLdoWxjA4WJPm9ZBwOGscSdkA4x5TfyMxjjsXSFJa/GUVTfpJMKv59i/xzwl?=
 =?us-ascii?Q?GyTwmxq9mVLqZ0ri2pDoEGT50p4T6HE9LPC0ib9qTvSCCAao9T6RC2iIDwxW?=
 =?us-ascii?Q?n3wLCGNu3S/uo4rXktgnDd5e/8JQV+aes8iX3JeyKBp4/U7JWO6V7sjv/mNG?=
 =?us-ascii?Q?U8Onr0xYEil46CtcnZu1IqbAhly4VJsebEVp+37Yot5DbCvfUmXNiH9pF5yO?=
 =?us-ascii?Q?D51r0zeot+h57+U5okY=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(376014)(1800799024)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:46:28.5047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da261d7c-c606-4560-8fe9-08de22e4f4aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5680
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

The kernel BOs unnecessarily got added to the external objects list
of drm_gpuvm, when mapping to GPU, which would have resulted in few
extra CPU cycles being spent at the time of job submission as
drm_exec_until_all_locked() loop iterates over all external objects.

Kernel BOs are private to a VM and so they share the dma_resv object of
the dummy GEM object created for a VM. Use of DRM_EXEC_IGNORE_DUPLICATES
flag ensured the recursive locking of the dummy GEM object was ignored.
Also no extra space got allocated to add fences to the dma_resv object
of dummy GEM object. So no other impact apart from few extra CPU cycles.

This commit sets the pointer to dma_resv object of GEM object of
kernel BOs before they are mapped to GPU, to prevent them from
being added to external objects list.

Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index f369cc3e2a5f..10d255cccc09 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -145,6 +145,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	bo = to_panthor_bo(&obj->base);
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
+	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
+	drm_gem_object_get(bo->exclusive_vm_root_gem);
+	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
 
 	if (vm == panthor_fw_vm(ptdev))
 		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
@@ -168,9 +171,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 		goto err_free_va;
 
 	kbo->vm = panthor_vm_get(vm);
-	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
-	drm_gem_object_get(bo->exclusive_vm_root_gem);
-	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
 	return kbo;
 
 err_free_va:
-- 
2.25.1

