Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8FF6D9235
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D55910EB3C;
	Thu,  6 Apr 2023 09:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A1110EB3C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680771720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SxPY7RcrzJxBLc0jE5ag5u5cxiL5KmZWSgX3m+zVEHU=;
 b=OUjkgHIEYMuVrKhlntnKeEOQ7l2L3zlQ+GHc8sfWPO7J/vBjFkrWh18rAkTgoa8lb6qYoz
 nVKv50It5kDcf9eBc0iT/xUSdESLBp14C6W2eh1M56+A98fbwUbBfUfA25LdMCcD3kkzP6
 db/DpcIKbTS1QQpEyBJW1RW7WaCIneo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-wxuSIerLPqaam6SNEZrhCg-1; Thu, 06 Apr 2023 05:01:59 -0400
X-MC-Unique: wxuSIerLPqaam6SNEZrhCg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o7-20020a05600c4fc700b003edf85f6bb1so20123771wmq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 02:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680771718;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SxPY7RcrzJxBLc0jE5ag5u5cxiL5KmZWSgX3m+zVEHU=;
 b=qFywzrsp40f6ltoY1mjenaia7JJsy7w0IcbZ5xTmL34wVmWPTveaWAVSXoPzxI5mpN
 NUwl+/w8onYXwEIT562Hl9qiIgYhM/24i3xp4yia8yuIgIUX9dFl43fKz9tC50ibIkmJ
 0v5jqsCRYg3qE6Tw/g+eARCYDSyOaT6YA8qY2ljWdJMPXxZUs2s44ebnsL7ZGg94ldIU
 MSwMf6lLLCk/9tJpOFLi7r38lUELQaPa8p9yWRHgW0DQClW3An4sqOE7RwTTlDO7QPMQ
 kAr9uhxYZvbQtpcLVbpi73HbUc31CF5GK33LC/L6PRGHX33504fzsv+KNLbFFDja7UVU
 nyXA==
X-Gm-Message-State: AAQBX9chNsCN5aAiZxv2wjEPbDLrvsEXdmBv/stE3zqvCoSplsX6LP1z
 IWzLZ2hqBE0VA8ijE3bO7osU+CR6jQ5yG+TwEmodLoLpVakWqEre0oVijYPO3Kn7z4shGgllB4q
 PPmNFO8/czJachj4L87xE2wh2RKMM
X-Received: by 2002:adf:e788:0:b0:2d1:481d:5863 with SMTP id
 n8-20020adfe788000000b002d1481d5863mr6067533wrm.11.1680771718351; 
 Thu, 06 Apr 2023 02:01:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350bXnQDwIXznTR8INsXR3OSpU3usZKaZciAqUH6VbmJQZga7iRX19GEns1pL9YqiKsSzfPxIlQ==
X-Received: by 2002:adf:e788:0:b0:2d1:481d:5863 with SMTP id
 n8-20020adfe788000000b002d1481d5863mr6067518wrm.11.1680771717990; 
 Thu, 06 Apr 2023 02:01:57 -0700 (PDT)
Received: from localhost ([84.78.248.32]) by smtp.gmail.com with ESMTPSA id
 f8-20020a5d58e8000000b002de9a0b0a20sm1118645wrd.113.2023.04.06.02.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 02:01:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel.vetter@ffwll.ch,
 patrik.r.jakobsson@gmail.com
Subject: Re: [PATCH v4 1/9] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
In-Reply-To: <520414ed-46b7-ae0d-a567-bc2a7c898487@suse.de>
References: <20230406083240.14031-1-tzimmermann@suse.de>
 <20230406083240.14031-2-tzimmermann@suse.de>
 <87r0sx8kso.fsf@minerva.mail-host-address-is-not-set>
 <520414ed-46b7-ae0d-a567-bc2a7c898487@suse.de>
Date: Thu, 06 Apr 2023 11:01:56 +0200
Message-ID: <87mt3l8juj.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:


>>> - fix Daniel's S-o-b address
>>>
>> 
>> I believe they want to have their Intel S-o-B as well. I know that dim
>> complains but that's what usually happens with danvet's patches AFAIK.
>
> I'll do as you suggest and add both.
>

Ok.

>> 
>>> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>>> ---
>> 
>> Patch looks good to me. Although I wonder if should just be dropped in
>> favour of yours patch since are now part of the same series?
>
> That might require a rework of some other patches in this series. So 
> let's just merge both of them.
>

Sure. Fine by me.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

