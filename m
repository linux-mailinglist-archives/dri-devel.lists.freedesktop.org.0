Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CA077084F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 20:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9816610E0FE;
	Fri,  4 Aug 2023 18:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655AF10E0FE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 18:56:58 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bbf8cb694aso20698405ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 11:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1691175418; x=1691780218;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/n0GYVjapba8lsY0hdF4E8dSQP8wr1YDd0bnhnwjiKw=;
 b=e375aa2bU/bu/9ZyZ8XWXHFLjHH/lzrscEzSwrO63bORuZ0D9sAUJPl/MVmC64pP3h
 uYqKJY8+uViuPbq7wSbRV8TyVjaFyKenW73b6mszZTMgmGHr/PedjQaS+TqXS8DG3ovG
 PyhgR7MMOYg4DGDVcp9xKAT85TzRLp+kjM2KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691175418; x=1691780218;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/n0GYVjapba8lsY0hdF4E8dSQP8wr1YDd0bnhnwjiKw=;
 b=VA0h+IVPswQvMLGi+t5pwVNL+9A+krNOCQ2ISp/TdF7604WAC1VU1LeDUWm8vtZz1g
 HCwyGPeOfgpPt/PWLFMEefgGZPA2Zi/wEzuCWR4EtsIniZkWaF1gBJipizs1bDt9Hg4g
 eEHC68AS1wk/DofWmNOF405mJvMCEVmwWzzh6fmeLF7AxMrVepX1Ti1ULIeRoyZtOn07
 sFCsJLfpEDrkG5Os5LTOpMGqUj1k8EONDVUyH78QnAG/Fb8PqinOulqxHxYPn8xja3tw
 bqgaMCQqgB84gnT39FHN8ZQd7axA0UVdKtAj6MgGm+b97+bSSO5rvc4KwPB2S78eLYfx
 7RYw==
X-Gm-Message-State: AOJu0Yz3IOQGb50NWpkXu3M2NMZhIjhNg24XbHpimIwvMdOdrBNCo9yV
 IbfHazhO+9lxD+Kg8GPFqOqCog==
X-Google-Smtp-Source: AGHT+IHBS1aolLevWVoYHi+cWiOyJWHEoMaX4uvgp0421SMlYIfGbWzZCh9jd/K4KcB/zsIIMfOYKA==
X-Received: by 2002:a17:90a:bf81:b0:268:5fd9:b660 with SMTP id
 d1-20020a17090abf8100b002685fd9b660mr2551798pjs.39.1691175417763; 
 Fri, 04 Aug 2023 11:56:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a17090acf8e00b00267ae12b80bsm4460168pju.34.2023.08.04.11.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Aug 2023 11:56:57 -0700 (PDT)
Message-ID: <71bf173d-09f9-a336-08e6-3d9be882ce2d@broadcom.com>
Date: Fri, 4 Aug 2023 11:56:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
From: Florian Fainelli <florian.fainelli@broadcom.com>
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000000d2d6306021d760c"
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Johan Hovold <johan@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@amd.com>, linux-riscv@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 Luca Weiss <luca@z3ntu.xyz>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexander Shiyan <shc_work@mail.ru>, Samuel Holland <samuel@sholland.org>,
 Sean Anderson <sean.anderson@seco.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Michael Walle <michael@walle.cc>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pwm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Sven Peter <sven@svenpeter.dev>, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Alex Elder <elder@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>, greybus-dev@lists.linaro.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Hector Martin <marcan@marcan.st>,
 Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000d2d6306021d760c
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/4/23 07:27, Uwe Kleine-König wrote:
> Instead of requiring each driver to care for assigning the owner member
> of struct pwm_ops, handle that implicitly using a macro. Note that the
> owner member has to be moved to struct pwm_chip, as the ops structure
> usually lives in read-only memory and so cannot be modified.
> 
> The upside is that new lowlevel drivers cannot forget the assignment and
> save one line each. The pwm-crc driver didn't assign .owner, that's not
> a problem in practise though as the driver cannot be compiled as a
> module.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de> > ---

>   drivers/pwm/pwm-bcm-iproc.c           |  1 -
>   drivers/pwm/pwm-bcm-kona.c            |  1 -
>   drivers/pwm/pwm-bcm2835.c             |  1 -
>   drivers/pwm/pwm-brcmstb.c             |  1 -

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com> # 
pwm-{bcm,brcm}*.c
-- 
Florian


--0000000000000d2d6306021d760c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVgwggRAoAMCAQICDBP8P9hKRVySg3Qv5DANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjE4MTFaFw0yNTA5MTAxMjE4MTFaMIGW
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEZsb3JpYW4gRmFpbmVsbGkxLDAqBgkqhkiG
9w0BCQEWHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA+oi3jMmHltY4LMUy8Up5+1zjd1iSgUBXhwCJLj1GJQF+GwP8InemBbk5rjlC
UwbQDeIlOfb8xGqHoQFGSW8p9V1XUw+cthISLkycex0AJ09ufePshLZygRLREU0H4ecNPMejxCte
KdtB4COST4uhBkUCo9BSy1gkl8DJ8j/BQ1KNUx6oYe0CntRag+EnHv9TM9BeXBBLfmMRnWNhvOSk
nSmRX0J3d9/G2A3FIC6WY2XnLW7eAZCQPa1Tz3n2B5BGOxwqhwKLGLNu2SRCPHwOdD6e0drURF7/
Vax85/EqkVnFNlfxtZhS0ugx5gn2pta7bTdBm1IG4TX+A3B1G57rVwIDAQABo4IB3jCCAdowDgYD
VR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEG
CCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWdu
MmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6
hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNy
bDAoBgNVHREEITAfgR1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUUwwfJ6/F
KL0fRdVROal/Lp4lAF0wDQYJKoZIhvcNAQELBQADggEBAKBgfteDc1mChZjKBY4xAplC6uXGyBrZ
kNGap1mHJ+JngGzZCz+dDiHRQKGpXLxkHX0BvEDZLW6LGOJ83ImrW38YMOo3ZYnCYNHA9qDOakiw
2s1RH00JOkO5SkYdwCHj4DB9B7KEnLatJtD8MBorvt+QxTuSh4ze96Jz3kEIoHMvwGFkgObWblsc
3/YcLBmCgaWpZ3Ksev1vJPr5n8riG3/N4on8gO5qinmmr9Y7vGeuf5dmZrYMbnb+yCBalkUmZQwY
NxADYvcRBA0ySL6sZpj8BIIhWiXiuusuBmt2Mak2eEv0xDbovE6Z6hYyl/ZnRadbgK/ClgbY3w+O
AfUXEZ0xggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwT
/D/YSkVckoN0L+QwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIJVRVnh23gou/ZXM
xLrWWCgmQn2xtMRA162GbBO9/dNGMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTIzMDgwNDE4NTY1OFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCeY2JA/KgWM4vPAV31zSzVzYrfPMRXCIfF
Rj6R9XYhPgxWP6TQxPlLR4V/MpPiWo6qnCPNgx6CkJeICGvCTgq/KWzIsFjdcJZL2fUYca6Mfkas
FokG+I0ubYubKlhIl2dNeIpXuoH/pCpDkMUU9X29YXGRKVmBiWZUOhlSiHxZ/od/W85OvJowoNpk
BnTN/oPXXlu/PmOvJA9x6pma9s4JS9RjQaYJ3oXm4MXK03xn8mVRKMq1xZ8+ANWfsn2mFjGaYrAr
uFGIHrxGw/4GhdVVG5Tau+NsC+WPDU9UtRtXbW+1PxKKJnvEO+APaMuGEhkZJX0aAJKAxa+uYIcm
/Jjt
--0000000000000d2d6306021d760c--
