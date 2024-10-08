Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164309959A2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 00:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718B810E18B;
	Tue,  8 Oct 2024 22:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="awiUd90s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D810C10E18B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 22:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnhN6Q8BS3uyOeXjqxYrcjpn7dx3SGXAf33b2E0IAsXCVh2Xu2wsp/UKrtQcNcXdoSLGCggSNXutHQyu14qUk47WNspv/GeAuzsd7+nf3CbKUmFU9MGWy2fkjNM/1E0rsxcqof3kdVzobYDRrVO4uL6QVfk0ijCpuDJm7Mh11jHGupQntulIOlRKP41qUgDWcVIk6OElb0OXUzhQH8EsjxNSAIAEy6Xn0dfhfxl2+32FK6GSwBMm0KIgT/0pjAL/NHzozl8HEB8hyRXo0A3S1gDWSqfMX99U7FuDV3i0OgMO6Jng/tSvzEyL6hVf+N6532pfTqBS92td6st3HIo1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2odmee2S+ox8BT/ZTjQt5ajl2EZBBKW2iYWwVyGNGg=;
 b=HgweEbEBwZsEOqcuU1fGAT1CPC2QjZiafSyK9sWgwEkBmhzEIqoewomfC7rrGzmB2FVSMLPcIjfUOeqDPFLt4OFir9KCSFjavbMNjlTOydvHdBZvuHrer7C2uSMuBrbylluuSi5+i2rRjUxKHZLZBx88KJbD7e/f4ZWJE57/ShwLTYOju1OWRH0jEcWK6pCDYdku0gpEGe8Rt+kS7koK6/HmYIdH67c3AHf0SH6vnpZQrQzqMCkcky822pjp+42A7/P0Cc4DQyFpXSHAUA4gPkqKON2iDBH5IB3w4Dpq08GBFa31m/dVSReAiolLy5I2QsZfrpm5KT6+x6euOY+sKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2odmee2S+ox8BT/ZTjQt5ajl2EZBBKW2iYWwVyGNGg=;
 b=awiUd90sLxyTGEyYCnUM1UYwYkVqyTJizicIR6vfgTO1w94TX+NtNP1tHhlyMUwkgwOGvTMKtGTrXQE3V1/mXJV+gr4ekFDrGAeGBnp+9vUAufx5lIv6PQk+Q7bKYvCGfkpNpJtjb3cFhqO7VIvXXZyTpCHhsp1JXgVnlP5a68ZzXv0ptSnnm6DaP6Y6Y67pqfs+AVuCWGHbnfG/hy9cxnMdsHbRDbw8ThJddOoDMVYeYUO9cHgVFiMObT1GHF+oVAmRV48Zj8CsJM2lWkLWDmtczpuspJk5a/EhbS/akAErsPr94VBgbNXGypDH9luHCK0S+fmzdXA4AJUihF1CWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9667.eurprd04.prod.outlook.com (2603:10a6:102:242::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 22:01:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 22:01:37 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Oct 2024 18:00:59 -0400
Subject: [PATCH 3/5] dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to
 yaml format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-zii_yaml-v1-3-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
In-Reply-To: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728424880; l=3603;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Fp0UvGpveRY4bFlNFYximIwtARutC4Lw3e7oWFnlL7Y=;
 b=5t3LDPqln8jHdXCOcNtdGw3me2q1/jr30++l3N9be4M0T35tAA7P9m2fhz9ICOE7CPX4lwvAE
 aa9phNo7jzCA/3HK2sAuZdVUEXxgFJG0MxoJSZC7XMQfKa09L/xy7hc
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: e92fca82-ccbd-4c7c-6f41-08dce7e4c7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjRhREdCQVJXZVNmVmQrN2N4S29KMXNqaG9FSmR0U240OUdpS2lJQjFLaExV?=
 =?utf-8?B?dkcwZDdEaVhoNWNObERRU1FtUWcyNXZBTUVhaEwveUZsZ0lleXlqQXhtRUJN?=
 =?utf-8?B?QTd4VlUrZXRTeVRZUkg3cGNRVGUzYUp0V2NVbktaSm4rdTB1RUVxSFV4U0pp?=
 =?utf-8?B?M3VkdzdvUDR5YTNiejN4OGtSVkZKTmRBSy9Od05DbnNsdDBmRHpiTFZZNWpw?=
 =?utf-8?B?UGtwaEEzNUJVOHFxS3M5R284ZmYwRGlJd1hDTHNwSUZDcTFRWHlhdjh1ejJy?=
 =?utf-8?B?aSszVWJETDN0SEJGem16YlVmQ1ROYUYyenFNYjZGd3E3bU5NaHA5MHlSNGJJ?=
 =?utf-8?B?NTljUkh0Zm1DejJNQmVvTmluRkEzMWVRVjQxRSt6Tzg3c2Q0c2pnenF6a0pY?=
 =?utf-8?B?OURPZDVDNThBRWRtZDBkbG1mL0FlMFVMb2NKRnkwNUhmSHhIQ2s2SmprdFlK?=
 =?utf-8?B?Rk9Xa1h3MDZ0YUkrTnlua2I2eHpHdU85a3d2TURpUmxiRkNlRTdHYk5tQ25i?=
 =?utf-8?B?c1lLK2o0UHkxOWd4ZWRHUUtVbjJycmJKNjVqeE1IWmEzODBxdTB6K2RORENH?=
 =?utf-8?B?VnZxOGM5ZU9kcGxhZFYvYkJtaG5VdXNSaTB0YkpiTzA4TG8xR0dDS3M2bFpQ?=
 =?utf-8?B?Z3NpejZGMy9YMXFWSHZ6dTZPTThyWnZMKzNYZlFubG1vcTNWbUNaQ1NtelNR?=
 =?utf-8?B?N2dzWktySVpRTjRvRjhSY3FQVGgrczlOK0VCd3JUSklCeXJtb0lXOWE3L1lT?=
 =?utf-8?B?SlR1aFR5LzlqNnN6TzZjTmdIcXBmZndFUFYzdUc4MlN6TSs5cUtCOWZuL3VV?=
 =?utf-8?B?U2E0Tlc4ZEVkeXEzY3Q2V0VXTUJZMjYzeGZVTFpHTlpoYy94c0tBeHRTdlVy?=
 =?utf-8?B?cmQzeEtwTFBmdEVHdXMzSHluM0RHWUVpOTREcU1FNWlFd3UrSFNLQ3NwaXBh?=
 =?utf-8?B?YWxzUDlxRTJ2eU81cmhlOE1HaEtlYnlEWkVrVmhSR1laR3VmRGNBNkoxbGRh?=
 =?utf-8?B?T0lLYWp5d3ZzYktZd2laYTBPRWliYTREM3EwZXBEMGd3WENkMVZKN3VmNnJN?=
 =?utf-8?B?b3lMbVpSZjlLSy9VbitKZlo5Mjc4eEZxVXFodnJrMlArR0l4cFJPZFptZG5a?=
 =?utf-8?B?WnJsWDkvVDFEclpBZGlMSWRyR1ZlNDZ2Z21DSVlwNTJhdHR1Q01TWGxlL0V6?=
 =?utf-8?B?bVVhOTQ1cWk1YXdkNTdBc2NtR0RWYjMzM0RsdWhaV1l6UVlEcG9yam9OVUdJ?=
 =?utf-8?B?bjNBdHVHSTAwamFGLzIvRUJ1RXpBQm15dzFNRk9MNjRiTmpibnA3SUl0N0lX?=
 =?utf-8?B?aGRUYWZPcWs1WlRsRTV4MGNSWkludng5ZS9wOU5YYjdvUzMzeUd0ekNLL1lk?=
 =?utf-8?B?QWc5amcwZTFUb3pTZ2M2eGFUSVA4TStaZFVFZEhDVUo5Q3hpMm83TUsxWWUr?=
 =?utf-8?B?STZaT0RaYWpOQi90blhtUWNIVTNnazRzZGdMOXZLb056NXFLaHViSlQya2NR?=
 =?utf-8?B?ZXdHdGFzQTkzN2QvZDRjRjgrVzg4dGxtWkxpSEJSY25CZDFibm8yY2RNeGw1?=
 =?utf-8?B?NXY4OUMwQ2hhWDUrdTVLSFpxNGxkYkpvaldNaXppSnlkc3prSHVXeVNqekE2?=
 =?utf-8?B?REVzQUpValROM2d1Si9WYVFqSUxIbERDK0xleE1QVE9mMEpoeWZYNGpYeGRy?=
 =?utf-8?B?OUloU0dBVWQrYkFvcFdic0FhVThhbG1yVm91aEdQUDhjZ3Q2NHhQWnoyZzZh?=
 =?utf-8?B?Q2swdEZ1eVRrVnBYcXg2bzJhUXRzNklVK3FGa3ptV0dGanpzUWF4aVM2RVo4?=
 =?utf-8?Q?JmKQxeUgO9wJUehoI7uj2XDXmK0C1bT+siEHw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0p3cTdTRitURTVjeXo2bVNZdkdCeUZLcXVRY0hIeXYwYUE4UTN5UGpQZWNj?=
 =?utf-8?B?TG1FNzNldVlQcnlXVHMwT2phZW4rVndIYkNLT0lDaTVxbGk1RU9yNWw5dDla?=
 =?utf-8?B?QmpUZCtLNjRRNWc1bW1sOFQzTS84NHZBN0xGb3RvY09GTlRnVisweDNXSUJM?=
 =?utf-8?B?clpmbmJYNUdvR3FLazhiTW1sRk5pLzlLMXpVMTdOSmVTYnRscFNwMDAvQjE3?=
 =?utf-8?B?OEEybTdGRG1nT0M2bUN2UU9MUlVXTGNmN2FyTEp6ZHJYMGZpV05XS2hXUUJh?=
 =?utf-8?B?bVdSSEg5WWIwQjNZQlJsazh3SUEyc0Iwb1hoTGhRZmw3TXZCQWtQNEZnY2tY?=
 =?utf-8?B?RWVwY0daK3pXMFBTQzF0UE9QZTA3bGJTc1Y1Q2lHZ3NZYjVNQm1RUnBON0V2?=
 =?utf-8?B?NXBZaFU4ZWlIL0xCZzcySU50UENVdnFua2J4NEc3UEZqOUdYdVdRNFd0NkZB?=
 =?utf-8?B?NDZxQ284TE5sL3B2SFp0djZhTXh0Y3g2ZHVNVmxTWHNBUlh6bTB2S1l2eXA0?=
 =?utf-8?B?RGtUR01YSWN4MFl0em1JOWt0ZXlBWHlEOWpWeXh6dWJ6SUpQVGx1Z2h6RW1Y?=
 =?utf-8?B?bjdTWU9YQ0VNbFE1WTdFZzQ3YjJEcHpsU216Q3RIK0d0MmQwY0dvY2luZENq?=
 =?utf-8?B?eWwySFBTRW05ek5DRFg2NUp3ODRhc2NENTMwOHRyQUZuZ2lvZEhhblVMSHdH?=
 =?utf-8?B?ejZLKzFKR3U4VS9zQ3h0S0V3ZlhjTk5aTFBYelN0Zm9xOGFReHZaOCtLcFRF?=
 =?utf-8?B?YWZyMVh0M1dwRWtNTzMyQng3T0kzT09Fai9MRDJ5ZW9LZ1o4YW1Kc0Q3aFk3?=
 =?utf-8?B?UnlTaE5qYmhRK3Jsdit6bkhNc09qQ2hSTzg4ZldUcHloeEdJM1JOYkd6SUdZ?=
 =?utf-8?B?STM3SHNkaTNlT0NvMDdFc0I5WklRMDBuSi81dGZJSGlMQy8raUJ0UmxweFVH?=
 =?utf-8?B?UUlaNHN0V3doZEFYSEgrdEVXaXNIVDliNkJlcGtSeUsxL0R5ajdidkdVN1VH?=
 =?utf-8?B?Q0Z6bHM2elA5dHVlY1JDZXFlUUg4bWVSd1BXMllhMlA1OVIvd3BtS1MvNVpn?=
 =?utf-8?B?cnhtM1l4RVBlaVltdFlFS2dUN01Ub0pnU3RkYkN6aTk1YmI5YWloVDNUMXoz?=
 =?utf-8?B?eU1TcThmM2UvaFErSEdkK2NBbEZ2TUdjY0I5Wmp2S0pSTlBacjFLY2FjUW1h?=
 =?utf-8?B?WldDQ3ZSaWFvcVM3UGxQd3VvcC9XRjY3c1E3WWtxQVM4ZFRvbGFxMzk2bkNT?=
 =?utf-8?B?MXd2eFRFdER6VGdEVkw3RExjSU0zTlZ1L3VHREtUaWFJWWg5QjlNMjZ0azUx?=
 =?utf-8?B?bHpBZTBycVZJS2I3Nm42UUwwUnJjZE42VDd4dU9BM1Z4d1RJQ3VscE82blph?=
 =?utf-8?B?cXFoTUF5UVBqMEVxd2VmMm1oLzl2dWJHM2Q3TktuMG1IUUwxeXAvZ3JFd1NT?=
 =?utf-8?B?dEhuM05wQ0ZDYVhUenlaSCtMdml0M01SS3RjRWk3NHRqUzV2aHk2Ykt3dmFl?=
 =?utf-8?B?dlUxVG9mNFU1Y1hJRTV1MHJORUxBQVJvbmFVWlRyTExFcUtaR0RZSHVGSVh2?=
 =?utf-8?B?T3IrWVk3c0ZaQjBrRzJVaEgyN2xTc0ZiSFNyRjQ5RFFvUFZjVjVZYzJNNmNl?=
 =?utf-8?B?WGMvNHY5ZTkvRWtQUmJ2ckpXTngxMjVnUEVXa09GVWVHbEwrNXI2QVovdDI5?=
 =?utf-8?B?Nkp2YmxFTElpQTBVT2dPOHpJQTMvOUxnSnkzZDNWRUNiTGZEL1hTV2ZrMXB4?=
 =?utf-8?B?ajAwVmJRaHJTeTFiRGxGbjN4Z1JXSjNvV0FxRmhMUnNzWHpuOWRrZTRKYnJR?=
 =?utf-8?B?WnI5Q2hNa25BUGJEZm44Y29xMXUxK0RjQ2lyNTZRRVk4aXk5YnRObmhubmVu?=
 =?utf-8?B?dFlieEVQQVA3K3F0Nk5ZNEE1YVdzYTRXbE44MTZpRjYwOVhSeUZJT253b2Rx?=
 =?utf-8?B?WVVVT3licDNZTFduaHhSZDNiVDNQbXFjdG1aNVNtUEsydjYyVm8yUXYrWW5l?=
 =?utf-8?B?YWJSYnNjYUxMNHExS044bTY0clkxU0VCUTl0d0trNTl5cFRZTE11MjlLZldx?=
 =?utf-8?B?eThra0FpUGlaaXc3RElkK0dyMmRnN3ExMSs1aDNOSGl0a0Q4RXg4VzM0Z2h3?=
 =?utf-8?Q?fRmo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92fca82-ccbd-4c7c-6f41-08dce7e4c7fa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 22:01:37.4255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zE1yogB8BBnpvNcvd3jyP+DCdaLVDhqUYh7S4UJHf/W0OciWHt4G+wNYxrCLpaHRusGvFkLyRs2M4xQ77pTQvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9667
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

Convert device tree binding doc zii,rave-sp-eeprom.txt to yaml format.
Additional changes:
- Add ref to nvme.yaml.
- Add reg property.
- Remove mfd at example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 40 ----------------
 .../bindings/nvmem/zii,rave-sp-eeprom.yaml         | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
deleted file mode 100644
index 0df79d9e07ec2..0000000000000
--- a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Zodiac Inflight Innovations RAVE EEPROM Bindings
-
-RAVE SP EEPROM device is a "MFD cell" device exposing physical EEPROM
-attached to RAVE Supervisory Processor. It is expected that its Device
-Tree node is specified as a child of the node corresponding to the
-parent RAVE SP device (as documented in
-Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
-
-Required properties:
-
-- compatible: Should be "zii,rave-sp-eeprom"
-
-Optional properties:
-
-- zii,eeprom-name: Unique EEPROM identifier describing its function in the
-  system. Will be used as created NVMEM deivce's name.
-
-Data cells:
-
-Data cells are child nodes of eerpom node, bindings for which are
-documented in Documentation/devicetree/bindings/nvmem/nvmem.txt
-
-Example:
-
-	rave-sp {
-		compatible = "zii,rave-sp-rdu1";
-		current-speed = <38400>;
-
-		eeprom@a4 {
-			compatible = "zii,rave-sp-eeprom";
-			reg = <0xa4 0x4000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			zii,eeprom-name = "main-eeprom";
-
-			wdt_timeout: wdt-timeout@81 {
-				reg = <0x81 2>;
-			};
-		};
-	}
diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
new file mode 100644
index 0000000000000..3ae26f1cf7acc
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/zii,rave-sp-eeprom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE EEPROM
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  RAVE SP EEPROM device is a "MFD cell" device exposing physical EEPROM
+  attached to RAVE Supervisory Processor. It is expected that its Device
+  Tree node is specified as a child of the node corresponding to the
+  parent RAVE SP device (as documented in
+  Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml)
+
+properties:
+  compatible:
+    const: zii,rave-sp-eeprom
+
+  reg:
+    maxItems: 1
+
+  zii,eeprom-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Unique EEPROM identifier describing its function in the
+      system. Will be used as created NVMEM deivce's name.
+
+required:
+  - compatible
+
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    eeprom@a4 {
+        compatible = "zii,rave-sp-eeprom";
+        reg = <0xa4 0x4000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        zii,eeprom-name = "main-eeprom";
+
+        wdt-timeout@81 {
+            reg = <0x81 2>;
+        };
+    };
+

-- 
2.34.1

