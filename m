Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEECA5FA26E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 19:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A49010E2E8;
	Mon, 10 Oct 2022 17:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE7710E2E8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665421588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vtqj4OscVNXo0090m4wz1F++xsrVHzFGp1eThGzFqx4=;
 b=ifljiq28BzOePIuuUqtwxzMXsx2PeciurnNCWKArIe3JTG0IcSXarPb5JIuQPB7zJ+Uimk
 Gd+qSVHGyL+qAU1NbSPbxDXPSheDjilvY61V4hp8korzA+B0SeFxNieh5XynZrvWa79CUG
 BWgWbgYmOfEpJIThuch+zbck/UBr9rs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-2_HvHv85P7OlV_LOWYt6vQ-1; Mon, 10 Oct 2022 13:06:27 -0400
X-MC-Unique: 2_HvHv85P7OlV_LOWYt6vQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so3239096wmh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vtqj4OscVNXo0090m4wz1F++xsrVHzFGp1eThGzFqx4=;
 b=qJqdSvxJmzDffXDMCSQcj9RR0SrK2wvwLHalAg1HfdEgyAhTaSRRr1dCDmMMpJ6y3j
 ix/kzNHCvkSiaySF3JiSvhEyndVI4/1+gvJxhYFM71Cnmw1UYgt/c2iix9YkI2bf0RG7
 Av2MeGPM56sgn1AkSNKP95XyLl38HR2t3hB34kwxb4tSUQFR4oNOx9zLn/jddPvYN/8o
 OcRb0Xzr7GVTwqK2o7COdK0NKHMRUzFV+MMoD84+vmLUdcRHEspmkGEeaT2gblrjXL2F
 WLS4E01n9+vuVJL1o40qh/JKfSkkwxGuHMlteUddyjz7moN8G+cDj6WTny+cfHg+IUqP
 oPDQ==
X-Gm-Message-State: ACrzQf1xn9grvbIzyzM7b/Vs8z9FoaJ+fGhjIjQErinwiaB8XP1DJmNG
 DQtj0iE724hlGrqD5HflysuY4DYohACdIimx0ilfW/Z4D52Qn9Qo38NZ2NNF7/q/2V61qxdAs6j
 skRemEYmmNTSjFzHGL8UGsVyX32Rp
X-Received: by 2002:a05:6000:1c5:b0:22e:3c0b:5c8 with SMTP id
 t5-20020a05600001c500b0022e3c0b05c8mr12066801wrx.622.1665421586471; 
 Mon, 10 Oct 2022 10:06:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4AaGBxtMaHXDQgi/jin2jmfAMBtftMLJqsRqzip6H2QUwWcifqPvAsRtW0kbI7IPGi8SyDaA==
X-Received: by 2002:a05:6000:1c5:b0:22e:3c0b:5c8 with SMTP id
 t5-20020a05600001c500b0022e3c0b05c8mr12066788wrx.622.1665421586239; 
 Mon, 10 Oct 2022 10:06:26 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t12-20020adfeb8c000000b0022e7358df7bsm9513759wrn.2.2022.10.10.10.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 10:06:25 -0700 (PDT)
Message-ID: <3562e3b5-0bf6-fb3c-64d4-a52025a0c915@redhat.com>
Date: Mon, 10 Oct 2022 19:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/8] drm/ast: Do not call drm_atomic_add_affected_planes()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com, ilpo.jarvinen@cs.helsinki.fi
References: <20221010103625.19958-1-tzimmermann@suse.de>
 <20221010103625.19958-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221010103625.19958-4-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 10/10/22 12:36, Thomas Zimmermann wrote:
> There's no need to add planes to the atomic state. Remove the call
> to drm_atomic_add_affected_planes() from ast.
> 
> On full modesets, the DRM helpers already add a CRTC's planes to the
> atomic state; see drm_atomic_helper_check_modeset(). There's no reason
> to call drm_atomic_add_affected_planes() unconditionally in the CRTC's
> atomic_check() in ast. It's also too late, as the atomic_check() of
> the added planes will not be called before the commit.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The change makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

