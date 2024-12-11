Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648219EC48D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C0F10E3CB;
	Wed, 11 Dec 2024 06:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SxsdWEn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4AF10E3CB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 06:03:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PweOYE7RccX094i8MkelWFjD3ze2xR4iJgn4/2zML6fpZD8/5giUjqFqdWdjG3HBnDG0xxEUqmO4kI8EtpHGBHIyLZ1+Rv9BOqD0FoAEMn+sislx9KkllQZNd98fzc9b/+bnFPAuvziwrNshelDZGU1CBMMVF9Y6VlowIn268fYNtocs+HafhKAviTRVwqSx6B9S5g+ml338Wp1wObnE3juJ2HgfQwI5XTsWagTllHVCx7h+iKJuzFJBwqNET1pn6RcOZ2joiODOaRmopEgP4P82UUDhC1Ws6jDtweTMn/Mwq6sxhnoVVEn6cuKK3mMIEXhTJYu+nLw0mrdlrdXLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05/6pg70TBLXAQuT83QFA33TFYFC1yx1HD3XaEjD/8U=;
 b=TynbIS/bIUg5s8tC/3GQLvrTnTqDmqo6FQA/KCVGVi9dOLZ97mzb/v8PycoHurYPDloSocVOijqzeWdq7RoBeHvWIzYqkF8riCIbBxRIFhC7KehtLNxFvJYIcs2m9bx1Vt3QB+9EAWD3xWO7juieFcUUGP1OwzZxOFjqZ+yQZUiMCBvQC0zHm8EPCsl8V18Zmpp1ETdCT0Gf3GbcA5PZGyQnm3dkLBg4Qtw+24VSCEyTjf6hkvqYsVoeb55b4hkx8ylH09aMca9QNLowi9d4iJX4283gdlfuUJCBRb83k9Vl6jfJV+aUwBknfN6Iyw5YtPhASZ3hi4AySIgZiK1kHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05/6pg70TBLXAQuT83QFA33TFYFC1yx1HD3XaEjD/8U=;
 b=SxsdWEn9N5YuAeHZXdBIGKtud2z/TvVFEA828U//RCp+0fhagtCV70f60YaTFiCmH3wDvy3d0rwVNB6EKVYWLPyw+hCik7zl/TzjQIkoIX8KRXc7U+r0SIqfze/Nunr9t6UXNM8Kjam2jB2w7EzCjxbnqjVVKTxEUw+SHHLMDuXpIFBO+y/Tmtf42EW9qiRVmseca20HtAq6zTpHpuiOEG/Bpt4Bib161JJRpXH6kEddHkFsvZS6Luh9r347r26AM9VJXE9znJY/cgrKImNSfWNjeB/kQ7C8M5sdFCdpObuwAs5GqJj6ZzTDTiS6mqQSaiRBru2qWoVFx4b3hRFvyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10163.eurprd04.prod.outlook.com (2603:10a6:800:245::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 06:03:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 06:03:38 +0000
Message-ID: <5909ba3b-676e-48cd-8ad5-8a0defee3d81@nxp.com>
Date: Wed, 11 Dec 2024 14:04:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/bridge: ite-it6263: drop atomic_check() callback
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
 <20241210-bridge_hdmi_check-v1-2-a8fdd8c5afa5@linaro.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241210-bridge_hdmi_check-v1-2-a8fdd8c5afa5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10163:EE_
X-MS-Office365-Filtering-Correlation-Id: 989951db-ddbc-46c4-032e-08dd19a98df2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TExPalNMZUxiaGRJak9QbDFyK2Y0MHBCams1NU1ub2RENSsyY3djcm1mZ0NS?=
 =?utf-8?B?NmZIKzJMM3d0cEhHdGRPZWoxVHlWQkRrNG9waHBEeWJzWm1Kci9JN213ckFH?=
 =?utf-8?B?aUMrc3cyY2NMRG4yb1FEL2J4ZGRJbWhneTY3RGhwL0M2dWtGUVgvbUwrSEhz?=
 =?utf-8?B?OStQNXNBblNmRjI1aFFUc0l3UHRsZkF6S29KQUZwV2xDNGdrTHRnQTg0Z2c0?=
 =?utf-8?B?S2plWTdWTmFxWUNPWkRpRXoxcWFvdFBUQ1drdjFRREE0R2lZK0JtRkN3VFkv?=
 =?utf-8?B?QTMvNm5WckFNck1tcUpOK04rTTAyaS9nL1FGOWhqUHQrVUlPSzlpSzJxeDNh?=
 =?utf-8?B?bnFieEpPTjRZUXpuRkRHeUNwYWludDErUGlqcVlGbTQ3OHBOL1Fvd1hlYWJJ?=
 =?utf-8?B?Mk9zSHQ5Rk9rQVVjd0kvcUpIeFZ5WU00bEpuc2dhUmE4MVZsOVU0cDA3MXBF?=
 =?utf-8?B?L0ZLOGNOTzN2ZHUxRnplZmVONGxXRXhLSXF1MlE4ejE5ekRkeU9PYnpiU3A5?=
 =?utf-8?B?dHVqVDc5RDJMZ0pQdTNpK09kRGJLeXJTZ0VMNGY3aURrZ0xQN1c0aFBxcUtU?=
 =?utf-8?B?Skx0RHNLa2FRKzdSdm1vYVBtWjJYZ1FvLzh0dUdSN2FKdi8yb0hUSXhzY2Vi?=
 =?utf-8?B?eXhPanRQSi9adC9wbjg5ek1TcSsyaUNQQytDVmRZWWRlMFBmNG1abjZpbERp?=
 =?utf-8?B?VnovU2Q4Y29hWno4Y09GbkRvV25jUDFqQVFEZEVOTVRxbm1URmQvclIwMVRB?=
 =?utf-8?B?VG42bWxMbE1pVEgwMXEwa3c5UVNKbnE3SEZuNG1FNUNEOXBmL3lXb1kvRU1z?=
 =?utf-8?B?VUs2bktKT0dKL0JDRi9HLytpcVFNM0RWM1hTcUswS211R25hSFZLMm9rTlhk?=
 =?utf-8?B?KzI5Vmp4Y0p0Y2puemErempzQlNLcDJGc2Z1VXNIMCtIZVZqNHk2TjZQTm1i?=
 =?utf-8?B?ZmdnRXVSTzFjeHkxYmg5dTlzY2NsUEF5emdjUGxBTlpMQVU2SDE0TTJFZXRP?=
 =?utf-8?B?SzNEMThOUzg4eXl6QThvUDNOcmxLVVNUczAwWHJ2RStkNVBkSXdhVlg1TDZX?=
 =?utf-8?B?VjAxdDBFUUNpWUtkREt2citXa1BOSWs3UXBwaituNkx2TTBjYWQvaGpIcHVG?=
 =?utf-8?B?eWExYWlMVXJDRWdIU1hzbU4ralllRDAwZFZKajhWaVRCaGlDQ0RFS1lzYkhx?=
 =?utf-8?B?TUljcXVhSjd5VGVGMFo0NDcyKzlyYWFqMzdzakpNUWFiRGg1UzBtL0I5bEEw?=
 =?utf-8?B?Q3ByNVBrQSt3ZHdwNGlaY25yUTZMVFZjTUJmbHFad0pHM2k0L3Y2Szd6SnRW?=
 =?utf-8?B?NFU4U3duUUJtVkc4WE9hQzF1SCtwTytQdlJ4cXpBZnU3c2Qvc213M09pUVRD?=
 =?utf-8?B?QVNPQTladENqQU8yNmF2NE44SHRkSUdqcUdrZlRGVXFIQUF6VVFUMW8yV256?=
 =?utf-8?B?RGFJQU90UnBjQUtCcXpnMGhzdGVsVXBleS9teFJPRHpFZWtET3dkRXU4VjJB?=
 =?utf-8?B?UGtHcDdWVDdCZEVQVjRWbVBaVGRKWXhLbWh3OThHQkIzaVNRendEalhFSzhv?=
 =?utf-8?B?MGh6Y0ZPUE54OEFuNEp5OVM1aWg4QUxWTmlUQVpSZTJPbWppVGs5OHo1S3Bj?=
 =?utf-8?B?UmIxRUNKTnk3RGp2M0pYLzMyRUs1VHB2aFhxVXVLcFhsb25yUHN4N2NMOFQv?=
 =?utf-8?B?R214dzc4WkdPdUN2QmRnMlBDcW4rdlZNVzliVHJoVVlXOFFqSGRIdkluYTlN?=
 =?utf-8?B?eXY5eXZYRkpOanZpZDd6dXVaZUVSN0hkQ3pOdGczTEZEa1ZQdWtoLytJRjZD?=
 =?utf-8?B?TDRncGplUFpJM0dUL1B1a3djYmlIMUFOMUxobmdBN2owUlRsVitOUk1CajBW?=
 =?utf-8?B?dVFDYnNQcC9lTSs3bTgxY09YVFFKRUVzVk05bm9OVlZIRkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzhTRERNR0ZFSlJqUllXN0RDekhFYityZDE2WU90Tm9pek50K3hVQ2hNSGhx?=
 =?utf-8?B?V25xMGRjbXd0cEw1SGNoVEVhc1AxejBkaGFCYWVVYm5mMG1vbzYzSTdMbHdz?=
 =?utf-8?B?QzBNZWxsNk5DaGlrZ2MvSG5KSnJlUWdCT3dBNGpsdXBCa0hSK2dHS0tQSXpm?=
 =?utf-8?B?aHR3RWgwaFgwWVgzWDFCd1l4clRYRmZjdHBoZmQ1T21UaCthRnV5ck91NkJo?=
 =?utf-8?B?OFFGS1crdENtSXh5NFFLcjVWMUYwOHBua3Z1aUQ1RXdkcmw1M1B5V3pGVm41?=
 =?utf-8?B?aldsYmM3L2tEaHZocUdLYWt3Skt0cXZGbmVEOFNUekNtR0NyK091Q1NkQ3ZF?=
 =?utf-8?B?Z2dlcDQ0YWxheFR5RDNyRlNiUXJzVUl3aEtyUVE2c010WUp6Y25CT09xcnl2?=
 =?utf-8?B?QS85SlJZTU92TlRBc2dqcU1CSEVNZVJZOEFhclEzWGdrbHphcXdTeklCZFlV?=
 =?utf-8?B?eU9DcDZ3eUtxdG1IVWhNWGRaWFpvZEtxbEZqdEJTb0ZxaHRJVmJwVEl2ekNl?=
 =?utf-8?B?VVgxWWJFcjVYZjdJYU11MVZ2YlVzQ1Q5bUJ6Slpub28wOFV6WThUNmZudndF?=
 =?utf-8?B?eGI1LzZJTy9FMTQ0bmhHQW1aSE5jQzVPSW9jRGJlKys3dEpxUSt6bFlmbTVv?=
 =?utf-8?B?QjBRNVBKbnkrZ2tHcWdRYnY1eFQrTCt6U2VGVXFGcVpRcTJTcnRQdVMzM2o1?=
 =?utf-8?B?ZHg1UHQyZ3hybGV4alNoWUlEZ1J3b0Z3TXpOSitwVk1Jc0JtSXR2RkhNT216?=
 =?utf-8?B?RnFPR3IyMms5T1FGbkJzMGlvRlNuNU9NWVg0UmhHeFQzQzl6MURpMGQrVDdX?=
 =?utf-8?B?SFFzUWVYOHNsR0Q4OGJVcVlubmM2MUtqUHowNHVtcGZvZkdJS3lTeXVBNEpT?=
 =?utf-8?B?bUh2amZjejNYc3FiMDluVEdBY0hlNzF1QnFwdmpSemZTckgzNGM3Y3ZiNkdq?=
 =?utf-8?B?aE8xR3dGQ0J2d2VxNnJzT2x2TVFNVVNFQ2FEdnpkUkNsUkMwaVdLaGM3Vkp4?=
 =?utf-8?B?VzBHSFZ4M0JOcjZyMDVHNXNnMTRhQXNLVkZwRWJMeEJnN3U4NFRqQkQ4TWhL?=
 =?utf-8?B?b0k4ZVlGZmZ5aTBBbHhIYnk5Y2R1ZWE3MDd2WTRTRkVyY2JTaWxzR3B3eC9N?=
 =?utf-8?B?WUpoUlpEM2xUQ1BnYmNmRVZ5NEkvNjdNMERoMklISzN4NUtSMmsvZnJpaVMx?=
 =?utf-8?B?WlB3bjcreC8vdmdLaXRNZjhVR1NhMndCTE1JbHRJdFpFVWdkK2RUQ3poTHJU?=
 =?utf-8?B?R05zWGQyMGNBcU54eDFnb1VmV1V3MisvbWZ2ZlZ5YTRmSWhHN0R5cGJJaHZP?=
 =?utf-8?B?cVZoRWdlWWZxcm05MmNVUXNuSGhsbEU1WDRvMncvN24vNzRCSmIwZWwrTzhj?=
 =?utf-8?B?K0JZNllQQkdZR2JhZE5aNzZVTDl1bTBiY2Riak9ORDRJS282eDhGVnRTclov?=
 =?utf-8?B?V29pTDFJbTZzNWJ1cE1UblVYMjdNS0F3KzJKVHMwTVV6Mkh1bmNFUy9lNjBi?=
 =?utf-8?B?QWo3Ym1tbU5CTU5uSkNpdHp6bUgrdmZHQWJRTVRBQ2dvZ3dNTmJLM045YlBk?=
 =?utf-8?B?VFkvU1BscUkwTlpvbld3NktjMVg2cERyQ05MRXo5QVowSEJQQmYwejdWdW5U?=
 =?utf-8?B?Y0pOQjdpL1pVRVY4b3Bya0VCaTJRVktjZW11ZjZMODJvQWlPZjJML0tGV3Zr?=
 =?utf-8?B?ZDFidWhKayt6N04xNXBBamc1aW9ScSs5ZFAvYkVtbWpvd25ndDRubnhuM0Iv?=
 =?utf-8?B?NDdHVTFxbE5UblVIT0hib0ZjWllUSkVvR2J4N2RvRHlLQlRJZnkrWXNVWlJF?=
 =?utf-8?B?NTB4VlhsR3ZEb3g3UllvZUNQc1hJN25GK1h5azE3RkhsRVQzUkhsSk1sOE9x?=
 =?utf-8?B?Yll1SWdTNzFsK0xRN3dOcStUdnR6RDFNZ0xxeWdST0Y0YW9laWpXRHlXRVV1?=
 =?utf-8?B?NUlpaHJOVGhxaFZyY0ZURkZXRFZveHhEdEh5aUxhUlptWVVEK3V4U0FTUlNv?=
 =?utf-8?B?cndXL21JYW5rR2lTMzhJN0M0T2VkUjQzWld0L3Bwb3h6cm1TVE5jTXdkbkxv?=
 =?utf-8?B?eEFwVnYwckFucHRMeGNkWUFrMGJzb2VpV0Q3eUd6bUpHNWU2WiszTnBScVNG?=
 =?utf-8?Q?zwzC/HzGddwf+mBWlyBvfHx01?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989951db-ddbc-46c4-032e-08dd19a98df2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 06:03:38.1208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQViCEZxsLQKK9EK9rLkXMKeafEAhh48mOAi6bFTDoTEX6BqKL+Ayh/hiQI2tIX4RcOaanwIrF9ceCbsDR7KXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10163
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

On 12/10/2024, Dmitry Baryshkov wrote:
> As drm_bridge_connector now provides atomic_check() implementation which
> calls drm_atomic_helper_connector_hdmi_check(), drop the duplicating
> callback from the bridge driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 10 ----------
>  1 file changed, 10 deletions(-)
Reviewed-by: Liu Ying <victor.liu@nxp.com>
