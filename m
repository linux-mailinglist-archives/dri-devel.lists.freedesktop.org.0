Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5AA2FE587
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C406E8E9;
	Thu, 21 Jan 2021 08:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBF96E321;
 Wed, 20 Jan 2021 15:52:49 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id h205so34698897lfd.5;
 Wed, 20 Jan 2021 07:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/KIgJpukkTUseLKOL+nfTNs+iHfOcLiaf/sA4jMSc7o=;
 b=b2NLVokQPZCUuJAyv3kiWNUb/D7/YvKoWfUJcCHR1heKGaiZjLpcSwBstX7Q3YX8MD
 0VSL3nGarP20z1Z7t1EQA7XA2H4vpXyhlGms2qwFGmlN5vFPCkNOEwhXvgcl2dX2OHl0
 Fk8lwe7s8eUZ2wwS5RMH6/mUWuXSRNmTjNvQCAwK5Dd3NdzmkpZHt4llHrw8Ni5khkmn
 myMjJRhAiEUeq/sHdT1yh60NnMmGAROPatvIjJ8mP6HQeV19cvk6YGXY87IpFAtncwaV
 v00shKKr9e/yxCXAB3jbsK18rnr4dn0SL3OuJ8SyDsoqZnywmH2zxXJFRB0YEqFQqi04
 OP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/KIgJpukkTUseLKOL+nfTNs+iHfOcLiaf/sA4jMSc7o=;
 b=n7TgVSG/zx1AZDbooqy+vBFTSC9s/IuFeZF9IRb89NB2GJT3hvzGJnCBbNmnSnSfgZ
 uxdeFNRwpYc/k2n2PZi9n/hxV48fAsoE/pb6H+IVv72JYHm5HAvVtoPOAgHd7dArOmM4
 494lD6fIVfb9GiKgIhktt0mNVjceJDszcZd8Qh1qzdX2dp1JnDK588L/lrcC3LeU35YW
 CZq5aGrkDEdAOVZzVr5Ef4WUemu9RetTKFz5z+hbWAyHBbuSxqlKDbC19U0GGVq1RjKn
 n39yBK2LcWhxe5IzHiUjviv+OVnZa637LYPclvRvUCyCW/kfkwDTF65nJ0P2IduJnP5G
 a2ew==
X-Gm-Message-State: AOAM5313iN1Ro7VsBZ8kMoWleflsUR8sX4Phdu/fl+ufFdPCaG9TcBXz
 3YG9xc24Xe226VA8LeCiH60=
X-Google-Smtp-Source: ABdhPJz54jp4p6N7ro9OB4UGTlGLwMbj9w9A1NhmVFwuW25RiB7kgYemoqd4C3nN1Esa+ddCNU5GUA==
X-Received: by 2002:a19:ac45:: with SMTP id r5mr4942869lfc.305.1611157967504; 
 Wed, 20 Jan 2021 07:52:47 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id b4sm74228ljp.53.2021.01.20.07.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 07:52:46 -0800 (PST)
Subject: Re: [PATCH 02/31] opp: Add devres wrapper for
 dev_pm_opp_set_regulators and dev_pm_opp_put_regulators
To: Yangtao Li <tiny.windzz@gmail.com>, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, krzk@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
 lukasz.luba@arm.com, adrian.hunter@intel.com, ulf.hansson@linaro.org,
 vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, ddavenport@chromium.org,
 jsanka@codeaurora.org, rnayak@codeaurora.org, tongtiangen@huawei.com,
 miaoqinglang@huawei.com, khsieh@codeaurora.org, abhinavk@codeaurora.org,
 chandanu@codeaurora.org, groeck@chromium.org, varar@codeaurora.org,
 mka@chromium.org, harigovi@codeaurora.org, rikard.falkeborn@gmail.com,
 natechancellor@gmail.com, georgi.djakov@linaro.org, akashast@codeaurora.org,
 parashar@codeaurora.org, dianders@chromium.org
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-3-tiny.windzz@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <43c251a2-430a-040c-4152-94cf10c884e0@gmail.com>
Date: Wed, 20 Jan 2021 18:52:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-3-tiny.windzz@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMDEuMjAyMSAxOTo1NCwgWWFuZ3RhbyBMaSDQv9C40YjQtdGCOgo+IEFkZCBkZXZyZXMgd3Jh
cHBlciBmb3IgZGV2X3BtX29wcF9zZXRfcmVndWxhdG9ycygpCj4gZGV2X3BtX29wcF9wdXRfcmVn
dWxhdG9ycyAoKSB0byBzaW1wbGlmeSBkcml2ZXIgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZ
YW5ndGFvIExpIDx0aW55LndpbmR6ekBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvb3BwL2Nv
cmUuYyAgICAgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgaW5jbHVkZS9saW51eC9wbV9vcHAuaCB8ICA5ICsrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNTkgaW5zZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4
QGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
