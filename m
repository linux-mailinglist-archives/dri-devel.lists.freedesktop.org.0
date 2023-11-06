Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1AC7E2EB4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 22:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C6510E424;
	Mon,  6 Nov 2023 21:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DF110E424
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 21:12:46 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5431614d90eso8214189a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 13:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699305162; x=1699909962;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5fUcm+yN6XAMjy25ZogKbU2Yy8ZDqJ+sIhPAHGmb2ZM=;
 b=lL+egcKClcKrsMgZP8LdFm+jweaYiUoX5IRq6DycR2oK9jNcj+PT4HjSV+lfYZazf3
 y/9HNMX0LBuXEbKsUFAcYyplliCL2G59SdZkS5iyuqB4AhgR2IpZv1P89IVPSDdDgbNz
 YFqn3V89ggoXPWa69PRtqZb/Bi6N5Yf2FrpxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699305162; x=1699909962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5fUcm+yN6XAMjy25ZogKbU2Yy8ZDqJ+sIhPAHGmb2ZM=;
 b=vU4ULYD2IZx4jenwhhvR5lX46/MRUdNkyD975caS1WBaTFInl1idhBxSGjlZ/NYAKU
 hns96QZcOJmDRmHv0tvc0+M4wdQQoUYbSqj4WyshuJoESjM2/myXu6E9w+6pX8GONC5u
 /ZE9lTFnzGMmNmosd8kewY5w2xdKpmYUo6xomIktfyZwjOcj2IRaJKWym25x0vO47bd9
 JXBFpk8CdueCNPKBz+jwZSSOtws+LHmnC3Coj+W1H9bZWatNjRgDZt91pf+6Bp4i0BG2
 u8esclTf24esR05YfGYIjsIgWlKIGnp5Ku2Cnqivqa/0l5sRzO03nNCoktMBDXCsbvpA
 faJA==
X-Gm-Message-State: AOJu0YykhmrjbFq3KgpLloRwhfBXYErm0E+tCMpJBVWwZq0pqiWWIeUb
 m1DfWbtZoNFXINo4lwgp57k0LrL7pA+q3GnVmCXXmPHs
X-Google-Smtp-Source: AGHT+IG4NoT5OGIAmYMRS+iUd3FvNkLVSmPI0RT4LWU7pVPt619KkoPsRx0Br5rPe5obtsoycuai8Q==
X-Received: by 2002:a50:8a9c:0:b0:543:5116:b55c with SMTP id
 j28-20020a508a9c000000b005435116b55cmr18400688edj.16.1699305162599; 
 Mon, 06 Nov 2023 13:12:42 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 k28-20020a508adc000000b0053de19620b9sm4903559edk.2.2023.11.06.13.12.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 13:12:41 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-408c6ec1fd1so3475e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 13:12:41 -0800 (PST)
X-Received: by 2002:a05:600c:1f92:b0:407:7f21:878e with SMTP id
 je18-20020a05600c1f9200b004077f21878emr5139wmb.1.1699305160926; Mon, 06 Nov
 2023 13:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20231106210337.2900034-1-hsinyi@chromium.org>
 <20231106210337.2900034-4-hsinyi@chromium.org>
In-Reply-To: <20231106210337.2900034-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Nov 2023 13:12:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VYd96GKM9VzmOPbF55-QEVL3EaCHhY8g+7hPSrDBL31Q@mail.gmail.com>
Message-ID: <CAD=FV=VYd96GKM9VzmOPbF55-QEVL3EaCHhY8g+7hPSrDBL31Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-edp: Avoid adding multiple preferred
 modes
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 6, 2023 at 1:03=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> @@ -622,7 +627,7 @@ static int panel_edp_get_modes(struct drm_panel *pane=
l,
>          * and no modes (the generic edp-panel case) because it will clob=
ber
>          * the display_info that was already set by drm_add_edid_modes().
>          */
> -       if (p->desc->num_timings || p->desc->num_modes)
> +       if (has_hard_coded_modes)

nit: the comment above this line is a bit confusing now and probably
needs to be updated or removed.
