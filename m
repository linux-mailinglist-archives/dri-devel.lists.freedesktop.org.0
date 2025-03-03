Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E08A4BAFA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638F210E387;
	Mon,  3 Mar 2025 09:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VAjyTkWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1963C10E387
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740994910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbnZQEekEL5+7VJfe+tKFsSed1V7olIdl++NfvcMfSE=;
 b=VAjyTkWNhmgtOGAozSDa9y65JlYyxKyY+vyVpwbET3JbjnUxvWqG36acPM4S8+giUgplAf
 MnKuuLPmDSHZbLOlBBbbSackfvr6LWcqtTWZ8l5iZ/jvCCKMAsMKkJNjKULczlWGGeRwuC
 dPoVWqzFXMaaBmSnobvYkJX04texmzA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-Sq6LegU6NVyIAdRZibufDQ-1; Mon, 03 Mar 2025 04:41:43 -0500
X-MC-Unique: Sq6LegU6NVyIAdRZibufDQ-1
X-Mimecast-MFC-AGG-ID: Sq6LegU6NVyIAdRZibufDQ_1740994903
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43ab456333aso36403525e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 01:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740994903; x=1741599703;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LbnZQEekEL5+7VJfe+tKFsSed1V7olIdl++NfvcMfSE=;
 b=hbg/aUDAYwPO2lkwsIWiGu4Z3NqdA75UlHvbMnsW/m0ZaNt0caAPBaLUqu6dcCghJk
 se9m4JPwnHD9eO2+Wu4LVRTbri0eGCra0ouMvi2ZjkJzBpu4eiqgErMb3HdPXU/dy7cL
 CWlHoTsnz6rrQy2a9XwaQAGn+TGYTduUPsgWD4zD3e87vAxY31oIr18hNSVLba/Kk5C0
 iZQ5d5wmHDxxM/B27TjigJLeStUpZTZU7AQ/Pdtc21jWf2zMBG/PipYWPAvJIp+x6OAn
 XS/1++cCD/kV9hayHWuH5g0kufIvANpMGRiXYDYuWUuuy5RREAJnDDWKnKhx5N3HcR5Z
 nmtw==
X-Gm-Message-State: AOJu0YxOtO5KVvgu35KRNTjablv3BwmcEMG7G3iKJFJEOdxENSKxkvG1
 f015F6g1beDoMsswm9/zFNy7I/rihstDoQvTg8+pIOEwrcDHtbs5Aix1n1DxlTJ7mEEXQqUCiWf
 onpwwNY/GCR984Te6WEf5gpN+UQc1Cv+1Vg5JF23T62gDoEZX8aaVlJowbiBz8Ynzag==
X-Gm-Gg: ASbGncuFlEyQs3+jcI6vXKhbC6nGlMNawpcyjsTnt7kORYQ2GQq7AJw0dCBgIMFK/WS
 XqSnqy5RVASCDQO7577ABFPNNS5BVqMaZpA9SpWAmF+UKdp3xJEUfrzYNti3ideoafTQfVRqui8
 KGh4ZG3W5Gp69B2sSS0FKyvd3YAUhOob+rJlgr7k2VocF5aVBptmRy52bsTDTZwjgx9IYZ60Sth
 AptvaX7v3piTviLdGygE4koMVfRrhlHCcfNsVZYYlvqYrwP1lQ+3SsTQP5Fpo37bNDDuLX0lPBw
 uFjx7TpSGDGSAGELz5M3oBl+9SinK6ZomYtv7pOZIDsNKzbtEDWR+mw=
X-Received: by 2002:a5d:61cd:0:b0:38c:3f12:64be with SMTP id
 ffacd0b85a97d-390eca06cdemr10490963f8f.35.1740994902688; 
 Mon, 03 Mar 2025 01:41:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVizEggt0+gnRtA0jge53v3XHkF35Zs1QmzZY9VyL57FFl+Hjzngtfu34rhJup5F7TcFTjTg==
X-Received: by 2002:a5d:61cd:0:b0:38c:3f12:64be with SMTP id
 ffacd0b85a97d-390eca06cdemr10490932f8f.35.1740994902233; 
 Mon, 03 Mar 2025 01:41:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844a16sm13917054f8f.79.2025.03.03.01.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 01:41:41 -0800 (PST)
Message-ID: <eecf227f-8f79-4572-95ae-7370f907579d@redhat.com>
Date: Mon, 3 Mar 2025 10:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panic: fix overindented list items in
 documentation
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
 <20250301231602.917580-2-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250301231602.917580-2-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fTE3mmuDkL1xPbGgO5qygW5EJv5xl1aPBxFCy_a8Pss_1740994903
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
>      error: doc list item overindented
>         --> drivers/gpu/drm/drm_panic_qr.rs:914:5
>          |
>      914 | ///    will be encoded as binary segment, otherwise it will be encoded
>          |     ^^^ help: try using `  ` (2 spaces)
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#doc_overindented_list_items
> 
> The overindentation is slightly hard to notice, since all the items
> start with a backquote that makes it look OK, but it is there.
> 
> Thus fix it.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 8bb5e52d75cc..6903e2010cb9 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -911,16 +911,16 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   ///
>   /// * `url`: The base URL of the QR code. It will be encoded as Binary segment.
>   /// * `data`: A pointer to the binary data, to be encoded. if URL is NULL, it
> -///    will be encoded as binary segment, otherwise it will be encoded
> -///    efficiently as a numeric segment, and appended to the URL.
> +///   will be encoded as binary segment, otherwise it will be encoded
> +///   efficiently as a numeric segment, and appended to the URL.
>   /// * `data_len`: Length of the data, that needs to be encoded, must be less
> -///    than data_size.
> +///   than data_size.
>   /// * `data_size`: Size of data buffer, it should be at least 4071 bytes to hold
> -///    a V40 QR code. It will then be overwritten with the QR code image.
> +///   a V40 QR code. It will then be overwritten with the QR code image.
>   /// * `tmp`: A temporary buffer that the QR code encoder will use, to write the
> -///    segments and ECC.
> +///   segments and ECC.
>   /// * `tmp_size`: Size of the temporary buffer, it must be at least 3706 bytes
> -///    long for V40.
> +///   long for V40.
>   ///
>   /// # Safety
>   ///

