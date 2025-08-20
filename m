Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388EFB2E564
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 21:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CF810E08D;
	Wed, 20 Aug 2025 19:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ldQA/PLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B88510E08D;
 Wed, 20 Aug 2025 19:00:03 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-32326e71c31so235216a91.3; 
 Wed, 20 Aug 2025 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755716403; x=1756321203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrznjweAHSf23akRjxTFtNg5TyltX7+f+/5p5bUoEow=;
 b=ldQA/PLvUGi6JTyqMeLanUw9kidngCA878V7sXNkCQo7TP4aGYpfGZGxVVE1DUcUBr
 SVaHj+QltWQxdrX0Cs9EYRRNGgpruLazBY+QTPo7X7IvUvH5KJvRqaLjm7WDPnOhropO
 MpXA7y2yqSS+OKuDZVf8IjNJjd7yHmr3dbtBjVa2Zldz40CjmmoLubWN/UXph9XqzCKx
 B9kKBzjj9ecHVWAsWeMTfNAZjHaU6N9kA5SZaA3rlwaeOf+Vu/X766UFDdy5ScTnG1Gx
 RFGvL5Y4rBcn53ANuQPqI0TAlRboIbLg3QYbeuWZY2/awu/xarn21r8CXfZa+6tYEbTh
 X/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755716403; x=1756321203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrznjweAHSf23akRjxTFtNg5TyltX7+f+/5p5bUoEow=;
 b=DrhCXSE322GW6UVZBizfKA/G+QnIbiNvB2hRJHfWY8o+dunM3HbXIMVxJZDzJtgpNq
 AgI23ffVIR8Wz0WcF6T4pdrlrxSuGK5Y5ydF17E1gxkAIoFjvXEvBZIR9k5q03Bae6/j
 czHSEsBc1sLL3LlDF8Oat/0JCT8EBLZX0nR9WwWvkVDQ8XiDrQM7DPexa1T6UsQKAz7q
 PyKYKbUzvFOVTwBjd4jw2ZG4QWQQrg8G+S2tGYAVecVLUQgmgglUsqt3pqkBkVQ4wuQf
 VhrTRPM1zJHAoJ6xpBDa4tDWkThZSeJZcxgejw3xzEo74gggjg+/FkR5mWcZ7iWBiYd6
 I3Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcasryWpHzpZ6RnsLdNKlo3K9hGUlsZaXrJq4qi3ovjWnk3xOLtIE3nF958PGHYCqN9XRf6cE/g/3J@lists.freedesktop.org,
 AJvYcCXvKR4Pk5OOsOsFt5l338UHcFExwnayoUxTHIHlWGIrXOkqDZnCpz9RNO0nl92iln9H+WuW5HDA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOqD/rO2f6NH1HM+cUv8iOQl9zhzFgdBNeE3AbekB54Fo8ZDvC
 YW9E/LtsqM3EzINPnQq2/URCK2h/P+QbALLvWSs8vpszUdS+vKYy6cx4
X-Gm-Gg: ASbGnctHOdC2myh2LkbfRptJklxpvne1SORoWUfKG1vC8rqkeGxPp4Uj3dE/ZaLxq38
 eioLZw0n/vRLT5vBCvLco50Zv843NQWlt4mzVC3wCBcuBLh3g7VpGhY8SdeOmyphryqlZiPD7gr
 DemLjCkeWOif+YvH6UU3SPLeXNZHz8vphieqdLnNlcjslk6tvYvLpEqMywTmpej+jm8IAxWDaKb
 /rE4gtcej2M+MfX7BPMryI2co48OEttaYM6W6wlCT4YMHx6ASw7rs+H0U7VW8k0D6NRE/FkYfTf
 2S2IsoyQvDFfBFjUL06KQYqBReHbrsHx0/hnNE4vVU1zJ1w/0qVAvGh7gcDQKRiM3fsO9PqOmaJ
 NioZ2hSR04hsKYid/33fPud/QRR8=
X-Google-Smtp-Source: AGHT+IHIKPBZDKT7w7IpWopx5uH4BHntATqlKUcI2/L3Cr9WY9dhlh8vnxgsPvJdCqu2ZnTQWYHb9Q==
X-Received: by 2002:a17:90b:3b48:b0:323:264f:bc42 with SMTP id
 98e67ed59e1d1-324e128ea93mr4998711a91.3.1755716402534; 
 Wed, 20 Aug 2025 12:00:02 -0700 (PDT)
Received: from lkmp.. ([49.37.163.128]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d4f780bsm6089677b3a.71.2025.08.20.11.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 12:00:02 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: rdunlap@infradead.org
Cc: airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com,
 linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, rakuram.e96@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, skhan@linuxfoundation.org, tzimmermann@suse.de
Subject: Re: [PATCH] docs: gpu: Fix spelling mistakes
Date: Thu, 21 Aug 2025 00:29:01 +0530
Message-ID: <20250820185948.18805-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1fc93d62-eb77-46a6-964f-c0bc7348d482@infradead.org>
References: <1fc93d62-eb77-46a6-964f-c0bc7348d482@infradead.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for catching that. I’ll send a v2 with this fix,
including "fourth" -> "third" as suggested.

Thanks,
Rakuram
