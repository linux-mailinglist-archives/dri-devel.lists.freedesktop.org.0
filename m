Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3252192D0CE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 13:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B9110E74B;
	Wed, 10 Jul 2024 11:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1qUQcv8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB81F10E74B;
 Wed, 10 Jul 2024 11:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4DUmbcld0/ufhwF5WlBf/XLx+hq6MCG97GwiqlXdS7jUQNx6DrYphAEYfESR7hBDS39ji/iqJgni+umg80/a6tvkxBFjrQ7JHk1QSX24fKYuey+RC6ZUZE0PA9BmRCwBSChMIA/8wTEW9b0irWSpMOq6wWq4fUj2H7eg39PGKbe+W2FzoSJN/nFVqBy4g4kb00ep2nB5pwiMcquBCtITvDydK1aUq+uCGkWYMLeIKUhc9R4ds3rbJmLYeDdg8r3iiXkcJgu0dONA2xakAKON03Agl9e5Byv8yyoGj/Yr9fhhYprEvXP2GhsCTozA06ZIsq0sBwgmQSTUUih1RAb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfuQRcuIxLzAxfvzWzqzfyV6HuP/jRUUHy+iznS4luo=;
 b=kH9OKxiWsBVbiUuyUPb4un/O7iYLVb5DPT1Q04x7zDzSlLzJ1B5skKKqKjg76KrdaucenpQclA8SmE8PyshOceheu6AefxaxTCWLFaut74TlP1qUsXSAYMKklnco9H1LouDQkUQGoD3RWhNdQfklyTyJIVFnF6Y6KvmRxTCLMVQDzANhVrTb3wjfA57rGZsrcGh6gSjsrIJpXnp1sDpgdo7Ivp+wuiNhbmH3s8pWO4pJYyBMZaLm0/57NCGSTyyL/OkTArdeVal/FDb+ZHUNhHnNr0nSBidT/BHyUUZpoCySDFBmLugHduja2m5snqW3x/rZ5/o0iVLI1w+C7ltuvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfuQRcuIxLzAxfvzWzqzfyV6HuP/jRUUHy+iznS4luo=;
 b=1qUQcv8MSFOhI+Iy/CKKXxGdq8cGzLnA7S4pI3AsSYu5KAFf6Mxswq0suP+cPvte9oLDKZmwNRDouq3ie24kKC8flDpB1u5QyJ+xllpBa0DPM3J+gb7euMvIDq+Jrg8ENFZjc6Nr/E414nmjbLwYDe7WRmeuQi/IAKDbLXiUzSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Wed, 10 Jul
 2024 11:39:03 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.7741.027; Wed, 10 Jul 2024
 11:39:03 +0000
Message-ID: <03f7e2ad-fd5c-4da7-a14c-34c2c158c513@amd.com>
Date: Wed, 10 Jul 2024 13:38:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: Add might_fault to drm_modeset_lock priming
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CH3PR12MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 551be219-4c24-4d18-754c-08dca0d4e637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ry9IeFZjSlRaak9vUWR0eWV2UzBJc1BJSkRMd3hEWTZTTHAwRHdvSDFlNEZx?=
 =?utf-8?B?dk94eEh5OE1CU0dmNWp4dVF2VlVzMFlydS81M2Jyb25qVmxLVWxMdkpGaFdj?=
 =?utf-8?B?dGMrTWZBbEI2ck5yQnpyOFFJRmJwSjAzWVJ6aS9xUjZGa1JIY3FjRHN4QVdW?=
 =?utf-8?B?SFNYcEx3OWNXNXdQaFhqbHdoYzM5U2ZBYko0bzhqL3cwdmZPcFhNTGFPSVho?=
 =?utf-8?B?ZC9zRUNTYzBiM3FIRUJJOU9VTGhZUzZ0RXVoWXlxcEplUFhYVjR4UmUwcWhX?=
 =?utf-8?B?UzdoNUI4OEw5UXhOd1R1cUZVRENMd0dhSE44SVhZN1ArcDM3RDlFYzZtYlZS?=
 =?utf-8?B?SDRwaXY5azRuYjlMbFYwOTV1bWJTTFpoUlM0bEcrQ3NUVUg0ZXFjeVhoZFJD?=
 =?utf-8?B?dlRuT2xhZ05Vc01rbU9pWG9hWDJEZDg0RzN3TzZ0WSt3NVE1cmQya2xKZERN?=
 =?utf-8?B?dXhvck15SUM0dUF4RjFZWkFBaHdxZTBQQm5UeTFsS0tBT05zTGt1NjlFYkdn?=
 =?utf-8?B?cmFQV0xjczRuRW94bGFTbW1XTi9zeHZWTklZNmIzYUNUdCtJeE9sSitMaXVV?=
 =?utf-8?B?ZzhwU3ZEUUx0WnkzUC9NN3FBelR5c25oNXZKejdtWjFjQ1JsK292eFpDK1Vl?=
 =?utf-8?B?TndXbEJtNXEyRHR5c0Fsby9JSFZ2eGhLckR5OGI3bzlTNnYvaHAxbHc0RTBD?=
 =?utf-8?B?S2NwUzVlRnlGNFdzTFRxY0M5S1E0azhZNXRibElZL2hVKzlYQ1VUenFOeWFP?=
 =?utf-8?B?UlJ1UTNtcmNxMFVKN2VOcU1oSU94RzI5K0M4clcxZmNBZTBRaXV1OXdOYmlq?=
 =?utf-8?B?aUdZcGI2ZjRMVnFES0gvMlBSQm93ejAxblJYZVRMRzl5eXpVczdHN0I2eFlT?=
 =?utf-8?B?RVhIZ1crMTB4M1QwV2RMS05xbFFlVmZYQ2lKOWkwcm5jM0lCbitLM1QwZDdE?=
 =?utf-8?B?MEtzUGtsQ3JDTTdxRHRLRzlaYXc3QnVsSjk2RDBmMjRtaDBsZjlEOHBtVWk2?=
 =?utf-8?B?MnhyS0RVREpIWjVtVnF0Q2s2UTRpTjJBRUlJcWFhY1lNbDRWcnRGVUdrRlVr?=
 =?utf-8?B?U3JobDFLLzBmV1JmNnV0MXlQYjhxdE9BSEIraXAyMXBsc2xzR2plVjAxb014?=
 =?utf-8?B?K3VvQTE1MEFYaGZKYURjU0I4VHJHc1M2SjJzVTNnOHVWMXltR1RlYWpJc0Uz?=
 =?utf-8?B?eWJFdVBiVUE0S2xTS2lGOTQ0aVF2UlVCT0VZSW1MVWR3VEcwRVExd1pBUDQ1?=
 =?utf-8?B?VTdjVFA3MHNZTXNMMVlOOVA4RFdvKytpRGRIMUlOdVcrVUo1UFpqeExPVWJQ?=
 =?utf-8?B?SERlZWUwYUNDWXBldnM0Y1Q4NG52cC9oWUQ0S294RkZJQUhGTGdtMmVqSUNC?=
 =?utf-8?B?Y2I1L1dVZFZvbC94L2dYcVVQSUh3NDU1M0RlZG1aWEJ6NHE5WWpKbWtNNVZH?=
 =?utf-8?B?WjVnMERVRHBKcnhNMnM1NURjalNkck14dENUdktBMTF6bXU0SEtKTjQyODEv?=
 =?utf-8?B?L0svNEQwc0dmMUNpcWNVWjdxV1lGQnVvTEQ5UTU0Tm0rVjlVTVdqWWdtS0dZ?=
 =?utf-8?B?bWtud2IrbkJNbU43cDJvRlFvazEzOEFoQ05sNFB1L28xN1QwK1o5dDRvTEJC?=
 =?utf-8?B?SVI0cXJWU3pHYldCYU9DblpUSGxDSDVhZXdhYVpBN0dyZFVKQlFLUDlSekxM?=
 =?utf-8?B?cnRPd01zdUt6cUpFeUxvWXp6SHpnSXBZNnU4Y2pwNW4zZGQ3aERLd0hRVDg0?=
 =?utf-8?Q?614vC8rlYNKhu0KeI0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2djLzdXQzh1Z0FkcEZRNXFyVExoVno0azdNYXZEZzQyd2ZDQmJFakdXZWZJ?=
 =?utf-8?B?UEJjRG8xS3FoU2NURDJPQThBVS95cjljNklRVlQ1Y1RuNGwvYjY3elZydlFk?=
 =?utf-8?B?b0Y4bzVLY2Nya2JrczlBUUczZElrUDVXQmpPalI0Smo1K0tyczlzZnhJVUhD?=
 =?utf-8?B?L1l6UDQ0MlE4ajBlOURjNVpDM0NjaEE2a1kwQ1I0bnFMTklLdm1admdBSVJw?=
 =?utf-8?B?VkROU2cxSzVmYWxtTEdOd0NRd1BtY2hlUzlYQk5BTUkxUmFsYWFxOHluamhX?=
 =?utf-8?B?MmxtdVVaSC9OQzdoazAzNGhidlE3TUpnZ1VzRVdtZnhxbjFKMlYxWFdJdmw3?=
 =?utf-8?B?dUtkc1o2b3FLN2dUV3pld3M2RHpRdzdCenpiOFRaQ0kycWFxQ2RNeG1VOUg3?=
 =?utf-8?B?OHplNjVxT2RkdXhKaytmODhsM3p5T0ViNk42NVh2djF5NGd6Z0xHeU9SNlVZ?=
 =?utf-8?B?ZXZ3Z0VOcFV3YllyeTg2RkdzWWlPUHAyUkl6bm5GN1dkcEJnSlNxa05SSlJT?=
 =?utf-8?B?T2ltY21wd2d4bW1tQmlwZzJiU1dhenB2RDhVaUlueVgrTlp6bnJzZG5mODZY?=
 =?utf-8?B?S2IvRjZtU3lkVXZ3WGoxZ3ZrUkp0a2hiOEFHMWtPZm5sWFI4MitnckhXS29P?=
 =?utf-8?B?eFJ5YUp3enpBQ2QyS0ZyTjBFdmVFQmNCdVN3cVhFY0Qyc3BYaG4zMXY5MWNn?=
 =?utf-8?B?ekZXVjRjOFJOV3d3L3dYdVNJbEVmMFhjN3dvM3FBb3d5TnZDenQxYjhiS3Bh?=
 =?utf-8?B?VUxwVkRHdTc2dk80QXNyY3ZES0RCOUNRYXN5NHMxTXovVkVhOVhzSmNWak1O?=
 =?utf-8?B?V0RFL0dEbGFjU1Rjb1RrNFVSZDExVCthUDFhUFB4cDNPd1o2U2xZMHZ4N2x1?=
 =?utf-8?B?V0ozTEJybytLcU5iUVhlTnFrdlVZT1JQUS9kL21haTBqY0FjY05oNlJEb3FP?=
 =?utf-8?B?Q0daWXpmcHp3L1VIUVZUaVFCNTFKaUJyeURuQzlQb3c1aXM3S2V5OW5wQUV6?=
 =?utf-8?B?QXlmMkk2TTE4QjQ1UTl1UGdweG5ybFRRUlhnYllCU2V3c2h5WWZCenFDQXZh?=
 =?utf-8?B?TklIOTZYU00xQ21qNVJ6MmRGMm02cWFDOHlkSjFpZ0dhVzZHQ3pJVHo4dGMy?=
 =?utf-8?B?VTR0RXdPUU1UZFdRTWttYlZOM0FFZ0lGVXVPSkNIYnN3YVIzRUNZUHpSanlH?=
 =?utf-8?B?SEQwSUFUUi95TUNqSWlhVlBRWElRM1hwbDUyeHZRUmVsd3l3bmF1OWJYRHRa?=
 =?utf-8?B?cU1XTFRCTjFRaHZ5aXVldjZSY3ZQVDRvb2xRMXVHVnY3RnVNTXJ4RWVGMG9k?=
 =?utf-8?B?cjRpNmZhZkFhL1JrUUdRN1NrWlZMYWxHa0ErcGliNkRmcDdPcTZOVjNoaWk1?=
 =?utf-8?B?VjFCVkxYWFRkcjRNajdmWmJ6b1FnNjdRQXhFT2RsUmx6UXRVaXVjbUJLYnhG?=
 =?utf-8?B?cHlwZlhUdVl0OEhPRmRCY1RqVVBrSlhPeU5PTnVoQklLYTVWN1I4TXBIc0tU?=
 =?utf-8?B?aE1jVm0vNW1OcDFmVUo2NS92dGhFL2FxdnRrSlhFNGo0NmJNKzRaekVUV3U2?=
 =?utf-8?B?Q0F1NzJ4anI5WEwvZk9GNlpmcVYrTTJkRmNVNGc3WWhXMkNDQ0ljcWlnaUFv?=
 =?utf-8?B?RjEyaEhzRWtyOTZDYTVhaWY3eU1lMzJQM2Nhc2gvQVorNEtFVkk3T2tCVHcw?=
 =?utf-8?B?UFpJeVlSS2xVNE1rd2U5UUJXamVwWE5HVHNtK3RUY2dGVmx0bmxHWUR6c1ll?=
 =?utf-8?B?SW5wV3c5WldKVFdJLzk0R3QvMXFkTkxFQ05FbEtXYXlmVVIySXFDUEg1TjlF?=
 =?utf-8?B?ZWoyVUticU9qS0JYM1VUZnFnQnFKc1UvTGtJcTZ5ckFqV3dyUmMxWWY0eTRq?=
 =?utf-8?B?eEhMNU5kcWhsYUNlTEZCZ0t0MklQQUxtdlVHOGhCTkUzRUs1a1VVcGs1ZnBG?=
 =?utf-8?B?eWcxTjh2STBSempLOUo2dnd4eVJnb0RONkNLQkh5cWplUFVKaGRLZUVWVG11?=
 =?utf-8?B?dHRIR1lkVDN2MnVyUU9TRnVPbFV4VXVrSWdab3pIZVBhVzVCdHF2aU53R1JZ?=
 =?utf-8?B?SGZkeXdYL1hOYWRaZHduTTBkYkFBUitFTGtBREVEaWdPOEhiQzBZMm5qTGYr?=
 =?utf-8?Q?Sp67dEcaQGiMeyr1cBWULYJe0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551be219-4c24-4d18-754c-08dca0d4e637
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 11:39:03.7400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hlhzq8AvSXhM8NAsoN6CcILGqAkqzcTYJHEVlJgyqdSY9I9sbSkJ+WxzBFVD1l1t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196
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

Am 10.07.24 um 11:31 schrieb Daniel Vetter:
> We already teach lockdep that dma_resv nests within drm_modeset_lock,
> but there's a lot more: All drm kms ioctl rely on being able to
> put/get_user while holding modeset locks, so we really need a
> might_fault in there too to complete the picture. Add it.

Mhm, lockdep should be able to deduce that when there might be faults 
under the dma_resv lock there might also be faults under the 
drm_modeset_lock.

>
> Motivated by a syzbot report that blew up on bcachefs doing an
> unconditional console_lock way deep in the locking hierarchy, and
> lockdep only noticing the depency loop in a drm ioctl instead of much
> earlier. This annotation will make sure such issues have a much harder
> time escaping.
>
> References: https://lore.kernel.org/dri-devel/00000000000073db8b061cd43496@google.com/
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

On the other hand pointing it out explicitly doesn't hurts us at all, so 
Reviewed-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   drivers/gpu/drm/drm_mode_config.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 568972258222..37d2e0a4ef4b 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -456,6 +456,8 @@ int drmm_mode_config_init(struct drm_device *dev)
>   		if (ret == -EDEADLK)
>   			ret = drm_modeset_backoff(&modeset_ctx);
>   
> +		might_fault();
> +
>   		ww_acquire_init(&resv_ctx, &reservation_ww_class);
>   		ret = dma_resv_lock(&resv, &resv_ctx);
>   		if (ret == -EDEADLK)

