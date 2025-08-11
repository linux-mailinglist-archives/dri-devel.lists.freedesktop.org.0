Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B01B20892
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 14:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6551710E398;
	Mon, 11 Aug 2025 12:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DA0aw+dE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3083210E398
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 12:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdCyNDhTYtq1wHMiRovtY0kOiHHaAc9FUrIqI88sCpkOcaNLIZxSHZsArfFowXSvoW0mzM44O6w3ptJ8DC3U54akLbNSQtVvu2tvRrInbx236yH2clTmsP1KbaRAZGgbyj9bmhZdgDaJ6VH7kgkN69NA7NEVfbByEJ+w7DSE+nj+AgR8Y80/0R1rrqRg/N7kOeMl8urkeDyzTiiNwMMYrfJGWY6tLH6rkz1RUy+sciakRI3QLj8/fAa3DyXG0KV7fOPd15DG1PQB0RuGVOTSsc0rrblfkVys5nRlKBu2yeXS6AT9nn0yUmBuSNnJmxl5JTj4h+L7z96yjcc/6BSzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDqvUg2m634gCXopa1qtgRR8o3aYb0osgVA+7PbLlv0=;
 b=dgPfInEGSMeTsi6UGvjDx+J8zl9oP+YJFNCPDZYmPqSMQkmteAkl/URSGxVYl0sUqi1CvYt+YuJo7VaaFs+/KGZgqG7NNnAkCdMNdCtL3r6s76wKBLg72stTZVcWPWG4/JFR63HZRgtyOgJamXR4yPkIGdNher5EaEovSCvawcjln0AIlpFFmIuWTWRd53hviHksjzV8PT1djkbLnSfe64xqzTem7NAP1xsrYrh3rpRCkMleLZWm9q87KFCodmQW7VREHWmeERgeYFqzxk3nk2GQCby9JAiHI06orEZUbsP3ENabuf4yRKenIAWALmnjjqxPI6Ciu8zLrNj2OSFy7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDqvUg2m634gCXopa1qtgRR8o3aYb0osgVA+7PbLlv0=;
 b=DA0aw+dErmWCWDr4eo8KepCNBZHxMlFn6A//+4nupzHK7jltLL8QdXMqtesGDi5irzM2gkHKHKBv/TdAn0bZc5ta/MfS44mRaRedFthlQIH96GFMWd/aSs7bvdGQs9v50XW6ToTDtaymb2hSsfAyQ1POCxG3gBTH2DgNbQann8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY1PR12MB9649.namprd12.prod.outlook.com (2603:10b6:930:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 12:16:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 12:16:37 +0000
Message-ID: <323722ba-257a-4808-b369-5b9e35435fda@amd.com>
Date: Mon, 11 Aug 2025 14:16:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission
 during process kill
To: "Liu01, Tong (Esther)" <Tong.Liu01@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "phasta@kernel.org" <phasta@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>, "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "Ba, Gang" <Gang.Ba@amd.com>,
 "matthew.schwartz@linux.dev" <matthew.schwartz@linux.dev>,
 "cao, lin" <lin.cao@amd.com>
References: <20250811072050.3838241-1-Tong.Liu01@amd.com>
 <b2e02500-0d50-4d84-8ec5-fb8cb753c91a@amd.com>
 <DM4PR12MB613427A4B81ED0A910B530B59028A@DM4PR12MB6134.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM4PR12MB613427A4B81ED0A910B530B59028A@DM4PR12MB6134.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY1PR12MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc5cf10-1adf-4131-852a-08ddd8d0eb9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDF2cTZFWDEvVnUrZlRWcFZzTXpzdnJlcHJuL2ZOMmFOUzNJaVM0NkZGZ1M4?=
 =?utf-8?B?NG52YUI2czlES1FwKzRXSzc2dlYzS0xXemtxV3JQRzNwMFE1c0NJV1ZFcGlS?=
 =?utf-8?B?STY4MHljMDRBejBxbitLcXVEczZjZGpBRm53c1lyTzhCSENNYkt3WGZ3SXcw?=
 =?utf-8?B?MjRNcmdQNXlmY204VHk5MGM3VGx5ajNmWWxIeng1aXpiS0JVUWZmbE5VcFJi?=
 =?utf-8?B?Q3Z4NG10TXNEZ3NwTTNyQ2E2LyswS3ovcnVwTFEwdFhOVTV5UFhYZERvZkpx?=
 =?utf-8?B?c3RyN1hrWHpQU1YzMnl6cTg3R1BhUmM4Z05vdWZBMHVJV2lQTk5WTjJvWUkz?=
 =?utf-8?B?dm1ya1d2K2NRRGRhRk91Vm83U2piQytkOEpvSU52SkxmT0pqdTdIaVkwejht?=
 =?utf-8?B?aFNUczlrVW40Z0ZIR29Ca2dDRmN2Q3BrdTlLYjllSmxneXo2YkpHQVZYRjhV?=
 =?utf-8?B?eHdNakcrcGdmVGNiSjE3aFdxT0hJdFFWaGFFWHpqNFQrc0p6Z3dmUWIwdXg4?=
 =?utf-8?B?dnFXY09ZejdDOWdSamhwV21WTDlNTHA4WEdwK3FNaDk4d2IxY1J1VmVjMmd1?=
 =?utf-8?B?bW1vNWVwcTlQbEtPeGRiRWNmSFRwV0NtZy9hUFZlY3ArV1JKNWhLMEY0azZk?=
 =?utf-8?B?QlRvTEcrakg1OTdFRGl1RWtOTElldVd0eFRReVp3bktzeDFjM2d3RG5nY3h5?=
 =?utf-8?B?TmZDVVlFVk9tdXZQSi9vSTU1N2RRWWd4MnBZTU5EUEs5Y1pGVGVLQm82UTBB?=
 =?utf-8?B?V1VIRW1NdVNwWlArRTNnWU1Vc2hKZnpQKzduemxiV05ZVFJ2aXFJYVFxUnZu?=
 =?utf-8?B?Skk2dEpsN01CSVYyb2MreG5URnAySTJPN3VJTVNJMDcxajI5WGFxQlhNU3U1?=
 =?utf-8?B?eDRqV0hTWXEwYWdaMWxKeklnTmdXNHRKQXc0L0FYOUY3L0lLdzc3bU51U3NC?=
 =?utf-8?B?Tm01YWIyVy9UNHJqRXF3dVhyZ3VKamM3Q3Z1cWdjRmlLazJPWG9vZE5tekts?=
 =?utf-8?B?MElkQ3BDY3dJRDU2NGpSVmQxZWRkcmp3MmxoZVlvamdMSkhTdGZueGNKcWN3?=
 =?utf-8?B?bUQ5SWNYM0wzU29XbURoY1U4dXhQUklJUmh0bFB1K2pmQTJ5MEVSWlhOdnpV?=
 =?utf-8?B?QWUzSkxaOVRyV053S2VJQ2VmcUZ5bWZReUVwSXAydng1Um9KQmZuSUFmNnFv?=
 =?utf-8?B?bVNYbTRFS1EyZ0haOXZaTkQ1d29BUEpjaktoOFRveVlPblliV1V3Qnl6Vk9G?=
 =?utf-8?B?V3d6aGRJbXBOck9rS1ltaUJlRGkvVVdVdlpOY2dPTWN4bEV4Y1IzWDdDOUk3?=
 =?utf-8?B?b2RodFk2VlFXODBWY3pqV2svL014MTg1aHRJcnRyK0FlS1l6S3RHRUtBejRL?=
 =?utf-8?B?RXFJOExtQkROcjdpWGxKK3BxM1o3Zjh0SkJ3MDBGOXFONG9PSjhTN3drN3Ry?=
 =?utf-8?B?SlRmZjdiN2YycFZuNXNUV1hHYXdRSnkrVWhKRStEZW5mcWdSME9CTVhUQUUv?=
 =?utf-8?B?OFJKVmlDYkZ0TmdpNk1NcDFJNjRrNCs1VnpPSUhZNmJrUnR0WnJPbjN1M2E4?=
 =?utf-8?B?OS9LcFhGV1NLSjU4MkNJR016MUFVZytjQnlEMmJ0K0h6N2U3OS9QVXdzUmo5?=
 =?utf-8?B?SGdtcFZXcXdhSU9jTysxakpNT2g0bjZsR2kwZHN6NFZCdFQ4RGRmY1NtRVVC?=
 =?utf-8?B?WlpUd1F4eTM3djhKbGZlSm1sbm9YTnhwQzh4bFQyZ1dtMHJDRzhJYXZ0TlMx?=
 =?utf-8?B?OUljakxqV0tjOGZlQXVVQTFleWhXZ20zS3dnOFhNd09kQTFTRDIwOGVhbmFF?=
 =?utf-8?B?c2o5TUZJd2IvNUEwb1QvSFJOcG1JNWZuTUlrRkdXZ3FoRzhJOFF0RlJlbXZP?=
 =?utf-8?B?aVlqT1BoelcvTURYTXJHaHJaMkdzVUtzQlMzUGpTVFY1NFVzUFVBaXJhZ3pJ?=
 =?utf-8?Q?h+kBM7UX88I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkFUV2tuaWFLZ1lNQmRmVmVwVy9vbGFXMUVjd3pkQ1EwVUFETXBXSENjSmFn?=
 =?utf-8?B?bzAzelVJZmw5Q0ZCMUpzb1R2bGR6UFl1SHMxeEZ3WHhsbTk5OWx5dlF6SWxN?=
 =?utf-8?B?VnN0NFI0eWhSTGhocGFuVEk1cEVTZmZJQVRwY2JMTFRXNnFYSkNrMFI3b2xG?=
 =?utf-8?B?RkVZRFNGZGFjMHJVNGl1WThRVlhzbFo3Q1lzZnBnRmkwb0hKakQ0RXNtTzN3?=
 =?utf-8?B?Y3NPMndYQ1NFYkNwR1I2aGVKWUxoSjZYTWJ3TFpCNUVqTzdrOU9NVnBHSWc2?=
 =?utf-8?B?bUhWNFlWM3crbVBMR3N5b3FnU3prOThNYzBYa1NTWTNBSzlCZk9jTlZML1ZZ?=
 =?utf-8?B?MEtxaTViRkdJdWgrUytWd0ZZc3plY3UxdU9YZXA5dzNiZ01mVlFQRm93Q3R0?=
 =?utf-8?B?cFJiMDVHRWtXa2I2ZDhMd2krbE41VzVqK2dKMlphNStPL3l3Z01iM0l0S3Vn?=
 =?utf-8?B?UDlwNjg1ckhobndtM084cTlza0hDRnV6Sk8yQXlQUmxnWWtBZkVpRy9EM2Fw?=
 =?utf-8?B?bm14bjNGL1RnSUhrZHRtdWZ0aFNuNVNMcWQrNkQ2YXZLV21KZ3B0M0J4Sndh?=
 =?utf-8?B?bXFPNFVQYmNoT3NCc0ZHVmFHdGt3dmNjZEZ5RzlJemVzb2UxR0NMbXpocWUy?=
 =?utf-8?B?QmpJSlVLYXJWL1REaHYwTXVsVWphWWJxSmpWckw4aFhKQkJVbjZrbWU0Vm1w?=
 =?utf-8?B?bXhJV1d6aEQvZnh2R2d5OGFERG9jajlBODB0bjBZUjVNY0daQWRFSUhRUlVN?=
 =?utf-8?B?Vyt0QThSL2RleE1xNjFodU5IeU4vclFiMFZPNCtuRE1yK1Fmb0RCd1IxRFh0?=
 =?utf-8?B?ZktUVnE3a2xPNnlLK1BvdCtJRmZpSG5LLzJVTkFtbHFIT0poV0xYb0JMRS8v?=
 =?utf-8?B?VUFYTHhqbVk2TUpaK3Q2STJNWTRqNjd1Y2F1SUFRaGYyaDBvQStNVUxVcEdN?=
 =?utf-8?B?cEt2Uy95K1NraUx3R052d1psemlLbGVBUnFPbVBsVjFENVk2TytWNDQ0UmE3?=
 =?utf-8?B?dmRER09oa0h1Q0kwU3NiVjQySkJmOS8rek5QNGpIbmlLMlVIdDlmcVVuVzdq?=
 =?utf-8?B?VTBJbnNub0VPdlVIQnI1N29kZ1k5blN1dGhkL2VmUHNHZG16MDF0aG5FS2o2?=
 =?utf-8?B?M1RkTTYzMFVJdG1xN3g4elZ3WUcvVnRLSGp0elQwbmFjUnA1S1RTUHQ1cVFS?=
 =?utf-8?B?RHZUNW1rekM0VmdUYlpIdVI1SmZISVB4cDFlbnQvbjJxWXkyMnFYYjU1Smwy?=
 =?utf-8?B?Q2RzUkJWWHdhK2phVE9RUkp1MFFtcEZGbjFNVjByM2sva0hQenVQR1IyS0xj?=
 =?utf-8?B?VGhuRE1BVENaQXQ2RXRmQkNBR2pFOENhbFNGaWJNaUhyeVZpTHRhWEpxQ3lN?=
 =?utf-8?B?d1JsRnJwNktySkZIWjhLUlhiY0NOcmNrMXlGdWh2YVQ2dzdROE9HdHNwOTJP?=
 =?utf-8?B?MTgwbUo2bEMvOHVxS0JBSWhVRnMvYnY2MS9pZWhINy8rNVN5SHZVNGp4dExw?=
 =?utf-8?B?WEFlY1R5TFp4R21iODdwZ1R6M1N1Lys3YXlwUGNtbDBNcmpSQk4zSk1Uc01B?=
 =?utf-8?B?aXljbEYvOVlEOU0xRkkxNzczNWNFdldzNjQ0Sm9uREFacnB5bko2VmtRSmxa?=
 =?utf-8?B?b0NFejlaeE4wVkt1S3NYaEFjZUZBKy84K0xSZU1jejB4akZ1Mm9UNmUwNWdx?=
 =?utf-8?B?S2s0V0c0OTA2VVRTSWw1QiticTlpVERwdWREbWN6cHRZRWhqZDBMR0ducUN4?=
 =?utf-8?B?MGxxbVVpc1ZHZU9PaGdKVnYwV2VjZDl2Q2xIbGdud1poR0h0bVZUcERnQVFE?=
 =?utf-8?B?TXVJUXVzb2hSWkltSXcyTGZGaUdseXZCYUExL25UU3Z4MjV1a1VoZ1JjNjlZ?=
 =?utf-8?B?K01yVUxoOWhRUVN3ZVpVa3I3Ymo3Q2Z3S3JnQk9TVXozVFUrdDdIbHQ3NHRK?=
 =?utf-8?B?M1djOEc1dlE3WVNGcnlGVm5uU2ZEbTQ1d3lRMG5ZWHQyam9aMVhadDk5YUor?=
 =?utf-8?B?S3dTdExQM3JFRXJzUm9oQmxGQ3JUcWNVVTB6eTFKRlZLNDdnbk1TdHlERnU1?=
 =?utf-8?B?cE5ac3kxcUl5bE45b3Zmd3dPUTYxTkMvb0ZKOFlrazg0YUdNdmkzOXlCeHNi?=
 =?utf-8?Q?Hm/yH79WEwf9PfJBd0pFUlxoC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc5cf10-1adf-4131-852a-08ddd8d0eb9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 12:16:37.5965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rupel3GxAoLYqn6rNl8tZ7QvrZl5Hj5ieGbqABVmLUeEkUDq6zodaWN0edRjfcxs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9649
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

Hi Esther,

but that is harmless and potentially only gives a warning in the system log.

You could adjust amdgpu_vm_ready() if necessary.

Regards,
Christian.

On 11.08.25 11:05, Liu01, Tong (Esther) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Christian,
> 
> The real issue is a race condition during process exit after patch https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1f02f2044bda1db1fd995bc35961ab075fa7b5a2. This patch changed amdgpu_vm_wait_idle to use drm_sched_entity_flush instead of dma_resv_wait_timeout. Here is what happens:
> 
> do_exit
>     |
>     exit_files(tsk) ... amdgpu_flush ... amdgpu_vm_wait_idle ... drm_sched_entity_flush (kills entity)
>     ...
>     exit_task_work(tsk) ...amdgpu_gem_object_close  ...  amdgpu_vm_clear_freed (tries to submit to killed entity)
> 
> The entity gets killed in amdgpu_vm_wait_idle(), but amdgpu_vm_clear_freed() called by exit_task_work() still tries to submit jobs.
> 
> Kind regards,
> Esther
> 
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Monday, August 11, 2025 4:25 PM
> To: Liu01, Tong (Esther) <Tong.Liu01@amd.com>; dri-devel@lists.freedesktop.org
> Cc: phasta@kernel.org; dakr@kernel.org; matthew.brost@intel.com; Ba, Gang <Gang.Ba@amd.com>; matthew.schwartz@linux.dev; cao, lin <lin.cao@amd.com>; cao, lin <lin.cao@amd.com>
> Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission during process kill
> 
> On 11.08.25 09:20, Liu01 Tong wrote:
>> During process kill, drm_sched_entity_flush() will kill the vm
>> entities. The following job submissions of this process will fail
> 
> Well when the process is killed how can it still make job submissions?
> 
> Regards,
> Christian.
> 
>> , and
>> the resources of these jobs have not been released, nor have the
>> fences  been signalled, causing tasks to hang.
>>
>> Fix by not doing job init when the entity is stopped. And when the job
>> is already submitted, free the job resource if the entity is stopped.
>>
>> Signed-off-by: Liu01 Tong <Tong.Liu01@amd.com>
>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>> ---
>>  drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++------
>>  drivers/gpu/drm/scheduler/sched_main.c   |  5 +++++
>>  2 files changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index ac678de7fe5e..1e744b2eb2db 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -570,6 +570,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>       bool first;
>>       ktime_t submit_ts;
>>
>> +     if (entity->stopped) {
>> +             DRM_ERROR("Trying to push job to a killed entity\n");
>> +             INIT_WORK(&sched_job->work, drm_sched_entity_kill_jobs_work);
>> +             schedule_work(&sched_job->work);
>> +             return;
>> +     }
>> +
>>       trace_drm_sched_job(sched_job, entity);
>>       atomic_inc(entity->rq->sched->score);
>>       WRITE_ONCE(entity->last_user, current->group_leader); @@ -589,12
>> +596,6 @@ void drm_sched_entity_push_job(struct drm_sched_job
>> *sched_job)
>>
>>               /* Add the entity to the run queue */
>>               spin_lock(&entity->lock);
>> -             if (entity->stopped) {
>> -                     spin_unlock(&entity->lock);
>> -
>> -                     DRM_ERROR("Trying to push to a killed entity\n");
>> -                     return;
>> -             }
>>
>>               rq = entity->rq;
>>               sched = rq->sched;
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index bfea608a7106..c15b17d9ffe3 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -795,6 +795,11 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>               return -ENOENT;
>>       }
>>
>> +     if (unlikely(entity->stopped)) {
>> +             pr_err("*ERROR* %s: entity is stopped!\n", __func__);
>> +             return -EINVAL;
>> +     }
>> +
>>       if (unlikely(!credits)) {
>>               pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);
>>               return -EINVAL;
> 

