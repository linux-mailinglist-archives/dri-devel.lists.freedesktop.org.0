Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBYbMm4xhmmtKQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:22:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A83101BDF
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2E710E0C9;
	Fri,  6 Feb 2026 18:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IflS4GCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2F389364;
 Fri,  6 Feb 2026 18:22:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFgjphStn8Tf2HLvr1BSgpBYjhYKQPPetd9yQW/LgrX1vM9gtD4p4LW2pzdXWciAEHQzb54X8ENmAgOhxv7B6EIUlnQpRODedPJwpkYcyn7vP1g7u4y0XCIHlNyUm1sTm/TDamjAR/JyAjgq3ORDPua7+RlqxTdrOIC0UyURmtaBCZEXuxhjWuejqaol+HeFq55YqqsnO3JZST9n/zrQHH+qnJI5jZlWGYr+RLgJUvx7F/6e+8f9zbY2q00CVfjiYpZFld9Vv/3C8iI52cSsP+kZgHWnYueFGYHzkXrMDRnORCm2U2VEE3QvEMkhBqG+LKAi1nvIzCklVOWhSLxbdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxkeo5UyQqUO3kOZTC7miXHK8pGi90N71S4iZUuC6bs=;
 b=uVy7Y/UpFFhaewAEOac3ek2VGtKy8Boboc7UuZlnvypXq6+ZLMbvyQHbXqe76Y4Uy/EECZIwj1Hcij5Nb6eCETydYONwyZueVvPJ8dHMYEtflX0HvuetEiQRUPgD7d68kFXdZ3Sf4ShVDi8/8TTp+lNrm919sixB6EvYtyxs5SoTNGqhaSeFTm9yz0gZ3Pgdm63UrJ+4dkBO5jGfzN1KX+5W3yd82oXC/ZoYOeNLmTuERsxlgzPhZa/GrB2ASeFCmjO+tkccfJ+7xMukS0FtttQBMyiPVzbNScyA7BM9ZhwZokeKKUvlYPI58OHxhl7T93NnaipsHhnehetngt60lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxkeo5UyQqUO3kOZTC7miXHK8pGi90N71S4iZUuC6bs=;
 b=IflS4GCenT2+v9+aldeugyJyYMMy7myiKmv0sLFoCQLAJVMZDMMWGV5qQIEmlynuArmRnHaGCv57ZkV2Nq3/twPAEgxSPBIaJab5ZuUYgQ7KzE7VulWbi6/8cJWj+uz49ELQOP3dURdQJOWPWihOwO67FFcHXf2EXlQCYUdBGd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 18:22:29 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:22:29 +0000
Message-ID: <0d0cd4fb-0bce-4c11-bc70-2e232993ee73@amd.com>
Date: Fri, 6 Feb 2026 13:22:22 -0500
User-Agent: Mozilla Thunderbird
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 02/19] drm/amd/display: Refactor
 amdgpu_dm_update_freesync_caps()
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org,
 admin@ptr1337.dev
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-3-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
In-Reply-To: <20260203185626.55428-3-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::39) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a0d510-398a-4bb8-65fe-08de65acaf9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWJ3eE83QUhiQVMzeE9NeUZGWTFYSk85RlYyamZSVjBMVER5UVVWK3drYXhy?=
 =?utf-8?B?emRFc1p2UmwxczdtZ3RnZEE1aVFRcVJxV1N0eG5VVllyK2I1by9mcDQybVo2?=
 =?utf-8?B?MjQ0YkwvTGtpSEdvaTJaUVp0L1VyWG1hVlZPZkIvL29TZ3VoTHc0d2tSWVRM?=
 =?utf-8?B?bUxlb3dnRXprdG1pSGJjVWlNQjFMUXJlRHd0cVpRdjlBL25NYmlXMUZaWGxn?=
 =?utf-8?B?a0dWa2MwY0o0OGRKbjZWWFZ1L1dta3FSRmw5MGNuSTBGRURmTndwOHNXd0Jl?=
 =?utf-8?B?RkpLek0weTN5YmhzMDUxaEJub01TQkRrVXZicUdqOHpxZWxPTXpTREJjYkNK?=
 =?utf-8?B?WXpvWlFuRXF6U2dscGxtS2U4Y3JkQlRSSTVVVWMzRDdMREord1FIazBXZFpR?=
 =?utf-8?B?d29Jalo0OVRHK1UxM2NZMGdzOG8rQ3hEQVg5T3k0ZGs4Z21TM0RQVUdtSW5T?=
 =?utf-8?B?VnFnUjhxNkpSaHh1K25ldzFnR2VSZUR2bWJLZzhrYnBPaTUwVGI2TkkvNnhY?=
 =?utf-8?B?b3VIWU1vT01hV0JGbUlPZTQ3NXhCUEcvcm82RVpFUHV5K0RReFJPR25LVExo?=
 =?utf-8?B?Nng4Z2hvak1IVmFKVXlueW9rU0t5WStEeVRCNGwyMy9LcG1vaWd5cjFLQ0po?=
 =?utf-8?B?RUFZUjVva2oyNGhiclowZTZQSFlOQ01KdlNXY2g1bGJaWVdTcWtqY1B3UjNy?=
 =?utf-8?B?cFBKdGMycENrMURTV0VDTDNCQnhtMnQrNENpWko4SU5HMHc4RGJ0N1QzM2g0?=
 =?utf-8?B?bHI0dXY0T09JQ0JWQlpKU0k3OWo0TGJKMS9pWmxQaCtyd2NUTEVPM0EweGVX?=
 =?utf-8?B?bk4veVhNc3B2S3lVbGkzQTdLT0cyamd2SEZrMnJLSUdBbjJXa293bUhNdllD?=
 =?utf-8?B?UGFVRE9xTEpySzJaQTBpZlhoRC9Tc0QvSmpTMHB5eFJmcUltcTZhSERpditP?=
 =?utf-8?B?Q2xHTFlva1J4QXhWYjlGcE8yQldNUzNSUlFJS29JWk4yQ1lqb0F1T2VpN044?=
 =?utf-8?B?d2ZBV3pYemdwa0QweVk5ZGx1SEhabExvSThoeE5OYnNjay92d0M1SUxydmdJ?=
 =?utf-8?B?ckFlTzU0Skd1WjVKSElOT294OVY5T1IyRHJZZEc3MjRJNTFvT3RMVEtPUUVz?=
 =?utf-8?B?dUk5WXNqWlJKTEVpblBid3Zvb25EUzhrTVdqK25hQ0xkZU5HSW5tOHIvOXdv?=
 =?utf-8?B?SnpuWWtGNTRxQ0hNTUxPMkhPSU9UbDJxeDBaSHl0U1RML2pBRE0vYXNrUUly?=
 =?utf-8?B?c0dsNzNwM3gzTTVwT1hKNjljUzNUSjlhNm45SmRNYkF6Z3R3bmpFamMwY2FI?=
 =?utf-8?B?L0p4Ty9LRG5MUUhpMGlQSmxpS1hQVTQ2V3JxalIxQXR1TWRZcVpxbCtNSWpT?=
 =?utf-8?B?LzJvaG5USm5JcTAvTUQ0VFEwZHJ4dUc1WTVDTS96aHpLNkZFSWxLTDFjNVJi?=
 =?utf-8?B?TTJmbnhTSUt1MklaMnlza25TSkh6RjdaYnJRM1g5NUcwajNaVFRqSUlEbXpy?=
 =?utf-8?B?bkJQMWVBdGRLWHVDSnA1aHFwY0Z4d2I4Nktnb1hQVUpUWDBWRHJxa00yQ21a?=
 =?utf-8?B?U3IzcUZ2Y3VTYi9hT094dTZpdldvVk56SERydlN5a2ZOUkZnL0J6Y2tpdHNo?=
 =?utf-8?B?eTdXTzVvQVl6SndlM0c4TGFxSkJLWitQeCs0bFVHcThpYkJJNENPN0FjdXBY?=
 =?utf-8?B?alY3L2JmTjAyRkhnYkhvOWdid2JrNnk0Y0RMWTE4dUNna0FqaFE0YXlGVzNB?=
 =?utf-8?B?aDFaSm9hWkV2STduQVZ5cGJRTmQ2VWJUL3REaFN3RmtJdlpHU0FuMDVDYlI3?=
 =?utf-8?B?QTZkR3FCNnV3a0R3ZUthYkI3WDh1TTlCbDNqdkNPVEZIWEFSSWYrYm1kSjYv?=
 =?utf-8?B?bDE3b29Iblg3OTZkeFY1VVNZQzhVMUl6TTFJanh6QmdGVWtzL09zVS9oZ3lI?=
 =?utf-8?B?Ky9uckpEZkVENm9Hb09BdVdYdkQ0aTVCVmpIcTIyU0ttcG93RDNRYWI4UlVy?=
 =?utf-8?B?cFRIYUEyWWY1R2h1bUpXak5jU2d0QXM2Y1NML0tqaU5KSEsyYlZWaDEyTmpN?=
 =?utf-8?B?Wi9rb296ZlJycHJqNEhkOHZocVhhc3IzUzBROFpZR1dDdEhhc1ZtZFNva2V5?=
 =?utf-8?Q?1ahA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmhaZFF5SEdvZkxIcStxazVPYzg1N3ErSllUOGxzRWZURHprNmpPV0s4dEkv?=
 =?utf-8?B?S0M1eUw3Yk41L0JtbzFDZkkzcXlEcnVtRjJESjYwcHE3S21sM0FzaHJMQ2lE?=
 =?utf-8?B?aGVhWmhjcWRqOGRFMTJEUkh5S2ZNWW9IK3NpVFZnb2hwQzFwU1hPQmNwU2Zr?=
 =?utf-8?B?RnR0dGw3Qy9PeU43MGdJdmJwZ2FnKzdoRHVLV1VhN3BYV0tnN24rM0prdXlt?=
 =?utf-8?B?ZDVRaXFPb1Vta0dwNUhyd2YxRDBxQWxhRm1pR3NXVkZCcXp5U2trQVcwYkZL?=
 =?utf-8?B?U1NINlpCT3Azd01ZNk90VFl4NUZrSUZLMnVKYmRpSWRDWXFRZGFnN2xCT1o5?=
 =?utf-8?B?MnN3anRyM2FsanhYZWkyKzRnWE95ZTZ4TVJyemRsQmVqeHlXMzFQMFQvVC84?=
 =?utf-8?B?VmF1ZzUwbUxKMjdwcm10YXp3SURXKzdGSFFmR2lQV3laczNZejhWRW9vVGRZ?=
 =?utf-8?B?QUE4L3Z6ZWNhV2VFTXNUV2RoWGlCaXo4aXdIYVJNUzVkcjhDOGlVZGZUaEpi?=
 =?utf-8?B?bjRWcGhLOWRqVkd0YnJIRFJCblkyMzBTZ2NaL2NaTHMwT0JDTVJ5am92dy95?=
 =?utf-8?B?YkhTeW0rU0Jpd2FQWlhVUlZwQWthVUZWZ0lLM0MvSHRDQ0szdWNkVGw4cWt4?=
 =?utf-8?B?SC82VCtiNG5mWnE1OGJyY2JZOFZjV0VTaG82RG1pRkZ0QXdUdHhjK3k3T3o0?=
 =?utf-8?B?RGdoaXBqOFJJNEZoV05OTGo4OENjMDlEVnB5YzI3Y3lOVEpEQXpkNVJCNVpE?=
 =?utf-8?B?S1lwTGkyWGV6d2lhdVk2T3kxMFIwOWpxRHduTUJ4WFc1cldoUTJENm54enpY?=
 =?utf-8?B?VlphNkt3L05zQUx1RGliTVQ1UmpBcnBUdWxFM2lwekQwcVIvZnNQcHJqTDFW?=
 =?utf-8?B?TldCNENsQUZaOHVac1FtMGY2M3pvaUxYclZjckliWEZ0YUZzUVd0d3FwOGhV?=
 =?utf-8?B?MDluMlZibk5JZjdPQituWnVaR0tURHVxYmd3TUtjL041UVRzdmpqajJiU2Nl?=
 =?utf-8?B?SGZXbE4yQWxJb3pxbHA2M2ZQUEdYaHFWa1YxWDU5TS9ibFRZNFpLQitjMVk5?=
 =?utf-8?B?UkhUdGNGRGJvalpVWG1ZOXNFOWhpNHE5Q2VCaEtqYlNXTUpONHBOUm03N2hv?=
 =?utf-8?B?UHluQzVGcXVVL0xXNUsvMlA2OFZYOXlyMmh2aGlKbjIyNkNJQjFRRkEwbGFW?=
 =?utf-8?B?Rjd2bTZTSnBCRnZQQnpOVjhsSXNJbTJ2WFVDanM1RG5vOVQyNmJXckJ0NWND?=
 =?utf-8?B?Z3pNN2JPdEhtaUV5K3djNWFibXVHRVIxRUZYSXU0cU5tcEljdVBsWWVmV09k?=
 =?utf-8?B?NEhJN2RsWG5XSWpKMmp4dlRBSmhCTy9LWkxNOE9wdC9ReE1ITnpSR1RualFu?=
 =?utf-8?B?YXhsMkRQWkcxcGI2VVYxUFhwYXNHeXl0dzFwSEhkRlVzVEZEMUxaKzY5UW5N?=
 =?utf-8?B?VHZNNS94KzN6K0dBM2ZIeUhjeDVVMUw1Q21XTk01V3VtV01XbzRpNmJ1WXRp?=
 =?utf-8?B?ZjNPbVZIdlNJTEJoaTJ0bHRhdDhnVDdPTk1XQ2J0SDNNeU9qS3ZleDVPa3JH?=
 =?utf-8?B?a3o0TEt1N0RoY3dCTERHM0x0bW5hS3hBU2FjWlhGbStUZ0FUeXpPa1c4eWFj?=
 =?utf-8?B?VlNCZlJPUVd5ZEdsUjV5cW53aXVqMGVCRFJoU0ZIb1d2VWVwY25Mc1JGUHJu?=
 =?utf-8?B?VTVQZVR5dWR3WFF2NEJzTHlmSWtKcnZicXRlblZjeXZ6MzN0R3ZsT2FzRFl3?=
 =?utf-8?B?QmMwZWdhdEVpdVcvNzVlN2RYMkJGN2hqd3VBNWZvVlo3T2RMYm9wVld2U3VC?=
 =?utf-8?B?eEgvOCtuSS95M01vUmpjVk5naW1lYnpBQWRiWktEMjBsQXlyT3QvbWszRlFp?=
 =?utf-8?B?ZjNoNWx5RVNrOEZFbjk3SnRXdGdUUGZ0dzVnb2NUbGo3VWhlV2FsOWpHd29k?=
 =?utf-8?B?bTlKRmVhMElKbjdsTGhBN2tRVnNhODd5WitmcXJzeWtUbTBBNC83Tnl4Z0xG?=
 =?utf-8?B?VHcyc242bWZtWnk2SmR3TzZSL1B4c2J1YVNIKzRTQXl0Y0gzY3Nkd3VjRmk2?=
 =?utf-8?B?amF3eDlwbjI2TTVubHMwYWlOWFE5eU5kdnhRUm9ZM0tzTytBSHFpOTlNMXMr?=
 =?utf-8?B?SEU5NnJmem1EUmhDbytQWVV6UVNlTEtuQUpjY3RibEdJYWpjNzZyNERWRktB?=
 =?utf-8?B?RDdKdzNYeTJ6bWpWQUFLSFpxYTlJZlBmWWZrZzhrYkNtb2dwNDZQTWhYUG5i?=
 =?utf-8?B?WC9hdG9IbjE5a1RIVWRPdHROTUFTVEpybkxGSWorZ05KV1VmNFcwME05NSs2?=
 =?utf-8?B?NkhGZEZhREVQT29GNklkeWlhVUtWSWEyb0pnR1poSXdqNytFdjhtUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a0d510-398a-4bb8-65fe-08de65acaf9a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:22:28.9581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoLt1TwxuxIHjwMd2g5M8krSFdqZ9EpI/Mipl4jRGvQKj2S+jC4mJ3LmiP4z3TKyXCdHuEZDp9EyxDb7N8T76Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 60A83101BDF
X-Rspamd-Action: no action



On 2026-02-03 13:56, Tomasz Pakuła wrote:
> [Why]
> This function started to get very messy and hard to follow.
> 
> [How]
> Eject some functionality to separate functions and simplify greatly.
> 
> Changes in v3:
> - Less struct traversal in helper functions
> 
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 123 +++++++++++-------
>  1 file changed, 73 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 29e4a047b455..2c5877ed5f32 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -13119,8 +13119,8 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
>  	}
>  }
>  
> -static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> -			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> +static int parse_amd_vsdb_did(struct amdgpu_dm_connector *aconnector,
> +			      const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
>  {
>  	u8 *edid_ext = NULL;
>  	int i;
> @@ -13172,13 +13172,13 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>  	return false;
>  }
>  
> -static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> -			       const struct edid *edid,
> -			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
> +static int parse_amd_vsdb_cea(struct amdgpu_dm_connector *aconnector,
> +			      const struct edid *edid,
> +			      struct amdgpu_hdmi_vsdb_info *vsdb_info)
>  {
> +	struct amdgpu_hdmi_vsdb_info vsdb_local = {0};
>  	u8 *edid_ext = NULL;
>  	int i;
> -	bool valid_vsdb_found = false;
>  
>  	/*----- drm_find_cea_extension() -----*/
>  	/* No EDID or EDID extensions */
> @@ -13199,9 +13199,47 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>  	if (edid_ext[0] != CEA_EXT)
>  		return -ENODEV;
>  
> -	valid_vsdb_found = parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, vsdb_info);
> +	if (!parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, &vsdb_local))
> +		return -ENODEV;
>  
> -	return valid_vsdb_found ? i : -ENODEV;
> +	*vsdb_info = vsdb_local;
> +	return i;
> +}
> +
> +static bool is_monitor_range_invalid(const struct drm_connector *conn)
> +{
> +	return conn->display_info.monitor_range.min_vfreq == 0 ||
> +	       conn->display_info.monitor_range.max_vfreq == 0;
> +}
> +
> +/*
> + * Returns true if (max_vfreq - min_vfreq) > 10
> + */
> +static bool is_freesync_capable(const struct drm_monitor_range_info *range)
> +{
> +	return (range->max_vfreq - range->min_vfreq) > 10;
> +}
> +
> +static void monitor_range_from_vsdb(struct drm_display_info *display,
> +				    const struct amdgpu_hdmi_vsdb_info *vsdb)
> +{
> +	display->monitor_range.min_vfreq = vsdb->min_refresh_rate_hz;
> +	display->monitor_range.max_vfreq = vsdb->max_refresh_rate_hz;
> +}
> +
> +/*
> + * Returns true if connector is capable of freesync
> + * Optionally, can fetch the range from AMD vsdb
> + */
> +static bool copy_range_to_amdgpu_connector(struct drm_connector *conn)
> +{
> +	struct amdgpu_dm_connector *aconn = to_amdgpu_dm_connector(conn);
> +	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
> +
> +	aconn->min_vfreq = range->min_vfreq;
> +	aconn->max_vfreq = range->max_vfreq;
> +
> +	return is_freesync_capable(range);
>  }
>  
>  /**
> @@ -13218,13 +13256,14 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  				    const struct drm_edid *drm_edid)
>  {
> -	int i = 0;
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =
>  			to_amdgpu_dm_connector(connector);
>  	struct dm_connector_state *dm_con_state = NULL;
>  	struct dc_sink *sink;
>  	struct amdgpu_device *adev = drm_to_adev(connector->dev);
>  	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
> +	struct amdgpu_hdmi_vsdb_info vsdb_did = {0};
> +	struct dpcd_caps dpcd_caps = {0};
>  	const struct edid *edid;
>  	bool freesync_capable = false;
>  	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
> @@ -13256,62 +13295,46 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  		goto update;
>  
>  	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> +	parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);

This change says it's a refactor, which in my book should
never include a (subtle) functional change. But we're now
calling this function for all sink_signal types, whereas
before it was only called for HDMI_TYPE_A.

> +
> +	if (amdgpu_dm_connector->dc_link)
> +		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
>  
>  	/* Some eDP panels only have the refresh rate range info in DisplayID */
> -	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
> -	     connector->display_info.monitor_range.max_vfreq == 0))
> +	if (is_monitor_range_invalid(connector))
>  		parse_edid_displayid_vrr(connector, edid);
>  
> -	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
> -		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
> -		if (amdgpu_dm_connector->dc_link &&
> -		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
> -			amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
> -			amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
> -			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> -				freesync_capable = true;
> -		}
> +	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
> +	    sink->sink_signal == SIGNAL_TYPE_EDP) {
>  
> -		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> +		if (dpcd_caps.allow_invalid_MSA_timing_param)
> +			freesync_capable = copy_range_to_amdgpu_connector(connector);
>  
> -		if (vsdb_info.replay_mode) {
> -			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
> -			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
> +		/* eDP */
> +		if (edid)

Same here, I'm not entirely sure whether moving the edid
check down here won't have a subtle behavior change.

I'd like to be either convinced that these things cannot
change behavior, or I'd like to see this broken out into
two patches, (1) a true refactor patch, without possible
behavior changes, and (2) another patch that might affect
behavior.

Overall I'm in favor of the changes and thank you for
cleaning this up. I'm just worried about subtle bugs.

Harry

> +			parse_amd_vsdb_did(amdgpu_dm_connector, edid, &vsdb_did);
> +
> +		if (vsdb_did.replay_mode) {
> +			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_did.replay_mode;
> +			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_did.amd_vsdb_version;
>  			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
>  		}
>  
> -	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> -		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> -		if (i >= 0 && vsdb_info.freesync_supported) {
> -			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
> -			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
> -			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> -				freesync_capable = true;
> -
> -			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
> -			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
> -		}
> +	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_info.freesync_supported) {
> +		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
> +		freesync_capable = copy_range_to_amdgpu_connector(connector);
>  	}
>  
>  	if (amdgpu_dm_connector->dc_link)
>  		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
>  
> -	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
> -		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> -		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
> +	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_info.freesync_supported) {
> +		amdgpu_dm_connector->pack_sdp_v1_3 = true;
> +		amdgpu_dm_connector->as_type = as_type;
> +		amdgpu_dm_connector->vsdb_info = vsdb_info;
>  
> -			amdgpu_dm_connector->pack_sdp_v1_3 = true;
> -			amdgpu_dm_connector->as_type = as_type;
> -			amdgpu_dm_connector->vsdb_info = vsdb_info;
> -
> -			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
> -			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
> -			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> -				freesync_capable = true;
> -
> -			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
> -			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
> -		}
> +		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
> +		freesync_capable = copy_range_to_amdgpu_connector(connector);
>  	}
>  
>  update:


