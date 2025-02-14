Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F23A35F13
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083E110EC8E;
	Fri, 14 Feb 2025 13:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lYhXLXeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A889910EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:29:17 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-308f4436cb1so31397761fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539756; x=1740144556; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GckW9SgjVb4uOUm4nzkhOEDjrIncX3PrBzD3QPYjQIA=;
 b=lYhXLXeC5gt1coyRXyOxqmJqVFFdIzUVIYsZUIje7KLMxLJW5iRCyYkV2DljHA3xdS
 sEJSTlZVww+5hACsN6LYOy0Z0TYNJ7tC+44u3vCzE33fLZ/XuOgbKsXmbAfxueIIWSuj
 eBChGf9523fDNaE4OUq4MoMEQZD+WppbwjH9fMFn3COSCDacyUJpdA+MOMBKaUuVDp5A
 9FTULdRd0RUXi/+yIkc3Pub4/9/AkU2Mc8Ohl3+ayZmXefe1HCeW9CrQElp4V+BeH5bX
 NuSAbaU5NP2yzyR3wX7f96NzOBF4deCCAhUCRxa3gIbRc5VEb/fGdKCRzM84MvtDlQ7x
 XpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539756; x=1740144556;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GckW9SgjVb4uOUm4nzkhOEDjrIncX3PrBzD3QPYjQIA=;
 b=Bl/E7qP/dBOSKq93jy3FZrlkh4z5nfBw20WlHgxPPtFISWY4tpL8RldULNJViIzgDJ
 Kp4DgtWCe8TMHFOb3MBFmXbZZ0BgfBL+AHYX9jd8aXkl6r3QdVHXasZv5xhunrvjrGnW
 5A63I0m+hZppX5W4dCJlyAyuuYf0imoWb/zP40K/yrVK5Xl4mwd7B4zivSowp5Iv9RtC
 NMUQRIJAyQlHYYaBXTB4z90keAKC6oWS/nt0FTSTAHTittTBGERM3R/aurX6L6EiiJ5T
 g32eEfG7aBnk8AQBc5YmVbOJanUfPVPuNw0Ohahz89gk8iWivrw7VZvEYRX5EWwbEOzf
 /MNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrhiTuNYI0je5ZyVgIlXApj1q1h+dTqr57Xw33bnFe/DxBfr6gdt2PiO/FcP2R/rlzja3RYdr+qUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuM9YT4u5DzSg4vA0WbOasXtqmcqr/+Yrbbo4m65VUogDqhbFQ
 q/KKS4YVH9XWW9ytZvNH4afHpXOB9i30IR83qqqQT4ttfTtoP2ivzpfPrHP0RBA=
X-Gm-Gg: ASbGnct4GzM4MKfLdo1461DAe/92POWJrhem0YZPWzNmcj7lkNtyZpa1rD3iLSiDf8I
 s2jQMLFzVrQaBYM3t5x6bI+qc5I8k+mzB1WKczozmoXkNJOmzpZXAsdqikgh8Ckmg0mRXDtT7/q
 6qLXKJ9pb6W1wUP/J1wt7dr8qMJySr9F2gySYIEju/fmVZ00UQecJ54ma+cEGd+pW8m2qzqBZbi
 tuTFBz27F6sN1OHbYYJbDi5lUDOy9CWkiaIoN+DBKnd1Ji1YLGRZyXuRubbjR/KiZGR0bk8t7RF
 jwUdRQ+KVPt5td47Ae23ebxTLrTdLq/knQ6gTQd2OP1NWI4wyZMlVuLozhAdxPefY8EIgzM=
X-Google-Smtp-Source: AGHT+IFKrTe1qOLXvbGIJXg+EWgQKwS3o7giu2lqYZTaorNRk1NGxn7QVCdOwKf+9Z3tm3rgrJjXzw==
X-Received: by 2002:a2e:91d2:0:b0:308:e9d4:7ccf with SMTP id
 38308e7fff4ca-3090f11c8cfmr22400311fa.4.1739539755893; 
 Fri, 14 Feb 2025 05:29:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309221d7074sm1604541fa.102.2025.02.14.05.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:29:14 -0800 (PST)
Date: Fri, 14 Feb 2025 15:29:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 32/37] drm/bridge: Make encoder pointer deprecated
Message-ID: <yy37e4kne7i2hl7coix6v7vajb5bm4zohod4fdzayvxr52l57u@cxturs2uxgcm>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-32-e71598f49c8f@kernel.org>
 <nfb4fb6lzjw4j5brsh242htgw3au2moklqjalfa3zzxjsi2qn5@l3censelmgbz>
 <20250214-arrogant-strong-hoatzin-efdcd8@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-arrogant-strong-hoatzin-efdcd8@houat>
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

On Fri, Feb 14, 2025 at 02:07:18PM +0100, Maxime Ripard wrote:
> On Thu, Feb 13, 2025 at 06:35:15PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Feb 13, 2025 at 03:43:51PM +0100, Maxime Ripard wrote:
> > > Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
> > > pointer to other currently bound entities. They are all considered
> > > relevant only for non-atomic drivers, and generally perceived as
> > > deprecated in favour of the equivalent pointers in the atomic states.
> > 
> > I think there is a significant difference between mentioned fields and
> > drm_bridge.encoder: the former fields are variable and can change. The
> > latter one is static and set at the bridge attachment time. Nevertheless
> > I think it is a good idea to deprecate it.
> 
> I'm sorry, it's not clear to me here what you want here either. Do you
> want me to change anything to that patch?

Well... I was thinking if we should expand the commit message. Most
likely it's fine though. In the end, I've r-b'ed the patch.

-- 
With best wishes
Dmitry
