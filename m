Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC3C167BCA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC366F418;
	Fri, 21 Feb 2020 11:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D296EE36
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:19:05 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 7so2383671lfz.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lebedev-lt.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BMudXWRavzU8ncImx/aSRyw9UQtZ0RxHFgnxmYTgr/o=;
 b=Xj26QZhSq3ROB90ZKv65EPbntTSjJUf3ya+rYi7+K0z+zCwE2HDMhX6XR2ngsFAHrk
 WqseTzGt6xHvQJvJmqulNHCpJczepO4PqkrxTfihTZO2iq5t0TofG1ZTnI4uoRA7ufvL
 qskk6GiWl9zsd3upI1+AWYLf1LoNDh+dEFxaEfWRQuYAl7dYFxZN46AOnn2OtFxwXt+g
 5CbB0cbMdLH72cWILlpauiaDrf7+0Zk+frFtn8HCuzccfS1fxF5bKeLitpE7V23PVtEF
 BWNTIpUXt8oEvVgKoMo1Ycii4G0XS7B9lo4Wl/9WHMu9xDvuroOt5XWmNBsN7kEsIwsy
 763A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BMudXWRavzU8ncImx/aSRyw9UQtZ0RxHFgnxmYTgr/o=;
 b=kQrnKPcGK90LB2jftmX/GxE/3QljAHd+s2Q8F+GBD/pXf9KR91N/vMn+7uaKZcRsJ/
 JsGRECJNLtbF6Voo7cGdSxt4L2VVCXI0oluLJoOc6pzd9GbUI4dlPzqH/DIld3VLhxOh
 Ml1Q+66hvsJQ8qdBBOob/8BYf/bsIJmX1tPvfgeW5cicHpGtHv4K/9hDz/wlVM+0SLzm
 3f6Qpz9H45EegiTOAYg+qCzvYHE1nFQonqxsTQChAShlF2cdy9Q4xdrzjILqk8QsNC32
 1faVo6fwlzo9MORZtk+mUcnJ3t4/R7/n/r8G2OfTEMWPFJDq+lNvPxMnfM1QcGwmEtDw
 3W6Q==
X-Gm-Message-State: APjAAAXYyiN866OCjcyLQdL4DIedD03jW/JALBRcbfRpGqWqVM/y6sAR
 /E5XUBCSM6WTjldHKm7QKHi33g==
X-Google-Smtp-Source: APXvYqwHMD7TjvA9qSHLAjro81EJY6e+tgA6JElGztVdIMsefhnoFuMqmbeC+l1pV9gnkOJ6fpFbKQ==
X-Received: by 2002:a19:97:: with SMTP id 145mr16976846lfa.98.1582222743500;
 Thu, 20 Feb 2020 10:19:03 -0800 (PST)
Received: from [192.168.1.108] ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id m21sm156300lfb.59.2020.02.20.10.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 10:19:02 -0800 (PST)
Subject: Re: [PATCH 1/5] drm/sun4i: tcon: Introduce LVDS setup routine setting
To: Maxime Ripard <maxime@cerno.tech>,
 Andrey Lebedev <andrey.lebedev@gmail.com>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
 <20200219180858.4806-2-andrey.lebedev@gmail.com>
 <20200220172154.22gw55s2mzyr45tj@gilmour.lan>
From: Andrey Lebedev <andrey@lebedev.lt>
Message-ID: <1002d964-28c9-ed69-64fe-6527418092bb@lebedev.lt>
Date: Thu, 20 Feb 2020 20:19:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220172154.22gw55s2mzyr45tj@gilmour.lan>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/20/20 7:21 PM, Maxime Ripard wrote:
>> +	regmap_write_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
>> +			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(0xf),
>> +			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
>> +
>> +}
>> +
> There's an extra blank line here that was reported by checkpatch. I've
> fixed it up while applying.

Weird, checkpatch didn't warn me about that:

./scripts/checkpatch.pl 
patches/0001-drm-sun4i-tcon-Introduce-LVDS-setup-routine-setting.patch
total: 0 errors, 0 warnings, 103 lines checked

patches/0001-drm-sun4i-tcon-Introduce-LVDS-setup-routine-setting.patch 
has no obvious style problems and is ready for submission.

In any case, thanks for correcting it!

-- 
Andrey Lebedev aka -.- . -.. -.. . .-.
Software engineer
Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
