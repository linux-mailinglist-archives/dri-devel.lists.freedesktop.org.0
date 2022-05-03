Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60821517F29
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 09:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F6910E2A9;
	Tue,  3 May 2022 07:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84DD10E2A9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651564141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGSwOf/fh8p0gIy9KOIypxQ9fVdFyjPLxrNNPYPAadM=;
 b=jAFl6EUMhg/QyvDXEdjlx1omF69KVqCsn+xFyDzz+wtnMGDB3vALBd/zcSfpsZy2MSvRSA
 65TjfnHXqU6LeBiH2fNPY8bftuYR/7JzYZiuBqEbnGkb3oF8veKHdVfdnE0V2WTxSDGny5
 JtOtO7chWhyh+mfyJZRocVrHwKXnCpE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-cYxiRPsBPtSZnx_HcBCqgw-1; Tue, 03 May 2022 03:49:00 -0400
X-MC-Unique: cYxiRPsBPtSZnx_HcBCqgw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so6061745wri.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 00:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eGSwOf/fh8p0gIy9KOIypxQ9fVdFyjPLxrNNPYPAadM=;
 b=6rLqnt4kL6bLO3JPB+OeE5p5l/HGVS4PP4GKi1mXYA9yEDqzOuh4qzE+mhfertqoI5
 opqN5FkZwIdps3nVm2Xw/4vQdGh5XZ9GG1XkjFrWcuJYDudu/leGmsqu4csO6Jp0yE1/
 KKJ7ZbxXMtuPuPBCX+P/b61TOQ9I+t1t+z4btpA9xAkkBgnFFY/kFMqcR5db5TKbkq8Z
 rEvqPTGROX6RmOdHdtLfYlWzar1NZknsuGNHKxyLUfBjOZlWiIuWLmQHN6f3va37OTc0
 D7BZJZkJ4mkazrC+xv9hnB42s5q7/qRG2j5taqD07MbHAbqoOX3OyUSgMoGXK4jcFAze
 0qLQ==
X-Gm-Message-State: AOAM5329YYARMgI4J8cncA09LEdL5OOazLIYIwEUYEXdEZqvY9uIJcrJ
 9KxjGremEdbgqFjm94i2bo46/I91+Ds1q54O7/dLvy9ZXlktHXqFg0aI2ATQm8Ukq8Wvh1l8e/U
 S/mBE4De2Wtx/BJuRzG8mgx8c1ilH
X-Received: by 2002:a5d:4b47:0:b0:20a:d4b5:83e2 with SMTP id
 w7-20020a5d4b47000000b0020ad4b583e2mr11664726wrs.503.1651564138873; 
 Tue, 03 May 2022 00:48:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpeTyub4AGzUT62OV1vJlxPY9lLioa97ocHDpEec08O4uJGkVCGaAzEgQA1jhdL4ZGkS8PnA==
X-Received: by 2002:a5d:4b47:0:b0:20a:d4b5:83e2 with SMTP id
 w7-20020a5d4b47000000b0020ad4b583e2mr11664714wrs.503.1651564138605; 
 Tue, 03 May 2022 00:48:58 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c3ba000b003942a244f46sm1065624wms.31.2022.05.03.00.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 00:48:58 -0700 (PDT)
Message-ID: <e1324acb-7f0c-eff9-4c2b-f48de57b848c@redhat.com>
Date: Tue, 3 May 2022 09:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/4] drm/format-helper: Implement drm_fb_swab() with
 per-line helpers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220427141409.22842-1-tzimmermann@suse.de>
 <20220427141409.22842-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220427141409.22842-2-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 4/27/22 16:14, Thomas Zimmermann wrote:
> Replace the inner loop of drm_fb_swab() with helper functions that
> swap the bytes in each pixel. This will allow to share the outer
> loop with other conversion helpers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I've a meta question though.

Something that I never fully understood in the conversion helpers is if there
is some convention about the name of the parameters. Since it seems that in
some places we use dbuf, sbuf but in others we use src and dst, and so forth.

If is just that the naming haven't been used consistently, maybe this rework
(or a follow-up) could be an opportunity to add consistency in that regard.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

