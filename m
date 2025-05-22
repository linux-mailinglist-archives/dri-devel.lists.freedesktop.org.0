Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDCAC0D5E
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4226D10EE8F;
	Thu, 22 May 2025 13:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hgvZ3+ZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFF710EE79;
 Thu, 22 May 2025 13:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8+L5+HwYhTI72rbkDVwNfIORZSH0UtTOPtim3SH+oTWEpjRBjKE6nvKxuCBen7AyrQrTMo+y4L4V49bAubnwCipiaALU0aVWixYmxPAcEy5XpOIz8vQJVscx8FEZVXI8kDyWG3XeJnhNKwiaJPtnxpmuQCgHNXws7lba3zhxcHQLl+DhZ1mihuCnfuDbKyGY0++ucvwxfOB799deYHYVpkfGFgpNYfMeHb72l+W8JzQk6dns4XfPwX7mLx7pDGgYaSDMDAQtB/t4tzqCSUC93V8V8TilwjsUig8ATQt3aO2yvs+XVBI+Rbrqqmw8i4PIN4kGv6gAx43C3HLG2Nulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7udloqg5LcTlhX596m61d2qGxED+sHnDq7XymKru2ek=;
 b=DzgwpqrjVJ9Bgth5djqrHlKOq2x3K4VhS5zjgIfTRpAZmL1R0n/iQqq7JMl2y2gybjN4u1PDfJvoSkdGxz2Z6KdOPL9IQypZfQRATMTdJXtNKOYBi8X6gU9R2fKXY4qKsjQU336g21kBb6LxShrhzUPXUbuc0GVmZ+aErQk7FWGuifL8RHeu2QK4aeBT9gmks8gTeCZe5F/dVnegdsAiq5mfX9UB84Y1CsWtBcXlDjC79wIEm/6WyBTnSHRRZmOJfp8x70Rif+pxdNdynOE1e7MaxRpazw7ZfpGNbsk7DXtPDHKyVrg27Rb3NGsIhU6oy0DrG4rWbNjNg6BaXwBzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7udloqg5LcTlhX596m61d2qGxED+sHnDq7XymKru2ek=;
 b=hgvZ3+ZHdvO7cS3YBj0zYgeTLiz/IPqfFEDqTb51HL13xBjaf6C99jeVgmhGtUSXcMwcO+3RO+3eHgak1otguPjRNlR5N8US+1xyNIoZv08lMdY05CKzP9eAFhgYNjd/1nOU/TdMYrovDGAwGGN+Tm7mZWeMwEzMvKw/Fy4h42M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 13:54:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 13:54:57 +0000
Message-ID: <45db460c-35b1-4618-9193-5387bdfc7766@amd.com>
Date: Thu, 22 May 2025 09:54:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>, Alex Hung <alex.hung@amd.com>,
 Misyl Toad <misyl@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
 <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
 <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
 <CAFZQkGymi1XY7m0Ghs8R2HaNRQptE_0NO-5J5Z2c61gDJRho3Q@mail.gmail.com>
 <63e934e6-3c27-4128-801b-f1189f12f8f0@amd.com>
 <20250522105741.6aafc955@eldfell>
 <d1f0e3ac-a030-4763-a112-adca30e9ab08@amd.com>
 <GU-BDO4CzKoaYho7e7l7uEcE32cTt406VF-JQN50yxsvw0g6xGWuQhQDXPANhy9_71s7P6vduHxXsHned9-FCdKqEv80c7HHuNsRAdcwnKs=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <GU-BDO4CzKoaYho7e7l7uEcE32cTt406VF-JQN50yxsvw0g6xGWuQhQDXPANhy9_71s7P6vduHxXsHned9-FCdKqEv80c7HHuNsRAdcwnKs=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::43) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: f60371ad-b87c-4244-dd78-08dd99383c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUJuSzhnWENZbzBNd0VNSFRWbkk0eFp4U1kxRzBDYkRkdnFjeEZ3TXBtTmE3?=
 =?utf-8?B?R1RWK3AzSjFOcXY4VzYwSHRGZHBiNHphbCtmcm5VcC9ocVdtRGk2T05XTkJW?=
 =?utf-8?B?blFLZ3U0aVpkdnB3a3RlaXUrbi81bjVBdW5kK09GdW9VKzVEbGJlK09DeGVM?=
 =?utf-8?B?RUxjSGcxL3JrZ3Y3MFRjb0U4M1g0d09JTlhWUWVRa1ZsN2lZN2JSdXFWYXpT?=
 =?utf-8?B?akRyejdRK1NVd3FUazZoaG1pYlVwR21PcnREeDRxbExHT0NDTFNoenVFb3Iz?=
 =?utf-8?B?TEdLL0ROeEhuSDJGczN5cVlneG9rcEZrR0Y3U1NhMlovTDhWZldyZGVyRXpa?=
 =?utf-8?B?TDB6eU1EcU81NGorcWl0WUFRS3Rrc25PWXBKQkpJZ3pNT05GcFdhcmZkS1VJ?=
 =?utf-8?B?Tm1IODFOcnNTekdhMXgra0JXWXZ1VlU5RjFZNVI1azZWQXJSR2YvcFQrdWh5?=
 =?utf-8?B?dit1MHhiREtkSFRETFYwLzFMNSsvQU5QZXRtRmM1dFNmclRQNUJzUytGc0Z6?=
 =?utf-8?B?bG1qM3VHQU5iQlk4MG9pUWJ5SGFCUUcxMFJUYzFWcGNWRWtLaFF1NU1vZFJZ?=
 =?utf-8?B?RmU1MjBNOVVNRHYxMWc2aWdDQnExS2lWUThJUzVHN2thR2xOdEFxNU8yNjZ4?=
 =?utf-8?B?dCtPUnJVeU13eW1GOEtjNjFnNXB2RmptbjRCblJmdnd3YTVMUC9EVWZKWEdL?=
 =?utf-8?B?N20ybXZPNTV6eEcrS0lvMEJkdVlENjYvcVhDOFB2M2ROdVVmOWtsaGwvN0k0?=
 =?utf-8?B?MW9jSjUxR3A0R1dESGhjb3Fia0FwQ0FYdWJtL2ptVkh5S01DbzY2YnhVcjFY?=
 =?utf-8?B?azNZb3p6dVdYR3VMdUEwaVRoN1c2ck5YZHdCYXlQWlFocng0aFJwNkxFYXQw?=
 =?utf-8?B?NmFTMnZScWEzdmFOZDNLVFNvbkpMTHBaa3MvdlZSVUxnQ0UySUxNZ2RXSUVm?=
 =?utf-8?B?TEFaMUJjZXRJSWVycS9uRktDamNhSG9hZUY0UHFzTWV0QUc0cGc2YUdQSGlw?=
 =?utf-8?B?Q1pyMFJtaStLZmluSlUyejRmRlRCNDZ3MUpFb3hmSHVlOFNTVjIyK1pjUFJG?=
 =?utf-8?B?a2o1RVltZFNpUXAwZm40R2ppY3BkZWZqcDR6RW1zOWR1bGdrQ2s2Sms2K0Rn?=
 =?utf-8?B?YXo5cmV0UmRIejhJbktjNTFPbG1Zc00zSTROWENjYlNWbVdhVVIraEk1SHZw?=
 =?utf-8?B?Y3ZQMW1rR2M2M2k2UzZreUZvUVVjT1BpbUJnLzBHajZ2bVFCQ1RSL0IvWHBM?=
 =?utf-8?B?UzlDVHJyenJTZ3F3WjZBTFdpNCs5eWpMZmhaTnRwR2ZCVlJ4cG0wZkplSlpU?=
 =?utf-8?B?ZmUvQUk5dFN0ZGVlYWZldUV2RUpHRlJkOXMzNEcxcDduRDJMNkdLeXhRMTRG?=
 =?utf-8?B?ZUxrRDZ6Q2NkcnFXQXd0b09Ja3VJaEhHY3FvOEtRdzNZMnQ4OTFKc3hBMDZD?=
 =?utf-8?B?R3ZUK0hxK0x1bVVOZ0YvNzFHNHdnUlh5a3k2K0Znc0lDcEFiK2Nmc3l3Rm4z?=
 =?utf-8?B?MEFrcElnck1DN25PbnZWS2taT09sbW9XZURIY1huajNJS2FxYnB3NDhOU041?=
 =?utf-8?B?QmhsMGEvWXQyUWR0aGc2ZXdBRSt3NWx2T3BlNWVpVmYwRnlvTFBxWlZjY2tS?=
 =?utf-8?B?ZjZIdzNSYk5ZWXZ4VTMvbTVzZGlSTlljZGZsbU00eTd3UFlJT0I3MGF6cDlu?=
 =?utf-8?B?eVZONUcvMGRSVW9JYzFkODVialhIYXV2WUw3ZDU2RlJ3L0w1RWtsNldCRS9P?=
 =?utf-8?B?T09RRXZyc1c1NUZ2SGVnSm43aTJFbzdsVStINGJ0dnFUamJvZjVHVDUvbUlP?=
 =?utf-8?B?Y2pTU3lzQVc2SGhoU2xMN3hNbmluWm9aWnlMazBlZHlvbjlLdlU1MnZXakpL?=
 =?utf-8?B?MGlFY2ZXRVdqam05MHdPU2VCenZnRVhJbWZvMDBLUGVZUzR5R3hMaktkYVQ5?=
 =?utf-8?Q?CBpYme3ZrDE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UElXbkNEWkt6R05hL25hOUFsaW1WVzZJSDh3UEhMNHFrK3RWQzhMM25hdndJ?=
 =?utf-8?B?ZWh1TEVLMXpzTUdrY1o5K2hFZU9JQ3VsRFNXR2FYMEd6UGpQOEFIRWpqUmxX?=
 =?utf-8?B?WUQybEdXMGJWMkc3QUo4cUFZZFpJcFBxNUdnQXNoUlhIWnZjMkVaS1RuTmpV?=
 =?utf-8?B?YWRROEFGSkNWMkN3MnI2TFliWEk3UWcyYVppdlliSjhzUGdzRTZhUXFZcGtk?=
 =?utf-8?B?dDJQei96K0JFQWUyU2h1Qnh0aW1NVjFzN1daNnNzWkNaNmRIbExMVEc4TVBz?=
 =?utf-8?B?VTFERGUrdWtocVkxYTRBWTd3VDI2MzhuWEJoWUJTOGNWanRPZFJyMnpab1Rs?=
 =?utf-8?B?Y0VVWXY1SGM3Wkh2ZFNrZncyUmNibnFBTmhMaVk1K3VCN1o0K3gzdXRKVXRE?=
 =?utf-8?B?cGppWHcrd1g4bmF1MUNldGF2Lythc1o2L29uQWtpcWZaNG5jbFJZRThSZFdZ?=
 =?utf-8?B?YUZBWnhEc01ZKzI5OTZYTmcwZFZNL1EzbHFoVEtob1l6S2hXSG56cHVqTkpj?=
 =?utf-8?B?S3ZhT2hjL0EvSHJERElpWmRDU2RnS1R1MDI4dlJib2xFOU91SUU2NFduZXYx?=
 =?utf-8?B?eEdqaTBLY1ZlOTRKTzBlWGVLcG0yM2k2SGhhdTJPeWtIZU9wekViUU1NL25n?=
 =?utf-8?B?OGQyMkxVYWNkT2M2UlFUcC9BWUlrKzlrRkp3WDFpeGdjTHpaRXZvbDZCNi95?=
 =?utf-8?B?c3VBeEE5ZlB6SEJocWhUZDU4MVU5NFNob2JIWXlja0hINEdLZjBRQUd0a3JC?=
 =?utf-8?B?SUNQTWdXeFh1YS90UW1XYitsVFpRQXJya2sxL1hTYUJmT0RLMW0weEVPRWVa?=
 =?utf-8?B?RHkzR3RHZkM1SFdvb3U1SkxpZjVZUjRBamRYSFY5cmQ3bjloRjB6Y2FoUVd1?=
 =?utf-8?B?dEFxczJVN0lpZjROTlg2WUdEakI3ZWFrYlhMem90aE45d0hOdHArVkliL1hE?=
 =?utf-8?B?QjJ5S0s1eE1ZQmhnSDNTT0NCbWljeVZKQjk5Z1dGOXZjTWJiNkRQT3FLcmUr?=
 =?utf-8?B?SVBnQU8zMVF4UkZSbVFEMmFYa0dBWXd0R0JnbU9JSk1SdFBUM0I5QnozN3Bl?=
 =?utf-8?B?TmN3SDZCV2JFMTdmb25IT2VINWMrdnprSnRMRlBTaExJMjFTaFV0RnZ0Ly9X?=
 =?utf-8?B?eDJoWWc4dXNKYnFWbnI3Y05rN05vT2YrZUZwSzYrdlowQkpkRnkzVE9YN3V5?=
 =?utf-8?B?T2poSXpFMit3TEw0cDRENW9STzlKNW5JaTJ4a0p4SXVTcXczWTQxZEM3SXZD?=
 =?utf-8?B?WWNJdUEycHNEblZtVWtsVnhKTEhUMkMzdyt1KzRvUzAwVTdtVzBveUtZUWta?=
 =?utf-8?B?N3hkUkhlSWg3NndJQkxVbnBRRzdtcjlhbm4rYVpZeDYzaG5RMkRGZllPaVA4?=
 =?utf-8?B?czg4MXlPemR4SVE1QWZrYXJkckJOZ2ViWFlvN0RYaGMraUorRzJ0RTNsWW1X?=
 =?utf-8?B?VzVPUUVDYktWbkpuT1BiREE4eEtnRnYxaEhDWnVQK2tRS3g2elNRTVlmSmJI?=
 =?utf-8?B?elJPYnduNDVpSjlSR3h2ZVFSeEgxdmI2ellmZXk5WVhLMjBBOXl5dmdETDVr?=
 =?utf-8?B?RU0xeGFRSHVEcHJtVi9ROVE0cnJBUUx2Z1N5eE1Wem81cFMvZEdCUmJrT1pm?=
 =?utf-8?B?aHZUUjVrTkhmeTBjVUdzMXUrWVJ4Zk1DdFNrTTl3YSsxV092MVZOdWtPVVlw?=
 =?utf-8?B?bFM5eXpPTXpOZXp2QVlUaTVWNmxCeTFjV2JWZHNuSlhJbXByOW1OcDY0M29i?=
 =?utf-8?B?OTRrYmYyUzB0UzV4bTd5b25QQnlQY0hkUUhXN2NIaENuQzNFVVRSMUc5eFJY?=
 =?utf-8?B?QlFVQmdIcEJHSS9vM3pORm1IYnV0OWlMS0l4a1Z1VkVpSUhITHFqVlhscnRj?=
 =?utf-8?B?NG5NelRiVzFFUmpkTTVqcmdHeE0rOUI4YW9ad0M0eFJVVVFDT0tpOU5LK0dN?=
 =?utf-8?B?TElhTE8zQnJJSGVlbm9mWk42QUpGWk1HSlhPSE1NVTFDejFMUUkxSGtiTTZv?=
 =?utf-8?B?Wi96Wk9aZzhWeXNwdHBjdldLVTZNQ05lWFlOVkU3bGI3c0phcFVXNENLNDJp?=
 =?utf-8?B?ZVVsMk5OT0F3dXVmaG40aXFMZy83NHllVEhGU3BCNzdDVFBRWi9YRnhTUUZC?=
 =?utf-8?Q?orarDcFOwD3Ehg0jeAjE58AKF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60371ad-b87c-4244-dd78-08dd99383c5b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:54:56.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lntug4PHNoCKYoMwe4yKYd9D+aDSQJsOKDvXfi331pcqjPqZnnEEefqnnh9LGXakFODjf+WyQ55c3jg+8Eqayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435
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



On 2025-05-22 09:49, Simon Ser wrote:
> On Thursday, May 22nd, 2025 at 15:28, Harry Wentland <harry.wentland@amd.com> wrote:
> 
>>>> What we should
>>>> do is reject YCbCr-type buffers with the color pipeline until we
>>>> implement support for COLOR_ENCODING and COLOR_RANGE as a new
>>>> CSC colorop.
>>>
>>> Rejecting is fine, but is implementing COLOR_ENCODING and COLOR_RANGE
>>> really a good idea instead of making the color pipelines handle them?
>>>
>>> Wasn't the original plan to hide all such legacy plane properties when
>>> userspace signals color pipeline support?
>>
>> It still is. But handling the color-space conversion via a new
>> colorop with two properties: COLOR_ENCODING and COLOR_RANGE
>> seemed to be the most straight-forward way of dealing with this.
> 
> I think everybody in this thread is suggesting that the old plane
> COLOR_ENCODING and COLOR_RANGE properties are rejected and will never
> be accepted again with the color pipeline. I think Harry is just saying
> that a new colorop can be introduced with encoding/range properties, but
> this is completely separate from the old props?
> 

Correct. Thanks for clarifying.

Harry

> Simon

