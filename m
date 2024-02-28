Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDC86B207
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB2E10E576;
	Wed, 28 Feb 2024 14:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yauHJ805";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD2B10E2BE;
 Wed, 28 Feb 2024 14:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTB/vxqgPubXhCFZCxRqzFrs9Sox10wKy5f+sZvOYzOqYx8mncirQ4eWin0REVcPIOYX4YNu8pvxGZnOCHCZx/jj12HADCtonO3TN0jdvVY3lYbgefeFQY/FuQruMpXiMgH65fzI/QW5rdOrLoNSAQ0EGBmU0UG4Y+aQh15E/Cj21XYu795iNC2njQCbAkuKsFyoquSCv+NAaE1KryKIzLSR02QuPDFrQIPhbDJK47ZxBfJtmLKzZJb+bbdkTVCptRJ8Q6IQt5Fixl58pxCpyVLSLtww6dF1u8Ea1q0VdYCadHzdLZOvJfBVSVEG55X4JpPkrXbZO4MsdIJ/6DZSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbP1dxuhSNdRoyT5ggBOc6zLHeeDoDbU8WY69vnhJLQ=;
 b=IeeH7vFdBtU+BzwkDtluEaVjMR6HA9BSXiDpZTSDMC+vDioqWy3XMx+U1qRu1rbLiSX3N81gvZowU9VGcdPQ8A0u6/MzYmi/yuGMaD2dWmfoHKsS1bTcyP1/ryW6ThMQMrlk96W+7+7Hmx8ROsIS84EMa0SrALZVAmiwIFxllQkP5e0jFinpw7e+0uR90srlB9fRfygtO5jndo+fYJZ56Dm9RBZA9zRo0WP1l4r7b3eIOytn6ktBYx/aM1TQGLGpow5I0r8dicllKxt+OwYaUHl+47rxSRMcfkAW1llpslHDBksLfXe3qed0IbzP7sEKuSzKtatpCnTdpGxuqdGMBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbP1dxuhSNdRoyT5ggBOc6zLHeeDoDbU8WY69vnhJLQ=;
 b=yauHJ805g7955BXyz/rUDLxUNpoJB5ceL2y1udzrQm8pbu2VT3iZeOHGhCExVC+yZ9CmIe9iaaEhQAmS0r0ntzhOXwJHZ3LO4A8KoieKyQLk10wb9uBhX60amBDjtO0KpWMl4GJqaJ8+vUp5ZezJDB2CTqOW5t65zOu/WKzNEmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by BN9PR12MB5353.namprd12.prod.outlook.com (2603:10b6:408:102::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 14:42:38 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::2243:aadd:acd3:3455]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::2243:aadd:acd3:3455%4]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 14:42:38 +0000
Message-ID: <ff15f925-626b-4eb7-9c03-d2ed6e2d6500@amd.com>
Date: Wed, 28 Feb 2024 07:42:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] drm/amd/display: Introduce KUnit tests to
 dc_dmub_srv library
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>,
 David Gow <davidgow@google.com>, hersenxs.wu@amd.com, magalilemes00@gmail.com
Cc: kunit-dev@googlegroups.com, tales.aparecida@gmail.com,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 javierm@redhat.com, kernel test robot <lkp@intel.com>
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
 <20240222155811.44096-8-Rodrigo.Siqueira@amd.com> <87jzmro4xa.fsf@intel.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <87jzmro4xa.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:408:142::35) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|BN9PR12MB5353:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a6dc38-f11d-4a7a-c366-08dc386b82bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jF37bC5GsgcjNs0xahQvSwrJ+VMjnBLCKnorOHT/4vy7MeikvOu10BqISe5nlXinc8sFabdl7g1lIQbQJx/DlsFz15jWLrxafo1PhqcHPrPsNIATSxXhBSQiJG2Zkw7AqI7N3HwMu59o149hiNgDOXB7lD96yHxqNkpUCcsxltmxHyqpRmycbIsR/t/5PJy3bAFdmY5EkZnc97wZnJTlOhaYh9FSXiPXqHQEr77YvU1xm8WR1Rj3aPqu/xDF00yWwUy8NoHZ2hhcR/AkOTQp6Y/E3glBp1EVKDbS+GmoZuz8WiPQR4qPcQrw0XNMT/Ce0j1cUmhUYWaobSrzsFKWzdU4MMu5udX0GEMTiu9WbOTwMXi8phWorCmm3pKUzqgcaq5ulQYn9FPdcnNTNy+Aq/46Knq30HhND/GJEUyyYA2tLIUNz7Xh8WvUSADcTgwHA11jF+RGuLP6gqslSenA+TVozyq0AbybNrm3fngMRb4tI3/6DES+0SufGOK1hQC9LsS6ss2L2ifz3pXi2GtcUHa54q9p69rERnjiJY/Ti+0PEelx4j9/JLlCrHt9q3M6J2U5uPWiOXeuVPtDPaPC0/VQXxlzwOU50twjlxTvi0gFEDH4z+SpyFFh0R9C9mTAOSqoIjb18Wifbujp8ygTJ+EIGgbqDAmkPsMJRTdrN15uzuGAAy72p8gOJT544QKfCCGqSb9C0lZt1WRFtkhSeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVY3MFJFU0NjbHlqSENCdmZxRG9aaStHV1MvNU8yWklNdThUQmxlQWZGcTZU?=
 =?utf-8?B?VnhsMWt5VFlTNGYrM0hXMCtrWHhoSytOaXhIZC9CWC9lUFpncXZuSWF1UGNh?=
 =?utf-8?B?QmV2MkxIamlQdUNuUERkK1RyNnBTYVphMWxCb1NCU0pXZDlCNmJ5TFVMdmFy?=
 =?utf-8?B?K0JEalcwLzlucmJoOXMyZHRCSFNJdkhKYlpIYUh2bGhCL25xcEk1bXVic20w?=
 =?utf-8?B?WWhkTnZwejZQYXV6dmRqcXBROWNVODU3Z3Mvc0NlRnVERXp2UDdiZWFxYmps?=
 =?utf-8?B?SnlRMGhHSDBRbHFJbGZNb1dUQkFoOWZlcTZ3WmNrSXVMU20rcTd5UVVXbVNp?=
 =?utf-8?B?ZXU1REpGVUhiVFVEWkVkLzh0d0VNNEUvQUg0MWh3M0NvaWtPUW9HN3RjWERp?=
 =?utf-8?B?TDRlaTUxQWQzbmMrc3ZFcUdYaFZKNUc0V3dEaDEwNUxhVG5QanQ0dXNKcjVq?=
 =?utf-8?B?OFBEV2swZlFkaC9tUFhIMnFqb1ptQlhGVzc5ZTZwNnE1THdIbkRkVUs3ZzU3?=
 =?utf-8?B?UEFnMGdway9BdEd4TnFEVzlHQnNJQlZ4RE1RZG54QUs0eXB3akJXN3h2SWg4?=
 =?utf-8?B?eFllM0xVZ0U1SWhoY09WMFh5T0JNdlRlWkJ3UmVyRGFSVk52ZDFkdm9TUHIw?=
 =?utf-8?B?TGt4UGxsUi9uNGhEek15SExHRWQ1RWxFeDFEQmFOMDlwRGJ6Lzh1ZmI0YkFi?=
 =?utf-8?B?RE1tcTRlTWI4ajdIYXZCdXQxeXh6c2hUYTRXMytMMWxEb3U4cmwxZURjYWdn?=
 =?utf-8?B?S0dtNjloODhxZEN5NCtrVTBzUkc1eXhRUDB6aEtUbTZYYXRSK09oYUtsT2lH?=
 =?utf-8?B?V0h0VHY4TllYc2VsL2V5SC9rYmNNaEM5SEh1MGI5cE84K3ZrTU9pL3p2QmVY?=
 =?utf-8?B?QSt4NlpmZE1EVHBNL3VTSWhVVnlmOWZEcWh0aU1MV05OZ2RyeEw5OG0vc0ZO?=
 =?utf-8?B?Tm12aXJIN0oydFVqdFhEMi95U1luKytnZlppZ3BCZGZNZzUrRi9WMFRZYXdC?=
 =?utf-8?B?VzJiWlBnUzRWc09OQlZiNDdteWxibGtndjFIMmlnQUdJcW1LU3RGWFlSTFlS?=
 =?utf-8?B?Tm1RNTFCaFFvUkp5c012VWNrY3Z0WmozRGVlSXFRWDZsRCswRVIvOUlsR2F5?=
 =?utf-8?B?bmFObWlPWXRROE02L2ZZK1dlc1padVN2YkRoVGEvTEdiQ3psU1BYelNsQ3lS?=
 =?utf-8?B?S0NVZFB2MTdTSzQvUmNQSFE4ejB4b2JudVFwWlN3WEx3S3JkMWNUY0FiNXY0?=
 =?utf-8?B?UHRDQnFBVTE5K0NUUXFPbndWNFBkUmlYZnljZi9tQWdpU3FaMW1qS3dTNkFr?=
 =?utf-8?B?SGZmcytLNTBobEowbzVWTWdrZGdaMFg2SHRvL1ptMjQzNWJUeGJwVHlMcDdO?=
 =?utf-8?B?b1Y3SXd3TzBlSkRLNmJsMjhTcEVicnFQUGovajRBTER2bG9vUUFLVVpiVzBm?=
 =?utf-8?B?dUxld2JwZXk2T2Nhc0J6NytxaGtycW44RFhYSzBneDZEeVNBeFRMbFNTV1hm?=
 =?utf-8?B?SG1HSlREOHNwTFErdEliODlBdUUrQ3FVcGUvalQzRXdMblNLMDAxb05TUFkz?=
 =?utf-8?B?UmovWEhjR1lpQ05JR0g0NTZQTzNFYUhYWTNxTDY3VXN6aU1QQkl6cElWSCto?=
 =?utf-8?B?Q1pPTnJTV2JuZHkwYjhpN3pnTjRPYzdGdkt1UzZ1bXNSMHBxVStSR2x2VjFw?=
 =?utf-8?B?R2dFeFcvekxFUmZTbkNWdEVqTWVKNUFhaUJ2MG5aNTFXeVVGeEVBU1RkMnhO?=
 =?utf-8?B?R1pCcnE4eC85djBaNGJLK1UxMXloQkVyWmNUQTdhaDM4OHd3aXEwdlVRRGI0?=
 =?utf-8?B?c0h5R0dteEtQWGF6aEdTVGVJL1pzQmc1dVBaZmZFYkE3ZjJmbjVid3o0dVZL?=
 =?utf-8?B?OWUyeng3ZEllZ1BhSks4cDhJZ0hJTnNWZk9wZkxGS2Y4bkpscU5TYm5pejk2?=
 =?utf-8?B?Rm5rMDVQOE0xT1RLaGZoSW1URExRUDZBL3FtUXFLdjlEbTZtV1lvME1lb1Na?=
 =?utf-8?B?Y2czMGV5WmlhZXFPb0dBWnp1cWkwTEdOK29jd3NiVWduUHcxc2g5VjhFOEJQ?=
 =?utf-8?B?WC9JY2hjZm9wQlI2NG91NWRkb0dYZGNBOWsxWTZ0T25RRUtIVmFFcmkrdU03?=
 =?utf-8?Q?R76g02jai2BAG2k9xj0I0sXj0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a6dc38-f11d-4a7a-c366-08dc386b82bc
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 14:42:38.7867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQ+F5g7MnfKK+KoT2wlRuZwpE9aevzqmHmmDW5eLpaBTKdVbkDF8r0nqnlslzv80Vc33BRvd7OUY8Es93ncvXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5353
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



On 2/26/24 04:12, Jani Nikula wrote:
> On Thu, 22 Feb 2024, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> wrote:
>> diff --git a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
>> index eb6f81601757..4c5861ad58bd 100644
>> --- a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
>> +++ b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
>> @@ -4,5 +4,6 @@ CONFIG_DRM=y
>>   CONFIG_DRM_AMDGPU=y
>>   CONFIG_DRM_AMD_DC=y
>>   CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
>> +CONFIG_AMD_DC_KUNIT_TEST=y
>>   CONFIG_DCE_KUNIT_TEST=y
>>   CONFIG_DML_KUNIT_TEST=y
> 
> A bit random patch to comment on, but this hunk demonstrates the point:
> 
> Should all the configs have DRM_AMD_ prefix to put them in a
> "namespace"?
> 

You are right! I'll fix this in the next version.

Thanks
Siqueira

> 
> BR,
> Jani.
> 
> 

