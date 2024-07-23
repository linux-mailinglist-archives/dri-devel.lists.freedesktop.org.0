Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F37D939A54
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 08:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3075710E435;
	Tue, 23 Jul 2024 06:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YjrXQRfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2051.outbound.protection.outlook.com [40.107.101.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCFA10E451;
 Tue, 23 Jul 2024 06:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHvsFp4QYUfLSa2LazwPKeVYQZtbAsSt5WraR0no3ab1pyBIVwsH3Bbm22MUvuNn3Xf7RHUYKZ/2U5WOW/sLCoYWpiwRXOI/i7D6tc6iQcoza6cJXkhcgIXCl6yIvd3ANde3j9Lq1gGHZ/pxgfN8RVW1Nk1Y365DigyWztF4hGedpPBLglh9N2mmUYx0AdjpAdVBksGYMstkIO/+5ZvPZL0rqv8RNwWcN4zUcmANqJKEIsYKM4tmKRrjiVVTTbYZPzLihz+FDpjk6gpRryIT5xW2cFdYu0KXM3Qha4SLRJ5mnd2k07Zkmk3V0X8s8d+9WFdEjeMsthtGlIRv+CBkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piazDI4uQ932TbhXQ5V204DwJ/7qiyjLS/eFM1BHlDw=;
 b=PQgpVq04G4NwPZl3OMHgpJdv1le2gko2U8tErZlX/JXwaWW42pNL8NuCEKFmbNy+ZqhIeZL52pTIrCOm40N4sA6rDcQ6iPTqX12QKBn2BvJe4JrkklGV8oZ+6NNPDpQlAT1vURibaVb1Hlv5D04XP8/Aze2RyrHCZJUYLMa4pd0h8G3muHHnhOD9TgnK4dBi/TPMb3eT/4sINvisLRjkzSMGxjWSOPlsF9/JPKOvpdbypJlmk0NJcv7ITIufE0Ui0nF4i8Lw9UFiBlkpZMWMG8qJNvZVfRE97d1x8WAdvS5ZgvMxJ9eyqf1TMzvG5MEAGO9yLRUW5W/0JzQw5OOmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piazDI4uQ932TbhXQ5V204DwJ/7qiyjLS/eFM1BHlDw=;
 b=YjrXQRfgOHhEGNzQ6vt49LYx/5/mlSndUrHFN7HvMPm2w2os7PBGHXg+0JpaIrGrd47Bse1w6E2s2jV/ayvRyeLjBF1opZ2wy1LghQ+V3HjjrSEedxUrQjjCwu0HomidwKqGCWfK3bRiTwH1vy20fuKGT1+xQTsdjanWlqLZq1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6153.namprd12.prod.outlook.com (2603:10b6:930:27::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Tue, 23 Jul
 2024 06:44:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 06:44:46 +0000
Message-ID: <6ff49934-4d34-4ce6-8b4e-f36ca4ea9b7b@amd.com>
Date: Tue, 23 Jul 2024 08:44:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Nouveau fixes for TTM refcount rework
To: Danilo Krummrich <dakr@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>
Cc: dri-devel@lists.freedesktop.org,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20240718165959.3983-1-dakr@kernel.org>
 <eeceb079-2397-447a-9217-64ba01e21b0f@nvidia.com>
 <260f84d6-17dd-471a-a0c2-f21542da9ae2@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <260f84d6-17dd-471a-a0c2-f21542da9ae2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0407.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 990c223a-deef-4ef4-db9b-08dcaae2f156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eklnUGE0eEpNcDJzdzYzbXBHTTA1WGpkMDk0Q0p2WTF3RzREMHFKSlA5dGNw?=
 =?utf-8?B?VlloL3JGbW4yTmJudzlXNFVJZzNBNTBITGlVUVJBdld6THdtOU9ueEc0alJY?=
 =?utf-8?B?S0xGMzNONUlGVFgvMlFlRlhNNUZUQjJ4YmlmNlRtUGxrQm53ZDFDeFIzelk0?=
 =?utf-8?B?MUgxK0pueEJHaE9qbFBVV05wT0hCMmp5UHhMamhFWTRnV3JrTHA5KzNNQ0N2?=
 =?utf-8?B?MHZSSTk1aHVuV2Y3MmhzakhOZ3U1L3RxV01UdjFNNFlwR2Z6aWIvOHp0aGNn?=
 =?utf-8?B?aldVa0tGbmo3dXFtcWVMN0JTcW1FdDg2RE8vam1UV3VzNE1kNGJPNXVQSWV5?=
 =?utf-8?B?d1Q3Wmp5TVRYMTRsSXhWTmxTSXpObTRvK2ExV05vOHl0dnUrQ0gzT21sM0U2?=
 =?utf-8?B?TU9JWnJ5NkpHV3VLV0diYUZSWDFSUzN1am9JK3M3eHZ5aFpya05KcWx5U3o4?=
 =?utf-8?B?dHBWdWlmTVJ6czNidnpsNWlBU0tlZFRMdlNOSkZJeDBsRm54L2ZlWExJR2o5?=
 =?utf-8?B?aUI4RUtWM1U2VGdTb1lSMEFudytHZ2lxZURUKzQ4Zjd6Z2ZlUlBTeFFlejd0?=
 =?utf-8?B?NGtleGNiaUhHMTJ2M3JUNVR3a1J5R0tBMDByT3JpdkFRWjIvSFBBQUZ3dWRx?=
 =?utf-8?B?UC9oNFc4TkxnSUtneUxlN2NoNUx6dWcxVFd5Y0tieHEvZHdxaFJvZmJHSmR1?=
 =?utf-8?B?ak5nZ29EZ2RjNmNyNkxTUm50VXhaSVFYRDcwMHNaK3dSU1dtMkZtZmlMRkhi?=
 =?utf-8?B?SmJhK0JLV2dTY2dBTVFheGszM0VlOE45TXFJUEVhby9uaHZCZTJWNEhDdjZw?=
 =?utf-8?B?TW9saVZDNzNOVk5HMjR6Y2ZSdVFoTi9tbVUveDlHTlUxaGd0TXpOWEJxMEtk?=
 =?utf-8?B?a0JXUEQ4c3J0d2d6emN1SENhRXVQQU9jMGJsZlBIUUkzVGNwSy96Zks5VFFa?=
 =?utf-8?B?cVRGdWZtUVFLdUdlaC9KUFdxNVFSNGJ5TTlYRFBhR00zWjk0cGh1Z0JkNWJo?=
 =?utf-8?B?dGFqRVY1QWUvL3ZKeHZYdGF0cHNNTGVPZlFMYnZxMTZ3R3JyUElmSzRSOG9j?=
 =?utf-8?B?RjZxNjRhVDVGUGRmdEJkZlpDT1V1RmRIU1dKVXZDR2dtTjkrYVV3dlNuOFlF?=
 =?utf-8?B?SDJSRVRpSU9KQ3dpZXZpaG43UGlPR0szdGNhZzFhd3grWUNldkVtUW5RRTJP?=
 =?utf-8?B?RTVyaVpTa2habi9Ib0NTaWVrT2ZBd20rVEF1cnZ6TnZVQ0JrUkJFamxWdW9W?=
 =?utf-8?B?eHV4bHpnUWZqbWx0RnM0R2lwYUMzTFdaWjFKdUREMHRaUVhIZVVRRTVyVXRq?=
 =?utf-8?B?Wk5IOVMxck5OUEV2b2g0TmZlU1pNbFBLRlhRbGVzSXEwS0JuTUdNODNiYUl2?=
 =?utf-8?B?UWxHS3BYcTAvYjgybEY4K2ZNNGMrdHJvSTQ2cXF6K1BSd2VXdjFxWnF4K0NC?=
 =?utf-8?B?YkowdGZlcXZzVnlockkvdG9HL2ZtRmFXNmx5S3BJWVF3WE1jVi9ra0R1enBy?=
 =?utf-8?B?SnpwMEpjVlk2RGU1Q21Ma0h0aCs3dVlkTXdsaEdnd0g3WWxlM2hkU3hXSWo3?=
 =?utf-8?B?Y3BTVTlMTy8zMzg4UCtyU1RKNGlPMGtVeHBkd0Zld3QxVmZmWnJxM05VT1A4?=
 =?utf-8?B?NzhtQWk5NnQremZ6MG1YcFQ2OFp4amFNajV4VTJFMnk0RFRQVW9jUjltOVRF?=
 =?utf-8?B?bFZqT1FJa3ArSm92cEVDeEs4bFlsQVpiM3VieXpqNVFzdFdQM3NNSFVJcjdW?=
 =?utf-8?B?YzZOdzZzZWJjdFM2dzhkbEJTSFE3VmdPS29oZ3ZuNk01bHdYckJNTDg2UEwr?=
 =?utf-8?B?N0FaRUNNT0Q3dGVQd1JRQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHF6Mmd4VGhvUzV3bitCS2dYOUNFT0tUMi80MEN5WjloU0hFcEpiZUwyL1hy?=
 =?utf-8?B?NlhmY2RDcFNwSzh1bUhnMFRkeG9xd0ZQRXU0ZGtrV0pxNVRGc0FTejIzczNN?=
 =?utf-8?B?L3I0V2t0MitDL09Oa0pob0dUN0lqbldRWlhteTZmbnlwRUVtWkZrSk40Y3Z0?=
 =?utf-8?B?Sy9IcTJZTUM4d05VcmRVTUJuMFRBQ0JuVmZwTG9tV1BpYU02TzFnbFlaT2Np?=
 =?utf-8?B?MmVuOUJuaGhJMlo2K2JnYUYyQzBjd1BKUjlEOUVqM1pYZFh0VkNuVndLb1Jm?=
 =?utf-8?B?K0NJdGNndnZtdjNaYytuZDB1aE5uYXZtWm40dU1nQkpHbTI4VnFKQ0ZUYVJp?=
 =?utf-8?B?bnJLZHlPakI3NnNOZkZqZXBidjcxSUlZY0xhRitRdjVUYWpINVRnSGMxblAx?=
 =?utf-8?B?bEF2NkNEUXNrWGdRcmlxb3ViclE2TE0zcDA3azNZNytyeWVGSHdSU281eVNT?=
 =?utf-8?B?ekJLZnJpUElRaEptN1NyQmg1dVRCamUvcHY3RG5TMzVXVE0rZU5RTmNNSmR6?=
 =?utf-8?B?eGJqdEtzbGltek9nSUxla3ZhY2N6U2ZzL0ozMFFWd1JuV2ZsZ3RBQitYSWN2?=
 =?utf-8?B?VUhIbjU3NVAwR0xQWE82MlQ2ZTJ6ZU0reTg4cjVXa1dSMlEzMGpBU3dpdHl2?=
 =?utf-8?B?aFVadk4rV2VwSmlOcTBiazlHSmhRbjNhRzRrMGJPWFlQZnZrVzRtdVZCQWhS?=
 =?utf-8?B?cDNHZEcyMzVFSUpjWHFOY25hQ3JMMFdMbGptSjFQRlNGcFl3ck9DTDZTbVF5?=
 =?utf-8?B?QUVLSXIxaWNBYXUxRW5kS2Y3WXhveHNpZ21Kd2VQYUhiUkJPSkRLQ1dKNnRX?=
 =?utf-8?B?RFVkRXZnb2J3NWVLZ1pQdzlwbGlaN05ycEZOQU9ISFJkV0pGK1Qxc3pHRWxW?=
 =?utf-8?B?M0F1amNhcFNQZ2dlNnI2VTJJM0lheVRsRjZmdkRuZ1JOYUlvcGpPa3ZKSklZ?=
 =?utf-8?B?U3A0LzNTeXhWV0NkdVp3TENnRElHZmF4ZnRibnBtNm1IQThjMDB4YklUMmRy?=
 =?utf-8?B?cUZMb01kZVk3c3loQVBIZXJaT0k2c05tUG0yUGtnZVhJOUVpS3dRd1Z1UFZQ?=
 =?utf-8?B?TzJuWlJFckNsK2VrajduajV5VjFxaUNPUFRUcmc2ZU55d3Zub3VjRVpqbkl6?=
 =?utf-8?B?eWRMeFVua2F2VUttTlRmelpnMUNGR3ZHQkpMYnBRVk16NmYwVWlZbncxTTZ3?=
 =?utf-8?B?dUhZU09tbWg1NXpBMUMxUTg5ZGhxRkl2TVl4WmttT1I3VVptZ3g2UWZBRWN1?=
 =?utf-8?B?QlVTU3dvL0F0d3pRQjRueE9BMmdtakw1TlczV3RudmdqMEV2UG1UVUdlT2M3?=
 =?utf-8?B?VklnK3RNaHA1UHA0U0tybmJqMU1CNlNQeVROWGw4aVVkZTY3clFyMXBpU1VP?=
 =?utf-8?B?bTAzMEpidHpSSG1RQWgwczRpU3pOYUo2TWpvdlh4MklDZURJU3o3Vnl5VTVS?=
 =?utf-8?B?bVVCemlWdHV4OFF1R0MrWmFaL1VpQmVmZUV2M2JnVmtwYXYrbXV1WkQ3OVdk?=
 =?utf-8?B?TWdGeWd2V09EWElmekZrTTdNb1FWdFZQNTlGYkh3bTQveEhiem16cmM2WFUr?=
 =?utf-8?B?Vy9Vd3lTcHFFcFduMTVEZGRRbEsvamZadjJRKzZkL0pqbnBhZ2h5TmVYUldO?=
 =?utf-8?B?RnVVa21pQjVpTTUzUFV4aUxFR2JWbElmbWhHTWNGVzJPY2tYRTY1YWtJalM1?=
 =?utf-8?B?RlczVE9FSEJvRDR0bk41UmhpTG9KK1dBUDlDYmVYbkxNVVdKVmwxaWgvaWVY?=
 =?utf-8?B?UDQ5djFib1R5QU1GcXVrb0t5UU55MzVUT3dURXpLZi91VU51aHE5R0N1UVNr?=
 =?utf-8?B?aTVXL0pHckRteG9oWHFiVklqdHo0OTFkamJMcGlkbG92VnF1UTBVNktYeGlk?=
 =?utf-8?B?T25qZ3U1ZXZwOUZBVXl1OGxuc05ybjBSZEVWV3FlallMMHZQc0tEVWJXenVm?=
 =?utf-8?B?TXdTaHRudFJSbmtLRHhlUE16amtrdnVMeUdjcm51VEt1TDJLZnJPMHhMdW1W?=
 =?utf-8?B?UFR1azlZMnhwSERvQjQ4UTdaaEgxQ3c1MGJ6S3ZBQTgyaVlpTkdrNmp1aXJq?=
 =?utf-8?B?REltaURqZFNFaldpbFhXNXpnZmVkV0o2MWVyQ2dUVFNUbVU0bGJHdU1rTjhS?=
 =?utf-8?Q?sYKDhPtwtxDcjVjDaGGseCWGU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990c223a-deef-4ef4-db9b-08dcaae2f156
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 06:44:46.8828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25IbDdQrcq/s2hERXa6Y5560tyhx2SYgz+GuzcNN4XFBcA+8bdAfN2mbvUCfOpeY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6153
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

Am 22.07.24 um 23:01 schrieb Danilo Krummrich:
> On 7/18/24 7:53 AM, Ben Skeggs wrote:
>> On 19/7/24 02:58, Danilo Krummrich wrote:
>>
>>> Hi Christian,
>>>
>>> Those three patches should unblock your series to use GEM references 
>>> instead of
>>> TTM ones.
>>>
>>> @Lyude, Dave: Can you please double check?
>>
>> Hi Danilo,
>>
>> These look fine to me, and appear to resolve the issues I see with 
>> just the refcount series applied.
>>
>> Ben.
>>
>>
>> Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
>
> Thanks for reviewing!
>
> @Christian, I applied the series to drm-misc-next for you to go ahead and
> cherry-picked the bug fix to drm-misc-fixes.

Thanks, I was already about to re-base my stuff on it.

Going to send out a new series today.

Christian.

>
> - Danilo
>
>>
>>>
>>> - Danilo
>>>
>>> Danilo Krummrich (3):
>>>    drm/nouveau: prime: fix refcount underflow
>>>    drm/nouveau: bo: remove unused functions
>>>    drm/nouveau: use GEM references instead of TTMs
>>>
>>>   drivers/gpu/drm/nouveau/dispnv04/crtc.c | 43 +++++++++++++++------
>>>   drivers/gpu/drm/nouveau/dispnv50/disp.c |  4 +-
>>>   drivers/gpu/drm/nouveau/nouveau_bo.h    | 50 
>>> ++-----------------------
>>>   drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
>>>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  4 +-
>>>   drivers/gpu/drm/nouveau/nouveau_prime.c |  3 +-
>>>   drivers/gpu/drm/nouveau/nv10_fence.c    |  2 +-
>>>   drivers/gpu/drm/nouveau/nv17_fence.c    |  2 +-
>>>   drivers/gpu/drm/nouveau/nv50_fence.c    |  2 +-
>>>   drivers/gpu/drm/nouveau/nv84_fence.c    |  4 +-
>>>   10 files changed, 46 insertions(+), 70 deletions(-)
>>>
>>>
>>> base-commit: 99e0fb8b087120b5a7019f1cff6c5c2b5b925ae5

