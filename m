Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA349AC9C7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 14:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB6B10E7BB;
	Wed, 23 Oct 2024 12:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UTivm5Iv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2908210E7B9;
 Wed, 23 Oct 2024 12:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biMlUWx6pDx68Cz3w0G7Z29Jr8cA8gduluyU/NnLJCT9hIXo4o063hf1K4jdRorAwYSsqj++RrceuzO3JNlVeQ/G/uud23bO/7myJbw+4mrz3UcbQpEhLWqEAiYPHQH23wR+hM2OaOC0KKKt240LwJ59wPEY9LGaZRfzma2kP/lacPdQ0M+KSWTW0bQ/01rPx1Y776El9YrhZyW4mezDgg6FbpB9Ubj1BX+LYi5duMgp0mO+cVO6S6YLb08S/B0sF66E88kYv+ZwuTzVGc2T92ePHajVVC8mBgBeLuIgVd9QFfA14Z7+DLeYkooU7fmMdlTv3L9nQtzK9GwMcP+GRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtgzQz0j8KVG5mWhbeIxVN+6UzIfhc7nu+uFwyveY9o=;
 b=tOjEweG8FkB10uIDxLkESUEsEWQbbKnGDIJfa/mF9RmdIJWqRym3c+Q9sZc+aP247FMVuyxbdeEoA/6n1+mQ9DV4AbaFIcUMWpQNLekq2/3+pZvqP/+qgnjPsInaRCip6uNdrHIZXDOz5NaURG05ZL19ryHyXRdxFjR3FRz4fkdb9Lfy2rFZZYOuqLYoJ9kQs4y6/wuhlrUyfWW/jeEzkw3qjoUAhrVtbRLkutNqzBYpxFL1UoMDkluVSn+mXsH7ouI1cvYcvXSCRgDoreM/7RGGp5HZyT9BVs19OMtIzQPn4fwP6/Nq7mD4jnJW84f4eNVcm/gvK+yvsB72ujuL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtgzQz0j8KVG5mWhbeIxVN+6UzIfhc7nu+uFwyveY9o=;
 b=UTivm5IvKdGYQilFmphOcg9VPA8hv82h29dpWCYzd8kp6AZ7orYM/tWu3wYreWMY6yv+FXhDHp4VQWY5yoFa0ponb1SMgH/5b3TTYJ8X++Bsr2b3USqxy66TGZ4eU53bjPmXXRKMDa7rJC9zkfr+/4Hdy8Y2jIULZBJJmqfiK1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 12:12:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 12:12:49 +0000
Message-ID: <7503c3fd-deea-4eb9-9324-ab4f13f70332@amd.com>
Date: Wed, 23 Oct 2024 14:12:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <cd2b57c6-1947-4dbd-bae8-ecdb2b42de72@igalia.com>
 <47e4b79b-2c08-4ee8-b472-5482bc159856@amd.com>
 <6d324aca-76fd-420b-9bae-6c0984e659e1@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6d324aca-76fd-420b-9bae-6c0984e659e1@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: ca56bd58-20b4-43b9-551b-08dcf35c02d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUVzNGY5ZmFPczIrTXVsNXkybzVINGhPZWQ2TlVnWENWWUlUalhTd0dXU1JP?=
 =?utf-8?B?UzdEbVRHdmxGT0ZxWU1kdnYxc0Zqcjl3dWtqMGMyV1h0UEcrYys1ZnZKTjVM?=
 =?utf-8?B?WjJLaVBNVlYyMk9lWDk0S09pMUIxNVpIL1RRUU5talVueW1lSDNpQzJNdGNK?=
 =?utf-8?B?a2ptemZjYXQySjFVYUcrSlJ4SWR0SnVnZlhPTlg1dWdnRXJ4UW0yODhHN1E5?=
 =?utf-8?B?Z09RNnJKTVo5RTJ1RW9Ueld6NHo0b3ZBRndiOGhoaEExVDVUUytCUEJlRG1J?=
 =?utf-8?B?T29NWTQvenMvYnpsTkhWeTVhQ1dIQ2owYXk5OExsalRkcjhzdGIvcm1weDh0?=
 =?utf-8?B?YWU4UWtzUnByR1pUb003cFN3M0Vhb0dlMklEbzlJTlN5Z0tBWDNFTHo4dmJI?=
 =?utf-8?B?MjNKcFhhVkc2YklKWFJrTEtTbmw1VE13WUlJc3BmdE9wbHFmYzg3TkJLc0Zj?=
 =?utf-8?B?cjY4WlQzVm9GYTMyZHhNaFR3NE5naEczb3J5d0FPbXMyQ3BYVGhsaWRtVVJV?=
 =?utf-8?B?TEhNZ1JKOVBaSEVPVUJaV2l2TldIUU1iOFgrNWNPMTJ2ZEdiT2lFdlg1MFZG?=
 =?utf-8?B?SXI4V254WnFNMlNiV2RzaUNQdk42VVNXdU1xaEJwWDRQRlBZODg2SkJjV1ht?=
 =?utf-8?B?bWQ2cUo2bEhBdXBjMmNaZTh4NDVnYkpCakR5UWVtQXFuZEhFb3ZWL21aeEVP?=
 =?utf-8?B?YTJ0R2JWWS84QUxtK2hIOEYwb1lKWDdWOVR0THNtUmxveFMrNG1XaUJPMTVu?=
 =?utf-8?B?NUhGajBKdCtEcEtSa3IzV3VUOFFydjBydEpXbkplL2dublVHWnVsVnVocFVG?=
 =?utf-8?B?dERTZ2JDdGZhT3p3K3hmMG90d1ExTEtRWUd6Uzdlc09NMHBEMTU2THlTT3VT?=
 =?utf-8?B?aUFHTjJGM3hNMG5JWFhVRE5vVEsrTm5MdUc0ZEkvVFJ6Yk5KTVFEQUt4ZFhr?=
 =?utf-8?B?d2IyTW1GMUJxN2NnNmQzZHN3VDBvd3hMM2s5d051bEx4VXRhMS9ob3l0dWln?=
 =?utf-8?B?MGhCUldFTktyMmhSOTFicmVGTnlidnB0Z1BHbDAwZ2Q4cWoxSk1vQ2lUbHM4?=
 =?utf-8?B?a2tQd24rb1N6TTA4d0I4TmNtRUFqNE1vNzdkb2hNZURqWXQySWRNR3YrQzJa?=
 =?utf-8?B?anp1dmxBMU9qaVRyQzY5OTA4cWQrUC96MFdwVnlITnVXZHNGYlh2UUhvdVMy?=
 =?utf-8?B?R3Awajh4SHNKbzhGdTgxOGJZVWRucVh3Sk5XaHpQQ1F3VzByMFNXU0I5WE5w?=
 =?utf-8?B?ZXM2Z0xwS0NDNWd5YUhYbmNETUhtaFp3QjhnVEk2aEtHMHI0cWgwQ3JGYXYx?=
 =?utf-8?B?VFZaSHdwZE1TcjRVSVQvOTBjcjhhaGU5WVBOSXJndGZGZE1WSmdNYS94TFRJ?=
 =?utf-8?B?Rkl4M1R4U2lTMlhjelJ5ZHZrWFpqclludHZPNmw2SisxRzFzMkY4cXhxZkhy?=
 =?utf-8?B?N091bkpMRmhEYUFac0k0cDduMVgxNEE0SVJieU9Bbk12Y2dqNThVVlhjbS93?=
 =?utf-8?B?KzA5L0lJS2JXVVJxMllUOTd4ckRFbFdrbUJZQ0U4Sm9FWnYxRVNIK0QyeVRz?=
 =?utf-8?B?bHNRejQyVUFmSEFXcjFqZU14MU02TVlFVGFIZGRDNG9ScXg3bitqcE9CcXY1?=
 =?utf-8?B?eEFhZCsraytTY3RXaHpsakZnb0FIcGxIRXJqTUF0cXBlNEU5akJkZnl2b0tJ?=
 =?utf-8?B?SkhxNHB0VG5nTFAvNndDVlgwV1JGZVJXMDJneVIrWEREYWZXRmlMZTZSZVI2?=
 =?utf-8?Q?hoWPUZ8Xn0Xwdeu3YL5M/HDIx8RPM2AOn3rl9Vx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzRQZE5GR1VmdTRmOXRkaUxhQWN4Ni85V1hXVW15NUE3VytFSVVKSWxSczNP?=
 =?utf-8?B?NWx5R21NaHhkcS83SExZZEMvdW1DS1ZkbXdXWkhybnVuZDJZVmVKM0M1MDR0?=
 =?utf-8?B?WGxZWVlubkdvcDJESHRvWklRZFdEOHQzVFNIZTlDNWk5TmZZNWJGU2xqblVE?=
 =?utf-8?B?c0NSKy9ielEzNWd4M1BJZnNQYzcwdE4xUElzMWpqSllZamtkWStBZUZFY0s4?=
 =?utf-8?B?Y0NkWTEwQXZablM3Z0p5OUpRQTdJTVdjTzhpdjFkckNreVB2YUpuQVFJRDhM?=
 =?utf-8?B?TzZhNnhIbm81aitnLzlhL3BuTWI5VXRLUlZsMU9nTHVLc1ZLSVdvam52NHYr?=
 =?utf-8?B?bHhYTEVWd2NTV1BhSTMzZ2wwV0N6V0FxY3NFeWhqY0x3T1Nnais2L0xUbUVX?=
 =?utf-8?B?ZVFrYXBSRlBRdmJlM3cyREMycW1nbmlHbVgwdlUrVEMzMkk3RUE5YjdHWVVh?=
 =?utf-8?B?TkZ4QXdGcWtTUFFzaGIyeURnbXI5cDNvQytUbElEVE9VWDZ2WTRwMmN6Sm1U?=
 =?utf-8?B?aXF5WkZrRi9UZi9VZ0t5aEJQZVlOaVlqVWFhQnBFTFd3NWRZaitqT3Rqc0ZJ?=
 =?utf-8?B?Zmx6L3RMcEpFTUhCalc5UTN0VkM0TXJRZFV4dzRlem9xMHpWZ3FhVlRJOXFp?=
 =?utf-8?B?QTlMR1llYjdzYncrZkVaeGpGeTJlZkkvTzRqZ3BkNmFQQTgwTTk5czA3RGhz?=
 =?utf-8?B?YkZwL29UcDRRLzl3aVVSYkpVQVpQRVhidDVlRENZM3kzazkxbGdIamRsdjAw?=
 =?utf-8?B?dnhWREY5QTZEMUo1dGdGaFBKeHdObm02V0JjZzZKNnFTRDlzYUIzcld6dm0x?=
 =?utf-8?B?dDZQWml2QnZWNFpvdFhGVlUzV2JOUW12VTRnK2VTaERjWkdvNElwTW5PYWg0?=
 =?utf-8?B?MkRGWkViUzhlN0JXTDZkYmYzcjZSUDlqVmw1TThNWjFQc2xGbFFHS0tTZTRx?=
 =?utf-8?B?d1pPaE5JbFZFQ2Yzc3FKQ0pVSzAySE5YbTlGSklMbGFGNXIwWG5EYndTMElI?=
 =?utf-8?B?YnBQb3FYNnhaMzdxelV2aVBia0t0K0daaW1YUjBJMlMyQWJSSkdoQWhxSkVS?=
 =?utf-8?B?NUloMnZ1MGxXRTB4MHNDS1FXWGR3MEV3K29ETk5LMGRkLy8yQkZEbjN6UEQv?=
 =?utf-8?B?ajlRRzBiR3R5WDBHMHRMZXR6Y3dLWTRMYUJ5KzdaS2Z6d1NwUG94MWZaWUdT?=
 =?utf-8?B?VnEwNmU1RFFWN1psRlVVN1N6b3pyUnovbXpPc2g2ZGhmL3JNa2hoWXpYN3RN?=
 =?utf-8?B?Mzh0c1FWdmFSZXE0d1pYNjIreXFtbGlQcHdOcEVtYkY0OEtiOXB4THI5SnFE?=
 =?utf-8?B?ZG9NL0tJUkwzeDdFUVRUckxNRnQ0VHFvQjhia0paZjFIOXZucDhESzhnSjYr?=
 =?utf-8?B?WU82V1pZS0VQMEZWVzZxbWs4V29lK2VNalhocHBhY2dScTVCdXUyd3FVTHEy?=
 =?utf-8?B?a0pzWDdlWHcwOEE2Z1hsQ25NQUNyaERmZTg1bFgrVXVyK2xkS0RQempwMXVq?=
 =?utf-8?B?QTZrdVRKdXZoc09hTU51UWhZbGNhdFVYSzJUSDdxZFhTM3VYWlN6SlN2OUp5?=
 =?utf-8?B?Nk5HTEZSK1NmZWpVU05LT1RvcnBaVGlvNlVTQ1VJY1hJTk54KzlDVTI5VjR3?=
 =?utf-8?B?R1V0bG1MM3pTU3hGNElIVXBMaXRPM3E3bmd0ZUx2dDFrVjNiNHlnbGs2YWdX?=
 =?utf-8?B?RFYxWTNRMFF0bUxqMlBYaXVwa2xWcjRBMExybCthbUI2NzBHd2ZPa1JvZEpS?=
 =?utf-8?B?SURzV3J4d2RQd3F5K1ZtYUxoaUdzRk1RK05HVUdwdHBVMHlTR05ETVBvV1Rw?=
 =?utf-8?B?OGlubzJpSjdFeldlL1o0N1B3MUNLck8vcTFoR1ZHY1JnM0JLZkJPNkFiZkxX?=
 =?utf-8?B?Q2prZkhQMVVEdlVaRlRJNWpyeVBjeHdDSzQxc1ZuVzI0Z2VCU25iZGNEWkQv?=
 =?utf-8?B?OVZrS3RjVXFtbkd0cmJrbGhHNUM0UFg3NnhGNVA3ZWlEaXVOT1hLNE1uSGh5?=
 =?utf-8?B?V2JvNiswUnhVVVJ4b3F5Q0tIVU85TkZEWXZtaUxBNHlGVE5DY2ZicE9QYUdu?=
 =?utf-8?B?TTgrc1UzajloK0I1c0dWb1diUytCeG8xZGRMVmJVWXQ0VkUrN2tRK282WWV4?=
 =?utf-8?Q?NTRaK34tXnHRL66jElfkcUYdk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca56bd58-20b4-43b9-551b-08dcf35c02d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 12:12:49.2962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+mesCz6RasVzRD8FWxQwsDwV1ok3jstDHudkzUzQ+zlDJ9Qi3vt/rzqTVF8e7DW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899
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

Am 23.10.24 um 13:37 schrieb Tvrtko Ursulin:
>
> On 23/10/2024 10:14, Christian König wrote:
>> Am 23.10.24 um 09:38 schrieb Tvrtko Ursulin:
>>>
>>> On 22/10/2024 17:24, Christian König wrote:
>>>> Am 22.10.24 um 17:17 schrieb Li, Yunxiang (Teddy):
>>>>> [Public]
>>>>>
>>>>>>> +static uint32_t fold_memtype(uint32_t memtype) {
>>>>>> In general please add prefixes to even static functions, e.g. 
>>>>>> amdgpu_vm_ or
>>>>>> amdgpu_bo_.
>>>>>>
>>>>>>> +   /* Squash private placements into 'cpu' to keep the legacy 
>>>>>>> userspace view.
>>>>>> */
>>>>>>> +   switch (mem_type) {
>>>>>>> +   case TTM_PL_VRAM:
>>>>>>> +   case TTM_PL_TT:
>>>>>>> +           return memtype
>>>>>>> +   default:
>>>>>>> +           return TTM_PL_SYSTEM;
>>>>>>> +   }
>>>>>>> +}
>>>>>>> +
>>>>>>> +static uint32_t bo_get_memtype(struct amdgpu_bo *bo) {
>>>>>> That whole function belongs into amdgpu_bo.c
>>>>> Do you mean bo_get_memtype or fold_memtype? I debated whether 
>>>>> bo_get_memtype should go into amdgpu_vm.c or amdgpu_bo.c, and 
>>>>> since it's using fold_memtype and only useful for memory stats 
>>>>> because of folding the private placements I just left them here 
>>>>> together with the other mem stats code.
>>>>>
>>>>> I can move it to amdgpu_bo.c make it return the memtype verbatim 
>>>>> and just fold it when I do the accounting.
>>>>
>>>> I think that folding GDS, GWS and OA into system is also a bug. We 
>>>> should really not doing that.
>>>>
>>>> Just wanted to point out for this round that the code to query the 
>>>> current placement from a BO should probably go into amdgpu_bo.c and 
>>>> not amdgpu_vm.c
>>>>
>>>>>
>>>>>>> +   struct ttm_resource *res = bo->tbo.resource;
>>>>>>> +   const uint32_t domain_to_pl[] = {
>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_CPU)]      = TTM_PL_SYSTEM,
>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GTT)]      = TTM_PL_TT,
>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_VRAM)]     = TTM_PL_VRAM,
>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GDS)]      = AMDGPU_PL_GDS,
>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GWS)]      = AMDGPU_PL_GWS,
>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_OA)]       = AMDGPU_PL_OA,
>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] =
>>>>>> AMDGPU_PL_DOORBELL,
>>>>>>> +   };
>>>>>>> +   uint32_t domain;
>>>>>>> +
>>>>>>> +   if (res)
>>>>>>> +           return fold_memtype(res->mem_type);
>>>>>>> +
>>>>>>> +   /*
>>>>>>> +    * If no backing store use one of the preferred domain for 
>>>>>>> basic
>>>>>>> +    * stats. We take the MSB since that should give a reasonable
>>>>>>> +    * view.
>>>>>>> +    */
>>>>>>> +   BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT || TTM_PL_VRAM <
>>>>>> TTM_PL_SYSTEM);
>>>>>>> +   domain = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
>>>>>>> +   if (drm_WARN_ON_ONCE(&adev->ddev,
>>>>>>> +                        domain == 0 || --domain >= 
>>>>>>> ARRAY_SIZE(domain_to_pl)))
>>>>>> It's perfectly legal to create a BO without a placement. That one 
>>>>>> just won't have a
>>>>>> backing store.
>>>>>>
>>>>> This is lifted from the previous change I'm rebasing onto. I think 
>>>>> what it’s trying to do is if the BO doesn't have a placement, use 
>>>>> the "biggest" (VRAM > TT > SYSTEM) preferred placement for the 
>>>>> purpose of accounting. Previously we just ignore BOs that doesn't 
>>>>> have a placement. I guess there's argument for going with either 
>>>>> approaches.
>>>>
>>>> I was not arguing, I'm simply pointing out a bug. It's perfectly 
>>>> valid for bo->preferred_domains to be 0.
>>>>
>>>> So the following WARN_ON() that no bit is set is incorrect.
>>>>
>>>>>
>>>>>>> +           return 0;
>>>>>>> +   return fold_memtype(domain_to_pl[domain])
>>>>>> That would need specular execution mitigation if I'm not 
>>>>>> completely mistaken.
>>>>>>
>>>>>> Better use a switch/case statement.
>>>>>>
>>>>> Do you mean change the array indexing to a switch statement?
>>>>
>>>> Yes.
>>>
>>> Did you mean array_index_nospec?
>>
>> Yes.
>>
>>> Domain is not a direct userspace input and is calculated from the 
>>> mask which sanitized to allowed values prior to this call. So I 
>>> *think* switch is an overkill but don't mind it either. Just 
>>> commenting FWIW.
>>
>> I missed that the mask is applied.
>>
>> Thinking more about it I'm not sure if we should do this conversion 
>> in the first place. IIRC Tvrtko you once suggested a patch which 
>> switched a bunch of code to use the TTM placement instead of the UAPI 
>> flags.
>
> Maybe 8fb0efb10184 ("drm/amdgpu: Reduce mem_type to domain double 
> indirection") is what are you thinking of?

Yes, exactly that one.

>
>> Going more into this direction I think when we want to look at the 
>> current placement we should probably also use the TTM PL enumeration 
>> directly.
>
> It does this already. The placement flags are just to "invent" a TTM 
> PL enum when bo->tbo.resource == NULL.

Ah, good point! I though we would do the mapping the other way around.

In this case that is even more something we should probably not do at all.

When bo->tbo.resource is NULL then this BO isn't resident at all, so it 
should not account to resident memory.

> Again, based of the same enum. Not sure if you have something other in 
> mind or you are happy with that?

I think that for drm-total-* we should use the GEM flags and for 
drm-resident-* we should use the TTM placement.

>
> Then what Teddy does is IMO only tangential, he just changes when 
> stats are collected and not this aspect.

Yeah, right but we should probably fix it up in the right way while on it.

>
> To fold or not the special placements (GWS, GDS & co) is also 
> tangential. In my patch I just preserved the legacy behaviour so it 
> can easily be tweaked on top.

Yeah, but again the original behavior is completely broken.

GWS, GDS and OA are counted in blocks of HW units (multiplied by 
PAGE_SIZE IIRC to avoid some GEM&TTM warnings).

When you accumulate that anywhere in the memory stats then that is just 
completely off.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>

