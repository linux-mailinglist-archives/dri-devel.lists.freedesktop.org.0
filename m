Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF2C43038
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 17:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0377210E1C9;
	Sat,  8 Nov 2025 16:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11022139.outbound.protection.outlook.com [52.101.126.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B8410E1C9
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 16:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFw8Je5OiWl5IiQu47S7kCGdnWdFSfnBlIq5chf2JzKorQl5W7Fklbc8BUlOsU2UQgr8FncFRUpxShvJrue80reoZOS0Gq67ltrbOGibD5kwTnOu1mFBZ4gyiC+pZml12E426Kc9avdMkTC1AtLO1NupJCDV0A4PqwdEOSsTQmQml3+BxpDvojZEuyT0vd0/0pBz0aAiP2IKRWRBqSdWWuD3d5d7T/k4kqf4Z+8YRarYEfT5+mpNKM+RvP5/dqYTPIwtyOEMKiF7GuEhKuymwWsD7f+xB3uIjvUza+Flyj4WXIqQPTLkC9TA4M3M8jgWYLxutHQWAte7lDC5CiN+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Scs0AW7VFbiRh1D1gTYW1MkMBchPrmkaZOiKO/B3WhA=;
 b=Takrz8+LbAevU2w9TgZXfDHtKUdUfvUL6LvPrYinRFHL1eZNBlC7IEkoYp5EOuxGpeaUdF7PvtRJNlAUZt9IMU9/JOqDTfNWCubV0w/d9lTTU06l3Y9Xor4Wao5c4TpBa5T92wVQ4CW9icvCt5H9XmctGur/ftYOktPWceKjG2C1sDMsf/Pj8lGlxy/AUyXFS6V21n6tVLcscXDAFxFpx0OK+oes8tblHDnJAdrkQkthCEpiS1TdLzLRnwxnHJJ2mEpa5QPjiNdmqHFLP8U2Q9a0yh54V5ZElXVBabTYLD59qO5vt4tiwLorlIfM2oQ5pfQU8EYk9Oeb0kkLfbIoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by KUXPR06MB7997.apcprd06.prod.outlook.com (2603:1096:d10:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 16:59:06 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%6]) with mapi id 15.20.9275.013; Sat, 8 Nov 2025
 16:59:06 +0000
Message-ID: <02b20361-23cf-4aa7-8f85-875261e6cdc9@linumiz.com>
Date: Sat, 8 Nov 2025 17:58:50 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 17/22] phy: allwinner: phy-sun6i-mipi-dphy: add LVDS
 support
To: Paul Kocialkowski <paulk@sys-base.io>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-17-13b52f71fb14@linumiz.com>
 <aFu2VBhCIEdLIPv3@shepard>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <aFu2VBhCIEdLIPv3@shepard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::21) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|KUXPR06MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 993e9580-ef5b-49b5-0f81-08de1ee8207c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T001RHBpK1RzZ1JuN2JkNVdVdUdGc20ydkNPRUs4L29qM1B6N2EwZDV2ZlMw?=
 =?utf-8?B?K3NzT0x6djVWSm5xTWR5eFVwdjgxQ05RdVVvNnViWUE0R2dpWDViQkFaTjdR?=
 =?utf-8?B?M3RBQjZDbytaUk04cmRCaEQ1S1Z6bnROMEZNcENEOE13aVE5VnBGVDB3YUQ3?=
 =?utf-8?B?bHdQUWt1N21HaEE3eWVmN1B1bUY5SS9Fd2hsdHhINExuM3pkMTgxYlBoZFor?=
 =?utf-8?B?U09lVkRORVN6dnFBSWw0L1ZCL21oUm84Tjd6Zlc4aEo1SHp1TUtIWW9YUmdm?=
 =?utf-8?B?eVJpM1JJZ3FvZE9pOFJqYTJ5dy90elFtMEZpT0Y0S3RpaEd6K2l2MmNoN2ds?=
 =?utf-8?B?UVFaUHBLODk5d0FxV1hqWW5QQjZ4S1U5eGt6cTRtMWRxRUpUZHM3YXhIeGZk?=
 =?utf-8?B?SnlQZ0dDeEF0cU5EWThEVUd5YzhxSWlDQ0NhaFg3RXUwRDJtekx0ZnB5MTBI?=
 =?utf-8?B?VzBBSG5EN2FtUllKTmVSc2dKS1FZckx1MExybkdGdHJYQk5mcnE1VGlxNzRL?=
 =?utf-8?B?SnRRT2ZybFd6UG03MVZSMkpkdUliNlczZ2plNERlUlJhdTFleWhlUkhBbi9m?=
 =?utf-8?B?MVVsN0lPSEtSck93TDNrR0hHVWdsMzR3WDFsZ0tuQ0c4WCtPQXBkMkNYTnNE?=
 =?utf-8?B?ZE1oejA0QlBOeHZrYTFNRkNrQ2w3RTdQaHU1SEZRTE9tdSsxZ084U0tMSTVY?=
 =?utf-8?B?U1hGelV4Rkg5bExRQytRUmlsblZSeTN0QWVIeXQ5NkhqN1grR3VRWEs1eHFS?=
 =?utf-8?B?ZzR3aUJtQVh1VUJ3OTA3YzRjWCsrZzhjRHBzdlV6ZmZEcWpzcmtMcERrVit5?=
 =?utf-8?B?WWRRSWVOejNFdEtldmhTS2FIUmZIam5XL3NVZmZzQnVDeDJjUFlUSlZaOHVB?=
 =?utf-8?B?ZnEzRXFuNW5xeEVmL240RkZRWFVXRnF6RmhBYnpSZmo4VHVBaWZpTHdmNW9T?=
 =?utf-8?B?aGRJaDMrVFU1MU1xL3REcjlLZ05yMnRwUTJON0lFNkRTY3RZOWszZThMOGxR?=
 =?utf-8?B?bmRsNkFocWFCU0IzSW5odzNiOHoydzN1V2tIMFIxbm5NRUlXS3YwZFEwZy96?=
 =?utf-8?B?RFJFcE5kU29iU21Hb3ppWE9nNmRQUko3K0dDdHNueGIrUVp4Rkg4V0ZLcE5z?=
 =?utf-8?B?VTdwVkQzSEZBcEZoYWp2Tzg4VEtiU2hKMGwrTlpYKzhSdkpWeXZqVStKSDFk?=
 =?utf-8?B?Zkh6NnFUb2dNdE5wN3U2RUdQUHdZd0d3eHlOOWxSMFdEZHZXcHRyQjVMbHA2?=
 =?utf-8?B?M3pJUmsvKzROc29scFRzWTBxTmlvVS9WSWN4TnhQbXU0cDIyODlOQzR0ZGJ4?=
 =?utf-8?B?eXZJaFhzeUkvTWQ4UnJ3VExiRy9DUDVyd0FtRnZPclJGdEpvdW1yd3N3NnlH?=
 =?utf-8?B?bXNaN0VySXdjYzdOVFQyMnF2K1doQm5jdWFCWG1lVEEzZnVRMEtPc3RFL001?=
 =?utf-8?B?S3QreUJpempIaDIxVXRucHVuS1Qrc0ZIZGdxNTNJK1lyeXBuek5rNW42QkdD?=
 =?utf-8?B?QzRLL3JBVTZlbkwxQXM5UXdCRkEyZTYxQndjWGlKY1BLK3A4SkQwM2YxZUdP?=
 =?utf-8?B?RnBvUXduUk0wZysxbzRCSE5DVmxGVTVIRzhmai8ybGl1QWFvbVlzbWxJYjZ1?=
 =?utf-8?B?QitLN0FmVEVvZzI5WkE0UmVFQ1VNUi9NVVBFdE54Q0dUdE81Qk96NG5DRExs?=
 =?utf-8?B?dHdxY0RXcWRUdHc0WURnT1duY2gyVloyN3B4TGwyTTJoTVM5Zk5ZUUVsRkNQ?=
 =?utf-8?B?bVcvT0hLbTN1aEY4eXIrekpTa2tOU1JwNGpvTFN1QlpLaVRxWlNzWUtHSHMy?=
 =?utf-8?B?U3JIRDFBMVY3eU5rS3IydkF4c1FKNnZiVTJZNUFjbGFZZFlPTncxb2U5UGhV?=
 =?utf-8?B?b1pGZjlDTXZsUDFUTEVlOHlUZFlXaWlnL3Nmd1J5OGQrMlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6935.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1dZeUJ1dVp3UHhTMmlnYVhaU2Ewd2ZhbHlidVlQZWZSZWhPUFhsek80dURQ?=
 =?utf-8?B?dEU2OEx2bzgrdktyUzRQSjJKc0ZqbzhNUVU3YURmbFd1SCtONzUvcHc5TTdV?=
 =?utf-8?B?SUR1aFVETExZeHpZQWhjbFFBRmpPaG81SzludXdoREg3MmZ4ZUtSam1UbkxW?=
 =?utf-8?B?UTdKM1MvSXE2aEtnV3Z6QUF1cEVMZDRvK2ZRaEhIRm9SVVZZTy9HRnBxZzQw?=
 =?utf-8?B?UVpmVU9HOVB3Q1dFaDNLakdlMGxhOUNLaU9mNHpHYWx5NC9qc2kzZHpSOVlO?=
 =?utf-8?B?Ry9PRHJ1MHZFWUZSS09qS2RWOG1zM216V2s1M280WjVocjEzdDQxSUtYWUZF?=
 =?utf-8?B?c1FHTk9FdXNya2dMazJOOTIrZmwxVCtVeTl3TmphRTNGK1o3akhJaWErSDlH?=
 =?utf-8?B?ajhSRy9UMUF6Uyt4NzJyUTcxZ1ZwUi9DU1NIRUlzWE9tMTJCd2IwdVlReS9u?=
 =?utf-8?B?ck9kSERDKy9KcytEQVZ6VHo2d2cvOVFnYTFycTZ1UVFoaTFnUS8rRmlRQWpK?=
 =?utf-8?B?NFg0Q2Q0OW85S1pzM2ppTkRHTVI5MHpuV0lhRlhPREVsRFJXeWlLZWkzMTNy?=
 =?utf-8?B?YVk1cDhTaFBSV3ovRkoyS3dXWS9tWUtIWnQ5cVprWXBCNndjaVZkcTluS3RY?=
 =?utf-8?B?U2tObmY4b3hiRnNGSWw3UkZMajJ5VTFJRHN5ck96QTBZZno5eXl2WEtoY3N4?=
 =?utf-8?B?YWFWMitodGZGUk9hVWNsWEJEd0FpQStreEk5ZnRTU3BGc3FqbHFYaUwrZ3Ew?=
 =?utf-8?B?MjVyNkNRTExrQko2MXRkbXRJaTlMK2poWTRkVVljQktXWmx6ODhPZzVIeXB5?=
 =?utf-8?B?T3N6UldDTThzb3ZFRmJvTzk2UTVoTlpXSUVNNHpvejVkNnNlSktycGVjTWFt?=
 =?utf-8?B?Q0ZHQksxSmFBM1EwOUtKeC9iMC9RRFBXaHNTUHMyRFY4R0VmdEpkTyt3czVJ?=
 =?utf-8?B?RzJrenRUVU56b3lHbXBKZzBHK1dTSU5oQVlFV2xwMWF1dTNkTHIxWExHT2xW?=
 =?utf-8?B?RzE5VXBEUEJ0OCs2Z3FhbGxnNm4zMEtSZ3RPWE0xNVB6dU1FaU5xejRPMFpT?=
 =?utf-8?B?aC93eFRlT0UzZU43UnJ2UVcxTW53S1IxQUZOWWVkaHJIeVo2VUtzZjBmcm01?=
 =?utf-8?B?WFV3TkhtNDI1YkszUk1Md2orQ1Z5MlJIMm1EZmtxOFZUVW1UWHNnKzJReThH?=
 =?utf-8?B?SmdEdVJyOTZoc01YMHpjYnM2UEJpMlBubjNTUnY4NXJjQzlJQW9zWGhsS1NW?=
 =?utf-8?B?eEhabGlKTngyaUpBVFNHczJTUXc0dThwbFdSYUc3RXppWUpIT3VUWEI1OGsy?=
 =?utf-8?B?V0RHajM5RWNoVTFDM0hpU3VQM3Q3SUsrTGpMRHh0QmFCU1NKenR0N0ZQeFJI?=
 =?utf-8?B?ZHJyd1NtZXRKZWk3S21mYW5qSkRhTlMwV09ha3ZLaWhwVCtOcWJGVmM4VGZL?=
 =?utf-8?B?Tm44cXQybVZjSlU0N0RISFZjWkhrdkpPcnYzUmNFbDB1NDRUV25vZE9KZC9E?=
 =?utf-8?B?QXVUV3N4R2t6cTVWSk55emRGRXRtUURvdW8waXV1ZnhDTU4xZGlUUTh3VU9T?=
 =?utf-8?B?OVpmVk02ZVc4Mk9SZHQ5SU40M2N6eURyZFpBSmc4WmIvTzcvRUNHV0VLQjBP?=
 =?utf-8?B?R2w5YVZaS2pDVk12MElMdkt2eVE2MmJEUmNmS0xUSGozWWdIV04yaTU5cU1P?=
 =?utf-8?B?NEpaSTlOL29WVnhNUWkwM3NSUEJDTERKNW9rZFU4NTNGQUdpZVpOMnNhY2hV?=
 =?utf-8?B?ODFHb095ZG83andoajMrNUJ3M2l0V0RqbXJmNW1xY1o3Y0F6b1o4KzZvMFo5?=
 =?utf-8?B?V0t4dk9VL0FudkFOY3FRNzZZWklGNE05M3FmUzAzM3ZveTNkUUpLWk1VOFh3?=
 =?utf-8?B?SklIRDY0Q25oS0YyRk4vVmlGcXYyVlhydjk4OU9URS9VaEc0czByT0hJTGk1?=
 =?utf-8?B?OGpzc0pSZno4Rlh5Uldqb09hR01tOWVUTVFOVHJjRC94VUx4REJBNGxMZnZJ?=
 =?utf-8?B?QzJFaUx2MkYyQjR5RndSUFlNOWlBaUNkNzRIZ1dTMURidkZvQ1loaXV1UTVB?=
 =?utf-8?B?RHIvdXRKVjhHb1o4bXZ0dG9WMzdETGhnNzQxZm5zOTJ3YVNQR0FDSWRJbzU5?=
 =?utf-8?B?dEkxTkVYSVVVYmZYVDczVjBkVHlYMkZWOGV1OFVRM2hyY1dadjhtRi82TEFD?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993e9580-ef5b-49b5-0f81-08de1ee8207c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 16:59:06.0991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utRRfITuyhEzFOR60LtE155/9ufcgj1M8FT1pVYVMlSXf+6SfpmPF+XBiIR5FBn6g6sZIBAh70QCnch05H4QYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB7997
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

Dear Paul,

On 6/25/25 10:41 AM, Paul Kocialkowski wrote:
> Hi,
> 
> Thanks for your work on this!
> 
> On Fri 27 Dec 24, 16:38, Parthiban Nallathambi wrote:
>> DPHY in A100/A133 supports both LVDS and DSI. Combo phy register
>> have BIT(2) for enabling LVDS specifically, but enabling it alone
>> isn't functional.
>>
>> Both MIPI and LVDS needs to be enabled in the combo phy to get
>> the display working under LVDS mode. There is no specific enable
>> bit for LVDS apart from the one in combo phy. MIPI got enable
>> control in analog 4 register which must be disabled when using
>> in LVDS mode.
>>
>> Introduce set_mode in phy ops to control only for MIPI DSI.
> Similar work was already submitted for D1/T113-S3 LVDS support, which seems to
> be the exact same situation as the A133.
> 
> See: https://patchwork.freedesktop.org/series/145276/
> 
> I just made a review of that series and find it more elegant in various ways
> (especially since configuring the registers in set_mode is not the right place).
> So you probably want to follow-up on that series instead.
> 
> Note that both D1/T113-S3 and A133 support a second LVDS output, LVDS1, which
> uses the traditional TCON0 LVDS PHY. It would be great to be able to support
> both outputs as well as dual-link modes!

I have addressed the remaining part of the comments except this one. I will
wait for the other series to be addressed by Kuba or if not I will pick to my
tree and try to address it.

Does it makes sense to wait for that series to get merged / addressed or it
makes sense post my series for further review? My previous push was largely
complete because of mail server issues which I have fixed now and ready to push.

Thanks,
Parthiban> 
> All the best,
> 
> Paul

