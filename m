Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA2AA7E38
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 05:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036AE10E0B7;
	Sat,  3 May 2025 03:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WUnvF3Al";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F2310E0B7;
 Sat,  3 May 2025 03:02:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej64ORcQ3a6IJMV77qulpv9YXeodL+TCcvbb2rH5b6qgz7o6LyE7gYLpn1yQcBtm2XrX53H/uMcIORqcK9Zbt6zYKMbvP/mFeDVo5K5HSDTAcKWLA8LY5Je6bimutSDRB/Ko/rPJyay5ihfJh9xAiQb3tkDkSl0VxhhH5FKxd26jnz3VD3FkNoaYP7+Scznxso3n7bQbgnS61Jk0esC26uQDBIyaN8qvK+ajSowdZHcXEhzUFAZiUAWMSddYkX1pSCXXZ8F1eGNUuzvvHHY+nc3ywuSVPwDXbRo8C+i6TYLs265Y07QQP9kqxiAKIOMrRaO+8zOmLELBdfPkBlYa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rqlWUIOJybB9vHH8jPyXvhq0vfllN/ojE9q2iT/MtI=;
 b=eL0GI+iT9JxdCghUbbrrP24llniqhZemQj8EklTEqmNWHzGh6QNY1nU3imn1kHUqj4ecuFGxhTETGj6PcrNSUkDjmN//jW7LVf2pZMQ0jWGxxUtOTc8UP+OvY3SYhZMBF8DFyKHR6Z6yEW6QfMVKrCqPDCozlcyrGXsLS4UsegUe06fOHChqyNogh620iFOfko8SQtlD92eyAtxUe2OU/xqS08gLVtqsU6ob8kSb1g1oMv6VjQt5Q8XmKnGX6RBnOPRS710inzB1WXiFdw2CquocT1/y/wD+lzZQduyqvyy/ETvqH806tD4TfimilG/z5hDRDGAn3BBATNa6q2/+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rqlWUIOJybB9vHH8jPyXvhq0vfllN/ojE9q2iT/MtI=;
 b=WUnvF3AlEeg23h+cmDze82kMDn89rqyNGt0fqIkGo7rtOL8Jn5Y6Bz5Th3tgeYiI03pmV1bPIytMV+zwHmBCmWIiYbqU9E+vcODgR1ESgWWKjs9BZtgaJhGwXSAJPYyRjk3PuYpFWL0fdakfKTTs7LFfx3sdH8r8RDQMW/LD41w4vR5bLB5o+DEVlKbTs7ubT2Q9kkZvycf30vCtMBma1rooKK+KVgG4QkvBQb4R2HAqH1VfH0htGhAOehTb9bR4hmfqfkWVcxOdohBu1GChHfbD9ucTpemDfPFpyMsqlX78QztUw33/ealuvTtwKSw8UAiFX7CDISnlZEJ9s8WM/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 03:02:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Sat, 3 May 2025
 03:02:24 +0000
Message-ID: <112d971f-20c8-4598-86c9-6822d9c24001@nvidia.com>
Date: Fri, 2 May 2025 23:02:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <D9LEQ1U1PLO8.3N22GRY380ZM3@nvidia.com>
 <d6962ea3-282d-437c-b3cf-ce701d514558@nvidia.com>
 <D9M5K55GTN6S.1X827WU0Z50UM@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9M5K55GTN6S.1X827WU0Z50UM@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:208:134::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d305e2-3316-4718-0867-08dd89eeee07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFVJZUxFOWx3OXNIY0RpYis4RElYWEZ5OFR2VVk5WmE0RmZnV3o5YzEwL290?=
 =?utf-8?B?MTVCdC81bFVDcmF2cUIvdVZhLzJBWXE0T0RnMHR0RXZEaFVtS2lGekdwWE1K?=
 =?utf-8?B?WFZ5NDdzckZSTEp4RGhVNGNveDYzZW9WQ24wUy9MUHJFSjFHSk9rZ1NGZ0dr?=
 =?utf-8?B?WUlsVmFpS1VBekRndlRVajVUSi9rdENFSWJtZjk4OXY2TXdZeUdWcHlXLzRs?=
 =?utf-8?B?MG90ZnB5TCtObUF3T0xYdkNiR2JhTlpSaXdBRWVTQit4MW4zalpIVW9HTUp5?=
 =?utf-8?B?QjdVdzExY0V1WWVTQ1g5S2pxYjJ2ak9DRFd2NXFNbjVQQTJnWUM4VHJLZmJa?=
 =?utf-8?B?N0x5Z2N5ZUovY0doMzVaTzFUdENPbjdtWjlyWFllMlEyWFhNZGtuRVgyOUYr?=
 =?utf-8?B?aVNSNDNNZnZGTkR5elQ0ck5VanQwcytaNktYRng1NHBxUUk4UElyMGNUTUZt?=
 =?utf-8?B?V2Fnbi9icENpajVRVGYvTWE5aTllR3Q1enpodGNPOUh3bzhnT2hwRG5GdXl5?=
 =?utf-8?B?TVQ3ajZZL25ubjRNcGUwY3RuR1JqUEFhc1VuaGhlRFZhN2FOMHVIQ3l1YUk0?=
 =?utf-8?B?ZnEyeG5LeEhOZE1NOXYvSUdIU0k2WEluTDRGVlNvdGlmVGhzby9rdDhQMEdR?=
 =?utf-8?B?a1VLQ0V5d1hCWTBoejVHdDdRSXl4VnBzYUhKM25ud3hDV2hVV0crR3ZiWHF0?=
 =?utf-8?B?VVNDcWJ1aU5FRHRjblV2ZTZReHo4L201VmJhM2NkQXBGVEx0NjdnT1NuU2NV?=
 =?utf-8?B?K1RZbjlJYXVoVkJXd2ROU1JSOFlYQ3NMVnRKUUtic2NPOTY2NDhUejBHa0Ev?=
 =?utf-8?B?c2xrUmUwSW9YRlc4N1NjRmI4alJCNWs4MVF3SXJTOElZL1dhSm9oU2dQVDdH?=
 =?utf-8?B?SWg0NFViRkNiTFRJdnNxNGFBby9KK0wzN2pPYmc1d3pVdFpYMmlUazRCOW9U?=
 =?utf-8?B?WUo5dG9ZdVZ4K2hSbWVtaTllMUVsV3FYcUpTY2kwZFNIV2s1OWZWSDZ0N2hw?=
 =?utf-8?B?cUtsc3Z1WFUzdDBJUkkveXBGK2ZHcTZ5NFoxQzlxTVB0djJkL0xwSS9rb1pU?=
 =?utf-8?B?YzcwZVM3OHNKOXliN3A1bFVRajRLNklQM2tXYVBVN2RpbTdSdDY1aUdlU1NT?=
 =?utf-8?B?ZlZHS29uUnU2L0RhUC9haGE2T0Y4SlpuZGd1TlY5d1c3bzFnTGQxc1NMUmlk?=
 =?utf-8?B?SDcvdVVSdy92SGMwSjBKcytuWjdGWU53REk5dnJNYk8vTXJsd2pjOGdtcmQv?=
 =?utf-8?B?emNiWExkK200OEt2QmdKOU1MdjByajNqR296SHpYekZUaStmRVB2Y3E4alVP?=
 =?utf-8?B?TGR3UzlBeXpac0dmNHFnSnVLL0ZXVmZGS3JubGZmK2lOdW1uY1k5eHU5dXE2?=
 =?utf-8?B?VVdpRDZxN2tlQ3BJTEplTzF4bFJodWl4Y0ExL3ZVQzkvMWNNRVdQbHhMZkRP?=
 =?utf-8?B?VDY5c3F3M0VOYVNVQXlieHhYZitVWlJuTXc1aVdPOENPblJqYXkydjU3cEgw?=
 =?utf-8?B?Qjg1VXdqMlI2WHlBWEhxNmRvbzlYR3JveG1pQ0E1bFN6SGVzZHNLNThlSW9m?=
 =?utf-8?B?K1FqNG9Sck91d05LQXBCQ1hKNDhyN3FReUZJc2R6aUI1VjBVdXg5NE15aVhV?=
 =?utf-8?B?TDlENHdWMGRtUjgwVTF6YnVkYnAxZ3JSNkYzN1pyc0ViUU1IZ2RpdGJ0QXBK?=
 =?utf-8?B?QzZpOVJaNCtkRHRaaGQ3dHZ2ei9iTTBXLzYrZ04yQUllOUM1UGZWbjl4TVFy?=
 =?utf-8?B?blpUOU11alcxQzFYc3paTVI5cjM1bXpwYnZzSSsyMVhuQ3ZrbGRFSWZLR2Nq?=
 =?utf-8?B?QzNzb3FEV2VjU0RVTjNpa3FxMXdPcFhEVVlvTEh5a092V0VpZnc3SzMwTTBw?=
 =?utf-8?B?NmVVRnBsYUw0ckVLZjlYbEtvTEdsVVJDa2s4emJnREZCN08wdUk3RnIzcjNV?=
 =?utf-8?B?OVA5czJiT1lva01xOHM3cUE2bXhwNTBwM21ud3U3L3JoZFhITExYMFlYZm1B?=
 =?utf-8?B?YnVpZ1Z4VWVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjIzeU5kaXpodTZCTEJ4LzQ4ckxmUUJFSUt5di8zZnZNSURPSTd2RVljeTlF?=
 =?utf-8?B?RzhkWDZQdUtuY3k0MExaN2E3QUhta2IvdFVzQWkxQkRhVytQVS9CQ2p4REVP?=
 =?utf-8?B?bC96ZlRZTCtIUVRPRFZZcFdtQ01vUzRVM3Nqek11U1ZzU3VTd25OYy93anNE?=
 =?utf-8?B?YnU5eXZZenc4R2JDbFJQNGV6OWtFRCtDY2JXanJtUUNxbUYzK2xxYW9KTjMz?=
 =?utf-8?B?RlBPdFNpdWluTGVqalBTbFh6a2RUK0Q5NHBSYlhmWGZjTFoxMU03UDBaUTVz?=
 =?utf-8?B?ejFZS1d6eUw5YXdHci94eEUzNkZoVEhZY3Q5MitlbFU5bFR6ck9ZVHJPcjRs?=
 =?utf-8?B?QXk4b0k1YVo0RFl3b0ZmRGRWK0lSbzJER210bWNmNWw4bUZvc3RzRjNXK2Ey?=
 =?utf-8?B?U2RuWEF5NVJRL2tYRFN3Zyt6RUhWck9pZWdQYkMwOEdWdXhWbUIxUTFJU05j?=
 =?utf-8?B?eXNSamNuanBHL3BESUNzYXJHZ2FKRWJxMEd1ZnV0WXBjREYrWW0wRGtWSWJI?=
 =?utf-8?B?bm00QnlUZUZPN0N6RGdCNzV3TGNlYVBoclp3cDF4RGZSV3h2RE9GN2JHdVp3?=
 =?utf-8?B?TEI4d0FPcHRZM1RpWkJManMyWjJUV25ZVlA4UTJxc01FYjJ0Wk5sWWtPT2tu?=
 =?utf-8?B?eWhhRzhpUTRsSHhKN3VhMDlGODdWMzVQSnFTWTBHTE5UR0M3aTZuMWhUbmYy?=
 =?utf-8?B?bzFzNloxSXhJR3crZTZYWkpJcU8rVmpPOXRSd2ZzYktOejh1a1g3aUxMa0xX?=
 =?utf-8?B?MHVyMHRybE1FSEJ0bGQ1eUdkcG83WlVINUxtSnZMQmJOVWZXNnhZREdyeWhZ?=
 =?utf-8?B?L2xlZXdqV3lhd3NKTFNPdWkyZUdNVGZxeWhPcWYzVWFKZEpSMlRuTmNZdklj?=
 =?utf-8?B?dEFjaVRBYW9uUHN4NzBQU1hjQzk2KzdqZFhJbnhoeUNQcjRTNnVoOWtnRmhL?=
 =?utf-8?B?c0g2V3MybjUxVmwyWjJwRktscXB2R0orNGI3cm52YUhFemJjS01rSDhaNlJw?=
 =?utf-8?B?cmJWekJFWjhVdnRBdDEvNVhTaXZRVlV6dUhKRDBpeGFRVWorZitHRzRwaWJG?=
 =?utf-8?B?Z2cyKzdDN1pPN1pNbFVjTktPbWZkSE9vUXFrb0JBRzFwVlZyL3BwelhCNlMr?=
 =?utf-8?B?aFZTRzdsOHN1MlE0ZzFqQ0dNQStBSGVabUpqYm1oUHFjTnlRL2JvVnJNbzh1?=
 =?utf-8?B?N2FZQU5mdlpSU3lmcDM1T2FYcGFQd1ExblBYc3FOS3VGWXkrODhtQThwNTc5?=
 =?utf-8?B?d1Uyb0IrUit4ejZ3TUdNbm42ckQ3ZTVEUDAxSU9kOExjN3dBMGMwRHFMS3Vl?=
 =?utf-8?B?NG5lZGFrNlZGK3Z2aHhMT0xxQmR6V3dUcVNGV2lZNkpkT1Z4ZFp0L28yMGQz?=
 =?utf-8?B?TlJmWVM5cHR3WXhMdXlybGFqUStNWFZhamxPWjFVNjRadVRNQVJneFNKVjc4?=
 =?utf-8?B?S0I5QWZPdHNlcUFYVXJQNmd3b1IrZ1k2VTFuOERCcXZoRnppRnhaYjlPTFB1?=
 =?utf-8?B?VDVTZkJQaTdsL2ZOTzMwYVlRWTZLMFV5RlJlaEZkVldGREVNZmxCd3Roc2xi?=
 =?utf-8?B?STV1WG1kamM3R1MzdmdKQTJrNVRGcDFITzEycFVPZ0psTkJDSmZTNWlUalli?=
 =?utf-8?B?SG1UczdGUHpidEREVGZxU0JHakVETExuQ3diZkcxTlZEUlRuUG13K3NuMmlu?=
 =?utf-8?B?VG1LUkoxYm1zN3hDejRSbVNJMTlkSURROFJPQ2NFbXZIMktKeWNydUJkbVor?=
 =?utf-8?B?UnZHNmkwckUvNS9wc25MVW00dHhzSENPaWZKQjVmbGVxZHhiaGxPNkhaUjgw?=
 =?utf-8?B?ZUxQSjV6RDI3bTd6WEZnRlNFTTVxVlBPbHpGaHJuR2NlSzd4cTVkaHAxZkVk?=
 =?utf-8?B?ejdxQUpFN0RYc2JoaUVCWkVDSzcrSFhJSkczV0svU1FucUhyd1R6am40dTRG?=
 =?utf-8?B?VEFSSnM4WVBqbzBaODU2OWRIeHNNWVFIRmx3TjBlenpXRDFENEE3NDhuOHNn?=
 =?utf-8?B?U25vbmk2RFdXUXRBL0Vmc3IzZVdvamZYQ0JGKzlVOHRWL1VHZjBua3JuSHN6?=
 =?utf-8?B?SU4rc203Y3BuS05JQnU3ZytmZzFWZ2hkVENMVW9WMTh3cFdrUlJFRDBuaHNK?=
 =?utf-8?Q?Zm0qz0qAVObEU0nJMQXqti8nK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d305e2-3316-4718-0867-08dd89eeee07
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 03:02:24.6891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dcf04SQN3Z+jaYzo/fDp6U6k5IiZottWFPcIixw4c7YLSLShLt/NUC1cPkC0CTfMtMpOIHOSKk3rHZYM0NfaBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462
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



On 5/2/2025 9:59 PM, Alexandre Courbot wrote:
>> pub trait AlignUp {
>>     fn align_up(self, alignment: Self) -> Self;
>> }
>>
>> macro_rules! align_up_impl {
>>     ($($t:ty),+) => {
>>         $(
>>             impl AlignUp for $t {
>>                 fn align_up(self, alignment: Self) -> Self {
>>                     (self + alignment - 1) & !(alignment - 1)
>>                 }
>>             }
>>         )+
>>     }
>> }
>>
>> align_up_impl!(usize, u8, u16, u32, u64, u128);
>>
>> Or, we can even combine the 2 approaches. Use macros for the "impl Alignable"
>> and use generics on the Alignable trait.
>>
>> macro_rules! impl_alignable {
>>     ($($t:ty),+) => {
>>         $(
>>             impl Alignable for $t {}
>>         )+
>>     };
>> }
>>
>> impl_alignable!(usize, u8, u16, u32, u64, u128);
>>
>> pub trait AlignUp {
>>     fn align_up(self, alignment: Self) -> Self;
>> }
>>
>> impl<T> AlignUp for T
>> where
>>     T: Alignable,
>> {
>>     fn align_up(self, alignment: Self) -> Self {
>>         let one = T::from(1u8);
>>         (self + alignment - one) & !(alignment - one)
>>     }
>> }
>>
>> Thoughts?
> I think that's the correct way to do it and am fully on board with this
> approach.
> 
> The only thing this doesn't solve is that it doesn't provide `const`
> functions. But maybe for that purpose we can use a single macro that
> nicely panics at build-time should an overflow occur.

Great, thanks. I split the traits as follows and it is cleaner and works. I will
look into the build-time overflow check and the returning of Result change on
Monday. Let me know if any objections. I added the #[inline] and hopefully that
gives similar benefits to const that you're seeking:

use core::ops::{BitAnd, BitOr, Not, Add, Sub};
pub trait BitOps:
    Copy
    + BitAnd<Output = Self>
    + BitOr<Output = Self>
    + Not<Output = Self>
{
}

pub trait Unsigned:
    Copy
    + Add<Output = Self>
    + Sub<Output = Self>
    + From<u8>
{
}

macro_rules! impl_unsigned_traits {
    ($($t:ty),+) => {
        $(
            impl Unsigned for $t {}
            impl BitOps for $t {}
        )+
    };
}

impl_unsigned_traits!(usize, u8, u16, u32, u64, u128);

pub trait AlignUp {
    fn align_up(self, alignment: Self) -> Self;
}

impl<T> AlignUp for T
where
    T: BitOps + Unsigned,
{
    #[inline]
    fn align_up(self, alignment: Self) -> Self {
        let one = T::from(1u8);
        (self + alignment - one) & !(alignment - one)
    }
}

Thanks.




