Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62AE4D2F6B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F43810E8B9;
	Wed,  9 Mar 2022 12:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5083610E6C6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646830211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qK37FEIB2OXNuraDrBny1GHU3Ir9ESnwpP2fxsHmqQE=;
 b=Drtrofwd1YBHm2APUgeBQ0WWDJkVNwb8K5wFCZ+qZWOcpl+4M03WqSPCjP6ZTGQjKPn+f+
 a3p+6tQFjMxShP8ME9BVX++hkMF5t7iPs2e4/+T0Xp+lbacxLJelaRB/0McRB2Dflrj7Cw
 JTafdgqtLSx0ZkuWLHiiP52YcmaQq2k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-GBxZF7pcOti89vqc2-fptQ-1; Wed, 09 Mar 2022 07:50:08 -0500
X-MC-Unique: GBxZF7pcOti89vqc2-fptQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020adfea0e000000b002036c16c6daso729409wrm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qK37FEIB2OXNuraDrBny1GHU3Ir9ESnwpP2fxsHmqQE=;
 b=6onEasWGFnABnnAgUM/dEG+2Zjs/zZXKj/ZKimCfOXNjAAcyU5MaeZRRo9I9pU0tjA
 Y3mnL7tU6s3qkZ7XplEZ3Y2oQwpD0E59y6HK9H+/6tQyCZvqMt+66LJ7KIMr4RNHm9XC
 YGtjgexLqWwzBJDEOtwl6lvPtw6qBazR3tQJJ/T3wsG2/xiDaJ7NkfS9nXoXQeZUwB2S
 m8HoqxNvvVqcUrSmUfwcqb2Pj2v5bl0a3zDaHEHCv8H9iMMg46rTdJWXtMTeFdA+oAWe
 BrAC2TuvxUGFW4rhUwSNVtGjjcGfBkF6vPtfz2d1KtWF0Ep8g6hPAG6dpiWWAlb7ZkV7
 Nkkw==
X-Gm-Message-State: AOAM5311CiBfcuzrtme31DToykUH2Es2vfoudJNhQDqdTWp/B7/2B75y
 zV1wcB7udeFUW+hFfazaxQh3One5S7OWkqKZ+KdveLbFQd4BijB00EtsyDlFotYK8okwMRdLaZ+
 vUpoBchfnc2+txFqLcxIgBroBQPt5
X-Received: by 2002:a05:600c:3391:b0:389:9c6e:c248 with SMTP id
 o17-20020a05600c339100b003899c6ec248mr7533659wmp.97.1646830207220; 
 Wed, 09 Mar 2022 04:50:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeXHfCV/JaoT7fJMQEXpLGuGsq/2+i1HVZtyXeMJ9Df4V6oPcBL176FigUDbOU4N/swo1uMA==
X-Received: by 2002:a05:600c:3391:b0:389:9c6e:c248 with SMTP id
 o17-20020a05600c339100b003899c6ec248mr7533636wmp.97.1646830206986; 
 Wed, 09 Mar 2022 04:50:06 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d6652000000b001e669ebd528sm1715420wrw.91.2022.03.09.04.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:50:06 -0800 (PST)
Message-ID: <d0c795a7-6379-fa95-7487-982e668df27d@redhat.com>
Date: Wed, 9 Mar 2022 13:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/10] drm/fourcc: Add drm_format_info.is_color_indexed
 flag
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <c0a11d8203d58dbaa5f22479c48504dabdd9b4e1.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <c0a11d8203d58dbaa5f22479c48504dabdd9b4e1.1646683502.git.geert@linux-m68k.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Add a flag to struct drm_format_info to indicate if a format is
> color-indexed, similar to the existing .is_yuv flag.
> 
> This way generic code and drivers can just check this flag, instead of
> checking against a list of fourcc formats.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

