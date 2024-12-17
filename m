Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016279F4AED
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623CA10E21B;
	Tue, 17 Dec 2024 12:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RJmY9KIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6D810E21B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:30:09 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so59300911fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 04:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734438608; x=1735043408; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Cpeg+OoZlAk/avwRjAkuR0FSLO7wRA76WtZnvtz5hp4=;
 b=RJmY9KIHJpZd5VvLBwWGfBNmp4U6tcNV2eCJa9W8Y6GxQLM815s66kqdTxX+UQkw7a
 IY8XxApGF+ig2XXbCOcXsLJSR1mYI1ZVqtpSQ0HYVmw1ET0j3q740WwoeAZBqYl4J6iC
 hq0KLwwvqfmoVkZRfCmV1O1Upr4jQV5OBcLmtx1YUFc+x54nn1RP5NUwVMPLgmtW8ffH
 bgFtMrTp30ev8ZabAQP9gW0q1vgxaBDBY+KMUXTnzkFAVrUOpLUQ49/Qm2lIU5bHeZbM
 DYvfdArUZ3spH2GmB0/REAc7oVtgi0XVTkhGKOu/Jttpieh5QtkGQtDE6vEXqnSgg0Ac
 19ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734438608; x=1735043408;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cpeg+OoZlAk/avwRjAkuR0FSLO7wRA76WtZnvtz5hp4=;
 b=bE++gjXCh2Ayzb4eCspaSEBiiXFFncRA0cnlZz7Qh3mc1zpRzmXKAXbF1PCAocZsr8
 Zgl8yAvmq4D83Bl5M1g/KA3jha6wUl71P6zlFGkKrzlTu5W4z693iJsJhIl53xdugnp5
 tBw8oluJk4hWyBWkSBdLX3DmVJkfNU1MzSCnPJF5aW3yaC59WTF1w1mxOtiqj6rMxMpB
 ICl2BrBz82zitRTBs6aRhIECrmPxQfIwYBe6FFrrZi1nh2MZQSpEE+7WNdZZXsbKjJjc
 4T0vkWccHgJsBmXmQijG2tHQATCGdJLCkiA+REpA9ojUiuSXEMzSw4Isachd+N2wy9Q3
 uB+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCURc+Hi7Eg4iSyKGb95vIsCeq1B8b2PmexjPcdh9EUhCRuKwltzYJh2jzHteLJdyrw4ZNa9rqRcOhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj4NkHNawTWFTVfpfDcRu/Gfn+3ZjBJro2MuGp4uq9lNyhJRRN
 EdEBbURF8aKarI+J0jGpw6jH/bgf2dUzasUIviRCYCnhNvCHX2QNbfTs+IlyFJs=
X-Gm-Gg: ASbGnctclnBC//JOU42xm5w0kH5mNFwBHB1CfYc85AmehfSHvN2nE0Twbz5zACS7Bfi
 gLfvEbW8QFRXoXrE1qFIQv4A/bRi15PsMBdWVHecFV8ZWDf796Ght+0So6aImTSvjHBkk3e14LI
 uPsM/6YV0Ilbw0NoitPxXYgUkSUNPGRFdirjbt5sFf6kb+tA6Y0Xw41g0JcPrKTqDW0NJAHf2HU
 V2qzePO9xKkn3A5KfxAArYQaN6svOkEDTQYlxr53yxCJhX6Uqa/xt6wpuYi6EzUfGgIXhkg46Gk
 812em1QnlLvM7tOCYohy9SQbMf426fdwUt55
X-Google-Smtp-Source: AGHT+IG/o83HRTYlBKwHjBbNkkDbTOVwon5AjYEKHu8C9oNpfKtoWKENsqidPqi+Ggy0KZ4EaXhgqA==
X-Received: by 2002:a2e:bc1d:0:b0:302:2620:ec84 with SMTP id
 38308e7fff4ca-304434d9d6emr11629731fa.7.1734438607708; 
 Tue, 17 Dec 2024 04:30:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a5a75sm12573331fa.99.2024.12.17.04.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 04:30:06 -0800 (PST)
Date: Tue, 17 Dec 2024 14:30:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bernie Liang <bliang@analogixsemi.com>, 
 Qilin Wen <qwen@analogixsemi.com>,
 "treapking@google.com" <treapking@google.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
 atomic_enable()
Message-ID: <6xyyujq7pizt6a2ztjfuapz7pphz33lxgvsjextlrhnefkjaq2@lhpy4bo4wajd>
References: <20241212055110.1862487-1-xji@analogixsemi.com>
 <vkrl7om7hepboovp2uivcnernia3ygqwrj3y3kkjydeclwvrk5@7tkdc4etkcjs>
 <BY5PR04MB673977C1DB1E774CB261C119C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
 <4q2jncpnmeu7ytuyuv5pjzurh3ai5663jmu2we6cebuad2r3r5@tfb6hf6unioc>
 <BY5PR04MB673902E047FF8ADAFD8B94B3C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
 <CAA8EJprGjuGFjZnXUxiMZMV=FO9O9CYt06H_nSL82fEOvPytyA@mail.gmail.com>
 <BY5PR04MB6739C5804F0E9764EFD3A3EBC73B2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <fyltwqxyrmy3rz75nosc4wn6z5zglwv7pelzdf5g6ztloq4ncj@yigwmszuhigb>
 <CAEXTbpf3Bipid7bgnYzGJ6C6d+pgPcA2mjwFijSBwz_6Ub4aaw@mail.gmail.com>
 <BY5PR04MB6739B4BEAEFD0292C1AC9E3FC7042@BY5PR04MB6739.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY5PR04MB6739B4BEAEFD0292C1AC9E3FC7042@BY5PR04MB6739.namprd04.prod.outlook.com>
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

On Tue, Dec 17, 2024 at 01:50:00AM +0000, Xin Ji wrote:
> > -----Original Message-----
> > From: Pin-yen Lin <treapking@chromium.org>
> > Sent: Monday, December 16, 2024 8:05 PM
> > To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Xin Ji <xji@analogixsemi.com>; Andrzej Hajda <andrzej.hajda@intel.com>;
> > Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>;
> > Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman
> > <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten
> > Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David
> > Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Bernie Liang
> > <bliang@analogixsemi.com>; Qilin Wen <qwen@analogixsemi.com>;
> > treapking@google.com; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
> > atomic_enable()
> > 
> > 
> > Hi Dmitry,
> > 
> > On Mon, Dec 16, 2024 at 7:59 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Mon, Dec 16, 2024 at 08:33:23AM +0000, Xin Ji wrote:
> > > > > -----Original Message-----
> > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Sent: Friday, December 13, 2024 9:17 PM
> > > > > To: Xin Ji <xji@analogixsemi.com>
> > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> > > > > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>;
> > > > > Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas
> > > > > Karlman <jonas@kwiboo.se>; Jernej Skrabec
> > > > > <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> > > > > David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>;
> > > > > Bernie Liang <bliang@analogixsemi.com>; Qilin Wen
> > > > > <qwen@analogixsemi.com>; treapking@google.com;
> > > > > dri-devel@lists.freedesktop.org; linux- kernel@vger.kernel.org
> > > > > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
> > > > > atomic_enable()
> > > > >
> > > > > CAUTION: This email originated from outside of the organization.
> > > > > Please do not click links or open attachments unless you recognize
> > > > > the sender, and know the content is safe.
> > > > >
> > > > >
> > > > > On Fri, 13 Dec 2024 at 13:00, Xin Ji <xji@analogixsemi.com> wrote:
> > > > > >
> > > > > > Hi Dmitry, sorry, I didn't clear describe the reason.
> > > > >
> > > > > Please. Do not top-post. Please paste your answer under the
> > > > > question, not somewhere at the top of the email. This allows us to
> > > > > have a more constructive dialog. Additional bonus if you can fix
> > > > > your email client to insert sensible quoting information instead of dumping
> > the headers of the original email.
> > > > Hi Dmitry, OK, sorry about it. Currently, we have problem to fetch
> > > > email from Microsoft on Ubuntu. I'll try to fix it later.
> > > > >
> > > > > >
> > > > > > Anx7625 implement DSI to DP convert behind USB Type-C port, when
> > > > > > user plug into USB Type-C Dongle with DP monitor, the user space
> > > > > > will enable HDCP feature, then kernel do HDCP and output display
> > > > > > and set HDCP content to ENABLE, but the issue happened if user
> > > > > > manually change the
> > > > > monitor's resolution later.
> > > > > >
> > > > > > Each time user change the resolution, kernel will call bridge
> > > > > > interface .atomic_disable() and .atomic_enable(), the old driver
> > > > > > will keep HDCP state to ENABLE, this is a BUG, when user change
> > > > > > the resolution, kernel must change HDCP content too (mustn't
> > > > > > keep to ENABLE),
> > > > >
> > > > > Why? Could you please point me to the corresponding documentation
> > > > > or a code path in the other driver? Preferably i915, AMD or Nouveau.
> > > > As
> > https://elixir.bootlin.com/linux/v6.12.5/source/drivers/gpu/drm/drm_connecto
> > r.c#L1423:
> > > >         - ENABLED -> DESIRED (termination of authentication) As
> > > > there is no other interface to tell anx7625 bridge driver, so the I
> > > > think best place to handle ENABLE -> DESIRED in .atomic_disable().
> > >
> > > I was looking for something like cdns_mhdp_connector_atomic_check(),
> > > which switches to UNDESIRED if there is no new CRTC. Likewise i915
> > > driver performs this in intel_hdcp_atomic_check() if there is a need
> > > for modeset.
> Hi Dmitry, the bridge driver is different with i915, anx7625 bridge driver
> only implement some passive callback interface. There is no HDCP status
> checking while do resolution switch.

Does that mean that you _have_ to reestablish HDCP after mode switching
in order for it to work?

> > 
> > I believe you mean "DESIRED" here.
> > >
> > > For the "termination of authentication" case see
> > > cdns_mhdp_hdcp_check_link(), which detects if the HDCP got disabled by
> > > HW and then updates the status accordingly.
> > >
> > > >
> > > > >
> > > > > > as DRM doc said, kernel cannot change from ENABLE to UNDESIRE,
> > > > > > so next patch, I'll change it to DESIRE in .atomic_disable().
> > >
> > > This e.g. will result in HDCP being restarted for all modesets. Is
> > > this an expected behaviour?
> > 
> > The bridge could be powered off between .atomic_disable()
> > and .atomic_enable(), though I'm not sure if this would be a concern for
> > anx7625. I'll let Xin to comment on this.
> The flow of resolution switch is:
>     -> .atomic_disable().
>         -> .atomic_enable().
>             -> HDCP status check and enable.
> As resolution switch is triggered by user space, at this moment, the HDCP
> works fine(cannot get disabled event from HW).
> So, I think, .atomic_disable() is
> the best place to do termination of authentication (turn HDCP status to DESIRED).
> This is the only entrance which can do termination of authentication, I cannot
> find others.

I'm probably still missing a reference to the standard (please excuse
me, I don't know it by heart). Is it a standard requirement to
reauthenticate on the mode switch?

BTW, while reading the anx7625 code, I noticed that there is a possible
race between .atomic_enable() / .atomic_disable() which set
ctx->connector and the hdcp_check_work_func() which reads ctx->connector
without any protection.

-- 
With best wishes
Dmitry
