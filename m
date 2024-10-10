Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359BC998BF9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 17:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A240A10E962;
	Thu, 10 Oct 2024 15:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Dsg1TuvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3853410E962
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 15:43:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE89EzZoUGU+nmMnwIzXexCBSXAEbdziTLBXxaeh9vrumaOzn8XL/oXgRuVF9rKZDSNyFQGsm3AdUhbrG7BVhtO6cV8fo2YjFbJBedRhoY23Y/QkH0PhB1PvXrneObqPU5O0hdHq079uvRd/TK4XZ+3xLxXHK7YWS4tcBQTtwVA9HTVXl3VXIySreeH7sonpoVOTAfMU8lOuAujvbjW3xgqEyh9MOx3DYcSFiIeSBX5i9Sec5QjgxHMtsJpzmhFX/bgzEzpAV3Zf1f7nllI9wSn1hZme7n6Q+DL1ThgyZAUnXqWZJJ/PC0bzSXtx9sXo32VLMXk8+wjkK7Asf9ZbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8hjfbsXm1SEn4thXSLE7lWwMtHZotNuxJShgldUcc4=;
 b=VFyp3ruQAqoGUVpPVUhw34JL15FuztZWOfd1Zf0VpjT02tPT+D10m3luHA3rtHaLcpyfiFxozSdeTuW6x6L+PRrNcM72QYZ1l3lKNHZVfgFCkZPH2CTloE5Y8ta3DINHMzpKe+FaT2WWIpBkL85M2VRb/U6hv51ct0OqlvIr50duaOw4EzGS42+lzc+VEgnf2N+/pqvDTVI+T+fr00QLTgKkt/2tdevyuut6a32vrbsRIuOWMvZkbz+GSRZsaJllMvk/vVieSdiA9cpv+myOYJYLxvxwoPWdwu2WeSjoDuYJiHTQK69MePEjVJ6wn+yMc/4hHnvWP3684Ex1Y+6bgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8hjfbsXm1SEn4thXSLE7lWwMtHZotNuxJShgldUcc4=;
 b=Dsg1TuvOtU9HzKo6YrlYvXAU+snF1XWlW2lbTqAOgjIJv9duDV6yzGluiUgG1cJTLSKa3XYKlXuz+hjE5MFu0p+Hsz+lzr9YpG6TESSdYpWAgAv+0Q4qzsj0TOVgy085Cq0t6TeF9WdkcG1+DHxq7iufmHB83ZW9dHO4t2d+/b2oOo2zAFZElf371Ol/5yTUxx5J7+X3epSwhS+o6og8vRuKKxosvf0AdYCf2unFEQsrpc4rakHmaU6eTobaME5H1BxcM64B/eL6ccNRkzjgXyM+hZxiQ4VapyJSj0B7JX57mGdY2ctUdgk7rdgRqasOf3Cp+9Db3VS4KYyFqTXfsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 15:43:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 15:43:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 10 Oct 2024 11:42:39 -0400
Subject: [PATCH v2 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728574994; l=2749;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=SGGydHhKKWQpzGXHrnyGpPKC8rInbg4w+D3agDzolx4=;
 b=dHJzY67wgQD09pZYCaBI5L1uNof/j1lbbXR20+MKYtfvzzAclG2RAMHG+pQ03DeIyrbrb7hzh
 Rx/CfvEgoTPCI6zecK+mBeH4Oo4IysEacJzu2MU5Zg/S4usRF/l0r79
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 850fc8a6-128e-42f9-210c-08dce94248d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGdGb0dLMy9BUStuQjJsU0NIaHNKWE9wVjJiOGYyM3J5UFMrV2dRdXJ1ZVV4?=
 =?utf-8?B?MGhoQjc5dElrOTNLME5vYW54RDJmZDdoRm1HSG53ZHdEZXR6Yjk5UU0yWUli?=
 =?utf-8?B?VXRkcUNLZzRNZ3JUZVovNTRKRDhOaHp1NkxrRnZvVjRTd2EweERUaldldnp4?=
 =?utf-8?B?aFR2NGs4aFBMTVFhYjVMdDhyVWhlOG9Fa3RzaC9qQTBrSjlqeVRMN2Ewdmtw?=
 =?utf-8?B?UW96b0I5dVNGVHd1bkxSTVR5K282YnVReE1tSC9ucURWY0R0blBMYWFUNURN?=
 =?utf-8?B?dGxmYmYxNlpHWjBocHBub0lDZytWbEIwZnpOQlZHeFMxampSUTdVZnhnZURZ?=
 =?utf-8?B?UEt1NGNsdnJXLzduRWJ6U09XK1F3MUFXM01uL0tCUzQ4VGV1M1lKOEtIcU9F?=
 =?utf-8?B?T3JPc0daTkJBeGdXekJKVlVUalBQbmY1Vm1kSng5RVh2OE1PZHo5ME9oRTU0?=
 =?utf-8?B?d3BnRzVNNUFtWlliRTYwOU9rMWhLU0ZaZXN4YWJrc2JIeWxqdGYxVDhTeTJU?=
 =?utf-8?B?ME9zNXo1cCtVemlQYXdHS1cxMWtqTUlVWkxiYW5EemNhd2tjNkh3RGJKZFBh?=
 =?utf-8?B?K2l5MGUvd2lIRFM1Sk5GTXo0TkVoUHlKc2prQ1VQUXMwQXYyVzY5b0FFeDNH?=
 =?utf-8?B?SUJMMGdRZkhvbHJPWnliT1FpWmtuMmc5RE01eCs4L0Nwd0Y1V0NkcnhHWlVK?=
 =?utf-8?B?MWxITmo4YWQyeWtSZklNKzFBcm8wV2QyWEZmNWRPTGhhQ2QvNjNVTWh3bXlm?=
 =?utf-8?B?dk13cnlIcEpmVkpBL3B1NXFRNmU0Sm4zd1ZBZTQwVE13NUVNdG1WUGJrTXYr?=
 =?utf-8?B?YjE0cXhDQ0xqYkRvUGVFbURycW45YlQrM29oeEo0ZGlldStKOHpna0doMzJ5?=
 =?utf-8?B?ajcrNlhnNk1ZWkRqampHdXRxNFFDelFoNGVIWks0TGp4ZjF4cnhDZVZHNEQr?=
 =?utf-8?B?VktWazN6VzNCbm1qNWJlYk00dkRmdFpUaitidmJ0OTU0aXdPL01Zam9XaE5k?=
 =?utf-8?B?MElnSm9MTGxhV3dSbzFaYlFrOHpDL0pwQkYwemVYUEREYmtrN3NkZWNsM3pB?=
 =?utf-8?B?Q253TmxvVFJBMGo1eURKeExFK2FDRVFQOFZhaXozQmhEaXgxcWJyZ1kwdkJ3?=
 =?utf-8?B?OW9YSThoTEZOT204bjlob3hoVUM5Z2l1VnpBTWNKakNuR3ZpRGFFQjFGeDhv?=
 =?utf-8?B?Rmo1bllsaDJVUFVobkJyajBaQnBTMktFcFltYVNpenkzbnVjUjVJY0x1cWpI?=
 =?utf-8?B?bzBZcVhLRWcxVFRxTmYweGpQamdnbVozbllMSDEvZ3R5MHZGYUhoaVFuS0kv?=
 =?utf-8?B?WVhSTlJka256eXd0bmQ1aDE5NE5jZ2NmMVhuWDRheVYvSUkwQ2pUeWFxWUtu?=
 =?utf-8?B?SUplY0hkdUE3eE5oeXN5N2pocVhqTG5wQ1VXYXpSODVycGVOazRHLzQzamgy?=
 =?utf-8?B?TUhXRUdaYitNTm1lU0pBbGJNbFVvSkY0UmIzWUNzMlJpMTR0MzJDVU5hUktT?=
 =?utf-8?B?a0NUdDBSQU8rYVp4UnpYZ0RiNjBJYjAxbms2Q1I5Q1RWSW0zMWErSlVFcFR0?=
 =?utf-8?B?U3I0aXV1TFI3enNid3gwY3BneVEwYVd1c2J6QzRMT1pGWXB5SVppVHZPaWkr?=
 =?utf-8?B?RjZMM1pvNG9kRTlkSDgwaW1jaXV6MDVQVFdXaEhsY2cvWkdCa0c3RndPYVI2?=
 =?utf-8?B?V0hzQ2hicHlBVlM1U003QTFwa3FCK0poY21YRUg5UkhwSDNzYlFTYUlRYnlK?=
 =?utf-8?Q?CmdT4zbM0X2mHpo6mA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N05yaFpUZDJhdS96YjBsTi9iaUsrRTRtZ2g0L1ZGdXNsaEtWa095c0ljUWxz?=
 =?utf-8?B?M1U2NXJSMTRiRk5aZmR4Ty91aUpJcENUaHdSeTdGNlhzaVpOYkx6UjhyNUpx?=
 =?utf-8?B?VTdoM1BOTEZRVk1QY1M0eGgrMDZhWWdFTTJncW5BMkRUWVkvWUpOMDRVQjA3?=
 =?utf-8?B?S01zUERsbDlhakx0NkVnVEo1Yk9hcmZ0aXFVZjVqcm1WcXpGUGgwSkV3emI4?=
 =?utf-8?B?aCtORHVwVFNjc2dxYUpxa09FaElZRno4R2w3SFZFTkNUbzFIdGtvWmdkN3BF?=
 =?utf-8?B?dFdGbWFUWjdRVm1scm1FQUlDbnoyeVRaLzVTWjQreko0aWFpUEhJMlBwK3pV?=
 =?utf-8?B?bHFNMjhra01OSEhmTy9PalUxeXlkK2ZTWWlBU3gzMDZkUm1rQkxvaDBMYmls?=
 =?utf-8?B?UnhZSHdpRjNoWWV4dzA1OGdybGsxODZFZGFXNURNMGUvelFMS2lLN0wxRjho?=
 =?utf-8?B?NWtwNW1SUGpMS0RtbXlTa25kdERLY1Q0NGMxTTUxK1pQRnlZNGtiS0JYRWpM?=
 =?utf-8?B?MmNWeldENDZrd1ZWY0FCZ055bExiMTdIZlRpT3QzRFEvd2NRSE9lRStiZk5z?=
 =?utf-8?B?OXVrRENONTNzcTdZRUl6TTEzcDN0MjRhWFM0QXNEV0JndmdNNVM1STduVmRy?=
 =?utf-8?B?QzFKUHY1S2ttL0FkRUNNV1AxczZMNXdtOGx6dzczYW9YbCs5bUlDOE5IbWox?=
 =?utf-8?B?Snh4TUNqdzFETXZiSjUycmhIOXZIc1pNUm92Q0xaMGtpdHZESHNCR2ROZExh?=
 =?utf-8?B?UnlGVGZXR2QyaDN1N21HbzE3TjdRMnRpM3hZM0FBVVNaWWdWVk1iYms1YUNq?=
 =?utf-8?B?dTIwcU1mVlUrRGkyNEVoNXNTeUVJNDE5VGxHdTRnamRVMjgxWjNGbW45amhs?=
 =?utf-8?B?M3dwT1FRVURZQTQwbTRCZ2t1cThUM1VMelFVZGVCdzdUMUFhQWYxdmRuYUw4?=
 =?utf-8?B?MGZ5YTVZd3MydDJGclFDejA1ZU9MM0NudDhuSTE1Qi9rZ0JmNjJJOXp5dnhO?=
 =?utf-8?B?M2dleWh6UzZMUnRqY2pPMHAwMnhObzhnZlpLVXdPQkgzdUZlc09WUEtFbDZG?=
 =?utf-8?B?azUrRWloTCs2VVB5TUhyRUhDSmxRRUxoM0lvbERiN1pRWU5pckwzdnNuMTlJ?=
 =?utf-8?B?ZXo4NW13V214R01IWTdxcmRGL1ZmYXY5WC9LOWxwRkh1U3NBTXQ4djM3V2lT?=
 =?utf-8?B?U2ZUZE0reWFYWkhJdU1nbzhlR2VSZ1pFNE54emtiMyswNGE3T2poS2xIZStz?=
 =?utf-8?B?dC9DQnUrOTNDWDllQmR4SHFXZnMvdXI0V1pCSTBTZDQrVVd3aXFnTjQwRXdW?=
 =?utf-8?B?ZFk1VFRpU3VaWmxwZW5zK2t3bFVzN09OeWFWRjRhYTR2M1dWY1dNRkwxTmw3?=
 =?utf-8?B?ZmpFREgwTUtWYVRKS0lQQjJwQnNudnpHdCtqWnhPakdnU1I4d1lFZGRyTXpz?=
 =?utf-8?B?RGs4T3RWMnRvQkFYWCtvZ3k4NWg2b2gwbDZMTTBTeWh4ZEwxWkpTdjV1SUU2?=
 =?utf-8?B?dTA4S0JzejBkL2VreklEbTlWdVNQVy9VRU9zSzFRdFFiWUg1NzAxdTk1VXhm?=
 =?utf-8?B?dDBtUVVmNnlWYmh6WDZac29CNlRZbDJVNkNBbEQ2MTg2RS9aSGduSE5qS05n?=
 =?utf-8?B?eUd1OFdzM1Y2N3VQZ28ybC9lYWlWc0RVOGgwRE5xVlVoUTQyNnduamR0VUU4?=
 =?utf-8?B?ZmpJeEZsU2MvSkJlMnNYTERrS012SnY5RU9OdXlwK0U1NXg0Z1pFZmtqZHFQ?=
 =?utf-8?B?NDY1WWZZS05VUjFkVDU3TTY3TVFlYjhrTW5lYkVjWTYraTFTWjF0em93K0tS?=
 =?utf-8?B?bStkU0hmZ2ZKdy9sbVNjc2JkRzJ6TjlGZG10eTlidUJwbHhUZmROWG9MYjNE?=
 =?utf-8?B?c2NwWC9nbHZHZjVnUjZGenQyUjY4WEx2dHNqcVk4MFN3N3J0bThqVG9xa2lj?=
 =?utf-8?B?dWozVlk0UnVZOUNudWg3ZTFEb1JrdDdIYVRPN0dTalV2SWs3R2h3ZGtIcFo5?=
 =?utf-8?B?QXZxdmpnUFQ1WCt6U2RmS2lEem1hVmhVank2dWdQbjVIOG80c0FUVVpRWGhB?=
 =?utf-8?B?aC9ndFBSREVtNG4yTWtZQlA4MlpGRDh2Wjg2REJMK2RoRGtJRnI1Qm43V2VJ?=
 =?utf-8?Q?oOe0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850fc8a6-128e-42f9-210c-08dce94248d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 15:43:27.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYjven9yPa7mGUvNJFKArEpUXeSK3itqX55B7cDPgtUE9wy1Jm8LeafERcUioqeWqZMhEvM5YID052KLX6ULaw==
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

Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
Additional Changes:
- Remove mfd parent node at example.
- Ref to backlight's common.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
 .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
deleted file mode 100644
index ff5c921386502..0000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Zodiac Inflight Innovations RAVE Supervisory Processor Backlight Bindings
-
-RAVE SP backlight device is a "MFD cell" device corresponding to
-backlight functionality of RAVE Supervisory Processor. It is expected
-that its Device Tree node is specified as a child of the node
-corresponding to the parent RAVE SP device (as documented in
-Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
-
-Required properties:
-
-- compatible: Should be "zii,rave-sp-backlight"
-
-Example:
-
-	rave-sp {
-		compatible = "zii,rave-sp-rdu1";
-		current-speed = <38400>;
-
-		backlight {
-			compatible = "zii,rave-sp-backlight";
-		};
-	}
-
diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
new file mode 100644
index 0000000000000..ee93a3e64852a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/zii,rave-sp-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE Supervisory Processor Backlight
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  RAVE SP backlight device is a "MFD cell" device corresponding to
+  backlight functionality of RAVE Supervisory Processor. It is expected
+  that its Device Tree node is specified as a child of the node
+  corresponding to the parent RAVE SP device (as documented in
+  Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml)
+
+properties:
+  compatible:
+    const: zii,rave-sp-backlight
+
+required:
+  - compatible
+
+allOf:
+  - $ref: common.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    backlight {
+        compatible = "zii,rave-sp-backlight";
+    };
+

-- 
2.34.1

