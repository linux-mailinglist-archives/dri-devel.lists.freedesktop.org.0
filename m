Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B932391A15F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 10:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D076E10E1A0;
	Thu, 27 Jun 2024 08:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IJ0fVmju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262E010E16E;
 Thu, 27 Jun 2024 08:26:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/mILZEZ04QLPDWLyhoW8NYjRDCUrI7F70v6lTGbGunB+aeq2hrMbSA40ozIbTAsDgDcZQi/3N/OJLCK9TVoOfXEG+7f+an6R9nSXw0eFUb5FvrTtclJKSzxngFmH5Cxer+yEWLa+aTmzAoPYOkwAaGBX+9jQYHs4TnbFfM2BOoes5UIF6rZPIbBn56V1uoDOKW+QAqfvgebbN4gvX3puZ8ls2LuCdF8J6rX61xr+0zqrvEdsJSIwg1wO5KuvgqKNQ0IpXkmim6fmr2Ek/9g3dSZJYXVv7OK9G/HCTNjC4Ml7MfDX0dEv436KRkxHDrYWX/MtOebCJG4TJnhefsVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKfU0piUJ3JabYfcWycbELc2Ya7laQjIWYUsbo9rPTY=;
 b=cKIqvQnRou+yXztY1xLjtdIkirsRl+44X9J1YJMwoKyKY1j254BE/d243bfUOY0jQl2RLhFSKG/z3FvMQktpXG7OZFm2OogtJz9AE/kZyRGWmBwbYVkW44rf9M7ug5w651D65KCC7VQFEvv00LNIMdZm7ZkNRuP3sNvYfOLB6XclMDNCNV0xSp9FyXacqsm3nzhLEerryki1narEU2xvbTw/SgT+9JiiRnnHS4rgaqx839oUBnmOr9ZyBOReo/G+RguDFr936l/4sSSPb4QP/oJM0B0CypnagEqQIZ5wXAlPPclJO275SIPW2R+DRXhNLzXrCYdfrRvNurybPja31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKfU0piUJ3JabYfcWycbELc2Ya7laQjIWYUsbo9rPTY=;
 b=IJ0fVmjumI5btq/XsUDgTDg/scyW0W6arhm0G63je//BzqN1xVBJETBKjn6foysna8jUlYXg2uVHwQxhXMSIk3uxr2bibu8CFakjthYHrgPIWdXKzXmpIThuF4xIEGjOeyS7MRl/qgOg1KWMU8U1WXOb8uBGfF5mbxY0uFJE1mI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 08:26:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 08:26:04 +0000
Message-ID: <37714444-3d12-4a29-96f0-929f8e653b9a@amd.com>
Date: Thu, 27 Jun 2024 10:25:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: dma_buf_detach lockdep splat
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <40611e5ff8c32b99e7863293a0baac078f323d8f.camel@linux.intel.com>
 <Zn0c8l-yQih3j0NE@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zn0c8l-yQih3j0NE@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 8091a2bd-9fb9-4e40-a50a-08dc9682c8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckVxMWJIL2lwMGs2VktSTUplV3Bqc0o2MERZRXV5WkVRTjB4dENCK01EbmRz?=
 =?utf-8?B?d1JHSzliV0hSRWQ4RDBIQ21LRm1NbVJNaTF5bE5Xb3o2Q1h6WVJzcWM3SDlF?=
 =?utf-8?B?cGM2VHMxU041dWFabDZWamJIMjBFN0ROOURCMUF4eDJLMzQrVEQ1eVFiWlpp?=
 =?utf-8?B?THc2UlQ1bS8wQ2YvSFBxK2dOaFFCekplSXJ2dnYrU21SQjFnb0R4ZUtuMnlI?=
 =?utf-8?B?VHdGQjg2eTYwZzVuZ2VzQVphbTE3dHBFdHBHdkZDZThZVXh4clptZG9Fck1Z?=
 =?utf-8?B?MFphU2FYK1I3SGZEdlQ2blRSU3BqVWhDdmh0Zmt1UUVsZklFbGcvVWZsZmxw?=
 =?utf-8?B?c3hESFc3aTlKNVJoQUpkdGQwZndjUFNFeHpUTWVkZ0J6a0NISjBSQWg5S29z?=
 =?utf-8?B?dC9rU3hhQTlFOS9jc0ZFYUZMcWxrS0VpbDNoeTRyRHBmbFdrZENNQTlvVStS?=
 =?utf-8?B?OE1Sa01BT2RGK1c5STRzNmo5NUJvODhNVzArV1E4WGY0MENvWk5MVDJLeVJN?=
 =?utf-8?B?WjRPaFlYaUxQUEkyUzJhRDM0U3dJN3YvampxMVJMc1Y2Qk5mOTdFNnpWb2J0?=
 =?utf-8?B?cEthNVRjT09seGhIL0tpSElreXRaa3dCbzV6TEVIdDh2R1g2WFI5cEZJYWMr?=
 =?utf-8?B?VE10MDhaWURISExLaGhQOGdYdjVkTXUxalpaTis2UFBQK29MY1BDN0VwWTRh?=
 =?utf-8?B?bnVzSy85ejJXRzhlSHNhMzZLc0l5c3EvWjkzZTlPNy8xa0x2MWdIS0t5cUJw?=
 =?utf-8?B?YW9VVk5VaVBpcmhYVzU0WDJ1UkFSdkRRYnRnaWlBRFl1RXpoMW1UMlUySjFO?=
 =?utf-8?B?ODArTVR2T2xvNkFKOWU4dzIwUkZsbUpQOE0wUU4zZC9xUC9zbDVQeWN0dlpp?=
 =?utf-8?B?L2VCNitpL1NaZXhpWkErcGh2TkxjSlZxVU1Ea3VlNFByTmRhZ1htd3ViUFlo?=
 =?utf-8?B?UWh3cER3MXdtZE1KbFF1K0tmM0psdkNxUHMzd0ZzVkgxK3pQWkVXOTNlNFRX?=
 =?utf-8?B?QzBHZXIrMWd6Q2pSWjVjK0N3WjJZblBDNVJPMkNKbnd5emtFVCtIQ251ZEJq?=
 =?utf-8?B?ZlVZRmh0cW1EdEhjdmJ6U1NTK0N5ZDdXQmcvRklyaXhzU0p5K0M5aEYwZUFM?=
 =?utf-8?B?MittZ2s2RldkQnYzUUVRbmVhU0hXK1pNdTdENnpxMm9lVGxIMEF6UHFNZUUy?=
 =?utf-8?B?WmlWN3BYQ3IweTEwZnYyOWZ6ZTFUR0lHS0M4MFNHaHVJVFRhd0xmUEl1Rllh?=
 =?utf-8?B?aklmTHpRRy9OajN2VVJ4UDRFbDYzeithVHo3cnhscmNHc3JKR0l3U0hRQ3Uz?=
 =?utf-8?B?SjdwMzBVZDFCZUpZRlFXOXNLWGdrb0JvTXdmZHhMS1hhVjhLejdsSTNFYkZr?=
 =?utf-8?B?TmtsR29RZDNHdUR0b2hJQ3FqTWJiVnhHMWR1cGt0ZjdjK0tHN0hrRERtQmJ5?=
 =?utf-8?B?RjJSNldVaXFBWHRqclZqNDFyM3hXbzIzeXRqNkRGajM0YmtaNC9iNTNQTDRO?=
 =?utf-8?B?RDMvL0dJSE5od3hXeTNDWVlkWlBEbHI5OHh0REN0eUJoVXB4dEN2SVFWYjRX?=
 =?utf-8?B?Y3JqSXdHQlB4WjYxYll0cXM0eFFtL2d2Qno1MUJoNTgvaGsrcldIT09hVzlU?=
 =?utf-8?B?am1wRmxSMzBuRDFQSGdoQ2l4NG5qTnYxVDIyUTQ1V0g0ZW83Tmp0S2h1a0hH?=
 =?utf-8?B?azFnSEpmYjNVTDVza1hMU2NFaXRFTVRIb0hnMzlvSGd3SWJEd2VGVzZVdk1H?=
 =?utf-8?B?MVlMZjNjSUhrcFVaM3ZtWHpLNXEwc0NPTVVxL2ZMaHJFb3A5VVE2TnBlang1?=
 =?utf-8?B?K3Uyd1R1Rk9sYzROS1F4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXVDMVdURkFlWUx3UFltblBNRmg1YnljS2tXWDVQVHRycTBvRWNlVE9rakg5?=
 =?utf-8?B?OGNCdnpwR24zVzVQTnZ5cG4wM3Btb3R6a2lXSVhCMVUvUlI5OTRNdTNEald4?=
 =?utf-8?B?QmkydWxhTXpVVSthc2F5YlRCczg3MlluZ3o1YWxxVTZVdmo3NGJWUDFLa0lW?=
 =?utf-8?B?OEJiU2R4cVI2VmVrM3RIQVFWWG83MzJYVFJONWVkRE84QkM4a2tIL0g0cmxz?=
 =?utf-8?B?QU5wWlB5NjI5K1FacHpOUUdRTEZ3cHV6cXJabXBKVkpmUmR0ZURRcjZiakxH?=
 =?utf-8?B?bVhWN3kwM000elYwYURXS3NxNWdsczBOTUVhT2NDSjl1am1IcEZqd2RHZE9x?=
 =?utf-8?B?bWJad1ByT2MvOTlHQ21VMFo3Q2R6VnpoRTBYREJsSXMxZ2VvQWtmK0dXR1Uv?=
 =?utf-8?B?TStkQ01qOXpaWXYyOWNENjFIZGlKalN3dEZqL0pRRStRKzB2ckpCaXpyTWFk?=
 =?utf-8?B?dmdyMlE2K3lvYnBDNk14Y3BnczJjeUllVkhPbGFRU054NEZSS2NtSlZTUm54?=
 =?utf-8?B?M0J3VGJoVlRWa0F0ZEhGb2N6QlFOTXhCTzl0Y25rdWYzWmR1ZE9ZcXBKTlB1?=
 =?utf-8?B?aUxBZzJFREtUaEwzOGc5bTFCQ09rQldqOE5EbTVLRUVWeExKVlVBNWhscDRo?=
 =?utf-8?B?S09xYjBqcUlmZWNlbWZKMGhJT3NhZzhjb2pISy9LYlM1NGFmSDY3STFKaVZR?=
 =?utf-8?B?dFY3MVpmemJ6UG9JYnEzU1F1d1pFcmk4b3h4eEhGN0o1dk5jMTBtZTNVTHJU?=
 =?utf-8?B?RTVhT1Q5eTljSjZHeExNN0QvemYyWXFQc1JQVXdtZVA3WWxNZk9Gc1ovL0dS?=
 =?utf-8?B?YTFKemdwZkUvRVNleGhkWVcyZHpUYkgxcVRnMUloSnFKOFRFNnBxckFYSFNQ?=
 =?utf-8?B?d3NIYzdjVHE0ZmdPNG1GeFhlZm80SmNJMzAwZ29vcmJnSUQ4VWpIbWFMLzhF?=
 =?utf-8?B?VDdmcSttTEh3T3ZOZlArUy9waVNESStub25DMHRYMjR1bGpuQTBsdnA4U1dY?=
 =?utf-8?B?ek45dzlldWlDZjNJY1Nzc0VGaVp2blBPZUttdzNrak5BVS9SNlYvSzA1MkQ5?=
 =?utf-8?B?ZXcxUW1kZFpOK1ppK3o5SUl2UjJwbnREdEJhSTZkOG5GKzY3Njh5QXA4eXB0?=
 =?utf-8?B?WHZTd3VDK3FVMHF0RTQxVVptVjduSUwxMS9jdVJHUUd4NndQMTNCUURaK3A2?=
 =?utf-8?B?YUJvZGdBbVJUL1lvMk5vYXhJTXp1SWhyTVp6K1pIS2M2OVR4VGQyUWxFa1Zh?=
 =?utf-8?B?dnoxL2lCV3RROVhWM1pSaGRZL2pPaTVMbVdUYjJKcTFtQmRHK04wRWozMFJh?=
 =?utf-8?B?ODBDeE9WTlhlaDUvYSt2aXpBUU1DSlFCdGNZeXV4NHJ5RHdCekZ0bjkrWE1v?=
 =?utf-8?B?eDJwYTdVbkdwcEZCSndWaGowWUw1Vm5Jcy9FWWlJMDJWMU5nLzcxQ0xNOWR5?=
 =?utf-8?B?WXNacWdPVjJlYTNsOHZtejE1T3VKaDNVc3B4QWFWWHR0bENOQTE0bWgzcU9y?=
 =?utf-8?B?Zkx4YTdReWdEeFBTRElpM2hMWXFWVER3UVB2VW1kQ3d1c0J0Tng5M1RobnFr?=
 =?utf-8?B?R0llc1hZRmswdTNDdnpBOXdVb3Nxa0d2UGVxQzBXQW1PenF0U1NRcGdWS2hE?=
 =?utf-8?B?OUlSWCtqeE05ckFQWVN3ZktGdXFuK1lGU3NJTFdsaTRSY0NyMWlQemR0VjN5?=
 =?utf-8?B?TkxLdnltTE52bUw5OEswaXY5dGJjRTZaVE1sOUU3cWRPTW5mVzhveFdsMWsr?=
 =?utf-8?B?TXZEMzdiVVNGK3FGUHkyS3BFbGsxK2UzREU3S285SmNycmRGVE95NklFeHJx?=
 =?utf-8?B?OTBBcnFmVGJzTnR6WFZnMmVSNDZUTmp4dTIzV0wwaElCWGhnT3VuOGJVUk5W?=
 =?utf-8?B?aWFlZmpMMnJrTlQzZTBsNzR3SVV2NUp4TkZKa25hdDRFOGQ0aUQrS0k5dThs?=
 =?utf-8?B?YXhUVWpXbHcxU0VOVXZ2aVd1emlUdk5IVDNOU3NycHZFd3hUL2JVWTk0czc0?=
 =?utf-8?B?dkV5MWZsclBGRHdSaklQbzFnZGhWckJvdVlOZTBFaUY4SjNOdHo3R1V6dUEw?=
 =?utf-8?B?eFZKMVpJV0Zsb1NEUDhZUFBCZXhHM1lJN2RENlZLRU9pOWtFeGhDZkpNOThG?=
 =?utf-8?Q?rVRv6w0SCe1TYgXeO9bk4CZXx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8091a2bd-9fb9-4e40-a50a-08dc9682c8e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 08:26:04.2613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FacbyRindhus+xhmtuvJY5GCseLrPL9qUUqosVSdSLM0OO/lMAZAH6B03u7IHa6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121
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

Am 27.06.24 um 10:04 schrieb Daniel Vetter:
> On Wed, Jun 26, 2024 at 05:58:02PM +0200, Thomas Hellström wrote:
>> Hi!
>>
>> I'm seeing the below lockdep splat 1) with the xe driver in an imported
>> dma-buf object destruction path.

Mhm strange.

>>
>> It's not because we hold the dma_resv lock at that point, but rather
>> because we hold *another* dma_resv lock at that point, and the dma_resv
>> detach happens when the object is idle, in this case it was idle at the
>> final put(), and dma_buf_detach() is called in the putting process.
>>
>> Holding another dma-buf lock might happen as part of
>> drm_exec_unlock_all, or simply if the wider vm dma_resv was held at
>> object put time, so it's not an uncommon pattern, even if the drm_exec
>> instance can be fixed by putting all bos after unlocking them all.
>>
>> Two solutions coming to mind here:
>>
>> 1) Provide a dma_buf_detach_locked()
> This smells way too much like the endless headaches we had with
> drm_gem_object_put_locked and friends against drm_device.struct_mutex. Or
> I'm not understanding what you're doing, because I'm pretty sure you have
> to take the dma_resv lock on final put() of imported objects. Because that
> final put() is of the import wrapper, the exporter (and other importers)
> can still get at that object and so dma_resv_lock is very much needed.
>
> Or it's a completely different final put(), but I have no idea how you get
> that on an imported dma_buf.
>
>> 2) Have TTM always take the delayed delete path for imported dma-buf
>> objects.
>>
>> I'd prefer 1) since I think the correct place to call this is in the
>> TTM callback delete_mem_notify() where the bo is already locked, and I
>> figure non-TTM gem backends may come to suffer from the same problem.
>>
>> Opinions, suggestions?
> Imo 2) or trying to push the object puts outside of the dma_resv_lock.

IIRC I've stumbled over this issue before with TTM but though that I've 
fixed it.

I mean no objections from my side to change drm_exec_fini() to something 
like this:

drm_exec_for_each_locked_object_reverse(exec, index, obj)
     dma_resv_unlock(obj->resv);

drm_exec_for_each_locked_object_reverse(exec, index, obj)
     drm_gem_object_put(obj);

but in general that the last reference is dropped while holding a 
different reservation object is not something special. For example that 
happens all the time in TTMs eviction code.

So at least for TTM I would say we should move cleanup of imported BOs 
to the worker. But not sure if that covers everything.

Regards,
Christian.

>   The
> latter is imo natural, since usually you grab references, then lock. And
> this even holds for at least the slow path of lru eviction, because you
> need to drop all locks and then do a ww_mutex_lock_slow, and that requires
> that you can hold references to unlocked objects.
>
> But 2) alone is imo fine, dma_buf have become really big objects that go
> across drivers, extremely similar to struct file, and that is doing the
> delayed final put unconditionally since years too, using task_work. It's
> simply a solid design.
>
> Cheers, Sima
>
>> [1]
>> [   99.136161] ============================================
>> [   99.136162] WARNING: possible recursive locking detected
>> [   99.136163] 6.10.0-rc2+ #6 Tainted: G     U
>> [   99.136165] --------------------------------------------
>> [   99.136166] glxgears:sh0/4675 is trying to acquire lock:
>> [   99.136167] ffff9967dcdd91a8 (reservation_ww_class_mutex){+.+.}-
>> {3:3}, at: dma_buf_detach+0x3b/0xf0
>> [   99.136184]
>>                 but task is already holding lock:
>> [   99.136186] ffff9967d8c145a8 (reservation_ww_class_mutex){+.+.}-
>> {3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
>> [   99.136191]
>>                 other info that might help us debug this:
>> [   99.136192]  Possible unsafe locking scenario:
>>
>> [   99.136194]        CPU0
>> [   99.136194]        ----
>> [   99.136195]   lock(reservation_ww_class_mutex);
>> [   99.136197]   lock(reservation_ww_class_mutex);
>> [   99.136199]
>>                  *** DEADLOCK ***
>>
>> [   99.136199]  May be due to missing lock nesting notation
>>
>> [   99.136200] 5 locks held by glxgears:sh0/4675:
>> [   99.136202]  #0: ffff9967d8c104c8 (&xef->vm.lock){+.+.}-{3:3}, at:
>> xe_file_close+0xde/0x1c0 [xe]
>> [   99.136272]  #1: ffff9967d5bb7480 (&vm->lock){++++}-{3:3}, at:
>> xe_vm_close_and_put+0x161/0x9b0 [xe]
>> [   99.136350]  #2: ffff9967ef88a970 (&val->lock){.+.+}-{3:3}, at:
>> xe_validation_ctx_init+0x6d/0x70 [xe]
>> [   99.136440]  #3: ffffbd6a085577b8
>> (reservation_ww_class_acquire){+.+.}-{0:0}, at:
>> xe_vma_destroy_unlocked+0x7f/0xe0 [xe]
>> [   99.136546]  #4: ffff9967d8c145a8
>> (reservation_ww_class_mutex){+.+.}-{3:3}, at:
>> drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
>> [   99.136552]
>>                 stack backtrace:
>> [   99.136553] CPU: 10 PID: 4675 Comm: glxgears:sh0 Tainted: G     U
>> 6.10.0-rc2+ #6
>> [   99.136555] Hardware name: ASUS System Product Name/PRIME B560M-A
>> AC, BIOS 2001 02/01/2023
>> [   99.136557] Call Trace:
>> [   99.136558]  <TASK>
>> [   99.136560]  dump_stack_lvl+0x77/0xb0
>> [   99.136564]  __lock_acquire+0x1232/0x2160
>> [   99.136569]  lock_acquire+0xcb/0x2d0
>> [   99.136570]  ? dma_buf_detach+0x3b/0xf0
>> [   99.136574]  ? __lock_acquire+0x417/0x2160
>> [   99.136577]  __ww_mutex_lock.constprop.0+0xd0/0x13b0
>> [   99.136580]  ? dma_buf_detach+0x3b/0xf0
>> [   99.136584]  ? dma_buf_detach+0x3b/0xf0
>> [   99.136588]  ? ww_mutex_lock+0x2b/0x90
>> [   99.136590]  ww_mutex_lock+0x2b/0x90
>> [   99.136592]  dma_buf_detach+0x3b/0xf0
>> [   99.136595]  drm_prime_gem_destroy+0x2f/0x40 [drm]
>> [   99.136638]  xe_ttm_bo_destroy+0x32/0x220 [xe]
>> [   99.136734]  ? __mutex_unlock_slowpath+0x3a/0x290
>> [   99.136738]  drm_exec_unlock_all+0xa1/0xd0 [drm_exec]
>> [   99.136741]  drm_exec_fini+0x12/0xb0 [drm_exec]
>> [   99.136743]  xe_validation_ctx_fini+0x15/0x40 [xe]
>> [   99.136848]  xe_vma_destroy_unlocked+0xb1/0xe0 [xe]
>> [   99.136954]  xe_vm_close_and_put+0x41a/0x9b0 [xe]
>> [   99.137056]  ? xa_find+0xe3/0x1e0
>> [   99.137060]  xe_file_close+0x10a/0x1c0 [xe]
>> [   99.137157]  drm_file_free+0x22a/0x280 [drm]
>> [   99.137193]  drm_release_noglobal+0x22/0x70 [drm]
>> [   99.137227]  __fput+0xf1/0x2d0
>> [   99.137231]  task_work_run+0x59/0x90
>> [   99.137235]  do_exit+0x330/0xb40
>> [   99.137238]  do_group_exit+0x36/0xa0
>> [   99.137241]  get_signal+0xbd2/0xbe0
>> [   99.137245]  arch_do_signal_or_restart+0x3e/0x240
>> [   99.137249]  syscall_exit_to_user_mode+0x1e7/0x290
>> [   99.137252]  do_syscall_64+0xa1/0x180
>> [   99.137255]  ? _raw_spin_unlock+0x23/0x40
>> [   99.137257]  ? look_up_lock_class+0x6f/0x120
>> [   99.137261]  ? __lock_acquire+0x417/0x2160
>> [   99.137264]  ? lock_acquire+0xcb/0x2d0
>> [   99.137266]  ? __set_task_comm+0x28/0x1e0
>> [   99.137268]  ? find_held_lock+0x2b/0x80
>> [   99.137271]  ? __set_task_comm+0xe1/0x1e0
>> [   99.137273]  ? lock_release+0xca/0x290
>> [   99.137277]  ? __do_sys_prctl+0x245/0xab0
>> [   99.137279]  ? lockdep_hardirqs_on_prepare+0xde/0x190
>> [   99.137281]  ? syscall_exit_to_user_mode+0xb0/0x290
>> [   99.137284]  ? do_syscall_64+0xa1/0x180
>> [   99.137286]  ? cpuset_cpus_allowed+0x36/0x140
>> [   99.137289]  ? find_held_lock+0x2b/0x80
>> [   99.137291]  ? find_held_lock+0x2b/0x80
>> [   99.137294]  ? __sched_setaffinity+0x78/0x240
>> [   99.137297]  ? kfree+0xe2/0x310
>> [   99.137301]  ? kfree+0x202/0x310
>> [   99.137303]  ? __sched_setaffinity+0x78/0x240
>> [   99.137305]  ? __x64_sys_sched_setaffinity+0x69/0xb0
>> [   99.137307]  ? kfree+0xe2/0x310
>> [   99.137310]  ? lockdep_hardirqs_on_prepare+0xde/0x190
>> [   99.137312]  ? syscall_exit_to_user_mode+0xb0/0x290
>> [   99.137315]  ? do_syscall_64+0xa1/0x180
>> [   99.137317]  ? trace_hardirqs_off+0x4b/0xc0
>> [   99.137321]  ? clear_bhb_loop+0x45/0xa0
>> [   99.137325]  ? clear_bhb_loop+0x45/0xa0
>> [   99.137327]  ? clear_bhb_loop+0x45/0xa0
>> [   99.137330]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [   99.137333] RIP: 0033:0x7fda70ee6169
>> [   99.137351] Code: Unable to access opcode bytes at 0x7fda70ee613f.
>> [   99.137352] RSP: 002b:00007fda5fdffc80 EFLAGS: 00000246 ORIG_RAX:
>> 00000000000000ca
>> [   99.137354] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX:
>> 00007fda70ee6169
>> [   99.137356] RDX: 0000000000000000 RSI: 0000000000000189 RDI:
>> 0000564a96f45b30
>> [   99.137358] RBP: 00007fda5fdffcb0 R08: 0000000000000000 R09:
>> 00000000ffffffff
>> [   99.137359] R10: 0000000000000000 R11: 0000000000000246 R12:
>> 0000000000000000
>> [   99.137360] R13: 0000000000000000 R14: 0000000000000000 R15:
>> 0000564a96f45b30
>> [   99.137365]  </TASK>
>>

