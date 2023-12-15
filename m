Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FC8813EC6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 01:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAAD10E2F1;
	Fri, 15 Dec 2023 00:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2E010E2F1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 00:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702600930;
 bh=8uQA7X0TDsHumtavr3z9rkEcB9+/ly7xWDGiAAZ0ejg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tOpmRTOaVYB9FvaSZ5kmt1LchI1SnTSIUE1Tb/L5eDv0lITAVO018lWqGrbPgTfmk
 t9JRw/sT1Dnop+PueP2TfFAy9TiJlH0g2UQcc1+75KheSXGpVTugCc/w9H8s1NuSQj
 Mm+gatj4DTyxRvRCQlln51kiayj6ROOtd3nq7jX6T34p1+N1nArJosdZTCcZVtW7lc
 X55Y5cqpC739/9eprZksDxaOqfX18P71wjtAydMb1qIuDA9bN8Jh/do8yKi9N0UNmr
 ibp47oobtLqfT5CbLgo5zz9JVOXm+i2i+oNjp5nj66l8aIcAfZ3/4f8781scF/9sSw
 bG07Lu977k5pA==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 444683781485;
 Fri, 15 Dec 2023 00:42:09 +0000 (UTC)
Message-ID: <df31f3f3-15bd-f71b-6ca3-a10e1e43e776@collabora.com>
Date: Fri, 15 Dec 2023 03:42:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v18 04/26] drm/shmem-helper: Refactor locked/unlocked
 functions
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <kw5bho3jx73d3glvtewmjvqt4qty4khju6dcwypuh25ya3gi4b@7slmijjqdi4p>
 <20231128133712.53a6f6cb@collabora.com>
 <37208c72-7908-0a78-fc89-2fa9b8d756a5@collabora.com>
 <20231129085330.7ccb35d3@collabora.com>
 <ioqghyaeftyo7tuyfecn252ykxwgltrkhh2pwktjejqhewntbb@bym3rsjxnxfp>
 <20231129144609.7544e773@collabora.com>
 <6da6mzwfzwbn5rhiebypo5e2v6rhtpn2fovwvfnoo333zjgobf@bgtuwhum3trp>
 <20231129164705.7461a294@collabora.com>
 <jvhedgegvavn5mvvx2men2rxitvnq7u3dsxwfx3wokxldmysjz@y5av3l2w4gk6>
 <161189c2-db65-2542-5d19-77a56b56cfac@collabora.com>
 <xvo6rwsripjoiwazvjhkxvyleiexuhvclh7wvt5kuiw5cmkaa7@jgcdrtkzw7a6>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <xvo6rwsripjoiwazvjhkxvyleiexuhvclh7wvt5kuiw5cmkaa7@jgcdrtkzw7a6>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/14/23 21:16, Maxime Ripard wrote:
> On Tue, Dec 05, 2023 at 02:43:16PM +0300, Dmitry Osipenko wrote:
>> On 12/4/23 15:55, Maxime Ripard wrote:
>>>> Okay, that means s/_locked/_nolock/ in drm_gem_shmem_helpers.{c,h}, I
>>>> guess.
>>
>> DRM subsys and majority of kernel uses common _locked postfix. We should
>> retain the old naming scheme by using _locked() in DRM. It's not
>> worthwhile changing the name to a much less popular variant for a no
>> good reason.
>>
>> Maxime, are you okay with keeping the _locked name?
> 
> Yeah... I still don't really like it, but you're right that it's best to
> remain consistent over my opinion :)
Thanks for the review!

Best regards,
Dmitry

