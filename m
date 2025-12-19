Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E26CD01D9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059E610EFA9;
	Fri, 19 Dec 2025 13:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tYUcVGFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011015.outbound.protection.outlook.com
 [40.93.194.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306C810E48B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 13:50:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rpt55L1s1smHvdJBELrN+rXCgiscUq1fRsPZo1aCaAj1MW+Gu7FUPPFrVctxqBvljqiCtJ8mvWbCu7DdlcJKedo+IdXMrk4HOev5Y2RCtKoUnikjWK3GynsEEtOCtCpXT3ugntfCP/uZnNupQbY7w7o/nQjaxSFt5BNi3x1AK/+GHtIOTWLZOV1T84t/afcbwj9NH2EMPWccUa6L+VmiE4XLbTgs1T0nLf4z5PeptHUYzA5h+5D0APsXrEBTtwvtF00iPVDa3pFcYabk2CDiYEAouTJCtA8rcU2uRhZqaMpogDs1bTXovJLdK9cjSOkdGtQPKTiyrimoErYPox7MAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HffFPp18LcCJhtX+HWXS+oBG9ZPTU9zfsOPw8T3rak8=;
 b=UWTwb1WBbBdqGZ7cwJR4V3m1LfkSqKF3eGcmDDZ5Q+rYvw4HdzDTa2X1Asz9A5DPVb6ISqZQeBzc5UB/+uhTabMF9uK+ze+rj8NZ0iA7r7uuaU19GunVdfQN7T8xS70N/OfVUWLt86ukffFdb3fn54j/xqGzRpw50WC7DKC9tO9BeDn1u1qcxDDXsdNoowN64xI6mwP3cdqw5S7yZJRM16kOkvDu5aYPvLoxtUG0EqYHF23bxxdlurF6WMyMmsVLapJS9k9xd+X1N5BsCl/3oG7sd3IWtx6oOz+1Hj+WtEvOhK4BIloBNnzkiy7eo3ci+D9FIb/HKEKacxorL7imGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HffFPp18LcCJhtX+HWXS+oBG9ZPTU9zfsOPw8T3rak8=;
 b=tYUcVGFo8WzCh8/wXHSuLcr26kHszebxDOE486G5kec4wmZyCyxWtxvrVJoZWxmVO5J8OvTx9/PlghPUZ2d/ikFKZ7gTSrnGMs908Drbquk80Dwa+DaVUx2cbrMXq9UgUH9F0VD9dY6THksxJwDjuD8KBcT4xNnWte+1bIafWBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 13:50:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 13:50:55 +0000
Message-ID: <5eda1755-865c-4bb0-a1a0-a4e6dac5388c@amd.com>
Date: Fri, 19 Dec 2025 14:50:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: Maxime Ripard <mripard@redhat.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Eric Chanudet
 <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
 <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
 <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
 <20251219-large-daffy-monkey-74665d@houat>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251219-large-daffy-monkey-74665d@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d42afe9-9a38-4d06-c2fe-08de3f05a1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG0zdTU2SjF0UXNOWXJGK0lXdWJvbGJxZkVRcGZ1aXpwSHBDZ1F1ZXFQMzdn?=
 =?utf-8?B?bUE2OHNqKzZXTUMwVUpBYjlubWRjSklkN1BxNVpLdmxibk5tZkxjeHp0Nlpk?=
 =?utf-8?B?azlHcFYrTDZjb3ZHaHBucGFTRDc1dTlzc2k0VDZzYk10cmI0YzFBeThKS1Y1?=
 =?utf-8?B?Q0RlRm8wbkRLVU5uSTE4b3FBMnd5YXBYTzB0ZkIyQXBXU1lnR21QaDNONVVH?=
 =?utf-8?B?OGtTZHNzbDVoQnZIT2RHNk9VRXZvNlRRNjVFTlRkdU83bkxGbnBUUTFNS0JQ?=
 =?utf-8?B?TjR1R2xWTVA0ZHZRa0ZkZ2FtbUF2RmNCdTFxREtCeTlIZ0duak0vR2o3Vk9N?=
 =?utf-8?B?NDhxY3gyOXVLWEkrVmk5amo2VmRXQVF3V2llTjE0aHVsSFZrd0RFNVFwREJy?=
 =?utf-8?B?NHV0SG9yaDZyTk50WHMvaWFlbWZwV2J1ekl0NW5xc2ZhTmR6K3BKdlFPVHpW?=
 =?utf-8?B?ak5MQ1U3Wnl1dlkvZHJCa0dBaGx2VEs4MnM3bkx2Z2lmd29nTTA2VEExYUpy?=
 =?utf-8?B?VjBIS3h4ZWc3L2VjUTI4bkREN2dMUk5scGZ5NEtWYXR5VHV1MU5jWkVYL2g2?=
 =?utf-8?B?dlNkS2FuOG15Qk1UWmtjK3F6SUFnQzhtdDkyMWpDbUZZRTdrWVRnMFpjdll5?=
 =?utf-8?B?WVFzYzdMYzBHWWxkU2ZtaGc2czBZNVFGU1lEOFd3TzVXK3lhNVd0OTRFTVBB?=
 =?utf-8?B?VnVZRzFlZXdMekwyZTFYZWlvdW5xcjlCeHQxTEZKb0ozTzZxa1gzWlJ4dVZa?=
 =?utf-8?B?bDRrU09MdkRTYTE5QzhaME8ySHplN0dPbjZyTWluejhNckpVV0FUNDdoRUJm?=
 =?utf-8?B?UFovaEs4MlRvaldkZW9QczlYY3pjS3BsT0xlQkNFWTY1Ris2UlFYMFp4ZVUz?=
 =?utf-8?B?VDFTaXVOUUZrMWs1azM3ME5XeFhDNTY4TEVVSnBQNXJLcE1ySHIzclJIczBu?=
 =?utf-8?B?bi9mN2hSVWRzMEpmU3RvUnlsVGR6V1ptTnI5V1hBSHZIQitUYStOTUxkUE1w?=
 =?utf-8?B?TkZxekJ1emtPU0tjbmFoREMyV0lMbXpuaysrbkE1T09WWUZwWkVVeFpHYXNK?=
 =?utf-8?B?WDBzTEozVDVhekhhSG1lTFpvc1NaQ0VOTEFpUElWaDBzOFRvSkhadHh3a1NL?=
 =?utf-8?B?L0JWZVdrUExXeWpTcnl3YTVvMTdudDYzZFYvSXZPb2lCSjNVN0w5ZmtjazR2?=
 =?utf-8?B?NHRRcm1mRkc3K3VpQVNveVZVR2ZZWXBrVHl6WGFtMHFyZUJXVm5OUjdKSUFR?=
 =?utf-8?B?emxQRjlHbmZYbmwxampWY0s2dGNWdmVYZFBXZk9TQ0JxbnFhaWFOUDh2M0JJ?=
 =?utf-8?B?TktHQUQyZktLcGpKVHQ4WmRPS2FwdU9ZZnltQ21TWWJjaFl4b0p5R2FvS2d0?=
 =?utf-8?B?MVQ2L2ZaY0ZDUEREMjMrSkxQZ0srMEZVR0YwY0Z2cG9vckFobTRXRDRtSUkx?=
 =?utf-8?B?SUhFaGczNGRvMXdqd09HQUpySFl5N2V4Mk9keWZYZW4ybVVWdkY2bi9wVTZ3?=
 =?utf-8?B?ZVpmNEMyYy9Gb2NGNVF5dzRreVhqdGVYLy9qV0ZhbU8yalN6S09wbnFpaDZQ?=
 =?utf-8?B?bU91aXkvSUFwb3IxdmQ5VWw5Y0tqTHRBVnlMM3dvQmNidjJEMWQwTW52ZVlu?=
 =?utf-8?B?SzcybnVYOS9jMUt6SGVObXlaMzJpVnRBVTB5T0RkQWNUTzJqN1ZRbzRhbDM1?=
 =?utf-8?B?RmFCdXRnQVZTUml1TEQyNjFQRDdjVmFtMDF4RHMxbzZKK3BLTW9LSkhzWkZv?=
 =?utf-8?B?MGU4SExwLytnSmo5TVhTdUU1ek9QNHNCdE5vZENnbzJLM2VBODFXS1VDeVRN?=
 =?utf-8?B?MnlLZFBpZHpZUytqVzBORmFSUy9uWDVMb2hHWkRwK3l1Z3gvZXhSMUdsZW5o?=
 =?utf-8?B?MW9SQUJUV01YanVRcDMxYjVLeGhuNHNIeDU0Z0xyc2kzRHpiS0lqdzF5MlJK?=
 =?utf-8?Q?+/UWtASrOViHDIvQaYfR7jwEExQZpjSO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTlGalRjRE1FVjJ1RzdNWjU3ZWYxYmVORWs2NlliQmlkOGxsaEx3RVd3cmdY?=
 =?utf-8?B?R1I4dm1ocmdVYUJkRmowTW4rbFpRbGR0RHVCNys1a1cwSTcrZTZuQjl2QUJ1?=
 =?utf-8?B?anlSYjUvcFBpS1oxU0VPVFdCRW92akY5eGplYmhpQXo1MDdUS1ErTkVqRnVQ?=
 =?utf-8?B?VEZMaFI2NU5rY3VEZkFBV2YvUkxZSkJFREZjeC9VaXVGK05LVEg2Q0dUMzJs?=
 =?utf-8?B?VUZHV3Z6RENtMDRjWENqMXMyTElSTkZQSjJ1LzYySVNYWHZ0N1V6YUNBODNO?=
 =?utf-8?B?eWRTbkIySXFpbURiNFBLOHhTMVBWcEpjeDl6WDYwQzlvL3U5QndyS28wQktx?=
 =?utf-8?B?TW5EMk90SHFMYllQcHJaY0h0QnhMMm5PTEtmTXB1bE5JMFZvZEs4b3dWbHV3?=
 =?utf-8?B?ZXcvSnlhbjFiVkRSN0p0RTdsSE9FczlGVDIzN1diTXFKcDduRVNkWmkrMjlG?=
 =?utf-8?B?dVZQaTZ0a1Y4Z3pJK29qRVI4SmZTeU5Ecy9QcVpRQncySmtZOGE1MmdsTnhm?=
 =?utf-8?B?cW9DRWI3eDBEdERGRk1WZXkzUHB3b21taS9EZnZXOHErZlpCb1EvdXRvRHp6?=
 =?utf-8?B?VHZyUWxHbm1xZnJFVE1BYk1oTFcwbjk0Uk5vNCtyb0NXczJHV0hMbERPUCtS?=
 =?utf-8?B?WDhTeWtjdEdmUk81cmMwSzNRU1dVUlgyMDNhR21Zd1NXbDJUYVFZajBFazds?=
 =?utf-8?B?Qk5wRTJ2YllHTmlXZGhtd1dRc25LSVNVS0xwNExkMFZDN1lTS3BSVTZiaEdJ?=
 =?utf-8?B?T1VlWks4OUhPTHJRcithZVpwbzFsSzR1YkU1WlJEcVhMVEo4VUJFR1JoS1VP?=
 =?utf-8?B?anlQZDJBRHc5RTZ5K05NNE5vWFdVbnEyNy9mK24vbUJZMnFWcUxnUFE1dVph?=
 =?utf-8?B?STFNaSs3SFFpbEhCUjFZa0U0cEptVVZjN3E3a2NSdVBQUjg4RmgxbmNxZmV1?=
 =?utf-8?B?Ulg1anh0UHJLaVhTQ3JOTkxwZnVKaTlGMzVxODJEbmdSYWdNdU9XWWRnVlhi?=
 =?utf-8?B?ajNCWHU5QVRDY0prQWQxb1Yva0U4R2lUTzBxUlpxbDRZT0xteVljWUVydWJC?=
 =?utf-8?B?aDRSb010RFRiUm9kMVR6TXkwdy9NZk5abzhLNDJTWTYyWmVFdkhDSjhETnNQ?=
 =?utf-8?B?T0lRdGI5RjlDaGNCTW11TmlmcXZ1NmlULzJYS05paDhyL2owcTlwME5NbE45?=
 =?utf-8?B?ZVRySnZKbEtpNXJPVFEvZUVON2M0Z1RMQmJwbjVVekxrOVB0RjJJU2xkeDg4?=
 =?utf-8?B?cjJ0WXVTYnZ3T1FYaWUybUN5dWYxQlZpZWVZZ05CajNxa0lmN3lNcUJOQXZR?=
 =?utf-8?B?WWpzR3g0MkpRMGpwVXFZbGI1dHRmVENFdEV5bW1kUzN6YjQ5cUNkY09DRDhH?=
 =?utf-8?B?ZUhicC9RTmJoVEdvTFZOaXU0ZjJHYjBhNnc3Syt0UnhLY0YzQWlLbGVBZFEy?=
 =?utf-8?B?c0pXbnBhNnhJNnRnSzQ3QlBLK1ZvL2g5cmx5WWNOaU1NbjBiWEh2UHhIL0Z0?=
 =?utf-8?B?SEIvcWtid3p2dEsweUxUbDAvRHdXTnIrSTk5K1J6aHJxUDBiK2xPcG5QTFhl?=
 =?utf-8?B?VGs1ZE0zYjd6R1l6T3lNMy9QT3NyWk9OdnFZMy8rZ0RvdW95RG5EalhCczFh?=
 =?utf-8?B?L0VDOVk0NDZMc25KVmM5dXJuZTg3Yld6NVlTYWc4c3BXRHBEQkRseE0wNkZj?=
 =?utf-8?B?QkxFS011WjVERHRidmR0QjNrSElERFQ5d3dkUGpvVDZNczFXcjkvUm1UOHZM?=
 =?utf-8?B?YlBJUjl4ZFIrVDRKK0VZVEhrUXQwOEF2eGVXL1lBMFYyTkdTN0dEaDhuck1m?=
 =?utf-8?B?cllxNHdoMlRSWHZadS9FZEJsSFdnU05pcmZRTVZmc3V5cDZCM29QVmtrbjBO?=
 =?utf-8?B?YXRwM3FQTUQ2ZVpFcDhZci8wWW1lVDh0MUlFQzMzY2MweTZnQjdzaXY3TFlU?=
 =?utf-8?B?ek1BY3JScmFSYjVSNDNEYzBLZUl2Ui9YeGs5ckQ0R1EweWtIdTduTkVyU3JL?=
 =?utf-8?B?eVo2a0p0L2xIVEhpTEhsMHBuQkpwclZSNjAxdmMvWHI3clF2blppeUk4ejZt?=
 =?utf-8?B?bzEvckRWOGR3b1h5MHkvSTZiQ0Fub1dhVWg1L3JkR1dTZFlvMmhYMzR1ZC9h?=
 =?utf-8?Q?Yin0Vnvx2U774ed0CYgGg76Uf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d42afe9-9a38-4d06-c2fe-08de3f05a1b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:50:55.4877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTXlhUtns2Kxudjn7qYz7tHfU00H1IMgheLiUhW9dYWZlMzJhH6axIvHj8qUp4fn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770
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

On 12/19/25 11:25, Maxime Ripard wrote:
> On Mon, Dec 15, 2025 at 03:53:22PM +0100, Christian König wrote:
>> On 12/15/25 14:59, Maxime Ripard wrote:
...
>>>>> The shared ownership is indeed broken, but it's not more or less broken
>>>>> than, say, memfd + udmabuf, and I'm sure plenty of others.
>>>>>
>>>>> So we really improve the common case, but only make the "advanced"
>>>>> slightly more broken than it already is.
>>>>>
>>>>> Would you disagree?
>>>>
>>>> I strongly disagree. As far as I can see there is a huge chance we
>>>> break existing use cases with that.
>>>
>>> Which ones? And what about the ones that are already broken?
>>
>> Well everybody that expects that driver resources are *not* accounted to memcg.
> 
> Which is a thing only because these buffers have never been accounted
> for in the first place.

Yeah, completely agree. By not accounting it for such a long time we ended up with people depending on this behavior.

Not nice, but that's what it is.

> So I guess the conclusion is that we shouldn't
> even try to do memory accounting, because someone somewhere might not
> expect that one of its application would take too much RAM in the
> system?

Well we do need some kind of solution to the problem. Either having some setting where you say "This memcg limit is inclusive/exclusive device driver allocated memory" or have a completely separate limit for device driver allocated memory.

Key point is we have both use cases, so we need to support both.

>>>> There has been some work on TTM by Dave but I still haven't found time
>>>> to wrap my head around all possible side effects such a change can
>>>> have.
>>>>
>>>> The fundamental problem is that neither memcg nor the classic resource
>>>> tracking (e.g. the OOM killer) has a good understanding of shared
>>>> resources.
>>>
>>> And yet heap allocations don't necessarily have to be shared. But they
>>> all have to be allocated.
>>>
>>>> For example you can use memfd to basically kill any process in the
>>>> system because the OOM killer can't identify the process which holds
>>>> the reference to the memory in question. And that is a *MUCH* bigger
>>>> problem than just inaccurate memcg accounting.
>>>
>>> When you frame it like that, sure. Also, you can use the system heap to
>>> DoS any process in the system. I'm not saying that what you're concerned
>>> about isn't an issue, but let's not brush off other people legitimate
>>> issues as well.
>>
>> Completely agree, but we should prioritize.
>>
>> That driver allocated memory is not memcg accounted is actually uAPI,
>> e.g. that is not something which can easily change.
>>
>> While fixing the OOM killer looks perfectly doable and will then most
>> likely also show a better path how to fix the memcg accounting.
> 
> I don't necessarily disagree, but we don't necessarily have the same
> priorities either. Your use-cases are probably quite different from
> mine, and that's ok. But that's precisely why all these discussions
> should be made on the ML when possible, or at least have some notes when
> a discussion has happened at a conference or something.
> 
> So far, my whole experience with this topic, despite being the only one
> (afaik) sending patches about this for the last 1.5y, is that everytime
> some work on this is done the answer is "oh but you shouldn't have
> worked on it because we completely changed our mind", and that's pretty
> frustrating.

Welcome to the club :)

I've already posted patches to start addressing at least the OOM killer issue ~10 years ago.

Those patches were not well received because back then driver memory was negligible and the problem simply didn't hurt much.

But by now we have GPUs and AI accelerators which eat up 90% of your system memory, security researchers stumbling over it and IIRC even multiple CVE numbers for some of the resulting issues...

I should probably dig it up and re-send my patch set.

Happy holidays,
Christian.

> 
> Maxime

