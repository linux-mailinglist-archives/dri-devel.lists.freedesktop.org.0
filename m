Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC495E796
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 06:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9BF10E055;
	Mon, 26 Aug 2024 04:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="bBRMavYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2065.outbound.protection.outlook.com [40.107.117.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A339310E055;
 Mon, 26 Aug 2024 04:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iELGpS6Dud8Tma2+OOpeXYffPz9fKXleFgshfBkpAx2tV/mKutonVxICPvgxd6wHXr2b8BDDNJEdyqs2ROdyhh2mAm5qvPtK6BbElI+s3z6av2yu34+pQohO+Je0HMncFvm+v0qCtt0AvpUEp0w54cmNzcUGppoA+Zm5tcbCRDVzfDixoWmYLW2CoMo/sVwBGDloHVN/dt2c/h5chtXu3AJq2zEXCZJeMWlryrInHA1P98uvLcTQMGDN39vrF7qqdM5yDzKtJL/TxwhaWwPCxFyOf34MtfVvmvLyZjL41fBsJLqCt/0B3FFjtxMBrxKsCRykL0N2fE4gmvpfIm4atQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fty+S6sOpZLqAM30Aw+mzb/dI+fxel/mqyQKnkNLuVw=;
 b=MMPA1UQzQYWkCfF4BY/ZHF3eVOW58hbefdKnB2PtIKqcWOtS9zaFzCpCfYUZy8cFTUEGLGbwTcmDy0nLWq+kogtAQe9WwM4taiHbv/PrOd4BkPdoMtOTMHYO1mtdMO7X3gik6PPlwY/Bc/qgWoUo/gVX+wAt/zwtLuBgj6u3pBXHSsGAZxxVI7Dq+J1BnfheXfR0nFrVXzbiLqRtJ1SVmGM5Cz8Dqyshj/TdoIzo1CmBGhqKE898nxpbYY2GToocVjm6eoV/FJVemnlBKMAyF1Zx336MZ2RVmsc6sEwyH/o8Bot3MOhtG23ZJjv447yXYlMrf5SWk4gcM0wu7Z6cCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fty+S6sOpZLqAM30Aw+mzb/dI+fxel/mqyQKnkNLuVw=;
 b=bBRMavYGJbO0lC7By7H53Jn3+V+DTFmHvnrooq9OTFmvSluAsv4QJbB4bNlPPQoUvneoSBmnQov+uMSYPe9SnrQW9KYL9X0jd9pHvboNOBns1zqR/PLHue2byR4JwCAkE67yAk3qn5eC+VwlYca2b9ddyH41K2CTLRaBaSps46KqPSxvuO+rCYuESXeIutXwsIFTRlFSHurcJ7ItHwa27jx13mLXQaSN/51piYgKROiUa+F2pZwXHMP2yHgrbpEYYOAUuYNx+Epu0OSBY8RSd0yUztl2s0UL+lfP0R8QZGW37nUiIk+a8WtJ/jNGrp3/onj8SoH6PiWHgTzG4+lMvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB6252.apcprd06.prod.outlook.com (2603:1096:101:c5::14)
 by PUZPR06MB5498.apcprd06.prod.outlook.com (2603:1096:301:101::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 04:15:34 +0000
Received: from SEYPR06MB6252.apcprd06.prod.outlook.com
 ([fe80::d2f1:960e:a2e7:406b]) by SEYPR06MB6252.apcprd06.prod.outlook.com
 ([fe80::d2f1:960e:a2e7:406b%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 04:15:34 +0000
Message-ID: <a57b41ee-e2ee-42e7-9c2a-619202648fbb@vivo.com>
Date: Mon, 26 Aug 2024 12:15:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fix up the misspellings
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240826025522.1474757-1-11162571@vivo.com>
From: Yang Ruibin <11162571@vivo.com>
In-Reply-To: <20240826025522.1474757-1-11162571@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0291.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::13) To SEYPR06MB6252.apcprd06.prod.outlook.com
 (2603:1096:101:c5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB6252:EE_|PUZPR06MB5498:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c7feaa-9958-4dee-9ac8-08dcc585bb18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|81742002;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXZUUVp0QUZzMUNaMk1vWHJDamhPSHBFNXd4bGs1VEN0RENQSEpqSFBGVU9o?=
 =?utf-8?B?SDk0NHFScm5mQTQzck92Y1hXYldwRjRzYldXeEJNTy9lSVBnbWNja0VYOWFn?=
 =?utf-8?B?eTZtWHM1NlhFNXJKS1pkR3luNHhaTFRhZnk5ck8wbjFFU2xLdnBGZTBqek1q?=
 =?utf-8?B?aXRPSmZWN0dHNGZjUzYwTUdZV0FwMnoxZ2xXOWEvR1l6T1VTQnpFTVRJL3Yx?=
 =?utf-8?B?N3p5dm4vTzl5a3JyU2h1RHdDK0d3SDJ6VDhUa3dWcUlodHB5dUpxOHpUNTZt?=
 =?utf-8?B?aUI2em0xeXVyaHc2aTVGbXhxUW5nMGJNYlgxdXFyaEFDa1ExVlNaQjdtdTV5?=
 =?utf-8?B?THdDM2kxN1dxOHNqcjJvenFSV2pQcjZxeDg4d3NJZWUrRTVXMGZzZGFoZzd3?=
 =?utf-8?B?WjljQ3VsNHhIVFRIOTBVV1UrMG1adzRyV2htQWUvamNnekZZSkUwVGE2emIy?=
 =?utf-8?B?ZGx6NDJHN3ZmM2tIQTJGWEtQS1hvUkYvK2pkbXhCQjY4N0pMRHZZRTFseld3?=
 =?utf-8?B?RG5ZM2dXRlFVWDdQclpiRVR6VHAvVlhzOHljdXovSVpMdlFPQktnWTI4WTl5?=
 =?utf-8?B?VzltWFN2cmhDWG9jRmNuUTFDUDBlZVlTVWovNHArR2RoRDZ5dFU0REpaaFRJ?=
 =?utf-8?B?K3lZdnVCVVFEMlZkUnZpME9rb0lEdlFnZGF2Mk1xYUJnSG05a2Yyd2hhaFlm?=
 =?utf-8?B?WE1PMHArbjJabXdrUkp2dkJwTUFmOEU1YitsbVRxMmJlSHE4U2EwM0Ruc1NG?=
 =?utf-8?B?cEZVUS9zQ3pzT1IwUjlaTWFHTGloM05IUGVLWUFrem1oWEo1cmlVNy91cmlB?=
 =?utf-8?B?VmtwKzJBRUFzVUVCTjB2UGRxYXhyMXFFS3lZZWhEekNZOVVWaWduaW5OQWk4?=
 =?utf-8?B?SkJwWXcrTFZYR2NCRjFpSW9WMWRrdmgzREhQdS9lcTRhWmxJQVdIM2RrMTgz?=
 =?utf-8?B?eG80bXhUdmRVZUdnSHlrRE9wT3FFZldNZTFaYUN6MUZnV2cvMThOenVDUXlq?=
 =?utf-8?B?akVJdTZxcXE1bEFHb2k0a3NZUGRsUExaRHZGWjdMTG5qOHdYQUpjRHg5YTVU?=
 =?utf-8?B?NTZBdWJ5d2hneTZNZ2JBU2IwQUU4VEg1cFRaRklXK3poZTJaSW1YK1o5d2Nk?=
 =?utf-8?B?NlcxTGlONjdPclN4bmZUb3ExczNrcXkzdU9TeDFLZ0dOaFZPaHZ6YUlQZWdP?=
 =?utf-8?B?Y2lLeTdHTzYzdWxwd2ppRkJOUFBYb1FyMXEzM3R3VVVpQWdwY2pOOHN4Zmp4?=
 =?utf-8?B?OHUyWEJSNTVOSCtTbm5GZVNjWmNSQjdMN09WSFk3ZWpKMW9XelNPSmVRRnRW?=
 =?utf-8?B?MzdLakp5YlJTME1HQXlwbm1GOHJoR3NHNUY0VWVJYUNRT3JmK3F4N1p1U0g1?=
 =?utf-8?B?SHdmSmh1V2hYOEVvN1dIalQ1c3J6M2NsYUxkTEJ1SCtYQXlxeVVBWnQ5SGln?=
 =?utf-8?B?RDRpaEJwL2Y1UnRsaFB5c2RJZGlzYWlIMFlUblJsTkRiSjhGbDFqS0RDcTlF?=
 =?utf-8?B?SWVKa1lpaC9sb3pwQVZhYWQzZ1I1L0I4WkZCWW5ZcjhZclB3NEFFMVBKdkxJ?=
 =?utf-8?B?N3pldGRETkF6Q29SR0szVmVEZjkxTjY3Y1VMd1ZCcDVienViSkx4cHRzWUts?=
 =?utf-8?B?SWxUbUJ0T0UrZXVoQ1lmSW0rcXhCNTk0ZnNmWlBSZXl5Wi9CWFhNNE8xZHBi?=
 =?utf-8?B?czg5OXdNTXA4TEpUU1ArRU90eU0ya0FjL0NHQnJlSUdSdDFCUDVqME50VVdE?=
 =?utf-8?B?VFNTeElnQ012c2xjQjE0NFRkR1FiQWJEWTlVSlh6bncvMlZFcWhYaHZXblU5?=
 =?utf-8?B?b2V0ZXExQ3ZvalZGUTRYVGFSejF1NElibDhDWm0xb0F3OGtUeE85cnFvZFV1?=
 =?utf-8?B?Vm54T0J3WVJCNUNkWXF4eEs2SXlSK3RzYzJhL0IraTE5T2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB6252.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(81742002); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRmbDl6UkQ4dEhXNElLMThxVEFjMjYrdDRrU0tzZytCTzA5RlNKNWVNbXV0?=
 =?utf-8?B?UmJtM0FiNDNZMlZxVVIxTTVuSW1tQitxU0hpNDlJQ2VxV1RzTWZlT1kvMXM5?=
 =?utf-8?B?ckR0bWN1VFlmTGE3aXd0RHJLOFNFQy9mSm1TUm5qdDdHUnBsSEV6bE9tVm9Q?=
 =?utf-8?B?RVZFaTZNNUZ6cUtuUHFDckJoWjRvNkJnWkloYTdNdXJ1OWdCcFYrdjBwNCtH?=
 =?utf-8?B?NFF0L0Z0K0lndFAzT2llSlVNS2xYTGhXdFpDbXlLMGRPVXI4Tjl3YVBTbVVa?=
 =?utf-8?B?QXVSdERBVHUzZ2MzU0Q0V0ZOZkJiTTdxVzUyZTVWZ1lEaXJXMkU3amo5NW1F?=
 =?utf-8?B?VDM4U3RlTXVHVTN1dmFhNVBlQXk2ZmRlYUM2cHZWU1dmNnBsVW5FN1BpeTYw?=
 =?utf-8?B?c3cvU0JnU1VWVDUxaUN2ZjFBUWNEMVV2T1BjTFVyMlFYUGR0cFBwRm1wUUJN?=
 =?utf-8?B?bXVoZCt6UXlKRHROS0hHdkt1aDRuT0FDMy93T29uTmdyV09IVWdCdnEwZXZN?=
 =?utf-8?B?MmRYTUxraGZnL1NOeGFDaGpuQjVRajJGWHlkdnQxYkpOOVVxVDNQYmM0ZXJD?=
 =?utf-8?B?Sm9FaS9XVGNCTjFGT1NNeTE1c1RiZ3hSeGh0TmdwRlBpS2MyZm41b05KRGVF?=
 =?utf-8?B?Y0JXWEQzTjRneEdlZ29PMEQ0MWlXVmtoYWRwVVQ1VDNSRTBWRWxldGNYNEhv?=
 =?utf-8?B?Y00xRzNKMVh3VzdVVUFOaVJRdWhkWDMxT1Vva1Q3VC9RRG9yUjNiQVkwVDJQ?=
 =?utf-8?B?RXlkYlN3bCtEdUVLV3NYVnZKeUtBRGVpYXY2bVIyWjFJQmJOZGRrYUoxam5T?=
 =?utf-8?B?S3Y0aWJOT2JOWlRhNFNLNUgzTy9GbncyR21iK3dtZ2FvS1hUbE5YYVJmRVFU?=
 =?utf-8?B?ZU9wMXhEWVhReWVaTmhtVXV4WHNQZ3hFeWhHL3N6TE1KS1VkQWQwektVWHNz?=
 =?utf-8?B?clJEQXIvRnVmaG5XRkpBVXFnNnhPMWdaNERqYTV6R0NJQ3ZtQnkvaStHL3lm?=
 =?utf-8?B?ZHBXL0k4ZDdRMGlYYzFYdy9VOEJ2QWl2RUd4MndjSTVKZzI5SlA2bFVzZkky?=
 =?utf-8?B?RUNlK3VEUWl6VEd6REVEZ09PWjlOelA1VFEzYTRkc0VpTm9OcmswM3ExQXJL?=
 =?utf-8?B?UnZpZEFLTlpScnBmamsyMzhoZCt6TVZ5OXJmVkFKa2RQRnBNYXVNSVBWTGZK?=
 =?utf-8?B?VlFHU0JTVm95amZ3aTRNZUZodXd3L1dHVkI0UFBLMGhDM2t0bjBFdVRQY2xQ?=
 =?utf-8?B?aS9qZHpWYlNQaDVGc29WVDI2Nkx1OGFrejNuMGgvNFE0dWFnVllNZlZPcnVO?=
 =?utf-8?B?VFo2R05qQlZvb2lVMjZySzlISWdDRm95eVJRc0NwcDU0TEVzVmZ0dVhFd2Fy?=
 =?utf-8?B?aGFnb0VUcFRiWjVjTFBHaXhHcGlnV3MyampUalZOSVZJMDdNL2d5eStSVzZT?=
 =?utf-8?B?ejZKZmU0bklQZElMMVMzSm5HTDg1bkdSc3NGMStCR293MUZGYmJQNk9BNFdM?=
 =?utf-8?B?WkdEbGhzQmpqMytJcGhwZWNyMmdleXh0TlJMZDFPRjU0d3FxQlRjeXlKbmhX?=
 =?utf-8?B?bEQ0OGJ6Zk5icEZxQlJWVUdqM09iK3JKZmRERThvc2lIS2J4SUJJZFlXV2VZ?=
 =?utf-8?B?YlBVeW9JQzd6QkFQSXBBY1ZvR2lBMVY1NHpHYmdDWUsrZm43ZVFyN01IWUll?=
 =?utf-8?B?c3Urc0h4QnNSQ0FvOXdpc0g0ZkUyTjcwLy9Rb1JlY2NMVjRJQkY4TFBpUUJq?=
 =?utf-8?B?SVpqM3Zub0w1Y01ITjI4QXNLYlF1NUlUUWx6aGVRNEk4dXFQYTJYT0pmM1N6?=
 =?utf-8?B?ZGlLKzk5S0Fjb0lTcmtCUG9yRWY4R1JJZUxiQU5iWjd3WFRJeUd5SkRQMVdR?=
 =?utf-8?B?RmpDSHorc1NDVzB1U00zbit6QjFWWVlUUm5RSzFPU1ZSR2MxOTlhSVFkZzFB?=
 =?utf-8?B?cFcyWjNITFl6OGtkUjdRRVRtSnZtODRsWG5reW1WLy9iOXNwOTlHUW1NZnhz?=
 =?utf-8?B?amdZbldzVEgyajVGWDIra0YxQ0cyWEtUSTZSM2FOcHJYbXJ1N0NEUW9rd0FO?=
 =?utf-8?B?QkZwcGNhbTJPQktBeWhLaXc1N3htYVhCaFdDSFlVZGc3Y2ZzenJCbW1qNHFW?=
 =?utf-8?Q?uKwltoisQCFy/V1WYSkaWSgZL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c7feaa-9958-4dee-9ac8-08dcc585bb18
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 04:15:34.1641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CY9cA9FjMRStIZyTFHM8zGuJ4tMgocvJ/iZUxHvhZBECwY1hiaNF+o8MbTAeU8dkgFPOtdrAFebqgSPGESNdpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5498
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
Reply-To: 11162571@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, please ignore this patch for now.  As the wrong subject line.  
This patch will be updated later.

在 2024/8/26 10:55, Yang Ruibin 写道:
> Hightest is a typo. It should be highest.Please ensure
> the consistency of variable naming.
>
> Signed-off-by: Yang Ruibin <11162571@vivo.com>
> ---
> Changes V3:
> -Updated the ignored misspellings
> ---
>   .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c    | 16 ++++++++--------
>   .../amd/pm/powerplay/smumgr/polaris10_smumgr.c   | 16 ++++++++--------
>   .../drm/amd/pm/powerplay/smumgr/vegam_smumgr.c   | 16 ++++++++--------
>   3 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> index 5e43ad2b2956..e16efc44df88 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> @@ -1014,7 +1014,7 @@ static int fiji_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
>   	struct SMU73_Discrete_GraphicsLevel *levels =
>   			smu_data->smc_state_table.GraphicsLevel;
>   	uint32_t i, max_entry;
> -	uint8_t hightest_pcie_level_enabled = 0,
> +	uint8_t highest_pcie_level_enabled = 0,
>   			lowest_pcie_level_enabled = 0,
>   			mid_pcie_level_enabled = 0,
>   			count = 0;
> @@ -1054,27 +1054,27 @@ static int fiji_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
>   	} else {
>   		while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
>   				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
> -						(1 << (hightest_pcie_level_enabled + 1))) != 0))
> -			hightest_pcie_level_enabled++;
> +						(1 << (highest_pcie_level_enabled + 1))) != 0))
> +			highest_pcie_level_enabled++;
>   
>   		while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
>   				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
>   						(1 << lowest_pcie_level_enabled)) == 0))
>   			lowest_pcie_level_enabled++;
>   
> -		while ((count < hightest_pcie_level_enabled) &&
> +		while ((count < highest_pcie_level_enabled) &&
>   				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
>   						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
>   			count++;
>   
>   		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
> -				hightest_pcie_level_enabled ?
> +				highest_pcie_level_enabled ?
>   						(lowest_pcie_level_enabled + 1 + count) :
> -						hightest_pcie_level_enabled;
> +						highest_pcie_level_enabled;
>   
> -		/* set pcieDpmLevel to hightest_pcie_level_enabled */
> +		/* set pcieDpmLevel to highest_pcie_level_enabled */
>   		for (i = 2; i < dpm_table->sclk_table.count; i++)
> -			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
> +			levels[i].pcieDpmLevel = highest_pcie_level_enabled;
>   
>   		/* set pcieDpmLevel to lowest_pcie_level_enabled */
>   		levels[0].pcieDpmLevel = lowest_pcie_level_enabled;
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> index ff6b563ecbf5..d785cc6468ef 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> @@ -1050,7 +1050,7 @@ static int polaris10_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
>   	struct SMU74_Discrete_GraphicsLevel *levels =
>   			smu_data->smc_state_table.GraphicsLevel;
>   	uint32_t i, max_entry;
> -	uint8_t hightest_pcie_level_enabled = 0,
> +	uint8_t highest_pcie_level_enabled = 0,
>   		lowest_pcie_level_enabled = 0,
>   		mid_pcie_level_enabled = 0,
>   		count = 0;
> @@ -1114,27 +1114,27 @@ static int polaris10_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
>   	} else {
>   		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
>   				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
> -						(1 << (hightest_pcie_level_enabled + 1))) != 0))
> -			hightest_pcie_level_enabled++;
> +						(1 << (highest_pcie_level_enabled + 1))) != 0))
> +			highest_pcie_level_enabled++;
>   
>   		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
>   				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
>   						(1 << lowest_pcie_level_enabled)) == 0))
>   			lowest_pcie_level_enabled++;
>   
> -		while ((count < hightest_pcie_level_enabled) &&
> +		while ((count < highest_pcie_level_enabled) &&
>   				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
>   						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
>   			count++;
>   
>   		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
> -				hightest_pcie_level_enabled ?
> +				highest_pcie_level_enabled ?
>   						(lowest_pcie_level_enabled + 1 + count) :
> -						hightest_pcie_level_enabled;
> +						highest_pcie_level_enabled;
>   
> -		/* set pcieDpmLevel to hightest_pcie_level_enabled */
> +		/* set pcieDpmLevel to highest_pcie_level_enabled */
>   		for (i = 2; i < dpm_table->sclk_table.count; i++)
> -			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
> +			levels[i].pcieDpmLevel = highest_pcie_level_enabled;
>   
>   		/* set pcieDpmLevel to lowest_pcie_level_enabled */
>   		levels[0].pcieDpmLevel = lowest_pcie_level_enabled;
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> index 34c9f59b889a..3e73f380a591 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> @@ -878,7 +878,7 @@ static int vegam_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
>   	struct SMU75_Discrete_GraphicsLevel *levels =
>   			smu_data->smc_state_table.GraphicsLevel;
>   	uint32_t i, max_entry;
> -	uint8_t hightest_pcie_level_enabled = 0,
> +	uint8_t highest_pcie_level_enabled = 0,
>   		lowest_pcie_level_enabled = 0,
>   		mid_pcie_level_enabled = 0,
>   		count = 0;
> @@ -925,27 +925,27 @@ static int vegam_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
>   	} else {
>   		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
>   				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
> -						(1 << (hightest_pcie_level_enabled + 1))) != 0))
> -			hightest_pcie_level_enabled++;
> +						(1 << (highest_pcie_level_enabled + 1))) != 0))
> +			highest_pcie_level_enabled++;
>   
>   		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
>   				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
>   						(1 << lowest_pcie_level_enabled)) == 0))
>   			lowest_pcie_level_enabled++;
>   
> -		while ((count < hightest_pcie_level_enabled) &&
> +		while ((count < highest_pcie_level_enabled) &&
>   				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
>   						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
>   			count++;
>   
>   		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
> -				hightest_pcie_level_enabled ?
> +				highest_pcie_level_enabled ?
>   						(lowest_pcie_level_enabled + 1 + count) :
> -						hightest_pcie_level_enabled;
> +						highest_pcie_level_enabled;
>   
> -		/* set pcieDpmLevel to hightest_pcie_level_enabled */
> +		/* set pcieDpmLevel to highest_pcie_level_enabled */
>   		for (i = 2; i < dpm_table->sclk_table.count; i++)
> -			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
> +			levels[i].pcieDpmLevel = highest_pcie_level_enabled;
>   
>   		/* set pcieDpmLevel to lowest_pcie_level_enabled */
>   		levels[0].pcieDpmLevel = lowest_pcie_level_enabled;
