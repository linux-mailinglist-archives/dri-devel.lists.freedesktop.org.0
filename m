Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7C5E7520
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9990110E0CB;
	Fri, 23 Sep 2022 07:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DC410E0CB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663919270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XG9njF4k66bvrFNKlQ46W6iscaot1CmxYtoIJg3hVE=;
 b=J/rr6G8V58iZcl/KgFATMWIxpFJUzZQGjZ8AR5LXoh8SCBQfiaw9RfpvvgdklqtxfK1LLh
 qSIsem2EJc+ZO0EwBhFIMIB8Ei6JnCnM2n72vjOHBdyfDFYlshwfzEtMyOxq77X78UWI9d
 3tkI9apBFbJsK46hmCuplYHTRQ93zRQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-8OOXywV6Oj2Vc7BtL1_O7Q-1; Fri, 23 Sep 2022 03:47:48 -0400
X-MC-Unique: 8OOXywV6Oj2Vc7BtL1_O7Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 84-20020a1c0257000000b003b4be28d7e3so2362255wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 00:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6XG9njF4k66bvrFNKlQ46W6iscaot1CmxYtoIJg3hVE=;
 b=PBCxj/AudL+uLqJwqL18aO6NMdV393f9tCMpA7xxLCwBXalpfKs/PViXh1cp23aSYU
 h/3t5Sw6uFfNCCSdG2utBEDfdj3kHVdMtAZZopQpz1u3R3W9PZndy6KFfzLloc2XPDU8
 2DwSN2Sh4qz+vMhAitnidZKyiKzyMtfWCd/C72UgpQpmtHV2uumMi3b4C83ka4kgbstP
 o2GLp1FDKWcbm0BwSVXju6iUjKb6vvYVERWN6cFbEVwrL+pbGwVz8IPtTWsnakq1QCZg
 ZJ8bW6aPjzOt90nxHgrKRNec97RUgIzzEHxhoch9oWNAc1GSuoZvERUKMe6IWnVrHUWW
 rfRA==
X-Gm-Message-State: ACrzQf1c3PmFJlxbrBFMGi1zc5faV12RDiSXE+g9UV6yurrELab/yca3
 XJVWisPT5jb3w1UEaAJkKbhU6L5XcuJMyd8LCTcyv0YdxBosVzN2WRfgXJBSqVWg4xaqWpelZ3D
 5/IQVGZZ9HqcWJjoKmNk5VaxsrJ8N
X-Received: by 2002:a05:600c:4e16:b0:3b4:9a80:915c with SMTP id
 b22-20020a05600c4e1600b003b49a80915cmr11726373wmq.126.1663919267908; 
 Fri, 23 Sep 2022 00:47:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7YcLuDSCxJm5M8AMUUrva45awkNIxZffS6En6eKFN1TOCtxXFLeyBEqKuole/+T9BOoGh0jA==
X-Received: by 2002:a05:600c:4e16:b0:3b4:9a80:915c with SMTP id
 b22-20020a05600c4e1600b003b49a80915cmr11726366wmq.126.1663919267689; 
 Fri, 23 Sep 2022 00:47:47 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c1d0200b003a62052053csm2283153wms.18.2022.09.23.00.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 00:47:47 -0700 (PDT)
Message-ID: <92327a77-f0a5-34fd-964c-89a3ce7701af@redhat.com>
Date: Fri, 23 Sep 2022 09:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220922130944.27138-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> Lookup the plane's state in atomic_update with the helper
> drm_atomic_get_new_plane_state(). Also rename the helpers'
> state arguments. No functional changes.
> 

I think this was Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com> ?

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

