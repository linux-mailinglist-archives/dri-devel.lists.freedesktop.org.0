Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CDCC14B4C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7604910E3CB;
	Tue, 28 Oct 2025 12:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dLHzmAVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42C010E3CB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:51:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso74369185e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761655877; x=1762260677;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a2I4ejkEHJFUuiRyo4e3fbDozENBl6FYPGmLOAYLdDw=;
 b=dLHzmAVje6+5VCYd2kbn+DxcejRM8ldhdTw/Xo1arWDXH1oWuVakdJWpXy1W+x2UfV
 wuEifKOr1uQ4f2QAuf3l5lVxXms4tzTxEbjpROxTHENNDik/O/wJIWJFGfZXjCQ7Rdwd
 17R3BGIBHho+s1Xfu1ZazNfN6gyBwn5YGr/fqgtBHiYfiGI08AC+izUzy/f0Vc+ovIDm
 /8JzXHGrsdAvVUWRmEHYWEOAt2CvBCmNSWv9o5H9BpCZvjlBVfdF5Swaqx0XgumHXKDR
 GJUS+9V0fRz52Z0E7r72KIloU8GV93b7k5/SH3FyRXQuUgwL40IcVdlrjNU2/rnlewlh
 rk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761655877; x=1762260677;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a2I4ejkEHJFUuiRyo4e3fbDozENBl6FYPGmLOAYLdDw=;
 b=v/DInjhpQrI+mlMxB2tmbHDJWByrRvGvHC0c7zn+OUCztNpoQ4cu3wVgrsoagVmBXU
 ZY/w6i2zwuxaDZLyxkC0/oRjVwJo6kt7EG7wcbZI07al+EroKgaq+C9J4t2P9SUO3IMY
 sM0ubMaDt/NqvLYdX0VTnJKoYT458C/7k16DeUvTJuO5yjdzLZQv4dRwuAlTrBgvAGba
 DLR/Jnot7OKTWIioCkbgBIHoFXbUsvWvT4MAnN5JjFZIuc+5t/6VOsiSOIdavf0+t3CC
 37adOvW6X+C9MNlXW1qyWmbW2kAeHL6xK1h1EAILF4WuYUhaVuqwWxtsUZRxtek/+DtA
 VgKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw/wiouZjENaywWDjNFL8I8WgM/miKb+XwyTGsUzXBEObVR8mTDPCp46dicL33N2e8lEaQoq8kBQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaaR01CdHr2GZBFmK8ioiX0eMCX33iBuVIyrL/QOg6OFsiFf/3
 qfAmDC4uDkwONB25w8IX1j6N7SrfstRkocixpTyEsX5AVjSOOGX8G9wV02G3YZbCQ0g=
X-Gm-Gg: ASbGncs0RGe84z/faQbuX+FUacWVBqCaCjg8LY2faAW+VglfATYMIRruQZz2JFQ1Z0N
 Uy3fqG5n0tgCFtIq0v9Xsd/F9iSgfFtHLTEHxA+h+12Pclik27P7cTRgSQHh6hV0ol0pmbEEMj3
 mlkdS4HsBHMK2CtSd/evjV+GH/cNmkBxdpW6ybT/R6Pxl1PtvNMdj0L5XU38kHhdfQWPRmf9AmE
 XwzWdTo2cKU09Qs1BSftPH8r4+b4c6ORGHFEsrhbJBjYux4knLL1fK944Zq9dvR7htbzMQW3MJ6
 Bx7ZrGa8yCUScXaB+OZ/uSpg1iQ/vN1nFyHz0eZzf5G18TqKBW/J8E0RxjHpPVQ/ElzKOabdBxi
 ckfHN8ibIbEMVndCoV16mP09F+PxA9xMmjYUdUbp+fvp1KWUKB0zJovZT8Zfoo3k94j3mWOAtht
 6QyOPWFHqjq1w0+j5afEZxKN5V1a0lQvDSp62QGWES58dwMfj8M0Xom30G0bg=
X-Google-Smtp-Source: AGHT+IGj17wXVLJVImH23lwqcOG2/t4wVchddocpSe5VZMuncdh0FaPOQTztffjz3tOnEKdIdlVmpA==
X-Received: by 2002:a05:600c:6218:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-4771d043763mr5450425e9.36.1761655876812; 
 Tue, 28 Oct 2025 05:51:16 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718ffa42bsm19014515e9.4.2025.10.28.05.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 05:51:16 -0700 (PDT)
Date: Tue, 28 Oct 2025 12:52:09 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Daniel Thompson <danielt@kernel.org>
Cc: duje.mihanovic@skole.hr, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: ktd2801: depend on GPIOLIB
Message-ID: <aQC8eZhHIueu7Ub8@aspen.lan>
References: <20250411-ktd-fix-v1-1-e7425d273268@skole.hr>
 <aQC1iJlm2jS479_0@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQC1iJlm2jS479_0@aspen.lan>
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

On Tue, Oct 28, 2025 at 12:22:37PM +0000, Daniel Thompson wrote:
> On Fri, Apr 11, 2025 at 07:22:18PM +0200, Duje Mihanović via B4 Relay wrote:
> > From: Duje Mihanović <duje.mihanovic@skole.hr>
> >
> > The ExpressWire library used by the driver depends on GPIOLIB, and by
> > extension the driver does as well. This is not reflected in the driver's
> > Kconfig entry, potentially causing Kconfig warnings. Fix this by adding
> > the dependency.
> >
> > Link: https://lore.kernel.org/all/5cf231e1-0bba-4595-9441-46acc5255512@infradead.org
> > Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
>
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

Ignore this... I opened up my mailbox with the sort order reversed!


Daniel.
