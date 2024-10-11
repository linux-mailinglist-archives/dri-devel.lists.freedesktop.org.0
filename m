Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707DF999D00
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCC210EA44;
	Fri, 11 Oct 2024 06:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DrXKUJPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC9210EA46
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:49:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i02dfbRdPaVpUNBKJQfyoPyRySi7Z7kg1thcA/qt8NoEzRQvATTpsJlL7MUM+O7vmZnQfFFgBPMf1m+6/JEQZZdxU0NTaaYUrKDxeT/5yN4Unh4RDxCYUdzwQLSfimeUzdmXDr9jXG6s8Ut0eQ6Jvx8yasBUp8yic4HodMJcYj2W97LBMQjik8WiQOFetbh6+fd6L6SCDFMiRgbWsKG3OJfCf5iKlO2wDyaQKPq+zzHdsgJfp/WizQUvmpe0AdavZpBij/ry2vlcEubkUgegB2w1bWnC5+xuPwgvlpbmgA9sd5xMSb0ofbOlRtMyNIsZEqd7oouXmB4eXLXPFyf3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMjuKxzcefwZX9PpsDyx2VbRVQ5aVUwc+VtnVMli3/Q=;
 b=SIyXkDytix8jV51IqsoNXjaDZEDBgxJRU280EbMAXovGBg+zGBNaZBp1Q/vHN7p2bViqZMqmsyJDbkiPM0IS22gCTPzEZIwNJOgb8orCtkIplFA27cSuqT+3QkhaOAApeKLHHe7E8/Iz4MJY7qGvjVjetvAwly78p079rAVf2RzhNjWklv0d7OdG3kmlF8VA7LyH5kEVO2dSB9SewCCCCrgL/+4xAusjzwqHrFHob9Kstus6tTilfjTfue3htaV/ZqU4e5RmO+9E3rf1Yu6DIzN/j5RvOnyiDzImQB6o4GsgdvRt0VM1u1udIdicTkj20I/FEXkUouAS6+OVMzhQWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMjuKxzcefwZX9PpsDyx2VbRVQ5aVUwc+VtnVMli3/Q=;
 b=DrXKUJPKvuLwIFnULlEAJBcYKWjQAkX+xry7kgTAYv2FzJpvjg5BaKpdQzA0FQeEZzeZYOqbKDiMmreu++wmHLOcvUwI0tmTtnOpupzpOr7AMqgO92gB2lJdBZnum0ROrXA3LRuEKYlGhM9N6+vjYAZsUFcH0ykkIpA5X48PgPSotCllm+jbJRpbEvLoR90ChDIISRMHSmWVamB/xR19tiFRGUewDWBtjkCeOdTSHrQ37HvXZghgH+l9q8sfw3titEmIzTYepZ6nFUhDiJl39Zj/3rpplH2LwS7EElOqRPUt3eozBAlNKv+fam8BuUCzdce0IzkoZQSh+1qxPfdG5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9870.eurprd04.prod.outlook.com (2603:10a6:10:4d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 06:49:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 06:49:09 +0000
Message-ID: <3341a6a7-ac0e-4594-a670-b3a6d583b344@nxp.com>
Date: Fri, 11 Oct 2024 14:49:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <20241008223846.337162-2-marex@denx.de>
 <d6a34efa-47ad-439b-8b0c-a427cf087cb3@nxp.com>
 <0e47b529-59f2-4d25-8c5d-30ca1dc4e964@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <0e47b529-59f2-4d25-8c5d-30ca1dc4e964@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9870:EE_
X-MS-Office365-Filtering-Correlation-Id: d9eb50e2-772a-4233-7599-08dce9c0cece
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkhkcCs5NW1kbGViTDV2b09VRVN5ZkJoQXVqYi9KdEUwOWJmZG0xdkZRbU8z?=
 =?utf-8?B?SFRXQjQ5T1IxbTJwRXgwUU94ampWWWJwRkl0dllxa05BVEpGakE2cWRRZ0Ux?=
 =?utf-8?B?RmF6YnNkT25XRmVobzNzOGxjWDlTTXM0K3Zzd1NDTXpPYlViWnloQ0Fhdnox?=
 =?utf-8?B?RG1oVDlUTkNMb25peGdMWDlTMHNtRlhKRVpKRTJrcjlndmxMZTMyNVVRTGk1?=
 =?utf-8?B?SGhvM0VreDJEV1hqcFoxQ2pmOVpBRnkva0puRWRwdnRhRnVabTNDT2Q5ZVFw?=
 =?utf-8?B?dGJDekpGN3VqU0p2VEkvUHdiSzFXWHhOelNkRzZ3ZEZiRFNmbHNKZmN1WmtT?=
 =?utf-8?B?U0dsQ0pEMkZVb1B2YlZ5eTNqZG9aNTlIVk0vNUNwNHpDQmtrblBhQ0t4MmFO?=
 =?utf-8?B?WSt3UDZIQW9DV3hzY1N5QXdzY2lVcmNTUHdhaFU2Um9Uc1drRTRRdDFGalhY?=
 =?utf-8?B?c3NFbmhVUUNxa3JNZ05UaVVORU5sSEtaMFBqaStCUkV3N1NTL3dVMUxqS2l5?=
 =?utf-8?B?YkEzK1JMTEVobHZYZU1RbWZpbkVOWFNBdDNwVk5DVGFJdzUxUHpnMmpQcnVk?=
 =?utf-8?B?c1diTW1CVkdsbzJRaEtjUFkzejZVNGlKZGpoU1drTXluaHhJbGFhZnNabVMz?=
 =?utf-8?B?blJwa01nMWxvTDUyVnlOOGxERzR2TU5CYnJoZWE5b0x2OFBkTmYvOFBRYWh4?=
 =?utf-8?B?dUdFdTB1MU1LdWh6ek02NGZpMktzVnFKeUorN1hya1llajNGYVd1amJGZHRT?=
 =?utf-8?B?elZmb3RGdmUrYnN5TnVmY0RYTExKN1YwSys2aUNubGVrc1Y1RW1lcnpnTDls?=
 =?utf-8?B?N0NxQ09qMTNYazNqUi9hNWRMMTUzYU9WbjA3QkJaTWxUV3BzSHlBeWhzcWF3?=
 =?utf-8?B?SXQ1SFhKMmJ5RHM5eVlWR0JqNURsSGF3UWViSlo3anIxL1ViQWVUaU5XZFN4?=
 =?utf-8?B?dU9aWUk0QmVVOURpd0hqVjJ3dk9WU0x2MVNZRlF1UzBzYUxFZlN6dU1TQmNM?=
 =?utf-8?B?K2tBSm1hdW1FaS9JMkZUblpIM2FSMWI4K1RSVk82aDZmNWFXWXZvMnIrL0FI?=
 =?utf-8?B?MUtkWUcvT01lZFZGdGdpaXJjaVNQaXZZbGRkUlJzajZpcUVLR3piUmdUeUNF?=
 =?utf-8?B?OWtnRG5BaVdwenhKUUcwR1ZDUzQxZGhCWkhpZTUwWHZLdXR6MlhIS2xJTnhE?=
 =?utf-8?B?MUQxekhUZWxEY1NWaE1Oa0JmL2dNZVgrV2lxY1R1RDMvNG1pSDJBMUFYNjIz?=
 =?utf-8?B?eit0dXRKMG8wZk9PRno3YncrOW5qWTlOc1l4ekc1YitGUDJjaW5lRzBxQUt5?=
 =?utf-8?B?Y1ZtWmo3NU8wTU5kM0FzUUYzWkJYNnBLNDdDRjJ2UENTbmFiVHNZMnI1dWZx?=
 =?utf-8?B?YndzOU1pRjdiOEEvOTVrT2RDNExBNXBWeHl6dVdnL2pHUHhoVHRVWDlOdU1l?=
 =?utf-8?B?RVJnTUxnUWpGQStQR1NxZmNwb0FMZ0FreVhqcDVYcS82Uk1iMFoyUm9yM2Uy?=
 =?utf-8?B?Qmg2cFA3MXJ3cnBqelVuL1FFS21ZdVpOUzI5ZzFseUtoNWR5MXdrWW5GcWE4?=
 =?utf-8?B?eWdVdGZVLzFra3NuWmVPdkNtU1BlU3V2aFlCeXpnL2FXbU16VXdCalhjQkpI?=
 =?utf-8?B?Um1hU1YrYUpFeXJsWVh3Vllqb0cyamVFdXFpL2lJRUZPRnJ1V0tEZ0VWOTRq?=
 =?utf-8?B?V1ZDTUJOVEVPNW1EcW5XbUZDOXFGbVJUWkhjS2x6Nko5VWZYWWFySzl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SytUTVIwZjZNMmVWeHkzZnNna09xbUxRUXRKRzY3TFJURWRCN015K0tQMkNF?=
 =?utf-8?B?WW5WS2U2dnNRMjgvNTR1UjhXTERxZ21NY0VlZVFUQXhwc3NwMFZTdldpZGpL?=
 =?utf-8?B?eDdEelZhTkdsd1pNTE1zV2RMM1ZTZ2dwamp0cHNPWTVxQjhjOFBESDE5NlNT?=
 =?utf-8?B?T3RlL2VQODZSY1gxVVNxZ3VnaDdSd3R3cFZBdU5LN2JMc0dsSFUrbkJDZmE1?=
 =?utf-8?B?UElydjhqMUNmWklQRHNkSXp1cGUzTVhwOGsxNk4rcWpoZkR4dXhOZzZJY0s3?=
 =?utf-8?B?WVJTWDZ1ZlZSR2YyTW9ybWdNdWZLSUVWMDhpS1VKampKaGRlb0hPa0xTSFdJ?=
 =?utf-8?B?a1BMekFJYjdlVjBpSzZkL0g0WkFTTmY5MVFhbUNmUUZia1JQOG1Id3RGK3dl?=
 =?utf-8?B?OEdIb1d0QlJINGRVQU00ZE9JRGxXY2tyNUFmcDRLaEF3ODlmRGdQQkJwY1lu?=
 =?utf-8?B?S1lEbk1NdDVPM2VrN2t3Q0tUeXFTLzJQNEY0VUJ3bTFPMWVyNHlVd0MvNndR?=
 =?utf-8?B?ek10bk84cml5YXpYVlNrMFh1aDZjY3RhazJBZU4rby80Y2FXOTR1KytCZm1O?=
 =?utf-8?B?Mm9VTUZ1K3N5N0pvQ3ZzUGxIZ2pUTXZyclBGZXd4OVh2UXYyMldaMkNTWEtE?=
 =?utf-8?B?UWJLelhVcEpBVHFjZ2NvZDY5ZkY3YjFoeUtoamRjQ0Fwam10OWpFUW1VWU1B?=
 =?utf-8?B?OWdrTUlZSmlRaUlWN0RGbkJHbERLLzJDbE1aYTArN1N6dFFrTk5tZEt2Rnlv?=
 =?utf-8?B?WCtidVdYdUY4cWRrbjd4eGh4c2I4TVVKbk5aMUVOalR0dy9mNTdURldUN05j?=
 =?utf-8?B?eUsrV0p6bUpDbUFzUkFMYUJobytGTjd5aXhmMEFnTzNSTFFxT09TdjBFODcw?=
 =?utf-8?B?UHp5ajlndXNNN0E2YUplTnRaS0l2b3JXT09hZFNNdDdTbmlPZVNwMm0zcG1M?=
 =?utf-8?B?MkU2cGZtSFJ0dVNUc3Z0VUJyNzJ1L3JBU1oyRVM2WjluVTdHeGpQaStxeVFj?=
 =?utf-8?B?ejd2RGZFU3RsSWZmR1RDZG1DYzRqRnhTL1lmZXFvS1JGaEltU0RDVldmMnE1?=
 =?utf-8?B?WmZWMXpERDJhSllZeHZvb1V1N2RtcGdYdTZleG9CdlVTMTk0dlNULzRPK3Ni?=
 =?utf-8?B?ZVNhSDZ4S2RSN3BwUlM4SklNQmt0VEFsUmY1eXRyaXZVZHRUZDlPcDFxUng5?=
 =?utf-8?B?a2hPVlQ1cnJEdGNJVS9HOEFxRzlkdWxYNm5sNnhoMjkzekNYSlBvNmxPYkoz?=
 =?utf-8?B?WXFGZTNYVnl0U3RsRGpjekNiYVBsamJwMDBncERhTVV6cjBTbytEamhvUnhT?=
 =?utf-8?B?d0pZU2QxYTVYdWduVjZibTFpZnJEdWpUWnNGYzVIQzg3Rmxsa0dVVVFJK2FI?=
 =?utf-8?B?Q0pRY3lScUFXTVRIR2RBeDdSSzFMc0FHWjdHaCt4UXdFNGxqNVVBazB1cUhn?=
 =?utf-8?B?NklsbGRrMXRsbUNZTUNWZjJQQVd1S0NmS2tMNGVDSDFLV05UZ05mVDdVRGg5?=
 =?utf-8?B?K1VSZE10ZExFUVU5SWdFQ3MyRTBOV1NLVm1xeFphNkFiQmNiUHRYclFsVmFy?=
 =?utf-8?B?YnZ5dEdnOStIMm9QbVlZTHRneVdHUDNwa3NHb0ZVOU1GRlF2SEZYVnFOZU1q?=
 =?utf-8?B?NkFhb1BEK3ZrS05GeUxheTY2T0IrR2RhY1EzQlpBOGNNVlQ5TC9Xb1Y4V0hD?=
 =?utf-8?B?NXZ5ZVdBVGR3eEliWllsdUJjd0xDTWhjWk5vWGRTazlvODVJY0JqL2VzT3la?=
 =?utf-8?B?RmtlRTVGdFBBZnNjU1JIb085R285eWRMZWtCeGhyZkRMNkVQVEcra21QdnhK?=
 =?utf-8?B?YVVWN09QNElESFFvdXcrZk44MXg3V1Vnc2N6WDdrcW8rbXAzZXMyYXptRkc4?=
 =?utf-8?B?YkpTZi8xei9OYmM0b1ozdXF3WmlVWlUveERLdG9FZ09BclhIWTE2b3EwbTNE?=
 =?utf-8?B?K2hLMVJZT3QycVVHRTMwWE8wUmowRjFQa0xIa25HaTh2WVFqUXlBZ1MzNVVE?=
 =?utf-8?B?SGtmWjRXR1R2N2FWUHVmRnV3MUlKMnM2SEt0UlprYjgycjRDUlYwaE9zRytK?=
 =?utf-8?B?Zk9Sajd6Q0tGSC9CWWdnUHpEbFhiNVdDYVVzQUh4NUlXeDJMTzc3cUJ2N2dm?=
 =?utf-8?Q?GKHE/AycBBfBJtnP7APSGZIdr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eb50e2-772a-4233-7599-08dce9c0cece
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 06:49:09.3309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: me8gZlgWzYGTliwJklR7T5kzDkOe+06NCUg8h9xZySWRhR1txlsh0oKZwCtohpx40aUE32Q8BRmp+JzyTbAm6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9870
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

On 10/11/2024, Marek Vasut wrote:
> On 10/10/24 9:15 AM, Liu Ying wrote:
>> On 10/09/2024, Marek Vasut wrote:
>>> The LDB serializer clock operate at either x7 or x14 rate of the input
>>
>> Isn't it either x7 or 3.5x?
> 
> Is it 3.5 for the dual-link LVDS ?

Yes.

static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)  
{                                                                                
        if (fsl_ldb_is_dual(fsl_ldb))                                            
                return clock * 3500;                                             
        else                                                                     
                return clock * 7000;                                             
}    

> I don't have such a panel right now to test.

You can add a panel DT node for test to see the relationship
between the clocks, without a real dual-link LVDS panel.

> 
> [...]
> 
>>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>>> index 0e4bac7dd04ff..a3a31467fcc85 100644
>>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>> @@ -278,6 +278,16 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>>>       return MODE_OK;
>>>   }
>>>   +static void fsl_ldb_mode_set(struct drm_bridge *bridge,
>>> +                   const struct drm_display_mode *mode,
>>> +                   const struct drm_display_mode *adj)
>>> +{
>>> +    struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>>> +    unsigned long requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
>>> +
>>> +    clk_set_rate(fsl_ldb->clk, requested_link_freq);
>>
>> The mode_set callback won't be called when only crtc_state->active
>> is changed from false to true in an atomic commit, e.g., blanking
>> the emulated fbdev first and then unblanking it.  So, in this case,
>> the clk_set_rate() in fsl_ldb_atomic_enable() is still called after
>> those from mxsfb_kms or lcdif_kms.
>>
>> Also, it doesn't look neat to call clk_set_rate() from both mode_set
>> callback and atomic_enable callback.
> 
> I agree the mode_set callback is not the best place for this.
> Do you know of a better callback where to do this ? I couldn't find one.

A wild idea is to change the order between the CRTC atomic_enable
callback and the bridge one by implementing your own
atomic_commit_tail...  I don't think there is any place to do this
other than atomic_enable callback.

Anyway, I don't think it is necessary to manage the clk_set_rate()
function calls between this driver and mxsfb_kms or lcdif_kms
because "video_pll1" clock rate is supposed to be assigned in DT...

> 
>> The idea is to assign a reasonable PLL clock rate in DT to make
>> display drivers' life easier, especially for i.MX8MP where LDB,
>> Samsung MIPI DSI may use a single PLL at the same time.
> I would really like to avoid setting arbitrary clock in DT, esp. if it can be avoided. And it surely can be avoided for this simple use case.

... just like I said in patch 1/2, "video_pll1" clock rate needs
to be x2 "media_ldb" clock rate for dual LVDS link mode. Without
an assigned "video_pll1" clock rate in DT, this driver cannot
achieve that.  And, the i.MX8MP LDB + Samsung MIPI DSI case is
not simple considering using one single PLL and display modes
read from EDID.  

-- 
Regards,
Liu Ying

