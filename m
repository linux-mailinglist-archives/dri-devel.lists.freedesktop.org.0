Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A45A6E457
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 21:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8700D10E4E5;
	Mon, 24 Mar 2025 20:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="eGN9sYHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 357 seconds by postgrey-1.36 at gabe;
 Mon, 24 Mar 2025 20:28:26 UTC
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFB510E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 20:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1742847744; x=1743106944;
 bh=vf70c5tOfKHHC/BHZEA6asmxjvC7HiIGPQLTOZOZaWw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=eGN9sYHedaDbr80DjvrasOB+loXQ+JpB6blmIU+KMI14/UypDrsrEtbL5qfmoYfb1
 aFf5JfmYsYUIr2VI4E+qAk1jNPugIahoq4rnsDJ9Evz/KEyaaDcFtRYyZSTXfgs/ZZ
 epaCm6z8v1NXZx1RVPXM/yg/8ge1523P/bCg7qPUV3jhD8KcqF7hfNIHX0NDgeZG8S
 dmtZYZNgh/oDNBGBTzOTMgrGQuMBWyv8T9TChxXqoEMChbxS7p1YY28FuQH5Xmtdmb
 yKiPdW+0FOC6SIgViq/UwMBDTnOktsyzEYjtcADp8zXmkKKNL6nRTDF+qMOOdAvvno
 1CbY/jurC/ozg==
Date: Mon, 24 Mar 2025 20:22:20 +0000
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 2/2] rust: drm: Add GPUVM abstraction
Message-ID: <D8ORYL7ZZG8R.1LEAYI5807G9H@proton.me>
In-Reply-To: <509EADD7-607B-4DED-ADAC-152D7338EB50@collabora.com>
References: <20250324-gpuvm-v1-0-7f8213eebb56@collabora.com>
 <20250324-gpuvm-v1-2-7f8213eebb56@collabora.com>
 <CANiq72mQ3zuYmsq1PD-49kKLNji8OJwuvxK5QWkNaBMuC-PHQg@mail.gmail.com>
 <509EADD7-607B-4DED-ADAC-152D7338EB50@collabora.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b9d8d4ae2ff8425c2b69e06a7ab40a7407bb0645
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Mon Mar 24, 2025 at 8:25 PM CET, Daniel Almeida wrote:
>> On 24 Mar 2025, at 14:36, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>=
 wrote:
>>=20
>> Hi Daniel,
>>=20
>> A few quick notes for future versions on style/docs to try to keep
>> things consistent upstream -- not an actual review.
>>=20
>> On Mon, Mar 24, 2025 at 4:14=E2=80=AFPM Daniel Almeida
>> <daniel.almeida@collabora.com> wrote:
>>>=20
>>> +#[allow(type_alias_bounds)]
>>=20
>> The documentation says this is highly discouraged -- it may be good to
>> mention why it is OK in this instance in a comment or similar.
>
> Someone correct me here, but I see no issue with this warning. That=
=E2=80=99s
> because we need the bound to make `<T::Driver as drv::Driver>` work in th=
e
> first place. Otherwise, we=E2=80=99d get a compiler error saying that the=
re=E2=80=99s
> no `Driver` associated type (assuming the case where a random T gets
> passed in)
>
> So, for this to be a problem, we would need to mix this up with something=
 that
> also has a `Driver` associated type, and this associated type would also =
need a
> drv::Driver bound.
>
> In other words, we would need a lot of things to align for this to actual=
ly
> have a chance of being misused. When you consider that this is then only =
used
> in a few places, the balance tips heavily in favor of the convenience of =
having
> the type alias IMHO.
>
> In fact, the docs point to the exact thing I am trying to do, i.e.:
>
>>  these bounds may have secondary effects such as enabling the use of =
=E2=80=9Cshorthand=E2=80=9D associated type paths
>
>>  I.e., paths of the form T::Assoc where T is a type parameter bounded by=
 trait Trait which defines an associated type called Assoc as opposed to a =
fully qualified path of the form <T as Trait>::Assoc.=20

You can avoid the allow by using:

    type DriverObject<T> =3D <<T as DriverGpuVm>::Driver as drv::Driver>::O=
bject;

That is more wordy, but avoids the allow (it still errors when you put
in something that doesn't implement `DriverGpuVm`).

---
Cheers,
Benno

