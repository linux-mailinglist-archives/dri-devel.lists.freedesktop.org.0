Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6892A9B423E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8832D10E070;
	Tue, 29 Oct 2024 06:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ln3Mmjjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2056.outbound.protection.outlook.com [40.107.104.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9845E10E070
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8/01jds+l3CSTKQChNj+WpFfqoLZ4twDugQl21CfqD/xsLYH1omqgcuc5h+taPsebskj5GhXutpTLyGGFqAXEm/geghuSXarrZByb45jqeUJ96Uv9Pj/L4MuzvP7IHG74cvoz7Ao6lj6fJoCxsqnWDeGHm2dpyBeOMuOL9Q83lVhI8A6k60ZTcRx8xJCOnIsrF0LXfwFZs3a52VCKmKY0Ig4glz1X18vUsOu/DwBkTrD1xKb8QKBusokDvtVjj1vn8q/tjLsAu94pxB5x0Q41SQx3Ajw3PLAOLeeBr4Cq2qgn9Nb71BsrQ+ixOYiteeTstmm0oxCo19D5d8nmpQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJALp2IH9MXgiw37AzRb6d6KlU6QoXVtqwy4yj7dvIc=;
 b=kh4Piy0aHWJCRA47cA1ac9qvxhwkt4/74pno8RxQKwvQzATSh5Plda3l/ZBWZltFtaixi8VxnYuFXtxSkeheG6J1DbZvbDgM8+UP3XO/Ng8BQWj8nYur9OiKJZUW3NXV4JUTi8dZ4JPTV/V5SQC1AyFhzEU2TIJr8jaMPQA9Fgmsn4bqHs7fx9p3lO+vLvHZBRx8DywoGdS1O2EM1kiCRxdI8Bj7/xIhl8LMksWwPl6pZpfAZHNofirgM4sRUmuy9tlG+rcoGQ2sChT5Lmjmsci662HOaw67DW3Bbu3Bb23n6dAW/vwLL84R5pFZYFNuezmQrZn7EgtZ+gBvWDgyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJALp2IH9MXgiw37AzRb6d6KlU6QoXVtqwy4yj7dvIc=;
 b=Ln3MmjjtL4xomH1opGjef5BpZ53MIf9UO3n7rotuxj4b6WU11kZbbqgDbg58t3I16W2ot23B6HA6oRmilZJOODyjwT5jsHVsXPJplU9gawhQl3Ti+i5nDQ4cwKb9JSmWWT/eWGE4ReKOr6RDTVNMJ0WRT+X2kAVDf2fbjdPYeSvIo8YVUY+WT4A2Rs9ANmhATNW3yTEO4yAj4Myix4Ln/bnq2xly0CZ/IOOKGkyGXOWvpCMyYebbMA/2yA3udqH7cjo/Xoh+zUy+XT6joIGwqhkpZNkHAH3UeBdua4XkiLZqL/RYu4JarETTpfhFQZoAfc4RCpVnoeJQ9iPh3Daxrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10437.eurprd04.prod.outlook.com (2603:10a6:800:216::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 06:16:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 06:16:39 +0000
Message-ID: <01c1c4f3-1652-4b08-bd35-08b4e1c04c79@nxp.com>
Date: Tue, 29 Oct 2024 14:16:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241028023740.19732-9-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10437:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c18a5a-110b-4679-6648-08dcf7e14000
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlFOcS83UWlXejJVNXJnd2hqSDdTWSttaDBieGZtTHdtQjMvakVaVGRPb29P?=
 =?utf-8?B?czdZYklGeCt0ekxERDhpbFFBRUJMa3hoeHNjS3lidjUvUWtUMFhJeG9HK1BR?=
 =?utf-8?B?NVhwekFBWCsrZWVScWdZYmE5VFFodDN6dnFQNG95TFVBR09zTXl2LzNqMW1l?=
 =?utf-8?B?YUdueXdMU0xqRUhid3hURFNDYXptZjNNNjZwUHhNR3FnL1o2YlpVNFdSU1Vv?=
 =?utf-8?B?YkYxZWMvK2VSOTN1OWNvZTlHK3VSUzVJcEhNbUpTQm9EeE40K3VkZU5kamVF?=
 =?utf-8?B?aFRxZDlpeTR3SUl2bnJTYWtnQjFyZnlhVXZRaGhWNDg0NmpVWE0xZElDK0k3?=
 =?utf-8?B?NEdyVVFQQmJXK1U4eElmV1huQmRmaGN3TFhTeEJaeTc3RHRWLzlXMExqempw?=
 =?utf-8?B?NktFY0EvRFM4WmhUVDZ2MUNBUUNhaEdhenJ4U1UxZDVXQlNDM09BTnF5YStQ?=
 =?utf-8?B?OWpad0dPWGV4c1ExNzl6Tzg0d2Z1bkpXaEYwZ3hvWFV6Z095WUVoZXRqMy9q?=
 =?utf-8?B?L3VMUjhQS3BFR0xPaGgzUTlZQkpLTDExTUNFejhaV09pOXNieExYRUJLS3RV?=
 =?utf-8?B?anNWa1dwa21lWUJpNUhqc1AxM2QvaHRpb1RRVERuMzhYN0tSUTNaVldXZ2s5?=
 =?utf-8?B?MThVOGdRWUgxcTVXbzlXUkxXM2JKOHU2MW1LVjBqMXlYM1M5MXdpRFJXa2hw?=
 =?utf-8?B?cUFoYzZXNHhjY3ZkVndHSnR3Umc1NHlIS3NEL3ZQNzRiOVZqMk5FOWhBcVlI?=
 =?utf-8?B?Tk45VEtjUG14b3paVzh2bG5IY2pZRXpxNThjWXJGcGNzZmcwYmhtOE4wWVBG?=
 =?utf-8?B?Y3owMjhRTVlmeEY3U0ZKYWpiWEVlMTNxS29qMVRleHFqOXF6TmRkOGkxL3Vn?=
 =?utf-8?B?YXp1SENjOVlZYTNsM3g5cnkyZVNOV0N0V1pBTzdEdFlWcVJ0V1R1ZU5jMENW?=
 =?utf-8?B?VWVsMHdhTDJ6Tkdia0svblFYS2t1Ym5YMUIweGh6WGdUUmEvVlFjYjEzYmdq?=
 =?utf-8?B?Q1FjSDRlT0p4VnkxcExiTEpKeVlOSVhVUEhoWE5PZlI0V2kwZjY5dFBsdEh4?=
 =?utf-8?B?d1Ftd083R25hci95RFVCMzVNdy8zUEJRVU9VNlBPek82bjZabFRoZ2NwenJU?=
 =?utf-8?B?NDBLT0EzU1RuSzBadkJETjZyU1o5aHhtOU9ZakhXUnc1T2dQTkE0REJsVUZG?=
 =?utf-8?B?SElxRFlJSkZlSmdMN2ZSY1doakNNaW5FTmovY3dUSDRmeXRSenNVZG5kSXEw?=
 =?utf-8?B?TUtITFcyMEQ4dWV6eU5lTUVyRkppRHAzcHJpbWxhQzdKcEwvYjJnVjJueFhM?=
 =?utf-8?B?VWNYWjdITkRLS1oyWGlSVXJPZGY3VzJ2YWd5L04wNTFVb3BSampyWm5kWEp2?=
 =?utf-8?B?eWNQSG9YRk8yWit0OXpYOGJzYnV3d1JuZFRUZVFJN0kwcHpaMTZ6VXNGWXE1?=
 =?utf-8?B?QXRqTnZZVG9FUCtaVnRDeGt0MWg3Rm1UZG16TWlLRy9OcXZ2K0N0RjdOQmRn?=
 =?utf-8?B?K0FGS3ptTnkxekI3N1N4M2RqUVRLMWlHeC9KTStlQkpLZWJPa0tBdUFRcHhy?=
 =?utf-8?B?akhwSjFDVk1nSDdSYkZjU29JeE9vRnpIRFdqRGt0UUFxS256cXhnOHpHOThn?=
 =?utf-8?B?UHlESlJrbWdqeTAxYlVOWmlxK0crSUc4dE50dVBmVVJRcGJ6L1A2b1BtZ0lH?=
 =?utf-8?Q?bySkWqx6vo9oeyLq4yEz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhCZzRHR0doQkZ3dTd1ckNJdTd6N21aTUxYWnQ1QVVzZG1QeW13S0RCajNO?=
 =?utf-8?B?YzdsUXRkMDJTdGovZUlWOWVoWjBqZnQ0ckxabnNGNjlHWHdXRGl0eFpJMyty?=
 =?utf-8?B?TTRRRmtrVG9lSFQ3Y2Ira01vM0lhYkFKWm40V1hZeDFaRWVERUxIRldid0tH?=
 =?utf-8?B?Ym1yRDJ5aGpPMDJuQUVuMHIyMlRSd3dyUkZHTENqSHYrWitxNmkxMWpPWlh4?=
 =?utf-8?B?Y0IxeEwzT1VhRUN1TVQ0ZytjZjBHbHVjRHdPaHAxWmF4eVdmbjA4VU9haGI1?=
 =?utf-8?B?dHczNURXWlB3ZHI5ZzR1YlI1WGtRR05iTFZ0LzQyQUhydDJQRk9BWmk4V2N3?=
 =?utf-8?B?bWh4NmNoSkJEc3RIa0Qvd05PTitMU2Z5T3lQQmJRUEg4WE9VMXBHWE05YXZM?=
 =?utf-8?B?bDRjdjVMUWRIYi9udE12MnVJd0FYbm9yWm41c3FtUlVhZVlPTWllcGI3VHVS?=
 =?utf-8?B?TUtYMGZpcEZ1bDFxZTRGQUFJa04vMjEydHVGWTluUnlDSmhuV2kxc0Y5MGNz?=
 =?utf-8?B?NTdBNFRMMFRHQzN3Zkh0WjMzeDZNZWt5RVlkR05jL0FIL05RSnFMdTFnbE5K?=
 =?utf-8?B?UWtpbndvZnNEUHZwUnpNdFlDVy8xSjJjSktLRDQ3NUE3Z0xCNzhScWVEVXpz?=
 =?utf-8?B?N0lmakZUVWhTaDNQN1lOOHQwdkk2TjNMcmJmak5aSjdSUGEvWnJKbmo2NExL?=
 =?utf-8?B?UHg1ZjMvaDR4eFBWSFFjdkxSNERFbW5Gb3krWGw5dGhUWDJNYjlhMk14cDB0?=
 =?utf-8?B?UFpzZitRK2l1VWs1N00wWGloNlRPWjRueVgxT0FJM1o0bHdhaWtFaEhsa3hM?=
 =?utf-8?B?VkhiN1B6TWFxbzFJZk13eWdYMmtISFBHOWxUclV5NUR0VUp6bU01OGZEcy92?=
 =?utf-8?B?V2VGNzc3MVJxMEJOQXBLazU1T29sell0MUFmZjlpanJ5OTFNOWFpRmNJY0sz?=
 =?utf-8?B?Vi9qOXNycEloMVVNdzNncWdIVWwySi9Da0R2RnBjUEdqalZWSzNlNElLNi9V?=
 =?utf-8?B?cWZkZWhmWFdKYk5keTJYcm1hRWdKWXAyT1JIOUN2TmZKV0QwZkFoRi9RWSsx?=
 =?utf-8?B?Zm5BcXJZbWZoNktyeEhva0FMak9pMmF3M0czRU9wRVg2OU5NTUQwSTZjRHBO?=
 =?utf-8?B?ZUFDMXdQOFRlRTkxTzZmQnVlM2VHQzZqN2hTSGF6WVZYUXN1Um52QllRSG1a?=
 =?utf-8?B?THlyZ3ZWb2RsaTNCazh5MXY4QzlpZWRUY1F4eVVCM1RvZEt3QWs4UE9XWENa?=
 =?utf-8?B?M3ozVnFKMmh0NGt3ZkJZME5aa09FSWdTSGZGd3dCSU9iUmV1TzBWQ0xyUmNJ?=
 =?utf-8?B?YTQ3UlArRGYxc1kzRUJxM3k1V21WSy8zcWhzMUZMdjYzT1Q2bFdHckpnK0tw?=
 =?utf-8?B?U3FBcVRSVUwrRVY4MDdMZitKWWRaZE5WUnlzL0pWZVhYY2gyZUlzOVM3cStI?=
 =?utf-8?B?bjU0aWpJOVBkZXkxMmRZNHJoUWNOTlJuRzFvSXFxODc2T0lqVVJNeDcrbVFC?=
 =?utf-8?B?NSs4bzlpOFdsUVl5eGlnZ3JvNjBuT3pNS2xmRTBSMjJNd0lodnY3anhIWTM1?=
 =?utf-8?B?Y2xSWC93Z3NuTGxGRCt3RXZ0TTNmT0RpQnNuSHgvWFNIcGphRDhyMDRYZ2ZE?=
 =?utf-8?B?T3VQcVhVLzZPS2s0Q3ZNOVFmbjc0T3o4MWdmRmFzbTBsWTF6K1NmNFdWbVBE?=
 =?utf-8?B?V0FFRldDK1pRaTgvc2dBZjdaYnNMMHV5K05GODZ3Vmg4djdjcWhEZ2NIVmZK?=
 =?utf-8?B?RXlFOEV0T2xucE1xd0pQZm5WcWdibHg2Q25NWVUyM0M2MTAzR1Y3N2tNdldQ?=
 =?utf-8?B?YnRoNGJtQmhRR2RTVGZxVEpNM2FyQ2VsOUxGTlNmSm5uV0xoZ0xUZXhJYmM2?=
 =?utf-8?B?enRGRHlmeVZWeGc3N3BPNjRZakZZVEgvTzZteEJwK2k0QzBxZ1VhcU9JeFdH?=
 =?utf-8?B?MzR5OW1panJld0k1eG9Hek1pTlYrcXNEZWUxMGFSOVZ2blZuSEVjeWs0cFRQ?=
 =?utf-8?B?TktTTjRvZ1FzMmk1T0UzTXA5ZjBTOFNiWjNYejY4VmI5cEFHTTM0UkJvbkJh?=
 =?utf-8?B?UGV2QzFqS1VBdVVNejFiM2xHT2N4bGlkc1RGeFpWcS9Jc1ArTk5CakdqUnFr?=
 =?utf-8?Q?P8r4fRnawXr50kHM1Fl4YFFNY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c18a5a-110b-4679-6648-08dcf7e14000
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:16:39.7225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vqxNVEzrApY8rYbSVhdv/K0SNKZB/yn7ENYGFr3UCzOWAy8eXnZL2Xcw1rNtbKonwevGi3fjO9vVoEgOMaygw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10437
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

On 10/28/2024, Liu Ying wrote:
> Dual-link LVDS displays receive odd pixels and even pixels separately from
> dual LVDS links.  One link receives odd pixels and the other receives even
> pixels.  Some of those displays may also use only one LVDS link to receive
> all pixels, being odd and even agnostic.  Document common properties for
> those displays by extending LVDS display common properties defined in
> lvds.yaml.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * Squash change for advantech,idk-2121wr.yaml and
>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
> 
> v3:
> * New patch.  (Dmitry)
> 
>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +---
>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +----
>  3 files changed, 78 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> new file mode 100644
> index 000000000000..5f7a30640404
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dual-link LVDS Display Common Properties
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  Common properties for LVDS displays with dual LVDS links. Extend LVDS display
> +  common properties defined in lvds.yaml.
> +
> +  Dual-link LVDS displays receive odd pixels and even pixels separately from
> +  the dual LVDS links. One link receives odd pixels and the other receives
> +  even pixels. Some of those displays may also use only one LVDS link to
> +  receive all pixels, being odd and even agnostic.
> +
> +allOf:
> +  - $ref: lvds.yaml#
> +
> +properties:
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: the first LVDS input link
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +            description: the first LVDS input link for odd pixels
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +            description: the first LVDS input link for even pixels
> +
> +        oneOf:
> +          - required: [dual-lvds-odd-pixels]
> +          - required: [dual-lvds-even-pixels]
> +          - properties:
> +              dual-lvds-odd-pixels: false
> +              dual-lvds-even-pixels: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: the second LVDS input link
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +            description: the second LVDS input link for odd pixels
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +            description: the second LVDS input link for even pixels
> +
> +        oneOf:
> +          - required: [dual-lvds-odd-pixels]
> +          - required: [dual-lvds-even-pixels]
> +          - properties:
> +              dual-lvds-odd-pixels: false
> +              dual-lvds-even-pixels: false

Hmm, I should require port@0 or port@1.
Will wait a while for comments and add this in next version.

--8<--
    anyOf:                                                                      
      - required:                                                               
          - port@0                                                              
      - required:                                                               
          - port@1
--8<--

> +
> +required:
> +  - ports
> +
> +additionalProperties: true
> +
> +...

[...]

-- 
Regards,
Liu Ying

