Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81D92ED7C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 19:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B2010EB0C;
	Thu, 11 Jul 2024 17:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EWpQtbQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5AD10EB0C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 17:10:33 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-79f17d6be17so74486185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720717829; x=1721322629;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMrodmUyUKlhvfzT8TSP1NFfD9HljVlU57hBQAsrNU8=;
 b=EWpQtbQCXbYUPhskJTXd3J6pJYszMpaQ3AXe7bY72OTfAamPkWgtpKmNN0V9rr2zGE
 LShkINorPXEK5cj/S4cE0uRy1LlyPWlBIU1nPpSsVEMqikofl0OQ9LbejERnLiWqjEuy
 3l6qCrM7QZCOjphMXRt2HipPz89SZa92q809k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720717829; x=1721322629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMrodmUyUKlhvfzT8TSP1NFfD9HljVlU57hBQAsrNU8=;
 b=pXlhrqSPGfy6Ia4d/WKVCFd8TXK2p2L92VQbnmjaCe2rp4xz1StiXfRDTeHq0w1RYJ
 5vG/VfNofj1qNPqZJVQVmW6CL5klG0fBeLSV1xhEKDNyE5Ka2NcElUv7iwrKqRtVH8OO
 c/dOIRSBl0ynCF7X73c0IepAWjc3pT+vQY57Zj2mkwyoPdZe47E4CcmxCYjdwJhXuDD0
 po0+luDFwhO4SjiwJQyCfwlqB1aETSNPPUqPi79T5paTzOPoc+RBd6Od9GdEuWGNuwD7
 mI8BoOdKmQaW6o0Exuw/Kff3VK7LgwwQxs0/2HPVVJrVfBLIpmKhx1ObEczigHBNRP+Y
 XjvA==
X-Gm-Message-State: AOJu0YwL4AEPcdwgP0NEPJeOnZn7/PFZVITfGqvb1f5GYErOCR/qsg4p
 WpP1s9iZAQiSDnqe+QHSJczB/WAqasag/3rWyqhZt+4emhRRf/Q0W+z+miVE9yZZWdDpuFtkWR0
 =
X-Google-Smtp-Source: AGHT+IFUGuJ0LYLhDvS9sgQLNAm3MJcTKKq9Sa9sM8TvGcbmJV2tHwa93NrMWbV3o+qTU6R5BfVHiA==
X-Received: by 2002:a05:6214:1cc1:b0:6b4:ff58:854a with SMTP id
 6a1803df08f44-6b61bca13a0mr110736766d6.17.1720717828989; 
 Thu, 11 Jul 2024 10:10:28 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7544607f8sm1473486d6.63.2024.07.11.10.10.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 10:10:27 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-44e534a1fbeso4841cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 10:10:27 -0700 (PDT)
X-Received: by 2002:ac8:4a15:0:b0:444:ccc5:f4c0 with SMTP id
 d75a77b69052e-44d35468174mr3719571cf.15.1720717827112; Thu, 11 Jul 2024
 10:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240710190235.1095156-1-hsinyi@chromium.org>
In-Reply-To: <20240710190235.1095156-1-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 11 Jul 2024 10:10:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W_KS2KXVDLFpNcgYpT9NJwNW-S-3nWfpfT-gibJVJYcQ@mail.gmail.com>
Message-ID: <CAD=FV=W_KS2KXVDLFpNcgYpT9NJwNW-S-3nWfpfT-gibJVJYcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NV140WUM-N41
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
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

On Wed, Jul 10, 2024 at 12:02=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
>
> The raw edid of the panel is:
> 00 ff ff ff ff ff ff 00 09 e5 e8 0a 00 00 00 00
> 2a 1f 01 04 a5 1e 13 78 03 fb f5 96 5d 5a 91 29
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 9c 3e 80 c8 70 b0 3c 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
> 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
> 4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 34 30 57 55 4d 2d 4e 34 31 0a 00 26
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!

[1/1] drm/panel-edp: Add BOE NV140WUM-N41
      commit: 993d36ac99efeafeb7b5f12353def6d7d20d6389
