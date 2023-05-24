Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F7070FC38
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 19:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B763010E498;
	Wed, 24 May 2023 17:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621F310E498
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 17:10:08 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64d426e63baso1262871b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684948207; x=1687540207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VSiv7FiHooBNjd2z6gDTYmV/eBkw3m7qogP3ovVg02M=;
 b=cBn21TM/emZ3LGvLleMOPDhWdcBdAgazJFhWdQDlw9Ce7iMFCAKmJghPnv4XBIcDdR
 ITpVDovBq7TSsx4KZYQztpOajBwSvK9GpTK4Cm3+ikXo+lJDbHsZADnjLE3IiViUlE3B
 BAwGWLUXrK4ftTV+/Qwj6hknw3zIWVDXiwfj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684948207; x=1687540207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VSiv7FiHooBNjd2z6gDTYmV/eBkw3m7qogP3ovVg02M=;
 b=H2sy0UnLM4zUnCIRiFmX9r2KpBfSgr+2UHjijNx5CRMRUlRvibklhByZdsGLpwaFoT
 EcHOg2MuVkWNO786n1oDanzwOdGZ7Xb/QvV4XogAt7ydXRbMEqAsT3+CET+g453pl4g2
 ++LUrxZoJg/+4k+vdS3tqP+Fh/afkD8LdjuyUxKf5bXO7N2wrp0wMem+SrG3+lpAIlvm
 fRaXgITZltk5YSKV4h8MvpPaPw843XwKLo4Qg8zSc7+vD05va7/iEwFoVqdf0ECWQUwn
 8JaQQJT3t3wMpqKyqfIHoursQmLcLxgik7iEwgVL164K0kr3cD8J9CbxYDq3bGtlnrar
 B9hg==
X-Gm-Message-State: AC+VfDy+SjURcW3PxGUhX9LfeR5CATG/X1hq5HOgbWejAAOklBlxfNql
 gDaBZamYjNxmk9BHesCb5m/JzdkVVnNb3FRnNx8=
X-Google-Smtp-Source: ACHHUZ70E7cePq+cltQVsfjh8rlOpyqC1rc95Ktf6H/i67bsJox2yI0vkGhQBxXGrMNjx6DvG94Twg==
X-Received: by 2002:a05:6a00:842:b0:64f:4197:8d93 with SMTP id
 q2-20020a056a00084200b0064f41978d93mr4763658pfk.24.1684948207071; 
 Wed, 24 May 2023 10:10:07 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com.
 [209.85.214.175]) by smtp.gmail.com with ESMTPSA id
 c21-20020aa78c15000000b0064cb6206463sm6514858pfd.85.2023.05.24.10.10.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 10:10:06 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1ae64580e9fso4195ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:10:06 -0700 (PDT)
X-Received: by 2002:a05:6e02:156b:b0:32e:561d:b42d with SMTP id
 k11-20020a056e02156b00b0032e561db42dmr271821ilu.16.1684947875310; Wed, 24 May
 2023 10:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
 <646e391f.810a0220.214ce.d680@mx.google.com>
In-Reply-To: <646e391f.810a0220.214ce.d680@mx.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 May 2023 10:04:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEeeRopigfbSa3mU1aHyr_ZZCnqR94FEn7YTeiDDJ-YQ@mail.gmail.com>
Message-ID: <CAD=FV=WEeeRopigfbSa3mU1aHyr_ZZCnqR94FEn7YTeiDDJ-YQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/panel: Check for already prepared/enabled in
 drm_panel
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-input@vger.kernel.org,
 hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 24, 2023 at 9:19=E2=80=AFAM Chris Morgan <macroalpha82@gmail.co=
m> wrote:
>
> Thank you for looking into this more. It's one of the last QOL bugs
> for some devices I'm working on, even if the end result is no big
> deal (the other QOL bug involves a WARN on probing a rotated panel).

Glad it'll be helpful!

For the WARN on probing a rotated panel I thought there was some
progress on that front. Commit e3ea1806e4ad ("drm/bridge: panel: Set
orientation on panel_bridge connector") or commit 15b9ca1641f0 ("drm:
Config orientation property if panel provides it") didn't help you?
