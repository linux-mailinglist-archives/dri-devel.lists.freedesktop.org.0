Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66253357268
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 18:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2B66E0CD;
	Wed,  7 Apr 2021 16:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705C26E09A;
 Wed,  7 Apr 2021 16:52:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwD2d0NJhfWYA8yFse5oV+yXjItawLbpMUS75j7s9m/+Ipkod6zgiMmHAzP19rCYLlkCr7lzyOaDh1jbrspxqmuDIOGHtZdNH8uGFWiMFZx0Xli6uHs04PIuAuNWS9j6YjgnPLWo8O+Gs44VXiOxD6RNJcTM/Hbr+1zNnk+sTYNIrSxWrWRKTejmQFPBllH2WRqL7/CYnXbrSNKPZHlBKE334Pdoih4WDeuIydM6nh9I3ajgkYkTxafKPfQLbo3qAyLDLBspL2+abSscMGEtTEiN+reEeL2GCDIrHxA03rwjOnjBY/ugb9A7xW5Xw6CjxtzLg9HbWzM3G0HDU70KNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=429RDK61y8hKZCRTo9hK99aC2VJSzztnIH6kWr43ZPE=;
 b=H55KGOKlJw4hBAT5nAOKg4FWEJ7ApMPVnSOfOoo278/C8MyyGOtaKNOwV8wMQcb7vKJsFZgqXAf/EuHdsXTAWqeKo5cCJ5z40gdI8fT5sf/tgGvci0XYlcXCOaUAkgX2aei5I/aPkaHMPHx+qMqJNvL3vDRJLfZYXRhiHbc5LGXBDisCxAfS+rmfudDn0lX2EETY7u0y/AnwdYafhABKMIqTcnck+MTXx175+rdIhG0qL83jAQbhgEJCZflO1VNAEC2a1ZjE4HM+f7wy4P67GlLzhSuakBGX/e6CQef345LpLtUXW1vd3xClgbFmrHomGWuuJ4pbZy3d0IZdPzdagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=429RDK61y8hKZCRTo9hK99aC2VJSzztnIH6kWr43ZPE=;
 b=Q9xEb2JSX+vgMZaLPjPj5DvUhrhX1fw9bs9DjDy+q2SJv/90zsBK/CUBuw7FiK+VLdKN4RFfwgqomILUGBzLUGdDWWpjdz6X5F2XLb16zLvy1EBh3lBlpjSuDZiIrq3u0m9Lyd0vKVU6UW5OZfGsUDYnnDdsiG0yiDMAOgJdx6o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by BLAPR05MB7412.namprd05.prod.outlook.com (2603:10b6:208:297::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8; Wed, 7 Apr
 2021 16:52:15 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 16:52:15 +0000
Subject: Re: [PATCH 6/8] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, shashank.sharma@amd.com, sam@ravnborg.org,
 emil.velikov@collabora.com, Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-7-tzimmermann@suse.de>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <72258a23-0ede-8299-2589-416416f35ea3@vmware.com>
Date: Wed, 7 Apr 2021 12:52:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210406090903.7019-7-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL1PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:208:256::22) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL1PR13CA0017.namprd13.prod.outlook.com (2603:10b6:208:256::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.9 via Frontend
 Transport; Wed, 7 Apr 2021 16:52:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faa734f1-9489-4932-855d-08d8f9e57ef2
X-MS-TrafficTypeDiagnostic: BLAPR05MB7412:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR05MB74127B9F36423F5F8AB8BFF8CE759@BLAPR05MB7412.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NnM8L+ccqqyUHt/gDUybXrg8V5XRMuXQZ4f1A48nY6Bdb1zJNFhfraGZcXe9D5RUWJgRKTHgClaJRU7hzBbzVHE2eWF99JI8P0hVtztsr4O3BODVimpO17iOZQa2WfvbWFb19oTtmIgLVZJL8OdNsyTgwQWrMktd+pM4F+AMN++3sqy3LVAgU8uCazWhj8vyAh0tdMqtldHfrO2sMHwQhaDGhryUV7crFjFi13yZoJJr0xq8wZL0My3o7yEMYZ+gCkru/XSuksz63QMNdELyL1UPJZE/ud+Za4NlWWy8eBhOTRMLk3qXk34zlCgKDCGi0z/HmYOHx8b2mez7nYGmgTWkdLW5g5K6ODVhmZos7T52t3PTrsIbt0ZJb/qRYNOl51A0tc+QpOCu7STEgGrQeIpZPkoIUwC1I6NqUc0URqllBUNvCnEIZvG/qfCE5eoFTCTctllkeVroJ3jY81o05TIyPi/2F+MW3fMqjX5QpoagdHdBEfCxWN1cUb78MMVTxs6iZrE1NTV5hlXJ90Ir4CpYEuSAV8XjSnCSXPcaO4Wa5l+JgrQG3dlEk2T+Nqryk+eFZj0zy+rxwA3xW97ioQqAInNDITt5F7oMc72EcoZHPT/MMyx302E3iv5ZvAGACh9IVkCyND9p19GKXevk8U9Kt+tB81G3qdM5mhdTttlzaUMEtso5JGvaM3Svuayn3jFxdFfqTLTiHX5p2sQmHc2cHJvWYd7vkOqPVnaRCnS2NI06lDkWwcmutZsTgq8kep+cJsmWa0WyKFkTNxEhwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(86362001)(8936002)(921005)(2616005)(66556008)(36756003)(478600001)(66476007)(186003)(66946007)(26005)(16526019)(16576012)(31696002)(31686004)(83380400001)(956004)(5660300002)(6486002)(2906002)(7416002)(4326008)(53546011)(316002)(38100700001)(8676002)(40753002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUJPS2MxS0FUcTR6NG14NkErM3oyb1NIelhjNVk4b3RBTUtUVks5am1OZHlk?=
 =?utf-8?B?RWxwaDh0RE14V3hTRG1KOXh3b1JRL29jajJHWWlYQVRuNnpUVlNGclFxeXF4?=
 =?utf-8?B?RjhWSmpWR3VDK0lKTGo0bC9ub0FqQ280WVpsUm1VOU93ekhKUDMxRmVFTHg4?=
 =?utf-8?B?Z1M5V0R4T1dCS2pzUmFjV2RuN1lycmxrSFZuMjY4Wi9EUjU4Q2hMdGRWTGUr?=
 =?utf-8?B?dzY0d2FVRWRWdVhySzhiV0JZMDVSdFRxbHdTL1lBT3pERlRNUHorakJoODlB?=
 =?utf-8?B?LzdHcFZTMmhteGlwUkk1cjQ1K0ZhMzZYaEozZHgwTGRCNG5ERkxEeFpqUWZl?=
 =?utf-8?B?UjVKSzBzMVVzQi8wVmxneDhmV0pVY3pxTDArbmtlVDAzVUR4VjB6TzBhaDNI?=
 =?utf-8?B?UVlkRnJZTU1RL0J4WDRidFpyMXRYWEVSSFpyaWRnVzUzb0hFUDB1TjlSNG9C?=
 =?utf-8?B?TnJCWC8zV21MUTUvdjFsTDVSaHhsT3ZYZGUvSTFFSUQrT09kSWwxVmZXSmJv?=
 =?utf-8?B?WUFBTFdmMlZ0UUdNeTJ5ckJBSldzVzVWOHcrYXkvYkZpMm5MeUVjWDVpS0dW?=
 =?utf-8?B?S3JKQ3RzakgrZE5VUTMrMXdjRitWVm4vOS8xQ2dFU1l4YkhmOG9raFpRa3ZY?=
 =?utf-8?B?TzlWZTh3d2pBMCswZGVlTnp3VWh2TkpUOXRDcmJkQS9SOUZucFh4ZUdZRWdH?=
 =?utf-8?B?TmUwbVM0N1lDUmVZY3VnQUpRNUdYOG4xRkk3RlROZnBZQW43KzlZYmt5bFNn?=
 =?utf-8?B?Y29laWl4bllwZ0FFZm5mRUFEb3V2WWRKTkUzRHNVRndTMnhmVDc0Z2QrcWFH?=
 =?utf-8?B?dmRDZUNnSm91c2p4YjBORnNSMjBCTk0ybkRkM01MdUpENk9ya1ZmZkEreFQ0?=
 =?utf-8?B?V1B6YTdUSzdSTG81RVk2RldQZVZKaEVMZUVyM0gxMENSakM3bGY4SzlQNVNB?=
 =?utf-8?B?dys2WGt4empPL3pjOEVoM3d1RkwwTjM4ejZKNGtpemJCZXlMNlJNYWxmOGdr?=
 =?utf-8?B?dHVoSmlhU1dUKzh4aHBZZHZJZitpR25TMzBWOHhydytqTm1KVndTTUVyUFdo?=
 =?utf-8?B?NXpzMjllU0xGRU5mZTc4VUVxeGtnbTRDbnRtS3FXUUtGbzJSd1RSTENzb3kr?=
 =?utf-8?B?bnlZNjlKNlVJanRER09jY2l1OGRIa2U4VW1tK01OK0dHcXZVeERZNjc5OEVk?=
 =?utf-8?B?ak9Ob1hvdm5pdTBFN09sZEY5SzdjZ1JUWFhhS2tmc0M3OU45Y3pyS1prZU1D?=
 =?utf-8?B?VDdmL1p5MjZaM1BRQ2JOYm1VVDhOM3hJUHRCRHlxbW9QbVRVMVdJb1pwYkx0?=
 =?utf-8?B?QkROQjY2YXNScXNSd2czSVZWbVRsaVRhdm1pVUFUaHJPT0F1RXg5RW5lWHFF?=
 =?utf-8?B?c3JVQUpsS1Z0dGFHSDVLbWN3aUVRcHpDKytXdnRxVkdEekJrQ3JZdXk0aGdS?=
 =?utf-8?B?TCs3SCtpOXIxcUlhTDJsNVg0WXVEb2ZyYkF1bmRCWUVFVnBpbGNQU0Mrb2Vp?=
 =?utf-8?B?cFIwWFpyR0dHUEJoR1BUMTdXMXFvNndNbzdjZHFmcEYzVWYxaXdzWHJHanVn?=
 =?utf-8?B?dWhJeWtGa0lRczJvbGl6MTVBL1cxYmM5WHBwQ3BneDBYbk1qcjJlazFjUCs5?=
 =?utf-8?B?bWl6SVRoTk5XTEcxcGlRMVpHRUhyTXJjNUNqUVpzNnU1WkhMVFBpVVg2ZGRH?=
 =?utf-8?B?SUgxd1RrOEVHUXh0aVJIYndqRG82TCtLcXpFanJSeU0wcjE2S0ZlU0s4OXpD?=
 =?utf-8?Q?PudAM66zSyHB3HiJwi/I3pKmkfTafCKtsTAO5Su?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa734f1-9489-4932-855d-08d8f9e57ef2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 16:52:15.1871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtLmVkQ9iuYgowzwkofBU1EmuRlpxS8ce8/BgpspfMIbbFRC3FRjPcEiFiN1azbyFbWtEqTe89mb7+XiU1ZiWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR05MB7412
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/21 5:09 AM, Thomas Zimmermann wrote:
> The vmwgfx driver is the only remaining user of ttm_bo_mmap(). Inline
> the code. The internal helper ttm_bo_vm_lookup() is now also part of
> vmwgfx as vmw_bo_vm_lookup().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 54 ++++++++++++++++++++++--
>   1 file changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> index cb9975889e2f..3eaad00668f2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> @@ -27,6 +27,30 @@
>   
>   #include "vmwgfx_drv.h"
>   
> +static struct ttm_buffer_object *vmw_bo_vm_lookup(struct ttm_device *bdev,
> +						  unsigned long offset,
> +						  unsigned long pages)
> +{
> +	struct drm_vma_offset_node *node;
> +	struct ttm_buffer_object *bo = NULL;
> +
> +	drm_vma_offset_lock_lookup(bdev->vma_manager);
> +
> +	node = drm_vma_offset_lookup_locked(bdev->vma_manager, offset, pages);
> +	if (likely(node)) {
> +		bo = container_of(node, struct ttm_buffer_object,
> +				  base.vma_node);
> +		bo = ttm_bo_get_unless_zero(bo);
> +	}
> +
> +	drm_vma_offset_unlock_lookup(bdev->vma_manager);
> +
> +	if (!bo)
> +		pr_err("Could not find buffer object to map\n");

It's not a big deal and I know it's been in the original, but since 
you're already in there if you could change this to DRM_ERR that'd be 
great. Either way:
Reviewed-by: Zack Rusin <zackr@vmware.com>

z
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
