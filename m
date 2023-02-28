Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5DD6A56DA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B313E10E684;
	Tue, 28 Feb 2023 10:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99210E684
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677580522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QNpP3wMRU+jLUcF2Gc7Q2CVGtpZcURPt1dsU3Go6Ny0=;
 b=hRrqQw9uKGbdG9L8omonbtuVpupCVkKQuxqWonIL9mJiOgXNtcvYyZFBlScEtphhmd5aOM
 LjBFxPc6IeRDOA5qYe4nvTD5ZXB2cc8JCD/5biJacUdCrYuEtskWYRI+abTN1LRO2CoTva
 vcBGn6TWY7BsWYYrmRTJ0dMgMpQxnXg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-yJ52UdxcOH-aktOG2NuRHg-1; Tue, 28 Feb 2023 05:33:31 -0500
X-MC-Unique: yJ52UdxcOH-aktOG2NuRHg-1
Received: by mail-wr1-f70.google.com with SMTP id
 o15-20020a05600002cf00b002c54a27803cso1448365wry.22
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 02:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677580410;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QNpP3wMRU+jLUcF2Gc7Q2CVGtpZcURPt1dsU3Go6Ny0=;
 b=yuoAgmb0wDpek4rm9rcckwDdJUGB6woRraZuJQHgoJZB4cbdK5pPaCEHtqA6zKEszN
 GOARWr9kLvExCpnHvsKm4Tda48ers6bFu20DW4zXpuypb1KOjzn/H2fcYYqQrxdysxws
 090exuvy0ZnaPJp6x74V6VhMnXIWVpLOSYhbMgx7rhfjkKnD2E/QOSRQNfU5wwtS4BDY
 4tpkZI3pvClanI4wO/rzwBxCYPtAJwwv2Ydgk7ydd5v/PHzvheo/eA8XkC1HUNAYZAj1
 Usp7FO7oAeoBIyZ649KjYWr2UcIIgXPLnfZeKxkwd2eNa4zouATb5xtBeXrqJ392nQ5i
 cV2g==
X-Gm-Message-State: AO0yUKVJ/bfJPa3VCMhkWLpzo30glNbwnuS7LHaYEN3sGvCx2PaoAZTS
 QkuFVCgrt24ny1rsN2Fpq713fHXrS+DzaVBqarUplZHcclkQOwqtd+A1IpYFKNMqkBaXb1FLpan
 Rutrjh5UQMMulnivx62UmnPtXphuN
X-Received: by 2002:adf:e0cc:0:b0:2c7:c483:9fa6 with SMTP id
 m12-20020adfe0cc000000b002c7c4839fa6mr1560151wri.16.1677580410013; 
 Tue, 28 Feb 2023 02:33:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/DJdfOMvNWpcy2xE6aRKlHguyZfeA9GgrwUyot9JKvTecLods0LUMJqTx/MNsSZob09+236A==
X-Received: by 2002:adf:e0cc:0:b0:2c7:c483:9fa6 with SMTP id
 m12-20020adfe0cc000000b002c7c4839fa6mr1560136wri.16.1677580409756; 
 Tue, 28 Feb 2023 02:33:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b003e1f6e18c95sm16165321wmb.21.2023.02.28.02.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:33:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 4/4] drm/ast: Rename to_ast_private() to to_ast_device()
In-Reply-To: <20230221155745.27484-5-tzimmermann@suse.de>
References: <20230221155745.27484-1-tzimmermann@suse.de>
 <20230221155745.27484-5-tzimmermann@suse.de>
Date: Tue, 28 Feb 2023 11:33:28 +0100
Message-ID: <87sfeqxeo7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The helper to_ast_private() now upcasts to struct ast_device. Rename
> it accordingly. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

