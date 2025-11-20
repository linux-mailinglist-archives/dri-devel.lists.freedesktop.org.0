Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF44C746AC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5357610E762;
	Thu, 20 Nov 2025 14:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NusnbiG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013023.outbound.protection.outlook.com
 [40.93.201.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0300510E74E;
 Thu, 20 Nov 2025 14:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuFudPSo+p/HoEd4J2oFfaKDX8w5ejUlse8PDdtbEIh588CEDP3eRJ64EacANBPkbQaaYZpwJUm97KTGQt3vEmu+qhb2C+HHHh6Ux8Xu4MkOvNt80pHNn3G32JNNPsawEkGtzuw2fdLcSbJZjQgwaVmzl3rHaK7Q+9eyZVUoHg7tFYqfXR9RwseDFyp8McUp7Vs34MO1wq3es0HwDT3usGsHIwkCOcNNGAAGIJn3FX0dWNQT858AbthwCVi+0v5pD6owvFtuZIfw7o+iEnLzd8d70o0bN/qRtcfUeE2UQ2TSElk7YiRXCuAvV4fvbin9mm2EoQ07FAaVtznIV1Us/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcWpbYZaMtv1Uv+TT1gJyWAW+VWzHGGu7Hu4vfprDUw=;
 b=cr9EQxXSQpENDiPtvYQyqo25yMOVXpsvX8GZaxvUeiE9yyT35u90HEDcXk3PCqQT3+IMGd+d/5XoSgtgBldwCcwon86bIKNuCxlQuSVbegGFZLOsqhSXnKv+pbxwJfA6N0QxtwbaJsKHDeevmu8HDnBR5EPkksabJ5TYjJpHm+bEVSZb2VhtZikWE5UuXU7eoyIFHKiDUhrL6yX0CvLLkNuuWW8Yd5kWX4Zi9LqFoLoQUrMjLfEasVFuGfF/32wJaBE/uLiBlqBDlcb6OQiYWJIoFOudvhn5MPhPH352TUyp6am1JiS319p0EBFk5AaIcIxaA4rTC0dnDLdrl7xHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcWpbYZaMtv1Uv+TT1gJyWAW+VWzHGGu7Hu4vfprDUw=;
 b=NusnbiG/4JsIRyczuPHDT/hdKJ0W7PFB7iQAkOysrSMgk6Kay1dNgoPk7JwwRTUYzcD7aCxQHEY+ndSP2jLP5tgVI+1j9mUY7kmBsxFyXzAR7FLcsstU+JGVLytOsP6E+xWMLdzZwAi/OMdyJuOJjQ1EBYt604GTOrZ9fGvz7WU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 14:03:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 14:03:52 +0000
Message-ID: <7e436158-41ed-4c4b-a0e1-7d4bf03e3499@amd.com>
Date: Thu, 20 Nov 2025 15:03:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] dma-buf: protected fence ops by RCU v3
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-3-christian.koenig@amd.com>
 <ef0f9459-6733-4e0a-9c06-c36c02e5a93c@ursulin.net>
 <35d7ab6c-bd4d-4267-8ae1-2637d6c0f1ff@amd.com>
 <ed7595b4-b6e4-4a7f-ad35-e3a3cf063e72@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ed7595b4-b6e4-4a7f-ad35-e3a3cf063e72@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4205:EE_
X-MS-Office365-Filtering-Correlation-Id: 303759d6-1545-44c2-1cdf-08de283da2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mi9aTmlrK2JuUGlqOCtjY0lGd0dCam50Nm1vejFkWGVKclQzVUU0R0o4bGd4?=
 =?utf-8?B?N2t2WnVXYVlId2JTZUUxOTBmODVNeDJyY0hwNFhXMWhQSUNrcEI0blRaa1hZ?=
 =?utf-8?B?TTRwZjE5eU1xQ0dWZHJ0UjJraDZHLzQwd3NoTHZJMFNWS2ZONkpPOWxESUtZ?=
 =?utf-8?B?YjIySU1jTmR5MEMzblNvYnlIRmVDY0NFVmJoaHFNT0dCWEZlREticDQrcjlo?=
 =?utf-8?B?RVNUOUxFWEdTZjJ6K3hDM1ZhRmsxbk5IRll4SGFOTUNHNC9yR2ZkVlE2N3hM?=
 =?utf-8?B?Q2VhY2V2Sk5GVmNSWS82bVp4SlRQVk5OQVJWQWRZdHdpdVMrb2Y4RU5hQ3VC?=
 =?utf-8?B?ZTRHSDBmdzBPalhPK2plTVN6NXp2dDdJbDRJS25McnVBcGxKTUFzdWszbC9y?=
 =?utf-8?B?M3VieThzdklNWGdWbnhMMm1sRDYrbkZybmJaSnhxMVpDUk5JMi9KMzhBMzEr?=
 =?utf-8?B?dzE3SjkrdGtQNkVBS3I1Y3pJUGFMenMwMVQwcTJtTHplS09IeVA0eDlIeG4y?=
 =?utf-8?B?SEZkd3Q3aTU2RmVHV1p0ODZDVUhaS0ZPam5yeWlPZ0hEdkJjdWFOR1JGbDFy?=
 =?utf-8?B?SjNtYlp4d2EralZ1a0JrWm8zV0lGaVFFYlJ5T0REQ1A5N3UvV2xUSlZuNldt?=
 =?utf-8?B?ejNDbkFaRWxLQ0lnQWFSYTRZZzBPVzIxakx3RElZaXRieW9QRmFOUy8vMmxX?=
 =?utf-8?B?VlFicUxjSVpHR1VpSzhyd1U5SSs0KzkyOEd0Y1BDemw5RHpSZ25FSFJOT24r?=
 =?utf-8?B?SG84UmQ1em9veUdrZFc5RnpJU21SN1NlckJZTXpXMXBwU1NIZEFsWTBWWEYx?=
 =?utf-8?B?ZUkzZ2RZRTJ2MEpydDJTMU5iUHVRRmd0UmFrSzBlRzFYdzRJZE82c3Jxdjlj?=
 =?utf-8?B?eUhYR0hzcVNackdOcmV2elBGUGZSanlSMWVwclRxTENjenkxYktZd2FmK0gw?=
 =?utf-8?B?eHl5Vy9EcFFTRW1IQ2loaDN5RE1vR2FSSXJzcGlvWmQrblZweW1VM0t5R3pQ?=
 =?utf-8?B?akxBLzhkTHBjQ0hsWjYwTlhOYXJKOUY1Vktod2tGV3JoK29UZUVXUmVFSFIz?=
 =?utf-8?B?eXgxeHBLTDdCY0lsTExvNjFmNDArSzE3bkN6a1lDUGtYOGpDdGErdE92allS?=
 =?utf-8?B?ZVBGaDVQYVgvOFVEWGFqYS9senhoRm1NMGxvNklzRThqTUJWYnFDSzQvMmJP?=
 =?utf-8?B?Wk9RaXpaZjhCZkpmRUoxOFo3M2loUmt3eExCcDBpME1Pakw5eDhmaFYwTWxr?=
 =?utf-8?B?ZVFOR2lKU2ZVcWREWUZYanYzZEIxRlhXbmxFWTYxZEFpNzMzVWhrWnZoMW9z?=
 =?utf-8?B?ejZNNmgrRVRBb2NIb0dIVXZDWWF4SXFXcG5va2FPd29DTUJSc1ZXQVFDUEt0?=
 =?utf-8?B?b0FxU1pnMURXOU00UFFORzBYeXNBTldBbEllT0dxcjhQamQzTDVMUnBKWGFI?=
 =?utf-8?B?NnkvaURPbDU3YU9JdEVnUktWalBIM1ByVHNEN1dMR1hoSDRqK3NjY0FsckNh?=
 =?utf-8?B?M3hvVzlmQzBqNzdsNWxmZEgzbHlleXUrcFQyWll0cVZuOVFtd3JyZUNDQmdH?=
 =?utf-8?B?WS9DVW96MmFRNDhZQmpESDl2ZEVVMXlHQ2Zmdjc3bGl6aXlISFV6QitBZEls?=
 =?utf-8?B?MFFLQTVTSCt0NGllUEQ3RXV1OGJZZk9MS2VIbURTVXR6Z0R5QTE3R3FkNTNJ?=
 =?utf-8?B?OXBIamx2ZlFxNUtUN1gvSWV5OWcxd3VBbVVJbjhVazZhUS9MVDllTlhISitI?=
 =?utf-8?B?YVgrMW5ZUWc3K1R0WlozVWx0VWVzOU1COTcxSHNyNy9ya3FqM2lLaC9XSGlY?=
 =?utf-8?B?SURxQnl5bDZnOHEwRVZ6MXRRZCtxU1dYc0VCUk05KytqRlFFL2c4ZzE2bDQw?=
 =?utf-8?B?ejZDSjdUajN2ZE1ScmF3NlF5RmliNk1Wd0J0bGxSVnJ2WUx0a1JPN0pFc0NR?=
 =?utf-8?Q?wGBDHz9CUKuKKyPZsQaQGZIUco7q6tnT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEJmMnpyN1ZHT1NTdU9VYUg4cHV1WkJZajh4OEdkcVdud3JISVdpSU0zcVlw?=
 =?utf-8?B?QkQvK2JSbjhaVVpoUkx4ODQvNHJKc3YwY0F1bjhKdGc5QU9KcDlpWm93M0E3?=
 =?utf-8?B?a3doZkExUVBvK2J3VDhGNUQrbHNJRmtTbnl5NEVuSHRkOVpydEtiTVlNdUlj?=
 =?utf-8?B?bDVmRzR6NCtNbGI3WUhrRmlZZHI4L1BQbHBzbFNQOGx2UkZXem5zVzI3RHNx?=
 =?utf-8?B?RllWWUlGVGhxcUhoM1hKSnJ4emhKTENpOENiQkNuRXo1eFkxZEFVR0hGcGFC?=
 =?utf-8?B?cnUwWE9URWRHZnNFODhJaWJiOW9WVktZNHc0MCs1QmUvc2hrc2tNaDFxbGo5?=
 =?utf-8?B?VjZESXZrV1lhMVBMSEU3WWNEazVrYkhUK3F1Nlg1SEFjMjh5MC9HbGs2TnB1?=
 =?utf-8?B?WkhHYWQ1Y0pMVTZtak1sTFRsOUZua0tFR2l4dW5Wa2J4blJPMWZRRjZPQ0hi?=
 =?utf-8?B?Q2ZzcUppY2JiSlFoYUpncHpqN3A5UGowL2NUZTJZYzl6YVFZWUkwZitsV1pq?=
 =?utf-8?B?dGNkM0dwd2NqaUN3enhob0VaRVhUcWFIbDh0enNBc0llTHVGVVZjYXJPSjJK?=
 =?utf-8?B?b1FNYkJuUXVEb2U1cGlhZEhSdm0xODI3V01BaFNiMVRkcm1xUE9XcmF1dTk3?=
 =?utf-8?B?azE4c3BsZkJZT0hLV01VZHRDQU40eTZGM05PdjZUK24zL0RTR3psdCttYy9Z?=
 =?utf-8?B?MC9ROHloRDVPcUtSWFJxcWtOblhtemJNUU5IeXlaQXZuUDdYYmtqMUtyNVVq?=
 =?utf-8?B?a0dTUUdpNmwrZXd2c0hLNDE4OEZHVnYraUNqbVlDQ3JZYW5XNnhYY21BQ3h3?=
 =?utf-8?B?dmtheElId0VWTGpHSmN3Mi81WlhNZzJBdW96bVdkMjA1MHVWby9KTFFsdjJG?=
 =?utf-8?B?VE13czB5QUZKc2FYSTh6MGF6RUlibm9OWjRNNXVWekhWaExWUURsTUZSaHZt?=
 =?utf-8?B?RTYvUXpXV3dBc0ViSGtFclhmdE5NMUdpd3ppZVVZekpTTmdmRmtwVEkxTkpp?=
 =?utf-8?B?ak4xSE5JZE9DNmNBb0dnVmZWczdUMVROOTNsUzJtN2VFREJvNVFYRTF2TUxk?=
 =?utf-8?B?WTNIMmIzelYvTDAvazlsQW03dzJiUFZkUWpHTU1LRXVkd1BRaFlDRGxVMW5R?=
 =?utf-8?B?Z2xBWG5tR3ZoSjV6VWs5amo3akZFN0VVTXYxc3EyUmI0UFJBWE5PRmJXdTVq?=
 =?utf-8?B?L1IrNjVVQXNTeXhKdlBMSXpidjJhT3hHYUJsUjZuZGFuVm4xdVplR2NsVnlJ?=
 =?utf-8?B?cUdvMy9HNE9NUnRMMm1zSDM1Zm5VZktMOThROTEvU2pOUFNVbTZkdzBLMUtL?=
 =?utf-8?B?U3NiaU90SDVLNHl1S3g2UFc4S1NzNE1uUHJkakcxeUo3cVVmSjFtcWRka1lY?=
 =?utf-8?B?cW16NHQ3WXdsdWM5bC9jWTZ5KzRFdHhKL0FYRkdCRHpkK2RUcFNsSG4vU1FY?=
 =?utf-8?B?WXFhRldINnNCVTV0bUVVUjh0cXUwNUVoUE5MaTJXd1ZVNTdCcTlEaGFZU3R5?=
 =?utf-8?B?L3BjenZvYkd1dS9wcTVGb0xKdzkzWVAzSk9uQXJRcFgwTm9GZlU5YjVmSzlS?=
 =?utf-8?B?WjFDaEZNQ1dtalBDcGd4VnpaeWI1alhKWUdjQWpoTVZOT2Jyc0tuU1VKRGdI?=
 =?utf-8?B?LzJicFNQcmxnNWRhUDlraGxRaENKOVNTQWpHSThTQXluWGtGRytzYzJRM1Uy?=
 =?utf-8?B?RVNBR2ZBSk95THJkWEpXVjh0eUsyM015QnBjR1lYUW1pRGRIS2Vnek1DaGhv?=
 =?utf-8?B?VjhINjd5b2dOMi9VZmNCdjRFdEZyeXhiWnU4djFaUzdRY25qeTA3T3NqTURL?=
 =?utf-8?B?bC8xUUxxOEc2S1J1UUFnV3FnenY2a3NvVEtoQms0OGlsSjFpcXpLc0xHYzRo?=
 =?utf-8?B?Rm5wcmhLSXNienN0b1U5N2JRcGpXQzBKK3l6SHFNZXN0WGErN3B2QjBWVnVB?=
 =?utf-8?B?bnFoMXNIWEVlZE5xT0hHSzNQeDN3TVdIcWhaQzJaRERoWWQxS05wNkU3RGhQ?=
 =?utf-8?B?bFd4OUJKTG9EdHVRalEzbllucWRTT0RYVUV2OFJaUUpvM3Y0aDJicy9kQnRD?=
 =?utf-8?B?Z0FvWW51eGZyZ3pIZmxQOWwyQlFMbFo3bnpCSWtsQlQ0OTI2Wlk0K1I0SjRt?=
 =?utf-8?Q?nS+oj4i4zGmTX9K7z9YC5GflK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303759d6-1545-44c2-1cdf-08de283da2ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 14:03:52.6826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6s56qlgsbrlKcscCRGEiPUYbW9s9T+3Y3iSo0m2GvxK4oRRfVYtBd3k/8ynSRdK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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

On 11/18/25 17:03, Tvrtko Ursulin wrote:
>>>> @@ -448,13 +465,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>    static inline bool
>>>>    dma_fence_is_signaled(struct dma_fence *fence)
>>>>    {
>>>> +    const struct dma_fence_ops *ops;
>>>> +
>>>>        if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>>            return true;
>>>>    -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>>> +    rcu_read_lock();
>>>> +    ops = rcu_dereference(fence->ops);
>>>> +    if (ops->signaled && ops->signaled(fence)) {
>>>> +        rcu_read_unlock();
>>>
>>> With the unlocked version two threads could race and one could make the fence->lock go away just around here, before the dma_fence_signal below will take it. It seems it is only safe to rcu_read_unlock before signaling if using the embedded fence (later in the series). Can you think of a downside to holding the rcu read lock to after signaling? that would make it safe I think.
>>
>> Well it's good to talk about it but I think that it is not necessary to protect the lock in this particular case.
>>
>> See the RCU protection is only for the fence->ops pointer, but the lock can be taken way after the fence is already signaled.
>>
>> That's why I came up with the patch to move the lock into the fence in the first place.
> 
> Right. And you think there is nothing to gain with the option of keeping the rcu_read_unlock() to after signalling? Ie. why not plug a potential race if we can for no negative effect.

I thought quite a bit over that, but at least of hand I can't come up with a reason why we should do this. The signaling path doesn't need the RCU read side lock as far as I can see.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
