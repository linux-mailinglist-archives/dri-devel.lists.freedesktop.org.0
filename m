Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95902550A53
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 13:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A01A10E94A;
	Sun, 19 Jun 2022 11:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BCA10E94A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655639188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGhx+KJSkA3X8m8hF6CnNDDwe/d6YcrHu41h3pNbdsg=;
 b=dLKQycj6c3Q34RmgHDSzf+zHMccG/x5Pqi+0X/qma0zXNSyVAe6WYTYLoRD3blunBp+jeP
 4M27Mt2K2YLPKx/QuH6uRC8VxMmg3vsi/JYYED500iJht/rlbA7e001Xiactgo9Abg86hO
 9MswLKKJ51QMmA4QsXlO5+Vz6+d6ofw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-wMoJ6RWaODO-61RXf-Vf4g-1; Sun, 19 Jun 2022 07:46:27 -0400
X-MC-Unique: wMoJ6RWaODO-61RXf-Vf4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so2376620wmr.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 04:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AGhx+KJSkA3X8m8hF6CnNDDwe/d6YcrHu41h3pNbdsg=;
 b=J3QdvJa8FVxtcXDeisxLrvok0UWAmvbCdVivgOjM9Sh9BLYGr/EGvjGgwDQ6K7IwTM
 SjwgHlBWAuSh9lBlNA2phZ2UPbKTMzADh3Z59PbjvYFaaknca8pJ7vVgj3CH894SN2UV
 MZAC+6fZ9fl4vNKAja02DirT+R0r1XBz4gNRBgFolx14yFPXWU0TUwIE+4UkLgmje9RJ
 yVWDP/yfELn9wT5pULG60azPi5bcrlE5toE6OR9gVfGabzqE23QkHeYgaKimyMo4z9rk
 ocpMs6VL7N5xyyE65tPLDHho1y5uNufafFappvERemewvIokv9bTyQ3WG/UyBmcWX6oV
 ZzSg==
X-Gm-Message-State: AJIora9HyEl6yzeGh57gFkEgf+ZORIW6MZZj5/WxPnLIVyLBLM3zb8uQ
 Fuqk8kifB/j8ZC/jHPtGz8j4DZyDeh/gQUqq70JqOZh2Ife1LhymV7BQ8T+PKEfuTPi6SZfDXxW
 OCuUns+UP6fbFDMt70G75v1ZJKEIP
X-Received: by 2002:adf:fd88:0:b0:21a:a547:38b3 with SMTP id
 d8-20020adffd88000000b0021aa54738b3mr11837145wrr.431.1655639186063; 
 Sun, 19 Jun 2022 04:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tA0kjOoP2A9a9UPTNHd18aAPgeQQmXbADdDDkoDrdbNEN7EBtMxlFH7WBKyui90LADamvjEg==
X-Received: by 2002:adf:fd88:0:b0:21a:a547:38b3 with SMTP id
 d8-20020adffd88000000b0021aa54738b3mr11837131wrr.431.1655639185812; 
 Sun, 19 Jun 2022 04:46:25 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n8-20020a5d4208000000b00219e758ff4fsm10076208wrq.59.2022.06.19.04.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 04:46:24 -0700 (PDT)
Message-ID: <cea478bf-ac29-dbdc-e156-5291da4f0318@redhat.com>
Date: Sun, 19 Jun 2022 13:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for Aya Neo
 Next
To: Maccraft123 <maccraft123mc@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220619111952.8487-1-maccraft123mc@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220619111952.8487-1-maccraft123mc@gmail.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maya,

On 6/19/22 13:19, Maccraft123 wrote:
> From: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> The device is identified by "NEXT" in board name, however there are
> different versions of it, "Next Advance" and "Next Pro", that have
> different DMI board names.
> Due to a production error a batch or two have their board names prefixed
> by "AYANEO", this makes it 6 different DMI board names. To save some
> space in final kernel image DMI_MATCH is used instead of
> DMI_EXACT_MATCH.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> 

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

