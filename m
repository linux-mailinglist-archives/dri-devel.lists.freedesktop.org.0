Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FA5743DDD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 16:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B4E10E4A5;
	Fri, 30 Jun 2023 14:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A964410E49D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688136543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IE6S4UE7sAhbA+CX4GXzjRMRbvuc9Ga9QvqadN+Ay54=;
 b=Cl2sVRdkIi7eOo+rhzxWdmLQxq7aS9tWy80jtlBzKMX/KHk1IqzaBtEDuBFCZo3pHS1t6H
 u46Q6wfgVOfCbPjnGH9qA5v97b1Ev+QoNSu/Vp1vuYn+aAqLDGdA2GpQzCLdGCfioZaiX6
 B31QdTth459V27u+NhuSwyXf24scirk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-ReM09v7DODuNuJO9AV6RmA-1; Fri, 30 Jun 2023 10:49:02 -0400
X-MC-Unique: ReM09v7DODuNuJO9AV6RmA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fb89482c48so1962202e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 07:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688136540; x=1690728540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IE6S4UE7sAhbA+CX4GXzjRMRbvuc9Ga9QvqadN+Ay54=;
 b=UDACF1PTYEM3euCEv56LxN9xseVs5pAYsmwutOdYJqss8FrIrgw8QiffN3WLN7Dh0S
 CLxjZOcXHqAFEPfegRe+0Onkr5BgVkCx28af7/8QovYyF/yfansk3OAQ/gaw33ANGuIc
 G2cItOx6orO9Y6lJpA38wAk66oG7PoeKjeFhTmsm5Q660c40YtOSEXyhmXirVfNvVrqW
 AXTOXH1S545M+smivwrXWMYDv9XzKCgzTmgC0aQzce1d/hjJq1AMLZIdpZ6xFJ5VGKWC
 Dc7qmKhZ1PD0ukct7eNd/jPdrsCYrBxABMfKZbAmufmeYgftCPibp92Z9PSvMK6Vysmr
 FpjA==
X-Gm-Message-State: ABy/qLY+zQ/9b931Jbyt87XIQ8ZhgAXjTXHAGDR06WbJiyRY1ycHYIfd
 YtBmJaW0GsOC+IxDcmKM02Gkbr6u26qFCbHO1oNN5SuGxyw1swv9iEEQGEDtDds2qY59c3aLKDG
 HvUjwD1rpkz2iEPGdAg8tgihJnPOS51sJUwchFRvPqu+T
X-Received: by 2002:a19:e01d:0:b0:4fb:7592:cc7a with SMTP id
 x29-20020a19e01d000000b004fb7592cc7amr2158274lfg.20.1688136540350; 
 Fri, 30 Jun 2023 07:49:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGtjzxeVBKbob2iqqdDAGaWV6CTJDd7NKkDPpclcn4S7VPc1LXPfVpLRshmFb+uMsJdQD1SXjE2Cr9ak6FgKcE=
X-Received: by 2002:a19:e01d:0:b0:4fb:7592:cc7a with SMTP id
 x29-20020a19e01d000000b004fb7592cc7amr2158264lfg.20.1688136540018; Fri, 30
 Jun 2023 07:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
In-Reply-To: <20230627132323.115440-1-andrealmeid@igalia.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 30 Jun 2023 16:48:49 +0200
Message-ID: <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 3:23=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>
> v4: https://lore.kernel.org/lkml/20230626183347.55118-1-andrealmeid@igali=
a.com/
>
> Changes:
>  - Grammar fixes (Randy)
>
>  Documentation/gpu/drm-uapi.rst | 68 ++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 65fb3036a580..3cbffa25ed93 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a thir=
d handler for
>  mmapped regular files. Threads cause additional pain with signal
>  handling as well.
>
> +Device reset
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The GPU stack is really complex and is prone to errors, from hardware bu=
gs,
> +faulty applications and everything in between the many layers. Some erro=
rs
> +require resetting the device in order to make the device usable again. T=
his
> +sections describes the expectations for DRM and usermode drivers when a
> +device resets and how to propagate the reset status.
> +
> +Kernel Mode Driver
> +------------------
> +
> +The KMD is responsible for checking if the device needs a reset, and to =
perform
> +it as needed. Usually a hang is detected when a job gets stuck executing=
. KMD
> +should keep track of resets, because userspace can query any time about =
the
> +reset stats for an specific context. This is needed to propagate to the =
rest of
> +the stack that a reset has happened. Currently, this is implemented by e=
ach
> +driver separately, with no common DRM interface.
> +
> +User Mode Driver
> +----------------
> +
> +The UMD should check before submitting new commands to the KMD if the de=
vice has
> +been reset, and this can be checked more often if the UMD requires it. A=
fter
> +detecting a reset, UMD will then proceed to report it to the application=
 using
> +the appropriate API error code, as explained in the section below about
> +robustness.
> +
> +Robustness
> +----------
> +
> +The only way to try to keep an application working after a reset is if i=
t
> +complies with the robustness aspects of the graphical API that it is usi=
ng.
> +
> +Graphical APIs provide ways to applications to deal with device resets. =
However,
> +there is no guarantee that the app will use such features correctly, and=
 the
> +UMD can implement policies to close the app if it is a repeating offende=
r,
> +likely in a broken loop. This is done to ensure that it does not keep bl=
ocking
> +the user interface from being correctly displayed. This should be done e=
ven if
> +the app is correct but happens to trigger some bug in the hardware/drive=
r.

I still don't think it's good to let the kernel arbitrarily kill
processes that it thinks are not well-behaved based on some heuristics
and policy.

Can't this be outsourced to user space? Expose the information about
processes causing a device and let e.g. systemd deal with coming up
with a policy and with killing stuff.

> +
> +OpenGL
> +~~~~~~
> +
> +Apps using OpenGL should use the available robust interfaces, like the
> +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES)=
. This
> +interface tells if a reset has happened, and if so, all the context stat=
e is
> +considered lost and the app proceeds by creating new ones. If it is poss=
ible to
> +determine that robustness is not in use, the UMD will terminate the app =
when a
> +reset is detected, giving that the contexts are lost and the app won't b=
e able
> +to figure this out and recreate the contexts.
> +
> +Vulkan
> +~~~~~~
> +
> +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissi=
ons.
> +This error code means, among other things, that a device reset has happe=
ned and
> +it needs to recreate the contexts to keep going.
> +
> +Reporting causes of resets
> +--------------------------
> +
> +Apart from propagating the reset through the stack so apps can recover, =
it's
> +really useful for driver developers to learn more about what caused the =
reset in
> +first place. DRM devices should make use of devcoredump to store relevan=
t
> +information about the reset, so this information can be added to user bu=
g
> +reports.
> +
>  .. _drm_driver_ioctl:
>
>  IOCTL Support on Device Nodes
> --
> 2.41.0
>

