Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B345EF2C5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 11:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9416D10E553;
	Thu, 29 Sep 2022 09:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2065.outbound.protection.outlook.com [40.107.104.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A35D10E553
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 09:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U27vNlEbaLMTO3ZX/4BFZZdDpeM3qmnQjHG85x/0AJU6wsvP/KDIhGAN0ZKttqhtdv0zk/4QzOqjIk9VAySyZq27F7uQ1ZgN06nu8CC+jmrwwXczlRkhflIyZ/Yilf7ao0J6y6xRp91ypPdm67ygEeCzfSZU2ez8QwbkMczYOX1AjNfDp824mf/Nc54i/I2APX6Dzai6ABo2WgELLU8vWoaDmu96kUinlbJzwh8jN9/aRy6X4FH6qddtCWMCkZgFHeWOHIWIo9btNuDw3SnBiUaeLwIqFVpDKCDlUHpec9dx6mGV4RjKCxCDfD+DDuZUnuDa1cxX3BUzILZKyfX50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx/tRr2cZjpxDiRsIkBiZU3Kksl8z8zDM58LUt+iQgg=;
 b=Tk5hqfNsiLldNnkB7CO0/lvJ35JH2R1mrOwOmJWmPpMpcbAUAq0l8z+GjES/eDbVqXESDxCV0AJ8I3Jaep9ije49yrdSRHeQGokHYHRzyi+OQ6bZw4kjBlvCowmasXrSN9VGGsTMkmkajsHD3MZPCUfmsAi/mkz/sD26/jufaqdszDpbwjrXXlb8Amp4L2Xmiki8Tg4GaoYTzfuWrv+eeJ6DgGNw/n6m/t0AIKFtRAj1LNTBRRpmImZXmIu5o/+e0wGuoSuTLMI4q6DGGVLemnSUdsodbDQxzoVbdbjR1RFc0yBIyGLN9k+ePdVQHiG79oMPGY8gpMZP+lwiSBGalg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx/tRr2cZjpxDiRsIkBiZU3Kksl8z8zDM58LUt+iQgg=;
 b=A4vync2cm/KeK/sJw5zyakYxbY+z5a69DgdiOs5/KQtwuz5ISz8WJORCdSL9BoeoRzga1swlkgydJZyFgp5cHbUfB1ZaeFqmfqrR6M/tODENH+s0sYZXivoQpL/MpTgaHp6s1t0rREa8qkHBjbm9bgrQ3KYD/z3m0iaxvJzZVlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8241.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 09:54:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 09:54:19 +0000
Message-ID: <91e95c22f0683203de8ca6b4233d77a0b133c4d9.camel@oss.nxp.com>
Subject: Re: [PATCH v2 4/4] drm: lcdif: Add support for YUV planes
From: Liu Ying <victor.liu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 29 Sep 2022 17:53:37 +0800
In-Reply-To: <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0210.apcprd06.prod.outlook.com
 (2603:1096:4:68::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e56843a-977b-4dac-c47a-08daa20093f2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XyHwIQAnZoO9ATb93Wwr82Juawo57H4zIyrXdsP379bB3ZtJ2/bYlbUEDW+SDjSviymvKQ8+EDcOyea3n8+VbUJJW2MAZ8WtmDkPAtZMRsbWhpRRUUHYfnaxX/bAww8eWJSRi2IUYSIVASzPESkj1FSQ3K64axZxaa42kpBzsagUaRq6wEyrFEQxQyp395Oxk5CaxaWmcOtdgVwYJDC54a86+aR630bVRiC4EwVD2vdMijoLyD16pCzwo5VFxMfB2bO/AFadt/Lurn9F6v8S7FSUsHmQkGhuR8G4bHTBwR8mqMiAXC6gwepJC/VurJX1jP50wmTA3FSwSuYYSSrgN+CVjK6hNZM8pxFt430xrT7C9y8pxXYotnV229G4aa9Jva5roWxMr48Mnn8co+9vU9rM9X2iXhicEGGn5Nen6FJ5VoqWAiuGWWoppeX5MZO3qIlLwDnachHubsFJeEk16PuFqaZkiBw6c3+7hTt4/Kd2JVJqXyOqsyBIAHRtqIUN/WV0od6GnrYuPIASxgUlqavARwdv2DPvnA+jWwZR+T1n5tHcZDRc3EzNm8oRczUnW8rgaUzuwrZA9yqwbTX0iZsasiCqsZTwVJcCNrS8Ah52trQBeJ53W2W97liNqwMaB+2ehOgZ9+pO5xzOdaj5MfkOwrKJ43bO03+bzD0But6OvhpwYuOJUZDr8qkJqvDfpwR3Z3h8m9H1OziQXvH80U/E4PUvbG7Zrx6pGaqrpUW19mZhbfMMfrNzeH34Z/Y6dWjJxbkgqaVibyWB1Ff3Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(38100700002)(2616005)(478600001)(186003)(38350700002)(5660300002)(6512007)(41300700001)(26005)(2906002)(66476007)(8936002)(4326008)(6486002)(66946007)(6666004)(52116002)(6506007)(316002)(66556008)(8676002)(54906003)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzN2bDV3KzYwQWZqKzBYbjZjQU9MOUpUdDlZVm5hamxiUEVkUmRzME9jTW9P?=
 =?utf-8?B?OEhqZzhOMERuU2RJWndqV2FqT1RtT2JlQUVqZFkxVkZBL3M1UkV4M2Fucmw4?=
 =?utf-8?B?VHFFeTRqaHBGQVY4aVk2UGJiYkQrb3pJZGxiTE5LQVlFUC9hcnVOLzlKZUNy?=
 =?utf-8?B?dU1ZYVZ2S1Y4M1lIeG1IZStqSFBIa1B1Zlprc01RR1VDYUQ3N08vRDk2MHFw?=
 =?utf-8?B?LzN4Q2p5MFdoNzI3V1VhWXgzVzZyNElsMnBYdDZ6L2RwTTJtemRPcXc5WTdS?=
 =?utf-8?B?NXMxeTFMblUrVy9BaGNQTVRGUGpMVGp1Mm12RURNYVExZFdKQzY0M1FMWFlt?=
 =?utf-8?B?TmlhQ2w2eU5FYVZtYzZ0eHN4blBPcFZNUllCOStLQ0Z3Z3MwM1RZdjBMcDdB?=
 =?utf-8?B?V3crNEovZzg3YklObXNFR1NNRUt3djlRcG91WHVPZjc0MFJCWmw5MVdqVkpw?=
 =?utf-8?B?NFg0OEJNb24zSWwyclk0SGFLQTFxWFRGRG55MFc2aS9BTTNhcDJLZkhBb3VX?=
 =?utf-8?B?bHNvWTFsc0VXK3JLRGlYZmN6ZzlIaElFd3BlNTdGbHBVbXF3N0xpWjh1TC9C?=
 =?utf-8?B?OUdraGcwYWIycDBKSTZJbkd0VXVEeE8rUElhUjhJd0JiWlVKSmdPWGFWTmVh?=
 =?utf-8?B?ZXlZb3lqR3JnOW8vWUdYbzRYVDg3T3dxTEhVdGsvdW5XeUluTTQ2Q3doV2dV?=
 =?utf-8?B?SkJpYzZWa1k2bHIzWkZLcXZPZFJoR0RCbHQvNnJySDR2S1VtYm1xdjNHRy93?=
 =?utf-8?B?eW5oeXNOcEUyN1UyRUpYL3QvZ0JVN0toUEovV0ROKzFnSlJJWVVjeUVxZ0NO?=
 =?utf-8?B?djVBNHQrNk96TWswSml3QWMvaVRnR3U4SjMrdm1Sd2MxVEtwZXMzaXVyRU1t?=
 =?utf-8?B?TWVoa1E4NytONzhqdFZoWllHRUVSbU85Qm40RkF2Vlc2OTFuT0tvWlgwMFkr?=
 =?utf-8?B?eDhjRzhFTW00T2RtWDNrSGorcm4rUi94eloyd011L2JPUi96emxIdUhOR0dS?=
 =?utf-8?B?MGlPVW5ub0JQM1pZd1dybUM2S3hKdXF2RCtvNUJ6ZUl0RnFCU0UxSUkwOHpM?=
 =?utf-8?B?Y1Q1eDBWelFpMmVGVFBQR3JlMjlGQ2czVnJYcGlCQk90NS9sZklkbEVRYWRN?=
 =?utf-8?B?dDBCWnlUMlFlU3p4TnhwMEpTcXg4Y01EUFF4L0hMVCtlNWFHbUFZYUoxUHBT?=
 =?utf-8?B?akpIMDFFK2dUKzlTRlRPRjhucnJtMHk4Y3o4UUxvSlkxWHc5OGJBZjlmc2Q2?=
 =?utf-8?B?RXhpeEVwdDRodlZZdTZkY3pjaUJKWk02eUlZaUJTZWVOM0xDSDcxc2tPaWdh?=
 =?utf-8?B?WlRmcXlESTE5aFViTjlyV0Z0MDhhMG9OUHhWalhtWXZuRk9FZm8vUE9XUEdJ?=
 =?utf-8?B?cEJoUkZoSzh6VnEvMmdTTU96RVVyOGYxSyttanVLUTZSRVhXSXl3T0Q5Y2Jl?=
 =?utf-8?B?Q0hMRThQQ21oL1VFblU5T29CVUdwbXE0OGxHaklxU0VGTGIrajlWc0ZnQ2lp?=
 =?utf-8?B?UEtNUTVEMlVzZlhHaTBUM1hPZlo0NGxONDNTd2NpeGl5YW9kT3pVZ01TT09o?=
 =?utf-8?B?VEZ1cDhYVUsrZ1NtQzg2ZWhnRXdFZUFuOG9WdEdnNGRPdDVWUUdPemlIRklz?=
 =?utf-8?B?Ris0T1VZMUpHdGVkRXRMVXhGSU9qWmNIcDcraHR5dHRYQ2M1NFEya21HWUlY?=
 =?utf-8?B?V2JESjhjL2tJQ2Myd3AwSE5vdFEyMGFwMDRlZzY5NWVTNVAxOUhSbkllbG5C?=
 =?utf-8?B?ZkR4QVErMjhCd1FMc2JuOHcwOEVhbDVjZ3NuMUpRbFFLUk9OTFNEY2p1anZR?=
 =?utf-8?B?QVowOXluVjRKYzBmM1ZzWkx2Y1JRemt4UzJaSHRhZWVZUHdkOHljZjdBT1VJ?=
 =?utf-8?B?TkE0aG1LMllOamYzRGM0SUlUWkIxR2gxeGMzS3ZaeU5QRGFZRnB6S09PVk1X?=
 =?utf-8?B?STZOUWJHU0xhUUM5R25QRGhhSTlveWlaRGhvc0hHL2dCWU9JRVR0SU1TNnFn?=
 =?utf-8?B?TURZbXZHM0JIR2hqVFZhQ2JYd3l4R2JEem5EQno1enF6UzhueC9kUnkxU0FY?=
 =?utf-8?B?VDFOZ0J0OUY2V2tjb1NLdFhOaGc0b2dJem9FcXpPV05tTjYvSTc2TlJHMXRi?=
 =?utf-8?Q?riLDf9gXECd+ndmTf5ABB0QxZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e56843a-977b-4dac-c47a-08daa20093f2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:54:19.7066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhGcvaOAm/8JKMVE2C0pTFO7/I27CMyo7FPb17BE1pBu7QgLCLNqFlCx0N4NUzEGadoIzLceNx99k1mUSTymUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8241
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-09-28 at 03:58 +0300, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> The LCDIF includes a color space converter that supports YUV input. Use
> it to support YUV planes, either through the converter if the output
> format is RGB, or in conversion bypass mode otherwise.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Support all YCbCr encodings and quantization ranges
> - Drop incorrect comment
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 183 +++++++++++++++++++++++++----
>  drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
>  2 files changed, 164 insertions(+), 24 deletions(-)

I have a chance to test this series and find that my
'koe,tx26d202vm0bwa' 1920x1200 LVDS panel connected with i.MX8mp EVK
can only show the test pattern at the top half of the display with YUV
fb. Looks like something with wrong stride. XR24 fb is ok, but RG16 fb
has similar issue. Anything I missed?

The command I'm using to test YUV fb:
modetest -M imx-lcdif -P 31@35:1920x1200@YUYV 

Liu Ying

