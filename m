Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCbCHbX6jGn5wQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:55:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F8127EB0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E951410E661;
	Wed, 11 Feb 2026 21:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JjrnLtnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B212D10E661
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 21:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqKwdqP+/MnYv/JWTuDIDHYBxT7u1GjP1N3hu0h5Uh+yFs77yNHzpandE7re88MFH/ZRMMWsgcXygPO3/QIvZ9gPS8PNda5kr2bZLZcGt01fT1S8Co6AUp/dKvAbszSnRFRqRed+Fnzo614EPDUDA1G62bm3lNgwmvV93gOKYEpxqawPvxabB15xWjF6h7LawWplHfeO2RYrR+oVs84pDRPmZGtqTBqbxNKuqv6ITfDa8ih8dFF25vkeNeU4Dj1jYdl8e0ZC5uNB9OJzGoZO5XmPPEUF+57KRi3ZHMzZQNPnXzNC6xuenTJ9Odo3TgQSAOdhmKKbMLcHZeumPKIP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YF0hNASnwRJPqWOTLE60Echy0IexCYSkVjF/cdFts+E=;
 b=HWjF/6g4n7gfwgpVsrT901+4Dv/owXPrYHWNe4ec7B5h9GWhYlFfsFmHfnR4/SM4VONwlqPmA6JjOGP7RsmTGQdTNcLTMT9lNOe6WXmpA68vq5ycxmH3nqBHRRYg8LN2/wk+gSlM+nC+Vx//0zjzp2eXafXJKE59KKvzdrMnG4C46jEbVwrRv4C8RbITD6ThY+LAyV0j+NA2ZEEU6zFUZ/RKQENpgi0QjUEFV9SIb5GAFg2NEhhfCBOtNQ5LhmypbsN1GpWgvThJkd9s9o5lPmstsWsjB62EqdC04cl2RwSkA9JHCkYYg7kMFHfH8B4Y0HfpIbqJAHkSiOrlPlCXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YF0hNASnwRJPqWOTLE60Echy0IexCYSkVjF/cdFts+E=;
 b=JjrnLtnvLtkTWw8c3ANTl109hH3xhMHIS3X2PmcmIBWioC/QulctOomDOPDqEbo1gWdZkjRU731zWLEhLj0avAXFCWBwPhXecTOqYKsmeLeSu55Mq9u8zJNZUlMwesnn3MAGPVBDXTkPSQv5lvWAGXHHbpGR32AlTkVwtmGXj98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:54:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 21:54:55 +0000
Message-ID: <5fae036f-1ce6-4276-9376-b26209d2a67f@amd.com>
Date: Wed, 11 Feb 2026 15:54:49 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Fix dead lock for suspend and resume
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260211204644.722758-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260211204644.722758-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0051.namprd16.prod.outlook.com
 (2603:10b6:805:ca::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: a573aba1-f14f-4c68-f1c0-08de69b83119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDcvWmFVamY4TWxLeUZMdFNoNHVIT0ZMdWNRRTVRYU8vdzhnd1cyR0lmb0Vn?=
 =?utf-8?B?WC9QOXROME5XSHFYNW10THBFeXduYWtMc0U0TmRadktMMHBzVTZuanVuVytV?=
 =?utf-8?B?TWhyTWZuaHNjS1FWUXZ2cDdBaHdqbGdrUVozUUJNdS9TSEpsenVvMjgzZ0kr?=
 =?utf-8?B?MVE1RURnLzZxVmFNZWpxcXc4eHBHU2pOQ2JCeTY0bDY0cWZHaUtyc0NyUW50?=
 =?utf-8?B?Y05rd0NwUWMvNUFiTXlEMExVaGxOdE1Pcm1UWXVpMnZOQ3ltaU5KWXBuM1Zl?=
 =?utf-8?B?RXdpWHVCVGhKMlZZWG4yY2gxd2V1eVpSdGhUU2s1TGdPdjAwT25OZVBYL3pj?=
 =?utf-8?B?MU9NYkZpRjZqSUxMVVlValJQa084aFE3UXdQTWYxeFZJZUQ1RHBZam8zZmc2?=
 =?utf-8?B?UkxYVWVBR1Z5elNWR0pkcFltUXNqdVVPdlNpd0dxaW1SSUd2VXZISG5Tanlt?=
 =?utf-8?B?alcvMTVFbEU3S2krWTdpelJHMHhNRVRWNDVERms4RFBRTFpsd0NBMFlZdVdt?=
 =?utf-8?B?elN3NmxiMjFjeU4vd3FFSGVSbUd1QmRkZUl5QkF6SExKcVlkaEMzbGNmZVc2?=
 =?utf-8?B?aFEzSGo2VkdMQzh2S2xwWUpyV0tPWU5LbW5uTVVFQVNuOTNKMXJUdDBXVW44?=
 =?utf-8?B?SFhwb2JnL0V6NGVVb0Q4dmhIbkZ1RHM2UHF6ekRDMkdJTXlBRDNDck0vaHNI?=
 =?utf-8?B?U29SOFVWRUQyK3p3dnZod1Y2R2FxaHB4Z2EvV2gyQWI5dVRFYkxJUDdyMWNU?=
 =?utf-8?B?c3dLeTBUb200MGdQMjNqR2o2Wk9qYVUzMisweXhCT1RvRVR1cE5rak5PUDhS?=
 =?utf-8?B?eDMxcDlmQXJTODJkakkvWWVyNi81c0tJU01DY0d4S1U5MVZBWEtEL3k2a1Jn?=
 =?utf-8?B?NWZUOVkxbGNqOVNmbEhISVRiNWFLYi93Ri8velhZY0xBRW1kRWl0Nk5Cb2xD?=
 =?utf-8?B?TUs4K0lRWTVrRE01amEyZWdTN1ptbk8xSE5HRld1bndtWVJVVzBMNmRIM1JX?=
 =?utf-8?B?Sk1yUllIK2Z6S2ltWm1pN0hmaC91ejZwWlRrRTlNNHhZNjRqOXQweUVPM0xV?=
 =?utf-8?B?WnhmQndEb3lYdk5FcTdwZmM0MHBYOVRXRWM1OXJVV1QvWmZwa2tUZmY1NVNq?=
 =?utf-8?B?NktpOU0wWEd2UlMxeENIRzBXbCs2T1BiaVVmNmtIMW5MbXlramxiZlM5K2px?=
 =?utf-8?B?UUMxcG1RVDVsT1N5ZEdSUDV5RlhYbENoVU5wZjNtZGcvNXMwNUg2NzZnSDkz?=
 =?utf-8?B?UHRBUTRlNVh2NUs0SFAwRUM1bzdtRzIrRElJL3B2ZzZhelBlbHQ5cXdHMEZu?=
 =?utf-8?B?blRkb3puYjF6ZDV3ajE3dUJGMUhsaERFblBjWExjT2wvaFNZZ2V4UFNpNDA3?=
 =?utf-8?B?aUVnSVJsTzdiTHJtZFd5K0NHeXU1RmxscnEya0NXU3FUSlFGUDRBd050eEVC?=
 =?utf-8?B?MUpOY1pWT3AyQWtRRTdwY1RlRi9KN3pCQ2FPbUxKNFhnemxDeE5ocW13ZlRG?=
 =?utf-8?B?bzBYbW1QMWRHNzhoWWphblNpcVpJcXVEb2NBeVE2NmRlRFhMZnhaa2ZVb0Jh?=
 =?utf-8?B?RTZCTE5ZSDJhTUdYZ1JMRzdNWEc2TGhwdDZUL0FWN0g3dUlqbCtXNDFGZEVK?=
 =?utf-8?B?anhDVnlHdUpTTHlmdURuR2M0bkJQTFcxU2ZpUjBya21iQy9Xa2xMZG5JbzM3?=
 =?utf-8?B?b0ZRWXBvVGVhUFZPYWRocnZxQURTRlZreTZUcFRUMHRlamRXc2pXNzROZ1pa?=
 =?utf-8?B?M2xreUdhRzJTdXpDa3YrSHlSdStnWXBRTEczbTBqWHZHK3M3SFNCazh2Qnli?=
 =?utf-8?B?aE03Znh1MEZNaUc4UW1oR2padllmdHl2alhQbklTa3dZR2pETFZaNEZrb0JL?=
 =?utf-8?B?c0x4QkhGK2dpaW9qekQ5OGpkdkc5QlBLY1JLa0ZoUE15bmYzNmdhQ3l2MnRD?=
 =?utf-8?B?R0o0SVlQd1U2cklDV1NndXN6LzhiRU0wOVdqYmFPWVZyWW4xTCtQYzk1SURT?=
 =?utf-8?B?b3VZNE1UL1Vra1hwZ0t3TWU3WFZ3ZXY3T0VyTnUrZHlWSE0valNhR2IreUdv?=
 =?utf-8?B?ODBEMDRFcmJTemw1eEUvQVI1WHh1UnkzaGovRGt0TjNuVDhRSkNGOVUxd1RC?=
 =?utf-8?Q?IatU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SldiUTBJTjJmb29jS21rQWh0WlNtclh0ZFpjUWFwclhWYkdsbFh5Y3A4eTha?=
 =?utf-8?B?T3E2SEUyazllUmJoU1VDT1ZzZElzdWVOTnMxMXlMcElXbjhSK1d6N1NLM2Vw?=
 =?utf-8?B?bUtXS240c1NaS0h5SEZUajBTUTVuL3YrWDkrdHEyelJGQVhuK3RiamFwVzVj?=
 =?utf-8?B?cWk3dE9NdXVybDlvRE1JUmtmVFJDZjNueGI5YlRPQ1U5c0hZcTBHWlFJSVFW?=
 =?utf-8?B?LzJ5TTY4cEdTY3J1QmEwZ0U0OWgrc21NZlJ3TTJwcXNuOFJvbDZqelRDMVlF?=
 =?utf-8?B?cEs1MFFXdEJkdDE1TlgwdUhXaG5UU2pxS3FQQUc5SjBHTjdWKy9ta0ZpNUpC?=
 =?utf-8?B?UkJVSWxTZkdSOG5ZZlJ6MXlFMjRDalEraC9SeE5ySGM5QzdVcDZRbHY4Tlh6?=
 =?utf-8?B?SGtmZ3hyekdZbnR6b0k1NmM5dVZ3QmJaeEJoeGcxTFJLV28zZk1idjhHdVo1?=
 =?utf-8?B?MDZJRE1QcjJzUG8venB3MTJzSHREczBBYndrZFhOcW80bzJwd0FET3hINllL?=
 =?utf-8?B?NEowU25TT3ltNitzTjBWLzlIMkpqSVlFSjhEYjlGY3JuNndZV3JUdG03TWpv?=
 =?utf-8?B?V1pDcWI5TXRwUVhOMmpiMkdpNFdpeE9zbnBmN0lqNnQ1Y3p5STVMN205cHBL?=
 =?utf-8?B?MG1OMHdGeWhCbFAzRXQwQzZjU0FGQWhzV1Zpd3Z1SEZKTWlrS1ZORmRZNnRh?=
 =?utf-8?B?aGkxUXV1bnB3N2dJMDNLZk5IU2NhNmNadVZUWkhpNy85SHVYN21uWFpPd2pP?=
 =?utf-8?B?dWlzc0dCeVpSWHMrT3VkZVY1cTZvYWtVem5CVXdQZ28xMXlKaWlZeHNBRnBV?=
 =?utf-8?B?Qk9HYVREenJ1QUVhMVR3aXRBNEtJMkFTSk9EWG9yaFErVXN2ZmlOQmw0VkVq?=
 =?utf-8?B?ZGZvNGorMmR3R0N4bWx6UmpEOHhQdElkMmZDb0M0YUxUSXlZTExIYkMzNnp2?=
 =?utf-8?B?L1doNzVkbk5GNDRvWjJ5bGJNYWJ4aDJnZVU5WGc4RjVBUGd1OFFDY3VUZDZV?=
 =?utf-8?B?OE9BeWllbTNiRU5JQUlOVlliMmpNRGFoY05makpud1poU3BPcmloQ1E0amJu?=
 =?utf-8?B?VWhhS2IvWFlyaGY3UE5hNGtCMG9sY0tQV1RFOGx2VEh3ZHRLbXBFbXlsT0Yy?=
 =?utf-8?B?bUVlNU9sKzB4TGkrczc5RGRGemFXeXlqSElMNCtod3pPSHh6cWNIbmNCWXFl?=
 =?utf-8?B?Q3RPS3lmYlJQeEsxei8wZEpVY2NLcHl4QmlkSW9FTjRsSkRQejJ2UlFtOHhz?=
 =?utf-8?B?T24raVZvQXJEN0RNK0M1OW5yZ3FCLy9BUExFNXB3UGRzUTZpeG1zQTdKZDdk?=
 =?utf-8?B?NTIxRDNRL21MZ3pGOWk5OStjVnM0UjBFbW5zcHhkL0NPU3IvNVZhK0hqdVdY?=
 =?utf-8?B?b2JJb3B6Uko4T1lFdlg4OWQ3WmNyTHFCQWJPWkg5ckFOcEcxcWx0aWFKM25l?=
 =?utf-8?B?S2hvYkl1VURvdUFmRFArQ3JPY2wyTVk0ZG5RcnU3WUpja1E5OG5BdjArNTJT?=
 =?utf-8?B?bUF2NWFVbEpQLys3WGkxMytmUFdkQWM1RWQwYlNIbHlqcjRQWXFYV0pHY3U1?=
 =?utf-8?B?bGQxc2h1NkF2Y0JUdHRLMEluTkx6MTV3Q3M5dStuaHRDQ3NXamJSU1hsNDdk?=
 =?utf-8?B?N214c0QwN0UyYXhoaTFJdVJaZEpvdXNyb25VdUlSK2VhSGxpcjNrdDV6TG8r?=
 =?utf-8?B?UzBuUFpuZkdvUUdsWFVzOWJZeEFLZUJ5VEM0aTl1cWxEVnNNNU5LUUN4dWhl?=
 =?utf-8?B?V3NCbTNGT01OdUphanhyQWU0MnZFU1RWbi9SUlEyZlNUQmk1cUJxYWF3NjJv?=
 =?utf-8?B?N25Keit1V0hGVHUrdGV0TE1CV0pLaFhDS3YyY2pEZ3VzRm5uS0NhaWgxTERv?=
 =?utf-8?B?QTNHYVhNbzIwcjVPZjNIZHZlM1RySTQ4Y05jL1ljSmxWaVJGc0pkQXRZQlk0?=
 =?utf-8?B?eU1iQ1hRY3N5Z1VvNGVwN0NQM2oyYkJjUGV0a2JDOEg0enE0dm92UUtwY0Vl?=
 =?utf-8?B?bmU1aVFvTGFjSVo5ZTREVlcwVGk2dTZtbFArN2VGSERZbmdmSVVuZERUbTZH?=
 =?utf-8?B?OVBPek1ZZmFkckNGaTVuL2x2TWpLNnRvanNweEFnMlJQWDlaY01lMlRPMWpm?=
 =?utf-8?B?eVVaNFNzYmZpZ2g5WUNrQzM1SFdBUVpacVBIWXM1VlpoWHNTbGRwTkdaK08z?=
 =?utf-8?B?aWsyK2dZVThFWlp1NWdsVFA2LzBpUFg5cGJ6a0IweWtrWXE3TlUzdTFWaEJX?=
 =?utf-8?B?UWdtVFRnR0dnZEdrcFk5U0wxVlI0OWtQb0VQUnhuWG14MlNVWWVBdW5sVUpH?=
 =?utf-8?B?S3RLZElwRSt5Nko3ZStBL2dQaXIxZ1o2NWFDRlNoTVZUa3d4VlQvQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a573aba1-f14f-4c68-f1c0-08de69b83119
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:54:55.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGtuHOTNkEgeFW7XPK0rKaTm6/x0ntnbyeOiRc0Krg0FU8Yi6K3T3IawL5hZaIje2kNAoudKrZsAl9c82QkKbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D94F8127EB0
X-Rspamd-Action: no action

On 2/11/26 2:46 PM, Lizhi Hou wrote:
> When an application issues a query IOCTL while auto suspend is running,
> a deadlock can occur. The query path holds dev_lock and then calls
> pm_runtime_resume_and_get(), which waits for the ongoing suspend to
> complete. Meanwhile, the suspend callback attempts to acquire dev_lock
> and blocks, resulting in a deadlock.
> 
> Fix this by releasing dev_lock before calling pm_runtime_resume_and_get()
> and reacquiring it after the call completes. Also acquire dev_lock in the
> resume callback to keep the locking consistent.
> 
> Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c    |  4 ++--
>   drivers/accel/amdxdna/aie2_pci.c    |  7 +++----
>   drivers/accel/amdxdna/aie2_pm.c     |  2 +-
>   drivers/accel/amdxdna/amdxdna_ctx.c | 19 +++++++------------
>   drivers/accel/amdxdna/amdxdna_pm.c  |  2 ++
>   drivers/accel/amdxdna/amdxdna_pm.h  | 11 +++++++++++
>   6 files changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 37d05f2e986f..58e146172b61 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -629,7 +629,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   		goto free_entity;
>   	}
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto free_col_list;
>   
> @@ -760,7 +760,7 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
>   	if (!hwctx->cus)
>   		return -ENOMEM;
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto free_cus;
>   
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index f70ccf0f3c01..5b326e4610e6 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -451,7 +451,6 @@ static int aie2_hw_suspend(struct amdxdna_dev *xdna)
>   {
>   	struct amdxdna_client *client;
>   
> -	guard(mutex)(&xdna->dev_lock);
>   	list_for_each_entry(client, &xdna->client_list, node)
>   		aie2_hwctx_suspend(client);
>   
> @@ -951,7 +950,7 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	if (!drm_dev_enter(&xdna->ddev, &idx))
>   		return -ENODEV;
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto dev_exit;
>   
> @@ -1044,7 +1043,7 @@ static int aie2_get_array(struct amdxdna_client *client,
>   	if (!drm_dev_enter(&xdna->ddev, &idx))
>   		return -ENODEV;
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto dev_exit;
>   
> @@ -1134,7 +1133,7 @@ static int aie2_set_state(struct amdxdna_client *client,
>   	if (!drm_dev_enter(&xdna->ddev, &idx))
>   		return -ENODEV;
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto dev_exit;
>   
> diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
> index 579b8be13b18..29bd4403a94d 100644
> --- a/drivers/accel/amdxdna/aie2_pm.c
> +++ b/drivers/accel/amdxdna/aie2_pm.c
> @@ -31,7 +31,7 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   {
>   	int ret;
>   
> -	ret = amdxdna_pm_resume_get(ndev->xdna);
> +	ret = amdxdna_pm_resume_get_locked(ndev->xdna);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index d17aef89a0ad..db3aa26fb55f 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -266,9 +266,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   	struct amdxdna_drm_config_hwctx *args = data;
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>   	struct amdxdna_hwctx *hwctx;
> -	int ret, idx;
>   	u32 buf_size;
>   	void *buf;
> +	int ret;
>   	u64 val;
>   
>   	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
> @@ -310,20 +310,17 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   		return -EINVAL;
>   	}
>   
> -	mutex_lock(&xdna->dev_lock);
> -	idx = srcu_read_lock(&client->hwctx_srcu);
> +	guard(mutex)(&xdna->dev_lock);
>   	hwctx = xa_load(&client->hwctx_xa, args->handle);
>   	if (!hwctx) {
>   		XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
>   		ret = -EINVAL;
> -		goto unlock_srcu;
> +		goto free_buf;
>   	}
>   
>   	ret = xdna->dev_info->ops->hwctx_config(hwctx, args->param_type, val, buf, buf_size);
>   
> -unlock_srcu:
> -	srcu_read_unlock(&client->hwctx_srcu, idx);
> -	mutex_unlock(&xdna->dev_lock);
> +free_buf:
>   	kfree(buf);
>   	return ret;
>   }
> @@ -334,7 +331,7 @@ int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
>   	struct amdxdna_hwctx *hwctx;
>   	struct amdxdna_gem_obj *abo;
>   	struct drm_gem_object *gobj;
> -	int ret, idx;
> +	int ret;
>   
>   	if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
>   		return -EOPNOTSUPP;
> @@ -345,17 +342,15 @@ int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
>   
>   	abo = to_xdna_obj(gobj);
>   	guard(mutex)(&xdna->dev_lock);
> -	idx = srcu_read_lock(&client->hwctx_srcu);
>   	hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
>   	if (!hwctx) {
>   		ret = -EINVAL;
> -		goto unlock_srcu;
> +		goto put_obj;
>   	}
>   
>   	ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, debug_bo_hdl);
>   
> -unlock_srcu:
> -	srcu_read_unlock(&client->hwctx_srcu, idx);
> +put_obj:
>   	drm_gem_object_put(gobj);
>   	return ret;
>   }
> diff --git a/drivers/accel/amdxdna/amdxdna_pm.c b/drivers/accel/amdxdna/amdxdna_pm.c
> index d024d480521c..b1fafddd7ad5 100644
> --- a/drivers/accel/amdxdna/amdxdna_pm.c
> +++ b/drivers/accel/amdxdna/amdxdna_pm.c
> @@ -16,6 +16,7 @@ int amdxdna_pm_suspend(struct device *dev)
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>   	int ret = -EOPNOTSUPP;
>   
> +	guard(mutex)(&xdna->dev_lock);
>   	if (xdna->dev_info->ops->suspend)
>   		ret = xdna->dev_info->ops->suspend(xdna);
>   
> @@ -28,6 +29,7 @@ int amdxdna_pm_resume(struct device *dev)
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>   	int ret = -EOPNOTSUPP;
>   
> +	guard(mutex)(&xdna->dev_lock);
>   	if (xdna->dev_info->ops->resume)
>   		ret = xdna->dev_info->ops->resume(xdna);
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_pm.h b/drivers/accel/amdxdna/amdxdna_pm.h
> index 77b2d6e45570..3d26b973e0e3 100644
> --- a/drivers/accel/amdxdna/amdxdna_pm.h
> +++ b/drivers/accel/amdxdna/amdxdna_pm.h
> @@ -15,4 +15,15 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna);
>   void amdxdna_pm_init(struct amdxdna_dev *xdna);
>   void amdxdna_pm_fini(struct amdxdna_dev *xdna);
>   
> +static inline int amdxdna_pm_resume_get_locked(struct amdxdna_dev *xdna)
> +{
> +	int ret;
> +
> +	mutex_unlock(&xdna->dev_lock);
> +	ret = amdxdna_pm_resume_get(xdna);
> +	mutex_lock(&xdna->dev_lock);
> +
> +	return ret;

Like the other code you added in this patch, couldn't this be simplified 
with a guard(mutex)?

> +}
> +
>   #endif /* _AMDXDNA_PM_H_ */

