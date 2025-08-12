Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C106DB23C33
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 01:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CD510E656;
	Tue, 12 Aug 2025 23:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Om9FQck4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B8710E654;
 Tue, 12 Aug 2025 23:06:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+AhtRn4kMkYUSMO4Q5VXiDXGCRfHmn9jYTzWUKNIEoZ5Ge/VMVbX1PP1uC+KW0mY3E8XMq5aRT7S3hXzM8thZPyN2taG7grjoik9SjTq7LaRZm2QOoBVTWakgGfrmJC60SX5WtFGBjjoh2znZT7TT4ZzBNmBI7BnnkA3pevLjzzTU/XQJ7wdcfXIJP55Ef1Y6eeZvzSGz+SI4vObn3HSH1/pskvlsH3/5J/FFY6fD6orualF7ws5FcfyyYY4SqvCbbMPrQl8r1hPXCtTdKXGl1FB+aDx0EREYhtFPPYV1oTeHCvDrzIRcv0X4kDEEtVZvf1otZ2y8pvOGEV7I4/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByQenui0ojEzOuXSuXFZNovORhJf5awjtzFR+j2FLmw=;
 b=TqMqkoZHA7MStzRYX/vkTy7YAMDf1kQOzIwozs4T8z1DpfRil6x1WLwlWxV6DHK3qUrQ1Vamr2VPM84tZcHVq8mWNcwSXc8j7DVN6zgMVK0bRt7BC8JolJhZqZWwCMz2hx3RTi6T5+zW2wkEbZwxHauRbSOvUT8loDinBCmR1AoOp/M37qrD9ITF9cw6n4g0g312IB0LYll1eL0aGVQV3DcxbKkkhv9+YrGc+C+950SPaTOI/ULffYxkK3zrTCDya1l1mtnFmTQpXL24PhB7ShVdv2gY8Z4SiL9hwPECKlQvnUjyXZOnSk64zDPgNVRJWRg3GxZ0iIhOHfSoVeCn4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByQenui0ojEzOuXSuXFZNovORhJf5awjtzFR+j2FLmw=;
 b=Om9FQck4tuLm8mf9pVVJhd4i8NCwyAT7h8QrRZ1UuHf4rlc+4ttPTJxqqNztrldZ8eXuFsovgO2S6PEK+v3Nb3CYBWsMGO3ancTTSzbcvL17/eVwUUrlintgTRueCwaLcQ+qxQWJO1/80R4V8bQpV5KrwsTdSdVftoGflB2ayn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW6PR12MB8757.namprd12.prod.outlook.com (2603:10b6:303:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Tue, 12 Aug
 2025 23:05:58 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 23:05:58 +0000
Message-ID: <9e653538-6390-4187-896d-2787b7529038@amd.com>
Date: Tue, 12 Aug 2025 17:05:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 43/46] drm/amd/display: add 3D LUT colorop
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net,
 Daniel Stone <daniels@collabora.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-44-alex.hung@amd.com>
 <df570128dd008a969885e82abf3644b302120170.camel@collabora.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <df570128dd008a969885e82abf3644b302120170.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR2101CA0019.namprd21.prod.outlook.com
 (2603:10b6:302:1::32) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW6PR12MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c5c7cf-e777-4bda-749e-08ddd9f4cc59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0RFWS9STlNKQjFkenQzWFRGbHVDZ0c5cG9KY21KYWJOWnNGZEx5UWNPVHNi?=
 =?utf-8?B?dFBTcjFmM0ZHcDVIMUVQcFBlaWtBR25ScW93QUtjck84VnpBSFU0OXh5QUpH?=
 =?utf-8?B?MytNNjAyL1RlcnhmNDVuQW9TQi9CNHM0dllGbWVqR3ZONkluODU0aVlyb2c3?=
 =?utf-8?B?ZzgyQVJaSC9ZZlF6Ri9rcURRWk1HNUZscnJoekM5TVIvNU1LVmhuUk5iQkdS?=
 =?utf-8?B?MkxNV2s2aFprK2FkcC9qQ0MrM2d6T1Q0RzV3NCtmNVk5VE5lYnhwTG14a05D?=
 =?utf-8?B?VlpUNHVGcE5rZVBDc3ZDU0ZKcnpXMld6YUNFNmx2WUsrdk5KVEhJcE9qQkh1?=
 =?utf-8?B?OTF2UmsrcmNtVHNEMGZab3RHV2MyNGdDdG9IQmJ2bHR1VEtwa05yOXdYc1Nx?=
 =?utf-8?B?bWg0b3Z1ZUpJRXZNTW85bDBEb2pFWkVybHRPbTB4OVpFOTd1L0dSQmxsVmgw?=
 =?utf-8?B?S3dXYW9zejZ1a2FtK2FRdXgyc25sQ1BPZG9qL1BKV0xIWlV5em9FdWlXc0Fr?=
 =?utf-8?B?TFo4OXdlS0hRd0VQQ0xtM1UrMEFQakFsemNsVWh5OUkwTWJaRm0zRE9VM09Y?=
 =?utf-8?B?dVNSNE5PQlNVUFdnLzRWaTBUalR2KzNKQWZVTHkxS2U3MW1yekZhSXdUaWxo?=
 =?utf-8?B?VnpuR3Q4R2Nja0l3Vld0V3VlYzBTSUZ3dTNQSDFCTmd3UnBCWGdDOExCaVY2?=
 =?utf-8?B?S1ZPR2l5RGpVRnJVYzdZb3ZGVkFIcUdlUkplOVViSkZyZWs3UFMyT1lwN3NM?=
 =?utf-8?B?OWxTbnZiSUFsRkczQmFUUkk2NGg3Zm81eHNTU28yYlBOVEhDR0w2VElGN2Yy?=
 =?utf-8?B?Z09OM2lKa01RTWlEUE9VbG9pZnU4RHlHalM5NFRYZUtXRzIyWjhoVzBoQ2JW?=
 =?utf-8?B?MFAwc0NvSWdvK3FrNmxRNENacUpxdzNZRnh0amt2ckcrWkpiOU9veHliNUU3?=
 =?utf-8?B?UkVteVNaMGsrU2s2K1FPWDd6RGs0Zkcwa1hscjhDaHJ0cVo5Ukkvc2EyeE1B?=
 =?utf-8?B?SVptc3ozYnBoRU0vVExDdStVbjVKdzRmWjdZT1NobEhidXg2SHJtRU1GUnY1?=
 =?utf-8?B?aDlxYnJGK29rQjJ2eStkVWxxYWg5QnJYWm9IZVBYM0Fiemo5K21VNlVaVFhw?=
 =?utf-8?B?QktHZ0lkQlBjbUxWd1p4WEdRTURQazMxWU1ENDFFT21RUFZJRGV1VnVsN2dT?=
 =?utf-8?B?Y3h6aCt0MHhVbWR0Vi94dE15c2c5UTdic0NWTDhXZ0hKUHNlVVhSakEyQkVE?=
 =?utf-8?B?QkorNG04a01SSGhqajNFOTRXKzJnWTBPNVNzTnM2R2ZrelFZdEZoOHFzU29B?=
 =?utf-8?B?QUxuT1Nza2VzbkVRZ1ZjcVd1d0tCRVpJWStHLzgzOStzL08rVEFNWVNmMDdF?=
 =?utf-8?B?TG96N3RyN0I2V1V5ZWo2bzlCclVzTEZieC94WlVacnEwYSsyT1ZKZVc2bnFF?=
 =?utf-8?B?MnM1SlhsOXJXUi9uWnhJd0Fhc1VlVk0vdDk5cmlyQjJIeGwvUnlKVWJZZVl0?=
 =?utf-8?B?NjQ3MmRJVVdVeWMvTjhmRnhIZk40TTdKeXBCUlBUVUxxZ1RaVk0zVFkvT0xV?=
 =?utf-8?B?b3lhZENOUzRpVDNmOHJ1VVBKWU9VVEtDVmFLU1kwS3lnVkVoZWxZRVNJbWlx?=
 =?utf-8?B?cGRyU1p1bUJvK1NteW91QkNIQXZBaEVyZ3B2ZTlxb0kvS2hBcEw5YzhtWWtC?=
 =?utf-8?B?TW1CbDRBVFRQK1dEeDFsZ2g0WFNOOWFGRVp1ZVIyU2lMcU91RHl6M3p0bVNO?=
 =?utf-8?B?OStDeFMycWVBQXpSbVNXaXVPYzUvanlkUFZwSDNiU08xWEozU3luVmNEaXpJ?=
 =?utf-8?B?NmlpZEpTUkVmTUx0djlFUnB2cnd5ZHlsZ2xWWWt3NXdRMUxnUkVsMVF3R3FY?=
 =?utf-8?B?V0MvT1lZc0dXZWFyUzhpNTJtYkxETUZYbDFUajk5aEpITkVvS3IzM2QvVkl0?=
 =?utf-8?Q?Z8BW52Drgpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVl6WklobjJRWG1kdzcxeTdUOTRvRjA0UWJ2ZzFtNWJpWDlQNDBTNkFueENW?=
 =?utf-8?B?RXdGR1MvNG45a3FZQ0pQMmFVMlI4UDlucCtBRGpTRXA3Tjdld01KUG4rWUha?=
 =?utf-8?B?QWloZVgxRDd0ZXZpdUxwRlBELzV0QVdDeWtNeWc5c2t1aXM2Qmw2d0FvNVlx?=
 =?utf-8?B?VGFtWUs5Um50QjdwUEFtaU90QTU5T09WTjdjeXkxc2dFT3JGYnZBNGR2MGVD?=
 =?utf-8?B?ZUlxeFEyUVBkb1BETmpvSTZ2c1Q0elprN1pmMlhIYWtUNTZ2VllSZkRyQVEw?=
 =?utf-8?B?R2J3OXp4enk1N2NXckdGOHQyRnQ2Ry9GYkJRVEZ5ZnZoZmx6VWhFQzJxU1RH?=
 =?utf-8?B?by9YaGFVN3JVL2VKUXZyK2ZrRDRMa0t0ekhhSE1xR1V5YXRKQ2RqR1ZTUG5F?=
 =?utf-8?B?dzNYZlNnSG93amJtQzF2K0gzRUZLTGo2VW54aytuQW8wdDZFbUozQkJvbFdT?=
 =?utf-8?B?ancvNGQ0Y0FHeXlXak5KUmdDeEl2MnNtMktDVXFkdGlEeXdVVitRV0MzS0xj?=
 =?utf-8?B?V0NaeW9VOHFFVXBpWmJRbzArWklqb0VITDNwdHl0M1lVbFZRR0hlZVFQTVFB?=
 =?utf-8?B?K3JSVlRQNExxSTBKbU9ZOWlmMjMrQ2paUlRubStiSU9RQ0Z6U0tIR0oxT2hH?=
 =?utf-8?B?R1BkS2x2WVBFWktxUnhSQTNrR24wQ292d0xnY0tDWU1FNDdWV0xKK2UxamtU?=
 =?utf-8?B?ZG80ZS9KVHREa280OG15OXIxa0NGYlJPN3Z4cTI5bXlxTkFHRlA5SlpoN1NZ?=
 =?utf-8?B?VFhMNFFLZEpZbFZLbnNBbUo4MkVDeXJTc0hydkY4N1V4QnZSNnNhdWFKSG5z?=
 =?utf-8?B?MS9GMnFuN0xVaDhiZDRSMzdBQXZEaFROUENrU3VDaUsvM0ZGbXA5ajFsdXlv?=
 =?utf-8?B?OUVvRHExeDRPTm5LaExrVjAvVVN1V2FrZHlUYVdOZ01ZeXpHaU9nWkdhNHBC?=
 =?utf-8?B?WGtDNUNqOXhKQWdjT1lPeThkMFVLTEZkU3dnazN6WmM0Vy8rbkpjRzFJYmc4?=
 =?utf-8?B?eGVsYXpDdnVtSG5pMHRJb3FSUXJUby82NG43bkQyL0kvZGFrSmdsWCtrVFdu?=
 =?utf-8?B?YUhDTUthcXA1bG1tQThmZityM0xUbTFwcW4vVXB1dWkrd2NCTnEwWTNrbG94?=
 =?utf-8?B?VzlOYyt1TzRySUFQdk0rcHcyNkcrRmswZmFEK2ZFRG0xSUVraFhTT3Z6alR5?=
 =?utf-8?B?ODVxZ2xrYXpocXdTQkFURVBwTjBVaTdkblErcjFyTGNJUGhyMy9yQ0tuTDly?=
 =?utf-8?B?ZVBYbWVLQW1NdXpGcCtvNFJEUHVHSWgweFF0cEx0Wk1RQmFieFRBTlUyOW5z?=
 =?utf-8?B?WWNtMHZRcWFYZUViUjRGUm50a3g0QTh4Q3NIalQ3NlkxNW1OcE42UW5MWTJR?=
 =?utf-8?B?azI2Mjc5bzFqK1JtWW5YbGJ3ZjhERng5TzdEUWh2bW9KdE9hVkRtNHkvQkYw?=
 =?utf-8?B?eTA1Uk02YVI2RzhnV0FmeXlHK3lDdU1YUnQ3SW5nMUlITG10bnhwSzd1cjRr?=
 =?utf-8?B?SW42akRMVHBCZkd0SDc5NkNzZE16SStjeUZ3SVd3Qmp4ajl1YVdIckNDcmFL?=
 =?utf-8?B?TUc0NGw2TlNuMTh2ZklrM1g2OG0za3BWU0dxSVl5NGFPMTFHM2lSejRzYzlV?=
 =?utf-8?B?ejQ5d3VVbjhDWll6TStGaEVXNHcyd0h2L3FhcHRDTTZkODJnVXBVTnlVVkJK?=
 =?utf-8?B?VzV4MWpHNkxTWms3eEpIYTRQc2Jram9FTUFlTFBDdnROWkJHcVZXUktjbk5Z?=
 =?utf-8?B?bjBFODZ3djVqUGdhdGphYjZ3OVBScHg3R242ckZDTXJOSDE2eTAwd2dyM014?=
 =?utf-8?B?SEpnV1FCelVzSlJIOEZydDdQS0JnYXdDOGl0d2lSSWhoOEtydVBhaWV4M2FE?=
 =?utf-8?B?WXY4OFpRRjluZTZsZmwrR3N6Q3QzTk5WRERyM0JoR2pXQVBPU1VBMUcyTjM3?=
 =?utf-8?B?N0RRRkt4MGhkZXlJQUVkdEpEWkZ2WW9nK2NPak1oNGhlbEoyUzBWbElkOHhW?=
 =?utf-8?B?SGwrZi8rZnhESEh1UGUrRFVLVGk2ZW9TazRiV0crSUJQaEI4eHdyYzFFdndQ?=
 =?utf-8?B?elB2T1g2SXpQbktPelVRUUdrYzRDVk83NzkyRVB1NDMvTUI0eUF1aGdUcVhu?=
 =?utf-8?Q?vBKmzDn1jhviEnizs/B8zyK/p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c5c7cf-e777-4bda-749e-08ddd9f4cc59
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 23:05:58.3835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hn2YHu9dQxIJCIQ3lTZ/9dp+B34y5wMPKR0ZuSRLZr8riJe86SJT7qZgBQqvQZAAbz3LvqFi3S910m+vXI3Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8757
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



On 8/4/25 13:51, Nícolas F. R. A. Prado wrote:
>> +/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
>> + * @drm_lut3d: user 3D LUT
>> + * @drm_lut3d_size: size of 3D LUT
>> + * @lut3d: DC 3D LUT
>> + *
>> + * Map user 3D LUT data to DC 3D LUT and all necessary bits to
>> program it
>> + * on DCN accordingly.
>> + */
>> +static void __set_colorop_3dlut(const struct drm_color_lut_32
>> *drm_lut3d,
>> +				uint32_t drm_lut3d_size,
>> +				struct dc_3dlut *lut)
>> +{
>> +	if (!drm_lut3d_size) {
>> +		lut->state.bits.initialized = 0;
>> +		return;
>> +	}
> IIUC this means that setting a 3D LUT colorop with BYPASS=0 but not
> passing in a DATA property will result in the 3D LUT being bypassed.
> Meanwhile, in __set_dm_plane_colorop_3x4_matrix() in patch 36
> "drm/amd/display: add 3x4 matrix colorop", when DATA is not set, an
> error code will be bubbled up to atomic_check.
> 
> Given that this API is aimed at being prescriptive, I would expect the
> second case, bubbling up an error to atomic_check, to happen whenever a
> required DATA property is omitted, for all of the colorop types.
> 

Thanks for pointing this out. I will make the following changes to fix it.

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c 
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 3f7461cbaccb..d6434472f486 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1626,14 +1626,17 @@ __set_dm_plane_colorop_shaper(struct 
drm_plane_state *plane_state,
   *
   * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
   * on DCN accordingly.
+ *
+ * Returns:
+ * 0 on success. -EINVAL if drm_lut3d_size is zero.
   */
-static void __set_colorop_3dlut(const struct drm_color_lut32 *drm_lut3d,
+static int __set_colorop_3dlut(const struct drm_color_lut32 *drm_lut3d,
  				uint32_t drm_lut3d_size,
  				struct dc_3dlut *lut)
  {
  	if (!drm_lut3d_size) {
  		lut->state.bits.initialized = 0;
-		return;
+		return -EINVAL;
  	}

  	/* Only supports 17x17x17 3D LUT (12-bit) now */
@@ -1644,6 +1647,7 @@ static void __set_colorop_3dlut(const struct 
drm_color_lut32 *drm_lut3d,
  	__drm_3dlut32_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
  				   lut->lut_3d.use_tetrahedral_9, 12);

+	return 0;
  }

  static int
@@ -1680,7 +1684,12 @@ __set_dm_plane_colorop_3dlut(struct 
drm_plane_state *plane_state,
  		drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
  		lut3d = __extract_blob_lut32(colorop_state->data, &lut3d_size);
  		lut3d_size = lut3d != NULL ? lut3d_size : 0;
-		__set_colorop_3dlut(lut3d, lut3d_size, &dc_plane_state->lut3d_func);
+		ret = __set_colorop_3dlut(lut3d, lut3d_size, 
&dc_plane_state->lut3d_func);
+		if (ret) {
+			drm_dbg(dev, "3D LUT colorop with ID: %d has LUT size = %d\n",
+				colorop->base.id, lut3d_size);
+			return ret;
+		}

  		/* 3D LUT requires shaper. If shaper colorop is bypassed, enable 
shaper curve
  		 * with TRANSFER_FUNCTION_LINEAR



> This makes me think it would be good to have a colorop validator helper
> function that could be called from the driver's atomic_check to easily
> do all such checks, such as that DATA is supplied when expected, not
> only to remove the burden on every driver to check this, but also to
> ensure consistency across them all.

I think this is not a critical feature now, and let's have this as a 
future improvement.

