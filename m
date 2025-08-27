Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E70FB37926
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 06:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD410E315;
	Wed, 27 Aug 2025 04:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="byrri9Eo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3185210E315
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:32:31 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-61c51f57224so5087228a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 21:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756269150; x=1756873950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nPT7S7ck2OMPXfBxc+RzMc8Kxenf3tVh8lBsVSZT310=;
 b=byrri9Eo8GDNkVUXlnGyR/GJDukwI70IV9Ljb2Rv5J2HdZ5KpJXZ1qStYIb/q/IHok
 AqTc6w0mIPd1u8cngKl51h3bSh1MGvPofs9Hb2LA0iGkKazyPBEWE68eZmCfzaoihy3C
 4pA5Us3isSH1NdYVOCH6zRe5Zng0iVBJqwiaoQ9vlhJJ/xqfSFFaKKN7xt5Xdr99c/Ve
 UD+TVPxWVmwu4kMYK1xJHo8isM7E6vfFFPauLApoK9I+bf4eJp/rV25hWsPkf5Vs8FL8
 wOEwiDFe5Oah9HB0FzndaeFK4QTh22pZeat6MK0dI3vEbQ1CJXK3Q3pdz9gEG1HHy63E
 y9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756269150; x=1756873950;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nPT7S7ck2OMPXfBxc+RzMc8Kxenf3tVh8lBsVSZT310=;
 b=Emdjmn23BtC8YvryL1/YO7KIYYd+6rWO0X+Imw68FIWrKfGFvWaTknVTUnt0ZAHmMS
 SfsEI6c7GkLMCAoHk8MgoxGPWs4Gin/SrMAeatbp5GloSO1yLvY8PEfLcHdeZ/bNa0nw
 /QMcogf61AhjOPpKXSkGn0SIcP14eZO8NWwcN+A+wGwMiA1Kwa6FTEtEiRBW3IJmuXA2
 7gd3aut3YABzBKu26QV9P8zaK9qthIW2Y86/VujKO+Lzf63zIpvZVtBChjW4FpzMur9d
 6I4h5IEUQ9df5zl6ggoT42diuiZlf+TcZEyoqGUmyy4WQ3Q9Q55iviIVfdkZQzauMDCK
 bopg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6kblnfcX5PAs2FNiHbh5y79TzhtDR4l721W3VOJ/rjzQSHXphesTfOcdEp1Ya+AvIuoe9fOfruzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxseHdMsZ0mFLGWToz3rdSNh+lnKr5varR0xEVsQCRkT/VisfVf
 gpcKTTI/f6WLXvM2s1FiSbbVLvQZuOcQIpkK9+Vt2+K0NkAPZOnl4HZz
X-Gm-Gg: ASbGncvKy555VeyB/OB3sgFxxYT631k9QaC+zVdlfJ6wlUFQ0GOEBuMb6PEOiR8kz7Q
 bk2Q60s23Zwla/K8pJB51tdGpdDqffJXcOxP0hj9zIYXVWlvaCsuZGBpn//lNc4luF6+A3fZIf+
 pARWtmYlL14WsIGvUbjMTzwM/dxR0pbdAvmIAqQRHAos9hSgHLMi/GBijHMSdoOHruLvUG/HjkO
 oGuD2wHlIjwcQtmVBh5VD48+KsLYjlghqkNM/H7p3OUJ9Y2ZituKTYDA8YzMv5j+a+uPUQeklO7
 vIRfrHfcu++AdV9YRY+7fsUqBLKzPVgxOZF/CLGL2LChvf77zGQ6xLQGTxP0nnS/nzJPzdb2Zaj
 A+sfg4rjqIVRNrQ==
X-Google-Smtp-Source: AGHT+IF+5wxPF37wRl5q6Zpcp5YXeXsq5X1FBZFa1yIqF0zMTpeqok9u42a8ivFBmKB0sTZEfjjT5A==
X-Received: by 2002:a05:6402:13d4:b0:61c:4c77:cb8 with SMTP id
 4fb4d7f45d1cf-61c4c771153mr10662557a12.15.1756269149569; 
 Tue, 26 Aug 2025 21:32:29 -0700 (PDT)
Received: from [127.0.0.1] ([5.248.55.4]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c78e49ca4sm4263216a12.47.2025.08.26.21.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 21:32:29 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:32:27 +0300
From: Svyatoslav <clamor95@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
CC: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_01/19=5D_clk=3A_tegra=3A_ini?=
 =?US-ASCII?Q?t_CSUS_clock_for_Tegra20_and_Tegra30?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1909286.atdPhlSkOF@senjougahara>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-2-clamor95@gmail.com> <1909286.atdPhlSkOF@senjougahara>
Message-ID: <76B1EB6D-B149-43C2-AA56-A15C9DCCA3AF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80=2E 07:09:45 GM=
T+03:00, Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
:
>On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
>> CSUS clock is required to be enabled on camera device configuration or
>> else camera module refuses to initiate properly=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  drivers/clk/tegra/clk-tegra20=2Ec | 1 +
>>  drivers/clk/tegra/clk-tegra30=2Ec | 1 +
>>  2 files changed, 2 insertions(+)
>>=20
>> diff --git a/drivers/clk/tegra/clk-tegra20=2Ec
>> b/drivers/clk/tegra/clk-tegra20=2Ec index 551ef0cf0c9a=2E=2E42f8150c611=
0 100644
>> --- a/drivers/clk/tegra/clk-tegra20=2Ec
>> +++ b/drivers/clk/tegra/clk-tegra20=2Ec
>> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[] =
=3D {
>>  	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
>>  	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
>>  	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
>> +	{ TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
>>  	/* must be the last entry */
>>  	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
>>  };
>> diff --git a/drivers/clk/tegra/clk-tegra30=2Ec
>> b/drivers/clk/tegra/clk-tegra30=2Ec index 82a8cb9545eb=2E=2E70e85e2949e=
0 100644
>> --- a/drivers/clk/tegra/clk-tegra30=2Ec
>> +++ b/drivers/clk/tegra/clk-tegra30=2Ec
>> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] =
=3D {
>>  	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
>>  	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
>>  	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
>> +	{ TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
>>  	/* must be the last entry */
>>  	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
>>  };
>
>I looked into what this clock does and it seems to be a gate for the CSUS=
 pin,=20
>which provides an output clock for camera sensors (VI MCLK)=2E Default so=
urce=20
>seems to be PLLC_OUT1=2E It would be good to note that on the commit mess=
age, as=20
>I can't find any documentation about the CSUS clock elsewhere=2E
>
>What is the 6MHz rate based on?
>

6mhz is the statistic value which I was not able to alter while testing=2E=
 I have tried 12mhz and 24mhz too but it remained 6mhz, so I left it 6mhz=
=2E

>Since this seems to be a clock consumed by the sensor, it seems to me tha=
t=20
>rather than making it always on, we could point to it in the sensor's dev=
ice=20
>tree entry=2E
>

Sensor device tree uses vi_sensor as clocks source and sensor drivers don'=
t support multiple linked clocks=2E

>Cheers,
>Mikko
>
>
>
