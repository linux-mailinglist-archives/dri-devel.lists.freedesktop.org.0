Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DF58CA879
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0BA10E14E;
	Tue, 21 May 2024 07:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dMb57hvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91CB10E11B;
 Tue, 21 May 2024 07:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716275365;
 bh=2kRe9Ce8rakW5lnoclVrGvOqgAaS9QJgR7+JBCR7qys=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dMb57hvRLq5Ogx/eVkr0GikvvOOcmA5elS88vCrGss1/i4ZaMGyJDakkzpsPqdKT0
 orLLIzRjSegeeBGqdqT+YLzJOOqeU4I3VEw+Wyz6V/8JUomxmKVqURakWOBdWDGMhc
 a8uCQLH53IZiJhwL5OhP7wuPoxDUYVsSHadDZiP0iwDeoqLby10l9/7WR9H1v92C4z
 GO4BQg9kw2QgpPDnELBL9rBKXBR05jMVNEwyv7QDoC9dNX7xJ579aMYDO0a3pLAUBx
 e4xY/BitVag16MsRrKACbRbrpr6Ufokn02bNWB4NaOnAPDNsq22TPAVjmswEHYFEQY
 Uo90BDiUZNPUQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97C6B378202E;
 Tue, 21 May 2024 07:09:21 +0000 (UTC)
Message-ID: <f3646d66-01f0-476c-8b7f-5df102790fcb@collabora.com>
Date: Tue, 21 May 2024 12:39:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/ci: build virtual GPU driver as module
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 mcanal@igalia.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-4-vignesh.raman@collabora.com>
 <elftuzsd7lhz6y5ow6rb5uu5fb5b5jcprxtvxtxtojo774rnyr@swpeg4vkgtnc>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <elftuzsd7lhz6y5ow6rb5uu5fb5b5jcprxtvxtxtojo774rnyr@swpeg4vkgtnc>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 20/05/24 16:32, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 02:54:59PM +0530, Vignesh Raman wrote:
>> With latest IGT, the tests tries to load the module and it
>> fails. So build the virtual GPU driver for virtio as module.
> 
> Why? If the test fails on module loading (if the driver is built-in)
> then it's the test that needs to be fixed, not the kerenel config.
> 
> It's fine as a temporal workaround, but please include a link to the
> patch posted to fix the issue.

I will recheck this issue and post a link to the fix.

Regards,
Vignesh

> 
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - No changes.
>>
>> ---
>>   drivers/gpu/drm/ci/build.sh       | 1 -
>>   drivers/gpu/drm/ci/igt_runner.sh  | 6 +++---
>>   drivers/gpu/drm/ci/image-tags.yml | 4 ++--
>>   drivers/gpu/drm/ci/test.yml       | 1 +
>>   drivers/gpu/drm/ci/x86_64.config  | 2 +-
>>   5 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
>> index a67871fdcd3f..e938074ac8e7 100644
>> --- a/drivers/gpu/drm/ci/build.sh
>> +++ b/drivers/gpu/drm/ci/build.sh
>> @@ -157,7 +157,6 @@ fi
>>   
>>   mkdir -p artifacts/install/lib
>>   mv install/* artifacts/install/.
>> -rm -rf artifacts/install/modules
>>   ln -s common artifacts/install/ci-common
>>   cp .config artifacts/${CI_JOB_NAME}_config
>>   
>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
>> index 20026612a9bd..55532f79fbdc 100755
>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>> @@ -30,10 +30,10 @@ case "$DRIVER_NAME" in
>>               export IGT_FORCE_DRIVER="panfrost"
>>           fi
>>           ;;
>> -    amdgpu)
>> +    amdgpu|virtio_gpu)
>>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
>> -        mv /install/modules/lib/modules/* /lib/modules/.
>> -        modprobe amdgpu
>> +        mv /install/modules/lib/modules/* /lib/modules/. || true
>> +        modprobe --first-time $DRIVER_NAME
>>           ;;
>>   esac
>>   
>> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
>> index 60323ebc7304..328f5c560742 100644
>> --- a/drivers/gpu/drm/ci/image-tags.yml
>> +++ b/drivers/gpu/drm/ci/image-tags.yml
>> @@ -4,9 +4,9 @@ variables:
>>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>>   
>>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
>> -   DEBIAN_BUILD_TAG: "2023-10-08-config"
>> +   DEBIAN_BUILD_TAG: "2024-05-09-virtio"
>>   
>> -   KERNEL_ROOTFS_TAG: "2023-10-06-amd"
>> +   KERNEL_ROOTFS_TAG: "2024-05-09-virtio"
>>   
>>      DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
>>      DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 612c9ede3507..864ac3809d84 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -350,6 +350,7 @@ virtio_gpu:none:
>>     script:
>>       - ln -sf $CI_PROJECT_DIR/install /install
>>       - mv install/bzImage /lava-files/bzImage
>> +    - mkdir -p /lib/modules
> 
> Is it necessary to create it manually here?
> 
>>       - mkdir -p $CI_PROJECT_DIR/results
>>       - ln -sf $CI_PROJECT_DIR/results /results
>>       - install/crosvm-runner.sh install/igt_runner.sh
>> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
>> index 1cbd49a5b23a..78479f063e8e 100644
>> --- a/drivers/gpu/drm/ci/x86_64.config
>> +++ b/drivers/gpu/drm/ci/x86_64.config
>> @@ -91,7 +91,7 @@ CONFIG_KVM=y
>>   CONFIG_KVM_GUEST=y
>>   CONFIG_VIRT_DRIVERS=y
>>   CONFIG_VIRTIO_FS=y
>> -CONFIG_DRM_VIRTIO_GPU=y
>> +CONFIG_DRM_VIRTIO_GPU=m
>>   CONFIG_SERIAL_8250_CONSOLE=y
>>   CONFIG_VIRTIO_NET=y
>>   CONFIG_VIRTIO_CONSOLE=y
>> -- 
>> 2.40.1
>>
> 
