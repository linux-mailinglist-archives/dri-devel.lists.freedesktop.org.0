Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D028FCFD44E
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 11:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA4B10E59C;
	Wed,  7 Jan 2026 10:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NAUz4MvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818A610E595
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 10:52:29 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso6468235e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 02:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767783148; x=1768387948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyoXk4IsbX+mXFn0g5XNn3/4pH8CU481xkRQwI6wE0c=;
 b=NAUz4MvYIwXPAn+m41bZmfDR8NRHkY4bkq6zUV8cydNhquwx/H1QYTNzmrfypIftIa
 kJlPLeZTQWAFMS393lV64GThLJAhbAxaSNqkQv+GXn8M3T1zEYGtpFROAutDp4zhE1nm
 4EPYnxu40ZQY//zFPoqG9HYimgPoITc69NMieQ5YQbhBkcsucVBgaxUqfWCuqktVgJkm
 y+KcTq/l5LIxtKxm0E5hUq9IoA0LZUEz57wujelpmvs+A7WMUeVr3HNhGgzwF2g+lWtX
 Q/hVUH+ByPsKtVEhO518sdzKGp8Bk8/B8t67opodUMGUAZ3LY4hTMKs8CyN/wNHFpNGy
 bXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767783148; x=1768387948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nyoXk4IsbX+mXFn0g5XNn3/4pH8CU481xkRQwI6wE0c=;
 b=CG0GPliu6luiuJYmAd1zQAHbYy0hAbV6Nl9xP8SqsbhVYpFhMhE2APOVou2IVBuGEt
 WfZ0KvOAlEQ2zRJCWL1YuejvOnxxwzg+ksCqFsJebeATR4R5yE/GikJhM8RowqXogTMU
 pn36Nptlgzsu09iq5SunVF78268Vf6jix1fChtI10PthL54B7Systtos4N0K4SXu2ZED
 FntDUL/ZA3txHeB0YbMX39gRY3AbvER+atiAwVwK3X/ooeu85LUrFD5d1j5hD+qVdmBC
 mWEeRw5SwNw1xLBbdmTOGV4Kl+QyubxB+SsaQ5tqUfi2T9XZrTNFTx3oWiz+9WnY6JCY
 JQ1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfAk/6Od/I+EDgIx2T3sA1DxgTVN/Rz26HzfWbG5O3ypElE7nVo7MYdGThtavvkXuz5Aw5UHmA/0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyblzm5Q5dU3T65Ey/hVYo2iSRvVDlqJD+MxkDcQlqKSKTnxVGE
 fy/Zfgy7xkCEoQZENbxf4l2d96cu7v29XWlzJCr360lbVw9J82zIhac6
X-Gm-Gg: AY/fxX4w7/UHjUI41+ux6jIW6Tc5qSAZfuszMjeVk50+bnnm8/EK9t75LWEQzoB8Vj7
 fEWX4QeqkXOePx9uwyJDDO3ChpNsYRLfjIyIyTCzKBPBoWCGyEtaHVHqPzPD/3KMztUuHlOmG+Y
 7tAG562ZcZkyh3q2EABcwT+T456ZprtKljKpnnNmrOK9tUSauTafoPhE4AssD9tXB9677P8dNNq
 eLVcMUsjTNKfoH1A6sgzipVYLhE6HL7bzTYWGRjuEmRhsZo8s/YmjwzsqDtcL42vPNYFwfZXiXK
 TBI19twvvpRPYahZr8CxlgiMnmv5hKQzmrKGCEdLGbioPiIdgD5G+3v+Qspr4KgmGkjgrVoAgV5
 i6veyCr5zCmCdSr26FJpLHzD3Sm7+HLC/3PcSBo062if5lMRUwEfY8q2H36MyZLvEUUcS6W/EIN
 3D1Q+S6gHhGtkM6HqFf81354110IuAv4P+R+vNlaw=
X-Google-Smtp-Source: AGHT+IHL3EPa8T4LtY57ZbvaqYVDxgPMDQ9C9RQwVhu2bQ8L+PoqikKxi5xWl3SgLYwSuxkLp8jnCQ==
X-Received: by 2002:a05:600c:4685:b0:46f:a2ba:581f with SMTP id
 5b1f17b1804b1-47d848787d4mr23001555e9.16.1767783147643; 
 Wed, 07 Jan 2026 02:52:27 -0800 (PST)
Received: from ionutnechita-arz2022.local
 ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f4184e1sm90953325e9.4.2026.01.07.02.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 02:52:27 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: alexdeucher@gmail.com
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 ionut_n2001@yahoo.com, linux-kernel@vger.kernel.org,
 sunlightlinux@gmail.com, superm1@kernel.org
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
Date: Wed,  7 Jan 2026 12:52:25 +0200
Message-ID: <20260107105225.37703-1-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CADnq5_OXJnREtCUhyq4JWjKmih=k7hnc4w_y8mNd3J1g437V8Q@mail.gmail.com>
References: <CADnq5_OXJnREtCUhyq4JWjKmih=k7hnc4w_y8mNd3J1g437V8Q@mail.gmail.com>
MIME-Version: 1.0
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

Hi Alex,

Thank you for the detailed review and for pointing out the ordering issue.

You're absolutely right - I misunderstood the call sequence. Setting
resume_gpu_stable to false in amdgpu_device_resume() happens after
gfx_v9_0_cp_resume(), which defeats the purpose and permanently
disables the KIQ path.

However, I'm still experiencing the TLB flush failures after hibernation
resume on AMD Cezanne (Renoir):

  amdgpu: TLB flush failed for PASID xxxxx
  amdgpu: failed to write reg 28b4 wait reg 28c6
  amdgpu: failed to write reg 1a6f4 wait reg 1a706

If kiq sched.ready is being handled correctly as you described, what
else could cause these failures during resume? Are there any known
issues with KIQ-based TLB invalidation after hibernation on GFX9?

Should I investigate:
- Timing issues with KIQ command submission during early resume?
- Power/clock gating states affecting KIQ functionality?
- Missing synchronization after KIQ initialization?

Any guidance on the correct direction to investigate would be appreciated.

Thanks,
Ionut
