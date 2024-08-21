Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6B95A715
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 23:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F6410E6F0;
	Wed, 21 Aug 2024 21:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lxfabT0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369BE10E05B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 21:52:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRQgP1N9PrdJvz+fljP9rTL7cWzipbbRL45UkVMvDMxaHNJceoy491wQ0mX2BERxy9woqgGPoXpz3Gfz/jICYv0RajlzrW9+Xwjlmztkzf7dhROq7ozJHFuxQVQf6kco+WDkPHb+isABaxR5Us8vrsPIADxzAK3nX3MXq0JEJ+azyvE+hDPfPrsREUZg7V+Ke8qTOi4NrNvyyET9d4lerZjq3UhGKZiCaMPxCMhEwkWYuX5HECM2jLhhXCgkXJG3++gSw12pnYkHlZVkeOXLEjSFrEa3XKtLFrvY2UFbS5C0xu9an6BYfCeQ2iYVGDLrs3TM7uc0EdM8y9EAID+2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taQ0d2SrAM3mhQQZm06Oy1Dg8+gbUSsOFNPyTPdPHSs=;
 b=d/V8ZWs1jiJWUOr14AkgyYbdSR769scuZ5PYDoTht9C7YH1nRuEqzgVPPVk5Nm/UshJNFIt2zYWpIjG/MQ5Y/001/gysDU8qD3Udhebrz/hP1469GnNKvcgHVfQlYh+uQoUge2lxbYxzfRMxFY4ge+V88dGmZ6xscywmQL0uSI7TNlLHtP9VpmFd9Tmky3BF9Yy4gDspTzVzZN7zp9P5e9QDDHcG1wHyF6dTH0upzwE1PsT98RrcJZdEtLF9syQ7Uu13g3NKcQSefSJ4Dt6I9Tg4a9KTPyS0y3M/sxp2bb3asaD0DXyxFwO+Sc4pJWnxwLF8iW8z96cl4gB4gE0rpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taQ0d2SrAM3mhQQZm06Oy1Dg8+gbUSsOFNPyTPdPHSs=;
 b=lxfabT0uFyrSlMQN2uLi/S6YfDIExZM6XxHOBzOLxOdwqaRczvzpfnU5/wah3f5AMaa8IVvn3SNr2r/uTB9dCBvjQtljPmM/Ql3wt5Wkaytb+8UHNVxKVryg7QRwIpo8H+nfS+hjRu8BgRK51cmgYrRC/SqEiu0CcAEgBnSY2dZLG1ku41+q2gaepRxmwG1Dzzz1yxz75lvcKMAtu50bu6urIyee8EjfKbSr/u03JqFUl6liXw3NEXQotw86i8/JLf8ziXQ1U+rzzUpaS0fpthHYrRcSN7BW9uevRFQxbqs7D/CVTt7NIWpEb5Q50DCLft0kaPsHo0x2pme4kcyjvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10566.eurprd04.prod.outlook.com (2603:10a6:800:268::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 21:52:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 21:52:31 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 21 Aug 2024 17:52:11 -0400
Subject: [PATCH 1/2] dt-bindings: display: panel-simple-lvds-dual-ports:
 add jdi,tx26d202vm0bwa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240821-jdi-v1-1-6e3ce584072a@nxp.com>
References: <20240821-jdi-v1-0-6e3ce584072a@nxp.com>
In-Reply-To: <20240821-jdi-v1-0-6e3ce584072a@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724277142; l=1141;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=MozB8h62jts5iEy7M/MLsgUoyOcHCjwa6fRjwHSGuNA=;
 b=eS6UeJHm6tJ96JO9ubZSrbBi74Em6qUfkI9Mm2qN9CbxQ2J9rlNiVeKW6POwuN5muGtW17Rxw
 018CVbYhdGLCsYpUpk04Ng7SAUtoGsMHIyCVg4jAwoRSHAJ9OTK0L5u
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10566:EE_
X-MS-Office365-Filtering-Correlation-Id: 1034cc50-07c2-427e-ef31-08dcc22b8ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0R1ZWZxRDMyS2hZZEpRRXF0U2pXVEN5ZGlhSnkrTTJBaXQwdDVqNHlpeUY4?=
 =?utf-8?B?Y0VEb3YwUTRmMTRBb3pMUXhEZi9FTGlhY3hoaEs3WDczRGhobktFZ1IvaFlP?=
 =?utf-8?B?eHI4bzRpS0xtM3lxeHVMNWV4QkVjOTVpMlpnQ2tyTHdEV1M0djY4QzZsT240?=
 =?utf-8?B?ai9sazdoeER4NVRoYVBna3JYMnltaXErNTRuaGNka1d0OEJlNWVrUXpPZnZ5?=
 =?utf-8?B?REx3SFMvL0trcG9XN1o4T0ZueE1UUmNrc1hyKzUvZEFvSUVRejBGKzJsWFIz?=
 =?utf-8?B?dDdVN0F1KzlwMFVJejRscHlDNzhSOXNpVGJiWFIvZ083M2l3WVBoUXBPSlBB?=
 =?utf-8?B?Wng2cnFxL3AyNjQxbDhJMWluejBQeGFrUm1DMHVZSVpuaG1HSTZxUjZkV0xa?=
 =?utf-8?B?NFBjSUgzRWNJMDM3N3VGQ0dWZ2ljRHVxRG8zOUpRUVJHMThGQWptd3BDbGhG?=
 =?utf-8?B?b1kxb1RpUFN0MjVKbCtpYVZQTWNxTUpsMDZsOE1Jc2toeE9nU09ERHk3S0hU?=
 =?utf-8?B?cHNDN0hmWlozamVrU0doMUt3dEtpUjd0QUZzOUFXcmlqVFE0SFhxMkk1Qzdx?=
 =?utf-8?B?SkkvbHd4c3ZSR0k5MTMzRktCcHBsc2d6OHJTTERNclYyZGRPbVpCb3diZWlu?=
 =?utf-8?B?UVN0U2VPWGFyOHZ5ZS9OV3NmaG1zSUZZRzZhMmw2cWU2MlNvck5OcXBBRU5G?=
 =?utf-8?B?a1dpNWE2bVhlYXJJREpUckpMaVJBdktqUVZxNkVFbWVqb21LaGZsMXBGa1Yw?=
 =?utf-8?B?dmVLSEFEbGh5SW04YWVFM0x5SVlDL1lEMFJEbHR4Vzk4UWxXaFh2VmJrWVFI?=
 =?utf-8?B?d0ludy96K3FMY3ZMTGM0VC9CTnY5SjlEUEtjTE9sUlM1WmZoNHFTVEJIeW9x?=
 =?utf-8?B?dUtMTllFOXVTbDI3MWRSdlZaMkdZbCtYQlJRTzNjS1ZSVWRYd2NlZ21nczJw?=
 =?utf-8?B?aE03aGlVYUYreStJM2I3QVgyM1lrWURwNU80ajlYUDZSSWtiaUlQOTZ0b1VQ?=
 =?utf-8?B?Rmp4WFl2NjFZekhlUFVxUEN5K3VJcXNkMTJNVjBBZGRGaVFZK1JHaktKWkVZ?=
 =?utf-8?B?dkNiNk1sSFh2amZ0T09Dcyt2TStHb2NrWjZlTE5sN2NrM3dCWUJJWkx0NzNL?=
 =?utf-8?B?WFBYRWY5bHRtL2dnNERTMVdVRlo4bHp0VWo2aEZkTXFOaVVid0R1eUhXamNx?=
 =?utf-8?B?Z1ZhSEJ2eE1LZWcrRHNkSDJiTmhvMkhlZFNVQXBtSFBselEzQXY2YmtON2hU?=
 =?utf-8?B?MXhya3hmR0RLVXhRZERzWitHcndLemhlNlowSVo1NXhJOU1MaTROdWxrQlo5?=
 =?utf-8?B?TEVDT2F1TzJ1czR6OVR0VlFDVnI1NmZJSWdXenM3YkVBZjNCdW9Ec0MvSmtL?=
 =?utf-8?B?UmxGNjA4US9yMUVKTC9jaGExTDhBa214RDlIditacHltR2FyeXZ4bGZuMXNQ?=
 =?utf-8?B?VkRjRlNkMGVpV2hGM0tLOEtVS0VYMHFoQmRUUTN6UmV5MGdDaTZCaTkxaiti?=
 =?utf-8?B?R3pOVGh3UFJPU1VFdzRRODh5c1lkcnJXeVpEaEJvTGdaSEpMRUFOanBIcnlN?=
 =?utf-8?B?SS9peldteU5lZGF6SkJSYm5WOGYvbkl5OFkzdytLK1VrbmZVS0tTRjdiNkt5?=
 =?utf-8?B?R3VMeDhNSlorRHVLa1NqOHpwMnpmQWZtOXJmZjBxdHNLbVp3UU90elBoM2cv?=
 =?utf-8?B?YjFaRUgxYVNBNW9rVVVQRllzdlVWT0RQWUk1dnBZdS9zS0RNVHdFVEh5N2w3?=
 =?utf-8?B?RUNMRnNrYnovTkVrSFdSK29ic21nSmRQSU5rRS9HRU9pME80NWthaUdPd1pL?=
 =?utf-8?B?aUpzdEtSczVtNERPQWdkWVQzZVdFYnA2clFUTCtHODNQVlB5blJsSVlmai9h?=
 =?utf-8?B?WWxKdmhnTjFzeHEycjhwNytJVVovWmE5bHBnV016MFBHRndyam85S1pEMFRh?=
 =?utf-8?Q?he7UkWTHSuo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW53Q1AvZmk3czFadE9iTG4xa0w4UTFnU1VaMEFYbFk0Y2x2ZmZUZU1xS0Qy?=
 =?utf-8?B?anRkbWdkRWNaV0F4RkxRN2hyR0ZNY1VJeUo5M2x0LzdCWEQ2Tkp1Mlh0bFZk?=
 =?utf-8?B?aFhmcnhuNmJEektPSTl0RENoRW8xR0o0cGhRZkxzOUxiSzRRUUh6SVVIQ0Q2?=
 =?utf-8?B?OVRmMG9SQlVoSmZ6QTNvTllpQkxFOFphTFVVWDFHeFdOazVmRnBCR2M5b0x1?=
 =?utf-8?B?Vm1XMHpibEJKZEJKM2tLSCtoRTJFcVlJa29RZWRGOUNUZlQ3dHNTdjc0QmVh?=
 =?utf-8?B?TXVDSkw2YjA1TWNHOVV0enRVSUhMUzAwellCRmY2WEtheWRoem5uYWw4blRY?=
 =?utf-8?B?dm9NRVBoSVRFSDJ6MEtnOHlacmpJNUQxMjhDbDh2aVAxMm0vZlRubFZuWUY0?=
 =?utf-8?B?VVBjNlJCc2RYR0ZTd2l0ek9hbDNOOTVUS2F0R3M0emlDL2FSWit0Mjl5T0Zi?=
 =?utf-8?B?UHFuMnlINmROc0VGQkJtTzhqRExnWi9OYzB2dUF3cFBaVXJOK3IrSnhLMFB4?=
 =?utf-8?B?NmlYcC9aamttMzd1eGxTZTNYeW5VVHVnZHdSNHRsWnNpQnIzY2k0cW5XN2hy?=
 =?utf-8?B?V2hUWDk0eEZWNndQcVVRTC9XSHJFcUVrSVdUUWMxTDJCdGRkclAwUmZYWnBE?=
 =?utf-8?B?WjJ2aE9pcVR4SHJ5VEp2My9Ua2ltdFRYRDVMVEJUMlREM2I1ckZOa0dNUkg1?=
 =?utf-8?B?MTVSdjBnYUc1YlZSQW1UOWlVZEhucG95WUlRKy9VckxZWFpOdHdvanM0UVRR?=
 =?utf-8?B?NG5IOHJkS001dHBsaHhxRzBEbkhQY3J0cmFCdnU5RlFFaVlSRUl5d21MbEpC?=
 =?utf-8?B?dGMyaE5DL0xvS2RtMjJheU5RUkM0V1ZMMjJCSmpvNnQyK1g0M0s5ZlBRNnIz?=
 =?utf-8?B?ZHZ4bGJpSnZtSWR4aVBLTjZLbnBPZ0VrQXN4RWFJWlZtUWt4cFk0YzhUdmN5?=
 =?utf-8?B?Q0RaZk4veGJkQXpyeHdFYytzbjFBUjc2MkgzRUhYYkUvV0FoVmpROU9XczQ2?=
 =?utf-8?B?d29RSndFVWdIMlQvTkJmVmxTQjI2NmVqUjFBUjhVcEdRdjVkT1lCZTFCU1B6?=
 =?utf-8?B?ZDIyQzV0WEROT3VZZ0d3bEpDTzk2OXM4U2lzd0pSM0xwMVlleGkwZ2J2a2hX?=
 =?utf-8?B?NU9yckJpVUl4N2NMZGJCMG9RQ2l2SnI1TGpTWU40L3lkQXJobkJIYThzMzA2?=
 =?utf-8?B?WUsyL3RvaVlZZlVlWU1NNlRkSHkwKzhYRDhXOThGa1FnNDJEY2JKbkFVd1Bp?=
 =?utf-8?B?QkJuYmJObnpTdlZFY2NGTDAzTzR0VFhnVmNqTEczOVlIVjNiaUZRVWp4TlNx?=
 =?utf-8?B?SjNqSTJPZWdEamxJYjg2aTh1UC9ib2lyNXlsMHh5ZnZSNmF0VnY3d2JyWHRE?=
 =?utf-8?B?U1c5UHM1SlcrR2lUdnJnTUM5Rk9ZRWY1ODdPOCtzS2o2bGFEenNPREZKdjU0?=
 =?utf-8?B?bGZwdEdsYWxoZmhzTUR0NndFYzZtQzJjK0lzcXpBRGdzSEZqbEZaVUVoUWlw?=
 =?utf-8?B?bnl6TTM1V2xJdThYWVd6dVJVSC9wc0luNXIvRzVzYlpDRDNyOWh1eSttLzVI?=
 =?utf-8?B?c1Q0bzBXdWtIMDlFMlVvazNYK3VrSUpRcUdDSTVVYjVIOU0zcm5hT1hFRHNy?=
 =?utf-8?B?dEE1QzJYS2s2OHdOeWcybnpWMDJvMzMxZW5mN1BqRlB1eFRmbnladnVqQ1No?=
 =?utf-8?B?N0xZUVhucEdyeEhLOUdSanFnZ29yWUhTc0NwSlRJNEhUUGljTFBPTVd2amNz?=
 =?utf-8?B?RXU5NXNCMXRQR0dSakVNZXFQQ0hYK0pJa2xuNFc1T0dlcTRlek83bEl1RHhK?=
 =?utf-8?B?TjMrZEJBRzhXdmtKRlNXcXB6TVdVZGlOdlZnN1JIYXdHUlNDL0ZPcVRTSDQ1?=
 =?utf-8?B?ZklIcVljbXA4RTNScDlBUjhONkFEMVhXK0J1UmIzZ1Jtay96aUhyeFIySGlR?=
 =?utf-8?B?YzZCcHNqWjJIV2JhUmh2V1JxNC9JbjhSUDNKMVN1UUVFa2lqRm1XdkNweWsw?=
 =?utf-8?B?NGRZWC9HZVVCY0RoR2JVbUIwNGk4ek5VVmE4UG13OWdNNlBTb0IvWm1reEZs?=
 =?utf-8?B?NTRheVhPRkV2cEZmWVdQbllYVUhRcm1Td3hMOTlRS1h6VXBoVTZ1NWFRVUQy?=
 =?utf-8?Q?FYjVdKUNoIlTFoYn6ACE+CsE3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1034cc50-07c2-427e-ef31-08dcc22b8ee2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 21:52:31.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xz8bN7+XdRN922noOt23QbvuibDdpj68AeWxSlqnNthSRqJ4tdINM7TUtJPKAZ+zst0egd77rQa0ox9tQhOctg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10566
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

Add compatible string jdi,tx26d202vm0bwa for below panel:
	Japan Display Inc. 10.1" WUXGA (1920x1200) TFT LCD panel

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index 10ed4b57232b9..58de6a40ce21b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -39,6 +39,8 @@ properties:
       - auo,g185han01
         # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
       - auo,g190ean01
+        # Japan Display Inc. 10.1" WUXGA (1920x1200) TFT LCD panel
+      - jdi,tx26d202vm0bwa
         # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
       - koe,tx26d202vm0bwa
         # Lincoln Technology Solutions, LCD185-101CT 10.1" TFT 1920x1200

-- 
2.34.1

