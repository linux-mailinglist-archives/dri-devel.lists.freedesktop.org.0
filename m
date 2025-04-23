Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE9A980B6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9786F10E648;
	Wed, 23 Apr 2025 07:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="I0p6AZX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011019.outbound.protection.outlook.com [52.101.129.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3010E648
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:26:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhHFVH1fbgfnZHn6ytYV34rKi/hOSrUgbZydgJZDANOfJUX6DF0dhyxmA4BLpnRk2q+7FJ6WK7xyZu6ImjxVbt+wQrhaJMyJG0wlXxWBhNiqUuqTdVF26zYq/9ZWBPAaVrKW1Buj1V9DTW+eRDoHNaFnB8Sm6LmRO+7oXKUz67JsF44uDH/2RepTSDUwgfJQE2DixWwr6E10htQ7MCaXns3d/49sy0Zu195LJrm0OwtAC56lNGLFwU7tqXRkquhdZzorJCKAdHdoQvkPVqYmQ1iHUENM94QAEDop/G0kZOLzXKaqgFBMAmE+GumWt8SniPpnPUWo1yk8JYmk8BMtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpjC85fKbIauO6/lagsS036EZ/wSOVGT12MmHNZWQfU=;
 b=MyRU0ONcDiTAiboMrfKYzXUSZoCGr+nALFy7T/b+PcJ71HOzKWFs7kw1IKB1aiM2WHtQBvRMBAmzdlH6jdYNJxjSFj83GzX3XbjQHvXQZKWrBywSWFms0a5sQKMQxs8ZK4oeaFIxCtlvobMqr36SLZvHoKLjvCSRW2pK7tNK5CfCsnQ9vayXzy2YfvDFIgkX6iJQB/V1sEWghSGE54Z4q8BdlU1beDmsk158hS1sIbGrLmB8Rh3GF15D+cKAnaYqobZtw1UIfzbYb+aHzn9chdfdMT3z4zhadnnp3cIILo0Q82q2sjxWDjCQHx3Tp6bjtw8J1CYpa2XqU3GTPkRBfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpjC85fKbIauO6/lagsS036EZ/wSOVGT12MmHNZWQfU=;
 b=I0p6AZX1XcGmA481rtq7aiuxhCivGTQ1eadAew58OA31SRdVd+L6nokrAVLlT3dXxYOKgeVfNJT4xPTsGSwcf7TkacagLyfj3G3BwfURH4J29GhNCaR+YlPA5gw5do9VG2JzB1JT5DKHJSejiCLgtOwNZLGpi+ilrKxDZvsQ5e+nXWhOMtuUuxGDo/v9jRxxjNDuLmmMNpj7r5luZF/BXfpdavd1TlCDXos9rmMXBQAndX2YjhugXEmpz8SC7HDux30nFFFOIaVJsDw3PqEgS1ZBR03gBkffCW0C+XJelqf8wb/ZtXnKpfSqm9bN6QGFuuCioe6ekaGjg8j8uM2FYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB6853.apcprd06.prod.outlook.com (2603:1096:405:11::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 07:26:41 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.8632.036; Wed, 23 Apr 2025
 07:26:41 +0000
Message-ID: <c752a31d-e7c5-49bf-8722-8eeaf582a4d1@vivo.com>
Date: Wed, 23 Apr 2025 15:26:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
From: Huan Yang <link@vivo.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>,
 Bingbu Cao <bingbu.cao@linux.intel.com>
References: <20250415031548.2007942-1-link@vivo.com>
 <20250415031548.2007942-2-link@vivo.com>
 <IA0PR11MB71852A481E8A99C9380C7317F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <63297d3f-5e37-411e-8150-108a03a01a89@vivo.com>
In-Reply-To: <63297d3f-5e37-411e-8150-108a03a01a89@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0080.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::10) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: b15ffd25-6c38-4147-0d4d-08dd82383167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkVwN3NKSjQ2NWQvd1VDeFQwU0xEeEpuNjNYMXNuREorbi8weTJEaW5qKzZm?=
 =?utf-8?B?UmRvS04yWE9ldVhtYStPaVdsTXlxRUlvK3VkbnVkYmJqS2h4Rk9KenBoaHhp?=
 =?utf-8?B?S3hPUFNBL215ZW1BckRxVytrSkg0bFVsOEg5Tm5CNEYwbU9CNFRTcVVTZ05Q?=
 =?utf-8?B?T0RZazdVQ1pKakpVdWhaV1Q3TEJhZytnTWRhZ0RuRlNwNSswbklRb2JNeTl6?=
 =?utf-8?B?cXcwbk1TYnZPcnVyQndEZzF6MDlxV0lCUnhsdHErdnBhL01WazE1QytFUzZm?=
 =?utf-8?B?YU1JbmVmZVZKeXMrUmNKMms0bmcxcEtHWlBaNTh3QnZmK2ZMQ2RJUCs1eDZP?=
 =?utf-8?B?YnVqbHdEZ1VHOU51MUVJcmdKaDJKeGlVUHFKRG00VGxFb0NQaEVaQkV4SDUw?=
 =?utf-8?B?S2R5TjNxUzgxd2Q3cFBBZFN1SC9GajdMZk0yaStLZjExNmM0bmVORzExb2dT?=
 =?utf-8?B?TE0zbldJRDkzTnBoSDZUZ1E3U01zaUt5R3JiekRtaTNzbXdHdXNhZjhGRGdE?=
 =?utf-8?B?MDdKNTE3STViZ0dKOUZjU1RFbnVmZzdQZTJGZC9CZWZrbU1UUU5lZDIvSDhN?=
 =?utf-8?B?UmE4TDhSd0lrMVplcWFvSlh6WWxuV2ZnOVFOV1htYjZGWTdtang0Z1BiNDJP?=
 =?utf-8?B?KzE4WVlpbHVsazZTbnV5Ymcwa2pueXpWcHpWU1pJSGhPWVBISHgyMURBRkxu?=
 =?utf-8?B?ZjBhR2ljQVduUFpnNGN4dFVsNVpGWlRxbS9kYml6OVNsNFVCLzVjUDhiSlk1?=
 =?utf-8?B?eHpNRDhPcExLWWdvTkM2NlZZUHd3dG01bWJpU0g3V3hVNzhZbXZTb1cxbUx5?=
 =?utf-8?B?dDMrL0J4Nm5od2ZiYkJBRmZ3U2RhTWo1RGExVUordHFGN0hTZDA0Z2dIL0pK?=
 =?utf-8?B?U3BLZTBvN2NyMGFSQ0pIOWh6MkJYUkwwdGdRb0xiZlBJQTE4TWhsdCszYlZB?=
 =?utf-8?B?NTF3UjRTOGQ0dnV1QTVNVHdOVHhoWEFwREVCSmltS25LUVpBTjgrSmkzVG96?=
 =?utf-8?B?TG5RNGNwbmgvMTJveUU2MG8wWmFia3JsSm9PV3lBRHFwcmFiai8weVBHUFpM?=
 =?utf-8?B?Njk0K1NucW5qbWtBeEgwNC8xb3QyQTAybUdQdmQ1Znc2YlpHRVduN1c1cEE2?=
 =?utf-8?B?N0x2OFhndGVwVkNvMHpaOEpCWW5NRWdiTVVaTENBMmV2d2c3NlJOMFQ1eG4z?=
 =?utf-8?B?ZHM3eDhpakhYcGZIUlR5MFRhNW9PMHY1VHVrY2dJcUl4dmwrNFIvNjVPYWRy?=
 =?utf-8?B?OW9VMTBKdE9qbmoza1N2MzhuVG5oczRVNU9ROGk1cmJRa0JQWUI3eDhmaXNr?=
 =?utf-8?B?bis2VVlCcFBzdjJiOWtVRjZReFM1QXFPcEtiOS8yR2hwbEpxVGV4dXk0eW02?=
 =?utf-8?B?a0VJTDNuYzdGZ0RPbUp2VWJmc1RGWDBqNzBZN3R3Z3JDY29vVGJ3TEQ5dU9r?=
 =?utf-8?B?dlhQZHlVRFE0YWxBOHdnSXVBT3V6RHFmaElIK2VVN1A1VHlINmVpVHY0NlJT?=
 =?utf-8?B?RTdvTnk0QzNnL2VRcytpM2M2RzlyVGRvaEM4b3NQY05nNkI0Q0hKRXNncDVC?=
 =?utf-8?B?dTRMMjZMQUJYUG1VVndMbUFJV285MXNqOVhaV3VrQm1PWEhDd2c0Z1NlSFpQ?=
 =?utf-8?B?dUJEeEpwbU5uTHphZXQ1aFBpQjhKYVhyMmFjV3R3eHNTZ1lMNk5idVVubTlL?=
 =?utf-8?B?Wmh4QVdKcjJiOEpSbWtKRmpIbFNLY1MrRmpVU1NmVU1TTVhYeFNNSkRmMk9W?=
 =?utf-8?B?ZVQ0NkpIUTJrekxVYUNiWXdiWHJGWHVZemgvQTlHSHdRMS9WWTF5SEVMWDFo?=
 =?utf-8?B?Q1ZkandZdXlCYy9Xa2dsZy9RY2FVOGxVdnRMU1NhNTVnajJNcXZqWVVkSjNF?=
 =?utf-8?B?Y3BUaWpVUDBvaDE0a2RSNmRscnQ5R05nYmJnZ2t5K3BzbHFSd3BiRWNNTDV6?=
 =?utf-8?Q?vd7+a2hV3pie4omqtUZdlceGKFljsKq0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkpWcHNjSFN6UEdmQzVxZlZaaEJUTllvUmRTeUs1UHpTVkg4NU9mcmZwcWt0?=
 =?utf-8?B?dTE4VmMwYXVkVmVIT0ZodXVYbkxuNFljWGxkVC9mOUw1d2lKbWJXcDRiUE5Y?=
 =?utf-8?B?SE03U25qQlNMQm94d05oR3F5ak5DLzFRQU83M1p0RDBEdnNkVXpON2RCYmdO?=
 =?utf-8?B?VzJWZ1lHb0xWVWNhelVwZTljbUJWTzFNL2NYZ0hwZ25oaWRRNncyNEZEVktD?=
 =?utf-8?B?M3VZbmRadkQ1WFpIRFFCOGliSk5tb1BSRk54SktJTFludzZMYldsaUg2eXM0?=
 =?utf-8?B?YUZ5K1RlejhnU3gyOXBQeDN2ZFJSMUpxcmk4ZEhUZ0R2dWFRVDB1dk9DYUt4?=
 =?utf-8?B?NVg4UzhJZVN0NEpKL3lBcFdGd1ZQSVdkYmg2a2RnU3hzVmk5ZkFERlA2Vmli?=
 =?utf-8?B?U05DVGE2STM3a3FjVW45bUZKZXZOalJMZ0V2czhZVW1OTDZ1RHJXbGRBTnM1?=
 =?utf-8?B?VXp3QWh5T1lLNzhoTXc4TkZRb3JqZi9XZ2dzMHJsUldkV05tZkM2T2FUbW1z?=
 =?utf-8?B?L0hiQjhGM1ZMUmM5Unpialo4WE51VnF6Mk5aVUY2azZENENycngyWFZGRlFx?=
 =?utf-8?B?VExGLzNGV1VtbjUrWEtLaHg5Qm5jMENXRUtwUVZkTGU2cDBrSEF6RFFhM0F3?=
 =?utf-8?B?cEovZUZLOS92SXJxcnA1Zk9GLzlFcG5IZEdJMzJHSVdLNVhHaVprUE53ZmNK?=
 =?utf-8?B?Zld0cGV2a0RxaVdBZjVMWlpETVhFSDhpRThTYjRabjRrRElWcERTOVp1ZENS?=
 =?utf-8?B?ekNSUzFLWThmL0U3am9aK21YZlVFOUk2ZDZpSEtDaTlIZTQ0b1lvaUszdXAx?=
 =?utf-8?B?d1JWeUd1aUV2c013QzB5TGdTNWk5d3dOcVJ4ZitGcitGajdiTCtHK2s1SmQx?=
 =?utf-8?B?c2FYb1hYeHM0UWxtQnZFblNqTkZUSFZSRGVMOEFGSkZIQlI2L2ZtQjRsZEJI?=
 =?utf-8?B?bk96M2htNTZjdmdBbU9lbXNRVmFDMUc4QWdTZGd3K3ZuK2k2R1lQbmZCWU05?=
 =?utf-8?B?Z1RFS0dZKy9MMzl5WjlPcGxHbjQwK0h3eXhJeG1lbGg5TnVmT0ZKbjBFYk50?=
 =?utf-8?B?L2xlT3o0cENOam9HMWl6Skp3bHpaaHNoMU9BcnM2NmFUSlE1SGF3Vjh1SXpN?=
 =?utf-8?B?UHN2dEJiT3d4TG53MG5zY2lrNVYzbll3Unk2UG1maGpuUFhXbWJwTGd2c1JR?=
 =?utf-8?B?L2lHRlBhaUxyNmJoYm1sTjJhR2RxZW5KMjExdGRadFBYMVhkSU9DQ1EvRTlH?=
 =?utf-8?B?QnVzRmg1Z2IvaFJtL3ZlQ0NvL3QwQjg3bGFxU0lCWE1yWm5SeUlFM1VZcU9y?=
 =?utf-8?B?dkE3SHRERGxOTjFnaTVNZW9DSzZDMzRFbGUyck55cGNwODUvY3ppRlh5Q09W?=
 =?utf-8?B?ZEMxbFdsL3lhWWpaT29OMVl3cGlWb2xJRVRmeWd5aURVWlFQYTdVejN0Uzlt?=
 =?utf-8?B?SnpZNldteXNrTFp0VTFjcVBXbVg0eDFLQ0l3eXU1MGFrSkE3dE8xZzRaZDlW?=
 =?utf-8?B?a1JjTWcyTmtTNkR3eDYwTVdiZGUrL0pUbzR2MW42aFpxV3NtSGlKS0x3RWU0?=
 =?utf-8?B?K2lQNEhLRjJHVFpPRnhiVi83VTRNKzNvb0RVNFVnMFVQbjRpd21IN0ZDMy9q?=
 =?utf-8?B?VWFWc0MvV0N3MmlKQjZlOW1iNHhMRm1wcXFJaFR4WXdpVVUzcEdYbkdlVVkz?=
 =?utf-8?B?OGIxdXB1ajJNMDlYWE9wRHFiNUkwWTZLdHV3bTU4dDFNckxvYWQrYlVYelhr?=
 =?utf-8?B?NVBlTUE4emZ3WnN2SnBCMEd1OExMVWwrWllSNG1BcGhmc0JqNjl3RnFySS9G?=
 =?utf-8?B?LzFsQnhGSS8rUFRMblJzMFFiVVBuNkxNeU5BRUg5Z1puZ2tNZ3c3RHF3WEJy?=
 =?utf-8?B?T0F4SHFiYlo0WFpRa0hLMFlXSkxybUlXSWRyRkk4RDZNWjM1ZEVmcHRlODlz?=
 =?utf-8?B?a0N3Z2JDY0lwUnlPQmVySCtiOFhscDdaejY3RURHMkhhYit0NEhWTXN5bnZh?=
 =?utf-8?B?MkFqeHRoODZMSFlpcEc1REp6bTFIcHpsQVo4dEpsSmZnaklvTllpQWhaN0Iz?=
 =?utf-8?B?VTR3Ui9vcnQyL1pPWUFRNVYvSVdqNEwrck1OZEdMWGVyYU1NRHBXbUN1TUcw?=
 =?utf-8?Q?c1bmeBgXLHzS1kIkAPOd5N/nj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15ffd25-6c38-4147-0d4d-08dd82383167
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 07:26:41.6570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9oP+wM1K/Sqcr+GTkm14Ut4njt+nYsf2Ip7avB8Tug4Y9GXfCmezXWyP6K+OA68IVIsKLNcdVkQjuYpIG1LCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6853
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

 From 38aa11d92f209e7529736f3e11e08dfc804bdfae Mon Sep 17 00:00:00 2001
From: Huan Yang <link@vivo.com>
Date: Tue, 15 Apr 2025 10:04:18 +0800
Subject: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"

This reverts commit 18d7de823b7150344d242c3677e65d68c5271b04.

This given a misuse of vmap_pfn, vmap_pfn give a !pfn_valid check
to avoid user miss use it. This API design to only for none-page struct
based user invoke, i.e. PCIe BARs and other. So any page based will
inject by !pfn_valid check.

udmabuf used shmem or hugetlb as folio src, hence, page/folio based,
can't use it.

Signed-off-by: Huan Yang <link@vivo.com>
Reported-by: Bingbu Cao <bingbu.cao@linux.intel.com>
Closes: https://lore.kernel.org/dri-devel/eb7e0137-3508-4287-98c4-816c5fd98e10@vivo.com/T/#mbda4f64a3532b32e061f4e8763bc8e307bea3ca8
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
  drivers/dma-buf/Kconfig   |  1 -
  drivers/dma-buf/udmabuf.c | 22 +++++++---------------
  2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index fee04fdb0822..b46eb8a552d7 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -36,7 +36,6 @@ config UDMABUF
      depends on DMA_SHARED_BUFFER
      depends on MEMFD_CREATE || COMPILE_TEST
      depends on MMU
-    select VMAP_PFN
      help
        A driver to let userspace turn memfd regions into dma-bufs.
        Qemu can use this to create host dmabufs for guest framebuffers.
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 7eee3eb47a8e..79845565089d 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -109,29 +109,21 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
  {
      struct udmabuf *ubuf = buf->priv;
-    unsigned long *pfns;
+    struct page **pages;
      void *vaddr;
      pgoff_t pg;

      dma_resv_assert_held(buf->resv);

-    /**
-     * HVO may free tail pages, so just use pfn to map each folio
-     * into vmalloc area.
-     */
-    pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
-    if (!pfns)
+    pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+    if (!pages)
          return -ENOMEM;

-    for (pg = 0; pg < ubuf->pagecount; pg++) {
-        unsigned long pfn = folio_pfn(ubuf->folios[pg]);
-
-        pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
-        pfns[pg] = pfn;
-    }
+    for (pg = 0; pg < ubuf->pagecount; pg++)
+        pages[pg] = &ubuf->folios[pg]->page;

-    vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
-    kvfree(pfns);
+    vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
+    kvfree(pages);
      if (!vaddr)
          return -EINVAL;

--
2.48.1


