Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A50CB08AE
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 17:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE2910E540;
	Tue,  9 Dec 2025 16:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="nifIpbqJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nifIpbqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC60310E540
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 16:23:25 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=p1n4IiNFWK07VKWMsNdTg3yNcAqzwCdkW67vweHOAeMGQ1ipWxt5fS0koGm7bsIPBDBsTHP0g7bTdutgT/AGLp1Kd9/l2Z/2LqTx0PwblXRpxjrrcxVNe7i1/Yyus0jx2b1P0wMYrnLnD4h7h+ARkHDxZ+JQ3iXNZwxIl9899qtYS9Wwj93eacPxSxzO3pkMaGIYkBaTxofNSwrqp65DqYGdxRjxVaILMfgBGnI13zc+16L88VCCS/Whcapqi2j4ojB+/86HkOa4TRk1GjpLOs+n0DTrxYKP8h9sFTmG0WXoLjY/LUd+g/t013nWa7PUzgExou8B8yH7IA83nTS57w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIi0SMQRSumgt44bRam5RQABKVIfOE9TnMaTRVaSN9U=;
 b=SZxAxO/A/o6m9VV9J8Yj9+PWucy0otPCLEFbKiyvQFMHlRWMHohms4Do5up6N1UgP3KJVtOrdExsqy8o73Na3EOuLnDSTOqIutY7IVPY6J700oKe+Q+Z5AGtc0um3XCTIilTFJ/Xm05WJtcg/adeAw68YVi1DnYntMlad1Okjl9tfnB4zSYyyN8mRGa4R+nlsovVxOGwDuF1D+PMLY8B8tv24Z8zxpL09yKuTTZKl5J7hwkbnjlQpaWEUrtSWW17km8Kja9r3S+gPLAnbqqTn+nroBsDHRVFQchBFOTnB0uwIX1e/jrXHF/DciiIyVjjiO9Wueb9sHzfqdkQIWxJKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIi0SMQRSumgt44bRam5RQABKVIfOE9TnMaTRVaSN9U=;
 b=nifIpbqJPBwiTffO1vC6or16nZvqg/iCAGJSwxgiE/fgtIiosupvLPU43nZw1h7XiWapLE2To8I0NEIbxaIsrQ099Mi5D3PKcpsY5kuJmNU+w2nzE0xy45508MtdHKCTkviv7UdqPLzaVfn1Y5pSAHMrysca7XxSknjdCAbP8tU=
Received: from DU2PR04CA0182.eurprd04.prod.outlook.com (2603:10a6:10:28d::7)
 by AM8PR08MB5553.eurprd08.prod.outlook.com (2603:10a6:20b:1da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:23:20 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::18) by DU2PR04CA0182.outlook.office365.com
 (2603:10a6:10:28d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 16:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Tue, 9 Dec 2025 16:23:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpdkbi7Mf0M5IiPUSZJEi13d4RGMKBJn9COdrGnxGpcTeWNM0PhcDRU/SKEn76bL0L8362dyXa3r19gGL2gWQjF7IaYn3OogUpWwLP3pGP4zWLrPfrHY9uM7+1MuLGMhxh/YsZmQ8mcC/I1wBnQvKP1wDqTWN+cv4jr5jLu/NdihYmeTYtQjScwUlxNzGYq2gd61frmLFwCM4bYA4VZ0ieTW271AMpsBt2INPyHdGnfjpb/gsCGSkDreLx7XmCXE/UA8h9gKrwojCUGQbv1RaHZmQZytzibkkkQKbnr1ErU487c9sdUv8VMDaCo6W/a1qsFK83euu6sNEN7w7EjKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIi0SMQRSumgt44bRam5RQABKVIfOE9TnMaTRVaSN9U=;
 b=ScMPr7zqJb6wCoxllWO5Oyno4UJEVVmu5h0F1BK71VvRNEeMEOFScvRAr+r+6fxBugZ6BPOGMQy4GISEw9B3hkqoBaJAgre+zvB9Q6X6ERKw72r0JREoBOr1Vc/2Tmw/cUO2EPIJz9H/lTBWcrWXsQPsl0UUU0OblQbQyk0OY12v2VzGJ+y6wAMVSnsA8SUziCXIpEOg9TWCv4sWroDjD94IExNw5R92L2UC+SyUg4iEe8uh8ZpxTE8gUGFOXSYaEDPiuuY5k/pHBvY+j+4YC+zIncEqdRryFp9Yz05qvA2i5AO5P1xj3NS59fnrjsZ1Pim1Yn7OyjQnQk8o4/DJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIi0SMQRSumgt44bRam5RQABKVIfOE9TnMaTRVaSN9U=;
 b=nifIpbqJPBwiTffO1vC6or16nZvqg/iCAGJSwxgiE/fgtIiosupvLPU43nZw1h7XiWapLE2To8I0NEIbxaIsrQ099Mi5D3PKcpsY5kuJmNU+w2nzE0xy45508MtdHKCTkviv7UdqPLzaVfn1Y5pSAHMrysca7XxSknjdCAbP8tU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB11611.eurprd08.prod.outlook.com
 (2603:10a6:150:326::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:22:18 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 16:22:17 +0000
Message-ID: <dc889696-64c1-420f-9f31-9f9ad730c807@arm.com>
Date: Tue, 9 Dec 2025 16:22:15 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
Content-Language: en-GB
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
 <4363e055-c1f9-49c6-81dd-c2e5f8307310@arm.com> <3726594.R56niFO833@workhorse>
In-Reply-To: <3726594.R56niFO833@workhorse>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0117.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB11611:EE_|DB1PEPF00039234:EE_|AM8PR08MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d9098c-8f2e-40ae-574a-08de373f4491
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TzF5cFJYZkcxcFNjQ0ttc0VQRG9ZRmozUVVhclBTMnZseVRud0k0TkhFNlFU?=
 =?utf-8?B?WmpTdEM1NkdUd2ZyeE5DdTl6SUI5Tk1qMk1Idi9ra2p3VmtFVms2WlJqVEZa?=
 =?utf-8?B?clg5Nkc3YlFJSzRKQW4xRVhMWCtwRlBBZ3ZaQ3dpZTB3bEZlbURjdm5uSkRa?=
 =?utf-8?B?Zlp0TnpYKzBMbjJvc3VFdHRlYk9lR3kwbHMyN3VmNEJNaGZuMW5QMVYydWM4?=
 =?utf-8?B?Zmw4MGo3MDE3c3FNSGRvbU55SVF3WW5HMUVyMFdOSVdOVHVYVFp5STIvU3VY?=
 =?utf-8?B?cnliYjJxUU0xTXFqQVliVU5iUnJrNmV3UGI3aGw1aHhXNy9Gdndpa0M4Zmxa?=
 =?utf-8?B?ZVBhUGQ3VVYwalp2Nkd6SnFuczVZdnUrVjdGN2xqaGVaUXhubDJabEtJajJN?=
 =?utf-8?B?MVl0R1Y5MjlFenhJOXFkQStTUmFsUE5sNHFybmpuZU9STHU2enNWVUxBdmpB?=
 =?utf-8?B?b2h2SXBvVHo0WDNqMWI0bXBVcWM2V0k5cTVJTkFLeitPN3ZZa2ZML2pzd2Va?=
 =?utf-8?B?WWM1NGhCYTFSOHhQNmh4UXpSblJicWtnbTY3YVJNb24zcENwdy9ReHowZVNM?=
 =?utf-8?B?SXdKeFZUdmZHdHhONjI3TU9JNmJicjhGQVhWVDVFY1kvWU5Qelc2U1o3NWZW?=
 =?utf-8?B?Nmo2bzBQQU5LN1F0dDFMUXMwWXBNWGNsa2JGaElWYWFVRnZDVmdoclZEOFIv?=
 =?utf-8?B?M0lwTE1MVjBGZDBuM0V3OGFsSGdnNGVlWWpoeDJPTVZXWDFBZ3ZoMlZzNmQw?=
 =?utf-8?B?aEdqZ0l6aEZGL2VrNGhQZ2JDcVBaNHFSTTE4Vlc1bXZtUVpCTGowZTZJNnRD?=
 =?utf-8?B?WGRTbmdxM2RrV20wN2I3NzlOb3ZxU09udGdrRVgxbCtDd3laUFovQ284SVVs?=
 =?utf-8?B?Uk9zZVU0VDl5T25NZUY5Wkpha21STmk3cE4zQmZSZXREV2tNVXRkc0dZMmt0?=
 =?utf-8?B?SkY4TU1BamZVN0VEcExHdDVuRU96MnpZUkNva05qQTA2WFd5S1N1clBSR1Rk?=
 =?utf-8?B?eWdHTnJraGUzU3llelF5aXVpTUIwcTB6dFo0S1VhOFQ1ZXh2NWlHLzRSN2lV?=
 =?utf-8?B?STQyTXNqMDJNMFNwNklHekF1dWhOYUNNSlYvcThrYldYM0pQM3lFMVJRT2py?=
 =?utf-8?B?WTI3dGpLc0xSMldhTHQ3Zkw3Yzg0R1g3ODA3ajNaejJWWGRrWGVYNXhWNzYz?=
 =?utf-8?B?Y0tSUHdwSFVQVWIwcWxrbWl2a2k3TkFYc3JRWUxESXp4czZHVkgvWXVnUjZJ?=
 =?utf-8?B?eVlLUnFDdkF2MkdOeFdScll2a1RLNHNBQndkSjN4MjA3TWVzcHY0STdqWmNS?=
 =?utf-8?B?UmJ3b3EvQi9mNlhVaWg0MW1Rc0ZMN012aC81Wm95WFRtRUVyaThiZTRrTHhq?=
 =?utf-8?B?N1VTL1FOcEdUSzJ3alRxMWNoMHhDNU55c0pzeWwzY3FaTWFtcnp0bzdONk53?=
 =?utf-8?B?NVg5Qi9zWHc5Lzk3Q2RzbGhDUFNPN1NnOEVwYnp3YUk2RlpmWWlXdW1LaFpy?=
 =?utf-8?B?K1Y4SG1aVVBHRGd2MThUSm5wWWVkL3dWSndYeW5qSFplTDVxNTNENmlobXVq?=
 =?utf-8?B?b3NGQmNPWHNyNjUwU0xlZzBuWnVXeGhYbENMZEtINThxVVVmRHpBNmE1aVNz?=
 =?utf-8?B?T2hLL3pydWN6VTVHNS8vUVUvVHlDelpVdWJyL0hzc3ZVbnRWZ2daSmVNQjhv?=
 =?utf-8?B?Wjh6dkh1NWs2Y21zbnBtQjc5SWRjQUdtZHk1VXZqL2ZxZEFVamlrVng1VU4v?=
 =?utf-8?B?bTk1UnhoWWVXTHlva0hIempWMHdVUzNjNGh0eUc3M1cxWXRBeTIvT1BpYW9n?=
 =?utf-8?B?c1R3WUJ2MlZOK2ZIRk0xQVBLRHFwSUZweFhKdHByazY3TExYaTM0cUIrc2JK?=
 =?utf-8?B?Z0hUWit1OHZiYkZuVjdvUE1TaDN5OEY0Ym1uTGM1S1lHWjRCRE1nMVNDaXRS?=
 =?utf-8?Q?/sI0w3IS7GSD0oO81spNUPO3eVbdOMjg?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0b5b725b-4fa0-45a9-f733-08de373f1ebf
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|7416014|14060799003|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVhUQUZVVnJrREZ6ekthTEdnbDBKS2c4QWZqZ205ajc1KzNQWjZuaWl5SWdn?=
 =?utf-8?B?T0M5OFVySEp3KzJFK2ZVWk5idkJkaEx1TG03dGxPbXdpMTV2MStvSjBiS2RX?=
 =?utf-8?B?M0lYdDlPSVhtdGI5S2RDWWt6WU81bUEzaStncDdvcEkxcTBNWWtiWHZlRExH?=
 =?utf-8?B?V0NUL2luZHpGQmtkSDQ1U1NYamVRRERxbjBLZmwvQUdkM2NtZWpZRVVveHBI?=
 =?utf-8?B?QlV1anRQZEIwcnQ2N1dxdnU0aWRyUFo2cG9PTVFSSnAzUVcxTDlhb0RBN2x6?=
 =?utf-8?B?bDFPcEJBRHFZZGpxUDgrUXdBbjgxQ2ZCYnRzWmhxRERYZ3R0bnJobS9pM3Ux?=
 =?utf-8?B?UTU0bFpmMG5Pb3RmOXNkUHZRakxsSEdyQTM0ZFc0QmZ3c0h0Y1pnRkttakpG?=
 =?utf-8?B?enpobXRFcUJsaEJPUHFDSHZ2dXh0eFpOc2s0QlpxTXBkTlBXY0RtczBSTmNS?=
 =?utf-8?B?TGZXT2QxOVRNcVlQMTJ2OHpSTGZIeUU2Q2JPR0NkWE9QZDdsb1RMc2p1aUFK?=
 =?utf-8?B?Rlc5a2JXVEQrYUVaZDVQVGQ1MXpXN2NNMXNTTXA0NnJ2anhraUpqZmN6dW5Y?=
 =?utf-8?B?VWpoYUVKQ2Zvb2QwY3lKTnBXTE5waDA0YVVtMUdXazFWdnY0eVNrVUl1Vk1o?=
 =?utf-8?B?Z0xaT0FoTXlSaEdzemFrYlYwMlBSeUYzMTA1by9xODIrcTRXNkJnZlEyNStt?=
 =?utf-8?B?UWpwSEhhQkYvTFVaRUpPTUFOZzk3RDlyc2NQUzVsK3BEeFk0WXpmRzFob1BE?=
 =?utf-8?B?LzVMODJ4My9tZFByZWFjcGkydUpTbGpZZ1JHTjM5dFN0VHJnemxTeW9SdzBa?=
 =?utf-8?B?ZzdGdUoxdEM2dVE5SXE1VnJkdEMvUElDUmV5T3NYNjZrOHhaMnptYXNKemhv?=
 =?utf-8?B?b1BwcWY2TTdBdmtDci9HWkdscWFvNnBldHgvRi9tK2ltTDFZcDdBbHhXT0lK?=
 =?utf-8?B?NjkzaXI5V1ZvSzhHN2dJay9vajFwNXkzL2FHUnFDUmJUem9jZk84YjZNY2pt?=
 =?utf-8?B?OVBKSUVGcFF0TURBYlZ1N3pRWWJ3d2JFL0xCcCtNNHNLZE9CejVYaUhDbVFJ?=
 =?utf-8?B?dmttNGlPa2pTWEpnanc0c1dDcVUvRHhHd1RMbHBCOXQ4OXg0Y1daSUxFRW5Z?=
 =?utf-8?B?T0dseHllWE5SSDZrRG1ZR0JWbEF3K2FXb3JXTFFkS3d4elJGK1c4RVFWdW41?=
 =?utf-8?B?em9SVFpRZitscDFLVjJCc28xREZZYTRPZHRUUURBN3U2OXB6NVdLWFExdGsr?=
 =?utf-8?B?bEhiWDhkNUVyUXgxTFhFTXovc3ZOQ0NYZG1QdFF0OGRlc3R0M3J2WTNOeHh3?=
 =?utf-8?B?TksxUDlBY3RVM3RqOW8vdzZ3dzYzY2FROHlSVVFtWnhQTGF3a0hhVkczSjgz?=
 =?utf-8?B?VWdvajBFZTJ1ME9YNmJaU1grOFVPRzZ1S1I2WGlqMEhYazZvVy9aUlMyMU1V?=
 =?utf-8?B?c2Y2ajRUVlViUTFJVFBTSUpGTEhRNHp3azZwbXJ0bnBySG1UcHdFN1NYT2hx?=
 =?utf-8?B?dmhzYnBWVmlUb2dUcnJmTWZURjFXa3NpY2QvaXcrM2pURXhXbEdlbHFhV3Vs?=
 =?utf-8?B?cUFseHFnZkV1K2txZ3YvSFFtU1hxZ2YrWFFNaUQzcVZSMy9ZQ2p5U3crU1Ez?=
 =?utf-8?B?ZWM1RUF3a3FGMU9VMjdkaVEvUFBWSTZGd3NBdzJWNkFBRW1MMVloTUoyV203?=
 =?utf-8?B?UGUxb2V6Y2s2V3h3b0NadXVUUzRXeDhrSjRnZXF2SlJwUk9Lb29LS3dRZ3Rq?=
 =?utf-8?B?Wk9naHJKcTRCK1NJV2hQeHdHZG85SVBBcGdoVVEyMHBGbSs0RkJ1Wi9GaFRn?=
 =?utf-8?B?aStzSXN0Rm4vMTJFKytMd1BKWUFmdmt2SWc4NXJTYWVHOXJ6MFhiYm5ZZHlm?=
 =?utf-8?B?OC9BTEpEeDZuZ0NLV0h2a0UrcjUrSHpoOEY5b3p3K0pzb1hsOGQwWjVEaXZK?=
 =?utf-8?B?c2IvRmwzTkJ1U01MWkprdHNJa1JMZzhoTmk0ZUI4MkpDT2d0aHZBanFOSS83?=
 =?utf-8?B?NCs5UTczWkVTbHl3bDRsU0I4VGg3WnluU2tqUHhvVDN3UTRIQlJsRGlsN0FT?=
 =?utf-8?B?MkFydldWUTVnN1dIQzhXVXA3T2RUVWFBYjJRaUQrWVZkWjBOaGRrRDZqeWRB?=
 =?utf-8?Q?VWm4=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(7416014)(14060799003)(1800799024)(82310400026)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:23:20.5009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d9098c-8f2e-40ae-574a-08de373f4491
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5553
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

On 09/12/2025 13:01, Nicolas Frattaroli wrote:
> On Monday, 8 December 2025 18:14:53 Central European Standard Time Karunika Choo wrote:
>> On 03/12/2025 13:56, Nicolas Frattaroli wrote:
>>> [... snip ...]
>>> diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
>>> new file mode 100644
>>> index 000000000000..01013f81e68a
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/panthor/panthor_trace.h
>>> @@ -0,0 +1,38 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
>>> +/* Copyright 2025 Collabora ltd. */
>>> +
>>> +#undef TRACE_SYSTEM
>>> +#define TRACE_SYSTEM panthor
>>> +
>>> +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
>>> +#define __PANTHOR_TRACE_H__
>>> +
>>> +#include <linux/tracepoint.h>
>>> +#include <linux/types.h>
>>> +
>>> +TRACE_EVENT(gpu_power_active,
>>> +	TP_PROTO(u64 shader_bitmap, u64 tiler_bitmap, u64 l2_bitmap),
>>
>> nit: if you want to add tracing can we also add the device name as
>> well? Something like:
>>
>>   TP_PROTO(struct device *dev, ...),
>>   TP_ARGS(dev, ...),
>>   TP_STRUCT__ENTRY(
>>           __string(dev_name, dev_name(dev))
>>           ...
>>   ).
>>   ...
> 
> This is a great idea, will do. Any specific reason to pass the
> device in the tracepoint rather than a const char*?
> 

Nope, totaly fine to do it that way as well.

Kind regards,
Karunika

>>
>> This will help differentiate the device it is originating from in
>> a multi GPU situation.
> 
> I'll try not to get too excited at the prospect of systems using
> multiple Mali GPUs because I know the likeliest case this happens
> on is Arm evaluation systems with a hard IP and a soft IP loaded to
> the FPGA core. :)
> 
> Kind regards,
> Nicolas Frattaroli
> 
>>
>> Kind regards,
>> Karunika
>>
>>> +	TP_ARGS(shader_bitmap, tiler_bitmap, l2_bitmap),
>>> +	TP_STRUCT__entry(
>>> +		__field(u64, shader_bitmap)
>>> +		__field(u64, tiler_bitmap)
>>> +		__field(u64, l2_bitmap)
>>> +	),
>>> +	TP_fast_assign(
>>> +		__entry->shader_bitmap	= shader_bitmap;
>>> +		__entry->tiler_bitmap	= tiler_bitmap;
>>> +		__entry->l2_bitmap	= l2_bitmap;
>>> +	),
>>> +	TP_printk("shader_bitmap=0x%llx tiler_bitmap=0x%llx l2_bitmap=0x%llx",
>>> +		  __entry->shader_bitmap, __entry->tiler_bitmap, __entry->l2_bitmap
>>> +	)
>>> +);
>>> +
>>> +#endif /* __PANTHOR_TRACE_H__ */
>>> +
>>> +#undef TRACE_INCLUDE_PATH
>>> +#define TRACE_INCLUDE_PATH .
>>> +#undef TRACE_INCLUDE_FILE
>>> +#define TRACE_INCLUDE_FILE panthor_trace
>>> +
>>> +#include <trace/define_trace.h>
>>>
>>
>>
>>
> 
> 
> 
> 

