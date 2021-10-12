Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B447942A1DF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 12:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDCF6E82D;
	Tue, 12 Oct 2021 10:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685AE6E82D;
 Tue, 12 Oct 2021 10:19:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvHb/dD+5Nsw4ZAjH9VPjIGfWjLKCdN11+NZuAC+d7f9deqGRTYe2iRR/6cX1x5p7V+AMhj7hRJTJQInonc51nrH10cVfsLtuyF7lCCA7Lq0oj1+4WL7DK+wTKjTOcwFlxYyKUKr+C2ghb7WRsCfnnCwsL4DmiPFRUCGOjLMNFDf9Vo+CxmKkdh+fUL/PkwT2Ihxx+9CqnMnlFtPfoEItq62xbFx09Ex5eQeHOTJpqvzTNIxckbAE5XGDQ2qPbg95wsO5LFhzfWPSK/F1wleOONVFKy/U8rP5UpKaZp6rnuQyGcjrjNqQla8we11EuavuzvGWDyaKAeHUlNf5DPu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8umFo93NU1q6+tsHt9Q/NMhXuNvpeu7jBdmYlERyvA=;
 b=bJ0AOkCst8StE2i2h+57QHZQe4w2lrGZ9HaeRJoKpR7vSdf5nYT02iwDpYoVX3PBo8pCH3ItVx38b++bdEuTzBIEvQO8ByBZHs1DJMtLDwg2pe7wS3q7GG4YlHeo5fABKfTdOl0h/knvZNlBNqmi8f1RZIwXnUeWadiSPN7XZPxewyXCsxBglM5nUmvOx4e9G5VaVHEqHxbef7/zv70XgkZ8DjwY7jjInSIQlrxHRtKOW2XO5Lhc/x3CIUqzaEwXpkzyoS2JhY7oJ5jrJ7KUGzS9b7Fn9zJzyIYB+sFuXL3u1MAowbUCYETuErn+7Fvodb0Yc7bwBfpDnVG39kOVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8umFo93NU1q6+tsHt9Q/NMhXuNvpeu7jBdmYlERyvA=;
 b=RPiRV3YDSfigKivyMZ2EkGeKP6FM8143dMwyGefa+PtLBFmuKKa5yvlv7HNwQs16kufGFk93vQgUg9+nQ3l0t2DG04Y8mZcTf3j92BR8D4E59R9B8Be6R+IzAWJEENT31pKXFaf1s5rXZtcYYdAfYjvOQsJl7sMv8fBl8F8kI90=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (13.101.57.247) by
 DM4PR12MB5037.namprd12.prod.outlook.com (13.101.57.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20; Tue, 12 Oct 2021 10:19:53 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:19:52 +0000
Subject: Re: [PATCH 2/5] drm/i915: check dri root before debugfs init
To: "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <20211008091704.27094-2-nirmoy.das@amd.com>
 <95bb9aa6-1e6e-c0da-64ed-30ac31f44b67@intel.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <4d5c92f0-1a9f-27da-c404-d0891aefd32f@amd.com>
Date: Tue, 12 Oct 2021 12:19:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <95bb9aa6-1e6e-c0da-64ed-30ac31f44b67@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0258.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::30) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
Received: from [192.168.178.88] (217.86.110.202) by
 AS9PR06CA0258.eurprd06.prod.outlook.com (2603:10a6:20b:45f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 12 Oct 2021 10:19:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 830bec57-ed74-40d4-db51-08d98d69d480
X-MS-TrafficTypeDiagnostic: DM4PR12MB5037:
X-Microsoft-Antispam-PRVS: <DM4PR12MB503765EB5D107B2CF36D6DAA8BB69@DM4PR12MB5037.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: adj/zHDYZ5kPTigCDnxMKbZ93qQEtMl1dRJPDsggOeRMVs9pIE1/CdwIKc09yXNj9ho21/VyIkCPEbWgdGywNqu8ihmnXMsetbNa+1FcG/cNUatcVlRSVmhF07PX8vxnXQXx6karaTLe2YK+Y51Y8V3x2P++c840L67dS+WuU/YULYvKcKI3D3qfZ3wxdnTA6ooafp19Qa31yKMRqAyLGZ+hgv1x+iSiLR2UDzqBm+dD7ZjbwaYjP33uUqcAaGDeT/EgQPst2nX0hStE9YcKYLuCnyrmUY/9pIlenVavZCftSA9Oq+67focTArfxShx8FQUoJnGOhdCOHRjVBsH9P6Mipo+qxgIPG5PXGd8sns7l5r5dr0YmerrAJkJqFgVwQCu0fUQb86BGXwzAafogTBkM0IbcrZic041RuZlhGmHr7rJ4zIOmyfpPKLRfUuR0508fH5ichKMMfLRQqXKGm/JFxEbUhFDp9jE4yb4sn4qFF3hEXE2nCX2wkNs3pN6W2Gf9fbXcu2fq6c4SgnsF5miu7p/H+tzCFy9IZGjpc6yfYEfT8J5mDZnnHVs1kEKjVb4c2YYD5rwqMe1+EtMr47117geIsHcDnSsXR5yCmNAT7B4qUE5qhwJlt3iB8OF+7ixK9JWdVLgZcNSaGyD5YeTmaiqJiNb5NogUIJMFBQ4pmgGt/bK3wb3FUC1LrxY93V5SoLdG1B9rED9N40UhwjPKiHfZP2NJi2G8gPfWqzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(31686004)(6666004)(38100700002)(5660300002)(966005)(316002)(186003)(8676002)(508600001)(86362001)(110136005)(956004)(36756003)(66476007)(66556008)(2906002)(53546011)(66946007)(26005)(31696002)(2616005)(6486002)(54906003)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXhkMk80elhNK2xmWnZCdlV2VTVWcEd0NGZnejNzLzNjOEFnNnY2WE0zNVRn?=
 =?utf-8?B?cFdhbDkrcHRSUndYTnVUYWxTUVNOdmZ4RjNGL3JoQndlblprM2xDR1NSTHBT?=
 =?utf-8?B?WG83ZkMxVXBMOG1jNDNPbzFxdU1HQVVxS25tdFpCVjcvSnF6SXZYL0c5MW0z?=
 =?utf-8?B?NDNyR1dvWXBXa0h6VktISUt0T1J5aUY0cUJuTUhmUnhnNC9HTDBMZytmWWtr?=
 =?utf-8?B?WTd1bVNRbllGdU9LSEhmOGpSQWxnMTdKc3VoMDAza3dzbHgzZGhKaGxxTkk0?=
 =?utf-8?B?VHNSNGl4NTZJSTVnSzVVNXE1VHNNeXlNZ0V6SDFnUkdOQlJDV0thL1JIQ2U3?=
 =?utf-8?B?R3FiUEZ3U2RHdXJtS0I0bEE4QkNIQ1ErZis3OTlOeEowMUNVMFlYcUlnNEJs?=
 =?utf-8?B?bjVrMlQvYzJIQThBb3dNV0hxWWJFSXFCWm1Zc3pMQUVKcWNZMFpwbEVRcVVW?=
 =?utf-8?B?ajRGQVJleHU5bUo2T1gzT09hUisyZkFqL0xWYk1UaHNjWis3RmprR09QTlJi?=
 =?utf-8?B?K0V2MmR6dGdTLzNXSnRYWjhta2Q2bW9vS1NOOFh5NWRFMzlzaU41aXlQREx5?=
 =?utf-8?B?UE9SWmRLWkNWQ0VZU05CMlcyd3JlOVV2KzRDclZ5NWl2TlJ3Z0pNcE5XTkxy?=
 =?utf-8?B?M1hPT3NEZURPaFRNVko5bEZOZ0pQdEVncTd4NjJ2bUNDN2wvRUJjdzRCYUlY?=
 =?utf-8?B?VnlFT0Exc0tVRkt3TmtBUm8wLzRMK3lkZWsvS0JDbFlIaUV1SzFVRkJtd2dj?=
 =?utf-8?B?UDl2ZkM3L1o1QWNkUjZnRkxncUdBYmxBdjlYR1doOHowWjZJZGFVSUxsUCtx?=
 =?utf-8?B?bWVybzBTQWRYWWNXd3NBSFRtUWk3Wkp1UkFhTVZxT0dEaWlNakdPTFh2cFRI?=
 =?utf-8?B?NmVib1I2Q3EyVUV6MVFTaHRBMXdnWVhGN2k5N3FBQ3VCQmtFN1ppVWhZSWJE?=
 =?utf-8?B?MEZYaTBuaVBlOFNxQjdLTVQxR01STlBYVUhlMjBVaHluemkxSjNpL1dHOEdn?=
 =?utf-8?B?MWpwR0lDUTNKUnhZNElqcUJnYzlUMmtYd3FoTWR4VTZjMDhucnhXRllNVkF1?=
 =?utf-8?B?SmxOS3VZTDJXRDhNd1M3Y1ZyTDNaay9NbzNSWXV1NGNiby9BdXJUM24zUE5z?=
 =?utf-8?B?TGhzZnFGM3ZuVHU3Um14ODdiZk1rU1FXSXJQdzlHdFBKclU0N3A5elFzVkRR?=
 =?utf-8?B?Z21qblVteWpCclVYQ3U0S0JmSmxVTTZtYWdaR0Nwa3kwNGkyQjNDVnFZdHc3?=
 =?utf-8?B?L3V5RlNZWG56dmlvU3J4aktmTnMxZ2pxM1ptVDBXaE9CNGw0SWNFY0FQUkgx?=
 =?utf-8?B?WEFKR3hjNXU1ZmhGQzl1YzVnUWIydHhsSVM1NWtTS0UyUXN3VDE2WWNjc29K?=
 =?utf-8?B?K1BHNVZGSEtNQ09NSXRHVnRrc3VCeUtMckY0T2xaN3VYcVJzNWJTTFBkd044?=
 =?utf-8?B?dzJDTDFCQ05YbVVqOU5XMW9TTCs4b3l1QkRVWXNTSnNnd1BybGlxTVNnaFNi?=
 =?utf-8?B?WjVpWWNXYU10Y0ovaVVJK2hyNklRdWhRZnlNZ3lWK2JlUDAvSEt3WWxDcEhl?=
 =?utf-8?B?NGx6NUp1S0pxeGVXV2g0WlJFRE5SN3ZwZEY5RVVZczlRdnEwN1Z5TjlnOFJl?=
 =?utf-8?B?eFFyNjg1TFVSQjhmNm5Jei9DaVNmYXFPWG1SdHJ2czczcm1udGRJU2N2UXcr?=
 =?utf-8?B?aW93MWpDZDRTVWRpc1NNM3hzaWo4TWlOd3RxUk5wOWtKQW01bGNtSTdwTmx3?=
 =?utf-8?Q?K40BTn3iGnhMLpNRbga9hxsEwOca+GNvlxiiztx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830bec57-ed74-40d4-db51-08d98d69d480
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:19:52.8262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4dSuzqyPiRvMtT8oGqOnIsAe1/zKoEe3hr4xgKZKKUxWnd30rc3XTy5xrwiWJhOhdKYhWfo036ZBpN5oh8ECw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5037
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

Hi Zhi,


Please discard this patch,  review 
https://patchwork.freedesktop.org/patch/458554/?series=95690&rev=1 instead.

minor->debugfs_root wont be NULl as we save debugfs_create_dir()'s return value in that.

Regards,
Nirmoy

On 10/12/2021 11:59 AM, Wang, Zhi A wrote:
> On 10/8/21 9:17 AM, Nirmoy Das wrote:
>> Return early if dri minor root dentry is NULL.
>>
>> CC: Zhenyu Wang <zhenyuw@linux.intel.com>
>> CC: Zhi Wang <zhi.a.wang@intel.com>
>> CC: Jani Nikula <jani.nikula@linux.intel.com>
>> CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> CC: David Airlie <airlied@linux.ie>
>> CC: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> ---
>>    drivers/gpu/drm/i915/gvt/debugfs.c  | 3 +++
>>    drivers/gpu/drm/i915/i915_debugfs.c | 3 +++
>>    2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
>> index 9f1c209d9251..2d47acaa03ee 100644
>> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
>> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
>> @@ -187,6 +187,9 @@ void intel_gvt_debugfs_init(struct intel_gvt *gvt)
>>    {
>>    	struct drm_minor *minor = gvt->gt->i915->drm.primary;
>>
>> +	if (!minor->debugfs_root)
>> +		return;
>> +
>>    	gvt->debugfs_root = debugfs_create_dir("gvt", minor->debugfs_root);
>>
>>    	debugfs_create_ulong("num_tracked_mmio", 0444, gvt->debugfs_root,
>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
>> index 44969f5dde50..d572b686edeb 100644
>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>> @@ -1012,6 +1012,9 @@ void i915_debugfs_register(struct drm_i915_private *dev_priv)
>>    	struct drm_minor *minor = dev_priv->drm.primary;
>>    	int i;
>>
>> +	if (!minor->debugfs_root)
>> +		return;
>> +
>>    	i915_debugfs_params(dev_priv);
>>
>>    	debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,
>> --
>> 2.32.0
>>
> Thanks for the patch. queued.
> Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
