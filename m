Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68727AA8965
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 23:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F45510E047;
	Sun,  4 May 2025 21:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="Y6algN3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159E410E047
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 21:09:21 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2240b4de12bso61201505ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1746392960; x=1746997760;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QfT+Zxg3Ps41McBcdx2w4OJm7zncfc7X1rPsHGcw0z0=;
 b=Y6algN3AiVwwLW6OMefZd1jdXgOfAnnOU5N8pQxXzgxqfntlOWdZXIdYQscdPjdMq3
 W2eHuD/2Cn4Xz91veLH6pANmEGcfV9I0c9Q12Tl21LwZ0Ymx24YUulHWWRrme0aIA2SM
 c5wPYcV7WudMqL3EaE+uZeHDWWMhGncHnqJj94fjiMn1nB2NbleWHQUuBFKN/kfv8H6g
 Vn1tTzTmzjdaR9K+zoa+3d9pU7mXcVheumr6qSfqxGweTedsSMVVUzr7Z2bs42sj+oNb
 GqIFRAt4GIX+dSYtShu3PkItzgZKwm7Nv1of9rEC8uU9TdWNMbAZmlvlaCHHHwoB0aar
 MS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746392960; x=1746997760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QfT+Zxg3Ps41McBcdx2w4OJm7zncfc7X1rPsHGcw0z0=;
 b=f0+MuHP/KNE0QPMm/seWHpLwJvt3D1PG7JISyYexXRnfRCVxnUFuuJ4FYi3OjhQ0Fh
 xuVlGVHqr4iIWKadHlND/zUM57zrGbFkrpMx1aWeiXtiXKFYpMlQE4nBv78w7TrLhPM6
 VaSa3s2O6Az6r1LBnZbS5YztSu617wsXA1ZxfqZLhUGKuH7FAPdYBq6ZxZhZrFXtq1AX
 2qGXOrbVGuD4cmoCme66LGQLZLS74/vj7DTdiLey+y4EtWJlQeroWJwbbUkpYhctED8G
 b+RGk8ZDMuyDYTi9+A9Xf1mJXTU7xnD5RroSSrUg9iZtI22EoZrvRdzFactbGUMnj29N
 V8zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKU6NNAnDRzv0JJ7aGCCj/jOUq8YFhbIv9+68OLwR64brbiNF9yztw1WpB9QcyNkAXUlWOdLLRT5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO1z/XBEXykj9DMFjn6Xbqaw4QQUzz12DH7/tWhkjVzVLu6OmL
 9Qt2sRYbWltgxT8bM5yslGZpSt4eBOFLmImYo1p04kF5DmHOID/FsPVizlSApvGl/iiTeNrluBJ
 ZMYsHFLy4TgkUqJ15zIuSZO40Cvw=
X-Gm-Gg: ASbGncschtL8P9Uo0p7OsvFDkFpUd0Wg89bMCCzwb3gGT7YfqIi9KcY8PJoQaEjB1Et
 4bQ56CGhYOtG1xWDeY3lpgI4AWRNmUTe2dtPw5LVAcy/cGy8gWRiHJLxfgoSBM5VsknH31EiXy7
 JzmBjocuAotBQQ1WsK9za0l6QdCoHvieA72+u0ta/pBMVhrF02X5bklzY=
X-Google-Smtp-Source: AGHT+IEyQ8Cn4QAYZf+y84T7uCSwNBjwsnr+WPyy9pwHvrfCp2EP9RKPuRWxICK3yBH7elJzirFItrsmdm3FGbNjikM=
X-Received: by 2002:a17:902:f541:b0:224:c46:d166 with SMTP id
 d9443c01a7336-22e1ea96542mr80783075ad.40.1746392960457; Sun, 04 May 2025
 14:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
 <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
 <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
 <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
In-Reply-To: <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:09:09 +0200
X-Gm-Features: ATxdqUFTzdLXr8lgfVVRwynOfAK5_xWM8dvz6TKO1bT-XzLgIOntX4SmbjH_alg
Message-ID: <CAFBinCDxhx6siM0woQCJwr2J_SJNJq9gKYm2qLu8W=bN4DWj8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: neil.armstrong@linaro.org, linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
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

On Tue, Apr 22, 2025 at 9:23=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 22/04/2025 09:04, neil.armstrong@linaro.org wrote:
> > On 19/04/2025 23:32, Martin Blumenstingl wrote:
> >> Hi Martijn, Hi Neil,
> >>
> >> On Thu, Apr 10, 2025 at 8:46=E2=80=AFPM <linux@martijnvandeventer.nl> =
wrote:
> >>>
> >>> Hi Martin,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> I encountered this issue some time ago as well and had a possible fix=
 in my tree (see
> >>> below).
> >>> My apologies for not upstreaming it earlier.
> >> No worries, we're all busy with both, offline and online life ;-)
> >>
> >>> While my fix is not as symmetric as yours=E2=80=94I like symmetry=E2=
=80=94it is somewhat simpler. It
> >>> did make the assumption that only  calling component_unbind_all() was=
 at fault and the the rest of the
> >>> code was correct. Therefore, calling one of the following functions:
> >>> meson_encoder_dsi_remove()
> >>> meson_encoder_hdmi_remove()
> >>> meson_encoder_cvbs_remove()
> >>> in case their counterpart was not called, should not result in any is=
sues.
> >>>
> >>> I just verified, and, as far as I understand, all of these functions =
do a check to confirm
> >>> whether the encoder was initialized before proceeding with cleanup.
> >> Yep, that seems to be the case right now.
> >> Neil, would you like Martijn's more simple approach with a Fixes tag
> >> and backport that?
> >> Then I'd send my patch as a small cleanup which doesn't have to be
> >> backported. Otherwise I'd spin a v2 with a fix for the issue that
> >> Martijn found (and including Anand's Reviewed/Tested-by)?
> >
> > Please send a follow-up, I'll apply this one today.
> >
>
> Yeah finally please split this in two:
> - patch 1 that can be backported
Martijn, I still haven't found the time to send a small patch that can
be easily backported.
If you want to submit your version of the patch: please go ahead!
Otherwise I'll need to find some time next week.


Best regards,
Martin
