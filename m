Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F39544CE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 10:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C1C10E5E7;
	Fri, 16 Aug 2024 08:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YpCw2J11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964E010E5E7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 08:49:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFmqsJhnAy8MXjP2PQp7CiUrOpY9zehEE5cof79bVh4eQh2RcQb4ncLKmPlO+q/MPalunLZuciX+5zll0H/j0CLM15xqYe3eoZflRovtiz+YpX/7SCuvPyNSdGbjXduIlCLlYBxxPbQSePq/p+7VlFLYC90mgdy773qo65rrfcs+AddmGyH8yEfpKTqh4EdiT/0NRgiqRQ9PoQGSaHEoi5obNbNjWfT4UFLXqcjBbH80q8A5/8BwlXrOWQOOgZtcH7Y+m9q9JZm/J0aAeTxObS9eYnTaGKei5y0WWniy9UTc2IpHwciYzxfOzauEhxtK1aoF1+zFOP+HDmfYdmfmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SQV1c9588W7PHFM/t/MKFaqmjhMGuVfZjCOnKIEpZE=;
 b=nEkS0ZN69GVEyRZNc7rZOl9DEINMf6uaveEp+lxZ1gb7Z3WbfuKO/uI01p8LS2Xgo44MVPL56tuaQAJ6mPRFGIvW8nlXOLCq0iXThRTkPXaN/iFeCFaaDPFm+SqC863Go2J69dS9b+BtdKQUDcAkbZzFByWK0t44sLgwR0tWHKgyVKhcpFycG0PRDFxmI29UUjQzPweNiQyJhrF8kUwTP+K2G9Lnh0hIz/6d/WnQZ7KJTni7Gt05udHQQmT83PKbX2a+WcKkPeCn5owU9A+4L+fStnptYeILNZ3xPv7+1EVcC6hiSn+Ykt5aizks1TxJxi1fzlfIvwi50sCmBQFAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SQV1c9588W7PHFM/t/MKFaqmjhMGuVfZjCOnKIEpZE=;
 b=YpCw2J11px8PBcmgsSOSefAu7fY8aY1vlZ/ZBSIGYBRbFnAY4pnVBmjmvHE+f5mjvxsCOZg30LTExaYyhGKr9SM8HZsc7hB1JdNImMGGu9if7etCQJXa9bZLe73M0UuYYU//Jiz2hT4AE8bECoXr+civv6JpiE649XDCsxN7EgpJHOzR0EIF1Df03Tc/73qxWhEAVEBBUFkLK9wcxif/ZKw2EK4/kZZOxe1spjwc9etO2Q0c85ejjCITv8aYjrzEsnWSkH5apLe9EgSPsTMCWZUQtfRYcoeZwwv/FLjEJB2zUf3H1//Xx/v8iAMj7iLfvZaH1eM8ap6bUfxi7m2MLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8571.eurprd04.prod.outlook.com (2603:10a6:20b:436::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 08:49:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 08:49:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Subject: [PATCH 0/2] drm/panel: simple: Add ON Tat Industrial Company
 KD50G21-40NT-A1 panel
Date: Fri, 16 Aug 2024 16:50:02 +0800
Message-Id: <20240816085004.491494-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: db10f2d0-070b-4234-8ef2-08dcbdd0654a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DsA4EEg1o7j0F5ESCujO2XXq2xgMFNE+E5Iktdzp/9PUloQP24c1z7iHKlI2?=
 =?us-ascii?Q?9atunhQkpHstrVUtqqQm5qOF9psnTAPKJCCzmRQQ6vRnsEX5Kzxohf0hxuBZ?=
 =?us-ascii?Q?Ag+TsGEgDEgU/Um6dbML7aifUC5VpfAEVTOdIU25akAUYyhCl9FLyBbjJIWE?=
 =?us-ascii?Q?L6TVZh7zckktzFIA2E4SrwNr+lHahj9oqaOq6anwMo6M18QubbCRVIM0IuQg?=
 =?us-ascii?Q?bQUVCiGDJIS0RPGm6jDE9J2DqJUAFNImsYeGxFJux1+G2BF70xN60NDlyH0z?=
 =?us-ascii?Q?+ZTEqC+1M8s5Z8vx5FCahVN0Cii+pHVpBG8kniFGpJ8aqi68JJ9dwD/ytLdw?=
 =?us-ascii?Q?AWyr0CJhk6dnjXaIxy6iV5Rz6WnKg9aC7TtX7nGeNqH0LuVyy7cGbPTwvxCj?=
 =?us-ascii?Q?mB/GavT1vB3KKnuh87Bv9INdvMBXULRbHykS+sgvdPsI8e9npBDSl/XZcAUS?=
 =?us-ascii?Q?7s73TzTq91HdyGX8YPgDIuihK3F2u9gBMk8+sSnH6VW/AWxwTbE7RkrFz2AW?=
 =?us-ascii?Q?PZt2hKoblG9rfNhwYlNn4KESa+7vwwzuG2jwaastx0PSd/l8grNsGO8R5u9Y?=
 =?us-ascii?Q?NHS4JuG/W27GOxNWliIjlh31n90KAssasbp9XYbm61zI5MsqeVoxkb11bhYS?=
 =?us-ascii?Q?tcLBbXUWuESyPdVoiwEvfMqhUdOlEkxMKas6ozEcPPfdo/uXt42JOYeqpNTf?=
 =?us-ascii?Q?gg7cBtOh4V5R/fhNgjTS3SQwk9TEP2UKqn0fWUK+LDrCWb9mEzUDx3JX87bH?=
 =?us-ascii?Q?2h1iH4jMdaXEq0iJ4oNIL9ZyEdG6Xi/xkQnjbGTDnw5iR0VLtT02x9xvkh6l?=
 =?us-ascii?Q?SrPbAvrjH0kzhsfAPv80daAua2khDjjNImCvmHkubwY9CTnMPXasOvMJ/ecA?=
 =?us-ascii?Q?tQN7j4SS6V7H9mTGbT/41g6016Z2Wf6kDA2JTTIS0JrMHcfd5yOMkw+xHHOi?=
 =?us-ascii?Q?+EUdndFeevce5wvBK5kkKISojpURmEPaxbUfn29SiHkcr5XLP5ukZGnzqUM6?=
 =?us-ascii?Q?g0iKr8aQa8+KlHQzplp7XP2eE4aCGNnwZ1zZw+UOj5PPxc67i2DllMhhptR+?=
 =?us-ascii?Q?XteqyHFu1Iu74x41Z63vDixQ/JECmn3mYAT31DWdIgnhYUdHy5UO6IZ6N4vJ?=
 =?us-ascii?Q?1E2Y+ThdD5251Pgfywgec3v0KBpCkaWKWxpKz+8SWz5oztoAyrV3kNaDR8Oj?=
 =?us-ascii?Q?KqwJir0L6lC/75k3qrX1OSKqwwnM5+sT7KswrySoyJ+ZTdEbaPRAnUc3QTe5?=
 =?us-ascii?Q?hyBkkJdjLYoFFHD+KIrUwYBHtDgwhDHjv5I4JWq9UwVRenJnKBFjv899CtM5?=
 =?us-ascii?Q?thukkI56cRR9V9hyPJxfi5YODii40OIp6NCGP2BXMvMAlYlhSr8iwbhbxHUn?=
 =?us-ascii?Q?cCAYjFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eC2IvRWzmmufGAmQGN2qFmwUsip1SkXTCLVA9OvLJDZdVNY5qKSkn42EMYCy?=
 =?us-ascii?Q?RwAoVjagM+UszgXnDmyKdYEvUtIEjMSPRVxDiUtEDO4BAzc1RuiVf93fWStn?=
 =?us-ascii?Q?Fwc+DQhTBjSgNbHhpEsiDkPEOCqEM42AJTMhHyEMuDBVjlKMEouHXhZqxxZD?=
 =?us-ascii?Q?SSXgrehXY0LQ97NxZC1psOnYmRt4UQBFhVwkWJZh2jbT/g98pmiheCmSMTdl?=
 =?us-ascii?Q?rzdiaac8+j+xF32KZiVU01Ay0paB/1S6P7iCeiF9NIDFNPO3grA7208wkTlr?=
 =?us-ascii?Q?5vAUTqLeXsSWWSAzmfMehZGdTC/789mES8NZ18XpL6cpCMFDci9GZ2R9cgfl?=
 =?us-ascii?Q?GM3wzpto7kKrz/Ek+FafJxkuxqs8Mo1HUpXbp1ZM7DEbfOSGR/4doM8wNeLv?=
 =?us-ascii?Q?8gRXlGL+rCy40lzN2NYbUnXuu6ICOjscHkhTKmSQSEOzXu9Upip0l39AUnTV?=
 =?us-ascii?Q?kSE3opIZKnwWjx59hHSeb+6IM4Rqw8pN4iuqJR/7MPGizkRriAOH2UGsiDpj?=
 =?us-ascii?Q?vls/pnYVSlwIdcjyb/CLF0kAtamPMi1Z8RbuHSgRKLnm5aKkV2WADWUAdrV3?=
 =?us-ascii?Q?ffGHkZIbf541xCKJa4ZBBMh6gtxcpcrisUqrunsWUkKTlOT10VzsBLtuUkLc?=
 =?us-ascii?Q?A6Smh6ygc/hKHulfAgrDyIg7YTu0JHy1+Jsil0w+pM0UveNdYs5Bh0DTYhzI?=
 =?us-ascii?Q?586P50K6ypbCn982BFTCdbjmZbctPpVaKoEWlunnAXedDLrTevxDB2fyCidC?=
 =?us-ascii?Q?9lC0sHfEGx3f5w3GKDSJa047Z6v9Bx8FfBDkezXVWW0WTE+8F1fR5qleg7pu?=
 =?us-ascii?Q?GKPKndU0rmjZE/lWcl4aJ4ck4Y9tttzeKkr1z1uMcTzh0JzA0r3T1YM9kc8J?=
 =?us-ascii?Q?XewRH8028mWEfmYokatwEKvd3HxpJHYPSApWH0OxTmuaqPdfhVpDczAq90GA?=
 =?us-ascii?Q?Le18IGGjW0Pn49+Up7Pb/aD7iPqR69+DdfLudnFqH311CNeX9Ym9MlrajuK/?=
 =?us-ascii?Q?OaGk0pyRSdjEsHujLnmV2Q/wgushi0iEM/ALIBaRTbh/qGx2LFv8Z29x5cJU?=
 =?us-ascii?Q?Q0w4riRjwr99C+ceYuZxbir6PxJJxSMgi+/HHgirfJxwjFiVUkPpFUPb46no?=
 =?us-ascii?Q?P21bqThth7/M1E0j6oGkoH2ZznhWYfWAuJKPZx1JxrG4oHEsBzXPMDLBjpar?=
 =?us-ascii?Q?thhtq9YoJ2ID1iisiXiCne0YLCCSyZ2YhUJE5r0wx2f6vnp2EkRX8oImGLgN?=
 =?us-ascii?Q?ijsAmV6OCWxDLzTwRVfglpIR/jYZ2yE3i5+xejFa9jusat/tazMH52KRhkyq?=
 =?us-ascii?Q?lKEu9WJKkmrelWEXH15Kl8vJnG9M9gMLjq6FR0ZoUMpnXDYo9nA4+GKBuyLX?=
 =?us-ascii?Q?FuVMAzNa9uj6g/kL7NCKYXIeCkoBUTrS7d4PweLVNWztVQyuDYQGqUiPkoOx?=
 =?us-ascii?Q?ta5gi51bByqOGsyRHB/kTySZaMQUtGEpHoEyBz78CaWPRM6+IX7yWD8RqPWZ?=
 =?us-ascii?Q?/ZNGIfmJctScI19O8ztcBiQ0ANkZQXr/wVxHyHOKOdeCc332/JiVIU7ngHPS?=
 =?us-ascii?Q?DsaHYIzyhfc2O704gWMq2GOyxdEPFO5HCfudLgdL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db10f2d0-070b-4234-8ef2-08dcbdd0654a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 08:49:53.3267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2ILn3nVIlTjIG3fwk42YLgfr1LaVLR1MAqekeZWFNEq24kd9vk5ldImEwangXzZrjX8T+gya93frJowavBPlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8571
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

Hi,

This patch series aims at adding ON Tat Industrial Company KD50G21-40NT-A1
5" WVGA LCD panel support.  The panel has a DPI interface.

The LCD module specification can be found at:
https://cdn-shop.adafruit.com/datasheets/KD50G21-40NT-A1.pdf

Liu Ying (2):
  dt-bindings: display: panel-simple: Add On Tat Industrial Company
    KD50G21-40NT-A1
  drm/panel: simple: Add ON Tat Industrial Company KD50G21-40NT-A1 panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.34.1

