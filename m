Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66247A6861F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 08:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EEA10E1F5;
	Wed, 19 Mar 2025 07:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rdhJG0pP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2E110E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 07:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqXOT/3U/WW2FoL6N4jNlv1OzIv7mm9iG+pZWCKYuxodzcmKS3BLIOm2HOLMNErDi8TAGO1a4ohJvcPja9CDqmMHF9Vr68Lr2FoI3vRrOVDXfi5yINhmjBTWRLi50cEaE8xexNlgo/EAPVfyfc4hoPjsr8Nbse7gXl7NkOEEcRi4/jSaMsOjNoOxEnMdMNY28GH47m0vlSn6Ia9yW7LMp7lbGawgaf2X2pPmmmVOEbrGdJ2070A32gZdc+KpNlxl3/O4AFtqdBFK1zIOSZX15IluTOw4GbhAMEfeT1ns0eQocZ/f0e/jHKKxY/Q7ffL0UtluaQHtBwhz1hFwNGyLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vl2QDIuwUb/bINKK7kmCgirawTeJQXT4gk1i+8uhxNI=;
 b=i+Z82zcOA159fDi92T8eeB43DM5edC7pEq+Yon6ce6iRdlGwRpICq+ybaigCqFwGXSetw7abn5rKOULySLd/iyY/JTxh8z6lfNGP8oxZI+SZyq++ek0K9R+mJo8ZaV7tDV/XJlu1QfSHpOcV6OYVg87Wup0vmC9gHU2kBIEvypMcwcxDpT3M2X/QnS+UClQf1P8NrOIrPY9jtiBlNNhbLJeazjuEmjYYdfMMy08ne4EWSKk81qC6VdCpoP+x0Q8CL48SQZ3UgBkdskBZYrzNOhuJFlXJtMt/JAPzu6v/e1RGTkvazci1lCcGcl2hd8u21mp/SOeNSkNCMUhHfsLXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl2QDIuwUb/bINKK7kmCgirawTeJQXT4gk1i+8uhxNI=;
 b=rdhJG0pPALVzv4tj+lJqzYY+hbAkKmheaQXR+nSiTBI9jnZyTEzJRsOB4E+5SmNSOVeM5yxwlK0YEjQW9KOQ67+UpVmTZw18AUVUo85EPfnaNFWbuL6eqtEIef+eTgOJWGPynytOBRu9Mw/94qYt3YahpKEct0a1uFotyV8Ml9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6624.namprd12.prod.outlook.com (2603:10b6:930:40::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 07:49:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 07:49:45 +0000
Message-ID: <fb7ca812-ad3f-4116-bb58-d34a8bcf979f@amd.com>
Date: Wed, 19 Mar 2025 08:49:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/shmem-helper: Add lockdep asserts to vmap/vunmap
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Asahi Lina <lina@asahilina.net>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
 <20250318-drm-gem-shmem-v1-1-64b96511a84f@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-1-64b96511a84f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 44eca4e9-07cd-48c0-e9aa-08dd66ba9d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXRjMlJLUVZHa2RXenRDUmVyaTZqTUlYMWw5MUliNTkxazlJNDBHSE9qNzdN?=
 =?utf-8?B?QTZMT0FFYlRsUTJsWVdCYkdJeGJlQjcrWXBNMkk2YkRVbWZNTFN1RzYydFFa?=
 =?utf-8?B?QUdkcm1mSGgwZER4T3lqSUtUd2EyMU5Wa3Jzb082dnZzZEY5RFc5dWFyR0RD?=
 =?utf-8?B?b0NTU1dGb1Z5TVQzZVgvWkJsVVJRK0tyZkJSbWF0R0VvUi9MMFdCSEtXb2pi?=
 =?utf-8?B?dU10YzVpeWRVVzZ0eEFzbGo0UHQvbnp0cVhRSTArcEpYSXdYS0IzN2p1L1U2?=
 =?utf-8?B?OWJKY3JOd0N0aFU3dHlTN2dxbXNEWE9uMUhCNTZkQzNna1kzc2F0REJsaGtl?=
 =?utf-8?B?N0pZa2FNRXd0Y0I1K2t6M05DdFJEZnYyRGZGSUJ2UE9MdVBiNEcvb3BaVStF?=
 =?utf-8?B?Z1hreWVRelMyU2g3TE9LY3IyTU5RNFI5bkwzRDkyL0hkaUJIMnVUZk1XNGY1?=
 =?utf-8?B?UjZ2Sjd6cy9WZENjOW1mYmJYMzlLWXNibG16UmhPazBFdHFBZVRkOGtrTU1S?=
 =?utf-8?B?dUlxOFJpVW42UW10V21FbWJUMnlLZDNKVkhRMWlDcXI4VjlwZUZZYWFwQTVm?=
 =?utf-8?B?Y09kY3E2RXBzNGNDZzU1WGtMVVM4MkJZaCs5YWdOK3pQMXlWL1duRDQ5cVVr?=
 =?utf-8?B?aFhGNWlyNTlxRjFwRC9TYlh0NnFXSVFsN3FxTUJZK2ZEMFhJUGRHc1JxdWg2?=
 =?utf-8?B?U2RMNmFuUks4dVh4UFhUV0o4d2ljOVJsN28vaHUxUENtc1NEWXpMZ0RNZ0tE?=
 =?utf-8?B?azlCRlZ3SFdtcXBDUTBzRDhFYkkwM2liVnl6T0xMSHZtSTd2UGpMZGJ5RzFi?=
 =?utf-8?B?eVRUUWI1WEpIS3VlMTkvQ2FCNTFzNVlYbHFzdHVEUkZWMnNLc09XcENhZmNl?=
 =?utf-8?B?VFgvY09PY2xWaW1EZlIyVldRQUpsWjJ4SEpRaHFaQVZNQ29BeEtabU9jcmlY?=
 =?utf-8?B?bEVuOGMzbDZTTGFwN2RLZ1BmUmxMWVZwaWM3MUVoSzVhNEZWN3dneWhXcm9C?=
 =?utf-8?B?RkUvVkhWZzhrdzQ2d2k3Ly9rd3JpYTBZOUtwa3M3Y1RCTDBacFFBc0lDMVNV?=
 =?utf-8?B?QzdydUNSNjJkcFdxMWRWSXdDNmZ3TnQzREMwaFZ0U05xMk01TEErMFVsOVc0?=
 =?utf-8?B?dlF1eW5VVkx6Z2RWRmRUSXI2QlpIaE01K1R0dUNuZ1FUd3ZPTkcwNGFyMStv?=
 =?utf-8?B?UTVESkNCY3BaL3E4TDkvd1VnWDQ4UmNBbzNjcktrWDhHSzhpWmFEYlBqTmsy?=
 =?utf-8?B?VzNIYUdnemVHZHYyaVI0U2xDc0x6V0VXd01rRCtZRjdWdnRpeXNhWVhUdXFR?=
 =?utf-8?B?WkI4N3drdVVhMWxHYmpxV3MzYkJLanFHRXpIVlZTN3JwTUdoU3JsVWpHdzhV?=
 =?utf-8?B?eU5EbGx0QSs0TmVRZjZXS2ZXTXU4OVFyY0dvc3JvR0h3dVI5emNrTTJWRVRt?=
 =?utf-8?B?NDdzTFFOV2U0amh0NitrY3ZzVFhuZVd1TFNCQkpEczlqK0FuUzdTQnFwVFpJ?=
 =?utf-8?B?Vm5UQTMvOEFacFdQdTBmanlEelFZN3ZpNEFyVkdLSzFRbExycGZlRlc1Rmh2?=
 =?utf-8?B?bVNhUHcrMjE4WmdoVUZCLzZlUEVWSmJmazBETC9qUXQ1eENLVG13eHFTQm9V?=
 =?utf-8?B?U2daVjI0dERJMERZaVlHT0VGZC9qZ3NXY09VcEpzSXpaNy9DQjZFNDdQbVBN?=
 =?utf-8?B?eXdseFY0bC9YNng2V2NFSGtOQ3hhRzhlWThDY04vMHFmdzd1Y1RIbkc3dS8y?=
 =?utf-8?B?TEEwMDMyd1JVTW1QaTZ4YXo3T01veG9SbkQxczhycnNxY2RsREJOM3ZDTk5r?=
 =?utf-8?B?Y01RTDhOaGI0MnNzN2xoeUdYcXE0TERpVWlaNHN0WHRiMVFZZ29pN0MrTmE5?=
 =?utf-8?B?Mi93RnEzK0FyWVNUaFI1K2FIaktnSHRkVmloUnVBOXRLL01JOTdGOVRTb3h3?=
 =?utf-8?Q?yF5KUtg0S9c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTJoVDhNYzVxaFhIQWl4MVIvOHJNRzlrcE5hdTJpMHRjcVdLVjY2NmYrbGgr?=
 =?utf-8?B?d3hhSkVmVHJQT003NWF1bVl5K1dwcTVoSE5wdFRGS0NJYmFicTB2c1AxUnhQ?=
 =?utf-8?B?Tlp0ckluMkd1QU9GclRNcXJvd241V29mcDVpdElBWWJMbmxMZGl0ZGtBWjgr?=
 =?utf-8?B?UUFLR3AvbllrQnQrTjB2Mmh2K2tkVHFCNXR4aXBIQ2hxeUFsZ2wyKzU4ODAz?=
 =?utf-8?B?aStDYUp0NkM2ZW5mQ25vNXROOUpVdlFQT0pZNjFHaXMwcjlDcGhiRFlJMjhm?=
 =?utf-8?B?b0pBam5CUXpFd3pMeVhla3dwSWxVTmdFNGlSWjNCdXR3UzBzZ3kzS1hOVHZk?=
 =?utf-8?B?aTRIZWp3M21LWDZUTVRtTzZQL1JackV5QVQxa1VVYUgrTzloRmRjTlovRGtu?=
 =?utf-8?B?Y1lYWUN0VU1MZUtBeERqWkdGTTJ3S3VFTS9Rd1hsQTBwZEg5VE9mcGpCZitV?=
 =?utf-8?B?SjM3bkFzaU1uOW9CYmZ0ZUl2YmRrZlhibjJHSytZZDdxc1M4RXlXQlRtVEhm?=
 =?utf-8?B?SjRaanhBdVpROExqVkZQQWN3YlZ3QmQ3NGNKaWVndTVXRU8xZUJjMjNmVDQ5?=
 =?utf-8?B?eTEzSmhYdnF4eEZtMUFORzR5UGN3UXpXQmN2QTloM05yUHlPbTA2NGJKYURw?=
 =?utf-8?B?dlB4bHIxMW9tbkt2aXh2RmpHN1hOcUJwYm8rYUlXWFdVMEs1Smk4SFZQaXFr?=
 =?utf-8?B?blE4eVNkU2xkblIzVEZ0ME4zaWdpZFNLYklGTDB2NUFhb0JuaGNtejhwZW4z?=
 =?utf-8?B?dm56T3JxZmRGY1JhUUpuOEtzRVVTSExrOURLcUdXTnRWUFNXaTZhS3VJVDYw?=
 =?utf-8?B?VFRydEM3aWhtRmtxRkl5ak9yUXVlZWhDQnY5UmUraUFmdGYyRVhXcGJGMEcr?=
 =?utf-8?B?YzN6VWZQT25TUHN0MDdLK1RpOEx3R3RaSFFuUHZIM2IwVkVQMWpLdmV2QXFU?=
 =?utf-8?B?WnZJcWZVeGd5MTBxYXhXK2VsK20zRXFPVktIOGhyZHZaenE3RU45cFNPNkI2?=
 =?utf-8?B?MXhFV0MyM0FzQlpOYzBFbVMxTUhiUVNhZFJKODduamlSbVI0eGhFRFBYWVdq?=
 =?utf-8?B?YXQ1R2JEOHBpZy9BL0RNcGV0djE5aDZnQWd4bFd6bGF4MHZkcFJlS0JUMkFT?=
 =?utf-8?B?NDZPRUFpNXVLQmRPRU56cmZocXBZU0wzQm5GQkY3clRIbllacGtQZEMwbnRN?=
 =?utf-8?B?VjhJMzluMGtLVUZIc1FTODVrZ2tCSzFwWlM5TUdQOG1qNzJFQjhLUm43WDh1?=
 =?utf-8?B?MDlrVUxib1RZdXJNUXp3QnZRZ0U2a1BCSk1YRm5ZRWMrSjlpUE1OaXNBL3hk?=
 =?utf-8?B?aXhHN2xzUWxDVFFGWFhkMG40VkJMOTRCOG9CN0VFRVNMM0Z6UzJqbWViYThi?=
 =?utf-8?B?OEFma1E3K3hwVS94cE9FOVk4RDFzYVVCNnRRYithTStRUG1rNkRQWnJKRXZL?=
 =?utf-8?B?a3BsRDgzaVc0VlhQVGRqZVJRZkZDMThzbUtLK21nWTVoTHFGSytLVVlBVDlI?=
 =?utf-8?B?V0FYQXZUeGVvS2VoNzRGaCtkMCtXTVV2UVQ5NEtUNkovNkQ0SzBwa3g4dUhz?=
 =?utf-8?B?c3lVVllWQ2RLSGRoSTEvSHZMcWpsUWsyK3o5Skd0cWM5b2d1dDVJYi9aN1Nw?=
 =?utf-8?B?aVhMNFpCSmxqNHBzYnN5bUx1RTIrTlI2K1M2N1l2dnk0QU1JUk91ZFltK00w?=
 =?utf-8?B?R3N4L0VyYmRYR3lIbzBZeFdwQzVPZ25xV1dFemw2ZzN3OUJYanlGNEhpMVZv?=
 =?utf-8?B?Tklqako2N3dDNU82TkZKcnNYR3J0VjNFckhnWUoxczMwaDFzaWpnV083cndu?=
 =?utf-8?B?ZzRLbTVnOVlXSEtNSk5ranl3U1ZsOGpUVXp5N0JUa1o5YWQ1ODJxNFM3amZC?=
 =?utf-8?B?SmwwcmE2dnExK082WE5mRmY3RWQ1bWMrYUpMcitTNkdyK2s0L1FmWHM5RGhu?=
 =?utf-8?B?eTdzSmJhUmFOMlJ5RzNQZkYybDFVSlhEQXRtQ3dYcXNLQjR6bVpsOW4xdldD?=
 =?utf-8?B?ZjhRSFhoaVgxeXVmb0NiTFI3THlQM0dGdU02ejY5amhPUFA4d1pkOFhIL2NH?=
 =?utf-8?B?RW1lYkJ3TFdHQVhncDRERkVSQ2tGNUM2bjhhdFNJWmxaVDM3N3NSY3d1N0Ft?=
 =?utf-8?Q?rXRkcEDD0YU5qaP6Y3CW9ku+O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44eca4e9-07cd-48c0-e9aa-08dd66ba9d9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 07:49:45.3606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwW2+1NK3GykD/ClajlXw3kB0uBlxcSLmp7LdOkJgG7VZBcrY65B86cjJW1Yf2i5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6624
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

Am 18.03.25 um 20:22 schrieb Daniel Almeida:
> From: Asahi Lina <lina@asahilina.net>
>
> Since commit 21aa27ddc582 ("drm/shmem-helper: Switch to reservation
> lock"), the drm_gem_shmem_vmap and drm_gem_shmem_vunmap functions
> require that the caller holds the DMA reservation lock for the object.
> Add lockdep assertions to help validate this.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Oh, yeah that is certainly a good idea.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 5ab351409312b5a0de542df2b636278d6186cb7b..ec89e9499f5f02a2a35713669bf649dd2abb9938 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -338,6 +338,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>  	struct drm_gem_object *obj = &shmem->base;
>  	int ret = 0;
>  
> +	dma_resv_assert_held(obj->resv);
> +
>  	if (obj->import_attach) {
>  		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
>  		if (!ret) {
> @@ -404,6 +406,8 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  
> +	dma_resv_assert_held(obj->resv);
> +
>  	if (obj->import_attach) {
>  		dma_buf_vunmap(obj->import_attach->dmabuf, map);
>  	} else {
>

