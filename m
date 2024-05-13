Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC78C42F6
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 16:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFA310E7B9;
	Mon, 13 May 2024 14:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="j0/0JuGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2070.outbound.protection.outlook.com [40.92.21.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1406C10E7B9;
 Mon, 13 May 2024 14:14:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8sCZKWzyBULaRyul4huNRSB95MhReswHBKcYjgXtOYD3yGiD41/le77V2DIsEeUyF+sRjx3iW4TSnTwZq+os/K4GXSBlcIcAEhGL38a/nZ074Nj/jeeE6uVYtTO/j819lQNHHeNlreNg67lkUstHm6VUXNj0v60WH/noleOSoNz85zs0cUj9/fqn6CbHbExh0KK3JbAPY04+1xInbHArBNM4mkd9nwm3BmpRWcF/00D7gNTgchfBUUokLpUVdAKUQ7MeLSW/CbeJPVpwdb7a1Lv5jaqb9A38oCC25DGdlfb4kQi/q27H+FOggwOQlfs+1hqcYdI4wODnfm9B/QhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ii9GsWnJ7D6mP1n2yJF+TxiwCJPferw8vPhzhtBwuE=;
 b=divYYw/kKIHM5cFmE8yGTIAsGJgBIDsZLPvsbH31lZay2lyjrjxQRu+YMZ4+y0HqoyUui36ExAS6LJeIxYCYtX0O6OwWD4xCSyCbaMPmp25B2hlmZ31ndzwmxLakwDES9qam/mHWRdE4oxK1ZraKprm+LqD7gMzsK/hkUW/nPJltzVJv89gGRNdRLpciH8LOOw2yYRphmzJ3FjeacqLtmEqP79A8d0p9oxlMXJQJCxSu2kDbuuOHo5MNQT49L340kkc1NnC4oFwtUV51iRWUgAr266hEz83zZHXVS49kyTmelWj0yR+gdLMebceF/sLCNLmiWHLYq39j1Cm2Ebw/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ii9GsWnJ7D6mP1n2yJF+TxiwCJPferw8vPhzhtBwuE=;
 b=j0/0JuGIGoDM2u85XK+1SCj6NILuIJMe93oko7glq3JX7ElwJuNwgww4Mxyb2kRFq3Z5HH1LKSnSnGvr5ZN7WPqXmjoTinVk+w2l5IOFO/s46lJivIwm1J1az/K/GPxk4h6y1YmHLk50MpXx9794biZ5NPv0sm01b7pwkOl48hfSmMo75oKF0Z2NZR70sfLvUlQf6eYHPHvCzgnaowHLt/vkK0FwqrdGn7QLQmCUbLr6imr2d+zFX3v7PWwfKkBL8npMpOV2d83GFKJie4gw7/JWwiJU349VkGHnvLhqL0W1hF9ZDrSXAb9X18J8FphEQUSN6wS8/rXS293/VRVOiA==
Received: from BYAPR03MB4168.namprd03.prod.outlook.com (2603:10b6:a03:78::23)
 by MW5PR03MB6982.namprd03.prod.outlook.com (2603:10b6:303:1a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 14:14:17 +0000
Received: from BYAPR03MB4168.namprd03.prod.outlook.com
 ([fe80::b8b1:7fdc:95d4:238a]) by BYAPR03MB4168.namprd03.prod.outlook.com
 ([fe80::b8b1:7fdc:95d4:238a%6]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 14:14:16 +0000
From: Jiasheng Jiang <jiashengjiangcool@outlook.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, chris@chris-wilson.co.uk
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@outlook.com>
Subject: [PATCH] drm/i915: Correct error handler
Date: Mon, 13 May 2024 14:14:07 +0000
Message-ID: <BYAPR03MB4168F12A763386E1ADF8A8A7ADE22@BYAPR03MB4168.namprd03.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [9DNGlloOSkAg6/nouQhv1hukjZgaI1LQ]
X-ClientProxiedBy: CH2PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:610:4c::35) To BYAPR03MB4168.namprd03.prod.outlook.com
 (2603:10b6:a03:78::23)
X-Microsoft-Original-Message-ID: <20240513141407.48770-1-jiashengjiangcool@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB4168:EE_|MW5PR03MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 723e0260-b985-427f-2e54-08dc7356f933
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199019|440099019|3412199016|3430499023|3420499023|1710799017; 
X-Microsoft-Antispam-Message-Info: E6k/P1HCG+Pyuaws5+Qrd0XbnxVsmLcy/UIDaNVgzwgs3Imvo2N91rkMy33xkra/fnq+Xjd45c/ybHXhvCwHnLAOKe1ZbQjURCV3e2Ol03yda44/Zd3vmNwVcQCFTTfH+bIhNS7APZ4A3PhW2d93lkAxPcOCM9xjvel34aX2cWd7YRFRofYLWUYGLX2l+K5zGD8gaRuenUlVkob8SS5QUnfQP7XbC8O7/nacTW25PdX00o9hBWGRi0cUy+P/CpBQtJ7iCGUIaTLoe4GS0sDv+oXrDOsXBKoPFhya6NhiuaxeEylOGgyC0MI1N2a7yxlBmj6gFlwfdSVin622pEw+HbEzYd+LJUCGVEdz3MBUGujZh66IZxu5KDGM63X5qFMuCTBgXD3MFsFeA58VEVPTL1bTmcFmHF4Q9QAvlmzIBKmhK3fKQWuI4IqYiHfqryswH96yJWzJKz1X+3/8N0PuLPYxl8TR+1EQ6RGCWVO8DYHGvj2/Z4AXUDWkoB/nDimnPEtJHZu0Yx+YfjdkLRM6Ogvtwhn57fV/ophvl7iHJn7sLpQhU9+pT37Gwbh0aCYsutSKfTJ/m0Uo3ZmuJ5TyA4HNHKATEXHDrgESlXX1K8VgAgN0bX8lkpwY6v17tXUs
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nDaCK/rZrZXPZ4aaEC2CSnRxrcI1ORh2xBmMxxj4MV8xceaWotk2Y9DkKCad?=
 =?us-ascii?Q?8LdccdQLPCR04bWXj8B890mAlLGdZLJWp+L16yW5ftxH2CrV7oc2FCJhVPdg?=
 =?us-ascii?Q?PJArRttO412Zqb2SnmTAMBJba0Aa3TKNcfuSkoLGHE2FNCgh8XeSY7WyMPDO?=
 =?us-ascii?Q?qIDWxSrHRR07I4NnBtzZ41so6GPX2Xb0VwBeKse8d4yWYxC4EGJZmGqIP2Gm?=
 =?us-ascii?Q?dlG6Z2hcg2jN8jtoqQxA35o4USXey1mZipAa8z/EgNb86fUe5mfiQVJMb/ey?=
 =?us-ascii?Q?gFE82Z6alTIvTKlg5e+tX5hehP8pL7ri2gjid7uuV683HppwNBYjpktZjDc6?=
 =?us-ascii?Q?9IhhUJSMkvAjAGDi7iAcQm49+RfT+qMRWbIh2BLUli86Dcj1ewriYFeOVSFH?=
 =?us-ascii?Q?BaBJZP1CC+aLzZ80iDkqnrgYO/sJAfZBnUTPgPjc7E6uNSuGAF5p6cttZhYc?=
 =?us-ascii?Q?lg4bM/TwP2JkNwPEVCp8UBNmfdW4gQ5bM15Czvavp0tBRWeDd4QqdnsmjZhA?=
 =?us-ascii?Q?hFay/TGbfC9AYV4opaswz6cF2DhHJJKAmXV77mjjHfBuaF2TBQlP7DV03pec?=
 =?us-ascii?Q?YXxYSfx4TPM/qSmRl0i2d60nkPwZO5+D4lYykc7bIUfjXG/AvGMa0xp0Pfbe?=
 =?us-ascii?Q?XNjJJ8UDujHqwbz+qCfFM6emAIAIJuB+xFu3ISPQjdK1AA35k4V3j2MOWU3a?=
 =?us-ascii?Q?00y4L7YGPsCD0KTre7O7bbXu8dO+t2NmWiTdL5JfbIzixQkPlsYpUP3Re+qf?=
 =?us-ascii?Q?h8AKWoe7slzpAy63YVE179iyhcGKV3hqGngskGCUjEwwbghNHHxEqP10n40C?=
 =?us-ascii?Q?me6iM6GeG0dGgh+ujh85YF53rF7u/02nwf0WcnvDCvgyKgvaQbYcE4zDnQyy?=
 =?us-ascii?Q?1vabEK2gZnWjX4DLMYGivUfhcmoMrNeuyykNJBTmAsimXPQ6FIRzwI7EhFKY?=
 =?us-ascii?Q?Hj8EUgnp6yQq/z+Y/zda8rX8h4UTCL5hEwP2JsNUeNNOplNNvPlxlj3vEf4f?=
 =?us-ascii?Q?KT9/H5cEi8D+MyshsF3/hAmNGKCWsrWQ52NrFyqGlxYqkbLqSyk83pNRHrRy?=
 =?us-ascii?Q?Q7UPgsSrEEz3+KTbloQuy20xSZ0+TJJjBTIg11lz2Ox8Ik6smJamlKe+dzUn?=
 =?us-ascii?Q?o451xDVLzVFveDya2YJquQ5NK4DpCrMyJf6aGnJ4zHCKwmV88lZcax1syfwb?=
 =?us-ascii?Q?v6eJn8KzvEsdFMBEhIZtUsn0F2p84S1DgEM8VgK+sG3YnJzyG/lxQ3nGirE5?=
 =?us-ascii?Q?UYMaE1k/8FC8JvVg5ciO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723e0260-b985-427f-2e54-08dc7356f933
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4168.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 14:14:16.7680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6982
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

> On 5/11/2024 5:48 PM, Jiasheng Jiang wrote:
>> Replace "slab_priorities" with "slab_dependencies" in the error handler to avoid memory leak.
> 
> Nice catch. I would make the subject more like:
> 
> drm/i915: Fix memory leak by correcting cache object name in error handler
> 
>>
>> Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
> 
> Also need Cc: <stable@vger.kernel.org> # v5.2+
> 
> With those:
> 
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> 
> Nirmoy

Thanks.
I will submit a v2.

- Jiasheng
