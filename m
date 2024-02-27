Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA9869EAD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 19:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBC710E388;
	Tue, 27 Feb 2024 18:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="B0Nn05bt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCA610E388
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 18:12:46 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3651d6dea15so107345ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709057565; x=1709662365;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9xo3DafYnz7qDd1iyNarBE0C+acGQnxfRXgU4VP6u+M=;
 b=B0Nn05btPnwWdQ1mf0FPbUtbDG17Q/k1exXChPqPzrHZGzp5TvVUkpw6y/BHRYVHdA
 2IXnLRbvqBx/GzMUka8znGemHlSE5eGubUceHWfMhNCf+IcjhoiHp3eyJKkVqGJfXfzY
 C6SBoBL3I2W0R3mO/VdiHtFFy96Ctp1Dik/5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709057565; x=1709662365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9xo3DafYnz7qDd1iyNarBE0C+acGQnxfRXgU4VP6u+M=;
 b=t0K+zKnGuQQsxcbTLG0pbKqSUSXXQ8HPNM1CfGzPkPgAhw4aBxybt7TpJ8U0DCJJcS
 WHIjWhYG9YiHrBoRsUXc81vPd0ZS9CyD4Jouv7L9fCAg8QPTjal4RJhyLwjwRjwRo1ds
 i/muN6Nkqb1dO+yH0Kwt1qzqQBFsoBiusBN7XnefLQR74HO7aPja7/9Jto5/ks2OXZwx
 BgneBSlrtu7XxaPGb79CYk1EMFviphdlAalQCwQi+dfNZGkq2dvDu64itHlRaCTUQnMV
 /3d3H+ulZYs7tz6/a3C07sUYbpsBxls3DgW8kFgmrDgTDC/WcmlzU1DZilkoWyCQTh98
 vieA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL4Av7xPhfg7XLA44arsh368TJR4/olklzN5GElJ0y/d43EaLk3TkIo7dwA4FCymPgI9sli80kbXqjbf3lF0JiC8vFFup0UCgJAh5/wcX7
X-Gm-Message-State: AOJu0YwOVUnTWj3C/Bk6lYBvmYh89JvLy5oF6zWtkAbV3TO2JRwxIwLY
 C84B7M2XXWmPC9825YgbI9OVuyd/mr4K9NCCwArDEbzLzSmF3fVo6VgcTxWZsw==
X-Google-Smtp-Source: AGHT+IGjrhhbq3O4yJbGQNPJHVvQDH/cLI79okVS/czvt6vJUsosc4jtEJE++l5mG9grtKNLuUoKMw==
X-Received: by 2002:a05:6e02:1aae:b0:365:b00e:c3cc with SMTP id
 l14-20020a056e021aae00b00365b00ec3ccmr105566ilv.2.1709057565143; 
 Tue, 27 Feb 2024 10:12:45 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com.
 [35.222.220.147]) by smtp.gmail.com with UTF8SMTPSA id
 br17-20020a05663846d100b004742452a382sm1963310jab.45.2024.02.27.10.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 10:12:44 -0800 (PST)
Date: Tue, 27 Feb 2024 18:12:44 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 6/8] usb: misc: onboard_dev: use device supply names
Message-ID: <Zd4mHOEs6tHELUXl@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
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

On Tue, Feb 20, 2024 at 03:05:50PM +0100, Javier Carrasco wrote:
> The current mechanism uses generic names for the power supplies, which
> conflicts with proper name definitions in the device bindings.
> 
> Add a per-device property to include real supply names and keep generic
> names as a fallback mechanism for backward compatibility.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

For v5 you could consider making this [1/8] (i.e. before the renaming
of the driver). That way support for new hubs doesn't necessarily have
to wait for the entire series to land. Since this series is underway
I think new bindings shouldn't use 'vdd-supply' but the device
specific name of the supply.
