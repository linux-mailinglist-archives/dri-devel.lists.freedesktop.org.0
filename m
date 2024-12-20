Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349F39F90FF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C9510EF8D;
	Fri, 20 Dec 2024 11:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="mn8mEngE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mn8mEngE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E63F10EF8D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:14:41 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B2XBJrmWU8bIxrGpkrXx1pKZ3c+P56pyrQyPInxcX2xq7lx+jFQSqtycccAb/b2/Oxce9OnsV/AZOX9FrQP7j2RUEJe3pD5yFxdP0AyB06p1zbv7iyHntJ9PlLv9n8MlsE/FcBuz4hqKS4UoYpcNE7hvE9MIoQ/WPcfaQU1rOjJMcj1hL9dLcLY3QxqThiD532qDhqj1xlOzf0dRU8WYBl3v4gkv8jVhdYBC+KHtJVXcLiSnLzxQpEJGU/sgyvZ+BsiNYz4GHJdVwj1iXuQVIUb7NawoJhH58ilVmXt3ePD/Pl4RNVVFzpEjGLKws8lWY8bDTgf90uRgMBHosVCTtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16GpLqxoKB3HTvYN+VW6H4IId8cruRg58lGjUMdNFE4=;
 b=WPFGNwojvBibGwDXPBi61jIfO/CmXpxDfpzpHy5qi3GmO4l/rS5nY4xjT7yzVlt1xs6KJjycY9y5P2MucodGRgzQn7JQtLlRayBS/9uEDZ677Fzz3J0VqQ45NPG2HgL6nMuZoKkqPyeiEO+2dinhE5XHitx4ZOc4Xm1s9hND6qDk/6Hs6ivXJGikCABj6OkHV2JTphuMRxzbYL3siIRYYVu3t6fw8AJDn6lwzdRfsSK2zbHZQNfV61QMw+S4j0FkyqDM52Yq1dcQjPfGN34CZxeTheCDaf/eaHGD6qQQ6dn7BRMxnqhqZgQzbhBcvMdrIFWekKjICtH9sPPEFJCDYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16GpLqxoKB3HTvYN+VW6H4IId8cruRg58lGjUMdNFE4=;
 b=mn8mEngEW0DSFynPAgdjsO8a285jbSoo4eiLAsLmKWYzZXyC+uKjyA7J4PMyU2aFgi2f4xULyqCxSJTU7PCv5RHrO8DU4XL8wsphuHlytryPtP4iOK85tW79+9hD84RLX14uKNZzvGDh5rH8dHYqMLaShd9kO/Iqp1UU7XFvkqg=
Received: from DU7P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::15)
 by DB9PR08MB7397.eurprd08.prod.outlook.com (2603:10a6:10:36c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 11:14:37 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::38) by DU7P251CA0030.outlook.office365.com
 (2603:10a6:10:551::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Fri,
 20 Dec 2024 11:14:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via
 Frontend Transport; Fri, 20 Dec 2024 11:14:36 +0000
Received: ("Tessian outbound 050b604d5e06:v528");
 Fri, 20 Dec 2024 11:14:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84ddaf0c22021e75
X-TessianGatewayMetadata: POLgSlmOuHa1KiIYEX3B9BHLAPp6z/I0+iMXCq0Wf97WGW+U5ORf/Jb0FlytZWk+PvyZj/Fdb+DBw8cCFsWy0y0SCu2viNxUEQ3KgHJWPhzzpnhkKSR1vH/Tes9+u8NeBtrKHzQ6gXEnzPvA9O7x0UjIoUgloips6CmVLGEAC3k=
X-CR-MTA-TID: 64aa7808
Received: from L6e557e55313f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BCA50D2-579F-4830-ADD9-1AA2FA36C45B.1; 
 Fri, 20 Dec 2024 11:14:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L6e557e55313f.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Dec 2024 11:14:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEngplCW6+BMJ0Et0Gxx8pF5Z69J9Tt5Yg7JLYNQ9irUsCj805DlQxPnQrXkO4msNyU+pAqfrGnPm0ciLVBluAr/Ao+yW8tCV8744DGT38Zqt+fJ737KTPTZ0GQUWlOvk+2Ntv6dGfLYrwhyXInZo34Kgo5B3mBFSfo6lIRPw9QZ9CWTJDjYdydXG4TYf6m6PF1iibyPpiz9GUaChGgKyBHH1cIk1Z/kTX22XYOx81EaJ9iFskXiARCIWG1RA/uDIPzR5AQVUMB+w7G7nNMA3eBUkjrtvWKejC6lrRGJPd0ONMkKPPjG/WHNWEIn4EwcoJ0V1VLYHWyheELvi3czSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16GpLqxoKB3HTvYN+VW6H4IId8cruRg58lGjUMdNFE4=;
 b=NsaDdt4R1DTxbYtPJfPTruV7iQ6373iZAgxGlgsc+iDxN+XDhpFsAr1zs7FqM8CMsalv8mdp8d/JX6K3LZSBhHNrQGvmCtWnk+8gLQUXIQDR5j21keqn0fc5QP0s7ssY5/Uaw7s4xcqLAzpNK7HFmkJkEjuwJ5mAWc3hwBhyhHYiaYoVfui5wmeCoUU+zNuUCoZoXcEwTiTAgPJ3iBql+1YOYcACXBZZsKtCzXDVUt+qbxK836edoGR0VYODE6Fxqae9PpmuZPFOSUw/2V4uq0+HCskzlz64Ct6eEnd7PWknf3otT+pEG4GUshm/8o0/isQJKjrTQknkiiHF6SJnwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16GpLqxoKB3HTvYN+VW6H4IId8cruRg58lGjUMdNFE4=;
 b=mn8mEngEW0DSFynPAgdjsO8a285jbSoo4eiLAsLmKWYzZXyC+uKjyA7J4PMyU2aFgi2f4xULyqCxSJTU7PCv5RHrO8DU4XL8wsphuHlytryPtP4iOK85tW79+9hD84RLX14uKNZzvGDh5rH8dHYqMLaShd9kO/Iqp1UU7XFvkqg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 11:14:22 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 11:14:22 +0000
Message-ID: <2881a000-b758-444d-a259-3fd909028739@arm.com>
Date: Fri, 20 Dec 2024 11:14:21 +0000
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] drm/panthor: Expose size of driver internal BO's
 over fdinfo
To: Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Mart=C3=ADnez_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-2-adrian.larumbe@collabora.com>
 <2a7c5a0b-af3f-4f1c-8c77-ab6233afcc76@arm.com>
 <cf8ea27a-f7de-4518-afb1-61fcf5bbb981@arm.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <cf8ea27a-f7de-4518-afb1-61fcf5bbb981@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::16) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|DU0PR08MB8138:EE_|DU6PEPF0000A7E4:EE_|DB9PR08MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e5ac82-4434-4224-d70c-08dd20e77d57
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MGZRYk55M1N3cTQraVpKYVp3UnpMaU1pV2hicjRtSXVNRXVzdkV1N1oweHdo?=
 =?utf-8?B?MldJbzBERG1RUjdGcjc5dWo2ckNWVWxYZWorZTBNQkJxMHRjRmtGQ1FJTjlV?=
 =?utf-8?B?b3Z0c2pNMzRnTjNKb0lqMVNob0kyZm05QktLTEZGdkQ5VzFWMG5rbmsxcmth?=
 =?utf-8?B?Nk5oaWY3TXF3OVR2TkVjcmowRHJBM2VROGZsTkxKZmx1enpHaXd3T1dOd25D?=
 =?utf-8?B?S1dVb3h2bkJvR1Z6TGQ1SWltQVlNM0diWitjYUpqUFltTisyTHp0T2tvbFpP?=
 =?utf-8?B?d3B2c3NYb0E4clgxeDVWdEVFUGIzTklLYlVSZVhiOXdPSnNnK243L3U1SEg4?=
 =?utf-8?B?TExzeDl2QlhlYy9kcE9OOXIrVVU4NmcrU0tlcys3MFdDQTU1d3B2Mzhna0hu?=
 =?utf-8?B?a25RZENXS3diTDR1bW9FdFg3YXpxaFR3alp4VGQ2N0dKUit6TE82Q1EzLzR5?=
 =?utf-8?B?SFhDdFh4dHhvOUlScUErdVRLK2tiOVJ0TDk3ZUtORnUzKzFEeFNLejMreUpO?=
 =?utf-8?B?V21UanZIdnlCMEliU2UycHhaa00zWFBxVWxsZ1haNDhQaW9WWTZXODZpb0Fi?=
 =?utf-8?B?Q0JRVnh5a2lwSTN6RDBNaG9JOWZmNHk4Q1VmSVBSRXJ2RFM1cW5wUE5wSTBo?=
 =?utf-8?B?V3RHcmpQeVJGVEgxWmx6c0tLOWFnQnlhZis2eHVtNEpDeDhnNUtwMVNhdmlM?=
 =?utf-8?B?M1U0OER2QUJ1UmJDTE4xZWltRE1uYUQzVjAyU1A4OUI1c1o5NXMvc1Nxb2R5?=
 =?utf-8?B?bjU4TGU0Vk5FWEV1YmhiR3l1c095ZEp4b2s5YU9VWnlaSnE3VHNBVTdBL0N4?=
 =?utf-8?B?RDhSdjErWCs4V0RTRndiajE3NHUzOUlYRWV1VkVwZko5b0lSaFFUZzhPc0NN?=
 =?utf-8?B?V05FblRxRHZlY2ZGSmtpVHNUVThCdEsvQTRSSy9aY3ZvdFpjWWd0elY3bUpL?=
 =?utf-8?B?SGNEY1RHR0ZPV2V4bURxYksrWmNCekwrNDZCNGtpWGpRZmhCUDRnRWhPSmhT?=
 =?utf-8?B?VUtGdkdRV0pvVzRRUklSRTRPSUdwS2RBQkJERThjQUtSbWZHaHVMU3VKZUtr?=
 =?utf-8?B?cENnc0VOTGs4SFJwQUp4akVuQlh2Q0k4UWxLU3RSSzhONVB1NlVzYlRQVE1l?=
 =?utf-8?B?aHdoa3JaeUVadWlaREZPZjdWa0NGQzN1WEZadW9lcHNLaWRUUHBYMGJnTFJl?=
 =?utf-8?B?Rkc2RnNCZkF0bThhSVVDVDEvRFd5WE9RbjRveEh5eXVTZ3JDcEZyMnlLaWhW?=
 =?utf-8?B?OTdOd0JNeVVWa0ZGYi9zQ3NFRnhURm1JVURSRWtJOFBuV1FlMzhUcUhLaGRD?=
 =?utf-8?B?RVZidjR5bWJ1dXlzWkZTR09GMVU1S3RHODBmQmVPMjRkZmNoaFgxOEVabG9K?=
 =?utf-8?B?T1VsYURoRTZKZ3U4NFNocDl6TlFaM0x6R2srSUptU2MrRUdwbzd3Mm5Mc1Zu?=
 =?utf-8?B?TEtMOTRtei9rSllkQ0dmWndOV0pJQ2RnZ3dENUxRZy9hMlUweE9Ld1dqbVRX?=
 =?utf-8?B?NTBzMndhaXhpUndURXN5eCtYclNxK2x4M2R2NzBHNWdXdjdQZkxoblkrdGh3?=
 =?utf-8?B?WWtBR2pYSjh1UDBmblpueHJDdFZETklzNlBDNHhKRjBDSW1icnhxTXdhRFpO?=
 =?utf-8?B?MXNoWC9IdVNJODNNL0RWVm9jV0crbklQSFBEWXBEQ1EyYTc1UEgrdUdvS1N0?=
 =?utf-8?B?NmtTV1RVQWR6NTlHVFhpVDRoeVZob0NiYmErUGN3aVZnQlBheDhVMmZpUWti?=
 =?utf-8?B?Z2U5eUM4QnZGcW5TSW9IRnZPOC83Mkk4Z25Sb2kzSnZsODYrclhheDZPN0Zw?=
 =?utf-8?B?bm1jRUtESmZRVk56SXdPajdIbjM4QzhoZmVFbHdkVnAvQUZMOW1kNDNLbHNJ?=
 =?utf-8?Q?WPk8Yn54CDYqL?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: af6bd28e-e74c-4444-a33c-08dd20e774aa
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|35042699022|14060799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDVVdkdNWmR4UTdLZ0JmWFFvSWpVL0ZjWmVaYmV5dGtsRUZMTHZiRFVOd000?=
 =?utf-8?B?c0VQL0JGa3dSTFQ4Sis3MlUwQU4wNHhhYktaVklLQnk0cGdpZkRaa1RhbEd5?=
 =?utf-8?B?RlhaWi9FUHN5aUxXMXRzK2ZiR0FKenZxN1JZMjAzb29IMmUrQ1AydnI4ODg5?=
 =?utf-8?B?RTg2Y2ZzVnQvZVlMQ3ovekkyWXVVN0Rab1phVjBKR3dqeGFZRnpoQ3k4RDMw?=
 =?utf-8?B?WlBWa29LWmxmVDlBQU5rYzhiaEMrVlpERXlMLzFuWVdCVUlkMEc2bFRGTU9X?=
 =?utf-8?B?RXBqaERSaXlNU25CQjFlNGhYdG01OWdLQ2plaVhub0tteFhjc3hCVUoweG0y?=
 =?utf-8?B?QTJJbXp1SjVJbk1mZFpPZUx2dVJESytKUGE3OGlrZVR2YkR6WXlqSkkwNEJn?=
 =?utf-8?B?SWYzNUxQK3ZRcXF3M3FOZms2RmZNcm4vSC9ScnQ3YjJWa3NBTWxQSXNFYWwv?=
 =?utf-8?B?SDRRTHRjMXd2OWJJWEJzaklYeDhOTzJIU3BGRUV2bVJnTjM3UERXOVYrNkg0?=
 =?utf-8?B?TnhGYWdKTE1Bamd3UnloNXlkYmluejNsR3VRZVFyQkR5WHZtUUtNYk0zYk1z?=
 =?utf-8?B?YUVsSlEzcGwwS2I1YnZjTDhhREpXTzJHWGNpZHBiQi9vYVRjZC9wWG9WQWpB?=
 =?utf-8?B?MFlheU9OYTBYcDR6Wm1icXFlOGxwelpnanNrREg3L1lqSTF4MjNHK1dFQWtv?=
 =?utf-8?B?TlVTcE8yeXN6VEltbGVLOTRHVlI5cGZFbFdCNUFPSGFHRWZmcnpGVk5WL0tQ?=
 =?utf-8?B?b3pZZm51MGwyQUY3SVF4aFFLbXorV3hwd3dOVUdCbVRESjVTdE1aNFlGVk8w?=
 =?utf-8?B?bHNiOTJYVFpVdkdFdHovaGlOTnFZaUdHQis0amxsZkhKYWExcklxRGxLQ01o?=
 =?utf-8?B?UUVpOE13Mlp4SE5PSi92WWQ1ZVVTdThhdlE5cUZGaTdDWVg3NGl2WitOVUt0?=
 =?utf-8?B?UmtaY0pLQkNiMU4rSmkwaFdVa3U0eUZvOVltZHhqOXZBMnhISVlVQ0UzMkhC?=
 =?utf-8?B?T0svdzlCM1JtbVQ2RWxpMTZCYitPdW9ZR1VSYTlZd3dxLy9EekJjUm9RQXlU?=
 =?utf-8?B?T3djdkxSUFRDdWVzaXd0TkNGb2plS1hVajUvWndnam56OHV0UFFBYXljeWp0?=
 =?utf-8?B?TE0wRzVYVzZRaDJ4U1c5VHlrQlg1Nm9HeTNDYThaZXh4K0hnc0VqMDlKbC9F?=
 =?utf-8?B?Vlh2MnRNcXlCUkV0Z3ltQkJVVmJwTWdTMGwwbzQvUDF0cmtZaXEzaURBbzFF?=
 =?utf-8?B?QU9Ea1V2TjNVRGtONElCb2wvV2hBcGVSN3F5V3dBS1Q5ZUorWm9hWWxIYUhU?=
 =?utf-8?B?d2hhdHNZWHMxNll1ODB4WU1YaDNHN2xMTDVzOGc0cTY3b1RNTXdoOGxzODhi?=
 =?utf-8?B?VlR0MnZmY003SmxDVHcrTDFQSStQM0VxTGVGUzNqYktneTlSQkdhc3c0TndR?=
 =?utf-8?B?Q3IzN2JzSDdkbURkUVBabWhZYmx2Mm5CZFh1ZEVyaUh5ZVJzS2NCMXVSS3FG?=
 =?utf-8?B?dkxBclJOUm8vU1VYcmUxWUE4bFFrWWtCVWVtTVlFZHpWRlBqVnZWOHNabllj?=
 =?utf-8?B?NG5nMWY4am1yYzB5dmhPM1RxWnpIWGhUUUV3Y3FnTk11L1BMbXVIYVI5dFJ2?=
 =?utf-8?B?Q3lrSytNTVpyWkQ0NXJaY1lVMXVIdDFwVUhBUW9FYXVOMFZXMWdSL1Rydkcv?=
 =?utf-8?B?WlZvaFQ3TURZN21SbWs1Y09uWFYyODEzQTVwWjRPZmhqMkdZNjZQcFNCVy9i?=
 =?utf-8?B?M1dwZVVWeU54R3pkb1BpNzk4YVZpaU9wZDFFUjZtOENLcWx3eVFpcHdqWlZh?=
 =?utf-8?B?NGYzQnBxcnAvOGdQbkRwS3VMSjZpeXRlZlg2Z29aRzdpeVdEbVRGQ0NxczRP?=
 =?utf-8?B?YVIvZjE1dnhDY0tCR0ltNmZUc2FjYktpanpSZ29hc1M3OFl6TGlqbGlQUC9S?=
 =?utf-8?B?aHNhNk43a3kyMkhVTUprS0hlOXprTjIwakswZldyWFU4RHRsTFhyY1d1Rno3?=
 =?utf-8?Q?k6x9W+uXraNJXrspnwGrzwN/0WF7JQ=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(35042699022)(14060799003)(1800799024)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 11:14:36.8765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e5ac82-4434-4224-d70c-08dd20e77d57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7397
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



On 20/12/2024 11:08, Steven Price wrote:
> On 19/12/2024 16:30, Mihail Atanassov wrote:
>>
>>
>> On 18/12/2024 18:18, Adrián Martínez Larumbe wrote:
>>> From: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>
>>> This will display the sizes of kenrel BO's bound to an open file,
>>> which are
>>> otherwise not exposed to UM through a handle.
>>>
>>> The sizes recorded are as follows:
>>>    - Per group: suspend buffer, protm-suspend buffer, syncobjcs
>>>    - Per queue: ringbuffer, profiling slots, firmware interface
>>>    - For all heaps in all heap pools across all VM's bound to an open
>>> file,
>>>    record size of all heap chuks, and for each pool the gpu_context BO
>>> too.
>>>
>>> This does not record the size of FW regions, as these aren't bound to a
>>> specific open file and remain active through the whole life of the
>>> driver.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>>> ---
> 
> [...]
> 
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/
>>> panthor/panthor_mmu.c
>>> index c39e3eb1c15d..51f6e66df3f5 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -1941,6 +1941,41 @@ struct panthor_heap_pool
>>> *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
>>>        return pool;
>>>    }
>>>    +/**
>>> + * panthor_vm_heaps_size() - Calculate size of all heap chunks across
>>> all
>>> + * heaps over all the heap pools in a VM
>>> + * @pfile: File.
>>> + * @status: Memory status to be updated.
>>> + *
>>> + * Calculate all heap chunk sizes in all heap pools bound to a VM. If
>>> the VM
>>> + * is active, record the size as active as well.
>>> + */
>>> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct
>>> drm_memory_stats *status)
>>> +{
>>> +    struct panthor_vm *vm;
>>> +    unsigned long i;
>>> +
>>> +    if (!pfile->vms)
>>> +        return;
>>> +
>>> +    xa_for_each(&pfile->vms->xa, i, vm) {
>>> +        size_t size;
>>> +
>>> +        mutex_lock(&vm->heaps.lock);
>>
>> Use `scoped_guard` instead?
>>
>> #include <linux/cleanup.h>
>>
>> /* ... */
>>
>>      xa_for_each(...) {
>>          size_t size;
>>
>>          scoped_guard(mutex, &vm->heaps.lock) {
>>              if (!vm->heaps.pool)
>>                  continue;
>>
>>              size = panthor_heap_pool_size(vm->heaps.pool);
>>          }
>>          /* ... */
> 
> I don't believe this actually works. The implementation of scoped_guard
> uses a for() loop. So the "continue" will be applied to this (hidden)
> internal loop rather than the xa_for_each() loop intended.

Yikes, good call-out! I ought to have checked... I'll make a mental note 
of that limitation.

> 
> An alternative would be:
> 
> 	xa_for_each(&pfile->vms->xa, i, vm) {
> 		size_t size = 0;
> 
> 		mutex_lock(&vm->heaps.lock);
> 		if (vm->heaps.pool)
> 			size = panthor_heap_pool_size(vm->heaps.pool);
> 		mutex_unlock(&vm->heaps.lock);

Well then you can do a:

		scoped_guard(mutex)(&vm->heaps.lock) {
			if (vm->heaps.pool)
				size = panthor_heap_pool_size(vm->heaps.pool);
		}

		/* ;) */

> 
> 		status->resident += size;
> 		status->private += size;
> 		if (vm->as.id >= 0)
> 			status->active += size;
> 	}
> 
> (relying on size=0 being a no-op for the additions). Although I was
> personally also happy with the original - but perhaps that's just
> because I'm old and still feel anxious when I see scoped_guard() ;)
> 
> Steve
> 

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

