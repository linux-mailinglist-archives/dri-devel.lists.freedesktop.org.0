Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A537C60E166
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 15:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B16C10E4FA;
	Wed, 26 Oct 2022 13:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0F10E4FA;
 Wed, 26 Oct 2022 13:02:19 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id y72so18665399yby.13;
 Wed, 26 Oct 2022 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4glVzmWsTbBlCQmTnSNI123LuVL+ieI4yytV81hjliI=;
 b=Oot5BrIF853TW65wZY1ze+RZRzXtGQpd3nFZPzVZfZQe9HC2K+KdVB467TVUjtYvka
 KCFDSQXooBqHARrvM+AeFu2L+hCxBdiXUx5vXmsdiQyQsZYYp9RwZFkvIMEOcFF/V2WL
 njyS+YjN2MqQgoZ8sm4jdIvJy8Bcsm3ZHAfpgjivgi9TirYHAi2Lgl+P2uw/e81O5lBz
 tELCsbpw3TXe04r65ftHb1r5f841Pf6eQhrsCoZtQr3pDaOnvCzDQFb+0Tb4pe6uX0k2
 PM1qAL0wZAMSezPxagjErjlcZxIg6s3ImDh1V6z8PwbE6UAJiI8wMqQRF+ALQJuYsNwP
 Tk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4glVzmWsTbBlCQmTnSNI123LuVL+ieI4yytV81hjliI=;
 b=S+uEJdDMpUsLhyKh65I0cJETChG1rXaTrNsXqOwWXVLMnH1A+Mx0MqWH7+JkUOGK9e
 xzjlpzjohqF+vRpe9ZVoIS4Kl5YODvm+CEHheN/i5pspTeKxa9eE6Ylmj8/pXt4NATuG
 2xmmkWkWE5M6TN/PuOyuTaZSG314cui3Boj8ZZ71RPqIyWzFnskvZR8jo+7l7zRyzaR5
 N3cLj3G/f/L1SOMylvRkqjps1OfEFfdw4D4HTpr1qveeUVzpcZ0F/f2TDSAkfCGZk2UU
 nGBXSyvVgniuQvaAX/m2Z+9sqypNSz4YENdAXXHLfHxAIOrtO0TJEoTpTPh1wyOoOnlI
 Y3jg==
X-Gm-Message-State: ACrzQf1tfWkXtyoGqVXgYdQ4IirgTFZmF7wX6A2AhjfgMM/NcRmIj4eg
 c4jDHvdkoGEXcvb9SFtezq3TTvaUkc6H3Hb6DZE=
X-Google-Smtp-Source: AMsMyM6qlz1dbMzPR1SAfePuUVwC4H/jq2ipBZgH0seGZQdGDKasj8QxPBivL0DK4NjUYtQQFygciaR3L8cvdUf+ssQ=
X-Received: by 2002:a25:5f07:0:b0:6cb:70a7:359e with SMTP id
 t7-20020a255f07000000b006cb70a7359emr7895526ybb.110.1666789338724; Wed, 26
 Oct 2022 06:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221026083950.3712598-1-nunes.erico@gmail.com>
 <20221026093604.nuielehywjtxe2mn@vireshk-i7>
In-Reply-To: <20221026093604.nuielehywjtxe2mn@vireshk-i7>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 26 Oct 2022 15:02:06 +0200
Message-ID: <CAK4VdL1HxrZmhsXg8JjsN=BYSYJawWxoyTu7gpaFyU9d7L-chw@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Fix dev_pm_opp_set_config in case of missing
 regulator
To: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Oct 26, 2022 at 11:36 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> You can directly call devm_pm_opp_set_clkname() and
> devm_pm_opp_set_regulators(), like it was done before my patch, for
> single configurations. So basically a simple revert of my commit, with
> additional comments you added above.

Ok, I'll send a v2 with that.

Thanks

Erico
