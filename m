Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F49ABDE77
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A87410E4CD;
	Tue, 20 May 2025 15:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YqVVke4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC74E10E4CD;
 Tue, 20 May 2025 15:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThGlAuoLnK8UBywZuJDxvIllAzMlytvjT4Q5U/QballyOrXqr2CL8ZdWVCmWi34M9LZRhTTUaiCNx9PYyeBR9tjL1RTTRs1xRlrDjkMafy8u84yZ4Euj8JRWCvmyKsDvMHyEh7iLBnr+VDbwXjSO140/O8RXpaO9NouZ8RFiNcY/+6cMd/O6W1QlgHBGyKrdex6Kke2O5XiQBcLzFHx2I7q+QtHm/ElD6csDw0pBInXJU2IZIxi/1L3+DJHUqxZXL8lTK8vkQtBEk/6/L1rttK3q/p/w2RSMjJJ4BUjJuVyZOrdr/XaQjcSUWhf73ryIn4HDtZ+wXt7dEq4Lv4k3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4+mcAdJYOzf6+1nRidTuQw54TfPcu1O4WBA0+Cc6uQ=;
 b=fMjtc/57i8Ha9ukNO90XqveSFbbWGbS00zCz20MhiWLBkxnVgYBPSVTSIn3TulCB5YR6f0IHlivk0cUkFPuhG3Lx7oJUrXJuql4vUooMbRmVuAw1y38AF5htEWB7J83rMEsRYhI1TGFia8jcolRajhiHQh9ttCcl0AYTRCqKdqq1jBjwpkYal8TpyLESz1LNV5dG1LRbN+Dv3KKPp13nEzvsivD0FW/oHpzXL8Dy9xnqJaG35POUk+hPeFcgJGnngdMSV1RWjm40IeKAz3XxbF8+oxfR+SpWyH/6csvMgtv1gGYOLYKrFxRmOlZYLeCex2AUM2WjZ0nzVqsoVACafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4+mcAdJYOzf6+1nRidTuQw54TfPcu1O4WBA0+Cc6uQ=;
 b=YqVVke4AS3vXeqgtKRfYlb8eky1onxeK3MQxAf2QLviclzHcvRJgki33HG4A29DAW2AuaK9mgofK1pbDlgRP3YDET2mx1/EwSxsU2pag9c9jtpt87Zh3lNV9Vb0VbHSggzmNt1Sz/2GAqDmJH5cDZkKN0uvBlTM4nro+WCDMx9zhsp/ft87UlHRQG90fgrMELhdTCK2ol77J76r1DZzATVXCTVVxJCCiPoBCN/MqZGZ9jgMWkxPTLJOYIa8mkgZmqIDmXinHDiCqCf6KkDdrVPVtFKfB2fU+dOniKN5L9x1aSV33JXct47dVdxSUUdIzRbGukZYsAiIsbndJD4bIZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ0PR12MB6712.namprd12.prod.outlook.com (2603:10b6:a03:44e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Tue, 20 May
 2025 15:11:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 15:11:16 +0000
Message-ID: <bdb290d4-b369-4b8e-b78d-8c8d3cc07057@nvidia.com>
Date: Tue, 20 May 2025 11:11:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
 <aCxLyxcERNHKzfvI@cassiopeiae>
 <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com>
 <aCyZPUaPSks_DhTn@cassiopeiae>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aCyZPUaPSks_DhTn@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:208:236::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ0PR12MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 284855c7-250c-4a7d-c53f-08dd97b09151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHA2eDRkR003enRXTTRRZ0VRZWVPNkNvWEUzb2dxN3FyRkxleW5sRTEzdGZu?=
 =?utf-8?B?dzhzTTh4aGRoOER4MUxCMmp5ckVNWUQ4cmdRMDJNWlU0RHBLUXk5eXRsZDl5?=
 =?utf-8?B?cEt3cG1EQkRlcGFySERMUFF5L3RKemlveGw4cmNYazNXT0dlMmxINUcxazlp?=
 =?utf-8?B?bys4K2NydGp6S1dLWGFoemE1WnNiUjNNam5lU213dVpvdCtnZi9Rb1laRlZF?=
 =?utf-8?B?YXo1Z09uY1ZIeTRJOE1veHJTb3dPeGIyNDlRN2piRWpHMFEzakhQY0RRaE9m?=
 =?utf-8?B?VVZ6eml1WXFlSm5rMEc5dHNFVXFrVjRaNmxybFNJelhpODFKMHlNcHhUUFpC?=
 =?utf-8?B?YUlwSk9HT09weFdBVEV4MWF3eTFDU1JDOCt6dm1uN2o4YTR0ZnhGMEpjWXl6?=
 =?utf-8?B?RFVZS2NJVlJQYjRqQmtQTmt4NHBmUXRMSGRaakV4U0dhNW42eSt4QzVRTUtz?=
 =?utf-8?B?RXBHcE9NeTZ3RnBnQ3h3VjZsa2xxdno0R0lMU29zbGxTYzVQMnNnNE5UWVk3?=
 =?utf-8?B?aGQ5bnQwdnBsUVo3RFI5WExuU3VyU1ZtOEFFR25ZZlZsVzhDWjREa0VvRnpa?=
 =?utf-8?B?aEFkVFhBNzlJT3VWcThoRlNCZU9vN1BHZklYZEtQSVB2RGxCdWprcnhoaDk4?=
 =?utf-8?B?dXBRTmtDV3RYN3pBUVhjYjZHdkkrL01OWmFWbUJod3ZuekYrNXZVY1JvQ2xV?=
 =?utf-8?B?ajRid1FUTlhrQTYxTm1Nckc0QU9wQzM4Y1ROUnhDRmdGQzB1MDRJcERmOWRI?=
 =?utf-8?B?L0lFWkJlblZYV1lJbUFZVjQySWtvZFJFSGhXZmNad1RwSUcwcUpPclVMODRB?=
 =?utf-8?B?b3poWC81cXZsZkJ2RGhtSnBuSDZoTzlwK2tudjh1NlZsVm5ETS9OUGZ2cVRV?=
 =?utf-8?B?K1BMZDFmMngvVEFuQjFOYXdsNXQvZDdhTE9ZdkdtS2hRRGc0Szd6MTFCL3JD?=
 =?utf-8?B?YjdhSTBOcSt1bVBxbmlsN0R0UWc3Rm1JVXJhbVNkL1R1RUJML2xIOUo5TERY?=
 =?utf-8?B?dnpXWEhvL3poZjB3U2N3Ly9sTytWcDFRMDhmN3R5WHl0eEhFcndwM3RNSUVn?=
 =?utf-8?B?YVRiNkdzYWdJRVNyRnRQd0tNQnV0Q3g0NW1IcHdXSG16Wk1QWjNISWRZbDF6?=
 =?utf-8?B?T213ZEx4eUM0UEdOZlNYVDRnWFY3bjBHaHI4NkZJc0M4U1RnaVdxNmlDVzEy?=
 =?utf-8?B?Um5vWEJNZkQyMWdpMjluS1lPeUlORzE4MkZDcUNCeU5CdUlvWjJzTEFrR0gv?=
 =?utf-8?B?YUFDRm1heWVnZFhuVVpoSnRMU2pqQ2lDbkNyV2ZQMmIrZmZMNVF3MXR3bEdp?=
 =?utf-8?B?VFhaL1B5V3VKc05VMU1wK0dGUTVIMGpxbHpWaUEyQXVUK3MzWTdOSUZWNzdF?=
 =?utf-8?B?NFZvdmdmNloxSGhUK0dvSkYvUS8zM3ZuN3NlLzB0dTlKN2FUcFpRNkdVNkJx?=
 =?utf-8?B?cVhaL1ZPUkl1VEt5dXQrZUdibHJDSStKVDhTWW9oNlRvTmprQkNFdEltTE00?=
 =?utf-8?B?ZWVnRlNLaHNCOUhDVWJiOGhKZ3R4UFBXSUZUbTI2K1BhWXQvcCtYTHRZZ3Jw?=
 =?utf-8?B?QkNKcVNmQVFFRkQzYXVFcS9GbVRNTGh1d3VBOHM2aGhYUlh1UmN5RXViMEw4?=
 =?utf-8?B?UG90NkU4UW1QY3cxRHYxS1JrS082U04yT1JnUU00d2l2b05kY2laSE1oajBq?=
 =?utf-8?B?U1NjVUFjMHJVanZPa0VKM2RyeW8xcVRoVC8wRXYvd3FrQ2FrUEtnVVFzVURE?=
 =?utf-8?B?ZGd2cCsyME9ZdWtIWnprazJodHUyL1hWWk5yUEdScmZpWXNMYXV2a3hhQi9B?=
 =?utf-8?B?bi9Ed3hnWjdKM1FPaUoxNTl2NllCTjVPWTZNUVNmQ0ErR2RNQXFRZi9FdlJE?=
 =?utf-8?B?blZZYmZ6eE1DZ3BKbVRsSkxQN3daY0phY1pQeC92bzBIekVmMVRNc0ZkNUYx?=
 =?utf-8?Q?1/lEuDnGV+c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME8rMTc3bFhsd1M1aVh0bkl5S1ErNlE1MWFtWUx1cHVOVXVWUEVvWUV0cVZo?=
 =?utf-8?B?R1hwdWpiVVMrY0l0dnFJMjFOWm54WWlMNlc2QVFSdDhIc1A3TlNROHdqMUhB?=
 =?utf-8?B?RG9Xd0NnOUVHaG5TVmk4Z3JGUmRsUW41UGRDWEN4anl0LzZTL0tjS1c0Q05m?=
 =?utf-8?B?Q2xpeUZTZEVuT2UrdUNndTVLaDg5aXNLNjJ5U2FRcXVoRCs2ZmVWM2RrVllW?=
 =?utf-8?B?czRyMFNXd0ZXdXdjMnBvekJGZllDMFZsbDFVb0NGTGJlVFA2bkppSkFnNTBi?=
 =?utf-8?B?ZHQzdW1CbGc4L25BN3BjeE9IcWN0bjE3Q09DamwwU0JVSDdkOEg0Mm1YM09Y?=
 =?utf-8?B?TTZwdlkyK0Nua0NzVERjY3ZCUFB4bDFaRnphZ0t3REQzTTJPWUVvV2RiUHR2?=
 =?utf-8?B?T0dGVlN4aE1helhhVUlqZ0t6WHo3eFlGeUlmbll3NG85ZVFnY2pLdXV3T0h0?=
 =?utf-8?B?RDR0V0daSGorazIveXMxK3hiWVdEOU0yekpKWlR5cFh5SHM3d3BJVG9MRlp6?=
 =?utf-8?B?TkZtREhNejR4RENnVVNsVGtkdXhUbHNUcGJncjhXSEs5anZHOVkvMGFOZWts?=
 =?utf-8?B?dnc0VW45dnplOUlzcFI3TGd0dmpEMGQwbUZaT3pOdjNBUWMzc0lPTHFTSS9L?=
 =?utf-8?B?VW5hUjRocUNwLzY4Zjc0L2lweGZObUtjQzVYS290ZWlZUi9iWGFkWGZDSjlG?=
 =?utf-8?B?RjdpK3FlaGU0MEcxYlV5dzNxWUFhYVdYRXlRVzdkWkM1QmFGSnhHb294WnVs?=
 =?utf-8?B?RVZYY2crM1h1a1d1R3Yrb08xeUs2OVFEd3BBUldwN3hGd3hCeFgxYlRTdUhU?=
 =?utf-8?B?bnlLZlZ4ajUzV0JIa2dNSkJsSVhJSCt2ZGxCOWhwWkk4WUVQZnZwYkN1c2xI?=
 =?utf-8?B?c2tZbFY3Q2RNdzhqOGFKeVdsTk93ZG9TU2NUNVBKMUhrNUd6MXlBbTVaazc5?=
 =?utf-8?B?VUNWdER0SGQzN0V2S3ZpZDFHcWQ2VG90MkNKTE14MS9SQWNVemVtaE5FRmR1?=
 =?utf-8?B?ZjBieVduV1c1WHh3Q0kzeVZYMlEvYS9PNldYbzRoNXFGc3hHRDU1VXlKUVhw?=
 =?utf-8?B?UmtCRVRCajFlb1k4U0Q4M05zMGxNZEVjZm8rMlBEY0dLSlZRUjRXVzB4YUJ2?=
 =?utf-8?B?dUpvVDJMWkI5aG1tK0tocjErbThMamJRWndOYjNZeDhWWk0yQ3JoRTVpT28x?=
 =?utf-8?B?TGFLdm9NREtNdzlMb3YzcXpMUFFaNnRPWTg1SGtzMUhMaTMxS1R5UmxRYWxW?=
 =?utf-8?B?ZGJVcDdHeTVVRWU0Q0k5REc0bFpnem5UckV0WXluUmRXRWhKQWhXYWQwaEdD?=
 =?utf-8?B?NE54SWxENTEzTHRZQ2svL0plMGpZbUdhNGw2cHhNWGI5SnJ4MkdpSDBwYkl3?=
 =?utf-8?B?Q3FyTmgxcnNjSlVtb2w0WXZHMHBjbEx1S0NERlJEM2xmbHBXUWIwNUthK1NG?=
 =?utf-8?B?ejZub0pCa21vTTRyRUQwbEVwdVlObk8xMEUrL3I3Rm1OVTZOQzlOWHhEc2dp?=
 =?utf-8?B?MDg4eXlYUXQvOHNBc1ZqRXVmZHhldHc4NjJFRHkwUVh0a3Y4cGcvcENKZmQv?=
 =?utf-8?B?ZmVFK29TcFBHUFVFNVRVbDNlSGJKeGxXcU5QblN0clJBT1BBQmE5QUs2YlNn?=
 =?utf-8?B?YkZZNEhpdkp5QU9jU093dFdPemdaYkRtQ1Q1andRL1EzR0dObnlibXFHTDVY?=
 =?utf-8?B?UkdtUHROQ2xscGI4MS90OHZtY1BrLzFlNVZMUDhlRnBNeVBaUGN0dXdqRy9r?=
 =?utf-8?B?ZSt4WXNNdkF1Q1Q1czJiTjMweFdWTTJpbExwK0o5TkV4K0pvaCtJN3FYU2RL?=
 =?utf-8?B?SENxTC9WNjdIeGRBNkpoTGdkRFpremxDejdtZzArWm5WUE0vNi91YmpwUjRW?=
 =?utf-8?B?bHF2RFI5WjhtZ3FnR3RxVmxEV1hBWG5yNkpubXA0K1VSM1hQZmhHd1luQmJR?=
 =?utf-8?B?TENXVjZ2WmVSNHY4N3hIeE0xdXA0YTdwZlpmZVg4K2h5aDZWUHIzNk9ma0ht?=
 =?utf-8?B?bE4rZWlpNHZ5ZEEyb09oRHVZVGZna2l0VFd4NnZVem1Dcm9yRWQ0N2RWSEts?=
 =?utf-8?B?REdBQ3N1ZmtLMjRoNVFoTURxL09iaXpLbmROWGtyMzUzZFAxVndrR2xwZFN1?=
 =?utf-8?Q?WajUwgx7/DFOp1idkE2QTx+ip?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284855c7-250c-4a7d-c53f-08dd97b09151
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 15:11:16.6239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obUUcTdPYhImgWkbfwYHWlfvRHsTlcxs9iaJoIwyUpNgqaRE86VG6OEJgeLZ7elqV7OILLjulUgqrnnJbwnK6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6712
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



On 5/20/2025 11:01 AM, Danilo Krummrich wrote:
> On Tue, May 20, 2025 at 09:43:42AM -0400, Joel Fernandes wrote:
>> On 5/20/2025 5:30 AM, Danilo Krummrich wrote:
>>> On Tue, May 20, 2025 at 03:55:06AM -0400, Joel Fernandes wrote:
>>>> On 5/13/2025 1:19 PM, Danilo Krummrich wrote:
>>>>> On Wed, May 07, 2025 at 10:52:43PM +0900, Alexandre Courbot wrote:
>>
>> So the code here now looks like the below, definitely better, thanks! :
>>
>>             if let (Some(second_ref), Some(first), Some(pci_at)) =
>>                 (second.as_mut(), first_fwsec_image, pci_at_image)
>>             {
>>                 second_ref
>>                     .setup_falcon_data(pdev, &pci_at, &first)
>>                     .inspect_err(|e| {
>>                         dev_err!(..)
>>                     })?;
>>                 Ok(Vbios { fwsec_image: second.take().ok_or(EINVAL)? })
>>             } else {
>>                 dev_err!(
>>                     pdev.as_ref(),
>>                     "Missing required images for falcon data setup, skipping\n"
>>                 );
>>                 Err(EINVAL)
>>             }
> 
> Sorry, my code-snipped was incorrect indeed. Let me paste what I actually
> intended (and this time properly compile checked) and should be even better:
> 
> 	if let (Some(mut second), Some(first), Some(pci_at)) =
> 	    (second_fwsec_image, first_fwsec_image, pci_at_image)
> 	{
> 	    second
> 	        .setup_falcon_data(pdev, &pci_at, &first)
> 	        .inspect_err(|e| {
> 	            dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
> 	        })?;
> 	
> 	    Ok(Vbios(second))
> 	} else {
> 	    dev_err!(
> 	        pdev.as_ref(),
> 	        "Missing required images for falcon data setup, skipping\n"
> 	    );
> 	
> 	    Err(EINVAL)
> 	}
> 
> So, with this second is the actual value and not just a reference. :)
> 
> And the methods can become:
> 
> 	pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
> 	    self.0.fwsec_header(pdev)
> 	}
> 	
> 	pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
> 	    self.0.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
> 	}
> 	
> 	pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
> 	    self.0.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
> 	}

I made this change and it LGTM. Thanks! I did not do the '.0' though since I
want to keep the readability, lets see in the next revision if that looks good.

>>> In general, I feel like a lot of those Option come from a programming pattern
>>> that is very common in C, i.e. allocate a structure (stack or heap) and then
>>> initialize its fields.
>>>
>>> In Rust you should aim to initialize all the fields of a structure when you
>>> create the instance. Option as a return type of a function is common, but it's
>>> always a bit suspicious when there is an Option field in a struct.
>>
>> I looked into it, I could not git rid of those ones because we need to
>> initialize in the "impl TryFrom<BiosImageBase> for BiosImage {"
>>
>>             0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage {
>>                 base,
>>                 falcon_data_offset: None,
>>                 pmu_lookup_table: None,
>>                 falcon_ucode_offset: None,
>>             })),
>>
>> And these fields will not be determined until much later, because as is the case
>> with the earlier example, these fields cannot be determined until all the images
>> are parsed.
> 
> You should not use TryFrom, but instead use a normal constructor, such as
> 
> 	BiosImage::new(base_bios_image)
> 
> and do the parsing within this constructor.
> 
> If you want a helper type with Options while parsing that's totally fine, but
> the final result can clearly be without Options. For instance:
> 
> 	struct Data {
> 	   image: KVec<u8>,
> 	}
> 
> 	impl Data {
> 	   fn new() -> Result<Self> {
> 	      let parser = DataParser::new();
> 
> 	      Self { image: parser.parse()? }
> 	   }
> 
> 	   fn load_image(&self) {
> 	      ...
> 	   }
> 	}
> 
> 	struct DataParser {
> 	   // Only some images have a checksum.
> 	   checksum: Option<u64>,
> 	   // Some images have an extra offset.
> 	   offset: Option<u64>,
> 	   // Some images need to be patched.
> 	   patch: Option<KVec<u8>>,
> 	   image: KVec<u8>,
> 	}
> 
> 	impl DataParser {
> 	   fn new() -> Self {
> 	      Self {
> 	         checksum: None,
> 	         offset: None,
> 	         patch: None,
> 	         bytes: KVec::new(),
> 	      }
> 	   }
> 
> 	   fn parse(self) -> Result<KVec<u8>> {
> 	      // Fetch all the required data.
> 	      self.fetch_checksum()?;
> 	      self.fetch_offset()?;
> 	      self.fetch_patch()?;
> 	      self.fetch_byes()?;
> 
> 	      // Doesn't do anything if `checksum == None`.
> 	      self.validate_checksum()?;
> 
> 	      // Doesn't do anything if `offset == None`.
> 	      self.apply_offset()?;
> 
> 	      // Doesn't do anything if `patch == None`.
> 	      self.apply_patch()?;
> 
> 	      // Return the final image.
> 	      self.image
> 	   }
> 	}
> 
> I think the pattern here is the same, but in this example you keep working with
> the DataParser, instead of a new instance of Data.

I think this would be a fundamental rewrite of the patch. I am Ok with looking
into it as a future item, but right now I am not sure if it justifies not using
Option for these few. There's a lot of immediate work we have to do for boot,
lets please not block the patch on just this if that's Ok with you. If you want,
I could add a TODO here.

thanks,

 - Joel

