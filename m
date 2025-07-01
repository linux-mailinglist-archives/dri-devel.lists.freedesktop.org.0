Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1BFAEFCB7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 16:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1854210E5BF;
	Tue,  1 Jul 2025 14:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Af7LnEvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77F810E5BE;
 Tue,  1 Jul 2025 14:35:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjWqrWMcff9WjaL93n1hp+QBwcMLUbX0eSsDcDuYNc5KVVEtkRP7TN2L5Livbv8B/z1+ph00xaJRZWSlxPma1a1OAnYwdvsRrAIOGvktF2kEzQup+PvXhZh6RQq10gapJHR7VUvz+ReJwB7JOAJV/ErABje3VNp317EOvRlLVeY+Kj6VAqOGrmUa4PUk7CjGGbA1spVVMOJ5x0rlpWvIuPKqQRj3Z4zfQbIU1/59xAPzG0+kd6ufL6V7hfUZHN6i1OKmPlBzwPnF0qessOKPFaTK+KZDChIxF2xxQNoUxZyn+ReG7LBThsUm1fLSDfOrWFqvlMwheIWF3Tp9SQu2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ro25UhWyHdCLUg/ycmKMFEORuFFotCTL3u4781vAIe0=;
 b=bNKVN/PiAIL+dtj8d3RA27RSwkzKdZH7xL1xxpSPOak4ZdRaOAcoEySZQDoKh0zASrE3rePZzdmpBdBe4h5yWdMRWIt1bQ8gaX17l9Ie7rtfdFmZ3USJI7/X9edtAYavOvh3WOGTwpQNrRdbjCnLCo+QXhZKKgeryjQc7JoTdRDYSSnn1KDtkmb3QejqbfvvpF+osQF6Gp45ckk01iwmk/mFyhh69SfcjwaKJCniSFcKv1UBx8amPGrZkopq3/54pfZIK0Ub2Blqfmg5kqPxQK90gqf9jQdROse12ZlzDvPpWuBdHyLOZQRQMG70a1FD4s0851lZl2PzS6XCGNE8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ro25UhWyHdCLUg/ycmKMFEORuFFotCTL3u4781vAIe0=;
 b=Af7LnEvf3maH4WPwo1cZ16w3psIqxNLbZRePF+iYWj3onx/7AkFXkEUM457VfZOaey26rMtEThAJFyxxwNtBE0esvUOaqeg0pEMVLcWEYp0yoJciEPCD8m/rzsFOAlT7K0MJK/K2uRaECujgIuhImevS6uCDjI8r5jPkwiyuKTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 14:35:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 14:35:48 +0000
Message-ID: <8f0c1489-df00-4d40-a51c-39dcfa185d3e@amd.com>
Date: Tue, 1 Jul 2025 16:35:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
To: Raag Jadav <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 David Airlie <airlied@gmail.com>
References: <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
 <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com> <aFsaXXKZSBPrcYJb@intel.com>
 <aF8PZMuMgmWKYJgo@intel.com> <4a2bead2-3db6-4526-b980-712362b6e770@amd.com>
 <aGLKgholpl8Z3zWm@intel.com> <cebd70d9-57b5-4e89-b715-4ada250e2eb1@intel.com>
 <eb143cc5-306c-4900-b391-9ee023c1c5b7@intel.com>
 <aGPvbagza6HwF4kE@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aGPvbagza6HwF4kE@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca805e9-7ca5-4a11-0424-08ddb8ac91c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZllGdndUcnAzMnN2OHYrOXFTRGNNSmhWYTFDTzZkdWNnbjlEZnNzL0oyL0Np?=
 =?utf-8?B?R0thNGh6QUh2MUY4TENwUXhwTFRIaUo3MzlmcC80U1dTR3hKajdXekZnSk1P?=
 =?utf-8?B?b2xZVDZaQk11WnpHNXlkM0ZDekdBbEZvc3A0d3NDQk5QWFJtQ1VicS8yOEFM?=
 =?utf-8?B?TUI2anQ5RGswTjJtblBNTnRNRjk1aldSZTh6dm5yZENxVkxDMW9MMThjQkc1?=
 =?utf-8?B?Qy9tYWhObE8rSDg4N2dZYU92UnNVeXVvRGErY0ZHNU14MXc3Um95ckVoU0Na?=
 =?utf-8?B?c2ptemd4bGhIK1RjcjhSdjJ2ZFowb0g1aE1PUWp1bWM4VWZETmhZcGtFUmhJ?=
 =?utf-8?B?MDhtbWFVV01takYyR2V5OEVWNzB2TjlLdm1TNHhnbHFHdEQzYzAyb2N0YjRS?=
 =?utf-8?B?bEo1aUI3amFzdnZIMGxQY0phbDkxSTVnY0d5R09KbHE5UExZejJxbGhRNm5h?=
 =?utf-8?B?TEh6b1Zvb3hWa283Vm5MQXFrbFd1WVZPbU1xaW5TRnh3TWcwN05wYUhyUnFU?=
 =?utf-8?B?RVA3OG9ZZllJOW44VDBXT0F0RTl0M3R1NldVa3hCQjNUTVcwRUZ5TEJNbEs2?=
 =?utf-8?B?b2dsVE5vaUxnVkdTbE1IOUYwUTRZSE5TcnVlcnV1aXhPejZNZXJwZGZxd3Bx?=
 =?utf-8?B?UTlIaG5pcVg2emhOem1zMVRrWTNoemQyN3FWc2VtNmNaNWRRcXdMa0dJWnRN?=
 =?utf-8?B?MHdaMUEzODFCd3U0Sno4OWkybjFYR3pYVzZwbXM0QmRicTNDU1gxNjBuN0Ux?=
 =?utf-8?B?Yk11Q2JJZkp3bUhKR0VpVDhQRUFQaUx3T1c4ei9nelFvWTkxd1hIQVRBZ0ZI?=
 =?utf-8?B?UlJtcS9OUy9EVlZWa1BSb01RMHk0U3paaUk4ZXU4Z1ZkNnZDTEpiN0JiZUNq?=
 =?utf-8?B?Nk9UQVZpRFVnSFN2STU4K0gwcGFkdzYrSi9sdjJZejNSWXMxajhEaXcxKzJ2?=
 =?utf-8?B?b2lVK0RacmlHNU1pczJPckJ2OFljY2JUeE14b3FqT1lkVjFTaE1WbVRxbklM?=
 =?utf-8?B?d2VWZ3dTUEVxYlpoK1B3WDBHTkQ4cHFjcDdFc1ZMcmZ6emd1NlhmSzZ1WUZV?=
 =?utf-8?B?VFoxNWNMR1pmWlFDL3c3Q2dmR1IzK0xWaVA2bGExVXB4bjdUSTF4eEQ3QXV0?=
 =?utf-8?B?TmNCcnVsVVdaNnR5TEl2amYyZTk5OWV3RHhtWXB6dHdQMEVocWY5SHZKZXcw?=
 =?utf-8?B?NW9zR1RGS0tJa0o3R240b1g3ek5RdW1TZzBoQjV4L2VtVFc0V1FCczZLcFdS?=
 =?utf-8?B?Z29ubHVVZlltcitFMGE0YzEwSzJEekZUVW1sVkN4d2RQSEtRYWU3VzMrdXl0?=
 =?utf-8?B?OFI4YjZsWGphc1NyVVhPTENkRVJLMDI5ZlIrUzhLa3NpdTJLRTg0Ujd6WFll?=
 =?utf-8?B?T0JQbTNMM2FabmJmL214b1Rtc0dmSHJCaUpOcWQ0NnQ0U0o2em1ZbWRibnZW?=
 =?utf-8?B?Z05nZVpzbzVGbVk1YmhKSHFiWUhDZlJzMyt1QWI1bWtVQ3NzTkJvd2x0cmpQ?=
 =?utf-8?B?cGgwVlc1RmFpa0NPS3lFYjRVc2JpemoyVTE2cGV1S05sVGlaM1hMYWhVTml3?=
 =?utf-8?B?NlllQ09SVTRTNXJQbG1Oc1FjRGVDQmhoa25qYlA4TDlWNXJsQTk4a2M5S2JW?=
 =?utf-8?B?MUM3R2VMZElzcWFvV0p6ejhSMDdLZ0N0MHoyaFNGSm1QKzhnTDZmS3pmYXBI?=
 =?utf-8?B?cnl3RmJ6ZHFFYWplREFDMFZTNzFqRDN4WHRuclBNYkFTRGFlNkJ5RTdIeHRz?=
 =?utf-8?B?dXdKTGJaQWdKZjVyc05DWEYyaWFlcTlYU1FIL1lQdW5GNHpjeVFNZUJwU3pE?=
 =?utf-8?Q?EpbWOhPNTBymUSex1JqOXlh6I+y2c/X5N8ZI4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eklNa3lZTG1ETUo1MVZvd3gxdjZra3JpbFNwTHIwbWRQNHhTdGRNaWUyaTBS?=
 =?utf-8?B?VHFJTzNPcFdMa1lFMGszVUxnNU9jWmVPS2NPSXc1VFdiaDdUdTVnSldDdmpZ?=
 =?utf-8?B?VXczU2ZHU09nZTFjMUtMKzdIWFdhaHppUThIYWp5Q21FOXFhTHdyNmxjSjVk?=
 =?utf-8?B?bzYrRk5DMzhxdTVadjliU05uQlhhZXdLeHI0MTZkYzViczN5aTh2ZnNmYkl6?=
 =?utf-8?B?d2dmWXBoTDBpeGRNUVBWOEpXMFBYUkhDY3ZiN1pjMmZWUlVrS1lYWXRDeG1r?=
 =?utf-8?B?UXBnVFUvVHVpeU9ERStOTW1NczBhV2lEZHFrNXdTQlorMzFWdnBpcHg3UmdD?=
 =?utf-8?B?WDJVTjl2YlpScjJ6WGYwK0ZKQnp2cWdFdGVKYmZoZ0wrZkNPS3RqeHRzTmZa?=
 =?utf-8?B?dFNMekdHc1BxZldDVXpvL2pYUlRxdE1aZHgwVFlPUUFzY0xFQU9Kb1hFSXRm?=
 =?utf-8?B?dmhwbzFlN3R2TEhZSENrZjNDMXNoRnF5WnhZMWJ0WTJyV1pQTXVKUTlWQXc1?=
 =?utf-8?B?eHlTcVZLQnc0QXNLYWJGSlZ4REw4TjdPcW1iME9mTk1TR0dCSjlvZHJCZmhj?=
 =?utf-8?B?UWZuTHdVQys0VWJOdGJxRVQ1T3dDdFN3TnpBQklHMDI2N2diRDRqQ3hBWm9E?=
 =?utf-8?B?TDZLZUg1Smd3L3hpcmY4cDh2R0o1UFpKRVBod0MwM0tYVDE0QVJCWDM3dlda?=
 =?utf-8?B?cWNpZG9EaSs5dmpSV0RPTWZsaGVOYjZTdG96eDVnb1NHcW9rZnlVaTAzZVRE?=
 =?utf-8?B?dzJaYzBYNUgydkNjNGdmcmZNdk84RjZtSWZTcjFiVjFNSEhCbUF4dkJQUjZo?=
 =?utf-8?B?aXI2UzJGRFFkV1g5bVl3eWVIY1hkRFpiQzJXOS8va0VBN2M5SVNZN1dCRW1n?=
 =?utf-8?B?WGpROHIvVGF0ekxHQm44SzJ6ckwwNnRmWEhYdEZFenJnYmlhM3ArVFY1Z0Rz?=
 =?utf-8?B?Rm5SV01XYzJtd01GSC9uZVlsNFZ0NXJuLzg1N2t6Y3FWVnFCaUdvNHNUOUlU?=
 =?utf-8?B?UERtTXl3aVZXZ2owdmI0R0lCVDdVL3J4Z3hnZUpRRXFRYzAvWTdJRC9qbksw?=
 =?utf-8?B?QVZydE0rL1lKYUpuelROKzVxWVpzTEMxa1ZCQmRqL2QvN1pncjhOanMva0VU?=
 =?utf-8?B?U3ptckZMWmdHNTJ4bEd2a0xyUW90SnZQR2NsYVh3T1BSM21XU1dpZmRqT1N3?=
 =?utf-8?B?NzJEN3VBQ3FubnhRZjhVTGhMb3NEYzF5VEVFWGVjU3hFR2pGcGFpdytvclVu?=
 =?utf-8?B?KzB3TDAwWW9xNHE2eEpicW4rWHk3WGthbHpqZXFKZExVQWd3dXhINkdqNmRB?=
 =?utf-8?B?ZnllRk5OWFlQMmRVNWhpcklnY2JNcnMyaWF4RUlKaWZiTHRoeTh2bkFOSGlR?=
 =?utf-8?B?NkZXcnkzbzhhVHhUcUoxMlhaM21ZaC80ZGFwNWRndmc0SUJUZmhCUzhYVjlY?=
 =?utf-8?B?aEMwZlIrek5OMlRMYXdCdjF6QXlRYUlNc2ZrMjlZcVNFQmZOUGNjbFRNamUz?=
 =?utf-8?B?b0dkMUVQVnNUL1VTTGxEWnRSTWZXdjBSbjVzVWVUcDZKVlNrKzJTa2x2SXlT?=
 =?utf-8?B?VGdacnp3M01wUW10eDZXU04xWlJxdTlrSWZaUlFycjRpNXhmL0tETDVPcjcv?=
 =?utf-8?B?YzlsTmx0aUFXVFptU3poWGhKU1NjeEJlalBNWG9mNU9ZZU4wR0JGUk5kbHRQ?=
 =?utf-8?B?ZnUrY1VZYUpCd3pSU2pVVWN5MSs4bm13aDdUZVo5d012SU1DbjhFQkp0bFVS?=
 =?utf-8?B?cE9qbFhUL1BKU09qVkdVRzlldUQ5a2IzbmREdGJJTE9yVEh0emNHbFlIQUxp?=
 =?utf-8?B?blJEekFBK0dyTEFmeW9BMkZiNHFLYTNXTDRxVWlQeGhBTFF0bmluWjk3RnVs?=
 =?utf-8?B?anViY2lzMXdIU1JDcjM5L0JOOUhqU3VqM3NkUksrTjZqM2xrNDIzYW5jM3Rz?=
 =?utf-8?B?VVE3dnpRUjRSWnMxSllEaHJIbHFUclg2U0w5cFNtVm5CUUpBOGZzK0loK2cz?=
 =?utf-8?B?dFYvd01YckhsMXExeWlUa0h1aTYzdllPdFpJMFhNeXd1T3IrVFkyYmFEamg0?=
 =?utf-8?B?ZU5jekhrSFcyc2l3Uy80ZVZ5bEpVSHFGVjVOT1JXQU9hQ29mVVJraVQ1UzFH?=
 =?utf-8?Q?WurPomHONBVHPfw+GovmJSctS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca805e9-7ca5-4a11-0424-08ddb8ac91c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:35:47.9334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /k0aZh0xOB/Snw62iLVw+5oG6gJkLPyrFW/sGnWt9ebw2xl0gG7xgAGf22DSu1Un
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527
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

On 01.07.25 16:23, Raag Jadav wrote:
> On Tue, Jul 01, 2025 at 05:11:24PM +0530, Riana Tauro wrote:
>> On 7/1/2025 5:07 PM, Riana Tauro wrote:
>>> On 6/30/2025 11:03 PM, Rodrigo Vivi wrote:
>>>> On Mon, Jun 30, 2025 at 10:29:10AM +0200, Christian König wrote:
>>>>> On 27.06.25 23:38, Rodrigo Vivi wrote:
>>>>>>>> Or at least print a big warning into the system log?
>>>>>>>>
>>>>>>>> I mean a firmware update is usually something which
>>>>>>>> the system administrator triggers very explicitly
>>>>>>>> because when it fails for some reason (e.g.
>>>>>>>> unexpected reset, power outage or whatever) it can
>>>>>>>> sometimes brick the HW.
>>>>>>>>
>>>>>>>> I think it's rather brave to do this automatically.
>>>>>>>> Are you sure we don't talk past each other on the
>>>>>>>> meaning of the wedge event?
>>>>>>>
>>>>>>> The goal is not to do that automatically, but raise the
>>>>>>> uevent to the admin
>>>>>>> with enough information that they can decide for the right correctable
>>>>>>> action.
>>>>>>
>>>>>> Christian, Andre, any concerns with this still?
>>>>>
>>>>> Well, that sounds not quite the correct use case for wedge events.
>>>>>
>>>>> See the wedge event is made for automation.
>>>>
>>>> I respectfully disagree with this statement.
>>>>
>>>> The wedged state in i915 and xe, then ported to drm, was never just about
>>>> automation. Of course, the unbind + flr + rebind is one that driver
>>>> cannot
>>>> do by itself, hence needs automation. But wedge cases were also very
>>>> useful
>>>> in other situations like keeping the device in the failure stage for
>>>> debuging
>>>> (without automation) or keeping other critical things up like
>>>> display with SW
>>>> rendering (again, nothing about automation).

Granted, automation is probably not the right term.

What I wanted to say is that the wedge event should not replace information in the system log.

>>>>
>>>>> For example to allow a process supervising containers get the
>>>>> device working again and re-start the container which used it or
>>>>> gather crash log etc .....
>>>>>
>>>>> When you want to notify the system administrator which manual
>>>>> intervention is necessary then I would just write that into the
>>>>> system log and raise a device event with WEDGED=unknown.
>>>>>
>>>>> What we could potentially do is to separate between
>>>>> WEDGED=unknown and WEDGED=manual, e.g. between driver has no
>>>>> idea what to do and driver printed useful info into the system
>>>>> log.
>>>>
>>>> Well, you are right here. Even our official documentation in drm-uapi.rst
>>>> already tells that firmware flashing should be a case for 'unknown'.
>>>
>>> I had added specific method since we know firmware flash will recover
>>> the error.  Sure will change it.
>>>
>>> In the current code, there is no recovery method named "unknown" even
>>> though the document mentions it
>>>
>>> https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/gpu/drm/
>>> drm_drv.c#L534
>>>
>>> Since we are adding something new, can it be "manual" instead of unknown?
>>
>> Okay missed it. It's in the drm_dev_wedged_event function. Will use unknown
>>>
>>>> Let's go with that then. And use other hints like logs and sysfs so,
>>>> Admin
>>>> has a better information of what to do.
>>>>
>>>>> But creating an event with WEDGED=firmware-flash just sounds to
>>>>> specific, when we go down that route we might soon have
>>>>> WEDGE=change- bios-setting, WEDGE=....
>>>>
>>>> Well, I agree that we shouldn't explode the options exponentially here.
>>>>
>>>> Although I believe that firmware flashing should be a common case in many
>>>> case and could be a candidate for another indication.
>>>>
>>>> But let's move on with WEDGE='unknown' for this case.
> 
> I understand that WEDGED=firmware-flash can't be handled in a generic way
> for all drivers but it is simply not as same as WEDGED=unknown since the
> driver knows something specific needs to be done here.
> 
> I'm wondering if we could add a WEDGED=vendor-specific method for such
> cases?

Works for me as well.

My main concern was that we should not start to invent specific wedge events for all kind of different problems.

On the other hand what's the additional value to distinct between unknown and vendor-specific?

In other words even if the necessary handling is unknown to the wedge event, the administrator could and should still examine the logs to see what to do.

Regards,
Christian.

> 
> Chris? André?
> 
> Raag

