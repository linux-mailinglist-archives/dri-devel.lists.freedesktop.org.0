Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0961F96DAE2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 15:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA2210E8A2;
	Thu,  5 Sep 2024 13:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OAf90zbt";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OAf90zbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571E410E8A2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 13:55:06 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hd8cUzQfIr12B70IkvCc/3PXxpZV6djpd3ljPYrvLsO8lMiqFTZI4UGEjGLkuAb/q5vZz4n1Q4sqM5xxCNg1Mvd0E/iAekiFqNF36WXDzhZ+UiqPv5M2wB+BniLZhjbYW/H4x1xiXOYjZOjoxxEzath7u7+yfgaxfQGjEZ2tPBgZetdjyo+Lgnv/eSk1kX0wR5rsn6yMKbpYyqIlY55YZDyiY9LZfPg0HD4PHWhxXZlaZcFVxoRz3xpeJ3GDzqGSQd+Cz4uKxVIgISZ3GMMW9Tl3iBZPbgIosdO+09hWJOpdSL+bTyaRMjDpl0DE8+CDOqMRf14Rug0j+VoWJBzLvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5tXSl03cVYbA16bXo4SPakbucHqVjx3Ae/3xNBfTcI=;
 b=U7I+ztK47zDeswBzx583o7YjYqNPL8WVY7dDtGDcEY+R3lloXvPojwpa3JdsxGUHEBuwhteVPiXOVUHoI3PeKs6om/gQqiV51rEDOtDpN1Gbf5kyopECX5LBenT7lmD4xGgfYlMFCmvAczrsNK/efLK4uxbvLQrtEp8FO/u9Xbl1Ugb8jDJNxz/+hEeiLz7t4VcpzWrt+5ctDR+OQHOi7ueJpsaOhW4W+8ZG/u+eX8+lnFkg06MfUNojAB0BIgmJ2VY9xcgX0XmXqEo1mttNFjc9FKZOksM0ManP8lJnaOr5pf1hHhHKxQ73260chDnvow0T8LE0/e+J5Xf37yNSgw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5tXSl03cVYbA16bXo4SPakbucHqVjx3Ae/3xNBfTcI=;
 b=OAf90zbtH50JvZgzKwRYB5HRbO1UgnXHBrTI/phCUVgR+gafhCrUpZxhHQwfbc3yoG60fGBmsrD/601G3Z3eSq87UfPo+GpEc/8+zh6tsV1n+ZOWamC7grI7hYwIn6YGf0ImgVmfsyMJPmGKxKUqmP3VRAQNImRe9jj+Sz5n92o=
Received: from DB7PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:10:52::20)
 by AS8PR08MB6581.eurprd08.prod.outlook.com (2603:10a6:20b:33a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.16; Thu, 5 Sep
 2024 13:55:00 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::7e) by DB7PR02CA0007.outlook.office365.com
 (2603:10a6:10:52::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Thu, 5 Sep 2024 13:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 5 Sep 2024 13:55:00 +0000
Received: ("Tessian outbound 7b70c86ee9c2:v437");
 Thu, 05 Sep 2024 13:54:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: afafd9ca9183f82f
X-CR-MTA-TID: 64aa7808
Received: from Lcfe4f45619f9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 38D81C33-58C7-4105-A070-AA3D7ABD496C.1; 
 Thu, 05 Sep 2024 13:54:48 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lcfe4f45619f9.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Sep 2024 13:54:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trC/C76n8mZdSu2/vjLEM43jOrptMYcNZ7PyKc+5q9l7s0+kRIw9mUc3qY6hasQunnPck0B7IrQwQA6J16uvp8powkJAsr5GjRgsusAK+lz6jCKVFnDEKxncDLTvyqid2AS7xEUftznWvVoOEuBtu4q9OCHDydUwxT3DjHPuyp1yOqG4GkAeUd8fILcmSDZm5alwC/ZVapvNXm3NG39PAweTFHNWFNrFBTLWJgdZO9MAKycGUKtXSQFMzznr78i7t4dt3ZlQe+/c6NyYchXwqiEyDllRk2r86K5cHLb5WkVvyZ+9+KjAsW0mwfN8lhat9jYaKLTmTtXi9ooqcR+5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5tXSl03cVYbA16bXo4SPakbucHqVjx3Ae/3xNBfTcI=;
 b=RFLA1+YThC+UHuskj3aTB4TKd5LX9YJKOnbP0fI8/hj/jXQQSwzk8yS2yKskx7tqdtVPN5K7R1clXCZeGS4zcDYa8zkTbkLO4okxmdYQmKcR7Pw7/yAhYp3dL0mD85f4kcvX/YnCannK+4itikdloOml3cLvSkGMMClvn6tjW4XGdnif/BgegSLLwMRvX3s8fX5uGRkhEXR6SRq/HNokRUoLqUb2xr6oX2ycYE2dSb1ZA8MR3oNjvPFdI7CWBmZE9nwNxJeQgSFjf2ifc+VT0EdXiBDrbqeJlCtqDyzAPhAf/ACCKZMCfrJ/wWU5b+0HtMBA+40ycEZV8x1i/GO+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5tXSl03cVYbA16bXo4SPakbucHqVjx3Ae/3xNBfTcI=;
 b=OAf90zbtH50JvZgzKwRYB5HRbO1UgnXHBrTI/phCUVgR+gafhCrUpZxhHQwfbc3yoG60fGBmsrD/601G3Z3eSq87UfPo+GpEc/8+zh6tsV1n+ZOWamC7grI7hYwIn6YGf0ImgVmfsyMJPmGKxKUqmP3VRAQNImRe9jj+Sz5n92o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB8184.eurprd08.prod.outlook.com (2603:10a6:20b:561::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 13:54:43 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%4]) with mapi id 15.20.7939.010; Thu, 5 Sep 2024
 13:54:43 +0000
Message-ID: <2b2d13a9-9e84-406a-a803-5366036fa761@arm.com>
Date: Thu, 5 Sep 2024 14:54:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME
 group priority
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 nd <nd@arm.com>
References: <20240905111338.95714-1-mary.guillemard@collabora.com>
 <20240905111338.95714-2-mary.guillemard@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20240905111338.95714-2-mary.guillemard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0314.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::6) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB8184:EE_|DB1PEPF000509E9:EE_|AS8PR08MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aed9f95-2ae0-4c6e-2756-08dccdb255c8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?M25vemNxdVRQRXUxd1d0cTl6ZTl0dlU4dFY2b1NZVDFLWFFSK2t2Z3oxRThq?=
 =?utf-8?B?bzVYVUlUMjNnUVJZSCtuczRwQys0T0s3TW5kRTFMVU5qL25tTEpQS1JSME5R?=
 =?utf-8?B?cjBSdUVLbnFjZFE5bDRsdXJ4SE9pZE9zcE1abjVzL1B6OGM3Zk9mRWVLcVAz?=
 =?utf-8?B?VVN2Z0pCbk5zZmQ2eFJHOUFkUExSeEpFNkFtZDIwQWd5bFY3Tm1lZTIwWTNo?=
 =?utf-8?B?eER5ZE9pUnMvMTI3bmxVTlk2VlV6akxvaXJCUHpMMm1xa2ZVRFN4UUhvbCtl?=
 =?utf-8?B?eEVGc0hsOEhuL0ZNTlY1c0RPVG5ZbHlSYVRLWnViZ2xzRHVObk5QWC9DZGN6?=
 =?utf-8?B?Y2FSNVQ3d1JvVkhtbFZ3WVIzLzE1b0kwVGd2cGVQWW13MWFhUXE4aHNKUTdZ?=
 =?utf-8?B?aG5QTWZrdFkvYU1ZazNEempiR0Nzcno5dG5kM1ZQZ1F1V2dBelpXMlY2STht?=
 =?utf-8?B?L0hmSDAvQkNMcUR3WTg2b0tKdnZpMEF5bUJqQ0JjaWZDMTVFbmtFOFpBVjY4?=
 =?utf-8?B?V2JXZDljT0ZHQ3dNdTVLUlRDOFFvTVlQQTB2Y1RoWkdHVkFOR1lhYnhVVDZi?=
 =?utf-8?B?U0NhUHgwZlNmRS9qUm1yTGFWSXpjTVNGQmRweG9BbUgwSDl1a2xSK1luZFI5?=
 =?utf-8?B?THFPMTVuUlMycUZVUUM0SEtBY0pIc2s4WUxsMU01aVVyQlZwYjdEUERFL3lo?=
 =?utf-8?B?VDdXdWxuMk1qaXZjWEJydnhBekt2K3NMaGdYZU96ekZSM1ZzdXFBZ1lCbUc5?=
 =?utf-8?B?TjR0K043NWI2MkM3V2h6bUlaVERIVEJISTFtVWNqc1VVRTIzVzE2VWttK0U1?=
 =?utf-8?B?YmVQREppbUllOUhMYkpGWHdJMFJnbmFqQkZrTEpBTFRoTSs3ckdhQzlwcFNa?=
 =?utf-8?B?N0E0UTh1NENQTVh4MG5IS1huQk5laDJlN0d6Z3VPaS9nQU90TzFaYk9adTly?=
 =?utf-8?B?TjFmSHgwRk0vdEh6d2pvUDN2R3ZNTytnWUNPVW9kZUVucVNjSEpkbFJ6UUNx?=
 =?utf-8?B?Wmw3dTg1VkRsR1U2bjA3eHpOSEVBa0dDZHYwQUI0ZWxkY3Q1MHF1dWd1RGJa?=
 =?utf-8?B?TmR2S3pPU3hOWmdkWWEvUTc3Y28rYjhmZHlvYTdFYXpnZ3lzQXhlRjFhTGYz?=
 =?utf-8?B?OEUyNFFtNHFWNm5WSGIyLzNhTGdhSVA5bkdnd0Z3YTJFVWprU04rRjhlcUxB?=
 =?utf-8?B?aGVLeUQrWXM5aE85VFl2OW00cTFuS1pRcDhjOG01TWFIRHlmbnVnVnRIOW9o?=
 =?utf-8?B?anlXNlU0RmZjQlp1MUk3bGpNWXBqUkNOU2MyUzZXVjJRMGVxU21KTHFWY0RL?=
 =?utf-8?B?akEzSGdJNkhPajUycHVVYUNONXJ1RjJ0MldJNXRWTjVtQzEzSnFOQ0p3Z0FO?=
 =?utf-8?B?WEhPU2h6b3J2U0VGNXNWUTladngrdHlIMVh4MXNJb0VlTFZNa1BES014OEU3?=
 =?utf-8?B?cWFCeE1RTktYM096cjNLeG1tWXQrNUMrOEFvTTRRVENoSVpQMUNYb3Z5NmM1?=
 =?utf-8?B?eFhtUW11cUs5dW1oUmFVZ2hnV2RoeGNQaEFBbmh2dWtLTDBHeU43RFd1NCtO?=
 =?utf-8?B?aElmcVRvNmpFdjQzZDVsOENaZS9Gbms1a3pTZGRCaVFGKytONWZTbUF6bGhD?=
 =?utf-8?B?eXU2SkxaOFExcHUxQ29Id1lwbkJTMjZ6aXF6S252SkRQZ0NQODNlc1NkY3Bp?=
 =?utf-8?B?VVZrbGhHa3R2djFpdmFqKzVESXVRelJGWG00RkRRU2dRaUFnelU5R1h5SVd5?=
 =?utf-8?B?bGpWaWZ5ZzJ3RG9HQTZNOUc4OUF2cDY0Ry8wbkVjT0VuS0ttSEpyTXVKNnBL?=
 =?utf-8?B?a1ljMjd2bEIrMGd3THBBZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8184
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ccb8253e-f26a-4a15-9ad7-08dccdb24b83
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|35042699022|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEswUi9ubFFaYVpvT0NHY2d1anoyL2l1T01saGhva0FCYWxueWZGdDUrelJQ?=
 =?utf-8?B?ckkvdG9iZE1YSmZOdzRKN1dXdTAzcEJ6ZmhwNUJ5TlZ1cFk0bm9HcDUyQ2tP?=
 =?utf-8?B?K0kwWjRoVXp2aXZpN0N4ZW0yNkZYRWNjdWx3eUNiTjRERTZXV2xhZGp6R2w4?=
 =?utf-8?B?MDdYRkNNQWs0S0ZBRlpRTjV5VFRpbG1KanMwOW83bGp2ajBLS1JvNmFETnVK?=
 =?utf-8?B?MjJ2UGZ2S2xQNGVPaXM4MTE4STFkdGJjci91azhFalVzRzdvamV4eW52aG9L?=
 =?utf-8?B?V2JKb2ZDc0xkTndyOEQ0bFh5Z3NqWTBQS1pBSGw0Zmk3VXVaSDJzVWplSHRQ?=
 =?utf-8?B?L3lTenVtQWtrSDVZaWNtclhtemIvc0lwTW9IWVlwWVBHTlZYclFGUGZycFFu?=
 =?utf-8?B?M1E0NExiQTNwZU1CaDM5L0FUY1hzS0ZEUHROY2l4bTZ0aUxJNHkyblVzSHlO?=
 =?utf-8?B?NWdBdVFmUFJQRWFFYjNVNjB5ejV6MFJOaXExb2FxSFlFTzZBNU9KT1VUdEl2?=
 =?utf-8?B?QUh6clVnVTYzVVJoVXZ1RkhpY0xMN2lkNTN4Z3czYnhEbXVSbmp6VDJ2WXQ5?=
 =?utf-8?B?aGRPRjdZVkdmdFFjNmpoMFlsTG9OcktLMGI2QVZTdjN2Vjl3TnpNUHRQWkpt?=
 =?utf-8?B?Vkk5THBwWk1LaTBwWWFrMkdQK2cxVTZPczUzbiszVTRlc2JsbUhHOFYyMDNJ?=
 =?utf-8?B?RzAvRTNHM0Nra1NnUmtmSnA4MzhoQzV5Q010Qng3RlVTQ09RVi9kU2Z6TFhC?=
 =?utf-8?B?dXpBVVZTaFBya0hNQVhZaC83b2lEMzFsYi9yK0NIK0RUSitJS0Z1ZmRpWFVl?=
 =?utf-8?B?LzFoalA3YUFBRFllUWQ3S1poUTRJNVhPellZZWpROTRNbGNEbGNNY091cU92?=
 =?utf-8?B?SW8yWmJjd3FFMGxnSy9VWTFOY20xaHdmTVRJY21RdlF5Zy9Oc2R1bWNramJk?=
 =?utf-8?B?OW1VRE5jTDY1RE15c2lydERFbnBZcVhlV3BUd2tGZkJaNFBNWWVkMEttV1Er?=
 =?utf-8?B?YkIyQ29lQTBKYzY2TndCVWdJaERHWEhtTVlVcU9NWWVDc0ZhYXk3ZHpqYnZi?=
 =?utf-8?B?NnJ5MFZjTFR1NEgyRHozR0NzYjdNdTAvR05nREd0RXM1OVduTXNpdlVDR0I3?=
 =?utf-8?B?Q3lsY3c1bTV2WGxOaTdibVZsQlYxOGxobGh6dTI4TnhwTUJVYUdMUkNPcGNT?=
 =?utf-8?B?NHEreWtzUjU3dkVYTkhsczdnc28vSlhHL1BUYnVlOThBZElhcDZLeW5aVFhn?=
 =?utf-8?B?QTVQSHJkREZhNDlkSDRWOE9nZzVKeFBZMFBrdmNFeWdRc3pKV1RMZGdtU1gy?=
 =?utf-8?B?cEYvR2dIOTREeVhnSWVRZ2VsNmFiZ2tLdXgvQUpBNFhzV0FYMWU2Z2NYOEZH?=
 =?utf-8?B?a3lxQjVUTWh4T0dlUTIrQXVQRUxkT1JzT1RmUUJYT1JmY21GNmVtS3lnV3Y5?=
 =?utf-8?B?b1VOSWI0dWVNNGZhT3ByaG5QSVZVMnNyaElYbGNWOEFaVFlCMkhSbUROcFh5?=
 =?utf-8?B?dmJlMnlsSjRpM2h4VHNHTUJ5TTZ4eFRsRVdrQUJDWXZ6Wnd3VFNRdndvSFJx?=
 =?utf-8?B?NktNMURzcEJTYXArUXhBTGllaURzRmlvTDdKRDJEZnVGMjk2cUVlTU93Q3JW?=
 =?utf-8?B?UCtxdFNoZTFUQUxuUkR1S1VkWHNkcVoyVHM4RGhyNGlmVkRlSVliWFkrcmpV?=
 =?utf-8?B?R3BJWjdQUkRzekEwWHpMV0h3dVhNMXVLazhhaDR5SlRuNDdHTjVLZjJ2UUkr?=
 =?utf-8?B?aGlHK0NJVVMyZzljaW9IdTZVNXFMSU5UZk1CclNNOEJDZWlGb1ZscGdScG0w?=
 =?utf-8?B?Z0VmMnRkVnR0T1hDN3dvVk1zeDl2K1Q0Z244dkZtN1lQZlJpNVNtOUV5UWxP?=
 =?utf-8?B?UkVSZlQrN244OUJOck1SWGlhdVRPeXhwK2lwV3h5dkNMcFZ5aE9oUTFsS0JW?=
 =?utf-8?Q?q4Bf9uB+AcBdrX1x/kp+3jWGVKK0ShI/?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(35042699022)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 13:55:00.6196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aed9f95-2ae0-4c6e-2756-08dccdb255c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6581
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

Hi Mary,

On 05/09/2024 12:13, Mary Guillemard wrote:
> This adds a new value to drm_panthor_group_priority exposing the
> realtime priority to userspace.
> 
> This is required to implement NV_context_priority_realtime in Mesa.
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_drv.c   | 2 +-
>   drivers/gpu/drm/panthor/panthor_sched.c | 2 --
>   include/uapi/drm/panthor_drm.h          | 7 +++++++
>   3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 0caf9e9a8c45..7b1db2adcb4c 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1041,7 +1041,7 @@ static int group_priority_permit(struct drm_file *file,
>   				 u8 priority)
>   {
>   	/* Ensure that priority is valid */
> -	if (priority > PANTHOR_GROUP_PRIORITY_HIGH)
> +	if (priority > PANTHOR_GROUP_PRIORITY_REALTIME)
>   		return -EINVAL;
>   
>   	/* Medium priority and below are always allowed */
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 91a31b70c037..86908ada7335 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -137,8 +137,6 @@ enum panthor_csg_priority {
>   	 * non-real-time groups. When such a group becomes executable,
>   	 * it will evict the group with the lowest non-rt priority if
>   	 * there's no free group slot available.
> -	 *
> -	 * Currently not exposed to userspace.
>   	 */
>   	PANTHOR_CSG_PRIORITY_RT,
>   
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 1fd8473548ac..011a555e4674 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -720,6 +720,13 @@ enum drm_panthor_group_priority {
>   	 * Requires CAP_SYS_NICE or DRM_MASTER.
>   	 */
>   	PANTHOR_GROUP_PRIORITY_HIGH,
> +
> +	/**
> +	 * @PANTHOR_GROUP_PRIORITY_REALTIME: Realtime priority group.
> +	 *
> +	 * Requires CAP_SYS_NICE or DRM_MASTER.
> +	 */
> +	PANTHOR_GROUP_PRIORITY_REALTIME,

This is a uapi change, but doesn't have a corresponding driver version 
bump in the same patch. You also document the addition of this enum 
value in the next patch, which also is a tad wonky. If you reversed the 
order of the patches, they'd make more sense IMO.

>   };
>   
>   /**

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

