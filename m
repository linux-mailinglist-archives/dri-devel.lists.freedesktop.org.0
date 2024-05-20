Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710E38C9A48
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 11:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27F410E57A;
	Mon, 20 May 2024 09:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Td1P9Ika";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2077.outbound.protection.outlook.com [40.107.13.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6637510E57A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:25:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxvwWQqekCEEfa/BJB4F2e+4sVigcUl+5yrk7g5NWuMvobLImYiRM7lZHkg/7z6ZPoTG7+wmYxO2C3yYK18sPmFf58pBNrJhQ55/9vNlKDi43yjKrgJP+kveJr44wiGYaR1dotQ6Mm8a1kFDLf8PdhwxfNj/buxQhQCF53XpobZhvx/iaVhlJb0ZZkp/tmemDGgoZxwd11bnqqyzz7Cg4V+CHYa7WfKYZpyP84ZIcAZ3VG/gDmHvKJ8GQYaeXRyZkk0QU1TRm2ezM3jvc6U0TZfAPNGF+aAvNMYDRcgBGovuunt+WQgckz7I68+3wNRZS+i0wdbDuxR7wJx7vRGwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLDYfw8FIOA2IXt8jrgZGy63ET9E3BtraZLh5uP3s54=;
 b=O8A0J3LPQ8bb9vBQI2ivDhfKFowYRzFNaPrW4O0AlqxOEyje6/teIH+hcFMWzfQFlukBz1MCyxySfpMoEuWtuG7zjExrvv3o5eD60n+Takvyy6RzYumjY3cUo63XR6rufAmW/2FGVpQsbWaFewrrnwno0M/6Fkz7dsyk04BUn//9fvfGHdzK7KKD4Du0XLJ/YLzoNSKtXXD+bAh95P8F3ZLNpCK6+EZN/gEIDPpiX5RGCRDrr/+4tWqblXds6Yk9w5LGTSrzYDop8RBjhQZ9JwIj6RwYr/BkFhTPHXfAGEDm2EWXgPJrplC0gCcQYY6NycmhDp3RCQ7SN3F9auTW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLDYfw8FIOA2IXt8jrgZGy63ET9E3BtraZLh5uP3s54=;
 b=Td1P9IkandXX9VWOIuw11OB86cCHEV/42hCE4qnAXY0E3vgpfTezsErhd2dGMIb+YKv24QNrXqyt8mAu0xo2Rm5cj9dkZ6TswY6a4D03KLbTnZO0HIQDW7VZugzSLdkxHa8WSTuZJZTzo7gvgFT4nM+HrZyPTDiKCsxn/lb+MDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7691.eurprd04.prod.outlook.com (2603:10a6:10:201::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 09:25:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 09:25:47 +0000
Message-ID: <2f41a890-915b-4859-8ac9-5436da14fe22@nxp.com>
Date: Mon, 20 May 2024 17:26:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aford173@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 biju.das.jz@bp.renesas.com, u.kleine-koenig@pengutronix.de,
 jani.nikula@intel.com, bli@bang-olufsen.dk, sui.jingfeng@linux.dev
References: <20240516101006.2388767-1-victor.liu@nxp.com>
 <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
 <5efe29a7-441f-4d70-b17c-5327c0a9f600@nxp.com>
 <CAA8EJpqZPQUcqm2U+T7AK74qxo9J0kggS4g484OfoNPAEZPNBw@mail.gmail.com>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <CAA8EJpqZPQUcqm2U+T7AK74qxo9J0kggS4g484OfoNPAEZPNBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::16)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d589888-911b-4276-36ef-08dc78aed49f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUk0Y0Fjei9XYTJUYmJ4Uk5PRWVyWGxxd0tJUEhtSlZwUGRudWhuVGdiU0pz?=
 =?utf-8?B?am4rcHdIVFJ5WVZoL1M2SnE3eUxRdnJvRmE3b3JvWjAvZVQwVFp5SUgyNllj?=
 =?utf-8?B?RnBhOXNzMTdBUE1qazdmM2hFaCtKcm5XYjVJVjlDU2poU0JaZjJYZjMwUVMx?=
 =?utf-8?B?b3BvZUdkT0lDMHRna3EveUQ2eVdYQlgvT0g4TFY4TS9xZndla25XcHQ2Q2Zi?=
 =?utf-8?B?OE9pbUxjR3dPd3haNmtTSjl4cXlQYkt1THJvNFJtNlZlZXZ5RU5wZkQ2eUlX?=
 =?utf-8?B?Ny9Qam5jVWd0NUpWaFE5Vnoxd2RLRVJoSlRMNFQ2SUVXT1FndzZrcFllNEJY?=
 =?utf-8?B?ZERlRGlYVGgwWUNGcDVvSjZWK2wzZ1V0TzVXUzRSRzczRWZzWDY4TXhvZ3NP?=
 =?utf-8?B?NHZPZCtLL3JJR1R2Wkk0d1hTMTlVclhjQ2I0dGxVZE5pVDJwS2JmZFJSeEx1?=
 =?utf-8?B?TnN5V2xaNkYxOUxmQWM2Z0VoaWV0S1JacG1XWHk0WU9qY2VhdHdHNzZrbzNz?=
 =?utf-8?B?TExXVU9lV0REVC9NY0ZyY1NrdGVKblZubEo2d3VzaTNwTzhoWGxhTlhSME5w?=
 =?utf-8?B?MGVsL2tLWVlnckZTd1p5aGlqanlrdDdVNm9Uc1IwVGNabmZXLzh3cmZqU1V5?=
 =?utf-8?B?azVNYmhtam1MZFRxb3FVN1lMcGlWbHF0T1UrazBEelRnQUtKSElxT3lUa3Az?=
 =?utf-8?B?Q1did0dLdzdqVUdOcXpSSVlqZDRJR2tYcDhmYThIays4UEFyNmYzOC9JeHVV?=
 =?utf-8?B?cFdIZzlOTS84Q1grM2V6Y1YzZUhCb01kSzZlOGs4MEpBU2R5VVZZUldOL0J6?=
 =?utf-8?B?dmVLNk00QlJlb0FtOTRmajdZSXliY0RIUTF4YndCQmkwY3MwQ2lxSkc4d21J?=
 =?utf-8?B?ZTF5aytjakU0RUVBM3BuWkQycldNeWRoNWQvNXFRcUhJOEhVOVIvTWk2Mk96?=
 =?utf-8?B?enhRL1VFcW53RnVVdDdnRnc3NG5jRG11TERzZUFOdUhsbjB6QnB5d2hYT29X?=
 =?utf-8?B?aVJOWThLSytDN2ExWHEvL2VEVFZjbFhINDVFaGhnQzUvZE8rdGxVYlp6MXp5?=
 =?utf-8?B?M01wNEM3NUxYUUwxWFkvSHpzUU5DaGU1S0pIdGdJaU4xa2xlUHd0QUhKMlVQ?=
 =?utf-8?B?NWRLc0tBL1pJLy9vNEhSOW1iSDU2dE1veU1hb3MxVUsvQWxDa0RCa1lrc0dQ?=
 =?utf-8?B?NWJLOTNmaE1TV3dtU0ZJUnlzcFlzV2FKdGYzaCtIN05mNEttV1Rqd3BiMFZP?=
 =?utf-8?B?TG8rR2NXa2JPWDdiMGNFOENxbHJOOWptQkg3MEhGTGtjOW56blZTTGY1QXFP?=
 =?utf-8?B?WkNnVjdGMzQ4ekYxYm1xcFNhL1NNeW1waER6QTA5QzNpMjVHK2drcm92S1do?=
 =?utf-8?B?eUM2U01wekZwQ2UyMVZmc01NTmJoZTJIbXd0Q2ltQ1RKMEp6eFllTGtMam1C?=
 =?utf-8?B?b0dxdjJNWDFKTTdpekliQXdJYUdPYXpGcCtvWXJYQnFwNXd4MndmR21nbzBB?=
 =?utf-8?B?VWhlWDJXSDVEN2tQUjBVMzdZQStyaUZRMXBadDhlanNSSDJ2Szg5bGRqMXJz?=
 =?utf-8?B?R0E5SWNVNSthQzVsRTFHcjhRR1lpM0ZlUWU3SFA1YzZ4Vm5hRzVPOWErM0ps?=
 =?utf-8?B?RCt6dVdQSzJZN3RDOUxvUkdSaGJxQnk1dmZkcXh0RVVNc0o0cE9UWXpCNElX?=
 =?utf-8?B?ZHlMV1VpdGVwZnJ3cEptU2FZelpGc0ZMb1Q3TVpzR3puR2R3S1VtVFl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0hzTDM2L1RCRktPZjRjQ1E3aUh4amhwcThzaG5Ba1JVcnB5NkZwM01HWmVy?=
 =?utf-8?B?UitxWit0UDFLV3d4QzBZRHI0UWEvS1BwaU1FQms4NGhvUVluZGpqOGR6cVZx?=
 =?utf-8?B?Uko4WjZjanJheWloLytsRFBvVCs5NVhhMzIrdytFNTZJcm1rUDVKT3lKZzdv?=
 =?utf-8?B?dThpejRNTHNtcEpkN0c5SHQ5bjgwdjVvR3l0RTNyZTZud1AzWWJnV3hUbGll?=
 =?utf-8?B?a0ZpWkJnZm43K3pxaTh0MDMrY2RPclcrTmwyRlBvT2FGR280TU1KdXhDZTk5?=
 =?utf-8?B?VkNrNXRHdThmV3d0ZmV3aUNVMXRFd2g3V0Mzcllmam84ZzZab2ZCNlVrbFdo?=
 =?utf-8?B?YXM3SWd5dUhmcGpaL0xweWV3QkttVmpYY3NRYmtxMDkwNllwUmNHNm1Pa21H?=
 =?utf-8?B?YTAyYVBicFl6S05oYWRtallkdkNYM3VVV1FNQmdISXZraU04TUpXT0ZWUHd5?=
 =?utf-8?B?TzZSQTI5SEt4ZXVJU2pMVlRrdmxkUm5oYWxxUC9FTlZkQ1BjRUNGY3dMa3VY?=
 =?utf-8?B?N081dTNGeElUZGhiZTR5ek9nWXFrdit1c1N1ZkV3VWdLS2ZnY2ZPNlhndXZS?=
 =?utf-8?B?WHNpRnoyTGRrMXFRUWg4ek84SlhUYXM0TUs3U2g5SFlNSGpYMjloOUhlTzRw?=
 =?utf-8?B?UHNtN2NnUEtlK3U3U29ZbW9peFBtQmxuOU8vdlZBQkJxMHAwNnBCOVQ3QVgz?=
 =?utf-8?B?UVFIMWUyaktEZG9haG56WUFWbW1IMXJ0TkdMSHJBL1JqQzdLUzdxL3U5Qlg2?=
 =?utf-8?B?Vmh3b3FsenRUUVRYWEFsVHNlRGlub0JrbnB5bTg1V2xObDFZUFFEQzZQWTQ3?=
 =?utf-8?B?ZGt6NEFvQzR1dFBtTmdNbEczNGRZSk1GaWJwQ0VudVp6NHlpSHk3eVFmY3JY?=
 =?utf-8?B?RTFHWGp2ZklGTVVkOTRmWUdKeTdpS3VSU1dzZHl4cU9lV1gwc0I4STZJVmhB?=
 =?utf-8?B?UmlaaXlwVVhuQko1bW1JSy9tbFdIdmtUbjJxLzlJaVMzZVV6WTJFSnJYMyty?=
 =?utf-8?B?T0Z4WHVYdDhHeDhVRzVOSVBaRlpNWVVLMisxMXd3VE9YV3IvdiszRUNtdTF5?=
 =?utf-8?B?WFJabE9WdXB2a0ovRU5ETlVQeFp3N20yMmFaQ2R0S0IzcnRxL2ZkUStoNVFi?=
 =?utf-8?B?eDNWOHBMbEtBM2NxRmlEbXZVMUgweW9Bd2l6d05ySXVBbXlMNXMwaVV0d1ZI?=
 =?utf-8?B?dTNoOVB6ZHZNZnhieGg2eWVmaVdMS2c5K3JycG8vQ3NVY3BlZlQxRERvblU0?=
 =?utf-8?B?KzJOSVhCd29JUUpLcGVydVV4VWwvamNXY2R0NkpWSlpSanIrY3B4SG1LMDFP?=
 =?utf-8?B?NThUbm9XVlNuZXZwMmVkbGVONzhzb0NkMjhHcHo3ZjN0alBKTG5vZHZsaURZ?=
 =?utf-8?B?RnVhUFBlbW5mQ1h1ZlhyNmVNVThyaHVRVjg1K3hxbHA5TUFFOWdNSmR4T2tl?=
 =?utf-8?B?b2M1VENsbURBSFBGbUwvSDNOdzFpQ1VsVjNhR0VxM3U4MVVHalhTZ3Bxcklk?=
 =?utf-8?B?SXZNQ1VkYkhSNEFSejR1Z2pmUU5FSDlPVlRYbDFpVDZXWUwvZ2RxenAxWHlM?=
 =?utf-8?B?MmNyNTRDaFNNQ3BXMmR1TkEybW0zM256K2Z1T3pObEhEaEN1V3dDZWNSd3Bu?=
 =?utf-8?B?OXJ5U2pjU3B5MC82cjA5MndTUlV3Qm1FeCtXUUtRRW92c0VWdEcwYUI4QW5r?=
 =?utf-8?B?aG9DM1BJekljMDZHS002dE1uRFVNQXBjRkdqUm1KMjdlY2N5M2h2WHdya0lj?=
 =?utf-8?B?bFIwSEVUM244eElQU0QyZ2tLVGFwb2NCWE5obENUWkQ2Ry9ERjNKN2RpM0hV?=
 =?utf-8?B?OFNnazRLRVNxcWE1S1R1a05LMzZZSFg2VnBHWHc4dWd1QnFSZjJFR0c4ZHZW?=
 =?utf-8?B?aStmQmk4M09FWElZaFc2T1J4N3ZGc3pMS3RSdno5RlVsZFNMdHNxVHlEbEIz?=
 =?utf-8?B?aEhZdVpuTTMzZGs0aDEwZzNEWWErUi83cDAyclhFa1lHOVhwenNiN0pvOHkz?=
 =?utf-8?B?dXB5TVFwYUxQMFNOb0ptQzlwYWlwdUVFLzducXdYMW9TOTA3cXUvZktJVmRX?=
 =?utf-8?B?WmYvcjBNZ2VZK3RYVCtJWE1oSlo4SWkvQ2phMGdad3hJMWRuUFkvSk5tV3JP?=
 =?utf-8?Q?NjwQhIt1laMvvH0D+e0ULX3Ze?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d589888-911b-4276-36ef-08dc78aed49f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 09:25:46.9755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbkWxNxCd3b+bE1oNa1XoeCMPiIgiV/A6mnaTc/lLif0cRNMxMXbF47SzjMtJkg+AXtiLqMcDr9KJqx+byQ1iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7691
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

On 5/20/24 17:08, Dmitry Baryshkov wrote:
> On Mon, 20 May 2024 at 06:29, Liu Ying <victor.liu@nxp.com> wrote:
>>
>> On 5/20/24 06:11, Dmitry Baryshkov wrote:
>>> On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
>>>> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
>>>> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
>>>> no interrupt requested at all.
>>>>
>>>> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
>>>> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
>>>> a few times, but adv7511_irq_process() happens to refuse to handle
>>>> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
>>>>
>>>> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
>>>> handling from adv7511_irq_process().
>>>>
>>>> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>>> index 6089b0bb9321..2074fa3c1b7b 100644
>>>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>>> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>>>>              return ret;
>>>>
>>>>      /* If there is no IRQ to handle, exit indicating no IRQ data */
>>>> -    if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>>>> +    if (adv7511->i2c_main->irq &&
>>>> +        !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>>>>          !(irq1 & ADV7511_INT1_DDC_ERROR))
>>>>              return -ENODATA;
>>>
>>> I think it might be better to handle -ENODATA in adv7511_wait_for_edid()
>>> instead. WDYT?
>>
>> Then, adv7511_cec_irq_process() will have less chance to be called from
>> adv7511_irq_process() (assuming CONFIG_DRM_I2C_ADV7511_CEC is defined)
>> if adv7511->i2c_main->irq is zero.
>>
>> But, anyway, it seems that commit f3d9683346d6 ("drm/bridge: adv7511:
>> Allow IRQ to share GPIO pins") is even more broken to handle the CEC case,
>> as adv7511_cec_adap_enable() may enable some interrupts for CEC.
>>
>> This is a bit complicated.  Thoughts?
> 
> Send a revert and do it properly?

Good idea.  Adam, can you do that?
