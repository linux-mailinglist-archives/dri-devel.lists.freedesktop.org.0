Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BFEC7917F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 13:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE1D10E866;
	Fri, 21 Nov 2025 12:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lx8ezgLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B50010E85F;
 Fri, 21 Nov 2025 12:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOZU3Gb6cX6caUWDVjJ7NqSJo51/yhyXqCaXHXkWNkfSeWp9VyAS9rifrv6d+Q9RwJiqr3YJofeFc5Td63gmOF/A2Eqzf6Fd/H1augSejHB78CWhzuukP2FfFpapLHzIAL84Lsb2E94j8nAJk+QWPPRT6hBlRG9MBQDzbHM06l1ZELaO4sGSBKxhx5ASMLO5cxF93hmSNORGeqwsyNYX68q3E9ta9M282wm1kSh9RRhfmvuLjUnXT14OYf3MddKzoRhvUeHRnQS3fVYY9r4Wk9OftMU3AF1mQTnZRgaleX9INyL6ZLEU6FpuWtvMvc6RRNnEb/TChbmxO3z+sKkTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St7aAz9fwOhsBoxWiwwFty314GWsMjmg8XiME0kvSpo=;
 b=T08Du2UUD0IgNS4+XppOFf5C6h8oY9XcVsX2qCtAMpOWcqo4bgoUg9Z6wVNFAPYSwnQOm0CCLsejaWQsjL8pryQorAn+KzEiDGwRHHUKa+2pyxJ7g3rdrVe/udIBpCh7SZjYt3Nt+tUxaQXPZRCtP+8QRaMZX1DXSrVLgMzBHy9pxbpvDu1FOTWVvpnsYvAWy2n5DPp7d5tMCBE8OlUg76sETcl5nNjZ4YBJZveJcwsIwcp64Fes6ZbjasNY3xT33ucc8v38xkJin5V2ePTmqSl5KjeOaGgv2RLq3WLQrWrQfvY9yhKqI5gzgqXs2a9SBmUhUt92yGavxe+rjftYHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St7aAz9fwOhsBoxWiwwFty314GWsMjmg8XiME0kvSpo=;
 b=lx8ezgLL3dkVXpONspHnfxpaJEEpD8DzlBWUv3VZ2lFX2mXcil+musKBLacLOdL4i1CnCXMcsX5H5evRrH5uzE1uSls0pQJ94fOc607wKRF5OHC2Hj/QNLL6czsgdxWQSfbksJtiRJNYZAANP3INhD2Eta5icm04YBbF+KHrKh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 12:58:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 12:58:56 +0000
Message-ID: <eb9e1ca0-7f96-4e3f-a485-aa91fba9799c@amd.com>
Date: Fri, 21 Nov 2025 13:58:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/28] drm/amdgpu: remove the ring param from ttm
 functions
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f05fbb-d408-4fda-9a1f-08de28fdba8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUpPcVM5STB3RDVMb2liM09NWElsMDExVGR0Wkw4ZjVjaEI2MllqSldvNk9v?=
 =?utf-8?B?M2lUV0tFOGpuZEFMMGM3QUxJaTdwMlNWRWJTMkJXZUdXNzNmWFg0eHBYR0dJ?=
 =?utf-8?B?RTlvV2ZPUWp1ckdGSyt0OExRZ1BxS2ZaUHQwaTVLSDJmRDN0MXFSeDUvbjZR?=
 =?utf-8?B?WG9tdVZQQkUydUl5Y3hZbEd5cG5VUjNMZys1cjBncDJmZm5GenFZVXBwTmM1?=
 =?utf-8?B?aXJxNFVEOFl0Sk9oSTVqTnJuWlU1TXVqVG5RZHd3bUluS1Z5LzFNZlNWWUtv?=
 =?utf-8?B?VWZFRkoyNFJtcEFnNU5VS2dlcmUzRUhVYjlRVDI0K05oZWZhNWdGSTBrUS9H?=
 =?utf-8?B?MnAwUVF2Mm5uVXVzVFh3RGdheHpJam1oSTR6SEEzOVhIZVNnUEdMTzVLYlla?=
 =?utf-8?B?VmtBTVFLWHFITHdYZGZxQVRsWHNEbFdqZTFUQjdlT1lSQWtvdktZTE4xb2Ra?=
 =?utf-8?B?Z25QMHVaZk1qd25TWjhnUlJLbXI0NTBEYWFaMjhESmtKYUdzZXBzWXAzOEc3?=
 =?utf-8?B?Z2JiTStHVDV0dnF4VnhGYzIwb2Z4UVdLYXh3TkJWdjdEbDBOaXdDdURydE42?=
 =?utf-8?B?UDhZVFpGV0JMNDFvQUFzZTZ3WDhiNDJGeXRBWm84NkZOT1Q1NzZIc1FOUlg3?=
 =?utf-8?B?cGllQWpGNDRvU1h5aCtYeS9pZkR0VzRFTXl3VU81SzJiRzlFRnlRa01TQUEx?=
 =?utf-8?B?SjdZK2dvaXI0cjVJTU83TkJBRk1jaEtWbmlmQlhNM2IrejB3dzRrSk1oc3pO?=
 =?utf-8?B?eDNUc0J0VHYwbXN5eWpFcEdSODhnOERTamtzY2w4aHh4UDNwYTY4Y3d3NHFQ?=
 =?utf-8?B?blRmZU15S3pvK3FaaHY3UHhHVDFrUHdDaGZFQlJoS01UWFA1T0YrY2owOURj?=
 =?utf-8?B?c0tqbitkM3hGT3IwbTdMemNwd1UwMmRDbG1jdDMweklFemc5VVg1THJETlJZ?=
 =?utf-8?B?aE1XM1JVbVJCK3c5WVdUWmJJaEdvODZPZ2dBanl2WWxhT3FVbTJDUDN0c00x?=
 =?utf-8?B?SzNYM2t6UTY1anhqdkxxR2FPelFtNlQ1QUlmM1hRY3ZFOStobTBRZ3c2Qkxw?=
 =?utf-8?B?alg1VWVDTHN1c0I5RlNmdUl0NGdBczBVUC8zbTN6bnhzVkplNVZBaW5PS1Zw?=
 =?utf-8?B?cHVUSlpQWFpUVmtIRUJ6Q2prTGh4RllXdVV2dUYvU1RsbVE4NFJ6V1ZXOG85?=
 =?utf-8?B?QVAxc0N1b2JDbzdaNW94VEFZZDM4YTc1M3BNSkp3V0hzeEVuOWJRY0E5VlJX?=
 =?utf-8?B?QjJYZ1FoV0JnVVI4OEFQdzVaZ043YWhzWkVaOVBRMFVUWFlyTGM0NGQyRFdq?=
 =?utf-8?B?b2hERm5TeXlmNm05TDZweUpmKzkvOW1GMks5TnNBcy8waGIwMmpwaStncVBV?=
 =?utf-8?B?VUlJSk02M2E0VnduVGtxNGcyY1FDTTRYL0J0OUo4c084NGR2RWdKdWQ5QWtv?=
 =?utf-8?B?TDVBY0J2bEhXbHM2TU43eTRIZ1J3UFluemh5dVVuUEVBRCt3dWtUWXpIbFlR?=
 =?utf-8?B?L1Vrb0JCTEFQWkg2bHVCWEdiUEN2OTFJVHhXZVdseFlvSW5LTjlwV0JmQTlD?=
 =?utf-8?B?clplRmNtUk8wcnpWQUJ6NW54WHlESUdkQWVFY3huUlBnNmFqb2NhK2ppYURU?=
 =?utf-8?B?S2R6REJPTzZmOEVKd1NpQWF1UlJqaWorUHZGNnRpVUxhejVhRzFVQVBkczha?=
 =?utf-8?B?MnpWWDYrOGljQUUzV1YxaWhVR0pCYTNOUVNSL3c0Y3V0UjBKT05Pc2FjN25p?=
 =?utf-8?B?VWFBYmdsa0o1Y0ZLUEUrN0pUZlVqMS9NeWZHeU9hRGl6eUkvd09jRmxTZUh1?=
 =?utf-8?B?Q1hKZG1Tekxmbk40OVhDdGpWTmhMNDhLTzlzK2ZsQnBNSHppL2t4bEZWelZB?=
 =?utf-8?B?NjNCN3dWbUhYek1NRkM2YmdlckZtWnlxS0lrZ0dSQlZmN0N2ZHBhWDdnU2FS?=
 =?utf-8?Q?6rlq3fW9jck0hfhMqwchE1gydreI524n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2NnMFVCN0xyUHlUVDRxR0RmTEkxQ01ENHVKTWlJb1U4RmpENVFHSHZ5NFNp?=
 =?utf-8?B?aEROQW9aa0NmOVhRZDdZMTJuTVBkUmhYVWRoMUNYbGVSd2k3YlZXNHZ2YlVW?=
 =?utf-8?B?ZEJuMEQrcmQ3WmM0Vi9PWUp0b2puU2xDWHdHdmZPUHJPMEFnbkkwOHpTZEI3?=
 =?utf-8?B?MERHbnpKSDZGRjZjZ1NwaFVQRTY2R2V5QXZUL2Zqb2RGQ2ZGQlk3LzFvcGdX?=
 =?utf-8?B?alNVbnZqbTlSSkVPcjBjRGZtSFVnL2c2SUpIQ2poRFpDKzYvT2lRVC9VN3Y4?=
 =?utf-8?B?UmtyUWtINXo0cGFyR1c0bHduclVvT2hsTDRrcU1tT1NCVWRvUWQzRHRLbm14?=
 =?utf-8?B?NjRHSDN3SEswM2VIV2U1TENyWEJDMFVGVVRKQVVmNmJrTEtCTG9QeTVrTnFs?=
 =?utf-8?B?VGExNzJsTTFRZjZGSnFLRUUxNDc0ci9TcE1oN3VJMGY2QlI2KzZqRzY5WXJu?=
 =?utf-8?B?VTlqbW5lalFsSk1ZTlplVlFabGdXdHp1Qiszbk9vYkRTdGVoYmM2V09ncC8v?=
 =?utf-8?B?eDk1MEdYcmozQWQvN3l6QkVLcWFrUG5nNUtJK0Rpd1A4bnZqRE5UYm8wY3ZM?=
 =?utf-8?B?VHJmZEhLR01kNUFXNlhScUpIK0U0QUIvSzR4eVRIQUdQOTFRcndsTmpNb0Mx?=
 =?utf-8?B?bUlTY3JGNExCTzlIRGVoM09MeHBsamRHOFluZitTb0hYZFZUNmhqNllDVEVT?=
 =?utf-8?B?aEZ0NDlUaHBvVDBkczVVeUxLeGN3SElRaVRiWlh6YW5kc0xKcVZSV0RMQXN3?=
 =?utf-8?B?RVFYdDMvOEFHMHpuKzROUEVqSTd5K0NGN3RmODhCemdWWTlldjFVYmY2VHJq?=
 =?utf-8?B?cFgzU2xZY1BmdWJnb1A1MWJKU2VZRjhMN0NPSDVJRHp4Y3ZiTXhFUUJ1Nndh?=
 =?utf-8?B?VnZtRDRBQk45YWJ4T2srQkRyWDlHa3pNa2haM0d6ZTJaQUk0ckNkaXRWMlJP?=
 =?utf-8?B?WW5MWXlBdGplSUhFcndtcFpyNkozOHVXYWRIZkZhamVXYjY0RGsyRWRUcEQ3?=
 =?utf-8?B?d05tSUZ4OWMxK2JxNWJ4K3d4emxqaDhLNEJXb3RjMHE1NTV3MFo3Zkw0OTVk?=
 =?utf-8?B?M0s4Umk5UE5SdXB3NU85TElBMXFQd3NjN1JMdUJ2MUdsWGtaTWV0S2VXeXlX?=
 =?utf-8?B?VDJlSU5CTUd3M2V0bk5jQUF2Ty9sR1ZSZ3ZqSVJWUDZkUHpjeGhxRWRHallC?=
 =?utf-8?B?Wk9RUlRTYms3bmFzS2plNTNmNm4xc1JRQjBFYzhoS01jaFBVSW4xdlhpZmFt?=
 =?utf-8?B?bk03UDJjWldESUJMb0tNTkEyWWNHRjBBRnBvajJ1TTZkc212eHhLSFBjWi9L?=
 =?utf-8?B?RWxLS0VEclEwWjcyQWNSNWpTTjVTMDVRcHY0Z2RtNlBRUXBCSW02YWFHYzZH?=
 =?utf-8?B?bWRZN0p5c0JicmY0ckpuazBYbkhiclVZUDVQNzdaQXlXbVdDS3NKL0ZIK3Z4?=
 =?utf-8?B?ZThURkFhRThYVEhCbVorZElwdFBBRlN5WmVqTlVHKzQ0cDMyTGxKaFlOQUww?=
 =?utf-8?B?c29Ob3QyTExkbFplaXQ5UzlNRXVCY1I1MFh3WkVRUEl1S2NYUzNtdVc0SVR6?=
 =?utf-8?B?YUlZMlpjRHBXTE1tQ2ErOG5BV0hRMW1vME5qK0hkclZSaUt0b0lubk1QeVRF?=
 =?utf-8?B?cGVmaW9pankwK05HOVN2amRVdDR0Y2piWEpRTHJ2Q0VpODd0RG9DdzZSbk4v?=
 =?utf-8?B?dDZXZlZtZ1ArWWhxWVA0Q0ttY0pQclZKNU9OMmRndFpFa09Mdk95UkZLdm83?=
 =?utf-8?B?bU52UlUrbStub3pxWlZGOXdQcGJVUWZ5b3BxbERtQm1FRXBWKzlPYnlRbGhY?=
 =?utf-8?B?MEJrS0dPNlBpWUwvN1doSlRxOWhBOERKYXkvS1h6SGVhWVdkZ1hIQ2FGbkxM?=
 =?utf-8?B?Tk1ha0pzTk81enRia3djd002VTZTcEhsSVpnSmtvZ28xanNRZjhOQitBY2l2?=
 =?utf-8?B?cWhyRndXMy9CYXpuMGVKRU11WkhCRnRDQUpDZFc5Q21ZL09GLzZNUU5NM0Ft?=
 =?utf-8?B?TFM0SnpYc2dzVHVhTWZuUXA3NW9PQ3hXbnM2SERUQ0kzd1MzQXk4Y0RMbFQ0?=
 =?utf-8?B?ek12OVpMb2I3LzJvVzN2NTIwaG5HZXBSc3hhelRMcnVVYmhpakZpbHZCcldP?=
 =?utf-8?Q?1FX9Y8vhz1wcC35crhJBx18pb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f05fbb-d408-4fda-9a1f-08de28fdba8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 12:58:56.7050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nouN1++C4W0XiaZ6aY/UMLlDyITBZRlN4M0vTERkP1708xDMype0IRxJ0/eb/WXB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269
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



On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> With the removal of the direct_submit argument, the ring param
> becomes useless: the jobs are always submitted to buffer_funcs_ring.
> 
> Some functions are getting an amdgpu_device argument since they
> were getting it from the ring arg.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 46 ++++++++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  2 +-
>  4 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index 02c2479a8840..3636b757c974 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -37,8 +37,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  
>  	stime = ktime_get();
>  	for (i = 0; i < n; i++) {
> -		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> -		r = amdgpu_copy_buffer(ring, saddr, daddr, size, NULL, &fence,
> +		r = amdgpu_copy_buffer(adev, saddr, daddr, size, NULL, &fence,
>  				       false, 0);
>  		if (r)
>  			goto exit_do_move;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 071afbacb3d2..d54b57078946 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -164,11 +164,11 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>  
>  /**
>   * amdgpu_ttm_map_buffer - Map memory into the GART windows
> + * @adev: the device being used
>   * @bo: buffer object to map
>   * @mem: memory object to map
>   * @mm_cur: range to map
>   * @window: which GART window to use
> - * @ring: DMA ring to use for the copy
>   * @tmz: if we should setup a TMZ enabled mapping
>   * @size: in number of bytes to map, out number of bytes mapped
>   * @addr: resulting address inside the MC address space
> @@ -176,15 +176,16 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>   * Setup one of the GART windows to access a specific piece of memory or return
>   * the physical address for local memory.
>   */
> -static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
> +static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
> +				 struct ttm_buffer_object *bo,

Using this should work as well:

struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);

Not a must have, but is more defensive and saves an extra parameter.

Apart from that the patch looks good to me.

Regards,
Christian.

>  				 struct ttm_resource *mem,
>  				 struct amdgpu_res_cursor *mm_cur,
> -				 unsigned int window, struct amdgpu_ring *ring,
> +				 unsigned int window,
>  				 bool tmz, uint64_t *size, uint64_t *addr)
>  {
> -	struct amdgpu_device *adev = ring->adev;
>  	unsigned int offset, num_pages, num_dw, num_bytes;
>  	uint64_t src_addr, dst_addr;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_job *job;
>  	void *cpu_addr;
>  	uint64_t flags;
> @@ -239,6 +240,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
>  				dst_addr, num_bytes, 0);
>  
> +	ring = adev->mman.buffer_funcs_ring;
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	WARN_ON(job->ibs[0].length_dw > num_dw);
>  
> @@ -286,7 +288,6 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  				      struct dma_resv *resv,
>  				      struct dma_fence **f)
>  {
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>  	struct amdgpu_res_cursor src_mm, dst_mm;
>  	struct dma_fence *fence = NULL;
>  	int r = 0;
> @@ -312,13 +313,13 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>  
>  		/* Map src to window 0 and dst to window 1. */
> -		r = amdgpu_ttm_map_buffer(src->bo, src->mem, &src_mm,
> -					  0, ring, tmz, &cur_size, &from);
> +		r = amdgpu_ttm_map_buffer(adev, src->bo, src->mem, &src_mm,
> +					  0, tmz, &cur_size, &from);
>  		if (r)
>  			goto error;
>  
> -		r = amdgpu_ttm_map_buffer(dst->bo, dst->mem, &dst_mm,
> -					  1, ring, tmz, &cur_size, &to);
> +		r = amdgpu_ttm_map_buffer(adev, dst->bo, dst->mem, &dst_mm,
> +					  1, tmz, &cur_size, &to);
>  		if (r)
>  			goto error;
>  
> @@ -345,7 +346,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  							     write_compress_disable));
>  		}
>  
> -		r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
> +		r = amdgpu_copy_buffer(adev, from, to, cur_size, resv,
>  				       &next, true, copy_flags);
>  		if (r)
>  			goto error;
> @@ -2232,19 +2233,21 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  						   DMA_RESV_USAGE_BOOKKEEP);
>  }
>  
> -int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
> +int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
>  		       bool vm_needs_flush, uint32_t copy_flags)
>  {
> -	struct amdgpu_device *adev = ring->adev;
>  	unsigned int num_loops, num_dw;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_job *job;
>  	uint32_t max_bytes;
>  	unsigned int i;
>  	int r;
>  
> +	ring = adev->mman.buffer_funcs_ring;
> +
>  	if (!ring->sched.ready) {
>  		dev_err(adev->dev,
>  			"Trying to move memory with ring turned off.\n");
> @@ -2284,15 +2287,15 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	return r;
>  }
>  
> -static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
> +static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
>  			       uint64_t dst_addr, uint32_t byte_count,
>  			       struct dma_resv *resv,
>  			       struct dma_fence **fence,
>  			       bool vm_needs_flush, bool delayed,
>  			       u64 k_job_id)
>  {
> -	struct amdgpu_device *adev = ring->adev;
>  	unsigned int num_loops, num_dw;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_job *job;
>  	uint32_t max_bytes;
>  	unsigned int i;
> @@ -2316,6 +2319,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  		byte_count -= cur_size;
>  	}
>  
> +	ring = adev->mman.buffer_funcs_ring;
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	WARN_ON(job->ibs[0].length_dw > num_dw);
>  	*fence = amdgpu_job_submit(job);
> @@ -2338,7 +2342,6 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			    struct dma_fence **fence)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>  	struct amdgpu_res_cursor cursor;
>  	u64 addr;
>  	int r = 0;
> @@ -2366,12 +2369,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  		/* Never clear more than 256MiB at once to avoid timeouts */
>  		size = min(cursor.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
> -					  1, ring, false, &size, &addr);
> +		r = amdgpu_ttm_map_buffer(adev, &bo->tbo, bo->tbo.resource, &cursor,
> +					  1, false, &size, &addr);
>  		if (r)
>  			goto err;
>  
> -		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> +		r = amdgpu_ttm_fill_mem(adev, 0, addr, size, resv,
>  					&next, true, true,
>  					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (r)
> @@ -2396,7 +2399,6 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>  	struct dma_fence *fence = NULL;
>  	struct amdgpu_res_cursor dst;
>  	int r;
> @@ -2417,12 +2419,12 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  		/* Never fill more than 256MiB at once to avoid timeouts */
>  		cur_size = min(dst.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &dst,
> -					  1, ring, false, &cur_size, &to);
> +		r = amdgpu_ttm_map_buffer(adev, &bo->tbo, bo->tbo.resource, &dst,
> +					  1, false, &cur_size, &to);
>  		if (r)
>  			goto error;
>  
> -		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
> +		r = amdgpu_ttm_fill_mem(adev, src_data, to, cur_size, resv,
>  					&next, true, delayed, k_job_id);
>  		if (r)
>  			goto error;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 50e40380fe95..76e00a6510c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -163,7 +163,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev);
>  void amdgpu_ttm_fini(struct amdgpu_device *adev);
>  void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
>  					bool enable);
> -int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
> +int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 378af0b2aaa9..0ad44acb08f2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -152,7 +152,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  			goto out_unlock;
>  		}
>  
> -		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
> +		r = amdgpu_copy_buffer(adev, gart_s, gart_d, size * PAGE_SIZE,
>  				       NULL, &next, true, 0);
>  		if (r) {
>  			dev_err(adev->dev, "fail %d to copy memory\n", r);

