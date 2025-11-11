Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A3C4FB67
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 21:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D91D10E64C;
	Tue, 11 Nov 2025 20:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E1uMxzuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F9010E64C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 20:32:19 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-ba4ddb3f54aso15318a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 12:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762893139; x=1763497939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K0ITm4kaj7zgUCCm0JCFhPjRTKRmOjBpzfNcGnDqMnE=;
 b=E1uMxzuf8E8Op2jwqhHkI2GvgCKr3Fa9xsaBYJOCspThGEZGO9ULHu3CZ7F5vFN8I7
 vmJidW6mf2gtWoWMvKvL7tbelMPDRdfCmkJMpzXa7WxtqpCwLknzqWT/GXL8+IgyWUc3
 urR8DmYTT91b4lrB/wgGt0uNE+5jvrFH3oCrlECWJX2nklHPVeV+llTazKJWOTqAiB6D
 vbIL3ETpF0UsFHp7Q18b1O7v49PaQPgejI4GM498KkcPjkAKo+3Mz/Mnsq41V6a6vA92
 8AnQJXWDtBLsFe3JFgkNs+FP6zZFf7tPNpsPkvskVGNcjKReRf5Ai0L3RrqiFZy8ha6O
 dqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762893139; x=1763497939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K0ITm4kaj7zgUCCm0JCFhPjRTKRmOjBpzfNcGnDqMnE=;
 b=QeN8EHFiQcSONZXlq0jiNGgrQyLoOptc9uoNVSBQnJKhNerUSjTxqSghx6fTbH99J/
 uLStgHTiKe0JFhovoJPeq/TgQU5EcCz83sZ7ZF+9M2s36u0wLAVnjAPMOObBnlENlMX6
 zMas22xrFrj+cAYxWQoROcGLseuanyF5iWtjnI8wz+LXqEzl3GNO+33o8ieL1E/Px6Yk
 OgOnHxhAYUC2oAyFuPfycJT2/CZ2FxsctHq1shnJARkzmXHNriYaA/qYWlbPU1v3JMdx
 6zmfM1FwdTZQSZCI7amsE3afEzyjVkWF2Xr696ffUhDs1isK9k7RJfxNpp9T6K/Zby88
 kmfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLdQ+Hq6LkCsXViyEeWq8TEZfntDTOwi4hQAmqpoBSQw9TMxp4Yq0s+Oabqy+YYGeRm8Iw1JyOxms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBjC8DqQ30UNcYsVW6tyJe/l6S5vX+a73lBpe7506KdBRdcPZ9
 pkyyRdyIqeIXXfvzrwI6xwa+K+079aw4XLXKy0aNiwLDXz+VI0qPY6HBA6lm8kyI7/bsJeeTAKJ
 5RdAfBVIsi0uCc5y1lXUTpNRUBL8+I2Y=
X-Gm-Gg: ASbGncsIran3b6WimK1utHIi4d7qp0cUW5qHDZWinSUNY6ITBSsCDHaB23gHxg02Kbw
 93KJCkYWGHHNBjC8w0opEORmOgxbiw+rCGazS1vO0JRVonQqmCuO0UF4z+kJSQ+++XLNkhQ9j2J
 5DjSQxtbiPwNq1n6xfWlcMmgmuuBbtguaZ/BgaET+9zAzG/FbJhQIU4bxcIUZQwfmOZuId3bZ1F
 DijR7qY2cfP/xwgtW2kqGJ5mh3Yy21l07gWMFW6kMio7hBVoOoyQfSvWBtMvvgSLBWerASJVPjK
 hYMRWZMXd3eppHtetHLYK5N0uFsZfn4RB6Qdg0VUi+tIF+pOQVWolwFnDbLRQRAzVwFlGOFRcT6
 KVa/0L5ECPHOPPA==
X-Google-Smtp-Source: AGHT+IHkhivjJqX5b/37P8r79971KGp5/CtKc/qZSlE2EIFXEGP5n3HbQm7JyHmom9185URkqKimQum3m1tK5n6XgK8=
X-Received: by 2002:a17:902:d2cb:b0:298:f0c:6d36 with SMTP id
 d9443c01a7336-2984ed87089mr4321895ad.5.1762893138722; Tue, 11 Nov 2025
 12:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
 <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
 <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
 <CANiq72kYYu9C94aY72HK1ELSmvktF3nq+G4+smdAW_Xaxw1kqw@mail.gmail.com>
 <CAAOQCfSRVqFZAJN_m-kGLe6fnqKYyhLUf_WOKdHHMW-C6NShkA@mail.gmail.com>
In-Reply-To: <CAAOQCfSRVqFZAJN_m-kGLe6fnqKYyhLUf_WOKdHHMW-C6NShkA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 21:32:05 +0100
X-Gm-Features: AWmQ_bkuC058fj8a17da0j-IGoO37yszAwGTtwPbytKgwIYY0ZLqmecqu3judng
Message-ID: <CANiq72nU7LOSEv=RsewAwiEbeO4=pTqg_pm+WJGfum90BC43kQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Guillaume Gomez <guillaume1.gomez@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Wed, Nov 5, 2025 at 11:54=E2=80=AFAM Guillaume Gomez
<guillaume1.gomez@gmail.com> wrote:
>
> You can add your own tags in the doctests, and with our patch waiting
> to use the new rustdoc doctests extraction, it should be pretty easy
> to plug such a feature into it. We can check it together if you want
> when the patch is merged to see if we already have everything needed
> or if I need to add more things on rustdoc side.

If you mean the `unknown` field (in the JSON) that I mentioned in my
message, then yeah, I think that is good enough (though we should
probably still prevent collisions with future `rustdoc` ones).

If you mean something else that I may be missing, please let me know, of co=
urse!

And yeah, we can take a look together (likely after LPC).

Thanks!

Cheers,
Miguel
