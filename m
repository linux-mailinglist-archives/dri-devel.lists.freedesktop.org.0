Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86883F0312
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 13:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DF86E566;
	Wed, 18 Aug 2021 11:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676986E563;
 Wed, 18 Aug 2021 11:55:37 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id q6so1478916qvs.12;
 Wed, 18 Aug 2021 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pybp1h57rSgejjB5qeOIxXCpxMSfcbtU4L01XqE4NBQ=;
 b=SZTW27Mn8ya2gYpBZAYbIhyFF51oIaaZgzm5qElOoukcZPB6CVx/CNCyFM6DsXavUI
 UH+pmeMmWML8vV5BFO+Hl3iG2EBcb2J/MbzRaPdzf8Dhd0vDyhmac763XmpOcovpfj7r
 VmTFrrhWtR1s+Zw58FI1Ui5BfFJ/ZiF2yQC6My0JxCcclZD9oR4El7e4XDcNbeHc3YTw
 i7WaVAyL4hAUi1yHgck51jBxMPz3iBEv3sYGUpWRAFnbySf3rn98t317njNmApWkj4dM
 wxf7gaLXT5b3RHN4D7qHZmLyv3Z/CI8C1l8vaGKSX2082Z7acKybtBApH4iGgKHcwb63
 qjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pybp1h57rSgejjB5qeOIxXCpxMSfcbtU4L01XqE4NBQ=;
 b=lMZFMn4ojTfrMhsN0lnoAzMdapaIlYXcU0yk4O6VsUgG5LBzrrzkbn2z+2nIHYKMlK
 kJc5GB94/mlD8/zm5Fv635GUmCoRoWPjQZaBwG+YMe1RZNln/KKA3kdc57WO04bULPHP
 GrgLSSGdkbtLMvWhEBrY379tqhG/mrRiLTjmiIljx5hqK5z1PjqCHef+jMq1JEJZomu8
 GB8ZzEBUVq5wj5I3yxKuBYdd9teaywasPLt1NvVb2pFgHftSfz+77FZjNCoMqDbptuv/
 9b5xCQogDn+14sR+o5egejatxla37u3JbjCwv+dh98uSAYeVQYXHlwBb8r/OAVCI0aPp
 CsFw==
X-Gm-Message-State: AOAM530TmIJ3xWSRPwVpq5lQQAFDuo2nVWM/lGoK5peEU0/DYNCrlzWS
 0MRuaNfNdJfVf4+8yhcNqRamP4taZvFj+SjDXUbywJ+DizE=
X-Google-Smtp-Source: ABdhPJwdq2qrgN2f/CrK5JV/wojv8FLXFt/apl6fl93D1kv23W7OWSDtGRTg8RsDNVmf6eRQv4p70M9n9uuJnJB20ZY=
X-Received: by 2002:a0c:ffae:: with SMTP id d14mr8526854qvv.41.1629287736471; 
 Wed, 18 Aug 2021 04:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210816171444.105469-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210816171444.105469-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 18 Aug 2021 12:55:09 +0100
Message-ID: <CAM0jSHPzZ532ey6ZxbBaxDYbm6agDtMu7HFSSrSwaWmYKjfu8g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Ditch the i915_gem_ww_ctx loop member
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

On Mon, 16 Aug 2021 at 18:14, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> It's only used by the for_i915_gem_ww() macro and we can use
> the (typically) on-stack _err variable in its place.
>
> v2:
> - Don't clear the _err variable when entering the loop
>   (Matthew Auld, Maarten Lankhorst).
> - Use parentheses around the _err macro argument.
> - Fix up comment.
>
> Cc: Matthew Auld <matthew.william.auld@gmail.com>
> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
