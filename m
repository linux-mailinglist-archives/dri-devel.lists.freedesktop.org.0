Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6632C57082E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 18:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8118FA26;
	Mon, 11 Jul 2022 16:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AF08FA1B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657556450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krWK++9zNZG9/feLlLwyRFXfmIBMOPSNUY+2d1CJg4s=;
 b=LiwA6UpiM06uOagdR8LMACSYSZN5+U48giobNlpHjJecDKowDshTFaYmqPJb+iLwCxVYdp
 8KC7MBJVKGI7y5gofIH7eKjU2fO+uSartTy5t3JO68mwcCpQaVf2Xfjpv8TIU0BzXY3S+x
 uAHWWqeVgCjuY8xx5YSWdxjvGfD1H4U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-YJC4fkapOT-yWfag0LxZwg-1; Mon, 11 Jul 2022 12:20:49 -0400
X-MC-Unique: YJC4fkapOT-yWfag0LxZwg-1
Received: by mail-wm1-f69.google.com with SMTP id
 83-20020a1c0256000000b003a2d01897e4so2831708wmc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=krWK++9zNZG9/feLlLwyRFXfmIBMOPSNUY+2d1CJg4s=;
 b=zRvqSdgR8DOoznWW4Ck+rJqbwYbMCx09MighbubeEyyEJ3AKM/q/lOEkpVeXt9Vn55
 ARTCal7wgZUdsjIJLptw0vGtyme8qH8Kw6Ai/0wMcDkOA09yNZ4vSFJ24Ez4dBuxN8bH
 0FOwwjsKNOyiL6CKEFzffNIlE3kGcLQVHwJy0ZowaiogpLv7HNvwJxMdCSxQGASKpphn
 DZrtHK4x5pHXlyJJVsxYI/N712ZN4S0UAApiVII10lUgJaR+wMMtTykfCgCr5fE6cCci
 bfZ9wA/YQdsPzGGFxjQSK598i7jck9jsFIdZZh4Qt4BdrKk2Tu+aH2LNwNYAcUFZ76cf
 m43A==
X-Gm-Message-State: AJIora8j7yp5NaFSiboWE+dpopoXgGgGmBdg8MhCWCRqpoE/xlr1mX9E
 xzLIDarAcRm3UwV3Vh1D48k1GLbgGbX4pXX84x/1xiH6GUjS1gQ4gH2E6sPXuQBQef9jQNphqHf
 1XDwtJRJ+XKSWCkzOal9ph7KEk53J
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id
 y9-20020a5d6149000000b0021d6ba76095mr17330786wrt.680.1657556447705; 
 Mon, 11 Jul 2022 09:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ue7ShleUidqJmRNXf4tXEO7O/11LHuf7hCgwMRSnnyLGa0LhA6ZO7PVxwlr6xO+oHcLAWBvg==
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id
 y9-20020a5d6149000000b0021d6ba76095mr17330773wrt.680.1657556447507; 
 Mon, 11 Jul 2022 09:20:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 i10-20020adffc0a000000b0021d62e30a62sm6160933wrr.50.2022.07.11.09.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 09:20:46 -0700 (PDT)
Message-ID: <d88e8654-f053-55ea-39d3-099344871643@redhat.com>
Date: Mon, 11 Jul 2022 18:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/14] drm/mgag200: Move model-specific code into separate
 functions
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
References: <20220708093929.4446-1-tzimmermann@suse.de>
 <Yshn83t1ByD6Q6Qf@ravnborg.org>
 <c9535553-717d-b21b-676f-b771f49e4aef@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c9535553-717d-b21b-676f-b771f49e4aef@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@linux.ie, airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07/2022 09:29, Thomas Zimmermann wrote:
> Hi Sam,
> 
> thanks for reviewing.
> 
> Am 08.07.22 um 19:22 schrieb Sam Ravnborg:
>> Hi Thomas,
>>
>> On Fri, Jul 08, 2022 at 11:39:15AM +0200, Thomas Zimmermann wrote:
>>> Mgag200 still mixes model-specific code and generic code in the same
>>> functions. Separate it into distinct helpers.
>>>
>>> As part of this effort, convert the driver from simple-KMS helpers
>>> to regular atomic helpers. The latter are way more flexible and can
>>> be adapted easily for each hardware model.
>>>
>>> Tested on Matrox G200 and G200EH hardware.
>>>
>>> Thomas Zimmermann (14):
>>>    drm/mgag200: Split mgag200_modeset_init()
>>>    drm/mgag200: Move DAC-register setup into model-specific code
>>>    dmr/mgag200: Move ER/EW3 register initializatino to per-model code
>>>    drm/mgag200: Acquire I/O-register lock in atomic_commit_tail function
>>>    drm/mgag200: Store primary plane's color format in CRTC state
>>>    drm/mgag200: Reorganize before dropping simple-KMS helpers
>>>    drm/mgag200: Replace simple-KMS with regular atomic helpers
>>>    drm/mgag200: Set SCROFF in primary-plane code
>>>    drm/mgag200: Add per-device callbacks
>>>    drm/mgag200: Provide per-device callbacks for BMC synchronization
>>>    drm/mgag200: Provide per-device callbacks for PIXPLLC
>>>    drm/mgag200: Move mode-config to model-specific code
>>>    drm/mgag200: Move CRTC atomic_enable to model-specfic code
>>>    drm/mgag200: Remove type field from struct mga_device
>>
>> I have browsed the patches and they looked good.
>> I was about to complain about several things, like bmc init, but then
>> later this is all nicely cleaned up.
>> Especially the pll setup stuff did not get much scrunity, as it like
>> most of the patch looked like code movements.
> 
> Indeed. The patch moves code and adapts the functions' interfaces to the 
> new callbacks. But the implementation remains the same.

I've read the whole serie, and it's good overall.
I agree with Sam about the duplication of the DAC-registers setup, but 
that can be solved later.

I have also tested this patchset on a G200eW, and have seen no regression.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
>>
>> All patches except "Move DAC-register setup into model-specific code"
>> are:
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>
>>
>>>   14 files changed, 2804 insertions(+), 1586 deletions(-)
>> This is not a diffstat that makes one go - yyipeee.
>> But the improvements makes it worthwhile.
> 
> Yeah. I accept a grow in driver size in exchange for the more cleanly 
> structured code base. In my reply to the DAC review, I outline ways to 
> re-share some of the duplicated code.
> 
> Best regards
> Thomas
> 
>>
>>     Sam
> 

