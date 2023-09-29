Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DEE7B3A71
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 21:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AC810E1B0;
	Fri, 29 Sep 2023 19:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D260E10E1AE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 19:15:05 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c61acd1285so78768595ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696014905; x=1696619705;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KmMPdMlbowfuuOi3X39k2z6HWTuyzAeHfZfHAs6NLF0=;
 b=CES4QPKwSMToQpBeAj+KxF8fRlULn0qeyyitYzUybgbYtg+02PXWpFTr/Rmbubv/Xh
 /JwEw/B3jDoK4+vRTrKR2LfhdqykTZXkOJ2hsJKUbwmiXqe3aCrEVFceUf+GTy+Chyaq
 XCl1LEeyQnOmYRLM1XVAqA4yat7houH1QSb70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696014905; x=1696619705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KmMPdMlbowfuuOi3X39k2z6HWTuyzAeHfZfHAs6NLF0=;
 b=gScM7d+dc8DeoqkOb27iR1Qc33LnV9//qtlL3xfEWBmOxB747YbyAREje+Lbvqxyui
 J4lurZGYQfQpO6JUM+Su2ZoVOb8qGS3wd335xOEhL/t5WRrJSRmrnvgtAAEN7XQz+yNg
 XIfa+KMdZPaPWuqgABxImwNSq+L4l71jZhACoRBScRax3OfAtYYVcMvU8dz+q05pU7HS
 qQLyvgI3vJkY0eutsCs065kriseGuNvZAn+Q1vv3LuK0seybVnG+nNIyqiY5+AIow8Pe
 NUSxPUWcqJnVLvk2Dlpjj9+kkqFAVeY2CaVjaDmQsU3wOY+R2MS5qMTfUdnJTHtAdpoC
 mkqw==
X-Gm-Message-State: AOJu0YwlCrWkhoCJGfYL1IlfE5MskXPbnvDx/oeALhNuqxOXwoKgiwyl
 J54LYZigVd9+dZ0kYVWZkyelhg==
X-Google-Smtp-Source: AGHT+IHn9fG24NkWQSop20WR8dA5EVPPJq+6v8Bm1V0s5HHwqRAUVrK+MKpf1w8l16fN1Y00fR7gjw==
X-Received: by 2002:a17:902:ecc1:b0:1c5:d8a3:8789 with SMTP id
 a1-20020a170902ecc100b001c5d8a38789mr5938636plh.4.1696014905256; 
 Fri, 29 Sep 2023 12:15:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 j12-20020a170902c3cc00b001c72d5e16acsm4109005plj.57.2023.09.29.12.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 12:15:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Stuge <peter@stuge.se>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] drm/gud: Use size_add() in call to struct_size()
Date: Fri, 29 Sep 2023 12:15:00 -0700
Message-Id: <169601489950.3012131.9568928913525935036.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZQSlyHKPdw/zsy4c@work>
References: <ZQSlyHKPdw/zsy4c@work>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sep 2023 12:43:20 -0600, Gustavo A. R. Silva wrote:
> If, for any reason, the open-coded arithmetic causes a wraparound, the
> protection that `struct_size()` adds against potential integer overflows
> is defeated. Fix this by hardening call to `struct_size()` with `size_add()`.
> 
> 

Applied to for-next/hardening, thanks!

[1/1] drm/gud: Use size_add() in call to struct_size()
      https://git.kernel.org/kees/c/836ccb46073e

Take care,

-- 
Kees Cook

