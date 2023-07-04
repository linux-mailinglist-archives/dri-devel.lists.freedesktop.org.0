Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6747467B7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 04:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B3610E267;
	Tue,  4 Jul 2023 02:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3220810E267
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 02:53:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-_iF5EIEuPq-CXRbxskslHQ-1; Mon, 03 Jul 2023 22:53:28 -0400
X-MC-Unique: _iF5EIEuPq-CXRbxskslHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACCB2809F8F;
 Tue,  4 Jul 2023 02:53:27 +0000 (UTC)
Received: from nomad.redhat.com (vpn2-54-59.bne.redhat.com [10.64.54.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B120840C6CD0;
 Tue,  4 Jul 2023 02:53:26 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-modules@vger.kernel.org
Subject: modules: firmware groups attempt two
Date: Tue,  4 Jul 2023 12:50:48 +1000
Message-ID: <20230704025322.2623556-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

This is a second attempt at firmware grouping so we can have dracut
only pull one firmware into the initramfs instead of a bunch of legacy ones=
.

v1 got derailed when it was pointed out that ordering isn't consistent in
modinfo with C to sections, so that plan no longer was feasible.

This was the simplest next best option, it keeps the group tags, and
adds a new list of acceptable firmwares. New dracut will ignore legacy
firmware in favour of the list, old dracut will just read the legacy info
lines.

This is ugly because it requires duplication, but I can't think of a nice
way beyond horrible unscaleable C preprocessor tricks to make it nicer.

Dave.


