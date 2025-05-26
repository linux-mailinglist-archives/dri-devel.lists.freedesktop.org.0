Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31229AC3D80
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5412510E32F;
	Mon, 26 May 2025 09:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EngdgwN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B724C10E326
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBMyALQrxCUurpAIPAMZgxe5plD4772MZBiOXRZLyGWXEjiJESURFWJI7hIArxAHueqDDvXX/NszDB4PlpcnhYTq4S9IEpYPlC5VuvsY6OqDclZjfQM4yFSgh4Cl2JM14vUEtTXta2xukN4Ev2nsJY3dOF24JAQZFqs0BlvxDLZuzcvmn4Wb4jEjR3L2IKlFXvQNjH+OUiJ1yKWxZfYFu4kxHk8m/2kqwpv5+LOQ3Sq7cn+hhl5TGA4FsBJc4/TcqTAplOxgO60D48MznqldhTWhZXi3hVyxztCMpvXnzMOxNvoMnw8cQ/SN/1rT4ZymJ2HrMNZePtu3yqaSKR8y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxGW7P6I0c4m/Slmv8Y/3ooE0fxYH+fjtD8hiN0nykY=;
 b=ZeDqPBjRKyoKSACftI+LnygWeQKZJJdKKWM3yVYN8VHjw2pA4UOGJ0Ss+jxCnSkcHp1wYlpPTzsPWhL7PonvOThz3otDtalc522H87/+NCxkY/bTH+gdv7vsBPVxMJgOuZDmjGequhL3VbkFqklv5D7VpHuI6sD3tEo1SRkZ34YaOeaSCmfHddrszMFuQig/18ONwYCDytV2dAABzQBg9UkpfpUg9ActhHtXyPOOD6G9aRIX1SBe9BRaPRijtF4UbINZxP8z9IXTUdJQO53xRjZIgMxuYM4PDv0I4eew+m+4P1goyCrR3JjvfrlcyG0CFLb2LdUfWEKcZIOxxXRQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxGW7P6I0c4m/Slmv8Y/3ooE0fxYH+fjtD8hiN0nykY=;
 b=EngdgwN3S16rXMDFxfVY6mC5wZZfqsz6gsUJ6rLk39C9V9EJ9alnRyKM9ghrAk8f0OWTwLaAjDwbdJh3Mg+nP/YXUkV+8UwQK202XShAZb7UIwUCoDG2Vw8WXVkC5/C65m/ok78YJEYhSJda57kucTXYuOb+YXlImIoHmb0uadY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYWPR01MB9756.jpnprd01.prod.outlook.com (2603:1096:400:224::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 09:58:49 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 09:58:49 +0000
Message-ID: <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
Date: Mon, 26 May 2025 11:58:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Maxime Ripard <mripard@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250526-cryptic-blue-mussel-ac57fe@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYWPR01MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf46062-c21f-405a-725c-08dd9c3be967
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1ZZVTAxY3NkbENHdGp5eFY2aUNKSlZwUGJKTUVzZThkZ0dMWXFDSWMwZzYy?=
 =?utf-8?B?bGt6REx6UFZyc2xFeE5tREUweG5pZXhYS0tydE5WdGlyR1hLSFJobWxueS91?=
 =?utf-8?B?d0M4a1N1cEtvQzBYMjUxWHg3Zm5zQXZtcnpkMkxHVnYyaUZIaG5tbkdUUE0y?=
 =?utf-8?B?dWY4Tmx4NWkxSWdzelUwcERHT2x5RWZYeDlDMmlWbklGRmdZNGZubEQ4R0tQ?=
 =?utf-8?B?N1BPWWJqTWtaSnFIZ2dmbW5JLzdmNGhoN3NQalJ4Vm9zUDN2NjZWR1RsNk9t?=
 =?utf-8?B?ZlAwRlpScGhyMFVGemoraEpPdW1uWUZVZ2tCRytXallaNUp2akpmamFpSk1q?=
 =?utf-8?B?TE93UUdYV3BBRFNXMWR0SE1Wby8zbWpaamVzSlZBVHlPMDF0RXRRallCMWhS?=
 =?utf-8?B?T0FPc1ZjcGZHYUZaSnZsckFYcEhjL1haWUFtc0FtRG5yMnNCSURrSHZWeVQ1?=
 =?utf-8?B?VVQ5c2p2eW1SSWpBNUhTZ1FsS3Rwd05JV244S1NpRGpPd2lMM3p6blpzN2c2?=
 =?utf-8?B?SE1IQTBxWUdBZWxWTVl3UUVDcC95YWhnYVRkZ0tGUlRKRnhEY3BmR3YxYTlL?=
 =?utf-8?B?ajJUWHJKRTRJYk9sUG9FeDAvOC9Malc0Y1VrYlQ3d0dYS2F1ZzczWmFhakpY?=
 =?utf-8?B?N3hCQlhkMHBHWXVtNmdUMEpXaDc2cEE5TFdtV2dVUzhNRG54Rmx3Q2JIT0tY?=
 =?utf-8?B?Z2s3NTU5ZU9Ma2gyMDR6ZVFiTUQyLzlaWkVmQThud0c4Nzh2VWhVaUN4YkxQ?=
 =?utf-8?B?dFVJejRoUWlza0NlVDkwbW1aWklTQytmOU5vMFJPeTVDWXp3aFErczVnU1Vu?=
 =?utf-8?B?OVZXVDFuZHQvMXgwNmIrT1Bja1dkK2NvUzVGUHFBb3J5OWwzQWlXbVExcVQz?=
 =?utf-8?B?YWJnbVRnVW5WcE0zVk9vcXZsb2pRTVdVUW1NeFo0c2VMWXl1MXdaS1A4cW4y?=
 =?utf-8?B?ME83UExHWXZFZjdvQWJWQmhqOGpQcTUrKzhsdDNSS3JFT1RZa1pIUC82STR3?=
 =?utf-8?B?MzI2VnovdXAvQ1pWVXhranoyT2JBTkt1VjZFMk5MdStiWWFmUnp2ZmdPYzlq?=
 =?utf-8?B?TkxIaUtSSHNjZ1lobmNkTmxCRG1qRUY4c0ZSeHhLcFk3WG91TjN0WDJMRzU2?=
 =?utf-8?B?aXBqT1BQRWsxRkJJNmVUTUVZbFhGYkU4azdQaHRHNWVBUjdnRGlIMnE3ek9a?=
 =?utf-8?B?V1hSZndLS3RkS2RMVUNIRFFFY2FkdkNCUW1ZQy9aYk5XWUI0MG5lTW5GSUkx?=
 =?utf-8?B?cUtCekphSzBNRFZYME9kWjB2dUxVcnRncUx0a0R5WDZndXR3Zm5SSzNKTy9E?=
 =?utf-8?B?KzRHWjlTbzFnbi9XcEc3Wm5EWnhhRG5xdmxCK2lkRG1LUldDVm1lZFdhSVhC?=
 =?utf-8?B?UXhrTnBHU1IzUUFBR1o5QkpSWFc3b2ErNzVZbGZjbFpBUkNlR0EzS1R5V2hy?=
 =?utf-8?B?SFNRSXg4VUFRc2tCbjJyR0xTYVp0bjNoakNxbjZFR1lMNG9OVDQ4dTV1Vy9V?=
 =?utf-8?B?cDRCdWpRRW9ZLzFYclVsYXlvWXA3YVdaZWlGSW1Ic3d4SUZCc1A3a1JGQUpV?=
 =?utf-8?B?TGVxMHZqT3d3YVpTQkpFekVlS0F4VU1CSlFHTG5BVjB6UHRXNXRxd05JM09l?=
 =?utf-8?B?WS9ic3VxWUdCWVFYSm9QWVUxK0lIWVZEUElreDZiakwvZFFNdFJxdXBtTmJn?=
 =?utf-8?B?Z0dHRDBCNENzR0VCZjJtZUtDSzdBa2Z5T2w3STFQZndmTzg1dDVYUklyN0VO?=
 =?utf-8?B?NzB3Z1VVL1Q0ZnpNRG10YzRFUlBIRlBVN0lRdFpzd0Q5WFF6emgvZE5DanA4?=
 =?utf-8?B?TzIwUktzb1V4YW1UNzh2YmxrU0k3dXNlZFVHVjl4ZU1tb21xdEYrSWthdjdS?=
 =?utf-8?B?SE83UmlGZysyOTlIVmk1Z25Ldk44ZGphQS9qaDY3RG5mbzEyV0E2M0pDWU95?=
 =?utf-8?Q?95m/OwA9PxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkhxRjJWYzlkTnpET0Nvby9uMUt5STU4am1mdTBuVE9tVkZzR3ltOVdWclpx?=
 =?utf-8?B?dmswU2ZUYnFzSkcxYXh4Z2puSEQ3UXpKR1FlZUM3b2RrbitjS2JMNW0ydWVM?=
 =?utf-8?B?L1N3RjM4SWs0ZlNkZXBKNjlnNG9GN2FxNVdUREV4eVY2dlNNblFUVm9lMi9C?=
 =?utf-8?B?RHJ0TzA2eFFCV0VGMGtxTWVPSG5tMC80SWliZUhsK3dZZS9iVE94a05CTFVP?=
 =?utf-8?B?cFdJTEhHaGU0N0IrRUlNdFJSMFR3aTF6Um5TUW12ZG1YWjdqbUM4dENZamho?=
 =?utf-8?B?VDlLOXVHbFpyc3U0TUdPRnhSVEgydG1ER0xQSFdMTW9DUE84OXlCODdobWov?=
 =?utf-8?B?NHZlVzZyVXNpdGJXR2U2SFJRNjRMdXozS2tEVDFCd1ZheXd2b05hS1JBbUVz?=
 =?utf-8?B?Z3ZCRU5lRXg2bTZ5TnNSZHVPZTYrM0M5MDhCL2laSE1ObmNNNVh0WHl0OVpK?=
 =?utf-8?B?NWtRS2ZaNThMODNXWE5JclovcHJnWjhvbFkyRkdGY3c0Q2dublgwY3oyNUxw?=
 =?utf-8?B?QlFNOStSU3VBWUJQMXh4MjBoSWsvcGJDZ3dkTHg3cXB6T0lTZDlNUFN3MHhu?=
 =?utf-8?B?WDgyR0RSRnlTcitXSWVrR1AxOTd6SC9VMTVOdjRmUG5QYU1MUFlMb2xwb3R2?=
 =?utf-8?B?ZDZ2MWtpRUw2eFRiVVk0bVFkNEtyRHpJTndJZnFtK0o1dlMvTjRqaVlSQUcz?=
 =?utf-8?B?SGxNOVFMRFl2TkNUMHJJTkE4UVdhYURFcG5YRWd5YXBHc01tZFpMVTllOTFZ?=
 =?utf-8?B?NzhaWHpPeXNPdTBVWE9BdTJYMWRtT0dRMWJZSUxQNmQ4NXBLOWd0TVZXcHVi?=
 =?utf-8?B?R2pSWFZLc3duWXdnYjNEUjRyRXhqYm1rUHdKRlozZzV0eDZTSk45Q1FFVmxU?=
 =?utf-8?B?VG1TUW1xYjB3MnFDRXFaYWhuMGZGeWU3UVRXaEM5Kzl1QVRZS1MvL1JHclpF?=
 =?utf-8?B?QzlmTDJrS3hXQmJGN3lWS1dhd1F1byszNE5sRDFwV0ZEYjVZTCtEa0FtaDNL?=
 =?utf-8?B?M1JDc3prTS9kZnVuY2o4NWFERWNFZzJNa25tVmtWR0dqdmZTTE5aVExrZHBK?=
 =?utf-8?B?VlQ3Z096YWo2dVBnZ3V4di8rZnhyYytxd1VuYUo2aGJWbU95eWpTeVluK1M1?=
 =?utf-8?B?ZHRrOHRxOCtzMWF5T0dSczBEaWl2eFpBT2syVkcyZmdGOXBOK3A5elExRXpm?=
 =?utf-8?B?WDdrT2JmU1lyUFh2UWlHNGFQMnUwcVhqcU1rWE16WlhLOGZJaWpaakk2MVBF?=
 =?utf-8?B?K0sxUWpvRWNKTGdva1BBV1J6aGI4NHpzSGJGQzFjbXNpR2owUHlWK1JBc3Y3?=
 =?utf-8?B?dld4eEkyYVZhendKY2txc3FoZXZRTm5rMXByUjRjblVwYnZld3kxSEVjQ1Fz?=
 =?utf-8?B?OTk5WlZFSWNLOElKVEJqTkJBY04za1VaZ0FCZlluRGdMbENUMHA4NXhqc0dQ?=
 =?utf-8?B?algwd3p1N0YwWnU4WlptT2lsQ1ZVd2c1N0hKczI0UUx4UzV5T2xLc05ubjN0?=
 =?utf-8?B?aGdGcjR0SEk3RVBQMmpkVG0ySFd0OVNlUTdwUGhWeVlETzAzbzMrSWJzZzVj?=
 =?utf-8?B?cDJUT2lQU0VoS1NKSnpXWUY0RVJxbitvOTBXRitJNkllT1JOaEFhLzQrZzJU?=
 =?utf-8?B?RG9QTHI1bW00ajBUVjNXMXRkdlZsVEMydHJscXdvWGJaRnJuWUlVcHVSSU5T?=
 =?utf-8?B?em9CaFR5L0JyWnNsNVpjVGZDdWZZUWdZSzBvQWhQOVozRUFIT3lqT2NyeWFJ?=
 =?utf-8?B?OXZ4TW8vcGZKT1N2YXVkZGUvM3ZsZFp5TUhnd0Jub0wwMXZsMS9hWXFKRElp?=
 =?utf-8?B?RnlqMDJrMG5aSXA0K3ZRZ2gzQmMrZWR5L3Z5cTk1QXMwSTdlcHllVUJnczIr?=
 =?utf-8?B?V3ZyVUNPSVlPNGl6M3doMmFwYk9DRlBYdkI3MDdpZld0c09Ba3loeXc5WllM?=
 =?utf-8?B?OUlycXFBVVBiSWhEamttbVVoRjlkSmN1bWpBTW8zTTJlMTRkYXEyY2drRDRY?=
 =?utf-8?B?dWZqcndnWjJJZ21iUFNwbnNsSlcvV2VTblB6R0Z6eTAzbjI4bXZOa2Qxcnov?=
 =?utf-8?B?L3dxbEhjUnIyaVlydnF5SDNlZkw1Zy8rVWREd1lJaGVkVCtyT05Gd1c3UmNo?=
 =?utf-8?B?dlA5UUlhcHZYdmNhSHY5dlYwbmxDQk45a3FpN2ZlZ2ZVMUg1SEcyTm9RSmEw?=
 =?utf-8?Q?XR4q07cMVzsopvXo3gS+VMk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf46062-c21f-405a-725c-08dd9c3be967
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:58:49.2883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1GBtH2316mojEhVcbYJb98Adelz5sw0iCnOqn0HFobPA9xApwaofTNFDtdWluRRLdSA548/tv+j4piR16vHtStU0N72FspV6MbDBcoV6fISumbUGLJxpDAUlkM/z/Nm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9756
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

Hi Maxime,
Thanks for your comment.

On 26/05/25 11:26, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
>> After adv7511_mode_set() was merged into .atomic_enable(), only the
>> native resolution is working when using modetest.
>>
>> This is caused by incorrect timings: adv7511_mode_set() must not be
>> merged into .atomic_enable().
>>
>> Move adv7511_mode_set() back to the .mode_set() callback in
>> drm_bridge_funcs to restore correct behavior.
>>
>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Explaining why, both in the commit log and the comments, would be nice.
> Because I can't think of any good reason it just can't work for that
> bridge.

Sorry, let me clarify and share with you some details:

adv7511_mode_set:
  - Is setting up timings registers for the DSI2HDMI bridge in our case
    we are using ADV7535 bridge.

rzg2l_mipi_dsi_atomic_enable:
  - Is setting up the vclock for the DSI ip

Testing new/old implementation a bit we found the following:

root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
[   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
[   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000

root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
[   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
[   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56

Same result but different timing (in function call perspective):

  - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_enable()
  - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enable()

What do you think? Thanks in advance.

Thanks & Regards,
Tommaso

> 
> Maxime

