Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E66C99693
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEC710E4AC;
	Mon,  1 Dec 2025 22:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vovsw1o4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012010.outbound.protection.outlook.com
 [40.107.200.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BA910E4AB;
 Mon,  1 Dec 2025 22:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrXxRiSpH6oGajs5WfyCJnIWQyu6ud6crbGG4uA2Ta5uo2LY3+lBagayON0I6KkEiPFiVetuWhsmmp7dSfGM8pYSztTIV3xrb7hFxgisQDd6aWDQJSJ+MQmiB1/E5cF5sJaZRnQLsIG7qDvDay8ZYIJPQH8Gpa+KiJ/tYlOmEuZWlVh7DlHk3TIzg/xoRVAvABFi8Os4DlQLwGoDqMwoIaXucFnDuedikTl/KurkpMvs41Zcuz0Jy7AlhW1FLIeRh6a5IoI1l+sBIOsySGNUEqMJEbSvyS8i3UBZkjBNgOKJB4PAytSvL4oEiBTHbszB1Jp69Q1DIJ67qcTgUKWGjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgRStEoethaKbB/6GKUk7O7KExx6CoK/uEjHT/PwInU=;
 b=FrzdM4TQNn/ITcUMT5rgNZA/Hv+ACrVKa2sgtpKkKBPIpouZ2CKLSh0LizdGsxNC/cHov7S1PZf4N3VX3Bvul2w/zlQwXDWmLQZ17cSNSfqbykFQ4M5XnUsab48kiDiIF1jv3kUdA+yTZzG+3o/yBvxZ7bt8cH/pHrV4uv16i6SUWmz+OzeP3SgiZjrjEAHNV5XwT1uQC1egUSODPJKu8bVEwCmwEAXQ5WP2okyQG5QFyAn6DYOZzAXDBUizwTyvNWfQOAsyb8WQRS0RG9GsPB8iojb3PzSLKfbvLoswkNNG85rQyf3vslITMgUeRx1m5abUbJPCvAdbddKBN3WYZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgRStEoethaKbB/6GKUk7O7KExx6CoK/uEjHT/PwInU=;
 b=Vovsw1o4tf36deQ8h/xdai2+7ZXs7Y3fY7o5EcZt7YxsA83c6LODORj+NFDNMdEAxpVu13Wg5VfU4lkwBHrpSsTKCOcwkLCHke3RapelngtdSpjCEs38hieo6GST1Tijm2ZQm0cMgAIbYyyXfpO89KJ7zfS3Cy2E5mncsjYnm0k9YPQzdoe/+ADaT0YlKvCjnez8PGJrn0VPfCwqIxGmGM8BC1lbBFBvYZkCXAurLahjSi2eLkSTGfCY7NQZgYkrkBRSI/ktSQCJLv2dqn4m78bRCQYr5xvcuYuuCLJHewEhHlkdahrNVF7+BAdD3zpqEJUsTLbNpu6mRljq4LW1yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 22:43:15 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 22:43:14 +0000
Message-ID: <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
Date: Mon, 1 Dec 2025 17:43:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR1501CA0032.namprd15.prod.outlook.com
 (2603:10b6:207:17::45) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c3db66-2c42-461f-8ad8-08de312b039c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SSt5VTNqNTN2UzJERUJrNGlqV3NudUlZaDJ4Z2phdmc2TEN5NlNpQnErTEhN?=
 =?utf-8?B?c1hDSnBUSUlBSjJvcFQ4cVJVM1lnWlFKMGY5aWYzK05GWTdKaDBzRk9Oakx1?=
 =?utf-8?B?UnFHR0E5aFg2Tk9ya0FEdk5UcVJ2TkdIRCtDSHNTbmVsajl1cWZtNVpGWm0w?=
 =?utf-8?B?NlA5dzZKTzVqa2dNZ0ZENjhoZTk0WGNxOGxHY1EwVEEwSE5BcTkxWFh5ZVlX?=
 =?utf-8?B?TENBTDVDaktnWmltZWRPRGhRVWM5MUsxVmdqSmd3N1NzdTl2TnhERmxyMkNw?=
 =?utf-8?B?blZTZXhCQU8xcXVwV1piOVIvbmhkdHc3T1B6V0o2Nk83Vy84a1lnelo5OXRj?=
 =?utf-8?B?YVZpRW85VThLcXd2bGNncFVJVVdKQTl2aGhwQWFBeFYxZ0h3STQ4NnhCVEdt?=
 =?utf-8?B?WGNWOWhoMTNveld4OEFoUkpTR2RRUWZza3UrVVM1aUdDMlcyVDlFWWJ2NWta?=
 =?utf-8?B?RURxaGlrOGxGZ09takY1WWsvTTAzOGh5NU5qWmc4RGNaRTZjY21tMHNPSmho?=
 =?utf-8?B?WG1nZjlqVnp1ZEMzR3ZnZ0xqU3pKdzUzY0xZRnRVUjlUMy9zMlVkZTkvVHZs?=
 =?utf-8?B?RGdJVHJ4SGZxNjgzS1BSSk83cXU1c0JSQm9KQ0grOExIQW1uZVJyQ3JWNWdt?=
 =?utf-8?B?WjR6WUY0ZFNOZndGVmpYM2ZDZ016UFlnK0cxUkF1Zyt1SHF6VU9PSExkYktO?=
 =?utf-8?B?RW9oRWpxbElOMjNnNldPdGxGM0hhMVJZWXNLTUhIYzlUdVZZdDNQdXZlQWpS?=
 =?utf-8?B?WUFpc2NBV2JHRHlQL3VYcUx1NGpwTlJUSXRwQ1FuQ2Q4b1I3dDZCME95Wnp3?=
 =?utf-8?B?WEcyKzV6cFhjalQ1TjBHb2tGNG9GSVFQMUdPdHBmNE85anVURU5Cdmo0SzZW?=
 =?utf-8?B?VDA3cG14dUFJbHpxTFBzeTE4R3dPSENSWndxV3JOS3dKaVhJQXNSaWFURk5F?=
 =?utf-8?B?MlR5QldGUnBkUFV0SWJDZ2xnK2xDMUFHQXRlM0d3d2IzbEllNC80Q3FleEkv?=
 =?utf-8?B?Q3VHWkhFQUQwd0NHSjlCSTFOUlJObXZHV3BwdDZ1cEl5Uk9vYUt4Ym5YNkkx?=
 =?utf-8?B?SVVNLzNkOFEzVUlkRWdvM2o3bUxwQ0JONVRWY20vRSsrQTVpeFNiRFNQajhI?=
 =?utf-8?B?V0tRNzhCdkQ0RmdkZFVTMUxMUGRUeWVnMHJPZmN5aDJWeFB1N2Y4emxhRk53?=
 =?utf-8?B?TzB1TEFlL0NLeXZMMHNXK0pMaE92Y0NqWjk2TEx0VVBDUmRpNlVzRlcwQ09W?=
 =?utf-8?B?WnVhSHFLNDZjMkFCcEsyYjQzeW5neGJXWndIUGxybDJtQmQvNzFPL2pkQmtP?=
 =?utf-8?B?WXZ0aE5Qa2JmNkQ2ZE5pZ1hvQm9vQngxeTMwNE5HUFB0ckcweTlZTHp1Rm5y?=
 =?utf-8?B?Qlk5VTRwYnYzWG0yN056RVU2Ni95QkVWTGdxdzYySHpHNmZKVFF1ZGp0cVhS?=
 =?utf-8?B?TDd4b0h6ZVpTRXJhZ3NZM2FlYWNYR1hacnVjZFcyT2htZ1lMTVBqSjBHbDlr?=
 =?utf-8?B?bjF6ejdsMDVseUZpeUMrWjdDbTdLS3lNcDVJN3ZaQkRCcmtHRkhLZGxadUFX?=
 =?utf-8?B?OGpvbjVKOVdYQ2t0NUtCaHB2WGpDUk8xREp5K25ieUJkd3Z0OGxMcDZjMVVI?=
 =?utf-8?B?d0VILzBQWGduWEtUVWpFRHNNdUZNUk9PcE1KWXRFelNzRHRnRjZsRTdBSTRY?=
 =?utf-8?B?N0pPSFJmUXBWbk9QcERvVEhyNnZONzBVemdRVkt1T3c2V3QzcnBUK2tBVEJM?=
 =?utf-8?B?REJ5azVmZXUxUTIxZFFwSTNVeHhsY3pWdTludUpxTGVkMkdmVGhYQktONzVx?=
 =?utf-8?B?OTRlOVB6NVdzeXZxVGlHbzg3ME96cjRjRzlHV2E4OWs4b2tydDZRVzBPVmEr?=
 =?utf-8?B?V2gwdVpQZlFQeFIvWTJDRFR5ZGd3SFhKbk9HTlR4Qm5mL3VzbEMwNXVvN2ts?=
 =?utf-8?Q?3abq5jx/QTSTC9hi7bkW6/MQ6vexFvyx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTlBZWRXbzE2M3lNWmJqTWxoZmZUbUxFdG5PaU9peUF1cG5wM0RGZzB2QkJS?=
 =?utf-8?B?bGIzVFlrTG1qY2xndVd6NzJUb0sxb1ZaYVh4N2hwMERqclFKYlJkbnFQU2Jm?=
 =?utf-8?B?VlRlbWtaaThkUTRseW9vNHBqcHJJbVNDK0lxQUVld2JVQ0U5NDEzRUNvNmNw?=
 =?utf-8?B?ZGFjd1NPUHlKSC9nM1I2bnBNQU1DYmRYNlNJS0M4emV5OE12enBsdlZaL0Vy?=
 =?utf-8?B?VTBEYzJYemlhV04wOXJlN2VBb0dxYXFUdXcrK284K0dycGlRQXpMcXBDcUxU?=
 =?utf-8?B?b05lbEE2NE9pbEpyT2ZvYm5lTTdDNVc1NWFzUERkMkhzVm1ydENjUmw2T3Ro?=
 =?utf-8?B?cG5TRWE3TCtndW1WSkdkSmdzaFhzS0o4ZzY4QU41cUlIOVk3RVRIa1F0NHo1?=
 =?utf-8?B?VERuK1BsUmhYWFV0ZHd6MFJCdmtDdjB1VzdQNWcyaDJRcElRWEZCME1nK25y?=
 =?utf-8?B?K2xBbzZJemt1Wm9HZ21KSnZlSXNCMzJRSWNDbzBxcktSemJZUjRuK2tBYkdK?=
 =?utf-8?B?bmtxK3dFb3pnNmhCdGVOL00xWUNQMUpFZjM5NVJXSmdaVE1pdkNwYWp1OFNS?=
 =?utf-8?B?QTI4NlN3UldKczlENi9rS2o5N0o5MHRvOHVQWE5Fb2Yrb3Y0Y0I2R2taTVYv?=
 =?utf-8?B?czlVWXBqTXpsbm9vNVhQSU9abTlHaDFJUXQ2Y1QvSThsMDdnYWxlNk9tWnlj?=
 =?utf-8?B?T0NEYzVsSWFTNmVRUTAzM2hINzc0ZStFcG0zZG5XNTQzM0NVbURsMlVEQjBO?=
 =?utf-8?B?NDE4cU95ZlRmcUdGNzRGTjFJOEhUNGlldkdkbDBVeWY3R0FUZmJSZmtBa1ZG?=
 =?utf-8?B?Z3lWZWZnb0JsaGFhbWRuNW9GV2lLaW1HQ0RGclhVMnI0TUNycW1KTEJmKzZt?=
 =?utf-8?B?LzFlSzBudHVlYXN6VU9MMEpjRlBiNGFZYWg3TzE2S21mclh3ZEpVTGdqZVBv?=
 =?utf-8?B?aW4rbUdPb2wrMmtWY1RwdGp4YVBxNFFkUTJHN2FzTnhZaTdpcVBnZUo1ZzRq?=
 =?utf-8?B?aW5pSWFrUnJ3VGt1Sk9Oam14aGtKRnRCQ1J0UC96dWNQS0E1WlJObGc0em5p?=
 =?utf-8?B?TUQvSUNZZzgrSDRtYitValBMMXZiZnpOcVZpNDJDRHR6T0Z3ZHNNSExsUmxj?=
 =?utf-8?B?SUY0YmlGWDBLc1RkYlBWRlJodHlWZzBwb1ZaQ3kxa0RGTTkwTUQ4WHJQU01F?=
 =?utf-8?B?WWx5N1lJd05sWTNpZjlXN1RXMGlTUUlVNUZmQW5uUmV2UFRkK01odFVwZ0dr?=
 =?utf-8?B?ZmZmY0hJYVBSSy9iWHpUb3E4cVB0MEI1dFZNK0FMWXJPcmtvak41UThEMkNa?=
 =?utf-8?B?dlNnVXN0Mi8rSTJlMjdKc3Y2TmFqN3hWMHM5SmRuUjVjOWZTdEp1c3hmOEgx?=
 =?utf-8?B?MGVEZ2kwanpCcFNYSVJiWHZPK21CbG91OGVRZGlJR2oyU1FyTEZtaXVSMVdo?=
 =?utf-8?B?NC9LNVRLNlFxajAzL1JmTUdGVXAzbHU5VkEzREZTTFRsT0MyYitSMEN5WFZ4?=
 =?utf-8?B?MGljOTNuZTNNWXI3N3ZVejJtU21TRDRJc21qRDJRRHRsU2RpS2ozalFXRXYv?=
 =?utf-8?B?Qk01WjMxWnlGcVBXb3hENkxhVnFBdW9pYnhXTTMwcE5paXZTQmVHd2hhYUZG?=
 =?utf-8?B?NkJYNlJ2MWMyQkhpU3NKaVRoWFBiRjhjeHFKYTY4VGZQeEZlWFc5SmtxUmFS?=
 =?utf-8?B?SGI2ZjVIWGVDRUtkSCtEMlpTREFTM09RQzNxZkFOQVU2SElVbUppaGc0dWZS?=
 =?utf-8?B?NDdNN0Y5Rk5RTTFDek40Z2JWWElIQ1ExREpFcHRXUXBJdlhJMTROVkl5WmVl?=
 =?utf-8?B?RXhKdnM4Y3poSVgzYU5mbDBRcUQ1Q1dXRUFlMlZSZURRQ0R4TkR4cVdyK0hG?=
 =?utf-8?B?SWY1bFJJanB4Tm9hR0lRVGNNZU1meG55UGtqSmErb2FMdlQ2TnRLVUVTcGh1?=
 =?utf-8?B?ZUVCNExFZDNiajRPMDB5Szg4MHVUTXdXbkVibG5jQ0t5V1FBWEJXNGJiNk45?=
 =?utf-8?B?ekZzczlTT3ZmOExCRkp2ZS9KMUZ1dFpqejhqb0d5UUkwTzNpVU0yRGtjVHVR?=
 =?utf-8?B?L0ovQnFXZjhCWVdycmpRZGJEWXpmRnRuaWozYS9EWUhEMkRYNmtDU1lOUDhk?=
 =?utf-8?Q?9RjMSVTHqRRRv9JOXUMkNNsLI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c3db66-2c42-461f-8ad8-08de312b039c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 22:43:14.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwWATEookUXMypH7FEKRbZUuDA9Z4cKopHsZDvk/Hw65pkAv2JbKo0dYaGMwHZ9BoNsEm3enJ8zpw6gtGlL3xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
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



On 12/1/2025 5:17 PM, John Hubbard wrote:
> On 12/1/25 12:32 PM, Joel Fernandes wrote:
>> On 11/30/2025 7:34 PM, John Hubbard wrote:
>>> On 11/29/25 1:30 PM, Joel Fernandes wrote:
> ...
>>> This is sufficiently tricky that I think it needs some code to exercise it.
>>>
>>> Lately I'm not sure what to recommend, there are several choices, each with
>>> trade-offs: kunit, samples/rust, or even new DRM Rust code. Maybe the last
>>> one is especially nice, because it doesn't really have many downsides.
>>>
>>> Rather than wait for any of that, I wrote a quick samples/rust/rust_clist.rs
>>> and used it to sanity check my review findings, which are below.
>>
>> In v1, I had a samples/rust/ patch, but everyone's opinion almost unanimously
>> was this does not belong in a sample, but rather in doctests. What in the sample
>> is not supported by the current doctest? If something is missing, I think I can
>> add it in. Plus yes, DRM_BUDDY is going to be a consumer shortly.
> 
> Well, I won't contest the choice of doctests, since wiser heads than mine
> have already worked through the tradeoffs.
> 
> But for API developers, the problem with doctests is that no one has ever
> actually *run* the code. It's just a build test. And so critical bugs, such
> as the kernel crash/hang below, are missed.

You may want to read [1]. CONFIG_RUST_KERNEL_DOCTESTS are run at runtime. You
enable it and boot the kernel. The documentation clearly says "doctests get
compiled as Rust kernel objects, allowing them to run against a built kernel.".
And this is how I have run it as well.

[1] https://docs.kernel.org/rust/testing.html

This also explains why you think list_add_tail() is a noop in my patch, which it
is not.

> 
> I would humbly suggest that you build and *run* your own samples code, for
> new code that has no users yet.

Yes, I already have an internal tree running it. :) I am not sure why the
assume_init() triggered for you but not for me, I don't think has anything to do
with doctests since the doctests is in fact just rust code compiled as KUNIT tests.

> Because if you are skipping steps like this (posting the code before
> there is an actual caller), then the documentation of how to use it
> is not "just documentation" anymore--it really needs to run correctly.

No, that's the thing, these are run. You really are in the wrong here and appear
to not understand how doctests work.

> And actually, after writing the above...I still think it would be better
> to post this with its first caller (DRM_BUDDY, or BUDDY_DRM_ALUMNI, or
> however it ends up), so that we can see how it looks and behaves in
> practice.
> 
> What's the rush?

Who said anything about a rush? I am really confused by what you mean. It is
useful to post patches even if there are external dependencies to get feedback.
So this is also an invalid review comment unfortunately. There is no rush, this
is v3 now, did you miss that?

Thanks.

