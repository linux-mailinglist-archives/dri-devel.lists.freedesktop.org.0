Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E30A84491
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1310E117;
	Thu, 10 Apr 2025 13:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Ixojrhgw";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ixojrhgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2054.outbound.protection.outlook.com [40.107.104.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CE810EA25
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:21:20 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tAyV/VpQx1vLZ/5m6macv5stML25OGklZwj21m6Pl3CdsXaiN0e/pNAoXWLaaahh8rfESPrw9sgd4qI9rNC71wvWLG9CdeuMJd/o0ckXgahC7rb/XfyMdlopyzQ20Os6Q5rDZ8h1PF/sLNYnZDz64a5d341YnXiwkCUjoL62ufyjxzdo8NiDRLGtSElSNeCeyIKoyssVUmNYmk3+WI/Jk8YD9mv0TbpTnKeHhrzVgl8nBuOq/KEHHTtBFPCDFbs2/AGbAvmXy0N48fC3dU2AeG/qA1YjRkIy8sdj80+pHJsZb3JeqzpDWzXwkmCjP72LKh+4FLflgGlI4DTQH8QLzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q23B/bheZJWtXRLtVMYTBaN3MDcH2jtNdnPQmKwqLHU=;
 b=Kh74aQqouYh4yNGScXuEAP2Qo/H6wRopJzFuf5MygZIKbu0FwhwdJAp+o3bQ4n3hW8q/f/5YddwpvB8OXmTraidodaH+wU9xp4QAHldqTvn+x/X6Wh6sALvmjXlFE3J4iwlltjv6vb8emGXKKgsy3snPGM7avUkazEu4y4NWFERtuZrzpv7vQ6mHtr8JW9pVNsAWGVFBs7tzW84Dp1ar4HAHVP3e9vsXn4lf2nvPECavNPcJAPJE9Df1INh7HtRh6PzJo1Z9Ent625kSH14UruWWOiaghJeJrzw/PhW6QcjJWvD4k2I4k2BnQ01+Qx6x3svlm1QlJcSTnBd4mvS9NQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q23B/bheZJWtXRLtVMYTBaN3MDcH2jtNdnPQmKwqLHU=;
 b=IxojrhgwQU+m8B9di03cH+btfHghpIzNd/coG3biQxA3QBS2NQZ6GtY1k3Jg7HTmL0CvbJ0KXyk6lko2EjYscoK8r3KPGnHIb5ndi8gCYG7lLsyN8ms+1irPIZ6sTrn6/CtOG21XFZH71WqFZ8xtEceZ//4G9frBBQIVF8xKtfI=
Received: from DBBPR09CA0040.eurprd09.prod.outlook.com (2603:10a6:10:d4::28)
 by DU5PR08MB10822.eurprd08.prod.outlook.com (2603:10a6:10:529::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 13:21:14 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::53) by DBBPR09CA0040.outlook.office365.com
 (2603:10a6:10:d4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Thu,
 10 Apr 2025 13:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Thu, 10 Apr 2025 13:21:12 +0000
Received: ("Tessian outbound f9fef7c7dc50:v605");
 Thu, 10 Apr 2025 13:21:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28cedc2feb26c060
X-TessianGatewayMetadata: Zl/t4WJbABHbwSA6Yo2Nb1hZG6QPNwU22cSbG8OV+OZmpGGnGSQtaCxjm8nUTALmHQ04BXH4DNnGgkUad57i7bS6xhx7i1359GkDt6037b/7mHbe1pOjbx95wyBmKJcK3QcxLzelbEqwjh4cOL892f9yO7nTYYaWMqaUz2btiec=
X-CR-MTA-TID: 64aa7808
Received: from L179db3970da0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91C69F77-D902-4BBF-9B79-6AB8E584FE1B.1; 
 Thu, 10 Apr 2025 13:21:05 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L179db3970da0.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Apr 2025 13:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urAFwHCv9AhX4cowfW3haF1hf+VLemcYsxMFo6FDzHlHBjOHKDW3dOhKnMI8988MAQgU9lF021hVt2fGFyj3YOyqpSHKLaNmi8fGtw1iCcHQ8e+d9YAVRQE8GWyp0uI9P+Jh3S2MzZ8xKqJJlbCLU+tjvHdOvnCM3KSXXM/8TxkIGkv4lcDJ/wsechXVARkEeekf/jRstJ8J33mgmpG8J8m2fsqJ+D2weLhEsc1PFbNq9jA0pibImJwogRQzPfu3tQoQQYGQO5AktKodz4Na2cGgulkxNZvVkvS/09Y50Ey+TE3zKlGFZXPoh76+3JDIytiAf82/SufbfNf+2BNQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q23B/bheZJWtXRLtVMYTBaN3MDcH2jtNdnPQmKwqLHU=;
 b=DTrkxGDnC+ERBqvfOmPjW5RW1yOusb8irX92uXLSp/0guNGD5z0Xb1HtN0nT/AHuI93CLl8T5wDxqYuQ/G+b6EEgJ5yD1E69R/xLYf+P36CzVk0QtDYc8Y+yeys7Iix88jzR1FZ5YmYLHtWDH8L9UskwSHvHOuFKkA26282LwlYbVArlwoYj9BgzXuyHhzxuUsBw4/eYciEaSRCl921reZZuq/2GXujvCiXwsRZvbM5rdap++f2AG9JcyHfJR1lK3BgXPh5hF+ZQlbWBKEMZh7tGBbCfwlYwBooiiX2hhdkqVtV5AXRsHCEKUbPrr50JpRvh77F2UwsXVErd5tOaiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q23B/bheZJWtXRLtVMYTBaN3MDcH2jtNdnPQmKwqLHU=;
 b=IxojrhgwQU+m8B9di03cH+btfHghpIzNd/coG3biQxA3QBS2NQZ6GtY1k3Jg7HTmL0CvbJ0KXyk6lko2EjYscoK8r3KPGnHIb5ndi8gCYG7lLsyN8ms+1irPIZ6sTrn6/CtOG21XFZH71WqFZ8xtEceZ//4G9frBBQIVF8xKtfI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AM8PR08MB6595.eurprd08.prod.outlook.com
 (2603:10a6:20b:365::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 13:21:01 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 13:21:01 +0000
Message-ID: <a661ba42-9393-4070-9e52-dd19df2d6880@arm.com>
Date: Thu, 10 Apr 2025 14:20:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/panthor: Make getting GPU model name simple
 and extensible
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-6-karunika.choo@arm.com>
 <20250321090254.667a86cb@collabora.com>
In-Reply-To: <20250321090254.667a86cb@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AM8PR08MB6595:EE_|DB5PEPF00014B98:EE_|DU5PR08MB10822:EE_
X-MS-Office365-Filtering-Correlation-Id: f699fc00-b839-41f0-225c-08dd78329080
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bXlrTzJLSGF2YXhnajMzWWs3MjNBa3VORHMyYkxLQmFkc1NaMC93cWJoUXZI?=
 =?utf-8?B?eGJDR1pHUWlkYk5zNXEyaGFSc1FJRThiT25sNzE5REJNSFh2OUVITlZVY1Zr?=
 =?utf-8?B?b3lLOFNYdVAvVzBSYmxsa0htRzlBZmxVcCtxMkhJWXVzRGpjZFZlb0p2YkZQ?=
 =?utf-8?B?N0VGQ2dQMnltQ09xTWlTc2pkQVZiUTZZeldpQXV5dFNZWjVjODRDRlNlUStT?=
 =?utf-8?B?anBadnVXeERoTzlyWHJxNlNMNURQSm5ROXRYWFBxWCtsdW1sUVVsVWtwMlN0?=
 =?utf-8?B?aEhtamxxaFpVV3ZmUnh1K09pcnYrRlo4SWMrRFRyODRJVnRxdldmZHR0WVZZ?=
 =?utf-8?B?ZHp3SG1yRCt4Q3BtOXBJTVlKaVB0dUhDbS8rZGx0Q0NLQ0hPbW5DM01SSDF3?=
 =?utf-8?B?dmFlRUF0MzZQL1B0N2lrRnZsV1NySysyWWVzcHlUenplVTVWWXNIOWF2Wmla?=
 =?utf-8?B?cXMyVlhxaFJnNjdweTZWMWVHM1hiSzVKa3ZHSHZSdjdoSkhiV0Vwbk5QeC92?=
 =?utf-8?B?d2JpaFVjUFBZK1FiRFNiL3VUY0ZEcy8vNXRnVUJRZE1sa3RsMnNPa0o2SW1N?=
 =?utf-8?B?NUZjOHZkdHNHWWJYc3R5blZFeFdPaVJQNXV2M1ZGcWpjNDdhZkNlanIwaUR5?=
 =?utf-8?B?OUc5dnNaNlAvcFJEZjN0YmkySHl6RTFNUE1yMVNXdmRlZ3ZwUGZQekprTVJ0?=
 =?utf-8?B?dnBMYk1OUlNYMU5aK210STJreUw5bjNxUG5ob3NCWFVrZGdJWXRoM0dpaEl6?=
 =?utf-8?B?VWxmREFxcThNT3oxSHdsQy9HWUVJRGdUVkQ5U3ZzeGpDNktja1dBVFk4alQz?=
 =?utf-8?B?YVN1T2pNY3RXVTZNTzZWY0FEZ2ZhU2tNbWFJQ0xhUzg1TUNzdU1Ucmhnd1Ax?=
 =?utf-8?B?VTZscFh1M2ZiOVptL3JOZ3JkZ1NTYmhyVXJQNmdYSUs1Q1I3elNudllWd3dP?=
 =?utf-8?B?Z3NHWTNWaUY3S2s3bVNWQVUvTEszU0lRZGNkWDNDODlCVXk0cEZ1OHhLakR6?=
 =?utf-8?B?WTNYbHVqSVJyQUUyOVlZVlNQREwwTlUrSGRLazllM0tLWnhvSENBZVJzc0Ey?=
 =?utf-8?B?REFpZ2FiTTdTaERLUWI2MmdxVWZUcmpNa1NBQ2dOanNPenNzNkg3VkJsQTM5?=
 =?utf-8?B?N28rWHkyME5JREZXS3FHNFlJMHBqNEgyMUM5ZCtWZEd3VHVFMGVab1FwK3RF?=
 =?utf-8?B?NTlBSmJsbDV2N1J5NXNjbjFyVEs2NVIrZVBXdWhtTUwxclRpNnNuREpPYVJN?=
 =?utf-8?B?NGc3WnVYMkZqWDVLZnB0ZXl1R1NXbWp6ZHUxSUhNb0dsUWpDTDd5VTg1MkpD?=
 =?utf-8?B?RVUwZS9memZzZis0MkNhdzMxbU1xR3M0OEkzNUV3elhKeEJyMUN0TjhvSENq?=
 =?utf-8?B?Vk8zeTRDQWxWaDM1Y2hHSlVBRkNQc1FaR3drVENmc0xua2ZBOG00bmdiTkR2?=
 =?utf-8?B?QThWMFVBRVhsZHdoRS8yeHdsNlJsNTAxb1ozOW5zVUNqYmlzSDAwdVRQeGZJ?=
 =?utf-8?B?UXd0ZW9JRTREd1dTTWF1QzlJc3FiYmpCSm85WnVYQmVZQjcwUHA4aloyVmxB?=
 =?utf-8?B?MmlZOWxuSU9ybE8vS0U3VkF5WlpnK2M4dnBSbGFSWkFkTnNGa2U3N1BGbDE2?=
 =?utf-8?B?RUNubEY4UWx2cUdNS1BkWEdXMktwVFZQTmRLMkc0V3gwRGNROXIrTEQ1WTVX?=
 =?utf-8?B?bk4xT0liNTJNb0JaYmUyMWs2RTVoZjgwOGlJNlFCMktiQk5qaVJVcHJFY0U1?=
 =?utf-8?B?NHVJVkpXU0ptaWxJRmx5dkl1cGVITkxLNHdrNjhETXJVWi9aSDN3eUZMVkk1?=
 =?utf-8?B?djVFQk5oWE1tSHRHb2QxSDQ1bjZyOXU4anZCS0pHdEw3eno1d3ppOXZWWTdP?=
 =?utf-8?B?NHgrL0UxTDBPZGxqakdLcUk1WE1SQ0g3T0k5aTY1U3dVRVFDYVR1U1dJMWgw?=
 =?utf-8?Q?eEnEWnpat18=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6595
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5bdbb536-db4c-4a3c-19a8-08dd783289cd
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|36860700013|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alVZMko0cUNCdEhUWHVKNkxmemZwOFFBUjIwdzM1WlBha0labXhnbWlDZGxw?=
 =?utf-8?B?Wm54eFkwNjFtbDIyY1FkcmI4VGdkMThaZ3ZuTENOZ0NTcnBEekwzRlc1WWYz?=
 =?utf-8?B?WFJPakNWMXB0ZTlEaU5CcXQrZVdEVGI3ZVY2NnZTU21CU1ZaaUNoMDRtWWdB?=
 =?utf-8?B?N1BQbWVFTnoxMkRxQy8yZitCN01kcG1RbGErUjJwdlByVjVqWFd6amdEbHFG?=
 =?utf-8?B?OTNQa2RoajFXa2tFRGl5MmJjSmVaYkVoK1B6QUtzeHBqQ2FaWEJjK0xVc0lU?=
 =?utf-8?B?SFJMUE9MZytmdFd6STlCZEtlNjR0aWtsVWtCeWNZaDlRUWI4UlBmTm5sNWt4?=
 =?utf-8?B?WkdkaHJnWkxsSnhOL1Fob0d2dEVNU0pkQWRtTDFMZmtYQzdSQ3BEK1FPNThj?=
 =?utf-8?B?enJ5YVREWElBcmg3aUNDQ1FRUnZwRVdiOW9pSEdReVYxSTZNcENxelhwS0R5?=
 =?utf-8?B?R25HUkJrZzNLOXZKbU5qTkFrK3ArTmhPMFlmaHo1MEZmV01DbVdoM0l1ZmFK?=
 =?utf-8?B?UW9EZGdHR3hRdGpiclJzVTlPTzM2Q1l1OWpCWXFkeU1XTGRicEdaOG1aSGg5?=
 =?utf-8?B?N1hzTzNzTTd2dUN0V2dyTmc2aUN5bUxCaElxbjJwaEhOcEVQUUYrQU5NdGdZ?=
 =?utf-8?B?c2xseFZmeVJBNFh3ZlM4bVFJaUV3alBJd3ZkNVdObXBiT25sejZ1RHF3VHNy?=
 =?utf-8?B?eFdwVDRDQjBqWDVrSGxjdjNuT3k0emJpZzdtYko2L2Z5R1pUeUU0clBWZ0ZP?=
 =?utf-8?B?b0liRjdFYzFsdE9YZUlrMkhVcC9ER1Nqd1o1QXBwZDFhdUZESklpZk5LZVRB?=
 =?utf-8?B?MlFPc21oZ0ZBQmV0QkVRVkIwRVR3RVB2KzJENGlTTGJmZnBYMkgvY2l2NHpX?=
 =?utf-8?B?S2lNV0RPdXVhVXRwRjFUTmUyenhYMy9kci9veEQ4VTNuNFNtc2Jlem5zZDFC?=
 =?utf-8?B?SmhFZHdoVGxrek5Ccy90UGpSVTJCQTJ2WmQvNUVaTU1UMThqN1d6ZE04NkVV?=
 =?utf-8?B?R1JYSkt5TnZhUWV0ZWhSZlpmeFNadXJqVXhrMXBEcXdtZDZIbldNbHhjSFlh?=
 =?utf-8?B?TkRjRzNoYlNnWGpDamszbGRLUCtsMjBZT3Ayc1FzNGJWbW5RVVcyaGo5ZnE4?=
 =?utf-8?B?QWZpTGt0NDJheEpGclNsRHdHc0RMYko0QUovaVZ0WTZwUm5aR3JqZGZzQ2lr?=
 =?utf-8?B?U3BWSk15UUJ5NUpkYTEvVk5BVnJWQ2VveWlnblp1QjVMWTB6aGIrVUxsc05K?=
 =?utf-8?B?Z005OHBWWlpEMk5aaHF4Z3FZOVE4Zkc3WGFGaWZKbGRLVGxFQ1g5Sjdza1VL?=
 =?utf-8?B?UFY0RHRNbklnQXNSTXBUZHlGYUE4NG5teFdZcWlyc2o5dTdJb3RFOU5GQXlB?=
 =?utf-8?B?STB2NWkvNlRSL3dLNW4zUDNhejFRelcwZ1NEK2piNHZSV2tSTG4ydEM0WHpR?=
 =?utf-8?B?ekpYaENPV3lXWnJqWFBLZTRqeE11UzJUTm40emVtbjY3ZFZHMDU5YXp3VzVz?=
 =?utf-8?B?blkzYlFTUU1TR0dnVXA3TEoybnBKbHZBVWxsRFdhcVNFV25ZZGROc0JBeExS?=
 =?utf-8?B?bnpOWHBPMEluQUNsYnpwRnJPTUthdUxiSFgwdTdyQmIyaEtHRTNqekpSeTIv?=
 =?utf-8?B?SmJFS0E2b0ZJdG16MUJGRVVaUFpZbllpa0hvdURhTENia1pUemhFOEVHZmpa?=
 =?utf-8?B?cnZLeG1RazhOb0lzZkV2SmNDRkZMQkpkUXJWQWI0TzA4TXloMVRzNFAwejRP?=
 =?utf-8?B?Um5qOG5ZZG1BdWttZ0RtYXFYOWJ5T3pRWkVRTVdMdm5QNXVzUnY4Sjhnc3Zv?=
 =?utf-8?B?Q0hpZnU3bW93MHNGMHBiRngrem11eTN2TkRMVXRHcG5qTStJa0lzNUgzMlYz?=
 =?utf-8?B?RWxqMTBOVFpkV293R0xJV25HWjMxR1piaGVpZDRSZ3V0RlVEVmtPbEpRNHpx?=
 =?utf-8?B?bmFNbnhUQkUrS0ROVHpvemNaY00xUUh5R29TSjdWVytScWpuNkxha003Q0lW?=
 =?utf-8?Q?0Fyx59yC/crqCOLAJP4/ApgJ9TBT3k=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(36860700013)(376014)(35042699022)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:21:12.4336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f699fc00-b839-41f0-225c-08dd78329080
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10822
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

On 21/03/2025 08:02, Boris Brezillon wrote:
> On Thu, 20 Mar 2025 11:17:37 +0000
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> This patch replaces the previous panthor_model structure with a simple
>> switch case based on the product_id, which is in the format of:
>>         ((arch_major << 24) | product_major)
>>
>> This not only simplifies the comparison, but also allows extending the
>> function to accommodate naming differences based on GPU features.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
>>  drivers/gpu/drm/panthor/panthor_regs.h |  1 +
>>  2 files changed, 18 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
>> index 4cc4b0d5382c..12183c04cd21 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
>> @@ -5,40 +5,6 @@
>>  #include "panthor_hw.h"
>>  #include "panthor_regs.h"
>>  
>> -/**
>> - * struct panthor_model - GPU model description
>> - */
>> -struct panthor_model {
>> -	/** @name: Model name. */
>> -	const char *name;
>> -
>> -	/** @arch_major: Major version number of architecture. */
>> -	u8 arch_major;
>> -
>> -	/** @product_major: Major version number of product. */
>> -	u8 product_major;
>> -};
>> -
>> -/**
>> - * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
>> - * by a combination of the major architecture version and the major product
>> - * version.
>> - * @_name: Name for the GPU model.
>> - * @_arch_major: Architecture major.
>> - * @_product_major: Product major.
>> - */
>> -#define GPU_MODEL(_name, _arch_major, _product_major) \
>> -{\
>> -	.name = __stringify(_name),				\
>> -	.arch_major = _arch_major,				\
>> -	.product_major = _product_major,			\
>> -}
>> -
>> -static const struct panthor_model gpu_models[] = {
>> -	GPU_MODEL(g610, 10, 7),
>> -	{},
>> -};
>> -
>>  static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
>>  {
>>  	unsigned int i;
>> @@ -66,29 +32,34 @@ static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
>>  	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
>>  }
>>  
>> +static char *get_gpu_model_name(struct panthor_device *ptdev)
>> +{
>> +	const u32 gpu_id = ptdev->gpu_info.gpu_id;
>> +	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
>> +						GPU_PROD_MAJOR(gpu_id));
>> +
>> +	switch (product_id) {
>> +	case GPU_PROD_ID_MAKE(10, 7):
>> +		return "Mali-G610";
>> +	}
> 
> I a big fan of these ever growing switch statements with nested
> conditionals. Could we instead add an optional ::get_variant() callback
> in panthor_model and have the following formatting:
> 
> 	"Mali-%s%s%s", model->name,
> 		       model->get_variant ? "-" : "",
> 		       model->get_variant ? model->get_variant() : ""
>

While that’s certainly an option, I wonder if it’s better to avoid
additional string formatting when it’s not strictly necessary. The
switch cases provide a straightforward GPU name without needing to
handle conditional "-" separators or similar.

Also, with the current approach, if a GPU is misconfigured with an
incorrect product_major for its core count, the switch’s fallthrough
helps ensure the correct name is still returned. A model->get_variant()
callback wouldn’t give us that same flexibility to adjust the name based
on such mismatches.

Kind regards,
Karunika Choo

>> +
>> +	return "(Unknown Mali GPU)";
>> +}
>> +
>>  static void panthor_gpu_init_info(struct panthor_device *ptdev)
>>  {
>> -	const struct panthor_model *model;
>> -	u32 arch_major, product_major;
>> +	const char *gpu_model_name = get_gpu_model_name(ptdev);
>>  	u32 major, minor, status;
>>  
>>  	ptdev->hw->ops.gpu_info_init(ptdev);
>>  
>> -	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
>> -	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
>>  	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
>>  	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
>>  	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
>>  
>> -	for (model = gpu_models; model->name; model++) {
>> -		if (model->arch_major == arch_major &&
>> -		    model->product_major == product_major)
>> -			break;
>> -	}
>> -
>>  	drm_info(&ptdev->base,
>> -		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
>> -		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
>> +		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
>> +		 gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
>>  		 major, minor, status);
>>  
>>  	drm_info(&ptdev->base,
>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
>> index ba452c1dd644..d9e0769d6f1a 100644
>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>> @@ -20,6 +20,7 @@
>>  #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
>>  
>>  #define GPU_ARCH_ID_MAKE(major, minor, rev)		(((major) << 16) | ((minor) << 8) | (rev))
>> +#define GPU_PROD_ID_MAKE(arch_major, prod_major)	(((arch_major) << 24) | (prod_major))
>>  
>>  #define GPU_L2_FEATURES					0x4
>>  #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
> 

