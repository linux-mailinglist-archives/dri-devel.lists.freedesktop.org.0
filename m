Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FBC82DC39
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 16:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D67A10E310;
	Mon, 15 Jan 2024 15:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E4B10E310
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705332289;
 bh=KXAJs/2dRy3PTXaGBrQbJM0dK9xdYx/HpB3k/oTvi8s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dHT0Rdz4cw12Ag4LhA2JvloaxbPy8VBEZa3wJ97LbCkJBEHLIGGYDhLcvcMtth3ju
 HNbssagDzYiHfGIxGKX/Jboar/C3IWjxy+qobQH5LZmHgM0oGNzlYtcKmrJmqqcYKo
 xTEQ5NxsFIDYA8Ipv6xq4PPcsU1c87ozaYPoW4cCKJagpTo0Z7pqj7zu9zOnfAtI7H
 MN8/AU6uQFIUVGodggnbK7xWUJoVWFT+T28oJMzkg9Rme4FnxpGVW8jk1l7kRMS8uy
 fT+0J3ciLK4x++RvP0en+XEU6V0Js2UT2HA2tiwbjRoWyYkgbz72Pel1b/XGBp8i+B
 RpKZAi9nepBtw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 33A3637813DA;
 Mon, 15 Jan 2024 15:24:45 +0000 (UTC)
Message-ID: <c06f3ca9-e588-4012-b864-102ad3e7ea8d@collabora.com>
Date: Mon, 15 Jan 2024 12:24:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/ci: add tests on vkms
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20240102094129.1767591-1-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240102094129.1767591-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: hamohammed.sa@gmail.com, daniels@collabora.com,
 rodrigosiqueiramelo@gmail.com, mairacanal@riseup.net,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, melissa.srw@gmail.com,
 david.heidelberg@collabora.com, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for picking this up.

On 02/01/2024 06:41, Vignesh Raman wrote:
> From: Helen Koike <helen.koike@collabora.com>
> 
> Add job that runs igt on top of vkms.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> v2:
> - do not mv modules to /lib/modules in the job definition, leave it to
>    crosvm-runner.sh
> 
> v3:
> - Enable CONFIG_DRM_VKMS in x86_64.config and update xfails
> 
> ---
>   MAINTAINERS                                   |  1 +
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  1 +
>   drivers/gpu/drm/ci/image-tags.yml             |  4 +--
>   drivers/gpu/drm/ci/test.yml                   | 22 +++++++++++++
>   drivers/gpu/drm/ci/x86_64.config              |  1 +
>   drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 33 +++++++++++++++++++
>   .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  9 +++++
>   drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 14 ++++++++
>   8 files changed, 83 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d959a6881f7..2c1593aa436f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6922,6 +6922,7 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/gpu/vkms.rst
> +F:	drivers/gpu/drm/ci/xfails/vkms*
>   F:	drivers/gpu/drm/vkms/
>   
>   DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 084e3ff8e3f4..4b636d39734c 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -108,6 +108,7 @@ stages:
>     - rockchip
>     - virtio-gpu
>     - lint
> +  - software-driver

I had created this new stage with the intention to also move virtio-gpu 
to it, so we can patch all "non-real" hardware, what do you think?

>   
>   # YAML anchors for rule conditions
>   # --------------------------------
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
> index 7ab4f2514da8..bfa70f8cdf57 100644
> --- a/drivers/gpu/drm/ci/image-tags.yml
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -4,7 +4,7 @@ variables:
>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>   
>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
> -   DEBIAN_BUILD_TAG: "2023-10-08-config"
> +   DEBIAN_BUILD_TAG: "2024-01-02-vkms"
>   
>      KERNEL_ROOTFS_TAG: "2023-10-06-amd"
>   
> @@ -12,4 +12,4 @@ variables:
>      DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
>      DEBIAN_X86_64_TEST_GL_TAG: "${CONTAINER_TAG}"
>   
> -   ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
> \ No newline at end of file
> +   ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 1705f268547a..a079f3632a95 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -337,3 +337,25 @@ virtio_gpu:none:
>       - debian/x86_64_test-gl
>       - testing:x86_64
>       - igt:x86_64
> +
> +vkms:none:
> +  stage: software-driver
> +  variables:
> +    DRIVER_NAME: vkms
> +    GPU_VERSION: none
> +  extends:
> +    - .test-gl
> +    - .test-rules
> +  tags:
> +    - kvm
> +  script:
> +    - ln -sf $CI_PROJECT_DIR/install /install
> +    - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p /lib/modules
> +    - mkdir -p $CI_PROJECT_DIR/results
> +    - ln -sf $CI_PROJECT_DIR/results /results
> +    - ./install/crosvm-runner.sh ./install/igt_runner.sh
> +  needs:
> +    - debian/x86_64_test-gl
> +    - testing:x86_64
> +    - igt:x86_64
> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> index 1cbd49a5b23a..ab4dcca749cc 100644
> --- a/drivers/gpu/drm/ci/x86_64.config
> +++ b/drivers/gpu/drm/ci/x86_64.config
> @@ -24,6 +24,7 @@ CONFIG_DRM=y
>   CONFIG_DRM_PANEL_SIMPLE=y
>   CONFIG_PWM_CROS_EC=y
>   CONFIG_BACKLIGHT_PWM=y
> +CONFIG_DRM_VKMS=y

I was wondering if this wouldn't get in the way of other tests, but I 
guess IGT_FORCE_DRIVER can handle, we just need to make sure it is set 
and we are testing the correct one.

Thanks
Helen

>   
>   # Strip out some stuff we don't need for graphics testing, to reduce
>   # the build.
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> new file mode 100644
> index 000000000000..ce8c93008d7e
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> @@ -0,0 +1,33 @@
> +kms_cursor_crc@cursor-rapid-movement-128x128,Fail
> +kms_cursor_crc@cursor-rapid-movement-128x42,Fail
> +kms_cursor_crc@cursor-rapid-movement-256x256,Fail
> +kms_cursor_crc@cursor-rapid-movement-256x85,Fail
> +kms_cursor_crc@cursor-rapid-movement-32x10,Fail
> +kms_cursor_crc@cursor-rapid-movement-32x32,Fail
> +kms_cursor_crc@cursor-rapid-movement-512x170,Fail
> +kms_cursor_crc@cursor-rapid-movement-512x512,Fail
> +kms_cursor_crc@cursor-rapid-movement-64x21,Fail
> +kms_cursor_crc@cursor-rapid-movement-64x64,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-atomic,Fail
> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_cursor_legacy@cursorA-vs-flipA-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> +kms_flip@flip-vs-modeset-vs-hang,Fail
> +kms_flip@flip-vs-panning-vs-hang,Fail
> +kms_pipe_crc_basic@nonblocking-crc,Fail
> +kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
> +kms_pipe_crc_basic@suspend-read-crc,Fail
> +kms_plane@plane-panning-bottom-right-suspend,Fail
> +kms_universal_plane@universal-plane-pipe-A-sanity,Fail
> +kms_vblank@pipe-A-ts-continuation-dpms-suspend,Fail
> +kms_writeback@writeback-check-output,Fail
> +kms_writeback@writeback-fb-id,Fail
> +kms_writeback@writeback-invalid-parameters,Fail
> +kms_writeback@writeback-pixel-formats,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> new file mode 100644
> index 000000000000..0ccf4a9c187b
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> @@ -0,0 +1,9 @@
> +# Board Name: vkms
> +# Bug Report: https://lore.kernel.org/dri-devel/005da8f1-8050-bffd-653c-2a87ae6376f7@collabora.com/T/#u
> +# IGT Version: 1.28-gd2af13d9f
> +# Linux Version: 6.7.0-rc3
> +# Failure Rate: 50
> +
> +# Reported by deqp-runner
> +kms_cursor_legacy@cursorA-vs-flipA-legacy
> +kms_cursor_legacy@cursorA-vs-flipA-varying-size
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> new file mode 100644
> index 000000000000..2014653bf5b6
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> @@ -0,0 +1,14 @@
> +# Hits:
> +# rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> +# rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P749/1:b..l
> +kms_prop_blob@invalid-get-prop
> +
> +# keeps printing vkms_vblank_simulate: vblank timer overrun and never ends
> +kms_invalid_mode@int-max-clock
> +
> +# Suspend seems to be broken
> +.*suspend.*
> +
> +# Hangs machine and timeout occurs
> +kms_flip@flip-vs-absolute-wf_vblank-interruptible
> +kms_invalid_mode@zero-hdisplay
