Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46786C2EFCB
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 03:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E443310E118;
	Tue,  4 Nov 2025 02:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="X3ntksFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8224A10E118
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 02:39:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByOMS5bnvMYuiQmMgHgvNxntLfTRf57D5A1F2j6diXJsxy9uxDGjpnoMxxdV3HTZcJRtMCPfDkGk3G62AJLGhsOYF7oTNglUosww7b035l2JpDteUd7y9lhOSZ/JEEmK+uP6Im/YlB29DTPcu9wrYPNahoGRqfaVTQlWFv+p6c6Sg0COJJGSqmaAw/sxPCAm9m+2yTUHHCaGtyFhOvf56C4tUy+ZWEHrF1FgQrCVSJgcEYI7kO30lGFEbqGJ0XguKNNsMaAJkMbY41/vWWql0CltfImL5MUffyuWBv3/lysHvRnyQ4b0Mrszcvwvq0mzgwuML4m9rkdjPBG6dRCREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKD9/4u++4dc1PsBobs0R+YRbXFllA4uhEaOWYDIV6E=;
 b=xrcRdwNluZbvay6hIYa7Q8vv1Yo+d2kuf/5Q5aRrXNAD1DLltQd76b3VrRP49WfGuFeebXlfaNFSEkqMlhGTfei8bj+HdGLR52vKhIYOpXi+HQojOqs2fWTwN8UVs+aMGZCcAwSoY+1n1Mo5KaTLsppH/dS6+apHSPQVsfIrh2ufYjpxA2DG2L4Ycxb6Jl9klAlTc2+ALRKUcURBuiAdDducyqJV9fmx92l3OvE2UEwt3Aq80quwxlC98GYIkAIGRFnqrJXwo1sgGS3jkGBYMSY6DdDviHjkvYexqM865HVdhe8N17LwFkHjMyv26cuGzn4dY0r8xD6VRZZiBaD/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKD9/4u++4dc1PsBobs0R+YRbXFllA4uhEaOWYDIV6E=;
 b=X3ntksFwbz3m33uNh/UAIc1KHJWT3XTwW+0SkWEOZv/S0LsybalBb2mW7j+EKT8wq3JZwz6O7B09He95sOgSp/JHtKiO54aolQS+ghOGV6XfWhXa4BCoCDxETA3KN+Jjc77ydZnSrfEHwek4keZFZJ8BR40pPGw1b3TAL9bUjgPlkSl1Gx5uTo0vw08eyjnB3PEj/n79vZCIlL7wBWInZChG75TqPQhNn4fdU2L0w2V+Vm6SrUrYOjm3opoqy+yjx2xktsHr+GZhC4gWhykYs4RkHcP4E4mkipCktU86OpoTzwkniCE6VwEH7lQ/irer4Hgap04llhKO3HslycwfIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 02:39:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Tue, 4 Nov 2025
 02:39:06 +0000
Message-ID: <4beeffe0-6ae4-4039-9904-3ec318533a1d@nxp.com>
Date: Tue, 4 Nov 2025 10:39:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251102170257.65491-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0105.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d5cf79-43bb-4915-c8f4-08de1b4b5321
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3hxZzdubFErZW9qd3Mrd1phakJFRXJNSklZNStkZGRBYVR5YkwwVFIvMzBo?=
 =?utf-8?B?WkpqbTFCV3U1VUxha3ZPUUNLeGVCMVI2ck9UZjBJc09zOEQyUUtFZHRxNFJQ?=
 =?utf-8?B?b2VhR1E2RW1MWlEwSFpmM3hubDA0dGFOdmxDdWZob2lSc1JCcXVXck1Od01G?=
 =?utf-8?B?V0J5ZFJoS0FxMnhTWnE5enUrcFZIUHJ4WmdaQ3BVZU9uZmd1SWxmbHBNNnNy?=
 =?utf-8?B?YkZjeDROaGpZWmhKbm5MbXdnWlNuSkJpc3VYd2FoejZXOGt3SEd2M1BudGtF?=
 =?utf-8?B?dUZsQ3dlbTdCa0hlQndjbmdnWk9EVXQyTHdhcHBHandkVktNbUNtaDNDUStp?=
 =?utf-8?B?R3d4TEFHYkNSenBzTGh3VWNwVnRPZ0xBOGVka05KVVRNNUQ4bGZVTmxsaGk1?=
 =?utf-8?B?Vmd3QkNxYkdpTkZqQzgrQS8yNmdZM0ZoZUQvRVovK0g4aG1PbXBDM05SY1Mz?=
 =?utf-8?B?MFRUZ0NrditTVUxjRFpEVHFHRGwxTlRsODV2UGF5OWM1cVluMWVPTDV0dDN0?=
 =?utf-8?B?WFc1bC95NnNRMUR0NVVLL2ZYMXh6UmlQMDhoNTVGSmhzRnk0ZVRhQWJ6N2c2?=
 =?utf-8?B?L2dWT2h0V0VkWHdEZkMrbTZKbDNxcngwbXlVQW5QZ1p6SkVCdWx0Wk81Tk1y?=
 =?utf-8?B?NFFzSnNXMzgxK0xROEFheXJPemtGclovcTBtTzRDUXIwWUNxRTcyNXJNc2Zj?=
 =?utf-8?B?WmFBSDJlWTZLc2pXR1hyWUcvNlE1czFQN0FYM2FCaVcrRktPUTN0a0Q1a202?=
 =?utf-8?B?WjFGNUFXMkdhZHRzczF4MkFWMFRGbE9yQjVBcDhoemFIUG1JNzhDa0JHb3Rh?=
 =?utf-8?B?WEVtNG9EOVRnUGdmVVhkUzVYWmY3cTRJTE1CNTZURjAybGlNSHRsd2lSZTUw?=
 =?utf-8?B?SU96ZFZZVW1VK2I3MnFhVjBlaVdyRlZXcmc1MlMwbTFSTHFZL0M0Ulc5NjF0?=
 =?utf-8?B?YzcxM2JCWjdoYy9pRmF2Z1NWM0NzblF6bXFhb05TQm03ang0UzRIc295WTBo?=
 =?utf-8?B?eWtOWDlqUjBBWXFGeXZxUnlYbXhzamdRQlR3THFWWTFkQXh4eW1BSVV2ZVl3?=
 =?utf-8?B?TnZwVmp4ZlB6Rk1yNXQ2K0dwaUdoZVQyci9WbWhoNEMwQ25Ka0tMM01XRy9y?=
 =?utf-8?B?aGhEUllObFlHbTB1d2pPWHZCVkJpUThRNGF2YThjS2F0VElDc3ZWSzRURDhM?=
 =?utf-8?B?dGVWYjVqNklidk9iV25wcUFkaHdRYVRDYWJNZEwwWUxyM0J3LzZYSUNKb3hu?=
 =?utf-8?B?aGExZlR0M20rU2dpa20xREViQjJ4aWZXSTRIRVhVK1pMT0xaaURIQ0hHK3U1?=
 =?utf-8?B?YUt6WmFtT2RyUzY1eEtGdnNiK2p1aUMybTZadUFhdU5MMEFVemEzcE9VOHp6?=
 =?utf-8?B?eXppK25rZGRKOThXdVRpTlpaeDNrS3NtNXZWaWZ2cHh4bExoZWNTWDE3VWVU?=
 =?utf-8?B?b3luQmRadE83Q1BnOHJOUGkwVkxLbGcvZllDNnFBd29EL3hXclVNZ1lEaHBz?=
 =?utf-8?B?eVl0TC9PMjh5aW42UHh0bTRsbjJ4elU2Uk5JYmMwVm0rd0ZvRTVkTFVxeWY1?=
 =?utf-8?B?QTREVHJ3NkN4VEhZNUozb0dnQzMxS0hHZTg3eE5LMk16ZHdwMUsvcmF4MFhQ?=
 =?utf-8?B?VDBRaDRlaVhudnc0R2E5bUM1bmM4V2hJWjZVZDFNMmZsMllyb2N5cnBUWjNL?=
 =?utf-8?B?UlJnTlNPenZ1cXpySTBnTTBhWkMvekdKT2VVcXRldkc4bUQ0UjFIMUdMNzFp?=
 =?utf-8?B?dDB4UFdWOElvbG1TSEUxM0V6Y1N0SEY1NWFZVXBhakpnMUp3Z1Z3TEUrVXA3?=
 =?utf-8?B?QnZBZWkwUDdUME9rbWhOdmRWRmpyT3orSDd3MmtSakRoQmR0dnhCUWZ0Q2ZT?=
 =?utf-8?B?RTRJTFJOclBkSkZoSDI3bjB2Zit4azJybzlQamhEZ0hQSkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWpYRk8vSlRmN0U5VWU0bDN6bzJZZ2ZvdFhyR1Z4N0NOaXZCLzNkRHFJdmVi?=
 =?utf-8?B?ODN3TlpXbnNDYTFiVlRaM3J4RzFVYTNDZmg0REo3Z0REWW9yMWY3a3BjZ21m?=
 =?utf-8?B?eGFWMEN4VEc1MTcvWS9FTWo3WG1LcVBYbEI4SXEySDFDbUdlcVpZYUtndmZ1?=
 =?utf-8?B?bzI2MG5yK3JQUnFNbXE5T3pMSjRXQWt6Y1oxbE1yWEs1UGswU3oyOGxDOXZJ?=
 =?utf-8?B?ZWQ4c2xnL2ZpRFg1cU4xUVdmRmFLK0Z6MExaRjlNUkxNaWxwMmNFcTRVSVhN?=
 =?utf-8?B?aWhOd09kYVVManRURXpyY3ZFNDdEeThFRGUrQVlDM2V6cm9ITjlZdXlxZ0Fa?=
 =?utf-8?B?S3JBU084TzFsL1MyQW1MWE56d3JaaDQwWVZCclpVQWluZjFkOWtUZS9POFdZ?=
 =?utf-8?B?dzFzZUJIb3VVUFZGNmFVTkhSYklsVzBoNm1KME1wd09EWkpacERpUHpGSW1X?=
 =?utf-8?B?VG9nTmx0cEN2UHdJelREZmdqbksvaHFBcmlrbWJRWEk2RjY4NEZWbU1vaXNl?=
 =?utf-8?B?N010NlVubE9tRWNkK0t3UUJ1SkpHRWh5M2RiRVNpZzFheUlKeHBuVGFlY3RH?=
 =?utf-8?B?SU16R1J1OG9saUhHRDhiRjJzUVpWbzVEYVVDV1B5dWtpMVZ1ekJqZGdZYzNN?=
 =?utf-8?B?Zk5DSDcwWjUzVFJDVE9lMkVhbnFSTFJWQWppVC9nUlZrZEpBRUNJdjdwYjlO?=
 =?utf-8?B?ZmgxUkk2ZE5PbE16SWJ5L1AzZ2trZHk3M0ZyZ0V1Q0ZQUW9EVnlQdG90ZnFM?=
 =?utf-8?B?QnlkSUtsRWswSXFxSm1XZGlxeDQydExscUVvdXRDVEUrbW9iVlA0dW4vanZx?=
 =?utf-8?B?NENySHgrYkVSK1hTQm13eFdWV2VzWjBJWW10MjFKNWgxbmcwUjByemNLT1dJ?=
 =?utf-8?B?cGtGQUdQa0tSc3BaZ0MvcVk4NXNSQUpib0J0Z2pobG9mVi8yUW1EZU1uYndv?=
 =?utf-8?B?L09TMjJaVW5naWtwNjd0QnhXWVpMc2JGZE9UeHFoaXd1a010bldXTUlobWlj?=
 =?utf-8?B?bTRVNndDbU1ZdEpSakZBUUlwcUpjRCtjNnM3S3RWa043T3ZqY2dHOGoxSlZn?=
 =?utf-8?B?QUs1d0lORElEVmFyak5HWTBrMWZ2K2x0dGVxSFd5Q2hvbi9EekFqOHc4aFJF?=
 =?utf-8?B?NmU4VWNvNEZ3Ui9WTURqeUZEbmpaTzkrc3F6bk1oYnBpeXpzU052WW8rRVVp?=
 =?utf-8?B?TXZTcHZVb2UzWGk5eExCQ1c3aVh2Um9vMzNqRlkzMHBKVXhGZGVoZUdTVnBE?=
 =?utf-8?B?M3hTOGFKNC9EUm8wbmJXczgyMlc3NVN3bnVRRUtCVGt6VXdBTGRSVWJpQjJt?=
 =?utf-8?B?MU1LWkpReDFSbUlpVHhJVFJYdFZJdDloak80UElPY0FlUlFxVCtZQVkxOHBq?=
 =?utf-8?B?UTFQNXN6a3I1K2E3NUNiREJMUjFLUDd2TkJZV0dGRXRxL0YxUG1Ha0Q5aHBs?=
 =?utf-8?B?S1hCcWV6UjFsWDdFWVpIek43ZWcyZGRKWFc4UTlZekFvYTdJZDBxQjJMbStB?=
 =?utf-8?B?WnFPZXlML3hEM3o4UnZrbk9MYm9IZ2o0OGNVZ0ZZQ0tPZnBXRllaT3pFbWZI?=
 =?utf-8?B?MTBFWFRSb2FMcDJQZ1RlUHpZV0ZjUCtCTFBVMnh5NnBFcnF5enFrYlFTVEJM?=
 =?utf-8?B?QVBpL20yaC9YcUtwQ0JVcjJXbzJoWGhGZExrKzFsbHJzM09VeGZGUkEvbmE5?=
 =?utf-8?B?RUt6clJadFN4VHRib1lJTzlGNC9ick5TeEJyNjgyNHJkdlRkN21uWEtwbXdj?=
 =?utf-8?B?VmhMcDl1Y2ZQZlJ0UUVNeVpVdUU4WnlZZWJHb3U2aTltRy9ZRkx4bnF1SjRr?=
 =?utf-8?B?ZmpaNWlUczJvUlJhZEk4bThEWlVwUUdpbEx3NVRRWGFMK3B0V2VYaElKMDE3?=
 =?utf-8?B?aVhORVZMZHRISWZ1Z29ZVkxHTUNVUW9zN0orUDJ6bkpuTUxHcEZSays5eXBP?=
 =?utf-8?B?TXNaTWliZE9HV2YvMDFEa3Bjb1hMTWV0WDlSVmtTa3prZ0kzUklpYVJaUXJY?=
 =?utf-8?B?NGRrVlRIdnhqU3FXZ3drckFjbVFVUEhZOVFEUjVVa3dyTFBNZy9CYnBjVndj?=
 =?utf-8?B?d0ttV2hUY1NVM0pSWFV0ajVhSFVORUN2MVgwTHcxK1BMQ1Vsc2JYU01HT0Iv?=
 =?utf-8?Q?5bxEqiJ7mNvV06dZNstl5NpQY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d5cf79-43bb-4915-c8f4-08de1b4b5321
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 02:39:06.5725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pLqa6XU+AKiRwMpwguNSJEHuBjCU5Q9lVVBjJxdruew43TsE+NYTyKE3OCtNtIx1ImRcyofKvNOKFJhf8EPgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359
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

On 11/3/25 01:02, Marek Vasut wrote:
> The DT binding for this bridge describe register offsets for the LDB,

I'm repeating my comment on v1:
s/describe/describes/

> parse the register offsets from DT instead of hard-coding them in the
> driver. No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: - Switch to of_property_read_reg()
>     - Parse single-register LDB variants from DT too
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 58 ++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bce..2357cb2fbbe39 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -8,6 +8,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -61,24 +62,13 @@ enum fsl_ldb_devtype {
>  };
>  
>  struct fsl_ldb_devdata {
> -	u32 ldb_ctrl;
> -	u32 lvds_ctrl;
>  	bool lvds_en_bit;
> -	bool single_ctrl_reg;
>  };
>  
>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {

As I pointed out in v1 comment, this patch should remove struct
fsl_ldb_devdata.

> -	[IMX6SX_LDB] = {
> -		.ldb_ctrl = 0x18,
> -		.single_ctrl_reg = true,
> -	},
> -	[IMX8MP_LDB] = {
> -		.ldb_ctrl = 0x5c,
> -		.lvds_ctrl = 0x128,
> -	},
> +	[IMX6SX_LDB] = { },
> +	[IMX8MP_LDB] = { },
>  	[IMX93_LDB] = {
> -		.ldb_ctrl = 0x20,
> -		.lvds_ctrl = 0x24,
>  		.lvds_en_bit = true,
>  	},
>  };
> @@ -90,8 +80,11 @@ struct fsl_ldb {
>  	struct clk *clk;
>  	struct regmap *regmap;
>  	const struct fsl_ldb_devdata *devdata;
> +	u64 ldb_ctrl;
> +	u64 lvds_ctrl;
>  	bool ch0_enabled;
>  	bool ch1_enabled;
> +	bool single_ctrl_reg;
>  };
>  
>  static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
> @@ -204,15 +197,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  		reg |=	(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
>  			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
>  
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, reg);
>  
> -	if (fsl_ldb->devdata->single_ctrl_reg)
> +	if (fsl_ldb->single_ctrl_reg)
>  		return;
>  
>  	/* Program LVDS_CTRL */
>  	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
>  	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>  
>  	/* Wait for VBG to stabilize. */
>  	usleep_range(15, 20);
> @@ -220,7 +213,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  	reg |=	(fsl_ldb->ch0_enabled ? LVDS_CTRL_CH0_EN : 0) |
>  		(fsl_ldb->ch1_enabled ? LVDS_CTRL_CH1_EN : 0);
>  
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>  }
>  
>  static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
> @@ -231,12 +224,12 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
>  	/* Stop channel(s). */
>  	if (fsl_ldb->devdata->lvds_en_bit)
>  		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
> -		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
> +		regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl,
>  			     LVDS_CTRL_LVDS_EN);
>  	else
> -		if (!fsl_ldb->devdata->single_ctrl_reg)
> -			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
> +		if (!fsl_ldb->single_ctrl_reg)
> +			regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, 0);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, 0);
>  
>  	clk_disable_unprepare(fsl_ldb->clk);
>  }
> @@ -296,7 +289,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	struct device_node *remote1, *remote2;
>  	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
> -	int dual_link;
> +	int dual_link, idx, ret;
>  
>  	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
>  	if (IS_ERR(fsl_ldb))
> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	fsl_ldb->dev = &pdev->dev;
>  	fsl_ldb->bridge.of_node = dev->of_node;
>  
> +	/* No "reg-names" property likely means single-register LDB */
> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");

You don't need to match reg-names.  Instead, just call of_property_read_reg()
twice to get the first reg and the second reg by passing indexes 0 and 1 to it.
If the second reg is not found, then set fsl_ldb->single_ctrl_reg to true.

It would be good to take this chance to clean up reg and reg-names properties
in fsl,ldb.yaml.  See this complaint:

DTC [C] arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb
arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#


> +	if (idx < 0) {
> +		fsl_ldb->single_ctrl_reg = true;
> +		idx = 0;
> +	}
> +
> +	ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->ldb_ctrl, NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (!fsl_ldb->single_ctrl_reg) {
> +		idx = of_property_match_string(dev->of_node, "reg-names", "lvds");
> +		if (idx < 0)
> +			return idx;
> +
> +		ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->lvds_ctrl, NULL);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	fsl_ldb->clk = devm_clk_get(dev, "ldb");
>  	if (IS_ERR(fsl_ldb->clk))
>  		return PTR_ERR(fsl_ldb->clk);


-- 
Regards,
Liu Ying
