Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275AB9A9B04
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 09:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6601F10E2FE;
	Tue, 22 Oct 2024 07:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eFy9O0tD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013028.outbound.protection.outlook.com [52.101.67.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D705F10E2FE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 07:30:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fv2te0jbU6UuMHjDdPCxg9AYSG/sdmzMHFNGHB96Fty/M1Wf2QuCTwSRKuu5xUpj0KtBHWf8NZ0lsjhe30pjfUrZUZFSRTjqfZGIPaiKWo0WoO0pf1aSUSPQNnzCMjkTPDAVgDx9pHhqxFzgoO1Os/tHaVdaSZGiG6XkONuPnsMKTr2lKLg5iF4whTsEx13pBERMJQlB1I9VNVc03bs0wvyGbT5Vx5udkQVHQZtV7zweQTARYme1KkI5ChaoB/0L8+uyAoJj8WW4/1aFsa3o5LdOQL40Jdj3sC792huuQpUqYvUrP5iKJ9mdmkZWILnz2LS6KChPT/unBa6fat+2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZiDxQJueX2kNrtV8pILCksyXmzVv0yhXnws1YeRxRY=;
 b=zD8Nx6ESbcTmHIDRfq11y4vZdrpVCL2zuHXMGoUrXIsE+4DLqQEPmnNqDa1CvFxY1cZlnY0JplomhuHqrq0rOVJbmWJhTIdVNZ7oFbM4Y1VSPNT6ktkkyROvDmwn3sj+EUBycMSa1/ShTx8f1oAUbAcDx4nytSsjjKTK0E3pn5qY52ZSj59xND8qaIin7mKgyQgd4YF9BxhsNNZvhl6eNkHc3w4A+KuvVh5/9mS0wU7Bhb5YeEz4Qqbl5rzG82pNYln+cYkjrpYS04lUJ82DdqojyC0fAq11OqCiDi1UXyxdM2/PbO8P/4hb6TEyWvKFl2QQu5SKeD6gPzBi4ydbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZiDxQJueX2kNrtV8pILCksyXmzVv0yhXnws1YeRxRY=;
 b=eFy9O0tDG0psiQYN42TzrxROfVMugppJsX0SFEg/DKTPwUXBeLP+//tW4/s+ZplXZaNNRJRgseP/xlyHmXretMyuELHd0BeQf/BdsA6sRnRE5cI5lNU0zmTseK3K0kTmHo5S0ijkrQbmfyc34rRnmxUsoGL6tIa11NCVqDfdj3KYVPnSrHBJIym5+gslCXhSLg8oBFLv/Xwst8mC1H8bZm5DEJkshqYPz0NQlvVd7GJGvHLD/ou4n//Gcg19BkudbABPnOPcJ+2yFEJi9iyIkeaJ6rqGD5VdS+r9Cbr+vGPMN6t6NRlhi8apKUOwj3jQzU9wJqLs64vVHOCk6jeB8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6906.eurprd04.prod.outlook.com (2603:10a6:10:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 07:30:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 07:30:12 +0000
Message-ID: <782599c3-7582-42f4-9f25-7f283a5b453b@nxp.com>
Date: Tue, 22 Oct 2024 15:30:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-13-victor.liu@nxp.com>
 <TY3PR01MB1134641A1F639A61282F82B8986432@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB1134641A1F639A61282F82B8986432@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0085.apcprd02.prod.outlook.com
 (2603:1096:4:90::25) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: a1aed630-bf7b-474a-1385-08dcf26b5d5a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejlzYlU2dVhPL3N1QUlnQ283dVovbFU5Vi9mNlZGMHA1V29Zd3lBZFlFcEVQ?=
 =?utf-8?B?RFZxVDVmeUZDK1dnVlB0aDFsbzU3eWl6TDMzM3FaZ25UTkh3d0JiTmlrbkhU?=
 =?utf-8?B?RUloNzYwVlFUVmhnZ3p0TE9MbmpjWTFWN1dWVTRScVlDOWRjenFFd3RSc2o1?=
 =?utf-8?B?ZThaeHhaUXFjMTBsVFlDYi9FeGI4dUMwWUZWbFN5QVN2Sm92bXpFMnc4cTIx?=
 =?utf-8?B?WEx4L2dmWGVYMm1pUXpScEM3cU1KdkhNR2U0WVJJZmF5YTlhRUhoRSthbW8w?=
 =?utf-8?B?Ky9EY2IwWmdoSUhOUWJpTVUzQ0F6cWtoaWxhS2wra1ZyVkZ3bEJOdlBjNnZX?=
 =?utf-8?B?MlFTQXZsOWRsbzN6elpDeTJLZnNwSGxLT1BTTGhQQ0Rqb0lXaE94QUdac3V1?=
 =?utf-8?B?SHUxY1pXQ2J6ZVhJcTI0UDBPYmFyVXNZS3R2Zm1BZkR3Skh6My8zcGNHS25t?=
 =?utf-8?B?MHljTG4zRWVLdXN4eWErS1AvVFFzZFNGcklJVlowTU90dEU5V29ibkZLcEZN?=
 =?utf-8?B?NWQzaG1DTitQd2x1L1R3NnVHVUltc0NPUy9wNldsdE9TYU5Ja2llOWQ3M1F3?=
 =?utf-8?B?Z01iMDJjdHdnU3p2UXpQcGtCSGE3QTAvdjdZMGM3RHhQaFc4UUxDWFRRalVh?=
 =?utf-8?B?VGREUW85aWNUSHZjS1cybnRyODR2d21QVjR3b05WSUdma1dlRUtyYWF6VUFw?=
 =?utf-8?B?UGUybTZtdkZQOTliMUtoLytiaHErNzZZTGpicFRZZW1vOHdEMjBXbTdQYmVr?=
 =?utf-8?B?eUpIbWUzUnVPWHFGV3RXUC9rZ2toY2JuanhxelhkeEVvd3FBczBEREQ1Nlor?=
 =?utf-8?B?ZytTRTgwZ3BVd3gxT0RQTk00VXdsZ3hLaG9BZ1MvUXRSVHV5LytkSVo2VWMr?=
 =?utf-8?B?NWZjTnVPbzZza2NZK0VEblVPaXRycHVrcEthREJhRGZUVVpSMldxcG9tVkFN?=
 =?utf-8?B?QVI0aVlyQVZobWprU01sUUxtSVRjSm43RllOQUQwVVREc2NBM0NzdFhlMElJ?=
 =?utf-8?B?blFJZFdiVU1LZjViZHExaVNkQ1VqbkxhdDMvQllUWFpxblZBelBuN0hvRTJ0?=
 =?utf-8?B?V3VyL3BQNkJXdTM4Z29Vb29tcmVra01KVXpYZlc2N05pazhvSUFOcTdoWVFx?=
 =?utf-8?B?WDE0YXFGdVIrdk5PQkNOTXNDUmxyK1NUdGRBQlBGMVc4Zm1OZTU2R3ptc0ls?=
 =?utf-8?B?NlBLVzRiU2hLaFppSVdPbFhjcEw5RkdTYjh6cjBOeHlrK1luODV5YXo5Sm9o?=
 =?utf-8?B?UVZsb2ZxRXFqN1ZraGZXZFFzb1haYUFjRmRCTTA2R1BQQkpFWWdtQjMrdXBI?=
 =?utf-8?B?UEpPa0VvRzVVN1FmbENrKzJ1WWFFWFY2QjN1TGlrc2E5ODcvK0xhaStZOEgx?=
 =?utf-8?B?ZUtEMWxhanVicXk3bE05UFZGT05ZcGpkdi9oYTB4cVBZWlViUisrK2FmSkhl?=
 =?utf-8?B?UVVkWDdXYjBrT0JBcW9talR3RDBsNE92VHM2UDJJa280am9kcnExd1BpK3Bn?=
 =?utf-8?B?SHhVaHZ4ZUlKOVhWdHpiSVp3UjY3SWRiS0k3OVVHdXU1Z3ZWcUs0VWUxSjVS?=
 =?utf-8?B?eEhvalJjVndYQnR1N2RLY0hTeThrU1poWlJKN0lpaXhFUjZvY0M3MDhVckxF?=
 =?utf-8?B?UTFkbVFSVGJPTkxQMkR1ejJncVlES1l0NDVDc3VCaVlGZnZJdU4yeEI2cGtV?=
 =?utf-8?B?c2NwTGhlU1NwaUtRbVN4RTFycThiN0pEZWJEa0x1UUVkUDhKNEZVU3NnVUgw?=
 =?utf-8?Q?9D+5rWLYYyfzWs0bdiFshZ5nsA2Y1HUeibixdfz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUhqQTRqejdrUWhVM0d6MDZoZzlYTUF3VWgzZjExTDh0eWltSW5hcUhGZDI4?=
 =?utf-8?B?VlJqNGNuWlZGcDh6dVIzWEt6OEwvTll3bHc0SlFFLzBvWXprVmNjc0tVTjRl?=
 =?utf-8?B?MDdObzMvWWw5UzVaUjF2K0JNTzM2bElKS05CMEx6VFl5NVhoVWZIdkNSMW8y?=
 =?utf-8?B?UHBEY3U3elhRQTZDSTVLQ2I4WnFWNlc5YnFyZFVyT3B0dnJZRXVaZ00xWlc5?=
 =?utf-8?B?bnhBZ3pwWEttUFlWOHdUa2hvWkFpd3RCVk9ocjNXWG5wRDUxWG1pcHk3SldX?=
 =?utf-8?B?cG0zVzZPTFlvaWwxSTVEQjlnWFBMR0lhU2hQZGI4encxTWtGN3RYV2dxYldJ?=
 =?utf-8?B?dVk5MlVhWDdkd2dwREpIZ3FVUk8wTHZmR2tEZThaVVJPeFFEME1FMDF2ejBa?=
 =?utf-8?B?KzdTbS9rdXVURWVON3IrQ0JYR01WanpWQVg5a1EyZk9XdExuZ3BqLzlGYVcy?=
 =?utf-8?B?amZwZGVjZkEycyt4dUg0L2hOcUNzMC82eW0za3N3YkRZV01GOEdmMEJGT3J5?=
 =?utf-8?B?TmVUajFJb2JWakFzQVpsRktpK0FNeG9jYmZKQVh1d1JnMXhYTEdKbDljSHI1?=
 =?utf-8?B?NG1WbXYrblV6QThZb1NaQnBybTZ5Uk85ZWg0bjNYNFVqNzRxUkdhTG9HR1JC?=
 =?utf-8?B?R1BIWkdDS2JVMXg5Sm5PcUtRbFRsTWpQTFJlWTJwSStmek4ycDl3TEVLaWYx?=
 =?utf-8?B?cHo1UlNpeWEwSWVJMmdDcGFtTERSNU82ajJxZ1g5bVdnaVZzOFNQMUlES0Nn?=
 =?utf-8?B?UzMxbDNVREhySDRWZFBDZTJad0M1czBBR2xyREQrUXI0TVlMc1NMWmhRR3pQ?=
 =?utf-8?B?dHhPSlpPaWZ0VEVibitScG55UU5oZVF0b040NnY2ZWtaUUZVQi9Qb0lrUXZJ?=
 =?utf-8?B?RUswdEhWbzg4bkphbXo2bi9nQ1VDSWpxRlpveENWNDRGSCtlMUV3ZFRiY0Nu?=
 =?utf-8?B?MFFCaTEyTjE1Rk1lK0ZiYXJqQ0JJNHFXekdVamo4WUJWeW5wNUtVZUxBVVY0?=
 =?utf-8?B?aGZQK2pNSFB4ZzAvejJLb0dNQ3Y1VE1lL0RibDhvdXJ6MnhmZVpZSU11azNU?=
 =?utf-8?B?OVZ0YnVuS0N2dXZVWmJySVgwZjN1RmduQmZjTlRHSEZSTHhXK2FJT0lTd2Iw?=
 =?utf-8?B?NUNBVmpqM1RudE1mSTYwdHZoSkNiYnhmaHJCYkwzZ3d3dzdrOTg5TWtKYThR?=
 =?utf-8?B?MkJUNE9kMXdEVmJTemIzT3UrRHlVNkZGZnRGSnZyYy96RlhtRGtBOEZGczNU?=
 =?utf-8?B?QVpSN1JYdjhyalZhdEdJdDNXa0xPRER1ZFNONE03bnpMUVplWloxRGZDcWZL?=
 =?utf-8?B?RzlkUXdaeDB2akpjYXhrb05pVCtKS1F4UC9iUjVENFpQd1BJUWFyU1N3OEVu?=
 =?utf-8?B?REI5bTZOWGNkeUVzNkUwZmhQWC83UzZsR2w0bXp0d1VpUU0yY05pQXlTWEpS?=
 =?utf-8?B?SThVZk4rZk1lWDhuL2FQZ1BnMzdVZXJmSUNTbm1WUEtUSW40OTJqY2RPbU5G?=
 =?utf-8?B?QjhNTWdVUU9jYkoyazFmN2hmaUMzYzNkcXhKeHZnNW1TSkcvR05pNlZ6dm5k?=
 =?utf-8?B?MTdwWWZIREszRGEwRmE5TTNWY0xzbnUxQUhPRTBIWHE2UFc3bVp4TkVtVEln?=
 =?utf-8?B?aGg2OS90b1JSb0NDK201czkvVFpTRUttZ3RUYk0wVVZxdFNDSjVjTkhTTEJi?=
 =?utf-8?B?bVAwUmpiNEh0QlZxYjYwbGJwMmsxd0NqUzlmOXdJbGU4cndyaFBmelQ4MUw4?=
 =?utf-8?B?MHIxK0MxMGcrOGEva2FSNzFDV0VFOTRSYktUUEY0WXdFSm9VVTZvVnRRempi?=
 =?utf-8?B?KzNHcG9vVWYxK1NZc3RLZ1RQbDlObmFQYThJTm91NmpRb1RqMFAyRjBab1BI?=
 =?utf-8?B?dS9rekpRdVQ3eU9ESG91SHh6Y1BmdEZybGhQaDZvcVFETGd0OFJJRGQ0N1cz?=
 =?utf-8?B?bVR0eWJYeHFJZFFDMEM3TWxaZnRKakI5ZDNDeG0zWm9xM3dPcmg2ZkEzbXNQ?=
 =?utf-8?B?ODIwVEtXQkpSeWRscmZlblFrZytnakFvMjZKd01uYnJCSXJHMEcvajI1aTlt?=
 =?utf-8?B?cW5wazdPQ0UzRjJCMys4dlZPc3h1dzVsMWt1NUFRckRjZ3E4NUhMV3lLdTlN?=
 =?utf-8?Q?pXqi98baxCI5fwrtJgVQ39sVw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1aed630-bf7b-474a-1385-08dcf26b5d5a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 07:30:12.3065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yxf4EqVK0+7jISk1J+0Z/HEy+kKozZhn+8s9xupNrCDG3pfNgNHDItAlO15SbMUD8l8EvYL84sp+QB/0c6jH+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6906
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

On 10/21/2024, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
> Thanks for the patch.

Thanks for your review.

[...]

>> +struct it6263 {
>> +	struct device *dev;
>> +	struct i2c_client *hdmi_i2c;
>> +	struct i2c_client *lvds_i2c;
>> +	struct regmap *hdmi_regmap;
>> +	struct regmap *lvds_regmap;
>> +	struct drm_bridge bridge;
>> +	struct drm_bridge *next_bridge;
>> +	struct gpio_desc *reset_gpio;
> This can be dropped, since it is used only in probe().

Will do in next version.

> 
> With that fixed,
> 
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Cheers,
> Biju

-- 
Regards,
Liu Ying

