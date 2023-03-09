Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC016B2262
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2997210E160;
	Thu,  9 Mar 2023 11:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769B910E160
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
 b=baxC9t6eyk3IKhfv0QWWRuL+z9o1x5ObjJinAnDevrCwiLR4J+EdPGw+aLpSTwUIJeQ33a
 +nsJObcda/838lrLS4ETkgRyacyS2GmZAX3YSLHS9U+90fpSKDwdueG6/Ynu3eiE55uaL5
 oGvY9C4cggX3fRonL50zU7kNToYeGyg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-MuxqHH3jMAezxv6uaC-cVA-1; Thu, 09 Mar 2023 06:14:42 -0500
X-MC-Unique: MuxqHH3jMAezxv6uaC-cVA-1
Received: by mail-wr1-f70.google.com with SMTP id
 bh3-20020a05600005c300b002c70d6e2014so347158wrb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360481;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
 b=27/w9Hz1iTqNXXDSfncz/u6+ytZ/XfPP4zumyBVfQ9Gk5qqCgkTN+c10fslFiXtKH6
 Bv4mccnWEWYxvwh/5ENkwMKwt23CSlaQ/VH9WO5ARv1nBcc2FriFZs2FQ6RMds9PVO8s
 VuMNrGrt8y/paEcEOju18dLEM1/AZbSVlzxYy+oOH5/Fo7Hq0wq9j50M2m6kwfrAcHd4
 jVYsuglVlmtpqaTJg9GSpCVYBDE/H2Pp2nfeU/D3Jb/W26U2eSHryPqiE90LnDgeqpnh
 hKk0Wh5Cij5hUN6kxDzEG4bFJNqClAVZ0LqGndknrtfX93kbVg/n8b0XQWWYDGRyYMbg
 BQAQ==
X-Gm-Message-State: AO0yUKU4U0nWrgztcgc3XX+Io8wIca9Fd7tkFF7YtdP+SiDBJfxk0Nc6
 39KNB+lMjSsckjIeyQrCG2VblHYKbXibL7b7KiEdL++IKGXi+u31LsZTfwY3lnC60Kl8Of3RteB
 73TaIUMi7Qr3PBYaLqoQyl/yPOyYt
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id
 r4-20020a5d52c4000000b002c7390e163cmr15389457wrv.47.1678360480890; 
 Thu, 09 Mar 2023 03:14:40 -0800 (PST)
X-Google-Smtp-Source: AK7set915u9SxlnTzfz8tGdDVQASzd1E75MhTfa6AFkSAnvLaeMrUwPtQlpNR4g2GraOjyd7bJsXiA==
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id
 r4-20020a5d52c4000000b002c7390e163cmr15389414wrv.47.1678360480580; 
 Thu, 09 Mar 2023 03:14:40 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q1-20020a1ce901000000b003eb5a531232sm2198602wmc.38.2023.03.09.03.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:14:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 01/22] drm/fbdev-dma: Implement fbdev emulation for GEM
 DMA helpers
In-Reply-To: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
References: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 09 Mar 2023 12:14:39 +0100
Message-ID: <871qlydvmo.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>> +	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
>> +
>> +	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
>> +	if (ret) {
>> +		drm_err(dev, "Failed to register client: %d\n", ret);
>> +		goto err_drm_client_init;
>> +	}
>> +
>> +	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
>> +	if (ret)
>> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>> +
>> +	drm_client_register(&fb_helper->client);
>> +
>> +	return;
>> +
>> +err_drm_client_init:
>> +	drm_fb_helper_unprepare(fb_helper);
>> +	kfree(fb_helper);
>> +}
>> +EXPORT_SYMBOL(drm_fbdev_dma_setup);
>
> And this one could also be shared AFAICT if drm_fbdev_client_hotplug()
> is used instead.
>

Scratch this one, you need the custom setup function to pass the 
drm_fbdev_dma_helper_funcs to drm_client_init(). But I think the
other comments this apply.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

