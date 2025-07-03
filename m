Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8EAF7AA4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CFE10E869;
	Thu,  3 Jul 2025 15:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gER97n28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D1C10E869;
 Thu,  3 Jul 2025 15:15:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyA434uP03mZpouvJaPvZmmGy80DGkhzhkdxa0SWmp833NsjoHEoKQ4SFvu24byobz6mMWfoUDGnj+HO1+vAyPVyBBoPjezpdB5viLt+soFmqvyUG0lBFpUS4Ud0w4esSzmdJdjCw+ce6JTnDnktbFFNIn9Cj5ekuIBubKPL1eS0HAqSQqWgEhor/qBCAIknLmVTUwJxb+cQD144p82vBUsi5K7uOwMvjPNm42M0Dz9t5INmDzH/3LyNsIo8ognevPQ/LWDd0NNQwRbwLy0HK25jrSwf07l+toZ0/CvKq09FKSPwxw6tt8bF1AaudxdryWrt7s9hHMP8Q/vd06ncyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tybzE8D5wOXbMFgCIEQ77XSdjnMWdvgoESINzjpaB6c=;
 b=oK9ALORR53g9KQcEHQr9OX2EdOZrrJgJmq00LebGrdby+6cqJbpeBq2W2daa0YvY/Edi9jJdDawc5VeHgaYk66nZmTyXsM+im555IHCH8w5EvPLf5L3ZpBsWP+bPqUhxK3XEPZATsXK6LtaNN/akYaGtVJMRyxuW54DwOMpwc2I3Sm5gfN7tb2VrHxM2XNygCH/WU4jcdhWbXhlia1nEeY6mV4x3HPAI/RfFI/FF5WDMgFnP5jpHemsafCvOV5iTeAa7TUmLVewRHk2fnIPC6wO9q1YgOl5wOMbNWsflYEipU+UEpGw82DMY8M5Gd23yhyUaMsFuRDhKxTOwPGlNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tybzE8D5wOXbMFgCIEQ77XSdjnMWdvgoESINzjpaB6c=;
 b=gER97n286EkFZ95j50az5Sn03wUSZbGjZpM5Bz6jgQv0yPbjwWJcDazznWJgRUluw9vKdRgHpBTLsfbYI6JYUkmU1oitPmO9TT7P1JZ5Jkd6K70VO6gy63MEjn/zODAZstFxtnUlMHcp3jeTi+2z5z91LEiA8y9pCam8nTx5N28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL3PR12MB6403.namprd12.prod.outlook.com (2603:10b6:208:3b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 15:15:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 15:15:53 +0000
Message-ID: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
Date: Thu, 3 Jul 2025 11:15:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display:fix a Null pointer dereference
 vulnerability
To: jackysliu <1972843537@qq.com>
Cc: sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 alvin.lee2@amd.com, aurabindo.pillai@amd.com, Dillon.Varone@amd.com,
 Austin.Zheng@amd.com, Sung.Lee@amd.com, mario.limonciello@amd.com,
 Wayne.Lin@amd.com, ryanseto@amd.com, linux@treblig.org,
 joshua.aberback@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jackysliu <Security@tencent.com>
References: <tencent_4A53F3018A4E9A1EAECFAD853F6952D67B06@qq.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <tencent_4A53F3018A4E9A1EAECFAD853F6952D67B06@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0388.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL3PR12MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c9192d-ce25-4820-a472-08ddba448065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGYya0pqY3NIVjkrRkhhSUZFeENSeEdlS2E1VFByRW9tSGFvcm1oVWc5WkRr?=
 =?utf-8?B?eEtOVS82V2JUQkhadHkrR296RWYzd2N2UDVoYXp1aTVRcDZyQjMxcm1HZ25a?=
 =?utf-8?B?ZDBqOGVpcWJ5MFVJRy94clNwZUdkQTJ0cEZtemg5clBtazRCZk16NVBDSXJw?=
 =?utf-8?B?aTF3VWkrSkRnOVMzM05SNHZlaXc4Sm5tK0dJUzZTZGVGRXNCN1RJZHl1MWgv?=
 =?utf-8?B?Ynk5ODdIQmxic2xRUmZ2TDNOUWpqQzVqdlFuSm1ZdkJqTW50ZTE4NkhKVFp5?=
 =?utf-8?B?UHI0UEtpcUViQ3Buek1xVWhRQVF3OVZ0MlNuUEJoS0NRSVdXM245NW9NRW56?=
 =?utf-8?B?NytwSXgyUGhON2pDMDdIeU5heUU1NmxmOEgrVHBna3c4THEwalhuQkFhTjNZ?=
 =?utf-8?B?aU5PZDljTjhyczZ0TzRCenBYci8wUVQ2NSt0c2cwZmRMT1JjZmw3UUg3L1pv?=
 =?utf-8?B?Sm9mUzV4c0plZmJaTmlDSTc1TktydlFmQjZaTFViUU5VOEhDRjdSWEdMK1JC?=
 =?utf-8?B?OFFwbDltcjdSN0lHMFRzOGVBOG9pUEJHeisvT1A0OGREN0J4cVNRMmI5Y3NN?=
 =?utf-8?B?ZW9LZXhsZ0Y2WTRVL3VZdlNFVHY1US9WR2Ezd0R0YkliWHdSRjY4TXlSYXM3?=
 =?utf-8?B?WmZqVnVjNFEvRDNTemVtK043SDI5SFA2amh2RkZYV25mVEdUTlhNa3lGU3oy?=
 =?utf-8?B?YzZHeGUxUVh6dFo0Y2tXMzdDR2YrYjhHRnRmVTVmR0piVDhlZ1R0UHovbjRi?=
 =?utf-8?B?MDd2VzNDTVRwV1NQRXJaY0dZYVNJK0hTWU84WU5qK2hBYWhISUZUMjJROGF6?=
 =?utf-8?B?WmR2SFJtRHJQblNnOEQvbGF3R1J2NmYydVJCL01NOTh2ZWRZaGI0czlxa0gx?=
 =?utf-8?B?L2dEWmt6c0FnL1BsQXBWSTBWd3M3eFZ1VCt5dnF4QlJNU2Rpb3RtM3FFQ1E1?=
 =?utf-8?B?SlVjbWJxeURQbnFlUmlQNVdHT3J3a3puUWlSU3Yxc3dXV1ZKRDVBUlB3c0tn?=
 =?utf-8?B?K0pDL0wxMmZhcTNYaWZQNzZDZU82WVRDR2UrTVJFOEluU2cvOThpNGlwZjlG?=
 =?utf-8?B?MzZhb2hOblMzM20yT2ZwNkNCVGhLRjBWVnJKczlYRlJ6MXF4djZTR1VFVlEx?=
 =?utf-8?B?UnhXSm5rR1g4QjBVdUo3YVVibExkc3hiNHh6UXd6RHNPMEs1a29lZlU4eklt?=
 =?utf-8?B?WTVXbFFwMTNTRUxWUWxJZFpwU0VRSEdaTFRQTWI1b0tQMTVrVURQbjVzNnpv?=
 =?utf-8?B?a0pSLzhZVmxua2NTaklhMDhlSnd6bkhpUVV0UUREeUhGYnhOeWdidHpFaXkv?=
 =?utf-8?B?ZklCSlFteW1pQnhZS1JBTkM3VU4wc3BXdDdWZk53WHZFbll6MXVQb2FKUzAw?=
 =?utf-8?B?dHdRSXpRSDdCS0xseVdJRlhPREd0WjRCaDhDM1ljbFFscEExU2NzSXlaTERG?=
 =?utf-8?B?UmNiNmFrOHlaME9YUnp6MU13NVBkZ1lsV0FVTmZvdU1LSXV0V0sxWURiS0tu?=
 =?utf-8?B?dXpxUmNlenJ4THFITWxCbjFLVnhCTTd2cFRTRkxKQjFUREpscFpSeWovelQy?=
 =?utf-8?B?b1JNcUZrajVabGd0UmxObjQwWGp4bVVZbFBTejFFdlkwUStLR1lzZHRwTHQ1?=
 =?utf-8?B?ejNvWi9hYlNDMkUvQW1FM2s3UWpnVncyWksxeDRuS1haVFBRWGI0RzJLbHpi?=
 =?utf-8?B?WHJXd05TWFhleUpSMEZSVGpnR0Q3RXJUL2dDTXozU2RhcWRzYk5mWWllNHNa?=
 =?utf-8?B?djdSbGVGNURvd1RiMTdLSmU0ZFFGNVIvRWN0c0FORkhtZ2wvUXBFb3JpNkN6?=
 =?utf-8?B?cnhCSWhpWGt4YkYwTTd2cTRubHU0Zm5XeG9nUFd5OFhGaXZVUC94c205clVH?=
 =?utf-8?B?NENMcFV0NTN2Z2dCN1BFcThoQjJZbkk5LzNTdGk5T3BnenlGVzk3UFdwZkUz?=
 =?utf-8?Q?GnivG64uhj8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek0vNGhqU21NRXd6QXZmcDFaT2xIRTRwYlVpWUFjL0daWm1GMXFmMXFhRXpF?=
 =?utf-8?B?U0NFQ1NpNVE5c0xNN0lpNkN0WHdLTktwNDl6VTlrREFvMm1uMXZhVmlwVkVB?=
 =?utf-8?B?VjNGd0JLSHZrbnM5bHNsVEZzdlNITUwwVFM1TUlnUEZKOFMyVHAxMGUrS05M?=
 =?utf-8?B?dDBTR1d3RmVxT3doMlYyOFQ1a09scTB1R2VPZlhudzU0R2hEQVRkOHU0SkZi?=
 =?utf-8?B?bEVBb3BDL3pyVmRqVTFuWThPRngwZEJ2US93UmJ6OWIwRTM3aklkbnNKbnFL?=
 =?utf-8?B?OGxpNWNxdjMyV1VZR3JaUkFwc09yM2cwcFNSM1oyclhOMVJLOG95aFl1ZGN0?=
 =?utf-8?B?UVVzM2ZnVzV6TU5sMkM0c0RUV1phVDB5cmtFS3pFRFluL0NhSm9xbTA0aFlj?=
 =?utf-8?B?Ni9naS80VnZVMmU5WTFtaHNpZDREcmV5dVlXSjVLSzdMcmhYcmsrbVJMQVBo?=
 =?utf-8?B?bjRkRzdiM2pXQmM5QzUrc29QVVJ0TW5JVGUwWWFzQ0E0b3VJT1dXaU9rK1dR?=
 =?utf-8?B?ZFVId1JtekxjSEV6N0hOUXFLdmg2MnJna3p3cmx6OE1ldkZWMkY5N3M5ZlAz?=
 =?utf-8?B?WHJvWUl2bDEyY1ppRGdiNWNnZ05IR0VtKzQwT1BiR3UweFQ1T29lNWZKVmJO?=
 =?utf-8?B?a2phS2JBb2NIZkdnak5YSjhMWmxveE9NVnY4NUszVTVrVUZ6OVAzYmNFOXQz?=
 =?utf-8?B?N01nV2IveXNpSkJVL1hJc2d4YzN3M1FQSkJDemIxcll5UVQrM0UxWFErU00v?=
 =?utf-8?B?bFhzYXlUTklwUldzZUFhZXBIYmNhSGdNOTg3ZUwrWFYyS2NHWHNwOTFYWFB1?=
 =?utf-8?B?Q1hyZTVZRXB6ZllhNlJBUEorUEdVeDVyMlpsdkwyZTh2ZGlVd1lRUi9BZ21I?=
 =?utf-8?B?MDFXc0ZqdlZsanB3QmozZWNwRUxxZHUwN0pUNC9xMzBkWU40NVhkcS9jTWpi?=
 =?utf-8?B?WTJiNGlSbWwrUE9HMENKUlRaM3NycVZBVmYrWGNqSTVkSFlpOGJjcDB5a2l2?=
 =?utf-8?B?ZU1KUWM3bXNyamd1TXNiZTRIL1NNa1hFK0xZekd6SmtGMXNLQjRSdzRZUDZv?=
 =?utf-8?B?M3RBdXBkbHpTbFl1OWt6TlZvNlcxL1dDOUNBYlJISmxnOHVDcHdUQ2piYVp6?=
 =?utf-8?B?MHRjMnlwTFNBQjZKb0VRWGlCZ0NIc2VPemxKV3J6Q0ZjaDR3cXNjVWpUcnAr?=
 =?utf-8?B?RUltMURybk9PakZ5bm1BOEE2NHpLRzFhL2lPN1FRRHI3WDNjWkdNbHEwR3Rv?=
 =?utf-8?B?NWtMemZMaHV1YUxtWDg4UDVxb1BYRGd6YVlESDB3OW01MEFzVFBaSkw3eTcw?=
 =?utf-8?B?VHhkazlUdnVFczBtUEQ2RE8zS0ZHSERCNHRrS2NBMnV5Q2pJelRSd1puL216?=
 =?utf-8?B?SmRldGZRNUNtR3FTQ2VTT3pUcVlTWVNobVhaNys5OERNbktuRXNlY1BZRzYx?=
 =?utf-8?B?OEJqYWF0RWYvMFlKaTFSTDJKWDZIcFJpV1JGZ1hSMU5jd21ENTJjcFBKNmh3?=
 =?utf-8?B?OXo1Zm04RlNsZkVsV0ZQUHdPd2RWaGg2S2pNeDlURVc4Zm9iYnN0R1YyaHlt?=
 =?utf-8?B?SzRzQjlKOHRyVHQ0Z1A0cjBYM3Z6STIxSWRIamdPSWtZKy9yczQwYnR3Q0ZY?=
 =?utf-8?B?U1REMXpoQ3M0aUlzaHJiQ3dFdi9qQXZBcHR2VDFTamFoWWU1ckRVQm5YVzh2?=
 =?utf-8?B?b09JdUxHdU5wMy9GaUJRYjlwaUxMdmhNTlArRzYzRXdoOFUyaG9odU9xUE9X?=
 =?utf-8?B?ZGFRYUJkNTQ1ZE5QNU9LK1pHS2NqQW5ZQ2NzRmdoYU5INkhnUDVLWG1tNjhz?=
 =?utf-8?B?ZVBBdkp4V1p3TWJyMVVwaUwySC92MlYwN3d2Y2ZFM0QwOERNYVREaWRtTUl4?=
 =?utf-8?B?MXRKalJOZ1RtVy9aS1lpUnlSb2xOcitvR2hrUUtTcXNYa0lYcnRjM0phK244?=
 =?utf-8?B?RElDZ0Y2RGExR1BCRlBSSXpyM1JUZ1ZYZVdLQURRdWxHdXRGY1ZxcDZyUjM0?=
 =?utf-8?B?czdGUkZsTk9hK2w2ZGUzTjRwUDBSMWZYMXQxTVR1YTl6NmVtdDhKVmZHaWxF?=
 =?utf-8?B?ZlZRTXZwNXY1K3RUcE9FWjF4V1pUS0tSYVNXK3Nmcm9WUGU4QS9INmF5T3lB?=
 =?utf-8?Q?dAPdxGhb3wRxS8ghusTLWkPNb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c9192d-ce25-4820-a472-08ddba448065
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:15:53.6831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ANzmc8UY8Pp+r+mOite+u+Nsft5Erq5v2IRal7lXwbFjmcVJSeiEKZozeLPkm1l8enM1Wo6NNJBLjLwIyv8mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6403
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

On 2025-07-02 23:39, jackysliu wrote:
> A null pointer dereference vulnerability exists in the AMD display driver's
>  (DC module) cleanup function dc_destruct().
>  When display control context (dc->ctx) construction fails
>  (due to memory allocation failure), this pointer remains NULL.
> During subsequent error handling when dc_destruct() is called,
> there's no NULL check before dereferencing the perf_trace member
>  (dc->ctx->perf_trace),
>  causing a kernel null pointer dereference crash
> 
> Signed-off-by: jackysliu <Security@tencent.com>

Thanks for your patch.

Please run and fix this checkpatch.pl warning:

WARNING: From:/Signed-off-by: email address mismatch: 'From: jackysliu <1972843537@qq.com>' != 'Signed-off-by: jackysliu <Security@tencent.com>'

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 56d011a1323c..3bda0593f66f 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -934,6 +934,11 @@ static void dc_destruct(struct dc *dc)
>  	if (dc->link_srv)
>  		link_destroy_link_service(&dc->link_srv);
>  
> +	if (!dc->ctx) {
> +		dm_error("%s: called with NULL ctx\n", __func__);
> +		goto skip_ctx_cleanup;
> +	}
> +

I would prefer to simply wrap the dc->ctx->logger and dc->ctx bits
with if (!dc->ctx) and avoid the goto.

Harry

>  	if (dc->ctx->gpio_service)
>  		dal_gpio_service_destroy(&dc->ctx->gpio_service);
>  
> @@ -946,6 +951,7 @@ static void dc_destruct(struct dc *dc)
>  	kfree(dc->ctx);
>  	dc->ctx = NULL;
>  
> +skip_ctx_cleanup:
>  	kfree(dc->bw_vbios);
>  	dc->bw_vbios = NULL;
>  

