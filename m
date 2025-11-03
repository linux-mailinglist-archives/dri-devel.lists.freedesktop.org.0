Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56029C2E0D7
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 21:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BB410E497;
	Mon,  3 Nov 2025 20:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="dhVr5htH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dhVr5htH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011024.outbound.protection.outlook.com
 [40.107.130.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B8C10E490;
 Mon,  3 Nov 2025 20:43:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mpYYF2xP6w3mHA1T6jqAI6t14Wai6R40sMEbourrra9J2UdA9MfFaL6LaNLGgUJA8v6rpR+M8PdvPVdw+K0epPKCu53a06cFm0i45KAUatDfl4s4bZSsScT0OK//MvExDdEVaZIqvWEzXlv927fT0aqd+G8PBlrp/NBN2hmTknEXToRnhVPX/ieRqHBk52+rI91/JUi5EPjVUlkA/TZXGOqRpf5rgUsHdbGRg3ySbZp/scNgtRhY3L7Mz7Z0EQA+egcXxQJ8xjaJC/DRmr/sCFT4J2NT807NMB0EEqGT+KOyr2nGJ7qsAf39xqgiI1o4HnfHgSwaJK+T3rcK3ZJihg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dl/ffnKjcu/YN/BkrPrXFbqurkG2fgic6jHX19qMq/c=;
 b=Lfiaec8fzuOXMxyn3pQkzIyUWPzopc7kzAVWlClWRLVG8nxLBkecVrplrhFf3lEutlBAi5Sb8Io/8yLhQ54tOctQfy0iXkb3GJOWZAp/2gGQ8oS7wNZo7B5dja+SFxhVIQpi7Un8cel6jyfWImEhhbbe9hJ2NbMg8DZQQBNuREWN6zoyJJhohKEMHYRLigqsv40vqOvW2xqv5xc+sT+pPHiK5RInuhIFuThfwmiMYMw+dXczyowLr0mmJtJFMr+L/F5OkjKfaes2eBIF3SoTzbQh3aJMxEEHfJfuJCe+PZrH29M7vZoitMWnEbwf26Ojl2zpSXgGyImgFXTdRw90aw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl/ffnKjcu/YN/BkrPrXFbqurkG2fgic6jHX19qMq/c=;
 b=dhVr5htHFurSpDBhP8LLOBd5H9ixmi2oNGzwZRSwj03szT3hnprfg/AjgStpPGDNcVJGa/U0Jekz0835KTJ5Kkq7QaO++YnIdgaiptq5aKTlBa4oa6YqommGWDevOBrNZtZVvGW6McHgAB7bh2E/VhlV7uosMV7gamNRWQ6f1wU=
Received: from AS4P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::12)
 by PAXPR08MB6734.eurprd08.prod.outlook.com (2603:10a6:102:13c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 20:43:14 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::2b) by AS4P195CA0015.outlook.office365.com
 (2603:10a6:20b:5e2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 20:43:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.0 via
 Frontend Transport; Mon, 3 Nov 2025 20:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryzym5SBMbyc/uBx17cFSAVzL4VgzdpswrAuYUW2xUa9YAIxpBJwbEO8BQWtX+eY4Xu+H+ykwdNChvU5ahQEIYcj18fC/BamsAbMqMYsN0K6nLGIY6hqQVHtbQVyxgerttc35YJ2lSGUagroeUyRt3bmxz1Fush1qeuKJessTs5kSfcUF5T3/YZyPtphVLEXRCv+G3xkxyHXKxacS0gcaKneFuWtO06uWqV/DCTgvTxYlnrkUHmrwR4B4kB8H5+vdCbLOzocAQsYpKsTWyobUDPdHlxDh5ty7ofh3v8CC6vjzvbV1X4IR3JYYv4ngc2HFl3pDJADa+/sG7x3nBhDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dl/ffnKjcu/YN/BkrPrXFbqurkG2fgic6jHX19qMq/c=;
 b=BQhuxpKB1cpBSIN7wY9K+Frkdj8zpuGG0etE9ESXFHDPHZ6fOruiSyxFkbg6rikSo4lHuiDJGGKafbCGlFujH7HREV/ntphV41maLEOu/lTw/5cepgSpTnPdLvW6PQTTUDfW/nkVVo+NN3cljE6GQdwVWOiOzgMexodKf5xzayd1It0mDa9LCjtVzfqot+cP1HRUB0t6CgrN6G8u89m5FiihiBo65HwLT37SpkW1fTwlL0tJP+lEgpKjD5KE2fxvxUd6E0ajklH8Ur19m8cO2uvgfu7eMmIjA5sk181ezrhy+jc0mz8LW6e32rbYb1taaepr8j4elZQScZpjRBI2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl/ffnKjcu/YN/BkrPrXFbqurkG2fgic6jHX19qMq/c=;
 b=dhVr5htHFurSpDBhP8LLOBd5H9ixmi2oNGzwZRSwj03szT3hnprfg/AjgStpPGDNcVJGa/U0Jekz0835KTJ5Kkq7QaO++YnIdgaiptq5aKTlBa4oa6YqommGWDevOBrNZtZVvGW6McHgAB7bh2E/VhlV7uosMV7gamNRWQ6f1wU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by VI1PR08MB10300.eurprd08.prod.outlook.com (2603:10a6:800:1bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 20:42:07 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 20:42:07 +0000
Message-ID: <a9705c1e-2377-4f50-88ee-553bbf189d6d@arm.com>
Date: Mon, 3 Nov 2025 20:42:05 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/16] drm/panthor: Add a PANTHOR_BO_SYNC ioctl
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-8-boris.brezillon@collabora.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20251030140525.366636-8-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|VI1PR08MB10300:EE_|AM4PEPF00025F97:EE_|PAXPR08MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f7797c-09e2-461a-4cb8-08de1b199bd2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?eFpQQm12OWVUV0o1TFdKNG9nZk0yRnl3RWNva1JsSW84Z3NNN2RNVllxTE5E?=
 =?utf-8?B?dkxoZXlaUFY5aFZ5UGo4VlZwZHNnbTloc1VPTEtnQ0xnMzh0czUyUUc5dmEw?=
 =?utf-8?B?elhhZDRiZ1UxNEJtTEN5UGFsZU9vcllQUWp4RFQ0VVlzQU5Nc2NWbG1uK01x?=
 =?utf-8?B?Yng0djJ3NUtoQ3pBWDl5eSttZEoyOXgrUWlKNUJDZTlJc044eU1MZk1rWitu?=
 =?utf-8?B?V2FVbG5adDZySGxNN0lramRqUXZrbDlpU21NSjRydHZIN2lObWFCbDcrQ0xZ?=
 =?utf-8?B?RVh5MDZuNUNlbkhNaWtyV3JrcENob0hQeWhndjZIcWZzTjRhUTl5SmNBUW1O?=
 =?utf-8?B?V2k3WlFJUmlmWHlUWnhIVWtVU1hHdEs1eDRidUoxbWlyQzBKa292dEtHc1ZO?=
 =?utf-8?B?R292c0lnSkxIdnZNbktEc0NTTWl1amV2SVRiRWlSMGY3WjlZMktrYUloNU1E?=
 =?utf-8?B?bW5Ec24rRUxvWU5WT3dBYlh3WEQ2TStxS2ZIZFRnWVpGQmVyOGwrelJZUTFE?=
 =?utf-8?B?REZvWnRTMkRvTHdRTFBlZEtEZDNSamVuZlQwSFh0THNSemdNOXEvOVR5Y08y?=
 =?utf-8?B?ZVNGbnlxeWpKUXVnQmVPbVVHL21KcnF1VW1ZbFV4UXNRM2VrcEx5STAvVWtk?=
 =?utf-8?B?QnV5aGxoUzlsUHRvS3lnSHl1NENHbE5pTmtvNGluVzQ4bEJPMDhTd3R3Z2Ix?=
 =?utf-8?B?bmZHaEtsZEl5S1B1L1dxOUlwWWd2cVFLd0lEM3cyVjlsalhkUGVkbzZmUUxX?=
 =?utf-8?B?Z1NHK0xnUWtEdHdFZW9jZzlRTk9MS2ZRUGhVNFdaZ2ZJUnVuZGdZenRzTGpO?=
 =?utf-8?B?M1NYKzY3MFJodDhFZm16bkt2cFZ3WnBHSHNnaENqajhkY3BycmxydHAvZFho?=
 =?utf-8?B?NUEweFQvN1JNWUR3ZFRZR1l4MXVrWmtvQmhvOGloTS9VaHllS0ZIRUh5WVhM?=
 =?utf-8?B?d25SK0dLVVBBcndITXl1cWM5YnFFdHFmN1VScVltNWw0aThXOTg1c0J1c2lm?=
 =?utf-8?B?QXdudFRpdGUyNEUyL3RtdjRIemVQRUFxSGU0MmtrZFZNZGQ3SGl0MkwwSlVw?=
 =?utf-8?B?WWhaRzhsT01rSnluUjJuN0MzR1FuekFHZ0tBVS9PcWZSTFJMeTFkUEhQTUZF?=
 =?utf-8?B?L1BjZHp2NW9uTVNGTHBrN1VySUp1aFBVU1lxVTVyZnM2NkFCYmxyc1psVzVL?=
 =?utf-8?B?QUt3d1FhTk1pKzJDZDJ6N29tSFlCdDBnU256Ym1LRTJCZ3ZSUGxEUzA1NkxW?=
 =?utf-8?B?cFZuamVUUU9oNERXZHVJZWJsTkt5enBTWjRYV0E2MlJsSnc2NWJkcVVGak44?=
 =?utf-8?B?b1U4dTdqZDRJQVo5RWpxVVpIWFJDY1RiZzZhd1Y5NGE1dUk2YTBlTXowSWZ3?=
 =?utf-8?B?UUtPVDl3WFVkbjV4dDVUWC9TbkF5V1RCQ1lQTENqMVdKK0RyVXVoN0pwelQ3?=
 =?utf-8?B?cUVNZnV4b0FqZGd4OTc3TlNMckdzTFM2RCtPaTRUL0ZzcHQ1d2dTMFRaS3BR?=
 =?utf-8?B?QWlSSk5NUmVhT1I1dFMrTyswVERzbDNWdUZvVDdycXc5djl0QkdTdnAxdVhO?=
 =?utf-8?B?U2U0ZlJxcFhKZExmNDVqWmQyOHNwa1lYZHZJTGJBTHlUSTRXeVpZNmZ4Q1Rr?=
 =?utf-8?B?cHZWanpsWGNSY3ZWclJZWHBldE9JK2tweWdVMU9wUTFvQ09kcVBZZThBZzRw?=
 =?utf-8?B?UXBIaGo4ODZXMjlyUWZ1cXBObVljR2NpeWtlckVoVjY5YjBKSVE4ZXlJMks5?=
 =?utf-8?B?K1hEL2g0TEJtemh2YTF4OVUzN05KejNUMjU5S1p5SitsQVM4NmZoTGNVbUgr?=
 =?utf-8?B?SFh0azNxZFcwS2Jub2o3V3hjTVJrU2NYb2x1SHdORGZYSVA0L3VXYmZtL3pr?=
 =?utf-8?B?MGRhblJ1cE5ZNGZxL0s4bUx1NUFzNkFOUXFGS2dsaW0yQit5STdPSFFmTnNW?=
 =?utf-8?Q?d7cqK3CtVU03OWzul0a19vzdRc3xbyuV?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10300
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 61933088-e236-44f5-ed5c-08de1b197466
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|35042699022|7416014|376014|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTZCNlk1UDFjbGNOQnptSSt4VjYwVmVibUs4RXNWSDdZN0Z4T1FYNUdwUE5Q?=
 =?utf-8?B?QzVKRDU4OC9NWVdpUHpXa1ZRaW1zeFZ3K2FkaXN6OVNMQWlVeWVNeEJIS3ht?=
 =?utf-8?B?djh4d0M4TXdhUlJraFk4S2J1d25MVGhtMVQ4WnBMOTAwcFRHd0JReWdLU2tz?=
 =?utf-8?B?Y0krZ3BtOStRKzlORkRHNm5uWWs5U2trYUF5b3pvMG9ZRy9XN3Erb2hodXNu?=
 =?utf-8?B?dmpERnlmT3p5c1hUaDdJN3lRbWdZNzl5RXJ5L0FKNU1mRjFrOGJEWENuVUk1?=
 =?utf-8?B?SXFFbVNGVktOc3RkVmU2alFrdnpkblBINGFneVJwS3o4eGZuZHFBd0dyTlAv?=
 =?utf-8?B?ejZrekJHYUM3UmJMb0x0VFA1dFBtYUxpUTFtNm1xdm40bEVIQnBSNmRwaEVo?=
 =?utf-8?B?dERVSncxL2hFL1NvdFpWSWxpRWp6ejRXbUUyRDZyUzdSMWhkWk9SWGFFNHc2?=
 =?utf-8?B?QzZMeFJPTVo3L3RoVUFXVWo3R3VpQVl2NXYvSmpYY3BiN0V0Q2M4ak5lR2tX?=
 =?utf-8?B?QXkwczFlMTlLTUpGN3I1c2U1eW9JazNnelNtUTU4YWpPQ3BwbzVwdkRseS9V?=
 =?utf-8?B?WG1QVUptV1U5eGZtdVUyTVZKTmwvd0kySWxEZWJpRmJIVTZWYmowZkVrV1Nr?=
 =?utf-8?B?b25ObVBlQ3lTZmVEcEJCZXBHZ0Mwd1BUU3RKZ21YS09JSjhUbkxYZThTc24w?=
 =?utf-8?B?ZnhBZDVuUTdIWGw1SmtkSUUzaGNuNi85LzFGdjBpRFdsVW9Jcm5FUURFMDl0?=
 =?utf-8?B?NFBndzl1V1RBZ09pUCtMSzBJL1NJNzN3NXQ2M3htV281OVQvemg1UXJsejl4?=
 =?utf-8?B?RWZGUUZ4djI4RVZSVHB6UTMxZkxkVzBIa2k5bzdaZXVNYlptdU05Rm1uRUFl?=
 =?utf-8?B?enBOTkhQTnlRRTB0N2VYODFVR2NQZk41cUtXdHY1UExwbHhJMzRweTdSaTZT?=
 =?utf-8?B?OGtCL1RDNUJmc2REaGhKSG56RFY3UkZTeFllL2tpaVo5MXFKMGJkRmMxQ0h6?=
 =?utf-8?B?amFHbjNnR3FraDd3dkJReVliaUJvYlNRU2dNWHRkUWxlQzRHamIxRThtSkU3?=
 =?utf-8?B?YndXUFowTk9ycURyRTg3K05HcTRmeHJRYmw1MVNhbXNnTjFJUXFJU1EvamhV?=
 =?utf-8?B?ekt3T0FDdFRhM0N1aXJyQVQ1cXNONFBiYkMwd0NXaTdMbUwvalBBemd6THhV?=
 =?utf-8?B?Z1l3WjltTEdzUEJSNzhCYk5mWUhxcWEzSjUxeDhzWktydjdZWDcyMEhsenJV?=
 =?utf-8?B?dldreDkyd3NoU3JaQVdhVk1pY0FRRjJFcmxwYjdyc3FRVkI3aVJLT2NDZHBP?=
 =?utf-8?B?SWk0WFIwamJOZlZkb0k1TGRWYjgrMi93bnoyeVhLKzR2RmRxVjVZSWRjRlFJ?=
 =?utf-8?B?Z2ZqQ3VKSjBxYUZmT1dwaXhhejJIUndlS0M0endZVWxVOHNkVVZlWHhFeTNj?=
 =?utf-8?B?cEIxZ3hhYk0xNmJaS2JZZlltdzgwSGRvOCtCa3lVT3VBQ3FoR3JySk5GR3p5?=
 =?utf-8?B?NHFsY1ovRlAydkR3YmlsdUppL1JKM2xZSk1YQnZTeFkyQnZXdURMS2MybXdy?=
 =?utf-8?B?aWMyUjNuZVpEVW5ZZUhuSU5MS1RtMjdCZVhocW9KVHhEMmFyZld6MGZLenZ4?=
 =?utf-8?B?eE4yMU42VGdrRnR2dEZQUXBrdFdTYzY4ZHFTS2xHZC90SEVvYWIzc2VLVEpt?=
 =?utf-8?B?K3pQdUVKN21PYlJ2TXl6bFZBdnduZnhFQUx5YXpjTzR1S09ITXhKcWV4elha?=
 =?utf-8?B?ZnRId2pBOE5FM2NBNFlscWxvcUl0V1ppTFQveVpWYTNJWDZLdm1Yb0hVQ0pB?=
 =?utf-8?B?bEFCL1RyN0h1OXVKZVlpM1ZhSlU2NDBORVlDU0F1cUkxSVQ5bi9OOWtaMGRh?=
 =?utf-8?B?cTFNWkFGZFppUzFJME5NUU8wWGlTK0xKbERvZXgvY0NSSy9mNHZIOHdGd2xB?=
 =?utf-8?B?d1FXVkJJdVNVSTNqUkV3endjRE5yMXc3V0djZnkxanA1dXlueW9mQXFaSFNn?=
 =?utf-8?B?WHgwYVd2MGJybFRGMjJNQUZQZzM0dm91WVNXeG9sS3RKejdHdVc5SDgvWUJk?=
 =?utf-8?B?NVRmUkxFZEY3ZVV4VnJYTTk5QS85STlyZ0hnVG5pTUxGYXpEbDdFaEladGtQ?=
 =?utf-8?Q?pdoc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(35042699022)(7416014)(376014)(1800799024)(14060799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 20:43:13.4503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f7797c-09e2-461a-4cb8-08de1b199bd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6734
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



On 10/30/25 14:05, Boris Brezillon wrote:
> This will be used by the UMD to synchronize CPU-cached mappings when
> the UMD can't do it directly (no usermode cache maintenance instruction
> on Arm32).
>
> v2:
> - Change the flags so they better match the drm_gem_shmem_sync()
>    semantics
>
> v3:
> - Add Steve's R-b
>
> v4:
> - No changes
>
> v5:
> - Drop Steve's R-b (the semantics changes call for a new review)
>
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_drv.c | 42 +++++++++++++++++++++-
>   drivers/gpu/drm/panthor/panthor_gem.c | 21 +++++++++++
>   drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
>   include/uapi/drm/panthor_drm.h        | 52 +++++++++++++++++++++++++++
>   4 files changed, 117 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 99a4534c0074..cad5c4270b04 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_a=
rray *in, u32 min_stride,
>                PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_val=
ue), \
>                PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs),=
 \
>                PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf=
_size), \
> -              PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
> +              PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> +              PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
>
>   /**
>    * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -1394,6 +1395,44 @@ static int panthor_ioctl_set_user_mmio_offset(stru=
ct drm_device *ddev,
>       return 0;
>   }
>
> +#define PANTHOR_BO_SYNC_OP_FLAGS                                      \
> +     (DRM_PANTHOR_BO_SYNC_FOR_DEV | DRM_PANTHOR_BO_SYNC_FOR_READ | \
> +      DRM_PANTHOR_BO_SYNC_FOR_WRITE)
> +


Sorry, couldn't find where PANTHOR_BO_SYNC_OP_FLAGS and
DRM_PANTHOR_BO_SYNC_FOR_xxx macros get used.



> +static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
> +                              struct drm_file *file)
> +{
> +     struct drm_panthor_bo_sync *args =3D data;
> +     struct drm_panthor_bo_sync_op *ops;
> +     struct drm_gem_object *obj;
> +     int ret =3D 0;
> +
> +     ret =3D PANTHOR_UOBJ_GET_ARRAY(ops, &args->ops);
> +     if (ret)
> +             return ret;
> +
> +     for (u32 i =3D 0; i < args->ops.count; i++) {
> +             obj =3D drm_gem_object_lookup(file, ops[i].handle);
> +             if (!obj) {
> +                     ret =3D -ENOENT;
> +                     goto err_ops;
> +             }
> +
> +             ret =3D panthor_gem_sync(obj, ops[i].type, ops[i].offset,
> +                                    ops[i].size);
> +
> +             drm_gem_object_put(obj);
> +
> +             if (ret)
> +                     goto err_ops;
> +     }
> +
> +err_ops:
> +     kvfree(ops);
> +
> +     return ret;
> +}
> +
>   static int
>   panthor_open(struct drm_device *ddev, struct drm_file *file)
>   {
> @@ -1468,6 +1507,7 @@ static const struct drm_ioctl_desc panthor_drm_driv=
er_ioctls[] =3D {
>       PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
>       PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>       PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDE=
R_ALLOW),
> +     PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
>   };
>
>   static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 160692e45f44..1b1e98c61b8c 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -357,6 +357,27 @@ panthor_gem_kernel_bo_set_label(struct panthor_kerne=
l_bo *bo, const char *label)
>       panthor_gem_bo_set_label(bo->obj, str);
>   }
>
> +int
> +panthor_gem_sync(struct drm_gem_object *obj, u32 type,
> +              u64 offset, u64 size)
> +{
> +     enum drm_gem_shmem_sync_type shmem_sync_type;
> +     struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> +
> +     switch (type) {
> +     case DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH:
> +             shmem_sync_type =3D DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH;
> +             break;
> +     case DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
> +             shmem_sync_type =3D DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_=
INVALIDATE;
> +             break;
> +     default:
> +             return -EINVAL;
> +     }
> +
> +     return drm_gem_shmem_sync(&bo->base, offset, size, shmem_sync_type)=
;
> +}
> +
>   #ifdef CONFIG_DEBUG_FS
>   struct gem_size_totals {
>       size_t size;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 528088839468..8705c492c5b6 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -147,6 +147,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
>   void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *l=
abel);
>   void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, cons=
t char *label);
>
> +int panthor_gem_sync(struct drm_gem_object *obj,
> +                  u32 type, u64 offset, u64 size);
> +
>   const struct dma_buf_ops *
>   panthor_gem_prime_get_dma_buf_ops(struct drm_device *dev);
>
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_dr=
m.h
> index f0f637e0631d..bb12760abe99 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -144,6 +144,9 @@ enum drm_panthor_ioctl_id {
>        * pgoff_t size.
>        */
>       DRM_PANTHOR_SET_USER_MMIO_OFFSET,
> +
> +     /** @DRM_PANTHOR_BO_SYNC: Sync BO data to/from the device */
> +     DRM_PANTHOR_BO_SYNC,
>   };
>
>   /**
> @@ -1073,6 +1076,53 @@ struct drm_panthor_set_user_mmio_offset {
>       __u64 offset;
>   };
>
> +/**
> + * enum drm_panthor_bo_sync_op_type - BO sync type
> + */
> +enum drm_panthor_bo_sync_op_type {
> +     /** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH: Flush CPU caches. */
> +     DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH =3D 0,
> +
> +     /** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE: Flush and =
invalidate CPU caches. */
> +     DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE =3D 1,
> +};
> +
> +/**
> + * struct drm_panthor_bo_sync_op - BO map sync op
> + */
> +struct drm_panthor_bo_sync_op {
> +     /** @handle: Handle of the buffer object to sync. */
> +     __u32 handle;
> +
> +     /** @type: Type of operation. */
> +     __u32 type;
> +
> +     /**
> +      * @offset: Offset into the BO at which the sync range starts.
> +      *
> +      * This will be rounded down to the nearest cache line as needed.
> +      */
> +     __u64 offset;
> +
> +     /**
> +      * @size: Size of the range to sync
> +      *
> +      * @size + @offset will be rounded up to the nearest cache line as
> +      * needed.
> +      */
> +     __u64 size;
> +};
> +
> +/**
> + * struct drm_panthor_bo_sync - BO map sync request
> + */
> +struct drm_panthor_bo_sync {
> +     /**
> +      * @ops: Array of struct drm_panthor_bo_sync_op sync operations.
> +      */
> +     struct drm_panthor_obj_array ops;
> +};
> +
>   /**
>    * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>    * @__access: Access type. Must be R, W or RW.
> @@ -1119,6 +1169,8 @@ enum {
>               DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>       DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =3D
>               DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_o=
ffset),
> +     DRM_IOCTL_PANTHOR_BO_SYNC =3D
> +             DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
>   };
>
>   #if defined(__cplusplus)
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
