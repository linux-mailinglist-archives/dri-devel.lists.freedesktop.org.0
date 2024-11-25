Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0659D933C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4664B10E7D2;
	Tue, 26 Nov 2024 08:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dcQ2Ki1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156E410E609
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:24:28 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6eebb54fc48so37896657b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 03:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732533867; x=1733138667; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=atTGdQENg6nCHWrmtf7VN4oYXAt3UDEdIH0WpKqyH3M=;
 b=dcQ2Ki1xSUVifOnYITNOx1Xd9DHCTD52n1gn4/oYgIx2eIolEUIl0aX3Y8bAIf+CvT
 FwUvgPCX1uP6FlOfxv/nX1XhvadUIiwr8WySGZaJ6HnAho+6gxUD+FN5qJK1C0QjyYrz
 V2db2OCPdfiNqFTqZXaU578i9hADtUuuXy6UUkNdQoXO1+12BO/UDSo1GUP6kcENQ+Sw
 Gzx14AUt0f1BmscDCSJTdYeQ71FBNZ54rPrAGhWjcpwyAmHiUFqZlkVXXS5aiP440d6F
 PqKeXNjPJq5I0Alkc8kp22iglpScYBQlwAS9HuZySr3PbqiSQ4jcHUEPWfSP1COkIt0i
 /vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732533867; x=1733138667;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=atTGdQENg6nCHWrmtf7VN4oYXAt3UDEdIH0WpKqyH3M=;
 b=UHUdzqpzJv3JDxKTF8PeYosLjBZLBkPStHXncHLS3qjVmBIQJOkVDKiSwz5Lq4h9eX
 RVByrSkeW1/eKgS+U6ZKt9J3QD8caRvlHI4MPxkteOuHmnQw/DJcfcqhYZHEv0KNiVFr
 o8NF27b0bYggX8/xjuc6U7no3Z8m/Gyvk7QgQy0CnJwsDBfZ0+Pjqrh1Z6mpmCYl7Z65
 90gCGKJk9ZzipphLSZ4BjamPo6aFCPkOAhhwmYkhLPxXIS+AvTKjJfMA88JgqmJ9m/Ny
 jxSuOI0M9Gwq4e2uBBJFpvDHH4RCcZNGIRM88nwfxvcp5zURnkK8dEFxHC5wC+AB/I27
 3H1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHmKAPDrL0IAgNcGTC2cM44RRpJntAsA3e6n2FWsSYy6mY+kXzS7RTBaA54K0lqhc91Y2o6cHfKqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9Ft75xGxKKLhQSHwDg0znVf2Y6APgO4br+O6gtZbqpckkX5QN
 NrdbWk0K2sGKtuCXUGf2BXRDsRKPLqhQtc6wZMiO8osqDqqkIDUYNQmg+fsCerZE3jr781fUDZC
 P0hPySPPzVai7irSocCWe1jh/mmw=
X-Gm-Gg: ASbGncuNIclvk9kTMOfAtJfTwlSrH4pzPvq+2XX567dSrkGDZe+0uTYQTtMo4kf1wCC
 Yb2LqvZvTmeq1086EgLsRaq/FHS/chaVM
X-Google-Smtp-Source: AGHT+IHoeHq1SaOkzoegc7LOfrsp5NCsRkFD5zT231LvZh60oKXqnaI9hhCjtdWG9vlb54GAx+il0BMwPnlOQyc601A=
X-Received: by 2002:a05:6902:2684:b0:e38:b2f3:b7ab with SMTP id
 3f1490d57ef6-e38f8b346femr11037579276.24.1732533866931; Mon, 25 Nov 2024
 03:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
In-Reply-To: <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 25 Nov 2024 12:24:15 +0100
Message-ID: <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> So this controller only supports a single mode ???????
>
Most likely. On all devices it is connected to a single built-in display.

Ack on all other changes, will be fixed for v2.
