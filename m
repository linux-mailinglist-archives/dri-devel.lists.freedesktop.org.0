Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D59B8E22
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 10:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9CA10E199;
	Fri,  1 Nov 2024 09:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eS+vXapU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6954710E199
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 09:49:06 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539f76a6f0dso1683410e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730454544; x=1731059344; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Uxb5qd1QDIPM/jSC0SzZPLDKW9qNuQz8ACVJ5xEQ9Og=;
 b=eS+vXapUoMm/pNjdGQigKXlfGMywc4LeR2miS0R7vkJQzI9dwFezc9krv58qqBzfrl
 TTNnKfY0o5R7P5ChhO6JC9GHcq6s3MtYYOWHLZigxxI1nnyM0y1IMNAsFgTsA9ox8+E1
 2A+PO8yjWxszQvR1mIlf0/1mDgKuu3bRxqdgMSnURn+ai9nrqZXjm9iX++TlKhEfwM+o
 X7OM2NSXXDbWmxmnb/WJoIWsaEAXDf0Hkaq5HeqolxTl7cODWuIqFkE1mQJSDAUcqTH7
 clZjeIhk4AFkbi82H9MLWGVAgFkLyeDVwpf3j8Qj0HEVJdI4XsMk8TqbVhgo6Dv+QNal
 SctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730454544; x=1731059344;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uxb5qd1QDIPM/jSC0SzZPLDKW9qNuQz8ACVJ5xEQ9Og=;
 b=XyBqw3SYjb7avYJjlF4tFK81fiwwgklkipV+JipatxNGgHDB/Xj0mvyD8+kKxBjIux
 mOf4wgSoh2jff1k/AiJzK2UZEjq0Tmr2w0m1zkuQVYt2En3+rUfHNWcOZnbxWvKQRRcz
 ymoSsEvH5okzkCTGSPABp0tAqV+6ioyqRBZPAmU9mSdn6bpXF4enjHw1AOG6avWtUbFQ
 yZFuJN/Uz+HZ8HYnzpggnIABqERUm0Lf5I5PZ+bzFppmOV4zcpWewA/iZRRhZo8SAj8w
 wdCe/3YF9T0j0Dxonqp4p5OcZadCgxj1Rcbrxom4zJA/yvrG3SEDKeZ9t5D9qgiKg/jp
 SS/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9C4EhNeSqANq1KEnVFZcmQJsbYT8zn0uE+etyzsI2nk+GYd8CLvla2pdwjUxwnyJ3U33E2PIhO7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXtxw4qX0m1eLTaFVWIXl3gl3sCKDiAsZlveYcdJm+cV1CtkwA
 QaDGZivf+vt6dnVjXagZyQlHXoSICswqteDXf1ejizvuvO2j8zhHoyUv8I0MeOU=
X-Google-Smtp-Source: AGHT+IFGmepb6pA/PhrFcsbK2sdy+T0CJMGpY3jWydPFArJbEEtCdrMr7FwLdSZhf8F/ntpQCdyxSQ==
X-Received: by 2002:a05:6512:3195:b0:539:e023:8fce with SMTP id
 2adb3069b0e04-53c79e15984mr3059817e87.12.1730454544173; 
 Fri, 01 Nov 2024 02:49:04 -0700 (PDT)
Received: from linaro.org ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5bf447sm53365025e9.13.2024.11.01.02.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 02:49:03 -0700 (PDT)
Date: Fri, 1 Nov 2024 11:49:02 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <ZySkDgijDebz+6BA@linaro.org>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <ZxYBa11Ig_HHQngV@hovoldconsulting.com>
 <ZyOOwEPB9NLNtL4N@hovoldconsulting.com>
 <ZyOsuTr4XBU3ogRx@linaro.org>
 <ZyOxX31QV2GA8Ef8@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyOxX31QV2GA8Ef8@hovoldconsulting.com>
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

On 24-10-31 17:33:35, Johan Hovold wrote:
> On Thu, Oct 31, 2024 at 06:13:45PM +0200, Abel Vesa wrote:
> > On 24-10-31 15:05:52, Johan Hovold wrote:
> > > On Mon, Oct 21, 2024 at 09:23:24AM +0200, Johan Hovold wrote:
> > > > On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:
> 
> > > > > Cc: stable@vger.kernel.org      # 6.8
> > 
> > > > I assume there are no existing devicetrees that need this since then we
> > > > would have heard about it sooner. Do we still need to backport it?
> > 
> > None of the DTs I managed to scan seem to have this problem.
> > 
> > Maybe backporting it is not worth it then.
> 
> Thanks for confirming. Which (new) driver and DT are you seeing this
> with?

The Parade PS8830 retimer and its DT node. The v3 of that patchset
will not trigger it unless the pinctrl properties are being added to the
retimer node.

> 
> > > > When exactly are you hitting this?
> > 
> > Here is one of the examples.
> > 
> > [    5.768283] x1e80100-tlmm f100000.pinctrl: error -EINVAL: pin-185 (aux_bridge.aux_bridge.3)
> > [    5.768289] x1e80100-tlmm f100000.pinctrl: error -EINVAL: could not request pin 185 (GPIO_185) from group gpio185 on device f100000.pinctrl
> > [    5.768293] aux_bridge.aux_bridge aux_bridge.aux_bridge.3: Error applying setting, reverse things back
> 
> I meant with which driver and DT you hit this with.
> 
> > > Abel, even if Neil decided to give me the finger here, please answer the
> > > above so that it's recorded in the archives at least.
> 
> > Sorry for not replying in time before the patch was merge.
> 
> That's not your fault.
> 
> Johan
> 
