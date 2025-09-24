Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20D6B98682
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 08:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FBB10E02C;
	Wed, 24 Sep 2025 06:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="i/WhGPqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B332410E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 06:40:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijq8S56uEw9uSbPHg7n7bSZGpYB24au3S+H5PSfXRfO6JE7LF0zF1ISdsS/1MZLHh3qMcUEahs+N/7JJYL4FBMmUwu2KUZLil5bUelpZEvw6OYDQ9Ts/1DJIZhNPlYOH4ulKRBUbtx85jbgcc+kmL0td9mITsiPg47VFTeGdSS+7cxkSLn7F+tqChSd6nx+6CM2RV/Lhe4Q15FSJtQzhMrEkA1409Y2Y+M8LDUY7oc6HSnXiS0eqSv+VyT4izyEuo1fGIppLwMMNrvTcm6ch42r2TgceM2Rh41JRDlX3LkFAaJEOoBZAbF+dU206zuR2ebYGhErDMzPtj2QIUSTg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnTpBhFcx+wy4uWdI6ITby077PKhlm2er4koU0xiwuo=;
 b=u40LGwEPgvMmHYm5WB0xUIdR2yRUxmIdzqLyKDbNbhXalzLn1rRnN3i7+rJK/QahanVLQU75g5IL88b+ezYZL6zMXG0Zbq2nZLkPU3NdvQzbdGkhj53ICAO3KyRHmRJ/hMx/zzGyGJzRYQpqss3hrioHUamzWjeG3U8Fsr2M6RaUVrx9v8LmX9ukDRuU2tRTSpnptcMtHi7jPHY8azdsxkWe0oCZs3NA/VU/AGtKqX+8okzTOic+LFyYRgeGJ5lEXCY4YMU0XI4hI55DxGZdlOA8fiprynMYIX1wOrFyRYRC4rUIA3fhfCEoWYuEpR/AkRZmSPY1ipDqD1iQMFYVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnTpBhFcx+wy4uWdI6ITby077PKhlm2er4koU0xiwuo=;
 b=i/WhGPqA5PG7xHsjQmEdJ6lzHlLvhZEFays2zlSuMCxDuouqQ5C2/n5LIA8ZCO9cDAOVM4WZZ7uam98iiH1p3VbLFMq/SY+Zu8sHL6GeR59G2qEjoibGr8Px9Fl9OjMU3cGZ239/BV6TSNzxqoQqULZZxqwniPS8ANDv6Osrzx15qSRfKZY4jYwPPYWuP4k2+SLE/MP4kJ7AQ+NrMPED+hEVcUU9q2UyvkY8c1al/7JCUIqtK954RVu3oqAJVtqW5n1beeCV7nUpCYjt3TAOgF26FiBNYhcqSgLIAsSW2Wi9FsXq3lpgWeQpx1hfLFbmNI94lC7/qjqrk4K3dYjbbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9980.eurprd04.prod.outlook.com (2603:10a6:800:1d0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 06:40:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 06:40:19 +0000
Message-ID: <eb070dbc-1e8e-437a-b519-69709b3feae4@nxp.com>
Date: Wed, 24 Sep 2025 14:41:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] drm/imx: dc: Add DPR channel support
To: Frank Li <Frank.li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
 <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0216.apcprd06.prod.outlook.com
 (2603:1096:4:68::24) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9980:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a9cc6a-6542-45b1-48fe-08ddfb353a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWZZaHJJRGt3dVRUb1hyRjdRQ1FHQlZ1S0M1RHRTenBTMjJTeVlKNmVWRjNN?=
 =?utf-8?B?T05WT0RYYXUwYW9RVVpHZER2bGtxd0k5RktqdGRlQXhSZjdka3BybVRPdEph?=
 =?utf-8?B?R1FBYmt1d1g0YVpvbFlUemJGYXV5UzdsWjJSeE1OZkhUNU56bGYrWmIvdmJ4?=
 =?utf-8?B?N3hoek03bktlNGlWdWxMMVR5OWgrUW1kcklQYUoydXhCZVE3V1l5U24yTXc3?=
 =?utf-8?B?aU5uZGVJVFFXTzZqNDYvZ0p5dEZRV05uWXhyak5Jb2h2SFRleVBJSDNTQmcw?=
 =?utf-8?B?NkUrTys2bDFPVGJPUVZpaXNab1lvY3FlQjA5L09JdDZMcGNDRjZaVk9kcURI?=
 =?utf-8?B?NW1XeTBua2dzWm85SHR0ZU9kSjMxOXhXdWcxOFZmdWxIMjhQNitCSG9ZbTBY?=
 =?utf-8?B?azdpZ003QjVCSjNnWEM3RDEvR1BWRzJNTHVMSXlTUkJZS29tQXphUDRUbjI3?=
 =?utf-8?B?V3NYcjRnK1Q2T2FjTjdlbGlpNWhOSmdJSFpCcEU0eXFIYXdTWURGOFV5ZjZT?=
 =?utf-8?B?MEFWUjdYREVaZ0J2TGFwdy8vTVRIZGwxS2dDV3BlTmFOSnphR2JZTXdsd242?=
 =?utf-8?B?RmszVWZwRGVhczNYNU0xRWdycmhUNUVtR1RhWTNkdG1ZWXNoS0ZPbmppZ2lo?=
 =?utf-8?B?Y3c4bXY2M2FkVGhMN3VNN3JOOXp3MlJGY1JLMlNqVnVDd3JnbXpQMGxCbHpX?=
 =?utf-8?B?NnRsYm94emM4SmtEaU5SOTUxd3ZHbkhEK1lmeFJ2aWpWSnRIN24rNDA5V3Ja?=
 =?utf-8?B?bjJXRkc2SDc5NTJ5dklBdEhyZWc3bUJvSHhBd1ZqbEsvNWl0NFM1VC82Sk1W?=
 =?utf-8?B?VFVveEhqUy9PSGY5Yy90Z0Q4dnJCNmU0eTRNMit6K1pEQytmempjU201VWtu?=
 =?utf-8?B?Z3JXejdpQTRwTko1T3pwK0Nxd0lPWGwvR2phSmR6Q2tyNERwR3lFc0VHZ1lj?=
 =?utf-8?B?OFNISDZFT1hxbWI5Ymw0N2puMEI1cXhsWTRib1ZickhQM2ROaENLdXNwVitl?=
 =?utf-8?B?ODQ4WUdoaVJIbmoybVd6K1Ftd3RMVEJMU0VtRFcyeEppL0Y2N1pFNHA4TWs2?=
 =?utf-8?B?ZnRGbThyTlBZYjR2bldoZCtlZTJaTDdjQURscFRLY29PTXFEU2xaWU5UUy9Y?=
 =?utf-8?B?NkFFRDZ3dVpZRXNycCt5RWRhVzR3R2JHNjk5SjdZa1VEcmVpM3JqOUZJSEUr?=
 =?utf-8?B?U2JGQzNCMkJ2SkZUVlpBaXo1cS9QS2RMdTRHUjlOdGZCTzJSSHZONnl5RzVS?=
 =?utf-8?B?Vm1YMlRtV1JJeXBsU2VIaXAvWW52WXY0TjZWc3cxQWtzaHRtTWIyZUNHSXI2?=
 =?utf-8?B?Z2Z6UFphOHlhZ1VmLzAwQ3hYTWNacWhGRHRISEluV0FYNmRSV01BMzZpUDdD?=
 =?utf-8?B?MTA0b0RRQlpKYWZaSmhLSGcrOS8rSUlwdVRITmFheUxBb1RrYlhHbG1wVFBR?=
 =?utf-8?B?VUVhWDhzZW50V0Q5ZFl2QU03cVlCUVNMQ3V3MWRQSnA3UlN6NzZGSHZNK25w?=
 =?utf-8?B?c3EwRzlMdGlUUlZ3anAvejFiT0I3Y0VuWmJiZVpvcWh5amFuaURMNThpQ1Nl?=
 =?utf-8?B?NHNpd3lNOFJTaWlua3BiY0hDckZhNjhrQWRHL1QxdXB6SXdiSHE4M1pWSk5k?=
 =?utf-8?B?eGMxVVhIU3ZGMkR5S25UTnNqUlpmcS9LYW14cXVWR2EyczZLeVFKWGtsMUhU?=
 =?utf-8?B?YThIMWU0SlhoZnpCbVFJZ1lwV2d4dW1mcitHN3hhYW1LTWEvaWRpYmZZTWtD?=
 =?utf-8?B?ZkNYbVpZNTc2Skk2VWJZNEtVRDdndng2K3pmQXR0TFFqV2ZEejI2c3VldTVK?=
 =?utf-8?B?c3hIVmhXWWsvMHovTmV5QUZWQzBuVGkyQzZCQnBBUWdBejBrUXdmWUlGbHZS?=
 =?utf-8?B?MW9ZZXMxTXJHa0lDNVFCcWh6bHMzRHlmUGVDTlRIWTJubnIrd1ZGa29QQ3Fs?=
 =?utf-8?Q?t4B52JAsk5k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjBnU0QvZE9YQnJMYXZTRFhiQWcyS1lTNUpoWlF1WkJqUVZoQVdMWXZQZC8x?=
 =?utf-8?B?VUVzK1ZwRElqeW05L3RVOUpXOTduUTd0ZGlEUlFBSk1ZdkwzSVZQZU0rajNM?=
 =?utf-8?B?SHBJemhsMnExZWJGbnVvSDlPSDVvcFptaFJHejdVSDRzM0hRS1g0b2loWHdJ?=
 =?utf-8?B?ZWR0RzhXQ1dVTDhOd2hEaFRzN29ManJFMnVadTBRTC9JQnZNUUc2WlEvaFBj?=
 =?utf-8?B?S2dRbkRDamZTSEtwSWp6KzdjZlczblZpamFMY2hnQWI1RVV4Nk9RUTVTVlpO?=
 =?utf-8?B?MTNwclBRNUFuOHg1R2dCVzZOam9wbjdtNlZ3cDJ0UXJ4Tmd6MnFKemUvcWtX?=
 =?utf-8?B?QVB2cjRUbnYvUEVqZTJ1Z0lnSUdQcEFRMXMvbzNRTFNJMm5hOHphSmFDMXZE?=
 =?utf-8?B?Ky9Ja3ZLZlF6akZqaU9wMitRZnZkNXpITzdHdnBvNU9FUVNpbXdvQjVsbWR1?=
 =?utf-8?B?QjRiYTM2cUNsWDEzSkdCT2I1QTdDdEtZR3FOdUdmbkNDSFF1L3BQWDBxSERS?=
 =?utf-8?B?Zy9qRUdsbHpqQ2hITzJkWFJ1eVZLaG5WZDFiUHJKc3M4Sm5FV3ZkME4xSFd3?=
 =?utf-8?B?SjI3YUM5SlpsOFIzYTNla21rR0JIZWVRK1RKVnlUN1gvNkFxZ1orMW5yZlRV?=
 =?utf-8?B?UnNZbjVqYTZmMHV1bDBMWWR2ZnJraDZ6MHFtUTRhMlhGU29HNjRsQmhGTWc1?=
 =?utf-8?B?V043MTl5Qm5YYWNEMlBYYU1hMnMxMllLMFUrNHZLMjd6clBPVFNtTENwS25U?=
 =?utf-8?B?RzJoUDJ3Z2JTeFc2Qk5KdnJWRG1FaHZxa29MRk9ZdmdmZ3VPMVBNaEVuOFd2?=
 =?utf-8?B?RWp6VDY1cFF0eFozM3BZZEZiaVF6aVdLcTh0aEV0SGJmT2VPTXFMZjc4NXdO?=
 =?utf-8?B?L2dGYkJuZ042NjlXcmRrdFFseVR1YTc4clVGRWdXTDBxSSsvRCtuVFhWb0RG?=
 =?utf-8?B?NkZTWi9qV3djTmtvVHlGMHpISEJXNE40YXlFNUxmMWIzVDhqNzQyZGljWDBL?=
 =?utf-8?B?VHRzTDM0ZjYvQmxVRVovdjM2N2MzS2puYkplUVRyak0zTFJEOHhDTTJrd0Y5?=
 =?utf-8?B?bjZTaENzNWxsTCtZWnFobXpHNXlkbWtvMnd3bjUyY2JGaXJIVUZyTEJzV1BV?=
 =?utf-8?B?Y0tXT2lldlZ2aGczV0FRaytSTkhRRWlETk03M1htZVNzNHVNUCt2bzJYam5k?=
 =?utf-8?B?RWY3SFdDQWkxd3JWWFNzYndHejl0UWZTZFlGdHN4K1o5MkM0Y2hnWHJCYnoz?=
 =?utf-8?B?cTZpbFZOM0Rkb0VMWFRNc3JUMmdZZCtzYkRwdjRYOU5jL1g5WldXVmJlTkpB?=
 =?utf-8?B?eG5CbGdaVzVPQUFCNEE4QXZ2d2lWQVpldlMzK053YldWR3F3aFhaLzE4eXlM?=
 =?utf-8?B?V0ZoYm9lMkJkRElaSXpoVk5HSmVLVTZoSGI3QnErU1hBV1RaWkxFRFZMVGJi?=
 =?utf-8?B?clkzenBYSXN3MTdOK2hBNlZsWmIwOEhuOXlvbWgwNnczUG95NTZrNWlhUEh1?=
 =?utf-8?B?UlI1QzZHUmJMYnU4SXE2dWEzMGRZUlBscWRrQnZRV1dvbzJvOVJ3SklJOEFK?=
 =?utf-8?B?UEQzMUdGY1E3TVIrd3FvRzVKOS9YRGdMU2tXREc1bTBCakZ3Nm1vSCtuOFFO?=
 =?utf-8?B?TVROcG5LamJIVEZmbGhOMWxySUJrcHhjMUZqMEYwcHJiK01mUm5hV3c3ck9Q?=
 =?utf-8?B?elY0THBjQ3VNMDBpelowNVNIZDlJZHZxWkFxOEVtb3JZNGZ2QWpaZjVRQlc0?=
 =?utf-8?B?TjVOWURNempRQVJ3ZlNoUU1vTHo3OWJFZjcvUStweHhRMC83QnZtZ1hJK1Ni?=
 =?utf-8?B?eHE1S3pVcG8rNEpmT2RRVXlyQ0xjK0s5TGV2UWxuYWJmU01wN1Y2S1lhNW9s?=
 =?utf-8?B?TmVKQmRadFJMOXhNZHhNMGdiTGRlQ05BcnpmQ0VYaU5ZcmxoRVVxQUxWZUVZ?=
 =?utf-8?B?OGR0NDdETzlXcFFIeVBCc2k1UXRiREd1K205cGVweFgrYVFibDYxT1ovYzFz?=
 =?utf-8?B?WGFXOG1qNEx4QkpDcW9STHhyNUc5TVZjSUFxNHBsTEhja21VNXJMOE93UEZh?=
 =?utf-8?B?eHZXMTJLNFcvMUZzRmhuR1p5VDgzdHA2N3lBbVFRNnNnT2RuYkJWeUNiTjVF?=
 =?utf-8?Q?iLtWj+LMUNbao67TR44ld4OKx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a9cc6a-6542-45b1-48fe-08ddfb353a99
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 06:40:19.6657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXNz/I4IHYh4BgUrObuiWjoXDwWbeGZVlZrBTfVu6EB0ZJNXNTNFr2FCHaJ8v6guuFYZGdh77MlRdulwLHCmdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9980
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

On 09/23/2025, Frank Li wrote:
> On Tue, Sep 23, 2025 at 10:07:57AM +0800, Liu Ying wrote:
>> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
>> It fetches display data, transforms it to linear format and stores it
>> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
>> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
>> driver to support the DPRC.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v2:
>> - Manage clocks with bulk interfaces.  (Frank)
>> - Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
>> ---
>>  drivers/gpu/drm/imx/dc/Kconfig   |   1 +
>>  drivers/gpu/drm/imx/dc/Makefile  |   6 +-
>>  drivers/gpu/drm/imx/dc/dc-dprc.c | 465 +++++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
>>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
>>  drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
>>  drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
>>  drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
>>  8 files changed, 522 insertions(+), 3 deletions(-)
>>
> ...
>> +
>> +static void dc_dprc_reset(struct dc_dprc *dprc)
>> +{
>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
>> +	fsleep(20);
>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
>> +	fsleep(20);
>> +}
>> +
>> +static void dc_dprc_enable(struct dc_dprc *dprc)
>> +{
>> +	dc_prg_enable(dprc->prg);
>> +}
>> +
>> +static void dc_dprc_reg_update(struct dc_dprc *dprc)
>> +{
>> +	dc_prg_reg_update(dprc->prg);
>> +}
>> +
>> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
>> +{
>> +	guard(spinlock_irqsave)(&dprc->lock);
>> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
>> +}
>> +
>> +void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
>> +		       unsigned int width, unsigned int height,
>> +		       unsigned int stride,
>> +		       const struct drm_format_info *format,
>> +		       dma_addr_t baddr, bool start)
>> +{
>> +	unsigned int prg_stride = width * format->cpp[0];
>> +	unsigned int bpp = format->cpp[0] * 8;
>> +	struct device *dev = dprc->dev;
>> +	unsigned int p1_w, p1_h;
>> +	u32 val;
>> +	int ret;
>> +
>> +	if (start) {
>> +		ret = pm_runtime_resume_and_get(dev);
>> +		if (ret < 0) {
>> +			dev_err(dev, "failed to get RPM: %d\n", ret);
>> +			return;
>> +		}
>> +
>> +		dc_dprc_set_stream_id(dprc, stream_id);
>> +	}
>> +
>> +	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
>> +	p1_h = round_up(height, 4);
>> +
>> +	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
>> +	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
>> +	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
>> +	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
>> +	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
>> +	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
>> +	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
>> +
>> +	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
> 
> Is it okay to access register if start is false since
> pm_runtime_resume_and_get() have not called.

Yes, it is okay, because dc_dprc_configure() is supposed to be called
continously for multiple times(OFC, fine for only once as well).  For
the first time, start is true in order to enable the DPRC.  After the
first time(DPRC is running), it is called with start == false to do
things like page-flip(update frame buffer address).

> 
>> +
>> +	val = LINE4 | BUF2;
>> +	switch (format->format) {
>> +	case DRM_FORMAT_XRGB8888:
>> +		/*
>> +		 * It turns out pixel components are mapped directly
>> +		 * without position change via DPR processing with
>> +		 * the following color component configurations.
>> +		 * Leave the pixel format to be handled by the
>> +		 * display controllers.
>> +		 */
>> +		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
>> +		       G_COMP_SEL(1) | B_COMP_SEL(0);
>> +		val |= PIX_SIZE_32BIT;
>> +		break;
>> +	default:
>> +		dev_err(dev, "unsupported format 0x%08x\n", format->format);
>> +		return;
>> +	}
>> +	regmap_write(dprc->reg, MODE_CTRL0, val);
>> +
>> +	if (start) {
>> +		/* software shadow load for the first frame */
>> +		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
>> +
>> +		/* and then, run... */
>> +		val |= RUN_EN | REPEAT_EN;
>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
>> +	}
>> +
>> +	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
>> +
>> +	dc_dprc_enable(dprc);
>> +
>> +	dc_dprc_reg_update(dprc);
>> +
>> +	if (start)
>> +		dc_dprc_enable_ctrl_done_irq(dprc);
>> +
>> +	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
>> +		width, height, stride, format->format);
>> +}
>> +
>> +void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
>> +{
>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
>> +	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
>> +}
>> +
>> +void dc_dprc_disable(struct dc_dprc *dprc)
>> +{
>> +	dc_prg_disable(dprc->prg);
>> +
>> +	pm_runtime_put(dprc->dev);
> 
> You call pm_runtime_put() in dc_dprc_disable(), but not call
> pm_runtime_resume_and_get() at dc_dprc_enable().

Yes, dc_dprc_configure()(start == true) is designed to get RPM and
dc_dprc_disable() to put RPM.

dc_dprc_enable() just sets PRG to non-bypass mode.

> 
> Is it more reasonable to call pm_runtime_resume_and_get() in dc_dprc_enable()
> 
> dc_dprc_enable()
> {
> 	...
> 	pm_runtime_resume_and_get();
> }
> 
> dc_dprc_configure()
> {
> 	unconditional call
> 	pm_runtime_resume_and_get()
> 	...
> 	pm_runtime_put()

Here, as RPM is put, it's possible to actually disable the power domain,
hence possibly lose all the DPRC configuration done between RPM get and
RPM put.  So, this doesn't make sense.

> 
> 	if (start) //look like only need enable when start is true

I may add this check in next version.

> 		dc_dprc_enable(dprc);
> }
> 
>> +
>> +	dev_dbg(dprc->dev, "disable\n");
>> +}
>> +
>> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
>> +{
>> +	dc_prg_disable_at_boot(dprc->prg);
>> +
>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
>> +
> 
> you have runtime functions dc_dprc_runtime_suspend()
> 
> If runtime pm status is correct, needn't call clk_bulk_disable_unprepare().
> 
> Look like call pm_runtime_put() here to let runtime pm management clks.
> 
> otherwise, runtime pm state will not match clock enable/disable state.
> 
>> +	dev_dbg(dprc->dev, "disable at boot\n");
>> +}
>> +
>> +static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
>> +{
>> +	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
>> +
>> +	dc_prg_shadow_enable(dprc->prg);
>> +
>> +	dev_dbg(dprc->dev, "CTRL done handle\n");
>> +}
>> +
> ...
>> +
>> +static int dc_dprc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	struct resource *res;
>> +	struct dc_dprc *dprc;
>> +	void __iomem *base;
>> +	int ret, wrap_irq;
>> +
>> +	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
>> +	if (!dprc)
>> +		return -ENOMEM;
>> +
>> +	ret = imx_scu_get_handle(&dprc->ipc_handle);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
>> +
>> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
>> +	if (IS_ERR(dprc->reg))
>> +		return PTR_ERR(dprc->reg);
>> +
>> +	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
>> +	if (wrap_irq < 0)
>> +		return -ENODEV;
>> +
>> +	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
>> +	if (dprc->num_clks < 0)
>> +		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
>> +
>> +	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
>> +	if (ret) {
>> +		dev_err(dev, "failed to get SC resource %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
>> +	if (!dprc->prg)
>> +		return dev_err_probe(dev, -EPROBE_DEFER,
>> +				     "failed to lookup PRG\n");
>> +
>> +	dc_prg_set_dprc(dprc->prg, dprc);
>> +
>> +	dprc->dev = dev;
>> +	spin_lock_init(&dprc->lock);
>> +
>> +	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
>> +			       IRQF_SHARED, dev_name(dev), dprc);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
>> +			wrap_irq, ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_set_drvdata(dev, dprc);
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int dc_dprc_runtime_suspend(struct device *dev)
>> +{
>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
>> +
>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dc_dprc_runtime_resume(struct device *dev)
>> +{
>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	dc_dprc_reset(dprc);
>> +
>> +	/* disable all control IRQs and enable all error IRQs */
>> +	guard(spinlock_irqsave)(&dprc->lock);
>> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
> 
> write one 32bit register is atomic, look like needn't spinlock.
> 
> Only other place use dprc->lock is in dc_dprc_enable_ctrl_done_irq(), which
> write 32bit clr register.

No, dc_dprc_wrap_irq_handler() uses the lock to protect register access too,
so it's needed.

> 
> Frank
>> +
>> +	return 0;
>> +}
>> +
> ...
>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
>> +{
>> +	prg->dprc = dprc;
>> +}
>> +
>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
>> +{
>> +	return prg->dprc;
>> +}
>> +
>>  static int dc_prg_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
>> index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-prg.h
>> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
>> @@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
>>  struct dc_prg *
>>  dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
>>
>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
>> +
>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
>> +
>>  #endif
>>
>> --
>> 2.34.1
>>


-- 
Regards,
Liu Ying
