Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0CE6AF98E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC8610E569;
	Tue,  7 Mar 2023 22:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BE210E569
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678229434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CwqCYxprrLNIAPoFL/afLE+315Wy6YvL00aG4lbDww0=;
 b=Z2eKIOX62dQMiHXh3qd/grnVflzGnrndQ1T3CNRTFB/v3QMr+fJRMhOuadi6dAnVjj5rpl
 lXT1Ud9RCkABHp8JEUEI//2N6sOquq671lz9tqrnJuraVz7msuovoyaE6dnH5/74RPJoTD
 mnBw5NX9y3Wd9UATT79T7blOhO03Dl8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-hGNC3MqAOsGbJqyOplJhWw-1; Tue, 07 Mar 2023 17:50:33 -0500
X-MC-Unique: hGNC3MqAOsGbJqyOplJhWw-1
Received: by mail-qk1-f200.google.com with SMTP id
 m25-20020ae9e019000000b007421ddd945eso8216724qkk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229432;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2LyFwXcQIcYGF8iAkhqDIIxOMMkwRfJpuYXazPS08Y=;
 b=juNBSHCCrH4yLXXXJHVUq8ls7bX7x6dDN+jhYXCQLF4WXQuETPfH8eGQta1hS9LOeT
 PF96LqKL2yEIhP9heCb08oqI9yCUWkiC8cyFVr4AFakTHKmi/u1ueLaUwpLC4/PP3XZh
 7f2g8RIbiC2s+EHXDPTgsjvD8cKHQTjdvzQ0ZOo8YyRLOSRa1CsR58U31qxWc7IuDdV5
 /pAhYxv99jJROt+NB+zZ+5tsOReEZOorGqnlJ84KReXx4TxxO7TrNg+O06T6Rq8XHe4H
 i6tJcBX8g+Ifb3xv7VBhK0gQAmIMhKtVYka2a64zlz4OqsNfIZtKVTqAY9u/PBLxYVPR
 1xjg==
X-Gm-Message-State: AO0yUKVHYakvDjI1t1W6fVk3Qx4Pe8YTKKYn5MCGSfRhK8v9nmlhT8cK
 r68JZyo0/nsF7pa3/uumAlTyDN3s5d76akQrpGpyMqR9qfOLiYfNY2pDV49nts26br/278a5dhu
 4hyJJEVqVyK9O+ycz+oGwL0cxqbb8
X-Received: by 2002:ac8:5f83:0:b0:3bf:d07e:edf6 with SMTP id
 j3-20020ac85f83000000b003bfd07eedf6mr29489387qta.36.1678229432666; 
 Tue, 07 Mar 2023 14:50:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+fAl+u8fQ2G5Wb7L0bClfPehMChq1xc2zVWkDzlMZ5FpEupjFrdvUmM3UqA5658lgeZF5ZsQ==
X-Received: by 2002:ac8:5f83:0:b0:3bf:d07e:edf6 with SMTP id
 j3-20020ac85f83000000b003bfd07eedf6mr29489358qta.36.1678229432411; 
 Tue, 07 Mar 2023 14:50:32 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac867cf000000b003bfc2fc3235sm10349179qtp.67.2023.03.07.14.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 14:50:31 -0800 (PST)
Message-ID: <ba3790cb9f3adcb4f7d3935ce9aa88ecacb3bf7d.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau/clk: avoid usage of list iterator after
 loop
From: Lyude Paul <lyude@redhat.com>
To: Jakob Koschel <jkl820.git@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 07 Mar 2023 17:50:30 -0500
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v1-2-0702ec23f970@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
 <20230301-drm-nouveau-avoid-iter-after-loop-v1-2-0702ec23f970@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
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
Cc: nouveau@lists.freedesktop.org, Pietro Borrello <borrello@diag.uniroma1.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-03-01 at 18:25 +0100, Jakob Koschel wrote:
> +=09=09}
> =C2=A0=09}
> =C2=A0
> +=09BUG_ON(!pstate);
> =C2=A0=09nvkm_debug(subdev, "setting performance state %d\n", pstatei);
> =C2=A0=09clk->pstate =3D pstatei;

We should probably also replace this with

=09if (WARN_ON(!pstate)
=09=09return -EINVAL;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

