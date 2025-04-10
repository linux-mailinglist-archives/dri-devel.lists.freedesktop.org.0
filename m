Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00862A8446F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00410E9B6;
	Thu, 10 Apr 2025 13:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jF/YFLVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048EE10E9AC;
 Thu, 10 Apr 2025 13:16:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPeK57BVrfWc8VswZM9ml3aHti0Y4O9Mb0D8wicho1+1U4g4PVisDvhuOuv09ifzuh20iZAQlMAZgSAiTTJmDmqH41jzrHKXQkFAictEhIWCx2TnqKWRp8Ofo6F47773RDdXTBetkqiVHAKmKvT0aXO8a7KI8gQld1g8gpfDzlNO2/IitusujWt9NKKOL4hW+zoMBCmFkHrKxqfhT2ny91m0BSKfzRhgtH1n4jUpiW0c1KwO11KWQbL9XtNwBwrUumPEIU9mSh+DtEHGwzFT00LyjSH8DcmzprmMIY7dS5MwgyS+2svisfCXbJ+xb4dLQpkWCZIDBy+NpswY3t5B/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcf4RDrAGCSBnRefF597cYmJ3PbYb3Pe4imzdPX6TkE=;
 b=YCfn9hETjvwO/8WZ0zpV8sF9SSPhvGG3HQOkDKjQGchqzfQfQ/yAnY5vlOe+5dEY3VtlenIvEG3QiRIH45piOCJ3SroIPZFbESilKz2IXvRPjfJpeTFoJ8hC5u6yyIlpUqm3In9TA8ewxINC2CP7exuLo97LqeRPyRkckPhmt+65JduA5G2CDVSkRf6beaXr9X/TVrkYQ9KRmg7JHYO9NAEw3lMYgW1nutJJmhxKXWSMsRXDanFpW87LFuAcl7A5o8F8lcEu3sPeybYDuk9oD1vCkCbhsPU5m4Oe+kMMKfzKeYfwyLRXkGGWITBQkB05oR0il6mpQHxXkX+wrzx6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcf4RDrAGCSBnRefF597cYmJ3PbYb3Pe4imzdPX6TkE=;
 b=jF/YFLVZaAn56hLQHBqGq+c8LQH9YwOW/DUsyPwY55/ep7cbZLnTIGwd33UBzU+MYTEtvM81N1cx2/R9ihtYGPj7uaUDYdBYe+lcr/v1gvjsksM5Uac80kcsPf/StQLwmZ6vjQ0sbxBnEGn/j6DGOCaQRi51TViZ52pqcipEwCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 13:16:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 13:16:45 +0000
Content-Type: multipart/mixed; boundary="------------LM0DXO0z16PvcEfueyc1v2b3"
Message-ID: <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
Date: Thu, 10 Apr 2025 15:16:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
 <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
X-ClientProxiedBy: FR4P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a17d161-e6a3-433b-a195-08dd7831f107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|4053099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajhZSHpZNkhoWnRTK2FzeXRIRVlnVkt6OGNyV2RzQ0JYT0pwUjFKNit3THdw?=
 =?utf-8?B?SURMemRoK25pVlhxN3BKZGhlQ1FvQ1ovSjBOSCtDb1JnSm1rOXRHb1IxZGFY?=
 =?utf-8?B?a2RQTmVQc29BV2E0WmdETTFXRHdvTTBucmUzcGFRWGdySGpsRHNyZDRFZG10?=
 =?utf-8?B?aGFEb1cxbStYTXF4bktIUTg0VXdrK1R1d25RWHdpd3pPcFl1UEhBSVF4cE5L?=
 =?utf-8?B?akVEQ29YZXFJSy9wck8waFRyamVzY1E5UjN0cmxtL0dHOGZvcXhyRlcraFpH?=
 =?utf-8?B?RHZBN2h2K0QxNWJSM2h1NDBBeUdqdVdQN0hxeWZzWGMyUzk0cS90S09RNGNR?=
 =?utf-8?B?a3pxRmNJMVZFWWtKNEJzZzJxemtkWGN5OGRmL2l6ZTNqMjRleXZ2aWp2VXVk?=
 =?utf-8?B?V0ZUWGdjQ0xZenJXQmlsL3RMblpwcUoxWEpyQzJ3N0dEYktoL1l1MWdvMVo3?=
 =?utf-8?B?MjZ4ckVud0dZQWpMdHUxQ05tanVZc0FJZGw0Qk9IeGx6N3RrS2Eyd2M3d2Mv?=
 =?utf-8?B?aXU5a2F1M3FFSkpHQ1hmVXpDQUxnNTczdk5qQVA5VFhadHhqdmwvUVZxb3FW?=
 =?utf-8?B?ZzVoL2lZQURDUkRsajl5TlgvS2lDS1c5aFBEckQvWlUyVG9RK01nbGhxa216?=
 =?utf-8?B?cW9NUmNoNXZlbVh4cGlDVkFkTzM4UW5SYUlLS3pnY0kzb3lHSjNRYmpqY20z?=
 =?utf-8?B?Y1lDRkdxV0hBdFJoK1BUbDFzMXNnc2ZjRnE2ZFJkYTg4Nm05dFpNVGdTNXhu?=
 =?utf-8?B?cFhxMzRWOFdCNXp5dmxnaHpqREVtMU5CZHcvREJVcktaNHBpelgvd0l4b3A1?=
 =?utf-8?B?Ukl0TzBkdSswbnVBcldSUjZoMC9ucTQ0cStMeC9HS1k0YkJrcit4RksvbGhn?=
 =?utf-8?B?cmtTOWZadjZZdXM4UGNoenREYzVMMWgwRFZOWjhkMEVhQ0FLK2dMbENhaHVu?=
 =?utf-8?B?Z2ZibkVOOHQ4Mm5NMUVZVjBqbUplekFJMitkWDc3OGFlUXcxMTdYbFoxUXFv?=
 =?utf-8?B?ejJyeWlRWHlhSHQvc0VZYmlWTFhoWVY2eUxTQVZPOTZlckhJalViOXRyb0ts?=
 =?utf-8?B?WlhJYTBreHhBL25sZUlEZ1Nva0VaV2JtM2d4KzgxT1NvOFdYYWR1V0FJQW9k?=
 =?utf-8?B?SlNxb3JJUTJhUHpCR2RhZVo2bVBOZVF1NGwrY3RDNXFYV0s5bCt3SlZ1NU90?=
 =?utf-8?B?cWVrVXNZN3ZCbElHOWZYQ256cHFHK3R4YnZ3TThTYTI4cGt6NFVtbzFCbFp1?=
 =?utf-8?B?R0hPaUJIeFpNYW1uZENLRlA5dTlTOXhpT2E2OCtuanRQVXZla21nQlVMaE9S?=
 =?utf-8?B?NHoxU3hyaHc5aTVzT1drSjhsWER0ci95T3N1cTJFbEs0TW9lTHA2aE8rVlI5?=
 =?utf-8?B?NmpSa3ZuT2VjeENZdHdYL0ZKQ1pyNGgreFFUWjVvUmJkYlpwTFp2UEI2dnFM?=
 =?utf-8?B?cDZERmVSSkUzZXh1dmFsbHRzb2F2RlVxTGVEZmJROEMwbzNuWHVuUjdpTE9C?=
 =?utf-8?B?WHJ4SXJCMWxXZXdyNTRuQnR3R2VTODRGUXdSV1d2REZyK1loVDFDd0dKa01i?=
 =?utf-8?B?bWFMaEdLWWUxYUVnTWpBZUhFVG9YZFlodGNVM0lJWFIwUGFHbnhPZnhEc3dm?=
 =?utf-8?B?czFvaytPSGdkL2J6S2VHbkxGKzNSVjdsMEVQM1lGVE1zTHVQQTV6U3FtRTYw?=
 =?utf-8?B?Sm5LUjNhWGc2TEJUenBJZ2JISm1KVGVQU3Q2RHVKOUI1UjUzb3hyeWIrTjFY?=
 =?utf-8?B?RlBNeXJ5dmdEVzNOVnIvTmErd3ZNYzhiZUxNVnMwWFhQUVUyek9ib0tCbTYr?=
 =?utf-8?B?MktJNE1PSlpHMVRKSDhXbm1XTmdRVFF4NWluZVZEVUFvU2NhdldVejRtMVMw?=
 =?utf-8?Q?HpS0qzQnuGSyk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4053099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmx4Ujk5UUcvbDUrOG15ZXdFNitFQkpiaWxwYXB4OVNqUEZJdnF2UktzZVIz?=
 =?utf-8?B?MGhaUEhycjlaNXFna1RLb2szSy9yZ1FYUUN1UXB2NTcvazN5V1VPY1pWR0Ix?=
 =?utf-8?B?VVREMzFCTCs0cURoOVhHc1U2SFpFeVl5cTExMWRvREpkWVJqWEkrcTBtU3Ez?=
 =?utf-8?B?SnFjWFNCclFBVkF4M09HMHlYaVUrQjRKaEpzcUpRUU90NnRvREVmVlRob3Fo?=
 =?utf-8?B?bFRHWC9TL2c4L3laMVJNMk03RDh1RTZ4Z1VuRFlxRExETXhWY3Jnb0hKZkww?=
 =?utf-8?B?OGpBMVNsY0lUb1JWc2ovL0V5YXllUUYvWXh3NWE0TnlBUGt6d29LZXpZdUFl?=
 =?utf-8?B?QWVObE0vWkxiWVVTWVJDeFZyaUR5aUJJNnE4Z0ZibzI1cUFuWWVEMFVFZ3Az?=
 =?utf-8?B?K2FYTTVHazBwQ21KbUdYQ2JsVUUwdXZvRVZBNDIvZEtmWUJlYkdGQ2x3ZmdB?=
 =?utf-8?B?bjEydjNXSVgvSVZiMVhlZnJOMUE2a1JOVWdDd0k1b2F0Q2I5OFU3WHBsTEtK?=
 =?utf-8?B?R2Y0VDVERmlCVjdQdXVZR3VMelY0bFN5ZzdpcXRNeHFhL0diZkJKL0VpWGVW?=
 =?utf-8?B?bXQ1NzFjTnZRTUpYZWxDYkZKMmRyekM4OFVqaEpnSkpZTjAzM0d6ZVg1YXVj?=
 =?utf-8?B?NzM2NmdudU0wZHEwTjZJNTNRVGtud2dzMFkxOFNtV3B1QUNtaTF0ZXE3VnR5?=
 =?utf-8?B?NWJpTkdUZUdmNWNXL3VPZjRZb1owc3Q3VjVoZmRVblJucHNCRlNNdDVPT3d4?=
 =?utf-8?B?RUlLRm10UWdhMTA4d0c2a0FaOGUrd1NDc0JQb00xd3FWenZvekNENTY5QWIw?=
 =?utf-8?B?NnA2YlkybzF3OEJFMjV6SE85OXVobmY1VzlDSmgxQldlWXFSYVhoMVhGdnZB?=
 =?utf-8?B?KzlYZjVybXRoL3hjcmxNekpGYUsydFFNUkIyTTN0bzVUN29LeDBkRDM3V3dK?=
 =?utf-8?B?emhRT0V0Vkx4YXQrb1FheGRGMVEzZlJ1RlBlL3UyQnZqRjgwcjVKaGNDVGNN?=
 =?utf-8?B?Tjc5OXNqZ29pdW56YXBrQjJEeE5zbUFGbG1pd01JWUQ2QzVJL2VEZy90b1VZ?=
 =?utf-8?B?L3owR1ViNnpUSU5wZUdkQjFITDhITFpDQm1aOVV4ZndpcGhIRFFGZmh4WkJt?=
 =?utf-8?B?NUlpOGc5TFdmTmc4VHR6RWlwNjJwQndXTE42MXBuMVV6Qi9VcCt2WFp0WjJ3?=
 =?utf-8?B?ZTZzb01MaVNhQ08wS0xuQzE3eisxUUI2VmEwRHVQeEdhVGZLWndEeGcremRj?=
 =?utf-8?B?TDVnb2NGZE1rOFBLeE9ENzlvdnZXcW5nMWNIYTY0Qy8vcnF1WmVSZmhxNVgz?=
 =?utf-8?B?RXF6TU9oelhTWEVyc3k5V2lWdjdtYnRJdEtQMG1Tb1JBb1psS0NQTjRaZFQ0?=
 =?utf-8?B?andhejFvZUE1NGcwYXNocG9nVU5qcnY3ZE1IZ3dlUDJiaWRWTXZKVTN6MC95?=
 =?utf-8?B?dU1TWHhPTmx4NktHTDkxMlRtQXZ5ekxWUkpldTVXaFE0RHBqRGUrR2I1OGxw?=
 =?utf-8?B?L1JFcUtIR0o3cGQ0YXUyR29FeGdKc0duMHl1THVNTVlrU21pMDM2S0dVdGxY?=
 =?utf-8?B?dHdCNnoreHJPcXJxbWQrOVE4aWJOL3pDcGNpYThZVWxvc215MEZ5R0Vod2s2?=
 =?utf-8?B?c2t2NTNpVlhTaTluQ0I1VnRrWTdGS0V1NHcxa0hTQWpQWEs5c20rWE9POGVs?=
 =?utf-8?B?amY0M2ZCdWpaU2x0Q1lMem1oc2JWR28vY2Z0d1ErQmh5WXk4SjE4ck91eGNz?=
 =?utf-8?B?RW9FRnljN2M4NHJCdWJqRUNiRzlGMGFTRWNsUDdNbkUzaWJvK3l0aEF1aXlQ?=
 =?utf-8?B?WWYweHNBai80eFB5V0k4SE05Y0dVRzF1S2ZXR3dwVjhTWHhuUlRiM21ZYWxF?=
 =?utf-8?B?bmtPZ2xsWEpXWkM2TjZwLzdjZFROQWFiQ3UrUU5NNkUxMnYxTjl3UEZVS1BL?=
 =?utf-8?B?d25IREdGS1BBL0s1MHloNmdCaERVeTErbVppU3dJbkJlY1FJUjJ3MEtKZkhi?=
 =?utf-8?B?akltcUtkQ2swcDk4UnNQbjlmMVV6bk9rUXZJcTUzT1cvWk8wL1pDcHJVZmwz?=
 =?utf-8?B?Sm9rRjZlQ01sWTM1OW1NbUVYM3VOeXNMVVQvM21VVzJQaStVbG5WZm5hUmhs?=
 =?utf-8?Q?NzXwF2HsJeGEpPNP/mNZvpJUk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a17d161-e6a3-433b-a195-08dd7831f107
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:16:45.2537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1neUqPFKTJoZqRHLBGZ5FHNhAUbsyfMFzDQj/6CK1p+vEkYaovI3oWH1H7QN6jF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
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

--------------LM0DXO0z16PvcEfueyc1v2b3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 10.04.25 um 15:09 schrieb Philipp Stanner:
> On Thu, 2025-04-10 at 14:58 +0200, Christian König wrote:
>> Am 10.04.25 um 11:24 schrieb Philipp Stanner:
>>> Nouveau currently relies on the assumption that dma_fences will
>>> only
>>> ever get signaled through nouveau_fence_signal(), which takes care
>>> of
>>> removing a signaled fence from the list nouveau_fence_chan.pending.
>>>
>>> This self-imposed rule is violated in nouveau_fence_done(), where
>>> dma_fence_is_signaled() (somewhat surprisingly, considering its
>>> name)
>>> can signal the fence without removing it from the list. This
>>> enables
>>> accesses to already signaled fences through the list, which is a
>>> bug.
>>>
>>> In particular, it can race with nouveau_fence_context_kill(), which
>>> would then attempt to set an error code on an already signaled
>>> fence,
>>> which is illegal.
>>>
>>> In nouveau_fence_done(), the call to nouveau_fence_update() already
>>> ensures to signal all ready fences. Thus, the signaling potentially
>>> performed by dma_fence_is_signaled() is actually not necessary.
>> Ah, I now got what you are trying to do here! But that won't help.
>>
>> The problem is it is perfectly valid for somebody external (e.g.
>> other driver, TTM etc...) to call dma_fence_is_signaled() on a
>> nouveau fence.
>>
>> This will then in turn still signal the fence and leave it on the
>> pending list and creating the problem you have.
> Good to hear – precisely that then is the use case for a dma_fence
> callback! ^_^ It guarantees that, no matter who signals a fence, no
> matter at what place, a certain action will always be performed.
>
> I can't think of any other mechanism which could guarantee that a
> signaled fence immediately gets removed from nouveau's pending list,
> other than the callbacks.
>
> But seriously, I don't think that anyone does this currently, nor do I
> think that anyone could get away with doing it without the entire
> computer burning down.

Yeah, I don't think that this is possible at the moment.

When you do stuff like that from the provider side you will always run into lifetime issues because in the signaling from interrupt case you then drop the last reference before the signaling is completed.

How about the attached (not even compile tested) patch? I think it should fix the issue.

Regards,
Christian.

>
> P.
>
>
>
>> Regards,
>> Christian.
>>
>>> Replace the call to dma_fence_is_signaled() with
>>> nouveau_fence_base_is_signaled().
>>>
>>> Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be
>>> determined
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> index 7cc84472cece..33535987d8ed 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> @@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
>>>  			nvif_event_block(&fctx->event);
>>>  		spin_unlock_irqrestore(&fctx->lock, flags);
>>>  	}
>>> -	return dma_fence_is_signaled(&fence->base);
>>> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
>>>> base.flags);
>>>  }
>>>  
>>>  static long

--------------LM0DXO0z16PvcEfueyc1v2b3
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-nouveau-fix-and-cleanup-fence-handling.patch"
Content-Disposition: attachment;
 filename="0001-drm-nouveau-fix-and-cleanup-fence-handling.patch"
Content-Transfer-Encoding: base64

RnJvbSAxNjVkZjM2YjYwM2IzN2Y2ZjE3ODVjZTM1OWY3Y2QxODRkYjYyMTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Q2hyaXN0aWFuPTIwSz1DMz1CNm5pZz89IDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkRhdGU6IFRodSwgMTAgQXByIDIwMjUgMTA6MTg6Mjkg
KzAyMDAKU3ViamVjdDogW1BBVENIXSBkcm0vbm91dmVhdTogZml4IGFuZCBjbGVhbnVwIGZlbmNl
IGhhbmRsaW5nCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpUaGUgZmVuY2Ugd2Fz
IG5vdCByZW1vdmVkIGZyb20gdGhlIHBlbmRpbmcgbGlzdCB3aGVuIHNpZ25hbGVkIGZyb20gdGhl
Ci5zaWduYWxlZCBjYWxsYmFjay4gRml4IHRoYXQgYW5kIGFsc28gcmVtb3ZlIHRoZSBzdXBlcmZs
b3VzCi5lbmFibGVfc2lnbmFsaW5nIGNhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZmVuY2UuYyB8IDMxICsrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmVuY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZmVuY2UuYwppbmRleCA3Y2M4NDQ3MmNlY2UuLjUzYzcwZGRl
Zjk2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9mZW5jZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmVuY2UuYwpAQCAtNDg1LDMy
ICs0ODUsMTggQEAgc3RhdGljIGJvb2wgbm91dmVhdV9mZW5jZV9pc19zaWduYWxlZChzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmKQogCQlyZXQgPSAoaW50KShmY3R4LT5yZWFkKGNoYW4pIC0gZmVuY2UtPmJh
c2Uuc2Vxbm8pID49IDA7CiAJcmN1X3JlYWRfdW5sb2NrKCk7CiAKLQlyZXR1cm4gcmV0OwotfQot
Ci1zdGF0aWMgYm9vbCBub3V2ZWF1X2ZlbmNlX25vX3NpZ25hbGluZyhzdHJ1Y3QgZG1hX2ZlbmNl
ICpmKQotewotCXN0cnVjdCBub3V2ZWF1X2ZlbmNlICpmZW5jZSA9IGZyb21fZmVuY2UoZik7Ci0K
LQkvKgotCSAqIGNhbGxlciBzaG91bGQgaGF2ZSBhIHJlZmVyZW5jZSBvbiB0aGUgZmVuY2UsCi0J
ICogZWxzZSBmZW5jZSBjb3VsZCBnZXQgZnJlZWQgaGVyZQotCSAqLwotCVdBUk5fT04oa3JlZl9y
ZWFkKCZmZW5jZS0+YmFzZS5yZWZjb3VudCkgPD0gMSk7CisJaWYgKHJldCkgeworCQkvKgorCQkg
KiBjYWxsZXIgc2hvdWxkIGhhdmUgYSByZWZlcmVuY2Ugb24gdGhlIGZlbmNlLAorCQkgKiBlbHNl
IGZlbmNlIGNvdWxkIGdldCBmcmVlZCBoZXJlCisJCSAqLworCQlXQVJOX09OKGtyZWZfcmVhZCgm
ZmVuY2UtPmJhc2UucmVmY291bnQpIDw9IDEpOwogCi0JLyoKLQkgKiBUaGlzIG5lZWRzIHVldmVu
dHMgdG8gd29yayBjb3JyZWN0bHksIGJ1dCBkbWFfZmVuY2VfYWRkX2NhbGxiYWNrIHJlbGllcyBv
bgotCSAqIGJlaW5nIGFibGUgdG8gZW5hYmxlIHNpZ25hbGluZy4gSXQgd2lsbCBzdGlsbCBnZXQg
c2lnbmFsZWQgZXZlbnR1YWxseSwKLQkgKiBqdXN0IG5vdCByaWdodCBhd2F5LgotCSAqLwotCWlm
IChub3V2ZWF1X2ZlbmNlX2lzX3NpZ25hbGVkKGYpKSB7CiAJCWxpc3RfZGVsKCZmZW5jZS0+aGVh
ZCk7Ci0KIAkJZG1hX2ZlbmNlX3B1dCgmZmVuY2UtPmJhc2UpOwotCQlyZXR1cm4gZmFsc2U7CiAJ
fQogCi0JcmV0dXJuIHRydWU7CisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIHZvaWQgbm91dmVh
dV9mZW5jZV9yZWxlYXNlKHN0cnVjdCBkbWFfZmVuY2UgKmYpCkBAIC01MjUsNyArNTExLDYgQEAg
c3RhdGljIHZvaWQgbm91dmVhdV9mZW5jZV9yZWxlYXNlKHN0cnVjdCBkbWFfZmVuY2UgKmYpCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgbm91dmVhdV9mZW5jZV9vcHNfbGVnYWN5
ID0gewogCS5nZXRfZHJpdmVyX25hbWUgPSBub3V2ZWF1X2ZlbmNlX2dldF9nZXRfZHJpdmVyX25h
bWUsCiAJLmdldF90aW1lbGluZV9uYW1lID0gbm91dmVhdV9mZW5jZV9nZXRfdGltZWxpbmVfbmFt
ZSwKLQkuZW5hYmxlX3NpZ25hbGluZyA9IG5vdXZlYXVfZmVuY2Vfbm9fc2lnbmFsaW5nLAogCS5z
aWduYWxlZCA9IG5vdXZlYXVfZmVuY2VfaXNfc2lnbmFsZWQsCiAJLndhaXQgPSBub3V2ZWF1X2Zl
bmNlX3dhaXRfbGVnYWN5LAogCS5yZWxlYXNlID0gbm91dmVhdV9mZW5jZV9yZWxlYXNlCkBAIC01
NDAsNyArNTI1LDcgQEAgc3RhdGljIGJvb2wgbm91dmVhdV9mZW5jZV9lbmFibGVfc2lnbmFsaW5n
KHN0cnVjdCBkbWFfZmVuY2UgKmYpCiAJaWYgKCFmY3R4LT5ub3RpZnlfcmVmKyspCiAJCW52aWZf
ZXZlbnRfYWxsb3coJmZjdHgtPmV2ZW50KTsKIAotCXJldCA9IG5vdXZlYXVfZmVuY2Vfbm9fc2ln
bmFsaW5nKGYpOworCXJldCA9IG5vdXZlYXVfZmVuY2VfaXNfc2lnbmFsZWQoZik7CiAJaWYgKHJl
dCkKIAkJc2V0X2JpdChETUFfRkVOQ0VfRkxBR19VU0VSX0JJVFMsICZmZW5jZS0+YmFzZS5mbGFn
cyk7CiAJZWxzZSBpZiAoIS0tZmN0eC0+bm90aWZ5X3JlZikKLS0gCjIuMzQuMQoK

--------------LM0DXO0z16PvcEfueyc1v2b3--
