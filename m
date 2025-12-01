Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FEBC98F51
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 21:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD0510E47F;
	Mon,  1 Dec 2025 20:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eqAV+6/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013045.outbound.protection.outlook.com
 [40.93.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E5210E47F;
 Mon,  1 Dec 2025 20:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdTIPh1igR13ukDMJ1X8FOlt7+ffbiHKLngkykvhZAMJs1ZF6IJLgsp3NiaEG/OYjU7q8z6eAX1/BEMYgBrQN5eEMTuGyVqkUSCK77ZFlLTJFo9A71PSJMKKidUMJLYCNNxJt9JRPPUtKAiNzqgYmCi5y50nJYxr++4Sf1Cr7SOTR2Qg8E1gHSXzPsW3uhAohuO16r1IQ7rToBTtgWfMIcL0AjrSgUtSx6GqnEl5UXkiBwNmJeCkzazOHcDXtnHaMv5bXjvPx4HmkUjkP6j4MLR5bzP0M5r2X3EQz/4GvTpg3SU5q3ZI9D7x91w0b1tAtuXw9Oq2w+7Wf4RbyukE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvo3023VUOB6eB4ThVtbl8leUF1Mo1D+skqLkF8a2Nc=;
 b=SoRXE/HRc0z8O+dl2R4zprDipcDs0TwlV1E49mjlBecIs1lrq7rQxRFLPWBlEZ1rjrejQEsMjIhy4BMg1P9v935om12V+VcUE7Or6v/SslrqN0aQjyY4/ZsCOaCZisQ0OFcSeLob4af8UDWWntHnNvxU78Dp2+9MnZW/4LcTO//sBfmbGRm9KP81Bv2yeUFJiA7H80VnKiKXsRskgwsIQxPH4As3g0waLfYt+4Bx0459wXKeTByskLFtILfKuqAPxuPMchIdZ3QkS0XXaGrfxt8yCb4ZAab4HaEQ/I1FuWpAZR+qJmU3S0wxvvu3rNhYOeE5j7rtmApuZ2vk9SJy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvo3023VUOB6eB4ThVtbl8leUF1Mo1D+skqLkF8a2Nc=;
 b=eqAV+6/AeQe4o6WdOrvFM8kW/7WTIqFzVb3hnDkkOxin1L7E4HJCuhwPwaqa6L4JQH2PN2Lnw4PcZkSXW9RPz90+bex4QxkIBGd6YFjYmQAC1E++HA3VD/Y0fqrwht/PfdznaJCLNredgwMWIwvkcc3F58CX3ndWwspyy8QXdHLD0L/3SazMiB/Fij+9QUmeOxULP9wbkzIt0rI4XDvHhmGTYwm9nw0pXD5DuPy7W30QzYvbRDwf7bl49U6fk2rpL2hMFDgx9TidjOnMTsaicmzEQjdezU2fhh6JzotxKiZg1LXYjARFdt7EH6gPK8ougHzZk3EPpNYFqHDsc+zEFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:06:31 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:06:31 +0000
Message-ID: <1933c83d-7692-431b-b2b8-9c9a637ebed2@nvidia.com>
Date: Mon, 1 Dec 2025 15:06:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: John Hubbard <jhubbard@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
 <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR02CA0052.namprd02.prod.outlook.com
 (2603:10b6:408:e5::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: b455e152-a5db-4915-f6a8-08de31151eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUxmckZ5UG9HSFhicGoxME10dnZERE9FbHZBS2xaQ0cyUENMenNwbGJkRzBq?=
 =?utf-8?B?ZzlWOHpIMnBBOVJWeTlmZGFTSFlmeW9PdUg1b2hvbkU0ZGpNaCtGUW5Gd1pJ?=
 =?utf-8?B?Q010eTN0L3dWUjVJNzBaa3loYUVMcWJzV05nb3hXVVk3ajQ1SkplTDhGYXlW?=
 =?utf-8?B?ZnpCaU00Z0JEMjFaT3lTdFh2MkQ1Sko5SUgxTUlFZFJ1cG12Z3hRUkd6U2I5?=
 =?utf-8?B?YUdZcncwWEU0a2l3VzVRb3lqV0N1YkhicEliSm9iMHZ6Z0hIY3M2dHBmOXlk?=
 =?utf-8?B?cXNGOUp4V1BnbVdHQjhGYjJ5UzdUalZsQmo3ZWVCYklBU0hQSktjamFEdk91?=
 =?utf-8?B?dGI1NkhOT0ZWSHExRTdCZ25mT0p5Q1A0ZkR4TnVzRWwvbTFwbGhZNlF0N3pZ?=
 =?utf-8?B?UWhOWk5ETG1RUjBKdjZ4TUFHV1BETFVyc2RqSFE4dzloNy9paGlJWis3RGtq?=
 =?utf-8?B?SmYzM1hCQnlWUVlTRnFTcXFEeTh5NzFKdWRCdnVMUlYyZzFrMUsybTNqTUJH?=
 =?utf-8?B?Q2M1SmQ3ZVdRRis4RVduWFMrY2VqbGdWTUdWcWdRS2ZMS1VkVkc5eUQ2ZWM5?=
 =?utf-8?B?ZXFmSjE1TG1nN0IrM1RHWDFLMEtzaWVqRVRCNzBYUzgrQmZYbmluT0x2a2NP?=
 =?utf-8?B?cW40UkhiYXF3aGp1OFhJRXBzK2VWSFYxRlJGaFg1c25wVi9NNldxRnphZ0ow?=
 =?utf-8?B?WXlWa0w3RWRieU1QVENMWEtrcUN5VkZYSHpOWWc0SmhZVGlncGtQQlR0MmlR?=
 =?utf-8?B?SnJKc1FpR3Y4Mkc4QWNSbnU4bnFtalZhdHBjL2lVM1cwclRHMk05YmZJZlht?=
 =?utf-8?B?Y2NlcmxOZnJSMzRaS0g4c0ZWUWE4SGk3S2lVR0l3YWgyQXpCMkhKTkIxTDVx?=
 =?utf-8?B?U0RxVUZXamlNRTgrYUpiZlhtcGFKZzQ3SVFzSzZnTUxMMEtDamtyOXhYN016?=
 =?utf-8?B?SWVPMlUxbHhTaTlZMXFlTWMxTU1OckJBNXRoWEUzQm90cWNaSkd4b0ZRSGVW?=
 =?utf-8?B?TWJtL3dlN0syZFk1Um5MelNLL2tiaUtBTzd1bzgxRkNabmhjMXVZdEJWei9u?=
 =?utf-8?B?WTFjMXlSNkV1enpIK0pMZnpUOUpRdHJBUVVqS1E5NzI5Ry9rZHpiRFZzeFA0?=
 =?utf-8?B?Z0FyVDRZd1U0bXhkTUV1VFlmQkJ2WUc3K2cxZktJMHE3QUYwSkd6dW01anBQ?=
 =?utf-8?B?U3JmU0prd3VtN0V2OHJwV3c2UFY5UnhDV2dybVArQlM3YnZnVUYwUUI0QXo5?=
 =?utf-8?B?OGFRdkFtRytLYjA5Tm8waENjem5lZnBwMmdoMmpDeXJlSXo0NmxFdUpKc0Rp?=
 =?utf-8?B?NHZvQzVOWSsydCtLcTlybHQ0ME9MaGhNSWZ1a3ZZYlhKT3gyQloyNHVNRzZP?=
 =?utf-8?B?UTRJUCs5cG1lUXFscjJsNStkdUZTZkZJc2xqVXhESTFMcHJOMlU4aWY0RjdT?=
 =?utf-8?B?ajczYkZkTXhaTkJpdzhBdzBPWkYreW9ZekpuT2dCYWVBREJRbGY4SnpNek03?=
 =?utf-8?B?SzhuUU5laEF1K0hEQ1dXaFRqZUpWMW9BL2NKRldUdHBhUE04K2VaZHdpRHRN?=
 =?utf-8?B?cEI2eWFiVFJVUEUrWnhFSjV2YXdvRVFKeEtkakp1c0dXWFEvZlg1dk1wRkp1?=
 =?utf-8?B?VWJpUU1iN3lSeC9yNDVRWlhpRGVUemxTcnN6U3V2N1lTVWprSXUzQzMrbHQw?=
 =?utf-8?B?MFc2N1plZWVwNUUzMDhpU2Qydkpoc0h4bjRTNXhhQUxXS0M3ZGgremkvMUh4?=
 =?utf-8?B?UnlBUHhLQW9pLzQvMndBZXdoeTFuSlNDY0RKTmRUQjRXeE5kQmVJOWVFdHAv?=
 =?utf-8?B?OHQ2TzJLK3IxOFhnS0puRXN0T1U5eTFvN2psZzFVWTQ1Rzl3dVU1Y0EvRHFs?=
 =?utf-8?B?QlVHaUpuTWVXZEc4Nkh0T0dsMHRXc2ZLTDZHODBwbU4zVE0vNDYvUkErcW1Z?=
 =?utf-8?Q?hroJKCHIKNKVyKh0W6yVEpqu4NnRIgie?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3Z2b3NOVWc1NjBoVExYZDBHeFdLMVB5V3cvU0p4MFlTWTFCd0taUnNXWVRz?=
 =?utf-8?B?TGtnb05lbU1YZEFYcjA0cVNDRDNoNXo4NDVRQzBTUCtsL09nY3BBQUlLR0ZK?=
 =?utf-8?B?U0tmUGpEbGNLaEF6MFRBWUVRQkxyVnJMRVA0NVlNUVg0T0VvYTRPZEtPTHVu?=
 =?utf-8?B?UFp6NGZ1ejBsWDBnOHp3Vjg4amNsNjBGZkN0MzUrK2htU0ROZGlrbHJoSjho?=
 =?utf-8?B?Tk1FNjh1aW5NU3FPcEZnR21idzBiclZob2ttdzhCcmVBV2NtRUJVMGFnWm9Z?=
 =?utf-8?B?YktFYlljeEsvcmVkTEM5dEZzWEJhY2FyVk1QcXRHUmNoc252VFp5M3Y1OUdV?=
 =?utf-8?B?MGVWYWVEZTRPbEZHL1p1MWU5VS85R0U0SFU3bzhYVExLYXBwcEcvN3o4Z2RI?=
 =?utf-8?B?UTVLR3Rhek9MQlFBM0pnWG00VHdzSTh6Mzc4cS9SOXF4dkU4ajc0UjEzTGc5?=
 =?utf-8?B?d3ZMWTZ3Smo5VzRRZFd5VjZlNjVVWU1nMThsY3F3cGNLdnJydjltd2YxWkI1?=
 =?utf-8?B?clg1YXdudWp5a2hNZkRRSWxxYUlVcHRPQVNvSGE0STI5aUpadEQwSWJVdzcz?=
 =?utf-8?B?MldFYWdhb3FoUHZuR281aHh0bHowSXR5MllHMkFZaTR1aFZzVmJnMWR5ZStP?=
 =?utf-8?B?NS8zQjF1U3owUktWUHZrZmhsNVY2ZGc2TzRVczdtYlJxS28zSm5uZTd5djE2?=
 =?utf-8?B?c04waVQ5a2toUzlmV25LcnI5ZklaTzdQOE1MQk9yYXZ0TEh3SG45QUczaEg0?=
 =?utf-8?B?ejFqQWVyVXVDWDVLVEdvcXNBeCtSclpNbkpaelpWWmdzdHNtQkozWDVwZE8r?=
 =?utf-8?B?eG12VllUVkxtWm1ma3k1Ry9JTmp0Qi8zMVhTZ1B0dnlWS0p5K29odlpuTlky?=
 =?utf-8?B?NGI0UmIya0F4VW9rOEhqM3ErUEhseUhjeG1xb3V1NWVkRGYvdFc5OWsrd09j?=
 =?utf-8?B?S0RGSndoYXAwZU9lZXovUG92VGJMMmQraDVuR3NMSTloZk55bkpkY3NvS04x?=
 =?utf-8?B?dC9SSStRQkJRMHQyZnc3WW81L0FmNTJJK3Irc1FsTzJnN0FWQTJZVzJBdE9q?=
 =?utf-8?B?cW1RNXA3d0N6WEVDMlZlN0tUbmtjeVBqVWhnaTloNGN3TWdKUHQ5TlVrU1J3?=
 =?utf-8?B?NFppK05hT0hzQTlaNUR2ekd2NWJ4Vk1xVXpNVGxDQllTQjM2Yk51cVlST0Qw?=
 =?utf-8?B?b2xSdUpjNHNZQm9ndENFUkxmZDlKTjR3ZlN0MnZGUHp4OFVONHRLQm5UTG8z?=
 =?utf-8?B?ekJiUTFwVTl3N3hnOVF5M2tkdjdVcU85bzFuNU5sRUhnUmRtaU5RNU5SREhn?=
 =?utf-8?B?ekRBaCs5dTg4c29CaWpTNGdNWjR4T1BSWXBDVXFpQ2hCR2p5YmI0SnltSm4r?=
 =?utf-8?B?Z1RDVnpDNytsLy9UeDFwRjZpakFrSWR0YlZFbnIxekpDOXNQbHhVV3FtdUlF?=
 =?utf-8?B?dkxXNy9BckVwZHh5VmhWb0x0OWdUK2NHbmlMeGE4eUtIdzBnTytYSDMxekNo?=
 =?utf-8?B?Y2RocFhMdjR0bmMwSS8wR2h2bmZwRXhXb2RreGQrTjhScUUwZUFRSjlIWWxn?=
 =?utf-8?B?QmtOby9MdUlsRmVtL3ZleUxBWmIzRjNLUFhkZDQvU1pQS1lLLyticWVqWjFD?=
 =?utf-8?B?WEtkZXZvVzBlcVlObG5UM3RzNW8xWXJwc29Ob3lwOXBEa21GaENlcmVQdGZV?=
 =?utf-8?B?NER2RzBmc0NZZm1OOGxZaEIzYlB5R2JYRmlZeld6N0RmVVhvT2U5TnlrR0w0?=
 =?utf-8?B?YU5sNHdXMCtYc2NhbThQUHlSRm9zdGE4azRYbTNkcDBTT3ZQSWVLYXJXcWs3?=
 =?utf-8?B?NGZ0MUpsNWh4N2p2dXRYREVZU1VtbndGV3ZSdnRwSE5iK0JsQzhxSC9VUnEy?=
 =?utf-8?B?N3QyYlZlSkVaRkR5WEt6OC81cjRUVVN6bmNsbWNxVVV1WTEwUFNPZ1dCWDBD?=
 =?utf-8?B?R2grQnNPU1c5WFNHUUE2aVdBdDcrYm9yaFFxUEV5MG5vbDNocVhXZitsZDR6?=
 =?utf-8?B?SlFlN2srb1JWZFA0aHAxQ09BVVNlZHczbS9lWUVDRkk5QW40NWw2Vm5hYUdp?=
 =?utf-8?B?NG03bExXUnB5Wlc4a2RkK1VnSm5jdGxLUWZwUnFhb2tOM0ZLYnNNVC9ib3pi?=
 =?utf-8?Q?l9JUqzu5w164NOeDytkjVBh4d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b455e152-a5db-4915-f6a8-08de31151eb7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 20:06:31.5287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPGIx8UGWAI1kufX5VnSh+vdP4RyT1ZCvHSqW5+ntSKy6fKZPitoO2zkY92pwYKtcsH/zsZyTGnoUOKI+Rjkig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
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



On 12/1/2025 2:35 PM, John Hubbard wrote:
> On 12/1/25 8:51 AM, Daniel Almeida wrote:
>>> On 29 Nov 2025, at 18:30, Joel Fernandes <joelagnelf@nvidia.com> wrote:
> ...
>>> +#[repr(transparent)]
>>> +pub struct ClistHead(Opaque<bindings::list_head>);
>>
>> I still think we should call this CList. IMHO, it does not make sense to have a
> 
> I am guessing you meant to place this comment after Clist, rather than here
> (after ClistHead)? Otherwise I don't know what you are actually suggesting?
> 
>> Clist, and a ClistHead (notice the capitalization). CList and CListHead are
>> easier to read and reason about.
>>
>> Did anyone push back on this?
>  
> If you are simply recommending renaming:
>     Clist     --> CList
>     ClistHead --> CListHead
> 
> ...then I'd say "+1" for that suggestion.

I am not fond of the suggestion but I don't oppose it either. I honestly don't
like the triple capitalization with CListHead though. Lets see where all of us
stand and then take a call on it. Opinions?

Thanks.

