Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F02911454
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 23:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36BA10E0C9;
	Thu, 20 Jun 2024 21:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CyJFSpW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AC010E0C9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 21:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718918509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=CyJFSpW/FPTC2vR/NmHhrjT67tbtBja5MnD4WtYwBeyF71hz418Tk2XJUNRAD6l3n7gAAT
 yFWjpo+440CrloE+VjJgcGG1shX9XGGU9+RJrjdhsvja7OfoJmyMW6NzKgSlRKz2afa4mV
 GrWysC1ErbD9PWpu3dbotCTWWE+dyuY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-8nm8VfapNoGyOfjahSb6Hw-1; Thu, 20 Jun 2024 17:21:46 -0400
X-MC-Unique: 8nm8VfapNoGyOfjahSb6Hw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a6f5e82440cso72747466b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718918505; x=1719523305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=FW+1aEIBQmA/T+HGiVupTSsSoovM27GMtWub1zJyovsVGIbgAOjK/6Sa41Zuzh+HBu
 o9U8dsxvzMnnwN4W0wujIW0TJG8fnrhhQoZ+1pqt24vlhXPQH8MO5IN6TRO8vz48C7xX
 1qSdLU0DDVFweWfJd5odgghCL2j5PXDiJin1U+ZhquINC/8hny/ODp6J09gAdR2auOYR
 ywG21kRBOLlazKo4EBQIcLK6BGQvb4vCVrV8wTmDSryDpUgGliuMppntOmDt3+ySf3ka
 owBoAY4Xl7dNEy6cPjCIxg9ysih+x95+glX1iHh2bzYBaKLMCo5S2LU3vdCGmX7aOAAy
 Mgxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwB7yYtsWNnJag0EvNTIJuPm6J0vI/8QJEeAvjcdWhP900kuGY/+j3l/AhUeXHYu5mcMsuX4hwLMHO/kKtIsTLNHzvktpZ42+ilGh26Y8U
X-Gm-Message-State: AOJu0YxlsIP2JjYfYyunhVn2y5uQDgAspbnWTU8wx83RocIjrb8M/n47
 2Gdn1/gSVudEMAC1TwMNbOqQuc4k71eLNCbfiRBUvkIz5IWK0WY1BiFNMGYVgexBZeRxRSKe2VZ
 cJGOCErrlk1kekfkXPFXQGcpEgyOKMO1Zp3t1OyTPvgZxmWA3SE3MVwZ4ez0Gm/zPHg==
X-Received: by 2002:a17:906:3e8f:b0:a6f:38:6968 with SMTP id
 a640c23a62f3a-a6fab645136mr368399766b.32.1718918505186; 
 Thu, 20 Jun 2024 14:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFInMUkzUyLtNJEWjuXNVwdvaGVwPshtBGyRuzXTA788k2STLElQ5LZklyOjhCpKUl4EQXQow==
X-Received: by 2002:a17:906:3e8f:b0:a6f:38:6968 with SMTP id
 a640c23a62f3a-a6fab645136mr368398266b.32.1718918504774; 
 Thu, 20 Jun 2024 14:21:44 -0700 (PDT)
Received: from avogadro.local ([151.62.196.71])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf428b9fsm11268566b.42.2024.06.20.14.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 14:21:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if
 DRM_FBDEV_EMULATION=y
Date: Thu, 20 Jun 2024 23:20:52 +0200
Message-ID: <20240620212142.461771-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620054708.2230665-1-wenst@chromium.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Queued, thanks.

Paolo

