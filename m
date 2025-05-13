Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A40CAB5DDB
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 22:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666DE10E5E7;
	Tue, 13 May 2025 20:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pSefZObk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CAC10E5E7;
 Tue, 13 May 2025 20:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+tZuKYJINjM6ozg/jH5TbB0uiVCPJGBs1/hKiSBsYnHuvZi+c6itcE2wkxW0bdlpCmeIAMpBT1dzmZ8Pfmw1xdCGAfrkoOTce7f8ydV37lfttCKUs8TSFwrJ5BpSNs02vbtWbwJzyk+zdeseFpSk562oFRkaOaD9GtuK2q4v5kkyPghLMcGLTQ0agG5V6Z/c/Z+Z8LNTyDRgZKB6IYRXCotAUIQJKfc1Sq/Xx2JGQfwlw9IysR25KWDevreIOYOTfMO98gNuWPO+tKh/v4LSPUsrhrZ/EiujI4meZ/UXc1oZEIKPQZnLKVkmZ0qu8xH8oKmxz+fNMqAzx88Dt39iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPtAiEe1El6DY7Flr+fPNDz7fajbUVEXbQY0O1ByEJY=;
 b=H8i2DItp4wS8bNZjAcuJ/5nJBysomSPPPFKq0DM+eJ+LdH/qClPi39Rza0sH2IW4a7kFhmALtlzCS4HXgwKDqxqOjFtW1zGwlC1eN6VSArnezZHLiMnjlby45mYjQE1s5WDykTXIElv/OC2UnDAinHlFzhZDuzZv6nQshvBiLnkMuVrkgqNwJnnNC+qEUy9tlVQM8i7/olfgVfYSPdrlYNiZe6wZ0af+5TU4gyTlel8RmKSJHG2gTHjDAh/94bWP6YI17yuffFHjYA3DKBZEm2nJCeKV7GJKpbAK2gSRtXY6t6CUjj/g+OEh/OTviWmdj9JPmV3N3EQauizkbsYIrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPtAiEe1El6DY7Flr+fPNDz7fajbUVEXbQY0O1ByEJY=;
 b=pSefZObkoS0vHHXt+xifTB+OwHVhKSSUUQ7RKXBt12Df/dXpFR6WUMhp8qUiWs/YBLznH7prj2K3m/oJKtVkzhlIXArZKUglx6pvYkJ/EL8j4YtrkCDroR/Oz3dI2CI9nCfn+zNv1ly1w+Z2zw+Jx+tfYksI1pcPxGuZhgNYfNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB8097.namprd12.prod.outlook.com (2603:10b6:510:295::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 20:39:58 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 20:39:58 +0000
Message-ID: <13fffc5d-21e6-4207-9f65-ae2c4edba1c1@amd.com>
Date: Tue, 13 May 2025 16:39:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 26/43] drm/amd/display: Add support for sRGB EOTF in
 DEGAM block
To: Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, contact@emersion.fr,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, Daniel Stone <daniels@collabora.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-27-alex.hung@amd.com>
 <twwndnvjm6rmxdt4cs747fixvplpeuy3yh3ho6d4yq3y3prhub@fag4kafh2xct>
 <20250513104213.1c5d905a@eldfell>
 <sb544qlewpslcvcgofer762puac5bjd5w67ldisi6pkcpkuboj@33lwudjvd6xr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <sb544qlewpslcvcgofer762puac5bjd5w67ldisi6pkcpkuboj@33lwudjvd6xr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0279.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 117af136-c653-4f11-d607-08dd925e537f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3RPOXFpU1N6QWM0eGFFUGZsQ2s0MTdNS1dXTGhWdFZVeU1rbVAvNG9iWFJF?=
 =?utf-8?B?Y2Ewb1QwQ3JJUUZuWEZ4Vi9neTVtdnZia0dOVG1mQWNSTmNlVnpjT3l5bXhm?=
 =?utf-8?B?VmF1YU1JTWQzZ2diejh0THc3QURjSkJPbGpDWExFVFdSbmVob2pPWWN6Qis2?=
 =?utf-8?B?Q2NJU1ZBd2FmLzFka3VLTzYrMUJXYlJoT21UZHhjQmJTcVBnWlZwVUV3QmI0?=
 =?utf-8?B?OWdnaGtIaE0vNUlQOVFRTmxJK3BnbFplZ3VOazl3dnYvNVhUTHg2cy9TUEcz?=
 =?utf-8?B?Q3AzRlA3S3ljRllVZVpFSnNvNFFrd3VNZzh5UkZrTlRrNkJpUklLWUZyWHpH?=
 =?utf-8?B?QXlEY3B0V0tLcXk0a3RUSjBseEVlS2YyMEdZZzFQQWVlSnRseEdpVGxKdUdY?=
 =?utf-8?B?NUk4eWgwR2x0S2tjM1g2WmZpM0hLQVBuNjBRSllFQkt5Q3ZjNkUyRFN2RDBn?=
 =?utf-8?B?bE5wUnluajMzb2NON0JCU3F4K0VORTlNZVRPSWdiWDRLSUpnUlRZaElOR2hY?=
 =?utf-8?B?UmtrTWZBTGVLc09pMGhjU1ZtdU1oOVJRc21ib1pxOUpvNmRMN3I2WDhFc0tH?=
 =?utf-8?B?eHF4c281dHVERmkxaFhrVkh4QUNYMlFQZXFCdUxtVUlUVFh6UUp0a1BOc251?=
 =?utf-8?B?L2RZVm10T0QwRlZyU1BZRTliQmlDTUhZdlRaRC80UThFSFQ2K0dQRXNzdEN4?=
 =?utf-8?B?b0hrbUpPLyttK2tFSy9heVl1UUlzejFNbjk4M1M0aTY5TGZGV1VKNkp4TitM?=
 =?utf-8?B?Y3k0eHFoWVFxVytEMmtkbktKVlNsdDZpN2VYTFBzWTdrUTl6RWhXNHViM2ZL?=
 =?utf-8?B?R3dBdWZxUXpmVzNGN1VPQ1liUDcrNFNlVHdLT2g2cUpHdTVUc0J1RmJBZ0V5?=
 =?utf-8?B?N1JsQjlDL3pHbTlmQ1NzaU5kV1JpN0JlVUUyaGQ2Y2IzbGNJZVZtUGtTOEpr?=
 =?utf-8?B?dkFMdmxlWnRiVTNxRThxWERmS1lzZVVxMXBRMHdRK0tybWdkaFlRTkpEckVN?=
 =?utf-8?B?TlZmWExaTUhyRHBoeXRPOXVyaVJtblV2L0VjeCt0YWJJT0lydXc2VW9uV05Y?=
 =?utf-8?B?bXUzOXBmLzJEcXU5T2dBNVpEVWRsRmJwbTJMSitEQ3ZOZityeHUvbTdPLzYw?=
 =?utf-8?B?TU42OVY0TlhJcHcrMGlBdmZxOVB6c3Nlc1haOEF1SGFxazY4VUhlblRyb1Uz?=
 =?utf-8?B?SCtUS2VtWEx2ZG1sS1o3NW1BOW9KNmtYS0NHd3FJRlFsMlAzMjlIOURMQXVS?=
 =?utf-8?B?eFI5OWE5Z0MveUtodDI2UlZWK3RVZnpOdWZISitpSFFoQVQ1OTRlMHBOVnNi?=
 =?utf-8?B?V3d1QjBBVmhQVUUzSkYxbjlnaWpna0RKUTFsT3ErNWZuNHlKaUNNRW9PcDNl?=
 =?utf-8?B?dTlDNHp4Q0RLdjcyL2lLV1BCVElscHM1SjAreVVQOUJjL3o4MUs5R2FMdXJw?=
 =?utf-8?B?OC9KUmFDQytUdkVXUzJlVVp2SmFvZnI4WldRbHJIanpUTVZvWENBVDVyQXhh?=
 =?utf-8?B?RmFmTEQvMWdJWEVpdDlpSXZhWE52dWcwRkpwVlBGSjRxblc3WHRxNXlKN2gz?=
 =?utf-8?B?dUFkSjJZeHdnd3VwOE11SnFvSlhvZTlPOSsyM0ZvZndqY1JpOHVYUE5pdTM3?=
 =?utf-8?B?cEJqcm80bTNDNkdpQzRYSXBUSENYOGErUzFqSFlwaHd0WE15YXQ0SHBFWk1I?=
 =?utf-8?B?ZVZGNEVvaE1NdzZHQy9VSFdjZjRrSWxOZHlzVDZCK3E2QVNYcEsybEdjR201?=
 =?utf-8?B?eWVGNjgrbnZOYU1pTlVmYkpOQVNmL09FS2srcmpBekUxRkZhSE9QenlZTkxH?=
 =?utf-8?Q?LW8vIoQcxHWH1J8+K5iMWrsVXfEJcfDAGGi+Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGk2THNkMlppaXBOcHZ4Vmd3R1ROR0RLcWszcG9zTUpyZWZPUWZwYStWbmVm?=
 =?utf-8?B?WC9nNjI4eVZvWDhoMVZLL096QnBXeTg5QW55WmEzV2pKZ1NibVpNU3lCTGdH?=
 =?utf-8?B?aXN6MnNRQ2I3VUQxd2VzRXNWWFBZTVRHSktIb3QwelJqam9JZmlGZGRweWhu?=
 =?utf-8?B?TDgyYTdrUFI5cFJXdGJ4RXRDWkdUQlVDUkZOVTd1Vk8rbWx1b2hGK2FmZ0dN?=
 =?utf-8?B?Q0ROQmpDQ2JFNUg0WUtMOUdkRWpDYTlCWStjU1RMMVFTOFRiSEVpWWZJcGhy?=
 =?utf-8?B?RXQzOU8wMVo2NUx5N1E5VitCNW16bG1pTjZ0RTNIeUpwY09kVnhDeWUvODdp?=
 =?utf-8?B?aWlCVVpJVUdYeHYwMXBNN21VcWhVQTZqa3VJSWtITDFQcmhsVkluNS9WUnZE?=
 =?utf-8?B?RVNiMS9uMGU1V1VYMXErdTJhalBXcmwvejJvY2hPc3A1S1JCc0diNm11SUNl?=
 =?utf-8?B?Z0lMaWo2b3U3ZE5lRmlpNGdiU2V3QTB4Tm1ZaThWbmVuYmJSdnpZcTBQRURI?=
 =?utf-8?B?dmpLd3MzOEhrWjRaRGgxaGRxNGw3Mmo5Rk16MW1RNlFvQ2FyMmlnZHlma3FZ?=
 =?utf-8?B?Y1lJQnFub282VWRFSFJpVXhKelA3ZU10aGxITkh3NmROeTJoL1RVcERNZTFu?=
 =?utf-8?B?Y3Q2Smw3RHl1cnFHNHVWZ2l5SzBWZE1UOVdtdzRXWFdrcy9pRmpEVi9pZ2g3?=
 =?utf-8?B?ZGVrVnB0dWRCWnRLZ2k3TFBWSmd6cGxxc2ZLY25PMkFLcy94d1cxYXNPQWly?=
 =?utf-8?B?QkdmUlhGeUZVay81VDd3YXhLaHhuVVYrZlZzR0VRbFhWUUJiVThZQVRSZnVz?=
 =?utf-8?B?aFR1dExjWnV3NXlOR3Q0N1hjdzNoUHdsUVcvVWU2NGVWY200MlNmVERnbnAr?=
 =?utf-8?B?N1dEZEJyd2lVTk9TaUo4ZHZKM1pBYlQ5RVJMbVA1bWo3UVRtcEJQM0hjai9P?=
 =?utf-8?B?cFI2bzg2UkZBd0xWZ1hpRWg1RWJxb1hsNXJiRUZrUVEyL3Z2NlVDbEx1eWFj?=
 =?utf-8?B?VUZCaG9rV3BLSVJuNGZEeFJYYTJza0xSR3ZyakpVaUt2N2M2WDRaa1Uva2xK?=
 =?utf-8?B?ajNrZXl0eDhuSFZqR2RXRlV5VWl4OCt4L3VlVHN4d3RRYk9UWHNlWjcvWCtT?=
 =?utf-8?B?Q0xYR1FnZnZ2VlNBWXJ0V3l1ZmhTR0JIRC81ejJEaGFxTEJXRitkVXBnTDNL?=
 =?utf-8?B?WlhoR0VrVzFncG5TVlpCbzh5Y3dsRVEwOWx5MHYwdWRFN2pOMGxXQzV4NG0w?=
 =?utf-8?B?Z1Y5T1ZoeE1HdjJXR0M0Ymw4d3ptYjdFV2FWQk9EQ1p0akhWUURLcEtlVVBv?=
 =?utf-8?B?blpBbEVWNVc1eXB5d1Myc1Rkckp2YjA0WGJDTEtkMk9ZaTg0UElWOVQ2aklY?=
 =?utf-8?B?Y25kd3pWTk9pS3RZdHFFQ2JQOXUrMFcxMG4ybjg1Ykt0OEVTakRGajNCREwz?=
 =?utf-8?B?QWpUNGcreUdRVWJkNXpKODUxRXlLcHZkdkRkS1BXM21jTWhwQnlsUSsvbytY?=
 =?utf-8?B?ekdkVDgzek5tK015TWFkUGdROVJyZ2FSQUpTQVJIWkRISjg5OW50ckxCRVcw?=
 =?utf-8?B?YlF4b280ekNPTmoyU3kvSnlWRERPQ3E1NTY5MTd6Ukc3NnVUS0V6Ync0WDRN?=
 =?utf-8?B?VEN3OVVrbThDcFBEY3hLczVTVnhjZ2I2UlNlSHg0MXN1NWlhMVZuRVhXUEJk?=
 =?utf-8?B?QnFxbmVtQkVNZGdFYit3ZkUwK25aZ0I3L0dvQzlDNDQxYzlWR3REdXRwZXJY?=
 =?utf-8?B?dk42R2FJaGs0UnR5dWNha0pNWnI4aVBBaWtGa3RYN2wrZFQrK1pHdjJEYmY5?=
 =?utf-8?B?YTc3MHR6b3NUbExFZGVBL0I4eGZjbjNjcVpKNkw2anEwcVRPTlY5Qy9lWFVW?=
 =?utf-8?B?aktiUHlWR3lTdDhTR3dHMGlQeEYyRHFrMTkzbnpzRzRyczNoVDJ5VElXVmxF?=
 =?utf-8?B?QVU0V2pINzBhRzV5cTd1UmxXS2MvekhXd3MxTGk5MU5SNEdZaVlPUTQ3SnQ1?=
 =?utf-8?B?QUxxNnIrMVJoVUxzNy81WTIwbEp2Q0dPU0kra0djUkg0UFVsU0h5bVJTR1M4?=
 =?utf-8?B?THFLNllsSE9XYXJkUzU0bFpTNmtGNzdBaEJuTXpNQU5iL2ZtOGlYckxXdmNE?=
 =?utf-8?Q?nN0yY7SHP5/fdtyK0biF++b1/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117af136-c653-4f11-d607-08dd925e537f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 20:39:58.4200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deVx/Wib84QM76XS7aEq2PU+44m9CUuqTNt8PRogut+w/hIvZKzD+l73HZOpwn1XUBynYI7bDEQRdve934LdCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8097
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



On 2025-05-13 11:36, Melissa Wen wrote:
> On 05/13, Pekka Paalanen wrote:
>> On Mon, 12 May 2025 15:50:17 -0300
>> Melissa Wen <mwen@igalia.com> wrote:
>>
>>> On 04/29, Alex Hung wrote:
>>>> Expose one 1D curve colorop with support for
>>>> DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
>>>> the sRGB transform when the colorop is not in bypass.
>>>>
>>>> With this change the following IGT test passes:
>>>> kms_colorop --run plane-XR30-XR30-srgb_eotf
>>>>
>>>> The color pipeline now consists of a single colorop:
>>>> 1. 1D curve colorop w/ sRGB EOTF
>>>>
>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>>>> ---
>>>> V9:
>>>>  - Update function names by _plane_ (Chaitanya Kumar Borah)
>>>>  - Update replace cleanup code by drm_colorop_pipeline_destroy (Simon Ser)
>>>>
>>>> v8:
>>>>  - Fix incorrect && by || in __set_colorop_in_tf_1d_curve (Leo Li)
>>>>
>>>> v7:
>>>>  - Fix checkpatch warnings
>>>>   - Change switch "{ }" position
>>>>   - Delete double ";"
>>>>   - Delete "{ }" for single-line if-statement
>>>>   - Add a new line at EOF
>>>>   - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */
>>>>
>>>> v6:
>>>>  - cleanup if colorop alloc or init fails
>>>>
>>>>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 +++++++++++++++++++
>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 69 +++++++++++++++
>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +++
>>>>  5 files changed, 201 insertions(+), 1 deletion(-)
>>>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>>>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
>>>> index ab2a97e354da..46158d67ab12 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
>>>> @@ -38,7 +38,8 @@ AMDGPUDM = \
>>>>  	amdgpu_dm_pp_smu.o \
>>>>  	amdgpu_dm_psr.o \
>>>>  	amdgpu_dm_replay.o \
>>>> -	amdgpu_dm_wb.o
>>>> +	amdgpu_dm_wb.o \
>>>> +	amdgpu_dm_colorop.o
>>>>  
>>>>  ifdef CONFIG_DRM_AMD_DC_FP
>>>>  AMDGPUDM += dc_fpu.o
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>> index ebabfe3a512f..0b513ab5050f 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>> @@ -668,6 +668,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
>>>>  	}
>>>>  }
>>>>  
>>>> +static enum dc_transfer_func_predefined
>>>> +amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
>>>> +{
>>>> +	switch (tf) {
>>>> +	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>>>> +	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
>>>> +		return TRANSFER_FUNCTION_SRGB;
>>>> +	default:
>>>> +		return TRANSFER_FUNCTION_LINEAR;
>>>> +	}
>>>> +}
>>>> +
>>>>  static void __to_dc_lut3d_color(struct dc_rgb *rgb,
>>>>  				const struct drm_color_lut lut,
>>>>  				int bit_precision)
>>>> @@ -1137,6 +1149,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int
>>>> +__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
>>>> +		       struct drm_colorop_state *colorop_state)
>>>> +{
>>>> +	struct dc_transfer_func *tf = &dc_plane_state->in_transfer_func;
>>>> +	struct drm_colorop *colorop = colorop_state->colorop;
>>>> +	struct drm_device *drm = colorop->dev;
>>>> +
>>>> +	if (colorop->type != DRM_COLOROP_1D_CURVE ||
>>>> +	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (colorop_state->bypass) {
>>>> +		tf->type = TF_TYPE_BYPASS;
>>>> +		tf->tf = TRANSFER_FUNCTION_LINEAR;
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
>>>> +
>>>> +	tf->type = TF_TYPE_PREDEFINED;
>>>> +	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int
>>>> +__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
>>>> +			       struct dc_plane_state *dc_plane_state,
>>>> +			       struct drm_colorop *colorop)
>>>> +{
>>>> +	struct drm_colorop *old_colorop;
>>>> +	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
>>>> +	struct drm_atomic_state *state = plane_state->state;
>>>> +	int i = 0;
>>>> +
>>>> +	old_colorop = colorop;
>>>> +
>>>> +	/* 1st op: 1d curve - degamma */
>>>> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>>>> +		if (new_colorop_state->colorop == old_colorop &&
>>>> +		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
>>>> +			colorop_state = new_colorop_state;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (!colorop_state)
>>>> +		return -EINVAL;
>>>> +
>>>> +	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);  
>>>
>>> I wonder what will happen if plane degamma isn't set, but CRTC degamma
>>> LUT or legacy CRTC regamma LUT (with its implicity sRGB degamma) is used
>>> together with other plane color ops.
>>>
>>> I can imagine the mess, so I think CRTC degamma LUT and legacy CRTC
>>> regamma LUT should be somehow entirely disabled (or rejected) if plane
>>> color pipeline is in use.
>>
>> Hi Melissa,
>>
>> if using a plane color pipeline means that a CRTC LUT cannot be used, it
>> will severely limit the usefulness of the whole KMS color processing. In
>> Weston's case it would prohibit *all* KMS off-loading when color
>> management is in use.
>>
>> Weston chooses to do composition and blending in an optical space. This
>> means that plane color pipelines are required to convert incoming
>> pixels into the optical space, and a CRTC LUT (a CRTC color pipeline in
>> the future) is required to convert from the optical space to the
>> monitor signalling (electrical space).
> 
> Hi Pekka,
> 
> IIRC, Weston needs one post-blending 1D LUT and with my suggestion the
> atomic CRTC regamma LUT works fine and can be this 1D LUT.
> So, instead of an atomic post-blending/CRTC color pipeline with:
> 
> [blending] -> CRTC 1D LUT -> CRTC CTM -> CRTC 1D LUT
> 
> when plane color pipeline is in use, the driver accepts only:
> 
> [blending] -> CRTC CTM -> CRTC 1D LUT
> 
> If AMD driver continues accepting/exposing CRTC degamma LUT plus plane
> color pipeline, and userpace wants something like:
> 
> Plane shaper LUT -> Plane 3D LUT -> Plane Blnd LUT -> [blending] -> **CRTC** degamma LUT
> 
> I understand that this weird sequence is what will actually happen:
> 
> **CRTC** degamma LUT -> Plane shaper LUT -> Plane 3D LUT -> Plane Blnd LUT -> [blending]
> 

Right, and this is quirky behavior by the AMD driver because
historically we only had the CRTC LUTs and had to use the CRTC
degamma LUT to program degamma, which technically needs to happen
pre-blending, i.e., on the plane.

The degamma LUT never really made sense on a crtc, but here
we are.

> Because userspace doesn't care if this is a "degamma" or "regamma" LUT
> and they will probably pick the first 1D LUT in the post-blending color
> pipeline, which currently means CRTC degamma LUT. So, better if it takes

Ideally a userspace implementation would be the correct LUT
but not sure that would always happen.

> the CRTC regamma LUT that is actually a post-blending 1D LUT. Where I
> expected this result:
> 
> Plane shaper LUT -> PLane 3D LUT -> PLane Blnd LUT -> [blending] -> CRTC regamma LUT
> 
> You can vizualize better this degamma issue in this diagram:
> https://raw.githubusercontent.com/melissawen/melissawen.github.io/master/img/xdc-2023-colors-talk/rainbow-treasure-xdc-2023-17.png
> 
> In the current driver-specific implementation, driver rejects atomic commits
> in case of collision, i.e., Plane degamma LUT + CRTC degamma LUT, but
> IIRC, the driver doesn't handle it if it doesn't clash.
> 

Yeah, I agree the most straight-forward way to avoid problems
going forward is to not advertise the CRTC degamma LUT for HW
generations where we'll advertise the plane pipeline.

I talked to Alex to make that change.

Harry

>>
>> I don't know what "with its implicity sRGB degamma" means, but there
>> cannot be any implicit curves at all. The driver has no knowledge of
>> how the framebuffer pixels are encoded, nor about what the blending
>> space should be.
> 
> It targets the legacy CRTC regamma LUT (256 size), not the atomic CRTC
> color pipeline.
> 
> Melissa
> 
>>
>>
>> Thanks,
>> pq
> 
> 

