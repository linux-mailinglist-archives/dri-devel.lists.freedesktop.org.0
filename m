Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4321B3BCCA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 15:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AD210E158;
	Fri, 29 Aug 2025 13:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c+Omkito";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3185910E158;
 Fri, 29 Aug 2025 13:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQnpQRONwyUksdX/N8erAc7P3lN1+pLB0dtGcMyUgtTv90YEj4het0sRxIy2JfY3Pog8TXgQ4ydBjxRpD5LUw8/BCd4U9g1fYvXNOUD7CKbXn0/DUoudNO9LdRy8kt8WQGLzZTtvj9fT8TN4uWqfREbJmcYbE+P8XcoMpm44Eul7OLAqsKzmAmo8LH9t3T4f8rgYjwdcpU3q6sjYAOdwHNgCBxT0aLIYYZ2kF6MuSqZ2FVL7VTCxH1jrawPoLvnDr7f9VnE/QTiZ9wAVZs7YSRIFREFvYZG4DWMCNtc9q+QS1vcOywNlUosoQwRazaIB+YBLKUdt/rjKMNQj4sL4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JWYV1ZrTdkAs3BvMJYgtq8uhdw3PIwoPhGkRD7WZmY=;
 b=EtSQGZjUovmx/UERA6oy0Mns4Pk5AWNagVcUwAw7e5Pg6cBOQ88xEDJ54WOl3cgZUXIsSS8Gz0nEnQvF7OlaHBvyuL9AtGfRMVNoozRLYhMAqEcsF9O0lYufy9QZQr00rpY+C55w/YaR3g6cRbJUPBz8cVgXZk0VK7vNG5AIeEPBDdc+BJmPSUlreRUyaBSnwm1oHc4TBPcxGYIgzDUnOgdQj6zBIMDp/8+ggtk82ImoxVQrQjHCiey96PeofYMlgPmayZA3ojWopY0FoRLfsALVUM1iut2FgIDCLNCdr2P/9ONz8rnbPTInHtZ8vuYStdKfN6BXgzwDCQ1mAwgGyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JWYV1ZrTdkAs3BvMJYgtq8uhdw3PIwoPhGkRD7WZmY=;
 b=c+OmkitoO6UquaCg7wBoqiQKM/ytwDjD6dXPLOVccft4IQpt50DJK33ThcBYgkBW9BLeBYGyLDbJTF0PSqjLaxZ3m0Bv9A31jVHugEcAUaAwt1Rpani2n8xsx0wwWuXZyB3k4Cn74CakYPi0+p06MiPc9zOtwhQ9KneKs9ymspD/jsd7DKrS19dc+k/K64julg/9F5qo77wieB6O8WDMFMqRLzqfPlaBHXe761xmAAFNMm/hlSq8vzz6JD63Q5+TzEeDdCs9O0WUzKio1FuXoTrV6bc07zTsBVb9KabxqHkXFzjF9l1UyxCsLw5939JZWEJmIazfZmGhYLIeCDTa3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8602.namprd12.prod.outlook.com (2603:10b6:806:26d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 29 Aug
 2025 13:47:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 13:47:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 22:47:08 +0900
Message-Id: <DCEYI4AQ42WU.2TA0IOC1K4ZC@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, <apopple@nvidia.com>,
 <a.hindborg@kernel.org>, <airlied@gmail.com>, <alex.gaynor@gmail.com>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <gary@garyguo.net>,
 <jhubbard@nvidia.com>, <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <lossin@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <nouveau@lists.freedesktop.org>, <simona@ffwll.ch>, <tmgross@umich.edu>,
 <ttabi@nvidia.com>, <tzimmermann@suse.de>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 00/10] gpu: nova-core: Boot GSP to RISC-V active
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250828083737.22214-1-ojeda@kernel.org>
 <DCEKTF8CP2GF.ED9G9ECQMBHM@nvidia.com>
 <6f32c400-1f8c-4367-8be9-f7082ea87626@kernel.org>
 <CANiq72n5N3yHU_vxjiHk=TeJ0ouW1+xLDw43hcOVv6qSPFa=sg@mail.gmail.com>
In-Reply-To: <CANiq72n5N3yHU_vxjiHk=TeJ0ouW1+xLDw43hcOVv6qSPFa=sg@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c207c1-93b9-496c-c822-08dde7028e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UERDVXJWWVNPRHlodFJaYW5xVkRSZlZoQUt0N0kzQ2poUnV5SjdMdXZSL2da?=
 =?utf-8?B?N1MweEFJUXp0RnFzL0tUODJVejFyRzRUT2VuWEhvREorTEJJUFRpY1dPQmNN?=
 =?utf-8?B?aWZZbWZNTzRXYTcxR3lJVVpVMWVOR0VhY05HRGg1WlNFOFJobUlQMUhrUlFa?=
 =?utf-8?B?SXMyYkpoWm9NekVXelM1bTdockJtY0l4cVVqaVRaUCt2cVlQNWdKUGhDSytC?=
 =?utf-8?B?SnBCMUZJYTZ1R1BtVGRCMVlqNTlvdUlNVUdEMk9LKzdrMzFrcVpzdzRoZjRD?=
 =?utf-8?B?cDFSMkw5Yy9JaXZ0Z0oxUmNaMW9TMGdFRFYveGthUWhXUzdlTExRRHZieVRx?=
 =?utf-8?B?RmMxNk1BWTNBUS8xTlpBT08yc0JPeEVOcXpvWlVPMStqUnU3YVE5Y2NvSWtw?=
 =?utf-8?B?M3ZPMzJNb1IzSGV2U0prR3BHZnBML3ZJNW95WmZTRTdFTXFYUlNxMWo3S0Zo?=
 =?utf-8?B?QmFranY1Qk5OZDIwVkNjN2pkR3ZOWHBWN2g0ZitDaTM0cnp5d3VPQjMySUtu?=
 =?utf-8?B?WFFnKzNMbm94YWY3QnBDczcxRTc1YUptR1IydmhnRnBKYWNwRVArMExIMWJH?=
 =?utf-8?B?TEVFRG1HZ0ZoLzhRMTk5OFpLaWtpUEE4ZWg5YldFU001UjVtaTViY0pma1VG?=
 =?utf-8?B?NmpQMlljc2txSG5maHBRNW96MWIyTFZTb1ZIdE9aQ0JVTEtpOVgzT09kd2dE?=
 =?utf-8?B?RkFCMUZ0aWVCcGRWbFkySWxqVFhrdmtwTjdQeWFzZytFL2NuR2hNYWtRTGsx?=
 =?utf-8?B?ZEUvVGxwVXpUSnZvVFhBQ3Fqc05XNkdaZ2hkSStnRC9TL0x2T0FxT3FuV2g2?=
 =?utf-8?B?bkJ2ZVF1MmhNaDhMMVlGcjBXUjhxNHNFQTQxZ2NjZUNGbkdnTXNDVVJ2K3d3?=
 =?utf-8?B?M1IydEtkUDQwcGR6YVZndHRUemRNSDIwVzZLc28rQjNGa1BObzdxaFd0bFlq?=
 =?utf-8?B?Y3hmZTZ2QmhWbFJNRCtKTVZnTVUwdFZ1YnR6SFAzclNRZEErUlhPYkxsVHdL?=
 =?utf-8?B?Tkh6YlRHTjVFN2h1bEVMV3QxUWgwdDdoVWwzNGxESGhleTg2WGM0Sk5Sd1Iw?=
 =?utf-8?B?UUdRZFg4Ym0vMmJUSFU5bVFZTmpQWXY4VVBHRElNS1VFUEVNUmdjK0hmMVBK?=
 =?utf-8?B?b0VSVy83eG5PZUNYYjlNRTk3elYyb3hjSXNGUzBucll4UVdyZCsrWisxYlZN?=
 =?utf-8?B?T0ZzcWJVeThQSkdJM1NGR3BaMFMyeVJSWHdDZkhwMUsyak5UaHdPWXIwT2Fl?=
 =?utf-8?B?dGhCbGxsbllKa0RBOUQ2Y3FnUE1FRldVYWVFd25yaEY1cGZMdUg3NiszdzNV?=
 =?utf-8?B?aGhOVjNMVDBLZXBIeVlyNXdGLzN4UU80QzljOGprU01rQWtXMXc2U00xb3NE?=
 =?utf-8?B?Z1NXODF1ZW91S0tqaTZWRE5ReEM0LzBQWHhHaHJ5dVR5WGN5a0ZTTVl2cDYr?=
 =?utf-8?B?ck9temVBNzlvbXVWdWRkbGhZZzRNOTRVWG1CNUlrR1BoZGpmWkRVMGFzRHBk?=
 =?utf-8?B?dHViTi9lRkJxc2pUbFFiSlJMRGlzTU5DVG0vYnNGd0xUZGg0VEd0K2NvZjlh?=
 =?utf-8?B?R21pbk5lNmliVUhJTkRNZnl1RnRoTmRudC9MbEkyME1lbzFDbHFUU0pReGVn?=
 =?utf-8?B?R2hsOW5JOTBOTUVLNzdEWDVVS3BQWk02RTJRTVpnQ3YvdWZRSDExSERMU1NV?=
 =?utf-8?B?VHhIMnpoMjhpaXNMb2UrZ2QxcTJmODVJL21iZUdyZGd0emhyVTFWNWFqU0NV?=
 =?utf-8?B?bDhNUXZaUEpNeDlnbGVESmx5UndwbGg1WDVHanlDV3ZvSDQ2a0Rwa3ZGcmRO?=
 =?utf-8?B?bHhYVlZVNlpDNDNoK0NLemRLbnVFWGVyWTAybVlrQ1RIeWRLQjBlWHNXaUpV?=
 =?utf-8?B?bzZ5cWt1YUtPaUNjZVN0aHZrSngxb1dNcWUvMHoyU0JoSjRzOERXV0JwOXFW?=
 =?utf-8?Q?FwzQwyg9KHM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REtiRmFNbEFEaThDYW10YkY1cm9Ga3IzenNkTEpva0l2MDRwMVJJQmQ1VWY2?=
 =?utf-8?B?alUyTlpOL2Nad3N4S3N2QWRSY3QwUnR1MmcxdDRlK2s4V1ZyY3FQZmd5cDdR?=
 =?utf-8?B?ZnF3WGRVSTYzSGhicEV3dHdJQ0xwdS95cEpxR280NE95OGRRV29Qay83Mmha?=
 =?utf-8?B?VndKRnoyNFVlb2pYNnJiNWF2YU5SZFpvcVBMRzJsRUhUM25iWndwTm14WGhH?=
 =?utf-8?B?TytiZFg1a2grZEpyYUdrKzF2ckZlbHpzZlNnMmF3UFk2Mnl1dzltWDc0RkQz?=
 =?utf-8?B?MlZEeG1QcFQ5bUdCUFM4SDRBblFDRFp1U0dCTmNyUjh1WC83c2JSeE5WQ1JX?=
 =?utf-8?B?YjZpZTkrNkc4cE5KdkhZZVdmeDRLZzZxQjJyNGVIYzRteTM2WWhDQTdvblNR?=
 =?utf-8?B?NlFNWlpwQ21WSk9VNytXbFdHQzEyUkV0aUFubEMvTFlKeUFOSGpiUExjQTYv?=
 =?utf-8?B?Y3dIMnUyTDZSbzhiZ1ZCbFgwdGVTK2lWdFdadTY3TzRDanM5WkJkclF0YjE4?=
 =?utf-8?B?eHNnY29jckhWd1JkenBXQldiSVNzeTkzTmZLNHU4bnNQckpmU3BZMzJldUNj?=
 =?utf-8?B?NmNKTkRrNUNkcUVrNHJXSWJENTBEUmhORW1kUXlRTlpESHd5VmIyYkhpaGFy?=
 =?utf-8?B?ZytaU0JHTkZZNlA4MEdLbnFwNmNHdjA3dVFVOWg3emZRK1Y4a0xQZi9ZY0Za?=
 =?utf-8?B?V21YNWhFbEExd1c3WWt3aWs1V3h5UDZTay9rL05kTnI3YkllZ1gyNXF6akNa?=
 =?utf-8?B?QVQ2QnV2eHpFMlNKNHQrT1NlNVRlcUNDOEMySVoxRzhWb0F3VWI0eG9pQUgz?=
 =?utf-8?B?dlFWZHFkaW9Yb3NZWlpvMUJEcnlTZkw4N3JibUR1dzRTWXd4MGVkYTN5Uk5k?=
 =?utf-8?B?Tkx3OTVzMlV3L0RoVXo0eFluQXAwK2dvUWUweWpoczBIelhxR056bGVwcDcy?=
 =?utf-8?B?VjRod0FrUFNBUG9KOE1pU2dFaEJxT0lqakplMHlLWHdnQ1dqR2haL01QYi9y?=
 =?utf-8?B?Q3lTU0FLaWtydEg2NFU0MFNZbkJUcWRVWFo2TVBDeEM0NDNvaksxODRXUEhE?=
 =?utf-8?B?WWFWdmFJWS9WSk5tOXJtSHFWSHZrTEc5c0hBMk5LWEsrTW5QakI4ZWYrYys2?=
 =?utf-8?B?azQxTEhmYU1Ra05nWnMxOGpjbVhDS0Y5U29GdXp1VVV4K0lNMDJMbmxOdlIr?=
 =?utf-8?B?OWR0TEdaQnQzTDVnSitRd0FIZVFNVjBKS3pyTDVzN1hNV3UwOFdWWDkyVmdq?=
 =?utf-8?B?MFRzREc5N1U5b1Axa0NQV3JLMlFOWFpmalVCemJRUkRKZURxenRxZ1U3MGl3?=
 =?utf-8?B?Y3pYb2ZEOUZJWldaa2ZacjE0L29lbzkrd2RGdklid2NXQXI3QjVIR3hTam5L?=
 =?utf-8?B?SEt1RG9Na2RqYjNuTHBNNldEVjliSXRiQVBtMFJESldZc3cwcnNLUnBLUUxt?=
 =?utf-8?B?QnJiZVQrTXZJbmc1RUkrcTRQWExScGU0TU9LTjVjWVF3dVRsSTUyMmh2eEU5?=
 =?utf-8?B?N0JKUHYrdXBRNlhxUXF5Z0l4U2RXQzlIdWM1WFphTGhNdlI0TzdhRjByMWo5?=
 =?utf-8?B?TGkrYWF5V3hYRGNHVFRlcld2L0JIUUNpK2Q4ZWV6TjBVeUFvcjlxaUxsMUxS?=
 =?utf-8?B?azJ5Q3c2SlZDd1NzNHZnb2FwT2ZIWm4vckpkV3kwSDFDSEhxSGNTZzY4anND?=
 =?utf-8?B?ZUYyYVR4dFhkUTY1VjJEN3l2Z3ZZTlFWRjRnOEFjM1lWRExwVWJJSHhHOHUv?=
 =?utf-8?B?Vm80VkRJS1YwdDNYbllTQUNpZFNFbkFDYWIyc0hwaTVteVZxbHcvTGhVTitK?=
 =?utf-8?B?OEE4U2h6K1NLUXdkMmdEei90UzZBYVhLRGJaNEM4eDN4eTl3VVRLUmpydGho?=
 =?utf-8?B?K2hkQ3g4N0hHMjVCd2JndlNWZkFuRUR3U0F1eFBPTC95emVmamplSTJ2Ymxy?=
 =?utf-8?B?UWdHU2ZhRmxPWFdTcWpKTXVERWx4V0p3Z3VVOGdubTB2czhNWWJuRkdhd1h4?=
 =?utf-8?B?TVhRWEkvMUhLeENLOEdKUTduc256TXlYREdMVG52VHlMRW9oeUtTN3lLNzBP?=
 =?utf-8?B?V2JBcXdBYm5OOWRSNFNuaFdOS3Y2VThPVVprRzJrQkt5Y29CZVdqWDcreTRP?=
 =?utf-8?B?WEJPa3pDRGZrU3VFcFlYb2RwMUdFTnJiTXNQUjN6c25VWk84L3Fib3lOY1ds?=
 =?utf-8?Q?1bvMVAdtoi1KRxv3NPmNTNvgIoRIFlzwCjVqiVZSM1uf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c207c1-93b9-496c-c822-08dde7028e03
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 13:47:11.7334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HR8d+GHxAZPLt3Zpe7XvK8aW5k0lFvLYpyn8O3MM3GaG2mPgr5HBQ7bWp6MmvUJVw++5VNsDkd/2XTqoxsFAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8602
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

On Fri Aug 29, 2025 at 7:01 PM JST, Miguel Ojeda wrote:
> On Fri, Aug 29, 2025 at 9:40=E2=80=AFAM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> I'm happy about every potential additional reviewer for Nova, but I'm no=
t sure
>> it scales very well for the rust-for-linux if we get more drivers. :)
>
> Yeah, it is an informal rule I/we added back then so that people
> interested in Rust in the early days can follow everything in that
> list.
>
> The expectation was that eventually it would go away organically as
> time passed if Rust grew -- I mentioned it here since I saw people
> mentioned explicitly otherwise.
>
> @Alexandre As for your `MAINTAINERS` suggestion, up to all of you --
> other entries do that currently, but it is not a requirement, and you
> are big enough already (have several people looking at patches etc.).

No, Danilo is right, it might somehow make sense now that the driver is
still basic, but this probably won't scale too well after the basic
bring up and not everyone on R4L is necessarily interested in GPU
drivers.

We'll add "don't forget rust-for-linux" to our individual pre-send
checklists for the time being. ;)
