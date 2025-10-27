Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F7C0C357
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 08:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2A710E2EF;
	Mon, 27 Oct 2025 07:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SgEMFB0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013053.outbound.protection.outlook.com
 [40.107.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB8410E2EF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:57:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLof7EOYUEan314eh2S9H7/pzsjGFXlU4FeO59kVeS80C5F6bZpcBTyxpV7vfNwblohJwE3jKNChHeqz8MEj7S3jeS3WB3XzhbD2X3hgnNhKNc0Eqzpo50ROB8fQIyMbLtjOQSXAkrGEABxic9xgAZ8Cs+/XISlLuxl1y6eRhipS/qwGV3IktjRjyMAPguEjR9XcUkbFsGMDHrDd+ICXmxdvmb6HQnorJ+jSca6HipAJ0BxB8hxbvoN10gy9P3+E00cvOqC0eZbmZijoCrElJRTvA/jFCnwTvJvRCWZKrqcbwEJnypa/9gPuD800+a/njaUP+/VtuvsDdaj7SnGR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qno9+APPqy23oBcZ4d/YricwSA/pHWOans9ByyMOCqo=;
 b=FmHCw4Imypi9NYersIpTtk49hfuuhKFvuqUfHNQ1cswGm+r2BFIjQpKJz2oI597I7aShiuJ9cEE5wghOlC/7bxlnzB+zbeOusJuBn+YKwjpdIxwwJ3Np4A/c6ckUD6Jyep5hF1dRmmeGcO/uGGxnR+vr8rHLE1v9RDF88n8PliFCPvV6VIJhLlo5pRx+MMGDyu2QbpsWUXz7CHnjD3aSM2mjP5X07L7DU0HmPkOLaCdDsbBDZCJA1kOA5z2jC6g7PJCLW4sIvSvHHXppDZ52K+AlY92XcUHfFf4COXgmF+6EH3fhyQXSdJIjNTLJsYzP+KqJezM06P+pL8I7U1Uzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qno9+APPqy23oBcZ4d/YricwSA/pHWOans9ByyMOCqo=;
 b=SgEMFB0NzEDYqbhR16wlh9KM63Y64/9ad9ZqdmplBqKFT/GF5rdgSN1NjLqonke+EaCrk5DXtluM0eCoBsRX7qnkXMTtsCt1KMxOs30PVIOtiXI4KF8WOhZ3pwrb8R8SJR7PbVHX+ZUFuFIX3+qSFsZPm39n/x7B3YDfnzIFyxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CH1PPFC596BECF8.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::621) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 07:57:06 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 07:57:06 +0000
Message-ID: <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
Date: Mon, 27 Oct 2025 08:56:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ttm: add pgprot handling for RISC-V
To: Icenowy Zheng <uwu@icenowy.me>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>,
 Yao Zi <ziyao@disroot.org>
References: <20251020053523.731353-1-uwu@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251020053523.731353-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:408:d4::17) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CH1PPFC596BECF8:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b80aa0-0499-4fb8-b521-08de152e6c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1dEY2p3cVlxalRVS1ZBUFVwV1dHY1hWOUIzVlBONGZuZWUxWWc5L1k5QzJ2?=
 =?utf-8?B?OURhd1RidUF2bTVZTEFsaVFPSm8raklwMW9DLzZvdGNMTzQzbENPakxpQ3hH?=
 =?utf-8?B?U2M5QmZkWGZaN2krS2RLczVmVWhkYjM1eWxWVThuRjlzK3BuZDBBb2xNNENI?=
 =?utf-8?B?STE3YzNPRGtVM2x2UGZnRGJzVlBSNXozSVVUUXF6SHlEaTczbE4yaU44dDVh?=
 =?utf-8?B?VXRPTlVDblkxMEY4dWtiSXBCOEN3c3dvWHhzaHk3QVZRQ3pSOGxEWjVTaHBY?=
 =?utf-8?B?VE9DVWxKbG9RZWpJenZCdkpySTBXR2xSM1JjVnN1WUpRVnpyZExzVk4yS1dl?=
 =?utf-8?B?cnFXM2hiSi92M1g1cjc4QW1aeWJsRW1paHNVQ2I4OVk3VGFzQ0JlOVI0S0Jq?=
 =?utf-8?B?K0o4N2NWZHZ2eHVLQlNWTWYrbjRyeUVoU1kzV0lZbThkM1M2alJMVU9ONXJD?=
 =?utf-8?B?bGNvcHhVMG4wbDJDbGZ3RHhQcEE1L0lhK05zUy80S01RL2FobDF6NjkvaGhS?=
 =?utf-8?B?WDRKb0g2djlrVGl1Yzk1NUNIK0pIZ1plY2xPWi9HVkZnQ1YySVRTbDZDYi92?=
 =?utf-8?B?cncvc2NvamVFU2d3aTVFN3JXemJPbDh3NzQxM01wM0xpQ1A3QjFNMFBUaEkr?=
 =?utf-8?B?K3FLZ1duSXdhc3hWcjhHWEV4M0FtZjdXOWVqNVBNYk1kUzZ3alBpeFA3UFZi?=
 =?utf-8?B?SjlCVk5IN3pzKzk5TCtLcFd2bTNya3ZHd2UxajlRa0ZVdHRKeE5HNzlGckFM?=
 =?utf-8?B?ZkZVZkhQVzV2N2RjVzhwWDFRVCsxMUJGL0lwc2o1N0tPN25oU2RHSllUUlQr?=
 =?utf-8?B?Sy85RFFScUFVdFdBN2R1dFF2ekpwUXZHV1hMU3VDZzZ1eE0vYzFYbDJ1L0dj?=
 =?utf-8?B?WVVmUmFnYThKaEM5c090Z1B6ZDllVzNrL1RQUnNGMUVvSml2ZU1Yek9ta29K?=
 =?utf-8?B?NnQ2L2k0UER3Zml4U3pOdEc3RGFWUnNWWXk5VFBtTEhrc1JINFQ2WUdOa0ZU?=
 =?utf-8?B?QlhIVlV1WHYyNmVHVndMZmcyaFl2UUdHajRKNmx2Vm5kdjNSYzd2bitGbzVC?=
 =?utf-8?B?SExXQWJtTDkreVRuemsrNEEya1VmMXZjVzE4TG5sOFFpRjBOeTZVTXNNRFor?=
 =?utf-8?B?WE5kODRqSy9hN3dIZEo4dE5ReDVTbEtHdEdDeFpqSGtIQnNTQ1N4VlVBK0Vq?=
 =?utf-8?B?TnZyNE1mUGkwNmZBS0p0NVRMaHhJSDZBL2NVaEx4VE1Na0JIMDRZR2lTdGhi?=
 =?utf-8?B?WGxjTjFyMG05SHNFMTErSXFDcHR5ZnNONS94VGJIc1pwOWdKa0dJV1djRFdu?=
 =?utf-8?B?dXIyRTcwVEJqSXlhNU9IVW8ySlZPOExBWElzdzFjNVV0VDk2eFRKWE9NdCtB?=
 =?utf-8?B?VXFaYmJKT1BwTG9KM0srOEswS3FMVlhDcyt1cHhieTd4RjZqanB1S3I3dk8r?=
 =?utf-8?B?RTNSRFFkQ2Urb3gwNFFVUUNpRmVoQStiUTVrcDg0bzBMUmwwMmZQK21hTEgy?=
 =?utf-8?B?UUhnUmtlcFBNNjZUVXExL2JOa1VwUitmV0pXM2VuYzJnZkR1czFjZjJOdmdE?=
 =?utf-8?B?R3Z4SjRWbldzZjNHQm0yVFEwQ0R6UER2U0huZXVvU2I4U2VRZit2bHZsSmNq?=
 =?utf-8?B?dk8wZU1rRmRDeWZVbndUL1ZtRGVYckw1YVc3czVFYW5NT1dFaWtOc1E2VTkz?=
 =?utf-8?B?eXpOVGdBazY2NHh3c3BjaXZhK2trS1NJRjBVRVVlUjNaK2xRNU0xQ1VIeHdo?=
 =?utf-8?B?VlZaV25KeVd5VEZBSTJHQ1EvUHorNlRhbWdoQlQ4S1dQRzRyb2lxa3ZWWVFm?=
 =?utf-8?B?YkxNaStyV0hDdDlkbndud21mbGxvbmZrK3hJdTVwZ2FPdzQrdzNGRzNyelpj?=
 =?utf-8?B?amFweUZaVEU3TjVDVlRFQUx2T1FvTjBtZHdFWXNIQldab2x4R1JlaG1RempJ?=
 =?utf-8?B?OGFGMmpqSkR4LzNJN1pwQXhKRGgxcDJJdFgrR2hiTTJlaFZuNlVlTnc0M3Jm?=
 =?utf-8?Q?SUgX4XtmTwp0uG9dtDm6FMpExg/QL0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0ZFSjZ4UFQ1L09VNThuM3E0cVZSeWtDWWNwNGpUUkFjazRZM054YUttMzlv?=
 =?utf-8?B?L1Y2ckZHamZkT2E0YjFrRVUzUnZwcGJtVGhTVjR3ZHZRWHhTZ2JId1hxVFVj?=
 =?utf-8?B?eHVzclprdkJQcG1RRW5PMDNPWnRxR3J2V2g1SlRFc3p2c1k2Y2VUYzk0S1Bp?=
 =?utf-8?B?T2VCU2R4MWdaVFhOK3NNTVZXdGN1M2UxRnJhL3Bsc2t2aUgrOGJLcElxS0Vn?=
 =?utf-8?B?bGRzV0JtclRYZGROT0lmcHNFd2JCNkQ4bXRGWHlkcktZeTl5OVArMVRRQ1Z3?=
 =?utf-8?B?KzJUYzZXbUhnSlpHbVMrQ3pPVE5hN2k3a1k1K0FhMmlROXgzZEdrcFR1cFFu?=
 =?utf-8?B?Wlo4WFdjUE10VWZoaDUwdm0zb1NDaTFTR0paRkpOZnl6NGJEOXJBVTJxbHQ4?=
 =?utf-8?B?alJMZ09sVHNsVnZMNDEydlRRVzlWR2FhcC9Za2ordHJrU0NSaTVpUDZUT2Fv?=
 =?utf-8?B?djlkeVM0UDRaVHE1UWFRTk45bEVYeWlnL09sYUFQSFZQQm1qaDVuMUhvVlM5?=
 =?utf-8?B?V3BMTUF6K1JXN1hOMVkrZHA2SUkydmRGT2hMRFhhZDJYNVNHWTZrNWNJWGJz?=
 =?utf-8?B?ZHFTUUcxbjBsSE1lM01FYzhlWGI2OGRBWUJucVRDZ3BwMGxOb01DZDRCTGlG?=
 =?utf-8?B?QThlaFREUW5xUlJaTXFWQmwvd3NBZVFUeTFTd21UZHdtQ1lWRU5RZjBkdFAw?=
 =?utf-8?B?ZmJoN2F0RGdXTjVBa2RiOWRxRzN5eVhma0JaRTFmZm10MFFFdVRBRVBFaGI4?=
 =?utf-8?B?bXEyVFFsbzlzOXFJZGE1M3dyc2RIdnZYbmwrcldGbUJ6aVdiNjE0aHM3Z2R4?=
 =?utf-8?B?K1E0T2FmYmlSdHc2a05JNHJHbzBOMmJOSmM4dlR6VW5uT0MxT3ZQTTJKNlpj?=
 =?utf-8?B?MlpidTlVWUMyWHpWcmIrVFNGd0RXMVNvWGJCZFdZRXBQZ1MwK3AyWng5VUYr?=
 =?utf-8?B?UUFxNFpFQXRGMEphMSs3RGo1ZjVqQzBCd3ZnOGpWcWdRVis2QmRNQ1F6K3J5?=
 =?utf-8?B?SVhSMndWMUNkZDROeTVLUjhDQjJZaENoR3RPWXVBNDB0N2VtRU9MQ2dTS1dt?=
 =?utf-8?B?cWI4K2FycmhnTGhFOVZCWWhvNERFUENzQTdlVThleGJZNWlBRzE0MzI2ODlZ?=
 =?utf-8?B?Ny9kWGpvV3pPc3BGdTlvaUlpbERXL0wxUXNFdDZHdEt0a2ZnS2dHSURmbWFy?=
 =?utf-8?B?WDhaODZueTZOR2V4dGMvM2tKWmhjaUw3b3liV0tiUUFSQ3RDeGV1MUxlRWg1?=
 =?utf-8?B?UXVMV2VYWkZwNWR4RDlOZ2VERHl2WlNpK21qcElORjlCMnZpd3JXUFllZCtH?=
 =?utf-8?B?MHJBcVM4aHpkdkpPQ2t0OTdLK2w0dGtodHYzMm9IWEQ1YjAvVFprdzRLZzB6?=
 =?utf-8?B?TUlUUHJoQ3hsNDZ0ZlpuclNmRlF1Q2tTdDJEcXJXZFZkdmo1ZWNZbTVzcWdL?=
 =?utf-8?B?QTBDV3ZjeW13YlNnVXRUWXY2aTd6S3BLSDEwU2YwSE85QjRhbDhEVlc5dU9C?=
 =?utf-8?B?blhwZTdrUitDUFhielo0bGlFVVUzczJXMU1EclRRa1BiQVZZYXhNVWdNaVZF?=
 =?utf-8?B?d2hqeUVDdmY2V0I1ZGZDeXk4d1RKZS9kL2RrU3duQUpHK0QrSm1uZFU3aDI2?=
 =?utf-8?B?dEE5R01lRTFzVXM3TFdEdyt2WUI0QmpFYVRiTU1xZThKMG9vd3VkVHQ0cVJJ?=
 =?utf-8?B?RHdWREcyYlJRNC8yMFQyQjhTOHZNanBpSlhPY1Z6VXl3QXhCdU9QYUxLVy9i?=
 =?utf-8?B?U09nTCtJeStjaHV0QW1wUnIyOVFvblBvOUkybXcrRlBYR3piR05sMmEzYTBQ?=
 =?utf-8?B?NjRtMlZLck9pMmxjN2t0UHBpbFR0dU82NWZqL3g0eGwxcTNzeDBJMG9lY01q?=
 =?utf-8?B?a3Fzc2xDSmlpVG1rNEFtWSswQlNEdjE2cHh5Ym92YlppVUxYQjNrb1JBU2JM?=
 =?utf-8?B?ZXQyNjRpUWtacnBUeFZZMWxOeXd3WWZDRktqMTlmZll1UUswRjByZWNHVkl1?=
 =?utf-8?B?Uk9wQkxONE9ZTkc3dnZQNGV2a21FaENBMXBuS1JnaFhBd0FzazFwbE5xdnZr?=
 =?utf-8?B?SUZscXZFeGdHMUQzMjNkSFZNTnVpNGRxQnMvMGN4dDc2UUJhS2o0U1hrNmxV?=
 =?utf-8?Q?+0mCxcgUv5iI2DCHo1JX4qSti?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b80aa0-0499-4fb8-b521-08de152e6c32
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 07:57:06.3634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: el8AeYIItWOQ8yc1oVxZGJcWdf1rg01z9DmvaKGCNtR5U7cJc689hZiz1eGQ/3Sr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC596BECF8
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



On 10/20/25 07:35, Icenowy Zheng wrote:
> The RISC-V Svpbmt privileged extension provides support for overriding
> page memory coherency attributes, and, along with vendor extensions like
> Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.
> 
> Adapt the codepath that maps ttm_write_combined to pgprot_writecombine
> and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page
> access attributes.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
> Changes in v2:
> - Added Han Gao's test tag.
> 
>  drivers/gpu/drm/ttm/ttm_module.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
> index b3fffe7b5062a..aa137ead5cc59 100644
> --- a/drivers/gpu/drm/ttm/ttm_module.c
> +++ b/drivers/gpu/drm/ttm/ttm_module.c
> @@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
>  #endif /* CONFIG_UML */
>  #endif /* __i386__ || __x86_64__ */
>  #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> -	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__)
> +	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__) || \
> +	defined(__riscv)

Looks reasonable, but does that work on all RISC-V variants?

And while at it maybe please fix the indentation, using a tab here is probably not very adequate. In other words make the defined() match the one on the first line.

Regards,
Christian.

>  	if (caching == ttm_write_combined)
>  		tmp = pgprot_writecombine(tmp);
>  	else

