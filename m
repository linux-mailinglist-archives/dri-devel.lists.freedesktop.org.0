Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B8BAFB3F3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDDA10E463;
	Mon,  7 Jul 2025 13:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DnULwCO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F098710E463
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751893847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XEurCXj6cd5Czu7Fsl+l7GrfZnKLx/Ef+aDXjk7dI/Y=;
 b=DnULwCO6he/Uh80N4noxlGcrHTL8qv5YT9uO+oLIj3IfW4PUI/4GcW2ULUzkCWGfHTQsf0
 QQ06xmkPF9N9/t4lxGVDtag++kO+RNRzskwlRWIiC1K3Gr4rOBvI/YQIN8+IGYP0p0e3SL
 FKElSdJtMXesHHYtUXEz1s15m5+184Q=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-HW8VL9_-MRqqMDUs51bBTQ-1; Mon, 07 Jul 2025 09:10:46 -0400
X-MC-Unique: HW8VL9_-MRqqMDUs51bBTQ-1
X-Mimecast-MFC-AGG-ID: HW8VL9_-MRqqMDUs51bBTQ_1751893845
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a7bba869dbso76802081cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 06:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751893845; x=1752498645;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XEurCXj6cd5Czu7Fsl+l7GrfZnKLx/Ef+aDXjk7dI/Y=;
 b=wSG7dESdWKxG2Clsbu0yP1XELuNaI3f+zCRoze6kkwF7ifuNGyZSQDofygiQD7DsnJ
 pZUAvhGjZ6J4sO7T5iTzkDmJWZ2i9N8l+HQyU7hcAfsXzORYvSHDVY8R0vtVlhs1ByT/
 lZCwHPNidm6cF+4jQQIFgxWkSBKsV4JWfvub0zhNYTx6vBeU9p8muRMQNMSL7tpYrL3E
 nezvK5j3zo0LJuYLS0efpHdXdoQN6bQj8tfA+eEPgyFMVH5A+fk9ZLTIflm9dHMXHrvI
 QAO9+aKXu6iViNia8g50JOkd35bPr0tFzg1lUxzMznNRCGAIAzapd3vlqBWrFJrFbdYU
 7uFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb6QVCifGOh4/4nsUJnhxA51oZJSEgyDrGNsNnbPmL7LpbCfkrOD52v4OiRzc0xuXGMALlyOnAlB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvM+3nQMBUSlWd9XFkLBHwJ9WaiIEAEqt0dDmqUtIh3HmYGti+
 5Ms1kbwjjIp1+VZaQ2Fko6hz6nVaM+YZZy7I5EyArlwMi7TvHvrpDsYN453H8dEXWmal0ftZhxr
 OdZ0ai5R0zgK2xnBRhET6VWdIuTaAZV09YTiZs0dX0j0Kg8t+kaeSP/SLOF4F/9jkAAqjFA==
X-Gm-Gg: ASbGncsKXakCkziQF13i4bt6mvQkQkQxgjGJD32cshJRjRU4MWCJLzcnEn7x9tOUYVF
 lYqdbsavywvfcqqJI42OtzlAOKQD2V3aN8TLee2UvLh57jBnChUxiksi+5vwIWWor0ZXNGh9c00
 q84yJeGoscpEossg+8ciVI/benj3JY3R1QVx25sx8yueSDG+MqpXNE30Uyx3RrC+uWkLFkBINbJ
 IzFYsHfgBLapZamZfpzlMrOp09NqYXChzeZzKFC5gtGBJS6/VflXLmRukpNCMFm7usXwaRjr+fh
 /jCMoDrg4ClH+vogRQOH7Sd6tUD7ibanz2zlWrPG020HQTaCDFiryg==
X-Received: by 2002:a05:6214:2269:b0:6fb:597f:b4d0 with SMTP id
 6a1803df08f44-702c6d0e528mr171252516d6.6.1751893845164; 
 Mon, 07 Jul 2025 06:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHES3tBHX5kljzjo+zsdbXDUJb6DU8frN39bUwjA5eUGrwKv9iaI5DG5u57DeA1U5hMj2i4tA==
X-Received: by 2002:a05:6214:2269:b0:6fb:597f:b4d0 with SMTP id
 6a1803df08f44-702c6d0e528mr171251906d6.6.1751893844672; 
 Mon, 07 Jul 2025 06:10:44 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-702c4cc771esm57828126d6.6.2025.07.07.06.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 06:10:44 -0700 (PDT)
Date: Mon, 7 Jul 2025 06:10:41 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] dma-buf: heaps: Use constant name for CMA heap
Message-ID: <aGvHUTC7Kbe9lru3@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20250610131231.1724627-1-jkangas@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ee-TcCD1YM8bXv7tL2J5BpHa-eoVSC92O5AB7G3nvuo_1751893845
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

On Tue, Jun 10, 2025 at 06:12:28AM -0700, Jared Kangas wrote:
> Hi all,
> 
> This patch series is based on a previous discussion around CMA heap
> naming. [1] The heap's name depends on the device name, which is
> generally "reserved", "linux,cma", or "default-pool", but could be any
> arbitrary name given to the default CMA area in the devicetree. For a
> consistent userspace interface, the series introduces a constant name
> for the CMA heap, and for backwards compatibility, an additional Kconfig
> that controls the creation of a legacy-named heap with the same CMA
> backing.
> 
> The ideas to handle backwards compatibility in [1] are to either use a
> symlink or add a heap node with a duplicate minor. However, I assume
> that we don't want to create symlinks in /dev from module initcalls, and
> attempting to duplicate minors would cause device_create() to fail.
> Because of these drawbacks, after brainstorming with Maxime Ripard, I
> went with creating a new node in devtmpfs with its own minor. This
> admittedly makes it a little unclear that the old and new nodes are
> backed by the same heap when both are present. The only approach that I
> think would provide total clarity on this in userspace is symlinking,
> which seemed like a fairly involved solution for devtmpfs, but if I'm
> wrong on this, please let me know.
> 
> Changelog:
> 
> v4:
>   - Fix ERR_PTR() usage for negative return value.
> 
> v3:
>   - Extract documentation markup fix to separate patch.
>   - Adjust DEFAULT_CMA_NAME per discussion in [2].
>   - Warn if the legacy heap name and the default heap name are the same.
>   - Fix DMABUF_HEAPS_CMA_LEGACY prompt.
>   - Touch up commit log wording.
> 
> v2:
>   - Use tabs instead of spaces for large vertical alignment.
> 
> [1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com/
> [2]: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com/
> 
> Jared Kangas (3):
>   Documentation: dma-buf: heaps: Fix code markup
>   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
>   dma-buf: heaps: Give default CMA heap a fixed name
> 
>  Documentation/userspace-api/dma-buf-heaps.rst | 11 +++---
>  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++
>  drivers/dma-buf/heaps/cma_heap.c              | 36 +++++++++++++++----
>  3 files changed, 46 insertions(+), 11 deletions(-)
> 
> -- 
> 2.49.0
> 

Hi Sumit,

Just wanted to check in on this since discussion has died down this
iteration: what's the status on this series? If there's anything I can
do to help, I'm happy to lend a hand.

Thanks,
Jared

