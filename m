Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0000E9FDEDF
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 13:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D8610E0E4;
	Sun, 29 Dec 2024 12:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iPQsAXwQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E55D10E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 12:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735477106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l14OkEJSbB2lQ6HRsz+CfVgzE+8xh7m2DNAoRxRsLF8=;
 b=iPQsAXwQMAy22uPMC088yKkLS+7QS1eU2copsImbYVI21suDlvU9HhSB9bjEGavxIQ+8S7
 KddLDFQ6BrG4/c1C5Mtuf/Eyayw1O5sC1XHPJ9EIky83UAAXRIPZyd8g505JeIl5ecUWFy
 6Ej7Io+xxWSNqBq6xjoVALuk0RMuJmk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60--3-h6pNwMhSppQkyhH50TQ-1; Sun, 29 Dec 2024 07:58:23 -0500
X-MC-Unique: -3-h6pNwMhSppQkyhH50TQ-1
X-Mimecast-MFC-AGG-ID: -3-h6pNwMhSppQkyhH50TQ
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa683e90dd3so701750966b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 04:58:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735477102; x=1736081902;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l14OkEJSbB2lQ6HRsz+CfVgzE+8xh7m2DNAoRxRsLF8=;
 b=U8H5ktEx0w7YD9ccm8OqMtT0GNAnPp5Ht7j4QZCBZ3Y31DNPm/Q372W1AS0/VUi+mi
 BnhZ0oIlyNHwirZ3yiphNUWlNVo7sRAmwdXA9JdwKh1nNv00qROqHzzy08Hbsi9kY7Rd
 PayAsHWrbZwZvDnTkDFZttzkcAHBLwR+sJHHh3XFYBNb5jdxZ1e0EKai8+76ZOQax9tJ
 qzqotHnnvKkUqyhYh294tdf+oQ8F+zg/H9jmzVPxx+895yYhYzbyV3PzQL6Lj/7FiMMs
 yPGaVccxLG722dIWX2UoPMIl4p57LmDKLedC2leHGEAKu6RIh4Je1Z6QBVtKOpvrtWGe
 +VzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXDuJmV7YwVK4Lgv63c9ssrzp1jXnGo3NLv8gmCQ1N3XsldEWGcFqhIKRhplGoE8apKorq6ZP4t7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIg3e8UCAiOPupuS3yxa+cR99+JnSs3W+f8Uw3lemtywcnoXTr
 deU+L3v4ZyMBtAl4ZQ5qjK6YW6IviohZtv4Zf3n/fkjIED+QuWM9gdLJh3NIqeGsghPVhoWXl8I
 9g42ko8/Mf16PKj7Gwyyd71pW79qt8i3BVzyU9bGFb4nIg8CZAqutmv6wxl7ww0eZ
X-Gm-Gg: ASbGncve2JWJEZNry7ZzWp9ODoZRYfSQrC37PydY9hOLAZNDHjqWDKSbUt0Ud5/wo7x
 2xooPHbK+WSBaFia0yu8PqaMXHXW7Ttx/CYZf3zlOYMULbIsOUfaDgx48hTtSiGD3GbYGp5e+CR
 a/EXCxc/Ij8MgwOtAa0DDSft7z0SOJ7yNQY0MYIxhAHsh8yboGiABzD++ipGJhUS8nZcMXBjSSg
 qFOQVqM9W9bArdAr2HcVaPN0b4dUDs1j/bK+2nqNY4Kv5kCg/kLmxZeyXveRLL9ak45O4D2aZCz
X-Received: by 2002:a17:907:2d8b:b0:aa6:6e41:ea53 with SMTP id
 a640c23a62f3a-aac271316a3mr3275092166b.7.1735477101883; 
 Sun, 29 Dec 2024 04:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5WcMKb9KoHZScLGl440Om+DdLYKGQDDOkHuv9hHp+lBTr72kpE0uwz6aQinwzNqD+D8dqMg==
X-Received: by 2002:a17:907:2d8b:b0:aa6:6e41:ea53 with SMTP id
 a640c23a62f3a-aac271316a3mr3275089966b.7.1735477101454; 
 Sun, 29 Dec 2024 04:58:21 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe415dsm1365204966b.123.2024.12.29.04.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2024 04:58:20 -0800 (PST)
Date: Sun, 29 Dec 2024 13:58:19 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Mirsad Todorovac <mtodorovac69@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Carlos Maiolino <cem@kernel.org>, Chandan Babu R <chandanbabu@kernel.org>, 
 Dave Chinner <dchinner@redhat.com>, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v1 2/3] xfs/libxfs: replace kmalloc() and memcpy() with
 kmemdup()
Message-ID: <cdnpycsyf37gbcp6yxx36pxgilothhdpajmtwle5pphjxshn6o@j5enpjtww3xx>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
 <20241217225811.2437150-4-mtodorovac69@gmail.com>
 <20241219003521.GD6174@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20241219003521.GD6174@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BxJGhv1-xM2EhPQTDd_3VA3LNxEcDLY8vN2hr1HVqbM_1735477102
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On 2024-12-18 16:35:21, Darrick J. Wong wrote:
> On Tue, Dec 17, 2024 at 11:58:12PM +0100, Mirsad Todorovac wrote:
> > The source static analysis tool gave the following advice:
> > 
> > ./fs/xfs/libxfs/xfs_dir2.c:382:15-22: WARNING opportunity for kmemdup
> > 
> >  → 382         args->value = kmalloc(len,
> >    383                          GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_RETRY_MAYFAIL);
> >    384         if (!args->value)
> >    385                 return -ENOMEM;
> >    386
> >  → 387         memcpy(args->value, name, len);
> >    388         args->valuelen = len;
> >    389         return -EEXIST;
> > 
> > Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics.
> > Original code works without fault, so this is not a bug fix but proposed improvement.
> 
> I guess this is all right, but seeing as this code is shared with
> userspace ("libxfs"), making this change will just add to the wrappers
> that we have to have:
> 
> void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp)
> {
> 	void *p;
> 
> 	p = kmalloc_node_track_caller_noprof(len, gfp, NUMA_NO_NODE, _RET_IP_);
> 	if (p)
> 		memcpy(p, src, len);
> 	return p;
> }
> 
> Is this sufficiently better?  That's a question for the kernel
> maintainer (cem) and the userspace maintainer (andrey, now cc'd).
> 
> --D

There's still possibility to set wrong length in args->valuelen,
which I suppose what this change tries to prevent.

But otherwise wrapper looks good to me

> 
> > Link: https://lwn.net/Articles/198928/
> > Fixes: 94a69db2367ef ("xfs: use __GFP_NOLOCKDEP instead of GFP_NOFS")
> > Fixes: 384f3ced07efd ("[XFS] Return case-insensitive match for dentry cache")
> > Fixes: 2451337dd0439 ("xfs: global error sign conversion")
> > Cc: Carlos Maiolino <cem@kernel.org>
> > Cc: "Darrick J. Wong" <djwong@kernel.org>
> > Cc: Chandan Babu R <chandanbabu@kernel.org>
> > Cc: Dave Chinner <dchinner@redhat.com>
> > Cc: linux-xfs@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
> > ---
> >  v1:
> > 	initial version.
> > 
> >  fs/xfs/libxfs/xfs_dir2.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/fs/xfs/libxfs/xfs_dir2.c b/fs/xfs/libxfs/xfs_dir2.c
> > index 202468223bf9..24251e42bdeb 100644
> > --- a/fs/xfs/libxfs/xfs_dir2.c
> > +++ b/fs/xfs/libxfs/xfs_dir2.c
> > @@ -379,12 +379,11 @@ xfs_dir_cilookup_result(
> >  					!(args->op_flags & XFS_DA_OP_CILOOKUP))
> >  		return -EEXIST;
> >  
> > -	args->value = kmalloc(len,
> > +	args->value = kmemdup(name, len,
> >  			GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_RETRY_MAYFAIL);
> >  	if (!args->value)
> >  		return -ENOMEM;
> >  
> > -	memcpy(args->value, name, len);
> >  	args->valuelen = len;
> >  	return -EEXIST;
> >  }
> > -- 
> > 2.43.0
> > 
> > 
> 

-- 
- Andrey

