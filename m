Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C37BD96D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 13:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9D910E0F8;
	Mon,  9 Oct 2023 11:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E2D10E0F8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 11:19:56 +0000 (UTC)
Received: from [IPV6:2804:1b1:a940:c6b8:18b8:5ce:1f77:c31a] (unknown
 [IPv6:2804:1b1:a940:c6b8:18b8:5ce:1f77:c31a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F1426605957;
 Mon,  9 Oct 2023 12:19:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696850395;
 bh=se4MQkYBZRlBZRnBE1H+TAMveEHemZnZwrtB2S/ffb4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ct1L0BTrXqTEc9k7qOFzpuOF9mBYePU+TjYBAHXz6sh1udRRDx4fLLNJthRKfLYrE
 3cAnPyuWtbi69xP87j7p12eFFmvCCw3vyIUxIgz8XzYd7pNKSk+WLBYHYmhA1X/xWU
 VGriPXN7CM/m+RHecRLr9VEC693/FD1pM07LO041xcGvBO+5+Q4g2d9RCKJfo4/DY/
 IaJ1Ssd4M5mfXsfl1FmpPsuA/m/visXVuQvNyJxwUMbH4syeio3leR1iaSaEjNvfIp
 g5fEoee3R2UoFU02oPzYnHtHpvXFCz7oJlJpwTxYH+gOfpCYwjNEANdSxhlVx3rrMO
 DKqTjbruW95ww==
Message-ID: <57967900-d00e-4175-8c82-4a91c60022e5@collabora.com>
Date: Mon, 9 Oct 2023 08:19:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Default to UART for logging
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231006173205.371205-1-robdclark@gmail.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231006173205.371205-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cc +guilherme

On 06/10/2023 14:32, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> ssh logging is the default for mesa, as it is generally more reliable.
> But if there are kernel issues, especially at boot, UART logging is
> infinitely more useful.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/ci/gitlab-ci.yml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 2c4df53f5dfe..7c55f02f7313 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -27,6 +27,12 @@ variables:
>   
>     LAVA_JOB_PRIORITY: 30
>   
> +  # Default to UART logging.  Mesa uses ssh by default, as that is more
> +  # reliable if you have a stable kernel.  But kernel CI is more likely
> +  # to encounter unstable kernels (and has lower volume of CI jobs so is
> +  # less likely to be troubled by occasional UART flakes)
> +  LAVA_FORCE_UART: 1
> +
>   default:
>     before_script:
>       - export SCRIPTS_DIR=$(mktemp -d)
