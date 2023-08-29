Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C978378CB50
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4FD10E476;
	Tue, 29 Aug 2023 17:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630CE10E474;
 Tue, 29 Aug 2023 17:34:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/v5o1sXNkObdUk7wl14As2fBlf855ruSOa3h76QeYIPxaU654QH1nCa6DpGRq/9XBpTou3HmQK0AbqzgXrhPjwAjX+kRDx0gALbYMCN/4/MHlclYXiE72nvy83tWqJDZosov9VCaMNv7Ki3h9FPv4IZXFUgRYpA5sLeueXCIgpbfRm5tvpm5xEoa8NjMiduOhcwo1Z5pHsr3SWZhL3++vbJZXEHZmg7kz7GAoSEn7fsFIWbY/fe2O5SSjBRVLjimLSd4/pp8Bmii2cewEu7X02SRPJtkW2m6A8NbR0YfNIQ2YZ6oqR3Wb0s6twNboDs8yuwiEalv6BV49vPTeSXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hANVOBfR9UcDcBRj1//8l9wD1c28ovnJtRNXuiUHWZM=;
 b=cEFasjikUwypPhVX83ZQ5TpFXs9iJm64pyBZYLwxwH9yiKTQhyu5ah4DgcH75ZN/t+jceXZy/7XFLFVnB9NPXrYRQLyVrfwrHxV08XDw+x0Rz3gHJzzzNVh0RFM6jE1S4xANEuYkNQGrPNQiOLRGannOFBF2gZ91xkXQug40bsrGqCwznLQbEMi3CmDIPfsiBgxsiJ6xOWfuzdfPEAxqFoKu5xxi9XO6iVcV7KV/PW4SvzdEtpTOb23NwvXA+EXgPllsSFCUhXcw220Id783CgFtXD3gve+LyVqBeyu9W29+b01H75EaZNzCdae45i/Vuf+ct7zFmMyZOCdiw/X8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hANVOBfR9UcDcBRj1//8l9wD1c28ovnJtRNXuiUHWZM=;
 b=AKbRcdHptLLBaBU3Qa3DenbGR9ySY3UmFRVQGMQv2xXAqjrG50XWXtEtUzuBkYFtqwkCH0o40ekvPZQAAS3L9V78as3MISlgYu47sWDFbiN4WwKZUj8vd8u9r+BeRHTNe3KksWTNMCotHfFOuqehafeVfUioSSP9RJsuAIs5BDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by CH0PR12MB5027.namprd12.prod.outlook.com (2603:10b6:610:e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 17:34:28 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::ae93:e5c5:41f7:bf08]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::ae93:e5c5:41f7:bf08%7]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 17:34:27 +0000
Message-ID: <bcbfe6d5-da87-fa2b-c05a-8bea6e0004fb@amd.com>
Date: Tue, 29 Aug 2023 13:34:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/4] drm: Use XArray instead of IDR for minors
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-2-michal.winiarski@intel.com>
 <10bb9689-9226-d47c-4cf1-7bf9d599456c@amd.com>
 <6qcxpntlr36itieyoyebsncwdv4vadr5ac7imgl4rdemoyedvp@a3m7l32pkcnf>
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <6qcxpntlr36itieyoyebsncwdv4vadr5ac7imgl4rdemoyedvp@a3m7l32pkcnf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0030.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::36) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|CH0PR12MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: 283873d2-696b-4c05-a345-08dba8b6316d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wBgH/8Nyu8XmjgnNldn7O4CoYDLoZXLDf/7+7cHNyoNt8kzzHJJnSlhYNaMdIo4RVxAnBjyU/B5n9pnGHiROHCyyAWvmkqgW5TcCxn9e6w+EDGrY+j+RljZ6rNs5+tH40PLd/8xs81jxqcDMB9oj3UPjvexFPsf40BQgAh04jqJiBu/cW8cOPlEPJ4RvLmUDjcJvL0QP5We1Q8pD++AeIeqv1Zr3mF5xPgFZjucxuGEmucBCIlX++qOutShNrySpWtKy6+/rdpjnDIMHyIGRDVJz4pO5iMsRl5iAURHN/0JfIFJ7eSVpG1B9N+mIQP0PiuQia++TqMnGVqBuQ5yc/fADtYggfEpn19b0xKIDvfSFGXW41bOKtNkrbBHhvVIepU4WBi2OfYTB9eOcv7r2gXXSnm+/ask6c/2faFmWuybxTjOWCCR7DUWYOnUaqIkR8+bRZ8nQGUFZOiaT8FEk+Bf79CVK0O4MA4gz5jdpMhsvS2RMlENCaVvkzW3TWDp4tfL7O+kDcgZFKy3Q4jQDAhMLxBw9DOOfOBFJUV4hCjLqhQ1TBHkoxLCFSI8sLhKUqx1jn50SNEZ2kgJ3YCTXOLlWDPjt3jiGpHyQN+2Laav+uUzT0zqLevbiSl+/zYvdFpN7psgW1KMsA5dK8Y1VHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(53546011)(31686004)(478600001)(6506007)(66556008)(66476007)(54906003)(6486002)(36916002)(966005)(6916009)(316002)(38100700002)(41300700001)(6512007)(36756003)(26005)(8676002)(5660300002)(83380400001)(31696002)(2906002)(2616005)(7416002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzBIUzV0Um40c3BjQ1Z6bk8wRXI4VTAyZWNyYmJqODNaR3Qva2d0U1VoaWVR?=
 =?utf-8?B?eXVVZUV2YkVHKzRwYlpSa3p0SDJIVEJMVzUrdkFVL0NLMVFPcHRqaDNjQ0t3?=
 =?utf-8?B?UmxkQXNlQlZ6aktsSFdQNU5pZGNORHdETUh3N08ySkgvVCtGYm01dmZXYWtK?=
 =?utf-8?B?VHMzdWF0KzZYcWNsOXhtRkJXbnBzZWthanNUMy9PS2NnZ1RqT2hhbVFPZHBI?=
 =?utf-8?B?NUI3WmFwYzBPNThkMFM4T2l5Q2FtRklkVDBLeHg2bEpkWGhzNXZrVWhZdk56?=
 =?utf-8?B?eHBlU1BKSXdDaTVraVpHc0lOREJ5TURaaVhVKzJGY2plMVY3UzJFM2R6ZzJK?=
 =?utf-8?B?THBwQzdpcFE5dERtZWhCcUxPYktEQlkyVHNmc2FTWFF5ck9rRTFjajVGZ1pQ?=
 =?utf-8?B?ZjQ5eUkyaEVwTE1XSmhKYkVLVW54VVpWSEl4Sld3K2FSeURrL2xuWEpKNXBU?=
 =?utf-8?B?WFZzbE9JSE83QVQ4cWVBVDcxM1drQWhlN0RlRG5Ib053T2J1UHFsTGx2NDJR?=
 =?utf-8?B?QzVUWFZzWkVSdGMvbEZtemRYdE1aSTVrZmVLN0dTLzdJYVNVMlVOankyUnFq?=
 =?utf-8?B?S0h2elQrNVY2SEhuMTQ0LzRGbVhySDM3c3FYcm1DUDBVMS9yeUNybVVkMWpu?=
 =?utf-8?B?MFU2SEQ2bVpDZkVNQVdPZklXTnBmUUIxSzc5ZmhObExITnlPUFZqMkNaak1w?=
 =?utf-8?B?NWFXM25uUkJFTEFPcGNxNzh5U0JQcmxpMkJ1VzhNYmRpRU5nUU5SeDErN1FE?=
 =?utf-8?B?NUw0clJYS2Rqb2JGMWxnYUt0U1lmUXM1aVN5Yy80VTVmY0M2SmM4ODA2a0tX?=
 =?utf-8?B?V3YzNFkrcUpZZWJsL0MycGRDelhaVGMyRGgvUFp0bUxUZ0lyc0x3Y2M2MytB?=
 =?utf-8?B?QThsVDVCMC8wZGV1ZWEyWHJ2MXBGVzEyWTdpWHBtdmk3SDRjUzNhVXlsTWxl?=
 =?utf-8?B?Y1EvZlpsb085VGFNT0dZcXpFRnVialRHNlF1Z3p3cnZTc21Qbit3US9OaDRp?=
 =?utf-8?B?TjlWc1pzUkNVOHhmWmJRUEp6OGhSZFNyUkJZQWdpVHJ2WE1iWTMreEJrb202?=
 =?utf-8?B?L20zV0dERmwzcFRlSmUxRkpNN2hnU1RwS1ZJYUhxTVJnVjZZVko3M284azFX?=
 =?utf-8?B?MTFyeERSVEpTZkx4djE5ckQ5cEN2SXlhMFh3QkZoL1VWcURxWVZueXpIWW16?=
 =?utf-8?B?RDZFanRYWEFnOGFGY0dOaE9ydkhSbUdNWjdOSmYvWXl4UjFlTmJ1cDlvdmhF?=
 =?utf-8?B?ZWNIaklSVWVNOTNjeU44cjJ4MmNIc1pQU1c2Zlk2bll2YkJUb0o2RWVhSEQy?=
 =?utf-8?B?QlYzanR1d2N4WFIrWUxhUmgxM3JwWnh2V1kwazB2bEZJSHgyWFBFVG1BRU44?=
 =?utf-8?B?R3B6OTlSenNmaXgzQnhuckUwanVXV1BoWWtvVVFJTEEyQWpielVadUtSaXFR?=
 =?utf-8?B?Y0RiOWRRRDRIbG9Wa2JlOHZVTG1La1dWZXNFckEweWYvS2owTUhlWXdNSUVp?=
 =?utf-8?B?eU8xZ3dsT005clZpcnBhRkk5VmRwVHhaYmRINGJwTm1GNDhYRlU2cndobjU0?=
 =?utf-8?B?Z1lSWjE1ZWc4Nm1XbGxQQWREYmxrMXhHTWl5dTI0aitQUUJ6aTlTbXdid0pu?=
 =?utf-8?B?UGorL3Y0MUMxSGVzV3pVZlBadytUZ2ZhQmVDeWtra3pkdVZkdzcrZ2J4bUpp?=
 =?utf-8?B?U3JqZGlxZVorTDdhSXhRSkV6OWg3bllXdUNVYzg3Zi9oc2lDQ3FFM1grQ1Ri?=
 =?utf-8?B?V2RpOEd1TWZIVTNDWXQ0dnVvc1EwMEJHVWJRT1dXZmlHeXdRNFJ5S283ZEpz?=
 =?utf-8?B?Z3BFY24rbW5PZVRMZVFPUlBMVU9lQWVsWWRuQitkZ2ZkU3RvYm1uYUJnUE9N?=
 =?utf-8?B?VW5WWUg2N0g2UXFQT3pIS3VLSFZKQ2cwQktBL2Y1YVFmdEdTWGF0cnFvKzAy?=
 =?utf-8?B?ZTYzcEtmTjV0MjNUeGF3U1krR1ZhWHVQaDZzS2h2Q2R0ZGYwUnFKcW1rSk9P?=
 =?utf-8?B?OFh4eitwamFud3FINC96MlJIK0ZhKzE0UUJocXBKSXRPYVJublNYMjZsNUlQ?=
 =?utf-8?B?cmtYcFZjYlBmSklUSFVDOHdTMGNIVVlRS0paRk83MVpiWU02VFE3UjZNK1dZ?=
 =?utf-8?Q?27ejgv0iuDuoYeYKlw9TfS+Qr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283873d2-696b-4c05-a345-08dba8b6316d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 17:34:27.1738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxfNgJc7GcmLeHFwwQ1QbwQw9fTxchJuqkyoHTmCRgPwa50RwvZ5DFrycYT1pTDy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5027
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 James Zhu <James.Zhu@amd.com>, Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-08-28 17:08, Michał Winiarski wrote:
> On Fri, Aug 25, 2023 at 12:59:26PM -0400, James Zhu wrote:
>> On 2023-07-24 17:14, Michał Winiarski wrote:
>>> IDR is deprecated, and since XArray manages its own state with internal
>>> locking, it simplifies the locking on DRM side.
>>> Additionally, don't use the IRQ-safe variant, since operating on drm
>>> minor is not done in IRQ context.
>>>
>>> Signed-off-by: Michał Winiarski<michal.winiarski@intel.com>
>>> Suggested-by: Matthew Wilcox<willy@infradead.org>
>>> ---
>>>    drivers/gpu/drm/drm_drv.c | 63 ++++++++++++++++-----------------------
>>>    1 file changed, 25 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 3eda026ffac6..3faecb01186f 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -34,6 +34,7 @@
>>>    #include <linux/pseudo_fs.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/srcu.h>
>>> +#include <linux/xarray.h>
>>>    #include <drm/drm_accel.h>
>>>    #include <drm/drm_cache.h>
>>> @@ -54,8 +55,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
>>>    MODULE_DESCRIPTION("DRM shared core routines");
>>>    MODULE_LICENSE("GPL and additional rights");
>>> -static DEFINE_SPINLOCK(drm_minor_lock);
>>> -static struct idr drm_minors_idr;
>>> +static DEFINE_XARRAY_ALLOC(drm_minors_xa);
>>>    /*
>>>     * If the drm core fails to init for whatever reason,
>>> @@ -101,26 +101,23 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
>>>    static void drm_minor_alloc_release(struct drm_device *dev, void *data)
>>>    {
>>>    	struct drm_minor *minor = data;
>>> -	unsigned long flags;
>>>    	WARN_ON(dev != minor->dev);
>>>    	put_device(minor->kdev);
>>> -	if (minor->type == DRM_MINOR_ACCEL) {
>>> +	if (minor->type == DRM_MINOR_ACCEL)
>>>    		accel_minor_remove(minor->index);
>>> -	} else {
>>> -		spin_lock_irqsave(&drm_minor_lock, flags);
>>> -		idr_remove(&drm_minors_idr, minor->index);
>>> -		spin_unlock_irqrestore(&drm_minor_lock, flags);
>>> -	}
>>> +	else
>>> +		xa_erase(&drm_minors_xa, minor->index);
>>>    }
>>> +#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
>>> +
>>>    static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
>>>    {
>>>    	struct drm_minor *minor;
>>> -	unsigned long flags;
>>> -	int r;
>>> +	int index, r;
>>>    	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
>>>    	if (!minor)
>>> @@ -129,24 +126,17 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
>>>    	minor->type = type;
>>>    	minor->dev = dev;
>>> -	idr_preload(GFP_KERNEL);
>>>    	if (type == DRM_MINOR_ACCEL) {
>>>    		r = accel_minor_alloc();
>>> +		index = r;
>>>    	} else {
>>> -		spin_lock_irqsave(&drm_minor_lock, flags);
>>> -		r = idr_alloc(&drm_minors_idr,
>>> -			NULL,
>>> -			64 * type,
>>> -			64 * (type + 1),
>>> -			GFP_NOWAIT);
>>> -		spin_unlock_irqrestore(&drm_minor_lock, flags);
>>> +		r = xa_alloc(&drm_minors_xa, &index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
>>>    	}
>>> -	idr_preload_end();
>>>    	if (r < 0)
>>>    		return r;
>>> -	minor->index = r;
>>> +	minor->index = index;
>>>    	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
>>>    	if (r)
>>> @@ -163,7 +153,7 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
>>>    static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>>>    {
>>>    	struct drm_minor *minor;
>>> -	unsigned long flags;
>>> +	void *entry;
>>>    	int ret;
>>>    	DRM_DEBUG("\n");
>>> @@ -190,9 +180,12 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>>>    	if (minor->type == DRM_MINOR_ACCEL) {
>>>    		accel_minor_replace(minor, minor->index);
>>>    	} else {
>>> -		spin_lock_irqsave(&drm_minor_lock, flags);
>>> -		idr_replace(&drm_minors_idr, minor, minor->index);
>>> -		spin_unlock_irqrestore(&drm_minor_lock, flags);
>>> +		entry = xa_store(&drm_minors_xa, minor->index, minor, GFP_KERNEL);
>>> +		if (xa_is_err(entry)) {
>>> +			ret = xa_err(entry);
>>> +			goto err_debugfs;
>>> +		}
>>> +		WARN_ON(entry);
>> [JZ] would WARN_ON(entry != minor)be better?
> We expect NULL here.
> The same one that was previously stored here ⌄⌄⌄
> r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_EXTENDED_MINOR_LIMIT, GFP_KERNEL);
> in drm_minor_alloc.
[JZ] My mistake.
>
>>>    	}
>>>    	DRM_DEBUG("new minor registered %d\n", minor->index);
>>> @@ -206,20 +199,16 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>>>    static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type type)
>>>    {
>>>    	struct drm_minor *minor;
>>> -	unsigned long flags;
>>>    	minor = *drm_minor_get_slot(dev, type);
>>>    	if (!minor || !device_is_registered(minor->kdev))
>>>    		return;
>>>    	/* replace @minor with NULL so lookups will fail from now on */
>>> -	if (minor->type == DRM_MINOR_ACCEL) {
>>> +	if (minor->type == DRM_MINOR_ACCEL)
>>>    		accel_minor_replace(NULL, minor->index);
>>> -	} else {
>>> -		spin_lock_irqsave(&drm_minor_lock, flags);
>>> -		idr_replace(&drm_minors_idr, NULL, minor->index);
>>> -		spin_unlock_irqrestore(&drm_minor_lock, flags);
>>> -	}
>>> +	else
>>> +		xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
>>>    	device_del(minor->kdev);
>>>    	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
>>> @@ -238,13 +227,12 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
>>>    struct drm_minor *drm_minor_acquire(unsigned int minor_id)
>>>    {
>>>    	struct drm_minor *minor;
>>> -	unsigned long flags;
>>> -	spin_lock_irqsave(&drm_minor_lock, flags);
>>> -	minor = idr_find(&drm_minors_idr, minor_id);
>>> +	xa_lock(&drm_minors_xa);
>>> +	minor = xa_load(&drm_minors_xa, minor_id);
>>>    	if (minor)
>>>    		drm_dev_get(minor->dev);
>> [JZ] why minor->dev need ca_lock here?
> We're relying on the ordering for acquire/release (previously
> guaranteed by the drm_minor_lock, now by internal XArray locking).
> xa_load doesn't take xa_lock internally:
> https://docs.kernel.org/core-api/xarray.html#locking
[JZ] I means that drm_dev_get(minor->dev); can move out of xa_lock.
>>> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
>>> +	xa_unlock(&drm_minors_xa);
>>>    	if (!minor) {
>>>    		return ERR_PTR(-ENODEV);
>>> @@ -1067,7 +1055,7 @@ static void drm_core_exit(void)
>>>    	unregister_chrdev(DRM_MAJOR, "drm");
>>>    	debugfs_remove(drm_debugfs_root);
>>>    	drm_sysfs_destroy();
>>> -	idr_destroy(&drm_minors_idr);
>> [JZ] Should we call xa_destroy instead here?
> We could, if we expect the xarray to potentially not be empty.
>  From what I understand - all minors should be released at this point.
[JZ] In practice,  adding destroy here will be better.
>
> Thanks,
> -Michał
>
>>> +	WARN_ON(!xa_empty(&drm_minors_xa));
>>>    	drm_connector_ida_destroy();
>>>    }
>>> @@ -1076,7 +1064,6 @@ static int __init drm_core_init(void)
>>>    	int ret;
>>>    	drm_connector_ida_init();
>>> -	idr_init(&drm_minors_idr);
>>>    	drm_memcpy_init_early();
>>>    	ret = drm_sysfs_init();
