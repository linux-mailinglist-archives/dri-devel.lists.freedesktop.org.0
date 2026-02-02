Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI/aC+x7gGnE8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:26:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C2CADF8
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14B210E415;
	Mon,  2 Feb 2026 10:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="srP47E5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010044.outbound.protection.outlook.com
 [52.101.193.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609AB10E413
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 10:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9iF/+VX6lNbucvQ57FiE7blYaEgeQ24OEakmgWS3ncoYFT0W+3QwTHLapPwzcYQbRVC6qWlIZVBNoLWpgeDzk7YSK6SkzjNsK7OlFG8fPfdMbgERlX627xtNNt88qAeWgX2aeuIcRl1QU4b28OztpZjuCqhy1qvfp58K6f55vkwPVB8ipeYIQ8mKBCy04VkEnowpIlnv4oqkRyQcMK8efVn1hdAqfKmMCZLcseaQdzwHDKwxTjRimRiZpY8ZsLHNXCpSVW+mH5Q19p73l0mM8yMGZUTU69HvRR5OVRm8gP2IBEYGDAm9h88YBtEE7qZyrG4caSuVUgZ8iUyY7Pi+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hqaqWksTu7accyg1Ot/GcZVOteOdLtEJEhU4ghGvRc=;
 b=rVbW7dKrX4Qr+FKf0b/3DVzoSoW0a9UgSkbNr4d5Z1LFm3BzNs/dFz0u/astuWjXm4yAWmDF9cGd/IyE9pXGQfcdXOFxFFi7oDpLZKlMbXLu3AAK4+U/9x5If6ppJ04sln+gXtTPvD2YMN/B82zc52qgIUp0dVhDgp+JfGFak7znPVC13RMvkcn/41OHS3+/h0JCd9+RE8OTptQ0oJilh0aegHAWxJcNHem/fO7f8pCiYzkscxsHEoN4p0OZRmWwnzkXblb0xEAVPk167YWclzp1lU5adcgnYRPPDQHfNCZ14tXpbkeP5xNhVvdQVT8ro7OyXkHnBCjjlwYA+Lf6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hqaqWksTu7accyg1Ot/GcZVOteOdLtEJEhU4ghGvRc=;
 b=srP47E5mo9rZppcHNwn6rUqtmjVs5cotJ3bhunho2kCw68hjkO6GzVKrmLY9/RQC3CAReWCwI8QMd4XNYAJGLcNSf7r8V6DCJ6dqqt/s3U5e0RlqivXcWZujg6zp31nnXlFkjG0gpkjUvN5cIyhHNcpyTbhUXEYWX4d2VjmmIRHSfTep+2fnjMdOLtgfTLRpEiE/wEti9qQqG6cE3E4090gu+phc0BNHfmpZeRNDf5Vwx67ysXB2XJ9Qouu0OnjziZM/M0bPMeRB1GVI5cpSKwfG2pXDOVmvZttsyw1SWiqj9TW6pGqayr2uStWlH4im64Q55Tv6DoVxvLumi6+Ifw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB7151.namprd12.prod.outlook.com (2603:10b6:806:2b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:26:43 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9564.007; Mon, 2 Feb 2026
 10:26:43 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Aaron Kling <webgeek1234@gmail.com>
Cc: Kurt Kiefer <kekiefer@gmail.com>, Jasper Korten <jja2000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
Date: Mon, 02 Feb 2026 19:26:39 +0900
Message-ID: <2691012.Lt9SDvczpP@senjougahara>
In-Reply-To: <CALHNRZ-ZxBmbCNGyq77TWcNQwo9qhrB0znfRnsj7zy9GVE=jtA@mail.gmail.com>
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <aXiSMlP-UKmrFKL7@orome>
 <CALHNRZ-ZxBmbCNGyq77TWcNQwo9qhrB0znfRnsj7zy9GVE=jtA@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c58a98-6101-4304-ca20-08de62458f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkQzY3I3RDZMMGNsUGs4bjNmMms3ZWFLOERZelRNbEJ3dm1zUFlZeTBZUjN5?=
 =?utf-8?B?NFFIMW1IWDl3VjN1Si9Nenp2U0RjWFk0TzdBdVFKTlc4dUE2blNaUEtBdWR0?=
 =?utf-8?B?OUVyOGpHS21oempjV3A0dWVRRHRyeDh3NWVOWjR3UXFQL1lXVUpVeElObytE?=
 =?utf-8?B?ZzB4cEgyTE9pcm5UZG5CN0hCblFYS1VzZFJFSUl6bWNncGR5V1RYUHlDNkNo?=
 =?utf-8?B?M1NGbjRQcTJraytFZGFyU0I1K0dpbERoNDUwdkZhQ1MyNWxsUVRpaWNqVWNl?=
 =?utf-8?B?eEo2L2JWOERaN0NKa29ncTZTUll3bzhBZ29hWHA2V1lOR2VpZEFON3d6dTV5?=
 =?utf-8?B?OG1NakE1U0daU1BHTDlUMEQ2djBSSTBTTXhiN1dNcENjbUpxeUY4RmlRZ1Vp?=
 =?utf-8?B?T2o0bGJjeDhDQ3JMc0ZIbERiQmdrMG5aM2ZxR0EzdWRrYUZlakFWdmpvamgx?=
 =?utf-8?B?aWIxdUxEamh6SEs2My9qUkQybjhrNkpxdXVCNGRpcGlGQnNqRDlZN1RtUTlT?=
 =?utf-8?B?K2s3dUo2ZUNFTXB6YkF2cHluYlFVMTZ6allsb3hXMU1INVg3OEgwcC9SSUEr?=
 =?utf-8?B?OEs5WS9mL0NTa0VNY1VqQUZQeFZZUmZBRjdEblUwaHFjTlBoU3lYdTFZMVlC?=
 =?utf-8?B?ZG1aa1MyUkErOXh0SUhvTFRFeGxMWkhjSFQwQ1RxcHRNMjROVmxTbHFGZWxt?=
 =?utf-8?B?UURZUmhxQlVQZk9RZDYvMVF6ejdqV21CeUg1WmJuVXd6OHY3bU1HZXNYakkr?=
 =?utf-8?B?eVhpc3ZrQ253TE1SaTNTT3RXMjFETG9XejNDSEk4bEpCNVArdEk3clFYT0Nh?=
 =?utf-8?B?ME5obmRyVGZrM280N3FGM3YveHIxYXp5ekdXWmthY2lraUlhQnNPRTIyVEZv?=
 =?utf-8?B?aWZmaEJVZEpXYnltNjdCUUpBQlRIZnErck96RnpYaG1yZnBGb2xjWWZXdWlJ?=
 =?utf-8?B?RXBpMUJXazMzQTZxTzVDcmlVSjRTSWZTNTUxZkRkZ1FTSWlhYjByVU1sUEFF?=
 =?utf-8?B?bGQwTU1xc1BZbnJMaFB5RTBDOEJ2cmJUMXFMVUdqUWRCTHJtTGtLaWpTRGJu?=
 =?utf-8?B?aEZ6dWt4Wm01elFTY0Rid1UzR2RMUFJnZnFHbG1XT3lkc3g2eUhLdm9QWHFP?=
 =?utf-8?B?NTJjaXVXUkliSmg2SUFCbndMWCtwQmdwb0ZFaGE5bGNBaElBOGFyR2lWemN6?=
 =?utf-8?B?TERvSXBvdHNoZlVtbXF6U1pqMmJJVTZJTm1Ka3dxY1B2ZDF5Uk5sZzNZMzZZ?=
 =?utf-8?B?S2UzeFBFUTc1RzhtMGY1WjQ4V0kyVUhITTU5UmFlbk14WjNnbEVjRmhWbnFX?=
 =?utf-8?B?cmdieU96Y245NzNuKy9sUEJYcnZreHhRQWF4NE42OXErd0htUm5SeUdCSFBY?=
 =?utf-8?B?dWw5VjRtcUtNVERsODl4N0VxU1dHVCsxSGt6ay9NZ2dQMFFiN1cwUDRNRkJB?=
 =?utf-8?B?a052Z1pnMERnV0tOR3ljclExWGk5RC8yYWtSeStYZHc2WmZCS2lKR3pKK3Bv?=
 =?utf-8?B?M250Z2xpNlZVVThaNmY1TzJTbWYzMXVhckFyZ3kzMVNGcXhYWkR1UDZzQ0ph?=
 =?utf-8?B?a056Snp0czNaTitHNzFub1FiaFNISC8zdG9xYmhQcDNCcytLT3RLOEZNK291?=
 =?utf-8?B?RTA3RHJUY3pNWk1IYTZNZmVhcUZBazhFNXptVXJWbFhoZUEzcXJQd0JJdkY2?=
 =?utf-8?B?aXRNeXRqRDRmUXhKNE1vNUwvdk9lZ2NOL3l4cHFkVXNTbG4rMXpoYmxLSmMv?=
 =?utf-8?B?a2kyZXJtMndhU2wxdzdiYXVtNyt1Uk8wZXJCTHZPMitrTHhsY09OTTI4c2JF?=
 =?utf-8?B?aHdjcysxbTVicWJ5cUtBdUNJdmxyNG0xaitmcnVMQVNEcXFoQ1ZGK2I4U0dt?=
 =?utf-8?B?SlFVRHY4elJFdHo3d005bnVSWEpIUFZqNE11UXowV0lQZG5tZlIvRnNNZW5R?=
 =?utf-8?B?eXhHZ0lQZEhtVlNaWXpSMTQxeXcydllLT0cyNmlmOHNDS3c1dXI2VmszMzlJ?=
 =?utf-8?B?UTFzNHg2WG5yR0VCM2dHRG9UVmluL01ISzVvRmVSTmlnQTdPczNPbFVpM0dN?=
 =?utf-8?B?Q2JpcngyY3p0alpCUUQzNkIyWU81amhCK0xYbk8rV2xrUzMxRzJFZzJGbGRG?=
 =?utf-8?Q?zJoo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qi9JcC80aklIYVhSajV2YzFZdFB3VzZDSGJMdWUwa3VOQ1pHOTNWRFR1YkN4?=
 =?utf-8?B?cWNaTzBWQy80TG1UMjB2ZWU5Y2c5dGdCck4rWm0xVWg4WHpDYjVrL2pkZkp4?=
 =?utf-8?B?L1dKWVdjRzA3Wk04a04wa0FoMC9sbzBDOGlkem1kdERSTzFFNmZpcm91a0hY?=
 =?utf-8?B?QnVzaUFOYlI3MVdIWkhiS2VkbmF3aE91L080OW15YUN0T3pEcXgvaTh1Zmpw?=
 =?utf-8?B?cXdIWnhrSEFoTE13N1JITXpuWG9HK1VFQU9wdGZLekdkcG5VZXc0SjRZQTRS?=
 =?utf-8?B?RHpPancwZnVwTzJJSllSOWREVHNRelRHQldrOGw2bDl1T0JZMzNaeWVmYmty?=
 =?utf-8?B?aW5vNU8vNXZwL1o5OTk4R1cxUjVNNHlHcG5ucEd4eUtuS2t0K1FOaWo3elU5?=
 =?utf-8?B?Y1J3QnBxM1o5OWxsMjZJNnlMZ0dpblU0WUpwNkd1UEgzTlRxNm5WYndmSlIx?=
 =?utf-8?B?REFjT2w0ZnhDY2hwS1JLNnBnZGxHNkdNaUVkWWhJbHEzOG5PSC8zTTRLLzVo?=
 =?utf-8?B?dlJxaGhVQ0pYM0MrR2c3elZaSFk3OSttenR0bjBhNndxc2tkQnRIYlBnSkJj?=
 =?utf-8?B?UU1lbGhJZ2RUQ1pnaHlSYjV1a1FVTW5hNnhHbXcwT1hVdmZDYUhaSHNpYTQ4?=
 =?utf-8?B?d3RTdzFiTDlDT1lzWjNtQy9nTldobDFqUU5XVnRacFZFZXpyNzdReExpbXdt?=
 =?utf-8?B?Zm4ra0E3RS9tazN5dVViL05hUUNQdTZjS1k4eXkwQ2t3WUJLUFpFNVJXZ2lO?=
 =?utf-8?B?cXJuRUMrbnJEZVN6TkNERjJoUERjb3N4dzRUS0NpTGpLa3lRRGtObWg0OGRh?=
 =?utf-8?B?cVJwZno4d2E1VHNkSXJoZGZBc3gyelF1bXVqY0dZNE5PRE9sdi9LSU96Y0Vi?=
 =?utf-8?B?ZW9zNGhQZTBKeVdZYS91R0ZzTkM0VGdDUDFKTjU5YlZ0bkFac2RpcE9hNVBp?=
 =?utf-8?B?L3ZiUlYxYmh1ZjE1NUl4UmdteUc1VHZ3K2RLdEtleG5vSjJxVW5GWjJRS0lj?=
 =?utf-8?B?bnYyZUlFdmlPYm16RENaM3FHUDltTE84RzhPZkRvQWpiWTNTUU54Z3ZER0RZ?=
 =?utf-8?B?TDY3RFZoLzl4NHNyd0d6djFEMWprQW5XQkRiYmVmb2hsUjBxeGtnWHkwaFBt?=
 =?utf-8?B?NmY5TU9sbGVHMFJQUVcvL09pMTFvaFlLeW9ZSVdFN3JGalVSQ1JRWnhMQytq?=
 =?utf-8?B?d1hkSml5eVNWWVNNeEQyZjRYMVFhQ3JVNGxjN0JpeDk5SVkvOWhZcGswMG1k?=
 =?utf-8?B?QUljWStUSEZ5TkU2Rmp1WEIvQllOdWJCK085d1JEUXdHMnM1cUpjTUovYmdk?=
 =?utf-8?B?T2JYZk8zSlpxbUJWOXovK0cvelhJS2pyN1c3aWNLOEtvUnZqam1lNkVkTG9u?=
 =?utf-8?B?R0RPamxqUVRWek1ZUXZPU1ZWYTdndGhxc2grZnFNREpScklmTWRMMkpSM056?=
 =?utf-8?B?eTZOVGlzVTBHVWN4dlFzZG1uaFlodEsrNmhyMjY5YmRBZ1g2TXAvQkZEcWFr?=
 =?utf-8?B?bmFYeWxrcmNuQmUzK3lkVU9odXFxbGFoRW1RNnF0aHAwUWw5QmExWlZlY1ZH?=
 =?utf-8?B?bm10WnhySWJXLzhiRW04YTh4Mkxzbk84NkJWWjEveUc3cXlNWmphWTFvcWFa?=
 =?utf-8?B?ZkdORkVmNmpmaHhiVjh4LysyeVZiOHJKS2RGUk4yZU5FZ3FKRDdHaXNFT2kx?=
 =?utf-8?B?d1pNV0FzTnlvU2N4K2ZhUWlnbHFhMGpZWUk5eTJJMUJKSGw4Z0YvVFRIVk5X?=
 =?utf-8?B?UmtveFFDcUhuOFZiTmxJYndFTjJQRHVDSkdsWDc1WkRNVlZwb1lMK1phZHYw?=
 =?utf-8?B?M2xhczMrN3MxNHJEQndjQXNvQmE5YkNCekp4R0Q3elcyZWRCWXdWVHN1bnM5?=
 =?utf-8?B?a0ptNlI1dEJQTENxdnZERVRnQndWY3I1STNVd0NoRXBtWDRlR3UxeWx1a1Y2?=
 =?utf-8?B?b25BK0o3ZEVNU1JJOEVZakpiWktrWEx3Sml5b3B2bkplbnFQNExnZXhvSFM5?=
 =?utf-8?B?Y1FnWjZSd3VnalowanR3SjJYRmJJb0E1dS9hZmFsalN0N3c3RmdXdDFabHZF?=
 =?utf-8?B?clZOMVp5NDY0dnlPdS9Vcm15MGJPV2RRSkFHR0FiQWhsdXdSNTYzdVVDY0JW?=
 =?utf-8?B?amR5eGZXcjk5bzRycUNiQlBxalE3Wk9TSm43QzBpZDEvOTkvb3RCcUwzUXJn?=
 =?utf-8?B?aDRuT3llRjZVR0tsaHZxMElFcEhlLy94aE5EQmcvU1VPdnAzUVdLZ1RMWUty?=
 =?utf-8?B?YVphdmFjaHlWcnIvT0hJT3NuQlJTTmpKNUM1TlAxTjdYQmZxWjJ5dlFzSjFm?=
 =?utf-8?B?OXBFUjNLdElCQllvMUwwMjNJbDJKSWMvbW5DcGN4UktaTjM4YjRKM0NTYUhC?=
 =?utf-8?Q?nMOmgsuhB3316k4rXaC8xVeWXlnCepK/f5FyBnETgOB7e?=
X-MS-Exchange-AntiSpam-MessageData-1: 6nRkp30S4RhFHw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c58a98-6101-4304-ca20-08de62458f56
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:26:43.2466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtQoSvQPQI8P73aUxS3sAYjyVNMKYP4LyPzpBs+7h9PCB3Au78uGHSlT6U0FqFGj2YK/0sG+cSRnFK9IzHY3sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7151
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:webgeek1234@gmail.com,m:kekiefer@gmail.com,m:jja2000@gmail.com,m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 863C2CADF8
X-Rspamd-Action: no action

On Wednesday, January 28, 2026 2:57=E2=80=AFAM Aaron Kling wrote:
> On Tue, Jan 27, 2026 at 4:32=E2=80=AFAM Thierry Reding
> <thierry.reding@kernel.org> wrote:
> >
> > On Tue, Jan 27, 2026 at 01:12:54PM +0900, Mikko Perttunen wrote:
> > > On Thursday, January 22, 2026 2:08=E2=80=AFAM Kurt Kiefer wrote:
> > > >
> > > > > On Dec 8, 2025, at 8:23=E2=80=AFPM, Aaron Kling <webgeek1234@gmai=
l.com> wrote:
> > > > >
> > > > > On Wed, Nov 5, 2025 at 3:28=E2=80=AFPM Jasper Korten <jja2000@gma=
il.com> wrote:
> > > > >>
> > > > >> Hi all,
> > > > >>
> > > > >> On 11/4/25 19:12, Aaron Kling wrote:
> > > > >>> On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding <thierry.=
reding@gmail.com> wrote:
> > > > >>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> > > > >>>>> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierr=
y.reding@gmail.com> wrote:
> > > > >>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4=
 Relay wrote:
> > > > >>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
> > > > >>>>>>>
> > > > >>>>>>> Without the cmu, nvdisplay will display colors that are not=
ably darker
> > > > >>>>>>> than intended. The vendor bootloader and the downstream dis=
play driver
> > > > >>>>>>> enable the cmu and sets a sRGB table. Loading that table he=
re results in
> > > > >>>>>>> the intended colors.
> > > > >>>>>>>
> > > > >>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > >>>>>>> ---
> > > > >>>>>>>  drivers/gpu/drm/tegra/dc.h  |  13 +++
> > > > >>>>>>>  drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++=
++++++++++++++++++++
> > > > >>>>>>>  2 files changed, 219 insertions(+)
> > > > >>>>>> What does "darker than intended" mean? Who defines the inten=
tion? How do
> > > > >>>>>> we know what the intention is? What this patch ultimately se=
ems to be
> > > > >>>>>> doing is define sRGB to be the default colorspace. Is that a=
lways the
> > > > >>>>>> right default choice? What if people want to specify a diffe=
rent
> > > > >>>>>> colorspace?
> > > > >>>>> I reported this issue almost a month ago. See kernel lore [0]=
 and
> > > > >>>>> freedesktop issue [1]. The pictures in the latter show what n=
vdisplay
> > > > >>>>> looks like right now. It's nigh unusably dark. When booted in=
to
> > > > >>>>> Android with a tv launcher that has a black background, as is=
 default
> > > > >>>>> for LineageOS, it is really hard to read anything. Is it corr=
ect as a
> > > > >>>>> default? Well, cboot hardcodes this, so... presumably? It wou=
ld be
> > > > >>>>> more ideal to expose this and csc to userspace, but I'm not s=
ure if
> > > > >>>>> drm has a standardized interface for that or if tegra would h=
ave to
> > > > >>>>> make something vendor specific. I think that would be a separ=
ate
> > > > >>>>> change concept compared to setting this default, though.
> > > > >>>> The reason I'm asking is because I don't recall ever seeing "b=
roken"
> > > > >>>> colors like you do. So I suspect that this may also be related=
 to what
> > > > >>>> display is connected, or the mode that we're setting.
> > > > >> I have tried it on both a MacroSilicon HDMI capture card and an =
Arzopa
> > > > >> Z1FC 1080p portable monitor and run into the same darker colors.=
 Both
> > > > >> have in common that they use HDMI which seems to line up with wh=
at Aaron
> > > > >> is reporting. I do not have an eDP display to test or another ca=
rrier
> > > > >> board with a different display out to test.
> > > > >>>> It could perhaps
> > > > >>>> also be related to what infoframes we're sending and how these=
 are
> > > > >>>> supported/interpreted by the attached display.
> > > > >>>>
> > > > >>>> All of that is to say that maybe this looks broken on the part=
icular
> > > > >>>> setup that you have but may works fine on other setups. Changi=
ng the
> > > > >>>> default may fix your setup and break others.
> > > > >>> Do you have a device set up so you can check? Or does the regre=
ssion
> > > > >>> test bench have a display that can be forwarded?
> > > > >>>
> > > > >>> My current setup is a rack of units plugged via hdmi to a kvm w=
hich is
> > > > >>> then plugged to a pikvm. I also observed this issue before I ha=
d this
> > > > >>> setup, plugged directly to a 1080p monitor. I have not checked
> > > > >>> displayport. I can cycle through a couple other displays withou=
t this
> > > > >>> patch to see if I get any other result. I am fairly certain I h=
ave
> > > > >>> consistently seen this issue since I started trying to work wit=
h
> > > > >>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it =
work to
> > > > >>> allow for a bisect.
> > > > >>>
> > > > >>> I am in contact with one other person with a tx2 devkit, who
> > > > >>> replicated the issue when I asked. Who plans to reply to this t=
hread
> > > > >>> with setup info later.
> > > > >>
> > > > >> For reference, I am said person. I have a Jetson TX2 Devkit that=
 uses
> > > > >> the P2771 Device Tree. I'm running a Fedora distrokernel with no
> > > > >> additional patches applied by myself. I have personally noticed =
the
> > > > >> issue to at least be present on 6.14.5 and 6.17.4.
> > > > >>
> > > > >>
> > > > >> I'm currently not at home to take screenshots with and without t=
he
> > > > >> submitted patch, but will be able to do it tomorrownight or frid=
ay.
> > > > >
> > > > > Any further thoughts from the maintainers on this patch? As far a=
s I
> > > > > know, this is an issue for all users, at the very least on hdmi.
> > > > >
> > > > > Aaron
> > > > >
> > > >
> > > > I can confirm that I have the same issue on a DisplayPort output of=
 t194.
> > > > IMO, this patch will need to be reworked a bit to enable the CMU fo=
r this
> > > > output as well. I hacked this change in for DisplayPort, and then i=
t
> > > > functioned as intended there as well.
> > > >
> > > > I've traced back to the reason this is necessary. The DC hub driver=
 is
> > > > applying an sRGB degamma for every RGB plane (presumably for blendi=
ng),
> > > > and then nothing reapplies the EOTF later on. Without gamma correct=
ion
> > > > in places where it is expected, images are going to look "too dark"=
.
> > > >
> > > > Which does raise the point that there is an alternative implementat=
ion
> > > > where we do not degamma RGB planes in the first place. But this may=
 have
> > > > unintended consequences when it comes to composition.
> > > >
> > > > The SOR does not appear to handle YCbCr outputs at this time, so en=
abling
> > > > the CMU assuming an sRGB EOTF seems like a reasonable path here, to=
 me.
> > > >
> > > > Kurt
> > >
> > > I tested this patch locally and did some investigation. Can confirm
> > > that on my Jetson AGX Xavier, this patch (or disabling degamma) fixes
> > > the color output.
> > >
> > > The colorspace the display expects from the incoming data is specifie=
d
> > > in the AVI infoframe. This is generated in
> > > tegra_sor_hdmi_setup_avi_infoframe, which calls into
> > > drm_hdmi_avi_infoframe_from_display_mode, which leaves a lot of field=
s
> > > set at the default.
> > >
> > > Currently we're advertising:
> > > * colorimetry =3D no data -> for HD resolutions, use Rec. 709 primari=
es.
> > > These are the same as sRGB.
> > > * itc =3D false -> NOT IT content.
> > >
> > > My understanding (based on some LLM research and otherwise) is that
> > > this is likely to result in the display expecting Rec. 709 colors wit=
h
> > > Rec. 709 gamma. sRGB gamma is slightly different, and setting itc =3D
> > > true would hint the display towards using sRGB gamma.
> > >
> > > However, what seems clear to me is that the display would be expectin=
g
> > > nonlinear data, so enabling gamma conversion at the output LUT seems
> > > correct to me. So this patch would be a clear improvement (with the
> > > fixes already discussed).
> >
> > I think ideally we want to hook this up to the DRM color management
> > facilities, so that it can both be properly reported and configured
> > at runtime.
>=20
> That would be ideal yes. But I don't have nearly the knowledge of DRM
> or nvdisplay to wire this up. Is there someone at Nvidia that can make
> time to do so?
>=20
> > Obviously we also want to make sure that the output pixels match what
> > is advertised via the AVI infoframe. Looks like there's concensus that
> > enabling the output LUT is the correct way to do that.
>=20
> If more fully featured CMU support can't be done in a reasonable
> timeframe, I can address the earlier review comments and coordinate
> with Kurt to replicate this for DP, then send a v2.
>=20
> Aaron

The DRM color management stuff should be mostly orthogonal to this, so yes,=
 we should go forward with this patch.

Mikko



