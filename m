Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C32A12579
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 14:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE7610E6DA;
	Wed, 15 Jan 2025 13:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O1ZWaNq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6D310E6AC;
 Wed, 15 Jan 2025 13:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcjuGGYhEIAdSCzfIdDBaKp9k+RYLiagGiBxiTineCi9DnFzwiYGqtb/IY3oNCgO1S2mJTTSvCrRi2B/70LucW4lT5PgmSgvAy3OFynMzeMnF8YIKyQ6+43OHQOaD+CbCm8jYaY+i/t2OYys07nTf9PFlk3KOaZDuIKbXTuI05BEIhUxIag/HRgyCLUYlNAko5MBRL6GC1EBnIsLVbdCyqbRxQ17FHnHQL5AYFNlWghTk7EvEwUe4svnmH1gz3DTlQg9kF/LmkK2GpqZQxR/dBnMIiSdWeJOUuMPrNbvV6YDJi3kKgOmxpaVdYIOQPCQs7gPD8wmvIr3BMKt0LpcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlvMO0RkGUX7a89Xux5erOm0Sc6hkhlxGd14eaKJlaI=;
 b=CjCzLrCAd0p0n9sq1kxBqGFOG39SIJmUTDNb45V5P8LUrJzXiC1QvrFOhBf+qR5GReu+6XYPpgZuXtoF8RataebUTEr61SI4B0GidE2dbM9TxYLPQaWojjldFIMGuU2+6Outy1glGXN4Ulybjxv38mZC/D7zmMcN9PkLbZI10pLUFgfD4ynscRps2yvkeImxWQTXlUDsb75ZJudMMLgjoYAkDqH+6wnu30aI/vu8B8rjV1SSSn3IqGch19MveQhHKK0VBv1wKAA5GMfe5HVWDj9TlHW+ip/VlQounoX4oVff/B8eoFRNtsxdhQ70BcS+ef8A1FI9fu7le9MuiLF9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlvMO0RkGUX7a89Xux5erOm0Sc6hkhlxGd14eaKJlaI=;
 b=O1ZWaNq9zYWpHwoqeWrNW3a3EtsQ66UPFqYOhEzoZzm5gO931toku3of5OFtbHflfpQ7gPwQWGrdvjSd74vCSOvfphc5OrDrqebva8IrB0kU+QFeJqxx658uwHsZNZ8NO+qg3iuCWRIVJSh6VVRS6Q7jUxnWJsR7pmkEWH/cxxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 13:53:33 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 13:53:33 +0000
Message-ID: <67ca1934-d3ed-41a1-8989-048ec074f81d@amd.com>
Date: Wed, 15 Jan 2025 19:23:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/buddy: Add a testcase to verify the multiroot
 fini
To: Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 "Lin . Cao" <lincao12@amd.com>
References: <20241226070116.309290-1-Arunpravin.PaneerSelvam@amd.com>
 <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
 <875xmggvcs.fsf@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <875xmggvcs.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::20) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|MN2PR12MB4374:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c61b03e-518a-42d5-149e-08dd356c001c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVhPYWRRM1NHWkt2M2MvTzd1ekVZZ1NXKzBMbTZnMTlxbGVtdmlFby9sVXMw?=
 =?utf-8?B?WU5wQWtrK0NqYndWbXhlUTRhYU8wUnp3ODc0OGRPMUIwTVpPUFErSk9RRTli?=
 =?utf-8?B?ZE95NlNiU2RQb0hBbE9pR0YzeEExRUFRclhNcExoSS9yU1J1YXlMWUMzWXFa?=
 =?utf-8?B?bEpxY2NFN0V0Z0M3Qy9SOFJicWhnckRPU0ZiYTRrOGRZcjdlSlR1YlB1L2NQ?=
 =?utf-8?B?cUlwWGhjTGNXUWtSYUE0QkRvWE1hU1h6OFlFS2F0QWRDVDZuZzZOTjIyMnJ4?=
 =?utf-8?B?TUpoamNhYlRSdGh6OFY2ajd5MHQxMFRocTVMUklHUnQxcmNXcFlHMExJUENJ?=
 =?utf-8?B?M0ozMEdpaGNOM0dTV2VuRFZIZG0xM1dkL2hNQ3FLbzB6bnhpTCs2bWJpczBy?=
 =?utf-8?B?cVVNUDBnR0QyYnFZU2ZsdWVHbVRqOC9INDVzRG1sUmZhWXpBTU9vY2lSNWpt?=
 =?utf-8?B?dHh5NGpVS0Z6dzdLTVB0NXhGRTNtNFMyVC9KWTBBOTdPZkNSN0JRNjF3bzhM?=
 =?utf-8?B?MGZ6cS9obzJJWEFzWU5ydDI2WlhwN1FFR3E5bWcxYVZPRkJxWXJMcE5CWE0v?=
 =?utf-8?B?cXdBSGlDODh6VzVRQ1VRczVhQ29OOVAwaGlNUmVzSVVhQ2oxa3FkaDdLcXJ0?=
 =?utf-8?B?YUtPTzU5amc3UHFON2R4SG1VMTNtOUlCUzY5WEtEaWlZUmFKSUZUNHd2UzZo?=
 =?utf-8?B?UlpRS0N0YVVIRXhhQXV2Tko4TUk1VFpUc1pOSGFSUEZScTQyV0R5OElqaEpL?=
 =?utf-8?B?WWdNZUo2MUE1a3VONDg0Q2JiaDJ5d2IwUFNmMVExc2x0d3J3RzdSVGZKU1Ir?=
 =?utf-8?B?ckM2dmc2RlRxOU05bC9NMmVmSFpwanU0VDlOQ2U4bHpGeFQzVWU2YVl3YkVu?=
 =?utf-8?B?bjhZeE1oeEJ6dkZxYXVDMDlFL1hWRDRyT21SS3Q5aVV0dlNzMGlwTzI1akNx?=
 =?utf-8?B?bWs5N2kxbDM5em9Ndk5LcWJtTmFTVm1mSzBjNkk5bWdhSkQ3YnFMQnhJa2du?=
 =?utf-8?B?N0NpQmpsWk1FOEkyN2dBNnpqZGFGM3hUWFpLRDlncE8rYWs2alpnRHBuQUhl?=
 =?utf-8?B?UXAyRDdrRDZtUXJ3ejhzL3RISW8ycC9ZeERDQVVvT3d0R01xNHI5N1hLMW8y?=
 =?utf-8?B?MDZ6QlNFdnc1elNRQk4yOEl3ZThBeEovTHRIakhYYVdnZ1hKZkJlRnFDOWta?=
 =?utf-8?B?UkNlWExTZ253RnJRUHoyc1k5aXBoeEt0dDRLTkk2c2cvbjNuV0kwMEhRUXVi?=
 =?utf-8?B?S1NJdFlCVzhJKzJRcUphalRpemk3VHNpeUJIOHBMVmxjUHU2eUJEMnVzT3Rr?=
 =?utf-8?B?SEd0RlRCOHdGRm9kOWlsZVVEV2wvb2Zsa0Ridk9CK3c2OG1ybWRJdWcwbWk4?=
 =?utf-8?B?OEk4dThWWUhUMTIrOGRjMC91R21JMy9zeHYxNGpITGJJTUtsS1lZMGlhSEtq?=
 =?utf-8?B?dnJUZFl5RmZmU1hrRmlKOGNEZHlLLzZqb1VFclE2RGVEdzRtQWNNOVN2aDZN?=
 =?utf-8?B?dmlBU0VRRDg0eGRLK3FwYVV6cGpBZG9WT1FUVFhHUHJxWFlnYjdTdFdrWE05?=
 =?utf-8?B?c08yakVYbThpTFU5TmpzVXpwSnA1NlRacnBFOThsMCtSMHRlZjBVZHFYb3Uw?=
 =?utf-8?B?VERlSlhWQlZpTFh1ZmdmbzNwRENDdjcwYU1BYnhBZWpZMDBLeHcwYzhEQ1VY?=
 =?utf-8?B?Y0RoSXIxYWV4TFNRdkNzc1V0MFIrZzJkWG5OTFZnWUs0VjRxMmROOGJJN0pZ?=
 =?utf-8?B?VWk1Y1pZUjhUMmFVVU56UEtwNDFlRFBHU3AwTndtUklXNVo3TTkvOE02L3Ra?=
 =?utf-8?B?VHFvMnFVRVBpR2JCVEQxUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3p3T3dNc3Q2M2FtTERHYjVxSmdWRS9kVEJNV0w4N2tGbkc1T1BCbVVJU0RS?=
 =?utf-8?B?aTJrKzd2MEFGL0RBMXB6VTFCZEwwemFTRXVrZHlsdDVhVUZqWmtEN2ZmdXIz?=
 =?utf-8?B?aWJoN0t2TnRvYW5ZakI5aGVKMExreEJkRThiWnV5bTd6RzVVSTVhaUtmUlNE?=
 =?utf-8?B?RCtSbzNrbXBaQnBZeEVoNjhiOExLK1RDWDFCVS9wZWZiUkVKbHlxendOSHBN?=
 =?utf-8?B?ODZUZXJaV3RMMEd0U08vUjhkNkNYYXJSRzVRRTI1a2VBMjFGM3lGTFRLOVBv?=
 =?utf-8?B?d2hsNmVOMXY3eW9DcFhTMmxrQUdCcFF6bzEwblQ1Ty9INCtmbnV5MWtHckFz?=
 =?utf-8?B?NWRlOE9TZEh4NmwyMDM2dEgxdEQ4eVJQR0xLZlpEN2ZEQzdLbEEwNUFkeFVp?=
 =?utf-8?B?LzY3Z3ZPbFcxQnJCNGkzWVg4TDl1MURMRVRWMU5acjNDdDVzK3loU2lsalIz?=
 =?utf-8?B?dEdkajhwZVNVTC9EYzU4WUMrOHVUQUJtZW82aWFkMG9xcXZSVnZ2aEhOTDF5?=
 =?utf-8?B?OEhOYmdPdEhRK3pBdFFycy9xb0toQVFibkF1dE9oL09CMHk2alJzRzZ2Z0d5?=
 =?utf-8?B?SXU1QzB0MFZtR0NQekxoWVEwSjdWT1RnOVo1bHpET1RYMGtQSENlNFY2RkRQ?=
 =?utf-8?B?eEJjUFIvT243UU5ldm9KWmU2bjlCOW0zMFlrYm1uSUlHQ0QzN204aTBCMS9s?=
 =?utf-8?B?NGlsenpmc0pKOVJXT0MzWGlWVU1jdjZYSVNPNGYrcTlyajRMZ0hEdlZsVWYz?=
 =?utf-8?B?WXRSalh1b2x3QUhJdGoraGFsUXU5NmRPWGxZNEF5Y0JNRVlmT0ZIUlN0elc4?=
 =?utf-8?B?dnVhc20yZU16WlpjdTZnWWZFUEhiajF5blgrSWhWZUdBRHliS2xkeVVmcUtJ?=
 =?utf-8?B?U25LSGhCMGp1VmhvOURFblBLVDRGK0JEU0tLWFVqOTgvZm5VOVA0QU1wZFJO?=
 =?utf-8?B?Umo4MHFoNHlCeUFZb1VJM3RYR0lJRnIzTWp4TXlaaXp3Q3hoQjFLaEpYaEpG?=
 =?utf-8?B?MnBOSDF5NCtQWklQTVZRWDc0VUhLckx5c09vV3JFdGhqTVNLMmVmNXNnRUJs?=
 =?utf-8?B?Ny9wS1hSdm4zWVRwTmFSTGhHbzZ5bjRYdU5qNXpHaWlheGJxMDVvNXJ5VmNG?=
 =?utf-8?B?OTNCNWprU0htVi9NMFdVN2daOFdxdjdpZlYzR2QrbXA5Z3JHaFFMSVVWZ3Bh?=
 =?utf-8?B?UjhicUgvQmQrNTBSSTJubGV1aWZuZ0NYekxjaDNEK2I5eFAwVmxQOFV1ejhz?=
 =?utf-8?B?cHp3RDUxY2g1U2QvcGp4amNXaWo3QytOMW55emhwZWpydTlrcE45YnljSTRZ?=
 =?utf-8?B?NFBvbnBYdGl5czVLcmRrREhGSnFReU5qTFlTRkVINnYwSFVreGZwcFpUcXJr?=
 =?utf-8?B?MEhEU1dRSkQrWm10eVhCbmdNSUt6WWRsQ2tYeEp5YlRzdnJyM2pEUlgwdVZi?=
 =?utf-8?B?VGdLSW03Q1VmRG83eExKWmkxK0QvcklNZHZiTWxnSmNWODdCOTBqMDlFRlFh?=
 =?utf-8?B?NEpmRE1yVGp4T2tkblE0TGZtN2VtWkoyTnFBLzlTL3I1eGw3NEJoZy93cENO?=
 =?utf-8?B?V1ZmRGlsZW0zVzFYS1dyaHZlQnp0YjdhWWdKQ253THJCaEROZkp0WnY0QmRE?=
 =?utf-8?B?Wnhsb2NlaGtQZnlsUll0MnRwRkU3dTJGay9wUlFsYis2a3JNRklsQkl6TTg3?=
 =?utf-8?B?Y2ZlMndzNWVGTGNiUTllTHdDLzBXekU2TlBRS3ZnRHJsa2ZwdGM1UzR5Mm4r?=
 =?utf-8?B?R1hGVEtvWTZ5bWtxWEtkWVZTbjhobWhHendodHNEZEpmNFRmTjZpdFRveEZU?=
 =?utf-8?B?aS9nbUVLSmZUQ3lpQUlaUHdoT0ZzZGhCeHltdWc5QkhDYzdyRkEvMEdzZE9K?=
 =?utf-8?B?RWlFRUhTQzE2cEpPU2FSMm9JMTlleWd3SXB6ZEIwMzdVMDFON3huYkRLb2d3?=
 =?utf-8?B?dnJzUlFIRGd1aFRHcjZHMkZCNWh1dng3TXVDaTU2eW01TVBKR1Rac3BGa3dv?=
 =?utf-8?B?MVFBRkNwcUtXS2tFbUwvZXRRRWFhV2hsUmx6dldNaDM3N1YxQy9ZaXZWV3g2?=
 =?utf-8?B?K043MFg5Z3pScUlmQW9PQlA4U3I5bXUrWFAwVzdPbmRROGpUbDZMME9VVzVV?=
 =?utf-8?Q?61x9jxa9ZLCLVPsUxX2d7NPqM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c61b03e-518a-42d5-149e-08dd356c001c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 13:53:33.5326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSuF+NgW6clROThxgyybSsMWQTaSp0svZJOZSPdmw1jOKybzUO5zPuR1kkxVQacUsoNq0fVY5uQ0VtUxr4p4NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
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

Hi Jani,

I merged the below patch into drm-misc-next, Please try rebuilding the 
drm-tip.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=00728273bdf1001f8d2f7b65bc398000d7defe0b

Thanks,
Arun.

On 1/15/2025 5:08 PM, Jani Nikula wrote:
> On Thu, 26 Dec 2024, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com> wrote:
>> - Added a testcase to verify the multiroot force merge fini.
>> - Added a new field in_use to track the mm freed status.
>>
>> v2:(Matthew)
>>    - Add kunit_fail_current_test() when WARN_ON is true.
> This i.e. commit 8cb3a1e2b350 ("drm/buddy: Add a testcase to verify the
> multiroot fini") fails drm-tip build for me with:
>
> In file included from ../drivers/gpu/drm/tests/drm_buddy_test.c:15:
> ../drivers/gpu/drm/tests/drm_buddy_test.c: In function ‘drm_test_buddy_alloc_clear’:
> ../drivers/gpu/drm/tests/drm_buddy_test.c:264:23: error: unused variable ‘prng’ [-Werror=unused-variable]
>    264 |         DRM_RND_STATE(prng, random_seed);
>        |                       ^~~~
> ../drivers/gpu/drm/tests/../lib/drm_random.h:18:26: note: in definition of macro ‘DRM_RND_STATE’
>     18 |         struct rnd_state name__ = DRM_RND_STATE_INITIALIZER(seed__)
>        |                          ^~~~~~
> cc1: all warnings being treated as errors
>
>
> BR,
> Jani.
>
>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c            |  6 +++++-
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 29 ++++++++++++++++++--------
>>   2 files changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index ca42e6081d27..241c855f891f 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2021 Intel Corporation
>>    */
>>   
>> +#include <kunit/test-bug.h>
>> +
>>   #include <linux/kmemleak.h>
>>   #include <linux/module.h>
>>   #include <linux/sizes.h>
>> @@ -335,7 +337,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>   		start = drm_buddy_block_offset(mm->roots[i]);
>>   		__force_merge(mm, start, start + size, order);
>>   
>> -		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>> +		if (WARN_ON(!drm_buddy_block_is_free(mm->roots[i])))
>> +			kunit_fail_current_test("buddy_fini() root");
>> +
>>   		drm_block_free(mm, mm->roots[i]);
>>   
>>   		root_size = mm->chunk_size << order;
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index 9662c949d0e3..4b5818f9f2a9 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -385,17 +385,28 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
>>   	drm_buddy_fini(&mm);
>>   
>>   	/*
>> -	 * Create a new mm with a non power-of-two size. Allocate a random size, free as
>> -	 * cleared and then call fini. This will ensure the multi-root force merge during
>> -	 * fini.
>> +	 * Create a new mm with a non power-of-two size. Allocate a random size from each
>> +	 * root, free as cleared and then call fini. This will ensure the multi-root
>> +	 * force merge during fini.
>>   	 */
>> -	mm_size = 12 * SZ_4K;
>> -	size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
>> +	mm_size = (SZ_4K << max_order) + (SZ_4K << (max_order - 2));
>> +
>>   	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
>> -	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> -							    size, ps, &allocated,
>> -							    DRM_BUDDY_TOPDOWN_ALLOCATION),
>> -				"buddy_alloc hit an error size=%u\n", size);
>> +	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
>> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
>> +							    4 * ps, ps, &allocated,
>> +							    DRM_BUDDY_RANGE_ALLOCATION),
>> +				"buddy_alloc hit an error size=%lu\n", 4 * ps);
>> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
>> +							    2 * ps, ps, &allocated,
>> +							    DRM_BUDDY_CLEAR_ALLOCATION),
>> +				"buddy_alloc hit an error size=%lu\n", 2 * ps);
>> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, SZ_4K << max_order, mm_size,
>> +							    ps, ps, &allocated,
>> +							    DRM_BUDDY_RANGE_ALLOCATION),
>> +				"buddy_alloc hit an error size=%lu\n", ps);
>>   	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>>   	drm_buddy_fini(&mm);
>>   }

