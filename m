Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2264CCD6A44
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 17:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA0110E6D8;
	Mon, 22 Dec 2025 16:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="EbWnhTm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023095.outbound.protection.outlook.com [40.107.159.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA49510E6EF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 16:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6LbCtXiu1mSLUlmm0Zuhw1DvvuRKr78kAasL+k2xLbI1U6Yg1Ql2g2vjNPN2wLmP2Z0XXHdaxx8ChFLEZcoCJkYLHrN9mWkCOFEzR55LQFTu28jnkUVucVHxb5HpD2PomCvuFmrbmNEyx+pdHNUX/WcUYFaucVF9FBzsdSpVYBIS9GiatnzB9XFeJcIkUOlupMzIEHzhmAvxmVfgzSwv3W/5pkovSITnFV+5uCJicCcm1Oxh7T9VOvG27fKoHgED85SprkiUs3lQ97vf+bD9U7lxE7NTJSvALztInfwhw1sr8HGd/dQkAgNH4f/2wC6NJuCsKyTgQd9nsBkM9/OXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSPcGKMtfEBQOHFoOTVKEaZ9bcst4UZrRvsAk4dF0MQ=;
 b=cPeDwcfWIomDj6U3SeKsxTSVscoWCgGcRpQCeth9XMOoMQhmXQbIGjqD3zrJQYIdB6HiAk6WE59UocR0Uk+C5Fau7cUpqnRY/sWFQ8/IIm5Vwyzyr2DnTUutfiH1H348BbkgTO333a6x2n/7CZg819Kl/PacrzEyRMKWNGBdRg28HQlA7TLLcQ1xibCs010ppItKdvOI3g6xeOeEajKUnMsemyVa6z5UYngetdRaVxNXzsEGHZ3Oz1WUacN/UiBS53ebw0/ts1kIasH/hMUbs70ySOiRGx92KJiUV3vi7CXiZuAcFVyw4bw0q8edg5hB82lPGY88D3D5P2+bbmUGiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSPcGKMtfEBQOHFoOTVKEaZ9bcst4UZrRvsAk4dF0MQ=;
 b=EbWnhTm7NpNuL4QHXRICIqZx4FLf2BBoTh+obTvdnx2nQnDEh7Kek74Maweey0sxZDo99ghc0S0gCaU0sw8GIoEXgLGPiidU/OCWFM9omDWsU1oIbikG5bqe8+e9YffrMuAOozWyxK9fBpi65PoQNJLRvNz4ZqJTEBb7GmjYmSt38cziiaE2IjHdFBP7+Ie61rEcJ7kqhQ5xgOG/nusF1bwVe9SECLTPfh1cEkF9RXQCBjEcwHtIeo72ivD83xpfibsVtGckUw7yX+a18x3tEdatNAFhXnXPR2Hve1Jt5z/DY23HiCj3Fpx6IsgWzm3wAcW1+p4XhX7+L6y9/CLxGQ==
Received: from AS4P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::19)
 by AM0PR04MB7140.eurprd04.prod.outlook.com (2603:10a6:208:192::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Mon, 22 Dec
 2025 16:13:29 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::26) by AS4P191CA0008.outlook.office365.com
 (2603:10a6:20b:5d5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Mon,
 22 Dec 2025 16:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Mon, 22 Dec 2025 16:13:29 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.53) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 22 Dec 2025 16:13:29 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI0PR04MB10255.eurprd04.prod.outlook.com (2603:10a6:800:23f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 16:13:24 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 16:13:24 +0000
Message-ID: <5834a595-6474-4c50-8dea-2072e7b3554d@topic.nl>
Date: Mon, 22 Dec 2025 17:13:22 +0100
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 0/3] drm: zynqmp: Make the video plane primary
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sean Anderson <sean.anderson@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <a7aa91ad-3f16-48b7-88f6-ea03c466f76c@ideasonboard.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <a7aa91ad-3f16-48b7-88f6-ea03c466f76c@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::17) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI0PR04MB10255:EE_|AMS1EPF00000043:EE_|AM0PR04MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: e747e81f-a227-437d-ccc2-08de41750bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TTExYjNkYXQwd2daYmpCTVpCQkdFcFRHQi9pNjI3MFArUGkwWjhjdzNmYXRH?=
 =?utf-8?B?NW5TZkxiT3YzeXNqRkg5Zy9iMWhFdXg0aHcrN1Yvd2tTNG44UVBseS9GZ1hH?=
 =?utf-8?B?QWpLdzBzSFJWMTJYNVMwUDZyUURycE9qNlJ1clkwVlJJV3ptYWxyNlVTR3JR?=
 =?utf-8?B?Tm90Z25YKzZqa1lsZTllRWtreExwd0RKWmpYSXdLRXhtTkh6LzMxRy82b1pR?=
 =?utf-8?B?S21LR28zSGdZUGcwRTZrVWJuaVg1Tm9BY3JGdng5RFhsdTNDS0FFcjFvRlZl?=
 =?utf-8?B?blNocVBneE1DZkRZbllZby90bXZIT2NaaFlnM0NLTnZWaEU0WERaR3l5MEN6?=
 =?utf-8?B?N0lLNysvL1MwcTZMNmVvWTgyNDdLcVJHQlAyYlBmT2FudGlOZEFGcDFrQTVk?=
 =?utf-8?B?S2NQZ2U3dGcxOVpJanBFcnB1NXNrMzJML1JuUnRGVXhPa1dvRWtjQWJmcVdJ?=
 =?utf-8?B?L0V0WlNnaVAyRy9mNEJyOHk2N1A4dlN6dUx4cWdCV3k3eWhpWGRYME5vTlpF?=
 =?utf-8?B?NXdoZlJNWkJpWGNvM25FUDdNb1gzNDllb2VlL2VZb3h3djEyRWIrSVVOdi9W?=
 =?utf-8?B?Q01OWlB0RHpMK3l0cXU3MG5KVUVjMVdIOEM1T0hWMGRmajNoOGJpY3VkcGFP?=
 =?utf-8?B?R0hRS2pDZUJtSlhsN1hkaWxCT2tNT1ZCMjlPWWJKSFRnUTdvSklyRUF4Mlpn?=
 =?utf-8?B?TXVzNjAyWFZiU2ZLTWpVR0VuRUR1L0dQaFB5cnlxN2lKUzdFbDhIa1NYbkd2?=
 =?utf-8?B?WW5DOWN2cjQyR1ExN2JPWTk4b2IyUU13ajJNWit6TkRmUWd2b3FPOEZuekFh?=
 =?utf-8?B?aC9Ic1Q0UVRMNlo2SGppbWpFMTdiK0dzamNpWDhRN2h5aDlUUnJIanoyRFBy?=
 =?utf-8?B?enRlU1RVZERVUmJoZ2IybXBhMGtTU2lGNTFtYTB5R2VRNlR1T3dwS2NZbVUx?=
 =?utf-8?B?cU1HaDRualVQSHNpRlRNS2dZSEU4YUowbktVZnhGYXg4UHpEbU5lUm9iWUNH?=
 =?utf-8?B?bU9qZnhlQ1huTmttN0ZiQ3FXZjFhOGd5Y295amJrWGRYY204SEE3YzRTTTRS?=
 =?utf-8?B?dkNPV0dmcXVmQXNNN3BtZGlOYmdyL2Nmbkl4N1dFalMvQUovcHFOUEJMWHNJ?=
 =?utf-8?B?aXY5anhjNm5xS3NKUDJCYXRzMThZc2dLOEovQXNpQWxHb3R0RFNHb0NpZE1K?=
 =?utf-8?B?eEY2ZDd6NHhHamdhMS9kQitMWU1SalM3cnl6R3hnY0FzVHh1dWRZSGQ5aHJi?=
 =?utf-8?B?TkJJUUN6K2dLT1AyYVBYbzBYa3p3WTFGRzhtbm1GSzB2TmNTcVNBTXNXS1Jw?=
 =?utf-8?B?OTBvTWhPOUZUVEh5U3BnUFBzYnI1cGYvL2pNWjZsUWRyZmZoTXc4VHh0WmhG?=
 =?utf-8?B?bFdpZ2xEYzM1WEQ1cll2THBZN09ESXBmeDh0MW5JZmJUM2NPWTYwUngzSjls?=
 =?utf-8?B?T1hoMThiMkIwaHJYOFU0QTBwTjN5YnhKZ01UdC8rOUMrWEVJdktjK2E3MkxG?=
 =?utf-8?B?NWZQQm5aNXU5TGZyTjNUeWZBL0ppMHBLUTNjU0dNSERRUWhMLzgxL1FvVThX?=
 =?utf-8?B?MkhvYnVjYmdTN05SaTJvQ1JQS2NiRHB5VFJ3My9VNjVCcGVacjdFejJ2cWRE?=
 =?utf-8?B?cUhvQWpkdU51SjlSenVCU3VNdUdQMVhvQ1p6eG1sOUpQYjNqNzVxYmQxTDFI?=
 =?utf-8?B?Z0orVnFIRk12N2NvNE5UYjJjZ0tDM2djU2dlK0luU25HZGVuRStxSnViSnRa?=
 =?utf-8?B?aG00TktuSGFLTUU2aXhNT01COFMyMEI3ZHJMeEU0NExoYWRyVGthblR0WUVz?=
 =?utf-8?B?bXRXMjNVNXRIbFJpTWlGclA4Zy96UGY3aGRUa3pvWDcyY0k1US90R0lrbmZW?=
 =?utf-8?B?SXVyMDhGQVFIVXV0dUR1c24zRjUwWnp3bE9EcE54OGVuZkhkckw4Uk9iVEhS?=
 =?utf-8?Q?UNWVxZolkPs/ezwClPPsKvu+GTulhRPF?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10255
X-CodeTwo-MessageID: 05a0fca2-72ab-473f-b91b-568b6d5e6ca0.20251222161329@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3d0f051e-9693-4360-5ac7-08de417508a6
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|35042699022|36860700013|1800799024|14060799003|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmdzYUFJeHQ0Q0lrN2R3aEZKTm9TNkkzdm1iVCtvNnhrcWNXYTU2c2lLenU4?=
 =?utf-8?B?ekwzYzZveDlTSXhCcmtTNjRNbDFidG9NRXdVaUlOdXQxVWZudWJER1paNTB0?=
 =?utf-8?B?UVFqK2xIbGtjQ0xjdW1vZjFaY1E1d3cyMXZTN01FQnY5Z1VJa3RzSVRVYjdo?=
 =?utf-8?B?Qm9vWmVaenV2NzgzV3c5RnFKUlBJVFFyMFpYQVRxRlNmbWNSVFJ3Zmhtbncx?=
 =?utf-8?B?L2xpRzRCSzJWK2RTcG1yeUs2QkNoaVZlYVRqMlF3R2kvbjdlWWp3dFE5d1JK?=
 =?utf-8?B?UzkvUG1SU2FaUmJNZjNMcTZ3ZWNtWWJjWG0zUmNZM2p5YmgzQzdLZGhQeVMr?=
 =?utf-8?B?VjlFWnE5bVYwdDVuVHBicWwxVUJrUDIyejk5NjF1ZmEvTVdueHlObXpzZVVJ?=
 =?utf-8?B?aStURTN4KzY1NklWRGszRDBFWVoxQVFSbFlZUDR0ZGRIUzNqRjgvSFNWbDd1?=
 =?utf-8?B?MWFkbmlvTm9vSXo4SjlDNk9nSDNQK1lXc1NhbDVFZEMyaDZGMlVJN0xkOENK?=
 =?utf-8?B?VEE3cnZYU2cvTWtnNlJ5eUdNVjg1eFAzajVhM2JZTHBPMlBsNk9sRGp0M24z?=
 =?utf-8?B?czh3R1NEUTZIK1NZY0NlSkpqVGpjRUVGZ1BwendINzlnUk9vRjdWZHNsUlhh?=
 =?utf-8?B?Z01VKzJCMXpNbGxRRERYSk9TaVlVQVJXaFpQK0tMQjk1WDNEL0FoVDNaOTBB?=
 =?utf-8?B?V3FhcGxlTWlUemI2NU9lTlEyQ0VOZUpHdWROSWpHTGRxZzBjWHJmeFFyUmF1?=
 =?utf-8?B?WXZhVk9TSW40N3N4ZDkvZ3RaUi9RQngwN2VtVUFXa0JkZzRTOWRpWHB4blA0?=
 =?utf-8?B?V2syM1RJeE9wQmZ0N29ZQ1o3b3lhbXJTM05iTitTNWgrWW93RmJvMldsNWlV?=
 =?utf-8?B?cGNjM2ozUnVMVUM1Y2xzcDBFbkJnZStMdVpsRUFZNWNsSUxDL01mK0g5Y0hC?=
 =?utf-8?B?TjRiZkVJWWVXbVZBMkdwOWxOSno4eUcxdzQzZDlzTDcyUElDOUx1eVQ1Nldr?=
 =?utf-8?B?V3dXMm93SHJtdjhtNzcyS2FTb09zc0U1TWhhK1lVVDZWbkxIVWpwV2RNSm80?=
 =?utf-8?B?WWRBWEx2Vmo4NUJMR0JHNnlybHZvNjJlVWZMVE5XQkVzRWlsODN5VU1GUzQv?=
 =?utf-8?B?ZFo5ZkFDcUQ2TFB6alZiN2k3bVFjalJOZVpFNlQzQXJsR2JObndST3RaTjhC?=
 =?utf-8?B?VUJxRVJNV0dadEdxZmVsUTBOUlRiY29PbDl6Tkp3aEw0Tk5KMXFzSDZGalFl?=
 =?utf-8?B?OWc2cW45OUlRQ0NHZlJqMlpPejNSVnF5UGkwVXMxYUlEZ25GcnlyV3lPZ3Rm?=
 =?utf-8?B?MU94VHo5T09FSnlmRWZWTVl4a3BNNWlmNzdLMDRzaXFnalcwUzBTeXhibHRv?=
 =?utf-8?B?cHlzMklpeW9xbGZrNUkxNjJYeXR2TUFTNDJyUGhMaEdTV2NRTXlabXlpYXlT?=
 =?utf-8?B?b00zZ0hCQm5YSzBzaXZrbzZhSjJYWTJmaHZhaWJtY0xXVUtYVC9STGxxUGkx?=
 =?utf-8?B?TmJlM2k1Lysrd2tnRWlOVjJwRDMvdTU4UEhCT0Z2WDFCODlPd1FFVk1qZGJa?=
 =?utf-8?B?eGtGcS9ZVWorVmJ5VXh4TUcyTUxRNGIvK2VPZVhmV1pKOWNXQm10N2wzdXFw?=
 =?utf-8?B?bm5JSXNEeTlISXdjMDJvT3R5aC9VYmllSVFrSnlQZVNlR3hBVDI3KzB6bGF2?=
 =?utf-8?B?UTlvamVkYlMyQkd6SXlFVTFPOHRRS0V5ZVIvbGp5VXVHQkJyZEJLd2UyYTgx?=
 =?utf-8?B?R1RKWEtJUTd1N0VNTVVOMDVKSFNXWHhoblZSSmQzOXhaZVltOWdvMHR2N0Zj?=
 =?utf-8?B?Ry9mVjcwek56VnRlY1hINGZTa0wrTFRHMjBQdFRET2hWYmpESXRVZWdpQmRy?=
 =?utf-8?B?N1RGVzdqM3UxVk90RGhKd0tFVER2OW8xU01pRGZHd1ZMRUpOL0tFSTB5ZVhF?=
 =?utf-8?B?c0dvblo1QVBKT3VJajVaRzZhNkh6RGV0Unh5clNwRmVpVWZEd3FXKzVURTcz?=
 =?utf-8?Q?2oDPU/qzp+oFUOZMdm4D1Gc9a74Tc0=3D?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(35042699022)(36860700013)(1800799024)(14060799003)(82310400026)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 16:13:29.6593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e747e81f-a227-437d-ccc2-08de41750bbb
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7140
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

On 22-12-2025 10:48, Tomi Valkeinen wrote:
> Hi,
>
> On 13/11/2025 22:37, Sean Anderson wrote:
>> The graphics plane does not support XRGB8888, which is the default mode
>> X uses for 24-bit color. Because of this, X must be set to use 16-bit
>> color, which has a measurable performance penalty. Make the video plane
>> the primary plane as it natively supports XRGB8888. An alternative
>> approach to add XRGB8888 to the graphics plane is discussed in [1], as
>> well as in patch 2.
>>
>> [1] https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijma=
ns@topic.nl/
>>
>>
>> Sean Anderson (3):
>>    drm: zynqmp: Check property creation status
>>    drm: zynqmp: Make the video plane primary
>>    drm: zynqmp: Add blend mode property to graphics plane
>>
>>   drivers/gpu/drm/xlnx/zynqmp_kms.c | 42 +++++++++++++++++++++++++------
>>   1 file changed, 34 insertions(+), 8 deletions(-)
>>
> I made a test with pykms and tried this series with a few different
> things. Afaics with this series the driver behaves as I would expect the
> driver to behave. It makes sense to have the lower z-order plane as the
> primary plane, especially as it supports the standard XRGB8888.
>
> That said, I don't think there's anything that exactly would make the
> current way of having GFX as primary wrong... So I still don't see a
> single obvious solution to this whole issue.
>
> A few thoughts:
>
> If there is no regression here (i.e. this just has never worked well
> with X/Weston), might the actual fix be in X/Weston? Is there an actual
> bug in the xilinx driver?
>
> On the other hand, I think it makes sense for drivers to (try to) expose
> the HW in a common way. XRGB8888 is the standard format, so it makes
> sense to expose XRGB8888 on primary plane. I think this is how the
> driver should have behaved from the start. But if changing that now
> would cause user space regressions, it's not good either.

I tried to get e.g. gstreamer to use the overlay as output (in YUV=20
format), but never got that to work. Having read the comments on these=20
series, it's probably the lack of positioning and scaling capabilities=20
that made gstreamer discard it.

I expect no regression here - everyone who got the DP output to work=20
must have been using some workaround already. The driver as it is now=20
never worked with X11 (or wayland) anyway, unless you forced it into=20
16-bit mode.

And given the capabilities, I seriously doubt that any user ever used=20
the overlay plane.

For what it's worth, I'd say the best solution is to swap the planes and=20
support XRGB8888 mode properly. Then at least, X11 and wayland work=20
without further configuration or patches, the output quality is as it=20
should be, and as an added bonus, the performance (with or without the=20
MALI GPU) is much better too.


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



