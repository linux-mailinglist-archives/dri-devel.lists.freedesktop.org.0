Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FA80533B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 12:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F1310E222;
	Tue,  5 Dec 2023 11:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C0310E222
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 11:43:23 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A9226607285;
 Tue,  5 Dec 2023 11:43:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701776602;
 bh=T5YH2R7k3v7oNwt6oxlEQ3qJ8fug5UIPB3Ee0qCYPyc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C3BtgxMoFe4jZE8nI2I63xvj8t3qn7XmQ+fMUv9x6aoKQQGHY4pYwGpA2bnd+GKtF
 7of7PgxiKl3Y3djyYR1+HPNFnL+dRNpa/Q5NJCrkGvl9SYuqLFgSk0Zwbq6ibSkISg
 I5J+MjBw5ezTGAKEypX5Gv4BxTcc8pn6pS4cLSvy1koJpVCWAdUrx7piLT0kAfLJxl
 0xDW6BUK7y9w6MTiD7d88ATIgI+JjfzOLU/4AkF4wHGfzjK7vSW+4PE9p+bhw6u7SE
 If49Q5yOi/LminYeRZRGCARxlepcIDPUf2WSQOutSSwiWIwKvHkkmJN/vodUrFjuzp
 BYJAncjgRQEvw==
Message-ID: <161189c2-db65-2542-5d19-77a56b56cfac@collabora.com>
Date: Tue, 5 Dec 2023 14:43:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v18 04/26] drm/shmem-helper: Refactor locked/unlocked
 functions
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <wboljiwogeus7pwgaqzxaltt3xdavy2dzisygn6pdpoiwlnwgc@mwaiukjguzat>
 <20231124115911.79ab24af@collabora.com>
 <kw5bho3jx73d3glvtewmjvqt4qty4khju6dcwypuh25ya3gi4b@7slmijjqdi4p>
 <20231128133712.53a6f6cb@collabora.com>
 <37208c72-7908-0a78-fc89-2fa9b8d756a5@collabora.com>
 <20231129085330.7ccb35d3@collabora.com>
 <ioqghyaeftyo7tuyfecn252ykxwgltrkhh2pwktjejqhewntbb@bym3rsjxnxfp>
 <20231129144609.7544e773@collabora.com>
 <6da6mzwfzwbn5rhiebypo5e2v6rhtpn2fovwvfnoo333zjgobf@bgtuwhum3trp>
 <20231129164705.7461a294@collabora.com>
 <jvhedgegvavn5mvvx2men2rxitvnq7u3dsxwfx3wokxldmysjz@y5av3l2w4gk6>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <jvhedgegvavn5mvvx2men2rxitvnq7u3dsxwfx3wokxldmysjz@y5av3l2w4gk6>
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/4/23 15:55, Maxime Ripard wrote:
>> Okay, that means s/_locked/_nolock/ in drm_gem_shmem_helpers.{c,h}, I
>> guess.

DRM subsys and majority of kernel uses common _locked postfix. We should
retain the old naming scheme by using _locked() in DRM. It's not
worthwhile changing the name to a much less popular variant for a no
good reason.

Maxime, are you okay with keeping the _locked name?

-- 
Best regards,
Dmitry

