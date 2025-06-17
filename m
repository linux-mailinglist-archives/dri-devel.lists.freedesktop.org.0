Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED61ADDD35
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 22:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE16610E08A;
	Tue, 17 Jun 2025 20:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dLTt3vjp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2483810E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 20:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDHkN2TR8I1g1In3DAjGZs+qETsS3JDh17AkndzqRKUcrQ23ylLzer+T/pbDCx8NHwICCNlzjH0LezVYLVvgGkwKiaFQErCFtXL1otM1ECFgzFwUEWWd03L4vaisjEqK1rzl65r7FjlgKfHxNZDk1RR+yoeMLVuH+bhlUcIkUnSL9UZd14/O9n339KP4Zmkcc23YFDYnOB4MjjMmIBRexzCbEXoGhE9EEi3WaCpoM4sw9jw9z87l/rsJaOcTs1fLYRIfF1J4ddaV0NqunKQy04JGiHOlzn8z2F6FetBkyq9dQ8Bphu/VAUsW2OSSSEtcbvawqrpRU6BRBnRgei7//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prNlatIEMACcGo0ryPwRvT6qlXjh+xHaN/Etc6eQMdM=;
 b=xLDaGlxiJiVXMjyOG1yYt8uxcpzX7emo3+vWKkV3zbAg23fWI85j9fp1aZGxlQXMwAHRJFlIyBfwECr3/mgTiR8IvxLIrX/0Vc7sneH+L/u43xPyq+kA4nxLNxsHjIrYqPccOl1p5uQvZiqW5Z7VNe9m3WAh58P60zpfBxpquJ+Q89BaWVYBvC0eRzUtVWopKqw4P4sNvStscN05S77wFJaOcHySrvjp3TgW4apkiuB2GTm8Ubq6WdNOy9fLP24rGIxaqtwZd43P/4L6UF34dszVTJV1Fjwebok1MQNvq8uTbRUmMpvt4QnpN9LOhCj3U7SyrVuuDM1klspE5hc8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prNlatIEMACcGo0ryPwRvT6qlXjh+xHaN/Etc6eQMdM=;
 b=dLTt3vjp1+lUqPxRPVYdNIZD9aMcabq3V+Viys1cKXiSxZ57OpkZuMJZt11C5+lQc9CuJ5Z/Ak6GTdFglrnUuBtRmlhicknfBf64wpGIEvWjtUexo82FBom9oabkLOgGVEoFCG2/OvuR8KJbA544nDN7uKEb7R9FX+qG6jpydtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB5952.namprd12.prod.outlook.com (2603:10b6:510:1db::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 20:29:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 20:29:04 +0000
Message-ID: <769a7b54-cc2e-4393-a3f1-24cd807b94d7@amd.com>
Date: Tue, 17 Jun 2025 16:29:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm: Add DRM prime interfaces to reassign GEM handle
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, David.YatSin@amd.com, Chris.Freehill@amd.com,
 Christian.Koenig@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
References: <20250617194536.538681-1-David.Francis@amd.com>
 <20250617194536.538681-2-David.Francis@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20250617194536.538681-2-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::41) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: 82326268-7793-4904-4d99-08ddaddd9a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjFTV3lMS0VVSFcxd0FWNWRVY1MraVR2VG81RlV0dndKejF1Nm9DdWdmc3g2?=
 =?utf-8?B?SGNkZHpCSFMxa0N4WWtNNTU4SW9CVWlqNEh0MjRWMk9EZFR0Z2RBbWtVNjlp?=
 =?utf-8?B?TzJvbGNKcTh4YjBCNVVndy8wdmZUTUdOYW1kS2VZbjdHWG9ZSy8xWDdFTmpS?=
 =?utf-8?B?NFRFYWJSVGlyNHhRcHlKTnlaa3dqWVlqem5pQlo3bVZSRG9WVTBxQnVXaFdy?=
 =?utf-8?B?clBVUWgwck9ZU0dMOUsyakQ4c1RtRDdHK1dSYmlJTWNuYWs2ZkRqWjZpYUc4?=
 =?utf-8?B?NFVSZVFmM0xlQ2dLSXpGTmFMbmNVQWt6clhRTDNiZklnZmw0S2Nma3lFSXFj?=
 =?utf-8?B?dFEwM2VzMHBaWW4vQTdzYytYK09mZFZIQjBRUDZ0UnpLeHRQbVR6SytmNjF0?=
 =?utf-8?B?dUxNSkNSdXdUS0dFVnpBZFRBbTB2YllNRzFEbHRPdlJKTWsvT3prV3lQRVBq?=
 =?utf-8?B?cXZUZFk2VDBxYWdMRE9Mbm4vOWlKSHh5MXNvRCtuZTA0d2MremhuNCtDNlIy?=
 =?utf-8?B?YjlQR2NHQXNuV0EreGN2c1QvMUMzaVgrK3FaRTNYY0xKU2lsY3ZaSzF0Vllj?=
 =?utf-8?B?ZDB2SS9LZ3FmeFl5b1M5TXZrUXFmckk0TkI0WFdjZ3psUnZlbkxoSy9JVjAv?=
 =?utf-8?B?SDAza2xhR0NXSXo2Y2FDYk8zMUcvdXJYekFEREFLWm5xUjZmbjJIalFwdmNR?=
 =?utf-8?B?TmlHKzdtTEZ1dWhyWkw4RUZDM3RheGh6alo4SHp4R2dtcmFkK2NBMkpyMUwx?=
 =?utf-8?B?c0FFZXNDQkl5Mm9jK0lwWGFDK0VCMWdaa2tYek9GNkFvT1c1VkV1czdDQnFt?=
 =?utf-8?B?OHRNT2NRRFFnbDlja3lpK082ZW11WHduL3hnS0l5c0JUMCtORU5FMFBLdnpo?=
 =?utf-8?B?eVNwSVRzekxNWkE2dHA1L1NRYXZqaVVXaDBxdGM5TkVoVWRGaTRvYUZuZGla?=
 =?utf-8?B?SllOR3VNZDlXc3pyTnEvUEQ5SkZRN2NEWEJlcTU4dXZYWVlqSW8wUDN1K0FE?=
 =?utf-8?B?TUhuT2lCYW4ySEFRTVNKS1dKSzNpQ1lPWFQ4MVNWVHBRRmpwZ1Y5ZHBjSXFo?=
 =?utf-8?B?Uk00M1dRU0dpV2dTb21WcVA2Q3FmcFh5R3kyR1dDRitWam1GUWVLMmRseEpy?=
 =?utf-8?B?N0Iwa3VtZTlFT3JtZXpoV2VLbmtIWFh2RTBhRWRReC91aFFNcnRUcGZmVUJ0?=
 =?utf-8?B?dHhkL0RkenVaSmFaU1k2S3JBMk1PM2VFWm5JR1hkdzBoVnZUaEZEZDlab2RS?=
 =?utf-8?B?b3NQakp2RmpDS21ZWmhNS0FucjVLMGlhOHZ6UGQ1UHVrYlRxWVozVGFnNVBX?=
 =?utf-8?B?amRwdCs0RTBMWHF0YTBKUkhtL1Q3TmpoWnRyZVd5bHczdy94ZGVlNlFBT1hj?=
 =?utf-8?B?ZUJhVlFQZ0kzUm03aEYxWVdBSHhKMS9YV2p2ZlZtUzNxQzJpT0RIYkNKNzQw?=
 =?utf-8?B?aGR0NWNXMTlJVTZpM2QzTGhmWEpxaFJ2SEZUcXRLU0FtVjhsK2lWRjBVR3pT?=
 =?utf-8?B?VmpNV09TZWxUaWY1dlBZT0tPWm1EZXRCZlg5MVZSRTBkVnpiSSt4bU5yRnVs?=
 =?utf-8?B?NXBhdzB2c0tOckZBaFUzQkE2ZGVCNnJ6eEw1RnBNZE84TmpabXlycUNWUGFh?=
 =?utf-8?B?MWc2K3lMNmVrWU1VS25aMnFZbHBiajF1S05ScGJMelVIakNWcDRUVjVaS0xy?=
 =?utf-8?B?SXYweklrWXNpVHZKME5NWWFuNHp2ZkY5U1pKbk9DdFUyaXRPdlgwTGhyUXVE?=
 =?utf-8?B?NjRaZkVqcnlySWppR0tFajk5UkJoemUwakRrS0tKbEpRMS85Ykd1U3dCYk9m?=
 =?utf-8?B?ZHNUdStybEFjYkg5YnJCR2ZNMkV5MEhaZTg2TGY1M0hPQ0NtQUZhS0hVelZw?=
 =?utf-8?B?T29kMVovTEdZaG1ZZFYveDdHdGV1a1IySmx6eTZMQlZBUmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVBWNnZNVklJRTNQaDU5NzJDcXd4WFZTUG94NllqbGprY0E2NkJ1VWwrN1Zi?=
 =?utf-8?B?TW96WjNJbkZGamFhbjkxRk9RK2VVVkhzNldySStkNlgwb1BxTjBmeThxYzlU?=
 =?utf-8?B?OWxCeEJzQjNTQTM4eE1xL09mL2xiSWZWWnZPbGhUMytRbmdSRzFNMHNtWVo3?=
 =?utf-8?B?ckIvVytYVUMzYUkwdW1QczN2Q25KbVUya1ZvZjFHL0VZdW5Vb0F2T1oxejRP?=
 =?utf-8?B?WW50Z1VyNHp4UXYvM1NsVFM0UHRsR3N5cjFTV2owbE42NlVlbzBnUkJOOGw5?=
 =?utf-8?B?T2VCYmxCUzVDSnRCc0Q2d0dqTjhyaEo0UUdrMml2N1ZmSlUxUGdNRU1oN0RZ?=
 =?utf-8?B?TE9qR29tbDBFV0J1WXlMTVljaXBNa1VueUpBUEFHTldsd3QyNjBBNWRHL1hP?=
 =?utf-8?B?YjVTYW1DRUlFVE5rcHZIL3d1a2k1MXZnOHZzbWJXd0xWU0N3SldmSHVpa0Zz?=
 =?utf-8?B?OUc5TXhENXNvdDlFTnBrRHV4d0xBWjE5ZmJ4dFp4NklIRXhuN2xicC9QQzVn?=
 =?utf-8?B?dE81ZEcrVmt6YmlxZ0U4ZHhQR2lxc1Vmd1FZb3VGa2w2UVlwNDBmSjNYbXlC?=
 =?utf-8?B?TndkV0Y5bjFJK2hYZEM0TUc2VlFOUEhMRDBjeXF1VitOL2Mxb1pBdlAvd1RP?=
 =?utf-8?B?bDdvZXZkYStIYndVZks2VXViUVUzT2YxNG1HK0RxTHg4dHkvdUh2YjFIUkdj?=
 =?utf-8?B?Y29iOGNhRmZMWjlGenBFTXBnaG5DQkkzN0Fwb25zZWFvRzJKbm1PL3kwdkJj?=
 =?utf-8?B?dUhnYVFtNHNtdCtnWjk2Z0xtM3F3NGpLZkFPUGhDTWNjZlc2cklZdWxqbWlj?=
 =?utf-8?B?VE9xMXBaUyt2SGhUY2N6UkQxVG53K0haQ0NBaU5KRVBScG81bSttbG1WZXNK?=
 =?utf-8?B?dkNmWWllVGNwWG5melhHd0o2L2JmNUJyY0lsanZvOW1abGU3ZnBRYXFjOGV2?=
 =?utf-8?B?NWZIdkRINkpnbUhaZzhMS0QrYWUyWW53aTdZbU8vOEJGYTE1U2QvWER4dmwz?=
 =?utf-8?B?THRPaGhNTkcrYlEvcG90dktVWkorQ2dpSHhpdkREUzlXYVQ2Z3pYU1ZvSG4z?=
 =?utf-8?B?QUF5RkRINmdIRWtiRm9seW9GR2plZ1VWUXBTTTM2SXVyYk54YXJ5KzFYZml6?=
 =?utf-8?B?MGRmS1ROZm5DTnNHNDZtNDdzS25oRHhEa2d3WVpad21PaHJhckZ5UUZUclVy?=
 =?utf-8?B?Q0lDQ1YrRVVlZzI5UnpHMVlLYjVYTk9rREwvMlB6L3I5d0VVSWFhS0xuWDhr?=
 =?utf-8?B?cmVqQzZsY2EwaEtYSUZmem9MdFJaa0tpSWJBTzREd3VCVlpQb3crbUZUdDdS?=
 =?utf-8?B?L3U1Zml0aDZQR2tuUDV1ODg0K1MrTEQ4TktVWHdRcVFQbG41WHlmTGd5N3hT?=
 =?utf-8?B?QkVEY3phMFJLQ09vdmNVRlJ2M2R0dDhISFN0Zk1CSzUrWis5VElUdmpZTUEv?=
 =?utf-8?B?d2VKQ2pEM3p1NXBOMW5oK3hMUzZkYmVxcnNmMVBpMDZ5NzhxcVd5bjY3VHY1?=
 =?utf-8?B?RmpqclBpTklCYk5CaVRJN2dqVzZaR0NLaEdsaDc1UzIwN04yZWZlYjN0U0tI?=
 =?utf-8?B?ME0vYlNrNmVpMGdHZWRUOEtVZnZvd1RZbkI2RFdpR2VNSXFyRnk4aXBBVW9p?=
 =?utf-8?B?MlBpWGxId0V1KytNL3pPVjVzb05ZOUVrYTdyY2pnVFR3UFZjZVpybXFUTzZz?=
 =?utf-8?B?RUpuVnRhN0w5dnNnWUR6bDdmd293R3NnZnNlSEZOMlNLTmx5KzRUenpVa1o2?=
 =?utf-8?B?dlBKUmxlVlFhclRSRXpEOUhlMEZOcnRqbGhpb1dSaEpZNEJrRWlsWXh6OEUw?=
 =?utf-8?B?OVpSYVJ2WXQ1Uld6RnRaUFIyc0lOQzcxSmR6dmlQN05Kck5KM0ZTdUx0UXB3?=
 =?utf-8?B?UlhEZFRKeWhjVTFvcnhNSlJ1STJSYjBoY0M1UE1hNHhESkxjREIzK1VXR2g4?=
 =?utf-8?B?Z2Q5NzVxVGtZZDYrUXpkOWEzUVRNZFV2TFFkUTk5WkNkeUtMU3BEQy84NGU4?=
 =?utf-8?B?cWVhQ2ZpcGl0blJEaXlDd2lwUXdON3VXRDlXZUZLV3ZDR0Q2Um1GT2x0K2Js?=
 =?utf-8?B?MDE0YVpVN2V1dXYyVEZFbE9IL2kxZ0w2WmtEdW1Rc0tsZ29tVFpXSXVFRVZ6?=
 =?utf-8?Q?IofLgLxx87RMJK4rb1celthcI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82326268-7793-4904-4d99-08ddaddd9a44
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:29:04.5523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Os5MPWulbjy8FLpSnwVKV0EwkqAdy8xWzl90CDtm2fnoH+bKKKW7zZpxqwYsIc+RWYpvFMy5RwqxeNye8hJV/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5952
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

On 2025-06-17 15:45, David Francis wrote:
> CRIU restore of drm buffer objects requires the ability to create
> or import a buffer object with a specific gem handle.
>
> Add new drm ioctl DRM_IOCTL_GEM_CHANGE_HANDLE, which takes
> the gem handle of an object and moves that object to a
> specified new gem handle.
>
> This ioctl needs to call drm_prime_remove_buf_handle,
> but that function acquires the prime lock, which the ioctl
> needs to hold for other purposes.
>
> Make drm_prime_remove_buf_handle not acquire the prime lock,
> and change its other caller to reflect this.
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>   drivers/gpu/drm/drm_gem.c      | 58 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_internal.h |  4 +++
>   drivers/gpu/drm/drm_ioctl.c    |  1 +
>   drivers/gpu/drm/drm_prime.c    |  6 +---
>   include/uapi/drm/drm.h         | 17 ++++++++++
>   5 files changed, 81 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c6240bab3fa5..631cbf9e1e2b 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -282,7 +282,12 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>   	if (obj->funcs->close)
>   		obj->funcs->close(obj, file_priv);
>   
> +	mutex_lock(&file_priv->prime.lock);
> +
>   	drm_prime_remove_buf_handle(&file_priv->prime, id);
> +
> +	mutex_unlock(&file_priv->prime.lock);
> +
>   	drm_vma_node_revoke(&obj->vma_node, file_priv);
>   
>   	drm_gem_object_handle_put_unlocked(obj);
> @@ -888,6 +893,59 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>   	return ret;
>   }
>   
> +/**
> + * drm_gem_open_ioctl - implementation of the GEM_CHANGE_HANDLE ioctl

Update the function name.


> + * @dev: drm_device
> + * @data: ioctl data
> + * @file_priv: drm file-private structure
> + *
> + * Change the handle of a GEM object to the specified one.
> + * The new handle must be unused. On success the old handle is closed
> + * and all further IOCTL should refer to the new handle only.
> + * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
> + */
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv)
> +{
> +	struct drm_gem_change_handle *args = data;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	obj = drm_gem_object_lookup(file_priv, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->handle == args->new_handle)
> +		return 0;
> +
> +	mutex_lock(&file_priv->prime.lock);
> +	spin_lock(&file_priv->table_lock);
> +
> +	ret = idr_alloc(&file_priv->object_idr, obj, args->new_handle, args->new_handle + 1, GFP_NOWAIT);
> +	if (ret < 0)
> +		goto out_unlock_table;

You can move the return-value-check to after the spin-unlock to simplify 
the error handling.


> +
> +	spin_unlock(&file_priv->table_lock);
> +
> +	if (obj->dma_buf) {
> +		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
> +		if (ret < 0)
> +			goto out_unlock_prime;

Don't you need to idr_remove the new handle here to avoid leaking it? 
Maybe just let it fall through and make the idr_remove below conditional 
to remove the old or new handle depending on the value of ret.

Regards,
   Felix


> +
> +		drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
> +	}
> +
> +	spin_lock(&file_priv->table_lock);
> +	idr_remove(&file_priv->object_idr, args->handle);
> +
> +out_unlock_table:
> +	spin_unlock(&file_priv->table_lock);
> +out_unlock_prime:
> +	mutex_unlock(&file_priv->prime.lock);
> +
> +	return ret;
> +}
> +
>   /**
>    * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
>    * @dev: drm_device
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..e9d5cdf7e033 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -85,6 +85,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>   
>   void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>   void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +			     struct dma_buf *dma_buf, uint32_t handle);
>   void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>   				 uint32_t handle);
>   
> @@ -168,6 +170,8 @@ int drm_gem_close_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file_priv);
>   int drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file_priv);
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv);
>   int drm_gem_open_ioctl(struct drm_device *dev, void *data,
>   		       struct drm_file *file_priv);
>   void drm_gem_open(struct drm_device *dev, struct drm_file *file_private);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f593dc569d31..d8a24875a7ba 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -653,6 +653,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>   	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, drm_gem_close_ioctl, DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_GEM_FLINK, drm_gem_flink_ioctl, DRM_AUTH),
>   	DRM_IOCTL_DEF(DRM_IOCTL_GEM_OPEN, drm_gem_open_ioctl, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CHANGE_HANDLE, drm_gem_change_handle_ioctl, DRM_RENDER_ALLOW),
>   
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETRESOURCES, drm_mode_getresources, 0),
>   
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index bdb51c8f262e..1f2e858e5000 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -93,7 +93,7 @@ struct drm_prime_member {
>   	struct rb_node handle_rb;
>   };
>   
> -static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>   				    struct dma_buf *dma_buf, uint32_t handle)
>   {
>   	struct drm_prime_member *member;
> @@ -190,8 +190,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>   {
>   	struct rb_node *rb;
>   
> -	mutex_lock(&prime_fpriv->lock);
> -
>   	rb = prime_fpriv->handles.rb_node;
>   	while (rb) {
>   		struct drm_prime_member *member;
> @@ -210,8 +208,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>   			rb = rb->rb_left;
>   		}
>   	}
> -
> -	mutex_unlock(&prime_fpriv->lock);
>   }
>   
>   void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..84c819c171d2 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -625,6 +625,15 @@ struct drm_gem_open {
>   	__u64 size;
>   };
>   
> +/* DRM_IOCTL_GEM_CHANGE_HANDLE ioctl argument type */
> +struct drm_gem_change_handle {
> +	/** Current handle of object */
> +	__u32 handle;
> +
> +	/** Handle to change that object to */
> +	__u32 new_handle;
> +};
> +
>   /**
>    * DRM_CAP_DUMB_BUFFER
>    *
> @@ -1305,6 +1314,14 @@ extern "C" {
>    */
>   #define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
>   
> +/**
> + * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
> + *
> + * Some applications (notably CRIU) need objects to have specific gem handles.
> + * This ioctl changes the object at one gem handle to use a new gem handle.
> + */
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
> +
>   /*
>    * Device specific ioctls should only be in their respective headers
>    * The device specific ioctl range is from 0x40 to 0x9f.
