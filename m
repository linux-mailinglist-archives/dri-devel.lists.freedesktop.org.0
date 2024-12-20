Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E59F9561
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 16:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266C610E395;
	Fri, 20 Dec 2024 15:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wmdTPvYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3966F10E395
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 15:25:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2v0ZuaBrBqojoulE/nTh4+78LKuam75eSZlI0qBb4xfAuHeVCKrIydtxQRiBywGsStmGPjvjF+DbDtMc92Sa1332viVP/3h8NRKquHz6pqiLBsENO40wbGH4aN99U9/AA6SocE7gDUZoaw1DpCcnitTvrfdK7cthuzq2hBuU0jm5QUUA+lS/QYrO7nbp7zM0RvHStzBYrUHqUKF5lzKrXF2OMIehk64Ta9l8/NWVROa4o6FjklQyguGfUU0c4gBe9q7ouEC++Elf44yn5nMZ6IEaR8ry8KobIkR6ugH9/oSz8eK8s/3jzhLWQSw9azManwrVTrSIYu0/PTcUw0Rfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBl3aNqr1byk+TsjX+ZsMMKPzJuji1h+9JWtwztqrtc=;
 b=rRfugKF1xdpCEYipG3VY7LL8eyQmOJi7GRKEQGF38EIRxa6O3emP5klXZzkEAb/iSFDj6l5ZqYG80a51LQ/LgekpfTaLijtbi0sJ9e4ZZlfPucnkgp6xCK14DihU0jDVN7r8K2sIgxrlvE+NUZRKAsOV5imc/zTcvv6dRgsLmBYguyC8MV6PMSspPcou2r09UYTzItoZy5hoaSZkpU0XNYf1FViUxuRArUtz/8kMhiRGuZrbvFgxiLH2XBSpmUiyrZ48RIhxYJqO3jIgDpD5+UXCRDuWolOKfJhCKo30cvSOxVrUVECr1Vlx5dL9ygATBE3QF1KmbpTWy5a99Dvx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBl3aNqr1byk+TsjX+ZsMMKPzJuji1h+9JWtwztqrtc=;
 b=wmdTPvYtz+ISdx3EfJv3XwK8mTAV2LwydNhDfYiA9aOjPHiySSDp3ZWmN++0Y8HiGtg1oVoXXwkEEIpRDwQ3Gk7R7tqFJjWAaibBHAzCHIRkPc4vwt3RNTEOn4fNR3tzfulWPxzLDGyxVyD0Mjzzpj02HRZwvIhm4oq13XtYrE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Fri, 20 Dec
 2024 15:25:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 15:25:52 +0000
Message-ID: <474a335b-c79c-49fc-80b0-39471b8c8286@amd.com>
Date: Fri, 20 Dec 2024 16:25:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>
Cc: Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <20241220124515.93169-2-phasta@kernel.org>
 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com> <Z2VunIJ4ltfW_xqD@pollux>
 <e366a206-9fa3-4c6b-b307-d48855a7b183@amd.com>
 <46f22193d960c0a0960c2ceaa525e9ff57fc09b6.camel@redhat.com>
 <Z2WEe-tgp5CDtk4w@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z2WEe-tgp5CDtk4w@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a3acf4-6718-438a-f19c-08dd210a967f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0V5cDNWQXplclNweGpoVFBNNXRFbEhJc3BOazlpUUxBMjJIYSt3dHV6MXR3?=
 =?utf-8?B?ZDNTcWFRZGUxbnVlenNrK1c1ODZWakFqa2t3Y1hMV2RySjZnMUtzT3Y3aWVz?=
 =?utf-8?B?c0xKbW93bDh1VXl4KzU4V2gzbElEbnhvZnhKNnYxMWJDYm1oQlhmZHdLbm9u?=
 =?utf-8?B?dDVhNU1BNlF1TThnWklzTE4xQ3hZbVltNDJEUXB4cHhsb2N6a1NGeDRrR0Jj?=
 =?utf-8?B?Z1dIcVRDcXNEc01QRnhIcFNTUFlxTlJlc3IxWURrZXh4dlBoMTBza1lSQ04r?=
 =?utf-8?B?YjZGSkhicXZZM0MybzB4elVEY2cwNFQwT2c0TW5jUDNBZURESUVBdEFtS2pr?=
 =?utf-8?B?VGRwUmlucFZwK3drNGM2Qkd2ZWl0RUlpZ01UMlB3bGtvYjBSUFpPS0p4MG1t?=
 =?utf-8?B?WU9ocnZFck5kOHZhQUdWRVVtdTBIM1B6N0I1STR3eWZtdkl6UkhZNzRFWWhm?=
 =?utf-8?B?SVQ4aStDTkhBZ2Y1U3hPZnhBTmQvNkgvdU1VemdWU0l0a2Z2MC9hSENGOFNI?=
 =?utf-8?B?ZEVwS3o2alFiZHY3cFZsUXJhYWtKNU44Y3I2T3NFTHpBWkxCeDZhWDJ3Si9C?=
 =?utf-8?B?WDF5cnUyU0NsZHMrVnFZOWlkOVVDS3pRNG5PWVhEaWQ1aWZteGRIamlvR2RV?=
 =?utf-8?B?ZHZ6dTM1T0thNTIyKzIwenFqOFF2RmJIbVJRUWZrYkthWWVNczB6VkdQdUhL?=
 =?utf-8?B?anFvTFd1WWk2cnpCOHBrUVhDTzlJdlBnUkJubjg0b0s0dWZTVW5QSDlZWTFx?=
 =?utf-8?B?M0FKQSt0OFViNjJCbGY1c1FKb3AzWlNUbEFRSEZuQVVoSUI1L0Rzc1J6UEZt?=
 =?utf-8?B?ejhoWDUyTVBTKzFiVzEyTlBJTmo1K2RIckdnOGk5VjZiellpU2dzcHJVYmJC?=
 =?utf-8?B?aDg2SUx1UmRwSXdOdGdLQlI5ZEpVZFA5UkhBdUQzOFlJUENNbFg5WEJWWDM5?=
 =?utf-8?B?SkQyc2t1TWU5MUx4L0pHdkFPRHZwazFJbktsbmordUdpN2JkeVVEMTVqMHd5?=
 =?utf-8?B?MnZ3c2hhRE1DVHBHZ05PSHllY0EwQlNGMHRybGRaODFSRnVPWHlpOGJKRG54?=
 =?utf-8?B?TEFDcCtYNERnS3JiNnc4dlNWYVcxejlvdk9JZXBhWXpQazYzU1ZzTGtHOHJr?=
 =?utf-8?B?TjB5TEF0UFZyVFZMeGhaNlhzODVrTlpWT0E0TS9KYUgyN084UnJIcml0V3Ev?=
 =?utf-8?B?VlFId3QxZTV3VHdPVTR6QlVoVnhoVGV5THIvNW40UTFDdit5M0FoNC9LcVhE?=
 =?utf-8?B?TkpRdmF6ZVhMZUN1YnA2eVhBMi9ucDJCQTB3d1hSVzBscUNwQ082OVM4ODFC?=
 =?utf-8?B?M00yZXdMVlFsTEZOSFNkem16QjZTTUMrSnJIRFVoaWovUmhCZ1FxRWJORzN6?=
 =?utf-8?B?TmV3VGNvcE1sNVNuZGpxcDREOGRYbkRyYjkwcm0zSXhtUFp2OFpRZjVYa21O?=
 =?utf-8?B?SmZXWWdFa210OUNFTzRxWHp1R2JMcVdFcVNhVVB4eFRyeXVOazdOVmhXTHc4?=
 =?utf-8?B?NWhkUVJ6YzNlMHlvWVlJL2VBNjcvOEgyZDdlRmJxTzB6WUx2K0JhS29sakp1?=
 =?utf-8?B?a1BYYjhoSDdEcU5kcW5JcENVc1JaNzZCMmI3dlRoU2JmZ1c2eFFpNFFFWGVS?=
 =?utf-8?B?YXdDcXVYenB5WGpLZll2N2tJSHl5My9IYVdEdDczNWltcFJFWnY0VEtGc0Zl?=
 =?utf-8?B?ZSt2eVJwUm93S2I2RkRULzk5R1l3NnZCUDJ4c1pHUGx3RkI5dVdKWUE0MDE0?=
 =?utf-8?B?aVd3T0Y4WTdMOXZZSHY1SXRnRUNIZHVlWmtNN1VkV0hnLzJKMEJLaWwwQ0Zn?=
 =?utf-8?B?dDBTaUhtSnhUaTRXR3o0SVp5cm90b3hYVGJJdkxta1cvN2dSNUhYVDVnMnVT?=
 =?utf-8?Q?c/wRyU6ivap6R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2UvbHp2ay9XTDh6Smd3V0tVcDJsUWx0cG5HVTMvZ0hEcU1Xb0RxNHh6SVZI?=
 =?utf-8?B?aFJSWXkvQjhWWXJqM21IL2d2L01rZUFpajErdkxucHcycHhRNk5sWnpnYThs?=
 =?utf-8?B?QU5JdkttUUpwMkROb2p0c1RrM08vdUZEMnoybTAvclo1V2RYNGUwT2JHNE04?=
 =?utf-8?B?Uk5LZEt3NFZiVWNJVkRvWGR3aDM4a051QzZsRGJLMTNKaldTTEtwTUJ0ODJK?=
 =?utf-8?B?MTUya2dFY1J0RU5RZzVHS3BFZWdUZGdVVHFVM1c1a0lIZHV0Z0xTdWtLdDN1?=
 =?utf-8?B?NGlKYkUyamhXcjNieUxveWN6b0xucTFDYzBmWmVWc0N3VU52OVF4cVovU21I?=
 =?utf-8?B?RGsydG02U0lDdDZoS1A1dUFuQnVoK3BVM0x0MXZUdHU2bENrcUx3L2lmNGpJ?=
 =?utf-8?B?UVp3YmhiMkpzdjZoMHg1Rng4M29jOWNsMm44TjVtOFZvZnp0SFoyN2h0RVhy?=
 =?utf-8?B?MlRqcHV5N2gwa2JSeDFjdUlPSWNnbHliSmNxN2NYeGZxQkRFbnVhajUweStv?=
 =?utf-8?B?dXAyYldOODl6bHk4OW9SZU1xRkQ2a0dPSUZsbTZHRUxlSWdwMENMRTZKcFNF?=
 =?utf-8?B?dzZzdVNldXlwNDg5Rld0d0x6U0RCaXNTRXA5S1l1Z0FkQllNSGFlb1VBOUs3?=
 =?utf-8?B?M3lXbVoyVVYvRjlQYnhzN2ZDS3ExWjVENXdRenM5VlAyWmpIUmoycCt0SHNp?=
 =?utf-8?B?L1o3bmJYOVRiMmF2NzdoOFZML3FVUzFVUG0zYkJJTGhLK0x0QTgvek1XbENV?=
 =?utf-8?B?Y0d3Qys1SVIvRHhIUVovNVRjWS9kVDR1UGloNXNVZVNTdm16TXJMVXVONkdD?=
 =?utf-8?B?NWxNOGhJZmFsNVRLNjRKZWh6VWkxM1NlWVBtUUJmN3hTWmxmUHhSdnJKWE1s?=
 =?utf-8?B?Nlg2WVNQbTc0NTFOa2xVa2tyQ2Q1R3plZ1g0OTRzTHZlZmdpTTZUZmlyaGd1?=
 =?utf-8?B?Zzl1WGdURUI1aXBYMDUvdG5NaC9DcXJYdDJKaksxUzk1MzN0TGMyai90ZW9D?=
 =?utf-8?B?VkNiRjQ4VENrUktxNUlzNFFjZmQxUWhMN09qcnprQS9XQUJpZVlDWEZvTWxV?=
 =?utf-8?B?eEp6T0wyUHdSSlFhdVIzUkIwN2FkS2NvdC82TXFPVzVzcVNtMGtRcjBFWGt4?=
 =?utf-8?B?L1R4R1J1L1hmaUFkNStjdnQrWVZvRTdKK2hWdkhiMzhkalBvZ3JQK29XN3BV?=
 =?utf-8?B?Ui90SDFEajRqdWtCSVRRTUlVNWxZUllzV2tPbEVLTjdwZ3JyUy8yZWhqbjky?=
 =?utf-8?B?WVNORURDSi9qSExndC9KVnJHZUtwZUU5TGxyUFB1SEFUQXliZFVRcG5jc3RG?=
 =?utf-8?B?K2pxQjFWaEtYQUx1c2xtdDk0VmEzTE8zMzRhMzhrQWFHQUhoL2k4amVRbVBV?=
 =?utf-8?B?ZlR3VnJWRFkvL1IzWWZjNThTbHRYSG9pZGpKTklacjA3T0lsbHVoRVpVb3Vn?=
 =?utf-8?B?ZEk3LzhIZGpUNFRLVGhEWXBRTXZtU0crQm1qQUluWHR0L2Rhdjd1amhCQVg5?=
 =?utf-8?B?VTRSNGF1U0JXdjlENm9YMGZMRzBuOTNiYUdWQXQybHQ4NXMySkVXa3VmUFUx?=
 =?utf-8?B?L2hidUhieWhFTEJKZVhiZGVKanArRjZ5QkFjVUprdzV0OGpNWVphakg0anZL?=
 =?utf-8?B?VDRZWU9uQnJoZGJSaFBhRkxicXU0WnNMTWEwUlVsS2t1VzlDenZ2REFrdC81?=
 =?utf-8?B?a3hiRzdzYVg3dEdKZm9SdUZvZkVqVXhtQk9FOVZzMTV2Wk51Q29vZ3dNNmty?=
 =?utf-8?B?SnlDVmozemxZaENmbEx3S2hVKzUwa1V4QmQyZ0c0WG03M1dwWkx6bk9NT2F2?=
 =?utf-8?B?RUFyUEdQcGc2MkZYMkN1WmZ0cmtXKzF5NlErZ2VnR3lyWWxxemZwdjRsODl5?=
 =?utf-8?B?S2xUL1ZkNDNabnJyenVrYk5EVmZ2T3JSQjNnQklJb1dVZE1KeFFIcEdFK2tV?=
 =?utf-8?B?WkFtLzh0SWVYbXlmVC9aYTNvUlNiRE4yZWVOOWRjZ3dsVEd4bXJvK3lLcXFl?=
 =?utf-8?B?Tk9uYlZyYTJEbTRnOVhOWm1pY0lUVG5hWk9QZzFNY2o2bGdPMEhOTzFSbkZX?=
 =?utf-8?B?ak1uSTkzdlY1cTBlNDE1U0tGSFpGQ3hMVkFsckJCS21CZXB3RFlwYmZFd3I3?=
 =?utf-8?Q?U3z14CXykWQrE9ewTMR/sckpH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a3acf4-6718-438a-f19c-08dd210a967f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:25:51.7568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPfA/PFFtDVdh6i3WxpWpfh/L0evc5x2IlRRse5HdEHdKcR+/2TAuwwtWVmgUtFV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835
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

Am 20.12.24 um 15:51 schrieb Danilo Krummrich:
> On Fri, Dec 20, 2024 at 03:11:34PM +0100, Philipp Stanner wrote:
>> On Fri, 2024-12-20 at 14:25 +0100, Christian König wrote:
>>> Am 20.12.24 um 14:18 schrieb Danilo Krummrich:
>>>> On Fri, Dec 20, 2024 at 01:53:34PM +0100, Christian König wrote:
>>>>> Am 20.12.24 um 13:45 schrieb Philipp Stanner:
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index 7ce25281c74c..d6f8df39d848 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +	 *
>>>>>> +	 * @sched_job: the job to run
>>>>>> +	 *
>>>>>> +	 * Returns: dma_fence the driver must signal once the
>>>>>> hardware has
>>>>>> +	 *	completed the job ("hardware fence").
>>>>>> +	 *
>>>>>> +	 * Note that the scheduler expects to 'inherit' its
>>>>>> own reference to
>>>>>> +	 * this fence from the callback. It does not invoke an
>>>>>> extra
>>>>>> +	 * dma_fence_get() on it. Consequently, this callback
>>>>>> must return a
>>>>>> +	 * fence whose refcount is at least 2: One for the
>>>>>> scheduler's
>>>>>> +	 * reference returned here, another one for the
>>>>>> reference kept by the
>>>>>> +	 * driver.
>>>>> Well the driver actually doesn't need any extra reference. The
>>>>> scheduler
>>>>> just needs to guarantee that this reference isn't dropped before
>>>>> it is
>>>>> signaled.
>>>> I think he means the reference the driver's fence context has to
>>>> have in order
>>>> to signal that thing eventually.
>>> Yeah, but this is usually a weak reference. IIRC most drivers don't
>>> increment the reference count for the reference they keep to signal a
>>> fence.
>>>
>>> It's expected that the consumers of the dma_fence keep the fence
>>> alive
>>> at least until it is signaled.
>> So are you saying that the driver having an extra reference (without
>> having obtained it with dma_fence_get()) is not an issue because the
>> driver is the one who will signal the fence [and then be done with it]?
> It's never a "real" issue if you have multiple pointers to a reference counted
> object as long as you can ensure that you hold at least one reference for the
> time you have pointers to the object.

Well, I'm not saying that this isn't an issue. I'm just pointing out 
that this is the current practice :)

> But, that's bad design. For every pointer to an object a separate reference
> should be taken.

Yeah, completely agree. Weak references are usually a bad idea if you 
don't absolutely need them for something.

Regards,
Christian.

