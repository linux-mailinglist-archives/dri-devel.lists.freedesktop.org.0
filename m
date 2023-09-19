Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74527A6091
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 13:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A8810E39E;
	Tue, 19 Sep 2023 11:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD24510E39B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 11:04:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50300e9e75bso4918962e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 04:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695121468; x=1695726268;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnnQ3s+GwRKjZuujvx+iDfiO0JJCCFMA1JGV0fiu7C8=;
 b=U9bP7chxlljG8OgXHhLgnqFX0IT9ooFhlqUOtdXbXdLmoEBOCrGLcmgPOhQfZyQBmR
 Z6kl/xr0QG0EUprHC7+hO9/qsjxSqxkruxUsmt7nszOXR2RXtYGRKD+5jfDJ965rtZbd
 TVfmyf9FQD5l9nOT8RXDyXMXXndWL5EH5u/CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695121468; x=1695726268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnnQ3s+GwRKjZuujvx+iDfiO0JJCCFMA1JGV0fiu7C8=;
 b=NjUA1j3kLamBFN9oROP2kKyNDXy5K5KA3/E/S9On2Ljrc2MFoJ2ETjv3kgHIKe6r/N
 tDpEq7LDr5PCQOHau9P+pgRVwSWlQODtXIdHR2cf/dHF+yMkylgsRbycWg8GptWwyOJT
 NBM2IdfvK8cnm6PaVwlHwX2tMWQrx2Q84AtClmFJvYCXaUp65XUSVZc/BqKIKBlsVhnL
 5uo0FvkIrKyzzA6wKCdC2VnQFHkneDZW0Hd3N7bXrzhiyFA8wdz0MswgOdURKfliZyuG
 9pBwjN1fCXRvdTMIQ8fa1WWTJUZ5fCwmDPANEAplfvezsrFNA4zFjHpWF2h4O2O3jRWG
 RVeg==
X-Gm-Message-State: AOJu0Yy3+19W49dyVu0higlWJMNpilKGUa5050mtGvbGZ2wYc/fEE3Uv
 WPCtHeopufJ79kgjAnZC8yJagTDFn1ArLaOoFt8z/Q==
X-Google-Smtp-Source: AGHT+IGcV1dfcbMagRfMyNyQcnzYkHiXYtQedB3yY9VjknrAYCXYI60T/bUj3J0z+oKX3RZLt4u29SWWXZup/QVezkM=
X-Received: by 2002:a05:6512:312d:b0:4ff:9aaa:6e3e with SMTP id
 p13-20020a056512312d00b004ff9aaa6e3emr8647917lfd.41.1695121467746; Tue, 19
 Sep 2023 04:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131058.2472260-1-jani.nikula@intel.com>
 <20230914155317.2511876-1-jani.nikula@intel.com>
 <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
 <87cyyetohx.fsf@intel.com>
In-Reply-To: <87cyyetohx.fsf@intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Sep 2023 19:04:16 +0800
Message-ID: <CAGXv+5FvmwMW+bxJ9d_ULbOJA9qpd-vybn0VyE5iyQLHCET1=A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 audio detection
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 7:02=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Fri, 15 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Thu, Sep 14, 2023 at 11:53=E2=80=AFPM Jani Nikula <jani.nikula@intel=
.com> wrote:
> >>
> >> The sads returned by drm_edid_to_sad() needs to be freed.
> >>
> >> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> >> Cc: Guillaume Ranquet <granquet@baylibre.com>
> >> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
> >> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: linux-mediatek@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: <stable@vger.kernel.org> # v6.1+
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > Looks correct to me.
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks for the reviews Chen-Yu and Guillaume. Will you push this to
> drm-misc-next or shall I?

Patches for the MediaTek drm driver go through their own separate tree,
maintained by CK (Chun-Kuang).

ChenYu
