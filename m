Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33372BB276B
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 06:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C024110E769;
	Thu,  2 Oct 2025 04:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b9L+2iMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBF510E16B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 04:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYCB/vYSCveWT4zk8Glo39Ar5k8J8RlbUClp1d5eqzqvW5Kq3ZZ+twl3T1DmnMa6T0FigfQzXRwn3zMMhzc0psBuvQ6iGJdKa8bAN+D9q3vtjmEcLVWFTxCaYhuPpMyM0hJY9/0opHDPWUmVkqBt/SM5aw+mJbOiAi21EWBwf2qGmTvrbmOCrxbe7Qirvx/KN7aaoDlqhxF1L7Lgnd5R3RE2kJUCPN8ijR06Kh2rukxDOe/shJUFmkYullukX+9+tvT9hp+MMbifx3qYRElf4FBHJrcqqbne88i1wxF8bq0AyC2bGa2y4uTh63a7dGvaLuUob4i7JTZOE0r72wiGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uo4irmCyMg4RIaoZCBb7g9hh518H/2x1L3w1sP3udK4=;
 b=mZzisLmarm1UL3WqcoK2Gr3EOVr0mspYkrT/lqj+RsSGp6HbHYtbNBxmtrNc1UiGvbTNYOqsoWTtJXejwlX68rdCtX1hPIZZcgPmBSMk6kx31oVRe+qhn1gMtBNClZDZx2WQKXdhbLR7H3f+p44M7YvTRXVnkgldpm0nm53ClQYr9MzPXpiS/AjIrSuJ9diUQwgXr2IH4XMsCwgzAz1WPEOK0WOYgK6XBnX5dIgu6zp+0ZB0Xft446YQD74CSiqBepKIxsNQIf814zrdInow5u+bNoSWmHqfktB/BPdYy36rC+tJWKZzUTVk9yX9RGD8KDWpQ+JixGGtLN/X8E7plQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uo4irmCyMg4RIaoZCBb7g9hh518H/2x1L3w1sP3udK4=;
 b=b9L+2iMdVjZI/eJTu/3bsP7ycOzzaEVdav8OLvUOxjanA188VVC1mf/63X/FkG5+NBIncHxNpLXroBbnByT8kPsA1ZMvYrYsbl5J9nNFghBqZPTVf5k4a8m4Asalhdgl5CP7ZvVuhajq8TBkdGCx3yFTRqCAqwvpZDJCRxf2uXORUI/7G/Uq8t6bDvXnJPeJ1VZWzTe/A4e/HCqvzwnMWhBg6JF995nEEYR+Z2Jyo5pZh6k9N6RbyGP2rEwqM7Cd5ZJLbb41/6U/FFJ72nLh0UC1lexmmYzcHFMzX/uv02tWzW1SwAzCk64b/9F6xIQDnfPGOveNMfyv9pymjMfmqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 MW6PR12MB8900.namprd12.prod.outlook.com (2603:10b6:303:244::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 04:03:23 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 04:03:23 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 22/22] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Thu, 02 Oct 2025 13:03:19 +0900
Message-ID: <2797078.HovnAMPojK@senjougahara>
In-Reply-To: <CAPVz0n2g_OGhKpWW7pdhy+9Wt5HBy50_CwLV2cVBZt7rjAKxEg@mail.gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <2443034.g5d078U9FE@senjougahara>
 <CAPVz0n2g_OGhKpWW7pdhy+9Wt5HBy50_CwLV2cVBZt7rjAKxEg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|MW6PR12MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de9a0b2-74bf-4ac0-63f8-08de0168a16f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azNZRWNaR0F6L2NHdTZVTVVIL0NuNjg3eGFJZ3JJMDFnTlAwUmJmU0c0bGFM?=
 =?utf-8?B?VUNTMzRzMHhPL3ZQaXpLZERiU0l3emhGYkdjbUlud0U1dU95V2dhRy9Dam5k?=
 =?utf-8?B?anR5WThJaW1JL010SmhPOE15WG1TdWZOSk5ha2pUb0lmUnQ5b3htQVh0ME9m?=
 =?utf-8?B?aXkzMHNEK1JMUWtUT3RCZ3RsYzFLMDdrb0FUdHFERklEbDRhTW01T0FZSjRo?=
 =?utf-8?B?UmJFcnJGMVZFemxyVmNvRENrbTFtQjZFUzQ0RUFkWHdHMnFtMjUxcm8rSk4w?=
 =?utf-8?B?MmJmR1JlNU85bDJoWDRHcWpCREhBMEJ3UXFEVGF4c2xublB6VHE4QW02cndm?=
 =?utf-8?B?MGtJN1hHU3p1b2NKYURMdG1pSnVKTDlpaHJaWDJobkVHUEVVbnExNXlsenk2?=
 =?utf-8?B?N2ptd2lCQmRybVdHVmcyYnBOa050a1BCVXdWcHZZQm4xZ0tPZnB1RkU4V2ho?=
 =?utf-8?B?Mkd2eFJvVlFzZlE0L0dMeEZJWGVJbVo4cWt3VStLc0U5SXBCMTdJT1N2N09t?=
 =?utf-8?B?dXp4M0NKb2l4U1BMVHF0S1BRaGFyd3VIanhlUHljV3dJdXdHZzJRaE0xdmgr?=
 =?utf-8?B?aUhPSFlDaWRiVEUwRk16NUNqeHQrUDRldUpNcjAxS04zRkUvWVJDczIvYllS?=
 =?utf-8?B?ck15ekdaVytBZHhNVGlKdzRleDdVak0rZ3NyNm5xWnFUeEdHazY0ZXBlY2VE?=
 =?utf-8?B?TXNnbTkvVERacFovRzR2ZWZHdHpNVlRvSlB2cnZjbi92QTl1TXR0eXhNcWlQ?=
 =?utf-8?B?OVorN3BxVm1MTTg3MXQvRXJoMWxieXRlRkFmeDI2QkN2cUswS0xNNkNDY3g2?=
 =?utf-8?B?SjB1VFFNWFpialBkOXpHeHh4azExOXVlZlM0L3NrZE52VlNQaFdja0QvcE9D?=
 =?utf-8?B?VSsvd0NOMWtIVTRSY2tIVi9tWW9KNzRmMnk5RjdtbXA4OTFGWmpDWXlqV25M?=
 =?utf-8?B?dHpxaC80OE1pRXNrVzJYUGVrYnRtZk5uYy8xbklnWWs4WEF6eUtWVFdvQW5y?=
 =?utf-8?B?UE9lMCthdG5XRUJNaURPWllEMGV6Z2tDK1F4bXJMZE1BMWZPWTRiTnV5ZjU3?=
 =?utf-8?B?dStyMVBERnJ3Q3EvMGtLVkhsc0VTZWlwbTBORjlBdUtabER3U0hOa3lsdEIx?=
 =?utf-8?B?R1haTndlNENpcG0wWHc5WWR5UW1mWVlhS1VKRlF1dU9BM055MmVaemZaK0JI?=
 =?utf-8?B?QmRYalR3eDNZVWZGdzNDUzZFc05XbVNzVDViQkpPNzVIVkZ5TWtiaWxiZDAv?=
 =?utf-8?B?bGhkZlVKTzJqUGVJNWptKzNjaVFBdUpoZUJVZ2daYlo2U1BmYlovU0dhUzFo?=
 =?utf-8?B?eFB6Z3hWbXFUdS9TSWdsOExuaGNCMmF4b2pVWng2REpNQzZ2bStRa2V1NVZ6?=
 =?utf-8?B?N3g0TWFvN0RISlZqV1Vsb1ZvZkxOeUk5dkFBd1J3SlRVZEVaT0R4TTJXOVN6?=
 =?utf-8?B?cENWbll5ZWhXZUdaampsZVdHZEFuRU1XMVRGaHNNSGhpclZwdDRHak1VVEho?=
 =?utf-8?B?RTJSRE94dGpFTGh2Z3NUWCtwVkkyY1lYOStNaUppT0NmNDJuVWs3N2hrR2Ry?=
 =?utf-8?B?aEkyS1c4bDNXeVRIQXZhbFdWeCtPNnpWSm1WQjk5S0V2ZURHUTFNQ0QwTkNL?=
 =?utf-8?B?enl5Wi9mZWpyVlYydGpzcG1YM0RIREZmSzFLMGUrdW92SGxDZDNSQjg0eE9q?=
 =?utf-8?B?bVJRRGR0eUZQdUVnVkZ2MjZUKzdDU0RPMjA4K2tKYnNjL3NvODRJK3N2MzdB?=
 =?utf-8?B?U1U0dUJQOEp0UWpaK0djL1FIaU9zQUFycVUvYkxjUCtRbEVRdEJDYnpxdU5u?=
 =?utf-8?B?VHREQWFmaGt1T05yT1Bsbjh2YnJ2TjNSZWJCRWFjZGcyWGxUdVZmS2pkQTFp?=
 =?utf-8?B?THR1UWZ5QXRvTmo3ZTlseUI3emFoalgwc0hSaW1ZL3I0MHlmTUdsS3d6RzhL?=
 =?utf-8?Q?K0df1V9Z+tdpMh2OGrCVSEiJAki+UC/Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVBINE03WGowdnlCN0NoYTNmL0ZBZ2s5WmNYMnU1WlR2MUo1cGRXdzJEVFZG?=
 =?utf-8?B?a2ZzZndicEZJcG1JUnM2ZkJJOWJ5Zi9IK3EwYnlrNFQ5Tlp3RFF3anBqa0dT?=
 =?utf-8?B?SGFxNzlEbVJLR2lxNnE2NEZRQlJ6WVdxTFRMUnJlMzYyWUZZZDdrNnZLckJR?=
 =?utf-8?B?UXNhbWJWajM2dzZkeXgwTWtoUmt5T0tmWEF2TVhRMUVIT3puUy9vNjJUUitR?=
 =?utf-8?B?Um9vZE1IWElpaXN0Vk1MdEFHcWVHUDA5MDFTeWdRY0hpaVJVNmYxaC9kbTlC?=
 =?utf-8?B?Y1hMbTlVTjUzT1I4bHdrREd1cTV2bi9wamFpMkxWaHFBeUIrQm12UVArazBl?=
 =?utf-8?B?ckhtU0doL1dUZkt5YmVDV2pRYlEzMnFDQnVMSkFib2pycEh4Q29Yajc3MW41?=
 =?utf-8?B?VVJFVkR3Sys0ZEp5ZjFJazhNZGNRS1kyTGxsTWc1Y3ZxT0ZpaEJSRGdnNU1N?=
 =?utf-8?B?U0tGNHFYMVRPT1RneW1reGlGZkNEQk9hMXpmM1pKSWVnUzBGY3Z1ckRFeUlu?=
 =?utf-8?B?aTlVNExPMk5xQzFTSTlkT2dMODhyL2M0M2xkOG9GaTh5L3RoUFEwcmlTd3or?=
 =?utf-8?B?aks3WjkzR1p3YXlpUWpnQ2xvbEpFRzJUSDhnNDc2OTFHdWF2RUxmS1N6bDVH?=
 =?utf-8?B?dVdnNFJ6Yjg3M01HSWpYWGVoNFZyNmlUUHdOeldwS3Z2aGIzSDVoUmV3Tjl6?=
 =?utf-8?B?NEpLdjg4Ky80QXI5OWxJSUFUT2NtdlhrY1pMTERXSGVvM0FBR290dHFERnBS?=
 =?utf-8?B?VzBNcTZpcU1IQW1YSzQ1V1V5RGpMWHB1OTE2K3dFN09hU2Y4OFlCb2lFS0Jm?=
 =?utf-8?B?dnZQR1pPeTRzVUxHZXNxTTl4UVA4Qzl3L3dOVEhocm9OeGc1bThDbVlaNU5z?=
 =?utf-8?B?eXRiT3Z4aEtJUTNBYk12OWlSUWNQYzdWUzdtLzR1UGV0bU1qak1BNGE1ZWhJ?=
 =?utf-8?B?Z0g3WWVGbDlwMEIxeGIyaVEyQ09YZWxqNTdUcHc3WFY3K1k3NmhnYzdPbTYv?=
 =?utf-8?B?dHk1WFI2Slg0VVRhaWtXaTV6dk8zNnlMYUk0U0tLV2ZZZHB2SlhadjVIK2M3?=
 =?utf-8?B?UlFCWFBnczNhZ1dLQjVVcnVJVTl2LzdzRFBlbmwrL05ZZ2JnOHcyTHBLbTl1?=
 =?utf-8?B?MXVZMWVTVVhjOU8rc3AvOVR6MmU1NW5TaHBpNlovTzlJUzVVRGpRQzdCVmJD?=
 =?utf-8?B?VTVLbU9sN2V4dzJDZkZPN1htM21VYmNvaEJGTFVsa0tEaEhZWG9oazMwNzZZ?=
 =?utf-8?B?bnQvMVpQN2ZJMmkwSVRiWER1YzhBSDhJeHZKQjNKQWp6M295aXdEQkM2LzB0?=
 =?utf-8?B?Um5MNVBFL0EvZGRJREFkWHUwVVZZZXN5NTJuL0c2cFV3Q0QzZ1JZVzIyVDdz?=
 =?utf-8?B?QlNqUDhrbWFuZ2lFMEQ0dC9FcVUrZkJjS2xtZDRPWFI1bENraWFzNWR2c3c1?=
 =?utf-8?B?M2RWREEwN0pIODhmLzF2UjJzemhPdEJRUmI1TlRaQ0hwaHFTaFVidEJuYlZo?=
 =?utf-8?B?NjcwemFBRFJselFQODR1K1hPUzJ3MmF4K1ZOSjJOWENQc3d2dHdKWVZkY3Z5?=
 =?utf-8?B?dTlwemx4WmgxUGNiVjlaVUpNNWg1OXY1MDJsbDdUUkV1d3pSU3FEUys3Rkxp?=
 =?utf-8?B?dUlVMzROUjJWT3BualRiNno5c2IwSFJ1TWRvRDZTQ2lmN21uNE1qdkVYVDhi?=
 =?utf-8?B?RUttSUd3bERVbkdKc3d1WUQ2YXY1OE85ejd6SGQ1ZlJOWURTQzkydU9nNGZY?=
 =?utf-8?B?QWo2YUVEMGJIc0p2VFZyNld4NEU4aFpOUk5FUG1YbzNIV2ZldXZuY0crRGx6?=
 =?utf-8?B?Rk95MEg0UGJsNXUybXErWkpza1dReUhKMmlQQ2NWeXBZNTdKQVNKNklMa0cw?=
 =?utf-8?B?N05MSjlRR3lkSDZ3T0tjc3VPd1JxZVpGNlRyVXRIdjRFSkovaTFoUk41Tm0r?=
 =?utf-8?B?aVY4UjVXR3ppbkV5WmhxcUE4S00wUk01UWNCVGlobVJ3c0tMODJlRWxCbEti?=
 =?utf-8?B?N2RTVGVTdEdYbDQxNmxNOWthaE5RV2xmSGxIUjZVVjBkbnpjYVdLNUZZT054?=
 =?utf-8?B?cUp5bHJiWjc1TUZIZjZFcnF4bm9LVlgzbjZObGJPY0tBU1RLV0J3eGFVWW9R?=
 =?utf-8?B?VjZNUjV4MUV0c0ZoSS9hQlRES0J6Qk96U1dIODY4czQ0dmc1Q1hVemJOSWtx?=
 =?utf-8?B?UVpIeHdmYWZvM0dlaU5XbE80MFdGR285VWRrT1FXamh1dTFhamFUQ3FuSUVU?=
 =?utf-8?B?S2M4eDUxOHJGVDlER2ZZQzhSY3lRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de9a0b2-74bf-4ac0-63f8-08de0168a16f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 04:03:23.2607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNjHM1BsQTEwr411xr1WPi8SzsAV1qK+l86mNlyNhPG70eNUIdI3Gu+Eun/lY6dzsd8vvxI7XTn8jt1WVD24Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8900
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

On Thursday, October 2, 2025 12:23=E2=80=AFAM Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 09:=
38 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Wednesday, October 1, 2025 2:15=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE=
 08:04 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wro=
te:
> > > > > Add support for MIPI CSI device and calibration logic found in Te=
gra20 and
> > > > > Tegra30 SoC.
> > > > >
> > > > > To get CSI operational, an additional syncpoint was allocated to =
serve as
> > > > > the CSI frame counter. Both VIP and CSI use an existing syncpoint=
 for VI
> > > > > frame start events. That said, the frame capture function was ref=
actored
> > > > > to reflect the addition of the CSI syncpoint, and the CSI-specifi=
c
> > > > > configuration is guarded by the presence of a passed CSI channel =
structure
> > > > > pointer.
> > > > >
> > > > > The camera capture setup's configuration was reconsidered: the fi=
rst two
> > > > > writes must be done before tegra_channel_set_stream for MIPI cali=
bration
> > > > > to work properly; the third write was moved to VIP/CSI-specific f=
unctions
> > > > > since it must be source-specific; the function was placed after
> > > > > tegra_channel_set_stream so the initial sequence is preserved and=
 expanded.
> > > > >
> > > > > CSI configuration sequences were added based on downstream 3.1 ke=
rnel
> > > > > sources and adjusted to the existing video-tegra framework. Altho=
ugh
> > > > > Tegra20 and Tegra30 have the same set of configurations, they dif=
fer by
> > > > > the number of clocks used by CSI.
> > > > >
> > > > > Dropped the software syncpoint counters in favor of reading syncp=
oints
> > > > > directly and passing the incremented value to the polling functio=
n. If the
> > > > > syncpoint increase fails, the PP is reset. This change should pre=
vent
> > > > > possible race conditions.
> > > > >
> > > > > MIPI calibration logic was registered in CSI since Tegra20 and Te=
gra30
> > > > > have no dedicated hardware block for these operations and use CSI=
. These
> > > > > calls are used for both CSI and DSI to work properly, which is wh=
y MIPI
> > > > > calibration cannot be contained within CSI. The pads passed to th=
e
> > > > > calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A =
(3) and
> > > > > DSI-B (4).
> > > > >
> > > > > Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > > > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/staging/media/tegra-video/csi.c     |  19 +
> > > > >  drivers/staging/media/tegra-video/csi.h     |   4 +
> > > > >  drivers/staging/media/tegra-video/tegra20.c | 608 ++++++++++++++=
++++--
> > > > >  drivers/staging/media/tegra-video/vi.h      |   2 -
> > > > >  drivers/staging/media/tegra-video/video.c   |   6 +
> > > > >  5 files changed, 592 insertions(+), 47 deletions(-)
> > > > >
> > > > > diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/st=
aging/media/tegra-video/csi.c
> > > > > index 7d70478a07aa..92ee4c84a988 100644
> > > > > --- a/drivers/staging/media/tegra-video/csi.c
> > > > > +++ b/drivers/staging/media/tegra-video/csi.c
> > > > > @@ -827,6 +827,13 @@ static int tegra_csi_probe(struct platform_d=
evice *pdev)
> > > > >
> > > > >       csi->dev =3D &pdev->dev;
> > > > >       csi->ops =3D csi->soc->ops;
> > > > > +
> > > > > +     if (csi->soc->mipi_ops)
> > > > > +             tegra_mipi_add_provider(pdev->dev.of_node,
> > > > > +                                     csi->soc->mipi_ops);
> > > >
> > > > Error handling should be added. Also, I realize that we should have=
 a tegra_mipi_remove_provider to call if the probe fails after this or at C=
SI device removal. Since tegra_mipi_request refcounts the platform device, =
AIUI the CSI device cannot be unbound while it has users, so we don't need =
to worry about the CSI device being removed while there are active users.
> > > >
> > >
> > > Your words tegra_mipi_remove_provider are unclear, should I add it an=
d
> > > where should I use it exactly? I can make devm version of
> > > tegra_mipi_remove_provider by adding action there.
> >
> > Yes, devm_tegra_mipi_add_provider would be a good solution. My intent w=
as that we should clean up the provider registration in an error case or wh=
en the CSI device is removed.
> >
> > FWIW, I've spent a little time looking at the refcounting situation, an=
d it doesn't seem like the device refcount guarantees the driver is still b=
ound. Will need to look at this further, but no need to block this series.
> >
>=20
> What should I release in remove? I have not found instance where
> structures like provider were released in any way, unless they
> allocate memory for it parts, in this case provider has only 2
> pointers and does not allocate anything so release is not needed.

The provider (global structure) fields should be set to NULL, so that if a =
driver later calls tegra_mipi_request it will get an error instead of inval=
id pointers.

>=20
> > >
> > > > > +
> > > > > +     mutex_init(&csi->mipi_lock);
> > > > > +
> > > > >       platform_set_drvdata(pdev, csi);
> > > > >       pm_runtime_enable(&pdev->dev);
> > > > >
> > > > > @@ -858,11 +865,23 @@ static void tegra_csi_remove(struct platfor=
m_device *pdev)
> > > > >       pm_runtime_disable(&pdev->dev);
> > > > >  }
> > > > >
> > > > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > > > +extern const struct tegra_csi_soc tegra20_csi_soc;
> > > > > +#endif
> > > > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > > > +extern const struct tegra_csi_soc tegra30_csi_soc;
> > > > > +#endif
> > > > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > > > >  extern const struct tegra_csi_soc tegra210_csi_soc;
> > > > >  #endif
> > > > >
> > > > >  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> > > > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > > > +     { .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_=
csi_soc },
> > > > > +#endif
> > > > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > > > +     { .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_=
csi_soc },
> > > > > +#endif
> > > > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > > > >       { .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra21=
0_csi_soc },
> > > > >  #endif
> > > > > diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/st=
aging/media/tegra-video/csi.h
> > > > > index 1550defb115a..422f30655945 100644
> > > > > --- a/drivers/staging/media/tegra-video/csi.h
> > > > > +++ b/drivers/staging/media/tegra-video/csi.h
> > > > > @@ -115,6 +115,7 @@ struct tegra_csi_ops {
> > > > >   * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
> > > > >   *
> > > > >   * @ops: csi hardware operations
> > > > > + * @mipi_ops: MIPI calibration operations
> > > > >   * @csi_max_channels: supported max streaming channels
> > > > >   * @clk_names: csi and cil clock names
> > > > >   * @num_clks: total clocks count
> > > > > @@ -123,6 +124,7 @@ struct tegra_csi_ops {
> > > > >   */
> > > > >  struct tegra_csi_soc {
> > > > >       const struct tegra_csi_ops *ops;
> > > > > +     const struct tegra_mipi_ops *mipi_ops;
> > > > >       unsigned int csi_max_channels;
> > > > >       const char * const *clk_names;
> > > > >       unsigned int num_clks;
> > > > > @@ -140,6 +142,7 @@ struct tegra_csi_soc {
> > > > >   * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
> > > > >   * @soc: pointer to SoC data structure
> > > > >   * @ops: csi operations
> > > > > + * @mipi_lock: for MIPI calibration operations
> > > > >   * @csi_chans: list head for CSI channels
> > > > >   */
> > > > >  struct tegra_csi {
> > > > > @@ -150,6 +153,7 @@ struct tegra_csi {
> > > > >       struct regulator *vdd;
> > > > >       const struct tegra_csi_soc *soc;
> > > > >       const struct tegra_csi_ops *ops;
> > > > > +     struct mutex mipi_lock;
> > > > >       struct list_head csi_chans;
> > > > >  };
> > > > >
> > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/driver=
s/staging/media/tegra-video/tegra20.c
> > > > > index 8c9655ffa886..d99a04fa25af 100644
> > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > @@ -4,6 +4,9 @@
> > > > >   *
> > > > >   * Copyright (C) 2023 SKIDATA GmbH
> > > > >   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > > > + *
> > > > > + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.=
de>
> > > > >   */
> > > > >
> > > > >  /*
> > > > > @@ -12,10 +15,15 @@
> > > > >   */
> > > > >
> > > > >  #include <linux/bitfield.h>
> > > > > +#include <linux/clk.h>
> > > > > +#include <linux/clk/tegra.h>
> > > > >  #include <linux/delay.h>
> > > > >  #include <linux/host1x.h>
> > > > > +#include <linux/iopoll.h>
> > > > >  #include <linux/kernel.h>
> > > > >  #include <linux/kthread.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > > +#include <linux/tegra-mipi-cal.h>
> > > > >  #include <linux/v4l2-mediabus.h>
> > > > >
> > > > >  #include "vip.h"
> > > > > @@ -42,6 +50,9 @@ enum tegra_vi_out {
> > > > >  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT   BIT(8)
> > > > >  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT              0
> > > > >
> > > > > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)   (0x0070 + (=
n) * 8)
> > > > > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)     (0x0074 + (=
n) * 8)
> > > > > +
> > > > >  #define TEGRA_VI_VI_INPUT_CONTROL                    0x0088
> > > > >  #define       VI_INPUT_FIELD_DETECT                  BIT(27)
> > > > >  #define       VI_INPUT_BT656                         BIT(25)
> > > > > @@ -88,6 +99,8 @@ enum tegra_vi_out {
> > > > >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST     (3 << VI_OU=
TPUT_OUTPUT_FORMAT_SFT)
> > > > >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR   (6 << VI_OU=
TPUT_OUTPUT_FORMAT_SFT)
> > > > >  /* TEGRA_VI_OUT_2 supported formats */
> > > > > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER  (7 << VI_OU=
TPUT_OUTPUT_FORMAT_SFT)
> > > > > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER  (8 << VI_OU=
TPUT_OUTPUT_FORMAT_SFT)
> > > > >  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT       (9 =
<< VI_OUTPUT_OUTPUT_FORMAT_SFT)
> > > > >
> > > > >  #define TEGRA_VI_VIP_H_ACTIVE                                0x0=
0a4
> > > > > @@ -152,8 +165,106 @@ enum tegra_vi_out {
> > > > >  #define TEGRA_VI_VI_RAISE                            0x01ac
> > > > >  #define       VI_VI_RAISE_ON_EDGE                    BIT(0)
> > > > >
> > > > > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)         (0x01d8 + (=
n) * 8)
> > > > > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)           (0x01dc + (=
n) * 8)
> > > > > +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)                  (0x01e8 + (=
n) * 8)
> > > > > +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)                  (0x01ec + (=
n) * 8)
> > > > > +
> > > > > +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> > > > > +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL            0x0000
> > > > > +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL          0x0008
> > > > > +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)            (0x0010 + (=
n) * 0x2c)
> > > > > +#define       CSI_SKIP_PACKET_THRESHOLD(n)           (((n) & 0xf=
f) << 16)
> > > > > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)           (0x0018 + (=
n) * 0x2c)
> > > > > +#define       CSI_PP_PAD_FRAME_PAD0S                 (0 << 28)
> > > > > +#define       CSI_PP_PAD_FRAME_PAD1S                 (1 << 28)
> > > > > +#define       CSI_PP_PAD_FRAME_NOPAD                 (2 << 28)
> > > > > +#define       CSI_PP_HEADER_EC_ENABLE                        BIT=
(27)
> > > > > +#define       CSI_PP_PAD_SHORT_LINE_PAD0S            (0 << 24)
> > > > > +#define       CSI_PP_PAD_SHORT_LINE_PAD1S            (1 << 24)
> > > > > +#define       CSI_PP_PAD_SHORT_LINE_NOPAD            (2 << 24)
> > > > > +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED          BIT(20)
> > > > > +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY         (0 << 16)
> > > > > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL             (1 << 16)
> > > > > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP         (2 << 16)
> > > > > +#define       CSI_PP_OUTPUT_FORMAT_STORE             (3 << 16)
> > > > > +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)           (((n) - 1) =
<< 14)
> > > > > +#define       CSI_PP_DATA_TYPE(n)                    ((n) << 8)
> > > > > +#define       CSI_PP_CRC_CHECK_ENABLE                        BIT=
(7)
> > > > > +#define       CSI_PP_WORD_COUNT_HEADER                       BIT=
(6)
> > > > > +#define       CSI_PP_DATA_IDENTIFIER_ENABLE          BIT(5)
> > > > > +#define       CSI_PP_PACKET_HEADER_SENT                      BIT=
(4)
> > > > > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)           (0x001c + (=
n) * 0x2c)
> > > > > +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)         (0x0020 + (=
n) * 0x2c)
> > > > > +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)                        (0x=
0024 + (n) * 0x2c)
> > > > > +#define       CSI_PP_FRAME_MIN_GAP(n)                        (((=
n) & 0xffff) << 16)
> > > > > +#define       CSI_PP_LINE_MIN_GAP(n)                 (((n) & 0xf=
fff))
> > > > > +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)         (0x0028 + (=
n) * 0x2c)
> > > > > +#define       CSI_PP_START_MARKER_FRAME_MAX(n)               (((=
n) & 0xf) << 12)
> > > > > +#define       CSI_PP_START_MARKER_FRAME_MIN(n)               (((=
n) & 0xf) << 8)
> > > > > +#define       CSI_PP_VSYNC_START_MARKER                      BIT=
(4)
> > > > > +#define       CSI_PP_SINGLE_SHOT                     BIT(2)
> > > > > +#define       CSI_PP_NOP                             0
> > > > > +#define       CSI_PP_ENABLE                          1
> > > > > +#define       CSI_PP_DISABLE                         2
> > > > > +#define       CSI_PP_RESET                           3
> > > > > +#define TEGRA_CSI_PHY_CIL_COMMAND                    0x0068
> > > > > +#define       CSI_A_PHY_CIL_NOP                              0x0
> > > > > +#define       CSI_A_PHY_CIL_ENABLE                   0x1
> > > > > +#define       CSI_A_PHY_CIL_DISABLE                  0x2
> > > > > +#define       CSI_A_PHY_CIL_ENABLE_MASK                      0x3
> > > > > +#define       CSI_B_PHY_CIL_NOP                              (0x=
0 << 16)
> > > > > +#define       CSI_B_PHY_CIL_ENABLE                   (0x1 << 16)
> > > > > +#define       CSI_B_PHY_CIL_DISABLE                  (0x2 << 16)
> > > > > +#define       CSI_B_PHY_CIL_ENABLE_MASK                      (0x=
3 << 16)
> > > > > +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)                        (0x=
006c + (n) * 4)
> > > > > +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE               BIT=
(5)
> > > > > +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS            0x0078
> > > > > +#define TEGRA_CSI_CSI_CIL_STATUS                     0x007c
> > > > > +#define       CSI_MIPI_AUTO_CAL_DONE                 BIT(15)
> > > > > +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK    0x0080
> > > > > +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK             0x0084
> > > > > +#define TEGRA_CSI_CSI_READONLY_STATUS                        0x0=
088
> > > > > +#define TEGRA_CSI_ESCAPE_MODE_COMMAND                        0x0=
08c
> > > > > +#define TEGRA_CSI_ESCAPE_MODE_DATA                   0x0090
> > > > > +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)                 (0x0094 + (=
n) * 8)
> > > > > +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)                 (0x0098 + (=
n) * 8)
> > > > > +#define TEGRA_CSI_CIL_PAD_CONFIG                     0x00a4
> > > > > +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG                       0x0=
0a8
> > > > > +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG                       0x0=
0ac
> > > > > +#define       CSI_CIL_MIPI_CAL_STARTCAL                      BIT=
(31)
> > > > > +#define       CSI_CIL_MIPI_CAL_OVERIDE_A             BIT(30)
> > > > > +#define       CSI_CIL_MIPI_CAL_OVERIDE_B             BIT(30)
> > > > > +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)          (((n) & 0xf=
) << 26)
> > > > > +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)           (((n) & 0x3=
) << 24)
> > > > > +#define       CSI_CIL_MIPI_CAL_SEL_A                 BIT(21)
> > > > > +#define       CSI_CIL_MIPI_CAL_SEL_B                 BIT(21)
> > > > > +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)             (((n) & 0x1=
f) << 16)
> > > > > +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)             (((n) & 0x1=
f) << 8)
> > > > > +#define       CSI_CIL_MIPI_CAL_TERMOS(n)             (((n) & 0x1=
f))
> > > > > +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS                        0x0=
0b0
> > > > > +#define TEGRA_CSI_CLKEN_OVERRIDE                     0x00b4
> > > > > +#define TEGRA_CSI_DEBUG_CONTROL                              0x0=
0b8
> > > > > +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED     BIT(0)
> > > > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0                BIT=
(4)
> > > > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1                BIT=
(5)
> > > > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2                BIT=
(6)
> > > > > +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)    ((v) << (8 =
+ 8 * (n)))
> > > > > +#define TEGRA_CSI_DEBUG_COUNTER(n)                   (0x00bc + (=
n) * 4)
> > > > > +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)     (0x00c8 + (=
n) * 4)
> > > > > +#define       CSI_PP_EXP_FRAME_HEIGHT(n)             (((n) & 0x1=
fff) << 16)
> > > > > +#define       CSI_PP_MAX_CLOCKS(n)                   (((n) & 0xf=
ff) << 4)
> > > > > +#define       CSI_PP_LINE_TIMEOUT_ENABLE             BIT(0)
> > > > > +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG                        0x0=
0d0
> > > > > +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG                        0x0=
0d4
> > > > > +#define       CSI_PAD_DRIV_DN_REF(n)                 (((n) & 0x7=
) << 16)
> > > > > +#define       CSI_PAD_DRIV_UP_REF(n)                 (((n) & 0x7=
) << 8)
> > > > > +#define       CSI_PAD_TERM_REF(n)                    (((n) & 0x7=
) << 0)
> > > > > +#define TEGRA_CSI_CSI_CILA_STATUS                    0x00d8
> > > > > +#define TEGRA_CSI_CSI_CILB_STATUS                    0x00dc
> > > > > +
> > > > >  /* -------------------------------------------------------------=
-------------
> > > > > - * VI
> > > > > + * Read and Write helpers
> > > > >   */
> > > > >
> > > > >  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsi=
gned int addr, u32 val)
> > > > > @@ -161,6 +272,35 @@ static void tegra20_vi_write(struct tegra_vi=
_channel *chan, unsigned int addr, u
> > > > >       writel(val, chan->vi->iomem + addr);
> > > > >  }
> > > > >
> > > > > +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channe=
l *chan, unsigned int addr)
> > > > > +{
> > > > > +     return readl(chan->vi->iomem + addr);
> > > > > +}
> > > > > +
> > > > > +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan=
, unsigned int addr, u32 val)
> > > > > +{
> > > > > +     writel(val, csi_chan->csi->iomem + addr);
> > > > > +}
> > > > > +
> > > > > +static int __maybe_unused tegra20_csi_read(struct tegra_csi_chan=
nel *csi_chan, unsigned int addr)
> > > > > +{
> > > > > +     return readl(csi_chan->csi->iomem + addr);
> > > > > +}
> > > > > +
> > > > > +static void tegra20_mipi_write(struct tegra_csi *csi, unsigned i=
nt addr, u32 val)
> > > > > +{
> > > > > +     writel(val, csi->iomem + addr);
> > > > > +}
> > > > > +
> > > > > +static int __maybe_unused tegra20_mipi_read(struct tegra_csi *cs=
i, unsigned int addr)
> > > > > +{
> > > > > +     return readl(csi->iomem + addr);
> > > > > +}
> > > > > +
> > > > > +/* -------------------------------------------------------------=
-------------
> > > > > + * VI
> > > > > + */
> > > > > +
> > > > >  /*
> > > > >   * Get the main input format (YUV/RGB...) and the YUV variant as=
 values to
> > > > >   * be written into registers for the current VI input mbus code.
> > > > > @@ -283,20 +423,27 @@ static int tegra20_vi_enable(struct tegra_v=
i *vi, bool on)
> > > > >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_ch=
annel *chan)
> > > > >  {
> > > > >       struct tegra_vi *vi =3D chan->vi;
> > > > > -     struct host1x_syncpt *out_sp;
> > > > > +     struct host1x_syncpt *out_sp, *fs_sp;
> > > > >
> > > > >       out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT=
_CLIENT_MANAGED);
> > > > >       if (!out_sp)
> > > > > -             return dev_err_probe(vi->dev, -ENOMEM, "failed to r=
equest syncpoint\n");
> > > > > +             return dev_err_probe(vi->dev, -EBUSY, "failed to re=
quest mw ack syncpoint\n");
> > > > >
> > > > >       chan->mw_ack_sp[0] =3D out_sp;
> > > > >
> > > > > +     fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_=
CLIENT_MANAGED);
> > > > > +     if (!fs_sp)
> > > > > +             return dev_err_probe(vi->dev, -EBUSY, "failed to re=
quest frame start syncpoint\n");
> > > > > +
> > > > > +     chan->frame_start_sp[0] =3D fs_sp;
> > > > > +
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > >  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_c=
hannel *chan)
> > > > >  {
> > > > >       host1x_syncpt_put(chan->mw_ack_sp[0]);
> > > > > +     host1x_syncpt_put(chan->frame_start_sp[0]);
> > > > >  }
> > > > >
> > > > >  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsig=
ned int bpp)
> > > > > @@ -418,41 +565,79 @@ static void tegra20_channel_vi_buffer_setup=
(struct tegra_vi_channel *chan,
> > > > >  }
> > > > >
> > > > >  static int tegra20_channel_capture_frame(struct tegra_vi_channel=
 *chan,
> > > > > -                                      struct tegra_channel_buffe=
r *buf)
> > > > > +                                      struct tegra_channel_buffe=
r *buf,
> > > > > +                                      struct tegra_csi_channel *=
csi_chan)
> > > > >  {
> > > > > +     u32 val;
> > > > >       int err;
> > > > >
> > > > > -     chan->next_out_sp_idx++;
> > > > > -
> > > > >       tegra20_channel_vi_buffer_setup(chan, buf);
> > > > >
> > > > > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_C=
ONTROL_VIP_ENABLE);
> > > > > +     if (csi_chan) {
> > > > > +             u32 port =3D csi_chan->csi_port_nums[0] & 1;
> > > > > +
> > > > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_=
PP_COMMAND(port),
> > > > > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf=
) |
> > > > > +                               CSI_PP_SINGLE_SHOT | CSI_PP_ENABL=
E);
> > > > > +
> > > > > +             val =3D host1x_syncpt_read(chan->frame_start_sp[0])=
;
> > > > > +             do {
> > > > > +                     err =3D host1x_syncpt_wait(chan->frame_star=
t_sp[0],
> > > > > +                                              val + 1, TEGRA_VI_=
SYNCPT_WAIT_TIMEOUT, NULL);
> > > > > +             } while (err =3D=3D -ERESTARTSYS);
> > > >
> > > > This function is called only from a kthread, so I don't think it's =
possible for any functions to return -ERESTARTSYS. Have you seen otherwise?=
 (Anyway, it it were possible, we should add a parameter to host1x_syncpt_w=
ait to specify whether the wait should be interruptible or not, instead of =
working around it)
> > > >
> > >
> > > This is caused by dma_fence_wait_timeout being unconditionally
> > > interruptible. I do not want to touch host1x stuff, this patchset
> > > already takes too much resources.
> >
> > Sure, I don't think we need to change host1x. Since this function is on=
ly called from non-user context, even if the wait is interruptible it shoul=
d never be actually interrupted. So I think you can just drop the ERESTARTS=
YS handling.
> >
> > >
> > > > > +
> > > > > +             if (err) {
> > > > > +                     if (err !=3D -ERESTARTSYS)
> > > > > +                             dev_err_ratelimited(&chan->video.de=
v,
> > > > > +                                                 "frame start sy=
ncpt timeout: %d\n", err);
> > > > > +
> > > > > +                     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL=
_STREAM_PP_COMMAND(port),
> > > > > +                                       CSI_PP_START_MARKER_FRAME=
_MAX(0xf) | CSI_PP_RESET);
> > > > > +                     goto exit;
> > > > > +             }
> > > > > +
> > > > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_=
PP_COMMAND(port),
> > > > > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf=
) |
> > > > > +                               CSI_PP_DISABLE);
> > > > > +     } else {
> > > > > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_=
CAMERA_CONTROL_VIP_ENABLE);
> > > > > +     }
> > > > > +
> > > > > +     val =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> > > > > +     do {
> > > > > +             err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], val =
+ 1,
> > > > > +                                      TEGRA_VI_SYNCPT_WAIT_TIMEO=
UT, NULL);
> > > > > +     } while (err =3D=3D -ERESTARTSYS);
> > > > >
> > > > > -     /* Wait for syncpt counter to reach frame start event thres=
hold */
> > > > > -     err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_o=
ut_sp_idx,
> > > > > -                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL=
);
> > > > >       if (err) {
> > > > > -             host1x_syncpt_incr(chan->mw_ack_sp[0]);
> > > > > -             dev_err_ratelimited(&chan->video.dev, "frame start =
syncpt timeout: %d\n", err);
> > > > > -             release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> > > > > -             return err;
> > > > > +             if (err !=3D -ERESTARTSYS)
> > > > > +                     dev_err_ratelimited(&chan->video.dev, "mw a=
ck syncpt timeout: %d\n", err);
> > > > > +             goto exit;
> > > > >       }
> > > > >
> > > > > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > > > > -                      VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA=
_CONTROL_VIP_ENABLE);
> > > > > +     if (!csi_chan)
> > > > > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > > > > +                              VI_CAMERA_CONTROL_STOP_CAPTURE | V=
I_CAMERA_CONTROL_VIP_ENABLE);
> > > > >
> > > > > +exit:
> > > > >       release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> > > > >
> > > > > -     return 0;
> > > > > +     return err;
> > > > >  }
> > > > >
> > > > >  static int tegra20_chan_capture_kthread_start(void *data)
> > > > >  {
> > > > >       struct tegra_vi_channel *chan =3D data;
> > > > >       struct tegra_channel_buffer *buf;
> > > > > +     struct v4l2_subdev *csi_subdev =3D NULL;
> > > > > +     struct tegra_csi_channel *csi_chan =3D NULL;
> > > > >       unsigned int retries =3D 0;
> > > > >       int err =3D 0;
> > > > >
> > > > > +     csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> > > > > +     if (csi_subdev)
> > > > > +             csi_chan =3D to_csi_chan(csi_subdev);
> > > > > +
> > > > >       while (1) {
> > > > >               /*
> > > > >                * Source is not streaming if error is non-zero.
> > > > > @@ -477,7 +662,7 @@ static int tegra20_chan_capture_kthread_start=
(void *data)
> > > > >               list_del_init(&buf->queue);
> > > > >               spin_unlock(&chan->start_lock);
> > > > >
> > > > > -             err =3D tegra20_channel_capture_frame(chan, buf);
> > > > > +             err =3D tegra20_channel_capture_frame(chan, buf, cs=
i_chan);
> > > > >               if (!err) {
> > > > >                       retries =3D 0;
> > > > >                       continue;
> > > > > @@ -504,28 +689,6 @@ static void tegra20_camera_capture_setup(str=
uct tegra_vi_channel *chan)
> > > > >       enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGR=
A_IMAGE_DT_RAW8 ||
> > > > >                                           data_type =3D=3D TEGRA_=
IMAGE_DT_RAW10) ?
> > > > >                                           TEGRA_VI_OUT_2 : TEGRA_=
VI_OUT_1;
> > > > > -     int main_output_format;
> > > > > -     int yuv_output_format;
> > > > > -
> > > > > -     tegra20_vi_get_output_formats(chan, &main_output_format, &y=
uv_output_format);
> > > > > -
> > > > > -     /*
> > > > > -      * Set up low pass filter.  Use 0x240 for chromaticity and =
0x240
> > > > > -      * for luminance, which is the default and means not to tou=
ch
> > > > > -      * anything.
> > > > > -      */
> > > > > -     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > > > > -                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > > > > -                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > > > > -
> > > > > -     /* Set up raise-on-edge, so we get an interrupt on end of f=
rame. */
> > > > > -     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_ED=
GE);
> > > > > -
> > > > > -     tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_ch=
annel),
> > > > > -                      (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) =
|
> > > > > -                      (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) =
|
> > > > > -                      yuv_output_format << VI_OUTPUT_YUV_OUTPUT_=
FORMAT_SFT |
> > > > > -                      main_output_format << VI_OUTPUT_OUTPUT_FOR=
MAT_SFT);
> > > > >
> > > > >       /* Set up frame size */
> > > > >       tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_ch=
annel),
> > > > > @@ -556,18 +719,28 @@ static int tegra20_vi_start_streaming(struc=
t vb2_queue *vq, u32 count)
> > > > >       struct media_pipeline *pipe =3D &chan->video.pipe;
> > > > >       int err;
> > > > >
> > > > > -     chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_s=
p[0]);
> > > > > -
> > > > >       err =3D video_device_pipeline_start(&chan->video, pipe);
> > > > >       if (err)
> > > > >               goto error_pipeline_start;
> > > > >
> > > > > -     tegra20_camera_capture_setup(chan);
> > > > > +     /*
> > > > > +      * Set up low pass filter.  Use 0x240 for chromaticity and =
0x240
> > > > > +      * for luminance, which is the default and means not to tou=
ch
> > > > > +      * anything.
> > > > > +      */
> > > > > +     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > > > > +                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > > > > +                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > > > > +
> > > > > +     /* Set up raise-on-edge, so we get an interrupt on end of f=
rame. */
> > > > > +     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_ED=
GE);
> > > > >
> > > > >       err =3D tegra_channel_set_stream(chan, true);
> > > > >       if (err)
> > > > >               goto error_set_stream;
> > > > >
> > > > > +     tegra20_camera_capture_setup(chan);
> > > > > +
> > > > >       chan->sequence =3D 0;
> > > > >
> > > > >       chan->kthread_start_capture =3D kthread_run(tegra20_chan_ca=
pture_kthread_start,
> > > > > @@ -662,6 +835,345 @@ const struct tegra_vi_soc tegra20_vi_soc =
=3D {
> > > > >       .has_h_v_flip =3D true,
> > > > >  };
> > > > >
> > > > > +/* -------------------------------------------------------------=
-------------
> > > > > + * MIPI Calibration
> > > > > + */
> > > > > +static int tegra20_start_pad_calibration(struct tegra_mipi_devic=
e *mipi)
> > > > > +{
> > > > > +     struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> > > > > +     unsigned int port =3D mipi->pads;
> > > > > +     u32 value;
> > > > > +     int ret;
> > > > > +
> > > > > +     guard(mutex)(&csi->mipi_lock);
> > > > > +
> > > > > +     ret =3D pm_runtime_resume_and_get(csi->dev);
> > > > > +     if (ret < 0) {
> > > > > +             dev_err(csi->dev, "failed to get runtime PM: %d\n",=
 ret);
> > > > > +             return ret;
> > > > > +     }
> > > > > +
> > > > > +     tegra20_mipi_write(csi, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> > > > > +                        CSI_CIL_MIPI_CAL_HSPDOS(4) |
> > > > > +                        CSI_CIL_MIPI_CAL_HSPUOS(3) |
> > > > > +                        CSI_CIL_MIPI_CAL_TERMOS(0));
> > > > > +     tegra20_mipi_write(csi, TEGRA_CSI_MIPIBIAS_PAD_CONFIG,
> > > > > +                        CSI_PAD_DRIV_DN_REF(5) |
> > > > > +                        CSI_PAD_DRIV_UP_REF(7) |
> > > > > +                        CSI_PAD_TERM_REF(0));
> > > > > +
> > > > > +     /* CSI B */
> > > > > +     value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > > > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > > > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > > > > +
> > > > > +     if (port =3D=3D PORT_B)
> > > > > +             value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> > > > > +
> > > > > +     tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, val=
ue);
> > > > > +
> > > > > +     /* CSI A */
> > > > > +     value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> > > > > +             CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > > > > +             CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > > > > +             CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > > > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > > > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > > > > +
> > > > > +     if (port =3D=3D PORT_A)
> > > > > +             value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> > > > > +
> > > > > +     tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, val=
ue);
> > > > > +
> > > > > +     tegra20_mipi_write(csi, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int tegra20_finish_pad_calibration(struct tegra_mipi_devi=
ce *mipi)
> > > > > +{
> > > > > +     struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> > > > > +     void __iomem *cil_status_reg =3D csi->iomem + TEGRA_CSI_CSI=
_CIL_STATUS;
> > > > > +     unsigned int port =3D mipi->pads;
> > > > > +     u32 value, pp =3D 0, cil =3D 0;
> > > > > +     int ret;
> > > > > +
> > > > > +     /* This part is only for CSI */
> > > > > +     if (port > PORT_B) {
> > > > > +             pm_runtime_put(csi->dev);
> > > > > +
> > > > > +             return 0;
> > > > > +     }
> > > > > +
> > > > > +     guard(mutex)(&csi->mipi_lock);
> > > > > +
> > > > > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > > > > +                                      value & CSI_MIPI_AUTO_CAL_=
DONE, 50, 250000);
> > > > > +     if (ret < 0) {
> > > > > +             dev_warn(csi->dev, "MIPI calibration timeout!\n");
> > > > > +             goto exit;
> > > > > +     }
> > > > > +
> > > > > +     /* clear status */
> > > > > +     tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, value);
> > > > > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > > > > +                                      !(value & CSI_MIPI_AUTO_CA=
L_DONE), 50, 250000);
> > > > > +     if (ret < 0) {
> > > > > +             dev_warn(csi->dev, "MIPI calibration status timeout=
!\n");
> > > > > +             goto exit;
> > > > > +     }
> > > > > +
> > > > > +     pp =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_PIXEL_PARSER_ST=
ATUS);
> > > > > +     cil =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_CIL_STATUS);
> > > > > +     if (pp | cil) {
> > > > > +             dev_warn(csi->dev, "Calibration status not been cle=
ared!\n");
> > > > > +             ret =3D -EINVAL;
> > > > > +             goto exit;
> > > > > +     }
> > > > > +
> > > > > +exit:
> > > > > +     tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, pp);
> > > > > +
> > > > > +     /* un-select to avoid interference with DSI */
> > > > > +     tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> > > > > +                        CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > > > +                        CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > > > +                        CSI_CIL_MIPI_CAL_TERMOS(4));
> > > > > +
> > > > > +     tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> > > > > +                        CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > > > > +                        CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > > > > +                        CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > > > +                        CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > > > +                        CSI_CIL_MIPI_CAL_TERMOS(4));
> > > > > +
> > > > > +     pm_runtime_put(csi->dev);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > > +static const struct tegra_mipi_ops tegra20_mipi_ops =3D {
> > > > > +     .start_calibration =3D tegra20_start_pad_calibration,
> > > > > +     .finish_calibration =3D tegra20_finish_pad_calibration,
> > > > > +};
> > > > > +
> > > > > +/* -------------------------------------------------------------=
-------------
> > > > > + * CSI
> > > > > + */
> > > > > +static void tegra20_csi_capture_clean(struct tegra_csi_channel *=
csi_chan)
> > > > > +{
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTR=
OL, 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CON=
TROL, 0);
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STAT=
US, 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTE=
RRUPT_MASK, 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MAS=
K, 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, =
0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, =
0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, =
0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> > > > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> > > > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> > > > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> > > > > +}
> > > > > +
> > > > > +static int tegra20_csi_port_start_streaming(struct tegra_csi_cha=
nnel *csi_chan,
> > > > > +                                         u8 portno)
> > > > > +{
> > > > > +     struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostda=
ta(&csi_chan->subdev);
> > > > > +     int width  =3D vi_chan->format.width;
> > > > > +     int height =3D vi_chan->format.height;
> > > > > +     u32 data_type =3D vi_chan->fmtinfo->img_dt;
> > > > > +     u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / =
8;
> > > > > +     enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> > > > > +
> > > > > +     unsigned int main_output_format, yuv_output_format;
> > > > > +     unsigned int port =3D portno & 1;
> > > > > +     u32 value;
> > > > > +
> > > > > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format,=
 &yuv_output_format);
> > > > > +
> > > > > +     switch (data_type) {
> > > > > +     case TEGRA_IMAGE_DT_RAW8:
> > > > > +     case TEGRA_IMAGE_DT_RAW10:
> > > > > +             output_channel =3D TEGRA_VI_OUT_2;
> > > > > +             if (port =3D=3D PORT_A)
> > > > > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FOR=
MAT_CSI_PPA_BAYER;
> > > > > +             else
> > > > > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FOR=
MAT_CSI_PPB_BAYER;
> > > > > +             break;
> > > > > +     }
> > > > > +
> > > > > +     tegra20_csi_capture_clean(csi_chan);
> > > > > +
> > > > > +     /* CSI port cleanup */
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(=
port), 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0=
(port), 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1=
(port), 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COU=
NT(port), 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port=
), 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMA=
ND(port), 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED=
_FRAME(port), 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port=
), 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port)=
, 0);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port)=
, 0);
> > > > > +
> > > > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 =
+ port)); /* CSI_PP_YUV422 */
> > > > > +
> > > > > +     tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT=
(2 + port)); /* CSI_PP */
> > > > > +     tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT=
(2 + port)); /* CSI_PP */
> > > > > +
> > > > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), w=
idth << 16);
> > > > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), h=
eight << 16);
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1=
(port), 0x1);
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COU=
NT(port), word_count);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port=
),
> > > > > +                       CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clk=
s between frames */
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED=
_FRAME(port),
> > > > > +                       CSI_PP_EXP_FRAME_HEIGHT(height) |
> > > > > +                       CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 =
vi clks for timeout */
> > > > > +                       CSI_PP_LINE_TIMEOUT_ENABLE);
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0=
(port),
> > > > > +                       CSI_PP_OUTPUT_FORMAT_PIXEL |
> > > > > +                       CSI_PP_DATA_TYPE(data_type) |
> > > > > +                       CSI_PP_CRC_CHECK_ENABLE |
> > > > > +                       CSI_PP_WORD_COUNT_HEADER |
> > > > > +                       CSI_PP_DATA_IDENTIFIER_ENABLE |
> > > > > +                       CSI_PP_PACKET_HEADER_SENT |
> > > > > +                       port);
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(=
port),
> > > > > +                       CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> > > > > +                       (csi_chan->numlanes - 1));
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port=
),
> > > > > +                       CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> > > > > +                       0x5); /* Clock settle time */
> > > > > +
> > > > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME=
_START(port),
> > > > > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > > > > +                      host1x_syncpt_id(vi_chan->frame_start_sp[0=
])
> > > > > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > > > > +
> > > > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_c=
hannel),
> > > > > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > > > > +                      host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> > > > > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > > > > +
> > > > > +     value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI=
_B_PHY_CIL_DISABLE :
> > > > > +             CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, valu=
e);
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMA=
ND(port),
> > > > > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > > > +                       CSI_PP_DISABLE);
> > > > > +
> > > > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output=
_channel),
> > > > > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : =
0) |
> > > > > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : =
0) |
> > > > > +                      yuv_output_format | main_output_format);
> > > > > +
> > > > > +     return 0;
> > > > > +};
> > > > > +
> > > > > +static void tegra20_csi_port_stop_streaming(struct tegra_csi_cha=
nnel *csi_chan, u8 portno)
> > > > > +{
> > > > > +     struct tegra_csi *csi =3D csi_chan->csi;
> > > > > +     unsigned int port =3D portno & 1;
> > > > > +     u32 value;
> > > > > +
> > > > > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PA=
RSER_STATUS);
> > > > > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x=
\n", value);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STAT=
US, value);
> > > > > +
> > > > > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STAT=
US);
> > > > > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", valu=
e);
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value=
);
> > > > > +
> > > > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMA=
ND(port),
> > > > > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > > > +                       CSI_PP_DISABLE);
> > > > > +
> > > > > +     if (csi_chan->numlanes =3D=3D 4) {
> > > > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMA=
ND,
> > > > > +                               CSI_A_PHY_CIL_DISABLE | CSI_B_PHY=
_CIL_DISABLE);
> > > > > +     } else {
> > > > > +             value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISA=
BLE | CSI_B_PHY_CIL_NOP :
> > > > > +                     CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> > > > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMA=
ND, value);
> > > > > +     }
> > > > > +}
> > > > > +
> > > > > +static int tegra20_csi_start_streaming(struct tegra_csi_channel =
*csi_chan)
> > > > > +{
> > > > > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > > > > +     int ret, i;
> > > > > +
> > > > > +     for (i =3D 0; i < csi_chan->numgangports; i++) {
> > > > > +             ret =3D tegra20_csi_port_start_streaming(csi_chan, =
portnos[i]);
> > > > > +             if (ret)
> > > > > +                     goto stream_start_fail;
> > > > > +     }
> > > > > +
> > > > > +     return 0;
> > > > > +
> > > > > +stream_start_fail:
> > > > > +     for (i =3D i - 1; i >=3D 0; i--)
> > > > > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i=
]);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > > +static void tegra20_csi_stop_streaming(struct tegra_csi_channel =
*csi_chan)
> > > > > +{
> > > > > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > > > > +     int i;
> > > > > +
> > > > > +     for (i =3D 0; i < csi_chan->numgangports; i++)
> > > > > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i=
]);
> > > > > +}
> > > > > +
> > > > > +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> > > > > +     .csi_start_streaming =3D tegra20_csi_start_streaming,
> > > > > +     .csi_stop_streaming =3D tegra20_csi_stop_streaming,
> > > > > +};
> > > > > +
> > > > > +static const char * const tegra20_csi_clks[] =3D {
> > > > > +     NULL,
> > > > > +};
> > > > > +
> > > > > +const struct tegra_csi_soc tegra20_csi_soc =3D {
> > > > > +     .ops =3D &tegra20_csi_ops,
> > > > > +     .mipi_ops =3D &tegra20_mipi_ops,
> > > > > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > > > > +     .clk_names =3D tegra20_csi_clks,
> > > > > +     .num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> > > > > +};
> > > > > +
> > > > > +static const char * const tegra30_csi_clks[] =3D {
> > > > > +     "csi",
> > > > > +     "csia-pad",
> > > > > +     "csib-pad",
> > > > > +};
> > > > > +
> > > > > +const struct tegra_csi_soc tegra30_csi_soc =3D {
> > > > > +     .ops =3D &tegra20_csi_ops,
> > > > > +     .mipi_ops =3D &tegra20_mipi_ops,
> > > > > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > > > > +     .clk_names =3D tegra30_csi_clks,
> > > > > +     .num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> > > > > +};
> > > > > +
> > > > >  /* -------------------------------------------------------------=
-------------
> > > > >   * VIP
> > > > >   */
> > > > > @@ -681,10 +1193,11 @@ static int tegra20_vip_start_streaming(str=
uct tegra_vip_channel *vip_chan)
> > > > >       enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGR=
A_IMAGE_DT_RAW8 ||
> > > > >                                           data_type =3D=3D TEGRA_=
IMAGE_DT_RAW10) ?
> > > > >                                           TEGRA_VI_OUT_2 : TEGRA_=
VI_OUT_1;
> > > > > -     unsigned int main_input_format;
> > > > > -     unsigned int yuv_input_format;
> > > > > +     unsigned int main_input_format, yuv_input_format;
> > > > > +     unsigned int main_output_format, yuv_output_format;
> > > > >
> > > > >       tegra20_vi_get_input_formats(vi_chan, &main_input_format, &=
yuv_input_format);
> > > > > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format,=
 &yuv_output_format);
> > > > >
> > > > >       tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> > > > >
> > > > > @@ -717,6 +1230,11 @@ static int tegra20_vip_start_streaming(stru=
ct tegra_vip_channel *vip_chan)
> > > > >
> > > > >       tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMER=
A_CONTROL_STOP_CAPTURE);
> > > > >
> > > > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output=
_channel),
> > > > > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : =
0) |
> > > > > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : =
0) |
> > > > > +                       yuv_output_format | main_output_format);
> > > > > +
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/sta=
ging/media/tegra-video/vi.h
> > > > > index 5cbc0606ed6c..bad55e0bd313 100644
> > > > > --- a/drivers/staging/media/tegra-video/vi.h
> > > > > +++ b/drivers/staging/media/tegra-video/vi.h
> > > > > @@ -125,7 +125,6 @@ struct tegra_vi {
> > > > >   *           frame through host1x syncpoint counters (On Tegra20=
 used for the
> > > > >   *              OUT_1 syncpt)
> > > > >   * @sp_incr_lock: protects cpu syncpoint increment.
> > > > > - * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. =
OUT_1 (Tegra20)
> > > > >   *
> > > > >   * @kthread_start_capture: kthread to start capture of single fr=
ame when
> > > > >   *           vb buffer is available. This thread programs VI CSI=
 hardware
> > > > > @@ -188,7 +187,6 @@ struct tegra_vi_channel {
> > > > >       struct host1x_syncpt *mw_ack_sp[GANG_PORTS_MAX];
> > > > >       /* protects the cpu syncpoint increment */
> > > > >       spinlock_t sp_incr_lock[GANG_PORTS_MAX];
> > > > > -     u32 next_out_sp_idx;
> > > > >
> > > > >       struct task_struct *kthread_start_capture;
> > > > >       wait_queue_head_t start_wait;
> > > > > diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/=
staging/media/tegra-video/video.c
> > > > > index 6fe8d5301b9c..9f2bddc460bf 100644
> > > > > --- a/drivers/staging/media/tegra-video/video.c
> > > > > +++ b/drivers/staging/media/tegra-video/video.c
> > > > > @@ -127,6 +127,12 @@ static const struct of_device_id host1x_vide=
o_subdevs[] =3D {
> > > > >       { .compatible =3D "nvidia,tegra20-vip", },
> > > > >       { .compatible =3D "nvidia,tegra20-vi", },
> > > > >  #endif
> > > > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > > > +     { .compatible =3D "nvidia,tegra20-csi", },
> > > > > +#endif
> > > > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > > > +     { .compatible =3D "nvidia,tegra30-csi", },
> > > > > +#endif
> > > > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > > > >       { .compatible =3D "nvidia,tegra210-csi", },
> > > > >       { .compatible =3D "nvidia,tegra210-vi", },
> > > > >
> > > >
> > > >
> > > >
> > > >
> >
> >
> >
> >




