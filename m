Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0697079A0C4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 02:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1AF10E099;
	Mon, 11 Sep 2023 00:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FE510E099
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 00:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694391961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tPpLdpG4maiTSM6PN9I1fTjgodUcBS/7pIjObaruFGQ=;
 b=Okda18gnzmi4wwHnS0vEbXJHpLQVOG3bAfAVSmiizDQnRMdxYqsoVh6sXXUQfwIBfbaV5J
 73zcK1ZBcy0yu7u2mocRgRxB6uC0HIDZlXOyGi0WIdGO+HXt0LaIeSNnJjEthV8gznfEUS
 yboyKNCekGJ5IDYsdKghkrIqKpBODcU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-X6kJb_mwOrivKjodFQX0cg-1; Sun, 10 Sep 2023 20:25:55 -0400
X-MC-Unique: X6kJb_mwOrivKjodFQX0cg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DCC929A9CAB;
 Mon, 11 Sep 2023 00:25:54 +0000 (UTC)
Received: from localhost (unknown [10.72.112.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5301521D4F3D;
 Mon, 11 Sep 2023 00:25:53 +0000 (UTC)
Date: Mon, 11 Sep 2023 08:25:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v2 2/5] kernel: kexec: copy user-array safely
Message-ID: <ZP5ejovfsyEjTeg9@MiWiFi-R3L-srv>
References: <cover.1694202430.git.pstanner@redhat.com>
 <31313a8a1dd1baf9dd3c21fbe8dd46b9e111f20c.1694202430.git.pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31313a8a1dd1baf9dd3c21fbe8dd46b9e111f20c.1694202430.git.pstanner@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/08/23 at 09:59pm, Philipp Stanner wrote:
> Currently, there is no overflow-check with memdup_user().
> 
> Use the new function memdup_array_user() instead of memdup_user() for
> duplicating the user-space array safely.
> 
> Suggested-by: David Airlie <airlied@redhat.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  kernel/kexec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/kexec.c b/kernel/kexec.c
> index 107f355eac10..8f35a5a42af8 100644
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -247,7 +247,7 @@ SYSCALL_DEFINE4(kexec_load, unsigned long, entry, unsigned long, nr_segments,
>  		((flags & KEXEC_ARCH_MASK) != KEXEC_ARCH_DEFAULT))
>  		return -EINVAL;
>  
> -	ksegments = memdup_user(segments, nr_segments * sizeof(ksegments[0]));
> +	ksegments = memdup_array_user(segments, nr_segments, sizeof(ksegments[0]));

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

>  	if (IS_ERR(ksegments))
>  		return PTR_ERR(ksegments);
>  
> -- 
> 2.41.0
> 
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
> 

