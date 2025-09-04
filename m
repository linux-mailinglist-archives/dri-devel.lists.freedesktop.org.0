Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302BEB43ADE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D50310EA11;
	Thu,  4 Sep 2025 11:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uwp8XcfD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2918210E240;
 Thu,  4 Sep 2025 11:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWSWiSrhCChChfMgrBIE3Z2GWiX5G5+dYt0Zgkx1sOjVHlQnJ7SLWA/L3AotcoHznj2zUQf0W1lJ+ouBPgftscvvUKNGOkiaG2irD6Uxb4HyOTW5LXWhaapuE+JySAINxxCnC0LOJH23qOtbeWf6UzZxjbrZA0M+uzNLBC7tISjmR97eIlNt6YaqtP24sQDJPxQk1cik4HNudG1KadZ7q1v6G4OnDmJvr8tfpD5oeqRiX/0uB9is+hZazfweeIjmC7Nm4Amu56Ix0yuGavyjK5B/H0Pdg4X1yAKGYKMMdcsqRsDR3Z8SM5rxRHCNyiwJmxx15RfbhpzypLzH48Zx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bd939eV9s+qNo3yQfcoDQd3lYpW696VfitMMaWlVTpY=;
 b=FJFnmZWnDK41SOfWxqQqsH8KdDtK3MtW+eynbcp7hkK9xlJpeUlLXjEJm7jKARamoCi0udz89OWWrxJdML9bRqrBFJuMGfZgGBHx16OLjK4uf+Y5isQ42TuU2XsAGJqLTOGH9HLeh3kSB32P0SIzdtPvtvgd8+tY5Ok2EDUHVXewaRKhyBnpTc6UNZF4L1PLR1DezY9i0BHzQy4ObQglb5+nga9fxwZTKKfZKFuY4uBVvg2mMoIJY6vIuPdI1hepEIqVzs9oc/5IwGs1Xz4dZ3/21Lbchah5zYT96cbp0erUqepvN/GQ6/kXvU4THZZDPXpE0Ztjy+3dRBrWrReqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bd939eV9s+qNo3yQfcoDQd3lYpW696VfitMMaWlVTpY=;
 b=uwp8XcfDSm8DoMJkkMNeJGRtWT8bpA+l5zreQjcmfhVFf1HnF4vfuZ0h0/AaEBPYBHsBhs+cSDHvIqJvg8IqiigKsU2rjs+1KbkOqql73RXhLCwRcBg/qOGi4+LtsYxZ2RF1v5tbrO6K2Vs7rmHCV5VYb8UI9ECEMpluAidn6k8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8268.namprd12.prod.outlook.com (2603:10b6:930:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 11:56:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 11:56:51 +0000
Message-ID: <53ec7656-d5d7-460e-a245-0c9598a71f26@amd.com>
Date: Thu, 4 Sep 2025 13:56:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "drm/nouveau: Remove waitque for sched teardown"
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250901083107.10206-2-phasta@kernel.org>
 <3407fd9d-68e0-4c45-9761-98ede450bb25@amd.com>
 <b35506de99be38f560709660b10667ca9f386181.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b35506de99be38f560709660b10667ca9f386181.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a2232e-3f60-4c69-e8e8-08ddebaa2298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VStCZGNGN1dUVXRQUHZVK05CUGNlbmlYYmdiNklhWmpmT0VQeUQ2d1Z0N05E?=
 =?utf-8?B?MVozZS9GcG00RG9xWGNKWjRWTUdBZHVZb3Zzc1BuN3VNTHhyd1RpOTVLaElQ?=
 =?utf-8?B?Ym52UVlXNDBtRGhWeVV4Z2E2d0xHeHRRMy91RVBTU2FlUlVDV0h5a1pXU01x?=
 =?utf-8?B?Y2JBazY5ZmN1RFBOREtnOGNFTnQxODRVNVlzU2Q1ZWV6Sk1FUmlkV1AxdHF2?=
 =?utf-8?B?K0l3M2pzdG5ibnMxN2szdWx2dWRYVnJKajJUcFFDVDhQMkVuSFZjdEJHVURB?=
 =?utf-8?B?NjRQOEUrSEEzK0lhQlcwd1J0cVZueGdlOFpGRVlTZ2ZpOXE2ZVRjcEsyQXg2?=
 =?utf-8?B?SURSSVY4bVhxbFNSa1pUVGcvMGVCYkxFTWoxVGFOc0p5VDhiNzVjWEdyM0ZD?=
 =?utf-8?B?Qkx0eXNVSE9td3dTMmx2aWRsOW10ckFNVVZkblZmQUFPNnNDWkpEZWozZHdF?=
 =?utf-8?B?SXQ2TmpaclVYNXQ5c3ZyczRrMllWQVhyZEt3WlhBakNva0FoQWhwTVl2SXpo?=
 =?utf-8?B?NXlFekEyZ0RlOXRHMDVkdkhHbTliZkNqWHo4djBVMVZ1Ni9tWnZtY2g5VzNN?=
 =?utf-8?B?SmFOWmJCaml6dW40ZUtlRFZBQkt5OVp4QmhXTkwwbVNST0VFT09zdVRTcXBi?=
 =?utf-8?B?bXFxWDZSK2lxeE5CUjhkeDV0WWk0TnJmTmsrQWs2S3pNY0swZTNOc2I4Mi9U?=
 =?utf-8?B?UUF5aDV0YXMwN0E2RGE4QkF6Uk4rVm9rYkRRb0V1b252V1VrcG9IeFVzSXl5?=
 =?utf-8?B?ZUNjYUFFVFUwd1NReXhteW9nb0s2TU1kdFZaQnZWQ1E0NHNPRzZLUENUdSt4?=
 =?utf-8?B?T3p2dHhReVZEODcyVklvWjNaM1lTOWV0Zmw4Nit4Z1M0OFpJQk5pa1daNFg2?=
 =?utf-8?B?bGdkTmRtdTlKUDJMZXFFWnVycFpTbTRpQjhjY2dlTUZLYXEyTFVveldJa1Rh?=
 =?utf-8?B?TGl4Mlg1dnd3M0w1M09uOTcxamF2Z1JjbFErMk5lbXYxS0pYazRLUDJjTXlO?=
 =?utf-8?B?aTBrWWIvV0g4T2FLUEVVdDZ1UTNTMTBKMS9nTUdycmhsSWZhVW9wcm03R3d4?=
 =?utf-8?B?QXFiaVdGbGF2cm5kUGlkOVZ5UTFJdkxCaGJGRmNCYTUxZ09TWlhDeVArQjdR?=
 =?utf-8?B?NFYrV3gxREY0aHF2b3hnVUlRNU9vMXo0R3Y5MGpkM2hBQW5MR1VtL0VrSGxl?=
 =?utf-8?B?Zm92MGwvVjhzOGwxYm1aUlpQWFRXU1Q0TGVDbGU2VmY3L2E1cXFWYVNzNkRl?=
 =?utf-8?B?Q1BJeE9FQjhPeUJFK2dBeWtWQ0hFb0d4N2VBWDdSVm9uMEJJN0dyNnc3Y1lP?=
 =?utf-8?B?Ri9hTnhSNkxYWm5ubVBXdlVKamtUYXB0VW9rYXJYQWFyUU5WNlZtSmFicEVQ?=
 =?utf-8?B?Y3U5YWtwZEdFMTZnRk1UZEl4UG5iMm56UittN0xoZndXTDBDcmhPVEo3K0t3?=
 =?utf-8?B?MEpvSWVCc2l0RktGQjgvQ3g1VldRd2YxU052RVMydWtGYWtjSnJRRUd1SndU?=
 =?utf-8?B?L2VGaE01L1pHbWpEOTZPa3EvNnQ0WlVrenlHVUdoZmo3aThRWXk4VldKckY3?=
 =?utf-8?B?WGUxRGprSTJCbXk1dElPVnhZb3o3Y0hvTytyY1l4KyszbDBHb3BkUTJBWkg1?=
 =?utf-8?B?TWRWRkpBT0N2bzZ3UEN0VjVReFdOOTNkV1BjMHpUcDlNdThGNnlQTWZCVEN4?=
 =?utf-8?B?cHVHS0ZFeDVFU0RWUGpjMUx3WXZsQ0dVSW5jM2dpcW1jMWFZUnZWNkFyVjB6?=
 =?utf-8?B?dDhkSzZOZEd4a244K0Rjdm84UWF0Q1hDT25lU0tGVDI1SWJocERCdHQ3Z25G?=
 =?utf-8?B?a3pjTklCaDIyRHhkaDJmbXhrUEx1ZEpaWmExa3RCb1BOL3pieThaMVBPSzZT?=
 =?utf-8?B?L2N4VkZReU1vUnl0ODlLN2NtM1pCcXdPMW1Xb1V1bzVnWkYrYjY2cnFUcmxt?=
 =?utf-8?Q?jrTLzpgMY10=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDV2b0p2NjhmUWhoWVZJclg1NGF0d3FKOGVXRUhvTWs3SVZadGZjaUdIdTVN?=
 =?utf-8?B?M2pDMXVDNzJXU1pxd3RGRHpxOENBSlFtaVBrMU9YRFRjV1ZuTjFENFM1N1JL?=
 =?utf-8?B?L09mZmpTR0Roc3FZeTQ5MXhsaXNnNElLRVgrcjkxU2xidWNtaEFwR2dEY2Mr?=
 =?utf-8?B?RktuSEs3RWpJNjRENDhJSVVRWFhEMFJxemh3eHVOeUdRbG1tcHZnT0F4c1Yx?=
 =?utf-8?B?Y1pXRTRtcFp6R0NxdXlZRmRxR0RaNGFKaFd1LzFoR25LZXhDZ2xIcHVKWVJT?=
 =?utf-8?B?MnAzMTViWG16Zk5hS0tmM1Foa0FaLy8zTVhjSy9SVGVMR0MvN2w1L1Bld2kz?=
 =?utf-8?B?bldCTmtNUDdvVnJKalp1eERTckZqUTFHSjJTK3VwamRwL0dmaDFIN3NPMVIy?=
 =?utf-8?B?amk5SUpOZ2g4ZEFrTXhiUmpqNU4wd0MwNjV4VDh1S3ZjSU1XNkdNYVZWOXZK?=
 =?utf-8?B?VEtNVjBvenMxL1plQXRJU2VXTEMvRHNJek84MjVhVmd2M3k5SEhraENZWTZ2?=
 =?utf-8?B?TmY0R3hIY240aTVzdDh4NjJUd2Z6cVo5REZvRm0xS1ZZNGlwWlkyQWNOZC92?=
 =?utf-8?B?NGpMT2lLcVNMaVVqcFczd1hmKy83R2o0YmZ4MXIrNHVLR29YY3NhTEk4a1NZ?=
 =?utf-8?B?OEJRNDBzZ0hpaWFMZHFCRUZlWVVvRGI2akxFb3hkZnVIZFNNeEZGL2tnSVVU?=
 =?utf-8?B?RG1Hb0JYT2QvZytXbkkzQlRkQ3lsSWhabHEweTRHcWJPcXB5eFZGaklrSHJB?=
 =?utf-8?B?ZEpwWGxqM1N3NXJPQndBQ3ErNkx3Sk9WZEdWRDNveThpV0hMSWIxRTB3Z1R5?=
 =?utf-8?B?Y1FaZ1BHbWFnbzNVZmhZbEgyWkpTMU9kWEFVNmhzVjNOMlVmZHFkYmp0MGNn?=
 =?utf-8?B?NWE4UEhPb0QrL1pnR242WXNVN3MyNW1QTTlGQ1hEQUlIWDhWbnRRTFBVRVRJ?=
 =?utf-8?B?UWVDdnZOd2MxYkJqclRWVzZsbjBza3VhV2o2a3BoU1JqMmtBb3p2RkNZL2Rm?=
 =?utf-8?B?VWcyb08zWkR6MVIzMHlIVEozcGdUNmdabkRyWllaYVZKNjkyM0dFZzFEUnFZ?=
 =?utf-8?B?ZnRwSSt0WU9BRWZaN0MvRjNJdkF4SVhQZEgzeFJMRVhXcnRZcGJJMFN5RkJ4?=
 =?utf-8?B?OGVTYVh0SG5kNmxmSVhYN00vWGdZcll2ZHYvMmEyaVlVcnkwV2RZdlRxeGZr?=
 =?utf-8?B?M2tETUNibzFubGNoWEZQNGswOHk5UjlONXBVNWxobktTdVl3YWprQnIycmp5?=
 =?utf-8?B?OC9IdXBsTUVmdG40T0NENXRqbncxMmZrb0sydStiUU5sOGNDTTA2dHoxRXdH?=
 =?utf-8?B?cWFxelhlZWdtQTBibnhWUDRFSjYyNmMxajR1amQweTVxM2tlKzU3d3pkc1RK?=
 =?utf-8?B?UFd2L3VDdGpDN05HRzBaZEVpa0xXelZEOE5WNm9UaktBYURDaXNlS3BBWHVj?=
 =?utf-8?B?YU1EZUp6KzRyb2JicTlpNnkyYTUwUWVtczR2bk5tUDc1a052MGpmaDZwQXdE?=
 =?utf-8?B?ajl2cTRXRGNRQXZ5elJ1UlpRVk5KQUd2VFU2NGlURUdZRWZjODhwcXNXVlhy?=
 =?utf-8?B?U0ZKUkZsMENqczFueEYyckFaa0s0YnVUNFhoN0ZiTkZtMkdSWlBsNVpYSys5?=
 =?utf-8?B?aTIxSHUxYmE0dmhkaVJOL2gwdk1LZ0JNTWl1MFk4U014bnVPbXJ4SFB5Vk1L?=
 =?utf-8?B?a0V3WU9Fc29Yc1RhanBSbjVXcmRhQTIvMjF2RmV0ZXFsbE1LZnBIK1pQZmJ3?=
 =?utf-8?B?dXFwOTFpOWxicmVaWlBEVGYzR3lVc1paV2Nnb3VrTExKYjhiSFFkdzM1OEpw?=
 =?utf-8?B?QTd1KzZueEg1UDhLKzFWbzNvOEhxWXV3Y2tYYkc4WUNHV2tZb1l3MFFwMWh5?=
 =?utf-8?B?cEUxQkdJTnJyNE5uTHFieHNVTzBnUHhHWWY5UktsQ0Njc0JWdERQS1N3WE1p?=
 =?utf-8?B?NFg0cVd2VHE1dnBPazJpeXVDNkR3dFdzcDRYcE5zT1FlUk90TTBYZ1NkRVBI?=
 =?utf-8?B?N1YrdjF2dUx4QnFSd1BRU2t2d3NKVThYZHJxMDczYUViYlVuMHUyOFVQNVR6?=
 =?utf-8?B?Z1lUN0Nkd2tLeWNKSE5rclV1REFQMnBLamtEZXlaVU95VWZ6NklCR1RRVXJv?=
 =?utf-8?Q?rGG8dltg5wIrXHl2PDIlsUtXO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a2232e-3f60-4c69-e8e8-08ddebaa2298
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:56:51.5310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w17+xAZmwwvwF0AtaFRz/izR4F/ao6A8k+O80NVfdjLtiLOnz3F5+9sVC18GGLLN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8268
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

On 04.09.25 13:12, Philipp Stanner wrote:
> On Thu, 2025-09-04 at 12:27 +0200, Christian König wrote:
>> On 01.09.25 10:31, Philipp Stanner wrote:
>>> This reverts:
>>>
>>> commit bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
>>> commit 5f46f5c7af8c ("drm/nouveau: Add new callback for scheduler teardown")
>>>
>>> from the drm/sched teardown leak fix series:
>>>
>>> https://lore.kernel.org/dri-devel/20250710125412.128476-2-phasta@kernel.org/
>>>
>>> The aforementioned series removed a blocking waitqueue from
>>> nouveau_sched_fini(). It was mistakenly assumed that this waitqueue only
>>> prevents jobs from leaking, which the series fixed.
>>>
>>> The waitqueue, however, also guarantees that all VM_BIND related jobs
>>> are finished in order, cleaning up mappings in the GPU's MMU. These jobs
>>> must be executed sequentially. Without the waitqueue, this is no longer
>>> guaranteed, because entity and scheduler teardown can race with each
>>> other.
>>
>> That sounds like exactly the kind of issues I tried to catch with the recent dma_fence changes.
> 
> Link? :)

dma-buf: add warning when dma_fence is signaled from IOCTL

> 
>>
>> Going to keep working on that and potentially using this here as blueprint for something it should catch.
> 
> This is more like a nouveau-specific issue. The problem is that
> unmapping mappings in the GPU's MMU must be done in a specific order,
> and all the unmappings must be performed, not canceled.
> 
> For EXEC jobs, it's perfectly fine to cancel pending jobs, remove the
> waitqueue and just rush through drm_sched_fini().
> 
> I don't know the issue you're describing, but I don't think a feature
> in dma_fence could help with that specific Nouveau problem. dma_fence
> can't force the driver to submit jobs in a specific order or to wait
> until they're all completed.

Well the updates are represented by a dma_fence, aren't they?

So the dma_fence framework could potentially warn if a fence from the same context signals out of order.

Regards,
Christian.

> 
> Grüße
> P.
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Revert all patches related to the waitqueue removal.
>>>
>>> Fixes: bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
>>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>> Changes in v2:
>>>   - Don't revert commit 89b2675198ab ("drm/nouveau: Make fence container helper usable driver-wide")
>>>   - Add Fixes-tag
>>> ---
>>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 15 -----------
>>>  drivers/gpu/drm/nouveau/nouveau_fence.h |  1 -
>>>  drivers/gpu/drm/nouveau/nouveau_sched.c | 35 ++++++++++---------------
>>>  drivers/gpu/drm/nouveau/nouveau_sched.h |  9 ++++---
>>>  drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 +++---
>>>  5 files changed, 24 insertions(+), 44 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> index 9f345a008717..869d4335c0f4 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> @@ -240,21 +240,6 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>>>  	return ret;
>>>  }
>>>  
>>> -void
>>> -nouveau_fence_cancel(struct nouveau_fence *fence)
>>> -{
>>> -	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
>>> -	unsigned long flags;
>>> -
>>> -	spin_lock_irqsave(&fctx->lock, flags);
>>> -	if (!dma_fence_is_signaled_locked(&fence->base)) {
>>> -		dma_fence_set_error(&fence->base, -ECANCELED);
>>> -		if (nouveau_fence_signal(fence))
>>> -			nvif_event_block(&fctx->event);
>>> -	}
>>> -	spin_unlock_irqrestore(&fctx->lock, flags);
>>> -}
>>> -
>>>  bool
>>>  nouveau_fence_done(struct nouveau_fence *fence)
>>>  {
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> index 9957a919bd38..183dd43ecfff 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> @@ -29,7 +29,6 @@ void nouveau_fence_unref(struct nouveau_fence **);
>>>  
>>>  int  nouveau_fence_emit(struct nouveau_fence *);
>>>  bool nouveau_fence_done(struct nouveau_fence *);
>>> -void nouveau_fence_cancel(struct nouveau_fence *fence);
>>>  int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
>>>  int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
>>>  
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> index 0cc0bc9f9952..e60f7892f5ce 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> @@ -11,7 +11,6 @@
>>>  #include "nouveau_exec.h"
>>>  #include "nouveau_abi16.h"
>>>  #include "nouveau_sched.h"
>>> -#include "nouveau_chan.h"
>>>  
>>>  #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
>>>  
>>> @@ -122,9 +121,11 @@ nouveau_job_done(struct nouveau_job *job)
>>>  {
>>>  	struct nouveau_sched *sched = job->sched;
>>>  
>>> -	spin_lock(&sched->job_list.lock);
>>> +	spin_lock(&sched->job.list.lock);
>>>  	list_del(&job->entry);
>>> -	spin_unlock(&sched->job_list.lock);
>>> +	spin_unlock(&sched->job.list.lock);
>>> +
>>> +	wake_up(&sched->job.wq);
>>>  }
>>>  
>>>  void
>>> @@ -305,9 +306,9 @@ nouveau_job_submit(struct nouveau_job *job)
>>>  	}
>>>  
>>>  	/* Submit was successful; add the job to the schedulers job list. */
>>> -	spin_lock(&sched->job_list.lock);
>>> -	list_add(&job->entry, &sched->job_list.head);
>>> -	spin_unlock(&sched->job_list.lock);
>>> +	spin_lock(&sched->job.list.lock);
>>> +	list_add(&job->entry, &sched->job.list.head);
>>> +	spin_unlock(&sched->job.list.lock);
>>>  
>>>  	drm_sched_job_arm(&job->base);
>>>  	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>> @@ -392,23 +393,10 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
>>>  	nouveau_job_fini(job);
>>>  }
>>>  
>>> -static void
>>> -nouveau_sched_cancel_job(struct drm_sched_job *sched_job)
>>> -{
>>> -	struct nouveau_fence *fence;
>>> -	struct nouveau_job *job;
>>> -
>>> -	job = to_nouveau_job(sched_job);
>>> -	fence = to_nouveau_fence(job->done_fence);
>>> -
>>> -	nouveau_fence_cancel(fence);
>>> -}
>>> -
>>>  static const struct drm_sched_backend_ops nouveau_sched_ops = {
>>>  	.run_job = nouveau_sched_run_job,
>>>  	.timedout_job = nouveau_sched_timedout_job,
>>>  	.free_job = nouveau_sched_free_job,
>>> -	.cancel_job = nouveau_sched_cancel_job,
>>>  };
>>>  
>>>  static int
>>> @@ -458,8 +446,9 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>>>  		goto fail_sched;
>>>  
>>>  	mutex_init(&sched->mutex);
>>> -	spin_lock_init(&sched->job_list.lock);
>>> -	INIT_LIST_HEAD(&sched->job_list.head);
>>> +	spin_lock_init(&sched->job.list.lock);
>>> +	INIT_LIST_HEAD(&sched->job.list.head);
>>> +	init_waitqueue_head(&sched->job.wq);
>>>  
>>>  	return 0;
>>>  
>>> @@ -493,12 +482,16 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
>>>  	return 0;
>>>  }
>>>  
>>> +
>>>  static void
>>>  nouveau_sched_fini(struct nouveau_sched *sched)
>>>  {
>>>  	struct drm_gpu_scheduler *drm_sched = &sched->base;
>>>  	struct drm_sched_entity *entity = &sched->entity;
>>>  
>>> +	rmb(); /* for list_empty to work without lock */
>>> +	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
>>> +
>>>  	drm_sched_entity_fini(entity);
>>>  	drm_sched_fini(drm_sched);
>>>  
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
>>> index b98c3f0bef30..20cd1da8db73 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
>>> @@ -103,9 +103,12 @@ struct nouveau_sched {
>>>  	struct mutex mutex;
>>>  
>>>  	struct {
>>> -		struct list_head head;
>>> -		spinlock_t lock;
>>> -	} job_list;
>>> +		struct {
>>> +			struct list_head head;
>>> +			spinlock_t lock;
>>> +		} list;
>>> +		struct wait_queue_head wq;
>>> +	} job;
>>>  };
>>>  
>>>  int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> index d94a85509176..79eefdfd08a2 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> @@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
>>>  	u64 end = addr + range;
>>>  
>>>  again:
>>> -	spin_lock(&sched->job_list.lock);
>>> -	list_for_each_entry(__job, &sched->job_list.head, entry) {
>>> +	spin_lock(&sched->job.list.lock);
>>> +	list_for_each_entry(__job, &sched->job.list.head, entry) {
>>>  		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
>>>  
>>>  		list_for_each_op(op, &bind_job->ops) {
>>> @@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
>>>  
>>>  				if (!(end <= op_addr || addr >= op_end)) {
>>>  					nouveau_uvmm_bind_job_get(bind_job);
>>> -					spin_unlock(&sched->job_list.lock);
>>> +					spin_unlock(&sched->job.list.lock);
>>>  					wait_for_completion(&bind_job->complete);
>>>  					nouveau_uvmm_bind_job_put(bind_job);
>>>  					goto again;
>>> @@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
>>>  			}
>>>  		}
>>>  	}
>>> -	spin_unlock(&sched->job_list.lock);
>>> +	spin_unlock(&sched->job.list.lock);
>>>  }
>>>  
>>>  static int
>>
> 

