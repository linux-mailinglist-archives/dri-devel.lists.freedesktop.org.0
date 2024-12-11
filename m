Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B4E9ED63A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F1510E2D2;
	Wed, 11 Dec 2024 19:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="d1OJ0zPc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d1OJ0zPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260e::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538E710E2D2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 19:16:42 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MeBVPMKdghUqlaNQ4psPF2NaHdyH5cJ0ollwKPu5gHXmo5ugSQSu+VUlmqZ8MuEEnLYqi5iDN2VXEM1Fk4bnUeRF6cm8xyolmIXbqbP74b0uRCRXk0JEs2XyZIamml9I6CFNaTHauE2ZLMoowaA28EoovDHPxmdM+8jQ7uQStfAQ2+LQEIhai7CEa1fLe4hrw/6sAC9uFl0EpTwuexWumiRU0PFk0Ux7Yez6WKjIbfEgKER3UIKvAZ9eGLffhYAyNPqrg4E/oiZFLYpr3jYf9CJzBnNEgvciMZSVx0vFLHMlZQxoUVlWPNZ/HGAnn4klHRizI3s/2vEnGbDxFCfAMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaLp+T6UXGcDqeiIiAgSBEsJxb/JaMVXmTLDemZQsNc=;
 b=boT4emV2RjATbK4R6KLdGra09fd5bX/0f5QvZ601igDgPakvUycftSyBK+hIkxsyF7DbxDMsW98cho+bLc01J+oLbRzxxp1J0+l0ANlTHO2iyI+m4jhpAUyoZWCXXVQk4DkZ/2Y9PBf0tXshR688egWMY8B3a31kfSYuGPN+08DBeBseJI5Lgc1939RCqjHr9Z9TDY58n4Nc/ziVOBa18ZFlclhCkNzgw1Cyu0X9KNVsZ7T29iai9236KErzMPUfAzYkYHtQe4eUm9qlCCDs6XPnOA/MX1oPla1MYPVF0IJzzo7mLRATjxWRGCa1uYqb9b4SOPD5QnfGdo9DzV/x7A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaLp+T6UXGcDqeiIiAgSBEsJxb/JaMVXmTLDemZQsNc=;
 b=d1OJ0zPc5lRv9/GMszKHDP3iVGKiFT8Gcgor9ePmACzuTnu3gIRdOewI8RWgg+yN6Zbig4qaFjcDccSyIPRRUR+ePWKy1J4J/r11gAZoC5kayAaWTRWonBLaEb1spcZKXOTzQa4+fOVe+e7F56XPKO8HuQI+AKIUGh5umG3hOLg=
Received: from DUZPR01CA0213.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::27) by AS8PR08MB6647.eurprd08.prod.outlook.com
 (2603:10a6:20b:38e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 19:16:36 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::84) by DUZPR01CA0213.outlook.office365.com
 (2603:10a6:10:4b4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.20 via Frontend Transport; Wed,
 11 Dec 2024 19:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 19:16:35 +0000
Received: ("Tessian outbound 3df7a8fbf509:v524");
 Wed, 11 Dec 2024 19:16:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a43be5dd880e9482
X-TessianGatewayMetadata: mO8I4cDAiicBjX3KTeiT/oexRV1ZJrxdTeZjltZlafvuUMZp4oParLdDNDCo3u9wiQWw2YlD4Zqy6GhPerQmcR5ODTx8t6wboguNT8XOTj9OxonOBOJRPAni6w2Q9AEjK+QBh8eMlOlHS/GwQHNkgeLxiCgGEThSU4nCbmNozQU=
X-CR-MTA-TID: 64aa7808
Received: from L0a122994beef.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55C5A723-60D4-41CA-87CC-8895F81EEE65.1; 
 Wed, 11 Dec 2024 19:16:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0a122994beef.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 19:16:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwHRrmCEfL2DjUDv9MKRHU1P2PgiZuhsvMOTZvZ7mWUSl3aVBwK7JvOW2zSNWEYKwicFR+XI+G38CYjluftei3ZfxQRwZ1DsAqs9LwHxDa2Qh2LaPZB+lEbbivV91cqgEQNbSZBqMm7EECZkg9Q+frrqNWPfer1An7PwleP4BFGM2ZurQzfJMlN4Qw/ov7u5dntEs4x9bqAL+0TkRiXOZHm3ZJ+gMOEr00nA0XZy1/AbgumE/2wzc1gIDsRl1GtqgQXrxYXxW9085/SSHQIltKDXeNMy5AV2Efo+aHu+323r2y+yz/Omx3QVQfSD0eV9VjDsX0Ox7Ow4TVXLijTGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaLp+T6UXGcDqeiIiAgSBEsJxb/JaMVXmTLDemZQsNc=;
 b=fdq2LlIkbAGmtG9b+qmvr33Z3j3oxmkAROWTb6mdsPSUSmwJiFEKHBmjAGw7EbxlgiVSrD1PEn2b9KofQYyCHYsNEd58Qipj1dssH47zfZ+tyb+qB7f0t06KH4Zb9IrGl7Mj0pmeR41vAC+6AbHjdiLWlMBrsJ62dcR+KIo9jrzcEtkKemj+iXu+BQzXai06A5Mkvsqv+AainVz05pXindFXfOrqEpK2DT65bY/p2dTd2z4dKISmQOXBMV3pHST12/AWILdplg895U5UowpQrYWld6EGkepDL6ctKuCixqd6jueLrUZllktEfDfVXT1foANTygZ1lCoPEom+5Sernw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaLp+T6UXGcDqeiIiAgSBEsJxb/JaMVXmTLDemZQsNc=;
 b=d1OJ0zPc5lRv9/GMszKHDP3iVGKiFT8Gcgor9ePmACzuTnu3gIRdOewI8RWgg+yN6Zbig4qaFjcDccSyIPRRUR+ePWKy1J4J/r11gAZoC5kayAaWTRWonBLaEb1spcZKXOTzQa4+fOVe+e7F56XPKO8HuQI+AKIUGh5umG3hOLg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PA6PR08MB10646.eurprd08.prod.outlook.com (2603:10a6:102:3ca::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 19:16:25 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%4]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 19:16:25 +0000
Message-ID: <b2f16572-34c1-417a-b973-9170ea05a91a@arm.com>
Date: Wed, 11 Dec 2024 19:16:23 +0000
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20241211163436.381069-1-adrian.larumbe@collabora.com>
 <20241211163436.381069-3-adrian.larumbe@collabora.com>
 <85010ca7-0c34-4be6-9dfa-5be742ded25d@arm.com>
 <bvqjlomae7w34nawaqtrnthqvcypjui4cperriorzlv7uhngxb@4pqbagnew7in>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <bvqjlomae7w34nawaqtrnthqvcypjui4cperriorzlv7uhngxb@4pqbagnew7in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PA6PR08MB10646:EE_|DU2PEPF00028D04:EE_|AS8PR08MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 68da7c75-c15d-492b-ac2b-08dd1a18546d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZmNWV3RBVThEQWt1UWRDUTN6aVBOek5vNzB1NjdKSW4xRGJLUnJqNStVd2M2?=
 =?utf-8?B?T1IzU1BaNmwrQnh3a0Fuc3FOOXQxWCtaNTJ2ZldTOFUzSHJOOUtYamduZVNR?=
 =?utf-8?B?cHFaZVVxL29CczVET256L0p4emZLdEFrdlhHNlNGSEhLTUxxU0VTQmErOVJo?=
 =?utf-8?B?WWljeVRsTEpiRzN4ekZKekJCSGVjWDU5V29xYUpFU1hnTGhiNnFMc2lVdGFI?=
 =?utf-8?B?T3d2NEc5cS8zelVsMzRnOTMvVUhHQkZ2b2dEcTh2QmZuQ3ZYRzFzWmJLb3B6?=
 =?utf-8?B?VVdLUlFiWmlHYWdIVXFZWUlTMG9hY1cwVXJQWXdUbU1mc0loVXNuQU5TdHlR?=
 =?utf-8?B?NWJDdkdIbFlaWTNKWElSdXVEck5Yc01TU0dxUFIzZHVLc05BcEVWMjB1Q2lt?=
 =?utf-8?B?WnU1YVQ4YTMwZm8weW4vR003NmdTNjM0UDJ2eVhod1dNRk93OGRnUlJtZGQ5?=
 =?utf-8?B?RkJWeWxDVDZ2VnlqVDIzWVpxOGxjaStzSDZHaktHMmNBa3BaUFJJUEtOZ25x?=
 =?utf-8?B?RjZIUFUxSmZZb2YzNGxDcjBlWGNsR2NZeUxnbldlQUxLVGdEVTRmc2FNM0Vs?=
 =?utf-8?B?MkY5OXdQMERCQ3lHb0lzY0dLWkt5a2R4cUFDUXVVaGpwdStxT0NoRkRZT1Mz?=
 =?utf-8?B?cVdJbmdJRlJPQkRFT0JPVWQ2VkxqWkZFWVBVanRMWkdrVkVHTlJwQytpM0F3?=
 =?utf-8?B?Nmx0MnFEVnVqOHQ1NEltdjFISStaWlBYM2s5aFR5WmRJRmtuSVpGWjQ3bUFH?=
 =?utf-8?B?eGxnUXhvbFdPUFp4QzJkd0gyVTI3aXlScHYzaGpDd0twN2hxaUZ5YVNVT3Rl?=
 =?utf-8?B?b20vazMvNDlvZWlxQmo1WkJxZkovcmFPUDR5a3o2UmhwMVY4Tm1yNHJ3bUtn?=
 =?utf-8?B?blMyeGw3c1FDUy9HYVdiMEtZWk5SSW9XUjRIUGRQNHFsckQ3Rjh6bzh5NWRw?=
 =?utf-8?B?czlXVXVpT3Z2UkVlbVlxdndxZ3hKSGJWdmNkUmdRSjYyS3FRZHQvYmdrSkMr?=
 =?utf-8?B?TkJQTm9sZEJCVDBXWDVqaktvdEZwbk52azI5MXZyK2FSc01qVlZabnZGbWth?=
 =?utf-8?B?VFJIbUdWMzVmYWNJRElxT3dxWFVvdjY2dFVrYjdwODFQUFF4STBiL2d2eFdn?=
 =?utf-8?B?SUt4V3gzV1lxdGZmbElsYWEzSVFvUktleWhQWStOZjByUzE4S052NkpvVVRG?=
 =?utf-8?B?WmJ6VjlQc1gxUmgwQ3M3Wnp3bUVZbWNTVzZBMzV3U2lKWkxLeGR3MVptRGo1?=
 =?utf-8?B?TXUzdDRuRlprbXEyeXIxd1RjUXZOS3c5UHVuZklYTW5rN2czQmZQNXVkL2Jh?=
 =?utf-8?B?RlY0S1gzZ2Y2c2NQZytQUjVZUlpYZldoOGVLRDdXV3lwb1NtM29Nb3h1WWw5?=
 =?utf-8?B?U0dWVzNielk3Uk5zN2U5UmxVWnNZVVcwSDZ4cUh6ekZMeWF1UldDSWFjWm93?=
 =?utf-8?B?bjJIbVpqOE1ndGszYnJKTnFZYVdkNVBMWW1ZWWsyS2hodUx4M1VMeUpNM1kv?=
 =?utf-8?B?RTA2WDVNWDNmOHNuRGVlMVhBTEJKN09RNVpxOEJTclJSbzFxMTFTNlNJbXk2?=
 =?utf-8?B?SzdMYklKbXl4YWIzRkVTREdvVUNSbnBENk9XdVlzcVEzUnZRM1grbGVXSWhw?=
 =?utf-8?B?c2habk1vVVhtUmQvZjhNd25wMDhTRnpsbDhFdGc0cHJKb1UyZ3pwQ1N0bnll?=
 =?utf-8?B?blhFSEJuRXZJQU42Z1NhV2N4UXVkUHVMTzRQQmU1TnNreVAzbm5LOWpVK0dG?=
 =?utf-8?B?UUJhU1NpQURqd0tpRGs2dEQ2bFlEbXIwOGU5OTBUZ0pCbTU1aDVIVGpFZkdv?=
 =?utf-8?B?dThRUlovT1MyYmdEWlJsZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10646
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f9f908b-8465-4179-4081-08dd1a184e11
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|14060799003|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk1qcjhtYVVzVmN4bUZqbUwxWjVFS0Y1VUI1QmRaeGFCUmhJTytST1ZWRTFU?=
 =?utf-8?B?TGNqS3BUWWhRWEhNTkVLYjFwRnloaVJabnNxQ2Z5K2ZSNU5aNXl3MFhPc3hr?=
 =?utf-8?B?ZEZtNmpGMU5MVmc0OVI5dHV0SHBNYnlRSHZCaVN4a2M2ZXBSWUppVXZnYnh3?=
 =?utf-8?B?dTVZT1NHNER6UndOMThNZ2hUZ25UdTBGQjFRMXVESGFPdjkrZEd1dm5ZY1dN?=
 =?utf-8?B?WVFWWWs2K3BXV2FraThybFNOVVloN2I4NzJxMzh0WWIvWThpeWI3TExaU2I0?=
 =?utf-8?B?OVpyU1hjOUFocGMwOU91L2JBZjdYeUlDWmtwVmVWK2VrZ0JCbG4wNUpLdXpq?=
 =?utf-8?B?eFg1Q093a0dwMkM1Q1UyZ1haditHMmxLV2dPbFl4aUw1d0hMV3RzaXRHT09h?=
 =?utf-8?B?YXRPY3N5alR1YmxSajZnMGY0NmxaRllEWmNsYk50Y3R0VTFwZEdxNkhOL0dn?=
 =?utf-8?B?SkVVSEJlZ2FSc3BuSTZQSE1GRElrczdMTDlEK2RLZDhXcVZmaDdsc21wdDdX?=
 =?utf-8?B?YzFQcGR1dWQ4RjBZeUdnOExIVmRyb0hybWwyRjRjbHBlYmk4bGluVW9jYTdW?=
 =?utf-8?B?OEJCbjNhQS84bkRzaFgxMWlKTmtLOEQxVE85bFhKMFB5QWlOUVkyb0FSK0F2?=
 =?utf-8?B?aE9peHcrQTFYZlJGS2ttUGtCckxxcERmSnlFNGhKcHNoZ2Z4NlhHUXUyRVI1?=
 =?utf-8?B?M1g0aUh2VmR4ZlYwaGtUc3d2ZHpsRTRuZ3kzNzhNT0J4UWJqd2Z2NGN0RVhM?=
 =?utf-8?B?c1RsMmxFNmZiblFMYjhidFMrTy9XbUZHNkZaZWJGT3kvREFmMFFlQlNXaElO?=
 =?utf-8?B?MTRuSmUzdW90Q3hiRlB2eTRtVk16SDV3UGVrMmRTdE5lSVdQckVSL0srSUVr?=
 =?utf-8?B?SDl2RU04bFRxbDEzMUxlSFhtOUdWcUwvWVpRaXowNVp2ak5sQ0VXb1RobmZo?=
 =?utf-8?B?T25yYUN4KzhXSnBpeGU5bUVVdnRJNmhoRDNBVm1yeFRsMUMxaU1US3NYcFFL?=
 =?utf-8?B?L1lyRVBhVW5tWnFEQzFUSSt4TXpRcmVaSzB3aThLWVFCSTJrTlE0VkNXTWZ0?=
 =?utf-8?B?T3YrTi9RMGFHbUZYcDZvYlN5cDBBSWY4d2V6Kzhya09NZmZlZU50M2EveGxO?=
 =?utf-8?B?Mys1Q2wyQi9qU0w2c0QvelA5Tmg3NzBXNThybi91OHZOZEVXZ1hpSndMV2lF?=
 =?utf-8?B?SzJOdGZIZFFmaDR1VXY3Rm1QY1l2eDBvMk5vWWdNNmtNb0tVamxuMlcrSXB2?=
 =?utf-8?B?RTdYdFJlcFFjN1FhendKNTk1eUg0Mk02VWZ2SStIenVxMUZad3VYSlRCSnpi?=
 =?utf-8?B?V0UrQlU2OHQ1ajlOWEhzRUJBUTNDZTNmajZSV29CcXp2YjlweW12Z1ptSGNm?=
 =?utf-8?B?aFA0U3A5bWRTVUppYXV0MnRCOEhxUXhkVUY5NE5lTjNmSUU4bHRmQmE4bU9k?=
 =?utf-8?B?SmQyRHY5UFIrRFpJZHZPQkdwenowR3N6MUdHTCtQU3dSaHMyVTRiSWFBMlRQ?=
 =?utf-8?B?M3hXR0N0RmJINXJNdlQ3emsrdm51OFdZRGxRUjhoK0lyR05Ebm15anhiN25l?=
 =?utf-8?B?ZDIxbUdYNjU2cStjUjVoeGFZWFl2YWgwaXFqY0Z4M2lFeDZuc1hLQ3BpYTlt?=
 =?utf-8?B?Zk5QUzJaeHZjdGdNRnFJa3UvUUl4Z2NZd2Q0S1JWaWptZEJtVHc1VWp6a3dI?=
 =?utf-8?B?L3FnaEFZTGg3d1BIb29YLzZCYzNKekZDV1VOSlpPWkk5RlNQQm9VUk1QT2FR?=
 =?utf-8?B?WEZzR293UFE1bVRwaElqTXlMUVh4c0lIT0hzYlArWEVvYlYwMHhrdko2V0I4?=
 =?utf-8?B?bGpZRWppWk5KY2JUWVd6UnZiTnljL3pta21hK3lXZlM5VkJ6MDlxR2EyZUpH?=
 =?utf-8?B?SG9sbEZqa1B3eHN4NmxEb2U5YkNXOWlhNHZoT1cyYTI4NWkrSVFwbHBMZUVt?=
 =?utf-8?B?c2dDOEh3RWUwYWZmWklyaGNsNVlhYjVQVEtRT2toc0hITHdDT2srVTlVM1ow?=
 =?utf-8?B?c1g3R3RCM25nPT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(376014)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 19:16:35.4333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68da7c75-c15d-492b-ac2b-08dd1a18546d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6647
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



On 11/12/2024 17:02, Adrián Larumbe wrote:
> Hi Mihail,
> 
> On 11.12.2024 16:40, Mihail Atanassov wrote:
>> Hi Adrián,
>>
>> On 11/12/2024 16:34, Adrián Larumbe wrote:
>>> A previous commit enabled display of driver-internal kernel BO sizes
>>> through the device file's fdinfo interface.
>>>
>>> Expand the description of the relevant driver-specific key:value pairs
>>> with the definitions of the new drm-*-internal ones.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> ---
>>>    Documentation/gpu/panthor.rst | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
>>> index 3f8979fa2b86..c6d8236e3665 100644
>>> --- a/Documentation/gpu/panthor.rst
>>> +++ b/Documentation/gpu/panthor.rst
>>> @@ -26,6 +26,10 @@ the currently possible format options:
>>>         drm-cycles-panthor:     94439687187
>>>         drm-maxfreq-panthor:    1000000000 Hz
>>>         drm-curfreq-panthor:    1000000000 Hz
>>> +     drm-total-internal:     10396 KiB
>>> +     drm-shared-internal:    0
>>
>> You give an example of `drm-shared-internal`...
>>
>>> +     drm-active-internal:    10396 KiB
>>> +     drm-resident-internal:  10396 KiB
>>>         drm-total-memory:       16480 KiB
>>>         drm-shared-memory:      0
>>>         drm-active-memory:      16200 KiB
>>> @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
>>>    Where `N` is a bit mask where cycle and timestamp sampling are respectively
>>>    enabled by the first and second bits.
>>> +
>>> +Possible `drm-*-internal` key names are: `total`, `active` and `resident`.
>>
>> ... but don't list it as a valid key name here.
> 
> I do mention slightly further below that that key:value pair is at the time being unused,
> but I've thought of a possible interpretation that could be part of another commit.

Understood, it just looks weird reading the paragraph after the context 
above. Seeing as `drm_print_memory_stats` will always emit it, it stands 
to reason it's a valid key name, just with no assigned meaning to it 
(yet). I'm being nit-picky :). Feel free to add my R-b with or without 
the extra key in the list.

> 
>>> +These values convey the sizes of the internal driver-owned shmem BO's that
>>> +aren't exposed to user-space through a DRM handle, like queue ring buffers,
>>> +sync object arrays and heap chunks. Because they are all allocated and pinned
>>> +at creation time, `drm-resident-internal` and `drm-total-internal` should always
>>> +be equal. `drm-active-internal` shows the size of kernel BO's associated with
>>> +VM's and groups currently being scheduled for execution by the GPU.
>>> +`drm-shared-memory` is unused at present, but in the future it might stand for
>>> +the size of the Firmware regions, since they do not belong to an open file context.
>>
>> -- 
>> Mihail Atanassov <mihail.atanassov@arm.com>
> 
> Adrian Larumbe

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

