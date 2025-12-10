Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97550CB1ED2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 05:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE9110E65C;
	Wed, 10 Dec 2025 04:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="eiwkX1k9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0BA10E65C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 04:54:14 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-bc29d64b39dso3726825a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 20:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1765342454; x=1765947254;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgRIUq5NIgFjISB2gneR0mbhG7ONrTzLE678zQ+3RyQ=;
 b=eiwkX1k9IykiiNodmeEWDVRN3V7U15kDrBKhn/MwUfXvM/gm1KIiTjOI3S4moCUyuD
 OQR+aS1/UmIin/OmoAjGygvt1ruCqzWR84SM2Q+0Td+70zUvagxRt/tRTHstbrV20Qde
 2n2lZV5l9U+QemB3//0oAmmwSSCRB13jbx0rNPJilV5wDymPwKfZgLInk7bPNhPsMd8K
 QsHVwOWOS/n4tarN6grnd9CTydDqvRpXaQHNz6g6MYlbPRykC8jf7x5IwlqxDS+2OAGD
 hCZGrU8uWdmltER6fjIJZIl8gSX1IJfZ63wdk+Qef/fhV1cVRgRT+briAsQS1t0GLAjo
 89/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765342454; x=1765947254;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TgRIUq5NIgFjISB2gneR0mbhG7ONrTzLE678zQ+3RyQ=;
 b=mSHlLD0EQg9gs06DzuWd0ypjqBOsFg5thzTDS8klHuke/sifKz9OVY6jlaEC0xYwkl
 60hYN8IdPH4H3TfNjXAz4BECDFbFQ4cvWrOTPTdEaF1mmpfXeN5Q7hloxCoxc0LZSe0M
 ENoe++SnqJsSBC3utttnQHyJsaiAao+6FBND8FKVTlZRhhj9PkH0cyxV2PdGigVCBezf
 txs+fWzfQiOj0o4ZqWoZ1Sp/F8fHuyCuVZFxaoZPXzM1lVhCzTrrWXWu94FOz6nr1BBn
 ePmqwjmmpQahaA5Sc7Yj6/9FF4rfyP05Vyd+pzDHbg3foVfATEk7JQDrqXC8zp/iHaN6
 eFqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1++QIas82W6E/ODUfX8WPybeUVbQXnwN8Jw5euYRxsX8V02LymPCo4Rj0DOthpZl2yiFEMxY9Yk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLnF8f/vjqlo3Bw5ow3PbFnZ5a2478P9dSHAzMoAWxuG7DH7Iw
 wYazz7ux9vYIhIAE6B66GQtXfk6hH2VyL4W3sRobtfbOZ3fE4yk1X4/F9clFGqaleuk=
X-Gm-Gg: ASbGncvFFluBjwS0TU8jwvWLVThBIdsXgPeiEUq71+1bLXrwD0VTfn16cgqA1PygkbM
 cUCqd7Zt5egjWghM7uEVLdzORueAYG79ZqUbc5mx0x4QX7PTh8pN9tFb0zNXwB/1xowp384uxoR
 C7GrsEJFCAxwBJ/tyLrPMf9R6FY3Ltve0hI3meHou5BrXU1de8GQ9GyIkTWl0zuiR/75t0nnJ+X
 6z7aph6mBEJoCAB2FRBvnGylSjGBTvyjay1yPSXQ3QHg131DNdX9OpiSQO2Xbx1OBkeWwMzl5LK
 KDRa8GKma+POTKlDT63IAVTsGXwVZKHSGyARUmo4axxvYZlIgzXn4hFC/kJdN9I7i24z3nmoMfJ
 x2ZS408QZVqEuOSPE06X2PLCVu5f89HgPMnivMOxpltwJqMDYgBm3fuug1ji3dg+iaVCWAR9ebH
 XmU6nz/qBH
X-Google-Smtp-Source: AGHT+IFUkDutRHbyzRE0fJctUjMQoZ0B7REZrSLqrOnhL9cIjvkyOgy9F8iW9DJC1NHCiOBKDEqbNQ==
X-Received: by 2002:a05:7022:6299:b0:11b:94ab:be03 with SMTP id
 a92af1059eb24-11f296548c8mr1053274c88.20.1765342453495; 
 Tue, 09 Dec 2025 20:54:13 -0800 (PST)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11df76e2f3csm72563294c88.5.2025.12.09.20.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 20:54:12 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Dec 2025 21:54:11 -0700
Message-Id: <DEU9O691LF9V.142HEUAU7DZDR@brighamcampbell.com>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Anusha Srivatsa" <asrivats@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/panel: novatek-nt35560: avoid on-stack device
 structure
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Arnd Bergmann" <arnd@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Douglas Anderson"
 <dianders@chromium.org>, "Brigham Campbell" <me@brighamcampbell.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251204094550.1030506-1-arnd@kernel.org>
In-Reply-To: <20251204094550.1030506-1-arnd@kernel.org>
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

On Thu Dec 4, 2025 at 2:45 AM MST, Arnd Bergmann wrote:
> Change this to a pointer as was liley intended here.

Shoot, you're absolutely right that I didn't mean to create a copy of
the struct on the stack when I wrote that code. Thanks for the fix! I'll
try to be more careful with struct usage and the stack in the future.

Can I ask how you got the build process to emit those warnings? I didn't
see it when I developed my patch.

Thanks again,
Brigham

