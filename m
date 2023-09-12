Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEE79D6C8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6262810E445;
	Tue, 12 Sep 2023 16:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48C910E449
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 16:51:15 +0000 (UTC)
Received: from [192.168.0.106] (unknown [186.235.7.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F096660716C;
 Tue, 12 Sep 2023 17:51:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694537474;
 bh=bANnTvmU8LwckEh4pqHcX7oSHDmyK0WOCRmfn4AuPWk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lhzdj8NLbl2wa20LRvoYJ8oMHy7YBp3AyXB7cesPj9SMEQ4L78Xfs90FDTrtEDt60
 RCuPKZ20oIj6VpbDjL6+kNR0XI+JK7txftGWi23A0eTD7Y2IYn4PkKe8zDTYmvMtVV
 sigCGm9AgcPGDwU3ISYVyyn7ZjYFp2JzKdCOna16j7luKP90nyZ92NlS2Tycts+Ltu
 EF1L/myRy1l8RAIRojBpdrFnvTBKKEArJpoQg2lWrQoOMS6QerI8opigxODJ4wUTVH
 lw7f+EkO04mahk42+k2HxCar6QUbPRq8fRNEe9hE6JU9qZ8dP2g6toZmgR56B5VPri
 ZlfCnjb2fNZdg==
Message-ID: <782c7762-4f83-c942-034e-4da463d82412@collabora.com>
Date: Tue, 12 Sep 2023 13:51:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/9] arm64: dts: qcom: apq8016-sbc: Add overlay for usb
 host mode
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-3-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-3-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org, andersson@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/09/2023 12:22, Vignesh Raman wrote:
> Due to the presence of the fastboot micro cable in the CI farm,
> it causes the hardware to remain in gadget mode instead of host mode.
> So it doesn't find the network, which results in failure to mount root
> fs via NFS.
> 
> Add an overlay dtso file that sets the dr_mode to host, allowing
> the USB controllers to work in host mode. This dtso file will be used
> in drm-ci, mesa-ci.
> 
> Overlay DT file uses the sugar syntax [suggested by Dmitry Baryshkov and Maxime Ripard]
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v3:
>    - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
> 
> ---
>   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso | 8 ++++++++
>   1 file changed, 8 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
> new file mode 100644
> index 000000000000..a82c26b7eae8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&usb {
> +         dr_mode = "host";
> +};
