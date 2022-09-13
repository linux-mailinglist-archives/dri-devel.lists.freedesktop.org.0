Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629375B719B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2091F10E744;
	Tue, 13 Sep 2022 14:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFC610E744
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663080396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uxenzw8tkNyvX0lkO9yxXwXtOB+riZKdHwT6bqSX9nc=;
 b=WOiRP6bnioHW53mgpj0+NYriz5KoVTEOY9vE+QNRrtCvMGIlT1KuJeU1Qgkljt5xsgSLXz
 P7BxoyoDdtYxNSCpDgg0dS21nYUdFP/6Javj70bkDcfC4Mh2cKvaVsDKVRT+iNFm4O7Qqt
 5fiGB7o8q0x04nc4Y85WRQGxXqVyJ50=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-220-99JREduMPBiEUx6knL8vtA-1; Tue, 13 Sep 2022 10:46:35 -0400
X-MC-Unique: 99JREduMPBiEUx6knL8vtA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so6574225wmn.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 07:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Uxenzw8tkNyvX0lkO9yxXwXtOB+riZKdHwT6bqSX9nc=;
 b=VQtl/NDvrsVl81xwc30XE8sBI26c4/GYUDOe1AMB5ObsafvRzS4Eoit4DcC59mZC+T
 TVVNdjRQfsX3wSfCyNlElMOI5DTCltfIq6Oj49uhSltH93Gfr24GHURyAiXWTg4cUAld
 L4NUzSNDOBmVY5YPk1FgHDNORf6eZFYQTP1ifVdlxxs6bHGR4sCQSWVQXP5ioTKCMVRE
 5eNX82ey8qOSYu1ekKlLd+fztgXUrfzY0eMO74X5eb1YJqQOnCfeRUXlOkrEj/9vLgzo
 4zBq6nQv4FOMBR2U6nFSK8xLAT6qk7G2rUYr6ffd+LkmBEh91KkRu2NzwvANbkxgiYuD
 cxAw==
X-Gm-Message-State: ACgBeo0mCvpJYKXpSwwGmSK5uh8Sp513Q+dym6bVED0DDXHhKn/2ELUI
 9fsy2ROYildn3uYHCvILJDa57U4a4uUc1xKzL5PRDqp4rHId7355UvAQXu1Xjn2TVcR7EvjIa72
 kczfZNGpdiWgfE9XitHqm0RsEPLsc
X-Received: by 2002:a5d:4f81:0:b0:21e:2cd7:25df with SMTP id
 d1-20020a5d4f81000000b0021e2cd725dfmr19467735wru.439.1663080392551; 
 Tue, 13 Sep 2022 07:46:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6/D8KkrO108ulemub/f9jxm0PwrmE52RV1n2K5U3IcU9nGT7jDSzfR02kc6jUeYukVTDbBsQ==
X-Received: by 2002:a5d:4f81:0:b0:21e:2cd7:25df with SMTP id
 d1-20020a5d4f81000000b0021e2cd725dfmr19467717wru.439.1663080392333; 
 Tue, 13 Sep 2022 07:46:32 -0700 (PDT)
Received: from [172.16.38.252] ([185.122.133.20])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c4f5600b003b47581979bsm11556372wmq.33.2022.09.13.07.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 07:46:31 -0700 (PDT)
Message-ID: <2b67dfcc-9027-6bb5-d42b-7465f2236747@redhat.com>
Date: Tue, 13 Sep 2022 16:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] drm/plane-helper: Add a
 drm_plane_helper_atomic_check() helper
To: Harry Wentland <harry.wentland@amd.com>, linux-kernel@vger.kernel.org
References: <20220913093339.106625-1-javierm@redhat.com>
 <b81591c4-934c-4b70-fbf0-b0f4663a6d1c@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <b81591c4-934c-4b70-fbf0-b0f4663a6d1c@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/13/22 15:49, Harry Wentland wrote:
> 
> 
> On 2022-09-13 05:33, Javier Martinez Canillas wrote:
>> Provides a default plane state check handler for primary planes that are a
>> fullscreen scanout buffer and whose state scale and position can't change.
>>
> 
> Even though this might be how some drivers are handling the primary
> plane this assumption is not universal. For example, on ChromeOS when
> the (default) underlay strategy is selected the compositor will
> position the video plane as the bottom-most plane and mark it
> as primary, while the desktop plane is marked as overlay and
> will contain an alpha cutout to show the underlying video.
>
> In this case the video plane (primary) won't span the screen
> and is regularly panned and resized.
>

I see. Interesting.

> No objections to this change as it helps share code between drivers,
> but maybe specify that this behavior is a unique requirement of
> these drivers.
> 

I tried to make it clear in the comment by mentioning that this helper
is applicable for drivers whose primary plane is always fullscreen and
can't scale or change position.

Any suggestions of what's missing in the helper kernel-doc comment to be
more clear ?

> Harry
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

