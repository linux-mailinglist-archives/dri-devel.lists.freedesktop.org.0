Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A295BA361E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 12:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDD510E349;
	Fri, 26 Sep 2025 10:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="opsmIHmE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="opsmIHmE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A04F10E349
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 10:41:52 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jQfYZjT7pwFQ5WLB7BWOPYWmmUpNROvSLTE5W7xbYLa7V0oACD2dlXnVpK8pd0zKIgvE9aYlHO04uCRwFrZmkDgExfzHRoDEz8EBkC/QmtvQzZPK9bhtrW0g6PKD1oOsmJDrGLwPsT9oD+vb4+jfn+f+/QZqNgTq1y3j7VbjInhy27tBpPewF49dbWm4Gc/Vkf1SfzRKzHaI3cbCtDFV4o8jCG6UZ8NI8vNQFTJOdjNPIO+ynny5SRRWfV2d6QFnDDcqnsPfO4AMXnROJh+bjII68GV1pFmat67zwu8lA7jgOMKScK/HGCd7qjRiL+gB1hVNvvAARpDCUuXpDQ8Z+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k90SqVGyTdCNhk1hgTdv/YCjPdXKvjOasDlpm8eJYrY=;
 b=UlgiYqfpVKE28HrbBjpexOcyAqkHfEjh69LB8bYFmf9PN2Yo/qHIBgUIIQDgDX/Fe9OxvitHr7ntjjlF/sgz41XNCIHxb3FrIrtFrDh18CD3tyk8f5RoAg2D3rlU3sPxrG8txo8dtvP2Oho7p8+9tQt5iiGNzqQpCgfDbBTKP4J/RDeM5qTuMerHqySH0xZNuFZ70NW+pQEyi2pUXrwgU5BN9NJcU1NDh+DZKiPpeWVaEg5w3SjWxcz7bg3Gr49ABWlxWPbii0w11QFiYNyG+EPLzBjVF7/VPmrK3fCT8U+Wq0ZnX2tI6SypXC5UH24FrT6OTvT5I1LDte8z2dyoWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k90SqVGyTdCNhk1hgTdv/YCjPdXKvjOasDlpm8eJYrY=;
 b=opsmIHmEuxHvYqAo8gEpFFI24GvGsu/jlg5w5M0FFxULPRuWQIVzPcE8UsLhr3TME2gC6LQLYzBLUKRfFFXtUbiKgHP7g89DA2Ynsu9n+8X2osN3aW8eNyrswBYX6qlwFD2OgIj0qwUG+nit8H18qrNF3q/qnBSHadLrEEVfN2U=
Received: from CWLP123CA0219.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::20)
 by DU0PR08MB9605.eurprd08.prod.outlook.com (2603:10a6:10:44b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 10:41:47 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:400:19d:cafe::95) by CWLP123CA0219.outlook.office365.com
 (2603:10a6:400:19d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.11 via Frontend Transport; Fri,
 26 Sep 2025 10:41:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Fri, 26 Sep 2025 10:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6wkIscIUE+YdLjKYB8YW0JUTZgqvR0gq1U9xLukvIGIH2kLCbIwCvF3l8hScJbEyJE7ehfszwptqRKE8+jfwO2jMnmbjcsCj8/6oFI1B9MkpHnbZ+AyTV3+JlxJi/jHrsUlvaUoyk8Lx5Tbxa8Kgxgd7RkteX8Qbzd3n9BUOfl5zvVLBUhqUPgjKg7s98Qy3sRZL+s84DZ9HBurrCSdLQq3wFDkqF3TwE87QunqX1zoqTRIjU1Z3tyTrwDApFIeYijMLKFHO9IZGGtyMY3FKFAjSgH0sInWkvHEedZoW/1COHvv/r/GjYRkMVe0RVybZlzW872PXEfbL99v05hJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k90SqVGyTdCNhk1hgTdv/YCjPdXKvjOasDlpm8eJYrY=;
 b=O6VIeRwQ54KUEpJxPi8MCBJM/4hegWjRuqz/fpEG1wNoerFD+T9guDhrFIaykonoxHkmvNvc/zpIibzvyh6mnL6j142456snDWg8ZxdmSTR8D/ykSMqyPLGp0e2zw8hPkMO9zXj5iIxZGLdBincNUPU50sQTz9Z+rjg0Pybhm4k2kF6pHyjoG8J5zagogO5k2JTK1076JSsBa/4nDFtNqLBi5OMz9yjGTT9VuazXdlGYtvxazfwUqyBM99ztZTTzH0bpzN84V7PoeCIqxMChy3E1Iwbjsi/T/qxjA9ODkLLQEpbw/9yy/ruNzpHH2+cVz/9xROb17VSf7bw0nPBc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k90SqVGyTdCNhk1hgTdv/YCjPdXKvjOasDlpm8eJYrY=;
 b=opsmIHmEuxHvYqAo8gEpFFI24GvGsu/jlg5w5M0FFxULPRuWQIVzPcE8UsLhr3TME2gC6LQLYzBLUKRfFFXtUbiKgHP7g89DA2Ynsu9n+8X2osN3aW8eNyrswBYX6qlwFD2OgIj0qwUG+nit8H18qrNF3q/qnBSHadLrEEVfN2U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by AM7PR08MB5301.eurprd08.prod.outlook.com (2603:10a6:20b:dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 10:41:10 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 10:41:10 +0000
Message-ID: <cf530254-b5f2-44b6-b49e-9144898d75a7@arm.com>
Date: Fri, 26 Sep 2025 11:41:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: add query for calibrated timstamp info
Content-Language: en-GB
To: Chia-I Wu <olvaffe@gmail.com>
References: <20250916200751.3999354-1-olvaffe@gmail.com>
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 marcin.slusarz@arm.com
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <20250916200751.3999354-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0682.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::7) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|AM7PR08MB5301:EE_|AM3PEPF0000A78F:EE_|DU0PR08MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f0c241-ace3-4410-6723-08ddfce94a7b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?amEyTE1uLzZFQURoK3IwOWRkcUZSSUlkekd3S0ZJRWQ0Nk1oQmdJNUttdEU2?=
 =?utf-8?B?eFlWbTVlMnN6eFhpMndkaEVYWEROSTdhWVpmSVd2aDNRbEpGNzJ4bE0zR3ov?=
 =?utf-8?B?YTRZVjhGdll4VWFUT3FnVGloVGFodWtuaHlLSnoySmg5R0krUytiejZHK2xq?=
 =?utf-8?B?SzF5RjJVci9rcUptMTRoMnJ1QkRUa2MwRWRVbTBzTlFWYkNTeFNpQktpdEdC?=
 =?utf-8?B?Rmt2YjZPZkZaTWg2SW5ra0JnblVodnFUZFBEdk1HMElFNnZFUjRtOXRoQklU?=
 =?utf-8?B?UVY1STl6RUtPaVd2TStOOENqajNiNGd4bUNZZHExOHNISzNla3k5T3doQmJs?=
 =?utf-8?B?K3hTelVrWXF4TWljeS8ySUF0VkNrbXk4TTRvMUZkMXpJRzVWcXhUSUFoMVh3?=
 =?utf-8?B?ODlQNThJZU83U2oyekt4YXo4NmpNbWxMYnBRSlZYNXN2NTBWeWlrcTU2L0lp?=
 =?utf-8?B?SUoxZW9EbDJWSyt1ZVZsTS9iWWFWODJaTmQ3eEJVUXprMEtRTFlyMEVuK0lB?=
 =?utf-8?B?MTJDRnFZVjhlV2x2aWZmZ0hOM2dwb1pmekszVTQ5c1htR1ZOaFZHZFljRlVZ?=
 =?utf-8?B?NnBCaGF5V0cydzh5ak90ck8wM21nTzcvWnZldmFLSzUxWHNzN1Jab1g0cGlm?=
 =?utf-8?B?RngvWDhWdWRSQzVDckxiN1cyQmcwNm0rSXpRbmtQQVVtbWdpNTV5bVBDcElY?=
 =?utf-8?B?cFVmZitFTHd0L0FLejU0WHB0ZjViUWdXcHFna2dEZVJUQjhSS2gxUDZhamxF?=
 =?utf-8?B?YjdZbWhqbU5PM2Y3dTFGM2tYYmFSMUMrK1pTbzYvVS9Pd0JsdHd4OFAvamVF?=
 =?utf-8?B?d1haSkdlNVp4QXVUNUFkemExUi82aHVQREZkZGV5WjRzN1pqZG9VQVY5S2lS?=
 =?utf-8?B?bjJLcmtxZUxRRFZuU2FwSXFTSmliVTNKbVJUcENTUEtqclQvWjQ3NlhvVXlK?=
 =?utf-8?B?Q1kzUWN4bXBRbHRXUms3SmVSdkJ2aFFXV1dDRkxNa05FS01GV0JmZU5GTlF4?=
 =?utf-8?B?YmxUQlZNYStMb0s0d1FJY0g1c0FlUHhHN1N4c3cwNzZxejNjV3hzbk54WHlQ?=
 =?utf-8?B?QzV0N1hBaVFiNjAwNjdhRTMzb005bk5nSnBzQldrMzZTNDVCNjhaTGtBZXZJ?=
 =?utf-8?B?RytRdzZFNFo3a1FuVGVORU8wVHNUSk5IWGV3ZFpONzhvTU01c1I2dU1uQ0hJ?=
 =?utf-8?B?MkhpcEhDeWlialBVQ1dsbDRvZHp3Q1A2Q28wY1RUTFhTSXUrWDhDWFR5ZUdr?=
 =?utf-8?B?S0N3YnB6TzBEMVdZbGpOSHovb0ZmOEJJOHlwRVVHTTVSRndJZ3RtUnk4cTFM?=
 =?utf-8?B?YVhqSXN2Q1pxZm5HVE4vSldsVkR6V0Exd2Y5NDRydGJHdUNwTU95RTBUY1lX?=
 =?utf-8?B?RWJ1TFNzVXVjNi9adU5zV0hCd2ZKZkxTc2hpeDc3VkQ2QkZ2MFhIVCs0S2NI?=
 =?utf-8?B?azE2d1grdEVQdEo2OUFMd3hYYlI1QlBINFhBZExwT1IrNWlXQmpqV0FTWVQz?=
 =?utf-8?B?VEZjWHd0SzhmK25rZW1PVXJwY3N3TjFjV2doK3hsTGVHeUFBUjJlVnlWTWxU?=
 =?utf-8?B?a0pxRjBRdnIzSVVHdG1ia1JjSlFKSm12WXFXNEVvTXZ5YzZGWVdnL2FlYWhF?=
 =?utf-8?B?SkJVNWh5Q3dyNDFhbkNFOERwbmNnOGpLZ0FzVEdBeHJ0dzFNZ1ZkT3R3eVpF?=
 =?utf-8?B?eGxIUVBMSi9JRGFHRHNuSStTWWhVQXQzYWJ1aUtpTkF6L2dodVN4blFvWm5v?=
 =?utf-8?B?M3Jtckg0TFZ6Uk9vaXA4c0x3bWU5VUJTNllDQkoyaG1DbkF1WGM3cHEwdWhz?=
 =?utf-8?B?Q0UrQlg3VWlsVzBSaElxYjg5NXRUU3cySStIWkNFTXJDYjBFYUpiMk1VamNr?=
 =?utf-8?B?N25IQlNmd00zcy9sa1VtSTlnenJBNWxMUE5UbG52R2I2eDJ1bS9BanV5NXBs?=
 =?utf-8?Q?q0z0Cm13pIEhgcfidhIokp57nJk8oiH2?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5301
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e2476712-d106-409c-f952-08ddfce934b9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|35042699022|82310400026|36860700013|376014|7416014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTdEV2VhVGpPSkhCdGZFalZ5cGpqVmpjMWZyWjdZdU9idmdkZDgwMjh1bWJG?=
 =?utf-8?B?cmdNc2JIYjhVSnhXYWY2aTNoa3NzUlhtN0Q4Njk5eUpkUGdvbTVEbW1XcnJk?=
 =?utf-8?B?RUtEaWs4Tis5dXVSYXljSXlwdkpkeWJvUFAxK2lFNDBWZUFhZ3JmMjlTMkVl?=
 =?utf-8?B?S0dOVnhoazRSdWdST045SmVzZTJRd2pSdWdWcVM4Y05FYTNQWXNOUk9EaWIw?=
 =?utf-8?B?ejN2bGZnaVMwYXA2RzYyVGJBYlJ6NG5tL1hNU1lrZDhDMkRwYlVna0FLTHBS?=
 =?utf-8?B?NTFMYjlHWkkxREdzSVBvSDgzdXpUaDFZQmFYMUY3RTM2OGIzT3U1cFNKS1pp?=
 =?utf-8?B?OHhNZlM5UVArM0lsdFJVMXBRRDhFQ0xMSU5UYkRuWE5WSHczTTlORGpSVWRr?=
 =?utf-8?B?eDVNMXdZd2xqaTZMNzROWU9GcC9wYnl1RE1CTW1wbnJNcmhqNWF4TzNpSFFn?=
 =?utf-8?B?cDN4VFoxK2oyOHhhem1kb0NqSWpTeGRIdTNhelh3dXp3MDM4bVdEL2JSQU03?=
 =?utf-8?B?cUFMUjhkb1JlZkZYbERRZEhhd3JtZmwwUVhqRmd3QU5zT05FV3MvMVJVV3ZK?=
 =?utf-8?B?SUdRVTd3TDVGYXdKNjhjaVZsdXREUE5mcnUvQTM5TG81TEZEdVN4Sjkxemow?=
 =?utf-8?B?enZLUmJzWFgxMGlucjY0YThYT2Vyd1l4VEQ0eWo1OUNXTlM3MnFxNGpMdGJT?=
 =?utf-8?B?a2w1ZVpkVFhiS2hEWUwyOGlwQUJSdnNhZjBCRnlWakp1QlpIWFVZQm84dFA4?=
 =?utf-8?B?dXpiR1JEV0dBRjEyVjhuM3dWMEg4L2EvODJqVHA0RnlvdXVCSlR5NHBYMkVs?=
 =?utf-8?B?MFEwSFc3Y3lZcWJQYU1jQlJZZWpkKzRqd0ZsOHRIUks2ZTNsdm5NVHNFeDlW?=
 =?utf-8?B?M3pDRGlZYk54NWs1Y2lUSmZBUGFvWXlEYlI2UGdPVmNicVRqZVYwdGlnY0pD?=
 =?utf-8?B?eUt2UnUvR09sR1NCcHA3dExRSVFPRGg4UjJjRjVTN0dDWUoyMXlSZHpaYU1V?=
 =?utf-8?B?QXVMN0x6RXhCNUZFRTRLNTQ1VkNHYWVGbXlFTWhORW5hZ29LMUpDWEtSUFpo?=
 =?utf-8?B?cWFpWkhucmpFODJXQzcxRG9MMmRYU0xyWmlVMGNEbGRPNFc5S2tGaVBld29a?=
 =?utf-8?B?UThLZU9QVDhqMmNXUWEwTTdlUzcrYW5ZdzU4akgvV2ZoWE0xRFdFSTFhYUdl?=
 =?utf-8?B?K1I0cFRxd1Rld2FjMmFSOXRnTEg1SnorNTlFNml3eFdyWG52UktEVE1IdjlW?=
 =?utf-8?B?M3BZR2NxbjVGSWhqQU1nYklneTU3MGZrckNjeUlDVC96dDlKR0tKTEtVQ0pP?=
 =?utf-8?B?a1VuTXdQdzZqYTdkRklkR3YwcDUyY01WUHpTSXBvVVlDUEs5UWk3Q3FpUG1X?=
 =?utf-8?B?Mlp4RXhwSitpRDFCU3d5QUhWRFUyaXhVOE9DVnZGUkdUcXBLaDJpakNGYnl4?=
 =?utf-8?B?QVRpUjUxT0xQK05BSnd2Q1JzOHZ4NzlEYThvaWQwN1R3ZWNGM0RLN3ovZzRI?=
 =?utf-8?B?akgxQmg0a2FCTm9Ockt3ZXVROEEvUVJTUy9EblhSOCtYUEY1US9NbWhyeU5i?=
 =?utf-8?B?UUtjUjcxWUVhRmUrTmZBdDJjeTYwRldmeTB3S00zL3lUaFJKVFRHOWdpN0w4?=
 =?utf-8?B?eXZTQTUyOVlxcUJoa1pqT29LTFNMTkdoTDVPcElZd0NTdUpwNmVHYUlOWkNq?=
 =?utf-8?B?V1M2OHhKQ0ZtZXdBTDROWlhxNWl0cmxnb3VNNXh6QU9xNkczQ2RMVW5PaEds?=
 =?utf-8?B?Sjg0SGo4N0QyN0kxNzZYMTB6b0gvN1JEbDBRS1dGblRPYU5tbDBmdWlOT2di?=
 =?utf-8?B?cmFxWGxDL3JiT25NQUk2UnRwWU4wdUhkZy9STms5ZEx0OVNXQ0lhQ1dGRjh6?=
 =?utf-8?B?ZjFUQk5RVXUzVVB5ZHF0d2podEhjYWgrcmVNbG9NckdVejFFOUw0cjA5ZW9B?=
 =?utf-8?B?U0t0a21aVGd2K1VqWXkrNlBvRWl0eUdYZmV0TlUwMHd4T0pOMzR6OGJBTllT?=
 =?utf-8?B?OHIzSWFFTnBzV1VmVlFPd1dWaUJIVGlwN0hvWmJ0dEt3MUU4elpKWFhxSWFE?=
 =?utf-8?B?aUpieVdKUE45SmtFN3JBS3FubklhQVBjblJBNE1MZ0V1NEVVZDNFVnFUS2lx?=
 =?utf-8?Q?36io=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(36860700013)(376014)(7416014)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:41:46.2594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f0c241-ace3-4410-6723-08ddfce94a7b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9605
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

Hello Chia-I,

On 16/09/2025 21:07, Chia-I Wu wrote:
> DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO provides a way to query
> and calibrate CPU and GPU timestamps.
> 
> This is needed because CPU and GPU timestamps are captured separately.
> The implementation makes an effort to minimize the capture duration,
> which is crucial for calibration and not exactly feasible from
> userspace.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> 
> ---
> The query is inspired by xe's DRM_XE_DEVICE_QUERY_ENGINE_CYCLES and the
> naming is inspired by VK_KHR_calibrated_timestamps. The userspace change
> is https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37424.
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 88 ++++++++++++++++++++++++++-
>  include/uapi/drm/panthor_drm.h        | 31 ++++++++++
>  2 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index fdbe89ef7f43c..06da6dcf016ef 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -13,6 +13,7 @@
>  #include <linux/pagemap.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/sched/clock.h>
>  #include <linux/time64.h>
>  
>  #include <drm/drm_auth.h>
> @@ -172,6 +173,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_timestamp_info, current_timestamp), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_group_priorities_info, pad), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_calibrated_timestamp_info, gpu_timestamp), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> @@ -779,6 +781,74 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
>  	return 0;
>  }
>  
> +static int panthor_query_calibrated_timestamp_info(
> +	struct panthor_device *ptdev, const struct drm_panthor_calibrated_timestamp_info __user *in,
> +	u32 in_size, struct drm_panthor_calibrated_timestamp_info *out)
> +{
> +	/* cpu_clockid and pad take up the first 8 bytes */
> +	const u32 min_size = 8;
> +	u64 (*cpu_timestamp)(void);
> +	int ret;
> +
> +	if (in_size < min_size)
> +		return -EINVAL;
> +	if (!access_ok(in, min_size))
> +		return -EFAULT;
> +	ret = __get_user(out->cpu_clockid, &in->cpu_clockid);
> +	if (ret)
> +		return ret;
> +	ret = __get_user(out->pad, &in->pad);
> +	if (ret)
> +		return ret;
> +
> +	switch (out->cpu_clockid) {
> +	case CLOCK_MONOTONIC:
> +		cpu_timestamp = ktime_get_ns;
> +		break;
> +	case CLOCK_MONOTONIC_RAW:
> +		cpu_timestamp = ktime_get_raw_ns;
> +		break;
> +	case CLOCK_REALTIME:
> +		cpu_timestamp = ktime_get_real_ns;
> +		break;
> +	case CLOCK_BOOTTIME:
> +		cpu_timestamp = ktime_get_boottime_ns;
> +		break;
> +	case CLOCK_TAI:
> +		cpu_timestamp = ktime_get_clocktai_ns;
> +		break;

Out of interest, what is the use-case for the REALTIME, BOOTTIME and TAI clocks? Looking at 
VK_KHR_calibrated_timestamps, it seems that only MONOTONIC and MONOTONIC_RAW are exposed directly. 
I worry that providing the other clocks may make it easier for accidentally querying timestamps that 
can't be correlated with driver state. A recent Mesa change aligned PanVK Perfetto instrumentation on 
MONOTONIC_RAW [1], and the performance counter patches I've proposed also use MONOTONIC_RAW
as the only clock source. 

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (out->pad)
> +		return -EINVAL;
> +
> +	ret = panthor_device_resume_and_get(ptdev);
> +	if (ret)
> +		return ret;
> +
> +	do {
> +		const u32 hi = gpu_read(ptdev, GPU_TIMESTAMP + 4);
> +
> +		/* keep duration minimal */
> +		preempt_disable();
> +		out->duration = local_clock();
> +		out->cpu_timestamp = cpu_timestamp();
> +		out->gpu_timestamp = gpu_read(ptdev, GPU_TIMESTAMP);
> +		out->duration = local_clock() - out->duration;
> +		preempt_enable();
> +
> +		if (likely(hi == gpu_read(ptdev, GPU_TIMESTAMP + 4))) {
> +			out->gpu_timestamp |= (u64)hi << 32;
> +			break;
> +		}
> +	} while (true);
> +
> +	pm_runtime_put(ptdev->base.dev);
> +	return 0;
> +}
> +
>  static int group_priority_permit(struct drm_file *file,
>  				 u8 priority)
>  {
> @@ -815,6 +885,7 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  	struct drm_panthor_dev_query *args = data;
>  	struct drm_panthor_timestamp_info timestamp_info;
>  	struct drm_panthor_group_priorities_info priorities_info;
> +	struct drm_panthor_calibrated_timestamp_info calibrated_timestamp_info;
>  	int ret;
>  
>  	if (!args->pointer) {
> @@ -835,6 +906,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  			args->size = sizeof(priorities_info);
>  			return 0;
>  
> +		case DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO:
> +			args->size = sizeof(calibrated_timestamp_info);
> +			return 0;
> +
>  		default:
>  			return -EINVAL;
>  		}
> @@ -859,6 +934,16 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  		panthor_query_group_priorities_info(file, &priorities_info);
>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
>  
> +	case DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO: {
> +		ret = panthor_query_calibrated_timestamp_info(ptdev, u64_to_user_ptr(args->pointer),
> +							      args->size,
> +							      &calibrated_timestamp_info);
> +		if (ret)
> +			return ret;
> +
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, calibrated_timestamp_info);
> +	}
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1601,6 +1686,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
>   * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
>   * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
> + * - 1.6 - adds DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO query
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1614,7 +1700,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 5,
> +	.minor = 6,
>  
>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 467d365ed7ba7..7f3ff43f17952 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -243,6 +243,11 @@ enum drm_panthor_dev_query_type {
>  	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
>  	 */
>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO: Query calibrated
> +	 * timestamp information.
> +	 */
> +	DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO,
>  };
>  
>  /**
> @@ -402,6 +407,32 @@ struct drm_panthor_group_priorities_info {
>  	__u8 pad[3];
>  };
>  
> +/**
> + * struct drm_panthor_calibrated_timestamp_info - Calibrated timestamp information
> + *
> + * Structure grouping all queryable information relating to the calibrated timestamp.
> + */
> +struct drm_panthor_calibrated_timestamp_info {
> +	/** @clockid: The CPU clock id.
> +	 *
> +	 * Must be one of CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW,
> +	 * CLOCK_REALTIME, CLOCK_BOOTTIME, or CLOCK_TAI.
> +	 */
> +	__s32 cpu_clockid;
> +
> +	/** @pad: MBZ. */
> +	__u32 pad;
> +
> +	/** @duration: Duration for querying all timestamps in nanoseconds. */
> +	__u64 duration;
> +
> +	/** @cpu_timestamp: The current CPU timestamp in nanoseconds. */
> +	__u64 cpu_timestamp;
> +
> +	/** @gpu_timestamp: The current GPU timestamp in cycles. */
> +	__u64 gpu_timestamp;
> +};
> +
>  /**
>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>   */

Kind regards,
Lukas

[1]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34390

