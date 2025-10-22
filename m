Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B3BFE5D5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1762310E19F;
	Wed, 22 Oct 2025 22:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m7ZH17P/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012012.outbound.protection.outlook.com [52.101.48.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C7810E043;
 Wed, 22 Oct 2025 22:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIg0KoTnH7vxEv5+y4q+dB34CTpmhhs65F8iy6GuNaVHjknJAgN6pyFI5t368TCy7+tZEyYMfhytd/3YEuD6dPV8V0gmOVtZhJ33THUMppWQGEBNGvhMEEuvxitpTb2pbLZM+VhYVvJZtYo66S2l8W1r+RT2mZ3cEmrx0Lb/f1dBz+Q/hYh2f/8b0vgHXYoSNKNXf00gb8fqVejz4Q4mB39gKwF96LfwkLltawYwt+1BzAN0hVxUrdrHO2dlqV/Mx4yLIwJ7uOMYpkExVe8P1+JjXmrsy9XPMmIw/3gWIJ5OAngh+EHO2QIJliEHGC8CrGKJR09ZTANhvn00rPlRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13gNJqknYFcU1Pnm/4/n5Zkm/TJ7BKKv3KyYbKnKlJo=;
 b=HmZuvh2cFjxS2HFTUpGU99X1O67d9W6RpuQzLoLjaxJDsTKo1Knu+J9/T8zyVhkzvU9/7xxuhM6ULmb+nLmYaQi3IxnMUSE0dZEJgc/1NhmZpjo54vpSBq4Y/YrG6S8ifV08eUlgNLLm2HQASK2SH7vlOG6QZTvxMuPzOcPJVC8q76W5nQxu9Iw4ldHGvkuW9dhPjwoGeIPxrfUIDgv71LG4FQmpuC/seruZBFGII4WixLpm9sHpKVr34ZenQLXDscrWBtnTUOl/3MqRmWTiVuFfg2Gcj7HkOkaT/avubcMFAXHDFThUaYj+gqVYT7p70D8+Rf3OC/B1ZrhgqvMi3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13gNJqknYFcU1Pnm/4/n5Zkm/TJ7BKKv3KyYbKnKlJo=;
 b=m7ZH17P/olARzR8oCqUldF57SNBUT8lzk5YD5sOE+dgm/mlysTDEG9+Tbth2lSNnAczL+CiMl+jgBm792tXBd9+rTq02rXaFbkhteZ4m1EF9MJUyRWM9Bvav/IIiUuuBOHFXHRtVUoKe6Xi/tV0LP0+vYNFlJbxUfimEt33xddEiFPlJDZkA8nPZwCMijQWiDmFagXfIbJKMhP/k0/Z+tnIi1kJGZb3D5BpP329WzSfVNqyT0tqWmkVL0gs/+9QCnpaLioSLkjnoDnN48M2uyUX4ApGkkMiqJEJC0AFVTp1OV+O2B9kERJLSjXAwcmcGmMppURm59seNoYCdPSyYmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8343.namprd12.prod.outlook.com (2603:10b6:8:fd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Wed, 22 Oct 2025 22:04:10 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 22:04:10 +0000
Message-ID: <4b953fef-da09-4147-8a88-e16f326c7bdf@nvidia.com>
Date: Wed, 22 Oct 2025 18:04:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] nova-core: mm: Add support to use PRAMIN windows to
 write to VRAM
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-7-joelagnelf@nvidia.com>
 <DDOSD746PCSR.CNAYZSTFR9XR@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDOSD746PCSR.CNAYZSTFR9XR@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAP220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: fde3e9ee-a78a-4813-b814-08de11b6edcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDBaVGFFR0k3eUJIQnQ3dDRLNzBzeERWRi8rSG1jZWtobXJ6OUJldHVPYS9y?=
 =?utf-8?B?WDNIQkU5bFFFZ0JQcHRWNzBXNENCNmlXc2IwditVTFhCT1doVE5vOHpzYkpL?=
 =?utf-8?B?dVBxQk5VY09Ta21ldzZiTXJxdzM0TlZOZFUybUwvZCt4eUg3d084Z09GRzJS?=
 =?utf-8?B?QjN4QllGcDlKdW5BbGdkZFVzTUxRaGVYb3NVVEhPNGFab1ptam4xMHlSaDZX?=
 =?utf-8?B?NXZHVTJVbmYxK1hzZVpGaEwvdzRsdG5WdEhhR3QxN3pDNENYV1U0WWJVY1Rh?=
 =?utf-8?B?c0JhQS9ON0FVMFB0NytRejdhcjkyYVFiQnRUaEo3NTBUSC9Ha3lDUjhGdlhk?=
 =?utf-8?B?Y3BMY1Y2SDhNQnRhWnlWbDdIb2F3NUZ0NktheXRwUGFpU0FRZ3JlNGVYeWRU?=
 =?utf-8?B?Y3VwN1Fyb0dUL3Q3L1dPT2lTT2x5MnNXR0xFand1cFlsSndSQkt1N3FibUNL?=
 =?utf-8?B?azFVK0xNbWFkb3hQZXIxY2ZCeEwzczBFRDIyc0kzZHN5YTRVK3BOaDZCZHBZ?=
 =?utf-8?B?cEJzVVNSem1KMDArMEoxR3NYTWRtZkpxaUVPYzhya3RHakJGTkhxWVZIeCtk?=
 =?utf-8?B?bCtwQ21pM2UvRmc0NVNGK3ViNEs0bEJsOXdDZFV2MVB6RXUwWHFodjljZStT?=
 =?utf-8?B?YWhRTzM4TEUxaTRhMWlxN0FIZFJDY0ZyT3lVcEZqdnJMTVRhbCthRXJTZ3Zm?=
 =?utf-8?B?YUduS3l2L3hqZFRlVVZtaUtpVXBxbW42RXFRVHpJUEJxTHA1QWh0Ykp0WVh1?=
 =?utf-8?B?TG5kZW1NamVNRFdCRFBCZTFGZGFsc1ozNy9Cb2h0M0JBSlFxRWJiQlZUMHVi?=
 =?utf-8?B?eS9qaEl4akZMYUVYM2w1dkcvWnByVzhzYjVGRnpTS0JQRGhTZTZhMHpxbHEy?=
 =?utf-8?B?WGVjbEN1QWtRUVNQb2kvckI1NFRQaGVIN2tteUlPd0s0cUhieCtJVFpHbVN3?=
 =?utf-8?B?TngrbklqVmRBME5ud0RKVFdHQUZVTitaVjBSaUpnWTh5QUgvSDdZMG1IczY1?=
 =?utf-8?B?THpwdk14L1Z2OFc2RmlNT0I3RGJvVStTQnE1S0gxbXBjQnNwZVBySThmMmNo?=
 =?utf-8?B?bks0VWdsWlFGU2ZSUmd4KzhYemNrMGxnR1JEN3lyanJ0UjRvNHBTRldOc1g0?=
 =?utf-8?B?MmJDTTY4ajRvS3lPVWo0WUNVUHRrVTU4cnpHTk5RVkJqUFgwb2Q4cDUvWXJG?=
 =?utf-8?B?RVRQSUJrdVZQRzd3QUwyQTlRdmRPN05tNlllc2psYjhjUU1DN2doNm42RDBR?=
 =?utf-8?B?SzA5dnEyWTJIMzhLcmhab25IdmliUkxnNlh2a05kVytJemRsQXQzbXFjNlVE?=
 =?utf-8?B?NU9RbDBzQ0xXamtYUjRPV24zNkxub1ZBaTlSYVNDMVBJdnAraGtXQ0sySHN3?=
 =?utf-8?B?eTlGcW44WkpZcnRONUZDZVJiQXZ6RU5GZVVsUEJnazdVNjFLSUFBd25PdEE5?=
 =?utf-8?B?cnYwbTM2OThLS2g4bFZObEMyYWFCM1lVeGtESDdYbXFCZVJ0YS9PV3gybFBU?=
 =?utf-8?B?bkRQMXNtZWZkRzF5cE1QTlM5UjN1eHZJOURMaktaMWhVUjhHc0x4aGRPWE43?=
 =?utf-8?B?eVlJbEQxRzh4M3NVdXlwZm1jNndDNW9HaklJVXRIMERTQkc0d3dzSTR3RGVK?=
 =?utf-8?B?RVlZRHRHNjZlVDNaZDRUbkFtNHg1UjRpSVJIKzZOdk9VMXUvN3pkdXNlM2Vt?=
 =?utf-8?B?eDFZY1ExTFRMVW1SdHBBUTQ3TnJzTDZkb2oyU2ptSnhET3BTY3VURllyZTQ5?=
 =?utf-8?B?Q01pRDhUaFlnRTRSdzFvNGRoY2JOeWRqZGZZaCtWc0wwOU5kQitZbXFjVDdW?=
 =?utf-8?B?MnRuSkxqNWVBSExsUzBNNk1QNFdIUVNHRGRFN05ncXJpSVJ4UjhucjM5alpG?=
 =?utf-8?B?MDNsOUY0VkxGVDIyd3JVekFPQjNBRU5PTHhCOHpHT0FJRTltQkoxRFlSekNv?=
 =?utf-8?Q?bYRR8H5CGa+grFHWmpP1R0+3iQQXf1hK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFLVVZWOWNtcFVhdGlvVFNPU2ZQdTB4dFAzTTZqTnJvMXorVDhMTEZZZGFP?=
 =?utf-8?B?ejdkMktZUGRUUVUxZHN1ZzRlVEptVmtJVThpOVRzRVRhVmVKLzNhMlYrRzc3?=
 =?utf-8?B?VEI2RkdzdFJwVmpYYWIzOWZNY0RNcXcxOTVDd09HNmxrUXh1Zk5tcGZmL3JC?=
 =?utf-8?B?NG11ZSt4NHQvMEFWcmc2WkJrODRlVDExOVFxVFBKNDJMNXBPNDBiNlhPRmpX?=
 =?utf-8?B?TGlkc3J5NmRIY3cyQ3U0VE91K2pDZksrd0RpSGhqQ2hwbmx0YkkreEtwaHhP?=
 =?utf-8?B?R1JLQzBNelROZjdaMUhlTERTNFFuV3pVNW52Mm1qQXoyUWtMWUk1TVlCTWN5?=
 =?utf-8?B?bjNyZkZWRXZ5Uk81czFOc2ZzalJjdFZtcHFHano4dHhycWV5Y3ljRGRvRHYw?=
 =?utf-8?B?aURzMk1VUzc3VGllSDZyd3Bwb3ZteTIrM3B0SlI0V0s5eWE3aGJ4YkwxeUJK?=
 =?utf-8?B?MUlQVlkzMlAwamg2NW9Gb3JOSC9ScGE0dVU0RytvL1VyOFRVNVlvZzBDTTBl?=
 =?utf-8?B?S2hsTVdOeTFzUEMvWE4zazlrQjN2TDN1OXBOMVd3cG5GekVBa3M1ZStXQmVK?=
 =?utf-8?B?UmdvczJXem9lOFkzMnVpRnF6UVpaN0kyOUZMRVR0ZlJnRUF3MzROU3hnczcw?=
 =?utf-8?B?U1NLUGZzLzdMQ0tWbVZtYk9idTBvZ1V4SFdkMHlKVXhUUmUrOGZYeGdFc3FV?=
 =?utf-8?B?RDRzbXpHdmZTa0w3SjFxb1dqTzB2Q0hQZ0JMQXBFNytEV1VUdEVJQmY2bnlV?=
 =?utf-8?B?M00vNkRxRFg5Q3VadUJQTUNDV3VEZDZ6Vk1hd0hYZTFsdzJxaXJoTERZbEhh?=
 =?utf-8?B?N01HLzU2YTFEbGJLTTFUUlFXd0twVnl4NXdCbmh0cWJQMVRMNjhlQ3ZjMU1V?=
 =?utf-8?B?ek1FSytvZmdnc3QvOFhnRGJUVWpYdDRwYmJkU3A5VElkNWd4Z3FhMFZnVHl3?=
 =?utf-8?B?STJSck0xSk0zRjAyeXNJSGJyeFpTcXlTOUIyKy92N3FCUGVzVXFVa01SdHBQ?=
 =?utf-8?B?WmpOYWxzcWV6SlRjcTZ0TDJIK2JsamFxOEloOG1wRUw5aHJaNFQ1MkNtRnFG?=
 =?utf-8?B?SndCMjNmc0t5Mk9ya08wU3lYeUQ4VWJacExwWitOTlllM2pIcEVDRC8reFNy?=
 =?utf-8?B?c1B6bkFVaHpjTEoyUVRkU2FLL1JINzdPUVExeUxJREZMeWcxM3RrL0VDc3Fs?=
 =?utf-8?B?aGw3cHlaMDZsRHp2R1hnOEwxaHZhWFVQSStlSm9rY29SWGYvM2NrL1haWjAv?=
 =?utf-8?B?NHZXbWt4U2dwME4vdzhORmRhZXVjcEYyeHJjeVlIZFFJV1Y2UUFpVlE5Q3hw?=
 =?utf-8?B?V2NNcFNST0VjbjgrMTJXM28rblBob1ZxRklSSEtPZm4vampDWFJseEV4VVZV?=
 =?utf-8?B?ZFAwK0dTcW1BK1VZc1d4R0RIL0JPT0NMQVB4SjhNb1NmMkJWZnRBeUhCdDB5?=
 =?utf-8?B?eUhvZlI1cjdMeE5tODd5Vi82MFEzN2pvZkZTVHpNSmZXK3phdDNRR2YzZS9k?=
 =?utf-8?B?QURsQnF0Y0oxN3BBKzRaMW1ZQ3lsMlpyUzB4SnNHRTk0cGhzLzdpbzhlT0py?=
 =?utf-8?B?dUpnb2hzejFkaDk3a3grc1JiZWxZcE9OZ1lad2J0SHpMWXV0dDVybkJFT016?=
 =?utf-8?B?QVhSNlJQTWdZWTJwNWFqYU4zaEFjYWhNalprNjk0NFZ2K0hSUlAzZmxlenc2?=
 =?utf-8?B?TzBUTkVSM0VlbHZaWFJuWTdWejVLQjdzTEVtQUJHZWtPdmZQbit4dVNpVEtZ?=
 =?utf-8?B?aVJzZ09FQ1hGdExzZDdiRUM3V3B6cHRwb0FFa012cmpGU1I1V05UK0o0dmZY?=
 =?utf-8?B?NVRMMmRZQlZ1K1lKYXRDcVA3Z0szM1V4RlRwVE14dDB6b2N0SllFSC9LdkxQ?=
 =?utf-8?B?RDZPeXdUTDQ5eUV3Sjk3UmNobFUrSEwzRXllMzh5eVdrcVBQSWZNM1UrQ1Vr?=
 =?utf-8?B?akJqbURPMTVhNmpVZUM3amlsRVZWb1JEbzZicnE3RVlpQ1p1WWg3NGl4UDRW?=
 =?utf-8?B?eFNhTUF0OTVyY0lDc05sZlVBa2ZITjhBSFN2dldhSjI3aWkrelA5TGxhRExz?=
 =?utf-8?B?TnRNbTVYblN2SnNDNDlsNlFsUmhLZUhyazNOeVZrMGtsdEUzVi9VWFZIVFc2?=
 =?utf-8?Q?G+iiS0cqaDqV82bc8c+0pfCbP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde3e9ee-a78a-4813-b814-08de11b6edcb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 22:04:10.6355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93Cr7muCdFoKV84Z/c08x1NawGDnUhIYsyt7DTP3Pl4mrItSihGok35/jPS0KxGB3zbOrIQv8N/aK7sqzl7gnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8343
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

Hi Alex,

On 10/22/2025 6:41 AM, Alexandre Courbot wrote:
> On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
>> Required for writing page tables directly to VRAM physical memory,
>> before page tables and MMU are setup.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/mm/mod.rs    |   3 +
>>  drivers/gpu/nova-core/mm/pramin.rs | 241 +++++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/nova_core.rs |   1 +
>>  drivers/gpu/nova-core/regs.rs      |  29 +++-
>>  4 files changed, 273 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/nova-core/mm/mod.rs
>>  create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
>>
>> diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
>> new file mode 100644
>> index 000000000000..54c7cd9416a9
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/mm/mod.rs
>> @@ -0,0 +1,3 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +pub(crate) mod pramin;
>> diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
>> new file mode 100644
>> index 000000000000..4f4e1b8c0b9b
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/mm/pramin.rs
>> @@ -0,0 +1,241 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Direct VRAM access through PRAMIN window before page tables are set up.
>> +//! PRAMIN can also write to system memory, however for simplicty we only
> 
> s/simplicty/simplicity

Ok.

>> +//! support VRAM access.
>> +//!
>> +//! # Examples
>> +//!
>> +//! ## Writing u32 data to VRAM
>> +//!
>> +//! ```no_run
>> +//! use crate::driver::Bar0;
>> +//! use crate::mm::pramin::PraminVram;
>> +//!
>> +//! fn write_data_to_vram(bar: &Bar0) -> Result {
>> +//!     let pramin = PraminVram::new(bar);
>> +//!     // Write 4 32-bit words to VRAM at offset 0x10000
>> +//!     let data: [u32; 4] = [0xDEADBEEF, 0xCAFEBABE, 0x12345678, 0x87654321];
>> +//!     pramin.write::<u32>(0x10000, &data)?;
>> +//!     Ok(())
>> +//! }
>> +//! ```
>> +//!
>> +//! ## Reading bytes from VRAM
>> +//!
>> +//! ```no_run
>> +//! use crate::driver::Bar0;
>> +//! use crate::mm::pramin::PraminVram;
>> +//!
>> +//! fn read_data_from_vram(bar: &Bar0, buffer: &mut KVec<u8>) -> Result {
>> +//!     let pramin = PraminVram::new(bar);
>> +//!     // Read a u8 from VRAM starting at offset 0x20000
>> +//!     pramin.read::<u8>(0x20000, buffer)?;
>> +//!     Ok(())
>> +//! }
>> +//! ```
>> +
>> +#![expect(dead_code)]
>> +
>> +use crate::driver::Bar0;
>> +use crate::regs;
>> +use core::mem;
>> +use kernel::prelude::*;
>> +
>> +/// PRAMIN is a window into the VRAM (not a hardware block) that is used to access
>> +/// the VRAM directly. These addresses are consistent across all GPUs.
>> +const PRAMIN_BASE: usize = 0x700000; // PRAMIN is always at BAR0 + 0x700000
> 
> This definition looks like it could be an array of registers - that way
> we could use its `BASE` associated constant and keep the hardware
> offsets into the `regs` module.
> 
> Even if we don't use the array of registers for convenience, it is good
> to have it defined in `regs` for consistency.

Ok, I wanted to do that, but I thought since these are registers, it is weird to
move it there.

Also we need byte-level access, register macro is u32. I don't think we should
overload regs.rs just to store magic numbers, these are not registers right? We
have PRAM window configuration registers but that's different.

> 
>> +const PRAMIN_SIZE: usize = 0x100000; // 1MB aperture - max access per window position
> 
> You can use `kernel::sizes::SZ_1M` here.

Sure, will do.

>> +
>> +/// Trait for types that can be read/written through PRAMIN.
>> +pub(crate) trait PraminNum: Copy + Default + Sized {
>> +    fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self>;
>> +
>> +    fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result;
>> +
>> +    fn size_bytes() -> usize {
>> +        mem::size_of::<Self>()
>> +    }
>> +
>> +    fn alignment() -> usize {
>> +        Self::size_bytes()
>> +    }
>> +}
> 
> Since this trait requires `Sized`, you can use `size_of` and `align_of`
> directly, making the `size_bytes` and `alignment` methods redundant.
> Only `write_to_bar` should remain.

Sure, slightly poorer caller-side readability though but its fine with me, I'll
do that.

> I also wonder whether we couldn't get rid of this trait entirely by
> leveragin `FromBytes` and `AsBytes`. Since the size of the type is
> known, we could have read/write methods in Pramin that write its content
> by using Io accessors of decreasing size (first 64-bit, then 32, etc)
> until all the data is written.

Ah great idea, I like this. Though per the other discussion with John on keeping
it simple (not doing bulk I/O operations), maybe we wouldn't need a trait at
all. Let me see.

> 
>> +
>> +/// Macro to implement PraminNum trait for unsigned integer types.
>> +macro_rules! impl_pramin_unsigned_num {
>> +    ($bits:literal) => {
>> +        ::kernel::macros::paste! {
>> +            impl PraminNum for [<u $bits>] {
>> +                fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self> {
>> +                    bar.[<try_read $bits>](offset)
>> +                }
>> +
>> +                fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result {
>> +                    bar.[<try_write $bits>](self, offset)
>> +                }
>> +            }
>> +        }
>> +    };
>> +}
>> +
>> +impl_pramin_unsigned_num!(8);
>> +impl_pramin_unsigned_num!(16);
>> +impl_pramin_unsigned_num!(32);
>> +impl_pramin_unsigned_num!(64);
>> +
>> +/// Direct VRAM access through PRAMIN window before page tables are set up.
>> +pub(crate) struct PraminVram<'a> {
> 
> Let's use the shorter name `Pramin` - the limitation to VRAM is a
> reasonable one (since the CPU can access its own system memory), it is
> not necessary to encode it into the name.
Sure, sounds good.

> 
>> +    bar: &'a Bar0,
>> +    saved_window_addr: usize,
>> +}
>> +
>> +impl<'a> PraminVram<'a> {
>> +    /// Create a new PRAMIN VRAM accessor, saving current window state,
>> +    /// the state is restored when the accessor is dropped.
>> +    ///
>> +    /// The BAR0 window base must be 64KB aligned but provides 1MB of VRAM access.
>> +    /// Window is repositioned automatically when accessing data beyond 1MB boundaries.
>> +    pub(crate) fn new(bar: &'a Bar0) -> Self {
>> +        let saved_window_addr = Self::get_window_addr(bar);
>> +        Self {
>> +            bar,
>> +            saved_window_addr,
>> +        }
>> +    }
>> +
>> +    /// Set BAR0 window to point to specific FB region.
>> +    ///
>> +    /// # Arguments
>> +    ///
>> +    /// * `fb_offset` - VRAM byte offset where the window should be positioned.
>> +    ///                 Must be 64KB aligned (lower 16 bits zero).
> 
> Let's follow the rust doccomment guidelines for the arguments.

Ok, Sure.
> 
>> +    fn set_window_addr(&self, fb_offset: usize) -> Result {
>> +        // FB offset must be 64KB aligned (hardware requirement for window_base field)
>> +        // Once positioned, the window provides access to 1MB of VRAM through PRAMIN aperture
>> +        if fb_offset & 0xFFFF != 0 {
>> +            return Err(EINVAL);
>> +        }
> 
> Since this method is private and called from controlled contexts for
> which `fb_offset` should always be valid, we can request callers to
> give us a "window index" (e.g. the `window_base` of the
> `NV_PBUS_BAR0_WINDOW` register) directly and remove this check. That
> will also let us remove the impl block on `NV_PBUS_BAR0_WINDOW`.
> 

The tradeoff being it may complicated callers of the function that deal purely
with addresses instead of window indices.

>> +    ///
>> +    /// The function automatically handles PRAMIN window repositioning when accessing
>> +    /// data that spans multiple 1MB windows.
> 
> Inversely, this large method is under-documented. Understanding what
> `operation` is supposed to do would be helpful.

I will skip these comments for now as we discussed dropping complexity in other
thread, but thanks for the review on this. This function should be likely
dropped in the next iteration.

>> +
>> +    /// Sets the window address from a framebuffer offset.
>> +    /// The fb_offset must be 64KB aligned (lower bits discared).
>> +    pub(crate) fn set_window_addr(self, fb_offset: usize) -> Self {
>> +        // Calculate window base (bits 39:16 of FB address)
>> +        // The total FB address is 40 bits, mask anything above. Since we are
>> +        // right shifting the offset by 16 bits, the mask is only 24 bits.
>> +        let mask = genmask_u32(0..=23) as usize;
>> +        let window_base = ((fb_offset >> 16) & mask) as u32;
>> +        self.set_window_base(window_base)
>> +    }
>> +}
> 
> If you work directly with `window_base` as suggested above, this impl
> block can be dropped altogether.
But it will complicate callers. That's the tradeoff. I prefer to keep caller
side simple and abstract away complexity. But to your point, this is an internal
API so I can probably code it both ways and see what it looks like.

thanks,

 - Joel


