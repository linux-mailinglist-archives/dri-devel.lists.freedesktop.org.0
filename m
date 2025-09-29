Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7EBA8766
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 10:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56ECB10E3CD;
	Mon, 29 Sep 2025 08:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PeBssM+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013000.outbound.protection.outlook.com
 [40.93.196.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F25210E3CD;
 Mon, 29 Sep 2025 08:53:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qP08UgcE2snxDUdowLO0mV82xO+5TZI/791miZERBw0TxTtvkxveJDMQxqZhFnjw80KDZ2T2bJlQBuFugKtRoDp51j6mNl8+S53gYOIKcYJJWAeT0VBSOSH2iFHEfDE1Oxqsc+MnSJrv7sQbMg85GUmD75XBy/Aj0slxRnN64LhEHnTsW/srPuxoU7f3r5LtU8DRWIKD1WTc9eF869CNDZUSmG8ujd4YuSU9qL0ltSbfFXg73wTdW2fxbilZ2uUa5F80o2QcdokNFy1zo7sNMElgwfbx7gF6FG6IdYKzX+c79MDoiRKlSTXAcRna3VFa17m4xnXdHZRnN/8ye0fwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N50kw8VBELAk07Uv6wioI7G8I1/pG4s9I7I6LQtZ3ec=;
 b=qtSJHXZDIDecEh2ISIfVPYYtlLp+yqGg4phaTHkIHtVFEGpW800mpGupMOOHO4+1iXgdn8GjYjelpWEmDTzezM+CSpPQhHPE/qYI7GGLLFvzKM8kYCUKm1+Uy9uebJCplVAJcfSIYeBCuHKgjmUKcq74jmJYw1OWHKtCNp8MslIVlMKJ4sPXjtaz+r2DyhdX6yRZmkal10BzTA2lce3zCM56Asfx5Ux+RQFL7isx000NDVFFI0zjZel2W8ZrpEY4yv3xNIPsnZYizquJVdISF5FJABCnn1VhiuT1aC49ezYcFZ1hwaXvtGVn57Gb+PFi8eR/f9fpb1PEARe7H1Eilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N50kw8VBELAk07Uv6wioI7G8I1/pG4s9I7I6LQtZ3ec=;
 b=PeBssM+CK40ooWt9OLFrE390rhplUogOvmaYGgzF8e8U6Sk1Cd+LzWl3wqkUbspR2G1tSax3O9gGYCitmPPI57YvHVZwk4WvVpLyoDgDa3CawUPvwEQaS4sjASTJhkeafr+PLGmlv+5Nn2+WDX6u6ByqonyUzJchIqv4iR3qr2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 08:53:30 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.008; Mon, 29 Sep 2025
 08:53:30 +0000
Message-ID: <3c24d55c-76d1-4ba4-9942-fd5d85f9daca@amd.com>
Date: Mon, 29 Sep 2025 04:53:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 03/20] drm: Factor out common color_pipeline
 property initialization code
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <20250917-mtk-post-blend-color-pipeline-v2-3-ac4471b44758@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-3-ac4471b44758@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0052.eurprd09.prod.outlook.com
 (2603:10a6:802:1::41) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MN2PR12MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: c00d9268-fd57-4abb-9f87-08ddff35a96c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHNjNlg2QWowSC9SbU85THFQUnBpZENUd05OaWlucUFMVnNScWhJbTlUWVFT?=
 =?utf-8?B?aUZLemxyVGI4ald5QjczWWhHeDRPcTRZZm9TdUl6c1pzS3hrQ3hpOUN5V3RD?=
 =?utf-8?B?QU5MNkZMcDJHMVJjY1NLSHVZbVFiZG9JMHNsako5VFNKOHJIWmRxOE5nQ1I3?=
 =?utf-8?B?a1QyTWJseC8xeDR3SnNqMG1sUFBUZnJObHFZdUZCaEhGK1cwbGJleEpVVExR?=
 =?utf-8?B?YTZSMUd6RUhiSXBCamdEU0dFd3lrY2JRc2E4MG9LMlJBM2NUNmFTV3hsL1lC?=
 =?utf-8?B?bmVkUUZiOTFaYXBDQnhpRjJIK0lXZ2swdFhMWG9kSjgzYnk4dTB6dnd2NENP?=
 =?utf-8?B?eXd3N3NUZkh6MFZTUTAyNnhWSUdyaE84aXVZUjcyVG11ME1DK2lxN1Y0aW01?=
 =?utf-8?B?c2lTbzlvWitzL2p3cVJsb1lla1NFMWQ1TFZ2Z3Y5N0Zqakg3UGpqOEE3THNY?=
 =?utf-8?B?eFc2VmhBVFVrRnQ2M0xQNjRkODN5NGIxUVdUcW94NUlKVW94eFZTV0djcjZO?=
 =?utf-8?B?RjhrNStwN1I2RXBVZHViRk1kSElBT2JWaHVuanFtSmZDbXpCMmFlNnJpa2sv?=
 =?utf-8?B?bFpDcXFDWEhRQjdDQ0RDQ3E0MDk0cXJFQzFhNUNlNWhod2MyMVJ5MDdkMlFr?=
 =?utf-8?B?ZjZXbmZkc2Y1RFZFQkhDUUJtWmdhZnRRaStSSFRsS0E1bUNBb0FDY0ZDSWxn?=
 =?utf-8?B?NFpqc05aODgvTDhMMVU5emFOOTdmeHIxaHFWTktaTEVJdGhIcVd1TVJSKzhp?=
 =?utf-8?B?YU1CY0lzQnhNaHMvK1NRd0R5Y1JVVlFaNXNrcUdMM2d6SDNhRnc0V0JGWml2?=
 =?utf-8?B?cVpUOFZJM0tyMFZFR3ZudnFRNEt3NjZpZ2JteGNuTWcvNjdOZUt5VEV5RzhU?=
 =?utf-8?B?Skl5Zm0zSXd2RHk2Kzd5WnA4SVJWMldZVG1ab3JBeVZPeE9qMGpFekN2U3p2?=
 =?utf-8?B?NU93RnR4K3AyRUxDRVpyV1NhcTZCMWlLbHdXbkVnSHdQU0x3ek45ZHVQMG9K?=
 =?utf-8?B?Vzc2cmZ6NDNkcFNnR1lJOTFmQk1uL1JVNlorS0FGeWdJTFFNbnhFbjB6Wkx1?=
 =?utf-8?B?UzBveWQrM2Q2b3JjcXAzYlkwZFl4TlJieFBZWUZhOEdXZzBSOTlJc2M5N2Q2?=
 =?utf-8?B?MG8rbHJ6RTNFa0VhbUxFVWZtM0p5SDhWRXEvRlhpMHF0Qk5RZ1JYc2JscU5q?=
 =?utf-8?B?RXhrbUl1bEIwa2pHS25GaTlSN1JHY0NRbituOXZSdXhaZENwK05qLzczQWdX?=
 =?utf-8?B?aWc5aU5UZCtwV2RxS0Rsb3VaUDBLSGtlUHR0SWpic1JESFNoM3llQjBZaEF2?=
 =?utf-8?B?NmdpaHNBOXJHNEx1WHZlZWlIQ2RDS2ZnZllYbnBXRytLUnQzZm90NnhUWFR4?=
 =?utf-8?B?ZWdlU3dNcHJlRlljQ1JwZ3pVM2ZTMG1xYUEyY2hkWTRwUEZpK0E4eGJDMlNs?=
 =?utf-8?B?TkU5VFJPc1ppaVdQL2QxTkJROHF4bUpJNHViVWwxUHZrMjdOeXNmY1RVdHAw?=
 =?utf-8?B?VDZ0QVM0YnozNTF6dThpNEY2dUx1VTJuNmJCaHFTWmtwYXlJWVlXeS9EUjFD?=
 =?utf-8?B?Tk14eU1CRmlyTVlJc3czZU10dUd4ZmxCTVZleWdpTDBUWGl5dEx4c0JLZnl6?=
 =?utf-8?B?N0JlSVlLZVhXWmU4M01UNms2Z3hJaG9tRnI4SmhuYVNYWjdreVRCSFArQ3p0?=
 =?utf-8?B?WDhVdi9yREl4Ylp5TUxUbU00VytzamxWczlieWsvTHlHWkxnUk95a3p2YmVI?=
 =?utf-8?B?WEptNHpMSlJxQzhER1hSemk0dlg3Z0ZlSEM3MmwzUTFOMVpBaFltd3BPTGpK?=
 =?utf-8?B?aFBoM0ZwUDlraHNhNmFIS0g0S04wT21oUmc2b2hMQkFJeXM4L1ZubEU1ZzZW?=
 =?utf-8?B?Ky8ybitLUjNHb2VydFhOQU1IZ2pqbXhQQ2NCOUhoY2JGRkhXaEZEU3Z5Wlg4?=
 =?utf-8?B?cHQ3WGx6aHd2Qlk5U2oreWltMHNjYUxkZXp3UUlGb3NaYmZCRFFZbFdDam5p?=
 =?utf-8?Q?udt8itwnlpfwTpiLB/pdtQ9cOzrOEk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qzc4QjJJZGQyQTIyRFJQb2VKUXI5VXFyd2VVQmErWWlLcUkyUEJ0MGZUS3hD?=
 =?utf-8?B?RkpLKzBTMGljU2hJK2U4djlGYkVSYWkxRld2dC84ajMzdXd4SlpST01YQ1ZD?=
 =?utf-8?B?R0VETlc0ZUI3TlFEelorbDk4dGdQNWFObjJuTnFDLzFDc2JneS9LQm4vbUdY?=
 =?utf-8?B?UjM1c2o3WkIzUTFnYmZHYnJ6UHJUZWwxTlYrQ2lDdkcwUGhxVTJnMWxtMTJW?=
 =?utf-8?B?aWlkQlBsTjk1bkRKcTdlV1NDYjQ2ZjZMRm1RaXBUYWV4NGhjRGg5YkZTaTBx?=
 =?utf-8?B?YkE1a2VwK3BFTFN5N3p1SmVmQXllL3k5L3VqbEFxamFudW1mYndOaCsxTFpU?=
 =?utf-8?B?Rkc0eUZTQkVkWnkxY3k1K0ZCUzhQZjhKdXJ0Vkh5bjhpRUp5dmxnQURCR0d3?=
 =?utf-8?B?N2RNQjJiOG9vVWxlcUFNNXBSdyswek9rMWJvL1pVU1VJdkJVbm9QT3htSjA2?=
 =?utf-8?B?YW5QQ0NlVjBodVpZN1FFSjVZSEZVV0pxNk0zYlJMWGxUMzdmaWppZm9HaUtX?=
 =?utf-8?B?RnFvS0gwOUlVWWU1N3RqZGtHMVBlL0lQZWhUL2YvV0kxMFF4eXVlcVNHSXYy?=
 =?utf-8?B?N256NVBYT3A3Vi9iMFM4YU1MU2twT0Fic0NoeVJLUUVRc3RjamoyUnd1YVJo?=
 =?utf-8?B?ckk1d2kxQ2IyeTlXMmUrckZ4ejFjSzd0d0RyKzNmR3lQb01LRWtNdUtnMzIv?=
 =?utf-8?B?bGZhcWRza0Z1R3lMUnB1UHBuZDgzd1oxZnpWWG5vZFJiZ3N6UHY3THZrVkY4?=
 =?utf-8?B?RnpnWXY0MEJxRTlXT3BWSVNFaEVrdDlENklGeEFudFJMWFZnS293dmRVR1B5?=
 =?utf-8?B?dHFzZmNwb3pCc0cxRE1tSXgwd3lxTy9aUm1lMkxORllyR3Z3dmdlKzRSRmRr?=
 =?utf-8?B?cXRnTnJqYlg0SHNjbFFFYUFqTndFK1MrUEFlRm0wbW1KcjhNeDEzUURzMHk3?=
 =?utf-8?B?ZkFhMHZDT095cGhFakxBSEQ5cVpISTBiUmR5d2ZVZ3I5bkxhWlF2cXFId3Bj?=
 =?utf-8?B?U2pUeW82cXdObHIxVEJJVkxLbTR3UXdwd2ZTUFU1WDcxSWZ0STBqTW5GT2FY?=
 =?utf-8?B?NDdESmpUbzU4d09rVmZ2TVJKSDNjK3B0L1FqQnR1dTNWMHpkZkVENmR3Y3JV?=
 =?utf-8?B?eVJtVHVrYzhsZThlcXMweDRsKzRpbkwxVEY2dDZnTUpZa3NPVGZkaDZNMGJF?=
 =?utf-8?B?SVpYTHhnb2E1NStVTTZsZ21vZmszSyt0YzIxZCtiWW44T3MwNXduWm5yMzJj?=
 =?utf-8?B?emtBUGRweVkvWHVnQ01QZzJCNG5yeTA3WTMyY29LbFhPeHBSNzVsNUU4R3Er?=
 =?utf-8?B?aGx6YlZSKzNodjcwWGZZbW1Yeit2ajQvdHpRaVBXSVFqbWdHUlhWbThnNXpL?=
 =?utf-8?B?QTRCa1k0R0g5bkdOVW1FbjdxN0t0OHdGRjdKVWZFYlFWdG05bFRYd1kwQTdu?=
 =?utf-8?B?TXhLeFRKSTNMUmNRcGZGWm9nWldYRlZLMTkveFlFZ2JWVWkwN2UwSTcrejkx?=
 =?utf-8?B?bmF1YkZMMTRRdWQwcUNGZHF0ellKYmhzUEhOTTJ4d1RySk5zYmlTeFpXQzlr?=
 =?utf-8?B?blhQMUpiU29RSkxxc2MwQXloaFRpRTNHRTZKcld6a09vdlBlTmF6eldhV3hw?=
 =?utf-8?B?RzQrbFpjV3dQR284UDBjYjEyRk90QXp6NUhRdDA5MzI2ZldNSW40dU1PWWJ6?=
 =?utf-8?B?cUhza0RGZmJVQTVZMy9rMXBpUzhOM0dZaDk4dzhvQnE2ZjdINVdIWGo1SnFn?=
 =?utf-8?B?RUFRUDlZc2J2ZjhZUVR0b2dtUEwwd2VVdUloaXBGeVM0dHlOTWdjWmxlR1hr?=
 =?utf-8?B?L1V1dlpPZGRxZm5YdUxOd0FDdG5FVFo1cmJzM05HMnhkOVhxcERSY1V1UjFN?=
 =?utf-8?B?R3A5QlBxclFLOTZtYWphQWdiWUFabmZjMEh3UHZLYVFuRWJ3WGJ4Vm9HWDB2?=
 =?utf-8?B?RWxhYjNjbjgxblVFeWpqMzlsWkdtUlcraU9mMWkzNFMrMC8zbDBsUzhQVUdJ?=
 =?utf-8?B?bXEzeE80anBUc1h5RUpvTmlHVC95Z1BkQlpkcDZPcnczMnFQSmVGT2hDSWYy?=
 =?utf-8?B?YXAxbzhjSVg3MjZMc0FkRjFQU1IzYmpxNytRdjRMWjJkYTFsdHJaZzduZUEw?=
 =?utf-8?B?UDREUjdBTGZjcmpjNDdMRUthWVAyNVYwR04ydzZPdVovQ011enJnYmxSbkkx?=
 =?utf-8?Q?Czb05c9DHLP/4OCOC02/4Xk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00d9268-fd57-4abb-9f87-08ddff35a96c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:53:30.0460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78tRqXzHIA+jxbeCIFQbgUCmPgkgrZXfnbQfGabo7L+Hmf/uNdyhwc9Jk25ymbuwisY4E0Gi7NntdY0WCbBVnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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



On 2025-09-17 20:43, Nícolas F. R. A. Prado wrote:
> In preparation for sharing the initialization code for the color
> pipeline property between pre- and post-blend color pipelines, factor
> out the common initialization to a separate function.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/drm_crtc.c          | 44 +++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_crtc_internal.h |  5 +++++
>   drivers/gpu/drm/drm_plane.c         | 36 +++++-------------------------
>   3 files changed, 54 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 46655339003db2a1b43441434839e26f61d79b4e..94e60cffd29972aa979ac2f1932be7a6a97f3ada 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -959,3 +959,47 @@ bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
>   	return hweight32(crtc_state->encoder_mask) > 1;
>   }
>   EXPORT_SYMBOL(drm_crtc_in_clone_mode);
> +
> +struct drm_property *
> +drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
> +					  const struct drm_prop_enum_list *pipelines,
> +					  int num_pipelines)

All other functions I see in drm_crtc seem to be quite crtc
specific. Would there be a better place to put this? Possibly
a new file if nothing else seems to fit?

Not a blocker in any way, though.

Harry

> +{
> +	struct drm_prop_enum_list *all_pipelines;
> +	struct drm_property *prop;
> +	int len = 0;
> +	int i;
> +
> +	all_pipelines = kcalloc(num_pipelines + 1,
> +				sizeof(*all_pipelines),
> +				GFP_KERNEL);
> +
> +	if (!all_pipelines) {
> +		drm_err(dev, "failed to allocate color pipeline\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/* Create default Bypass color pipeline */
> +	all_pipelines[len].type = 0;
> +	all_pipelines[len].name = "Bypass";
> +	len++;
> +
> +	/* Add all other color pipelines */
> +	for (i = 0; i < num_pipelines; i++, len++) {
> +		all_pipelines[len].type = pipelines[i].type;
> +		all_pipelines[len].name = pipelines[i].name;
> +	}
> +
> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
> +					"COLOR_PIPELINE",
> +					all_pipelines, len);
> +	if (IS_ERR(prop)) {
> +		kfree(all_pipelines);
> +		return prop;
> +	}
> +
> +	drm_object_attach_property(obj, prop, 0);
> +
> +	kfree(all_pipelines);
> +	return prop;
> +}
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index c094092296448093c5cd192ecdc8ea9a50769c90..e3dbdcbfa385b940ec0b5476adde6146fe4afde1 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -35,6 +35,7 @@
>   #ifndef __DRM_CRTC_INTERNAL_H__
>   #define __DRM_CRTC_INTERNAL_H__
>   
> +#include <drm/drm_property.h>
>   #include <linux/err.h>
>   #include <linux/types.h>
>   
> @@ -79,6 +80,10 @@ int drm_crtc_check_viewport(const struct drm_crtc *crtc,
>   int drm_crtc_register_all(struct drm_device *dev);
>   void drm_crtc_unregister_all(struct drm_device *dev);
>   int drm_crtc_force_disable(struct drm_crtc *crtc);
> +struct drm_property *
> +drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
> +					  const struct drm_prop_enum_list *pipelines,
> +					  int num_pipelines);
>   
>   struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc);
>   
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index f6cfa8ac090c7bc49c7f276993bba7e9800da140..60dbfcab495600dd44c15260a1fa6135db59c6e2 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1839,43 +1839,17 @@ int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
>   					     const struct drm_prop_enum_list *pipelines,
>   					     int num_pipelines)
>   {
> -	struct drm_prop_enum_list *all_pipelines;
>   	struct drm_property *prop;
> -	int len = 0;
> -	int i;
> -
> -	all_pipelines = kcalloc(num_pipelines + 1,
> -				sizeof(*all_pipelines),
> -				GFP_KERNEL);
> -
> -	if (!all_pipelines) {
> -		drm_err(plane->dev, "failed to allocate color pipeline\n");
> -		return -ENOMEM;
> -	}
>   
> -	/* Create default Bypass color pipeline */
> -	all_pipelines[len].type = 0;
> -	all_pipelines[len].name = "Bypass";
> -	len++;
> -
> -	/* Add all other color pipelines */
> -	for (i = 0; i < num_pipelines; i++, len++) {
> -		all_pipelines[len].type = pipelines[i].type;
> -		all_pipelines[len].name = pipelines[i].name;
> -	}
> -
> -	prop = drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
> -					"COLOR_PIPELINE",
> -					all_pipelines, len);
> -	if (IS_ERR(prop)) {
> -		kfree(all_pipelines);
> +	prop = drm_common_create_color_pipeline_property(plane->dev,
> +							 &plane->base,
> +							 pipelines,
> +							 num_pipelines);
> +	if (IS_ERR(prop))
>   		return PTR_ERR(prop);
> -	}
>   
> -	drm_object_attach_property(&plane->base, prop, 0);
>   	plane->color_pipeline_property = prop;
>   
> -	kfree(all_pipelines);
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);
> 

