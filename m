Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B332A322CB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 10:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA09110E831;
	Wed, 12 Feb 2025 09:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="gvdLfuwp";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gvdLfuwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013064.outbound.protection.outlook.com [52.101.67.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D3910E831
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 09:50:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=i9ou0q6KOCXPU8MSawopaDLOsFESEJoqfTcFr7z/JSO6AdH9SkzhOmgfRV6y7r03YAFUoCfQGxUd9kqJkYVGf/6Y/gZg2aY7tHyJczvMgW7nOf8UcpGaSoGOFVOX0M5uNqQnfYWsZTsd28b0bea+s8nKxWYx2zr66qmrTTePgAt6zYuMRU9UqhKX66y6wUyu2NHFADqbp/LvJACy3lHd4wBXttLmrby26htaIGkoSP90TyFpf553P/rrXwoFlKZRLMwY7LJ9ibMiy/d1E40NfJDcsetWxtOtp11L6EitjNAt7Oci8Quhue8MwDsx++gES4n/cqVDdkYSQKESTv45Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9nnzDSPE+EidbdHEfcVSsL5ckUnh3VMW6wGoOEeprM=;
 b=mihFJ65UpuT/iR/eJrqY6gNLSr72ay5G2szzTvOAwYU9cl/wHyfQIRmk2sSqBfoN6zT5kpscjAxb64h2W6MQ8sApfMNMy98F19kSzrBdy7GeeVyPXg2QRnvSE3SerWpIAcPt4Bt8sMpxB62zGlKqgRpKMhMoa000zU34v/LoJ2HOuU/NfTGjzjSZKxhBCX8Zk5vjifJwaoeFN1+DUrzGDQKj4yKDNA+iHRL50fRKZIXAmJkfXt3m9G+JhoLQohxUWK3fr/x/wJK4vzUaIgtr95BT/lNIhoI+3EnuBl3KXbumbfmNpN0UV5s+q8UZNG9LXrrujHjsjxZRU3GQQmacdQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9nnzDSPE+EidbdHEfcVSsL5ckUnh3VMW6wGoOEeprM=;
 b=gvdLfuwpj62/hiZfqMyDpj9ElpUIJc1P7WaDhLLiqePjRbnztjfUb2hpUIe3Xx+A8+ScpRyfbiG1TCjLC3jPipEVqhES0EtdAU5vcV+5UV9QGPwU/j/zCeDQI0lJj18DbaJSvxzobqBrOS8bEZXf+cDF0Md+aO2mYq30yIebL44=
Received: from DU2PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:10:3b::16)
 by PAVPR08MB9015.eurprd08.prod.outlook.com (2603:10a6:102:32f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 09:50:08 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::b7) by DU2PR04CA0011.outlook.office365.com
 (2603:10a6:10:3b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Wed,
 12 Feb 2025 09:50:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Wed, 12 Feb 2025 09:50:07 +0000
Received: ("Tessian outbound d73f074635d5:v567");
 Wed, 12 Feb 2025 09:50:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6df9c6bf7683384b
X-TessianGatewayMetadata: 4M0JT0e1YttWwI5J1aFwVdVJADMGnyveM9FVPWq063QYidGdnrEPt2aOFUim9c1bLrc0bXgZXOvFC6zWTraRu69MPBTpQhZncTCY6epcfgouGxaQFuttH4eR9M2BRMnsdrice4KmK8NkXTLgu61KsQ2b9vKYnkAItTgeiZCQLRw=
X-CR-MTA-TID: 64aa7808
Received: from L17136468abae.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0A385C2-D2AD-4534-8C08-78AD9C5DD0CD.1; 
 Wed, 12 Feb 2025 09:50:00 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L17136468abae.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Feb 2025 09:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nk4Or2GcAKAziL2Hc6u5tWiAvMYaoadzyGZFPSXYP8rAHhnmdofYkqWLyaqaSSWiMLnoauNE0D24B8Bk+QkBs1Spr1OR+/sbDpXoA9fMME2mYv62N0R+w5PrcdMYd5QftdSq+gIMWe11XFiHcBntVNkQIPVDcAMDShfZb4vbxfbJ+7W0WkoNca7+KPLy3v/E7fLpIJ7B0q30pxt9KEYBiCR2y2p0+8X7hTCbQQLTzRlWQlQ0ugXYgJOwdSzxfEk5CzLPBOzRlo+pdw7BOsKm8j+50vACehxavgJpctGQ69nHURegpcvWlSQvD4ETs5yyEO6vilrKOaeTAU0zwN/f5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9nnzDSPE+EidbdHEfcVSsL5ckUnh3VMW6wGoOEeprM=;
 b=qzkQ+gXyC6CBcPncaJsN8nHAqVVOJ8sIg71Dvl1LZa/FaADHYGus4XxEzDgmHa6JbovS5GG/RJOx/KthRrRMhuxTkluayOaDzznrVHxaxHZ2dvAMx9fm8IDxfu64CUROP48Pjsc4QrqygeyRUMoz4PUQA23DTQWDYR23vViG41f9HjBI2ssSd9ehnCeO+lPJkW+4g2a5U+1RsCqMlFNlwPvFzAZIrGzPZ7WEieRX4h4tsv18c0JMt4+73/RYgaeu0lm/qrwWvkn2p88ZtjvdSMzQL07CGCYsM/vHxVyHDuvPkmH03JOMUWR+4z4T8sDftyFIHyGQOme/IxsbwoEvVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9nnzDSPE+EidbdHEfcVSsL5ckUnh3VMW6wGoOEeprM=;
 b=gvdLfuwpj62/hiZfqMyDpj9ElpUIJc1P7WaDhLLiqePjRbnztjfUb2hpUIe3Xx+A8+ScpRyfbiG1TCjLC3jPipEVqhES0EtdAU5vcV+5UV9QGPwU/j/zCeDQI0lJj18DbaJSvxzobqBrOS8bEZXf+cDF0Md+aO2mYq30yIebL44=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by DBAPR08MB5607.eurprd08.prod.outlook.com (2603:10a6:10:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.22; Wed, 12 Feb
 2025 09:49:59 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 09:49:58 +0000
Message-ID: <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
Date: Wed, 12 Feb 2025 09:49:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Content-Language: en-GB
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
 <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
 <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|DBAPR08MB5607:EE_|DB3PEPF00008860:EE_|PAVPR08MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: f8917580-3928-47cf-7c3d-08dd4b4aa1e9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZTcvc3M5VkhxVjFUcVcvbW1GS2ZjQ25scW9hdWZ6THpQTzNxQ2c4K21aUDhR?=
 =?utf-8?B?cllFZWUrd2FWUG0zb1B3V2k1SEIxdUZ3QjFwSDhpd0xrRDBvVHJMRGlBN3Bz?=
 =?utf-8?B?b1RvTzRDN0c3eDc5QkVEQTZRSWdmOWs0SHBKb0xJUE9Ka3lEc0VaRVkvNG1S?=
 =?utf-8?B?VnZUOWFPQzFrODZrNVhIaUYrVzZaYnVYRjIrejBETzQvREFsSVdKclFsRGpx?=
 =?utf-8?B?cXBkU1ZOTWM5YWk1a0FBQnErWFkyc3BSV2pzR1BBODQ0T2pqT0orZDQ5UlVO?=
 =?utf-8?B?WXNFWGVjck00V0gxUUNpR3JPbnRGdWdpeEp6QTNOT0huTFJERUdNWndONEpX?=
 =?utf-8?B?UzdhczNMTHpMOE43MmkvYmYrbXI4VE9idTl0WTU5Tk9CdzY2UWluT1ZkQ0tq?=
 =?utf-8?B?VzRZQzFHYVFxRVh0SCtwRDV6eEpUS1hMc0E0VTZHZllhTDdhUzhBa3hrVDJF?=
 =?utf-8?B?SGpXL1AvVTQ1WnNrYXBFSmNIUUgyWWt0SnNJcGtMYTUrTVZwNU1ISlNKZjRt?=
 =?utf-8?B?RGNSaER2UlBOeG02WkdvUnF0WkdBS1hCV0dYY3M3QTZjU0UwbXNDb3V3WkVw?=
 =?utf-8?B?LzBKZmJSdFh1N0RMOHJlMlBhSWpIZ1ZGclhDbXEzNDlvUXAvVTNsc0pRc1Jm?=
 =?utf-8?B?WGMvdkoxV0pGQ1ZDU3dPMHRHZ3dNUXlmNmZ4NkEyTndTRE5qa25PL2NIaFJh?=
 =?utf-8?B?d1V3WStSclVoUTd3Mk9ja2xKRkVkdnRVOTd5c0tLR0ZyNVhvOU91bjNGSEtN?=
 =?utf-8?B?QkE0VFBmekZ5OUJxbloyN1NPK3dlaERGa1JyYkJ3RHBiakxMdnFZek9rK3RX?=
 =?utf-8?B?amV1ZlMwL1RnenlPakFKbkNZNytYY2xiV2Z0eGQ0YksvNlZBRURDeHl6NUw5?=
 =?utf-8?B?OGl4d3R4dHZIOFEvUE93NGRZVno4WWdQRkZxRC91cUVDV0ZDaDU1SjRoL2xi?=
 =?utf-8?B?Y1RubzhqVFdJVmJJeEFENnRQQ3dpZHVmbC83RWNFaHhSU2wvWmh4REhsZzBu?=
 =?utf-8?B?NzNNaHpWM0dhRnpmcnRvbi9Ic2JteWsrQ3ZjdFBmK3FXMGZxTXZYOUZBam9q?=
 =?utf-8?B?dDdJOERTNWtETlZKOUlxaWdyUVg3NEJMR1dqSDArVnFIdHBHSWtjTW1vV3Bv?=
 =?utf-8?B?L2VMMU9rOEgvV0R5UDlGbHlPMWk3Tk9YbTNnOUtKN2pDNjFWTTB2TXI1OXZL?=
 =?utf-8?B?cUMyQlloOEhTclBqRGJlcElCTGk4TmhkNmhPUHJHcmxyd0ZmK1JBT0NlTjV2?=
 =?utf-8?B?VzRGV3dNR3dmTU1kQnpDSXBFOWZSMDRhY2dmbVpaT2VGd3Q1K2dZUDE3aG5w?=
 =?utf-8?B?cFpGK3hwY1JGR1Q5VEZ5Z2JsR2lUNTczaWFNSGYzb24rcXVHT0thOFpKTXJv?=
 =?utf-8?B?akpaUG1oY0xCYUVqbUFuRlR6SDhtc3REMkZQZ0dLLzJRdE5mRGlUNTdrd2NF?=
 =?utf-8?B?S29CTkJrcmNpV1BlOElONlpYNXlYaGtUMzRnZ0VWNFpOajNGVmVoTHBkOEg4?=
 =?utf-8?B?VU4zZ0lKVUpBeGlGYzEzbi9lRDFOMXdWRzI3RTFJTGVnWU9hQmhoaDdobkhX?=
 =?utf-8?B?dVIvZHkvNThPS054YmdJOStOb28xZlp3TEpxa0xMZS8zU004VG8xcmtvOWtQ?=
 =?utf-8?B?c1VQclcrSzYxemFEMkRoN0tubTAxbmN3b1ByaVJjWU9hOG5zZU41NU5ZMzJG?=
 =?utf-8?B?ckpaNnhPMklNVENyNzFFYlRaWGlqQnJLNHY0V2srdjhXTWpQcVhBZlhFZHJV?=
 =?utf-8?B?b1QwSlRoMlVwcTdTNVlJOSt4K1NXUmoyTTdTSTVlRktmd1N4dEpSTlZRTUc5?=
 =?utf-8?B?aHZrME1IamJzQjJidWlkVjB4RTN5bmNneEdRUTJYQjU2VldHOFBlOXdUaWo1?=
 =?utf-8?Q?kpf+B/TZEFrQ3?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS4PR08MB7925.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5607
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];
 domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1d339af0-1ede-426f-f647-08dd4b4a9c49
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|14060799003|35042699022|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlowOGxJb2x1UXVINXNCOXBoTGI0Tk5LUHQ1cWVUSUxHakQzaWRrM24rWjNB?=
 =?utf-8?B?bVR0UUs4bzBaTWFIR29DQk8rWlFpNVdwQmJBTEV0Y0tDcVVyZDgvUUhVdjJX?=
 =?utf-8?B?bzQ4dHBYZFBQZ1JHeGVHeS90TDJ0T1RRS2o2OE8zbkxmSzNyc1RsdXNhZUxh?=
 =?utf-8?B?VVczLzA4cEl1Mm1mclRYNHREd1hLTG90bXhERzJVOGNKZFhOV05xQ3RqRGla?=
 =?utf-8?B?MlFWQ2FUZVhrVDFtTEd6K2lCNFZXdVR3eW5wMCswLzdSM1Q2MjVHMVhSdkdu?=
 =?utf-8?B?T00xNVNWSjZzZnU1YVpTMTM2ejViMG10bWNaWEZkcnN4TzlFejl2OEExall1?=
 =?utf-8?B?YUw3b2dvQlRHZ2RWQlJvRDI1SVJvVCtlYlNjRVBMdlRoSUpnQW5iQ2VkY0t1?=
 =?utf-8?B?cVRLdG9Ha0JjQmdmQTNycnppWUFjKzR3TUNMeFJuSm4vWVRiVjJrOGVjRkpz?=
 =?utf-8?B?Qk1wVHJFRUZqWnlQVEZCcDBpL1J6Zmg3N0xzazlPKzFvWUdhRDVidW1XSE5y?=
 =?utf-8?B?SDZDbDlVYWtoYWpIa0p5cHpHN1VaMVhLRDlwL0dzRG13RW9XZk5lMmp2dVNB?=
 =?utf-8?B?RG5aRnhnMWFwTm45WlJuck53Smo0bUVKNzJpVXlkV0xkcE5KZ2ZPSlVtOTFZ?=
 =?utf-8?B?UVRybzc5VTlLckxIMVp5V0dHN3ZmRWl0Q0NiT21pcmFKSGJrMjF0LzdMT3Vm?=
 =?utf-8?B?MUFHWFhMODBFSHVvNC9KdUtIZE9zVFhwWHpwT1ZKSnQrYms0L0NwR1VCUC9P?=
 =?utf-8?B?cFFFKzhFbjJkNjBSb2QzeitIUmdzejRpblM1RzhZNFhXemhPc1BFQkFTaWFr?=
 =?utf-8?B?amc0SWZOZ1FxTVE4NXp3ZEFUMTNDVXhoZHNvSmc1RFVSWnBYTWJoazlkcitJ?=
 =?utf-8?B?NUx2MzkyVlZkdGhsWFZFZXJyZG5xbW9XbHAwaTZlWjFaaE5YZC9EZWw2d2Js?=
 =?utf-8?B?M2szZExsK3p4ajluYmlLZm9xOFFzdzRpMDdnT1VrQUhDT3hlWnI5cFM1TXdG?=
 =?utf-8?B?K2gxVUpLaTU2dzhUSFNKU3RYemNFdGMzbmlUTjJMVVMxS3NabHZWbHRCazhU?=
 =?utf-8?B?amwreE85UzllMmFqaHFQNjFQV0Uvd3c3bGdaYmFzUXI2ZzkxQ2JkMHpLL0Vw?=
 =?utf-8?B?TXVuTTBCUlVGZ3NqUjdicmo0ZW42UEFlQmFqMmV5OU9mRzRCR281aUtRaUR5?=
 =?utf-8?B?SDhrSVhhaURmQjlMWHZNSmo1YVNGa0hBNVN0OXpHNDQ4SThYNWhHSEFVbGZk?=
 =?utf-8?B?ekNVcWpVays2NkpkSEVVdkl6ZjRaSEhSbk9OT2NONzdQOFBqT2ZITGppOGU1?=
 =?utf-8?B?NC8xcHhEZC9KSDVsbmZJY3h2bmI3V2FhbnFqMVM1bGtKT2JkMkNtTkpYYk93?=
 =?utf-8?B?Z2xZeC9rMmV6UUR3NUlpcDZKYVJCcGR0c3R3dHlKTnlRdzMwT1FKTkMwKzJm?=
 =?utf-8?B?NUkreU5DY0NxQW9oYVppdlllUDM5SzFCdjQ3VmJaTGVpc3VYWVJvQkgzNEdj?=
 =?utf-8?B?ZlJLREQxYXJPUndqV2k5WlR4MzB0QlhtVG91QzdLZ0dLRzBLeTFURStlT0RI?=
 =?utf-8?B?N09wNElQWTBXbnZrZDQwWC8veHREUDY1NUZyNWNjb09GUG1mcDI4TkJ0SjBH?=
 =?utf-8?B?MUFhOERlOXlwZTExMzdBRFpXb1hvNGtBV2ZhMU5CNjVvamNhMmtFalNINmE1?=
 =?utf-8?B?UUdKZHJTbG5JVTJCR1JpZFVjUDlFYzl2L2lNSy8zc2lPVEJVaitlT2VzVTdS?=
 =?utf-8?B?NSsweUVHSTIrZHNLWVl0UjNTbVhvTDAwL3h0MGVIM2lOU0tkbkp0aGlOVGds?=
 =?utf-8?B?Q3gxRTB5TDNKYmc0ZXhnQkxPVTdmY2dBbmY4cGtHeG5BSEtFUFlIMkhvUEI0?=
 =?utf-8?B?a3ZYczk1RlA3K2RZcGhLL2l3SnVoSDBQNHpNb083VXVNVS9DSmlDWGpOVFkv?=
 =?utf-8?B?cm9EVlZaeWtMcU1KZWlRbmd5K2VDWDJQVXVWWlJ4YzFXVXNBdjE3dWEwUGpW?=
 =?utf-8?Q?6eWsdvayRysIwar2omFa1D9wFFzjHo=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 09:50:07.1637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8917580-3928-47cf-7c3d-08dd4b4aa1e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9015
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

Hi Nicolas,

On 04/02/2025 18:12, Nicolas Dufresne wrote:
> Hi Florent,
> 
> Le lundi 03 février 2025 à 13:36 +0000, Florent Tomasin a écrit :
>>
>> On 30/01/2025 13:28, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Thu, Jan 30, 2025 at 01:08:57PM +0000, Florent Tomasin wrote:
>>>> Introduce a CMA Heap dt-binding allowing custom
>>>> CMA heap registrations.
>>>>
>>>> * Note to the reviewers:
>>>> The patch was used for the development of the protected mode
> 
> Just to avoid divergence in nomenclature, and because this is not a new subject,
> perhaps you should also adhere to the name "restricted". Both Linaro and
> Mediatek have moved from "secure" to that name in their proposal. As you are the
> third proposing this (at least for the proposal that are CCed on linux-media), I
> would have expected in your cover letter a summary of how the other requirement
> have been blended in your proposal.

Just to be sure I undertand your suggestion correctly, are you
proposing to use "restricted mode" instead of "protected mode"?

In the case of Panthor CSF driver, the term: "protected mode" refers to
a Mali CSF GPU HW concept:
-
https://developer.arm.com/documentation/100964/1127/Fast-Models-components/Media-components/Mali-G71

If preferred and to avoid confusion, I can remove the reference to
"protected mode" and "Panthor CSF driver" from the commit message to
focus only on the CMA heap changes, which are more generic and can apply
to any type of CMA memory.

Note that the CMA patches were initially shared to help reproduce my
environment of development, I can isolate them in a separate patch
series and include a reference or "base-commit:" tag to it in the
Panthor protected mode RFC, to help progress this review in another
thread. It will avoid overlapping these two topics:

- Multiple standalone CMA heaps support
- Panthor protected mode handling

Regards,
Florent
