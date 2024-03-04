Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCECB870825
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 18:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEF31123AB;
	Mon,  4 Mar 2024 17:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Jkc1qPvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162AA11239D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 17:17:17 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so6618973a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 09:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709572633; x=1710177433;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tf2GCMAMCZVgBPTFhp5oiB/JxG7pAEQpQpgTp9OZnBc=;
 b=Jkc1qPvlBsge+rPF3LvQaxEQ9iIUrY1g048X+saSMym3nolgWfusOqNS0kjUGUouMD
 n/bLmUqTqvOK5X1zEtpuHM4+dzJTXn6SNGHrer98iUPKcOPGEBep74CIlSZkCxnjydaI
 zewfrUhaJ96hiFJ/HMXFNeOmTqYKwfYHwBYL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709572633; x=1710177433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tf2GCMAMCZVgBPTFhp5oiB/JxG7pAEQpQpgTp9OZnBc=;
 b=fEYOsigc1nrdaNN3QNj+h0GNY3G8rRCmBU1DQlPlj7dLZjn9Kf2TvdmWZThE5qWr5m
 WIPSnxV4sAXqHJu/riozftcPK/ugT32IUVIdMs1HCgyE+bEDKBCYwq/UK3eB0j9lMRFW
 NFUyDN/YKinwNbGulcrNhteFIi+0u3knO/aYWS2M3h7m4GOGXgRRLy2p5XIdGivXu8dI
 DCh9kMTYhg49YtAfR16W0URENX+3eJgiSMx+/5LLn0n5a7Vj6U6rF2iOFbXygiiq4YaL
 jQe3jHdG4IO81M0ESQLJfFWJbjSGwXg5q7+Z+VJdbuE5WJKdcEImrzBQI0+grEsaOvJ5
 zpcQ==
X-Gm-Message-State: AOJu0Yz8te5/eiLIRey2k4DswCKE7tYEA83H5l7bcEfZfjedlnOGTTon
 WZ8z0c2eBXm3XpgvBePCUz3DnHH1Jnr9sU/p1VwcKjEZAmVp2iYvFwg2oVQdtAek3u1fcUSXRCz
 lZiXk
X-Google-Smtp-Source: AGHT+IH0rpWoldLZMDkjnmFtnmi7OXgwtO5o3JATn1WSKScVNIO22MyNF+MlqmtGApXqrIGHsRZcmA==
X-Received: by 2002:a17:906:6b8c:b0:a45:2865:3fe1 with SMTP id
 l12-20020a1709066b8c00b00a4528653fe1mr3075188ejr.42.1709572633395; 
 Mon, 04 Mar 2024 09:17:13 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 jw11-20020a170906e94b00b00a455d78be5bsm1103885ejb.9.2024.03.04.09.17.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 09:17:12 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-412a2c2ce88so187715e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 09:17:12 -0800 (PST)
X-Received: by 2002:a05:600c:49aa:b0:412:dbba:ca67 with SMTP id
 h42-20020a05600c49aa00b00412dbbaca67mr300900wmp.4.1709572632243; Mon, 04 Mar
 2024 09:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20240301084006.14422-1-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20240301084006.14422-1-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Mar 2024 09:16:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UK7Npa0S6NC1uxoWppZ28xN1j6yY+zpERQU6-XTbFNAQ@mail.gmail.com>
Message-ID: <CAD=FV=UK7Npa0S6NC1uxoWppZ28xN1j6yY+zpERQU6-XTbFNAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-edp: Add prepare_to_enable to 200ms for
 MNC207QS1-1
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch
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

On Fri, Mar 1, 2024 at 12:40=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> For MNC207QS1-1 panel, Splash screen occur when switch from VT1 to VT2.
> The BL_EN signal does not conform to the VESA protocol.
> BL_EN signal needs to be pulled high after video signal.
> So add prepare_to_enable to 200ms.
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Should have:

Fixes: 0547692ac146 ("drm/panel-edp: Add several generic edp panels")

Also note that the subject tag "drm/panel-edp" is much more common
than others for this file and probably better to use that than
"drm/panel: panel-edp".

Other than that this looks fine to me. Applying to drm-misc-next since
the patch this is fixing isn't in mainline yet and this doesn't seem
massively urgent.

e635b7eb7062 drm/panel-edp: Add prepare_to_enable to 200ms for MNC207QS1-1

-Doug
