Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FBCB530D2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1464710EAC3;
	Thu, 11 Sep 2025 11:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GMTKk4XJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EA010EAC0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:38:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9dWYPCKow6KVq9FC33EyAUe4xSWG0Cdr362FtyhKW35RzRyFx6+blhZNPPG6cXc/HIwrEwI4lASnC9Puw3tt+6wo/tdPnMxn4aBMw+KYvcWtOGPbf6F0a2sZSPU3K1tCW0rYt5e90/McpqYH7VW0B7YUg2HkJ031CVDdcpMs5QCrzuiJxV4hH8c4DDxBUxWNwaUmNqXRKpJuDdmGQob5ldj0jlKUzBCBNfQg2ZiUg1dsGZnv70pSNjAsw+6IC8VKg6yAM9VAaR4fYpR6OOUPVxNDyd90IZ8gG18Js3qHNfQZVAyESNiFhB9mLaxECbzoG1lmbZ22Wb3W7w+k3WtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95Bcph71ho1p1rJCUFW1M2Em+i2edQlfDTZWJ6c3qNU=;
 b=Bmq9zgJqsd8BniEPsRVS+8pC4zUdSMfEQi8osRJJ/JkcRPvg6sQK0vU5RNN7CO/3Fxnui0tcjjsMiRxAnoJs/ICI+/cbH3z46zukqsyWA7Ue82E91cBa0EZXAlo+u/nODEJajfUY3Ru6AAcp4MEQSsnCaVqqPLMFzrbiBGkAtpjxvL9OsW7beHC6vZ1/G8nRJOthRqbJ3MOjucg6/Qcs+7zyzpK7yHJdC6N7imDIZbWqiK514Z6FbFYJ/kQVVB3wQL2aCHGaRIJvMVeJ/WgdoFV2u2BtFWawNSSd+2/nZrpxoc/hRKnFQDBpQXmdlD50nJ+RyE/+l5QMZ58KCQZTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95Bcph71ho1p1rJCUFW1M2Em+i2edQlfDTZWJ6c3qNU=;
 b=GMTKk4XJqaY/f5yfNaACavORoiaVS0nXbfBjKAnz4ev/Z/qLmVf5Fj/AfUevdMO2+LInz0qGCc3tQGWiMsc+F5i1Sgg4L8wmBP6AYz44ASACP0HT5NuEg6lHVVGGFC4pPEJF9Bc8dcblySlKLkOMpj1CLSqVlSPYT4OJX20JpApJALHArvcHQSofIdLVp38M/7P8dlygItC7ey9ay5OpbnJBy/UGTEq2FkyXHx3e8AzWDLQxIW4JL6g+axBSYWdIjkpZAKQycYxWmv3X9uaRe42zy1yzuvqf5eglYsapFVfU/bq61qsUqnMQEQ/6wvhghDbiebAC5ZlMoaXxOWxT0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by VI0PR04MB10317.eurprd04.prod.outlook.com (2603:10a6:800:216::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Thu, 11 Sep
 2025 11:38:09 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 11:38:09 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 9/9] MAINTAINERS: Add entry for i.MX94 DCIF driver
Date: Thu, 11 Sep 2025 14:37:09 +0300
Message-Id: <20250911-dcif-upstreaming-v5-9-a1e8dab8ae40@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0015.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::20) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|VI0PR04MB10317:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db87714-af64-4d15-81ec-08ddf127acfe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFFQZlZUTkJDVTc5cXRPdmhqVlBYZGswWDVySzlweGhMRktSc2JSY0pZRXpR?=
 =?utf-8?B?QS9XTE4yM3puZ0pCTXVtM2VkTDhXQi9DTmlpVk9Pa0RkYnBreFVxb1YxZHlv?=
 =?utf-8?B?TWFpYmhWKzM4QzdaaGQ1MHJoaUdqb29JRGNkSWloeDZUTHBBSjEwQmZNQlZq?=
 =?utf-8?B?eEZlalhQbWEzNlFXSlVhUFFMN0hkd3RJVzN0LzJWWndCc3MzcG4xeGViV2Ry?=
 =?utf-8?B?a3hPYmxQckNPbTFaeEx4MTZiT1JuK2t3cTA0cy9yeUxKcHNaNVFNWk0wK0Y3?=
 =?utf-8?B?TnBONDFrNVo1dTNvUEVKYTdyYW1aeGR3YUgrOHlicis4OGx4SWNsdWd3WWVF?=
 =?utf-8?B?Ynp2R3oyVlpVaCt5R2grVk9FcmJ0MThzUVZzVENPV0E0ZTdvTDRtMU1OVWxi?=
 =?utf-8?B?cjZMckN0d2tsZGRoNkhNaVJQOVA1Zk5HV3RSOTUxMUthNC9ibXNvbjd3b2RI?=
 =?utf-8?B?cHordXNCZDRtaU9ZallCdm05UWlJalUrU0EvN1dRUjdEaFpJSGc3VnR0WndF?=
 =?utf-8?B?TGdlU3NKVkdrK3g4ZlRSTWRKV0h1d1VSNlJ3ckp3SzBPeDkxUjVTbHF4dk9W?=
 =?utf-8?B?TUJtZXI3ZlJMQWMzcU5IbFZrZkRBa1N2VU9EVi8zNlhXZEpkNUt3TGR3c2NS?=
 =?utf-8?B?M2dZdjltdVVwUVBTM0lQaFlmQlV2eTZLMVlCb1Q4c2tyOXZCeVV0SE1pRkZu?=
 =?utf-8?B?UldYcUU2WDllRW9sRFpWRFVZRWw5cy9tNXBpTGtHOCt5VkkwVE1ZQm9UZk1H?=
 =?utf-8?B?ZURxL1FEQk5ZTFo2U0VGcjRPZnRDVzRRM0grV3o3VnlNL0puM3ZBYkRWWm1H?=
 =?utf-8?B?Zi8raUJwTlZQSjYyUTJOR0VpNFh3REkxWDlUV1RDckp4bHBvWGFIUDB0WXB0?=
 =?utf-8?B?eHpuTXR5eEdxbHNCQ2N2YUNYN1RUcUtoNlI0UnhQM1c2anFCWVA2dmtZcVhH?=
 =?utf-8?B?MWs0VEFpQWp5ZFVRaFhpMWVRdGFVbWpVWVNneEVLNHZ4amhlVFRGNlN1L1lD?=
 =?utf-8?B?bEFqaU1wd3RpM3pjT2d6amFiZEdaY29TQnVXV0FFTW4xZWY5QUFNNmxLdGxn?=
 =?utf-8?B?Rm1mZGRxTnN1UW8rUlBUMHFZQTllR0liVXJDR1ovenk0NVIrMUdFcGcyamxS?=
 =?utf-8?B?QW8yRHNyR3BnYnVUTUJBd2Qwcjk0QXVQMUJwUXgzKzNUSXR4YnRCQktvZThB?=
 =?utf-8?B?YjRMU3p4bWJRM1dtYlhBVGlRRDNqaU9CbjJBbUpyMlI0OHpCL1FPdXhBa0di?=
 =?utf-8?B?clBCZ1h4WVBJSzdoc3lyQThqU2VESjZTZWIzOHk0eE1vMFNWdHUvdExQNFVz?=
 =?utf-8?B?Y0hJSTNzdlNMMytlQzhRV3hnUlQyMTBmVGo5SWFHKyswV3o2Umt6VzV5enhW?=
 =?utf-8?B?dVdCcDVBc1FBNFVQR1VhV3RWcmdQamRjQy8ydUJFMlF6R2gxLzF4alp2SElo?=
 =?utf-8?B?Yys5eDA1OVcvckhYT0x6cEhwNWZZY1JVTlAzYnU4SmM2ZEVBT2pRUVk5N1NK?=
 =?utf-8?B?TXozVkJ0eGVoTkZHckx6ZFBQSFNPUmlsRGxBNVNoaXpoUjRPU1FSMUZWbUQw?=
 =?utf-8?B?dDR2N1plbVhuNWg2L1FnWUpSTkhvN1lMQlBWWENya2owT2VJRyt5RVhYc3VU?=
 =?utf-8?B?Z0FoeWlEeTVUQTVMZEgwVjd2VGZnMjRqRWNHenhvMTNuY2puaWVKVVQ4WWxY?=
 =?utf-8?B?VnN0bFBIdmV0akRIWlpzV2Q2a1lQbWNOL0NPay9ha0dWeElDREpXZkFJZ3Bs?=
 =?utf-8?B?TUtsWkMwOWFNN0Zkc0d5QytMREcrUEtCMzh6OXRqaThnWXgvYXdSTCt5ZUZJ?=
 =?utf-8?Q?oPdvP6M71dCHRzfUHzYSQeowLH67uvetOURug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T28yZDhrVFBBcTIvODdTMzU3dytuOFhrdTRkUGpuR0FqbmRxS3BLU1cwQlAv?=
 =?utf-8?B?bnhvT0xrMU9yTG1jUm50cStQSTVqWDZlQ3V6clZ3RzE5anBxQ2tKV056ZDJI?=
 =?utf-8?B?d29ZZVpXUFBJdksyd0hWLzFmL2NxZU9BeHJzRy9SN2hTNWh1WHAvRS9QVC9X?=
 =?utf-8?B?NzNGeXoxY0hkd2J0Y0JPblpucEtBV0JoQk5ncnQ1djlRbi9aZjdLeXFkVm5i?=
 =?utf-8?B?ckV5Mm5UWFIyWlVTNVQyc3Q4N0xJOTFrZncyb3JTeFgreHYyRXVFalBya2Rr?=
 =?utf-8?B?Z0xaVjNFZzQvdFptdmhHYkZWbGlOWDdCRWVOcUpYYjRzZkN6NTZzcW1oa3p5?=
 =?utf-8?B?bXZIREREeXZwTnFRMURKNitCczFTc0RKamxJYUhnU3VydGVXbFpQYk15YzZ4?=
 =?utf-8?B?cWZSS2dyRWpoTXk0THpTUHMxNkJVWC92a0tNbFBCMEk3YzdrVjE5OUkyTE5U?=
 =?utf-8?B?dlZIY3pUOTZUNy9KM3cxaG9tbXNTMmdVUnh6ckVFaEZid3hnQ3pVQ2duU0Vl?=
 =?utf-8?B?NXBkR2tId3ZLRkpiU0lUTks1ODVwODdqbm9iZWVqcURXQXFTSFBJc1E5cXVi?=
 =?utf-8?B?RUlqc0c5NEswTldtTWdSdytiMk5OMEpUM2pUSjJ0aGs1aTJLNTV5S2Jld3h2?=
 =?utf-8?B?MjRtRFJKSEJvSXpnb3ZYREpVcXZCc2gwYURPYmQ4cTU0Qlg0c2hsMk9tS25h?=
 =?utf-8?B?TmFOSmZHUm5HZ09pMGU3YzVGU1llQkd5bFRDWXNCQlh5Y0lGRnpDQWdpQndh?=
 =?utf-8?B?bXlpN05ZRjVOZkdwRC9uclRMTXJOczVDeFU1UUt3SGdWZWh1Qnd6WnRWbFlw?=
 =?utf-8?B?dkpna092YkxuOWc5cXhWUnpKeXV5NGNOVytkd2p0U1lJQ0tVdmFNRVE4YUpp?=
 =?utf-8?B?Y3VzYVJwTEhSN1VkUXpDby8yTTNsZmxwNGlJNXJiRnF5VGpqSG5WT25ZNmVJ?=
 =?utf-8?B?cWNBeW1Rd1k2amN2MWNuRi9hdHB0dUNhUEtnWm1ITFNiYjQ3SnprOWRlZWht?=
 =?utf-8?B?RHQ2SlBBV0prTktKYmlReVU1VHhuS3A4OFhjVGR4T3EyMmR3Qnh4OFowbVdz?=
 =?utf-8?B?akNBakFMaEVVMnhmUjg2cVYxOHBBRmE5YW5jLzBuUUhueFEvMzlVWkhOdXhp?=
 =?utf-8?B?d1doL044SUxxUWtuZ0Ntd0V2Rk5HaFdWR3VMMVVDYnk5VElJR1ZXWjZ1UW4w?=
 =?utf-8?B?ZFZGQlpBNGY0VWJOcHNJYmFOWTVBVTVLYW1iaTUzaGRocnFMVWNIOFdFcyt6?=
 =?utf-8?B?L0lmZHF4Tm9kcmhKN05BclJiZFFCVXFUYnJtY0pOY2JXNnkzS0h4cVRCY0Uw?=
 =?utf-8?B?ditSdlJzMFV5NnJJK05sTkgxUGRYa1ppS2lIWkYvK2ZQZldKZXZMODE2OGpO?=
 =?utf-8?B?dXhQN3hhKzZUZTlsblFpUmdnY2NOcjByVi91d1FROG5wUS9LZzVSMkhWcWdJ?=
 =?utf-8?B?cWgyMUJJb1EyYkMvajlYNXBJMnVXZHA4QUpZZlI3QnRXa3VRUFBpU0h6L2VG?=
 =?utf-8?B?ZncxN243YUE4VVU3ZkJXbFkrd0FaV3oxdE55dUNpSWszaXA5eFE3cGxiUXpC?=
 =?utf-8?B?eThiOFlEOUFFQnNMS3E0VXRSeElub2preDZoZmJrRDBoR1ZXbEpQTit6WU0r?=
 =?utf-8?B?OCtjRU50VnFYalAzOFpDMVNFSFhTYlFCWm1leUNrVGJCVDhBR2dBMDRiSHg4?=
 =?utf-8?B?ZFhBVUZDQXhFVTNOa2E0SGJuMmRmZ2ZUb2ZBazd1eEZUcnhSYVY5T2hMTTRZ?=
 =?utf-8?B?NEs4R2wzazBjSFJUaU51RkhoSW5pTGFoMTJ2Q0M4aGZJZFFGSmI2Uml2dDFK?=
 =?utf-8?B?NjZScHhRUW44YWU4c0FpV0VpaEdMTTJLbkNTRjBWNCthbGxxWE9La2ZhWURD?=
 =?utf-8?B?eDBYS094bmZwclVqb1lxeXo3YkhmcmI5SkkyV0t4NVNGS1pwaTVvMm9lc2xu?=
 =?utf-8?B?T1J5WUNFWEIvUzU0MWdwb3g4c2FvREp2N054Z3laR0pwQ0YzTjhtYXlaOWtE?=
 =?utf-8?B?SW9rL1BsWjhzVzVNVjhaaDBYV2hiQlNiWCtLOWtGVTM3em1PTjBhL3k5bmR1?=
 =?utf-8?B?aXA0SlNUeXI3VkI3dkkxeTFBdktCejM2Rncvd1lDekk2STRhWllFM3NGakFV?=
 =?utf-8?B?STZQKzRVSWlNR0F2WktHODF3aVQ3bjB6WVJwSDI3b0hyYXdlK2FOYVdOU3hi?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db87714-af64-4d15-81ec-08ddf127acfe
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:38:06.7489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3jKkuqOo2sIFzbYNaH4N+mJvypwoM5xEDxTNBpWXqUlR4FEkaG9K9v5p21Fk5DNMMK563/msrUhrjWNjmaPbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10317
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

The driver is part of DRM subsystem and is located in
drivers/gpu/drm/imx/dcif.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cf4990a8ff65cabe22cbe13d410de241b790320..bcfd60987fd724611de77b68151883a545fd1fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18440,6 +18440,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 94 DCIF DRIVER
+M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+L:	dri-devel@lists.freedesktop.org
+L:	imx@lists.linux.dev
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
+F:	drivers/gpu/drm/imx/dcif/
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>

-- 
2.49.0
