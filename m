Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F227AAE79
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 11:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EFC10E042;
	Fri, 22 Sep 2023 09:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B2B10E042
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695375863; x=1726911863;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XqXG2jgGiK6RcE5JTJCQMqr1wkSsKU5xrFxakZbujqo=;
 b=YGDfioqbnGrb2uIhpWVfh1ohrYWQ3hExTm86rNqUGm/YsdXNqUeg2T9U
 A9BwpQJdfsN+6xnChYsCNC0TvF6hZuMuz+dkZBXuDz6mDs0CboqutR+dW
 gSmtmAsppyE0z8NBKJcNSii84eWKub2Tc18m4cV9UMqhjrHvq85uf2G7j
 x913rTaNYunoeuNEkefqs+zte1/i2nyVm67npOqQxBmzZmPCOxw/SMc4q
 VU7cuNMvZBMbVgNvZpOSeVs8QGCnWs6W1Fzw49s+i9fXPmMkECXNVAWNf
 UbsohN5b5l01As+DpWfzvoTQB20EVw8fCb3mWopLQH1DLinPKVKSv3EZA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447268804"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="447268804"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 02:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="782578828"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="782578828"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.50.131])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 02:44:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 audio detection
In-Reply-To: <CAGXv+5FvmwMW+bxJ9d_ULbOJA9qpd-vybn0VyE5iyQLHCET1=A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131058.2472260-1-jani.nikula@intel.com>
 <20230914155317.2511876-1-jani.nikula@intel.com>
 <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
 <87cyyetohx.fsf@intel.com>
 <CAGXv+5FvmwMW+bxJ9d_ULbOJA9qpd-vybn0VyE5iyQLHCET1=A@mail.gmail.com>
Date: Fri, 22 Sep 2023 12:44:15 +0300
Message-ID: <87o7huo840.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tue, 19 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Tue, Sep 19, 2023 at 7:02=E2=80=AFPM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> On Fri, 15 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
>> > On Thu, Sep 14, 2023 at 11:53=E2=80=AFPM Jani Nikula <jani.nikula@inte=
l.com> wrote:
>> >>
>> >> The sads returned by drm_edid_to_sad() needs to be freed.
>> >>
>> >> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
>> >> Cc: Guillaume Ranquet <granquet@baylibre.com>
>> >> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>> >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.c=
om>
>> >> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> >> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> >> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> >> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> >> Cc: dri-devel@lists.freedesktop.org
>> >> Cc: linux-mediatek@lists.infradead.org
>> >> Cc: linux-kernel@vger.kernel.org
>> >> Cc: linux-arm-kernel@lists.infradead.org
>> >> Cc: <stable@vger.kernel.org> # v6.1+
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >
>> > Looks correct to me.
>> >
>> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> Thanks for the reviews Chen-Yu and Guillaume. Will you push this to
>> drm-misc-next or shall I?
>
> Patches for the MediaTek drm driver go through their own separate tree,
> maintained by CK (Chun-Kuang).

Chun-Kuang, can you confirm picking up these two patches, please?

MAINTAINERS does not list a separate git repository for MediaTek drm
drivers, so I don't know where that would be. It should probably be
added to MAINTAINERS.

Thanks,
Jani.

>
> ChenYu

--=20
Jani Nikula, Intel
