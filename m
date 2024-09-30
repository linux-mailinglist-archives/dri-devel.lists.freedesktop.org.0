Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ACD989BFB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A7410E039;
	Mon, 30 Sep 2024 07:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DJ1ZUl5w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061.outbound.protection.outlook.com [40.107.249.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842B610E039
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpeP996ZS6B0bCeL0+xO66DBcmmHKEKrHLxlZLZ6uoJq0UrmjBz8jDIVH7tHqoH7gOTW5PvbA6BLGzlNK9Lf104QK1meZ6FmLIW2EvkTT4DyGtJeT+Kma5P8J/eyaVCgZz1iFsAi2o0dMdID6pR0rUWce9N16Qzp7D6BbQEfGKny3a51VEtFSY4psC1ocb6a2mOq+zMO+IcxoPncZxEVdqzUhuovmioaF+wMLoDFTbd2+P0Sox8SaUWXcuVihQi6qgH4HDKEIzua3BDjZ9XvHin2Eq9nZbEFade/PMEstxZIOa3VNjiveIUaElaD+DwdHu/Nulsq9yzjivBxPKg75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBCBtDz3bQ6NmCj/DDHerEX4FMZp4V9Ec0vXmzkzEB0=;
 b=rAsAvMeXJIZ/82LvZHtaaNP9hfdODcPnNxzsgVO0vl/imu/b/s3JSgIOeqkhvdNo3oTDQXS1lMXczbQkPQz+H7p47AVASVCz9caECJQyyEom1OuVChBfQKoKQiJtW1z4bxuOQRLVkSQlnma71SwnYX1wVIEaNEcKkmk/CqWRa+s4Fbx6YO05cFK5/ERjTFAhhHlcHxZGLnK8GF0e2W3oaHBMW6T7k0Srt/1CUZH7+nuj7g72daL1VaxQrWkbjpXQ7o9+K9yCSsf0OklgGQ49/2GUjgT7mbJMHjMRxhCWbrcIwUDpr+f77jX12aguhQhyhhBagKb8Cy8e6xmtpUpFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBCBtDz3bQ6NmCj/DDHerEX4FMZp4V9Ec0vXmzkzEB0=;
 b=DJ1ZUl5w1ggVMPwdAAjfBO8YkPViEClfsh64GC+dGZjqJXTdSA56OL1pBWk/RlQsMREU3L+ytmUXD1LbA2grn90STgfHflUlwJZ6gZZA2Gup7Sfou2A4d3zyOm57wVkoSFD99vaN4Z8IqRigfT++d5cscoeRsqeFIifDJZuh32VrcTc530Z38NC7JRsZhJ8AiF3jHOhSVuQYIYxFx0nh+c/gXJZlAO7LPgIO1Ge+9bNO/UJ7UuUbz3zDPNWBUIBGH7Igm3C2vhsC/LTuHVkL8dDK49zDbSYk23rysa6vZbsxhWSAjzZ0m7NauRFKqJlG6ffh45JNkEzQ1JfqZwN55Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10389.eurprd04.prod.outlook.com (2603:10a6:800:217::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 07:55:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 07:55:09 +0000
Message-ID: <5fb80bf6-96be-4654-bd54-dc4f1d5136ae@nxp.com>
Date: Mon, 30 Sep 2024 15:55:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/bridge: fsl-ldb: Use clk_round_rate() to validate
 "ldb" clock rate
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-5-victor.liu@nxp.com>
 <2on4bu5jsxvaxckqz3wouwrf2z6nwbtv34ek4xda2dvobqhbsf@g7z7kxq5xrxi>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <2on4bu5jsxvaxckqz3wouwrf2z6nwbtv34ek4xda2dvobqhbsf@g7z7kxq5xrxi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10389:EE_
X-MS-Office365-Filtering-Correlation-Id: bb16d433-520c-4167-77e0-08dce12534c1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aktPNVZBcVBLa0hOWXpaT1N4dGFqd1BaMU1ENndSQzFhYWQ1U0VKN3RRYUNS?=
 =?utf-8?B?TWR6Q243VFVUc1k5Q2JQSUJLVXdJeTkzN1Z5WlJ2THJwcXc5SEtNL0Zjb1Fq?=
 =?utf-8?B?ZFAvdXBjUUZnLy9BYm05WTA2UytReFJCajluaEg2SFhZR1Rna1NCdmoxeXRJ?=
 =?utf-8?B?b2ZUblBzNnNHdE5tRWFwMDdHaXRlSHUwTTFvQUN3cnRFeFVMN2MwY2xtWUdr?=
 =?utf-8?B?WnVNNFdPNlc4MDc3b1RkQXFpWUJtaWNCcWZWaEdQc245elQwdjl5aXFDMWZG?=
 =?utf-8?B?ZmxHU01TZ1ppcW9FTFFvVDBtU0FaQXBIRUdSWnhBQjlsQkQwTXdad2d2S1dG?=
 =?utf-8?B?Uy9heHJRUFFUT0F0WWJSaGt3ZG5JMFRWdFBBajEwVkZDOGhhR2tNN1RjVXcy?=
 =?utf-8?B?WGZVb2FXdGJxNHd6ZTlTZTZyc01Oa3NQQjV3RExxUFlCSENBbmI1VjlnNmxv?=
 =?utf-8?B?SHhsRXJPa0Q0OU1FZlJua0FtdWhuR3E5dk8rR2MxajNiRmZ4aDdML0EyMDZF?=
 =?utf-8?B?elZOWDQ1SUwrWnZsZ0luVFZ5MEFhMm5VRXVEMGpkZTFwSDBqU0dCeHhZdThY?=
 =?utf-8?B?SVlZcmlDRVh4Y290TWVGVGZLSzVNblhUeHpSajMzd2VSWjBWcW5BNnJNTmZn?=
 =?utf-8?B?U29nMkx2VEx0eG5PV0Rja2NSaDZ4RnhrRklyRTdqbkJ3SmpLbGVyQUpHZE4z?=
 =?utf-8?B?cnhkQzRyOERrN2ZNWTFxZ1FEU0hjeDNnRnF2bytPVGp0anZRUVVKb2VJYitr?=
 =?utf-8?B?VzJJMGlCN3FFV2t6TmhSUmhYTW5PelBGQnVleno3d1FwUzlGdVdnczdHOGE5?=
 =?utf-8?B?VWdIeWRhbkd1SUg5d0Q3aldZdzJoVUtJK2lmeEsyd3dWT056cHVndk9EYVN1?=
 =?utf-8?B?MTRpWko2djhRdkpLMlRmWmJUZ1BVT0wrbUFvTDVqczdZNDJVaWRnZmJ5YmNG?=
 =?utf-8?B?bkdsV0g2NCtyM0pjQ216YkVRckcxdFBGMWM2VnVNVk1DL1J0WU9aR2UxeUVV?=
 =?utf-8?B?eXZmcFVJbXNXbXRIcmZESEw5Yk1lSDRVbWlzOUZSRC8xaTJ5VmJweFErL3BD?=
 =?utf-8?B?NmhLRXIvY2NreFNySDFObTV0WVdmZmdBNWJnLzVscjVZWXNXUXJjY2taYXNs?=
 =?utf-8?B?TUlCdENzdTV1YlRpRjZrbnQrNmpDZm9xd3RDWW1uV0hCZ0FnY1Uxc045NjJC?=
 =?utf-8?B?UUhmSUtCdTlQS2ViRDhuaWt6VGFVcXB4ZzhqTWFyRy9LeitDZzFmbEFHOTJ3?=
 =?utf-8?B?SGptWklzYnNjUXE3ZTc4bEU0T3BjUnJMZlpqN1NieHdiekc3WGppQTNpWjJL?=
 =?utf-8?B?alpIdTJBbWRVYWk2dDZzR1NkcEU5NnhyRXRNNmUwdWxOa0l0MFRSTDNkUUxZ?=
 =?utf-8?B?QVBaRXJocWZjS1d1ZHZCc0pRalJJMlZDZXE1Vm1GS0doT2wrV3VIN09Ja1Yz?=
 =?utf-8?B?TjJVR0QyQkRaczRZR0VnSndCd1ZRUlRRK1NZVU5kWjJXRWdtVUpBcHlWejNx?=
 =?utf-8?B?TjVpYmZOOEo3Vm5nN3MrWlg4cWhnYzF3RGhVbk94VjhaTjRwa05IOTJlRXY0?=
 =?utf-8?B?c1dNUk05VERVeTV1bnYvcDYyQ2hESkxhMWowTlU2Z1FXRTdwUXMxTnBweUJr?=
 =?utf-8?B?ZlJNOU9nLzFoSVBUcWhKKzRNbk9kWmZKaFZLdzZKQ2lSOFZyamtsL0kzUDZ0?=
 =?utf-8?B?emdNdzRKWEoyWjNUb2lvRUZjUEdaSTE5M3dBMGdQMkxaektLRWNYYS82UUF4?=
 =?utf-8?B?bEFOSDY1dUdRZ1hVZnlPdzFHZWVIdUQrUUNyTVVCbkNqVUNkMmRaMHdrMzM2?=
 =?utf-8?B?MEFQcXJ3a1dzY2xIUzNGdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVFFbWZuT3FNUUVOUHRwRFZzR2NJa1JEbFdIcXpkZlZiRVRFR08vUGJjNHQx?=
 =?utf-8?B?R0tKSE0xSmpMTTE5cHpYVnRLempMbldVWVZIdk15SVFYMGpBTm5pc3JKbnFx?=
 =?utf-8?B?VTkwQm5OanU3aUlCbk5lNW45TFlNWkFYeHM2eW5HQTBaY3R2SFNkbHBEL3JV?=
 =?utf-8?B?MUJkZzJmTDNQZWRDV1BYN1IrUkg2RkZMQWt5bGpZbzJKYzNHM2VMR3VEenFi?=
 =?utf-8?B?UU1aODVKakFkb2l5SU1ndUtHNmN2UVZ1a1FESTVZRXc2YXdQVFB0cDE4UStW?=
 =?utf-8?B?bVpKaDRNNlZUY0lvSG9vTjlmWEFWbEhLcDFSS25uUXR6YjlGUGVHR1RieC8w?=
 =?utf-8?B?c3lOOHY0VjZ0VEJzYy9mWFVEbldnc045NmdPSFA5Y2FyeDBVK2hRR2s2V2gr?=
 =?utf-8?B?eldhVHpGSXF1RUJBYXVTZ3RvSWt4VnU5Z01PWWhtWUM2Ym8rRUo4NGJlalZ1?=
 =?utf-8?B?WGRlb2dncnVTb21aYUs4RFFKbTRvRXZRTUVOQXE4WlZ5S0JHVzRUelpmU0Z6?=
 =?utf-8?B?TXAva29NZnRNQlhyL1h1ZzVENzFWZGlhWWI2VUNmOEZyZUJzS1lQekhJeTY0?=
 =?utf-8?B?Tm9YYXBCbUw2dVVEWGJIWmIxUDBkSG8xM2VSK0xuNnN4R1NnRDFJTkJPVHEy?=
 =?utf-8?B?MTgwZVNqVXJFTFp1ZlJpU2pBTDJHd1NTaGpXM0JHVHNQZzNuQWFwUnNpQzlM?=
 =?utf-8?B?ZW8zWjVHZ0Z1YkkzNkpkOHU4cmsvWXdUOFJpbG9yekxGRlhKL2FScWlMTDda?=
 =?utf-8?B?NGhpRHNlRE5RK0psOFgvcmd5MmZ4M2lJejZVeFl3WFRaUWtzVHdkYUZRZklG?=
 =?utf-8?B?NUVyUGxCMmZxSjd4K092TTc5aDBQTjliZkRtZzFvNzBaV29DbFZOMnNJVlI5?=
 =?utf-8?B?bG9UZDd5aEt2VlhvenV1eUZPekU5Q09BUG5CUXN2blRGcmFJb0VVNGhRb0xW?=
 =?utf-8?B?L1htL2d2c1Zlanh4bWpFUFc0djZsOUd4M01qcnZjYkZaUWYxU0xhOVNEaHR2?=
 =?utf-8?B?bXlqeG02QlBHU3hDZXNoaWdFcDJwaXVtUGZOSkdyTzJlU0RIcFJWZzRHL1FT?=
 =?utf-8?B?TFNpZ3Zab0J2NExjWWRqb1dyTG95OHFZMDZiSmdBdVVpU3RON3Z5Z2VIMkdX?=
 =?utf-8?B?L05PTFpveWd0clVVRUZLSndaSElqMmJjRmRCQ0ZGY3llN0RJMWxnS2JFRW1N?=
 =?utf-8?B?eWNYQ2Q4clVXN3J6bzNXeHNveXNqejVVRWlFd3VTdVFDUDhvQkxuUmpoa3BH?=
 =?utf-8?B?TndNTE9uaUdpWlE5aGd4c0h2K01RbzRiSnFNUzRubWJ2UHdwWVowTDRkOGpN?=
 =?utf-8?B?THp5M0UvVUE1NFIzOC9RRDZjcksxb2VFdU5QWk1IQXExRFRMTXZGQzRUK0xC?=
 =?utf-8?B?eG9sVFZYVTNONFNsT05lc3k0Sys5U2JCTkFJYkNRRHNFazkyTWs3bmlRV1A4?=
 =?utf-8?B?UG1kdE5RYlZSWCtiYThyK3ZPOFNrVDhzT0JOTVNwVWord3lKWkNVdmZUaWpu?=
 =?utf-8?B?MkI0VjlsdmlaZE93SVBGODBqa0VNZk5KbDA2NHM1cE05aDVvZHRKcWIrd0xk?=
 =?utf-8?B?aU5uVDk2K0NkRnI2cUFZUm81TlFJVlhCVllzUk5DaCtjK21tWWR1Vk1GSU1N?=
 =?utf-8?B?Z3U2Tlh2SDV5MkU2N1pIUThYbEl3RkswN0ZNYUJkcFlhaVpZYVQwRWdoQjFo?=
 =?utf-8?B?M2VqSFBEdWFMTGtIMzJDZmdnS1JTbHRpZG9CQ3h2ZUxRRTFWQ1hHa3hIbVVo?=
 =?utf-8?B?bjhpZzg5QkRsckR5MUZOQUlUMnNKS3o2ZHpxaVZZL1Y1RHg0TlVvSzI2VVVi?=
 =?utf-8?B?R0oxS1NkMVVGYlh6VDJWaVFLWXZGSWFSRHBPdUpzaXQ1R2huR29tREhKWDE4?=
 =?utf-8?B?cWwvOHNJTG96R250dzJHbXlmR1M4c2tJVFM5UjJ3VGNIMG9WNlVRODNZYkhS?=
 =?utf-8?B?Q1VVc0xhM1FpUG1nVXI4UkpWRVdEd2srRk4vVEgyZCtjeHJkd1FPcjZvY21l?=
 =?utf-8?B?R3NvczJPMzRIOXYvYW83aENlNnJvMUx6ZU5zTGpzYXhmUnV4b0V0dE9UR2t1?=
 =?utf-8?B?aDk0a2h0bW1qYTRQMCtkQ3drQnpsZTNsZm1UMU1oOUZXNVFINnhSR2Z6ekdP?=
 =?utf-8?Q?OrNGbrGJbkfZw92i2XdUMplsS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb16d433-520c-4167-77e0-08dce12534c1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:55:09.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiW/yULJEvvT0h2n8cMvSzPiWzAW7eIA4ZCDFJBNn7TerLRUO3/SITWphY+37uWBCdabBzpJaMDqE6FVAQem4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10389
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

On 09/30/2024, Maxime Ripard wrote:
> On Mon, Sep 30, 2024 at 01:28:59PM GMT, Liu Ying wrote:
>> Multiple display modes could be read from a display device's EDID.
>> Use clk_round_rate() to validate the "ldb" clock rate for each mode
>> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
>>
>> Also, if the "ldb" clock and the pixel clock are sibling in clock
>> tree, use clk_round_rate() to validate the pixel clock rate against
>> the "ldb" clock.  This is not done in display controller driver
>> because drm_crtc_helper_funcs::mode_valid() may not decide to do
>> the validation or not if multiple encoders are connected to the CRTC,
>> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
>> parallel display output simultaneously.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/fsl-ldb.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>> index b559f3e0bef6..ee8471c86617 100644
>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/of_graph.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/regmap.h>
>> +#include <linux/units.h>
>>  
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_bridge.h>
>> @@ -64,6 +65,7 @@ struct fsl_ldb_devdata {
>>  	u32 lvds_ctrl;
>>  	bool lvds_en_bit;
>>  	bool single_ctrl_reg;
>> +	bool ldb_clk_pixel_clk_sibling;
>>  };
>>  
>>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>> @@ -74,11 +76,13 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>>  	[IMX8MP_LDB] = {
>>  		.ldb_ctrl = 0x5c,
>>  		.lvds_ctrl = 0x128,
>> +		.ldb_clk_pixel_clk_sibling = true,
>>  	},
>>  	[IMX93_LDB] = {
>>  		.ldb_ctrl = 0x20,
>>  		.lvds_ctrl = 0x24,
>>  		.lvds_en_bit = true,
>> +		.ldb_clk_pixel_clk_sibling = true,
>>  	},
>>  };
>>  
>> @@ -269,11 +273,29 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>>  		   const struct drm_display_info *info,
>>  		   const struct drm_display_mode *mode)
>>  {
>> +	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
>>  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>>  
>>  	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
>>  		return MODE_CLOCK_HIGH;
>>  
>> +	/* Validate "ldb" clock rate. */
>> +	link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
>> +	if (link_freq != clk_round_rate(fsl_ldb->clk, link_freq))
>> +		return MODE_NOCLOCK;
>> +
>> +	/*
>> +	 * Use "ldb" clock to validate pixel clock rate,
>> +	 * if the two clocks are sibling.
>> +	 */
>> +	if (fsl_ldb->devdata->ldb_clk_pixel_clk_sibling) {
>> +		pclk_rate = mode->clock * HZ_PER_KHZ;
>> +
>> +		rounded_pclk_rate = clk_round_rate(fsl_ldb->clk, pclk_rate);
>> +		if (rounded_pclk_rate != pclk_rate)
>> +			return MODE_NOCLOCK;
>> +	}
>> +
> 
> I guess this is to workaround the fact that the parent rate would be
> changed, and thus the sibling rate as well? This should be documented in
> a comment if so.

This is to workaround the fact that the display controller driver
(lcdif_kms.c) cannot do the mode validation against pixel clock, as
the commit message mentions.

The parent clock is IMX8MP_VIDEO_PLL1_OUT and it's clock rate is not
supposed to be changed any more once IMX8MP_VIDEO_PLL1 clock rate is
set by using DT assigned-clock-rates property.  For i.MX8MP EVK, the
clock rate is assigned to 1039500000Hz in imx8mp.dtsi in media_blk_ctrl
node.

> 
> Maxime

-- 
Regards,
Liu Ying
