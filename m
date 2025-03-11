Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C933A5D2C1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 23:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C276F10E045;
	Tue, 11 Mar 2025 22:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bzASpKvK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A6E10E045
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 22:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741733693;
 bh=5uCN2gUnMqBRLUI12+yMuoFkydjgSvocO+L4xvTi56s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bzASpKvK25uoUGW+Pws4jdhJSUP40zBblTM5G3N0hBfzA5HHc0WLhyoSWFjPrw1bF
 fcqVuipGmxTyWCYsNECQ2YLt+N6q9kLJi0l1LqzCoqmQp6rGLoG6EOQ/EZZfsSZvbr
 X8in7klZsQUKfYsSF7cwD0CvFenZWpLA0+QW+HYnino5c0Md10YqfTVZoSimK3jBQG
 4/BTyQOcUMXDHfhkz5gzhPLZRzr+JnPFAB/2h93gRvVBWxGYyIY68/6CH+xFAdT4Mr
 x912XA8P1E6ti8RLOTvF5EZs3ooE1sSpj+0oPqI4DLPmDOeq4wlXxMHFsBTtbpGlX5
 qjbngGQfzW34w==
Received: from [192.168.1.90] (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 10CC117E05A6;
 Tue, 11 Mar 2025 23:54:53 +0100 (CET)
Message-ID: <dca413e0-bad5-485d-9c77-402d806e97a5@collabora.com>
Date: Wed, 12 Mar 2025 00:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-6-fbdb94f02562@collabora.com>
 <20250311-burgundy-cat-of-diversity-b89681@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250311-burgundy-cat-of-diversity-b89681@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/11/25 6:17 PM, Maxime Ripard wrote:
> On Tue, Mar 11, 2025 at 12:57:38PM +0200, Cristian Ciocaltea wrote:
>> Provide tests to verify that drm_atomic_helper_connector_hdmi_check()
>> helper behaviour when using YUV420 output format is to always set the
>> limited RGB quantization range to 'limited', no matter what the value of
>> Broadcast RGB property is.

[...]

> We need more tests than that to test the various combinations, whether
> the fallback to YUV420 should work or not depending on the EDID, the
> driver capabilities, YUV420-only vs YUV420-also, etc.

Some fallback tests were provided in the next patch, including checks like:

  KUNIT_ASSERT_TRUE(test, drm_mode_is_420_only(info, yuv420_only_mode));
  KUNIT_ASSERT_TRUE(test, drm_mode_is_420_also(info, preferred));

I'll try to further extend the test coverage.

Regards,
Cristian
