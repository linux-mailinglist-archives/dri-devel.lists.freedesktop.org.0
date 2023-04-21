Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B316EAF8D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF7710E26D;
	Fri, 21 Apr 2023 16:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E53810E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:52:07 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-5f3da4f91a0so10521736d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682095924; x=1684687924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnl878ao3KfZM1Schc0iPqmLuMtCb4QrPUJTPEHHzyA=;
 b=Sdr6Dvoc/XHT+PqjiGl3rx+uMfzNNi8O+HpayUOhe8pFOq3uOT3ftrK9qxxNCJeiUT
 VXwu9DgNld1DFjhld22SR+4O+brNOtpGIuaomYbSadwaXtWSwr/7RBIgGgfKnucs0Kty
 1DmW//s/n4EM3kMN8zJe0PAV00j+Mpr3ZO13k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095924; x=1684687924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnl878ao3KfZM1Schc0iPqmLuMtCb4QrPUJTPEHHzyA=;
 b=blT1UaN9IRYEHdHuCrWxgw2iFEewcfr4LLmeWQm6HxdcO4Oo5icaBNc5U9Rllgs0el
 NFk0MmjvYXZ9D+8HzaqDJayjdgGJlvtvdww52LGaVgCmmZPJ87EeSadyvlPqg9fBuehH
 1Qi88nDQG9rFVVTjyIzPwQfjGnFTtdz0wIEwQRo3ipURk8gqjOT50mLlAvzgkAuMnBnT
 yagTZVIdikx3i/gtWD9vnif+smo4qY3UtU93B6q229oW1eosjCkz/xLJGjbDpBsgItcD
 J7zcc9wfDqv0K0J+W5qEe5L+la4qcUyT7WcZ2AIetccL89n6XJXkadbMi3gxubO+zOsy
 MW2w==
X-Gm-Message-State: AAQBX9d8TFkbX4jG0z3n4JZb51L3wrcL6eZccWTBrqNv79dzn0TY7QZx
 ULq7q+Z1cs2v52+ucEIUWGG6oSe8LtnbI+UMYkM=
X-Google-Smtp-Source: AKy350YLzWAWR8JTBg6Q5SOAm9ynwKgpdqPBLxCKanv7Iynp3abJHKuNzkaz9RX4hPsgyYnZ59HRdw==
X-Received: by 2002:ad4:5b82:0:b0:5d1:acb8:f126 with SMTP id
 2-20020ad45b82000000b005d1acb8f126mr8042689qvp.38.1682095924219; 
 Fri, 21 Apr 2023 09:52:04 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 j12-20020a0ce00c000000b005e9a1409458sm1287451qvk.71.2023.04.21.09.52.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:52:03 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-3ef34c49cb9so1177871cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:52:03 -0700 (PDT)
X-Received: by 2002:ac8:5811:0:b0:3ee:d8fe:6f5c with SMTP id
 g17-20020ac85811000000b003eed8fe6f5cmr361276qtg.1.1682095922914; Fri, 21 Apr
 2023 09:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
 <20230201-innolux-g070ace-v2-1-2371e251dd40@skidata.com>
 <CAD=FV=XJCtqep+92h3gLfs4o2TwvL4MORjc9ydTSpZiZ0dsR0w@mail.gmail.com>
 <fb93e95f-181f-917d-9216-a81dec1a2959@linaro.org>
 <CAD=FV=Vs8UEfBZ56fYb3i1cmFbCSPrbgaedXB4+UvDTOyhzCzw@mail.gmail.com>
 <184f0a80-34bc-5ebf-58bb-82a310eb91f6@linaro.org>
In-Reply-To: <184f0a80-34bc-5ebf-58bb-82a310eb91f6@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Apr 2023 09:51:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLHpddAMo7GQwj98TtDn0xw6UzgYUKyVhSDZw1acKpCg@mail.gmail.com>
Message-ID: <CAD=FV=WLHpddAMo7GQwj98TtDn0xw6UzgYUKyVhSDZw1acKpCg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: display: simple: add support
 for InnoLux G070ACE-L01
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, richard.leitner@linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 21, 2023 at 9:45=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/04/2023 18:37, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Apr 21, 2023 at 9:26=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 21/04/2023 18:15, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Mon, Mar 13, 2023 at 12:51=E2=80=AFAM <richard.leitner@linux.dev> =
wrote:
> >>>>
> >>>> From: Richard Leitner <richard.leitner@skidata.com>
> >>>>
> >>>> Add Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel compatible
> >>>> string.
> >>>>
> >>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> >>>
> >>> nit: as I understand it, ordering of tags is usually supposed to be
> >>> chronological. You signed off on this patch before Krzysztof acked it=
,
> >>> so the SoB should be above. I'll fix that when applying.
> >>
> >> Some people agree with this... but b4 disagrees, so I would say the
> >> tools should implement the right process and right decisions. We shoul=
d
> >> not be correcting the tools' output, unless the tools are not correct =
-
> >> then fix the tools.
> >
> > Ah, interesting. I checked and as far as I could tell Richard had
> > manually added the tag when sending v2, so I didn't assume it as a
> > tool-added tag. I'm happy to let "b4" be the canonical thing that says
> > what the order should be.
> >
> > OK, so I just tried this and I'm confused. I ran:
> >
> > b4 am -P_ 20230201-innolux-g070ace-v2-2-2371e251dd40@skidata.com
> >
> > ...and when I check the patch that b4 spits out my "Reviewed-by" tag
> > is _after_ the "Signed-off-by" tag, just like I asked for.
> >
> > Just in case Acked-by was somehow different than Reviewed-by, I went
> > back to the original version where you added the Acked-by:
> >
> >  b4 am -P_ 20221118075856.401373-1-richard.leitner@linux.dev
> >
> > ...and, again, it matches the order that I thought was right. In other
> > words, the patch file generated says:
> >
> >> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> >> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> We talk about `b4 trailers`, because the tag is applied by the
> submitter, not by the maintainer.
>
> >
> > Did I get something wrong in the above?
>
> Your `b4 am` will of course put the tag later, because it is you who
> applies the tag.

Ah, got it. So I guess from the perspective of "b4" every time the
author modifies a patch (like adding new tags to it) then it's a new
application of Signed-off-by and thus the old Signed-off-by is removed
from the top and a new one is added below all the tags that have been
received. Thus if b4 grabs all the tags off the mailing list for
applying it ends up in a different order than if it grabs all the tags
off the mailing list for sending a new version.

OK, I can understand that perspective. I'll keep it in mind.

-Doug
