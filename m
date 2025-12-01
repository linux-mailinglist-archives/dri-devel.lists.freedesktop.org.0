Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19244C9810A
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA1210E137;
	Mon,  1 Dec 2025 15:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MnfUmDiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF4F10E137
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:35:28 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-bc144564e07so122384a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764603328; x=1765208128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUNxN5qrxyE5m7ZulRO3ENGx2G6kLUP7duXkt1dCvso=;
 b=MnfUmDiWOpN/xsC6bcz9Q6yJ2AH8PxL8gMKFkW6Up0FRKkAod56Uf12LwiCkmei9kv
 INEiCjvQOJSTggfs5Aj0W0xzHXin6LbGxt6dTlF7bCm21mBV8xkqqqHeNDRH2xs/ymDP
 89g1Oet982WvqBNblx0EkJ6Wn2vBSxNdf3H5D1AdnIg3A+Qcmw+Rwr7aciUBkWlfYvsI
 6OzNhhvlFWvPCvocJBNFlDCwbzDckaLpsCWBkz4Vocl52rgrH6/QqltjvPNdYNjEjSBk
 OnY3ZskHcFvLzyeSvoX41phxrDOxu40a8s/WM+RPhzypKAP9hHLL/6MNaxzGDBT0VE/1
 IcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764603328; x=1765208128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IUNxN5qrxyE5m7ZulRO3ENGx2G6kLUP7duXkt1dCvso=;
 b=TXL+v7T66tY6OsfrNBwK0WxwqjwxKjy7Vrfxbznffk/fx0eKgGxCNvxs0ujLH3gzTQ
 KWwF8Y980X44kHAAacO7iY3X1HmeurbqQra4DJM8bHqEVEi08q2XV67WQodPJ8OznRwY
 8+sIeEQY2Asa0e5Lptsf+zth1Xz6kibiXuCoioZaydVzl9Mgq1Rj2SPkvrqgXoGY2rXU
 gLSQ67odMgGPilCLVePf/M9GjMcoEAiIMYpOAal2DMvo4DnkfXzEid3pBxOhPll1wfWv
 rS0cum+blWk3x403LPxLM5E7rpG+oWXVExPvwXdBeFeWOGi17UHhN2C5bwkvYnQYqraS
 qa/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRc/KZw1Rm49mi+epY0aMqC1nXxcpIzi2GuLTj4IJIb0mrodhH5y3YVWERqvSAJ9CnZGz8DHB1Osk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1/SLTYfjTVwO0oFMXGcDLonVH/1Tg+xQ4VfxHqUdRKxCJ+sFQ
 ZrlVGOyDAEh74/08pil0y1/Zayed+LOUVVGFwTmK45y0kYH8L8O0zvcezxg3pFksLtr8eJSONQq
 mxmOf9YvmKI83mXbeIQCa/oj1b8M0xag=
X-Gm-Gg: ASbGncsH/bpp8EjDyAhKf2In/Ws0rk0dVxOx68ERV7ZxbkWjt3n7zfReht64bPpAYat
 eNgh8qI4TF2y07NPt4q5ZcIbFqB51wrXBL/GsowUcxUuKcMCO0MzgK82q+jhoUg9+e3MlWN6PJr
 Od68JpJYEnc8vRMAVIRpmLKe7HLsiujtQOC/DYdgImH2FYv5U6l6xDVH4V2uLDO6BQRnGQnMgwA
 8hEI+ThsAW9EtyMA/mBBU1n0ePke9M4cIl1lYiCQG4g5xRooDlvHSd7vTKf0OHXpuFYvPr/rpGl
 3JShqDjswJNGkKiZiyR0Oeqm4y5YinDws4drt73ZU7qz7HrJBMAPfx3CAZK0o6Ag2Tt2qZxPKGE
 ZNSpxLZdiLChocA==
X-Google-Smtp-Source: AGHT+IEoCLpm9lr0RH3SWQPZtNE57eOwkauItyiHao4q1iLnYOGMmNevS+W3sSEcxd7G4uHpfc3hJZOjQWWFcvoi3cQ=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr21735269eec.0.1764603328166; Mon, 01 Dec 2025
 07:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20251201152759.16429-1-atharvd440@gmail.com>
 <6DE296DC-45BA-4915-8FB7-78A6A7339A66@collabora.com>
In-Reply-To: <6DE296DC-45BA-4915-8FB7-78A6A7339A66@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 16:35:15 +0100
X-Gm-Features: AWmQ_blJCkBhicE8Cax4nvSPCCoAJ0n5ZIvU9eCcCm1jzeuOpDDhMtG4FEcpZh4
Message-ID: <CANiq72=CS6o9=2KUVgoOKoyEAOpMz+wepLCJe5Mftxuz-RV1Tg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: drm: use `pin_init::zeroed()` for file
 operations initialization
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Atharv Dubey <atharvd440@gmail.com>, Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Shankari Anand <shankari.ak0208@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

On Mon, Dec 1, 2025 at 4:31=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> I wonder if this should be part of a larger series that implements this c=
hange
> throughout the tree?

They are independent, so it is easier to land them as such (and may be
clearer that is the case by sending them separately), but having them
in a series (even if landed separately) is also OK.

Cheers,
Miguel
