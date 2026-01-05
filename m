Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A9CF2455
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 08:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F1A10E38A;
	Mon,  5 Jan 2026 07:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="NNfK/c/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013035.outbound.protection.outlook.com
 [40.107.162.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0851810E380
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 07:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcSQQRfIIJSb5iBxGsqjPul1+quYN94UBNs7UEGigkgAmtBK0VEYRSBRsddknIicd4sIoGvL07bsAhR82GDCXEaOOhcV1UGoFvtfTNG8gVsyXWm31K6X9Yyv3/4F0ZXPslqUpAsFfP+j/f7v+nEvQa4Uc5axszqljLoubF+Njrnd5X+IYWNjHaeogLusrP/SAKBZHA+kEJvKuJvOnd6HbdLeqL+KcFo07w8HYiWYEgq3/amP9lehsgBGSLvZ2yrBmYEUcWit96AW0IU6+oZvvx6g7hmIfAtKh4aPQAK/5JftoT7XuLxfF5nv/M0q/sSO/aO/ZBW29ra8xK+Mmq3aRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej8tixVab4Csa5LP85L7d//tuATCC5+B3KkIV+txH78=;
 b=eKaFGzO91dtFEN2+UMSTpY1tqbv7PiAaPa2JrbgpI5lyomI/4TaOXh5WeHBOsot9i9yftMK3l8vgtQ+milf9sdkZbcZIV0EdbEXhk2thv2TarUfdOh6BuKiXsI9N5BXp0OIzRrlcR0tvowQ6/+kDGr2KIALyCsl95x5Uw1t1DlVbTFyDbXIkg2rg3PoDku24vVr1qPoSaUgBxXC7S9g60UTkN4Hx63SMxlkUxf1EdPJSlHgsVnPMhv3F8PkToNADFItv3bC45uh/QnLpepDvYRAwKdgt/RbdFNN1xsHlCOUvLTYcPPoDNo2UhzqdTlpGZyBpkSOD+a1gyftaORtVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mess.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej8tixVab4Csa5LP85L7d//tuATCC5+B3KkIV+txH78=;
 b=NNfK/c/5YyosPRuS7mdWJ4THpyeTnflV2I1kTMnm16Kr3rZOqZcc0+OKqQ5STHYnv4QrU5N+hY4pMp9TVAKBbxG6GkBqNxVRMgcwnnvu7RvFoPsOkAfM9pdlBZhHW9VWrbZzrMIRI5SRbxK3ljDr8V6irYi6kY3hZ+2q1jggS+lPEdgREsL4Gr5j3QLPwudWN+ZAN+qyM7yGT6xMStUnmc+iDOEbkIsgy5Iy4DboW5sX9IEXQIYrsTOwEy7RYHBUyfpM7ENAwD+VIyq5gIyEeR4DWNBJl28woQdM1FxU2SRBYtOfSAioFC9cgs1Yo/nT12dWUoPphJlK+aa5Md1Raw==
Received: from AS8PR07CA0020.eurprd07.prod.outlook.com (2603:10a6:20b:451::13)
 by AS2PR10MB7106.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 07:51:06 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:451:cafe::bc) by AS8PR07CA0020.outlook.office365.com
 (2603:10a6:20b:451::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 07:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Mon, 5 Jan 2026 07:51:06 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 08:52:19 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 08:51:04 +0100
Message-ID: <8d8b5d79-4b70-4ad0-9496-8d409495cbc9@foss.st.com>
Date: Mon, 5 Jan 2026 08:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rc: rc_unregister_device() should not call
 rc_free_device()
To: Sean Young <sean@mess.org>, Andrzej Hajda <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Hans Verkuil
 <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, =?UTF-8?Q?David_H=C3=A4rdeman?=
 <david@hardeman.nu>, Benjamin Valentin <benpicco@googlemail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Haotian Zhang <vulab@iscas.ac.cn>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-staging@lists.linux.dev>
References: <20251220222757.7063-1-sean@mess.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251220222757.7063-1-sean@mess.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|AS2PR10MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: a79621e0-ae8f-4dab-64ef-08de4c2f2e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|7053199007|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkN5TGxJbDB4RXBVYmlsUytjdVZ2ZzFjUjZta0tTeURJaTdXZmtSeG8zTmJ3?=
 =?utf-8?B?K1ZsS2FRaGNIMzl2OTVrNGpVOGRYRlRQQUt0ZzJSYndPQitra2xXT0VTUFJU?=
 =?utf-8?B?bjQ4c0YrOG1Lcnc1US9mclliN0RPYXRqV3RJVWNFSzhWV29lR3hnbGVmNXZD?=
 =?utf-8?B?Y1grNDYrcjFiaXRxVjk5UXBEdEkwY1FhazVNKzEyUVhzcjFlTVpibTZBUEs3?=
 =?utf-8?B?YU9xLy85ZTNIOFRwSFI4V2F5dWFpWTZnTk9iODFjdXVTSytwZGxJSTc2a0d3?=
 =?utf-8?B?ZWFEQWY0bDZtWU1EaXVUSWIzOTlBUUNHUm1YZEY3Tm9TK2FuWWxvdll0L2g4?=
 =?utf-8?B?WS9uTDdhUzNZUjZUWGw1REFCU285UENtSGJBS2pDU2tRTXZBajhKNnFrVDlS?=
 =?utf-8?B?WmJKSDcvbHpHSnVHWnZvY2dsMENIbGJuMGI1OTBRb0hnUTJCZElCaXcyZTh5?=
 =?utf-8?B?ZVc5cmM2eXM5SGI0T0x1aDBDUjhmMjNiMDd5N3YyTzBrNHJpaUpMZ0hrQjZt?=
 =?utf-8?B?ZHVkekUrWTRaaXJiQ2dOd3g2WmVReFE5RnNscHdvb3ZqMThtSTAwYkYxK3VM?=
 =?utf-8?B?NjVPdldOM083c25HUkQ3OTRsM0M5OXlQU0lEOG5vNHlHVUk5djB3ZjQvSUZH?=
 =?utf-8?B?dGZxaUpTMnArN3M1Rzg1cHBjSFVjQkE1aU9xSHd0eks2RU8vLzk5enlrcWF2?=
 =?utf-8?B?Zzd2cEw1VUsvSkk1d3lTVk4yZG93V2dCRTRmRUo2UUxSbVlMTmtIMmc5Si9X?=
 =?utf-8?B?OHFNNXVUR1gzSm5LM3ZyMmR1VFlTZnlIN000L0tIVnVDb2N4aDFSZTA3aGJu?=
 =?utf-8?B?YzNZWXM1SDN5VWg0Rzc4T0RzTTdiN1dQYlp3N3hnb01ZNTRmWncyTTZtaHAz?=
 =?utf-8?B?NVhBdWV5dUtKeWFqb0czNGFCTVR0cHV1Y2JpUWJnR3RSR2s1RmZOVUNCaTBM?=
 =?utf-8?B?MHVyWUw4Mjl6SThDUFNGcG1ZZ2JEN0lLanljazhyUnEvUkVSOVBuZFM4QVpB?=
 =?utf-8?B?b0JwNlJ1Vko5WEh2bUJkR09oL0o1STZkVGVFSDRFMVZ2TWp1dGNjYkw3ZmJH?=
 =?utf-8?B?ektCVEIwM0hLYUg1YUo5eC9jdTllaEp1SHFuSGl4L0REa04wUERXbnVMRFF4?=
 =?utf-8?B?SDZKM2dORFY0VTlmdC9ld2UzaFI4VXZFTE05UGRDUkR5WWxvem1mTUpCMm11?=
 =?utf-8?B?cEJHRWlNV2tZanUwMmRVR3lGUFlKWlZ2ai96SnhSNmVTdjhZZ0pNVytqSnVr?=
 =?utf-8?B?eERma1lyTFFmWm5KRzVVVjNvcXh4NHF6bk00Q2w5eWNEM1ZlTVNzMC9KbmJh?=
 =?utf-8?B?Q3ZrNlJWNk94MkVpcEU5R0dxV1BnakY3L3JOSmdvajFRY002T2JrRlgrOTNu?=
 =?utf-8?B?RnZoVUY2ZEp5OGd0akQ0cXZuQWlqZmFya2grMnp2TlI3RGVpU1pNckFHNEl4?=
 =?utf-8?B?M011dW5MdWs0QTBuOEE0TjVtN29kc1E1R0U5bkIybTNodFhWTUlFV3NxcXZC?=
 =?utf-8?B?ZHU4S2VZdStiVWk1dmFqaS9mb1doeHdqYWlRZkU4ZFhnSjY5dWc3QVdYWmNo?=
 =?utf-8?B?bVJCc09HWFJKRzBVb0FMSjFxRlhVMEhTL3h2M0ZlUTFRVWFyeE1TQ3NtSno4?=
 =?utf-8?B?NFduVXBEWHgrVlIwb0dQWFNSQUo2bkFMeVp1L0lGUEVPQ1ZTNW0zdC90ZkNZ?=
 =?utf-8?B?N1pVeVFkb0tJcHYwZ2xvMG9zcXJLbnc0NVVwUkxmMDlCSzArcVp2Qlc3c1dY?=
 =?utf-8?B?Vk5Mc1l0S3FGTHVpZU51aVAxUUJBY21UVjlCUlM4Tkl5bXhJZ055VDAxelQv?=
 =?utf-8?B?Zk0ySmlwOUkxK3NrRHc1MmJsZDdJZlpEaU9vYW8wcW1YTENHRk84NEF4Mm8v?=
 =?utf-8?B?R1R2NUk5UlBjd2QrNWlYUVVmaS9YU1RVQjYybU1qQWNwLzhCUTdobXdmL0Uw?=
 =?utf-8?B?ZnZaMWhYeHZ5a2lsaCtxSm4vdFNNSFFnbG1sMnZ3N25CMm5iSHRwQlpmaFlj?=
 =?utf-8?B?YW9DS1dtdUFlU25oMVplY3dSWUI5NVNMZHQ3bWhUSTBjWkljSGdoZllnVGxj?=
 =?utf-8?B?blZBOWcxekhmTUFrdHFiOHdobGtWN0p1RSs5clJWanZUbnBEekt1enBzKzRF?=
 =?utf-8?B?MFRBQ2pYcExZRHlubWpUNC94SENQOUxqV2tlMmMwWm5mL09PVStRTVNDOUFa?=
 =?utf-8?B?ZHc9PQ==?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(7053199007)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CobXj9tYxhWVAkSvd1gKJXGTV5918KBac9bymEkGS3QgMIcCW5MIRLhvup0tof/gLhgOusQxtzkudxn45p/THhDVSs5pKcOdAuT10LeK20irnzs5nKwdrLvimhqEdzGVQcvU1pCxweekUvXFxlSxmDol8uUWu4mNr+iVqhsQT3rWkuiX10RPUsUfKYImu8zPPOQuBH+/QtOWvelz5r9eak1qM6QBY2gTERlPyvUrH8a/+KeruAaIK4975CN3veFzVA4hkE7QkjufPdq8hbqtfbm/Um9P/2AuWywOW7yzLwMcuRsykcMOrAV7/yjsi20AAuL4rNcwepoeYZnPK7P1z3+wPlJNC3qgV23MR1MFTKjfgYgxXUB4rBnIW2c7XBkPeHpr031I48fol0Mxetwt74n5QuQiZuCbToI3V3lD9AJ+BjnGEjuMIAoeEqKeSeRKB2KkfLBQ+Vojb+VYNbqaTk6VOIZiruI/GnBXiFSOiJ0NHd3+3Jz9/1BwHITkBHIfJrFT1xSwFWDRsru+x5my63rK5sZEj2Tu5NEIy+z7azCybZ4z4r+aZ73PKInqHvUyWIJ4fADIiYv0mtyfKjM1+q8usSFCUHDFx5jcGXN6BCq+U9fgDlSw5Dky3mhq4dHCgfosQ5X2ypjhGNeKQBEkXVhwtf1zAs+hyKxjaYxxiuwe8ifBPYGPZ30tBPbfOvb+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 07:51:06.0889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a79621e0-ae8f-4dab-64ef-08de4c2f2e8d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7106
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



On 12/20/25 23:27, Sean Young wrote:
> rc_unregister_device() does two things: it marks the device as
> unregistered, so no new commands can be issued via the lirc chardev,
> and also frees the rc device. Device drivers want to both cancel
> in-flight commands (i.e. kill urbs) and prevent further commands from
> being issued. Only once both are done, can we really free the rc device,
> because it might be referenced in urb callbacks. This is impossible to
> do with the current way of things.
> 
> This change removes the implicit call to rc_free_device() from
> rc_unregister_device(). This means that device drivers can call
> rc_unregister_device() in their remove or disconnect function, then cancel
> all the urbs and interrupts before explicitly calling rc_free_device().
> 
> Note this is an alternative fix for an issue found by Haotian Zhang, see
> the Closes: tags.
> 
> Reported-by: Haotian Zhang <vulab@iscas.ac.cn>
> Closes: https://lore.kernel.org/linux-media/20251114101432.2566-1-vulab@iscas.ac.cn
> Closes: https://lore.kernel.org/linux-media/20251114101418.2548-1-vulab@iscas.ac.cn
> Closes: https://lore.kernel.org/linux-media/20251114101346.2530-1-vulab@iscas.ac.cn/
> Closes: https://lore.kernel.org/linux-media/20251114090605.2413-1-vulab@iscas.ac.cn/
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/gpu/drm/bridge/sil-sii8620.c        | 1 +
>  drivers/hid/hid-picolcd_cir.c               | 1 +
>  drivers/media/cec/core/cec-core.c           | 2 +-
>  drivers/media/common/siano/smsir.c          | 1 +
>  drivers/media/i2c/ir-kbd-i2c.c              | 2 ++
>  drivers/media/pci/bt8xx/bttv-input.c        | 1 +
>  drivers/media/pci/cx23885/cx23885-input.c   | 1 +
>  drivers/media/pci/cx88/cx88-input.c         | 1 +
>  drivers/media/pci/dm1105/dm1105.c           | 1 +
>  drivers/media/pci/mantis/mantis_input.c     | 1 +
>  drivers/media/pci/saa7134/saa7134-input.c   | 1 +
>  drivers/media/pci/smipcie/smipcie-ir.c      | 1 +
>  drivers/media/pci/ttpci/budget-ci.c         | 1 +
>  drivers/media/rc/ati_remote.c               | 4 ++--
>  drivers/media/rc/ene_ir.c                   | 2 +-
>  drivers/media/rc/fintek-cir.c               | 3 ++-
>  drivers/media/rc/igorplugusb.c              | 1 +
>  drivers/media/rc/iguanair.c                 | 1 +
>  drivers/media/rc/img-ir/img-ir-hw.c         | 3 ++-
>  drivers/media/rc/img-ir/img-ir-raw.c        | 3 ++-
>  drivers/media/rc/imon.c                     | 3 ++-
>  drivers/media/rc/ir-hix5hd2.c               | 2 +-
>  drivers/media/rc/ir_toy.c                   | 1 +
>  drivers/media/rc/ite-cir.c                  | 2 +-
>  drivers/media/rc/mceusb.c                   | 1 +
>  drivers/media/rc/rc-ir-raw.c                | 5 -----
>  drivers/media/rc/rc-loopback.c              | 1 +
>  drivers/media/rc/rc-main.c                  | 6 +-----
>  drivers/media/rc/redrat3.c                  | 4 +++-
>  drivers/media/rc/st_rc.c                    | 2 +-
>  drivers/media/rc/streamzap.c                | 3 ++-
>  drivers/media/rc/sunxi-cir.c                | 1 +
>  drivers/media/rc/ttusbir.c                  | 2 +-
>  drivers/media/rc/winbond-cir.c              | 2 +-
>  drivers/media/rc/xbox_remote.c              | 3 ++-
>  drivers/media/usb/au0828/au0828-input.c     | 1 +
>  drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 1 +
>  drivers/media/usb/dvb-usb/dvb-usb-remote.c  | 6 ++++--
>  drivers/media/usb/em28xx/em28xx-input.c     | 1 +
>  drivers/staging/media/av7110/av7110_ir.c    | 1 +
>  include/media/rc-core.h                     | 2 --
>  41 files changed, 52 insertions(+), 30 deletions(-)
> 

[...]

> diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
> index 6b70bac5f45d6..0ba06bfc9e14b 100644
> --- a/drivers/media/rc/st_rc.c
> +++ b/drivers/media/rc/st_rc.c
> @@ -203,6 +203,7 @@ static void st_rc_remove(struct platform_device *pdev)
>  	device_init_wakeup(&pdev->dev, false);
>  	clk_disable_unprepare(rc_dev->sys_clock);
>  	rc_unregister_device(rc_dev->rdev);
> +	rc_free_device(rc_dev->rdev);
>  }
>  
>  static int st_rc_open(struct rc_dev *rdev)
> @@ -334,7 +335,6 @@ static int st_rc_probe(struct platform_device *pdev)
>  	return ret;
>  rcerr:
>  	rc_unregister_device(rdev);
> -	rdev = NULL;
>  clkerr:
>  	clk_disable_unprepare(rc_dev->sys_clock);
>  err:
> diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
> index d3b48a0dd1f47..b9b241fe46ea1 100644

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

