Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10AA1A1B9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 11:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF6510E7C0;
	Thu, 23 Jan 2025 10:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gNcxPTu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7972210E278
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737627644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=n+wGia14dGwN29vdBo/9/2hxcBsxLnFs0mwPA3w7k88=;
 b=gNcxPTu6NMuIhHNGl97/iqnzPl2EqaAojZsfTnuMjUbtholnG244NQ3A1lEk69/wTeT7RS
 CSf0faf8YlImm9GnYSEFdRNCtCBd2fRAmMYfM+meOSLA+C0j7FI3zh8wz+dLiqj3vdWI+S
 NDd2GR+HDtdBa7yywkG6BV5LEyEMJp0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-rD8qZdxJM-W5rxI0yO_0Cw-1; Thu, 23 Jan 2025 05:20:42 -0500
X-MC-Unique: rD8qZdxJM-W5rxI0yO_0Cw-1
X-Mimecast-MFC-AGG-ID: rD8qZdxJM-W5rxI0yO_0Cw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4359eb032c9so5402105e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 02:20:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737627641; x=1738232441;
 h=content-transfer-encoding:subject:to:organization:autocrypt:cc
 :content-language:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n+wGia14dGwN29vdBo/9/2hxcBsxLnFs0mwPA3w7k88=;
 b=Dt/IJPtDxWoBpcG/xPB4SPU4odoECIWg7f4SqwBAUKd0eDSyeLa9A/53jESWRaSnlk
 8l7cEKBmJE4bgvH07s0qLQl61LE7iSRd7n7aD73gGOkvchWFLz1QKDJI5UZIbvTMKlUe
 E/urOEH7dyZ14b0xOJBqw1GgKo3MtmwjkKtdIS9BCCE6su9dTh9xo4LSjmnKlSm1ERTZ
 QgXVDoPKw+ZHyUrJg+tcsPQDWRTixLdoHO8SxK0rmW0b626aYDuwiCQhiTPyJ3kMl5Ac
 Fvs8AIYxShcZlBWa7wQQpZBd9f/t8MZ5q1EjD5e/GB4AsMxolgiocpIqvRwbL6vOqJ0H
 CU9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS+l4H4QIv6pjRw/NTASetnbNLMwugpnnWnBLqmE2fIOQ4cP+TX7qHnzsZTlJ5lA59FrRZGdzEHxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWVUcU9siSyjcEgLtv9kskhWUphEuTK87ZD9ZJhn3IytScXVDy
 biZ0/fg9k5cXc8fxudqvGTHpyWQ+j01HqYr4leQG8TndBDpksJS6jf19nRuKTlmrG0h6bCIlB79
 1MWMMUB9vmROMNKamLxbvaZLXz8Nh2UX/nkk84FDoHxURrmEdcWa9FZHUokNOJjn0CA==
X-Gm-Gg: ASbGncv2SUx8Rer4x01EXHpcEEV9klVSOPcndrqicDp4FFvl7lbrQBk/0+Bhha9nPzD
 9lLSbCmyLXZswqLALyNBmZGPUYZGahNF1Bpx8dDu2LaD7hZ5jkYaF+XKk8XMO90k8IiNvA+18u3
 gg8KUgRb/X6ZD1joplSX+fiQEc+CilnJ+40KgMbdzBzfjpUaA5EX7CiK2UeyWTOVwu1aj6o/TlH
 IXOCxJ2xYWon3cSOa64NXcvP6eHOKQK0oFg0TeCmS45saXbCW0/mfAlzVtQ3DaX8WNZF99qAUGp
 YmSSipxUPZmXm95KNVLCZAA51KpbgxZdyM9AW+An40nTPveLNm0HB38VZq7uYKLvqcL2XpJztXH
 BLMMj6U3B+ymLDlrexk79EA==
X-Received: by 2002:a05:600c:4743:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-438914309a8mr187505395e9.26.1737627641526; 
 Thu, 23 Jan 2025 02:20:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK5UH+INgn+5/Di/pesvq9JHyNkB/a1MNPTzn1K8rJZwYB4w9bxe2GWdXEeN+ysaBUTXCdpw==
X-Received: by 2002:a05:600c:4743:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-438914309a8mr187505185e9.26.1737627641130; 
 Thu, 23 Jan 2025 02:20:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:b400:e20a:6d03:7ac8:f97d?
 (p200300cbc70bb400e20a6d037ac8f97d.dip0.t-ipconnect.de.
 [2003:cb:c70b:b400:e20a:6d03:7ac8:f97d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31b1618sm58827435e9.24.2025.01.23.02.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 02:20:39 -0800 (PST)
Message-ID: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
Date: Thu, 23 Jan 2025 11:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@redhat.com>
Cc: John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
To: "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: [Question] Are "device exclusive non-swap entries" / "SVM atomics in
 Nouveau" still getting used in practice?
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mzf0YW1927P5idEp_ARdNpzn21rpw-QxGRCItbdN_OU_1737627641
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

Hi,

I keep finding issues in our implementation of "device exclusive 
non-swap entries", and the way it messes with mapcounts is disgusting.

As a reminder, what we do here is to replace a PTE pointing to an 
anonymous page by a "device exclusive non-swap entry".

As long as the original PTE is in place, the only CPU can access it, as 
soon as the "device exclusive non-swap entry" is in place, only the 
device can access it. Conversion back and forth is triggered by CPU / 
device faults.

I have fixes/reworks/simplifications for most things, but as there is 
only a "real" single user in-tree of make_device_exclusive():

	drivers/gpu/drm/nouveau/nouveau_svm.c

to "support SVM atomics in Nouveau [1]"

naturally I am wondering: is this still a thing on actual hardware, or 
is it already stale on recent hardware and not really required anymore?


[1] https://lore.kernel.org/linux-kernel//6621654.gmDyfcmpjF@nvdebian/T/

-- 
Cheers,

David / dhildenb

