Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26547C64094
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFE610E35F;
	Mon, 17 Nov 2025 12:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Dlr6EDQk";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Dlr6EDQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021129.outbound.protection.outlook.com [52.101.70.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3496D10E383
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:42 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uRJohKYV54/Wf3pQr5Hciqjg2KOtpMDgFzvYM+Voc6jzzSYrHhdBZNmCrjhlvHjDEFjHWqOnDsDB3VKuHrjP+/4T6GrRbOruRNNXJbOMO6IV3lpkl03mnwL9oUQtJKG2SyoatilBZXZn3J8LKpjWE2hTsC9NpvksxxVlEAxtyutreetB+IVCStiP4pk58aw7MfAQ3q79xyVg8coXmMlMVwEEFhzKvGXS+O/JS7MKtrqebeqWNgX9dcrJpZarp9blrRHPo4D2hzwRtTCOgMh4p53RGCuq8OsEcz1OnrVj3FnMiRR3KAJtK+Ao59Hs4ts70Ni0z1qFxHgiiCaQeQlJ7g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nSLoI+qHoKElhPDG1l2PnJVjaeNB3dBy4mKHZntIzY=;
 b=L3ezb+afGFXBVfMUXRc+wkfAUJdHNYhblCQcSAoKMPsvDbmyfUDd7HWNw0ArlPcrREhEvX6XZ8kjvnoa2basDSZOcG0sn/Ua7csyof9+hMiniiUorMhvEwAjxnHvYWbzFokeP3BhxRErgUSPkl3lK5mE/2nIJM+FNil8mcNWimG6ai1+9ch8b1MhbnHjdyEJKrGZJpsUfxJMp2HXYgqvDemKR6RD3IOstsimRYJp+jlm0AtxGyVXeQTNFAuDp9SX72z/ToL8NtNap4hDhhAgud/wvJUsCaJLn8nyUV3kGCiOYHjYiuDoipJxA7+xdQONi8Fq+LOL8uLHyqCjRYwQrw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nSLoI+qHoKElhPDG1l2PnJVjaeNB3dBy4mKHZntIzY=;
 b=Dlr6EDQkEXlQS0QyMJkQn+k+0iU7S8E8wLXur0ZA+z73r54fnannpP/u7wd5XUBIN0LCsaEGTBwxse6vjnW/xWhKNV/oQb+p1y5GQK5kMgyKOAaXnudggRwZ+hA0mzPVQE6Lu+CWKPd82LkCJmrADIlXy4oHn2JheQ4KKD9yyis=
Received: from AS4P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::11)
 by DU4PR04MB11847.eurprd04.prod.outlook.com (2603:10a6:10:622::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 12:29:38 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::51) by AS4P191CA0012.outlook.office365.com
 (2603:10a6:20b:5d5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 12:29:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 12:29:37 +0000
Received: from emails-2609381-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-39.eu-west-1.compute.internal [10.20.6.39])
 by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 27B6F8011D; Mon, 17 Nov 2025 12:29:37 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1763382577; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=2nSLoI+qHoKElhPDG1l2PnJVjaeNB3dBy4mKHZntIzY=;
 b=O/f/jtQbHrfsBdwnpeBLDLutdhdFAiuKskgWkGlKaYOexqSikmFvWAqigpm9TEixKEMGZ
 1T7e7DAdm0ikRwiz3jHerMhxWnGal/tDcIomyb8ihtjngZvFmtcAemxlmDQtfWTTJ/qmiIf
 8zuZ1sGBTRoHdPRnvjeIU88h4GZZre4=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1763382577;
 b=D0tKdRRk5iAWrl4Sa4iqwShAumNQUBIdPoLoKvP+MrhbdtfF+3HKGs7vSGCvmSiC3n5Pk
 zJOYVaBgd5+BPpX3IxeP+svViRxr9NuCnmFQ2sVDSaDGD1//NC9rYAfv1x2cwgrf6gnp708
 gNqt1qdOBjwPiPKY/28Mi+uz9jNQEoc=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDixavsLZjfYmmfmx5WwDjJwSxmrud4TS3CWR2Mi/JTbtbqusYmGEVbuyLpRIkNQk79d9aYCCsBv471I5qOFrMvr+h9Wphtr6Hiq+cYgWP62wGA4mls76btm6lgohNu6MlmfdRpMPxhj0xFbNfrpYCK/3QxpBfLMX6MO5eReTYcfdiGjs1bFMAf9ulgkHm+wQ+0mpcJAJQa0vQxedKHaH5gicXDoz7d6YwD417MIQcLCA4kcw5Pwf86vk+HTu0V6XJxVph4ZNxg17kkGqkgXEQRGYfCFk3hAGeklnBBptpAiVhLcxWGRPyf/26MGwiMNUSzB9BFmd1YLbw+PiLmxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nSLoI+qHoKElhPDG1l2PnJVjaeNB3dBy4mKHZntIzY=;
 b=g76WwNGjXWktyEF6Fs4k0WqvF8Q6dSOipNQMBxXH+HKIOqUbb4OSC4T4lbfafkpbneZp/jZx0CdyDnCcUT6BRL7sB4qNrXNP14AL2N6+YNgdMaaruoE7g8SS7+NoyQoDJTqY53D+6jiqknKy8TUXxboymNvxDZ9fPQcCjDxMJIFtAtdvYiGkF9YqmQfSYEcMGHUCp6RX280zcL/7vhBC4dWrkQoNSF4SfJ6kMdkrx4c2onin1xAFDUomGqpGwaMteyrBAY68dLJEE6sE3pCaNVV5c8WnjcaCioVUmwM4W5g84UDc+l/CD7hFtHzI0JDcnz2/MnpGcH6ltzN5jldVkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nSLoI+qHoKElhPDG1l2PnJVjaeNB3dBy4mKHZntIzY=;
 b=Dlr6EDQkEXlQS0QyMJkQn+k+0iU7S8E8wLXur0ZA+z73r54fnannpP/u7wd5XUBIN0LCsaEGTBwxse6vjnW/xWhKNV/oQb+p1y5GQK5kMgyKOAaXnudggRwZ+hA0mzPVQE6Lu+CWKPd82LkCJmrADIlXy4oHn2JheQ4KKD9yyis=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 12:29:19 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:29:19 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v3 00/11] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Mon, 17 Nov 2025 13:28:42 +0100
Message-Id: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPoUG2kC/2XMQQqDMBCF4atI1k1JJhhjV71H6ULNWAeqkcQGi
 3j3RqEU7PJ/8L6FBfSEgV2yhXmMFMgNKdQpY01XDQ/kZFMzEJBLAZpTP5t+5F3NidzEc8hroWr
 ESgNLp9FjS/MO3u6pOwqT8+/dj3Jbv1RxpKLkgmujWqNVXhhprsE9yXL/Gs6N69nGRfgRUvwTk
 AhrQCmLtixLPBLrun4AVhtm5/MAAAA=
X-Change-ID: 20251026-imx8mp-hb-iiot-525b03beea62
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8440:EE_|AM3PEPF0000A790:EE_|DU4PR04MB11847:EE_
X-MS-Office365-Filtering-Correlation-Id: b3190a6e-b4ae-418c-0aa0-08de25d4f913
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SEgwSHE5SGpITHhmcGw3WHJpV2EvUzdsODJoNktQelVHY1JvUGoxTzRrWEw1?=
 =?utf-8?B?SHIwTDV3SjhkY1VodGR1VjB6ODJzM1N6d2dCTEpMbnRMelBDQmFSRlA2MVhw?=
 =?utf-8?B?OWMwN1E1ZG0yeDhQRjJPWFJJSGZXbUZoa1JNZ3E2R3FkcGhicWg0blN3Rm93?=
 =?utf-8?B?TzgyUmpiN1VxL3lmUnhiQ2RKVEdFNkw4Qmo2MWNPYVB1MFRNZWNnNVpOWjNh?=
 =?utf-8?B?dWFQd0pKaTJVNGRyNFV3akprTk16dTR6MVNxKzVzWXUyZmFIYTh6eURNNGE0?=
 =?utf-8?B?TDh2dkhJUEN0S2x3V3JidFlUbGJ6eHBmYVk1WmIvMlEzOURTeUZPUHhMUWVX?=
 =?utf-8?B?SFl3RTlNMG5UR1RCTStlV05sQmI3Sk1uTW44OHhDK0Y2SitPVjFDUSt2M3Mx?=
 =?utf-8?B?UTJqS0hIckhXT0FDVmNDY3ovL0dweVRBYlZIY3RHcjVybzZEdjQyZnQxWmox?=
 =?utf-8?B?MUt3aU01cGNMMkNuaVRrU3hqeVNDeDU3a0UveCttQzJHLys3QTNzVTgrcXlj?=
 =?utf-8?B?bnRTQTk2TVBVTThvcXFEQXRUVDJkNUt1RHB6ZnV1THhXaTY2eU5uVWZDbXJ5?=
 =?utf-8?B?RUM2ZDVnOVk2WFp6aExMRHV3SVVUNnJlSHh4d1JldHM0UkpicXpZbVRXalpV?=
 =?utf-8?B?enhKZHpwK0VRSkY4L09uMVdmMkh5cmZET3BtZ3lTMnllTStJQmpwUWkrYWla?=
 =?utf-8?B?ZGlYc3IxeWJmbmp5OHN2NExNNHptWTF0UnRmM3FNb3B1OGtYZy9XNGNmQ2FL?=
 =?utf-8?B?SkEyTUU1c29TQ2FiajZJUU94SktEbU1FZmp1U0pkak9Zam5JWEovcUkyMVlp?=
 =?utf-8?B?TUpGTnJIYmN6eEtaSDV4WE5CUkZZeGhJUElURmZ6bHRyR3JZWnpMb21kZnMy?=
 =?utf-8?B?c2FDVTdDaEJ5WWpiQXZVS0drVWxuK3MvYmJYMEdtMjJEQkp1NVVXTFU0aEtX?=
 =?utf-8?B?VUpscW9Vc1lGREZMM0Y4NWVFRTJRdXY1a3hQM3YrNytKRDk0S2hXM0hrcUtU?=
 =?utf-8?B?Q2djVm5zL0NoU3ROT0tPM3ZCMlNmNjJDQ3Y3dW5xSHhZZGJtK1A3YWhPKzRm?=
 =?utf-8?B?WWN4Y3p6bUovb1c0ZWpYTE5XOTduSmFGcStIUlRqMWJsdGhPemt0dktPeGFZ?=
 =?utf-8?B?dUcrNTNieldNUVd5QVlvS1hUS0ZpcjBWblJhQlo5UW5pWmlEVGpBeCtpM3J6?=
 =?utf-8?B?SmtlZHdPYmVka3VjdTl5N1lXSnFXQ3YyOG9FaXB3SWI2WHAvK21aRHZXdElT?=
 =?utf-8?B?UWdSVzgwMkRZOVJlSEpEVVNoS0NldXpneUk5azRZaUhpTVlVakJIZFRGdGpr?=
 =?utf-8?B?Y1RuSlpxTWc3dkhlWUZTV3liVUN4UVlwR1l2bmJmSXNWNVFSTmVTaG5Zak9I?=
 =?utf-8?B?TVFXaFZKUDkvL2VVdllmTXhxdjBTOUNFalRRTmJLSGREc2M3eHNEeGtCOXNM?=
 =?utf-8?B?MWtmQTdZNncwYWdHVHNWNEtOcEtlcmFrY2hzdFZvSjJsdkZ2UXozZFhhR05s?=
 =?utf-8?B?eTNTUHBkanVpUGYrd0V1ZHY4bWNrVVJMR3g2Z2RkcnBQckJSaEJJSXNyeStt?=
 =?utf-8?B?cTlCckRaUEpCWVJGdVdBenRPRjR4NUhEV0RpQzBzYUxQWi9MWnkyRmlFTlVT?=
 =?utf-8?B?WlJNeU1QL0hTbVpBcjZLRExJNDU2d0xJUk0wZFQ3SXQyWkZ5SUZoTWxjcVFH?=
 =?utf-8?B?VXd2Qm4wRFRsTkFZckxwN2xHZUV0TU4vSitRUnpwQVc3SHB6WnhtOS9XZzhi?=
 =?utf-8?B?LzVrb254SzhkdlVITjA5aW1oWVAxMDk5VEVpRXpSUTQxTGxoRnhpcEM4VHpC?=
 =?utf-8?B?ajh4QmNXeDlFNlZmTkdDd25oRDRxMDVQVmt4OERqT3RPQ2lVRjZQVUZWY3dq?=
 =?utf-8?B?S0dWZk5yTzNqYlVOVDhiN3hCNEJ1S09QcTEzSUhZZUlua2gvUENiVnMxYVln?=
 =?utf-8?B?ZDQyd2FwMTh3cHFYYTM2Rkg4bDRuZ1lTNDdYdnUzZUQ3bEpkdTdFeERzcUtO?=
 =?utf-8?B?SWlSZHkvTDRPMk44Vi9UcVYycUtWWFNSUFZ2WnZTRy9SekJ3UnRuRTVsanFq?=
 =?utf-8?B?aFFYR1VoVklkSm0zNjRJVHVmN3h0MTdWWUJ3Zz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f0aebd0505ad4f7ea0ee9df20d8895fa:solidrun,
 office365_emails, sent, inline:8b9bb6044d0852e77f4fd2bfc771a193
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e756497d-f5aa-41b5-c4fb-08de25d4ee31
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|35042699022|1800799024|14060799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0h4OGhvK2QxM2dEZ2hhbmhOZjd0aWUwNUR5Y1lRU1V1c1c5Q21HeWw3bWFD?=
 =?utf-8?B?QXFyVk4reFdYcTFFUTZGYjJwVXpmcGIrUFp4WGw5RTcxbm9GaWFueU8xbklM?=
 =?utf-8?B?K1JnNkJGR0x2a0VmYk0zb1E4TkkrSFI3WW5tL2pjbHovU3pGYzVSVW04eDhz?=
 =?utf-8?B?YzE1L2JRaUhLbHYyNHhEeG03UEpDWjFqbTNycTlkYU12RHpENlBDWEd5SDUy?=
 =?utf-8?B?cUdMRkJDaE1VMTVRNU9MZHZETjhEV3YrSDJ4cDQvbXFPNnA3SG9IbkcyUXZk?=
 =?utf-8?B?aGFXQWRpOWc1WXpvenZ6RGVlRERKd0FFcGhLNFVpeTFYZURhNjlLM3hoYTNa?=
 =?utf-8?B?MW5kQThabDZyS3NUUFhIVUVsVWlpelZyQUltaHhqYjhsOERJbW10Y2xFU0Jn?=
 =?utf-8?B?d2pnY3Z1N1pSRDBSWHYzS2tFTmVlYkgrNHZTNVFkbTRDYXFkOFU3STZRMHIy?=
 =?utf-8?B?bWdHTTBIZXNSYVVoS1ljMlIyMUI0U2RzUk81c2pEZ0Nza2VzTnJDNEttSDFI?=
 =?utf-8?B?TldhaHJQTmpBajd3MmxlK2dTQ2lMY1Z0SzNKTitQeWVmTkFYTkpEUUVNRE5U?=
 =?utf-8?B?Q2N0UnZWR2Z1L0xvMCtrV2xNTmRzL1lsNTEvMnMzNTBML2twdldJU01JdWlV?=
 =?utf-8?B?NjlHT2lvZjJsYWNoMXdBUlpFSDJDcnl4cEZWMzlmWnF0M2dVRytpejMyVUk0?=
 =?utf-8?B?ampJZDNlUXVlUnlBMGE5TlB4bU9kMEwwciswYnlkU1BoN0oyU2NNQXVSVUQ3?=
 =?utf-8?B?SkxXSllVNFVMOXNMWjNZWEY0S0swMzJ4QkZjR2dldmtvalpGYTZaUW9DQy9U?=
 =?utf-8?B?YisvVkZ2cXBldlVRZkt5UGRLK1dPMGJxTXRwTWd6cGM3ZDlPQzFaTGZrN3hE?=
 =?utf-8?B?cXRnN3FKQTBvRzFtdHB3aGI2cWdrWm1haHMzUGE5bUtGa2I5Nkk1QmhzblAw?=
 =?utf-8?B?am1TeklMYjVSeTJuRWxjbm9qVE5zN0lSWnhYNmpUYW43Y0t6dlFFKzhsOEJB?=
 =?utf-8?B?b1k5WlFvNk1SL2h3WC96eXRpVk9iNXN4b3I4anlDVFFxeVRPRHJBV0J2K2ZQ?=
 =?utf-8?B?N25WZVZjbDNRYW01Z29PK2ZFYjkxR3prQ1ljNDJRZzZha28zTHloUkdydHlz?=
 =?utf-8?B?QmVsQUxRNG4zTzNxejVnNklOKytiZUNYNzZKUEFKaGxxYm9MT3VwYTR2SzBR?=
 =?utf-8?B?R0kwLzVKZGZ2azhmNmdWY1JmQjlQYVJKeHphYzdUMUlmVEE3c0NWYXZyQWN0?=
 =?utf-8?B?czN6R3NZM2lHeDhEOEZFanViMHRyamtidm5BU2xMZitTR1dOZVI3UythSkFx?=
 =?utf-8?B?dTJ1T1B0eUs0MWk0N0lPMi90cWFHODhjTmM0bC9tVUFDSkUvY1MvNlA0eHdY?=
 =?utf-8?B?djMybjd6MDRqSU5zQS9XdXRzQ3ZqWEJGdlZjR0UzRCs4SnBsalZKNmpna2Fw?=
 =?utf-8?B?K3Z0UUVPMzlRT1pWZDh5dzVNQ1o0YWRXUStqZm03V25VVVhuT0JuaTlVUGt0?=
 =?utf-8?B?NnJLa3J2UEhOZkVqWXpCMkVXanVBMnkyWnNsWmdMNHdlWE9JZ0dhNndyRHpW?=
 =?utf-8?B?VWtVdmgzZkxieGcvVXpVcHE4SXpFOG5aZzhhbExIWGxtWS80UERRZlFpcjFI?=
 =?utf-8?B?N2MzdGlYSzZSVmN0dk1IQ1FRZ3dJWlZZemxoQ0NPZFU4ZWxRSE5nZkNrVVFi?=
 =?utf-8?B?RnFEeFAybG0yTFkzdDBaQ3pvSURPdWQvZER2bEJSbUowaldudUVPR0sxcmxs?=
 =?utf-8?B?NzNUQmZJc3ErR2I3NVVhR05yNE5WUzBqU3BtN3RjVTlPc0l0WEdnV0xmSTM5?=
 =?utf-8?B?TERZb2dncDA4aDVOUjIxcWVNekhBcHgvWjNHTTIvTDRobjNJeTV2cWozWDZq?=
 =?utf-8?B?L09pcHRFQVBQYSs4UWxaNWlSU1lSTkVYdU4vQUVLTkZHZXRVdXlqQVdzQjA1?=
 =?utf-8?B?aGpjRytvTUxVdU1wRkRjRG9scXpUY1R3Y3R4NUZlWDBaOG1Jc2VhekZic3NT?=
 =?utf-8?B?bHB5bkxhMkdhLysrZldsM3krbjlwNnk3UU55QTdUU3Jhb3NmV3cvSmo1bVNG?=
 =?utf-8?B?VDlhL0twckMzYzF3b1k1MHJib01RdWlySFM2RW1hR2VZV1lmbjN4cW1TVG9q?=
 =?utf-8?Q?bvv8yfXmZ6Anq4rj7kifTpsMm?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(14060799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:29:37.4368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3190a6e-b4ae-418c-0aa0-08de25d4f913
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11847
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

This patchset mainl adds description for 3 SolidRun boards:
- i.MX8MP Hummingboard IIoT
- SolidSense N8 Compact
- i.MX8MM Hummingboard Ripple

This includes dt bindings and a range of bug-fixes:

- dt bindings for the boards
- fix to dsi panel bindings referncing panel-common and adding port
  property
- cosmetic fix to some  solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Open Questions:

- How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
  (affects imx8mm-hummingboard-ripple.dts)
- Is "description for" implied not only on dt-bindings patches, but also
  dts? E.g. is this commit subject acceptable?:
  "arm64: dts: add solidrun solidsense-n8 board"

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v3:
- sinmplified language in gpiod_can_sleep patches.
  (Reported-By: Frank Li <Frank.li@nxp.com>)
- collected ack on winstar lvds panel binding
  (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
- Link to v2: https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com

Changes in v2:
- fix spelling mistakes in commit descriptions.
- remove redundant "binding for" from subject:
  https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- remove one useless comment from imx8mm-sr-som.dtsi to fix long line
  warning.
- change ronbo panel binding to inherit panel-common and switch
  additionalProperties to unevaluatedProperties.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- add dt binding for winstar lvds panel
- fix dtbs_check for dsi & lvds panel addons
- change n8 board dts comment-style in header
- collected ack on solidrun boards bindings patch (patch 1 in the series)
  (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
- added standard led label property to hb-iiot multi-purpose leds
  ensuring consistent names in case lp5562 driver starts using it.
- Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com

---
Josua Mayer (11):
      dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
      dt-bindings: display: panel: ronbo,rb070d30: panel-common ref
      dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
      Input: ilitek_ts_i2c: fix warning with gpio controllers that sleep
      drm/panel: ronbo-rb070d30: fix warning with gpio controllers that sleep
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: add description for solidrun imx8mp hummingboard-iiot
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
 .../bindings/display/panel/panel-lvds.yaml         |   2 +
 .../bindings/display/panel/ronbo,rb070d30.yaml     |  14 +-
 arch/arm64/boot/dts/freescale/Makefile             |  15 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 395 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 853 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 713 +++++++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |   8 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c          |   4 +-
 17 files changed, 2549 insertions(+), 24 deletions(-)
---
base-commit: c40d6bb13775401d4ac3f68ca3765f47edfa7ed9
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

