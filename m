Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8CC2296E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 23:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026A110E106;
	Thu, 30 Oct 2025 22:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eaek7Rbr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA61010E106;
 Thu, 30 Oct 2025 22:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isEjJmbHvnGxN8T8cDGYDUNHV8qN79TpwVyq1mivYfYeCYF7+lqa0UkqYOHKGGjHunDSrFNF9HIDJ9975gyorcsVMN3esK2EfWg8m2rtEqaYjoXy/YtlGJAN5zVyRRm6Epm+XFvxZC+PaerU6F0iA4+zUwqwlbw6klss/ZYMu89+zU67VkNLQb9SEeDnMT9SX5Kn4hOPoYUs/UDBdYIHMvZXWe8ivDLZEBL0JIFzfXUOgFKT3jgqMRAC5Y8JlnWc0c07JpzJQ0PrKWSNF0zIGg0ylOohfLYsnRY5jjlAcEbzQLI2Rwxe+tCwtUv0vAEn+zezWI3gkKBocZ/D2EVm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzzu73OctFVkOGhQXtE86SPOf0QzozY28kC0JYpxNzA=;
 b=vN1h7PB71COMBzDNH/yYRiU2bgOWkyaZ8T7jsvn9jhdVVu7QqMyRJeA/di88zIAcvkWPPTEA9+/2ErjYCF7d1RXZYDfO0y6cymjqsHUADfu1Qs/sO3qBv6d5xk2V3DNrPhSooO/4EK42YOefvsmYLf1y5l+VgS7mkrrbJNyEzSDzKoxxKUJTjnixTaYAzzMMztohHG3WQY7SglzPGb9+Hxn3ltLzzxgUxL8N6lb8XmyChlWGlgLCKOUGq9pPQ7y5wuYbUl9UYVxk2JdSn4KA5xrDK0x2CrfSD/pgg9i7+XZiQiXlaDL/olXnhPmH+hoYVMeNyKP+ref6CG/2/iSuPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzzu73OctFVkOGhQXtE86SPOf0QzozY28kC0JYpxNzA=;
 b=eaek7RbrF32B8k5GbeTl+dO1c8u0gupg0EPz5Shagrm07+ARL6eGpiJsrIZv1g4LskYrwFNUw8JOILe7I88+CWv8ZWxPPmgZhrq7jT3UjU40PtI2g7Qb6wTJVb4e5AXii4ivkG4vEyeCq97aO1Ir7AhHRneqnJ2gkCtbJC9Joyh7xvIXAJSwkS9/k8Nui5VuHAzThN/1IohspMigzIjqdzR4rPRs6+ykIilbSxZb8+mKh6jJRKfcACQyDl92QxTACF91c1o6gCj3L451rN0mXOEZFEp2T/rmKYpSXz/PiFFqEwYkVHjDmYfj/B6PbgWLHvAZ73zhgGCbC5FSj6UDpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8242.namprd12.prod.outlook.com (2603:10b6:930:77::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 22:44:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Thu, 30 Oct 2025
 22:44:33 +0000
Message-ID: <e07eeda0-1dee-4292-86dc-d8fe532353ae@nvidia.com>
Date: Thu, 30 Oct 2025 18:44:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDVYV1VT441A.11L5C11F8R7C9@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDVYV1VT441A.11L5C11F8R7C9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0041.namprd20.prod.outlook.com
 (2603:10b6:208:235::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: afba99fc-5971-4cdc-e3a9-08de1805e4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVloRFBIcC9pcVAzc1pZcDdnWUIwWmwxQ09EVVk0M3J5VEtEYjhORCtKNjVY?=
 =?utf-8?B?SlA2dG1mNGxTMlpNeEp2YjYxakYwci9pWjcrNU1ZNjlNdHFTRzRNMnhWQzBs?=
 =?utf-8?B?aTlDZS9oV3FtNUVzcDJYTlRPYm02MVZYWnN1dEx6RFJnT1E4WURMZko5THI3?=
 =?utf-8?B?MzJmM1lJQU1mOEY2R0VaejUwanlwVU1pY2o0L1ZhODdscXRRV2pTUXpGUTcw?=
 =?utf-8?B?WTVKUFptR2dsV1F1Z2VRZVpqeVBSKzU1VEZhNGFzUHhuSmtpZ1pxdW94S2Vp?=
 =?utf-8?B?UzBoazNHQTUrT2JGK3Rrb21IR3hNVVg1b2oyNjUxSUhoQXJQWEd3cEEwMVJO?=
 =?utf-8?B?eHo0dm1EeXQzRjcvbFpvN1pzcFMyaEVYeDUxbVNqeXJ3eFhtaU4yQ2d0MmVi?=
 =?utf-8?B?R25TcUhlaDVndTNpUS9qZnYzTENXaXBPM25DaVFWc2xsZUhhK2ZMNmVON1JU?=
 =?utf-8?B?VVYxYlhMb3NoZ2ZVbGk2czE4V2JabGcxT1pxSEV3RTEyR2RFTlNkTlM3dWkx?=
 =?utf-8?B?SGswNC9aK0dJTDZoeDJucW9ENUFoa1ZBSzk0REtsak1nc3lPb25Nb2hmR0NT?=
 =?utf-8?B?R3hFNWZkWDVWRlIrR2NCbmpSOEx1eGhvTGgzUzdBd0hJc1VTK2FaTmQwcXJ0?=
 =?utf-8?B?V1E5S3ZwYWdnVENzdXZDdHNXQnpLQ0kxdkNRL2FJWUF4N3BVMW5TemU1Z3l0?=
 =?utf-8?B?N0NxaGF3akovRjFqL0pkeCsvK0k0dGZMQnpiai9sV3psQjF1ckpCSk4remFP?=
 =?utf-8?B?OWVoZHRzUktQZFRLV01LcWlOMFJMVDNzWCtzaXB1dWdsYkJJMEVzZWd5aVpt?=
 =?utf-8?B?L0JTU3RnQnV2cGVsUTJTTm5WRnFoelY2LzFsdEJrbmY3U3paeVRWNXVrU2lN?=
 =?utf-8?B?VEhjRUtnNWhyOEZHblFETFB1WUU2b2ppZTU3TEM4c2JtT0R6cGFpR21hSFI4?=
 =?utf-8?B?SVRVdk5ubktoRUI2UzkzbnBRMHV3a0dLZnNIaEE5eGx0WWg3V3gyTVU4TTJL?=
 =?utf-8?B?d1dnWGdFTDcreG5VUEhyZUxwaExyZGdDd2JxUTQ0VWdiTDBkQkNwVm5rRGht?=
 =?utf-8?B?aFpWeGdZYTZmcGkxQ3pMazhqTTBhY2FCVGdlWkhsd1RwRWZ5MG1yZXZHSk0x?=
 =?utf-8?B?NUxHV1JBUURsS2lRenZ0aEtSTzB6dTJTL3ZlSTh2Z3F3MS9Fd0FXWWNORzlG?=
 =?utf-8?B?Szh5S0NvK1QvQ05oRzhVWnBFN29UTmhVbnhocWNSMnZraURWdnhpRWtYNlNC?=
 =?utf-8?B?b28xVUt6a1Fvb214L01HL1RLbExZNlBMbVB2SisrQUg3QlBmNmdXZG1lZ2hY?=
 =?utf-8?B?QWI4Ym8wQjNjNkJrN28zTjM3TnRlQlJ0S3dDbW5tSVNQTHVNcXU4cWNJWm5R?=
 =?utf-8?B?NTQrcVBCZUZPT1cyNzVKaXh4VDNFdWZuZHdGT3RpeGhFM2dzNXlLcEp5U2Jy?=
 =?utf-8?B?ejBvOTBBdU5YK1RPSkg4WEp6K0EyVm1KcE1FeDR1Z0xKa0V4QndCRnVkWFd5?=
 =?utf-8?B?RGVKai84dGlQaytJS1JMOXhOaUlMTzVzcGhPdU8wOEFzdytLTTdWdDNEMFg1?=
 =?utf-8?B?dWJieWF0anQ1ak9FZG9sK3JsWFBnd2c2ajZ1SlpIZjdEWVRRM0lUMXBTWktv?=
 =?utf-8?B?K204cTA0bTBCSjQ0NmNNSy9uV2Q4VkNpQTJlL3c1cmFhQWwyT0JhZi9zTUti?=
 =?utf-8?B?Tk9PZGNaZVpPSVFxZUcxckJ3WWREcUp5MGhudUpxdWNQWlN6RzY4VzNSMmxm?=
 =?utf-8?B?a1AwRGtSSjF5eGFod0l2ekhaTGgvUkc1bjgwVHJSM3RjVlVQTUxXTkpqT01S?=
 =?utf-8?B?M1hRbjl0U2NTZ2VsWk5IanprQVN1SWR2WTJVSmI2MVlwUTVNaVBGdG4yQ2to?=
 =?utf-8?B?Z3dqWnExMlVqVHJXQkZmRFR6U0Z2K0N0Y0hLV0t5VHg3WFU3d2lPN29kditX?=
 =?utf-8?Q?3EUl8e6FeP3eBJiwIZHIUUiz3iWSk7Dl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVd1RTJFR0IyOWhNczlORU1ucTcwK2dsbXplUzZ5d3h1R0s4MDFKNkNsZ2ZZ?=
 =?utf-8?B?d2ZIZDhDU2UrNkx1WVBWT3FmeWpaOHRUanRPUnNNU28vam00cmdxNzRIWDF1?=
 =?utf-8?B?aFY2QUJobG56TzR3OVl3Z1dBRXFoVWtjRHFrR2tIYll3RWZHQzBEZEZxTDdw?=
 =?utf-8?B?UnVTNzVocDdUa0hiVEpNMjBLSldSWUlIamIvTnBEdUtkTjB2ZEovdWZLMXlz?=
 =?utf-8?B?dVQ2dmtVMFg3Y21LWmxOMU9UOVFKeUduK1lKcjhWZ2dvVVA1Y2dycHRTQUxn?=
 =?utf-8?B?YlZXRkxXaG9HQ2Fnb3dDdy9ielVCMDFuV1JraUZGaEZXQjE2YlRQSnB0bko1?=
 =?utf-8?B?QTdpc1k1UzYwYTVqTzdBZ1ZFV2drT2RqejdTLzRrTnRkcEhvei9ZaGdsbzFC?=
 =?utf-8?B?YitxbnFBWTZEVkhjNS9IUXZaLzlwV0QxVnJmdzVFemoxcG12cUhiL1NkQ3o1?=
 =?utf-8?B?R1FjUzd1b1BNNW1BdmxiQ0IwSHlIdm96S3NidHFyUlV0OW5XblVUMmpIU0lY?=
 =?utf-8?B?bm1EUkFnL1diempPR3dnL1gzYVRCTjNDMmRTb252eHkxN0NEYzlzVlN4U1hu?=
 =?utf-8?B?WmxsWmxyT3FPbFUwWm1ocklOK1M3RGxiNy84YkNGZWxjL3hwUUlOd0ttQnNV?=
 =?utf-8?B?bWs2V0JoTjNNK3VCWUwwRVliNldHclhtT2lmaTgwdzgvL29nL0dDejU5dkRQ?=
 =?utf-8?B?WVBOS2VaczFET2QyQ2o0bU1TTUp5OHhnSUtubW5NMzNRSXpNMWZ0RGhTNmc5?=
 =?utf-8?B?ZTFtR3VlbVlDZ1I0RUJkejBCNHBhU0huR1RBd2grcUluSzdvUkh2N1gyWks5?=
 =?utf-8?B?SHUwRG1zdWY0a1ZldW5DblU0WXlIWVhlRWhiMVdxMUVuS2Jkb1lJUmFLeENR?=
 =?utf-8?B?RUpkUnBaN1ZmMXlBSmRUVU9HRUF2Nm1Ebk92TEp4M216ZDNQdlVQYVZmek9S?=
 =?utf-8?B?ejNlMWxhQWpnRTNIQm5SZUFCbDVkdUtpem1JMUdxTExpeFRDQUd5anZHUWdD?=
 =?utf-8?B?dGVhNGdEcTlYVFMvaUVjeXdlWGlQSlk4alZHM3hLK0RldHdNd0NOK2laQ3By?=
 =?utf-8?B?RGZrQlkvSEtDajhQNHlGQ0F3RmU5emhMTkhvK0FEcDc0ZFBVaVROdHpuY0dz?=
 =?utf-8?B?aktwUXRha0ZWeXN1V2JtRUF2VWs2YWMrcW1qRFdOOTRZMVl5WlJxRW1EanQy?=
 =?utf-8?B?WlNheGp4VkxUMWZ0V3dBUVd6em9yVlNrd0hnN1VPZ21Yb3I4RE5RUldRNVlB?=
 =?utf-8?B?ODFxZWpaRnJQVXVJV2pBQlJlOUlSNURrK210Q2F2b3k4ZTN5LzBEWHBTblpu?=
 =?utf-8?B?dkdDMEx3VjVMU0N0MmR2b0J4dUhWT1UyQkpwSllqclBlT1E3VVFUUnlacEVq?=
 =?utf-8?B?T3o5eldRZ1dKRGFhcXFZeEVDVkIrVG5xV3V4S0ZiU3pQWm05eE5nL2V6dEtW?=
 =?utf-8?B?T1V3Nk9HT1g0L3VTdWJ2Q25teDNJN2RBdVY5bzNnaGxJRzVzQnBMVEUzQTJ0?=
 =?utf-8?B?aSt4QmlmSDF2N2NESGN4SCtDby9uOTlIY09SbHVucXI1ZWdnbkVzTnJvUUpr?=
 =?utf-8?B?Tjh2aUtrYWFUbVFBdEk2QWF4RGFuRXI2dDY4VENSZDVNeFh4SkVVb25iRDM5?=
 =?utf-8?B?c3Y4bHJKVUNLd3FvNjVmV1hONDlwL2NQOXFocko4dm1BNVI1akt4WVFYOEk5?=
 =?utf-8?B?emFmeHd1YzE4RXNIb2c4NHdaNHN2a0FOcy92YnNETGhCZFN0N2pFVVZ5MmhX?=
 =?utf-8?B?ZjBYTFRBTGl6Y0t3YVRoTlFzd0NHdDRnUDBidVZLYk1jTVhuVGVhd3N5MVBR?=
 =?utf-8?B?T3RMcE1xQTZCb21XWTYzSmJMb3ZPVkFmdXlxalZHRDZhOFpySnlYZTNsWnFl?=
 =?utf-8?B?OVNCeFRISFJjSTk1VVB4THRoemNpWWNabVRVS3R2WUtCZ29DdzNsdWFkampq?=
 =?utf-8?B?a0h4ZDI2a3pseHUrTkc0bWdDT2xBUzQ1ME5ZbDdGTk5iTHRuU1NrdmFvRXMx?=
 =?utf-8?B?cEw0dnBBVXI2Qyt5dnd5cW5lVjhna3RKRzhxODkwVi9yd2RjQXZKT0lyVFV0?=
 =?utf-8?B?YVJRSUJxbzRBVllJNkZVYmhpNXNQRks2QTcyMkV2anMyampsODRsYytvcnor?=
 =?utf-8?Q?htL+nbC4OD8laX85aIB6p/QSM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afba99fc-5971-4cdc-e3a9-08de1805e4f7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 22:44:32.9940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JqMIQCZKc44fL9/5gX/njlKknTH8OSCqBGvaU/zfjQ5TXKmrAXHHdGMEWhVW46MVBLaDyH8GS4wNwElZkBgYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8242
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

Hi Danilo,

On 10/30/2025 5:15 PM, Danilo Krummrich wrote:
> On Thu Oct 30, 2025 at 8:06 PM CET, Joel Fernandes wrote:
>> Provides a safe interface for iterating over C's intrusive
> 
> I'm not sure we're there just yet, I count eight unsafe blocks in the subsequent
> sample code.
> 
> Don't get me wrong, there is no way to make the API safe entirely, but "safe
> interface" is clearly a wrong promise. :)

Well, to be fair most of the unsafe statements are related to bindings, not
clist per-se. There are 8 unsafe references in the sample, of these 3 are
related to clist.  The remaining 5 are bindings/ffi related. However, I am Ok
with removing the mention of 'safe' from this comment.

> 
> Some more high level comments below.
> 
>> +//! // Rust-side struct to hold pointer to C-side struct.
>> +//! struct Item {
>> +//!     ptr: NonNull<bindings::c_item>,
>> +//! }
>> +//!
>> +//! impl clist::FromListHead for Item {
>> +//!     unsafe fn from_list_head(link: *const bindings::list_head) -> Self {
>> +//!         let item_ptr = container_of!(link, bindings::c_item, link) as *mut _;
>> +//!         Item { ptr: NonNull::new_unchecked(item_ptr) }
>> +//!     }
>> +//! }
> 
> If you just embedd a pointer to the C struct in a struct Item you don't cover
> the lifetime relationship.
> 
> Instead this should be something like
> 
> 	#[repr(transparent)]
> 	struct Entry<T>(Opaque<T>);
> 
> or
> 
> 	struct Entry<'a, T>(NonNull<T>, PhantomData<&'a T>);
> 
> where T is the C list entry type.
> 
> You can then have a setup where an &Entry borrows from a &CListHead, which
> borrows from a Clist.

Yes, in my implementation my iterator creates a new value on in iterator's
next() function without lifetime relationships:

            // Use the trait to convert list_head to T.
            Some(T::from_list_head(self.current))

I think you're saying that we should have a lifetime relationship between the
rust Clist and the rust entry (item) returned by from_list_head() right?

Your suggestion makes sense for cases where a rust Item/Entry has a Drop
implementation that then makes the C side free the object and its list_head. DRM
Buddy does not have this requirement, however your suggestion makes the code
future proof and better. Basically, the rust item wrapper must outlive the clist
view is what you're saying, I think. That can be achieved by making the rust
item borrow from the clist. I will work on this accordingly then.

> I'd also provide a macro for users to generate this structure as well as the
> corresponding FromListHead impl.
> 
>> +//! // Rust wraps and iterates over the list.
>> +//! let list = unsafe { clist::Clist::<Item>::new(c_list_head) };
> 
> This function has a lot of safety requirements that need to be covered.

Sure, I can add those to the example as well.

> 
> It also should be, besides the unsafe FromListHead trait, the only unsafe
> function needed.
> 
> The Clist should ideally have methods for all kinds of list iterators, e.g.
> list_for_each_entry_{safe,reverse,continue}() etc.
> 
> Of course you don't need to provide all of them in an initial implementation,
> but we should set the direction.

Yes, initially I am trying to only provide most common thinks, especially what
the DRM Buddy usecase needs. Happy to improve it over time.

thanks,

 - Joel

