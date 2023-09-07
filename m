Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41417972F7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 16:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12F610E7DA;
	Thu,  7 Sep 2023 14:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867F610E0C5;
 Thu,  7 Sep 2023 14:11:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djlec+Lgv8A+xzLGtZ40IZ38ZzvJHxH9CswlJeAfw0KT5VtmScYsIfmbfX/lg3zdiEcg+mO8Y9OPDPAIS2vN0/M1nreHLk9hNMTcvYbZBbL7/UTF+R7y00wvA/sNBeSZ/7svzx/Lx2lEuELIT+YOT1Tklivf3jbRtRRlZmNdodJmKJIeXBF0D34ewKLvV36CDZUzG625W9uxamWicZWWbIXRog1zCITyqbEBWmT+BOgeYFC1Wp1hSgE1w+L6UhebPuC9lSvTqQlkTh8wZ+rAd0LNnC0XP3Lbji5+ce2NyG/3YgYAHjBUinjgAhNZ2SUYGpC/fhQECqWKfOkrIFzs3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4leLCQ6v/2XjUnrZcFryZOPkoOrK7+ZFt8se63Pyfs=;
 b=LPZO4WPLebXvrs7i2gZdAFaf4e+zpE0wFoiOAMtFaHuEimwcABECu7dD+U6xo6eW4eGL7KRNougBK3vTWk3a2xQk4mJOhJ6hZkpHMgqPJ9ystxpTiEgkQcjNNetaw4Qh7eSNBQ5Q9Xzm4qay9sRIaIN7TLSHd5zz4Jnosh/tMD55azitNwAfjPbb7KfDu+y0eh2u10VWY5Jt4GH4RgSwPFfGHycboMvVYCynIEJGRHe8ZyYRX0lSB7qCYXcaeiK8rqy+jNwytdObt/XgaWJpIVLPemBb+Vrps6HnP9i0COZVPbGB6ZJM1iZT4UlREA1+eWyi7TGdN0Ur5R6YiP68wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4leLCQ6v/2XjUnrZcFryZOPkoOrK7+ZFt8se63Pyfs=;
 b=y/C2A6zaBPkcmDIxMf6Y0kY9FSuNOvwQW+G0N91s1CppaG3NlF+QFTIFbsU9fKCMhCmhCZzzhthIH6lFxcL0frShHNBi1zJi1p6GP/7W36271UZRYx0yUoyDziUpYTHOzdrtLezvvHjKuMKjmAEro0QSWAf2LZIOVzfcMU5dXjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB6037.namprd12.prod.outlook.com (2603:10b6:8:b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 14:10:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.035; Thu, 7 Sep 2023
 14:10:57 +0000
Message-ID: <b8d1e0b8-61b5-4e6a-a95c-3095f97bb376@amd.com>
Date: Thu, 7 Sep 2023 10:10:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/34] drm/amd/display: explicitly define EOTF and
 inverse EOTF
To: Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-8-mwen@igalia.com>
 <20230822140242.162a843a.pekka.paalanen@collabora.com>
 <20230825141639.vurga52ysal37n2m@mail.igalia.com>
 <40f1fabe-69ce-4b23-aed8-9f0837fe9988@amd.com>
 <20230907104917.7cf8e22e.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230907104917.7cf8e22e.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: cd94fb24-0dc7-488f-a123-08dbafac418d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g99osMNDGbpJJ2B4pkMGtJmaiUPh1SEAlzNwhnq/SUoA4zyzSpYelc6NPjIiNHHrtET9h+guK+BRTWnauj5gbSXwjdSMMZ71hIRishF/u/jFK1dXvOoFfOgyUHfKSF3TEUSOnw0auc7q8hD2Ngsfy8yEWxwKPO/+y3U0im3VPTA6iDqGd4kqK50XbK4UISicNXht+1l8oIEdI8/5MUFC2h/RujaetB4EFtgb9aKOU59sYcU4BxbfyEWEIxOKzeI9ezI1oQW1PV0J8YcwlOEN/J+CmoTFFUhBAp4Nglx78byple0dztaPu4aTZDgLb4NvqvIDWh8CDbXHW6oFduQV01NOAjjuwmHd8zHwxGMbK0rbvNcojyYVkrpwU8LByC0W4xcVouwCGizm0vbFcBNVU0/K+OQLFoQMLoNiRWzmFLEb6Rx5l/OI/3FZLdPcSCo4LqaMzfSaLWofVn+Dvc/N5QCROVF8H8RCxrJZnDdBG1VyMGgdg2xzyE83b/TGhyygLmmCM9zrejEqa1mo94c5u9NeQVcljGUj9HHMh/qxSU4BFrZOdVDsXRTVi9HPxTJn3jeeyyYHuE/m+KJkxAenCxxXq2PmXnY1BrJV3QFGyZAk7pL6/eN0NyQeU870IbRJb0do8sAe1ItcXHk9IuxLRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(1800799009)(186009)(451199024)(8676002)(4326008)(8936002)(83380400001)(966005)(478600001)(54906003)(6916009)(66476007)(66556008)(66946007)(53546011)(6486002)(6512007)(26005)(6666004)(6506007)(7416002)(41300700001)(316002)(2906002)(5660300002)(38100700002)(44832011)(2616005)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUViTjNhamVESFZCRE4vSmxkV2FVWFV3MUVRNWo3ejRBWG5Cck9XSTBIcnlp?=
 =?utf-8?B?VXZoN0JZNXhyZ01YZ2orRDRYdHc0SEJHSnJiUjlrOGNsdUlJZGJSNThjU3Rv?=
 =?utf-8?B?c3Q1dGswc1AxL1FOdXRnQWlURjRYQmpSemJockw0ekNUeVoyTTFZTlozN2Rt?=
 =?utf-8?B?YWJ4VXVidU40aVdLY1NrVHIwMDk0c0NBd3pNcVZuZHdaY1FSWmlMOWNybGJF?=
 =?utf-8?B?dzlSUm5EZW92V1c1Tm5DUEJmUjJBNFVhSXZiM3EvS0ZJVDNIbTBxTmZ5ZURi?=
 =?utf-8?B?NjBoZld3TEU5OVlMU0orZG9uY0hadmZTbXVWWHBrMjlaOXEwOHcvVU11WG45?=
 =?utf-8?B?VUdkVXJOeEwyc285S1lLYXhVT1UxN29GQkp5ZHlaNGphMXJuWmI1N2trR2Qy?=
 =?utf-8?B?dFFGNC9VVjZYSk5LRUdjNmFxdks3TUdNeElURkhKRVpiRFdwcXFNbi9NOFZm?=
 =?utf-8?B?U0kxbG4xcy9GODRFaFpKU3NJQXVCUU9jNHVMQllTN252SEhha1pjRUVReVN3?=
 =?utf-8?B?eVc4WEFuWlJUb2FweFViTGE0eHlQU0ZtNFFkbDBmVmNtRmZKQS92MndpQzNh?=
 =?utf-8?B?bGdDVExDZlZrVkZoQzh5NUZuSExCSStSVmZVNlFCdUdiQWxyY1B1T0VrQ2FT?=
 =?utf-8?B?Y2pPQUR2b3FZc3kySWZBZ0Mxai8rTzBnOTU3TW0rei9wckdCSWpiZlNXK1BB?=
 =?utf-8?B?MHJlcTBaK1ZaYzQrTjdERUZaRDZ1dFpvQ1psSDcwdk1OWXpMdFRTNHprcWJL?=
 =?utf-8?B?b3VveUpCK21GaGIyekg4TXQ2YzBoNlRzMVNLdjByV2VyekFNWGtVeWFQSi82?=
 =?utf-8?B?SmRUbGJKdE52ZkpaQkxSdkp3a0E5YmVCdGhGaWlCZkc1KzAzS2swcFBxMkNw?=
 =?utf-8?B?ZHQwdFY4M2ZpRjBTRHhQWDlkOVFxVktXZ1hCNDBZY2xLeHNHYXp2c3NyVXdJ?=
 =?utf-8?B?QnFBZmNpbHViOU8zT0FmOHRzSkc0R3VJWnVCc0ZIQjZQbkZtQ2FuZWJWNllW?=
 =?utf-8?B?dnZiRUN4Y082a0cxdlRDRFdDVEszYzFLZ0V4bWF1L3RQbWdsd05MS1d6cVV3?=
 =?utf-8?B?YXNsNnduRk42anJBQWFZM0FZTms1aTYycUNGNjA5aGVkRjg4QW9NZ2lxSThj?=
 =?utf-8?B?VjJPbVluMVJzd0lraWpER2IyUXdCSk9uSGtpVHZFdEVjTmpKSGsxNll5SUY4?=
 =?utf-8?B?elN4cjY5SHp2SHYzU2R4bXNYZEsyb0RZRTFsbXUybjZ4OE9WSVg1emkrOGVj?=
 =?utf-8?B?M3dhQjArV3Fjb21oc0svRlBJN2RHOEFGMzJNSE40ZFZPVkxHTjV3WGhQbm00?=
 =?utf-8?B?MEFyKzBqUE9PY2VwQ0RXdy9WVC9zSnMrTU15UkhMQnpBaU5PSFVFK3pDUnVC?=
 =?utf-8?B?SVFqVjJ6STAyME40MUx3ZDg1Sit1OXl0U0FWdXFGKzZ6WGFxNEVVK3FEeng4?=
 =?utf-8?B?aEdsN0MySVdyandwV04rbVIzOHpNd2FHdXE4dlFKSWJ4RHBmK0RwMSs1UGQr?=
 =?utf-8?B?Ynk2bElYeTFUVDZJRlJPaW1PVWx2VTFZd1NGSS9wOXBwZ3dNa01hamlpYWVv?=
 =?utf-8?B?aUNVTjN5UDZVaE4xQitKYXZnVitSZDFoZ0dXTTF1VStGQWtQMEJRNkhpd25j?=
 =?utf-8?B?QUpYRGNqTmFyU1lTd0RRcE1LU2ZiUEhMNjRnajk4SDZmaHh6NDQ0eVV0NXFQ?=
 =?utf-8?B?S2dLREhNSDRhMVhqa1poNnd1bjg1U21FQnBTMVkybGo4RVhrOCtYZnNvbFcv?=
 =?utf-8?B?bFJGNEpXMFZMU0RabDgwS1ZVZVpyM1J6cjhEZnNtUllUQ01jTU5ZMXA4eHZG?=
 =?utf-8?B?YkxxY3lPSFdzL0t4YVdtMHQ3RjBOeGxSWXN6VVJub1dlMzlhaU9DYjI5Mmt6?=
 =?utf-8?B?b1d5aVUrenhkY2VZeFNnK0J5V2hINXQ1QkkxemxWTnVxejB2OWprbXhyaFVy?=
 =?utf-8?B?enB1OWxYa0lCR2IzL2VTSVdzdEZzTXFXdXFFc1o0UVZGdjhpb2R3UWd1djdG?=
 =?utf-8?B?R1Fsb1pGNy9RaDJCc2lFa0hweUgwWjJuV2Z1em0wY0RtNmpPNFhHVU1tQ1l6?=
 =?utf-8?B?UWhVOHdiZ3U2ZmNCbVQ5TmZ3Z3VrTnNqbVNLY3h1NnQ3L2h2OVVuMkwyNnRL?=
 =?utf-8?Q?Mite77AOwZmm+Nv3JkHf2Ayxe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd94fb24-0dc7-488f-a123-08dbafac418d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 14:10:57.4382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSdovsFOrMO5CarwuQ2aIB9ZYaRw/KrrSOdrJny5xAMZkgnXCrUphqXdep9S6YFp8uhHsl4JTHUC+ZsO1ZHuPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6037
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-07 03:49, Pekka Paalanen wrote:
> On Wed, 6 Sep 2023 16:15:10 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2023-08-25 10:18, Melissa Wen wrote:
>>> On 08/22, Pekka Paalanen wrote:  
>>>> On Thu, 10 Aug 2023 15:02:47 -0100
>>>> Melissa Wen <mwen@igalia.com> wrote:
>>>>  
>>>>> Instead of relying on color block names to get the transfer function
>>>>> intention regarding encoding pixel's luminance, define supported
>>>>> Electro-Optical Transfer Functions (EOTFs) and inverse EOTFs, that
>>>>> includes pure gamma or standardized transfer functions.
>>>>>
>>>>> Suggested-by: Harry Wentland <harry.wentland@amd.com>
>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>> ---
>>>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 19 +++--
>>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 69 +++++++++++++++----
>>>>>  2 files changed, 67 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>> index c749c9cb3d94..f6251ed89684 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>> @@ -718,14 +718,21 @@ extern const struct amdgpu_ip_block_version dm_ip_block;
>>>>>  
>>>>>  enum amdgpu_transfer_function {
>>>>>  	AMDGPU_TRANSFER_FUNCTION_DEFAULT,
>>>>> -	AMDGPU_TRANSFER_FUNCTION_SRGB,
>>>>> -	AMDGPU_TRANSFER_FUNCTION_BT709,
>>>>> -	AMDGPU_TRANSFER_FUNCTION_PQ,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_BT709_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_PQ_EOTF,
>>>>>  	AMDGPU_TRANSFER_FUNCTION_LINEAR,
>>>>>  	AMDGPU_TRANSFER_FUNCTION_UNITY,
>>>>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA22,
>>>>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA24,
>>>>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA26,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF,
>>>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF,
>>>>> +        AMDGPU_TRANSFER_FUNCTION_COUNT
>>>>>  };
>>>>>  
>>>>>  struct dm_plane_state {
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>>> index 56ce008b9095..cc2187c0879a 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>>> @@ -85,18 +85,59 @@ void amdgpu_dm_init_color_mod(void)
>>>>>  }
>>>>>  
>>>>>  #ifdef AMD_PRIVATE_COLOR
>>>>> -static const struct drm_prop_enum_list amdgpu_transfer_function_enum_list[] = {
>>>>> -	{ AMDGPU_TRANSFER_FUNCTION_DEFAULT, "Default" },
>>>>> -	{ AMDGPU_TRANSFER_FUNCTION_SRGB, "sRGB" },
>>>>> -	{ AMDGPU_TRANSFER_FUNCTION_BT709, "BT.709" },
>>>>> -	{ AMDGPU_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
>>>>> -	{ AMDGPU_TRANSFER_FUNCTION_LINEAR, "Linear" },
>>>>> -	{ AMDGPU_TRANSFER_FUNCTION_UNITY, "Unity" },
>>>>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
>>>>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
>>>>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
>>>>> +static const char * const
>>>>> +amdgpu_transfer_function_names[] = {
>>>>> +	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		= "Default",
>>>>> +	[AMDGPU_TRANSFER_FUNCTION_LINEAR]		= "Linear",  
>>>>
>>>> Hi,
>>>>
>>>> if the below is identity, then what is linear? Is there a coefficient
>>>> (multiplier) somewhere? Offset?
>>>>  
>>>>> +	[AMDGPU_TRANSFER_FUNCTION_UNITY]		= "Unity",  
>>>>
>>>> Should "Unity" be called "Identity"?  
>>>
>>> AFAIU, AMD treats Linear and Unity as the same: Identity. So, IIUC,
>>> indeed merging both as identity sounds the best approach.     
>>
>> Agreed.
>>
>>>>
>>>> Doesn't unity mean that the output is always 1.0 regardless of input?
>>>>  
>>>>> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF]		= "sRGB EOTF",
>>>>> +	[AMDGPU_TRANSFER_FUNCTION_BT709_EOTF]		= "BT.709 EOTF",  
>>>>
>>>> BT.709 says about "Overall opto-electronic transfer characteristics at
>>>> source":
>>>>
>>>> 	In typical production practice the encoding function of image
>>>> 	sources is adjusted so that the final picture has the desired
>>>> 	look, as viewed on a reference monitor having the reference
>>>> 	decoding function of Recommendation ITU-R BT.1886, in the
>>>> 	reference viewing environment defined in Recommendation ITU-R
>>>> 	BT.2035.
>>>>
>>>> IOW, typically people tweak the encoding function instead of using
>>>> BT.709 OETF as is, which means that inverting the BT.709 OETF produces
>>>> something slightly unknown. The note about BT.1886 means that that
>>>> something is also not quite how it's supposed to be turned into light.
>>>>
>>>> Should this enum item be "BT.709 inverse OETF" and respectively below a
>>>> "BT.709 OETF"?
>>>>
>>>> What curve does the hardware actually implement?  
>>>
>>> Hmmmm.. I think I got confused in using OETF here since it's done within
>>> a camera. Looking at the coefficients used by AMD color module when not
>>> using ROM but build encoding and decoding curves[1] on pre-defined TF
>>> setup, I understand it's using OETF parameters for building both sRGB
>>> and BT 709:
>>>
>>> ```
>>> /*sRGB     709     2.2 2.4 P3*/
>>> static const int32_t numerator01[] = { 31308,   180000, 0,  0,  0};
>>> static const int32_t numerator02[] = { 12920,   4500,   0,  0,  0};
>>> static const int32_t numerator03[] = { 55,      99,     0,  0,  0};
>>> static const int32_t numerator04[] = { 55,      99,     0,  0,  0};
>>> static const int32_t numerator05[] = { 2400,    2222,   2200, 2400, 2600};
>>> ```
>>>   
>>
>> The first column here looks like the sRGB coefficients in Skia:
>> https://skia.googlesource.com/skia/+/19936eb1b23fef5187b07fb2e0e67dcf605c0672/include/core/SkColorSpace.h#46
>>
>> The color module uses the same coefficients to calculate the transform
>> to linear space and from linear space. So it would support a TF and its
>> inverse.
>>
>> From what I understand for sRGB and PQ its the EOTF and its inverse.
>>
>> For BT.709 we should probably call it BT.709 inverse OETF (instead of
>> EOTF) and BT.709 OETF (instead of inverse EOTF).
>>
>> While I'm okay to move ahead with these AMD driver-specific properties
>> without IGT tests (since they're not enabled and not UABI) we really
>> need IGT tests once they become UABI with the Color Pipeline API. And we
>> need more than just CRC testing. We'll need to do pixel-by-pixel comparison
>> so we can verify that the KMS driver behaves exactly how we expect for a
>> large range of values.
> 
> Yes, please, very much, about the generic color UAPI.
> 
> I believe IGT should contain the reference curve for all named fixed
> curves computed with standard libc math functions in double precision,
> and compute error statistics between that and hardware results.
> The actual test image would iterate through e.g. 1024 (all 10-bit
> values for integer format framebuffer) different values - 1024 is
> nothing as a number of pixels. Then we decide on acceptable error
> thresholds.
> 

1024 isn't a lot of values and fine if we test R, G, and B independently.
Unfortunately 1024^3 is about a billion pixels, so for testing 3DLUTs
(or other cases where we need to test the combination of RGB together)
we won't be able to cover all inputs with a single framebuffer.

> It should also be tested with a floating-point framebuffer format, FP16
> or FP32, with a value distribution designed to be sensitive to typical
> numerical problems. For example, an inverse EOTF should be carefully
> tested with values near zero, since those are the most problematic and
> likely cause the most visible errors.
> 
> Once all that is done, we can be very sure of what curve any hardware
> actually implements.
> 
> I might even go far enough to suggest that any generic color UAPI with
> named fixed curves cannot land without such tests.
> 

I tend to agree, though I think the same should on some level apply to
custom LUTs or other custom transforms.

The IGT tests I'm writing will each have a "transform" function that does
the transform in CPU as reference.

Harry

> 
> Thanks,
> pq
> 
>>
>> Harry
>>
>>> Then EOTF and inverse EOTF for PQ [2], and OETF and it seems an inverse
>>> OETF but called EOTF for HLG[3]. But I'm an external dev, better if
>>> Harry can confirm.
>>>
>>> Thank you for pointing it out.
>>>
>>> [1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/display/modules/color/color_gamma.c#n55
>>> [2] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/display/modules/color/color_gamma.c#n106
>>> [3] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/display/modules/color/color_gamma.c#n174
>>>   
>>>>
>>>> The others seem fine to me.
>>>>
>>>>
>>>> Thanks,
>>>> pq

