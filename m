Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A3AFE2DF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 10:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EDD10E061;
	Wed,  9 Jul 2025 08:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XDuqHhl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98B510E061;
 Wed,  9 Jul 2025 08:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZ1DebLPYipKYFT2INntL6mMjuUB4cjepMCt7W/FcTlEboMlQcUvLea6gpymVC5lWK/b49ADfxKuAqFgwzOSTWnoKTeMI5OGwE94REgpdLej3gJyJUt3jW7ohSdeurZycEpfIzwZLxKOb29wta+bK2MtFp5kZ20mP+TWoHu51NXUT/5uZiYNmpoUD5tmlSBMdysdVlqT8yhllIb6VH/Hc04Xh0UPOdX9ecQLdXGgUPljcP4D33v5ONZ2bLo9Kl/6U54/TeNqJsqVr67z8Uny7Gjh2MXbJBaIoubq7bRMo/zhBYXp6I5G2bRmmJcIJlkapPM/W+Ix6XGAQm7Dt1+O6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pE6VEnatcnJjkhNMqQzwa+xjXNatoAWliwKd6T8+jP4=;
 b=gOv7rAbsEUUlIT/8uPhB3LFZRLJ3bPfpkquZ5+6uN9LxmmFQsbbSLewxGXbu0xlF2kwtwYCH70RiYeygdkoeILpXIJP9dJjbodyGg8YuNf4xVho9yxB5JWDe8ey36K1M2eIMyKjfGBn/dG/i4pvr4N9U26FylT+gcpew512STmZc3e95tV/QJ+ywu4SFHNhlbyYh6oc2JPdrCD/PFoLc+vb6SHLyhxmzmqNKU7PKDyADCLxXuCqYr6MsDo5CD5GZHIOGL0rDV5jNvomZsvJrlt/wzy4EuNOSgHz3WWjcfCvP0Bt768vMrryYIhk2+7GVpYjpJRXcYhOpXmkZiodyMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pE6VEnatcnJjkhNMqQzwa+xjXNatoAWliwKd6T8+jP4=;
 b=XDuqHhl2/YSHAe0XT5tdeqJrk/1B6ly14geGuXcyfCfxb1hnTd6H/EoVRGqFb1/8VGRMgZ7RAZ/D97dFTRH5jioelFwHYuNivOH6/yzyTfsfclhqZWOg+IWUJwfd642DN8cgM/LswFn3VPwQTv1a3Cecn/FjD3cIyFbqA3CT4IA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7354.namprd12.prod.outlook.com (2603:10b6:510:20d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 08:39:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 08:39:15 +0000
Message-ID: <103de0a1-22bd-4389-9f5b-c1283497387c@amd.com>
Date: Wed, 9 Jul 2025 10:39:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "McRae, Geoffrey" <Geoffrey.McRae@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
 <470a613e-d85d-4943-aa48-7590d84f7fd2@amd.com>
 <PH7PR12MB55958988869861DF44D3D007884EA@PH7PR12MB5595.namprd12.prod.outlook.com>
 <BL1PR12MB5144018C868ED8C6566B8B84F74EA@BL1PR12MB5144.namprd12.prod.outlook.com>
 <5878b6eb-7961-4ffb-aebd-601868163de6@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5878b6eb-7961-4ffb-aebd-601868163de6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 765fcd92-a015-4748-42aa-08ddbec4162d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VS93WUV0K2IwQldTQXZjbnhwWnZtRFhBTFhrWFlDQVlza3lnZFA4SW1ZMTh0?=
 =?utf-8?B?SFNDSDJHb1Q0TXoxU2RtTUlXcVNaZ3NLUnROS3VHcGhLaUFyUnVGaXM0Y0sr?=
 =?utf-8?B?YkdKOUtWQTY5K0JDSnVWLzVPcTVWRzRMZ3dvRDhwWjcyWUR4T3dYNEZsTzZR?=
 =?utf-8?B?aTVRbFNhSzJaOTVIOUp2c1NBNTUwUkVpOWs5a1RXSFpQNERvK2FVQm4zbEhD?=
 =?utf-8?B?MzM0OExRSFo4UFhRbnZqdm0xdlZaMGJaejlkVmQwQUM5SFpUek1kQzdqOVJI?=
 =?utf-8?B?VW0yc3JuTDR0TmZURHQ0bUFqQXFRemZoSlYxL3pReHdXRUlJWHUzdURuNk9a?=
 =?utf-8?B?Rm9ieVlQUjhKZ0o1Y2YwYms4MHAwbXVxbXZtbnQzbmtZN0RhZ2FXWmlFQnZR?=
 =?utf-8?B?OFhjOUx0MnNteVBPcStaUnpBUlRBNkM1dE1BV21JQS8yeTBYN0wwU0h6QkhK?=
 =?utf-8?B?T201dk0zTDJnUFI1alRRQldLUDhxNHV1LzJrTEZETUFaaFlGL0dQQ0hKeWVs?=
 =?utf-8?B?a0FFMm85bjd1TitLZTVIaThYeEc3R2hOZHlIenRWc1hQN09Xak5BbGRuM0FC?=
 =?utf-8?B?WGd1T2lEQXp3ZGsra2V3M2ZYbkFqaCs1TGxFQWRPczhOWC91NUJ6SHdyaGs3?=
 =?utf-8?B?MFZ3S21wa1N1MVBHZ3A0KzR0SDFGVk50M1Q1cmRyTmlWQkFlSSsvN1Y0dnNU?=
 =?utf-8?B?bHNaOTJ1NW43WDBuYzh3cStxTVZ1Q2xrd2s0UEZscUx3NnZCRmg4QUdQQ3l3?=
 =?utf-8?B?a0o1b3NWbXVocmYxRTVtR3crMlN6TnZDMkpiQlF5VEpDcmczOEJ4RlVFcUZY?=
 =?utf-8?B?eUFvYXhJcnlJOGJQWWdOdCt6NXQzcHBpbWhKUmtheUpwNGE3UjFySUx3NFVM?=
 =?utf-8?B?bDFCSHE2Y29ZRE1USGZ2YTNTYTBaS3E4bDdlenMrNzB1Nnk4Vy9acTVwaFdv?=
 =?utf-8?B?alN1T0N4RUpBS0dYWFJCTVQrVWlpM3FNRGN6dXRpcDlnRjdpdXBKNmpEZm9N?=
 =?utf-8?B?M1hHN3hnY2huZ3grNGlPWHBKbFhzSkN2MVRPUHhnYzBBbWN4ODNIb1VsVEhk?=
 =?utf-8?B?bUQvWmxyWlN4Ly9HZWJSbEd0SVVKaWpsZVhiWVZBUEZtdnZoRHpLODJteHor?=
 =?utf-8?B?WXR1MGd6NkJ6TjJReE5uNUphNEY0TnpFSDhGektHdzZuSGRsRTVxeTYrM0pl?=
 =?utf-8?B?UDNUWHJSS0FHZzVkSXFhYVdCbHVIRXRjNm1tcEQ5ZmQ3ckk4a3hDRHhCKzkv?=
 =?utf-8?B?eTVEbmVaR2pmWHZONEJycTZWQU12NTZJUEhWaCtpNXpLUWVCVm1DUk9lSjhs?=
 =?utf-8?B?cEJCTjh2eDM4ckV5SkNDcWlBLyt6L3RpSkhwYndiazg5eEdtbEh6ZWxpNHlP?=
 =?utf-8?B?T1dUU2NWRC9PaUVidFZwRFQ1VUxNbUJmbzdzWjlkbCtCTzE1K0Z3TkQxYW8x?=
 =?utf-8?B?Q21rTHFveG9vMG1rYkE4eDk2bGhJWFBhbFMwbXltQkREdXA1NnQvTS9QQW9G?=
 =?utf-8?B?Smd2MENDUzE4N2ZuUnFCTWp1dGVkVkE4aDZoRWZVMFVLRVZKS2s5L2hvMzZt?=
 =?utf-8?B?b1ltSFZEd1BPVWROU2NPNnQwN2RMRVZNUWVtd01vMWtETVNOQll4UmExWjJ0?=
 =?utf-8?B?aUdSQjdvanNiWHVVdk5yc0tOTG1YZGtjREhyU0dGLzBkdzhxeUFJOVp4THBN?=
 =?utf-8?B?Z3Jub3pOZTlxUmo1Yk4xVUZvRXRYeW1ZSTQxb2lrbG9LRlU3cVdwdExnRjJv?=
 =?utf-8?B?QTdiRDRBZEtnVVNENjUzRkx5cGg0MUhBdGk1aGRTZlM2MXF5aFNrN3l1WEtt?=
 =?utf-8?Q?QnC8vCXGw+DsKT2+CiBC0Ewu3yI/07V6Qwpgc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnYrQityeEVqMmd4T3JIZEdEdnBsS0NtVUZJOWFsUm1mMzh0S0thQ1JOVktj?=
 =?utf-8?B?VlhaWUl5SDFZb2ZiWUcxNGJ2aEo5WElzTmhlY0tkcVFKSUlrcDc5NnYrWEQ0?=
 =?utf-8?B?Z0d3NEMwVll4TkpZaWdEZE1SMTBUUlI4Y3ZoNThUOFk3SDJkU1Y3elhEVGpZ?=
 =?utf-8?B?NldmU3JvVSttd1hjTWRWUjZDUmRVdk9QbGFUZnpRTjRIL1FpZ0FtejhSWktw?=
 =?utf-8?B?NVVVNWVYWW1OckEzcFdNbmR6MzQrZU02UWFHMjhhMHFIL21DbDFOdEVJb3dW?=
 =?utf-8?B?VEVEWm1JWkcrMFRpZjJuYVAyTmE4bEVRZEJWc2wyelhQQUh2RGR2c1lqdGNF?=
 =?utf-8?B?UThEWlVoOGJjclE5MDNxZDhnUmJrMUhFUG1EUisvamdtK2Q1K0xnU3pnU2xE?=
 =?utf-8?B?UWlpSDJHV0xEcnYzcXRIRGhnR3VESUZCci9WWlZWS1BTOVI4ZEdtRGJIdkFJ?=
 =?utf-8?B?VU82WDNQYUJSVFRjTWRhSWIwZ3gyVWJWMXpXb3VLYVFEQVVSR2s3RHY2MWN4?=
 =?utf-8?B?TGxqQ3d0K2ZBSFZXV09KR1p5bHAvaWh5Q2RnVHJuOVNiTFFlR1R2WHFUWDhp?=
 =?utf-8?B?QTVqekNGSVg0NVZnTHlNU1RNeWhRalh1NCthclg3enBiL2dXTUpiOGg3MktE?=
 =?utf-8?B?M3kyTVhOZkpZcEdvamFmODEyeUNnL2JTTHY0NngzQnVJVURoTzZPbzZ2eUZD?=
 =?utf-8?B?Rk11eVowa0NHMDhVUExBbkJCOEp0RmJFVFRiZ2lzeldSYndLNithMXB0Z0Zx?=
 =?utf-8?B?NUoyZExlN0hlMTJaQU1kK3ZYMk1wblNiMUFCdjY5ZGYzVVRqQXlrT0xKSnMy?=
 =?utf-8?B?K1pVbG5WTnI0V1pJTENTZTBBUkpzc3lJN0g3ckZDTkpTTWVka0plNGlPU0h5?=
 =?utf-8?B?cklZeUFTdXdvN3RsQytzSmNJdTJpWlJZaWJOUU1YRUl2ejYvMlBqdXZiYTFF?=
 =?utf-8?B?V2ozclpWckJRTFZZRWhVT1VTRERLa2lwK2RlV0pYdEpWRkhzaDdFcXNtRCtl?=
 =?utf-8?B?RjZkc0U4U3d4dkxCdjhXNGczWVRaWWsreXM3VlQzNjZZaEt1eFNReVU0dDZy?=
 =?utf-8?B?ZjEzZGFhamE2OGo0aUZ1Njh0MEJBZUpPUlgvK2ptQlZXcUI0NDJyUmpWenNu?=
 =?utf-8?B?a2lNRzVVNmozQ3h0NlEzOGd2SlRxSk95ZWdNai9IVWpDR0VrWGpINExpWlFk?=
 =?utf-8?B?T2d3OWxkTUgrTGttU2RkZmQyQVdZc1ZyRGY1d25SOUdjRmdyTjFjVlhCRUVz?=
 =?utf-8?B?cWxYTGNOb0pHL2doMHk4dzNKdlpURjF3S1RzOTJWUGg5U0FWWDFkT2F1VlAv?=
 =?utf-8?B?MzdzQW96T2NSVHFiN0R5dWFHakhTeTVySCtza2oxZjJKNUtwMHp5WnJURXpr?=
 =?utf-8?B?VXdFV2tMODFWRGlyajBpcG9FU2hjNnZzdThtcGJaNTR1eHNGNmdiTWdmVzRm?=
 =?utf-8?B?ZTFwR0NTQjdwSWFTUDJzMVlHd0FPRmx2QlY1WGVPdmVhSDlSL1VxQnBhSnNE?=
 =?utf-8?B?Y3hPZnZIZE1iNW9BQVA3Um9VOUFCM1dBQ3hnbmwzL1QyZk56NXRTVUxiVGwr?=
 =?utf-8?B?cmg1djNCeU51ZVdrTmlCbzRHendnL1cwa3d5UGx6c21sTGt5WUVPdlZpVUda?=
 =?utf-8?B?c0VvSlpZcUpEN0N1VTVFeW9ZZkhyTTVOaTNpQjJBNDhvc3FIcVdTelVoWmdF?=
 =?utf-8?B?T0N5cjllRVFNcTNPaVVpRVFBM3BMV09lRG5QTXhVU0RaSkRnNnk3NE1YeFNW?=
 =?utf-8?B?QTRxS2lUWjVZeXRZN3hHVGd4bXpqQ0pMTnFOenVVUm5VWHlEVUpVNEJEcnJN?=
 =?utf-8?B?SjcwWXdkTWVNZDBhb0gxQWhyT045SDNTV2kvSHJZeTFublRDTXRMSnphK2FX?=
 =?utf-8?B?VXJwR3JyS0YxSWdHMnUwQ1pwWFJaNjZqNkx2TkZJb3dBK3dPNnd6a25qNmJZ?=
 =?utf-8?B?aVlJVU1uQXVDZzgwMktmb3R0bGJkSHBFbWdELy82WDZPUVVUWDhKY1lSamdK?=
 =?utf-8?B?R2FtR2Flc1NKVCtEV3lFbW5ueGRtdjdVZzBWK1JZRmFyNGtOR05KYjRoZEl6?=
 =?utf-8?B?N2RhR1ltMUV5dTRzTUJqbTdnZzBGVkp2bDltbzRpUWNhMHpqa2tXTTZTbHc4?=
 =?utf-8?Q?/1X+avYGI1J4uKT29zyx5pVSM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765fcd92-a015-4748-42aa-08ddbec4162d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 08:39:15.4869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9eX3FNbESq1hTpW8AtnzVKvLbDzRXGcnw5TdmKspHoqKO3jd+4JPp8t5nE3sphQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7354
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

On 09.07.25 06:56, Lazar, Lijo wrote:
> On 7/8/2025 8:40 PM, Deucher, Alexander wrote:
>> [Public]
>>
>>
>> I seem to recall -ENOTSUPP being frowned upon for IOCTLs.
>>
>>
> Going by documentation -
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html
>

Good point.

> EOPNOTSUPP:
> Feature (like PRIME, modesetting, GEM) is not supported by the driver.
> 
> "Note that ENOTTY has the slightly unintuitive meaning of “this IOCTL
> does not exist”, and is used exactly as such in DRM"
>  
> Since KFD ioctls could eventually be supported in drm node,

That's certainly not going to happen.

We are currently in the process of deprecating the KFD IOCTLs and either using the existing DRM render node ones or coming up with new IOCTL/additions to the existing ones.

Background is that some of the KFD IOCTLs have design flaws which are unfix able.

Regards,
Christian.

> it seems
> better to go with ENOTTY.
> 
> Thanks,
> Lijo
> 
>>
>> Alex
>>
>>  
>>
>> *From:*McRae, Geoffrey <Geoffrey.McRae@amd.com>
>> *Sent:* Tuesday, July 8, 2025 5:13 AM
>> *To:* Koenig, Christian <Christian.Koenig@amd.com>; Kuehling, Felix
>> <Felix.Kuehling@amd.com>
>> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com>; amd-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> *Subject:* Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported
>> IOCTLs
>>
>>  
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>>  
>>
>> I am happy to use EOPNOTSUPP but I must point out that this is not the
>> pattern used across the kernel, the standard is to use ENOTTY, which is
>> also the default that fs/ioctl.c returns when no handler is present.
>> Userspace tooling such as strace and glibc specifically expectect ENOTTY
>> to indicate invalid or unsupported IOCTL.
>>
>> ------------------------------------------------------------------------
>>
>> *From:*Koenig, Christian <Christian.Koenig@amd.com
>> <mailto:Christian.Koenig@amd.com>>
>> *Sent:* Tuesday, 8 July 2025 5:01 PM
>> *To:* McRae, Geoffrey <Geoffrey.McRae@amd.com
>> <mailto:Geoffrey.McRae@amd.com>>; Kuehling, Felix
>> <Felix.Kuehling@amd.com <mailto:Felix.Kuehling@amd.com>>
>> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com
>> <mailto:Alexander.Deucher@amd.com>>; amd-gfx@lists.freedesktop.org
>> <mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedesktop.org
>> <mailto:amd-gfx@lists.freedesktop.org>>; dri-devel@lists.freedesktop.org
>> <mailto:dri-devel@lists.freedesktop.org> <dri-
>> devel@lists.freedesktop.org <mailto:dri-devel@lists.freedesktop.org>>
>> *Subject:* Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported
>> IOCTLs
>>
>>  
>>
>> On 08.07.25 06:22, Geoffrey McRae wrote:
>>> Some kfd ioctls may not be available depending on the kernel version the
>>> user is running, as such we need to report -ENOTTY so userland can
>>> determine the cause of the ioctl failure.
>>
>> In general sounds like a good idea, but ENOTTY is potentially a bit
>> misleading.
>>
>> We usually use EOPNOTSUPP for that even if its not the original meaning
>> of that error code.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Geoffrey McRae <geoffrey.mcrae@amd.com <mailto:geoffrey.mcrae@amd.com>>
>>> ---
>>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> index a2149afa5803..36396b7318e7 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> @@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>>>         int retcode = -EINVAL;
>>>         bool ptrace_attached = false;
>>>   
>>> -     if (nr >= AMDKFD_CORE_IOCTL_COUNT)
>>> +     if (nr >= AMDKFD_CORE_IOCTL_COUNT) {
>>> +             retcode = -ENOTTY;
>>>                 goto err_i1;
>>> +     }
>>>   
>>>         if ((nr >= AMDKFD_COMMAND_START) && (nr < AMDKFD_COMMAND_END)) {
>>>                 u32 amdkfd_size;
>>> @@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>>>                         asize = amdkfd_size;
>>>   
>>>                 cmd = ioctl->cmd;
>>> -     } else
>>> +     } else {
>>> +             retcode = -ENOTTY;
>>>                 goto err_i1;
>>> +     }
>>>   
>>>         dev_dbg(kfd_device, "ioctl cmd 0x%x (#0x%x), arg 0x%lx\n", cmd, nr, arg);
>>>   
>>
> 

