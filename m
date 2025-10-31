Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC45C23FA4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 10:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F71B10E165;
	Fri, 31 Oct 2025 09:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Wbrcvng8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C68A10E165
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 09:01:34 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-592fdbeb7b2so2651026e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761901293; x=1762506093; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sz8A+kt2c263JVWpwySRC4hb0MoNUZ2J+PKEPthLk9k=;
 b=Wbrcvng8vP2ulQMKRl6ssHR5V7IYN/4gjaieh9oSFLjvDaQoQZ1Qaw/WhOSW6EwovK
 CzsymA3TMK9qm+xm/lIVEYcUIsd0qIaT3xu3D+VUkbf0EGR+keIVtTMXAA+WdlkFLFjN
 /jwtPCBgpmQEEur6R5v2Myon23CiGCXebRjftpnHKGHzfksHxVQsIVB+PEQ30Omu4mNd
 31hIz5NjBy/CiLRqkgzj3IjLLYTbDF8XUnimg/H99znIAlviTl69cRFwLv1PeAGEIA35
 gKJt82sq2oEr+I+UF1hVJA0LurmBjQH/rviduEs4zOrg3TSVYOyITXu9yDMXhrqo8cz6
 C2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761901293; x=1762506093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sz8A+kt2c263JVWpwySRC4hb0MoNUZ2J+PKEPthLk9k=;
 b=Asq9lwFoJ34KTxLMT/dib2wb6HTCgAFyG+tqNoA8jWBYe01jQvXv257D3zh6icGU0V
 JgyXrTzL82a5SD0FH5d9R8Il5tAyMyn4bXkFGJFgUr5ycRI1gjL7ueeNynlHR8wT3mbw
 fMjPIH9GGPOrpWtF0FCtTbZ0V3nw4h39670RASUI8nPqxPtYG/ftd1OW8+SjUi2fp+Kq
 3FZrjGPXxCbyVKtCHvXKSqNFtNPx3OofEaEuolWOj7sliwFpvUsn2EyDBuZun+muT1iz
 mvoTOrWAJ51eBwgUWM1wpKjOL7V4ObcDwvrPMO17N34jaZONSlVLgMUwu3BPL34yAfx+
 XeEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwJKsQwR8JL1kPGxV8fWPyR2+Psz6FaLRK/BpaaRi+J0JtMdZRPvffE94KZ8ifqiPVR+Cc5t9gebU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyESJmbwBPofp6Mh5Ql82hAmdW+RNsfStjsC5HNoRTV1q+uds7D
 1baCYwP2q8yFN6+jusJdjRh9JsHfimWbrYimI+rDKqwxbmLLNLak/u0oph+sIKJGWlqFUm0kOnG
 K/yN7xgJPbCoFah8ZuBugQHm2oNlaq2yvy896oC4mDA==
X-Gm-Gg: ASbGncvPPan9+/2V7LFk9a3KN7+hFg7MwbwMSpv3o8fXSDj7bfD+RBe/ZWR63n0uVCk
 6H/hPxjNsMUbmL7GGezVPxPYvJFbH203GgnmdC47m9LA6WTw8VAF6pFrnw/LeOvpwJZA/9eN00+
 pb1vX7RCpZG+1NnCgHc5Hix0XNw0AXw0q2GE5eif0dLCOJzGQGKR4vv5DtMKMn3sjQN3BJxC5qg
 /rg65OCO6PM63wefT+nTCCx1FZXierHsOWlwDUohsIR/c6zQFzjRWY3DdnTEcY4GS3Zj/G1Xshb
 VigMlohnGpHehuIQVg==
X-Google-Smtp-Source: AGHT+IG6dDTmqgRndauEm3n43gUUTvbxoIAo8xjrG46WEWaGTmwuwaI0CaRln1vBjuRad9gGiPuvQ5vdbLdXcNS55e0=
X-Received: by 2002:a05:6512:3c93:b0:592:f9dd:8f28 with SMTP id
 2adb3069b0e04-5941d53e85amr990212e87.35.1761901292415; Fri, 31 Oct 2025
 02:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251030161011.282924-1-marco.crivellari@suse.com>
 <20251030161011.282924-3-marco.crivellari@suse.com>
 <34829993-a888-4f7c-a2c6-e87723644c3c@amd.com>
In-Reply-To: <34829993-a888-4f7c-a2c6-e87723644c3c@amd.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 31 Oct 2025 10:01:21 +0100
X-Gm-Features: AWmQ_blyHKRMjIwqs9IEExJag89S5F7s8p2T3thDh3CMhSPUjI4-6H-ukHS_NTs
Message-ID: <CAAofZF5pSB-kJVr_PJbo_845VbpaB1Fbf+yeA74sWOU_vXfypQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/amdgpu: replace use of system_wq with
 system_percpu_wq
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Oct 30, 2025 at 6:10=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>[...]
> In this particular use case we actually don't want the percpu wq.
>
> This can execute on any CPU except for the current one.
>
> Regards,
> Christian.
>
> >  exit:
> >       if (amdgpu_sriov_vf(adev)) {
>

Hi Christian,

like for the unbound workqueue also the system_percpu_wq is just a
rename for system_wq.
Technically I changed the workqueue because we added in the code two wq:
- system_percpu_wq
- system_dfl_wq

You can see the commits mentioned in the cover letter, shared also below:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

So basically the behavior is the same.

But if it would be beneficial to have an unbound wq, I can send the v2
with the change!
We did so also for other subsystems.

Thanks!



--

Marco Crivellari

L3 Support Engineer, Technology & Product
