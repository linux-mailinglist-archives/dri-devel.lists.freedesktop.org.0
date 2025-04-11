Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37107A85AA8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 12:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E3810EB70;
	Fri, 11 Apr 2025 10:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="39mwOkak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A79F10EB71;
 Fri, 11 Apr 2025 10:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggKTFt127pZh5R4nWDh/la7bzUDKl+eDApWd0d+7ePXynT8OeRFJ5jA/G1tMfU6/9QBwvcH1wgzphxbIHcaGcbE8rtHzx0K4mcR3VJ2jXKOA4OAY0VpNBKtTx5gSbaIAye1rOHr1HX3mza4AbmyAdxgc2rfuONVXNCtJ5qSStSudDPs48T2RApuTmmCtQ+2zu0tJ46N8s8qTCSZ5khe3Y4o5OQiIA8HWwEdaXWJIcCX0tIRdHFYv+FQitWQy5VpNy4Xqb2lTh2CFizQZmp6PVlDCGhU74FSDSF664NYZ5PhVNH1u/kpPLZC1JpSHrZkdiz7IwiCVITbeihwEA54TyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edM+eIk0KLO2K2+74p8yXN+EKM3DQS/9N3gabdTGh8g=;
 b=DiCXrhCjGHXcENMX9p+TvGSAPfoOj1DxoZ+WI5z/y3R5KbPqoy3OuOvIlqRm19P9T3sIoXRNcF5l5Qr1t07NxoxYGwq6ggEWkYAGEwn1a2jfstEIhf/GH4n+mfaZd2dcwDm29s3hwfNjgTpZ9d8hgkQNJyXhoU62h0aSLU5gd6VrFy8j5xC2lWC3djbKTwb5iVDTpBI/olzqXalUUJsh+6bSRQRNzVaCCCmdI+aEOcmIe3xKXgH47x0VAoY32nPgSNLC6BR8f2tpGhBmNsjTu+/DmDaMh4BIwubySV08nvY7AuR4D25g9ZMYDsDatzhup/FljN1GCek3FKeMDSvnyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edM+eIk0KLO2K2+74p8yXN+EKM3DQS/9N3gabdTGh8g=;
 b=39mwOkak/E4NDLFvnCS2k2UxX0+ge3k0pnVpscMbHuHlwuJwMf4MncrR1sHSaYRL90CfnGZt2vMSBxyebQFoTW8MbN3KSRbWapdyKK0eZiF1/sAjDIHFzR66dw21hIPUxKC52PtgKJrZqc/9lykidRAAqXBeaVNh0TAmiEWma58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:56:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 10:56:04 +0000
Message-ID: <9fd6fb8c-7dbb-467d-a759-eec852e1f006@amd.com>
Date: Fri, 11 Apr 2025 12:55:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
 <20250411103837.753cd92e@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250411103837.753cd92e@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: f24d693b-a4a4-4265-bef1-08dd78e7742c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlQyS0NHOVB1MzltdzRQbzJ6ckJ2cGFEbzFsaUVJSi9wZEpKTnMveGpVaVVM?=
 =?utf-8?B?SWpaNjA3K0NSZ0QrSG45N0NSMk9mRmdydkl2TnQra3FqOENTNTJEU0IxRVNz?=
 =?utf-8?B?a2lDeDMrZFcra3hTYmhVelY1K2RNUlNPejlzN0JoWjdPQ2doeGFVeDBEOFky?=
 =?utf-8?B?UEVuUmg2amxCYnFvUE50NmxJT29kOHZBeVNaZzdWMm1XMkE2Yk9reC9LYSsy?=
 =?utf-8?B?cllMVEJMSnJNdzVJYUdhVmFVbXNhZmVqbTBKNWt2Skp5V0pxK3BqZlhaVm1n?=
 =?utf-8?B?bEFMZEE1aE5OVkJxaC9ZVHJVVkp5Z0hjOVRKMDR1dzUwcUpIVlE1NUUrbWE0?=
 =?utf-8?B?WkNoWS96QTNrWGtObGlIa3ZqV0tyWHB3QUJ2cUVydEpWTVh1UVJ3M2ZYdnVG?=
 =?utf-8?B?KzZrNW9pRlQ5ZlZGRVB3OC9GdDkwUnh1SThUbklMNjJrV2Jwc3E1dERmSEJH?=
 =?utf-8?B?L3RSMnh3cGFoZEFueXROSEtyR2M2U3F0R1VEZGlnbXRSN1Q5bCtyNEp6NWYy?=
 =?utf-8?B?dTc3bk95RUFJZTBoK3BTOXprQWdJOTRHVGhuQVVrN3oxS2ZsdjV0dEtsRkpK?=
 =?utf-8?B?VGpJVlRUMjZWZmZYY0QvbXlMcjBXeWp2NmZkV3NINWpsUHl5SHZUY0NWaHRj?=
 =?utf-8?B?SVQrWWgvK001L0s5Mktlb2lEenJnU3BLNEdEZ2ZSMHdvaHYyMzVITEw3Wnlk?=
 =?utf-8?B?Q1FDdkpGc3FzdExnUmNQV1pKZ3oxQ0I3NzkwYklIbzhJSURVS1VBQ1dhTTY5?=
 =?utf-8?B?VXh2VWRmbHNESlNJbDk2cG45TEtvMXo1eldEOXFaVi95MERpWXZZZzZhUG5h?=
 =?utf-8?B?VWtDd3U4QzRRMVVyZGp3VE5CMTFsbCtKQlArNDJoeWNuVjFIcE9lcVlpTzY2?=
 =?utf-8?B?KzdrUmoxZzhibDZsaFhMVGZpN1RES0FIQS9TV3A5Y2EzbjRTYlE5MWQ2U2ZG?=
 =?utf-8?B?WU5NZERTcDJDdGNmZ1VTRE1hTFNiTFU5MmwwUDdtUnptVWhraGdqb3FqZmt0?=
 =?utf-8?B?V1UyUG40SEhYdHpPZDJIcmpYVnFidXlpYjRhcUs0Wm14TmM1eDR2M2FTRDB5?=
 =?utf-8?B?Um1MNmVpZHpPUUhCNjVEZkVmNVFmZi9zRmNKcTN0WUd0RElGQU9DaE9DbDMv?=
 =?utf-8?B?MmZ5NDJSMmFQd2owZEZlU0d6TnNhSEM5RUF6Si8xU1BLVEo0Z3NFaFhRajA5?=
 =?utf-8?B?OHZFckVuZzViNTlEZm5IQ3pFWkV3c1psZWZoQmllVExGRUozdDIwRU92ckNw?=
 =?utf-8?B?WFJIV21pdHhtTmp2U1djYjFzRG41VUpIU3dJVDNEQWpzUExzVUE4U1ViYVU3?=
 =?utf-8?B?OHorLzBYbTJDRFdqcThoaFQ2bHdEdXNvcXp4NlFqWmowZ1FiR3IvdjQ4anNK?=
 =?utf-8?B?ZnBhcnhTTmtmdmg4bzFIalJYMEdUSzRTSFZUblprYmsvVklUTmRvUVVqc3Zh?=
 =?utf-8?B?THcvVE1oS25henhWbFREVzA4R3BrTkxyTG5qT3NuU3Z6ck91cXRPNjV3eXVj?=
 =?utf-8?B?REJhSTBmemJEc094T05RK09KVWg1M0tZbC81Y0k4aFEyamZRU1hEQ0dsdVQ2?=
 =?utf-8?B?N0xaNGE0STBvQXRtMTNIYlR4TXNISUhlbEh3aG1oaFpmOUFmaFRxK3gwcVpL?=
 =?utf-8?B?V1NIcnA4Znc4d0RiTVhzMGdFTnkwSWhwcEdDamw3VHliMTZVMFZDTGJlUi9l?=
 =?utf-8?B?MDMydEgrbFhPc3V0aWhMUHRVeDFteXdIZm01KzBkbjRJWTVveFdMQ2VGTVNt?=
 =?utf-8?B?MVh5SUQrKzlCSFd4ZDNTOTFaZStnTGlycFcxaW1ESXpBZUk0UzNvTFA4eTcz?=
 =?utf-8?B?TklSNVpxa3FGc1ZHWUpEL0h1TEl5c2dtd3duQSs3L3pCRjRkZEdtOE15TEhp?=
 =?utf-8?B?bVNubmxCdmQ0U1J2eGFzL0UxdUQ3ZnpCR3pib1pVT1hMNm5RbjVMZmJrZGlJ?=
 =?utf-8?Q?/EZZPxF9gkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzNzZGtMQzYyNWdPc2k0ZWthRXRXN3R4RFkyS3dxOEpSNjJFZGtJNXRDR3lU?=
 =?utf-8?B?OVM2aUM4WS9BMG9KM2oyVDVOMjhXZ0c4TzdLTEx6bUhJenlJTjNaUmVjd0lW?=
 =?utf-8?B?UVgvNUhuZ3cvaDU0SUJMRGEyRGMwL2JGbzRMbzVpbzRxbm83WXlrWTJmWFk4?=
 =?utf-8?B?SmlBd1h0RHVDUEdnSXZCR1E0UHBUMXMzSmdpRDBFeUlZU0NFdzRQZ1E0cjJZ?=
 =?utf-8?B?YzZwbk1MRGhOMXhtMVVKcCt2Y3NMS2RiYVF3d2JEbkNYdWJZMDVabFVNSGl0?=
 =?utf-8?B?OExKVS8ycW1NQ3cyT2ZEYnN0dWR5c3laKzJ3Mll4a2RJOC9HS3RKWEt6MWh3?=
 =?utf-8?B?cWxQcnlmSk01U2J4YUV0R2RUdEVUS3BjVWViR1JLU3o1QjZSUTErZ3BoeFMr?=
 =?utf-8?B?Rmp0dFB3VkNHYy80MzVvZG9qaitOSSs1S3FWK2FRZHlodkZFcDdqYkg2NmFN?=
 =?utf-8?B?aGY2d3MyTVZHZmdHMlhZa2JZUmFIT0h5TDZjSDlwcUYrWkZJTlVvbXltSGY1?=
 =?utf-8?B?N0lXdGVJRzFzNldmdVgyUjV0T0t1akdYdXFUTnNZUmhOR0k5SmQwWjYxcnJV?=
 =?utf-8?B?VE1lK3dGT1UvN0dkNXZXU1lvQjZ0eW9BQWRTNFA3SHA3anJ6YXFNQzFFSmpU?=
 =?utf-8?B?UUppOVlvUStuWlQwOCtwZHVtSDV6bnRYSlhNbUhnclZhSmxJU005U3h3MG9N?=
 =?utf-8?B?Q3pLVlpLNDU0NW1NMndGM0dLeEw2TXJWbVJLd3I5RE1abnpjbUNtaVhjRmJj?=
 =?utf-8?B?MGtXRDdaOG1Sd2RUd01rNlFDSTQ5djh6eGJ5Vm1UVWlnU0RMeEZSczBFOUZn?=
 =?utf-8?B?K1dPRlB5WjhZTEhMMUQrOWg1bDJITExkUlFkNHIvSmNjWVBsT016NG9Haloy?=
 =?utf-8?B?RXhteDd6RjRrL2xabjRSVU5TTlBTQzdEL0NFWVd2TVY5Z2RudFZnYkpIOEFB?=
 =?utf-8?B?bXhnVlp0c2tzQWlJUFlob1Q4c0J4MzEvMklvenFGVG1BRlpHTllrZGZxUlRB?=
 =?utf-8?B?YlcyVmNOdTM3dFd1Y3pTYi83V3UvSDBQcWt6UTc3Rm5STVpKQUJ4U1dvZTky?=
 =?utf-8?B?cGZrNlF3SGhkRWY3aGk4czJkbk1tVVR6Z0ZmYkQ0Y3pXYmlCa3hhckowUlNv?=
 =?utf-8?B?eXpqUFlWVEJhaGdNOTRCS2UrZy9VOEpkVDdIbW12Y052NW9RSW5WM1ZXSDE2?=
 =?utf-8?B?cGVZaW1CR0JjZDNWUitMNGRDWnErWWNJRWtZc2lpUzJMRW95M3o5R0R0SHpp?=
 =?utf-8?B?WkxKRFJhQVFEY2pWZ0ZqS0RtNTVvWGpSaDZEOHBlT2RiTnBTT2piVTlFbnE1?=
 =?utf-8?B?czRLejJ0MDJlQ3FpakRSMFRTYm5oaGZPUHhGbGJwWXNWOE5XOExCMDVaelZZ?=
 =?utf-8?B?T1J1MDRqZUNza0RIOHg5UGlseTBsSVVYMGVYQUsxUTFub2FMTTlJelpmRmY5?=
 =?utf-8?B?K2RzRlhCaUtjWmh0bklqQ01MMm53MHZsMm1TaHhNKzR3bHc2RXdEUko5NjF5?=
 =?utf-8?B?UGpNSmIrRi8vT25UYy9yejE1NzkvSDFYdktlbTZ6VGFPc2RwY1kyL3pNemts?=
 =?utf-8?B?d1RZc2txQXQ5TWpycW16UVdyQzJCZEhsaURKdndRKzRNQkp0Z28vb285N1lm?=
 =?utf-8?B?dGFaM3VKZ3p5L1BrMzdJN2QzSlhkSUd3cTNjNmNEUDJoNXVSR25KSzQ3dkdk?=
 =?utf-8?B?SC93WElyTFNLUVd2azdOanRrTVJHNUd1ck5TL2pnQ2xabXFkaFcwU3BIZm1Z?=
 =?utf-8?B?dDlMWENkUmUvZzUyQ0F5dUU3QXR6SzN0ZmlaZ2JFS1ZCUHFFOWI2Q2NYYUgw?=
 =?utf-8?B?czMrcTE2RDROK3lnMi9jWWZkTzdlMW1kYTB6dkRwVWE4dFJCT2ViYUNlVkpC?=
 =?utf-8?B?UTZxU1Y4U2R1OGV3QnBGaG1ZQUs2ci9rQmZheE9XZEFvb0xjZGcrVEwzOW5X?=
 =?utf-8?B?dHcreFdObXpEb2JGcmJ2U1JrUHpRYm9ES3lWU3EzaFhSZlVLclcweDZKejN0?=
 =?utf-8?B?S1pmOWxwblpDSW9pa2QzbVI2VGcwMjJWdkdyMHJlS3RvaDBoUVQvOGN4Vmlt?=
 =?utf-8?B?SHFYMFRUYnJlN1FxRW9wcERERE5MYm56VUswZTc0SjBINTRFSEJSSlJNZEZy?=
 =?utf-8?Q?UcEP35Na1VsiEno76Ec8oMTsS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f24d693b-a4a4-4265-bef1-08dd78e7742c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:56:04.0227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VdgRfYQxPOLi8qxUvyNF2qp5n09atu0rKa8vhC4WdoQ1mQr+z/cBlBxEGku/kIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932
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

Am 11.04.25 um 10:38 schrieb Boris Brezillon:
> On Fri, 11 Apr 2025 10:04:07 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 10.04.25 um 20:41 schrieb Boris Brezillon:
>>> On Thu, 10 Apr 2025 14:01:03 -0400
>>> Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
>>>  
>>>>>>> In Panfrost and Lima, we don't have this concept of "incremental
>>>>>>> rendering", so when we fail the allocation, we just fail the
>>>>>>> GPU job with an unhandled GPU fault.      
>>>>>> To be honest I think that this is enough to mark those two
>>>>>> drivers as broken.  It's documented that this approach is a
>>>>>> no-go for upstream drivers.
>>>>>>
>>>>>> How widely is that used?    
>>>>> It exists in lima and panfrost, and I wouldn't be surprised if a
>>>>> similar mechanism was used in other drivers for tiler-based GPUs
>>>>> (etnaviv, freedreno, powervr, ...), because ultimately that's how
>>>>> tilers work: the amount of memory needed to store per-tile
>>>>> primitives (and metadata) depends on what the geometry pipeline
>>>>> feeds the tiler with, and that can't be predicted. If you
>>>>> over-provision, that's memory the system won't be able to use
>>>>> while rendering takes place, even though only a small portion
>>>>> might actually be used by the GPU. If your allocation is too
>>>>> small, it will either trigger a GPU fault (for HW not supporting
>>>>> an "incremental rendering" mode) or under-perform (because
>>>>> flushing primitives has a huge cost on tilers).    
>>>> Yes and no.
>>>>
>>>> Although we can't allocate more memory for /this/ frame, we know
>>>> the required size is probably constant across its lifetime. That
>>>> gives a simple heuristic to manage the tiler heap efficiently
>>>> without allocations - even fallible ones - in the fence signal
>>>> path:
>>>>
>>>> * Start with a small fixed size tiler heap
>>>> * Try to render, let incremental rendering kick in when it's too
>>>> small.
>>>> * When cleaning up the job, check if we used incremental rendering.
>>>> * If we did - double the size of the heap the next time we submit
>>>> work.
>>>>
>>>> The tiler heap still grows dynamically - it just does so over the
>>>> span of a couple frames. In practice that means a tiny hit to
>>>> startup time as we dynamically figure out the right size,
>>>> incurring extra flushing at the start, without needing any
>>>> "grow-on-page-fault" heroics.
>>>>
>>>> This should solve the problem completely for CSF/panthor. So it's
>>>> only hardware that architecturally cannot do incremental rendering
>>>> (older Mali: panfrost/lima) where we need this mess.  
>>> OTOH, if we need something
>>> for Utgard(Lima)/Midgard/Bifrost/Valhall(Panfrost), why not use the
>>> same thing for CSF, since CSF is arguably the sanest of all the HW
>>> architectures listed above: allocation can fail/be non-blocking,
>>> because there's a fallback to incremental rendering when it fails.  
>> Yeah that is a rather interesting point Alyssa noted here.
>>
>> So basically you could as well implement it like this:
>> 1. Userspace makes a submission.
>> 2. HW finds buffer is not large enough, sets and error code and
>> completes submission. 3. Userspace detects error, re-allocates buffer
>> with increased size. 4. Userspace re-submits to incremental complete
>> the submission. 5. Eventually repeat until fully completed.
>>
>> That would work but is likely just not the most performant solution.
>> So faulting in memory on demand is basically just an optimization and
>> that is ok as far as I can see.
> Yeah, Alyssa's suggestion got me thinking too, and I think I can come
> up with a plan where we try non-blocking allocation first, and if it
> fails, we trigger incremental rendering, and queue a blocking
> heap-chunk allocation on separate workqueue, such that next time the
> tiler heap hits an OOM, it has a chunk (or multiple chunks) readily
> available if the blocking allocation completed in the meantime. That's
> basically what Alyssa suggested, with an optimization if the system is
> not under memory pressure, and without userspace being involved (so no
> uAPI changes).

That sounds like it most likely won't work. In an OOM situation the blocking allocation would just cause more pressure to complete your rendering to free up memory.

> I guess this leaves older GPUs that don't support incremental rendering
> in a bad place though.

Well what's the handling there currently? Just crash when you're OOM?

Regards,
Christian.

>
>> That is then a rather good justification for your work Boris. Because
>> a common component makes it possible to implement a common fault
>> injection functionality to make sure that the fallback path is
>> properly exercised in testing.
> I can also add an fault injection mechanism to validate that, yep.
>
> Thanks,
>
> Boris

