Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF2AEF0E1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227C010E526;
	Tue,  1 Jul 2025 08:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ZQ8SnUty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122A510E526
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 08:22:23 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bWbcC4Hwhz9tVh;
 Tue,  1 Jul 2025 10:22:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751358139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8abd5Nv5jm00iYcLM3I0EbpnyCM02PFsqJnuhqVrqAY=;
 b=ZQ8SnUtyAzXwzDmQvmTv/mddIHgKlV8jYMNog8Vh3zbqQ4XBPdwK8u9eXW9d2v9Vn5A7Pa
 U4XKCtPc4x2qqbDJoeQXjUbNbV25ihhqlA5U3m63/qGFNsPIycLH6G4a9FpsSFRK5KhSgV
 2JPfEZDwahGqKy6Ev8OZly7qxCYPN+W7Pcx30ewQOJn077AHuKCoOoZ2LlcsjiqOgCFlf4
 xpJlBdYMsKIYKV79Cc3IotrfRxwQb8760m6UzuamXF4aTOVg8+VSoW5ks+aRXfy4oyvxo0
 n1oIa59zWEmjKZhuCBSsF2MEjVMr60+3uo03R/GK8iJCXQ6vJRSGZiD6n74ONQ==
Message-ID: <6c2e44cc-c01a-4331-b139-152ccdbd0401@mailbox.org>
Date: Tue, 1 Jul 2025 10:22:13 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm/tests: Fix endian warning
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, cristian.ciocaltea@collabora.com,
 gcarlos@disroot.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20250630090054.353246-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rwysntwm1x4zea7tzcbewmpp7cygsg7y
X-MBO-RS-ID: 54a2c9e95496840bd12
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

On 30.06.25 11:00, José Expósito wrote:
> When compiling with sparse enabled, this warning is thrown:
> 
>   warning: incorrect type in argument 2 (different base types)
>      expected restricted __le32 const [usertype] *buf
>      got unsigned int [usertype] *[assigned] buf
> 
> Add a cast to fix it.
> 
> Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 7299fa8971ce..86829e1cb7f0 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -1033,7 +1033,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  		NULL : &result->dst_pitch;
>  
>  	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
> -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  
>  	buf = dst.vaddr; /* restore original value of buf */

It might be cleaner to use two separate variables instead of using "buf" as both little endian and host byte order. (Same for patch 2)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
