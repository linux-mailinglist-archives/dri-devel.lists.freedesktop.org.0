Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A2993932E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 19:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D9210E22F;
	Mon, 22 Jul 2024 17:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GFZmEHIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351AA10E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 17:24:58 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-79f17d6be18so278244485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 10:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721669097; x=1722273897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Kw2Bwo9a08jpWFROykkB0PNFh++FU/bydYKmyQ3V9Y=;
 b=GFZmEHItdBA3H3H87q+OVyINLc+xBzvlGYCIZ3xNTJ1UqpiGWMSUQs8JKfFwldJOap
 YI7FiV7IS7+Zq7jd30stADMqyhi8d/uc6Mxdlz44gLG137kfi2XGHGojG3e2HTM8T26Q
 1THDUXDGo+mekMMTcY+4eg73atkDTE3ofvpHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721669097; x=1722273897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Kw2Bwo9a08jpWFROykkB0PNFh++FU/bydYKmyQ3V9Y=;
 b=w9RCHrvMpKBEcLx++jwg5PTMRmEzZwsej3bA+X7v5wGldiuFffUQ9ubEpFQlTICD52
 kY9CUBPN+9RRp8yPAw7facS9+jcH0oWDEq4kKuAq5uk0McE/UCDlQ8BIK0uw2/8viKdO
 yWnlMKOQCsFhrcqKQO5VwgbnrYRLN+EX+PxY6F22aPc+Wbs9pP1z9amIgEyP6WQ03dfa
 QaX0RaWfp3p83L+rVVngNAUdNm4qB3iRq4gApewLok5Rttg9DAgwHd6xe0zwKRbr7pIt
 o8gcloppfCSHuvxYAmBjK3Ve4vMcIFhpMDgnqYQ8WT1te3JegcCfQm9/KWNLErvXHIJg
 1HGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8cWYv616y3XZjZ4ir1oOjm3uHz7XZipDbsrTBEWzloQZzI+eQeEew5qGBnDkLM2o2Z2yB2+lVBk5L+FBz0XYaxILz0gFbdezU8PQCw7FE
X-Gm-Message-State: AOJu0YxOgglUeXKdld87HwQtj5L37MO0DkPhD6o1UTPVflhCpUGnHez1
 QWyEX7ajGjPFT4BEiCe9aaDXnqxIkDPf+ihiutW0mC6m17HzRPhbb9i+agcK4n378Jk6vSVYlnA
 =
X-Google-Smtp-Source: AGHT+IFkbmlzjtbk9Rs/6IdBSduarVT9HWKLKXjVDH4stoAwYPjJWNU9GyFw/iEqynXBvQryR/oBAg==
X-Received: by 2002:a05:620a:3188:b0:79f:10a:e1f6 with SMTP id
 af79cd13be357-7a1a13cb127mr1059487885a.60.1721669097274; 
 Mon, 22 Jul 2024 10:24:57 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f9cd04062sm35512291cf.40.2024.07.22.10.24.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 10:24:56 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-447df43324fso11221cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 10:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ8I5NpVVY7eJ/+Z8KBrIbHUOduJ0UVKbWvfk68NWue6ZJsYm8Q0tZxyey0YqILiZ1I0Va7Zxrl3FfC9OtNTjsjpEiJWLXJKdLmXEcpEf9
X-Received: by 2002:a05:622a:5b8e:b0:447:e3e3:77c1 with SMTP id
 d75a77b69052e-44faaa81ca5mr5373691cf.29.1721669095913; Mon, 22 Jul 2024
 10:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240717093925.3017-1-terry_hsiao@compal.corp-partner.google.com>
 <CAD=FV=XM7X5J6rzu5gDdmDhJ4Ut8raC92HvcnHmRJmWY7_boSA@mail.gmail.com>
 <CA+hhT3-77s+jjoBGw_fWWjsvO1kDu_JTDHgj=q-pEXcrkzPkLQ@mail.gmail.com>
In-Reply-To: <CA+hhT3-77s+jjoBGw_fWWjsvO1kDu_JTDHgj=q-pEXcrkzPkLQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 10:24:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1=5MLUKOok2mTkEeTkT-r504+f9UJuvErLzVbFq_4Hg@mail.gmail.com>
Message-ID: <CAD=FV=U1=5MLUKOok2mTkEeTkT-r504+f9UJuvErLzVbFq_4Hg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Add panels with conservative timings
To: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Sun, Jul 21, 2024 at 4:00=E2=80=AFAM Terry Hsiao
<terry_hsiao@compal.corp-partner.google.com> wrote:
>
> Hi Doug,
>
> Thank you for your reply.
> The patch has been modified and will be sent to you shortly.

For future reference, the Linux community frowns upon "top posting".
Search for "top-posting" on [1]

[1] https://www.arm.linux.org.uk/mailinglists/etiquette.php


> The timings are set based on the panel datasheets in IssueTracker
> (https://partnerissuetracker.corp.google.com/issues/348109270)

FWIW, if you want to privately provide links to datasheets to me to
double-check your work then that's fine, but the above link is useless
to others on the Linux kernel mailing list and people usually don't
appreciate such links. In this case you could have replied publicly
and told others that you'd gotten your work double-checked and that
would have been sufficient for the public lists.


> B116XTN02.3: B116XTN02.3(HW 9A)_HP_ Functional Spec_0617Y24.pdf
> B116XAN06.1: B116XAN06.1_7A_HP_ Final Functional Spec 0617Y24.pdf
> B116XAT04.1: B116XAT04.1 HW 0 A(HH)_ Pre Functional Spec_HP_ 0425Y24.pdf
> NV116WHM-A4D: NV116WHM-A4D V8.0 Teacake  Product Specification-20240416.p=
df
> N116BCA-EA2: Approval Specification N116BCA-EA2_C3_20231212.pdf
> N116BCP-EA2: TFT-LCD Tentative N116BCP-EA2 C2 for HP Ver 0.2-240502.pdf
>
> On page 24 of the N116BCP-EA2
> datasheet(https://partnerissuetracker.corp.google.com/action/issues/34810=
9270/attachments/57530666?download=3Dfalse),
> the value for t9 as disable is "null".
>
> If I have misunderstood what you mean, please correct me.

I've double-checked and this looks fine to me.


-Doug
