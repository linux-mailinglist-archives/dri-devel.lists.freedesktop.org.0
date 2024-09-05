Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F12B96DF6C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 18:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F1E10E7C5;
	Thu,  5 Sep 2024 16:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Sy1yHoBp";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Sy1yHoBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E468C10E78B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 16:22:32 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jYQ8kJKVYZB2rYhYTVFDVXhFSVL19+dmmkl5NkAaZIcvPn+yBaXB/mEWTzqCbxyUmhNvCkdFO5FsY6rzKZFsggNyNyamokW0R9CfP/xdf9KGbWkuhWihaSryJV9lW5911niO48CHKx+oNbF91JZgckwaAB0Tx1a8HAzDs+ivu4WwRai6GcBhb8Ns6qn/y1pWxWAbyeYAg+ssl5pp1uC4EP/T4akdy3GhdEMfU6nlnV1mKUMtOpYgYmzJxY8Fm71MnyrlZJ66WNIkKcFCm7K0/reMIBoKZdo6UFOkPxzA8Se3tX/RLrLxdw2QbemWBv/pCKmgc8ZyVXdxX3/ApKEwYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RROHgrsRCaIdXSpoLC+Yi+hnQXFcWsOsAztcm5/p+N0=;
 b=vTJEaN5qweZ+96/6ECki45NKsK13dcVPXH1SkKys3KGL/pd6dmbf6zwGA7gPTbyWjPRPPX7XEK/BAJE3w+qQot5jyjacH38U9jYk8Rsoq56a+LxwX0l8BAsi5LyW3X7vCFNMFmwt0H0WeyxitXXCqspyyFoYKEmZ8R+7tHKqBwJO5bkNu6nXq46k818r4EsIF2griDYVKRD7MvJ+OUMI+N71atgb+brB/tqb9n8VnojHx5NgB6QZxFgUNszzbQVwLoWi7Z4aywh77iUyYkYuotqH3/9HMfpnof67rpfFRxogTd9p3kIxX5zlMq8W6s+QsnoZYH+LGBiaoDI8uzHybw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RROHgrsRCaIdXSpoLC+Yi+hnQXFcWsOsAztcm5/p+N0=;
 b=Sy1yHoBplZQM9BYiKVJrXfnHkse8E87UeqRZbdZXnJwSLfvbXiCNT8xZZotWehXbVxbgmh6cN6s4jympOpk9kQks0cN9/+MpUmq3U/NtHPx+K/L2wUjBwp+y51QsWyCn5NwZ1jCqxhKNI9gqgDpTRf0ZxLD7EU9VjtqmOb4HXdo=
Received: from AM0PR10CA0072.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::25)
 by PAXPR08MB7550.eurprd08.prod.outlook.com (2603:10a6:102:24d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.12; Thu, 5 Sep
 2024 16:22:26 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:208:15:cafe::86) by AM0PR10CA0072.outlook.office365.com
 (2603:10a6:208:15::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Thu, 5 Sep 2024 16:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 5 Sep 2024 16:22:26 +0000
Received: ("Tessian outbound 581e74bc26e5:v437");
 Thu, 05 Sep 2024 16:22:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f441a84709157ca
X-CR-MTA-TID: 64aa7808
Received: from L1340ad7ecd5b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9382E206-229B-464E-8AC8-CB322AD545F3.1; 
 Thu, 05 Sep 2024 16:22:16 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L1340ad7ecd5b.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Sep 2024 16:22:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEZwA8sgUp304igQ+O9P7crQfHlRXnuSOs9uupz3x7NTb94ODrqNmyxE3U3i4SHw6wQGs0kqImy/lGxGphdIyoKcTXoUOLumoDq7aLAvY7Xp9W//bruUmcDh96ejy6u1f/2PYiY7Y0ZKVqEsuxfeSj6TGgtUh10CFGlTT1Ft6kdSBZZy6R4ymOgHNTgzW0iL2evvAGkFx5iOz3qGAQ6S072CG0w3l9eq3/wRZxXSBN6DKc70oG6VseZ2BEEpiKrHdE9WyiIpgLS8G9oJjPs7fPWnIQQhXqTpyg+PCC1imjTwZiRPr2JTIPaQdmyUi9A5ITJJnmC/N/ftgqyU6qRuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RROHgrsRCaIdXSpoLC+Yi+hnQXFcWsOsAztcm5/p+N0=;
 b=IUtjXlVffYi3cD2+AIdp+qJhweZkZYQ7lSS9UvVWPYOtmR4YWtBQuQa0zYU7sz/p3MicV75i3mC/deXDhzbFvfaIE/l7QvYiFZTC44IBU+sn1PIZHNcQJro5gkUkK4nlfUO7vNgVcySatzc9Q1B03t6zRpOEYSOkf+Tu6ch+FyQmaVEgdkC63ELsLcy2V4Z5OTl/oMzBdOewUF2jEn0WcdpJz8Eue7LiZArZcqZEbBS9nCjoPhxtOWrWM7LUr5RDv7i61DKtILVzpDAdScfkvL7lefVwrNMWfpg+AcwdSCX2cln3sgzIaWySI714UEqzFFZPuvM8nUXczW69AL+YUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RROHgrsRCaIdXSpoLC+Yi+hnQXFcWsOsAztcm5/p+N0=;
 b=Sy1yHoBplZQM9BYiKVJrXfnHkse8E87UeqRZbdZXnJwSLfvbXiCNT8xZZotWehXbVxbgmh6cN6s4jympOpk9kQks0cN9/+MpUmq3U/NtHPx+K/L2wUjBwp+y51QsWyCn5NwZ1jCqxhKNI9gqgDpTRf0ZxLD7EU9VjtqmOb4HXdo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB8611.eurprd08.prod.outlook.com (2603:10a6:20b:563::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Thu, 5 Sep
 2024 16:22:12 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%4]) with mapi id 15.20.7939.010; Thu, 5 Sep 2024
 16:22:11 +0000
Message-ID: <8f4329e3-613a-49b1-9d01-0e8451bea54e@arm.com>
Date: Thu, 5 Sep 2024 17:22:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME
 group priority
To: Steven Price <steven.price@arm.com>,
 Mary Guillemard <mary.guillemard@collabora.com>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 nd <nd@arm.com>
References: <20240905111338.95714-1-mary.guillemard@collabora.com>
 <20240905111338.95714-2-mary.guillemard@collabora.com>
 <2b2d13a9-9e84-406a-a803-5366036fa761@arm.com>
 <d24272d4-e21a-4f62-8797-ce29dd6d2147@arm.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <d24272d4-e21a-4f62-8797-ce29dd6d2147@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::19) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB8611:EE_|AM4PEPF00027A68:EE_|PAXPR08MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 59893476-7d11-461c-41f7-08dccdc6ee6b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?OEk0RW56T0d5Y2ZjaHY0c1VlWW1JVkhsbExiZXhhV3BXNUNBWTVCdUwycUMr?=
 =?utf-8?B?Vk1KdHVlekZyRkRzS2h2RnpBVWgzbS9BNTdBcisrVmp1eE1tU283Qndsa0ov?=
 =?utf-8?B?dlgzNVByWnNwd1EwTUNadStDNmpTR1d4cVRpajk0T01OcUhNTTJpb1A2VXBh?=
 =?utf-8?B?b050Y1l1ZUk4Q2w1TmJxWEc1Q0JiZTRWcFgwaHNucVdpMDN0ZldmT0JyVUZx?=
 =?utf-8?B?VlFqblpoSVZpeW9Xai9Uc1RzcEhjeTRiMzZ2MU1rVE82ZEdjUmRPbzFPUGxW?=
 =?utf-8?B?L0FBWW45ZTA2RCtmOTRaRHlad0pBSmdxM2o5WVZMUUZzRTQ5ay96VUlsU3BR?=
 =?utf-8?B?WDJhVnkrSjVTN1Nibk82WXBBeDZpdWJ5RHNVdFZ0M0xtN1FXbnZZNUJwOFNu?=
 =?utf-8?B?TEptbkpKUysveWdMYUdIOTlwQUJLTkFpM0wzN2hJRGNyeUdkZ0NBOTlLWmo4?=
 =?utf-8?B?NGhjL3g4MklnOEI4LzhLTzFzM1paWndTcVBEUWczLy9HZVFJU2gxYjVwU2Ja?=
 =?utf-8?B?Ylh1YjVoRDlOL2ZCc284VldMR2R6eDlVL1p4S3ZQWkh1c0l0MEVhVUJOekxU?=
 =?utf-8?B?d2RqRFVjWGt3UEN2N21MTnN6alVaMUF1MVdaWjZvWmNkaE5wWXN4ckptOWIv?=
 =?utf-8?B?VDlSSVkvTWtZYWVPUkNyRlo1cG4wVFhRMTBXMlBYUms5VFhvQ2dibGlGM0tM?=
 =?utf-8?B?bklpVTZhdUVaendudnYySUpYTVBFM0tvS0xWRUt2ckxHWGJDeVRCOEROWHYx?=
 =?utf-8?B?MzNiMW5GTytwUzJFOVZTbTdPdFo3YVkxdDNMblhrZDM0dTNlcmJrZDJrZHZI?=
 =?utf-8?B?ZFdxUHpxM1BpR1ArREtmUCtUTWowajJFM0Q3Q0xuVlRtWS9yTEdUMkJvUHkr?=
 =?utf-8?B?dWNvRjYzSGhOK0dXc0ZVMTFEcExBYm4wS3hHdnNBVWFBd2J3TVpBbFVXQUd6?=
 =?utf-8?B?MFljc3Y3WXNTcTluVDJxZ0QyeTNSbWRkbkhHVjRVQkF4b0xkK3NISlc1M2NB?=
 =?utf-8?B?V2c2dWJpcVg5ZktIdkpkZXMzakVITm5MSUNjTHNLM2Y4azBIUG5RZlk0ZDNi?=
 =?utf-8?B?RHNBZkFMaHUwbnZmSkRMT05NU1BWdGRsSlFwOHpvYkNTa0I0cGdSamR5SE5p?=
 =?utf-8?B?RnJiSG14UkRGUXhIMU1nTk1UcnpnT0J1empzb2dmalZvMmZCKzRuK05hOGt3?=
 =?utf-8?B?WVA0R3ZYdDBxR3dJbW5QQ0xCKzlRTzlWUkVXSEdOclFlMzMzWWhlbEdpZE93?=
 =?utf-8?B?WnVRYzQvdE1IT3F4WlhUcnE4RGxObFJpeGxlb1IwYmM1ZGgyamIrUjlyQ2Zh?=
 =?utf-8?B?b25pUmw3UWdXMXpqcGwwcnZoS083UThwUWpxY3dzRkdwcnVCTUFPZTk0QVUy?=
 =?utf-8?B?TG5WQVY5U1dSK2lLWjlpd0NQQkJUREh6V2g5K1E4eVBpY2gwYVcrZ3lqN0l2?=
 =?utf-8?B?czk2OVlXU0wyeGpibXEwNWwrc25XYkwyVTVFUW1mQlJvem1CVTB6d0I2eEpO?=
 =?utf-8?B?MjFiam8yVmtkZ1lXSHFrSWI0MlpGUU51dDdYM2g4SUVUdVd1U3REWmVmQnYy?=
 =?utf-8?B?cEMzWUJlWXE4QTNWRWorbVR0TXJKa0tUZkVLTnJ5Ulo1dmFDREEyL1Q5YjVv?=
 =?utf-8?B?bThNZktMeTdBNlcrVGxlMnJqbzd3QTRwb3hBVDNYc2ZldFRuMUpLbVpwaUZy?=
 =?utf-8?B?YXVxSDVKSDlvcjFGc29DZDFzdnNWejdueXcxTFMyemxINkZXYVJMUWgxY1Yv?=
 =?utf-8?B?bUZWS3k3VWhRZ0NiaFo4N2QyYmJJQ3NhbmNSbHlyUnpYam9CVGZpTG9Ha3NC?=
 =?utf-8?B?NjMyZHFnMWdiSzZ6THVidz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8611
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 12f511ff-9744-4824-31eb-08dccdc6e58a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|35042699022|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmM0V0kwM1hqR1Z3Sko2T0NDME1GeTkwVTk1MTV4OTcrN2p3cE43ZldVWlpO?=
 =?utf-8?B?aUhxb3prSjBhNzlYQkEvRkdGNnNUQ1RzczRGKzlBOWU5TDN2L1BqZDJpa3Q4?=
 =?utf-8?B?a1U4LzFTT3RRZFZHNWpRU0hSeFVkcUQ0czNZRC9PTE96T0VWaG5oUkp4VXVu?=
 =?utf-8?B?WkxSUG9HODN5T2hDTlducXdGdGg4QzdNTWlWZFdZSEhPMmpqc053RkdIdHRL?=
 =?utf-8?B?VmYzSVJtQUp0OW1reUp1cHl0WWVETzJ1WVVRdGQ4SFlvbVBzN2FRZDRTdjFY?=
 =?utf-8?B?SkMvN01XZ0JTUUYzMDNtUnU2VzRNc2JoYXBIZEhVdFp2TkR5dnVQVmRSbDZ2?=
 =?utf-8?B?Tm1oZDdVekVMQ2hxV0h1TCtpa3JqSkFKYld3cWJ0MEFVV0RtY1gwME91Tk85?=
 =?utf-8?B?eEhHRFdrWHpJSms3dkcvTmJkbnJ4d1dmTlFDRWc3aVlwMmhtWFcranB3a0N5?=
 =?utf-8?B?SWJ1aXNMeUJwQmdINStwZk1DRTJEYzNIRU5STkNvRCtXdFRaUmRjRG53TWFj?=
 =?utf-8?B?YUFlNndMQ1hqMDQ5dGhGSms2YXk3U3JMLzcrbkYyT1hHMlVldGh3N3pVYlN4?=
 =?utf-8?B?QkN3UjJ4cVNHMFBrNkRJTHhFYU50Q2ZwY3gyK01YVDcxNXRCWDNqYnJqU2lw?=
 =?utf-8?B?a3psNkdNU3NiYU13RmlHZWhuUTZRSVg0cTBzZHBJT2hSaHF4TFFGNzQ4OGFW?=
 =?utf-8?B?dEptSWJkN004UXQ4eTVRVDdsVTFCQytUNVhuL25mdi94a0UrUVUyQ3pBR1hz?=
 =?utf-8?B?Q2F4ZHhLdHA0eGtIeUI1ZUUvamJvb2ZQVjExZWIwV2RKZTAvWk1DUDVPYk9m?=
 =?utf-8?B?NHpLanM0R1FrYVZjbzdyVWVMbDhITUt2T29HWVBtaFJlVzVyYWEzaEtPdXhF?=
 =?utf-8?B?WnhKdlBldE9YdEtCTFNNc2QzT29HNE1hYmdDSzNUejJiK2ZWQVJFRDZDdVNw?=
 =?utf-8?B?Q1VQekNxdEYxY0hwMFVPMTg0TllWOG55c04xSVY5SDRqVEFubGp4OW56ZVE4?=
 =?utf-8?B?Y2pFRnNEZ3lJWmtZYzNpMDdEdktVNy84OWYzUlR6dE5lS2hkRFpGdjRkV0Vx?=
 =?utf-8?B?U2srNTJHL0lENlRJdUVXMG1CdVRXa1RDQ2lqT1F5a25sdGdzSDhvU29GWW1v?=
 =?utf-8?B?WFlHTmRZQ2pnNGxBMmpzOUtoMzhwVDBIQk5tbXFqRlNvMHN3dTN1bDU4Z1NV?=
 =?utf-8?B?QlFpR2JGNUM2RWZ2S252cGNRWEEreS9mWkY0N3Q3QjVXdGw2eHZMN3JFWVJR?=
 =?utf-8?B?K09pbUtQRWdRbnFGZTlqV0V2RGk5RjF3NDl4RHVVV2hPc1l2bGJiN25WZHZi?=
 =?utf-8?B?a05wWmdRZXpubkJLWFdSdGQ4VXRFbE1peXZXZWJmY25HU1dMbTB2SG9YbmZN?=
 =?utf-8?B?TWpyVTF4SjVyKytuUkpXdWZYS1BhOHRsaEd3WS95aW9DMmFTZkZNUjR5bm0r?=
 =?utf-8?B?NmNiZ3BCN25jZTdwMUNSM2ppQkc5V1JCK0VOUXAyenJFYUtxVFVtQnlaaUw5?=
 =?utf-8?B?Z3ljcVBqeVlCY3N0UG91b0FkS1NSblJiN3dUODMzS01sUXpuaUoxNEZnMFp2?=
 =?utf-8?B?ZG55LzNaWWZWbFVEWmNUZnhZYjhicERBUWVkM21XQTBKby9sRFdCU3pHeEM3?=
 =?utf-8?B?ck1LS1k4UXhmK0VlZkRYVU5LUlJ3WFErSEdWcUJzcGU1dk10Z0d0NVFmdVF1?=
 =?utf-8?B?dGtDYzgvRGZOMVRBZUxZRTJNalZkT0tXdVNNdnh2MVBUMjQ2TmowaGFBYlNQ?=
 =?utf-8?B?dmk0OFpBeVQ3VVViNFJBQ1JZVUR4RGhOQlIvSTFCU0tBK04vSEpqbm9mKzlv?=
 =?utf-8?B?QTJ0UzlZSittSWhYeTlMVDJqd2lTYTZJcVV6ZEZXOVl3T1oyUjIyRVh1YXk2?=
 =?utf-8?B?UTJjVjdDL3NpRlpvRjc4b01DRk1jR1JpUEpOdUJLa0VZQmhiQTZXMTFlZ2RD?=
 =?utf-8?Q?5PzeQmyNwlFV981JkLuFsZcvxUzUz43y?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(35042699022)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 16:22:26.6368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59893476-7d11-461c-41f7-08dccdc6ee6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7550
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



On 05/09/2024 16:41, Steven Price wrote:
> Hi Mihail,
> 
> On 05/09/2024 14:54, Mihail Atanassov wrote:
>> Hi Mary,
>>
>> On 05/09/2024 12:13, Mary Guillemard wrote:
>>> This adds a new value to drm_panthor_group_priority exposing the
>>> realtime priority to userspace.
>>>
>>> This is required to implement NV_context_priority_realtime in Mesa.
>>>
>>> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
>>> ---
>>>    drivers/gpu/drm/panthor/panthor_drv.c   | 2 +-
>>>    drivers/gpu/drm/panthor/panthor_sched.c | 2 --
>>>    include/uapi/drm/panthor_drm.h          | 7 +++++++
>>>    3 files changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c
>>> b/drivers/gpu/drm/panthor/panthor_drv.c
>>> index 0caf9e9a8c45..7b1db2adcb4c 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>> @@ -1041,7 +1041,7 @@ static int group_priority_permit(struct drm_file
>>> *file,
>>>                     u8 priority)
>>>    {
>>>        /* Ensure that priority is valid */
>>> -    if (priority > PANTHOR_GROUP_PRIORITY_HIGH)
>>> +    if (priority > PANTHOR_GROUP_PRIORITY_REALTIME)
>>>            return -EINVAL;
>>>          /* Medium priority and below are always allowed */
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
>>> b/drivers/gpu/drm/panthor/panthor_sched.c
>>> index 91a31b70c037..86908ada7335 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>> @@ -137,8 +137,6 @@ enum panthor_csg_priority {
>>>         * non-real-time groups. When such a group becomes executable,
>>>         * it will evict the group with the lowest non-rt priority if
>>>         * there's no free group slot available.
>>> -     *
>>> -     * Currently not exposed to userspace.
>>>         */
>>>        PANTHOR_CSG_PRIORITY_RT,
>>>    diff --git a/include/uapi/drm/panthor_drm.h
>>> b/include/uapi/drm/panthor_drm.h
>>> index 1fd8473548ac..011a555e4674 100644
>>> --- a/include/uapi/drm/panthor_drm.h
>>> +++ b/include/uapi/drm/panthor_drm.h
>>> @@ -720,6 +720,13 @@ enum drm_panthor_group_priority {
>>>         * Requires CAP_SYS_NICE or DRM_MASTER.
>>>         */
>>>        PANTHOR_GROUP_PRIORITY_HIGH,
>>> +
>>> +    /**
>>> +     * @PANTHOR_GROUP_PRIORITY_REALTIME: Realtime priority group.
>>> +     *
>>> +     * Requires CAP_SYS_NICE or DRM_MASTER.
>>> +     */
>>> +    PANTHOR_GROUP_PRIORITY_REALTIME,
>>
>> This is a uapi change, but doesn't have a corresponding driver version
>> bump in the same patch. You also document the addition of this enum
>> value in the next patch, which also is a tad wonky. If you reversed the
>> order of the patches, they'd make more sense IMO.
> 
> You can't reverse the order because then the version bump would be
> before all the features were present. Generally we put the version bump
> at the end of a patch series because it's indicating to user space that
> the new features can be used. This way round if a bisect lands in the
> middle of the series then the new priority is there but won't be used
> because user space won't know about it (which is fine).
> 

Ack.

> Steve
> 
>>>    };
>>>      /**
>>
> 

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

