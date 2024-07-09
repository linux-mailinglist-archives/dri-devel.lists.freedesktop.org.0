Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E78C92BDDA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 17:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8775F10E591;
	Tue,  9 Jul 2024 15:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EEB91d0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B061310E586
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720537802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9hJNJvkqtuDKnpGxwTSSK4Nn/qjZ9Q6M1TKqTLLGIg=;
 b=EEB91d0aUPm15jkF7lIEglj57JYKj/WP1NZymNArOyEzZgII3S1b0SMFWPL9TuXPOwzlJj
 sZ4GI1m6tRLJcaQn85Wz3LExYNEBmQ08QRQtbsyDbvbxBKxDvEzHNXvSY3MWkIwEzJ2psW
 U/K/o/phftpmbum8qe0xAAq56xTH3uQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-FZYuhh0mOqybm4PU_de3ww-1; Tue, 09 Jul 2024 11:10:00 -0400
X-MC-Unique: FZYuhh0mOqybm4PU_de3ww-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52eaef92c91so3135859e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 08:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720537799; x=1721142599;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i9hJNJvkqtuDKnpGxwTSSK4Nn/qjZ9Q6M1TKqTLLGIg=;
 b=h2pAj6aG2B3vOFKml3wCICw5OgsWdOe8wjoshV/5erpLgMYDEVvWejRPVbG1u2OQlL
 9Ouizd5qsClt/nxW7owHi7vHU7SbY/J3bJ9gGt9UXvspzWvAS/+ew2ZrL7YGZvLw0NcM
 4tLGjAogY/pPWjWT02Ax042VVj6dS4FVMNFtOPpLbWK13KlTBfqc7D/vYFLyepFrntyf
 bG65/aDC4Aaji2tDznxf7S1iNgzFwFEtJ68Ze0z6leplxjQfVkeUqtRiglo2G6IESZXx
 oYTmKu6lNB5egv/XTJeLuWRaVZPt6c77y1x3JFDeLLRmsrest/aJB0+bEb/c3hAmPnyg
 2qUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEir2jqQDyc0NHAA9lN2lGc+VedHPkiwlkQU4zZaDgq3FxHwdhdQCWT/btfLI1AS/RAJ/lq0W2Z/CMHG/JIzN7fzhdubN5Lfs39hPvnKOW
X-Gm-Message-State: AOJu0Yy4Bemi56iFXshIAfDNmDcTDxWWGru7OQ+ClntxbV5kY5ltvVpy
 4bzbH2bw6+h2jwTc4LXrPvQcoWdR2TQGTCaAnYsCjgN2u5p7QkUXgooydquMbFnBM7+V7Fx8MZy
 UlQm95K73QHWG5HZWTwNfai1nBDBg1BklZgCaNaVV/b5pCWiTf3FGKV2pOQ9goY7xaQ==
X-Received: by 2002:a05:6512:3f0c:b0:52c:de00:9c04 with SMTP id
 2adb3069b0e04-52eb99d338amr2146342e87.48.1720537798946; 
 Tue, 09 Jul 2024 08:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbH1TZziI+vUJZQonXRAiSIHPZ19o53LoqN4VQ+Pt8OUVGTPQhQfUV73ZUPjiRu5OPM35iUw==
X-Received: by 2002:a05:6512:3f0c:b0:52c:de00:9c04 with SMTP id
 2adb3069b0e04-52eb99d338amr2146311e87.48.1720537798486; 
 Tue, 09 Jul 2024 08:09:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6e09fcsm45581385e9.4.2024.07.09.08.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 08:09:57 -0700 (PDT)
Message-ID: <e19d875c-70b4-4e0d-a481-ab2a99a8ee42@redhat.com>
Date: Tue, 9 Jul 2024 17:09:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
 <CANiq72kS2fAgRnR8yNfpN69tMG+UPfgfytaA8sE=tYH+OQ_L6A@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kS2fAgRnR8yNfpN69tMG+UPfgfytaA8sE=tYH+OQ_L6A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 09/07/2024 11:41, Miguel Ojeda wrote:
> Hi Jocelyn,
> 
> A quick docs-only review of the Rust side (some of these apply in
> several cases -- I just wanted to give an overview for you to
> consider).

Thanks, I'll fix all typo/grammar you mentioned.
> 
> On Tue, Jul 9, 2024 at 10:45 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> +//! This is a simple qr encoder for DRM panic.
>> +//!
>> +//! Due to the Panic constraint, it doesn't allocate memory and does all
> 
> Perhaps clarify "Panic constraint" here?
> 
>> +//! the work on the stack or on the provided buffers. For
>> +//! simplification, it only supports Low error correction, and apply the
> 
> "applies"?
> 
>> +//! first mask (checkboard). It will draw the smallest QRcode that can
> 
> "QR code"? "QR-code"?
> 
> In other places "QR-code" is used -- it would be ideal to be
> consistent. (Although, isn't the common spelling "QR code"?)

Agreed, I will replace all with "QR code".

> 
>> +//! contain the string passed as parameter. To get the most compact
>> +//! QR-code, the start of the url is encoded as binary, and the
> 
> Probably "URL".

Yes, I will run s/url/URL in the comments.
> 
>> +//! compressed kmsg is encoded as numeric.
>> +//!
>> +//! The binary data must be a valid url parameter, so the easiest way is
>> +//! to use base64 encoding. But this waste 25% of data space, so the
> 
> "wastes"
> 
>> +//! whole stack trace won't fit in the QR-Code. So instead it encodes
>> +//! every 13bits of input into 4 decimal digits, and then use the
> 
> "uses"
> 
>> +//! efficient numeric encoding, that encode 3 decimal digits into
>> +//! 10bits. This makes 39bits of compressed data into 12 decimal digits,
>> +//! into 40bits in the QR-Code, so wasting only 2.5%. And numbers are
>> +//! valid url parameter, so the website can do the reverse, to get the
> 
> "And the numbers are valid URL parameters"?
> 
>> +//! Inspired by this 3 projects, all under MIT license:
> 
> "these"
> 
>> +// Generator polynomials for QR Code, only those that are needed for Low quality
> 
> If possible, please remember to use periods at the end for both
> comments and docs. It is very pedantic, but if possible we would like
> to try to be consistent across subsystems on how the documentation
> looks etc. If everything looks the same, it is also easy to
> remember/check how to do it for new files and so on.

Sure, I will check this again.
> 
>> +/// QRCode parameter for Low quality ECC:
>> +/// - Error Correction polynomial
>> +/// - Number of blocks in group 1
>> +/// - Number of blocks in group 2
>> +/// - Block size in group 1
>> +/// (Block size in group 2 is one more than group 1)
> 
> We typically leave a newline after a list.
> 
>> +    // Return the smallest QR Version than can hold these segments
>> +    fn from_segments(segments: &[&Segment<'_>]) -> Option<Version> {
> 
> Should be docs, even if private? i.e. `///`?
> 
> Also third person and period.
> 
>> +// padding bytes
>> +const PADDING: [u8; 2] = [236, 17];
> 
> `///`?
> 
>> +/// get the next 13 bits of data, starting at specified offset (in bits)
> 
> Please capitalize.
> 
>> +        // b is 20 at max (bit_off <= 7 and size <= 13)
> 
> Please use Markdown for comments too.
> 
>> +/// EncodedMsg will hold the data to be put in the QR-Code, with correct segment
>> +/// encoding, padding, and Error Code Correction.
> 
> Missing newline? In addition, for the title (i.e. first paragraph), we
> try to keep it short/simple, e.g. you could perhaps say something
> like:
> 
>      /// Data to be put in the QR code (with correct segment encoding,
> padding, and error code correction).
> 
>> +/// QrImage
>> +///
>> +/// A QR-Code image, encoded as a linear binary framebuffer.
> 
> Please remove the title -- the second paragraph should be the title.
> 
>> +/// Max width is 177 for V40 QR code, so u8 is enough for coordinate.
> 
> `u8`
> 
>> +/// drm_panic_qr_generate()
> 
> You can remove this title.
> 
>> +/// C entry point for the rust QR Code generator.
>> +///
>> +/// Write the QR code image in the data buffer, and return the qrcode size, or 0
>> +/// if the data doesn't fit in a QR code.
>> +///
>> +/// * `url` The base url of the QR code. It will be encoded as Binary segment.
> 
> Typically we would write a colon. after the key, e.g.
> 
>      /// * `url`: the base URL of the QR code.
> 
>> +/// # Safety
>> +///
>> +/// * `url` must be null or point at a nul-terminated string.
>> +/// * `data` must be valid for reading and writing for `data_size` bytes.
>> +/// * `data_len` must be less than `data_size`.
>> +/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
> 
> It would be nice to mention for which duration these need to hold,
> e.g. the call or something else.

Yes, it's until the function returns, I will add this precision.

> 
>> +        // Safety: url must be a valid pointer to a nul-terminated string.
> 
> Please use the `// SAFETY: ` prefix instead, since it is how we tag
> these (i.e. differently from from the `# Safety` section).
> 
>> +/// * `version` QR code version, between 1-40.
> 
> If something like this happens to be used in several places, you may
> want to consider using transparent newtypes for them. This would allow
> you to avoid having to document each use point and it would enrich the
> signatures.
> 

I used to list all QR versions in an enum, but I find it a bit too much 
boilerplate to ensure the version is between 1 and 40.
By transparent newtypes, you mean adding "#[repr(transparent)]" to a 
struct ?
I don't plan to add more "version" usage, so probably not worth it.

> Thanks!
> 
> Cheers,
> Miguel
> 

Best regards,

-- 

Jocelyn

