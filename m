Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716BFA6CEAB
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 11:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3919710E110;
	Sun, 23 Mar 2025 10:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O3gskslz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F0110E110
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742725302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MPugYjH1vBPzCPlHJmDQbBhPbDOr+oi+cfRnsG4ibQc=;
 b=O3gskslzwQ/08RA8+oJhHlIC4poCc20QZ8oqiI3UTFiJpxCny++A/bZko+wdL5ZgFp3ctv
 OV6nEavqt7uHa87jVzpiugO1/1UDsYbWDXqVv2RamcTkH0Y/N/AL70Je77KOZemmnMQBQW
 l3nO3JZlcrKE3cn9JRqaqZcqV+YszBg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-v-UYmANcMNyMB7gG46nCEw-1; Sun, 23 Mar 2025 06:21:40 -0400
X-MC-Unique: v-UYmANcMNyMB7gG46nCEw-1
X-Mimecast-MFC-AGG-ID: v-UYmANcMNyMB7gG46nCEw_1742725300
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ce245c5acso39369065e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 03:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742725299; x=1743330099;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MPugYjH1vBPzCPlHJmDQbBhPbDOr+oi+cfRnsG4ibQc=;
 b=ESKH/B9z3JIxd61GKUBRrTPkPUywMdVAzh09gCNsrixy+kddNpX7yTyPjDG+CuapFs
 7mndt3DdixoaQXzaviovbPakACjepfjNY4pAlJBvyQmbW1tYMFPW3dEJpjNcUeH7RJ/V
 ySY7ytNkGPk9mYuVhbY5OtoOomqr5Vkmj0LHkeECGOnMAYDkkyjscTwt8vg2CZa8/kgJ
 oQ2ORkKR/Lf5VJWcFLTna4pzPI0TSgnTPusUEjuX2b1YSlH3guiFA1a6OUduPzlQPFDx
 IjAouXFQ/rVUKIWLM21YTjP1LzorPNf5U5xTpMeeA6OUbfZoP7o9q17urAijvWUix/nW
 +lnw==
X-Gm-Message-State: AOJu0YzTHtmpR+SQ5R0zsydLbvcaNNRwSqljxrW8PGxhilg5UQWVLenT
 YShbcR3J5PSXVtRUS/NKp5W5UGHhwob2nHdo741C88OAZyWoDh/IkS4wbiju04aicDHOexDI+LZ
 YGk4W0qF3Vq82uXfkNYBe3/sGRZh96kNahWn2shiaLyTyRO3wZNRK3x7o4A8S7jghtg==
X-Gm-Gg: ASbGncuHUBKiIyu672faVL50sFTee94WbWzlUOUA8j50rugQXyO41eYBQ+0OeQBeHM9
 Ae7X7HXxlPNrwNweB3jSCuUj+3HfHqIPbW9Ne1QH5TdAYn/kS9WkfqqLgamaNmoTPKDLwjchZOi
 ow62Oa7/M/fNkulwJ9ViA4yfRf5oWGo+t2qO6nVtf4kxbWuHrTdrLmAobVfTvKNEd6UNcRT0tA9
 OadUrHyV0aPHGBXrkXeHPhkfdJ7RnxoBYXP7hT9sdBP5tEmr8A1Cedy9lntcSJtdkc6h/NzvyKo
 fCaMv+eQtv0Ms0Fvd4bcNPFZAhklmkyxsuE4gBzebmxzMDLLJtc2KurLqJbMMMv4frAgxqMYgg=
 =
X-Received: by 2002:a05:6000:4014:b0:391:2d61:4561 with SMTP id
 ffacd0b85a97d-3997f8f9178mr6772307f8f.6.1742725299687; 
 Sun, 23 Mar 2025 03:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGMfqKV1iV/rOmWaSlcTDQQOH5gfBEGobLbm3PLEDVg3yn07YKBC+2EGypjWI2lDzi0bLUiA==
X-Received: by 2002:a05:6000:4014:b0:391:2d61:4561 with SMTP id
 ffacd0b85a97d-3997f8f9178mr6772296f8f.6.1742725299253; 
 Sun, 23 Mar 2025 03:21:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b565bsm7496505f8f.58.2025.03.23.03.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 03:21:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/18] drm: Move sysfb drivers into separate subdirectory
In-Reply-To: <20250319083021.6472-5-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-5-tzimmermann@suse.de>
Date: Sun, 23 Mar 2025 11:21:37 +0100
Message-ID: <87wmcgdp3i.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WoIU9vDPZ6RMk5ruC9vwdsI9ohpakMe6vjdZVnSes24_1742725300
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

> The ofdrm and simpledrm drivers are special as they operate on
> externally provided framebuffers. Move them into their own sub-
> directory. Will let them share common code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

