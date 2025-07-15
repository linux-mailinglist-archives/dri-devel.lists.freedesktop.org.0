Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20328B05F4E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 16:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B2810E20E;
	Tue, 15 Jul 2025 14:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PJJxTgcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C9710E20E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 14:04:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2ZoGpO6YU+8HUtUnWKbKmy41MoPKHqPGznvbUlqKM0aE5bphq41pminXMceS0syk4xP17pe2MLUpltcqYfnnPgoBWMzpEpJyQKWW9ihZdo+2mnd+IyTv6qKQELsWfSQFei0+zyKj7KjuNIkA3Ah4fqin7mzfL0sF433HP6DzsIhQAQiH5wn76LmwrpaAv2dYD0ArLi5HlmmLd9KgUkARdlX+YAlcKe/SfWob2qME3D8xUamIWHf1cbNRFgNJoBz4WzGxEOanfmvhsE65R6qFdqfmpRYFrOAb0O7143lUbZM+RLKqujoOaXE1VzfENFh1P3EJ12qdaXwmr+1uMvRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPBXkY42kv/PUpXFbbp+g8NW3LYLdWgjijVQBCrCjrw=;
 b=i9alWT5Hbh2SfpYVBit/XpUZvIo4yLlI+JURmN2LbINs+jUFrq0iO34QvLDm6Hg/5RgesKpzJIGkuR5L2kCADxyAeD15AqGZaheWHkEytdnhNrSxui0NkcKKVw/pIbSZ1u6i0EcXcZ6+kQuETTL5kHvOXxTExA8Vlpd6aVTgnHJjZJLFiQDaYzM5tb/Bk+Pcp+0tfdG/r4TZ4Kp8SIFKF05/0kxmA/l6L4inFeLXTDg0+EYQIIqDF76n2HkjxLxARCXN2BuOZDU9UcDKYFq4E6iznzVNTx0dO+uP7b7vFjesd+NDlTnV11rsBuUrzRAXsJ7qnAFC1byz/m705vhvLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPBXkY42kv/PUpXFbbp+g8NW3LYLdWgjijVQBCrCjrw=;
 b=PJJxTgcLMrADIWAsGrhQMAVszOh26tV3iIQPqIehZGa0aEU3wP1yk6YiLLGwz5T9jMGRKHChPpVOkbZl/kPobU3HDkaDC7VeNH1SmZtsYamJQgnDjL52kAl/JJ82hVv5jSQ+LL+iG0DmVQAawKNXWh6GDj5pO4MOD2pQ8qZpRmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Tue, 15 Jul
 2025 14:04:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 14:04:09 +0000
Message-ID: <955ab6de-f136-4376-9726-b93f5631d901@amd.com>
Date: Tue, 15 Jul 2025 16:04:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.15 085/192] drm/gem: Acquire references on GEM handles
 for framebuffers
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 patches@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250715130814.854109770@linuxfoundation.org>
 <20250715130818.327986464@linuxfoundation.org>
 <d52b4d04-cb02-48d2-9042-b135a30f8a8e@amd.com>
 <aHZeCE249cYEGCc2@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aHZeCE249cYEGCc2@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: d6dc8c36-2e0c-498a-f964-08ddc3a877aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1oyQVh0d3ZPVVNtYnlHMTFHaUJlTlJ0N0p1TjNCTjhibHlyeVNXVEJHR3VM?=
 =?utf-8?B?Y3VOK0pPMFlTbGRqdTZ0aE0xWW1BTGM3bGVVbFZSTFVWcVlLTk5HenNzVVE2?=
 =?utf-8?B?cXp3YUU2VkEwbWo1MlN1TjVPY2JtSFNSRlREbzRaU0drVVZNcERzMkJNcEtt?=
 =?utf-8?B?alFXK0JKd2JFaU4yNEhaMm5sbjlucmZXSFFYaktjNnIyQmQrUm5rTDN1ZWM2?=
 =?utf-8?B?WjBoVlY2Y2dFZTZ5cUF2QnRvMTl5R0dDYjhHb2pDSU1oYjFwcDdMV20xamwv?=
 =?utf-8?B?QTYzbGxzV0hCQ3E5LzZmWHpaVjIrTzloL2U2L081UzI5RGJsQktlR1lwdVlp?=
 =?utf-8?B?bDBkYWZ4U3l4eVhyV21ld1lyNzBmSHFvTmtaOXpvd3A1K2kvTzIzOXYzc2tH?=
 =?utf-8?B?RityZiszbThva2xTUitpcUNGUjVjSXJ0My9Tc05tOHpKcDVTQ2pYVnRacEF0?=
 =?utf-8?B?OWQzM05iWDd5NFdBc2tWZjhkeGU0emNjaGdyT1Q3NFo4c3JETEkrNFhDWm5j?=
 =?utf-8?B?YXc5cEsxTXdWb0wvRFBOVFR3MEgxWUVjVHFHaFp2aHl6K0pKMDM4ejRsaldz?=
 =?utf-8?B?RW1tcTlWeFNsUHB0cHZkM3NJRzlnWFRrWW8zQm5mMDkwNk1Ka211QlUzeGRs?=
 =?utf-8?B?eFJLaHQ4c2s5dmhrYk9lQjBLYitFU25KVDE2aXdTeEduK053L2QvMXdSbzdw?=
 =?utf-8?B?b01xaW1xcXlySEhKTzRGeTJITU1kNDQ0QVBkWGJUbTNJS00wWjNEK0lud2FK?=
 =?utf-8?B?cXJ0UkJZa2t5SUEraEJERm1UTTRrSkJoaTlWUG1NM1hCUnNuWWpDSE16dzVr?=
 =?utf-8?B?ZzN2Q2xkQitSUi9mOHlUV0dWUmVjOFF6Tk9GaVdjai9hYi9MRW95d29yTlRy?=
 =?utf-8?B?dWo5NEEyQ0t3YVR3M0FrWnJScEF5akE0eXhpVDcxN0p5MFVtb2VaY2JkZ1hF?=
 =?utf-8?B?WXZ0dVpyeVpEdVJzc2d3UUloc2NMeTl1Q0ZIK0pCcGlFOFJtL3RaaDdSYzBL?=
 =?utf-8?B?aGNRelplVTBkMXd6eGtrakFVN05vUHR1dXdlbU9uZmwxNTdGWDlTQ3g1bm85?=
 =?utf-8?B?SG5mTWYvVUxBLzQycC84U1dxd1JOVm12TjBzcEgwQmV4ZjBFZlE0VnB0b2Va?=
 =?utf-8?B?K1Q3NHF2UDFEQmFlS1pCbnU4UWlUZklWb1VKVnVPb1FkUGVRZ0s2bkk0cVA5?=
 =?utf-8?B?bjhtTnJKd1dpcmNBVFZQQ2FLTW9pZjJQOTFQaklZOVJWcEp4SVNtVlVEN3o3?=
 =?utf-8?B?WWJ2TUdUa0JVR1c2OUt2bUk5aHJibW8zVC9wYURoZ0hlVnBJYmlkOG9qKzVS?=
 =?utf-8?B?MFY4VGM2enFaQllOQkdxTmQzOU9LeitwZCtSSmp5TjVUQTF1RjcxOHc1bXh4?=
 =?utf-8?B?bFJZSmpIdWdXaTErZkRwMTc4dEt3cTJGMzBYMkhYdmhMbE1XVmtDUWpsQnVS?=
 =?utf-8?B?ZklhNlZGaExySmlOWTFDcGtsU0tzVFpYMTg2MTRaY0xXVVlQSFkrTVUvV2Q0?=
 =?utf-8?B?b0ZmTERYaVJwbDNwd2lkeTdZRE5FZVJCem5YMnhXc25nbFZZYkZsQmQyZTVn?=
 =?utf-8?B?UVZGeFEzN3VtSm9oRG9QQndneWY5QTVwNEhSa25MVlVVMUk0QVZ4d1FxOXlk?=
 =?utf-8?B?bDhqOTZYMytwK0RvVVU5WWVUSjJERkNoYkwxL2J2MGcxZ3Nma1c4R25rU2lM?=
 =?utf-8?B?bWVaTTVtMDVoNEdNV3N4TkxuRmFSNW9DcFpRNEVGUmNyTXJCUDhIcXo3K2RW?=
 =?utf-8?B?bUpvZFBGcmVXVUZPdXQ2ZnlRRnVGSmU3UGVoRytTdEFDS0Y2d1F2bU5nSG9u?=
 =?utf-8?Q?l2asQ2jDt1Q4yA51I4jvxF7MZvb5R98DtajJw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXRKU3VxVWJyam1JdlJCMm5uSG4zUHhvcjhiNnJYeGsreVJ2QWR4UlRwTC9Z?=
 =?utf-8?B?UC9kZU8vYUI1NmVVUzVRRGYwZlBmcGtlZ1dvNmxXUkhDV1RkYW1wN1BNK1RL?=
 =?utf-8?B?N2ZpdVJBck9pTXJyZUtHdmZFNkVPY2NCSzVPWDBJTnMzUktIY0dJRnNDZ1NR?=
 =?utf-8?B?c1kwMkw3UzRkTE44NWRTOVF1dEVKQys3TzdydkplYXowT0ZuSTEvYWNBbHp0?=
 =?utf-8?B?RGd3U3ozUDk5eGE1L0IxdTVkeUtOdHMwODNId2xRRnlHaVh3SmpzQ2NoUVNY?=
 =?utf-8?B?SUFENjZVYTh6ODVkL3JFaE9NUTI5SEkrU290Y3JRN3pZTHB1L1NZd0ZpcEcz?=
 =?utf-8?B?NFZpdG1xckM1MGhqU01zcFRpSjIxWGx3SitqVUZNMFJ3cmRabFZrQ1NMRzFT?=
 =?utf-8?B?dm85bFE4TnhLR2tBcU10THZZWDVwMFFwb1VvV2VxcHFnWklmY3phNG95TFVI?=
 =?utf-8?B?bU16aGxoOCtpUlFwMUtFc1AzRytMNFJaYWg5WmFUUFN3dXdOSUdsamhWeWlo?=
 =?utf-8?B?OGFKckZodlJYZ1Z4R3JpblVTYjJybEw1N3dqWXMwZGJkVjRRWG5mRG5CTEwr?=
 =?utf-8?B?VHhJV092YTBOdUl2Si9FS3NMdXREME85eHNsRzdFbHNWTHRJdjMrY09zNnhq?=
 =?utf-8?B?MzFuWjIvZ05IUlM1alljVEJNSDVJN2RxTDhIekpVUnFyMndOMVgvV3E5eFVG?=
 =?utf-8?B?L3FoNW1ka0VNWG5TZHJXS3EyQzdOa3N4TnlJSEJpSjZGRWdkaDRpMDJxZkQ3?=
 =?utf-8?B?TDdzQVdGVGNHNFluNjFGVDdJZmdORWpXY2FQQmhGUy9XL2dQak05cU5neTRQ?=
 =?utf-8?B?TlBmZ296MERyeWY2bDRYMW9FYUZnVTlEcDZwdXVZNzhtZkJ3c2kzN250Nkxn?=
 =?utf-8?B?ZnlTMkFQOGFaWjRiWXBPQ3ppdFo4VnhJUGhKZGo2RTQ0b2p6bkd5VEVzQ1B0?=
 =?utf-8?B?QmQ3Rk9neDRXRmZWS3ZiQlBhazRqMmU2NExyNUUxUkt3bWdMbWZiSlliMjBF?=
 =?utf-8?B?WlBtNW5PMGZXV0NQcnF4SDByVmtzQkhPUDg5OEFLTGpRZ1prV1k3cGZrZzZ6?=
 =?utf-8?B?TEg2MUhaMWRRZHRIVTMwYnpxNy9xamQxcnhzcmFtZGNmL3RlVmdaZmF2dEdo?=
 =?utf-8?B?ZWRWVXAwTGN1L0ZEUy91UGQzZkVKa1RYVkpVVVR3NmtocnZ5MFRoNUt0VStx?=
 =?utf-8?B?ZHIxdjZUbFRLNTcydDhFSEJKSGt0VGFnd2VJaldkVHpyMWNSVzN0WGhXdzJl?=
 =?utf-8?B?S0JCUzc5aG1VQjVPWE5ZVmpwZnBGNzFJUE5hZmNrcytWYUgrTFg1dVdHNjAx?=
 =?utf-8?B?N2hFOXc4YTBRaTJ4c0dOT2RtSVowZjFITFBvd2U1YkpZaHIzYVp5SFVYRGhC?=
 =?utf-8?B?OWYrd3IzWkxKMDhEQXJpRHhDemwrUnhRa0ZiZjFuMmlIZ01PL0RCS05HUXlv?=
 =?utf-8?B?MVNGNnZwK1lJcmxPOXhjSTVyUXgzTDlMZjA4MldCT21UK3F3UnpMK0h2aGMr?=
 =?utf-8?B?SFZYZ0E1WDdxM0puZXNuMVU4S3lZSjRyN1EwOGxsUWxXQzV1NzVqOVZ1SjRr?=
 =?utf-8?B?MWJJME03cjRxVzZLSWtjdHZneFI1aEIzZ00yZlFjS055WU1ScHc2cHEwRzJ4?=
 =?utf-8?B?YW1CRTNlV0h3Wkw3dFl6azNRNkJid3pPYldydXFkRjY5MFRUd3VaNVllNDBa?=
 =?utf-8?B?OVpSdEN0TCs2L0t5SzlZbUtja0NxbUxQV3VwS1h6S21IMjEyN3Ztd243TDVC?=
 =?utf-8?B?VUhhSnZSVjZ2a1ZMajJCMW0ya0N0R3JBRUd5Skk5MnlEeG1oUlBIa25qQ042?=
 =?utf-8?B?U0tkNVlDaUY4QXpkT3BTNXVUZkhGRnRhTk1TZlRURVFMV1ZlZDdWTFhXTERH?=
 =?utf-8?B?WGFOVDFVMVg2SFJvTHBUOEZ6L3VYNEpmSHFpZ2hIZjk3SG0xK25RQnFhUlBR?=
 =?utf-8?B?NDdGMVlXT0RkUmN3L2ZodzllV25mekswN3hqRGFBMjgvcXNJYm91Rml4NUpz?=
 =?utf-8?B?RVZmL3o5NDg4S3M3QWVZSlRjWmU0QmJoTUtQQy9sc3k5akhVamx0WW9EeGFi?=
 =?utf-8?B?RysyVlF1SlB3R3BqczcyWTc0VENwK0c2b1ZhYmJkcDl0eStqU0VSNDZqYmZa?=
 =?utf-8?Q?xvZ3wuUVQgH22bxniSAKlxKNh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dc8c36-2e0c-498a-f964-08ddc3a877aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 14:04:08.9217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXbQTAkiu0NCxMmFlLcumqanUawmfq0HTwmHNjMHJCH6T68v5tBfdpTl8XupLHox
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
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

On 15.07.25 15:56, Simona Vetter wrote:
> On Tue, Jul 15, 2025 at 03:43:08PM +0200, Christian König wrote:
>> We are about to revert this patch. Not sure if backporting it makes sense at the moment.
> 
> I think it still makes sense, at least as an interim fix.
> 
> What I discussed with Thomas is that first we want to revert back from
> gem_bo->dma_buf to gem_bo->import_attach.dmabuf everywhere. And those
> patches are sprinkled over various branches/trees/releases. So it'll take
> a while to catch them all. Meanwhile these two patches at least take care
> of the worst fallout, they're already tested and in the pipeline - I don't
> think it makes sense to hold them up and wait.
> 
> It might take us until 6.17-rc1 until we've caught all the trees and made
> sure the backports of those reverts have happened, and I don't think we
> should wait that long.

Works for me.

I just wanted to point out that the patch backported might be reverted again.

Christian.

> 
> Cheers, Sima
> 
>> Regards,
>> Christian.
>>
>> On 15.07.25 15:13, Greg Kroah-Hartman wrote:
>>> 6.15-stable review patch.  If anyone has any objections, please let me know.
>>>
>>> ------------------
>>>
>>> From: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> commit 5307dce878d4126e1b375587318955bd019c3741 upstream.
>>>
>>> A GEM handle can be released while the GEM buffer object is attached
>>> to a DRM framebuffer. This leads to the release of the dma-buf backing
>>> the buffer object, if any. [1] Trying to use the framebuffer in further
>>> mode-setting operations leads to a segmentation fault. Most easily
>>> happens with driver that use shadow planes for vmap-ing the dma-buf
>>> during a page flip. An example is shown below.
>>>
>>> [  156.791968] ------------[ cut here ]------------
>>> [  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
>>> [...]
>>> [  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
>>> [  157.043420] Call Trace:
>>> [  157.045898]  <TASK>
>>> [  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
>>> [  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
>>> [  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
>>> [  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
>>> [  157.065567]  ? dma_buf_vmap+0x224/0x430
>>> [  157.069446]  ? __warn.cold+0x58/0xe4
>>> [  157.073061]  ? dma_buf_vmap+0x224/0x430
>>> [  157.077111]  ? report_bug+0x1dd/0x390
>>> [  157.080842]  ? handle_bug+0x5e/0xa0
>>> [  157.084389]  ? exc_invalid_op+0x14/0x50
>>> [  157.088291]  ? asm_exc_invalid_op+0x16/0x20
>>> [  157.092548]  ? dma_buf_vmap+0x224/0x430
>>> [  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
>>> [  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
>>> [  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
>>> [  157.110697]  drm_gem_shmem_vmap+0x74/0x710
>>> [  157.114866]  drm_gem_vmap+0xa9/0x1b0
>>> [  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
>>> [  157.123086]  drm_gem_fb_vmap+0xab/0x300
>>> [  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
>>> [  157.133032]  ? lockdep_init_map_type+0x19d/0x880
>>> [  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
>>> [  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
>>> [  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
>>> [...]
>>> [  157.346424] ---[ end trace 0000000000000000 ]---
>>>
>>> Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
>>> this from happening. The framebuffer's cleanup later puts the handle
>>> references.
>>>
>>> Commit 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object
>>> instance") triggers the segmentation fault easily by using the dma-buf
>>> field more widely. The underlying issue with reference counting has
>>> been present before.
>>>
>>> v2:
>>> - acquire the handle instead of the BO (Christian)
>>> - fix comment style (Christian)
>>> - drop the Fixes tag (Christian)
>>> - rename err_ gotos
>>> - add missing Link tag
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/drm_gem.c#L241 # [1]
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Cc: <stable@vger.kernel.org>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> Link: https://lore.kernel.org/r/20250630084001.293053-1-tzimmermann@suse.de
>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> ---
>>>  drivers/gpu/drm/drm_gem.c                    |   44 ++++++++++++++++++++++++---
>>>  drivers/gpu/drm/drm_gem_framebuffer_helper.c |   16 +++++----
>>>  drivers/gpu/drm/drm_internal.h               |    2 +
>>>  3 files changed, 51 insertions(+), 11 deletions(-)
>>>
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -212,6 +212,35 @@ void drm_gem_private_object_fini(struct
>>>  }
>>>  EXPORT_SYMBOL(drm_gem_private_object_fini);
>>>  
>>> +static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>>> +{
>>> +	struct drm_device *dev = obj->dev;
>>> +
>>> +	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
>>> +
>>> +	if (obj->handle_count++ == 0)
>>> +		drm_gem_object_get(obj);
>>> +}
>>> +
>>> +/**
>>> + * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
>>> + * @obj: GEM object
>>> + *
>>> + * Acquires a reference on the GEM buffer object's handle. Required
>>> + * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
>>> + * to release the reference.
>>> + */
>>> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
>>> +{
>>> +	struct drm_device *dev = obj->dev;
>>> +
>>> +	guard(mutex)(&dev->object_name_lock);
>>> +
>>> +	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
>>> +	drm_gem_object_handle_get(obj);
>>> +}
>>> +EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>>> +
>>>  /**
>>>   * drm_gem_object_handle_free - release resources bound to userspace handles
>>>   * @obj: GEM object to clean up.
>>> @@ -242,8 +271,14 @@ static void drm_gem_object_exported_dma_
>>>  	}
>>>  }
>>>  
>>> -static void
>>> -drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>> +/**
>>> + * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
>>> + * @obj: GEM object
>>> + *
>>> + * Releases a reference on the GEM buffer object's handle. Possibly releases
>>> + * the GEM buffer object and associated dma-buf objects.
>>> + */
>>> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>>  {
>>>  	struct drm_device *dev = obj->dev;
>>>  	bool final = false;
>>> @@ -268,6 +303,7 @@ drm_gem_object_handle_put_unlocked(struc
>>>  	if (final)
>>>  		drm_gem_object_put(obj);
>>>  }
>>> +EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>>>  
>>>  /*
>>>   * Called at device or object close to release the file's
>>> @@ -389,8 +425,8 @@ drm_gem_handle_create_tail(struct drm_fi
>>>  	int ret;
>>>  
>>>  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>>> -	if (obj->handle_count++ == 0)
>>> -		drm_gem_object_get(obj);
>>> +
>>> +	drm_gem_object_handle_get(obj);
>>>  
>>>  	/*
>>>  	 * Get the user-visible handle using idr.  Preload and perform
>>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> @@ -99,7 +99,7 @@ void drm_gem_fb_destroy(struct drm_frame
>>>  	unsigned int i;
>>>  
>>>  	for (i = 0; i < fb->format->num_planes; i++)
>>> -		drm_gem_object_put(fb->obj[i]);
>>> +		drm_gem_object_handle_put_unlocked(fb->obj[i]);
>>>  
>>>  	drm_framebuffer_cleanup(fb);
>>>  	kfree(fb);
>>> @@ -182,8 +182,10 @@ int drm_gem_fb_init_with_funcs(struct dr
>>>  		if (!objs[i]) {
>>>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>>>  			ret = -ENOENT;
>>> -			goto err_gem_object_put;
>>> +			goto err_gem_object_handle_put_unlocked;
>>>  		}
>>> +		drm_gem_object_handle_get_unlocked(objs[i]);
>>> +		drm_gem_object_put(objs[i]);
>>>  
>>>  		min_size = (height - 1) * mode_cmd->pitches[i]
>>>  			 + drm_format_info_min_pitch(info, i, width)
>>> @@ -193,22 +195,22 @@ int drm_gem_fb_init_with_funcs(struct dr
>>>  			drm_dbg_kms(dev,
>>>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>>>  				    objs[i]->size, min_size, i);
>>> -			drm_gem_object_put(objs[i]);
>>> +			drm_gem_object_handle_put_unlocked(objs[i]);
>>>  			ret = -EINVAL;
>>> -			goto err_gem_object_put;
>>> +			goto err_gem_object_handle_put_unlocked;
>>>  		}
>>>  	}
>>>  
>>>  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>>>  	if (ret)
>>> -		goto err_gem_object_put;
>>> +		goto err_gem_object_handle_put_unlocked;
>>>  
>>>  	return 0;
>>>  
>>> -err_gem_object_put:
>>> +err_gem_object_handle_put_unlocked:
>>>  	while (i > 0) {
>>>  		--i;
>>> -		drm_gem_object_put(objs[i]);
>>> +		drm_gem_object_handle_put_unlocked(objs[i]);
>>>  	}
>>>  	return ret;
>>>  }
>>> --- a/drivers/gpu/drm/drm_internal.h
>>> +++ b/drivers/gpu/drm/drm_internal.h
>>> @@ -161,6 +161,8 @@ void drm_sysfs_lease_event(struct drm_de
>>>  
>>>  /* drm_gem.c */
>>>  int drm_gem_init(struct drm_device *dev);
>>> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
>>> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>>>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>>>  			       struct drm_gem_object *obj,
>>>  			       u32 *handlep);
>>>
>>>
>>
> 

