Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F7B92F639
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 09:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8216710EC37;
	Fri, 12 Jul 2024 07:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TEBswgtF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA0610EC37
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720769404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ILAmKBMNHWPnZ2pjReNeFpsObqxNz8daqyUuTWpbm+o=;
 b=TEBswgtFea34CHA3LWOXr3kM5dOmGBygMozcr5CTjDoxQ80Ml7g7W2YvaKWpKW2ZE2XYp3
 6mZAIA26nRzysLhFNp6DJAiVPV9ONVjy5aFKCmOHBtcq9v5GsaLheqQEsRmhTgiipRQ1nE
 yiSI6HwqFNOkWoHd3n7hPYok2e3GMXk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-d04BdhmyN66vRySrWU00Tw-1; Fri, 12 Jul 2024 03:30:02 -0400
X-MC-Unique: d04BdhmyN66vRySrWU00Tw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ee8ceb0852so16049731fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 00:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720769401; x=1721374201;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ILAmKBMNHWPnZ2pjReNeFpsObqxNz8daqyUuTWpbm+o=;
 b=NGs9E0csVLngZMcOksptLxXj7jsX3xL+lSwMwi4CE6k1G9ZeKu1kzJ7kWTrUzFQw/e
 ue110hW2IJ4SThs0eVugBPzS0Rm2VLExBGH0KEY3hIt28itv2nNCWAEXq2zhfrl6c4hD
 wbtVHGoy6AQuKsuvR4IdRFchHr9GvdraUs0pUkeT/xXPd8XW77DaAR9UUzWd3NDWyVij
 5dkf5h1aLBmgKan6EMD3EqOVplLZel9+j+oh50botUmr6xO4+eypBXKS5f6eSAoUZimi
 T5gf69YWIFziIGdMc6GVvOKIee6HZatRvlt6jpafR0YJMZdbRP90yiNSHlWVI1fYSSqR
 EZkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnpSvAs2mQ0cStUAxd5t7Vv8ekCafXQPFXNFBLp66QOBEYtSGouT/Cvb3m5gagFyLe5HFFbz1cm+VNo2+TEQX6PLYipyNKcmpzjXv+wuFN
X-Gm-Message-State: AOJu0YznlgNBgs5MXoSE9zml6guzsVrGXUNj/dKlKUSdbqakkDf8XDWi
 dA2cw9VO70ddG/j7GvK+D81KyIhwrDigGMDTwbvo7D7/Y9tS9cMTjlftFAuHj9+Qnnqb1zY6f/R
 lp+JAVcRcJrdwMdf0Og4JWfSV/x4xKDVcR/QYF09t7WINSNg3YU/iWqEDsFlA8SGjqA==
X-Received: by 2002:a2e:9807:0:b0:2ee:7b93:5209 with SMTP id
 38308e7fff4ca-2eeb318ab22mr65445441fa.45.1720769401025; 
 Fri, 12 Jul 2024 00:30:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzHmvOfNeAufY8WCgrB3W4dZCi5V0aic+d0AtYJyfpAXNcvaXnAhrQm6IfEMXXxggTNKyIzQ==
X-Received: by 2002:a2e:9807:0:b0:2ee:7b93:5209 with SMTP id
 38308e7fff4ca-2eeb318ab22mr65445191fa.45.1720769400563; 
 Fri, 12 Jul 2024 00:30:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2ba7b0sm12846045e9.37.2024.07.12.00.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:29:59 -0700 (PDT)
Message-ID: <b8251559-af21-43fc-9733-6de39e33d829@redhat.com>
Date: Fri, 12 Jul 2024 09:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/panic: Add a QR code panic screen
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240710140057.347384-1-jfalempe@redhat.com>
 <20240710140057.347384-5-jfalempe@redhat.com>
 <CAH5fLgiVqSYcnS3b2=deGHg+VZk0RQK4HVBbrSrhxNMWYGUQ7w@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAH5fLgiVqSYcnS3b2=deGHg+VZk0RQK4HVBbrSrhxNMWYGUQ7w@mail.gmail.com>
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



On 11/07/2024 23:00, Alice Ryhl wrote:
> On Wed, Jul 10, 2024 at 4:01 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> This patch adds a new panic screen, with a QR code and the kmsg data
>> embedded.
>> If DRM_PANIC_SCREEN_QR_CODE_URL is set, then the kmsg data will be
>> compressed with zlib and encoded as a numerical segment, and appended
>> to the URL as a URL parameter. This allows to save space, and put
>> about ~7500 bytes of kmsg data, in a V40 QR code.
>> Linux distributions can customize the URL, and put a web frontend to
>> directly open a bug report with the kmsg data.
>>
>> Otherwise the kmsg data will be encoded as a binary segment (ie raw
>> ascii) and only a maximum of 2953 bytes of kmsg data will be
>> available in the QR code.
>>
>> You can also limit the QR code size with DRM_PANIC_SCREEN_QR_VERSION.
>>
>> v2:
>>   * Rewrite the rust comments with Markdown (Alice Ryhl)
>>   * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>>   * Use CStr directly, and remove the call to as_str_unchecked()
>>     (Alice Ryhl)
>>   * Add a check for data_len <= data_size (Greg KH)
>>
>> v3:
>>   * Fix all rust comments (typo, punctuation) (Miguel Ojeda)
>>   * Change the wording of safety comments (Alice Ryhl)
>>   * Add a link to the javascript decoder in the Kconfig (Greg KH)
>>   * Fix data_size and tmp_size check in drm_panic_qr_generate()
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
> 
> Overall, it looks reasonable to me. Some comments below.
> 
> The changelog should go below the --- or in the cover letter.
> 
>> +       if (stream.total_out > max_qr_data_size) {
>> +               /* too much data for the QR code, so skip the first line and try again */
>> +               kmsg = strchr(kmsg + 1, '\n');
>> +               if (!kmsg)
>> +                       return -EINVAL;
>> +               kmsg_len = strlen(kmsg);
>> +               goto try_again;
> 
> It seems like kmsg will start with a newline character when this retry
> routine runs. Is that really what you want? Why not instead strchr and
> then do the plus one afterwards?

Good catch, yes I should increment kmsg after the strchr, to skip the 
'\n' character.
> 
> This would also simplify the logic for why `kmsg + 1` doesn't go out
> of bounds. Right now I have to check that there's no codepath where
> kmsg points at the nul terminator byte.

sure, I will do that for v4.

> 
>> +const __LOG_PREFIX: &[u8] = b"rust_qrcode\0";
> 
> I guess this constant is because you're not using the module! macro?

I think it's a leftover of when I used pr_info!() to debug my rust code.
Drm panic is built within the main drm module, and is not a module on 
its own, so I'm not sure if I can use the module! macro here.

> 
>> +/// C entry point for the rust QR Code generator.
>> +///
>> +/// Write the QR code image in the data buffer, and return the QR code width,
>> +/// or 0, if the data doesn't fit in a QR code.
>> +///
>> +/// * `url`: The base URL of the QR code. It will be encoded as Binary segment.
>> +/// * `data`: A pointer to the binary data, to be encoded. if URL is NULL, it
>> +///    will be encoded as binary segment, otherwise it will be encoded
>> +///    efficiently as a numeric segment, and appended to the URL.
>> +/// * `data_len`: Length of the data, that needs to be encoded, must be less
>> +///    than data_size.
>> +/// * `data_size`: Size of data buffer, it should be at least 4071 bytes to hold
>> +///    a V40 QR code. It will then be overwritten with the QR code image.
>> +/// * `tmp`: A temporary buffer that the QR code encoder will use, to write the
>> +///    segments and ECC.
>> +/// * `tmp_size`: Size of the temporary buffer, it must be at least 3706 bytes
>> +///    long for V40.
>> +///
>> +/// # Safety
>> +///
>> +/// * `url` must be null or point at a nul-terminated string.
>> +/// * `data` must be valid for reading and writing for `data_size` bytes.
>> +/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
>> +///
>> +/// They must remain valid for the duration of the function call.
>> +
>> +#[no_mangle]
>> +pub unsafe extern "C" fn drm_panic_qr_generate(
>> +    url: *const i8,
>> +    data: *mut u8,
>> +    data_len: usize,
>> +    data_size: usize,
>> +    tmp: *mut u8,
>> +    tmp_size: usize,
>> +) -> u8 {
>> +    if data_size < 4071 || tmp_size < 3706 || data_len > data_size {
>> +        return 0;
>> +    }
>> +    // SAFETY: The caller ensures that `data` is a valid pointer for reading and
>> +    // writing `data_size` bytes.
>> +    let data_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(data, data_size) };
>> +    // SAFETY: The caller ensures that `tmp` is a valid pointer for reading and
>> +    // writing `tmp_size` bytes.
>> +    let tmp_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(tmp, tmp_size) };
>> +    if url.is_null() {
>> +        match EncodedMsg::new(&[&Segment::Binary(&data_slice[0..data_len])], tmp_slice) {
>> +            None => 0,
>> +            Some(em) => {
>> +                let qr_image = QrImage::new(&em, data_slice);
>> +                qr_image.width
>> +            }
>> +        }
>> +    } else {
>> +        // SAFETY: The caller ensures that `url` is a valid pointer to a
>> +        // nul-terminated string.
>> +        let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
>> +        let segments = &[
>> +            &Segment::Binary(url_cstr.as_bytes()),
>> +            &Segment::Numeric(&data_slice[0..data_len]),
>> +        ];
>> +        match EncodedMsg::new(segments, tmp_slice) {
>> +            None => 0,
>> +            Some(em) => {
>> +                let qr_image = QrImage::new(&em, data_slice);
>> +                qr_image.width
>> +            }
>> +        }
>> +    }
>> +}
> 
> This looks good to me. :)

Thanks a lot
> 
> Alice
> 


-- 

Jocelyn

