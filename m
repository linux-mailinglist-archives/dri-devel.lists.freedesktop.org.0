Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B179F2E08
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F7110E578;
	Mon, 16 Dec 2024 10:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jJdkNVKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED44810E576;
 Mon, 16 Dec 2024 10:18:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IX48520+MPeJ67QTQ/gXnY9o6IKUWAjOH8NsskwV3t2IH+0Zt34n3dnmZ5+JNNaaVD+fAKLeOnylWjPrnqgKJdlmSxbE8ZP69B44yqp6lPoRVr4knxhR1UVNNtY6xXjg40pSIKE/jz6pv8moSVNLYvY+H9f2tm8jFXSiVzHi6WaFntyxg6v2vYhixNZ3N7l7ZtL3lw5LvfzA4p+fBhsO7Yh7ZQFPQrtqHc7PeNChNp6K8z4R5rf4WqBAhFSztG4lbNbKKNkdGQFGdSAPX9yoC0yx5WNqhg/3csCOoGC5lT2Ec3gKwxUWbCwoUCLBx0z5KIXZOGeGQ2FPCVFUKd7PjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrhmQTi+7wmyj0jJ2UxC8vAjYP7xkMwt994lcTPKEvU=;
 b=qFvCc2BfJ3Z/QOuazS9YmptgkkruIdnqN13eTd5oSq9y/wC/CN5p1i1/SfE5woYaKC8criayvRSzlRJ/4X52Rd2FGGgM2r2j/XPRdehX55P2G0UijEfgRBbjY6HRNc/NHj14bHjXNY/3rpwLr+Hub7Q2hLj/8/rRi1AgfQPXjAZA50unj13eKpcZH5VVSp3pvDUf4h8EBRtmlb19CwbYN/CfEUc3S5Wu/DFk4hwb+r5Om49S+kW8cRBJYb4sDBLYMst677VNyeA7OF83eowLAmN5I+24gb5b6sO08ItobI/RWXbVAXPIaRf44Fm0Ov9oIwEWf3aTci7avv9WkkC0AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrhmQTi+7wmyj0jJ2UxC8vAjYP7xkMwt994lcTPKEvU=;
 b=jJdkNVKUUivJ9FuBPMXXroa03TwfSMkcebdr16krjQdPsTJom6AwICd6ceQPItDcdhpHA3mPTP/yv5yL9CvXKE0V8TNfcTPx9AvstHFzdJPjJi0msV+3BoYuAvvGqIQtLRd33uXDhcqL/lLtRyPYtjJgeEYzoFKdI2HEc2FdYb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 10:18:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 10:18:30 +0000
Message-ID: <28d7dcd8-ed3f-4e52-b7fa-c348a827085d@amd.com>
Date: Mon, 16 Dec 2024 11:18:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
 <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
 <Z1xGe1X_XzB00J1Q@black.fi.intel.com>
 <ed83b0a1-62d1-48e5-ac7b-478be3043733@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ed83b0a1-62d1-48e5-ac7b-478be3043733@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: fb517355-41c8-40b8-0180-08dd1dbafd26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDJrYmkzY1RoUXEvSGlwMnhubExNUDBJQmRUU1RaaHovSjJTTC9CUTk2MXVN?=
 =?utf-8?B?M1lVaXZydXRCM3NNd2NxbXJHOER3YklJUUg3WnRCekp4a3RoK21scFc2cjhi?=
 =?utf-8?B?VzAyTzRBK2dOaWh4WWJUa1JhRVhCZHZSYi9XcktadzJrU1lpcVM3Ujh1WHIv?=
 =?utf-8?B?NVZXTUlGSFhuYVhSOU5MSjNQUTRjdmw3UU4wK1VZVlh1cWZxc3hjYitzUFp1?=
 =?utf-8?B?bk53ZzlSdlNYamRQcHZWRzFKem5nV0xNbmVKeEpkb2NFcWcxYTFLeVREK1VF?=
 =?utf-8?B?ci96M000NExvVTFYdVB2RTJ4WFBNd2M3OFNmNGorMStENjh5UVo0T05NRVRU?=
 =?utf-8?B?TjgwM21IckdJTTVrWEZ2N1VBYkw2VHc4OFp5OWpsNGlNL09KcDgwSVUwR2xk?=
 =?utf-8?B?ZnRNV1ROQ1FqRitxQXVWcmpaZGNFaEpUd3ZuOC9abzRiV2gyd3dPZ2h5SmFQ?=
 =?utf-8?B?RFkzekNiOEhmRVVJb3c5dnd2VFJjSXZnSkx4Zi8wZ2JlRW94eHVoRnNnd0Iv?=
 =?utf-8?B?bTFZaE8rUHZWZHErQWhvcVBySWNOYUlKbnBkS2VIVTJnMXBMUHhHNWMyc1Ur?=
 =?utf-8?B?NDY5VGZFVVlCMnFQKzZ6SmlyNXN0MHFORmtyY1J5WFNobzhGNWR1ck8rd0ti?=
 =?utf-8?B?L0FpMDhyL1JrYnpzcmpmQXEzbmFaMXJpVFNSYlprY0JUTUIvRGJGb0d3YjJk?=
 =?utf-8?B?TWY2NTNDbmY0NExzU0w4d1lBeFc5QWJlTmhGaFg2SnhDMk0yNzhKMWpJajQw?=
 =?utf-8?B?TzcrYnA3dFYvZEp0TWFUenBZa012NysvbTRSK2dVWjZmbjdIcXFUNmFEb0dV?=
 =?utf-8?B?K29rNFBBc3VtMUExU1VzaDBYamdoWW1zd2cxbjBMalU5QVVvMzYrdjNvT3Zy?=
 =?utf-8?B?SVZCVTlhbTNNc1d5NEtyS0Iwcll5RjhrTU5QamZOU3NjOHBubVVmRlRPTXR6?=
 =?utf-8?B?aWdKZ1RNV2ZzS0xOU2ZVMFZtQjZ4ckI5cXh3c0hyT2hMZUlhZXNIYlF2ZGlZ?=
 =?utf-8?B?T1R1bDV3aWFqOW5BSTVGN201V0llRnozdlBOTDBDck5ZRUNjUkRXdUJWb1Fa?=
 =?utf-8?B?T3lRRWlqNU93VkdsQVQwUGpkSW1pQk95MFJuL1kyTklxMW1qRlZZTjl1TjNK?=
 =?utf-8?B?QWd0SnhtaDJ2RFZ5elUvL1RqYmJGdWxNKzNQZy9pMnp3TVRKeHA1MmRDemZl?=
 =?utf-8?B?eEFKeVNHYng3cWlaRk9IVS9SUHRES2NXSHlteTJqQ2c3L04yelZOTWtLMk05?=
 =?utf-8?B?eTl4STM0RFAzVCtqb25zbjl6N0ZkcFVLU295QzV0OStiZTFSRFBzT05zVm1W?=
 =?utf-8?B?bWQzcDJlSEk2by9LS2V2NDdtKzlDdXRmRFB1Uld2MXRjcWh4UmlBMHpyTjZI?=
 =?utf-8?B?UHdPeGkyNGw3QnRvclZnNHcreTBpTGJZay8wejB3ZVlMQmV1QUxIMTdoT0RN?=
 =?utf-8?B?cFluTTNUaEtHcng5OGM0cHp3WVdRZFFEUlRoMmZSdGs4MGluK3AzcGIyTDVL?=
 =?utf-8?B?MVR0MjZpTlNrQkFQbDhjSml6NHFNdzZxM3hiRVYrV01VR0E2Njd5MC9TYk5E?=
 =?utf-8?B?UU5rK0JLWDkwb2hDNC9RQk00NG5KWVpCUkFjLzZmZ0xEMkNpSjJOb20yWDVP?=
 =?utf-8?B?NTNNcmR4RFRNanRKT2xDUGZUQm1YV2ZSU1FxWUZQSUFZOVNEN0VRUnNSc3Fh?=
 =?utf-8?B?UGlORzhhT1dOTHA4NDIzTUdRWEVVOHBoWmdTMUJlYnFvN2NSRkFDc1duNm9R?=
 =?utf-8?B?OWVNZ3cwajFUaXUrZG9sM0pJMkpoLzFsME1aSDFXWm13dU13ZENYQTJ1YkQz?=
 =?utf-8?B?UVZWeHh6MU1waVdvYkFGRjJlTjlVQUlhOC9WY2V2cVM3NDJFaVdybXBReitK?=
 =?utf-8?Q?iX69VmBhUbCGp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUNZeE9IcUpkbnUyb2JiaW1yaDdlTkR4M1plYmc1QlMwU25QWjFWdm1Kb3Ja?=
 =?utf-8?B?RHN6VndNeGNSSXFLUkYyaWUwQ2hRNmllSGd0blh6WmwxMGVNc01OWk81NVhp?=
 =?utf-8?B?TW5vbXR3WE5vWlJGdXB0b3VINGxyamR0aFhHVGxBLzRiQ2J1a1ptRXF4Q09T?=
 =?utf-8?B?YUJaMkY2OURROGo0NjFocTQzVUVaVU9vb1EvQTlqdTYzd2tBWTkrSjVud2RM?=
 =?utf-8?B?YjBXODRmYnlvRXVDZ3RNdUJiYkNEcGNZcTlWUnJjbFR6eUl3R1BQWWVsczhl?=
 =?utf-8?B?ZllnTVVkeThHb1JSdllaeThld1M1ZzFkNWpvb3k1YWUzUkpMenZpU00wY1Qr?=
 =?utf-8?B?Vk40THhSbW9TZm0wM245ZWRMVkZjR2hCWndvWjJuaCtEY1l6M3A3ZEZ3cm15?=
 =?utf-8?B?ZGlpUXd6Z1lHVG1QdXZkNGlKVkpiYVJ3VzRFVmxrZEJhRXNEQ25aWHp6Y0JH?=
 =?utf-8?B?UGJicENobG9jZVVEUTV4NXI3N21MTTdoYkhkdFRENG9ieTFxcXRLVVVDaWdq?=
 =?utf-8?B?VThMbUFyc2RoaVV5cWZrRUl5TnExZ2ZrVG1wWXpQZm4yOW52eEprVEVMVFhy?=
 =?utf-8?B?OVlYMlExV1VQNTNJQk04WmtGWW0vQlJNV1pFc2JsZ0JZZGpsaGxxMzV4aWl1?=
 =?utf-8?B?UjJqWDBhenZGbkJZRUxRbW1wQzgrMXdVeUJzbExrWTJxSlUvTldabUl3aW5W?=
 =?utf-8?B?T1dhcUZFZ0E1K1NDaEh4MHd5V0VLM0FnWk80cnJ2blhsMldIc3hRb1lMYkhz?=
 =?utf-8?B?S21pN3hoOU5sRUVyWDhkQ0huaFZTaHNoa0RxR2dxTHgvTnU1NUlHZW94dlpL?=
 =?utf-8?B?VkRreGlzQldkV2xaTnBrNDRZY2ErL0NUeW1ROFlHbVpsMzhJL25rbnI1M3or?=
 =?utf-8?B?ZHdDczZrTGVYSTNWSFkvUDZHQXdLRTBvRklNQURid1B4T1JzQ1JMNDNzaHdm?=
 =?utf-8?B?amVqbFl2bUpHZmNGTzZjQ1A5R0xiQUhNZDBoYWY2a2tVamJsVDZRdUZKcE50?=
 =?utf-8?B?OGNnU25UN2R0cXJvUXFWdkJkOWpTd2lUbEJMLzl0TTFQakJnTXlZSEZGNWZJ?=
 =?utf-8?B?b2JZNmM0ZDFHeFFmaXNwemR5ZTBoblRqZWpyRkZEVzB1UlRpd080TkREZ1hX?=
 =?utf-8?B?UUcvdSt2L1IyZm40eitxdDFZT0Q4OWFoYnVsamh3UWoyQWRCSmNVMU92Z25L?=
 =?utf-8?B?SG16ak1hU1BVWmtoNTZPWVFGYUxJWUFuNGYxNnFDRWl1L2ZhdlhoN0xLUXhk?=
 =?utf-8?B?MUp6RGI2K3RVcHNVYVdYN2Z5TFBBZkRXWlg0Yi9BeUVOQmtkckMrSXRNWHo1?=
 =?utf-8?B?aEVWdlUzbUFjT3U4Zi9iM0pxNkc1Y3FwSEhoWTkvTU9vRzZYSFBxRGVTZ0ZV?=
 =?utf-8?B?ZXRldWZqNGxPU1RnOHhiaGV5aTJvRVI4dXRGc3k1SW9nb3BaRm1VcmRHb2xr?=
 =?utf-8?B?U0pxQVI5eTdNd2xNdHZlRHFEZk9LbkdoRjFEQnI3RmZwTEhsOGFWM1d2RXJ2?=
 =?utf-8?B?dDEva3NuWTUvMWY1NXBDVG9DWVZkZ1ZSeVhMc0VaVHRzZERUV0ZsdlBhYkp0?=
 =?utf-8?B?V093bSt6c2hQREMvNzlBR1BYMW8rSzZieVEyMzk4cG9sZnY0QVBIcG1FSXdE?=
 =?utf-8?B?VEs2d2Zxb1c0R1QzVURuWmdJNnVGL2RVV1NvU3ZXM1R0aTRJdk5PT1VFOXM5?=
 =?utf-8?B?WEZ6ZU1iS0ZneTBZMi9GVkRvS0U4UGRibDNiMFFPNnpucEcxUkVvMUVrblNE?=
 =?utf-8?B?YlhaSjBpaW9MQ3laU1Mrc0hSRjFRS1NHV294ekN6QWhTbnhOalQ2Z0p1SUJr?=
 =?utf-8?B?L3F4Ylo2TkQ1Vlo1OFJZUjQ0MXRmNTM2QWtrMmZKalV1N3JVRnVJb3JQWEdJ?=
 =?utf-8?B?NXRoZlFkUXdNSk9OTVQyVzhENWljNHVGc0tsTktUUVE4dlAvWUswbHdFOHNp?=
 =?utf-8?B?TktTcUdBSTFzVnQ3djIrL0RlVEVDYlBSWXVnSW9pRkErZDB0NEc2VUd1S0ZI?=
 =?utf-8?B?UElDemlRbGVWSGZyc0pTeXhWRkx5WjNJWk9rSnRRL3JiaVJTUXRMVGZtYmxI?=
 =?utf-8?B?aEU2UXFYSnB6eWtnMTBQYm4zUUc4MU9MTWVOZm8vTW9BU3NUd2w3OUV1bElO?=
 =?utf-8?Q?Wxq4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb517355-41c8-40b8-0180-08dd1dbafd26
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 10:18:30.8672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPdRpDE2a5HXr6ZhpIpl50MHU1wD8WgO0XjQhWd3oLaiPFkeDyw9c+w4WjRIyRs+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140
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

Am 13.12.24 um 16:56 schrieb André Almeida:
> Em 13/12/2024 11:36, Raag Jadav escreveu:
>> On Fri, Dec 13, 2024 at 11:15:31AM -0300, André Almeida wrote:
>>> Hi Christian,
>>>
>>> Em 13/12/2024 04:34, Christian König escreveu:
>>>> Am 12.12.24 um 20:09 schrieb André Almeida:
>>>>> Use DRM's device wedged event to notify userspace that a reset had
>>>>> happened. For now, only use `none` method meant for telemetry
>>>>> capture.
>>>>>
>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>>>>>    1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> b/drivers/gpu/ drm/amd/amdgpu/amdgpu_device.c
>>>>> index 96316111300a..19e1a5493778 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct
>>>>> amdgpu_device *adev,
>>>>>            dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
>>>>> atomic_set(&adev->reset_domain->reset_res, r);
>>>>> +
>>>>> +    drm_dev_wedged_event(adev_to_drm(adev), 
>>>>> DRM_WEDGE_RECOVERY_NONE);
>>>>
>>>> That looks really good in general. I would just make the
>>>> DRM_WEDGE_RECOVERY_NONE depend on the value of "r".
>>>>
>>>
>>> Why depend or `r`? A reset was triggered anyway, regardless of the 
>>> success
>>> of it, shouldn't we tell userspace?
>>
>> A failed reset would perhaps result in wedging, atleast that's how i915
>> is handling it.
>>
>
> Right, and I think this raises the question of what wedge recovery 
> method should I add for amdgpu... Christian?
>

In theory a rebind should be enough to get the device going again, our 
BOCO does a bus reset on driver load anyway.

Regards,
Christian.
