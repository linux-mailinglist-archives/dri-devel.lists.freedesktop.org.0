Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9840C2BA43
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 13:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8122810E3C4;
	Mon,  3 Nov 2025 12:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G/puxMMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F2D10E1CD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 12:24:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7a9e8a15502so1148860b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762172651; x=1762777451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ORdNUFW2zEJlWs19F6Wve3Y3tfAR17V4MJgrWtqk7Qo=;
 b=G/puxMMM3Q69AllUgP7kUdD7fWDi0P4tbth9jysT0vuPtztZsG+H2HMSva47GPVaE9
 oFmK3Gw+dfWRvF8NuXyXK74w8RzYy76uPo3jVG8+1Q7qycyK/GsiF9t5UBwVG7uCOtBG
 Jij8smZ2kEHylFB3PJnA2JM1t9tJbJFdoli5ywozACwOniKxR9OKI/UryyfPDdJMEJls
 t31KSbji/L99+bsSmG+b+QdPPo4Jh7kBGoZTLcdgXQWZoRpsDEHITfQyXXs4bRZdJLVn
 1CYOqU6wAAvzAGVgRQs+I//vkAEXH7Vc3PC5utM7FJLddID3qBvGIAeSD13k5HwwBiM5
 f9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762172651; x=1762777451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ORdNUFW2zEJlWs19F6Wve3Y3tfAR17V4MJgrWtqk7Qo=;
 b=xHW+d347mHvycDiSzhobQOcJh+awvaoV6wCE1w57a/4+rpQ5VQ/JbPVESrAmUyV8P3
 PHmTdcdQZYWZZXFu0ohLATApjmiCBUahAYi1TE8N0Q8gaeIHIjUeNWN+weh/rpP+cnWf
 zv0gknp/Xo5Fen2JPuhOwDWZb1Qc33waAUYwzYRFwV6ClInh5mSJd3rp0dKvoo2M7beS
 1anhIC/tj9fAr9uAB9BNfkXQXfG4ToENGdSLudAdkJ0L2pLXXI9EHVkzQ8Vzomr0cryW
 3pKXQuNfRdWyfq3nSwrzVEmmBty1gzSPmrKJRxLdfkyFcKrsTiG0zM+C57rUvKIvRc/f
 rHVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN77Vnvf+P87jDAEw7iHfder2mAzLLYmIvBoDTmPjgV18iELWmv7zAxUkvjvfTpg5SCB/lBx3Dq08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6buTJ3FoibxlMcdQK1A48ZHplx0wnaiX0igeWCZ7gbjPzIX5K
 alCN/0kvwLi4kIAHnJuYBCndf/sVaSgROa4TQpGRW5SbYOCdzqv6iPOH
X-Gm-Gg: ASbGncvaXXphs7xg/++9Gzz7zlI3Yu6lLpoLIpfKncRe3mo+ZQBhkHyeZz7Ws6AsCO7
 3DlWu6jjHGLpO5dqizq18paglO8NKiyqeulR+wQvN0du+dJgYig4Fq6bgIIUJ3UZZ7EF/zZfnVQ
 P6gtXuSzCFdW10n724ezOUYfMW30QRPil0IseEa46DBSNjmUsLGU5Z2qpP8MBBObTFOPBQeBP4i
 j4IoBBVqeVO2TQtQOgidy/oG0fQL/6ObmF+cnZ9DJA1lS2FFxLK9RgcJAv8tLDlXxjidiZa9kSq
 8dEHJ7WKd1NvzN99VlvgsKUjHUpaxc9Aer2qjC9tOu8STAQSVMQPSLsTBsZBVWerpsvEem0ioq0
 5N5teEh4VA59VmDOCQd6KKWb0lUZ2jyV2um5qa/pEi8gfsmhXAtQDRrroTwzXN+xG/BVr1BDdke
 +fh7HQbxXUzX4o6x1Dwl6iRFPbQoB3hiMPm51eC9a/63OYCCBTg38f4Sclbyy348c=
X-Google-Smtp-Source: AGHT+IESpNdOSIFJ0AvELFe2mn5VOX5nqvF9BWuKg9gD11/Sqoj1Pk/e1iUdylQepkg9PBFjDt6oNg==
X-Received: by 2002:a17:90b:2b48:b0:340:b572:3b7d with SMTP id
 98e67ed59e1d1-340b5723c4fmr10683210a91.19.1762172651160; 
 Mon, 03 Nov 2025 04:24:11 -0800 (PST)
Received: from DESKTOP-RD0GVCL.localdomain
 (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3415c8b78f8sm842554a91.20.2025.11.03.04.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 04:24:10 -0800 (PST)
From: LiangCheng Wang <zaq14760@gmail.com>
To: nathan@kernel.org
Cc: jani.nikula@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/tiny: pixpaper: Prevent inlining of send helpers to
 reduce stack usage
Date: Mon,  3 Nov 2025 20:24:04 +0800
Message-ID: <20251103122406.741-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031203446.GD2486902@ax162>
References: <20251031203446.GD2486902@ax162>
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

Hi Nathan, Jani,

Thanks for the detailed explanation.

Understood — if this only happens when CONFIG_KASAN_STACK is enabled
with clang, it doesn’t look like something that needs to be addressed in
the driver itself.

Thanks everyone for helping clarify this!

Best regards,
LiangCheng
