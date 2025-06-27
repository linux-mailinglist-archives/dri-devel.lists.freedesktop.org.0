Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ADFAEB308
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7D010E996;
	Fri, 27 Jun 2025 09:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U4G/6Zlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F028E10E996
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751016868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GA/faM89fqza/JPWzignIqj4mTHl260Ge7B0hqmCV6c=;
 b=U4G/6ZltCB6zbOyUaKJi28BXEsVfnZ8f6qKfgxhTiGRN8Qfc4ixm5Z8VlgtULF8Te4hTQG
 jdLlN093cIUiGL0E4L+Fawabm36gvmFlprZvT9euf6zfURRUSn9xAZAFjMZNHYH4+goHh2
 N2pp8kVHKSPTos62jEkfkapb4U0P4S4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-POuDRl0KNTaNbORjgZEXZg-1; Fri, 27 Jun 2025 05:34:24 -0400
X-MC-Unique: POuDRl0KNTaNbORjgZEXZg-1
X-Mimecast-MFC-AGG-ID: POuDRl0KNTaNbORjgZEXZg_1751016863
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4eb6fcd88so1193406f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 02:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751016863; x=1751621663;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GA/faM89fqza/JPWzignIqj4mTHl260Ge7B0hqmCV6c=;
 b=paEXSrG4UhqF4iaS4eFXwwR5BTANgZOlhGdDiWm5WhCy3fxH0BTvRCxNydolt2j7v8
 IPhyzB+1RTOvB8HpAeLNoIYg7P4z5VUigrSK2PUTClHiXfrshBEV+V7vV2b74+jzRcHQ
 l1RAnAgL73xX0I0/fRlBKqBlVcFUrlR32MVCk2y7f/vDlbKeeILOFgRu835vmXSTmajN
 ojJj+pOZFxkbGQbsTppOjMYRZpIxiEFGczEp0mkTiscphHBu/vU1JhsA3ghy9vNPVKhy
 4OmnsxWSjEw2GGRw0UuFYJCg17dVy6qBqDCj/2ZIcygH5WivD/wq9taF9QmQYYQ7A21Z
 Dj7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMqxoycsu19ke3AdtPhs3oIWl1sbvWOBrBN9hNRuFL/p/nxHf1VJwTdRKJj77Fk7EvYW4tpBgkK14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuR6/AWPZNufxE+t2keEqEMUpduuN6lvtfYmO934zrkE3ociUG
 hUA8GgjXMULt4cHJ7MlDw0g2ru/ojae+bOyPl30IHU6Sd6/TjBJGqGZ76Nr2uESB/tlqohv1FgY
 z5Ru6oH3EUNIg9UsNFBrAdXQqbhkqkZqplQXWZXhk6c9Rum+83Ko7OCNXs7dVicZdNMigyQ==
X-Gm-Gg: ASbGnctllvPOwb7L/12JxpNHAsnEiKgC/9pKYqWDUMAnidWopxWa/ZP3YFbdKZyTvjs
 auLlqtV3cxc3RXCxY8h6776A4G3N+BUq6HTpvk/pOjqsn4ShmOB8g8Oq1ZRacBnwVpzlGErXp0F
 TI1B2a2QQVL6MAg0M5vxg9DiJfBB1Tx/5gwGAuYw9xr1SiHTbGj9grRHkDmVSd4V4xSsJQUFTWZ
 YxrrCBu0zO1p4NBb3AHhC9w5JrBbd6ffxjSKoLvoso/RAbUDTsVBqSS/+qOTACyuEEpl944dNfm
 r+YPHzJum+0l12k027MOqwbQWimHYYWgxZZvj5Id0WUJKyHXcBHwXLFSj0Pu8pRwDRX3+u6QF4N
 oVuvJ
X-Received: by 2002:a05:6000:2105:b0:3a8:6262:6ef5 with SMTP id
 ffacd0b85a97d-3a8f435df28mr2250308f8f.10.1751016863098; 
 Fri, 27 Jun 2025 02:34:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErDQYLAsVdQskj+qDkpuTXjfRaYntMfK00HJYs5CjmNngTpYMOdmhr/am0qKyG1vWCzguzVA==
X-Received: by 2002:a05:6000:2105:b0:3a8:6262:6ef5 with SMTP id
 ffacd0b85a97d-3a8f435df28mr2250273f8f.10.1751016862604; 
 Fri, 27 Jun 2025 02:34:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5f92esm2211331f8f.90.2025.06.27.02.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 02:34:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] drm/mipi-dsi: Add dev_is_mipi_dsi function
In-Reply-To: <20250627-manipulative-condor-of-faith-389bce@houat>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-1-5afcaa608bdc@kernel.org>
 <87cyapd08f.fsf@minerva.mail-host-address-is-not-set>
 <20250627-manipulative-condor-of-faith-389bce@houat>
Date: Fri, 27 Jun 2025 11:34:20 +0200
Message-ID: <87tt41bk9v.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cFVXlNyagYDUBU5KBwXIBm_4Dp-b_sYtUNoPRQK9zHY_1751016863
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> On Fri, Jun 27, 2025 at 11:04:16AM +0200, Javier Martinez Canillas wrote:
>> Maxime Ripard <mripard@kernel.org> writes:
>> 

[...]

>> 
>> Usually I prefer to have static inline functions instead of macros to have
>> type checking. I see that this header has a mix of both, so I don't have a
>> strong opinion on what to use in this case.
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thanks for your review!
>
> For the record, it's also how the platform bus defines its equivalent
> macro, so that's why I went with it.
>

Got it. I think is OK.

> Maxime

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

