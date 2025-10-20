Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23DBBEF18B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 04:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79D310E23F;
	Mon, 20 Oct 2025 02:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ec/fNDhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDB910E23F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 02:35:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXL5qoJrkJe1zNPJGVRgHX+qtX/+PkMQ42tK+kO92zkYmGz0Ih4yTrXDOFSyA5hbGF8UbHotVHA0ajbhsPsrpGAyYCSG/YQ91DOGXl/HrN85emgD/EQjnDA1PGctCmOfSN6oGiydbU+gZpuIHhVf1mEcydwaTwnVC8HowoIwo6JNn/j7r2MpxSgFbxZIDh7uUlr9uM4l9Piwpl+h3D10oLzdnTymOEc1SSmqFQDoNmuZWPrY9Fggh0NaFAcOAQ09WArKmWa6IciNf5yBoAnvRjjji5SQeoKO3pf4VcDA6HW/fj565q8xrSXRqMvVmDSfszshblyOgKhq54iNLYRUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCV+ARqe1fuZl6gz8jaiWrli2+r1X4eOyEM3WxfLfHc=;
 b=NkrLeRJpfHCIKmwdCg1hWWOHRceWVUjP8dtYonQDTEGQV0kTiWqgWcRyNO+OYolp+gVsZyGUsBk/Tb6FxSJ7UytrbFE2Nqj+63htU0oiLrzwWYnQ3nlMloneWxOjgF3ye5GX8r3rQm2PyD6VyMrEJfZ9YbCVYWzc/WAbZem6FWWxjJDFdvVCVETpt4QBiCi/8WoP7RGOr+hEqhEd9f8OoGrKQpfhYefRMy/kZMweZoKCBCpr7FVqTPqOWkr7doRN87Y8YBkNhrHY1h+JmJefnBixdgvgmfh80uwxpfyfeHXD/OrBSfLWDPex28YX0pV9bFjNv94zbrMLyJPJkqIkPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCV+ARqe1fuZl6gz8jaiWrli2+r1X4eOyEM3WxfLfHc=;
 b=ec/fNDhvZy2OwJOI32cma2qytsBqCKWSrozVnOS740WOVeV/m0o9d86/RcDoaDln1XOStZwq9ZRFHQsTu/G2eV3Zm12T145j/7d9kdkt4CmyCne6sMt+Fh561k0AWwtS6hl+4qINVcW3mv/UutvRJHdrP/EFFBsKdFoYwSWGeghBe2Ukg7fQU+XCqERnXg0zIAGP4z0q0lRZrfeZxqrlG8K90z4v3DALtLXnbE80v0PoqMR/Lg/mWIQYrvsubR56E64LnUwfNVIhl387gBUTjJzM86wSkte+/9oUgBeBsPkCRiX3//Inhbi1RRu1tnJ1oijVtAhtgCeyZJJZjgiwzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10554.eurprd04.prod.outlook.com (2603:10a6:102:484::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Mon, 20 Oct
 2025 02:35:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 02:35:11 +0000
Message-ID: <d365c26c-289d-41ad-a9e1-222062394cde@nxp.com>
Date: Mon, 20 Oct 2025 10:35:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <2a22c45e-5de4-49ee-af3e-002941a7e2d0@nxp.com>
 <bf451620-c917-4d4a-999d-32148fbcf11b@mailbox.org>
 <182271f2-4986-4401-a4c5-ca379a02e69b@nxp.com>
 <85a35703-fc75-4fde-b9ca-a2ceb1214327@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <85a35703-fc75-4fde-b9ca-a2ceb1214327@mailbox.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10554:EE_
X-MS-Office365-Filtering-Correlation-Id: e51f9c25-4a62-4b18-4175-08de0f814a81
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|19092799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjU2RlZqZ1VHQ0l4aTE3WWgwa1lLdlBmanA0Wk9xZ1pNcjUyZGJXZ3BJa00v?=
 =?utf-8?B?UkdvTjhETnhIU1cwSHc0WmZtK01XWDNrWHRVZlJMdDhjc3poSnBSbzNPczg5?=
 =?utf-8?B?NEM5RXRXRHpPZjZhdlJ6R2l0WkpoTnRQNVNUNnBzSFpxTWVYNVhJUThiVG92?=
 =?utf-8?B?MlhSc09qbXlQQ1dpaWZhUUR5RkFlOG1PR1lKTWFxbGlVYVk3VzZ6MU1PTzVO?=
 =?utf-8?B?TmtXZjVDeHlaRmVXV2JoT2IwZ0RHVmtnZm9pMjU5MnRsVlZ0Y2c2cHJwSHcy?=
 =?utf-8?B?VUZGUWhldW0ydmhpQno5MkVFYW1ZSFVEU1Q5STNINmNacXFtZFdHVGxLNy84?=
 =?utf-8?B?K21Ea0VNWnBja2NpalJQOWZibHp0M05nbUp1My9tZTcyYmc5dE0wd2RhZmpG?=
 =?utf-8?B?b3Z1eHpPRzJtK0pSSHlqc0x2SVNGeHJPL2l6Uks4OXZTVFhPRTlaUk1HUmFy?=
 =?utf-8?B?VUs4dWlkK1ZzT3M3NHNyZUZlWlZXejRJRGc4aUV4Ykt3ZnUrTS9pVlVFcEdJ?=
 =?utf-8?B?TmMvRlh2YWpCSG1mQ0t4WFFEN25pTHpZMlR2K28yZHZoV25SSFVYdDVnbnBa?=
 =?utf-8?B?YzZXZ3VQTWIrYTdpWlhJZE00eENjaE13RzJpc2dUcStCOWl0SkNNWDVuV3NV?=
 =?utf-8?B?VkJEWVI5cXIvNUhsZVFQaFdvSGFBdHdNNkM0c1NtZVQ5Q2tldWhGUXRobkxk?=
 =?utf-8?B?cWw3UGI1L2FQc2E5QWhrTUNTNERhTS9LK2hLQmVVd2NQTERtOFNaczg5NWd5?=
 =?utf-8?B?VVBwQ3JRRkQvUmR5bGFGeVNFZVNWbjRMNDh2cEJOUjc4azBoRHE2Y3pxS3VM?=
 =?utf-8?B?Z2YzMkgza3p6QUE1OXZ1VEVwYzZxajBMeXJuMTlweU04cEZYcXR4cFFkVE9Y?=
 =?utf-8?B?em9KTzRBdzNnWEg2aHMxQkdBMWFlZXdoeTRyME5LdkhRdE5RdEZJMXg2K1VU?=
 =?utf-8?B?QjBkbXhjKzhKKzQ2MFlsTzgvQ2FFcWJ0K0dvZ1RwNnl2S3o5RlJIbVUzWFNZ?=
 =?utf-8?B?Rko3MVRnbUhCQlFzei9sUThBZElQSlRScDR0OWpuazYzSS9KaTZDUklNbWpS?=
 =?utf-8?B?M3M3dHRKU0REajlaYUtaMTVQemxWSFhDbmJZZEpPaVRYREl4dHdNcE56dTZJ?=
 =?utf-8?B?YVhBaTFLWUZWTmErL2RlWEd3dU1xeERxbjBBYk1Fdmk4VHJmdWtUS0dScklN?=
 =?utf-8?B?aXJrWWdCeEpkNEYwNEd0bkxSKytBdWhHejFGemVqL2xIT3AxQi85R1A1a2FK?=
 =?utf-8?B?NTNsb0xCVUZJbXlaYzh1TEZvMldRck1WMnNXUm1IV1BBd2NZcU02aWM5Y2lV?=
 =?utf-8?B?MnBUSEwrSWltWHo5VVpDTWNYVno3YWN6Z1pCWWxhZ3dvNWd3cmxvUkFhWDRP?=
 =?utf-8?B?M0I4d0Facy9raEVkcW52SnpmcFIvTjNQck1RUFlOaHFhOWRNVXduTWNGTVpP?=
 =?utf-8?B?bnJia2tGTWFjeTk5a1Qxdzd2ZkFadFlFNlNnTnFJRC9WRkp6YW44dG4vQzhU?=
 =?utf-8?B?WERMTncxeUwyaWNtVHd3UDVnd1cxdTJZYnY0T1puTEFqNkVVcVAvNHgzVmhV?=
 =?utf-8?B?dFlrNmc2bXA4N2pCTW9ubURJMXZ2N1pnVysvMm9xeDJDdFFkWDlkb3dySytr?=
 =?utf-8?B?d3lhRk5hMEQrcDRZNkRhKzFnZmRuMjhISHNteU5zbjlQdGhZaHM1NjNod0VD?=
 =?utf-8?B?RjB3UkoyVXJGMnQ5elNSWi9nMTJPMG9QcElrQUt4eXpwTEh5bUdDaVlDdXI4?=
 =?utf-8?B?L1lwSTNNalpDaGdRY3N3NXdOVkc3VnRFc1hJZFBwK3hYQkhTa29IQ25zejhI?=
 =?utf-8?B?MVNUenZVZDdYNzBNQUtjd3NKQ1VZMXFYc21jYjByV2hCY2VtbDdMUFhEakJa?=
 =?utf-8?B?clI5OUpTZ2FYWFFaSDdEaS95MVQ3aWhySEp0Tjc3dmVxamtCOWtXNEF3ZlVj?=
 =?utf-8?B?Y254S09Fd0tKMlJRckhGMDlpa3R3YlZxUlZJOUVKdG9tM0hJTEU3TnAycFcr?=
 =?utf-8?B?QXhMMThOYkN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym45NGR3dXJ0VnlNYWhwNmkweEx5eHhVS2dyNGtuQTJDV214RlU0WXFGVTd4?=
 =?utf-8?B?TUZGN2FkKzN5MVc0RDJlcXhKaVJCVW5RaVdjSlNZWlN5a0YyWnpiOGEwWlR2?=
 =?utf-8?B?R2JpMy9mTVVsdjRQbU5vMllKbE5yVjFtSmYySjlZSHg5dStVTlZZcWNPcUtZ?=
 =?utf-8?B?L3QwTllXSzF2Yi9JNUt3ZVR3OXFzK2RkTFQ5b0FRYVMyTGFkMU5GVGNYK255?=
 =?utf-8?B?SUhUSWdCTHFYYXlpZlVuVEFsTHJ2MUV6Z1pGUStoSlVqeTE5UmN0Wm5WdmRx?=
 =?utf-8?B?K2xZNGRYL3hKeUJpZmZLb0FnY21xdGxHbUR0RTFjb3BBK1RqaHd0bjVHQTNQ?=
 =?utf-8?B?YjNzQk85UzltQ05GZFFtY1JpbW8xYUpQSTNsL3QyM2hMejNGTFZtRVlvSVNl?=
 =?utf-8?B?VlM3clM4dEs4b2FEaU1PczhBTWQyWmJyMldRNzNDNGNocHl0QnNiUlFQZjhC?=
 =?utf-8?B?VjZ3R0xDNDkvTWU1M1dELzliTHVCcjJYcytubVpvb2hDWWhTQUlkeUxqS0pO?=
 =?utf-8?B?K1ptZXNtSEFBZ0QxclJ1U281R21VTlRzZm4veENHbjI5Y2haQVpjMUprV3JY?=
 =?utf-8?B?eENEWWJMRUlBRGM1R3VLY1hyRFZteEo1Q3NMa3I3MWVaZUlKaEN4N3dJL3o5?=
 =?utf-8?B?Nlg4Q0w3bjNaazZ6OWV5RHkwajFsaThhUm1pRDN2S3U5V1o1d1pESEVIY3hJ?=
 =?utf-8?B?c2dZaU9JQ1Y2alJFOS83UGxpdVZsR2VKL2hURHBEMWZBWDFZd2hTNG8zZ0Ry?=
 =?utf-8?B?WTEvc1lZRTY5Y1FkR0tRanhPNFhLMnFPNVF1YjFrSW56UHhJNGFNRXlWMkRm?=
 =?utf-8?B?VE13OW5KUk1CbVdQeHBVVFFqci9SamViNlhoUEFkRXN3WWhTenJnSUkrTVUw?=
 =?utf-8?B?TllWNCszWmRzaUd1Z1lvVUhBL0xIS3dEWU45ZDQ2S1JGeUpSQ2FFVk1sbWNt?=
 =?utf-8?B?blNsKzU3eWhaTTduOWRhd3RNMVNVODg0NTNWcG4yYkhxMUpuTnVxU1JrQUNE?=
 =?utf-8?B?YkJVSW5HN2lLZzIwUGV3SGp4SU5mZmdpODFyRWczclhZV2lrTjBnNTlRVnZQ?=
 =?utf-8?B?NE95TGh2dkMycW1pK3VMaDRjTk8rQ0JoUXRvaTNmMVVBNWQ4b1JYTnBDaEJL?=
 =?utf-8?B?OTVrTWh2Q09WT0pCUEduRjdwVGVUUDRGbkt3V2hnd0I4d3ZiUWY5NlByQ0pp?=
 =?utf-8?B?QkcreWp3ZXVkbXAxcHd5UmRnaGhZV3VZOGFSQXcvaVpSbFZGZ0JqbytUbXdk?=
 =?utf-8?B?UlY4MkVZQTdkNDNLZlZzdG9UTllnL2xWUkNZVDI3b0p3dm5yYkFwNjl6bEVQ?=
 =?utf-8?B?NDIvSGV2dDk4RFJaaEhWTldMYXU4c2hXMENJNHRoejh6K00zdThnOENNMkhq?=
 =?utf-8?B?LzduajJBYkpJYS9wb0l1cXNGbkpNdllseWFJZnltYlZBSW9GMTlPQnJmamJv?=
 =?utf-8?B?VWNtVGxmNGRUVk1DK3NyVk93OWtsc2xqRnpWajk4WlVPcW84UTFmbytyczV5?=
 =?utf-8?B?NGFzMGV5UWpLMzEveXZsRlZQQlFONUhaSHV6SzJPVExwdjQrMEwvbGZFWmxi?=
 =?utf-8?B?aVpOS3ZtQUtmL25PZVRkV2lIa2V5SncrYnFoWlUzSExSSGFiUWYyOVIweFVw?=
 =?utf-8?B?ZHIxQzlzYVZHNHA0V3F0VXk0RDlkbDJiZnNqS1JKMUlYNkJQK015Q1RMemVC?=
 =?utf-8?B?ZzMwOXF2dG5USkdkcTY2dnYxaTIySXZQWFdTOStuOHVtbjY3YUt0Z0xFcWZl?=
 =?utf-8?B?d2YrWEFoNk8yVk8reXdKd3dZUlB5NWNxblFmeFNhS3I3STRzeC9HZXIwSzdE?=
 =?utf-8?B?SW9nWGRSZEErM2Exa1ZsYU1BelhBSWlqNmRRT2w2Ujk5SldlZlF6VEhHbThv?=
 =?utf-8?B?dXZsSTQzZm5VbW9FTUVrMVlLS3F2aHI4MmJjSGRJY2xCaVpVM2hsSGJZMWJp?=
 =?utf-8?B?R3dHRkJxRmlFRERGZ3Jta3NocEMwNE9KazlPVjBNRUV2ZVRWUlJ2a0NwQkxF?=
 =?utf-8?B?RkJ5c0wvOU9ycFZTa2JQdmpaNDJGV0d3by8zeEpyTGsrMGlpSlYycEkrOU9G?=
 =?utf-8?B?SVlGTW52WEs3N1lSVWFlbVh4UDRnWDdCMU5EREVIZFFSNCs2MERHSGYyalZr?=
 =?utf-8?Q?uuCjzLxdod5Fs/fIs8iGQ6r1x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51f9c25-4a62-4b18-4175-08de0f814a81
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 02:35:10.9984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgvIAYZlvEVBqjQ6fIRvbp+op7OIBMLVUHCtW6P+nCSfIKDUAFqIoadZdS8eCyj62of8pe9iFjRytapirE3vNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10554
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

On 10/17/2025, Marek Vasut wrote:
> On 10/15/25 12:09 PM, Liu Ying wrote:
> 
> Hello Liu,

Hello Marek,

> 
>>>> This has conflicts with my in-flight patch series for adding i.MX8QXP DC
>>>> prefetch engine support(though i.MX95 SoC doesn't embed any display controller
>>>> prefetch engine).  You probably want to take a look at it, just a heads up.
>>>>
>>>> https://lore.kernel.org/all/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com/
>>>
>>> Thank you for sharing that.
>>>
>>> Would it make sense to send 4 and 5 separately , so the fixes can land faster?
>>
>> Maybe not, since there is no user(DT node is not enabled) so far.
>> But I'd like to have more review/ack for that patch series(it's kind of
>> hard to get sufficient review...).
> 
> I could test on the MX95 if we can somehow ... figure this out. Then I
> can provide RB/TB easily. I don't have MX8qxp device.

Thanks.  Maybe RB is sufficient.  TB is something nice to have.

> 
>>> Also, could you please try and avoid the SCU dependency on patch 7 ,
>>> and more in that direction , can the PRG be made a bit more optional, so the
>>
>> Don't think there is any way to address them.
>>
>>> iMX95 can still be supported by the DC driver ?
>>
>> SCU dependency and PRG(even more other reasons) make me opt to separate
>> modules for i.MX95/8qxp DCs.
> SCU is only a register accessor,

Well, maybe it is.  But IIUC the registers are directly accessed by Cortex-M
core, not Cortex-A core.  See drivers/firmware/imx/Kconfig:

config IMX_SCU
        bool "IMX SCU Protocol driver"
        depends on IMX_MBOX
        select SOC_BUS
        help
          The System Controller Firmware (SCFW) is a low-level system function
          which runs on a dedicated Cortex-M core to provide power, clock, and
          resource management. It exists on some i.MX8 processors. e.g. i.MX8QM
          (QM, QP), and i.MX8QX (QXP, DX).

          This driver manages the IPC interface between host CPU and the
          SCU firmware running on M4.


> PRG is another block in the DC,

PRG and DPRC are in i.MX8qxp/qm DC subsystem but out of i.MX8qxp/qm DC.

> I think those can be isolated.

Not sure how to isolate SCU and PRG out of imx8_dc_drm.

> It seems the whole DC is a composition of
> multiple reusable blocks, so we can compose them for both MX8qxp and
> MX95 the right way and reuse most of the code, right ?

Some un-reusable blocks would impact how we implement the callbacks to
enable/disable CRTC and update/disable planes a lot.  I'd expect separate
modules(imx8_dc_drm and something like imx95_dc_drm) + imx_dc_drm_common
module(which contains reusable code).

-- 
Regards,
Liu Ying
