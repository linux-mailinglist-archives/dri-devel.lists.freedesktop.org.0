Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC75BE1B3E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DE310E94B;
	Thu, 16 Oct 2025 06:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f2ko7A7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB52F10E948;
 Thu, 16 Oct 2025 06:24:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jt1Dz5xG9pJ688fWv8gc5xv0+mqJN3lqdm46nwPf9IK3wWGRxerFBf9wNlI7aDd7axlx5fvpdIYAbWZtffc7ZyR7iTH84Pe8lhCQBs4dgbXQ3Y+L7Sq3rAZpxZVVlP40NjdadUrBYmEZp34rMC9k1l+h2hQHe+dDZ6ivHbUolhu1XmSRHpXFjMBSH5j7WOkjmiVtK7FnWtRpxOcauRRwTGO0h6IhDwO8idaW+vjTYcj6ptpVcXuWCrIsc9w7rMSfrznNWkcUNmqPqltmwh9Y97XhLt/0OyAVk+kCsAZlVlGxMXHzs/zF0g/pqFcpDR0SIagp/aRZyZf6YZh7tUYAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5/+h8DQaxXmrtDFmlqT/ufQosmSqXYb5LHt36NL1tU=;
 b=XGj/encXhWllqizPbF86Sc0Y5srgNMOkoSpyl+YGmCtUzzxgCUHWsMO6OfWlxKW0rdWjEsy9Pf8YCUhLh18qepjO/kPEcjfLI1na05wqWX4jb7bbe5S+sPL9NxtSRTA6bZ21fy1jlxCCGno76X3ySNdzhF7rLWbHQo6s/jwbRF14dHTM70ZBzVMqTRJtbfKlm8YPqBmtFvG+oK24WSzYks+EQNV3yGvMUVJeVX9YqF5DoSATSlOCzYSsAiuGKi9ilJhzScBtYTDRZGAq/f/jvI4PUjYFgjhVFJ/CN8aBKWTJKU20lhzKG5dFr/LXQ7slCYDTP+EJV/gU9H8CNKHONg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5/+h8DQaxXmrtDFmlqT/ufQosmSqXYb5LHt36NL1tU=;
 b=f2ko7A7OEVb18fDO5Uhs8Gue6v4W6XakbC0BjWEnjUdCFXM6CMEnERTLS3VjuhEV8P3KDKqZLwkvrlriM2j7mnUFjgHnAAOFFrpTXew7+zOeRMWSekBiW1uWRBkenf0NqCcgjD3Ap1HcyOLqRl+mJiNwlrH/u4iZBG0HYCSC/m3z87NuGQfAZ1bJfjzk724GAkt6U++BgATuycDbZ6yfh7KhUI6zkk6diuBPd56MXdu3+t6shyk1hHI1RcyLVp/VO2bY6P1eDQgUtWh3IUYifFmtDpe4pB/KtMmZ4elnn0IzbEnhRB7wK9uYIweD3ilYyZhi8JI9yKg2mApvmMCiIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:24:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 06:24:20 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 15:24:17 +0900
Message-Id: <DDJJ5745OETR.3TXR3ZVYM4E8T@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 07/14] gpu: nova-core: gsp: Add GSP command queue
 handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-8-apopple@nvidia.com>
In-Reply-To: <20251013062041.1639529-8-apopple@nvidia.com>
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e85b56-2e0e-4f71-7f0d-08de0c7ca416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qkx2T25hbjFJSlJWcmJ0U3pRMUdkU2xjcnIvSFoxSFVoY2ExSzdRVTM0MElR?=
 =?utf-8?B?NjE3OGt0T1gyVEJ0VEVZUk5yNWRENzFyeGhMbkdvcWlWdkxEUHdONXd3NXZN?=
 =?utf-8?B?RjdsbjNjbVZVNnpseFVtd1RWNDlFeS9JRlZ5ZmRJZTF1VjdKcVpQQU83UDV2?=
 =?utf-8?B?NmJTeG56bWZVWHYyTDl6UGZGcW9GYjJvZGs2WHB5KzRKZzVPNW5zQjNXOWtL?=
 =?utf-8?B?NW1DSmNZTkxqTVpIcEwyYWF6OVdHQ0NrTnExa1h6NDQxS1BUNXlqTklrb0da?=
 =?utf-8?B?TEtHK3p4MmhNa3RoZDlwNzQ4L2hmbEc3VzRKRVhjaVdwa3hJU1ZtQVhIM2Fw?=
 =?utf-8?B?cksxUFBEQjc0QnRlRSt3dzMrRmhqMTVkQW5COVFNeDdHNHFOR1dJUjRQa21i?=
 =?utf-8?B?QXk0ZzhJdXFLaFU1Znk0VVNmdVRkOFlDTmNoS0tZZVBLZHBFcGVXZ3dGdW01?=
 =?utf-8?B?bi9hOWdSLzcvUFNDaHJBUjU4QU9ucGZDbmlmRkQzR1Z5MjRtTTF2Ujg2c2xV?=
 =?utf-8?B?Z1lEN1RSRWJCT0c0OWNQaFBKVkl6RHYxUU9CUDBDVWUvQkR3UEptS0tYdXpJ?=
 =?utf-8?B?RWxtYkRYM1krTFZ2M0pzTUtmQkp4TUZxNWhvVmcyOXRlYWRnK2JIaXlvN09K?=
 =?utf-8?B?Ulk1bzRPRDI2L3Fmb05HTEF6cllodVlJQSt6MkVTREEwSnBtOENjOE1QdldS?=
 =?utf-8?B?SU91Y0ZuQkRhR1BtRE5JVzVaY045MUtGejFpdGR3K0NRcWpqUkpkdTRDNUFE?=
 =?utf-8?B?T2VYWExvNVRXVHdydFJMQjQxSHNKYW54NXU1cFBkY3Zib2IzK25jcHcwc05x?=
 =?utf-8?B?QkdXWW1PMHBrMmQ2MU9tUlNxVkd2YUV6M0FxQXhWR09ub3JsclFpWm5pdDds?=
 =?utf-8?B?Y2VRNU96NVpFa05jYktrVm1OU2owZUwvYXZrSmE5dE8wTzA3RWpNdEJZVGV3?=
 =?utf-8?B?bFpaV3RvN0JzNXAxb0JpUm5hTWtEK2RENGRtU2dMaXkrdjVwS3hiSTNQeVMz?=
 =?utf-8?B?UGVXWERmend0RWdNcDVwc2szV0NPMGZQbldPcTJnQXpmUmxGNW40RGJ3ek1q?=
 =?utf-8?B?R2VON2pzWGcvNjU0K3ZUQUFqb05OanlDWWpwYmRiMVFWaWxzdlVPTkdaQ3d5?=
 =?utf-8?B?dEh6bk0rQ0JWQ0IxQURJWnN1T1J4bW5UalRnZk5kT3l1Und2dk9pR1kwOGdt?=
 =?utf-8?B?L3ZkVjFVaEh6Nm5NT3hrT0pSZlVNb1VjK3hpRWZ4RHh5aVhVQyt2ZmpKVmdw?=
 =?utf-8?B?SzlJWGpiMnErcy9VZWtUK0Y1VWZTMllLcGFLV3dlaUtqejN4K3ppL201VG96?=
 =?utf-8?B?U3pPd0RUTVdSakhaSStmRCtKcDdhNnljRlVQdy9XcW0yZWw1VGp5OGhpL213?=
 =?utf-8?B?K3BTUTVRYWN5WmRhRVM4dnhCMGtWT2F6bTR6czN4WjI0bEEvRVl6aGczZ2ZR?=
 =?utf-8?B?VnhMd2c4VjB0aitTVEgyUGlHdlJMbkZTaVJ1UnZ6eDFaemFkYXB5RCsxRUtm?=
 =?utf-8?B?c2VTYVU0NUJWVGdJbGZ2SU5pWk5ud0dtZEt0R1IwNXh0NXhxNXZwSXJNc3Z6?=
 =?utf-8?B?eXc2d0JzTEdNUHR0U1ZJQXBSdi8vL05RTVQ3Vmh3Rnc2cDJMZVFTYzFxUGMw?=
 =?utf-8?B?UmMwcm5VSVhBRDhMYW96RzVsN1I3Z2FwMGJPR2VyUk1KMXFVWlh2Y053UkRt?=
 =?utf-8?B?dFpERmJzTi9jeEd6RkJaUitVMkRmRDlRM2VOREtHWTBDV3llVVRUVkZqb0lS?=
 =?utf-8?B?Q0NuU3VjSUhaT2pLMjRSVm5ITkVlRk9BT09rbWlNb3VZK1VtNWZlMHVTMGdv?=
 =?utf-8?B?WkJxQjdXd3hVQVhOOHR2bEQvcUVjRE1YQXdITnc2bGV1dklqMU9Ja0hPR0tG?=
 =?utf-8?B?LzRyM1FqWkRjSXFZRzMyVzZWbDZhNk00M3VENGpaRE9kd0FWQWZLeld3UHpR?=
 =?utf-8?Q?P5OOi1Nu16eIwhGVGxjjlYnpX6Aa3/I2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WS9uMkY0Q1NKTmVwam5tTi9JOXk2TE5iK0dlWExNNzR4OWJIN3NzVVRpeVhy?=
 =?utf-8?B?VC9pK1V3cVdnUUh5c0tHVVJ1cTVkVS9xR1luQ0Z0UUdhK0FpeDR2S0Z5WTN5?=
 =?utf-8?B?a2w4c3NkcGFEQXB4b0hhSy9NYmtYRjQ1N1RDYUVrb08xM0JmK3FWVjZDNkdQ?=
 =?utf-8?B?SWJTc2JPbExJOGtqcldSbndZNUdtREIrVkhRaldrODFOVW0vaGhkQVJZWkJV?=
 =?utf-8?B?aUN4N05KMmFPN3I1eHY1Q0M4WDNCTW10VjBTZXo3TTFKNDZ5aWhVdjFPQUpu?=
 =?utf-8?B?RnpCSGRWcnJoRlQ4UE5scXBXQStzd2VHaU8xdmR0VWFZdEp5dC9TQ1JGV05I?=
 =?utf-8?B?b09ZRTRNU1B0ZWtPOGx5S2RsU1huSklXTmFsd01URlk0aTBaU0Y3LzViUlMw?=
 =?utf-8?B?VUk4YVF1enM5VTBMZEdyS0UxOS9rOGlNVXREN0pOdExraVEwTkFibDd2aE1r?=
 =?utf-8?B?eW0xcmlGc3RObGQzd2tHUDNxVmNQeGJKM3E3dzRMOXVQNFNSOGpNUzNMMktZ?=
 =?utf-8?B?YUpJV0k4ZVd6aTBqNVBIWGZWeUJwS25PeEpFS3haV29QMWs2UVlKeGtxY0R4?=
 =?utf-8?B?OGxZVG1abEhMYU1TZGN1bFJBVkE0b2Fvd0pkRmF4bEpkV0JRTkxQYnRzZ2hv?=
 =?utf-8?B?SmIxUnpmYjM0RkhSMGlxcFVpVzJIRmo4RkxwQjlqUEdjTUJEYzZNeFhGZjh4?=
 =?utf-8?B?cmV1N01zMHdudXRpWitNS2NONWs1Uk9SUFJ0elZoU0NSSHRRRUtzMTdqMytV?=
 =?utf-8?B?MytJdHl5dHVoYjNCR0c2S2NoTW5RMGZZbVo3dFgyd0ZIMGdqRWJmLzcvVUJL?=
 =?utf-8?B?dEo5YTlTaERNNnhkWE9nRm1xWmRHYUdadnlDOFFVOUNaa1haV0ZvUjJJZG1i?=
 =?utf-8?B?TG5hYTdTeHdGT292UEhCYzNRNEJBek5OMHBad1JDUjJFeDhxa0UzYVVEVDJ2?=
 =?utf-8?B?M2pMcVJWQmwzdXNiczdlM3cvQmRjY3Ayb0NCOFQ1OHpkb3NaSWlqWllTajhS?=
 =?utf-8?B?Kys5RjREd01xN25xdkdJWE9sdU5INjhWSTI1QnNHQ3ZBY2Z2Z2NaTEpjbFh0?=
 =?utf-8?B?bldybDVCay93S3NsbW1aMy90THdOcnBJbTRiQXlGemNkcjRYYW8xa1NoOHRO?=
 =?utf-8?B?UXBFK3dyaEZyWkd3emJTd1FpdXBjUWpyaEVsdXNMYWRhQWlYeTJ4OUpsbVMy?=
 =?utf-8?B?Zk52d3d2QW1XOEgwMU55T3BIYjFZZW9Hck05WHFJbVk5RnRmdjJhelFHQVYz?=
 =?utf-8?B?aVNHQTBocy9CcXpxSlpYVzNtb0pVbGUzRzBKbkRsanRQVkNlU1ZhNzg2WlVV?=
 =?utf-8?B?YjNmMXY2ZmQ1ODl3VmFkMEtmZUFWT3dJakhYVmpscDVYQ0NDRjB5d1RuYjUw?=
 =?utf-8?B?K3ViR1ZuRy83N0FjMkZnYStkNk5jdVRmWXFCWFFDRmFYQUtpVnFsSHRMTkdM?=
 =?utf-8?B?a2c3WUl0TUYraSsrTXNLdmhsV0ZrcjBrWkNpWXB5MWNLTVhxNmpjN2lxSEI0?=
 =?utf-8?B?eENYbE9qc0c3NEpsWWFVOXgrTVM2TzF2ZHpZUURjUXBQclBqc09Ja1lOUm9q?=
 =?utf-8?B?MVZCNlN3Lzl4anFQT0doM3RSLy9sTHZMbGJXTjF4NVAzcG9LTSs4K1pOQ2dV?=
 =?utf-8?B?MDRTTUpwNnNROVp4KzhiN1N1dW5odU5tSS9WSWp2aUZ4bmdIVWRXQmNhMXJx?=
 =?utf-8?B?L0laQmoyaVRnNFVjdFVPRmx6a2FNdUdFL3BZeWRYc1B2ODVSbjFtMjBjTDNK?=
 =?utf-8?B?T1hxM3c5d0huOEtnb1R2SjJvY3YrVnhXZ2p0WGF1Z3dRcSt0S2hDU002c2dk?=
 =?utf-8?B?aEVxMGpGUm8zSXBXVE9yL2FTczNRRGJvMVdqMndVL0ZaZzZBUHFVR1lqeHYx?=
 =?utf-8?B?TDNONzljaEhPTXFHcHlJeVlBS0xNVXY1d2swSjN3Tk95TW1scUFmOWtjYTlw?=
 =?utf-8?B?UFNPQlYyS1hNazIzV05XUlhWMUE0WFhFWWIrS2tWQjlPVlNuOFg1WlRYMEVk?=
 =?utf-8?B?LzE0M1BkM3M2aFRmYW1leWVrbXNLS0FYTUo5TEE5dDB0N2daaEpsWEpWeXR5?=
 =?utf-8?B?ODVGWkpJNllBSm1XYmFSekk3bnJRQXVxeXNRRWU5N01nSGJrQ3B3WkREeFJC?=
 =?utf-8?B?MmIzY2dZUjhnRXJ4ZlRJbTMyMk1BOW4vYk9tQTVJdXJhamVXT2gxNWwzQ1Zv?=
 =?utf-8?Q?IqBHhOPF76hfsl8t1aOxFUjppZhpOofcodmABJp9Asfm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e85b56-2e0e-4f71-7f0d-08de0c7ca416
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:24:20.3226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/R1VXy/TQ5x5V11JyBod0NB+WsjvIwEWkScMgEHFujw+2lIXUj/c7ti2swgcp1opDrlCPAYAvyvBuUNn+0Maw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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

On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> This commit introduces core infrastructure for handling GSP command and
> message queues in the nova-core driver. The command queue system enables
> bidirectional communication between the host driver and GSP firmware
> through a remote message passing interface.
>
> The interface is based on passing serialised data structures over a ring
> buffer with separate transmit and receive queues. Commands are sent by
> writing to the CPU transmit queue and waiting for completion via the
> receive queue.
>
> To ensure safety mutable or immutable (depending on whether it is a send
> or receive operation) references are taken on the command queue when
> allocating the message to write/read to. This ensures message memory
> remains valid and the command queue can't be mutated whilst an operation
> is in progress.
>
> Currently this is only used by the probe() routine and therefore can
> only used by a single thread of execution. Locking to enable safe access
> from multiple threads will be introduced in a future series when that
> becomes necessary.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes for v4:
>  - Use read_poll_timeout() instead of wait_on()
>  - Switch to using `init!` (Thanks Alex for figuring out the
>    required workarounds)
>  - Pass the enum type into the RPC bindings instead of a raw u32
>  - Fixup the TODOs for extracting/allocating the send command regions
>  - Split the sending functions into one taking just a command struct and
>    another taking a command struct with extra payload
>
> Changes for v3:
>  - Reduce the receive payloads to the correct size
>  - Use opaque bindings
>  - Clean up of the command queue PTE creation
>  - Add an enum for the GSP functions
>  - Rename GspCommandToGsp and GspMessageFromGsp
>  - Rename GspCmdq
>  - Add function to notify GSP of updated queue pointers
>  - Inline driver area access functions
>  - Fixup receive area calculations
>
> Changes for v2:
>  - Rebased on Alex's latest series
> ---
>  drivers/gpu/nova-core/gsp.rs      |   9 +
>  drivers/gpu/nova-core/gsp/cmdq.rs | 493 ++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/regs.rs     |   4 +
>  drivers/gpu/nova-core/sbuffer.rs  |   2 -
>  scripts/Makefile.build            |   2 +-
>  5 files changed, 507 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 554eb1a34ee7..1d472c5fad7a 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -2,6 +2,7 @@
> =20
>  mod boot;
> =20
> +use kernel::alloc::flags::GFP_KERNEL;

This import should not be needed, `GFP_KERNEL` being part of the
prelude.

>  use kernel::device;
>  use kernel::dma::CoherentAllocation;
>  use kernel::dma::DmaAddress;
> @@ -11,6 +12,7 @@
>  use kernel::transmute::AsBytes;
> =20
>  use crate::fb::FbLayout;
> +use crate::gsp::cmdq::Cmdq;
> =20
>  pub(crate) use fw::{GspFwWprMeta, LibosParams};
> =20
> @@ -18,6 +20,8 @@
> =20
>  use fw::LibosMemoryRegionInitArgument;
> =20
> +pub(crate) mod cmdq;
> +
>  pub(crate) const GSP_PAGE_SHIFT: usize =3D 12;
>  pub(crate) const GSP_PAGE_SIZE: usize =3D 1 << GSP_PAGE_SHIFT;
> =20
> @@ -31,6 +35,7 @@ pub(crate) struct Gsp {
>      loginit: LogBuffer,
>      logintr: LogBuffer,
>      logrm: LogBuffer,
> +    pub(crate) cmdq: Cmdq,
>  }
> =20
>  #[repr(C)]
> @@ -110,11 +115,15 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>=
) -> Result<impl PinInit<Self
>          let logrm =3D LogBuffer::new(dev)?;
>          dma_write!(libos[2] =3D LibosMemoryRegionInitArgument::new("LOGR=
M", &logrm.0)?)?;
> =20
> +        // Creates its own PTE array.
> +        let cmdq =3D Cmdq::new(dev)?;

I believe this comment is a leftover.

> +
>          Ok(try_pin_init!(Self {
>              libos,
>              loginit,
>              logintr,
>              logrm,
> +            cmdq,
>          }))
>      }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> new file mode 100644
> index 000000000000..3f8cb7a35922
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -0,0 +1,493 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::mem::offset_of;
> +use core::sync::atomic::fence;
> +use core::sync::atomic::Ordering;
> +
> +use kernel::alloc::flags::GFP_KERNEL;

This is one not needed either.

> +use kernel::device;
> +use kernel::dma::CoherentAllocation;
> +use kernel::dma_write;
> +use kernel::io::poll::read_poll_timeout;
> +use kernel::prelude::*;
> +use kernel::sync::aref::ARef;
> +use kernel::time::Delta;
> +use kernel::transmute::{AsBytes, FromBytes};
> +
> +use crate::driver::Bar0;
> +use crate::gsp::fw::{GspMsgElement, MsgFunction, MsgqRxHeader, MsgqTxHea=
der};
> +use crate::gsp::PteArray;
> +use crate::gsp::{GSP_PAGE_SHIFT, GSP_PAGE_SIZE};
> +use crate::regs::NV_PGSP_QUEUE_HEAD;

The custom with registers to just import the `regs` module and prefix
all registers with `regs::`.

> +use crate::sbuffer::SBufferIter;
> +
> +pub(crate) trait CommandToGsp: Sized + FromBytes + AsBytes {
> +    const FUNCTION: MsgFunction;
> +}
> +
> +pub(crate) trait CommandToGspWithPayload: CommandToGsp {}

Unfortunately this hierarchy won't work, because this way a command that
is expected to take a payload can be sent without any.

I'd suggest instead having a `CommandToGspBase` trait that sets the
FUNCTION, and have `CommandToGsp` and `CommandToGspWithPayload` require
it.

> +
> +pub(crate) trait MessageFromGsp: Sized + FromBytes + AsBytes {
> +    const FUNCTION: MsgFunction;
> +}

Just a bit of documentation for these new traits please. :)

(also applies to all undocumented types/methods in this file)

<snip>
> +impl DmaGspMem {
> +    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
> +        const MSGQ_SIZE: u32 =3D size_of::<Msgq>() as u32;
> +        const RX_HDR_OFF: u32 =3D offset_of!(Msgq, rx) as u32;
> +
> +        let gsp_mem =3D
> +            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KER=
NEL | __GFP_ZERO)?;
> +        dma_write!(gsp_mem[0].ptes =3D PteArray::new(gsp_mem.dma_handle(=
))?)?;
> +        dma_write!(gsp_mem[0].cpuq.tx =3D MsgqTxHeader::new(MSGQ_SIZE, R=
X_HDR_OFF, MSGQ_NUM_PAGES))?;
> +        dma_write!(gsp_mem[0].cpuq.rx =3D MsgqRxHeader::new())?;
> +
> +        Ok(Self(gsp_mem))
> +    }
> +
> +    // Allocates the various regions for the command and reduces the pay=
load size
> +    // to match what is needed for the command.

Let's also explain what the elements in the returned tuple are.

> +    //
> +    // # Errors
> +    //
> +    // Returns `Err(EAGAIN)` if the driver area is too small to hold the
> +    // requested command.
> +    fn allocate_command_regions<'a, M: CommandToGsp>(
> +        &'a mut self,
> +        payload_size: usize,
> +    ) -> Result<(&'a mut GspMsgElement, &'a mut M, &'a mut [u8], &'a mut=
 [u8])> {
> +        let driver_area =3D self.driver_write_area();
> +        let msg_size =3D size_of::<GspMsgElement>() + size_of::<M>() + p=
ayload_size;
> +        let driver_area_size =3D (driver_area.0.len() + driver_area.1.le=
n()) << GSP_PAGE_SHIFT;
> +
> +        if msg_size > driver_area_size {
> +            return Err(EAGAIN);
> +        }
> +
> +        #[allow(clippy::incompatible_msrv)]
> +        let (msg_header_slice, slice_1) =3D driver_area
> +            .0
> +            .as_flattened_mut()

We are going to have a slight problem here. `as_flattened_mut` is only
available since Rust 1.80... and we need to support 1.78.

I suppose we could work this around by defining a custom function tht
just calls `as_flattened_mut` in Rust versions that support it and
provides an alternative implementation for those that don't, but I
wonder whether there is a better way.

> +            .split_at_mut(size_of::<GspMsgElement>());
> +        let msg_header =3D GspMsgElement::from_bytes_mut(msg_header_slic=
e).ok_or(EINVAL)?;
> +        let (cmd_slice, payload_1) =3D slice_1.split_at_mut(size_of::<M>=
());
> +        let cmd =3D M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
> +
> +        #[allow(clippy::incompatible_msrv)]
> +        let payload_2 =3D driver_area.1.as_flattened_mut();
> +
> +        let (payload_1, payload_2) =3D if payload_1.len() > payload_size=
 {
> +            // Payload fits entirely in payload_1
> +            (&mut payload_1[..payload_size], &mut payload_2[0..0])
> +        } else {
> +            // Need all of payload_1 and some of payload_2
> +            let payload_2_len =3D payload_size - payload_1.len();
> +            (payload_1, &mut payload_2[..payload_2_len])
> +        };
> +
> +        Ok((msg_header, cmd, payload_1, payload_2))
> +    }

We should probably add a few comments in this function to explain the
steps, otherwise it can be a bit difficult to parse.

> +    fn calculate_checksum<T: Iterator<Item =3D u8>>(it: T) -> u32 {
> +        let sum64 =3D it
> +            .enumerate()
> +            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
> +            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_lef=
t(rol));
> +
> +        ((sum64 >> 32) as u32) ^ (sum64 as u32)
> +    }
> +
> +    // Notify GSP that we have updated the command queue pointers.
> +    fn notify_gsp(bar: &Bar0) {
> +        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
> +    }

Can we move this method to `regs.rs`, as an impl block of
`NV_PGSP_QUEUE_HEAD`? It makes more sense to have it there imho.

> +
> +    #[expect(unused)]
> +    pub(crate) fn send_gsp_command<M, E>(&mut self, bar: &Bar0, init: im=
pl Init<M, E>) -> Result
> +    where
> +        M: CommandToGsp,
> +        // This allows all error types, including `Infallible`, to be us=
ed with `init`. Without
> +        // this we cannot use regular stack objects as `init` since thei=
r `Init` implementation
> +        // does not return any error.
> +        Error: From<E>,
> +    {
> +        #[repr(C)]
> +        struct FullCommand<M> {
> +            hdr: GspMsgElement,
> +            cmd: M,
> +        }
> +        let (msg_header, cmd, _, _) =3D self.gsp_mem.allocate_command_re=
gions::<M>(0)?;
> +
> +        let seq =3D self.seq;
> +        let initializer =3D try_init!(FullCommand {
> +            hdr <- GspMsgElement::init(seq, size_of::<M>(), M::FUNCTION)=
,
> +            cmd <- init,
> +        });
> +
> +        // Fill the header and command in-place.
> +        // SAFETY:
> +        //  - allocate_command_regions guarantees msg_header points to e=
nough
> +        //    space in the command queue to contain FullCommand
> +        //  - __init ensures the command header and struct a fully initi=
alized
> +        unsafe {
> +            initializer.__init(msg_header.as_bytes_mut().as_mut_ptr().ca=
st())?;
> +        }
> +
> +        msg_header.set_checksum(Cmdq::calculate_checksum(SBufferIter::ne=
w_reader([
> +            msg_header.as_bytes(),
> +            cmd.as_bytes(),
> +        ])));
> +
> +        dev_info!(
> +            &self.dev,
> +            "GSP RPC: send: seq# {}, function=3D0x{:x} ({}), length=3D0x=
{:x}\n",
> +            self.seq,
> +            msg_header.function_number(),
> +            msg_header.function()?,
> +            msg_header.length(),
> +        );
> +
> +        let elem_count =3D msg_header.element_count();
> +        self.seq +=3D 1;
> +        self.gsp_mem.advance_cpu_write_ptr(elem_count);
> +        Cmdq::notify_gsp(bar);
> +
> +        Ok(())
> +    }
> +
> +    #[expect(unused)]
> +    pub(crate) fn send_gsp_command_with_payload<M, E>(
> +        &mut self,
> +        bar: &Bar0,
> +        payload_size: usize,
> +        init: impl Init<M, E>,
> +        init_payload: impl FnOnce(SBufferIter<core::array::IntoIter<&mut=
 [u8], 2>>) -> Result,
> +    ) -> Result
> +    where
> +        M: CommandToGspWithPayload,
> +        // This allows all error types, including `Infallible`, to be us=
ed with `init`. Without
> +        // this we cannot use regular stack objects as `init` since thei=
r `Init` implementation
> +        // does not return any error.
> +        Error: From<E>,
> +    {
> +        #[repr(C)]
> +        struct FullCommand<M> {
> +            hdr: GspMsgElement,
> +            cmd: M,
> +        }
> +        let (msg_header, cmd, payload_1, payload_2) =3D
> +            self.gsp_mem.allocate_command_regions::<M>(payload_size)?;
> +
> +        let seq =3D self.seq;
> +        let initializer =3D try_init!(FullCommand {
> +            hdr <- GspMsgElement::init(seq, size_of::<M>() + payload_siz=
e, M::FUNCTION),
> +            cmd <- init,
> +        });
> +
> +        // Fill the header and command in-place.
> +        // SAFETY:
> +        //  - allocate_command_regions guarantees msg_header points to e=
nough
> +        //    space in the command queue to contain FullCommand
> +        //  - __init ensures the command header and struct a fully initi=
alized
> +        unsafe {
> +            initializer.__init(msg_header.as_bytes_mut().as_mut_ptr().ca=
st())?;
> +        }
> +
> +        // Fill the payload
> +        let sbuffer =3D SBufferIter::new_writer([&mut payload_1[..], &mu=
t payload_2[..]]);
> +        init_payload(sbuffer)?;
> +
> +        msg_header.set_checksum(Cmdq::calculate_checksum(SBufferIter::ne=
w_reader([
> +            msg_header.as_bytes(),
> +            cmd.as_bytes(),
> +            payload_1,
> +            payload_2,
> +        ])));
> +
> +        dev_info!(
> +            &self.dev,
> +            "GSP RPC: send: seq# {}, function=3D0x{:x} ({}), length=3D0x=
{:x}\n",
> +            self.seq,
> +            msg_header.function_number(),
> +            msg_header.function()?,
> +            msg_header.length(),
> +        );
> +
> +        let elem_count =3D msg_header.element_count();
> +        self.seq +=3D 1;
> +        self.gsp_mem.advance_cpu_write_ptr(elem_count);
> +        Cmdq::notify_gsp(bar);
> +
> +        Ok(())
> +    }

I think we can factorize most of `send_gsp_command` and
`send_gsp_command_with_payload` into a private method that requires a
`CommandToGspBase` and takes the same parameters as
`send_gsp_command_with_payload`. All it would need to do when called
from `send_gsp_command` is take a closure that doesn't write any
payload.

> +
> +    #[expect(unused)]
> +    pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
> +        &mut self,
> +        timeout: Delta,
> +        init: impl FnOnce(&M, SBufferIter<core::array::IntoIter<&[u8], 2=
>>) -> Result<R>,
> +    ) -> Result<R> {
> +        let driver_area =3D read_poll_timeout(
> +            || Ok(self.gsp_mem.driver_read_area()),
> +            |driver_area: &(&[[u8; 4096]], &[[u8; 4096]])| !driver_area.=
0.is_empty(),
> +            Delta::from_millis(10),
> +            timeout,
> +        )?;
> +
> +        #[allow(clippy::incompatible_msrv)]
> +        let (msg_header_slice, slice_1) =3D driver_area
> +            .0
> +            .as_flattened()
> +            .split_at(size_of::<GspMsgElement>());
> +        let msg_header =3D GspMsgElement::from_bytes(msg_header_slice).o=
k_or(EIO)?;
> +        if msg_header.length() < size_of::<M>() as u32 {
> +            return Err(EIO);
> +        }
> +
> +        let function: MsgFunction =3D msg_header.function().map_err(|_| =
{
> +            dev_info!(
> +                self.dev,
> +                "GSP RPC: receive: seq# {}, bad function=3D0x{:x}, lengt=
h=3D0x{:x}\n",
> +                msg_header.sequence(),
> +                msg_header.function_number(),
> +                msg_header.length(),
> +            );
> +            EIO
> +        })?;
> +
> +        // Log RPC receive with message type decoding
> +        dev_info!(
> +            self.dev,
> +            "GSP RPC: receive: seq# {}, function=3D0x{:x} ({}), length=
=3D0x{:x}\n",
> +            msg_header.sequence(),
> +            msg_header.function_number(),
> +            function,
> +            msg_header.length(),
> +        );
> +
> +        let (cmd_slice, payload_1) =3D slice_1.split_at(size_of::<M>());
> +        #[allow(clippy::incompatible_msrv)]
> +        let payload_2 =3D driver_area.1.as_flattened();
> +
> +        // Cut the payload slice(s) down to the actual length of the pay=
load.
> +        let (cmd_payload_1, cmd_payload_2) =3D
> +            if payload_1.len() > msg_header.length() as usize - size_of:=
:<M>() {
> +                (
> +                    payload_1
> +                        .split_at(msg_header.length() as usize - size_of=
::<M>())
> +                        .0,
> +                    &payload_2[0..0],
> +                )
> +            } else {
> +                (
> +                    payload_1,
> +                    payload_2
> +                        .split_at(msg_header.length() as usize - size_of=
::<M>() - payload_1.len())
> +                        .0,
> +                )
> +            };
> +
> +        if Cmdq::calculate_checksum(SBufferIter::new_reader([
> +            msg_header.as_bytes(),
> +            cmd_slice,
> +            cmd_payload_1,
> +            cmd_payload_2,
> +        ])) !=3D 0
> +        {
> +            dev_err!(
> +                self.dev,
> +                "GSP RPC: receive: Call {} - bad checksum",
> +                msg_header.sequence()
> +            );
> +            return Err(EIO);
> +        }
> +
> +        let result =3D if function =3D=3D M::FUNCTION {
> +            let cmd =3D M::from_bytes(cmd_slice).ok_or(EINVAL)?;
> +            let sbuffer =3D SBufferIter::new_reader([cmd_payload_1, cmd_=
payload_2]);
> +            init(cmd, sbuffer)
> +        } else {
> +            Err(ERANGE)
> +        };
> +
> +        self.gsp_mem
> +            .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_=
SIZE as u32));
> +        result
> +    }

Here we probably also want to comment the different steps a bit.

