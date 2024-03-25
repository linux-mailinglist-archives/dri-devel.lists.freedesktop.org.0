Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB26889767
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 10:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1A110E694;
	Mon, 25 Mar 2024 09:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="uCoO2pUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2091.outbound.protection.outlook.com [40.107.8.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C9610E684
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 09:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzbwe3kJv2qAerZzw9SwIs7SCZF6KPppjmoSWi9KsTHcAs+Z9Fproy993M/k3612Pn7dzfBSjDWKmkJyKQE4WKm3ES2luZrOhyoqFeEZJcvT8HB17DWx98t9H22XQxg9TGIJZyUqommJSfynd7y+dWfohIPr9/WjNUL4PDKJkJ/AlL9oopz90s0YL994/me2uPpfdR8HmwI45i2gN+MPov9q95k/o59pUPMIEoxaxmSNlie9upEZRA81mGBdA7ScE0bktCKW2de9r4+r+ptygLC3qF9p2VscB56KRME0/Xde7vnrOTxnjSsx8MruLqJLGe9ICOv4eDT8OUvK6zkijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvBYi8hO2l+d1pIbVcWJnnKCfvXq63E64DCxQAM1lZA=;
 b=A+K3A1yNU9HgXxLrzTU9FyE8Lm2yg+CX4aVqDxfJaBrzK9nJqu8p9Ud6HQ1xhquQPwkNGYbCCW+5HN5dSB7tBAbjGVUCvUhspK3bLP48ZTpWlxxIA+bL/G2BBNrcrngt8m21YVj5Ppz8Cmm7sPw5qmlfUTdrKmHk0Q3LHH5J++eBgy3LWzmeNbrEVMEdvEVPWCbrEd1D2rzbGp5aQKB3pydksbTeg3WTRqvnk9Zt6shUt/E3A/sHNKd4PWFJDrM5vf0CbMPmIDOZAayLdD32uIg1CkQC8uCVTzDaMmndMKuvm4f5sXtI+F7JniB7ZWctx37Ycad+CQbmOt6me20CdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvBYi8hO2l+d1pIbVcWJnnKCfvXq63E64DCxQAM1lZA=;
 b=uCoO2pUCjMyouEHuhWTR40rX6g+mTnXwu73rNQZHR/L4aAdGf2HvdHDWlBjJtFx5oUTHpDPTk8Ji/yqn5j11yVMZeMTxmZz/E34dfiEU71z69RkdYBKuMrC/IG0AfKNNT2Eq2Ud2CzqlHAt9y5mNDO9C30sY7Ms4FTdunR8TO1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB9916.eurprd08.prod.outlook.com (2603:10a6:150:a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Mon, 25 Mar
 2024 09:15:16 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 09:15:16 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Subject: [PATCH v8 0/8] usb: misc: onboard_hub: add support for XMOS
 XVF3500
Date: Mon, 25 Mar 2024 10:15:10 +0100
Message-Id: <20240325-onboard_xvf3500-v8-0-29e3f9222922@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ5AAWYC/3XQTWrDMBAF4KsEresyI2kkuaveo4Si30ZQrCAHN
 yH47pXTRQx2l29gvnnMnY2x5jiyt8Od1TjlMZehBfNyYP5kh6/Y5dAy48AloICuDK7YGj6vUxI
 E0CkPUZuAaNGxtnWuMeXrQ/w4tnzK46XU2+PAhMv0f2vCDjpCR6I3EpR37z/lO/2Veh3ihS3gJ
 J4IB7VFREOSIQcSUSljdhG5QvhOE9mQ4FGh9p5CkLsIrRGzRaghWjkDlIJIUe0iao30W0Q1xIJ
 NifdSg4RdRD8RAbRF9IK0Do4gUi+2j53n+RctQtSQDAIAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711358115; l=7048;
 i=javier.carrasco@wolfvision.net; s=20240320; h=from:subject:message-id;
 bh=iJW1loYbFNUDu87doTkXh8CuGto0mxNK9GLqvCLtJmk=;
 b=96P2LEv7CFFFuxh/0Q83mWBktDCEYvPUiiAqtggXYkOGL4rpXtD582zOJz0ywOkJDrqX3cKBU
 rXgPFkxRA4tCgH1S+mlmlHTjMoVDgqzHVdANSvvJqo2mbcoUMRC/nD0
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=Vxk2/0sGIxM8rsKnceszFuSuHVfQwa1Yo8+is7BX2nY=
X-ClientProxiedBy: VI1PR08CA0223.eurprd08.prod.outlook.com
 (2603:10a6:802:15::32) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: e6fb4a75-d361-4aeb-c42a-08dc4cac15bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4WeZoG/Qo9rSnxQMTIVhWH7CpM5jIBAHiQzdCPXfxKsWFEb+HZYME0F9uSgEjNMe/RVWsTu5i289KUv4RBe/JbogmUKKG3wGyTb6vgIVC8zcZTkvJromEWEbX7KLHEYQEH07gIVt8/WCD07VsVZYS/aZ++oatgzFBD8fhvVWCjAVxfxUnv+MXTFfh5LP2qRwRzS/iQYqqR/uJDRGxeUPwng514MZWk1CV62Xt8YvALPUMzGEnppOs3TCofNsIDT2YVMYnc119v2ftVYFseqMQZDbUAQUtpG1TBPXG88vqBmFaO0dkivsEyZPuSoCOIi2OEdmxaVaLwJ4EQQJby2u9rWaTrNkF8tpR1qz7aCiwBxzSjfoAexQFvwubfDvrQd3GCIgkphn39ivttVRIs0hXybEwNtjUKCCh9OhkJOizqAgG1pzS0VXewYpgy6ukX/B3XwYQ1jzvFZkcP97pn1ugtbkQZJe8A3mD7wEQc9jUdtGb2ljsrOpScY1ZeLt62ScbPZ0BV6sRFU4bJEXunCTXcIPg/FQ1mN2CzJ6eo+T6uCGHtc1GmOmQBOf7+yz77/drDcaqJOKGz7jrrqFVjI+hUTadzOxfTRt330G77bR+6DDjBg3FKBAeWvWdl/raPrqnvfIVf/nQ9aCukiSBobhZrrQDGQ4VvQuWoevdzGRdaFjcQ44aR2mAL4YRL1ceLw2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3dxd1NCREFoL09JYjZaN1dNamsweEI1cFBVUlhWNXJ6QjJjWmRZTHZ6bWU5?=
 =?utf-8?B?ejlZR3llK0Rpbmx4aUVHLzI3cTBERVo0UDJ3a1grY0Q5RzI1QmFGSWpoMkpw?=
 =?utf-8?B?dVZEQUVub1FyTUd0TFZmVXFaQXNxM1JzR0hvei9pSVExbW9lNEZHQWRoVlVE?=
 =?utf-8?B?ZHRmNDA5YzljSjdNdVVwU1U5MFk3a2JDUDIzRmtZYkI0QStZS2cxTkFsd0JU?=
 =?utf-8?B?RFFDSWw5eTU5VGFqRjFJMWFFMnBjcThXWGo5OEV3YmhlcjNuOWlSRFgwN2Zv?=
 =?utf-8?B?UEgwRDVTVlF1TURnZkIzRTJSbXg3L0M0aFFYM0VWTTdCTHk2TlVpOUl4Tmhv?=
 =?utf-8?B?dllmYjBBQUpWZ0E5Vm5zL3UzaTNHNHhkL3VqQ1VJdnhTV2hoN3IwOWY4K3N2?=
 =?utf-8?B?d2hxK0FVNHg5dXg2T1VXT2Q3bkhGeDZVUm43Qi94dERvL1BZa1hFeEFJZ3E5?=
 =?utf-8?B?eU5GNThGYXBsU2JZdlN5S2lPa3UyME9BVlh3SE1RdlFSNENidGRFbTZtcC9E?=
 =?utf-8?B?RXRBbUlraURrb1hLNmZIcEp2b29QeUpOVm9lRDRMWUh4amNkM1pSSGNkM2Nj?=
 =?utf-8?B?TzFCYmwyb05YOG5BRm44blg1U1o0OHpIWmF0Umh1aXFwQ2Z4M1Mybm15SHVD?=
 =?utf-8?B?ZWtPZElINmFRak90WFM3YlUraFowTVBwU0NnWXlOTXkvcXFNV2Vva0xYd1JO?=
 =?utf-8?B?UGxYUUhMano3dXM1c2pYdDRWeHM4dWpaMEZoWGFONnhZZDBWa21GdUtHZEZM?=
 =?utf-8?B?UWJvUTRvY3RqMHk3TytJSDJPWW9IdGVIUFR1Ly8vRm5rRU5ZeXZxQTE0Q3ZN?=
 =?utf-8?B?QmN1c3Urb0tvUXV5MVRXME9rN0pPbHVHT0c2d0hhKzVYL2pzajBVZ0tIYnh1?=
 =?utf-8?B?NkRYc0ZEWWlhclhEVjlUVHlwUm42OFdzQ0ZkWDJNR1BPR1pHb2tqTUdOaCtT?=
 =?utf-8?B?KzlQb3J6b29mdm1Dd05wcjFlb0JoUnVMYTFNaHRHTGViWGU0Ulhid0pBSlJ1?=
 =?utf-8?B?ZlhwYzRnV3BTQTF3V2N3aXhHQnkzSXFxNDRwZm0yNDBsNEZ5cVIva0cxSnR4?=
 =?utf-8?B?b0VjUHFUanRzbHpZNlI2ODdSZFhaaEFCYmM0TzZLOVhZdm5hdVVaTFVDekJl?=
 =?utf-8?B?cTRtOGhDQjhRREc5aUw5OUZVZUdMMUFPSTBKVXAyMDAvQUZIenVrbFR0TVFN?=
 =?utf-8?B?ZmZ6K3BKaFg3ajFQb0VVVHhleDNaSXhobnFuS2dObmpWZnUxWXVsVnQyMWVY?=
 =?utf-8?B?TUdUOHRJNFpWZUVwTHdtek9kb3NsRDZleDdKSElOc0g3cU9mQjdyc0IrbjNR?=
 =?utf-8?B?bGFwdnJhRDA4R3FqU3RXczNKU0pGWU1LTEF1dVVTVEVaejVMMlVvYVhScHdS?=
 =?utf-8?B?R0toczBCa3pjaFJDQlVXSEtpWlFqUXNtMWZCdWs1NE85cHFQK2tsNVk5UXlo?=
 =?utf-8?B?dEZtblJRQUF0WHU5TEU5K2pHa1FGclhMT1ZKQWxUZWFVaCtjd0dldmo3aWlV?=
 =?utf-8?B?U0tialU5ZXFtSXdBZ1d5ZldwV0NJZWJDWmRMTmpuM3hpdUEyQ3BHc3dSRkZB?=
 =?utf-8?B?VExCVXY3TEFZKzZ1WVMwVVB1YVk4VEFmWll2NWxsMEp0M2ZBSkxoMFVlWUJF?=
 =?utf-8?B?Y2tFdGxRN3lDSHhNMTBQa09lKzdVdm9MbzRjYmtQSGpQRXNuTWxBOHlxSWQ3?=
 =?utf-8?B?K09RaFlQQWlHTEMzRmRZU2gyREhjWkdSclAvdnJDcHk5RW94N1h0QTY1Y0Z4?=
 =?utf-8?B?SGk3SGk1NlJjNGxadi9CYVNmemZJRG1zcEJTV0ZoWXpESzRROWQrUE5oVVRO?=
 =?utf-8?B?Wlc2ZTdHMHhWcU5jWFV4aW02T0dhNmhiZVY2d0Z2RS93dFhYQXl2L0xXanJl?=
 =?utf-8?B?Q0J4c3dYbDN3M3NsMWFMNkJXclNsRmYzU2ZrbDJyTGRVNHBWWUY0anhRMWsw?=
 =?utf-8?B?OXRkWlRzVjdPUGIyUHREYUlZTXpFa1VuVzVMc2xPMmFrSDlWZ2xrMmdxdW9w?=
 =?utf-8?B?bzdVTGdFU1czQUI0TVptNkV2NGNVUG9pZURxVHdNbHBpZ2Z6cEJMbVNWOVdj?=
 =?utf-8?B?YjI0YUQzVzQxbEFWRTFYN1c5djQwcTNYSWhJekVIYnAwK3UvU29SY1RUUUJG?=
 =?utf-8?B?SFcxY21OT210cm9YU09KYUljM3g1YkFrckhDTWwxN3h5d3ZuTmdPa1pOaGJt?=
 =?utf-8?Q?EWmPo//Lc611B88UpQ4CSoo=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fb4a75-d361-4aeb-c42a-08dc4cac15bd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 09:15:16.3553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iq2cwxp5RGKNki3fkcHmH4s+UPQ87zc69Moe93UL8aPLdsgPBpZ04HGnsZudYuxYTkOX4Q/iOPDYaAlgkFYx+blRkQw5chlIIyiRb6b9fcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9916
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

Note: This series could not be completely applied due to conflicts
upstream (TI TUSB8020 was added), and a rebase to the next -rc1 was
suggested. The series is therefore identical to the previous
version (v7), but taking into account the new hub. The first patch
of the series has already been applied and it is not included anymore.

This series adds support for the XMOS XVF3500 VocalFusion Voice
Processor[1], a low-latency, 32-bit multicore controller for voice
processing.

The XVF3500 requires a specific power sequence, which consists of
enabling the regulators that control the 3V3 and 1V0 device supplies,
and a reset de-assertion after a delay of at least 100ns. Once in normal
operation, the XVF3500 registers itself as a regular USB device and no
device-specific management is required.

The power management provided by onboard_usb_hub is not specific for hubs
and any other USB device with the same power sequence could profit from
that driver, provided that the device does not have any specific
requirements beyond the power management. To account for non-hub devices,
the driver has been renamed and an extra flag has been added to identify
hubs and provide their specific functionality.

Support for device-specific power suply names has also been added, keeping
generic names for already supported devices to keep backwards
compatibility.

The references to onboard_usb_hub in the core and config files have been
updated as well.

The diff is way much bulkier than the actual code addition because of the
file renaming, so in order to ease reviews and catch hub-specific code
that might still affect non-hub devices, the complete renaming was moved
to a single commit.

This series has been tested with a Rockchip-based SoC and an XMOS
XVF3500-FB167-C.

[1] https://www.xmos.com/xvf3500/

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Helen Koike <helen.koike@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Changes in v8:
- General: rebase to rc1 to solve conflicts upstream (new hubs).
- PATCH 1/9: remove (already applied).
- Link to v7: https://lore.kernel.org/r/20240305-onboard_xvf3500-v7-0-ad3fb50e593b@wolfvision.net

Changes in v7:
- onboard_usb_dev.c: drop comment for is_hub field.
- Link to v6: https://lore.kernel.org/r/20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net

Changes in v6:
- onboard_usb_hub.c: use dev pointer in probe consistently (new patch).
- onboard_usb_hub.c: rename get_regulator_bulk function to
  get_regulators and only pass onboard_hub (hub in probe) as argument.
- onboard_usb_hub.c: drop file after renaming.
- onboard_usb_dev.c: improve device descriptions in usb_device_id table.
- onboard_usb_dev.c: keep non-hub devices powered on in suspend.
- General: update commit messages (use usb_hub_dev after renaming).
- Link to v5: https://lore.kernel.org/r/20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net

Changes in v5:
- onboard_usb_dev: move device supply names handling to [1/8].
- onboard_usb_dev.c: make always_powered_in_suspend not visible for
  non-hub devices.
- onboard_usb_dev.c: move is_hub check in suspend() to function entry.
- onboard_usb_dev_pdevs.c: comment rephrasing to account for
  hub-specific attribute.
- Link to v4: https://lore.kernel.org/r/20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net

Changes in v4:
- General: use device supply names and generics as fallback.
- onbord_usb_dev.c: fix suspend callback for non-hub devices.
- onboard_usb_dev.c: fix typos.

- Link to v3: https://lore.kernel.org/r/20240206-onboard_xvf3500-v3-0-f85b04116688@wolfvision.net

Changes in v3:
- onboard_usb_hub: rename to onboard_usb_dev to include non-hub devices.
- onboard_hub_dev: add flag to identify hubs and provide their extra
  functionality.
- dt-bindings: add reference to usb-device.yaml and usb node in the
  example.
- dt-bindings: generic node name.
- Link to v2: https://lore.kernel.org/r/20240130-onboard_xvf3500-v1-0-51b5398406cb@wolfvision.net

Changes in v2:
- general: add support in onboard_usb_hub instead of using a dedicated
  driver.
- dt-bindings: use generic usb-device compatible ("usbVID,PID").
- Link to v1: https://lore.kernel.org/all/20240115-feature-xvf3500_driver-v1-0-ed9cfb48bb85@wolfvision.net/

---
Javier Carrasco (8):
      usb: misc: onboard_hub: use device supply names
      usb: misc: onboard_hub: rename to onboard_dev
      drm: ci: arm64.config: update ONBOARD_USB_HUB to ONBOARD_USB_DEV
      arm64: defconfig: update ONBOARD_USB_HUB to ONBOARD_USB_DEV
      ARM: multi_v7_defconfig: update ONBOARD_USB_HUB to ONBOAD_USB_DEV
      usb: misc: onboard_dev: add support for non-hub devices
      ASoC: dt-bindings: xmos,xvf3500: add XMOS XVF3500 voice processor
      usb: misc: onboard_dev: add support for XMOS XVF3500

 ...-usb-hub => sysfs-bus-platform-onboard-usb-dev} |   3 +-
 .../devicetree/bindings/sound/xmos,xvf3500.yaml    |  63 +++
 MAINTAINERS                                        |   4 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm64/configs/defconfig                       |   2 +-
 drivers/gpu/drm/ci/arm64.config                    |   4 +-
 drivers/usb/core/Makefile                          |   4 +-
 drivers/usb/core/hub.c                             |   8 +-
 drivers/usb/core/hub.h                             |   2 +-
 drivers/usb/misc/Kconfig                           |  16 +-
 drivers/usb/misc/Makefile                          |   2 +-
 drivers/usb/misc/onboard_usb_dev.c                 | 546 +++++++++++++++++++++
 .../misc/{onboard_usb_hub.h => onboard_usb_dev.h}  |  62 ++-
 ...ard_usb_hub_pdevs.c => onboard_usb_dev_pdevs.c} |  47 +-
 drivers/usb/misc/onboard_usb_hub.c                 | 503 -------------------
 include/linux/usb/onboard_dev.h                    |  18 +
 include/linux/usb/onboard_hub.h                    |  18 -
 17 files changed, 722 insertions(+), 582 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240130-onboard_xvf3500-6c0e78d11a1b

Best regards,
-- 
Javier Carrasco <javier.carrasco@wolfvision.net>

