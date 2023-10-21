Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116EF7D1C8B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Oct 2023 12:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A59710E116;
	Sat, 21 Oct 2023 10:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D409410E116
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Oct 2023 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1697883958; x=1698488758; i=deller@gmx.de;
 bh=dhDbWXH7BPN56bfie9iMzrJjndwh/b13GtRjH27O56o=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=UMvcnhpb3nkvQlWjHexCsNfi/6Ak4Wk0rH6QpF9Fujj0kN8t0cDlJulI+KMOaQoX
 23zqN/JTV3vGmLAcjNJ9fghJ2j5KY5A2jsp1bap/2nVA7yKI6pIqGjkuFFuKvpOq7
 UbwDJfQxoCuaoiYUv1gonaF4+kxCH7wjC8IBzAGNb8kzWyAVZ8hq10LMcmuRIypwv
 ddtH94HC1qUWOcMTmoR4wxwG77iskLDVBi0AXNvU8NQ4hzCms0Ez5r2k9XcOAGHLZ
 freHF27L2LqvAN9KFtQYLARvbgLjNiMgQKebYdSYBnUVIkVzJ6pcTBqcHPRulqsI9
 /VTcT8dUxNI4EWU4xg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.149]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhlf-1qlaF21o1f-00Apoa; Sat, 21
 Oct 2023 12:20:43 +0200
Message-ID: <46792c4f-5c72-4675-992d-e62ef5d1cc1f@gmx.de>
Date: Sat, 21 Oct 2023 12:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/offb: Simplify offb_init_fb()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <1c94c99117617c1a844f6551b7bca27f23c5f0c8.1697871190.git.christophe.jaillet@wanadoo.fr>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <1c94c99117617c1a844f6551b7bca27f23c5f0c8.1697871190.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z0RvpZoLIi5f72gOTfbcWj7KFnUCjNmRp1IzPMFdI5aQFRxKDDS
 Q8RL44q/pTzRNHx66vzmtyADeX/P0Onzi+2YOWFNzvpymgV1L1aZX5neDbGfDUL/ErP4QTh
 /eLDKJq//xCDULSBQoqpgYa481tJPmfVVrdbPeJDD32zluTZoq021xH9dJVe4OT2/LLzT2j
 S7dbZxiRaceWXYxiNysEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uRccpltW1zk=;3Dnd/nIhYtlZkLTNqpAwQWMGEWg
 2jxwHYLBJ/JOwdUPxJRLDjPLU0kXS2tFhmqiR6MjZlls9DyvXDQV791jzRc+Mq/TAl50IjPln
 tMjThLrM2MhXucFvSkiDaL+3Un+mcIL9++1Wc6HhyK9PNgFPL+CfrvO5DTkmu4VGJbzrGXS5Y
 bB8hE2D7On5eaBExQA+yyw1L6XsEsX9L/Ua5t0PQgOLN3XggdNxZtfsjoROozn5E9Vp4T/1jA
 +zZSd04te0wAtb0iqE5rxz4gqUPraN8YZNKzA/i37XCdQ0Ts3/vytEVwMm0vE9Gw+Kv7P+PbH
 5lPUaqRtXePWjeGceLSArVhwVCTYY5OrSLxL2fNR1h9/iQixQeStKiWoHD0AAHln0pELPFOy9
 7AbaQ4DKfEUev8/Tol5VspxAjoUWZ1FLL4LvQZBO9ynbI/X3cNSK0pCkYgmT7UEzExnSD0BLY
 KsqoBKMkklM7T8beJMIbIiFH2gsa6Y25RKTmm6mhQb2pCCqcqRHCjsGRtyOkHRr4DBKJTIXxC
 VVorntWEgn5nff5QMkB5SwkortDESw5VyMjo8G7q72SYtm5ubPeqQ3S0GvkYJai8A9yt6smZC
 aevJTLhoqVYZ81vnV4E8KpM+OKz5VbbA0tUbIxdm1ZrZgJI/H4tJ7S46GjNbNWHVnHtOQ+MuG
 goO7Xvs2UdJ89ZoNJHtW/qR7yUSyX7FrhAcrJJHs6xpeN3O971t8SPJgAYeIKyyM7dYJ/Wyne
 9MLeS0Epx0cCNB26LqiAq3i6rY3SbSt7KaEkeDkRq9rRHZztYB3LbkxrfLPH9+61Aa0vP5DUV
 3RGay8gjHZaEKLXPJpRW6Vpvjba4c47dqQqypzuaMsljeF6Ygqqlbm4eFlUYS9iYlI3vkol59
 +7wv7tPvlN3bP4+FHLfTN6fUHOxIwPEhCe7WTAh7hTHZlkbyq83EomgO5apcIcGWtXBVrRFFU
 tFzFmOxhYhu18+WndfnRATTMbwg=
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/21/23 08:53, Christophe JAILLET wrote:
> Turn a strcpy()+strncat()+'\0' into an equivalent snprintf().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

applied.
Thanks!
Helge

