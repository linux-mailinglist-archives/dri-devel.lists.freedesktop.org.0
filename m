Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4FA4AC96B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E22C10F8AA;
	Mon,  7 Feb 2022 19:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10F610F8A2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQMnW9iRawM10xrPgvDYqUKvXBIGa9NDgtiLBiPAUzYOOYtpftkyrW0VimoDJej6rF6wmNVwWHVk3oL27pwjoWmX1c2ysfg61r0oMJTh4HxtT8rZS5dLOzgbKJCdi99uTLeKL5L175k7gEsBPxf0mNhpWREtPKSjhv13KPzrHEXZXTl1/psBcMferhIf5wgMMNRGSwaIHPWXur808BKtF48LoFJ2EKVVWI/bhNp2OEIYpxgeN6AG752eXB3AR4YT7H9n8nGg7tWPUnvUimcq/7zwfL1/xZW6TdunBAQBR7lWk9gw3Z9TyAoDjg8/8al7xwad1WM3rVrir7Lsm5F5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erk1+G03Y9Lc5POnAAD3Yi/ZdbeHofSBaMRhAgz24Ss=;
 b=RvA6XzR3Va31fxtGVLewcRnolSleYRcJgkSKmn40eQ1q5JPhveBiImk/qV99ZUAAyFb6nsMk0mD1Zm3MfOqRiq7N9nKSxjoL04hqpAubACFpR3mMaO2fQcE9hbztYlwrZ1GWtQ5M+JNI+xDuCg3vZniQiIuNmZDzrG1ovs3iBZA1ywlm1FH9nl4awwQtOUQaeew+isyBKJWtAaR+JJc8lTR/thZSVVhF15BZv9wLUmnL+74Y/BHpnh9othuROWP/QsmPDDG6MvZ1MS/K9KY9WVeudoTDlnOEGKzrjfT68ltZiX3/Ken5/gjOZ425JzgqiedomgXH9unv+mgL9EuFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erk1+G03Y9Lc5POnAAD3Yi/ZdbeHofSBaMRhAgz24Ss=;
 b=wSJe+SBEKblDgHd1fUm8Hqj4pmJUnJpaxVsRXQ/YXd0ULOx2yEiw2ZCs+IKfBleULo/Rqya0UYsqzC2U5v3xq75flQDjwrpkQqWvQsziYJxL5n4GgF0I66nBS9OQpkYr/Hz9FzPbaTiw/PZdNpjkeK0fnCbTQ8YJOvtQYSnM6L4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB3889.namprd12.prod.outlook.com (2603:10b6:a03:1ad::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 19:24:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 19:24:59 +0000
Message-ID: <0a16a13a-fb15-7182-7f9a-c3051dcd9339@amd.com>
Date: Mon, 7 Feb 2022 14:24:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 07/23] drm/object: Add default zpos value at reset
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-8-maxime@cerno.tech>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220207163515.1038648-8-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a48e75e-7946-46b6-953a-08d9ea6f87f2
X-MS-TrafficTypeDiagnostic: BY5PR12MB3889:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB388986E920C43382571EDCBB8C2C9@BY5PR12MB3889.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hNpwqtSsPQkVZFcNRl8ekp97SNvbIx/PoychkQ0S1fV6chW7bxL8JnzUytpSFiF4eteBa8r3bj4lYLH43W/yWAqJh7Z7q4pqd/983hYRW4DIO+poWpr8OGUxhU4s0hhnNGKx6dfOD1B0M2ciWeXNjZT4f/hPiY/PQ+h6Jr2mmMuqPMhPDL10bVTr206mnkwRGxlHvOCO7JluYza2B+yRDuGbvT3OE+rf/hvIYdJvFyUJozbLz4vBVtqeD885C+oUF5hs1i4GTZO+EPl1C7n5RaMCYnYhlttE88xgLzq7IApE6fuRqYvoOprvFv7Z0B8O8XRyL3Gvte1vHPgB7YLWTZ7XHC//1iMBIlG36NjrZH2TfLHfIaRI9d9nq8yHhWESrF09iGGXeRh6yxbYSKXBBVHp+XJrjvXS4OWVmfiD3PhtpgeURyE8QkhBrCTQY3J4lHw1noPTLA3YUtyyYUYdNFC5kx/76preaMrWvdOtVjwS3fcTWK1bY07kW5pPCHCY6+rory+rwih61qT8TMFXUQNzPiVKansZflHI5Zu/BxJxVCMkTd5A/IzuiX48AjpqG2GL8OxG/s3bnt3sMkIS149D1VsBfc1xLpkleqKWrQ6g3PXgM29YaKF/IRwRv4Y4xiSvJ1TocUy0DQBpRZ1b0fUdvSNcNPyWnFEvJ4XSZZYggH1WM7PAM7d5LCra35n/gFtsgKka3umUfKpx555YR9wb/B1eIml3gYRM8M+Z2oqr8I9nFOt8fNl+ZXEZh7ED
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6666004)(6512007)(26005)(86362001)(110136005)(6486002)(53546011)(38100700002)(316002)(54906003)(8676002)(186003)(2616005)(31696002)(508600001)(4326008)(8936002)(66946007)(66556008)(66476007)(36756003)(83380400001)(31686004)(2906002)(44832011)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzFzRzZENytQSktkaDRkRTJXYXRPM0ZvdTN4UElzYWhOYlVrcFp3bkplVGhJ?=
 =?utf-8?B?ZzlMdkxiK2dZNFAyY1NMYUJBSWdBblVBTGFLZEZzU1MrWExmVGpSOFhZUk95?=
 =?utf-8?B?UWNlZ1hmNlpjcWhtd2l3N3hjd25DQkkrWkVTeWpRTkVnVWhwZ0llekQrRGlL?=
 =?utf-8?B?OVZzNTJWTUVBZjV6aDI4ZmdIbkVHMnZTRXZqaE9SZDV1N0JReHRGZGMzS2Fj?=
 =?utf-8?B?OGRWYVY1eXZjMWx4N0FRMVFiUkg2TXdKbjlpOFhOdmVNeHp0b09HN01qT3Qr?=
 =?utf-8?B?alZwcWlxYkJIKzUyZXZvRWFQL2VZUmt5cEloc0VsVC9IUFVFY1BaWjd6TTlF?=
 =?utf-8?B?b0srUXlEdEtPQlhXTjZTUjVhMDhpZTRtVjdlbUpoYVM2TC9IYWxwbmp2WFAw?=
 =?utf-8?B?Y1F4bGpXbVVseHdFeGVZU1pGUTRsYmU4cWNOTmRGVmZ6T3ZSQTNGUGdWM1Iv?=
 =?utf-8?B?MkxpNitUbnY1U0NLZkdCRnRkN1pxYXpuYXdZZEJ4bDE4YnRzOEQ4d3UzNkp0?=
 =?utf-8?B?bXc4dVhKTmFML2JZTWtuRUZNM1dwQWVGcFkzaEZkc2VKeW91Y1krMkZSajN3?=
 =?utf-8?B?dGJSVUp2WWorWVgyZ29qbnFIY3JrL0F2d0pMWHZqSDkwNkpHSnRNSjhuaC9C?=
 =?utf-8?B?VU9MVkJmQXZSekxoUVo0K2lmWERYcnNvc2ZZa3pEVGN2T3ZKZXlYODNZdWR0?=
 =?utf-8?B?TDNkOEhvTEdYeVFMckkxczlEL3I3bDErVUIyNm9aNnJxWWFkOGpScGlLRSs5?=
 =?utf-8?B?aUFuSEZRMXJFM1JTSTFsQlVYQ3lHanI3TThQdE1MYWJTOWlDaHU2UW5CUWRa?=
 =?utf-8?B?L2F6MEFoNTFUU3VyQ3o1d1U2V3VrNXBtejkySXBDelFoNS9jY2FBc3Q1QTBQ?=
 =?utf-8?B?QktyOWc5WUhkRUQxdmM4K3VGbERHTllsNndSNnVMbm1yL2s5TVYxdG8rNjY2?=
 =?utf-8?B?bFRueWpDdzJJdEU2RVBEUStiY00rVmRHY2dzOXRGeWNZeGI0R1kwVHFqZHhE?=
 =?utf-8?B?bDYrTEJ3OFV3YmR0NEhzT2pwNG5LbFpXa1JBM3hWdFZCaUZhRzZSQjNISlM0?=
 =?utf-8?B?djNQL1hJNDZXT2VMRDFXdkgrMy8yeC9sc2JMa0g4RkxmR21wOW1UdndkZTBR?=
 =?utf-8?B?N1RRb0JRNGFjcXF0VEhaS3hac3FFQkxidENQU3hyZ1gwcWQzRkhtSi9mSFNT?=
 =?utf-8?B?cWNHWWl5OFRTbXFUTkpaZDN2M0ZmT2l3UkFXRk1xQXZTV2JrbStBNU9aakNO?=
 =?utf-8?B?QUFHSExXanpMejNJZXdaZlByRk5CbTNhR3pXK2hzcWFndkFIa1duRjYvcTVM?=
 =?utf-8?B?OHh2U2NiWVBHaTViMmd6aDY0V012NHZhaElwcHcwTngvTUdDU1FsYkxYV2dW?=
 =?utf-8?B?dldRcDErRDh0c0ZlaFl3WFhkVStWbVdtVGpwS2tBS0R3RWJqcitUdERxLzhT?=
 =?utf-8?B?Nnhzcm05MTg1RGswV1FpbzBUYktoeXAxcHZzYzZjNSt5WWJkVUVLTURvZEJQ?=
 =?utf-8?B?WnRqM0I5M1ZLZ0xPcTg2UExuRFU4aEJHSFo0MDFHNWRXMG1kbWw5cDBVWFl6?=
 =?utf-8?B?ZUI0L2JJZEFOY04zKzhlUndTaGs3WXFJd0dRRFc3RXM2UEFWYXpqZVZWaHNm?=
 =?utf-8?B?MnNvaERrOTQ5YkxCZXVjeEVvUDNPZGg0M2pGa3VmRmVMZDNmUm84Q1RaMGlm?=
 =?utf-8?B?Vy9RcUdRT0d0UDN0bTdzcStJQWFZSUo2N2lhOU1YbnhuVk5rZFZXc1E2VFhk?=
 =?utf-8?B?cWJFVjdKbzdkNHFtOCtscDErdG8wLzRqbklUTGVpc1JqOUlEWllCN1dkaVhi?=
 =?utf-8?B?OXluT05Sc3RqeEtGMEc5V0R5ajA0bXA1TzBlUEJFUDNFdGlVUlB2bHNLcVRD?=
 =?utf-8?B?RmlyTVRycSsvVmF1N3RxckR3NWpDMnB2MS9BWDlWeGxKWlpJVitFSHpkY1ND?=
 =?utf-8?B?TDVMSXdXNjVTVEdGaXJUNHpXZjBxMGZGQTFZL1pkMmN4OVdDakxmQ2UzYytu?=
 =?utf-8?B?SXlTdTEzK3JVRlpwNWgxczdGRmluSFZFY1dmUEVZbWo5WUtPU21KdjM0SEJL?=
 =?utf-8?B?YVFQUGxrQ2NVZFo2dW5HMndDdXJBYUN4UWFVUzJpc1I5QThNbmkzWUVtUHRk?=
 =?utf-8?B?ZWV4b2prdUJlQVdBMmxGSHcxeW9hMENPTVB4SWRSWXVlSVZYSXJjWkxOeFVC?=
 =?utf-8?Q?m+FWxraDT+IFsl73h8PM22A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a48e75e-7946-46b6-953a-08d9ea6f87f2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 19:24:59.5070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4hYyoJ3agxtA1sZ8+l8WBGAAJBgsYDG9o1v7+5B5oWi05EYGJPmbisL5ywGjygl7hsMTQ18Z2mRjQeITQPnPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3889
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-07 11:34, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The drm_plane_create_zpos_property() function asks for an initial value,
> and will set the associated plane state variable with that value if a
> state is present.
> 
> However, that function is usually called at a time where there's no
> state yet. Since the drm_plane_state reset helper doesn't take care of
> reading that value when it's called, it means that in most cases the
> initial value will be 0, or the drivers will have to work around it.
> 
> Let's add some code in __drm_atomic_helper_plane_state_reset() to get
> the initial zpos value if the property has been attached in order to fix
> this.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index ddcf5c2c8e6a..1412cee404ca 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -243,11 +243,22 @@ EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
>  void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>  					   struct drm_plane *plane)
>  {
> +	u64 val;
> +
>  	plane_state->plane = plane;
>  	plane_state->rotation = DRM_MODE_ROTATE_0;
>  
>  	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>  	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
> +
> +	if (plane->zpos_property) {
> +		if (!drm_object_property_get_default_value(&plane->base,
> +							   plane->zpos_property,
> +							   &val)) {
> +			plane_state->zpos = val;
> +			plane_state->normalized_zpos = val;
> +		}
> +	}
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
>  

