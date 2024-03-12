Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354AE879C42
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 20:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3C710E280;
	Tue, 12 Mar 2024 19:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H6iBIhaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B36B10E2B9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 19:31:04 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51344bebe2fso4692249e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710271862; x=1710876662; darn=lists.freedesktop.org;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kJpsVBMok4DysYfIIVHBkMfzJS3ueksml9AxjfrkcjU=;
 b=H6iBIhawK7VS9zLjM6PuF/lPwKMdONKe6kpLW2R3XBSk/IYq/WdEZLyD/4+o/0Tu/u
 pWrhb7xpTCbQObTf/4pIbFy3lZuk0ZB3ebVm15McZNGkfdlz4TO29PJnFegtJT+uE8vx
 as9McJ4oclgdRXhDLqCA9Ijrq+bC57R68z6n+/dAO+LufDPMLcskycaFLO820HC0XaRQ
 bNsY7/6uCQ8VRSzjLGVhi7eHCmg/lJ1G92atgEymLA/0hph8kLPAGxVTsxBSUiiZzG/W
 nd4owAbovBrRjAgbMzlPxw1NQi+Mx+ty3zhoiSPNAyIvQzhN1BgBrHTFKvvhjQr13mjx
 Dwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710271862; x=1710876662;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJpsVBMok4DysYfIIVHBkMfzJS3ueksml9AxjfrkcjU=;
 b=pnUM0nXOG29zhXM3oZAdBq03DPPGi9lm7Irodg7LFr+RCit6sBetoRn2YYpJhtfoGH
 KelQUJgtPMgAueVNgo48ipIgezDEa7zzZAXG6qbMB2LX/q2dtlAZrPmQNjAxkx0Egwid
 i+LWdwjpM97Gr15PHghXWGrxhm1WlLtfVchyfGAt9YAHyKMBWlUqYhcxv+nGfEcJ/AYW
 MBvps7dYMc/G+LRPULeXpw4uHlPySOQA4nFpnx88EZrJlpi24Jjo0t+SNXS7HgFzpu72
 0T1NuLi0FVEcLE6s7Qt1jbSBJoPqd5SRAaEB/LlQ96+RMQu654X6OgOk3UTg/6cMnnm3
 Nzsg==
X-Gm-Message-State: AOJu0YxbSabZ9pVaeF40MkJ4bnEpImm4gVWdSGGUMWoKBqHKxcDV3yjg
 mOHNzV8PtfRbdjmcWbOB6KWvElIfJSqIDil/abp728q80YvBCIT3
X-Google-Smtp-Source: AGHT+IGgI72vIsmYv+uFBlwVZxdqMiTxLFbZvtX6yYEjttTBtWIPEdUJrsx/b3TgBuH256FPp+z/Zw==
X-Received: by 2002:a19:8c41:0:b0:513:c48c:ec2f with SMTP id
 i1-20020a198c41000000b00513c48cec2fmr673979lfj.63.1710271861711; 
 Tue, 12 Mar 2024 12:31:01 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 y1-20020a197501000000b00513c59a74afsm148552lfe.278.2024.03.12.12.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 12:31:01 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2] helo=ester)
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rk7q0-000000000uo-2APe; Tue, 12 Mar 2024 20:31:00 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org,  Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>,  Rob Clark <robdclark@gmail.com>,  Abhinav
 Kumar <quic_abhinavk@quicinc.com>,  Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,  Javier Martinez Canillas
 <javierm@redhat.com>,  =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: Don't return unsupported formats in
 drm_mode_legacy_fb_format
In-Reply-To: <6921cc7a-93c6-49a5-bf87-a166f4fcdce7@suse.de> (Thomas
 Zimmermann's message of "Tue, 12 Mar 2024 09:31:02 +0100")
References: <20240310152803.3315-1-frej.drejhammar@gmail.com>
 <c3203f70-0e8c-493b-813e-1dff93a28323@suse.de>
 <ko7bky33d.fsf@gmail.com>
 <6921cc7a-93c6-49a5-bf87-a166f4fcdce7@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Tue, 12 Mar 2024 20:31:00 +0100
Message-ID: <ka5n3nt6z.fsf@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Am 11.03.24 um 20:34 schrieb Frej Drejhammar:
>
>> What I can't really see is what "switch all fbdev code over to
>> drm_driver_legacy_fb_format" would entail [...]
>
> Your patch modifies drm_mode_legacy_fb_format() in a number of
> *_fbdev_*.c files. In those instances, the code could certainly use
> drm_driver_legacy_fb_format() instead.
>
> The fbdev files provide the base for the kernel framebuffer console
> and should behave like DRM clients in userspace;

That's the understanding I was missing, thank you for the explanation!
I'll work up a two-patch series during the week-end.

> About tilcdc: it uses fbdev-dma, which sets up an XRGB format
> [1]. Shouldn't this already fail? Do you see a framebuffer console?

I get the penguin, but I'm running this particular Beagleboard with a
serial console, so I don't know if the rest of the console works. From
some extra kprints I can see that (the unmodified)
drm_mode_legacy_fb_format() returns RG16 which means that the
framebuffer asked for a depth=16, bpp=16 format, and RG16 is one of the
supported formats, so the check that triggers the regression won't
trigger.

Best regards,

Frej
