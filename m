Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC07D11BF3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A75B10E32B;
	Mon, 12 Jan 2026 10:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A0dFV7np";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013062.outbound.protection.outlook.com
 [40.107.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3979710E0AB;
 Mon, 12 Jan 2026 10:12:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSOtGhvkAi4ceDfJfznYtUhtco7vL1HIxIsE/Gzj5216rmnuzeMk5GHpAELD28k9iRZeChve/d37XghEX/sqRVKfgzrV0gHtOXlA1YzaLtfMMOKs0fUYEP40/LheMl+htGtqN9wy3wejF2stqRIddBzdtFJWxza4D2u/EGHXBZCeSYylXPTDdP/vKW9LMH02hFVqnFdiWiprfSJthXDkNf9G7SRWwRiVtnBEwDgF7cS5io6895Hq7FbsJz/IAT9wXbrS06b0MwZpfkkVr2pr8lCEfgoQjgy/TFt/5JibBOofO/netRIyWBEkI21kW39gZ+LMTq/CiQwaIG7HAcKNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Dwo9irg+vAZNDNrJ9wAFxmdEdFkE91dim1tZesAzyk=;
 b=ULn32kBBBmMs9pbyhZfPWpHacZcd5pZIvNdw5X0UbALJXSxiBWfoRir1Ip2lEAwUH0gN/h3ilETEbFoAoNpDDpaQsd1BG6/vPzDTHTySpqLw+8A13/HaKzwEgGIB8KUEmg1J88dHXZaKVRIQ3TAOpgxSGjJJ0jTxJumKWUuiJ8EdOI/9WLhdDMdE9a9A6VAd9BufHnYyg+ka1t3Yy8vXvfr+nYJC8/4DvZWQjLMxQBqs7elacpmiupHylATvCOwOT6ZwuJYoettVLiciMy/jBCJ50fl9XZFoIgzFecqB2Ii5rgd6baQM5X/IbGvOWGqj0TiLHh3jlOq8Eb46zPGaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Dwo9irg+vAZNDNrJ9wAFxmdEdFkE91dim1tZesAzyk=;
 b=A0dFV7npwTQlG0o49jzl4RLuhTmZ0BJ33IZ6o6VmqxwBJmS/MxtS5xZYywzTCeC9ELCey/0QfjtvpNPfme+NhbT9xJBCiKvOxTV2RsIjaS0ceJvapGzxO+tbhqSb7vNZIOfCPFeBPTVJo3VvaIvQi7Bl5BnACcp7XQwv9y+pkaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:12:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 10:12:38 +0000
Message-ID: <d932d813-f1cf-482c-9697-80199b3b4771@amd.com>
Date: Mon, 12 Jan 2026 11:12:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: Honglei Huang <honghuan@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>, dmitry.osipenko@collabora.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
 <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
 <7ea29163-d6cf-4a4c-91c7-72802dd49018@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7ea29163-d6cf-4a4c-91c7-72802dd49018@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4043:EE_
X-MS-Office365-Filtering-Correlation-Id: 461f60f6-b39b-4b8a-fa6d-08de51c31d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3FNV2xNTzJuOHI3QWpVaWlJY1Y5a09aeGsyTFk1U3RUSU1odkdJUFVqMito?=
 =?utf-8?B?cDU5aVIxOUxFaU5OWCt5VDNkTnNUbXZDR0pBcDloRXBLMmpTSWRFdmtxYXIz?=
 =?utf-8?B?Nk5oOXZHZXRscmNBS09rNVNHcEFrVklWZW5DblJ5WWRJRUdhL1NZMUYvTzlD?=
 =?utf-8?B?cW9pTUFtWlIwWGJsKzl5ZWQxTHhJdmNIaXhEd2JpUGQ0Q3V6VzZYb1VkVUFB?=
 =?utf-8?B?Ny9kSEJCTXRzSGhjTHpvMGRucnJBTjRZSE5rWFFqTXpaVS9VQ3VlSE9CbDlx?=
 =?utf-8?B?RzVxUmMzVDZBeVVXTkN3eklOcmpqQnpxVjhCRHVKekhrS01idm43SG5kemp6?=
 =?utf-8?B?MmN6RzB6L2NXOEhENzFrZUlwN0RwNHlJZU11c2VpWk9PY1plRHhXanNqbHg5?=
 =?utf-8?B?MlE2TVhNUjQ5SlcxOU1ocWJ3YXVpZU9TeVFnUmxwcFJFeFA4T0ozVDlWMnp1?=
 =?utf-8?B?dDlIL2U1UGVKQ2V1Wk9vZ0xYMXRIMjBsS3ZSdDV5d296dkR3dUVkVXBQMExh?=
 =?utf-8?B?REdndDZpS2ZZaERVa1c2R3BRZ2IxdE9pUUhJdGpiZGNXdHlSWW5FcSs3MUY1?=
 =?utf-8?B?UW9RQkVyRnBVL3ByWmFyemhWSWg3Sk93RENpeHhvTGdvUGVnTUh1c2RTbmFX?=
 =?utf-8?B?UFM5d1dEREhUYWVFL05nZXpleGJEUUN0L0I5WExiU1Y1ZkJKQU5NWGs0Q09a?=
 =?utf-8?B?ZVdaSHNhWFpEZEFmc3RUM0xQR2VrSkNsdjczOVU1bTFhRWZMeWhsTU1OQ0dx?=
 =?utf-8?B?S0R0RHQ4TFNuS0w0ZUwweUxkZkdUZ3BoK29kb0hrUStHQy83enRyTzJVWHlY?=
 =?utf-8?B?YUlQTm5rcUhKWFd5VWg4Y1B5aXgzNkN5d29CTk9NcEFtUWpnaTlvTG5Bd3Rj?=
 =?utf-8?B?dVh0bUVuWi9reUxsbXRkZVVUeDNyZ3AzSnRhT3BrNzdrSXRrbW5idHZubEdB?=
 =?utf-8?B?cVY1dlh1eUNrVzBsMjE1MHVvZDhYM2tzcFJyWElaTVUyWDdOVWpVU3lkUW94?=
 =?utf-8?B?ZmRCbEdpUHpIbEErUEF6VVAzRHBFRkJtYVBjUzNyd1ZLWEtsbVNLSTZjMlFK?=
 =?utf-8?B?QlIvR2RxTzAvWVk3YmxoY1Z4ak9Od2FKblE0RE1NTExYaFpReGw0cWRaNnZm?=
 =?utf-8?B?NEtPeVpLeTZHWDlIRkd2LzBSRlJSYUxJbWFBemtDSG1zR0xuYmNoMm1HRXVT?=
 =?utf-8?B?cElPSVMzRXBKd0o0bWFLRVgzMHpuTmhnK3RveHZsS29iaGNHN2EwQStYajl3?=
 =?utf-8?B?UVdLaURWamNLSFRCZ2RJQ2F5TmFZbUZZc3lXYlFRSHVhUFdlTmh4U0FsT2lC?=
 =?utf-8?B?S0NJVUJoSExiNU9VcUdHaG9YVEhsTUhJODd6T1BWWGRhM2o4Wk81TGs3ZlNn?=
 =?utf-8?B?K3Y2NFl3b0hUVml6VGdoYlBORkMwbUhsbXVTWEMwQ1dFc0l5VllJeW5wSXlH?=
 =?utf-8?B?QWsxckE1VWIxNWFmMmlYaXdzaVVHUDZNbTRvNkhKRU1nTVJjQnByZkorTGxF?=
 =?utf-8?B?akdZbDB3YUhGYTZDeHQrcGJLNFRUQndUV2lIck1UWnJrWkkxMUZFVGlxUzlB?=
 =?utf-8?B?YjdJSnRERjNpM0Z5d01uV3ZtVUVrdGJMSzZFUGoxS3AzZnpVOHdvVTg1Wkho?=
 =?utf-8?B?YmJjT1I5RDd1amNnVExhWDdvbkJ3dnhpV0VQaHVQaDVKekNxdm1DYkM0dEhp?=
 =?utf-8?B?YTFUbkhDT1ZNeTg2L0R0b3M5UlZUTzRJZW0xQzhROFAwMnhISXc1ckdGa3Ro?=
 =?utf-8?B?S2V3MXhheWJueHFYUHA2RDcveUdaWWlZM1JtRXZsek8rK1pWMGNRdW42QVZq?=
 =?utf-8?B?RXljK3ltaHY2MEpDM1ZDZmxQNzZxY2NuU2Mra1h4VTJKS2xaWnhBSGNVK1hS?=
 =?utf-8?B?SnNqYisyd2dQSnZ6UXRrRGJVbHZ2L3I3c0g3eEVodFppZm1xZzNTYTVHYjZG?=
 =?utf-8?B?ZW9DckQ4RWcvdkZwaU5RY3VZVHhNaWR3MVczaXd3bEdZNWpjT1VrT0c1YVJj?=
 =?utf-8?B?UHpnTGR6S3BnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THhCaEU0MlMvZ1UyVDVqQlpoTjdGUzFwTUJ0S1NEand0eGZLQlg4KzVxZlFX?=
 =?utf-8?B?bGJ0TjI5bXlRZkQ3OUdLZkowRSsrWTBkZ3lUZUI5ZDlUVGVzL0tXRFdqRUE0?=
 =?utf-8?B?MUdqSHgzNDNSWU5nTE1ERVk2b1E4YnJTbkJFUXdBTVlyZlBJZUtzZnIzS1ZY?=
 =?utf-8?B?V2IxWTJnMkx4VE42RlJtaDlnOWlnZFBvVlA0SFBVaW8wZUVyaERCdXVOSUs2?=
 =?utf-8?B?bDlMdzIwM3I4bUVUblIza3I0c1gxQkk1aUN2YnNFbEVCeG9iMXFOVDZ0azBG?=
 =?utf-8?B?dUZpYkwxWExZNCtnUGYzUHZhK1A0VlhNU3A5ZzdwRmgzNUtzQUZEUjZKdHk4?=
 =?utf-8?B?TFFaS1QxTkdGVHc2UFhzeFdPeGVYdWtGbitoYkNXdk9LeGpVYzU3NXhoMHow?=
 =?utf-8?B?dS9nVG9HbFFTaEZ1MVY1NlFJNTV1UzdJUlZrVWNEam0ycGFvSi9wUmV3amlU?=
 =?utf-8?B?bnFFcGlnZjQzN28zR0dwaTFzOHdSYVdBcEtvbTA4ZUpLR1VvblIzL1VXbmhK?=
 =?utf-8?B?bndkSFM2akh2dXhBbzdyb2xrcXVzYzdzVkp6SURLYi9VYkRZR2lQRnVrbmZL?=
 =?utf-8?B?L05qNGloMjJWdzVEbmRKaFF0dVhaVVBsR250SGEyR2NRV0syYUltRE1EekQ1?=
 =?utf-8?B?bDViUGFxVk5zaEF0dTNLYTlreXBXWEV2OGlUMlVoRUtDNzBaaHJSSUtiSHhw?=
 =?utf-8?B?U253RXl4QnRmZW5KK29TcVo5SjVwb0V1WkJFZ2swL2s0c0ZhRkRrN2dhSlVT?=
 =?utf-8?B?bzF3VjRPM3dWd2wvTzFGWUF6OHNUcWVqaUtkMHhReFZZQld0dDRXdDhtblh0?=
 =?utf-8?B?cEhwc3pYR0ZvcjI0QmxReTNKbmZibzlrMUtwT04rNk1OMUNWTUV0VHMxZXdz?=
 =?utf-8?B?eDZBSG90RmhpZmd1T0RtSXhtdVFMSTY3N0czTjZIWDNld1NZbVc4NWZqSGtt?=
 =?utf-8?B?VTF0T2NnRU5LS0w3Rkpra1hGSUZyUW1BQnBKSUt2VXdWOUs1UVM5VHY4RCt5?=
 =?utf-8?B?R3NSTmdIQ01pUXV2ZVVtcFRnV0lybU9UOFVUMHJZd2lYZEJWSzBmbCtndHVC?=
 =?utf-8?B?eTR3bHVqQlErTlM4Q2pROTdicC9vd2gxUjhsOWo5SFJjamp6ZDlmS011dXhM?=
 =?utf-8?B?QWd3Y1MvM3dGNkwydktmNWk1bnc0S3dyRXpKM3ZQdkxOTTFYZ3JwcjVDVmln?=
 =?utf-8?B?aHJrcUJJOUdab0l3UEx1QWFkR1oxbCtGNGdFU3RuclpJMVlPdTUyTHZSaUlW?=
 =?utf-8?B?Q2lhOE5Qay91Qlo2N3YwSE01ejZUbWNQcFNWbEFMVjdHUWVFZXYxeUdyNjc3?=
 =?utf-8?B?eGtRUnc1M01IYUtSc0hwUXdqcFFPMnZGY0k0NFloVVRtbkVOZ1hMaFZtY0pG?=
 =?utf-8?B?UzJ5djhZNzNLYkhwbXZiaVhrellsSVQ4a25vc2VjSDZtL2ZFL2VkQS9yQkpq?=
 =?utf-8?B?UWwwYXFFdmdlb2ozN3BHTVozUXk4N05JVUdvS1FoTGRGL1I5akFEbnZLUTVq?=
 =?utf-8?B?aG5mN0JFbks1ck1wWmFlSytpYjZqL3Nma1VuaWNrbnBydkI0MENUMG1nY1R1?=
 =?utf-8?B?bmsvUVhsQWxEMUc3dy9aaGNYWjVtWE43MlE1N0VBYVhDKzdodW5vTFIzaHN3?=
 =?utf-8?B?U0ZoZm9FRCt3VStMUUk5cnFyQVZSSis1MENJekp4WERVaFFQL1dLcHRxenVH?=
 =?utf-8?B?YkQvUGZSbm1pR3pZWUJ2V25WN0FpS3JnU1N4SDRqZjVDRnBuY2cyb0tNVDVv?=
 =?utf-8?B?V3AyNFFoNG50dzEyVnBSbmRWbS9FbHlsZHJNVDZoNjRvcDhHWU5wTlBaVGYw?=
 =?utf-8?B?Z0tSc0xFd2tPbXFJUENUbnlJd3QvUExOdzRxVDNJT2FUK1RNaktKbXg4TlhW?=
 =?utf-8?B?OWF2N3VDQWlWdkYrVnFmU1dzZlJwRHFsRmRseU0wMFNnRDJPLzUrREFYZmlN?=
 =?utf-8?B?KzNiSkRpek5ySXZxckczc2JSQmZISk5sTDIrMjRwbllPMWEvNnJtZXA0emVz?=
 =?utf-8?B?RHhSTUdPL3J5MmkycnVOMEJBVGQ4aUE1VmpYZlpwN2QxOGlTRlBuM1Z3OFZJ?=
 =?utf-8?B?YmdjaWZ1TEF4ZW9CMXJKa2twNnlDQ216c1JzUEZxRFBOWUowV0d3c1F4Szdy?=
 =?utf-8?B?bWFLdUlOa2tkWVlWY0dNQ3dDeUZUaUFBK2N0OFJ1Ky92QXE1cmZRZlVCcm52?=
 =?utf-8?B?VGRnZUh5RlNLVFNxUTIzS3l3RFpHWGQ3MVYzZFRWL1RwcXVtNVFlWmVzYXFX?=
 =?utf-8?B?L1VGVnhHNEJ2T1JyU1EvUnZRbXN1Wnh4enVKaFMwemtXUHUxTDE0RklMTFpy?=
 =?utf-8?Q?23P/Gg+dz117RRRg6o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461f60f6-b39b-4b8a-fa6d-08de51c31d53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:12:38.8344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYF9XZ5LgsoZzx04TdSEfW/jovVkAyl1BfnmhFoCc8b0fZ+2kDavy9iIvCoOeSHx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043
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

Hi Honglei,

as far as I can see this is only very very trickily doable.

What exactly is the use case for this? Userptr handling in QEMU?

What we could potentially do is to create an userptr which is not backed by a range in the user space VA, but rather individual offsets.

And yes in general you need a single MMU notifier for this, but the notifier mechanism is actually not really made for this use case.

Regards,
Christian.

On 1/10/26 03:30, Honglei Huang wrote:
> 
> Hi Christian,
> 
> Thank you for reviewing the patch. You mentioned the MMU notifier range
> handling is incorrect - I'd really appreciate your guidance on what the
> proper approach should be.
> 
> Specifically, could you help me understand what's wrong with the current
> implementation:
> 
> 1. Is the per-range mmu_interval_notifier approach fundamentally flawed?
> 2. Should multiple ranges be handled with a single notifier instead?
> 3. Is there a different mechanism I should be using for scattered userptr ranges?
> 4. Are there locking or synchronization issues I'm missing?
> 
> I want to understand if this is:
> - A fixable implementation issue where I can correct the approach and resubmit, or
> - A fundamentally wrong direction where I should pursue a different solution entirely
> 
> Either way, I'd value your technical guidance on the correct approach for
> handling multiple non-contiguous userptr ranges, as the underlying performance
> problem in virtualized environments is something I need to solve.
> 
> Thanks for your time,
> 
> Regards,
> Honglei Huang
> On 2026/1/9 17:07, Christian König wrote:
>> Hi Honglei,
>>
>> I have to agree with Felix. Adding such complexity to the KFD API is a clear no-go from my side.
>>
>> Just skimming over the patch it's obvious that this isn't correctly implemented. You simply can't the MMU notifier ranges likes this.
>>
>> Regards,
>> Christian.
>>
>> On 1/9/26 08:55, Honglei Huang wrote:
>>>
>>> Hi Felix,
>>>
>>> Thank you for the feedback. I understand your concern about API maintenance.
>>>
>>>  From what I can see, KFD is still the core driver for all GPU compute workloads. The entire compute ecosystem is built on KFD's infrastructure and continues to rely on it. While the unification work is ongoing, any transition to DRM render node APIs would naturally take considerable time, and KFD is expected to remain the primary interface for compute for the foreseeable future. This batch allocation issue is affecting performance in some specific computing scenarios.
>>>
>>> You're absolutely right about the API proliferation concern. Based on your feedback, I'd like to revise the approach for v3 to minimize impact by reusing the existing ioctl instead of adding a new API:
>>>
>>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>> - When flag is set, mmap_offset field points to range array
>>> - No new ioctl command, no new structure
>>>
>>> This changes the API surface from adding a new ioctl to adding just one flag.
>>>
>>> Actually the implementation modifies DRM's GPU memory management
>>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs similar functionality later, these functions could be directly reused.
>>>
>>> Would you be willing to review v3 with this approach?
>>>
>>> Regards,
>>> Honglei Huang
>>>
>>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>>> I don't have time to review this in detail right now. I am concerned about adding new KFD API, when the trend is moving towards DRM render node APIs. This creates additional burden for ongoing support of these APIs in addition to the inevitable DRM render node duplicates we'll have in the future. Would it be possible to implement this batch userptr allocation in a render node API from the start?
>>>>
>>>> Regards,
>>>>     Felix
>>>>
>>>>
>>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> This is v2 of the patch series to support allocating multiple non- contiguous
>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>
>>>>> **Key improvements over v1:**
>>>>> - NO memory pinning: uses HMM for page tracking, pages can be swapped/ migrated
>>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD unification
>>>>> - Better approach: userptr's VA remapping design is ideal for scattered VA registration
>>>>>
>>>>> Based on community feedback, v2 takes a completely different implementation
>>>>> approach by leveraging the existing userptr infrastructure rather than
>>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>>
>>>>> Changes from v1
>>>>> ===============
>>>>>
>>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range registration
>>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA handling
>>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>>> - Registering multiple SVM ranges with pinned pages
>>>>>
>>>>> This approach had significant drawbacks:
>>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand paging
>>>>> 2. Added complexity to the SVM subsystem
>>>>> 3. Prevented memory oversubscription and dynamic migration
>>>>> 4. Could cause memory pressure due to locked pages
>>>>> 5. Interfered with NUMA optimization and page migration
>>>>>
>>>>> v2 Implementation Approach
>>>>> ==========================
>>>>>
>>>>> 1. **No memory pinning required**
>>>>>      - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>>      - Pages are NOT pinned, can be swapped/migrated when not in use
>>>>>      - Supports dynamic page eviction and on-demand restore like standard userptr
>>>>>
>>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>>      - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>>      - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>>      - Zero changes to SVM code, limited scope of changes
>>>>>
>>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>>      - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>>      - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
>>>>>      - Unlike KFD SVM which maintains VA identity, userptr allows remapping,
>>>>>        This VA remapping capability makes userptr ideal for scattered allocations
>>>>>
>>>>> **Implementation Details:**
>>>>>      - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>      - All ranges validated together and mapped to contiguous GPU VA
>>>>>      - Single kgd_mem object with array of user_range_info structures
>>>>>      - Unified eviction/restore path for all ranges in a batch
>>>>>
>>>>> Patch Series Overview
>>>>> =====================
>>>>>
>>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data structures
>>>>>       - New ioctl command and kfd_ioctl_userptr_range structure
>>>>>       - UAPI for userspace to request batch userptr allocation
>>>>>
>>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>>       - Add user_range_info and associated fields to kgd_mem
>>>>>       - Data structures for tracking multiple ranges per allocation
>>>>>
>>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>>       - Core functions: init_user_pages_batch(), get_user_pages_batch()
>>>>>       - Per-range eviction/restore handlers with unified management
>>>>>       - Integration with existing userptr eviction/validation flows
>>>>>
>>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>>       - Ioctl handler with input validation
>>>>>       - SVM conflict checking for GPU VA and CPU VA ranges
>>>>>       - Integration with kfd_process and process_device infrastructure
>>>>>
>>>>> Performance Comparison
>>>>> ======================
>>>>>
>>>>> Before implementing this patch, we attempted a userspace solution that makes
>>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>>>>> register non-contiguous VA ranges individually. This approach resulted in
>>>>> severe performance degradation:
>>>>>
>>>>> **Userspace Multiple ioctl Approach:**
>>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>>> - Performance loss: 60% degradation
>>>>>
>>>>> **This Kernel Batch ioctl Approach:**
>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>> - Achieves near-native performance in virtualized environments
>>>>>
>>>>> The batch registration in kernel avoids the repeated syscall overhead and
>>>>> enables efficient unified management of scattered VA ranges, recovering most
>>>>> of the performance lost to virtualization.
>>>>>
>>>>> Testing Results
>>>>> ===============
>>>>>
>>>>> The series has been tested with:
>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>> - GPU compute workloads using the batch-allocated ranges
>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>> - OpenCL CTS in KVM guest environment
>>>>> - HIP catch tests in KVM guest environment
>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>>
>>>>> Corresponding userspace patche
>>>>> ================================
>>>>> Userspace ROCm changes for new ioctl:
>>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>>
>>>>> Thank you for your review and waiting for the feedback.
>>>>>
>>>>> Best regards,
>>>>> Honglei Huang
>>>>>
>>>>> Honglei Huang (4):
>>>>>     drm/amdkfd: Add batch userptr allocation UAPI
>>>>>     drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>>     drm/amdkfd: Implement batch userptr allocation and management
>>>>>     drm/amdkfd: Wire up batch userptr ioctl handler
>>>>>
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>>    include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>>    4 files changed, 740 insertions(+), 20 deletions(-)
>>>>>
>>>
>>
> 

