Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A59783DCE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 12:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A942D10E1CD;
	Tue, 22 Aug 2023 10:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A3B10E1CD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692699978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrXOdRSU5C9qBy5SkHRFVcr2LcH7Loe7+3Mc49K5WKA=;
 b=UFP/AIt61lr0oAw/yoVyoMtGIo0WYJP2jdhYDIkpMn1IEeriGPQWUB7fheG7S0ZHl3EMB4
 nXUIO3RKT+inyngklQMfZGlb7ObQcTaCGxcSzEqPQ2zu/UiJVjXeJDid5qp8G3F4X6EoF8
 notYD3CwiU+nWlgFLe93+8HLPQ94Qfw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-n73NydNCMh-FpSyfr8FMRg-1; Tue, 22 Aug 2023 06:26:17 -0400
X-MC-Unique: n73NydNCMh-FpSyfr8FMRg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fe1521678fso28516525e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 03:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692699976; x=1693304776;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LrXOdRSU5C9qBy5SkHRFVcr2LcH7Loe7+3Mc49K5WKA=;
 b=ARvguq7ZByDvcBjrQz4Vw1bj8ysKFWPmoa3nqLYvCgjz0H1vwclwN1wQH1wntpfxju
 Ktrtnm+UdIECG318rPdk0+3bODCSnmoczeFr36+szncd6w4ufeEJPWq50aBwMWHer1iP
 2dggjPOqoq1rZ1vLHZC5hszt4mCC/WQSZMuJRr1+35PT4HETT82DQsJhB2gcWtW+VXso
 mo+wTSrBtzymI/ZSJ1naihvrlsf2zwcN5QDVDcglDokN25xVc1JAPxrkyJkthNhrixFg
 zDGdLO+RyUWjbx+uJxO2rHJDjVHZqJiNIbT21YhOJ6dOKQgSrbnm/5/gq/Cfzmvl2T+7
 cVSg==
X-Gm-Message-State: AOJu0YxZoAMLQAPkpWuERawNF/w7l+pC1KU3rIiBdt3OrJnbz2Nu2SZu
 OpliriDLu1c4odg9VnnGxVSmA9EJFiDydIQydNf38LejR/Q7034S1lYT9NgYla+PpnrgOmB9iqs
 S1/ppyAFUdK9YRPOJheCwIJKCXdSQ
X-Received: by 2002:a1c:7508:0:b0:3fe:dc99:56ea with SMTP id
 o8-20020a1c7508000000b003fedc9956eamr6746665wmc.19.1692699976318; 
 Tue, 22 Aug 2023 03:26:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF05DZBRpnuiPX8UW4R+VHjobHFk2uaAIDMsXbKz/q/OuYSx6LA05xEWWVMjowEHsCG1aX/iQ==
X-Received: by 2002:a1c:7508:0:b0:3fe:dc99:56ea with SMTP id
 o8-20020a1c7508000000b003fedc9956eamr6746644wmc.19.1692699975977; 
 Tue, 22 Aug 2023 03:26:15 -0700 (PDT)
Received: from toolbox ([2001:9e8:89b6:500:ebf6:f095:1c69:67b4])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c040c00b003fe2397c17fsm19005449wmb.17.2023.08.22.03.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 03:26:15 -0700 (PDT)
Date: Tue, 22 Aug 2023 12:26:14 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v7] drm/doc: Document DRM device reset expectations
Message-ID: <20230822102614.GB110557@toolbox>
References: <20230818200642.276735-1-andrealmeid@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20230818200642.276735-1-andrealmeid@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 05:06:42PM -0300, André Almeida wrote:
> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> ---
> 
> v7 changes:
>  - s/application/graphical API contex/ in the robustness part (Michel)
>  - Grammar fixes (Randy)
> 
> v6: https://lore.kernel.org/lkml/20230815185710.159779-1-andrealmeid@igalia.com/
> 
> v6 changes:
>  - Due to substantial changes in the content, dropped Pekka's Acked-by
>  - Grammar fixes (Randy)
>  - Add paragraph about disabling device resets
>  - Add note about integrating reset tracking in drm/sched
>  - Add note that KMD should return failure for contexts affected by
>    resets and UMD should check for this
>  - Add note about lack of consensus around what to do about non-robust
>    apps
> 
> v5: https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid@igalia.com/
> ---
>  Documentation/gpu/drm-uapi.rst | 77 ++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 65fb3036a580..3694bdb977f5 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,83 @@ for GPU1 and GPU2 from different vendors, and a third handler for
>  mmapped regular files. Threads cause additional pain with signal
>  handling as well.
>  
> +Device reset
> +============
> +
> +The GPU stack is really complex and is prone to errors, from hardware bugs,
> +faulty applications and everything in between the many layers. Some errors
> +require resetting the device in order to make the device usable again. This
> +section describes the expectations for DRM and usermode drivers when a
> +device resets and how to propagate the reset status.
> +
> +Device resets can not be disabled without tainting the kernel, which can lead to
> +hanging the entire kernel through shrinkers/mmu_notifiers. Userspace role in
> +device resets is to propagate the message to the application and apply any
> +special policy for blocking guilty applications, if any. Corollary is that
> +debugging a hung GPU context require hardware support to be able to preempt such
> +a GPU context while it's stopped.
> +
> +Kernel Mode Driver
> +------------------
> +
> +The KMD is responsible for checking if the device needs a reset, and to perform
> +it as needed. Usually a hang is detected when a job gets stuck executing. KMD
> +should keep track of resets, because userspace can query any time about the
> +reset status for a specific context. This is needed to propagate to the rest of
> +the stack that a reset has happened. Currently, this is implemented by each
> +driver separately, with no common DRM interface. Ideally this should be properly
> +integrated at DRM scheduler to provide a common ground for all drivers. After a
> +reset, KMD should reject new command submissions for affected contexts.
> +
> +User Mode Driver
> +----------------
> +
> +After command submission, UMD should check if the submission was accepted or
> +rejected. After a reset, KMD should reject submissions, and UMD can issue an
> +ioctl to the KMD to check the reset status, and this can be checked more often
> +if the UMD requires it. After detecting a reset, UMD will then proceed to report
> +it to the application using the appropriate API error code, as explained in the
> +section below about robustness.
> +
> +Robustness
> +----------
> +
> +The only way to try to keep a graphical API context working after a reset is if
> +it complies with the robustness aspects of the graphical API that it is using.
> +
> +Graphical APIs provide ways to applications to deal with device resets. However,
> +there is no guarantee that the app will use such features correctly, and a
> +userspace that doesn't support robust interfaces (like a non-robust
> +OpenGL context or API without any robustness support like libva) leave the
> +robustness handling entirely to the userspace driver. There is no strong
> +community consensus on what the userspace driver should do in that case,
> +since all reasonable approaches have some clear downsides.
> +
> +OpenGL
> +~~~~~~
> +
> +Apps using OpenGL should use the available robust interfaces, like the
> +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES). This
> +interface tells if a reset has happened, and if so, all the context state is
> +considered lost and the app proceeds by creating new ones. There's no consensus
> +on what to do to if robustness is not in use.
> +
> +Vulkan
> +~~~~~~
> +
> +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissions.
> +This error code means, among other things, that a device reset has happened and
> +it needs to recreate the contexts to keep going.
> +
> +Reporting causes of resets
> +--------------------------
> +
> +Apart from propagating the reset through the stack so apps can recover, it's
> +really useful for driver developers to learn more about what caused the reset in
> +the first place. DRM devices should make use of devcoredump to store relevant
> +information about the reset, so this information can be added to user bug
> +reports.
> +
>  .. _drm_driver_ioctl:
>  
>  IOCTL Support on Device Nodes

Acked-by: Sebastian Wick <sebastian.wick@redhat.com>

> -- 
> 2.41.0
> 

