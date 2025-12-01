Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5460EC989C1
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 18:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287EA10E43D;
	Mon,  1 Dec 2025 17:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jfzYUP7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D3F10E43D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 17:52:56 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-64074f01a6eso8134710a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 09:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1764611574; x=1765216374;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+t3WyfrUncDVsjkdBLbauFOskCwdxza+DonH+evbxvc=;
 b=jfzYUP7VvtyKtpDN1rd2Lh8/sIlWlyt8bJnfpvl635j+6VHdUwlrsbCl+lUD15D0Cc
 equBtJxw2UbpxQ1H/oD3DZvTiKHNtf93Y9dyNAw+xIociLWzgPyBZgNzuKL7U7qcL8Wg
 JKYHxjP1WT9gcZC1EptjEtkBrP08uzLA/y+VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764611574; x=1765216374;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+t3WyfrUncDVsjkdBLbauFOskCwdxza+DonH+evbxvc=;
 b=iBYwsO+3+o/cpDnpEZuKebh2ldVEACJrTEMwJkHeGe+Wl7vmrKk50i3F+prviQgKYK
 YNc9Q/FdCxW5RJC0kdLZrfSD3LzCYE2qKzYhocLlTuZLMHsZGqsdkiPFbTSjM+Rb1MrK
 eyRbm/WpQOJyqa0tk835gRbB3zrvcdBC39w0ROHTpDOBJy5uAh70wJovUt50hC2pCTFl
 uZXsSu2Cy+EMK8PD8gCp6EaqbIJcEhYOBFVyetO4wyAxtuxA0WTKXdfXOPOM3OU9Qb9P
 OjRt3WbZpKEwGtTLpYJNA8HMLFNlMLj7HI9opOVxIcG2G4k5Taf3scqVfU1Ynyj04AC4
 8lmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7MB3xbmmUkOuD8C6CxRFpY4yn9FeDo9+koCx7hz5sjuqKIWW3bww9zc8HyIWYhndRtL2JgdWcZi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcSGHX2LuBWXZqWwwJNfAZxNHIhpYAqMXmkMWbMtPVkB0Lx5ZH
 7tJRdaTL+SrSPfs095TcZHXraObvk7H0JDHQXFw03NbypcetcrJuoBqEIPwyGWxlEaYucuxfquz
 sIyPqUwSv
X-Gm-Gg: ASbGncsnwSaLdbXea/9sKAi4JKSD01RTuJW9nXyt/R71/xuIUoNv+ZdYwUOg2OIZHwj
 AWrHvR77HPixAPqvqotom0Lxwi/3JCPb/Yt8d7lu7gRrn/sZ8vfE5TycQxJZd0yE7GiMH2dQ4eL
 ciet/Tm9HkgX3XCroRNYc8QOQ9vcLHBU0NZHIS3BcmnjiTSrvd4bXwS99umlJpdyRaUvqAp65vG
 z1XUnnYL7gfSHGf9ttj/7gW2ehjM9zE8SGayE6JfkjSFnyADYhq4zRKPX5rxNTvKmv9mNAF5R5p
 QvV+PYzcttGQXmqjWEs4HFgmVl5d3/j6PU1MpPfnLTTTNKChmMDNcvu3iZBDFH72ALai51CB113
 2futg2I6iKnNSB0Or/YVnlMz3YiAkQo903cRbj2FZQogEWuwTjVNbz8p2vvDukHdS692hdPPxJc
 95YIap+l6C+NTau+4m6CP0nnKpyB1QRVPEjvNE7aFCpt0HQDjJhMWUcQjWogZ2
X-Google-Smtp-Source: AGHT+IEffeX+1Ibs7sDv8WvV2Od9qT8VHQ2zP2+v739hgiyak1iPiPlb4MZf4KOIM4Xt51e9pbQHCg==
X-Received: by 2002:a05:6402:51c7:b0:641:6872:8857 with SMTP id
 4fb4d7f45d1cf-64555d2fc70mr37132769a12.34.1764611574435; 
 Mon, 01 Dec 2025 09:52:54 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64750a6ea36sm12969485a12.2.2025.12.01.09.52.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 09:52:53 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so25841285e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 09:52:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWeCIeRxwB1NwOdwVx+XdbcyZr7F/K9TkYYuuDX8Ig7CP63NdEMRXWjZ+eMUsjNz/YfPrdAr33v5Kg=@lists.freedesktop.org
X-Received: by 2002:a05:600c:4ed2:b0:477:9e10:3e63 with SMTP id
 5b1f17b1804b1-477c1164cebmr369919515e9.35.1764611572764; Mon, 01 Dec 2025
 09:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20251130-sony-akari-fix-panel-v1-1-1d27c60a55f5@somainline.org>
In-Reply-To: <20251130-sony-akari-fix-panel-v1-1-1d27c60a55f5@somainline.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Dec 2025 09:52:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VM18TOB70vvn05XFECsaCkj9=0sjqsKJQo7mfR=NZ9=Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmP4gsrdifZMMsR0YcBfbJWCt8JyJt0iJXOYDAkFhvKs0FxR8muX9iMfvI
Message-ID: <CAD=FV=VM18TOB70vvn05XFECsaCkj9=0sjqsKJQo7mfR=NZ9=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: sony-td4353-jdi: Enable prepare_prev_first
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Martin Botka <martin.botka@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jami Kettunen <jami.kettunen@somainline.org>
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

On Sun, Nov 30, 2025 at 2:40=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> The DSI host must be enabled before our prepare function can run, which
> has to send its init sequence over DSI.  Without enabling the host first
> the panel will not probe.
>
> Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI h=
osts at modeset")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
