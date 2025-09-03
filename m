Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341F9B42225
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79310E891;
	Wed,  3 Sep 2025 13:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gREu3S3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A682B10E221;
 Wed,  3 Sep 2025 13:41:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 819F260255;
 Wed,  3 Sep 2025 13:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348D5C4CEF9;
 Wed,  3 Sep 2025 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756906899;
 bh=GdyS+4iaGJbGIJ9ctC+uFtQbJ57ANyqF8rmhb7Dc65Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gREu3S3cIIExxWuJPsc+munhlGaJtSwRMnS15DA4v0a6bQz6CWCrmik3TzYj/QUJj
 3ZloY/8FCzhwS85PBka4CYNFeEOJbr7uVgfvXPdZeoAikj7Uo0dnGkAxWxGkG+5qsO
 Ubyh/2IuzT8yKsZ/kPtNv09e6T7qhzcGrsaH6Y8fwLeZyjglfWVXXhr2JNPe5wC7Yw
 F1Qxtcff4RNjFLRfNMG69ZKoOHxIslevyytvdomIhf8ZQZp2ywnG4IJCrefXprlYQy
 PWeQU1n7TY41TrGtpOURB7CSxfyFAU/wyFf1li3R+PGyBGvuiJDKyH0k8eoNUsZlzO
 OT60wNUwudvhQ==
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-74595f3852cso731583a34.0; 
 Wed, 03 Sep 2025 06:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtD8dAn8/+YtglKxy6HaA3t0qKaMocmTm5UKjrzEBodaDUp2THUqk1q4cOFAvwXLpsN3F2M2Q7KxIQ@lists.freedesktop.org,
 AJvYcCXPCZeNPs54K7xowqhbRqp838IRJ+OJjQ9L6+Hi1W07O4oD34YzAHJhm3Fpe0p+Vs63Oi5fCfc/qdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxriESU1cSUp2Ki2yuoIE6+2TeXsMBq/GFr+oy81VfibLUOPCAH
 wqgg06nAg0Q8N6u1rK8pq66AW34+tGWRotBPCO4VcD5rKvFIw5s8KwNx2xbvKl0wGNXG6n5vOVv
 SDbCL7ErQrYC59VJukw1kla1gOGL55Aw=
X-Google-Smtp-Source: AGHT+IE8CKY9R9M90mIkT56C6rGxrcA7dBv19VhPe7gEVCnw2r6FCP2pLXabMt9+rlKIM6nRFLb5/otuT90mPVIOHdY=
X-Received: by 2002:a05:6808:8219:b0:434:97b:5eb9 with SMTP id
 5614622812f47-437f7d74afbmr6249755b6e.28.1756906898553; Wed, 03 Sep 2025
 06:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-11-zhangzihuan@kylinos.cn>
 <34b5e01e-2f4a-4d57-93ca-ab4549681b17@kernel.org>
In-Reply-To: <34b5e01e-2f4a-4d57-93ca-ab4549681b17@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 15:41:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hisM6vfdNXaY7qCGtcMb1FENGxiBb=E=tkqDbRyjs=bA@mail.gmail.com>
X-Gm-Features: Ac12FXyg097RI81OLcVmXs8LtZCLVL9SQzq0jRH5EJZq7nDwUhDORw8eege7vFE
Message-ID: <CAJZ5v0hisM6vfdNXaY7qCGtcMb1FENGxiBb=E=tkqDbRyjs=bA@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] PM: EM: Use scope-based cleanup helper
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Zihuan Zhang <zhangzihuan@kylinos.cn>,
 "Rafael J . wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 Keerthy <j-keerthy@ti.com>, 
 Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>, 
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>, 
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, 
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Sep 3, 2025 at 3:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/09/2025 15:17, Zihuan Zhang wrote:
> > Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> > annotation for policy references. This reduces the risk of reference
> > counting mistakes and aligns the code with the latest kernel style.
> >
> > No functional change intended.
> >
> > Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> > ---
> >  kernel/power/energy_model.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> > index ea7995a25780..99401678e809 100644
> > --- a/kernel/power/energy_model.c
> > +++ b/kernel/power/energy_model.c
> > @@ -451,7 +451,7 @@ static void
> >  em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_stat=
e *table)
> >  {
> >       struct em_perf_domain *pd =3D dev->em_pd;
> > -     struct cpufreq_policy *policy;
> > +     struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D NULL=
;
>
> This is not really correct coding style. Please read how to use
> cleanup.h expressed in that header. You should have here proper
> constructor or this should be moved. Or this should not be __free()...

I gather that this is what you mean (quoted verbatim from cleanup.h)

 * Given that the "__free(...) =3D NULL" pattern for variables defined at
 * the top of the function poses this potential interdependency problem
 * the recommendation is to always define and assign variables in one
 * statement and not group variable definitions at the top of the
 * function when __free() is used.

and thanks for pointing this out!
