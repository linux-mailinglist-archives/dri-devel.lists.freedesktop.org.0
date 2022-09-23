Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10745E753A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7673A10E4A2;
	Fri, 23 Sep 2022 07:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A119810E4A2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663919557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEiP0ad2JSmxsPiBWEBROApWCW09CWzhNDYZtRCBqfk=;
 b=c/tfX2KtOLn7SibBltwB2gS2YfwZRyesE3hkBBhPezWI0pZRhAzr6SMwk+CfQPFdFpGPf4
 8/pp5F7PdfSRQjY1QJKaM24eKfWGTT5PGJ9VhAQZSfwsiRXqWm8wHyiPVHNZig8lxCCYCr
 GznrSxNW6XI+dOMkVLuUvw0f6DmEWnQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-87Dj_i6HN4-6tZtaG3S6RA-1; Fri, 23 Sep 2022 03:52:36 -0400
X-MC-Unique: 87Dj_i6HN4-6tZtaG3S6RA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c129-20020a1c3587000000b003b5152ebf93so174910wma.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 00:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cEiP0ad2JSmxsPiBWEBROApWCW09CWzhNDYZtRCBqfk=;
 b=lxY/Dgj5X3XpsqYXE3DPcNSi0/m9MMIGoDODHWnQOOivs9CpJZ6PjSkFB7hB+r1k3+
 ZwdQjBUPdajyhPYvdYNW5/HIWnph44jp2UYqY+0k41sY60yXu+ICiGJHAwLfog3PMSj8
 N02zns01YUhxsz8Q+WH+hszcd+H7dYsA0dRJJdW94qscSQWbRZwrfnIQmCv+zSeKo8zy
 JPc0eVPyIrFV7ojjhKegdWHuZ71OPTXx3p8y/okc2rfol/TnVGCdg+bCgGcOp93hKKbE
 1Bx8pR2G0zmGob1WUavMkt7yCrWONFpMi0jymTTz/bgXyH+UuXQfaczVtTLr2VV49q0u
 TsuA==
X-Gm-Message-State: ACrzQf1O5wkaLTpeadicyMuOlTYm5ZonKlESi940yMMqU/Y+RQqtoxdB
 MSEY1aObrGTSC2upJuIsxHO0XdcJvRw3G4Vvx3N5eI7nLiFZh9ac+wL6zi7p5s/pZOzl05BSFOV
 vn/KDP0chZGPptSL9V2GKmaWnzjEd
X-Received: by 2002:a1c:440b:0:b0:3b3:330d:88d8 with SMTP id
 r11-20020a1c440b000000b003b3330d88d8mr5070347wma.31.1663919555789; 
 Fri, 23 Sep 2022 00:52:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5WM9d1eMk3SvXLkn8dPYOTGbyzS6ui6eR2aWj6Qfx/TvFEiJrCSwSHv8UoTD7MaCpwiTSyPQ==
X-Received: by 2002:a1c:440b:0:b0:3b3:330d:88d8 with SMTP id
 r11-20020a1c440b000000b003b3330d88d8mr5070338wma.31.1663919555565; 
 Fri, 23 Sep 2022 00:52:35 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4b84000000b00228a6ce17b4sm6905449wrt.37.2022.09.23.00.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 00:52:35 -0700 (PDT)
Message-ID: <bc1ad132-46f4-cb91-9c0e-f98f304f7144@redhat.com>
Date: Fri, 23 Sep 2022 09:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 4/5] drm/simpledrm: Iterate over damage clips
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220922130944.27138-5-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/22 15:09, Thomas Zimmermann wrote:
> Iterate over all damage clips and updated them one by one. Replaces
> the merging of damage areas, which can result in significant overhead
> if damage areas are not close to each other.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

