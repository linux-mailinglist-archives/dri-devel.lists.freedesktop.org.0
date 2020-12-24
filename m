Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B842E2AFB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A362E89C9B;
	Fri, 25 Dec 2020 09:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E3489B49
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 12:16:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m25so4313665lfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 04:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aBLJJg+bzbWbulXzWEitNJ5042asREQNv3cmv9hVKiA=;
 b=JJuUSYdMpRe4neER0nnPgTpAPimiRI1Igwq+UpeDahgwudF1GCXX8kQ9WPifh+7+rE
 ns6OdiZdklf9VJoAnwAIpFuFP4soAjlbIn1wKb3lMOLTswsKwQS6wkrGtvHUUduAhIR7
 xTS0ENwDMGzO1p7nvwvV9whAs0T5WkC6vFtKzk+FV6KWULbCWssULHHLIuTPwqtTLOP7
 50lmQv/rwlVR4UDetNofZ4dJKnmTquUMRtMeLimaCumiMVuw5zIGpcPia8nF/7F4+HeG
 KSaiTeEKZgA/vi4p4i0umtKkbryQkR9R/MCG0HSKYHf5WH0l1k5XdA113l+wSElI4Qyw
 73DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aBLJJg+bzbWbulXzWEitNJ5042asREQNv3cmv9hVKiA=;
 b=D1soWLGoLX9s4RpgaFAQN5S8vQAJEiPGa223sd/w537mxm45YIeo1g9+y3QD4CBSH5
 q7WhqwFSrwjEiCJWOKAXti5YoOcMe6wRiyvozehL+zXlbJa6gsyHAHrL5nMkTQnt5Yhh
 m8wmyniQQFo7WlWQIg/WX0FHXIWcUkDkbN8Vs8mH5YDkUQ1X/5Dc7lypOJ0+n9+mokDU
 dsb18sRvgP/yg8QLIVXZ/2yRLqL0eNNOr2TVPS3RZ8xDKMS7GlsS61uv9JRyCDSG67w7
 nu8f9x1kWVW2WJ+Fj1dW2NIgLqjoQwmjrAwrR93bHo0vU0vmFNoJDSMVjhmGzZfCV0X2
 OKwA==
X-Gm-Message-State: AOAM532/JSl1lGKK7z6CafKMQ0v/D1L45Sb7LKRItRIp3d802gTRKQaw
 EHjUwZfIgJAXDlRGshNQZbw=
X-Google-Smtp-Source: ABdhPJwqnQyO8QLk/YiNUUylyZroRpd4i08hKXJxtramIT73WqKFf+cxMjJwIeVnmd7ZHuojM/4uMw==
X-Received: by 2002:a19:7ec9:: with SMTP id z192mr13717595lfc.50.1608812203827; 
 Thu, 24 Dec 2020 04:16:43 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id x70sm3283612lfa.224.2020.12.24.04.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 04:16:43 -0800 (PST)
Subject: Re: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-16-digetx@gmail.com>
 <20201223060101.v2qihvvgsmpahg24@vireshk-i7>
 <ea025b0f-bb2a-d075-4c8e-45831fa9cd93@gmail.com>
 <20201224041025.mlxsbl2yrxyqt7yh@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <236f9306-97a5-5f17-9689-a6e04c052b7a@gmail.com>
Date: Thu, 24 Dec 2020 15:16:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201224041025.mlxsbl2yrxyqt7yh@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjQuMTIuMjAyMCAwNzoxMCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMjMtMTItMjAs
IDIzOjM4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFdlbGwsIHRoZXJlIGlzIG5vICJzYW1l
IHN0cnVjdHVyZSIsIHRoZSBvcHBfdGFibGUtPnNldF9vcHBfZGF0YSBpcyBOVUxMCj4+IHRoZXJl
Lgo+IAo+IFJpZ2h0LCBJIHNhdyB0aGF0IHllc3RlcmRheS4gV2hhdCBJIG1lYW50IHdhcyB0aGF0
IHdlIG5lZWQgdG8gc3RhcnQgYWxsb2NhdGluZwo+IHRoZSBzdHJ1Y3R1cmUgZm9yIHRoaXMgY2Fz
ZSBub3cuCj4gCgpPa2F5LCB0aGF0IHdpbGwgYmUgYSBiaXQgYmlnZ2VyIGNoYW5nZSB0aGFuIHRo
aXMgdjIuIEknbGwgdHJ5IGl0CmltcGxlbWVudCB5b3VycyBzdWdnZXN0aW9uIGluIHRoZSBuZXh0
IHJldmlzaW9uLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
