Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B074D31FEC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 14:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4B610E174;
	Fri, 16 Jan 2026 13:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZKXrMOY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E09E10E174
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 13:41:22 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2b6c397691fso13354eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 05:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768570882; cv=none;
 d=google.com; s=arc-20240605;
 b=NyaWeNHLnZC2a36DuYB9++uatipl/sMobef9/vB3r04q1/soB/mVuTsCuIHIqtM95Y
 +IRsb18KX9CeGlPg8rPLDprEtiRMbEWwHD+2CIN7coxn0L5827yS0+VuliGruiTpyMja
 ZlNW+8YjS9gl0Ob9BLKs5TNG7kK+g+B0FL2I82rnTttSOt9ekqbTjxcO+jcCTY/2SO0w
 iATZnVZBh9T+2BjuD5TURfY1GGQfewkoGw89d5G4hEGFOARfNNrij+2rKt8fEfpIcIq+
 2qSPnAkOv6IIlPpLQJQvQl26cXr+xhccqn1Ug+zx7O+WXuKmFvyN1DatkcpFZlXEJV6H
 ZQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=V9y0UWsoVgW4iFoQSPXpGrGQ5oYYFK8IA01Itqi8rDU=;
 fh=rUygKbnWnrTTZtIsV0sIiPOlHaJA+3H+aYPtOk/jh8w=;
 b=Z+y79gtQkRDDCtUjrCpVUadS6jdddiY7QxHHN9ZPrYzbKy6QGGNcM8bSCH7FjVSPeF
 EgSfP3fHhfYb1Cpic/RjzOyAP4oCYdSY9EN2c5rT8w+slhhqgwhzgczyoH0cKqwmPliS
 wDa2356Av7909wT2UPJJWOXyYMnKEVp0m347q1SxYUyFZHRanvmZC34dRWxXq0Yn09/b
 oTjAOAnc+31d+1YlyjHrWBKmlJunPDYf2OL6ZM3fADCmDtBjq3wNfNk8PXh4Z5w/XTpM
 eYLc03dATp4FE7eJ3BzjkdVcOQC2EPujwLqrlN/OVJqFr007hw1Rqz10NwyVm+0yJI4J
 jcfA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768570882; x=1769175682; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9y0UWsoVgW4iFoQSPXpGrGQ5oYYFK8IA01Itqi8rDU=;
 b=ZKXrMOY3Uv9GLc04XozwCsn2ycFZCrCEssa2rzWNwJndEVwslsHvtWNfAxfOD+a9qm
 BBOSTt1hw3VDSOodeX1z4LQg1HOhkzXSAE+Eq2XaU+diyLJXZCo/gobUTJCPqYar44W7
 5ghL0YsB1ULpmPPpzzqb41Z2JWNkF3jPZPppTlkn44PJi9Q9t9ks88U2pvDzXrRe65gC
 WlbYEfBUtzolE04Z4wPcflsKI3wzr/PUe/OpdQHqn8xRXCyXoxT+zFum6vOwXFeJxUJf
 QLDOmW0SayCcn3l31hJxKqAdbZ2+o+8rZwkZPCTwWjZZGvkzosJDsEgdkJiijGKyZg1v
 jj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768570882; x=1769175682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V9y0UWsoVgW4iFoQSPXpGrGQ5oYYFK8IA01Itqi8rDU=;
 b=DOLSVW/rbwvA9zNdWhieAk29NjneXHhAHmGg0V2rIkjzhslqYawYFAJZ4rdSRVlzpW
 zE12+oxiZt3tmLp6SjSktgbKGQotbv5bMUR0qUqIIXRKo8GTBiRLPDyEv5Amm/+LLk1T
 Py8eQu0FlZbpgj7j8HmLGnxHpb7rgSH0EgLslq0C2Nwr6JZHPebRrc0PXKmD7Wgg7vm7
 OWA2CZrUlzVt+6LrjRuW1XRBLq78vE+ApoWWKY1m/QF4D0zO8PUrpDtUPQjDuFy/URwg
 3y5DI3BHs68u+YmgI3c2nbVai3e+MEstm5aTcGYRYk76r8aWL+8UP8xip564amIW3cc7
 cwtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAHkewKOUMMR7zl8M7XmDYJETh5SgTfnVCqDdH0WXkcb/fV5/FzrbauXvEiMNP7M71cFuiv7o4644=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzStETvy5SkRE3rX7P3wT/Lc6+y1DtbgOjjC0sZsuis3pe2x46n
 Rv1ISiHdtIGGuPeT4KtVDulznu06ldcH0+kGanAdB44RV2AKx8Jtwi9TwFTSmvxLkeylwp6AZ8M
 /1juromSVgtTwOI3DKZxrg+j7MAiC+d0=
X-Gm-Gg: AY/fxX7md8Je7vol0x8Nz9AU0yqS55OUSHX6MmcJvVURVIsHx2PcrSRqnNdIutyL0Sy
 o2oETb5N0s37+UCkiQCg+AwDlhs1OLkBdQOj1RTs9a9WYWub2y4Wk8jeeZXMl1j0sHtJg5un505
 GbnY7SpsUqVduqpOsIQzTtVOhM/XqO6AGPJKglQICbOXngDfCu/RQM5zsmaAQyTvEPWu8co2+xI
 ELJoqHpHCxOPrW48C9b7ktCCrWVoQ5FBwNr5PYtU1+RLW6DdHauEV09izkBGKnEqQ8rQ1Iu
X-Received: by 2002:a05:7022:e11:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-1244a7108e6mr1630698c88.1.1768570880647; Fri, 16 Jan 2026
 05:41:20 -0800 (PST)
MIME-Version: 1.0
References: <d681a658-cc84-48f5-beb6-2a327a355079@sirena.org.uk>
In-Reply-To: <d681a658-cc84-48f5-beb6-2a327a355079@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Jan 2026 08:41:09 -0500
X-Gm-Features: AZwV_QggKEgzMJm66Yn9mIem55VKSHck6pdk1h1L735LzyyC23YF3DYEnzr4BVc
Message-ID: <CADnq5_Msqi0Gno2Rph9PC+FRA40zDmiqL-T9MmFHaVe1yLMm8g@mail.gmail.com>
Subject: Re: Many Fixes tags need work in the drm tree
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Jan 16, 2026 at 7:37=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi,
>
>   0288a345f19b2 ("drm/amd/amdgpu: Fix SMU warning during isp suspend-resu=
me")
>   155a748f14bc0 ("drm/amdgpu: always backup and reemit fences")
>   16b5ad3195247 ("drm/pagemap, drm/xe: Ensure that the devmem allocation =
is idle before use")
>   179176134b535 ("drm/amd/display: Check NULL before calling dac_load_det=
ection")
>   25314b453cf81 ("drm/amd/display: Apply e4479aecf658 to dml")
>   563dfbefdf633 ("drm/amd/display: Reduce number of arguments of dcn30's =
CalculateWatermarksAndDRAMSpeedChangeSupport()")
>   5c5189cf4b0cc ("drm/amd/pm: fix wrong pcie parameter on navi1x")
>   72aee5f70ba47 ("drm/xe/svm: Fix a debug printout")
>   7edb503fe4b6d ("drm/amd/pm: Disable MMIO access during SMU Mode 1 reset=
")
>   a6ea0a430aca5 ("drm/amdgpu: Fix query for VPE block_type and ip_count")
>   b20b3fc4210f8 ("drm/amd/display: Reduce number of arguments of dcn30's =
CalculatePrefetchSchedule()")
>   b5179dbd1c147 ("drm/xe/guc: READ/WRITE_ONCE g2h_fence->done")
>   bb5dfe2f5630c ("drm/amd/display: Add missing encoder setup to DACnEncod=
erControl")
>   cdf6e4c0cdab1 ("drm/amd/display: Correct color depth for SelectCRTC_Sou=
rce")
>   dc135aa73561b ("drm/radeon: Remove __counted_by from ClockInfoArray.clo=
ckInfo[]")
>   fb62a2067ca45 ("drm/amdgpu: don't reemit ring contents more than once")
> In commit
>
>   6ef93f62533e4 ("drm/amd/ras: Reduce stack usage in amdgpu_virt_ras_get_=
cper_records()")
>
> Fixes tag
>
>   Fixes:
>
> has these problem(s):
>
>   - No SHA1 recognised

These are cherry-picks from -next to -fixes so they refer to the
original patches in -next.

Alex

>
> Thanks,
> Mark
