Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B79A9CC30
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 16:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F0C10E312;
	Fri, 25 Apr 2025 14:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Smopjurs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905B410E312
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDLyGz5psQSfot+EZOXRGE+hMbkgp+pmPZFZcccHNyg=; b=SmopjursYih+qOKaPpuLCTqKEn
 7AIHCGYi1AMw+1wnuSrZ1J2Lb0c8NMGPxnc4W/pJPQ4dA+ViTNm8WeNeGVrcdunTKJ7D9DH1SHb17
 sbUV+3wHq26ckTX4gLW+yjFsOFJO92eYK9H76N63QvjafwBntIBG4WjAHO/CtMnQ2qRrcFPgqSX+1
 Dj8lvY5QFLaoftmwjsgjArtCsXJ/yN+JePywoZcU2353SaWzMMPJwBR8lXFqLB3348zGHpvD6ZaQL
 F0TRq/Os/neF5ffhTA7nqdoomWqaQumu0WVLf5PwMBEF9/b5bJAYOMcuXjjccqZuCloL0WFFxp2cr
 SEJJR6Fw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u8KVp-008NEa-GG; Fri, 25 Apr 2025 16:58:45 +0200
Message-ID: <9a82376d-a650-47ec-83cb-dd481741f8bd@igalia.com>
Date: Fri, 25 Apr 2025 15:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: [PATCH] drm/fdinfo: Protect against driver unbind
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250418162512.72324-1-tvrtko.ursulin@igalia.com>
 <PH7PR12MB5685C40A8B0058293A9A8AE783BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
 <9b3e27d6-724f-4fca-8214-3a3bd7053995@igalia.com>
 <dfc4a23b-00eb-4835-9683-154c5d7f516e@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <dfc4a23b-00eb-4835-9683-154c5d7f516e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


+ Thomas, AFAICT you are handling drm-misc-fixes this round - are you 
okay to take this patch with Christian's rb?

Regards,

Tvrtko

On 23/04/2025 13:57, Christian König wrote:
> On 4/22/25 17:10, Tvrtko Ursulin wrote:
>>
>> On 22/04/2025 10:20, Koenig, Christian wrote:
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Thanks!
>>
>> I could also add:
>>
>> Fixes: 3f09a0cd4ea3 ("drm: Add common fdinfo helper")
>> Cc: <stable@vger.kernel.org> # v6.5+
>>
>> With a disclaimer that the problem predates the common helper. Not sure if it is worth it for such an edge case.
>>
>> I was planning to merge to drm-misc-next, but if I add the stable tag it would be drm-misc-fixes right?
> 
> Yeah even without the CC:stable tag that is clearly something for the -fixes branch I would say.
> 
> Regards,
> Christian.
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> ________________________________________
>>> Von: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Gesendet: Freitag, 18. April 2025 18:25
>>> An: dri-devel@lists.freedesktop.org
>>> Cc: kernel-dev@igalia.com; Tvrtko Ursulin; Koenig, Christian; Lucas De Marchi; Rodrigo Vivi; Umesh Nerlige Ramappa
>>> Betreff: [PATCH] drm/fdinfo: Protect against driver unbind
>>>
>>> If we unbind a driver from the PCI device with an active DRM client,
>>> subsequent read of the fdinfo data associated with the file descriptor in
>>> question will not end well.
>>>
>>> Protect the path with a drm_dev_enter/exit() pair.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_file.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index c299cd94d3f7..cf2463090d3a 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -964,6 +964,10 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>>           struct drm_file *file = f->private_data;
>>>           struct drm_device *dev = file->minor->dev;
>>>           struct drm_printer p = drm_seq_file_printer(m);
>>> +       int idx;
>>> +
>>> +       if (!drm_dev_enter(dev, &idx))
>>> +               return;
>>>
>>>           drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
>>>           drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
>>> @@ -983,6 +987,8 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>>
>>>           if (dev->driver->show_fdinfo)
>>>                   dev->driver->show_fdinfo(&p, file);
>>> +
>>> +       drm_dev_exit(idx);
>>>    }
>>>    EXPORT_SYMBOL(drm_show_fdinfo);
>>>
>>> -- 
>>> 2.48.0
>>>
>>
> 

