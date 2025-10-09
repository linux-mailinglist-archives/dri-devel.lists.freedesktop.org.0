Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F9EBCAD23
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 22:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4465110EB16;
	Thu,  9 Oct 2025 20:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NneJnwWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FCD10EB0F;
 Thu,  9 Oct 2025 20:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2b+bWouZHZtdhSKphb0SshJaIGGig9RXlJxUaDMbzxXYqanQ5Xy7XmDFvh06o39AYDhxEOzH+x5UxOON1243f2fGTnVdzBzpAOKrnYj2veKnrn0HkyvLfOdP1L4WMgkwhqfq9IkEDbiYUjM+Fs5fJkEXKL9vrJ6kc3zXqNFheZ+MQAIOntBOF/3XsmtqdWVo6SEWpVX11WCjzOZqXMyRZKxaMBnJdv1tjK1MYMJFeFqKutWNZPQAskuZ32hKq9NmNGZoRLB5Kdw6/CIjxapN3MGCLmElO2WktqAVHMxE5Ip8VN3wt/5zUKwJE+1FDsI7WyQy1F0beUJr2gbjhnQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DS2AIEpBCEUDvJ7kSLW295+0ZETXLynzaBqGnd8ZeJY=;
 b=D5ajOufl8KP/Ny5MK3M4mwwgRNxC9pYZxZpihv4D6RTfSYtjsEBQiaihWxxzj2GqyE+bPMq+AU/fHkNRPCCx/myWp/N9ZClFMiNBT5SPnKnxiQ1C52PQnMU8i5SjtxEwMpHdIrhokuoPQykaguPaBuG3Avp/U2kkzOg7W3Ri2UL0FxcoXB/OQVrzXdRCAUATJSAJJgWujv4HF7vGi7Q9zVCXnnj64oe10VzIVRgXOOh5TS9R3VkRoapmgG1nzVZWfNPs5Nt8Tfdo6tV5B1KT9fRkVuSmE17Zw39lYrZKw2VzYF+3JnMXnTkFtKsycCARKjesbqT2JoZAU85VrS9DfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DS2AIEpBCEUDvJ7kSLW295+0ZETXLynzaBqGnd8ZeJY=;
 b=NneJnwWodAt2ec50Sgr40PnPZgxl8b4J8kQuZAJW1sZMWJbum3+nQFzdEEyDGcG/+k0Q4XCCjJLM6KscIqrh0kmHN6gYyat/1DfXvPXt+81zTOoovEzZ5YVOL+8AOZJi9QFTHtveSkxECFuXUOQTD830ZONiDE0ZFVhGjPp+4jI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 20:40:51 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 20:40:51 +0000
Message-ID: <15d5b9dc-8452-411c-9957-ba759d307223@amd.com>
Date: Thu, 9 Oct 2025 16:40:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Permit DC_FP_START/END only in non-FP
 compilation units
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251009150621.3886079-2-ardb+git@google.com>
 <bbc089aa-934d-4dd3-825a-53f8e98dfd3f@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <bbc089aa-934d-4dd3-825a-53f8e98dfd3f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:208:52d::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 489f3e47-984c-4de6-2cf4-08de07742284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDRvaDR4Q1grelN4K1dEcVE0MVBHV2c2emlZKzRhUWxUQWtBWXpmcHpTR2RZ?=
 =?utf-8?B?UWtHUGFSSHVhaGtlREU2T2dVcGlHWnFZRmI5WUg1QnE0RzZmMDBaWWVNWTFX?=
 =?utf-8?B?Q3J5T0pVc0t1bTlMUFpXUWo3ZmFSMWRNKzNiQUJGTHZLYUV0OXh6ZjhRWE5K?=
 =?utf-8?B?cVdiZnZWRGRKQ0tXclNycW9JREh5N3hMQ2NEbEV4L1FqQW9KWmpjTTU5c0lY?=
 =?utf-8?B?Q1RDN3IvbXBicG1yVGJ3SldyK0wxVFZFQTlUK3hsZEdHSzVhdHYzbk42bUZI?=
 =?utf-8?B?dnQvNE4wQVJpRXNtQnpOZDlXTTNyNlJxSkFIS2NFQ0taT2puUmFQYjNObGFT?=
 =?utf-8?B?elkvTXJQODdOWGluekdNRUJiZjVxRWhvSk9yTWVkck1GWDJUZ01LUEJCY2NQ?=
 =?utf-8?B?QllvSFlHaEVUeHQyNXZPbkpBbmdrbVFJUldCYzRteGRQMjFWUkM4eE9wY0Nq?=
 =?utf-8?B?V0ZzcXZOeVFqSHJoaXZGdlZjMTdhUmhtaHMzZExOSXpZYzZCSkE4dnN1bEMx?=
 =?utf-8?B?ZHNsMG12ZmhYVFRUWXpYZ0orQ1BMNWswUzA3OVZLajI1cTZXZEt5WjNyVDJK?=
 =?utf-8?B?Smw1aFJWYTAzKzRmWnpCMzg3aXA2eHFsZXFtZDBYS0Z4Rk5qSE1mSHZ2RUJE?=
 =?utf-8?B?Y1lBQkVNNGRsajZxK0k0K1NFUk9oVFNLVk9TV0xDNnB5bGgvVDNaUnAwdzFW?=
 =?utf-8?B?cm5ZNlQ4dEdyYXI1WDlSU24yZDZFSStxRFZaMUgyaFk3MklURDZBQTEybjQr?=
 =?utf-8?B?MEJIT0hZaWlHSmNYZkQwREJFL3E2V1RISVdGZk0zbEYwUm50bFRmL2F0MU52?=
 =?utf-8?B?TktDc2ZrQ2ZNWEFIR1ViM0c5VzlCVXovM0prK1ZjSDQwaVVJcDdFSW1ITDdY?=
 =?utf-8?B?bThiZEd5RDlsVktFd3FmU2lSSHBDVnNjZXl5NmxBcG1RVWhZdXBlZ28rS01Y?=
 =?utf-8?B?b1F1K1Q0QThNbU9VVWZFc0IvcjZ3RmpBUXNua3JtaHU0UW1BVXlEVVpGNDQx?=
 =?utf-8?B?VWd6ckp2UGtyd1BiZjJBdDNSanpac0l6QzZseU5WMmVSVzdXbDNSbFFQUmJU?=
 =?utf-8?B?a1o1YlZhWERrODhyK2x4VDVKRzRZOTNvWXRWYUVsUk5GRmNnOVg1U2N5eXBS?=
 =?utf-8?B?RUkvTHZVeDcxM2ROdHd6cXBiWngvSXZrMEwxZXd0a0U1amN3dHk4aWlBM3BE?=
 =?utf-8?B?emdFLzZZaG5xcHZwQUtwLzBpVkVlVUhWUkdXSkR4bzBKY0EzNkllUVJUKzdD?=
 =?utf-8?B?TCtleGlxWHRwLy80Y29kU0RWNHdacXltUzNSMTRNbUpMdll5RVdwRkZhVlNJ?=
 =?utf-8?B?YStFUHJlM0NsOUttODFjUXVVZ2VYSkcyNzM3TTZSanZORW9wK1NWdXdhZ3JE?=
 =?utf-8?B?OFNRVEJ0b1dvMmwzUXI2cE9mQm9GcVVsaGI0SVp2L3NtU1o0RjMxczdRQzA0?=
 =?utf-8?B?NU1sU0hhc25NVTNCa01ZZGJONk5YazliYTdWQkc1SS9oMWFvOGcwdFpXOUxl?=
 =?utf-8?B?OS9KcmxLeUIwSEl0Y3d0VDk4OFU5K24zSm9qY0JRY2JySzUxdEl3QWQ1K1N4?=
 =?utf-8?B?TWVQSHg5ank1QW9kMXdwaDhVUDFvbkhUUnRYVEhxb2g4K0o2RGhteTFmeFQx?=
 =?utf-8?B?UGM4TWQrZEtHL0tIcEdqSGtWK0hYY0pjWjZ6WW51UlJxY1U0L0dORGV5QUNK?=
 =?utf-8?B?Q2FaSE9ranlMM0ZFdlJCVFVBcmw1N0R4V0lzZlNFcmZrY2NvVlIrOFZhRGRS?=
 =?utf-8?B?Y01wUVZGMktCSHp5bU8wK08xY3lzMkdCUFMvcVB0Q3JWUm9SRFlVMWwxWXFG?=
 =?utf-8?B?MWRGOFVsWlRWelEwd3k3VGNoSFZXcUhoU1ducnJkeVdab1JNbUxmb0x1bTB3?=
 =?utf-8?B?K052SXhGZU5DWGtkN05FRmU4Q3ZBcmJUS041VFVSdFR5ckh2YW16SDNzc2pB?=
 =?utf-8?Q?VbpR+T9ncj5SCGJMC7R2z/zrsOHbuE4m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NueDQ2Wm84bkpyc2d0QUpmZEJYNkxocm1vZG4ySkhoTU5CdWJCTjEvSEpv?=
 =?utf-8?B?dzc4bXd2bzZhRUxOeGt6OW1jZC9MZXZ1ZnJGYSs1Ujhtd1ZDSDl3YWR4d3F3?=
 =?utf-8?B?cFJoSDFyZzd3clhkeTNOdnhtNkJrck1zcVJzVi9mLzU5MWRHUlQxSGpKWDJp?=
 =?utf-8?B?b0VEYmJITXlqRUR0RmRVTGdISFlQQzJWZHJOYkh2Z0UwUWxuTXhRcVB5K3Fw?=
 =?utf-8?B?bDFXQ3RyMTF4U2pXbTBubkwzL05tTnR6QTFvRXVJbkw5c3R4amd2RjdGWEZ0?=
 =?utf-8?B?TmdEWUsvVm5SMGJabWRKdUsxRjBBd1ZOQmM0bUord1ZPVGdrUk9hdnYwajg1?=
 =?utf-8?B?S3VMVUwvSU82elQ4YnJ2N05ESjBaWFVwN1dzWlVMNTNkMFFmUEFKbEI5aWxD?=
 =?utf-8?B?ZnhtUVVaNDFxVXg5MUI2cHl0V1JDMTdweW9KdUFkblZNMjQ1emJTQnVVb0cw?=
 =?utf-8?B?aWtybjlrcUIyMmIzRU9FOGdZT0ZCVHZkN0w3UGpoSVg0MFhPRktIdCtpUCsv?=
 =?utf-8?B?T2tPSWhIVnFxNUdtdzAyd1d2MEdKNWR3MlVwRCtIdDlCa1dIUVVpQzAwcUdZ?=
 =?utf-8?B?YWJlSW5Lc0kzZHNoN3JtR1Q5a1pOM2t2cGdnM3M5VlZNYlg4Y2QyK0tsT3Ji?=
 =?utf-8?B?NTNVN1JBNFJWN2J0SzRjVVdGV3R4U0NVL2x0NVZLOHU4OXpLOU8zaHIyYlhl?=
 =?utf-8?B?ZHZDVU1JUjUyRzl3WktGMnl3MlluMzVzb2diYVdIOC9NL2xMbWtsa0hWZml4?=
 =?utf-8?B?bUZuMjJ4bWdiVGxSeGthazFlUWdHQ0wvSDJBREowK2NmTW5VNEg1Zk9kKy9X?=
 =?utf-8?B?WUVuaHJuUy9hQW9aTmFUaDVhMFFCQ21YVXNheTZOSVU4MzZkQ3FUeGFrRFFv?=
 =?utf-8?B?dlFKb0RNME5DV1VISVVSUkkvRXVCc1NkMlJQRG5udzI1di95MzVVRmNBSDhB?=
 =?utf-8?B?OTlKN0IxTGMzQW9MRmhRL1h3Q3hOKzVNQTRwU2dNY3I2MWFWeHB1WjV1Rmxq?=
 =?utf-8?B?VnRWR0prWEVaUFNNdzhPWnNEcm5Ob3RtQ2E3NEkxcWxoby9QaUl4alFCMWtY?=
 =?utf-8?B?MkVQb1d0YTM3a1ZwNUZ1NzN4NjJZMlJmOWh6MUhMVnJ2cUNOMXFRcVd2Zm43?=
 =?utf-8?B?bXFMTkI5NjV1Mm15K2xEejlwV2w1SVJCQzBsMTBKT1g2V2RIZ2wvZkFnbldP?=
 =?utf-8?B?VjZENzVaZGVBOG9ncFh3WGN2dDZ4UkF5M1JHRzdQa1ZpT2gwaVhpSzM0Nm54?=
 =?utf-8?B?bEpjaXZxODZ6RmtLZUZGMXpFYU9mOVcrTGV5YWtaV29xWktKVG9YYWVkMkJ3?=
 =?utf-8?B?QnRCczVrZWVFNTdlb0dsZHRDbmpkRk5UQVRKN0I5QXpvNTRLSnZpcmJ2eWlt?=
 =?utf-8?B?QWJjZGRINXlqenRLOVFBeHdWTmNpU0FNdEFNU01NdUx4bkxuUnN1SGhUL2pt?=
 =?utf-8?B?bFlVamVteDUvRWpVM1Y5MVhYalNObUY2T0ZqSHFYSys3amhYN1ZjSVZIRlp1?=
 =?utf-8?B?QlJwazdUVkNnMEZocjlvMWRQdDBvSlRaYVdta20wNm1RQ1VsUGtMQzN6MWlN?=
 =?utf-8?B?UXo2bWE0cjM2MDFRQzRqcFI5Ly9lVXBHb1dKUDYxNnlxWXpRRmtBMEw0RWZq?=
 =?utf-8?B?bkZ1WFF5VTNGWmljS1ozVDZBOGVid0xyL3ZTeUcvNzR5ZEZqNWN0SVNVT0Z2?=
 =?utf-8?B?QnA2TXkrR1FYamU1KzllMGZIK0JlR0lETVJ0Y2J0UTlSUFlFeUkvemV6MEhZ?=
 =?utf-8?B?WnJzSXdqVDRSNDdTNXQ5eFMrbEI1a2RJR2lCM21FejA1RzJNOC8zNWZSUVZy?=
 =?utf-8?B?Tm5GSjYxL3d2VzdidUhWVTczUmJsSGRlbTNqand3Tk5SKzRWVFUyN2NqSVo1?=
 =?utf-8?B?Znplc3RnTWs0aHdscitGalJUbTFObXo5L2FBaGl6cVIxRGllS1NqaSs1c29X?=
 =?utf-8?B?Z0lDeTlxYVk2SXBIMUUwRGdoZWxxNVVQOXBRclQyNjR1QitleEZpaXJkeFRE?=
 =?utf-8?B?dWZ5Rmk5WWhrbUM0MkJUYnBFVGI5cENISlJDSGpIOHNDbjRYelc3RXEra3B3?=
 =?utf-8?B?VlhzMUFlVDl5dGhEY1JwTHhHdWVBR1BDYUZBK1NtU2ZPbmpPZURPRVdWRVZD?=
 =?utf-8?Q?zofaQYbGJgnnnbAhSCIEhnC8L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489f3e47-984c-4de6-2cf4-08de07742284
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 20:40:51.2580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFUaPfsJ2ZrRL8za0lTAyme1SaAvW4UXFb1cbxfF7k2G2LQURqdte6MzuNpQ8pbXuY1d0zph6arXwFFQrcAyuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127
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



On 2025-10-09 12:19, Christian König wrote:
> On 09.10.25 17:06, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Test the existing CPP macro _LINUX_FPU_COMPILATION_UNIT, which is set
>> when building source files that are permitted to use floating point,
>> in the implementation of DC_FP_START/END so that those are only usable
>> in non-FP code. This is a requirement of the generic kernel mode FPU
>> API, as some architectures (i.e., arm64) cannot safely enable FP codegen
>> in arbitrary code.
> 
> If I'm not completely mistaken that is actually an issue on basically all architectures, at least x86 is affected as well if I'm not completely mistaken.
> 
>> Cc: Austin Zheng <austin.zheng@amd.com>
>> Cc: Jun Lei <jun.lei@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Leo Li <sunpeng.li@amd.com>
>> Cc: Rodrigo Siqueira <siqueira@igalia.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> 
> Anyway, patch looks sane to me but I'm not so deep in the DC code to fully judge.
> 
> Fell free to add Acked-by: Christian König <christian.koenig@amd.com>, but Harry and Leo need to take a look.
> 

Thanks. Good safe-guard. Flags a bunch of issues in the
current code. Let me fix them before merging it.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Thanks,
> Christian.
> 
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h | 8 ++++++++
>>  drivers/gpu/drm/amd/display/dc/os_types.h      | 2 --
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
>> index b8275b397920..4e921632bc4e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
>> @@ -31,4 +31,12 @@ void dc_assert_fp_enabled(void);
>>  void dc_fpu_begin(const char *function_name, const int line);
>>  void dc_fpu_end(const char *function_name, const int line);
>>  
>> +#ifndef _LINUX_FPU_COMPILATION_UNIT
>> +#define DC_FP_START()	dc_fpu_begin(__func__, __LINE__)
>> +#define DC_FP_END()	dc_fpu_end(__func__, __LINE__)
>> +#else
>> +#define DC_FP_START()	BUILD_BUG()
>> +#define DC_FP_END()	BUILD_BUG()
>> +#endif
>> +
>>  #endif /* __DC_FPU_H__ */
>> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
>> index 782316348941..6af831710489 100644
>> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
>> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
>> @@ -55,8 +55,6 @@
>>  
>>  #if defined(CONFIG_DRM_AMD_DC_FP)
>>  #include "amdgpu_dm/dc_fpu.h"
>> -#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
>> -#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
>>  #endif /* CONFIG_DRM_AMD_DC_FP */
>>  
>>  /*
> 

