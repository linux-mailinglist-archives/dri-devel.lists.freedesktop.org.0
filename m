Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED37A6081
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 13:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB2C10E109;
	Tue, 19 Sep 2023 11:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A3410E109
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 11:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695121353; x=1726657353;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=uELnytT+CuvLOJY3ZLfkVdcq80klKvGzS1iwGb1zs7A=;
 b=ILXCxyhqmPluZn6tNm2lpLQCWD7/+bl643Ji7Z3KuN8NUfNEF9eDxaFp
 TxBuAhVl+eIpZJkJ/2cUx5R6kFOmGfXix+l6zjwb5ikm+ZrV82NBwCRSN
 6GaeBCfU1wQ7C5TX6ua8DXEyg0U8S+FdXrYrRh5Uo5ztzT5gRUayQ3B1E
 mOAKD4vLFO8O9nN4ZeINWbtK1KHH5kWWlvAHrQH2FJkK8hwWH5A26zSh5
 uh+StVbrzkXy42JfAdnVI0kMQTFcLsEEnSVSXEysAGkQNZ7aIPkNEh7Yt
 Y1xeY64sdyoUQgxbPZur1vxHFnsGkrXJ8p14txxlbXId4EQWuqzPwvULd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="370229177"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="370229177"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 04:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919830091"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="919830091"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 04:02:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 audio detection
In-Reply-To: <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131058.2472260-1-jani.nikula@intel.com>
 <20230914155317.2511876-1-jani.nikula@intel.com>
 <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
Date: Tue, 19 Sep 2023 14:02:18 +0300
Message-ID: <87cyyetohx.fsf@intel.com>
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

On Fri, 15 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Thu, Sep 14, 2023 at 11:53=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>
>> The sads returned by drm_edid_to_sad() needs to be freed.
>>
>> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
>> Cc: Guillaume Ranquet <granquet@baylibre.com>
>> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-mediatek@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: <stable@vger.kernel.org> # v6.1+
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Looks correct to me.
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for the reviews Chen-Yu and Guillaume. Will you push this to
drm-misc-next or shall I?

BR,
Jani.


--=20
Jani Nikula, Intel
