Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464037EFBF5
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 00:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F8F10E77B;
	Fri, 17 Nov 2023 23:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7971510E779
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 23:00:30 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9dbb3e0ff65so347630466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 15:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700262027; x=1700866827;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMkvkcQ13fcCiTw6RuM4WY/Bg/hY3XQDUqCeInYeZG0=;
 b=WSVVle2YP5NUKtDHnU/CWylj5HcXlX7zi4/+beE4riGxm4jC9S+oYB4duvRRQQUeLC
 WaCi54ezs7ljZp/c+fHhe3RVURJ9qid9yDIM3bAo0CwBkDo3TRP/KJh0enGOk1rWdzHu
 gXDooECK0nPqkpeb9L9nMjO9kMQdpmkEGv46Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700262027; x=1700866827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMkvkcQ13fcCiTw6RuM4WY/Bg/hY3XQDUqCeInYeZG0=;
 b=IBkcj6HzXKm3pFEgDrgvrjaH2PfzZbBsfxQ6243bvGNuYX2vWvYuvNq83NvIrMEdBR
 +HMzg1DEDvmDtS9V3Acd/va6y+qEApEl+KLl1JDUbwR7coWLxBJpBFHkbz/mZQVjeF11
 oOxpey/t2BeUxT9MGyhl1plWMwYyzIQznC18UzcqgiDIWHbMcYrcEYWTGcmrU6btxCMy
 syg7n27eGeHOb4OKTn6OtYSt1jr7q9o+kZ9DWm+M98NMUAUJMtYefAEwSFznOWPEQrkL
 zQwe2VZW0hRLtwqrMB418UhqGi0JomqPv29GpDAEfqhs8iK8rBnITt9nqMsI3UlKg7q2
 TnaQ==
X-Gm-Message-State: AOJu0YzbD5Wc/volX3Jjvql19bx3sxk9iDPZStnEGSiRZRJ7uqza/+2E
 PrXalTe5c8WsFhEIYP2n4HICD2Z8+rMHGdwiDYDRJn09
X-Google-Smtp-Source: AGHT+IF6jLwP3GSj1Yy2aKbJuT4m4kYwrDgJpk/wSTUwqQ3nwhBoXfPS8wUOFwJ9+DQ9lSuzl28iaA==
X-Received: by 2002:a17:906:234f:b0:9d7:1388:e555 with SMTP id
 m15-20020a170906234f00b009d71388e555mr366851eja.21.1700262027529; 
 Fri, 17 Nov 2023 15:00:27 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 rs15-20020a170907036f00b009e62bb0439bsm1242759ejb.212.2023.11.17.15.00.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 15:00:27 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-54366bb1c02so1493a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 15:00:26 -0800 (PST)
X-Received: by 2002:a05:6402:ea1:b0:544:f741:62f4 with SMTP id
 h33-20020a0564020ea100b00544f74162f4mr65555eda.0.1700262026298; Fri, 17 Nov
 2023 15:00:26 -0800 (PST)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.4.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
 <2f7fbd1b606b4d08b8c8c6eefff5898c8faa697c.camel@redhat.com>
In-Reply-To: <2f7fbd1b606b4d08b8c8c6eefff5898c8faa697c.camel@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Nov 2023 15:00:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XkeicQ3Gq4yaFtXsF7yM_7pXbpNKB56DbOwBmsEsrF_g@mail.gmail.com>
Message-ID: <CAD=FV=XkeicQ3Gq4yaFtXsF7yM_7pXbpNKB56DbOwBmsEsrF_g@mail.gmail.com>
Subject: Re: [RFT PATCH v2 04/12] drm/nouveau: Call
 drm_atomic_helper_shutdown() or equiv at shutdown time
To: Lyude Paul <lyude@redhat.com>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 22, 2023 at 2:06=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> actually very glad to see this because I think I've seen one bug in the w=
ild
> as a result of things not getting shut down :)
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Tested-by: Lyude Paul <lyude@redhat.com>

Any idea of where / how this patch should land. Would you expect me to
land it through drm-misc, or would you expect it to go through someone
else's tree?
