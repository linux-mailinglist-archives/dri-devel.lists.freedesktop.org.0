Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E419A73588
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F192A10E903;
	Thu, 27 Mar 2025 15:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jRsdWSVC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB52210E903
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743088971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KyIB6mZ7OHIQ8TN1E0AWKE682onUFLQ3XEbxIz51DMc=;
 b=jRsdWSVC23g5bQrt0tKmfhCUb0QRNw0WmpS+FAU8oKIfevK2vj7HPCQuC5ZG2FvkJF7hHE
 ej3OhulNPte0xuAeisk/uWYJQsw4jHP+Lx5UWsDwChSgc2XofvXhzo52axivnChyjOhRhd
 pW1bHEjQ0b4KMEBwckwbAJsw0qcgeN8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-aEpYyg4yMOu2eOCkIlbW0A-1; Thu, 27 Mar 2025 11:22:48 -0400
X-MC-Unique: aEpYyg4yMOu2eOCkIlbW0A-1
X-Mimecast-MFC-AGG-ID: aEpYyg4yMOu2eOCkIlbW0A_1743088967
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3978ef9a284so485554f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743088967; x=1743693767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KyIB6mZ7OHIQ8TN1E0AWKE682onUFLQ3XEbxIz51DMc=;
 b=kOzs2Nt2O4m0mwi3PC+bDAQt5fbCMnEjZK3FLq5MkWmWCx80ZypYIGMZ5/wen1x+X2
 HWi9gqBbFbfsvPHE7Hs863bfxL5RTpmPl828xrk1jNwz7EvsfPqXdaNGEHVFAfLmNPe5
 pAtXZItUDtNRgSg51ZHH1Ip3p29S6gZl8UR0FFv+JOP9jr7wDypYuG0hZCqatDJ0IRW2
 yFGxhGhlLf5A0pabw4eKBbHXoOqxXCbnI2WHlx9m1QjmJ3foeatnvdQ2bhntfqNQ9yUF
 pQUNNpPcOpOAsJe06+tBwhf8Yt9ndPzYR7O38KPbkoxQHQI9tW/7NJBKZ3KaXjr14O0O
 6SUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMjzEz47S8pmr1rvWRj68/LpMpTKfhUoa30GGN1aBKrY9L4v3LYkqO/7TVsZXBaLm8RdGC9EBSOYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxK2FM8p/EjswTWC1C3f4g6qSYqGt43q2QzBykyiDmZhDksugrw
 lTUUEtrFSKVbxf1giR18GExaW8BOdRLbF5kK4vUVvdrla42WVLW4Vdmkgb7wGBgat7FG9+qft7E
 4K+/g2OIx1kHS2rHfDq6cIXwqpGQtgDJzGZetIVBJnTjI94nfx4cJ+ZZQhou5Yy06Ag==
X-Gm-Gg: ASbGncs/9JYilj2OfvWu1jvUeV1fh9WzD5PDRMb6xal+tUQmEtM+OcRmoJ0dUNc1oEx
 9eeMEDgKINW3RuTkFGhTNBFTHtezXqDdKVMihwbgGZ8V0RfZUVsoXMB0x1A7civgdLhoOPRsW5o
 9Z8IjBoaGY/jjgKDWDOXm/M97WzdGRgQdBmCsXlYQtQzdIj6bNdyAeAnFcboRqQ8DWgfON95qPh
 ESJeZ5ErLmUgVkVgfBQZNWtGWQyV1/mGxCRLyqO77bh7l4cPuarHYuGJieOiDTxV0oXEOVBFL6Q
 aLieUxj2rCt8dOBCPS9+z4QefRsDVoT4N72/M0MG2ttxIpUFFK8jy3s=
X-Received: by 2002:a05:6000:1f88:b0:38f:6697:af93 with SMTP id
 ffacd0b85a97d-39ad1740e6amr3598500f8f.9.1743088967250; 
 Thu, 27 Mar 2025 08:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9Nh306S6nC8D3y6/2MymAxytzfH2EE+T7OhkoPuApxgDdG2zQZrGWFxbxp5lSU2j1CNBGxg==
X-Received: by 2002:a05:6000:1f88:b0:38f:6697:af93 with SMTP id
 ffacd0b85a97d-39ad1740e6amr3598456f8f.9.1743088966782; 
 Thu, 27 Mar 2025 08:22:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dede98sm41019095e9.6.2025.03.27.08.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 08:22:46 -0700 (PDT)
Message-ID: <a495133b-7fae-4b88-8254-78d65677990f@redhat.com>
Date: Thu, 27 Mar 2025 16:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/panic: add missing Markdown code span
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250324210359.1199574-1-ojeda@kernel.org>
 <20250324210359.1199574-3-ojeda@kernel.org>
 <dd1616d5-4808-46be-9167-6fbfe76e0c73@redhat.com>
 <CANiq72kz9SW8Rexj7feZRvTAhgF+cBwarpFnqu0TSk6C2r9SRQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kz9SW8Rexj7feZRvTAhgF+cBwarpFnqu0TSk6C2r9SRQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ehPXs5FsmyzhcDbY80aS-fOhOUl4CFK2pGXTqhbiMxY_1743088967
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

On 25/03/2025 20:04, Miguel Ojeda wrote:
> On Tue, Mar 25, 2025 at 10:05 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> Thanks, it looks good to me.
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> You want to take the whole series in the rust tree?
>>
>> Otherwise I can push the patch 1-2 to drm-misc-next if needed.
> 
> Please take them if possible, since others may want to take them
> through their tree anyway, plus it should have less conflicts if you
> change other bits, plus these are independent fixes anyway that can go
> in on their own whether or not the lint gets eventually enabled.

I just pushed 1-2 to drm-misc-next

Thanks,

-- 

Jocelyn
> 
> Thanks!
> 
> Cheers,
> Miguel
> 

