Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57AEAEEC2C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 03:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1115910E4D4;
	Tue,  1 Jul 2025 01:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XddNP6+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518D310E252
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 01:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751334426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mx+fbRinTMuynJD3Fbg1OVPYmDGc6Dy2p+EFhYrKJs4=;
 b=XddNP6+sT58fUswNu3mbgpDHgcDkOA5xMnOxmFmxRqSW6a3SmaUuZSKDPPykvFJgj/8HOU
 aaloEffDJDGH6qfKLhT8+b806ppr6+zZi20Um/+4+Zl85Omp/yvzbzTrV7yNXwPHLEid3B
 yBrD0+iFq1tvzrrj3Ai9z65nanp3kTM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-YKgX7TITOFKxjD3bl668BA-1; Mon, 30 Jun 2025 21:47:03 -0400
X-MC-Unique: YKgX7TITOFKxjD3bl668BA-1
X-Mimecast-MFC-AGG-ID: YKgX7TITOFKxjD3bl668BA_1751334422
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311ae2b6647so3271167a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 18:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751334421; x=1751939221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mx+fbRinTMuynJD3Fbg1OVPYmDGc6Dy2p+EFhYrKJs4=;
 b=sDWvNVgZzJv/t1iZqSB4lD6O+8OwmjzQgVgjmf213fTWIZgtHonXRAWRPtC6ow2Fyo
 jY9QYGiRVlFYByaNQRjzngvP4d/PRv72iDo1X+U2rTTLEUgTYFyRjinrBNWYJ8Mmsszy
 VQikHyHoF4fk2i88+avVvw1jRiIZlH7f9HFCcTf+ccw0uIMUmZcmCwbNUR3b5BtVH7Uc
 Kx1kGp3ag36HuZDtPGWj0evY3x+4Bb/C2AZgxJWVQTBUWp3xIHDE3DvLn7S70AY4U1DR
 5bWqo8Sj3AOpdIF0GNBEuQFb2oxnwmnqKU+IytIzJgJsXcyBUiAN0k4iHmsRIajg/Bi6
 F9OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWudQSrxvVH1sOeZkEXovQdTsjE7vD2R958L+EmrApxQaq62SJ6B1FnhPkstNbiUPepzRH8BHBZ0Nc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFmwRQvzXDLM8n7A/b++zd9NMcy38oNji+ILDxAP4IUXunJdUc
 Iz9KPQx4P6X+7bTv5B77S3cDKLEb7txSUC0LLIqRViQ2AescxkXwM81ZEkMa+U3zV6FPkGfF+Ff
 By1svw0J4shcHVaQ7Y0XDyX9PCOaQXRcAT6oVPyyB5gRjH3KGlSe7E0pZeUrjB4B5mAajoUUFuE
 3OF58hoheGmqZaw6YL8ZiaCfnGIodt3KcbxAiYPdNLd1zP
X-Gm-Gg: ASbGncsHfAEVHfsa9ZV4aGRMzPnOYASx522Vw1DpRYCeCxSgfp7sWEFBXnMyAss7HBR
 9rXgf2JX2H1LRI8lwKjeITXDgKxZVWbQXndYn4GbGBSdLosp0cP0NyNv0cGsnrgTClGNLGAqip+
 TMhA==
X-Received: by 2002:a17:90b:3d05:b0:311:e8cc:4256 with SMTP id
 98e67ed59e1d1-318c92a3dbemr17104429a91.22.1751334421432; 
 Mon, 30 Jun 2025 18:47:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlrpj6c4bDiachKhO61td+dxHFiG6TPr6jQRY17LMe42Gje+2uWk9zqkD+CLJtS/E1UDMG4APzV9IOPr6SxG4=
X-Received: by 2002:a17:90b:3d05:b0:311:e8cc:4256 with SMTP id
 98e67ed59e1d1-318c92a3dbemr17104408a91.22.1751334421030; Mon, 30 Jun 2025
 18:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-11-airlied@gmail.com>
 <ef369d08-1913-47f2-818c-e4f6643f6600@amd.com>
In-Reply-To: <ef369d08-1913-47f2-818c-e4f6643f6600@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 1 Jul 2025 11:46:49 +1000
X-Gm-Features: Ac12FXz8Yl3XsxcNjfns2VGpmm_72FeLedIQb5YUSNDP6Bs-0dQvjILAWHhRJ4s
Message-ID: <CAMwc25o5H9YZiNdrE5N8coEvvM1KGtKCX4jW7oTWUXgi2PvTLA@mail.gmail.com>
Subject: Re: [PATCH 10/17] ttm: add a memcg accounting flag to the
 alloc/populate APIs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FtjhRrWAmvB9HuHgXAfOdUSri0vAgNrh0cNGUt6gS5U_1751334422
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jun 30, 2025 at 8:20=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 30.06.25 06:49, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This flag does nothing yet, but this just changes the APIs to accept
> > it in the future across all users.
> >
> > This flag will eventually be filled out with when to account a tt
> > populate to a memcg.
>
> I would keep the pool completely out of memcg accounting and always accou=
nt at a higher level.
>
> Accounting that low just gives a hughe surfurce for driver issues.

https://lore.kernel.org/dri-devel/20250512061913.3522902-6-airlied@gmail.co=
m/

This is where I already tried it, and had to move it back:

"This version moves back from the resource to the tt layer,
when accounting at the resource layer, if an object is swapped
out there was no way to remove it from the accounting, whereas
the tt layer has more info for this."

Dave.

