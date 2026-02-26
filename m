Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGf9G/UwoGmLgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:39:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22C71A5362
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B7A10E8DD;
	Thu, 26 Feb 2026 11:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jnbCghvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B4C10E06F;
 Thu, 26 Feb 2026 11:39:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDZ3Xwye9JUJHqRAOghabL36R2m9zStS4iiBBa6kHc+yHv9RjOWisaXIzL1UYP9TSa2UrEb9iHGX/2KmvvR3C1dJ5ss4Jxy+TfDYUiR8r6Gf8spBRJdhIjmBLs9waawmHc+ST3g58CVP0HK1TErnOrra5gDXQAECRdGUC+KcY9aM5kIhCgzHTd65ChYupC07KV7vLEqwVVaCRLGLr4Twq1btOLA7fU7wpIOqIgEzsXTSqvDwp9ZPrUwB7dgAG4gzXm1n9UpSBrcjC/8t8fFmzL6GSH1u2M0Zb9OE+mEBU2O+DC861csnB/X+wK1aRcRpGWdQ6JnpapqJPn0dxfvC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmIDOyqHy3keogIv/X3yPEejeF3iSXQ1o28+rDanxw0=;
 b=D6WvFXyUyDW/scR7iwaCJsviib1qp9BFJZZFJdLqnBicVowmPh35XBEwSnQWuPOmktyOkBh3zhz/uD7ZyWKueux60PcgLtw6KjrxKIcJdZZ543/UKDB4d1Qcrkt2xzdroPT/1yEFkCa2D3PJ6551LzyLWtXl5BznZFe8hszOI2IJqsMHLGxUwK9SQVqDjw2O/7F8PyphHbIdupaXFms4ehL0CAv1dVZ++BXeyi7VVrcDwLncjG2NvcKom/7Zb96iwVpiBx9meA5YJgb7PEI7XPgSni7X/1+PHqIQkuQV5yP4dOpk7ayvLKyHECoA6iJ0SnltAIKEf7oEwcRSrZq+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmIDOyqHy3keogIv/X3yPEejeF3iSXQ1o28+rDanxw0=;
 b=jnbCghvFMyaRrrTfXtcsOPhfB/eB4+WWxSoq65Gke47N2FkAMmUDvzIZkzzf4ye7E8Isfu+zU+9IllX2J28vMKGsm+UTGPzoew6530A/QjTNZ/6eRDjyepTEAkqsmIM4T4yYk+CTDJor0QGVWGJluPUVm1hXh+iSdj52HHEnNzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8939.namprd12.prod.outlook.com (2603:10b6:930:b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 11:39:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 11:39:21 +0000
Message-ID: <c0323ccf-5c35-4dcb-a409-a1e63d157b19@amd.com>
Date: Thu, 26 Feb 2026 12:39:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/gpusvm: fix kernel-doc warning for
 drm_gpusvm_pages_valid_unlocked()
To: Yujie Liu <yujie.liu@intel.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Asad Kamal <asad.kamal@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Gangliang Xie <ganglxie@amd.com>, Candice Li <candice.li@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-2-yujie.liu@intel.com>
 <aZ+4sZoTzX4C/P2T@lstrano-desk.jf.intel.com> <aZ_gjpylcgG7PxPL@X299>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aZ_gjpylcgG7PxPL@X299>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0773.namprd03.prod.outlook.com
 (2603:10b6:408:13a::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b97e7df-155f-44b0-3b35-08de752baf11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: 6aV4vCE5qZFwqLXJKDQUKYynU3jc5s3mrE/chiGClEWYZb28xCz9mqCqq+je6HyiGnCZ5oTGaeeU0VjDig2v1al1Vh6tP4f/YT4ECwBQpOTCqeMhaXGhgzmWFXfgGdirIDFZVVvWgK4mKDvpELU52BGvbFzchILUQQNA0q3X1puU6eIPLC4WgGcOjHuY6PYxrSuJrNix/94fdFmIFgMCQM470WA3LGrLuVpziH+mADhhT6nNmuSGKryie503I7Qh9yZb/0sCHLn6Ika7tnK9JSN8N6fE4fhkZk6JIDPRRVD+yTEIoPo5B3U2k+Zh4PS5EotmPQ9j2zJ0HqA/v5Iwf1fBVi1phKnwbmCdcK8fyLmeXvRd5XiTxh7URZaG4EfiHF1+CeWqhPuvY3MdeeAh0KgCPSQqf3t/ikXQYS6c/RirNcd3M2cIWSZDAHhIYm0/MUrqlMfZQyaCPSzQxBpWhIW1XGOZ38DJTZLFWABwPS6wqHP2BGgPJJ//jy0dcqshzv7a8Msq7vEppco4jiZBoeXPiqH4dinUO1dYTO4G36IBjwGahDmsFeNIw/c3KjqpoUOAgZ1pCNpz6LovBUxN83zOcryFnC3CknQ66RxW1mhp6NCXyGgl0fnJLIOz1X8J8sC2sgGEVPEIh+iT9UF27pcS8b+lJp2A4cgRf2d5zMMJnAGe9q6yHBMMyzxuq8d1/etC36TBf9lq4yBb5slfnsmEQJJAOye8SMwdSzZahw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXhqYWwvRVZrU054cE5WcElHTGhtdWxvZ3ExaGYrVXZpV1ZlUTNpUEJ3Skts?=
 =?utf-8?B?UUc4WGEyNldSY2o3UXlHOStDK3B6MnFYbG1tZlRPbWptNVYzSW5kanBySCtU?=
 =?utf-8?B?R1ZVUmV3V05jWVo1R1RpVzF1czREdXZmMUcrdkd6ZlorUEg5VEg0d3Fhejdz?=
 =?utf-8?B?UytLL0xsVXBmNCtCT1hObzlheFYvNDRsY290Ty9SVHVyakxYdDFvQ0VyWnZX?=
 =?utf-8?B?MTFtZkZ4a0trc0RSL0ZYNDIrYWR2WE92ODNvVWpHSjRGTXpMcSswUmYzY0th?=
 =?utf-8?B?RXNZNkFhNFozQ2paVzhXZzFJd0dMVHgzZXBtVkNLUFRsNk1VanZUQXI1REVu?=
 =?utf-8?B?ZVFubTdkdDBDaWVyeVdnWUNDMGt3Mml4VGVvaUtJbm4xOTlLbGZPQ1cxZ1ly?=
 =?utf-8?B?cFMvUE80L1pFcWJpb1ZxYzFzZWJQRy9ZeUhpekxEOWJ5Y0tma080SWp5UTJy?=
 =?utf-8?B?VnpDWDFPaFcxTC9waTNsS0w4U25KVjZiUys3S2EvQzE0UENBN0l6N1diemtj?=
 =?utf-8?B?TWNaQkM4L2hyWDlNWWYrUlJScS9TN3dkcXBUYXpTMlF5cFFsTnh5NzZJM1hO?=
 =?utf-8?B?bFJnN1YzSzN5QXZLM1A5R1ZRQ0lDQ0picHBFYXRuZlVNd29Ec0kweUFCVWJw?=
 =?utf-8?B?Q3NRUnM1WTl5dzhpU1h5VG5rUUQ5OEVOTHVRS2xsUkM2eHFIWTBwempwNGJW?=
 =?utf-8?B?TjF6VG5UOTl0TkUvWk1DeHU5LytIckZPakw0L1h0WjlMMTFXZDNFNUIxeVlj?=
 =?utf-8?B?NG9FbHFIUk5CWFJDckw4aHpFTnVRWWFmVmR1YmswVkprcmFiWHFVaCtmbW1W?=
 =?utf-8?B?cGtuZlkyQXQ0Rnl4amU4U0QwTjV4OUtGaUIva0pLZ1NNaVdVSXlNV0tQaUVO?=
 =?utf-8?B?YkpidGhGSVI5Q0NYMkNLcHFkcVdQemh1dFk4am8xOFl1cmdEb1A3cTNOOFJu?=
 =?utf-8?B?WWdiZzVqRFZZcXhkUGI1bG01b1M0cnVJK0gzWW1HRzg0ZkxWd1RvQXN2VWtk?=
 =?utf-8?B?V20rK0lPSlZkWXpkVkJBRmJxajJ4aUtuNDlFQysxY3dxV01Jdjg1MkE3RCtn?=
 =?utf-8?B?aG1pZW55alMyOVpobnE4TDlrNmVkQzJ2TjRUQzRvOXlTdHlsdUUxTjlkOXk2?=
 =?utf-8?B?VVB3SjVqNktwbzFTZTI1OEd3WkdKQk1QS3o3d0x4Tk92TlpibWRHYU1ucy9j?=
 =?utf-8?B?OHE0OGtCcU9QdW8xdThzT0ZGMkVjVytiRGNFbmtrVjNKcDZNTCtheTB6SER4?=
 =?utf-8?B?TXJESVFlTytiM1l5SFdQdHZzYTBSMkhIWVB1Wm9NVTl6NktveDMvYXhvOHVY?=
 =?utf-8?B?N1V0dTQyVWtWcXVxY0hLRkRNYTE0R1pVNHc4VDhJaDNRSHZBdU9Dd3RVMFgx?=
 =?utf-8?B?eThqWUhpV1dzOGpRQ0FqZDJ3V2RNZzFJV0tMMDhKbW1KQ043TDBMK1VLLzdz?=
 =?utf-8?B?aU1kcGRjd0tMd2xnVkQrKytHMVNZeUlMTGhyTFU5NVpUbzZOd1BhWmszbDZw?=
 =?utf-8?B?dnVmZG9FNU9FbkwvclA0N09JSWU2TitCSG9VZWk5VExrd052Mnh4TDVsbktK?=
 =?utf-8?B?enVoWEYwTEVTL1k0MGJoU1Bqakl5ZUJpd2NVT3VwUWV1RHFSakIzMlk2bDdk?=
 =?utf-8?B?NkUweHRaTzgwS080OVVwNjlwaWFIVy9Xbm8vN21BR0hyWGU5SzQvcnBuNVJ6?=
 =?utf-8?B?Z3pINk11d1BRNSt0a0xQVGh3RTYrY2o4VjFPdk4wOUtEcjdRdTI5VklkNDNF?=
 =?utf-8?B?U2pRb3RYeU1jNFp0V0kyZFltNXRWUGppWFByUGVETkkwVmVSY2duMlR3ZTFQ?=
 =?utf-8?B?Qk1TVExzdHdXbXhqbUM2VlhOd1Uwb3ZjY3N0b2RLUE1sU0E2cVJmZTBYTVA2?=
 =?utf-8?B?QWNyVXVFZkdpS0xMVVV3U1MvSGFpRDh1aUp1UmpodWZOVHVVd2h1ZzNURmNL?=
 =?utf-8?B?NjJ3aTIvSWU3bXhKQjcvU3duT2Q1bUZ4L1piRllHOHVnRDYwckhoeEZsS0lv?=
 =?utf-8?B?VkhCTXB6THUyd2t1RXNjbTNsLzdOSU5sbTJIQUxnYlU4akNmOXk1RXdvb01W?=
 =?utf-8?B?Qm9ySVR2NGtGSWQwb0pmNHlyc3A2TTVkUlcxOTh1L3R2UE1vLzIzYTh5eEpY?=
 =?utf-8?B?dVQ0T2dMb1dHZ29mTTdnWFVxd09GZ1BQaHR4UjFmZG0zS3ZpTmF2blFlS2lP?=
 =?utf-8?B?ZmZPWjdlK3lMYXJPeWRuQXltdkJqdEpVOWtocndPTjl5NCttVTYzOVFOTTRH?=
 =?utf-8?B?MXQ0THREMFlQaFYzb0kraFRFNHBEQUFvSEhFQWVFeUNZWlhSWTJEVmtjVW4w?=
 =?utf-8?Q?btCj3AVVEZJ792/59h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b97e7df-155f-44b0-3b35-08de752baf11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:39:21.6946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8s7tiInJHoQm5RFGdH0yyQSKfzFfB/en3QojZd2EIodz0a8XOf93RZ/Kq3j1T2s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8939
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,igalia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.637];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,intel.com:email,aka.ms:url]
X-Rspamd-Queue-Id: D22C71A5362
X-Rspamd-Action: no action

On 2/26/26 06:56, Yujie Liu wrote:
> [Some people who received this message don't often get email from yujie.liu@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Wed, Feb 25, 2026 at 07:06:25PM -0800, Matthew Brost wrote:
>> On Thu, Feb 26, 2026 at 11:00:32AM +0800, Yujie Liu wrote:
>>> Warning: drivers/gpu/drm/drm_gpusvm.c:1351 function parameter 'svm_pages' not described in 'drm_gpusvm_pages_valid_unlocked'
>>> Warning: drivers/gpu/drm/drm_gpusvm.c:1351 expecting prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_unlocked() instead
>>>
>>> Fixes: 6364afd532bc ("drm/gpusvm: refactor core API to use pages struct")
>>
>> I fix this one already. Believe it merged yesterday.
> 
> Thanks. I will drop this patch and respin the series after waiting
> briefly for possible comments on other patches.

I also strongly suggest to split that patch set up by driver/subsystem and send it out individually. So that we can upstream it through different branches.

When it is send out as one patch set then that usually indicates that in needs to be applied in that order. That is clearly not the case here, but it would be nice to have it separately in my inbox.

Apart from that, thanks for taking care of that.

Christian.

> 
> Yujie
> 
>>
>> 74b6e83942dc drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc
>>
>> Matt

