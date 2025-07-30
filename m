Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33878B1563B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 02:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6978110E0E3;
	Wed, 30 Jul 2025 00:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="WYe/h8Jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB28710E0E3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 00:15:19 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-236377f00a1so54712615ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753834519; x=1754439319;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7mZ4nEVKbGQGNfr6ook2ZXrLnFiuRpQgXmMMoue3C0=;
 b=WYe/h8JzWPhpnZPPxzXAKFwrjyR8t2UwGClss+Yy4kzUvlh2+/WTHb35+StqgsVuQ+
 6dpheHfHLmg+66RleybDjNsJiADF5QOOh/yqHDBeEZtEwY+GuKAxK+ffbQ3YPlcUiekZ
 vAZ27ivoOvAn0VBUPiLMXztTfyAZQeOFrYbNOKwwQF0daCwpxD7RwdJfBmg/XPE3UevH
 TztDkf8E4gupiBjwz5iXEzMR4XOPpYpW4B4TteFMuTUgHEZjea8xUnH7oSrUG4jjQv8p
 fb+pW1pAX0oKZr3OhTnDpcVnQy3vCelFzR9Wyea9bSeuZFOtIcpFOqLG5QWLNRrJRmvT
 pTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753834519; x=1754439319;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=B7mZ4nEVKbGQGNfr6ook2ZXrLnFiuRpQgXmMMoue3C0=;
 b=BUSdB04I7u7lA+qVLw6tdb6vLOYxYsim9OvM+ZDQcADJc9NYrsh5W5pE85NLuF94bA
 yvTtXCvRaESYQCuDL8+RUa7uZqR0+UdBQ/PsLohIADvO5jGuN83+E9D5j+gAw1DqUphd
 cNl6btyhjELJCEtnB1LAK5PnShfOXKb6xptrLyYYe9M0ONiUGYqdemEjYkhTDoFPAjwr
 2XB82lfPkQAcoCOGonldgPqiSEoS6qMl4enJuPoHRxw+fHu1JOvt8jWta8x6/p8nH14R
 nvu8XhLuXvGlvA5eWIA7dM/qX5rm3DmtTR4qtK/M70+maaT3qq1OcVzOU8wQgfVMlg+w
 Lwyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjAIjmMLuF3HdAvJpr6G+Oe2/9pIfUSpnly4nnz/886YgMiQXoJ+4lqPOYzuknNUieIbwZPvmb+I4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY2gu5vuHC1Dn1ewV/Edssm4PM68fa9GzozgaYzxoVZrVrY0ih
 pT9BIeKMOh0NMLx12OLBbmO84yvAPjvZgKLr3u1XvXX4wC9b1ZV1F07jOzbVxccr8rM=
X-Gm-Gg: ASbGnctaaLUdsm9PW0BXXBQtxNdWay/H9kGjFwlaldlFor7etx7srKQEBNVKFnOidmb
 d4O7uFmjHBRmF+ida++1KIfnRG8vFcv8/qmqi6WLyvMFnsTL8wTW7MdZBk9+q2LpaI2Ag0+WkXV
 a7oaM6VKqcRNRZEzMX4DixrCay1qd0W6BPQIkvQMh8k9yfIhvlzQFxgAgmJyiV9TmNoOvRacADy
 PxyJ2l2zKQ3Qmf0+Ctmkawxc0RUsD8y2x6Oz9o/5loiVI6J6VnBoNO1VzMrpx+WaWNGkZCJSWNG
 ixOGGpPZXO/DMjBJndXJn7ScN0/7uN1wOALuiI4pnuekdhnosUAxWYl9CexVh86g1bSJGdtlcnk
 qWAGfj7EPz80djnCQVUo=
X-Google-Smtp-Source: AGHT+IFtzt5MEl0tZciB3F8o6Fc5SKFZqY4YzGuLSUPsSrha4wOb+FYTYjRMuNTxbhYmOUlCfsVqRQ==
X-Received: by 2002:a17:903:3b8b:b0:23f:cf96:3071 with SMTP id
 d9443c01a7336-24096b48bfcmr17839525ad.49.1753834519151; 
 Tue, 29 Jul 2025 17:15:19 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ff7044135sm69618295ad.71.2025.07.29.17.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 17:15:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 18:15:17 -0600
Message-Id: <DBOYG6B6WLDT.Z096YHZGRXDS@brighamcampbell.com>
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] drm: Add MIPI support function and macros
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250729054435.1209156-1-me@brighamcampbell.com>
 <20250729054435.1209156-3-me@brighamcampbell.com>
 <CAD=FV=VLoMenu22F_VeoHyfXwRO7JfXL8peQLEpkqeZ1tDOmEQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VLoMenu22F_VeoHyfXwRO7JfXL8peQLEpkqeZ1tDOmEQ@mail.gmail.com>
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

On Tue Jul 29, 2025 at 3:34 PM MDT, Doug Anderson wrote:
>> +/**
>> + * mipi_dsi_generic_write_var_seq_multi - transmit non-static data usin=
g a
>> + * generic write packet
>
> nit: "non-constant", not "non-static"
>
> From the caller's point of view the difference is that the data is
> compile-time constant in one case and not compile-time constant in the
> other case. It happens that means you can _store_ it in a "static
> const" in one case and not in the other case, but that doesn't make
> the parameters "static".

Good point. The storage class is an important implementation detail
within drm_mipi_dsi.h, but just that from the perspective of a panel
driver author: an implementation detail. I'll go ahead and address this
and other feedback in v3.

Thanks,
Brigham
