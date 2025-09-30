Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9242BAEA69
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 00:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5D910E16E;
	Tue, 30 Sep 2025 22:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vu+a5cM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013019.outbound.protection.outlook.com
 [40.107.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7094E10E059;
 Tue, 30 Sep 2025 22:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKEGEDCs9Jv8gsbHZDWDek3S9k/t9OnygrFz0ez01v0vOPhMYvzmiW+DBGsCJERNGyC/Z29E5ozbbFHw8ND5YhoP6IxYIaYvmDYSFoZtBUXuEaHoHRTDFyWxNioqzhuxFYjesPMRONBwzaGy6SFda8PbA5Rc/ivy3biAL6ULpvXJhhdqcja4gXHEi91rrVo02vaTXf+R7H+xHA9tDQB7cwfhVBNjsjVbcCL2tfECnCdHVlLNOVhJns2hUO9xAjVwtFdLEtlIAkmnbpqXymaQWTQHxw7RoVN3EuantSHKX1/Cs8P/Q62KqVBHNfbZ5idMOACGv5kdtwsOoxhIFaGaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x32K2eG5lO3x1x9Ry7Lk/Fyen7NxTsxwUetwUNoaGr8=;
 b=CF75VvsWdPIlmXUsqbrK1FyRwmJiAQfzX4urwFn/HQhv6UIo6fOm3UOs6bpps2ETKNzkc2RzOgT2PDGnt2QYh/rGsx9v1oGVKhoh6xBBIYcHsNYq5uo6m7wM66MNGO+gsW9HJdIr4TS6zGi7ZAqiMM176hzqUm3nYZXp+yYA9XB6ThKtH+kzfKeHXFM3tVkYDsxpzQb5sjycJxQ0D/fFRDfdV9UG8DJq9dEB7WD36RULzpoSrvJ3qBKV5XQn9DQB/BddkQIU1BkceUnpRN4SXz7UcGz7wwYS6RH9z8qQIUV5iYCV9/vjJKCOkdFinqlBRkrViIiJXdma1B8cqEdS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x32K2eG5lO3x1x9Ry7Lk/Fyen7NxTsxwUetwUNoaGr8=;
 b=Vu+a5cM6IMYW6TNZc3q2Jtkx2oyiC/qxq+PQpW9h3R98VyuAv+PzEffH6uZUUAy6O1t/zqXkktZ883fTNqqv2rL/qItpYxnjxBuKV01p1ipNGsLnfbt5rW7bpRFBLL01b9BKFc5EApPM2F95ECG5SvOmdDtiQ1NyPFS42Q17MlJ1MI7vA161V6VlLPUKoPbCB+LVHIzPGeolTjI31zEXAydGsndMRCyxqDHpRlwquRo746dK5Vda0QU2SvLtbB25w233/xIdktVpA1PwpYduWOFUZu9kNtCQqNJNDHwN6KbttF0A1PG5sOfX195FTWYtsY7xm0VASspqigVoqI3oog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY5PR12MB6106.namprd12.prod.outlook.com (2603:10b6:930:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 22:06:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 22:06:51 +0000
Message-ID: <954d7a5a-e77e-4506-b662-e3d52116a145@nvidia.com>
Date: Tue, 30 Sep 2025 18:06:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] rust: bitfield: Add hardening for out of bounds
 access
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-9-joelagnelf@nvidia.com> <aNwbeQ6iXuKIsQHK@yury>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aNwbeQ6iXuKIsQHK@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0056.namprd20.prod.outlook.com
 (2603:10b6:208:235::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY5PR12MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 64356c73-ad34-4616-ec64-08de006da85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFRTVHJoa0h4ejIzZmplS0p3S3JTRS9FaHlkK2l6NkRPYWxYd0NuVzQyaG9Q?=
 =?utf-8?B?dXZRaVBUd2tRY1Qwa21FTlJTRVBqd0tJRURCN21qQThVc1daUXBVRlBMR1Fw?=
 =?utf-8?B?aDV3V0hFMzZSeGczenFxaXBxeUJjSU9BVlMxRVlLVzVEU3Buc0ZBTXM3YXY0?=
 =?utf-8?B?Q0RCNi8xcHVsOFFCZzZqWlFKZlFvcGhWTkJIQ2dqaGhHemp3cEtYVE9mWTI2?=
 =?utf-8?B?bGMyK1R4amlJZ2RDQXNUMHgrRjJwU2FVUU4zMXpQek1iVGZuQktzekNnS080?=
 =?utf-8?B?Q3RucnBIRUV6ejM3bnhteDRzekxyYVhxdm15TDJ3OVM2STQ3YnpKeFV0VEdn?=
 =?utf-8?B?b1l5anFucHpPUVZ6UEUrUllBampzMHZvbTNBY3M5a2Z4cklNd3FQaWpiTVo2?=
 =?utf-8?B?aTRyQkQ2R3lzRVpYcGxZZ3VxK2tEOG9YTkNXVXhmUXl5QTZGQUdkeHBDVks2?=
 =?utf-8?B?MDE4ZlZjbTV6VW5jWFNwekFQbVo2MTU2Nk4zazZLN3g5bnJoWHM2K29FRG15?=
 =?utf-8?B?QW14RWhKQjZyckErVFFCU2dKdm5nNU5BSnFSRmczN3ZNbnA3NDRvOEZ2NjRq?=
 =?utf-8?B?Skt0TEg0NHZkanBJeWh4MFV4SmNqVkhkZlUxVzRZL0ZVL2RGYW82SDV0UmJE?=
 =?utf-8?B?aW9FK3dJL0lQZnFBc0VTakRFWXYyZHVPVFNDQ1Z0Y04wNmlvbzJNaVBjNGtw?=
 =?utf-8?B?VFJWVjc3MS83UXNXQ09oRitJWm92Q3huR2NmVC9rL0VpeEN2Zmp5T2hldCtJ?=
 =?utf-8?B?K3d5WWtYQS9meWhYQS9jbkhGRDNHRHpHeHllalpJS0pGWDFONEtDRG11SzdZ?=
 =?utf-8?B?UHlJS04ydTZCTjZoSGljblNDeEtDK3U2NG5vd1pCTmtScytBRm9mK1BoK2xi?=
 =?utf-8?B?UGNpKys3MHpEMERhMk4vWU5FV2I3RlBXK0xpUFdLUnRvZGREZUxrRlZEWmpX?=
 =?utf-8?B?blhUVEVvS0tkcHY5RUpUcDJlMkNXeVR1ekdSV25Temk4WjExMy93U0d3TFR6?=
 =?utf-8?B?RUtjaWZlYm1NS1hyRE95d3FIaUwyTngwTm9vaTdTdWJWWDYrUkdPTytCTUtp?=
 =?utf-8?B?KzZ4Znlpam54YWw5ZG41Z1RRNGRDVWkwSitDc1g3bU45dW10bFUwZUtQWWFH?=
 =?utf-8?B?RFdIdWRyaUpla1VDb3BYZkVJdmNBaTQ0Z1ZLR3hjQVVBSnZyMjJRcmgrZS9K?=
 =?utf-8?B?V1lnTllaeDZXWlVRTS9ORUd6UVM3dmhKa1FvSUVUeE9POUVLTC81bUtXNjJ0?=
 =?utf-8?B?K2hEZXZ2N0tFTW1naGZqUnhIUjByTmJEL1hleDJKRWN5anBTZ25seUVvazR1?=
 =?utf-8?B?cm9NTHF5U3U5NU55RVpvd0VVNGdNeTRRbGVXTzJtZkYvTmhlcTA4c056ZmxU?=
 =?utf-8?B?RC91endYbTFoWXJpQnRpUy9aMW5vZ01VY2FjL0pyR2pOWkFubEpZM3JPa3E3?=
 =?utf-8?B?Y3NtWG5tMnJIWXBCZUcxc1EzNXB4QW16UFdHS2RZaVZsU3kxVThVUHcvR1Nz?=
 =?utf-8?B?TE5xcXJ6djZ5TFZSUjRyV1FndlE3VmhtL0YzN1Zwb1JlS3R4dmVwb3RTdmpF?=
 =?utf-8?B?WHptRitMbDgzbkt1L1oxQ0RvRVE2dEpxZWhnbDhDMnExRU5laEtKdjVnYyto?=
 =?utf-8?B?dEJVL2RLdjhsUDBkWksyRTRRQmRYeGovY0FKWUk2MEhZTHYvM3QvS0NJVyt6?=
 =?utf-8?B?V0pnUDFBdlVSN3h5eGpLajZodjFxTTllU1dlTlp3eTA1Z2JzdlhVNXpCTGc1?=
 =?utf-8?B?NXdqbXV6ZFJzQWMvUURtcEpobWdSV3hrd2krNS9samx2REJPOHd3N2h3cTdV?=
 =?utf-8?B?N3dOKzg5YS9RQzlTM0lCUHc3eEtaUm5JVE9HejdUemR6NUJpbmN3MlZxclNs?=
 =?utf-8?B?ZEZTd0tSZzJEUEZVQUhvVTl4enE2a3B1NDkvOUloMHA4MmtaY3Q2UXBIU2Nn?=
 =?utf-8?Q?z+bSA/CAWFAhVpBiO3U7dmCMFD0NuAZ/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Lzc0SEZBc0R3QTVEdzc2c1l2bEg2aCsxQkhMSFRYWjVhdGV6UEZxMUdDbmJX?=
 =?utf-8?B?Mldmd2VtaWE1ZFJaVG5hNUs1WmJvZjNUanhnRy9rWlRiUGZXcmJiK2FsS0tZ?=
 =?utf-8?B?b2JkYVlWWllUUFpZVHNWUTREL0xuQ1dZKzFiZ3hiTzhsOVowNmlMeDVxNXV1?=
 =?utf-8?B?VFVSTWJNRlpYbGRpNW1jL04yWElsV0ZuSkNqaDJoQzVsc2YwcmFpQUk3VXlS?=
 =?utf-8?B?WkhJQmZDc2lVZzFHUHA5RzQ0dWxQdmluRCt0UkRCNStyM2xGVEk3MjMxMG92?=
 =?utf-8?B?MU1IN21tRW9ocHAydGxyNEUvRTEwajdPVWpwNGxJUjVKV2dFUERCdzl6ZnZ1?=
 =?utf-8?B?a1UzMGVIa0g4VjlyZFErcnhJeEVITU5yc05FSkhZejF2RTN2OG5hemlpcjN1?=
 =?utf-8?B?VWdZRFh2dmkySDR5aVkvWkR5d1k3Y3FtaE1idFpod1dFYTZMZEdnTTcvbC9v?=
 =?utf-8?B?OUZBSEFoNGtCWFJEcW03VVlmQklFemRMc0tBUkxSSmlyWmxXMzBnVXFhcktj?=
 =?utf-8?B?ZWduV0t2cEFUSEZ0YVRRbjQ5cktQcGVZeWU2aTlaZStTOHo4cTdzZzNQOWRJ?=
 =?utf-8?B?elNhTkZXZTBNaFdtRXdxWTFkK1NYaDEwbHNMSThVR3NuVjcyaG9wS2VKVTNk?=
 =?utf-8?B?dDkrQlM5U0tZMnNSS2xucGdLUFJmdkZyemZ0ampLYzhTYWZDQ3lseWFNakpZ?=
 =?utf-8?B?TzhRQTZYMGZCbmRNc2pXM0szUkpBWUY1NFBUcm02bmx5dFE3U1AwT3ZhWVJE?=
 =?utf-8?B?UjYyajR1aDB6RVNMZU9ZVlVLdUtiOUZMR21xeXMyaExBRU03SHhoVW1RcUFt?=
 =?utf-8?B?cjVuaUhidDBGOTBjQ25QR3J5UVNQZlV4SGYxS3BqMXp5RUZ4cVBPTHJZUXRv?=
 =?utf-8?B?cU1jVmZhOFA2c3pLNXR1NmdTRmxqWXl0WVh1M3YvUlRaTlBPZTFveWRsMlYy?=
 =?utf-8?B?b1BYWGJRSDZRWmlkSTRoTWR4eFpDV0srbE96cU5iOVU4KzBuVm13OEdUQk1H?=
 =?utf-8?B?Mm5ORDRDbUJwYTVlL3k3elVvQW5XQndLc0h0djdXMzV1dWU2OHJ0NW8xV0FM?=
 =?utf-8?B?RU1sMnJVWVkwaC8wV1NGOHB0OEVNZUV6N2NVVUxBZHJrQUlkNEZ1d2VzMmRY?=
 =?utf-8?B?VEY2MnR2R3ptVHNzd2loZzMrWS9wQ0RVT01ZbUNxYjhHRDdBcnR0MGhkQ0M0?=
 =?utf-8?B?eFplSDN5L0FGeVRxUTJVcjFxUCtIT0NkUENHMkVPcWl5VlJpUE9RQkVxeFJk?=
 =?utf-8?B?b3BxZE9wQ1BRQ2NNdTFFMHdDMitEUllGeUgrWVZNRlRWRlBBYTk3dEk1T3VJ?=
 =?utf-8?B?M2FpS0hWZGNtS3BweWE5NXZYaFk0SWhyRkdOOFZyV3FqSjJ3SGVNdzJTYldX?=
 =?utf-8?B?Zkh2cFZkU2toL2hDTEFWNEY5L20rdXFWVTQ0Y2dVWU9velc5QVd2Y0ZMY3Fv?=
 =?utf-8?B?M2l0cDRDQnV4VVYwZytyUktHaWd4TFROdnpUa3hoVitqMU9weDBFbU5RMm9Q?=
 =?utf-8?B?S3ZkRzBmL3BwVUJxS3J4em9odms2dTJQaXJGNFVLRUFWY0FMVGFadHFEeXVq?=
 =?utf-8?B?TUdGTmhmUmlsMTFIc2N2TjhvRjkxZ1VYZUlKQkNUbXQ5aGpsTVVuYnZhT3Jl?=
 =?utf-8?B?WFJOck9CbkhlMzdpeWZscEZkTWV0WURTTWduY3dNL09vVGRtZGhBVGV1Rm5v?=
 =?utf-8?B?VkFuQ3hKNUNSMjNYZWMzcHdENUIvQUJFSXExN3RiZDBJbEpyUTZrcjBBbm04?=
 =?utf-8?B?Wk91bHhHNUorOXdUZWU3bDBLNkpmc3VkM2xOZTQ0cDZ5SmVTT2ZSMjVkY0V6?=
 =?utf-8?B?UzB0eDdXcmt5Z0ZRNzlqWk9rcGI4bGV5U2EzZDlJQ3RMcFAvRU1OTWo0Z1Yw?=
 =?utf-8?B?bUt2eUZkZkk0REExZHhYY0dsUW5Lcm54a0VPbjQzUXpRTmtNaFN6ZDFXNUZp?=
 =?utf-8?B?TURsdzhTeTZMZjJ4N0VsR3NGNDVnaTJkVWoxZis4cWRWaU53eU03M01FT0Ra?=
 =?utf-8?B?azR4ejBXWGlIMEN5QzFQYVFLM1NGMEo3Mm5vNVI4ckplT1NaSDhOcXZXb1VL?=
 =?utf-8?B?YmdQUnU1TXRqRjkrcWY0Y3ByNlNsdWFZTmlYMktGamhLWFl6NXdmaVFxTXpC?=
 =?utf-8?Q?pbnuIM2ytYBQHl2pcMsEZuF74?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64356c73-ad34-4616-ec64-08de006da85a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 22:06:51.1040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bk4/wDRWAgNPFt7Tu/ngeOR7wYssFOGlSp1tuaneZyPtyPdJreL2nh6Az+e3KwJJ2BllOqI0tjXusSyqDTh1zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6106
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

Hello, Yury,

On 9/30/2025 2:03 PM, Yury Norov wrote:
> On Tue, Sep 30, 2025 at 10:45:36AM -0400, Joel Fernandes wrote:
>> Similar to bitmap.rs, add hardening to print errors or assert if the
>> setter API is used to write out-of-bound values.
>>
>> Suggested-by: Yury Norov <yury.norov@gmail.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  rust/kernel/bitfield.rs    | 32 +++++++++++++++++++++++++++++++-
>>  security/Kconfig.hardening |  9 +++++++++
>>  2 files changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
>> index a74e6d45ecd3..655f940479f1 100644
>> --- a/rust/kernel/bitfield.rs
>> +++ b/rust/kernel/bitfield.rs
>> @@ -29,6 +29,20 @@ pub const fn into_raw(self) -> T {
>>      }
>>  }
>>  
>> +/// Assertion macro for bitfield
>> +#[macro_export]
>> +macro_rules! bitfield_assert {
>> +    ($cond:expr, $($arg:tt)+) => {
>> +        #[cfg(CONFIG_RUST_BITFIELD_HARDENED)]
>> +        ::core::assert!($cond, $($arg)*);
>> +
>> +        #[cfg(not(CONFIG_RUST_BITFIELD_HARDENED))]
>> +        if !($cond) {
>> +            $crate::pr_err!($($arg)+);
>> +        }
>> +    }
>> +}
> 
> Can you discuss performance implication? I'm OK if you decided to make
> the check always on, but we need to understand the cost of it.

Sure, so the cost is zero if either CONFIG_RUST_BITFIELD_HARDENED is disabled or
the value being checked is a constant. That is, the compiler eliminates the dead
code. Otherwise the cost is a single shift instruction and a single conditional
jump on x86. I verified this. As such, I think it is a good idea to keep the
check on.

> 
>>  /// Bitfield macro definition.
>>  /// Define a struct with accessors to access bits within an inner unsigned integer.
>>  ///
>> @@ -358,9 +372,25 @@ impl $name {
>>          $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
>>              const MASK: $storage = $name::[<$field:upper _MASK>];
>>              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
>> +            const BITS: u32 = ($hi - $lo + 1) as u32;
>> +            const MAX_VALUE: $storage =
>> +                if BITS >= (::core::mem::size_of::<$storage>() * 8) as u32 {
> 
> If BITS > storage then it should be a compile time error.

Yes, that case is a compile time error.

> Can you> elaborate under which condition this check makes sense, and is not
> covered with the "(1<<BITS) - 1" case?
If BITS is 64, then the else should not execute, because it would become (1 <<
64) which is UB.

I am Ok with changing the condition to: "if BITS ==
(::core::mem::size_of::<$storage>() * 8)" considering the compiler time error,
but I am also Ok with leaving it as it is.


> 
>> +                    !0
>> +                } else {
>> +                    (1 << BITS) - 1
>> +                };
>> +
>> +            // Check for overflow - value should fit within the field's bits.
>>              // Here we are potentially narrowing value from a wider bit value
>>              // to a narrower bit value. So we have to use `as` instead of `::from()`.
> 
> The new comment sounds opposite to the old one: if you check for
> overflow, then there's no chance to "potentially narrow the value".

No, this a compile-time issue. Even if there is no overflow, you cannot use
'::from()' because it will cause a compile-time error because it is narrowing
potentially a wider width (like u32) to a narrower width (like u8). It is not so
much about the value itself, as much as it is about the type of value.

> 
> This "potentially" wording simply means undefined behavior.
> 
>> -            let val = ((value as $storage) << SHIFT) & MASK;
>> +            let raw_field_value = value as $storage;
>> +
>> +            $crate::bitfield_assert!(
>> +                raw_field_value <= MAX_VALUE,
>> +                "value {} exceeds {} for a {} bit field", raw_field_value, MAX_VALUE, BITS
>> +            );
> 
> Can you hide all the internals in the assertion function? Like:
> 
>             $crate::bitfield_set_assert!(bitfield, field, value, "your message", ...);
> 
> We don't need assertion implementation in the main function body.

Why? That's more unreadable IMO. Having the condition itself in the assert,
clearly shows what the condition is in the context of the surrounding code. I
don't think we should more macros to do asserts when we already have a macro.

> 
>> +
>> +            let val = (raw_field_value << SHIFT) & MASK;
>>              let new_val = (self.raw() & !MASK) | val;
>>         all the internals in the assertion     self.0 = ::kernel::bitfield::BitfieldInternalStorage::from_raw(new_val);
> 
> User wants to set an inappropriate value, and you know that because
> you just have tested for it. But here you're accepting a definitely
> wrong request. This doesn't look right.
> 
> On previous rounds you said you can't fail in setter because that
> would break the "chain of setters" design. I understand that, but I
> think that it's more important to have a clear defensive API that
> returns an error when people do wrong things.
> 
> So please either find a way to return an error from the setter, or
> some other mechanism to abort erroneous request and notify the user.

There's no way to do that other than always panicking, or introducing a new API.
 There's also no way to do this at compile time, because 'value' may not always
be a constant.

I see your point, but I think since we already panicking at runtime in a
hardened config (or printing an error otherwise), we already have that covered
right? The user is already notified and it does not go by silently. If this is
really a problem, we can always panic (in other words, always keep it as
hardened config?).

> 
> This "chain of setters" thing looks weird to me as I already said. So
> if it messes with a clear API, just drop it.

I don't think we can/should drop that because this library is also used by the
register macro, and that uses the setter API (I just moved this code from
there). Also builder pattern is a common paradigm in Rust programs and I'd say
one of the key features of the bitfield macro so we should support it.

How else will you do something like:

        let status2 = TestStruct::default()
            .set_ready(true)
            .set_state(0x2)
            .set_reserved(0x5);

? :-)

As an aside, you can check literature on the builder pattern as well, it keeps
code super clean and readable.

> 
> And to that extend,
> 
>         a = a.set_field1()
> 
> looks more questionable than just
> 
>         a.set_field1()
> 
> because it implies an extra copy.

a.set_field1() on its own wont work, because the value returned (self) is discarded.

and,
a = a.set_field1()
a = a.set_field2()
a = a.set_field3()

doesn't really do multiple copies, the compiler optimizes things and eliminates
copies. I verified this in the asm as well.

> If I do 
> 
>         b = a.set_field1()
> 
> would it change the content of 'a'?
> 
> Can I do just 'a.set_field1()'? There's no such an example in your
> test.
> Is that 'a = a.set_field()' thing really a zero-cost comparing to just
> 'a.set_field()'?

You can't do that in the current implementation, it is a NO-OP. We can certainly
add a new API for that, initially I was planning to do add a 'with_field*()'
accessor for the builder pattern, and do the 'set_field*()' API as you mentioned.

So it would look like:

        let status2 = TestStruct::default()
            .with_ready(true)
            .with_state(0x2)
            .with_reserved(0x5);

Or one could do:
        let status2 = TestStruct::default();
        status2.set_ready(true);
        status2.set_state(0x2);
        status2.set_reserved(0x5);

Would that address your concern?

> Can you ensure it holds, say, on 32-bit machine when> 'a' is a 64-bit bitfield?

I don't think this is an issue. If the user writes a = a.set_fieldXX() multiple
times, it will be optimized as I mentioned above. I have verified (in release
builds) that the compiler does not create multiple intermediate copies.

> Would it work if we decide to support bitfields larger than 64-bit, like C does?

Certainly, the struct has the Copy trait. 'a = a.set_field()' will work for
larger than 64-bit just fine, if/when we support it. I verified that as well.

thanks,

 - Joel



> Thanks,
> Yury
> 
>> diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
>> index 86f8768c63d4..e9fc6dcbd6c3 100644
>> --- a/security/Kconfig.hardening
>> +++ b/security/Kconfig.hardening
>> @@ -265,6 +265,15 @@ config RUST_BITMAP_HARDENED
>>  
>>  	  If unsure, say N.
>>  
>> +config RUST_BITFIELD_HARDENED
>> +	bool "Check integrity of bitfield Rust API"
>> +	depends on RUST
>> +	help
>> +	  Enables additional assertions in the Rust Bitfield API to catch
>> +	  values that exceed the bitfield bounds.
>> +
>> +	  If unsure, say N.
>> +
>>  config BUG_ON_DATA_CORRUPTION
>>  	bool "Trigger a BUG when data corruption is detected"
>>  	select LIST_HARDENED
>> -- 
>> 2.34.1

