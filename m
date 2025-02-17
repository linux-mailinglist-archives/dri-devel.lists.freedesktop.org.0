Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC8A38B13
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 19:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E60710E585;
	Mon, 17 Feb 2025 18:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w2L3MlWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99A410E585
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 18:10:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso31843905e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739815858; x=1740420658;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
 b=w2L3MlWZFQ+RN05zR9I9cnO3ds6j6J3kWcprTbcWtiR7k+hCMkJk19Xo1wlE4b/B0U
 D+sLxRNhdT5Lc1LzRKRF1ETZAQvUVC7MvTQmHU8RbwHyCaP9C0Lt6tmSlfL15HJAUMhY
 W+iBSCThDLbcxyniFFPKWIveqfT0tgUeGpfb44kZsr7hvJJTbwQiIOAzpuUiYECF7MMv
 hiE3bSPUkfo4xU09AGjIiodwSEA5O4uBEHpQZDwTGS3r8rS1kCoPIkljwvXe92Za3sJj
 /QAIOZQLXHnXsbXAwYJ8SrNE2AyiY62DA3m7qti47ucmV8O4doCAZKhVOpmngxeeCwe0
 ODag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739815858; x=1740420658;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
 b=Y9aI1oL6ph+vPQ/uSs9TtWgialyiSzMTT+d4bK6lPzJn2aIrFBxxU01ljaLXDAExvC
 nzwDTJcV+wWxroGDsx5uCPE9JxR2G6I63dmEMenOoKkX/fwgJNjj1UTefBw/NaqlEewl
 omqlEf04pypwLy9JD9LpadxWHyF2pCK82QTcn7CqQcg7/sAld1bzDvoWe7+SAZKJj+Ct
 1fvB0X9C4x5TnMtHyFXhAD/HWi0FB9vUxm/UpwzgmO337LPRCj9ClMhxu7jZ/4zDq10U
 HWxrkyNnyi1ATnYJdJOX7a/LRPafTq3cft9S5a37ZRQ1r20fjoH0QQu395XoY8xEBixR
 Ig3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIwIIvIZRrH/KDaqCSRd3LXkRNDH9y8yd/U6jJdGOjUn+K+Y3EhBfyIppuyiHZBHcJYHB6Lc/MLGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPLwTE0EH5mDd28AFeb8UeVDjk8/QwLZI7R4SPA3FnIrTpk+ST
 8PGv5ORujwzfgNY+ltgMaQp+aeabpiKLI/S2e1n7UyE6ludceuBglpd/uGVTP+E=
X-Gm-Gg: ASbGnctiOLJx80torMKcARQm8BdmymgGNbWAeDIsFsY2RCk/ihj0G0mXCsMfMjsS1n0
 +3CbZfKUehXrULV3SfixhzFYp1mz/rJsVVmiC4EE0zBaDtRp43dcUXBal70aKkmZwYvG77z0V2m
 8WjJSvgHZDgXUNb5WblT32Z8uFXEP8AKV7Fp2aBuEro+IYJ9nlHlmadKczR8wS7y92DSm2afrlg
 032mEgcJpBaXmCb9djuKY15rE55zkSor4+U2EZ7BtbkSFGVMqeymAElOBsmR1gu5nsQ7EqelTF1
 FClaYTeOxbpa2w==
X-Google-Smtp-Source: AGHT+IFTAKZ9BquOVY29sEYMChLDnuqHcqVlSqR4NiZlMjD4bUMe9qRI5EU9r/6iyIf02WCX+Y2KzA==
X-Received: by 2002:a5d:4cca:0:b0:38a:2b34:e13e with SMTP id
 ffacd0b85a97d-38f33f28c01mr7768806f8f.18.1739815856721; 
 Mon, 17 Feb 2025 10:10:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a529:8667:e9bd:7f7])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4395afaf052sm155075695e9.13.2025.02.17.10.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 10:10:55 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021501-tamer-sank-142a@gregkh> (Greg Kroah-Hartman's message
 of "Sat, 15 Feb 2025 07:53:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
 <2025021437-washout-stonewall-d13e@gregkh>
 <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
 <2025021501-tamer-sank-142a@gregkh>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 17 Feb 2025 19:10:54 +0100
Message-ID: <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sat 15 Feb 2025 at 07:53, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

[...]

>> 
>> >
>> >> +							int id)
>> >> +{
>> >> +	struct auxiliary_device *auxdev;
>> >> +	int ret;
>> >> +
>> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
>> >> +	if (!auxdev)
>> >> +		return ERR_PTR(-ENOMEM);
>> >
>> > Ick, who cares what the error value really is?  Why not just do NULL or
>> > a valid pointer?  That makes the caller much simpler to handle, right?
>> >
>> 
>> Sure why not

I have tried the 'NULL or valid' approach. In the consumers,
which mostly return an integer from their various init function, I got
this weird to come up with one from NULL. EINVAL, ENOMEM, etc ... can't
really pick one.

It is actually easier to pass something along.

>> 
>> >> +
>> >> +	auxdev->id = id;
>> >> +	auxdev->name = devname;
>> >> +	auxdev->dev.parent = dev;
>> >> +	auxdev->dev.platform_data = platform_data;
>> >> +	auxdev->dev.release = auxiliary_device_release;
>> >> +	device_set_of_node_from_dev(&auxdev->dev, dev);
>> >> +
>> >> +	ret = auxiliary_device_init(auxdev);
>> >
>> > Only way this will fail is if you forgot to set parent or a valid name.
>> > So why not check for devname being non-NULL above this?
>> 
>> If auxiliary_device_init() ever changes it would be easy to forget to
>> update that and lead to something nasty to debug, don't you think ?
>
> Yes, this is being more defensive, I take back my objection, thanks.
>
>> >> +	if (ret) {
>> >> +		kfree(auxdev);
>> >> +		return ERR_PTR(ret);
>> >> +	}
>> >> +
>> >> +	ret = __auxiliary_device_add(auxdev, modname);
>> >> +	if (ret) {
>> >> +		/*
>> >> +		 * NOTE: It may look odd but auxdev should not be freed
>> >> +		 * here. auxiliary_device_uninit() calls device_put()
>> >> +		 * which call the device release function, freeing auxdev.
>> >> +		 */
>> >> +		auxiliary_device_uninit(auxdev);
>> >
>> > Yes it is odd, are you SURE you should be calling device_del() on the
>> > device if this fails?  auxiliary_device_uninit(), makes sense so why not
>> > just call that here?
>> 
>> I'm confused ... I am call auxiliary_device_uninit() here. What do you
>> mean ? 
>
> Oh wow, I got this wrong, sorry, I was thinking you were calling
> auxiliary_device_destroy().  Nevermind, ugh, it was a long day...
>

No worries

> thanks,
>
> greg k-h

-- 
Jerome
