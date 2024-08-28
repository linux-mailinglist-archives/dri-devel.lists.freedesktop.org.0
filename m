Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD58962887
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFF810E514;
	Wed, 28 Aug 2024 13:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="RK0/nzA4";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RK0/nzA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61E410E514
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:23:05 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aA8ovmC2ZP9vGKz5r821LQSCjlAZgDz9wIZPRzuUCzGk4zbPuzbjiBaxNrAybxdsz3+TfJ+Tanex5tfL5RHpt+itVSURfJ7MrHyenZz3uAG5UrM3WEHVDGVqiEdHrk326kRad1TmJAToJGIu12dfTFPmymuxcMPqQSyS+MBdltVrGeOjW2YOGTn3p81oZ9sLA2GjXc+qK5KqLhbYrEbqclK9TBTt7HCRx70tkzrzXeDWQdE6WTPxJr6Z9hx+8UC2pjL0Q5H1bq++7kCLxz5SQ8vm/E118taeqgOzo9Ds4vvR4FnwvH9A6aqVXW7gN6eVcBsTjdF6J5wy5x0QYV9w+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgOMqqaynwbgSO97g4BKzUdh7qh1xyW4QLAIYggOmKM=;
 b=mw0sV5Nqlp0omhGiwvL5CJb2XfyzojOUvSpL3Y3yQKcLxQ5gINJcwOqPUVwYAnil4J/TD/poHFv+0zhVM7Y4l4QvEfocQ5wiC40hvA4xjV1UwEMe4SejxQ7GwhrzwZvj0XvZ1I5hJjTeJlLUt1xlziGdvy6J8FYGy1TSVT5b8bEM42x6GlX+8EMZM3iRk8fyRkoy64vfWfJUGk4oPED2dcDx5m++fZt6vaGLFeDneTLHQJ0S+xPOZAT1WIGQIK7pR1LbHHUPIPk+Tni6Za5Of8hPmjB2wFOvYwyEDn0gHXxUoPQSTYt88D1ZLULxwhj7PqQosPFgxkURV3FYi38P4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgOMqqaynwbgSO97g4BKzUdh7qh1xyW4QLAIYggOmKM=;
 b=RK0/nzA4z0WXX0r3Y784DsD41rLrwQpFWB9RigIVzbbE3/kiwFT4tK661VWwlY0cypOh+k+p45aZqJIeZLC9VgC2J6OBTRhY/oWNSg5P0GNN8rUHrkRbVBfC79K2iXCqQALPp3mj6mTRFcxNxoGA+cDkbcCyjFC3k7NhYd0Te9Y=
Received: from DUZP191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::6) by
 PAVPR08MB8967.eurprd08.prod.outlook.com (2603:10a6:102:326::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.14; Wed, 28 Aug 2024 13:23:02 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::c1) by DUZP191CA0042.outlook.office365.com
 (2603:10a6:10:4f8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Wed, 28 Aug 2024 13:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7897.11
 via Frontend Transport; Wed, 28 Aug 2024 13:23:01 +0000
Received: ("Tessian outbound 97d928cc87dc:v403");
 Wed, 28 Aug 2024 13:23:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 47174cf006e24328
X-CR-MTA-TID: 64aa7808
Received: from L93978bdc4175.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E2FA7A6E-70E4-4502-A55C-A3F2016F9DA1.1; 
 Wed, 28 Aug 2024 13:22:55 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L93978bdc4175.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 13:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3DxtoCKxhssftsBI1GIju8c3CD/aog9TviLrVVDHJmD6XWjtT4mFpsBn0Nge+2whwLJgKOMr+TdPMbg2v5h/oczXNAl7Nd+uapWB9DL6M5cWk0hz/HFA3J5AGmQf8og/57ZIP2lA3JvePZLaqDgfsIqCS5LD4FJ/7k7H7NtNohzhhlGWlkcLTUo+U6nvIxS9kxbIbfFc9ZWBvIvd6GfNrJYRmqjZsyHolt0IS9REW5v+EtRatWrXuy8MfpQTrlCctKk3TYgjkqe8EO6Mt+c3WMmy7KFXy/wAac7gR+9vbj90VMePmRsoVKCjNtEJWULWN28uk0hFdjsCYhTZxVz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgOMqqaynwbgSO97g4BKzUdh7qh1xyW4QLAIYggOmKM=;
 b=dDewtPd62FTxLDTfRDFlTANW+SQG8sQRrICZ8VAWnt6bi92u4ujgITi1iWBe3TRnZCtVGxKuJLl9OqDP05ZzHQ9Kr2P2Vq0Fkub0B4UTgPuSUtAZTMW5DOml2JQduYbKdbLX1HOJI7BGzNlSHPFSV+/3S63zjoOGtIs1tmUcM97shsm7F9wo27J2Mf+APAuoU7+pIk/+Qpu/3PWkpveKMLdqebcj1jEJNCnew/CwLNCfRdQkaOXJAgIoTSLhe4hynZluGnMU1WJeRhIpRsjWAKclJ4Ipb0Te7a3t+etACr91kXvuk56GuyxYu6mKqMUQFjLelRNGoMXAHp3YoleQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgOMqqaynwbgSO97g4BKzUdh7qh1xyW4QLAIYggOmKM=;
 b=RK0/nzA4z0WXX0r3Y784DsD41rLrwQpFWB9RigIVzbbE3/kiwFT4tK661VWwlY0cypOh+k+p45aZqJIeZLC9VgC2J6OBTRhY/oWNSg5P0GNN8rUHrkRbVBfC79K2iXCqQALPp3mj6mTRFcxNxoGA+cDkbcCyjFC3k7NhYd0Te9Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PAXPR08MB7393.eurprd08.prod.outlook.com (2603:10a6:102:2bd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 13:22:52 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 13:22:52 +0000
Message-ID: <c38324e4-055f-44b5-beb4-6b3e6b860e69@arm.com>
Date: Wed, 28 Aug 2024 14:22:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Christopher Healy <healych@amazon.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, nd@arm.com
References: <20240807153553.142325-2-mary.guillemard@collabora.com>
 <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
 <20240828140929.5c602436@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20240828140929.5c602436@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0006.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::12) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PAXPR08MB7393:EE_|DB1PEPF000509EA:EE_|PAVPR08MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b948094-8308-41e9-35b8-08dcc7648aa3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SnJ5L0lyaVd3ZFpWd0pjeUNhN1lnOGNaWGFlS3Zjb1UxZmhFWS82eWU3enUv?=
 =?utf-8?B?L0Z4TnRIbXFRV3YrTmozdGx4cTFSaCs3c1FFNFZFL3FQVTZZL2pSR0EzK0lo?=
 =?utf-8?B?MXVmUE9CZG93Vkx1dVpOWmFucnIyMVFuTG9kbE5qa0dGa3JpTjFNZkkwNXho?=
 =?utf-8?B?SmxSbWF4RCtKMTZZUXhreDhLTy9DNG9jdlhnQXZURlZacDQ2R2tnYVEzRHZa?=
 =?utf-8?B?THNWN2dFdUY0bzF1UkM1ejdySVQwaDE1SnRYYjNkWmhFK3BJZStWaUExY0pm?=
 =?utf-8?B?VGV0a05iUFNTMkdYeDZBTG1PUTR5NmFnN2pKNVh0bUQxL2lYeWhEV0dvM0xK?=
 =?utf-8?B?R0w1di95NDVGeWV1OHFRY2trQlYxc3B2TnN1ZVI0dGpIVTdOL3ZOS2FIL1E1?=
 =?utf-8?B?cGZBd3BXR05vOXVKc3NwUGJ0aTZBMUVVbjdQWEhMZVd4Q2Uxa1k3Nms5Ykpq?=
 =?utf-8?B?SWVRbnRHS25TeGFTdnJ6RjVyRlBjUis3NnFoNytjeTByelpNbW1md3kxZlBW?=
 =?utf-8?B?VlByY0V3OGRrOFVzUWxyK2x6RFpYSU1sWFBkMXI1VDI2cG1IV0xVc0hkTUZx?=
 =?utf-8?B?Y1Rta3lxd0JKa2dBLzcvYnNEM0tFMmplRVR6dEN6cFovMnIrTHYvK0c0SlZw?=
 =?utf-8?B?K3dwSlBacXEzaWZFV3NaWGQ5RlZaKzFJY2tweE1Tc2Z3aWZCT0M1UGhGbnRK?=
 =?utf-8?B?MmpsQldXa1JyRWgwVDBpc1hDaVA2c2YycWx2NWRzSGVIcit2eUU0MVorTUxI?=
 =?utf-8?B?M1BWaytwdXRUamhKVGNRWnBqaWltdGlSQmNUdkJ1M0xNcEs1VkY3eG5JWGNs?=
 =?utf-8?B?V09NakZaMGpQQXBnS1RnUENaUy84Nm9RS3o3bFB2dmxCb3dtb2I1ZjlNSERE?=
 =?utf-8?B?REFaK2pQK3lhMFdMWWZWWGNoRGVMNW4zUlNNcWRRSTN1bjhhbzR6bEZpemNo?=
 =?utf-8?B?NGRkcmp5M2NxcDhLTC85UEZrbTlKdE9tSGoyU3I3RnFPYWtzMk14Z25ibFpV?=
 =?utf-8?B?Z0hHWGFVU1hYMXpOckdmUUNxSDFOWFRFR2g2L1J4aXVzNmpqU0gyWmNNbUkx?=
 =?utf-8?B?ajJabGZrb21qdktVZGZCL1RzL1kxQUxrc21UZFRFZFNldjdIMTFhRHk2empZ?=
 =?utf-8?B?TFpYSm9TYU9JQTNLSjRTbTRxZ3RwOS81WmR6UjRsTFdOUGIxQW5VUStmQXN5?=
 =?utf-8?B?UUVmWTRRTzNpU2c5YjVYMDVkMkdpSjV2c0lHTUJZZi9ybWp1NWU5d0xYRG1j?=
 =?utf-8?B?RkQ1UUUwaE9zWEZpRlRmejkycEVYYUtCb1BUS0VaMEgwVlVCNis2MlJ4WlFr?=
 =?utf-8?B?ZWVOR1Ivc0VGanVwRmFqOVMzU2JjUXFrM0g4dzZnZ2R1emV1TUhvY2xSdGkw?=
 =?utf-8?B?ZDB5NStyeCtLdU9mdHlMTlF1Q0V1bXNOTXFCQi9HNWhQQUs2VTY2VTVJeGto?=
 =?utf-8?B?Zk1DSWtkbGp6Rno1dXlLYUFBVjJIZjBVWkVRdWdoZGZuVDZHdlZqRkRGYmVn?=
 =?utf-8?B?dGpKOTh5WGxBVFJlNlBJRGUvMysrRmZ5MGhEdXgxTU9rb2NERjhRU2Mydnc4?=
 =?utf-8?B?blJnSElvZ0d3UEZFWFV5R2M2dEJSWXZIa2hheENxUVhXV0RWc3E4aUlIRUJE?=
 =?utf-8?B?eEdoMzhzamVhL05TSnZlQnlNUDBENTRXbnVFYXJ3ME51bU1LY0RONGZlaUh1?=
 =?utf-8?B?d0l1dVJ0S3NQNmpyK1RhQVNkaGliMmVGdWE3SU1uL204bUNzTzRzeUtTNDJJ?=
 =?utf-8?B?Y2RWemhicWFrUWFYMzFrLzhDQlJVZVFWTkp4ajhhSWlmbjl5M3VBaDRZcFJ4?=
 =?utf-8?B?YUloejlYakYvMTdEanRXZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 17e4c03a-0b96-422f-bc73-08dcc76484ec
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEdLemRJZHFYUlpKaG5aTFlPcWpVeGlWaHJyb2ZpbGxZa1lucEllK2dTVmty?=
 =?utf-8?B?NUEwYUVKbFcrZTE2Uk9LK0VUR2QvZ2o0TXpvK1RNOEdta1M2V2xYdlhiSm44?=
 =?utf-8?B?cWljMU53TE5HMmRVdkQ2KzU4K3NPRHFicGZCMlAxaUxZTXc0OWF2SEFDRi83?=
 =?utf-8?B?RjRLS1kwS3VpMlM1V2ZLcy9rOFRJTm5BVDZZeFpoNzM2Qzk4TXRQNmJFa0U2?=
 =?utf-8?B?bDRPUG42SUwyVFNVVnVHb2dmRnVNRDFGYWtiZ2FZSkIzQzA4eUdJVnpBdXpE?=
 =?utf-8?B?V0hidHRDRE84N25Ga1VPVC9JV0FqNWRsZVRINS9XbVFkNmkwdFZWN3FZV09w?=
 =?utf-8?B?NlkrWkg4aVprOUdZeEViWTdML1BEM0tFaTVCSE8xZGtmRHBBMmVVcGx6VmtV?=
 =?utf-8?B?VGdVOTliMHRMNWVTdlpEOVRUQjBRaTZBY2ZKeXhkY1pIVDBsT05rOGZwSEs5?=
 =?utf-8?B?aWdrTm1xck1tSmUxWk16ZUdiMXpJcERiVDhVMmNNT2hNQTdBWUJWWjJPaEc1?=
 =?utf-8?B?OW1ORnlRTWswZmd5RlZDVEkrRnp0TlBoandYWlZKSDNVcXdqYmhCcVRqODFj?=
 =?utf-8?B?TkpLTHBXYnpyL2p4OEgwUlRUQi9Lb2g3Qkt4RkYxb1E0SUdhZmpuL2JEakxj?=
 =?utf-8?B?OXR0YVQ2bEJNWktjaHZoTVNKQzNHMGhyUDhtSkdWbG5xblJIYTB2QmJ0Mmcz?=
 =?utf-8?B?MjRiQzYxWDJoK1duM21vU3g3TlhDeXdKc3p0NlpSOTZpeUJHQkFUd3ZVY0NE?=
 =?utf-8?B?azR4S3pUL1BoNDJRc01NTFpGWXAvYStDSmhaSGRXaG4zWktYL2lxVitiVnUz?=
 =?utf-8?B?aGplL1lTanZyYnAyUGNFNlZKam0za3BudHQ2RG4zNndOaVQ1L2hiSlJZM2Nn?=
 =?utf-8?B?U0w5U3hETDFDcGtvYzZvQWJJUTgwcW1XbTlpZ1cyVkloTlJ1NG55R3NWYXJB?=
 =?utf-8?B?K1p1L0NQMm4xajI3blljV1U0eFF2dzlWdVBTcHloOWgvSTk4bldUazNUS3RQ?=
 =?utf-8?B?eENqVWdxbEV1TTV2TU5ucGtRcVVXSkpqcmdqRWd5SDd0NklYZjI0bGhGUEpK?=
 =?utf-8?B?a01mWFBrYWsrZUQrZFRPc3R4NnIvZ2ljQVdYVytoQjVGTmRzVGpLUVFSdjM3?=
 =?utf-8?B?UTNkd2szdkdQemFmdCsySXFPdW91SzJYUzROeU9BaGdZMEwzdlBRY1RTZFI0?=
 =?utf-8?B?NlNQUXF3dSt6bU1rYjVLc0EwN0t0dUM4YWVUTGZjZ25SY0VNdkFqSWtOa0J6?=
 =?utf-8?B?MFl0WlJCbjZmZXY3RHFQcFkzbjY5REtGdDdVK0VHcEFNNEJpSzV1dzQyUkxi?=
 =?utf-8?B?QXpOVnBpdjc1K2hPK0VmMmEyUFB4UGlWUTZDaWlxY0pWdkQ0RnNnZjFSQTNY?=
 =?utf-8?B?WEJsWFJibk5mUEpMMjhzeWh4RkJ1VHVoWENFTUIzLy9Hd2F5TTZRc3hHdzYv?=
 =?utf-8?B?K0Q1bnZJcy9YdHlIeDNwTEEvb2I4QUcya0JHTWVwRUZBbnZUelkrc3UveFR2?=
 =?utf-8?B?b3lPV1JVMlJ1RllBNE91OEJpenhZTmVGU2ViT2pRR0xVeHZ6THRub1VpbmFC?=
 =?utf-8?B?WXBNNHpDWWhSSzFWWEplVGZMZ3JvamQrMnVkcmpNb3d1MjJJZGdnNExyN0NJ?=
 =?utf-8?B?b3M4alhpSlpmdFdsRzFSQmVyZThUSkhrbXpVQXVnWUJQQzZQYW5zbm1QOW1Q?=
 =?utf-8?B?UEMwUDc3dUFJQ3Fud0lqYjJhY3ZFVG5LNzRJSE8wbE13Q1h5c1NtY1RZV2ph?=
 =?utf-8?B?OFlUTTJvSUk1Z28xb3B5TitIclh5c0hIZDd2aXlrSlU0cktwMXpaWHhLd1dT?=
 =?utf-8?B?djVRcUxvQmlwYTZhVmpnZGhQZWlMWkVoT2hlQ0RSZ2dqUzBqRTl2cWtGVzZ5?=
 =?utf-8?B?T3g0WnI5dTNZaGZOOUtBUzk4bklQK1pSRnFtdUM0ZFFyUHhqcnk0RmpTaUcy?=
 =?utf-8?Q?IJyyed1u7RZomTYMFNUO4uT7w5LT+UIq?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(1800799024)(376014)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 13:23:01.5282 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b948094-8308-41e9-35b8-08dcc7648aa3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8967
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

Hi Boris,

On 28/08/2024 13:09, Boris Brezillon wrote:
> Hi Mihail,
> 
> On Thu, 8 Aug 2024 12:41:05 +0300
> Mihail Atanassov <mihail.atanassov@arm.com> wrote:
> 
>>>
>>> +/** + * struct drm_panthor_timestamp_info - Timestamp information +
>>> * + * Structure grouping all queryable information relating to the
>>> GPU timestamp. + */ +struct drm_panthor_timestamp_info { +	/**
>>> @timestamp_frequency: The frequency of the timestamp timer. */ +
>>> __u64 timestamp_frequency; + +	/** @current_timestamp: The current
>>> timestamp. */ +	__u64 current_timestamp;
>>
>> As it stands, this query has nothing to do with the actual GPU so
>> doesn't really belong here.
>>
>> It'd be more valuable, and can maybe give better calibration results
>> than querying the system timestamp separately in userspace, if you
>> reported all of:
>>    * the system timer value
>>    * the system timer frequency
>>    * the GPU timer value
>>    * the GPU timer frequency (because it _could_ be different in some
>> systems)
> 
> Duh, I wish this wasn't the case and all SoC vendors went for the
> arch-timer which guarantees the consistency of the timestamp on the GPU
> and CPU. But let's say this is a case we need to support, wouldn't it
> be more useful to do the CPU/GPU calibration kernel side (basically at
> init/resume time) and then expose the formula describing the
> relationship between those 2 things:
> 
> CPU_time = GPU_time * GPU_to_CPU_mul / GPU_to_CPU_div +
> 	   GPU_to_CPU_offset;
> 

TIMESTAMP_OFFSET should indeed be set by the kernel (on resume). But I 
don't think we need to post M/D+offset to userspace. The 2 Frequencies + 
the scalar offset are the raw sources, and userspace can work back from 
there.

>>    * the GPU timer offset
> 
> Assuming you're talking about the TIMESTAMP_OFFSET register, my
> understanding is that this offset should be set by the kernel driver to
> account for any disjoint caused by suspend/resume cycles, or any

That's the primary use, yes.

> design-specific offset between the arch-timer and the timer feeding the
> GPU timestamp block (hopefully the arch-timer is directly propagated to
> the GPU though). The timestamp read by the GPU/CPU already has this

Some platforms don't quite do that, so the two counts can drift away 
somewhat (both scalar and multiplicative differences). We've observed 
that re-calibrating the offset on resume has been sufficient to retain 
accuracy w.r.t. wall clock time, though.

> offset added, so I'm not sure I understand what's the value of exposing
> it to userspace. As long as the CPU/GPU timestamps are consistent,
> userspace probably doesn't care, but I might be missing something.

Functionally, there's no need for it. The timestamp offset could be 
negative, however, so userspace could see a jump back on the GPU 
timestamp (unlikely as it may be in practice beyond the first GPU 
start). In any case, userspace seeing a modified offset value could be a 
cue to re-calibrate its own view of the world. And what I mentioned in 
the adjacent thread -- if you want to test the quality of the GPU 
timestamp values from userspace, not knowing the offset applied makes it 
nigh impossible to do so.

> 
>>
>>> +}; + /** * struct drm_panthor_dev_query - Arguments passed to
>>> DRM_PANTHOR_IOCTL_DEV_QUERY */
>>>
>>> base-commit: f7f3ddb6e5c8dc7b621fd8c0903ea42190d67452
>>
> 

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

