Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773995F8EE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 20:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456E010E281;
	Mon, 26 Aug 2024 18:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="htD3buhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B1510E281
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 18:28:24 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724696896; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C6THzlhv9WAt7UFlgrShq2UZuL6caw7uhlDNqAdIte4dzK7HOZshr2PLGC3Ec99ZcYj+01+awrsAU7zjr132iE9jSN00Pxoo7P7YMmYVpXwdfww/jjCduWCuSLrTOc4oYbjaczppGRxK/GBgHq1ZZpliTRy4ogmL3A6wv9B02Ws=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724696896;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=AtqnBqpa9UzhLTndpZmzFs2sALtGroOJRRcTDXcxiaM=; 
 b=W7YBsWqkfx6gpAWMPvZdrbntbjcqweW/WyJ60FVRMUWwZQD2w9NLoFdcINgjgX6G4aTGFx+S+yk2sUU7juorYzLQwF+UWwdyNAMSGcA2iEb9LzVD9g5HO6fH8AAf05ru4L+mYdeSBmQL8OgGtNDJNdHkIL+/U1UihTE46QVJPlA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724696896; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=AtqnBqpa9UzhLTndpZmzFs2sALtGroOJRRcTDXcxiaM=;
 b=htD3buhABCdWbrTH+l3rKvCJU+ZLGqYQ6EpT0KVU9bvPTvIXBceWDFtWg4XsWV7W
 P76OhTJJ2O+Z3h54GG9Vxw4BoGL80kf8w2YNjK8z2Pd5p7wnz4D6LiufP3SGwjAHcX3
 6/uVY3XcPyH5V420WdKEhlvtnr1/m/Bp9bxgZUcg=
Received: by mx.zohomail.com with SMTPS id 17246968937020.26691709516398987;
 Mon, 26 Aug 2024 11:28:13 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: airlied@gmail.com, alchark@gmail.com, amadeus@jmu.edu.cn,
 andi.shyti@kernel.org, andyshrk@163.com, broonie@kernel.org,
 cl@rock-chips.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dsimic@manjaro.org, efectn@protonmail.com, finley.xiao@rock-chips.com,
 gregkh@linuxfoundation.org, heiko@sntech.de, honyuenkwun@gmail.com,
 jagan@edgeble.ai, jamie@jamieiles.com, jic23@kernel.org,
 jirislaby@kernel.org, jonas@kwiboo.se, jszhang@kernel.org,
 kernel@collabora.com, krzk+dt@kernel.org, lars@metafoo.de, lee@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net,
 maarten.lankhorst@linux.intel.com, macromorgan@hotmail.com, megi@xff.cz,
 michael.riesch@wolfvision.net, mripard@kernel.org, robh@kernel.org,
 tim@feathertop.org, tzimmermann@suse.de, ulf.hansson@linaro.org,
 wim@linux-watchdog.org
Subject: Re: [PATCH v2 11/12] arm64: dts: rockchip: Add rk3576 SoC base DT
Date: Mon, 26 Aug 2024 14:28:09 -0400
Message-ID: <22403959.EfDdHjke4D@bootstrap>
In-Reply-To: <20240825140824.200453-1-amadeus@jmu.edu.cn>
References: <23624422.6Emhk5qWAg@trenzalore>
 <20240825140824.200453-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
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

On Sunday, 25 August 2024 10:08:24 EDT Chukun Pan wrote:
> Hi,
> 
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > ...
> > +		opp-1416000000 {
> > +			opp-hz = /bits/ 64 <1416000000>;
> > +			opp-microvolt = <725000 725000 950000>;
> > +			opp-microvolt-L1 = <712500 712500 950000>;
> > +			opp-microvolt-L2 = <700000 700000 950000>;
> > +			opp-microvolt-L3 = <700000 700000 950000>;
> > +			opp-microvolt-L4 = <700000 700000 950000>;
> > +			opp-microvolt-L5 = <700000 700000 950000>;
> > +			clock-latency-ns = <40000>;
> > +		};
> > ...
> 
> I'm curious if these frequencies work properly. On the bsp kernel,
> 'opp-microvolt-L<name>' is used by the PVTM driver, I don't know
> if it works on the upstream kernel. Sorry but have you tested it
> with mhz (https://github.com/wtarreau/mhz)?

Running mhz gives me:
# ./mhz
count=566627 us50=19994 us250=99977 diff=79983 cpu_MHz=1416.869

Which seems to correspond to the set opp-hz value. As mentionned by Alexey, 
the opp-microvolt-L.* values are not used by the driver.

I also have not tested any cpufreq settings/driver on this board yet. I can 
remove the opp-microvolt-L.* for now.

Detlev.


