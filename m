Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJEkGaz7kGnaeAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 23:48:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA22B13DBCD
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 23:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33D310E106;
	Sat, 14 Feb 2026 22:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jx5DfGsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8936310E106
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 22:48:06 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-65be78011c8so151038a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 14:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1771109284; x=1771714084;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mYkdhtRoL4GjkDCyjPYy3UUZTydOkdf7syWKV5f5AgY=;
 b=Jx5DfGsbLuVg7gN8Bl3TPHIcpuaqMSxskmU3+1XysJ6ID7nILvHadAYixvKf5AkFDn
 mafx4Qoinj5CQno+T17GlzT0b98LX9AuYNbw0RSycGov4OUT3g3EFXbzMUoE8R8c+OA4
 aNEkmoobz2FTHctAIiq2YDfoSNRQXYehEwsAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771109284; x=1771714084;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYkdhtRoL4GjkDCyjPYy3UUZTydOkdf7syWKV5f5AgY=;
 b=wPLR0mhjUexw1f+2wlKyzpfnhW+rN1+hDuXATNNMTNMt+omd7MjtRagsBOudzQNMG4
 +a5t0MnC3aV5w+mmcJi8NoMXemKrFHoY7ZEMkrt5/R9nDB6OYedG3qCdMtky4Nnqw2Ml
 AxNNWM6mQ7mV7MqEjKYeG4UTuYZ4W+LUWj9p+LFfB1qh4uIczfmhLPuhCVVD7KB7Vdwe
 JyP0JPsaNVZ5A4Mr4E0/RfMy7vjn5/CTC7IkrBYsXeDsOCqTh7xOjR0N4zlpZkf+nIwo
 n8G3rynFeXsYBFOpk0FysU+bp1Aea9Hn6RN14HxuE6fFOUsn7KnIzqYy3p/NXWMf0zQq
 SEBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJIYYoh2f42XXECIMXWMZ6aLjgx6WhE/izrQhrCymJBEPPke8wFhp/OXpUiVvZqGoAVChU76Shw7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdW4B4yOFFQmnTrbq+R9TPyzlK7pmBwxRusWj8JOhnwx8qjJCr
 RTkJpVFGOQ6fOfa5lpHw9ykW9+3sDxS9auYO3/LWAA+p3xXQRGJe7HPI7anLw1v3HTVRogB+YVV
 c4cz8NLY=
X-Gm-Gg: AZuq6aKWwLy/jjYdQwlhaBEBa3zfPJXBGaTlgNHK0SkLUeVz+KB9PuMIgwv19XMGQfZ
 CggNJ17ABJ+4AX0Rt/LpcMnhMvjkjsOiPth7z+as4pOypU7ZVPtDJpkODgjnrHRiI3HwhyW/8P6
 r9x91AeQMTI+lb/0svES/kwhpjbGuE01IB89vnFqEOAYyJ3c7san8t6/4Tldl/JIjpIHKf3YT0l
 PpQYd7MQMVD5mqnhXG2peo4SiurQZ5Hl5ITcTC2+JiWdQEGQcMefGv8sP5JNGjA+OyansLqx0Zo
 +/97Pw2FMwWHKlmnZpkoNCFLfpLFzJtmRhcR1TR4rMsIlc+7ywNKn7OBit6D4WDy1BGN+rF+cTu
 nmGWT31/n81JSF6Y0no77b1M/j4n6+KgZEurT02eu3PYa0uFQMHGzbY2zTEbGTFnqbRUnRVrEsf
 37JnMIKBKMRy73b7i+9JwfyMhI6Puq1K4QCs0fP+3uX76VOJABoQPQpNbt1W5L16UJAAiz+BAFi
 10cG833b5Y=
X-Received: by 2002:a17:907:f509:b0:b8f:9d12:2386 with SMTP id
 a640c23a62f3a-b8face62ee1mr347269966b.51.1771109284376; 
 Sat, 14 Feb 2026 14:48:04 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735e872sm109312666b.10.2026.02.14.14.48.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Feb 2026 14:48:03 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b8fd976e90cso57232566b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 14:48:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVwOCYqjuKTnJDaCXQN3RwLV1Xk8upUgD/KmI8kFQBLbyG4sdCSSeryZeWGM3wxucWnbJf7dCxTxek=@lists.freedesktop.org
X-Received: by 2002:a17:906:7303:b0:b8f:6f75:f9e with SMTP id
 a640c23a62f3a-b8facca23a8mr343042466b.1.1771109283474; Sat, 14 Feb 2026
 14:48:03 -0800 (PST)
MIME-Version: 1.0
References: <aZBlTsIwTzS0tqBD@carbonx1>
 <177110244909.2897141.11184148040863874004.pr-tracker-bot@kernel.org>
 <aZDpCUcIXLmuydoF@carbonx1>
In-Reply-To: <aZDpCUcIXLmuydoF@carbonx1>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Feb 2026 14:47:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com>
X-Gm-Features: AaiRm50HHjVAcxBlyn1res84hJ74BQRuPE9I7BE6WlfzWIM12HlM8cBqswuaZQA
Message-ID: <CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev fixes and updates for v7.0-rc1
To: Helge Deller <deller@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS(0.00)[m:deller@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-foundation.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CA22B13DBCD
X-Rspamd-Action: no action

[ Adding Kconfig maintainers and linux-kbuild list ]

On Sat, 14 Feb 2026 at 13:30, Helge Deller <deller@kernel.org> wrote:
>
> Linus, I'm really sorry, but I messed up drivers/gpu/drm/Kconfig while
> trying to fix a merge conflict.
> My patch series should not have touched drivers/gpu/drm/Kconfig at all.
> That's purely my fault and not the fault of the patch author.

Humm. Funky how the Kconfig parts never complained about the
duplication of all those source lines, so the problem was basically
entirely hidden and things still "worked" even though that Kconfig
file had been so messed up.

I'm not sure if the Kconfig tools could perhaps warn about this kind
of duplication - we might have some of it intentionally - but it does
make me go "Hmm".

Nathan, Nicolas, comments? See that commit ca4ee40bf13d for the
partial revert, and notice how Kconfig is entirely happy both before
and after that..

                Linus
