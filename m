Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B002BD7622
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 07:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C99310E531;
	Tue, 14 Oct 2025 05:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C3WJOiDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B915110E531
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:15:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpCY7tgIGp/OPFIpQa4A2gmrfLtMMWr25Weqz576ePqsr/mWhuIAeng6YtJ634cxePiLg72HJXE2tjEUBenakoaQtbZmbzEL2Y15+YYDWcYvBn0BeN/x6zd68l2/E+58eo6fo7D/wdXrfNpfSmfg36qvvtzM/ONMtaqiRFHo8Fa58FC0Xw/6uVu/64kqMXsNB69I6D2WGDL9uh2WiSVaMLVXm4uvl7h9lRF1jN4b+yYqVL55yacE2rOgj2CIVbSXwi6s9yJofjatn06ug1XP0DGTR/+hkR9HEQmt+osFrPoz8mmSQHs7pyxK9zuEi5isDb7JTngiaEi/ksW2+/rILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iFrQV5N/GSH1FVe2QGzaOgPbcheHBYbO22oEo/TnQw=;
 b=Sko0VDi83ONj0uzxMsB0HOB6ql20z+VB4Pdkr6rBaaM2JARu9FTz8U7yBzXZNOotfIeSIdALSJRC8P+663/fgJGBzR99vdI9CbqKh6vzIuCzV4lJKIvbdn71elzy1kuARc1Cf5QfW7dF3TSrJozgArW8VrqAlTpFqOhonxPCWBoIVSnx76DN+YLZPwUSYxOGIP4yAHc1zpd+ptOYjcGwsGNbjNSZ5ynujEqKNIMYH5KMQW3WN71533BIn30AOT/gyNw6nVR9XE8nKmxO44V7cXkZnwb+VzDXONKeU1AEvC52Hyz0g2YiPULgN0daqzIhytjWikrUxupNRdsIYIuFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iFrQV5N/GSH1FVe2QGzaOgPbcheHBYbO22oEo/TnQw=;
 b=C3WJOiDhODaGuam8e86T2qZpMeV6VUUSRv7Qh43IbtauMhxioL2ajGdWzgg5d4eNuxmdzD8i73T/gM2UqWNEOB+2tvG1wHGoF7KJAXJYoZ3dezV82IwcC1ucJxP3n0SxJPA9KXePv6iR44RHfJxVKoLDq8UWEmypreRcawLFpN8oo3dlAIopSQCHGMb7y9B6XO7sJYBqAm9hK1uTTky5EVv5YhhxgBEIG6Ch8fBNq9j7FqYwfwh+clDBGnnKbPnA/+doFtqURaFn8AmJuW4SCHf7e70pQ1hxkU9RduIhT0gjNT+Fm4NMMriWAhGJm1nc31rRV4p0ucAGfriARVmvWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 05:15:22 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 05:15:22 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
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
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
Date: Tue, 14 Oct 2025 14:15:12 +0900
Message-ID: <11544750.zapYfy813O@senjougahara>
In-Reply-To: <CACRpkda3o55N2m=H+RA2p0r598KBLv6bbbin76Uu5Sy44qCLig@mail.gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-2-clamor95@gmail.com>
 <CACRpkda3o55N2m=H+RA2p0r598KBLv6bbbin76Uu5Sy44qCLig@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::12) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2be346-bb09-410b-5a5b-08de0ae0acc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVUxQll2RnBkUkxrNGROdDJmUDVyZHVMb2JFVm9QdTZNY1VJKzdoNjY2TXRj?=
 =?utf-8?B?NUVTYWtGaUU0MXo5Wm4rVjRxck9ZVUJBbHF2RHArRzNnMVNWTUFwSFB4cXFs?=
 =?utf-8?B?UFRBbVp2Zms5QWRHTktoNWxqSU01U1lqaHd4bkFaSnRQSVlPY1MxRmtKaDMw?=
 =?utf-8?B?Smk2UlZyZG9nWm9JRzVwbkFMbUpvSWs3QkUwVVJ2eEtpYWlGcHhWbUtMamRV?=
 =?utf-8?B?UkNTdTNCMS93WEcyZzdjREU4N28yVzNoVDJtTzE5QVdjS0FxTUxjdHNUSkhl?=
 =?utf-8?B?cWxIYk4yZ0cvaUpHRXJHeWRQcjU2TEtiNEMxU3VSaUhPRHBQN1RwSVRuK1RR?=
 =?utf-8?B?YSt3ODFIaWgwWlB4eWZOMHdpZWxUTWV6eUNVUk1helJGN3pkNjFZemEzNHZ1?=
 =?utf-8?B?OUdWVFlQRldEVzlKQWlHZG9yM0lmNFZJcXFiUmJXKzFQTmlPR3RoN2o1bmR2?=
 =?utf-8?B?Y3pNTTJRb2xBUmJnSElhd09VeVEzSllITEJXVm1RaEQ3akFCUGRKbHlSUWJX?=
 =?utf-8?B?bTJCMVI3cFRscHkxNUs3eERtRnozdXZCKzBXMkhNZjdVMjFtRGMvSW51R0Zs?=
 =?utf-8?B?QzdPcXRpYW52Z25mS0E0d2h3L2ZCcWJmRFZpajdUdXI5eXBYckJPM0EwTlRF?=
 =?utf-8?B?Sk0ySlYzM2pQb3ZqM1pJdTE4WTFHVUV1dGw0T2ZYQ2JnbGRzNWU1bENiblBR?=
 =?utf-8?B?RVJ3ZllCMGd2WU1pV2lCTkdrSi96K1oxcFpwbHZBSllLN2c1UVgzeklCdjJZ?=
 =?utf-8?B?N3NPOVcxN3pjcUdEL3ovTWVpYWJOVVVOd085b1I4NUdhNGNTaHZHUzJBdTAx?=
 =?utf-8?B?MzQvU3FTRkFxWGRkVG9jQ3pYbGJqME1zMmFqc3FxdkRLY2FyVDVwc0pDVDJa?=
 =?utf-8?B?WXVmLy9RWitCSmZoS0Q4WEZLd1hwcG1PMlplb0QydU5lTTVDUVVyak5SZEJh?=
 =?utf-8?B?T0xraTY5bjdBM2U1Slg0dmdNd3IwR29UaXVxRzVHTm0vemNoRUdOTTIyQlRw?=
 =?utf-8?B?N2dWcjBrbWliNnRwaCtQd3ZOSGp0ZFBZdmNMVWIwQWo2eEIvNTRaN0FhMHZv?=
 =?utf-8?B?MnlpeXFVUHlYS1JGUnM2b0R6eFJmb1JnT3kxVHlraHlPMnBZUisydmJpcW5S?=
 =?utf-8?B?QjdCTXpjcUkwUENwdWx1bnE5bFVHRm1JM3FNdytDSEdIWHBNUGpTa0ppQVhY?=
 =?utf-8?B?NWFzRGJPWHM3bGZYWGI0QTFBWXFXMGdPMnpwMURGd3ZWTmI1eC9vOHFyNVpm?=
 =?utf-8?B?eS84U3VqaFRvMG5mMWFoMzBvYjZaS3dMamRRTkJGNm1uZGNrMDkvNGtDeEp3?=
 =?utf-8?B?cHdqM1YreTRGYkhEMTZFWWJMTzFud3d4akZLR3RUUTBjbmZMWFFRVnErYzFE?=
 =?utf-8?B?VXBDa0NFcVRYVHNBQ1RaWkdIZHFOMGt5K09nMFJQMUFMcWlpVktWOFdSd2FY?=
 =?utf-8?B?OWMwTW4rNkxCcDFic2dLVlliQVVYL2FPdmhwRTg3K1QxZnB6bC96eFNvUmxk?=
 =?utf-8?B?cnBPNjNkL0dSdWcxdXBIR0FKbjZUZWZvWjg4dW1HbzdnN0M2c2d2ZmNWN21y?=
 =?utf-8?B?Q1VmQ0dhZlRvakJLeDA4c1lxWVpXTVFYTjk4MTQzRkZuaWZwR1ZEWmVITWlm?=
 =?utf-8?B?S2JUS2lRbUZmdUthdWcwY0g2K0gzYXRlTTdSa0ZoNWdpd3R1dEcxMDZFbXNM?=
 =?utf-8?B?RWRNUzdTMzlReGtkdHRHUWdwQ2xhVHVTdmNlRjZJNXY0b21VWFplNDZiT1pN?=
 =?utf-8?B?RWpBcER4VVB3MEtwM1JJQUJMOXk4dHlrbGJ1UW56Z0V1elI3V1I5c2NuVHpU?=
 =?utf-8?B?dktaUXJKSUY4SXRVTWl1NzVQVGFNR2syZjZnR1FNSUxkaGRkVWltN0I5dUlZ?=
 =?utf-8?B?VFltUU5GNTI1LzRqajJZLzhjbkFjNmxuQlJDZXgzcjZvRkxmNzVVMEpsNmFm?=
 =?utf-8?Q?CiCdakhFNKNLg/W1IW8helFBQI3PHIOn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjhYMmo2WFRReXU1Q0ZBRTVxaWxyYmFTcVJYcDdQTWRqclplY0x3cDhHZDF5?=
 =?utf-8?B?T2RWZjc5M1lFSmpBME14ZmRXV1puMmhKM1A4eC9hSEtZL3RRQXA3dHpocDlK?=
 =?utf-8?B?MDJPQTRLOXlIK3FuSElqMkt2aE9sZ3Nnb2xKTnVXS0VBT2JZUkg5N1hGVk8z?=
 =?utf-8?B?R0NoSVNRS3N2S21KKyt2TWg0MmN4OVRzZnJ2Zit0ZS8rQmI0TDRVVWJqV2tm?=
 =?utf-8?B?MUZ2OU5Rc25YNWhVVTFRT3VwdFprUW10VFduQ1ZrZFFNc3hHS0JLN1ZieVlQ?=
 =?utf-8?B?dmxYR0xHSytybXJBSkkwTEtPY2FxM1R6RWhLem4vdFJZQmwyWjZxUTMyOEtL?=
 =?utf-8?B?SEsyMW5zUzJoeFA4enFyWVY0aEVXd3N5V0p4a3FBdUQxdnhpcm9mZVRzRDJz?=
 =?utf-8?B?MmM3b2xQd2xQYWpyN1V3VmRRRGNCSytKZEl1N0VvVlJCckZKZTk2VGQ3UTJS?=
 =?utf-8?B?Z0ZoTG5LeUtsNTRSakh0Vll5bk00aFI5cGR6R3ZON3NsME9KdmRlNW5pekFq?=
 =?utf-8?B?VGRRSjFERVlEZXNSeUZXdnJmcW1zNkNGb3dPSzhvU1Mzb0JtWnZQTlN5Z2NR?=
 =?utf-8?B?cVV1eFc2aUNoRDgwaVJrV0JwTE9oVzhXSWJNckFjR1gxR3paeUU0dTRJWldz?=
 =?utf-8?B?TzhEQzZXdWU0aDFsQXk4SVhnZ1lvUHN5N3FaMXRMb1FrQjI3L21FY3VUWkpL?=
 =?utf-8?B?eEdqOVZua1N3cEVmTzl4WnZUK2xuRk5PdlowRVZ5dm1vVVR4bDNjNk9paVNy?=
 =?utf-8?B?SThyeXFnMGZlWWNrNXBvczU4c3pxTi9jQTRub0xUc1E5L0hUTmwzRFRCbVNk?=
 =?utf-8?B?MTYyTDZ1NDY5eGlWaGJsTDFwYUdIUndJaDhSUE5IK2l6Z3lETU9icDZUWlVs?=
 =?utf-8?B?MkZyUzBOSEJLMCs0T2t1NFpKQktOeXh6YjM3RjBGN0N3M2pJVTg2QTVvcCtT?=
 =?utf-8?B?VGJ6TlAxZ2VTSk9kOGNCNWdMd1NhbHhKbC9SWnFJRVBjRlVpMFA1QnRGOUVO?=
 =?utf-8?B?TzlGTzhRSlJjNk1DckpyR1M2NTlxVU1Lc1dlT2RHclNCZEpiWkdMS29TZU5I?=
 =?utf-8?B?dy8zRXBLcjRiV2hsR014NGRVdkhjbi9YWmxYV1BqVWUzVnNFYTJMVVVmZWFE?=
 =?utf-8?B?QTZDZzRPbGhTZnNHWk9wWTNjdWdQV3F1NXB4UGdPU0c2cjVJdHMxdmhrVitV?=
 =?utf-8?B?RFQ2dHFnOVFRL0k2V2VXb1E2dmU1Wm5rMDhYTVZMNWdObXUwTEQvMVYxNzRR?=
 =?utf-8?B?cUN3VHpPY1gxSHRveW12WmM0TjlMWnllc1lrQ0VydEZyS0F0c2NZcnpRUDFI?=
 =?utf-8?B?dEVRZlFSU1Y5VVFSSTlnbW8vWHIrVW13UUNodUVJMlFEdTZIS05Ed0lRb1dT?=
 =?utf-8?B?Q3JlTWozTm80UGdiWTUzTXM5Yjh3REVEeXd3MGh3ME44MzM4Q2FYMkk1R1Q3?=
 =?utf-8?B?T3gyWXhWbE1UQ0EvL3IxWlBqUThDamZXMUNqR09XZ1h0WC9OT0JEbUYvOEpI?=
 =?utf-8?B?SG1vNW0xMmRlbVNRMnZrUS9hVkZNc3RENEluUmlrYjU2NjhtUjg4dWF5WHRn?=
 =?utf-8?B?UmU3OFAzclZFQzdZWW5nb25kRU5WbFY1QTJnRWQ0UGloTmFudE9qdmthMC9Z?=
 =?utf-8?B?VVFFWklrVk5vampNN2pBOU51VDZGdXEvUjRWUTc0b0c1U1VBOXhnblZ1R0Rh?=
 =?utf-8?B?OWVORnl4bWxMTWo1Y2JWRFZvTUlkQlVud3ZrMUtBdXEwbmoxak1QMnZuOUR2?=
 =?utf-8?B?WThVclFTc0dqdXFyMmtWVmRmOFFXaFZrZ2N0ZGxUaTVFRUVYNUgwMU84QjZS?=
 =?utf-8?B?aDhFQ3dqVzdKOGZnN1BsU1MreTN5UjdoVFlPcFMva3ZEdFlJRjdTMzVJZ0to?=
 =?utf-8?B?SlM0TlFvaDBvdTlJVzZMeFF6UHl6eW9TUnpXT2xoRTlrbEpjSmdvbGlxb3VU?=
 =?utf-8?B?RlBvZWN0NFhSKzQxVU1yd1VncHdmMlA0OWNWcFlPMlB0eSs3anlSa0s3YW1H?=
 =?utf-8?B?QXcrSEFtN3I1ekNpL3o1RXk1TmJaL2VpVXZWTUpTTlhvVW9wRlVzbUJ2dHFX?=
 =?utf-8?B?NU9LamN6VGYrYjBaYkNtZlo4S0VqQ3Bhb24yM3dTSXhzN0gwUXhxUzNpOU8x?=
 =?utf-8?Q?33LpPxFANee7NoFu8AtsxR/Wr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2be346-bb09-410b-5a5b-08de0ae0acc5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 05:15:22.3067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLoMr3obAqlkBq2zYHnio3xHXm8WSYxMoqr5QizmQoMqftZguOjOlz4tPYpXRdp5vdrwSB+8PJWN5FekzyqGlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900
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

On Monday, October 13, 2025 10:12=E2=80=AFPM Linus Walleij wrote:
> On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>=20
> > Add csus_mux for further use as the csus clock parent, similar to how t=
he
> > cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev par=
ent
> > name lists to resolve checkpatch warnings.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>=20
> This patch looks like it can be applied independently from the rest,
> can I get a review from Thierry or someone else at nVidia so I
> can just apply it?
>=20
> Yours,
> Linus Walleij

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>


