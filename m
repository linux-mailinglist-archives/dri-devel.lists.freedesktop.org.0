Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871CF793D2F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 14:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B1810E64A;
	Wed,  6 Sep 2023 12:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FD510E64C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 12:55:53 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.134.102.128])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 29A4466003B2;
 Wed,  6 Sep 2023 13:55:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694004952;
 bh=gQjLPgDF2IlvGX/ivEQAkZ/M9eYcT+pDslwhGu6fvqU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WXui+qTPSrp44IssO5ZBkHXw544P0fb5Y3CzDPL3YicNCTPnMyfdbjl1CV0j/l1xv
 d+O44yAcdFrmSgWxmceGHHbpMhGrHEWH5r/vosgrBap0NP2FV1KMkTr669XjZUuD7y
 EYhAHClhlpL5BCxVelqnDeaKxACc/DzOrF2VjgxP5etJzl0xjCXinnVtQjS4gEYho5
 uN1D0EWzLtsSSR8q+V+/lxh65WJ9DtN+QEJRbZ+jG23wvQAwM7r9/tRCbswpgNd81N
 rUz/x2gv6EA214pFDzmdycK6iquRo9e2P9v8u9TrGCOkZmmLZD7DjBHsEhGly9Au+6
 FJ6F29debKmbQ==
Message-ID: <cb1b9fea-d74f-fc32-a771-79713cf15674@collabora.com>
Date: Wed, 6 Sep 2023 09:55:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230904161516.66751-3-vignesh.raman@collabora.com>
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
Cc: mripard@kernel.org, robdclark@google.com, daniels@collabora.com,
 emma@anholt.net, gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, robclark@freedesktop.org,
 virtualization@lists.linux-foundation.org, david.heidelberg@collabora.com,
 anholt@google.com, linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On 04/09/2023 13:15, Vignesh Raman wrote:
> Force db410c to host mode to fix network issue which results in failure
> to mount root fs via NFS.
> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
> 
> Use fdtoverlay command to merge base device tree with an overlay
> which contains the fix for USB controllers to work in host mode.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>    - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
>    
> ---
>   drivers/gpu/drm/ci/build.sh                         |  5 +++++
>   .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
>   2 files changed, 18 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 7b014287a041..92ffd98cd09e 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -92,6 +92,11 @@ done
>   
>   if [[ -n ${DEVICE_TREES} ]]; then
>       make dtbs
> +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
> +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
> +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
> +    fi
>       cp ${DEVICE_TREES} /lava-files/.
>   fi
>   
> diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> new file mode 100644
> index 000000000000..57b7604f1c23
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> @@ -0,0 +1,13 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +    fragment@0 {
> +        target-path = "/soc@0";
> +        __overlay__ {
> +            usb@78d9000 {
> +                dr_mode = "host";
> +            };
> +        };
> +    };
> +};


Another thing that I was discussing with David and Vignesh, since we 
will need this overlay spinets not only for drm-ci but also for mesa ci 
(and every body who uses the farms), would it be interesting to move it 
to some place more official? like dts folders? Or would that be against 
Linux policy?


Regards,
Helen
