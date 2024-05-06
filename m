Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5F28BD214
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 18:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954F510F10A;
	Mon,  6 May 2024 16:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SRXzoZEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D1810E689
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 16:02:33 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-78f05341128so175466185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715011351; x=1715616151;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5H9ldalJcbmvgPRS+HnifHYCRDDP3C7W4j1Jjysd7U=;
 b=SRXzoZEqDikYkvGuTJpgnx/pXcGIJIW3inYvpK1g/oF98pGNOtgezg8NRxjag8C3If
 0N+H6byg8qEzTwUNdjPzZrc37YSMnlKz3mZRK1LjTwqFKqMJAWU5a5rsggz5KmoUZ4Lu
 92DkgUaYcRQ3ZrF20eLg88NfGDgqOlxKA9Nyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715011351; x=1715616151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5H9ldalJcbmvgPRS+HnifHYCRDDP3C7W4j1Jjysd7U=;
 b=Xt8z1bJZGVT+K7t3MHULie4idkuyucTUusN6DGD5wndJUnJIohwe/SCFAoY5tP8nrC
 qKVNjZoSElVembSNGTUc8dw8VdfqwQopM0xtPqCYDb9TcE4Yd07UZkxGehH78CCHxqaB
 7KvR1klXU+n0cXa+mm2ZvMHXiOlzTRSLGKZTbu/jl+cBf2R18TQgGeiJtQ7a2oE4bfEF
 gMcirNdR/LBNpak7OGc9tesdeeT0brn9Ba8JuZFWhvuEFwJr4Vn45lR3F5y7KJs3AdOj
 Lh17nDRSeVOSTTBnPR2qMtAntF/uNigLSrb/g3+5zEwM5uYv8rX2246vO6u2KGDXmDLH
 Uv9Q==
X-Gm-Message-State: AOJu0Yz1jKqsEYKjBXRqxbF6eFmAv16ndjno3jByAna3uOUqV1MOqCSf
 p3yNIc/QFdlHuBSUY/8YYLagwp2nts2CBzcRFH8oOl0Q4SzwyZWbAmn30NmVSLAPpdMovDJSkTQ
 =
X-Google-Smtp-Source: AGHT+IEE3W4c+IrL1ZaAE0sMsVagB9hSlxWFw0UecZ5HTzpEu7n9QNCRW/BxK8QISyQhYKCpU9BVng==
X-Received: by 2002:a05:620a:309:b0:792:9b08:e37 with SMTP id
 s9-20020a05620a030900b007929b080e37mr2638686qkm.68.1715011348389; 
 Mon, 06 May 2024 09:02:28 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05620a240600b007928d82c49fsm2180806qkn.36.2024.05.06.09.02.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 09:02:27 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-43d361a2124so348281cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 09:02:27 -0700 (PDT)
X-Received: by 2002:a05:622a:108:b0:439:a979:ccb2 with SMTP id
 d75a77b69052e-43d031c9bd5mr5684701cf.16.1715011346712; Mon, 06 May 2024
 09:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240502164746.1.Ia32fc630e5ba41b3fdd3666d9e343568e03c4f3a@changeid>
 <CAJMQK-h24xoO6jsYu4NK8ENoA6nsidcF8aN2pCzNMPgmu1NxEw@mail.gmail.com>
In-Reply-To: <CAJMQK-h24xoO6jsYu4NK8ENoA6nsidcF8aN2pCzNMPgmu1NxEw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 May 2024 09:02:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UavcwPud8q57bWGPaJn4z0aP_abuBddhNh8eKVhjF4tg@mail.gmail.com>
Message-ID: <CAD=FV=UavcwPud8q57bWGPaJn4z0aP_abuBddhNh8eKVhjF4tg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add ID for KD KD116N09-30NH-A016
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Thu, May 2, 2024 at 4:55=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> On Thu, May 2, 2024 at 4:48=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> >
> > As evidenced by in-field reports, this panel shipped on pompom but we
> > never added the ID and thus we're stuck w/ conservative timings. The
> > panel was part of early patches but somehow got left off in the
> > end. :( Add it in now.
> >
> > For future reference, EDID from this panel is:
> >         00ffffffffffff002c82121200000000
> >         321e0104951a0e780ae511965e55932c
> >         19505400000001010101010101010101
> >         010101010101a41f5686500084302820
> >         55000090100000180000000000000000
> >         00000000000000000000000000000000
> >         000000000000000000000000000000fe
> >         004b443131364e3039333041313600f6
> >
> > We use the ASCII string from decoding the EDID ("KD116N0930A16") as
> > the panel name.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

Pushed to drm-misc-next:

a6cd27d92a96 drm/panel-edp: Add ID for KD KD116N09-30NH-A016
