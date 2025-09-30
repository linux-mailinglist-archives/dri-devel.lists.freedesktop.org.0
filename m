Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE80BACC4B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 14:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A95110E5A2;
	Tue, 30 Sep 2025 12:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hFVMNPD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5A110E5A2;
 Tue, 30 Sep 2025 12:03:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWGf740MCtKmJYJFaRf37GWBdMkdB2Iq5fyjW2O7JjVC6oO7P0mzpVAtVuzdDP+TRdUpCNY9zgeDeU88hmFMvASGH5xx7L9Yt/IfxVvf7rXlk5LBsO1FmEeO609FjysFUTf1Yv7ncx7NVkPdxVsr1gZ3V/ewQoMtN+arp7IAlJ1J8D1EBkD/C4O7E6RCuQXDXO7/R2cywhwmCm+NlQfozPppxm8v1RcnNvdirDuU7wCx8rJlL90WwSOF4jvKToXMTF/fauJZIWBz1AQUTGdj37DSZVlSuh2EfLItZQZY5NjvPeKlKSAQbiaG7hSytYjI7ESZYRX1il3o0LM/pLeEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTC5pb3RkzzurJWWEuVW4L6OO0O+N77f1aIOBVgIvCE=;
 b=zDzkhAkiJgXvpN7QCPbSAd3BVY2rKoOdQ5z7oSEUa3YcrvQFVEFc4MUaXojku1t1An6R2OItg82OPinezf6Z0oLSvocPRRwTA3KKejj7xe3qf3A2wj8EafeCMY6DpblxCYakRgL03YlvCJvNzERd463i+8KXCLul4coYGckVEFXwfDMSHir8SWi6n9PT5AEGljAH5j1BZnZXjF6SffhZvFms5xjJqrkcjuQFEo7pF04emMFexlrH1Clbx7lGI+rb7W/hulBoJXoGg2Me78FDuvbCWCm6gTixk+MkMBluIAchTu88NLVg51h3W6IYTKuD4w+ylJE1hUg2ZxFaYMvsew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTC5pb3RkzzurJWWEuVW4L6OO0O+N77f1aIOBVgIvCE=;
 b=hFVMNPD8OWMLc0Wm4v3a51RPKJbHHq2ZcxoUsbaCiQdqhVIF4zJ3pV+2AcQFvrIT4KhuADhzUpWvx8/ATd3ZSVKGQ9LG1bBva3CvURTsK6iurUSAgafnckfhYKbSqqSoYkoUAmiQcWo95k60J1wZyq4733B000vP7nq7vZ0ulF+SYE43zwQ0yv1y2xbwM4f4+yj8saOIfROOaUphc/BRggyoBSIgCIip50RMlnqSAmO7laEZC0y6LTDO6b+HiTq4/dR7flap70V5ldYsJW6eEINEVomvuI0xDUskqiYuWjV+NWDgOtZKvayMYZxrspwi6wiIMkVY0/Iz6J/8CixQkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB7102.namprd12.prod.outlook.com (2603:10b6:806:29f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.25; Tue, 30 Sep
 2025 12:03:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 12:03:55 +0000
Date: Tue, 30 Sep 2025 08:03:54 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
Message-ID: <20250930120354.GA3415500@joelbox2>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
 <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
 <DD5D59FH4JTT.2G5WEXF3RBCQJ@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD5D59FH4JTT.2G5WEXF3RBCQJ@nvidia.com>
X-ClientProxiedBy: BN1PR12CA0029.namprd12.prod.outlook.com
 (2603:10b6:408:e1::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 43adbcf2-7f8a-4bbf-178b-08de00196e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUdGKzF5alBnNXpVdlpveG1PVkM0RGRqS2VaaXd1d0hnQmdJWEd0ZlJDa1RY?=
 =?utf-8?B?MXJZSkpLVlZGN0RPNGNnZjVPd0hidGZDU2N4Y3Y1WlYzV0JpRW9weUV5emhw?=
 =?utf-8?B?Vkk0N2pubG5WZU1hRS9zSHp3aDl0ajg2VmtPYXpuVXV4MVlLZXlySTc0OVZk?=
 =?utf-8?B?UmMrY2szR01tNnR3Q0tKcDdMS1RMZG01OVpDL0VMNW1oWWZITnpzTHl6QUk2?=
 =?utf-8?B?aGxMb3VaTWFWZzlpbUZFdFA0aW1WOURKdWp1S1U1bGVsUmthcWVYUlptVDRQ?=
 =?utf-8?B?OFByQTlrZFJxaEZVRjdjbHZoVVQxaisrVWNRcEc3MVhyVWIxaFVZYUFSb0Ev?=
 =?utf-8?B?dEhJMm5LQnEwbU9pc0c1TEdMenAxN2wwclhkZVF3QjFhVlkvVjYzNCt5MUtB?=
 =?utf-8?B?V0FOeklTSHhWSkdXemV5YmxnM2FVSkgySTZ4WlBqUEVqOW9FbHEvM0ZVSEV2?=
 =?utf-8?B?VGlMRVRETjFWb3MzVVlPaUh0d2xyNjVrTHVBZklwaUZuU3J4SHlmVzYwSzBR?=
 =?utf-8?B?c1FQY204SDUvbVIvY2FESEZpa3hFZEcrd3NJRFNHaEw4eFVScThpN0o4RGRO?=
 =?utf-8?B?QmlYaG1qMS8rdEhiVUljS1hKZXliWENad2pWOGpwcmxEcmhWUjBNTjJlMDdY?=
 =?utf-8?B?a2xzZGova1J3bTMyeGhaaUdXVEN5L1c4bjlBR1M3VEJlNnlVR0JuelhFSjFa?=
 =?utf-8?B?ek1lZHRxNUc2L2JYY2ZBYytrSzlOak4zdUx2bnRaK3Z5L250bUlHMlN0Wllo?=
 =?utf-8?B?YmYvWkhBejZFTmE0bkVHVklMY1daWlBRRFhhNzRWSTdINE5ZNE1FRWhOOHR6?=
 =?utf-8?B?TS9sLzlUMGVVTEVTZVFBdFlrdHBsSzg2VmU2STA5b0VZa2k0Q25PSmVYc1pZ?=
 =?utf-8?B?QzQvS1ExUkt6Y1NjWlZUNThmTWZNMVpjUVpXUyswSnFXOTMybmJaZ2RaaDI4?=
 =?utf-8?B?Ly9JZmNSbmFyTm9jN2t1Z09vSW1uWHVJMHYzVU5lVEFFa2VZOHJzM0V4dGZ1?=
 =?utf-8?B?akhNaEJPQkFiZU1VYXBnNERxaG11OE91dXJMY0hPRCsxeUt3ckJHR2s2eE5S?=
 =?utf-8?B?b2R4RW52bGVhRktrSUZOYWtUVm5wdUpUZUxTMDcyam80WCtxQkZCQjdkQnl0?=
 =?utf-8?B?dGwwaXZpODFEL2hnYTkzZDdwUzNrcEoza1ZrcE90T29lWTlYc0tZbElpTjVO?=
 =?utf-8?B?bzB3cHk5ODNCT2RLY29rTkVPVGpPWGFseXNycms4bXZjaU5MaUFrQ0s1ZzVv?=
 =?utf-8?B?QjlzUWxnSDE2czBWaXlQUjZhREpzSzRRenREczBsOHQwNlRaa21QT2tnMDYv?=
 =?utf-8?B?RUkyeUt6TlNFZUpPaTlORXFlNHNrOTFRejdBK1FqTVRlSWdVOGxEWU9aVi9m?=
 =?utf-8?B?M1RHOFRKVzRwZi9QWUFFSGFONmZzTUhrTktNUDRJQjBINEJZNUhyamtiVkh6?=
 =?utf-8?B?c21NaDlYdVhHMGV2ZnJuTTE0WWVDUENoMmxDbG9hVEZoYTJOZ1BWbHFzclox?=
 =?utf-8?B?aVRmcm1TUWdmaDMyeWtTcldjL2pBbyt3a2JtZ0JjNlRZalZzcUhvci91VGtN?=
 =?utf-8?B?Zk4zZjFLdHhOUlBHNkFOVWVzOER0OUxZVnkwZFB2bFNWeDZPOFJUMVZKSmV0?=
 =?utf-8?B?QllvaDRHNmppR2VhK3hINnpWUGRHbzRtVTIyOGNWNHpVK3ZBYTVEYkRHZTBj?=
 =?utf-8?B?NHFaOEFNa3V3UTBQMnl1ZmxsZnFrbnFWZkxWWnU0Vk1yaGJxNkFUS1VZQmpx?=
 =?utf-8?B?TWxXM05xLzFPOVlxTTM1WjJFVlNPWnR2bVNpVFZYMlZaWHBTeEVwVUtydFBH?=
 =?utf-8?B?K1lQSFRENEJvTkR2Vmg5dUt0b1hDSjJQYUkyNGxIMm9iaVhaTDZxei9RVVJW?=
 =?utf-8?B?ckhpTEhQdlEzUldsbFdiSCt5WHVtSlNaZGNTYmRRbnR5NDV4V0xDdnFzSEVq?=
 =?utf-8?Q?D+pglXwJaQDL1kc9Yv/l1LL2JAiRB5ZS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1FXa05OMXVHODNRWHhmWHkyU1ZocVUvd3VkNnJRZG9saE16NTV1QUJjSGdF?=
 =?utf-8?B?U3B3MnhzUWJNYXJSMWVhUTkrekFKL1MrZDVQUWZLemNJZDNOSFpLTHROQW1y?=
 =?utf-8?B?dHJVTjZUdGFXaVh0L3FISFJpWW81YVN6VzFycXUrblBIYnVHRGY0djMxUHpN?=
 =?utf-8?B?VXZNUS9jM0dZOXl1bEh3TFZXS1ErY2hpT0N2OGJHVVdMK0hvSWxvZjJnWHQ0?=
 =?utf-8?B?cW1xUEVrV1ZXLzk1OVh1eWJIMmwrZWdBUno5QzZLUWpTMUtCbXVMSjJtemZI?=
 =?utf-8?B?bEhRUXl1KzhhWkh0N0tJR3FJOWxBYUZCK05DNU1rMXpYODNpSS9KMEl5ektm?=
 =?utf-8?B?TmVTc1BZQVlrS3NLaUpQUkNTNnBXWXpESktMNmRjUHBWc1hzQkJBeG9tOVBo?=
 =?utf-8?B?amJVdGVWN0Y1Q0EzOWxGMm11OVNKVEU2MkdBaWZVZDdheVZ2R1JWMVhTOCtp?=
 =?utf-8?B?S0NxYTB4K2tnTnk2dmtQbG80V2xVZ2JnbTJCek9zY2ZZMXVQZWgwSDR0R3VF?=
 =?utf-8?B?R2Rtb2VLYVdsS0V2empLQS9IK0ZzSm5XMmFsTE9kY3grVjdJYnA1Qnk4U3d0?=
 =?utf-8?B?NXVuRjdXbGVzZXlUZmxNbkZJek1iS1p0V3ZCNWUvWll0dUtubDExajdjKzZR?=
 =?utf-8?B?TnB2SlBLSEY2Z2JRN201STM0RXFqTFlNOFJlTzg5VFgrRmpkUStrSDMwUHFG?=
 =?utf-8?B?dElneHVDU1dySDNDVEFuaEJ0T1JTRzZCK2MyN0xhZWdlYVhKa29OVERMSGRn?=
 =?utf-8?B?RkdON24vaFpQZUU0ZEpaWlhMUEVLWExmY2VzVm5Fb2RQQ1RQVmJ0TW5HU1ZE?=
 =?utf-8?B?Y1Z0VHVhMVkzNzkvSVc3TUhBNDJCNzFzclAyM21YeFUzY0ZqM2Q3enMzOHBw?=
 =?utf-8?B?bUtoclBNUlFnemFnNlQyR1BYYmE1TTlZcjU5cTlmT1dTMlVWbnRNS0NCdzUx?=
 =?utf-8?B?UXVycVRNKzAveTZXTDhZOEtnZXJQaExZeHpkdXNWbjVxZVZwZWxsVVFPUEdJ?=
 =?utf-8?B?MjBTWnpjMDdTbnhXOU5XU1N4cm9iVnJnRzVkSlM5MFNkRUpsUnNkeFRkUUli?=
 =?utf-8?B?UGV6b3pNTzdTSll5eEZYMkRwNG9pc1lpdVhNZXNDWkJ0UHM2RzNydWtQSTNJ?=
 =?utf-8?B?RjBISkJJWEt6OFpBT2YxNndjVEhSQ1hncktXdFdWQ3Vma3AzZGwxVmxuTzM0?=
 =?utf-8?B?TUJXeGZMRlBzUFh4bWNhcWxSRC9zcmRMMUdyT2RHc1FKbzE2WFNROTV5ZDNL?=
 =?utf-8?B?U1JZb0c0djZzQ2YvUjJIR0tIWUI0WFk1TjdiVUFTNktkTndGTGEzNnFXM3pI?=
 =?utf-8?B?WXdTWEN2ckdUVzFZU0hENGx1UUc1cEFKNXU3K3VwbUE0VHZha0FlMjAraUsz?=
 =?utf-8?B?T2dGUDFLUlJ6SndubE83bklHU2xlVERpVENQbEZwYXpIcm9BQjltTmxiMG1L?=
 =?utf-8?B?QTcxMnA3RlN4MlV4VkJiOEJlbXQwcDdzYWRjcXEzNWh4NkY2VWlPMlBabGFD?=
 =?utf-8?B?d0FpUkRzZWsyTWNHYVFySXEyVVppbCtsZWsyTG8yWkttVU1CbmJWMi9PKy9z?=
 =?utf-8?B?aVFwWDJFZDhxcmM3Y0xIeDhpdEFRZmVLZkYzRmpIS29iMzJ0a1Fwb0NUMXB0?=
 =?utf-8?B?L3F3YlpWM0M2VStSYi80ZzJQVHdwTkZYWENNaGxtbi8yNjNGQXlFblNqbE5Q?=
 =?utf-8?B?TmRGUzFpelhpWEVPUkUvbUtzT0FnZEgxZDhid05nbHMrTkU5R3FGb3B1RzFH?=
 =?utf-8?B?ODhvYnErQ2ZkQ2tYb0hIYTJRZUlTdlBmSGlXSFg0d1g5b2oyQnhJemYwNy9G?=
 =?utf-8?B?MklXS1ladXBjN1grb1B5K3JReWFMbzVLelFXMHJOdlhvK1lnU3M1RlY1WnIv?=
 =?utf-8?B?ZFRtd1VwTUl0MnZjMnNJWGJuYXp1M1dxblZiYjFIMVFYVkRZNHdjdDR0NmEr?=
 =?utf-8?B?eGZGYUZSWkNnYTBCa011ZjRtZlBIak5oYldpYnJVNlpzWUpiSGxDbUdadDdG?=
 =?utf-8?B?ZmJocjNBanVuRklBNHRBaXdMekI4aVdlTlhVSXhxQm9iRFIxcVJrdHFOMHJE?=
 =?utf-8?B?YUN0YnN6cnNramVYa2NENFZBd0NLVHJhWmI4aTNaSFZ0anpId04vM1B6MnU3?=
 =?utf-8?Q?vj4DrFsJLEtEB0T1/juQDF+dD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43adbcf2-7f8a-4bbf-178b-08de00196e27
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:03:55.7381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O20RFi5zwuoaOHZc39jPozTfbFBKTvctFDpoSSXeTi+W1hHM6smJ+RQzCbDPCGwy5STGUUxAJDifCMDjxa0ckQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7102
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

On Mon, Sep 29, 2025 at 11:44:56PM +0900, Alexandre Courbot wrote:
> On Mon Sep 29, 2025 at 10:59 PM JST, Miguel Ojeda wrote:
> > On Sat, Sep 20, 2025 at 8:23 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >>
> >> The bitfield macro's setter currently uses the From trait for type
> >> conversion, which is overly restrictive and prevents use cases such as
> >> narrowing conversions (e.g., u32 storage size to u8 field size) which
> >> aren't supported by From.
> >
> > Being restrictive is a good thing
> 
> On that note, I have been wondering whether we should not push the
> restriction up to having bounded primitive types with only a set number
> of bits valid, e.g. `bound_u8::<2>` is guaranteed to only contain values
> in the range `0..=3`.
> 
> Getters and setters would use these types depending on the number of
> bits of the field, meaning that a caller would have to validate the
> value they want to write if it does not implement e.g.
> `Into<bound_u8<2>>`.
> 
> A bit radical maybe, but correcness ensues. :)

In my v5, I will be rejecting setter inputs that are out of range. Do we have a
usecase where we want the inputs to exceed the bit width range? If not, let
us keep the API simple. I should probably post v5 today so we have a full
discussion on the same and get alignment from everyone.

Thanks
