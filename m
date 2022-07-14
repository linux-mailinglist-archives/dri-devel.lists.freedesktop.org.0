Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F5574BAD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 13:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04956112799;
	Thu, 14 Jul 2022 11:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE32112970
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 11:19:21 +0000 (UTC)
X-UUID: 87323f8443794ff2bdacbc3f052a3eb3-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:dd6261c3-b5af-4250-a2c9-126d182e9630, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:586a4c64-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 87323f8443794ff2bdacbc3f052a3eb3-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1722459032; Thu, 14 Jul 2022 19:19:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 14 Jul 2022 19:19:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 19:19:15 +0800
Message-ID: <f0ba5478d77a5190a9050e4518ebbd44bcd889a6.camel@mediatek.com>
Subject: Re: [PATCH v14 03/10] drm/edid: Add cea_sad helpers for freq/length
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Date: Thu, 14 Jul 2022 19:19:10 +0800
In-Reply-To: <67b3a842-66aa-2336-3955-d5aa760cdd4b@collabora.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-4-rex-bc.chen@mediatek.com>
 <67b3a842-66aa-2336-3955-d5aa760cdd4b@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-07-14 at 13:12 +0200, AngeloGioacchino Del Regno wrote:
> Il 12/07/22 13:12, Bo-Chen Chen ha scritto:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > This patch adds two helper functions that extract the frequency and
> > word
> > length from a struct cea_sad.
> > 
> > For these helper functions new defines are added that help
> > translate the
> > 'freq' and 'byte2' fields into real numbers.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/gpu/drm/drm_edid.c | 73
> > ++++++++++++++++++++++++++++++++++++++
> >   include/drm/drm_edid.h     | 14 ++++++++
> >   2 files changed, 87 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_edid.c
> > b/drivers/gpu/drm/drm_edid.c
> > index bc43e1b32092..79316d7f1fd8 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4916,6 +4916,79 @@ int drm_edid_to_speaker_allocation(const
> > struct edid *edid, u8 **sadb)
> >   }
> >   EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
> >   
> > +/**
> > + * drm_cea_sad_get_sample_rate - Extract the sample rate from
> > cea_sad
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad frequency field and returns the sample
> > rate in Hz.
> > + *
> > + * Return: Sample rate in Hz or a negative errno if parsing
> > failed.
> > + */
> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
> > +{
> > +	switch (sad->freq) {
> > +	case DRM_CEA_SAD_FREQ_32KHZ:
> > +		return 32000;
> > +	case DRM_CEA_SAD_FREQ_44KHZ:
> > +		return 44100;
> > +	case DRM_CEA_SAD_FREQ_48KHZ:
> > +		return 48000;
> > +	case DRM_CEA_SAD_FREQ_88KHZ:
> > +		return 88200;
> > +	case DRM_CEA_SAD_FREQ_96KHZ:
> > +		return 96000;
> > +	case DRM_CEA_SAD_FREQ_176KHZ:
> > +		return 176400;
> > +	case DRM_CEA_SAD_FREQ_192KHZ:
> > +		return 192000;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
> > +
> > +static bool drm_cea_sad_is_pcm(const struct cea_sad *sad)
> > +{
> > +	switch (sad->format) {
> > +	case HDMI_AUDIO_CODING_TYPE_PCM:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> 
> Are you sure that you need this helper? That's used only in one
> function...
> ...if you really need this one, though, I don't think that using a
> switch
> is the best option here.
> 
> Unless anyone is against that (please, reason?), I would be for doing
> it like:
> 
> 	return sad->format == HDMI_AUDIO_CODING_TYPE_PCM;
> 
> Everything else looks good to me (and working, too).
> 
> Cheers,
> Angelo

Hello Angelo,

I think you are right,
in this case, we don't need this help function.
I will merge this function into
drm_cea_sad_get_uncompressed_word_length()

BRs,
Bo-Chen


