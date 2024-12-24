Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3C39FBA78
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 09:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3056810E052;
	Tue, 24 Dec 2024 08:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BOzXhdA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B950910E052
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 08:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAUsH+2tfjnmChLoH5NdZsYznVxzUy0r56P10HNst/2ae0VN/hRtOk3UoWIzzDZ0QWCRV487PerkAJXG3g2fmRMRek6rQ+6aBp1w5tAFNg/fMJORkSbr3hnmrDdHdSLegUcQXmXFW+fmu72uQF0PZ+iElpkkwXY1jg4+Qu3lggtMfi6J3UfbuIRTkn7O0BaaXkF8SSTc1UEfB4LygaaB5Y3u6ZRVF1sKeFbFhVWrfathCVXdoijejvUvNJFiGlTtdBjdpnTorCrGwabSbEUWbdzwkxGhIl5f6HedaVb8kklE8iWNiN2lFOJD9u0MiFz40mJUaUmqPvnMzv/VXtTFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoG9dC108FoO7UWAgDn8mQSngCvy6FQfzu7jItRFv4A=;
 b=roWTUfSGkk0wD5r+OF3x2+i0d6GelWr+qKHTeYbrQNDjb9NTcxSI8WNxSmTepFFFdkpqw3lRDZ6TwDZNJok3mtJCT34tk9FtTDFIDLCPcDTnqhIk6+qkGqSCLe85kmyj7PR9KzobFZJNziemHjgWzJZilw1TCmrmk+gylR/CFyLhZjf2CK+TkQAUJyJ+8rHHaygMZS7EzC/Z0AzKn6tMyNT7SHXl0cwqsv7SPggAue7pvdNR7fvRzVu4tChLHD+xOhTSBdVG4zEit4gyusTB1gV7DBS5sdtiO4CdxB6i2wSDYSBH/ymYQu5+P05L5x+cnCrwqNkD50+jOEsUGJB+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoG9dC108FoO7UWAgDn8mQSngCvy6FQfzu7jItRFv4A=;
 b=BOzXhdA0Se1iSg4jYErsVFCdAnbtnBM3YHQ8JkMzfgKdL+ysX8wRwW+GIfmBseXWSBSnvUXNTXODUj7WN7J/dQ4ZNo4JqKhOKzf4f+80rC7nTjAsmcVV3bKP+FetRAR3de6qTDJsqSt9tZZXCXpHpUNs7822HOZkMd56pfmkZaW43jwTUCtnZL3Y1qSaF3x8y7hNftFz1rx8aYIOJt0RejTMwO/6KGpjPPL+w6Q8gPMW43CQOpjbQ0epJqG/Z4C91Ts+cTvgZzALec9mJMxkhGUeIylYxgTTyhwLMZmrmyKP2ex5aa8rlePR3eC/BOsiDJmDduWCJOEkVaAp8gdPJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7759.eurprd04.prod.outlook.com (2603:10a6:102:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 08:25:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 08:25:42 +0000
Message-ID: <d6c0df7a-15f3-4c21-928b-feed15ee02bc@nxp.com>
Date: Tue, 24 Dec 2024 16:26:24 +0800
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
 <b2d78f9f-014d-475b-86f1-9916ad6a3126@nxp.com>
 <CAA8EJpom94QfZm5es7i1eVpzeL0svQYDEcGzd0atbgNYCv1osA@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpom94QfZm5es7i1eVpzeL0svQYDEcGzd0atbgNYCv1osA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d50cef-85cb-443f-3d09-08dd23f48e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1VMTXNXWnpIRmJHMWxWZHUzQkM2NFc1azhwdXhmN3RpT2Z3QVZPZENYZHV2?=
 =?utf-8?B?YXFzVTNOTkpiRDJvdUxsTDlDYzZHSURaT0c4UmR6YWJRbXJsMUkxTm5uaGx2?=
 =?utf-8?B?RG8zVjA5ZFMyVnBNakNERUt4YzFDdG1sclUvd0Q1UitnUDhSaS9EWWFsZVh1?=
 =?utf-8?B?QnFVWE50QXNaRE1rS2xkaUxwRHVFMVhsMzgvQjRmNHpmS2NBVDFEbGpTUG13?=
 =?utf-8?B?VWNMZDkxVmg3amszamo5WGZoSEpaeUZuVXR5RXU0eHR1K2hRWitqUFdGOWE1?=
 =?utf-8?B?ZWlFYzN6c0R4Z1Y1VzN5TnphKy9aRktxMnozNHErb3pnWWZIYUY4ckZxSitW?=
 =?utf-8?B?QWY2Wi8vUFlQazJrMGM3WWdKbzJmMTEzWHVYU0xhWWNSc2pFcGt0cXJhUTg2?=
 =?utf-8?B?bkZoY1l2TW1ndmJqVWFJOUlURWtwbkx6SXA0U1UvdTZ1eHJXTFFTdlRsNzJS?=
 =?utf-8?B?M2ExNnpuRldkTUpPTGVWSXI5eERPeUgwa1B5RzcrK1hwU2tVMmN0Q1pvdTN0?=
 =?utf-8?B?OG5lQnZOMlhDQXUrMFgzTFlHTHRNSlFESDkrMktqeEhpcnZYMnVLMmJyaWt3?=
 =?utf-8?B?dGVKN0FHMlhsYUpJdTNTQUMxNjdFZDc0cXRKVHJkRWVDenRKdXE5TmpCNEFp?=
 =?utf-8?B?bWlyVE9QMUVTeWY5OXVjcGh2RFNzcTM5R2I2OWFzSk5hTTBRaGVLSkw3ZFJE?=
 =?utf-8?B?MXkrbmE0ZnBkb0djVjV3WWlGYWg5MUdGd3FYU25sV2FSL3dlMTVkWDFkT1o4?=
 =?utf-8?B?WkZiNnpabDZNb0dxc2RWWXZVd2ppSlpYdHNydG41T2haVjBvVTgyRXpPNHBp?=
 =?utf-8?B?ZFhXdEJXc1RyWGVUR09Mb0xlWjdjYjFqbCtZSlRZUnN4TkhiLzhmQThCWTA2?=
 =?utf-8?B?UkN3dWpxTkhiMEIvdTlLM3NWZkxVV3ZTRzlkZHRjT1FHRDNPdklBRG4xNDNR?=
 =?utf-8?B?b1RqTFJLbEZ0SFpqOG5KWlQwNFU1ZHZFd0c0My9pdnp3SlZtNnpiZjZxK2Zo?=
 =?utf-8?B?UTUrMGhKQ29EQ3F4STcrTWpZa1VoRWxrV015QXUvMjZiMU9FNCt5ek11c2Y0?=
 =?utf-8?B?QVdnblE1VnYrLzFuQVVPTUhURWJSTEVFNnI1QVlGUVZhT1JRbkl2WWt0eVdU?=
 =?utf-8?B?NWQ0d0ZPSEp5aER1L3lEb05meUp5c2xFRHRWOWlQWDdzbmk5dnlqZkp4bi9r?=
 =?utf-8?B?VzE2TXc1U1VablBBbU4xMDE3bzJHZlgrTGlERW9vN21EWGVaZnlIMy9DYWta?=
 =?utf-8?B?cTA5MWpPSitTR0xGR2VjK09iYzFqUVRReFpjYVdvZkxpamlqNGsvOTY2V3Jt?=
 =?utf-8?B?UDcvdkc0TjNWbXZROWhGbi92UkRYQUFvMWxUdUs3dDFodGh1RVBlNXdDbTlX?=
 =?utf-8?B?U2dPVFhCSjc5R1ZPdGN1NmpEYXk1YkhvWFdGemo5aHZyZ3lyUTViQm1zdm9V?=
 =?utf-8?B?U05nTDlIVUdmSWlyMmo4dVV5ZFNtRjVvclM1anh3emJVdzd1UlpZelRXclF5?=
 =?utf-8?B?L3hDd1JEOWFiTXdUYjVkTlRFTlBIQVByNk5vSFJXcUo2SG5PaDJzZlVvcGRt?=
 =?utf-8?B?MmZEMDU3cjZnRWR0Q2E4Q21CSWFzWER4VVI1VEdNR1Nick1lVzlYOGlNWXdS?=
 =?utf-8?B?c0plU3hxQjE1aERNWlBaUExlMFFDSys5cjJZbDJvNnFkQngyL3ZLKzZobUZn?=
 =?utf-8?B?SzBVa21xbW02eFRwK3R0VUlvdGlFQjNoTmNxZS9pL29vemZCVFA0WVZ3K3BI?=
 =?utf-8?B?VEFxQS9TNkxIK0hhc0szS0lUMlVMaTlBSnVUT1hWdFZZU1pGc1JmR0xGZHZI?=
 =?utf-8?B?TjJQaFZ0S0FOSHg3T01RUDdpaTJrRnA4anYwY1dHdGMvb1FsVG8wbDZ3UWdM?=
 =?utf-8?Q?LyOnCi2s4oecF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2t0SXN4RE9RNU9CT3ZUN3lFN1hiZEFXbkRhaGpNRHpTNXA5U2pMU1ZZWmpZ?=
 =?utf-8?B?TlAvUkhuUGZ3NDI5UGh0L0t0ZEp4ZEdBSHpJTGpHdTgvZFFqMWpXUk9UWnVR?=
 =?utf-8?B?cUNsdlBtWU1CY1NiR1dYRjNZOUpvZ21wQWRxQWI5aTEwSlVMN2YrSkNwa1R6?=
 =?utf-8?B?SkJ1NmhwU1F0Z3lYMERYcE0vd2krdUhwZml5dHpFSDBYSE5TcEJ1NjB2TXo5?=
 =?utf-8?B?VHZYcnBDam9HcXdjQkNHaHBhQWFvaWhIZ1ZKSEFTelFlOERuWXFlcFZUZ1Bv?=
 =?utf-8?B?VnFoUDhQbDZjRzFuOVlFenR3SFlQTXlEb0k5VzFVQXR0eVo2bjB4ZUkwRW5V?=
 =?utf-8?B?YkRkamRBR0I2ZEhhZlowNllKMWRkK2R5OWE5d0UzRmVzOUlFdmJvV09jNHpj?=
 =?utf-8?B?a2ZZOEhyWDk0c1ZHenlXWHhJbFJiYmZ5UVpkSjJiVXgzS2x2RHJVaUlCVExX?=
 =?utf-8?B?clpxb3phVUNXR2NEdUFxVWdZd0FWVUMrNDh4MHlXSnR3MXB0N2J1dnRVdG53?=
 =?utf-8?B?ZlJIUW1XVG91bEVMRDc1RzdWYmdhWkE1aHBZM1hNaFcybWNRblhFQnNQZ3h5?=
 =?utf-8?B?VGJIQ2V3ZFBYKzdCenFmN3VZMHFYcVhMZXR1aFQyWXEraGVRR2F5eDRsU2U0?=
 =?utf-8?B?VXg2djBtcTc1ZGlkV1dCZ2dGWkE5WCtEMjZyNHhOYkY5ZXllYllqbWxOdVJB?=
 =?utf-8?B?Mld5elJZOEMveUEvS2pRVWtvTzFmNEpOQVpFSFRoSUo0YVNwam9BRnpJVUlH?=
 =?utf-8?B?T3ZkanVwbk5pUmQwRlpjblVabXdrSCt3NGlKNyt6bHVOWWlqTDJ5NVE4cEtX?=
 =?utf-8?B?aHB4cWZtWWRIaHdNd3M5NXJTZmVvYTVSMTE3cGZZVzZScDUrQmhmK2RYWTU4?=
 =?utf-8?B?bE9sYW9LakNnOUltZUc1UnFlOVVjTVhhODl1L2RiVnRMbmZCZUJNdnFqajJr?=
 =?utf-8?B?TU1lMnFHOWxlZ1pvdTZULzZOV1NtSHVWeWtkYjBzYkxFdVdyS1ZKZWc3T2VD?=
 =?utf-8?B?MldQN2FJbFpqT1FCLzFIU01EWnA2V1krT2YwcUpYdzNCeHZmQmFrcVdoRHNQ?=
 =?utf-8?B?c0NLbm9SUTlqNzdHRU5zTEREaWNCTUVQNEtmNC9oVzRnVEZsV2JMaE9nWE42?=
 =?utf-8?B?L2FhR1VpMUY3MkxTV3V0TlhiWmx5dUZnYWIyRFdoQWthYmNQODhOTmMybjJn?=
 =?utf-8?B?cERGT29Gc1B2OEJqN1NvSmVLbC9xUUd5RVJETFlpRjZLb0dCZGNJY2wrSVpE?=
 =?utf-8?B?bG1XVzN1N0ZncTVPVDFtdnFQYStDZmt1WjlCdGlEYXUyRXFtc1VQc1Zzc0hG?=
 =?utf-8?B?SFNLTmZLNmx2a1FYOFZ6eVk3aDVjTFJNMzFCbVVHblhUWUJmQWpWVHJYS2p0?=
 =?utf-8?B?THR3ZHV3YnpaTUpNKzlKQ3o0MGNBNko1cTFpM0ZEVk1DakxXdzlTcXhrekFh?=
 =?utf-8?B?elQvTzBKL3h3UjZiZE54eHkyZEJMdDNlSmZPVEJWOW9yZTQvcXpka2VmQTVX?=
 =?utf-8?B?KzJMUXl2ckY2Q0JqK2ZUZElPT2s4RW5vTFhmUFdMQTl5ZzF3SXdDU3pZaTNN?=
 =?utf-8?B?VDBPWU80djdjRjI4R2xpNzFSNjN5NmZCMkhhK1JGNWFKcjREZDBWQjZzd0dS?=
 =?utf-8?B?Z1YrNGUxUXJ1dnc1UzFndzBvU0hZMTZpWm1tMDY3WU1icGNWcnQ2Yk9LSlkz?=
 =?utf-8?B?QVpOcktBenkzQnlBMkdFTjg3U0t6Y1JuWHVUajg2OUFvMEt0WlRTRDhvQzFX?=
 =?utf-8?B?WDFMZVNxTXAzQjAySEJ6bmxlMjh2aCtpT3MxKyszY2dxV1FkTU95T2FvRHgx?=
 =?utf-8?B?a3FiSWlYenBiMk94VGpnaHFrd20vdjdUUTNrTlNVN0FZVU45Z0xpTHRiOG0r?=
 =?utf-8?B?NHErOTBQTFFLUnBER2l5NnRrcm1QTkRuK2RXd0RpUy9yR21rKzJYL3E4c2NM?=
 =?utf-8?B?VWtZelVqb3F4WGxseHYrSlVFV2xZZ0pqU3QxYzJnTnBBVEVuM01Gd2w2cWpn?=
 =?utf-8?B?UTBUTVBpQnBUVEs5RkdQdHBQQ2xQYWJkV2VFd2s2WlIwTitLb2dHdzNKYjlV?=
 =?utf-8?B?dVdmdUo4blUxdnBBUnNqNzh3cFlqd00rc1ZNNVhLbDFlQ1k5TUE2NU1lRWRX?=
 =?utf-8?Q?uppsS/SW9GWGWJOHTQuCd6tGT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d50cef-85cb-443f-3d09-08dd23f48e38
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 08:25:42.4565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuLf6smxTPfTiR+5vnKTdBNvtL/QQ+8E8i/JdtxRzUUBEOWGf+94Ofv35QBnXKF6QcdL2eFQMw8uK672WHq33Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7759
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

On 12/24/2024, Dmitry Baryshkov wrote:
> On Tue, 24 Dec 2024 at 08:21, Liu Ying <victor.liu@nxp.com> wrote:
>>
>> On 12/23/2024, Dmitry Baryshkov wrote:
>>> On Mon, Dec 23, 2024 at 02:41:37PM +0800, Liu Ying wrote:
>>>> i.MX8qxp Display Controller display engine consists of all processing
>>>> units that operate in a display clock domain.  Add minimal feature
>>>> support with FrameGen and TCon so that the engine can output display
>>>> timings.  The FrameGen driver, TCon driver and display engine driver
>>>> are components to be aggregated by a master registered in the upcoming
>>>> DRM driver.
>>>>
>>>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v7:
>>>> * Add kernel doc for struct dc_drm_device. (Dmitry)
>>>> * Fix regmap_config definitions by correcting name field, correcting read
>>>>   ranges and setting max_register field.
>>>> * Get instance numbers from device data(compatible strings) instead of OF
>>>>   aliases.
>>>
>>> Unfortunately no. Your instances are compatible on the hardware level
>>> (at least they were with the previous versions, I don't think that
>>> there was a silicon change).
>>
>> v5/v6 use OF aliases to the instance numbers, but in v6 Rob said it's
>> abusing aliases because the aliases contain display controller instance
>> number, like "dc0-display-engine0"(i.MX8QM SoC has two display controllers).
>> Or, use OF graph to describe all connections between the display controller's
>> internal devices, but it's too complex. So, I choose to add the instance
>> numbers to compatible strings.
>>
>>>
>>>> * Collect Maxime's R-b tag.
>>>> * Trivial tweaks.
>>>>
>>>> v6:
>>>> * No change.
>>>>
>>>> v5:
>>>> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
>>>> * Select REGMAP and REGMAP_MMIO Kconfig options.
>>>> * Fix commit message to state that display engine driver is a component driver
>>>>   instead of a master/aggregate driver.
>>>>
>>>> v4:
>>>> * Use regmap to define register map for all registers. (Dmitry)
>>>> * Use regmap APIs to access registers. (Dmitry)
>>>> * Inline some small functions. (Dmitry)
>>>> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
>>>>   KMS routine to initialization stage. (Dmitry)
>>>> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
>>>> * Drop unnecessary private struct dc_*_priv.
>>>> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>>>>   interfaces to bind/unbind the drivers.
>>>>
>>>> v3:
>>>> * No change.
>>>>
>>>> v2:
>>>> * Use OF alias id to get instance id.
>>>> * Add dev member to struct dc_tc.
>>>>
>>>>  drivers/gpu/drm/imx/Kconfig     |   1 +
>>>>  drivers/gpu/drm/imx/Makefile    |   1 +
>>>>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
>>>>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>>>>  drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>>>>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>>>>  drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
>>>>  drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
>>>>  10 files changed, 810 insertions(+)
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
>>>>
>>>
>>> [...]
>>>
>>>> +
>>>> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
>>>> +{
>>>> +    struct platform_device *pdev = to_platform_device(dev);
>>>> +    struct dc_drm_device *dc_drm = data;
>>>> +    void __iomem *base_top;
>>>> +    struct dc_de *de;
>>>> +    int ret;
>>>> +
>>>> +    de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
>>>> +    if (!de)
>>>> +            return -ENOMEM;
>>>> +
>>>> +    de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
>>>> +
>>>> +    base_top = devm_platform_ioremap_resource_byname(pdev, "top");
>>>> +    if (IS_ERR(base_top))
>>>> +            return PTR_ERR(base_top);
>>>> +
>>>> +    de->reg_top = devm_regmap_init_mmio(dev, base_top,
>>>> +                                        &dc_de_top_regmap_config);
>>>> +    if (IS_ERR(de->reg_top))
>>>> +            return PTR_ERR(de->reg_top);
>>>> +
>>>> +    de->irq_shdld = platform_get_irq_byname(pdev, "shdload");
>>>
>>> Nit: shdload or shdld? Which one is used in the documentation?
>>>
>>>> +    if (de->irq_shdld < 0)
>>>> +            return de->irq_shdld;
>>>> +
>>>> +    de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
>>>> +    if (de->irq_framecomplete < 0)
>>>> +            return de->irq_framecomplete;
>>>> +
>>>> +    de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
>>>> +    if (de->irq_seqcomplete < 0)
>>>> +            return de->irq_seqcomplete;
>>>> +
>>>> +    de->dev = dev;
>>>> +
>>>> +    dev_set_drvdata(dev, de);
>>>> +
>>>> +    ret = devm_pm_runtime_enable(dev);
>>>> +    if (ret)
>>>> +            return ret;
>>>> +
>>>> +    dc_drm->de[de->id] = de;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>
>>> [...]
>>>
>>>> +
>>>> +struct dc_de {
>>>> +    struct device *dev;
>>>> +    struct regmap *reg_top;
>>>> +    struct dc_fg *fg;
>>>> +    struct dc_tc *tc;
>>>> +    int irq_shdld;
>>>> +    int irq_framecomplete;
>>>> +    int irq_seqcomplete;
>>>> +    enum dc_de_id id;
>>>
>>> Why do you need to store it? This patch makes use of it just for the
>>> registration.
>>
>> dc-crtc.c added in patch 12 would reference de->id. If no strong opinions,
>> I'd keep this as-is.
> 
> Patch 12 uses de->id for two purposes: to assign dc_drm->de[ID] and to
> include ID into error messages. It might be better to use the DE
> device in dev_err instead of using generic DRM device and de->id.

Will use the DE device in dev_err and drop the id field from struct dc_de.

> 
>>
>>>
>>>> +};
>>>> +
>>>
>>> [...]
>>>
>>>> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
>>>> +{
>>>> +    struct platform_device *pdev = to_platform_device(dev);
>>>> +    struct dc_drm_device *dc_drm = data;
>>>> +    void __iomem *base;
>>>> +    enum dc_fg_id id;
>>>> +    struct dc_fg *fg;
>>>> +    struct dc_de *de;
>>>> +
>>>> +    fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
>>>> +    if (!fg)
>>>> +            return -ENOMEM;
>>>> +
>>>> +    id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
>>>> +
>>>> +    base = devm_platform_ioremap_resource(pdev, 0);
>>>> +    if (IS_ERR(base))
>>>> +            return PTR_ERR(base);
>>>> +
>>>> +    fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
>>>> +    if (IS_ERR(fg->reg))
>>>> +            return PTR_ERR(fg->reg);
>>>> +
>>>> +    fg->clk_disp = devm_clk_get(dev, NULL);
>>>> +    if (IS_ERR(fg->clk_disp))
>>>> +            return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
>>>> +                                 "failed to get display clock\n");
>>>> +
>>>> +    fg->dev = dev;
>>>> +
>>>> +    de = dc_drm->de[id];
>>>
>>> This depends on a particular order of component's being bound. If the
>>> order changes for whatever reason (e.g. due to component.c
>>> implementation being changed) then your driver might crash here.
>>
>> Nope. There is no chance to crash here, because
>> 1) dc_drm is not NULL here
>> dc_drm is allocated in dc_drm_bind() and before component_bind_all() is
>> called.  dc_fg_bind() is called by component_bind_all().
>>
>> 2) dc_drm->de[id] is not NULL here
>> It's already set by dc_de_bind(), because component_bind_all() binds
>> components in match order and the component match for DE is added before
>> the one for FG(DE is a child device of display controller and FG is a
>> _grandchild_ of display controller).
>>
>> component_bind_all():
>>         /* Bind components in match order */
>>         for (i = 0; i < adev->match->num; i++)
>>                 if (!adev->match->compare[i].duplicate) {
>>                         c = adev->match->compare[i].component;
>>                         ret = component_bind(c, adev, data);
> 
> Yes, this depends on the particular behaviour of both
> component_bind_all() (which is not documented this way, so somebody
> might decide to optimise things somehow) and of your component
> management. While you have control on the latter, you don't have
> control on the former code.
> 
> Please, don't depend on the undocumented behaviour!

Alright, then I'll drop the access to the DE/PE pointers from those
grandchild device drivers' bind() callbacks and cache pointers in drm_dc
for the grandchild devices. Thanks.

> 
>>
>> dc_add_components():
>>         for_each_available_child_of_node(dev->of_node, child) {
>>                 ...
>>
>>                 drm_of_component_match_add(dev, matchptr, component_compare_of,
>>                                            child);
>>
>>                 for_each_available_child_of_node(child, grandchild)
>>                         drm_of_component_match_add(dev, matchptr,
>>                                                    component_compare_of,
>>                                                    grandchild);
>>         }
>>
>>>
>>> This applies to several other places in the driver.
>>
>> I don't see any other potential crash caused by the binding order of the
>> components.
>>
>>>
>>>> +    de->fg = fg;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>
>>
>> --
>> Regards,
>> Liu Ying
> 
> 
> 

-- 
Regards,
Liu Ying
