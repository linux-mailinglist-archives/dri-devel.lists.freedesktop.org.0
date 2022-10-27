Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092960EE88
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 05:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E403310E16A;
	Thu, 27 Oct 2022 03:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B60110E167;
 Thu, 27 Oct 2022 03:26:55 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id f22so297561qto.3;
 Wed, 26 Oct 2022 20:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFwHYUjzDN0mA8IGZNoSPKemBRIs93alZhFx20gRWys=;
 b=Anhhj6NTYg1jyE2HEZEZfZMqb1yqAzPlKURqUCFgAcrETyPW2IK+4H6VPipcS3Cixq
 suRBtJsu1AMhkyH5hkQ6hdOlu2xzVv0bTRLVEg3ytIfKMEjAlvJxEEUKuYJNHxP9XNSt
 3o9nRLtWMg767KdsgKe/Zau4DLe6auk0mBFdFkEZUcANgo7veSDziJqHQ5Uld4UB21so
 KhUga6sXWvZFcd7PFLNji4y3nXE6KKxq7f40MMOd+7e+ebQ11S6WqaIbGuBJN2geplT4
 F2Z8EEwpkk0HNTKvlSunySmC1ZK/3cUelPgE0CM50vhHxhcf+WbblS+DM1eHeHlqNZXB
 YkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vFwHYUjzDN0mA8IGZNoSPKemBRIs93alZhFx20gRWys=;
 b=cXQrSAPJe2s+JCcUkRz2KyQRzxijiYeQ+qE9xB0XV29kvq0JEOYVKQ+vL1bke+k+XZ
 cI/Q62HaGoFqE/Q1NOled6RY22pM4/FLo31lT29aK+nfzRV/iftt6N3t9Dn/8sFnBIcP
 0kkZwC38IidwaZah/E3eV5F1SiqnOaaIWEYqSdRxNRsKn1xY7Hw7DOeCnHDa23Z/8cI2
 Od26CrBgeNkZubZEHwpmCTeVZlxz8AsCPyPqxlJFsIBs7VRhzpLNyrcgmi86LaYixR5h
 BA0XX3ZCW12Cg+hk4iseooaZ09OG3Yffgmf3aILvRUr/gZYmah6Zy8NOzJB82aksEKQp
 7Fdg==
X-Gm-Message-State: ACrzQf3FCHyKOq/svxHIaN/EwL7nkJBafIkEYwAOusXVWf0iTMGlQ8XU
 P+wrPfX+pDUwQEMHPtXFwHof3QRR5CmLUer1LyY=
X-Google-Smtp-Source: AMsMyM6lkWL6L97VUy56JRV/rFHo27hEgmw1FhlvQz7pf7xoMcR1o+Z02FIxZfB8r3eUwq1pjdDgqcovxLypi4j43v0=
X-Received: by 2002:a05:622a:38d:b0:39c:c94d:a887 with SMTP id
 j13-20020a05622a038d00b0039cc94da887mr40343997qtx.272.1666841214253; Wed, 26
 Oct 2022 20:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <Yz8rIxV7bVCcfZb0@kroah.com>
 <20221007013708.1946061-1-zyytlz.wz@163.com>
 <CAPM=9ty0+ouf+rQWhM=9XSKFOA2zxKfa00MsNBvwrQGPQm2uPQ@mail.gmail.com>
In-Reply-To: <CAPM=9ty0+ouf+rQWhM=9XSKFOA2zxKfa00MsNBvwrQGPQm2uPQ@mail.gmail.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Thu, 27 Oct 2022 11:26:41 +0800
Message-ID: <CAJedcCwxioxr+4TBTdrEjAZh97J3oroSHSgax+bxSNRXCBvkRg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
To: Dave Airlie <airlied@gmail.com>
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
Cc: alex000young@gmail.com, security@kernel.org, airlied@linux.ie,
 gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 1002992920@qq.com, Zheng Wang <zyytlz.wz@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave Airlie <airlied@gmail.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=8827=E6=97=
=A5=E5=91=A8=E5=9B=9B 08:01=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 7 Oct 2022 at 11:38, Zheng Wang <zyytlz.wz@163.com> wrote:
> >
> > If intel_gvt_dma_map_guest_page failed, it will call
> > ppgtt_invalidate_spt, which will finally free the spt.
> > But the caller does not notice that, it will free spt again in error pa=
th.
> >
> > Fix this by spliting invalidate and free in ppgtt_invalidate_spt.
> > Only free spt when in good case.
> >
> > Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
>
> Has this landed in a tree yet, since it's a possible CVE, might be
> good to merge it somewhere.
>
> Dave.
>

Hi Dave,

This patched hasn't been merged yet. Could you please help with this?

Best Regards,
Zheng Wang
