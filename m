Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1FCB1900F
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 23:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1152310E002;
	Sat,  2 Aug 2025 21:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g7zE4w18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C04710E002;
 Sat,  2 Aug 2025 21:25:10 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-707389a2fe3so32759326d6.2; 
 Sat, 02 Aug 2025 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754169909; x=1754774709; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cume3DFrFO7u3pL9Y1K1ypuZDFhhQLKijYnO66hZ+p0=;
 b=g7zE4w18y4MjQq0SIS0749xEyh6543vI2rY9ph/+zm866rqYGul1T4szgTfHgC6HoZ
 sVSq3dKmjHA9CnDX33g8gjbmYIm8s3rnjgPujPe0ztD7mo72qzali8W1AC/TJlvdHQF7
 1+Hz2CjYOKh5C+LZ8I6yAXo0u+ovVq+Q33RKUG/FiFHEaGF3PAHiyobzDrMRZU7o6qzt
 EkX/OHD5fkTd98tfYcBETxHqnAb4ZqD6qm1aUFPDNeEvU9Fg8vs+OnC+i8dq7OHHBQIA
 o6IkXZsMVY0UuzVCmenE1fv6efFvVLGcbhmuSAXUoHYgMu7Kq3LTQmoKoBOPR8gCReMR
 3KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754169909; x=1754774709;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cume3DFrFO7u3pL9Y1K1ypuZDFhhQLKijYnO66hZ+p0=;
 b=h37lw38fkqG9o+BIYQbtm7rymSJNmPNYxASMrxgGF8i/vsStpaOJus/V5J3IX3fEdZ
 8nzNanNmeAqrKhZZsUHqgZRDsZaBXZwq8BNOOKoV3ib9GKH8Tab1do1c+RPyHhwpqSBY
 etuyWtapBLfSQWwh2f3NJnKl+DYN3XlaQRyFgnqckfqfslUZtIcbLrFJMLDhvaNvnQO3
 I5jHTkYQ4YEYRxcL/Y7c12oGXeU31dFYA6tFpqeiq63HaHKsFnZgsvtBx2vq9+pMuZhG
 z548z/SpG/WBXXSD/RoAgrVvwEl1JTpDd7RGmydoPYTl7xNwpY40Un0O960zGFz35xlv
 HGBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4w9eTWj1ipWsXs2uah9CE2yMPhEG7pn2A2gzOnqFBLdqYBr8pKBqBxz3sK7orIhf1OOYJx8kM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0I1fmuHSTZsb29lo7xNa1LhmLuaPaAfP5KVTbOe3cHAxRPGl0
 isgnm/n95FaaSG7TvzAq9FxF0nSUuvaU8/Sup4br1jr5HUvL6VQjf0JJ
X-Gm-Gg: ASbGncs6W+UCqiV7CIfj8g9eUW/jXfpDWF7G8FNuhOJznDzvSqZxjAsrsl3nzolDp6y
 04oC2UkrGXrKZHFaL7hSOPins3CHQ4ctbB8SZifGJqCns5E06L1WpGAMRczEEsJDMV8fAue1fVY
 ywcmV1agOyXVIE3MWrDi1oL+OtA8GZ3VCsW6YzVcZ2IVMfGZbuiDbGFD0R44ruYEtwJHr8Itd5E
 +9qvtCoKrqR59JsdJpLeLbBhItkhLN5WJ3DerjPfNEESeeoO+TishfM5GdJ9jgGer7jBlblFLgM
 YcVKDuywOKKgw83M6n7H60kz9MJjlB1/l95ruriqnszTykFbJ8QxKXDfQatotTx81n+QSLAVdOQ
 d74wbqb3nNZq5N/82KmJeShc9z1x9
X-Google-Smtp-Source: AGHT+IHa0klRSXCFoybBuOxSnH60N2w1w4ZPxIlHjK/RY58F32+CUo39TEE2TF8g+Okjk48Ak292RQ==
X-Received: by 2002:a05:6214:c49:b0:707:61a9:8bdf with SMTP id
 6a1803df08f44-70935fb5a2amr67384806d6.22.1754169909270; 
 Sat, 02 Aug 2025 14:25:09 -0700 (PDT)
Received: from localhost ([142.186.9.88]) by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-7077c9da463sm39398046d6.9.2025.08.02.14.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 14:25:08 -0700 (PDT)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
Date: Sat, 2 Aug 2025 17:24:53 -0400
To: lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: replace snprintf() with scnprintf() in
 nvkm_snprintbf()
Message-ID: <kbskd3rnp76mslqfxhy4fdnz3joce6ukzfq5au2c5p7vgmyhfe@f65dzwx7bd5j>
References: <20250724195913.60742-1-ImanDevel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724195913.60742-1-ImanDevel@gmail.com>
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

On 25/07/24 03:59PM, Seyediman Seyedarab wrote:
> snprintf() returns the number of characters that *would* have been
> written, which can overestimate how much you actually wrote to the
> buffer in case of truncation. That leads to 'data += this' advancing
> the pointer past the end of the buffer and size going negative.
> 
> Switching to scnprintf() prevents potential buffer overflows and ensures
> consistent behavior when building the output string.
> 
> Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/enum.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/enum.c b/drivers/gpu/drm/nouveau/nvkm/core/enum.c
> index b9581feb24cc..a23b40b27b81 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/enum.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/enum.c
> @@ -44,7 +44,7 @@ nvkm_snprintbf(char *data, int size, const struct nvkm_bitfield *bf, u32 value)
>  	bool space = false;
>  	while (size >= 1 && bf->name) {
>  		if (value & bf->mask) {
> -			int this = snprintf(data, size, "%s%s",
> +			int this = scnprintf(data, size, "%s%s",
>  					    space ? " " : "", bf->name);
>  			size -= this;
>  			data += this;
> -- 
> 2.50.1
> 

Hi there,

Just following up on this patch. Please let me know if there's any
feedback or if further changes are needed.

Regards,
Seyediman
