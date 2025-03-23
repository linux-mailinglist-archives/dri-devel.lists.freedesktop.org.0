Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9304A6CED7
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 11:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B848A10E0F3;
	Sun, 23 Mar 2025 10:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pvy/wPDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D3310E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742726476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ElouIigd8DpMf0Ug455kJL3XWa3qW5DGg6ijQRuqB8A=;
 b=Pvy/wPDPvfInCXrupqHKcYCd8HsQ2E8HXg2o/csYlc5h9suSaU0NoTXMmpEMXIGc7BpGU1
 rT/Edejxvzx5/sMxRbPYq1VaSQorkwZ2ArZC0ySDIkR4HA3SYyGOgs+/pguhQCLdfBNEOU
 VS2rUPV7PQFZSQP9F8VJ0NzTOcpzyLk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-AdGtUjk_MH-K3M51G1BNQA-1; Sun, 23 Mar 2025 06:41:15 -0400
X-MC-Unique: AdGtUjk_MH-K3M51G1BNQA-1
X-Mimecast-MFC-AGG-ID: AdGtUjk_MH-K3M51G1BNQA_1742726474
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d0a037f97so18091325e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 03:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742726474; x=1743331274;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ElouIigd8DpMf0Ug455kJL3XWa3qW5DGg6ijQRuqB8A=;
 b=Rz8gL/XmQPmZID1RHr37zL9SIhvW9Md7LAAmUZibNU4C0Vz1ci8kiC5RhJZw6GxYW9
 zKN9ITjmN3v5WuBWi33B/Y9YOxLSV/sMDMNt85LGlPiRNQtIwdXkUbx4gEhcVNNvF0ow
 hPr3afNSzIt0Yd88mW47581Cg74kHI4s0QKMvErbiTEX66QJkgVcqqdpyYajHRznyxgD
 st1UuJivcrNS8RIwCRoCegKcpIqmXAd9ArXWTuo7uC4232f7uvW9DQAcj0mGDAKAmXaS
 Lfhhj9Ea4b5E9yYkZYeov6HDFKcKM+RTBAYsr5S3fkrD0F12j7Vcw/zKS2XUWfY/vc/u
 k5dg==
X-Gm-Message-State: AOJu0YzRPKD23aTcwtUC4OiYg2omi5K+P3e39hNLAgpiGDR6s7sW8/iJ
 3yitgETObJE3Fy0HV6PDPndK9c3IIUw0yXcuVYfCI/Ff8/xC1yadNviBdVndT+LKRjKgpybO4Rk
 0x6xpDrwOjPiNd/wZA0xS4FlsiNW9XX9Y3sDWMfvUT9mFJt833Ig1Ni5E/zxhstGMyQ==
X-Gm-Gg: ASbGncup8apnF/Va0x7Dhrl9t9FfdP0Ou/QpWX+UshjIILK75tU7wU7YlkydxY3Paf4
 xH3SwqXwBHNQkhXC8TwicxuK2ZOcuVHpSBIRQN/xlIxjVzHIw3IULl3wE2kROs1zn7eg8RSotf7
 m0T9P3rQpx1vljtaEKzYoAo6r44ROOzgoC94kTW8AWKAupcYxCyRvFqFU08Od0zHJf+NqTfoWzj
 JZDAfbvacYjEYnhKlzVYGizt4tgqQgcXjNP4q0Yt2nIPUEs5M4DVasWEVDLqkDlb0whjtsDyNOw
 5Y10YI1BqIWf6g+QFk4ZtQ/5q30IiAB4EyUtx1SAvAZ3Lz0SMXp/yGzWkVHA821XUorcwox+Vw=
 =
X-Received: by 2002:a05:600c:1e8d:b0:43d:a90:9f1 with SMTP id
 5b1f17b1804b1-43d509e64ccmr96716915e9.6.1742726473824; 
 Sun, 23 Mar 2025 03:41:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkSNZSdq7eArqnlBENDvBsxVqNEh4KX4wpddMe2kFZUwaycW+S86D9B0UfsZcQxjTVw+lSEg==
X-Received: by 2002:a05:600c:1e8d:b0:43d:a90:9f1 with SMTP id
 5b1f17b1804b1-43d509e64ccmr96716815e9.6.1742726473484; 
 Sun, 23 Mar 2025 03:41:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd9e960sm81939475e9.29.2025.03.23.03.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 03:41:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/18] drm/sysfb: Provide single mode-init helper
In-Reply-To: <20250319083021.6472-7-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-7-tzimmermann@suse.de>
Date: Sun, 23 Mar 2025 11:41:11 +0100
Message-ID: <87r02odo6w.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: obISCmAswYYSTeWSD4cUSOKIuFZc4bO0-4HeaRhLFuc_1742726474
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

> Merge the mode-init functions of ofdrm and simpledrm to the new helper
> drm_sysfb_mode(). Also implement the DPI defaults there. Replace the
> code in each driver with the shared helper.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

