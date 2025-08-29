Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E116B3AF19
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 02:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8994910EB07;
	Fri, 29 Aug 2025 00:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mpqEaJ8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A312A10EB06;
 Fri, 29 Aug 2025 00:26:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkYi3cMV37WU7L2oFFRCSvcD+TqbxsYKEfZPAytvxo66YHy8+iwx/uw41JLsrgn4VpQIw6HKtcXW3xDBMlxsa5k+q+j5a1cVnm/Fd+5pIQaeMRjuD4j0H/sI8B6R8rG6oqkmmN5XPusjo+pwN4S55VFUGzN6fDHepq+Hg4iWCwP/V9+Rp4TeucJfxgVTY39mRCqEHvzyOie32k3BWJZn1JWCrJ6X8hN77pUDDTBYfkc7uqQzJZejFhjsoKCojF+XIuif7B9Ea88eE3uAm6tqb9ZlaHxy19SWAp6NYVKGXDNJfKfikSrPnuRS0gK9euznhzbQBbdJ87If67UumWYFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCNM/FUYe02eysUjyfqSO5uWeMpMRnRBaRxNqAGgEmE=;
 b=WEacRTKr/KbSY6ZTI/Z8rHIpHFh4bfmpJ9Lat43eTkvvUnxogkAFBRJqNLuqK7HdWe7vhgrIfZvRWwIGiFuW0q5cY5r0cyG9LEj6Wik8sj9T1xpp1fSfE8oZ9zNk5CCjyspHexN2tvGnSpYZbHbYEh9E8f9Jp7ovJT4FyJAd+zjrbBkop//MOgKW0/iB71zgZo3bWJOtOjW8lq+T7bZKFLQzEqhpy1lPJOqVrOvyfu0bm7CJ4dp2IUUvCdd9OfO5U5oTX7fkCnhTOoUhsuFSK3SN1OKHmnp0RP1Q15Tiqv5p+rnxcgywUDeS8rXZYeJ9Gt9W/e4Eu0qtcbMcw0Y4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCNM/FUYe02eysUjyfqSO5uWeMpMRnRBaRxNqAGgEmE=;
 b=mpqEaJ8rArEpYTfWAwHxKPArFHWITNRj4KizbUb2Oa3DaVftneb1VFOlflQs8mp88Uwv/tobz/a+eEB0MR5jcG4sulmFqk3kIKeU1cZZUUUqkifV62pNIeNXnfEj3T5jdvLk3Tku+xp3b02ZeIhnkfxl0Egxpz4vbHiqguBtoj+rJRj+WUeCnocLNYzB8ska0921JIwfcqpWkxIu5Lx2u7ow0MKOy6Hj/tmnTLryuDGzTyJLzORtbCq6+dizHx2IAJN5VUkHQWBXrFn3L74e+BzJKtc1V/+mu47eaQ8/VmeAxTFFqPoqymJbBQUojioLMH64ainFqU3FFG6h0CK1Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 00:26:17 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 00:26:17 +0000
Message-ID: <e2405c51-bdf5-4f18-97ce-8b42eacf1cc4@nvidia.com>
Date: Thu, 28 Aug 2025 17:26:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] gpu: nova-core: firmware: process Booter and patch
 its signature
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-3-93566252fe3a@nvidia.com>
 <a9467dd4-6551-4ef2-b231-02d7696e2d8f@nvidia.com>
 <DCDVN0P2EGAE.1W3K2ZB9D54FY@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DCDVN0P2EGAE.1W3K2ZB9D54FY@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 799f39b7-94dd-48df-78ef-08dde692ab2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG9FV0VMS3lWbjhWREhaeENzajBVNzdjWkhVcldPZHFUamZRaEczSW16RXJp?=
 =?utf-8?B?V3JTNFo4NFpuWllzTUg5ekdkYzF4K0E0bmNFUG1uU2oyblhldDkrTmQ3cW5k?=
 =?utf-8?B?ZHRSN090ZTkwbVZPa0lqTU9vaHFnOE5iVU1NM3pSMkZPc2VXVkdXb1N6Nk1T?=
 =?utf-8?B?Ly9JWTd1aEY4SG9QRVMxYWMzWkMwWjZOZkxXMytnZVJ4aldNdG14YzlaVERu?=
 =?utf-8?B?bnRmYzFvWlNCeEFJNkliZ0pWalFhVzFVRUtnSkE3TG95aURoNGV6dG44UlZ1?=
 =?utf-8?B?clZUT20wMHg3cHE3WXF6YVo2NEl1L0FJZHg2N1J5aW1YYjNDSUZwY2gvL1Rh?=
 =?utf-8?B?M3dlTjlkcFlSOS9jOHRteXcwaXZNMG02SUNnMFh1Z1BpaWNWMXRHK212L1lL?=
 =?utf-8?B?Rithd1FKc0JFVVFpNjc5a3lhYnhYKzEzZHVnczN2dGxHa2Y0SHR1d041WFdT?=
 =?utf-8?B?dTFOV0tVMTZTd1hSaC9ROU5mbFpEWDk0Z2Y2RTJDL01vRlRaNTFRVTdtaXhr?=
 =?utf-8?B?Y0lJNkJ5dUlyOTdDeFJwSDFneGZ2QWRjRUFOMDB5RXY2ckNpMVhBWGpnTFBN?=
 =?utf-8?B?NVRKdCswSkpjazN3ZjhYbXM1VDY3RnprRnBwYjVvSm1lUW52azBiNVdLTExn?=
 =?utf-8?B?eFFjNDZjY01mbTNCcFdYZjkzOUwvUjhVR1Q4SUNsWjhTSitHVG54VE1YajdH?=
 =?utf-8?B?L0VrTDFZQ3V5TXZzaEJhcDlUbG9IV25KRHRuVlQ1VmlSTmFWZFJoU012WVgz?=
 =?utf-8?B?QkFGejRObkU4ZkdTejFsdkdPVEI2ZTdQdkxad1I0TVluM3VTcDRoV1RKazJy?=
 =?utf-8?B?bDdMM3lRM2tzOS82OC9OVmRJR0kxb2lsTzhTUG4xWmNFb0VVQVBwSVFUOG9y?=
 =?utf-8?B?NThHZmFSWGt2Nm1CaE1HdXZhOSs4QlA5WVRtZzlIQXFVeFJsWktzdEdmUU1o?=
 =?utf-8?B?S2tFaS9CV2hLZE56b2FJYkdHNGpVY2RhTUtzY2RydWpsS0t3VkoxSU90WHgx?=
 =?utf-8?B?cE0wcitGSUhVMWp4eFo0eXVWSklrUXZMOFFROVg4YkRudkxDWWh2K2tPWndr?=
 =?utf-8?B?RDBQL29VbjVRYmdvdzhkeGxOSUdxS2NVUVA3TFFIL2VCZzA0VER1NkM5em56?=
 =?utf-8?B?YXJVc2IrZzlvQnh6TkMzM05ITDJyNFlVS2piaVFaRDZrWTNjR2EzUjNGNHdW?=
 =?utf-8?B?bWl0TC9sRTFpcVdQTWV4WFpqOG9PdUVVZ3lERWZWSUVPWlRCS3hWR2wzTCtK?=
 =?utf-8?B?ZVFEbkVvOUxWTWh6MkYwcEIzMWszUVkzeFFZR1MreUpmb25LZEpPT25vZ3Jk?=
 =?utf-8?B?RnZ6clVEZ041L2RjRDZJVmJJWm5RQlorNFB3RTc3SGlYcXVVQnp0T2FBTHVx?=
 =?utf-8?B?UCtVbVdqRkRRV1NrTXRMd1A2ZHVSVk8rZTV5dmtiUmJuY0ttbW5QNDdXVUx5?=
 =?utf-8?B?bmx0UW5uaXEwb1BCSTFSR2RTb1FnVGpvKzJXZ0Q5ZThaUXRHeTgxV25XWTI5?=
 =?utf-8?B?UTZvL3NOTG9iSm82elJpMVdrZXM0SU5QdkVCMzRvNis0dVlmRjlIdVpTVE5G?=
 =?utf-8?B?aFlrQ1Q4S3BxdHFmb2NhZlFOSjY0VHBDVWRNcDlBN1lOdG5pcGlzamV2NWl3?=
 =?utf-8?B?ajRhb1BCaGt1N2pPOXRHdmQzbWpCbjRicXF1a0Q5Qk9Fblhnb0pLWlVSZWsx?=
 =?utf-8?B?WDRVN3B0ZzNYc2JITjNKdlFlMXNtY0tDblJDZno5T0t4U0NLY1ViL0kxY0cy?=
 =?utf-8?B?d2J3ekY1ZTE2RDNHQU9KVmpQK2dQMlRxT05BTFp3RlA2bU9ORzlNN3BmQ1dz?=
 =?utf-8?B?bGN5T2RBQmc0OTNUSEVpZTI0dUdyRHBGVWVnNHhiTkNKU1o5NmRJbkZGcHBT?=
 =?utf-8?B?TXdGMTRCbDV2TnNWeUJMbFVBVUJqSUFyZzRQeVdyY3c0TTA5OXIzSXRxeGxp?=
 =?utf-8?B?M1pWZkE0THJ2MThLcDA5N0thWUxpbVhsZmJmbktTTzBVVWFteVlRVWhPMkZP?=
 =?utf-8?B?dC9LWFRVTStnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWt4ck52MjJXVE02dFY4NU1tNytpNW9MaGZlN3RNOUFCblFlOEppeUdSVGVE?=
 =?utf-8?B?OXAzUUdpQUxyVXlqRGQ5NXYwSWM5dFNTSFp4emxoL0RmaFhYekVIS2pzSzd2?=
 =?utf-8?B?T1B1ZmlxclJoMFpBaTNQN08zWjhGWmx2YVRyejF6Ky9XR2dlaEpWY25BMC8y?=
 =?utf-8?B?MHMxNjNVTGJhdTRhdk8veDJCVmVMTFhVeWVEQmFYSmo5TTJ3aXM3ZWNXblBi?=
 =?utf-8?B?TDNkQ291cVlxZ1c5dk1SNzRKTklwSDRCTXNxRklqRDBrUjRWbkdzNHRNZjl6?=
 =?utf-8?B?aktOaWxlRkJkMVA0L1k2QWd3OHhxSzRJTHh4Z0RTblIvK3o3WTdYaGh4SU9V?=
 =?utf-8?B?ZjUreXp2TTBtdjJENHgrVlA3emhxTXBYMmdSME4xRHhpQTM2bVhDOVk5WHo2?=
 =?utf-8?B?bTRicGpVMklBR25wTlNTekdzSERHZlpVMUYxOWlSWm4rNEpMOEt6VGEvODBX?=
 =?utf-8?B?Ri90eWk0dGRLamdTSFlBd01yaVVoanZER3d3d0M0cWNKYno5L3hvazdGMFFn?=
 =?utf-8?B?MjZsQkRRNFBkZHlzT0lhekxKNEwxZlFkMkFRcWtyV214SS9vK0M5aVJ6citU?=
 =?utf-8?B?ZDdxWGhrLzlyeG8yRnRuN25iNmQ1Y255SHorNDJRTi91TWtGSHN6d0o1T3ln?=
 =?utf-8?B?RmFEb0Q1a3BJcjVVTE80Q3NSektUbGhiRDlJUytGczdNeGkvbGxIemJtTkxQ?=
 =?utf-8?B?K2h5ZytkMmNGK2UyVGNKdUhtQTVOQS8zT1BmektCOEVMT0xMZXJxVVVka2lv?=
 =?utf-8?B?ZU9EZmNrZ3g2TlkvSHBIUzl3Q01kY1JvL3VSNE9oaVJHR2lxRyt4TWNzbE9n?=
 =?utf-8?B?d3cxVlU0ckV5cEtGdllvdS9RQm5oa2RJQytGSTNhMDVDWTBOY0VOK3lIeFlY?=
 =?utf-8?B?S08rQTk2Y3o3U3JFYWJ6b1VVSERvelZVbHExb1pzTTIyZDN0V1hyNHQ3MWFj?=
 =?utf-8?B?ejd3SDJWcWZxSHhvUmQweVF0ZG1sb0QxT01aZDEyNUJRaFNyR1ppYWEwTFNF?=
 =?utf-8?B?WGwxVjBtMGNtQmI4Y2F4RWk1OEgxWHdDSkJMT09aOUc1UnBkbVZnaWs3MnFo?=
 =?utf-8?B?djZhUHhueVhHQ0ErM0Rsckk0VE9hK3lDYU1sd2tpdk5HZzdWaXZ5enVpYXRR?=
 =?utf-8?B?eC93aEJGMjJLL2hNTmNCS2diNGFmSFlRc0lCeFplS0NIcjVZQ1hjZHorVUFt?=
 =?utf-8?B?WHAyNFAvVmZvajEvN25WUExSck9uNjRTeGd3WTc3cXRkNDhJY3lVTXFUSk85?=
 =?utf-8?B?Q3p4OGNZMVBDdXFRSExVdzVlcVF6MHU0dS9YT1pvWXN4WjJ0Rk5lOHZ4M0Qy?=
 =?utf-8?B?RXVGWjgwenVrTGpBWXZBZFdHZmRZSTloMGhhTHdqTUlqQmptZ2xDRUZ3VWNo?=
 =?utf-8?B?eEpTNk0xMm1aRXo1VXNSMzdFZ2c2WCtCb2I2Q1N4OEF2UUlSUFZEeUdNbW1N?=
 =?utf-8?B?WkUxK09BbVZmRk9WZGFoNzV6V2JrT2ROcWJiQ0NOMm9Fd3NHejcySVg3d3lJ?=
 =?utf-8?B?Z1E5Y3BzNStEbjZwa1FaL3dBNUVTWlFHdE1ONHZQMWVyTEh5Q3NQdHV5dFgr?=
 =?utf-8?B?a3dHZmFiSGN2VlFWM04vYnI2d2RweUNFYjNsN2dadHNva0ViRHd0VXZmVHBw?=
 =?utf-8?B?bVJuWGRjZzNJSWd0VlRiVkpqcTJWKzE4M25WSHpUZUR6M0JiOWlmTVhXbDRk?=
 =?utf-8?B?RmF4NUpUemYvdlhVSkNscUZKc1o1bTZpTHpFR2s5VlRjMmJqZXlhZWZpS25l?=
 =?utf-8?B?S3RUTG9qRjJtZEtXQ1FpKzU5Rjk5WU13b1hHYVIxb2JFQStwN0ZMbVFUUVpU?=
 =?utf-8?B?cFdZMXVkL2hzcUJpR0xWQlFRbDNYcTBiUGZ3Q1B1SjZRTnd4Q1QxK1MzM3NG?=
 =?utf-8?B?MncwNlFESldvMlg0VFBRT1lmUTNMY3ZzMjIzdlVyR1JJS1dNMkovUnVJdjJp?=
 =?utf-8?B?a3d1d1dldXA3Y2tIckwwWUFrMnI3YkpLYitucHJPTnFLbDIxZ09rRFByamda?=
 =?utf-8?B?M0IrWUZ1TnNnalBhTlFjdEdQNStFbGQxV1pIc08vQ0Z1S2Y5eVRvejh4NDVZ?=
 =?utf-8?B?TDhVM3pMQk1XbFgyMlpCTlhOdFVQU1hRdkRFZ3B0SngxQ3RVRDd6SnRsTHpR?=
 =?utf-8?Q?7FPc9SUW0WgcQTqugVZ9XOVF2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799f39b7-94dd-48df-78ef-08dde692ab2f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:26:16.9940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WCHJtkJK7ugo498p9LpSoO63qpy461snCFo4dMm+RnDwWhSKEBwtHU1XgIHEyuk27eAVPfIWu66E51t8PIyFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
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

On 8/28/25 12:19 AM, Alexandre Courbot wrote:
> On Wed Aug 27, 2025 at 11:29 AM JST, John Hubbard wrote:
>> On 8/25/25 9:07 PM, Alexandre Courbot wrote:
>> ...
>>> +        let ucode_signed = {
>>
>> This ucode_signed variable is misnamed...
>>
>>> +            let mut signatures = hs_fw.signatures_iter()?.peekable();
>>> +
>>> +            if signatures.peek().is_none() {
>>> +                // If there are no signatures, then the firmware is unsigned.
>>> +                ucode.no_patch_signature()
>>
>> ...as we can see here. :)
> 
> Technically it is of type `FirmwareDmaObject<Signed>` even if we take to
> last branch. The name is to confirm that we have taken care of the
> signature step (even if it is unneeded). Not sure what would be a better
> name for this.

So the <Signed> parameter naming is also awkward, because it refers
to non-signed firmware too, I see. So we need to rename both.

Ideas:

a) ucode_maybe_signed, FirmwareDmaObject<MaybeSigned>

b) ucode_validated, FirmwareDmaObject<Validated>

...
>> Could we do something a little more obvious instead? Sort of like this:
>>
>> impl BooterFirmware {
>>     pub(crate) fn dma_object(&self) -> &DmaObject {
>>         &self.ucode.0
>>     }
>> }
> 
> `Deref<Target = DmaObject>` is a requirement of `FalconFirmware`. That
> being said, we could turn that into a `dma_object` method of
> `FalconFirmware`, which might be a bit clearer about the intent...

That does seem clearer to me.

thanks,
-- 
John Hubbard

