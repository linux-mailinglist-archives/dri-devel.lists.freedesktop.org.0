Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F12FC20D62
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C6210E9EC;
	Thu, 30 Oct 2025 15:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ScHndnc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B7210E9D5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:10:34 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b6d6c11f39aso209937766b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761837029; x=1762441829;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQGJPENlwCBSnocB8Fdfhdqupe2Icc+kg91PRDHOC+s=;
 b=ScHndnc1CWFesPfJM3j3V/EdT/yL4wjI4E5iY/V9oeQnK24fXBXksUemmx5OItdfZM
 PSe+q9DcyKziapQWEPbA238uA84u/NcphNUDYGSh1QyqFf+hs9yeftnrKnYwsGaXJ8DU
 LJJ97dNME/JEVEFzeRgF2unPAoVZVYcOdBx4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761837029; x=1762441829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQGJPENlwCBSnocB8Fdfhdqupe2Icc+kg91PRDHOC+s=;
 b=WrCJGmgFZ0mdM9ok0d9sE5m9yOlOwMOjyD3uAx6pC5jxmRmMVd8SWzAyhr20n47PYn
 8WPug3BBs7fLkiCJPEYA4zc0/w2JaOvykEmQBBJ2O3nDideG4uJV9hvrriOXdN3jw7Jo
 Og2V74MUGpLRfm2ZaSpIiKTkU4/P9D6L+59kczLBUpRvRDTPKEdDjWo2DGGBxdjw7bqH
 RJjdV4LJaosk4bAAJxkx4t9oGNgfaquvC1hPk7m6x5e5IMgsI4LpkX/TcTtMJ8O48A0d
 5W2HMJaX5dtNibTtJKQ6f0vqmgIp5a0NwmRDGVZwArnN9Y6PJv87hyd1Lw8tyKJnBTRj
 efOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSxY97i8IgcqhpeTm8elWcEQ+25bZNysePRTt8gYkC1wLoQsoXHPNrXwVEPgZZUe+cC3HJXGaSpYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDcfRal3E/yUiIIbD6ztWE4HFnHpTLsd6laeZ1IVqI+DIy+M8g
 qRsAzJUnTGhHFj+dUWevYwo5UbcmibI0Zmc+SLzBkdq95mSoFSCU5kHkFTX+iUq5FQ6ZSVPh8kU
 xfn4HDaHF
X-Gm-Gg: ASbGncsvHOLywGdIEorwn+WWoY4p4EhG3+KViQJaj3xgTG/hM9g4rzE9hBleWKfBK9G
 3U4je7yxOXihzp9AJAOHo+4DzS/S1DX7eOH8oXq7+pSPSt3n1bwvbI1s1gbi7eNJdsOhRQNUmNU
 k8WWgaCaQj2IpuZgA+Mwv7V57wUlwsGbDM/lht22YmOCs2R6CYtR48Sy6g12SMUAQ5uPGmIXA9I
 tfWXfIF3brSDczgGnKY4DZbWS894+WwDYlZDM5AM8+SCnZyD6ymtT3g+XSIRTacwtHOTkfIh2sc
 EXMvFdwf/yDQAgsJ5ePp7U/+ssfCuL1jVAy8KbW3/wxmNHZIgUfWyUyRH0Mmp/fIu4qsAIaAROG
 NE9J5oFWeG8P1Cqpsq6eqTOS4DY4ljz6vaBkXhwQnMujSEXRBiWzoh0ONrSg1RicsiZSvclwu0R
 WTB+wxdLJJjAilh/7unQIzPW3HsBTt17wHZlFGRfc=
X-Google-Smtp-Source: AGHT+IGBhg3N84B6wYteN547Wc4oUkc7OkxEUv9AuRAym80VfrelT1m20Eg6SKd7pvK71Yg575SQIw==
X-Received: by 2002:a17:907:3cc4:b0:b45:eea7:e97c with SMTP id
 a640c23a62f3a-b703d5569b8mr729690066b.47.1761837028678; 
 Thu, 30 Oct 2025 08:10:28 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853077ddsm1761999166b.11.2025.10.30.08.10.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 08:10:28 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso935291f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:10:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV0sGd1ywDnfatb5AKlMjDc0mvoa6NV9gQhU8Lj0Ih1Uhcj14kqJNLVNZIlfRxlO6dPXbnwNmvKNVY=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2282:b0:427:8c85:a4b0 with SMTP id
 ffacd0b85a97d-429aefcd9ecmr5434709f8f.56.1761837026324; Thu, 30 Oct 2025
 08:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
 <20251029081048.162374-2-ajye_huang@compal.corp-partner.google.com>
 <d6fe55b210888b9279c776b2bbfeaf38bfc44dcb@intel.com>
In-Reply-To: <d6fe55b210888b9279c776b2bbfeaf38bfc44dcb@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Oct 2025 08:10:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTP-kdjp2DD0YYnwmQ7ppLKXSHLRybPbyPeSqE_FEQMA@mail.gmail.com>
X-Gm-Features: AWmQ_bke1tjou5F_4-QfM_8iUzksOVca3RFZUdxwYykUtaSqGBlpmT8eCCU_9jE
Message-ID: <CAD=FV=UTP-kdjp2DD0YYnwmQ7ppLKXSHLRybPbyPeSqE_FEQMA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel-edp: Add override bpc quirk for generic
 edp
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, jazhan@google.com
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

On Thu, Oct 30, 2025 at 2:44=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 29 Oct 2025, Ajye Huang <ajye_huang@compal.corp-partner.google.co=
m> wrote:
> > Adding override bpc to EDP_PANEL_ENTRY3 quirk.
> >
> > Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index 944c7c70de55..da3e8f223ec3 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -218,6 +218,9 @@ struct edp_panel_entry {
> >
> >       /** @override_edid_mode: Override the mode obtained by edid. */
> >       const struct drm_display_mode *override_edid_mode;
> > +
> > +     /** @override_bpc: Override the Bits per color obtained by edid. =
*/
> > +     unsigned int override_bpc;
> >  };
> >
> >  struct panel_edp {
> > @@ -586,6 +589,9 @@ static int panel_edp_get_modes(struct drm_panel *pa=
nel,
> >       bool has_override_edid_mode =3D p->detected_panel &&
> >                                     p->detected_panel !=3D ERR_PTR(-EIN=
VAL) &&
> >                                     p->detected_panel->override_edid_mo=
de;
>
> Unrelated to the patch at hand, since the pattern is there already, but
> something like this should be more reliable:
>
> bool has_override_edid_mode =3D !IS_ERR_OR_NULL(p->detected_panel) &&
>         p->detected_panel->override_edid_mode;
>
> It does not look like p->detected_panel could have other error pointer
> values than -EINVAL, but it looks awkward to check for NULL and one
> error pointer value, and then go on to dereference it.
>
> I guess even better would be to always use either NULL *or* error
> pointers, not a mix, but I digress.

Yeah, that makes sense. If someone wants to send a patch cleaning this
up, I'd be happy to review it! :-)

-Doug
