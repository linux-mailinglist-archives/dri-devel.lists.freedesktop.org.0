Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907D3B452DD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B01010EB42;
	Fri,  5 Sep 2025 09:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="H+rFz2rx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="H+rFz2rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013061.outbound.protection.outlook.com
 [52.101.83.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919ED10E2CD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:18:42 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a45bGYcTnd3HhivYtpPB6E1cyl8Jx98tLcUZBDgBBIOf6hN6vHCosnzEea/O1TGX82q4ZmYga8jlAuBG3sRgp3bslsc+ZtQAukK/ySgkUQPOcHJJhPrnv2aK1MXCvbhWeCkZOYfE1U1JY3MOf3rVV2ViNAAcDN16IltzwhVrqZui0RCyCeOCRo/D9U0eBGD5+I+n9eZyOAOa2tZq03I9vsaWw4yZXK2kY9eRUJptzu6Gu7RdfHe4/9KYITu/hEUu304feNAFx+pZU7Br1sEdZmnPH71hV93Yha3+ntBA7mRoY2TOKYVE4yX6mxTURH/agqU2/l+4ouzAktkbqlWUTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g6Gn/EI3OVk4sYFb74/2KmXNFG/CKJGwIEgR3TZdzw=;
 b=wkw+rgDm7aYyKHwtLIN5ykc3IccV9GfTkXAHpJivqLjAY/VYBMCeDArCSXklnxLTYcXa+OpGhCH6tX1MiLlF9ibUrKPRxXQYlKGG/l4aTZA2WLm2UzA3WXjRF1zUUYsi86b50oX0IxdnLt16EoCY3ZOdMatu0wYrnEtAHE5Psy741+KF2taCdk/bt+qGBFtInvJnUwv2RRWoictmC6x0TdUwCiIZdwM5+uCq2IzCFisrYeDgrRdBqIBk5EoMfPvALS6UKISFHDU+0eakTzxQ74tPaiUtQIIj+Mk9JSYy88DEIdk01BhxZ23Z9UpqtaH4XM2TspA8L1N6+PKSy48UFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g6Gn/EI3OVk4sYFb74/2KmXNFG/CKJGwIEgR3TZdzw=;
 b=H+rFz2rx+TzwVODCnjGfxSHoopLJT5dE0zddGM8QR89KWEhavCPt+AsE5DxCevc91KKYay7mTBQ+A49BotU+2LR1NhqZIek3uA8v2k1zbfzHKulsjgYTDXRgRRx8aj8zobjhgxQSosrR7Ehaz77kTGkknbqaO5wZG2SD/ouJqBw=
Received: from AM9P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::9)
 by AM8PR08MB5651.eurprd08.prod.outlook.com (2603:10a6:20b:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 09:18:38 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21f:cafe::7a) by AM9P195CA0004.outlook.office365.com
 (2603:10a6:20b:21f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Fri,
 5 Sep 2025 09:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.0 via
 Frontend Transport; Fri, 5 Sep 2025 09:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlAObk/Vug77lI4MKWsD3bRlignfBx7yXag5V0D5ibkWa9/UKtr0cvzEgp9pxtRKqG7oKPAOGhJJeDID0NPXvnrvTnqSzsuPEEzteicNKUOJSqH+gonuTB8IcmLKHwT/g4IHvz7kvHMIeKma2IgZR2VMD3pQTzouHGpZYUMnv/PRlm3rINxOTHseaykW3Jg8arIlrpanMqagSH0CRicT1nsZU9vpo0WM5kg8oksGl98tFQrVvyplyDqlfNS1jg09jbkz7u2EQcZY8fOcm26dacWlV7FMDBd6aLnqdtX6ImRKE/hW3NMl40c2+eGWtEB6F8IcnhZ4iVIvIUr6kAjVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g6Gn/EI3OVk4sYFb74/2KmXNFG/CKJGwIEgR3TZdzw=;
 b=kmh1LHcErpIjedgsfQb5lNd818Fj+NQiTc7hs14d9Ota00z8Auht5cmwkUSIl39IiSBRVf+NIjO/zK1ZP8IpCh4PQ3OT7shLfvGMMtgYuyjat8rl8vUQurNCjmsMqZhD9GskUd7v4kss82rKuGn8x5d8G3iZbfNQkpgdunWWcnmKGK6CmgjvVAEaM+A6qC21x7glaZzKVg2gAPic3dvpx6ceu+r7TtHrjC7Y9YEW3SLUKLLTgerIUF4fDh975cAC7huKS8Jwcgb7C0M+6FUJsnlcHv5D5SuEqk+tOoC8HOP1jVBwhpRzT0I1iNKnwXL0G+1f5JgB4yAGCCiAP9IRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g6Gn/EI3OVk4sYFb74/2KmXNFG/CKJGwIEgR3TZdzw=;
 b=H+rFz2rx+TzwVODCnjGfxSHoopLJT5dE0zddGM8QR89KWEhavCPt+AsE5DxCevc91KKYay7mTBQ+A49BotU+2LR1NhqZIek3uA8v2k1zbfzHKulsjgYTDXRgRRx8aj8zobjhgxQSosrR7Ehaz77kTGkknbqaO5wZG2SD/ouJqBw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by GV1PR08MB8180.eurprd08.prod.outlook.com (2603:10a6:150:90::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 09:18:04 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 09:18:02 +0000
Message-ID: <39d3363d-dd49-43a3-b42e-a434ab6c347e@arm.com>
Date: Fri, 5 Sep 2025 10:18:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/panthor: add initial mt8196 support
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <20250903225504.542268-3-olvaffe@gmail.com> <20250904080239.779b5e24@fedora>
 <CAPaKu7RdpEtwqDHrjt4HJOJVYeRjUa38Sk70=6dD9WmXYtf_jw@mail.gmail.com>
Content-Language: en-GB
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <CAPaKu7RdpEtwqDHrjt4HJOJVYeRjUa38Sk70=6dD9WmXYtf_jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0202.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::9) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|GV1PR08MB8180:EE_|AM4PEPF00025F98:EE_|AM8PR08MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: ee28db91-d4d2-4c52-feda-08ddec5d31eb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TG5FNEZMeDhCSEgrYm5CVnZYSURVMHdvenRDZW5tNmhSZWswKzV3NEt4cGtE?=
 =?utf-8?B?OEwxOFF6S2IzMDNNcCtHU1h5K3lvZ091eWtZNkp1aDVQVktNZU82WXhRQXFx?=
 =?utf-8?B?V2diVzRyeUtBWWI3V2RGSGhwMjNpNk9qK0YxMUdSZDhIczJzS3hqYUdWeG12?=
 =?utf-8?B?aVp5WThqL09VVUt5M0dhRXU3N0F1WDNQWEJURlg1SmduMlk4Qkh3NFVhNWJv?=
 =?utf-8?B?RUk5dWQzS1JVamszaDdFV05LV0d2WWxWUjlvMldFdHEvcXN6MGdZdmd6NGNF?=
 =?utf-8?B?dzNOaWxQWnNTTER1Ulo5UGdFMlJjbVdpTUVoWUxKRDNtUG1DUlNvQ3NQa2E5?=
 =?utf-8?B?UTRUeVJyYlQybDl1NnRDN3BWODgwYUd5WGtObElYYjJoUUYrQ1BNdFZ4N1lo?=
 =?utf-8?B?bTRkelR1dnFUV3lCZ2hPaHB3QklPT0UxTW0zejMxUSswL1AxVm92alNBV3Y2?=
 =?utf-8?B?U3c3OHg1SG1SdjJveWNpWjkzOHBaTVFnM2luRG5ERVNGRHZzdHB0dG1iNTk3?=
 =?utf-8?B?U05hSXJTSE90NXdST3R1cms2Mi9zWi95aFRITGE2YUZqQUZlYkI2VlJzVzJo?=
 =?utf-8?B?dVprZ1RMVklIS3dsSzV6RG8wYUU3a2tZRWVRYmVFUXkzYkk3Q0ZYU2VWQ2Fw?=
 =?utf-8?B?MHc4TWtxRTc2VUNkSTBNazZqN2dteW1IS05OME4yK0JNSHE3VWJ0bSs2N3Z6?=
 =?utf-8?B?YUVrVzBuUm0zdFFhQWM4WU9aNXBHeE9icEt3eXJxMitFMFFFWnJiZldkbXJP?=
 =?utf-8?B?UGdvU056NmEvdWJiL2R4OFBEa1NIUG0xOVo1VlRpdFdjbHhzVTVFOHR3WXNt?=
 =?utf-8?B?ejlHanYvNHliSDJhblgwTUxkbnpacEwvanlEalpCN2IwaURjZ05MejlENFVP?=
 =?utf-8?B?U1JoMGoxdDBXQ1dLS0JJMnNxYnprZlFHVUtnNWRRUzRLM2Vha2U5bjJnR2tH?=
 =?utf-8?B?eGlyaVFNUkROcVlqUUFWNERaenlKVGkyWnZBV21lY3BoeFBDaDJaSkorOWZm?=
 =?utf-8?B?bForcVY5U0hEZ09JRGxrbmFMTHZQSTRqSHRSWVBiTHV3RnhLdGtUUDRhSGVJ?=
 =?utf-8?B?M0ZFcHdSbWtrbU83ZWhLVC9hbWp5SnZxUVArQ1FpQlM3dG1sUlRta3Zuamw0?=
 =?utf-8?B?YTdlK0IycFZ5WjZTbnIzSFRmbHVva25JRDZXVnZ0NjZOclZBZmtPcmk4RHQ2?=
 =?utf-8?B?T0pJSVJob0pLUHJvQ1U5eUxQdjRGSlVYZFBxaS8wWlVvRFc1YWJyUWN4ZWQr?=
 =?utf-8?B?SUllVzAyak5rOGNXM2ZYVVZxb2JGSlVsdmN5aFllZlJrZC9BVzhZZVNVYXV0?=
 =?utf-8?B?blFhTzZOUk1TNjFkYythb2FlclJNMHhUUFc2amZmSVpCeWtXZHpHOE1WWU1s?=
 =?utf-8?B?Z2lCVDFJOW1IQm1KWGlyOXNpVGh4bzIrdzdsNGo5OWQrQkxtRzZJbm5CaWJG?=
 =?utf-8?B?WTFVbTB0VVAyblByYkJGVlRBMU1FVjUxeTF3a0N4b3VSaC9VQmEwajVVQWll?=
 =?utf-8?B?RVBEK0l2d2FKeVZySCtqUHNTdFI0RFJTWFdVWEtOaVdvajl2d3cvVU9sRGgy?=
 =?utf-8?B?RHlJYWYwZWsrQXI5N3NSUm9ubWtqSzNpNUp0U2pvcHJ0UUF5MEgyOTFoWVI1?=
 =?utf-8?B?NDFUOHk2MEVoYTdTL29vaG1vUkpoNE9RU2ZoZXVZK0tCK2UxdjBrSHhKSTNL?=
 =?utf-8?B?VXhHSE9YbE5wRTh5aG9YTFVUeG4zSEtOZURQZFhtVVRQMCtXT1I4bk5sUFhp?=
 =?utf-8?B?OHI3YXhpS0l3U05jcEdreHZRbm1jMVZXSjdlaytBdDdURGI2S2lYaW96K3Zn?=
 =?utf-8?B?VjJmNVRaNHNPQ1dhVGFzM3VpZEYxbHJKd29DaXdZMWZtZG4wWXJiOEhMZ1o0?=
 =?utf-8?B?N3RMb1hIVm1yNFZaTCtxanJlQlkyM0NjbEpFWEZ2QzllSEgxbEp4NEVKaStq?=
 =?utf-8?Q?BuVBAFRnx/I=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS4PR08MB7925.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8180
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8c687313-a3dc-4367-e568-08ddec5d1d62
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|14060799003|35042699022|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFhwUi94enUvK09RN1NxZ1NkWThkNDVyRytsU09aU1NXRmw3L3g0MjFjM0Fq?=
 =?utf-8?B?cnBIdXZkSnZUZEVlbWU1SEVId3JXV1hMQXI1cCtOaGRiRGJnbU03TTFrbEFa?=
 =?utf-8?B?MWsrMStHUEhqRzc1eWNKazJDYlIrRGNCUTJMT2lFc3daZVF6ajlkMkxiUWZQ?=
 =?utf-8?B?cU1tQXpvM0hrQy9pdWt6UEVHWEZSMkl5RnB5QXFHQXljSWNvcjBQcHN4OFZU?=
 =?utf-8?B?a0RpbFczMmRvRjNlMG13b3JjRWZ0VXVUZWJPMVdvMnBzNEczZjljWkw1bGE5?=
 =?utf-8?B?YTVEN3RWUFVLTTRrZDVyd1hCaTJiTmpIL0FDdnJmTGZDeXRuKzVycEFUWDBC?=
 =?utf-8?B?YW9Ud1laVUZqSWdKQ0dmVkhjanRta2tPZDg1MmV4QmtjMWhFMThBdFo3azN1?=
 =?utf-8?B?ajVXYm9IcGtldGk2S2luTHF5MHFKUC9WdE5vVis4ZjZYRmgwdTFaWDdtNlBJ?=
 =?utf-8?B?aXlBTThGYk1Bb3ZIam11SnFXVzNoT2EzNC9TdGJVOTBJRzIzRi8yem1QSnl6?=
 =?utf-8?B?b245R0RhUnYzRHZ4VEYrdFF1QzFzcXI1dER4M3h2d20yTFVCVVRGZGpueUdu?=
 =?utf-8?B?R25JSXpIMDVlMURmTmFKVndTa2QvZDRkY0NHQVZaMDg4K0dyR3BMNXJ5K28z?=
 =?utf-8?B?ejA3eVo5TnN1YytBTmhpUmJ0NnAxMkFFZnllcjFaUTdCQjArY2h3Q1Zad1RK?=
 =?utf-8?B?dFRTaHN5WmlJUnlPcHg4OWNTZnVxOU1iS1pUMCtBSnZKRnZqYTkzVWlocVM1?=
 =?utf-8?B?RUk5VFoyY2orUjR6TXBaNFQ0czVEYmxna2hpMHFJcDdzL2pIQ3NrOWdwcFRh?=
 =?utf-8?B?dllzT015NHJwTktNb3V0eHhQMDZZZjhSQ3YvMEZRajBvME9ZUENwc1djeHNH?=
 =?utf-8?B?OW9kQ0NYOGdUdUNCYnQ1YmtJeW9ibGtIUWdZRHR5UXl6aTBZblhPWGVRazdP?=
 =?utf-8?B?YjNRajZQdm1rZWk0T3d4UWdKaGJPSEdjb2NWVytobE1mYmg3ZWRuNlRMNWYv?=
 =?utf-8?B?di9naVh1d2VjaU5qSU9QT0dIeHVFZ3VrdXBvc2FBdEluakxWUThiTlRSc1ly?=
 =?utf-8?B?UDQvMzV4NlRZL3JoQnVsRFlqWGNiL0VrbEZtcFdQVG44emx3dzVBa3M3bkFU?=
 =?utf-8?B?b3Z4T2VoMWhvbFdteUZBZzUrNXM0MVBZZldleWdTWVI3VFpCQm4rOUVWZHBt?=
 =?utf-8?B?dElFb3QwYjBZL29FZnI2NkxYMTR0Znk2OWRUSU5JSjlNSHY2bzZLeGNkVS9C?=
 =?utf-8?B?ZGxEWldsejZUM0Jjb0ZWSnFOcHVMS00xNG5zLys1VWllNzJKdUc0c1UrNkJN?=
 =?utf-8?B?SUl3NzZCSUpPWlNOT2JtOEZGMnNzaDdocW11eFlXOWJXaGNxNEMyL25UQVpj?=
 =?utf-8?B?NWVYcXZ5aGVjY1Z3Z05MTTZCbHBhMVgyVXFZalJ0Wm51VUZDUjRrZXQ0MjhO?=
 =?utf-8?B?Z3ZyalU2cGZJRnNYdDFLcCtDUzlqM25BRDRwaVM5WU1HUjRWNytmZlhxM3pR?=
 =?utf-8?B?SWVNc3VFek9qMFhRUUFZWU4yOW1FRU1RQUtsSXNSZXY1N2VZMG1VZDVJMDVp?=
 =?utf-8?B?emJISFRnK3MwaXVZMnZuWEtYdzIxQklwQ2RBZHJwTitub3UzMVFzdWgwVmVi?=
 =?utf-8?B?dUhib3BPbm1KYWo5ektURmFLMmcyUnlub0tIOUtzSGlsSWEwV3d3b0dPNTJW?=
 =?utf-8?B?VWtvVWN5ZytkaTRPeVpqdWxydlRvK0FiKzUwR0xmdmxyZk96S24wVjhXZFdy?=
 =?utf-8?B?UHRDSmtQL2c3ZnQ5YU1peXhuTldBajEvblYrdE5abTB5U0cxNE03TUZjVEtN?=
 =?utf-8?B?RjFzaUtlSFRxakxwUnNTajZoQXp1c0NHdEQ1ZTVFWXNBMk85bUxGWFZjRDkv?=
 =?utf-8?B?dUpKYzEwWlNuTk1MZUx1dzlUeDJpcmIwWDlGVnl3N0NYZG9oR0hqaUg5V25u?=
 =?utf-8?B?K0wydXZGZDd2ZERrVjJoQ1RrbUFvSlZIdVBraWlDQnFVSU52RW1za2hxSnc1?=
 =?utf-8?B?b2V3ZE9MQkM0UW4vQ3IweWdvMTlua041aHptaUM3SEpSaXNMc3NSb3RqQ1JH?=
 =?utf-8?Q?du/yiE?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(14060799003)(35042699022)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:18:36.9094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee28db91-d4d2-4c52-feda-08ddec5d31eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5651
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



On 05/09/2025 00:06, Chia-I Wu wrote:
> On Wed, Sep 3, 2025 at 11:02 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
>>
>> On Wed,  3 Sep 2025 15:55:04 -0700
>> Chia-I Wu <olvaffe@gmail.com> wrote:
>>
>>> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
>>> index 02db21748c125..75e92c461304b 100644
>>> --- a/drivers/gpu/drm/panthor/Makefile
>>> +++ b/drivers/gpu/drm/panthor/Makefile
>>> @@ -12,4 +12,6 @@ panthor-y := \
>>>       panthor_mmu.o \
>>>       panthor_sched.o
>>>
>>> +panthor-$(CONFIG_DRM_PANTHOR_SOC_MT8196) += panthor_soc_mt8196.o
>>
>> Based on the stuff you describe (ASN hash, core mask read from an nvmem
>> cell, extra clks/regulators?), I don't think we need per-soc source
>> files and per-soc config options. If it becomes too HW specific (no
>> abstraction to make it SoC-agnostic), we can reconsider the per-SoC
>> file approach, but I believe it can all live in panthor_drv.c for now.
> That's about right except no extra clk/regulator is needed.
> 
> gpueb on mt8196 is yet another mcu running on its own fw.  It can
> provide clk/regulator to panthor and no change is needed from panthor.
> But it can also do dvfs autonomously, in which case panthor needs to
> be modified to make clk/regulator/devfreq optional.  I think the
> latter is where Nicolas Frattaroli is going and requires more invasive
> integration.

Hi Chia-I Wu,

I beleive the changes your are proposing need to be treated as 3
different features:

1. Handling of ASN hash
2. clk/regulator registration
3. Core Mask control in Panthor

* For 1. since it is a GPU HW property, have you considered
handling it in the DTB as HW quirk?

Pass the value of the register from the DTB, then Panthor
driver applies a mask to filter the bits and then configre the HW regs

> The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
> be cleaned up and upstreamed separately.

* For 2. Have you considered making the GPUEB MTK driver act as
a clock/regulator supplier?

Without a clocks, the driver won't be able to support
instrumenation.

And without a regulator or clock, how will system/runtime PM
suspend/resume be handled in the driver?

* For 3. I think this is a more complex topic and other vendors may
have different needs.

At first glance, `panthor_soc_data` does not seem to be sufficient
to cope with other vendors.

What would be the protocole used to communicate wth MCU?
Can the MCU update the core mask on its own?
Will the core mask change at runtime?

If the core mask is static, what about adding a DTB entry?

Kind regards,
Florent
