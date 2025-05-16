Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B042AB9A26
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFBC10EA35;
	Fri, 16 May 2025 10:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UcbmLly/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56C410EA44
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:29:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6onwqZMUnnBfpQ9lr/ixBayJxfdYu5FGgpWa0yE5c1HqpSXf22FXe5rOczwhMIYEl+E11blFc9HciXy5NE5zVK054plr9hDzJNl945c/xbUPOqkIt0U8PFJ1NwfMvY+GNwQiwrYCTiDbxZccUFHux2EHTtTLxGU11b1yWRMFVx8zdNg9MmdmJypkHSfd8NG1KrdEfWC/OjJ6aOGM8hlNQqSAOzzjSBjvgIQ/gwowB7K6DE3Dtv3b9wSfuQU8KJhCJqHmZmole6Ne/gdJ4Xvc7Q3rFEaJjMS5TUp50tt+t5iYykQ59K7Xv1PGouUMh7FuRDvQ2XlssJh6TQhXQJYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0auLDBfFqmnfBh2huJORrmmDimULMTpSsR/gjfpMhQ=;
 b=gnOxfciFBfzCuhvP6n1khpZEbYQfS/dHLCwuhdmkC207xXVbc3sYRfAeWyyEnoRM5tToZWyeM59VGfD3EYXrG0izNXGGhfyf21q215WSterz8TTc3cHQ3aTFexdDzG9nE+nb3NXlazFdWFxuGhRzSsE9LJRttSFbDYEthLbz709WLJueTfn2PSGhEKFyaY3NzzpFkoCO9Q0VUfWwoRsH5O4APW4Y9V1bhxfqbO7E3xu1jCNOhr10VgC0fTwK1Va4CI3dwuG08xen5NsnJTSGZM8pYdjEmseCMHqME+b1d/WOoMXYVNnQwlowxoFAOzIDVIWnF/3S5FmXACw+BfUNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0auLDBfFqmnfBh2huJORrmmDimULMTpSsR/gjfpMhQ=;
 b=UcbmLly/3YcFB7VbMu+92biRd8Znv/KRpwF7GfWdfWnc7Tf6fCruEIVBm8Cl99joZMIrJYlcfqwusf7S3nNVR4K8iBKlibGPCwrtRpZ84DGIpxWC2BSL5SshhHnBeTNgqkF1feeFPMTF9VpRtB1SlQmqTbHBmnB0lYJwQZRQDGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 10:29:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 10:29:10 +0000
Message-ID: <772d694e-706a-4d98-a236-43d59094e8d6@amd.com>
Date: Fri, 16 May 2025 12:29:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "tjmercier@google.com" <tjmercier@google.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
 <e23bfe917c8744aa9162744bdd8ac458@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e23bfe917c8744aa9162744bdd8ac458@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0006.prod.exchangelabs.com (2603:10b6:208:71::19)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbd2b59-fa7a-4310-0530-08dd94647ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0s5OEFiMkY5ZGc2dG9TS01LYk5FYkJqVnRWdHBjQlNWTnNObnpOVGJkYjFM?=
 =?utf-8?B?WlRrMW9ISm1NUDVjS0xuNGVoaEFSZHhhTjV1WnJrdWhlS3FxMEpDbUtGRmpD?=
 =?utf-8?B?WkxwMlp6RHdkeWkxTjM3N3N2T3BPcC8yUVV1eFJ4dWVyNXV0QmQySkFFeGh2?=
 =?utf-8?B?Q1NJWXRRU0JmeDU3MmV6MlcvSFc2LytBNHViRG1UM0FDcXUrY0RPbjJCeXk4?=
 =?utf-8?B?Ri9yK0hSejZPRkIxclFiV3ZtbEdXaHhvRHVvTWFJbXdCZXlpNFEyZnhxSms3?=
 =?utf-8?B?R0VOdnNaZmd2Z0FqaUJyNTdLN3ZMUTIvQzV1MUppVGdLTVRqTzhxQnA1L3ly?=
 =?utf-8?B?eWIwc0VvM1h6cExpbDFqSy81cy9RLzlabmRDTzBuaGhtWlhkbTJneVgxN0ZQ?=
 =?utf-8?B?UzM4WlBjWTlISUpraklPSmxGaVFBS2JyUWo0bFEveWIrK0oyWXpGcGJPV0VD?=
 =?utf-8?B?QXUxV1VvY3FKU0JqMVZ0dkhUTUMwbVpLaUVVSG9yVWlBdFF2bm5KY1RaYnA5?=
 =?utf-8?B?LzdDdExXNDlDbHF4cVVaU1FUMXlKbGdKcXdIUW0wekQ2S0FQQTVwYThxczJV?=
 =?utf-8?B?dnA3eDhqVk83UkNyblVFaloycTY4V2lPeHBMOStZWmt2cEFYSHJNMU53QW51?=
 =?utf-8?B?bnJQalE2UHJNV25FMVlDdURWNE9iT3RpdUdERTZwb1J0MUNvVXN5SXYzWFZj?=
 =?utf-8?B?cnc4VTVXZHBIVjd4bmdBb1M1OTZhWmFtbTYrbDVMbFFSSnZUK2dTUTlhbllT?=
 =?utf-8?B?SHdobElBR3I1enRFeWV4citRSloxb1dWS0pCQ2NYTUp1b2o1TTFCbVpmajdZ?=
 =?utf-8?B?ZWNQSU5oazhLNVhScm5OaElLRVJPdk9xSkIxYTBNOFYwdXN0dXJ2WSt2d1Vp?=
 =?utf-8?B?SjFLTTdieDlIK1M2R2JNVnV2Ti9sSnhYUHAxSVljelRrWkMwczlQL2dFaFMv?=
 =?utf-8?B?OTVBTVE3dGR3SkdRRTRUdk13bjB5RDNBSHAyNGhGYjJSWWFIeFJoUWJMS2hU?=
 =?utf-8?B?bWdOUGJxRi9mUnZ6NXJSd05JSnZMalBEMkw3WHBwZzMyeEI2Zk13MmN4N1d1?=
 =?utf-8?B?ZE9wNENrVWp0Y0FITkhOdDcveXJTcC8wbWlrY3c3TGpRaEJIOGU2bVgvbFRL?=
 =?utf-8?B?RnhRaXFocmRNQy95dk85dFM2RzlzZ1BlTlBOTzVHZXpIL1AyVWFJVlp6MTlY?=
 =?utf-8?B?U0lseW5JUXBkZk9xRUJmSTgzOE5ONjN4TjZhejVUY28yaVlOYy9oQ016Q2ZZ?=
 =?utf-8?B?dUxYREE0OHhHVFg5VWlxd1JkVWVCemVWTCtnU0M3OTJZVTVrbmpCaytReGRm?=
 =?utf-8?B?dHhpZ3BHYjVTOXhCeDVMNWhKZzF6UVlYNW9CR0tYNXpPSnBVQXBURXExYjQ0?=
 =?utf-8?B?ajVWL2N4RytQVFRIK3NONksyeXYrVlZXanVqajBGVDFZQnd5c3k5L3p6Q2Rn?=
 =?utf-8?B?MG5MQW9Dd09Ra05IU0hlanJJcXp4aEgyTzd4TWY4L1RiV0JqRG1yR2hWaGRV?=
 =?utf-8?B?THhBVXQzSDZuVWo2V1N2NVBGUERqYk1Fc0RZS0R0UUU3R094NXdqSzBEZ0VI?=
 =?utf-8?B?UGhhSHdVbWZuMVZtTDJLNDRQVDJTL1ZxbXZML3ZMUGlsMGEwUUgyZ0pDcG5O?=
 =?utf-8?B?VDZYVmJ4L0txeVV3eXpkSjhFTVpJZGJha1dDMXBPSGVlUk4xRU9nSWdhczZC?=
 =?utf-8?B?V2c5b0ZlVXZ0UXZLS29sdmJIakJPM1lEYnkvNEphVWlCZU9LRGJUZmpGbG9a?=
 =?utf-8?B?QkYxYXVWRVd4aHkzU2lZYlRlT0YxWTRaWVluUDVQZGloL1M1bzZJMm9JL2xM?=
 =?utf-8?B?MENvMmphdVNSZ3FIZk1xbEJ5cU1JK3NQSjhoTXU2QmxrWFBOTHo4ZFdqYU9Z?=
 =?utf-8?B?a3NiSWZGVG9HVWJrWkE3L29RSTA4UHlJSlVJTUtxaXlXN3Y4Y2Q1anJJejU0?=
 =?utf-8?Q?uHjKgC6ezHs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cCt2TkNTV3RDUlk5TU0wdEkyZXNmcFFmSzdDbWRlOWZxcEpYWlhZSklBZjBn?=
 =?utf-8?B?UmNMUUxWYWZPWXc5cWo2WlBXa3FmakNSbWhYaU5GQkRJSitYRGRNTzlER3E3?=
 =?utf-8?B?S2NTbTErckJHb2c0ZTg0MmZUQXFYL0hmN01WNDFYalRGcHJJaVZUVitDRTd6?=
 =?utf-8?B?aHBEM0NpbGRJbDFEVUxwMUtCcEp2d3BPNG81RVMvTWVzRWdDYlJrS2lRNWhE?=
 =?utf-8?B?Vm1IUDhmTytmN2FPdTlZK2JsSjg2NFRtYWREbUxkQXFPT0x5aGFwZHFjQVcw?=
 =?utf-8?B?YU92U3MzcldleEJYZmVMOEI5aGFOMlBlTktRcDNZN01kbjdBUk54OEdnTHZJ?=
 =?utf-8?B?Q2hGSVRpZkRJWGtMNGNlNitLdk5BbkErTWFBOFhQMHZ5Vm5XVkZaRTdPNUZR?=
 =?utf-8?B?Nitsc2p0OGQrMFl1a05uTHJ2RGJ0K2ttaDhlYkQ2VEg3dUpXOFR2aXFZekFD?=
 =?utf-8?B?cmlUYnA1K2dyc3cyNDB3d2lzcDdFMDdEZU82VDhhQkVkbHRvQm42UG9yZUVC?=
 =?utf-8?B?OGowekY0cHZNMnFxN0U1bWVKRmQrWk9kakt0dCs4Wnk5YmM3b3U3L3dVaTdJ?=
 =?utf-8?B?MVhkYmNVRC9KMmNZNUwwZ3NSbWxmNGg5MVk0b3JSUlZEK1hpdjU1WHc1MFJE?=
 =?utf-8?B?d3dPcytZaUNZMHg5QlI4NVdpNnVvYmE4OEtCRDZ1UlhkOGNWYXNBRXh4RDJD?=
 =?utf-8?B?WHhIQ09oODc0Qjg2Q3lBRU9PZUwrbmxSbXdPSG41a25sWXZLd3VZY3NhVTNJ?=
 =?utf-8?B?REF0L05pT0ZYdkRCbWROMS85MWJLV1VzSnFqQ0FaamhuU0M0cU9kTjZrQmdS?=
 =?utf-8?B?ZTI4MVpZdVRyeHR6UTVheXJ0bWxsakVJVzI4WTRreXhQWUVpNGIweENRemFF?=
 =?utf-8?B?RlFUS0wzQ0llK0NiQmRCdjd5YW8wb0I5d1A4NStNZTFjMGxoTVFvWGxpaEpw?=
 =?utf-8?B?aU41Qk44ZnMvUFJIdXNmcmNMM2JnYUZLMUlpSkI1T3puWUVXRVFheFBmMjBx?=
 =?utf-8?B?L0lPUE55WHJma1lxRENGRXBXUUVRRlc5dFdxSmpQc1RPOFhKWlIrV3pYSmpD?=
 =?utf-8?B?TWtMazFlVUh6dXg4SDdHTTY4d2xHbE1IOVQ5VndDZnJzZmVOT0o0TTZ6MFRn?=
 =?utf-8?B?TFVMMHZaR0JsdklwbzVKZGt2bEYwdjgxc1ZIT2dWdEtDUUFyd1g1dGFQdlRu?=
 =?utf-8?B?TGgveXE3emxsRzlRSElmaU93YS9GL2NSOXlIalhHMGhkTTJpUzNpY29WZzBN?=
 =?utf-8?B?UUYweVIvSTNRUWhOQm5iVVRYbTBRZFBYNE1yaVh5cDVOSGdQb3ZKUlB2MmMy?=
 =?utf-8?B?NStyRnJLNlF0QjhNSnFmQjNyTjE2TkllUk1laktQNWt6Y3J4VU54Y0ZQYUd0?=
 =?utf-8?B?bzRCOHc1M01Oanp1dFRmOFdaOWsrSlBZcEc5OWwzOURvVWhxQTNxMzJSdFJx?=
 =?utf-8?B?VVl4WHhHS09FeHRjL1FteithVXh5RHRubGpQcmpZdzhJSXNadS9nUHA2SGYx?=
 =?utf-8?B?amwvWDBDM3lDeFQ3M2lUWGpPcmdlWEVaakE1dTFaVWdRQUpTbUp2cnlYTTdr?=
 =?utf-8?B?RFRneDlRVnBrNktoQ2hXR3VZc1hNdXdoTERWU0RnQWJrWjlGK2FCOStyVXBy?=
 =?utf-8?B?VGRPeXJWOHROU21yRFNFME1GRWVtbFdIc0hPZmhyM2JIbnZQVWFPM0puRzVD?=
 =?utf-8?B?SmV0aEhWRGc2dHl3Um5DK2hEL2tmQ2tZc3hUYUhIaDZSZHdCMkgwN21wN3dO?=
 =?utf-8?B?UzVXMVRvd1l3QjNWbHlWQVNGaEZBYlJGbzBSN2RHUDRSYVE0ZDFqc1M5dXFU?=
 =?utf-8?B?SHRHZSs0YmNTWjdyaUJrc20ydmhsbXJRVXRSaEFOdThhbENHK2hBdFgwQ2c1?=
 =?utf-8?B?ZHUyd0FYbmg4UHplVGFWcm9nMUUxMnRwZUM3M0tVVnlVa1lSTGZNRERnWEFM?=
 =?utf-8?B?Nllub2EvWnZyV1EwZzNzeXk0bHArNEpEN1k0cUhLRGNndnpoWmlaMXZWS2JB?=
 =?utf-8?B?WWE5bUl4RU9UWm1tTVB2bCtIRTE5Q1c2YkwzMVZGTHFRSS9pWWYxb1pCTS9h?=
 =?utf-8?B?NlpPZy9aT2lWZ0FhcllkdkhYT0FaS21zMklzcDJLN3plRUg4S2dhZlNJMkxl?=
 =?utf-8?Q?qKmZHUR90VvEC4rTZGQs7cAb8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbd2b59-fa7a-4310-0530-08dd94647ed8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 10:29:10.4470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpTYxXVtQRZRLz7T/leCuNkxktXa7+Hw+lc0YsyjRgr5ufP3Ct8bi4KDdwTMqRIS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619
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

On 5/16/25 11:49, wangtao wrote:
>>>> Please try using udmabuf with sendfile() as confirmed to be working by
>> T.J.
>>> [wangtao] Using buffer IO with dmabuf file read/write requires one
>> memory copy.
>>> Direct IO removes this copy to enable zero-copy. The sendfile system
>>> call reduces memory copies from two (read/write) to one. However, with
>>> udmabuf, sendfile still keeps at least one copy, failing zero-copy.
>>
>>
>> Then please work on fixing this.
> [wangtao] What needs fixing? Does sendfile achieve zero-copy?
> sendfile reduces memory copies (from 2 to 1) for network sockets,
> but still requires one copy and cannot achieve zero copies.

Well why not? See sendfile() is the designated Linux uAPI for moving data between two files, maybe splice() is also appropriate.

The memory file descriptor and your destination file are both a files. So those uAPIs apply.

Now what you suggest is to add a new IOCTL to do this in a very specific manner just for the system DMA-buf heap. And as far as I can see that is in general a complete no-go.

I mean I understand why you do this. Instead of improving the existing functionality you're just hacking something together because it is simple for you.

It might be possible to implement that generic for DMA-buf heaps if udmabuf allocation overhead can't be reduced, but that is then just the second step.

Regards,
Christian.
