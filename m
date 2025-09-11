Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD92CB530C6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2CF10EAC2;
	Thu, 11 Sep 2025 11:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kYbladxB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780CC10EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHjEPAwjI/7PxyPKsZC7WRnUEd909P1Q+K8B50l4P/uRubqndM/B6Uz2DmbP4SspkPT3CQcu0Oh/JtEHCHLcbaEdMqVqBN7VC0gF4RvRtWxrevp9lm/9vdtS+jfgkVtBK72fLO35s0fWtZevMUpZwvCNL1qrQ2pFm1j2w7E90aLsr57LKWtt23oZkHo/0QxYVGZLu6TCy7Dzazp4iJbqDX8OOw0Lre5Aak0EQ0uTO0S64OhPGIUCV3KJLZuwqKzAHIoBz5K+Cu/gB/d/mpFY90s8QZljQkADpq20PYOrE0WC3UEkHwfno3yVbsA/OhQceu7H/gqJatjv7LVIVRrFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrLAjGRNDFIho9+u5Gr8TeVkdjcLkjeqc8YmbrnPSnE=;
 b=wb94XOT751vKJMz7sMlW9IAaE7wjsPkpoM+4cITmsaMJKW8KudENP99cGTBPjGlfTRDf3aYxCq2gRLbqk1+rKN6TdOnnrmBM1dWVZy1xKzFQ1Ehqa0aB40IldZ8hIX7JBmRKPrk+9idvCXQWS/8n9EscyW4Q3985Rh0QzOFxx4rFpBj/BWhZHdogIQxIMAX4Q7HbjtoSgfQJrcYgZN2p0gxliMBr1yAcyC7L26SFB9D6hYx9bUExJrVzY0il+/0f3omtNSDrog4Edu/R6c26F2iKj2MbN9LozKtFM5Lz6YByEKMYAu+v1J1sOUVPVHcYBEbVyJ347Umy5YgWA1Guzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrLAjGRNDFIho9+u5Gr8TeVkdjcLkjeqc8YmbrnPSnE=;
 b=kYbladxBUqurgl+ZNywypnrUCSPbBCkSI+czJRtIZQUSz0sZXOMMsOGakfxAxsr79kzHx4AwjpNqQR9XvqICKwx5HaSSGYqDx72A8DRfjgVh95QTkkE6NY0sjJ9BMna+wclGtLDu0tIKxZfAZqfsN83Y9i/xCPVsxcSLjZ3PaWSxiFli8eS5rBbQicHvXPb73Pv39IT0y94d+bPiUHvBs36L50lkzLOvrLkw02oC2SF6aJb2p4KCriV8RBV4p2jASwJyJeiUvmPxHKf7t1SEsbo3KBw2VMSRg2/kD1LvbziQFopkXS9vHMNOPN6I42b8IItzB5pit0I18icN+xEsqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB9961.eurprd04.prod.outlook.com (2603:10a6:10:4ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Thu, 11 Sep
 2025 11:37:42 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 11:37:42 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Thu, 11 Sep 2025 14:37:02 +0300
Message-Id: <20250911-dcif-upstreaming-v5-2-a1e8dab8ae40@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0142.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::47) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB9961:EE_
X-MS-Office365-Filtering-Correlation-Id: f41842a2-0972-40a9-21cf-08ddf1279e78
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3F5T1M4aytwaEVnS0w1ejFLemJRMEoyc0ovMytuWW4rMHE2WEZFWEZhdXZV?=
 =?utf-8?B?TmRYUEx0ZTdvREgrdFEyaW5NaFA4dDdLdnVVUHEyNndEY3UzbUErTHNTOEdZ?=
 =?utf-8?B?L3JqeW9KS3c0TFlEZllMUTJ0TXV5dHB0S2RCS3V1bkJ5M05ZREtyUjFWZTl2?=
 =?utf-8?B?TmZidWhLTVhMY24vOUhJQ28wV1FzR1FGVzhVWWdMUEViT2lzVFpkQk5hRGIx?=
 =?utf-8?B?NDRzZ0FMYWNZcnBFQ0F2Qk5yY3RRTm1YOU95TFU3WTJiSUJkbEt6RnlyV3BO?=
 =?utf-8?B?NVhyczEvTUExY3hyOTlEaHVpRGVqdDVjYWMrWVptM3lFdkRoNkpEaG4wRkxo?=
 =?utf-8?B?N0JsNHVtY2d4RjFwZVFDTEpNR3FPUS9KeERzZHl3MFgvRkN1QUo4OUhmalJl?=
 =?utf-8?B?ODczd1JYR09mdk8yR1hSQld4T2IwUXI0aGRoTW5WS0orNU1RK1BoMWtpWWhT?=
 =?utf-8?B?ekQzL0YzeXlNOTVqbVRHdEJsaW1VZ2xNZDlVaGwxS3M3dEkrMWxlVndXQmZM?=
 =?utf-8?B?VXFQR2NrR2VjMytrQlFRZDBjaHpPR3FrSWovc3I5Tmt0MVBjbFVrYUgrUzdh?=
 =?utf-8?B?dXZ3MUhaN05JeGhXd1kvWGxDcVJvbmZtSVdGYVJNRHR6K05US1lxWElaeDJu?=
 =?utf-8?B?c0xRb1J6L1cyOEdRLzRXbDg2S1drSHpjZnRjd0tXdExpWWhFdnNQL25Ed0pS?=
 =?utf-8?B?ZnBTL09sL3ZIZHFNVlgvZXNka2R0SHhjOFY2YUFNaEREaEdTVWhocTVvM1ZM?=
 =?utf-8?B?RFRvalJaeGpmYnN0OEt2ZGRueEJuMWcrU1VQSW16UFE1SC9QNTlhdk5jazBP?=
 =?utf-8?B?NDV0S2NyZlZpZkRITGxLQnVYaDUzN3o3VUQxaDNUU3ZkM1dlYVBTOGowaWd0?=
 =?utf-8?B?eTUxN3QvekRqL29lZGRzRERkaitnUGhzK3BFZWlSRlFta1BUZE9vQUhySm5Y?=
 =?utf-8?B?L1ExQlA0blowVFRVZGlkV1RFVTUxL2VpMkRUOHV1cjkvRnpSd2tSR2ZaMWpU?=
 =?utf-8?B?b1FNQW1jS1NTb2lJM3QxV1VIZ3dNQXNzRHZjaGxZR2poRjExOENWbUJ1b1Z0?=
 =?utf-8?B?bmV6dlJuamZJLzZxR1RqcStLUXA1U1c3dkFUa1J1OVFYNXc0YjhYRnBqSSt6?=
 =?utf-8?B?bDk0TVJwaE1XNWNySDVhRkt4OVRKcXdUU2hIQ250RTdmQkVuOXE5V3NDVzhl?=
 =?utf-8?B?eHVhSzVmSS9NV0ZLMlg5dEMrWk56UzdROG51bmRHQWRrakRMM0gzQ01XZEgr?=
 =?utf-8?B?cXBadjZaTDYxQUxEaHlUTFZnNENvKzdxYmVHUGI1ZHpaaDNRTktBMlUwQWFz?=
 =?utf-8?B?VFFLajRvSDZjZjc2clY5V2g5dzBsR2lxeVZHUEVOTjhYWmhCcmxyOERLNGtq?=
 =?utf-8?B?Rjl0SEVFcWRraE82VlRrbW13NVgrQVBVWm4yaFJrVCtBQWR1VHkvZVZYMU5I?=
 =?utf-8?B?N2c0bXBHT1ZGSGNyd2o1T1RqVFlySmY4T1JJcmg1aURkcW9GbnNieEVjNkFs?=
 =?utf-8?B?a0ovU2pFSDh6SDNGTFJNSStseU93WDhadm42RVlTU3k2VHRXRTkvaTVCQW1S?=
 =?utf-8?B?a1JLaHN6RzRxL2FQRUlqc1Q0Y3Bsa2lHL01PTi9DTFBRSmRaR0oyMG5KNWtU?=
 =?utf-8?B?bmFLNXpVUUtaOVJJaXlDMTJISXJDT2Z3NjNpcnJhWFlSMERvbnczWjNjUlQr?=
 =?utf-8?B?NlJyQzUxaHdoNUZxajZNRnluNC82c0tvR29aeXFabUxiSWFLcUxvTXAwUERN?=
 =?utf-8?B?SHNYbVJHNU9SUTRZdFpKVVpmTHpQeXhWZERNN3plaWM1V3lkTFpWVUlkc3Jl?=
 =?utf-8?B?ZXZXMmVBVXBNSEpuSXpBT2REeGR4amRxdU9tajhNb280UUZLYXJkL3d3Zk15?=
 =?utf-8?B?amgzUGkrWFBldWhDenpXSWVhTnRrY2ZGSExEM0x2WmtwaTYvZlJQUmtsWWZO?=
 =?utf-8?B?ZThKd3dlTTJHWjRLL3VydmRXUzNtUnpXeGc4NUI1MXQ5c3V4ckkrNEVKbWdT?=
 =?utf-8?B?OWVPNjlOYlB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFo3UytQdzIvVkZoWkhodkJmVkpCZjE3QkQwK0I4d1ZzbFJIMDBaNUo5OU4w?=
 =?utf-8?B?b1NzUjFMai9PZmhyVEUrL05uUEpTTC9nUEtkOXc0WjlHcmdzL00zWmIyenJZ?=
 =?utf-8?B?eS81ckcwbjJKN3drMXlZL2dFVkoxMjF4RzIvRFNCcGE1aTRYc0hCMjJNeThi?=
 =?utf-8?B?cysyMEEwR0xxNWxGSUVDQjhZRTBZQzdCWUtMM0dFcEh5ODJOUkdTTzJRb2E1?=
 =?utf-8?B?NE9DLythTWxWdmRINXhpazlQUWN4Zi9PM2ppVFdQTWFEQ0JZZWRwR0lzY2d4?=
 =?utf-8?B?NHpCOXVVRmt5RkU0WjVka1Vja2ZWdGxMeFBYUW1NQjlTeUJ3aDV1d2tRT2J1?=
 =?utf-8?B?QXpvVFFlZit3Lys1VE41ekQvL1pSSzd5cFE2V3ZYZVZpZmcwcXVxQTFqVU5l?=
 =?utf-8?B?MkhCMmIwZTBISEVlWGJaVmFpUE1zdjBXVW13QWRtREdNWFE1b0xBVVBseEJW?=
 =?utf-8?B?MmdEM1lpbzVpSm1HNG9lWVRXcDEyVjlDNCt6SG9UaFlQRDlPM29ZUVpHMEF3?=
 =?utf-8?B?cEZET1BiandSUnYwSzNJeXBYeUgvaVY5dyt1NlVRTUN5bEQ2VHlCdTYrRFFr?=
 =?utf-8?B?UGMwL0NOaHpKL3lHaDZkT21aQzh4N1BuV1V0VXlidEJWSVJGcGF2b2Q2NUJR?=
 =?utf-8?B?TjYxTTg4NW83MWpWMFdDMlM2SjFHV2cxQkNTUllNb09pamUyV0VKaTFVUDZ1?=
 =?utf-8?B?Smc5MVhjclFuQVVZQXNjTUxUeGdhWklubWszNlBNMjZxZ3ZQaG0wWlFra09N?=
 =?utf-8?B?d09vTUFWcjZYNTN6WitSUTNrZWY2UWh5Qy9DaWEyZzhtOVdSQlhTODVxb0d3?=
 =?utf-8?B?c0tQdFdnMXkvVU1SNGRuaGZIYjJSNUpuTUJKN0JKTnhsN3MzZElXaWFUQ1FD?=
 =?utf-8?B?MGh2aGcvQUQ4U2lyWGpsVkF4K0x5RC83VUs4WHM4Q2Z3SDZINXBLVkl2REhR?=
 =?utf-8?B?TEVOcVJmaGZHWWlhZDk3YmdJbE1TdXg3RmJna0hLT29kRWdIZDl6cVFHQkxQ?=
 =?utf-8?B?c2F0Ukp3Ui9xWVA3QmhyOExGbzV2Sm5penRHME5OTEhVSHJCcFFWVUNrRDky?=
 =?utf-8?B?WDFJUHlmYUIyMXpXRXh0R1dtMzJMUUFlRStHU3ROa1pMdXBHTExic0F2QmdI?=
 =?utf-8?B?aWxNbDZadkFSWWYzeW9YdlFrYWQvUnNjN1lMbE5qcXR4NXd6V2VMcTJJY3lr?=
 =?utf-8?B?TVFsV09TemJOMm9Yalg3R0hWcnRpdnV3bGN6V3V4T29LZU1YUW9EZjdZd01m?=
 =?utf-8?B?OGo0S1JvaWpsTlVlOGJxQkIwUjcrNHJJcG9GcXBRZUNUUjZXbzRralo5MEhG?=
 =?utf-8?B?Sm4wYkV4UVd5WlI2ZW94akJVRTJIU1VWaCtyMHIvRVk2bTdTUFF3VmYwUjNW?=
 =?utf-8?B?MEFRSk5Qak55OUFWdFpFMzlkdXBmd3p5MjZCdDdrUjFLdUF4a1J2aEtCZ254?=
 =?utf-8?B?M1JpdEtLVVQ3ZWRJN21WUTJqV3JYcUFONjA3Vm5FeWp2dnBLVElrNm0yUXU1?=
 =?utf-8?B?SWY1c3BXc1BtWlo5YmNSUXF5NWlpSXB4UE41NCtwR2VFRC9qNEtNNDhNMHNZ?=
 =?utf-8?B?dG5VM0pZaXVIVEl2ekZJbkxrRWpkOUxMTFIzdFZENnZwNkl3dE9GMlprUVBQ?=
 =?utf-8?B?UUc4WEEwY2VTRmJDSkpZWkg4bGxYTXNqWVhXcVBpVTJ4RDQ0VEE1ZUE1Rnpq?=
 =?utf-8?B?cjltQWtDYnBpbGd1alRkWkJ0M3pvT3hOVENjcmJZSWtPcktnOHJyTG9wREtC?=
 =?utf-8?B?bGtBdDk2SlhzMStEZjNHTG1vUXdocVlmam5aaEVlOEc5ZnhDelo2YytndHFJ?=
 =?utf-8?B?Y0R5TSt6dWd4NHFiRE1sK2ZjWHhPVUNqNHV0ZG5tYVEzSnF4MTkyaXkveWVn?=
 =?utf-8?B?L0pSMHJDeGRpVGJ5OGExNThtRDh5RDNENktoM0dISDN6Q2cyZ3c3cWkyVUc1?=
 =?utf-8?B?MXB4MDJHS1BnemhsRzJvWWllc3ZZc0xzbkdqY0x0UjQ1YkVzWDZXVS9UWVNu?=
 =?utf-8?B?Y2RCTklPRFRka01xdENRdjVkL3Zoclo1Q0dIU01zVG51R2JWRjZJcVpVMVRG?=
 =?utf-8?B?cWw5cE52dWt6MmpQeVBPSHFCSE5LajRxRnJUUm9KVHpjNzQweTl1Qkh1RThT?=
 =?utf-8?B?Q2hBQk9UcVJ2YzFCUGpraS94MzRjb0Rvd0I1ZkR2bUdkWDZaYnUzalljZDU3?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41842a2-0972-40a9-21cf-08ddf1279e78
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:37:42.2738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQmafEMOlmsjaMWX6kyK/z+Pxd0PdOfRoEspNis1GoLGtgvKqKdPRyBz1YyHlEoSv8mVQ1IwK4BTQCAF/YC56w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9961
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

From: Liu Ying <victor.liu@nxp.com>

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..665053d0cb79d2b4f50e69c397863ab024553867 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -15,7 +15,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
@@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
@@ -118,7 +117,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
 				 bridge, flags);
 }
 
@@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -317,33 +314,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_ldb->regmap))
 		return PTR_ERR(fsl_ldb->regmap);
 
-	/* Locate the remote ports and the panel node */
+	/* Locate the remote ports. */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
 	of_node_put(remote1);
 	of_node_put(remote2);
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
-		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
+		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
+						      fsl_ldb->ch0_enabled ? 1 : 2,
+						      0);
+	if (IS_ERR(fsl_ldb->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
+				     "failed to get next bridge\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;

-- 
2.49.0
