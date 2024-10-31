Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD43A9B7291
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 03:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB3710E00F;
	Thu, 31 Oct 2024 02:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="klxOd0xt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D2910E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 02:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUpmfia7Hgs5hB09/GIVq/1aloUXGXOqgbXfJh/Lf9MVttogAWuI6lGhMW/3i9K6VoSojiqWnIzFJVXmTFQ7spzUDqOx7wdG1rueVPExyulSat4rB5gVNeCuWeajv802aQ2jwU1fb2LEb+98C5HArU0eVPUTryryzlv3YabBxWo5HMnH1nPKqNRNFcP4486cWfPF/Rt77REN50PIw8lce0WcmkByi1LX2oUL5vIPMk1VAk50UZI9FNUg14KGwH1sH/P+TAnrgs3kJhXcgKZ75ePskogQVErXCz42whQz0ALMN/1K6LXQ71nvINHP5T0jwq2iiGnWFyhO6z0FDWcUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZjtl/8s8GfeQGvuo/Pnjpdys6FfixXhPlE6XSuEKn8=;
 b=eYX32wxigGS0V3tKi3a0+K+IjdQI1kMqj9/+0EoPgAaMmfCUPz4xPB28ZqgkjgimisyO3Ga/eA0UTLV2y7aUDYCyRrhGidZiiWgrHz1yeXtZJwfrKoMjiyreeeWiCwQZKx9ZnpoSgF7Qz5M1if3O9XabaACA/WDZ1XkSggBdT5qyIgGibgEdcQi7Njb3TiZY+BsFw8Mgfhj6O8hjerzOd346zS10wvdExESpGq4EdopRUo+IooWSqliIOyNzfTq7Jc9IKAW38yoLX100to9CUvy9hlt2R6SrzJy1LJgZK4HHFKcLRwAONzFxvfmv4Yrrts8MpwGQNUvl2Jo+zN+47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZjtl/8s8GfeQGvuo/Pnjpdys6FfixXhPlE6XSuEKn8=;
 b=klxOd0xtOnXxMsXMPQGJbhxVcdj2eurF/bV2fhNpbHjInRw3eWvVAZpinG2qEtf+4zHQATvR4A9y1dcPoER+Z7XV7f+PKMJcj7ZHD8A0zrgMWpSRYVVMkwWOPApG4R458s8O8UYfOLFdg6zDde1rzROnJTfM07S15sjy9g83SQAtMj7oowYmXlo23oge+XQfMFA1zxkjVIuBCGhuQsGTVnpzEsXgCwAR5JTRKUaGCRB54Rc2vZ8ROSNvtreBBKb4slmCuAMEONRXJt5Mg82BA+DYpRUyE9pAJLi4zK8uvWnNzlVLL8Apvga8fF6Lg+Ca89CVtPwXP8LKSO8xfEEsVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10459.eurprd04.prod.outlook.com (2603:10a6:10:56b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 02:40:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.023; Thu, 31 Oct 2024
 02:40:37 +0000
Message-ID: <9a438c25-5d37-444b-b3aa-9a081eaf30df@nxp.com>
Date: Thu, 31 Oct 2024 10:40:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com,
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-4-victor.liu@nxp.com>
 <20241030-hypersonic-tremendous-tuatara-2bbeb0@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241030-hypersonic-tremendous-tuatara-2bbeb0@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::27)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10459:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9eb4bc-e245-4c17-ed05-08dcf95566e4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG9KYVRYK2lyb3VobXlpaU1BbGcwNVdyQWd2MnMyQnZwb2VvZUI1dFNCZ29D?=
 =?utf-8?B?RktZRndmaHRrZW1zWW9MYlhSelp0Ulk5Z3RFd0syWW9RYWl4bm1tMUdwY2wz?=
 =?utf-8?B?ZWZZcjNkVWlTcU9EZ2ZZcS8rampFQXRzUHc2ZGlKZDRLSFlHb2l6b1VHVGRT?=
 =?utf-8?B?QmdpbnJXd0dxZWlvajQ3MGl5TnhIQUtpTzMzdHJJTmFmU3ZCZHZ4cWVyZGVn?=
 =?utf-8?B?dFNaYlBKTXE1TVFFdW13S0FrT1JyQ3NHZVQ2aitEdE83TmsweVpCM1JVZzFo?=
 =?utf-8?B?aEdkeFhPQy9WT0o2ZHpGYW5KRUNDK0Q0MGppTkI5WnZDWXZ0NktXWHRWVVpI?=
 =?utf-8?B?dnRZRGhSRWJ0aC84OFJHTkdwVXBqWlNPYndES1BmUTdvRWxWb3RBTUo4TSsv?=
 =?utf-8?B?TEZCWklxem45RHNhMndYN2JyVUFSbkdoSWVadDJmMmFCR2tkMEJ2TmU5Rzdq?=
 =?utf-8?B?eEJBWmRjdGUwOWVyM0c1eG81Z3ZkbVc2QzQxaUVtdjRDWDhFdk11eW5HRU1u?=
 =?utf-8?B?U3RRdFVHT05mWjZ1OFVYV3RLZlFSYURNTkR5RHYvZkhsZVZYQ2NacnROTG1i?=
 =?utf-8?B?aWlublFEWTBEVXpwWXZzd0grcmtJV0svQUpwMXgvbWx3Q3FrQkJwRzc4aVFZ?=
 =?utf-8?B?TmR3UE1UcWYyRitFRFEraHpiVURtVzZVbExwYWxaRXZWckZwaDdWNlJleGh2?=
 =?utf-8?B?c1F6YXJYQmFZUVJRdTRkZWVwbzlaZkpSKzlURkdkcFhrT3hNcjV0UXFtQWVr?=
 =?utf-8?B?SHlNS3dsK21TZVVmUW5NdVRsZXByRUJkeEhuS0xSaWtWMjgyUXUzb1doL3hx?=
 =?utf-8?B?czUrM0ozMEIvNWFIcVNwNzFBY0ZwT3cyQ0FBNWxHM1dEbHpQMm1xWjFoWVdY?=
 =?utf-8?B?Z0JEVEUvRVpoWTFwcXM2RG1rYTZKU2VNS3VzZkt3QnZMY1VwMy85dXFUYkp0?=
 =?utf-8?B?Z0E3eWdTb1hNTE1CUExQd1ovRDcxODBWYzhwRXc2L25GVWcrTm9yK01qdUhz?=
 =?utf-8?B?TlY0T3dObk9icEdoVlF5WE82Y0p0Y1NydWdyT2wyaW82YlZFVHlkWWZwSWlI?=
 =?utf-8?B?QU54bjlWaFk4SFA3KzdFemJxM1UvVjgwQUV5dWtqZlh4NytmbisxZkk5YTBv?=
 =?utf-8?B?K0p4YklqZklRODBrZ2hvaW1mcG95L3lZQnV5b1RzVk5mMUVMUmlPY2hpcEpu?=
 =?utf-8?B?WHhobm0xWk95YlZpL2I3SXdBZ3RyZnUyTXYxbDBrM3JTYkFrdXBmd1BUSjRp?=
 =?utf-8?B?cXA4WThuMGFSOWExV2syWVRpWEJCQUlpbEdsWkJ0TFc2VzJDbjhlKysyZm80?=
 =?utf-8?B?bUlzdWdPNlpMYmx2N3h3bEZ6cm1MeWpydGFRd3IyakxwejJjc3JrbXkydlBi?=
 =?utf-8?B?L0FjQUJCNEJFRXFDVVdJSFBZeW1OOUpvS2xVK3h3M0RYZCtoV2J3eGhiSXd6?=
 =?utf-8?B?OWl4U2thYXBiRjBKejhKU0lPTlZiZVhxSXZid21URk9WRUhwRCtycUgwTTdn?=
 =?utf-8?B?QnJ5MjhVUkpRZW91YVZ5ZDdWSTEzM01pRWNPMHB6Mm9XMC9mQW1OZTNSRXF5?=
 =?utf-8?B?WklFV0xVbUQ5UVhJZndNSkJsbHFiUEh5cnkzZ2gwTEVqQnVTK2JZclV5dnhE?=
 =?utf-8?B?OXFZRFVYZ2JJcUh3OE4vZHArM09KOUF3WnVaUFNianNPSzkzNW1FSUtJNDlQ?=
 =?utf-8?B?WFdMZXQ3bXp1QlJWS3pzNHR1SFdhYVluZFNGSGFVdjV4cjlqSTlrTnkrUTRC?=
 =?utf-8?Q?qyZ6q68werXxEI81whmymhECESLOIv5NFEjs86K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjJpR2NDb054UlhwdWovblRyRVk1NzF3czRWeE5IeWY2cnpNOGJIRzY3UnNz?=
 =?utf-8?B?Yk1QcFZoUkU2QVR2WitxZ0oyNzUxZ2lwaWZxZ2JScDdrUndDVWcyQXVoYzUv?=
 =?utf-8?B?Vm04d3VmQlBEUE82TWpLYzV0UWhCTnJ1YWVpbGJNaEdTcmovM3dlMnR1U09u?=
 =?utf-8?B?bWlkVGtoN29MaFNEOEE1RldXeWVIYW96bVAvTXpCNTZHcklwZFZ2QXI1SE84?=
 =?utf-8?B?UVVINEs2ZmViM2k4dlFUVHQ4RHJrYS9nSXU2ZWRHaDBNUEloQ3ZDMThvRUZF?=
 =?utf-8?B?YXpRTEFvaXRXVW5rNFh4WDVhbkY1YjhJOW8rMWRrSUF3ejE1UFlGT0tSMGRy?=
 =?utf-8?B?aG5XZWpNU0diZFo0MDZ6Y1Z5S01kWEhwM1JWODQ3eXo2S1VmdXc5YVQ4Z2Jm?=
 =?utf-8?B?R0s4R2l3TGliTVZQZC9uRDNGOVhnbXVrZlZUTXh2bDl3U1JuZzFsWW1BakhX?=
 =?utf-8?B?WTRtd2ZxbGpoUGxPRk9reUJ2U3lQRnlmNE5hcUU2aEttbzluWWZ2MVdOME85?=
 =?utf-8?B?cFJsdi9VSFpIR1FsQUxIRnoydFA0SmhqZEZhZG9ra0ZnNzlUQ3ZnbndiNEI2?=
 =?utf-8?B?N0lqTHdtTTlyK2x4QWdoc0Nxb0ZuZHBnTHJ5RGlLamU0V3oyTmNUU0d1MXpZ?=
 =?utf-8?B?MERmMDBBRkdqTUtwdHc1cVNiVWpIRWtrWlR3U01jZ0g1K1dUdkFiaWRncit0?=
 =?utf-8?B?WU9zQWJmSUJSbURJWCsvZXRGTXN0a3pjemNTRVE2S0h1N2J1TnErMmVYdUY4?=
 =?utf-8?B?VFRXUDArU0JjQktRUzYvaDhSeXoxVFh3MEpUNzRSWkdrQXcrQlhJTUJORko3?=
 =?utf-8?B?d3ppWERpODVlN0R4bUJITEE0bVUvWHZCWkpRU3FYSkRTS1h2YzF2NEJBMHA2?=
 =?utf-8?B?NWZ0a0k3V0h4SWpZZDMvWDNkNkphazY5ZGpLSklUd0h1cEhHU3NtVjYrbmtk?=
 =?utf-8?B?NW42Y3lLSmlwUVNrWWE2cmJ2Q2g2MHp6VFhyMDZONFZ3UkhUUjZLYUtPMXpR?=
 =?utf-8?B?d2FESjRQLy85dlpwU3NVbWIvZEVuWDVwUkRJaTBZN2xzUUpKdlFHNU01ZFpk?=
 =?utf-8?B?WEgyVllpK05LcHZjblpVNWZkdkhKMlBjMEUvNmNwc201WGlVc2FEL0V2Tzky?=
 =?utf-8?B?NWNpa1E3Ykd3aGhUeDVwQkF0dUNnY05Ibi84bFB4Ymp0eHg1ZS9rd3ZwbjJh?=
 =?utf-8?B?dHlQVXA0U2dYRHc2bFBLN2tBa2pyaThMTGVkemFickJsTk9rd0ZHTUdWK0xR?=
 =?utf-8?B?UjBQSVJWNFYvajc4V3NLMldSTVdWSlZMN09PUi9Hb1F5aitXWEpUajA5Y29P?=
 =?utf-8?B?MlBwWDFIbGJ5L1pUUzl6Uzd2dzNUcll0MzVBcVdVR3BKQXF5WUxJYVpBSUFz?=
 =?utf-8?B?RnJoWGxVaDRBcVNzNnIzVGUvUGEwa1lqSU1naTRNN3F3Ymk1ZTBSVU15RDFK?=
 =?utf-8?B?d3Q0djUyWU5IT0FKYXZpMUtvNU1hcVZCcm9Pc2daUG5OWVA3RFNRSmhyeGJj?=
 =?utf-8?B?YXBQemppR0RVcGkzeGJhcitZNExjY2lrNUZ0K1hvbVl0OFF5VjJYWDd5ZURa?=
 =?utf-8?B?R2c3UEtQYzljeGdxS1NFM1F4c3duZTM5QWdROFZNQVl6NE1IQkdLbkdJcHQr?=
 =?utf-8?B?bWRLWjlFR0dVdis3WEF5U3d6Y0xVVXdjOEZYV0FHS2hONjNndlQwN0kwWXNh?=
 =?utf-8?B?VHUzN0tNSCtYRHk5UmtDay9DTXViU3prT0R4VjNwejBrOEFOUEpTeTJPYnl0?=
 =?utf-8?B?MW1RTnlBNnVoZzBaSVoxZkltNG94MUphYXJGZFBOWnhWd0NpelRTMHRFWU95?=
 =?utf-8?B?YmNrUE9sSDIxQXJCOTJ6U3hXbTc5RG50N1pZbXhBWGJXTjB5OXRhN0pMSW1W?=
 =?utf-8?B?MnV4cDBuV1IxcEFhQ3RROEZZdVVGaFJ3VW94S3pyTHl3cnAxR3lIRVhZL3A3?=
 =?utf-8?B?M0F0Y2xRQkRDN016TThQMmwvZ2V6bnlTNFNCOE0rSXgxTVU1aVFpSitMNzgr?=
 =?utf-8?B?ek5rNWM5SndRekowcDBodTd1eWRCZU0zLzhYUDJTMDRCVC9UdDRBSU13K0wv?=
 =?utf-8?B?dDh0bjdidnBKK2tKd1A2dEZnL1RneXNQZDhvQWlncTNzdGJFQisvNjZVT01q?=
 =?utf-8?Q?olnYe0WWG8VVoZKlp3DCcW8Qk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9eb4bc-e245-4c17-ed05-08dcf95566e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 02:40:37.5328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7YtU9/APqoxHDlg4Gq574kaFJExaxDDidmpLZwKHiBsVdmqK6nBV7mtnZRuZWx2MmnEqGOnu8DVKsMMAD3XNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10459
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

Hi Maxime,

On 10/30/2024, Maxime Ripard wrote:
> On Mon, Oct 28, 2024 at 10:37:30AM +0800, Liu Ying wrote:
>> Multiple display modes could be read from a display device's EDID.
>> Use clk_round_rate() to validate the "ldb" clock rate for each mode
>> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
>>
>> Also, since this driver doesn't directly reference pixel clock, use
>> clk_round_rate() to validate the pixel clock rate against the "ldb"
>> clock if the "ldb" clock and the pixel clock are sibling in clock
>> tree.  This is not done in display controller driver because
>> drm_crtc_helper_funcs::mode_valid() may not decide to do the
>> validation or not if multiple encoders are connected to the CRTC,
>> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
>> parallel display output simultaneously.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> Note that this patch depends on a patch in shawnguo/imx/fixes:
>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/
> 
> I still believe that the root cause of this issue is your clock tree and
> driver setup, and since I've asked for explanations and didn't get any,
> I don't really see how we can move forward here.

Since you asked for a description at *somewhere* in another thread[1],
can you please suggest a place where this could happen?

[1] https://lore.kernel.org/imx/47d92ae0-c71a-4c18-9ad7-432c0f70a31f@nxp.com/T/#m587e6a25bdab542d5d99abbf01caaca89495b1d5

> 
> Maxime

-- 
Regards,
Liu Ying
