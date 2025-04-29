Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85DAA0FF0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4937E10E4AF;
	Tue, 29 Apr 2025 15:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="28rzu42a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E9210E125;
 Tue, 29 Apr 2025 15:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZAJ76mZ1ZglEMrGgxMNrjpqjjzu0wqinR2BC1564EndPWICBCAe8u24JueClS9+9jbKqFK0WbvHYsJKjvhH61rmthKQeemehN/scSBw5c0KXh3BFErgCLA9LviFfFzgZckw7Q/4Rm0qATW6fgzC+RNZROmMG/8bzbLR982kSFJGUPue54uWKRBu0FwY7I8N+OV8BeIaYcmTgazcGX1DwnAy7Uc7ANkxAyitW+Uz8ArpD7gadV+znQWMHXduIR+HRHKzwppOP+zfebH3CWVkKeiHAC0zfK2kJgQsILG/Xe/dVgmeGnvMipwzxN8rTqVWV4vt34Xk6Ei1IFiEeeASzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKkq9yHJz7q5u3cN2kRpVb8FHPwEqKRwYGnqpF6r2A8=;
 b=VFfLEm5L5S+ah+tyxVtXjECh9hTYsgmYuns8eJeNMlROBo8wpxt3bLYE3dDI+KTYzx3dqehdiFGSlprcJLkso4qiX3BJYjSG248TSUBxGhUJTMJH/AQByRxnohzNkjJC4E51ZO4wraGfW9bpZbyn6iYxVbYJwv3eEIIP11slafpTom6CuGvnOwNO2p3QhWDCf3JcQGKv9kwK/VxHRs58Ycyh5ho7oGM5rKqWyxpVMLLU+WYlWb+17ObF+Mwj14NtK7a8PeNkh0KuoR4vl6VHfy3SrGqAkzx3VnFOQrEz7UcZ1VVa0V9jP2wECI6cH7ukCcqnNV85clVnHkCk3Tz7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKkq9yHJz7q5u3cN2kRpVb8FHPwEqKRwYGnqpF6r2A8=;
 b=28rzu42a7mMboNUHBerh3Eyn+wZ2x+637UvJYrmiHbIyXdViZZxQ4f+IFkIYK16QrbYFQpzhtEQ5Ek7IqDW8j0zYWzGvM7xhEfiG2s+zEWMuA2LUI3hbR0jMDn9/MZcn+VnZUKkg0QQBD2QW+helc3gpS+KRwaqKlnf+NyrpJpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 15:03:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 15:03:19 +0000
Message-ID: <10501127-0315-45bc-96ed-f48c3af957ef@amd.com>
Date: Tue, 29 Apr 2025 17:03:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 01/16] drm/sched: Add some scheduling quality unit tests
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250425102034.85133-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 948f4ddd-1d08-46b3-719b-08dd872efa1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWl6UThHZ3k1enVublczVDkvMW1QeVRhSkxIelpDVThEWlp1VDM2SHFmRFEx?=
 =?utf-8?B?eVBVM3NJY2hSOWhBODBGV3htdklMMmxJVEh2c3JSUlJjVmlwaEhVaEl4dXVV?=
 =?utf-8?B?OWp1Q3hqRVhicjNtUzR2eXVFdERUYzlVbFRGcjI1Nm9xaS81UW9VMFBuOU8z?=
 =?utf-8?B?SE1kOGZFQTE0bHZabkxrd0NKUGkybXZkblFidHpwM1hoU0VDNmpoM0RyYWpu?=
 =?utf-8?B?VGJsSlVSRm16SUV0MkRxa3lrZDBVTWk4anp5eWhUVU8zcXRZRTlHZ3RUV1Q3?=
 =?utf-8?B?UHNsYysxcDVsN2I5UUZzUUoxYXlWVWFlZWxSekNKUkpFUC9qY1d2Y2lNeVdJ?=
 =?utf-8?B?aTkxSFhuT3VTekZZK2c0QXZXNS9LYUQwaTRwTklyc3d6NUd1WTVuQVQzUi9L?=
 =?utf-8?B?eVNsQTVENjZoS05MZjExdmxiN3pPR0s1dWlRaDYwWG1iWWlWKys0NUNFbWQz?=
 =?utf-8?B?bytGL25kUXN2QjIybVBaaVhITnZDS1V0OXdOSzBYQWVjUU5STWtOS0FReXpi?=
 =?utf-8?B?QTVkYnBoNmxwU213TWl5OEEzQ3Q1Q2pOT3VlNStEREZ0aFZ6VXQ0NmRSdGVX?=
 =?utf-8?B?M3lLVDRkLytGMkdBZUtqMURjU21zSmJNUlBJTkdRRFRUblBPbnJISjRmcndk?=
 =?utf-8?B?VWt4VkZiaVJiY0dIcXBkcFBOb2o3M0Z3ZFhMRDY1Uml4TVVSbml2MWUxWHYz?=
 =?utf-8?B?RTdxeTRVTFBWektjT3VTMU1tQUltQnRyWlBqNlB1bHlWMGRob1Y0aHphTWlP?=
 =?utf-8?B?b3FKYlZiUTRsMGlZcHZaR1FaS3F2MjVDZWdzUHE3SktSRFJvTTBNTjljdHJO?=
 =?utf-8?B?QjEyQnV0N1V3SE9CNi9zNVhzK3d0NGJCeTRubWQ1RjhuNHp4NUlaRitPcnA0?=
 =?utf-8?B?YThLVmd2WU5VQmhxTTllM3FYai85ZEU4dHcrVjZQZ3k5NjJsbEVSejZuMkR0?=
 =?utf-8?B?SmJaQ3NOaSt1Q3ZEVFg4elJMaGIvTVQvOTJkOGVHZTN2NWY2a3g2S0lhK0NX?=
 =?utf-8?B?ZW1pMGJ4MDA4MGRGWFRaMVIxNjgrREQ3VXlCa2pCdU9nekV1RFdBSGlMdkxT?=
 =?utf-8?B?U2ZuTXArdnNBZDJlV0NkTWhPbkF6RGVhYVZzNjYzNklOSHA3RjhBeU9iUjh5?=
 =?utf-8?B?MjlQMENsNS9MTHJRbW42WTBsbzRHTzBJelFLNUtmaVNJV2tBQ0QzU0YzZnFJ?=
 =?utf-8?B?ZUw2bjZhaUorSTZnd01LSzU5eXhrN0Z1bVIrdUR3bnZjbnVnRkhuWjJYZ1hV?=
 =?utf-8?B?Y1FWanNLNGNDb3ZxN1dkSExqWnVhTkRYL1pkQTdQNEZvRzdTelRyZmlSS2Z1?=
 =?utf-8?B?TkFwYlJ6WWFTQlM5U1Q0UTJXSk9salNpSTYyZnFtUTkzakJXdE9pS1QyVHlZ?=
 =?utf-8?B?WTVIKzVoL2lLZjV3blFPTlBNQjBBL3I4WVF6MkRScWs3NXRvSm9zRG8xYzNI?=
 =?utf-8?B?clhEMy9mYkNiVER3d2RKNDdlVmR6YWI0R0xLdnpDTjRTYmI0RXdjM1BXR1ZB?=
 =?utf-8?B?YUp0akxwdzg0TGp1TjNsR2ZMRVJrZm93R1VheGN0UW1veFcwSzBGemdDdGVS?=
 =?utf-8?B?S1pRR0FFL2NwT1Ztc2NCK3lNSlpyVmlRV2NRYlhEM21MNVduaHNsSWVnUW9a?=
 =?utf-8?B?ZHVjL1R0N3AxOWdOOE52MTNLUko2U0JIS09McDk5MW5KOFB5RCtxTXRXMlBt?=
 =?utf-8?B?SmtRejlLNTdQbkRMeWVFRjNaM0l5QWlDNEZsSjdyc1MxOG5jYnREcWRsb2tB?=
 =?utf-8?B?anplZ0UrZlUrb05lc0xvNFNId0wvT285OFpLZnBuTmFOeng2K3MvYnNZb3Q4?=
 =?utf-8?B?T2NPUVFUa2g0cEFWVmFTY0dCWGwwcFdnS2hqb0Q1anR6VFFaT0hxd0doQi9v?=
 =?utf-8?B?a0hsbEMzY3ZqdGJNbmwwZkkrMDBrWk9xeTBpMC8rZ3E3K2VPM2ZFeG9hYnB2?=
 =?utf-8?Q?UHxfCg9H3Qo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFaUFJ6WDhaYk8vLzZwQkpXTHo2a3Q0aDVGRWRFTE5qb3FVUTN3czFKc09y?=
 =?utf-8?B?bjgxZm9vV3Evbm1ac29qa3NKaXhKeExuaXBXRWZqbzB0Z1ZEK0tOcjNvN1Zr?=
 =?utf-8?B?YVJRSVF5cGlJTzQwdUo0OW4zVXZrR1g4bEVFR3RMT2NhVjdCanhFWDZPaWJZ?=
 =?utf-8?B?VzMvSG9pcUpESDFVN0ExZExkM2trRmVZRkhKd1VBRHdITUJFZ005UkdmVGZH?=
 =?utf-8?B?cmowcTR1TVBOSFNJMnp3UWFyY1RLU2JHK3BPSHFUaWRkQy9BakExd0UrUWJ6?=
 =?utf-8?B?VVBRQ2RvUDhhVi9zZXZ3ci9jYnVGd3hrRktYQnBLUy9vaXdnaFhSOUVZT2Jk?=
 =?utf-8?B?NjhkR3IvZWVzSmVuZlVOOU1OVFlWSFpINDE4NTQyVjR0WnNGYWdjN1Fqd3RM?=
 =?utf-8?B?dmFFSHp5QlhINGFzbDdFOGh3L2xkK1dMdVpUTDU4bEJmUnZCR2hhWm92UzFY?=
 =?utf-8?B?Umd6TlkwYnQyTzlsait3TFBtQVlCZkd0aDVPZFJibkZ2NCs3T1pFaGhFa25t?=
 =?utf-8?B?VDRmcTB5NVp2WWoyK09IUFRPVzQ3UHJsT1hmTGlWSk5QZTYrRk1iVEt1RWZj?=
 =?utf-8?B?L1JPbUJrd0gvdHovenppUm8wMWxMMzFUaUtrY0FFS0UzRVRNWm1samNMV0dw?=
 =?utf-8?B?Y0pMNkxnVVlrK2M3UTY2c21kbDRLMGs1eEVMRWNuZXZjQ3o2Ulk3cjZRN08r?=
 =?utf-8?B?dDdzOUQzelcyUm9SNWxZWi92NTlUekcxRGRiS1FZL3RLS2hBVHp0U1c5SFVq?=
 =?utf-8?B?YW52NHBseTgvbWJuNXFWWFhQS2JLd01sNnJ0WXFGa2NlL2kzVDVOSENwNnky?=
 =?utf-8?B?N1NjZ0ZIaE1ZVEwrUG1FS25WTHlVQmswZng1ZmdhcWpUM1Z5QkdLcXdrdnFs?=
 =?utf-8?B?azlJZFBlUExBNGgzSUVJaE5SbmVuV0JMRWRtSURsU0ZYVHd1TzZmVVNydUpj?=
 =?utf-8?B?UE5sM3Q0WFRDSGdhbzZ3cExOQVd1Mkh2b3VSS3VrQUNYc2l2WFV5VzdIdkhL?=
 =?utf-8?B?RVZTeHg2V01JN1pYZ1hRUmxqTWZzdEtpb3o5SFh3ZWZlWHMrOEdGOXdJVVUv?=
 =?utf-8?B?OVB6MG1Xa1pIMjJVbDNOQkhnUnJTYzQrdTN4bGhSa0VyM1dvRWYxTXBPOXBz?=
 =?utf-8?B?WDFEMGNxdkx4YUsxL25sdUpTUnExVHNDQitrZ1lKZkpkdGdUQWdyZ0llS1FG?=
 =?utf-8?B?a0lMak9aOUxueWtlaUdUUVlPbzlqZnpGWXA4K0FncEdHQlpqc2UybTlubzVN?=
 =?utf-8?B?Z0llNTNSaGphU2Rwck5kclg2TjVQR0ZGdmhXNzU0RU43Rkx2WE5oQVFXQWd2?=
 =?utf-8?B?NklIemtaV1RQbGlvaVFvbkpISDNUQVM0RXVSeWZGVUJSUjltWWdZMXZ2VmNz?=
 =?utf-8?B?aEkxMCtoSktMRzZFK1JWZ1h0U0o1SEFKN3JTQ1l4UGVEeFZSWWxhQ1pUN0R4?=
 =?utf-8?B?eFpKYnp3dFFMelRORUd1K255NUQvQUNrai9uRlZxOWhWdnRIbmlxZnJLcGxn?=
 =?utf-8?B?Snk0Z2VrcVphemVIVlZCaFhTS3ZxRmxxY1lrRktTTmxEODlmUnBQaE5TSUF5?=
 =?utf-8?B?eFNVZnlHRVVMTjViMm44c0NFMGtsZ3NOOTR3WHFvNndoNzVQcHZFdjQ0WGFI?=
 =?utf-8?B?b2dyekJMUWp4bzVEdi85VWEwZCtPb1NyNUYrb3MxRkY5cXp3eEZlc1BQNHp5?=
 =?utf-8?B?dFdPclZ0b1pxUDdJZHB4WkhCZ2IrVVphZ1lCUXhObHVCOFdhUk1oRlhMZjhO?=
 =?utf-8?B?QmlvdnlQTFBDM01Ma1VXZThWNHZQTkNmVTl2akZseVNBWEtzVjlsTE5yc05M?=
 =?utf-8?B?SU1rNGE5U3ZNMVE2WmE1dFUvVGJib0dnRTZOa1llMnlRWnowZzhHTEhXc1BS?=
 =?utf-8?B?MWZFemVUZGZOc2ZVZ0tiSW1YVUhXeklGRk91OWQvRG9rVGRnTWpkQUNUbTZT?=
 =?utf-8?B?cGo4OERYcXltc3RpMVBLeDJNVlVWZ0E1Sy8zekNYLy9iWnJZVDEzL1VSMmR2?=
 =?utf-8?B?aXYvS0JaMkIwUEpvVXQrcHZiWmJTSDNQeDJEdjNEVm50S2F4Nzhla0FnSEdh?=
 =?utf-8?B?SFVheUxkMEpIbnFvWFhIcXg1aUxyN1V3UGoybGdDNjdDMmdNdEFoSWtJSEZm?=
 =?utf-8?Q?l/yl2wOy3SQRMqAupaObk2wpI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948f4ddd-1d08-46b3-719b-08dd872efa1b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 15:03:19.4110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNPDwBcG7M59EPIhnEiBBmMJqCusbF8ef27l308SrvvORNVfchzDNMNU7O/LIna2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655
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

On 4/25/25 12:20, Tvrtko Ursulin wrote:
> To make evaluating different scheduling policies easier (no need for
> external benchmarks) and perfectly repetable, lets add some synthetic

Typo "repeatable".

> workloads built upon mock scheduler unit test infrastructure.
> 
> Focus is on two parallel clients (two threads) submitting different job
> patterns and logging their progress and some overall metrics. This is
> repeated for both scheduler credit limit 1 and 2.
> 
> Example test output:
> 
>   Normal and low:
>                     pct1 cps1 qd1;  pct2 cps2 qd2
>         +     0ms:   0     0    0;   0     0    0
>         +   104ms: 100  1240  112; 100  1240  125
>         +   209ms: 100     0   99; 100     0  125
>         +   313ms: 100     0   86; 100     0  125
>         +   419ms: 100     0   73; 100     0  125
>         +   524ms: 100     0   60; 100     0  125
>         +   628ms: 100     0   47; 100     0  125
>         +   731ms: 100     0   34; 100     0  125
>         +   836ms: 100     0   21; 100     0  125
>         +   939ms: 100     0    8; 100     0  125
>         +  1043ms:               ; 100     0  120
>         +  1147ms:               ; 100     0  107
>         +  1252ms:               ; 100     0   94
>         +  1355ms:               ; 100     0   81
>         +  1459ms:               ; 100     0   68
>         +  1563ms:               ; 100     0   55
>         +  1667ms:               ; 100     0   42
>         +  1771ms:               ; 100     0   29
>         +  1875ms:               ; 100     0   16
>         +  1979ms:               ; 100     0    3
>     0: prio=normal sync=0 elapsed_ms=1015ms (ideal_ms=1000ms) cycle_time(min,avg,max)=134,222,978 us latency_time(min,avg,max)=134,222,978
> us
>     1: prio=low sync=0 elapsed_ms=2009ms (ideal_ms=1000ms) cycle_time(min,avg,max)=134,215,806 us latency_time(min,avg,max)=134,215,806 us
> 
> There we have two clients represented in the two respective columns, with
> their progress logged roughly every 100 milliseconds. The metrics are:
> 
>  - pct - Percentage progress of the job submit part
>  - cps - Cycles per second
>  - qd  - Queue depth - number of submitted unfinished jobs
> 
> The cycles per second metric is inherent to the fact that workload
> patterns are a data driven cycling sequence of:
> 
>  - Submit 1..N jobs
>  - Wait for Nth job to finish (optional)
>  - Sleep (optional)
>  - Repeat from start
> 
> In this particular example we have a normal priority and a low priority
> clients both spamming the scheduler with 8ms jobs with no sync and no
> sleeping. Hence they build a very deep queues and we can see how the low
> priority client is completely starved until the normal finishes.
> 
> Note that the PCT and CPS metrics are irrelevant for "unsync" clients
> since they manage to complete all of their cycles instantenuously.

Typo instantanuously.

> 
> A different example would be:
> 
>   Heavy and interactive:
>                     pct1 cps1 qd1;  pct2 cps2 qd2
>         +     0ms:   0     0    0;   0     0    0
>         +   106ms:   5    40    3;   5    40    0
>         +   209ms:   9    40    0;   9    40    0
>         +   314ms:  14    50    3;  14    50    0
>         +   417ms:  18    40    0;  18    40    0
>         +   522ms:  23    50    3;  23    50    0
>         +   625ms:  27    40    0;  27    40    1
>         +   729ms:  32    50    0;  32    50    0
>         +   833ms:  36    40    1;  36    40    0
>         +   937ms:  40    40    0;  40    40    0
>         +  1041ms:  45    50    0;  45    50    0
>         +  1146ms:  49    40    1;  49    40    1
>         +  1249ms:  54    50    0;  54    50    0
>         +  1353ms:  58    40    1;  58    40    0
>         +  1457ms:  62    40    0;  62    40    1
>         +  1561ms:  67    50    0;  67    50    0
>         +  1665ms:  71    40    1;  71    40    0
>         +  1772ms:  76    50    0;  76    50    0
>         +  1877ms:  80    40    1;  80    40    0
>         +  1981ms:  84    40    0;  84    40    0
>         +  2085ms:  89    50    0;  89    50    0
>         +  2189ms:  93    40    1;  93    40    0
>         +  2293ms:  97    40    0;  97    40    1
> 
> In this case client one is submitting 3x 2.5ms jobs, waiting for the 3rd
> and then sleeping for 2.5ms (in effect causing 75% GPU load, minus the
> overheads). Second client is submitting 1ms jobs, waiting for each to
> finish and sleeping for 9ms (effective 10% GPU load). Here we can see
> the PCT and CPS reflecting real progress.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

I only skimmed over it, but it looks like exactly what we need.

Feel free to add Acked-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>  drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
>  .../gpu/drm/scheduler/tests/tests_scheduler.c | 631 ++++++++++++++++++
>  2 files changed, 633 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/Makefile b/drivers/gpu/drm/scheduler/tests/Makefile
> index 5bf707bad373..9ec185fbbc15 100644
> --- a/drivers/gpu/drm/scheduler/tests/Makefile
> +++ b/drivers/gpu/drm/scheduler/tests/Makefile
> @@ -2,6 +2,7 @@
>  
>  drm-sched-tests-y := \
>          mock_scheduler.o \
> -        tests_basic.o
> +        tests_basic.o \
> +        tests_scheduler.o
>  
>  obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) += drm-sched-tests.o
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> new file mode 100644
> index 000000000000..b66321ef7abe
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> @@ -0,0 +1,631 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2025 Valve Corporation */
> +
> +#include <linux/delay.h>
> +#include <linux/kthread.h>
> +#include <linux/ktime.h>
> +
> +#include "sched_tests.h"
> +
> +/*
> + * DRM scheduler scheduler tests exercise load balancing decisions ie. entity
> + * selection logic.
> + */
> +
> +static int drm_sched_scheduler_init(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched;
> +
> +	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +	sched->base.credit_limit = 1;
> +
> +	test->priv = sched;
> +
> +	return 0;
> +}
> +
> +static int drm_sched_scheduler_init2(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched;
> +
> +	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +	sched->base.credit_limit = 2;
> +
> +	test->priv = sched;
> +
> +	return 0;
> +}
> +
> +static void drm_sched_scheduler_exit(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched = test->priv;
> +
> +	drm_mock_sched_fini(sched);
> +}
> +
> +static void drm_sched_scheduler_queue_overhead(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched = test->priv;
> +	struct drm_mock_sched_entity *entity;
> +	const unsigned int job_us = 1000;
> +	const unsigned int jobs = 1000;
> +	const unsigned int total_us = jobs * job_us;
> +	struct drm_mock_sched_job *job, *first;
> +	ktime_t start, end;
> +	bool done;
> +	int i;
> +
> +	/*
> +	 * Deep queue job at a time processing (single credit).
> +	 *
> +	 * This measures the overhead of picking and processing a job at a time
> +	 * by comparing the ideal total "GPU" time of all submitted jobs versus
> +	 * the time actually taken.
> +	 */
> +
> +	KUNIT_ASSERT_EQ(test, sched->base.credit_limit, 1);
> +
> +	entity = drm_mock_sched_entity_new(test,
> +					   DRM_SCHED_PRIORITY_NORMAL,
> +					   sched);
> +
> +	for (i = 0; i <= jobs; i++) {
> +		job = drm_mock_sched_job_new(test, entity);
> +		if (i == 0)
> +			first = job; /* Extra first job blocks the queue */
> +		else
> +			drm_mock_sched_job_set_duration_us(job, job_us);
> +		drm_mock_sched_job_submit(job);
> +	}
> +
> +	done = drm_mock_sched_job_wait_scheduled(first, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	start = ktime_get();
> +	i = drm_mock_sched_advance(sched, 1); /* Release the queue */
> +	KUNIT_ASSERT_EQ(test, i, 1);
> +
> +	done = drm_mock_sched_job_wait_finished(job,
> +						usecs_to_jiffies(total_us) * 5);
> +	end = ktime_get();
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	pr_info("Expected %uus, actual %lldus\n",
> +		total_us,
> +		ktime_to_us(ktime_sub(end, start)));
> +
> +	drm_mock_sched_entity_free(entity);
> +}
> +
> +static void drm_sched_scheduler_ping_pong(struct kunit *test)
> +{
> +	struct drm_mock_sched_job *job, *first, *prev = NULL;
> +	struct drm_mock_scheduler *sched = test->priv;
> +	struct drm_mock_sched_entity *entity[2];
> +	const unsigned int job_us = 1000;
> +	const unsigned int jobs = 1000;
> +	const unsigned int total_us = jobs * job_us;
> +	ktime_t start, end;
> +	bool done;
> +	int i;
> +
> +	/*
> +	 * Two entitites in inter-dependency chain.
> +	 *
> +	 * This measures the overhead of picking and processing a job at a time,
> +	 * where each job depends on the previous one from the diffferent
> +	 * entity, by comparing the ideal total "GPU" time of all submitted jobs
> +	 * versus the time actually taken.
> +	 */
> +
> +	KUNIT_ASSERT_EQ(test, sched->base.credit_limit, 1);
> +
> +	for (i = 0; i < ARRAY_SIZE(entity); i++)
> +		entity[i] = drm_mock_sched_entity_new(test,
> +						      DRM_SCHED_PRIORITY_NORMAL,
> +						      sched);
> +
> +	for (i = 0; i <= jobs; i++) {
> +		job = drm_mock_sched_job_new(test, entity[i & 1]);
> +		if (i == 0)
> +			first = job; /* Extra first job blocks the queue */
> +		else
> +			drm_mock_sched_job_set_duration_us(job, job_us);
> +		if (prev)
> +			drm_sched_job_add_dependency(&job->base,
> +						     dma_fence_get(&prev->base.s_fence->finished));
> +		drm_mock_sched_job_submit(job);
> +		prev = job;
> +	}
> +
> +	done = drm_mock_sched_job_wait_scheduled(first, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	start = ktime_get();
> +	i = drm_mock_sched_advance(sched, 1); /* Release the queue */
> +	KUNIT_ASSERT_EQ(test, i, 1);
> +
> +	done = drm_mock_sched_job_wait_finished(job,
> +						usecs_to_jiffies(total_us) * 5);
> +	end = ktime_get();
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	pr_info("Expected %uus, actual %lldus\n",
> +		total_us,
> +		ktime_to_us(ktime_sub(end, start)));
> +
> +	for (i = 0; i < ARRAY_SIZE(entity); i++)
> +		drm_mock_sched_entity_free(entity[i]);
> +}
> +
> +static struct kunit_case drm_sched_scheduler_overhead_tests[] = {
> +	KUNIT_CASE_SLOW(drm_sched_scheduler_queue_overhead),
> +	KUNIT_CASE_SLOW(drm_sched_scheduler_ping_pong),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_scheduler_overhead = {
> +	.name = "drm_sched_scheduler_overhead_tests",
> +	.init = drm_sched_scheduler_init,
> +	.exit = drm_sched_scheduler_exit,
> +	.test_cases = drm_sched_scheduler_overhead_tests,
> +};
> +
> +struct drm_sched_client_params {
> +	enum drm_sched_priority priority;
> +	unsigned int job_cnt;
> +	unsigned int job_us;
> +	unsigned int wait_us;
> +	bool sync;
> +};
> +
> +struct drm_sched_test_params {
> +	const char *description;
> +	struct drm_sched_client_params client[2];
> +};
> +
> +static const struct drm_sched_test_params drm_sched_cases[] = {
> +	{
> +		.description = "Normal and normal",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 8000,
> +			.wait_us = 0,
> +			.sync = false,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 8000,
> +			.wait_us = 0,
> +			.sync = false,
> +		},
> +	},
> +	{
> +		.description = "Normal and low",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 8000,
> +			.wait_us = 0,
> +			.sync = false,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_LOW,
> +			.job_cnt = 1,
> +			.job_us = 8000,
> +			.wait_us = 0,
> +			.sync = false,
> +		},
> +	},
> +	{
> +		.description = "High and normal",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_HIGH,
> +			.job_cnt = 1,
> +			.job_us = 8000,
> +			.wait_us = 0,
> +			.sync = false,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 8000,
> +			.wait_us = 0,
> +			.sync = false,
> +		},
> +	},
> +	{
> +		.description = "High and low",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_HIGH,
> +			.job_cnt = 1,
> +			.job_us = 8000,
> +			.wait_us = 0,
> +			.sync = false,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_LOW,
> +			.job_cnt = 1,
> +			.job_us = 8000,
> +			.wait_us = 0,
> +			.sync = false,
> +		},
> +	},
> +	{
> +		.description = "50 and 50",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 1500,
> +			.wait_us = 1500,
> +			.sync = true,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 2500,
> +			.wait_us = 2500,
> +			.sync = true,
> +		},
> +	},
> +	{
> +		.description = "50 and 50 low",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 1500,
> +			.wait_us = 1500,
> +			.sync = true,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_LOW,
> +			.job_cnt = 1,
> +			.job_us = 2500,
> +			.wait_us = 2500,
> +			.sync = true,
> +		},
> +	},
> +	{
> +		.description = "50 high and 50",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_HIGH,
> +			.job_cnt = 1,
> +			.job_us = 1500,
> +			.wait_us = 1500,
> +			.sync = true,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 2500,
> +			.wait_us = 2500,
> +			.sync = true,
> +		},
> +	},
> +	{
> +		.description = "Low hog and interactive",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_LOW,
> +			.job_cnt = 3,
> +			.job_us = 2500,
> +			.wait_us = 500,
> +			.sync = false,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 500,
> +			.wait_us = 10000,
> +			.sync = true,
> +		},
> +	},
> +	{
> +		.description = "Heavy and interactive",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 3,
> +			.job_us = 2500,
> +			.wait_us = 2500,
> +			.sync = true,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 1000,
> +			.wait_us = 9000,
> +			.sync = true,
> +		},
> +	},
> +	{
> +		.description = "Very heavy and interactive",
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 4,
> +			.job_us = 50000,
> +			.wait_us = 1,
> +			.sync = true,
> +		},
> +		.client[1] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 1,
> +			.job_us = 1000,
> +			.wait_us = 9000,
> +			.sync = true,
> +		},
> +	},
> +};
> +
> +static void
> +drm_sched_desc(const struct drm_sched_test_params *params, char *desc)
> +{
> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_sched_scheduler_two_clients,
> +		  drm_sched_cases,
> +		  drm_sched_desc);
> +
> +struct test_client_stats {
> +	unsigned long min_us;
> +	unsigned long max_us;
> +	unsigned long avg_us;
> +};
> +
> +struct test_client {
> +	struct kunit *test;
> +
> +	struct drm_mock_sched_entity	*entity;
> +
> +	struct kthread_worker	*worker;
> +	struct kthread_work	work;
> +
> +	unsigned int id;
> +	ktime_t duration;
> +
> +	struct drm_sched_client_params params;
> +
> +	ktime_t ideal_duration;
> +	unsigned int cycles;
> +	unsigned int cycle;
> +	ktime_t	start;
> +	ktime_t	end;
> +	bool done;
> +
> +	struct test_client_stats cycle_time;
> +	struct test_client_stats latency_time;
> +};
> +
> +static void
> +update_stats(struct test_client_stats *stats, unsigned int n, unsigned long us)
> +{
> +	if (us > stats->max_us)
> +		stats->max_us = us;
> +	if (us < stats->min_us)
> +		stats->min_us = us;
> +	stats->avg_us = DIV_ROUND_UP(n * stats->avg_us + us, n + 1);
> +}
> +
> +static void drm_sched_client_work(struct kthread_work *work)
> +{
> +	struct test_client *client = container_of(work, typeof(*client), work);
> +	const long sync_wait = MAX_SCHEDULE_TIMEOUT;
> +	unsigned int cycle, work_us, period_us;
> +	struct drm_mock_sched_job *job = NULL;
> +
> +	work_us = client->params.job_cnt * client->params.job_us;
> +	period_us = work_us + client->params.wait_us;
> +	client->cycles = DIV_ROUND_UP(ktime_to_us(client->duration), period_us);
> +	client->ideal_duration = us_to_ktime(client->cycles * period_us);
> +
> +	client->start = ktime_get();
> +
> +	for (cycle = 0; cycle < client->cycles; cycle++) {
> +		unsigned int batch;
> +		unsigned long us;
> +		ktime_t t;
> +
> +		if (READ_ONCE(client->done))
> +			break;
> +
> +		t = ktime_get();
> +		for (batch = 0; batch < client->params.job_cnt; batch++) {
> +			job = drm_mock_sched_job_new(client->test,
> +						     client->entity);
> +			drm_mock_sched_job_set_duration_us(job,
> +							   client->params.job_us);
> +			drm_mock_sched_job_submit(job);
> +		}
> +
> +		if (client->params.sync)
> +			drm_mock_sched_job_wait_finished(job, sync_wait);
> +
> +		t = ktime_sub(ktime_get(), t);
> +		us = ktime_to_us(t);
> +		update_stats(&client->cycle_time, cycle, us);
> +		if (ktime_to_us(t) >= (long)work_us)
> +			us = ktime_to_us(t) - work_us;
> +		else if (WARN_ON_ONCE(client->params.sync))
> +			us = 0;
> +		update_stats(&client->latency_time, cycle, us);
> +		WRITE_ONCE(client->cycle, cycle);
> +
> +		if (READ_ONCE(client->done))
> +			break;
> +
> +		if (client->params.wait_us)
> +			fsleep(client->params.wait_us);
> +		else
> +			cond_resched();
> +	}
> +
> +	client->done = drm_mock_sched_job_wait_finished(job, sync_wait);
> +	client->end = ktime_get();
> +}
> +
> +static const char *prio_str(enum drm_sched_priority prio)
> +{
> +	switch (prio) {
> +	case DRM_SCHED_PRIORITY_KERNEL:
> +		return "kernel";
> +	case DRM_SCHED_PRIORITY_LOW:
> +		return "low";
> +	case DRM_SCHED_PRIORITY_NORMAL:
> +		return "normal";
> +	case DRM_SCHED_PRIORITY_HIGH:
> +		return "high";
> +	default:
> +		return "???";
> +	}
> +}
> +
> +static void drm_sched_scheduler_two_clients_test(struct kunit *test)
> +{
> +	const struct drm_sched_test_params *params = test->param_value;
> +	struct drm_mock_scheduler *sched = test->priv;
> +	struct test_client client[2] = { };
> +	unsigned int prev_cycle[2] = { };
> +	unsigned int i, j;
> +	ktime_t start;
> +
> +	/*
> +	 * Same job stream from from two clients.
> +	 */
> +
> +	for (i = 0; i < ARRAY_SIZE(client); i++)
> +		client[i].entity =
> +			drm_mock_sched_entity_new(test,
> +						  params->client[i].priority,
> +						  sched);
> +
> +	for (i = 0; i < ARRAY_SIZE(client); i++) {
> +		client[i].test = test;
> +		client[i].id = i;
> +		client[i].duration = ms_to_ktime(1000);
> +		client[i].params = params->client[i];
> +		client[i].cycle_time.min_us = ~0UL;
> +		client[i].latency_time.min_us = ~0UL;
> +		client[i].worker =
> +			kthread_create_worker(0, "%s-%u", __func__, i);
> +		if (IS_ERR(client[i].worker)) {
> +			for (j = 0; j < i; j++)
> +				kthread_destroy_worker(client[j].worker);
> +			KUNIT_FAIL(test, "Failed to create worker!\n");
> +		}
> +
> +		kthread_init_work(&client[i].work, drm_sched_client_work);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(client); i++)
> +		kthread_queue_work(client[i].worker, &client[i].work);
> +
> +	/*
> +	 * The clients (workers) can be a mix of async (deep submission queue),
> +	 * sync (one job at a time), or something in between. Therefore it is
> +	 * difficult to display a single metric representing their progress.
> +	 *
> +	 * Each struct drm_sched_client_params describes the actual submission
> +	 * pattern which happens in the following steps:
> +	 *  1. Submit N jobs
> +	 *  2. Wait for last submitted job to finish
> +	 *  3. Sleep for U micro-seconds
> +	 *  4. Goto 1. for C cycles
> +	 *
> +	 * Where number of cycles is calculated to match the target client
> +	 * duration from the respective struct drm_sched_test_params.
> +	 *
> +	 * To asses scheduling behaviour what we output for both clients is:
> +	 *  - pct: Percentage progress of the jobs submitted
> +	 *  - cps: "Cycles" per second (where one cycle is one 1.-4. above)
> +	 *  -  qd: Number of outstanding jobs in the client/entity
> +	 */
> +
> +	start = ktime_get();
> +	pr_info("%s:\n\t            pct1 cps1 qd1;  pct2 cps2 qd2\n",
> +		params->description);
> +	while (!READ_ONCE(client[0].done) || !READ_ONCE(client[1].done)) {
> +		unsigned int pct[2], qd[2], cycle[2], cps[2];
> +
> +		for (i = 0; i < ARRAY_SIZE(client); i++) {
> +			qd[i] = spsc_queue_count(&client[i].entity->base.job_queue);
> +			cycle[i] = READ_ONCE(client[i].cycle);
> +			cps[i] = DIV_ROUND_UP(1000 * (cycle[i] - prev_cycle[i]),
> +					      100);
> +			if (client[i].cycles)
> +				pct[i] = DIV_ROUND_UP(100 * (1 + cycle[i]),
> +						      client[i].cycles);
> +			else
> +				pct[i] = 0;
> +			prev_cycle[i] = cycle[i];
> +		}
> +
> +		if (READ_ONCE(client[0].done))
> +			pr_info("\t+%6lldms:               ; %3u %5u %4u\n",
> +				ktime_to_ms(ktime_sub(ktime_get(), start)),
> +				pct[1], cps[1], qd[1]);
> +		else if (READ_ONCE(client[1].done))
> +			pr_info("\t+%6lldms: %3u %5u %4u;\n",
> +				ktime_to_ms(ktime_sub(ktime_get(), start)),
> +				pct[0], cps[0], qd[0]);
> +		else
> +			pr_info("\t+%6lldms: %3u %5u %4u; %3u %5u %4u\n",
> +				ktime_to_ms(ktime_sub(ktime_get(), start)),
> +				pct[0], cps[0], qd[0],
> +				pct[1], cps[1], qd[1]);
> +		msleep(100);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(client); i++) {
> +		kthread_flush_work(&client[i].work);
> +		kthread_destroy_worker(client[i].worker);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(client); i++)
> +		KUNIT_ASSERT_TRUE(test, client[i].done);
> +
> +	for (i = 0; i < ARRAY_SIZE(client); i++) {
> +		pr_info("    %u: prio=%s sync=%u elapsed_ms=%lldms (ideal_ms=%lldms) cycle_time(min,avg,max)=%lu,%lu,%lu us latency_time(min,avg,max)=%lu,%lu,%lu us",
> +			i,
> +			prio_str(params->client[i].priority),
> +			params->client[i].sync,
> +			ktime_to_ms(ktime_sub(client[i].end, client[i].start)),
> +			ktime_to_ms(client[i].ideal_duration),
> +			client[i].cycle_time.min_us,
> +			client[i].cycle_time.avg_us,
> +			client[i].cycle_time.max_us,
> +			client[i].latency_time.min_us,
> +			client[i].latency_time.avg_us,
> +			client[i].latency_time.max_us);
> +		drm_mock_sched_entity_free(client[i].entity);
> +	}
> +}
> +
> +static const struct kunit_attributes drm_sched_scheduler_two_clients_attr = {
> +	.speed = KUNIT_SPEED_SLOW,
> +};
> +
> +static struct kunit_case drm_sched_scheduler_two_clients_tests[] = {
> +	KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_test,
> +			      drm_sched_scheduler_two_clients_gen_params,
> +			      drm_sched_scheduler_two_clients_attr),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_scheduler_two_clients1 = {
> +	.name = "drm_sched_scheduler_two_clients_one_credit_tests",
> +	.init = drm_sched_scheduler_init,
> +	.exit = drm_sched_scheduler_exit,
> +	.test_cases = drm_sched_scheduler_two_clients_tests,
> +};
> +
> +static struct kunit_suite drm_sched_scheduler_two_clients2 = {
> +	.name = "drm_sched_scheduler_two_clients_two_credits_tests",
> +	.init = drm_sched_scheduler_init2,
> +	.exit = drm_sched_scheduler_exit,
> +	.test_cases = drm_sched_scheduler_two_clients_tests,
> +};
> +
> +kunit_test_suites(&drm_sched_scheduler_overhead,
> +		  &drm_sched_scheduler_two_clients1,
> +		  &drm_sched_scheduler_two_clients2);

