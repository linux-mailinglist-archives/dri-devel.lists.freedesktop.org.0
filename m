Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B5A90428
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 15:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF56C10E038;
	Wed, 16 Apr 2025 13:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ws0CLdWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC42510E90F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744809509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYYwLTuVZAD8yB0aza7qR8SAg9Lr+TNGrhR+c2xdSYI=;
 b=Ws0CLdWGrUyJkbB0xg5i3ZslKsr4a0Xjfc9vSGXrmKV5rXueEgFSnZcJ57NB4HrgsTPthH
 acTrq2jovv7XJrMb1oRyS0qR77FdWEciS/WhdxZcQ6DC5XLvKOOTpzN7peoyAC98vd42cj
 jmOdFjRPErN6v9ZJvLKoTNLvq1uq+LM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-5x4xUWVLPVO878_-zYHTow-1; Wed, 16 Apr 2025 09:18:28 -0400
X-MC-Unique: 5x4xUWVLPVO878_-zYHTow-1
X-Mimecast-MFC-AGG-ID: 5x4xUWVLPVO878_-zYHTow_1744809507
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf5196c25so41242455e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 06:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744809507; x=1745414307;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYYwLTuVZAD8yB0aza7qR8SAg9Lr+TNGrhR+c2xdSYI=;
 b=ty0qcqXrASuNWj3RLwPhjEfdbkLDjIHw+xmXlWFuhDvL8TQfAFHBD6anYwCrVcTItv
 jghWRUV0mounnENeQV58Mj/CZdnS/An3ms4ekNV8fCLP5w7xsNY6HMwER8qjJOEtbbLz
 93MWodp1BAruFRsm6d66riOlgcgzSrHHGPLJCVz8P9PAKTBSlLe10R5+g3G5Et6yPiu+
 MCdJUZrYkXsCc2bthwRYPR6134X/FRVOT14mocqOlA3u+QSLh3pBgu/4ENqc63q24pBQ
 tPWGOSXPXZNU9LRmEDNZ63zaqDfxI5tNq5KOEsD8MxrynqmdTRZKxL1fJBbTCK3Bb3fi
 AMCA==
X-Gm-Message-State: AOJu0YykYTA2P36xbPZzeSo+eQojwWVCE64XW9z5UFKxPIqFTwZ8YxnO
 ojFAUZCvpt/7TEiSQjf6gyopzJbTdcuFXE/5l9j1Zt6xM1pBeg6by5EWKLZUeowPIwLXym9I58I
 vgj/+CKDzhABRWM1eXApycmFQlCymN9SAYKz6oq+oD77LH+4Vo5SzUrX6mJupj2o23g==
X-Gm-Gg: ASbGncuUrIRclwKLuoM6XejLEgQAZdFHL4kWJ3mL3ZPi7ff9mI/w1Sr2ZkcvT4IjP36
 27P2XxBU72q7aGMPWmLYXpcaI5HqnBoL+aKgsUun88+mqCY/AJAbXUOBBP0I2Bkn+ADbRi4k6hf
 6WjGRNgljCmTRKig/a6/LFeP/gPjMDUT98YWRwcF961t4fsY2ywF0U7LUmwVn4+K1LL3coBk2Xu
 GqzvPqBn8UtltMvnwmNM7MrzmSBp9MbG1jibiRbHoSrfTSVJiHsqIHPWg/kdkkx3/d6klsd2NZU
 H0lXAfWQdGzOpBufv8Egcl4VW7A0izpuXGjdEw+bdbbmhJ+peUI=
X-Received: by 2002:a05:600c:1d2a:b0:43d:36c:f24 with SMTP id
 5b1f17b1804b1-4405d61ca24mr19761275e9.13.1744809506780; 
 Wed, 16 Apr 2025 06:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwLxrssU1ldVAsWqYITreGih0SWn1/lrOXhFExpzdKQmsh4xxqB+dzhCbmzH3Ij6WFE80fmA==
X-Received: by 2002:a05:600c:1d2a:b0:43d:36c:f24 with SMTP id
 5b1f17b1804b1-4405d61ca24mr19760785e9.13.1744809506096; 
 Wed, 16 Apr 2025 06:18:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4c8378sm21587785e9.6.2025.04.16.06.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 06:18:25 -0700 (PDT)
Message-ID: <7e54be7d-9c67-45ad-819c-fba6d2da16fc@redhat.com>
Date: Wed, 16 Apr 2025 15:18:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: use `///` for private items too
To: Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20250416122106.2554208-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250416122106.2554208-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6okCBQjYezZYEWN6781W-ZkzIGU1qLdbUE0UUkfZ5E0_1744809507
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

On 16/04/2025 14:21, Miguel Ojeda wrote:
> `///` should still be used for private items [1]. Some of the items in
> this file do so already, so do it for a few other clear candidates in
> the file.

Thanks, it looks good to me.
As it's only comments, I think it's not worth to mark it as a fix, and 
to backport it to older releases.

I plan to push it to drm-misc-next tomorrow.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


Best regards,

-- 

Jocelyn

> 
> Link: https://lore.kernel.org/rust-for-linux/20250416112454.2503872-1-ojeda@kernel.org/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Not sure if you would consider it a fix, but please feel free to add Fixes: etc.
> if so. Thanks!
> 
>   drivers/gpu/drm/drm_panic_qr.rs | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index f2a99681b998..642e3240a014 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -315,7 +315,7 @@ fn get_header(&self) -> (u16, usize) {
>           }
>       }
> 
> -    // Returns the size of the length field in bits, depending on QR Version.
> +    /// Returns the size of the length field in bits, depending on QR Version.
>       fn length_bits_count(&self, version: Version) -> usize {
>           let Version(v) = version;
>           match self {
> @@ -331,7 +331,7 @@ fn length_bits_count(&self, version: Version) -> usize {
>           }
>       }
> 
> -    // Number of characters in the segment.
> +    /// Number of characters in the segment.
>       fn character_count(&self) -> usize {
>           match self {
>               Segment::Binary(data) => data.len(),
> @@ -569,8 +569,8 @@ struct EncodedMsgIterator<'a> {
>   impl Iterator for EncodedMsgIterator<'_> {
>       type Item = u8;
> 
> -    // Send the bytes in interleaved mode, first byte of first block of group1,
> -    // then first byte of second block of group1, ...
> +    /// Send the bytes in interleaved mode, first byte of first block of group1,
> +    /// then first byte of second block of group1, ...
>       fn next(&mut self) -> Option<Self::Item> {
>           let em = self.em;
>           let blocks = em.g1_blocks + em.g2_blocks;
> @@ -638,7 +638,7 @@ fn clear(&mut self) {
>           self.data.fill(0);
>       }
> 
> -    // Set pixel to light color.
> +    /// Set pixel to light color.
>       fn set(&mut self, x: u8, y: u8) {
>           let off = y as usize * self.stride as usize + x as usize / 8;
>           let mut v = self.data[off];
> @@ -646,13 +646,13 @@ fn set(&mut self, x: u8, y: u8) {
>           self.data[off] = v;
>       }
> 
> -    // Invert a module color.
> +    /// Invert a module color.
>       fn xor(&mut self, x: u8, y: u8) {
>           let off = y as usize * self.stride as usize + x as usize / 8;
>           self.data[off] ^= 0x80 >> (x % 8);
>       }
> 
> -    // Draw a light square at (x, y) top left corner.
> +    /// Draw a light square at (x, y) top left corner.
>       fn draw_square(&mut self, x: u8, y: u8, size: u8) {
>           for k in 0..size {
>               self.set(x + k, y);
> @@ -784,7 +784,7 @@ fn is_version_info(&self, x: u8, y: u8) -> bool {
>           vinfo != 0 && ((x >= pos && x < pos + 3 && y < 6) || (y >= pos && y < pos + 3 && x < 6))
>       }
> 
> -    // Returns true if the module is reserved (Not usable for data and EC).
> +    /// Returns true if the module is reserved (Not usable for data and EC).
>       fn is_reserved(&self, x: u8, y: u8) -> bool {
>           self.is_alignment(x, y)
>               || self.is_finder(x, y)
> @@ -793,13 +793,14 @@ fn is_reserved(&self, x: u8, y: u8) -> bool {
>               || self.is_version_info(x, y)
>       }
> 
> -    // Last module to draw, at bottom left corner.
> +    /// Last module to draw, at bottom left corner.
>       fn is_last(&self, x: u8, y: u8) -> bool {
>           x == 0 && y == self.width - 1
>       }
> 
> -    // Move to the next module according to QR code order.
> -    // From bottom right corner, to bottom left corner.
> +    /// Move to the next module according to QR code order.
> +    ///
> +    /// From bottom right corner, to bottom left corner.
>       fn next(&self, x: u8, y: u8) -> (u8, u8) {
>           let x_adj = if x <= 6 { x + 1 } else { x };
>           let column_type = (self.width - x_adj) % 4;
> @@ -812,7 +813,7 @@ fn next(&self, x: u8, y: u8) -> (u8, u8) {
>           }
>       }
> 
> -    // Find next module that can hold data.
> +    /// Find next module that can hold data.
>       fn next_available(&self, x: u8, y: u8) -> (u8, u8) {
>           let (mut x, mut y) = self.next(x, y);
>           while self.is_reserved(x, y) && !self.is_last(x, y) {
> @@ -841,7 +842,7 @@ fn draw_data(&mut self, data: impl Iterator<Item = u8>) {
>           }
>       }
> 
> -    // Apply checkerboard mask to all non-reserved modules.
> +    /// Apply checkerboard mask to all non-reserved modules.
>       fn apply_mask(&mut self) {
>           for x in 0..self.width {
>               for y in 0..self.width {
> @@ -852,7 +853,7 @@ fn apply_mask(&mut self) {
>           }
>       }
> 
> -    // Draw the QR code with the provided data iterator.
> +    /// Draw the QR code with the provided data iterator.
>       fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>           // First clear the table, as it may have already some data.
>           self.clear();
> 
> base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
> --
> 2.49.0
> 

