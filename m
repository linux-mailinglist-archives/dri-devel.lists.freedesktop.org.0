Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2659192F092
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 23:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70D410EB9B;
	Thu, 11 Jul 2024 21:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IOBF2/bk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D79E10EB9B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 21:00:34 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-367a9ab4d81so746554f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 14:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720731633; x=1721336433;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66JmoF/QeR3DsXY/A2yKPCjdhMtDcQtWf+drZ4mBEhA=;
 b=IOBF2/bkiTXh96og9uDpVMOoTN2UybObEAMyaz6ntCDxyHm1z6qJfUtpOsvGi6Lgzn
 SK5Zrbl9l87QlA08hz6QcuVOhCww6iGzlFsd+kWs9o4YJPSKqZKztm6jcBJHKnXflIqe
 qAHpT6Zt8TJP+FchqjElkKLv12jR9Zs7C0OAwsWC7uwVM/c5sDCXOqZAnMkddO41rHcN
 IgEd56dpRDLscnIl3JeNMrXwRu8eZ/9l2nVCVmgLZJd5mhHXpldp4dEPTWUJVza0ALOp
 lc3cJ3bOFBRLSczIZR6N5KEAUg7D6S2gRzq4+aLqU8DZhLmTvQ2IVyyKvXC1rvP9jAi2
 TnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720731633; x=1721336433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=66JmoF/QeR3DsXY/A2yKPCjdhMtDcQtWf+drZ4mBEhA=;
 b=buWXpfCs3VnxBYnyT1reRy1+mtmn+VTAseQ9EtUPNEJpPcMOuk55mt4kjEhCwerVeT
 3tk8+XrC1t9d++BdiIkXcLlUWqflKFgSQQoJRTV7KCDD1zmFGMi88/M1DLcJ/B3MHHgP
 SsTyNoD5+15oo0vY2XsuypFjRfoRKUsIqjhHwDVo0mfnWe9YCcH9ouHEr3hLiAZFfglg
 FlP1Ua9b3cTm9iaZ6aJ1b0e7MWSXw9NugvvaziVIaY5+t36sGKDs0g5h0HDvPA5pzsif
 +5NLUNsOdkac0XnugWNrSIHZA4w+GorurwG/Cpwxy57jGwunMSwXmMreZvdsr10Llm0e
 FkRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6gugjcmKkf6skL0xoxV95JvgQ3el4qer9ZkCZ48HQcDjqVP9SulmJQjd/k8O4YEIF3FIv4kRkgK4SGCvuoksaYKNNy0G4a1/af+16CwEs
X-Gm-Message-State: AOJu0YxRR2ZhFVzS5wGgIDfS4Ekv6w6EUz6RH/3f4LaKdUQdhChbePVd
 f9f04NmVJUDG4knubSsWI9iErSNWqVbgNoqVp1NIDFyya7BnurpZ8gm04u7YA7drc2BXEN1h1hR
 GljbbAfNuI06dYtYyzniPSjwbY+rUOkNB0VVs
X-Google-Smtp-Source: AGHT+IHapAG+Jct6S7LNUUD+7jqXhZs5azzCnfIkvskET1tubguYLkqX2/UPvGInXhS7BA4uqni+7IG2uwUy4ekTEcY=
X-Received: by 2002:a5d:4e12:0:b0:366:e1a6:3386 with SMTP id
 ffacd0b85a97d-367ceacaa9fmr6076279f8f.44.1720731632563; Thu, 11 Jul 2024
 14:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240710140057.347384-1-jfalempe@redhat.com>
 <20240710140057.347384-5-jfalempe@redhat.com>
In-Reply-To: <20240710140057.347384-5-jfalempe@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 11 Jul 2024 23:00:20 +0200
Message-ID: <CAH5fLgiVqSYcnS3b2=deGHg+VZk0RQK4HVBbrSrhxNMWYGUQ7w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/panic: Add a QR code panic screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@redhat.com>
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

On Wed, Jul 10, 2024 at 4:01=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> This patch adds a new panic screen, with a QR code and the kmsg data
> embedded.
> If DRM_PANIC_SCREEN_QR_CODE_URL is set, then the kmsg data will be
> compressed with zlib and encoded as a numerical segment, and appended
> to the URL as a URL parameter. This allows to save space, and put
> about ~7500 bytes of kmsg data, in a V40 QR code.
> Linux distributions can customize the URL, and put a web frontend to
> directly open a bug report with the kmsg data.
>
> Otherwise the kmsg data will be encoded as a binary segment (ie raw
> ascii) and only a maximum of 2953 bytes of kmsg data will be
> available in the QR code.
>
> You can also limit the QR code size with DRM_PANIC_SCREEN_QR_VERSION.
>
> v2:
>  * Rewrite the rust comments with Markdown (Alice Ryhl)
>  * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>  * Use CStr directly, and remove the call to as_str_unchecked()
>    (Alice Ryhl)
>  * Add a check for data_len <=3D data_size (Greg KH)
>
> v3:
>  * Fix all rust comments (typo, punctuation) (Miguel Ojeda)
>  * Change the wording of safety comments (Alice Ryhl)
>  * Add a link to the javascript decoder in the Kconfig (Greg KH)
>  * Fix data_size and tmp_size check in drm_panic_qr_generate()
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Overall, it looks reasonable to me. Some comments below.

The changelog should go below the --- or in the cover letter.

> +       if (stream.total_out > max_qr_data_size) {
> +               /* too much data for the QR code, so skip the first line =
and try again */
> +               kmsg =3D strchr(kmsg + 1, '\n');
> +               if (!kmsg)
> +                       return -EINVAL;
> +               kmsg_len =3D strlen(kmsg);
> +               goto try_again;

It seems like kmsg will start with a newline character when this retry
routine runs. Is that really what you want? Why not instead strchr and
then do the plus one afterwards?

This would also simplify the logic for why `kmsg + 1` doesn't go out
of bounds. Right now I have to check that there's no codepath where
kmsg points at the nul terminator byte.

> +const __LOG_PREFIX: &[u8] =3D b"rust_qrcode\0";

I guess this constant is because you're not using the module! macro?

> +/// C entry point for the rust QR Code generator.
> +///
> +/// Write the QR code image in the data buffer, and return the QR code w=
idth,
> +/// or 0, if the data doesn't fit in a QR code.
> +///
> +/// * `url`: The base URL of the QR code. It will be encoded as Binary s=
egment.
> +/// * `data`: A pointer to the binary data, to be encoded. if URL is NUL=
L, it
> +///    will be encoded as binary segment, otherwise it will be encoded
> +///    efficiently as a numeric segment, and appended to the URL.
> +/// * `data_len`: Length of the data, that needs to be encoded, must be =
less
> +///    than data_size.
> +/// * `data_size`: Size of data buffer, it should be at least 4071 bytes=
 to hold
> +///    a V40 QR code. It will then be overwritten with the QR code image=
.
> +/// * `tmp`: A temporary buffer that the QR code encoder will use, to wr=
ite the
> +///    segments and ECC.
> +/// * `tmp_size`: Size of the temporary buffer, it must be at least 3706=
 bytes
> +///    long for V40.
> +///
> +/// # Safety
> +///
> +/// * `url` must be null or point at a nul-terminated string.
> +/// * `data` must be valid for reading and writing for `data_size` bytes=
.
> +/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
> +///
> +/// They must remain valid for the duration of the function call.
> +
> +#[no_mangle]
> +pub unsafe extern "C" fn drm_panic_qr_generate(
> +    url: *const i8,
> +    data: *mut u8,
> +    data_len: usize,
> +    data_size: usize,
> +    tmp: *mut u8,
> +    tmp_size: usize,
> +) -> u8 {
> +    if data_size < 4071 || tmp_size < 3706 || data_len > data_size {
> +        return 0;
> +    }
> +    // SAFETY: The caller ensures that `data` is a valid pointer for rea=
ding and
> +    // writing `data_size` bytes.
> +    let data_slice: &mut [u8] =3D unsafe { core::slice::from_raw_parts_m=
ut(data, data_size) };
> +    // SAFETY: The caller ensures that `tmp` is a valid pointer for read=
ing and
> +    // writing `tmp_size` bytes.
> +    let tmp_slice: &mut [u8] =3D unsafe { core::slice::from_raw_parts_mu=
t(tmp, tmp_size) };
> +    if url.is_null() {
> +        match EncodedMsg::new(&[&Segment::Binary(&data_slice[0..data_len=
])], tmp_slice) {
> +            None =3D> 0,
> +            Some(em) =3D> {
> +                let qr_image =3D QrImage::new(&em, data_slice);
> +                qr_image.width
> +            }
> +        }
> +    } else {
> +        // SAFETY: The caller ensures that `url` is a valid pointer to a
> +        // nul-terminated string.
> +        let url_cstr: &CStr =3D unsafe { CStr::from_char_ptr(url) };
> +        let segments =3D &[
> +            &Segment::Binary(url_cstr.as_bytes()),
> +            &Segment::Numeric(&data_slice[0..data_len]),
> +        ];
> +        match EncodedMsg::new(segments, tmp_slice) {
> +            None =3D> 0,
> +            Some(em) =3D> {
> +                let qr_image =3D QrImage::new(&em, data_slice);
> +                qr_image.width
> +            }
> +        }
> +    }
> +}

This looks good to me. :)

Alice
