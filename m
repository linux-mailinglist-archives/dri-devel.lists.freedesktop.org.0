Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B7B16289
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 16:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3238410E6B2;
	Wed, 30 Jul 2025 14:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VZutLyes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A5E10E370;
 Wed, 30 Jul 2025 14:20:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcyENe7NBg42F5jhE/UIpPOidVd5Mjy2yhcXD+R1GXaHfe2D+Hx6CtmcwmqDNmnRVf6Qvw12uIlryWDvpoMG8R9YRuhf5jQD1biXrgjSoWqddJ+tfBax0iGTzdW5Z+c0grYopsY0J8Fn7kNG0eiP+IDmwPXQAZj9zcU89PrSCWLxp6uVOodXiVI+T3lWIC512LRTMT+KGaUOaTJ9b7o6+QU0SV7trG+tU5CeznzY4AhbmtNtzy8J7x7wmJlaU/lG2dauWgDuw4BWVhHVngvajfvJZJidgCfyPsT1T0z6feJZapGBu+cXTSyE5l0YMJgh/QDxhHueRyqroM1tTzj/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZpBK5QowW1jtn8lt+i+WZWYwNAmrHyqWCo2lTnus34=;
 b=Ng3HhmGIzP9FviBcVRGKbrxsJTF4SljezoVc2wmnGiwzPa2gtFZIv/u1eUvVF4ttcHiDXTkJJt+Yi54bvPXyKH6ysF2z2kuDOSjoJcuG7qynBJkc0cQ+Ids7oOauWOz5Fx5e22YIhT1C4jDocnlmI7Z5YDuOVztCCprLzuTwnTxyqz43HDIYGkmUbfMGNfUOA3EngpGQjEaWRoCC9OCr6891iZ0TAPGIVRWWIQaKuLHhQlf9g23NmjkDEaoUplimKykXY8LjeGXflf6C74akqq4uFJqOLGHYj/ljo+vxxQgtV0cwgVAw38l/T2zqULLsSkRSTUaBRrBFeAY1kwnh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZpBK5QowW1jtn8lt+i+WZWYwNAmrHyqWCo2lTnus34=;
 b=VZutLyesUB016GYJ/GKSCKlkjLWUTLlSL6s5Oe14iSJAx9lBsvwfeBe+xdv4gUnfChZ7dVM9apayaFVxYOUUZKpmMLk7iztUm4wUe+gW87sQX7mGmxeGa4itL2yiRHltur1KFq2Ia2HMsRGD+aAdgHSo6wN0JhCknhMAYxnio/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY8PR12MB7634.namprd12.prod.outlook.com (2603:10b6:930:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 14:20:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 14:20:00 +0000
Message-ID: <4eda0fa6-a92f-4a26-8c9a-c7ef72becde6@amd.com>
Date: Wed, 30 Jul 2025 10:19:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/atomic: Return user readable error in
 atomic_ioctl
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com,
 xaver.hugl@kde.org, uma.shankar@intel.com
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
 <20250730-atomic-v2-3-cc02ce0263dd@intel.com>
 <d3362052-cb4c-423e-8598-d1f0d3618882@amd.com>
 <006d2033-a454-4ff9-a9e5-027bee7c3804@intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <006d2033-a454-4ff9-a9e5-027bee7c3804@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0229.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::35) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY8PR12MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5cf237-1711-4537-5001-08ddcf742b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVB1Y3BDamt6V1JvVVNOMm9OYSs2R01hUWVJOFdzY0FUSGIxa0JMc0Nrbkkv?=
 =?utf-8?B?bldMNldWVituc2FBcU41SWl3M3NFaUQyOExLOTVoS1J3djJZZ2tQbFRZTFFY?=
 =?utf-8?B?bTdOOHE5K3NMaVNMczZ1VXdYb1ZnVGpZa2lBTDE5aFR3bWgzN0wzb2ZycE1T?=
 =?utf-8?B?MzR0Nm9CSkc0OUE1dWlXdnNBUTVHQTI0SlRHQWxsUG1TZG5vTDVXOGpCb2M4?=
 =?utf-8?B?aCthbVBiL3hWZmhWcWhLeVN0OG5IVGZTTzk4MlJoQ0I1Yi9IV3FOalAwWGpI?=
 =?utf-8?B?Zi80VEVCc05KL1dENXZOb0FLOS8vOStMbUN5TzJCdjBIRHpDL0tQdVMzVmF1?=
 =?utf-8?B?dlVKakloS2E2aHZUU1ZkcDlqaWdQR0xpVTBnSEJXQmVHeTVkUUgrUkJGcFRx?=
 =?utf-8?B?NHR4NEI0bUsvWkxGR0gvK1gwOEk1KzBqWUF6eDZjMkdTYmtiWFlGTHkxT0N0?=
 =?utf-8?B?cFdWbTI2d3Nyb0hyOFJ3bWFNT1pkcXFrM2c0Q09jeXFPQ2hPRElkNG4vaXRT?=
 =?utf-8?B?eHNHTWdhR2VHajAwQ1NIQk9WcnZtZlpQcUtKYVJuQkxLOW5wMXk0YmdIUVpu?=
 =?utf-8?B?OEdvekQwTVNCMXI1OU9xTmNpUnMyVUtGTUFkV0Fwb2JCa0hnYmMxMUY2cWp1?=
 =?utf-8?B?UkRaTTlZRnloaUNqMlBqMEJqMGNsaU9LdFlKQ0dhNkhIaE9uaHhKQTA2ZjF0?=
 =?utf-8?B?YjQwREtWUGNFZW9YdnZ0RVFXWUYvdnZnbTJxcDZnYmRVNTY5d0dHc0thaldN?=
 =?utf-8?B?Q1NONk9ja2xsT1EzZTFwS3kxNXQwOVJmUm5uUVZtWXdaUTd2L0tHa0FHME4v?=
 =?utf-8?B?QkhYWkZWTnlEYkJyWTZRUnNidFpBRlRKRGRTVlRwMzNFT09IQTJQeXlMVCtW?=
 =?utf-8?B?OFdITTRMblF6MEJycDZoa1VTVENabDhrKzd5bTNqOUw2ZjBMVEpLQlMvb0M2?=
 =?utf-8?B?SmlWOE5zL29RTEdwNUFrZlpWQVZ2TlNUUkdvUUM1TkQzdEFnR0REcTVLekxo?=
 =?utf-8?B?UFE3MXNkNXdxTjNjOEZpd3k4dzZXYW1GRkZZMFhPbHBWRXFhaEVrY2NOZ1dq?=
 =?utf-8?B?TlZKNjRzcVY0QWZ0bVA4eDdCeTdtdndLbzloeXZsVW4wOWVXZlRkbzFreTdH?=
 =?utf-8?B?M2l4UEhqN1JNK1BsRlNuZVlRbDdKWHhWN1FSVGgzN2lIdWlOTklOQWxqZlNs?=
 =?utf-8?B?STcrRmtCVUxEWW1hWjh1dzdRZ1BwZVY0b05jK3FYdVdZeGVzM01wcjFqZC9t?=
 =?utf-8?B?cnA3UUFPUHMzUzB5aExUTThvMVJzZUVSeUdJUCtHaHVIMHNMa3N4QzNiT0U5?=
 =?utf-8?B?QWhkT1puOWY2N05wN3JTTmRJYkxTMzRxYkloNWxDR2toajZlc2l1aU9UUVNt?=
 =?utf-8?B?dU5LNVNYOXA0TVRjQzd2eldSSUlEQ3JCREtxc1RxYXVrckVZYjhnZmthZlJn?=
 =?utf-8?B?OTd1MEFGWVU2MDFPa2FTZFhGZDFVVlByN0FXdFNoNDkrWjZXbGJ0Q1ZHUzM0?=
 =?utf-8?B?RW9jbTFEa1ZPa2dFVHRkVnBlUUpIdjBHQThzc1VjZVRUc3ZYWk5NQ0dxRFdB?=
 =?utf-8?B?TC9BbU5VYjRKR0JLcWU4L2FDSWdBdEhrZDY4VXF3ZG1Vdi9BRjFrYk1vaEQv?=
 =?utf-8?B?d3F4UFNYVGgyM2NDMzQvN0JCd1Y4QlJNdWtrL2FrWlBhVlVvSXhCMCtYWm5u?=
 =?utf-8?B?MFRmRzRmT3ZDSzZNNEdXNmRrbXhCNnFjbTV4T0JtcHlYM20wMDhveFNxRXlV?=
 =?utf-8?B?QmVaVnV0Y1BUclB6Skl3cjBwNUZka1RMUk1LQzNRK0NhZ1JUWG5FSnNNeDU2?=
 =?utf-8?B?VFVxNURiVm9JWG5kd2NTbHJRbGliYVh2UjBYZ2ZWUkVpV1RVd2RMRnZmNWJW?=
 =?utf-8?B?cCtZYjJnM3ZiTDhlTlBScEp1d3pnVnhYOHVwM3laZXVtejQvTnJnbzBndW9n?=
 =?utf-8?Q?bSsQevUH4Cw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aStndHhqM3dlQUY0UlVwd0ZwM3JEK1VxNHFlamZaUkpkMGJQT2piR2NUcHdw?=
 =?utf-8?B?SmE5alFSdXdUWWdLWEZ3QVhPT3RkN1EzSUpESC91RndXS1hwaEdZU1h3emk5?=
 =?utf-8?B?ZE0zTFZvK0RhYUo4b0Q1UFNoK2NFMGhVbEVFSmtySUpnQXN5OUsxWHcxbVhG?=
 =?utf-8?B?N1hudm16OGVXVUFiVjZmYURMV0w5RE9iSXVNbWtuNmVVb2x5NGt6dUtnTkY3?=
 =?utf-8?B?eUlDTDQyMFMweHRoeW9ZdVd2RVdGRERVbC91VkFLVElQczdRZHgwaERQUldM?=
 =?utf-8?B?dVExcnF5eVBXVGthSUVLdDFmazB1UXp4d0d2N09SRWxwY3hsakxqaU1iOTRt?=
 =?utf-8?B?ZG9ZcXJ4elhpR244bnN6Yk9sWW9MRVhJV1VsREkwUXJodjJKMDNpV1kvSXgw?=
 =?utf-8?B?OVNpby9iUHVlL29uczNFc0xwbXpTcm5SOHhPWllSTkhydXhaL0VFdVN1MEhK?=
 =?utf-8?B?a3BVMmdpNTcwY3lISXFzVCtETi83dnRRZ2E0bURJcWcvZmxtaXY3NUZpUUFM?=
 =?utf-8?B?eERZeDBxajI3U0Nyb1hPaGU0a3hGOEY3VUJIWFR1NXdvL1VnMkRxREV5ZEdM?=
 =?utf-8?B?cUJtSE16VXdlS3Rtall2TmdxTGk2ZWtjdmhRNTNFcFUwVXJoR2VBS1p0QUhI?=
 =?utf-8?B?UTZndXIzaHBkVUt1MkNYTFFpNzdBYTJ1RVJyR3pZTC9yM0dpQUpycWxyQTl4?=
 =?utf-8?B?OHFzU056ZW5CNWtVR1YzaE5pSjExb0F3Nlh3OW5ENHRIbVErUXZ2NnczZzhQ?=
 =?utf-8?B?LzJVRlZyenJ0UXJzTzFQV1JpZUl2TnhibUhIc0U3ZUZyTFM0OTJ2aG15dFlG?=
 =?utf-8?B?eXNnMWdCUnlLa2w1dS9DTHJpSlloVFF0YU5rcEZTeUpMOFhRMjhFMXVmMFVH?=
 =?utf-8?B?VFBoUTdIdWNDS2txSHZYRkIwLzRoYzgyYlg4Yms1YXBlNVJxRElIVDQ3RzN4?=
 =?utf-8?B?YnA3MzZYdTIvUEhyV2FLUTkyYjdzRitkak9TL0p3VlNzLzNjbWVpWGdGclJH?=
 =?utf-8?B?YXlLTi8yRHc2a1pCQ0hMbTV3bmx3QW1QVERJbFh0K2p1M0VPclJOT0ZzYjhs?=
 =?utf-8?B?eDFLR005TzJOMVdVZzAvUnVZa1I5VXppVlN3Qnlta21RcStYOGNBQW1sNXY5?=
 =?utf-8?B?UUlUejg5eGxlYVJpU3dFQXN1dEhPbUgza01JUkNHMGZGY1MzT2VvUGQwb2RC?=
 =?utf-8?B?KzRUS3gxZjE1K1VXNVM4RGtpTzBpbGFLVXFOYy9HUFcvSytOblRtY3MxMVdH?=
 =?utf-8?B?ZFcyUkwzQ3I2RUZSaTBDZ0RrZXBzMEhaM2RNRXIwcGhnSVJzTE5RZW1rS3Qz?=
 =?utf-8?B?bWk4Q1dwdWo3bFlrNWlXSlNrMml6WmlWd3E3TjJxeHdkSGdKSlFPRCtVNnlJ?=
 =?utf-8?B?V3M4YStmeGUzWnpqSW1YdHNlYmpnL3hianpjeUM4N2NuWEs0K0ovUStwVUpT?=
 =?utf-8?B?blptK3J3QUVRUWNQTGFqZTMvUTR0eFFWUGRMZVlRVEhyZkVscGRCeXFXTlA4?=
 =?utf-8?B?UDZrSnlab2VBbTVCSUhmZHlSWDBXYUYwWFI3SVQ0dExYdjd5UEtWdTRpTmkv?=
 =?utf-8?B?ZXZ1eVQ5dlJGUTFpK0kyUEFjdzNRVDdvL2R6aVc0YndzOFEzWHg2cmRSN0pT?=
 =?utf-8?B?UTRrbU4zUlMzNTh6TkFxSFUvN2x1azlEcE1YNzc4Mm55QXgrVnc0RG1qc2lp?=
 =?utf-8?B?aXlEVXptNEU3ck03UGt3bUFiL0xTa3A1bHpLV1czVG9udzJzS1owd3VLelZG?=
 =?utf-8?B?U2t2NEpNVHAvbDNKcDYxbVc1ZVVQcElQSVlQL1dhdmNTUnZNNFJ0eWpZQTZn?=
 =?utf-8?B?VEhTWTBRN0JHNHp1T3htRElTTmtBclJDd3hMdnVFSTh1NEpWVStRQjR1WjB2?=
 =?utf-8?B?M0FCNG5Nb1Y2aWo3TWF2aU4zeXVsVFpVTkdaM2NMY2NTREZjd2R6TjdkVzY4?=
 =?utf-8?B?cFNNQXBBTVFhK3F2ZDhZQ0R0bEprelZrcCtZZUdLQVltdW1DRC94NEVIeHlJ?=
 =?utf-8?B?WkFTTkxnNWkyZ3M5aElZRTVHcFBxM3V4N2wzOXFrNVMyU09PZ1VkWGJjVzhi?=
 =?utf-8?B?OW0wVE9QSlFkWEZ3dDNDZE1Wc3EwN1V5SzQxclQxd3pVYm9KeE54cnVCQVpV?=
 =?utf-8?Q?NK8Y5GwJB53QZEKh2/7ux9ZuF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5cf237-1711-4537-5001-08ddcf742b29
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 14:20:00.5752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nff8OMGFFzldBMGvHJrGcOWIfJJ4VOp894n0qKma7SI4SUcD/GYqAI24Nzxci9Wtx+FCWuc4bZbBO10uMbEDOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7634
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



On 2025-07-30 09:55, Murthy, Arun R wrote:
> On 30-07-2025 18:44, Harry Wentland wrote:
>>
>> On 2025-07-30 06:16, Arun R Murthy wrote:
>>> Add user readable error codes for failure cases in drm_atomic_ioctl() so
>>> that user can decode the error code and take corrective measurements.
>>>
>> Thanks for doing this work.
>>
>>
>>> @@ -1541,6 +1548,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>>           ret = drm_atomic_commit(state);
>>>       }
>>>   +    /* update the error code if any error to allow user handling it */
>>> +    arg->reserved = state->error_code;
>> Once we do this we paint ourselves into a corner.
>>
>> It's nice that we have this reserved field since it allows us to
>> extend the atomic ioctl without the need to define a new one.
>>
>> When we discussed this at the Display Next Hackfest [1] we came
>> to the conclusion that we would want:
>>
>> - an enum to show what is the issue
>> - a string that can be logged to display verbose information
>>    about the failure
>> - an optional array of KMS object IDs participating in the failure
>>
>> We could define these in a new struct
>>
>> struct drm_mode_atomic2 {
>>     __u64 failure_reason;
>>     __u64 failure_string;
>>     __u32 drm_object_ids[MAX_FAILURE_OBJECT_IDS]
>>     __u64 reserved;
>> }
>>
>> that we link to via the drm_mode_atomic->reserved field.
>>
>> Your approach of flags, as opposed to an enum, would allow reporting
>> of multiple failures. Do we think drivers would ever make use of it?
>> Normally check short-circuits when a failure/limitation is hit.
> Thanks for the feedback. As pointed it would be good to have a struct pointed by the reserved variable, so that we can further extend the scope.
> W.r.t the enum, I feel its better to have bit notification as we can convey multiple errors if any.
> 
> Understand that the driver at present will return on the first error but upon adding this user readable error code can extend the driver to check add the properties provided by user and report error at once, so that multiple failure iterations can be overridden.
> 

I don't have a strong preference either way here. I'm happy with a
set of flags so we can report multiple errors at once.

> Having obj_id would be a good one, but when the flow goes to the vendor specific driver, they may not have the link to the obj_id where a failure is occurred. But still good to have so that at the early stage in set_prop, sanity check failures can be reported with obj_id so that it would be easy for the user to correct them in the next atomic ioctl.
> 

Right. This is entirely optional for scenarios where a driver (or
DRM core) can provided this additional info. It might make sense for
MST bandwidth failures where we could provide the MST connectors that
are involved, i.e., ones on the same physical connector.

It could possibly also be useful for movable HW blocks, which is not
something we can express right now. Things like a LUT that can be
assigned to any pipe. When userspace tries enabling the property that
uses the LUT but all are in use we might be able to signal what is
conflicting.

But again, entirely optional for scenarios where a driver thinks it
can provide better information. It also depends on how userspace will
implement this. I'm sure compositors don't want to overcomplicate their
failure handling.

Harry


> Will take care of these feedback in my next revision of patch set.
> 
> Thanks and Regards,
> Arun R Murthy
> --------------------
> 

