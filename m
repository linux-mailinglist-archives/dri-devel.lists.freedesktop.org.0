Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014DEC97F5C
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E51D89A94;
	Mon,  1 Dec 2025 15:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l/mtdbD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DCF89D7C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 14:27:18 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-29853ec5b8cso52279635ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764599238; x=1765204038; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CyfuXJ3dS1xwuzdmGQEJgMw3DQ60E0n4xhvXA4DDY0I=;
 b=l/mtdbD5yshIJlKF+y285hTtT6lf6/kTX0eGlwLEhl6mqkkjem2zVx9Wpmhn5Qq6W+
 akBjqieRfzmmk8xhEEJvYPgzR7QRm8iuDnBxy3k7WOl91jQ9bmOlJ51jwTluy73/302G
 PI5W7Z7+ojp31B9Z8xNtOukUpj/CiO6wePvja5bjY72hdhHFf1Z7prRYRi1GG+ZlcDpv
 sT8mQP9IkQv9INv7T8laYg62C0qNCLrnj8q/TuWyNN+tiSIJikl/Pv6+wDDXYmwmG4XR
 +5X3N/cIWyrPRoYehZs8LfH+nqt96w7wK+8tIlI5rYfGnFNyKTzaGM1xXKMjiuUnuO9C
 y2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764599238; x=1765204038;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CyfuXJ3dS1xwuzdmGQEJgMw3DQ60E0n4xhvXA4DDY0I=;
 b=O2aqRidv+/yoCxdpU7YX0+/cPnUtvFSFuaiWNPsmwGoTDo3cGgesa5TbFluFxmvC9/
 ulVmJyVXoJGdyyVc/+jlEUG21L1W05AA+ICZaR7kOHMiJE1siL4d2HeIxZlQez/n5hNS
 89RQ5Z1/+RYwadbwPiVjRDt2C/8cbmvS7/BHqUD8iH/z0RnhD0LDP2/cunDoNSnWxH/G
 B83SBOpaCLUxAfD8rxoKMD/meLuD2dVxu7CXhkxZRvrGu/DlvzM5cEwlBWRoiLLiOLCb
 Z5+PQPXX4BDQwjwQOnL1sBvekuhZgzDV42hGAbudwkb3GBAZckZLQHv61yZTBr0oCMCX
 cC4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQByk4SJ4LnprZbBvLiQ9UKq2Y5pSZGHG6IAo/oLClDP6VFmhcE5op6WXCJgKGgqe3Jv/vTzooB5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+IRpSUpBQXecs2oGGdT/ygGem/7dbopGDPV7DpPhNcZlqvN3I
 7forR4ik2NtJyayc3m+lcDS6e4UoRdbhJk2e/Z6zVaJ26yA+eqOgzUoS
X-Gm-Gg: ASbGnctrpwJExG8jmM2VMmWcX/dqtvaK5gsn7MOkgrcTILewxHG4OBaYvUG/+7peT/q
 eF81iu5Mje2LD3oKxxapBRe4YR/n/du3MDUJHvIBIgnL3zKA+sVyxt//F8+sM5CLmOMATKsEr0b
 0/Vd5sDDiDphw5MRq+X3+EoEYDcuXayd24Tqlt5sSU1/zQjRFH0chjKMjc50hk0eiMnY8eFGAHW
 40bn1ozHtcOdmD5BZ6bsLpnPA0ENimLBDB73RxXXv/TeieQSLQX9ymScUDUYCYkr4H2SCoizuwP
 icFMJDg3i+4dPqsq+ScitYpnUq0PTgLI6JPTsoqhQUb7jZc+tUvmv74vXKF3MH1qhuRAwh2oI0L
 f2a+wVKgJa8wSOw3xJQhwtM7lXmt1KxQab/FmzFL52Blf66wuaV1imanqnPHz54MXXJ7C4bYdcN
 KMPc/sHsS4kwBD1F92ZnzC85IHLC/XuXaf1ilQCP8nu4vpU7EU0cL4KTkzjAq6+g==
X-Google-Smtp-Source: AGHT+IGgqPIBYFZh21Im7PrQQJOK9fLH8qMDVq6VS434Z4nqdYM39hwMJTbUqbIONb8SI9qarmWo1g==
X-Received: by 2002:a17:903:2ec8:b0:24e:3cf2:2453 with SMTP id
 d9443c01a7336-29b6c6f1d7dmr406419575ad.61.1764599238125; 
 Mon, 01 Dec 2025 06:27:18 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx
 ([103.216.213.160]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce416f00sm124994465ad.4.2025.12.01.06.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 06:27:17 -0800 (PST)
Date: Mon, 1 Dec 2025 19:57:08 +0530
From: Atharv Dubey <atharvd440@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, dakr@kernel.org,
 aliceryhl@google.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 daniel.almeida@collabora.com, lyude@redhat.com,
 shankari.ak0208@gmail.com, lina+kernel@asahilina.net,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: drm: use `pin_init::zeroed()` for file operations
 initialization
Message-ID: <aS2lvGotkV3lFLE6@atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx>
References: <20251129134834.34559-1-atharvd440@gmail.com>
 <CANiq72mSStPR2Htq3aRS9FLbiHALJP21tTSgiwDfQJBR1zHr4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mSStPR2Htq3aRS9FLbiHALJP21tTSgiwDfQJBR1zHr4g@mail.gmail.com>
X-Mailman-Approved-At: Mon, 01 Dec 2025 15:07:33 +0000
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

On Sat, Nov 29, 2025 at 03:30:53PM +0100, Miguel Ojeda wrote:
> On Sat, Nov 29, 2025 at 2:48 PM Atharv Dubey <atharvd440@gmail.com> wrote:
> >
> > +
> 
> Spurious newline?
> > Sorry for this, I will send a V2 of the patch.
> Cheers,
> Miguel
