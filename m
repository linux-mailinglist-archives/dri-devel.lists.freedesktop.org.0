Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95160B28277
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 16:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE1A10E971;
	Fri, 15 Aug 2025 14:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="JrLG7bmT";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JrLG7bmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011022.outbound.protection.outlook.com
 [40.107.130.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E816910E970
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:54:17 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Xtz2zYSS06fOqCptm7bGbnKoQtgXiEPKpA77GhZh+6Q7gfHu5ghhEVL38O3zyiO+omj0lVlMcpFkyOrQiiN4Y7TcyLYgsIeQT/vI/bnctG6cZuq5/D/buXkY833iO+WLffAYNQM+4DFyrz8Ga+9YDCk+r7fw1YWHtnacFGx7FuwsBCozEJwc0IEHH9xE+5+v9u8lKHxnuidvpSTtZuT2KvrYrfzs7i7X0yjDVqkNi0hSEjDXUlwjz9BkX5HJeeXyUSSzrVbu0XeYNYclgHXZvSnhTRw1dxI7OmPxn/bxA/gJnapaqq6J1h7tb0Qvdw/4QYqCqhIIbP7TfStDRCjhtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvHvPThkAWxCO0pBvp1Tnu4XCHKmiPlae+LBbYQgLSQ=;
 b=uzo+v8Htvk/2KDAjtprobva8waQ82+gHCJK5D3DN/+YQppHFPOcJac3ANPZXMznVcHS/fpNxqk2hBPj2w5vDsL8sKdPkokLsVtif0lbuUFhn8Yp5dpP1UlLKQg8NOx9b05kZqMi2PcsVF7jK58cxTVu8bBW5dkepo0TQxT9K0pTHitKTP6JHZowUZeEGt3OTNJNUk5DqYgqJdkAQERTsOiwdqEK6FTIvsaC+5KzLlXBHIEa2BbGiAo87yiUnswlorpcOTkKAQ9ynufaZPk3ecMpaXdi2SqrveG6BgUV0WqUUKrfv1QGwWgAiHyeGNPmOSMYg1ejo+LI7T5eXoZROxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvHvPThkAWxCO0pBvp1Tnu4XCHKmiPlae+LBbYQgLSQ=;
 b=JrLG7bmTYs6c4FcJsGzREWAQARxffcPm/A0j32RWa3kDOqMVIbXIDIEKxqSP+aS5ZEQbFOlnTVqylBOzggpTIu8ibAAYMbvQ7L3/NqKlzKV7Nx8o/KtX6q9LYLLxYfWpRfAFCe6T5ishxpj04RiTU1SUpsCvpnLJJMcIyVmIERQ=
Received: from DU2PR04CA0311.eurprd04.prod.outlook.com (2603:10a6:10:2b5::16)
 by AS8PR08MB10152.eurprd08.prod.outlook.com (2603:10a6:20b:63e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 15 Aug
 2025 14:54:14 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::af) by DU2PR04CA0311.outlook.office365.com
 (2603:10a6:10:2b5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 14:54:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Fri, 15 Aug 2025 14:54:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLCgGoV5mQpIgcfd4paDW4d76G4haqwxUM1Es5KDWjorcLLQTtxDCv65yBuI9M2Y7PQieAq8RcZ24u2FTNbpQvPa+dbl+gyy36mOA9QjvCt8P7xpCNKwiIAdM0ytGGW9pq8oJQGcK+R+yEoNCNCM/RmAbFLijvtK0ZD/Iv7T/C9M/1Fah8noqqWLgeFxgGTuqZZjzi4fXI8aC/8kvy7IfD1ZlQ17Ofly1D+SgcAc7aS7kYLI5nDL/w8oCKRuvPHnqDcQVbZPmUEyTeercFmR6kFd+4WQSh2FVY8Pw/XBrtTTmcO44JdralrlqqXdMxN6fl4u1IqsmTnTuJeN1Y70xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvHvPThkAWxCO0pBvp1Tnu4XCHKmiPlae+LBbYQgLSQ=;
 b=Yxj8bL2nyumz70jeb8KM95DNSFWpdfp1ycTb2APfP0RE9g9hOVI9OuHD3uS5zK7GUKkaHzJUizFIRNx9GXrCxrjreRsi0IZvpDTENFzzVdEj1mLRU+KjmbNKh1jyefwQM2tsl2po0ckEOAxe8uDafFbQFgToVqD1WfmQNUyHD4ScSbkTKsrW2fVtXoB9TkwyEQtnXgk68n9zLYafgpEICDr2hpE7P2N5dRH/xStQl1iq1c9PnO152aI2shPFvTdfJM/oKaj/OfhIwcV61pNZkSWz11nSZEvKDpXxZ5gn+bCIEHLiPuz8s02r4yq8HfdRWrrhLQBf9lofDSlLT60iTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvHvPThkAWxCO0pBvp1Tnu4XCHKmiPlae+LBbYQgLSQ=;
 b=JrLG7bmTYs6c4FcJsGzREWAQARxffcPm/A0j32RWa3kDOqMVIbXIDIEKxqSP+aS5ZEQbFOlnTVqylBOzggpTIu8ibAAYMbvQ7L3/NqKlzKV7Nx8o/KtX6q9LYLLxYfWpRfAFCe6T5ishxpj04RiTU1SUpsCvpnLJJMcIyVmIERQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB11146.eurprd08.prod.outlook.com
 (2603:10a6:150:1f2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 14:53:42 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 14:53:42 +0000
Message-ID: <e8afaa94-1ba8-4a7b-8e3d-123d108c932a@arm.com>
Date: Fri, 15 Aug 2025 15:53:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Simplify mmu_hw_do_operation_locked
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>, nd@arm.com
References: <20250815134226.57703-1-steven.price@arm.com>
 <ee996a62-bcbf-4702-837e-85f93feb7240@arm.com>
 <7e495e8f-26a0-4a82-8888-b8f1e512ebef@arm.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <7e495e8f-26a0-4a82-8888-b8f1e512ebef@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB11146:EE_|DU2PEPF00028D00:EE_|AS8PR08MB10152:EE_
X-MS-Office365-Filtering-Correlation-Id: 88df3592-a57a-4a83-3615-08dddc0b9a13
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WHByQnJJUWNyMmFCZzdWWUdxdkt4YUNyL09VY3BJUjEzTVErRjEwOENwVEtT?=
 =?utf-8?B?ZG0xTTJ3WGQrcVQwdEVIUy9VVU5zdG9HR0JwS2ZhOUZOVGlvZXJSb3dPQSt4?=
 =?utf-8?B?bVZ1TnhCTTNFOEk5SjhzVEFoSDQ4bHBvYXgxMXNDek1LaVpzRHZSOWdwVGY5?=
 =?utf-8?B?K0ZaR1d5TFV4KzBQOVVPS0o0Y2xEakF5Q05hR081UG85czV3MGI2YkdyV2hU?=
 =?utf-8?B?LzlMajRnaElhdHBIRm1ZdkhERlY2OEtkZnU5dXg2TVcrTjl5OTlYOFpLUnpC?=
 =?utf-8?B?RmRMWHZ1ZnZXZTZvVDdqdTZseDF1dTRncncrdUxFTklhTE9VanBGZUxneXRT?=
 =?utf-8?B?UGQ1NHYzb29hTExOZTFneWgzUUF1YXZwdkJhWmRhcytETjBuWkhFZTRnSjU0?=
 =?utf-8?B?UGJnNS9TOVlnOEtGdm0wTkRLZEN1RFZkMDFGU01YTDhyQVQrVHYrUHRjSCtX?=
 =?utf-8?B?WllOOVNidkZoT0tuQysxNTZVa0pCQm5TQTU5dDdleXlkbHpGcFJpZnk0WjYr?=
 =?utf-8?B?MHNkbnVOL0hDTEFqc0RXbWo3ZmRwaGljb09DbTRGZmt2Y0Nlang5YlJyeDAv?=
 =?utf-8?B?alVLclNUbk9KMlJ1cWRlSWt1UlhiTzIycWdFRDNlL3ZzWS80VkdwL3MrNGFD?=
 =?utf-8?B?ek5pSzFDWVNrN0pIZnBBeDR1T2NxdXdSdlZZeFhIc01zdkdMRVFiKzYyMi9J?=
 =?utf-8?B?RERvT3ZteXR5MUk1RCtxTkNnSEVuRVlYeS9QRDJNSURpdG9BanF5aHBHa2xt?=
 =?utf-8?B?SC9RUE1UYjdWTGVKWVQwRFB5VjI2d2p1MUNjcElyeGJvUEM0QTRmallZWkdE?=
 =?utf-8?B?Wk1INnZEaE9MVkZPR0M3clpjOTllSS9aYStpZ3NkOE5GK2xWaktLTGh2RGhr?=
 =?utf-8?B?WmptdlFkMnJuZ3Z0QjdqZjlOUk0wTE5wTFQ3bG82RE0vUVduVnBZUzlVYkJv?=
 =?utf-8?B?RTZTUzRSK0VqZnFqZzBYMEROQnQyV3VldWprdTFxdmcvOVRBaDJIdVVvSmhL?=
 =?utf-8?B?NnFjM0R6Wk9pMEdNSE9YYWJEc0Q3NkdIUCtFcnUyYVdNL1ZTeCtURUdleDJ1?=
 =?utf-8?B?RVhialUrSEpoR2xaa2wyZDgyK3lZdW9OeGp6Ujc3T3owclpTaVNkK3A5K3RV?=
 =?utf-8?B?T0pxOHdic3NrT2lkTk9qRWVnM0hOMjRtTDA4UEl0V3BoR0VkNlc2Vno3REFY?=
 =?utf-8?B?clcrdFY4cEZUN3Z6d3UvVUFndEd5TjA1S3ZyTkd5RFRUWTA4OWpyZEFwNmJa?=
 =?utf-8?B?NkptSUY5WVVHUlI4anYzL0tuYnlveklnZ1lISE9jQnUxWjJWN0NEQ05PaSs3?=
 =?utf-8?B?WWJ0aE80ZkxrVWp6d0sySzdaWWlyUGJqb21QOUh4STR1OVV2NlNxbjNyaWwy?=
 =?utf-8?B?QTVnZ0RiM2xUVmNGVTdOTDRwUHZGeU83SjFzSnk2Y01wdEFnZnNXUnIvTXJy?=
 =?utf-8?B?MWprTzhYWEs0a3k2N2c1ei9XQ2dtQ2oyV3ZZZGZRUXVRYldYWUJQMFJyaDZE?=
 =?utf-8?B?VCtNeUFhRzErWFBYZEdkMUhyNzU3NUgrMFBBRUhmVkc0WmJvYUREYlBtdTJZ?=
 =?utf-8?B?aENPVDhiOEtsZnpsN2dRWXFHa05HMXR5S1JtVXFpVnBoZ0lIeW5DTnZEbncx?=
 =?utf-8?B?R0NDRjdmZjFUd1A1RjlKL1p0SkJQZnRBSHVSTFdTV2hOWTVSR3J3ZzhCMWty?=
 =?utf-8?B?cTQwUjBZakhRMjZVVjAxSm1Zbmh4eXlReTZ4YUFmRVprRU5LRWM0WGtLTTJC?=
 =?utf-8?B?dlNSV2w4K0NHQXFtd0V1czlPVHdrbWh5OTVialMydXdzd2tJajFzN0ZsN1px?=
 =?utf-8?B?WGtOSGxUcHRCMHMrQWVVTzhHdGRKd3NMckJhSDVaVVl4ejN3OEtNa0FFb2ZC?=
 =?utf-8?B?b001ZEMwWjVnUTNHa2ppWmROc2F1RFZ6Sm80TTZXTU55bjMybWFjb0RxbWtW?=
 =?utf-8?Q?FPc2qozB/aE=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11146
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c8e9ca0e-1508-4113-cbb8-08dddc0b868c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|14060799003|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFRTZ20wTE81NnpDdWVRRThld0t5bE1zdEVMU2NlT0lLeHRwR1pscmxvWE1S?=
 =?utf-8?B?UTh3VjZ6Q2ZhUmgvZmdsSGNoalBRNDRMR0Q2K1hwM3FmWWMzLzZveVBjSnZM?=
 =?utf-8?B?Y20yTDZPZ3RHOWNIUHNUTkR1S3lUNFZiNTc5NFBoTzR5SnJiMllMc2FiL0ps?=
 =?utf-8?B?SkpKOUdiK21ud3YweVZMTnU4NnplT3BmU1dKTHduNWZXM0RrZGpnRFlxZnRr?=
 =?utf-8?B?eXNVY05uTWJNZ3Z5NG5DZFN4eFZMZFlYc3VLWmNnZWdtYi9XUGF3cTR3Sysx?=
 =?utf-8?B?OE9XcWMwK1N3S1NPR2tPWEh0Ti9TK0ZURGRxS3Jpa2g2TVlKUGZiRWRBUThM?=
 =?utf-8?B?NkV5ak9SNjExUjZqdUwyNlFHQUhEcmRWNUY4UWJhR3F4TmtzR2oxRzdaQmp5?=
 =?utf-8?B?YVVPTE1iN2FHYnZtYTBGSU1HM003SHZuZVNDU2cvZGFucXdCYWRMSXI3UTNx?=
 =?utf-8?B?ZThMS1Y2UklxLzNnVzJvU1dleVRwditYdGxTWjd0ZmNGWDhFQWlJUitaZkJ3?=
 =?utf-8?B?OGFHVzlqdm42amxHeXhsdjJLTDhzOHY5eDJ1alladS9YVkdBRlN1TU12OHhM?=
 =?utf-8?B?NUx3YW9iTlo3OUFDTDhDd3IwZXYxYnR2TW1zTnh6OExIS3lkM1VEWlFhall3?=
 =?utf-8?B?UEhZMFZ1TGx5RTBjSW9BWTQ5bmcxTDhiS1FNMDhrRG9WL0djZlcvV1VxczVk?=
 =?utf-8?B?cnhiZTlIVEJGM0JBOWVGb0dMb1FBUlFvd2c0YlJFbHlGZnFhc3lHWjV2QTl5?=
 =?utf-8?B?aHNQKzFXVGFXODB6dlZWNEVsSWo2R2RocWRRUEhYMklQTjJES29WemJVbThm?=
 =?utf-8?B?dHF6bUxyZGt5Q1dCL2NVZUJtSnc0YjlCbXZNK004c1FJdU95c3BZWjd6d3dz?=
 =?utf-8?B?c3Z1My84b2FOZVU2N2lQaldreVB1ZUhDYzQ4SU8vMFRKTkpRSGV5UzJvblZu?=
 =?utf-8?B?dVl3NmxWaStTTVNoUnUrejVqOXZWUGREdmFXbktXcFhQcmRRVjZhcEhwaFFl?=
 =?utf-8?B?SitEMWVZa1JSS0RQMGRpWnFoclNwMXl0djJQUjBGbmh5dEQ1NHF4YVVHdUky?=
 =?utf-8?B?d3N4RE80eXBjRDhyMGlOM012SzNkN2oyakk1ZVZFbzYxT01sYW5CNmMwTThy?=
 =?utf-8?B?UWlhMUdnL1pnSEM0bGcyT3V2dWQ4MS9LbW5udE5FZUJOa1gzbWU3V0JsWjNM?=
 =?utf-8?B?QnBrSHdtNHFkb0lqTGdiNUcrNXZxdGRIb1JBWTlOK0dGeW1kWjYvR0tNTlZw?=
 =?utf-8?B?SkVZd3A5eUtrS0JESktaRWovR3pnVHQ4MkNlcXM0YVkrTnVjSXA4VGcrbHQz?=
 =?utf-8?B?TEMzVDd4dmFYQUZtaUpQMndDbzlpS0ZXNklhYnlaMHVIQTRxSFJETFFrdGdv?=
 =?utf-8?B?NW9KaW5USkpwRFJHTE4rWnUyRVJqbVNzUElZZW1UY2Q3eEdqdGZHVDBZWldG?=
 =?utf-8?B?b214elQwNExYdXFBN2FMNXh3QkNDaERlNkhOaWd2eFdYbEtKWlowOVBUMVg0?=
 =?utf-8?B?RStQa0JrR3hSQzU1WTFTWkFyUnA4amUzOXRlc1d3MGhkd3dYdlFhcWdGSkx1?=
 =?utf-8?B?Y0o2NnVmMnhpWGloS2RBalQ2NlJqMmMzU0JZaG5QZllhUFY3cWdDUERWSmty?=
 =?utf-8?B?SnhIRGIvYXJYemtqMjJIQVVCdWo2R2ZyRnRVdTRDaVdWSkNNQzErSCthUGto?=
 =?utf-8?B?NDhRYTdqeFloRE9DbW9aOFdLZ01LZUVydnRhTE9IOEliNW1sYURKQnFmVTNl?=
 =?utf-8?B?VU0rT2ZFN3BCSysvZXhNT3B4UlN5TlBTWHJzMHFWVFArK3c5b2tmeVE3ckk3?=
 =?utf-8?B?bCtnSHI4MU1SNGhTUWJ0RHVYZU5sREdIZEpyWktOVXJac1JYeXkxK050TERS?=
 =?utf-8?B?cmU4RkdIc3B5TzJaYWt2S1N4VXNha2VZRy9ZL05VRUZDa3ZPYXBFcXlZNXFK?=
 =?utf-8?B?Y2VZNzRrMHhwOXhKcExiSUZyV2szUXpBdzBmZE9KY2loTWFxNFNkNzcwK294?=
 =?utf-8?B?V2xwOVFFWVBsSzAxcU9vUzJLU0k2cUdYV0dhR0lDYW5mK3BRSnRUZ2NHUEN4?=
 =?utf-8?Q?gnYXvv?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(14060799003)(376014)(36860700013)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 14:54:14.3101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88df3592-a57a-4a83-3615-08dddc0b9a13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10152
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

On 15/08/2025 15:10, Steven Price wrote:
> On 15/08/2025 15:01, Karunika Choo wrote:
>> On 15/08/2025 14:42, Steven Price wrote:
>>> The only callers to mmu_hw_do_operation_locked() pass an 'op' of either
>>> AS_COMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT. This means the code paths
>>> after that are dead. Removing those paths means the
>>> mmu_hw_do_flush_on_gpu_ctrl() function might has well be inlined.
>>>
>>> Simplify everything by having a switch statement for the type of 'op'
>>> (warning if we get an unexpected value) and removing the dead cases.
>>>
>>> Suggested-by: Daniel Stone <daniel@fooishbar.org>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes from v1:
>>>  * As well as removing dead code, inline mmu_hw_do_flush_on_gpu_ctrl
>>>
>>>  drivers/gpu/drm/panthor/panthor_mmu.c | 57 ++++++++++++---------------
>>>  1 file changed, 26 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> index 367c89aca558..9d77e7c16ed2 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -569,15 +569,37 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>>>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>>>  }
>>>  
>>> -static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
>>> -				       u32 op)
>>> +static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>>> +				      u64 iova, u64 size, u32 op)
>>>  {
>>>  	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
>>> -	u32 lsc_flush_op = 0;
>>> +	u32 lsc_flush_op;
>>>  	int ret;
>>>  
>>> -	if (op == AS_COMMAND_FLUSH_MEM)
>>> +	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
>>> +
>>> +	switch (op) {
>>> +	case AS_COMMAND_FLUSH_MEM:
>>>  		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
>>> +		break;
>>> +	case AS_COMMAND_FLUSH_PT:
>>> +		lsc_flush_op = 0;
>>> +		break;
>>> +	default:
>>> +		drm_WARN(&ptdev->base, 1, "Unexpected AS_COMMAND: %d", op);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (as_nr < 0)
>>> +		return 0;
>>> +
>>
>> Hi Steve,
>>
>> Thanks for pushing this patch. I was planning to address Daniel's
>> comment next week.
>>
>> One small nit, would it be better to move the (as_nr < 0) check just
>> after the lockdep_assert_held() (above the switch case)?
> 
> I'm not sure it makes much difference, but there was a minor reason for
> my ordering:
> 
> By having it after the switch statement then if someone adds a call with
> an invalid op value it will always fail (with a warning). Whereas if we
> move the (as_nr < 0) check earlier then there's a chance they won't
> notice if their testing doesn't trigger that case.
> 
> Obviously there might be a (theoretical) performance impact, but I don't
> think the one extra check would be noticeable - this isn't exactly a
> major fast path. Is there something else I've missed which would justify
> switching it around?
> 

Hi Steve,

Thanks for the explanation. I agree it would be better to have the
switch case first to check for an invalid op. LGTM.

Reviewed-by: Karunika Choo <karunika.choo@arm.com>

Kind regards,
Karunika

> Thanks,
> Steve
> 
>> Looks good to me otherwise.
>>
>> Kind regards,
>> Karunika
>>
>>> +	/*
>>> +	 * If the AS number is greater than zero, then we can be sure
>>> +	 * the device is up and running, so we don't need to explicitly
>>> +	 * power it up
>>> +	 */
>>> +
>>> +	lock_region(ptdev, as_nr, iova, size);
>>>  
>>>  	ret = wait_ready(ptdev, as_nr);
>>>  	if (ret)
>>> @@ -598,33 +620,6 @@ static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
>>>  	return wait_ready(ptdev, as_nr);
>>>  }
>>>  
>>> -static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>>> -				      u64 iova, u64 size, u32 op)
>>> -{
>>> -	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
>>> -
>>> -	if (as_nr < 0)
>>> -		return 0;
>>> -
>>> -	/*
>>> -	 * If the AS number is greater than zero, then we can be sure
>>> -	 * the device is up and running, so we don't need to explicitly
>>> -	 * power it up
>>> -	 */
>>> -
>>> -	if (op != AS_COMMAND_UNLOCK)
>>> -		lock_region(ptdev, as_nr, iova, size);
>>> -
>>> -	if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
>>> -		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
>>> -
>>> -	/* Run the MMU operation */
>>> -	write_cmd(ptdev, as_nr, op);
>>> -
>>> -	/* Wait for the flush to complete */
>>> -	return wait_ready(ptdev, as_nr);
>>> -}
>>> -
>>>  static int mmu_hw_do_operation(struct panthor_vm *vm,
>>>  			       u64 iova, u64 size, u32 op)
>>>  {
>>
> 

