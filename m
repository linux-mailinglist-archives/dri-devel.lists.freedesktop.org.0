Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F29A58A3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 03:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62F610E156;
	Mon, 21 Oct 2024 01:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TUABi6vR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2048.outbound.protection.outlook.com [40.107.105.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BED110E156
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 01:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjxhta0LJh5XTHIaNys6HgYsz7ZvafkUho9fusfZLDlvGKJEXeyQXI222Lm5j4J5saGdv13eFy5QevGm31Q4WzZMDxkuIiCMJs9R15GdjNJq3VhAPv5tgVnFLbMUL3ScerAuZZok9XSDkDPFvp92AjLQaZiHlKkEJWSUQwPKs2yHQdtucVpsumkP4++6sq5gK5kNU49XFTdsrautoFtyy/TY3+ho2BgZ30VUL/nDZlDQVdOdRALd+f80gVEFyW5mzxz1KGoRAwckhFCbuicqb+VDHO33IBV4VHE+VnrTw4hCEuvPjxKmZ8iTmhmEgNUsKGcKlwJmSShpGVkqEDretQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gV1jG/Cx44ZFgyknhWmBLvtE+Eem4mcWF4Mpn9CAsCQ=;
 b=QHbSmUDnJgr/DoJoGjNZuVKefdml6cgY8pe8Y0aGYpve9QrLOn50SbsC6ePUG/Mz/Ej4ONLwuDCV9DQRIyccdtnnoV0fgJv6ArQxkW4IXe+GumihCCt0HEHlAevFvVDw7xOZUDZYqUyy7uX7f40tWPQVZpXyugbmN9nUZTnSzvhW0TXNPjhri1m+dy+mzMld88UJF7Nj6mhlaxC9/KSg3Zptw713abPspZZgAde8NfRrpVb38D9zjbHtEyyU3uSre3T3dPW1AzFgsQJFjsNU/WVStM59CcwhvPHdyeFlSOE3s0/MDvXnWKuMa93Wm+IhUQYL/fUEl1vVX+cGzdSghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gV1jG/Cx44ZFgyknhWmBLvtE+Eem4mcWF4Mpn9CAsCQ=;
 b=TUABi6vRRJeYb2j08Vx0HpB0cxzLWSio22cMv72jURJE3SP/3Oq4VDFS80tf9CscKcSnKgln3cArbU9SC38T5XMF4QcTf6iYba0mEWZc6DFFFNKot9yaptQiwQBHzmWQ0iHP4TTsB4UxltmqfjgZaakhLzPTsh9WpZQ8bgDDtVncCxDKKTAL43ugG07ziK0HIGTJJFHVFeMx2wNbQZO8Vgs+d99ZHuv6f7ZFCggPHwnxsY6zKHscsniFwimZgxm234umCVr95JbwVpLJfuRhm978JC+0qzVZarFwLNxjeaSKj28nxUiaqUdHYuUhvuDk48fkxTMPZYlzSmefonDnGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9456.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 01:50:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 01:50:59 +0000
Message-ID: <16817afc-483a-445c-9245-18627fc561ea@nxp.com>
Date: Mon, 21 Oct 2024 09:51:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 marex@denx.de, stefan@agner.ch
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-6-victor.liu@nxp.com>
 <7isauhmti3vtyseanqveizlhrwmg2iade6kixhhx27edfk4bbm@yj4mekgbvpj4>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <7isauhmti3vtyseanqveizlhrwmg2iade6kixhhx27edfk4bbm@yj4mekgbvpj4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: aef29417-e748-48e8-cc49-08dcf172cff0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTVxcCtwbEJ2TEYrVnkwb2krNEpTOUljSm1mVFZWOEtiYU1IT01ja2lBSGlE?=
 =?utf-8?B?bWxjN0krTnlWalVtY0NOb2pyVjF6OW5yS20wZ0U4aE8rQWhDR0E1U3gzcVNH?=
 =?utf-8?B?L1ZETjU5QUMwZi9UNVlMbFpmUGhXMFdmd05DakJHSUFpdDFqTTV3VXNZTWtE?=
 =?utf-8?B?R3VndzZ0SlQvT0dsVXlRaFkrMGJvb25BV3ZWcHRGTnhmSENXaFlsb3lDVDBk?=
 =?utf-8?B?eWw2dWIrdUxHZmwzNHBnWXN0WkVYMVVDa0VPYndheWJLNnNsLzlBRWtzM3dT?=
 =?utf-8?B?eFlqMVQwM0NDcHRSMlhEaGQ0U1kzYzIyZ2pBMHozUTlpV3BXTjhPbVFSeWZ3?=
 =?utf-8?B?Zm8vNjdHZTZ3c3RzWC8vNmp1aWtLNEtjSE5ZWjJ6Ym5yNEZuRHpBZ1VzcHlP?=
 =?utf-8?B?aXlKMUd4YXl3VEFtREVYUnprNEQ1V3EzWXcwWC9JelUzdDQyN1NGb0ovUXpN?=
 =?utf-8?B?VHNxOTd2SEY0NE56UndLQjRnSVJ4TkQ3U25RczhGZ1R0aVdMNytkM2xxSHIy?=
 =?utf-8?B?NTAvQ2o0akkydmhZTktMZVRxTXFvdlY1Tmg5Y2huT29aZnU3ZXAraUR5Tzls?=
 =?utf-8?B?RjZnejdhOFFLTXpQMmptZkNLS2lNaWJnc0pPTmZaUzc2TUFVaXRLYjhUN3lD?=
 =?utf-8?B?M3JwbzdrU25VbXVBRVRVL1lKeWo2Y2hjODVlVDF0QzZ2QWx2aHJjVmNxOFJZ?=
 =?utf-8?B?dXpRcHNrblVZeFB3UnVtNTNqdkMxaXRyWTRpWnJObm9zNlVPb0pRNko5YTZi?=
 =?utf-8?B?WnVBdFVQM2NRZ1RjMnNneXF5ZHEvTm04YWpOY2ZibEN5T0VsOG1iUTB6Q0lz?=
 =?utf-8?B?THlVQVR1bW54VklWQkRyNDArUlU4Y0pCbml5R0RpcHZzZjRmU2ZsUnByNUFT?=
 =?utf-8?B?YThCRW9hUlgrQURmY3c0R3hUc2pFSE9laG9QWThxeWIxTStrL0pWTi9QWHk5?=
 =?utf-8?B?Ujd6UXpQaXZmaWgvb2h0dU5lM3NWazVVeVdHR3FaODFMN205RHZKY0EwTWJ5?=
 =?utf-8?B?d01Sb050L0d3S2k0ZDJpR3A3NzN4YnJFbkRicjVqR3BFRGZXQWtKSUgyb3RO?=
 =?utf-8?B?WXhLdURCTENZelRyVy91YzdSMUEyais5NFFxdkRQaTFFSTIvZG1HT2diY1Bh?=
 =?utf-8?B?TXZ0eUhJTzV6cXpRUEhjYURwZFhBUGt0RzZCc29RSmdpZkJjQXdwanVtamk2?=
 =?utf-8?B?TW9pOS9UY3RxempOajh6VEE3RWd3MWwwRE5ETHJVcmNrbE43dVhsK041dGpC?=
 =?utf-8?B?Y2xDTzhObk5IZEhvdWZtS25rVUlGazRYdExhSzdSRXBUT1R3YnIxcW11Qzhi?=
 =?utf-8?B?V054TW5za0JlRnZIbGh1UjNNUURXekJ5MmRBQW0rYVA0eXVMa0FBcjlkR0Rt?=
 =?utf-8?B?b2ZkRVQ1aFRlQTZoUSs3L3YwbU5RN2crOVB5eVpRZmZiUnEzcXZCZThwVjFj?=
 =?utf-8?B?K3laQVJVWUlIUzRMK25SR1VtaWw2cEZPVHhyRUxIU3BXT2kyTkNSR0V4V1Rn?=
 =?utf-8?B?Qm1wNlhxamY3M2JtM2E3bUlqS0FuNTMraUI2ZHRRbDVDSUozTmR0RmNEUENQ?=
 =?utf-8?B?NG45UUkvcjdEV1NwNDlaS2NOMVlDL2M0UC96OU1MdUFOR1B0V1pHZ0tDa2FR?=
 =?utf-8?B?WE92QjdDVEEwVlNlVFF0Ym1KOHF6ZWtkQXhkRDh6WGYzTkVQVnNmQ2Y1c0JX?=
 =?utf-8?B?SVd1bzNldCtTZHJHMWNGdFJZbHNPUlhiMFRneWNXOStYWXFWdHJxOU1FYllm?=
 =?utf-8?Q?iLnHmW1IoTo8CWendiaoTyXr9GYGtgP9TvrUr+p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlEwWFFKK0ZhZ3NYNjdDNUdNV0toSWwvc1c3akY2bk00dWMzTjFXZ0I0dlE5?=
 =?utf-8?B?SSswTkc2ZHY3bVFPK0U4SVlrYVRBdlVlRklyQ2M2Qlc5cUxmR09zMnVPT21i?=
 =?utf-8?B?V2djeHBQdkZ6NTVQSGZ6eUtyTGZBUFpIZTFJUkdCRndPNnVlcm00QWpPZFJ5?=
 =?utf-8?B?Q1NWTUFodCtxaWoyeEc0QTFIMTZOcVhHZTl1SW9HcVlqL05WeEgyS0Z0UUNL?=
 =?utf-8?B?ZkxCR241KzRTdzJELzMzTERiL25DMkxvZnVENzhDS2FlMlA3OWtNSmx0QjVy?=
 =?utf-8?B?dWZJdTdkcUF1YkttQjdSSVdqMndoTzhJSXJBaEJXMUI5RXAzVTB1WVJXWldZ?=
 =?utf-8?B?aVltM0xuYUs3U3REUXVmWmxCa3VNdG95M1l4NWF6RGM3NXJqSmt4K1NEeFBo?=
 =?utf-8?B?bUlWZ0tUS3gyeEQvaFBtMzJrMFBzZjA2aWU3TGZRa216WWhRZWtJamFuN2ta?=
 =?utf-8?B?TEdudUtSKzJQVkFTK1c1SmxsajZTanpiSGNlbUhtQVZ1R2V3Rm04dzZ5TUpl?=
 =?utf-8?B?V0tKRnhTUGgyZHVuNGZGN0duV3UzcnBEQUl1eVJMTk4vWWFMZW9hOTI3RVZn?=
 =?utf-8?B?cHNzY3RRTEZua3dQVmZvN1B3ajJUcEdHbFBKeFpYSEMvdFdYOXF5NysybEl6?=
 =?utf-8?B?TEswMUdPVWtEbjJ6UzYvaUVwd21uTjRVaG9Gb2dCdU5PQWdYYjZFS2ZHaURs?=
 =?utf-8?B?Mjh3S2UremhwdkRsSG9XV0toamtSZ0R3NCtUUGMrRzFoUEo1RDNlRHhDOUlt?=
 =?utf-8?B?b0ZkNEtqZWw2MW5Yb0NOZEVrK1ZQamN4M2QrNXlwcVpRc2RCVVdjUUJYb3Yz?=
 =?utf-8?B?ZmVQaUpMUVk2R2RwdGFsMFd4WkhDSWlnamZlSnJlNkpsR3lMRkVrMWYyOGZ6?=
 =?utf-8?B?WjM0WWZxeEhDWXRBb0RkY1d0QUNuR292bjZCcG90V1dTcThObW1xKzJMM1Bo?=
 =?utf-8?B?azRmclVaNEtqeVRmMXBHYzVmUTZDRDdpejNzMzdIWEIzUVlJeFdQdnRPUkhW?=
 =?utf-8?B?UUw0UkZoNEJkU2FXeTVabVA5QjVNZFNQZmYyODFGRFBXWG55MWNGQkJFQUdu?=
 =?utf-8?B?QnpTZzZkZTJ0eU9TNk5XWDZuUGNvTXhMRC9PckZOZGNRVE5DY05iZkJtNTJR?=
 =?utf-8?B?SzVTb3dxUDV4dFduZ1NXNDBFNXVSaGtVWjhBVXNXQWZJVHkxdFcrYXNvZGlP?=
 =?utf-8?B?a2xSSjZSeGFTZlhqYm9DLytHZUl6WjJTMUhEdWwxMnd0eUxtcXBUamJNaEFW?=
 =?utf-8?B?cldFcGIyaDQ5UUhXVmVKS2tVTnlPRUNzTDViSDI5ZXNsc0tiY2pUZXhqcHlV?=
 =?utf-8?B?SGZxR0dzWFh6M08xUy9hZ1NraFhMZVRCQWYya1ZsZlVNazU2Y1owMkRuc1pN?=
 =?utf-8?B?YjUwcG5zK1NZT2J5SC9JMzkvNE1DQ2NsWERqZ0ZtRGY3cmIwYjZuL0VvaW5v?=
 =?utf-8?B?SExNZFQ4Z05BUWNCZHFBTHR5WUJTOEpzWXRiZ0hjL0RMTGhDUSt6S0tDOVZL?=
 =?utf-8?B?MzdhNHl0cnVDU3hDR21iYWswRUQ2dFBKWFQrV2pmNzQvdEZXSHRPdDdoLzY4?=
 =?utf-8?B?d3RDa1hSTXF6bWVkV1NCY3Y0dEtTblJtLzF4Um1jVW1PWHMzKy9iOVp4TGdn?=
 =?utf-8?B?Rk1HUHRuMnY4VUJZeUhKN2tvOWx3TkllUHZHbmMvTEs4Y0RJcHpiSGxQQWlD?=
 =?utf-8?B?RGxSYXdoRlZWU0VWYzVsOVR4NC92QXRHMGJFd1A3ZVQ3c2xpQUZMZVF2VXJv?=
 =?utf-8?B?b1RjbEhBaHlUV0FMdkIwT21sdDZGUWF3V2V2alZKaTEwWjk0NmpCbFUrUm5z?=
 =?utf-8?B?V1R0K2l1KzF6QzZrVmZ2dWNmTGg5dTJTeDY4dm5Ub1ZlRlBBU01BRGYxNW5l?=
 =?utf-8?B?OUNVSHVMTWNLQklYMXh4a0dKWlpsRVprb1JJekdieUhEWVFmclNxMUdoTGIy?=
 =?utf-8?B?d0dNUG52YTRGR0ZrSWNid0pucmwyQmg3d3lINFAxRnNudTdLWmVZdktzbTlp?=
 =?utf-8?B?azZOYTFub2I1QnFBSlBhekxRdkF0b0xoQTVUTjVEUGFiWlI5Z1lsWm5WTGFE?=
 =?utf-8?B?LzNrNUNRcFgxNVNaQWhZREhxcHZVNnpPNE1iSTR5eFpwWU0wZ1BpZThkMis3?=
 =?utf-8?Q?63ktLrIWiifXb744Gengz1kFi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef29417-e748-48e8-cc49-08dcf172cff0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 01:50:59.7911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETlNdMvq3cWW6EUw5MYvrOm12vUhLzCB+tt1v1k24uDySzzs7/bLlimxOfqGCnogXdmGSAP2pM4HjX3bjEAfyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9456
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

On 10/18/2024, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 02:48:13PM +0800, Liu Ying wrote:
>> Initialize a connector by calling drm_bridge_connector_init() for
>> each encoder so that down stream bridge drivers don't need to create
>> connectors any more.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 17 ++++++++++++++++-
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
>> index 264e74f45554..06c95e556380 100644
>> --- a/drivers/gpu/drm/mxsfb/Kconfig
>> +++ b/drivers/gpu/drm/mxsfb/Kconfig
>> @@ -27,6 +27,7 @@ config DRM_IMX_LCDIF
>>  	depends on DRM && OF
>>  	depends on COMMON_CLK
>>  	depends on ARCH_MXC || COMPILE_TEST
>> +	select DRM_BRIDGE_CONNECTOR
>>  	select DRM_CLIENT_SELECTION
> 
> Missing `select DRM_DISPLAY_HELPER`. LGTM otherwise.

Ack.

> 
>>  	select DRM_MXS
>>  	select DRM_KMS_HELPER
>> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
>> index 58ccad9c425d..d4521da6675e 100644
>> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
>> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
>> @@ -16,7 +16,9 @@
>>  
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>  #include <drm/drm_client_setup.h>
>> +#include <drm/drm_connector.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_encoder.h>
>>  #include <drm/drm_fbdev_dma.h>
>> @@ -56,6 +58,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>>  		struct device_node *remote;
>>  		struct of_endpoint of_ep;
>>  		struct drm_encoder *encoder;
>> +		struct drm_connector *connector;
>>  
>>  		remote = of_graph_get_remote_port_parent(ep);
>>  		if (!of_device_is_available(remote)) {
>> @@ -97,13 +100,25 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>>  			return ret;
>>  		}
>>  
>> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>> +		ret = drm_bridge_attach(encoder, bridge, NULL,
>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  		if (ret) {
>>  			of_node_put(ep);
>>  			return dev_err_probe(dev, ret,
>>  					     "Failed to attach bridge for endpoint%u\n",
>>  					     of_ep.id);
>>  		}
>> +
>> +		connector = drm_bridge_connector_init(lcdif->drm, encoder);
>> +		if (IS_ERR(connector)) {
>> +			ret = PTR_ERR(connector);
>> +			dev_err(dev, "Failed to initialize bridge connector: %d\n",
>> +				ret);
>> +			of_node_put(ep);
>> +			return ret;
>> +		}
>> +
>> +		drm_connector_attach_encoder(connector, encoder);
>>  	}
>>  
>>  	return 0;
>> -- 
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying

