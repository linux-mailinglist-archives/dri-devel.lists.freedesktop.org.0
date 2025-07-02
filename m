Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DEFAF0DDB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 10:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2042310E307;
	Wed,  2 Jul 2025 08:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iP+mXZKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D57510E307
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 08:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iB9+zoOqwNzP1gyomdbClPb7Nem3oCfGD02GbuTHsVnWvTCfvYmBVgx1zAISuyHMTczpd+TOAJ5bgT6EChxRj2XGikZpuoi95rpR6QazlQgLJdshTFcI0x57kXl4ftv6gmbXYAh5efXQymWJQsKnmBmtg/r+5ZpT+dePce7EI/FvVs+nXLm+z45wxSMZ+rUAuERRPnwsAwgtDUVeKcdfAXqmlfIyDq3Hpjk3O/2OlnZiPJiQ+sZlxteF+9Ee1kcIMxrWO1dmxsjJoL9CTUvAye2xuGGDlTkmTLlEGWvVxAYy5HsYg7BhfnXsmHtb4aTC4CJf5aIDe/6tWeUzLgcafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilh421kgNB/Y4uW126xcU37ahy7+i2VC/ZsMosWxPkw=;
 b=K8SaSRPfjQmlZIfSpMuxdJC/hddIBNDeAwIA4gEgD11ByGWwLgRA9VMoi4EYj8c/8IgBb6dt5mHOg0ZRL3wuszwlypZTMnDfS/kyD4fvEJeEFpzNvsEaTHMZztNiU3Fl8g3Y6aGxkKYYNiUryoo9lvNJQZp7AJpIyIA5UZPW7cH+rewUmuJhjE17vzvRNcEwspn7YirRE/mvnblIZHd5FIgQOydftOM2xLUsNsYOguiM8fy3LH2BU5MhE4CkNE/Cxi6LqAx6MzeCYJCiknDpeSbswDITfyw6iCqmPa3htq3W6i01QA30Wc1qCVZ+YHIiBsoQuj5mfasspOGR126NSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilh421kgNB/Y4uW126xcU37ahy7+i2VC/ZsMosWxPkw=;
 b=iP+mXZKejvYB737ZB8L4aaQji6Uh5M4/RI6X5Ixvx3dINdXWi079P7hNzilDa5VtRmha96AuuGWStbLYy61qc9PCRSEywIvCn3BzkPLEJU39kcJtodmpqgwt1zX68YSETLdHUW0eN0rwwAzRl1KrJJqjNMPvfdy9wUcb9xEptyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4479.namprd12.prod.outlook.com (2603:10b6:806:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Wed, 2 Jul
 2025 08:24:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 08:24:09 +0000
Message-ID: <d925b300-d7e2-48ef-b533-a52fb24d222a@amd.com>
Date: Wed, 2 Jul 2025 10:24:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: David Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
 <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
 <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
 <cf6cb95f-df79-40ae-95d5-dc5a7620a136@amd.com>
 <CAMwc25q-kBRGDrphU+iAyqENZhgdRtEnSrR9z6b5bQ_JFzzK2g@mail.gmail.com>
 <26c79b1e-0f7f-4efa-9040-92df8c5bdf1f@amd.com>
 <CAMwc25oMQ_=Hagb9N6SN3pFFPwZ8+8ZBOGvziCPhUypMpPeKUQ@mail.gmail.com>
 <54b2ee4a-0f2f-49a1-a680-8dc1193e2d30@amd.com>
 <CAMwc25oYx1L9H+GCE95ZAxXAwqCDQVjpJfre_Ndv=Z8j8KOyYw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25oYx1L9H+GCE95ZAxXAwqCDQVjpJfre_Ndv=Z8j8KOyYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0380.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b51ff5c-d304-4f4a-2dac-08ddb941d115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2tXYTZGOUdWa2VLTkxqRTl5aWdxZFlmSGppNUsrZHJwTnI3TDk3T1dFQnJ4?=
 =?utf-8?B?cWY0dW05My9SZFJuZ2RnWnNSS3lkWHlnL2lsQ2FpK1BPVmUzUDA0L0pqU2Vi?=
 =?utf-8?B?VXZ1cFhQb0hkOEI0OVNmc29mOGNUWVlpMGRLSndHeFpEWWt3ejkxaHU5aXNW?=
 =?utf-8?B?Wjc2dkkrYUowa3g1Vm0wa3ZUOFFDeVFYQkl2ZFVDN3BTR2FXL1h1bUtqaGtS?=
 =?utf-8?B?TUQ3T0U0Y2V0VVhNU1FOVFdaTmF6V2c4UDhNekFsWGQ5TWh0MlR3TE94Y0dI?=
 =?utf-8?B?dEx5bTVNY21CZUVMaTlBQmx1L3BCNGp5WXdsdWl6NElwYVQzWEJJZG5oUzBt?=
 =?utf-8?B?cmdYbjlBb0ZQand1eFpPYkhCZHVZd21oYnp1dndWYjYvc1MyaEV3VGRDczVU?=
 =?utf-8?B?RVR2MVBNTThmMGxRdUF6eXJxL1FWemRjZWhHczJGU0xMWnNMRzNlbzVPOGVY?=
 =?utf-8?B?YWtLWDQwRnExbHN3anl5RUZRSmxKUUx5UUhQdTZYOHovdzVFd2RJK1dYNnpt?=
 =?utf-8?B?Sk9iekFMdXd5M1R1R0hvM0xSRTJrZWpFTm5HRkpBdVk5cG92U3R3cnZYcyti?=
 =?utf-8?B?Ui93VGJCeFZXSHp5NGhGTDVkeTkvRmlPN1VhNHVKT285Ty9yUWdVaXVQMGVj?=
 =?utf-8?B?TDVaMFdyUDk4ZzlieDFTckVKUFlzdGpQbUJxTWxTaFFERWZSdnZoMkVSQjJG?=
 =?utf-8?B?WFBsM2hSQkFFSXVPbHcvdHV2UlFRREV0b0xhYm9RKzZWdUllbEFPOGRXdWtk?=
 =?utf-8?B?S1JOT0duVGI4MkpzaHE4N1JJaEo2T2xjVzVvMXh6UFl4V1hGeUlHdEFaN0ov?=
 =?utf-8?B?VDkxY1k3NTlwL3p3VnNXU3YvWGN2TzNtMUZ4Rm9NVzJZc2U3ZCtMdDJmL1Yx?=
 =?utf-8?B?Ym5YK1M0Vnd5Y2NNK3VreGg1QXZWWVRyZitoN1BVRFdETXhtVXlXaGZhV2Rj?=
 =?utf-8?B?WjlSQUc0V3gyMEhjSkwwdUdVeXpRZGJ4UnJJMXNWdWh0NXpUWldZWldZN3c1?=
 =?utf-8?B?Vnh2RTVOV3BxTmYwTEpOakhkVEpvcmd0SGRtQ3JPdVRmb2hnd2ZabXFPazNp?=
 =?utf-8?B?WnZMOG5KZ3R1THdNS2QwZzhoWnNVcVVZY21STUtseVN4NXQxUkFpWDhEcUp1?=
 =?utf-8?B?MWQ5Q3ozcXNiWHdFYTVpbGlMT2xFUzlLT1hkbnBlNEFHN1BWbVRKY1hpa0dt?=
 =?utf-8?B?bVA0V3pONEhSS0lXZmI5Yk11RU01THZBQ2tpRFY3QjUzck1Fb0QwRkJhMnVn?=
 =?utf-8?B?NXU3dkRQdGJTUlZSeTdDWWRJcDczUHZLVGFPbUhIMzFUTmcwTU0wWWFXU0di?=
 =?utf-8?B?b3ZaSFFJeDBEc0lTeHgvUnFpdnI5cDJOamdRTzY1V3pkV0JRZC9LVXJ3N2tY?=
 =?utf-8?B?YzU1TWMwOTI2TTVOa044aDRDcnJoQyszdzc2V09uamYwNkwyeHdGUFYwSmZ6?=
 =?utf-8?B?bmtqZ2dHQ092UHpKaUwvUWdMZXR2dDM3NlJiRktKcVRTQ1hENzN6SXFVazhn?=
 =?utf-8?B?ODZFWER5Z3hWbzJtMk5PRW5HNElidWJnZ2hNVTZDZldhWHdsaFBkTjNBTG9F?=
 =?utf-8?B?ZWZmN1VrdEc0SFI0UUVZV0lFZmRRenhENmlsNWhaQXRncTlOeG5NU1JCSzF4?=
 =?utf-8?B?WC8rYTFhaUFtdlFGQWFZL3RLUWc5VUlPajMxNURyTHBYamFUeitxVlROVlFr?=
 =?utf-8?B?dkdqbURZa1hyVXlvK3A0aWRuRHVCQSs2Wld1aGJBQUZEZXliQXFDRXNBQ3hE?=
 =?utf-8?B?V1Ixd3ZRdFZ5Yjk3OXRoS09iakNTSDdFTElvUWFQSTdqVks4KzZSeUlMY3hu?=
 =?utf-8?B?MElVMjNMTS9MMWdRdmxJQzF0VmRWQi9CaUFMRFVJckxUMFlUQWxPbDkwU0hI?=
 =?utf-8?B?YjJ1VzBRdGtlT0ZrWUFxK0Ntc29Vd2crSXlHS1gzeDk0MmlRRk9XRC9jQnlq?=
 =?utf-8?Q?uCpq3QH7ljY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBMdW9FaURFUWdUdkk4ckhraUQvbFhMWUZmbzArUHVQSDM2MlhzTE16Mjll?=
 =?utf-8?B?dGNLYkVmTmdrcWlrREVCdE9PNy9OS1c3L1RKOCtEeFZzdWFYcGdYRDAvRHZR?=
 =?utf-8?B?ZkhRR29XcFhJclBVTWkzZnlsaHR0enprYWQwb1JGc3RhaUhvREI2WVlVVmtx?=
 =?utf-8?B?Y0JLQWNLOFpaSGhhTHBrbXNJcG9FMFZpdlp3L3RKNmdTaGlqOWFDQm9QbUVr?=
 =?utf-8?B?Sm1HWDlucVN1OXJZRG15anRic0FXQS9SaW5udnE4NUEwOWVmY1o1b1dYbk9w?=
 =?utf-8?B?akNlakxGa210bHJuaFNrTm1HaW90TmhIQkF1TFVzYlp0RVNVb0FjQS94V0dB?=
 =?utf-8?B?bHFOQWpQY0RuWm14a3MzbmJRZ0ZKOTRtS1ZNbDJXSVd0dWZWVStGbWV2VzY1?=
 =?utf-8?B?dVVSN1pITzF2dXVWa0xFb21jMjNlRDBJdGNKTm9IdGZhNmJ4dG9Nb1dqRCtm?=
 =?utf-8?B?amUwc1BPME9XV2hPaERaVkFLY1ZkQUR4Tk1SUHF0UnRyaEV4bndLeUxHRjNV?=
 =?utf-8?B?cndzTWE4OEo4ZnkzMTVDUVRyY1BzU0QycVhGZnF6YzVBRk05SVA1RVozQk14?=
 =?utf-8?B?bGNFWDNjZ3VVRHdoNkJhcm5jajBtQmIrejR0Z3ZrSGtEbHJiRVFwakpOV2pz?=
 =?utf-8?B?c3ZTSFk1SUJUSTVROHVtVXJtWXlWei94a05TaEd2eHE2RTFkWnVMeXRDQWZB?=
 =?utf-8?B?V2pia0tvRGVoSllUM2IrUFFEWDZlNWtOc1FIOWFCS1B3clpSTnl6cHR1OFdO?=
 =?utf-8?B?NURsTVV0UklNb2N2R24rZGMyRFZKMmk2b3RjVEhrZVd4cTdNMUNtOVczZTNI?=
 =?utf-8?B?RnFaNE1uN3JyUW9IS2k4ZTZvdkRKd2t2aXpadGFMMlpyQVVwdFdOWXIxWEFS?=
 =?utf-8?B?ZmN6OEFqQ2h2Q2dMTXl3K0djSS9Ea09zM0VMSGZicXMzVGpkUHJRcHlYUFNh?=
 =?utf-8?B?dUVrZzZwVkJoUTNwWjMyRnJWMmprTGZpR3ordmR3ek56d0ZyNXlKK25tekxm?=
 =?utf-8?B?YUZxeWdHMDc2R1k5Y3BkcWV6dFU5bkdsTm52bFBuK3V6dVpSeXlKa0lGb1RZ?=
 =?utf-8?B?NmFqbHlXWFNsbkJGS3YxbkdaRXJZazhLdDVTaFhtN3EvYTErMFRuSDVuVTF0?=
 =?utf-8?B?QlJFWVo0WDJHaDhQZG9EY3c0cDQvVTBpRDZJREpBOURKUEVhSTJ6UE5FTmZk?=
 =?utf-8?B?K2VtbmVSSVVXSUxkYnR3VDJJZGZBU3JzcUdxWEh6V2VKVDR0d1ByZGxaTlNj?=
 =?utf-8?B?amNXY2duRTFUMnJmbzBGMUliOUROazJkU2VhL3pYYjhEN0h0L3NNaE4xY1dL?=
 =?utf-8?B?RUdNOWFsRk5QRmNlN05KWVVJZTJSS0hHTGZ0ckJ3LytIdUZnNTF1cmRna28z?=
 =?utf-8?B?YjFTM3g2SjgyUDFkOVY4WlNwQ2lJZDF6d1oyU0lmS2Y0VTZzUC9FWWU2aVZG?=
 =?utf-8?B?M0lkTDFiQkZmbUxvQTRZcDdaK25mU0g5bTJSU0JnQ1dtcWhsSU1RNHFlY081?=
 =?utf-8?B?SFBoZXpGMFJnY2tLazQ3dFRnVkROMU5rSGdVQkdhbE9ORW1sd2FXZUhhV2F6?=
 =?utf-8?B?KzV0ejhvVGFLNko5Z2pVY2FJWVAwUWdtbk5nK1R0bHEvZFZNWXQvUUVWcWVy?=
 =?utf-8?B?NUxYOEFaR3k1NUY1Tk9qQXErZ2dPeWpONWRsQ0Z2eE5yOGsrblJCdlVVRWpU?=
 =?utf-8?B?alprd3p6U0ttUDZ2TUhJWUVkQU9ua0ppRUJJckZ6VFlzb1JqNytXK2tHZzhL?=
 =?utf-8?B?anBQeHdocUxpTzdINU53aFZ3MS9tajRhNUhFdWpBb3NFM2ZPVVJhZU1LS0Zw?=
 =?utf-8?B?bkkrRnlnRXhiQlBXLzkyVEV3NmRYQlg3WiswcGxUNUxsVEFmZ0dqd0hVUnor?=
 =?utf-8?B?T1l1M0ppN3lIeWF5OUFvOGZDM2N5TStDaVFpRTlLRmZIQ2h0MVdtUllKQWZX?=
 =?utf-8?B?T1FZdnFKekpDNVBPWGZIWndLWW9xQ0NERG52N0dGK3YrcktTYjE5MTlRLzhJ?=
 =?utf-8?B?OFNUNjd3Wm0xQXhYbEVRaEcxdnpSVXovU2lTZ1hreDZMTnRwWVMwMzcyQmVG?=
 =?utf-8?B?RWZtWHR6b3VpTk4xbzcvOEpWMThZZG55RUJ4Sjl3dTNPUFlOdzhHd3dsMTNU?=
 =?utf-8?Q?t7ZWskTUx96Z2hT+CS1fY96yZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b51ff5c-d304-4f4a-2dac-08ddb941d115
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:24:08.9896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7rd+UPXEHVlYyhv7f04u7CAIYrBdKS73fq8u6XIcsY4pwQBsIvCfoHC4Fgwi9lZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4479
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

On 02.07.25 09:57, David Airlie wrote:
>>>
>>> It makes it easier now, but when we have to solve swapping, step one
>>> will be moving all this code around to what I have now, and starting
>>> from there.
>>>
>>> This just raises the bar to solving the next problem.
>>>
>>> We need to find incremental approaches to getting all the pieces of
>>> the puzzle solved, or else we will still be here in 10 years.
>>>
>>> The steps I've formulated (none of them are perfect, but they all seem
>>> better than status quo)
>>>
>>> 1. add global counters for pages - now we can at least see things in
>>> vmstat and per-node
>>> 2. add numa to the pool lru - we can remove our own numa code and
>>> align with core kernel - probably doesn't help anything
>>
>> So far no objections from my side to that.
>>
>>> 3. add memcg awareness to the pool and pool shrinker.
>>>     if you are on a APU with no swap configured - you have a lot better time.
>>>     if you are on a dGPU or APU with swap - you have a moderately
>>> better time, but I can't see you having a worse time.
>>
>> Well that's what I'm strongly disagreeing on.
>>
>> Adding memcg to the pool has no value at all and complicates things massively when moving forward.
>>
>> What exactly should be the benefit of that?
> 
> I'm already showing the benefit of the pool moving to memcg, we've
> even talked about it multiple times on the list, it's not a OMG change
> the world benefit, but it definitely provides better alignment between
> the pool and memcg allocations.
> 
> We expose userspace API to allocate write combined memory, we do this
> for all currently supported CPU/GPUs. We might think in the future we
> don't want to continue to do this, but we do it now. My Fedora 42
> desktop uses it, even if you say there is no need.
> 
> If I allocate 100% of my memcg budget to WC memory, free it, then
> allocate 100% of my budget to non-WC memory, we break container
> containment as we can force other cgroups to run out of memory budget
> and have to call the global shrinker.

Yeah and that is perfectly intentional.

> With this in place, the
> container that allocates the WC memory also pays the price to switch
> it back. Again this is just correctness, it's not going to fix any
> major workloads, but I also don't think it should cause any
> regressions, since it won't be worse than current worst case
> expectation for most workloads.

No, this is not correct behavior any more.

Memory which is used by your cgroup is not used for allocations by another cgroup any more nor given back to the core memory managment for the page pool. E.g. one cgroup can't steal the memory from another cgroup any more.

In other words that is reserving the memory for the cgroup and don't give it back to the global pool as soon as you free it.

That would only be acceptable if we have per cgroup limit on the pool size which is *much* lower than the current global limit we have.

Maybe we could register a memcg aware shrinker, but not make the LRU memcg aware or something like that.

As far as I can see that would give us the benefit of both approaches, the only problem is that we would have to do per cgroup counter tracking on our own.

That's why I asked if we could have TTM pool specific variables in the cgroup.

Another alternative would be to change the LRU so that we track per memcg, but allow stealing of pages between cgroups.

> I'm not just adding memcg awareness to the pool though, that is just
> completeness, I'm adding memcg awareness to all GPU system memory
> allocations, and making sure swapout works (which it does), swapin
> probably needs more work.
> 
> The future work is integerating ttm swap mechanisms with memcg to get it right.
>>>
>>> Accounting at the resource level makes stuff better, but I don't
>>> believe after implementing it that it is consistent with solving the
>>> overall problem.
>>
>> Exactly that's my point. See accounting is no problem at all, that can be done on any possible level.
>>
>> What is tricky is shrinking, e.g. either core MM or memcg asking to reduce the usage of memory and moving things into swap.
>>
>> And that can only be done either on the resource level or the tt object, but not the pool level.
> 
> I understand we have to add more code to the tt level and that's fine,
> I just don't see why you think starting at the bottom level is wrong?
> it clearly has a use, and it's just cleaning up and preparing the
> levels, so we can move up and solve the next problem.

Because we don't have the necessary functionality to implement a memcg aware shrinker which moves BOs into swap there.

>> The whole TTM pool is to aid a 28 year old HW design which has no practical relevance on modern systems and we should really not touch that in any way possible.
> 
> Modern systems are still using it, I'm still seeing WC allocations,
> they still seem to have some cost associated with them on x86-64, they
> certainly aren't free. I don't care if they aren't practical, but if
> they are a way to route around container containment, they need to be
> fixed.

Completely agree to that, but we can't regress anything existing while doing so.

And I'm pretty sure that we do have use cases which rely on that behavior, so those use cases will regress.

Christian.

> 
> Dave.
> 

