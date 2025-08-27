Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94357B3761A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 02:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FAD10E09C;
	Wed, 27 Aug 2025 00:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m2IO/wDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61C210E09C;
 Wed, 27 Aug 2025 00:29:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUNChGuQgdldao4rb+3nTS3Zk4Hwc2s8d7B5Mqf5ZBhW1sAlLxs5Br2y12eWIqTMtnXCqVrYXJYKqtSWXXav9QjUxexmKWiJ5Fu7sRc95csnoHc3pBeEB5g+d476IiVZsVsgcNa0oDS8HiMD1Jf+SCbyEsxdWQSpGK0XiHLAbA54Svv9C16hPmogZBFAaOALNm+cCtXYQLpWpTG8lgcvep9N7Kqo0IGabzqxHuI/nFOvgVxzCyqR64ITULta9lbSCIPTJ27GymQ1LDZAwyOFGEvxhl38mHFX4BIISoX+LB5rFlcevAcMpja3QeMHMyd3e22ydAikelvBJxDs6OkKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nM2OzFGtIx3J6WY9+/pQwSWw18RZ6Eqpgjp+MHVujK8=;
 b=e1h9Eybz59gH3KtevZ2htxpS9xhkkHtTkAkjJOdbMcxPFzU0a24/I0KFf3kPMNYkyd8Arr6YaTHPAV7n8wt0BvuigS/JjWoH/nmxljunPI1t2VUwQvc7rutztBN6Dbwt5lYPCxnLgec7dmtXBh9BbhoAvYOzaYsyrzjLrjVMaXpxFDakAr2qBqaeZuXey0thBb+2nVMpJTl0aZexf0gxcMyU1zEp6xK9Gf+X+4ggGs3uRGs9AN1SK+b5HM/TPBIzjLyjUl4+QQasHSMnIvmXNhsF7HuZ5/WgcQvxS/9ne0r/CmCdWU3AJHXmW/gJCsUoSLD8ofwhHevQERb+ceEkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nM2OzFGtIx3J6WY9+/pQwSWw18RZ6Eqpgjp+MHVujK8=;
 b=m2IO/wDE19K7OIxZ6LbZ6sBy+73rxmYGwstyL4eZ+d+AJl8bdLrw30kQaaIFdzTHHSipG0t814JcdoK4/hUOuG+vQJ2fUA+8EPaoswj8rUJONIRbLV028uVbDxuHz5bzpoTmgEN8MhX6wBGgCLfLrNiJhuaMd2WY8ltvcDUjINWO/FHjJ0jqPC+zmI2RVTO/HC7cykT/rpopbdS5FJ7uuleqStaG34/43Fv68EVlagL+y4QFegu9e0RYGIU7c/ujP5UgR8sgHzDcqfTenwq2Isxbelvd8ZUQIAec+4gHdQP4Vl3OsmIAv2+frDsqnYdjr9M6nNXPc+xh4pgxwSdjwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DM6PR12MB4315.namprd12.prod.outlook.com (2603:10b6:5:223::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 27 Aug
 2025 00:29:49 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 00:29:49 +0000
Message-ID: <dc18894e-09d3-4088-9be0-22c2070b61f4@nvidia.com>
Date: Tue, 26 Aug 2025 17:29:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] gpu: nova-core: process and prepare more firmwares
 to boot GSP
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
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::33) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DM6PR12MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c377e87-77b4-41a1-d7f4-08dde500d4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUFRRU5WbVJsejMrcmEvYVErNFhXcFhFb3BaaisyRlg4TmR2Vm1VWHVRelg0?=
 =?utf-8?B?VlJXd0wvcE53OSt2N2dCTmxIZW5mZ2FtN1Q0TDVTeHFqREp2RVY0WWtoOVho?=
 =?utf-8?B?S3pPTkhwNC9YenI1WXo0bks5TFhMOXl6K29KYmV6bk9KK01IbjN2dGJTVStM?=
 =?utf-8?B?dXVLUWRXOG1Nalo0VHZPQ1FIazBvZXJqTkdGYjNQMUVrS2k5VXVNR1BSTkQx?=
 =?utf-8?B?SXRwZ25sOHEwVzgxV2J4eFI3NFpETktlTkg0OXA1N2puZ1VGL2VkOU9PYm1C?=
 =?utf-8?B?NTRkRXc3ZnFqUVlkaGQ4R2RIS3VKNGFpanBYS3cvTXEvZ2Z6SllIMzd1YWwr?=
 =?utf-8?B?RFhRNG9OY0NCNEQ5V0hRYisrbXlVNlA3Q0x5cDhnb0xvTHc1US8xMXhpZGF2?=
 =?utf-8?B?dXJHczAydG5ORTJ3bWo5ZTNsUC9xejUvY0phbjlLcWhLVXFIdE00Q0dnd0h0?=
 =?utf-8?B?cmlLRFRVVEEvRzFEbVdFQzhNQWtlWWo2eEc3RURVRjFFK3NoTFhHZzRzZXha?=
 =?utf-8?B?dks4NWx6TDJkdDFJcjRpcDUzOFhnaGZmZlZLc2NRVXZ5d2gzaG9ISUx0b2c3?=
 =?utf-8?B?UmFGY3BVb3drVTlIek1wOHhGUXFONG9YQ0w4RlhTZEswcmYvTG1vaXV2RjB1?=
 =?utf-8?B?Wng2Nk9URStldGhWZTQvL0xuZTFxbldnUkRVajBGKyt1T3BNSXlESVhmTE52?=
 =?utf-8?B?bHdlYUhCY3haV0NiV1VTbHlqc292SFljMDJoREhBa1VaRkFRQnoyZDNyT20v?=
 =?utf-8?B?MHBJYlN4Y0IzK0JUQTYyUWtVK21FNjdwaWVPdHp6YytjU215NWdpSVFJSmJL?=
 =?utf-8?B?UHp6WlJtbFF4aUU4QnRNMXNqSWNOREszR2Z3WXRGTE56a1MzRkxDNDE3emhw?=
 =?utf-8?B?bHc1UGlaUkIva2ZFQTY0TVNWY1lWb0Rta0dtT0dGTHVOUlpZelBkWnl2ZEJn?=
 =?utf-8?B?a2tNZzNHb09pN0pzdzJyM1Z6K2JyV2lpTTNnVHJxZ1JMZjdidFRTeW4xRldN?=
 =?utf-8?B?NC9LQ1VYbHZnaG5aUWlXNm1KajM5ZWFXS1ZCNDBBMzhoQ0VVUUc3elJlbG95?=
 =?utf-8?B?Z2IvWmlBZ0pOZVBReDJ6M1BOVVkvcHh5VUgrY3h6YlFRak5PdERQWHk1d1hC?=
 =?utf-8?B?R2EyTGl1UTcvc054VmdWQ29UTmpKL1B2Rkw5dGRJV3V3SkYvMHVpUWsrdGk0?=
 =?utf-8?B?Ti9pbWQxNXpzaTJDbUpabk1mL1FkVHN2WVdCL3FtZGF2dzVpRTg2Y013NnB6?=
 =?utf-8?B?OHlDR0s4UmhUWm9lL2RWL3RVaG9qcS9XN3B2TERxV0FJOGF4bWNMa0ljSHhn?=
 =?utf-8?B?bFJWNTRGK29CRVVmV0lKbUtTWFR5S1Zkcys4ZzljcVBVVGNxQVJuMkxROEhz?=
 =?utf-8?B?MjVXNC9WemFsOUhmWVRqR3V5eVU0S0NOT3pFS1grdFYveXFYdjhxNUlhRGFE?=
 =?utf-8?B?YUFaeG9rQmtqeDhVTGhmZy8wbzlPQ0hzd2xvY1d1NG1odHY4MlNpMjhqVEcz?=
 =?utf-8?B?alZjNWg5WkZrL0tyRW9xVkU2aWphWXdlUWJiZTkzanp0VnlvK3FZZVZveTZQ?=
 =?utf-8?B?Zkg4QmdSNUJYaWtJQllxaEFLVzFjVkwzRldISmFPalZlTkNNZHBqRkpjRUNG?=
 =?utf-8?B?eE1SZm0rRFc0UTExMUlVTXd3L1RmMlJ2aWZsOWJrSWNoRDNqZWVwcXg4eUlw?=
 =?utf-8?B?QmZjOFRSYmZjYSsvaUlyMjhpYmtmYVdNKzg1b2d1cDNxaDQ4ZVp4U1gwVXJx?=
 =?utf-8?B?REhWYmF6SDhZN1I2ZFptODhrTjZEUXNWK2NFaUF6R3dpRWw3RFNHdERLWEJw?=
 =?utf-8?B?TENCVWhpREFkTk9OYk9iKy96M2NTS1cxeERXa3pBR0xncEwvVzFLNTVJK0FJ?=
 =?utf-8?B?TVVVSEFNUWtHcGQzRXdWMm1nWnc2d3JWM0JCcFZoSmpOTWljNWFVRTN3R3Nu?=
 =?utf-8?B?R0RQanRCY2tTbDBBSHp0eGYvQlphcEFEdnh6Mzhha1htaFpsdEFvSTV0ZmZH?=
 =?utf-8?B?THVqbmRoYXhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzVNcnhRVDNPdnNabzNrcmdVRmtIK3ZGMDhuOTZac3h1U0tHTzBwbkxYTlBD?=
 =?utf-8?B?aUsreks5QUJ5WVYxd0FYbG1lSUpoeWpOUExrRjNuak0yK0lzRHNXTGJDV092?=
 =?utf-8?B?aXV5N0JKRjU5c28yT0ZMcFRhQ3c0QjVkM1Y1TFpOM2Z2ZkJ6VXVZTFFGalNn?=
 =?utf-8?B?SUlYb0RWTmNzNWNLbGRGdVB1ZXA1Kzl6MVFuQURqWUxRYncva0dnTzdjcWNV?=
 =?utf-8?B?MVNIQnZNSEtERU1XeXlyQ25TQjNuNjlvemE5S1N6UEJ2ZkN4UC9hcEc4dmU5?=
 =?utf-8?B?VGdPOXE2NGVHRUppeEFVeDVvMjNHMnpTSHdrdDZPN1Bxd3FlUDVER0xtNWFX?=
 =?utf-8?B?c3RSYWhwa2xZZmhrRHpGNmpNa2o2c2ZnL3hwV2tOMnlDTjViN1NPdVkzdTRw?=
 =?utf-8?B?a1h6QjZvUlBEZFRYbVlvZVdsa3pnVEp0S1VNZ0NmcmRtLy80ZnRIUHRidGZ5?=
 =?utf-8?B?MjZndzNaT1pzVTlUc1FPQ0hvT215MVN2U1llUnNSWTF5TzJoVUE0Y29yMHAv?=
 =?utf-8?B?eFZaWUZldEhtclJEVUtDemJEeUVHUnJPME9kSTZ2bXlqeFE2K2JqSUtjeVU1?=
 =?utf-8?B?YzBVdU1sQ1hFL0luaGpMazlMTDl1emhUZUg0MU1iWThRMWJsaW40cG9EZ3g4?=
 =?utf-8?B?UkNSYmgxWEY3Q21WR0crYXlVcWYrYjFwQXJSVW4wSkpwdkxKaWlTRHJ3ZUpH?=
 =?utf-8?B?UUhWR0QyY0xIWTRCMU5uVzQrNTJNTWJNNXV6bTdrWFljYjRBc3M2Y3pJOXpI?=
 =?utf-8?B?ejM1cXdxamZRSjFvOWRDdWNnSStNUjZxVkx1UmZlYUtTL2JmN0JEM0VmS3Bu?=
 =?utf-8?B?Y0NCNnhzcld1c0JMRmg0WnZFMzFFVHplVlNrNzNXdzBleE5mc2hVaEkvOE12?=
 =?utf-8?B?THRWcktFdlpsOWU1SzIzUm1mRklZOUVsQmROQ2Rpd3BpVFZhQjBQdU1TV3BV?=
 =?utf-8?B?KzhKZmdEY3RzZ2U1L0RIeTBrSEVZQmlVaFNWYXhQMUZ3WFVOeFJsZnI5dVBQ?=
 =?utf-8?B?UVJzblpDc1RzMVZmVjl5MUx4ampxTFhXQ3NVRVhzekQwd2IzMUY1TU9BbW1O?=
 =?utf-8?B?cVRXck16VXBmTmFUN1RTdnNreXQ5RDVRSGZwdkRMSzZpRWlTY0tMRnNUdFB0?=
 =?utf-8?B?Q1UyUnVFN01mVnNGQ01nY2lEWVIxYk5oaE1BSkI2Qjl0ZHFZdnNqbEFQbFdN?=
 =?utf-8?B?N2UvbzdnVllKYlNNbUcrMklTSThCd1k0Sjl2cS9ZTlNrWWRxZkxzK3RwdEZo?=
 =?utf-8?B?blJ1c21OYjJpckFES0pXT0lPMEpxbThCTzFWcnczbDgrYXBUcGpjWSs2L1Nr?=
 =?utf-8?B?NEJ6cHd5VGFHVHovNkc4MWhmWGcyZGg3MHd6Qmx4Mnp4Q3JrVkhrVFRpK3Zz?=
 =?utf-8?B?ZG1JUFNGSGhZV0xacTNia0ZsYWE2OHdaZ0tzUXd1T1lOQ2NSbE4xblRYbjhI?=
 =?utf-8?B?S1cwdk96cW9DNjAvTncyWk5VSEcweHVmaUpsK1lRVngzcDMrdFM2Vzdaek9m?=
 =?utf-8?B?aWpnWjhLdkVoWGJQSFFFUThkVFUwNjJGamJaWTVrUUpManpHN3NvcFY1QUwy?=
 =?utf-8?B?MmtaV3BncGdVVGVIcTRacy9BQnhuZ3JyWFY2VEUxc2tjS3QyalRtcTE4QVov?=
 =?utf-8?B?ZDI2dHhJWCtjYXk4Q2FMTjBZU0Q1VGNEeThsdDVyNE42czlWcHllekFIRUhT?=
 =?utf-8?B?NGF3QXBjY3cxSktFWDNHNlhuaVlob2x5M3RSZUNscnZBTVF4SFZrYTVOdXo5?=
 =?utf-8?B?ZnY2T3JLOVo4L244Zno3b0MzeXRkdGNvNTZXTjNDR1BJZzJqRDB2b2RibDZy?=
 =?utf-8?B?aWY4MzZXWFRQek1Va1VzSmRlalI4aXhMRUZSUkJwVFRuNkdqNmd6WlUwMjA4?=
 =?utf-8?B?ZGRXYURXdGFUb1JGRzlOdUQ1OFpuSlZOSEkrVm91ZnlWY3BsSlJRaHpJblF3?=
 =?utf-8?B?U2w3K1JJYXRkZjZBMGRxMUFwSEpWeDhWdmFvRldVVEpYejcvMFhOcFlzMzRO?=
 =?utf-8?B?S25PajFLa1ZJbmM1VnZmMTJPSmQrZzJMcEZRV1NwSVY1SmxPaS9uOUE5NmhE?=
 =?utf-8?B?UFY3OTlkT0g2SjNuNVpEWUdwbEtmQlp1aElmcEh0Q3h1MlRLSkRmQnhZZXpt?=
 =?utf-8?Q?U1m/ohvGdrEWRuBbotS5rB7l8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c377e87-77b4-41a1-d7f4-08dde500d4c4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 00:29:49.0925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxIAZEfEDGquWl3qWh2CPD+ALZzXkw2vFwJf4w6ORvjEPW6METQOGntILar/rI6J/6u4ciLnSOm0CzPNYCdoOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4315
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

On 8/25/25 9:07 PM, Alexandre Courbot wrote:
...
> The base of this series is today's nova-next, but there a few more
> unmerged dependencies required:
> 
> - BorrowedPage, AsPageIter and VmallocPageIter [2]
> - Rust infrastructure for sg_table and scatterlist [3]
> - FromBytes [4]
> - The Alignment series [5]

Hi Alex!

For future patchsets that have complex and/or lengthy prerequisite
patchsets, let's please please make it easier for people to
locally apply the series. Very important. 

The very nicest experience is by simply providing a link to your git
branch that exactly matches the patchset you just posted.

In this particular case, it would also have worked to just say, "this 
series can be applied by first applying FromBytes [4], to the base commit."

Because that works, and is simpler than hunting down the other three
items, which are not actually necessary for git am (although they
might be for actual testing).

But the point is that the admin can be made simpler for the reviewers--even
those of us who know exactly what you're up to. And we should keep
that in mind, especially because there are many more of these situations
coming soon.


thanks,
-- 
John Hubbard

