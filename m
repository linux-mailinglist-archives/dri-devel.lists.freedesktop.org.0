Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5B990C1BB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 04:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A7810E11B;
	Tue, 18 Jun 2024 02:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Fg8oYXFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E70510E1BF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 02:12:25 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-79baa4e8531so9734485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 19:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718676743; x=1719281543;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfsgfTxIbf80Vaj2+gGtTRv2D1VtoN9sVBiv1EbMpe0=;
 b=Fg8oYXFlSgh14rpdHhix3zRLce8pLWd1gawl79Yk2HZ20Lb8j0UWxHtmOaREMOeTkI
 hCraWh1K3go/tD8lhXmWpcCefG7v6jlWSYQVdL8/Yl43hRn4E46QRGn1JFX7QFAAGFCJ
 gr4ejm5lWwQdV9Tl9ECBl2OdOQPbOWRl/xouE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718676743; x=1719281543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XfsgfTxIbf80Vaj2+gGtTRv2D1VtoN9sVBiv1EbMpe0=;
 b=e6E4MFAq5NfDVwpg6Dit7DkWAH33Hcp3tRfmSeD8dWPFXL/saJ4QXKPwTQe4VS90LJ
 csAP+Rh22GIK33swDcamhmwoHbJNjxCTXTLQxaZ9AtMNffBYwkXjfqUGVgfxQks3ENEd
 qcdrF+tvsWqTMHETSP5npABjrzXAt5XYIda1jdQcsb2CFqmzhUMacf0V1YcDztu95CE/
 wcm0/eA6cOhV/XtETUFGLVdNwkkjG5w9qcMf5saw+Z2AKyYE/RO+fOa0DJzrz93X5WR0
 2komy1Mdn6sVUi0QcXrpZDHqN7BZDEi9XRIcssbAzhMNqWRh0zUqS1F80MXVPoZooTJQ
 vOEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmNPwKO6qTTdSLionPJc7xK2sw2N7AaVdrME84euVD7V1KYjN53EmPOalxEKi6UfgBjo0+VkSjX6M8ZColwP9a8tzPifyJ6GhhL2o4+3uu
X-Gm-Message-State: AOJu0YyyiRGeNRKzjAbVULrMAqSeDVLPr8q2SHGKtNulmyY5n0rhc6jM
 tKHhIOPOdNGTLd5mmQcsUbXsjr4VOVHAOg+xuOIRG/kyx8vVj0svhArHCgfqtMUVkWUu2uU+t+I
 =
X-Google-Smtp-Source: AGHT+IHdjl1i5C/0vAV5HRH/8A40LtZ9JVOrKhpf0Tgb6i5Tr+KRx0W0W4uLsDOz8pOyIk1Vop3BSw==
X-Received: by 2002:a05:620a:4513:b0:795:fb14:3f3 with SMTP id
 af79cd13be357-798d26b5304mr1276323185a.73.1718676743059; 
 Mon, 17 Jun 2024 19:12:23 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798d1b1ea83sm420877485a.6.2024.06.17.19.12.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 19:12:22 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4405dffca81so64491cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 19:12:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU4VAGAHIvJQR1Bz3Th99K1oIwyNLioqlGwHyK7rvaiLgf8oKwb9jBFcHy5nKnjAfGVS4paXabVQjcjCOG26YeVBI0idCUtElH/yEluC+wv
X-Received: by 2002:ac8:598b:0:b0:441:62e9:98b with SMTP id
 d75a77b69052e-4449cc66d3cmr1351231cf.10.1718676741668; Mon, 17 Jun 2024
 19:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240617103018.515f0bf1@endymion.delvare>
 <xd2yybtxvzte7gwqwg2vudzvhoekqao2dle6zsuduzjzi3rsay@xhahwof2prph>
 <20240617132348.5f20bf89@endymion.delvare>
 <vsrsvmrkqnmxs3ncqv5m2gevzefiq55tr2iolxlmoehsvgcfkn@hyx37vax6r5e>
 <20240617201814.73a07702@endymion.delvare>
 <jbqbn6zaqq7j5htxuqxb34tjrf5lnqabkh5ywtnklhd4owyc3h@ztvolr6hjrti>
In-Reply-To: <jbqbn6zaqq7j5htxuqxb34tjrf5lnqabkh5ywtnklhd4owyc3h@ztvolr6hjrti>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Jun 2024 19:12:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4qVDTOdMFQeEiJi2DD=tuEj66vP35XQKrSj5-r_YADQ@mail.gmail.com>
Message-ID: <CAD=FV=X4qVDTOdMFQeEiJi2DD=tuEj66vP35XQKrSj5-r_YADQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/display: Drop obsolete dependency on
 COMPILE_TEST
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jean Delvare <jdelvare@suse.de>, dri-devel@lists.freedesktop.org, 
 LKML <linux-kernel@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Andrew Morton <akpm@linux-foundation.org>, YueHaibing <yuehaibing@huawei.com>
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

On Mon, Jun 17, 2024 at 3:26=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Jun 17, 2024 at 08:18:14PM GMT, Jean Delvare wrote:
> > On Mon, 17 Jun 2024 14:55:22 +0300, Dmitry Baryshkov wrote:
> > > On Mon, Jun 17, 2024 at 01:23:48PM GMT, Jean Delvare wrote:
> > > > Hi Dmitry,
> > > >
> > > > Thanks for your feedback.
> > > >
> > > > On Mon, 17 Jun 2024 12:57:19 +0300, Dmitry Baryshkov wrote:
> > > > > On Mon, Jun 17, 2024 at 10:30:30AM GMT, Jean Delvare wrote:
> > > > > > Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"=
), it
> > > > > > is possible to test-build any driver which depends on OF on any
> > > > > > architecture by explicitly selecting OF. Therefore depending on
> > > > > > COMPILE_TEST as an alternative is no longer needed.
> > > > >
> > > > > The goal of this clause is to allow build-testing the driver with=
 OF
> > > > > being disabled (meaning that some of OF functions are stubbed and=
 some
> > > > > might disappear). I don't see how user-selectable OF provides the=
 same
> > > > > result.
> > > >
> > > > Historically, the goal of this clause *was* to allow build-testing =
the
> > > > driver on architectures which did not support OF, and that did make
> > > > sense back then. As I understand it, building the driver without OF
> > > > support was never a goal per se (if it was, then the driver wouldn'=
t be
> > > > set to depend on OF in the first place).
> > > >
> > > > Some of my other submissions include the following explanation whic=
h
> > > > you might find useful (I ended up stripping it on resubmission afte=
r
> > > > being told I was being too verbose, but maybe it was needed after a=
ll):
> > > >
> > > > It is actually better to always build such drivers with OF enabled,
> > > > so that the test builds are closer to how each driver will actually=
 be
> > > > built on its intended target. Building them without OF may not test
> > > > much as the compiler will optimize out potentially large parts of t=
he
> > > > code. In the worst case, this could even pop false positive warning=
s.
> > > > Dropping COMPILE_TEST here improves the quality of our testing and
> > > > avoids wasting time on non-existent issues.
> > >
> > > This doesn't seem to match the COMPILE_TEST usage that I observe in
> > > other places. For example, we frequently use 'depends on ARCH_QCOM ||
> > > COMPILE_TEST'. Which means that the driver itself doesn't make sense
> > > without ARCH_QCOM, but we want for it to be tested on non-ARCH_QCOM
> > > cases. I think the same logic applies to 'depends on OF ||
> > > COMPILE_TEST' clauses. The driver (DP AUX bus) depends on OF to be fu=
lly
> > > functional, but it should be compilable even without OF case.
> >
> > The major difference is that one can't possibly enable ARCH_QCOM if
> > building on X86 for example. Therefore COMPILE_TEST is the only way to
> > let everyone (including randconfig/allmodconfig build farms) test-build
> > your code.
> >
> > On the other hand, if you want to test-build drm_dp_aux_bus, you can
> > simply enable OF, because it is available on all architectures and
> > doesn't depend on anything. No need for COMPILE_TEST.
>
> I'd probably let Doug respond, what was his intention.

Is this me? This looks like a straight revert of commit 876271118aa4
("drm/display: Fix build error without CONFIG_OF")

I don't personally have anything against removing COMPILE_TEST for
this given that I wasn't the one who added it, but make sure it's not
going to cause randconfig issues.

-Doug
