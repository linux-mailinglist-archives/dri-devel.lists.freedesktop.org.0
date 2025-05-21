Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B66ABEC32
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8943E10E670;
	Wed, 21 May 2025 06:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AcTH6N1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0263310E673;
 Wed, 21 May 2025 06:45:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvDxINnf8vufhohH2kzEXyOQNNRlZ9mwj9wSfuSRqef6uzijJS4GT3D3vgCYPz/BFRT5NoiN6qB/Jj0h0Nq5prtKx/ukM+wWBZlJbdE99XO9nZl8D2XJQkV/b2OShrvrwnKFs44oqTk3C5GXMiyFLyIOPik57QFrbC6pw8O64gDDxfDkF1t6lHE2jl9r5AJmk8MzejUPc+TmQw2o+AQcIW2w0Sh/hgpOuuOhCXtSXaJcUpgx6abjUYQx9Gp8WkjKli+0XjEP/gFtc6sr6HOutet1CtKamx36xYnYckaLU5hu4knS8t4RvYAEeAR/YSPYZuVWcS0SaIwGZ5B6AaZo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGPymOr+eivE7Y2p9+Q1NvQ7rzcqpinDIrNP26EBo14=;
 b=rECBen8i8P7t/1212q8Ik9Qy677pbYhyHD/SqKzYT+iqRALrAcNM/v8eIWVvCrtw4wf7uSsjYIW7l8J+jb7da1Sw830Vv4n/3vMHwsWUZ97xAdPxHRVY05QcYdjtPvxR04tno+eEW1hVnvdVHUPlOfslpfkTFcQYpAr1w/d59XjpmKQd8yWlhpTQ1wgckRCPJ7YWHST5YwnDgDIZb6I6UOsmpKS1I+uu7+CXz4R8duWKtLBZMsmr+whRLaW3zn1oygMJgW6NoWNL0KryuRCOXpt2swU7Lw2r+tr0NXLWpard7di24AQERwrTwwrGNfVLb8TXea6YBh8ehM1CRAuznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGPymOr+eivE7Y2p9+Q1NvQ7rzcqpinDIrNP26EBo14=;
 b=AcTH6N1NAKRwzYUOR7a6wRMuEgEYM8totthUIacNs/QMw8ebFW7ZF4W/iY+8NqR3mPbcYw5K9o1Y7qGuFUv8o+qtdfLxmSk0kzuhZNw7pTCGQaIEkZXQguqgS93FltkJAPlEcqOK1YguOjGpmOX2zDpknDAZV1WiqqeCegygDF2rQqBvrhvvf5xPEQzrZE6kT4+4cFATDm4d93TttAsh1/r2kT1JYz7z33TWHMFlH9Stlv2kheoyF/AlU3ypUdLhYLVxP+VZjsh+NhwrODoY7XzaD7uwMPbIVjyBRN0YPIsEaTuLUgD3HIT39QykVHQZ91CO4AeLeCoozJ8SeMN7xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:07 +0900
Subject: [PATCH v4 12/20] gpu: nova-core: add DMA object struct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-12-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0087.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::27) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8139ec-c783-4dbe-9a99-08dd98331deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnpKckNPdlE2aFFpSC9hRXFCSUMrWXdIRDF0L0lKQ2ZjSndZeEJoUldNeC9G?=
 =?utf-8?B?MmxHcmpZNmdEanhiWURlL2U5K08xMjVLM0NsN29FSldYTktHS044K2FDcHpa?=
 =?utf-8?B?bHd1WGY3a3dJL0dUWGNiVzNLbSttT3dUOHp0NkpkRVlOMEErWjU4WFVZTWpo?=
 =?utf-8?B?QzI1OFY4UHRTUWV2L3ZjeW9yQkRpTlMwTmFqV0JnMXhLS0YreXNRNU1EczRs?=
 =?utf-8?B?NDlVTCtIdWpMQ1NUYTBJKzVISUszeWNDbWYxeWhCdHM4WWVLT2dZOUFMTGg2?=
 =?utf-8?B?eEZmUE1vTm9oOUVaSkduSTlPV1lic0xaMktBOEdFQU9FaElIYkp4OGJKdi9y?=
 =?utf-8?B?aHFUWmxjZlNFSnViek9ObHdlcnF5ZWxyeXBka1h3L3FyMHZkLzF4LzNXOHNh?=
 =?utf-8?B?U2dZTHdMUG93dGdtVWVXd29XbDlKY2JnUGZzN0NqRzFCQnkzRGhoSjg2ZTFL?=
 =?utf-8?B?T3hDTGxzbTdtcnpGVDdvTnNsOTBiWXBUQ0tEajJ4TnFiVGh5cUJ6TzNkRS9o?=
 =?utf-8?B?OHlYTEdKWG1tSis0ZHJlRTdZUXdJWGU5QmhkcWV1eWpwNGQ5emlTb0lrend6?=
 =?utf-8?B?YTVhTTJQWDdJMWE2cFE4MDk4bThialF1UTF2VlE4QnFUL3hZZXpRRXp4bHBa?=
 =?utf-8?B?ZXB2R2wreXNEWE1sM0t3SVkzRjNKdHNCWVpLWUI5K2hWR0NvTUc5OVIwWExj?=
 =?utf-8?B?alpNR0MwTUFPWGp0RTFteWg5SmVQVFRsRzA5RUFwMUhGVXdlTDV4RVpqRU9r?=
 =?utf-8?B?VjRhNnFVVVJTRThsbmR3MW5QK3ZRT0dIZi9CQWQ2Z3gyWCtoN0J4a2srKzRZ?=
 =?utf-8?B?TDlMaVliMGZkS0RFYUdlb0dId1BoTnYwTlU1NVZrTlliVTA2QlV6MzhQcUZs?=
 =?utf-8?B?bm4yUEdDSUFsMS9YTlVhaFI5aStyS0VDb05mT3pUVXkvWTVuYTIxaTVxNDMw?=
 =?utf-8?B?QVEyc0h1Q2haYjgxSjJ0NjlTNjRDWm5zMG9VN1pKb2daalE2aGgzYWVMT3Zv?=
 =?utf-8?B?TmN2NSs2cnNHYVNmQzlSaEIzaHlYdDlUcFdoZEYvd08wb2pQWmxvSFJQZitV?=
 =?utf-8?B?RnZ5LzF6QWIyenJxUm8xV2FveEI0N09ncWlHYWpjYW9VMEdFdTY4LzB1ZW9M?=
 =?utf-8?B?RjR3M0RpdEROQWpvb3paVlVveGNqMm5kcTVrbjZrK1N6dFJZTHlWd0VjK3dp?=
 =?utf-8?B?MzJvb0p1S09FMXNnd0MydnZvN29CMmxNZmsvRTYrY0orSlpMbWUvbDJ0RHRp?=
 =?utf-8?B?ZnRWN2RiMHRLMGRMWS9veFFFRmF2aXdMM1FVWmNlOFFYVG1NMjVnQTM3Smlk?=
 =?utf-8?B?ZDJXQXFUOE9Ua2w0aWplSGthT3lKamdQRlRsN3FZdndaWTRsZlNuNEVRdEZq?=
 =?utf-8?B?aWVZSkV4ai9IYktDSWlZdkZjcldnTlFndGhKczJJVkowMzlELzJGN2xnWnRJ?=
 =?utf-8?B?WDgrS0NRSDRya1phOFBCa1IyaFdsZmwzbGw3UHR1THc1aEZKaUFJNC9jVjhV?=
 =?utf-8?B?ZlhSNXVLMHdNaE1QQ05XTXNyZVBtbjF1ekRkWW12cEhHNnd6TU1iVVg3QUk2?=
 =?utf-8?B?Q3IxaGVEODJ6RklmWHdmSFZ3MEw5ZzNNME1aK3hiMkkxckpKRDBYdGpKRFRY?=
 =?utf-8?B?SDlQWU1tQUJ2R094WktjaXd0S2pDaWRKOUVVZmczbHRLeWh3MGd0OWltNFpm?=
 =?utf-8?B?bnNVRW9IeHdqa1gwcHF4K3A4YVI3clZvNUdCNld4SE9TdkVNMFV5d1JRR0Q3?=
 =?utf-8?B?SCtpcXNhb2RqSWNCQnAzdmx4bVVtWkoxQWRvNnBqakNKRUM5YkJaaDgyVkJu?=
 =?utf-8?B?R0hwZzZOWERuSWNqWTc0TE9tMGdZUDVkaHo5L1lreVFwUXh0RU9YVnUza2s4?=
 =?utf-8?B?UHBReVpOUmc5dVN6UTVza0VWNE96TGlCWlRRTUpHRlRHa0IxcXo2VXFGNDZQ?=
 =?utf-8?B?dXJUdEZFaDBwKzFHMDFIZE1BblJtd1RzWEJXeS9lS2F2Wjk3dncvK29jWUlD?=
 =?utf-8?B?dGlla3E3ZnZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlA4U1JsNW9rdkhwMFlmMWJoNWZMN2VUUlRUUFhUc1JNWENudytNUTBTVmhx?=
 =?utf-8?B?SWNmcWZyQ3dhU2lnNEppa0k4R2djUkxGVkpqVCtzTEhMYjRIYVBsWHBjbyt5?=
 =?utf-8?B?aEkzRWo3bHV4Rk9VZ0hwMHc5UEVNYm4xWXNhb0w1SGdjb2p3Z3RIenVTRjdE?=
 =?utf-8?B?N2tSYnZQMlVpRHV6TnQzQ1J2NWsxL0JLUDYzZGFLUDRFM2wvWktwVllFSktO?=
 =?utf-8?B?dllXNjFjdWZBSTdSS2tMaFJ4WnMyVS9ZaW9zOHEyTWRLbXh0b1RXalk2dThE?=
 =?utf-8?B?Yk5md2Z1ZWVhOGxHOWxSQnNSUzN1bWhhL3NQbDhKS2xTZm9uZUkrZ3ZqL25x?=
 =?utf-8?B?Mk5CU1RCRUVsbFhCNENnVWtnaWFNZXp4YUl4QXJiVTU4UEFSQ3YxSlcyL043?=
 =?utf-8?B?dWVUaVMwMWozWW1PSjFMQm5kVktEd214ZEF4Y3Axb2RWdXN1UEh2clJGNjQ5?=
 =?utf-8?B?d3huQXVDajF5WVc1cmlHTjdyYnN1dWxhWkZISUNlSWE1VW5tVFlhK3FhM05O?=
 =?utf-8?B?V1ovNUZKZkFKN2RPcUd6WWI2M0VCQjd2UUlITWJOejM5VXpPU1dDVldIQW1l?=
 =?utf-8?B?ZFJ6OThCSnBhQ1lTUUNWYkxwWXMyU0RlK1RNRldXQlFkaU41a3RCVWpxU2Jx?=
 =?utf-8?B?ZWtJS29MdHNRSm04Z0IrYWVYOWZEelRvcEF0Rnd1Q1FkWEw5RitmZXhMbVFh?=
 =?utf-8?B?czBSUC9MdVdmZTFxWWdvclpXOHNCWTB6NExNUzcvcFFBSzdLbUtGRXV1YUJX?=
 =?utf-8?B?M3RqT0RNeHpQMnM0YmVqeHR0ZzNYRUdGQzlrN2pnY3ZYdEg1dDNzbGZ6Wkcr?=
 =?utf-8?B?ZGNzV3NnZXpPekRYYXlqcWtBQmFaVTYwZERxQTVtVU5jRkplMndadWNNWVR4?=
 =?utf-8?B?dzc5TlpFMzdHWmt3VjRUSmpMV0xmZFlEdkoxR29md1JCem5ZYXZsMEZiUHBy?=
 =?utf-8?B?OHZwRWQvTGJhWTBMcGV0bnhRaXlkRVdpMHJhK2kzZHNYbXliQ080SkRzQXVn?=
 =?utf-8?B?TE1ZbmY1T3paWTBPQlhsVmNDaWFOTW1BVTBhYjBtTVZ1c0t0NGVya1ZBRmVW?=
 =?utf-8?B?OHZxVk9OV3kxL3NnS1RvemJlRzd2VDFra1RLUWIzUXdjYWFyMDJNTkloa3Jw?=
 =?utf-8?B?cUdHcUp1TkorcXBmeXU0YWg4anQzanpWWVVNcktONFhUSmpjeC9KdTlDcyt5?=
 =?utf-8?B?THdYYW1mQ0p4dWZzRFNqd3Jua1g1SGNVdkJ5MkhIVGtjU2Y5UmcyMWFyQzVn?=
 =?utf-8?B?M2kydW1nMkdCNWI1a0pwd2ZpcE1kMzc1RzRqVGJQdGMyWENBVDBYbjV0dDdC?=
 =?utf-8?B?KzlMRFE2enJLY21majJRbjdmdU9JTURxUDhGaC95dUMrVkN3Y2tySmVsN08z?=
 =?utf-8?B?MERZWFlaeENudVBISkZkNGhSTitKdk4vWFAxRzNnYXB2QWpjT3V0UjdLOUN6?=
 =?utf-8?B?dHlYS1RhSjNocDd5V0VWS1RsWkxOMzhNRUdJRURocEpLc2RkbEJpbkdXY3hF?=
 =?utf-8?B?TjI4akFkZE1ydzJPRlR3cVliRDRnWmd1bUk4SXVYbzczN3NqTXdLY2pITERj?=
 =?utf-8?B?MDRNQjBkL0U4SE1KdVZWTFExbFNVQ1VzaDdzbFpnbXN4T1NzN0E2QXFTMnBi?=
 =?utf-8?B?eXNhVzVwczMvNnljckx1emdTTEtGNWJ1aEMxMFlTL1J0SXpHcit2QWtVemsx?=
 =?utf-8?B?N0t0ZkNvZ0R6SlBRVk9GSXNCWGkxN29BWitEcU9YM1dvNFpGMmV4US81WXRo?=
 =?utf-8?B?cUJ6RUlJTGxIUjhTU21UTDdoS2pBcTFjQW56N0tPOVk5L2R6ano0elAza3pa?=
 =?utf-8?B?c0VpNjlkVXhIRURlSkpTM1dYQnVsbTJYRzd0Zjd6V2x2ak55enMvNENJckl4?=
 =?utf-8?B?cFhXUTZjaXBQb3pZbTJjTHlBZitVSGhqSUo3akhUSkhTUi9JRElDWUhycnZW?=
 =?utf-8?B?UkpHTW8wS21Vck1zdmhmeStuSWpBc1VLcitMNHRFeXR6WW1uM1ZzZGlRRi9O?=
 =?utf-8?B?UzV3ZFk4RUpLWUFXQTE3T1ZyYjdBOVVwZXFRQ0hER2hKSXpzNzhFRXJKRXhB?=
 =?utf-8?B?aTM1Z2RSZVZiZkRRSDdTSTBBcStSMXNjaFducFNxZUlObzAvVGlEZXV1UVAw?=
 =?utf-8?B?YlJuaGc3OG1ZNlR3SmxNRUJEZ0gybnh2eThvY0ZKSzVIUXJLQVBaWFZjUEto?=
 =?utf-8?Q?YeOOzuZ0AVQ35eVQpvGM8zGwplP028HMa642ND+zAKR0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8139ec-c783-4dbe-9a99-08dd98331deb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:47.0504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+ij7fYIB6Rq1ScEi0fbGf2QqKdhcMmHOo1UO23S8ShD78nScahNT4ujnLXAFJAnwxN6ATszMq+47qT0K/YmzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Since we will need to allocate lots of distinct memory chunks to be
shared between GPU and CPU, introduce a type dedicated to that. It is a
light wrapper around CoherentAllocation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs       | 61 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
new file mode 100644
index 0000000000000000000000000000000000000000..4b063aaef65ec4e2f476fc5ce9dc25341b6660ca
--- /dev/null
+++ b/drivers/gpu/nova-core/dma.rs
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Simple DMA object wrapper.
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use core::ops::{Deref, DerefMut};
+
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::page::PAGE_SIZE;
+use kernel::prelude::*;
+
+pub(crate) struct DmaObject {
+    dma: CoherentAllocation<u8>,
+}
+
+impl DmaObject {
+    pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Self> {
+        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
+            .map_err(|_| EINVAL)?
+            .pad_to_align()
+            .size();
+        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
+
+        Ok(Self { dma })
+    }
+
+    pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        Self::new(dev, data.len()).map(|mut dma_obj| {
+            // TODO: replace with `CoherentAllocation::write()` once available.
+            // SAFETY:
+            // - `dma_obj`'s size is at least `data.len()`.
+            // - We have just created this object and there is no other user at this stage.
+            unsafe {
+                core::ptr::copy_nonoverlapping(
+                    data.as_ptr(),
+                    dma_obj.dma.start_ptr_mut(),
+                    data.len(),
+                );
+            }
+
+            dma_obj
+        })
+    }
+}
+
+impl Deref for DmaObject {
+    type Target = CoherentAllocation<u8>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.dma
+    }
+}
+
+impl DerefMut for DmaObject {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.dma
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c3fde3e132ea658888851137ab47fcb7b3637577..121fe5c11044a192212d0a64353b7acad58c796a 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,7 @@
 
 //! Nova Core GPU Driver
 
+mod dma;
 mod driver;
 mod firmware;
 mod gfw;

-- 
2.49.0

