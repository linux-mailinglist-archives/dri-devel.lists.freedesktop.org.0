Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A642638836
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A84610E06F;
	Fri, 25 Nov 2022 11:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FFE10E06F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669374290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIsNFOFnhjxNTgJU/2vZA8CiSz+sEWLC1ebQetbQ8TI=;
 b=R5ybHP+mIGURzD9d5Y0jYGlFJQPyZ94PZ92B3XscNBVwFU3qf1txswQ9NV/CoUPveA1Ef1
 Nc7Fu+Uw0nw6PlkTPRhImKEpMcSWYZX8O2pbUPKwGvWBb2gS7mXM+y22eFk421Y4dqHZ9S
 cbDy2vbS4eecO2aTN2tgCdlUxfu0hz0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-ZLYisogWOUWUHaSIzl4MMA-1; Fri, 25 Nov 2022 06:04:49 -0500
X-MC-Unique: ZLYisogWOUWUHaSIzl4MMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l32-20020a05600c1d2000b003cfefa531c9so3940457wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EIsNFOFnhjxNTgJU/2vZA8CiSz+sEWLC1ebQetbQ8TI=;
 b=SmBMIgvQP3+qrzCIkkFH9WY21hUwN4HfkLd5/fdL3sew/lsvMV5wGP/tFr1lBkMAhC
 OWuiqYb8j4DWe4Z0T6G+AIHlLSK6COmMusRJWX2pr4kkK0LAquC7eTllX5PNsz1YyifV
 +vwBT69FfukqY3CQLuzyZbTdmtUvhmduHXkO6gjDeXMbLOb6zLWrBKiLspJM94yndkfN
 iK/s4ilRxWfm3XaDEi7MMXD6+rkshzdn288QucOWdQx6V/hOb4A5OwEy29faGq2JlJr8
 m7FLEdVBqT6Vx4R9J+Vwhv0vBlIIyf3jBsyqFw0iuqWkDxHQSVvPXSghKzLXBrbEcpN6
 PX2A==
X-Gm-Message-State: ANoB5plw9JY7vDTBG9yU5WcMLgEAqnKctdutWwLMO3EdMhIHf4GKQNIv
 hCmQnE4SovyPdvmcfmSspehq2jmiKzgGNRRTOI1Z1nR/RfsXtKQjKbo+/X1q+SWuFw7xKDD95GV
 KfpOV1Qiiyoc2h6R6CqvHvR57D5vp
X-Received: by 2002:adf:f6d1:0:b0:241:e2af:444f with SMTP id
 y17-20020adff6d1000000b00241e2af444fmr10706101wrp.676.1669374287047; 
 Fri, 25 Nov 2022 03:04:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ai6UB7oIeeI+sRTVyelphEoAhUUiZPfWL2SD5YRQotSiu7iQrCPjltzySG4CbRwXoVo/zjA==
X-Received: by 2002:adf:f6d1:0:b0:241:e2af:444f with SMTP id
 y17-20020adff6d1000000b00241e2af444fmr10706084wrp.676.1669374286732; 
 Fri, 25 Nov 2022 03:04:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm10164544wmg.46.2022.11.25.03.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:04:45 -0800 (PST)
Message-ID: <d5451d30-be68-c492-6ec8-41681db400e2@redhat.com>
Date: Fri, 25 Nov 2022 12:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 12/24] drm/vc4: Move HVS state to main header
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-12-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-12-051a0bb60a16@cerno.tech>
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
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 16:25, Maxime Ripard wrote:
> In order to introduce unit tests for the HVS state computation, we'll
> need access to the vc4_hvs_state struct definition and its associated
> helpers.
> 
> Let's move them in our driver header.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

