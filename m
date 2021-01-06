Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7AA2ECBFA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40906E423;
	Thu,  7 Jan 2021 08:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0F289DE6;
 Wed,  6 Jan 2021 18:17:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id o13so8698158lfr.3;
 Wed, 06 Jan 2021 10:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HYWLWTmJNILkmHihZoZqMnAVOHO5Z+JPD1TRn5rR9L8=;
 b=GYiaiaGEtT4BPqTlK0KXvA/lu341yArrXOfwIqhkoVUJgJS2obaAQT2iqcnRMLlEj2
 86dYKLxag/6o7FFGTh1Vt5TIkPdSdG+zPtevOxa7j54gud87De0pnPPNNbmeyzFcKIe1
 4YIh5yiiCYo2x6drTLogG5BS1FtgZ7nId5Q/AwMgojxtj5XPEyq3STR1fkLiu+XesnUc
 QU5ia5w8dG/71l1Z55HnJQmRQInADBb1sNl7x6aeuUT/y6q1BPYSDCvgpmBhWeM+Z+mh
 AXVxDGWhMUV9j3VOAFcsUFiIntWY+dOOFoXQpYyyfUUEdyjbQguMaGGbtpj5p1vrw984
 ODXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HYWLWTmJNILkmHihZoZqMnAVOHO5Z+JPD1TRn5rR9L8=;
 b=A57KnIWEwWGacVE++KNBwnngF9hWW7+h2kKoiWBYVZcGHFkgGNCGGva5pIGorsU4Cb
 xzbiQM6AdYG3fc2ji+E3CWfeB3284t+qPOqBeM5vFmQQ9zuRl4VcKlvpC/uH2m4a3zMU
 CKNm2SM07JGgHlRXTgqdVmPdh1xsn+r0tnl0Heo3LTrrKmiTC0QQd1bQnu83Y7mVcE95
 kCXfHoiijE0AOOHvhOO30tioZIObQNi5sUKfqiJ8L2yE5ro8Lhqb44hzjEEqTmjydbqe
 mFE5qR/0TXt0fdvbT7ShWoOHevZHQolSqujC5eXRNJu8tDKn69G1opVTxMfHfD9tSvAo
 pJ8A==
X-Gm-Message-State: AOAM533VOkofIJBC22a6KXPW9zkqpqv5dRyf9+C3FsinsX79BfCuLBY4
 Ab9+Taua9VIZvn/QoNzyDmk=
X-Google-Smtp-Source: ABdhPJyPxFIsokqex0tU1bZCyssoNhQcXmbMg7xmBfVSnpJHRzc1xaOuhg1qqDeBQDzHj7VlWoc+4Q==
X-Received: by 2002:a19:2358:: with SMTP id j85mr2490159lfj.264.1609957066448; 
 Wed, 06 Jan 2021 10:17:46 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id q7sm556364ljp.77.2021.01.06.10.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 10:17:45 -0800 (PST)
Subject: Re: [PATCH 26/31] PM / devfreq: tegra30: convert to use devm_pm_opp_*
 API
To: cwchoi00@gmail.com, Yangtao Li <tiny.windzz@gmail.com>
References: <20210103035445.23696-1-tiny.windzz@gmail.com>
 <CAGTfZH0sLh=8XhBVOzUr9qO2w_=jp-OuWoh5vgNpnmXq6EzYHA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e49d60f3-f753-6679-7148-f7ea72973197@gmail.com>
Date: Wed, 6 Jan 2021 21:17:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAGTfZH0sLh=8XhBVOzUr9qO2w_=jp-OuWoh5vgNpnmXq6EzYHA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 gustavoars@kernel.org, jirislaby@kernel.org, David Airlie <airlied@linux.ie>,
 linux-mmc@vger.kernel.org, stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, natechancellor@gmail.com,
 Thierry Reding <thierry.reding@gmail.com>, tongtiangen@huawei.com,
 Guenter Roeck <groeck@chromium.org>, marijn.suijten@somainline.org,
 steven.price@arm.com, Matthias Kaehlcke <mka@chromium.org>,
 chandanu@codeaurora.org, emil.velikov@collabora.com,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, jonathan@marek.ca,
 harigovi@codeaurora.org, adrian.hunter@intel.com,
 Viresh Kumar <vireshk@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, dl-linux-imx <linux-imx@nxp.com>,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 rikard.falkeborn@gmail.com, kalyan_t@codeaurora.org,
 linux-tegra@vger.kernel.org, varar@codeaurora.org, mchehab@kernel.org,
 sean@poorly.run, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, akashast@codeaurora.org,
 rnayak@codeaurora.org, parashar@codeaurora.org, tomeu.vizoso@collabora.com,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, agross@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, Shawn Guo <shawnguo@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDEuMjAyMSAwNjo0NywgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gWW91IG1pZ2h0IHJl
bW92ZSB0aGUgJ2Rldm1fcG1fb3BwX3JlbW92ZV9hbGxfZHluYW1pYygmcGRldi0+ZGV2KQo+IHVu
ZGVyICcgcmVtb3ZlX29wcCcgZ290byBzdGF0ZW1lbnQua2trawoKR29vZCBjYXRjaCwgdGhhbmsg
eW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
