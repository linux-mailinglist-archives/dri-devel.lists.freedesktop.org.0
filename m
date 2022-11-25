Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C96388BB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBC210E733;
	Fri, 25 Nov 2022 11:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4205210E733
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669375774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s7B+glXPiHunh65c3ikcxd5Un328udBU6gxH6BbvNec=;
 b=H3hkf7lab06TqZchFM1lTAcFieHf1ZZi+7V+Z0mHqVnvY1Wf87XkBghAq51+531TTL9Kyh
 HEuIqZq6PULPlu5wAHDOh5wrGx1RPFBgTk0OMJ6lTFN07l4B6o7v/SeJ93LItk5/gEVbUl
 NrIUfO0OEA4Uijwt9txcy+KmeUxnllY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-74co_BEMNHmVoiNeEVQefA-1; Fri, 25 Nov 2022 06:29:33 -0500
X-MC-Unique: 74co_BEMNHmVoiNeEVQefA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso2309698wme.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s7B+glXPiHunh65c3ikcxd5Un328udBU6gxH6BbvNec=;
 b=8BlznuDKUlfpsBRJR/zFhTMgHJuHHAKrGlc7Z+86wamZH0q0+bnyosdTVt9OrT1IpG
 fBXM0JSOoEPTx7dJf+rw1BTbFAj9W3/2dQ/LaEdrqT9SpBlnM75Ov4gMNPGY9FWYqsyH
 YH62A7EInTlw8n7+GeStiw/I+MayGRa4RIjhGglBzs+758beiRDjE2P+mmU/VpvfDGW2
 N69XAzHpSGjvEbJhpe/xSTvvLU4XtUcV+HOWMU3XPfK5XeZFbnD41IMKcAFqPB0JDleM
 KxqnW4o+Y1hu0LM8zWtSF6gC7SA/6H5ZuidiKcmxPp3OJuUOGGbLXCSDvCh1yp4HUve3
 IogQ==
X-Gm-Message-State: ANoB5pkbZ9Iw11AxBWXKsU7gyync2rpb+Yzz30R6GhHswSUW8/anpHeA
 V++b/ZSgDLh9ndJqud+DQLl/GR8URFMCMnFgZRvJh6TUTSz3H6CmEuf2+1ZtUxS6uLvDbQqT/ss
 z7Hl+rCQcZiwGo71VY19SLIASkFxv
X-Received: by 2002:a1c:4c0c:0:b0:3cf:9881:e9d9 with SMTP id
 z12-20020a1c4c0c000000b003cf9881e9d9mr27524183wmf.6.1669375772041; 
 Fri, 25 Nov 2022 03:29:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4tA122+galS8pDRgP2Y6iWuz67WbLgxFBL4oNYp0k+u30rTmKQtH54GX28s3piYeICYXfz4g==
X-Received: by 2002:a1c:4c0c:0:b0:3cf:9881:e9d9 with SMTP id
 z12-20020a1c4c0c000000b003cf9881e9d9mr27524167wmf.6.1669375771857; 
 Fri, 25 Nov 2022 03:29:31 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r14-20020a5d4e4e000000b002366ded5864sm3471722wrt.116.2022.11.25.03.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:29:30 -0800 (PST)
Message-ID: <05e6a16f-ee7f-1b9a-0ab8-5b042d60c86d@redhat.com>
Date: Fri, 25 Nov 2022 12:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 18/24] drm/vc4: crtc: Introduce a lower-level crtc init
 helper
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-18-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-18-051a0bb60a16@cerno.tech>
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
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 16:26, Maxime Ripard wrote:
> The current vc4_crtc_init() helper assumes that we will be using
> hardware planes and calls vc4_plane_init().
> 
> While it's a reasonable assumption, we'll want to mock the plane and
> thus provide our own. Let's create a helper that will take the plane as
> an argument.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

