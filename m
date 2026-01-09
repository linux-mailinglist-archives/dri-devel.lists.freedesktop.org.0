Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4997D0AD0B
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3242810E8E5;
	Fri,  9 Jan 2026 15:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mc3rKm0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013008.outbound.protection.outlook.com
 [40.93.196.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9495E10E8E0;
 Fri,  9 Jan 2026 15:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fgvt5YC7lzmG8L2WMULbasa/PVQjJkDhikhPMGvUYPxXHO2sHCTT6o7cZsFiVfwSYI51uuakFOn9QU/fdBNO9romcVAXQ784Vl/nlJGGVGen2pL+6j57VhyWBUxJNP8LW/pT5dPbWnKi2uG4C4xj1Dz/GAeJVEmBmcBu9i6jTYLT+fFg+BI/DAdf4wLx9bqn+Bvt88i0BKKnP/A2/jbcFMTtJpE79EKB62HZ2gEkGP4IJOkx7Klri1jCBg8bjU4L1QnArTmsSr2GhqTbPukGi96zbeOyc3VoJRFgKHFpzLqVzJI3BJNYpXdRUinowS/W28s75jP061fxdqZOCne5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucJyFFvkpoN7SC9Z5cBGCFxNbgMLvsOGjT9rThzrPtY=;
 b=MnOK3wLAQJNRPjur0dw6mv46fUotjZg4IIwbsgu20Z6tJCVvKbAo2Avl/rsSF2aWLilud5uFQ3dzmGiZ/O3xMVrtRnviw4rC16jyCiES578PFd3DZSsrXEtnCzApJsmG0R0oZtBM7Lo7N/73XdGMFtTnNsPgtaFAbU4eCloCBmuUrTexFzEsHHZwTMRURT3EcKOcIK593bs3/spwuhkjjzSj6QIfKogy5A/U101QzAGS1Vww5jEpBaITwwP5UYmzMY5f/OT0grkx0nE3YCYtYgluDgy2i6dsMGCQpQ4/yknC5QHzRoX/N/Po6M/AOBKSUhp6oO+HPJZ4V+TE/H5wAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucJyFFvkpoN7SC9Z5cBGCFxNbgMLvsOGjT9rThzrPtY=;
 b=mc3rKm0ncLsLUBnNZuFKtSxqDGQpG66UQek6VvgxWRLNiXFVHa8/bmQK74nohh8e0Qp/+n7tQLvF7kSAl4SrUDVvdf/fXimOIRLyZJ2QhPiv3fe5/O83CMr/4Dn5m7uxOoLHtZ6alnlEhSNjtn7MWFVrrNceJlDrW3bBay7MJFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 15:11:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 15:11:38 +0000
Message-ID: <e15cf7ef-e890-4a33-bfb3-ef6b6dcf384b@amd.com>
Date: Fri, 9 Jan 2026 16:11:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Simplify idle entity check
To: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
References: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
 <1e7ae073820d0cbb7f6f615b40e0cf4c6133a062.camel@mailbox.org>
 <607847da-4f8a-4c19-9ebe-c07f79ce1362@igalia.com>
 <a51103108eaa84134591c8321c6a70a484daed2b.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a51103108eaa84134591c8321c6a70a484daed2b.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0344.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 44345f7b-3477-49cb-0f73-08de4f916312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEx1UkVJY0cvcVNBR1ltcnVqUmJBUVNaeU9sZHhoci9oQm1oRDVrZzF6K0gy?=
 =?utf-8?B?eEh6aTMyc0JZUmpOcTVQUmtzaFN4L1lwWXBXVm90eXBobVVudUNHWjhNM3Vj?=
 =?utf-8?B?TkN1TTJRUzFHcHdkOXNkeDNRYUpGUDMxRkdpbTIxMmw2eTNNTW5JL3FxckpJ?=
 =?utf-8?B?Y2RFK1UxL2RSdHVSMDJ2dlVaR2J1RnByWW54Ylp6cmdjRmdqdFJQcFltKzZK?=
 =?utf-8?B?cm8ybnpLcjA1VHNOWmhEVHhubHdMaG5nUjgwTG9RMjB3ZGxlSnNEQUhaUmhZ?=
 =?utf-8?B?UndqZ3pVOVlDNTg1TnZFRUlnM2haS1M3T0twbEJpQUwvd0JMMHRRMGxGcWRF?=
 =?utf-8?B?Ynhqd0lERFBSdWZiNlBiSXYyVmtPcnZCMUNvZklaR1dOSFV4ZGN3T3YwS3pI?=
 =?utf-8?B?QTBxV1B1aEJYVDg0RUEwVmQzTzliK1pRS2wxT08vdHluc21TUzhDN0ZnUlRK?=
 =?utf-8?B?NmdVYW1ia1ZXMCtSMEs4RFBUUHB5eG1nMXdqUkpxelJJMW4vNkk3ZURpaU1n?=
 =?utf-8?B?czVCbW5ZVFpGSEViS09SS3lUdThUZUU4ZGQ1OGY1SS83b3orRTZwajRXL2hp?=
 =?utf-8?B?aU5UT1J2TncvMzg3aDFwT2RZU1E3UzhFRlVhUzhKUjFmZFBhZ08rVWFNK3Aw?=
 =?utf-8?B?bGJaTnVaVHRtbWs3bFFwUzVYcVpiS2x2aDl4TGwzZ0Y5S1VIT3U5ODNwQ3Iv?=
 =?utf-8?B?Y3BIVVJhMmhSclNXaHJIUmppMWRXcS9tT0ZFdVVIOE5EcE8za1dGeGVRUklU?=
 =?utf-8?B?cVJpUzk3NHk0ZEd2cERidHpLQmIrSGQ0UmJTei9vT3UzSmw2MkEwazQ1M2JT?=
 =?utf-8?B?VExTcW16bjNXSlluMURHczBkU1NLZTFZVjhqMSt5Y25XTnlrUzF5ZHJKRkNJ?=
 =?utf-8?B?emIzbkh4QVlyMWYrL0xSTW1ZdldvbUk0QjB1Tlc0c1VZMWU4a3ZTMEs4Uk9x?=
 =?utf-8?B?bXhKNnNnWlZtd0kxakdhZThzb1FMMm9CanBzc3R4WmFhakNOdGVUZGRRMVZQ?=
 =?utf-8?B?dWd2VVV3MTVEZzRQc2x3aVg4d3VzVW1SVWk1aU5NS2QxZHo1aUVkWHUzck4x?=
 =?utf-8?B?UlZtTVBZSHpLdTQ4UTdLTXk5Z1JPaEFZUkJJb0VFdk90N0x0WkhUZVQrL0Yw?=
 =?utf-8?B?WHJMSFlNOUdOUmlnNUpKc2dqTzY1dmFUV0w4VzI4ZEUvZ3NYeERpRWlBVURS?=
 =?utf-8?B?TlNTZGEwOUtENGJqcEVyNTR2L1FXZ2JkM21rV3FGc0pxeHlsTjBHSWZFdnVV?=
 =?utf-8?B?QjAvK3dGTkZNbTVodW56V1hUVTVrRFhsTU5DVWtLanc4K3pCTTM3c2lLN2hV?=
 =?utf-8?B?YWVKd3Bld0t4OWpmLzYwRHBMbjRJRUw1c1RFLzkwalVrNWNMamlkcnJwTHN2?=
 =?utf-8?B?ZTJkVDlaUzh5OFkxWDhjQUlWSmN4T3kxRFNVa2Rnb1EvWk5BbWIrZkdCcDZl?=
 =?utf-8?B?NnVBeDg0aFFFU0RSSzYrRmlhYUp5VUlFSEtROVFoVU5nU0ZDY2Q2aUJRTzc2?=
 =?utf-8?B?Um1mMmVPMVh6QnZtdkV2QXcwNFR2TXRZQ1lMZ1AwblFhMmV5WmNuTHUrMC9v?=
 =?utf-8?B?YUYzVUZtV2ZTNFltTmZXanFYdUF3T1Q1Wk8zYkZ3c1ZFdnRNaStPQUJjVzV1?=
 =?utf-8?B?NDdXeDFFTUtSQ3d6Qk9QdFRYVm82dStzRW1YR2xPeWlqVXVKSGhHVzVwUjh3?=
 =?utf-8?B?K3NLRnpGQWpVczUrdE9OaHJTbE9vdGsybERGd0h1OVliM3VycG5Rd2dTcXYx?=
 =?utf-8?B?TVN3NjYwQjRSQTg1SDdvQW1vaUhVWTUwQ28wL1VXNzMzaW85Z2d0dmh6MmlB?=
 =?utf-8?B?QVcvdXhZcG5MTU1TYkJOM25JUk1XMFJpdUhndHprSy9rTStmWWFhMGlZdnFq?=
 =?utf-8?B?ZnB3U0RsOFlKYnMyV1RvNVFqaWtWNGxiRWNiRXBabDJrRDNXRjVGS2MyQmhH?=
 =?utf-8?Q?K3asJRZ5aIjpcNy8Tyxlx1CcEA4RuSKB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEM1RVRGK0lEcUorNmRiNjc5bW9aTHJjTFp4K1BGR2x6T25BVW9xUjFKN3RH?=
 =?utf-8?B?Zzl1YzVlVHUxVnFVenNyRkUvWTdnUGRDV0EzTDRWQks3OUVIVTc1MktXTXJD?=
 =?utf-8?B?WEF6amhpZ3NQNGR3N3lkbWVucmV3VFIvekxQTmFYc1hEc3ZSSURsR0o3Qmkw?=
 =?utf-8?B?ZTdpNHdzN0FqdzZFeVhqS2hMbUdVQlFwaTNESVZYTnBpVnRIdnc5cCtVcG12?=
 =?utf-8?B?bmdIOXNBeEZOblNZNVByQXE5c0VCckE0QlBJZDFqNkRCRS9oTnhyUEthaTl5?=
 =?utf-8?B?REZFajJmeFdSMmFhcFlrSFBiQmY4YnBycm1SSHN4UTVkN3loSEt5MVY3V29y?=
 =?utf-8?B?dW5ITWJuRHduN2k5eFF5SjV0anlMSTA2S0NlMjhrK1NhUFVZdkdYcTJPYnht?=
 =?utf-8?B?TG9QQ2NhcnNRcXlCWE9mdlRZUExyM2ozSmxqY0s5VmIwZ3ZQZENwQVF3MDMx?=
 =?utf-8?B?QTQ3aTBPVzdBRWIzUkd1VkFrZks3S3V0QU1qQ0tJWXNGTmtrUGxLMjE0OVNJ?=
 =?utf-8?B?a2h6d1VSeC9QVnpRd0VLZnZkMDY4ckpuZk5kZmJ6VXRRYk0vM2tnQzg0b1Nw?=
 =?utf-8?B?R1dCV1cwT0oyN1NrL2xTZzU5VTFhYkxsNEwyMk9HM3VNMFVDMU1DbTAvSGw3?=
 =?utf-8?B?dnNMOTNGaDlPYmZTZnk4aWNjWmtRNmNEZGlsR1RZaTZ3K0RHU2V2QVQzNUVt?=
 =?utf-8?B?WVk0NTh2dGdaQkhSTlhNZ1BIckR5YW5VQVYzbjVsZDJKcXhZUUlScnp6VUVF?=
 =?utf-8?B?bnEzK05JemNVYkR5UnMydDhwRGJGNUVRaU9SQkRURUVVQkZyRE13Nk53Mk9J?=
 =?utf-8?B?V2xkTHZ4REFLOTYrL0dMTFJ5UGtib1gxQStRK2RzMVA5T2pDNWxzMVNrWjZi?=
 =?utf-8?B?MytBTVJKdGM0SktvcUl0bnpoM0ZnK1ljVjc3UFFMUXRCMjBCOWJvMEZ2WUZh?=
 =?utf-8?B?Tlp6NENFR0xMeHdpOHFmZmFXUnZrUkk4T09kRnltOUFmbEU0OXpKU3BqVHFo?=
 =?utf-8?B?WGxlc3QxQm1CVHoxZmRqTEFlcUpwWCtoaloyRHlNVmtYS1hpa1BTOEtuVHFC?=
 =?utf-8?B?cE83dlEzM1I2WjlvMnhuelJobjhNK2wzNEtaMllGOCt0VVdvZGh3SWxwTnNT?=
 =?utf-8?B?VDhHQmptYVRQN2pvY3V6K3FIZzZZL09JQnNRajk0UzI1YmQ4MUtLTGFjMmg1?=
 =?utf-8?B?RlZBbDk4bjFnYWorTDlQNkJLdmtWTWsrYjRuOEh0c29vOURqMW1tZjQyOVNQ?=
 =?utf-8?B?NkJlKytTUk5tVUN5dkt0UUU2bmxIUlk4YkZGRzh4ZHhEZFhHb1VhdDdXb3ho?=
 =?utf-8?B?a1VFRVl2OVlWSWZzcy9OK3RkNHJwZHM0eFJNTTd3Mit0TjlONDkwV2tYQTR4?=
 =?utf-8?B?dk9mN0RkcjV5MDUvN1V4c2MycWhkdVpqczNBNDNRR0N5VjdldnpURVFWVk40?=
 =?utf-8?B?NFJXNllldFBHMkk0cDlWU2FlM25relJKU1hvWWx0dm1zaXppS2x3WXgycGRl?=
 =?utf-8?B?ck1WRXZZWm9JZUJsb0lVQUxvTGZBL0tNR0ZPS2tTbVVvVDF3bUdYZGRBa0Rw?=
 =?utf-8?B?cld4SDB1UE1XVjVYbGhHNHgrckQwbjQvTkFFYUNiZVBoQWtnY3NGZDYvQnRD?=
 =?utf-8?B?SnBpc2V6cmc5TFNnTkJ3NWdwc3ArK2s5K0Z2Sm9NbjVyUDQ2VTNBeUFvemcx?=
 =?utf-8?B?RFMrZ092bEV2am5NcUZJRHlud2RndzBjSG12SFhJK2YzSnZRQW5pcU5VL0Vx?=
 =?utf-8?B?aVpqUzJEaWVqankyaVllaVFKT1hBQUoyVGM3TVNYYUNhM0RMZVhacklHVWNF?=
 =?utf-8?B?RkFKM1c5c1lCdDZYQzcvWnh3WHlmNDdpazBOVUdNN29SejJ0SlRxdzh6QnFa?=
 =?utf-8?B?RDBYdnBMREhDdzVaSWJCUmgzd3l5VEZDV25sTytVckxBYXFUTXpiR0lkcDZE?=
 =?utf-8?B?eEM4TURiWW1aaXF1aTBPTTV0VHBGSkF1czJueUVvaGhVclBqSVQwSDEvazl5?=
 =?utf-8?B?MHlzUEZuaWozVFM2V3RKTkFKb1lPYjVBOHF6cGY0U0Z2ckMxejNWT0t0dlBr?=
 =?utf-8?B?Q04yMGNQY21UZFlRZ3Bib29FSE8rd2xEdGxieFIwOFhzWGJ4RnNQdkd2d2hE?=
 =?utf-8?B?M0ZrT0EvUTdCVnZHU2JMNzlaOW5BSGdGbFJlQnM0ZGozWmUrYzdrUHh3ekcv?=
 =?utf-8?B?ZVo0SVRqbm9oanBMYUUrcys3SjVmcXNiY3BlOEltQjBGSkVNeGk2dmQ1ek53?=
 =?utf-8?B?K1MrYVRWNStLaW90NkszUHlVazdYd0RiQkZHeXFBM051TVg2SlhRL1RRNUdY?=
 =?utf-8?Q?RdRfD0wMSkI2JBA4ga?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44345f7b-3477-49cb-0f73-08de4f916312
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:11:38.5727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCIUX6yKoqqLbWGhNBgvJh4KoxIXh9+tL3npproQndXQ+U14yg4YrbN125yGYKg5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8857
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

On 1/9/26 15:48, Philipp Stanner wrote:
> On Fri, 2026-01-09 at 14:06 +0000, Tvrtko Ursulin wrote:
>> \
>> On 07/01/2026 14:11, Philipp Stanner wrote:
>>> Happy 2026, Tvrtko!
>>>
>>>
> 
> […]
> 
>>> Not to long ago we discussed that the spsc_queue should be removed and
>>> replaced by some sort of list, with proper locks. Christian has agreed
>>> that this should fly.
>>>
>>> The spsc queue has only 1 user in the kernel and it's super hard to
>>> understand how it's supposed to work and when any why barriers and
>>> READ_ONCE's are necessary (that's, of course, also not documented in
>>> the queue).
>>>
>>> Until that is done I don't really want to touch any of those memory
>>> barriers..
>>
>> (I had a branch with spsc gone more than a year ago but I abandoned it 
>> for now since it contained some other too ambitious changes. So no 
>> complaints from me. Who is doing it BTW?)
> 
> No one is working on it.
> 
> But I think the discussion has succeeded. The only objector was
> Christian because he was worried about some cache-line performance
> regression. I can't remember for sure, but I think Christian realized
> that cache lines are not an issue (with a hlist?).

Well I'm ok with it as long as you don't regress some specific performance test cases.

The problem is that those performance test cases are ancient, e.g. glmark2 on modern HW for example.

So you don't exercise the HW in any way, but rather how fast submissions can be pushed to the HW.

And yeah I'm perfectly aware that such tests are completely nonsense.

Regards,
Christian.

> If you want to pick up removing SPSC-queue, be my guest, but make sure
> to discuss it with Christian before investing too much of your time.
> 
>>
>> Back to the point - this patch can wait, no problem. To explain the 
>> context though.
>>
>> I wanted to get rid of looking at the list_empty here because I have a 
>> branch which improves the flow for the 1:1 sched:entity drivers.
>>
>> Why are the two related? If you remember in the fair scheduler series
>> all the run-queue stuff is nicely grouped in sched_rq.c and encapsulated 
>> in the rq API, which made it possible to follow up with virtualizing the 
>> rq operations.
>>
>> The yet another relevant thing is the patch I sent this week which 
>> removes the special case where entity can be initialized with no schedulers.
>>
>> If we combined all these three pre-requisites, my branch allows the 
>> fully invariant sched:entity and 1:1:1 sched:rq:entity. Run-queue vfuncs 
> 
> Hm, wouldn't the CFS series annihilate multiple RQs anyways? This
> sounds as if there are several series' floating around, cleaning up
> similar things.
> 
> 
> P.

