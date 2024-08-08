Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147694C4F3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 20:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9517C10E7E2;
	Thu,  8 Aug 2024 18:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="i3+u5Zr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C58E10E7E2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 18:55:26 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6b7a0ef0dfcso7188286d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 11:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723143322; x=1723748122;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ia3gn65ZzmXsv1RewV6q6A0e4ePY6aOjBbUhD4zPmes=;
 b=i3+u5Zr+8/hTIFg6lpCryJRzEDB5SKL4xlPknZtSwQ2zJNEavs2iYppzIAiLbHtQ+M
 ax/ul+XZgo+AwxAGTmPF8ArLYY/yD5SEDFBQZX+Vl1+ygTHMpDaAk7VH7wuKvc+8bsc4
 BQ22VOysSTTsZiDGtdYUQrM7Z/BlIc23hHWZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723143322; x=1723748122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ia3gn65ZzmXsv1RewV6q6A0e4ePY6aOjBbUhD4zPmes=;
 b=RTsywV5ZC9uIU0UHldfbVfwJoa+dTWAlTXY4hnJooSbaxjx/7zXQIq9jMYgRYPIzfZ
 8F2htACDfiEInM4rvucVS6TM+WT81nMTfdfh4wMOl31tuNv51rZvULl3MV94L3yk+1AA
 iwzoSP17nTA10PTnl9G3qw2APDb+RYDWn9d5J6wcORXkP/dgpvt28DpxScBjuuWnvBto
 ATLxxUTuz6uGmqfp3fNgyN0kbNEae1ynU9+4w9G3D/KIVqg6K5MyW+gBpUT5aoLd8P0q
 IPq1YwIz/UJR6mrdNbYVGHlALTUpKmhhOuvYSSESLRCd72MUt6CKCIyZ+GC1dQK4m3Zs
 j85w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx/wEtWRWk/TZ/42eGhCQ0uzkmYI5yhAEvXK/gWYUJt0ILGOS+S2fItMDA9iW4r7r2ekQLELHzNewwy/Z7Hw3lyN+SbB43+4DR4aJXu6HD
X-Gm-Message-State: AOJu0Yw3lEnAJF4dL4N2lsxrZAubtHiITZ5veJkYVu2gOODXbN/S3F67
 JinoBu64ZrhUuOEnsUur3GEjioEboftpBKlwPTz4T8xRDW/H3kciYJK05SHQBucLo64rICnVr8O
 T+e6x
X-Google-Smtp-Source: AGHT+IFQX1h9JG3MOrH65Tt/XuRST7JuL80fQMqqrjqeF0yHMxn7xwbmY/xqDWAYZKvjjwGh+C7CFw==
X-Received: by 2002:a05:6214:5b0d:b0:6b5:17a2:887c with SMTP id
 6a1803df08f44-6bd6bcc329dmr38278896d6.10.1723143322274; 
 Thu, 08 Aug 2024 11:55:22 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c7b82d6sm68922096d6.69.2024.08.08.11.55.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 11:55:21 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-44fdc70e695so48441cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 11:55:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXjOQZ5QpkEii3ac3GHaTWDBJpGfxi6D2z0Tp6NH5KYFWrMNu0x/1dlTZNbzLFGBPwGv1wiekywiIIamYahtLBrv7DvVVJWCDLp/gHGrlyX
X-Received: by 2002:a05:622a:5797:b0:447:eaaa:c852 with SMTP id
 d75a77b69052e-4530de62980mr344201cf.23.1723143320261; Thu, 08 Aug 2024
 11:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240808114407.1.I099e8e9e36407a0785d846b953031d40ea71e559@changeid>
 <CAJs_Fx7GN1_2xAM0Qg8oezQ2Foxy2smOXb3zMhNiJxCDMPUNug@mail.gmail.com>
In-Reply-To: <CAJs_Fx7GN1_2xAM0Qg8oezQ2Foxy2smOXb3zMhNiJxCDMPUNug@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Aug 2024 11:55:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xt0_yhVGDv3X+uZoVQ-_Wiwq4ENJUpi6__J6dN_aMm0g@mail.gmail.com>
Message-ID: <CAD=FV=Xt0_yhVGDv3X+uZoVQ-_Wiwq4ENJUpi6__J6dN_aMm0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel: samsung,
 atna45dc02: Fix indentation
To: Rob Clark <robdclark@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Aug 8, 2024 at 11:47=E2=80=AFAM Rob Clark <robdclark@chromium.org> =
wrote:
>
> On Thu, Aug 8, 2024 at 11:44=E2=80=AFAM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > The yaml had indentation errors:
> >   ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml:21:9:
> >   [warning] wrong indentation: expected 10 but found 8 (indentation)
> >   ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml:23:11:
> >   [warning] wrong indentation: expected 12 but found 10 (indentation)
> >
> > Fix them.
> >
> > Reported-by: Rob Herring <robh@kernel.org>
> > Closes: https://lore.kernel.org/r/CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90B=
V_OZn4mK+-82kw@mail.gmail.com
> > Fixes: 1c4a057d01f4 ("dt-bindings: display: panel: samsung,atna45dc02: =
Document ATNA45DC02")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Thanked-by: Rob Clark <robdclark@gmail.com>

Pushed to drm-misc-fixes.

cd9aae921ab6 dt-bindings: display: panel: samsung,atna45dc02: Fix indentati=
on
