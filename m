Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B986449
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 16:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37196E84D;
	Thu,  8 Aug 2019 14:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29206E84D;
 Thu,  8 Aug 2019 14:26:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g17so95133415wrr.5;
 Thu, 08 Aug 2019 07:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fj4z8W6cdsh45vekjTO59hBeNsl3ptwt6rJ4Cmg/whI=;
 b=rzt6/ddq0X5Q6RaCd1yzN7VYUYMToXRCis/3WeYaIN+KL9ZbU3swZMpOdOzDokSQHt
 HtVtbCu/QfuUKz1mKKzxj0TfqEZpu3/PnzED4WuutqdpKEE262+dA55LZEZAmSs/0thZ
 w+ifbPOEcbzdtu///bPL3h15UyzWVd8HUn3SfZ5b7E1N2wdOLp9Q6nAMYkLg09jcQOZW
 82i2hIlVH39Z/x4pw3uM6hnE660RmHrD5FrCrRsxytxzGOz/S5MOINF8bA+0YZa8IB2I
 WMKYHRHuwyk+3s6g7TESzE7BHFy0bgHHDHs8hjlYGBLCUMtCFnIlxu6Qk1/gB+7kVsHP
 3prg==
X-Gm-Message-State: APjAAAVkbzbbSiiEVLpbhZ6tWtXt2JQt+69+uYWKJmAGeusaJSHfZYP9
 G0rFSGpHrEitlbnr38vC5g/Wt0riV8F2tM202QYGNA==
X-Google-Smtp-Source: APXvYqz8UZ005WObjnpvvUlwMyJ+M+pW0lN58RILDMrzqJs48bBb4psl0QdHA4tRVfPepBkzMTIl6iz4vtMFsvd3YHU=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr16172298wrr.341.1565274393148; 
 Thu, 08 Aug 2019 07:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190806014830.7424-1-hdanton@sina.com>
 <CABXGCsMRGRpd9AoJdvZqdpqCP3QzVGzfDPiX=PzVys6QFBLAvA@mail.gmail.com>
 <CADnq5_O08v3_NUZ_zUZJFYwv_tUY7TFFz2GGudqgWEX6nh5LFA@mail.gmail.com>
 <6d5110ab-6539-378d-f643-0a1d4cf0ff73@daenzer.net>
In-Reply-To: <6d5110ab-6539-378d-f643-0a1d4cf0ff73@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Aug 2019 10:26:20 -0400
Message-ID: <CADnq5_P=gtz_8vNyV7At73PngbNS_-cyAnpd3aKGPUFyrK64EA@mail.gmail.com>
Subject: Re: The issue with page allocation 5.3 rc1-rc2 (seems drm culprit
 here)
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: multipart/mixed; boundary="0000000000002e1b8c058f9bd85e"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fj4z8W6cdsh45vekjTO59hBeNsl3ptwt6rJ4Cmg/whI=;
 b=RRhMYeIA7cCQUcGs45JixmTtly34i8plV+jX6oGViZMW4eL2Ijzb1AzcvVEJggHCkM
 B/TP2QGUWVE9E5bYd4lyzrnf6B6MTxk/tB/T9h5v2ECCq+utUeNQbMSBIW2O+xWY4T29
 G8aIgsfuSNkjcEDWsSkJvLkBUVIR+F39sZlFvCPgOAFtGn+O9i7lonpqCbBMljV5eGwy
 r2DrKDVQ/8hhr4E43auR8B9PuN0Vml515UZP4VW9Q4UEaa4cInjOo2snNLRahUyBlcHy
 CfFitbZ8HKj7EDAbpBzLzpIKRib/oEDwr0j3LC83Ij2YojhZfbQenOo6Pk6AYYAg6wcb
 7/Ww==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Hillf Danton <hdanton@sina.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002e1b8c058f9bd85e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2019 at 4:13 AM Michel D=C3=A4nzer <michel@daenzer.net> wrot=
e:
>
> On 2019-08-08 7:31 a.m., Alex Deucher wrote:
> > On Wed, Aug 7, 2019 at 11:49 PM Mikhail Gavrilov
> > <mikhail.v.gavrilov@gmail.com> wrote:
> >>
> >> Unfortunately error "gnome-shell: page allocation failure: order:4,
> >> mode:0x40cc0(GFP_KERNEL|__GFP_COMP),
> >> nodemask=3D(null),cpuset=3D/,mems_allowed=3D0" still happens even with
> >> applying this patch.
> >
> > I think we can just drop the kmalloc altogether.  How about this patch?
>
> Memory allocated by kvz/malloc needs to be freed with kvfree.
>

Yup, good catch.  Updated patch attached.

Alex

--0000000000002e1b8c058f9bd85e
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amd-display-use-kvmalloc-for-dc_state-v2.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amd-display-use-kvmalloc-for-dc_state-v2.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz2ry4ps0>
X-Attachment-Id: f_jz2ry4ps0

RnJvbSA1YzI3YzI1Y2U3OWFjMmIxOGEzN2JjZDdkYzZmYTBiZDNkODczM2QzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFRodSwgOCBBdWcgMjAxOSAwMDoyOToyMyAtMDUwMApTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWQvZGlzcGxheTogdXNlIGt2bWFsbG9jIGZvciBkY19zdGF0ZSAodjIpCgpJdCdzIGxh
cmdlIGFuZCBkb2Vzbid0IG5lZWQgY29udGlndW91cyBtZW1vcnkuCgp2Mjoga3ZmcmVlIHRoZSBt
ZW1vcnkuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDEx
ICsrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IDI1MmI2
MjFkOTNhOS4uMjFmYjdlZTE3YzljIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjLmMKQEAgLTIzLDYgKzIzLDcgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvc2xhYi5o
PgorI2luY2x1ZGUgPGxpbnV4L21tLmg+CiAKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogCkBA
IC0xMTgzLDggKzExODQsOCBAQCBib29sIGRjX3Bvc3RfdXBkYXRlX3N1cmZhY2VzX3RvX3N0cmVh
bShzdHJ1Y3QgZGMgKmRjKQogCiBzdHJ1Y3QgZGNfc3RhdGUgKmRjX2NyZWF0ZV9zdGF0ZShzdHJ1
Y3QgZGMgKmRjKQogewotCXN0cnVjdCBkY19zdGF0ZSAqY29udGV4dCA9IGt6YWxsb2Moc2l6ZW9m
KHN0cnVjdCBkY19zdGF0ZSksCi0JCQkJCSAgIEdGUF9LRVJORUwpOworCXN0cnVjdCBkY19zdGF0
ZSAqY29udGV4dCA9IGt2emFsbG9jKHNpemVvZihzdHJ1Y3QgZGNfc3RhdGUpLAorCQkJCQkgICAg
R0ZQX0tFUk5FTCk7CiAKIAlpZiAoIWNvbnRleHQpCiAJCXJldHVybiBOVUxMOwpAQCAtMTIwNCwx
MSArMTIwNSwxMSBAQCBzdHJ1Y3QgZGNfc3RhdGUgKmRjX2NyZWF0ZV9zdGF0ZShzdHJ1Y3QgZGMg
KmRjKQogc3RydWN0IGRjX3N0YXRlICpkY19jb3B5X3N0YXRlKHN0cnVjdCBkY19zdGF0ZSAqc3Jj
X2N0eCkKIHsKIAlpbnQgaSwgajsKLQlzdHJ1Y3QgZGNfc3RhdGUgKm5ld19jdHggPSBrbWVtZHVw
KHNyY19jdHgsCi0JCQlzaXplb2Yoc3RydWN0IGRjX3N0YXRlKSwgR0ZQX0tFUk5FTCk7CisJc3Ry
dWN0IGRjX3N0YXRlICpuZXdfY3R4ID0ga3ZtYWxsb2Moc2l6ZW9mKHN0cnVjdCBkY19zdGF0ZSks
IEdGUF9LRVJORUwpOwogCiAJaWYgKCFuZXdfY3R4KQogCQlyZXR1cm4gTlVMTDsKKwltZW1jcHko
bmV3X2N0eCwgc3JjX2N0eCwgc2l6ZW9mKHN0cnVjdCBkY19zdGF0ZSkpOwogCiAJZm9yIChpID0g
MDsgaSA8IE1BWF9QSVBFUzsgaSsrKSB7CiAJCQlzdHJ1Y3QgcGlwZV9jdHggKmN1cl9waXBlID0g
Jm5ld19jdHgtPnJlc19jdHgucGlwZV9jdHhbaV07CkBAIC0xMjQyLDcgKzEyNDMsNyBAQCBzdGF0
aWMgdm9pZCBkY19zdGF0ZV9mcmVlKHN0cnVjdCBrcmVmICprcmVmKQogewogCXN0cnVjdCBkY19z
dGF0ZSAqY29udGV4dCA9IGNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgZGNfc3RhdGUsIHJlZmNv
dW50KTsKIAlkY19yZXNvdXJjZV9zdGF0ZV9kZXN0cnVjdChjb250ZXh0KTsKLQlrZnJlZShjb250
ZXh0KTsKKwlrdmZyZWUoY29udGV4dCk7CiB9CiAKIHZvaWQgZGNfcmVsZWFzZV9zdGF0ZShzdHJ1
Y3QgZGNfc3RhdGUgKmNvbnRleHQpCi0tIAoyLjIwLjEKCg==
--0000000000002e1b8c058f9bd85e
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--0000000000002e1b8c058f9bd85e--
