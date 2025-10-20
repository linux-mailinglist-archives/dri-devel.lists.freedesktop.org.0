Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A31BF4002
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 01:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B4710E540;
	Mon, 20 Oct 2025 23:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Otz/3LUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013071.outbound.protection.outlook.com
 [40.93.201.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC5B10E541;
 Mon, 20 Oct 2025 23:16:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCM1DyE3V8KVUd+uOeXLIVzA+MNwihGRxTT5lGN+zWwHEEnEmHLJUNjbEP1lANRGRrAiBNlVSpkMhkrbzKCaiGBX4w/yVFY/HcAinFRN+/h1tuTw4XrW38ernrmrK0gGyhq3mdsAmEFUFhT0Wej4qmCLRjzCu3sUXFtOkueJOhI6INoj2gXBxo65N6UqWk0Y7m36ayP/QeXgN/+mCjYRgnO6VxfUO1BIGPynidn+VAnz7N4pyN6W8Dup2s1gyE8Z/IztBvDcw8cCgtuxIQf87cRrxPtrerzlgDPu4o2sXGNwdhNZ2C+IT7l2TSVQ+7jsw/k3Ht0MZI9+Q8a+ZgeHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XpFHGx1LUBJ+Xw06Mrjq2kD7prbC/WcPf5bGlEzzr8=;
 b=JQI6Y+TLqi6HrK6H2TFSjhJXOU2Bj5bIjDMY9BsUc7KvOt1hZPuCzeu5+2z9s+D+Wna/QGUxoTORKk8cN8wqtM1GZBwfSzMLNfjTATbj5+Rr0A02BmnmCSZvxOENEOFh2eEqFzxtid3iVoFboKh7w+BVqlLUplzQ3eunbWw9F43CiMCLvIB8tyNtwUQ8nOAsT3BCATicbh4pIKky7/ctRsGBaWVVikw/75aNjVq8DQlcVZmn2PbLI2mMkkgs4SKjImeU0dgLyl130EckY82RnQVVsMCi3dNDBy9/944Ll42hoLLKiy5ZF+3hUIea/HnpDw7gMRE7hpG4VGovnh6DKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XpFHGx1LUBJ+Xw06Mrjq2kD7prbC/WcPf5bGlEzzr8=;
 b=Otz/3LUjDHySdVB3YHXfGagRyJfyG+kJGNHCvmk1c8IKvUPUAz/ZfTsymp4Pzwyb80+P9Jv+Vqv+sbsldlLawbwDGumdlxt3cK7HHKGuTnB2ukUnSVcY1kfGn+iS+J8sdMYXHVQ2lkbpD4Rq7EF0LMPGxLQjGZzQDKHE1nKuVNL6B1bYpQbFMBEreiqGjCHqP5RAwrMGi+5/6sgTLFe8BpgXFQTGKHTs2z9PxPqBqwYpXG4qXfnzbeUvCfmiGZrlQLAnDb2S5zXRxySlubXbpHW1L13MvUc6GLI06aLKFVV0Gge09G9vPc+Z5W2+3W/ZYJsKsxD5DR02b3D8wtGCbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 23:16:44 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 23:16:44 +0000
Message-ID: <0e592a2d-6c0a-4dab-b16c-ff994917af9a@nvidia.com>
Date: Mon, 20 Oct 2025 16:16:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move bitfield-specific
 code from register! into new macro
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Edwin Peer <epeer@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
 <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
 <e4f5ca12-bf67-4b48-97a1-7ab2c771056e@nvidia.com>
 <aa3b4ebf-12c9-4ffd-bfd9-bcd920970309@nvidia.com>
 <DDNIZMOBCE1Z.1ZOQ83TKTHQ28@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDNIZMOBCE1Z.1ZOQ83TKTHQ28@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: d1deed7e-dc5e-4b4f-9f98-08de102ebbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUlVUTZhTFl6RmVhWjJvY0JyM2VvL09vTlpwREpGeVJRUWlEL2ZQV2o4RU5K?=
 =?utf-8?B?YWJ4bkpTb3h2SmU5Nk9nMStqODVrNHVlU0Q1Q0ZtUEpZSlp0NVVCd0pJSFFZ?=
 =?utf-8?B?ZGxjelFDWmpxcE4zaVBtdytEcURTYytkbVRYYlZsdExmNjZsMTdSRzV5R1ZT?=
 =?utf-8?B?RmVJOG5vcWNsUWxsK0hKRGFIa3NyaG54WEtMbXozQkYxeU8yTU96bTRPNFZo?=
 =?utf-8?B?YzRyc1RiSStuNk1DSG5GVjc2dzdRS1hLNnRzdWpGT0pzWm4vT0UxdldBM2Jj?=
 =?utf-8?B?ME0reExOQUdCOUJmRldaTk5MVzNBTWxVN25FTHpRMVVJTUxRMWlXZEs4aTdy?=
 =?utf-8?B?Z3V2S0ZrcloxbFpYNVNxZHFUMGlHSXF1allVbWc3NERXL1lRRTVVZWN0aDJq?=
 =?utf-8?B?eHQ3RGxMNTNSVnZ0akRKVm4yT3o2RXM5VDV4QzVrSDBVY3JvMnRmbG92cEw3?=
 =?utf-8?B?RE5IR01SVzN2Q0xoTmFjY1JEMjhzZnNnemFPa0NPcnVFc05FYVJkUmxkTmJF?=
 =?utf-8?B?VmxyZU5VL0ovNnBVRWRuUnBYa1VRTjdSenBKeU5jUzZiSkNmQVpBT1g0RjBS?=
 =?utf-8?B?SWRKUE5ReEhiSTJkRGp4VmIrQWZ2Q2RkOFNhc1o4ejBwaVhBR01hZ3dib2h5?=
 =?utf-8?B?ZnNjelc2S0laOVRxYkNnbldDRGNuYVZuUnU2UkdITG91MWluWUprZTAxSjFm?=
 =?utf-8?B?WjRIdnc2K3NsUSs1UWQ1ZmQwMW5wMW5ZM3VsRE1vR1p0KytFT25EVUVzUGxv?=
 =?utf-8?B?S0YrN25UdGZqYmE3VFFHREFGekZGcTNJZWVWNWZLWlBqU09QNTFFcnd0OFVN?=
 =?utf-8?B?UjR6KzhRVmFjTzVqZ0l0WnRSaE5SNzZxTHdCWUFudGFDdHpVZStTV3VOYVBX?=
 =?utf-8?B?cWdsd1c5QUJadlJkcTRkMGFTc1R4azZ0NnkrMm9qRS8xRXpTckJkTkUwL05F?=
 =?utf-8?B?eVFRQXFHSDgyNlZYcTRwRXpOZVljaENMbXZvOXBtNjlNUGZBVG5OTGphWlRI?=
 =?utf-8?B?TFNYZ1ZCbXFFTXFocXU2MU5OUkRtbEd1ZW9xRkpHdTZoK2RqcG5YN0Y5NHVI?=
 =?utf-8?B?SVRtVTZhaDVGSUx5b3Z4a3Q0MitEZFhRdkx4dDZSdXo5OXFCVmJwWXdLSVpv?=
 =?utf-8?B?Wk5HUy9iN2ZtYk5jQXdZMFhiYWVRS1lvRk1zS05EUVd6aTZUamI3bmxoYjR0?=
 =?utf-8?B?cldWclNIMWV0R21zb3NXb3FVRDN0WGZkNENDNlZhbnFFTStNU1BPZFlwcDFk?=
 =?utf-8?B?VFZBRFdpRWNHc2F0ZlkydUVaT2JIMWEzMXQvZ3lqTW80VWk5WW04aEpBUHNu?=
 =?utf-8?B?b3NRbmovU3ZRZnFiZzcxOUlGTVhXNnNKd3h3aG80c1VZdHVCcG4vcTR6UmMy?=
 =?utf-8?B?dm5ycVZXS1Q1TmJhQXkzOCtkR3l4a2pIZVR3ZGtMbEhXODFwaTFleXBPa2FY?=
 =?utf-8?B?WFE2VzFXSlNUZ3dmRFZxTVFINm5jOStqbDYvSEJ5TER2ajMzd0ZNdjR5Nmk3?=
 =?utf-8?B?VVNGV0FCNWxSTUpBVXlqR1pwMVZLcGNFelArbTY2KzVPYjU2QVNkbUppV3dM?=
 =?utf-8?B?M2o0TFdGeG8wWS9HbTdSZzZDTE9FN285S1dzQkcxeWdwMmhKY2N0Vkw3Umwz?=
 =?utf-8?B?dUZrU1FYSWlSZWtLL1FNMUYwNTliK2ZjbzJoaVkyU2NaQldvM0JIOTRadnhl?=
 =?utf-8?B?REU4ZWE0MndudDE1KzNqVWtMbTlrUE11eUM2MW9XQ1dZVnZZdHIrdzZObEZW?=
 =?utf-8?B?YnVLZHJrMjNtd0tINEd1aTBTZlFqeXpEVk9VcHZ2emtqZStMcnRBUUtKOUlV?=
 =?utf-8?B?V3FXZmJpUUhmTDRBNVd2bDJobTEwVCt0U0FtTFFReFBEU3BxSVVoL0w1dk85?=
 =?utf-8?B?MUc3VXZmRE1scEh2Skl6QXlIUDVBRE8xN0ZCSEVIS3IwTmhacGZ1NmdaSnVQ?=
 =?utf-8?B?V0ovdXJ1akNQOUtjdldFek96RzlyWWl6Y3F2eEgxdGN3L0V2WWF5RXhkZ0RI?=
 =?utf-8?B?b0xZdURITVBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0hyS2dXcHkzM0ZSaHpSV1pCVFBNYlFHcVBSM2drTmhUSW1VQkxjWmpTUlZV?=
 =?utf-8?B?bHd1cWNyOG5NbTlMTDdIZE1GRmtCM04vQVYvN2lmU0xJeFh5NUUwWHJaWFNQ?=
 =?utf-8?B?bGdKaVdLWmFIaHNOeXd3bmlwRVhWc3lCc01iTTNvVFRTVFIvVFVMOUoxR3ZV?=
 =?utf-8?B?NmM3THJpUERKTVVKTVZWdVh5MURYNU9uajlTUUtwYTdOL1I1U3o4YUVPMWpk?=
 =?utf-8?B?Tlg0b256SlVVa093bHMxdnd5ZDlDQ0hCS2hMRXJINW9QeFFMdnZjV1NTSnM4?=
 =?utf-8?B?RFlGci9la1FncGEvU2w3by96cCtnWGF1NXBzWWVjZUlCZU9LZmpwaVd5Z3FW?=
 =?utf-8?B?dlloaU5sQW1WQXVSVWJLYUxLaldrWUQ2VmEvNGxsMFBLeUZoZnJ6MytBbVR4?=
 =?utf-8?B?RXI4bU9jOXcyaytQMXZsaUNVSFY5NjBSWmRzSTNpMVBBbGs4WmxTTmQ4Znc0?=
 =?utf-8?B?RWV6Ni9tT1JjZXhzMC9zWmZIa0lTblpuS3hkRVJaMXgzNWxjNy9UK2Y2QUEx?=
 =?utf-8?B?cTlZYU1VNnVIUHlWL2tWVWJHUjFScitZekV6YktNQ0tQamdZaTFOWnpkc21M?=
 =?utf-8?B?bkVlWlhXNWJEbElGckFVM3VOUG9XU2EzTkZjS2oyVitnOHFyZURhYWtNWW8x?=
 =?utf-8?B?TytyN2FTV3Via3d3alBjcnZDTi9lYXF3SFJKTllCOERlLzVlTG4zM1YzNzI5?=
 =?utf-8?B?QmQ5T0VHYzNJUktlWmpBTDh4K2dxQUpsc29UdXc1Tlp6a1IzSjVhalNXWHJG?=
 =?utf-8?B?YjVaRVIzR3pROVYxQ1NjNmpGelJhVGZmSllUZWlYYitGVnd3UzVCQVR2cnd4?=
 =?utf-8?B?ZkgvL0JVTjdpTnVKYkozcHdSTi95amc3bmprOW4ycGhHL1ozV3NmdWVZYnhL?=
 =?utf-8?B?QThZdFdNMDVDcGRqU1ZlaDlmNDFCcnFIOUZVaWpvcGNnaEdObmowMVR5bC8r?=
 =?utf-8?B?Zi9adEMvUTA5WGJsNjNZbFNqWHNZN0s3V2k2UkpldlN1Y0pBeC9FYkp0YnFu?=
 =?utf-8?B?THM1dHVBaFptZ2pqczdkYW16NTdOcG5JS3JIRW1rTXJIcklZRndRUmQyaWk2?=
 =?utf-8?B?ZXYvNXdGbW12c1c3OStVR3pDUUJJR1NrUDNCUGowT1NtZWhrNU54SHRiWS8v?=
 =?utf-8?B?RzRHM0FjNGV3WmhyUXBhcGNPL3l2WjlpVkNsWU5VOUl5S0JoQ1JkWFRQdFcz?=
 =?utf-8?B?ZW02WEd4elVJbktSelg2eHladWU0Mm10N3h3TGxhdEJtWGptTjlobTA2VVpY?=
 =?utf-8?B?OWhyaURONWNDclBpaE9SZXMrYlFyVTQ4ZUNQL2J4UGNkU0lOR3BIckIyalpS?=
 =?utf-8?B?cGxpVjM3Z2lXakRNNk1CbytLd1BjSyt3aEw5dmpIY3A2bUFsY3Y3R1cvVmFL?=
 =?utf-8?B?Qy9vTHZHNWZGUjI1UWxPTlQ1dFVML2tQcFpIU0FtYmEzWFpHYVZZZHBSdmRl?=
 =?utf-8?B?N3NwYWdLL3Zjckx2K1ZFR3EzeDJNeC9BN0puZkxBZk5MRThEemV3S2QrWU43?=
 =?utf-8?B?aFRmRXJhM2ZOcXdKR1l2VnNoZzlwYkYvZy9ITHN4dXI4bGF0Z3JYZlVUQ1k2?=
 =?utf-8?B?TUViUExHVzYwUG5IM1RZWTAxRFdzQmh1VXM5ODAzaUxxdXYrenIwNWpJalN6?=
 =?utf-8?B?TkxPVmxXSE1Ob2tWRnJjMmhCT0lMUldVOEpXVnZWSmJ4Q1k5aGVabjlhalhS?=
 =?utf-8?B?dkxnazRML1VMSDJwQ0V1ZmZHRklFNDRiNFluOGRUbjZrQTJZK2ZnMTM3eUZZ?=
 =?utf-8?B?azM5WEtCNEtNV2lTd3VxRkpyR2VIS2dGalhFdmhWQlhLb3c1TEFaNzNpd3Jr?=
 =?utf-8?B?RWFEZVBFY1lmNUpQYW9Fb1ppRUFLWUZkRThyQ3M1d2lvTWsxeTRzWkNGTUZv?=
 =?utf-8?B?ZGRhTFZ4bkE4QnM0MVBpSHZGL3pGdVpEc1IwL0ZRd1lBRXdWTDJPdFpGWmVm?=
 =?utf-8?B?a2FhTDhFWVdBR2NNbjZVem1ua1pQeUJybUg5STVnSW5Ic0l4M3JIeWVxemhF?=
 =?utf-8?B?VDMzVnFjYkRkcjNJSWNMODJIdGM5d2hNZUJDZ3dmNVRXTEU3LzdxRWpHdFds?=
 =?utf-8?B?VkxIOU9mdGE3V1B4bU9FL3RBTEtCQklJUkpqcTFQUzA1cXU4SWZGa3UxZUFO?=
 =?utf-8?Q?/WRBBL0wt9h7pu8Gl/81hjlKV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1deed7e-dc5e-4b4f-9f98-08de102ebbda
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:16:44.1807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMxM5eauAx/PaahKy7YMi8948GJsXZ7uT0FLmit1cRAdQc6qky180P+5HvzvnUIQs6ITpeI2nU+9g5UVtYaGjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
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

On 10/20/25 4:07 PM, Danilo Krummrich wrote:
> On Tue Oct 21, 2025 at 12:50 AM CEST, John Hubbard wrote:
>> On 10/16/25 12:39 PM, John Hubbard wrote:
>>> On 10/16/25 12:34 PM, Danilo Krummrich wrote:
>>>> On Thu Oct 16, 2025 at 9:28 PM CEST, Joel Fernandes wrote:
>>>>>> On Oct 16, 2025, at 1:48 PM, Yury Norov <yury.norov@gmail.com> wrote:
>>>>>> ﻿On Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wrote:
>>> ...
>>>> While I'm not super opinionated for general bitfields, for the register!()
>>>> infrastructure I very much prefer the hi:lo notation, as this is the common
>>>> notation in datasheets and TRMs.
>>>>
>>>> However, if we use hi:lo, we should use it decending, i.e.:
>> (restored from the email thread):
>>
>> 	bitfield! {
>> 	    struct ControlReg {
>> 	        7:5 state as u8 => State;
>> 	        3:0 mode as u8 ?=> Mode;
>> 	    }
>> 	}>>
>>>
>>> Sure, descending works.
>>
>> Oops! I need to correct myself. After reviewing most of Joel Fernandes'
>> latest patchset ([PATCH 0/7] Pre-requisite patches for mm and irq in
>> nova-core) [1], I remember that the HW documentation is written in
>> ascending order.
>>
>> For one example (out of countless hundreds or thousands), please see [2].
>> Considering that I actually pushed this file up to github just a few
>> years ago, it's rather silly of me to forget this basic truth. :)
>>
>> We really want to stay close to the HW documentation, and so, all other
>> things being (nearly) equal, this means that we should prefer ascending
>> field order, if that's OK with everyone.
> 
> But that's OpenRM specific, I'm pretty sure when you look at internal datasheets
> and TRMs you will find hi:lo with decending order, for instance [3] page 1672

TRM is Tegra. This is gradually going away, from our point of view, as
the larger, older RM (Open RM) driver subsumes things.

Open RM follows the main dGPU ref manuals, and we have piles of those
and they all apply to Nova.

None of the TRM stuff applies to Nova.

> (clicked a random location in the scroll bar. :).
> 
> Besides, I think that hi:lo with ascending order is confusing. It should either
> be hi:lo decending or lo:hi ascending.
> 
> For registers the common one is the former.
> 
>> [1] https://lore.kernel.org/20251020185539.49986-1-joelagnelf@nvidia.com
>> [2] https://github.com/NVIDIA/open-gpu-doc/blob/master/manuals/ampere/ga102/dev_ce.ref.txt
> [3] https://developer.nvidia.com/downloads/orin-series-soc-technical-reference-manual/

