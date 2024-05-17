Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5608C8038
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 05:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1774D10E245;
	Fri, 17 May 2024 03:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cQKnb7+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF6D10E245
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 03:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY2SEFJODk+SYZH7bHzw2IjYfD4AmtyTku6wqKUb+2JKgrS9d5jzM1zyNBec42GTQgmfjlpbkDamnzzMWa+frjoJJ0bwQu4QIEuHETdVoWIIlvC7LJpWxsb4dVKdkQ5BC83x4ZeEEmdBXrZC3h/21Mw/caX+9LRwn71NHwMHFRBxi+i/pOTSnHTjY0EcEPHPNuVxHB2k6sjBltppjMvUOBD7/GSqLgU7ePaK6KQdVSB9DT/Z+HWzRsm4TQ60Y13BhVCii/ctlcqPbCOVfHC84s/uRfdR1XG8En7ztmf9MB7+SDry25s6xuUqVhQavG5n0T3LSDhFG+810XjVi7qVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGH6RowBCftQuni0fCdZ0e++KgjAw0O3gsIQu+SerHU=;
 b=EJJM4c3u8i03LXF1n4WaXxDUXcpLx+lQn1KgcS54koq4YMgq7rfnyd24yLDQn0cxHXZVNdF7D9dD8U4VOIg97Fn9Tyu6ZBrMkjyiMUgcWZw38O2GyhY1n/OSw4ilWYirmw30K7BTFfSM1/qtmvgpm2R2shYg0wUL0a5L9L8m/5c35Bzui3aZNQ2hBWgwGa8MtQdDHrpLb8tQqTRyAs7PBoPKltb8CmYW38r3p3f2Hs0O73uMh+J9RWMrcNSQSLmz2nKkgKC//IggsVS2zSycEJty5EImWhBPUNvst9IHA8eAHb+uu8kprDqACYSiNo+uR2IbFeQ4zRtNehCGondQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGH6RowBCftQuni0fCdZ0e++KgjAw0O3gsIQu+SerHU=;
 b=cQKnb7+k3Z0S4r3NoSjWzf02oT4wab7coRb61IBdFR+GCK2je+gbJOohEx0inSqNf0OhIRWQDU1PVzwerbjg9e3Akw2cf3OdF31vkNJ2Sz8BClTSB923T/1sEXwJdkQvHJMuCTfzRnjSCaH/0iwivQEfMqnGcfUJG0INL0TZkAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by DS7PR12MB8292.namprd12.prod.outlook.com (2603:10b6:8:e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29; Fri, 17 May
 2024 03:37:44 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::27fc:3ca2:d76f:6f47]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::27fc:3ca2:d76f:6f47%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 03:37:44 +0000
Message-ID: <135dfe3c-0f06-1fde-e180-25425f5b259e@amd.com>
Date: Fri, 17 May 2024 09:07:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v12 00/10] Improve test coverage of TTM
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
Content-Language: en-US
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <cover.1715767062.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::21) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|DS7PR12MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a35049c-2b37-48e0-1756-08dc7622b5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDh0bnI1enZ6MGpVT3REcFcvY2VIdHovNjViNHUydW5BdzhpUkVVREYzZ2dF?=
 =?utf-8?B?NlJoQldwdjB5ZWMvQ0tWZElFcjdHYzhObGZlR3lmenJuQzZEWWpuc1Vhcmhx?=
 =?utf-8?B?SjlBUmM2ekZEczkwV0dkL3JGWjBqN2pxMG80OUhYWGFObFpFMG5TZVZQSVpx?=
 =?utf-8?B?Nm1TZnk2enNtMlRISXRKSi9rNzZ3ZUNxNkVYTVJBUkdBbWdPeSsyc2FZS09v?=
 =?utf-8?B?UldBRVRDc2Jjc25Dd0huUDcwZGttTEZuOGhGK3N5d0hyT0haRmJjWTh2bEpi?=
 =?utf-8?B?WUVOWllOSE9jV0ZLM3RWZ09BWmlWWkRhcVd1aUg2clM4UUVBNWdBOHo5WC9G?=
 =?utf-8?B?cWcwc252ZW54ZFdobjRTQ1NxM0tRc21qWFQ3Y3E2S3g4bmVOY1VEdEJibmgw?=
 =?utf-8?B?WmUrR3IrMU1yOE51aXMzb1VOUFZwaXhsUmI0WXFSWmtnUjQ0QTg0Rjh2Q2Z4?=
 =?utf-8?B?U1dIZXp1MHZhV1cvbjlqTytLSGtVZmRtUHg0cUs0MUd6M003dWNHbUhQdTBr?=
 =?utf-8?B?NGExUWI0eWN6djBiMWNPR3ZSZVFGRHJaUTJ3ZGErbFdsV2EwODQzdTRmdVFn?=
 =?utf-8?B?TjIxYVhuOTFPOTB5MDRIVzdmVFA1UllyWUxHMFE2dXRpRDlERk1GdUlpU0t2?=
 =?utf-8?B?YkJrSXpMUFVvKzZva3RPRzNuRlphZUxSeFA3U0U5ZU4wSUtiQTFCcUJlVjgw?=
 =?utf-8?B?RlNCUGlDZ0J5d241TisvbHlwakNhTVFTeEQzZU9LR2d5MkFmWGRKVjlEelZa?=
 =?utf-8?B?U3VaNkV5c1V5UURjZ05wdkQ0KzhndCtaM21zcXlwbHU3ZE0xQmErZ2ZKOFNO?=
 =?utf-8?B?RGdsdi8xaEl3am5iUUFHZ0N2YjJlbFRCdjhxVE9nWncvdmVLNmdFWGpqcmtm?=
 =?utf-8?B?UEdsaEI1cUlWYlJaWExoVVQ2TkhHMHovQXAzc0I2M2EySHhiQUprMlQvTDhN?=
 =?utf-8?B?NnNQTi9FTkZ3dzkxclFhQVVWc1lJT3hrNVBGU1FsOCtEVkJRTjVJeU9tYlJO?=
 =?utf-8?B?SmtCd0RrUGE5NVhmNXFhblFVK3ZCdWNSQTFmTDdDVndYZ285a3E5T1E1NDBp?=
 =?utf-8?B?RE9FTVh0bXk0d3R4ZDRCZng3VGJBVkxma2s5UmphUlUrMm1DcFJJUHFBL3ZM?=
 =?utf-8?B?aUs1SnZtODVCQmhsMEJONWUyYVRnNHhPMVRoOThab2wzRmd1MnMwZ0QxbVoz?=
 =?utf-8?B?Z1dneUhqY1U3RnpuZ2NXZ3gxZGFYNDhUQTRJK0I3T0dSODB1VkJIc1dPY3h2?=
 =?utf-8?B?L3ljbU9FOUFybzZ6QnpXWDQ2NVVBQVNHbHlEV3hidk0ybzhyWVlFazB0NFFp?=
 =?utf-8?B?QWlzNENwSnVTZGJGVm1kV0VTNG1QbThtbDdDUGFadFRlRk9DNWtSdmI5SUxn?=
 =?utf-8?B?SzFjdDNRTllsWWlGT1h4LzQxSjJ0Y2RDTmkvS0dnU29zZURpNDdhY1NTMFVF?=
 =?utf-8?B?bXlWdHFYL1VhbFUrNW5RRzdNKzNSYkdnM1VmTGthemdsallBQmpqRWprQzlG?=
 =?utf-8?B?NzA3enNXeEZWWjNzVU1OQ0xBWHRyNkNRbE5HK2puQ0tvNXI2UHYrb2liWFE5?=
 =?utf-8?B?K1ptQi92ZnZJOUg2MEtOQ0VvMkp1amRkT3hlcHVDOUpjMTJNM0dVYmRjZEd2?=
 =?utf-8?B?TkVkdjNXNFVZdDhabXNOUDRlbzhlNFcrUzRZMk45cjZlYldSTHNaK0dMMzM1?=
 =?utf-8?B?eWF4YlVkV0pUVFhYd1JYcVVJNFlVR3I1dlg2RTRDYmhBT3NYcVpMa1R3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFzeHI4VHRLK0d1K1dWTndvRUpkY1ZxQnNrMWwvS3JIOWRmN1JCQXpjK0Fq?=
 =?utf-8?B?ZHg0cElTR1hjcUlJb3lKNHpyRU5uMlBSa1pUWGZJVkhFWTlQbStCZGI3Nlpa?=
 =?utf-8?B?amxOMThjaUt6QUloSFd3NjZQVU5pb0Rub09KMDMycGRXajVOVzNrZGpFSUgz?=
 =?utf-8?B?VGlGR2oyUmpvTGh3OTA4czR0VkxralZ6c0ZQNExFdDExbDRsb2QyeWloS0Uw?=
 =?utf-8?B?Sm04ZTVYekpUVG8zS3dRc3QzUm9ZdXAwTm5rT0JCVElWaTBKS3V0aVd6QU4w?=
 =?utf-8?B?S09uL08wSkFEdkt1ajBMVGhFWmdHVzFsL3p0RVV3djRsUGtsc096MkwrQUlz?=
 =?utf-8?B?c1hiMmkramUvT0ZMY2tlalVONDFyVnl3bnQ0QkVDVjJMQVgyc0xybk9PdUsw?=
 =?utf-8?B?ZEkwcEp1dVBrZ1JJREFOZGttZjN6TmRFcTJTVjlCTDNMRFZ0dnVsUEhZWllJ?=
 =?utf-8?B?RTlESU1MRkc1Vm5HT2JLODZZMjFmdklOWmtab2txbG1XS2s3WitYMSttNU5C?=
 =?utf-8?B?UXpyZFlvWGgyTmFNK01vTFpFbGJ5Q1dYb3pZWStCTXd4U1Z2d0VXUUdPWjFV?=
 =?utf-8?B?d3kxT0g0WENwQjNzcVZRaFhxdzFzd1JUMXhWTzdjSWpuMDJ3VTcrK2lLNGY3?=
 =?utf-8?B?S2dpUlZzTDJ1T2dDSVlxemMvWDUxVitXdmJxM3RGUW50Y2kwbmRkMDVteFlU?=
 =?utf-8?B?bHlVT0V3RFlZaDQ4ckY5QzZVQTRYbWNSSWpqMFdhZGppZUd4akk5blFta2dV?=
 =?utf-8?B?SnFoRlZzNTFIcW9XSXM4NGlaUC9JODNQR2Q1QzJ4RFdOOS9SMjJGVWRna0hl?=
 =?utf-8?B?NXJoNGJ3T3RWMHNnNFJmZ0VnaHRkZ2ZqUUtId2wwUnhOZGxWTFFKWjZSbjZG?=
 =?utf-8?B?eG9BTWI1U0dKNWJKVGk3dzFkdlU3dWpKMXRCM1BCd1B2b291SGNoR2RvSWFR?=
 =?utf-8?B?akpGSjlOZlVzNXFXM2RHVFdqN1QyMnUwb3BHNTBraVU2SzJwTnRYYk5ZWXZS?=
 =?utf-8?B?dGd3dEFTWHphcC9PTlowRDBtSE4rc2pwS080YkZuekJJSEVNbFlyZTNUSXlk?=
 =?utf-8?B?ZVJSSk9MN2xwcTdsOWRiajBrRHkxcUcxS2owRlo3bE9Md2src2xZQW9DcVRX?=
 =?utf-8?B?TzltNEVLUUpTSnl0NVVYMlhJMUdlam9FRFlleE1hQi9uMi9jWW4xZ3VMSG1j?=
 =?utf-8?B?OWpLNjFBTFpiYmpBMDRxSkxHQlVBN2ptbDVmMWwzelBPcGZ3Z0pPMHEzZis1?=
 =?utf-8?B?eVc4bGtxdCtZaHp1YWlaSWc2YmpPcS9Ka0JNeFR6VG93R05tTmxnM3NXcTAz?=
 =?utf-8?B?TU1kdTV3bUZ3QmJFL2pCNFJjbGpNejhqNllZeW9KajdJZ2l6dTB6amhsZUlE?=
 =?utf-8?B?VlRMTEtiMWFOa1FxYlo0T0VGMXo1aG9zNU9ibGNReFI4UWltRHZ3NXdTa1NL?=
 =?utf-8?B?dFJEd2EyK0htMFNpSEdCbkpUVGN3WDRVM2cwaVBoSStITWdRZXNLaEdkUkVK?=
 =?utf-8?B?ZHp6a2ZDbjBVc2VhdzZxcUJ2MXFvVXl0dGVuNEtQUTB0NXlOQTZWRUFScXhN?=
 =?utf-8?B?NExMaWxsUURyTjN1ZHVEcFFTME1BN3pvY1lSZ2RQV3BJZGphUGtTOE9LTWZJ?=
 =?utf-8?B?ZDNYMTRTNnJmNld5N20wMjJTdU5SUlkrMzVEdWNlZU1rdHJ6K01HRWFINDFD?=
 =?utf-8?B?ckNRbnpVeERnZGJSRW9oYms3Mnl5YW9GdGF4L2x6UDNXanU3TkZNWnlhOFpN?=
 =?utf-8?B?cmdpWnRkbXZxVkRENWFzNndQZzVqdE53WS9PZEtUMitqb1Zmb0xsMXlycFpE?=
 =?utf-8?B?SGFYVkI3YlArRkYxQ2dmdUd6djE0aHVqTUJlWVdNOEM5eFArNlhSSnR6WTRh?=
 =?utf-8?B?aWdvTTNhTXliTlVWWmh5cFVHUG5mMUpkcEVMbmV0ZzVqUzd0dmhPVWZGZXYr?=
 =?utf-8?B?L1FIZWFLZlpNL2NMUzR0RXJrRTBqb21rVkRHMTNUSmdIenlHRktjM0M2QjVZ?=
 =?utf-8?B?b05xdWVQVVVNbHphT1lScEFSQlJqNkEvWG93NXZWdzJhY0V2TFJKcFJrVmRa?=
 =?utf-8?B?ZTQzYmV2ZlFtaHZPamtDMDlBc0RLV0RZRFZDS2lsK1dPZ2V6NWVYRnVxVFlC?=
 =?utf-8?Q?EEymBRLgpv/3oq/7y+4SDc1oG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a35049c-2b37-48e0-1756-08dc7622b5f0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 03:37:43.8382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOem52JxsITNjoEDjtf8NUn6kZC2O+Mj9mmKfKJZ3Wfl+1FGbZ3LezX9CxmSJbc/QDOfPteB0kiRCJaAXWDwNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8292
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

Test looks good.

Regards,
S.Amarnath

amar@amar-Artic:~/amar/drm_misc/drm-misc1$ 
./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests
[08:20:02] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:20:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=16
[08:20:11] Starting KUnit Kernel (1/1)...
[08:20:11] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:20:11] ================= ttm_device (5 subtests) ==================
[08:20:11] [PASSED] ttm_device_init_basic
[08:20:11] [PASSED] ttm_device_init_multiple
[08:20:11] [PASSED] ttm_device_fini_basic
[08:20:11] [PASSED] ttm_device_init_no_vma_man
[08:20:11] ================== ttm_device_init_pools ==================
[08:20:11] [PASSED] No DMA allocations, no DMA32 required
[08:20:11] [PASSED] DMA allocations, DMA32 required
[08:20:11] [PASSED] No DMA allocations, DMA32 required
[08:20:11] [PASSED] DMA allocations, no DMA32 required
[08:20:11] ============== [PASSED] ttm_device_init_pools ==============
[08:20:11] =================== [PASSED] ttm_device ====================
[08:20:11] ================== ttm_pool (8 subtests) ===================
[08:20:11] ================== ttm_pool_alloc_basic ===================
[08:20:11] [PASSED] One page
[08:20:11] [PASSED] More than one page
[08:20:11] [PASSED] Above the allocation limit
[08:20:11] [PASSED] One page, with coherent DMA mappings enabled
[08:20:11] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[08:20:11] ============== [PASSED] ttm_pool_alloc_basic ===============
[08:20:11] ============== ttm_pool_alloc_basic_dma_addr ==============
[08:20:11] [PASSED] One page
[08:20:11] [PASSED] More than one page
[08:20:11] [PASSED] Above the allocation limit
[08:20:11] [PASSED] One page, with coherent DMA mappings enabled
[08:20:11] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[08:20:11] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[08:20:11] [PASSED] ttm_pool_alloc_order_caching_match
[08:20:11] [PASSED] ttm_pool_alloc_caching_mismatch
[08:20:11] [PASSED] ttm_pool_alloc_order_mismatch
[08:20:11] [PASSED] ttm_pool_free_dma_alloc
[08:20:11] [PASSED] ttm_pool_free_no_dma_alloc
[08:20:11] [PASSED] ttm_pool_fini_basic
[08:20:11] ==================== [PASSED] ttm_pool =====================
[08:20:11] ================ ttm_resource (8 subtests) =================
[08:20:11] ================= ttm_resource_init_basic =================
[08:20:11] [PASSED] Init resource in TTM_PL_SYSTEM
[08:20:11] [PASSED] Init resource in TTM_PL_VRAM
[08:20:11] [PASSED] Init resource in a private placement
[08:20:11] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[08:20:11] ============= [PASSED] ttm_resource_init_basic =============
[08:20:11] [PASSED] ttm_resource_init_pinned
[08:20:11] [PASSED] ttm_resource_fini_basic
[08:20:11] [PASSED] ttm_resource_manager_init_basic
[08:20:11] [PASSED] ttm_resource_manager_usage_basic
[08:20:11] [PASSED] ttm_resource_manager_set_used_basic
[08:20:11] [PASSED] ttm_sys_man_alloc_basic
[08:20:11] [PASSED] ttm_sys_man_free_basic
[08:20:11] ================== [PASSED] ttm_resource ===================
[08:20:11] =================== ttm_tt (15 subtests) ===================
[08:20:11] ==================== ttm_tt_init_basic ====================
[08:20:11] [PASSED] Page-aligned size
[08:20:11] [PASSED] Extra pages requested
[08:20:11] ================ [PASSED] ttm_tt_init_basic ================
[08:20:11] [PASSED] ttm_tt_init_misaligned
[08:20:11] [PASSED] ttm_tt_fini_basic
[08:20:11] [PASSED] ttm_tt_fini_sg
[08:20:11] [PASSED] ttm_tt_fini_shmem
[08:20:11] [PASSED] ttm_tt_create_basic
[08:20:11] [PASSED] ttm_tt_create_invalid_bo_type
[08:20:11] [PASSED] ttm_tt_create_ttm_exists
[08:20:11] [PASSED] ttm_tt_create_failed
[08:20:11] [PASSED] ttm_tt_destroy_basic
[08:20:11] [PASSED] ttm_tt_populate_null_ttm
[08:20:11] [PASSED] ttm_tt_populate_populated_ttm
[08:20:11] [PASSED] ttm_tt_unpopulate_basic
[08:20:11] [PASSED] ttm_tt_unpopulate_empty_ttm
[08:20:11] [PASSED] ttm_tt_swapin_basic
[08:20:11] ===================== [PASSED] ttm_tt ======================
[08:20:11] =================== ttm_bo (14 subtests) ===================
[08:20:11] =========== ttm_bo_reserve_optimistic_no_ticket ===========
[08:20:11] [PASSED] Cannot be interrupted and sleeps
[08:20:11] [PASSED] Cannot be interrupted, locks straight away
[08:20:11] [PASSED] Can be interrupted, sleeps
[08:20:11] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[08:20:11] [PASSED] ttm_bo_reserve_locked_no_sleep
[08:20:11] [PASSED] ttm_bo_reserve_no_wait_ticket
[08:20:11] [PASSED] ttm_bo_reserve_double_resv
[08:20:11] [PASSED] ttm_bo_reserve_interrupted
[08:20:11] [PASSED] ttm_bo_reserve_deadlock
[08:20:11] [PASSED] ttm_bo_unreserve_basic
[08:20:11] [PASSED] ttm_bo_unreserve_pinned
[08:20:11] [PASSED] ttm_bo_unreserve_bulk
[08:20:11] [PASSED] ttm_bo_put_basic
[08:20:11] [PASSED] ttm_bo_put_shared_resv
[08:20:11] [PASSED] ttm_bo_pin_basic
[08:20:11] [PASSED] ttm_bo_pin_unpin_resource
[08:20:11] [PASSED] ttm_bo_multiple_pin_one_unpin
[08:20:11] ===================== [PASSED] ttm_bo ======================
[08:20:11] ============== ttm_bo_validate (22 subtests) ===============
[08:20:11] ============== ttm_bo_init_reserved_sys_man ===============
[08:20:11] [PASSED] Buffer object for userspace
[08:20:11] [PASSED] Kernel buffer object
[08:20:11] [PASSED] Shared buffer object
[08:20:11] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[08:20:11] ============== ttm_bo_init_reserved_mock_man ==============
[08:20:11] [PASSED] Buffer object for userspace
[08:20:11] [PASSED] Kernel buffer object
[08:20:11] [PASSED] Shared buffer object
[08:20:11] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[08:20:11] [PASSED] ttm_bo_init_reserved_resv
[08:20:11] ================== ttm_bo_validate_basic ==================
[08:20:11] [PASSED] Buffer object for userspace
[08:20:11] [PASSED] Kernel buffer object
[08:20:11] [PASSED] Shared buffer object
[08:20:11] ============== [PASSED] ttm_bo_validate_basic ==============
[08:20:11] [PASSED] ttm_bo_validate_invalid_placement
[08:20:11] ============= ttm_bo_validate_same_placement ==============
[08:20:11] [PASSED] System manager
[08:20:11] [PASSED] VRAM manager
[08:20:11] ========= [PASSED] ttm_bo_validate_same_placement ==========
[08:20:11] [PASSED] ttm_bo_validate_failed_alloc
[08:20:11] [PASSED] ttm_bo_validate_pinned
[08:20:11] [PASSED] ttm_bo_validate_busy_placement
[08:20:11] ================ ttm_bo_validate_multihop =================
[08:20:11] [PASSED] Buffer object for userspace
[08:20:11] [PASSED] Kernel buffer object
[08:20:11] [PASSED] Shared buffer object
[08:20:11] ============ [PASSED] ttm_bo_validate_multihop =============
[08:20:11] ========== ttm_bo_validate_no_placement_signaled ==========
[08:20:11] [PASSED] Buffer object in system domain, no page vector
[08:20:11] [PASSED] Buffer object in system domain with an existing page 
vector
[08:20:11] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[08:20:11] ======== ttm_bo_validate_no_placement_not_signaled ========
[08:20:11] [PASSED] Buffer object for userspace
[08:20:11] [PASSED] Kernel buffer object
[08:20:11] [PASSED] Shared buffer object
[08:20:11] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[08:20:11] [PASSED] ttm_bo_validate_move_fence_signaled
[08:20:11] ========= ttm_bo_validate_move_fence_not_signaled =========
[08:20:11] [PASSED] Waits for GPU
[08:20:11] [PASSED] Tries to lock straight away
[08:20:11] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[08:20:11] [PASSED] ttm_bo_validate_swapout
[08:20:11] [PASSED] ttm_bo_validate_happy_evict
[08:20:11] [PASSED] ttm_bo_validate_all_pinned_evict
[08:20:11] [PASSED] ttm_bo_validate_allowed_only_evict
[08:20:11] [PASSED] ttm_bo_validate_deleted_evict
[08:20:11] [PASSED] ttm_bo_validate_busy_domain_evict
[08:20:11] [PASSED] ttm_bo_validate_evict_gutting
[08:20:11] [PASSED] ttm_bo_validate_recrusive_evict
[08:20:11] ================= [PASSED] ttm_bo_validate =================
[08:20:11] ============================================================
[08:20:11] Testing complete. Ran 102 tests: passed: 102
[08:20:11] Elapsed time: 9.732s total, 0.927s configuring, 8.085s 
building, 0.559s running

On 5/15/2024 4:54 PM, Karolina Stolarek wrote:
> Introduce tests for ttm_bo_validate()/ttm_bo_init_validate() that exercise
> simple BO placement as well as eviction (including the case where the evict
> domain also requires eviction to fit the incoming buffer). Prepare KUnit
> helpers to handle such scenarios and add a mock VRAM manager. This series also
> includes some updates to the helpers and more definitions used to define
> "special" memory domains (e.g., one that can't allocate resources or is busy),
> as well as drive-by fixes for the tests.
>
> There are a couple of areas in which this test suite can be improved.
> Suggestions for future work can be found in the TODO file.
>
> Use kunit_tool script to manually run all the tests:
>
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests
>
> To build a kernel with TTM KUnit tests, use a UML configuration,
> enable CONFIG_KUNIT, and then select CONFIG_DRM_TTM_KUNIT_TEST.
>
> Many thanks,
> Karolina
>
> v12:
>    - Rewrite "drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk" patch to
>      extend ttm_bo_kunit_init() helper to accept a dma_resv object and update
>      calls to that helper (Christian)
>    - Update drm_buddy_free_list() calls with an extra argument
>
> v11:
>    - Delete CONFIG_DRM_KUNIT_TEST_HELPERS from .kunitconfig file, as it gets
>      automatically selected when TTM KUnit tests are enabled
>    - Call ttm_bo_put() in ttm_bo_validate_pinned() test case (Matt)
>    - Fix a copy-paste mistake in ttm_mem_type_cases definition (Matt)
>    - Update mock_move definition to do a hop on VRAM -> sysmem move and
>      delete a dummy multihop domain. Fix the eviction tests accordingly (Matt)
>    - Update ttm_bo_validate_swapout() to use TT domain instead of VRAM
>    - Update eviction test cases to create TT domain, so they can perform multihop
>    - Update TODO file, as it got outdated already
>
> v10:
>    Many things have happened over the course of three months, so the series
>    had to be slightly reworked and expanded to accommodate these changes:
>     - Set DMA coherent mapping mask in the KUnit device so ttm_pool_alloc
>       tests can be executed
>     - Update ttm_bo_validate_invalid_placement() test case to check against
>       the right return error. It's no longer -EINVAL (which only is returned
>       for pinned buffers), but -ENOMEM. The behaviour has changed in
>       commit cc941c70df39 ("drm/ttm: improve idle/busy handling v5")
>     - Rework ttm_placement_kunit_init() to accept only one array of places
>       and update the tests that use that helper
>     - Set fallback flags in eviction domains defined in TTM KUnit helpers
>     - Fix a warning raised by ttm_bo_unreserve_bulk() test case
>     - Scrap all r-bs and tested-by, as many things were updated and should
>       be checked again
>
> Karolina Stolarek (10):
>    drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk
>    drm/ttm/tests: Delete unnecessary config option
>    drm/ttm/tests: Set DMA mask in KUnit device
>    drm/ttm/tests: Use an init function from the helpers lib
>    drm/ttm/tests: Test simple BO creation and validation
>    drm/ttm/tests: Add tests with mock resource managers
>    drm/ttm/tests: Add test cases dependent on fence signaling
>    drm/ttm/tests: Add eviction testing
>    drm/ttm/tests: Add tests for ttm_tt_populate
>    drm/ttm/tests: Add TODO file
>
>   drivers/gpu/drm/Kconfig                       |    1 +
>   drivers/gpu/drm/ttm/tests/.kunitconfig        |    2 +-
>   drivers/gpu/drm/ttm/tests/Makefile            |    2 +
>   drivers/gpu/drm/ttm/tests/TODO                |   25 +
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |   40 +-
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 1225 +++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  178 ++-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   13 +-
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |  235 ++++
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |   33 +
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |    4 +-
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c |    2 +-
>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       |  154 ++-
>   drivers/gpu/drm/ttm/ttm_tt.c                  |    3 +
>   14 files changed, 1862 insertions(+), 55 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/TODO
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>
