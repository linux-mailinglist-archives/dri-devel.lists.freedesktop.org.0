Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169E0B03A62
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F72E10E148;
	Mon, 14 Jul 2025 09:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="to4jG3U/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD15B10E148;
 Mon, 14 Jul 2025 09:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK52gW4FTxnpM6Q+DWqV3MfC6u6QMsMuAf1UGoKPXi3ftwwR9ppg97UPTfJYS/iW5P8LmjvySOmO1YsIZnyXFU/dr2tS0PTsHblLngFK5l1yDj7lpHB/Sr93AKS8EU7hnnU9s4A8eMgHe+MnAC0MICEpeKf/OLZYX2nErWtacEwdXsDV+7pdF5ojsK2DmW1DWD8S7FZ0hQrV42UASm/O4RvTexugIuXQLKuaTUKBopm4tUFW3756zN08en6WGV/gFXnGRRbI2fvLhAsbEtGuUTn0570EGHukydw+gMXgZLzMuJNV7v/O62EsE9SS7F0A0SPjb4HQdFqOmZ+C1avhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIejdYh5wvA7eSAK+z0/k5cMtAwUWiigQ1IyoX0LxZo=;
 b=rQhfus78aK2lWDxpcMJHWLFp8NN2HeW+kcUQ4RPnKnSOZ/ubNNGelNTu0PqI3xG8FXACUgM3bCPcBgN9zB4fzqIyKH21TdsJs9hDwNHPaZs2UQmRhNe5En/IK/69jiqrqMqeCixjG7+GC7h5hi061rRenIzjMYJEhZTibeQW1nFq5OeL3WoZ6NURNoN2PiSK3m9Qvp4HrL8oDEuoy9fHuERrCkXhAPUShQLRWhgi68apX6OWbmUrr/3tmiz60BRFAPrIzapYQgO0Eil0ce/19GDAXvIHdt2dmtqF8pqhAhGETg2NDTEZzkIrUEsC1qiKYstlQRLOwuo4tzxOEny4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIejdYh5wvA7eSAK+z0/k5cMtAwUWiigQ1IyoX0LxZo=;
 b=to4jG3U/vKybY+Kz+6mt/qAht0Z5elNvjOmyuZgkZ8q+z8Z3C20FMTPSBFPK94v4xP9k9f6FssbbiniDU03Nj6LQEz0h1A/nu18DrwKt8NHZi6iQbg3Rsu8oR92MCr+NbQlxbT9+N8SwiaL1bNN5S4qQeqo4n2p/R4+y1QMRmgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6301.namprd12.prod.outlook.com (2603:10b6:8:a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 09:10:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 09:10:24 +0000
Message-ID: <23612bf4-e59e-48ff-9782-f9c7ce963e6b@amd.com>
Date: Mon, 14 Jul 2025 11:10:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
To: Matthew Brost <matthew.brost@intel.com>
Cc: phasta@kernel.org, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
 <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
 <335c9bc57d19f17a3ba0da311f287dfdc3d580c7.camel@mailbox.org>
 <176e7f13-52e8-42d6-a9db-0bb237790aef@amd.com>
 <aHFIph/XCWMSlFAV@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aHFIph/XCWMSlFAV@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0009.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 6193ff0f-e8bb-4241-6d7b-08ddc2b64401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEdIVWs4M0RLYjlOZkFFOWJ6R3pJbnRRUFlEdjR5TnB6dDZMYVYxeStqZis2?=
 =?utf-8?B?SW8rR2JTYXk4eVZGWnBvUU1wYVlDSGxEOHJuQUl2WkFrdVp6UjQrWWlNQ3Nk?=
 =?utf-8?B?czNVNDNDUmdJL2FmenA5SUY3TTRwekw0SHBZeVd5aGFOSFN2NjZCMHlLSFhv?=
 =?utf-8?B?TlVTYmVkbGxWaU5iMXJIRG5NVnFLNXdPUXR6UWNoZ2VvbHQ0SDhsZHFyZmNY?=
 =?utf-8?B?bTZoNW9STGliTWNrVVJ6YWs5dmZ4Q1JJN2twZ2c0RU5POWFoVEIrU0tEUFFR?=
 =?utf-8?B?eXJtMVpwRUpUdlExTzdDdVFhdDJFaDR1a2xzbVRhaXJIQzN3TE5XL21IZzc3?=
 =?utf-8?B?Ymt4OFo2b1BlZDVjRnFPMEp0d2pYdUJnZm1jVHp3eGdjM20zekx4a0hJNUtl?=
 =?utf-8?B?dXluMW9yRHNXWEhIdVMvYllQY1RXR09neW9OTGRIeWRkdVV3dHhiSm5CUW5l?=
 =?utf-8?B?N0JxQm1JQ2ZHMW5mN01KOGQ4U2MvMFN6N20yc0d1aEZ5OEFjN3dGMVAyWFMz?=
 =?utf-8?B?MnlyNjdEVnEwUGg1azVaeFNBYVpTMzVKQldoMEV6bEJVeDRtYWlQTmVXM3Vp?=
 =?utf-8?B?SVBhdHFqZ2wvdXdFM1VWdkp3anBDbmIvSm13Q2k1dnJtelI5V1paV3dvTHF4?=
 =?utf-8?B?bVRDT0hJa0t5Y0NzWXBkT0F1V05UMEphNkxQTml0Z3hEbkExR3hMbGl0NXVs?=
 =?utf-8?B?TDdFcEJ1NSs0aXVQWlBKOUFSQlpNalkzYTBLeXByUmxTYkFEbktVY0lFbERy?=
 =?utf-8?B?dlB1M3hKSzZEMkVuK3J3VGEyQUtLN0dnWUtGbDhXZmN1VlhCYlVrZjFVS1lX?=
 =?utf-8?B?Z21FUXhhMng4SVdaakVOOTdPTSs3ZHE2TXFpM01SeHZHd2t1aCtWMXgxUFJG?=
 =?utf-8?B?Y2cxOFN3R0tIWHVlcDcvcEliQjMrODI1dFdUSFFtQW9DOUpaeGdLdVZHZk9s?=
 =?utf-8?B?ZEd2Q24weDVaOTNsbzVTcmVubGdnMzI1VklJeU02WkQxMVp4KzRjRi96bmxU?=
 =?utf-8?B?eEUwRUxiT0JzeDFPblpoSFJOS1JLNDNYaW5KQnNSSzNrN0JvUklWZHpQa2ZT?=
 =?utf-8?B?NjY3RjI2cU9KS2ZCUGJGcnlGRXpCS0lZV0NtSXo4U3V1dklYbm5Ld0xvNFNV?=
 =?utf-8?B?RWRoVnRST2tuRGlGazI3WERxaXlCQTVsdy90NU5NS001bDdlMDRpcFFXVjdN?=
 =?utf-8?B?MStPLy92eEYxaDI4WlF1Y3ZTRTVNWGlaWmdwS1FaWTdJejhLb3c5VjRQd24w?=
 =?utf-8?B?Ky81TTJMbzlYWlpiOVlXMGEvUy9HWkhGb2hqVEE5TUJtYVkvWWxOZzFvdkVP?=
 =?utf-8?B?VWdLa3VFcll6dzRobjZnTWhXUDE5Unl2UDZoZDZKZGZoVmFJc1E3VzBVd2VN?=
 =?utf-8?B?ZEtuY29nY0lUV3Vod3ZsRzdJV21HTVlWWjdFcFF6RkNaWUdNdnRwUFpoZDdk?=
 =?utf-8?B?UEsrZ2hBWHZvTmEvRUdDcTFUSDhsZzJGSmJOR1JFZjVPa1ZQcGFTR3BMd0M3?=
 =?utf-8?B?WVNhbEtvaGxzVFdROXlnVjZaeWVxZDJ2OVJOYTcyTklqRFgrdldjSHNQZjNn?=
 =?utf-8?B?cXpYclpCdFlLUThuN0NPQlczaWNNWElYc1BxcDQxaDltUnhKMkdCdXpEZG5a?=
 =?utf-8?B?QUFlMjl4aHlOYkdlUStHSGozOGRxWDN0OTZIdFJnaFRHRk1zODRxbjNoQTl0?=
 =?utf-8?B?MFo2bkUzN1cvRFRzS1hSTTFtd21uMExVSE81SytxYWY4cVprSTRIRjMwZHhF?=
 =?utf-8?B?L0wxSlFDNzBrR2o3cy91TjlzN1E1aEdTa0dDbDF2ajdScE5ZT0pvMXpXRWgv?=
 =?utf-8?B?NllkQXJGVC94RFRqSU1NdGhFVUV3RTFHaEJYaTE4VE1lWmltUUJDVzM3bm55?=
 =?utf-8?B?Z3hibkpnekVEeEd0REtTcW5aV1VQOHNsL2pqRHBUL2dpbmt6Vm93NHNMc2V6?=
 =?utf-8?Q?rMAaxIIkBuQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWNER1Fldm9wZDFUUXp2dXEreElhZzMyK3R0T2Mrc1M3eVBDdzZ0YkdUSy82?=
 =?utf-8?B?bis1SUsxb2pyZzdJbTVZcHh0UHpXaWhXdEJEcE90akhPSyt4S25GaWhncVFY?=
 =?utf-8?B?M3hjbVNEcUh6azNqeDlUVC9vTUdtcTI1RkhqMzNoSHJ3NkR5MjdxK2J1ek9z?=
 =?utf-8?B?ZTFHUGJEem9UQTBDSTJUNW42TmxaL3l1cC92SjdFL0VJWFp3RHRCU2ZzSGd4?=
 =?utf-8?B?SnhYNG1MS0RNemFsa1V4OVgyNUIwRDRNdzA5bnk0S0FHWDRWOHZhZXlhZktD?=
 =?utf-8?B?OE44RVQyTjFvQ1UrbDhDV2dBMTFpbFd6TElDV0NwWUVsK001Rzh6TWtaS3Rl?=
 =?utf-8?B?YlFSbHdJa1FIdDFxNE0rODVnMjBLaVpVTXVKbm95MXp1dXltQ2FYZ3RiU2Y4?=
 =?utf-8?B?TGljQWlkWnhpYkdCczBkTVNvOHc3RFZ3T0EzcUpuSVZUdDdvZ3g1dlJKNHFn?=
 =?utf-8?B?VlJuU2N0dzBUUmZhMVpIR1dMOGg2VXRiT1djcDFBK3BWamtZYktqbXBoZ2pU?=
 =?utf-8?B?RXMwMFlpbGFIdk1XRWpUcHdEaW5XZHlESmFzOXR2b1N0Y2hOb3N1azJodWVD?=
 =?utf-8?B?VlQ0V3NzaTdGUlA3ZFlDM1pQWUNuRDBJdXJLandwbjFJUXBCOS81amNrZUZz?=
 =?utf-8?B?b0hMb2g5QlJzRk4vT2lzbWdLTUFLWUNFYkg3TEEyNGVTZHo2WWhDS3dGV2dK?=
 =?utf-8?B?RElXS2dRWEpIOGozMVRadjY3SVZHLzdpaFV1UWJWb3MxODBaWmU4MmFCeG93?=
 =?utf-8?B?MU01V1IrWWdrbnhGSGhrM29RaDlZclBNa01YZk9HU2RRM254WUJTY2d3TnBR?=
 =?utf-8?B?YlZQY2N1OWRPc0FwMTdWbVpqdEExRndkRHZCRllkblVwTHhoR3Z5Z1FtYWQ4?=
 =?utf-8?B?d3A1azJvbW9PYUdmSWg4R3ZRdUVDSDZuS3FUMXV6VktVeVdnL3hFelE1Sm5D?=
 =?utf-8?B?dHRoVHpLNGp0QWV2S0V0UnNLRGprTk9RdE5McEVURDJrdFliUmlFQU56L0Ix?=
 =?utf-8?B?YkdhY0V1ai9jK0M3VWtSRjVhMkxMYkdhaVlWNTdRMGZIQkNxOHhnbWZ3MGdh?=
 =?utf-8?B?QWIwdUJtR2Z1SUlCVkJsVzJNYy9JamdjYXJGZGkyS3FVN1FVUzFqZW5tQU13?=
 =?utf-8?B?V21CQ1RSNHVWeGNldlVUQk1wZUp1NGpkQXpVZ215bE92SUIyTklKczRVRG9W?=
 =?utf-8?B?dE9IMU43TUFHaFBQVzNTVG1WcnMwQWZzbktRM2NrOHNxU1hFREFIbnBKbENB?=
 =?utf-8?B?NUNMblZOQjNJdlF5aWpiSDQrTkIrdXJkdXF2UnA1K2pSYzZFYjJ4ZkRjZ0VK?=
 =?utf-8?B?aE03ZWJ3VHQ1SkhxSjd2NVBDTHVJelRyZnp4c0g1YVprVGZMNEUyVklvQUNa?=
 =?utf-8?B?RDdkbGRxY3FnV0ZhTjhHNWppNXNFaXkySUQ0aVk4cmU1RDJ1N3NiS1daQW5z?=
 =?utf-8?B?N3ZIODBsVXlNNXpSWDlSVVBpRlhSTjBSS2pCWldua21hTHkrSWdZMHRpSFNo?=
 =?utf-8?B?WDE3MDdRYWJGN1NFOXRaUWsyZVhldnhrN2wyZ1RoaGVXenh0Y1BDQlJGbkFG?=
 =?utf-8?B?WnVHYkZkTDN5NWFuUTJpRmcyQ3g3Y0pqMERhU21OZ1o4eFJjOVhPWTk1M3c1?=
 =?utf-8?B?NFQrcHBLbkx1Zk5JMkJCZTl4c3d1MnVlR1E3TFlQOCtGVERLM1h5VXpiazE3?=
 =?utf-8?B?aWlWMFQwS0dHcEtPQjlGbHIyMks0NHArNjc2SDlTQnFWRjMwczhCZnMzbGlz?=
 =?utf-8?B?cWRQZUVNeXVWSkoxMGY0N1h1QW9ZS3NYRjk5ckpqRWxHY0xXRG0vMnhKTTVm?=
 =?utf-8?B?K0d3Sjd4WWszeDA4cGhGa3BpRTgyTCtBVTNWN3ZzbVNTWDdvS0hjVHNFTldK?=
 =?utf-8?B?QnJkOEpuWTc5Z0llT1NCZzQwTUoxRlN1QnBKV2o3OGNJdUloYmFPMFlEK2Vw?=
 =?utf-8?B?eURGT1Q3VWExMThObEo0YW1Ea1NUZlZSSi9MZWlzeTFobndobllsUzNFY3li?=
 =?utf-8?B?UUFUM1JqN2UwaTBnbUlMQjdiOWZYRkM5OWVqOVVjK0p4dWtIQUQyWGwwOTF6?=
 =?utf-8?B?WFo2cGU2U2NUbmRBaHlpcWZEeUk0bHk3dTFiTzlNL3drUE1rYUdvMUxseHJs?=
 =?utf-8?Q?6KYN6IhFJLnv8YzbE4xJ+Tp7M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6193ff0f-e8bb-4241-6d7b-08ddc2b64401
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:10:24.0095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7Tsih1vBPNz26Vhm0jFFHvceh7xbLJx2TXDuW/GK8gJqvCT2SjMTqHBeawBz5Z5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6301
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

On 11.07.25 19:23, Matthew Brost wrote:
> On Fri, Jul 11, 2025 at 05:20:49PM +0200, Christian König wrote:
>> On 11.07.25 15:37, Philipp Stanner wrote:
>>> On Fri, 2025-07-11 at 15:22 +0200, Christian König wrote:
>>>>
>>>>
>>>> On 08.07.25 15:25, Maíra Canal wrote:
>>>>> When the DRM scheduler times out, it's possible that the GPU isn't hung;
>>>>> instead, a job just took unusually long (longer than the timeout) but is
>>>>> still running, and there is, thus, no reason to reset the hardware. This
>>>>> can occur in two scenarios:
>>>>>
>>>>>   1. The job is taking longer than the timeout, but the driver determined
>>>>>      through a GPU-specific mechanism that the hardware is still making
>>>>>      progress. Hence, the driver would like the scheduler to skip the
>>>>>      timeout and treat the job as still pending from then onward. This
>>>>>      happens in v3d, Etnaviv, and Xe.
>>>>>   2. Timeout has fired before the free-job worker. Consequently, the
>>>>>      scheduler calls `sched->ops->timedout_job()` for a job that isn't
>>>>>      timed out.
>>>>>
>>>>> These two scenarios are problematic because the job was removed from the
>>>>> `sched->pending_list` before calling `sched->ops->timedout_job()`, which
>>>>> means that when the job finishes, it won't be freed by the scheduler
>>>>> though `sched->ops->free_job()` - leading to a memory leak.
>>>>
>>>> Yeah, that is unfortunately intentional.
>>>>
>>>>> To solve these problems, create a new `drm_gpu_sched_stat`, called
>>>>> DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip the reset. The
>>>>> new status will indicate that the job must be reinserted into
>>>>> `sched->pending_list`, and the hardware / driver will still complete that
>>>>> job.
>>>>
>>>> Well long story short we have already tried this and the whole approach doesn't work correctly in all cases. See the git history around how we used to destroy the jobs.
>>>>
>>>> The basic problem is that you can always race between timing out and Signaling/destroying the job. This is the long lasting job lifetime issue we already discussed more than once.
>>>
>>> The scheduler destroys the job, through free_job().
>>> I think we have agreed that for now the scheduler is the party
>>> responsible for the job lifetime.
>>
>> That's what I strongly disagree on. The job is just a state bag between the submission and scheduling state of a submission.
>>
> 
> See below. free_job is called after the fence signals, and drivers have
> now built assumptions around this, which would be hard to untangle.
> Sure, the scheduler could have been designed to free the job immediately
> after calling run_job(), but it wasn’t.

Exactly that's the point! The scheduler *was* designed around the idea of immediately freeing the job when it starts to run.

The original idea was that the scheduler just works with a void* as the job representation and converts that into the HW fence by calling run_job.

This avoids tons of problems, starting from that you can't allocate memory for the HW fence while run_job is called all the way to that you don't have a properly defined job lifetime.

I screamed out quite loud when people started to change this because it was absolutely foreseeable that this goes boom, but I just wasn't the maintainer of that stuff at this point.

> Honestly, I kind of agree with
> freeing the job immediately after running it—but that’s not the world we
> live in, and we don’t have a time machine to fix it.

Yeah, that's unfortunately true. 

> I’d rather document
> the current rules around job lifetime and look for ways to improve it.

Exactly that's what I'm trying to do here.

See we have spend the last 8 years iterating over the same problem over and over again, and the current solution just barely works. Take a look at the git history how often we have tried to get this to work properly.

And yes, it's well known that it leaks the job when the driver doesn't do a reset and as Maíra absolutely correctly pointed out as well that re-inserting the job during the reset is just a completely broken design.

It's just that everybody working on that has given up at some point.

> Changing the job lifetime rules would require broad community buy-in,
> which I doubt everyone would agree to.

Well, changing the parameter of the timedout callback from the job to the fence should be relatively easy to do. That should immediately fix the issue Maíra is working on.

Then potentially changing the job lifetime in the scheduler can be a different topic.

>> For the scheduler the control starts when it is pushed into the entity and ends when run_job is called.
>>
>> The real representation of the submission is the scheduler fence and that object has a perfectly defined lifetime, state and error handling.
>>
>>>>
>>>> If you want to fix this I think the correct approach is to completely drop tracking jobs in the scheduler at all.
>>>
>>> I don't see how this series introduces a problem?
>>>
>>> The fact is that drivers are abusing the API by just firing jobs back
>>> into the scheduler's job list. This series legalizes the abuse by
>>> providing scheduler functionality for that.
>>>
>>> IOW, the series improves the situation but does not add a *new*
>>> problem. Even less so as driver's aren't forced to use the new status
>>> code, but can continue having job completion race with timeout
>>> handlers.
>>
>> Maybe yes, but I'm really not sure about it.
>>
>> Take a look at the git history or job destruction, we already had exactly that approach, removed it and said that leaking memory is at least better than an use after free issue.
>>
>>>>
>>>> Instead we should track the HW fences (or maybe the scheduler fences which point to the HW fence) the scheduler waits for.
>>>>
>>>> This HW fence is then given as a parameter to the driver when we run into a timeout.
>>>>
>>>> This has the clear advantage that dma_fence objects have a well defined livetime and necessary state transition. E.g. you can check at all times if the fence is signaled or not.
>>>
>>> I'd say that centralizing job handling in the scheduler is a
>>> prerequisite of what you suggest. You can't clean up anything while
>>> certain drivers (sometimes without even locking!) just willy-nilly re-
>>> add jobs to the pending_list.
>>
>> The point is we should get completely rid of the pending list.
>>
>> Then the whole question of removing or re-adding anything to the pending list doesn't appear in the first place.
>>
>> The issue with that is that we need to change the timeout callback to take the fence and not the job. And that is a rather big change affecting all drivers using the scheduler.
>>
> 
> I agree with the idea that the pending list should generally be a list
> of pending fences, but once you start considering the implications, I'm
> not really sure it works—or at least, not easily.
> 
> Most drivers these days decouple the fence and the job (i.e., the fence
> isn't embedded in the job), so there's no inherent way to go from a
> fence → job. In Xe, the job’s fence can be one of a variety of different
> fences, depending on the submission type. To handle fence timeouts, we
> don’t necessarily need the job itself, but we do need the driver-side
> software queue. In Xe, this would be the scheduler, given the 1:1
> relationship—so we could likely make it work. For drivers without a 1:1
> relationship, it's unclear how this would be resolved, though perhaps
> the hardware queue would be sufficient in that case.
> 
> It also follows that the job would be freed immediately after run_job()
> if we don’t maintain a pending list of jobs, right? That opens a huge
> can of worms, especially considering how Xe depends on the job being
> freed only after the fence signals. Our job reference counts tie into
> power management, hold a reference to the software queue, which in turn
> reference-counts the VM, etc. I suspect other drivers do similar things.
> It seems far simpler to just keep the job around until its fence
> signals.
> 
> TL;DR: This seems like quite a lot of trouble.

For a start my idea is to have a pointer to the job in the scheduler fence, then track the pending fences instead of the pending jobs.

As a next step give the timedout callback the scheduler fence (which has both HW fence pointer and job at that point) instead of the job and stop messing with the pending list all together during a timeout.

As a next step we could move the job pointer from the scheduler fence into the driver specific HW fence.

Then we add a DMA-buf utility object which starts a work item when a dma_fence signals (I wanted to do that anyway cause that is a rather common pattern).

This utility object would then replace the free_job callback from the scheduler, so that drivers can basically decide themselves when they want their job object freed.

Regards,
Christian.

> 
> Matt
> 
>> Regards,
>> Christian. 
>>
>>>
>>>
>>> P.
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>  
>>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>>> ---
>>>>>  drivers/gpu/drm/scheduler/sched_main.c | 46 ++++++++++++++++++++++++++++++++--
>>>>>  include/drm/gpu_scheduler.h            |  3 +++
>>>>>  2 files changed, 47 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 0f32e2cb43d6af294408968a970990f9f5c47bee..657846d56dacd4f26fffc954fc3d025c1e6bfc9f 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -374,11 +374,16 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>>>>>  {
>>>>>  	struct drm_sched_job *job;
>>>>>  
>>>>> -	spin_lock(&sched->job_list_lock);
>>>>>  	job = list_first_entry_or_null(&sched->pending_list,
>>>>>  				       struct drm_sched_job, list);
>>>>>  	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>>>>  		__drm_sched_run_free_queue(sched);
>>>>> +}
>>>>> +
>>>>> +static void drm_sched_run_free_queue_unlocked(struct drm_gpu_scheduler *sched)
>>>>> +{
>>>>> +	spin_lock(&sched->job_list_lock);
>>>>> +	drm_sched_run_free_queue(sched);
>>>>>  	spin_unlock(&sched->job_list_lock);
>>>>>  }
>>>>>  
>>>>> @@ -531,6 +536,32 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>>>>>  	spin_unlock(&sched->job_list_lock);
>>>>>  }
>>>>>  
>>>>> +/**
>>>>> + * drm_sched_job_reinsert_on_false_timeout - reinsert the job on a false timeout
>>>>> + * @sched: scheduler instance
>>>>> + * @job: job to be reinserted on the pending list
>>>>> + *
>>>>> + * In the case of a "false timeout" - when a timeout occurs but the GPU isn't
>>>>> + * hung and is making progress, the scheduler must reinsert the job back into
>>>>> + * @sched->pending_list. Otherwise, the job and its resources won't be freed
>>>>> + * through the &struct drm_sched_backend_ops.free_job callback.
>>>>> + *
>>>>> + * This function must be used in "false timeout" cases only.
>>>>> + */
>>>>> +static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sched,
>>>>> +						    struct drm_sched_job *job)
>>>>> +{
>>>>> +	spin_lock(&sched->job_list_lock);
>>>>> +	list_add(&job->list, &sched->pending_list);
>>>>> +
>>>>> +	/* After reinserting the job, the scheduler enqueues the free-job work
>>>>> +	 * again if ready. Otherwise, a signaled job could be added to the
>>>>> +	 * pending list, but never freed.
>>>>> +	 */
>>>>> +	drm_sched_run_free_queue(sched);
>>>>> +	spin_unlock(&sched->job_list_lock);
>>>>> +}
>>>>> +
>>>>>  static void drm_sched_job_timedout(struct work_struct *work)
>>>>>  {
>>>>>  	struct drm_gpu_scheduler *sched;
>>>>> @@ -564,6 +595,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>  			job->sched->ops->free_job(job);
>>>>>  			sched->free_guilty = false;
>>>>>  		}
>>>>> +
>>>>> +		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
>>>>> +			drm_sched_job_reinsert_on_false_timeout(sched, job);
>>>>>  	} else {
>>>>>  		spin_unlock(&sched->job_list_lock);
>>>>>  	}
>>>>> @@ -586,6 +620,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>   * This function is typically used for reset recovery (see the docu of
>>>>>   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>>>>>   * scheduler teardown, i.e., before calling drm_sched_fini().
>>>>> + *
>>>>> + * As it's only used for reset recovery, drivers must not call this function
>>>>> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
>>>>> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
>>>>>   */
>>>>>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>  {
>>>>> @@ -671,6 +709,10 @@ EXPORT_SYMBOL(drm_sched_stop);
>>>>>   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>>>>>   * scheduler startup. The scheduler itself is fully operational after
>>>>>   * drm_sched_init() succeeded.
>>>>> + *
>>>>> + * As it's only used for reset recovery, drivers must not call this function
>>>>> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
>>>>> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
>>>>>   */
>>>>>  void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
>>>>>  {
>>>>> @@ -1192,7 +1234,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
>>>>>  	if (job)
>>>>>  		sched->ops->free_job(job);
>>>>>  
>>>>> -	drm_sched_run_free_queue(sched);
>>>>> +	drm_sched_run_free_queue_unlocked(sched);
>>>>>  	drm_sched_run_job_queue(sched);
>>>>>  }
>>>>>  
>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>> index 83e5c00d8dd9a83ab20547a93d6fc572de97616e..257d21d8d1d2c4f035d6d4882e159de59b263c76 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -393,11 +393,14 @@ struct drm_sched_job {
>>>>>   * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
>>>>>   * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
>>>>>   * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
>>>>> + * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's assumption, the GPU
>>>>> + * did not hang and is still running.
>>>>>   */
>>>>>  enum drm_gpu_sched_stat {
>>>>>  	DRM_GPU_SCHED_STAT_NONE,
>>>>>  	DRM_GPU_SCHED_STAT_RESET,
>>>>>  	DRM_GPU_SCHED_STAT_ENODEV,
>>>>> +	DRM_GPU_SCHED_STAT_NO_HANG,
>>>>>  };
>>>>>  
>>>>>  /**
>>>>>
>>>>
>>>
>>

