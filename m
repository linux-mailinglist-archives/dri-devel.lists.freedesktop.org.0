Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC77D58B1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 18:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD8110E425;
	Tue, 24 Oct 2023 16:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3445210E429
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Py2kp/NAjM1+fjHkihCNxOP+7x2l173LEbuOy/gJotE=; b=Vrn7pZbFFMdK5lM5hODavGyPMc
 qiqUwWdVlvQp4QZ6awTEhCAba4nofZa0/eo44elkgbVRXJ82KmOpQkg4enYV600hj0ZOMYE8ykDm0
 tjfWDaxWkgbSNr65VAlXD6fxNn+Q7zTJWFP0XLXr9BaKbMzSofh9jYzhx3I7eczf2n5K9ByXwth5l
 SLsxdna9Co3FDRgiF5El+Q9Z7CYj4NPxZv3FD8I6cKNtBwLug5UEqWKFULgmVy/3yG3jadQKAI5Do
 QeZDtn1dpRp2z/vOyjIPc0tzvp5qBfWzj9C5nst6DXQBz6xo/SW7VITHYi9Iv6+w96owqq2xAPgRu
 sqGt6iBg==;
Received: from [143.107.183.66] (helo=[172.21.13.157])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qvKQ1-006anX-20; Tue, 24 Oct 2023 18:38:13 +0200
Message-ID: <bc7271e7-f485-fb08-d37e-5756e6bd7a2b@igalia.com>
Date: Tue, 24 Oct 2023 13:38:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/vc4: tests: Fix UAF in the mock helpers
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20231024105640.352752-1-mripard@kernel.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20231024105640.352752-1-mripard@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/23 07:56, Maxime Ripard wrote:
> The VC4 mock helpers allocate the CRTC, encoders and connectors using a
> call to kunit_kzalloc(), but the DRM device they are attache to survives
> for longer than the test itself which leads to use-after-frees reported
> by KASAN.
> 
> Switch to drmm_kzalloc to tie the lifetime of these objects to the main
> DRM device.
> 
> Fixes: f759f5b53f1c ("drm/vc4: tests: Introduce a mocking infrastructure")
> Closes: https://lore.kernel.org/all/CA+G9fYvJA2HGqzR9LGgq63v0SKaUejHAE6f7+z9cwWN-ourJ_g@mail.gmail.com/
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> 
> ---
> 
> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c   | 2 +-
>   drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c b/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
> index 5d12d7beef0e..ade3309ae042 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
> @@ -26,7 +26,7 @@ struct vc4_dummy_crtc *vc4_mock_pv(struct kunit *test,
>   	struct vc4_crtc *vc4_crtc;
>   	int ret;
>   
> -	dummy_crtc = kunit_kzalloc(test, sizeof(*dummy_crtc), GFP_KERNEL);
> +	dummy_crtc = drmm_kzalloc(drm, sizeof(*dummy_crtc), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, dummy_crtc);
>   
>   	vc4_crtc = &dummy_crtc->crtc;
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> index 6e11fcc9ef45..e70d7c3076ac 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> @@ -32,7 +32,7 @@ struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
>   	struct drm_encoder *enc;
>   	int ret;
>   
> -	dummy_output = kunit_kzalloc(test, sizeof(*dummy_output), GFP_KERNEL);
> +	dummy_output = drmm_kzalloc(drm, sizeof(*dummy_output), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_output);
>   	dummy_output->encoder.type = vc4_encoder_type;
>   
