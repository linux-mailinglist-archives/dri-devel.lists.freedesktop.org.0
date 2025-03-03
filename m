Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED013A4BAF4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0AD10E16A;
	Mon,  3 Mar 2025 09:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c2i90kvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F32510E16A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740994866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D46wI1otbQqaNSu8WnEzDU27WQjj8NKTR6dNsZngyNk=;
 b=c2i90kvMbVR67GWb0PwH/HqHB3HJAZXAypzY4uUPEyEJsrldrYxH8jnSklRZOHoRdINqdm
 AQ2ZOmNb9s3A4YuAKW0fJGOlVpUAHidoCefE/CnBhMGMETfWkgKRY+IU8C+Fo6YWzUSRWR
 BmCF2HQAnQLgyTNEOAg8+UXd895Ne54=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-Ghh5vMk2PsCLLtFyMQKLLQ-1; Mon, 03 Mar 2025 04:41:02 -0500
X-MC-Unique: Ghh5vMk2PsCLLtFyMQKLLQ-1
X-Mimecast-MFC-AGG-ID: Ghh5vMk2PsCLLtFyMQKLLQ_1740994861
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39101511442so455788f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 01:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740994861; x=1741599661;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D46wI1otbQqaNSu8WnEzDU27WQjj8NKTR6dNsZngyNk=;
 b=ixPNanfQZts+ejD2U1M/TeTcqHOmg6MfhUCbdMOMUJWoH5QDSjodwIgNJDwTQ45tVi
 YKQOgHX98TMqxB7anAdebOUgB0bZaor31/qMvtDmTY0iAoqL9d9YEi+GzDIcbvlMX733
 Cna2FuKyjApC+UbsZNYDIZMz28G9Cqej17zeNAUvqWqkRDnUwUOnPUwIJ6ft481BXXkT
 DKUHfTO0Tuv6k8X2DbGMnwiSWzhkTqQcg67ifEHBNQ+urGTskdEEm3b7muH3s1ebd2UJ
 1T2vUFw7klPRBHTN3QTd3F3v748n9FYEyXmqz/UstE02o+vD2TYJEtEBrTcxAqUfQugJ
 WQzA==
X-Gm-Message-State: AOJu0YzJnL4ZsxinMU0cfgZQyzW9Era8BpStK9EUBlBcsh7d2sj+0a/6
 1sEjX0zt1QwOcdCjPONKSVLmk8TOtTEwYQ1ERaG8wb7RSJongyYQvWuiklLWABOd6N0eowr9XbM
 17AsKnZjgMX/UsIf0aFeA2/5KfQFPcVUTaA2+6BScG2iF8kjVcxCpZpKEjLN/3CshTA==
X-Gm-Gg: ASbGnctQBSC1EkbXdiGv8NvEylagn2tFQai1vBynolvGwdEN2YyBhpDWK/Ji5porVdn
 3B4KGCkDo/eoDBhRC91LCHf3HoZZ9K6uP1bS1cfqF1XBv5QVCm2vMi15FmohuXfZOYIibgTYi2v
 GnY7y13qhQQjiLDpIMe0Ho2BetgPom8q7Y2SyJP9ARDajRWb54aQ9vgmXHkVOXL9vOfoxQI8Kwj
 Vj2gLkC9MtZpIvothl8Xoj+2/aHPijgavMOc1ON2N7CDPMHp0aL5bc/wI6SauyYhADOYAPyeya4
 VsjfdQB0Vt9z51rmWG4j/qnOK57gSRjbqv13idvkc/5nYWBXyEPX+Dw=
X-Received: by 2002:a5d:47af:0:b0:391:a74:d7e2 with SMTP id
 ffacd0b85a97d-3910a74d9dfmr2504795f8f.26.1740994861458; 
 Mon, 03 Mar 2025 01:41:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1de8HYVkepPP08FYSHZESNB6/TmqfVP389HdGHarD00Xh+lNows9m8q7gT93iwcJAAY8o5A==
X-Received: by 2002:a5d:47af:0:b0:391:a74:d7e2 with SMTP id
 ffacd0b85a97d-3910a74d9dfmr2504754f8f.26.1740994861034; 
 Mon, 03 Mar 2025 01:41:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc63bcaafsm13675235e9.28.2025.03.03.01.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 01:41:00 -0800 (PST)
Message-ID: <b0dcc390-6e12-43ff-972d-1aca96fa374c@redhat.com>
Date: Mon, 3 Mar 2025 10:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panic: use `div_ceil` to clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Thomas_B=C3=B6hler?=
 <witcher@wiredspace.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20250301231602.917580-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250301231602.917580-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d88XBaca3tzMH1l2TLfK8oK-H4qTqcg5a7kPe6zJYQA_1740994861
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 02/03/2025 00:16, Miguel Ojeda wrote:
> Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
> Clippy warns:
> 
>      error: manually reimplementing `div_ceil`
>         --> drivers/gpu/drm/drm_panic_qr.rs:548:26
>          |
>      548 |         let pad_offset = (offset + 7) / 8;
>          |                          ^^^^^^^^^^^^^^^^ help: consider using `.div_ceil()`: `offset.div_ceil(8)`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_div_ceil
> 
> And similarly for `stride`. Thus apply the suggestion to both.
> 
> The behavior (and thus codegen) is not exactly equivalent [1][2], since
> `div_ceil()` returns the right value for the values that currently
> would overflow.

Thanks, so that's the DIV_ROUND_UP equivalent I was looking for.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Link: https://github.com/rust-lang/rust-clippy/issues/14333 [1]
> Link: https://godbolt.org/z/dPq6nGnv3 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index bcf248f69252..8bb5e52d75cc 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -545,7 +545,7 @@ fn add_segments(&mut self, segments: &[&Segment<'_>]) {
>           }
>           self.push(&mut offset, (MODE_STOP, 4));
>   
> -        let pad_offset = (offset + 7) / 8;
> +        let pad_offset = offset.div_ceil(8);
>           for i in pad_offset..self.version.max_data() {
>               self.data[i] = PADDING[(i & 1) ^ (pad_offset & 1)];
>           }
> @@ -659,7 +659,7 @@ struct QrImage<'a> {
>   impl QrImage<'_> {
>       fn new<'a, 'b>(em: &'b EncodedMsg<'b>, qrdata: &'a mut [u8]) -> QrImage<'a> {
>           let width = em.version.width();
> -        let stride = (width + 7) / 8;
> +        let stride = width.div_ceil(8);
>           let data = qrdata;
>   
>           let mut qr_image = QrImage {
> 
> base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6

