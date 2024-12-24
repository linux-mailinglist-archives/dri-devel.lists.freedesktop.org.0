Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548949FB9C8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 07:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BA310E477;
	Tue, 24 Dec 2024 06:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TIj28zE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260d::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9148C10E1D3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 06:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQgapHz4zpqE/41E5uwLKDhphME+M6CBOznP1/UqF7bco+G5KflTytobPLmsvKX2jn7Tppqscnd5eqL4PSDMh6iIY9wg453lkbHUZjcJxqP9QbITEoaZnBBz2iAnubU0wecR4VtQdDC/Z6MLyTDOEm5peYbFM5mCeWymt0rbicEz5o048aSUyiIW3/BBatD1UJH254+boBbcg/GcOh7+LMDicQpvqY++7p8b4IIwBmyGkqtDHNiI5P1iZv0WDdSp4CspHrS1gYNeihSU5xRqiRBMkTVGbik8WJeDCH134x4RpprXO5RZ1+koaXzTy1x3hgDEtD92t0+8jjfrZB7frw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiIUjCNhTiDkZK/l/Cz1Gboocc9E3ddVc6iUzF8I/eM=;
 b=TwCXqfjgOfhQVnuSWWu6OwnO2mCoVgt+U2FU1LMn5YTq7auV0mAlInR//oDKej1QY6C7E9ecgtQG13gAw2ZSjMjbNshsFP90GlHYQ9kBLSU30E6Q70Q31kyeJqXTPM+3Fj5m9i6plluT6ukKGEaDeCI0PpxfT5EpFsm+42/3rdVOL5d3juU3wgH9YT3akRcUK8nvsvTCF18vii4zpvzoQZgXUbWo/I0bcTDW+SZRMqTpRzg8Ajlu+XZTjiHZ38ilEmYU6KNDlZYcnCA0C5hBkMFxlEN28Xq//K4IGrvD48DzF9Cd+U148KH8sdE4u4Z0wKgNFx2FZKyHR2kwW83OkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiIUjCNhTiDkZK/l/Cz1Gboocc9E3ddVc6iUzF8I/eM=;
 b=TIj28zE5aJ++STrr+zkvhX/mmfD0PcmITJRbr+OD+ShCAIbd4+0U1xWn6iMv2WxBay0i3RqbqvoZUCdYLhF7HR+sD35R/OB6PGcxeS/bwkj5pIzGrIOO7v667EcknMpvCh1+yqrs5U/3h4W/GfHNQLFU+dvdmWlQWoGT4T0ahbMh31htm2fDuK+tQm8vAkmRkxd8IZyrz3JUCInY26ysiFle9htVnU1MSjX6J7s3Xz2ebw70go4tZkYGrQCs25E31BNp0/jdnbTCaJGQc3Y3yJutePYbtQ9xmrIR9Ax/75xPR7J6iJKqRftYal6lUbw6qpekK5m4jsxJM9E6we1a8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10478.eurprd04.prod.outlook.com (2603:10a6:150:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 06:21:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 06:21:50 +0000
Message-ID: <b2d78f9f-014d-475b-86f1-9916ad6a3126@nxp.com>
Date: Tue, 24 Dec 2024 14:22:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, frank.li@nxp.com
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-10-victor.liu@nxp.com>
 <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10478:EE_
X-MS-Office365-Filtering-Correlation-Id: ec41eaa0-18c3-46b0-2f5b-08dd23e340a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXZJelBZVkhpVnM5WU1FbVdZcFUzeHBRRGRiY0JZRUNTcE82eU8rVU9Kak1M?=
 =?utf-8?B?bTcvZUk0QmpoNEI3NkYwcmhKWnNLQUp6bkJBMzZrNEl4VnlKNVI2eXIwUk4w?=
 =?utf-8?B?UWl0V3R0Zi9JTlR0dG02NDhtQUh2MzZEMEE3aFZoVlF2WDRYSUdVMGltUU5z?=
 =?utf-8?B?a1N3d2d6VW1VV2E2TVUxeWxZQ3MvdVczTVVxck9ObG01MFlkR3dqRjhUMWs0?=
 =?utf-8?B?UmFNemJnZk9JRUtqOGpzNkpuQnY4a1ByQ1VhNDlCN1Y5ZFZVajJXOVNQeEFG?=
 =?utf-8?B?OUduckJoTVNJQm9vM0NTMUVFNGNwNGd2d1dRRU5Mc1BESXhCcHdkUG1FNjd4?=
 =?utf-8?B?MHJJZ1lKMVZMb2FhdVdtbEVMaURlYWtWYzJSNzRFTm1RMXVLT1BMOW1KT2Jj?=
 =?utf-8?B?SHMvS3hQSzczbTA4Uyt2VjZrcXBqZk42NnZYeEs5VmRlZFdsZXh6bi9vdmxI?=
 =?utf-8?B?RDNJVlc0eHVWRDRqaDM1WDlDZDc4YjRRcHQ5UlJRSnViWVpsWUJzSGhGa09C?=
 =?utf-8?B?Q2RaMWlEZkJQR3pFZWFLWUYxTW5CTUdLRXpiY3RZam1mVjE0UHFqYjhxNlpn?=
 =?utf-8?B?YkFLVlg2Z3Y3MzUvT3laMnFUd2dObEtNb0IveU83QSszOHpSMTVUbVdTaEJ0?=
 =?utf-8?B?ZFp6MUN2U21tUmZXajJ5ei9oYVNqZis4dTBINzliN254bVM1K1diczZVK0pp?=
 =?utf-8?B?dUd0TWFKck5jYUFzRldUMXZzRWVFY3FuSUtQaFdxTkxPajFFZE1HQ1U3dHdu?=
 =?utf-8?B?d0RxUHhTRHpuZHdxMzlrQUxVRnMyVmVJNDVnWjRET296U2VXUkYwdTk3VDVv?=
 =?utf-8?B?VmYwVkJpRFdLa0p4OXlkc0ZRaTBBRDRDQnA0N1RBOVpjK01Id0NuRjMxY0tD?=
 =?utf-8?B?bnFKUjl4ZHM1L3IydDhrcXkzVFZzR0pEREg3clJ1eDNFb3o1Z0dRSzJCQ0V2?=
 =?utf-8?B?aE56K0cyaUlpaHpVU05INlpHeXRLelg1akVnN2hYRGtjVExSdjlnalFkQTcw?=
 =?utf-8?B?ZSs5amxRVTB2RUtCbGYxeWwva0xJYVQ4THZHOSs0R2JPRHUycHgrL0psbCtp?=
 =?utf-8?B?Q3RnaWNTc3RJeWlQRGk2NlFzZm5iNklXSERGVzU5cnJlWkJRZm00ZGNva1kr?=
 =?utf-8?B?a0FQOFRkUWF2MkFTd09sby9qUmZpdm1MclM4bGJ6MTVoWnpuSGMzN0pzcjNY?=
 =?utf-8?B?cjJKMUVLYlhVQ2lsRjJzd0kyN01nWHA1di9PK2RwR2xvTmE4V2tPV2MxdXNl?=
 =?utf-8?B?dFo1cFQ2TDFJM3hsUVlkWXVJVWRwMEVjeHlldEVpekoxVnZaNWFLcmgzMnlN?=
 =?utf-8?B?RUpVQkJLQ1lNQmZTUDBBZFVUVkVqMkltNWxTUEM0bTFSSzd1SFZIV0lkWVpG?=
 =?utf-8?B?c3V5VmdMbzVISnl0eGJkaWEzRkZQZ0tmT3A0K2diSXJBY1JlbzdYSjVjRUpk?=
 =?utf-8?B?VmwzRG5PUjh6M0VxTE5LQWhOL3pROWprc3FxS0x5T0tnN0ZvSlVTdVJMZW0v?=
 =?utf-8?B?YlZzV3dhY24vTTBzNUM4Zmg0Q2NDekpVTDAvTW9TNW5mNnk1NmhibTk5MU1J?=
 =?utf-8?B?WkpNbVF2SlRRbEc3QTJzYmljZ0dwTS85b2hhUm9zSXpiM3JLVVRKaVJMZzZC?=
 =?utf-8?B?ejl6K2puNWJVbHN3MERHYjg3aDYyRnpDTlRRdkNKVklCaFY0ZGlRMW5Za0Vt?=
 =?utf-8?B?TXpiZlM4elU1S1NXblJ3WmliTjJud3ByQVVYdjhqSEhDbkpYN0RtVFQ3VjNo?=
 =?utf-8?B?NTZWSkRYKy9CM1piRkpDWlVPMUhxK2drOENxcHgzMjVPS0d3Zlo4ZmNMd0wr?=
 =?utf-8?B?Nm9rNDJWQXE2WkV4a0EyZmZUM0l3KzZ6bmNVQS80RUE4cEFqVTRRUEJnUlVy?=
 =?utf-8?Q?EZse9PGly4g5a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVBqZ3hRM1VsWWxCTVpreUJBUGNpMXQ2N2lpdmZ2M0oxL1pYMDE1WWc3OE5R?=
 =?utf-8?B?dXh0dHA4Nmc2UlUzdWdOTWR6N2VVZEJ5c0x0aEw4RWNsSUNTOUdTQVJnaFE0?=
 =?utf-8?B?NWpPSVA4azlSYXBudmgvaUxEZ1laQmxNdGlIZjJraS9NSEVKK3UzYWZYODNN?=
 =?utf-8?B?b01wOFpxQVVUaDdEQ3BVbU5BWE1sck1YSGtRV0VtMCtrM1ZPa2w0ZUtBYUtB?=
 =?utf-8?B?d3ZOaU1wS0VYNFU1Z3h5TyswejBwckVjZDBKRjIrSGxUMHJKQTFzV2JqWHQ4?=
 =?utf-8?B?cjlxYnVEMHpBbnRVUGdrRS9NWk1FaC9mR2I0VWFBTytzZUpOMVNNK3VuanB2?=
 =?utf-8?B?UytSRFVwaThEb1RKcnNFZHh6OGEzdTVnRXFBblFZYjBUY3Y0SWRtTGVzWFRS?=
 =?utf-8?B?STBkWTdlcjZaWGJraWJ5cjVnWmp4YnJtZklud01yMUpMQll5L1pyc0RpdU01?=
 =?utf-8?B?K05VNW4wYWN0VTIyWjkvdEt1SFdsVXhVVlVOWFZVWkIzQzFaSTErclh1ZGJ4?=
 =?utf-8?B?N1gxcEQ5TkY2OFdpOGZ2TWQyai9lYVR2SlZuaXNpSXlxVjV3Yis0dHllUy96?=
 =?utf-8?B?T0RNUnN0TEIxbWt1bVpPUytrdVo4TVdjNVVxS2h3UUJwUmFEaitlb0JWQWhJ?=
 =?utf-8?B?TXd3b1NrS2lmYVhaSGxqQk4vMHpMYkpqd2luTWpPa1FCbnJSWDFkenMrNklK?=
 =?utf-8?B?Z1lBL1VROVcxSGRXMUlLaC92N29YZXVHVTVUKzBHUHJMOEdXcFNUbzhHalRn?=
 =?utf-8?B?ZW8zZHVkc3phMDF4QWp2QnF2b3JwWC85NzhGbmZzSnkzUWhoWnlYaSs2cSty?=
 =?utf-8?B?NytVU0JpZWtjdE9iczJza1ZVNUYrM3pxaUxML3dXTCt1OXN5b3ZadWR5ZmVM?=
 =?utf-8?B?V3VMZmEwd3hVTWY3djdCUk0zWVo5RDU2aWF6VitVWVFXREdyR2tZL2tLblpU?=
 =?utf-8?B?MzlYSytYZWQ4Y0hMQWlwSlNUK1h5U01ISE5LcWl5Q05YdXQ4Z01SOVJQVkZZ?=
 =?utf-8?B?YWNVYUlmTy9oNElLRkZhaC9xVytPN0w1Uk1OZTJNbm9ObVpaT2s1REMxbHRV?=
 =?utf-8?B?TGgwQmMxVS9Ha3ErZmp1Qzg5NkhETldvOWdQcm1rOGtkS0VhMnUyS2NJUWNl?=
 =?utf-8?B?c1JJako1K21hcXlBN1pOK0RaUG43QlJMVXB4VWY1T0xyemlMUEtMckppUkFN?=
 =?utf-8?B?MW9kKzhQSGZzTXpHclhTenplSVVKNThhVTNqZmJnbTNpRW53d24rZzgxbG02?=
 =?utf-8?B?c3pDOURLNHVuNWI1QTE1WE5Zb2FXbm1IbHdUbFZCM2Vub3Z6MklhczJQbHVV?=
 =?utf-8?B?c0ovTk9pSXphTjFjSFNPSzlwa2tZRWZjaHZzUURaNjE2dG5FTHpnK2tiSnNq?=
 =?utf-8?B?ZjRjaGxsaysxRDdGbTBWeGVDckI4enZNTlI2Q0ZWNWcvRCtSTGJidGZlMWYr?=
 =?utf-8?B?MVp3S2ozWG93bUpjQSsrdlh4QkZkMHMyVitJa1hBb0UvWHY5NUdSM0dSYTZL?=
 =?utf-8?B?cjR5QjJYT1cvZVNlbXlPUUNpb29pbXhENGtIVmdQdzBoNmV0QVBzZHZXQnZu?=
 =?utf-8?B?dStYT1p6TEFrbUZWa0VxVlJhRFA3VXBITHQxSmh2UXJjZEJBMWVIR0ZubGlx?=
 =?utf-8?B?UCtqclZPSXZXaFFiV1FkVGd4NHRkK0dsL1FOSHdoQVhiYnhUdzZDTmQzd0cw?=
 =?utf-8?B?MGR4VDU1YldLNEIxc3I0aVQzdEJtcUs2WHhXQWh2cHowaEFZUkhpUG1vRlc1?=
 =?utf-8?B?UHJweEZvWkwwZHliMWVzQklZSXhMQ2xLVXJKQzc1STQ4MDFQQ1VqTUMrY2JZ?=
 =?utf-8?B?ZDRPa0ZObXBoOFZnZFFHSXozQ2lUQnowUUxvUzFOZ0VNMjkyZjNVaFJVSDk2?=
 =?utf-8?B?Uk1VOURrVHJNU09rT0JSWVlqdjZqYVJNR1lRRlhxdGl0TGl2SUlqc0lsUFg3?=
 =?utf-8?B?cEFOSjYySm1zWHFsQUJaUUl4ZlpOUkZ0NUtOR2xJdkdBZkZxQitRN1F4MzJt?=
 =?utf-8?B?bDhyM0lFVXlBSVgwRGhxTVBtVFkxNGFha0I0V09acC8weEhlSzdETWMvOW11?=
 =?utf-8?B?MDZ1ZUtIUXlYbHJjV1B6dUFIRk9EU1FpTVBGL2JjL1Qxd3NVU2dibEZkajdY?=
 =?utf-8?Q?5FA/V/0XbWo3d5z3AA7uNqVYV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec41eaa0-18c3-46b0-2f5b-08dd23e340a1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 06:21:50.6798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjjwfedgiGV+2rqUSnlHOpcouz3UUJk5N1JwWn1AmzjhXNW47eDEcwdEL/KeALdfvsY8ZB6ddt7zzEyPsotq/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10478
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

On 12/23/2024, Dmitry Baryshkov wrote:
> On Mon, Dec 23, 2024 at 02:41:37PM +0800, Liu Ying wrote:
>> i.MX8qxp Display Controller display engine consists of all processing
>> units that operate in a display clock domain.  Add minimal feature
>> support with FrameGen and TCon so that the engine can output display
>> timings.  The FrameGen driver, TCon driver and display engine driver
>> are components to be aggregated by a master registered in the upcoming
>> DRM driver.
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v7:
>> * Add kernel doc for struct dc_drm_device. (Dmitry)
>> * Fix regmap_config definitions by correcting name field, correcting read
>>   ranges and setting max_register field.
>> * Get instance numbers from device data(compatible strings) instead of OF
>>   aliases.
> 
> Unfortunately no. Your instances are compatible on the hardware level
> (at least they were with the previous versions, I don't think that
> there was a silicon change).

v5/v6 use OF aliases to the instance numbers, but in v6 Rob said it's
abusing aliases because the aliases contain display controller instance
number, like "dc0-display-engine0"(i.MX8QM SoC has two display controllers).
Or, use OF graph to describe all connections between the display controller's
internal devices, but it's too complex. So, I choose to add the instance
numbers to compatible strings.

> 
>> * Collect Maxime's R-b tag.
>> * Trivial tweaks.
>>
>> v6:
>> * No change.
>>
>> v5:
>> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
>> * Select REGMAP and REGMAP_MMIO Kconfig options.
>> * Fix commit message to state that display engine driver is a component driver
>>   instead of a master/aggregate driver.
>>
>> v4:
>> * Use regmap to define register map for all registers. (Dmitry)
>> * Use regmap APIs to access registers. (Dmitry)
>> * Inline some small functions. (Dmitry)
>> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
>>   KMS routine to initialization stage. (Dmitry)
>> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
>> * Drop unnecessary private struct dc_*_priv.
>> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>>   interfaces to bind/unbind the drivers.
>>
>> v3:
>> * No change.
>>
>> v2:
>> * Use OF alias id to get instance id.
>> * Add dev member to struct dc_tc.
>>
>>  drivers/gpu/drm/imx/Kconfig     |   1 +
>>  drivers/gpu/drm/imx/Makefile    |   1 +
>>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
>>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>>  drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>>  drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
>>  drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
>>  10 files changed, 810 insertions(+)
>>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
>>
> 
> [...]
> 
>> +
>> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dc_drm_device *dc_drm = data;
>> +	void __iomem *base_top;
>> +	struct dc_de *de;
>> +	int ret;
>> +
>> +	de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
>> +	if (!de)
>> +		return -ENOMEM;
>> +
>> +	de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
>> +
>> +	base_top = devm_platform_ioremap_resource_byname(pdev, "top");
>> +	if (IS_ERR(base_top))
>> +		return PTR_ERR(base_top);
>> +
>> +	de->reg_top = devm_regmap_init_mmio(dev, base_top,
>> +					    &dc_de_top_regmap_config);
>> +	if (IS_ERR(de->reg_top))
>> +		return PTR_ERR(de->reg_top);
>> +
>> +	de->irq_shdld = platform_get_irq_byname(pdev, "shdload");
> 
> Nit: shdload or shdld? Which one is used in the documentation?
> 
>> +	if (de->irq_shdld < 0)
>> +		return de->irq_shdld;
>> +
>> +	de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
>> +	if (de->irq_framecomplete < 0)
>> +		return de->irq_framecomplete;
>> +
>> +	de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
>> +	if (de->irq_seqcomplete < 0)
>> +		return de->irq_seqcomplete;
>> +
>> +	de->dev = dev;
>> +
>> +	dev_set_drvdata(dev, de);
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dc_drm->de[de->id] = de;
>> +
>> +	return 0;
>> +}
>> +
> 
> [...]
> 
>> +
>> +struct dc_de {
>> +	struct device *dev;
>> +	struct regmap *reg_top;
>> +	struct dc_fg *fg;
>> +	struct dc_tc *tc;
>> +	int irq_shdld;
>> +	int irq_framecomplete;
>> +	int irq_seqcomplete;
>> +	enum dc_de_id id;
> 
> Why do you need to store it? This patch makes use of it just for the
> registration.

dc-crtc.c added in patch 12 would reference de->id. If no strong opinions,
I'd keep this as-is.

> 
>> +};
>> +
> 
> [...]
> 
>> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dc_drm_device *dc_drm = data;
>> +	void __iomem *base;
>> +	enum dc_fg_id id;
>> +	struct dc_fg *fg;
>> +	struct dc_de *de;
>> +
>> +	fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
>> +	if (!fg)
>> +		return -ENOMEM;
>> +
>> +	id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
>> +	if (IS_ERR(fg->reg))
>> +		return PTR_ERR(fg->reg);
>> +
>> +	fg->clk_disp = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(fg->clk_disp))
>> +		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
>> +				     "failed to get display clock\n");
>> +
>> +	fg->dev = dev;
>> +
>> +	de = dc_drm->de[id];
> 
> This depends on a particular order of component's being bound. If the
> order changes for whatever reason (e.g. due to component.c
> implementation being changed) then your driver might crash here.

Nope. There is no chance to crash here, because
1) dc_drm is not NULL here
dc_drm is allocated in dc_drm_bind() and before component_bind_all() is
called.  dc_fg_bind() is called by component_bind_all().

2) dc_drm->de[id] is not NULL here
It's already set by dc_de_bind(), because component_bind_all() binds
components in match order and the component match for DE is added before
the one for FG(DE is a child device of display controller and FG is a
_grandchild_ of display controller).

component_bind_all():
        /* Bind components in match order */                                     
        for (i = 0; i < adev->match->num; i++)                                   
                if (!adev->match->compare[i].duplicate) {                        
                        c = adev->match->compare[i].component;                   
                        ret = component_bind(c, adev, data);                     

dc_add_components():
        for_each_available_child_of_node(dev->of_node, child) {                  
                ...

                drm_of_component_match_add(dev, matchptr, component_compare_of,  
                                           child);                               
                                                                                 
                for_each_available_child_of_node(child, grandchild)              
                        drm_of_component_match_add(dev, matchptr,                
                                                   component_compare_of,         
                                                   grandchild);                  
        }                                                                        

> 
> This applies to several other places in the driver.

I don't see any other potential crash caused by the binding order of the
components.

> 
>> +	de->fg = fg;
>> +
>> +	return 0;
>> +}
>> +
> 

-- 
Regards,
Liu Ying
