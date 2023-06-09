Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408DA729DAD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6610E07D;
	Fri,  9 Jun 2023 15:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EDE10E07D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 15:01:27 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-33b4b70693eso8171415ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686322885; x=1688914885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmJ5zFCWUL2O8tDvqWovVw/cx5VcmioXKAOPxd/sjek=;
 b=iqmpUm+mKMO7GcsMPQqkz8pErGiCCgPEwoaGQnHFa0npgjdGS1ok+2BjuWQyYPX/Yt
 m9cJFNcc8rslmtoVgdI6aHpqEUrl/DNr6HgIY970546c6vSBjw3E1OHF95GgpZ4rPRws
 hWywQhl1V68wnRZ+PFPjF7wd4mHgEWpjQuCq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686322885; x=1688914885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BmJ5zFCWUL2O8tDvqWovVw/cx5VcmioXKAOPxd/sjek=;
 b=cf2YDnDAQfmOxkFz4NFqMb/ho7jTZlRJcnN/TWtXa++OELCWlhUK3keWn/ilXvUAK7
 D1QskHdCljrOKDJ5oX6Ccm/bZ2e6HbZ8Wwq+HFwC/Z7fKFsaKgKhaq9ceF40ca5FVmnU
 klXbPEwRqGs57x4u3q2367POHYP62eMBRmWSNlv8CL4jmMZ8xaCBPFHj1AsIKkAmx2un
 OsN2d+DHoikEWqeXEdoTNNaPPZ3NChp05zSzpAjnzDFZndKpiT2mEu6+6piEUB67Tlfh
 iahwwKR1c8UuRPC8jmVvXEc3PwxUy42yej2n/hhuxNSWhXe+Rznm7EiXNggz75ap95YO
 hASg==
X-Gm-Message-State: AC+VfDzkqVzemGVSx3QHJYDhwQiaFLnwKXaXqQSiEJbz8ucMoJcdK7w+
 ytqXR8S064WlINCr6vXfIYRWYydXGLnm2b4ciFA=
X-Google-Smtp-Source: ACHHUZ7rU9COli18tk/HQJxdCuhsxNUxhcJlhk76ctNZn/n+7G6ObLUskoDlTDslG3h44S6geGGk5g==
X-Received: by 2002:a92:cac5:0:b0:325:b96e:6709 with SMTP id
 m5-20020a92cac5000000b00325b96e6709mr2080267ilq.11.1686322885440; 
 Fri, 09 Jun 2023 08:01:25 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174]) by smtp.gmail.com with ESMTPSA id
 o14-20020a92d38e000000b00331a5fcd648sm1149339ilo.68.2023.06.09.08.01.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 08:01:21 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-33d928a268eso278315ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 08:01:21 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d02:b0:33d:cd39:c1cd with SMTP id
 i2-20020a056e021d0200b0033dcd39c1cdmr397198ila.14.1686322880679; Fri, 09 Jun
 2023 08:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
 <CAD=FV=W-fXpm4JCczrNgAS2M9u2VLd2jAkJvE9XJgQpvoE5rjA@mail.gmail.com>
 <CAO-hwJ+3M1iYgaAFEtf-63U20ccGfdiRoi3197YoZmyvMYsGzQ@mail.gmail.com>
In-Reply-To: <CAO-hwJ+3M1iYgaAFEtf-63U20ccGfdiRoi3197YoZmyvMYsGzQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Jun 2023 08:01:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4aYuLC-8xgSD1VkCGnKEm4oRdYkHSajx7pL8aGu6YqA@mail.gmail.com>
Message-ID: <CAD=FV=X4aYuLC-8xgSD1VkCGnKEm4oRdYkHSajx7pL8aGu6YqA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 9, 2023 at 2:27=E2=80=AFAM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> > I suspect that it's not worth it, but I'll do this if you feel
> > strongly about it.
> >
> > I guess the simplest way I can think of to move this to its own file
> > would be to put the whole private data structure (struct i2c_hid) in a
> > private header file and then add prototypes for i2c_hid_core_resume()
> > and i2c_hid_core_suspend() there. Then I could add something like
> > i2c_hid_core_handle_panel_follower() that would have all the
> > registration logic. I'd still need special cases in the core
> > suspend/resume/remove code unless I add a level of abstraction. While
> > the level of abstraction is more "pure", it also would make the code
> > harder to follow.
> >
> > Unless I hear a strong opinion (or if this series changes
> > significantly), I'll plan to keep things in the same file and just use
> > a Kconfig.
> >
>
> Right, a separate file might not be the best then :(
>
> Do you envision this to be used on the ACPI side of i2c-hid? Because
> if this is OF only, then maybe it would be interesting to put it there
> (in i2c-hid-of.c), instead of having it in the core. IIRC i2c-hid-of
> also has ways to set up/down regulators, so maybe it'll be better
> there?

There is no reason why this problem would be limited to devices using
devicetree. Even if ACPI could somehow magically power sequence the
touchscreen and panel together, doing it behind the back of the kernel
driver would be a bad idea anyway so folks using ACPI would need the
same code. I don't have tons of experience with ACPI nor how to hook
this up there, but I purposely made the API for registering the panel
follower such that the client doesn't pass anything devicetree
specific. If someone could figure out how to detect a link between a
panel and a touchscreen for ACPI and add this code to
drm_panel_add_follower() then it would automatically work for the ACPI
case as well.

-Doug
