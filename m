Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F4194FBD1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 04:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE5410E1F4;
	Tue, 13 Aug 2024 02:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ggfCc1dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093810E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 02:31:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDuWMrExQ+nNuHmbqkhZJjVQIdkBNgDUmyStGIQ8GPw+gvuuudbIUJZhw09w0/LxEF+HTd4VJ7aqpf4NSkUZ+8kC0iMtdTdJZOfxdaz5h9Bzo6SBsxlakhIw/2wBnQ55cfPWbK+d/SJdSIV721VDLFnDDWt4MKP+9A5azmsbXnDdR7fp4smbB+xiUnEDfV6i2vWmrqddRmgD66mdlIIyA2SZm6ECOeW4r78mLaf4r+SBU+C30mEN+hy4+CLKdBb3tr0+VQRU3Kwzl4oWmJ7S/3zyw0+iPW8LPAbZ0fvsYjD8QJyl84pN+Sfa27KVkAJEefKu1/nCLDpIIOY225+5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYaj27BcNAUZ2Xo9CyBvUHkvS6WQzLu0qLOIaKttPYs=;
 b=DnnyBNZh/ufhxxMXdUBEHNb0ac3bX48j37r1lesN31EuXizz2A3V0Se4Y0w6JHkxVngA2KFT4j5tXjTBBGrmYrVCHiKwPXE0xV8aqHNXByK0e0kOEs6h8aJxuIBex3OLhAmNqbnI0md5rHqbc/DitMNjVMNHiPQIPc/HcgOrllUYV7eDw4jmoDWGPW6ToJ/I4FsxcbMQaHjqf7xBJtRfUuBfP4k+NebPrmrOWAZB61gdInkAuAxcsZhEueVN3up1ZfVIOpGDXJlqQNEBxg8UZnun41zWTDEzzICqD1AivwAy+OL+L8+ILJtdA39eLUNOZhvEsHHpPZj06qRPRgmmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYaj27BcNAUZ2Xo9CyBvUHkvS6WQzLu0qLOIaKttPYs=;
 b=ggfCc1dwPOk3yvBRb0fNNJujVS/COjM9DlIOHLSIQz91ZQm9AlPMOdzOZ1MR4XSAc4RxwfXmR5lXV7OCD+VjiCfCywtyCtJHpf9enYVgYfouNA4TsWmF2SWLHDIsMuKwUwtiA99UzfUsAGyvasC6RWIoBLejbx5LBASym2gsHPyDXcZTCdlNXjmkUX/pVVYHmo7UcdU3aG2WvrMNA2sarmcpqVAX+SxI6yCQIKTtKqaKu7o0SaEmtG2JtH0F9xLDoYwjOnqy5fvVcRFV4ch+JvB7oCqIaQ8Dsgb8kge/2Nw0YBS2gtc5ZmFOoCC5yB0ELCNjka1GringwhZVMKXhGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10608.eurprd04.prod.outlook.com (2603:10a6:150:20e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 02:31:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 02:31:37 +0000
Message-ID: <143d7bcb-c3ee-4f9f-833c-6680a25681b2@nxp.com>
Date: Tue, 13 Aug 2024 10:32:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: display: panel-simple-lvds-dual-ports:
 use unevaluatedProperties
To: Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20240812193626.3826250-1-Frank.Li@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240812193626.3826250-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10608:EE_
X-MS-Office365-Filtering-Correlation-Id: 515a7cf7-4afd-49f2-67d5-08dcbb400e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE83M2RCdFJiWTg4bVpwZ0E5VGh6ZlUxbW5iS0F3L0lESVBURnNUbHlDQ1lt?=
 =?utf-8?B?QlNlU3JCRHM5WFljY1VXYnJ6elRPSmsrOEtTaDhybTdDQ0dtWnJNNldkbXFv?=
 =?utf-8?B?Z2FIV1ZwcG5PTUo1SERQcE9vNlpsUnU1akQzMURRTE52eXVXRVpLZHNxMWhX?=
 =?utf-8?B?VEJkeUZUdUM3OFJZOVlXV2ZDQ0NJRDdwNWJQUXQ1enYzc3F5MlUvNzVRZDNv?=
 =?utf-8?B?eS9TdDRWSGdJUEV6ZE54VG5MYTFJLzlNb1hERXlHSnllTnREU3ZpZjlnMm5K?=
 =?utf-8?B?eFlDVzZmb09sWXQ4TXFkWXM1WTBlQlM3eGJTK1Bjc2ljOVNBS3lLYTlsL201?=
 =?utf-8?B?cDAxMFhFcFllS2ZSR1J0KzNmanp6anFselBnYmVqSWdwNWFUUFJUek1Lb1hF?=
 =?utf-8?B?WVBRZ29Yd01nbkVhc1owTjFMT2Z2cW1GeUxIQjJ5YWoySUkzbUFoV3B4RlIy?=
 =?utf-8?B?T3h0bG12N0syU2tnVmFEZWpyYWZvM1g1U2s4STNNbDdhQkNPYWRtN1dkcjZm?=
 =?utf-8?B?STlNdDRyS21PTWJuSWdHNUtsUzhOVzUzV01ZOEFOT20wMHYxRndPR0xhY3NM?=
 =?utf-8?B?dE1FTG0zc05yOGs4SS82MmxOeTZpUnpaeGowQ295OUtsZUpKMmUzcEF5MjlU?=
 =?utf-8?B?Zkdxa3hpbWR5TGFCUW5ZNzlCV2xTNWE1TzBJWGUwNGc4VjRoZGlSVTdZYkJw?=
 =?utf-8?B?YWIvZ2pDcGNKUGorOVRaTEE4QzVHSnZaMzRqeElkWnlzbGNkbnBiZWRJSllC?=
 =?utf-8?B?MlF5L3BHZnNHcExWRDN5Ykg4NWtIL3VMQmRtVXRXd3lHd2I2SmN2d3pna3gz?=
 =?utf-8?B?TGVSaEg3SWVCVld4dUx6MmJ2Q2hNdUFNRHkxazgwMGw5dGplTVQxTzJ5R0Qy?=
 =?utf-8?B?Nit6L2ExWGszNU1xNVQ3Z2Q5WUhJUUdSVjZmN1JaUTVXa0gwMU9VRnh4UzEy?=
 =?utf-8?B?aCtod3hYeW9Wb3FhQ1Rlb1E3dHd4REJTb09JVGh6eDZlSm15UVVFWEdaV2FK?=
 =?utf-8?B?c3Y3c0FFY0lnaHN2dDJRUFVMRUZEMDkySC9GTzk3MzN2Nkh0U0pQYkM1SWp2?=
 =?utf-8?B?ZU1MQ0lCb2NMRE1ZbWRxQklQSm9tRDY1Q0tnNExZY2NVNmtSZE5Pa3R6eU40?=
 =?utf-8?B?OTFlYjJTMGpZYWE3NU52MjRMa1lBWWpXaHMwU3dDOHg2RUdBMXcwUDY1bnpt?=
 =?utf-8?B?WVBKUlRsTjBhWTJVVXZ4UE9EUlR2TnhkbCs3cXpGbVhERHRVTnBWRHVhWW80?=
 =?utf-8?B?cGNmWXphR01QUThYTTIwVWpueFhiengwdWJJVFEvZFJXQVBORFhXTGFTUEky?=
 =?utf-8?B?a0ZrbFAyQTNNQmNBdXdCWGZKSGxHZ1VESFJZeDFxVGY3UGlJSjBTV3M3Z1Jz?=
 =?utf-8?B?MzZDb2E2TU5YcGwvRDhaWDJ5bjdZQ0trRTlEYk5JVmUvbENValdGbWI2YjNZ?=
 =?utf-8?B?OHM5b0JHY2dNTDY3TlZSc1h3Yis1T1VuZ2VCT1Vpd2tNQjVIZU9jVUVVQ3g3?=
 =?utf-8?B?ZUxScUxaUTVkZERwUnJEZEs4VmtnWnAyNTR4d3dKTWRMRHZia3I1ZXpaWkJl?=
 =?utf-8?B?aGljY25YYzhoYm9VMjdYZ1VrUjBaYlJzZzY1OXNHNmt0WjZJQm1JTVdkZ1ZH?=
 =?utf-8?B?b1pCK1dwTmRwd3h2cmgzMnRLMUQ2YW5OWkxiZnNnODByc0ZxWU10amFFYXRE?=
 =?utf-8?B?aEFHLzE2SXZZK25NS0pSUXJ3bklZVXdtZ0VaVXZiMm9ZZEwwL2VHUys4NEJq?=
 =?utf-8?B?c0YxbmVzdkZnQzRWWUY3clY2MitOcTV4bC80L3FLdFZQWXBzQmZwckpDTWxn?=
 =?utf-8?B?S2ZBVktjNXRJV1c3ZG5KZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amI1Q2hhYXBmdGNxVmlBR3dkU1JjQTdhbnVJc2NUNCs3aHNYaXdvVVdiRHBa?=
 =?utf-8?B?YjJOM3ZOOXVTRzQyMGYzV3Z0bmlzNzU0dk5ONGdxK29XbW95RWtVSURJRXFh?=
 =?utf-8?B?Vm5aTXQzbDg3alViMnZxb09uT3BQU1o5TDJZMGdNZGlPNUF4TzZSMERTSldS?=
 =?utf-8?B?ME9QMWVuSHlLbWc2QmExUTRJbXRUVElkaGVBNjlScy9PSklMWm8xUElUQVNa?=
 =?utf-8?B?eGwwY1I3N0pORUFsNk9BRWJPMnZRZUlSVnBGWnNwc0lVdS81WEtBTGZmcmt3?=
 =?utf-8?B?Z1lTWExPbDNMT3NON2YzdVhGS1ByeSsxTFdITitJRzRWdjlXVFBMQmlERmZX?=
 =?utf-8?B?eFRqcnhnNm9FN2lkWkJqblRvZkpobjNINHdWSkFRNUpBWkpaUGRrdFdTMlFh?=
 =?utf-8?B?QlhpSmZZYWxIUGh1NGY0TTk0YnhFWStRTmNJQlNiQzY3T3hnY1J1K2FGQlAr?=
 =?utf-8?B?aW1VMDNaamJYN25QQjdxQWE3b1prT3IrNEtWRUZXdVlUTGt0YiszNi9Sc05H?=
 =?utf-8?B?Z25UbWVXWG5sczJsTmNZclBaMXo5aFhVZXVmRGFtNnVOUEhSL3AzMlFiT3Vi?=
 =?utf-8?B?c21NdWNIZmNkVFFubmUzRHliQVUwNldmRTJDcVZhMVZHVlBIUktFY2Ria0FV?=
 =?utf-8?B?MG5Zb3R3MGVDa1ROd0dwd2hkeGtrYXZMcytVWUFOSGI2eFQrQWsva04vMVVH?=
 =?utf-8?B?N2JDY3JkUEhJTVhXZ1VvRmFuWmZCS3lwaUpaY0J4UTl2WGxuZGZrd3Z5VmF4?=
 =?utf-8?B?WHhJb3YzcTFrUXI3K0ZoM0tySFdVUlc4S3Z0QXFxRmZEU21GSXFYV2lzeW0r?=
 =?utf-8?B?WGdHMHNJVXBvampNdlQyVVNGeklGZVdkTUFlQTBCa1lXa1ZzN1UydE13T3dz?=
 =?utf-8?B?aTI0cFpVZmpyajNiWWszaXltUExlOUJiZ21TSXg3anY0UGQ5T0p2d0xRUUVj?=
 =?utf-8?B?eDdwQ3llQk1lY2g3MTIwL0ZlV0dqNUZWcmRKazdqay9FbFd4RlJIcitlZXNh?=
 =?utf-8?B?OEZGU1Myck9MaURhbVlRM3QrY2dOM1Y1MTVzRmNtMWFIZmE1Y2VIUk1zcXls?=
 =?utf-8?B?WFpxeW1ZWXBsaUpJem03WW96Nm5lakRDS2pYRXBYRXRXZ0R2S1FhN2pBc3dX?=
 =?utf-8?B?VHByN0RhVGJJMVhPdWtSQzQwMzdPV2g3VDQwRmtwZndXUjVtaHpJMVZBbHlB?=
 =?utf-8?B?R0FYRzF1VDgzWkZCZkRILzdvNDU3Kzl1dTcvVk9aSHlHeFM5Q1hneDNWd3J6?=
 =?utf-8?B?Z28zV2dKSmNBZ1hpQTZMTDBwRThaeGpRL1J3V2tCYkVPMFlrSUtPWVVUZzMy?=
 =?utf-8?B?LzI3VFZMby8vVmpSZEZzN0ROWC93QTJ0SEZGUE8xY0NBeXZtZTdXOFdRcXp1?=
 =?utf-8?B?a3R1THpRNGlkV21WNDVhSmxTWmRDalBMQ2VPbklQYVhPUGxyQlFiWWFrL2hx?=
 =?utf-8?B?cklUSHVKRVdicFA1YktnVUxWVVJLU1ZYM2xNTVpOd1dMUTI1WVJRcUNjbnVy?=
 =?utf-8?B?dVZMckZZMXVpZnViYmJmbGhLdUdtK05LMEpqWlpOZkcwZmw1cnNCcTZBblhP?=
 =?utf-8?B?Uk1LWkxaMFFtaEFNZnNFTHEzcGFYWFBuTXEzQm9rL1d3SWdyejZiZUxLcjlu?=
 =?utf-8?B?UUxWY2hNQXVUQUY4eUhxbGh4L29CT1FDU3N2bGpQOFZZMW9WcDNQQUZyME0r?=
 =?utf-8?B?R2dFc3creG12ell3SFlKSjJMZG1OUXMrYlpwanU4UjJ6Q0I5OHVRUDVQTFVr?=
 =?utf-8?B?aW1FenRwNWV3NkV4dy9CdFR1MHIyelBKMG94c2U5cDdSaFhia0Y5VHNKZFFh?=
 =?utf-8?B?ZjlHZTl5SXNiQU9xZU02cXFSRmtHclByWXNEeGYySytnNm5EUitSeWpGTVpK?=
 =?utf-8?B?M3BQTmkwK1FzNUhmcUluMkNxZWZ5bmVrVHIyMnIwbkZxeHhoMzk5OS9pZGJ5?=
 =?utf-8?B?VzVFYVJLTW5LZFpZOW4wTmVzZzNnQlArY2pXL05BMlptd3BaR1JCb3V1RVdK?=
 =?utf-8?B?bVU5WWFzajZ1OEJZM3A4RDBvWmd2VUhtYlRmbkw0dUhIRXFJeVFkMmIxbEhs?=
 =?utf-8?B?UlZNUVU1RlFMVXRGZjZrZEY0a2x5c1dOZnZYTDBHZ1FndEp3UVpoYk4wUWc2?=
 =?utf-8?Q?3vQr4cR2pT8HSDFRZM8Et5lL+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515a7cf7-4afd-49f2-67d5-08dcbb400e6e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 02:31:37.5682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpDkGJcr0Fa0gOVTHIu4BG886hVURcQ9oGwh8bE+M3g1WKatjBqIpNH4F3T737GJounwnx7hCabbnOT7cJxyAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10608
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

On 08/13/2024, Frank Li wrote:
> Replace additionalProperties with unevaluatedProperties because it ref to
> panel-common.yaml.

This would allow all properties in panel-common.yaml, which is not expected.
Isn't adding 'panel-timing: true' next to 'enable-gpios: true' enough?

> 
> Remove properties (backlight, enable-gpios and power-supply), which defined
> in panel-common.yaml.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: panel-lvds: 'panel-timing' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../display/panel/panel-simple-lvds-dual-ports.yaml         | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> index e78160d1aa24c..10ed4b57232b9 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> @@ -84,11 +84,7 @@ properties:
>        - port@0
>        - port@1
>  
> -  backlight: true
> -  enable-gpios: true
> -  power-supply: true
> -
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  required:
>    - compatible

-- 
Regards,
Liu Ying

