Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3B998BFB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 17:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0469310E0B5;
	Thu, 10 Oct 2024 15:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cTSCv4h5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D46D10E0B5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 15:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmn3eKQBdDHdhvQrnYdqWujkyg0CPVv/28JrC/BgdjKlKAlh7NLOVykYhLsaP08r26vCxHH23HIAcDKgGTWFGFeMsn2iPZjEjA/IhSvqVwGLZC0HM6CS9bTS61fc038SvMYF5yAUwzf9X/PoKEZkME+W1lE3KN2iFrNEX67zlX+hdBryTjOEgwDthxv1e3Q5klfd/UAz1d3p2uBKnRhkNgq+mQEClIr+KE/hu0uW+8CPL46eG8RsErSxHUDhh3/LKdmJqbHFDqu74KOM6wzAKkNc+Cfz5Fy54asvr9pyJxPiTnZCByOEd/99ELT0D42SXR9OG924WcS8H363mwi8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP0VBvZWlThDWEJW7MVOfXrUwg9EzkapLRwaqgJ2VI4=;
 b=hQrnimJPQg2KfwmgxmLEblBT8wp3SmwmCOkeH+5ly3FoSWzJ24IVeaRemhxB80zjSxW7HiNgeUYeOh/Jd+ZxAvM1dsOS3jCfuaODvFFRNAYvOeIRAoqi/uomRRLEWoNUyE0xi8dORrlmF/UTce/t1WnbLM3TivRklilKiQmdUJAtPr637INelGew7UHQf/Z2Qjn3IHaSotxCaub+gRg3iXKsGqZFV9ZtAJNTEpyiRGmEYCKjHwMK1Y1ild6091avLGzQEQsRNU0gvfDVXyiVVkfLQ3UKsNOxqIEua6AeJFD11cAC0hCHbv17ips+tud+tjEUsqi0tv6USv3xB0ZykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iP0VBvZWlThDWEJW7MVOfXrUwg9EzkapLRwaqgJ2VI4=;
 b=cTSCv4h57J0w+fA+rcDW8rR9Uv0boh9v2cV9hJnpGk49o4+R50IM+DBtJe85mNmJaJYm/iGhUdikw4LzhPRJ4/fUX8EBW44qRbpbjzBnFc+HCjJ5WrPvQC3T9yb8CmmxpW1n4lUZD2uR1hbPS324kjKKc/iOmh/ZtNe0o8U+WP8G2irTB1tnUbDprKHkTv927lLe7Q2chobj0S4Y2w5V+0XZdYdRzd1Cca12YSD1ra4gdjfOk8PMHIVXW7nlBiYjw/ydhYQ7Vai7MD/VQpasfMT3icNHPUf6pXHwwuh+uKs/7gDcYJuAXB7xrjwWU18xf5FY+0yreVsYihTJdz3/xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 15:43:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 15:43:37 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 10 Oct 2024 11:42:41 -0400
Subject: [PATCH v2 4/5] dt-bindings: watchdog: convert zii,rave-sp-wdt.txt
 to yaml format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-zii_yaml-v2-4-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
In-Reply-To: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728574994; l=3314;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YTMkOF4Kh/3dRghFGNF1mfy0yW9xeMU2lmhKnFlPqW0=;
 b=XHFl3NL0xxCtKxYLv5Qd4+14hjtP9eeSmYfn91gmoifmLN/uVrVaSyldjg39ck7yd77pojhUU
 6fcO+UIE8DaD2TsPGKaK0qZGmWZfXlr3cCI44d4b9HdVzoIQetqo0Ag
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb8f580-7d2b-4ab8-8903-08dce9424e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2RXY3NUbXJmbzRzZitLR0p1aitOQndaNjNRaU9YNTl5UUM1LzRCZG1OcWcr?=
 =?utf-8?B?cnpjQnQ5RXJjOGlCcFVPQUlXR1VoYW1iWEU0RmlrSGIwTitaRHdMdjVtNTNY?=
 =?utf-8?B?WnB5M01hQUNzMWxjS2EyNEluODh5bU14YlNOM0ZteEllS1RCa0ZCbnZTWXIv?=
 =?utf-8?B?cGw3Nk0yM0M0REtiWnQ4NTI2Rlp5NmhlRG00em1RR0lNeXBialU4TFQrcFlU?=
 =?utf-8?B?UFBUall2RXIwM21ya3JWSmNkV3BsU3VuR3FaTmlndHFzNkRTQUlaWGlXTHBh?=
 =?utf-8?B?NWlLWHFFdXJpWFphMm44a0ZNZ08rU2xYdkJmYUF0aXN2bm1EY2RTNGZ0KzBm?=
 =?utf-8?B?L2RqNXFlNHQ4ak45MUpZR2dWZFZOOXUvSmIvSUlvbzVML0xGdGYwb2Q3Sy9U?=
 =?utf-8?B?NFdIZGxCZDgzZGpDdFRLTEFlMzU5ck9QU3NuT1FINnZwNk9QUEd1L3ZXZU1F?=
 =?utf-8?B?aGdSZ0VTUjdWL3VQaU05WTEvNGsvMXBaRUpybUFzVzljbHJXN0lMWlNKZ2R4?=
 =?utf-8?B?VWhBUmNnOThIK1JKN0J1a0dzOE9MS0FleGRLT0hsSnRZT05xOWtkUG9LY1RT?=
 =?utf-8?B?OTZBR25TSWxYd3N1cmVucTRpMzBjbGhKL2o5R3Rmd0pMWU15RG0wODN6Ukg2?=
 =?utf-8?B?dmM0SDhYMmJtZU1hRkZkY0hvaDhlaHJ0eUdCc0pHR25mREVxbzdaOHJtNUhY?=
 =?utf-8?B?cldURGtyZGMvUytlLzJibWlRRUw2ODZCWWV4QWdZYUFvcDlkNGtyTFJMbURo?=
 =?utf-8?B?eTB4bzJYeFhaT1BjcU1RZkxlUjdSV3dHSS90WFhwdkU2NW5jbmQySU55Y1F3?=
 =?utf-8?B?b0xZU2hmNW1nWDdoc3VsV21hS3BhYml4bmJrU2JxaDNVVElkT3ZieDJrcEla?=
 =?utf-8?B?WTFHMy9VWDJkNW96dWR6cldvYitrT2hrazBCaHdGQ1JDcVZrd1JMUU1nRS9k?=
 =?utf-8?B?VE1tdTdvcnhVZ3lzNDlja0NUanpUZllqWWN1Q1Zlb2F5ZUxrMUsrYjNBdzBG?=
 =?utf-8?B?Wk1vMDlDSW5QNUE0YkIwUlRqS1dTSXVCa3piVlNpYzZRWHRUUVpwV0QxZ1ZS?=
 =?utf-8?B?UkQwTGh1RGtnOTZlUnc3MWJsSmRNcnl0cEs3bGVGTTJ2N3c3TjlCbEFiWGQw?=
 =?utf-8?B?WXgzT0ZUd0xDeFFONUhlRXlTc2RsVUt1ZkRpR1VEazNTeEVEMXhONnl6Z250?=
 =?utf-8?B?OVE0bDRETmtpVHZBUEhQM0E4aW5kQmUzdk9INCs0M2Vva2xCZXV6aXFEUlRH?=
 =?utf-8?B?NXZ1S1JwNENTVzV1UU5DdVBrLzJDQmVldEw5alQxMFZmUDBBYk5TRlMwbFk3?=
 =?utf-8?B?bFUvenV2ZnkxeXRsbzRQWkFlbnl3cGtYTHpuUVJ3dEJPaEcxK3FJYlhOdzU0?=
 =?utf-8?B?SS9mWEZmcEN4Z3FUcHh5aEVJT0Z5RWVmRStYYmp3ajlCTGY5RG5ZWGpMRVVP?=
 =?utf-8?B?bkdadUtiM3JkL1NqcDIvcnNPSnhXdlJaMTEwNFNRQjJsR2NnK1BhMEFUNnhP?=
 =?utf-8?B?M0I5c0hEalRGbnM4dVhaYVRpeDlqaENhbjVTOVR2SGlmV25WQnZTMEgvbEJX?=
 =?utf-8?B?QmM2TkU3anFOeW5FVGR1MWdYUkZlYnhXOTZLd1VsNkxQZStpME5hb0paV2VQ?=
 =?utf-8?B?WmZCemRMcXZueWhxWG45V2ZseGtML2FJYWdnRUVVcWhEK2t0citYenhVRlpS?=
 =?utf-8?B?NGxGd0w1aUZYLyttcEdvajZIYXd2d0FKaG9NYWNxbGJ2TUpFZ1luMlBxNmtk?=
 =?utf-8?Q?i6FZfnP3El2cF7bdD0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTBaTWZybE8zNVZXUFRpU3hWeldTbzIzWUZXcldtTXNNTlJwaGVaRmxTYVFl?=
 =?utf-8?B?YytickZXQkJtY2U5SUljMEcvaDkxZ0JaWmdtTGRYb0hGYnZBSVFlNGx4TW1K?=
 =?utf-8?B?bzJUL0U2Y2VTMHRRYlRUWTExdWwyM3dhVUpJYmFWdWczeHh1cGIwblhLOHRs?=
 =?utf-8?B?NnZackVRTGxmZlFUUkp1S3RVNnZ3TGorUlhMcEJmR1pKNzJRVzFuY3hQQlJp?=
 =?utf-8?B?TFVlbTR3UExUeFR3WlJaeVhwSDhiQXJDblJydUpGL29CRzMzYXlWS3hIZGh2?=
 =?utf-8?B?QTYyVExpS0VOUnEzMmhXYldHQUVxbktEVlk2cmUrTHVCaTBkMGkvY2NvVW11?=
 =?utf-8?B?a0JQVFpoQk1JZWd5UUpvUHJmdTJCKzh0VWo2N2xoVE9iMU1HK29iYzZkZStk?=
 =?utf-8?B?TlZXTFdVaERXdlJpRWQ5TlN4eXltemVDNUI1YndvQTREbHZjSFVLN0ZaU0R3?=
 =?utf-8?B?b01wdWtiYlI3TjBSVWM3SmVlR3YzRUtlZHR0Q0laZ2ZMeGJubUVGMnZJU3VL?=
 =?utf-8?B?b2JmN1dtZFJqWGNxY0tYVVZXN25QbXdib2F2RGhvMTZEVno2amRrLzgwcVFQ?=
 =?utf-8?B?bTVpV1dTZUI5UFhDMi9sTVlSZGdtV083WlZ5aTUxRkJEbm9ieWlYL0RmOVBo?=
 =?utf-8?B?cUs3NmR6T0lYQTIzWG9FWGNsWnlBKzZrSlc1dkFkYnZQelV0WmUwWGhBWUlR?=
 =?utf-8?B?QXBQM29EQmF6bDRYQy9yVjFtMmR2aDBhZDE0QS81WXhLaEVvQ25GTWxwRW5V?=
 =?utf-8?B?ZWZ1Uy80anpETVU5MDF2cnJTSGJ5TGpxWmw5RGtseUpGZ05Hb3ZUcTJ0Wlpi?=
 =?utf-8?B?aWdUSmN1R1AvWERIVmd5MGs4UTFIVlU0NElrckhXejllOEZhNnF1YnI4TWl4?=
 =?utf-8?B?d1o5VC9JdmVmdTFWY3BSakFxMXNGbUJQUi9rbUdyUXpvaGR1NVZnNUNrNE5U?=
 =?utf-8?B?SU9OVG1uSkY1N1c4bDNxWjl3NWsrQjZFaitkOGErQm5KbjVWTFVsZXYxOXVZ?=
 =?utf-8?B?bFVUUE43YlhyN29yZGlOZ1V1U0xObmlzRUNac0NxUTBmSXlrTFdHdzF1c2Fn?=
 =?utf-8?B?OFN5Q0hLc1FuT0xOOElZVUUzUEk1UVROZWRjenAxU3lSMGpCTjJLWURhVzdw?=
 =?utf-8?B?aDdkUUlwRThiem1XUDdSTWYvTjVIZWFRRDVKaFFBdVJyRlZ6d3BGMWdtbHJU?=
 =?utf-8?B?elFMKzdPNm41TzlzV2tHN211RUdjTGJDL2I1aDBPZXNQcVhOSitUdnBGSDAr?=
 =?utf-8?B?akswOVkrV2NQZUVBK0hBZGdOODk2ZGVSNmVyNTY2RWNRZ0xsV0kyNC9vWmhY?=
 =?utf-8?B?Z3hrY1JaK0NSUmpkS3RKZUlueE5rUC93MTJSYXBBS0hlK0d2WDVpV0tCSFZn?=
 =?utf-8?B?Y3UyblcwVGxNaEhWV2taTk54SDlLZG1PbTVhMDR6aEhleklzKzlqSS9BNmNM?=
 =?utf-8?B?UzJrVFNORlV2V0JDaVF5TDJ0Z045SmxhSHc1bGxpcUJFWEgrZmFCcm43Tm8r?=
 =?utf-8?B?b251NGprWmNqaFBuWlBtKzNxQXA4RkNLUEpYc1REZjdpaGpZQnZPQmFLSG1R?=
 =?utf-8?B?L1lta1FEU1dQbVA0d2tVYnZiYjl5SS8vMFlJSXhYQlNYMjJrVFZzMXUva0ZD?=
 =?utf-8?B?VENTQUxHU1o1aTV0ZzJPLzBSRStieU1tZnJkL3FuWlBuUUlubjdxNm13aG8y?=
 =?utf-8?B?aVBvTVQvZ01rcGl1Q0tKQnlsNFJHQXg3VCtZT25YQWlMYTc3aDRLU2tXZlJZ?=
 =?utf-8?B?NHV3dHl6VHFOa3MyVWY5K3FTdEUrVGNYemtTeFJSbmNqaTVMaEhGSTFzSGRo?=
 =?utf-8?B?cGtXd2RORysxbjNKK3QvRC9LKzZBR0J0L1ZCN1VwOVdhL0twOFhoZXR0NEVj?=
 =?utf-8?B?TEVGZmZNWU1GWFdka1lNd21VVytQU3lKSitUZDdDdzFyanIxa05lN3FEcWpk?=
 =?utf-8?B?akZwajByOHd2d1ZPWVBrQXJLUnplcjBaL1FBRzVIb2M5VC9BTDJlRk0xbXo3?=
 =?utf-8?B?NkJwLytuZXZVWjNmQkovc2hocFhUUjAvNGhONDVKVm40VHBFVG5id3VYZ21y?=
 =?utf-8?B?YnJ6dVFjdmhwRWZiMnJOK3IxaXdSOFpwbXA0Ni9zY0NiaXFFcDFQNjhtZzRI?=
 =?utf-8?Q?mbF4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb8f580-7d2b-4ab8-8903-08dce9424e5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 15:43:37.2363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9dg9yCcEuLFGRGJKzA7GTLcnrE0ZCy/IQP+4hca74lMaIWnjrXhSTdprPvW0Z4dxx4pn8+vBx0SnqexL2uIIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984
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

Convert device binding doc zii,rave-sp-wdt.txt to yaml format.
Additional changes:
- Ref to watchdog.yaml.
- Remove mfd node in example.
- Remove eeprom part in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/watchdog/zii,rave-sp-wdt.txt          | 39 ------------------
 .../bindings/watchdog/zii,rave-sp-wdt.yaml         | 47 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt b/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt
deleted file mode 100644
index 3de96186e92e6..0000000000000
--- a/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Zodiac Inflight Innovations RAVE Supervisory Processor Watchdog Bindings
-
-RAVE SP watchdog device is a "MFD cell" device corresponding to
-watchdog functionality of RAVE Supervisory Processor. It is expected
-that its Device Tree node is specified as a child of the node
-corresponding to the parent RAVE SP device (as documented in
-Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
-
-Required properties:
-
-- compatible: Depending on wire protocol implemented by RAVE SP
-  firmware, should be one of:
-	- "zii,rave-sp-watchdog"
-	- "zii,rave-sp-watchdog-legacy"
-
-Optional properties:
-
-- wdt-timeout:	Two byte nvmem cell specified as per
-		Documentation/devicetree/bindings/nvmem/nvmem.txt
-
-Example:
-
-	rave-sp {
-		compatible = "zii,rave-sp-rdu1";
-		current-speed = <38400>;
-
-		eeprom {
-			wdt_timeout: wdt-timeout@8E {
-				reg = <0x8E 2>;
-			};
-		};
-
-		watchdog {
-			compatible = "zii,rave-sp-watchdog";
-			nvmem-cells = <&wdt_timeout>;
-			nvmem-cell-names = "wdt-timeout";
-		};
-	}
-
diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml
new file mode 100644
index 0000000000000..de0d56725dd40
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/zii,rave-sp-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE Supervisory Processor Watchdog
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  RAVE SP watchdog device is a "MFD cell" device corresponding to
+  watchdog functionality of RAVE Supervisory Processor. It is expected
+  that its Device Tree node is specified as a child of the node
+  corresponding to the parent RAVE SP device (as documented in
+  Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml)
+
+properties:
+  compatible:
+    enum:
+      - zii,rave-sp-watchdog
+      - zii,rave-sp-watchdog-legacy
+
+  nvmem-cell-names:
+    items:
+      - const: wdt_timeout
+
+  nvmem-cells:
+    maxItems: 1
+
+required:
+  - compatible
+
+allOf:
+  - $ref: watchdog.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog {
+        compatible = "zii,rave-sp-watchdog";
+        nvmem-cells = <&wdt_timeout>;
+        nvmem-cell-names = "wdt_timeout";
+    };
+

-- 
2.34.1

