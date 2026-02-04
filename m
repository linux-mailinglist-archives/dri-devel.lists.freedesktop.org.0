Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNiVO8a4g2mCtQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:23:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C72ECB7B
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C10E10E784;
	Wed,  4 Feb 2026 21:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oC6XbOXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF1C10E05B;
 Wed,  4 Feb 2026 21:23:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX42st00qypDgDxzjEERmteiPtPaQddFJ67DmqokJ/KnONtx1wBRgcoGCt7ZI8mcGNTiRL9U8t5vk40CBhZ4fiEgxO9F++qvwKtHe3cNKrdYG/EJB9yVS0Nh1iws3u9yCZnr4FLolg793w96cYz14LzRrbIOkepqbIGZt3ujIbi8n9FWmx/OKu6T84OhCPG5A6vF86KIyg6tX/Knr77kMGHp/psPnAsnnJU9Q0qhxRcLDIjqSCxFusvBBMrr9d0iV7obeQ78ohvZUT9YMxT5RrdgNa44PmnKJ+0oAfSOWgYR595xC49pYj+TjKalTGbkBftad59yTZ2T2R/WF8DKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZfXcRiGVC+6+vMHTJPb2wRpH7hPI4fj/zpr9+FWhSs=;
 b=MoHIV7R4Tw3n+EiYphzCnzyRw6w956cwupibgxZ68V4xFrmuelo3ZYYw57z9cHalC3VMImzQGzFYGyyH6A0SEF64bmlL6wHAb9Nif1Dk1gLaDwhBk8GXUFJ0p52fsxSTHsY+9P7DVqIaaES4zW4vohxtlFPf4sf+gvOah/DyD8rNZQYorrRJgJHivdlpE51ESmmBO5IlHFIAi/cQ6TbVFO8p7NdkrpSC02Dwa3Zpyck84D0ftdsTTgGbEFzjlwAX+S45qIj2XSk2vNIEJK1C9+eRESbpybq7ttmxt45duplFSq7KOHOtK+aiPdQ1wFjwhimUBShN49yZjcx0vKf5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZfXcRiGVC+6+vMHTJPb2wRpH7hPI4fj/zpr9+FWhSs=;
 b=oC6XbOXm6xf4nIg0hIoCCOk8cOS4C7ZtIl0LA/E3bjOccVfILhrQV/luvBCDkseTd17DO5zWB4vHOiGMzmeAbmyhU1zCm965/XiYnXBM6i64qw8fZJcKNxmy7lDkfyjSDzGwFN0d+sEu1mXhwvqryNQeLNYa46tapJxJ/qZ/DaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by PH0PR12MB5647.namprd12.prod.outlook.com (2603:10b6:510:144::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 21:23:08 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 21:23:08 +0000
Message-ID: <0070f3dd-a521-40ee-b6e7-8b1f82e48b66@amd.com>
Date: Wed, 4 Feb 2026 16:22:32 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
Subject: X.Org Board Elections 2026
To: events@lists.x.org, xorg-devel@lists.x.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,
 xorg@lists.freedesktop.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|PH0PR12MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: 965843c4-c37f-4f32-2f76-08de64339793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yi82Q3dlWGEzbHlEVVdNQk1OK05yWkFVS2Q2ZnE0TnJ5TTVpK3luYk1DZlBs?=
 =?utf-8?B?UWtYMkhsU3p6dytwRnZXZHpZWVY4SXF3U1llSDRvdVFUeERjWTJlMWljZzB2?=
 =?utf-8?B?UGNCV2gwcndJRnp4L1dWR2p2UTF5TitVS3IzM3lhaHlKYkxEVDZIWWNkalRi?=
 =?utf-8?B?bDhQWHZ6Um04bXlTcEh3MEVwYnlMVmZ2MUtmREZTL2duVk8zMWpoZVRvUTNk?=
 =?utf-8?B?TnlMMHNvTlp6dzZhc2U3RERFMENNWm50VzJ6dDNyMGNTTXlNcE1kYXVBa3dP?=
 =?utf-8?B?SUR4eCsxaXNPNWUybEJaYitiaS9penQxNjgvZXMxcCs3OWw4OG1Dc0RIb3JZ?=
 =?utf-8?B?d2srSEpYWlFIMW5RWmFJV21JMFAybXVYejVFQ0NLVEVoTjAyWkZvUlg4eXBj?=
 =?utf-8?B?RTRaOGZIY001bzQwQ2FpZXlCR01mMW5xR2FENGJmT2xhVG5SS0YwZUZFNitF?=
 =?utf-8?B?UkZiNFAxSkJHRUtIMkZyQ3pzbyt1SldkUDZ1RS95RVZkNGF0T0FMVHkyYVFT?=
 =?utf-8?B?NGxvRnljaDg1UXBLSHhEY2tWaG9tRzhTbTRuRlZlQXIvZUdCRGpLWXZCcGJF?=
 =?utf-8?B?UzM2dmE0ckZlaHNuYUVuUXBoaFFPeG1IS01sQVdpRUlEUkxQc015THBvZFhV?=
 =?utf-8?B?UDlBdWxBSmoxdWgzUEFDU1F1UFpxdkxYb3YrTjMyZ3J3QkZNNVRDbVFnMlNV?=
 =?utf-8?B?RkNMNWtYWGxCc1VKWjN2N3o2N2pucHpDTS9WdkFKM0ZiR1lDUFBXSS9xY2U2?=
 =?utf-8?B?NnJFNnFzcnIrTWw1MEJTK1JTQytFNHBvV2VYOFdhejROK0l4d2dSVnhoN213?=
 =?utf-8?B?UWltbGdTWDRuV1R1YStDdVY1UTU0ZW1PRGF0eHRjenM0ZEJLQjB4d0huUXJT?=
 =?utf-8?B?SUpqemtwb3JPZmpaNjVYRmMyQlhDeXYwRmVwY3UybXJTMFFPNCtTSTJOd3h4?=
 =?utf-8?B?L21TZFI0OEFtZlFjWjF4ZERkN2NRbENkSlM1Vi9FenhwZTYwSXlIaytIZ0Vm?=
 =?utf-8?B?ZjZGV0RndTlmcE5ZMzRTU0ZWU2JYTHFMYUMvc3dwWDJPdUtBdWtaVldkQ3VE?=
 =?utf-8?B?MWF1N3ZjSDh0cDd4dG5XUHl2NmFqZTlDaUlSdVNKNUo4dEVuenBLdTlGTGVU?=
 =?utf-8?B?Rkpxek8wdDlBZjlUOUpFdjRkcXh4TkQ3TDRyNDAxdmNaRDU2M3hjeTd3Mjhk?=
 =?utf-8?B?dzlNZk55Nlpla3ZXRkM0elZlOWpDNVg4S3I0SHhjRlV0UE9tcnd1UXFPV21Q?=
 =?utf-8?B?WCt1UnJwVWZiTkQ1c1l3bHExUlpmbUpQdjlkSnVHaThPYytzQ0l2OTNDZVhO?=
 =?utf-8?B?bllNdXFUOTY5NGZJajRMVi92L2swZFJid2J0Uit0bDZJaUltZ3lDSlU4U2lR?=
 =?utf-8?B?Yzgwa3dRM002UGRsNDJQZE5veVVnTTJLMFVzZVQ2QVVpY3A1Mk9QOTBUS0VL?=
 =?utf-8?B?TUo4OHY4RFFhTnhuTkZNSUpQeXlLVGNBUGlGUEErWVB1YnlxUTJOdnJRT3Vq?=
 =?utf-8?B?eFo0R213KzZSK3FSbW1Hd3oyRmljVVZ6Z2RXMU1rTjVkdU01YnFIdFZrMEhY?=
 =?utf-8?B?Yk5IZ0o1MTBpek9UOU8yK3FqaCt6NmFwOWd5Tkl4Z3hPd3RGaXR3RDNUWnhh?=
 =?utf-8?B?eHBRK05KTmluTkIwdk1MRFlnQkE1V1psOGp5TjhCeG0zOVdCWUNhb2pMaW5H?=
 =?utf-8?B?bGVtTWhObUJUK0dGclhOVW9POWlJU2dsWTlKT0dNZmNnbWZHVm84VG1uWVg1?=
 =?utf-8?B?Z2ZmNkRxUldxcEwrOVRxVmlhbklpWlM4M0hZRlBaT3R2VmhKL283VXpkUm1h?=
 =?utf-8?B?aGt2Y3hmTE56djVjWGJ5UW9mUjAwUVFYWGtHNHcrenVmbFpqNUJRYXZqcm1D?=
 =?utf-8?B?czdsQyt1Vk5ycUJVOE1kUGV6SzdjcldUWWZabDFZbDhoZC9IQ0tDTENCMVJ4?=
 =?utf-8?B?ZERSRGl5MWMyQkYvYTNwam5ZMCtEWWtvZTZxellDL1B4aERpNmUvVGUvV1BO?=
 =?utf-8?B?TmZvYXJmN1hlYW5uOHp6czlSQzRtOXJqZnZ5MU01cDlYVlQ4TUliMXBMTFVS?=
 =?utf-8?B?UUJIb2x2R2FERkRpYlRnVm5xN2lmL25Yb2lLYTdPR0I5dG5BbXNINDNUQ0xO?=
 =?utf-8?B?bkcrdlgrZHRkaWg2bThyejIxWjM4aElKZ0RBajQ3QTQ5cnhOeUhKOTd3OTlw?=
 =?utf-8?B?L1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDY2WER1WHc4OVRzempGdFNwNTVXVEpVNldWMGwxaUV1L2pQY091Q0dpYWFQ?=
 =?utf-8?B?YUE4SXdkTEhWMHhleDd4UHlOSG5jbTd4QS9sWklmcUxtb2hNRy9GdnVHVEdM?=
 =?utf-8?B?YlRCV2FPVWphUnV3RHlQWDEwTFovcjJxUmNScWZtZitVdUYzMjVDY2c1SDUy?=
 =?utf-8?B?MWRTWDBGVHczZ1A4Y0JsYVB4LzV6U2xqVkNWN3BwREZTNXR5SFlBL240VUNV?=
 =?utf-8?B?WXpadDV5MnM5RUtsa0lGV3RZazhURmhiZVFLOVRlWndnSG5DQzdNU3dBUUFT?=
 =?utf-8?B?MFNTZnZZWVhuSUJhRGlSZEdzVXk1MENtandvVFc0V3JGcEZxSnlYVEJaZStD?=
 =?utf-8?B?aDVFWnlTVGZCMVlnSHpJMUh2UVMwNWRiU0RyLzA1elA1Z04vQ0QwS2dobzhl?=
 =?utf-8?B?SVZiQ1hEMnBKNGZieENCUTNqakd0WlJuVmhjRU5XR3NJQWVXc1krSm9jMnJj?=
 =?utf-8?B?cUdxSkFZa0lBSG1jclIrUUhyMi9JdXRJTERnTEpUVUJzOHhuUXFETlFhVU8z?=
 =?utf-8?B?TGsrWklUeXEwTW1WYm9qL3l3cnhQUWtTZkk4V1Y3WWFTZlR1LzFnUFFURVM5?=
 =?utf-8?B?WThGajZFL3R1Q2tnV1lmcExiaWNIN1lQU0xOcDBNTHN0bWZGZlVZa1BJNEhj?=
 =?utf-8?B?WXJ1R1BPTUdMZUFWM2lidUh3dUFXUUJIWXB5VThDKzlPeTdXTlhzblRGMDBL?=
 =?utf-8?B?OGFwVjY2VmhXbUg4YmY4UFI0Q0F2SEdVbWwyK1ZUSXZNZ3YyOFRPalZUTmZj?=
 =?utf-8?B?eS9Bang3NTl2cXNtSWdYWFlXbklzUlVBb1BLOVB5UEpQbTNKazdsOE5ySFZw?=
 =?utf-8?B?dTlkNEVwUTdLbGlPK0syRWlibHlVbkoxRGFySlZyRmg0aHNianNydEJ4OFhX?=
 =?utf-8?B?MERJUkFqQVVqeWVyQ0NVT1dydjdaUWFMU2xkcVRDOW4rZEpvMkRrSDBQVHVH?=
 =?utf-8?B?NFAveVZEQk11Zlk2N3piMmRWTVlwbjNQenI1ZXBqNlBIOHN2RzByQXNXOXFB?=
 =?utf-8?B?U1dMV1BwNVlrM3ZaUjZ1cnU5T0ZyYnFUdnFxUDNGMU04ckIyQzcxOEpEcE5a?=
 =?utf-8?B?dXlGaUJwdktaSzZGLzY2V3lPZnU5cFFPdTBEMW0vR3VzcnVsQUVtbVduUnQ0?=
 =?utf-8?B?L29LOGhYL2lFQXEvQ1pYZjU3aEhUanNBa1ZuL1hJNUhseHkzTjd3K2JKb1Nr?=
 =?utf-8?B?b1JlbG1WMU5tTVJycHg0TFJMZ21TZVh2L1VZRkRRc2MyOHhOUHBFc0pJNHRl?=
 =?utf-8?B?cFBpQWZVZnFSMWRsNW1mZWVydlVZTW1IZlFoQjN3QWpvOW5ocGkrZmZiYTNr?=
 =?utf-8?B?eDErb0FiM3h2Vlg2dUUrL1R5RkdLYjJoVE5RdVdGSEtiYWQ0MFg3RFJJNW5L?=
 =?utf-8?B?YVRUbjF2cmFwL0hybG1PYm42K3VaTm1ybXAxdm1heVZrL1hTTnNMc0NHZzBK?=
 =?utf-8?B?dU1WMlFsZUkydzJuQ010WTRKeE80bGhvY0ZIdTAvM2poakVtUG1NNDcvaXU1?=
 =?utf-8?B?TEpNVjY2LytXODR5RXNnRDdzWUZ4UEtQOEZBdEUra2M0cHAwY0U2WDJvL2FJ?=
 =?utf-8?B?eWg3NzREVzNyWHNtRFViRm9zZXpCc1ZDQnE0bEljRHBzQmNMM1BJN2NRU0R2?=
 =?utf-8?B?clJXL3FlWVRkaFhOZGxxMmhGNk8xT29yRm5PbERJU1N2dEMxTEI1QlZ6MVFy?=
 =?utf-8?B?SWVQekhhZUptMEhaVnJFdGN6bEswVUN2Ym45Q3dyYnV3clRZQ3pHTkVLMUhl?=
 =?utf-8?B?ZjNYYzR0K21Ya0lCM1RzVjBNN1R4azVtelRQRUxaK0RmSE9QRi9leVBkdGdp?=
 =?utf-8?B?VGhKK3VqMENRcG5RQXJzMWRaNVBSLzdhUzJqMXlkZjRmMVpqTWJHaXB4bkkx?=
 =?utf-8?B?bVBiM0lFSUpBV1l0OG1IREN5RlBYOWh0TGE3V2JLYVBKWGxTUkg2QjJCYVZS?=
 =?utf-8?B?Yy9mY0NCa0NwbVdmQ2NTc3FSWXJXMlVUMDFjWlFlQXdjaFNsby9hK3prVTRB?=
 =?utf-8?B?N0Y4SERxaExNZEl3SnZXWllzTjRKdys4Q0xYUXpxcmNxdU5qUThkakdpSkFJ?=
 =?utf-8?B?VlQzbUxEamFmcDF1TXRVYk9QRnIxRjBkRUQ4VnhnOWhmL3diNkx0WmpYT2JU?=
 =?utf-8?B?ejB4Z0NJeHZhai9yS2VCcnFhR01DcHMvZUFQV1JtKzVtWHF5U1RGZCtqWWVI?=
 =?utf-8?B?V1ZJdlFXSzltTjNqR1M5UmdnU2RveTUzdUxrYU42Zjhra0ZZQzJ1eG1IY3JM?=
 =?utf-8?B?TG1TWjJkZG44V3J1aDloZDJ5alJzUTJJa0sxblpncDVMdWNEVEJwY1dwellI?=
 =?utf-8?B?ejQ2c2VCa3ZVTHJCQVFWeUNhRk5WOVY3NjlqTG0zeEk4RzAxMXc4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965843c4-c37f-4f32-2f76-08de64339793
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 21:23:08.3207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3rkSXLbeVyrlZEQtc88OVb4YKWoACtbwl5F6j+zbK2Np05KmZkfISvs314iTMPfEo8K0AgE3EG+xW4/4cSM/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5647
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 92C72ECB7B
X-Rspamd-Action: no action

Hi all,

it's a new year and with that a new X.Org Board of Directors
election. Please take the time to log in to members.x.org
and renew your membership for the new period or sign up for
the first time.

These board members' periods will end this year:
- Mark Filion
- Erik Faye-Lund
- Simon Ser
- Neal Gompa

The election dates will be as follows:
    Nomination period Start: Mon February 9th
    Nomination period End: Mon March 9th
    Publication of Candidates & start of Candidate QA: Mon March 16th
    Deadline of X.Org membership application or renewal: Mon March 16th
    Election Planned Start: Mon March 23rd
    Election Planned End: Mon April 13th

If you have questions or encounter issues don't hesitate
to reach out the Elections Committee at elections@x.org.

Best Regards,
Harry
