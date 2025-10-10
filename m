Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60644BCC16D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 10:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1717810EB68;
	Fri, 10 Oct 2025 08:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ptT/33I3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A83A10EB68
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 08:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxPLavhDcXmoHD6B9cBLS805bPBtolvVXvLwL8hrPzQ9rlH33PKFIjE3su1azdB3IWj40DdLXjlX2mLoi9V6nnk8JV9UoxJ2SBa4b8L6ZB22JtRKCf79Spw7o0a1cPD6BTzduTckoQJXCFxxAMiNarqHb4syWPSBJ4+EbxRF3fagexBHXIb2/fL3pzVb0cIC+hFzzny/yzfJ2WU+VmdfogFros8BdNkyqMxaP45Fb3xYj3f0yN58RH9WHh6j8C1LUrmjcewoMLuLPGk+jNpbOuAXUNXwUEncLvnQfGSuLTMCMUopv0P/SY5f8LY5fdzZC67XOzhS9PdljKC4rmZRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGPWLu6IcihOZRFuK5rxcfftkQM9wC7edyIE/iMGWFo=;
 b=xxXiYJTg/xGZn/UbPtFy6bW+lyc7lhhw/u93XpvZcmkFqABCNCH1N5dA9we2wGVa5or6g6ZlPpkqq/kdTfKBAuLRqaGdWxlJTfTT25vpcxlcsZs4lWYlK3RUUlwP5nypyh/ARDhTVymUX0WeznMJs7oRFmWQt5kqfeJc5yVyEFGt58xFK6c9tQ3pkaFGT1yKFF2BfzhzPLtuBKIeYCg7F1Wvkv4eA8W9YnDXEnXa2cOFnezMt7mWn8WkxRJMRQw/lMPnyRyL7jBqxtLr+JqX6r8sv7jSfy0v8yjSE5QGSXQPyx1iCBoUVboZZsR9GJX/LWpBynWPOrRDssFW2Vkovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGPWLu6IcihOZRFuK5rxcfftkQM9wC7edyIE/iMGWFo=;
 b=ptT/33I3wb9ac1aHyBcKMx7ZaqGiQfnz/XR856qrRBPFJ+df6GoxGSuJHxEHCGmZieSYiiZgMb/9iJMT1+pD97hMJa3HHp0NxiX2URZipVxjw75glCC77CGKAfD8saV0pTIz9P83znWAXi8yc8IzJ7CDOUvkj4DxIx8l98f0kjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8155.namprd12.prod.outlook.com (2603:10b6:510:2b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 08:15:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 08:15:45 +0000
Message-ID: <ef3d0d88-b24c-448d-8370-2969ad8d7ff2@amd.com>
Date: Fri, 10 Oct 2025 10:15:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: [RFC] Propagate fence errors to userspace
To: Dave Airlie <airlied@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20251009200354.2752095-1-zack.rusin@broadcom.com>
 <CAPM=9twGyY03RNHQZvi_AWmKQS8EnyVvT4VxGGSraoN_V89m6Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9twGyY03RNHQZvi_AWmKQS8EnyVvT4VxGGSraoN_V89m6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecdea86-b02a-479e-6c32-08de07d5364b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlA1QlAvdU4rdnI1Ynl6UGZxMU4zeGdMMlVyVG4zMm9COXF0a0piaWl3RWpo?=
 =?utf-8?B?QW1pcFRaK291ai9JdG5rcWRnODlPWW4yamhIU1pJTWE4YjFISUJ0cXFVZzhD?=
 =?utf-8?B?ZGRIM2t6cmNSZmFXUlY5bUtEcHRBSEw4VUtlS2F4Uytaa2x3L01PTGxzenNS?=
 =?utf-8?B?R2QwazBsUFF2Z1pNT0g2djRJOW9GSUdsM3JTNUMrbEVPMk1YaU8yRTM1eFJG?=
 =?utf-8?B?bG1pdUgrYmk2NzhVY1BzdDdaNmkxTEZ2UERQc2VIQ3p1QkYyQ0l0K1dsbThS?=
 =?utf-8?B?QjhDcmhBQnQ3dHJ4Uy92eDhpTjVscTFsbWJUZDRzeUhoNzE0ei9hNnNyWXhl?=
 =?utf-8?B?VHJkSkREcFkzTUdyR3R3TkFnUFZkN21xaUlHcXd3SDgyemk5V1gyUURoQ0pQ?=
 =?utf-8?B?blcwMy82WmhNVmhoZVRnTWhIMnVVZTJWQmhwZlV3TzE5SUo3cEtYSjBvcnl5?=
 =?utf-8?B?NEtscE5wZU9mczRBa2ZsYnRuM3hCTGc5L1ExTzk4Z0NHK0lqc3dQb214aUZJ?=
 =?utf-8?B?bU1qNWduNXZFWS9GZlJkWWtYNFRTcHZRVUt0elN6aTFWY1lXMVA1WlFwbGpQ?=
 =?utf-8?B?QjhaMGNsZmphTyt2QTYyOUdPdk5ENGNiRTg3SEsvVkljSDQrbytHVERDNm51?=
 =?utf-8?B?UityV3k5SUlQWG1CT1pZUWJGZHVqTEV6d0pLTGozZGJUTTlQUTlUVi8vK3da?=
 =?utf-8?B?UitETWdQaFkvdVFGVHJzdHVUL282a0p6bmkvM21kcTYxbURjbnFEWVlHaUN4?=
 =?utf-8?B?TXZVeG84NEtBSzFWSDBpS3FSRkRCY3RUaDZ3KzhwQnNlTUVyR1RhMEFSOG42?=
 =?utf-8?B?ZEg3b1AwWTJsMG9DYjhUOTdYSDA5Yk9odjVtQjM4cjJLVDBhNmkwSWpWUWVH?=
 =?utf-8?B?ekJHOTEvSnFrcW9nVVcvbElqemlzV1BRU2hkUUVSRktRek9Ea2VPaENaeEJQ?=
 =?utf-8?B?U2RsVmJ6MUNWWG9VWWJMQTBKSDVZMjh4Tk92YmdQZE5rSy9PQ2JJcTZFbnNO?=
 =?utf-8?B?bjNsd0FsalQvZUxEc3BtUG5uM3hQQTdUUks0Ukc3OU1hYU9TcHJ1RW5FdXJD?=
 =?utf-8?B?RWVpdjB4NGJZOENFa1Y1R1BVV2o4T241T1d6WWx2eW9kV3hvYURGVXN5UE5l?=
 =?utf-8?B?L24rUlFqcld0dWsrS3hoNWZ3L2k0WDYwdVQyVWhrVkJINUlYVHdUYTUxZzBI?=
 =?utf-8?B?ZjhFUk5kQzZmL0FqMFcyeFJZQmZ3djZsVDUyc0FJTEt4K3pkWjFadkh6c3Rr?=
 =?utf-8?B?eGJ1Q2QzSkhaWUdRS1JCTlZvaFRzd0VGc0t1Q1JlSnl0WG1icHNKeE1sWXo3?=
 =?utf-8?B?ZEl4b1gwd1J6OHNJb3U4K3BkSDFsZUlPTmMxdFhxeVRrcmhRY0tnNk9lSkpD?=
 =?utf-8?B?WTAvVUQ4MGZHOXB3K1FEYjZPYmhMS0Z2L2RzUGhwMGljOHJSVDJoRjNJcWJ3?=
 =?utf-8?B?WEVSeG1iRWMwQnIzc1Y3WlBTM2R3Q09meEhJSkZYbGprWXJ0NGdOdnlJdzdj?=
 =?utf-8?B?WEFONlB6TkNwYkVNbGlWVmF6K0VJM0JUMG4vdkpSbHd3dWlIVkQwYTRRYnBX?=
 =?utf-8?B?bllXalk5eC9wdjBOZ1BiY0xsUlpUb3JsUkNsK2FaNmVxc1lmUVZUelM1Mm01?=
 =?utf-8?B?SUlXSnV4OFBxOE1vRVBQSllnOG1pTU5SSkQwU2QydFRzNEdxU0ZRdng5N1da?=
 =?utf-8?B?eEtuK0xKemF2OVh2TFNxTUJpZ01rTjlaOENnUWlGODFvbXp4Ri9kVVR5S3Rz?=
 =?utf-8?B?cGY4TnpWYUlLNk9nejFXRWxNOFFvRzNVcCtGcjlMVDRYbFNZNWxuSjVYcmdN?=
 =?utf-8?B?TWpaMHBCcjhhQ0pxeWtSQnhZZC9KTjN3UGdMaC9LS2tIdTFSek0zRlZNc1Vt?=
 =?utf-8?B?VWxrK2xCdERVdVlCZFdIVDZIcFFvWDJoeXNNTU51R2VraHJzckF6MWxiUHhC?=
 =?utf-8?Q?MccrB5XsHZTptilwPTQczmn5R71p7D0z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snk1Lys3TFZqazVsK2RBc3JHeWQ3ZXNWbVVlN2lYWDdBZlV0UzlKVTh3S1N1?=
 =?utf-8?B?MjZoVTlxRWM3bG00ZytrN0I4VjlsY2JkWmd2QnlmUW9KNjVaUHdkU3hBTGJ6?=
 =?utf-8?B?K0VBaU43TFRVWWxPcTZJZDJkSkJXNzV0TFZVWHRYVkhTZkc0WUFzZTlXV0th?=
 =?utf-8?B?VmhYUWhDSUVkV0pLK21RYkR4QzJIZXozYllMbVo3V1hGZzRIRUc1SGpObGtU?=
 =?utf-8?B?LzVEblcwcjN6RWxMS3g0WVEwWHhxTEQ4bXY0WXNhM1BSa0tUTG5hWnNuNWFP?=
 =?utf-8?B?ajUxMHNNaXhKV1ZLTHVUWDI4NjVEQTQvRitVQ0gwbnlEWnJXb0hTY1BuWWxl?=
 =?utf-8?B?WVhyL2VwSjZGbjh3ZHVpc1F6dkRYVno4a0tVMXc3TWliZGF3TUNjN2U1bmkw?=
 =?utf-8?B?MlFyTjRjcVo5aWRvN3V2aWVTYWFIeWhTbVpmdzlLM285K1JrU2pGYU00YTFZ?=
 =?utf-8?B?ZHF6Y05kdU1wa0lINERTSGx3VTZEVW5SK0VJV096azNTSGR6aFJJUytxT29B?=
 =?utf-8?B?S3hNb3BtKzJXWC9pZVdIa1l5U2RKSjFlZWNLWnprMmppZ09oL2tEREpGZG1S?=
 =?utf-8?B?YlJMSGxtL01wdXNuT1lTcG9BdGJDMzNPYWtWa1RhVzk5NkVIT2dTUGZKZWIr?=
 =?utf-8?B?YWpzU1YwaG9vSW10L3RzZWM5cGVnakZtYnlOc0FZaVd5Ymp0Q1c2ZmhScHI2?=
 =?utf-8?B?SFFlOHV6SmlNSEx5MnVtUEZsSThWU1pWNis3aHpJTlRmYURzRnFFU3RPaUJQ?=
 =?utf-8?B?ZHVLay91bXhrVldMMmQ2S3c5M1pZR3lsMFJubnVUa0hNTXA4TXdwelVlNFNm?=
 =?utf-8?B?M0tKdFUvNXlab01HY2hRRnNtbDVFcER2Zms1YkhQbkFmRkJZUUlZSlI3Ymc5?=
 =?utf-8?B?Q0MyTmlrQzRJdWN6VGNUNnFrYi83WDJTQ1BjakdLOWNaa1NWbU5WWkNTU0lq?=
 =?utf-8?B?REs0N3pFbmJ2d3JLOVkzNEE1dm40Z2JqNTc5M2xBemFFNmtzNGxqVGhUL2gv?=
 =?utf-8?B?V3NQUlM5Y0lLZ1Zvb3JKK0hNQzNXT3pvVzBVUjlETzZBdHlGV1VHQUk5VmlG?=
 =?utf-8?B?TUZmSmlVZ1c1alhzN0JuMm9VanY2dEx1aWRKMFpLUUpuZW1GdjB0WTFYc1U4?=
 =?utf-8?B?MUsybndpVGRrYmcraXFIUVJ4NndQMlBZYURxVFdIcW9vK0Urd2NLaUFMcC8y?=
 =?utf-8?B?bFhzRXVuTitGbTd1SEs0RktmNDZqMzZ4dkVsdjZtVHlpOWw4UnU1Z0xlYVVO?=
 =?utf-8?B?UDJQbFcreDlMaTFkeUpsUk5uSFNkY3ZwdGVuK0cvRFcyU1h4a3hlY2o1N3lD?=
 =?utf-8?B?dkhOaVIyaUs0RVBBdFo2blJNd25UbkhSNVY3QVZLK09JdWlRd2FFaE5nelRK?=
 =?utf-8?B?Tk0yY2E4RGpOWVI5NzR6SXdqVmttRXlpN0QyRVZpaGE2YXFHdWoxUDU1YUw5?=
 =?utf-8?B?NmFJQmMwUU9uNXR4WnI1cmMxcmJHaWoyVHIySE9VdGpkMnhMNmt1ZEhENVFU?=
 =?utf-8?B?YnlGc0ZiYUVwMm9pZDJrNDZ1WThUSUEvb3dSd3NMODJHK2ZOOWQ3ZmZmLzZq?=
 =?utf-8?B?QlhQWlZ2SXp6YjZpY3VsTmQ4ZzdiekZ3Rkk4cjliRSt2WkhHWWw1OGM2MFlw?=
 =?utf-8?B?RjBDVzdtQkpTeUxjNFZrQUJGcUkwZkxkZkhCSnFIditSYUx5RmErUXM5T1Z2?=
 =?utf-8?B?b3ZQUGlyWmQvOEVOcDg4d3Z1c2Y4b0FFK1FOTEdjNjB1M3RPNjBPZDJrTHFP?=
 =?utf-8?B?YlJEbkkreXRGc0lYM0FmMWVwbkt1OFpHRGRESjlwQ0V5bnVCbkk1RjFhTkJX?=
 =?utf-8?B?NUVOQ3hhRFh6d1dsVVF0d1luUytqSEJGQkNCZDBOdmNLMllrdzlQTFFVQjUy?=
 =?utf-8?B?K05aeER6UlFoZStHdlEwekdITHBhQzVxemoyVWNzM0hvRmQ4S0lTMVNXOFBz?=
 =?utf-8?B?NjIxQjdvdmF1cE83RFIvS1FtUC81LzJFVW92YXkrRjFoSUN6TWM5eUY0ckw3?=
 =?utf-8?B?RXFyOHFpc3JiTlhjekFNVmdyOE00NFdOdTRWYzdtVENscjVqS1M5SDFQdlpE?=
 =?utf-8?B?VGtTbXU5Uk5vUGQ2VFdNUktkWTJHdGFVS3ljOXNUaUYySVFTT0RZbnU2eDBU?=
 =?utf-8?Q?4gHFpa5/xE7M4pAw/2y6pM5qf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecdea86-b02a-479e-6c32-08de07d5364b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:15:45.5121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPw4tLmGcFIyIt6x9t7yZNBih0+sGh5e4xhH5dZesF+4cdOVI0vN2QYQdhwyu8Sk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8155
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

Ah, yes I've talked about that topic with Michel just last week on XDC.

It would make sense to have a generic interface to query the errors so that the display manager/compositor can do something reasonable when an application messes up its rendering.

E.g. display a an error message instead of just a window full of random pixels.

On 09.10.25 22:35, Dave Airlie wrote:
> Just adding Christian and Faith, who might have some more comments.
> 
> On Fri, 10 Oct 2025 at 06:04, Zack Rusin <zack.rusin@broadcom.com> wrote:
>>
>> Propagate the fence errors from drivers to userspace. Allows userspace to
>> react to asynchronous errors coming from the drivers.
>>
>> One of the trickiest bits of drm syncobj interface is that, unexpectedly,
>> the syncobj doesn't propagate the fence errors on wait. Whenever something
>> goes wrong in an asynchronous task/job that uses drm syncobj to
>> communicate with the userspace there's no way to convey that issue
>> with userspace as drm syncobj wait function will only check whether
>> a fence has been signaled but not whether it has been signaled without
>> error.
>>
>> Instead of assuming that a signaled fence implies success grab the actual
>> status of the fence and return the first fence error that has been
>> spotted. Return the first error because all the subsequent errors are
>> likely to be caused by the initial error in a chain of tasks.
>>
>> [RFC]: Some drivers (e.g. Xe) do accept drm syncobj's in the vm_bind
>> and exec interface, they also call dma_fence_set_error when those
>> operations asynchronously fail, currently those errors will just be
>> silently ignored (because they don't propagate), I'm not sure how the
>> userspace written for those drivers will react to actually receiving
>> those errors, even if silently dropping those driver errors seems
>> completely wrong to me.

IIRC during the initial drm_syncobj or timeline bringup we had a brief discussion if we should do this on wait and then decided against it.

The wait functionality in both sync_file as well as DMA-buf file descriptor doesn't bubble up the error on wait either.

Instead the sync_file has an SYNC_IOC_FILE_INFO IOCTL to query the result of the operation separately after the wait is completed.

Amdgpu, Nouveau and i915 have functions to do this in a driver specific ways.

I think we should just add an DRM_IOCTL_SYNCOBJ_ERRNO IOCTL (feel free to come up with a better name) to query the potential error from a timeline sync point after waiting for it has completed.

One problem could be that fences with errors are garbage collected on a timeline before we have a chance to return the error code to userspace, but in this case I think we can just propagate the error through the timeline.

Regards,
Christian.

>>
>> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_syncobj.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index e1b0fa4000cd..bcd8eff8b59a 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -1067,6 +1067,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>         struct dma_fence *fence;
>>         uint64_t *points;
>>         uint32_t signaled_count, i;
>> +       int fence_status, first_fence_error = 0;
>>
>>         if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>>                      DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
>> @@ -1170,6 +1171,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>                              dma_fence_add_callback(fence,
>>                                                     &entries[i].fence_cb,
>>                                                     syncobj_wait_fence_func))) {
>> +                               fence_status = dma_fence_get_status(fence);
>> +                               if (fence_status < 0 && !first_fence_error)
>> +                                       first_fence_error = fence_status;
>>                                 /* The fence has been signaled */
>>                                 if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL) {
>>                                         signaled_count++;
>> @@ -1213,6 +1217,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>  err_free_points:
>>         kfree(points);
>>
>> +       /*
>> +        * Propagate the last fence error the code has seen, but
>> +        * give precedence to the overall wait error in case one
>> +        * was encountered.
>> +        */
>> +       if (first_fence_error < 0 && timeout >= 0)
>> +               timeout = first_fence_error;
>> +
>>         return timeout;
>>  }
>>
>> --
>> 2.48.1
>>

