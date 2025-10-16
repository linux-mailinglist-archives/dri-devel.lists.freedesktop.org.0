Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8634CBE41AF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CB910EA19;
	Thu, 16 Oct 2025 15:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TXbo0xYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC15B10EA11;
 Thu, 16 Oct 2025 15:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYO0wxnhA4QAOljxnAawdNOlDIq3ElNrjmybBryNYOq0Sn/7Ll5b1tgtchbxibumAZXWB2H8c+Tt4OEMF8eQFYzwboN/MwpOMrKeRCOJQHP7RfQNY5Mwn3l3KYpBbXnSC/lTyu9UUVYqPJpcudk8QZBDPguykr7r+XOsiH+/7SYewoyn1+OwUW2GFCvcSPGGcK/EzBZsqbUtbdPY5Ob+z9bTRvcDoQfnOAuCchHC/dW38RwulqvLi5HORSTfamE03rzw8H5jcfeRfMOEJVEw15ZY3Wr2tjFiUW2O8Su/pbLUL5Ho1THb3Vnqp3MO+XKPcZNlxE/868N4KvYgz0H15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv2ishWC8UVO+FlZ1ZL8etEhfApaNVWQHNchZBN91Is=;
 b=dI8l20Z/L607EvtCn80Cuize2UdInGxyhTn46JrIxxusX/hK9/j7u4P5/Aw+i6fwawW5EOJG5dqGLE0MHcNVBoPUMUXORMpo9/oax+EGRJOTfywGkGy4C++T8EmTNATyvQRk3NdAayOnI/iWLbLrilp3MK4UOlf8M6/ZF+BeKwIMVplHAI+spExtIryMqrvOtDe+CyZU4hRiBocf6FteomGa4d3j46XTmaroisZ9i3tXWNtIlcOURoIXFuLDUpEGZdZ2mrECbWte5m5C+4r42PYS+0vjarx+2zprksAVMcDXM8MOio0QEHpGknVTGUHQi8zyzAA+YYHu6xsPsCFtuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv2ishWC8UVO+FlZ1ZL8etEhfApaNVWQHNchZBN91Is=;
 b=TXbo0xYuQWqZmzjlSIsOtAIfobtiPxn9Vam6Y3Yw+uGpwO/wEnAjn1EwSj/6EYnlzlvJ5RN2CJ4SxCh+44QaqxR8pOS7ZB6rykWCgNtsi8gpilEMZskWjOuujpMNGVS8fy99uaPw7uTmkkV/2Jq8A9jyDInP1X4+eTPS5EyrYgCpEiA688ngT9XuNANOZhIoairZUuQV4Mn84xfLy1+LM6EfeP2bbgqsAppkjKmY7R8W2vHLaXJDP2aqX+uSY5basfOoG2jPv3T3se48RfRVMio+4G5A/8S2Z/srvugOdAz7kzH2umGAGRWibWUDborf2eE/8MMUIVvZuuTTvPTXoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB5808.namprd12.prod.outlook.com (2603:10b6:510:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 15:05:46 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:05:46 +0000
Message-ID: <a3f8f89d-be89-4fab-8399-6340ce4db899@nvidia.com>
Date: Thu, 16 Oct 2025 11:05:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] gpu: nova-core: register: use field type for Into
 implementation
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
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
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251016150204.1189641-1-joelagnelf@nvidia.com>
 <20251016150204.1189641-2-joelagnelf@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251016150204.1189641-2-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:52c::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ced3e9-54a0-45cc-2ab2-08de0cc57b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjlnV1NaL1N0R01vQ3pkUTVCb1NVSlpsTTFOTS9HVVIxU05meTVxdVNHVXRD?=
 =?utf-8?B?Y0QyY1VKd0xXTjQ2NHp6dm9QMFEyaTRRQ1h0bHNUcEJDOW1DR295Zk5sWWZn?=
 =?utf-8?B?a05aTHNJVVlZazIrV0kwVjFsRWZzOGhaQ1VvMUJLMFBiYWgyN3RMWUJpZ3hY?=
 =?utf-8?B?TGw3eXpDY3c0dVlFUHNUM2RsQUZKcnAxQ25pZWY0UktIMmlTMzNWV1pwaDFR?=
 =?utf-8?B?N1pQTFRxdlU1aTNVU3FzRDVIT1FuL294OVBoZHBiTFh5NFdjNUpOLzg0bGRI?=
 =?utf-8?B?Z2pSMmpjU3ExUEZUYWxyVkpQQW5FcGhtM3Q3eDNrSWJLSmRkTk02eUZQN09w?=
 =?utf-8?B?MEJGN2xiK01makNuVGNxWUdvZHlpeFhTQWoxL2tNeGU1U01WanNCazhwWEdX?=
 =?utf-8?B?elVSSTBvSzh6Z1hLTzNWNk53NFlYSWdwSFF5NTVQVUw3NnlneENPSXQxSS9R?=
 =?utf-8?B?cE55QUliS20vOEdNdThuemVjazhENnRnbjJqSGhsWkRtNjk2b0wrTXRacEJL?=
 =?utf-8?B?a05BaG42N1lpQWtMZlNjV0NJSkNWeldhRzAwb3JGaGhyRVg1UERBSk1VR3ky?=
 =?utf-8?B?bUhqajVhZFZWN3N6MmxvT0IzZUgwbnQvKzNEeXFJOUZJbWJNaVZGVVl2elNh?=
 =?utf-8?B?VGZpR2FqeHJLVUd4RHpUVXJZWEFzQU5FT3M3Y1BTYjJ1R1U4K1BOTVgzd09Y?=
 =?utf-8?B?Vk5rTVhoUlNaelVSOU5RMWIrVkU4SjJhTW52Uml2OHFtZTd5SXo5Q251c2ph?=
 =?utf-8?B?QmIzY0xpbVFDTGx5TS9CWmNwQkpFejF4Q1pxdEhsMTRMd0lvbWhCK2Z3d3RG?=
 =?utf-8?B?OG1nWDBJbnNLamQvT2NVbXBENkJINWRHKzJ0V05tNTZJWWxHak10Nk5Pay95?=
 =?utf-8?B?alFiVXd4cTcxMXJ3MmVuWHljTWUrenA5VmM0MkhhbzFHYVBOSFZRTVpodysr?=
 =?utf-8?B?UCtqd2FYeFRCMCtLeEJoTDZMajc4aVZ0R3NMWVdMNmFKeS9LOXlBVSs1cU1w?=
 =?utf-8?B?Mng0a1NjaXQ0NXFYT1QxdHlpbHNaMUZzZ0NaVjFUWkxiUUxHTWRCY01CaTBQ?=
 =?utf-8?B?RGZyd0FnQzFLNXM5MUNmL2MybDkyYjRTMVl3ZTNMalJvVmVTQmV0RzRrSFZJ?=
 =?utf-8?B?RmNNN0lyTlhJZnRuRzlucVVZa09TNHhrM3lXWXhyYlMvT3QxSzJYYzgxcUFi?=
 =?utf-8?B?YWROSkZkaVY0UnBjUEt1bDBZWUYvUysrY0RlTWRTdmtGdmt2VGZURFRiV0ls?=
 =?utf-8?B?TnNjeWdyKzVyWHFkaEFMRng5VC9sR2gyNzdhTSt3MWl4UkJ2QnY4MStyZjlu?=
 =?utf-8?B?ajBScWVsVVlodmYrL09pS3ZKWUtTajZ6LzdUdFhVeXc2dERVcldQZU81SUE5?=
 =?utf-8?B?OWRtT2RSU2YwNU1kL1dOdEErYk5VcGZLL2xQU0JWZEZnZGRTdFh6S3JqQ3Zi?=
 =?utf-8?B?WjA5TU9aNFlaNkdOZFNBQ1Rldm9xSUdIaXRPQkw2VnIwVXNvVmJOUFpaZ1Yr?=
 =?utf-8?B?anNIZGU3czE5STFnVUpvTVJheWordnA5TElPUytpblg5MkcwTjRSRElRb2lX?=
 =?utf-8?B?MXFWM0FJSnFoTTl6by9POFpOblZCUnBHOTRGekZZb09hL01rdllTME1QRVVW?=
 =?utf-8?B?MXJHQmt2SnZMRDAxcGFadFVGMDd2U1ZNN2pMSUp4RW9Ud3hSOG9IOUR1VDc2?=
 =?utf-8?B?THhmMW9PUmJFUGNsV3Nlc3JmRjFPTDlrK3l2R0ZGY24xS1orVkZsZnFHQ2Na?=
 =?utf-8?B?ZFVKc1ZkbTQ0SmducWpVWk1zb3JDak82dXRnaWZ3YlFKZy9yRmEwMU9qY0E0?=
 =?utf-8?B?WWc4N3FHV2xpT0NaT1F5T1JyajVZR3BVemg1d2JRTmptSEJEbWVvb3oyMldH?=
 =?utf-8?B?SDQ0bDhkNkpiS1hLL2hGRHBRQVNZcUZiZDhnT3FyT3duOVZ5Y2dGeWg4VDEx?=
 =?utf-8?Q?HB5UKE9WZAA/JJp/C/6wjcV0/4S277kA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0lhNThibWVpVzZoVjMwemFxdzgxTTkvbkdSQzhUVnFHTjI5cUMxVStkbC9B?=
 =?utf-8?B?dVdhYW5jSDk4ZEVHSlBBT213ZGhib0wrZ0duMTVlelMzbFJuRHlqYktUTnI3?=
 =?utf-8?B?MXJTSU5oZlB6K0YrMlNmV0xtZ3dDT2h1R3BYSDF6NXBtblVLRHRJVSsyckda?=
 =?utf-8?B?RHNnNUxyS2NheWZLRDcyQmZ6cE1IdFZuQ0xKVUJwNnpudHpLYS9TRXBnYjdk?=
 =?utf-8?B?RHhOUHRNb1piYkh5cmJ5OUg2dXVWRkh1Z2lIYnFORjVhTWdKU2ZrSWJra1hl?=
 =?utf-8?B?RXhIakpjWFIvNnl4UzRFZDNHWGZWMHVxSEpPOHJLN1AxUU91eUhKZ3pWMnVn?=
 =?utf-8?B?alJNY2IrUUNNSHVWNjhidUJ2a2ZwQkp4ZWRHVExLNE93aSsxMUwzWjRVcTRk?=
 =?utf-8?B?RVFQOHkrK0xFUVloZTdTUmlHVzFnMVIyUzFWNkd6YjVmc3pjRTJDVlN2QjVL?=
 =?utf-8?B?OWNZZDIvN1lYcW45TDJ4TEFjLy9TWEVPZE5ZRUJqU01Bdm5hc1h4NWRWekU0?=
 =?utf-8?B?aXhLdXQrWHdHNnFiLzB3NGkyNWl6UDBUWWtkRWw2Tm9KK0VWT09UcVZaNkNR?=
 =?utf-8?B?TzRydTg5YXlJSURrcG9GZloyM0tDTnMwK3VTOFcrWkdZaW0zY0NYR3NJSmE2?=
 =?utf-8?B?SnZUU2RMd1VFMVJpUm5CZWxUTkhHenVJVlFqeWF1ZEZSTmRvL3RkaFFtRDkz?=
 =?utf-8?B?WmQycmp4aExVeFJrdW5TUFcza3M5YmV3Rmp6WGprSFF6VXNxUzdkSzhCZiti?=
 =?utf-8?B?akgwY0FKWTdxa3FNZjYxcUQxNWwyZ2pTaUNZT3l4eUtOcEhQQkdIbTZ4Tklm?=
 =?utf-8?B?QWlrNFBHTEdPUnVoSEJUbW11MzJqZWhET1VQK21Rc0Z2WUNiRFNzaVlrTDVz?=
 =?utf-8?B?Si9VSDdtZ29GbHplNWU5YmloK1hoek5Xc1hJWWtVWFduY0lrK0tKRkRYRTlO?=
 =?utf-8?B?aHVDbTh4QWRHSERqTnlSZHdxWnJhckpzV0dLUStiRXZJV0RFNEJnSFVlUTNR?=
 =?utf-8?B?SjJnOENTelFLUjdYY2xHM05SYXVHKzVNYW53bTArWDRWUm9yY1g4OVRDR3Jk?=
 =?utf-8?B?Q3M5Vlc4bFhRa1ZqQVhTWGRwQ0hveUxCc09NUUJkbDY5WnB2QlBPRUQ1c3NH?=
 =?utf-8?B?dk94NU5SSWMzUU0xTC9lSlIwVEJ4NHA3TEVON1RleEorWXVoWWtNaEFod2RI?=
 =?utf-8?B?SytZU2Rwam1WOWw4UUNNenVRSE9nQ3ZxN3Y1eXBWeTNHNHFXYityQUptNDhk?=
 =?utf-8?B?VVhoVko5UjN0cHY1TDRYNHRJZ1hQOUdpYy84bCtYVHp4VHNTVUNSbFFvWXhU?=
 =?utf-8?B?dS9pR2NZUUsxalV5RkNhcU5ycmFqaW55bHNvUXN6ejY4R2tNeWdOZUswdGtO?=
 =?utf-8?B?N2NUTHIvajlLakxna2w3VWxXR1JKTk8xUXZNbGs4eG5VSXR1UHJ2akZUY2dm?=
 =?utf-8?B?THRxS2RXMDZjYXdhVHNIZHR6Ni9Galh0Y1RCcXJEQ0dHS2xUZE56NndPa21j?=
 =?utf-8?B?UmE2bVpWcG1HQVkyVnp2NXN0YUl2eVNyMW9Oa2NqR1NSMVArbXJVQ3JDNEJV?=
 =?utf-8?B?Z2NiNXRweGMyQ2lpU2ZBWUtWVVpROXFHdVhYUGZUZk1hWVFEeDQvRm93Z0ww?=
 =?utf-8?B?YXh6U3UzQVNQSHBGL29NdzlqTW85SVdYditZY1dJWXNPMVBHeGZ3RHlHcXZE?=
 =?utf-8?B?aHB5dWRYOERVbU93bmpwZG5Ub3lSVUhPTlVMV2Z3Q1ZvMU5ya0IrUloxNGVQ?=
 =?utf-8?B?Mnl0cGowMEt2M0p0TGxqT3ZnRkxJaHFvOVlPUUFnWVhmbDQybE0xYi8zWXpm?=
 =?utf-8?B?eXlONXJFYXVZSmhpOCtDNWdPWWk5NnJrNEoxOU9kNnBjczM3WjFkMWY0cHlP?=
 =?utf-8?B?SkQxMGtFQ21seU5uS0tPQUdlVEF4L2Y1NVlVcHR3cEZ2V1lDclpoekVTVW1m?=
 =?utf-8?B?R21TZlFPdDY1KytQREo2UVVwV2RwRGtiVlhHUndoTGF3d1lxem9PNHg5elBM?=
 =?utf-8?B?ZXRqeWdhUTBMS0MvTVlrVEcyRlJ4d0EwbzFkMU16YUh3dFhSVnh4RjZYRXVk?=
 =?utf-8?B?UStidDVlK3U2blVNVDJSSnQwazBLQjBaTVpJVjJMSDhEeGRyTTlOTllycTVv?=
 =?utf-8?Q?uqxb9OlUEx7hBdezSVf7QSpIT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ced3e9-54a0-45cc-2ab2-08de0cc57b97
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:05:46.1755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYv3OavcIiVm5OdCPs6wjn8uWoL4pZqXmf8CWAzCd+WWbXR6PHJyvitilXPybmg6vqesGZ2Ztg3FJkOHSPLvig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5808
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



On 10/16/2025 11:02 AM, Joel Fernandes wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
> 
> The getter method of a field works with the field type, but its setter
> expects the type of the register. This leads to an asymmetry in the
> From/Into implementations required for a field with a dedicated type.
> For instance, a field declared as
> 
>     pub struct ControlReg(u32) {
>         3:0 mode as u8 ?=> Mode;
>         ...
>     }
> 
> currently requires the following implementations:
> 
>     impl TryFrom<u8> for Mode {
>       ...
>     }
> 
>     impl From<Mode> for u32 {
>       ...
>     }
> 
> Change this so the `From<Mode>` now needs to be implemented for `u8`,
> i.e. the primitive type of the field. This is more consistent, and will
> become a requirement once we start using the TryFrom/Into derive macros
> to implement these automatically.
> 
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Uff, my SOB is missing.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Alex, do you mind adding it to the patch when applying?

thanks,

 - Joel

