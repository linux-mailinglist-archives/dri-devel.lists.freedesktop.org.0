Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F73759F42
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75E810E505;
	Wed, 19 Jul 2023 20:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750A310E505
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689797101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7/pTuM7M9vX1ufC1fpmoVaAmiz4C6dhPIINuHgLpo2o=;
 b=Aop8gbNdTslnhbDkvoyPq1DODARJ/MQyr129ilbRm7ksnPi8u9r8P6i8ktnmhbpdKTxFq7
 cydb2eD7RvS/vI63ntYUuQ0lXmuWeUvPW+CmMOAAMd7wHU2ljepfgXz3XQ8X65scHUt+fq
 NS2L3GCj8XQnhjrT4w/wrp94LMHAmek=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-nrQvkm7RPOq7EY9blyeZbQ-1; Wed, 19 Jul 2023 16:05:00 -0400
X-MC-Unique: nrQvkm7RPOq7EY9blyeZbQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fb416d7731so34885e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689797099; x=1690401899;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7/pTuM7M9vX1ufC1fpmoVaAmiz4C6dhPIINuHgLpo2o=;
 b=YjpPo6GpSIHw/T8NZ5dGuI+DtCKVEEt/KnA6IbJMl7gJFBFZRCKv1O5sIeNrlNPELY
 6I85iALoKIi9WcczYZJNZWPGaYih92gqJ+BXP5ITaLxbzDfY3qBdrionPHouneVQSWnU
 QHGz/xyCt1DvUZLWwd6n45b3W1IPZGY+qHkSrSnD6Wze4Xiwj5pzQmLpw1rlTsej7/c7
 lyJ3cV0Gy4ski/JDmYNJLUXdnSJk5B5qhTtnS/G1K69+7+18rGnCu0YoCRPEbOef0WS0
 AFwvgabndWSF+hV28fToklLKyg0vECcoj3Zz6B5TLWlNM+f5b2s9G7Qw0aARv1hUtBf4
 uk2g==
X-Gm-Message-State: ABy/qLbKKxjeudtJlfJjvyEJ2t+qKVdBPpgbseifDwxYIwqwZogQA85+
 r0KMCqTaTombe7u5Zqr9/obIhl0pjtn+3Zy51FFuN4LfqDGJSzZSHV1EO7Z3lM4r/hsOyU8TgLE
 gQAmnSfmvXxnyFp6hh077naYIKS+2
X-Received: by 2002:a5d:4a49:0:b0:314:1a98:ebc0 with SMTP id
 v9-20020a5d4a49000000b003141a98ebc0mr685706wrs.26.1689797099230; 
 Wed, 19 Jul 2023 13:04:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFi0JY22d+kOHK5fHGqO+y4CtL8B9jTcDDC0m6+bbYWaVo5QzVUkwkdAF9IoCd2V8xLw0B20w==
X-Received: by 2002:a5d:4a49:0:b0:314:1a98:ebc0 with SMTP id
 v9-20020a5d4a49000000b003141a98ebc0mr685693wrs.26.1689797098975; 
 Wed, 19 Jul 2023 13:04:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x8-20020a1c7c08000000b003f90b9b2c31sm2383353wmc.28.2023.07.19.13.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 13:04:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 09/11] drm/vc4: tests: pv-muxing: Switch to managed
 locking init
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-9-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-9-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 22:04:58 +0200
Message-ID: <87a5vrhdlh.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> The new helper to init the locking context allows to remove some
> boilerplate.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

