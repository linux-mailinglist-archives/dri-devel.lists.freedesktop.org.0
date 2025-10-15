Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F6BE03D5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 20:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5377010E8BC;
	Wed, 15 Oct 2025 18:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fHflyiUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834D610E835
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:37:06 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-33b9e390d74so146678a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760542626; x=1761147426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vnBAgCmbYNml3zpTyyPbm6K/u2+pZyuZXQIZmUzghcw=;
 b=fHflyiUNNxKyNgH3Kqn28/3NCwEs9YMB+elkT74wdWDwi59cCt4L0TIk4UxivZC1MD
 foZePcEkERdYTETAOIbw0QTlUFNueqBkB9PuHW6pXXhlusByK3o3xCy+IgrXDRdz4S+t
 Au2BFzjaJryUZZEQMkjLbqvihWwY162TDNF1ChyjFIACcUfIirzxd6R/d7H0rZ0OJ1Lc
 T3nbqlk2iOU3/ktWB5Vim7SvpZ6o0jkA9Z7/XkCuE5YcPYCAirNQZFr0niPbzqt2x4Uu
 1Z6E6wlGO4ZFW0gQcTxtUBMwLTOPfVNsgpVuMMZjxoJeIBUcI4m5v0sWaWESvqr9cKTr
 ZohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760542626; x=1761147426;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vnBAgCmbYNml3zpTyyPbm6K/u2+pZyuZXQIZmUzghcw=;
 b=c5/dAn4dWOG3Z0qOsoevoG3zJqegoCz3K4tH99Dwz5LFM9QPjBNtETiS7NJvFHkVb9
 WEZzckH9zZT5uLBiReKrMguFq65PfctYZoJlWOHfRT70/xkvoYCM0Otww7mKzMPA7K0U
 XeHPMDFkFXDQOjhCW8zlnjfZq9/n1xbdOZiUEggcY08wTryOfiCpGBfVtCckZP1b1ZJd
 HGu3bzPXl8uwei8ZtHuPC4RRsWBvY3wBt2tsZhuVlB4ydHW/TNc8EczBLv8pf4X3+Du8
 ZNmdJI8QT9VAObbasOf6Hoym7sxRxfq6G+RFi+zLQBaivFwhrRdqes1FLY//twOfmVGs
 SS1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtM40a9WEPwt81ZYYo4Dy6kXKXK3mu8mI14UuD2l1vi7YN3c3tGcbGR+QVZaAXGsn3xhfFVtbPkUQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe3+ndW1u2WmZf2LTTOs6jvq1a2p7lxkKWCpkb5hHZAN7EAMy5
 zk43L6dknzcwOSu6USw5VhNJjfYqCSeZKbwtibW5V0oNFMeQ9JpWfG4T
X-Gm-Gg: ASbGncu5eDgpm5nEBtcSJdB0pg5CEVB5rWBp7pFGcMbizbaeqGaXVte8tR4nbgdm0Mc
 drxaKtB61TTiR7P51L5T5aILbs/l+XPxjnEVzhQz6007zcm6x7hD5d++1e4DoX7Gha9xRx6Myxy
 V5QPebMy2KmB0Ws1drQv4YDNqnEMjMdO8y03GZIsw1l9jjVFRsLFJfTTgj2fmuaQGqb2ct5AoEv
 KJpZp8Hb2ShdjNttkDd36VC714lzusfTMB/0b6kAlk5+4+TJevPfX9BFrHh3E0wUW5bP+j4LhpO
 G+p36qQLs0BV5qf5Gunn4x2AXbm3LTmbVPx4hpPT0pzwj0sQ7bB96wlQ3xHvOFtkjEwuIq8gsh4
 cShnZfAEBHxO7a6C48pQd9Bitt7g8ziz0pI3dCrxlyYKCKW2oOKBJDd1wtfTRvzoLIU+uI4ueNz
 1UD7yQoN1Zxtzj3/pT
X-Google-Smtp-Source: AGHT+IEJjooXXaZhfIzd8Ul2LkbtfQbQZORtByVAe67pEeQe57Gz2lveZjTzB8fnkfh/VdT1hhQLNg==
X-Received: by 2002:a17:90b:1e0a:b0:32b:aee1:18d5 with SMTP id
 98e67ed59e1d1-33b5138e670mr33927500a91.29.1760542625939; 
 Wed, 15 Oct 2025 08:37:05 -0700 (PDT)
Received: from ?IPV6:2405:201:8000:a149:4670:c55c:fe13:754d?
 ([2405:201:8000:a149:4670:c55c:fe13:754d])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61b0ed20sm20427756a91.23.2025.10.15.08.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 08:37:05 -0700 (PDT)
Message-ID: <192bc74d-90d8-45ae-a324-6c29ccae2a06@gmail.com>
Date: Wed, 15 Oct 2025 21:06:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
To: bbrezillon@kernel.org, himal.prasad.ghimiray@intel.com, dakr@kernel.org,
 matt.coster@imgtec.com, robin.clark@oss.qualcomm.com,
 matthew.brost@intel.com, aliceryhl@google.com,
 thomas.hellstrom@linux.intel.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, simona@ffwll.ch, skhan@linuxfoundation.org,
 khalid@kernel.org, david.hunter.linux@gmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251015113656.21447-1-spyjetfayed@gmail.com>
Content-Language: en-US
From: Ankan Biswas <spyjetfayed@gmail.com>
Autocrypt: addr=spyjetfayed@gmail.com; keydata=
 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
 TRpGew2ozniUMliyaLH9UH6/e9Us
In-Reply-To: <20251015113656.21447-1-spyjetfayed@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 15 Oct 2025 18:46:05 +0000
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



On 10/15/25 6:56 PM, Matt Coster wrote:
 > On 15/10/2025 12:31, Ankan Biswas wrote:
 >> The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
 >> instead of '@map', leading to this warning during htmldocs build:
 >>
 >> WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not 
described in 'drm_gpuvm_map_req'
 >>
 >> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
 >> Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
 >> Signed-off-by: Ankan Biswas<spyjetfayed@gmail.com>
 > Hi Ankan,
 >
 > Thanks for the fix! Is there a public report from Stephen that you can
 > link to with a Closes: tag after the Reported-by: tag (see [1])?

Hi Matt

Thanks for pointing that out, I have added the Closes tag for v3.
And resent it.

 >
 > Otherwise, this looks good to me and I'll be happy to R-b and take it
 > via drm-misc-fixes.


On 10/15/25 7:09 PM, Danilo Krummrich wrote:
 > On 10/15/25 1:31 PM, Ankan Biswas wrote:
 >> The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
 >> instead of '@map', leading to this warning during htmldocs build:
 >>
 >> WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not 
described in 'drm_gpuvm_map_req'
 >>
 >> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
 >> Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
 > Please add a Closes: tag, checkpatch.pl should warn about this.
 >
 > Thanks,
 > Danilo

Hi Danilo,

My bad, I did not use checkpatch.pl before sending, I didn't know
it also caught missing tags. Thanks for mentioning it.


Best Regards,
Ankan Biswas
