Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32072C59D52
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5036F10E930;
	Thu, 13 Nov 2025 19:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4mYqj7ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010064.outbound.protection.outlook.com
 [52.101.193.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141CD10E930;
 Thu, 13 Nov 2025 19:48:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2ALUgq9ibMO7oG7bIt4EN16mVkWRcsFSWtHsAVKmozKRknGY7K0HDzogtl/PWxPTUTSj8oEB+0Nz2wkNTHEGqHeaygUxgrzwKbmlji8uy8T5ZknKfvtaGHvlLz2OeqxJyBWLyPJYrd64JFojv+gBkM3x+wyUbyGGA6PLzFNpm7a3wuU0n2HLPL35vrSNSB5sWzdwmJ2ZEcZ/NTIvBCDtimOJ0d4qfrAyrnAHoxG2y7XnEx5rlhTlOjE2IEjBSD3oN+wpd7QeYfgPBNYTqMRvQOvFBnPtTbp3lBKje8h19/fmaZ6jHe1IVMSWZtcnvOF6fyg7EzmZbSbsRSE4iKU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rof9dCSCD4wMO3uB/R8/2HD+oxmzOEmO8inpg32Rc6o=;
 b=DdSQDOKdAi7fpJdLjw7cZC3JNPshL9PHUVn95/zWTNqCVZLWdhzW4OgxNm8P+moop8Gwq5wJkqGePMVSOfB92dZ0gRhaja+k4ZwX7rXcl7Mp4xuW5UGqRkShNpNLkjvHdqIn9uCOs14s5F67bAr71zW5pdluupsoS63rnFPwqaJrpPfQLVoBNp4PdtrcOh+s4X31cOF3MPk5e1SNWIlSqmnlTTfKbpwIjpmOEy98wn/cOILndn5mSsHad4hmTy6anCxl91DCNYJXAGbz/03zcWtRLOgob4DR2E0oJqK7llOHZyUSAjp6xLw+CknvnwXIPvwqNuq0u5zT7cz+c0uf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rof9dCSCD4wMO3uB/R8/2HD+oxmzOEmO8inpg32Rc6o=;
 b=4mYqj7ud5iW2BnsSLPgm6LP2gm3Pi/fOW98sj0jky4Urj0Z+0zKnzittwFWoDP9gYDe1Iu4KjR3VQnw5xdPFdopsdSa+5GxDnI7bXUKNRPfRjB4yuJtjG4rh4TS+GL0/BRBY247pvCMPiehp+iY6Bu9ziba4uKTjk8ok5fBMQbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB8322.namprd12.prod.outlook.com (2603:10b6:8:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:48:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 19:48:00 +0000
Message-ID: <bd34ea9e-e3b5-4c12-970d-74c494231df9@amd.com>
Date: Thu, 13 Nov 2025 14:47:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 48/49] drm/colorop: Add DRM_COLOROP_1D_CURVE_GAMMA22
 to 1D Curve
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
References: <20251030034349.2309829-1-alex.hung@amd.com>
 <20251030034349.2309829-49-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251030034349.2309829-49-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:408:e7::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS7PR12MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: deb58db4-2ffe-4ad5-c4fc-08de22ed8d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW1NUFpJQStxekZydDFPOXRjQnhlbDF4VEpXM1p4dERSME5MKzhHd2ZBd3VY?=
 =?utf-8?B?Y2h0WXRFL3pZdEhQMDVPMWRDS25ObXdBMnBFOEJqOEdhWUljd0pOZVNaUEYw?=
 =?utf-8?B?Zkk3cWU4L3VjZkxDN21DMjhCT2RkS2ZsZEtuamJWTmFrOEpMYmFZVGU2QUxw?=
 =?utf-8?B?bFF5K24yakVibnc0eEcxRVdsSkNaZWtGV0JnUFo5Und2REs5TjA0OFdCYWor?=
 =?utf-8?B?N0tCbnNKNzd1YzhYNlkyVVIvdzdRZmhQZFpnVXF5SEEwcDVMOHhZU3o2MDAz?=
 =?utf-8?B?WjYwTlI3RUtQUXJjRDBCbkRRdjdORFVOMjlxSWYwdWRlZWlURkJRcjFDeW9l?=
 =?utf-8?B?akpOUkxJeko0MWE1YTArUjFYTThYcWF6VXllRFZweW85MFl2cStsaFRNUE5j?=
 =?utf-8?B?WGYwd1RxRndZNXo2WWVLVUFVQ2ViS2FXb3dqNXdpYVJTN0ZNckFMVkNSb2tP?=
 =?utf-8?B?LzRoaTNoUEtVNjBqWEhwUks2S0FYbE5OVTJyQkpBd2EwOW1uTHNDWmZ5bzUv?=
 =?utf-8?B?Rlg5Y3ZrYVB3RzJ2bktYNnRCd280RVY5UlV1MWFuZm5hU1EySU1zWFAvVmgz?=
 =?utf-8?B?Q0NlM0lFZVV3dzdpTS9SWGlUZ2NaTEhJcFRCUUlabUVuZ2IrN3NRWEZGV3NC?=
 =?utf-8?B?Qko3dGt4cUF0dDZKeEl4MTE5Z1FZZXRUdG1XbW9BSDcrcU12M2gvZGI3K1NM?=
 =?utf-8?B?QlRkUE9wbkNST3liNjdaT3BodXRpTmZLdHc3MzZTU3RBUSszOCtCMHN3MGVs?=
 =?utf-8?B?ZiszNUsweGJlUS9QYThUSWR6aEgrdXdQNDE0enJmaU9SUU13NkEvWGFGWjBn?=
 =?utf-8?B?bDZaVCtxeWFQMVlJc3pWNjMyREFuRzlQT0pBQ1VJY1VXdFpMWnFMSVJPVjBS?=
 =?utf-8?B?c2lXak1mQ0lzeXJ0YnNuVWVQbVRvYnJ0YWdmVkZzaUg2ZGlmNDQ3QU52ZTRB?=
 =?utf-8?B?KzloQTVhL05MRG5WNTJGU1lHeHZldVI5dEI0QTJJWW9kdGIydit5NFdMM0s3?=
 =?utf-8?B?NGZ1MXdwWVM2cVdtQm5kcjA2OXdROFk0bGd0Q1c5RlBGd0xxSWNHOHZPdmVH?=
 =?utf-8?B?QzFLSDJDc2VaZG53LzJIVVlRdVdYSERZUGVUZU8zdkVxanFrQ3JJTUpmTm90?=
 =?utf-8?B?blBrYzExZ3RrUU5Cbks2VmZJVFNHOXo5cEZIQVFtUmE1NkpWZXBERzR2TnNY?=
 =?utf-8?B?OWJOMEE3UnR1YVlRNHRiQ1ZMQnNtNDdCaEpVd3o5VXFIVFpGMkJCT1lmRUdI?=
 =?utf-8?B?eGFvOTdEQk9xZWdkekhvVjBGbng1bVN5WmswdDduY2ZPUWV6YWtuYmhWeFNZ?=
 =?utf-8?B?L05FeUxXTk1xYThvQlRyMEErUzBrUTltR1J5aVc3blBFS09VSlFCREdNRlN3?=
 =?utf-8?B?K21IcFdIVGZLT2YreFlSeEo0enFFWEtiaGZOeGRUR2hRS3RjOEFwQXB6UDUr?=
 =?utf-8?B?LzRnNmJDUGp2Vnd6UFpMbjgxWjFOeU8raXZLMXFHa3E2M0Q0TnhnQWtadjBE?=
 =?utf-8?B?T09wSDkvZ1E0SEkzcGxBK2lwT094bFNOWTlLcmpPN3FjTDdxUFhrSVE5c1ZJ?=
 =?utf-8?B?RGpIdWRxaTY0bzRBOWVmbUpNbW8vUmZoSExTcVY0TjVBVlZvODg0TW5CRHIx?=
 =?utf-8?B?MlhuRC82bVBDUnVvQ1pFZitlNFdJRWx0ektBcGEwbFh5MzJIeC9HUER3OHV1?=
 =?utf-8?B?bWxkZmFsdXBuZTRpUXdUQmphVkxTVElVb3NyZ2l1cEtSaUYvd1R5cmpvampT?=
 =?utf-8?B?dHRKbkcwWUhFZmdEVTF2YlN1dGxXbEo4cXF5cWliT0tXWFc3U1RodytSQVI4?=
 =?utf-8?B?MGhBU1BmVDBFV2V0aUUrWVNNNE5ta3F3ZE92N202Q3dvK3dhcjFtcUYzRS9p?=
 =?utf-8?B?M3VFN2RYaXgxdlpYMmt1UHpBWHdJYksxQW1WbXVxamZaamF2REJsKzBMVGdS?=
 =?utf-8?Q?4SS3L5i8ueDylLMgsZtMUs4tsJc/f6+3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG14UmkzcWppK21mYlNyc1RBRUFad01sUlcxcFYwYmxIcU1ZQTk2NitzRnVI?=
 =?utf-8?B?eVU5TjFnUEFQM2xmeUVocEpEM0g5eXBKalRRNlIyMFpNVEt2S0JSbktVeS9M?=
 =?utf-8?B?Mk5Qd2dTSG9QTnc2SGJ5N0NrL2lqMEdPcUdtbUJLNTFVQkUrbXUrN0wrellD?=
 =?utf-8?B?RGVMZ0tudm5TZFVscllDTUhXeXhYYUpoeitDeTluNXlxN0wxZjhKRmhwYTNa?=
 =?utf-8?B?OUFVWnFiTmNvYlViSmdaZkNZNXpMSU92K2k2WG1XaUg3S1dueWlrUm84WFVT?=
 =?utf-8?B?b01xRXp1U1RNZWpWbkJ0QzB3eEVOTitTRmU0M0FrU0prUndlZy8yK1NjRysv?=
 =?utf-8?B?YUp4cmtOUkZ5bzZQcXlLNFowNzNrOXo2dkprT3h1NkRMb2ZaelIzY0dpQVVl?=
 =?utf-8?B?Q2xqZDIzVFZrS0drY3Y3aWFCTlNrbllockUySUtZb3hYZEovSFp2TXFNMVQr?=
 =?utf-8?B?MzdCQU5tS3FFdnRtMVNDbHdRN3d2NW9YTkk4Y1B2V0psZDBhSEp5T3JiYWhj?=
 =?utf-8?B?OXZKV3FqR1NoQWFMTk51VTk0bEpJME1kUTBHL1RIcHgvZDJIdGlYODVxTjhY?=
 =?utf-8?B?WE1ObWpHNTQ4NGI2N1pJUUJCK05OcTF0Ty90VTJXTHMzYmRLaXJtcEZ2VnJ1?=
 =?utf-8?B?VEZ6eXFoVFlYTnhwbmxneDZ5VmgvZDRaV3kxTm9BVFBtRmVxbnJPb3M5Yjdz?=
 =?utf-8?B?TFdLeG1SZldETDlORkZpTWc0OGZoNXU0TWN3eEhzc0Fzc3J2TTZkbHNRdlpI?=
 =?utf-8?B?WU84Z3BMUFdraHkwVzVnQWttZzNPNnlyR2RyZ0pWdzl0Mnc1R2RlcHBNL0t0?=
 =?utf-8?B?MWdBSERmL0YyUnVKeEVvTENzK211aUhid2tUNFMyVTNkSy81aGVOQnE2L21m?=
 =?utf-8?B?clNRbFdBRTV5SjQ5UGs1d0JWVnlibXlaSit1Qy85NHM5NDZIeS83K0JoVjdL?=
 =?utf-8?B?a1d5Z0kxN3ZVMnpOdW5ib0JISG5KdVJCM0FIN3JsbVJoK3J4YkNZTUZyL0dR?=
 =?utf-8?B?TzlPR2tLbHFtWFN0djlWRlc4U2J0M1JFbDNCVWpEUzdHT0ozYXoxUkdNWHF0?=
 =?utf-8?B?VVVaOVY0RWdwZDRtN3RzV2V1ck1NSndjUlpETXlXRmtpUDFNQm5pTjl0NDBE?=
 =?utf-8?B?UUtGU3JTZzZpekVCMGtUZUZoY0JJa2tEWXBZL3NKSEVPcTJzZjg0MHREUzNk?=
 =?utf-8?B?NTFkMWwwYzE5ZEora3haSjFXdnBPYk9YblJJWlJxdDlPUnp0bC9jbXRiYS92?=
 =?utf-8?B?dmc5MlQvVDRzR0Zsa0x1blVJYTlnNkxiZTloMTJwY25uSzJOcitBZGxEMVln?=
 =?utf-8?B?blZpSVphQ0xobk0wY3grNFM2S3FrU2xDLy9GS2dXa0h2VnRUNHFsZ2VDQ2kx?=
 =?utf-8?B?R3dGTHFvNlJNTms4S1hHWXp6T1FIYUUrOGJOd1dGNkF5NElSWlBncHlsU2RF?=
 =?utf-8?B?VFlXdjhrSlFIOGdIK1NrTjRlZHg4LzJFMHVOQzhCQjhFYk5JVGZnWFF2VGFU?=
 =?utf-8?B?Wlp2RjROL1Zlais0RXJMSElJRHMvMjZqYnBWTG53Q3lhWDFUanBnWlZOTzJo?=
 =?utf-8?B?d0hvSFNCeG1LMzhaZGtmcmJ0TnNJdWVia203USt4NXozM2wyQnhuY0F1K0RW?=
 =?utf-8?B?N3JmTXBaTVIwNU9xdXNFRUl2ekY0L3Y0RXM1Z25tZU13REd3cGw3eU5kOEpZ?=
 =?utf-8?B?bnBIUC9WLzE0cUlGMloxc0wzY29nYXRFUlZYelNqQktLSGVJTm9KK0w5L1Nm?=
 =?utf-8?B?bW9TNkJNSGNZN0V5dWRLNS9WWHQ3ejdsWmZjSUxZaEcxVDFOSzJ4WCtUSGxC?=
 =?utf-8?B?QVFkWGppNmVNMEpUUFduUCsyS09rdWhtcms0TklaY2Z0N2RyOXo0d1RHbUtP?=
 =?utf-8?B?c3V5YnJHeUw5N1RvaURnWmsyZldMRFJPblVIS2pod0dHb1UrVVRnN2ZRRWlF?=
 =?utf-8?B?eHViYkVMbjZTSGorK25oRzdWZkR5bWpES3FFazFCSnl0NXhCaXhsQzRTVEdk?=
 =?utf-8?B?SkgxTUpOeU14UlBmZ0NjeGRPek5HRDNSeWJZbXdhOVBlelIxcWIxMkM3V0RZ?=
 =?utf-8?B?LzQrOE93REpEblg3ODZ4eXUvYkp3bjNBc1Z5a256cnY0cTNzVldibTNjMU84?=
 =?utf-8?Q?HE14vTRXvuaqOxm5PrWU0JB60?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb58db4-2ffe-4ad5-c4fc-08de22ed8d07
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:48:00.3461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/8xvsjEIh4uq0G79ATMZcmZC896nmlmeHvabaY7HKRYNIs+TM8HBA2LpqvwLJp29MCYPIZ2G7ixVdvJ/Dzc6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8322
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



On 2025-10-29 23:42, Alex Hung wrote:
> Add "DRM_COLOROP_1D_CURVE_GAMMA22" and DRM_COLOROP_1D_CURVE_GAMMA22_INV
> subtypes to drm_colorop of DRM_COLOROP_1D_CURVE.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v12:
>  - Add gamma 2.2 (Sebastian Wick & Xaver Hugl & Pekka)
> 
>  drivers/gpu/drm/drm_colorop.c |  2 ++
>  include/drm/drm_colorop.h     | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index e1b2b446faf2..4e54bd46be7a 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -77,6 +77,8 @@ static const char * const colorop_curve_1d_type_names[] = {
>  	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>  	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
>  	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
> +	[DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
> +	[DRM_COLOROP_1D_CURVE_GAMMA22_INV] = "Gamma 2.2 Inverse",
>  };
>  
>  static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 3e70f66940e0..01e6774c482e 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -108,6 +108,24 @@ enum drm_colorop_curve_1d_type {
>  	 */
>  	DRM_COLOROP_1D_CURVE_BT2020_OETF,
>  
> +	/**
> +	 * @DRM_COLOROP_1D_CURVE_GAMMA22:
> +	 *
> +	 * enum string "Gamma 2.2"
> +	 *
> +	 * A gamma 2.2 power function. This applies a power curve with
> +	 * gamma value of 2.2 to the input values.
> +	 */
> +	DRM_COLOROP_1D_CURVE_GAMMA22,
> +
> +	/**
> +	 * @DRM_COLOROP_1D_CURVE_GAMMA22_INV:
> +	 *
> +	 * enum string "Gamma 2.2 Inverse"
> +	 *
> +	 * The inverse of &DRM_COLOROP_1D_CURVE_GAMMA22
> +	 */
> +	DRM_COLOROP_1D_CURVE_GAMMA22_INV,
>  	/**
>  	 * @DRM_COLOROP_1D_CURVE_COUNT:
>  	 *

