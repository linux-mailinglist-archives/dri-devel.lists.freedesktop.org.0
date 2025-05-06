Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA9AACD1F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 20:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BB110E0B4;
	Tue,  6 May 2025 18:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Tm/IytZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531F610E0B4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 18:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aWntLMvKQh2fU8RZD3K8ijyvjUm2x6sTLSJWVhKsf3c=; b=Tm/IytZv4a3MBQ9qtaw8/l3ThU
 ty7xGvXbx79HxzuT4cHWr8l7D7Onl/G8YZiB/LT3KAvYRkrnxdGI7E7l7fNytv9VBp/WyZF+BZL9B
 tyP0LxbXB7+2eVpSy35H9tJF4q1MUrxznfPZsFcTC6sRVv/F8vYJ/lFq1lCdsSaxmPe3wSjd8XFM8
 iwndeG3gNl3rCmTwZyKqUBmpk0qXvXJJsQ1q4VR4wkEDDzJdbAI5Teei71w00Sd2GxYig04wRSTme
 8O333aEb57WnJU50Ps50j8Eo4yuzc37u0hhCF+LPexuqX0wxubbnYKNt4YzDYbnx8XO6CLdt9yLJT
 kEHv2HVw==;
Received: from [187.106.47.130] (helo=[192.168.0.254])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uCMtD-004KdV-BR; Tue, 06 May 2025 20:23:14 +0200
Message-ID: <7d6e81a7-2803-4565-9c1f-0b643b89d1f7@igalia.com>
Date: Tue, 6 May 2025 15:23:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/ci: python-artifacts: use shallow clone
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250505141139.472175-1-vignesh.raman@collabora.com>
 <20250505141139.472175-2-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250505141139.472175-2-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 05/05/2025 11:11, Vignesh Raman wrote:
> The python-artifacts job has a timeout of 10 minutes, which causes
> build failures as it was unable to clone the repository within the
> specified limits. Set GIT_DEPTH to 10 to speed up cloning and avoid
> build failures due to timeouts when fetching the full repository.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.fornazier@gmail.com>

> ---
> 
> v2:
>    - Set GIT_DEPTH only for python-artifacts job.
> 
> ---
>   drivers/gpu/drm/ci/gitlab-ci.yml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 65adcd97e06b..193f67121328 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -230,6 +230,11 @@ stages:
>         - _build/meson-logs/strace
>   
>   
> +python-artifacts:
> +  variables:
> +    GIT_DEPTH: 10
> +
> +
>   # Git archive
>   make git archive:
>     extends:

