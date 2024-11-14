Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903359C8DA3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D8E10E7EF;
	Thu, 14 Nov 2024 15:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazon11021105.outbound.protection.outlook.com [40.107.57.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7E710E7EF;
 Thu, 14 Nov 2024 15:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lln+kxwxCsfPdZVp5lBPafiicxDwnWpLh7Z5gPiUPwYrk19XVa5cJKzkSdnVKTArRX8E4wP1qe7tkssxpv+S2iF59ezPWyPjiU/KYTMr2FuE9nGOJNwee/biX6RRr/38Qb4VMP5JlWVRjPwOp/g/R7lCZuV7nzz1/P1bz1H4dRx4tF5iQjoiDqLpv/2NNpYCUvhOsCGtPhlKi9oWk7MEf3iKGTXapgNUxC4iEOoCoBsYSxg0qvbgW0bEuSbqY4lSMq/YMZ/1sy7p57dXjSd98HW7PEOlPT8l7pHZZ4ItcadkEotaYKU4gkx3lROJYlGgpxx1WIWfDWXVOlqfF3KnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/5zT8L+ga1akjzZrV8IFK3FVU6pNNmkMGwm2cpRQWQ=;
 b=PKFutCJl06JhmzvekL37uPy2GzQkmPOPxj97w3zmb4SAsC0W4MoLWyIe9nEz+x+/Frgp5w+OoZ+FC6Pp/IfF495I3Dftyed5ORha21vUarYRe6HA5c6ZrYNcuFzJVp28AKM+tnCW4YuqD9NEo8ykxazgLYba5ucFJVoezQNmR45EQarxmyuOIlPp3syb4MInP+6iKiJvaW6i0yYv2C5BLvvXirlpBriZuwoHRdLRysSvKQX2YPesr1GoZPjEQlmE9JA0bbGf7TIpip+D+jdKISCBTFWlA05mivjlzggzqPzVwnoVoC+yipZEUEnAggiw2EnV65fe2MMnL3LipW1q1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::5)
 by MAZP287MB0541.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 15:12:26 +0000
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::c75a:632:1645:5db]) by PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::c75a:632:1645:5db%4]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 15:12:26 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To: alexander.deucher@amd.com,
	alex.hung@amd.com
Cc: Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Leo Ma <hanghong.ma@amd.com>,
 Roman Li <roman.li@amd.com>, Ilya Bakoulin <ilya.bakoulin@amd.com>,
 Jose Fernandez <josef@netflix.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Remove redundant check
Date: Thu, 14 Nov 2024 20:41:10 +0530
Message-ID: <20241114151150.19576-1-bhavin.sharma@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::10) To PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1a1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1171:EE_|MAZP287MB0541:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a32371-c10d-4115-2597-08dd04bebf73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BliELXlER5zjlvTM2Lki246OiPYtcL0sGrNvmFKoI+dL7Alfzyy1DKgx3q+i?=
 =?us-ascii?Q?TmyAXFZFFlYQ0V1IT55IiQVHTvCyxaUw4qV4qbNxACaEfzxidF15z36icRoh?=
 =?us-ascii?Q?t10YEu5lMnVpTbP5KyYvjAl5D+aAzwvpvureWa/31shMr8DVZrpa6Qa5jRIR?=
 =?us-ascii?Q?x4TDumxY5tFtJabiTW04izpY+BQHxs8LFNJOb51apCfPsXtqS9TClOLiKAm8?=
 =?us-ascii?Q?S+cl2/b49UV5cqmFyWH+rIq3bsQmDSeEn82OtMMpOcM6wEZaVubpGnnDS+/8?=
 =?us-ascii?Q?Upo5oadUZT6fNjm/qVg6aexCAbO3zbUMFs809ZyKviRIwwzARf4uTeovrS6J?=
 =?us-ascii?Q?Y5ctxMDff+NHELucwM75QRe48iSAHl1RKUty4XBUXlLkvriw+KR11VYn7Oer?=
 =?us-ascii?Q?ANXWmw1+kgXTmWbO/AuH9lgGYOic4XOPrUjbaxRa5nyl3rNtYJPm/7GetLgC?=
 =?us-ascii?Q?Rb5ebnJLYu9FQzfe+VMX3rIrhZytsqm7nBckwGP082/oMNCAVcK41f+wi5yL?=
 =?us-ascii?Q?XbWsUG9B4QVuSqMBaSSgtap5GSVvq9Jo0rbzVKKqcHZ7bzYMs+NlNtvzhDIo?=
 =?us-ascii?Q?vP7qgcKfSP3sS3Z/rejsB1C2W1n+H6FlrgfmlTuYt8Ihoaay6Ef5+eBgQbPT?=
 =?us-ascii?Q?bg38j5zoeGxmyOQuJaIisIrotjgo2990iae3/dCzCeUJMf5WIujCdcoVl1QR?=
 =?us-ascii?Q?AlyBc13MXMs+NzS4wSdo7aplG8A/o6V0ZmGws/udsC5Yu6Cgk6Hwmsj+duP+?=
 =?us-ascii?Q?0qRbT5up9YJqU+h8oKUyoBoD9FO/eDClukH7AhfQUdrLHuh6DKgQzo/5YWLH?=
 =?us-ascii?Q?DAV6Qa6ZDh0zMbFtKMb2RIEAj/D3wuxZ21oWQ+uy7v/Jlhn9+mRmJdvKSpSu?=
 =?us-ascii?Q?muzp8ya+LFLGbE7D5qTW/EKNkL6RxCHSlscycvFGskeWut6DdXkFOSeqfeke?=
 =?us-ascii?Q?rOiTbO8JCS+v/rkJUZkDwWs/DjKZK3Nv/g2PPl6Z+SELmQ4azlj3sBM2A6pD?=
 =?us-ascii?Q?IztfrZMXmnCYFTRIbVpDpOy0pXwyclsy+w5cXm2AbVt1b60biBRzirwpZRK1?=
 =?us-ascii?Q?pRx7BFWAVPRs/BoDb9erSKymBJ2O4SIFYNJcYtWL+ckQsbTf+OGhXu+gAxsS?=
 =?us-ascii?Q?qdqKZLEoHa73B+q/Hl93UKwuKFX5LDeTz5PeYesvPftq4+W52rLb6gzF7QNM?=
 =?us-ascii?Q?DsffrY6fUQipeV1ylL8A/0MgiqmHM8IwFce1HmMuJlxWm82jTMPkkbWIFmNx?=
 =?us-ascii?Q?FTJXHs/QUJqoZrGRvZekpw4BoTeQLEIX+y8g8RPpIrHYBuTjukUZPB+RTMg4?=
 =?us-ascii?Q?/WfCNQuOFmEIGmFbO+T9VHEp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1171.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8KYJsD/frVgynyPvisI1MQN469qLr2txxX17f8qQWLv5FB6gtoB2ET7cW339?=
 =?us-ascii?Q?tQ6VR9sefFwQYzs8gxAPH+ZI8/KR0IR3uTR9dLrTu+LZdX0sERli8v5aYC4g?=
 =?us-ascii?Q?2l7P/xk6+txOOtZfcAwnMKo0bFbwMWxBjJj0BKTkobbTHDpdrBDr2U4cdtRy?=
 =?us-ascii?Q?T7G95HcZekv4HN8m7/7ryBQGCodK1upl8SYpG3OlDAsfUP+bdpbibWLTDsLT?=
 =?us-ascii?Q?3ipEB2XLZopwX27zdY3oCsxkB7gAtTBjSJCGnkrKx2ucXYZd8aMlUZm2xcLZ?=
 =?us-ascii?Q?eYv1JNHJtH2J9fxlS6phdPtOLtAwz2X+YMNc615tZ7Cax3NquK5qePJVJmYH?=
 =?us-ascii?Q?CXRpNqlTJMgaRc3cKWQGGzguDnRPjJ+VA8jEG1IA9sZgjdvju4IXMXRp4AaO?=
 =?us-ascii?Q?YOaifEags1jH5DQw1jM+JTQXP5ZWz44wIuzPCu61Wz3VaWgK8UPSWmGM1/He?=
 =?us-ascii?Q?Efk8eLNyVwQqAjWyNXcrhPPskyAAb3XM2m9KLH8YNFkgvDsAx0JBg4GMpIhX?=
 =?us-ascii?Q?leZnNY7EvH9vGh1ip2KaxzuhfEx9nremWu6Pq5CZu5Xl+9CRDIrFhy8ULA+N?=
 =?us-ascii?Q?h7NGjkCG52QRAGzb3tbvDPL791ZolsLQeaKBPhIwdSWgVpNBWiE1eVy9CY2a?=
 =?us-ascii?Q?GSg3nwzk3F3PQYIpCkiFBHrrw8WEdY/evgokYINOvBJzUrRvE4hadWIIP3jo?=
 =?us-ascii?Q?xzs+syiwW25BlgJhbfBPnBr2pjo4RLQ9FhJ4TxSzfWU6RIxh3gczVcno85uU?=
 =?us-ascii?Q?oLnQyzcM1Ul79BubyoTwN0+Pdp8B3tdhaRWAEC5SdICWlpUdziRwziOjWi+J?=
 =?us-ascii?Q?pAljefSPWVsQTGvbGVT4T8S5xEvmK+6TWGAZBjvQ0qC958n3uCOXzaiSUt+Z?=
 =?us-ascii?Q?nkmWNM/nTt35Wxxn32iZkNNaLKJS/+qlq9Bj9TpNWujpEpYn1zDBUSjjkgtp?=
 =?us-ascii?Q?Qlk20CsIE7wANUSLasF9LOmnKPrt9a8Wlp6EObqIwPk+Ajesd74lZU6CLW5M?=
 =?us-ascii?Q?TlUR5mQFPGsEdo70jXCfaWZtbPvsms5r3SzQuAVxT+Nhvcik6S5oB89rHcuj?=
 =?us-ascii?Q?vi9v2ZslDKDvCVAafHYYEw8/a8ZsT+SIN8U+ffY+UUOzD9N/4ggj4OahDKEU?=
 =?us-ascii?Q?uNmV4YKw8RVoa5e4/SH1IBSrXxQiF8TtBIW90iqRFZhvc5WbAI3x0rnpnApD?=
 =?us-ascii?Q?WR5KKuUO1EmnGpXRJYW1eYYgReEFdcELvyyr4NW9Jhvi44ERhSK+LYEDgS5N?=
 =?us-ascii?Q?lu6mUnGldnK7CWgATKsuwaFHixn+zcjQc1FIVG6uNGJ+KB+Az3AEdFDHH2uJ?=
 =?us-ascii?Q?ZQAMH4I37+b4sFMw4MT+COR1hJVqjrRBjje5dIsAZf+f+XUFxK3RN+2cvrKN?=
 =?us-ascii?Q?9Mp0vVqKCRkqZAZO0vStCKxRuvjktO5vnT9TtFZawCfWQDK2+Dy5D5Tz5hGf?=
 =?us-ascii?Q?TNcyL+J2qViaBnr7EqW3H7A21wU3QIgpUqNii9EwwnsOfmY//Y3EY0mLocWC?=
 =?us-ascii?Q?jgq7YvNb7k3Tpe+5utUU6V/LcH7LKT8qyjEkiCf7CqOIJisv66T7OJuDHPdY?=
 =?us-ascii?Q?krUQz64gHjbhmprlChuuJSJE0F4MGgsfeAE50aHcZB0bvL/t9YBed3vkx+5y?=
 =?us-ascii?Q?m3/qPovriI0SKsWKveGfVAQ=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a32371-c10d-4115-2597-08dd04bebf73
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 15:12:26.0397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCVc6XI2FUMg2BMqlQEX2AEOqnKdJM7gxyk1AH9asqNwCKRmDV/T8ok2jnHh17eeFPOoE+BR9ROQbT2Ad5znzh53hZ4eZPPbYS7qpXmiJrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0541
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

Change in V2:

in patch 1/2:
	- Remove mode_422 condition check because that
	  is fixed in amd-staging-drm-next

Link for v1: https://lore.kernel.org/dri-devel/20241111120900.63869-1-bhavin.sharma@siliconsignals.io/T/#t

Bhavin Sharma (2):
  drm/amd/display: remove redundant is_dsc_possible check
  drm/amd/pm: remove redundant tools_size check

 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   | 13 ++++------
 .../amd/pm/powerplay/smumgr/vega12_smumgr.c   | 24 +++++++++----------
 2 files changed, 16 insertions(+), 21 deletions(-)

-- 
2.43.0

