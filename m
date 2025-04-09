Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7686A82407
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 13:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D89D10E85B;
	Wed,  9 Apr 2025 11:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MRGs7b4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E751910E85B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744199706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ndFR2SkmFbge7E+eadxUynkMt8AUHvT/1p1c4Aj4DX8=;
 b=MRGs7b4jbeYurrOEep6WrHVBgIr6/lV+rFGS+9r6/TplBZZGkRGl+bsBGXNrMp+/Z9uxtm
 k7mk7Ibww2aWjrjSjj6YpPQq+8dAoJp+wNbc/VB9AxzAqW9wtnQUJEnZmZZpvm6i3JqpAz
 h2ZXbbHuT43Q8OvRGkW1OkZZUZYwPbs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-kVBZk2VANWCSLqz8Yw3JwQ-1; Wed, 09 Apr 2025 07:55:02 -0400
X-MC-Unique: kVBZk2VANWCSLqz8Yw3JwQ-1
X-Mimecast-MFC-AGG-ID: kVBZk2VANWCSLqz8Yw3JwQ_1744199701
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4394c489babso32574165e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 04:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744199701; x=1744804501;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ndFR2SkmFbge7E+eadxUynkMt8AUHvT/1p1c4Aj4DX8=;
 b=AJiMXonUnTqdDOe5PGWpcdFKdOTxd3FhQ/ylfmDnmGNM6IvMYV38FKBMM4on7ANeg0
 4TQbGF/qyf8clM4WDV1fkDnpbzVMCTjKuBXuB5+N7q9PT+BpctEPWYKvkfgfb30XSxjs
 RxJbp4rPiKNHR+FAp7p3rap+yiMGKKvGjk4XSOQ4dcQNhf9vJsRpOmpYmy/pE0zC/2Rw
 0/pnn0xTikePtE8WOQvF80a8D7sBsA7Z8UYxBvNCr2S89tGKK7fgh1Nzy/RTyvFwVdcL
 rQffMYrTh8kF398z0DTxn8TELj+/hmUecVwelGR2E48sCgOE9VFhRARUGgGxQjL4auZW
 0cqQ==
X-Gm-Message-State: AOJu0YzUETzyKYHA8AOyOmLUWK5TM8JN+rEIUkHKZYwcW7TfVRFpcMRQ
 A0SluMWiQH3xZ4zP+V56MpFS6yrASUF98SqZzpdzW6opFJPYKxrQlVUjk4TKQsBTYxWEOxMo7uA
 otfAx/En+Sn5eiiXBLY8myokdgrn/mdILLyckEEP18ntDA4pFougKG+J6nOemezl/ZQ==
X-Gm-Gg: ASbGnctMO3+etS7iozlxHPgdfMYg3hYaOmx+L6H6Xd8O365hgytY4GBS3oNiJWZigyS
 SSNDNLHn1gu7SBpx2P907FrnkheDK6MTbmIa9ao730EAuhG03RHuomy+9DJw0cmJQfMf1nB+TYO
 e8srAdbedMDdkZxByjp59e6VufrMs6YHgCcW/w3K9Iz5N9VeAXd+sie5ykow7eYfQxFU4utjEcA
 0fZgVDum5l80BJS9xDe+JMdSRX4hjlt75GPWbyKo5NllCY4VL+5BJYEdg+36EvNe8i5F0ZBk5PE
 VY2+9TejrRsoTNaF+mA+qV1SBvJoIW7RKeoHPzp9kV2rDISC3HNyshxOew7OVl6QquGgdg==
X-Received: by 2002:a05:600c:c88:b0:43c:ea1a:720a with SMTP id
 5b1f17b1804b1-43f1fdbf8c6mr19658985e9.1.1744199701300; 
 Wed, 09 Apr 2025 04:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi717G4jzoSTI56P/xJ+Dqf/t5A3FX/iFVqTVVBrCsz5hvWx9cTet6Z+QJMz16PIajjeDQmA==
X-Received: by 2002:a05:600c:c88:b0:43c:ea1a:720a with SMTP id
 5b1f17b1804b1-43f1fdbf8c6mr19658765e9.1.1744199700884; 
 Wed, 09 Apr 2025 04:55:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20b6f6c1sm8356195e9.3.2025.04.09.04.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 04:55:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] drm/sysfb: Split source file
In-Reply-To: <20250409084729.236719-2-tzimmermann@suse.de>
References: <20250409084729.236719-1-tzimmermann@suse.de>
 <20250409084729.236719-2-tzimmermann@suse.de>
Date: Wed, 09 Apr 2025 13:54:58 +0200
Message-ID: <878qo9ft2l.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wHXkdphCYdkTvPStISTaYpFSif3mm4L2nzqrpDQwvOU_1744199701
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Split drm_sysfb_helper.c into two source files. There's no one

You meant to say "There's now" here ?

> source file for the mode-setting pipeline and one source file for
> module meta data. Prepares for adding additional source code to
> sysfb helpers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

