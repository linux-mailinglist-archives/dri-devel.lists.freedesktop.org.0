Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401FD1B5DD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668C010E20A;
	Tue, 13 Jan 2026 21:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BsAnh/NS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F33510E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:14:29 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b871ba73f49so380552466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768338867; x=1768943667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQigQI/8admlpIuls6ZhRKbo+cO5u2/w2RF0qKuRaZQ=;
 b=BsAnh/NSegebds7sROCdafl3YFthGG8Oz3gRLVr9V9Gr8PCBYM/xnrLnqWuLYEWJRM
 kajPtQoQuf2kpzhJKyCebnJQqSvloRfOGdhEaTMUCoapcx3lGVKmG+6JpgzPT6GX+3tw
 afagbXitblFLAarkKIG/B+wZLYo0XhnDG2atTihaM2+zQWl0JDMIdpkJ3ifFhj1OEnKR
 JqlEWfkXJmtQu/3ujv5DhhaYUO1N5CQOnblWVMvqm6i18CbspSkAPYRcDGutTRQmbaUp
 YHq7p1nr7/PabjewE96SaDC26SSPRBHH75dX5nlwcOXwBS8O2FOn9haKThQiRehohtuD
 Gj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768338867; x=1768943667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pQigQI/8admlpIuls6ZhRKbo+cO5u2/w2RF0qKuRaZQ=;
 b=uPet1qEBKCjtNzHrg3h2W7O2rj78Er4Od4QlNfyTYf73uaO8mgtcIFWC2jZvXloGS+
 7uKKuM7imJptB+r914MDPlyQiFyW8a41TsFFKYpwqhOgOcbHmCt+gSJENYvqkESakxMu
 i9vNlKhu2sh4OITsEcAE9+fbwH4tNHMB1mhuNYFFuSd5kmSgv4Pcidpw7xSdlRO/h8kM
 zVUj0otZJj/l/5Fm6lrgmf2ye+XZCJOaY4UVD5P9rxw80qUelL+Sq2FzhCnMr+LlB37J
 kGaWM6O4//3JvQXs7foCXdPmt7HCDbbrR2irVfVloMJCqwBxzP8J435rqI3u9nfaE3Wl
 lakw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEysLfyyn/8cqt0iyPFlj4kbbqcVJ4fdY8J7OQoxVrO7RBmj1ltAlEhwi8aHsX0gOqC2r/3Epp3nA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylyNjaD5z7CXHCfrnqDiny8PSCa0dNeZHtTg2j3Cd5BMCGj1MC
 dJlES2CaqqQpHUtFE9Axf68dvD637KLitsuweU/3sUzA3TPj4uUkKpt0U/BnByVzQF2GWpblSNM
 jMSiPxDqZ8awXw1pcYTnHJ256GP84V+8=
X-Gm-Gg: AY/fxX6dXKff3X4/qqzb669HqsF84SJJtod8OFqtOlZk/e4ou7Y18wOzg9osCO5BjYz
 DlpNxDVqiAAgneF/YB84gsRNI5KSJc2HgtBlI4jeqti59KG1SKVxNm4UaAQNbWn5c9Bqx9VWtYf
 wSzObRbEVAX2RnOGuSaE9A4q3vEkv5GO7etOwy/ZqPJmA0WQTP3LOw6iXjB4Ntnq08uM5fYgAF2
 cz9bD8JOJi3KUZPZlACGdTshPGUPzk61R0wkZsTLSZmyaBj5bRAwod6hV6P4gCMTXK38RcjVmcW
 vQS2RTpTgf0MQAXswcyj6OpU5VP5PnL/PXbkdyNbc3DvD+PZArbEfdg7tDS1j0ZzJ3bZtHc=
X-Received: by 2002:a17:907:6ea5:b0:b79:f4e4:b544 with SMTP id
 a640c23a62f3a-b876103e568mr44161266b.21.1768338867286; Tue, 13 Jan 2026
 13:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20260113210559.3020-1-gideonadjei.dev@gmail.com>
In-Reply-To: <20260113210559.3020-1-gideonadjei.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Jan 2026 23:13:51 +0200
X-Gm-Features: AZwV_QjOLtUncA12ujRVp-N3ahqpmevsE8icLNdM6IvrWboaeofcQ5aBk58-iqo
Message-ID: <CAHp75VcGTgd6T4p-5ceE61Y3CGQ4qriXh=VV3kBi=hEF9hNPWw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Change udelay() to usleep_range()
To: Gideon Adjei <gideonadjei.dev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abdun Nihaal <abdun.nihaal@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Jianglei Nie <niejianglei2021@163.com>, Matthew Wilcox <willy@infradead.org>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Tue, Jan 13, 2026 at 11:06=E2=80=AFPM Gideon Adjei <gideonadjei.dev@gmai=
l.com> wrote:
>
> Replace udelay() calls >=3D 100us with usleep_range() to avoid busy-waiti=
ng.
>
> The delays are used in init_display() callbacks. These callbacks are
> invoked by fbtft_probe_common() during the driver's probe path. the
> probe path runs in process context which already uses sleeping APIs.
> This makes usleep_range() safe to use in these situations.

Nice, now can we switch to modern API, i.e. fsleep()?


--=20
With Best Regards,
Andy Shevchenko
