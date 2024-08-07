Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5994B278
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 23:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CB810E211;
	Wed,  7 Aug 2024 21:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IzqeWhat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4138610E211
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 21:56:23 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id
 af79cd13be357-7a1d6f4714bso26134785a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 14:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723067782; x=1723672582;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVodnowP0eaUum6OAuR4DXp0pjV1BAajzdmmLHEX8NY=;
 b=IzqeWhat94H01czH4hVKrL1Ib03wQhxApmt9VzNQfuHjPFH2KSPQ+AQ5vZvboLHvXq
 y4nThOYBKi1NFfRaTGoKG5Ivomw7+leaW60RSSfrdrquHuM7Xq7pmRqU+DykmR2qgikf
 C/N+L7WuvputLAT902z4rYiFfn2ce/1NDOgro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723067782; x=1723672582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVodnowP0eaUum6OAuR4DXp0pjV1BAajzdmmLHEX8NY=;
 b=ZA+IhG5+Xv0PB+w2/o8qmG/VZb7eQR5iF2R9RVZu+/0Oglh8iMC2qAF9gmc6nRWY0u
 UGgx4EK/SFmlNek01XuqMiQCSza4BHSgYCYsONz1Gz6pkOt2ianUUsaOPYTlg4xppU43
 dNK7iQW7Vp/9cij5Y10B8EUSw31Y1MRtGaIXYWPy0065YBWj1NxeatxK6Ryy8ATtRO5J
 IquU9OQAY2Duih4ki+Ya5yT5mmjpjgSuQvlwFu32lDr14ymyrNAg+NxwKkfjzSQmTv3E
 pm9XBrOIylxwgPV1o6EY6Q7lUkcfPqeLSf8WjSa7BvZC3H+Eo0/KwfSYjJFLv6DuLyhX
 AzJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMW3RUA2Eukpk2CJ/hZQrdzL2OzixuwKpMr7Ncejy3hSEN6k/XoJZvkVvvOmh0oe7rmDfqD+JKiCQBMDHAzAmAUQ4d8vZ5YbwbyYis8FGG
X-Gm-Message-State: AOJu0YwZe+DNozwcGf2OZqEe1zGepa39pJcnyaotCtcro2CNRbkl1dnc
 mt7H4jzlnRRwWw1tMqbQfYGOCvy/QxscBAEXhUg8Y1n9rW6fqskRbj7gP/AUTpjSb2SyT8t/OTD
 p7QVb
X-Google-Smtp-Source: AGHT+IEsV+3aQ9n5dCofOoste8j4dd9p57D8u++wEg5yCB20H7dhBvhMsExR2jKnPT4GZ9sto02B5w==
X-Received: by 2002:a05:620a:3725:b0:79e:fed9:795c with SMTP id
 af79cd13be357-7a377c313e5mr763052785a.19.1723067782121; 
 Wed, 07 Aug 2024 14:56:22 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a3785f4301sm96888785a.69.2024.08.07.14.56.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 14:56:21 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-44fee2bfd28so57481cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 14:56:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ/MggkmF8D1+T22UIVTZA8agWGwCrMcSfC+9yqLSo7MO73JK2XTIP7EYUoSJAy+aTEr1OMJCqrN8V8lzVCL8ptcNZ/vfXtd1Zf9xNNTqn
X-Received: by 2002:a05:622a:1906:b0:441:5e6c:426c with SMTP id
 d75a77b69052e-451d382a2cfmr401061cf.17.1723067781326; Wed, 07 Aug 2024
 14:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Aug 2024 14:56:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WCw6pAump-PUFCW0cgbRY+5_2tPNLe=hN3-dnXD=B6MA@mail.gmail.com>
Message-ID: <CAD=FV=WCw6pAump-PUFCW0cgbRY+5_2tPNLe=hN3-dnXD=B6MA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Modify the method of sending "exit sleep
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 hsinyi@google.com, airlied@gmail.com, daniel@ffwll.ch, jagan@edgeble.ai, 
 dmitry.baryshkov@linaro.org, jani.nikula@linux.intel.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Wed, Aug 7, 2024 at 3:04=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> This "exit sleep mode" and "set display on" command needs to
> be sent in LP mode, so move "exit sleep mode" and "set display
> on" command to the init() function.
>
> Modify the Melfas panel init code to satisfy the gamma value of 2.2.
>
> Changes between V3 and V2:
> - PATCH 1/2: Modify the commit message and subject.
> - PATCH 2/2: No changes.
> - Link to v2: https://lore.kernel.org/all/20240806034015.11884-1-lvzhaoxi=
ong@huaqin.corp-partner.google.com/
>
> Changes between V2 and V1:
> - PATCH 1/2: Modify the commit message and subject.
> - PATCH 2/2: No changes.
> - Link to v1: https://lore.kernel.org/all/20240725083245.12253-1-lvzhaoxi=
ong@huaqin.corp-partner.google.com/
>
> Zhaoxiong Lv (2):
>   drm/panel: jd9365da: Move "exit sleep mode" and "set display on" cmds
>   drm/panel: jd9365da: Modify the init code of Melfas
>
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 137 +++++++++---------
>  1 file changed, 71 insertions(+), 66 deletions(-)

As per my response in v2 [1], I feel like patch #1 would be best
reviewed by someone with more MIPI DSI experience. My current plan for
this series.

* Snooze for 2 weeks. If someone else has reviewed / landed in the
meantime then great!
* After two weeks, send a warning that I'll apply the series soon
unless someone yells.
* After a few more days, apply the series.

Please yell if you disagree with any of the above.

[2] https://lore.kernel.org/r/CAD=3DFV=3DWrMxyxkuCYEbd=3DaYFaTJKNqGqXr6Re+V=
=3DB_h9jnjHPvg@mail.gmail.com
