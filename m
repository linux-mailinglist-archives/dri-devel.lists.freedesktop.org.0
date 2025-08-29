Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A652B3B4BA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6AC10EB55;
	Fri, 29 Aug 2025 07:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HhBYq+2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3377510EB55
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:51:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HV0B9+LPs+aylea+pYSro3HvgvbWosIPGcTwTY3KaclrfyYEDEPoRgk4AGd6tlLU+H3dfK+teGV9iRPd0xCWoFG3yvogHrhJ+E9CjckY1fn7QeLVLgx+kxN4wJlq+eGXQiCjKnqFPvtOJ+hLqeAyrw0NNWYmViQ5+gkKZndroiD0uIoGNgTv2I7niu/TsZU2mGonKP0ysN9Zy9s4oPqAzGm5KgNGOSObEDhflXtNr+tjj4UgKFNUwdvOFj08/5X6GRoCAYbnmKOwhGglBc38FYIcH9K+K/fbyCD9j9UALJOkwvLicsT0PEJ0Xk2dHTjq9yfuSxdh1wFoUGjuI0ADiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll1HsNIeVipXg7RU6caRpskz2ufgyF42xa2+aj/VDbM=;
 b=gh+h1vCtXqo0k+uk5abfQxYPEH3P3jJxtzVG5QbmUPoZ0cblCgrAaf5ndcp0FtMXMokeCpJDmGgwIwb6o3/O9p0E5QV6zcwVcQaMleAfas0lc5rrI/QHBAjhNrkHeR698qh/rIwajB45GPpqGbg43R1OQ0ztEXroG6iNHaljm5uHxjIaSGhEH7qy2QsqoBeWytpfUM2wS9KphOEqb27OtwOgg/uoPGdDyYv6u3d36qCbMTG0nU6rN9SqEWpvCpZBhwig845x65r/D2npiSeEdDZKngKny5fBVB2fjoudF++9pk4sOlTlSw6m4CdYf1EECMjfiWPlVu+173jJpPd2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll1HsNIeVipXg7RU6caRpskz2ufgyF42xa2+aj/VDbM=;
 b=HhBYq+2cs2Fj+AHY1LFq6IV7Ep9bSUHT6kqDvubnIIcJs90FMnrlzmrJPtS/zYIPtcTPLiz/sZk/GWRkqd0yHLInhBDyUt9oZbbcRseI3o+xn4ZP5AhDh4v5VRk3wdIf9dAOPP0GdYQUhdNJ5B998AL8LLgbgX///JlQhgsGEtIqeEkItdofCWI4gW0+lgmheNHP6WUuCgECChBDG4zVKElT76J5byWIccx1vXWPkSnk2Dk+L20o+0DtZk3EYKyxP0WjwADQkYY7SJU894yW78jCoCQL2mU8bW0qlI6oFibGL4RU7rpFwbsDR6FxZ0FQeNdRSczVivcFE5oXR+c3ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9058.eurprd04.prod.outlook.com (2603:10a6:102:231::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Fri, 29 Aug
 2025 07:51:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9094.006; Fri, 29 Aug 2025
 07:51:52 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 29 Aug 2025 15:53:14 +0800
Subject: [PATCH] drm/panel: lvds: Remove unused members from main structure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-panel-lvds-remove-width-height-v1-1-acecf0c84dc4@nxp.com>
X-B4-Tracking: v=1; b=H4sIAGlcsWgC/x3NQQqDMBBG4avIrDuQpNiqVykujPk1AzZKIqkg3
 t3Q5bd576SEKEjUVSdFZEmyhgL9qGj0Q5jB4orJKFOrxrS8DQELL9kljviuGfwTt3v2kNnvrJ1
 6PSdlrX43VCJbxCTHf/Dpr+sGu00QqnAAAAA=
X-Change-ID: 20250829-panel-lvds-remove-width-height-1d063f0bb178
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0192.apcprd04.prod.outlook.com
 (2603:1096:4:14::30) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 350205c1-ceb0-4059-2975-08dde6d0eacc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|19092799006|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekE3eExPeHVIZ25ycEYwemJGQ0tXc3VoK0xleWk4WWt4bkI3QmZtS0trZVVO?=
 =?utf-8?B?S3lXcUFPUzZ3OE1mWHg3ZzRlcGdqbVB2K1hSbjhVRDN6RGh2UkVjMG1nbk9k?=
 =?utf-8?B?Q01kRG9paVpWL3V2ZWRXRWVCcDZSblN2ck9VVlJBWFV2dzNiVWZRMXUwWlBT?=
 =?utf-8?B?a1UwellkYlhWY2xyRWxETk1Tc2V2UGYyeXlkT05YWURzNmRsTkNqeXYyVEVo?=
 =?utf-8?B?b25VUWxUOGFGSk1tV3BhSVZJWUthQmRRdjZLbklQOGVQczVhQ2dzVUZlQ0FC?=
 =?utf-8?B?bHd3L2xPT0g4aGRsb1hoVmVVYnVadXhiK1JpeUhWWlhmcU5mTndJcDRNMVNu?=
 =?utf-8?B?WGpBVWlRTWJmd3BzYmhnUG5MSy9aN28xRkJzNHZBNEZUYXFyM0FEaHowMFNW?=
 =?utf-8?B?anlxcFA4ekxrNkRzcDJMQmVVYUIxM2ZuOUFPRmNDQW40SEdmUlhsTE9TL3pl?=
 =?utf-8?B?Mk9YMUlBcU93TmRZc1hjeW9LWkQrUHVPckQxOGRBeGxJeUlmVW9tNXpjQVFU?=
 =?utf-8?B?OUk1ekl2YzhsWWNtUzd0OVhsb3NyTExkRHJNZlFzbEJ1NjZJaCsxT3Y1Qk80?=
 =?utf-8?B?RFgvWE5zNXNBS0JVaFVpT3NjeGx2U1dIaTFpQ2ZNVlVORUZGcUFFOG5ZL2Nq?=
 =?utf-8?B?L1MyMUJJLzBaYW9VK1plMWxYb0tCemg4anBuYlAweWZ6RmxVZHNjcHZVREdi?=
 =?utf-8?B?TVdFemZRS2VPdk9zUm9zQ3NHaU52Q1dNSTBETmRHdGtLSWR3WlBmeXVPak1K?=
 =?utf-8?B?Y0VwQk9PRWs5Rzd4TzNCREFhcDYySDZkdjJvcERGM3ZFRWVqdWNXN1pvTEcv?=
 =?utf-8?B?ZTJKSGNsUXg0T3dZamdUbTF2MVNkTnlLbUxMUVo1OGVuNXFvZWlnOHFDWktP?=
 =?utf-8?B?V2ZuNDdnMFIrUHZaNndJT3dOUlUxWUdPUWJkQzFLNlBoWEkxVXhDYUtKNS9M?=
 =?utf-8?B?Z3BUWFJHdXNLaGk4NGdncGhuKzU0dTkzNWtZNEtzZXYwVXpqeHl4Y1c0NXFv?=
 =?utf-8?B?bCttOHhEU2JmUUdSSzRxK2VCQ1N4RXM4QldTQVBHTkQyeFE5a3FFN09qYktm?=
 =?utf-8?B?WEFBQktJVWRTalN0TEdBdzJHc05Cdk5RRWxrbVlrZ2tsNTdlcElGaHNreUow?=
 =?utf-8?B?THlDV0pJOHVoZW5UTk9WQXpJN0g1cnZnSUszQTZVVzRNOVhhMXJZdVc0SUZF?=
 =?utf-8?B?TS9VaGtqdWQ0ZTVDYWdVb1dCK3o1VmI5YVljYlJKeG80alA5UmxKMDNNQUZD?=
 =?utf-8?B?YzNWZTdlWThmVVRWL08wdmhyclp0RXUzSHNmUitZWGtUbUVsMWlDU3pXQ3Zh?=
 =?utf-8?B?TVdtNWhUWlpGODFrSUxtWWNnM2FTL3V2MFRJRUJoTmpCajQ0dklSa0ZWUUhj?=
 =?utf-8?B?SFFvUmRJRnBRa0k5c3AvcjlFRG9hSFBuQS9mcW4wSFM0RFJBZ1EyR3RuVWFu?=
 =?utf-8?B?R3Nta1pEWFV3K2xzUlhXR0ZXN040eS85UFVVeGF0UjFoRUREdHNOUE9mNDk5?=
 =?utf-8?B?UVNaTnpXVWtYRDl3RjF3dUE0aS9oN0JNeWtPR2luc2cvbWI0SXNGZzNJemRl?=
 =?utf-8?B?OGEyL1VWWVd4VklqUmc3cHN2YmhWMm9DWWd6VzBFbFpYUktpbHdpV2kvVHlI?=
 =?utf-8?B?dGhuMlZKb1ZiVWdVSnNFTmxpeUp1NVBsRUlqR2pqTUYvMU1sSXJqd3AwUlk4?=
 =?utf-8?B?dlRCWENsaWh4WWxEMXB1QUpvTDY0VnErZW5JYzNRZFcrTVR5U2xDMGR4KzFs?=
 =?utf-8?B?Tld3MW10Tkhqbi9LTzFXdGNPTzNMOUZzeUFKdXZsWXRqSXl0engwWndxa20w?=
 =?utf-8?B?eUdGWEpRb2ZIYkV1R0dzM1hkeXFvT0pjdmhLYm85V1JnWnp1SXIrZjBCWUJv?=
 =?utf-8?B?MzN4L3ZaNnlGcnZ5QmhtNzVsNXVIQUV3OFhwbXVpOHBFaENoOUJseXB4bUdI?=
 =?utf-8?B?QjZSSjBwRnFFRTE0cEZ3aFI5Y0UyS0N0bEh6T1RmeE9uRGZERlBBQk1PUzFp?=
 =?utf-8?B?NjRhZmJxZHZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3IwMGhxQUQ3Y3JnZkx4bEZiSHcrb25tdjBrbVNxRlI4bTYvWnJrNGFCdlJh?=
 =?utf-8?B?anE2UmNzV2hFUmROM1A2REo3RjQ2ZzA0WGpiamlRNGhkaEJpc2NGM0RjMno3?=
 =?utf-8?B?Z2xjbkpoVWFWU3B4eFFET0F1MGtJMVBuUDJYektuSFZDMEhveE1sZVlzc2Z5?=
 =?utf-8?B?K0l1R3Y1K0pqeWpTaG5vVGk0SUdqbjZuWnEzMnR1RzZ5eUUxVTNzb1ZOaU1j?=
 =?utf-8?B?NGZESDV0SmhWMmlCOVZwU2F6TlhZMnZPcmZYa3liQnhsSDlaU056MlpEVUI3?=
 =?utf-8?B?NTlRdGdoVkV1WURNSFVmWHZORW11dW5paHloYWhUOWNUK3J5cFl1K29IMy9K?=
 =?utf-8?B?OXhoTGdDVElQYUZUSkRrWUJISDRGRkNKbUlHR0VadWtIMU9OTWZTWTFtczM3?=
 =?utf-8?B?ZlpZaDQ0QVBDc2xvbVF3OUF6VFd6bUk1QmNudGJ1eUw3K2FyQ1gyNURFTElC?=
 =?utf-8?B?MGF1ZjFKV2pRRjhLQ0dJQlRyTVdvWmtFaVI1T0hmZjVHQkc1MHl4bWpwRlhI?=
 =?utf-8?B?c1psWlU5VjdYcExvRlNyMVFiK1JjQzhGZlFKMmVhckIrbkhlRmZwY3krcG1I?=
 =?utf-8?B?QXhDb1BBUEo1S2tvZHpCaHdudGpWMkVHUnI3MENWTHgvdHdzbGFnQy9NcDlN?=
 =?utf-8?B?cU9hc3dXOVV0V1F1MUlwd0xxVzVyYTNvbTdTS3BqTHZTL2NtbXlXRlBweExv?=
 =?utf-8?B?Yi80YkZiSTFNeTRhZDR5RTB2R0k3UzNLV3laTmlUb0xtR1krYzlmTXlwbUlT?=
 =?utf-8?B?UXA5VWFvRnRDQWNNaUhwZDc3bWF3MnBuLzI0VlNBZWhuenNpMjAwTGl4QkFN?=
 =?utf-8?B?Y3FHSWN0a3RKby9VSnZMclZtbDNIUC9ZRzAyMlB0T1lCK1Y3b1E4NWhrSms2?=
 =?utf-8?B?UDlGM21jWUJnOE1vdXgrcWNGNE9yR3Y3OVlRNUMxTjhyVDIxUHQrVlNjV1lP?=
 =?utf-8?B?aWlFQzl4K3BqczJUYXQrL0lSQis5ZFJTdXAzWEpWZzNKUkxDejZlY2UzVkN0?=
 =?utf-8?B?YkNDQUlJMW4vVVdsNkQ5c1dEZ2YralV5MVpJRHdRNVJUeTRMcUk4N1Zodk1k?=
 =?utf-8?B?TlErVSt1VXg3c1UyeStlaGdOSzFJS3BlcDNzYitQWnFWVTB3Ri9xem5JNFBM?=
 =?utf-8?B?cm43Z3o1WDRHMEl5SUEramttM0Nxckg0NGhmS0VZcFZqWXFuU1o5TUlBRHU1?=
 =?utf-8?B?TGpQZzRFdkZNYkxYQituME02VnV5N3BtbFp4dDdvTGVOMzRaYkJoSllIWnB4?=
 =?utf-8?B?YVJaTnpQVHVYRkdTeW1EbXJCZHVJVHB1bms5endZUzB6VmxRZ2VFMG92UUN4?=
 =?utf-8?B?anlYM3FoQlFtamhHWVVycXU0U0djaXBNdVI2NzRkVC9aNEovdTlVMGFybXZ0?=
 =?utf-8?B?K0ozd2UzVnY1cUZBZXVtWU9xVG5SeU1pNko1WGQyeVpLWEd4TTFRanNnQjJx?=
 =?utf-8?B?WEE3SWVhUEVtTGdITHB1MnZRYUlLdWRRZ0tTT0xYaTBTWi9MSGFqVmlZaVR4?=
 =?utf-8?B?REFhTkZtOENEZGt6VjVwTjdoQmJiNGNpR1o0cVhqRXF0SXdIZnlDMStkbmlO?=
 =?utf-8?B?UVRCQjRYQ09xclVXRml5YWRUQ2FCVGNOSUZONW9TbmptS2N1TGNyRjdqOFVi?=
 =?utf-8?B?UXROSnhqdWxuMExsOVRyMjNJT0xJK0ZIYlZWdzdzR3k5ZTViU3pKSDJjL1R1?=
 =?utf-8?B?UzFiU2oydGIrbUIxcUVDdVc3cENIVHQxMk1YaDBrRGpEeGh5bVNRaGlUWHY0?=
 =?utf-8?B?UmVaSWRWcEt6NGN6NDA5ejB5NWg5SnpWc2g4TlpidlZuUktmbkRrVVBxSkVN?=
 =?utf-8?B?MzBQeENiYi92dU9vZm82d1p2bmlEZUpOTHpqaGZnejE1YmQ0ZURzTHJmMnU2?=
 =?utf-8?B?eWozSXpGMitabUJFMXc4SlRIU2JXSXllTGhZVXZwd0VmUzF1OVNIQnR0aTFt?=
 =?utf-8?B?aXNWaXBGekxLQkE4SnJ3Q24reXRlNzBQSytaek9oYUMwY3YrU21rd3pneStW?=
 =?utf-8?B?eEMvdGFETTRXdXloNFNXNVgxdnJaaGN4U0cyaTg1c2dtN1U3U3ZFSnJiQ0U1?=
 =?utf-8?B?cWwzdENZS0VOa0tpVmoza05qK1pwRVBlZDdDRlZ4eHV2VDRUTnkwZVN2NnJC?=
 =?utf-8?Q?gA6H3qkWBPyGFZTypkk6JdpdE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 350205c1-ceb0-4059-2975-08dde6d0eacc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 07:51:52.5492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6c2mhG3U3GbXLpoN6SU5xZut/zgbuaGGBKOCbtHLTUdzxQ+yCfR5E7PCxEOYdK2aZfCTIMFFA7VkeWaihAh+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9058
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

Since commit 03fa454bb666 ("drm/panel: lvds: Simplify mode parsing"),
the width and height members of struct panel_lvds are no longer used.
Remove them.  No functional change.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 23fd535d8f479045a87b0f51bec17cd7c66b0f75..46b07f38559f35aa3b0a41662cc29480e53e885f 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -28,8 +28,6 @@ struct panel_lvds {
 	struct device *dev;
 
 	const char *label;
-	unsigned int width;
-	unsigned int height;
 	struct drm_display_mode dmode;
 	u32 bus_flags;
 	unsigned int bus_format;

---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250829-panel-lvds-remove-width-height-1d063f0bb178

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

