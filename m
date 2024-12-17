Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F49F4983
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2567C10E417;
	Tue, 17 Dec 2024 11:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ANgbl+nL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ANgbl+nL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2070.outbound.protection.outlook.com [40.107.247.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2A810E2F5;
 Tue, 17 Dec 2024 11:03:32 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ouXSnVm9/ZFA5W1LLjv+urphc5kMAl2ApfhrOuqz43bZnEC3chkk4rR7WveVldcGZZSkzfbw7We8HpsUnAA6v08DCizVabwSJBcFuzF+gAst1rFKSGkwYH48nMUlj+B89X8i0EcMuwJH9pgM/JVYk7bke6q4EQOuPCXFu++wEVVYQ6tXB/HkVZ1WLFga5Pf7iv1CTJG5TQt+JbVgZMIc5K8VBTgVmXd986TKeHcpVwB+vwkE8JNxZeVF3YIzmdFrGmP//Q5HmiGRYMSIYSTch0xbkIwOIXkM5emL+km2IwZa0akJydAzBHOquSR46D3qQMDaL3upnsEdGFa9NfU9Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfBnXuY7ZRCIueh4oCrULVLGtj3srfbzX/rfWttdKCI=;
 b=uBf2uhfI7Bp8muQlej0qtd9l6noF7D1Bu6xkrpnqyGsiHLLOrj4ynFAAXfMiT041+yn3rs6xlRsBw9QaCKjnwlN2UhtstJzAwsYgd7l2rYIttQoYM/m4bnIy1dOS6oX1J25YGk0OFhcdg8nzPJqCydh/urtNsQxWnpuk9MeWv4CrN9O0x3NwgauPLm9QNInHJRcXRYCpk93wbuEjRmJ6vm86+8KHykyiH73wczWG0lhLW3nVRDPGUuzjb2R1vwXEVkWL+WkmsfkUcb01s8s65Xv0VXGbvG8g2NEMTyPANG8XqT8EPT1iS4VBTybB0nEHdspfJQg46HMjKT+HKxHK3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfBnXuY7ZRCIueh4oCrULVLGtj3srfbzX/rfWttdKCI=;
 b=ANgbl+nLhDR1RqdUptWTdH30UJ18cHoQXnyypswua72QwKmZcCm5WC66FTjatBrVQhJQbxI7wrIszRwCGj4X0D+1OgdJHqyx9SiKN12LBnCxURzz0OahYGRskaYnUUlMaIvjmItRY9KDEvCwStxJLi4MEPXGUcG6JGHDUI1KeN8=
Received: from DUZPR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::7) by PAXPR08MB6623.eurprd08.prod.outlook.com
 (2603:10a6:102:155::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 11:03:26 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::b) by DUZPR01CA0056.outlook.office365.com
 (2603:10a6:10:469::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Tue,
 17 Dec 2024 11:03:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Tue, 17 Dec 2024 11:03:26 +0000
Received: ("Tessian outbound 31ccf6f54eae:v526");
 Tue, 17 Dec 2024 11:03:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e14ace62f703f6ee
X-TessianGatewayMetadata: utJVIVdK5BgDOeqcWyO9J0xcc3uo6SKnqQvdJavuYMbxK/IW1HnYF9KhUWNwQC3wfNYctOtBfjrJXza8KJq/WDGD3SIxSCJ/AMCb7VRspgB9EfH9SZU5eBdq12PJhcP0hN/BSUVQMnWR4ertjmiZVs96omHsM52h8nm8y8Jn5UFVxOGuOew83T8voHZWMZe+
X-CR-MTA-TID: 64aa7808
Received: from L06f0cdf944b9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2852DDE-1B15-4049-AB95-BF3568CB3889.1; 
 Tue, 17 Dec 2024 11:03:19 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L06f0cdf944b9.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 17 Dec 2024 11:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFS/WMzAtLyfwLvA0be+RO4DmWddoyVxodkLctCcQAL8jcitIVkol3koT7ISMik3Y3wNA6oEGIBD1qNvrdnXYfeGJg2p1Ikmk5Gh9et/lpDQdJJXiRTVQlp+0v6ep5I6jYhk8LA9J5W7DX9/e/KrjLnlgnMEXIloKa4+exUAsI5t9nrZjvTXRkd+pA5hxsFQNnQVqLEQui/OJ6uyiwxC4SbpE25t43v2TfWAyJXtCHM2/0nB5DI0HbBuowIV0EZSPkv2gNc10T4xxOGKtLT+bXW1F6SKQjotZyBcrZl9To0ByN8D+PoDorXXj0rvQ+Q4WU/IDQfxxAgxop3ID2tFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfBnXuY7ZRCIueh4oCrULVLGtj3srfbzX/rfWttdKCI=;
 b=h5VTsi/r5v7EGestzvQHFx7Lttc/E3GStAZb3Gvuzd1SSHYX3JdJQZXVF9DZBwPUUhsYRc7tb44l/KNFWIRXTcFHCocW9SDea3kF+2qsH2UxkGWlEBAHW4BtxZSJ7SSsnACLssLyxSYM3m3CzvgWvbC0cTT6CqIGJ1ZI3salm/MegT4Gsj89BXGrrCZgVBmyrlfK4LuMQUrj7narzqRlUQqtKoCcwVhuiSj8oxWea36PJg6jeB4wc9u8nvYZFEuz+s3laCqvapBNVvSpJDlBHW+QHLAJJJ/rbl+pzCZDH8jDVEwuCCf37Q1E4vjZHjyz3ZN7SfcF69zMr7zbERjpkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfBnXuY7ZRCIueh4oCrULVLGtj3srfbzX/rfWttdKCI=;
 b=ANgbl+nLhDR1RqdUptWTdH30UJ18cHoQXnyypswua72QwKmZcCm5WC66FTjatBrVQhJQbxI7wrIszRwCGj4X0D+1OgdJHqyx9SiKN12LBnCxURzz0OahYGRskaYnUUlMaIvjmItRY9KDEvCwStxJLi4MEPXGUcG6JGHDUI1KeN8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com (2603:10a6:10:404::17)
 by PAVPR08MB9793.eurprd08.prod.outlook.com (2603:10a6:102:31d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 11:03:17 +0000
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895]) by DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 11:03:17 +0000
Date: Tue, 17 Dec 2024 11:03:16 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
X-ClientProxiedBy: LO6P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::6) To DU0PR08MB8563.eurprd08.prod.outlook.com
 (2603:10a6:10:404::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB8563:EE_|PAVPR08MB9793:EE_|DU6PEPF0000B61F:EE_|PAXPR08MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: cae4f819-04e3-4e7e-171d-08dd1e8a6e9c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|27256017; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?djZldi9wak1oUk1hRUxvSm9kNWhxZDRBS3VyK1FaWWtRYkFnUmRBM1dmQ1Jx?=
 =?utf-8?B?dXJLaTRXNk5ta0N2QkRFRGpPbHljVlpTeE9IZk11VUk0S3RQanNSUUY4aWps?=
 =?utf-8?B?cHdtdEV6YzJKWGZPMW9kYkZuOW9GOFU4ZVN1ZTllWE1JbXNjUEpPaTNKOUpR?=
 =?utf-8?B?SmdUSUdUc1llQjh1UUVBa3NGL2o3dkQ5R1YybjI0UVl0MGJrRElmUlI1S0lP?=
 =?utf-8?B?TWszSmk2SXAzMTduZzhHamJxcGNoRG83MHNYS01POXhkVEdDQVFvNU5GcHBt?=
 =?utf-8?B?SjhSK2VwcTZrRXlUVlhsdEFjNVV5L0JIU0U4aTVlUk5ZU3pVamtDbDVwQ25W?=
 =?utf-8?B?OW9IbVpJbXhZSG1DZ0ltUDlTSkk0d0NUTEZTN0NxYnBnMzJZRTFCS2xzbzFL?=
 =?utf-8?B?blMwY2JzNEp4N3grNit2NG5RMmpSS0UyNG9zZ0c1eThWMDZhOVBZTWtSVFdT?=
 =?utf-8?B?YzdrblpJUG5Zeml3cnp0U2FxS0Vmd25aMjgwYUVvYVg4bDdRTXd4QkV5N0J0?=
 =?utf-8?B?Y3FBR1o3OHM5aTRTbnV6dnFKNzM4NE1Jb1A0L1hodDZOYlYxN3pmZVZTOXR5?=
 =?utf-8?B?RGRURVppeU95M0pLNkRNM2Q3YkxTSGJTaHJVS0FOVFhrd0pNVGVSUDVQcTBK?=
 =?utf-8?B?N1NrN21lMi9sUStYWmRNT0Z4R294VnR5djU3K3F3bW1mQ25YYXZEeXRuNC85?=
 =?utf-8?B?aDArZU5mWHpWMDVGdUFIK0JJdVNTdzB6K3BqRzVWNGk2TFhzSHBMU3RlSWMr?=
 =?utf-8?B?cWF1ZFlOTWdWMCtwYXpjMWp5WEJyVzZCVkl3N3FZT3kzS0VZRkFZei9BcUFt?=
 =?utf-8?B?aXA4TjcvZTY2RFRoVFhFY0t2S3h4U2RPYS8xZnd5dmJHTHBSWjVWWWRjVzR1?=
 =?utf-8?B?ZzBDYmd2MFBEb3dYM2lMOUpydStUaVQxTHJ5aDgvWUpYR2dHUEFJb0lrYnBD?=
 =?utf-8?B?YW5xWWxld2J2Q3VKTnBiS1FWNHpKMzlHcGdJUDZueHpYczcyNFN2Y1BJRU95?=
 =?utf-8?B?U3NORklhN0V0Vm85OFN3S3NDa3h4WmtaSGE3MFhaVmNINGdOUDJZWHVwaDk0?=
 =?utf-8?B?c0FoRHVtNVlKdnppUnZUMldsQUNDR0RNRmdBOXBMOG1yVWc4anFWS2tUaGZS?=
 =?utf-8?B?Q01nTVZPdmpuMlpSU3dyVis2SktsbE84U1BYRElhV1JKUEdzZFhkbDdvYVB2?=
 =?utf-8?B?OXFrOFpJaFVoWTNDdjloQ2xFK0Z3RlBQNDljV3poanRhS25CYU05YmN5L25T?=
 =?utf-8?B?SzB2dVllRVdOZmhrK1MyYVJjYU1sMjJyTEhwUVE4cndJTDdNNEEwQVMyc1JU?=
 =?utf-8?B?Q2tqVHIyVS9rMmhNK3R0QmdjcUh6TWU4OEpVWkZuUHdPQ09mbFkrR1U0NEFw?=
 =?utf-8?B?WTdtU2xtNXZmN2REdzcxbUsyWm9acXVWRThySmJXQzdxZk1BaFY5VW9talBw?=
 =?utf-8?B?OFlqeFhZMG05a2lxZFZIalBsSnNzZ2pwK1pNeTRRSkk2VDBoWmM5YlZkWFBu?=
 =?utf-8?B?eG5lc3dnaTJSOVJlbjVPYlg4RXY0anRJMVRoVVhKa3NVbmhMa0E0NDV3eUEv?=
 =?utf-8?B?ZUozbkRvYkt4SlduejlpOXgxZ2ZzT1dQS2Rmdk13UEJnY0l3cUJtTmFrL2hk?=
 =?utf-8?B?RzkxZzFLYzVuWEdjT3ZheU9nZnZ3b2hPbWgwZFJkNGRjclpkbmFVWjc3ZGRt?=
 =?utf-8?B?S1ZLTmZzTmpDajJNbTJhc3YvbFJ4YUV6VFkxMnVXbUpWM1c4bXMzRFl0UVdj?=
 =?utf-8?B?MWdObHA0amxRQkVjdHhVMXdJd3lUQk11emdhbjgxc3loQzhvQVZKTWRaVDM5?=
 =?utf-8?B?b20zRDQ0STYydXBOYjFJUktXa3ptb1NsNzJLTGZVN2xjSERCQm0vT0NyaWVL?=
 =?utf-8?Q?axBCnTfJKGHfB?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB8563.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9793
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:404::17];
 domain=DU0PR08MB8563.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f0e725cb-4fa5-49ad-0f0e-08dd1e8a68fd
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|1800799024|36860700013|35042699022|82310400026|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzlDUWZsS0pHMWpiUk16MnhZbTU5Z2oyd1RNV3VSZVZ0cmcwZUxPSnZIWkhw?=
 =?utf-8?B?WkZwQTB5emVCM2JmRWRZQWg0eTg0NWpLRHVOTUtEeERKZ2J0Z1RLdERHUWpx?=
 =?utf-8?B?QmZpcWMwQlNQM1RHdTlUUmpkNmFkRFRjY0E4UGttWFBqbnhGYTNPcG95YndI?=
 =?utf-8?B?a0VXN1dUc05LMzlmeVJTSnlkWmFRZk5pWVRBNWpBYjFQMk5OWjRubnlEay9P?=
 =?utf-8?B?Njd4cmVFcjdXb1QrWUpNNzZhVWFtU010akhvRzRCWGVMMTZxREFwWnBDWXdm?=
 =?utf-8?B?bWJ4YU1GMFVUcWk4SFRoQjVSam1wNnNxUThwbWx5YWJGZ1F2andnZmlHS0k5?=
 =?utf-8?B?K2hMbGZIb3U0ZFlUaWdVajgxbHhYMWYvazJjK29VeCtyM2JlVERPK3NUdjcx?=
 =?utf-8?B?S2dtQkFNTnNJWG95RkVRK2hZeGJvQ2JiaTJOOHZkL0ZoNEhRRXhJb1V4YjVj?=
 =?utf-8?B?TWdraXN1OVNZR1J1SXljL2QwSXBRS0FoaWt6Wkt2L2hRNElGd0ZuaElLbXpC?=
 =?utf-8?B?T24xbEkxYys5K3NXSm1neVp2K2ozZmVJVm8zeksrUmhZcnBaczVxZmEvMlEz?=
 =?utf-8?B?Zk54WWxZdjkyYWtQNkpRVVFDcTRiZTVwbGIzdTNtVmVLWDJjNHY0OTMwR0th?=
 =?utf-8?B?WEdxRnY3c21FUDFuNEpibE9NZHBWcEdTNFBXRmx5RFRUbVcvV0x4ZjFlaGsv?=
 =?utf-8?B?cFE1MFRGZmdaa056T3N0MFQxcUZzekRER08vQW5WN1h4c3dOazUwZU1DbG9B?=
 =?utf-8?B?eFZoZ0RuckFFbkErVldVOTJLMUc3UWhmZlo0NWNtVGNjOHpPSWxMMno0Wktt?=
 =?utf-8?B?THU4RlV4Q25KT3ZWT0RCVUpUVWVqdzNMWk9FSnBINVNQZHUyV0JIVDRCLzc3?=
 =?utf-8?B?SEdZbm5meTA2cjJDTCsyYUg1MHNseHdHWEpkYUFjSkVDZS95bzQzamlXK3dG?=
 =?utf-8?B?algzOXVNOXVqZzAxTmNsZnN4QUF1NCtCMENsdS83MjduVlZJa3Fxc0QzbVNl?=
 =?utf-8?B?WnE5KzRxaHQ2dXhJSVdubFNSQkdPKytodEJVUmhwY2NZOFl3b2g0bkh4YXpJ?=
 =?utf-8?B?eHd0eDFGZWJoMVhVNmFjVTY3SHdIUVMxRHpCZXQySU5XMzdFUUU5ZEh5WXNE?=
 =?utf-8?B?QTZoQTBGNnI2QnhEdHZGUHNrNU1lWDVsVU8wajZkaXBqeml0YkNmK1JjbElC?=
 =?utf-8?B?dWFKMWwxVDdiTW42aTEzNVk1RGZaeFlleGZFSUs2bkIrbHNHb3VGYnpXNkVX?=
 =?utf-8?B?ZDhYdUhuZmhLZU9OY2MvSU9BRFViL0RKTDlrVWp2TVZ2RnFIK29ZMUZ4RC91?=
 =?utf-8?B?Y1RZam12Z2l6U0Y2YittWmJ5WS9VTFJhNTZPVW9qNUdYclhnK2dnVldYdXZr?=
 =?utf-8?B?UGZxZVlnZVRFalorZHhlR1FyTGV4dXNDZHZnanJBN2c2eU16WndHT2tYWVor?=
 =?utf-8?B?ZFhEakQ2RzF0NTZFdkRvNTBjVGpFYmxQTXBqa1ZZUTBlYURTRWhGNTVuV1Bn?=
 =?utf-8?B?enJCbW1CSlBaWlBmMTNEdDlRcjFTMFA3WkhnUmJ4cHA3OTgyOFFoNzNLUng1?=
 =?utf-8?B?Z3ZWRTBWdE9QTkRIUzlrSDJCSlU0Sy9UMTl1OXpnSStVZE41UHJEZzBzcVhu?=
 =?utf-8?B?OXdSVFZXclZEV0ZFalc0bExFSW9rZVI3dzllRnc4K1NYNmp3dlk4czE0UWZh?=
 =?utf-8?B?VXFocVZGMGFJVVNkWU5qd1A0cW16S0VjYW83T3J6V0ZTTGRXR2hFTjFmblN3?=
 =?utf-8?B?bWNia01tRHU0a2xNaW1ESXFnRzlJMEJ3VSsrQ3Z1K0RLREUzTWhsK3FBYlZU?=
 =?utf-8?B?RmJSNTUzK0hHV0hoM25aZnJObEFTV0o0c2FGWmZWcjZObm1mdnB2eTVpS3RM?=
 =?utf-8?B?OTd1OEhmZElGUFA2YWFielFPQmNZZDBSY01Sb242TVA0OElOSkZ3VFBwUHps?=
 =?utf-8?B?VytzUS81NjVCNVNYSVJibjNwNGhqR1BhZUhWVzRsSysydlhSNHI5aTBVYjVO?=
 =?utf-8?B?UktMK21rSDJBPT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(35042699022)(82310400026)(27256017);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 11:03:26.5584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae4f819-04e3-4e7e-171d-08dd1e8a6e9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6623
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

On Tue, Dec 17, 2024 at 11:13:05AM +0000, Michel Dänzer wrote:
> On 2024-12-17 10:14, Brian Starkey wrote:
> > On Sun, Dec 15, 2024 at 03:53:14PM +0000, Marek Olšák wrote:
> >> The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
> >>
> >> Signed-off-by: Marek Olšák <marek.olsak@amd.com>
> >>
> >> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >> index 78abd819fd62e..8ec4163429014 100644
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -484,9 +484,27 @@ extern "C" {
> >>   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2
> >> ioctl),
> >>   * which tells the driver to also take driver-internal information into
> >> account
> >>   * and so might actually result in a tiled framebuffer.
> >> + *
> >> + * WARNING:
> >> + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but only
> >> + * support a certain pitch alignment and can't import images with this
> >> modifier
> >> + * if the pitch alignment isn't exactly the one supported. They can however
> >> + * allocate images with this modifier and other drivers can import them
> >> only
> >> + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR is
> >> + * fundamentically incompatible across devices and is the only modifier
> >> that
> >> + * has a chance of not working. The PITCH_ALIGN modifiers should be used
> >> + * instead.
> >>   */
> >>  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
> >>
> >> +/* Linear layout modifiers with an explicit pitch alignment in bytes.
> >> + * Exposing this modifier requires that the pitch alignment is exactly
> >> + * the number in the definition.
> >> + */
> >> +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
> > 
> > Why do we want this to be a modifier? All (?) of the other modifiers
> > describe properties which the producer and consumer need to know in
> > order to correctly fill/interpret the data.
> > 
> > Framebuffers already have a pitch property which tells the
> > producer/consumer how to do that for linear buffers.
> 
> At this point, the entity which allocates a linear buffer on device
> A to be shared with another device B can't know the pitch
> restrictions of B. If it guesses incorrectly, accessing the buffer
> with B won't work, so any effort allocating the buffer and producing
> its contents will be wasted.

I do understand (and agree) the need for allocators to know about these
constraints.

> 
> 
> > Modifiers are meant to describe framebuffers, and this pitch alignment
> > requirement isn't really a framebuffer property - it's a device
> > constraint. It feels out of place to overload modifiers with it.
> > 
> > I'm not saying we don't need a way to describe constraints to
> > allocators, but I question if modifiers the right mechanism to
> > communicate them?
> While I agree with your concern in general, AFAIK there's no other
> solution for this even on the horizon, after years of talking about
> it. The solution proposed here seems like an acceptable stop gap,
> assuming it won't result in a gazillion linear modifiers.

UAPI is baked forever, so it's worth being a little wary IMO.

This sets a precedent for describing constraints via modifiers. The
reason no other proposal is on the horizon is because describing the
plethora of constraints across devices is a hard problem; and the
answer so far has been "userspace needs to know" (à la Android's
gralloc).

If we start down the road of describing constraints with modifiers, I
fear we'll end up in a mess. The full enumeration of modifiers is
already horrendous for parameterized types, please let's not
combinatorially multiply those by constraints.

Just thinking about HW I'm familiar with...

FORMAT_MOD_AFBC_16x16_ROTATABLE_ONLY_IF_LT_2048 (x5-ish variants)
FORMAT_MOD_AFBC_16x16_ROTATABLE_ONLY_IF_LT_1088 (x5-ish variants)
FORMAT_MOD_AFBC_16x16_USABLE_ONLY_IF_1_OTHER_AFBC_LAYER
	(x all AFBC modifiers, including multiply by the two ROTATABLE
	constraints above)
FORMAT_MOD_LINEAR_YUV420_MAX_2048_WIDE

That last one also highlights another problem with using modifiers for
constraints. That YUV420 restriction is orthogonal to the compression
scheme. So we'd need a FORMAT_MOD_LINEAR_YUV420_MAX_2048_WIDE *and* a
FORMAT_MOD_AFBC_YUV420_MAX_2048_WIDE (multiplied by all the AFBC
variants), and any other compression scheme multiplied by all its
variants. Not very nice.

Cheers,
-Brian

P.S. "is the only modifier that has a chance of not working" is
fundamentally false. Things can not work for an infinite number of
reasons, that's why we have TEST_ONLY. Allocating with the correct
pitch alignment is not a guarantee that you can display your
framebuffer.

> 
> 
> -- 
> Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
> https://redhat.com             \               Libre software enthusiast
