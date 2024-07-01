Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269EE91DCEA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 12:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FF910E398;
	Mon,  1 Jul 2024 10:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x1Dm8kCU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2674C10E394;
 Mon,  1 Jul 2024 10:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1aLi222D6Zjb+Fqxe6DmIIYCLPTLanvXneRkNtgRuYqsEapQCnKUQmv1qbwcBg20kqeiYKX1X0Zb99Gm2zFjYIJWl+xIt8/biOkxxFhap0SpM5+N7uL99Faz7VgkL2051QSN8XAfmzZaM1dADIkv3SbeVz/BGtM7iaAsKOrq5qHoB083F3nzEUOieT18Ssq5IkuaBLRP6Qwpi3s+c8gduLPl3hAVtUMN1Dz65xn6RzKK3CBq8tqXc2scHvIuc9OUxIbO/trizWn2scHjrIXZ2OcyLXB4IkTEE3wzMPK/7DUuXgkUverMdmihltI9teSNVHoaqJe9K/mKqRZj7WSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDbE/JCt4vq/hzdPD7U0pkO65wcezS6+OwHJc65pGN8=;
 b=d6cP5VUzT25nVBdQOKfFDOOkrUsAgJiKrjGvtpse6/vWz1EcsKTikdG8eO/f9TCVj/nOYLseU2M0EKll3xF3uSD/wd0HIKQSNr0CLQ/Twj90vvnd5umsxf7NWMTvNx7IxPN+GCzvwScTn+LjHfKTKPinf2XKaroLOwafPJkRE8yijVLD1/gpkUS+GqX7D2aO4nPQ3a6dxsIS696PC6LlukMIk5hk1yteigZpPgnA9WpwtDVGKd5AtkNrO4/kf8j9V0q3K8mPR9F8b/Q5c8lSL/PMJAHzC8IDaXMsqJhvYgMbkgDFD3oZXHwbb7OI1mL4hcwawekr2W4GYC0qTfBVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDbE/JCt4vq/hzdPD7U0pkO65wcezS6+OwHJc65pGN8=;
 b=x1Dm8kCU0wfTBOKGG/wSZ7ROyCThoezrSnRgW7R8Q2+C9KaRlArrThBs6U1VaCg4/hmLVT2M1iOutB+PxOzKna1v9FSU5mAWgknQe0oX3F1uF1u1C91l14FKdON06g4bU2mXooUP3TS9IqPjqYDU3CJkpOJ9q+LJgUg0FRRzhY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 10:43:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 10:43:31 +0000
Message-ID: <7caeb3e0-490d-47f3-89b8-9e1264acc072@amd.com>
Date: Mon, 1 Jul 2024 12:43:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Always take the bo delayed cleanup path for
 imported bos
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20240628153848.4989-1-thomas.hellstrom@linux.intel.com>
 <Zn7cBbi/iZ1cxWPb@DUT025-TGLU.fm.intel.com>
 <Zn79TNg1WfERV7gj@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zn79TNg1WfERV7gj@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: e01e4913-9e06-45d6-4590-08dc99baa67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU15elFESjVoWEZZY3dRR1hoSUdiOHBDbGgxSG9WUCs1Nm41OXFHbW9LZkow?=
 =?utf-8?B?TTlWbGhrRjl1UHNSdWs5dE9SRUZZMVFBeUt3QkRuV3RKNnNoUXZ1aTlPOVFu?=
 =?utf-8?B?aU4wcTBoQTBjMmEyV01BdzY3ZUw2VU5YUnEzTVBJYzQ0dkZHMzJaZVArWVky?=
 =?utf-8?B?UExBT1FXY3c3VHhDRmUyT1NiWlZUWUpoUUZzc3RnNWNQRTlSTmdoa3lDdi92?=
 =?utf-8?B?bmlTUXM3eVlndVlXa0FhWGJ6cTdkUGpLYXRtVXRndlBWNGFFcUg1L0N3a0Fz?=
 =?utf-8?B?enBtcytZZ2JMYmh3N1JmZE1abkszNUdrL2xPcTAxS2lUdWZQaVdlck16bEdI?=
 =?utf-8?B?b0JTSXJjMzZteTVlZ28xWDF1VVZ3MkMraThvS0s5VXRUa205OEk0aFU4UmtB?=
 =?utf-8?B?bEdFVEpTdmZDRHE1dlNvejJsOUptYTJvQUxGSFlaTHpPcmx6aktzcHN3ZVJr?=
 =?utf-8?B?b0lzS1hHUS9yMEJDOGlDUkJpN1ptWHZMdGJ1VjIzNDZ0MmIyQ29ITWhyQlNO?=
 =?utf-8?B?bmxJTmxnZm5nSGlwSVcyRDg1MlY5bFVMVEVNUHRkNkdIV3BTUVkzU1hMUHlN?=
 =?utf-8?B?WXYvSDU0MFk5RlU2eXJCU24zVW1zczdvYmJDMHlJM3RWZG1weC9ZTnJDOUd5?=
 =?utf-8?B?TXFWRVhFV1BPdy93UkZRRlhDcGpGcnlPZ08rRzMyTDZXd0MrUGgrYVdacWFO?=
 =?utf-8?B?eStVaGs2aUxmQkhvOW0yZnlpbHJUcFNLTzNlTm5sV2UzYnRGdTdnVkVzMjRz?=
 =?utf-8?B?OHJ0TDArOGg1a3lwVHZDNjZ3TGRTajN2SXY1RWp6VVkyQW04K2VSRlpQa2lJ?=
 =?utf-8?B?N3Exa0l4aEhCRnFoOHhxM1U2c0pFNzJMSlNaWTBFb0JFeitNdW1WRmQvQmc5?=
 =?utf-8?B?NTljQWY1Zk1kZmJTa2orTnBzSmRDQWF4NURWMGxHTzBSdVdIL09hY2dXZUVn?=
 =?utf-8?B?bVU2aFN1MXZvdHJwYnZMOTk2aWZyNG94RjNWNXJSTWE1WWFENytERWMzeVF1?=
 =?utf-8?B?UXRHK3kvdGdqUWwyM1dhKzl2bkFoZVZSL1ZJZTJiditzRGc2aEtNZXhITmRX?=
 =?utf-8?B?SWlCSnFoQ0dHUWZPSkN2ZmM4SmVZajZITVkrbVRhRzh3eHJwWnZwWW0wK2dQ?=
 =?utf-8?B?bGp1OFVMMG9VeUx6dXBNS1FPVHdiWGF1Z1A0TkxaOXlPeW5FYyt5TXNkeUhP?=
 =?utf-8?B?enpkZTQxdGNxUHNMWG9Ocm41cjdjWi9FZGNnWXltSjEvcERseVk5ZHFmMVRi?=
 =?utf-8?B?T01EYnh5YTZMV1Z5OEdndFEyUjdnSlpJY29PN0NMY3NRN2ZaR2dhWm9uWWt5?=
 =?utf-8?B?emFtalN4MndDMVZFV3BMT3RPQUljcC9QQldVY1EwS3RtbnZ2bUlleitYNmdn?=
 =?utf-8?B?QmF5dFRGTVpDVzk5NXU0YnpxUEJ4VzlRUEZuNkl2MzM0WEVyY0hxSHdFOERw?=
 =?utf-8?B?M0xza2JKNlNDZUU1NStBUUdiWVhia0xZbEZYUlFHZGZvUC9JUVJIVUUyN0Yx?=
 =?utf-8?B?SlpsdXlkNjJkSklVQXpMdFE0T1EvVHdvbUUrdjRiTThQMkUzNnF3M0xmWmVT?=
 =?utf-8?B?aU9rZ0ZmQXdhQlhWcHFKS2pKSStlVnQrTE9xczBjQ1gyd1JXT1hINFVtT0hQ?=
 =?utf-8?B?bjNQL05PT1BvSGJLbTBRL1pBcW9kbFQ0cm0xbnhJNFVZa2ZrdVJCWUNCNldi?=
 =?utf-8?B?dUthZ3Rxc1VqWHQ5dFJudWh5WTNxV01KSVlBNzAwbFlRd0FNMzY0MG9oV3ZB?=
 =?utf-8?B?Z2UxRkl0QXNMU2ZDWXVyN3ZoR2lQVEg5YUFrNnkvaGdiTTNMY3NYOFRHc3Y2?=
 =?utf-8?B?dTBXT29ndy9nYkRtQ0MvUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXhqYXQ3TkJEQkEzVTJVS2ZqUmRTYU9Pam4yZWVFYThlYjllSHRFT3BPeWJl?=
 =?utf-8?B?SlNaWGxiRmJIZDVtdGp1TDZIaXlEWmZCck42dXd5RWdzS240SmR3YnN4Szdo?=
 =?utf-8?B?cE9IRGpKUGo4eUx6TlZXMWx4bTliUWV5UFJ5ZFJHNFN5UENPR2RWZ05lZG9N?=
 =?utf-8?B?VExGTmNXRk4xWHAyVm1MNW45VThKWkxKZno4RVE5N254WWUzckZXQ0lsMk5L?=
 =?utf-8?B?Q2F1UEFibVZXb0RQaUhrTVFzYlZudGFGMFMyNzRwOVYvczBqUHZEc1ZCQ3lI?=
 =?utf-8?B?MThBbzRaTTZXUmlLeXlZOTJGT3RtKzFGK1dJN0FCVXdvc1k0WDR0OHVDMHVo?=
 =?utf-8?B?WUxiM3ZzbWhhWW5wUFk1OXEyeUtqc1VCeERDTGNpR2JLR2EwZTlVRVpVS05a?=
 =?utf-8?B?UERJcHZiU0xzVjlQdUZGbTU2bGZYdzdqZ1o4TC93d29MTnlTVi9nNzVKUzRy?=
 =?utf-8?B?QVdxem1Wd1ZmOWI0Mk8wTWVBUVhaMnE0ZG5ScmQyS2tVWjE3b3QvazBUTm1L?=
 =?utf-8?B?anFwc2ROVGRCWW9RNGZIYkVGamdKdUdCeGRYQUNXVEpTYjJFVzhyZkNnMWRs?=
 =?utf-8?B?NjZRMmpIRVBicG1ZejZBSkRyWHZVcitUNmFXVWNmM3REem5OaXgrUzcvRUcw?=
 =?utf-8?B?dkgySFJGODg0R2owOWtwbHlseStha05GQ1U1VDFEZUNjYmlsZUpGMWlzeDBo?=
 =?utf-8?B?Q21YZzl0N2xLUHZqUDk2RWhOU3NCRGpJZENxTDNEMXU3aTlTNVEzSjVBVEhL?=
 =?utf-8?B?NVJpcldZUTc1dWFBUGtZcHB6dHJmTXBHVHZ2amdHOHk4cmVnbkJ6dm1ESUNG?=
 =?utf-8?B?cmFYWitqYys3MTFGNEVNdXdwMCtERncwM05BakVxWXd4cHovUkY0ZzBOYjRH?=
 =?utf-8?B?MXZMam9WUWlwTXRRZEpuWUFNckJ4dGVxRmVrdmJEUFNqbzBOR1Q1K0VoUmtl?=
 =?utf-8?B?YXowNTBzeVV2ZitBczh6UWlhSlhpcDYrQ3BSRStIUXRnU2tMQU9KVjJ6Wjg5?=
 =?utf-8?B?bUF3Mml3K2ZFdUdIZmhoeDlmTUhCYnJSeHRqUlZZbm9BQkZ5UEIxeFVGcU9k?=
 =?utf-8?B?RHFtVE1YZkw2Uk16QStSS1NDQjVIeDdUU3g3QW9XSUthSlNVZ3k5L05LZjFp?=
 =?utf-8?B?T1Y2KzhlQmltUjdvSjRCODhDTnV1bVZxT2NpTytVazZuOHNYcys2ZGpXNmNX?=
 =?utf-8?B?ZEx2RzdBSkx1VFY3d2prTzlaTXFKOXNQRkYyNDVkZ3VaSFlQRHlsU1dLOUIy?=
 =?utf-8?B?dDBHQ3RIdmlhV3c5cDNvdDljV1pvNXptNWo1Ny81akdwYy9KSUkyZllEQzlW?=
 =?utf-8?B?Q1Z0YS92L1cweTRlcVZRNlJmNEw2WUYvQ1grTUQwVUlURlJQQlkzSEhNejRy?=
 =?utf-8?B?RHFMUU13UTVhdXkycTh5MEJZQnVNNnB3UG5IcVlSWjB6b0N3TVRlUWZDVitL?=
 =?utf-8?B?TXdEN09aTFlLb28yeWNOM3Q0SEJwdE82V0d2MmNXSGwyT3ZWT0w0Uy8vL1gx?=
 =?utf-8?B?YWhZUDJpTTVBaGNxbGR4K3N5YWwxb3lnaENzZm5sd2R0d1gwR3R0OFJRVFZH?=
 =?utf-8?B?bGRBMFZkQ2hHQWx6bVk0Um96NkdQL0cwYmt0Wjd1VnJLYm1LOUdpR3ljOFpW?=
 =?utf-8?B?ajVWMFY0NHNzZVFTV2h0TGNLVXk0ZngvZkI0LzZidi9JZlF4dWhYU1k0cWhR?=
 =?utf-8?B?YUY3M1VYWmU4Si92aFVwZDRnd2xNS1J2TXdJY0NHazVPZjBGQWhhdCtpdHdw?=
 =?utf-8?B?d2pEdGhhSVU4QkhoTFdTYUo0R1VlT3ppTWg0VHVSMTgwRnBRUFMzY2Q5S21h?=
 =?utf-8?B?b3RpS0VKRlplMzIrbllLTlc3WW52SVBNN3hSUHZQY1U3eUJCTFExSVJwQmlh?=
 =?utf-8?B?SUR2L0gxTjROdy80SE5NbGxRUW9Vanhrd3k3ZThXU2graG1EVEtONkptUUJw?=
 =?utf-8?B?TllsSTVIVDEwajVjbXBxbldrclIvZS9jOEpxVkVJYy9BSXowdTQvMFpSZ1Nq?=
 =?utf-8?B?WlVGdWc1c0hNS0NnazNtdkZUTllRcVdhcGVaVzhOaFlvcjM2WWxTMlVvQ0Na?=
 =?utf-8?B?RlhMQWdySjU1K3B6a3UzakhuYjk2NUJrYmFmZTRsS0wveUo3OWZXRklzbEFQ?=
 =?utf-8?Q?ip37lQuZfeEqo/o35sdQLPb39?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01e4913-9e06-45d6-4590-08dc99baa67f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 10:43:31.7735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B96CoUjON2Q/P0hMokhSYVQ4Qe9nuf40Dkupap3dTMqQv2MeD1P6rLPBYoMgpsYq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924
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

Am 28.06.24 um 20:13 schrieb Daniel Vetter:
> On Fri, Jun 28, 2024 at 03:51:33PM +0000, Matthew Brost wrote:
>> On Fri, Jun 28, 2024 at 05:38:48PM +0200, Thomas Hellström wrote:
>>> Bos can be put with multiple unrelated dma-resv locks held. But
>>> imported bos attempt to grab the bo dma-resv during dma-buf detach
>>> that typically happens during cleanup. That leads to lockde splats
>>> similar to the below and a potential ABBA deadlock.
>>>
>>> Fix this by always taking the delayed workqueue cleanup path for
>>> imported bos.
>>>
>>> Requesting stable fixes from when the Xe driver was introduced,
>>> since its usage of drm_exec and wide vm dma_resvs appear to be
>>> the first reliable trigger of this.
>>>
>>> [22982.116427] ============================================
>>> [22982.116428] WARNING: possible recursive locking detected
>>> [22982.116429] 6.10.0-rc2+ #10 Tainted: G     U  W
>>> [22982.116430] --------------------------------------------
>>> [22982.116430] glxgears:sh0/5785 is trying to acquire lock:
>>> [22982.116431] ffff8c2bafa539a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: dma_buf_detach+0x3b/0xf0
>>> [22982.116438]
>>>                 but task is already holding lock:
>>> [22982.116438] ffff8c2d9aba6da8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
>>> [22982.116442]
>>>                 other info that might help us debug this:
>>> [22982.116442]  Possible unsafe locking scenario:
>>>
>>> [22982.116443]        CPU0
>>> [22982.116444]        ----
>>> [22982.116444]   lock(reservation_ww_class_mutex);
>>> [22982.116445]   lock(reservation_ww_class_mutex);
>>> [22982.116447]
>>>                  *** DEADLOCK ***
>>>
>>> [22982.116447]  May be due to missing lock nesting notation
>>>
>>> [22982.116448] 5 locks held by glxgears:sh0/5785:
>>> [22982.116449]  #0: ffff8c2d9aba58c8 (&xef->vm.lock){+.+.}-{3:3}, at: xe_file_close+0xde/0x1c0 [xe]
>>> [22982.116507]  #1: ffff8c2e28cc8480 (&vm->lock){++++}-{3:3}, at: xe_vm_close_and_put+0x161/0x9b0 [xe]
>>> [22982.116578]  #2: ffff8c2e31982970 (&val->lock){.+.+}-{3:3}, at: xe_validation_ctx_init+0x6d/0x70 [xe]
>>> [22982.116647]  #3: ffffacdc469478a8 (reservation_ww_class_acquire){+.+.}-{0:0}, at: xe_vma_destroy_unlocked+0x7f/0xe0 [xe]
>>> [22982.116716]  #4: ffff8c2d9aba6da8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
>>> [22982.116719]
>>>                 stack backtrace:
>>> [22982.116720] CPU: 8 PID: 5785 Comm: glxgears:sh0 Tainted: G     U  W          6.10.0-rc2+ #10
>>> [22982.116721] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 2001 02/01/2023
>>> [22982.116723] Call Trace:
>>> [22982.116724]  <TASK>
>>> [22982.116725]  dump_stack_lvl+0x77/0xb0
>>> [22982.116727]  __lock_acquire+0x1232/0x2160
>>> [22982.116730]  lock_acquire+0xcb/0x2d0
>>> [22982.116732]  ? dma_buf_detach+0x3b/0xf0
>>> [22982.116734]  ? __lock_acquire+0x417/0x2160
>>> [22982.116736]  __ww_mutex_lock.constprop.0+0xd0/0x13b0
>>> [22982.116738]  ? dma_buf_detach+0x3b/0xf0
>>> [22982.116741]  ? dma_buf_detach+0x3b/0xf0
>>> [22982.116743]  ? ww_mutex_lock+0x2b/0x90
>>> [22982.116745]  ww_mutex_lock+0x2b/0x90
>>> [22982.116747]  dma_buf_detach+0x3b/0xf0
>>> [22982.116749]  drm_prime_gem_destroy+0x2f/0x40 [drm]
>>> [22982.116775]  xe_ttm_bo_destroy+0x32/0x220 [xe]
>>> [22982.116818]  ? __mutex_unlock_slowpath+0x3a/0x290
>>> [22982.116821]  drm_exec_unlock_all+0xa1/0xd0 [drm_exec]
>>> [22982.116823]  drm_exec_fini+0x12/0xb0 [drm_exec]
>>> [22982.116824]  xe_validation_ctx_fini+0x15/0x40 [xe]
>>> [22982.116892]  xe_vma_destroy_unlocked+0xb1/0xe0 [xe]
>>> [22982.116959]  xe_vm_close_and_put+0x41a/0x9b0 [xe]
>>> [22982.117025]  ? xa_find+0xe3/0x1e0
>>> [22982.117028]  xe_file_close+0x10a/0x1c0 [xe]
>>> [22982.117074]  drm_file_free+0x22a/0x280 [drm]
>>> [22982.117099]  drm_release_noglobal+0x22/0x70 [drm]
>>> [22982.117119]  __fput+0xf1/0x2d0
>>> [22982.117122]  task_work_run+0x59/0x90
>>> [22982.117125]  do_exit+0x330/0xb40
>>> [22982.117127]  do_group_exit+0x36/0xa0
>>> [22982.117129]  get_signal+0xbd2/0xbe0
>>> [22982.117131]  arch_do_signal_or_restart+0x3e/0x240
>>> [22982.117134]  syscall_exit_to_user_mode+0x1e7/0x290
>>> [22982.117137]  do_syscall_64+0xa1/0x180
>>> [22982.117139]  ? lock_acquire+0xcb/0x2d0
>>> [22982.117140]  ? __set_task_comm+0x28/0x1e0
>>> [22982.117141]  ? find_held_lock+0x2b/0x80
>>> [22982.117144]  ? __set_task_comm+0xe1/0x1e0
>>> [22982.117145]  ? lock_release+0xca/0x290
>>> [22982.117147]  ? __do_sys_prctl+0x245/0xab0
>>> [22982.117149]  ? lockdep_hardirqs_on_prepare+0xde/0x190
>>> [22982.117150]  ? syscall_exit_to_user_mode+0xb0/0x290
>>> [22982.117152]  ? do_syscall_64+0xa1/0x180
>>> [22982.117154]  ? __lock_acquire+0x417/0x2160
>>> [22982.117155]  ? reacquire_held_locks+0xd1/0x1f0
>>> [22982.117156]  ? do_user_addr_fault+0x30c/0x790
>>> [22982.117158]  ? lock_acquire+0xcb/0x2d0
>>> [22982.117160]  ? find_held_lock+0x2b/0x80
>>> [22982.117162]  ? do_user_addr_fault+0x357/0x790
>>> [22982.117163]  ? lock_release+0xca/0x290
>>> [22982.117164]  ? do_user_addr_fault+0x361/0x790
>>> [22982.117166]  ? trace_hardirqs_off+0x4b/0xc0
>>> [22982.117168]  ? clear_bhb_loop+0x45/0xa0
>>> [22982.117170]  ? clear_bhb_loop+0x45/0xa0
>>> [22982.117172]  ? clear_bhb_loop+0x45/0xa0
>>> [22982.117174]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>> [22982.117176] RIP: 0033:0x7f943d267169
>>> [22982.117192] Code: Unable to access opcode bytes at 0x7f943d26713f.
>>> [22982.117193] RSP: 002b:00007f9430bffc80 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
>>> [22982.117195] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX: 00007f943d267169
>>> [22982.117196] RDX: 0000000000000000 RSI: 0000000000000189 RDI: 00005622f89579d0
>>> [22982.117197] RBP: 00007f9430bffcb0 R08: 0000000000000000 R09: 00000000ffffffff
>>> [22982.117198] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>>> [22982.117199] R13: 0000000000000000 R14: 0000000000000000 R15: 00005622f89579d0
>>> [22982.117202]  </TASK>
>>>
>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: intel-xe@lists.freedesktop.org
>>> Cc: <stable@vger.kernel.org> # v6.8+
>> Patch and explaination makes sense to me.
>>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> I guess for stable this is good since minimal, but after Thomas explaine
> what he meant with dma_buf_detach_unlocked I think that total sense as a
> follow-up patch maybe.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

IIRC the last time this issue came up a possible solution discussed was 
to change dma_buf_detach() so that it should always be called with the 
reservation lock held.

The problem at the time was that this meant changing 
dmabuf->ops->detach() to also be called with that lock held and after 
that nobody looked into it any more.

Anyway Reviewed-by: Christian König <christian.koenig@amd.com> for this 
patch.

Regards,
Christian.

>
> Cheers, Sima
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 6396dece0db1..2427be8bc97f 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -346,6 +346,7 @@ static void ttm_bo_release(struct kref *kref)
>>>   		if (!dma_resv_test_signaled(bo->base.resv,
>>>   					    DMA_RESV_USAGE_BOOKKEEP) ||
>>>   		    (want_init_on_free() && (bo->ttm != NULL)) ||
>>> +		    bo->type == ttm_bo_type_sg ||
>>>   		    !dma_resv_trylock(bo->base.resv)) {
>>>   			/* The BO is not idle, resurrect it for delayed destroy */
>>>   			ttm_bo_flush_all_fences(bo);
>>> -- 
>>> 2.44.0
>>>

