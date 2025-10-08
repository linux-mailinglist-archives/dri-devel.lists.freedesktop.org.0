Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516A0BC30A9
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9760C10E1C8;
	Wed,  8 Oct 2025 00:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C/f+OAwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D7710E06A;
 Wed,  8 Oct 2025 00:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYiorsiIuuAwoqljpYkRe1A70ZTubsQjx5c2gEffRLZDN/i+LapYIB5Ru0765khGSng24JP309kXuIp24n0Hjj0B5wRaF/5oN8XRxenaodiWrmWK3mmKQpGCH/fWn/7z9pkhzNiCDkl6lEc+Az8q1t+1UaRjeP8o3msT9nFTsWV9wYvSIStrqnI+2X1bqWNAKVyaGwV9xtrmXPtRZrSXlJWcYPidVK3gbAlUmfPU8bQtniDYlf08lVOId7eFV9PX+Hw7LgPrm+mhEp3xS0qbh4U3ch7jaa3xRezbHfvyM/pI2aPWl5quV8lfo+k9HSAqQG/9ylfZSSYUVkeqXy42ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zz8MlS1E8tWHUVPvWMCGP1PI1RehFI9ecuZwCrmYrrw=;
 b=LCy/vqloBqqKjUwBGpn3svwhbSp26ODeR4tz7T7j37gI6rPule3CZjbs01MZM0NtHZGs/0SMU9CwaG69sDiiEg5nimbniLewzIFKfy3Dt8yzozK7AG3e+xfo366VPezRrlPXzdwB+Jbfen8qNkUiGqZy29pplNyjwmKdXXz2LqbGJh4T8wyjCZmKN/q2+FZQkRjIuFCEYJJMEz3x8yJOqYwbdJUpwtFfS183ryzTJuw3vdu4xQ0NvrS6kQu/hfBv6sZOvIeaaZ8QYqmZel1sM4hBULPqjsnNFhfLq1lBdKFvKqOlqY8qzlTCHtRPJZ2zSb/vddifkG37DjNjirh/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz8MlS1E8tWHUVPvWMCGP1PI1RehFI9ecuZwCrmYrrw=;
 b=C/f+OAwIyOhCUIkjDKqtWbBibrHEXIW9/IEm+nx2brIYhHczcMsZ4onx54IL/cR0gCQ4qJGpfKn+8QxUGtlp4fLalaRki9jAVx/PzQALgAFLWMAjM5dXEBiRIKDs2LlezZzWZ8K4leBT55IqM0ETGNOI2MmQdhRpNLs02mkk36thUH3vkgs29FeyAyrBPL0hMSXk54OYN7NuKSx4+hJQMSF+FPvWmSdM6v36UsKdFN06pgjcGp2tDcbKHsiHDwkDrJvjUThTjK5iu/6J5cnsIL7mh6ywxmpNNeuUbWApWa+KxQISbFXDHu94vkzcYJRPtL6QQ/l+SdemkrvnsjAw6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:00 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:00 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v4 00/13] gpu: nova-core: Boot GSP to RISC-V active
Date: Wed,  8 Oct 2025 11:12:39 +1100
Message-ID: <20251008001253.437911-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P300CA0003.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 7503205c-7efd-417c-4146-08de05ff7078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnFZNjBRSW11c3ovYTRRN3hla21SaDUrYmNsWCtBcVk3eEdRYlU5SlkrNzlN?=
 =?utf-8?B?dzEvd3BtNUxhVlRreXgwMXdMU28vNzZKdkFCQ21GUkEwQzh0RStXVnl2cm1Y?=
 =?utf-8?B?RTd2RU0xa0ZOWXpVQU1BOEVXT2FYM0FHeTd2OTRaVUZDWngzWWkwTHVEdE1w?=
 =?utf-8?B?QUJZNUsyS1BudGRPa3k4VHIyTTlucGdIbkM1b1hZbEZSUzJWc3FyMWhDNDds?=
 =?utf-8?B?VG85S0VYOHUzenJwVndhdHZmSWdua2FQam1rOXlWY01XOGxQNmpVK3o0VVdI?=
 =?utf-8?B?amQrcEowUnZFVWI0dUo0YVhkNGJNa2NIbk5jWXFFM0p0Sks1ekw4cmhYaHZC?=
 =?utf-8?B?OHZMaW93WHJEUGhHY0pkazZmWUhMMDRWS1p5TW02K1IzUmRxbkFMK0R3cmhm?=
 =?utf-8?B?RkkzSit3dU0zQmZoZkdseCtHNHMvRlBjQU5tbWY3cW9HOFVIZEpnTnRkYWNX?=
 =?utf-8?B?RitwSWNucXBXNy9zT2t2Yk1FVU0vL2JTWFNYV2liRW9md3RUNHh1cDZ5NnBs?=
 =?utf-8?B?RG05MGZFU3Y2cTV1bnlQNW90M3lQYUhqVmFxUXRiVkxBaWJnS0JRT3lWU3hp?=
 =?utf-8?B?MGcyVVVzVHlYWXp5ODJRbGdDajlpOWJseHBwVGlGTm40QUZ6eGJzb3cwazM3?=
 =?utf-8?B?bUJJM0ZFeUc2ZkNSYXFQUVdkVWo2c0FRTHJPYU1ndUlTa2twbnJHQkVLYVBS?=
 =?utf-8?B?VFM3OXZDWFRaQkNGeTVjNCt5UGdQUTJVRU13UGFaR24xOFJDakQ0TTZheDJX?=
 =?utf-8?B?U2tZWEJERnc5SzNQTG1sRE4zU2oxWG9YRzdRZjdRK2RzLzYwWjExMDVwLzJm?=
 =?utf-8?B?aEFJM2RFY2ZVTXdoN0NNbFZUcEp2ZktZWE1zU0hBZFlMUENrZHZMZm5nT3BD?=
 =?utf-8?B?cWhzMFhaSFEyNFVFRHM1ZXhENUM5QXRTT3VMdVk5NHk5RU1scnZ2VjVsYTZD?=
 =?utf-8?B?YzdJWHY5bHp2N3hUSGJvclUrQTFTK0RTQVkyYUJZdTZwZDNXbk5hN1F2Vi9q?=
 =?utf-8?B?Z09WUDNGdHhPcVZ5NEZLYlZWOTFCRHorTWN4KzBRbTQwSDY2OU4yczY1RXR2?=
 =?utf-8?B?OVdKd05qbDNDakpyNjA4bEtsNlRjQVdZa1F4eVRRK1BOWmJiZ0gzUHErU05l?=
 =?utf-8?B?aXp6Y25JWDl4YjNhS0ZNSk1jR1lYYlgxclhwbVZXVjRUaittV1hiS1VYTWFZ?=
 =?utf-8?B?TnRlODZhOVluM2ozdWpPM2h0U29nbFVoRGhZWExyWG0xbTJTTENXdHlrdk43?=
 =?utf-8?B?QnJ1Q2ZPaVR2OTZtTDhNS2dFQU1LQXFjbHNwYlA1YWduRkEwcVcwQ29jUFdQ?=
 =?utf-8?B?TSt6eEdmbjE4aUhyUkdMZ2p1VE1zUFpGWEZkMmpCN254SUl3cmhLUzdYMUxL?=
 =?utf-8?B?UFdQYko3K1BjZ2hvZGptZ3diOFI1MkkwbmpnWVVzVzFvNURLYzJzVGFGaDEr?=
 =?utf-8?B?NnZYdVlkQ3BQUnNodllDK3R4SFlTcjFVYW91L0ZITnFGK2FYR3EyTnhBN282?=
 =?utf-8?B?eVMxMWRSNVhYeHdvVzdKNVVha3ZTZ1UzMmdyTGxlZG54cDk2QlJXSVE5TndT?=
 =?utf-8?B?b0theEJpSCtWT0h4c1N1K1l3bVpBM3l3ZCtUeWQrRkYrWmVkRE16Q3docitn?=
 =?utf-8?B?dzk0ZW9SbDR6cFIwRmRvVDg1Ty9DT01XMjU4dURzaVlNWVhNZ01IcDJlYjVk?=
 =?utf-8?B?cFNIb3NqQWhzOFM1VnNzRUNNdDBkVVBsOUJJQTdpa0Jvb3M3Q21nWXJ1QXgz?=
 =?utf-8?B?dmozbTBDVk9NL2NKamNtMkxLSW5VSkpQbGdBdmZYZm1PYjQ5NkFmdGQ5V2VZ?=
 =?utf-8?B?Vjk5MVUzOVg4Tll5NXZyY2QzeHZLQzJ6NEJmMUgxcUVHdllLNG0xQithRGtj?=
 =?utf-8?B?a3B4cEdmZnJRcE42OXdod1JTeW10aG15eG5OcTJpS0NySlh0M3ZWZWQvcW9m?=
 =?utf-8?B?MFV3WjRxUzNSU2pkRFlzbDhDQTVNVk1IdUllajVhTUhPN3laaEw4dzBVWi9N?=
 =?utf-8?B?dGszd0lWRXVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVgyMWxsU1ZNc0JBcnlNbGphQTFsVjY1alJ2b0Z4YzF2U1ZiUmNoUW9XcGVG?=
 =?utf-8?B?UG5vclQxOVcweTc1M0ZndjlhT3JuWUJNNks5MGZxVWljdWxCWW1icnROWkdY?=
 =?utf-8?B?T05Ld1QyOFJJeG5DZzR4bm1SWEprTE5vaE1oK2FGTjNTdWxWclc4MVdsK3ph?=
 =?utf-8?B?dGRYZlVKYzh0NldYek1xVGdvMzh6bHZtQloxSDJ2UVBLU2ZrUHFVRFFhUXBn?=
 =?utf-8?B?VmRmQjE4cHNsZnlTMGhwODlsQ1QwU2c3enkzVTZFeDB4ZFJ1NEhkR2pDckpN?=
 =?utf-8?B?ekZUcFJHL2ZUYU8vaWZoUXMrMHo1di81UHFaQUNaYVVLSlV5RlRDY1hQY200?=
 =?utf-8?B?aEgwUE9Yb0xYRFp6dWRlVUJwQ2tGdlI5ZnFpL01jSGYzYStQRFJyMU1rNCs5?=
 =?utf-8?B?SjAvUG4zMjE3bjNTZTNwajRsdHRER29UWk1SeGg5VEg2SksyRUU0MFl4ci8y?=
 =?utf-8?B?RS9ZcGtrZGI5Q0ZaRzRlN3BDUnQ1eFg3UUREbjhhMC9TYWtGT3gvcWFPSDNv?=
 =?utf-8?B?cmsxZndDVXpuaWZnc0VHNUFLdUNKNlFkSTRuWHI1dzgyVGtSSVUzSnNWSzk1?=
 =?utf-8?B?cGZGakNQOTM3REExWjVScU1reks2WXhkWlI0SzJ0eXlYZENWcktLbVk3dHFH?=
 =?utf-8?B?ZkIxT3R5aHVldEQvazQySnJXVWl5K0lQeDdKTHJJenZuNFZOc2VwYWd2eWhJ?=
 =?utf-8?B?cU12cjNoYUZpZFBvUjhpcnU5a0NLZFRzSjFHOWo0dldiVE41cm9uSjNtOURq?=
 =?utf-8?B?ellISFJTRzFYaERtTHh2OXpSY0VTcHcwcWJGNVdRM1luWi8waUhwNDlWOGtm?=
 =?utf-8?B?S240T2FVQVA3eFNTcEd0K29Ud2tzcThBWjRqRDV6cUttNHhJNXZ0VDh4a3RE?=
 =?utf-8?B?RWVURUVMNDlOMElUMGxzdUtwUExJNHh2aEowaUZjWXlkb1hPaFBJSm9MU1pp?=
 =?utf-8?B?NXEwSWpoSmVXbXBPT2liQnhTQ3BFQldJNjdjMG13c200ZjE2UzcvTng3cDJZ?=
 =?utf-8?B?bG5RRGN3YmlzZ3pSVzBXWi94ZkJncVNxZWZRaUpiS3dENG9Ec241dDQ2OEZr?=
 =?utf-8?B?R1NNOEF3UUtteCsydTMxTUZPdzNuSmgzdmpFTU1zUzhtNG85YU9xWnpQQ0JN?=
 =?utf-8?B?UGxEcC9kU3M5Sjh2SEdDTVFOdjdYdGM1T2N4M0xIdWlFd2lRNUptUVZ2dG5j?=
 =?utf-8?B?bE1jTEVoVUxVYnF2ZXNFNHZNZDJJM0p3c21ab01rRTRXVjhLTjNGYmw0YVpa?=
 =?utf-8?B?bUh5Z1ZsWk9QOW1YRDZtMmc3VzM3MitjRXEyWUtlTmdRZmNEaWVHeVdXdXIv?=
 =?utf-8?B?ZjRidG1UdXA3ZWxhM01SQkgwUzlmUFUzY2c4WGR4cWxIa3RFMEF0dDVnT1Qx?=
 =?utf-8?B?ci9pR0E4bVBVTUlKZjQxelAranplUGRnWXlzWDZuWlErQXM2OUNEeEVvR1V4?=
 =?utf-8?B?Ukg5bDMzTzg2cnBWMWhsU3BmSVF2ZkQ2dzJVa09zQmsrdkpKMi9Cbkd2YzJ4?=
 =?utf-8?B?N0tkRmVKM3FiNHRvcGZhZzVmK2UwdXF0L2RHL1h6Y0VaQkdHeGg4ZDBXY2Ja?=
 =?utf-8?B?cHhUbVRGQk5Za2g4VC9MQ1JwUk5UNS9Nc3VFNFFiUUdXaTBYMmJKQkhCc1g2?=
 =?utf-8?B?QzhmemhweGY5Wkp0TU00MmFQUWd3bmVUVnVIbXVMOWt4c2Jkdi9nbEtPZE8w?=
 =?utf-8?B?VTJlZWRtNHlpYUNqVlVuS3ZvNEg4MEFYL2s0Tk4xUVpxb1hqbzFock1tcHBy?=
 =?utf-8?B?bmp3azFza3NIV1pic1BrUk16YXllZEd4RDQ4NHFsRWI4T0FXT1RKdmRzSnV5?=
 =?utf-8?B?eTJaRVdHQ2dWSGlUZmlTZjAxZFl2U0xCWWxZcmdjSlJTRTRaV2pFKzZwcDRu?=
 =?utf-8?B?MzZCTVZPdkVGQWU4M2pSbzA3SkxabHBMWmZuQVR3RFpvS3hXYStHRHEvLzJ0?=
 =?utf-8?B?aXlUZkVaeEhCMkZxa2tySnM1STJDME83ZEdVbXhjQ2RZWER3UWI1YjhpQmxE?=
 =?utf-8?B?cTkyN01UMkFUNHBMTTQzbHJHZVQxdzRqMzV1NWxudzVwR0lKWW5ISndEaUk1?=
 =?utf-8?B?d09tV3VFNHQ4THRGV29tc3MwRmlwOFlDMit3bW53NGJvUXlJZ1NiSTJxYitJ?=
 =?utf-8?Q?5Jr+dhjzvA4qxeGc8rzv4t0yN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7503205c-7efd-417c-4146-08de05ff7078
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:12:59.9130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaPv4lSucTPdfp2pkgM1wjWwnhKMH6FCiOIBFeB/Lje2vcjYQ0xdiCvglgnrd+7/q8w6GjQAOZkuePf4/oiWHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

Changes since v3:

The main change for v4 is to switch to using the `init!` macros to ensure all
fields on in-place initialised structs get initialised. This will require our
bindings to derive the `Zeroable` trait, however for now I have left this as a
TODO with manual implementations for each trait. That is because rebasing the
binding changes is a bit of a pain, so I want to give reviewers a change to see
if deriving `Zeroable` for all bindings makes sense or not.

Other changes include addressing most of the outstanding TODOs left in v3 and
addressing review comments from v2 and v3. In particular some of the comments by
Timur that had not been picked up.

Changes since v2:

The main change since v2 has been to make all firmware bindings
completely opaque. It has been made clear this is a pre-requisite for
this series to progress upstream as it should make supporting
different firmware versions easier in future.

Overall the extra constructors and accessors add a couple of hundred
lines of code and a few extra unsafe statements.

Other changes include addressing a bunch of other comments - see the
individual patches for further details. There are also still some
outstanding comments and TODO's to address which I have not gotten to
yet - these will be done in the next version of this series.

Changes since v1:

 - Based on feed back from Alex the GSP command queue logic was reworked
   extensively. This involved creating a new data struct (DmaGspMem) to
   manage the shared memory areas between CPU and GSP.

 - This data structure helps ensure the safety constraints are meet when
   the CPU is reading/writing the shared memory queues.

 - Several other minor comments were addressed, as noted in the individual
   patches.

This series builds on top of Alex's series[1], most of which has been
merged into drm-rust-next, to continue initialising the GSP into a state
where it becomes active and it starts communicating with the host. A tree
including these patches with the prerequisite patches is available at [2].

It includes patches to initialise several important data structures
required to boot the GSP. The biggest change is the implementation of the
command/message circular queue used to establish communication between GSP
and host in patch 6. Admittedly this patch is rather large - if necessary
it could be split into send and receive patches if people prefer.

This is required to configure and boot the GSP. However this series does
not get the GSP to a fully active state. Instead it gets it to a state
where the GSP sends a message to the host with a sequence of instructions
which need running to get to the active state. A subsequent series will
implement processing of this message and allow the GSP to get to the fully
active state.

A full tree including the prerequisites for this patch series is available
at https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream.

[1] - https://lore.kernel.org/rust-for-linux/20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com/
[2] - https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream-v2

To: rust-for-linux@vger.kernel.org
To: dri-devel@lists.freedesktop.org
To: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>
Cc: Björn Roy Baron <bjorn3_gh@protonmail.com>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Trevor Gross <tmgross@umich.edu>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org
Cc: nouveau@lists.freedesktop.org

Alistair Popple (10):
  gpu: nova-core: Set correct DMA mask
  gpu: nova-core: Create initial Gsp
  gpu: nova-core: gsp: Create wpr metadata
  gpu: nova-core: Add GSP command queue bindings
  gpu: nova-core: gsp: Add GSP command queue handling
  gpu: nova-core: gsp: Create rmargs
  gpu: nova-core: Add bindings and accessors for GspSystemInfo
  gpu: nova-core: Add bindings for the GSP RM registry tables
  gpu: nova-core: gsp: Create RM registry and sysinfo commands
  nova-core: gsp: Boot GSP

Joel Fernandes (3):
  gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
  nova-core: falcon: Add support to check if RISC-V is active
  nova-core: falcon: Add support to write firmware version

 drivers/gpu/nova-core/driver.rs               |   9 +
 drivers/gpu/nova-core/falcon.rs               |  16 +
 drivers/gpu/nova-core/fb.rs                   |   1 -
 drivers/gpu/nova-core/firmware/gsp.rs         |   3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |   9 +-
 drivers/gpu/nova-core/gpu.rs                  |   2 +-
 drivers/gpu/nova-core/gsp.rs                  | 107 +++-
 drivers/gpu/nova-core/gsp/boot.rs             |  76 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 509 +++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs         | 115 ++++
 drivers/gpu/nova-core/gsp/fw.rs               | 434 ++++++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 104 ++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 577 ++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/regs.rs                 |  17 +-
 drivers/gpu/nova-core/sbuffer.rs              | 188 ++++++
 scripts/Makefile.build                        |   2 +-
 17 files changed, 2150 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs

-- 
2.50.1

