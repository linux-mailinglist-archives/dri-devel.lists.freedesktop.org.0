Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB918768148
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F15710E218;
	Sat, 29 Jul 2023 19:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B35F10E218
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690658318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ojrCzz5wYGS/I4ma6JQZlj8trsaVvDQ8Es+pMaAigF0=;
 b=VqB1P1opOLOpa2WgfheM83iVQ6HyB8F11AndKN+t8iGX06b9NOjPlgTCC54Ory9xjqu2K6
 CJookr7fS0H/AsG4FL45QHjpI3EYAGy6IW5p/V+/yIRYqS9FXJfaxjVw/nnQ+rraNjdOVo
 0hUUin7N9ghyo1namjBX+O9DttCkD4E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-S8MStoKkOoOlwubfh_BPkg-1; Sat, 29 Jul 2023 15:18:35 -0400
X-MC-Unique: S8MStoKkOoOlwubfh_BPkg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31797adfe97so193030f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 12:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690658314; x=1691263114;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojrCzz5wYGS/I4ma6JQZlj8trsaVvDQ8Es+pMaAigF0=;
 b=CNZAKzRITfCzEybg9opUZ54LQ7IpEEbt8Fmg1wPFUpdT6p03Je4DuwWtctc6k4kCIr
 brnFLSXoMm2woKSvjA+zoZqQNjki4I2x2Pzd5p2qHpA+9btLeXho7mOdgjrr/x5CAaDr
 qyyfVgLTtzqRElUjN5r7U2WknvqDTYDQqwOiLaKdeQ5MC3wgHxtKIQPPQxqUoH+vIvTH
 DmrJTKDa09iBXsCi7C5X9Sqc2l94uS6fCC2J7T8ybBC8IlKlJ3klSN4MOv331/P2ETdq
 MgaVTGSwqwBIQtabLcBEAxVA6KR+yfcpyT0BHzXi1HTpFSQLeRxh5e/nd/ONZQ3tHbhV
 m+WQ==
X-Gm-Message-State: ABy/qLbjx7szsVa8iurbsAxye4TmQ++E7MyZpaqkG9N0cbSx1z09V8s/
 y0LpRAuTOaqmf34GHfh57pB3/PYXNLV2bS+H1x8tuUQIU+c4ZUk5Umnl1EYR6OPcjC4uBv8zSXJ
 nWvf3s4PbASk2ydRvnRpZb5Kx2W+s
X-Received: by 2002:adf:e743:0:b0:317:6cc7:6b21 with SMTP id
 c3-20020adfe743000000b003176cc76b21mr3846713wrn.69.1690658314142; 
 Sat, 29 Jul 2023 12:18:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMLsHO2EpY96ESRcSjZaJGCQAF4FMTewpjygCkWri2whqJzjkk8u4900Qu5vniN18Ue1k5Gg==
X-Received: by 2002:adf:e743:0:b0:317:6cc7:6b21 with SMTP id
 c3-20020adfe743000000b003176cc76b21mr3846696wrn.69.1690658313885; 
 Sat, 29 Jul 2023 12:18:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y18-20020adff152000000b0031779a6b451sm8128412wro.83.2023.07.29.12.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 12:18:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ville =?utf-8?B?U3ly?=
 =?utf-8?B?asOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 2/4] drm/todo: Convert list of fbconv links to footnotes
In-Reply-To: <0761f98d3b6f8df9eea977eae063e35b450fda9e.1689779916.git.geert+renesas@glider.be>
References: <cover.1689779916.git.geert+renesas@glider.be>
 <0761f98d3b6f8df9eea977eae063e35b450fda9e.1689779916.git.geert+renesas@glider.be>
Date: Sat, 29 Jul 2023 21:18:32 +0200
Message-ID: <87y1iywmpj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> Convert the references to fbconv links to footnotes, so they can be
> navigated.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Make main text read correctly when ignoring the footnotes,
>
> v2:
>   - New.
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

