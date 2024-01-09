Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A8828A78
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 17:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DBA10E489;
	Tue,  9 Jan 2024 16:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C03910E489
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 16:52:34 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so362556966b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 08:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1704819150; x=1705423950;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZHbFSGdNqTkp4QL+EEPj5Pdc3ELkei7bVgDOsu4SrZc=;
 b=XeU6A/rQyYcCKlSo+zf9df0bq3Oev6TT7OvpjRAqifo/urgKNl6rhJNtdsDDJpZJ7b
 K5Qa3R2bdJT7Jh5nNx41vmgtqYG8+wuvy13J77CQiXuaI5pOroZr/4FT7yYyjoxAODne
 HFAUVxNyRDi0bAOpcK96/9yc/l3zg6oomGY2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704819150; x=1705423950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZHbFSGdNqTkp4QL+EEPj5Pdc3ELkei7bVgDOsu4SrZc=;
 b=YrS49AyE/hji1xfITX9aIwlA+5o3XQLxSE+mheuBghLHc401q42bXNGAy0C6qYADaV
 PB5b4ZURh4swli8U9JaF1Bb1bUXW4cY9i6RSnhOb4OWfkvFIRZ6kAl5cGI6UvsPnbaZU
 o8SdwNxUElSVZ/4RnTpvnvoaT+xZ4vnuG+iZswbEH+7vEqyLZxhtfzumXVbM3pb2U4L1
 MBKvheYAQc0C9HvBXjJ9kQxuXpOnoV0aj+wlIq0oIXs8DFjnCjB4E6NngxKSfecCGmIB
 X+LLe/QDTbQrn2mYEtNbnx+ZqzkIJ034OtV1bC/M9YBnhJp7PQyqJiygwMQldK9xRs+g
 E/TA==
X-Gm-Message-State: AOJu0YzMPvb4xgC9dBhc+1iQF5o0+wm+VfA0Xh5o3PcK4+Ep4TDB54AV
 7fykdNd6/5fjld3Jnu1zJnAkWnO/p4yX8t27b2JxIjyHKZeF7DM=
X-Google-Smtp-Source: AGHT+IGgEzQKylzb6L2lGUvfn6BVvGZyvPhgmdZrNiafG2S7wFP4rYrsjluDPugOR4xfNhTepR6cUg==
X-Received: by 2002:a17:907:318c:b0:a27:76cf:103a with SMTP id
 xe12-20020a170907318c00b00a2776cf103amr473632ejb.136.1704819149962; 
 Tue, 09 Jan 2024 08:52:29 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 la3-20020a170906ad8300b00a26aa8f3372sm1225508ejb.27.2024.01.09.08.52.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 08:52:29 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40e43e55b87so68585e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 08:52:28 -0800 (PST)
X-Received: by 2002:a05:600c:3b2a:b0:40e:35d0:1fef with SMTP id
 m42-20020a05600c3b2a00b0040e35d01fefmr15464wms.1.1704819148582; Tue, 09 Jan
 2024 08:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20240109120528.1292601-1-treapking@chromium.org>
In-Reply-To: <20240109120528.1292601-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 9 Jan 2024 08:52:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WjjH3BCDf-OnX=zdk201uMu+YJvKVBhVmMa4GqNinacw@mail.gmail.com>
Message-ID: <CAD=FV=WjjH3BCDf-OnX=zdk201uMu+YJvKVBhVmMa4GqNinacw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: parade-ps8640: Ensure bridge is suspended
 in .post_disable()
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 9, 2024 at 4:05=E2=80=AFAM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> The ps8640 bridge seems to expect everything to be power cycled at the
> disable process, but sometimes ps8640_aux_transfer() holds the runtime
> PM reference and prevents the bridge from suspend.
>
> Prevent that by introducing a mutex lock between ps8640_aux_transfer()
> and .post_disable() to make sure the bridge is really powered off.
>
> Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power man=
agement")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
> Changes in v2:
> - Use mutex instead of the completion and autosuspend hack
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

This looks OK to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll let it stew on the mailing list for ~1 week and then land it in
drm-misc-fixes unless there are additional comments.

-Doug
