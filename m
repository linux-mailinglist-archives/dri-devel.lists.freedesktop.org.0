Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30324AA7E5B
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 06:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0D110E32E;
	Sat,  3 May 2025 04:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rv6gCzyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A793510E31F;
 Sat,  3 May 2025 04:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOYAYOZgie47lPBvSpmjBkyB9xJQAfVBp+DHmJxGEkme5habCOfnJF455SD3dwRIgVd3SoCRvYx7rk28ZstIPSY8nvHbEFOcpPa+oes9cUy18aMj8f53v3Z7367Gp69OYS+ud0YMn74Gee7aBoAiGIJNJSPik1hH0jaBAJZUZOgWwItKKCGj73zEGBwWqMRBX6w0v5WikrFvCYgbiMitGjkrxgRlff8ry/Cpi7QXPYExZJ01QGa9qkTosRt+Nns9BJPLe9Fw1o/i5oaLUejtoQ0z/e5ZASdf69yKmPXyD85PZZlHox+u/dRkG7dSiBC0qHEyxdTcTrjcyNpNvQRR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCEway+8+NeihLFuv1fu+sQbokP6ai9LvEdqlw+FZAM=;
 b=e07EdlQFsw0ru/FhWV5TMWajbL6Pv7/Fm0Q/k+RgEzeqU27GKGTCENOMei+vvdfhb/xVsms32fb3k3e9645WE/JT7GKEvNmXchXrIACkD9Qs18uBx3fH/NTm3dvzLw7ObPwJqLZTI2XG/X+1BVjAw8GQm4StuEpPxtDKFmdAADs/kUqvi6kdHobOoXu/6Y2Sjq3+0diCISavxWTduUJlTYrBih41QZImb+814IUpTefKSiFqETPiRtWmpy/Mi8BtkDbmV2oN/P648cW2CC6yiYRT/pAB60ll42o/L4I4iQy9P0kVkh1wf1R1nTHU1XMq9v3mAjowB+gjnvGKfm4IxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCEway+8+NeihLFuv1fu+sQbokP6ai9LvEdqlw+FZAM=;
 b=rv6gCzyD7MkNmlUabD6GbPK4pPml/l4SCYwRyOjEjATVhnVeXSE3i86sJdlo/eu/dMWKJiRH5efsRZmTKC50lWFLyD+OXITQBPmfVNgTo1aUdzWLW1U6zjcbFR1UUyYzJHZ6tk0DxhMuCBATCJMpnyU8ZTi/m+SijYx0KHX4nYEZB0LAYamM0U9Nvqx6yBDtIrScoIvF2xYRrcZKjhbbBHFelVZ/4K0qXqGu/a62GpGLhmTpRNS9fZtjLEWgosX1lA8MT6BakT32s7Ipk1ZIQnZRSpo5QLaHZBbNnfK1DacSWPo59KjLdZ2MM5aK+rSIpTHMdsdXrH3AqKHkeTtUIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 04:08:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Sat, 3 May 2025
 04:08:16 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2 4/7] nova-core: docs: Document fwsec operation and layout
Date: Sat,  3 May 2025 00:07:56 -0400
Message-ID: <20250503040802.1411285-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250503040802.1411285-1-joelagnelf@nvidia.com>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:408:fb::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 389378ae-e389-44cf-dcda-08dd89f821a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlZsSDNTamxnc2JFd3pLNk1wc1ZvQ1NKWDBCRStnK2xGME1GNkFkdWxmSVN1?=
 =?utf-8?B?dlU2VEZwVUhyWmZLNVY3M0QrYS93VjhZNDYvYnkvWnF0UjVraGpPSzkzaStu?=
 =?utf-8?B?T2FaeDhlOVVRQVE2ZkxwUDhQd0JhdkJGME9hNnZ1eWg5VERRSDVpazRrd3Z6?=
 =?utf-8?B?OXgvSlQvMndNcis3THozTDB4WVYwdVhhV1E0Rmo4R1laSWxhN2Rhbk53WnM1?=
 =?utf-8?B?U1ZldXl0T3lTc2Ztd09qOVlWVlhuQ0RrRVpkOEV3eDd1K3hweTdTWGhPTktS?=
 =?utf-8?B?OUhzMFN1TlR3Vm1ybGpjemY3ZVZlNSsrSlNXckZmN0tEdVhzU0UvcmcvQ0Rv?=
 =?utf-8?B?ZTJnVnFBdFlqZWRiaUNVRXBjTXlML2FiNUZlVHdHbm1YSjVXMmptSTZ6eUhj?=
 =?utf-8?B?TUE3QnBPT1l5U0lud2ZSNzRJdTNhc29meTRObnpKZk9zZC85OXN2YXhra1R1?=
 =?utf-8?B?Y3JldFp5Vm43eUxqMWx6MzVFMlkrQ0tNbksyZDhNaHJCbmJ3ZjJxYWFiTUpL?=
 =?utf-8?B?VHAzOHludFlOOGJGQ3duY3NoV00xTnNOQUZ1NkdmekoxaEhTVFFvTjhLVWgx?=
 =?utf-8?B?RFFZQXRJeW02QjZZbjJWTGxhZnhoRmZBK2YzRHdWWnBHbWpieU9DeEMxQjI1?=
 =?utf-8?B?R2VoTmtDalBxQXFEWTJQVlhyVENKb0RnaUNlUGQ2ZHA5N09JbDZUS0VMVFNu?=
 =?utf-8?B?WXZBUmFBOWxPVklMeExMVy9PdzNDSUgzaTFONGppeHdLa29ad0NGRkR2eklN?=
 =?utf-8?B?b2VsOE9pclVVWnpEdHlSU3ZxVkFVVWFRcVRWd09GQmNiT05zanJLUzR0Tk5y?=
 =?utf-8?B?dWdCR2hnU1gzQWJzamw5a21pNjE4QlRERWhkaFlYVFhsZ2srV2taallRWnRT?=
 =?utf-8?B?YkI4cDJGZmdxcFk1MWdFOUd6djVUQVgxaWM2Nks3VlNLSE5YQy83Tm81MzRS?=
 =?utf-8?B?ODJPU245TEQwV1lMTndQMXp5anQ1dmVVOFphS1l3TllRRUdPUWpDNTF1MkN3?=
 =?utf-8?B?SU9FM0xBRTRVZkEyWkdzM0Z4UW5OL2lpUlNTSXgrVmQ0TEZiQWlMbVJGRDI5?=
 =?utf-8?B?ZXJSbEtzYzIxSFJtL2p2cWxqQnMzbzNMOERibC90b25vU2NUZlMyVTI0YmlE?=
 =?utf-8?B?UU1MYkNvNTNRNHZpMXVpbHJjUE5zREt6aEVIK3RlL2dQU3dJd3ArWk9xaDNJ?=
 =?utf-8?B?aTlQbDl3emNjaWZtWXFiYkxPYkdEY3VQKysyb01YMzdlRSsvcU5INllMbk45?=
 =?utf-8?B?bXFMWXZYeHRMN1RzbVJhdnVxK0ZUb25EQjVqRzdBTkNlWU1tWFFFOFV2d0Rl?=
 =?utf-8?B?czU4ZDNCdENZeFZmdDliZks1SHlGbVBmWHJWdVd6aVNBVnduaGRuMzVyWFlu?=
 =?utf-8?B?MTBuRVFHa1R4VzFpUGpSdzJwNk5jL1hIVGhWTGhaczhkamFldjFacmREWmxW?=
 =?utf-8?B?QkM0R3JNOHU1MkdtMGN2UE8vY2d5czhwSml5clU3VVpMOTFxdG5zR3I4MDBS?=
 =?utf-8?B?bVZ6anlKQTdhOG50bU50N1dXWmozZm1FNWp0NVA1TWI1VEhFbk5EeXp6aHh0?=
 =?utf-8?B?U1hnaG1KTUdIRG4wakpnV2ZPbEtqZkwvS3M0K2xjbkx4N0YwTDRzR0tnNUhs?=
 =?utf-8?B?dElYWk1GVVlMK3FPeHh3Z3N6RW15ZktEVXdQSitvUzFtYVIza1BSK0Rrd3Ju?=
 =?utf-8?B?Rkh3NTBwTDZGOTQxa2xEL1laYStXYnFLb1N3U0NPZ3d1Q1dQc2pDSnNONENk?=
 =?utf-8?B?WjhUdHZQaUVtL3EvbnJMWlVLQzE1NnlyVDdSNmVYOFdiaU9hVTc5UW1UU0wz?=
 =?utf-8?B?K0tQa2d5eFVjbHRiZ1ovQXRoMHl1RllkQmR4Mkg1dkZVZVlBWjd4Q1VxQk9z?=
 =?utf-8?B?Ui9BSnczRGVoOVpPTlY0bkQ4YWtKTmRvazdpS0Z2bWt0R1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU4rL08vMUI3Y0E3S1ZNRVR6UEZsWjRlZ0tvbkdEN3Q5QlA0QW9zNHdvZ2hE?=
 =?utf-8?B?QzdPSUxmdThFdERZRkJOSzlLcGk1NWFiUUdDK1A2UUlzR3NSVDluZEN6U25t?=
 =?utf-8?B?V2QvTW54L0ttTElYbFF0VmtiVW5rOE53T0JvL1d6c05JT0RzMVJ1bXQ1ZDE5?=
 =?utf-8?B?VEZiZTNRMHZ3T05GQlI2WCtTQTF3aFRGQjZ4cFZRQXhxUTViZ3k3eWJoQmxS?=
 =?utf-8?B?a2tuOFlIUHA3RW9JU3BsZFk1WnV0SnE1Q2FwK3p0L0FLSWRyVE9BcjZSczlN?=
 =?utf-8?B?bldWMlRCQURlSTN6UTFpM0pQTFNjbTVWTTVicG5ibVhaeTh0c0VkRXIrTG4y?=
 =?utf-8?B?MkEzSFBvL2hlYThZSHZmMXoxVldtMHdjMFRqRWZ3YjFqNW9haGJERHVHU2s1?=
 =?utf-8?B?bW9kMU5tcjRLTTQzTDg3ZXRLbU1rUFBWd254WUFQWWladHJBWDREQ3hpQm5V?=
 =?utf-8?B?TExNVkpob3R4UnBCNXE5Z2Y3dlgvSVZKaU9uUGEyUFVEejdIL2hyT0graW9V?=
 =?utf-8?B?TEhiN2I4R1E5ejZIN25Cc2JuencyWFhCanZXcFFSeVBHSThNWkhMNStGTEF3?=
 =?utf-8?B?aG13dWE3eHhLWUxHVzRTaG5pd2ZISDRXd1NkMHRrcmkzK0NkMlMyZURFM0tr?=
 =?utf-8?B?NERDcHhyM0trMXBGTzRjcWpNZFZEaTQ2Y0xoRU9la1ByUmpVL1hXeGIvcU44?=
 =?utf-8?B?b0Q2WWRBV1hMU3BJQ0wzS3lwUndHVkx0L0VpYVZxTUNCYlhmTC9acUdUYWtN?=
 =?utf-8?B?Yk9zOTRDMjJYeksyaGxTblVsNFllRTkyeURVMGg4Y2pzNU1FaVMyT2ZhZlE3?=
 =?utf-8?B?NC9jRkRFNFVpRzQweW5OOExoS2N5UHlYWnVSNm5PM1VYR05YeUthdXBxbldZ?=
 =?utf-8?B?alF5eWt4ZXhucHlyTnZuYmdMbS9idHhKaGhQL3JRWG9VZ1psaEo0ZmxtaXZQ?=
 =?utf-8?B?eXdxSkxZaVlsOW1jVndNaHB0aE5BK2dUMTloLzRHUFo2aHBOWXZnT2dwTGZv?=
 =?utf-8?B?MUVESEpjdXA4d1V6ZTFDc1JnSG5yYmNmdmFXTFNXTkRLYVBaSlpSS1R6STN0?=
 =?utf-8?B?ZzFDSW9ySi9sb3pVNnRHSnlYZXU0NWFJdnIrVEd6WkFyNDRkVTI0QUd2NzFj?=
 =?utf-8?B?c0lwL1FxdzJSUnJLLytTZWMzeWRSV1owNmdjY2JVME9iZEZOOHd0bnJ4bUpV?=
 =?utf-8?B?MWsxOGFUemZlbk93YjA5d0t2LzVKU0hYMUtWV1AyYXU3LzFMMS9NcFJncjBm?=
 =?utf-8?B?SFo4U0JaamRMcktHR285cjVZSlN4eUpZSDdwNHBudGRZemFDUElpLytsVWVq?=
 =?utf-8?B?bXYzNFFkdU9UdHNmeHdJbWkybkdBSStqVnFocFBRTmZNUG1ZMUg4MFhpYm1G?=
 =?utf-8?B?TnlsUSs1ZjkwL0U4R2p5SkxRR3Evem1Ca0xlWkN2UlFQSWl4T2NVM1hTUkRH?=
 =?utf-8?B?ODNja2E1RDVaUHdOaUJJM1RvTnVZVjBQbzJLNkcvQUVua0JsVDZRcFVKblQx?=
 =?utf-8?B?VWpOUFNsUGNOQzRUcVVoVGo2V1Y1bkk1NkFaT2tjcGxMNUo0a2pXM1RiMU80?=
 =?utf-8?B?Wlg3NHg1WThEdEJlZkJGYnhZK2NOTGZyZHYwSU11VEprajI5YzI3bVBTWWRX?=
 =?utf-8?B?RVZ2R09LZjdoT05WMGNSS0pvc3JVdWFFYUF6MC9mNU1aMkJoUW85a1p3ZDVN?=
 =?utf-8?B?VXd1ajJhUDIwTlNKL0NMQjZEUE1xVnVaanBWZUI0amQ2VGRnVk9rYmRRUFov?=
 =?utf-8?B?UHYwbURVam9uVVl1Q1BqMmVJbWljUGcvNzNPamNoT3pTOTR2Zlhmd25tM1gz?=
 =?utf-8?B?RjFFcWRTdzlob1BqNzhRNTVUUWhNejY5aVBXRGoxTE5iQ2IxcUcwdTYvUFdO?=
 =?utf-8?B?SGRBWFhZd0QxVTdWUnNTYVZFSXU2RzVDUTBkbDRGUER0RjlVK2VYTUFpL1hW?=
 =?utf-8?B?blZIUHAzSUZHOFplenNDV1l2bGwwaHRzazRDa2tmYU1MbHZxa1lmdCsrTDFp?=
 =?utf-8?B?bE5YWWwrNEhTdmZ2THpLUm9TY0ZHZDZUU0xKcmVhR0hUdjJtalkwaE0yV2lh?=
 =?utf-8?B?QmFzbzV0Z1J4MFMwZk9JeXpoendUUjFmZkphOWgxdGM5cEVqRUlUU2JVc0Uz?=
 =?utf-8?Q?I7SUpkLIly0XNVJdfFu2TuuHj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389378ae-e389-44cf-dcda-08dd89f821a2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 04:08:16.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1vJ1QELDf+voDp2MgP9LO2Vad5TvN7dn7dfkySbKkMSgsxM8U9e87GAARMs/9u7EiYBQxdFQOyw1CaUPzcFsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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

Add explanation of fwsec with diagrams. This helps clarify how the
nova-core falcon boot works.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/fwsec.rst | 180 ++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst      |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/fwsec.rst

diff --git a/Documentation/gpu/nova/core/fwsec.rst b/Documentation/gpu/nova/core/fwsec.rst
new file mode 100644
index 000000000000..bed941ac3f2b
--- /dev/null
+++ b/Documentation/gpu/nova/core/fwsec.rst
@@ -0,0 +1,180 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+=========================
+FWSEC (Firmware Security)
+=========================
+This document briefly/conceptually describes the FWSEC (Firmware Security) image
+and its role in the GPU boot sequence. As such, this information is subject to
+change in the future and is only current as of the Ampere GPU family. However,
+hopefully the concepts described will be useful for understanding the kernel code
+that deals with it. All the information is derived from publicly available
+sources such as public drivers and documentation.
+
+The role of FWSEC to provide secure boot, it is running in Heavy-secure mode. It does
+firmware verification after GPU reset and load various ucode images on to the other
+microcontrollers on the GPU such as the PMU and GSP.
+
+FWSEC itself is an application stored in the VBIOS ROM in the FWSEC partition of
+ROM (see vbios.rst for more details). It contains different commands like FRTS
+(Firmware Runtime Services) and SB (Secure Booting other microcontrollers after
+reset and loading them with other non-FWSEC ucode). The kernel driver only needs to
+to do FRTS, since SB is already already after reset by the time the kernel driver
+is loaded.
+
+The FRTS command carves out the WPR2 region (Write protected region) which contains
+data data required for power management. Once setup, only HS mode ucode can
+access it (see falcon.rst for privilege levels).
+
+The FWSEC image is located in the VBIOS ROM in the partition of the ROM that contains
+various ucode images (also known as applications) -- one of them being FWSEC. For how
+it is extracted, see vbios.rst and the vbios.rs source code.
+
+The Falcon data for each ucode images (including the FWSEC image) is a combination
+of headers, data sections (DMEM) and instruction code sections (IMEM). All these
+ucode images are stored in the same ROM partition and the PMU table is used to look
+up the application to load it based on its application ID (see vbios.rs).
+
+For the purposes of nova-core driver, the FWSEC contains an 'application interface'
+called DMEMMAPPER which is used to the "FWSEC-FRTS" command (among other commands it
+is capable of executing). For Ampere, FWSEC is running on the GSP in Heavy-secure
+mode and runs FRTS.
+
+FWSEC Memory Layout
+-------------------
+The memory layout of the FWSEC image is as follows (this is using an GA-102
+Ampere GPU as an example and could vary for future GPUs and is subject to change
+completely, it is just provided as an example):
+
+Here is a block diagram of the FWSEC memory layout::
+ ┌───────────────────────────────────────────────────────────────┐
+ │                         FWSEC ROM image (type 0xE0)           │
+ │                                                               │
+ │  ┌─────────────────────────────────┐                          │
+ │  │     PMU Falcon Ucode Table      │                          │
+ │  │     (PmuLookupTable)            │                          │
+ │  │  ┌─────────────────────────┐    │                          │
+ │  │  │ Table Header            │    │                          │
+ │  │  │ - version: 0x01         │    │                          │
+ │  │  │ - header_size: 6        │    │                          │
+ │  │  │ - entry_size: 6         │    │                          │
+ │  │  │ - entry_count: N        │    │                          │
+ │  │  │ - desc_version:3(unused)│    │                          │
+ │  │  └─────────────────────────┘    │                          │
+ │  │         ...                     │                          │
+ │  │  ┌─────────────────────────┐    │                          │
+ │  │  │ Entry for FWSEC (0x85)  │    │                          │
+ │  │  │ (PmuLookupTableEntry)   │    │                          │
+ │  │  │ - app_id: 0x85 (FWSEC)  │ ───┼────┐                     │
+ │  │  │ - target_id: 0x01 (PMU) │    │    │                     │
+ │  │  │ - data: offset ─────────┼────┼────┼───┐ look up FWSEC   │
+ │  │  └─────────────────────────┘    │    │   │ application.    │
+ │  └─────────────────────────────────┘    │   │                 │
+ │                                         │   │                 │
+ │                                         │   │                 │
+ │  ┌─────────────────────────────────┐    │   │                 │
+ │  │     FWSEC Ucode Component       │<───┘   │                 │
+ │  │     (aka Falcon data)           │        │                 │
+ │  │  ┌─────────────────────────┐    │        │                 │
+ │  │  │ FalconUCodeDescV3       │<───┼────────┘                 │
+ │  │  │ - hdr                   │    │                          │
+ │  │  │ - stored_size           │    │                          │
+ │  │  │ - pkc_data_offset       │    │                          │
+ │  │  │ - interface_offset ─────┼────┼────────────────┐         │
+ │  │  │ - imem_phys_base        │    │                │         │
+ │  │  │ - imem_load_size        │    │                │         │
+ │  │  │ - imem_virt_base        │    │                │         │
+ │  │  │ - dmem_phys_base        │    │                │         │
+ │  │  │ - dmem_load_size        │    │                │         │
+ │  │  │ - engine_id_mask        │    │                │         │
+ │  │  │ - ucode_id              │    │                │         │
+ │  │  │ - signature_count       │    │    look up sig │         │
+ │  │  │ - signature_versions --------------+          │         │
+ │  │  └─────────────────────────┘    │     │          │         │
+ │  │         (no gap)                │     │          │         │
+ │  │  ┌─────────────────────────┐    │     │          │         │
+ │  │  │ Signatures Section      │<───┼─────┘          │         │
+ │  │  │ (384 bytes per sig)     │    │                │         │
+ │  │  │ - RSA-3K Signature 1    │    │                │         │
+ │  │  │ - RSA-3K Signature 2    │    │                │         │
+ │  │  │   ...                   │    │                │         │
+ │  │  └─────────────────────────┘    │                │         │
+ │  │                                 │                │         │
+ │  │  ┌─────────────────────────┐    │                │         │
+ │  │  │ IMEM Section (Code)     │    │                │         │
+ │  │  │                         │    │                │         │
+ │  │  │ Contains instruction    │    │                │         │
+ │  │  │ code etc.               │    │                │         │
+ │  │  └─────────────────────────┘    │                │         │
+ │  │                                 │                │         │
+ │  │  ┌─────────────────────────┐    │                │         │
+ │  │  │ DMEM Section (Data)     │    │                │         │
+ │  │  │                         │    │                │         │
+ │  │  │ ┌─────────────────────┐ │    │                │         │
+ │  │  │ │ Application         │ │<───┼────────────────┘         │
+ │  │  │ │ Interface Table     │ │    │                          │
+ │  │  │ │ (FalconAppifHdrV1)  │ │    │                          │
+ │  │  │ │ Header:             │ │    │                          │
+ │  │  │ │ - version: 0x01     │ │    │                          │
+ │  │  │ │ - header_size: 4    │ │    │                          │
+ │  │  │ │ - entry_size: 8     │ │    │                          │
+ │  │  │ │ - entry_count: N    │ │    │                          │
+ │  │  │ │                     │ │    │                          │
+ │  │  │ │ Entries:            │ │    │                          │
+ │  │  │ │ ┌─────────────────┐ │ │    │                          │
+ │  │  │ │ │ DEVINIT (ID 1)  │ │ │    │                          │
+ │  │  │ │ │ - id: 0x01      │ │ │    │                          │
+ │  │  │ │ │ - dmemOffset X ─┼─┼─┼────┐                          │
+ │  │  │ │ └─────────────────┘ │ │    │                          │
+ │  │  │ │ ┌─────────────────┐ │ │    │                          │
+ │  │  │ │ │ DMEMMAPPER(ID 4)│ │ │    │                          │
+ │  │  │ │ │ - id: 0x04      │ │ │    │ Used only for DevInit    │
+ │  │  │ │ │  (NVFW_FALCON_  │ │ │    │ application (not FWSEC)  │
+ │  │  │ │ │   APPIF_ID_DMEMMAPPER)   │                          │
+ │  │  │ │ │ - dmemOffset Y ─┼─┼─┼────┼─────┐                    │
+ │  │  │ │ └─────────────────┘ │ │    │     │                    │
+ │  │  │ └─────────────────────┘ │    │     │                    │
+ │  │  │                         │    │     │                    │
+ │  │  │ ┌─────────────────────┐ │    │     │                    │
+ │  │  │ │ DEVINIT Engine      │<┼────┘     │ Used by FWSEC      │
+ │  │  │ │ Interface           │ │    │     │         app.       │
+ │  │  │ └─────────────────────┘ │    │     │                    │
+ │  │  │                         │    │     │                    │
+ │  │  │ ┌─────────────────────┐ │    │     │                    │
+ │  │  │ │ DMEM Mapper (ID 4)  │<┼────+─────┘                    │
+ │  │  │ │ (FalconAppifDmemmapperV3)  │                          │
+ │  │  │ │ - signature: "DMAP" │ │    │                          │
+ │  │  │ │ - version: 0x0003   │ │    │                          │
+ │  │  │ │ - Size: 64 bytes    │ │    │                          │
+ │  │  │ │ - cmd_in_buffer_off │ │────┼────────────┐             │
+ │  │  │ │ - cmd_in_buffer_size│ │    │            │             │
+ │  │  │ │ - cmd_out_buffer_off│ │────┼────────────┼─────┐       │
+ │  │  │ │ - cmd_out_buffer_sz │ │    │            │     │       │
+ │  │  │ │ - init_cmd          │ │    │            │     │       │
+ │  │  │ │ - features          │ │    │            │     │       │
+ │  │  │ │ - cmd_mask0/1       │ │    │            │     │       │
+ │  │  │ └─────────────────────┘ │    │            │     │       │
+ │  │  │                         │    │            │     │       │
+ │  │  │ ┌─────────────────────┐ │    │            │     │       │
+ │  │  │ │ Command Input Buffer│<┼────┼────────────┘     │       │
+ │  │  │ │ - Command data      │ │    │                  │       │
+ │  │  │ │ - Arguments         │ │    │                  │       │
+ │  │  │ └─────────────────────┘ │    │                  │       │
+ │  │  │                         │    │                  │       │
+ │  │  │ ┌─────────────────────┐ │    │                  │       │
+ │  │  │ │ Command Output      │<┼────┼──────────────────┘       │
+ │  │  │ │ Buffer              │ │    │                          │
+ │  │  │ │ - Results           │ │    │                          │
+ │  │  │ │ - Status            │ │    │                          │
+ │  │  │ └─────────────────────┘ │    │                          │
+ │  │  └─────────────────────────┘    │                          │
+ │  └─────────────────────────────────┘                          │
+ │                                                               │
+ └───────────────────────────────────────────────────────────────┘
+
+.. note::
+   The FWSEC image also plays a role in memory scrubbing (ECC initialization) and VPR
+   (Video Protected Region) initialization as well. Before the nova-core driver is even
+   loaded, the FWSEC image is running on the GSP in heavy-secure mode. After the devinit
+   sequence completes, it does VRAM memory scrubbing (ECC initialization). On consumer
+   GPUs, it scrubs only part of memory and then initiates 'async scrubbing'. Before this
+   async scrubbing completes, the unscrubbed VRAM cannot be used for allocation (thus DRM
+   memory allocators need to wait for this scrubbing to complete).
\ No newline at end of file
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 91cc802ed94f..22e5712ac6b0 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -28,4 +28,5 @@ vGPU manager VFIO driver and the nova-drm driver.
 
    core/guidelines
    core/vbios
+   core/fwsec
    core/todo
-- 
2.43.0

