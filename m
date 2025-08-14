Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7DBB269EB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB1F10E206;
	Thu, 14 Aug 2025 14:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w0bmz1gv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30CF10E206
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:47:32 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45a1b0c82eeso7041875e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755182851; x=1755787651; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fZAqDF3XnpGXDPLOHIJz9Ec4YzJw9DgnDjI6cQZHRtQ=;
 b=w0bmz1gv9PfmBwiQPey1gtLkXIeN95eDsjV+FqkjuKrfdVqNCvQFHxvflttn8Z8Vsa
 Qr6KLQaJycjWT4cKCs6Pn9dUFGd3Yxb4pW15U0VM67IdHTzt3ROBPCQGR0khiU2Ct1wX
 zUjCDRKlvn0OI0lzPOOwo9YZF7j8TfsHgj1XR/dXflKd28915yVOUs5C3pgZXKQC2k8J
 Mkj8v3i/BDWYJ1y4LZQLA1F9X60Saxw2KV7kepOA3lW4kn6fCw06re71x0bZqYWfmLUb
 8vNFAjqDJxGLqw2yuKJlF2aXhmU9ZR1D36n47+/M2J4Cwka+Losom5hjaz8a5aYsunil
 IvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755182851; x=1755787651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZAqDF3XnpGXDPLOHIJz9Ec4YzJw9DgnDjI6cQZHRtQ=;
 b=IsAs38NK6p/akeBbecAKk3ZqW20qveVKyv+MWsAtwzTwjFBhrwQmw5nwyIxLWEXdPh
 yY0/cy6aoHxlJT5/+1t0Eop+lC7oFKv6qB08ChB1wUsAO8k/V/yK5BhkBlhgmzfUH5wH
 FogSUMe8W/sDNVHv4S/+PzsZXRshSC/OIMCoPws406bNUHpLc4gUpULftlLwWLQHL6rj
 xBatJEfEWZrBJ3ythAIgG2kqp2nQ47XDLkY00JmJbTuzqQEVw7OiSZqUHYJRlMtZuON9
 +/O3GNTYV7idxTyugwc9JOKCWf+Q2OpssVlVOFRnS4ZSNMf3NrWSfoefiddYTpr2S+/C
 J7mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4BfLrnSd960+A7RK4AMt2Exat6OB7x6R7QHifuz6BS1qsKYeJjwMh04UX/dcJAP98acw4/d960A4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBQzoLAtNFC2wML1x16IH8JrByk75VcUJMJyKzwDuRuTnMxx26
 6HRI7MXXEnIUSWhNjCNlz/GwENA0Th70GBWf147sd2zRVfE8K+3WXyDtdyMgyHhO2/8=
X-Gm-Gg: ASbGncuj9gfiN3W3c9Fv71ylM4EH5Fud9/LTl3JE0nyO/Zi7l1SKqzBsQpm6vtzs3/m
 iWymKMRZVed1qIfcQHodepAnsWY99w2cU8xyM31SB6+KM5QraDFFnZpu18JXgiiiEttpXP7OC3T
 dssqtfFl5TSd+gThxNXwTUjzacYCi4sBe+qfNgJ2gJJZmoBKuIFiSS4TIzfiYQO/RZLK1CQfi8S
 3vz1YrgkeIdM4h+PA0zxmlqF0w/CXWOYj3WiDftVP/IL09/HYq4mxjRSsLPnJl5wxPA5VMlMwBt
 ZypgbgcgzI5+HqN2eL17rUw9AEr7tfCxsOjgEu3IdDyXm8GmS4zbXv3xutq57w1wuFWF4wNSxzi
 6KWV4Azmd9f2x1apvbznOZuS8+VIIbBVP
X-Google-Smtp-Source: AGHT+IFhoWtHYN9QFJ0tW1CKBLQo56CkK5ldL2L/K77pZLZH70ja4pUfhvkjKDkzC2VxincZw5xstA==
X-Received: by 2002:a05:600c:3b87:b0:456:2a9:f815 with SMTP id
 5b1f17b1804b1-45a1b615307mr29980105e9.4.1755182851303; 
 Thu, 14 Aug 2025 07:47:31 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:1e8b:1779:ed5:b6f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c74ad27sm25133535e9.18.2025.08.14.07.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 07:47:30 -0700 (PDT)
Date: Thu, 14 Aug 2025 16:47:25 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
Message-ID: <aJ325wUrBjydnc1m@linaro.org>
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
 <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
 <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
 <CACr-zFCq08Pu2=eLfe5=sYdGWEHmy7w+=Eo++9AjP96uCLCNcQ@mail.gmail.com>
 <536dd237-e668-4a88-ac2b-3bc88dca8a3e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536dd237-e668-4a88-ac2b-3bc88dca8a3e@linaro.org>
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

On Thu, Aug 14, 2025 at 04:21:09PM +0200, Neil Armstrong wrote:
> On 09/08/2025 00:28, Christopher Obbard wrote:
> > On Mon, 4 Aug 2025 at 14:13, Johan Hovold <johan@kernel.org> wrote:
> > > 
> > > On Thu, Jul 31, 2025 at 09:51:26PM +0100, Christopher Obbard wrote:
> > > > The eDP controller has an HPD GPIO. Describe it in the device tree
> > > > for the generic T14s model, as the HPD GPIO is used in both the
> > > > OLED and LCD models which inherit this device tree.
> > > 
> > > > @@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
> > > >                        gpio-ranges = <&tlmm 0 0 239>;
> > > >                        wakeup-parent = <&pdc>;
> > > > 
> > > > +                     edp_hpd_active: edp-hpd-active-state {
> > > 
> > > The node name and label needs an index as this SoC has two edp hpd pins
> > > as I already pointed out.
> > 
> > Sure. After looking at the schematics this should be called
> > edp0_hpd_active. I will fix this in the next revision.
> > 
> > 
> > > > +                             pins = "gpio119";
> > > > +                             function = "edp0_hot";
> > > 
> > > And you also need to configure the bias somewhere as you should not rely
> > > on the firmware having configured things for you (as I also pointed out
> > > before).
> > > 
> > > On my T14s the internal pull-up has been disabled.
> > 
> > I am still unsure of what else needs to be set here. Can you help me
> > with the correct settings?
> 
> Just add bias-disable;
> 

I sent a patch fixing this for all the X1 devices upstream earlier [1],
so you could also just send v7 with just the second patch of your
series.

The bias-disable is really somewhat device-specific (what if there is no
pull down on the device side and someone disconnects the panel
entirely?), so I put it into each board DT separately like Johan
requested on v5. We have the same for the PCIe pinctrl.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org/T/
