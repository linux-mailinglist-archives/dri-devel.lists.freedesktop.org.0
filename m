Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F85906A92
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 12:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4317D10EA3C;
	Thu, 13 Jun 2024 10:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qN5pE7PO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B02B10EA2A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:59:01 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ca342d6f3so401847e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 03:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718276339; x=1718881139; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GdMheYL4eDZSZ21VkAAyZuAzzByVJFYRugujvAtsxtw=;
 b=qN5pE7POl47CybW8CdrIONnhor+AclJErP9hdwKInmOH69275KW5mSzFg+Ql7nASQo
 nOCiCyajaQdzyLE8SRSkxx4WkfZnxhfyr7aXvCoktxv9peSnjb2CklKl4RVOSYptaqR3
 aK6J00/ynqdz/zStyc2BQ2frf7bQKaXyc71pB9WMmoIdhKW9mhUmXoLG6ZvQ9w5nL2ir
 2VNAIEgZbzy63MPBxGFyo3sGlghSSbBAkmxRjDDymC9QkJVGI4+vAegzhlDvwSeewPwU
 rlbZM0gJJzG1cBPJzGcEheIsJvAap4K515OVWx3DAQgN6yQ+wlv8j2lO7OryKW/pkp3V
 qoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718276339; x=1718881139;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdMheYL4eDZSZ21VkAAyZuAzzByVJFYRugujvAtsxtw=;
 b=Zf7EhnHU6Wvn5h4ZAB+U+iNT6jPklRmv7+RPkhPka5VXjSl75NG28n1J0bVd7I+nyD
 O10awCWTDSajzTg61dKqRPDrzyjAdhM0fmnP4Dq9lbNGrbfvl4E+eMWgawQmgPPguRL0
 /YRLlZzSODYTsEP6uSxD37ok66aMoDUMcc51xME00pQ65LkZxzbmF6iWT5OJyD3vrveP
 yZX6pRLOzg5E6ghKFRSZanaZLuZwQeCKnfOZflHqarekwD60y3AG69nfroY4APNEzYMv
 UMd8HR9Q/IAYV1r+InJU+K5u+0YPKh/DFuYN2Q89YYEosuDMJ+N8lr6vtUpdzJMiKOX7
 VpGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzhT5R5PAdhM35rbnMJMuxnUFSEEO/zfbcbJRyDSBx5Dy1J3MzQ+TFQfrwoVfC6bu9hpTuBjsExjXnHnCaHQOA6ikmvqLt5t9cq7gbI8UY
X-Gm-Message-State: AOJu0YxbFDjuUmP0XeDqFXYz6CH00vjVtxAFpmtF3pyQORbmJRNsCCfJ
 zaJNbyUCGBYoXGyIzBs8mEytAimcCA1no+0viwJKRusOl49lwNhqSOVx7Lp4tnY=
X-Google-Smtp-Source: AGHT+IGGLdeUx6A7U2uX20AfOcBcp1HDV4WdbdReh6DQ5eJV29Id75mx/A2T1O3GKHI1l9zuUwCU3w==
X-Received: by 2002:a05:6512:33ce:b0:52c:9846:3b8c with SMTP id
 2adb3069b0e04-52c9a3dfccfmr3729925e87.41.1718276339194; 
 Thu, 13 Jun 2024 03:58:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2871f71sm161940e87.121.2024.06.13.03.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 03:58:58 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:58:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v2] drm/bridge: simple-bridge: Add support for TI TDP158
Message-ID: <65sn6tvrnhsrctrjrx55kw64lr5mmxgkmvinoyndbhqtikmekk@xrbd5x35ta3k>
References: <b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr>
 <ddd5joylbkovcdogfwhvzaepd3d6wxsnccgvpq2x3h6fmpo2hk@2sitzl6bjt7d>
 <57959aeb-20c2-4283-b316-c4ae5397177c@freebox.fr>
 <rdptet6pxdr3cmulrux24tevnlejgblnl5byjb2ypo7fm6tjn3@e4l6qdbr74ss>
 <a18a165c-0635-49a8-8036-9967304fd019@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a18a165c-0635-49a8-8036-9967304fd019@freebox.fr>
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

On Thu, Jun 13, 2024 at 12:29:26PM +0200, Marc Gonzalez wrote:
> On 13/06/2024 12:26, Dmitry Baryshkov wrote:
> 
> > On Thu, Jun 13, 2024 at 04:12:22AM +0200, Marc Gonzalez wrote:
> >
> >> On 28/05/2024 03:13, Dmitry Baryshkov wrote:
> >>
> >>> Bindings please. Also, note that per the datasheet the bridge uses two
> >>> supplies, Vcc for 3.3V and Vdd for 1.1V, so it doesn't fully fit the
> >>> simple-bridge.c (which might need to be adjusted for the second supply).
> >>> Chapter 7.3.2 of the datasheet points out that Vcc should be brought up
> >>> before Vdd.
> >>
> >> Is something simple like below acceptable?
> > 
> > Note, I'd really suggest extending simple-bridge.c instead to handle the
> > second regulator.
> 
> I'm confused.
> 
> simple-bridge.c is not "I2C-aware" ?
> 
> Both you and Maxime mentioned there should be some I2C handling?

Ah, true. Well. you can add second driver to the simple-bridge.c, while
sharing all the internal data.

-- 
With best wishes
Dmitry
