Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BBC5F74A1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 09:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5729A10E571;
	Fri,  7 Oct 2022 07:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F36110E571
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665127075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzKoUVbrCAeXkSU6JyLQgvLOyXg2nZMUfE+LBnGTJxU=;
 b=YX6lTDMqyXqsQKPF8zlZEYmpIxVAJYHEeYfqghQtO7jJWJUzJr5VGIbtS2ieW/BV6QVg3j
 5cZIzhOMubWTV0TVw4veZWwCBUYch/3V+ryFHE8JNxVm7hefa0gLB5IiWX+LB2yrD+Avpw
 kTAVHk9WFk5fGtGt37HV94tj/qjv99A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58-qrzPMIdUOSmpbTwhI2WoLA-1; Fri, 07 Oct 2022 03:17:54 -0400
X-MC-Unique: qrzPMIdUOSmpbTwhI2WoLA-1
Received: by mail-wm1-f70.google.com with SMTP id
 b7-20020a05600c4e0700b003bde2d860d1so2265817wmq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 00:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MzKoUVbrCAeXkSU6JyLQgvLOyXg2nZMUfE+LBnGTJxU=;
 b=h2LK31SvvXVbLc+6e2zmlpVRJnPqdc/tnIktL8SKXZRD7SZy5WAk5mOkeCYtohijp0
 NPTbAUSY4GKrpYkg0bFTx1CR6+SHjdWt4l+81f7ZwY1p00uHP4leeQ08Lo7z5piLgTv4
 vuD/a2EUZFasdA+MCXZ6CRLkggk2vTLWlkdUP5cbBk2zhotBnVRBBSOI3kAf2Udk1YpX
 8gvbo4obUdJ8o6uYIYZC0xwiSu4/p6aQUfZ8dps0E0d/nztvwuwbO4udr828s0hyRuzq
 x52GdSoJJIT5XbDM8ai8J2cUwkrHdFK648SZWG536nMMo6fLCqUJnKth18MEhTsTlg5V
 ydmA==
X-Gm-Message-State: ACrzQf3yCmqwyRkY34jfciZneyByR1W5dkqAW50/Vp9QO9ePMcyF4Pta
 f+otfyqDrGsqIxrrFyHVGsE8GV4trUdLkve3vLfQDELRnRukWajA6uaedRb1qrcskUHe/gvWxfD
 K5DXShLm820zQrOi/FcNl4MyRSpsz
X-Received: by 2002:adf:f5cf:0:b0:22e:50b7:64e3 with SMTP id
 k15-20020adff5cf000000b0022e50b764e3mr2128012wrp.22.1665127073530; 
 Fri, 07 Oct 2022 00:17:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4tynb5dsUO5+1nr/mZ4IcR9x5jYCIxgmSqCEOE6MbSKHEbmnEMEj9gGsvmNd2G6vmA/qXL3A==
X-Received: by 2002:adf:f5cf:0:b0:22e:50b7:64e3 with SMTP id
 k15-20020adff5cf000000b0022e50b764e3mr2127996wrp.22.1665127073323; 
 Fri, 07 Oct 2022 00:17:53 -0700 (PDT)
Received: from [172.20.10.4] (32.pool90-167-202.static.orange.es.
 [90.167.202.32]) by smtp.gmail.com with ESMTPSA id
 k4-20020adff5c4000000b00228dff8d975sm1187476wrp.109.2022.10.07.00.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 00:17:52 -0700 (PDT)
Message-ID: <890f79b7-4c6b-0f99-f9c7-ba16bb9367a9@redhat.com>
Date: Fri, 7 Oct 2022 09:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 2/2] drm/atomic-helper: Replace
 drm_atomic_helper_check_crtc_state()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-3-tzimmermann@suse.de>
 <7bea011f-f1d0-4375-ee1c-f97e12cd3f0a@redhat.com>
 <Yz/QICUIu25XjZGX@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yz/QICUIu25XjZGX@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: jfalempe@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/7/22 09:07, Ville Syrjälä wrote:
> On Thu, Oct 06, 2022 at 10:28:12PM +0200, Javier Martinez Canillas wrote:
>> On 10/5/22 13:40, Thomas Zimmermann wrote:
>>> Rename the atomic helper function drm_atomic_helper_check_crtc_state()
>>> to drm_atomic_helper_check_crtc_primary_plane() and only check for an
>>> attached primary plane. Adapt callers.
>>>
>>> Instead of having one big function to check for various CRTC state
>>> conditions, we rather want smaller functions that drivers can pick
>>> individually.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>> [...]
>>
>>> +	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
>>> +		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>>> +			return 0;
>>>  	}
>>
>> I believe the code convention is to drop the curly braces when you
>> have a single statement inside the a loop ?
> 
> This has two.
> 

No, it has only one that is the if statement. So according to the Linux
kernel coding style AFAIU it should be written as:

	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask)
		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
			return 0;


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

