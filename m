Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D161B012B2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 07:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF68D10E9AC;
	Fri, 11 Jul 2025 05:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="AiFW+nEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288E910E9AC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:30:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnVLOqWsTnE7Z+RV2AL04LmW4C2zAcee2QhwpCDch0EBFMUGnaVmjf4aRzgaWaM+upbjeKBl5vO35I0OXKJh+Dl5d65SXcnexOhzs2wxb0CDmq3OJehdwmouMBphrstWON52NHUKuc1QLICrGXrXskom5BT4cZrL0cFZn8WoQ8UTzixTqcuIw8TNnrFO6Bbec1t2ZEhPuVFexLb77F9oFujgO/kgK8K4/zgq+sHTA52krUey5aHD15yjV9abxbs5pvHpNCIpaI6k1oTg8o+Cccjakwy95cU/O0IbTre7WRIJpxaQybbjwY4Z4E0efKquhaPN9m0LmfancP09AR6ipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibv7BW20KSe3Ex8IQRW+8R34PoTjqVMlkbySRBfsKPk=;
 b=xGkDYutYCN2wbdJ0VtfQh15aKWBXvwJELFBW4rjrfeBiD7nxK2qwBKWAA9gX8hF7/pqGWlupqXh35sd5P91Lwu4JAHg/S3R+skDhV0r+OTe/laaM/CVm1AU/KGvBJfso0IloiOsCyMIM1gnc757/XvXYVJn7Gt7A+LCwsYX99dbOYlvPAQccSlYxaXpihGAO4MaET5TBxjfhEKB+8LmQbPJ5D2W35A2zL5HOI5F85Lg+8s3ZPEJUCMXjrQzOrX0htC5ew78KqoI8bfOpdZEV5QTR8pxEqKZATbilYwBOBZvL6UW91ySwHUuQZAJc9zoADIh6KfEKfoewOImPB3EspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibv7BW20KSe3Ex8IQRW+8R34PoTjqVMlkbySRBfsKPk=;
 b=AiFW+nEb8Jd6SQUO/BUMYcLeGWXCgjsUhx8XPuAiCzwEapzaNw8lAp/iH+WtJwDYRv5BWsLaEDUWfK7eOJ2E6pRYs1OiVbfeKy+GL65H1jSjktRXCelfGvsCf8aRDxg6tkklKzGQ7Jcqqt0hDfcVHvOfrD75/v6nTGAG2AJMH08sqbxHY2uTkHIwP6ub8Z0ZAKlknpiRto2JnQVALcdF0MO33ipj0ZhVSdZgWspXF6BO+cLBOk7znhO5Nd0RdqtFj3+0phWNKJE0hBeEgDQ6xR4lGJuAYHkaOT1wYKf/wjp6JgX3jX+3JJDaKwghu5A7yJyjSt9wQnruAuST/BcJXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 05:30:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 05:30:22 +0000
Message-ID: <f971b9cc-0eec-43e9-b58f-a343660bdf13@nxp.com>
Date: Fri, 11 Jul 2025 13:31:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/bridge: fsl-ldb: Get the next non-panel bridge
To: Frank Li <Frank.li@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-4-laurentiu.palcu@oss.nxp.com>
 <aHCQyRiPIcOhd7/K@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aHCQyRiPIcOhd7/K@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 75acd365-20f8-4bd7-5ad4-08ddc03c07b7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2hiKzU3ekgwYXRGdWFobm5sNStSQ2FudWRPcmxyS0pWeFFnZ2NhMVJ0aFYx?=
 =?utf-8?B?MWI4dHUyYUUxUFRtNjd6dmdlRVk0NDFoYVJFTndSa0d2ampiWmpsYksyMVBi?=
 =?utf-8?B?dzlMM1RuQnFSeVlYZjVsRWpuRElGNjJ3WnBKWUQ4LzVKNWJpQTQvcXJuVkp0?=
 =?utf-8?B?dFhmcG1aUlpZWE1EL2FlYXRveU4yMkpvUTFnSXpqdTFiV21oQThUVlFRMlJZ?=
 =?utf-8?B?VzE4ejJJS2cxUER5dTMzRm5ZenV2Vk05amEyYkJNd2pXYmdzSllzYkp6RzlK?=
 =?utf-8?B?cHkyN3puVHVIeWQxRVpwWnJGMXRxNWxtL2VEaDRIUVVneWNxUEtSRkE5WEsv?=
 =?utf-8?B?Tit3LzhlQVhQZFZTQW5BL0h3Q0xtK3ZkSFNMUVZIQUpSSThlR1lCem4rZFdJ?=
 =?utf-8?B?SHhPTE1hR3JQN3ZCOTE3aGhJeFJXSkxKUEdJZFdUM3RJOS92MkFYWDJsUUlw?=
 =?utf-8?B?V1dQSTI5ZklXeGllV0ZBVkZEa1crb3lkUHUxK2NkbzZwU2Y3NTgxaUZDTldi?=
 =?utf-8?B?N2t6c0JNNzQ2YU5kZ0pvT28xNHNaSWlZUm54akVKUTI1eStpdW5XSDVQWGlH?=
 =?utf-8?B?b1RQWFFKWHBnbFpWVFVSVkJBREx6KzVnVDhKeWRvYmZBV0ZGL3lnV2s4NmVS?=
 =?utf-8?B?MlVRcHo1cWh4WVBDdHl3OVdKYTdGM2UyRTB5M2Z5M2JoSzIzZTlqdXdsUTRN?=
 =?utf-8?B?R1lnM0pJZlhwb3ZSMUtKaWVUQzR4SC9ZMzFjVnFYKy9zS3dKWWdSTVhlWnYx?=
 =?utf-8?B?TlF3bUU4eGUrWldobURsK1FiUVlXSU4ybTVkQlltMUgvcC9ETmI1UkFvR0VS?=
 =?utf-8?B?U1EzNzBXM3hPM1NNcTMvcUNMcno0S1hLTXRZVFhveUJoVzRjZ2VxcEdHckxu?=
 =?utf-8?B?WDhkMm14TGNmTUF5SmRJSEZ1N0d0UU8rdWQ3bjB6VGZHZ25JSVhGcW90RU13?=
 =?utf-8?B?U1VjSEhWTmRUZjhLaktKeS9wM0FaSGd2Z2wyV2lIL040SExRZEhYcWplcGc5?=
 =?utf-8?B?RElFSkJhMU9HMG5nMTBtMk5MeXN4YjdNZi96YWRNeis2Q05oOU9TSFNXQTNO?=
 =?utf-8?B?Y1BGclFUSFZZbGg0VFZKaEpTOURZenB5T3k1RXRiWkxmaUpSakhuZnRNR0hr?=
 =?utf-8?B?emxCWlVGZHFIQUp0dVBDS3lyVUNUb2ZjTFI5Vmo0aG9qRG01Tjg2VS9VQ2VS?=
 =?utf-8?B?Y1I0dklQM2dOcUZNcm5SNGk4RFYzM2FCU1hVUFVFMW9yZW0xd2J1UGppMUhL?=
 =?utf-8?B?TnE0ZU40ekJ4Z3h2VzZPWEtHems4K0pwR2xlMHB2ejZlWUtoK3ZYRzFQeVVt?=
 =?utf-8?B?VkMvMFFSTWRzdkY1M0FJVlNHZHBrdEZJbjkyNXl1ZzY1eU1JUGJ5N3JLZXpa?=
 =?utf-8?B?WGdCZU5QU01yL1dKM2h4c3BlV2tISkVkQzA1dUliYmdlUUo0STBrSlhFdnFq?=
 =?utf-8?B?TDVUOTRyM2p2ZWdyZFJqTFh0T1ZxRXFPZ1J4T3BhT3B0SGwzSHZibkExcWNY?=
 =?utf-8?B?L0huWDEyY2RyekdzRHhZTUowWW5XN1NPNDhlejZ6OWZ5WmNRRzZIeVB6SVBs?=
 =?utf-8?B?UWE5a1hFUHF0ZWxvTHpFdVJ3TVBMREFhQnNiYzRnc2xvUGREeW44TGhPOGhn?=
 =?utf-8?B?TUNQVGw1UnJVdzlWekR2Q083RUY1VFhVSzkyalJtWnl5d20vTXRhS0gvY3U3?=
 =?utf-8?B?eHV4VUZxQzJaNnlHSGc3MXVzL2QxRFdIdXlOOXE5RExoTWQrTWRZTERsVElm?=
 =?utf-8?B?dmVUdnFJUDNRREZ1SnZpOUJPcjl5Kzd5eDFJL1U3K3RpYXRBbXRVdkZqZzl1?=
 =?utf-8?B?UC9VZi9qQmJaMlRSenhzSEZYKzNpWElJQTBiQ1pUY2M1QnBnRS9kTDBwTnZh?=
 =?utf-8?B?MWltenI2WTAwbVFWMW05cFArMUNZSHRBbHNUMGZUakhjOURSdkNpaTdVZ0xU?=
 =?utf-8?Q?PjjLfhpBuLs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmFMemxJTGp5MGh5bm10TTJTUjcwM2ZlT0p3bWpYeGpVNnJlUlJ1U0FvSWN4?=
 =?utf-8?B?NVdsem1wdXlXTVZkdDZDd3hxKzZCcE01MEpZdzJFL1RxTngxZUxDdENncVlJ?=
 =?utf-8?B?akEvdFhQQzdaLzRwK1E0cnZGc1BUVVVKd1I1cmhPSDd0QVQ1b2MyNlAvLzNt?=
 =?utf-8?B?aGhHSnBPMytPRVM0ZHJ6N1REdmVQMG5lTVo4NE5EdVgwVlF0RWVVTGhGWnpK?=
 =?utf-8?B?eVR5SHR6ZlFmTHBDSk1CellYRHZWd3VvQlRLUUYxOTdIM2VMcFdSdzg2ajRt?=
 =?utf-8?B?L1hVWTJ1TUVFUGpsWnp5SkowRCtKS1pRTkhQeHhjZUtLeXlMNjJPSUdPK3FV?=
 =?utf-8?B?eE55cGZDUXVzUXFOeTBtSDVXYVNyVVV5ZVlxQWVpSkJLOHBuVGgwWWJ4T3Bx?=
 =?utf-8?B?dDVsN0tYaVQrU0o4RFJYK1Flb1cwMGcrbzZJenc5U3lyblFrcnluK1hFOWxG?=
 =?utf-8?B?dUFHaDNGVFdrd2lqdWdYZ0R5N3ZyS2RzVU0ybnNnZDIzS2k4Y2RSZlpEZXFz?=
 =?utf-8?B?RHNORGRqWGJsS2lMUENvdGV2QjZJOGpydTZleXJMVTRKMUZBK21iUjZ2Njds?=
 =?utf-8?B?NEpMenQxT2ZNNjhzOHdpZUYwckRoUXYxaHl3SkJwcWl0V2ViRjBmdmZuRWEx?=
 =?utf-8?B?OTZJcmNIUFBRQytDekY0LzZ3NEg4aXd4QStKbVhGMSsvLzBjdHlzWC9xOG5h?=
 =?utf-8?B?ak96M3pBcmxSQUo0Q2lGeDd2dmZEcC9TckZKb3gxYWx2bG9IaHlady9YRXRp?=
 =?utf-8?B?Yjk3Q3BES1ZpRm9ZZUJrNjJ4ZWtHNXRLb3ZUU3RJZjlJSmpORTJIeWkxUW9I?=
 =?utf-8?B?V2F0UXVXRzMvRW90bFNCVDFIczI0Mm0yMVpZczB1YkxZOU82TU5UL29jM2JJ?=
 =?utf-8?B?cHpPbDVmTDNZekhKU3dGMFVrQ0lMZXZFb2xaVWtwOU91VmNOUjlORDZyRVFY?=
 =?utf-8?B?c1d4OGVkQk1VR3d3dXVIeUxVL21nVzRXaE5uRXFwd2VyVG5Gdm9JZzhGRmRz?=
 =?utf-8?B?SGp0TVZyOW0rN3hoSk5ZeGRvU0ZQNmZTUmJ6aVl6MFI5aTVLeklNckhuU3dt?=
 =?utf-8?B?M1I5dTVLbHJ0dk9zSmp4eWFLNDdmOXdFVzZ0M0tPbDBqd3lic09TSlVtaEg2?=
 =?utf-8?B?R2lpTFJhTUtJQzBlNjJHUm1MM1Zob05tSHR4V2F0L2lETmxaYTNMUFhCaHhx?=
 =?utf-8?B?dWQ4RHNvVVJPNi9IVHJvVStnK1FYem80SXJwd2MzSmFxV3NXZko0VzRITEps?=
 =?utf-8?B?WWhsZHpXUStSMUJ0emlZamFuZXF1am9wYWk1b0ZpYks0UGQzSkZWLzYyS2Ns?=
 =?utf-8?B?NkdtNWlCNnFHRDYycVJ4Z3hxYWpQV3hNR0trMDlPT3R5SldDRnNRSHRLZ0Fz?=
 =?utf-8?B?Um8xYllRUWc1TEZLL2VFcm1HZEVkS20wV2ZVYysxZ0YvakZPQ1dIWlRMNG5l?=
 =?utf-8?B?WVVFcXI2cWJ5ajE4R1gvRkVCMXFIMFZjNFN6OURmdEg1d1hPNUJkaVFVZVBt?=
 =?utf-8?B?b1piM0JGQWtmcjFxYjFXbzhRQXdXWmhlaHZwUXJvdk5XV0hnV1VMKzZNQm0x?=
 =?utf-8?B?YWJZa2NUaGI3RHVwSllCQzA2ZW5IcXNHTjY1STl3L2VORmNqS05wMisyQTRk?=
 =?utf-8?B?SjduRXNLcmZQV1JKdlkrUll3TE9MM0NUV3lvbFRvakh1aFBnZVV4SndiYVNH?=
 =?utf-8?B?YlJlMzZXMGtONjF4RFdDZ0ZadFB3dTNyWjFOUTR3RWgrSE80TkROYTNMK2s3?=
 =?utf-8?B?bkJ6VVRxZDM0eWZvQ1NUY0hmVW4rWGVZMDV2RFMwcHdORUJUV3NBM0VNWStP?=
 =?utf-8?B?WjNQKzhJU3ZjKzhOT2lGREl0ZnM0MjFvcC9RRHVnbVVqRmNoWmxzeGdlbUlv?=
 =?utf-8?B?RW93d2g4ZlFUOER2Q3RnTEF5RGlMTVJzVTVmanFXMU8wdEMxMEJjR09BdlBj?=
 =?utf-8?B?UGFMb210RVp3S1B4aDdoSm0yZjg4aEJtNzBlOHYwNjYwL2ZLelN5c3UyNXB1?=
 =?utf-8?B?MGpRL0c3ZFI0cGU1UnlrRTRmQWZ6NnV4ZXlnM1UrRld0WWpzbnBka0prakh0?=
 =?utf-8?B?VDdudlJKN0l1NUlUYXpBTDJpU29xc29GVzhkSFNPbG9ZMGVKcWFIY0xWa3FW?=
 =?utf-8?Q?Dq2jcHUYNLNGbP11d9Yi5H+Ic?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75acd365-20f8-4bd7-5ad4-08ddc03c07b7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:30:22.2282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vR9uUoSP11Hv+J+loIrq0RYgzsHp5NTsAZM2/4YyNCGI6/SC1/8fAKOIs+JUhi9mzfVqMdizpdfh5qLwLywY3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9642
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

On 07/11/2025, Frank Li wrote:
> On Wed, Jul 09, 2025 at 03:23:22PM +0300, Laurentiu Palcu wrote:
>> From: Liu Ying <victor.liu@nxp.com>
>>
>> The next bridge in bridge chain could be a panel bridge or a non-panel
>> bridge.  Use devm_drm_of_get_bridge() to replace the combination
>          ^ extra space.

It's intentional for readers to be aware of the start of a next sentence
easily.  It's not uncommon in kernel commit messages.

> 
>> function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
>> to get either a panel bridge or a non-panel bridge, instead of getting
>> a panel bridge only.
> 
> According to code change, devm_drm_of_get_bridge() replace
> devm_drm_panel_bridge_add(of_drm_find_panel()).
> 
> what relationship with panel bridge or a non-panel bridge?

Here, the former represents a panel with only video sink, and the latter
represents a bridge with both video sink and video source.

> 
> Frank
> 
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
>>  1 file changed, 11 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>> index 5c3cf37200bce..665053d0cb79d 100644
>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>> @@ -15,7 +15,6 @@
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_bridge.h>
>>  #include <drm/drm_of.h>
>> -#include <drm/drm_panel.h>
>>
>>  #define LDB_CTRL_CH0_ENABLE			BIT(0)
>>  #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
>> @@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>>  struct fsl_ldb {
>>  	struct device *dev;
>>  	struct drm_bridge bridge;
>> -	struct drm_bridge *panel_bridge;
>> +	struct drm_bridge *next_bridge;
>>  	struct clk *clk;
>>  	struct regmap *regmap;
>>  	const struct fsl_ldb_devdata *devdata;
>> @@ -118,7 +117,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
>>  {
>>  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>>
>> -	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
>> +	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
>>  				 bridge, flags);
>>  }
>>
>> @@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
>>  static int fsl_ldb_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> -	struct device_node *panel_node;
>>  	struct device_node *remote1, *remote2;
>> -	struct drm_panel *panel;
>>  	struct fsl_ldb *fsl_ldb;
>>  	int dual_link;
>>
>> @@ -317,33 +314,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>  	if (IS_ERR(fsl_ldb->regmap))
>>  		return PTR_ERR(fsl_ldb->regmap);
>>
>> -	/* Locate the remote ports and the panel node */
>> +	/* Locate the remote ports. */
>>  	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
>>  	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
>>  	fsl_ldb->ch0_enabled = (remote1 != NULL);
>>  	fsl_ldb->ch1_enabled = (remote2 != NULL);
>> -	panel_node = of_node_get(remote1 ? remote1 : remote2);
>>  	of_node_put(remote1);
>>  	of_node_put(remote2);
>>
>> -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
>> -		of_node_put(panel_node);
>> -		return dev_err_probe(dev, -ENXIO, "No panel node found");
>> -	}
>> +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
>> +		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
>>
>>  	dev_dbg(dev, "Using %s\n",
>>  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>>  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
>>
>> -	panel = of_drm_find_panel(panel_node);
>> -	of_node_put(panel_node);
>> -	if (IS_ERR(panel))
>> -		return PTR_ERR(panel);
>> -
>> -	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>> -	if (IS_ERR(fsl_ldb->panel_bridge))
>> -		return PTR_ERR(fsl_ldb->panel_bridge);
>> -
>> +	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
>> +						      fsl_ldb->ch0_enabled ? 1 : 2,
>> +						      0);
>> +	if (IS_ERR(fsl_ldb->next_bridge))
>> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
>> +				     "failed to get next bridge\n");
>>
>>  	if (fsl_ldb_is_dual(fsl_ldb)) {
>>  		struct device_node *port1, *port2;
>> --
>> 2.46.1
>>

-- 
Regards,
Liu Ying
