Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2E93D786
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 19:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089CD10E4A7;
	Fri, 26 Jul 2024 17:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Iw9xdDuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F83810E4A7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 17:21:45 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6b5dfcfb165so5063146d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722014504; x=1722619304;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0M2ezyARf722kO0n/gneWi2HryULYqa+cG+Yc2z4K0=;
 b=Iw9xdDuFNY2YlJ7OeBs/Q3edL+y6/RzEn88A0XgYbeXNvbxRTl1ByNzIl7m5OyvAHD
 Ffxd8udM8RcUhMv6FWshGXtUV2hIclUp7rG/H5HA8pfpUO2UysW7FfdJ13IDxz3PhU3l
 lu5NpRaDSJDSOtUoZ7x/t18ITPXSpdxbxJJ7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722014504; x=1722619304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e0M2ezyARf722kO0n/gneWi2HryULYqa+cG+Yc2z4K0=;
 b=iF9CdWIY8tfQuxIGuGv8wGhzEbptHHc2FbFDmgLurY212VzO2bm9Tl0+qvsARjfl8M
 9DIujalr1fBEDLIOPu2guEPDL7kFQ4C9/5Byx2002UVxaKhTX9VzMDp/X6CAHIDZkoi7
 /WDtIyyyaIK9pRr85tdYNJte/DvwbWtmzljleZC4dH7dOBt2YlTbTGPg/Zkd7F1GF0/b
 0Lb421Yffjg1YZTTLoT3M8wLHz//1tMm20BLnlJ7Uv7Qu8v2sQWPVIquakfmOASAcO/E
 zTYFGin5noeJstdhGzJnsGvjGjdT669nQpxrC1gj7Oivc/cwFvyFVQ4zUYVbo5FWgLHb
 Xucg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj3c5A/MUGq+RIp0/zyjCicCyWXQ7+UT12SF9lW05XMI5RbS9p5S7S97qQFt1TpruHSE7c75PUIgm/zwWsYZwyxn7XOZh6SACkBukS1yyT
X-Gm-Message-State: AOJu0YzTswkyKn2sE0s2zqCjsbyWLOzvcZJ98JzOT+fgLH8A7P7NaAQG
 W8d54kNmc/XqcseiFdKUOd9zUoq7S6cIeYJt53KRCJnTxcOhCNwxinwYj0uJRYTBG6+U43mzodU
 =
X-Google-Smtp-Source: AGHT+IHTpzBdhBkZuJ6jOzC/L6tCY+qQ00w02O5j4n0w09sM53XfkQjAEmccuG1XboW9qfjR63gynA==
X-Received: by 2002:a05:6214:40c:b0:6b9:5fb9:113f with SMTP id
 6a1803df08f44-6bb55a7a9admr6094416d6.27.1722014503855; 
 Fri, 26 Jul 2024 10:21:43 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fb190c0sm18185006d6.146.2024.07.26.10.21.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 10:21:41 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-44e534a1fbeso13791cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 10:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWboXZCzIlj4NWBCZKEUIfRCFOlbOZcVP+oLUW04RyfR849RcpMhGo8d/muHM257INKJhYhyKhuFabg/3Cnu4AGJ1vOIShpSCpFq37mUfP0
X-Received: by 2002:a05:622a:60e:b0:447:f891:d41d with SMTP id
 d75a77b69052e-44ff3b38036mr3576011cf.18.1722014500672; Fri, 26 Jul 2024
 10:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240725115229.3416028-1-zhouhaikun5@huaqin.corp-partner.google.com>
In-Reply-To: <20240725115229.3416028-1-zhouhaikun5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Jul 2024 10:21:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGBEB2JjvugPqPRdZhvtr92H+UXy_+_dYBacZrsvpnGA@mail.gmail.com>
Message-ID: <CAD=FV=XGBEB2JjvugPqPRdZhvtr92H+UXy_+_dYBacZrsvpnGA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add CSW MNB601LS1-4
To: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Thu, Jul 25, 2024 at 4:53=E2=80=AFAM Haikun Zhou
<zhouhaikun5@huaqin.corp-partner.google.com> wrote:
>
> Add support for the CSW MNB601LS1-4, pleace the EDID here for
> subsequent reference.
> 00 ff ff ff ff ff ff 00 0e 77 04 11 00 00 00 00
> 00 22 01 04 a5 1a 0e 78 03 a1 35 9b 5e 58 91 25
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
> 36 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 30
> 30 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
> 00 4d 4e 42 36 30 31 4c 53 31 2d 34 0a 20 00 20
>
> Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Applied, thanks!

[1/1] drm/panel-edp: Add CSW MNB601LS1-4
      commit: 9d8e91439fc3890de55eef2bcfde97470b7dc04d
