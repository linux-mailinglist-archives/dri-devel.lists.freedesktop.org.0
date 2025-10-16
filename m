Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1979EBE48BD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1589B10EA3E;
	Thu, 16 Oct 2025 16:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AnQdXSbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2341110EA3E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760631712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CA7cuB52W2mQEAqgkUGyrUbyJm9rGb31mdD8XpbhOA0=;
 b=AnQdXSbpbaqc+pJ5AFJnZd1+MTaEZTpyYBLt8EOnkDZVB1Eb8qeY27XRzoeElMREOyyqFU
 ULmSwLwTk+m1meb1mBkYc35xQ4U6jO8z/oASHPsfsUXSm2qFCk9GpJ1V+Z2mEoeFWFiPJb
 kH9VDsKR3AvS9iQRFryMqyjNVnpncHY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-g4DxosPhOnmkg9_CPKHU0g-1; Thu, 16 Oct 2025 12:21:51 -0400
X-MC-Unique: g4DxosPhOnmkg9_CPKHU0g-1
X-Mimecast-MFC-AGG-ID: g4DxosPhOnmkg9_CPKHU0g_1760631711
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-78efb3e2738so30165696d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 09:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760631711; x=1761236511;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CA7cuB52W2mQEAqgkUGyrUbyJm9rGb31mdD8XpbhOA0=;
 b=ZkF75EOi1DY5GEMFmfrl63LlytBRS/wPqwK/u607jXoE/akL6kVeTPBoDZEZW+Vp9S
 /ZhyEBaS4i6qZCoqIHJXLgewAeUhAmYKehcsm5ZBNsN3cYGgA3oRArx3eFVI5QnMMwdU
 0vMPiDiCJDzsTLnnJpV3oXQw/wHqMS2Gzf5zQ6zS2ZH7MhZ9VAzmFHAL15MbC4VT+obo
 ky8OJb4YVyDWeaAGWnultcdX7eoLo/sagNmcUyupSYHKvRi6Ve/GpYutdBSXhva4GdFs
 qsFam9FmnNVdNO8lKMJUWQzRFlqFPnuDmMhEF0mXRkNT7KZ9c3fdM4cXnEI4i/rLxrSi
 2ngQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0NUa6GZvIPTqOnKW6biPYfO+/NZFR/w1TpmVcsIXoC8RZy3sgTsVGUE1PlVWxPj2dm936gDlWz7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiZLCddTKufsAE5/VA65gIxE3iZzrjSpMkxZSRI2yeDI+VH/CE
 XSafZppPDme4G6yn0FVgMPHqZeJeFeZFuj2XkxCswSZ1mCokvvC0XnO0WdPVZI8QZ/GdLsjGSPZ
 1J8Ok7T/8Pu4DVfQFCGPYzr2snpjnrd039SLFn7L8aXFMGuRQ5snlJ39qEm0BNlH79SsFyA==
X-Gm-Gg: ASbGncsRhrhqkujqpWmNL0zpF9rJTZKZc8nwx1NdvuGWBm/9+jDN/kiaDjbYXXGvJlc
 /ZpVSkYX/l5cfgPaKrLtPBYikC1kc4ngX0CKU5W+LDNBaHqSsxzLEUn7EhS9DuU5+CPPVReCX3M
 HmrjVu7/TTSw1JvFypuryGG7lX0k7piJANgDV8qvYFq4spBbeSHAbi/RW4OjMS7x0oVvjQjiIki
 JzxHSYVAeGaYosfwAmU7Z7vQltNe8gSk/7QM//7hxLb+EHS+N99GW+261Xblhh5fnKo+drOi77d
 ZEztRXULbkcu5yrf5KJSm8pXxNumWCC2pfYWecByM/QhPXUHLqxNUfeqLxQoSpY11cEPTPdI2sd
 OiIT6kCzKXvtpc7xXoiToHlyXIZH5zwE47UOXoQGpOySU4Ko+WkD+30NgDlbKGRGYRg==
X-Received: by 2002:a05:622a:1a9f:b0:4b5:ea1f:77ec with SMTP id
 d75a77b69052e-4e89d091468mr10559471cf.0.1760631710989; 
 Thu, 16 Oct 2025 09:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4xG1metr/rpLguKpcRm9DUmy+rwmLo2vG6JrUEiGqV+HAheQWldgSDUdPw7Kfed4P6HKKmw==
X-Received: by 2002:a05:622a:1a9f:b0:4b5:ea1f:77ec with SMTP id
 d75a77b69052e-4e89d091468mr10559121cf.0.1760631710594; 
 Thu, 16 Oct 2025 09:21:50 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e885a8e10esm36941801cf.11.2025.10.16.09.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 09:21:49 -0700 (PDT)
Date: Thu, 16 Oct 2025 12:21:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <aPEbm5qK8-hkV3w_@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b3tntMMKcVmW_2ec41McCTO5mjvZaCzNR7Qf6RK18y4_1760631711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Vinod,

On Sun, Aug 10, 2025 at 06:45:28PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the phy subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

I'm hoping to get this series merged so that we can remove the round_rate()
clk op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Thanks,

Brian

