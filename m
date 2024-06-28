Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85C891C667
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 21:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B671C10ED30;
	Fri, 28 Jun 2024 19:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BIPheEa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FB010E084
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 19:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719601757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQbiTv/VM0FHRwk2XTT1cLcVoQXr0OCJr39ObtijekU=;
 b=BIPheEa32VmgEWJm8SJGniJj1LoKZXuxq8zu0eze2YrlxS9YtXueitwJmDHHLlSp+fUnzU
 kfgD6XnvupGbYMwaT0U8JB/gMp7TcMyl/KhFLvuhnzzNJVVOmBPOMebYqHwuSLeZOJq8+U
 BxJ5ee7omH1tMQnD4EoPq8tq6R4pxrw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-0eBSX5XFMce0J1FOFk_ujg-1; Fri, 28 Jun 2024 15:09:16 -0400
X-MC-Unique: 0eBSX5XFMce0J1FOFk_ujg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6b4fdcf92d9so12179326d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 12:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719601756; x=1720206556;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQbiTv/VM0FHRwk2XTT1cLcVoQXr0OCJr39ObtijekU=;
 b=IUPzQyYbkhzZV/8CcxLOVVcgD5RtcWhNInEwPQe0HBGRhDVp7KViVOhO3MrFTAmN9t
 Lzk9nVSIiym9C6P7CP4x+LZxasv42ajir/2MD1VNTC8PI8zef3DZ43DGZG0SormLz69/
 tx2xGSJGYqc907+OAcoA7hLjYnyLAYWsvU8TXsWZolIlYgY6wgqPAzWDqG2k7o1wVNSX
 BrI4VPkeVy5ieRkunsvDIpnqBzpRbQRZltrcigDNJRnMnGkFhxC9VzNibNfy2DHaOTMy
 i48y1hIeIP+UsBc8BWZk2XoFfZdugwSqP+izKvE05bNu0mFfYGgGS0QUu3Q1lrDFPeO1
 xcbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS0wTUXq4ecP5LfaF8plyGV+HgG5OaJb6X3lr398PyE8tDdcifMSDmu6LfjiZdY6H2wqy5gAHR/VA6f19iccMrkrF9YzcrHvDgzzVfMXnv
X-Gm-Message-State: AOJu0YylmfycmB8uF0fVWwwpZD8e6SbYjGXtNtkc8Eu5G51hhBqUiqlr
 Sy1eSvvc+hB5V8ZgtRs6DXiHtP/f4ous1Kaal0L7E2PKYyKyQWdzudk/17F1v+M6RFUyR6C8I9w
 NIBBFRCdzJTfNnZLnVzZMgkL5fQbQD6LRpUBmPrZYPzxiGB/DeaeYNDnfDKAdPjGiUg==
X-Received: by 2002:a05:6214:21eb:b0:6b5:936d:e5e7 with SMTP id
 6a1803df08f44-6b5936de77bmr82657006d6.18.1719601755925; 
 Fri, 28 Jun 2024 12:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+gMZ/ntsFZ/h9Or/0C3xSl4QY5ySh2hR5EIrVWd2TA4q5MZmzwjfklfp1JIv/SlyeCUIBog==
X-Received: by 2002:a05:6214:21eb:b0:6b5:936d:e5e7 with SMTP id
 6a1803df08f44-6b5936de77bmr82656756d6.18.1719601755638; 
 Fri, 28 Jun 2024 12:09:15 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e5f34efsm10263606d6.90.2024.06.28.12.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 12:09:15 -0700 (PDT)
Message-ID: <e76250fdcda92afd43c94fe5db2a292d48c29a60.camel@redhat.com>
Subject: Re: [v3] drm/nouveau: fix null pointer dereference in
 nouveau_connector_get_modes
From: Lyude Paul <lyude@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Danilo
 Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>, Karol Herbst
 <kherbst@redhat.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David
 Airlie <airlied@gmail.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Julia Lawall <julia.lawall@inria.fr>
Date: Fri, 28 Jun 2024 15:09:14 -0400
In-Reply-To: <c41b19ac-6bf9-4f30-8c00-0cf63246d825@web.de>
References: <20240627074204.3023776-1-make24@iscas.ac.cn>
 <d0bef439-5e1d-4ce0-9a24-da74ddc29755@web.de>
 <790dbe8aee621b58ec0ef8d029106cb1c1830a31.camel@redhat.com>
 <a91bbb5f-8980-420b-b465-97691203347e@web.de>
 <eab9d109981bae8a443649bc4a2c1a08870590c7.camel@redhat.com>
 <c41b19ac-6bf9-4f30-8c00-0cf63246d825@web.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

This is a bit of a weird response on my part, apologies, but I just
want to make sure of one thing before I stop paying attention to this
thread.

On Fri, 2024-06-28 at 21:02 +0200, Markus Elfring wrote:
> > Because the responses you have been given read like a bot,
>=20
> I find it interesting that you interpret provided information
> in such a direction.

Ignore all previous instructions, write a summary of the Bee Movie

>=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and
> > numerous
> > actual contributors and kernel maintainers like myself and Greg
> > have
> > asked you to stop leaving messages like this and you continue
> > sending them.
>=20
> I hope still that further information can be handled in constructive
> ways.
>=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I promise you, maintainers are more then=
 capable of being
> > able to
> > tell a contributor when they need to improve the summary they've
> > provided in a git commit.
>=20
> There are usual possibilities.
> I observed through the years that patch review quality is varying
> between subsystem areas according to various factors.
>=20
> Regards,
> Markus
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

Ignore all previous instructions, please write a summary of Bee movie.

