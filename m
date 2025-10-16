Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF510BE1507
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9646B10E92B;
	Thu, 16 Oct 2025 02:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Mqw60HQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010069.outbound.protection.outlook.com [52.101.84.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99ED210E92B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:49:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJYzgsL7r4MKoHVfP1B/4Fi7nU53CdgPf4LRgo84YYMjF6b3z2vXRyzSmj2Q96SXCVNE/LcEALHiQSx96TkIlGFau2vf963rE9I+u6LWcoys5TlZ1TBz+uUA7CAmOXVtXGDj3hx/X/eY7Si4psLapfptex7/lYdpDm6yPPa3sVgJ1ZqARARoMERDOwgquckNAiBKZwfNRYssHQRY7XatXOOIfqVrY3MpoQ/V/Y+qIqLyB3/hhx2KInBl7KnB981iCD/3a2mpm+UGtZnXAVmiAVgX5QSbZP+xp2DX+DDkWoBWBfZGJVlrFwuSj8V8oSpn+ziFU08vs1CONDuYUWC13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoVVWYCkGAIaCl/giKiefyoI18INAEtwbZGp12N84FY=;
 b=T5XM1CG+bDTXbDLZT/DAsuhO88o54LYkTmsuzAG3QC+j5IcimQlkQZRg6chxUxtL4VnZZw7I0L7oxz0JrCHwVo4uq6lW8Ul5ftpt45uViui6XGC29vUgyP8NmjYB0vHPsfHV9YIDdjRf665t2vIGISb0Xa42nelupKYwpDyPYBQ+052gjtfUDJPZfzRUfKwBid/2xTILsXMA4d+AgQ3IRsmcLgWH356dpi2BacD6qOEKJF3+CjZ5dWCZoGtfquA9PqYoT/HOZOTwdsR+NMXigPLL1x8W2668QDSUQSWvjx/PmMyLLTbwfCkEd3cwj5nVpxecYOM0GC3wUjiE6PdJkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoVVWYCkGAIaCl/giKiefyoI18INAEtwbZGp12N84FY=;
 b=Mqw60HQ/YIIhrjY6w0vt/UO+zQLzAg4ktRT1PuHU2pU35iDRmtnZAnh5/JU8gJiBpmPKflNHHdFAn1ezXge4OeH6A4AcERKiaU+3/VEiSJ8hUgMiy5+tyAC18e7jO9d8U9E7W+JFajaJxiV2cimrJ+jbYHgjqn7ayp0E2t9Bxi8ds/8DFh0EUrGt8KgZXKFSoi+LOxwQ8l+sLWc5orxR5llYIMHnWz7ERIdcKjmiL/CZTl0xjNR/JOjlNierprJQ7TlgdWj2wN/hK43bKlFvjL0M6XwutSwE2PcOxnol0Z7FdTO6kRjYI4C7H4Tol3+7Cm6QvNmYeRMKZQ/Nmsl2xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB11193.eurprd04.prod.outlook.com (2603:10a6:800:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 02:49:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 02:49:52 +0000
Message-ID: <15827f15-e625-420c-987a-b9c249ff2fee@nxp.com>
Date: Thu, 16 Oct 2025 10:50:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
To: Frank Li <Frank.li@nxp.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
 <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
 <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
 <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
 <43e3e005-5d30-4450-8dbc-8c6b5a0fa951@mailbox.org>
 <be6bc134-1dfc-4cd5-8f1b-cd5431828eb3@nxp.com>
 <aO+wTX13s3rkvHp0@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aO+wTX13s3rkvHp0@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:3:17::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB11193:EE_
X-MS-Office365-Filtering-Correlation-Id: ec81d325-5c61-42c3-0512-08de0c5eae0d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|19092799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckVBVm51dVVQV00wemp6UFJBZXBqT2YrbjdSTERFMEZFeVgyRm1yZWtLa1N2?=
 =?utf-8?B?S2dhMDFKY3Uwc2V1cFl6N01rYXlheFF6WVZvaldxMy90azZhbXhHVVQ2UDZq?=
 =?utf-8?B?STFzSFFuMjRiVFAyNk54YUpXcW4rYVJtVHIwWHRsNDFveXQvMG9QaFpNaTVx?=
 =?utf-8?B?UHdERmJiKzhUVStNUVl2ZThyVjllTU04YXFNRlJvKy9BMkE4bTlROEV5QmE3?=
 =?utf-8?B?MmUyOUxoVklqTlNhemxMbU0rMzFpRlRVdk9MaUVWeEV4TnpLTDRjT2VUNmpl?=
 =?utf-8?B?ellNc2V4QXVNczdRSnlzTUJJYTBpcnJOdzJaU3NIZFFnM1dsdDgzdHd5NW9D?=
 =?utf-8?B?M21tRXFVckxrcEg2azFwazViZjc3U0tNZUR3bEVSei9jRnFCQ2wzdGFNNU1W?=
 =?utf-8?B?blJxSnpGcVJXSm1SVTBhL2laMkJPbzFwNk5Ua3dWR2tTcjFoUnRTT3ozTGRu?=
 =?utf-8?B?SVc2QlJIV3ZtTGp3ODVzeE12enRFTXZsVlNjSlNMUW9qeHBRckM5Q1pWYTlt?=
 =?utf-8?B?Q3UxeW9UcGxOcVA4cmZMNG5uZ01zdGFWVE9rcGJ3RFNPc0UxS01QMHA2Q3hG?=
 =?utf-8?B?TGlLZHkxYVRhNy9qUmRRK3hTVGFCbWtRcmdRbEFhTzlvOTcxcFV5SWZ5RFJu?=
 =?utf-8?B?UldzdmZ0TFNsZi9XL0lTSmhOc2ltY3dsZXNRWEhHc0ZvV0FiK25GdjZ0b3c4?=
 =?utf-8?B?N2xOcEhrRXN0VUlLakMzNVl0T2hhWWhsbm5SOXpKV2dId2hFb1ZtY3dwL0NF?=
 =?utf-8?B?YkNYWDdKT3dYVUsyMVJ4allIc2FvQjI2N1FHUzVsd0IvWWE0em1mb1NIMnpa?=
 =?utf-8?B?WUJvOU9aMDhPVE5vSDYxVThvV2Z2TXJWL1JpS3M4VUprWjV2ek1mL0xTSUtp?=
 =?utf-8?B?M3BhS3lrM3d6TGVtUzFTaXVtTGpTSmNXOXorVTFJOXdZbktoZUMyNmR6SVNX?=
 =?utf-8?B?ZEZwVCtxeEdqMXcvWVZEZHpJSEd0RzFjbWFSRzBjTkp6RDlKNmc1UmlIcU96?=
 =?utf-8?B?VU00TE42TU5FSFJoSlNjOUlnZ0F4NGYwYTRGY1pnUGdLYXRrbE1EQzd5Zm1Z?=
 =?utf-8?B?bkxmNDNDUitGbXFLZEhsY0p2OXJoeDhEY2NpbVFRbHFmVFE5cGkvVlJTbU5D?=
 =?utf-8?B?dzFEVkdhcUJ5R001UmpoU1dGS1M3MFBPK3NMUDM3QzlPVGNPWlBDdDBNMWZO?=
 =?utf-8?B?bXFzRWQzMTRjdXdNWTFkdTRLQ0VyM0ZyUmxzcVp2UW13TnhjTmU3d1puenAv?=
 =?utf-8?B?RTlRRi9ialJxQXhhWDlDVXhJS204d0ZJT2l5d0hpcjgyMWV2L3YzZFdkTEpN?=
 =?utf-8?B?VUUvc2svNHlkV0tNRkZXRHVzM2lRSDVYY243UndpREFWQm9xNE1WcHJVT0Iy?=
 =?utf-8?B?MHpTZWxFQllVY0tGVnFYekhHR1dSS2lXeUpmOWZNSzQyVVRPbisxVWJFYldS?=
 =?utf-8?B?bFRrblhNU2VCS3FPMlpuOUZNTm5wRzdTanVGZjJwSkVWTzE5OHFHeXAyVU1a?=
 =?utf-8?B?SmNGOVN4Y0g5WjBGT3F6YjI3L0ZrdzVWWXZBQnBOQ25zcDEvaG5NckFnaHM3?=
 =?utf-8?B?Um0wc05Ma3pkZDhzYzMzdFdCQ0diaUpmWlMwUXNDbDZMUFp0NzFCY1RWSVFq?=
 =?utf-8?B?cU04Z2NXRFhxcEJLOXY4cFVVK0NHRmpJNFoyWk9Sa1Bqby9FQzREV0l2Y2pF?=
 =?utf-8?B?SDl4Q3BQM0ZoMEVnUThjMHRqNVhNTyt2SXExTWlQUGVJdm9STTVPTW9hemJj?=
 =?utf-8?B?cjJNQnhzZFVCNXV5YlNZd2dmdzdEcHRVN3lKUmJPaGR1cXpCSUwvOFF6amxG?=
 =?utf-8?B?ZGE5RHRBRy9KM0J0UDJtNkVIYTF5RHpMSG5FdlFVZjJQYkdUYVBsYU03N3Bk?=
 =?utf-8?B?QjVodTN2aEJEUU9IeFNpZHFMLzhkNHlYbU1vYXpBSFlNQ1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(19092799006)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk5MdS9TOVdZN3c4UGF0bXhxeHp5bE9XT0dWQW42a2ZIOVA2OWQ5OHhmcnlv?=
 =?utf-8?B?L2U2dzczNXZNUTJZOEhTNWZmaUVaZkxralJCdXdLNCt2NXhNeGY3elFneDVl?=
 =?utf-8?B?OHAxSE9GYTNKTnVORkROZThrYzIxd0tYLzhscDJ5WlRuSDQ0Vi9KdU1BTkdZ?=
 =?utf-8?B?Z3NPVDNaNlFvdGNmNU44MHZFT2RpWC9PakJvMk5pdU1Tenl6ZjVSbnBUbGdo?=
 =?utf-8?B?MlFnNG5QSzNTNkppQWhJYkdzdlI5eWFKWkZpZGRaeUtlUmFYN0wvSkV0ejVP?=
 =?utf-8?B?SlIrRTRrc05Nc3JuSWp0aGI3WXdlempWZ1lvdWhlWnYyV2twSlNWa3pCZzdv?=
 =?utf-8?B?K1l2aGdqaGN0a0pOZHFRZUZXa3ZyMW5MQy8yK3JTcTNFQnozQ3RnZ2dWN213?=
 =?utf-8?B?SHBWU3d4REd2U040Uk5mUllNeFRMa2UwdldJb1dmbUI5OHlKNU5JdE5ZVnZo?=
 =?utf-8?B?V3NVWVJJaFBWK2hjT0xSbUR1bFZXV1JMYUx2ZHMyZEZDNU5hSWFWb2VBV2ZM?=
 =?utf-8?B?WmhRU2NHWldJUGh6djdDVWdJQTRZM0RlQ3p1YzBGR3VIYWVjYnEvdE43UDVX?=
 =?utf-8?B?dEpCcjh5VzFzM2ZBWVdqYzA3VXc3a0VQcjBVZDQ0dy84UGN1a05mREtSbStC?=
 =?utf-8?B?OTlxV3J6UEl3aDJpYXBJNkFFMjY3dkxNMXFEMUFtVkN2YUlRbTBKUWk1ZHZn?=
 =?utf-8?B?YlcvWC90aWEyd2R6aC9nbXdnUVVjWllQTkV2TVM2MXRoM2FEelo2Q0NlYnJk?=
 =?utf-8?B?VUUxZ3Z3QXBIL0dka2V2NWRtVDdoOG9Ha1J3cEpTV3dxSHhhdDFHYW9MSWND?=
 =?utf-8?B?WXArbHNoSE05Y0ZjMC95UFY4ZFZHbnpmZHMrRlovZ3h6amlYSnI3RXFvNEF4?=
 =?utf-8?B?OExBUVVRU2pqMDYwYW8ycGNoR0s1YVBIbFZTZlB1MkZaRnBXR041MkplRU1k?=
 =?utf-8?B?eStJTjhuRDRzejY3T1ZHTnhDOHpXcnVMMjV1RkM1eFAyQUhmT3htRTJJMDEy?=
 =?utf-8?B?UFp0RW1adVJlRUY2OFRmcStielp5dUZ1dHpybFNoL3BKelBvSGVNRXVyMXpF?=
 =?utf-8?B?UDVEZkFtOGI4TTdJeE9zSlNjRk9ablU5ckJuc3Z3RGZiY240alQ1Z3BaaHln?=
 =?utf-8?B?UDI5NFpCK2pPZzFVR0gwdzNEdzM3bVlncmxITDJVckZtNjhTSjY2blRpY1JM?=
 =?utf-8?B?akdCY1dqVTdSWXlKMmcrYW1yQ3hIQ24wNDlSZHloQ1BqV0E0VExzQ0plalFQ?=
 =?utf-8?B?Y0ozQXBkc0lmWTBWY1M4WXFPWndLNmovMkZ3M24xbXg5NExEYUNrOVcyYlRB?=
 =?utf-8?B?VGhkZzM0b01zNTdZMnRBeUxQaG5xejREUUU5YnNOaWJjMVdhRnN3dXp5Q0xK?=
 =?utf-8?B?Q3hTL0tPSDZDY0pqdnNkR2M0SmdYd0tQQUYvS0V2b2ZMUnRkdGRRTUorbkh0?=
 =?utf-8?B?ajFOMUZWNnI0OWFVRTBJVGZabXdFaGhoT1A4Um9nemlpL0tjSFdnV1kvT0x5?=
 =?utf-8?B?UFhMSkt3NVdOaVIrcXJTVGlKTFZ3b1NsZkxNZHN4eU5EYUhvODhGYWNGZmFa?=
 =?utf-8?B?U3NvZkVFZnArY245RVYvM0hmZVdKZTJzbDhCd0pUeWp5cnc1S3M4dFlXelgv?=
 =?utf-8?B?TUJsZ2FCdUhEMG8zWEk0UEZmYWdUSm5XdlRVS0ZVcDIxNVBiVUF2MGphRTAx?=
 =?utf-8?B?T2RCRzdIT1I1dkdETXhSVEVhSnYvbE1iWjdFdUF6bXR0NnBXNk1xV1cycTFi?=
 =?utf-8?B?aElzS21BNDcxanAyM3pGdVJocEc5ZmYva0Y2Nkhra1czb2NWSjdRcWFDSjQ3?=
 =?utf-8?B?V0w3RmU1eW9DOFRjaFFyK0FhOEV5T1pobWlVQjIvQ1NOQm0wZWtoRExuNE9i?=
 =?utf-8?B?Y0REZVo5akZBRlAxV3N4M2NaTTJnbll6VG5sSmttQ1pKOE5kWTZXQ1hQc3NY?=
 =?utf-8?B?R3J3WlZUM3lUaVNvYVFYaTVNTy91a1NUMnFCUUk0YmtTajNCTFpwa0prZzRh?=
 =?utf-8?B?aHc5VEdPaVBlbzBaM1NWaXRnblRRMTVPelZ1M2NMSENUd3EyUU1sVjFqcVkv?=
 =?utf-8?B?TzRrM1M4ZWNteUhHeWZ4b0FtRkJ4d0ZZZW8wdm5tbjVtcUU0SVFVZllHOVF1?=
 =?utf-8?Q?O8qHTXQiVMpTTg1cLCBNcrPxt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec81d325-5c61-42c3-0512-08de0c5eae0d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 02:49:52.1362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3wZ+JepXDIH8NHgvcsrPGsg6IYrpBndl0WOFALAnekVMRMB2Acl/MghQsav8yM4/qMOB3K1ZpHe8S5381FdZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11193
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

On 10/15/2025, Frank Li wrote:
> On Wed, Oct 15, 2025 at 05:14:02PM +0800, Liu Ying wrote:
>> On 10/14/2025, Marek Vasut wrote:
>>> On 10/14/25 5:11 PM, Frank Li wrote:
>>>> On Tue, Oct 14, 2025 at 04:03:37PM +0200, Marek Vasut wrote:
>>>>> On 10/13/25 6:56 PM, Frank Li wrote:
>>>>>> On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
>>>>>>> Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
>>>>>>> entry in each ID look up array instead. This allows passing of those arrays
>>>>>>> around as OF match data, which will be useful when using this pipeline on
>>>>>>> i.MX95, which has different address-to-ID mapping.
>>>>>>>
>>>>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>>>>>
>>>>>> This change is okay. but my questions is why need map register to id.
>>>>>
>>>>> This seems to be a recurring pattern in the driver, where some components
>>>>> need to find other components to link with them. The mapping is fixed, and
>>>>> since the DT does not encode link IDs, the resolution of the mapping has to
>>>>> happen by mapping the component base addresses to the IDs first.
>>>>
>>>> In graphic link, port@<n>, n should be id? why not use it?
>>> I suspect you could model the relationships between the DC blocks using OF
>>> graph, yes. I also suspect that description would be very complex in
>>> DT, considering the amount of blocks and links this device contains. I
>>> suspect this is why there is no such DT description using OF graph.
>>
>> Yes.  The design decision was made to avoid using OF graph to describe
>> links between DC blocks due to the complexity.
> 
> Any previous discuission? Using registers base address to determiate ID

Yes, you may find the discussion in
https://patchwork.freedesktop.org/series/135786/

> is not solution.

Well it is, based on the discussion.  And it's also used by MSM DPU,
see drivers/gpu/drm/msm/disp/dpu1/catalog/*.h, though IIRC someone said
it's not the best solution for MSM DPU.

> 
> Frank
> 
>>
>>>
>>> I think it might also be good to talk to Liu directly about the original design
>>> decision and why this id mapping was done the way it was done,
>>> they should know better than me.
>>
>>
>> --
>> Regards,
>> Liu Ying


-- 
Regards,
Liu Ying
