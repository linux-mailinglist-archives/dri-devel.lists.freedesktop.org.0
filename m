Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B596C2C91D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A33E10E1F7;
	Mon,  3 Nov 2025 15:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mMUQsvA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058AE10E1F7;
 Mon,  3 Nov 2025 15:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEZF+vUSMkdhk/+5wEchdXC5T1sSBIHlchU3OX7fviJxNaKZlNpFXQ+qE7mYfjeGJpnKp7SRfY9bBiu9fzTV62KDrxosWnMDqgDhi2jJKW6UoN9/zqdlLCJr0p23swA4x7hW3XrS3kWH8fxdOm8XArL7ITlqyMarpe/y6JEycIe+aox8VuMfv5Zacd//INOTHqZO12sPbQWxIYgI/IB60hhc9loGlrC74nQkPJinoOXy445ddXJVd4w1g16O0Hc2V48ZdY4i4viuCFmPVkdUYeDMUb5tF4tOK9Bov5GMDDOH7hAfVOwDOf/Xobat1W/Y3TWG7v2AV6xC4KI+d/LIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tulg9+vUagahffrm3mZBjGv6+N7A8IELaQ0WemKLgkk=;
 b=X5+PmgQlD1XR453fsqoDl7+IW2Cn5Uhwdy4hWJGxNs/aghEY2hJ5Oi5sOADxw/OrmTwv8kJjKsZ5ZE/BViOkS+PcJH57Lc9gShU6MKjxhc2GtKZ2aXvRrDhf6CiL9E/gldWZe6TjVqljCgMA7dcDm1psR8Da5vP9/prKNLdihV25oYroWY92oxqCGuOJ1DpL5Ad6ME8VfKzMI3tKeJWE1nk7dceE4q6AeDslYot4LQverpSQpyXpGP3UcnALR8yR82U3tIBHYOcLmVR09cC/A7d0oI4oRFtA0KWFYvG6ms1i+DB4Je+jNU1DIzJJ5hk+cSEXkf2kfbS6D0/IbFOe2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tulg9+vUagahffrm3mZBjGv6+N7A8IELaQ0WemKLgkk=;
 b=mMUQsvA0W5P6B0DSElqBsS6HRT6h3hvZFujphiZLYwO1jm5bK9t+N+1gCHGejA4RWWhLTu5MxTa3qlvnsWFU1ssDsFGksinEKl3Z9healyVESbtCmy6DbiQBBlMgBlfxWT8VOILhW8YmknqUuYSBLQQZEILHmh7AV44CpR01X4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 15:07:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:07:25 +0000
Message-ID: <0ea75705-2824-44ab-8583-4a06fbf61b10@amd.com>
Date: Mon, 3 Nov 2025 16:07:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/amdgpu: replace use of system_wq with
 system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251030161011.282924-1-marco.crivellari@suse.com>
 <20251030161011.282924-3-marco.crivellari@suse.com>
 <34829993-a888-4f7c-a2c6-e87723644c3c@amd.com>
 <CAAofZF5pSB-kJVr_PJbo_845VbpaB1Fbf+yeA74sWOU_vXfypQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAofZF5pSB-kJVr_PJbo_845VbpaB1Fbf+yeA74sWOU_vXfypQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0584.namprd03.prod.outlook.com
 (2603:10b6:408:10d::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 698ba267-db76-4212-2925-08de1aeab245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2U5cXhQV1ZCSklBRjYyWHpxQko1ZmdPQlVDaDJMVnNqM2tiVlRhYzhhYWVD?=
 =?utf-8?B?MGQyUFdVUE1JdmUvQ24rSmxGb3NwaEM2Mit0UlZyS2xvMXh0OFUvS01hL1V4?=
 =?utf-8?B?czNxcFA2eE9va1U5MGg3QUJsd1hXTVltRklMN1RodWh6cjJFcG15dmJlNEx0?=
 =?utf-8?B?TktibkIzcGRuVWNHU1lCM0p0WUo3SVZnWVhyN1ZEaEtUUTg5YXBEOU9PdkhL?=
 =?utf-8?B?WkQvRXJqVENUaUdTcHN4VVR4ZXlSdzBpa3ZtMUFpaVVLVU56d2ZiQkVkdm9l?=
 =?utf-8?B?YVlSZk1rY3d0d2pKYWwzOXJFckdFRVBuSGhQMjN4ZnJCa045SGZkZzJid0JQ?=
 =?utf-8?B?djN0RXpqWmNtQlJTRFVET2NJYTZPYm1abXN3T0JKUFBaR0hId01WS0dGZTVJ?=
 =?utf-8?B?WkNibXlZdUlVN0EwZzZaekthL1ZTdnNJZ05NeVltRkUvT0JCVGd4ZHZVdWt1?=
 =?utf-8?B?TmNFbGNoYkFRMzdiNDNLS0NTZ0M2WmhFL2ZIYjl3cllPejdZaXdGRzBySTl1?=
 =?utf-8?B?MlJxa2hJakVVSXdMd3NMdTVkdkNkUHNiamZXNXhER1pDSlZHVVB3LzdaTHlQ?=
 =?utf-8?B?OGRPcTlmN01SZXN4UHliUzVKbVowMTEybEJ6eE5zOVFQT3lZZVp1TkhhaCtp?=
 =?utf-8?B?bGVrN2xKSm4wbGJqNGg2ckFEc2xKbitXN0dpb3liNnhwRnFjYk1aZWh0WjVH?=
 =?utf-8?B?cjBuYjdoWWJoUHluT1ZZVTVkb2YvL2dWVTAyajU0cXBzRFpEYk5rdStXT09z?=
 =?utf-8?B?S2VjakV6WDZ6N3E4UGVMRkdwd1hVbVJEbkdVckt6YVUwWDhDSzlkZlFybkVT?=
 =?utf-8?B?WkduVVY2ZmVUMkhRZ1BUMVcwTksvL3hLOE1BSktpemZURVVyaVo3b0E3OGpM?=
 =?utf-8?B?ZXBVVXFjemdSZU9aVDRObndPcVdVcW9mamFMSzRGZ3Jtd2IxOGtaMk5HZ25t?=
 =?utf-8?B?WEJiWVdNNjFRQmFlTklGZjF6dEdNUlBYRmNpaWorRGJxbjNWRjltWHJjZjFz?=
 =?utf-8?B?by9aV3cwT1FsVVNsTzhVMU1yM1ZIY0RiMG8yNGlIWVN5MjNKNVBQS2R3bjBU?=
 =?utf-8?B?cTBlSVJWVXBZQTRSK0d2YllRN1JnUEZXc1JyWHVKbjRxQlpUd2ZxZ1I3RTFv?=
 =?utf-8?B?T05keEJpZ1VFdGJnNWNjNVE5dmIyWHRIc0h1NnZrM2taTkxMZHFoS3Z5OHgy?=
 =?utf-8?B?ZjlKQmxNdVE2QktpdWlnbElRSUc5VnU0T3FFZDRkcm1wVFJtOEhldzZDTnhC?=
 =?utf-8?B?S28rYk9jeXJzWHBSbTFqY1plRGErMm8xRUh1V2FIRVZ3THp4SFUvWUVGNHc5?=
 =?utf-8?B?eHphcjBoZTc5MWdOZ1c1NVQ2NUR5d0lnb2R4VWFFL2VNMXBVaFhkclhYZG5s?=
 =?utf-8?B?bWR4THZpenFTL0FhRnZydldqcTRpU2pyZUdtdGFJUFlvelF2V3dLMlVyT21h?=
 =?utf-8?B?QVYweTY2VnZWQ0EvcWFLOXZ1Q3c3WVUvRXpYQW9DOU85TktETGY2a0FoSHNp?=
 =?utf-8?B?THpmZnZMVThZbkZ6ZDhyblNVSERyYURCOThGT1dsRlZib3hkSmsxcjNIRXpK?=
 =?utf-8?B?NU5qNTdkQU1KVnRHWDAvbTdXYmpvZFBkemVDbVI0V21rYlVpRmZoY3JlL0tR?=
 =?utf-8?B?RW1ML0FJN3dQdEJrL254MmYxZ1NWMUE5ZFE5dWpPNmxWeVIvYzZPdW1IRE9u?=
 =?utf-8?B?MUlkdXpOUzFrc3dZT2E0REJORkdKYzdNc3h0TVhEMXlDOXZIMTVRdkJhQkhs?=
 =?utf-8?B?Z0RvTnRjRjhjSjdvWmtSK0tXTHdkMjNTOGZYOERQbTE4MnFTcXJwMXk4ZVZC?=
 =?utf-8?B?blhmUVhGQWIwVVJyOTFRdWt1OFZyL1RZelRzVmRpd0RQcitDM21LMm92Mm42?=
 =?utf-8?B?SWxUekRyeVp6VWNsV040RXgyamF6dmZIZEZKajBleHBNbENYMkRGQ2V2Kzhp?=
 =?utf-8?Q?NVjTSLIGD/X+km1+Pju513KLNS1ez/ke?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG41MVJRZ2FmUjU3b0JOZXNINms2Rm5SbnQyOFIzTnZYellyS0k1QnVvSVBX?=
 =?utf-8?B?R0JkOFN0Q2s0WGQ5eE5EcEdieHJaUHVtVTc4U1ZrM2lubEZyd0s5bFU2N0dH?=
 =?utf-8?B?UlJQa3hzQy82eXhwNUU4a0ErMFhHZ1RGWnpKd2I0dkJ5YldIV2lQcEkrTzFK?=
 =?utf-8?B?SUc4bmRJSHkvbzUrdWc3ckpObjBCczRhQzNOTFAwNHJuNldkMkxwL1QxRGRX?=
 =?utf-8?B?RFoybmhmNis4b2pENFhIRVNybVVKTGh5RDBWUktiQUhOcGo4b1BXMDUrS1Vw?=
 =?utf-8?B?NXFtVUp3eitaS3c2NmxmUHMrb3RZc3ZYQ0p0Z3doaVgwZHhwcTFXd3Qxd0du?=
 =?utf-8?B?andqV0tGUEFzbDlJZDlSMEkxcUhJUFI2Q3VSUFlQTXdjaTJkRnQyNmYvUm1T?=
 =?utf-8?B?aEl4cklWVkt2alZvMTdwbUJaRXN6L25rbmNjbEczajVKSmdDQ2dmSkNpUDdR?=
 =?utf-8?B?YUtvMDZ2K3VSMnlvZ2F3a0pybGZreEZpMm5HWUtucUV2YnY0WUNyN0U1dVRj?=
 =?utf-8?B?L252eTVreFNpeWZZaEE4WnBNZWozVEtjQUJVdFhvbTVHdjJnTlJmTHJkZDJW?=
 =?utf-8?B?SG93RWlSTjBZRHlGY05aMGYxc3dVS3dFSnRzYXliL3htaEFyMUdrb2ZxeEY4?=
 =?utf-8?B?b3IzVGVPVlJ0YnBBaitMVXd4TEpReklieUZwNXJ0Smp6d2Zpb1Y3aDhwK3Rm?=
 =?utf-8?B?c2Y5NkJYY0lUSzNXV3VIZ2VMTFBkSEFsdFA3cnJMMEJzSjU4UnYrK2psWFhq?=
 =?utf-8?B?MGdBOUNPZDhOcUpUUndHRlNFRmIyM0hXSHVTOXNCNXRKTjR2NmRJT2kvcGdO?=
 =?utf-8?B?cVFyL2tWWXRvSGZITmZaNmluUWN6VnZpOS9ZcUtZWC9JaWlPV3BvREtmWkNn?=
 =?utf-8?B?MzNUMTYvL2RscHpOS094TDVLbHh0S0tnTUY3d05KQUFNblpCUnM3NWVlSWNU?=
 =?utf-8?B?bXpWejhqTFdhR3VLWjdzQUVqUTAveXBLMTBmS00yakxhY0NqWHdFYjVhS1lL?=
 =?utf-8?B?RFlabzRveU5LSGdvQmxlSWIzVTRtKzhMa1BXNTRMZGpta3FpaEEvYlJicTcy?=
 =?utf-8?B?SDFNTU4wRnRrSDRxRU4yNWd3dzFKT3dTVXRTckpVNTJXY1F4UTA3MTVaNlNQ?=
 =?utf-8?B?aUNKTTI2M3RuT0oxRGxZZE5YL1JXN0VFR2JuRSt3aHlEeXNXRDdzS09tR3Zv?=
 =?utf-8?B?WEd5dmxJWkZPRkkzemlOR21QNG1TWXRqeUVBN1dZYUNWRUs2YUJqNklES1Iy?=
 =?utf-8?B?anQ1YUJzTEQ4c3ZPT3F1ZVluRkEwRWNTa2FaSXRzNzljYVh1SEJqUXdJamRV?=
 =?utf-8?B?SlV2dUMvN0d0ekNyNFpEc2s0QlBlUWtQRVBIQmtrU2VGVEh4YXgzcDh0V0t3?=
 =?utf-8?B?dWFicmRuNHJ3cHViQUQzTFBYUUppZWY4d0pjM0Fsb3E3V2hwV0dveDYxaVZv?=
 =?utf-8?B?ZHB4bFhLZ1M5TjU2eGdvYU1zM0RPbWhvTXB1c1grVkFTUmNtZnBBaWtrSnFj?=
 =?utf-8?B?NzV2RUxDcStSZnF2SlVYZ1FkNENvSGR4ZkdmQTIvbTVnd2RiN3o4S1p2SmU0?=
 =?utf-8?B?dk1mRjRRZnY2VXB2UUJWcGkxeWZmUldPM0FIaUZ4bmtTSTAxTGZ4c3RYZjQv?=
 =?utf-8?B?dWI5NkluVllJNDh1a2prcG9IUzYvdmpxcUlJWkh4ME12T2FaTmhxSDFzQjdZ?=
 =?utf-8?B?cFlySi9xNUdoNHFrVkxhckJOL2RGMk1aVUpoNldITnJNZkp2VFJ1R2pRWDlo?=
 =?utf-8?B?bXlOUkV4NDYwUGR1d3VVcmlOUHZUMGV6RUVUZ2pPazU0UlROOVZROHR0Y0hK?=
 =?utf-8?B?ekRnUS93Tk9QV2hXYS9COXVSYnpncGFPZ0x0d2dFSExvb0JVSkRmWVphV2hS?=
 =?utf-8?B?QlN5ZkZRa0t1aW1CRTBzV2ZKanAraG5MOXFhSGI0MUlCN3RlZksrUUkrTkQ3?=
 =?utf-8?B?U1hCZmtPcE53cmJWQmI5SGJpKzQ1TXVxVkRvMEg4bEdQOVNEVUZwbERBVysr?=
 =?utf-8?B?UTlrU0JPaU1ZV3dRNlZFejEreGlvOW9HSHB4bzNoWDNWQ200cG1SN0xBOUo2?=
 =?utf-8?B?QkRPME9xL2R4WmlWRS93RHJib0N2NkZNSGhzS1pUR1R3ZTBNY1YrcjNVamt3?=
 =?utf-8?Q?qsYjSBd2F2WrzHy7YQDDC9iB8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698ba267-db76-4212-2925-08de1aeab245
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:07:25.0905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIKKTYmhpQbhxSGc+ll7Uypc4Bj5CTVW5Tymhe8dbs9K1BqDvwYW7G2gLPusM0FT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263
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



On 10/31/25 10:01, Marco Crivellari wrote:
> On Thu, Oct 30, 2025 at 6:10 PM Christian König
> <christian.koenig@amd.com> wrote:
>> [...]
>> In this particular use case we actually don't want the percpu wq.
>>
>> This can execute on any CPU except for the current one.
>>
>> Regards,
>> Christian.
>>
>>>  exit:
>>>       if (amdgpu_sriov_vf(adev)) {
>>
> 
> Hi Christian,
> 
> like for the unbound workqueue also the system_percpu_wq is just a
> rename for system_wq.
> Technically I changed the workqueue because we added in the code two wq:
> - system_percpu_wq
> - system_dfl_wq
> 
> You can see the commits mentioned in the cover letter, shared also below:
> 
> - commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> - commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> So basically the behavior is the same.
> 
> But if it would be beneficial to have an unbound wq, I can send the v2
> with the change!

Please do so. The purpose of offloading that into a work item is to execute it on a different CPU.

I wasn't aware that the system_wq was CPU bound at all.

Thanks to taking care of that,
Christian.

> We did so also for other subsystems.
> 
> Thanks!
> 
> 
> 
> --
> 
> Marco Crivellari
> 
> L3 Support Engineer, Technology & Product

