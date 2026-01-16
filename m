Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A6ED2D37A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE9B10E811;
	Fri, 16 Jan 2026 07:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G8A/Jbza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE8910E811
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:30:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so7371915e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:30:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768548616; cv=none;
 d=google.com; s=arc-20240605;
 b=B9W+RWBrhTc1+VCH1uCAlH3M8XlsPjCdK6DMZ8gZk1G89vZNbIL80lDwSb+4Xkc4jq
 Emmn8n65iBCV7lxdJiqdI5kk9juCgvb8SLOJSOjCKPhpMURIrCm/zroEFknZR7knXqEr
 Pihm4B8WSuGhPM+Plt6BrMupVqZnVAUKPsnamcVoaGoalBILVYY65hATi4e+PFPrG6d4
 JrJsmZ4YKDPJdoZoR0Z9EkZQXraAopkisdH2J0I4qN8rQS2fRXIgASpTKgVrvcU3Iqy5
 VQOoOTqqR4jhX7+rU9hMgx9+0uUCjI02gktPpk9KWi2nFJq2W0sxxrZQpoPKIiymQuPN
 4Z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=d3UkvK/UrzMfNZY0ft7sX23k0dZ6g9gY8ZU4S2UCJcw=;
 fh=NMdtmZo4OfZDsWuIsWCsGYj5n+nvjcQwOGP1a6qEx5E=;
 b=hCd39c1XXEVhT69CINXuKzdUIdaYHU1X+5IR9ri7qwywlyl+NAKZy2QtUMw5tt9r1d
 OeNZjuUfeKnWzs7Z11IE0rPSfJtOV3oyqMXjPAgpu7MM9BpLuq3xyZ3LviHSBDNI+cNt
 cfvbletW2pF/IMxuOzb2qVb6DhTIel7kHH9sazpTFg7SjynpANDKX+BD4eVhXq5+wR+P
 VczSnRv22bfqA60PXXtus3NsR7yQ8CUqz3ZgucsE3tuAOmWV6IipU47jRRSsHXiYS2gk
 IMw4wJyNTkYQgWkRJqhXNSNQYvfetaSbM9punolArOjEif+wUn1RGyCzUsrLRWYdNUBy
 H+BQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768548616; x=1769153416;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3UkvK/UrzMfNZY0ft7sX23k0dZ6g9gY8ZU4S2UCJcw=;
 b=G8A/JbzaNX6Yze5CatsJH3uC8zxSlzEJx9rGf8XhxyeqYeziHog9DZl6D//7iorxt/
 YvkZdbkxVyjJ6Omd5Z88oGd5vWukiAlSjPNAuIxP08zLSDcZhRRqauY/R+wauUzlMapq
 +FlCE0GI1lploJKhw+Js4mZE+R4jZBDQPaexTn+SXw74Zigv6BN3FY2aw/4lHGtYlwy9
 ke3jmLT4FJzPy2Ocnaf/H9wDGXolvff88n9UnC3Lc3v72YHimdBdp7QEnZX8iaNgwLfz
 mjnBuZKpYZgwo+RIWXYt4uTfZ+iJVQNdeV3mzBjfROtfJ4TPB7g4hqB3YdUgu1Ouyr5r
 Hixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548616; x=1769153416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d3UkvK/UrzMfNZY0ft7sX23k0dZ6g9gY8ZU4S2UCJcw=;
 b=F1IKkIe6ZnGNw8oSU4aZXRk3J3Lv5AwsHBiY+hWie2yLCdTisCWUq2fWgczQVc2Y07
 JaOpPJQ4CDfnTwNuZFQpj9tnUSLc1Cxtgg7bEUXMmMtpLgretYLpBC4FuDOOjd1hdvRB
 FCKGzHSj2+wTIIsP+E2zHSqIyy/ft+fpnkgmyXfELhi2x37tOp1HDexctb+MZ9M7Iah7
 GhxzkgaQY84qQ00cSSgSI/bVCBOdyADx9V6iM52cUezTEdtWxzHoKrCNceGtU6mbP9gb
 zex8ggVN0cUroCvy7hgE5BpzRsE0JoW/m/gqegB4RUX5krLk5sCFm8ACRKg9MPGCXN+o
 J1jQ==
X-Gm-Message-State: AOJu0YxJSy/6LNnG+uDmi0EK2pmgGPtc8t/ruUsh3jPoruxTDVH8jYyc
 6F7OHMlngA8gq6BZARQQnlBs6aqUnsQipP8qhSCgAc6pTkz1n0tmD2Psl4Dzp4TmgQzhdQ8tCpm
 lsb35veiUHOBGPS9jSuV8h6JtME0vv3qrEPkoAapr
X-Gm-Gg: AY/fxX7qncChBBsi95tFTpxJdVT6NQhoWKN9nQIE4lJ7PIlBz9NUdBAPlo85lVZZrYl
 kY+5y8ZZxpFkpZL+rN2MaJz6VWaNI2f/rX3nz8h/eLGcBB0dyxpSlc/LZnAq7ZXMdBvtNWRsC7K
 2VIa5/FANhFxA+8lZ0Fm8X3uOBn0rjIT2OCw/mqe5tQ07FiKEi2dlFZoAnLhm/ayO/eOx7tzqt/
 aEL6i9Phda2YVF0llwn5Blb0U9tzNaJCdRNBt3qcFhEBSjf+PqvePo/2ZoyX0t3uXBr2ZKRjE5p
 FBxNkg4fMmSpM/bEcUu/gSxoGQ==
X-Received: by 2002:a05:600c:8285:b0:477:8a2a:1244 with SMTP id
 5b1f17b1804b1-4801eac3169mr14925195e9.11.1768548616379; Thu, 15 Jan 2026
 23:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20260115212355.201628-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260115212355.201628-1-deborah.brouwer@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 16 Jan 2026 08:30:03 +0100
X-Gm-Features: AZwV_Qiqq34HbecPsnhk5yodxBLniUuuBEzQYg-DpfBJqj72hySwzPxuWpztHpg
Message-ID: <CAH5fLggE4fxs3iT7ZbtZPJEFUKsBAuzWqeDsvx-PUVyPiE9BfQ@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: tyr: use read_poll_timeout
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com
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

On Thu, Jan 15, 2026 at 10:24=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> The L2 power-on sequence and soft reset in Tyr previously relied on fixed
> sleeps followed by a single register check, since polling helpers were no=
t
> available in Rust at the time.
>
> Now that read_poll_timeout() is available, poll the relevant registers
> until the hardware reports readiness or a timeout is reached.
>
> This avoids unnecessary delays on start-up.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
