Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7856A72BEB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BDC10E88A;
	Thu, 27 Mar 2025 08:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="N/BZcZUg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N/BZcZUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4E510E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:57:39 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WVQwlD0u13O+nCDalIi1eByUG5eXO+2stAsHeSYkxWkp/vQ8VxXc2pk3rof4u3xljNct42NevrIR3zlJ9jhw36qGin3rFSpStEDrdTbdi555wR/oPuktejQnvzz0RwcZ5ZDSJP24xyFJ9mgz7GVSa7rMoDDcAZFMxTGJgkQKBc2g6ClOTFmfznxmWypavPqAlsG4OWWgIBjRFG9l4mgoR3e+OfaYA4AKS1MsIr2RsYpWoNrKSaUggR9ant2CG+HgZ76AaGV7bgzjkhCTjvFbWkdHiuuAJfopYlEkbDsk9Y719RSdnyS4NDyWJPayADknzzEDBrC205rDVeqKE7vNxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoqlolZywEM6FYMIqNOgs5PzUpIDgsPMw3ngTXKjUlo=;
 b=C/UNuBGjy2452Xaa9rZEQNivpRhtsI4rafRim4KtA8B6dBbYEy6PpBpSM2CK+S8KsXFHF/rGddH8efzA6RaYIprkUn3o/ybCiHQSb8mOfqiWqiTM+LnKQk6AXn1eOk2VHfrWVotc++exLX2IYCpb8RHFP9cFbRfQKL3xjZWlo1IY89FnWYHUoN4PbeH0s6SqHnkoRXquK63OgSBee8Hbkn+zkapfsBb623sB29NZYXKW2fu6Pd+xAGxlAET6osasXGCum1I/rs7zDyiXNgPB8S5xSVAPxgdc7VfWyGjGLK4adGDJzH2gmKnOcmCC+oGr562+J7VnlwL0kDOb8S1fcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoqlolZywEM6FYMIqNOgs5PzUpIDgsPMw3ngTXKjUlo=;
 b=N/BZcZUg+hZXEwg1AspSoIjA90GHAVYhhvA4EIZZdZgXPtsXUlUyzKvqlLnpDY7C+ajDRQen+WABTNVvjGJifBy9zDMDz5r9bSVNqTAfAZlnPS7XSGBFVAuwtncGo4203QmIEDl24xOKaIACTzTU8nrxT1sEXDY1S7nGuaIIEkU=
Received: from DUZPR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::13) by DU2PR08MB9992.eurprd08.prod.outlook.com
 (2603:10a6:10:490::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:57:33 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::c4) by DUZPR01CA0025.outlook.office365.com
 (2603:10a6:10:46b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Thu,
 27 Mar 2025 08:57:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 08:57:32 +0000
Received: ("Tessian outbound d933a9851b56:v604");
 Thu, 27 Mar 2025 08:57:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed96f20f337959e2
X-TessianGatewayMetadata: fH/LfhwbHsK334Y9j0M4bOlcAvcc7xKmM2+f9OWtcD78LU2cTBoCXewp2qVCfeBJ2KSvpFaTdsOoDo02sOeNuAU7CuAh989rL3wnFQChWBtBOYTmWcsCS20Zjs1OAQNM4IX77Rf4D1VhCu1C+HAhUCVCtvBvxB9BTksEw6RHums=
X-CR-MTA-TID: 64aa7808
Received: from La4adbf3633d0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83D52548-DEC9-4CC8-88CC-CDBD307CC691.1; 
 Thu, 27 Mar 2025 08:57:23 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La4adbf3633d0.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Mar 2025 08:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3hyHHJlDwaCxiFnxJmS7H2YYU5g6YoRuky0QScGorXHPKL7aBIRfvVCYpQ0LmsoVcVxzByktZNqgOqJHz3GEWnEUX8wCkfOX6hkFOdbZ90qpgbXTw7/OpQTgm9yVh0WG1rMgLrKO7o5lTQ17rUzVLHIh4moCU3VdqVEpAhn/ACfuOLV/ELhSQZ6vawyGZoFeLwevVITGtiDNmjOOgQg7UZ3X6rUF6pIrqXlIg8n9Dz45rnLbzoKpHR+0oAM/eDxKWkeS3YDzqWobDxXF4EtmPVAywaPr0w0q1lnFCt0yyExrs0dEIhgIHNxf8IQOFS/h/oznQTlMXMpMA6015T7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoqlolZywEM6FYMIqNOgs5PzUpIDgsPMw3ngTXKjUlo=;
 b=xrR8R0Z2y3Azpu0wzFAxPhbq8JnjiO4LUFiEBnQc3syV2iXEhyBPANmN8fN3bGAsl++q6a/0Lg9kEjsucORfLH8v8AcX5wwP5lhFgBjbaiI9qnKMM5K1eNqTO7a6YhqwELyFNQzHIUjrt6UI6Vuuh7FJoZR+NT++/ir8KnUQFPpOEhN6P96tV3rV0pbWs1Jh3ik+qDRTDhK4MZ5KyLmi4q4kQYBZKin29sj5qmYrBlF/Fp6nB7ZSrzx4R4gR8MTIZYufNo6qisQyGxcPm1LNWwKacdZv3IGUM1vYRLnMqrPTnl2lscgeclFfuHR/e7dxKwpF6LJQCFJgojnGi/0Exw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoqlolZywEM6FYMIqNOgs5PzUpIDgsPMw3ngTXKjUlo=;
 b=N/BZcZUg+hZXEwg1AspSoIjA90GHAVYhhvA4EIZZdZgXPtsXUlUyzKvqlLnpDY7C+ajDRQen+WABTNVvjGJifBy9zDMDz5r9bSVNqTAfAZlnPS7XSGBFVAuwtncGo4203QmIEDl24xOKaIACTzTU8nrxT1sEXDY1S7nGuaIIEkU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by VI0PR08MB11084.eurprd08.prod.outlook.com (2603:10a6:800:256::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 08:57:19 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:57:19 +0000
Message-ID: <967812d2-de2f-451d-93ff-8c9dc0ee10d0@arm.com>
Date: Thu, 27 Mar 2025 08:57:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 7/8] drm/panthor: Add suspend/resume handling for the
 performance counters
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-8-lukas.zapolskas@arm.com>
 <vyjob57q2najc3ybjlgje6s2q26cfpicbz4kskcwpxirovdeht@7ljrdy7udmag>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <vyjob57q2najc3ybjlgje6s2q26cfpicbz4kskcwpxirovdeht@7ljrdy7udmag>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0216.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::23) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|VI0PR08MB11084:EE_|DU6PEPF0000B61C:EE_|DU2PR08MB9992:EE_
X-MS-Office365-Filtering-Correlation-Id: 5862881a-8c34-4650-6a86-08dd6d0d6980
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dnNRSjNsR2VzTFRjUmoyNktmWGZXbi9TQmNDRmZsN2t1eDV1bjB2emdSZHMx?=
 =?utf-8?B?ZGN2SWhDVExWeXJsVURCSnR4TFJ3Z3pRU0xDS3VKTENJaFFBSTRTaFhhVlh2?=
 =?utf-8?B?Y3U0aUJmMHhKTHJnUTR1aVAwVjJGU0ZKTE9UNGF3UFVOV21YY21mdDlsdjlV?=
 =?utf-8?B?bGNCQmxXMTVPQkRRZDNwYXpHdVpKcVhuL1JOOEEzNnJXWEtaOUxVVDFPWnVU?=
 =?utf-8?B?WXk2VlpRNlQ5NlluRm9WeFhWTDk0bm0zVUNXRk5rTE9meDBWZ0MzMk81ajZT?=
 =?utf-8?B?bCs5S3BmdzJQY3c5SjFrMkNrTU9NMWltRVV6QlhvNUhXdlVNMjJYc1Q1dUVp?=
 =?utf-8?B?eVFJUDZoQnhNSW5GRmZ1UHFlRWd1VGJZN0hXVTZJN0JOK1RtSk5yMm9iRFhN?=
 =?utf-8?B?ZFMxNUp0eTZTZmNXbGhTcEkyZ0k5eXYrZWo1TGdWWjhVNHBRaWJtQWQ4cHRL?=
 =?utf-8?B?YkUzNkQ1azlXMjVPV3JIdFZVK2hNYzJYY1JMY280UG1KamM1bTdxbHFmbjFS?=
 =?utf-8?B?QkVKUE9mTzA2d0lpTUtUNUkyN3pjdk80MmovVGdjOEdHM1FBK0RqamFhTEJD?=
 =?utf-8?B?QnBWOTl5bG1GQis2Y0VNbzFmd1lLUHNqazdoWGhiMXNVZDQ1RnNrSEZLQWNB?=
 =?utf-8?B?TG52R1N4ZHVJSk5VemZ6N2o1U0J5VDFOT1FSNUI5WDI5Q3gydjMwWkd3ZnBU?=
 =?utf-8?B?TWdNN0ZSWmJLTm04VEF5K3RrK0JQb2VYT29KTTNLS3RnOHFhcmJ4Z3VPV0hB?=
 =?utf-8?B?QzRJaHJRMndZRVFWN2huMlI4U3dqenFrNUVXZ2tYdGhRQ3Fhb0RhNXU2QkRk?=
 =?utf-8?B?WFVkZXl2aXBhaG40L3ZKcHJabUY1TWNKOEV0TTMwbkpQMjJMd0dOSjJhaWhu?=
 =?utf-8?B?T29BQ1NBWjJzM3J0ZFl6djk5YXJEdG1NZm1NWis1RElvRkR5cWh4NXRENXQy?=
 =?utf-8?B?S3prSDYwV0VRK0l0b2hveVlVbVVvTHFzSGVaaGNOWnNZUkJJYkx5TGIyM0ZP?=
 =?utf-8?B?S095aTQzb2tlNDJRc0FFajQwRnlQS2J0SGFaeG9xNStGUEhXaWVZVStFckNj?=
 =?utf-8?B?MVVpcGw0Z1F3dHJsNEV0YXVzallETUcwYjBBN1NYRUtGbmtDdkxwWEtVSHZa?=
 =?utf-8?B?RXZiRnZqem8yRXJtWHVGN3hDa0FWSlFUcW02b21tZVFneXpCS3N0bjZlWldG?=
 =?utf-8?B?TXNKWTg5bDIyQnRsdnpjMWZ5L1FMZFNtMThuSGZURFRIM2VubEwzRW81UVBw?=
 =?utf-8?B?N0tWQW9qdTFrQmQySkpUa1JVLzNnb2k1M1FOVkRMTnZzV3V4SkRlTmJXWmVi?=
 =?utf-8?B?empEMHZJZDBNdkpBNGhWaDFJaHFjS200cTdhUHdxWC81Zys1Vm9JT2V6bzFQ?=
 =?utf-8?B?SFEwWjRxR2hZUUpaVmVzSUo2cGtpcHNySWI1ZnpLNXBhYmE0Y1U3bEVsMFUw?=
 =?utf-8?B?dUNKSEo2RUlFT0Y1VGFUdytWYm94dGdNTlVodGFRSndCcjFDWWhmVUcxRDZR?=
 =?utf-8?B?dDB2c21EcWQxNkYvRzRRcUFPQ3V1Q0p4TTNTbmJucTlRNFd2Q1FIQi9ESklH?=
 =?utf-8?B?WVlmd3VmRDNsSU9XUnRqUXpvcFNPMDVYZTRkN0N3bnFyS21SM0JQU09VbXFP?=
 =?utf-8?B?NU1kRk5oaXJHMjg2NlZrK1d5UTg2UFhsMDBHWW9Td2ZYN3UyNHlqZnhnN1lS?=
 =?utf-8?B?ZlhEQUVaOGU4QXdjc05aU0dQZmpHQ1BiY0dLYzh6TjdUWE9mVTZKSk12ZE03?=
 =?utf-8?B?ejB1SHl2NTZZck5pVTJZWHdwcGE1MnZqZXY4WE5teDRVbzBKMlNnY3p0Tkh4?=
 =?utf-8?B?cXo2Rk4vTkRDTDdrM3ZZZ3lGRHpQcURsQVFNSXp0ejRQb1BZU3dySGlKYVdW?=
 =?utf-8?Q?kmNo3Ook0QER5?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11084
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 365fe632-be5d-4ceb-acdf-08dd6d0d6158
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|35042699022|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2xoMXJnR3JERkI1RUZCV3N3aVVtZWM0TWNUWGk1N24xOWUwMUJIQ2NKdGZj?=
 =?utf-8?B?N01waGpSMzlxWXQ2R2U2cFF2OUtkanorZnlteW9kUk11akVRRkVzUXowRVQz?=
 =?utf-8?B?ZUEzSGJraWNqaVovUGV0dkNaN0YzWWRXeUgzMTVQRXRNREd4THZ1aVZZd3BU?=
 =?utf-8?B?clVMQWhQNWI0V3JWL3JwajlRajVTSWhSMWkyUzlLYS9NditBVWYyN1l4MUlH?=
 =?utf-8?B?L1ZyM0NMOG50R0VMY2hCazIvM0IrdldCNUVVMmZSRDdpYmNDM3BSS3VqYVIy?=
 =?utf-8?B?MlVOd3JxYlJ6cU9Kb3BkTS9XK3lkMHBpaklvNHpuWHdrbGppbXhFUXFLSmdY?=
 =?utf-8?B?NldUa0R5bnhXdmw0L1BFbS80Zmg3UUhwazlRU2s5YnZZVklVbjNWdkRrMzFk?=
 =?utf-8?B?d05SNkZHSG9DeUZKMDRvWmxKM0xOZDVsQzV2a3hYb3FYTVNrazlCc0pDM1pj?=
 =?utf-8?B?emZabEFCdTkyY255aEJoMUQwRmpZTXUzUjhXUkV4OHhFeS9tNFRwUi8rRHpV?=
 =?utf-8?B?STBHR0pGelh5YnlLNy80QzNoMTdUUFI4Tm1DME8zTGtlc2FyUGJIUkFhV1N6?=
 =?utf-8?B?N082VHcvTHZQN0FCM3NoMm9ZRy9SRXc5WjBlVjFHYVp6YjY3bzJrUjhBRXUy?=
 =?utf-8?B?aU04aGtKYUVDckdzTTJzQW9DU3ZvVG9jVHFVY0d5aEt2emhZSUtPQTZISGlp?=
 =?utf-8?B?WDBaWTlOSWlQL1JQekJLWjRrWnFCSlUrdUVQRFRuNEN4bkNPY1p1Z2ZvdFZQ?=
 =?utf-8?B?UlNNa3lBTHRPb3Y5bkp4eDBDSW9ZbjIraEEzZkpTbkhDd1pTc21OQUUxbDVE?=
 =?utf-8?B?WEpuOVdPS29sTnFkSDh1blFSZ1ZxY2p5Q0ZHMUFRSFlHWWRidGk2U1lId1BX?=
 =?utf-8?B?RWZmdmZiRVE5UmdoNzAvVGdSNkVBdC9xMTh3ZFU3Q0F3UGpFMXFsMFNwK2ZE?=
 =?utf-8?B?cjl5NFJWRW5tYnhaSkJuQ3o5cHZrZWVtOWhVNjJmMlA5L0czZkFZaTc5RjVW?=
 =?utf-8?B?bVZZRitNdlRKTW5qSC9PQVlZYjdjMXhLTU16UFIzQ09GcDFpTGpqWHFTSkZV?=
 =?utf-8?B?bU10d0JqZFBPUmVTT1JXYnRsVS9mcFhXeldVVGthaXMwbXBhZTZTUWR5KzlN?=
 =?utf-8?B?cHVlZnNyY2VHcDRQcHZLVXh6b3Z1VFkvMjYxcjM0NG4rMzJzTi9qNkg0cy9N?=
 =?utf-8?B?cXhMU1hJZXdYakc1N1FxSGJTdkRzUHE0Ti84dHUxQWlqbHdXWlY0RWtHM2Rh?=
 =?utf-8?B?OFBVTEV4SHNRenJFSWorQWdlTTlCQXRsSXE0czhudVRSU2pXRkNybkVVS0wy?=
 =?utf-8?B?bUJlU3pFVUVGeCtnbitqV2tJR3NVTlNRTUI0OU5kRXlvL1V1TlNTMGxhQ01l?=
 =?utf-8?B?eVNGbmpTVE95SzFFWUhlZmVDMElTTE9URmcvTVZzOTRrcFNsWGd4cVpFenJV?=
 =?utf-8?B?TDd1YWJ0NU51bVpFd3FzQjVoN2hacWZySFdtK2pvaUE0S2cyb3pkUjk1VXR3?=
 =?utf-8?B?NVVjVE1FczN5L2FUdVY4TWZjbk1MZmdQOTVreHZKSjF2dmdlQTNwQnRuaEM4?=
 =?utf-8?B?aTlDa0d5RXVQUWIvbnVYM0F3aGttcHhzcWU3bWhNem1iVTkvMFMwQjl2T2FH?=
 =?utf-8?B?RVhpdlpvQklEYnVPZXJwNnpLVHVzWFpheGpEY1dVNVpFT2Zva0NqQ2o0NEhy?=
 =?utf-8?B?RUlua2VSSDI2MjE2NXZ3MG4wOUlnaDFmbjFOZjkyL3UzNWRMbGRMZjJHZ200?=
 =?utf-8?B?dW1UeWk5OWtERzlWeTZ4THJqc0xmblhkdWZyaFJRMWtCMStLRDJUeXF3MnlD?=
 =?utf-8?B?Qmw4dkt1TWxqMDZYSHBITWF0dkFQOGdMNnplWHRrbVFQT1BkZ1UwL2tKS0lN?=
 =?utf-8?B?Z0ovRkRrSTFEamx3TW9mcWhWaTJuVFY1aTN1Qkl0WXRjeXdEbGJqdkRjZWpY?=
 =?utf-8?B?VGJDWnpQUlRPVzlOYm80czFXL1NsT1pOUklNcVI4NXRRZTN1TkVUVkdJbFZC?=
 =?utf-8?Q?Sa24SBLtt1nCpMiJcUcdMYp/z1gXF4=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(35042699022)(82310400026)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:57:32.8504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5862881a-8c34-4650-6a86-08dd6d0d6980
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9992
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



On 27/01/2025 20:06, Adrián Larumbe wrote:
> On 11.12.2024 16:50, Lukas Zapolskas wrote:
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_device.c |  3 +
>>   drivers/gpu/drm/panthor/panthor_perf.c   | 86 ++++++++++++++++++++++++
>>   drivers/gpu/drm/panthor/panthor_perf.h   |  2 +
>>   3 files changed, 91 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 1a81a436143b..69536fbdb5ef 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -475,6 +475,7 @@ int panthor_device_resume(struct device *dev)
>>   		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
>>   		if (!ret) {
>>   			panthor_sched_resume(ptdev);
>> +			panthor_perf_resume(ptdev);
>>   		} else {
>>   			panthor_mmu_suspend(ptdev);
>>   			panthor_gpu_suspend(ptdev);
>> @@ -543,6 +544,7 @@ int panthor_device_suspend(struct device *dev)
>>   	    drm_dev_enter(&ptdev->base, &cookie)) {
>>   		cancel_work_sync(&ptdev->reset.work);
>>   
>> +		panthor_perf_suspend(ptdev);
>>   		/* We prepare everything as if we were resetting the GPU.
>>   		 * The end of the reset will happen in the resume path though.
>>   		 */
>> @@ -561,6 +563,7 @@ int panthor_device_suspend(struct device *dev)
>>   			panthor_mmu_resume(ptdev);
>>   			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
>>   			panthor_sched_resume(ptdev);
>> +			panthor_perf_resume(ptdev);
>>   			drm_dev_exit(cookie);
>>   		}
>>   
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index d62d97c448da..727e66074eab 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -433,6 +433,17 @@ static void panthor_perf_em_zero(struct panthor_perf_enable_masks *em)
>>   		bitmap_zero(em->mask[i], PANTHOR_PERF_EM_BITS);
>>   }
>>   
>> +static bool panthor_perf_em_empty(const struct panthor_perf_enable_masks *const em)
>> +{
>> +	bool empty = true;
>> +	size_t i = 0;
>> +
>> +	for (i = DRM_PANTHOR_PERF_BLOCK_FW; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
>> +		empty &= bitmap_empty(em->mask[i], PANTHOR_PERF_EM_BITS);
>> +
>> +	return empty;
>> +}
>> +
>>   static void panthor_perf_destroy_em_kref(struct kref *em_kref)
>>   {
>>   	struct panthor_perf_enable_masks *em = container_of(em_kref, typeof(*em), refs);
>> @@ -1652,6 +1663,81 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
>>   	}
>>   }
>>   
>> +static int panthor_perf_sampler_resume(struct panthor_perf_sampler *sampler)
>> +{
>> +	int ret;
>> +
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		return 0;
>> +
>> +	if (!panthor_perf_em_empty(sampler->em)) {
>> +		guard(mutex)(&sampler->config_lock);
>> +		panthor_perf_fw_write_em(sampler, sampler->em);
>> +	}
> 
> Aren't panthor_perf_em_empty(sampler->em) and !atomic_read(&sampler->enabled_clients) functionally equivalent?
> 
Hadn't thought about that before, but it may be the case. It
makes a slight difference for adding a new session to the
sampler, where we need to keep track of both the
previous and the current mask, as well as removing a session,
where the order of operation becomes a little awkward if
we use them to mean the same thing.

The sampler's enable mask is seen as somewhat disposable
in the case of removing a session, since we cannot just
remove the counters requested by that session and be done
with it. This would lead to counters that are requested
by other sessions being deleted. So we zero out the
enable mask and then recreate it using all of the enable
masks from the other sessions.

>> +
>> +	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int panthor_perf_sampler_suspend(struct panthor_perf_sampler *sampler)
>> +{
>> +	int ret;
>> +
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		return 0;
>> +
>> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
>> + * @ptdev: Panthor device.
>> + *
>> + * Indicate to the performance counters that the system is suspending.
>> + *
>> + * This function must not be used to handle MCU power state transitions: just before MCU goes
>> + * from on to any inactive state, an automatic sample will be performed by the firmware, and
>> + * the performance counter firmware state will be restored on warm boot.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_suspend(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +
>> +	if (!perf)
>> +		return 0;
>> +
>> +	return panthor_perf_sampler_suspend(&perf->sampler);
>> +}
>> +
>> +/**
>> + * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
>> + * @ptdev: Panthor device.
>> + *
>> + * Indicate to the performance counters that the system has resumed. This must not be used
>> + * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
>> + * @panthor_perf_suspend.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_resume(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +
>> +	if (!perf)
>> +		return 0;
>> +
>> +	return panthor_perf_sampler_resume(&perf->sampler);
>> +}
>> +
>>   /**
>>    * panthor_perf_unplug - Terminate the performance counter subsystem.
>>    * @ptdev: Panthor device.
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index 3485e4a55e15..a22a511a0809 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -16,6 +16,8 @@ struct panthor_perf;
>>   void panthor_perf_info_init(struct panthor_device *ptdev);
>>   
>>   int panthor_perf_init(struct panthor_device *ptdev);
>> +int panthor_perf_suspend(struct panthor_device *ptdev);
>> +int panthor_perf_resume(struct panthor_device *ptdev);
>>   void panthor_perf_unplug(struct panthor_device *ptdev);
>>   
>>   int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> -- 
>> 2.25.1
> 
> Adrian Larumbe

