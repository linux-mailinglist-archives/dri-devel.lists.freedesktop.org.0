Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52284B415DA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3F110E1EE;
	Wed,  3 Sep 2025 07:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qt4mhmpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE2A10E1EE;
 Wed,  3 Sep 2025 07:09:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jC/VtOSN4pmaaX7gkNjvLYc2YO0mIoCZAPDZHJgOKVErxBtZ00fR+aPQJs9IcZM+nStrFs4zK81hbKooA58menk3rJm/aBZlx4OyQvE7FeEBeet72XKUNH4/TB5I/3/RetKWI8SCRo+AaOds2GnPxIBkp1mZej4Nr4X3HgEhnfW/D5e92h4ywcgSMdWY/gRwKBB3Mjw1kV+NTdhTBkSdIUPGXBV9roFgxYKPzt3FbSCTxHzdm+QYvRiHKRTr4CchqLx0cvtVH6vqSvwzaEfa+0o1xcqzQ8PCLcDV+LpPXTnXZqWbC0tR/sTHEUVkD9b5lrPcIA5WgB7d43g4+tZe4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enP3BKmv9Iv3TutU1D7IG1cThl/ttYIDl2Cx2ptOMgI=;
 b=QQ/JpQ3dMwXYwFqfaQ26IB37t6+WX74LWGhxZoxByVZYWgXGM4hcCLqSGRP9LYSd3yBhvF++pVYqblt7n5mbvPxI6Cq5ilWRW/HXmao2Fl6iRzYZD6jBLE40LZ6BEICue3QQkyf/olMocpJFUUHb0aRZT7w6yNAMNTdIqxCPy87c4p4oPX+S1nrYLHDNL/PJxvvYQq/WJHwDR0GltbmASJ/j3H3LZjVrfReDjIpusKoi6PBVLZSXSgUJsnvRc+lbIDSPLtxCFY1Qg18fv99FrdaFs5qE6veoPxKir4JyTvcHd35iGyHKOSgKl2juL/oS+kWAoqwUx+rztyqUCBrauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enP3BKmv9Iv3TutU1D7IG1cThl/ttYIDl2Cx2ptOMgI=;
 b=qt4mhmpMbrW+y7h374QlEWcAgbVnxPJFynb7CFdYmpJ3TuCrjREnlS17vV3fDutWtr3lnB++JJmZorAucykalJ7xTqt14uhnCRfIkB9eqVgGY+SEkN7IhY81t+Y6VUCgYQPmN1bwZs4nJ/LU3ZgUQfpOcqvHQqoRaO/2zf5xzsva+qMes73Z8ZdgcuK/FbPBXOS6xaDLwD1eBFcDI+xf/3RI7xw3nh68iUOpHkIybQdqt+kSodu4kkoZW7NDUiAvaGnt/n93oKGTnVKrNKyPxMxaYN3YWy2VFa36/O1VzwH7CIUfLQ4bxu8j5EJMEi9dCUhPGl0CkH+D4UAEV6nBjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8720.namprd12.prod.outlook.com (2603:10b6:a03:539::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 07:08:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Wed, 3 Sep 2025
 07:08:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 16:08:50 +0900
Message-Id: <DCIZ5VVLACXO.1L0QTYM5YVRQV@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <DCIKSL18GE9A.2R4BAGR56YVPF@kernel.org>
In-Reply-To: <DCIKSL18GE9A.2R4BAGR56YVPF@kernel.org>
X-ClientProxiedBy: TY4PR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4338a2-493a-4e12-c7fb-08ddeab8bf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0kxN3diU0hTK2Z0UkdmcWpwckxwTXdyUEJhWkIvOThZTzlJQ21QYlg1OGI1?=
 =?utf-8?B?N2o0MHFQM1ArWnk4cmxzQzFyU1dqTjFGNXZaaVUxby9BREJWSHpQc1owU2Ro?=
 =?utf-8?B?dUFTaENIc1NScnpIMlg5QUNob0RqOTR5R3Q4TkRTWGQzVzJiTHNtQzRoWXF0?=
 =?utf-8?B?WkdPRE1qMDlnZE1NTUYxKzVMQ2Y2REd5dWw1Qkk0ejE4RUpxZEJqeTRab1Vi?=
 =?utf-8?B?YTdzNVpxNFAyNVB1TFBXL2diUTczZ0E1OU96UjVDcTgzQk9PbU4rV21teEd1?=
 =?utf-8?B?cXFoUGlCajUxT0pxSkMreUpiR0FzT2I5RVM0bEJhUWJxVUZLejNjUWJXcDVM?=
 =?utf-8?B?aWE1TzNWTmFVUi9HNjhldEtGRG85Qm1zWDhhbnRIYjdCZnA4ekVManMrcTkw?=
 =?utf-8?B?a0gwaVZmelorTEtXang1L2hjUy9PcFViQm9Nd0dlbEp0WHc2WEJKV3BZeE8w?=
 =?utf-8?B?NmFpV3FLc1VndVEzT1o2U3BPNzl1NDk1MXd1L0wwZTU1TGVhWnVxdEtRREJy?=
 =?utf-8?B?L05GRy9DR0trMGNlTW1hTU9uV1BMT1MvaU55cWlzMWZ3M1pkTTJIQXgySVBK?=
 =?utf-8?B?UEdKUEJ2ZlUvRW5uVG52TWpJMFREUG5kemJHNE40Qk12cFpLUEN6dmRnQ3lK?=
 =?utf-8?B?Y0UzTHhmMUFFSWkyRmtUazdKcG41U0lLTkdOb2JUVEhrYXZsK3l0S0llQndK?=
 =?utf-8?B?NVpCbXF4d1c5UHJ0VVBTbkhXMWZEbk5qTW5BRVFqaGxTZ1RnL01VNEpiaVQ0?=
 =?utf-8?B?VnhCaUN1V0JneEFsYmxKSWo3R2dFVlQyc0pwV1lNVXVrUUhkdDBlNkdESFRQ?=
 =?utf-8?B?ekR5OHhlQzIrMUxLOG5vZXY1YW56SXByQjdENHlJdnBPaGxsZ1ZvLzcxUkww?=
 =?utf-8?B?M1haNDg2dHFTTUpKOXVSZTE3U3lHNmNzdjZaMEhDZ2JnQ0wvdnE4emY2eVBm?=
 =?utf-8?B?ajM0WHFyZjVGYnZVSDlNeFpxYVBEMC84dXpCU0lqUHMvdjJNcTQvWDZTQTZI?=
 =?utf-8?B?bnVveW5tbVlrUE91Sk16V0c0eEREWTBrVlZqbmlqUXI3b3g4WG81YmwwRUdw?=
 =?utf-8?B?dDI3N1lES2VrNnZYaXZwa2hOZ0ZtbUo2KzZpSjNKZEZXWGR1RmlQeVl1RW1m?=
 =?utf-8?B?UG1zUnBBT0hTeUd5YmZIZTZ3dWVDb3gwWlFWTnRzWS9hY1lzSDR3V0htY3Mx?=
 =?utf-8?B?R0lkd3U3aUxDbHNiNGYzNmM2TWloYWFvNGd0NTJ6QVRrcXFjcU9XYy9Pd1FW?=
 =?utf-8?B?NVYzaVptUVIydHRSTHR1aDYwNzlTNkFvN2FKcmJZRVkvMjVHcnFGVkdBS1pY?=
 =?utf-8?B?RGNSQ21RZkk0Qm9zZUlZb1haNTlTTmJkalhXNzRJSnp5UHVNNUxSbmd0cFBH?=
 =?utf-8?B?UlltZlp0U0VUcUpQeDFyZVFYRUkxMTJPMkFKS0RGL1hZb2p2ODkxRTAxSVJk?=
 =?utf-8?B?Qm5UTHcvQUlXMjhYSE1YQi9Lb0tlY3V5MVNzdnBsbG5WSVpURGtxM0toaVRn?=
 =?utf-8?B?dkZPc0hqZFk4dDdoU3czOUxFaGhORXlINmJRZEpkR2w1ejh0YXdMMGl5Mlpr?=
 =?utf-8?B?bVkvV1JBU3pWalEzcDdRWm4yc0dzMTAxZUVLeU1TQzBzR1VyQk85U1JqQ3JH?=
 =?utf-8?B?Skh4Wm9MbHl2TXU3ZjBaZkJaaUNGelVtSlc1WXM3RzFTcnRpcS9Sc09CclNS?=
 =?utf-8?B?bHVqTE1nTUlwRFYxUHU4OTBEdGNwU2JEQ2NKamhIWXlmUWU4dVhVN1lXdWQz?=
 =?utf-8?B?elozWWZGZVo2bFBMTk94THBJZ1hNNnprRkRSVksreUNtdVhCWGg0WFk2eGtM?=
 =?utf-8?B?N01BYXVTVlB2VWZMY0M1QlZkRS9qMW4rQ0JzOVhOZGNTTWJOWDMyZHUrdWp6?=
 =?utf-8?B?Y2QrdG9rbHR5dnZjcjl0UHNiVkFpcjA3SERaL1YyWXZuWDdDdm93OFhwNFV6?=
 =?utf-8?Q?scQxCdP1TGE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWhuV0JNQWhMcWF2dUNtYnZuU3V0MnFRWXltUzlzSS9YNUllbzZ0VGhJcXdh?=
 =?utf-8?B?WHlLZEtKeW5UWHJxWmwzTWZJUExYYW5IN2w5YjQ1S1ZuSXBCTVZXOVl6YStk?=
 =?utf-8?B?UTM4SW9hU0IvT1lWTmhhZnZQdGltekxNcFVRMHQwY2J3Tk5OTExyRWgvRmdm?=
 =?utf-8?B?aGlwSmkzeDZVSW45NGRzR0ZCM2IraDdDcWN4Q2lZR21Za0s2dlM5MXVlUjNT?=
 =?utf-8?B?dXhUTVI5VVBwUEZUV3hRcEJNM3JXK2ErTHFPVTl5TThpb1pJOWtNWG1lUkR6?=
 =?utf-8?B?ZHE5a0N5NUZIS2V6eGxtU1pOeXNtaUIwODdrcUFneU9CWCs3ekhjSVh0Zjdj?=
 =?utf-8?B?YUhQckx0WnpiRmljZHpDYml4TkpoSVNhcVdkTTdTaUxBbWN2c2l4Lzc5R3dv?=
 =?utf-8?B?SlFGN3dzRGthNXB1c2MyZDM0ak8xZ2hDaUdTcnJvQ0gxOHNpTEM1ZldlSU92?=
 =?utf-8?B?N2ZSaElUKzBYelBaL2FFR21nQ3VCUStFMEt2QW96U2pGQ0ViRTVIUUMweWtr?=
 =?utf-8?B?U2RjRE55VFJ0UkgvU3JJQkduSlpiWFhqcU54ZWZKbjQyNURBMnJqTkxpSTc1?=
 =?utf-8?B?NWc3eElTbjZ4dHIzMWFGTjFxejRJWHJUVTJSVlhUWjZUQWlCeUFIYVlzdG5l?=
 =?utf-8?B?b1hZcStNTWw5bk1QRi95bE5CL3Z3b05lc0VtMUFNSko0Q3RjSVNjYXh2a0l3?=
 =?utf-8?B?cWozSGVPbnJhZnYxRWhtU1hwZGoyZ0YyTUpSUmhmYThDM2pObWxaY2FMbTdt?=
 =?utf-8?B?RFJ6L2o2YlIrVjk3U1gzSVhrUFBNWFNPZksxS3RCa2VZUHZ6QTJpUWxEcHhU?=
 =?utf-8?B?dGh0d3FwQVdCeDB4Y0ZWUXB2dWcwcTg0QVViV1MyeVVLbm15TkVNQnIvOXpY?=
 =?utf-8?B?N1MydjREYzNCcmxZOHE1OWszdnJPMmx2Y3RvL0FXL0RIL3Q3LzN3TDV2Vzky?=
 =?utf-8?B?THhwSU1ydEZXR1AydjJMWnN4TkNMUzNHV0h4dndZbHk3ZGdDd3IzUk5vanRU?=
 =?utf-8?B?UXhjRFZuaDI5VlVlbFJqNEhkMkx4NlFCakFvcWVwNENZVndxUDIxQkNrMjBp?=
 =?utf-8?B?SFBQY2FWS2hmcXZyd2dVOS9QV25xYUgxZzFPQ3JRYyt1K001TlNvY2NtSXhO?=
 =?utf-8?B?NzM0WjRUNEl4cWJVaEgvTzBRMlZwc0tQdjlFR0Y4L0tpbVpST3MwTVR4TFND?=
 =?utf-8?B?b3g1QlROZWwxNnFhSVFreGVSeXFzVzRBSUlkUlRDKy9MZjV0TVgrSEU2bldL?=
 =?utf-8?B?eXlkZ1pNbk9tZ3RMa0Y4eGR1RHNveGF6ZFVkVUZINDFTUUVCMy9XYmFCeU42?=
 =?utf-8?B?TFlaOXFobUNxRGgwbUU2NEFwWWlGM2lOM0RhSVlYNTR5Vy8vVU43UVIwV2Nl?=
 =?utf-8?B?aWlJV1JmSjFDM002bU1Dck1pdkFiNGgyYnFpN3o1WHhhdHYvejFDRnh1dmlu?=
 =?utf-8?B?ejNheXJCRmtkd0Fkd2g0djJEMzJpbnF5dEFmWnhrZ2JtbkxlYysrdTBIeEVB?=
 =?utf-8?B?Smpxd3RKR3A0RFR0Mlp1WlN0UDRtVCt2b1ErbVE0b3JDMHRiRE5NMmEwRzkr?=
 =?utf-8?B?TlNrOFo5bnJpQW8vdm4wVnlvamFVdXIvTTlBVDhiU1pYcmRCS3gxTGpPWExW?=
 =?utf-8?B?UjJ2K1g5NnFZZHhDaHlDOHJhKzNldUFBcVlsSDhESThoaGIzZDN0U1dtellL?=
 =?utf-8?B?d05yNTYwNXVvaE1vOXJxR2FTczNmbjE0Q1cwTVU0L3NhRWsyUnA0K0U5ODdU?=
 =?utf-8?B?WVBVaUZJa2YwNjhNSkU3MGZRTzQ1Y2hiSS9odVZ0NExJd1hlT3RsK1Y5NUxO?=
 =?utf-8?B?ZEpERzluWHFaS1ZOVlRJY2ZoemZkSndvR2lienpiNjhUQmhjWms0cTAzclRy?=
 =?utf-8?B?M1pLT3FodzJFRkIvbnBEdE9kbjhEMTlSQ3hsQXR0N25pTHk0L3hCUDZCaE5o?=
 =?utf-8?B?SzdIeDVzUmk4UUxLVXdiR2V5R0lVUmtlMXJYL1VGVkZiNDg0T1VBWXlDVHMw?=
 =?utf-8?B?VmpZeGZnbFdqRi9oMzNkMXFZMFVnVjF4V3pCSmJGaEVGVHJaRmJaYjh5d1Mw?=
 =?utf-8?B?cUVyTjNrQTRBbFpEd0VCWk56QWZLd0pjWEdiWnlIb1RLRzR6QWEyd2tzOG1V?=
 =?utf-8?B?UnpJUHFJT08xWkxJUzUxdElqSHVpRkZrekh1dTZEYTJWclBtZ3B4WVMxYkFK?=
 =?utf-8?Q?fDY5dGeUnYj2QL/8UesiRm9MQQt/qRt8w1BDO/lZa+0s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4338a2-493a-4e12-c7fb-08ddeab8bf1f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 07:08:56.6190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KV8o7qA1VXU5VnDxFv3HsXFyr5M8eeE+DTkgdVZCjU1CAa7jyrH9FbLkPptImbBKoR1+fraJtUsFne3PDIMB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8720
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

On Wed Sep 3, 2025 at 4:53 AM JST, Danilo Krummrich wrote:
> On Tue Sep 2, 2025 at 4:31 PM CEST, Alexandre Courbot wrote:
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/dri=
ver.rs
>> index 274989ea1fb4a5e3e6678a08920ddc76d2809ab2..1062014c0a488e959379f009=
c2e8029ffaa1e2f8 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -6,6 +6,8 @@
>> =20
>>  #[pin_data]
>>  pub(crate) struct NovaCore {
>> +    // Placeholder for the real `Gsp` object once it is built.
>> +    pub(crate) gsp: (),
>>      #[pin]
>>      pub(crate) gpu: Gpu,
>>      _reg: auxiliary::Registration,
>> @@ -40,8 +42,14 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdIn=
fo) -> Result<Pin<KBox<Self
>>          )?;
>> =20
>>          let this =3D KBox::pin_init(
>> -            try_pin_init!(Self {
>> +            try_pin_init!(&this in Self {
>>                  gpu <- Gpu::new(pdev, bar)?,
>> +                gsp <- {
>> +                    // SAFETY: `this.gpu` is initialized to a valid val=
ue.
>> +                    let gpu =3D unsafe { &(*this.as_ptr()).gpu };
>> +
>> +                    gpu.start_gsp(pdev)?
>> +                },
>
> Please use pin_chain() [1] for this.

Sorry, but I couldn't figure out how I can use pin_chain here (and
couldn't find any relevant example in the kernel code either). Can you
elaborate a bit?

>
> More in general, unsafe code should be the absolute last resort. If we ad=
d new
> unsafe code I'd love to see a comment justifying why there's no other way=
 than
> using unsafe code for this, as we agreed in [2].
>
> I did a quick grep on this series and I see 21 occurrences of "unsafe", i=
f I
> substract the ones for annotations and for FromBytes impls, it's still 9 =
new
> ones. :(
>
> Do we really need all of them?

I've counted 16 uses of `unsafe`. :)

- 3 in the bindgen-generated code (these can't be avoided),
- 7 to implement `FromBytes`,
- 1 to work around the fact that `FromBytes` doesn't work on slices yet
  (maybe that one can be removed)
- 5 as a result of intra-dependencies in PinInit initializers (which we
  might be able to remove if I figure out how to use `pin_chain`).

So best-case scenario would be that we will be down to 10 that are truly
unavoidable.
