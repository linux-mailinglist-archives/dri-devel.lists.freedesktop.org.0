Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4200EAC03E9
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 07:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8898D9B32A;
	Thu, 22 May 2025 05:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g/MMko53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265459B32A;
 Thu, 22 May 2025 05:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMFIk+kgFmPcLUmjMYv70q5Jrv1UekZYccH5fzFGZAixOwR7pp+X7TFcnb1XwBXTrc7ClqDFn29WTuxSq1ePzUPlasGD4SWq2kpN4CtybWmepA55usw6ofEraFpj76X6uquVo1UP3LtoLiEIFL51cUGbDUBSAREZkJm9F+Ninw96YOo7O0EYFaIPht0bGTBpHPjv6PmFvlAjTab0vHtfWZNrw7yQo0iWEBN4NOZ6aTphDjrsEhI0XF5z1Zj2X3AHuno0fqzBqnjLbt7CijSXgl5IzfaIJ/I8V3gUkQS10NwRIZ+zWaDLF3tuX9MaYG3U4AjcwG6FXSFsPb+UyYDbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrtUuaZcBbDUoedQYOt45gG2wk8ovn3VH8gvd0xuDyQ=;
 b=TAgq4v0JGPPfgjJ+D5chLmOaSN/LbhBgcfndbhNdcEq6C59EuXNu3gwgyreuafNK2db+SHujopgCkop2v0SBNv+a/KDhZ4pv/LwOTxl6kMbmkseVwausctHx5ZbHEKy/0e+YPh433jrQMt5Y5bL/elOOti9VLCx0VgKHTfTPMZO9ScZNBpfo4qTEkrlJ0j6joa0plaoq9y5+Eu+Tczc/7vISuoKk9K3QSozVQbmp3vjHNIyHrVn8iYK1m1x+NpsJrDYLclnOF95SDWFT2k150izGAL/gDjM+YM6gqN4WUl50/QwaCJx+iMXWAFEulN4p7acbIMtzQ46BAwkGCVNR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrtUuaZcBbDUoedQYOt45gG2wk8ovn3VH8gvd0xuDyQ=;
 b=g/MMko53i3/kO+XbmdgIqdxkmGf4JDmGX8MgiNwaRML/dAHNYBxvlOdcsTfUfHBSAoEuSAZX/koO1X2W54ZYWcHfZE0yc7BsPh7QyMDBrfXMbPTJ/8o45+StIhHBMMfNhq6nFoN2GBGtRK2j/LHznOpJSfyOhtR8JKpw2YvcmaXS3Ai+q07rHbthlVVqB+sYp+IC1GrV+4ixGau6hybYKjnLvwKkrZ3YMIOmJgrUyMNUoUFouKzh0l/cjEYG75dhIVVkdKYs2VIud7RC4G+UYaCEVA27bZDITuUoFcLa+RKYIqK6Q8LOkynaO2bl2s1oZtzK0DJaA/+/4c5Dp83xig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.33; Thu, 22 May
 2025 05:14:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 05:14:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 14:14:49 +0900
Message-Id: <DA2FLXFS10I4.1VIQE3JHJMBLJ@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 08/20] gpu: nova-core: allow register aliases
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-8-05dfd4f39479@nvidia.com> <aC2Quag3HYN70D8p@pollux>
In-Reply-To: <aC2Quag3HYN70D8p@pollux>
X-ClientProxiedBy: TY2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:404:f6::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e7b30b-7c25-422a-a5b3-08dd98ef950b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STZlcW8vSVdmY3FCTzJBMlhBaURHaXRSM0hjSVBraFEwMVJYc1BEM0U1WGo2?=
 =?utf-8?B?Uk9wdHpjT1RvTkt6ZTV2VzdOd0dzK3VmRnpSTU5EV3IxSjlxYXZaUWIrRGlo?=
 =?utf-8?B?ckw1bXJDS0QyYnpKY0dUOGhRdWVzU3VwTC9JbG84MFo2VmtqTklmZWxzMG1V?=
 =?utf-8?B?NG5yRGlEdXFYeDNybDZRQWozZWw0RGkzcE5kaTVQZFF6cWxqeXJPdyszWTNP?=
 =?utf-8?B?dldIMyt0WE1KSHI3d1hKRjVjVWlFMUFwMHExNDZMWWMrTkVOL1hHb2ZKemU3?=
 =?utf-8?B?WVVTUzNNcy9UOVlhK1hpQnZBMFJCMGlMTlNNTUlBdy9NUWhEb1lwL2VoZk1Z?=
 =?utf-8?B?MUlTQ05xOHoxdnkzS2hkT0piNHZSNUUzekFYM0lyT0hiNkFkRUF0K1p0R0M1?=
 =?utf-8?B?OGxqcTRlKzMydWtjSzhJZ2h0RmQrVThKc0h5T2tEdFlpZlEwT3pxaFJJOUhk?=
 =?utf-8?B?SlBsOENwYVZFYnV6cmRleFNTU1dmNWhlRFlmNGl6OTdQNms0MDJNZzl4RFZY?=
 =?utf-8?B?UUF1SndERU1yQTBRcVJRM2hrb3NTcHhTTEoyRHZaamhkRG9rTnNIOXZFM3F0?=
 =?utf-8?B?UlZwK0NuckY1R1NsbmVLcmk4V2NhdnZvR2hyaDZkVHRFVTY1TWRRL0lNRW1H?=
 =?utf-8?B?dmhpSXN5Slp1Y1NWZEdMVHN6Rm95d2ZHWHBsUUkwVFdzeHZ2a2hiaVFxdnJ5?=
 =?utf-8?B?c25OQUUydnFxUlVJYXZlTk1TRE9NQUxuYkg1T1dab2t1b2JKaWFuZWtUaFZO?=
 =?utf-8?B?WjhNRXBNMDFwQjA4aU1JaUI4TzdhaTZ4cU1xVVcvekpHR09ZWDBIdVRlNWtQ?=
 =?utf-8?B?YzFTYmZYYkYyazVqQWhDSEJoTXVYVEg4enErU2FzeEZVbTBmeFpkS081dUZz?=
 =?utf-8?B?YUxFV1VJaS9vbTBmRzg5Q3g3c0xQZWY3VmlGRkFjeEd1SDlWYXRNaCtURUY5?=
 =?utf-8?B?Y2wvL3hGZ254elpXakpONGFoVDE3TURBbmphanZHajNXY1NickZ6a2hnQUta?=
 =?utf-8?B?d09kaHdwUmdTZ3ZtelJXMUpGZXFQS3Vlemw5NS9KV1MvbW5QUU45T0VmRXh5?=
 =?utf-8?B?SzJMZHc1QW5kV1pidGQ4WmJ1ZXBIbnBrY2lCMG1iRW85aTlaNjFhMEthaXVy?=
 =?utf-8?B?ZjY3bkJ6VmpmcWw4VEpPMSt4dGo3eXVnVnN4d2RodWpXMkx5aUQxM2dtMnQv?=
 =?utf-8?B?ejhNUWVBd3dyVXBtNnJpTUhFcWdjWWx3MjNvS1VObmw3ZVVWSmQvdnhOcFlp?=
 =?utf-8?B?eHE5RVRPNkp1QkJrcjJBUkdqbitBdFZsZStJRHQ5ZldORDlmSGdkem9GaUxv?=
 =?utf-8?B?NnlCMHF6TWNRdmhjZUs3cUJxTlJONDNFU3JZNzZWL3BJY3NEeXlsOWQycFdS?=
 =?utf-8?B?K3M1ZDE5UGRNOWt5Wm9zcEtrQ1QwamdXTXNWSWo3RSs0VkNhUzFiZC8zYkhT?=
 =?utf-8?B?WnkrRmVDWXdPWEFzK25PNnZraFZOMnJ1K01NZjBxOGVXTncwNkNUSnRJNlBV?=
 =?utf-8?B?NEN4cjZHRjZWbkRIWjBnTXNUODU3ZmZKVW1FUzBKK2xKTitzUHBsNFMrRTZT?=
 =?utf-8?B?YWx6a1ZMNFZPaHllMVFyZy9Jc1Rtalk5NTYzdmJMYjY2eUxqVVZqQ2J2clk2?=
 =?utf-8?B?azk3SDE1eitwbmFhbFJ1SkYwcmd3STRFRmo2NnBGSFNQQ2JmRmpkbk5wN1NQ?=
 =?utf-8?B?eUxoY3ZBamtDRUxXMGZUQWxXMDJMdkFwV1dHMkl0UVVRV3NLNGJGOXQyQXhC?=
 =?utf-8?B?Y1B4YThvT1hsNk9SdHRWUk5OZDdRaFNwNEQ5UG8wWm81WXFoYlR2RFJpak9R?=
 =?utf-8?B?SVExS0lINVdwcFlhWXBsOWtQVzRLREs3eVBWNjVZTVcvYy9OSUh2ekRmeUZ6?=
 =?utf-8?B?bFBqaDhITWFDV01VSE50ZWZ1dXFmQU4ralpkQ3Jsc0xzaXQrWTlZRHNVUXZx?=
 =?utf-8?Q?dYLhRWwQGxg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJXcDc1enNLcFVMRGRPem5MRmN5dTNSMW4yQjZweUxEeDZsMlV6dWNZaHlv?=
 =?utf-8?B?ZFhmWnhIeDVTTWNDcU95SzhpeEpKUnZsdXVXZ2ZOMnhHYW5zKzRRNjB1bGw4?=
 =?utf-8?B?K2NnSmU2RVdGTmFhUGJtSWJVYVNHZnVNekxIL1RXKzlQdWM4Tzh6RlFoWWtO?=
 =?utf-8?B?UHpSdXJVSDFnOXBBRk5OSisyWDI5MFhJbTFaeWoxanlMQlFidGUrUFZIQmds?=
 =?utf-8?B?bzA3WlBXbEZIdXRsOWhaaTkrZFNoazJuZVgvRk4zdW8yTEdJS1lNKytzUFBk?=
 =?utf-8?B?ME93dVFzWFRvdDl5cktpc1N1MUxCQmpBTTlNRHhFYVZGSU9PNG4rT0pBelRz?=
 =?utf-8?B?YmR3cFJ4TjU1SkhEVjc0d1preDhNbDFFVndaempZVFJVNHFxNUx2N0w2NUd5?=
 =?utf-8?B?U1B5VmdHVUQ0cmJRZ0FhTnc2M08xdUhKWmlqWitVUjFCL3RCUnRPdFQwUTJ3?=
 =?utf-8?B?aTFpa0hYODZYNDZJaWFBelFkUEtCOW9NRGdIbHJvdHFWaVVuKzdyT1VPaWdU?=
 =?utf-8?B?SE0wODZPMUVoWEg4aVZVZVJpRkRFdmluZEZUS1pzQkFsdGFPQm9SRkJqa0FV?=
 =?utf-8?B?eVN3NFdTRk5mcEFKYTZOSzVKSVQyWHNtampoQ1FyN1lDUTlqemdrTnRyQU1F?=
 =?utf-8?B?MTFTZFFsM1R2S09qYXVuR1c5clU5aUNicUJlanR2UXplZjZrRXVBQzVxT3Aw?=
 =?utf-8?B?VUpwSVVZQkNLNGNweUdQa0s3cUduNGEyZUY3Z3BleUhRRlBZK3VIVFJ2ai9D?=
 =?utf-8?B?TEN0VGRpWCtpVmxkNHROdVZ2RGgwWk9lQWc0MktXOU4xZFJDZU9NSVk0VWpB?=
 =?utf-8?B?RFYzTkp5YXlJaXNKUXZBRUx4L00yYXhUd0lnazJiT1JtNWE4T1RaRVNBSEVG?=
 =?utf-8?B?N3BUUkZ0aUhTQUx1SnlBT2Z1M1M2WHdhQW9KMkx6VXh0ZWZOa0hGSnRzU0cz?=
 =?utf-8?B?UDhpSjAvUzI5TmVYUmhjOGxjL0FZbDR4VWJmNlRuQnRvekpGQ3ZqaXhydTRa?=
 =?utf-8?B?NkFKSXRVWW5xaVdNb1cxczIvT0xiTHpFSUhRZzVteUt4VHFYV3dLZnQ5ZTZh?=
 =?utf-8?B?UXJ2YnVHZUlCZWF4UU9TcGJkbDRRb1gyeE5RelJaWWhoWENzOVhzcVhHVFBp?=
 =?utf-8?B?SHJhNUlxZTJLYjcrUWwwZXVOUzRFb29oeXFnU2l4amxRWVhNMEY1aUsvVmNZ?=
 =?utf-8?B?bDFUa2M0dGphV2t5Y0FXOXBMSE83OWZnbkd0RzdlRzZwUHBTQTY4MmhFcEVJ?=
 =?utf-8?B?UWVZeHhMdkJwL3pYZUFvbW5xMDNOMTZjRDg5Q3hlS3VPb3UwS0VTUGFFWSt4?=
 =?utf-8?B?ZmV3MEJYeVAvWE9CRjBmZFlZN2pGSUQ4MW5PREtRYnZTbUdOdTRrYWVJSXpa?=
 =?utf-8?B?dGwrQ2ZGcERUZVJqc0VIcktHWW0vNmY4eXJ1Mm9TejYyTmpDMmpEaVJpcFRM?=
 =?utf-8?B?M2ZxYzRLa3VvamJ6ZEJzVmI1cUJzK21xVE9FWm81REJ0VkMvTmlWSitpNVU2?=
 =?utf-8?B?MXQxQ0xQWVdhTWdiVWxKV1pSbjU5ckNmWmhMQjMwV0NvUkFlUHByRTh3Vy9m?=
 =?utf-8?B?NFFleWZacDRLYTFFNW1ydWNFZTBxTFJBWWtabnVxRmtQYjNHbVU2ZzJreTVR?=
 =?utf-8?B?TXBTeEhvKzJpTXBHSlUwRHdnYlJVZWxxMXJpSlJQdXJPSER2ZDYzMVBHdjgz?=
 =?utf-8?B?ZjBYdUZ2M0dZZ1ZoZUVSUjl4R2dVa0hudng1RzVHTG9URzcyYkE0RzJFSUkr?=
 =?utf-8?B?ZmtCbDZqVkNTZGVoeTFRYW9YVVp6UW5UM29MSDFkR2E2dUVFdnQ2SmhtRTc4?=
 =?utf-8?B?a3VJTUVTUXpubVpwWCtjd251MlN2em5rSjNtN1dBODlhaHFtMUtIR3FBSC9E?=
 =?utf-8?B?MzF1REJXZmRWdTdlRFpSZThxZVBHQWRkOVBJZTBvSnRKUWMrRWN2U2lkM0la?=
 =?utf-8?B?Y3E2WS85M1V4OE9xRXlsSU13eWRGbDVTOVFZUE9NK1QvTVl1Yzhtb2NjUy94?=
 =?utf-8?B?dTdLREhIajBaeXNZQktzeExXSm1SZGdPbU93YnVTMGYrekpKb2svNmJDdUQ4?=
 =?utf-8?B?VTVobWltMmFrZVFyd3hkd2t0NW5ZemlSbmpDWi8xTlhMM3NtRW8vRy9tWW02?=
 =?utf-8?B?c2xsTTlZRExIZStla2M4bHpsSHpRQnpLUmlOSXZQU0hXOEJtZXRoazJXTFRC?=
 =?utf-8?Q?uqqsMNxpIJEHyCgo2nGH7bEuPn+eBtsnTs513es+sxxt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e7b30b-7c25-422a-a5b3-08dd98ef950b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 05:14:54.0822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1oTU6j2Cg+4KQ1Ey6SxY3biEGWxSmMvHwhfdQ5q/1Pw76WpIculv2bItpcM8XMe7Sq/yEGawStoRPdMss6iqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394
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

On Wed May 21, 2025 at 5:37 PM JST, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 03:45:03PM +0900, Alexandre Courbot wrote:
>> Some registers (notably scratch registers) don't have a definitive
>> purpose, but need to be interpreted differently depending on context.
>>=20
>> Expand the register!() macro to support a syntax indicating that a
>> register type should be at the same offset as another one, but under a
>> different name, and with different fields and documentation.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/regs/macros.rs | 40 +++++++++++++++++++++++++++++=
+++++--
>>  1 file changed, 38 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-cor=
e/regs/macros.rs
>> index 7cd013f3c90bbd8ca437d4072cae8f11d7946fcd..64dda1d4d93d3c7022ef02b6=
f6fb81b58e90dd44 100644
>> --- a/drivers/gpu/nova-core/regs/macros.rs
>> +++ b/drivers/gpu/nova-core/regs/macros.rs
>> @@ -71,6 +71,20 @@
>>  /// pr_info!("CPU CTL: {:#x}", cpuctl);
>>  /// cpuctl.set_start(true).write(&bar, CPU_BASE);
>>  /// ```
>> +///
>> +/// It is also possible to create a alias register by using the `=3D> P=
ARENT` syntax. This is useful
>> +/// for cases where a register's interpretation depends on the context:
>> +///
>> +/// ```no_run
>> +/// register!(SCRATCH_0 @ 0x0000100, "Scratch register 0" {
>> +///    31:0     value as u32, "Raw value";
>> +///
>> +/// register!(SCRATCH_0_BOOT_STATUS =3D> SCRATCH_0, "Boot status of the=
 firmware" {
>
> NIT: I'd put the arrow the other way around, i.e. SCRATCH_0_BOOT_STATUS i=
s
> derived from SCRATCH_0, not the other way around.

That's doable, but I read the current expression as
"SCRATCH_0_BOOT_STATUS points to SCRATCH_0". Also `<=3D` will be rendered
into an actual "inferior or equal" sign if ligature substitution is
used in your text editor.
