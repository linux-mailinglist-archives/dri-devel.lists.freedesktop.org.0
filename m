Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41D5EEFDC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 10:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0540710EA06;
	Thu, 29 Sep 2022 08:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118AA10E9E9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 08:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6Ux+SNyj5wwOdd1e6e1JEcZgC/QXytAN9Qg7oO6bLrajsv5cj6m3gF/540y2ewbW9MmiCyxNPVqmyrkhcvVdixSDyEd+Xn+mnPZmf7IXuJ8QrdQIPP4iAQmSrlTMGyDzSU32jeFzWLDw5hwztya3/mEaFQYiMlc1/c3roQxe7lwg7OPqCB3k+66x5HNTAPtXBTxKK308AHfwwx+PC6cc2NkybLdjdYrAeq74FQz19RhJK4ZGtNf6XSfNau+tgAFZaAn154mC1WODz23DC28ogiXpR8nxTzJs7WxrQ24Ff/F/D4OuH7bdwQTcmaXzDPksVNxlujPcWX/ZWmnwP/7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiPOVOh1Ot8rTBmN/CLy5H9bhQKL6BZyUYD35yNdcXs=;
 b=UfTApe2mJirFZNBs/5ITwdoNRw92cOcj0WeeUvc04hTagzXAKV1AhJ110XkW60gKI4umCHhkYlK0SgwoyFBqu7yVKyLqEdibcHaPipy4fOzU4off8MoS946nWi79iokfvKQbt87Ky0JYWFeau8NjrFa4EAWbPyYddlqHKBzXDk6fAPyJuTQ4ow1jBo61jUu9osSNWDvdIKltmAN9fgLzPkB2A5ty6XRvkDlCCWYq7jS41WJBfGARq1onHbAMEmhxnmexZQzAmjZLtIWYAS/4Yo3tvemlHsLVT3o4c0SbqEBNSs1qtIrAAuDLpV+H+jvIf08IjNCCy2VqjFC5HHZWGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiPOVOh1Ot8rTBmN/CLy5H9bhQKL6BZyUYD35yNdcXs=;
 b=YllI8I836K7oVwr/Cunwy24lAiLXqqctkX31eXgkifk0GCYrdRjujjnUvoYEaawEnCWd0SreHiPCwnlLZM7VwHp0BfX96BCslGGk0LRWEF+3GyGC5oOQyE//HE5q75BKlgG9nVhMhvosjpSayYAPxAdja1jnscSuundSWc0uutA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6937.eurprd04.prod.outlook.com (2603:10a6:10:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 29 Sep
 2022 08:00:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 08:00:28 +0000
Message-ID: <58224bd64ad5683549430c87018f1f815d778470.camel@oss.nxp.com>
Subject: Re: [PATCH v2 2/4] drm: lcdif: Don't use BIT() for multi-bit
 register fields
From: Liu Ying <victor.liu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 29 Sep 2022 15:59:44 +0800
In-Reply-To: <20220928005812.21060-3-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d6f1de9-cd91-433a-8763-08daa1f0ac19
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRVyj2MrUvFzRBtdKPoXdrW6w04AGYvBZhpWFHZjB25+x5MJtTdCWcztoMdPh2NgzvCAW7TjZ4mmrv4DsN7Wjzi/auPEy+wJoFjLQ1b9Sq2aKz6+uUSGF+uK2d2HoEDnU1WiwWVc7of9G36/iHjWmbqEmTyOTJLbrV5ge6cXiBGfZhi097A5OT8cOGkrUtlqyj252ttUEAJm096WL+tg2UseQIDa3JgU+Q9Nn0m9EmtwvY+HIDbJCBdJWqmCjkCm1nbCtX0TiUHDPf8e2m8e/nl4ESc5xrnq0zWmpogft3TjMPzMwDtwKqBLHUTtIkbFVhyU2b9I5XsA7ati7UKQeZCBeZ072CuZ8mjxRxzVFVr35BHnRWuP9WELUZ5LxvGc28a2RUE5iKJV2eiYFB3b1CRyLFRIVNvX1Yh2CIVLsNKXsIOgJdE7D/ngitB2Rw97bOQzYaRWCAbMcJFFtRD9asXYiZ9LLmBII7uvb9h6xZbs/h0wcPwnxzwGRnDzKrWTgDi2FrwR1iVqo57jLqh8eRhU1Wjq0Qd3q0HQ67b3K9Y/jOdli/vquCAQwfvkgtRoHIMIekRQDlH8yIlzGLxG9rIk1FR4ZZEaavOP1Kd+lstLw/8RhQopRN+gzRy8H3FYCA/W54eZScghW0DzhLK1ONW78ZZJl76Qk3jb768qu6KSpq1vxdPkHraSD7kBCORytFFmErQNibvcI+59/0k15NoCSo740+xg7FMXLz5RKJ8q2lCLk4hK//1f+2b25iIFdP6RXU2KxkzNVRbSvsBX4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(186003)(8676002)(478600001)(83380400001)(2616005)(66476007)(54906003)(6512007)(26005)(8936002)(38100700002)(86362001)(4326008)(66556008)(38350700002)(5660300002)(2906002)(316002)(6666004)(6506007)(4744005)(52116002)(66946007)(6486002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzBQOGVUQjMxSE14bldVMFhIVFN4QS9pckxvaksvUFhPaE5UTU5vdnJiOUJu?=
 =?utf-8?B?aUNmM2dZSmxlUi9tRjVPTlp1dUI5Z3hEWndxK0pGZ3FWOHNhYnJFUHVoLy9G?=
 =?utf-8?B?YzFNVlQrR0JSSGdOakZ5enJOdVZJSDFIWXZvd09YZE82YzA5N1N5YUdqKzgw?=
 =?utf-8?B?ekYza2J5QzR3K1NjR3BVWCtZRStJakduMG41MmR1WFlsUE54WWFKWkJpcFhx?=
 =?utf-8?B?YkU5RnMvOGF5QnlnMytOWlE4NE9VN2t3ODlpL1FOMERmN1hjZlR4NFBoaGpm?=
 =?utf-8?B?aTRQVFozaXNZbS9DV0VhZEJxalhUY2l3dVNSdThlUFcxUnZWMkZLbVBxWUgx?=
 =?utf-8?B?czhKcWx6OHRhbTcwdlpZQWh5UmIwV1M0M0NFbmd6S2V3ZVhiNGpFSVl2YVBq?=
 =?utf-8?B?dFdLbk9ZYTZ6b2FXdGNCeFpSaEV5dFZ3cWVDUjhSQ2Jpa3lwcFpIWFN1MHVM?=
 =?utf-8?B?b3RjZU5HSW5DMjkwWDRnYmYwVTkvOWRsb213TGtmM2ZYQWxsR21OaWY2eHd6?=
 =?utf-8?B?SEo3YzBNYWxlOTZPRUlFczc4NlBiRGxuMmRYSklGWElkT2xiMXN4MjJ4bjg0?=
 =?utf-8?B?a00ySWwzVHhLdnh1SFl3UzJvUCs3TlJHanBzTFpLczVFd1lFK0JWMDMrQm9G?=
 =?utf-8?B?bTg3emZyM1ZFRnlwa3Z4ZVhkR0krcnhEYzNUOFo3cmh6cVVNQ1YrR1NYQUhH?=
 =?utf-8?B?WlJEeVdscmM5ZnZJYXFmQTRqVTV4T0preUNBMkVSdmlHOHVGaWNyaGZhR2sw?=
 =?utf-8?B?QXZySzdweDYrRnIzSHU5b3pBY1BxcitJUGRDTmdKSFJJVlZkL25JdjFuc2Jw?=
 =?utf-8?B?TERYcklkc0lCNUw2blIvUVdrOWRRUElBRUJnMGhlL1pJU0NtMmVZM3k1VzRY?=
 =?utf-8?B?OCtwSFpBbzZUSFdwdkRzWThiVWVvL2pIOWNGRmVUdXpoWEpkTGZPcCtFUzMx?=
 =?utf-8?B?Um8rdmcxQlY3VDBDajRhTTFUVG1ZZnVSVEtLaUxwTEdPalNUaDJTTGdsR3I2?=
 =?utf-8?B?bjRoMmxFN3VFcU9PM0Fmb3gxTFZpQkRyQXFRdFplR2JleVdSQmR2RHd0ZnVE?=
 =?utf-8?B?UTRpSW4xa1pUSDFlSXNEcHUyRzFUdHBOUjJUZDNMa0xMU0hJKzNlWDR2ZzVQ?=
 =?utf-8?B?YWRhb21SSXc3VFczc25PMDdYMDdHVnYwbmxSUk84NGYwMkZKZHFnc29NQVZX?=
 =?utf-8?B?VE9TWWZZRm1YQTFQTSt3T3RpT3o1OGtmYzBQNnNZWTV6YmZvRjRSMGZBMThq?=
 =?utf-8?B?RFpBSjVoWER2SFUvZ1hhWW9FbzB4SU8wMVZrM1hVOGpEQkxNYWlnUm14TDM1?=
 =?utf-8?B?VS9qOThFN2lQMGF4U0tRd0NDS2FkM2RqdUh2REUwemV5ZzMxaDRFSUpYOW1R?=
 =?utf-8?B?cEFnekI4dVVMZFZOK3lpMVpPUlNHWjJrQ1pHODVwdkdDeWpwOWs1aE9pdnAv?=
 =?utf-8?B?VkNJeWVFV0hIZlpiaW5mR3RxVThHNVRybUw1OWRvNS9hVzBNcjZGbmhwc24v?=
 =?utf-8?B?b2oxMEMzQmVLN0VMcWsxUFlIdXgwK25lTEdsZHJ2ejRTZ1VObGNIUFV2aTlO?=
 =?utf-8?B?MG04MlZxbjJXZUUzS3NONEJ3MWtLRGI1aUdZaWhiV0lBSDVBWVFIUmUwMjNG?=
 =?utf-8?B?eHlPL0crWTk5bWt2azg4dWdtNjllMnZQdVZ6RytTclE5Um9tbGl0WFBRSFll?=
 =?utf-8?B?d2dsQzc5T0ZmMDQ2UWJxc2FVVXBNWEVibFNFTlJDUTlZU3cxeE9QMWRtQ2sx?=
 =?utf-8?B?dnpnZUhmSGtNdE80TzNCT1dKTFQ5eS9nS25NMzZEVGhYOVJlckFleUlWWlkr?=
 =?utf-8?B?VFNXdmRHeGs5R3dtSkNpaFloYTlWcVhPQjdHSEpGOG1DTVhqT0VITXlibm52?=
 =?utf-8?B?MytsS2lkU2ZMQ3FPdER2UFFNcmpRRGJ5ZVgvOVhzVHBBNHNQUU84dzdaVDZI?=
 =?utf-8?B?MERlcGVpUVhLSXZmeGIxamNOVlZKNGhxbGx2U2VSYXVDd3lHTXVUNG1TeXFK?=
 =?utf-8?B?RVhObzNDTERRYjlsSE9Ec0VoMDZkSThhUkI3eW0vS3pXOTRlOUFGZi9yZjVK?=
 =?utf-8?B?bUN3T0t4eDNwUWhJaWZ1ZFh1anp3UFloR1RSbWI5UGlJYkV3UktUTTA1MVlw?=
 =?utf-8?B?Tms5cEM4SUI1MkJZY3JWbWlITE9oeEhuNUhCYXoyNDNSMnpyK2RneG1SVXlr?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6f1de9-cd91-433a-8763-08daa1f0ac19
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 08:00:28.0579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgcrpdEWZO+2IjfbM/so7EtW3hNSkoQ1Z29oPawJHE5Al1hhEq8K3dZ3JkDm0hQQcx9Y0J0oPyP0VuEkYl4huQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6937
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
> The BIT() macro is meant to represent a single bit. Don't use it for
> values of register fields that span multiple bits.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Use hex for field values
> ---
>  drivers/gpu/drm/mxsfb/lcdif_regs.h | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

One option is to use FIELD_RPEP() macro for register field values.
But I think this patch is ok without using it, so:

Reviewed-by: Liu Ying <victor.liu@nxp.com>

