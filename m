Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64297A793A0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BE910E865;
	Wed,  2 Apr 2025 17:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bvm68viR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737E210E7F5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 17:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743613852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XiTG0FByjC9Rs16rt52doAGprRUtZJNgSviOZz6x1o8=;
 b=bvm68viRUU1Hbn8LrzbBtkC051+f6GTM1WkFggKo0ScC+U+9QYuRUzRHNLA0a4Ql+5E7hp
 AEaVEX/ruMRBiN6AxNK37SoWDZn+mNZ1ap1XMw9N47wotFyzabmA9Uc3rtc33a39lZpPOE
 lMTUupLzN0fj9Er8NG64PICx3nFwwUQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-264-2p6AgTrvMp695wiKCVs6Iw-1; Wed,
 02 Apr 2025 13:10:48 -0400
X-MC-Unique: 2p6AgTrvMp695wiKCVs6Iw-1
X-Mimecast-MFC-AGG-ID: 2p6AgTrvMp695wiKCVs6Iw_1743613843
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 47E8E180AF52; Wed,  2 Apr 2025 17:10:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EB43D195DF85; Wed,  2 Apr 2025 17:10:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250402150005.2309458-2-willy@infradead.org>
References: <20250402150005.2309458-2-willy@infradead.org>
 <20250402150005.2309458-1-willy@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 v9fs@lists.linux.dev
Subject: Re: [PATCH v2 1/9] 9p: Add a migrate_folio method
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <803464.1743613839.1@warthog.procyon.org.uk>
Date: Wed, 02 Apr 2025 18:10:39 +0100
Message-ID: <803465.1743613839@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Matthew Wilcox (Oracle) <willy@infradead.org> wrote:

> The migration code used to be able to migrate dirty 9p folios by writing
> them back using writepage.  When the writepage method was removed,
> we neglected to add a migrate_folio method, which means that dirty 9p
> folios have been unmovable ever since.  This reduced our success at
> defragmenting memory on machines which use 9p heavily.
> 
> Fixes: 80105ed2fd27 (9p: Use netfslib read/write_iter)
> Cc: stable@vger.kernel.org
> Cc: David Howells <dhowells@redhat.com>
> Cc: v9fs@lists.linux.dev
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: David Howells <dhowells@redhat.com>

