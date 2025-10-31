Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF1DC25DC4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB7C10E2D8;
	Fri, 31 Oct 2025 15:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="oielL8HY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2EE10E2D8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:35:51 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-88044caaa3eso480666d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761924950; x=1762529750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6ACvehQQuyEQdMS3T6Vr1FtAWe8uc2yBWuRjxIoUTA=;
 b=oielL8HYxrh/2aTqrW+ZQC+c6Vcy01ljropSIcq0nve8yvUPjbkiz+UYxcxUqVrzHe
 d55RZ1lwYIkvWzRmBjozwSvUqp3+chhOETyhpSxuTUb6Okb+3J7fAJt20YxfGpIiz//T
 VSGjl/t36qI6ylrAjj6T0irqYgRryTiZmd1qJuXlQPzJdwWbfQdf3/B61iAZ6B5GbP0E
 HopWNC29+GcLPBYx9G2GVPPogeZQzJYBKgOCkddYJ/Ir8aDRxfYlGn/MZNmufP+ejQ4n
 F0gmOx6XRLm3+vXQ67Ei043L2p8aom+8rXuUfSUGGOlPgRPb8zN+rRjvgDxOJj88hCYP
 iOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761924950; x=1762529750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6ACvehQQuyEQdMS3T6Vr1FtAWe8uc2yBWuRjxIoUTA=;
 b=cOJwbG+g9/le3m0c+sYpGyJcTw7LeJos001BeNswI0jVpxfkBM+JDNWHmG+6S8FbM5
 2MEySW2/ejR7qGhq7wgzUZGE4pPKZNesZh0UCFeJb8Sgm0+7+04S5pEJ8tRH3kSPPt+I
 KCDesKN5sWYkUEUTOjiPWNNrWanteuurT32fGLZlqTWI37oZ4w2EUe31P75x1uIi1g3t
 NLKx5bx0xu/5wnh5TlT1iy/VYWkWupzWbYpI85kLu4WgYFnTfrAL4+PoC2aMZuwhjB5C
 Q9vWZKLPTaQ2KCGZYfS6h3hTQJVu0FFJrFhg3a2JEKn+g8vNFD6jGxTqjT36+wfBA7dU
 7b1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4pbf/FcdMUC8Nggm3cK6mmIT3knq3cBBR4RHijFkG50t69P4GnBKV0g1ZiISdT7iC6Mgx4hmpUR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuAI248UHBTYJS4d4uvr+gzd9phDQG5ijWUD9CPk9kxtYoosDi
 g08DMFcPqRAhcmQpdPsRUIeZNq8TsS4VRhVdLM8PtTwJvaImveEPCEpLoSW+rtbriMhVdhIhCzD
 gCwLG2kCffiVzkSIm5s9QLxWmrTH3NNLwn6sCaMUZ3A==
X-Gm-Gg: ASbGncvLBq/p7Ua3Cw9AA2ufyXE4o5AGoBiBSWWBRXBpktleR0zrNAJ9/WwPwyA0d9P
 kD0sj4s2u4JHcpn6dGdEPKEaHezBh8pXrDxHDSFbOVO2fXoU4PQudJIfaHzosSZRB4G5hKDHNFP
 NJyRAUjGkdX68XD+eO4jES+Hoq1EdzTMOkjjB+i3D6pfGxQAbglESa5+aRfsXlVvd++Gtks45XR
 VgUUGay1VyjxwjdIfF2X0VjdV6PHMgcmcVKJ9J5tTkeJgazHMCj4gVZPY5ZYFntVaqEAbFUBmQT
 VgHGZhhJQxIqy+FGKQ==
X-Google-Smtp-Source: AGHT+IFa/2cbIGKCDZ2v8wEyvKnZrrGJFeRexJg6fwcZTSltyNTrXO5QbxDoX827DZL9AHbtcev7dhQ9QG3pQWiW/UQ=
X-Received: by 2002:a05:6214:1bcd:b0:87d:f969:6a7d with SMTP id
 6a1803df08f44-8802f2d2d04mr54375076d6.18.1761924950343; Fri, 31 Oct 2025
 08:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251030094434.1390143-1-ajye_huang@compal.corp-partner.google.com>
 <CAD=FV=V6xV0m4pj=7f2dxDP-0A1AaQuYJP5NAnXNz1_bzH7nSw@mail.gmail.com>
 <7071a2b8198c09011c84d39b45dc6d1da4b69d12@intel.com>
 <789d88744fbd3a05758971dc8d893fb4599475f3@intel.com>
In-Reply-To: <789d88744fbd3a05758971dc8d893fb4599475f3@intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Fri, 31 Oct 2025 23:35:48 +0800
X-Gm-Features: AWmQ_blxyQaGsb2G54AT5MgQtyEAT64D04t6hwU5kGIchciQ4ACQDUgJ67aHa7I
Message-ID: <CALprXBb7w_15kOBo=ZUzD9vhKyPDD34frk9UYmcQvS_7vEfNaQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
To: Jani Nikula <jani.nikula@intel.com>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
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

Hi Jani, Doug

On Fri, Oct 31, 2025 at 6:40=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> And as soon as I hit send, I notice the quirk is missing BIT(). It's a
> bit mask, and the enum signifies the bit number.
>

This is my mistake, really sorry about that.
The  device which is equipped with the sharp panel uses kernel 6.6, which
 #define EDID_QUIRK_FORCE_6BPC            (1 << 10)  in drm_edid.c
However, the kernel latest is using enum, really appreciate you all
find this my mistake.
 I will send the v2 ,Thank you all.
