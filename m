Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAEA8C0776
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 00:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E063A11324D;
	Wed,  8 May 2024 22:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Cfc0J/Jw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2091B112EA2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 22:47:18 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34eb52bfca3so203153f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 15:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715208436; x=1715813236;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EwxEO1i5UPI2XEISzMMX9ftGaU8p/mPogEOhXcQuJ0Q=;
 b=Cfc0J/Jwn3v1BYSTN9339Crx/7+oHwnS69cWO1ZYlPFQwPqC4rJdwRWmL8OwdFQ7x/
 y04pRxkpdzBtIzBt6qa8Di/kPNslJhrmUExab/MJb8hmX13bsxme/LkOfZatV6yUX5us
 wjVajsiynvMkkSY+WvVIajIL89xqX7+VN0G6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715208436; x=1715813236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EwxEO1i5UPI2XEISzMMX9ftGaU8p/mPogEOhXcQuJ0Q=;
 b=SVmYHQqL1EosijctaKuIA7t1eVNHqvf61cd5WkD/H0/jUsoDwaNkthOdkrbK64OA1i
 PmRi/nYeerHSTpjdNwFSSOGxh1nnfSjvZxSVV86j9Boj4yCRG5z9hBhb5jd4wiFN3Hdc
 iy3Meig9gF0WoqPouxrqRFjDfBWZUqZZJLJvq7zQtPDx7JDWP60J0WBwF1ZZY6Kfdn+I
 gUtnj+szq611FyvdKcaz18Bi760ckOCbXHHOiQ6OKgxYPvNSz3rtq6dIomMc1XhexNN7
 6bzaIY7Y1zeKyBdImhLy9/8YlPNtcsPfbH+1wm1Jy3l6sRDkNYsnCXChHG+sV4WwKq/3
 imFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhrlvsAXik4nNfNtxV7LRTiO2xVmzvONTsv3Hvw2khAC9mWMuv5r+r0lr26ig3IkHazd77O1WgZKzkywz2nPQdQ4bwq2IAR+rn4WXT0Lqv
X-Gm-Message-State: AOJu0YxIUTeOqqL4BRpJ023TfMVs8WHOLAlmhpq88Vig95dQo2q1fneJ
 foMtK8Nw015nJmk6Ua8VwfxK/7bk1aXblSZohbvSSbDYvyea5zMmPg7Ns452t1rR+qD+PGtuYbD
 R3K3X
X-Google-Smtp-Source: AGHT+IEDjUP4DOCFSPqe3lfUh3lX4c5FzIdlXofM6/5w2dhVxB2BKstLORdZQTMcs+E59qGMfgHmrw==
X-Received: by 2002:a05:6000:a8c:b0:34f:3293:83d9 with SMTP id
 ffacd0b85a97d-34fca80dceemr3635431f8f.57.1715208435947; 
 Wed, 08 May 2024 15:47:15 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d5f9sm9259466b.17.2024.05.08.15.47.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 15:47:15 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5724736770cso1963a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 15:47:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtf+4nCAsHYTJBpENq5FXXkY0lL00bAGOkO+u5VkAIuDu/8pvcDOdHrVss2MC6VjAGVWUYyODXTmUYiprqYN1p+pGfaR9JQMtNejXWHn1P
X-Received: by 2002:a05:600c:b5a:b0:41b:e416:1073 with SMTP id
 5b1f17b1804b1-41fc27b0e81mr775855e9.0.1715208085721; Wed, 08 May 2024
 15:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-1-f80a60ce21a1@linaro.org>
In-Reply-To: <20240503-fd-fix-lxml-v2-1-f80a60ce21a1@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2024 15:41:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnpS-=CookKxzFM8og9WCSEMxfESmfTYH811438qg4ng@mail.gmail.com>
Message-ID: <CAD=FV=XnpS-=CookKxzFM8og9WCSEMxfESmfTYH811438qg4ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/gen_header: allow skipping the validation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
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

On Fri, May 3, 2024 at 11:15=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> @@ -941,6 +948,7 @@ def main():
>         parser =3D argparse.ArgumentParser()
>         parser.add_argument('--rnn', type=3Dstr, required=3DTrue)
>         parser.add_argument('--xml', type=3Dstr, required=3DTrue)
> +       parser.add_argument('--validate', action=3Dargparse.BooleanOption=
alAction)

FWIW, the above (argparse.BooleanOptionalAction) appears to be a
python 3.9 thing. My own build environment happens to have python3
default to python 3.8 and thus I get a build error related to this. I
have no idea what the kernel usually assumes for a baseline, but
others might get build errors too. I don't even see python listed in:

https://docs.kernel.org/process/changes.html

...in any case, if it's easy to change this to not require python3.9
that would at least help for my build environment. :-P

-Doug
