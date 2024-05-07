Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D68BE8EE
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9D011250E;
	Tue,  7 May 2024 16:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="d2YlvjJ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8790611250B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:29:27 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5b20318a866so1709400eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715099366; x=1715704166;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmBmzg39oPwlHH3+Q/yrquaQKff44gbWHvBa/1NwxMw=;
 b=d2YlvjJ1Bg8X2ncDRprjX+d6f6sU1N+FZp4mjBNQkqMxOrghMrchpHyDhdMcySERKf
 KFi0Rz+nEewSmkeewkQmH5UJGLWMXiWOOnj4TbXAJTx2qLaydWcPf6McZJAss/Tn+b7m
 nsmJxJLNTH2uVSquPq/lm3NpUY0/wUwO+aLys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715099366; x=1715704166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmBmzg39oPwlHH3+Q/yrquaQKff44gbWHvBa/1NwxMw=;
 b=BiR6OdNhUlNI/fs/qcsOkX0zswV2Nxtgdhcgzyi1QkJ291rqmptAuKnS3SJMJZglv0
 vCF6a1VXE4UxPhwmDqwv8dSzSr778nGdAglwXjMrIOXgkfr/EwAs1hIxRRrhglOXCFCz
 PR0UDKadpCtNvtyaetrYBZSHNybzi9KAHnsOyQot2HAielxUiz4Qf8+o6W8HCBR5p7X2
 XOVZr1SOAq9S4SHW11UcusQ8UEBxIuUHpUGCLp8S9BiN4oMAZaR7JqiaHPHqdwbJqZIa
 VVwUpDa38kTxxbxC0vg/mnYYAOhmZ4l1Ai3E6JOFTuoWdw6eGcHhnpZWdJPbikHCZR5U
 5yQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+v282GqHxwahSeMA29r6FcyT4Ggp8Cqlx7oN72Qua8tb8uPKacA3ekjmlALqFc60fL/R6e9GcS8vqgOIELKERK8tMX0SPYHyNQ2hWXaD4
X-Gm-Message-State: AOJu0Yyq0ZE66RmMziuZF+bsuqc0p5ZbOSzM7lutXwFhIxeMJc7wlfcQ
 9nriuiZEwwKEiQWFxwx8JNs2rRbzRQYReLjcOHW0g8l362c4CUxMWzZVWU/nHj2qpYwMnbPNwi8
 =
X-Google-Smtp-Source: AGHT+IFPhJMxX8bOhcD2J6R+wive5+a7kLz1wKh9b13062b2CEg7UZxKZfw28AQH93xo/R7n+hj69w==
X-Received: by 2002:a05:6358:5206:b0:192:47fd:8bf9 with SMTP id
 e5c5f4694b2df-192d2a137b7mr25428155d.3.1715099365973; 
 Tue, 07 May 2024 09:29:25 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 fa10-20020a05622a4cca00b00439a1bdb6e5sm6590842qtb.17.2024.05.07.09.29.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 09:29:25 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-43ae23431fbso1131cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4l0YJsy8aEyy43FgyxpscrL921uVUm7HCDWipPsxkVZe6YkA3537Fw69TnEK3b3Bb2coOC1zzUCXRmhrXCiQNhN9gERGN+FnABrN52QbV
X-Received: by 2002:a05:622a:1243:b0:43d:a002:b with SMTP id
 d75a77b69052e-43da00202a4mr2608201cf.9.1715099364710; Tue, 07 May 2024
 09:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
 <20240424023010.2099949-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=VFk3epSxksh+n_LupTiZp=gK=LB2NESGy5iNF=5xFAmg@mail.gmail.com>
 <CAHwB_NJMWR883kjshtfBFuDBcM9Av87Fx2Jf4d=3_5LLnhUFXg@mail.gmail.com>
In-Reply-To: <CAHwB_NJMWR883kjshtfBFuDBcM9Av87Fx2Jf4d=3_5LLnhUFXg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 May 2024 09:29:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wjgc4F2zMhzeLY1hmRN1PTjEpZ7nbYBCp8RPMM7LhPbg@mail.gmail.com>
Message-ID: <CAD=FV=Wjgc4F2zMhzeLY1hmRN1PTjEpZ7nbYBCp8RPMM7LhPbg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

On Tue, May 7, 2024 at 6:44=E2=80=AFAM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> > Speaking of which, some of the panels that you add to this driver seem
> > to disable extended commands at the end of their init sequence, but
> > this one doesn't. Should it?
>
> I  have confirmed with himax that disable extended commands  used
> at the end to prevent accidental writing. And our inital code has been
> confirmed by himax before FSI. Considering that this has been on the
> market for a long time and there are no feedback issues, I think it shoul=
d
> remain the same as `panel-boe-tv101wum-nl6.c`.  What do you think?

It's fine with me to leave it the same as `panel-boe-tv101wum-nl6.c`
had it. At least it should be more obvious to people that there's a
difference now. ;-)

-Doug
