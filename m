Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC52C982CA
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3052810E41E;
	Mon,  1 Dec 2025 16:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5mntMMkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013065.outbound.protection.outlook.com
 [40.93.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED43010E41E;
 Mon,  1 Dec 2025 16:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GenN8atZcE+DMn42Gn9j2E/RHzFVnDsGa2JxleKbINBbayqk0AwuMzdcvczKnvqA/VyWQyLSpb0mh/CDkrTlobZq9c5hVC5mIu3TCptNoh4RbeFT/HQSE5to0myWc4Kv9B92VHBnUqvorkYxyOgHe/sRX01QhJKqFL0XydoVhlq0Hz0ucsE/Av1yMugfttfXe887dDUUVjzU/Pc2TOjOA1By0irVAuIpeaGV5dNZMwHfJI2DJ6rjpKSQifYWmy1+fYQNFdwbvAZMisTLSDqbG9tcocTWjfvmqKdC1k/DVeAkpRR+l/OayOupLBDuUe3RjQLKDfoCce1UJJ0qAiHL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouIssKKDOoHdi0CVRAJL89xLAvumwbYjDt6EQnkoXa0=;
 b=nRQKjXF76IIv6YAVpoQHX3Xq2upeRKbS23Ln2TYiBFApMIx/jnZGd8ffS+1ucGfaHPKLApgE/aWl5+rd4d1OdvOh/4GCXZc3Bhdxj5Z1GMtKKPaPgifZ8pKLfI3TsrZA56QWiBEfJ8Z5Wcz9vFvQSI9EZBdYaHtRZ3J3T/SdQ94lC+wE/bTXv07D++on6/Aj2w1Vv8q6q00HgoiJlXMnywncH9+sjr2YtHGLmXUu4hUoqZclwDdSx+fvEY84d8HiiauGY0rofgPt6bmxAE2lyxfMShEJ+mnSTscFw23/Ag964QBkjy5Rh7M+DsdP9s2MOe59fpD2fza954PseKKmPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouIssKKDOoHdi0CVRAJL89xLAvumwbYjDt6EQnkoXa0=;
 b=5mntMMkrn4j9m6+20VjNVp9XQ8FmsYJ2uS/PvumcyyZFChoO37WIvYdsCa8Ijmch/EnU8/kshui4kAnU7NUyYzFK8r0icDKF3nIBXulVn6lERVC778rSN6efsxpGaJJON3zCyQzEI6tPHi+5zw1zMUCf2WlfFeLKm6szh5BGwTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:07:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:07:01 +0000
Message-ID: <4121e5a3-2fde-4867-96a4-bf06e2c7150d@amd.com>
Date: Mon, 1 Dec 2025 17:06:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dma-buf/dma-fence: Add dma_fence_check_and_signal()
To: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-4-phasta@kernel.org>
 <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
 <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
 <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
 <8eaab4c04fad84bde279ee2cd228fac4f84c5184.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8eaab4c04fad84bde279ee2cd228fac4f84c5184.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0362.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b40eb6e-2e91-4238-6eef-08de30f3a972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm9HNzZDbHhTOGUxUUlKalIzaFpPc3Z4bGhBZlhyWmh3Y3RGcmRWWDN6Tjc5?=
 =?utf-8?B?UDJNeHNSR2laV2FVREhuQ3NuVi8weVpxYkt5RmVvY2l4VUE2eGhjVDFlUWlF?=
 =?utf-8?B?eWtXR1pOTENEVUU3VnY0RHZpWkl3Zm1DRUxuRjltSXJNNkMxS05hSlRkMzIv?=
 =?utf-8?B?ZE1QRXk5U3R1amtYTkFVNDFYOWhNMDBPTXVBbWkvN2F2VGNQVTAxeUdhSjRT?=
 =?utf-8?B?eEt0QWY3eGNJQnpRYU9iaFBSN25mUHE5NTRFdXF4dGhidjFoYitBVnNPTW5N?=
 =?utf-8?B?R1RoaUJiUnEzMmhwMUlwLzl1ZkF2K09mVy9QMXV4MTRlcFJtdHhieklrQmpL?=
 =?utf-8?B?NXF0cWpjZks2MlRrUjZ6QmlmTm5jOWN6alo3Z1MzZmhMUjN3dWJ5bXdDbEVt?=
 =?utf-8?B?OW5IUVk0dmRrY2JlcVA2clpBWElSK1dPcjVXQnRnSll2UTdVT1BTeDhkQlhn?=
 =?utf-8?B?MFhjN0JmTnNBN1g4ZXJLUGRxczFMUmxUZkUrTEk4Y0RuVEowTFlIL0hBZ3l4?=
 =?utf-8?B?TW9pNk92dXZscHZrOXQ3VHBmNlBOeU9vTGVhUitpT29UUGt1NHZmU2VtTUhv?=
 =?utf-8?B?bC9BaGFERnV5eWxoZ0RjNDVVSWRIYkhScDAxWkUwT1ZYdjBQSnJTcFp1VnFu?=
 =?utf-8?B?U0FjbEdnd21JNlcvUFlyQzVFdGRTRmsyNDBrYlNlVkdyaVNRNktobk9xamJP?=
 =?utf-8?B?WC90M0dqbjljK1ZwYnFwOHZXcE9lWDVGU0FpSlVtMEtHZFk5ekFlUmxSNG45?=
 =?utf-8?B?OGhRV2xJZ3NRZUdjeTVabkFvQkVuUHg5MlVkZi9vYjArTmIzNjJlR3dISVNp?=
 =?utf-8?B?aHIwdkFTUU12ODZ4YXRRNVlYZlNkazBic25SNy8ydUNVT3JZb3drTlFEcE1T?=
 =?utf-8?B?REZORnlvZjNsOFVVTkUxL2hQN3RtWUd3VytNSjlqYjRBUmk1M1BvRFVDTloz?=
 =?utf-8?B?OXUvdmFDSlZheHIrQWo2dkFLaFdmdmZIVHNZWmpEMktzbGc5U0dsMitpZVhL?=
 =?utf-8?B?T0FuMU9HSDBpQnR3M1lhaGh4b2VxVVl1NXM1Wk9peVpzVmZDQjBqQ0NTWVNC?=
 =?utf-8?B?SmFiT2p2T3BYQUFHK2t5dGQxWm5RZ1FESDQvbU5jajlUalpZMmRXb1ArTkFM?=
 =?utf-8?B?cGNuTVlvNzNrZittTUprd3ZVOFpFWFVUSjNlaEQrYXhuM01pbEp2a2VtVHJC?=
 =?utf-8?B?M2o3QVBYRkpHczBrOWpoQ3FUUUtYTmxWNnBReXJMQWlhVmcrRmtPbjJkUm1W?=
 =?utf-8?B?Ny9mbmZoMUR2dUtTQXF6N2s3REdhU1JnTnNYM2hkNTlNSkd2eE9mRUtFTzNz?=
 =?utf-8?B?UjFyMmdwTnc0U3RyUXRZZCtQaU1kazgraUlCSGtubmIwazIzeEJHZzJnRGph?=
 =?utf-8?B?eXByUEN6K2pPZnVMRWkveFl6OUNNa2FSZ1ZVRHhkRXRKTXk1TzVqdFBWQXVi?=
 =?utf-8?B?cjRBYXhxcklyb2ZGK1JzQitlaDZsUFhkTEQ3a2hpUm9mZnE1MVVXekwxcC83?=
 =?utf-8?B?azJJY3JxT1FJTXVXYnd4OXFXUUthWmduS0dyK29ENE5relZTdGc5Zkp3S0to?=
 =?utf-8?B?K2V4ejkxMURmY1pjc2FHZm9YYTZRKytaQXE4TUZiREtVU3ZoTHJpRlp2aWhT?=
 =?utf-8?B?V1ZRK3JvcEJMVWhlVC8xc05ncS80YkI2em85SFNDbmpWOXhWeXRMeUtjTWp5?=
 =?utf-8?B?NWJPakVONVZESVUwQkxpcmtKbnBBMU4xVnVDRDhNTnZ3dEI0VUM2YW82bkNG?=
 =?utf-8?B?M1QzazZod1ZyeFJJNTJlSFNOV05FdXpsL0ZsSEwyWHZ6b2p3RFVQWUZkQWpG?=
 =?utf-8?B?eUZNUVNhbjFhTlRGWjJ0RmpTWHpYQnhodnc2RVVMNUw0VDAvNHVJUTJ1Nmsr?=
 =?utf-8?B?ODN1MWQyWnJDSEpFa0h3aHlqdG5hTVFzSDNFd1ZtN3pLamsrQ2N0TmhSYnVE?=
 =?utf-8?B?d0pydnQ1QmsxdkxxdTczaHEzT1djNFFNZ0FmK0s5Q3RpZ2lWWFpRQzBYWkZI?=
 =?utf-8?Q?ApG231yFW5xb3wa+eOLzyzMo8aO/wA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnF1WTBib21rZ01IeWRyV3NRMXJUT0xEdTN2cmoxV21EbDZ2d0ttTUlkcUdj?=
 =?utf-8?B?Y1pqZVlPUjBhT2FuZm5kVHdMNlgrZVFxNkQwY2g1WE1iSnRLN243VmdZWE5G?=
 =?utf-8?B?N2cvdStEaGxvL1k4aDlPRTVCTWtDR05DK0JDUFBWd0taWjhZbDZYNDFnMFYx?=
 =?utf-8?B?V2IzNnNUcVJXMi9hNzh2YnVmc1FxSitRakJBYXJqVVBXUk1PWmpZQjRPajBH?=
 =?utf-8?B?WEcvQkZVMitJMEZJVTcvWENLSHBmK1BFWWo5SUdUVmNGMm5vN3B6TENpWngy?=
 =?utf-8?B?WVRCMlhySmQ1QWNlZXZYR2tSS1lPWDFJRzk4NUxwVUVXRGxWa0Z3WE1GZFdG?=
 =?utf-8?B?OEkvTDRkWTdWMURNeDR5dUkzUXBKa1I4cEh4WnpmY29OSmNKa0Y2WGNGaC9P?=
 =?utf-8?B?MVA2M3ZRYllwTGJyNWpwOXhmWmZtUWtpZXdWU0J3enNMVEJ5a3VlM0EwSXlz?=
 =?utf-8?B?OVliZldYV0c0WXJOVkVldnFCWUovMmJRY3VsVHdhVTJTbHNXbVE1ZXFMMlZL?=
 =?utf-8?B?ZCtGMEZaYlZId3pvdEZFeitYOXlPK3c2d0ZuQkl0Mm5CTzVsRGcyd0t2TC9w?=
 =?utf-8?B?dUV3MDZaOHZJZFNhdm9BTWlhTmJLRmZQTUhnYk1lQzN5WTA3MVREQktKM09k?=
 =?utf-8?B?Rm9BMGprTWhOKzgzMUQrWTV0MzkreHJ0RFFUWFZnM004NytmNzAyVkhTOGVE?=
 =?utf-8?B?ZEc2eGpKSTViT0pBMFpYbzE4Q2laSEYrOGlEd3c0NCt3c3M0TkRxMHV5eWJN?=
 =?utf-8?B?enFIQ1ljdkZRUGc3ciswOVVCaEZaSmhBNkxUcnRyY3B1M0xLUkU4YXA0eUk1?=
 =?utf-8?B?YWRmeFdSejk4MXJOMXZ0RVdjcXdKdFJtNVVSZzN1R3NFcDRCRFM3M09lVzhQ?=
 =?utf-8?B?YWtxeUw1MXBkNVVJMUJXNFRIcVpsRHZ5ZUdCVS8zQUJ1V3JKVk9zcXNEaS9w?=
 =?utf-8?B?K1EwbVNGekhCck02dTJYVStvMERHL2h1dWphUVd1R1MxUEdPVml2SDZBQ09B?=
 =?utf-8?B?d0pwSDk5TStTYThUOGxETzUzUWt5bS9lRkFvVXZxZnJzM0hiK05CM0pZcjc3?=
 =?utf-8?B?OE1PZWpvNDZTWjQzOVgzT3FLV1g4Mm1xUGZ1c0FNT1dhSzk0RVZRQThCUDlG?=
 =?utf-8?B?WDRrcXduQUlNYk4vc0ZqbWd2Snc5WEZRNGh3alllK0xrUjBJM01TZE9VRS9k?=
 =?utf-8?B?RG8wZzVvUHZPTFAzQmRSMVRYZzBkKzJVVlFPWnNET0RXeTVIb0JIaHlpMlhB?=
 =?utf-8?B?TFV5QmREVUQwUlkxZ001elRyc25IZm1obEcwZXpuQXR1KzJta01DZThiKzFV?=
 =?utf-8?B?aGlUZXllOUgyUzNudEZiQzlsWE5aaWJNSnQwaEF0R0xCTy82STQwa3lnYVds?=
 =?utf-8?B?b1Y0ZHVib0NTZXBDTDVxOWhSWVd5YXpLMkNPRUhIUDRjdTRmZEZsZUYzV3pl?=
 =?utf-8?B?V1h3eENQQmNZK2gwL2pXUVl3bmtSN1hhVDBFWVU4RXlVbEE5R3dFeThvRzMx?=
 =?utf-8?B?Y3pDaEFKdlU5R1ZhME04TzREbU14dHpQNXFsYkpwMFU4RzFtdzE4M3lWbUZG?=
 =?utf-8?B?enlyREN3SktGVEkvbDZkSjRjMnBZU08vYjlVT1JpZFdSVVlsdVlZTVVZQlY3?=
 =?utf-8?B?TmdZOU1nWEZJN0ZiSTNQaFlYOE9OdkE3blVJMFNOSFNoZ01LV1dBQkk4OXMw?=
 =?utf-8?B?RTlCYUxpMUl3MEhVWnFVeGRqbjI2SnhWUHZwRldSOGVyazNiQkI0SHYxSHdB?=
 =?utf-8?B?dHBMS1BoTkE1T3JjNUdIZ2piMTExQUxFTW1ZV253QmRkM2pzUFFNN0o0azRF?=
 =?utf-8?B?Tm5QWHljV3hJMW1zU1ZOT2xxM3htcXdyYy9qczRSZ0FGVnQ0Y3BSWDBNSWVC?=
 =?utf-8?B?aEJTNGpYcGx3WU5lT003eWVFam1ITkV6ZUpHRVlnRFd5TDhsZ2NUZ0g2VmlR?=
 =?utf-8?B?K2FMaHBSOXQ0SE56cE04Mkx3K3lpOFpZWURuRkhaVWJud0VvamlmSndGdFFZ?=
 =?utf-8?B?SmxkbVN3dG4xYVFXTFlWdlh4eW9OMVdyLzlqUTg3Yld3Nk1PZ25jOEY2ZFY4?=
 =?utf-8?B?T293RXNxZ1VJeEY3WTZNMEFTK0NPTzJiYzVvaGx6ZjVGSHFIby8zNUlIUEg2?=
 =?utf-8?Q?quWBAr5UTWFMoA+1pe9zzUIaZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b40eb6e-2e91-4238-6eef-08de30f3a972
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:07:01.4027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9RT8gbc2oQbenl5tySk1VeajNNhaO1QhuecTDrIff+GbCyZ9XZnA61OXId6wi3R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491
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

On 12/1/25 16:34, Philipp Stanner wrote:
> On Mon, 2025-12-01 at 16:20 +0100, Christian König wrote:
>> On 12/1/25 14:55, Philipp Stanner wrote:
>>> On Mon, 2025-12-01 at 14:23 +0100, Christian König wrote:
>>>> On 12/1/25 11:50, Philipp Stanner wrote:
>>>>> The overwhelming majority of users of dma_fence signaling functions
>>>>> don't care about whether the fence had already been signaled by someone
>>>>> else. Therefore, the return code shall be removed from those functions.
>>>>>
>>>>> For the few users who rely on the check, a new, specialized function
>>>>> shall be provided.
>>>>>
>>>>> Add dma_fence_check_and_signal(), which signals a fence if it had not
>>>>> yet been signaled, and informs the user about that.
>>>>>
>>>>> Add a counter part, dma_fence_check_and_signal_locked(), which doesn't
>>>>> take the spinlock.
>>>>>
>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>> ---
>>>>>  drivers/dma-buf/dma-fence.c | 44 +++++++++++++++++++++++++++++++++++++
>>>>>  include/linux/dma-fence.h   |  2 ++
>>>>>  2 files changed, 46 insertions(+)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>> index 96d72ffc0750..146de62887cf 100644
>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>> @@ -445,6 +445,50 @@ int dma_fence_signal_locked(struct dma_fence *fence)
>>>>>  }
>>>>>  EXPORT_SYMBOL(dma_fence_signal_locked);
>>>>>  
>>>>> +/**
>>>>> + * dma_fence_check_and_signal_locked - signal the fence if it's not yet signaled
>>>>> + * @fence: the fence to check and signal
>>>>> + *
>>>>> + * Checks whether a fence was signaled and signals it if it was not yet signaled.
>>>>> + *
>>>>> + * Unlike dma_fence_check_and_signal(), this function must be called with
>>>>> + * &struct dma_fence.lock being held.
>>>>> + *
>>>>> + * Return: true if fence has been signaled already, false otherwise.
>>>>> + */
>>>>> +bool dma_fence_check_and_signal_locked(struct dma_fence *fence)
>>>>
>>>> I'm seriously considering to nuke all the unlocked variants of dma_fence functions and just make it mandatory for callers to grab the lock manually.
>>>>
>>>
>>> You mean "nuke the *locked* variants.
>>
>> Sorry, that wasn't specific enough.
>>
>> What I meant was making the locked variants the default instead of the unlocked ones.
> 
> Well, no :D
> 
> What you want to do is:
> - Delete / deprecate the *locked* variants
> - Force all users to take the fence lock manually, then use the (now
> all unlocked) dma fence functions.
> 
> ACK?

I'm sick with cold/flu like symptoms at the moment, but that sounds mixed up to me (but maybe I should get a bit sleep first).

>>
>>>
>>> Why, though? Aren't they enough for most users?
>>> I suppose you have all those subtle races in mind..
>>
>> Yeah, exactly that.
>>
>>>
>>>>> +{
>>>>> +	bool ret;
>>>>> +
>>>>> +	ret = dma_fence_test_signaled_flag(fence);
>>>>> +	dma_fence_signal_locked(fence);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +EXPORT_SYMBOL(dma_fence_check_and_signal_locked);
>>>>> +
>>>>> +/**
>>>>> + * dma_fence_check_and_signal - signal the fence if it's not yet signaled
>>>>> + * @fence: the fence to check and signal
>>>>> + *
>>>>> + * Checks whether a fence was signaled and signals it if it was not yet signaled.
>>>>> + * All this is done in a race-free manner.
>>>>> + *
>>>>> + * Return: true if fence has been signaled already, false otherwise.
>>>>> + */
>>>>> +bool dma_fence_check_and_signal(struct dma_fence *fence)
>>>>
>>>> So I think we should name this one here dma_fence_check_and_signal_unlocked() and drop the postfix from the locked variant.
>>>
>>> postfix?
>>>
>>> Well, now, IDK. Can't we, for this series, keep the _locked() variant
>>> so that it's congruent with all the other dma_fence code?
>>
>> Good point. That thought was not really related to this series here.
> 
> OK, then let's progress with this here for now.

Works for me, give me a day to go over it again and review it.

Regards,
Christian.

> 
> 
> P.
> 
>>
>>>
>>> And then later if you want to force manual locking you can add that
>>> kernel-wide in a separate series, since it'll be a discussion-worthy,
>>> bigger chunk of work.
>>>
>>> That's cleaner, and my series here won't prevent that once merged.
>>>
>>>>
>>>>> +{
>>>>> +	unsigned long flags;
>>>>> +	bool ret;
>>>>> +
>>>>> +	spin_lock_irqsave(fence->lock, flags);
>>>>> +	ret = dma_fence_check_and_signal_locked(fence);
>>>>> +	spin_unlock_irqrestore(fence->lock, flags);
>>>>
>>>> Could this use guard(fence->lock, flags) ?
>>>
>>> guard? You mean a lockdep guard? Do you have a pointer to someplace in
>>> dma_fence who does what you mean / want?
>>
>> E.g. like guard(spinlock_irqsave)(&fence->lock);
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> P.
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +EXPORT_SYMBOL(dma_fence_check_and_signal);
>>>>> +
>>>>>  /**
>>>>>   * dma_fence_signal - signal completion of a fence
>>>>>   * @fence: the fence to signal
>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>> index 19972f5d176f..0504afe52c2a 100644
>>>>> --- a/include/linux/dma-fence.h
>>>>> +++ b/include/linux/dma-fence.h
>>>>> @@ -365,6 +365,8 @@ static inline void __dma_fence_might_wait(void) {}
>>>>>  #endif
>>>>>  
>>>>>  int dma_fence_signal(struct dma_fence *fence);
>>>>> +bool dma_fence_check_and_signal(struct dma_fence *fence);
>>>>> +bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
>>>>>  int dma_fence_signal_locked(struct dma_fence *fence);
>>>>>  int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>>>>>  int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>
>>>
>>
> 

