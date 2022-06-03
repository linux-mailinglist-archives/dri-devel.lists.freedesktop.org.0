Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B1053C530
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 08:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF14113805;
	Fri,  3 Jun 2022 06:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCB0113432
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 06:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PN2E70IcGQYkGbR9w9o/Wmx5ihNGlhc87gRXnC3Yt38=;
 b=fUYq2ajhFG3vKs8G37TmDYkpYfBm8sp/Ti6fFg7xKqpLNtlN4XgmwjQfpx9j5e/TW9XA1U
 X6G33IlPyrcP2MmNzU0tL2uKiCEg0ddpoPehOViMbUIYmfxNNhlreL4xzbgRv7Wcp5Jyj7
 PF+NTdchjGWompwjCxzHwc8Bqv6RZd4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-39YxqQuHO3y4J0H4qxYtVw-1; Fri, 03 Jun 2022 02:53:03 -0400
X-MC-Unique: 39YxqQuHO3y4J0H4qxYtVw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n15-20020a05600c4f8f00b0039c3e76d646so584949wmq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 23:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PN2E70IcGQYkGbR9w9o/Wmx5ihNGlhc87gRXnC3Yt38=;
 b=g3rjb98Wbeo3SSlw+x3vPuHoRejdR5GuvvzXSr+TVXFZuYlaCm5cjyAFOZV2OTddQM
 VjImJ+1ZaAFtpFwLq9JBRfMbxTrwv6L1pI6cUseXN3HS01A7Qc8dMRsZvIdvtLhpIfBn
 JwEuYCQx5wUAuLLtDob8xHHWcQ1nzGTyWIJJ88DCJhqAAEudn5OV7AdF68nZkCwDqKJ1
 JKkdSTFWktcayO4HdEQvk9jeqFJStMwDnVG06224CcVY4pmo30Oy3bUnTCcO/7V9YhRG
 iqDAyWXlTRmsXQbH+zL54j1OoaVlU1NRImnepePh9xl2hybR/nQ+5jJrSEApWYLPegoZ
 Epdw==
X-Gm-Message-State: AOAM532AcjL8MmlidC5kkfS8szldfk3KpGTDuicjbZgI0L1V+a7JQ3AF
 2Eg8I74zZagNy/A7y1PkOoqFjhrhtJLEdx1FMK5fExh5LX1WwKBI/d8RGLoKZ0yePPVcNNb9cJZ
 QIbZQnLawshsUU81nzKp8749rhfN0
X-Received: by 2002:adf:db8b:0:b0:20f:fb4f:c3da with SMTP id
 u11-20020adfdb8b000000b0020ffb4fc3damr6798760wri.163.1654239182678; 
 Thu, 02 Jun 2022 23:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOLHX0aJ3HCCTE752/lp0TycAuSWmxRG6uJvSvNncgae/lOYbOO4uYkuz3Oo2YI9QFwprQYw==
X-Received: by 2002:adf:db8b:0:b0:20f:fb4f:c3da with SMTP id
 u11-20020adfdb8b000000b0020ffb4fc3damr6798742wri.163.1654239182453; 
 Thu, 02 Jun 2022 23:53:02 -0700 (PDT)
Received: from [172.28.2.131] (163.106.124.80.rev.sfr.net. [80.124.106.163])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003973435c517sm5418077wmq.0.2022.06.02.23.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 23:53:01 -0700 (PDT)
Message-ID: <722055e6-0bc9-bb70-b729-3e211baee85e@redhat.com>
Date: Fri, 3 Jun 2022 08:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/8] Add a panel API to return panel orientation
To: Doug Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
 <CAD=FV=W+5GAUBh_ZMPeKhqxQXxau2OKCbt3p2QmsDhROf207dA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAD=FV=W+5GAUBh_ZMPeKhqxQXxau2OKCbt3p2QmsDhROf207dA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/2/22 23:48, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 1, 2022 at 2:46 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>
>> Panels usually call drm_connector_set_panel_orientation(), which is
>> later than drm/kms driver calling drm_dev_register(). This leads to a
>> WARN()[1].
>>
>> The orientation property is known earlier. For example, some panels
>> parse the property through device tree during probe.
>>
>> The series add a panel API drm_panel_get_orientation() for drm/kms
>> drivers. The drivers can use the API to get panel's orientation, so they
>> can call drm_connector_set_panel_orientation() before drm_dev_register().
>>
>> Panel needs to implement .get_orientation callback to return the property.
>>
>> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/
>>
>> Hsin-Yi Wang (8):
>>   drm/panel: Add an API drm_panel_get_orientation() to return panel
>>     orientation
>>   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
>>   drm/panel: panel-edp: Implement .get_orientation callback
>>   drm/panel: lvds: Implement .get_orientation callback
>>   drm/panel: panel-simple: Implement .get_orientation callback
>>   drm/panel: ili9881c: Implement .get_orientation callback
>>   drm/panel: elida-kd35t133: Implement .get_orientation callback
>>   drm/mediatek: Config orientation property if panel provides it
>>
>>  drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
>>  drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
>>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
>>  include/drm/drm_panel.h                        | 10 ++++++++++
>>  9 files changed, 77 insertions(+)
> 
> Seems reasonable to me. I added a request to the panel-edp patch that
> probably applies to all of the panel patches requesting a comment next
> to the old calls in get_modes().
> 
> I assume that all but patch #8 ought to land through drm-misc. I'm
> happy to help commit them once everyone is happy. If the Mediatek
> maintainer(s) want to Ack patch #8 I can land that in drm-misc too. If
> we want something fancier like an immutable branch you'll probably
> have to get someone involved that's got a higher drm pay grade than
> me. ;-)

Thanks, patch 8/8 looks good to me now too, so:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Note I'm currently travelling so I cannot push this to drm-mic-next
myself.

Regards,

Hans


