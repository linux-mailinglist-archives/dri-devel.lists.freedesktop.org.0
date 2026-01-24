Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Mb9kNFdNdWmRDgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 23:53:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE87F2B4
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 23:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E0410E300;
	Sat, 24 Jan 2026 22:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q/dMYALc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC50D10E300
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 22:53:07 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2b71a4fdb86so94585eec.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 14:53:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769295187; cv=none;
 d=google.com; s=arc-20240605;
 b=fwkZM+k3i3wKmh/mdJiDRr4d9ZHDQxcBE0ybbJ7W+T/XmXc+0U0QegfF/yn8FHlhqk
 q/sj0bWki3D4ME3ld90Byc6NuhEjIAmDH12YyBe/s31xpiV2EOWGxXfbu6yuoUOZwROP
 Uicug9Ckr0FOr1MoRHhyDTXaJk5eDykYp4mbuzZ90rzLGX6sKt2EV5dGw4PXoVL8zbPn
 ITxnAG24QdloNK6SIJjW83uLzS8uLUKaESZVVcvQDFesJfnxkFDIGvpdrM7/sdjLp4H1
 ftFzGK5/gJ2IPSGrQT8V/sPAL/t6lT9vCdXHZVzgdR8lHGqXIIFwU2x8iHPQ82pFA+mK
 4pPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WtZeA9Un4H6oAqMkypPzlOlC8tL1PBEaHDWHQD1Au2o=;
 fh=bxr8ga34mJkHNR9uEyUCPMjUUigkNK4IuxAhSiTYz9k=;
 b=TrJWXIJ6v0xBXVYP7udC7dZua+LzvmNBdIazw4Luu158BjPRDgfbDZdIaRJQ0cDiq9
 /bk0RdGKun8fuxZE9xklGwGAxDAykIgGJvx9v9g93mrXN2/9xpMDe/gPv9KNQ07lOHZR
 QZc6/hooCfNc+IGPq7C+OIHymhkbjBfj/YPokGVREOG4DKP/LlIo+7NrwUgCSNmmBihj
 giy6z+KdmhF1RLV9EDKKrRSp13Qht8Lq0xG5GZ6mXjtlsnt2RWw53K1ClQtFV3P45Jxq
 ZxeHgH+s0wTZeG8Sl5N5sJ8mWePe+FPaS6Y+DKwOYWRSndhMrFFOjdtCZ7YQwte5fxio
 9kpA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769295187; x=1769899987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtZeA9Un4H6oAqMkypPzlOlC8tL1PBEaHDWHQD1Au2o=;
 b=Q/dMYALcZAiFrR33TrhO1Ib+BXR8PworUf5ljc9uKO+2EQZQvmExaZZSz2wFflvNd6
 7YsDpyuww1mC+Cjok2RmF2nX2nLMdIE+KjsOPY9/lsKvXIzDucOw2jk3R5j8kEe7aMS3
 ebzsczbUwF6DWVktJY9LWuQ5bRQOBMQoJVavYB7kBslZfgRk1u9Yff3wnNGNjrkC6XBb
 ITeZ8FGGsMhoe9+geIHYEwYwLsmTyHTDWEHtYVmRgPujpNFzN0AXNC5sI/A/+2ncpqhb
 pCCD6REPlBaxvWrBtV3aZJOjmNxVNc1tpy1FDHh7JW1fR7JNw+fSG+eEwhaO4z5DRF3I
 7y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769295187; x=1769899987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WtZeA9Un4H6oAqMkypPzlOlC8tL1PBEaHDWHQD1Au2o=;
 b=ERXQEjtzxShYkOcjYQLvUTwIjxfotBQxiLJ2CVViFDs7SSzkd3LVfiZWgpaU2HLdZ7
 QB0IKFFF3t0bq5LBfnzfNfMjVfvDmq0sd9kWHKV6nRe3Y7fFOf66dGqTIap0XfzGoGiU
 ogXoOOAYP5U1f3VVKn0juTzk/ICAfTQ5S0BtGkD4WfPocqPgh5rgIvJsk0WF5qdiXbjq
 qKP/IDcj1Yii6RUR1k2moTpBvlCYZROLdrO1owRMbPhLxVY8cDKLcCpFQL0BRQqZigIA
 +vkeRcebt6fs+OuRr84Iq/Kk3M7HYoP7RehkrNR1vyhUqgqNh8rn/PPkxZuJJpsNg74U
 o+bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb2xqo68wFP1wvhjdvWuX9SkgYlrKvFO+muLEjuNTJTujSwXxEVj5nfW9lhFcvspe+b+tcQ3S89EA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQNMu1FMSD1HnmV92m655JgUQyB9DE2Iyj74lgU4jiviYL+/1r
 p9T3uLETJN8A36/zQLnQqBO5ldcvO2jRU20qLdxuxE2BUDjAfRsFB7mpC0vWdCp8aPAnR0aCN0G
 4LtP0RR0yrS8GqHUWO/bIdYxPhrX+BkY=
X-Gm-Gg: AZuq6aJlECEXweUnkglckae6luRRjhmoDjb3Pz48gXPvyEKFuY04sgfihdhoZ1AFDvc
 Po0pZWu86QEc+b/0kgfStFXn7PvfOgPjurPgNp5aEfWezzyNXDzFU0NjmhTNdpI0nMJW9o56iO5
 T1fTstHyxISndBnI/G229hISKF5hbqJKaaXnSRFGI7TciOhCJ+y9SAn6HvlpjhxqfPfay+zGQAm
 WzElpLTUeijIf1OBPvzcrAztRD8v4/ru2CZDQrL9aZJ2DRG5r40vmsSmPV+9T6Y054JqxhzNb3u
 zh++s2Uh2pF+VpKW3FsOw6PpCnk+doG8k5Uk37RyIqjLdByQBrhAYTmak8fEUl+ee/vVRcrhXpF
 ASmBwTEdf8zi7
X-Received: by 2002:a05:7301:3d1a:b0:2b6:f142:44ce with SMTP id
 5a478bee46e88-2b76433995amr12810eec.2.1769295186994; Sat, 24 Jan 2026
 14:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20260124160948.67508-1-ojeda@kernel.org>
 <CAH5fLggeH68Z+C2XFf4ONzRBu9HYcvJptz3UM1zUKd90v1g1cg@mail.gmail.com>
In-Reply-To: <CAH5fLggeH68Z+C2XFf4ONzRBu9HYcvJptz3UM1zUKd90v1g1cg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Jan 2026 23:52:54 +0100
X-Gm-Features: AZwV_QhbOY663oaEwGftoI_YIydlVPcnVC_kpewQ58UFuYVtmlpOaxNK2BSzUNM
Message-ID: <CANiq72m3eJSTFzHYe5=H1AWtLQ4SgLOE52tPBy63hsZHPAdM_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: depend on `COMMON_CLK` to fix build error
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:ojeda@kernel.org,m:daniel.almeida@collabora.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:stable@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,lists.freedesktop.org,gmail.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2FAE87F2B4
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 11:36=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Thanks Miguel. Since the drm fixes PR for this week was already sent I
> think we can just include this in drm-rust-next.
>
> Though, if you plan a fixes PR for this cycle, you're also welcome to
> include this patch with my ack.
> Acked-by: Alice Ryhl <aliceryhl@google.com>

You're welcome!

Yeah, I am sending the fixes PR in a few days, so I can pick it up if
it is easier for you. Either way, it is not very urgent.

Cheers,
Miguel
