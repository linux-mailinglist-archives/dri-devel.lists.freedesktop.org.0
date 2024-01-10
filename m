Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A568297DC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91CE10E5A6;
	Wed, 10 Jan 2024 10:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C55E10E5A6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704883651;
 bh=07NYN+tS7WFxafPAhAuyICZjW1AV4EkuTeDYId+eNHg=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=YCCgBU+eHNGMmR+MFSocFPFvEpkA1/nZrBz3jfG87mz0Z3h2CXucMvC9Ysb2Ih4wN
 xEsf7JUICTW3pjbDoNtCR4p7mMfK2shvH9vkrqEDNWEE8CIfivbP9fbgfkQ+RhzNym
 JSdee2IBP0sCe3Mg7vUZ4ILXxjtvKMqe1OKe1HYF2G7C3AZZlUEtdV5If/bcu3G5V5
 kX1VnBPnkNRMiaA0fenakZsGXYnCV/y/atjf+Dpj6n2uv/Az+0wogQ+H7kfLMCssml
 KtomeDBKsC2vyYkY1tO3oitf3s7JB0yg8mCLg2hPvTBmaNuP0X68y+SfQPNkLAE/29
 UbZpZ9ro2ra2w==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AA8FF3780C21;
 Wed, 10 Jan 2024 10:47:26 +0000 (UTC)
Message-ID: <ad7cbd59-5264-96e8-5e9b-aafde8028e41@collabora.com>
Date: Wed, 10 Jan 2024 16:17:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/8] drm/ci: Add support for GPU and display testing
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
 <CAPj87rOMPioOK0r74vcnVkXusm6Nah6KNUWyxYgpVLdkMNtW2g@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rOMPioOK0r74vcnVkXusm6Nah6KNUWyxYgpVLdkMNtW2g@mail.gmail.com>
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
Cc: Daniel Stone <daniels@collabora.com>, Emma Anholt <emma@anholt.net>,
 David Heidelberg <david.heidelberg@collabora.com>,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Helen Koike <helen.koike@collabora.com>, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 09/01/24 19:08, Daniel Stone wrote:
> Hi,
> 
> On Wed, 20 Dec 2023 at 12:11, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> Some ARM SOCs have a separate display controller and GPU, each with
>> different drivers. For mediatek mt8173, the GPU driver is powervr,
>> and the display driver is mediatek. In the case of mediatek mt8183,
>> the GPU driver is panfrost, and the display driver is mediatek.
>> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
>> display driver is rockchip. For amlogic meson, the GPU driver is
>> panfrost, and the display driver is meson.
>>
>> IGT tests run various tests with different xfails and can test both
>> GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
>> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
>> This leads to incomplete coverage since the display is never tested on
>> these platforms. This commit series adds support in drm-ci to run tests
>> for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
>> Meson platforms.
> 
> Thanks a lot for these. The patches need to be squashed to be
> bisectable though. For example, patch #2 changes the MTK job names and
> adds more jobs, but the corresponding xfail updates only come in #7
> and #8. This means we have a span of a few patches where we don't have
> useful test results.
> 
> A better sequencing would be something like:
>    1. add ANX7625 config
>    2. refactor _existing_ MTK display jobs to use YAML includes, change
> the existing job name, and rename the existing xfail set, remove
> IGT_FORCE_DRIVER from the script since it's now set by the job
>    3. add MTK Panfrost+PVR GPU jobs with new xfails, add xfail entry to
> MAINTAINERS
>    4+5: same as 2+3 but for Amlogic
>    6+7: same as 2+3 but for Rockchip
> 
> Then the separate rename/update xfail commits just disappear, as does
> the removal of IGT_FORCE_DRIVER, because it's just done incrementally
> as part of the commits which change the related functionality. It's
> extremely important that every change can work standalone, instead of
> introducing intermediate breakage which is only fixed in later commits
> in the series.

Thank you for reviewing the patches. I agree, will follow this sequence 
and send a v2 version.

Regards,
Vignesh
