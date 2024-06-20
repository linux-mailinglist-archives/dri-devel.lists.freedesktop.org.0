Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CCD91073B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8AB10EA24;
	Thu, 20 Jun 2024 14:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="22D5QPlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6E110EA24
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:02:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya0TJbcAKveAx7nCfRSRB+0l8MSgFzndkNhHeerZRFjtSgW72Ru3Kr/AfyDhNgV29uygTlqyTVFJBv2G6VYxKZjUd04NNfmh5PsbOIviE8TxmdNPQm5+Pq9DQHWDFyCKIZpRgHiVw+FJVqiI367wZ8H2wevObNzRvsAMZRLh1K/NsWOaUAFLehcH6xMZO5GSTRr8tuJ4sB5u4q26eHr6+GZskIYRNY84Q7edCX/yIJY7QM5fM2LYYdlLg315WQpHKEnqQTUA7umOphn7GLNOjaLD7UT2cuoujlIKocTzAkFeu+MNvADrbnJJ0/0Ggzy1Fdy1OyGhx4Z7zJoWRdOL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWEKSWles7WlXexnkQwxKNx3EP4UDeY8esbUsciJHnw=;
 b=VV7kF0ov+7r2vy3cTtiRdq/eVCsKrhlYv5twdmd4l0Rjcz3cVjiKWmJOPKA+G7Ohyu3wlkYHpoKL6uyQpr7X7QRYnoxTqLedmf9W4TGy1aZnItho4HC6y5AJhHX3ScQjRLGKM/hZ5TB6sbyfz25hu8P9kD1kRhOe5dCZhBLRXCm3G4K9Gv8CeeuTd83oC/7QYRucAe7SqGpytFCneJTUryWL00AIT8i2pSgo6VnjXhl4VMzh7de1hQvGasTTktqk4VlVnEPTBuZX87q10pd8Hclx9y10bk6g/fteyuNUzNGsTm8IAsCwfjUxuuldrbCVGTqexxFpXz0sokxM7Ym6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWEKSWles7WlXexnkQwxKNx3EP4UDeY8esbUsciJHnw=;
 b=22D5QPlNpMWg2Pt5EIDtpMdC8Kj7QMWYIDo9GRGFM5Etnu2XmQim9xTIuuy69svTmGiOhgUNQSqRqhdlB5Kyj4IWqXRnDpC4uKxybZSGz4gL0kKWsaU2AxXEl8mwUEynIZpviCNP3zFvLuP2mCJoxyVEP8X1mx7HYVNwzqZklpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6354.namprd12.prod.outlook.com (2603:10b6:208:3e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 14:01:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 14:01:05 +0000
Message-ID: <78612b3c-2dab-4fa1-b92e-3d654c6a1f7b@amd.com>
Date: Thu, 20 Jun 2024 16:01:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/ttm: increase ttm pre-fault value to PMD size
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Huang Rui <ray.huang@amd.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Li Jingxiang <jingxiang.li@ecarxgroup.com>
References: <20240604084934.225738-1-lingshan.zhu@amd.com>
 <Zl7qB1YmMSd43hZB@amd.com> <e1ec42ca-7166-4efa-a972-1b4bef6b691a@amd.com>
 <CADnq5_N3T6T-8iKrmdx=0L+z3+nd6-Mt7xJKKjrbNPoAE9SrYg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_N3T6T-8iKrmdx=0L+z3+nd6-Mt7xJKKjrbNPoAE9SrYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: c24dfb07-09d6-4ac1-c85e-08dc91316d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFltUTdLenNVYmQzcGROdjByakhHL3c3Z0o4T25CeElHWXhzU0YzRDRkaU1J?=
 =?utf-8?B?VDRSVWd1R3I2clZWL21obXdDT0xzNlpmZ3NZd1haZXhTWEZnZE8zMFdMMzYy?=
 =?utf-8?B?aXpTeGhKWkIvWTY5Z0tYd1FteWxEcXNnTjcyRFQxMVRTV1hTRXpFZkpLNzhO?=
 =?utf-8?B?RlZSbWR4UVZRdmViQ2YxaWtEb0tWKzZKOW5uU0wxaDVnTXR6dGk5VW1WKzNl?=
 =?utf-8?B?aEJ1Rk41UGRHOTlpSDEyWW5teG5zUmhVcFptTWMrZnMxMWpDK2FGTlJFRzVt?=
 =?utf-8?B?VWZyaWRzRVpqTm5POVgwVVdYckdOZllZaURrM3MrVFBJWUF6VEhWZW5XUWFs?=
 =?utf-8?B?UkcxRWZ3WEU1MUNGZUFRQVJrdlpVNit6YkxaNVFTR1FZODlacTBoS2hUMWZM?=
 =?utf-8?B?cythQllyOHpCUkVWMHBvanNuVkN4cVFOMW83WldkbkdSWC9ySjJHV2FyV3Jm?=
 =?utf-8?B?WnFJekp4YVV5eTVtOWVHQWl3dDBDalQ4ZGh4MjNuaHBsUFAweDZwQnc2Rmdw?=
 =?utf-8?B?NEdIc25VZ0Z2Wjh4REJlVzVXdFl2OW9vOWNlN3JRTVNUV2dWSGdtZnF1dFU2?=
 =?utf-8?B?ZlYzeHE5VXRMVUExakxjUHl6QlB3UHpxbFNKVVBEL0grbGpINUVTYzI4dU1h?=
 =?utf-8?B?bEdQaHMrTGxyWDlEU1pBV1ViRmw1dXhienZRZndteC8vejlpTjFrMm9HVzl1?=
 =?utf-8?B?Y1F3SWIrRVdxL3B6Mmk4MWFZVk5kb01ieDFBb3JyZmo0bk9tdEk0RE0wem9C?=
 =?utf-8?B?clpnNGRtMmV2Z1VnUTIzaXZtcWpwanplNTAwYW93bzZLN3NVRmxyQWxNejZQ?=
 =?utf-8?B?U085WUE2QkVicGJKVWVhbzlab1lUcTFlZXg2QTE2UXNBb255VU1peWIyQmkr?=
 =?utf-8?B?UjNuWGFXVHdLc05UN2VNR0NMMjRta2x2MDl2azEvR3R5QkJ4b2UzYTY1aUxX?=
 =?utf-8?B?KzJkNnQ4d05jUy92TGFiV3VoVG1FMStzSmMwWEtvaG5aWnhucThlU1k5M2ZQ?=
 =?utf-8?B?WFJpODhVK2ljQXdiYmFJallHVGFxQ2tUSytMRWd0UlBYQ0o2d1R2OStYWmxz?=
 =?utf-8?B?cVJ6OEE1U1lXK1NFSWJsb2FibUpTME9nenlOZnJIMWIyU3kyNTlLa1VkL3Va?=
 =?utf-8?B?RnBKZkdiWENOMHpDd2tNakdUVWpMTUN4UUUxcVVzWnNCK1NhcEtXUFRqVFdz?=
 =?utf-8?B?VDJJTml4Z1pMcFovNWZXanZ1ZExzNlovdGVGNUxqN1A0QXZHbUlZVnFmcFRh?=
 =?utf-8?B?NE11TXBZTU1oMkp2L20vQ3NQMUw4RGgxK1dKWGJXWTZTZEZ0b0RqUTRMUkto?=
 =?utf-8?B?dXZ4M1VxMHRSaEhjZXFQN1M2OUVOUFFFbzBZVDdlQ1QxREx3c2x6TnBNOXlq?=
 =?utf-8?B?Z1JWUEVxV1MrajlnRVV0aUg3WDYrSnh1dVpzQnRGdlltaDNiUWVXajJITVEv?=
 =?utf-8?B?MDdFYWhsK2xpOTg4NThtelQ5bGg2akNoMUVtTlMxdk1MMG1qMDFZSlFoVkEx?=
 =?utf-8?B?OCs3cGhwMGF3U0hMcjN2ZXg4MlBRVklWSzIxK2FwWS9HQnBaOTc2TElOTmZo?=
 =?utf-8?B?dmI1TFEwR1NRS1AxSlVrYlBxOTVsWEc3Vkp2a3lyWTZBQTlFdjBJemRwZkNW?=
 =?utf-8?B?dEc4T0JraFQ0eEhxa1c4R2o1YkJJS081VTFoWTNVMG9FNjRNcEFMY09KRU0y?=
 =?utf-8?B?alpUSG84WENBMUl1ZVB3elZzcWJnN0M5UDZWYUxZVWsva3VJcFNwR0pSdnho?=
 =?utf-8?Q?AcxKXrWklXFkd3OejDoY+YYtBiYc/8ZcrEuDQgR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2VuUmRzN1pOTy9zQjVhZDhrM0h2VXRpek95aDhrZnl0VStLL3RSYzJSdCtE?=
 =?utf-8?B?NWR2RW9Idjc4M2ltSjVyTDFaM3k4dDEwemwwK3p0dzBFd3JLejc4WXlBSjNl?=
 =?utf-8?B?SzdmKzlCYWdXREdQemVoa2FzdzhvTUw4bnl0NE9GelNCZkhkUTU0UVZPZlJk?=
 =?utf-8?B?VkFzOFE5aGMyRG9CanZnemJkRXlOK2lWTzYrN3ZjdFBPcjZPZjhKcmdGanVo?=
 =?utf-8?B?bVBTa1NmKzVQc0dYbTV1MTZTUkNzUXhqNitlQUx3Wk41UWx4UitkRmszelEx?=
 =?utf-8?B?d084dDl4T28wcUl3VWlPOStudThVaUZRWW50anBsVXZHNFdvcWo0d28wMHR2?=
 =?utf-8?B?UlJMdDZmemhLUUJ3T2ZIUllJUmc5RGJxNUp0dkZVNEFPaDE4bEJUNE1iSldU?=
 =?utf-8?B?bVU0b3NLbGNKKytUZjA4bmdVbW5HRU1lMjIyTHRwd1VzSzRINTduWkVpVjQ0?=
 =?utf-8?B?NksvZGFGYk53R29ZRjhhd1Jzanh4TUhNdzhtVktHQ1ZsQmdWU1J4aFdyK2Z3?=
 =?utf-8?B?RlNhYXV6UDZWeWdsSU9IekNsVjFzNHkraUxDUVBJcHVuZWJEU1R5K3psNTdY?=
 =?utf-8?B?OFZOeWc2WTFpWnViUEhva0tJekdNdDI4cVozWFFJRks4RTVDd0MyNjc1QkdX?=
 =?utf-8?B?ZnBnaHl3b1oxVmY3WlZwbUs4a0xiVG10LytEblJxbnhNaGxxNG1LSW1vcWM1?=
 =?utf-8?B?ci80VDcwbDJWdG1hQjRWQ2VVYXdyTVYvTVJXamJKL3RJdFM3WUVTQ3RCL1px?=
 =?utf-8?B?ejBlZ055ZjRoZEg2ZXA2Nkd2VFZBYVd2N05mVC9JYndYUlRSaE1jTFV0OEw4?=
 =?utf-8?B?bDRhMEMreHBvcnlEajM4bStWSVcyNzFzNXlZOFFaU0tXWWNIa0o2RnFKcUJD?=
 =?utf-8?B?enhLcGkzOEh0Rm84OWdWRDc0cGxzSTBlVUtaUjJtSzYvdDZpQ0R1VXh5b1o4?=
 =?utf-8?B?SXJLU2JEcmtCdDN5ako1MWJURDlkZ3ArTjhvSlpFSGtnaEtvaEJlUjcxQU9n?=
 =?utf-8?B?Y3FXdm1QMVJrS2RxS0NRWUtBWEhuWm5QdnZZN0s5eDkrMXg3VWhBNzdkWlFJ?=
 =?utf-8?B?NTd5bE9nblQ2NHlRakdWU0NSQ29yVEdncFZta3dpTXdCaXFYVHBoK1dFK0h6?=
 =?utf-8?B?bVBXM3Jzc3p3NlIrQXEyZHVoRVI4L0s1MEU5RHdNTGptdW43OGQ2V0M1MFJn?=
 =?utf-8?B?U0diWlZSbTY2V0JNOTZXS21Fcm9ja2x1MkdFOEFhVGtqRVh6OUJvUlV6NEtn?=
 =?utf-8?B?T0VLcFgwZlJNM1ZZRHFIdG5hNTQrcndrZ0luWDRTSGZtOFphL0VNcGRUbnFK?=
 =?utf-8?B?UGt5eTd2bHVaVG9KdWpCeTdyWVNCYmhQalA2VVZibVBHeEFGWDhTR1RFQ3Q4?=
 =?utf-8?B?czN1dlFzQjF0WnJSWHVMdFEvbGdSeUFPTU9MS3dwVGMwbWdZL3MrbkxMRUNO?=
 =?utf-8?B?NmRtNUdMemVIem40cVZDZS9IcjZaVXVJSHgrQUVzNlNBbjBUZCtMdnZlbUFh?=
 =?utf-8?B?VWFvcTVkS25mWUFNMGhYS2lrTHVGWWxPKzhkSGd5eExMVk43dlFxeXBmby9L?=
 =?utf-8?B?RDZFWS9DOWgvTFM3ZDZDMC9pMGI2Zmp6UHZWemhSdEdidGxZclorN0N1ZlI1?=
 =?utf-8?B?YlpaYzFoSTMxSkJNQ0hVQjNYRDdVcERQZDZodlJ4ZXdrZ1N0RVdvUHJ0TlhO?=
 =?utf-8?B?OXFWUnB4NFRZQ0RZZEFPM1ZyRVd3bFpSaDE4Q1RmNThmK0dZUjRhZmgzelBq?=
 =?utf-8?B?Y3BmTTYxb3loUzdNVTNXSDZzZlk2SDZrZDROaDdrbUNvS05CUFM4UlpkVHlv?=
 =?utf-8?B?NHArYnhOZXVLQ0YvTVRwL2lVRVhLandXeHJ4ZEpoTnRPQmVlclFZWU96RGhX?=
 =?utf-8?B?U1E0empkSXNaeFplSVQ5M3BtSk4rdGhoV2I4ZENNZTZkODdFc0Uwd2dteGh4?=
 =?utf-8?B?UjhROHZNK1lVYTlqZHY3bXd5ZExZU2cvakxwamNxRnhKWll0aFRWRmRwOVNU?=
 =?utf-8?B?MUFXZHVoT0IxbnBJYlZQTDVZSmVYdWhOQzdaSnI0WEp5V0F1Ymd4MVFLSWQ4?=
 =?utf-8?B?ZFdBNTJDbit5ZmplTVZXM1hYdEg2V0dST2ZTTCtJVzY1aGJsTTdoSXJkWUhD?=
 =?utf-8?Q?cEz2b2A5TYqfjEvFGyCJ+/s7A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24dfb07-09d6-4ac1-c85e-08dc91316d8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 14:01:05.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vL3/Aq0s8tMueXlQGvYMeEWtodqVyerA+ZPdm38E4VAH5MqpJv0jL9EJYN5xYHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6354
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

Am 19.06.24 um 18:09 schrieb Alex Deucher:
> On Tue, Jun 4, 2024 at 10:02 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 04.06.24 um 12:18 schrieb Huang Rui:
>>> On Tue, Jun 04, 2024 at 04:49:34PM +0800, Zhu, Lingshan wrote:
>>>> ttm page fault handler ttm_bo_vm_fault_reserved() maps
>>>> TTM_BO_VM_NUM_PREFAULT more pages beforehand
>>>> due to the principle of locality.
>>>>
>>>> However, on some platform the page faults are more costly, this
>>>> patch intends to increase the number of ttm pre-fault to relieve
>>>> the number of page faults.
>>>>
>>>> When multiple levels of page table is supported, the new default
>>>> value would be the PMD size, similar to huge page.
>>>>
>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Reported-and-tested-by: Li Jingxiang <jingxiang.li@ecarxgroup.com>
>>> Acked-by: Huang Rui <ray.huang@amd.com>
>> Not sure if there really is an architecture with less than 3 page table
>> levels, but the build robots should be able to tell us if everything is
>> fine here.
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Has this been pushed to drm-misc?  If not, can you push it?

Done.

Christian.

>
> Thanks,
>
> Alex
>
>>>> ---
>>>>    include/drm/ttm/ttm_bo.h | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>>> index 6ccf96c91f3a..ef0f52f56ebc 100644
>>>> --- a/include/drm/ttm/ttm_bo.h
>>>> +++ b/include/drm/ttm/ttm_bo.h
>>>> @@ -39,7 +39,11 @@
>>>>    #include "ttm_device.h"
>>>>
>>>>    /* Default number of pre-faulted pages in the TTM fault handler */
>>>> +#if CONFIG_PGTABLE_LEVELS > 2
>>>> +#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
>>>> +#else
>>>>    #define TTM_BO_VM_NUM_PREFAULT 16
>>>> +#endif
>>>>
>>>>    struct iosys_map;
>>>>
>>>> --
>>>> 2.45.1
>>>>

