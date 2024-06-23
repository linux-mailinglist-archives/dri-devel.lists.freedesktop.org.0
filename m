Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB086913E6B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 23:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F2F10E31F;
	Sun, 23 Jun 2024 21:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tjZMabi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020010E31C
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 21:11:14 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so45959651fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719177072; x=1719781872; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ByUUhCwfU2MDkfN+tsDGtjdI+tw+lqDmSUekMY87cx0=;
 b=tjZMabi9PIBLWEaDZBC+ha3gJTsge00dSsCq2f8NOt2VyXCtgywak2HJoK249u8Usw
 KnbnvZWu02+e8sSlGwb25vxOazFHcq3wLGCKn5PqS+/hLxe9QzSv7BFScuz9WU6jmjeK
 vCozUw3r0jGe2t0dEjwvhWH9GQRHs/Jec5IbwpsKgH5n8L1J0cquTOZdGQLdjScJAR71
 PaePhGiGksozbaF+eQxcmR8ltRwr0eRqyd6meOU42JWf3hgDd+2dg/i5N0M9QQvah6l6
 Dih2aWm8A4zbXhnrLdKTC0OezF1XhD1aNh9FBLQ1EEl20IkZ8hXjrV5ccfXn6dh5S2FS
 cfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719177072; x=1719781872;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByUUhCwfU2MDkfN+tsDGtjdI+tw+lqDmSUekMY87cx0=;
 b=cERh3y0ghkQumFxgTtR127BKE14mmkW4pRcwI6nE5rhvWw64cqcjC3M64/5Ec0h6RD
 DQxkMIDtmV13YZPllCffkmCghWctuyVtkBD1jf19PBhCSge8d7erAKtmSD11PGrH7JjX
 EePLfzuizcfPhveX6KnMOviHv0QfGWjH2oSHfb2slE8C8ldxSCzNosAzjjK16/9R1kOl
 gMFrTxUu+i6hMkcWytVfEhKTrrFJFGBGTFZXMZQyfAy072Bvkn1K5b5SeuWhJqfiHjqW
 EH5htzSmRTjwo0vorxSuk4qfppK9BqroA5rXeW5l5YsvUxvxqCcp14OOmRM+UmdJCMoy
 t0Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+EH46pjVtQJGMoXUf5dK7iZv/3VdNNm4M3Vgf6YpEkDdzWTE7CQpRcVOyMBwoOqyNnsIjc+LoUjqnrfYGbcZ+TH5XNqHijCVIUDH289Hl
X-Gm-Message-State: AOJu0YyzGJPsy4RtH8Sr9uYqYHkkT/vO3RpRlUxpXgWIraI8F2TEpa0s
 e48lM1YjwN4rYkilEWjjzWlr0oCHCf5OxVIJojfMyHtzkH7SupwA2UsONMT2vLA=
X-Google-Smtp-Source: AGHT+IEaaLlfXAyaLl1Y4kuJEtYqkzCxQXOHpE49n+OtSlW6/0hqnpQnYKiS/rm6UCOFGOmz2RVcYQ==
X-Received: by 2002:a2e:854f:0:b0:2ec:49b5:50d5 with SMTP id
 38308e7fff4ca-2ec5b357a00mr20958641fa.41.1719177072228; 
 Sun, 23 Jun 2024 14:11:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4db2ad8bsm8094331fa.85.2024.06.23.14.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 14:11:11 -0700 (PDT)
Date: Mon, 24 Jun 2024 00:11:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "hjc@rock-chips.com" <hjc@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Shengyang Chen <shengyang.chen@starfivetech.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 10/10] drm/vs: add simple dsi encoder
Message-ID: <b7cgvgh3uphpa3byf3bdl5i4fr64zzuagxg5txuwx7woy56dkt@uhclfjtzejfc>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-11-keith.zhao@starfivetech.com>
 <cej2d72e6bacbjabyjecoqhjlhz4sxx4bgn2w43rgl3cfyyuwt@jq5kq4egj2wo>
 <NTZPR01MB1050AA3ABA20F736B1756E04EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NTZPR01MB1050AA3ABA20F736B1756E04EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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

On Sun, Jun 23, 2024 at 07:17:09AM GMT, Keith Zhao wrote:
> Hi Dmitry:
> 
> > On Tue, May 21, 2024 at 06:58:17PM +0800, keith wrote:

> > > +								  "starfive,syscon",
> > > +								  2, args);
> > > +
> > > +	if (IS_ERR(simple->dss_regmap)) {
> > > +		return dev_err_probe(dev, PTR_ERR(simple->dss_regmap),
> > > +				     "getting the regmap failed\n");
> > > +	}
> > > +
> > > +	simple->offset = args[0];
> > > +	simple->mask = args[1];
> > 
> > Is the value that you've read platform dependent or use case dependent?
> > What is the actual value being written? Why are you using syscon for it?
> 
> The syscon is used to select crtcs binded with encoder,
> If this encoder binds to crtc0 , set the syscon reg bit0 = 1
> If this encoder binds to crtc1 , set the syscon reg bit1 = 1 (0x2)
> Maybe I can do this by the possible_crtc instead of using args from dts

If this is a constant between your platforms, it should not be a part of
DT.

> 
> 
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void vs_encoder_atomic_enable(struct drm_encoder *encoder,
> > > +struct drm_atomic_state *state) {
> > > +	struct vs_simple_encoder *simple = to_simple_encoder(encoder);
> > > +
> > > +	regmap_update_bits(simple->dss_regmap, simple->offset, simple->mask,
> > > +simple->mask);
> > 
> > 
> > A purist in me would ask to have separate mask and value to write.
> Understand , will avoid this action 
> > 
> > > +}
> > 
> > Is it necessary to clear those bits when stopping the stream?
> No need to do this , if clear those bits , the encoder will point to a unknown crtc

what are the consequences? Is it desirable or not?

-- 
With best wishes
Dmitry
