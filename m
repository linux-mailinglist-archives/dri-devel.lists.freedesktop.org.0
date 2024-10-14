Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6592599C3E7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE60010E3D2;
	Mon, 14 Oct 2024 08:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Saq8aIYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F0F10E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728895590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8yMw1kZ4wSYjtEjMJHnAEl230IFSdVbMJQeMPPAW0b8=;
 b=Saq8aIYZwbX1e/J0WhCs0u/D4QK2nJa3ytnHvTuosdfKBiRdV2mJGq6pnXOj2hK9CswgNd
 E7+i73R4uorgp88KOpS729LIW9rXvMjrfYT1o+PDT35MxiEupAup9U/d+qyqM6yyEOCDu8
 OFZyrtaRwwezOvjB6jXRtFMpQLsTCgk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-Om-KG3FxOTOXHTERcwZO_w-1; Mon, 14 Oct 2024 04:46:29 -0400
X-MC-Unique: Om-KG3FxOTOXHTERcwZO_w-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37d4af408dcso1629614f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728895588; x=1729500388;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8yMw1kZ4wSYjtEjMJHnAEl230IFSdVbMJQeMPPAW0b8=;
 b=gsGzJ44GBGGnUxr2aGDnPlTlqYGaSZld8BEE2DlqicErIgeBqSd576OJBM7nEHJzPg
 Nvowom2uVi7Fpc6IWhV7G76pRT0hd8xd6WgNAjiAgWIBZ02Oh+uSGfIJdNFBFMJz2Bjo
 UQd5Ree/KMYHU8qhRwXo+Pm/eduh6/cW9NDMQOMRUZWwIEVc7cl0wk/996ACbixCJRBn
 k2/2Ejsz/cN6eSpWOjWcPh8VVgB51OCvTaIznq+LON/lHZJU4dAu2+aTHjmVFxUmqc+m
 s+TpyqERrSvBWOwi2ieI+X5NEUD9s34oMZQaSLeIQpXU9kGXYTP4J3W5IyI+//hDLBra
 3oYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn56feBrGNnbcNb4LeFXasj29gihF3OWzHXcuJoE88I6McidM+3Dk8Px9Si9R2K7/RAAlLD3X5ZWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmJmNimKAub1Ah/w61G9Ur+UHryb0E2cQ1T5Ota2/Saz9HL7Zp
 Y1Fy1NLffaJNZwWbzd92I+KARtJxR62LrTwvGeIXzScbqg9ShFUhi5WwlI8I5bEsfHbf1TEPvkJ
 bukbfmslGtwhznSD4tpgU/HyR/OHVCfhFtFnu6AReo/rBjojUlMEvnZ0fdiyJftz0IA==
X-Received: by 2002:adf:b30c:0:b0:37d:39c1:4d3 with SMTP id
 ffacd0b85a97d-37d5518e694mr6473273f8f.6.1728895587693; 
 Mon, 14 Oct 2024 01:46:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFLIWKqOZJqqYjX4EN/6TkBMgfY/lAKwXdtrnkKX4U6krTF6dTWMvOHBK9y+++vFukzWCiZg==
X-Received: by 2002:adf:b30c:0:b0:37d:39c1:4d3 with SMTP id
 ffacd0b85a97d-37d5518e694mr6473245f8f.6.1728895587279; 
 Mon, 14 Oct 2024 01:46:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6d0071sm10661282f8f.62.2024.10.14.01.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 01:46:26 -0700 (PDT)
Message-ID: <567d7f67-291f-4483-921f-a03ecdf83c9d@redhat.com>
Date: Mon, 14 Oct 2024 10:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/panic: prefer eliding lifetimes
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-3-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-3-witcher@wiredspace.de>
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

On 12/10/2024 09:52, Thomas Böhler wrote:
> Eliding lifetimes when possible instead of specifying them directly is
> both shorter and easier to read. Clippy notes this in the
> `needless_lifetimes` lint:
> 
>      error: the following explicit lifetimes could be elided: 'b
>         --> drivers/gpu/drm/drm_panic_qr.rs:479:16
>          |
>      479 |     fn new<'a, 'b>(segments: &[&Segment<'b>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
>          |                ^^                       ^^
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#needless_lifetimes
>          = note: `-D clippy::needless-lifetimes` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::needless_lifetimes)]`
>      help: elide the lifetimes
>          |
>      479 -     fn new<'a, 'b>(segments: &[&Segment<'b>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
>      479 +     fn new<'a>(segments: &[&Segment<'_>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
>          |
> 
> Remove the explicit lifetime annotation in favour of an elided lifetime.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 7adfaa3d6222..767a8eb0acec 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -476,7 +476,7 @@ struct EncodedMsg<'a> {
>   /// Data to be put in the QR code, with correct segment encoding, padding, and
>   /// Error Code Correction.
>   impl EncodedMsg<'_> {
> -    fn new<'a, 'b>(segments: &[&Segment<'b>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
> +    fn new<'a>(segments: &[&Segment<'_>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
>           let version = Version::from_segments(segments)?;
>           let ec_size = version.ec_size();
>           let g1_blocks = version.g1_blocks();

