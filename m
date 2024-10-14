Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFEF99C326
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E1610E3B3;
	Mon, 14 Oct 2024 08:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Km3P7FMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2B410E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DST5dka0bObE1dGB/Zi5X/9suxzZ1HEyr9r78hnNS2nqM4RTpVPEmNGlf0xyrVexfvCQjk5ct+y4JqZqN5tzoOBVM6fzSU9/v/AAHVVDLpBz2D/NszBiJFmkuhc5WuhdbYiZQNqPs0al6RpioF7ITg7g35lB5iosfrNvwW2kfr+F+HEL11Edp0UqRyLPcg/BlUh4mLwcBng6hs44B3RMncbLpBA9cq3Vg0dTlw8CjCY5V02STfCKM+jDALJBnT4ExFSqOH3cj60CaXJ+6QJUESthopH6SrWdTQb7zNOubqb7hfHqXo/sKtP6whKGw5oA9GtD3Vk5rnQcCFjC8OeLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8zt7bLNPmwHZdp6oavDy0/TIiEE4vH9XUkEO+fSD4A=;
 b=WBFBshXb0WS+Vf27gkA+SYMHoClqNA4Zh9mxBYMNaKJ1u5SPYmMNpEtXstzCUTP62rX6eekBSSCxQIwI1KbDg2bPYejd2l1Oy89iCUDVvppIFBiNLKKoZy4l1hhCYrH3mZD60iD22gqs8n/9awPt75jFf/jbUzmNBrHtsdg6+wSgKiuDALrDJtghsIM/T+0mhqApg+kMzWQlPJVkMeAOaQOlvKq1fkSg129NSOQSjmSqccAnldyJA6xx+S1PEBRMNN07BbZCwjHcxz9QjvXYSq1zFoEvQ+ozn8eGz0V8/NmaJ486F/CYJt8pBa4h6rzzNfB0uovmSsQoYlkWrJVVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8zt7bLNPmwHZdp6oavDy0/TIiEE4vH9XUkEO+fSD4A=;
 b=Km3P7FMesbTlKx5ftvon7JP1746jrc77oY9THDUtPfhLtmq4quugJ4vQGzJ9NxSf9IvBMbSkWu84gvHc+kdLa+AOROzQzA2/qHB3papKkvE5dkVOclJnmuASynn+mBxLoweIglbMYwlBuoETRDH8EerNrfD1PHHeZWjLBg31IlChQVEH7BDIK8lIfORoo5MTMMo1bLgvFLJafS+RuuHkIHhWrzCSSQD/joSJ8scJMFNF6DKo5PoFcauGD3Za9KkKDPl4XMqQgk3l3o1nVaYzJDu3HwkzofMrLs43xzcRWseznAK/P0eA98cEhv4GR6cSwD6FrQLwSYiEe81MODSEvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8756.eurprd04.prod.outlook.com (2603:10a6:20b:42f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 08:28:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:28:07 +0000
Message-ID: <91d1e176-f578-466b-991b-2df1728e2f78@nxp.com>
Date: Mon, 14 Oct 2024 16:28:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de,
 marex@denx.de, isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
 <dtloyyghjep5rm34qjjinvhvrar5jzj3n24czvpdmnkfesntjq@t2uijuez7myj>
 <f47bc3f1-20d9-4f7e-acdd-85eabdb8d743@nxp.com>
 <kaoqse23we5lyhaawk6xe2ouxwwjtjfpkiqb3j7xe64o2jscny@3yswlkjhuuxw>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <kaoqse23we5lyhaawk6xe2ouxwwjtjfpkiqb3j7xe64o2jscny@3yswlkjhuuxw>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2f6162-d592-4dd1-af69-08dcec2a2104
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZytuNUtoMmMyQ3Vvc0p1ZEN5djYrOEY0ckhQNTN5U3BraW15ay9DSWRId29T?=
 =?utf-8?B?cWNQQXZwdG5EU3VJS1orSURMYXRCN1RXZFIxMFB0N1dQVlcxTk1KaHV2dkFR?=
 =?utf-8?B?OUFEQ0dtNzY4RkxJNUwyZUxQSUtwdnNNZDd2S3ZiQk4vQktjSjROa3pQTWtt?=
 =?utf-8?B?WnhoWFRhMmVyc3BaVitFSC9XSHRIdWdvcGFiZlgydFROeTNJVVpYaWVVMXBW?=
 =?utf-8?B?VWlRaUJ3ei92Q0sydXhoRlZ0bzNjUGVZR3ZMSUlHUlVlSERTYzZDQ3crU0RL?=
 =?utf-8?B?M2kwVmJmRXVRY3M2T3o3eEpmVmJObnYwenpKTWJGS3RQZzRVZ0VYTjVyM3ly?=
 =?utf-8?B?Mi9JejdWUE1hYjVGczg3VHhwYVk4UnZPSzNMSGFHVUVFMWc2UStSc0VVMkFl?=
 =?utf-8?B?cXh2QkhpcFVvM1V6QkRKcmxrNjkwZ2ZMWWdpU3FyY0g3WjI0NWppWUNwRHRl?=
 =?utf-8?B?djdzYmxvSmw2RGlYSU1RQjF6SmYwSnZnUjBrZU9DZis0cVF3cDk2ZmF2Y2lY?=
 =?utf-8?B?WFR3Zk1WUHk3SEMxaEtOd2pyaTAvU2dvMmhqUmxCS000VVZFTlk2M3A5VTg0?=
 =?utf-8?B?UE1XYkpuTXVmdnhwU2Vla0NST2JOWDROUVMya2Zac3VDdDhCS1NVYVdhWTBm?=
 =?utf-8?B?aXNaUmt3ZWdKVlMxYWFGV2lJaHdhaVVqRFppZTZEQVdZaDhaVk9HTTZPZFZM?=
 =?utf-8?B?dnRRUUxtN3o5a3hqcXJsaFNCOHprelRiU29sZXo3anQ5elpnR0tQSTFIZjBE?=
 =?utf-8?B?UDBiVVJLK24xUEI5RHpJa2ZiK1YvbEkyT2ZYMnFnMWEvd0ZOQS9wT1RlWXFW?=
 =?utf-8?B?UHBwc3dEZVlMTlB2TmJJdngvMjE1NFMvVy9ReXl2ejZxLzNZZEVLaFozcG9J?=
 =?utf-8?B?aGVrN1BwNTRCSWpYQ293UlVsYy9KUGhvckw0MkVvcHhhVlkxZlNRalA0c0xk?=
 =?utf-8?B?bTFhUk50NS9iODNiVTczM0pKRzFwcmhwYURUUTFHWEVqOVZSMzFJMzR1ZWE1?=
 =?utf-8?B?REtSM3htVDc3dUc1WmhoaE02RE5FUFZuY3AxdEZ4aWpNTFFjZisvRnVhWi9N?=
 =?utf-8?B?WHlFRjNpWFJRajlEdENxekUzS3pHbGxCKzJXeEFLenZ3dnNuZTdUZkRHci9n?=
 =?utf-8?B?bFA1bHVVRWlYelFLRkprdUJud2Z5b05PN0kydnFmcWF2ZmxtK3p1WENDTlY1?=
 =?utf-8?B?SXo0eXJiN1Z0a0tuWklZbE9CU2VHTlh4TGZCeFhUYm9ibElSRVY4bUNSNFdz?=
 =?utf-8?B?ems5SXJ0VXBFOGdBYlByRWRhNkUzcm9lZG40N2FRWGRUL09GS2RMeU5qTVVO?=
 =?utf-8?B?WUlpa2d4dnRSK2tWK2tTZ1I1MVBzZ3J3RmhXZG1Ib1dNUy9pTFZNRit0SDRz?=
 =?utf-8?B?bS8yWVZPNGVIV2oyaWdublh0ZkZjRFpGcmNpSWFYNlJEWTNTc0RVZGdDdURy?=
 =?utf-8?B?RW1uUXJZWTZnL2tUK2xtVWN1NFprdDlIRm5zZkVjVTlmM0RRTC9YVFZENkFD?=
 =?utf-8?B?aksyTThVTm1TWnhVWGdkSWMyV2NibysvUTZSWlJIb1JPb0xKNS96emo5N0J6?=
 =?utf-8?B?dXR6K00ycWN5OGFMZllwa3ViaE9OOWdTNkFDTXd4bkxDSjd2ZG5uZEphdGdz?=
 =?utf-8?B?VTdkdE1DZFc0c3JkREt6aFprbExlSXVtbW1PN0RVWi9NazJOek5sbTdTb21C?=
 =?utf-8?B?Y3F6VTBvaTdSYkxzOWVxcHZ1SkpQelVQZk90MzYxRVBBQzllcG11QzVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjUvcWVJaGwrRmpONEdFbStWeHY5eVNaSFRDckJiMFZlK1JRK25CeFlERnB2?=
 =?utf-8?B?YnQxSFN6djRCQ1dJNUFvcDNWVjBCNjh1dkMrTXphTW0yaGZIOTlxTGFGbG9s?=
 =?utf-8?B?NXAvM2VJSzlhZFhiWGxSc3MvL2ZkdEkwSzByYzRkQkpzcnU5NWdVUnZLeEUy?=
 =?utf-8?B?ZkszNHJWRzNHWDFjc1BpYjhBQzhlWWdsSXBlWFk0bkpzd2wzMmtZNzE3ZXZw?=
 =?utf-8?B?Q1FDTm43VGp2aVNDWlpFSlZUQTBDODk3eStsenhma0huY0JFak5ySEs4QXZo?=
 =?utf-8?B?NTdhSEU4SXQ5U3hFN0ZDU25kU0VDMFJyWWJSTFN4dEFCZzdHZmM3Ri9jc2wx?=
 =?utf-8?B?TE9xOFB3ekNISGZETkVxeGNPbzMvc0xVckM1UFp6Y0NjTDZRMHJ5MXBNWVBI?=
 =?utf-8?B?Zis3QlRnWjNWTWxVV2Rkc0N4WVp0L0x3UWY1cmErc0dvanZJd1FncFlrSkFo?=
 =?utf-8?B?TkJtQTdYV3hoRzByNTkrRnhBQ2dJOWhVYmFXWFA4clZJZC9VOGdpTGpRMHJa?=
 =?utf-8?B?d3QvRkJqbWZVN3EzeTA1NUJ6N3I2S2FKeG1lSkZNWjdnU0hWcThBZTcwNXd1?=
 =?utf-8?B?ZkNFNWlHelIzQ05WaW5xd29TRnMrZU0zM2lITmdHTVRTWDZiU0E1aGp2S29x?=
 =?utf-8?B?aEtnOEF1cDc1eUN0TjhHL1ZPMDZLbURLRkkvSnJyUUh4MjVPb0xRV3cvVFhX?=
 =?utf-8?B?Qjh5bjBxMHp2WVFDTitFdUFrZFBSMmVSSUdJci9pcjZuN2drdXdiWXphaWYy?=
 =?utf-8?B?bnJPcHl3aTlNbE9XdFRWM2x4TlZsZEY0cFVVLzhDQ3dwYU1OTzExZTBRSFRM?=
 =?utf-8?B?dXlYZVVIRXpDa0NSQzc0OVAvdExuUGZsMTRNOUlqelN0NGtrNDJ0NTFBYks5?=
 =?utf-8?B?Y1hrdzlCQjB0cXBIdFVBN0ZnVVIxMjdzTUQ4ODc3N3hjQSt2dWhFY0UyUGZQ?=
 =?utf-8?B?MXRacHNzL1dybHE1cmRPTFljQ2ptWHhVNENwK0RLZnROT3NsZTNaMTNNR1V1?=
 =?utf-8?B?bkt1OXRTZlIyU0FSL2xxZUNDaGEwMnd3Q1NZUG0yN2IyTGkxSnFuWUZsN1dk?=
 =?utf-8?B?TUt3dVlTSWxWWXJ0SUhIcnlNcjY0OTVsMERsc0hIaWlkT0FidXI1bDhIaWhx?=
 =?utf-8?B?cTgydVVIZ2d2TFQ0TERnVWp3RUg3akZWQUpyemJJYWY5bFFoUzRZM2NRREJL?=
 =?utf-8?B?WnIya2c2dDFZTWxwRVkzdUJxR3JmM2lpcHhmUE5tb3VNTitFVmJhbHpXY3g0?=
 =?utf-8?B?UW11aWRSTUIwZ0paZHdFWkhxbWJENXlYQ3lUMCs2enJPdCtUT2MwT1BrZTRp?=
 =?utf-8?B?QlNkMTJTcEFEUElvdUdsTFdMMFFLdjFTQitncVFxZCttRzg0TEtwNzB0NUVo?=
 =?utf-8?B?Qy92cUNRWGFoS0xveWYybXA3cFduL1JkTzhPZmxqZ29sQUovNFlzRmVPdnhF?=
 =?utf-8?B?M3pNKzdKZXdsSHV2WngzZklsZlFtTkFoREhVUDMwb2lrOXBKNGJnb1ZuVFZn?=
 =?utf-8?B?d3d5bDY1dXE2RzcwVm5Md3g2RC9WVSt1Smk2MjhhM1BnTHNpM1Y1Y0Fic01J?=
 =?utf-8?B?d1gzNUE2eG8vVHVKWk1WRjRPV3lKcnJTYkFPbXk0ZERrKzBrZ3MzSHpjTnhC?=
 =?utf-8?B?TW1TS0xBZE1wc3Vmdkd6ZjQ2ckROemZQUzl6MkdNUUhCWmgraHJzUjNuaWs5?=
 =?utf-8?B?WC9Tb0lxNGJ4aUZZTjB5YUhJQXFOaWQzSnFNMlhGbG56dDV4WlcrekZEZWha?=
 =?utf-8?B?MzZ6QWo1cTNqQUxwYWU1T2xrVXRBMEZCWjNaSU83eG9rQzB6ell4aDI4ZElF?=
 =?utf-8?B?RFNaVERMMWFrbGE3bzcwZ0JQandXVVR6YUxaZ0V0dlpyL1hEYVVxemw2cnJG?=
 =?utf-8?B?MDRhRTJoVUhtSGtTNWNNSjdFakltaDA1RWh2WjBINHlmSXRiNVdZSVhsb2NT?=
 =?utf-8?B?SnpuVWtBL1pYMjd0VkllRVltbmdKYkZER1lBN1FtRTlNbHdMY1Brc0hQaUl4?=
 =?utf-8?B?eU9kaXdwVENMUkJhTEpscm9IUkJlNkUwaDZyRmd4cUp4dmwyd1I0M1ZRT0tn?=
 =?utf-8?B?VDlUYUptR2xySUlUOURsQ1RoZjNYdEU0RTREMHBKYkVLeE1iNUpBWklEMjN3?=
 =?utf-8?Q?dKW3nnhzs4I/2IRGqk62Ls3ES?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2f6162-d592-4dd1-af69-08dcec2a2104
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:28:06.8760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Phnuo7AwonzLZtrr55fMZHqPgVxAN/Qt3H6buFvwlFZjIPtL47DHk+XqNdT/gbOFsdrGc0wkXuOKJvDfQwSPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8756
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

On 10/14/2024, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 03:18:15PM +0800, Liu Ying wrote:
>> On 10/14/2024, Dmitry Baryshkov wrote:
>>> On Sat, Oct 12, 2024 at 03:35:40PM +0800, Liu Ying wrote:
>>>> Add basic HDMI video output support. Currently, only RGB888 output
>>>> pixel format is supported.  At the LVDS input side, the driver
>>>> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
>>>> mapping.
>>>>
>>>> Product link:
>>>> https://www.ite.com.tw/en/product/cate1/IT6263
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v2:
>>>> * Add AVI inforframe support.  (Maxime)
>>>> * Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
>>>> * Rename it6263_reset() to it6263_hw_reset().  (Biju)
>>>> * Check number of LVDS link data lanes.  (Biju)
>>>>
>>>>  drivers/gpu/drm/bridge/Kconfig      |   8 +
>>>>  drivers/gpu/drm/bridge/Makefile     |   1 +
>>>>  drivers/gpu/drm/bridge/ite-it6263.c | 919 ++++++++++++++++++++++++++++
>>>>  3 files changed, 928 insertions(+)
>>>>  create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
>>>>
>>>
>>> [...]
>>>
>>>> +static int it6263_parse_dt(struct it6263 *it)
>>>> +{
>>>> +	struct device *dev = it->dev;
>>>> +	struct device_node *port0, *port1;
>>>> +	int ret;
>>>> +
>>>> +	ret = of_property_read_u8(dev->of_node, "ite,lvds-link-num-data-lanes",
>>>> +				  &it->lvds_link_num_dlanes);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to get LVDS link number of data lanes: %d\n",
>>>> +			ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
>>>> +	if (IS_ERR(it->next_bridge))
>>>> +		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
>>>> +				     "failed to get next bridge\n");
>>>> +
>>>> +	port0 = of_graph_get_port_by_id(dev->of_node, 0);
>>>> +	port1 = of_graph_get_port_by_id(dev->of_node, 1);
>>>> +	if (port0 && port1) {
>>>> +		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
>>>> +		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
>>>> +			it->lvds_dual_link = true;
>>>> +			it->lvds_link12_swap = true;
>>>> +		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
>>>> +			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
>>>> +			it->lvds_dual_link = true;
>>>> +		}
>>>> +
>>>> +		if (!it->lvds_dual_link) {
>>>> +			dev_err(dev,
>>>> +				"failed to get LVDS dual link pixel order\n");
>>>> +			ret = -EINVAL;
>>>> +		}
>>>
>>> Please use drm_of_lvds_get_dual_link_pixel_order(), it validates that
>>> the DT definition is sound: one port for odd pixels, one port for even
>>> pixels.
>>
>> It cannot be used, because it get the pixel order for the LVDS
>> source not sink. IT6263 is the LVDS sink.
> 
> Then you need a similar function for the sink side. Add it to the
> drm_of.c

How about getting remote LVDS source ports first and use
drm_of_lvds_get_dual_link_pixel_order() like the snippet below?
This way, no need to add a similar function or modify
drm_of_lvds_get_dual_link_pixel_order() implementation.

If you don't like this, can you please suggest a similar function
name or maybe an additional parameter(with type and name) for
drm_of_lvds_get_dual_link_pixel_order()?

---8<---
        port0_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);           
        if (port0_ep) {                                                          
                remote_port0 = of_graph_get_remote_port(port0_ep);               
                of_node_put(port0_ep);                                           
        }                                                                        
        port1_ep = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);           
        if (port1_ep) {                                                          
                remote_port1 = of_graph_get_remote_port(port1_ep);               
                of_node_put(port1_ep);                                           
        }                                                                        
                                                                                 
        if (remote_port0 && remote_port1) {                                      
                order = drm_of_lvds_get_dual_link_pixel_order(remote_port0,      
                                                              remote_port1);     
                if (order < 0) {                                                 
                        dev_err(dev,                                             
                                "failed to get dual link pixel order: %d\n",     
                                order);                                          
                        ret = order;                                             
                } else if (order == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) {        
                        it->lvds_dual_link = true;                               
                } else if (order == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {        
                        it->lvds_dual_link = true;                               
                        it->lvds_link12_swap = true;                             
                }                                                                
        } else if (remote_port1) {                                               
                ret = -EINVAL;                                                   
                dev_err(dev, "single input LVDS port1 is not supported\n");      
        } else if (!remote_port0) {                                              
                ret = -EINVAL;                                                   
                dev_err(dev, "no input LVDS port\n");                            
        }                                                                        
                                                                                 
        of_node_put(remote_port0);                                               
        of_node_put(remote_port1); 
---8<---

> 
>>
>>  * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order        
>>  * @port1: First DT port node of the Dual-link LVDS source                       
>>  * @port2: Second DT port node of the Dual-link LVDS source      
>>
>>>
>>>> +	} else if (port1) {
>>>> +		ret = -EINVAL;
>>>> +		dev_err(dev, "single input LVDS port1 is not supported\n");
>>>> +	} else if (!port0) {
>>>> +		ret = -EINVAL;
>>>> +		dev_err(dev, "no input LVDS port\n");
>>>> +	}
>>>> +
>>>> +	of_node_put(port0);
>>>> +	of_node_put(port1);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>
>>
>> -- 
>> Regards,
>> Liu Ying
>>
> 

-- 
Regards,
Liu Ying

