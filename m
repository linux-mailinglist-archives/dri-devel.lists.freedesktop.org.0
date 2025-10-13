Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854D1BD1C82
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 09:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5540610E3D9;
	Mon, 13 Oct 2025 07:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wks/i2YZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010033.outbound.protection.outlook.com [52.101.61.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7CB10E3D8;
 Mon, 13 Oct 2025 07:28:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nur5BJerzXJNksEwTTlb0Lr00V+9fHKajjSy7Tp25toXTioOBun6EfFhDgpXVKFHqRvKpn5dUG4I/WcMzKx4J6jZUTt/Ch9n9cHcxXZZBE0Izvklci4L88tbkNscIl1v9GaBX+EC1hIv1k/ERRKkgJnm2TPoFjc80POb0Er8CR20gx4sp3oYn9Eo2T6L1Rr184sa0p2A4GA1FKAiNi/n6glpHPW2LYz58jZcjk5vNG/4OKckgEYlWd7onHsuK9jrGhxsjP9yEc8cD7+at8Bruo8nJpwzkhYaEynW6ri7xn7Ygphv7FG4VZsTu2NYr0XEV84hGZo+oNa08Y9xh/eVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t0/ghDLOdwjVaQJybLYZy56tfNj5ERhCpxI0+IUt/g=;
 b=gJ3V2jjXi0v7yr5nmzyQMHwZwUUeJWdMdAMubL6RSX9rFuuGPGRp1cgm7uZWbCkgbvw5kpmnDfQ8/OBhBe445tIcCF2IXFFeQ9NRLmCo1DtpvVIc4QPvjqd+7QUz0HQsV79eSTD0nqgKf0BMp/2y9QEZVjLdqqLPv7PVW5ubHS20sPvXVnbA7RXJl3V64yWaW/su1iiOAr9aRhzLDYimwUnFfAX7z3rEB6+giyTwzykYat7aPHVhGxH1exDysH+3ZUKpDooRHazhqBxf+k41uWtU3OClM8ReyfuCSiYl/vMTU3y4rtAU0wU0+dzrjRMtgRJwGuEgICymFaS3OE+SAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t0/ghDLOdwjVaQJybLYZy56tfNj5ERhCpxI0+IUt/g=;
 b=wks/i2YZYH6jwphogcEkFsfttuHUS0eoa437Csyo7ypRQcxFWuBd4SuQIkhIS3woT0gzJUg6djAUTzAaxRP++tFLx+Ts50raVdg3tuGyCTQXwjlJcBmF7JNrYvhJW68tydXoDs0CHfEghXiq/ScdVShPTgIcf7R7h880W6q+M+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Mon, 13 Oct
 2025 07:28:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 07:28:54 +0000
Message-ID: <d2001388-bf0d-452d-b8ec-da45f557dd2b@amd.com>
Date: Mon, 13 Oct 2025 09:28:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Add NULL check in ttm_resource_manager_usage
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Yang, Philip" <Philip.Yang@amd.com>
References: <20251013015550.1317222-1-Jesse.Zhang@amd.com>
 <DS0PR12MB780437771222808EBEB675D797EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
 <DM4PR12MB515282926AA157011BF319C5E3EAA@DM4PR12MB5152.namprd12.prod.outlook.com>
 <DS0PR12MB780447BC946BAB3EBD54B7CC97EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DS0PR12MB780447BC946BAB3EBD54B7CC97EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0575.namprd03.prod.outlook.com
 (2603:10b6:408:10d::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 439c2182-4e09-4576-d18f-08de0a2a29a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M051cXAwUFpTaGpIZkdTdG1TUkNNaU1ZaVQ3ZWZxT3QvSXFwelVlKzdaSzNJ?=
 =?utf-8?B?dlZNbjE5VGc0OTQyOGkweXRjclZUSGRxeTdKdkZaQ2VNMDhJSXZJMHlodmNF?=
 =?utf-8?B?WCtKRTBMVDQrZ05oMURIenJLLzZFczBKYXF6bFZ1aEkzWWtJbzdZaGZTdXB1?=
 =?utf-8?B?SVZFanVCcGV3TjN0YjJabit4SVpTNHo5b1Q0WWpRdm1QbldWcGJjVThZNyt3?=
 =?utf-8?B?Y1prb2VqaVp3VEo5aGlzdllzZE5sRGZoeGpqdVBIQlZnUmdHbkFPdEVENmRE?=
 =?utf-8?B?SEp0Z1BWZWtJL3JsUkZScHFibFhuRzJZYVBOZEQvRXBIcTJOdVRSQmx0YUww?=
 =?utf-8?B?b0VBU0JWb0szOTZIRHR4OWpyN0FkWDlobCtpWit2Tm43dk9XUEh5M3czS3k5?=
 =?utf-8?B?bGJrd2k5TXZYT2t6RUxoYmJFMWFYdHJ1dXl4NjJ5Z0NlZVRFVzViSFp5alQ0?=
 =?utf-8?B?aHZkcENlZnNiSWFIWXB0Qy9reUh4em5hV3RtN0p3WW1MOStLcDY5VmZESUlC?=
 =?utf-8?B?WjMwL3AxdjcxQU9GRGlyRVlNZTVpYW1jL0pmZjFaclpiRjllV3ArS2hjU2Zm?=
 =?utf-8?B?N1Q5dWJLQ1ZJM0h1UXArS0ZzRmVTZ0p6TmVPaUVBNWVQalF0cS9wblV2eFBk?=
 =?utf-8?B?M1NQZjNXT3RTZ0J1MW50OWlNK05mVjEwS2xGeStxRHo5RzRKa0xlZHlOdHkr?=
 =?utf-8?B?aWtNSEtRaFA5Zlcvbm1VWVN3dFJ6ZTNFUVhvZFVua2NhcmlCRnV6ZFN1VS9l?=
 =?utf-8?B?czlTbmhuYU9KQUlJYWV1LzI5T0lGSU5QbmxZL0NBSUFiTXB5U01SNzg4Y2hV?=
 =?utf-8?B?SkJNY1VJVzhhaUxvOEdwWXBmRlBITlVIRm43ZE5MMnhsVjdHU1N3ckdLV1pz?=
 =?utf-8?B?NGFGUUNraFpiSG5xdVJXQ3oxWUxUREJMMWVoTE1lV1VKUlR5L2tQV3c2c3RK?=
 =?utf-8?B?K1B1Y0d6RU1kVDY5R1d3K2JoSjRTNjdhMDZwcHcrcEN1cFJmOTNKZnA3L0Y3?=
 =?utf-8?B?WXlPcHRIU3JlQ1JmMHB0bm9CSzhMOWlxRWRLTVFKMWpma3ZqUEh5ckxUdXFJ?=
 =?utf-8?B?SU9MRVoyU01ueTNUN1ZpbzA0Y2QwU2Rqb1Q0WkRCcGhrMERtL0Nnakozb2Y3?=
 =?utf-8?B?dHNsYXpkVTk0OVRTL0UzUk1YOFU1T1hRM3hweW9kL25hUVJIZGlReHF6M0h4?=
 =?utf-8?B?c3hadjhZSW5nSUMxU0F2eEhveVlMY0pUbDJMV2crZmRkajIzNGVCK0kyQUw2?=
 =?utf-8?B?MzBDKzU2NThtL25vT21CRDNPOW9abWdnMk85SWNiSVlvMk9PVmNSOXpKMUdV?=
 =?utf-8?B?QTE1NVEveTBsUEJWV1RjWVJjaGVSbFNYUGxUaDRYL2pxUlByYUZrSjI5NlNW?=
 =?utf-8?B?eENZZ25ZalEzMWpNMUVaYXF3andDanB5Z0JTcElnV3JCc3RsTWxTVjhCNFQy?=
 =?utf-8?B?QkRqWnBocmxsWHU0VnBoSFA5aGhwQXpiSE52Skp3cnNrRUhCMy9jZkFESDFa?=
 =?utf-8?B?RTNpY3ZEenZwOEU3L3ZtZGNrYStBbG80eU14dU0yczZlemJNVERMME1xd0or?=
 =?utf-8?B?QU1nbENyZ1F3Wi9NZXAzV0JJMmEyUld3UUptYmtMSExNNlEvbGpnbjRrV3d6?=
 =?utf-8?B?NExDMnkzWVdDZUg1WWJQSUd1ZElKSjBndWhuS1dFZ2c2NktuY3gzWThxeFdz?=
 =?utf-8?B?SU1YVENWakgzRzNCTVhSRW1XNFRMSkxTeFk4ODVYeTVCQkhtZ1NKTGhwWEU1?=
 =?utf-8?B?QmFqczRTTVhWc00wN0ZBRmk2eElXd0ZqTThiejR5M25kbmhEdzlRaFVzdnNB?=
 =?utf-8?B?M3hnV3BNdlZ6YzBjZ3ZBTFZlOW9UVTRnVkVTTXNucCs1SHdBdzNRT1JtN1JR?=
 =?utf-8?B?dUhJWldjaGtJSHV4TE9tZ2tjM3ZPU2R1dWVFVk5FejNheWZGUURNSzhkSGNu?=
 =?utf-8?Q?YyeyXbD7OSYo4kRqEAI14vCm4/aCPg6y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjIycGRONkVhdWtnY0d2NG14M1RLTS9wVjByaTB0Ymp1QjgrN252THNxWi9r?=
 =?utf-8?B?RjRMb2pQSjI2L3hNQWJkS2Nqd3pWSDFFek9jYWs3NW8yOUpzRkM5SnlDL0NQ?=
 =?utf-8?B?eFhSQ00ya1ZvdzR3eWJndWp0QkhnbDFwVWJmdHo3eGFUMld5RU1tODZRTit1?=
 =?utf-8?B?bTdUM0loNE4vR1lDSlRFVHFDZzFNR0JhVzZMbk4wbkZPL0dMS0gvWVZ5RlpX?=
 =?utf-8?B?RXkzWHpHUERMWTVwM2wvenhWMjV1QlRRR3BQM01qVytLckIyVC93b01DMzVm?=
 =?utf-8?B?ZDhPVjR3ZDh0cVRmMjJMZldoeHJzazczeTE4N0NlRHF1b0NUVG5FWm0wMEdm?=
 =?utf-8?B?SUI0akp1MXZieC8yc1pLRTRNYlBBSEpDRE4xRDk1QzMwVkRPZDhQM2hYbTNz?=
 =?utf-8?B?OVkrOHdDMDdpM3p5OHRxV2w4cVpkSURjV0V0UU0wTlhqeVY4T0tySWcyM3U1?=
 =?utf-8?B?Rm9XRC8ycVRPbGlibDd5VVFRSWRhbFkyM1dEZ1ZrTVRGUjM0d3FvWkVvWk1T?=
 =?utf-8?B?SHRmMUEzWlAreFp4c0NacDhrdHFpUjQ2eDRuSkFjVWs2czVSUUxuSkcwVDRD?=
 =?utf-8?B?RFE1TWZrQ1U3Y0xRdmhJWEJIRG0vbUtxK0IwWlRkOGtRUEZramR1czRyV3dO?=
 =?utf-8?B?TTlaTjhUMjQvQng1ZDVYUDR1VGZjQmVRaGNyTS9VODkzdGpFMmlhL2JURzg1?=
 =?utf-8?B?d21vZ0NDbWFWNnNDOTRpU2VENkpoR2RGYjduQmhzemU2azFUK2NhQ1luQ3pm?=
 =?utf-8?B?ODAzVGVOdjBZT2duM3lpdVoyNnRMc0o2M21meEJHejRCbEkwWUk1emw3SlVl?=
 =?utf-8?B?QTBjK3AwUmFiMm1ISHVJQzRTM3d1MnJoY1JjRm12aENVV21BMXV6MVZDUkxx?=
 =?utf-8?B?dHhoUnR1YmJ3R0tuNWhFWnZWeEJOeGUycFcvNXJWTzZQZVFUUzJyTXBGM1g4?=
 =?utf-8?B?V2IrcENGeHgrWUZBQThYajQxZjBOMWs2Q1hRS01PUEtXY3hrTGV0ZllzYXBy?=
 =?utf-8?B?ZXlhd1pnRUI4ZlpPeWFoelVoako5bGJMNUhNeHZRa012dEpNcmIzd0V0QlJL?=
 =?utf-8?B?UDJUcVE4US8yOS9ZSVdnMHlrSUFDbnIrQ0tzRUlOREhtczFQcVFpU0k0T0w2?=
 =?utf-8?B?OVdMQmNCb2tWblp0NlNiUlJtL2JZYndUUWN5UzhKOGhjZXZZeDlQSzhvQ1dm?=
 =?utf-8?B?d0J1dElpNnJBL0dZWjU0N2NLV3QzMHVqMEdhMkdVekJmeURIQmFIT2oxVldI?=
 =?utf-8?B?Z1NOTGlpY2xuYXdqRUFZRFpSYTduYWl6cC9kcEVoRG1ycFk4L09VL1o2bVpJ?=
 =?utf-8?B?UXFyemJ1UGE4Zm1Wa0FsWlBSTmtEN1RJZXQyYityR3RqSExNZmlXNmQrSlpa?=
 =?utf-8?B?b09tRnl3eUVsL01uRGF4ak03UmJ3NjdLWnBjQ0ZpSWFGbk50dERBcHFyY2pL?=
 =?utf-8?B?a0NRNktWVjNKdlEvZ3JpRUJkelU0bGk3M2FJYmEySlc5UEE0YzlqdTNaMGVv?=
 =?utf-8?B?Nk85bDR1em9GOHo3dHRpbDRoQXJzY1lXQnIrZ3JDaTlTR0MvV2UxakVWb2RZ?=
 =?utf-8?B?V1lBTy9QdXhaS1V2R1Q2L1dmdk5tcklPK0xHT0liTjdWWThBMnY0VnVuZ094?=
 =?utf-8?B?SUgvSnV1TUE4eDE3RnNDeDJhOXg4N2xBa203N2ZUU0RqZmJSU2JrUU1YK05G?=
 =?utf-8?B?OUFITlo5VGp1UTFlcFExeWZUdzBxU1U0SnVDeDFacFNTR0UrZkUvTzJ1K1Jv?=
 =?utf-8?B?REhkcEUvUklIMVZZNVpOU21IN1J6aDZBTlZDWnFOOTVIWUxmS1J5bXkxQ29j?=
 =?utf-8?B?OFozcWw4amlxWWdJeWQ3M2NFbHVaMnRKSDRzcEl1blFMVE93RjBtZXpLaEVm?=
 =?utf-8?B?bGsxQ3hVMGR1V2JneThWTmJ4bUJpcU9xaWpUaml0ekMzT29CQW5Ya3R5UkVV?=
 =?utf-8?B?ejFLSEFoQU9uT2svVUtrUFJYTTZVeWJTUGZoTk0wNkppMENTb1Q4cnYyd3hU?=
 =?utf-8?B?ZkVpbVBQM0ZCVXF6OEpTcTJ6N3gyVU1JY01LM2Rod3RuSlRuYjB3NXc1aUJY?=
 =?utf-8?B?U1ViRUpFZG80VzhtUzdqMi85b0lRaVNmTkpmZUkrWnBEYkJueHJhWlVrSEo0?=
 =?utf-8?Q?1gIHQQPyM33D/Fya96Cpk0PYP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439c2182-4e09-4576-d18f-08de0a2a29a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 07:28:53.9161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 310DasXqrM0REktX04QVXwjwKgyZ5fdxLjKLB8a7kyQmFd6N5F5opq8ouIOY5riT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202
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

On 13.10.25 09:09, Lazar, Lijo wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
>> Sent: Monday, October 13, 2025 11:25 AM
>> To: Lazar, Lijo <Lijo.Lazar@amd.com>; amd-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Yang, Philip <Philip.Yang@amd.com>
>> Subject: RE: [PATCH] drm/ttm: Add NULL check in
>> ttm_resource_manager_usage
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>>> -----Original Message-----
>>> From: Lazar, Lijo <Lijo.Lazar@amd.com>
>>> Sent: Monday, October 13, 2025 12:37 PM
>>> To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>;
>>> amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>>> <Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>;
>>> Yang, Philip <Philip.Yang@amd.com>; Zhang, Jesse(Jie)
>>> <Jesse.Zhang@amd.com>
>>> Subject: RE: [PATCH] drm/ttm: Add NULL check in
>>> ttm_resource_manager_usage
>>>
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>> The specific issue of trace with amdgpu_mem_info_vram_used_show should
>>> be fixed with this one - "drm/amdgpu: hide VRAM sysfs attributes on
>>> GPUs without VRAM"
>> Thanks @Lazar, Lijo,  maybe we still can use this patch to fix  this crash when
>> calling  AMDGPU_CS and  query AMDGPU_INFO_VRAM_USAGE.
>> or add check like the previous patch.
>>
> [lijo]
> 
> Agree, there are indeed multiple places of ttm_resource_manager_usage call. You may follow the same check as in the hide VRAM patch - ttm_resource_manager_used - in case ttm doesn't take this change.

Yeah, agree.

When the VRAM manager isn't initialized we shouldn't be calling any of its functions in the first place.

Maybe it is a good idea to add something like "if (WARN_ON_ONCE(!man)) return 0;" to prevent the crashes and only get a nice warning into the system log.

Regards,
Christian.

> 
> Thanks,
> Lijo
> 
>> Regards
>> Jesse
>>
>> [  911.954646] BUG: kernel NULL pointer dereference, address:
>> 00000000000008f8 [  911.962437]
>> #PF: supervisor write access in kernel mode [  912.007045] RIP:
>> 0010:_raw_spin_lock+0x1e/0x40  [  912.105151]
>> amdttm_resource_manager_usage+0x1f/0x40
>> [amdttm] [  912.111579]  amdgpu_cs_parser_bos.isra.0+0x543/0x800
>> [amdgpu]
>>
>>>
>>> Thanks,
>>> Lijo
>>>> -----Original Message-----
>>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>>> Jesse.Zhang
>>>> Sent: Monday, October 13, 2025 7:25 AM
>>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>>>> <Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>;
>>>> Yang, Philip <Philip.Yang@amd.com>; Zhang, Jesse(Jie)
>>>> <Jesse.Zhang@amd.com>
>>>> Subject: [PATCH] drm/ttm: Add NULL check in
>>>> ttm_resource_manager_usage
>>>>
>>>> Add a NULL pointer check in ttm_resource_manager_usage() to prevent
>>>> kernel NULL pointer dereferences when the function is called with an
>>>> uninitialized resource manager.
>>>>
>>>> This fixes a kernel OOPS observed on APU devices where the VRAM
>>>> resource manager is not fully initialized, but various sysfs and
>>>> debug interfaces still attempt to query VRAM usage statistics.
>>>>
>>>> The crash backtrace showed:
>>>>    BUG: kernel NULL pointer dereference, address: 00000000000008f8
>>>>    Call Trace:
>>>>     amdttm_resource_manager_usage+0x1f/0x40 [amdttm]
>>>>     amdgpu_mem_info_vram_used_show+0x1e/0x40 [amdgpu]
>>>>     dev_attr_show+0x1d/0x40
>>>>     kernfs_seq_show+0x27/0x30
>>>>
>>>> By returning 0 for NULL managers, we allow callers to safely query
>>>> usage information even when the underlying resource manager is not
>>>> available, which is the expected behavior for devices without
>>>> dedicated VRAM like
>>> APUs.
>>>>
>>>> Suggested-by: Philip Yang <Philip.Yang@amd.com>
>>>> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
>>>> ---
>>>> drivers/gpu/drm/ttm/ttm_resource.c | 3 +++
>>>> 1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> index e2c82ad07eb4..e4d45f75e40a 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> @@ -587,6 +587,9 @@ uint64_t ttm_resource_manager_usage(struct
>>>> ttm_resource_manager *man)  {
>>>>       uint64_t usage;
>>>>
>>>> +      if (!man)
>>>> +              return 0;
>>>> +
>>>>       spin_lock(&man->bdev->lru_lock);
>>>>       usage = man->usage;
>>>>       spin_unlock(&man->bdev->lru_lock);
>>>> --
>>>> 2.49.0
>>>
>>
> 

