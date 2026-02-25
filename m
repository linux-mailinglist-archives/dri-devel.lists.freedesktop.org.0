Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAP5A4Zen2lRagQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:41:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A020D19D5D1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFF210E82C;
	Wed, 25 Feb 2026 20:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a6l0Tx0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF5B10E82A;
 Wed, 25 Feb 2026 20:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3bjrRB24O4i0Si/T2vbC5R8Qx1gsT06d8H6UpaG5jsn1OJfGEp38Hm+XfeeKoWC8tlvJ4qv157mYnxcoz7TpwWf9aUbssdMyqhXlrKjv5NGk7RDYeyei+y7cC+8Ks/FGB0xqNzkR/R9n17E3ZD3oUtkkExlbEoQ17dht5tU2IPVvJBPCTJnSpRwVNFefnZKQgocz3ch9yPlZrIveHnbQ1DCxr2IptcE3BH5abxR7Cp+7Kfe/CAnm3hMTqp/ZuM6xV8JOsCdO/fL8Sm8ffeKSK9r9asOhu6xrJN00BPz/mEiW8SXCWvWPQu2zPnAojz1ar0igU8VuPy4d8e+Z375Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzlYJbNVb07IH3RqL8ud/41RgdTkioPnMScWYhvdOhg=;
 b=vG7i9kr1eu3/xq+UPrO5fZHtpe8S8pM3MMoLTnyCACIQ52/jZpXrQsGSi8sRSqOiPUVQbJbTQTiq/74ZvzSof0bd23WeGUPXMoW9ESsDTVSYo9EziRIKdDZGyqWLIQ5ypg1hJi+P7uC9Gtkk8Q6nQ64pw2+NX1ESpysgoE+9AUoMh3gzg6VYAo+V6nfsEmsjvP6rCJCNq3CRILnMZkYHXOTX3ZfTmrbtmJf3Nqq+th3JC4+3jcsk8F65dlwmsCdybHpc99xJ8RJALpQxHK5MO+vJHSk7BP5eXgkmsw3Ek1XIi0voTizN+XcuMVHmjwWCgOmfsUpeuQwhKjGX5f7dMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzlYJbNVb07IH3RqL8ud/41RgdTkioPnMScWYhvdOhg=;
 b=a6l0Tx0hbZQfftciBJjq6i5kPp86ifCZCXzD1dzhCGjTBflPTE1OzrXmF/aiZK6rzEdIp3dOk82K2BKaDEIwdmV6ZoNGlgPLhFdl0MrS1i1frLtIutmizAHZb02Sf0yID0jBYGKQRWk2CEyNXaQKnWJK3Li0dvbi6bhdWMoNtc4PTGJxbEueu8drtboZpxUJ2kUfjMA3M9mi++FdgX59p+3RrFIGhPrK0KlYwpJgNPivUZyki8XON19U9mVr4bi+omyWazpw6BWt8A4GzJePdZzJZ3tl6mw9pJI3KhPinAgByVvO2Fd/FTaYeX4t32ppbcJlSdznbSM5bA6NUfVXOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 20:41:29 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 20:41:29 +0000
Message-ID: <eff888d1-2caa-45bd-a611-e5772ee94e1b@nvidia.com>
Date: Wed, 25 Feb 2026 15:41:24 -0500
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGO4BIQ6MQ9Y.KB3JJQI71ETU@nvidia.com>
Content-Language: en-US
In-Reply-To: <DGO4BIQ6MQ9Y.KB3JJQI71ETU@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR19CA0015.namprd19.prod.outlook.com
 (2603:10b6:930:8e::11) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: a558b828-3574-4867-aca1-08de74ae40cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: wrwZnYdgnl/awnltd1kI2rKpd2hmEQK+Vm/2vPtEvlCvW77zNxv4ip9pms6uPalUqQw1uQrX/keF+G8+ih7ogwkTOj62dvS3sFKBji2N6oU+7q3AM801RS+ZNN52cXAj8CLplaTS05P+QyC3c+G6UCCZ41n1CNyEtJzEDGO6j5JqOG7UGKsKD6hJRFq0IQcgi5tjlnkZLh+Aj9IVAVoh8zah4x/RfkWe6jNhxpVywgTqK3XKc78NGomlLSsTB0ynIEV3YGcQRN2Y0eUSrbeIW3w5dxDt1ENnVseuMp8geKWf3wXk9hSni+I96Q8tdhu1xnSmDFhhXVN94sqJqPakOKedV6+JPacU6yjrswt6CzoFGiTRTQn9AnsJ2Rjqdf4ZJwWmhCA8JeD9XHofW1D5AloGObTnvWHzQHqGYsBa1sxIHnoN2o3mXsn6UXLjdqbBKHJq1GMrpimFQg60Sl3mvj9GD1FYwHvHLyLHqLBHgjVJ/XRkVWjHzgT8yKZFmZuVKagQWKK4Nhisy2ZRW8Fe/BoDGI/FwrdjARYKkfsuAgD0oj1Z0ZvNmv/q8MCk2u/kPqaB/aJNM6h2wv8rP78DtR+NpldEMEGzQsCyst2GzYPiE5pyHvXuIn7rEvd0QrOUIrNtn/ddRQx0Tqu9S1xyglhNTc2usvH/Q9RHwoml6mfGaGpmk0uTovvmQGs5u8Sr9RbJdAh4M1o3QbfqdMlyvZOa3HPuQzirok37GwMyLFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm5adU5MVmdkT2todGJIU3Z1TldOYUUvc1lmRU9ac3hUUjhXUEdZN083NG0y?=
 =?utf-8?B?aXdFYlF5dDY0K3p3SGk1WnhUcU5ReUh0VkJnbkVTdlkvZVp2TENQWDgrUS9r?=
 =?utf-8?B?cFJZNWd5aVlUdXp5eGZTM0JITy9pT2pQTkY4b1F1eG9rdVo0NHdyeTVPaFZB?=
 =?utf-8?B?TURPNGZmSEY2aGR4N2thS2ZLQXFleUEwcTA3bEN0clNLcmNvT05PbWVRR01L?=
 =?utf-8?B?Y2EzUG41VkJpd24zZnVRekl0TGdoZmNRRk1xcEhpSmF5ZjBxTUxyNnU3U3NM?=
 =?utf-8?B?UGVxY2xhWG0xUFQyNEd0T2xHeVVyblRmTng4QXVpMnJ3Y2I4MTRHNGxvaWVk?=
 =?utf-8?B?SHFRYWx0UDVzMDFnMlZNZHFIc0JjVXVEc204cys5ZUVBTnJvZWpQV0h3eXVu?=
 =?utf-8?B?RFFIbmxQem1qTmRhaUQvc0RGc0VCNEpYMW5mL1NnVHF6NGJBaVAvYkdYMVEz?=
 =?utf-8?B?SmFNVkg4TzFRU1RQdUkxS3VXTndLb0dEZDZKeGJDN2ZRTEk3Q0ZFWmhxeER2?=
 =?utf-8?B?RHpOUUZtL0JuL0g1ZXFLbVg1QWJwUklQUEVuYWM3cFhZcEhjQy9BRVBJdVVU?=
 =?utf-8?B?R1VqM2pGRFBPWG9JTUpHdm91SStkQWVqcHhOM1NEOVZpa2RxbmxCK3R4b3lT?=
 =?utf-8?B?MFg2R0lSaFl4Z0FsL2UxYUV3TkdRaE9RZHR0dk8rMGNSbzNQNExuT3MwZE9K?=
 =?utf-8?B?NG5ITjEyZjBEbnUvMXhoQllYajVWWjVnNGRSTitsQW16cnRFUUwxMTlEd3R5?=
 =?utf-8?B?NDlNaGRVTHR1NXpDL0lpQTlvWXZhSXJZUkM2eEdSdDVaUEk5VVhhT1ptU2N3?=
 =?utf-8?B?SFoyY2JoSklXbVBOL3UxSVRaNzczRmJkazhSRmRQQUgreEJoTjhibWF5Wkla?=
 =?utf-8?B?RmhuZ25HQW1QOGRJMjB1VTRtQnpiOWtXWllKZTZ6UmxVRU1qRXBIUjFTUHlw?=
 =?utf-8?B?RHhZdEczcnVIQlZ1RVYzeUxvY2s2Njl1RjBXbWwwd2FNZ0pDbUJhS1dYdndE?=
 =?utf-8?B?YWNHRzNmbElDYXRidHBVV05YYzNid2dkb2NFamt0M2YrMEV4cGV2WTY4Zkp2?=
 =?utf-8?B?VkI0YWJZSTJDOTZkNkZCcUh4R3pRY01DRHJpSkRWQmxxcjVHYzNWTmhqOTQ4?=
 =?utf-8?B?U1JBaW1KRXM4aG1YblpsajA0OGp5ZUhKb0xEV0hhK3ZNNTRUZ2dvem1yNkRs?=
 =?utf-8?B?dWhOR3FEWTVMTVpSLy82T1hsQ051RVZMSi9TZ25Cb0VWa0U3U2YxaE5ua1RG?=
 =?utf-8?B?MVRlempQYUNERW5uZktyZ0NhYmE4bEVTNkJUMFpsK0ZMeDliNjRxOG9VbjRR?=
 =?utf-8?B?TFFjSU00clYyQ3NXNGtxNGpqSDZTT01pYlN0M3RVMWhSTXM3c1dZRFRRYzBy?=
 =?utf-8?B?VHdUOE9maGdYdlNTRElGN2NaN0RFcVpKTEF1ZHlpVlFsVU9UUXc5YmVhQTBP?=
 =?utf-8?B?Z2ZoajZDaDlKc3Q3c2FLQ2pqK3kwUHhvTFZXVVptL2lsWHVLcGJEQUU3aSs1?=
 =?utf-8?B?RmNDa0taZW13Z2gvSFMvSWRBaVVTandDdmdVanBvTFZ3THJ1UkdhalNjak5p?=
 =?utf-8?B?d1Z1K2VRWFR6Mk9GWTJ3U3dqVy8rckVrTFFKeGIyZXZwK2RUUHArU2lwMHU0?=
 =?utf-8?B?TW9WTE1RR3ZpUXBVNXlGd2ZlZmF5eDZwN1JOdmFzQzFsdnNxcEtvN05zRUY4?=
 =?utf-8?B?dzdmUlRFRUo3QmlzYTFpNGFLT3ZvdDhQOEE1cDhqMnl6VWpHNUJLclZCRDln?=
 =?utf-8?B?SHArZzhvU0NMVkJZTVAxVU9TUHFQak9EdHR2ZTVQWWw3VlBLOWRGb2FEMzI5?=
 =?utf-8?B?N0FqZm95dGJma2ZKaG1JZ2ZBeXlWMzRQQVRGanhuc3pHbnB1TFpZQjdneTRV?=
 =?utf-8?B?dEx2K2FPQjhCa3JkeGlITXhRSGRrVlFweEl2UFMwOFNLd2NxRmFHSWROeXFE?=
 =?utf-8?B?U21vbTZISXY4YzJkS0V4SUlIVDZPSldaeTg1bitrZjJaMWtCYitnTW14bXVo?=
 =?utf-8?B?UUFIS3VCTkJ5QmhSNjZlbUs0VThwTG1kcTNNSWprczhFSFRIeW8xSWlTbUlk?=
 =?utf-8?B?TjlvMHowRWx6TUhSM3hMUHF5Q0l5NGJlem1zOXdRTlp3Q295WExOZG05TXJG?=
 =?utf-8?B?alRkeW1xc3hEMkFIUTR5YzdDejQ5cHFSc2cyNVZPVHpqcm94R2lzSW54allL?=
 =?utf-8?B?YVZOUEdOK1laNUZ5SkpIOWtYckErSVJER1dIWldIamtXQjJGK2RGOWl6bng0?=
 =?utf-8?B?NWNSd1p6VjRJeENHdzIvUk1adlNOMFZrQnFmNlptSVVlMWFWaStvR2VLWnpB?=
 =?utf-8?B?cE5ERFZyUU9jbVFkK25JM2ZXRXV2OXJsSG41UTlRbEtIaWJQQTF4UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a558b828-3574-4867-aca1-08de74ae40cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:41:29.5980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0o2ZKkbyrcEVHsxzBrioDfryleJq0OQCLhu9U9sq1S8S//EbWtu2TOjlqn1fUblHmMKaWXhBZQX89lSXiHosng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,gmail.com,weathered-steel.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: A020D19D5D1
X-Rspamd-Action: no action

Hi Alex,

On Wed, Feb 25, 2026 at 11:38:31PM +0900, Alexandre Courbot wrote:
>> +//! # Examples
>> +//!
>> +//! ``` [..]
>
> This is a very long example illustrating many use-cases. It is long
> enough that it is difficult to grasp where each example start. Can I
> suggest to aerate it a bit by splitting it into several examples, with a
> bit of regular text explaining what each example does, similarly to the
> documentation of the `Bounded` type?
>
> You can hide the creation of the `GpuBuddy` after the first example to
> keep things concise.

Done. Split into four separate examples with descriptive text between
them. Subsequent examples hide imports and buddy creation with # lines,
and adjust based on your other suggestions.

>> +//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?,
>
> Why can a `BuddyFlags` creation fail if we give it a valid value? It
> looks like its consts should be of the type `BuddyFlags` themselves so
> we can use them directly. Actually, we should probably use `impl_flags!`
> for it.

Good point. Switched to `impl_flags!`. I made it wrap `u32`
and individual flags are `BuddyFlag` enum variants. Construction is
infallible. Invalid combinations will be caught by the C allocator
at alloc time.

>> +//! for block in topdown.iter() {
>> +//!     assert_eq!(block.offset(), (SZ_1G - SZ_16M) as u64);
>> +//!     assert_eq!(block.order(), 12); // 2^12 pages
>> +//!     assert_eq!(block.size(), SZ_16M as u64);
>> +//! }
>
> IIUC there should be only one block here, right? That for loop should be
> replaced by a call to `next()` followed by another one checking that the
> result is `None` to be a valid test.

Ah, good point, fixed as follows:
  let block = topdown.iter().next().expect("expected one block");
  assert_eq!(block.offset(), (SZ_1G - SZ_16M) as u64);
  assert_eq!(block.order(), 12);
  assert_eq!(block.size(), SZ_16M as u64);

>> +//! drop(topdown);
>
> Here is a good chance to mention that dropping the allocation will
> return it - it's expected, but not entirely obvious when you read this
> for the first time.

Added a comment: "Dropping the allocation returns the memory to the
buddy allocator."

>> +//! params.buddy_flags = BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?;
>
> Let's recreate the params for each example to make it self-contained
> instead of modifying the first one.

Done, each example now creates its own self-contained params.

>> +        if flags > u32::MAX as usize {
>
> These `as` conversions are unfortunate - I will try to graduate the
> infallible convertors from Nova into kernel soon so we can avoid them,
> but for now I guess there's nothing we can do unfortunately.

Since I switched to `impl_flags!` with `u32`, the `u32::MAX` check
is gone.

>> +        if (flags & Self::RANGE_ALLOCATION) != 0 && (flags & Self::TOPDOWN_ALLOCATION) != 0 {
>> +            return Err(EINVAL);
>> +        }
>
> This indicates that we should use the type system to prevent such
> constructs from even being attempted - more on this on
> `GpuBuddyAllocParams`.

The C API supports flag combinations (e.g. RANGE+CLEAR, TOPDOWN+CLEAR),
so we model flags as combinable bitflags via `impl_flags!` as you suggested,
rather than a mutually-exclusive enum. Invalid combinations are caught by the C
allocator at runtime. Also fixed a bug here: RANGE+TOPDOWN is valid in C
(TOPDOWN is just unused in the range path), so the old rejection was wrong.
Removed it.

>> +    pub base_offset_bytes: u64,
>
> Let's remove the `_bytes` suffix. Units can be specified in the
> doccomment so they are readily available without making the code
> heavier (`dma.rs` for instance does this).

Done.

>> +pub struct GpuBuddyParams {
>
> This structure doesn't seem to be useful. I would understand using one
> if `GpuBuddyParams` had lots of members, some of which have a sensible
> default value - then we could implement `Default` and let users fill in
> the parameters they need.
>
> But this structure has no constructor of any sort, requiring users to
> fill its 3 members manually - which is actually heavier than having 3
> parameters to `GpuBuddy::new`. It is even deconstructed in
> `GpuBuddyInner` to store its members as 3 different fields! So let's
> skip it.

I'd prefer to keep the struct -- all three parameters are `u64`, so
positional arguments would be easy to silently misorder. The struct
also makes call sites more readable since Rust has no named function call
parameters.

>> +pub struct GpuBuddyAllocParams {
>
> This one also feels like it could be rustified some more.
>
> By this I mean that it e.g. allows the user to specify a range even if
> `RANGE_ALLOCATION` is not set. A C API rejects invalid combinations at
> runtime. A Rust API should make it impossible to even express them.
>
> [...]
>
> That would turn `alloc_blocks` into something like:
>
>   `fn alloc_blocks(&self, alloc: AllocType, size: u64, min_block_size: Alignment, flags: AllocBlocksFlags)`

The C API supports combining allocation modes with modifiers (e.g.
RANGE+CLEAR, TOPDOWN+CLEAR), so modeling the mode as a
mutually-exclusive enum would lose valid combinations. More importantly,
if the C allocator evolves its flag semantics (new combinations become
valid, or existing constraints change), an enum on the Rust side would
break. It's simpler and more maintainable to pass combinable flags and
let the C allocator validate -- which it already does. The switch to
`impl_flags!` will work for us without over-constraining.

>> +/// The internal [`GpuBuddyGuard`] ensures that the lock is held for all
>
> `GpuBuddyGuard` is exported and not internal though.

Fixed, removed "internal" wording.

>> +    base_offset: u64,
>
> This does not appear to be used in the C API - does it belong here? It
> looks like an additional convenience, but I'm not convinced that's the
> role of this type to provide this. But if it really is needed by all
> users (guess I'll find out after looking the Nova code :)), then keeping
> it is fair I guess.

Yes, `base_offset` is needed by nova-core. The GPU's usable VRAM
starts at `usable_vram_start` from the GSP firmware parameters:

    GpuBuddyParams {
        base_offset: params.usable_vram_start,
        physical_memory_size: params.usable_vram_size,
        chunk_size: SZ_4K.into_safe_cast(),
    }

`AllocatedBlock::offset()` then adds `base_offset` to return absolute
VRAM addresses, so callers don't need to track the offset themselves.

>> +/// # Invariants
>> +///
>> +/// The inner `_guard` holds the lock for the duration of this guard's lifetime.
>
> Private members should not be mentioned in public documentation. Also is
> this invariant ever referenced when enforced and to justify an unsafe
> block? If not I don't think there is a point in having it.
>>
>> +pub(crate) struct GpuBuddyGuard<'a> {
>
> IIUC this type can be private.

Done, made `GpuBuddyGuard` private and converted to a regular `//` comment.

>> +    pub fn free_memory_bytes(&self) -> u64 {
>
> Same as struct members, the unit doesn't need to be in the method name -
> the doccomment is sufficient.

Renamed.

>> +pub struct GpuBuddy(Arc<GpuBuddyInner>);
>
> Most people looking for the documentation will reach it through
> `GpuBuddy`. I think we should either move the module-level documentation
> to this type, or add a reference to the module so users can easily find
> how to use it.

Ok, I refer to the module-level doc on the struct.

>> +        let start = params.start_range_address;
>> +        let end = params.end_range_address;
>> +        let size = params.size_bytes;
>> +        let min_block_size = params.min_block_size_bytes;
>> +        let flags = params.buddy_flags;
>
> These local variables are required so the closure below is not confused
> by the lifetime of `params`. But since you are copying its content
> anyway, you could just make `GpuBuddyAllocParams` derive `Copy`, pass
> `params` by value, and use its members directly in the closure.

What I will do is just pass it by value (instead of the reference that I'm
currently passing), and then let the compiler decide if it needs to make copies
or not. In the future, if we change it to not making copies inside the function,
then it will just fallback to a non-copy move. However, if implemented as copy
trait, it might always be copied.

Actually, it turns out that when I pass it by value, I can also get rid of the
intermediate variables so this is great and has the effect you were intending!

>> +        // SAFETY: list contains gpu_buddy_block items linked via __bindgen_anon_1.link.
>
> IIUC the type invariant should be invoked explicitly as we are using it
> to justify this unsafe block (i.e. "per the type invariant, ...").

Fixed.

>> +                self.flags.as_raw() as u32,
>
> You won't need this `as` if you make `BuddyFlags` wrap a `u32` instead
> of a `usize`.

Yes! Done.

>> +// SAFETY: `Block` is not modified after allocation for the lifetime
>> +// of `AllocatedBlock`.
>> +unsafe impl Send for Block {}
>
> This safety comment should not need to reference another type - how
> about something like "`Block` is a wrapper around `gpu_buddy_block`
> which can be sent across threads safely".

Fixed.

>> +// SAFETY: `Block` is not modified after allocation for the lifetime
>> +// of `AllocatedBlock`.
>> +unsafe impl Sync for Block {}
>
> Here as well. I'd say that the block is only accessed through shared
> references after allocation, and thus safe to access concurrently across
> threads.

Fixed.

Thanks for the thorough review! Looks a lot better now, and I am looking forward
to sending the next revision soon.

-- 
Joel Fernandes
