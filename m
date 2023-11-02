Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5313A7DEC02
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FF110E806;
	Thu,  2 Nov 2023 04:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554C410E063;
 Thu,  2 Nov 2023 04:47:43 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5401bab7525so806136a12.2; 
 Wed, 01 Nov 2023 21:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698900462; x=1699505262; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yycdQuA+JTtt5VWNbC0xQ0MSDmdTIynT72RC2eozkfU=;
 b=m0iypXeEnNdzfa4AGzhyjkjMHN2M5xviUHJDdK9OZND+AGPQ6ZwsNpcWn+sEi63yet
 KN/H3QtLRUfK8KIjgReTkNM5OkyMcg+dCiUojghNvKPuQYZ05ErfhYrg0AkcWI+/XHb0
 S6F+n1fLLU+0sib8CkZIBP0Af30DkyVHRjTrWpRVHL6W8OQnpPDnTHbnrTskGs5/M3w4
 OESzjUtObAVmBxbDq6QjHumb9tRK1rEmDDWJUHhlNrW4cqcrj28dmPAi5+QE5sKP3xzY
 g9SU4KyqfsAZ83CNGWoZsrtQQx3ZF5D8AX4YXOURKDIMsrUqq1BOGgJyRsITLrzz1/oq
 XnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698900462; x=1699505262;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yycdQuA+JTtt5VWNbC0xQ0MSDmdTIynT72RC2eozkfU=;
 b=A4OrQJnwvRPCj0I8nOcjbD/2lxch7ifCMrDr7RiBwTQTg2mOoRw8FDryzGgU8GNnKW
 Y5E9ybffeQMsIB7a3ETrET8p15w3MMHuXD5rcqKv/iWijHmWSUTQgGp8qFy4M9MI5vWl
 ADHFOQChljVjnbnFNiVLVHV2Bb24EB+GlbChwpTcejOooS0fnWzHz/YE3MEkhRxkScd6
 +K8sxlgrNH5LTfW26NGK4FhcPp5l1LJFIgYvUBsteHfVrwBW0s/bmxAGxBC8Oif3S7YF
 pQSizoar//LZKyBZ99E0BayXYekm5MTaItGIV+3cJG16wDDzUCe7c4+2Mtyx9y9WQNN9
 k5dQ==
X-Gm-Message-State: AOJu0YwGq/3sUB/J6NAy9VnnezleIdpm3TCGhwq04FUqkupYKWuFtpHZ
 DuHR/3QI9ScUZ2rBGndkBGQSyY/x5Sdgs5ToS+c=
X-Google-Smtp-Source: AGHT+IH4ptxiqaBLj89wtLjFhCMXYG7F5hOqvTQwwTniHzXkoQE971X19UAYC9WgBUDCERCr73qs+ot+7Qf4wxGS8to=
X-Received: by 2002:a17:906:bc93:b0:9bd:bbc1:1c5f with SMTP id
 lv19-20020a170906bc9300b009bdbbc11c5fmr2708008ejb.35.1698900461529; Wed, 01
 Nov 2023 21:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-13-dakr@redhat.com>
In-Reply-To: <20231101233113.8059-13-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 2 Nov 2023 14:47:30 +1000
Message-ID: <CAPM=9tzaFn_vyguD9iEh=Pi+JEFD_5eucJvFPQxt7W6mtvw=-A@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v8 12/12] drm/nouveau: use GPUVM common
 infrastructure
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Nov 2023 at 09:32, Danilo Krummrich <dakr@redhat.com> wrote:
>
> GPUVM provides common infrastructure to track external and evicted GEM
> objects as well as locking and validation helpers.
>
> Especially external and evicted object tracking is a huge improvement
> compared to the current brute force approach of iterating all mappings
> in order to lock and validate the GPUVM's GEM objects. Hence, make us of
> it.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
