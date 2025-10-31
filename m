Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD555C23DE3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB2C10EADC;
	Fri, 31 Oct 2025 08:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="gfMnIMTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B106810EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:43:00 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-376466f1280so24816831fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 01:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761900179; x=1762504979; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VPEaVnHIyEEykp68DuPbpbxptxzT5e1LgeffYCAMUg=;
 b=gfMnIMTVkrgvnIRX28I08N9wBYIbHQ3hbElE4T044H+XWUDU0UD/7bWr73EsDpwSF0
 CJ5YjHTJKNrIBXMnmjXA2le38J+Zedb53zYoGl/7tUkvimk9Zzxu0nm7EpOCD+1mkBDo
 YeBEQ3PNq0lBYsAjosw+P6aT3Rk7kZQwpsrfTclVmGgbWk9W2hzqeSidsq6Ko/QWF6dP
 k9K6p8+d2p/l3a1M5W3WlzrsfX87DXw9yISRz8ZTLXqnPvHagQxnAM3SVOGGFyHU/ATz
 17TEhwHVAIPPJeIDBkLre5GRhPyiMnKZO8dozSx+HMa1hCV3QaCBcdxIIsg/9JDNMFVN
 0sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761900179; x=1762504979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8VPEaVnHIyEEykp68DuPbpbxptxzT5e1LgeffYCAMUg=;
 b=f9D7vaUM4BaoE3r5uTUrZgK+JXAUcXSxmYIDcIPMKDOYOLzHU9ClWHt4/yz1HUPY8s
 luFLUfTsQWObp97sqaFlwlj4gLWdtp/u6xQy+INK/VrXOCdk2rUsQWkYn0Ar2cp0Ai3l
 xWUWPFjSv6znlqujtQwpH06396zUvVwNhkA24NSYBNiBY/KCflhhQiplILlLHXjakX6H
 jDTlxvgR+2HjAV0K/oVUGrxG6xvxlIN1FVfTPpN8YaL6aEn8GwMNCsjIrv8mc+DRYUJk
 g/qJiObz+EhDKzl410yMabggQl5opiCBQgz8qDkIEBIn5Z6xJ36sAONkkPiMCTnyh+7j
 rneA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0V/sIF7Y3arYVzjY+E8ZlbB3cK/+j7zHYu0fD3FyUwgRPAq+qd/IaBakwXhVLqozqhd7raQsvLcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDxai8KAkrdpvT+qRKBhcxaVQ8QxdZvQXIj3ZqoRHlmzpsv/og
 PzYKApFv4Xut2jIFt9idVmIyPDXSA0A/XjVz65Ep0gKVnXQ2LyUfiSRFIqUM/j2V2nOpr6+kKy7
 w+zyMhv3TFvYovjXbxkCiV1lA7HCjcIHRfyVsHJ67JQ==
X-Gm-Gg: ASbGnctkiByjoVNQ9juqRYtF5E9YeROpRqgWp8N/YGZuoGjls2YYd56GOQY3FuE+099
 XQJaQM2BCiW+1vtctNfEm9wv2wCx+3ybMYWMbDHrQtBGOGQjZjIfib276xGgmqNg7EyeVHq7AP7
 rPhdkY175f8+X8WdsI+5szVx7cOvzg/o+EZ2trAFzNT0EiJJd92A48+hL/S7zumMa7cy8pLKN9q
 nma0s3cLsBZbIrwl4DkQs3yEbeIXpd3MW/gnpgOOJiJUB6CFKu+6Oyeo0gdxqE4y9fdgKn0pDuW
 380Yu/f9DPa4EXU8/gwfoVM1tWCt
X-Google-Smtp-Source: AGHT+IHGJmqlIXHNOm1UUUwV1F7p+xTwNQl9Kedsi6/i4Xko3qPnKOYsj5yIF7hW0Osmxc3o0wmHJE08wvPDk4Ri8KE=
X-Received: by 2002:a05:6512:3a8a:b0:593:f74:91bb with SMTP id
 2adb3069b0e04-5941d52bf43mr870426e87.23.1761900179006; Fri, 31 Oct 2025
 01:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251030161011.282924-1-marco.crivellari@suse.com>
 <20251030161011.282924-2-marco.crivellari@suse.com>
 <813d07f7-b430-4c95-bac3-931188415593@amd.com>
In-Reply-To: <813d07f7-b430-4c95-bac3-931188415593@amd.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 31 Oct 2025 09:42:48 +0100
X-Gm-Features: AWmQ_bmgqax5gxHAeWzVR_zTAqsONzdP2NZEDUwQUNjiw7YBE-IHcZ7XDLkhobU
Message-ID: <CAAofZF7d+t8Qqojawes8WAR2YOWz7vMtgt2y=ofJHN6mChX6DQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/amdgpu: replace use of system_unbound_wq with
 system_dfl_wq
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

On Thu, Oct 30, 2025 at 6:14=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>[...]
> In all the cases below we actually want the work to run on a different CP=
U than the current one.
>
> So using system_unbound_wq seems to be more appropriate.

Hello Christian,

system_dfl_wq is the new workqueue that will replace
system_unbound_wq, but the behavior is the same.
So, if you need system_unbound_wq, it means system_dfl_wq is fine here.

Thanks!
--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
