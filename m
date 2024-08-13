Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B2950C08
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 20:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CC710E3CC;
	Tue, 13 Aug 2024 18:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="DsatIOwg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB1510E3CD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 18:15:06 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3db1270da60so4414074b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 11:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723572906; x=1724177706;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wykfbi1ltvhBW/eEtwy/5hntx+wznZ9QIfRsA8ImzMo=;
 b=DsatIOwgx2orpc/1YCL3KkJhTREGAn1vmBr4I5Fw2wOI5IMRKGqTKmFv3vY48fphGN
 z8qEmWs7QdTbz9rlQvZBGthH7iAbIh0/oiyyZVfzUo9iHgETZj5renPRuwHXE6x6Fq18
 MNCfai3QAMkfkFmAeT0THBIIGDgOPz8W+8p5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723572906; x=1724177706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wykfbi1ltvhBW/eEtwy/5hntx+wznZ9QIfRsA8ImzMo=;
 b=lSwsblGI6n1KURaw6/gQ8MOgVZpdx9+xK01MmyNhUR1hkaEgcuEHvJUzrvN7tycDum
 b94a3x49EFm1fN5vVfQ7pjn/TdXGnTvyT1lgY9YxZy+Za6HJ5auaz0gSfirgDy2pgrox
 LQymKHzKF0q4t/jFYRhzX7NxulNcWVbKj/QuJvi07u3icg0PDxJM1ixpSODVuUtuE0nd
 fRXkfm+amPYIjT9zEZzKKpckcC9KK/ygL3xmIFuIc3vDcPD78m57Fbof+R+4bBOpRmOM
 lSpPU8ToyuEEjPE31dr/hKihCmaUFuNg1WNU/Nn92l/5NG4pYHlE81yJfH6z25+xqc2B
 r8fQ==
X-Gm-Message-State: AOJu0YwCtA3GbbOUqVIjU94uFOyIAHMGkcyqQ+gTWY1rGLlbJSOL1gy1
 llsu/NiE3OqIWPKzg+jer/IooOacGPHGrZtUys9SW0S+s4LwlWCoIQW+tp0fv34vE1E3lXeQPGx
 c3mHg81QgRyvpiLLBmOVC6qD6blNsHoeh40S4
X-Google-Smtp-Source: AGHT+IGDwBi3yLJfPm5yMWIVkcZCAPVq5mU9L6D7eXbtjrN0dgW77yYvopVhiHdkopIzfMoYb/n3poHlhtf5hwQkOcg=
X-Received: by 2002:a05:6808:1521:b0:3d9:29c1:be41 with SMTP id
 5614622812f47-3dd2991fc6amr310379b6e.10.1723572905665; Tue, 13 Aug 2024
 11:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240801175548.17185-1-zack.rusin@broadcom.com>
 <CAO6MGtg7MJ8fujgkA5vEk5gU9vdxV3pzO9X2jrraqHcAnOJOZA@mail.gmail.com>
 <CABQX2QOeWoVcJJxyQOhgO5XrsLRiUMko+Q6yUMhQbCYHY44LYQ@mail.gmail.com>
 <CAO6MGtjVd4M_93QUuZrLXoSz9_6ZYswiH7ApUTo-mRybs1UJFQ@mail.gmail.com>
In-Reply-To: <CAO6MGtjVd4M_93QUuZrLXoSz9_6ZYswiH7ApUTo-mRybs1UJFQ@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 13 Aug 2024 14:14:54 -0400
Message-ID: <CABQX2QPsCbtigxNJ=CLJXYvygOV16CSgEUvQMwC0gfPOuVsaQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Prevent unmapping active read buffers
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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

On Tue, Aug 13, 2024 at 1:56=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> In that case move `map_count` above `map` which should move it to a
> separate cache line and update the doc strings as needed.

Sorry, I'm not sure I understand. What are you trying to fix?

z
