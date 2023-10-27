Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31C7DA1E6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 22:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B30610EA45;
	Fri, 27 Oct 2023 20:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CE510EA45
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 20:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698439408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rs7ONdb22HhWn9d4AOLrOhSSYx5jfAxh9HHbCywCFqE=;
 b=HN9mrP2KQAtJkKubXTAKTb3Yl8YEt5UIvNW5FHbd86IF/2zeB41leEy8YUVxBJMwk2EIDU
 HFedEX65XRNaYMRAyN7P6lD/RSXMO5f2slmsNFuIo8AdPO1H4oZeioKlYG/pzondCrp8+a
 69+chI0OuO6MfF8UvCRYPWKpU+D08ew=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-yslhicoRM2a2YT1JZdFVSw-1; Fri, 27 Oct 2023 16:43:24 -0400
X-MC-Unique: yslhicoRM2a2YT1JZdFVSw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4090181eec2so18647925e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 13:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698439403; x=1699044203;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rs7ONdb22HhWn9d4AOLrOhSSYx5jfAxh9HHbCywCFqE=;
 b=fSe1mFbhYHyJI1bSbpKTtUX4ypnOo1pt5sGgwiTIv7ZEww7ozYtWHz+fux8T1c3mVU
 TAxXOCMguwK+t/EUNMWFQdAxZYA7S7QWJQZST3yg/HuPGhodcfL6C7LevretDJgmVe+z
 xEaOXe8DMwzv0H2J8zs3eN4K9Q3rQBzaRMyi4ZiqO/pz9fy+MzFshkxyRFL5n4xcKj//
 VN0WoRCmVcbdzo///S/skV4hR0uWYxabZNTsjjt5L/etmKS7aOihxOchq+JegplPCTRF
 4H4UUVEb9WZJZiFIG6XbXtxzjcE8m+JTMCOn33t15gnpLFBReoeuBCOF1GxoSEO4RZDK
 DOqQ==
X-Gm-Message-State: AOJu0YwkgGy+gj7sLlQcWu8XPbcoXeFQJHm9JeVcUgjweZkN79r00L2M
 o4iVrvCMe3iZ/CipOPTY0ha8INeNew2OhLUPkh2U4EVhSR3yJbOR/SyuHjm4ld1tpT6zO5bc3EO
 2ZgGbmMM4cliDolaGbIiv7BPeYrZP
X-Received: by 2002:a05:600c:19cc:b0:406:8494:f684 with SMTP id
 u12-20020a05600c19cc00b004068494f684mr2822666wmq.23.1698439403319; 
 Fri, 27 Oct 2023 13:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Rb8y5ov/YtT1rodUK9OcZKUb3rJHbs/rL+T8j5WsAHE4P0HDWV/RoYdEraUvs+e4vR3i9A==
X-Received: by 2002:a05:600c:19cc:b0:406:8494:f684 with SMTP id
 u12-20020a05600c19cc00b004068494f684mr2822658wmq.23.1698439402952; 
 Fri, 27 Oct 2023 13:43:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f7-20020a7bcd07000000b003fee567235bsm5865366wmj.1.2023.10.27.13.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 13:43:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: ssd132x: Remove '-' before
 compatible enum
In-Reply-To: <87msw3omln.fsf@minerva.mail-host-address-is-not-set>
References: <20231020223029.1667190-1-javierm@redhat.com>
 <169801218855.747717.5658253186246322717.robh@kernel.org>
 <87y1foo1in.fsf@minerva.mail-host-address-is-not-set>
 <20231027172753.GA2834192-robh@kernel.org>
 <87msw3omln.fsf@minerva.mail-host-address-is-not-set>
Date: Fri, 27 Oct 2023 22:43:21 +0200
Message-ID: <87msw3zthy.fsf@minerva.mail-host-address-is-not-set>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>>> Pushed to drm-misc (drm-misc-next). Thanks!
>>
>> Given what introduced this is before the drm-misc-next-2023-10-19 tag, 
>> isn't it going into 6.7 and needs to be in the fixes branch? Though that 
>> doesn't exist yet for 6.7 fixes. I don't understand why that's not done 
>> as part of the last tag for a cycle. But drm-misc is special.
>>
>
> I pushed to drm-misc-next because I thought that there will be a last PR
> of drm-misc-next for 6.7, but it seems I missed it for a couple of hours
> (that is drm-misc-next-2023-10-27) :(
>
> https://lists.freedesktop.org/archives/dri-devel/2023-October/425698.html
>
> The solution now is to cherry-pick the fixes already in drm-misc-next to
> drm-misc-next-fixes, to make sure that land in 6.7. I can do that once
> drm-next is back merged to that branch, if you think the schema warning
> fix must land in 6.7 and can't wait for the next release.
>

Or wait for the drm-misc-fixes branch to be back merged and land it as a
part of the 6.7-rc cycle. I'll do that since it would cause less trouble
to the drm-misc maintainers.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

