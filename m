Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699889959A8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 00:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C5C10E5F7;
	Tue,  8 Oct 2024 22:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eDznqeb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAD010E5FB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 22:01:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXeNMBwr4h263YKZzjqA0eitDEwnkfq0QBWLYU7BRAaaW5xPrIQ27yuLh71KS40pElykITK8Oq+nVk0TuwMvGpos7f1nkR0ya30ukmz7iGLqYSlaK9cyqjudqRoEMGjKl3c25w4bV6AsDCJqIHpwM+3qYJeFRz/xEIDdrmIJbw6PBZRb7TVWrAoROx2F2n+1GTuaBFzsz+0+yBf15+quSHMQ2g4L04FOXf2by/XkoW+6Qnub/S93Qjnau5Ym6ZtjiC+vpt/Zc1hFSdj0Ccr2yVLEjfP54foxXFeAaw5n8VR7JFzML5o30+3C5f/+tLAXNsTnnlovlwy5vG0ay0+0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5yBaguEH7/lRAPP2avNlNp0tYwa0TnmzDd43PItTlY=;
 b=Qrc3dUEnZy6cblpXUTlHDGYZjKL0tMemV3q7+6PyJyB0W7oqJ/bM5wRMcdAWUIV8ALe7tB3RKffnW6UaNiaudbPgs+E0uAwM3ZCyqMKLxqt/rrl7hJc6IfVX2U9T7ALCUJ91B45+sRvW4+HGNiNLTTDgUGmoiCWtvmngfJyPMIV6TxGHXrmHPID7o/LWr86j/8BCihyLEYp1h0wsazU207WfQvi1HkjN81EtBftvPMc/lHBhkfIEtTFyGznRawhsok1q1g7B3pFtuEJBDw/Za7VbQ0Xl1mecAhlTcYkIREaRsDxu5FomiDkKVDkJcuIzNLPBhOcyGXl+54u5COwuuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5yBaguEH7/lRAPP2avNlNp0tYwa0TnmzDd43PItTlY=;
 b=eDznqeb5BK3S6lj+uJ7SDjlyiP9kwKeCmcsDCjNXD1514fQn1cUAmKxon+WDD/yK6iNzv7R0N5Hk0kA8ACcUYUoaIluu0iysUsZeyIkATi+iMcGquIQbNsrypqx38+XW2T4eMTvWt2+zbFXfembdFOnonszHqk1EObZaUYphSMfRPM/PT8Tfo+R2r4BGg9YXj1CEuc1osL/Lg9k2JYrFD5EkxqzcdzEZWiAmZjyCfU5B5EVFG7vlbmrGxNMm3zeDJ/SETSIdDEg02NjjkAgbKMi9AALkGBkEDMO6lhndCtADNIxrNZ9lU051X4mw6YCp+yiKFJQzQjPiYCtcZpq8/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9667.eurprd04.prod.outlook.com (2603:10a6:102:242::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 22:01:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 22:01:45 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Oct 2024 18:01:01 -0400
Subject: [PATCH 5/5] dt-bindings: mfd: convert zii,rave-sp.txt to yaml format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-zii_yaml-v1-5-d06ba7e26225@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728424880; l=3530;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=QgZ4qpuBe2Iuf+86t5wdsnelCC4x9/FyyKlFxjiYoLE=;
 b=bk/JeKDHfiCpfG42dW2bKh/kBUGEYKcZyrwAxs+LLP0pCcMyRtGw63oPIC+7jhUnzbi2nsOpj
 SQE/mzmTycPBwC3ki0FLDtDedD6xxEzX5KgF9dkaViYjKNF/0WxKimN
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: b859641a-159b-4e27-fc0b-08dce7e4ccff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmR0MkZtckw4UEdHYXVYdjJVVUFjTHhnVlVINWZUZ25sdFJuaUlNUWRWeklw?=
 =?utf-8?B?SmFPN0FRYlZUajM5SERIb3Frb21KRWhoWkVLNjgzUXdJZFRwdDU2NlZpQWFI?=
 =?utf-8?B?R0k5WWFtL0N4MVJYa1JIYU1yaVphVHA4S09JQS84TXRoY0RHczZJN0NqekYv?=
 =?utf-8?B?UG5sNDFkZ3ZNYjRNZmlOc0M5YUk5RUljLzJlOUUxdmlEZndCTjlkTmV0anN6?=
 =?utf-8?B?blo4VTJncW5NaGxUYmM0WU12U01ReWdtT2Z0N3M4alhaMU9sZlpRU3ZHelNI?=
 =?utf-8?B?U2xXUXdZcHJBL1pBVCtEMC9rc0hiSk9aSXNBaWIxeVMrc0hGMDNqeE5KOStJ?=
 =?utf-8?B?ZGZtdDBEczJ4VlBhY0Z3VFRWbVZ2cVcwZ3Y0dkY0VHd4U2tvanQxOVFPNHNu?=
 =?utf-8?B?WkNVRS80K3NrYzRPR0dQZnZuWjd5VUZnTmZ0MGlUTnlZUVNGMmtpbEZYaWI2?=
 =?utf-8?B?YVl5Vy82TkUvTWJTL25meFVRNHZZd2kwNGFGbnEwMFhVYjVtSnlHYy9zbEV2?=
 =?utf-8?B?amRBV0ZsOFhRdDl4YkhIV3hvSkxGMmVPcndJbHNDTzNpODlDc0ltREgwdHgv?=
 =?utf-8?B?Rm41SnJUMzVYT1E2TmRXaDV6cDhjNjJGMStMWFU2TGExanN0T2NTd0J5TEZS?=
 =?utf-8?B?a2VMSlp5TkljaWFveXNPSjVlaGdUcWM1dDBoQkhtUGo5Q2FjOUVpbFNzZGZO?=
 =?utf-8?B?NjlXaDZiOEJxSFpseWxzU2pUeCticXRqL011Z1E3YWQ0N3l0aUJKQ1A1aGdy?=
 =?utf-8?B?TkhxWGFzYWlMMlBJUmw2bElBc2UxK1JtUkNtVVpIdi9oNmcyaVFpcERKTTFv?=
 =?utf-8?B?TXRuK1lPSG5JdFE4aHQwdnBndnpVVCtNUzRDZm81ek5NVklHdllmZUwxc3Fn?=
 =?utf-8?B?dXJKWmlUcCs3enhldC9vRm5jdGdwYmRiOUh3U2k5QklSTitzY29FcFRva1pj?=
 =?utf-8?B?UmhmWmtvZlhCanBFQlNNYmxueENEdXVjQm1LRmtsbmtPbWhvTi9mK01aOHM4?=
 =?utf-8?B?M3VuU3hGVk43OW4ySktKVzNRUloweTBQMmlGZUdmWmVBTG9FTFRGYzVKSlBF?=
 =?utf-8?B?d2FxQnZVbU9obllSN1A4bTd1b01Zd3ZPUFUxcmtTVXJDQzVIclFEeThkUUtE?=
 =?utf-8?B?c3RNZkh5c1pqdUpzQ0hyTGl4UStJOEY5SXpOK0RLeVZYL1F4bDllTEpXZ1pD?=
 =?utf-8?B?TjBaWkc3TXJCRG5ZS2dkQnFZYjNjU252bVFPR1NsTkNoQkprZjh5MVgvSW5y?=
 =?utf-8?B?SHlneWFXZDJGV1ZzVzc5WVk5YzdmRTFjZ0FzNEUzY2RoRGJ4djhFWTlIN3Jy?=
 =?utf-8?B?NDlYNWRNTEVVbkR3REJISXFCWnJZOCtNVStpclZ4b0hmZ0tVaG93RWd3VnVt?=
 =?utf-8?B?blNXeFdoWUE3L2JDL2pWdUVYbUZkQnJpSTIxUVJYTUdna1V0RnByaFBYd1Y4?=
 =?utf-8?B?djBlNG9MaUhwc25RN3I1S3pxNGx5YkpMRHBTNHFIeWlzMU84RDBwK1pGNFVx?=
 =?utf-8?B?aHNvcjVzekdtZkpmRG90aE8vV1JCazMxUHFHdUsrSzBpait4anloNnhoRXV2?=
 =?utf-8?B?azZ6NkZobGJFVG5mM0t1NVgrNG0zeWtRUXJGOG5LM3lYVGpnVWRDRml4blQ3?=
 =?utf-8?B?OUttSkJKTmpKRmVLcXRBSzg0cWNXU3JrZzNQRUV6blFCSU96Rk9lMFloWVVt?=
 =?utf-8?B?dytuQTlxbUt6QjlWS2JWbE1GMzU1T3RuUFZ5UHNDV0MvMk5WWXZOS3VySnpu?=
 =?utf-8?B?UW85RnRWK2xwbFBZRysxNGRkUUk4Y3VacVpidy8zU3FRcUJxcGkvSndYZEJE?=
 =?utf-8?Q?PHwWyKHKjwuXggedekZeKBSNHFZobXYjvLUO8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXRyMmwyYjdjdW1oV2JtampmVEF4YzBSV1pJS1BQK05Ub2tBY2ZxSEN1M3JM?=
 =?utf-8?B?b2huSlJES3VnR2VtM1Nwd0RvWVNSMTg1S1pkZWNDcFgvaHNvTjIxeXNta1U2?=
 =?utf-8?B?dGJoK2ozLysxZVFVdjNDN1RqQjJ5ZEI3RzU0WmVtNVFUaW5LTGxRS3NxTlpX?=
 =?utf-8?B?Yk91SlJIOVVwOU1jYnhueTl5RnZLOGpwVDJUcGtBcy9vYWNwd3RZZmx5VWFG?=
 =?utf-8?B?NHZvZzBkbXFIbUJpOHdZWGN1cUtRN3puOWJ4Q2lDQllONit5TklHdzZjbWVw?=
 =?utf-8?B?WStxaFEzL2R0N1FhSS9ML0VzWFJKTzdpVCtDTFZHbmZ6ZTRaMmI0dk92dzlq?=
 =?utf-8?B?ZU5scXc1am9WLzFGeWdmV3JwakpOcFI0N0ttUTZ0V1VrbWt1YVdQV2JMTnN5?=
 =?utf-8?B?KzE2SG0wcXFHd0tCalc0UjRtemtubWhBd1BGZDJLY1pxV01TaFlERlNwWklD?=
 =?utf-8?B?SXcyNTJJd2xnclFkMjVOK2NXSTNxLzdmcGtUM1Q1a1o3M1puRkxuU1F3bjJx?=
 =?utf-8?B?dkRNbVFVbmhUNzZiZktKeU5BWmlkWUE5dFdDNzFTWEo5WGp1YzJBY3lVU1FM?=
 =?utf-8?B?SktoR1ZsV0IzeWo1cCttODdOWS8xVG5ON1FWMUQvakdpcUJXRXl4WTJvb1ZN?=
 =?utf-8?B?ZHkzdktyTllNdVdqVDRmR3prbDAyaG03U0dRZzZ6dDN4a2MwN0lja0hsVnVm?=
 =?utf-8?B?dlNIMWZMSVNHSElPcXJmVlV3MXg3UE1NbURBM2wreVJMVnQ4THBPUUhQWUY2?=
 =?utf-8?B?c3FROEpLbnBzV3pURHRFY1dZbmhqUHczRWF3Tk5SMUUrRmRRVFBUMjNlUnlw?=
 =?utf-8?B?VlVPL0trcENnVkxoa3FTL2tDUWZtVS83c3ltS29kd1NoQ2pmaWhDallyUStK?=
 =?utf-8?B?NlJQVzVWTlgrenBJK01qVHZOaldRVEQyb01vWktzKzluQ0I1UHlLVGgrYmFC?=
 =?utf-8?B?N0dMN3dRU2NHd0U1WEJLWklIcVhUL2FrbmZBNG9ZQlI3ZGFGbWwySDAyRnNL?=
 =?utf-8?B?blhuTGw3b25IZGZpU2ZGVHBFdVczZGxwSit1RG9xQmhuZlpaSWRXakoybmd5?=
 =?utf-8?B?UHczSW5keTl0T0VrU3k4Zk9UTTJGeGtGdlJIbFF2RExicEczd3F0L00vaFFI?=
 =?utf-8?B?YXhlczBiUlhhNVBWaXFVZXVoWmxpdmlRcE05T0RJbHdCLzNmOXBvNHZMWU55?=
 =?utf-8?B?RFhsK2ZiZ1pjZHBPNFhYRk15RG5Gd1drQ3VUdndkbUViWFk1ZWhlU0hWVGNI?=
 =?utf-8?B?QWo0cWVTS2ZuQSs5VUxudlNUZ1BiZ1YraVVYTjZFYVFtYW5OUjVYQXRKaFZs?=
 =?utf-8?B?cmpiRnEyeWQ3R09BbUZQRHQ2N29aTE5Md3dOYmtadnAyMXZyQUduUGlrSitV?=
 =?utf-8?B?QWdadGM5R0lhcEc3R2VlNENiV2kyUFV0Tkk2U2xwNGdwYk41R0tueVpjNDAy?=
 =?utf-8?B?SVJGdGRVZHY3cnh5YVZMNUZHcVloTFM0MlI5SFgwTFZqYnY5alBOZzhGYkJK?=
 =?utf-8?B?U1ZQVEY1TWFSTG9yUUdaOEVUZGNHM1h1V0l5MjRyZTZxK2pEbkZrSDBOZ3Zy?=
 =?utf-8?B?U3pBN1hYTEtTRmthOVhOK0wyTFdRL1J2d051dTVvbWJTY3lWd2tHY2p0TlFW?=
 =?utf-8?B?N2QxaTlGN3RlQVRJa0lzZXdwUHN3WGhZZmxRTXBXSmJkcnRxa1dtWXJYdlRa?=
 =?utf-8?B?Z0NpS0xKV0p4RlRMUURxWkZTWmdMSllpaDF6SU85ZGpKYkcycStza1lQWFdO?=
 =?utf-8?B?blU0RUVLdStEYitVTFNoUjNTazVpTFZmdzVGM2w4bElkdjZsZWRJUWpuZnVT?=
 =?utf-8?B?bm5kTkJPVVdZU2UrKy9CVDFWcHJJV3dIcHpnWGc4amJNd1dRZVZZQ3ViQ3hI?=
 =?utf-8?B?T05VVkhYNDJ6Q2w5TlVFZm9BME9JMWpTQWg1Z3VSam9XaUt6bUtrNlZuQkt1?=
 =?utf-8?B?ZVprVXF1YkFvZGZKeUJ4OHFOWGQwdXYxbjFtOUhQcng4KzZhZVdibXZqeDgw?=
 =?utf-8?B?L0J3RXhtalVMbXl6VGY3emhpMjdGMmtRbHhLK1U2UG9NdkRlemNKM0xLREJo?=
 =?utf-8?B?M2ZJZUwvWWpiVFBVeTBrZG42NDhVV1BlZXJjbllPWnc2VEVlVlFwOHpTeDBa?=
 =?utf-8?Q?IG30=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b859641a-159b-4e27-fc0b-08dce7e4ccff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 22:01:45.8398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M47rc8Plg8d5Fkf3TiwdQq7hAFQC5qO3u7ftL7A66otFzFchCOrNCVdjSMS8SyOMnMjCxPziQgFx8KMwHKhGlw==
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

Convert device binding doc zii,rave-sp.txt to yaml format.
Additional change:
- ref to other zii yaml files.
- remove rave-sp-hwmon and rave-sp-leds.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 --------------
 .../devicetree/bindings/mfd/zii,rave-sp.yaml       | 63 ++++++++++++++++++++++
 2 files changed, 63 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
deleted file mode 100644
index e0f901edc0635..0000000000000
--- a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Zodiac Inflight Innovations RAVE Supervisory Processor
-
-RAVE Supervisory Processor communicates with SoC over UART. It is
-expected that its Device Tree node is specified as a child of a node
-corresponding to UART controller used for communication.
-
-Required parent device properties:
-
- - compatible: Should be one of:
-	- "zii,rave-sp-niu"
-	- "zii,rave-sp-mezz"
-	- "zii,rave-sp-esb"
-	- "zii,rave-sp-rdu1"
-	- "zii,rave-sp-rdu2"
-
- - current-speed: Should be set to baud rate SP device is using
-
-RAVE SP consists of the following sub-devices:
-
-Device				 Description
-------				 -----------
-rave-sp-wdt			: Watchdog
-rave-sp-nvmem			: Interface to onboard EEPROM
-rave-sp-backlight		: Display backlight
-rave-sp-hwmon			: Interface to onboard hardware sensors
-rave-sp-leds			: Interface to onboard LEDs
-rave-sp-input			: Interface to onboard power button
-
-Example of usage:
-
-	rdu {
-		compatible = "zii,rave-sp-rdu2";
-		current-speed = <1000000>;
-
-		watchdog {
-			compatible = "zii,rave-sp-watchdog";
-		};
-	};
-
diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml b/Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
new file mode 100644
index 0000000000000..1d078c5ef1689
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE Supervisory Processor
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  RAVE Supervisory Processor communicates with SoC over UART. It is
+  expected that its Device Tree node is specified as a child of a node
+  corresponding to UART controller used for communication.
+
+properties:
+  compatible:
+    enum:
+      - zii,rave-sp-niu
+      - zii,rave-sp-mezz
+      - zii,rave-sp-esb
+      - zii,rave-sp-rdu1
+      - zii,rave-sp-rdu2
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  watchdog:
+    $ref: /schemas/watchdog/zii,rave-sp-wdt.yaml
+
+  backlight:
+    $ref: /schemas/leds/backlight/zii,rave-sp-backlight.yaml
+
+  pwrbutton:
+    $ref: /schemas/input/zii,rave-sp-pwrbutton.yaml
+
+patternProperties:
+  '^eeprom@[0-9a-f]+$':
+    $ref: /schemas/nvmem/zii,rave-sp-eeprom.yaml
+
+required:
+  - compatible
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mfd {
+        compatible = "zii,rave-sp-rdu2";
+        current-speed = <1000000>;
+
+        watchdog {
+            compatible = "zii,rave-sp-watchdog";
+        };
+    };
+

-- 
2.34.1

