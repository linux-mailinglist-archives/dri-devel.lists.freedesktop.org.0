Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDACAC7ED
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 09:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C48F10E3C9;
	Mon,  8 Dec 2025 08:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MvAKCk4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E339710E3C9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 08:27:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-477770019e4so44515395e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 00:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765182442; x=1765787242; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s8SU5VS4I2nwHj0bsl3wvsuQjQZeP4l7lI1VT5Q3JIo=;
 b=MvAKCk4YCtf8s0er38pyV2FRTDp6nOQgUYo63sh2N2BAmT7X/SyPhXyODEhNYFegcK
 VEU1/hE4wctxmboUUGRvQrAIfer8LUZa7nWbEvl+JTm1frgKLT0HP3w82bujhM8dfBpA
 cJ2R6Vjqu7phVxJgx/9WBUQLkOqOdenx2dKi6EVRN6wmPfYnkr0nCFDhZY+JwdZXgdr3
 WiAYjYNACjYkul5/448BbrTE7qrKVeOIeqVQKc6mAulVH1Bn31h0Ms9bxFTbXwPswaR2
 KdFKvwi0m8FA7YzI6OzHScOt18Fmqor4A4a9rrb5gIYszYdYv9oxESIaCpd38Hj6qsQQ
 kA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765182442; x=1765787242;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s8SU5VS4I2nwHj0bsl3wvsuQjQZeP4l7lI1VT5Q3JIo=;
 b=tJe7XaV4LKXTx7SJVDxTawi/cg1ud7hGATQCceiJpOFAOPFcUdW1xQJ1BIpiX0ES0v
 1aoBfSu0m1lrunVpjMwu12BzI4f76HDeicY8v3Yvj24gKpXVes6ahlHxUl8oJKsf8ybZ
 ZJDQ1NSZLDIJlo+iN/StG+F3MvdFKgzzEaFPyW5mRd4vtCV0SqR0PIvCgNRxHnDdOcy8
 hleg9r5tO40axehKWkm6yolL/0uOI7WkcEvUelWPWqz7vqtck7fLlSVre2BUwOygRS8k
 MM4faWt+Ca9qgX5clQ7X4fuhMW1m8eFtzbSse7DkptUKK9+ZBLsiROzSyPxxgC+ylIf5
 Srrg==
X-Gm-Message-State: AOJu0YzESYEew95EqAKo8ZT6aBfzJcMV0dfhpA29EkWpFiZ83wAG/MTj
 hC6VBb2QbiSi5AD5Hnf+QgKtArcTc+yQBbCMHfAEu720TrBKSIxC2QALhvQUrnHqfMU=
X-Gm-Gg: ASbGncvNvRnJ8HgeOdjSKZV1t4eLnQiypGhLEjhirUQdAqDbMUxKdBYV7DEkBNtch8/
 iSt5Ue2/PDjZSP70LlJacQWXU6kiyLuToRBkn4Qx5UdquYTGewQg6+fTt0TseSuj6gkdWSC878r
 wSSciJaDuXvsyFB9jtaHM1qoakb0txtrLE7+dBTLQ4n8PnmUIbyC7QuP3B0u2YLgN1TQpY2nC/c
 vG4iZokCTQ9JV3o6HEQhoCBBKPBQ9PF+CFzfWpbYQWBZM80LWCt1haIWxFkqFVLJmmPK/w2H25N
 czjHUoimO101ZXaDxfVg1xPJCSOgI1Nsv7uWCTyGgZGy07zdFe9lNaqTvG7ylY40t3MuJdUiON/
 E0HqOn9YOs0oEPi4mHs/i53JfzbxZtTJ/OIKTj1HbwKsWVCpVvb6oBpAMSi2yFAZosuLKwO6gqU
 OKOCO+sEQ1hK/MP0j0bRye6hDAziY=
X-Google-Smtp-Source: AGHT+IGBfh35gcZgeUymtJbzTIihVzD7qBnir9gHQmyUYyG8z6hl7s1eNnYYaJ97Gb+ymBoqjsnI/A==
X-Received: by 2002:a05:600c:5291:b0:477:8b77:155e with SMTP id
 5b1f17b1804b1-47939e040e1mr80459175e9.15.1765182442193; 
 Mon, 08 Dec 2025 00:27:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42f7cbfeb38sm23919027f8f.12.2025.12.08.00.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 00:27:21 -0800 (PST)
Date: Mon, 8 Dec 2025 11:27:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm: Use new mode_valid() helpers in connector probe
 helper
Message-ID: <aTaL5m5xZpstLuXj@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Jose Abreu,

Commit 97f973d65260 ("drm: Use new mode_valid() helpers in connector
probe helper") from May 25, 2017 (linux-next), leads to the following
Smatch static checker warning:

	drivers/gpu/drm/drm_probe_helper.c:102 drm_mode_validate_pipeline()
	warn: set error code if '*status != 0'

drivers/gpu/drm/drm_probe_helper.c
    89 static int
    90 drm_mode_validate_pipeline(struct drm_display_mode *mode,
    91                            struct drm_connector *connector,
    92                            struct drm_modeset_acquire_ctx *ctx,
    93                            enum drm_mode_status *status)
    94 {
    95         struct drm_device *dev = connector->dev;
    96         struct drm_encoder *encoder;
    97         int ret;
    98 
    99         /* Step 1: Validate against connector */
    100         ret = drm_connector_mode_valid(connector, mode, ctx, status);
    101         if (ret || *status != MODE_OK)
--> 102                 return ret;

The caller expects ret to be set on error, so if only *status is set
to an error this will do something bad.

    103 
    104         /* Step 2: Validate against encoders and crtcs */
    105         drm_connector_for_each_possible_encoder(connector, encoder) {
    106                 struct drm_bridge *bridge;
    107                 struct drm_crtc *crtc;
    108 
    109                 *status = drm_encoder_mode_valid(encoder, mode);
    110                 if (*status != MODE_OK) {
    111                         /* No point in continuing for crtc check as this encoder
    112                          * will not accept the mode anyway. If all encoders
    113                          * reject the mode then, at exit, ret will not be
    114                          * MODE_OK. */
    115                         continue;
    116                 }
    117 
    118                 bridge = drm_bridge_chain_get_first_bridge(encoder);
    119                 *status = drm_bridge_chain_mode_valid(bridge,
    120                                                       &connector->display_info,
    121                                                       mode);
    122                 drm_bridge_put(bridge);
    123                 if (*status != MODE_OK) {
    124                         /* There is also no point in continuing for crtc check
    125                          * here. */
    126                         continue;
    127                 }
    128 
    129                 drm_for_each_crtc(crtc, dev) {
    130                         if (!drm_encoder_crtc_ok(encoder, crtc))
    131                                 continue;
    132 
    133                         *status = drm_crtc_mode_valid(crtc, mode);
    134                         if (*status == MODE_OK) {
    135                                 /* If we get to this point there is at least
    136                                  * one combination of encoder+crtc that works
    137                                  * for this mode. Lets return now. */
    138                                 return 0;
    139                         }
    140                 }
    141         }
    142 
    143         return 0;
    144 }

regards,
dan carpenter
