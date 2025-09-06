Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C4B46AFB
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 13:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C3310E0D1;
	Sat,  6 Sep 2025 11:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hyLClQ0W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8AE10E073;
 Sat,  6 Sep 2025 11:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPH639WGV8ApA+8GpZiOoqfbet5NwnUVQcSrHPYQOIwxSnmsj7xc9H4m19Nihz/shG4OPB5eNk1Li5I9EkmKK0to4KESp98NfoUqZ7hu9eT8hhpfNeb5PtSKjPNdXC1Apc2u8O6LudTo/EjIN+VRmU8JpwAVghkpqhjQ/b1yCYqMJOWNtC8gMW0mGqzUPEArV5p04i5I2vkbITQyPg1V9dU/HYkBQef88zTbVJAZoDix7ZbhsKmqdSN1rAWufyTlftdZzjPmarDEYyVVIbx4CKL40pFm7SC5f+MYRegmQlXk2LEcisuoccBpJ8hTNNGStf9T4XpNO4yshyNZ5avNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Jfo3d9zKaDExmzuKMETD73wUAFr5OicnxQVr4hX1zY=;
 b=CUdGAWPitYPqR1/dgbRdk4Q0QQyBngG/fZjBdEWtyOB4EptUHa/S/koAhO6BMz42rXj9/fn0eaTNJ4KvylwE1YP//LWR8Ezz0NHE6yQvrTgC1OC4oDOcJtpfII+M6vjOzP+plr1KQEaqgcqyKAEkAUvVoqSQnqIytYq5TtwqNFq58FX3LH53z1/6bkEBRfHHFRtSS3z/BNGGtXMjaEM+pOZDSbO0GtwVoU+JblaqFQcg0hra0pjDRRvQRKR72DteVLp7rXcEs8v4y9i79GIwQviKaYJY/3XgPo2kCfi/yJUEC333LkVbQ3xUe+2Lurlq0YoLx0APw7Ak3jYujjw5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Jfo3d9zKaDExmzuKMETD73wUAFr5OicnxQVr4hX1zY=;
 b=hyLClQ0WE+S/qFijueDxiwP00ivvhnkLu/inLqy8oib1fol0G5ka4CHBnIPagwRtIQBo8xUHxn2pDKYRrbgcjt58w+VUD5NA+/gw3gNc6DzMff5SZa+0RNFE567i/OM+gLdNZLfSI/mwOS8/hrLSJos5AeQK4hKtD3ZxubYSMi9tQOer6QknA5EvncCkFHA4YOd248pilx1pXToge/mY5BO/zLJxCIlVDjuq+aY9D0ySMfsAb2w/EZ9KfenB0jAUktNYDV7nr3ez/VxKyScowcGVZmDplmKSrIe40LVo7pjphVmhqOWfVYJwY8ThnnrI3I7PnbCshkod5e5HSlBBGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Sat, 6 Sep
 2025 11:20:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Sat, 6 Sep 2025
 11:20:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Sep 2025 20:20:33 +0900
Message-Id: <DCLOE92YDQA9.23NXB1CTFN51V@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2] gpu: nova-core: take advantage of pci::Device::unbind()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250901150207.63094-1-dakr@kernel.org>
In-Reply-To: <20250901150207.63094-1-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9df77b-5471-4e3f-d03f-08dded376756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWw0Rk9YMHZHUzlVeEZBcFVSaERVK1Nwb1k0MDBqRXAxN1JKb3FNU3RzRkQx?=
 =?utf-8?B?MUFqaS96ZHVXNVgxMlNRSzZCMFFDbmpEU0hHRDJxMTB6Y2JYQ1lqSUJrdnBC?=
 =?utf-8?B?REFpeHJGeDV6TnFWQ3VpdUxHb0dPNUovVGg5UzFEOFduL3BDM0J4eGNaSEFw?=
 =?utf-8?B?UWV5QUdNblVVYWZQaG4zdWlwZ3lJSlJsVzJSSHJkYms5RXRMOElCeXdnN2hV?=
 =?utf-8?B?RWtSd052NGphSS94elo2TjdvOFZOMGQ5ZE93VXhGVzNSR2RZd0IvSEVOQ3lI?=
 =?utf-8?B?cnVleDVnNU82K3NuWmVsbW5ZTzg2Y2w2N3BNME5ZUDRydXVtcUJnZmQyRHlD?=
 =?utf-8?B?dXJPaUxLOXNZQjVLY2lzb0NRL01mWU9MVGN3M3R6eWJtMTZ6NzQrYWd0Skdn?=
 =?utf-8?B?QktkTFlSZU9pUDkrQVJqR3ZCU3pveldZd2J5c2hmL2kwSnQxcEN6eUc3dTFF?=
 =?utf-8?B?Q1NidEk0KzRiRHREQTM4aTVVc0lFRHVLcExRYktwd3BNZFZPbmJPd09VMi9J?=
 =?utf-8?B?M0RkY0crcld5N3lNSmFRb0JqWnpvZXhjWUZFS0xVRHhpZGYrL0RnWXgzWkY3?=
 =?utf-8?B?aXdSLzNSS0hrUFE1S0N1ZnNKenhEcWYyWWZYNHRUR3Z1ekF1WElLR2pGaE1J?=
 =?utf-8?B?Yk5PVzJhSnNuMGxycHRDRXQxMm1WY3NvK202VGpOUlFYTkFLT3RPb0dLNzRl?=
 =?utf-8?B?WTlOTkZHMit0RFhleERoKys2WHhDQUcxU05BeWxGTVgxOFVTbGcyVWxWYStO?=
 =?utf-8?B?VGtFaFlQSVJmTjJqbDZoMWplcEFaWUthV0o5aHFNZHlJVXhuam9oTUpRSHMv?=
 =?utf-8?B?TFZhNHo5UldkUWhMQklIajJSUGhQWEt1N0dmTzYwM25RbG4rcnlHc2dqays2?=
 =?utf-8?B?eUg0aXJlNDJVV0lTdWlPSW44anl1SVRlREVWajBiN2x4TlpPdmMxdm1VWE8z?=
 =?utf-8?B?ZVcxR0Nod2ZjSHFUNS9UWlQzVFZpTWZLNU1KL0hNYml6VmgyWi9UbnUvMVlX?=
 =?utf-8?B?NmZqMkR1d3ZkNUs0cVFZcFFnVVl2RXBrSEtFQXgvT2MwTnlrUEUvdGNGaWE4?=
 =?utf-8?B?UU1NNW9ZRmFIVlFhZmNmNUdWTXNweGo5NCtFYVRhRmhkZFgzcjFLVFJwcC9C?=
 =?utf-8?B?VldoVUQvNmVjODJ2Um5MWGYrSUNHSVdHUnNzRktaYnBwVlBCN1RUMndWNm9L?=
 =?utf-8?B?WU9yeGdSZjVlTVVGTHVYenRQQUxuaHNsYTVMeHVNTStjdlZjRzhOeWxqLy9I?=
 =?utf-8?B?MkUvdzBURmQzRDNqVk9EbjMzNUNRWTNUVXgyN2lxSlp5bFJUUnFrSzFVK1Yw?=
 =?utf-8?B?MHAwYzVBZkp1VGowYXlqYzdoQXM4OWFweHdCUFQ0TC9HMmNGb2Z2M0t0eHh5?=
 =?utf-8?B?V1kxVmU4Ni83NUtSVXJaYmo0YldBNFJsNlVHeHZISnJsaUNUcFY4YnVFcjVX?=
 =?utf-8?B?Zm1QdUFNdTZTK1BGdDNMa3JNbUxCZFBqSUhrb1llN21TU0o5ZDRsTktFM1JQ?=
 =?utf-8?B?a3RKZVhRRnJicTU0M0I3cWR6S3FCYXNDeHVLWHp6amhJZHBPSWNVbk5YeUJ3?=
 =?utf-8?B?UTZxQUZFaTZDaktieUdYdnZMVGk4TU9hbUdNODJUd3MrTGdkWTVzYnUzVTVO?=
 =?utf-8?B?ZGpVOFV6VGNhL1BMem42T2x2L3ZtRStNOUwzZVQyQkhBKzFzNFpoRVYrUzFQ?=
 =?utf-8?B?elVHTU9uQmtFNy83RnR6eGJwbUxXazgybTBvWjdJcGgzYVZDNXRQT1pZVlI4?=
 =?utf-8?B?cTlKUEV3RWtvWmFuMzh6a0gzbVZ0cnU0NGFKT2ltem9TeVZJZm5IbzJMTnNu?=
 =?utf-8?B?OFJUaFlzekwxVFRsL0FGOG5WdXVROHpXekJBeDFPWHEwbFJ5R1ZSNlJKUS9L?=
 =?utf-8?B?bnNTZXY5MGoxdFU0VjJ3V2ZBZk5ZV1RsbytFaExKRVRDcDQyTDlEQnFROElI?=
 =?utf-8?Q?d1GbgZB7pbY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGpGTGp0RHpoUml5bUhWSGIwUWlDNzJSOUZ1WllaVUwwVFBUQTd1YzlyaDQr?=
 =?utf-8?B?MThGdkRSeEZUZjh6MFMxdUlzTXhYYy9JVG9tOFJCN0prNFBYYk5ac3ROM3pr?=
 =?utf-8?B?Tm90YVhiZHRhcHVudi8rY3l3TnFsVlEvQ3ZqaFdnN1lnV0ZkSHE3dHZ5aURG?=
 =?utf-8?B?dUg3QXBaT09yVGZIdTEyYkdVczRWMW81L1F3alZNSS9xZE1PeU84WGxJTmZS?=
 =?utf-8?B?UzRZQU5adFJJVkF4WDBuZmwvV2NHZ1BTaEp5N2lueC8xZmd4VTdaMkI2Vnlj?=
 =?utf-8?B?bDVjL2U1cHZ1bC95eDJzMzAwdXBqRmIvS082VjAzQzI0VUVKWVZabVdGbWlx?=
 =?utf-8?B?N01ESzh4R3Zta2tWS3VNd2Fqd3FBZVNXWmRRZ0daVGgvdUJEL3BxbCtFeDA0?=
 =?utf-8?B?SzdDTnFCYVJIb25qUW4wZXhPb2N1amY2KzBJN1hjVVFUYmFQcFEwVGtvTzkv?=
 =?utf-8?B?c1pzWUJ5S3BmY3FST0RLOGhGOXNtMm9hM0hHajA1YUhJMzljY0ZyRC9UTCsy?=
 =?utf-8?B?b0lWSUJUa0N1T2dVRFlraGFzMDBVaVN1OVgwUjM0ZjlyOUd2NzFTZWd6aGx2?=
 =?utf-8?B?SldaNnY0WnJrYlZPdHd0R1dKcFJ0alZkV2tkTjI2R0c1bUJPQ0lLUFY3ZUxT?=
 =?utf-8?B?YXA2U0NVQU1hbFlucUhES25tcm5SRHptam1idmo5bnFGRktSbFZOSzN6Rm9n?=
 =?utf-8?B?NVRLU2JxOW11UXpJTGRubHM1N3hRcWQ2MTNFVDMyTWdPM1Yxd01iZy9RRi9B?=
 =?utf-8?B?WVZDOEU3cGhRRVFPSVZVMUxNUGZQTklqN2NvTzRxN20xZC8zVTkxZUVLZzcw?=
 =?utf-8?B?Z1I5dFFTaEhQS1EyVjNkK2NVaklKR3B5MURHZ2VaZTVIWjEza08rTWFBWFlo?=
 =?utf-8?B?aFRxNzBqWlRPTTU2eTRTSmlEam9hb0ZhUlcxVTMyWHhTRUtJaXc1MGRkMXVM?=
 =?utf-8?B?Q3hia3NoMzVNeVNrNjB0Vm84MUh5Z2drcHBQZHdrOHNLNk1tUXU4MVBWVCtJ?=
 =?utf-8?B?dWkxMnpnWG81bGY1b1JBK0ZNalNER0xLWjRiZXAweTZiUTBvMitFZWl2eTNI?=
 =?utf-8?B?TEVMcVMxbHBySCtxNDZlOEpDV29HOVBvSVRLYjNLeHFFZURNZFNyazV0d3I2?=
 =?utf-8?B?OGdxaHZNenhVTFd5Vk5zaExHakVsZ0FjYUJZaCtWWFhQcWhSakcrd2QrMnJk?=
 =?utf-8?B?NUp5RXhLNWRrWjkwcW4wOHYvMlhHMjRJeDJTZnFudnBxeVpuSCt0NlFVUkpv?=
 =?utf-8?B?clBIM2puTFl2R3Jsalc0VVlMVjc0eWZhNWNsMXJWc2hsd2tCaDFQb3hxdkl0?=
 =?utf-8?B?NDRtcXFsczVoTVhnQmJXNkpCcGlyR0QxdHVmUGdFK04xOUZORW12S2V6ZUND?=
 =?utf-8?B?QVEvay85dWJoNkNSUC9sZk5pcng3ZVh0cDJwZjVMWnp1S2RHMlFIUkRKTmRj?=
 =?utf-8?B?VWZ3MWFQUnRCaVN1UzJSR0RJbjd5bkdNZ2Z1Qm1RWE1LZjZncENrbWhQWENX?=
 =?utf-8?B?V1F0V0Zsc2MvVmhxd1Q3YkJvd2xpczZvVkQ1bXFlYnN0Tm5mQ0g0Tk82c0Vm?=
 =?utf-8?B?aldoUkRWZnJJclcwTE9lR3VzWm0rSk9qWVh1YXRUeDBPSWNhTjRFVERSV3Ux?=
 =?utf-8?B?NG14RXh3ZkRaNndTQWtuanBjdzhFWGdFcnYyYWNDNEx6Q05VTGxIMHlIVTRN?=
 =?utf-8?B?YmVJWDg4MU04ZzBwSEdpbnQrSTV0MGU1aFVDVEltNnBLejM1dkt1RXA3VVBO?=
 =?utf-8?B?clBzdkU3Q2l5VndvTHRxMFUvMk9qU0tFUUFrWXNGRlNXYXNtUkgwK2RjWDlV?=
 =?utf-8?B?bGRqd0tuNUQrbzJrYTNtc3NMM2NKdWplaDYvendwa2tud2VZbGtXOTVaN1Uz?=
 =?utf-8?B?dFdGcGcrbnlENFVURG5WN2ZoTm1UNHJoSHBJSDFqL2Iya1E0Q3BxYU1zVkxH?=
 =?utf-8?B?SVpleS9RTnZWSWZZNi9QUkZFVHNuU1l5SS9aM1NTZ0RrTGJibDFUemtQT21q?=
 =?utf-8?B?QWZnQ2JGUVNEUEkzU1R0Q3VzWmtKbHAvdHVpNUw5WlpsOFFNN1BZNDVsVDI2?=
 =?utf-8?B?a0E2eUNVeE1mMlJKSUxvU1VaZGFQQVlONHZVVWg4bVZseTdYUXVZWDRET2xK?=
 =?utf-8?B?cXNZTnl4M3JLdzFlUjFyb21JMUVGRzlTNVQxOTdXQUg2NWNKd1l2UGdlNjlT?=
 =?utf-8?Q?u8aXMHy/GlsvtnVtVl+6OdiapsJyT7aqY4EUJojTqksR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9df77b-5471-4e3f-d03f-08dded376756
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2025 11:20:37.1391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkWQnSFchrQ/jROI8c3yA/La7wa1tcp+QYPTO2ePUmKYVv5eT7AJRUknbGUaARhhxiHdwFOik3rRPvpH3k5Jog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094
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

On Tue Sep 2, 2025 at 12:01 AM JST, Danilo Krummrich wrote:
> Now that we have pci::Device::unbind() we can unregister the sysmem
> flush page with a direct access the I/O resource, i.e. without RCU read
> side critical section.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Pushed to drm-rust-next, thanks!
