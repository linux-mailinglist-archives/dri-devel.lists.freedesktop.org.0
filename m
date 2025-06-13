Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D88AD94BD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181E010EA37;
	Fri, 13 Jun 2025 18:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vkMFy3qG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AFD10E9CA;
 Fri, 13 Jun 2025 18:48:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olTRTL7ZRykPWqaA0DmQDWgf2ufLRGmHLXcW6pxnplzaiTCwUJQVqhbzdnHaE4nd5rc/dJaHbljQLuQFvs1mT24sE+gYVGYHke9NCzwhl20X8TOU6YzGqZ/GSPvFsTv2vpiWd6K+X4sSVlhs+qq6ZvcCOI2vgFimz3/HX5gxANo1o0cUDHAE6fXlUNc3gT5+PnDGfvhXLryICMRUAaC6b0LGyv2FMqr7hGvYGtILYLtFBcDOOAXU3qcIEmbwvdqwGsx1chpka9ee6ZB1QZMUBCSyQ8aFFFXmobzJB3JOQW0+ZjQKVEoXYTRyQ78nw0Nmq+rzZNXHrfTj7GsE8KdSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6kuaCOzIcSE2ovchyPMHs1DPPwvIJA7pWJS7pViX9s=;
 b=mUae+dF2kvnMbpCMgH3dOfDTlcp7u/go5TUphB9C4dN03SclBSXfnA2o/tyXUoh0UXfxrGxIsnbOy1KEZap3wb4P6xnvy9PCVEEGmew6iSzRFD/bRaWyQxXq7RDRyXbjfABbl3BkFb4B00OD6gNl3FwSbySWwWfw2joQyRBJR2BdcPcYLgqafZYx2X6y0pJvc5IFNscH5xU9Bo+PNWCy3sTq2Z4O/HNmfYMoMahO6eyOGirsTE83nwLmqEK1txLk6cyuKNHIHNBu0HhJ/11jOfoEwPH4cjLbArDp6iXVWSV0HHgO5VBU+73a0+Nh4fxyzkhblFp3zAhDq4OoD54S7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6kuaCOzIcSE2ovchyPMHs1DPPwvIJA7pWJS7pViX9s=;
 b=vkMFy3qG3K9dNGbbjh9llEk374t2R3QwnGLkH55t/evZpMK9CvsTqxa2zAdVVtDGu8SvCIp/Yrz3zTpPB8Q0CwAuH/6yHRb8l7ttrKjRm0UYRXe4GSfM1UMPxAcOWJlfKhJc08L2Y6Z55KIG5fPPZgk7Tnis51mdR+LllwYfIj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 18:48:07 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:48:07 +0000
Message-ID: <2b05cc7d-c2bd-442a-87dd-d1f0abc11629@amd.com>
Date: Fri, 13 Jun 2025 13:48:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] drm/amd/display: add a mid-layer file to handle
 EDID in DC
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-11-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613150015.245917-11-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: e68ad83c-7696-4d4d-762c-08ddaaaad604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmhsQit6K0lqU0dYWndacjhBVnN5Nk4rQVBGdUQrQlcxNUgzTmkrK3d4QUFr?=
 =?utf-8?B?djluaTRITFpWNWVhVmROY0lWYWNMdDdLSks3YjErK0N2Y1BQRzZXWWg1SVh1?=
 =?utf-8?B?SGtGMU9raFc4YUVFL3M2WVpmVlhvNDR4a252d2ZUenJVSjF0c0VVUmhyQ3Ix?=
 =?utf-8?B?TU5FQWtUMGlRbm14cU9tSFl5QUlHNlQ1YlpLNWFxOGhMRlNWM0RjUHFZVCti?=
 =?utf-8?B?b1dINTFyUGdmc1laUkNFMFIrc0ZQWWJ0UzBRMGxkS1FjNG9pNEZTRTdLMmNO?=
 =?utf-8?B?Zk9hUkNlekhuTjNGOVExZFNMaXB5ZXRLMkY4b01QVTBWUDhQMjVPdStNWkJy?=
 =?utf-8?B?aUJNOEhxS0ZsOWp2VDJCYmpobDVVSkRKaVBLMVhmc296TXRaNC9RbGZ2Wllo?=
 =?utf-8?B?cmRFMytXcmtHQ2dveVZweGRBN0t0dXF4SXErQ3AyT2hxaElQaUQrUktQSjJu?=
 =?utf-8?B?Tk1pR1FPZWVRSS93akpsb3RCWFlNUiszS1YvZ3dHcjU5Z0k3V2RDR3h6bWpX?=
 =?utf-8?B?M2RIdG1DRmRNK0Jqa3pOWDQ5Ky83c1RnV1RwUkJnMXdmNnNWay9zWjFEZGdw?=
 =?utf-8?B?ak5yWFV3dDQ1cnBEQVdjS3dqS01VL1FHdjljYXM4eEJFQU5zblg1Vk95MjNu?=
 =?utf-8?B?ZWJ2V0FoY05PR1llbkQyb1lRMHV6K2VOS004cHN3OGxmSXE0VWxMcnFtQTBU?=
 =?utf-8?B?eENRL2VMQ2dkODA0emUvRE10eUR3Vkg2YTIzTG1ScFQ2K1VTQ1hPRXBKWGor?=
 =?utf-8?B?NWppckdYMmxFUlpCbHo4cFd2YU5DKzd3R2pFUVhJZnNIYnJyck9nSmdaZWVj?=
 =?utf-8?B?c0N1WTVEbG43SUc1NHRxaU0zMnZBekdreGJxQmJzQWxwbWFSZk1OYkhxSTRp?=
 =?utf-8?B?RG05TXFTSGJPOG52NUsvajQyWXRobmlVK3JkQXlJZjdmaHcyVElKVU9DbmJw?=
 =?utf-8?B?N2hGZmc5cEY1QkRjNEFRTkNkMFJNNE5raDN6bVVRSUdSc0drdXFYMkdoRkJF?=
 =?utf-8?B?cEl5RmZsUjQxTUF6MWMwMnlPOGNMT1VPYXNYeXVMdHMxa3lEZU9sdk41cFhH?=
 =?utf-8?B?Yk9ubTg1cmM0RVRmMWJOUCtjTHJ2YmZ2MjNkNUVOL2tsbmQwSWtPeWNiR2Ru?=
 =?utf-8?B?aHkycHpySDBlRHhYRXZVcWxRQzRiVjcyRm1wV010S3laWW12SDZKZXZ6elk3?=
 =?utf-8?B?UEFwOXk2L3RPTlNmVXVMNC9LajhtUWxhYnllK3N5d1dCVTFlOHJUR05VOUMy?=
 =?utf-8?B?SXZlOE1jVVZTMEIyUGVuUnJIOUZWWkNRNTFlNy81NGpLeCt4M0IvZHRkaXgy?=
 =?utf-8?B?N3dLQjVhTmRIWlAxS0VnQitjNGdyaUVWZm5YaUIrK0VVUlFEMEwrakxGVlBK?=
 =?utf-8?B?YmN2N1p6eTJnU2hDMG5ZZWhmaWFTeFgyZEV1S1FjWFNCV3RrZlJhMDVuUVJ6?=
 =?utf-8?B?TE4rV0tjNHYxOUJqQnZtR1J2Z0M5K2NUb0JnYVpHTFVCNVlTNkNvc2JLYWho?=
 =?utf-8?B?MGoxM0wxMmQ0NVlwWmRBeE5xK2FUaHJ1M05XWHRvTDFHbk11UUJWWlN0bGJq?=
 =?utf-8?B?NE0zcDR3Z2s0a0xKM2RCdFB1TkxxdnpYQ2paaTlJZVBrWDJ5MXk4SVdBZGUy?=
 =?utf-8?B?RkdWakV6Q2tMaTRNMmFlam9IRFlCbVdWRGFmZmRIL1FoNFNzMmRXR05WY0to?=
 =?utf-8?B?UDZwS0lFMUVkdWcvTTRuMkVOZkxwVUhMOFpNQU44ZXJYOWVJcTYzZEdLS1Fx?=
 =?utf-8?B?RDRKbXBlaGhJc2JpSmVpUWd5REd4bk9ZcEtNR09UV3QyK29lQ2RjWmhmZzNP?=
 =?utf-8?B?TGVCczlXWFoxaG91OERBZm5vNFhQUUpER2F6UzZkanZpQVllVi9VY0R0T0cz?=
 =?utf-8?B?bW4zS0dPVGNRbUI1VDF5cVJBQ0tyV29KZmt4L1RNdjhMUlprNU9kZDBHOFNa?=
 =?utf-8?Q?idTaRjFTfgQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGRSMUtEWnByaWF6dzFUcENxemg0WG9DTURFWkl2bTZrT0hKaS9hdmw3NjRG?=
 =?utf-8?B?UmNvbmlmSjdvaW5VTnVhcnFVQVVnaWx3Tlcrd0JnRFFjakQ4djB2YXhoMGNs?=
 =?utf-8?B?Y0hvMWU1YWZzSUloZ2M2dnU3SUF1Q1lrWE1sTkN4M0gwSXEzY3Q1MS9FL1BW?=
 =?utf-8?B?WDVBOUFnOEkvV2RIcFpGT0VVeDJHQXFYNjJLQUR6SUI3b1I5VFhpQk1VMXRr?=
 =?utf-8?B?UHl6dWJza2lHTElRNXJoU0hGQnY4UHhQdnd6RHh4bWpXZStIN3AyVkNBdUYz?=
 =?utf-8?B?akV4bi92cDIwOHlYNFdHQ3B0dGhuVXVGNXNBdE83Z0tycFhVeFpCb0pNZjl4?=
 =?utf-8?B?SDZ6UkRTTHRhcUR2OU1VZEZzTU9rbGNYRyt2aGd5UWtNaVJaalJ0WGhvMHpU?=
 =?utf-8?B?Q2ljck5oaEE5QW5oZVdEdDdlRVI5NjBsdStOcWdTRExHbGpQa001bm5yclBE?=
 =?utf-8?B?aEtVTUR0MmM1RzdGTkRYKzdxRUQwSnMwdGpZWDdocStlZnNkbXAvNnJOS1lS?=
 =?utf-8?B?OFdMZUhnZE1RWGhtZnFYdTdPYmpFRnZhY2hidkVBcGFmMTI0WXA0TWl5MWsy?=
 =?utf-8?B?elhxNk5NdjRMZHljdHdJd1FKYlBWWGhpOXFqc2V0RHE4eW94RGV2cVNFNVFk?=
 =?utf-8?B?UDVDZHNWeHRneHhWbmhGbDdaY1lEWWFneWhwRS9kYVZmSEJrbm43ZmM0UHIz?=
 =?utf-8?B?K3NVQUJBQWdwZURKZC9sZlFBczBRL2o4bFhwL3lHNlVVY1hiTEpaQVNpMmVz?=
 =?utf-8?B?Z09MZ0FEVncvcW9GMW0wVEhDY3puanlzd3U0Z1RMcC9sbkVZN2VtcDRyVGJT?=
 =?utf-8?B?cVlHR0dSUVllbkZoTXByS1BpblJweTk1L1dNRHVMYnhmbm1XTi96MHprOTFN?=
 =?utf-8?B?a0xLeXN2T1lMUnVQTXJMSitWWjJwMFNaNm1vdnRSK1lzUDI0MXlpVHIzZUxB?=
 =?utf-8?B?QW9nTytQK0xNTVo1aVpFSU5LNFQ4N1lZR2NRL01TUlVWNm93WlFnYkQxc0tH?=
 =?utf-8?B?TitVdGJlV2gyQUdKYW9BR09BZlVsMTV3UmsvRFVCcnBtT0NOSTJKTmNobit6?=
 =?utf-8?B?Nm5BdFg5RVVxSmRYYlFYNFVWd0R6RkptaFhsSXI4RzBmOWE2aXlBc2xuZnRN?=
 =?utf-8?B?N2lTUWpiNVgyUGtPRStxNVZiOGozN01vcWNvZklHWGgrYTJYaS9taWxBRjRM?=
 =?utf-8?B?VmNITGl3eDJ6ZmdaYWtmbEFqdHFpZGswVjNXZm16MHJrbjlRSEp1UmdvRXVL?=
 =?utf-8?B?Zlplbmg4OGRNK3NrdGpnaTNMN3N0YURZdm82WVhhNklkbUJkMm5BbkdhRURU?=
 =?utf-8?B?UHlMTkxHai9PNzhjWDlhQmFIdkttZ3NBNzNDRnZ0T0JVcThEYzBBMUVIQnVU?=
 =?utf-8?B?N0k4d3locnF6Q04vUHVHc3l4VGE5enVMNHdaL1RYSmZhV0JHaFJvU0hxcEJZ?=
 =?utf-8?B?cXVZMG5tdzVFcnFZNjJNajBPS2xBZ0dpSG1xUFBNR3JRZEJzY1pvUHZ3YWQr?=
 =?utf-8?B?Q1BJSVk2UXFqK2t6VUMwM3ZxYU1ScngwV2txVmdraGdPSXJtR1VCK2lpdSth?=
 =?utf-8?B?VmtRN2pNWXpxdk4vTXE5T2piemFkUzdFekd5ZXJUTE5yaUZYaU5UcWdEQ3RI?=
 =?utf-8?B?TGpwTHdYTEJqaU9wbm9WT09BYnpZeks5dUVuRStPMzE3aUhXYmYwT20yYU9s?=
 =?utf-8?B?aGVscGlsTUFqL1R2NGdXNnZEN1ZPVm90Z0xGU2ZtOW5wUUpkbUNGTldwbEhm?=
 =?utf-8?B?cEpQTjQzSTFTNTJxUDZwQ0luM20yU2QwR252OTYrNDlzMHluSU1Kb1Q1TFNh?=
 =?utf-8?B?a3RNY3lCb2pEeDUwMGk3RmEyZXJBRHQyZ202bDZaa0hUODlZbjFpczRrSTR0?=
 =?utf-8?B?WnA3Mk5BQXk5K3BGbGNCb3dQZmlEcmlkMXdFWXBZdWNTRFVsU0lJQWs2UzVC?=
 =?utf-8?B?KzBlRTh0WXpUWnNDSHBWd2RnTXZ2dnpsaEpkSHBsSGhnOCtyOW05NmpkcWsx?=
 =?utf-8?B?cWpJTEtjRVJkcitSWGVqQ3hCb1YvR0hKdGpHV0h4NDlrL2tuRW0zRUNzeWhR?=
 =?utf-8?B?dkFpWVJIMWo2Z3JzbzBmUU53aXJsR1BYWHhKNER1ODdyQ0g2ZmsxUlg5QmRU?=
 =?utf-8?Q?Zsi8aRepD0eHE8XRZlSUQXVKl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68ad83c-7696-4d4d-762c-08ddaaaad604
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:48:07.0531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4bl4TQ71aFXJS9vclxdejRHjLzlSpvs+2D5q93W+sODHfNMmgAm3KUkX3587A0wbMMM76VCl5oOh0Mp3K+pnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064
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

On 6/13/2025 9:58 AM, Melissa Wen wrote:
> From: Rodrigo Siqueira <siqueira@igalia.com>
> 
> Since DC is a shared code, this commit introduces a new file to work as
> a mid-layer in DC for the edid manipulation.
> 
> v3:
> - rebase on top of asdn
Can you put changelog below cutlist (---)?
> 
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> Co-developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  1 +
>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   | 19 +++++++++++++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   | 11 +++++++++++
>   .../drm/amd/display/dc/link/link_detection.c  | 17 +++--------------
>   4 files changed, 34 insertions(+), 14 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> index 7329b8cc2576..09cb94d8e0e4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> @@ -39,6 +39,7 @@ AMDGPUDM = \
>   	amdgpu_dm_psr.o \
>   	amdgpu_dm_replay.o \
>   	amdgpu_dm_quirks.o \
> +	dc_edid.o \
>   	amdgpu_dm_wb.o
>   
>   ifdef CONFIG_DRM_AMD_DC_FP
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> new file mode 100644
> index 000000000000..fab873b091f5
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: MIT
> +#include "amdgpu_dm/dc_edid.h"
> +#include "dc.h"
> +
> +bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
> +			  struct dc_sink *current_sink)
> +{
> +	struct dc_edid *old_edid = &prev_sink->dc_edid;
> +	struct dc_edid *new_edid = &current_sink->dc_edid;
> +
> +       if (old_edid->length != new_edid->length)
> +               return false;
> +
> +       if (new_edid->length == 0)
> +               return false;
> +
> +       return (memcmp(old_edid->raw_edid,
> +                      new_edid->raw_edid, new_edid->length) == 0);
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> new file mode 100644
> index 000000000000..7e3b1177bc8a
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DC_EDID_H__
> +#define __DC_EDID_H__
> +
> +#include "dc.h"
> +
> +bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
> +			  struct dc_sink *current_sink);
> +
> +#endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index 863c24fe1117..344356e26f8b 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -48,6 +48,8 @@
>   #include "dm_helpers.h"
>   #include "clk_mgr.h"
>   
> +#include "dc_edid.h"

There's a problem with the header location.  If you're naming it 
dc_edid.h but putting the header in amdgpu_dm/ directory then it's only 
going to compile for amdgpu.

I think dc_edid.h needs to go into dc/ directory.

> +
>    // Offset DPCD 050Eh == 0x5A
>   #define MST_HUB_ID_0x5A  0x5A
>   
> @@ -617,18 +619,6 @@ static bool detect_dp(struct dc_link *link,
>   	return true;
>   }
>   
> -static bool is_same_edid(struct dc_edid *old_edid, struct dc_edid *new_edid)
> -{
> -	if (old_edid->length != new_edid->length)
> -		return false;
> -
> -	if (new_edid->length == 0)
> -		return false;
> -
> -	return (memcmp(old_edid->raw_edid,
> -		       new_edid->raw_edid, new_edid->length) == 0);
> -}
> -
>   static bool wait_for_entering_dp_alt_mode(struct dc_link *link)
>   {
>   
> @@ -1105,8 +1095,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
>   		// Check if edid is the same
>   		if ((prev_sink) &&
>   		    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
> -			same_edid = is_same_edid(&prev_sink->dc_edid,
> -						 &sink->dc_edid);
> +			same_edid = dc_edid_is_same_edid(prev_sink, sink);
>   
>   		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
>   			link->ctx->dc->debug.hdmi20_disable = true;

