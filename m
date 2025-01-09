Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A932A07C01
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 16:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D83110E46D;
	Thu,  9 Jan 2025 15:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rvCiPwZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47D310E46D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 15:30:39 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YTTJD3YzQz9tFg;
 Thu,  9 Jan 2025 16:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1736436636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDzXydWanX/h4CyCvG6rd+PRQi4Bip6YqYfXH8bhOhI=;
 b=rvCiPwZ70aHdIuoNIKBq1BYv1ujvq8ua5SX+UIquwVUWqXzKvQy1kFZlKKz7HEVAPYmg2C
 MnK2c0j4nmuvS02APaGzpRMYJ18qo+47hSf/VLTvnA6SbGMPvLJsBCd+U5A3cBhtK5HyKj
 H+KB+yY4nm0iqG9TZ7Ib0dT5FnTZwUqyXgk9q76WwTqVCZV0N3UjcLoCLf+g8iTyuFdVuY
 +5+SQppPvDfDItEmDZPhqDRraS/J+anglqHaYsxIXbx3C3BsPVMptvKLbvq9egOsfUsvSD
 BwdBdXAD1I7SwbAhoetpzgvnzco/7WK+yDq4hR9EBSpBfALycE7IiPt+NOPunw==
Message-ID: <f82df11f-97c4-4b6c-a139-90e20e0f2eb0@mailbox.org>
Date: Thu, 9 Jan 2025 16:30:33 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Manasi Navare <navaremanasi@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
 <20231011092051.640422-1-daniel.vetter@ffwll.ch>
 <edea5e48-2723-49ea-ad03-8cd3d9aa53b3@suse.de>
 <Z360aeAkou2OXMCg@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <Z360aeAkou2OXMCg@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b0b3d1d054f3114bc39
X-MBO-RS-META: iexinsziqwy4mhagkdjw9tbq36et1xn4
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

On 2025-01-08 18:22, Simona Vetter wrote:
> On Wed, Oct 11, 2023 at 12:53:14PM +0200, Thomas Zimmermann wrote:
> 
>> Comments on the text from a non-native speaker:
>>
>>> +	 *
>>> +	 * - Drivers must not consult @allow_modeset in the atomic commit path,
>>
>> 'atomic-commit' because it's the code path for atomic commits.
> 
> Maybe I'm wrong, but my understanding is that English generally doesn't do
> compound words connected with dashes, you just line them up with spaces.

I hope you don't mind me jumping in, three native German speakers discussing English grammar is merrier than just two. :)

FWIW, LWN writes compound words with spaces when used as nouns ("code in user space"), with dashes when used as adjectives ("user-space code"). I don't know if this is an official / general rule, I'm using it as a guideline though.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
