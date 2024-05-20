Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36B8CA166
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 19:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A2710E641;
	Mon, 20 May 2024 17:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EG3sBb/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869CD10E1E7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716226228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JEiGpueOgc8AoSq/Mo1H+WaHd62XVwbqvhNsyZDlqOM=;
 b=EG3sBb/SMJyvMcXfMXK3Cscco1BGLSd1w5rxoTgtJJOQ4msIOSB4xhye0No29gDIIymN8G
 3ujbdX52AJtSUBuhxUuZj0pqE2qEiqi3yLH4D6k06Y/GCxCren9xCTSoDxz2sHUFs/KtML
 n3F0OmT2eO5q/TdFQqirjpn1BOUm2x0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-BVfqxi40M6KQ8RtAaMLPFw-1; Mon, 20 May 2024 13:30:27 -0400
X-MC-Unique: BVfqxi40M6KQ8RtAaMLPFw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-41ffc807e80so45588095e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716226226; x=1716831026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEiGpueOgc8AoSq/Mo1H+WaHd62XVwbqvhNsyZDlqOM=;
 b=LeoR5lhWYcB/+IiEXSQy+4Yo6RUKnJkIHKsvZrvVrEawaO1DDUOeyGMXs0mo3T9gHn
 mqhW0Q9O/fVI/IqgRcLvJIgMqnLWmcSeNoMr0YoTZPhWD+sGXXS/OTfiW8e6OFUvLcbJ
 xNbXGKx9vh3Z5LnUto4N/ds6wBLJBdcLWKsgX4wLLiJrV71vyz7VmRkrYebWZc7q+e/B
 nTdS+hdMhgkvHECMVu1ShqVMFwKFm8x2n1sRye9xKTky1FQT8iIE/on3qtiWhL6G0Yrl
 WIPZdPHUlSwsjYJDczsurrQFbiwr187/YHo+8BHJl2m4Cv3oelVBiyuHKHMu8MXSRH8o
 tIIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVROCAnMbf050ic0oNLJYEJGr1rxB5qfHSdHp5y0b4/wUDCu+Hf53fWJ7+RVpYsCLx9n4IgbfarZLjsuRaLdi5TST2P6OJEpgykqXEt4F/U
X-Gm-Message-State: AOJu0YxPpUuCQU/oVaLaUgwxfaDjo48inPTlxclxiDy3CGofhJfwih3L
 7Apg5Car+ziUX1zG11EPFxQdtZebWmooFSk0sg1LcZM8oWstW+NEFrbNlIwCd6lKVGDMYXlqJyb
 pyImdTaB3iL481vum2SPzjyXDDQ15u8MvZKxlE7t4RhHQ//7a0RSF/Cmtw/oygv1y3w==
X-Received: by 2002:a05:600c:46d3:b0:41b:6753:30be with SMTP id
 5b1f17b1804b1-41fead6cf75mr264210075e9.38.1716226225956; 
 Mon, 20 May 2024 10:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLMmMEs7oji54nqFuMmTpApMjr4YzjaiuZ5JCC7hPNaB7rGOq5cC8QRnepVmquMDWE6o0wJg==
X-Received: by 2002:a05:600c:46d3:b0:41b:6753:30be with SMTP id
 5b1f17b1804b1-41fead6cf75mr264209785e9.38.1716226225566; 
 Mon, 20 May 2024 10:30:25 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-420e88b71a2sm69373295e9.31.2024.05.20.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:30:25 -0700 (PDT)
Date: Mon, 20 May 2024 19:30:22 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: Device / Driver and PCI Rust abstractions
Message-ID: <ZkuIrveTDOCei2lM@cassiopeiae>
References: <20240520172059.181256-1-dakr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

https://lore.kernel.org/rust-for-linux/20240520172554.182094-1-dakr@redhat.com/

