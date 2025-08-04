Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EC7B1A017
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 12:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B509610E1A5;
	Mon,  4 Aug 2025 10:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ww9LJPm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9902C10E1A5;
 Mon,  4 Aug 2025 10:57:42 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-af8fd1b80e5so704402866b.2; 
 Mon, 04 Aug 2025 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754305061; x=1754909861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKcmbw33i158VkcjIOBGndTohyXppuVVNq4r8SoAwu4=;
 b=Ww9LJPm6WgDAvnUQdqoTsr/RENRc7OzxZzyTZhcA+29z7lbLhtz1AnwaduRjC827Ga
 UX+Vfs/BQhXdgnGaUzGHUBQ6gnjN+LBPiAHFc3Ff8BsMU3CnkA8L9xXXpSX0y2VDFSnI
 C3sbh2z3O5ShVj0LzBY6hax6hzX/7Q09i2qzKTRYsrvrtSBBe7QnC6vN9v+2FBqGlgkI
 co8Z4wGIOm5Sn4cJPU2yp+XiMXSgbu7H4Gtt0N6g7RRHz3JOVdjf/01CFVIXDPKi2Wep
 E+TN4rV8mjmk5e00q9byySyTB/Td9RCNWHT8Z5QpbvocUxD5l5PNZ9Ay+e7nAsVTuIJH
 UduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754305061; x=1754909861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EKcmbw33i158VkcjIOBGndTohyXppuVVNq4r8SoAwu4=;
 b=aJQK4GG0nLKJ4wc00o/toKwyB15/nvcaQ4ufKFxy2X6Q+5OvXFMKudjTJXVLHgsnxm
 kNZSF6HIYCpizepOieDegleQoe+WvgDxYc/rDcDNjykwCUxF9QEpkG01WfFcGWV8jpqx
 YWrKUCx5GqQcZdUs45N/MePCemkQ6oneGD5adpGgq8IEJ/47px9YfSV1M/n1ka4k3aIX
 8wHjRb736CKh16yXuZHHxr801TeTxSGLotom5Yf5Up88BWTbxpdn94CvRp8KDYbK5x4N
 aUrIloIt2378UEPbEyepcPao917dDN6H8j5itsd4IVuHXFQlwM1pxy8ArNGjMuuA1CtB
 bVJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSxRqj51w9qwqn6Nu7Bbn1JdThmO86kh/jcnrb9WqMH7pvzSXJ4TOW3sLpLFZGIUwuV5AeTJMb5rI=@lists.freedesktop.org,
 AJvYcCXJppUnV5AxWthgE+2UhcjSYRA90p5K4+q8GfsgcazUmooe72oQlCu24KGt0GC9wZPX2OIVvmqf5SH4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziUlz3sXIXIp5fEN5QutU3OCR/+9TRKF/fhtA2e05Z8Fpm/3Bb
 4svZZD2qXXjfYPk85PipyzWr1BPcuz/bxOR0ByZbcG7rQNXhcdzoJ9+ualtxAzv1kO3ab9VtUmL
 cwB74Jy2J3EB6yhsC0xCpgvbg7HZAKZE=
X-Gm-Gg: ASbGncs0xzsQKE6RU9rA/s0Ma0QQqdmdwDpwWW4lwbWk798nhtK+PJi2SUXEA2StPrY
 ZY7gSDKsuGEBxCdLLMdcqWHVkjUAb23RHt2uGP5js14m5ZTUA0Q0PopIm7Vu3LXK11MPpBb5XdU
 MUO/bKHN0jICXZrjVtxHo+R1zPuBxgvJuv/mgMtOz3jzNj7kRaQzKqfKKAk02TzJeRERyCEbK8z
 mlppM+ZS+p+X+dTY9g=
X-Google-Smtp-Source: AGHT+IEKgWeCpweInZoRf8h+ySc8h8Zd/5K3fLo9Iz1IaB8JQ0OeLLaC5QAwreLPpuNZD9vPayfW02ltcKhkV1SLfyI=
X-Received: by 2002:a17:907:2da5:b0:af2:5a26:b32a with SMTP id
 a640c23a62f3a-af9401a7898mr948553966b.30.1754305060799; Mon, 04 Aug 2025
 03:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
 <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
In-Reply-To: <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Mon, 4 Aug 2025 13:57:29 +0300
X-Gm-Features: Ac12FXzOJ88j54Uw6RBDAtH4-5VhCyZG1ALSoSGb8O5tAtMwgrRtuY8do-ly4uo
Message-ID: <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: regressions@lists.linux.dev, pbonzini@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-acpi@vger.kernel.org, rafael@kernel.org, ville.syrjala@linux.intel.com, 
 tglx@linutronix.de, Christian Brauner <brauner@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
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

Double-checked bisect, looks like I've have found broken commit:

git bisect start
# status: waiting for both good and bad commits
# good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
# status: waiting for bad commit, 1 good commit known
# bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
# skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
# good: [ba5afb9a84df2e6b26a1b6389b98849cd16ea757] fs: rework
listmount() implementation
git bisect good ba5afb9a84df2e6b26a1b6389b98849cd16ea757
# good: [61da593f4458f25c59f65cfd9ba1bda570db5db7] Merge tag
'media/v6.8-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect good 61da593f4458f25c59f65cfd9ba1bda570db5db7
# bad: [e38f734add21d75d76dbcf7b214f4823131c1bae] Merge tag
'staging-6.8-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
git bisect bad e38f734add21d75d76dbcf7b214f4823131c1bae
# bad: [5d197e97fb106c09d3d013be341e5961fd70ec8a] Merge tag
'hsi-for-6.8' of
git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi
git bisect bad 5d197e97fb106c09d3d013be341e5961fd70ec8a
# good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
'docs-6.8-2' of git://git.lwn.net/linux
git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
# bad: [8c9244af4dc8680a453e759331f0c93d5bde1898] Merge tag
'kvm-x86-svm-6.8' of https://github.com/kvm-x86/linux into HEAD
git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
# bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
missing "depends on KVM"
git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
# bad: [1c3c87d720cbd1ff86dc1bfc6df8ee9adce5879b] Merge tag
'kvm-x86-selftests-6.7-rcN' of https://github.com/kvm-x86/linux into
HEAD
git bisect bad 1c3c87d720cbd1ff86dc1bfc6df8ee9adce5879b
# good: [8d99e347c097ab3f9fb93d0f88dddf20051d7c88] KVM: selftests:
Convert lib's mem regions to KVM_SET_USER_MEMORY_REGION2
git bisect good 8d99e347c097ab3f9fb93d0f88dddf20051d7c88
# bad: [6c370dc65374db5afbc5c6c64c662f922a2555ad] Merge branch
'kvm-guestmemfd' into HEAD
git bisect bad 6c370dc65374db5afbc5c6c64c662f922a2555ad
# good: [43f623f350ce1c46c53b6b77f4dbe741af8c44f3] KVM: selftests: Add
x86-only selftest for private memory conversions
git bisect good 43f623f350ce1c46c53b6b77f4dbe741af8c44f3
# good: [8a89efd43423cb3005c5e641e846184e292c1465] KVM: selftests: Add
basic selftest for guest_memfd()
git bisect good 8a89efd43423cb3005c5e641e846184e292c1465
# good: [5d74316466f4aabdd2ee1e33b45e4933c9bc3ea1] KVM: selftests: Add
a memory region subtest to validate invalid flags
git bisect good 5d74316466f4aabdd2ee1e33b45e4933c9bc3ea1
# first bad commit: [6c370dc65374db5afbc5c6c64c662f922a2555ad] Merge
branch 'kvm-guestmemfd' into HEAD

=D0=BF=D0=BD, 4 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 11:15=
 Jani Nikula <jani.nikula@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 03 Aug 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> > Here what I have from bisecting, please let me know if it makes things
> > clearer or not.
>
> Doesn't point at graphics, anyway.
>
> Cc: Christian.
>
>
> BR,
> Jani.
>
>
> >
> > git bisect log
> > git bisect start
> > # status: waiting for both good and bad commits
> > # good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
> > git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > # status: waiting for bad commit, 1 good commit known
> > # bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
> > git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
> > # skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> > git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> > # good: [ba5afb9a84df2e6b26a1b6389b98849cd16ea757] fs: rework
> > listmount() implementation
> > git bisect good ba5afb9a84df2e6b26a1b6389b98849cd16ea757
> > # good: [61da593f4458f25c59f65cfd9ba1bda570db5db7] Merge tag
> > 'media/v6.8-2' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
> > git bisect good 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > # bad: [e38f734add21d75d76dbcf7b214f4823131c1bae] Merge tag
> > 'staging-6.8-rc1' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
> > git bisect bad e38f734add21d75d76dbcf7b214f4823131c1bae
> > # bad: [5d197e97fb106c09d3d013be341e5961fd70ec8a] Merge tag
> > 'hsi-for-6.8' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi
> > git bisect bad 5d197e97fb106c09d3d013be341e5961fd70ec8a
> > # good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
> > 'docs-6.8-2' of git://git.lwn.net/linux
> > git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > # good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
> > 'docs-6.8-2' of git://git.lwn.net/linux
> > git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > # bad: [8c9244af4dc8680a453e759331f0c93d5bde1898] Merge tag
> > 'kvm-x86-svm-6.8' of https://github.com/kvm-x86/linux into HEAD
> > git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
> > # bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
> > missing "depends on KVM"
> > git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
> > # bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
> > missing "depends on KVM"
> > git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
> > # bad: [861deac3b092f37b2c5e6871732f3e11486f7082] Linux 6.7-rc7
> > git bisect bad 861deac3b092f37b2c5e6871732f3e11486f7082
> >
> > # being on a 861deac3b092
> > git bisect bad
> > The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> > This means the bug has been fixed between
> > ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> > [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > ba5afb9a84df2e6b26a1b6389b98849cd16ea757].
> >
> > Thanks.
> >
> > =D0=B2=D1=82, 29 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13:20 =
Jani Nikula <jani.nikula@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On Tue, 29 Jul 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> >> > Please let me know if any further information or testing is required=
.
> >>
> >> Likely the quickest way to find the root cause is to bisect the issue.
> >>
> >>
> >> BR,
> >> Jani.
> >>
> >> --
> >> Jani Nikula, Intel
>
> --
> Jani Nikula, Intel
