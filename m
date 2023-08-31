Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA4978ED00
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 14:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAF810E663;
	Thu, 31 Aug 2023 12:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFA410E663
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 12:25:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37VCPW2e090521;
 Thu, 31 Aug 2023 07:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1693484732;
 bh=htMuZc/z2V9h3y6JbF95s32HLoZQm0TE7Foq7+M46rM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ANIyNH4CzVY9MVRen8utxmt7j3zKBzPl9d7/rj7kvwNRf6c/Cv4iWUTMjprxQNHe+
 UJN60JbSb14JBWvBFLobcLmEUVfi0c7L+5b6tfVg4iollyJ92ZzfpYtpYid3ZJwnGM
 wgfB9CnZcqDckGa6GEJezONU1A9OUaOH0/mg12D4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37VCPWHs017489
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 31 Aug 2023 07:25:32 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 07:25:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 07:25:32 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37VCPV1e018149;
 Thu, 31 Aug 2023 07:25:31 -0500
Date: Thu, 31 Aug 2023 07:25:31 -0500
From: Nishanth Menon <nm@ti.com>
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Subject: Re: [PATCH] drm: bridge: it66121: Fix invalid connector dereference
Message-ID: <20230831122531.smmqt7ycupvum3gg@stereo>
References: <20230825-it66121_edid-v1-1-3ab54923e472@ti.com>
 <6fd4-64ecbf00-7-213b7840@157890373>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6fd4-64ecbf00-7-213b7840@157890373>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Jai Luthra <j-luthra@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 devarsht@ti.com, Nicolas Belin <nbelin@baylibre.com>,
 "Andy.Hsieh" <Andy.Hsieh@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16:35-20230828, Helen Mae Koike Fornazier wrote:
> On Friday, August 25, 2023 08:02 -03, Jai Luthra <j-luthra@ti.com> wrote:
> 
> > Fix the NULL pointer dereference when no monitor is connected, and the
> > sound card is opened from userspace.
> > 
> > Instead return an error as EDID information cannot be provided to
> > the sound framework if there is no connector attached.
> > 
> > Fixes: e0fd83dbe924 ("drm: bridge: it66121: Add audio support")
> > Reported-by: Nishanth Menon <nm@ti.com>
> > Closes: https://lore.kernel.org/all/20230825105849.crhon42qndxqif4i@gondola/
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> 
> Reviewed-by: Helen Koike <helen.koike@collabora.com>


Occurs on today's master: v6.5-8894-gb97d64c72259
https://gist.github.com/nmenon/6c7166171729342ee0be7de90b65c5c6#file-v6-5-8894-gb97d64c72259-L821

My only complaint with the patch is - yes, it does'nt crash, but I see
this spam on my console:
https://gist.github.com/nmenon/6c7166171729342ee0be7de90b65c5c6#file-with-patch-on-top-L236


> 
> > ---
> >  drivers/gpu/drm/bridge/ite-it66121.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> > index 466641c77fe9..d6fa00dea464 100644
> > --- a/drivers/gpu/drm/bridge/ite-it66121.c
> > +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> > @@ -1446,6 +1446,11 @@ static int it66121_audio_get_eld(struct device *dev, void *data,
> >  {
> >  	struct it66121_ctx *ctx = dev_get_drvdata(dev);
> >  
> > +	if (!ctx->connector) {
> > +		dev_dbg(dev, "No connector present, cannot provide EDID data");
> > +		return -EINVAL;
> > +	}
> > +
> >  	mutex_lock(&ctx->lock);
> >  
> >  	memcpy(buf, ctx->connector->eld,
> > 
> > ---
> > base-commit: 6269320850097903b30be8f07a5c61d9f7592393
> > change-id: 20230825-it66121_edid-6ee98517808b
> > 
> > Best regards,
> > -- 
> > Jai Luthra <j-luthra@ti.com>
> >
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
