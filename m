Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA7797BE7E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 17:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CD410E5DA;
	Wed, 18 Sep 2024 15:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qu5q0BhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EB610E5E5;
 Wed, 18 Sep 2024 15:19:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FS/Wty2SnGfJDVyfWQ7iMo7VockQR3ACZDKQqvxL+VutaWwQcZKmGU+53hUbqr+qhbWjyjTMVHIQBPVIdUHlSjFX3UMKtoWO68cb2oRzpgtvDy9och+B+WeC4TBTvERycqXWwzw4w1iePwddvs/2w/9Mtz84Om2D69HF8zDs+zHpQCcjF7oDP+UqdwrAnNgI6SCFqbt8EghIzfPmQayBPMyWLeL+eS26ovpJZq6qsh3OSw1Om8Umsulsi6u9+yCq/WB0S5aRX8fYqtfAFbtAyCBrFsAYSRWJduS8hDNPiz/i5fzf2MuT7Ts5MSGdFWwQpLCtOafdVHyhdQQ73B5bNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cze8gnuxUanvY9fzYis4Ve+DXuVkfnvVemaMNtXbf1c=;
 b=L3rJb//4S7FKfbiRFk24vUK6fldboQ2mkc0Cch1ke7OoA3Qp//ZkRnEjNyPwHYviDLYOber6U8LaFKfZGALbXDrCenNoKL3SlKpA/MEjcNqWZb253oKByRfdni2AQqgpy9sMo2ity/NiJ0JhLx2KEG1r9M7kHI98ND/V5NqbVuhyBbXyPZ8kITl5q7mbuxk6OHrI6meCBf7aDBdLxl78K3LZ17Mx53NGxqwxxQflEPmtGuK82ZJSDcaWn9HztkEnBKufi0y7Qj1VlJoQrArVuYLzbjRbUMugWq76jK4dq5j//6FsElDzctagW0AEf2ad4f1uZJAtK4f2Zrkhyfihqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cze8gnuxUanvY9fzYis4Ve+DXuVkfnvVemaMNtXbf1c=;
 b=qu5q0BhZlt3MfOB9O93nboElvREivbrU1K93FansGvllSUpL+X7XkoOk8b3ffkUjO7EHL1BPOf4WyjZrAamBTfhNj4R7iIkxqdMyH0HAUPw4V144MJacigDAnCCGx1dhvPBFjFEb31aJnsSqlAEl1kBDOrn2hxk5N98iFIk693TAOGUJYBmUT9JH8kHVC9JMlfS7Nvr8FRqdxLPIcZJaxkPp1EspQtPqwjXvvOQJIuD7z2F3WdLIUbzdKMTnLzZUmNu24PfJheeZxsOw4bsNaVlt51qhfD4m1qO4ak86B93PmAOVA4Lsenz7DFOGJnRZgGJrSUs1uXUawHolyK56dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB7711.namprd12.prod.outlook.com (2603:10b6:208:421::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 15:18:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 15:18:59 +0000
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
 <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch,
 Philip.Yang@amd.com, akpm@linux-foundation.org, felix.kuehling@amd.com,
 christian.koenig@amd.com
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Date: Thu, 19 Sep 2024 01:10:49 +1000
In-reply-to: <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
Message-ID: <87msk5our1.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY6PR01CA0130.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eff9c57-b173-47fb-fafe-08dcd7f53806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U25WWHRDVGVFL0hidWEvRXlqSnJhUTB1Y3NGNnNWNmErQXNLV0FZYlN1blhn?=
 =?utf-8?B?b2NVRGs3N0hIaUozUVFQRW8rNTVONlhUdU1lK3hmbklxMGV3ZTF5RzhOYVJp?=
 =?utf-8?B?ekV1SEg1cTdRajZCbU9xRS9ONWhCcjBFakFaU3RBMExKcHNSTlA2RlJOUGxN?=
 =?utf-8?B?ZnN5WE5LSmpMdkc0WEhtTUFXN0NRNHZVbVN5NDZRd3ljRWE4TzJUU2JXNDJY?=
 =?utf-8?B?anphVlpyNFk4SnJBQkhhZytkY0srQXAvS1R2V3VNcnpXcnl1ZmtsUUF2c3JR?=
 =?utf-8?B?bzl6SnFMM2pvNzdUWW9WWEFnKzgrcExiblVNLzd0ck9GLzhIczVFbEZyWURB?=
 =?utf-8?B?VnJHeE9PcnBBR1dyN0ZUd251c0JSNEFLeFVDaFhaa0RKV0FzTkw2NGYvbjlE?=
 =?utf-8?B?dHdGbDJCTFRiUUY1SytEU3p0S1RrN05BSHJFM25BRG95ekZlNUFrcGpQR0Ix?=
 =?utf-8?B?dVhtcmh3cXI3MjROdFFhNUZlcjFrd1VBamVhaFNSVG9RTGU0OWE0OWdZTjZF?=
 =?utf-8?B?eDY3YzVqVVJsWDRUWE1hOEk3NHFSRXV2Ri9kd0Y2amdLNWdZd1FSaURUYmlF?=
 =?utf-8?B?Z3RCUWFFdEpuUk85RDgrRjl3d25xVzhXc29tTW9NMEZvcDdhbHh5ZDNMTW1P?=
 =?utf-8?B?anNzQnpIT1d3T1ZkN29nT2hzcW1vRFQ2Q25vOU01YytlOElpZG4vYzhKRDVR?=
 =?utf-8?B?bFREdDR1OUs4Q2NRbG5ZTVIxVnlaeEM1MitTWVh2Nm4xaGVJOGVhTTdURXJB?=
 =?utf-8?B?cFE2a0R1aEdSKy8zeWlGZnloUmpvNURHZzlvcVpQQXNhbU81R0JlRFZsaHhl?=
 =?utf-8?B?S0dTOWN4bXF6MEd6TTRPMS9Ddkk0ZkNpS0lQbitXbmtyRGVDKzBnNGc2b25Y?=
 =?utf-8?B?NTFmVjZwOVBkYlhRSmVUMkRCREd3VE1ucHcxbXFDOTgrQnQvd3JzcGtFZXZr?=
 =?utf-8?B?ZDM0TEJXazVHWXQrdXNlMzUyd1BnOEEyS0NONXdaSXRKdm1NeEVxNDBHUnBq?=
 =?utf-8?B?dHpxRDlZUDFHSndJMENlb3FpLy81MVRyK1Q4WS9kVklZL3oxajQ3dWJpL1Iz?=
 =?utf-8?B?NUdleTNUZUd1ZXp5WWRVZ2FGYy9SQzdoejE1ZmY5V0ZhSWZsOWEvelBwZjlD?=
 =?utf-8?B?UGhvcVM2VW9RTSsyL084Wm8vakdqNTJwSHh3RCtlOTVhMEFxTXlZUkphQ25r?=
 =?utf-8?B?cjZQVEUrR2NPWWJJS09GU1JlTU5xd094VWNlZldMaThUanoxd2g3RHowTjRR?=
 =?utf-8?B?aDdhS29oVlJySyt4VnNIdlgzUVk4cHNPZUdPYnRCb1Bod2U3NlJqYlV2ZFcw?=
 =?utf-8?B?cEcwaWpRUWxrM0VGRldjQWFaMjBLR21uT1ZKSExHczlsOXhQZis3NGdvNC8y?=
 =?utf-8?B?SUVEOFQzeE5lYzZGdElPVVpML2tqbi8vVlMxZ1ljWEFuMzlyV1ZlS2V4UjVT?=
 =?utf-8?B?V0lVYVdCbEdYQTVUQlk3QUMxMS8zMDc0azJVS2JHeXdyVExPR0hDdjZJZWRM?=
 =?utf-8?B?V3hkVUFVSWUzenFGVGN0dmhkYlFMcnRjK0dRSThtZ2hNRzFHbjFiY3czOVRC?=
 =?utf-8?B?VG5RT29RK29XMGdpV3VjaDVTVkw3N2R0ZGVpamsram9mTkFXUHQyTU1yWThF?=
 =?utf-8?B?dkd6SkZRd0xiQ1BsbzdqeHVSL0VWT0JoN0NJTFpTU01sNW9TZFRXUWx6QnVm?=
 =?utf-8?B?amxqTTg3a1ZuTUNBSVlDTnBJVm80YWR0TDd4aFBrTXcxTFdtdEtudUZKaUJH?=
 =?utf-8?B?dDQrMUVKb2dUYmJlNFN0Y2ExY25IUUhMaUJ1M3k5cVZ6dUJnM3crNkd1UEx3?=
 =?utf-8?B?KzF3MjNLL2JLVjQ1RUlQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHBiclVXazJIWG1FY3poUzFnM245emNFRmcxUmxrZVIrWFByTWMxeWpKY25O?=
 =?utf-8?B?V21WUE1va0w5NVU2QnNYTVUrUVNNWGx0Y0pjVHNMOUl2RzIweW05bExaeUJ6?=
 =?utf-8?B?K3VBd1JjdzhlZzFHV1RLcy9hV0RqS3U1Z0hDNTNzUmRObGlFZ21XRit5YThr?=
 =?utf-8?B?S1J0QnRFaVU0Zk1EWGtlT3N1bHRUR2dqUnhCQlR4bHJkRVpwdUdwMzVvVXVZ?=
 =?utf-8?B?Y21QR2h0aFE3dENxak5xaXlIQTZIQUJiVlpmNWRJRHp0dHR4cGx6K0NjL0dK?=
 =?utf-8?B?ZTk0UDZaa3VUei9sMUowTTc0a3plYlJuY1F6UE1Bck9aSStLM0dxR1dBY3dY?=
 =?utf-8?B?WW00b1ZlWDRpeDdPZzFFWHRLZkxJTmVYaTlDc0pOOGp2Vm1BMU5BUHVSdGRz?=
 =?utf-8?B?QkhDYks1VXVxd0lQN3EvN2M2YjhsZ0hzcG1PWGRQM3d2V2Y5REJaM1ZqUFdK?=
 =?utf-8?B?UVdKeFI0TGtOWU9Uc0Z1ZnV6Uzl6V0pBSEphSk9UVDBtM3hVVDd2bVljaFhL?=
 =?utf-8?B?cERLc0tLY1lHN2xRSStsTW5LcStYcHdTQTJIOWtveUhkUkFUVkZXM3NFYmVW?=
 =?utf-8?B?OXZZL1hxRkcxaDFCWjNpMGNKR3piY1l6bnMvZmVmZVZwaWZXa1NpeUZLaEFy?=
 =?utf-8?B?aDV1YkZpYmQ3clFHUFVNNUZPTzA1MDIvQktpTGh0SCs2Q1lsRzBiSE5qcGRv?=
 =?utf-8?B?cDZ1cjY3cE1PSVZuY04rMGdGWjRHYzBLYXFIVzAvRERORWs2Vi93SEVSREc5?=
 =?utf-8?B?aXZ5d3pKcEh1UjZkTlZQWW50cWlTNkNWQ1YxRzI0cGE2N2dSWnNnek1POGFq?=
 =?utf-8?B?a05oWkxLQ1hwRnZtRVVRYXN6bVFSSVJxaG1EUUtvREpZTm1HcjhOUEVwelh4?=
 =?utf-8?B?Y3lySEVvZk9uYzFpd2V6U3gxRHY3R2VISFkxWjRjZ29taE5VWGg1UktEVGFu?=
 =?utf-8?B?UkJZL2JBUHVwajdyVGNFWCtFaDR0MU9nRWZrYmc0c2RkTTZ2dlZBWnVLSUo4?=
 =?utf-8?B?NWtlQzQ2Vlg5dm1JZFNHTnFRV2wrV2I0Z0hESnNNU1FTcXlxQ044NnpjbW9O?=
 =?utf-8?B?Zjlaayt4ZitXK0YxZkpvaDJ0OWl5bE04MytLRUVvNjVSemN4KzNtZDJ0eEov?=
 =?utf-8?B?S2RNWWNzSDA5ME9CK3JWbklEUWNVNWpRcnNOejdGT2FXN1Jvc0YwZDRYWW4v?=
 =?utf-8?B?aWN0MHhKeUNCUkpPczBjVE5ta3lNRXlma1oyWFZTSmdScm9tRmFNYnZpTmhx?=
 =?utf-8?B?elhXb05pQVpNaW9BdmhyUm1ZTDhaWDZzUVBVQnlwYXJ3WlJTaTg2RnhSdlo3?=
 =?utf-8?B?a3hwbkFqOC9lSS9pbWF6Q3ZoVHB4SzhBNHY0QmRpcGtkYllCMnp2cm44MGF0?=
 =?utf-8?B?RWdBSzRTTWhaM05CTVVNMEdLbXl2MGZLQ2p0d0dEcFdmV0xzQWV4cjMwQTQ1?=
 =?utf-8?B?ZzV0STVtV3p0ZWVMcENBdllQbmNpSmdiWUJ5ZjcvRGRVMEpkdkptbklweG5N?=
 =?utf-8?B?cmpvU1MweUFPMVJBd05PRmYzMnZ6RVk4ZFFEMHhCZXlXeEZ1NEt5eThTcEdF?=
 =?utf-8?B?eHdjOTYrMUcwaTB0K0FsZlViSG9pSVdFUkVuUmdiOFB1TG9XV3RvRG50MXo4?=
 =?utf-8?B?NE9UYmNibkZIMi9RQ09KRU5kTzNncmppVEQ5ZGM3Y1k0Y0RYRnZoRHptaGVk?=
 =?utf-8?B?NlY1dTRzc1dvbFJ0T2ZLN0V5U2oyZ1hoQTJCZklDdjU1RHg1aVlkWURBOVVN?=
 =?utf-8?B?VFptd2tuZ05mRmFGQTNJcE42eUZNNVU3S3ZNYVdvKzFjZVNPckJVZWFONVRq?=
 =?utf-8?B?OWp1bEt3aVFMR2VxNkNKQk43MENXVEthb290dE4xY2svRkRZMUtueUk4MWQ3?=
 =?utf-8?B?Z2dEbVVtZGVIQkpiSkNiclNEZnk5R09HMGd0emxVbVd1a0xtVElxeXJWOFpX?=
 =?utf-8?B?bjBPOVYrYkw0SU5ZUzBNOEVOZ1hTTzdESEdmR1R6SERoaDVzQXhaNGdJTkVm?=
 =?utf-8?B?UzNpeVVWUFpXbVJJSFFhc0w0V1NCSWUvc1hrZXI4WVV5NE1YanpZby8zVlB0?=
 =?utf-8?B?eUpaTG1jVUo2elYxc1I4bWlzQTQwRXh4bmFGeHlMSlZZRnRhTjZuS25Na3Iy?=
 =?utf-8?Q?jjcoqnpUpIHE4A5ncIISC/6EJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eff9c57-b173-47fb-fafe-08dcd7f53806
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 15:18:59.2815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qr65yZzYOswJOKxVO43ZKvBNQE5ctvUqNIsSgM9w0Ul/q35lDO2lI5OabGbm7FSpkDWJdDizHqFWoWtAhzf2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7711
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


Matthew Brost <matthew.brost@intel.com> writes:

> On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
>>=20
>> Matthew Brost <matthew.brost@intel.com> writes:
>>=20
>> I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
>
> Still a driver.

Indeed, and I'm happy to answer any questions about our implementation.

>> but theoretically it seems like it should be possible. However we
>> serialize migrations of the same virtual address range to avoid these
>> kind of issues as they can happen the other way too (ie. multiple
>> threads trying to migrate to GPU).
>>=20
>> So I suspect what happens in UVM is that one thread wins and installs
>> the migration entry while the others fail to get the driver migration
>> lock and bail out sufficiently early in the fault path to avoid the
>> live-lock.
>>=20
>
> I had to try hard to show this, doubt an actual user could trigger this.
>
> I wrote a test which kicked 8 threads, each thread did a pthread join,
> and then tried to read the same page. This repeats in loop for like 512
> pages or something. I needed an exclusive lock in migrate_to_ram vfunc
> for it to livelock. Without an exclusive lock I think on average I saw
> about 32k retries (i.e. migrate_to_ram calls on the same page) before a
> thread won this race.
>
> From reading UVM, pretty sure if you tried hard enough you could trigger
> a livelock given it appears you take excluvise locks in migrate_to_ram.

Yes, I suspect you're correct here and that we just haven't tried hard
enough to trigger it.

>> > Cc: Philip Yang <Philip.Yang@amd.com>
>> > Cc: Felix Kuehling <felix.kuehling@amd.com>
>> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> > Cc: Andrew Morton <akpm@linux-foundation.org>
>> > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> >  mm/memory.c         | 13 +++++++---
>> >  mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++-------------=
-
>> >  2 files changed, 50 insertions(+), 23 deletions(-)
>> >
>> > diff --git a/mm/memory.c b/mm/memory.c
>> > index 3c01d68065be..bbd97d16a96a 100644
>> > --- a/mm/memory.c
>> > +++ b/mm/memory.c
>> > @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>> >  			 * Get a page reference while we know the page can't be
>> >  			 * freed.
>> >  			 */
>> > -			get_page(vmf->page);
>> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
>> > -			ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
>> > -			put_page(vmf->page);
>> > +			if (trylock_page(vmf->page)) {
>> > +				get_page(vmf->page);
>> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>>=20
>> This is all beginning to look a lot like migrate_vma_collect_pmd(). So
>> rather than do this and then have to pass all this context
>> (ie. fault_page) down to the migrate_vma_* functions could we instead
>> just do what migrate_vma_collect_pmd() does here? Ie. we already have
>> the PTL and the page lock so there's no reason we couldn't just setup
>> the migration entry prior to calling migrate_to_ram().
>>=20
>> Obviously calling migrate_vma_setup() would show the page as not
>> migrating, but drivers could easily just fill in the src_pfn info after
>> calling migrate_vma_setup().
>>=20
>> This would eliminate the whole fault_page ugliness.
>>
>
> This seems like it would work and agree it likely be cleaner. Let me
> play around with this and see what I come up with. Multi-tasking a bit
> so expect a bit of delay here.
>
> Thanks for the input,
> Matt
>
>> > +				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
>> > +				put_page(vmf->page);
>> > +				unlock_page(vmf->page);
>> > +			} else {
>> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>> > +			}
>> >  		} else if (is_hwpoison_entry(entry)) {
>> >  			ret =3D VM_FAULT_HWPOISON;
>> >  		} else if (is_pte_marker_entry(entry)) {
>> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> > index 6d66dc1c6ffa..049893a5a179 100644
>> > --- a/mm/migrate_device.c
>> > +++ b/mm/migrate_device.c
>> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> >  				   struct mm_walk *walk)
>> >  {
>> >  	struct migrate_vma *migrate =3D walk->private;
>> > +	struct folio *fault_folio =3D migrate->fault_page ?
>> > +		page_folio(migrate->fault_page) : NULL;
>> >  	struct vm_area_struct *vma =3D walk->vma;
>> >  	struct mm_struct *mm =3D vma->vm_mm;
>> >  	unsigned long addr =3D start, unmapped =3D 0;
>> > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> > =20
>> >  			folio_get(folio);
>> >  			spin_unlock(ptl);
>> > -			if (unlikely(!folio_trylock(folio)))
>> > +			if (unlikely(fault_folio !=3D folio &&
>> > +				     !folio_trylock(folio)))
>> >  				return migrate_vma_collect_skip(start, end,
>> >  								walk);
>> >  			ret =3D split_folio(folio);
>> > -			folio_unlock(folio);
>> > +			if (fault_folio !=3D folio)
>> > +				folio_unlock(folio);
>> >  			folio_put(folio);
>> >  			if (ret)
>> >  				return migrate_vma_collect_skip(start, end,
>> > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> >  		 * optimisation to avoid walking the rmap later with
>> >  		 * try_to_migrate().
>> >  		 */
>> > -		if (folio_trylock(folio)) {
>> > +		if (fault_folio =3D=3D folio || folio_trylock(folio)) {
>> >  			bool anon_exclusive;
>> >  			pte_t swp_pte;
>> > =20
>> > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>> > =20
>> >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
>> >  					set_pte_at(mm, addr, ptep, pte);
>> > -					folio_unlock(folio);
>> > +					if (fault_folio !=3D folio)
>> > +						folio_unlock(folio);
>> >  					folio_put(folio);
>> >  					mpfn =3D 0;
>> >  					goto next;
>> > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned=
 long *src_pfns,
>> >  					  unsigned long npages,
>> >  					  struct page *fault_page)
>> >  {
>> > +	struct folio *fault_folio =3D fault_page ?
>> > +		page_folio(fault_page) : NULL;
>> >  	unsigned long i, restore =3D 0;
>> >  	bool allow_drain =3D true;
>> >  	unsigned long unmapped =3D 0;
>> > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned=
 long *src_pfns,
>> >  		remove_migration_ptes(folio, folio, false);
>> > =20
>> >  		src_pfns[i] =3D 0;
>> > -		folio_unlock(folio);
>> > +		if (fault_folio !=3D folio)
>> > +			folio_unlock(folio);
>> >  		folio_put(folio);
>> >  		restore--;
>> >  	}
>> > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>> >  		return -EINVAL;
>> >  	if (args->fault_page && !is_device_private_page(args->fault_page))
>> >  		return -EINVAL;
>> > +	if (args->fault_page && !PageLocked(args->fault_page))
>> > +		return -EINVAL;
>> > =20
>> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>> >  	args->cpages =3D 0;
>> > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migra=
te)
>> >  }
>> >  EXPORT_SYMBOL(migrate_vma_pages);
>> > =20
>> > -/*
>> > - * migrate_device_finalize() - complete page migration
>> > - * @src_pfns: src_pfns returned from migrate_device_range()
>> > - * @dst_pfns: array of pfns allocated by the driver to migrate memory=
 to
>> > - * @npages: number of pages in the range
>> > - *
>> > - * Completes migration of the page by removing special migration entr=
ies.
>> > - * Drivers must ensure copying of page data is complete and visible t=
o the CPU
>> > - * before calling this.
>> > - */
>> > -void migrate_device_finalize(unsigned long *src_pfns,
>> > -			unsigned long *dst_pfns, unsigned long npages)
>> > +static void __migrate_device_finalize(unsigned long *src_pfns,
>> > +				      unsigned long *dst_pfns,
>> > +				      unsigned long npages,
>> > +				      struct page *fault_page)
>> >  {
>> > +	struct folio *fault_folio =3D fault_page ?
>> > +		page_folio(fault_page) : NULL;
>> >  	unsigned long i;
>> > =20
>> >  	for (i =3D 0; i < npages; i++) {
>> > @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pf=
ns,
>> >  		src =3D page_folio(page);
>> >  		dst =3D page_folio(newpage);
>> >  		remove_migration_ptes(src, dst, false);
>> > -		folio_unlock(src);
>> > +		if (fault_folio !=3D src)
>> > +			folio_unlock(src);
>> > =20
>> >  		if (is_zone_device_page(page))
>> >  			put_page(page);
>> > @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_p=
fns,
>> >  		}
>> >  	}
>> >  }
>> > +
>> > +/*
>> > + * migrate_device_finalize() - complete page migration
>> > + * @src_pfns: src_pfns returned from migrate_device_range()
>> > + * @dst_pfns: array of pfns allocated by the driver to migrate memory=
 to
>> > + * @npages: number of pages in the range
>> > + *
>> > + * Completes migration of the page by removing special migration entr=
ies.
>> > + * Drivers must ensure copying of page data is complete and visible t=
o the CPU
>> > + * before calling this.
>> > + */
>> > +void migrate_device_finalize(unsigned long *src_pfns,
>> > +			unsigned long *dst_pfns, unsigned long npages)
>> > +{
>> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
>> > +}
>> >  EXPORT_SYMBOL(migrate_device_finalize);
>> > =20
>> >  /**
>> > @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>> >   */
>> >  void migrate_vma_finalize(struct migrate_vma *migrate)
>> >  {
>> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages)=
;
>> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npage=
s,
>> > +				  migrate->fault_page);
>> >  }
>> >  EXPORT_SYMBOL(migrate_vma_finalize);
>>=20

