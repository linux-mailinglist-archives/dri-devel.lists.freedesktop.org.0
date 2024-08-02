Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D605F9460E0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 17:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5232710E190;
	Fri,  2 Aug 2024 15:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ByPuYJk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95F810E192
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 15:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SptVRG8K4y89Mb87ebCCWlDcsUGbL9j98vOk+QC2Kl4Q9IAy4tbhqUpcVA1mkDZOHp1sCc5dBuBASxQAFm9rVPh0tK8ik5qgyt3uFz5Yfj38JWbzwDofaZXHyHNXe9nJSAA4PIPzF3sDd3ErhOwF87qnDkXRJk2gMnNp58SIOVLbcYZ/Zt1QkhFmltsOMvs3WRWsFvcSk2k22QDHQ0dVmfMK2gV5W/vC0l7Y1v8nNQhdcpyG/vY1oDC5GjS0pZnO7jyEAJIdKgibV3pelT+c1btnfSZIGhCRRv2VF9sua8EI3C1qYdtXeAl1Y3SIiUwEEptcguCrERs5AElgpZ1wug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGkOi0WbGmkCVqH9LZNKzbvbaHBL3Tz05Fz82boJA/o=;
 b=O4x948DGBAA/+h7UgCU+Hl1yJTaiJFs0L/IiYfXkJyrIHKz9diuKmL3Mmg4V3uivyn8n+0wCq9LX2wRPYLAD/TNoZb8N2gjijX5hidxTVV2sSADyqcsQ2i71v1jOnGvic81PyQxEJnce+FCueRPjGJKh1kjzIN+tt7qHF1oid6ASkgqBgltLY6sM7PUB/C8AXXeKtEm06ZFlZ3nlNn9uwm3mH6ZwjeCmayeY9CiclUaXJb6kr/xuuhfRSLb1z0yfRnaX/hhKu2BNchGtiMKKBTqy8E4DtUwLQcSJlCz58Ngl7UNJ9BgEd270kn0hOQ0hDpPBmdP4IzfJIFkgOnHc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGkOi0WbGmkCVqH9LZNKzbvbaHBL3Tz05Fz82boJA/o=;
 b=ByPuYJk7kTgo29nkb+SIQIs6SHRaFkhLC+gtsUnlk1vgM0Te5hsMJ/P5ftt7fklBnwztbHocRmBFxfAH6/BMAzPruJ1kFEpjuagPyheBl8GyLNKCEcEan+iXOZQVvPSHaT00cHq2O3jOHn1bSa4NHVB5+nQ93umlbmShgSA7hw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 15:53:57 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 15:53:57 +0000
Message-ID: <97fc4462-b1b7-4fff-9901-15c8db56fc21@amd.com>
Date: Fri, 2 Aug 2024 11:53:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/edid: add CTA Video Format Data Block support
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Karol Herbst <kherbst@redhat.com>
References: <20240731214941.257975-1-hamza.mahfooz@amd.com>
 <87sevowv97.fsf@intel.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <87sevowv97.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0204.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::29) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|MN0PR12MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d99b5e-8360-435c-1410-08dcb30b516b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDJncDNncUZMWVpWd295UUdMR3ZQRW5sM3lXVFVtbFRYam1UcERaMlpDbHRK?=
 =?utf-8?B?MGI1TTZxYzlHc2t1LzVJN21Db25vTi9lSzg5ZWozbXNwTFZYenBrMVArNnZW?=
 =?utf-8?B?YS9aUjZPYkFLdllFZFJSVW9aR3ljYlRKQUFmK0xGQXFzZVNRb2JqWmwvTU5z?=
 =?utf-8?B?OFFIZ3V0VG9ONUkrb0dlRzlNTjhSSG0vRTZuRTZ5SEhwcDdCaEtZMGJZRFVG?=
 =?utf-8?B?Y3NEWDRvSWJnb0lxSXFTekJpME9WSnRoRUlmRVJpQm1Hd2x1djdoTy91QzEy?=
 =?utf-8?B?U1drRGpvdXhLV3BheDdzRXhZR2tVaHVIVjBiZFRnZnJjSzAvb00yNmxUUTJI?=
 =?utf-8?B?VDBKdG81YjFkMXBYWm5jNmVQL2xVNmg1UU1BRGp3blhKT3Vtd1VOWUJYTnRS?=
 =?utf-8?B?bFJNYVBnb1NvTVlGWVpGZ1VCOFhIYW9RMGVUcEZoamJRNk8zQm1CcDMvekpI?=
 =?utf-8?B?ZVpzYVlCRDRQQ1Q1TXp5aXJHYzVqbUpPd3EyQTRxeHZFUzlFZHJQMjBYT2dq?=
 =?utf-8?B?WTRvT0s0eUwyd2lIOGlTQnhndnpMMkxHZmppTWtUZncyYVE2ZnZGa2ppejhV?=
 =?utf-8?B?eTkwemUrVEVyM2NaMWVKcWljWDFnYzE5U1ozR3J6WGs2RmZPREFjR09OWFdO?=
 =?utf-8?B?T2VPekRtbDJLYzVQNkJPcFRyditLbmw5bnRFZXAvdC9pNWlyWnJyK3BwaFNm?=
 =?utf-8?B?RHh0LzFLRkVONFQzbWpPSnRkemJBMTJNVG9qMXN3VmYyMnAzbEVGRXFPWHUy?=
 =?utf-8?B?RWZheUwwMzROL3dpZC8zWXZlTHdHbURMWWRUbFF0NlkwWHlVTjlyRGRYdHJN?=
 =?utf-8?B?bDgza0U0bnZhOFBlQlpJczZLTkp6Q1FEbjBPRFVsL0kwMWtVU0VQK0g2a3dL?=
 =?utf-8?B?UlBOQVFHZlNtbTJBWTV6dlZGOTl5VjdZaDJHOVo5eUdqUGs4MTZZdGs4RVIx?=
 =?utf-8?B?eFFYUFJpTTlacHRmNU9TZkNldEtLQ1BVZ3g3MG53NU8wRGpib1VZejZ1RGta?=
 =?utf-8?B?T1ljS1p6ZS8ycStCc3Vzb215ZUFMSHlMVi85ZUNjZzJsWERTQm81d2hwRzk2?=
 =?utf-8?B?Wnh3elVTbTJHOXRrNEYyUDZZeThpdWt4MTZ6Wk9BRHYzTGF2QVMzeUdtM3RN?=
 =?utf-8?B?eGNQUnkzdk9zckw0d3ZNZkJjemp5VDB6UE9wTHFDT0pPU25YN2Zjeks3K1Jp?=
 =?utf-8?B?K2djVmJFblRMOW9kemlSWkI2SmlqQUVzQmhvRDlJVVArRTBGWUVtTDh0Q3V2?=
 =?utf-8?B?Y21JYXVDU1N4aXpxQ1djNkxNL1RBQnQxMTVQQjVucEJEOEJtRENQT1BENDlE?=
 =?utf-8?B?bld3dW11V0VkZG8xZG84c3I2c3FTc0x5T2RtRTY5K1EzY0N3b095bWw5MGta?=
 =?utf-8?B?NElnWWZtQzhrTk5pYTJxdTgyM2hyTUIrN01ydnpkdkFQMGowbmpvdjU3TUZk?=
 =?utf-8?B?ZlhMTmtEdVNpY3lDTVI3RG9jNFlPYVNpR09UWUJGZVlCcEN3OVphSStrNVJa?=
 =?utf-8?B?Uk45RlUwdnBmV3YrdTVsVkZ4Ujd1UU4va2V2a3NyK3BMcXY5ZjdtMU8wTlMz?=
 =?utf-8?B?MHM4MkJkbjRST05VRmIyL1FaOVk1Z1BCRmNtdkFvT2lUQlcwc1Nka0lsNjdx?=
 =?utf-8?B?ejQwWHg1UXVSUHpZNWYxQ3lGZ1Jmbm5NckhiVUtDamRtai9FUnI1enJSbUkw?=
 =?utf-8?B?ZzBzWWptVFV4UkZtQko0VklOcytNQzZxQWhYNk85UW9JQUJxRUluMGN0N0pI?=
 =?utf-8?Q?am2+e82qPzf6Kg2u7o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGF6ZTFkL2tsTkFNZXJtVVZRRFJubHVlR2xkdk5ZRUFUTVFrYmE1TXFONFJG?=
 =?utf-8?B?amNEM0l2bVRNQ1VUV2ExdWNqUDdvcXc4RXZ6N3VGbFJjcnhESTQ5WHJDV1Jj?=
 =?utf-8?B?NkdrcVBUTUVnZFFZcFdjZEhLbURka3dlRlZnVUpOenIxTEo5V042WlJyMnZD?=
 =?utf-8?B?SUpzdGhaRFdDVlFpbGlPUjVlUWNHTGVsc2M1cVVldlA0Z1pnTnI4U1BRbmJM?=
 =?utf-8?B?MzhUdERTeC9mbHNGa0JRMVQ4aENNanl1djgySmJDL3pCSStJbWltaVAxakRN?=
 =?utf-8?B?YXZLVzJCa1gvcGE5WkxFZ2dsVFg4Rzl0Qzg2aTJSYjFBdmloaUJ0RWFVeGRm?=
 =?utf-8?B?NUE1WHlCUEdVNE1nYmFlbVBOakRZM1c3OVBWUHhWUEtxMm9oaU5QOXNKZVp3?=
 =?utf-8?B?S0JnSHZiMWc3eXFadWwyZXR6dDh6UU0ybHRDM012cmVOcTRVOVI3YldtTVdE?=
 =?utf-8?B?OC9nd1k5bHprWXgxVWE3UVlPMDE3KzNCZjQ3anB2enFDbFpBUDM4NFE0ZVNG?=
 =?utf-8?B?Mm5HcnkzblRWWXdxd1F4aHpPb3JPSmxldGYzbkpLMXBYL0FVOE5Nek9mTStZ?=
 =?utf-8?B?dWk3UnpQeS9JRkE1MitXQWhMaTY0VjlRdnBCZEpWSlFwRHpMUmo1K3M5MWU5?=
 =?utf-8?B?aWd4aWt1R3VrbGUyQ3BrWWpBRGdpalZXdlAvdUx6RElORDVKRUpwRnRkWCtZ?=
 =?utf-8?B?T0wvcjNTcnB1R2N6a2hTUk9oUC9vUDJGSkovOGdaK0QvRlFRUW1ITzlPS2NH?=
 =?utf-8?B?YmpiY2MzVW1zNDlDTk04bEtGSC8wTWdLdW9SVzVDSG0rYis4VEduT3kwSHJR?=
 =?utf-8?B?YnBsVzA4d2c4ck10YTU2SjZXNHpXZ1RSWFpmNTBIK05VRnZxU20xdmFSUEY0?=
 =?utf-8?B?T1ZEZW8zK3ZuZ1JaS3dhWGkyVit4SHg4allWVllNdHFvdjl6clM1aktQNERy?=
 =?utf-8?B?OGZzK2cwNjhMRlNTbThBYjhLelJRVE4yaDlUa0twZTl5MzI3bG9aQzNEWTFB?=
 =?utf-8?B?dExuakdzSDhyYzZpdWdMYXAxTFBUMWtBbGtzSlJzRDJjSldDWWI3alhIMmRV?=
 =?utf-8?B?T0t3NEx4YmpoS1dCMTJ4blZWZlVBZDVoeWlJSHoxTkhlQXBpZDRmSktIWlBh?=
 =?utf-8?B?VE85NDlxRWllMVpPbWNWVTFac2phMWFsWjl3RmMxN2s0d1ZDNVZkano3K1A2?=
 =?utf-8?B?b2dMQ2FSQ1YyMVF4M3FsbVhvYUQ2ZWhYRURUa0YzSEp5eG1vaUxCVXFBV0g0?=
 =?utf-8?B?ZlgvWmZUekhNRE9VYXhUWC85V2M2am92QUwvc3Z1ajc3WUMzWFBJUUVoekZa?=
 =?utf-8?B?Y0dVb2hhUHc4emgrcDFYNnY3US8wTXFQVGNoM094Q0djNXRHTHczdHdOcnRU?=
 =?utf-8?B?WHR0VDNDc3VLNE5nSmhJZ08yWVprRDlWQ1U2L0JROVVZRmpKVGQ5cFN2ckJE?=
 =?utf-8?B?T0IrbzRKejI2amMvZDJJSmVsQktOWUllUk54aXFwOHo1Ujh6K0QrWmlQakhC?=
 =?utf-8?B?RTl5blJEeEhBdUpUUVNhdWhWZC9KWmhGYnF4dlNEWGxrdzRYZnVBMVFjWWg4?=
 =?utf-8?B?dnFtYkVVdnFrSUFLQ0taUDc3a0YwL2RudzJHTWVUVWdzNkdPWWIya2xFTW91?=
 =?utf-8?B?RkNueDVrbkZKVWNMNnlLMFo3NjBWRTMydWRlejczM1phWERrNGxzQlRPVFph?=
 =?utf-8?B?Y3N5ZlVyNXdaOWgrb1VlRHBRN2VsTTJUVFBkelArSzkvUk8xRFkvOHpnN2hi?=
 =?utf-8?B?LzFnb1VLdlRza1l5MFU3OXQ3Qlg5VUdFbldTMU5IQ3EwTXpNVUtEcDRaNFls?=
 =?utf-8?B?cGlLQURLYzNqZzNIbnJxS3dWVENOd2JUQW1qRktLT1BYMFN3RDZQRllXeHRI?=
 =?utf-8?B?N1hkUThaV2tPUk1XQ016OFpHb0xJSlh2TWlNenViOTl3emhjeWV5QWFNMGUz?=
 =?utf-8?B?bmhvTzVxVTNjdXoxWXhmQk1wMkRzNHdUWFRVbHhQLzQrTjZneTZqd0ZUK2sr?=
 =?utf-8?B?UEpIYW5yajhqYXc1T3ZoM1I1QlBBL1MraGxyQ1FMbVJDSjNaNjNpeUwrTTho?=
 =?utf-8?B?NktURnM0cWZoaXlGMWgzVGxGbmcwM1RDNG5CbHJtRjFDdmRzZmVDOTJoaXBn?=
 =?utf-8?Q?L6NNToJ5SClN+j2DAeSKTZgxt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d99b5e-8360-435c-1410-08dcb30b516b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 15:53:57.3040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beCWzPcv5XMKGHJ3Q6l1TfZ3DXP9CzdZbMcepr+z/eWS24K/iX/nKSrU+3KpoFdsyQDLAuwQSry666h1t2M4Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151
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

On 8/1/24 03:35, Jani Nikula wrote:
> On Wed, 31 Jul 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>> Video Format Data Blocks (VFDBs) contain the necessary information that
>> needs to be fed to the Optimized Video Timings (OVT) Algorithm.
>> Also, we require OVT support to cover modes that aren't supported by
>> earlier standards (e.g. CVT). So, parse all of the relevant VFDB data
>> and feed it to the OVT Algorithm, to extract all of the missing OVT
>> modes.
>>
>> Suggested-by: Karol Herbst <kherbst@redhat.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>> v2: address comments from Jani
>> ---
>>   drivers/gpu/drm/drm_edid.c | 456 ++++++++++++++++++++++++++++++++++---
>>   1 file changed, 428 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index f68a41eeb1fa..f608ab4e32ae 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -31,6 +31,7 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/byteorder/generic.h>
>>   #include <linux/cec.h>
>> +#include <linux/gcd.h>
>>   #include <linux/hdmi.h>
>>   #include <linux/i2c.h>
>>   #include <linux/kernel.h>
>> @@ -741,6 +742,93 @@ static const struct minimode extra_modes[] = {
>>   	{ 2048, 1536, 60, 0 },
>>   };
>>   
>> +struct cta_rid {
>> +	u16 hactive;
>> +	u16 vactive;
>> +	u8 hratio;
>> +	u8 vratio;
>> +};
>> +
>> +/* CTA-861-I Table 11 - Resolution Identification (RID) */
>> +static const struct cta_rid rids[] = {
>> +	/* RID 0-9 */
>> +	{ 0, 0, 0, 0 },
>> +	{ 1280, 720, 16, 9 },
>> +	{ 1280, 720, 64, 27 },
>> +	{ 1680, 720, 64, 27 },
>> +	{ 1920, 1080, 16, 9 },
>> +	{ 1920, 1080, 64, 27 },
>> +	{ 2560, 1080, 64, 27 },
>> +	{ 3840, 1080, 32, 9 },
>> +	{ 2560, 1440, 16, 9 },
>> +	{ 3440, 1440, 64, 27 },
>> +	/* RID 10-19 */
>> +	{ 5120, 1440, 32, 9 },
>> +	{ 3840, 2160, 16, 9 },
>> +	{ 3840, 2160, 64, 27 },
>> +	{ 5120, 2160, 64, 27 },
>> +	{ 7680, 2160, 32, 9 },
>> +	{ 5120, 2880, 16, 9 },
>> +	{ 5120, 2880, 64, 27 },
>> +	{ 6880, 2880, 64, 27 },
>> +	{ 10240, 2880, 32, 9 },
>> +	{ 7680, 4320, 16, 9 },
>> +	/* RID 20-28 */
>> +	{ 7680, 4320, 64, 27 },
>> +	{ 10240, 4320, 64, 27 },
>> +	{ 15360, 4320, 32, 9 },
>> +	{ 11520, 6480, 16, 9 },
>> +	{ 11520, 6480, 64, 27 },
>> +	{ 15360, 6480, 64, 27 },
>> +	{ 15360, 8640, 16, 9 },
>> +	{ 15360, 8640, 64, 27 },
>> +	{ 20480, 8640, 64, 27 },
>> +};
>> +
>> +/* CTA-861-I Table 12 - AVI InfoFrame Video Format Frame Rate */
>> +static const u16 cta_vf_fr[] = {
>> +	/* Frame Rate 0-7 */
>> +	0, 24, 25, 30, 48, 50, 60, 100,
>> +	/* Frame Rate 8-15 */
>> +	120, 144, 200, 240, 300, 360, 400, 480,
>> +};
>> +
>> +/* CTA-861-I Table 13 - RID To VIC Mapping */
>> +static const u8 rid_to_vic[][8] = {
>> +	/* RID 0-9 */
>> +	{},
>> +	{ 60, 61, 62, 108, 19, 4, 41, 47 },
>> +	{ 65, 66, 67, 109, 68, 69, 70, 71 },
>> +	{ 79, 80, 81, 110, 82, 83, 84, 85 },
>> +	{ 32, 33, 34, 111, 31, 16, 64, 63 },
>> +	{ 72, 73, 74, 112, 75, 76, 77, 78 },
>> +	{ 86, 87, 88, 113, 89, 90, 91, 92 },
>> +	{},
>> +	{},
>> +	{},
>> +	/* RID 10-19 */
>> +	{},
>> +	{ 93, 94, 95, 114, 96, 97, 117, 118 },
>> +	{ 103, 104, 105, 116, 106, 107, 119, 120 },
>> +	{ 121, 122, 123, 124, 125, 126, 127, 193 },
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{ 194, 195, 196, 197, 198, 199, 200, 201 },
>> +	/* RID 20-28 */
>> +	{ 202, 203, 204, 205, 206, 207, 208, 209 },
>> +	{ 210, 211, 212, 213, 214, 215, 216, 217 },
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +};
>> +
>>   /*
>>    * From CEA/CTA-861 spec.
>>    *
>> @@ -4140,6 +4228,7 @@ static int add_detailed_modes(struct drm_connector *connector,
>>   #define CTA_DB_VIDEO			2
>>   #define CTA_DB_VENDOR			3
>>   #define CTA_DB_SPEAKER			4
>> +#define CTA_DB_VIDEO_FORMAT		6
>>   #define CTA_DB_EXTENDED_TAG		7
>>   
>>   /* CTA-861-H Table 62 - CTA Extended Tag Codes */
>> @@ -4981,6 +5070,16 @@ struct cea_db {
>>   	u8 data[];
>>   } __packed;
>>   
>> +struct cta_vfd {
>> +	u8 rid;
>> +	u8 fr_fact;
>> +	bool bfr50;
>> +	bool fr24;
>> +	bool bfr60;
>> +	bool fr144;
>> +	bool fr48;
>> +};
>> +
>>   static int cea_db_tag(const struct cea_db *db)
>>   {
>>   	return db->tag_length >> 5;
>> @@ -5306,34 +5405,6 @@ static void parse_cta_y420cmdb(struct drm_connector *connector,
>>   	*y420cmdb_map = map;
>>   }
>>   
>> -static int add_cea_modes(struct drm_connector *connector,
>> -			 const struct drm_edid *drm_edid)
>> -{
>> -	const struct cea_db *db;
>> -	struct cea_db_iter iter;
>> -	int modes;
>> -
>> -	/* CTA VDB block VICs parsed earlier */
>> -	modes = add_cta_vdb_modes(connector);
>> -
>> -	cea_db_iter_edid_begin(drm_edid, &iter);
>> -	cea_db_iter_for_each(db, &iter) {
>> -		if (cea_db_is_hdmi_vsdb(db)) {
>> -			modes += do_hdmi_vsdb_modes(connector, (const u8 *)db,
>> -						    cea_db_payload_len(db));
>> -		} else if (cea_db_is_y420vdb(db)) {
>> -			const u8 *vdb420 = cea_db_data(db) + 1;
>> -
>> -			/* Add 4:2:0(only) modes present in EDID */
>> -			modes += do_y420vdb_modes(connector, vdb420,
>> -						  cea_db_payload_len(db) - 1);
>> -		}
>> -	}
>> -	cea_db_iter_end(&iter);
>> -
>> -	return modes;
>> -}
>> -
> 
> Is there anything that really requires moving add_cea_modes() down? You
> could just add your new stuff above it, right?
> 
> Again, I'll reply with further comments when I've tracked down a more
> recent spec...

You can obtain the latest (complete) spec from the following link btw:

https://shop.cta.tech/products/a-dtv-profile-for-uncompressed-high-speed-digital-interfaces-ansi-cta-861-i

> 
> BR,
> Jani.
> 
>>   static void fixup_detailed_cea_mode_clock(struct drm_connector *connector,
>>   					  struct drm_display_mode *mode)
>>   {
>> @@ -6018,6 +6089,305 @@ static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *
>>   	}
>>   }
>>   
>> +/* CTA-861 Video Format Descriptor (CTA VFD) */
>> +static void parse_cta_vfd(struct cta_vfd *vfd, const u8 *data, int vfd_len)
>> +{
>> +	vfd->rid = data[0] & 0x3f;
>> +	vfd->bfr50 = data[0] & 0x80;
>> +	vfd->fr24 = data[0] & 0x40;
>> +	vfd->bfr60 = vfd_len > 1 ? (data[1] & 0x80) : 0x1;
>> +	vfd->fr144 = vfd_len > 1 ? (data[1] & 0x40) : 0x0;
>> +	vfd->fr_fact = vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
>> +	vfd->fr48 = vfd_len > 2 ? (data[2] & 0x1) : 0x0;
>> +}
>> +
>> +static bool vfd_has_fr(const struct cta_vfd *vfd, int rate_idx)
>> +{
>> +	static const u8 factors[] = {
>> +		1, 2, 4, 8, 12, 16
>> +	};
>> +	u16 rate = cta_vf_fr[rate_idx];
>> +	u16 factor = 0;
>> +	unsigned int i;
>> +
>> +	switch (rate) {
>> +	case 24:
>> +		return vfd->fr24;
>> +	case 48:
>> +		return vfd->fr48;
>> +	case 144:
>> +		return vfd->fr144;
>> +	}
>> +
>> +	if (!(rate % 25)) {
>> +		if (!vfd->bfr50)
>> +			return false;
>> +
>> +		factor = rate / 25;
>> +	} else if (!(rate % 30)) {
>> +		if (!vfd->bfr60)
>> +			return false;
>> +
>> +		factor = rate / 30;
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(factors); i++)
>> +		if (factor == factors[i] && (vfd->fr_fact & (1 << i)))
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +#define OVT_PIXEL_CLOCK_GRANULARITY	1000		/* Hz */
>> +#define OVT_MIN_HTOTAL_GRANULARITY	8		/* pixels */
>> +#define OVT_MIN_VBLANK_DURATION	460000000	/* ps */
>> +#define OVT_MIN_VBLANK_LINES		20
>> +#define OVT_MIN_VSYNC_LEADING_EDGE	400		/* us */
>> +#define OVT_MIN_VSYNC_LE_LINES		14
>> +#define OVT_MIN_CLOCK_RATE_420		590000000	/* Hz */
>> +#define OVT_PIXEL_FACTOR_420		2
>> +#define OVT_MIN_HBLANK_444		80		/* pixels */
>> +#define OVT_MIN_HBLANK_420		128		/* pixels */
>> +#define OVT_MAX_CHUNK_RATE		650000000	/* Hz */
>> +#define OVT_AUDIO_PACKET_RATE		195000		/* Hz */
>> +#define OVT_AUDIO_PACKET_SIZE		32
>> +#define OVT_LINE_OVERHEAD		32
>> +#define OVT_HSYNC_WIDTH		32
>> +#define OVT_VSYNC_WIDTH		8
>> +
>> +/* OVT Algorthim as specified in CTA-861-I */
>> +static struct drm_display_mode *
>> +calculate_ovt_mode(struct drm_connector *connector, const struct cta_rid *rid,
>> +		   u16 vrate)
>> +{
>> +	u32 max_audio_packets_per_line;
>> +	struct drm_display_mode *mode;
>> +	u32 htotal_granularity_chunk;
>> +	u32 resolution_granularity;
>> +	u32 vtotal_granularity = 1;
>> +	u64 min_pixel_clock_rate;
>> +	u32 htotal_granularity;
>> +	u32 max_vrate = vrate;
>> +	u64 pixel_clock_rate;
>> +	u64 max_active_time;
>> +	u64 min_resolution;
>> +	u32 vsync_position;
>> +	u32 min_line_time;
>> +	u32 min_line_rate;
>> +	u32 min_hblank;
>> +	u32 min_htotal;
>> +	u32 min_vblank;
>> +	u32 min_vtotal;
>> +	u32 htotal;
>> +	u32 vtotal;
>> +	u32 h;
>> +	u64 r;
>> +	u32 v;
>> +
>> +	/* step 1 */
>> +	switch (vrate) {
>> +	case 24:
>> +	case 25:
>> +		max_vrate = 30;
>> +		fallthrough;
>> +	case 30:
>> +		vtotal_granularity = 20;
>> +		break;
>> +	case 48:
>> +	case 50:
>> +		max_vrate = 60;
>> +		fallthrough;
>> +	case 60:
>> +		vtotal_granularity = 20;
>> +		break;
>> +	case 100:
>> +		max_vrate = 120;
>> +		fallthrough;
>> +	case 120:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	case 200:
>> +		max_vrate = 240;
>> +		fallthrough;
>> +	case 240:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	case 300:
>> +		max_vrate = 360;
>> +		fallthrough;
>> +	case 360:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	case 400:
>> +		max_vrate = 480;
>> +		fallthrough;
>> +	case 480:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	}
>> +
>> +	/* step 2 */
>> +	max_active_time = ((u64)1000000000000 / (u64)max_vrate) -
>> +		(u64)OVT_MIN_VBLANK_DURATION;
>> +
>> +	min_line_time = max_active_time / (u64)rid->vactive;
>> +
>> +	min_vblank = max_t(u64, (u64)OVT_MIN_VBLANK_LINES,
>> +			   DIV64_U64_ROUND_UP(OVT_MIN_VBLANK_DURATION,
>> +					      min_line_time));
>> +
>> +	min_vtotal = rid->vactive + min_vblank;
>> +
>> +	if (min_vtotal % vtotal_granularity)
>> +		min_vtotal += vtotal_granularity - (min_vtotal %
>> +						    vtotal_granularity);
>> +
>> +	/* step 3 */
>> +	min_line_rate = max_vrate * min_vtotal;
>> +
>> +	max_audio_packets_per_line = DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE,
>> +						  min_line_rate);
>> +
>> +	/* step 4 */
>> +	min_hblank = OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
>> +		max_audio_packets_per_line;
>> +
>> +	min_htotal = rid->hactive + max(OVT_MIN_HBLANK_444, min_hblank);
>> +
>> +	min_pixel_clock_rate = max_vrate * min_htotal * min_vtotal;
>> +
>> +	htotal_granularity_chunk =
>> +		roundup_pow_of_two(DIV_ROUND_UP(min_pixel_clock_rate,
>> +						OVT_MAX_CHUNK_RATE));
>> +
>> +	htotal_granularity = max(OVT_MIN_HTOTAL_GRANULARITY,
>> +				 htotal_granularity_chunk);
>> +
>> +	if (min_htotal % htotal_granularity)
>> +		min_htotal += htotal_granularity - (min_htotal %
>> +						    htotal_granularity);
>> +
>> +	resolution_granularity = OVT_PIXEL_CLOCK_GRANULARITY /
>> +		gcd(OVT_PIXEL_CLOCK_GRANULARITY, max_vrate);
>> +
>> +	do {
>> +		/* step 5 */
>> +		min_resolution = 0;
>> +		v = min_vtotal;
>> +
>> +		goto loop_end;
>> +
>> +		while (!min_resolution || r <= min_resolution) {
>> +			while (r % resolution_granularity ||
>> +			       max_vrate * r / (h & ~(h - 1)) >
>> +			       OVT_MAX_CHUNK_RATE) {
>> +				h += htotal_granularity;
>> +				r = (u64)h * (u64)v;
>> +			}
>> +
>> +			if (!min_resolution || r < min_resolution) {
>> +				htotal = h;
>> +				vtotal = v;
>> +				min_resolution = r;
>> +			}
>> +
>> +			v += vtotal_granularity;
>> +
>> +loop_end:
>> +			h = min_htotal;
>> +			r = (u64)h * (u64)v;
>> +		}
>> +
>> +		pixel_clock_rate = max_vrate * min_resolution;
>> +
>> +		/* step 6 */
>> +		min_htotal = rid->hactive + max(OVT_MIN_HBLANK_420,
>> +						OVT_PIXEL_FACTOR_420 *
>> +						min_hblank);
>> +	} while (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
>> +		 htotal < min_htotal);
>> +
>> +	/* step 7 */
>> +	vtotal = vtotal * max_vrate / vrate;
>> +
>> +	/* step 8 */
>> +	vsync_position = max(OVT_MIN_VSYNC_LE_LINES,
>> +			     DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LINES *
>> +						(u64)pixel_clock_rate,
>> +						(u64)htotal * (u64)1000000));
>> +
>> +	mode = drm_mode_create(connector->dev);
>> +
>> +	if (!mode)
>> +		return NULL;
>> +
>> +	mode->clock = pixel_clock_rate / 1000;
>> +	mode->hdisplay = rid->hactive;
>> +	mode->hsync_start = htotal - OVT_HSYNC_WIDTH * 2;
>> +	mode->hsync_end = mode->hsync_start + OVT_HSYNC_WIDTH;
>> +	mode->htotal = htotal;
>> +
>> +	mode->vdisplay = rid->vactive;
>> +	mode->vsync_start = vtotal - vsync_position;
>> +	mode->vsync_end = mode->vsync_start + OVT_VSYNC_WIDTH;
>> +	mode->vtotal = vtotal;
>> +
>> +	return mode;
>> +}
>> +
>> +/* CTA-861 Video Format Data Block (CTA VFDB) */
>> +static int add_modes_from_vfdb(struct drm_connector *connector,
>> +			       const struct cea_db *db)
>> +{
>> +	struct drm_display_info *info = &connector->display_info;
>> +	int vfdb_len = cea_db_payload_len(db);
>> +	struct drm_display_mode *mode;
>> +	struct cta_vfd vfd;
>> +	int num_modes = 0;
>> +	int vfd_len;
>> +	int i;
>> +	int j;
>> +
>> +	if (!vfdb_len)
>> +		return 0;
>> +
>> +	vfd_len = (db->data[0] & 0x3) + 1;
>> +
>> +	if (!vfd_len)
>> +		return 0;
>> +
>> +	vfdb_len--;
>> +
>> +	vfdb_len -= (vfdb_len % vfd_len);
>> +
>> +	for (i = 0; i < vfdb_len; i += vfd_len) {
>> +		parse_cta_vfd(&vfd, &db->data[i + 1], vfd_len);
>> +
>> +		if (!vfd.rid || vfd.rid >= ARRAY_SIZE(rids))
>> +			continue;
>> +
>> +		for (j = 1; j < ARRAY_SIZE(cta_vf_fr); j++) {
>> +			if (!vfd_has_fr(&vfd, j) ||
>> +			    (cta_vf_fr[j] < 144 && rid_to_vic[vfd.rid][j - 1]))
>> +				continue;
>> +
>> +			mode = calculate_ovt_mode(connector, &rids[vfd.rid],
>> +						  cta_vf_fr[j]);
>> +
>> +			if (!mode)
>> +				continue;
>> +
>> +			mode->height_mm = info->height_mm;
>> +			mode->width_mm = info->width_mm;
>> +
>> +			drm_mode_probed_add(connector, mode);
>> +			num_modes++;
>> +		}
>> +	}
>> +
>> +	return num_modes;
>> +}
>> +
>>   /*
>>    * Update y420_cmdb_modes based on previously parsed CTA VDB and Y420CMDB.
>>    *
>> @@ -6831,6 +7201,36 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>>   	return num_modes;
>>   }
>>   
>> +static int add_cea_modes(struct drm_connector *connector,
>> +			 const struct drm_edid *drm_edid)
>> +{
>> +	const struct cea_db *db;
>> +	struct cea_db_iter iter;
>> +	int modes;
>> +
>> +	/* CTA VDB block VICs parsed earlier */
>> +	modes = add_cta_vdb_modes(connector);
>> +
>> +	cea_db_iter_edid_begin(drm_edid, &iter);
>> +	cea_db_iter_for_each(db, &iter) {
>> +		if (cea_db_is_hdmi_vsdb(db)) {
>> +			modes += do_hdmi_vsdb_modes(connector, (const u8 *)db,
>> +						    cea_db_payload_len(db));
>> +		} else if (cea_db_is_y420vdb(db)) {
>> +			const u8 *vdb420 = cea_db_data(db) + 1;
>> +
>> +			/* Add 4:2:0(only) modes present in EDID */
>> +			modes += do_y420vdb_modes(connector, vdb420,
>> +						  cea_db_payload_len(db) - 1);
>> +		} else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT) {
>> +			modes += add_modes_from_vfdb(connector, db);
>> +		}
>> +	}
>> +	cea_db_iter_end(&iter);
>> +
>> +	return modes;
>> +}
>> +
>>   static int add_displayid_detailed_modes(struct drm_connector *connector,
>>   					const struct drm_edid *drm_edid)
>>   {
> 
-- 
Hamza

