Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FAD9B1BDE
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 03:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3238310E068;
	Sun, 27 Oct 2024 02:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qQlzKhpf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC6610E068
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 02:04:29 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso3249926e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 19:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729994668; x=1730599468; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LGZSUHq/ZmNUpRTh2RnbZ3KXbycvJz8k34ztj3MvaYU=;
 b=qQlzKhpfork1Kh0YwEigCBUXQNWD9MpWG5uLtDCpnuHOA4Csw28KL3eM0NJ2FK0Nvp
 NUCU2ikvUppOfManG36UtcX+8wVYfxeKCAvcV61GRwD1AdZVopD0r6qCrBDugQh7o+3k
 efm8YXcS3z60zyljIOy3NDUTpRv0SoaIDfvPwzlQvqoZhOEmkSHyjnNYq/AOMaLoI+XF
 wYq536sVGNngAKfhe+z4LSHfpv+5ytEbzG680/C7abpiuqyCLQrTnO3CU6KegG3jYYbD
 /GVh+OSMEsvJ9DwrHIeHCtr/l6LPu4MX4hCSwfxgm7Zbpaqzhe6WCq+BXhyTyFcINdFo
 yRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729994668; x=1730599468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGZSUHq/ZmNUpRTh2RnbZ3KXbycvJz8k34ztj3MvaYU=;
 b=F0aStwIqdEfXHCci5OkMJ02Q8AO+HD6GGOs2pJrz7c2WfWOvCCjsk5RGMiw0tMLAQT
 DR9v1IrtghpHF0puhhinoKum0ztwRyRiSK0P+uQBXsm5IvK+g/XmwyPflXjbcVChMKAv
 2nW1XY4Ozm4L6csDmrqPnsHypXdv0iZrdyydqfbgRl1YBCxL3sU5AsrJ2ypZzl0obUWf
 U/2EgQ9MwSgDKZriAEO5q8CZh086nrUTFCBZymir2ebx0H3aMXQsD4c36nRL3gRScWdO
 MPUdN0Qr0I127Qv9BAK61atgQZF9jjpjzJW/HZwCgIMkfUGIqouN15Jpfgss2K5k2KM3
 i+xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfWqBgK/G4HRGL/abDWiOptj5iHJNj31akxwBujUJOnQh0K019eM89HGdK3z7izyhmPxUZxjIvmhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZzAgKp/PFHT7vA2bXsvJ1UT/RE3/HABGsXNQ//bFVtKHToSIx
 H8zSoQWVfBbK78oWIjF6ruEq19wh1dGuX/pezlCAPDKMED8HfIiedN+2isSQW9g=
X-Google-Smtp-Source: AGHT+IHPoUUcDRY5D2XJo8f0YTIXfcWPksVBaLDAXMrn0WjwoyAQfwqBD1jOM+o1BPYOuwrQECaMcQ==
X-Received: by 2002:a05:6512:3f03:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53b348cb983mr1473251e87.20.1729994667621; 
 Sat, 26 Oct 2024 19:04:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e10a915sm644940e87.12.2024.10.26.19.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 19:04:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/msm: Avoid NULL dereference in
 msm_disp_state_print_regs()
Date: Sun, 27 Oct 2024 04:04:26 +0200
Message-Id: <172999465408.389213.17351972800864480225.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
References: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 14 Oct 2024 09:36:08 -0700, Douglas Anderson wrote:
> If the allocation in msm_disp_state_dump_regs() failed then
> `block->state` can be NULL. The msm_disp_state_print_regs() function
> _does_ have code to try to handle it with:
> 
>   if (*reg)
>     dump_addr = *reg;
> 
> [...]

Applied, thanks!

[3/3] drm/msm: Simplify NULL checking in msm_disp_state_dump_regs()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/74c374648ed0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
