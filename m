Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69699148BF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 13:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6E910E267;
	Mon, 24 Jun 2024 11:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iH+vbe2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A416B10E119
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719228704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1Rc1emYuXh/HewWkHo067TK+khtKA7f3ilfM7ZwWq0=;
 b=iH+vbe2jyKO6CYIICIJy+qw/3TpZ1txpQTyY8BgeZR9OOmVEaSBggqsEBa5VA7Wbs0VeMQ
 n5nR3Ug8KleFOw3KsA/VoszOAzePYdaplZ3l0nvnihrUqpd3tDW8Owpvg0vKVYC6XH4W56
 TVpfzTOiiPzNOORK+ZLrYinIF7NmKKA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-2nB62gcxNw2AeJ1h8VCpTg-1; Mon, 24 Jun 2024 07:31:43 -0400
X-MC-Unique: 2nB62gcxNw2AeJ1h8VCpTg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3621a7854b0so2048643f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 04:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719228702; x=1719833502;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z1Rc1emYuXh/HewWkHo067TK+khtKA7f3ilfM7ZwWq0=;
 b=GSWw7ZIjAQ56OG/vbeciFysqG8xa1NaE+Poy/J9qcYEUKWxGSR9LMwGmfTmSPfBerE
 cMPnM94XVI9vns04m2VVenWgBliSkTj0e0A8+lPCtuoibkrf46fY6ssetEghEGQEw9Mh
 kcv6Y6I5XPR4U4h0SXmHY0LcjP7ZClR8qsM6wyvtHxW7WLavuXc0elVH7OYFdTrD7Bx4
 h384pBHmmK7mR8iPuAxDUzRbRStFiKuwETO8q+CW4irTeRbWyn8MNEBp4IjmMe2Rn0kW
 1eJjs4XMalxEmh6yJer4EWwplqKw62T7TFr1pKtZ6uf7/c/H0LYe8myyT2b9xA8SuERe
 wflQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9CHxka8exeDBHUEOou3FBerT6nNZUWjTIMtxg6GRYstVt+mzm8Nyv9IaRbAz6mwgNxTdF5ITm5sHuvEgAEPA0QFuI4oMSB57Hh6m6JzCm
X-Gm-Message-State: AOJu0YxhnA2JggeNtgH8s8x8uGfO6zM/2WW4FX0hdg+ZRo5gOFcE27lQ
 5iQdWry3IvLRMdI+UyAx5H3WqwMC+HQa41mVt2cm7IjtFrUPaiV2JJuy/v7DEL/O7sTAFGsr/a6
 tvUwYtpqFkQA3NMhT6nWHlcpKUZVfbVB83Nt9d6fHnru85sO7Ogkbsqv5aKc7tdGpwA==
X-Received: by 2002:a05:6000:1a8d:b0:366:f00f:8656 with SMTP id
 ffacd0b85a97d-366f00f8687mr2489935f8f.55.1719228702102; 
 Mon, 24 Jun 2024 04:31:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEjXWAJo0A3ZGNhrE3FY0LNEuVP1fHqKxJAk1B5YvPPlS1HLStfakEN0O/4kfL+9PdRhZvqA==
X-Received: by 2002:a05:6000:1a8d:b0:366:f00f:8656 with SMTP id
 ffacd0b85a97d-366f00f8687mr2489920f8f.55.1719228701746; 
 Mon, 24 Jun 2024 04:31:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8922sm9792777f8f.28.2024.06.24.04.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 04:31:41 -0700 (PDT)
Message-ID: <2f54c321-1832-4931-8148-5eece4ef4915@redhat.com>
Date: Mon, 24 Jun 2024 13:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/panic: Fixes and graphical logo
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <b4caed34-bed4-4b72-9bb0-353ef63fe867@redhat.com>
In-Reply-To: <b4caed34-bed4-4b72-9bb0-353ef63fe867@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2024 10:55, Jocelyn Falempe wrote:
> Hi,
> 
> I want to push at least the first patch that is an important fix.
> But if there are no objections, I can push the whole series except patch 
> 5 "drm/panic: Convert to drm_fb_clip_offset()" which causes some build 
> issue.

I just pushed them to drm-misc-next.
Thanks all.

> 
> Best regards,
> 

