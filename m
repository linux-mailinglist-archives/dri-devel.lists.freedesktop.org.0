Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC847B00103
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 13:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1C210E386;
	Thu, 10 Jul 2025 11:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VeRcrgai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAF810E37C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 11:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752148770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ahoQBElSBkoxClyth9k7MWOdW5mJ9+hvXOXZAB99bGE=;
 b=VeRcrgaiAF25QDzWLQQ3CwzD0Np7ytKJS0GnUIqhB3ADLKtS3lmNHDYqO6JGPwg50ycYm1
 eKwS/hEb88iJHAzYPKfyiRvMNXr4wOi+gzDcTvI1PNhtmf746v2ton5mLuxHaXbpjkVF4e
 Vpnohu5Mz79v+xcaf22L38bb0uHM0IA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-iY8KRX_GMLuQIVWU-UT_zw-1; Thu, 10 Jul 2025 07:59:28 -0400
X-MC-Unique: iY8KRX_GMLuQIVWU-UT_zw-1
X-Mimecast-MFC-AGG-ID: iY8KRX_GMLuQIVWU-UT_zw_1752148768
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4e713e05bso514079f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 04:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752148768; x=1752753568;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ahoQBElSBkoxClyth9k7MWOdW5mJ9+hvXOXZAB99bGE=;
 b=mk5m9mna6m3o0l3sYuTx0txq7o9a2q1I4dlgUoEzhtIaalxpqhvY5ERLeqDxAcjZPG
 TyRFFVTecBJnDDDGcc+Pvh2LtGj6M+MzEl6GyBbGeXuD4fLYHjiK3EEE9LCfWADXs3dr
 eL/89mZ4uUwy+TCi4jU8g5IEmEPgdxzIrdYvJlo0Uv19rrAzslnrABUXIPsUSbz8B2cu
 iRwHEvhgn9Jv/2UkU9zJGnd2kd7Bvix8zx6MRci7Ye09ZRPY3Ptm4AiDPAKLdXrOy5go
 thRQkZt4AaNZMXHJAt1+FRb0nT5QxkoJ0j3xb8Whzj8r/jCAV7SD1K0YDWxqWzs7MPsi
 0Rqw==
X-Gm-Message-State: AOJu0YxLPzbZjzV17Rt8vjYMlWq9vO2rGIK2w6XuoU+Nss875yb/Xmyk
 H2L+TrLaZ6sjSX7dcZygtWIcQXxEfXw78fWCMxhR2jBizSXa54jl5ogsb/F2BPwXCFZfhmX98cm
 I8CcYQmZrgde1n7mkmn/e8o2JGz75SP2uvWJl8nsV0hJtaHxlSQYg4Zom6yPev20r4AEbzA==
X-Gm-Gg: ASbGncvqEB69biKw2FkWNLj2SKExAd/1wfAqFdRQLZCg/5Dk9KHzTl/gnzNZQlsaT5R
 GFRsbQERoK8SrLkv1RAPd3GCk/h9kX99ZK0m+M4FpKDxY5f7+J7paRdTLGAaD/3nqy2MebMmZdT
 Y8BfbyLBWS/PwZfUPh6JKvCd4p9TEdnnVJvj5y8vRtXVYfiv0Y3zGB+fPT5HfqzTTtmFTOxE/59
 NgLz7K8/sz/0RHhih+Yho7wrNY4V++4ExlA5LQTj+H04BTlwL6HJQPm+cR+JMrgQOC3oFpTds29
 F0GgYZO19xoAdxRm4p/DMsSXeI7GWNBvMn1AtORd+DFhzq1YVDe+DieI/wUDgxGp5geC1TrYfhp
 6X/r9
X-Received: by 2002:a05:6000:2311:b0:3a5:2257:17b4 with SMTP id
 ffacd0b85a97d-3b5e86f332dmr2114983f8f.55.1752148767613; 
 Thu, 10 Jul 2025 04:59:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWZ9E40Bru2XiSfuU6A5MGnXozhH325B6msi4rRi6AGGZE+oN2kmV9ZQ56Dv1ZEuAPjzICVw==
X-Received: by 2002:a05:6000:2311:b0:3a5:2257:17b4 with SMTP id
 ffacd0b85a97d-3b5e86f332dmr2114963f8f.55.1752148767186; 
 Thu, 10 Jul 2025 04:59:27 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1924sm1737197f8f.16.2025.07.10.04.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 04:59:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, Devarsh
 Thakkar <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm/tidss: Remove early fb
In-Reply-To: <20250416-tidss-splash-v1-2-4ff396eb5008@ideasonboard.com>
References: <20250416-tidss-splash-v1-0-4ff396eb5008@ideasonboard.com>
 <20250416-tidss-splash-v1-2-4ff396eb5008@ideasonboard.com>
Date: Thu, 10 Jul 2025 13:59:25 +0200
Message-ID: <87h5zkfe8y.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NEZVToqkxNirWY4c4kFeAm0bQZRB5jk9M1NzAk8yZNQ_1752148768
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

Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> writes:

Hello Tomi,

> Add a call to drm_aperture_remove_framebuffers() to drop the possible
> early fb (simplefb).
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

This patch can be picked and is independant of how the other one.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

