Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D17F507B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 20:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4F710E0E7;
	Wed, 22 Nov 2023 19:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AD810E0CF;
 Wed, 22 Nov 2023 19:24:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnmYH0bfSYe4bytknSCCDyqMF4eBo1cjJpktwZdSxIioe8BDjgyKqo7hr1bK2VX82XgHo5niTlZS5t1Yu6Jc/KCTT2UR/VEI/dIve8xwZljEm7c7s3N2wbxpW926ppiTOGvJeMv72BkpmUA0ovZ+vHP1e3PeXyyPMl63opz+0hLy5WJr9mfD3o20y3pgRkJqIhhfI2K3HsG1ExVBCVUYW6j+wQuctuxuNzLJTBu961rH0p3putmr4Jf1EHd0sj5Dwbh1wWvRDupc3QaunCL/4c6gGCUePeGp1jcOuGI1O+BZdDWTUOBK2rnADdrgvJvVO76zn/75XYTRSWMH+h52+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNgsxqzJWZHGnsHlb+xYAqbt0HWqzt7zQZJMPwlK1XU=;
 b=hdTrIi0V0c4y+PujkZFQOHqxsYC3JoW1AljXSiUuUrqy8Db84J3jRxDL95yvD0dLBp/OZdhYWUafSUqzEdsG+7W21WX6mV/zDTOrEQrN+kZeKZjFu1u31zIdGHjHVkw1hgLgAmFB0lH4XrM7IlW4jVRRQpO1JOy4CgL1gjGz7jnLUemwG9UpIB3kAJAB0RKGP2PkFV7PIG03LaRgE4VXKZ+Rd0XQXohzESG2FGA6rRJ2jEFZpdBFU6KiAGGqGSOq5eSHpYOIbEWcpQint+6ZZPEUnLOrXHqb+e0LrtJ55wMIiAmdMrqhq/4Npg13ae80G8z5Fa9elRs9+b43RToMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNgsxqzJWZHGnsHlb+xYAqbt0HWqzt7zQZJMPwlK1XU=;
 b=09GvwK4o9lriI8GSEau/+U7fEMV91SaixvVzfu97U7jWt+d9FaG1RDvA+8ptE0AUsuNEBniDqVZMusQBptKyl+8vLQ7XDBb8F3NiqlJwwv9WtoltCgjtOWMIEM7ceMWFKCd7FYCWy2A5+D3n6UAGaDwjnhU9Tjj/CCc9u012vrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 19:24:28 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 19:24:28 +0000
Message-ID: <bb745239-368f-4989-8872-ed864eefc8ba@amd.com>
Date: Wed, 22 Nov 2023 14:24:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/prime: Helper to export dmabuf without fd
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20231121231114.703478-1-Felix.Kuehling@amd.com>
 <20231121231114.703478-2-Felix.Kuehling@amd.com>
 <4393049d-6080-4de2-a4ba-bfb37db0706f@suse.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <4393049d-6080-4de2-a4ba-bfb37db0706f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 1794ec99-5e84-4e64-3fb5-08dbeb90a567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7aNaEtY+ouuGy2bWMZm/iVrj3waQU6d1j7Xc/TvsOdz3Tql5Tx535Mh7D8Ou3TosuUKOWUvg4doJdAqi4dKUwZSzVbAzYl15j8SLKOULt5KTM7zQc08EEbOcPl2WQ6vU5FsvxihIBZYo+0FK4LSr53st4LaNmpF8tg4Hr4rugueRABoiIn/ToLqgyeBUmIJvIoHsUt51EfSYshKxDiyQtRFsHhSot8iVFSumos0EROV7cCSr4OW7VXT3RurKrSb+adbRX13S1qElFt5/gyHF54wo/jL8UMsiZ2/yhGg2KfjqOTNX9gTWtUwZ3gG4oRBCiwhmZ5UR4IHhB/N5ViKGj7gO74qos0mDDr/HEitvGAa3dMBaZEBajkxQcTusPZIUIsLhdjODYbNvUKx4DgK7VBH7R9ybp2xTUE/aW5Vfm9EA1pV0EIcChTO6PUULVF3RnpA5xQXezB8SqFZ3WBFW/gG604DSJaGJpR9fhrXNTKNIKhF1i7lzLMCIKexUWnWYryIUtfvz2YoCZmrXnDlIliGQxKOoGxZo5PZfjCR9T0JiO6K2So3RYv5TO4eWOL/y2UW42sUUFkKN7ctkHR5m+VpwJXWW0INpDlsJ3KXhUoz/tsnJHIIPALpxaKTiq2fRYst0DeUjD76r46oxgL7XA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(66946007)(66556008)(66476007)(110136005)(38100700002)(36756003)(31696002)(86362001)(478600001)(83380400001)(26005)(6512007)(6506007)(2616005)(53546011)(36916002)(2906002)(6486002)(4001150100001)(316002)(45080400002)(41300700001)(5660300002)(4326008)(8676002)(44832011)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1NrTVpsamdXNUliem82bE9ZNlpmQ1hoZTBKZ255VkFYeXNmaGpIZTJWdWtn?=
 =?utf-8?B?OXVSZW1WU09YSkVZclBaR2pDckIvcVppcnhqNmRnU0FBQW9uVnpOZ2xLSTNM?=
 =?utf-8?B?cm1LUVk1cTZUamFDZDRMSTQ0dU1vdUY4a3g4d0duNDllM3BORWV6OHJ3UmNJ?=
 =?utf-8?B?d2twdXJVdUxJai9WOGVOQW8zTmUvcWlzYXg3V0x4Wk0wbmN6K2o5bFNVdVZK?=
 =?utf-8?B?QzZER2FVeHM3dVVMK1dEQ1JxNEI5TjFsK2tKcFMwb3Rpc0F3QlFCVy9RSHR0?=
 =?utf-8?B?MWVFL3I5ejhSZmhvV3lEL1dmeXJBNE9HL25sU2hwSitSWDg5dCt3SGlTTzF3?=
 =?utf-8?B?S1RlbWN6cEg2T2ZBOGhZYTQ1SnpuUnZYWHdhdlpqWnBSUDM1RkN4RThlVnFY?=
 =?utf-8?B?cG1pb3A0RS9XWDJEbUlVWE02aTIweW5FQ0dWUHpLY3Raa05UQmNzbHJ1NDJF?=
 =?utf-8?B?MEhoRWpZcXB4cTBydHdCNUtUMHR0alpxdWYvakFTWHZwbTVWa1grbVdSSkRs?=
 =?utf-8?B?TE1JN1M1RVpNclRIQVBlVGdZNE96djE2bTFqaGtJQldCZ3U0Q2xGdFBzVE5u?=
 =?utf-8?B?ZWFvS3drMTQ3OTY0SWd1RUkzeFk0NHN4YlF3aVcrTHRrb1Z1R1FNblhmQTBi?=
 =?utf-8?B?MlRWMDEvTmFKM0liWEE0U0NCVnhOM0NoakEwbUlmK2xjdktzNDB6OG1id1RD?=
 =?utf-8?B?bkhtQStiSTRQeExlZzNBd3p4S0NIYXFFRHZPbVVEdDBtOW8rR1FMNDBMSW9L?=
 =?utf-8?B?Si9iNE43Z1ZZQ3ZxQjhmWGVlVVFGOXBseFRSWUs5bDE1Z3g1aS80NSs5ajF1?=
 =?utf-8?B?SmlKVHl0a3huK28yeFQ5b2xnOHNSSFBENHdyVktlaWlBTkVCZVBVUHFlbE0w?=
 =?utf-8?B?aVAvR2ZoS1ZzbVBmNCtZVFpDSE9nenVhaDl2UG9QVVBwV3RTR3pmRWdFQlQy?=
 =?utf-8?B?MWI2eW0wcTF5OEt2c1FweiszUE45WDh0SXVDUytlQ01HUU11WXFaRmF6b3d4?=
 =?utf-8?B?WjlZUmdlQm9SRE85MmIvaG9sbG1yNGg4TXJSZ0lsdk1yYmV2eVRGTC82YkVu?=
 =?utf-8?B?OGx1RFlJeHBhNEJ0SldpVHdqLzY5aTNqamlSWm5IdGd1cFJPQ0wxUDJhRGZI?=
 =?utf-8?B?Y3dCeURzbDJMd0wrd1kzeDI0cU1qUTRDc0lkbmJpVlh3V3hYRGd2T0ZQb0o1?=
 =?utf-8?B?TjBzWVZjZlVxTTlUamdPNGdJdDRXVGJ5TEtObXRKdk1EQWIrMGE5VjZaT01h?=
 =?utf-8?B?VjNPRTFGWkdSNFg5VzBLdGlRcVN2V2JVQ2VZYittMDZVRVVRLzlNMkRFK2xq?=
 =?utf-8?B?clJiZmMxbDBFd1F2SnBrTXBIL0prdWNnY0pCenNHOHRmRTJKbDFnSXZHZEM3?=
 =?utf-8?B?dEg2MHBwTjNBeXVqK3VXWExGUjVaZnF4c0cyUnJDOGs4ZWNyR2dqeEJtSkRF?=
 =?utf-8?B?VSsvc3JHZlJ5bXV6QldRaVRCc3d5aG5yc2NaSzFCOU1uRWFUWUZLWkxLNW1r?=
 =?utf-8?B?dVAxOW1aZ1FBYW1WdmsvTmxCVzJKWnlYYVVPM3NTOFM1SHlXM0dXbEhWclBs?=
 =?utf-8?B?Mys5Q3lrTXlyMUF0QXdPYmsrcU9ibnArSUhTdG1jUldyS0dvaVBJR2dFaXkw?=
 =?utf-8?B?WHN2enI5T0lVakU2Q3p4TWdUNW5DVkIzTThtbldzb05rSCtLT1pzMG5xaEoz?=
 =?utf-8?B?SmZmN2hKcXA5SEZNRzRkb05wS0pLNjBxL0JhUWNvT3gvL1gxQXVYTDZ4TEtq?=
 =?utf-8?B?Q3E2TCtxVk1IRFF2bGpuSFZseHZEejF6NW42U1EyT1BFc2E0OU1NMW55cHRi?=
 =?utf-8?B?Rm1OM1FCWGhUL2ovU0lkWG1jWGdPTnJwaHU5R2xsNHFjSG5ESEdzeWhPTWhC?=
 =?utf-8?B?aHVpNEU1MWlOVWdRWC8vTVF3dHVLK3JvNUxHOHpJUUhybm1BSzZocEN2blB4?=
 =?utf-8?B?S2xTS21rZkp6Z2Foc0ZvT05iR3B2L3RFdzVRK0E4bFVXOEFwYll6QnREWDht?=
 =?utf-8?B?RlRuZzhzcDQ2NloxM1RrNnpHU2xZMlVicEJWN2xKeVZ2RDd6Nkxkb1p5THNq?=
 =?utf-8?B?YW1ma0UybnkzREp6QklhM3FtcDgxdG1HUEpsd2dvT0c2Qks0VHJpUzJvaTEw?=
 =?utf-8?Q?5Q9KhWFrom1hGLFjGKT5hwWyX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1794ec99-5e84-4e64-3fb5-08dbeb90a567
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 19:24:28.7272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8STEPgNgaOGC0ss5cwTaqkly/Db0oiEM/7CsNc0A4fS+cO33C+SLtsm8HvmiqxewLHbBcBR2/WbHZPx6C8UaGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-11-22 05:32, Thomas Zimmermann wrote:
> Hi,
>
> my apologies if this sounds picky or annoying. This change appears to be
> going in the wrong direction. The goal of the refactoring is to be able
> to use drm_driver.gem_prime_import and drm_gem_object_funcs.export for
> the additional import/export code; and hence keep the GEM object code in
> a single place. Keeping the prime_fd file descriptor within amdkfd will
> likely help with that.
>
> Here's my suggestion:
>
>    1) Please keep the internal interfaces drm_gem_prime_handle_to_fd()
> and drm_gem_prime_fd_to_handle(). They should be called from the _ioctl
> entry functions as is. That could be stream-lined in a later patch set.
>
>    2) From drm_gem_prime_handle_to_fd() and drm_gem_prime_fd_to_handle(),
> create drm_gem_prime_handle_to_dmabuf() and
> drm_gem_prime_dmabuf_to_handle().

Do you mean duplicate the code, or call drm_gem_prime_handle_to_dmabuf 
from drm_gem_prime_handle_to_fd?


>   They should be exported. You can then
> keep the file-descriptor code in amdkfd and out of the PRIME helpers.
>
>    3) Patches 1 and 2 should be squashed into one.
>
>    4) And if I'm not mistaken, the additional import/export code can then
> go into drm_driver.gem_prime_import and drm_gem_object_funcs.export,
> which are being called from within the PRIME helpers.

I'm not sure what you mean by "additional import/export code" that would 
move into those driver callbacks.


>
> That's admittedly quite a bit of refactoring. OR simply go back to v1 of
> this patch set, which was consistent at least.

I think I'd prefer that because I don't really understand what you're 
trying to achieve.

Thanks,
   Felix


>
> Best regards
> Thomas
>
>
> Am 22.11.23 um 00:11 schrieb Felix Kuehling:
>> Change drm_gem_prime_handle_to_fd to drm_gem_prime_handle_to_dmabuf to
>> export a dmabuf without creating an FD as a user mode handle. This is
>> more useful for users in kernel mode.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> ---
>>    drivers/gpu/drm/drm_prime.c | 63 ++++++++++++++++++-------------------
>>    include/drm/drm_prime.h     |  6 ++--
>>    2 files changed, 33 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 834a5e28abbe..d491b5f73eea 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -410,26 +410,25 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>>    }
>>    
>>    /**
>> - * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
>> + * drm_gem_prime_handle_to_dmabuf - PRIME export function for GEM drivers
>>     * @dev: dev to export the buffer from
>>     * @file_priv: drm file-private structure
>>     * @handle: buffer handle to export
>>     * @flags: flags like DRM_CLOEXEC
>> - * @prime_fd: pointer to storage for the fd id of the create dma-buf
>> + * @dma_buf: pointer to storage for the dma-buf reference
>>     *
>>     * This is the PRIME export function which must be used mandatorily by GEM
>>     * drivers to ensure correct lifetime management of the underlying GEM object.
>>     * The actual exporting from GEM object to a dma-buf is done through the
>>     * &drm_gem_object_funcs.export callback.
>>     */
>> -int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>> -			       struct drm_file *file_priv, uint32_t handle,
>> -			       uint32_t flags,
>> -			       int *prime_fd)
>> +struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
>> +					       struct drm_file *file_priv,
>> +					       uint32_t handle, uint32_t flags)
>>    {
>>    	struct drm_gem_object *obj;
>>    	int ret = 0;
>> -	struct dma_buf *dmabuf;
>> +	struct dma_buf *dmabuf = NULL;
>>    
>>    	mutex_lock(&file_priv->prime.lock);
>>    	obj = drm_gem_object_lookup(file_priv, handle);
>> @@ -441,7 +440,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>    	dmabuf = drm_prime_lookup_buf_by_handle(&file_priv->prime, handle);
>>    	if (dmabuf) {
>>    		get_dma_buf(dmabuf);
>> -		goto out_have_handle;
>> +		goto out;
>>    	}
>>    
>>    	mutex_lock(&dev->object_name_lock);
>> @@ -479,40 +478,22 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>    				       dmabuf, handle);
>>    	mutex_unlock(&dev->object_name_lock);
>>    	if (ret)
>> -		goto fail_put_dmabuf;
>> -
>> -out_have_handle:
>> -	ret = dma_buf_fd(dmabuf, flags);
>> -	/*
>> -	 * We must _not_ remove the buffer from the handle cache since the newly
>> -	 * created dma buf is already linked in the global obj->dma_buf pointer,
>> -	 * and that is invariant as long as a userspace gem handle exists.
>> -	 * Closing the handle will clean out the cache anyway, so we don't leak.
>> -	 */
>> -	if (ret < 0) {
>> -		goto fail_put_dmabuf;
>> -	} else {
>> -		*prime_fd = ret;
>> -		ret = 0;
>> -	}
>> -
>> -	goto out;
>> -
>> -fail_put_dmabuf:
>> -	dma_buf_put(dmabuf);
>> +		dma_buf_put(dmabuf);
>>    out:
>>    	drm_gem_object_put(obj);
>>    out_unlock:
>>    	mutex_unlock(&file_priv->prime.lock);
>>    
>> -	return ret;
>> +	return ret ? ERR_PTR(ret) : dmabuf;
>>    }
>> -EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>> +EXPORT_SYMBOL(drm_gem_prime_handle_to_dmabuf);
>>    
>>    int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>    				 struct drm_file *file_priv)
>>    {
>>    	struct drm_prime_handle *args = data;
>> +	struct dma_buf *dmabuf;
>> +	int ret;
>>    
>>    	/* check flags are valid */
>>    	if (args->flags & ~(DRM_CLOEXEC | DRM_RDWR))
>> @@ -523,8 +504,24 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>    						       args->handle, args->flags,
>>    						       &args->fd);
>>    	}
>> -	return drm_gem_prime_handle_to_fd(dev, file_priv, args->handle,
>> -					  args->flags, &args->fd);
>> +	dmabuf = drm_gem_prime_handle_to_dmabuf(dev, file_priv, args->handle,
>> +						args->flags);
>> +	if (IS_ERR(dmabuf))
>> +		return PTR_ERR(dmabuf);
>> +	ret = dma_buf_fd(dmabuf, args->flags);
>> +	/*
>> +	 * We must _not_ remove the buffer from the handle cache since the newly
>> +	 * created dma buf is already linked in the global obj->dma_buf pointer,
>> +	 * and that is invariant as long as a userspace gem handle exists.
>> +	 * Closing the handle will clean out the cache anyway, so we don't leak.
>> +	 */
>> +	if (ret < 0) {
>> +		dma_buf_put(dmabuf);
>> +	} else {
>> +		args->fd = ret;
>> +		ret = 0;
>> +	}
>> +	return ret;
>>    }
>>    
>>    /**
>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>> index 2a1d01e5b56b..89e839293d14 100644
>> --- a/include/drm/drm_prime.h
>> +++ b/include/drm/drm_prime.h
>> @@ -69,9 +69,9 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>>    
>>    int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>    			       struct drm_file *file_priv, int prime_fd, uint32_t *handle);
>> -int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>> -			       struct drm_file *file_priv, uint32_t handle, uint32_t flags,
>> -			       int *prime_fd);
>> +struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
>> +					       struct drm_file *file_priv,
>> +					       uint32_t handle, uint32_t flags);
>>    
>>    /* helper functions for exporting */
>>    int drm_gem_map_attach(struct dma_buf *dma_buf,
