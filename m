Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0248A4FC1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B402711253B;
	Mon, 15 Apr 2024 12:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gnU0v0BL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2B611253F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:54:08 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41868bb71cfso4174585e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185647; x=1713790447; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pAyy9h+w9WL23x4FmjpqsU54I0yw+SnGvko40DICoGU=;
 b=gnU0v0BLfHnOmxbir+9a64v1v+JTvJWthhSfw24T+omFQrOktMrH9SkfoSGVkRnU9m
 GPwRMueD/BtVXXgxKq0vNuwQgMM3215Z/T7sLIl0dxLnI2Q1chYPIs1V5076LjkygEGV
 18V1g/YwtOtoPWjEsgKQWbVNHv098AycSXN/1425OZN6qKOc1eFwCYKolWlK65Ee/82k
 WqoyckD9A7cUFvKhQf1bsM4mgz9VZP+iu9T8f9FEmH6t5iGJ6HzAwkZGOT1B/qNb9STG
 y7VK9gn3PXO7+ai+cjHwtYvkWli9XMeBK/lFWyE7m6lU3pWi8AbvvuLCJlYY/OsFUTnL
 vpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185647; x=1713790447;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pAyy9h+w9WL23x4FmjpqsU54I0yw+SnGvko40DICoGU=;
 b=vJcLA0UQo9hOMvbQ6j4Qj06/dS2R4ibx9vcnleo+6O6P/WoZmLk97s6mAiXZMxu4Ru
 W3lkeM4pIzeOCA8cgeulwf3BdUuElVSg79pM5Po0+E4cR4zMlFwJu9wS2xM3RYavFPDI
 IK6tHSkoRa2GYGMZWv5yjWylfeZo1Wa4C+cQz18uBZT8RERLisvtbBEXjU0ECr7lyG1C
 pXk0F12z5wI+y4uE/IuCj9s9D9S0VeLTcJK+MhB2rgATXOwIEhy66YTUpCKkYhScmiab
 RuzTPZUzncjD80TDo2GuqkKi5PMEdIeLgUXQR6t8pLYQkpFcA4DJDxup9j7xGIB2dzUR
 DF8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4AdHM+iCfZfYH7RLwGM8ey7qQ0a1JX7Im9qLEvh+2Rnfmj5EslXIOlwzfRTpmnQVQSRzpTkpbXDyusW08S+TQd2wO1f75Yf9blqjORRXD
X-Gm-Message-State: AOJu0YxbAU9+G22IxPjg2Pei7oQmWSGYXVl7EOugwXcQhO7+AZ5SoxwO
 M+wkVIAcykfoOdbW33Gq92u1a5gYZZ/AH/mLk2E+NE7i7pa3gt/mbRH2g20h79I=
X-Google-Smtp-Source: AGHT+IHIAoyrHsHxVmasOdct6/TjYd9/FihqF5G/WDFQfH9WIbSdv5Ii00aYT3qEYuQW6yxLfif82w==
X-Received: by 2002:a05:600c:314c:b0:417:e4ad:d809 with SMTP id
 h12-20020a05600c314c00b00417e4add809mr6762933wmo.25.1713185647011; 
 Mon, 15 Apr 2024 05:54:07 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 iv12-20020a05600c548c00b0041876516d91sm1747956wmb.7.2024.04.15.05.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:54:06 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:04 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 09/18] backlight: lms283gf05: Constify lcd_ops
Message-ID: <20240415125404.GI222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-9-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-9-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:07PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
