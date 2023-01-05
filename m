Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908965EBF0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673A810E715;
	Thu,  5 Jan 2023 13:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7439D10E716
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:04:54 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r2so1235063wrv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LsZ32dv/OC+Nb4ftoKd68ybVYKMb6ALfR6sxEPmUBK0=;
 b=OMl2z0bEVkQjBng9NmxI8H9oWdCOX+1jSoysVqvl5eUq0fH3zSvu0BR5H+deKbN8kC
 rsyD2oEp3IZDcF1WGL7zVwvFUrMkRoxAcIg3Ofa5uc0GywdmZ67j83ZBtB4kPfJGsNyP
 Kr3CyQCHYSr0tCSdT9C0hS7z6Vb2IpNMetTLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LsZ32dv/OC+Nb4ftoKd68ybVYKMb6ALfR6sxEPmUBK0=;
 b=nzoVzLURLTw3y9KmxufsbjHuK4XXLTC83WUJ57qtO6HSMzuqXJFbiyHpD5tHcdJGgu
 bqT/ph+fAA7ZrR39dWJMR3FA77RA/mNyR5QJ99Bp0aUgBcXk77IBSo4GzvLtrX+v7GGp
 jmGcUbFiGPrvAPDfw1hbSotzJ4eKKjEGPriWXBVDaRQ/ChC1jdOk92zm9FkTvwbmIm+0
 BZw2o9QdJoi2ZupXgs1Kuva9s050m/bzBZYL9AB+pYR9acG3Gc2Hzdws5ajnGoFo15Jr
 6H/TUuVJTIcMC0ihxjG4yfXeL9ZgjRug6JJx+NDGmiCaxNlMcunGcooFJFVed9bqkIaO
 isdA==
X-Gm-Message-State: AFqh2kppBU0KkVL+NdOU+nY4LaTr4AMl/PRUoTealL+4zAsZVxd52p0n
 wwLZvLDwaY7h7/VsyADgnHt8Fw==
X-Google-Smtp-Source: AMrXdXtFVgsClYWQ/F/H3Fu9zHMZcwy4NMo0QmdJvkOV/usH8nN5KK69iAUk4NcI/VpNOKleze4rpQ==
X-Received: by 2002:adf:e743:0:b0:242:63de:2f5b with SMTP id
 c3-20020adfe743000000b0024263de2f5bmr34768293wrn.6.1672923892964; 
 Thu, 05 Jan 2023 05:04:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q5-20020adfcd85000000b002366553eca7sm36657442wrj.83.2023.01.05.05.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:04:51 -0800 (PST)
Date: Thu, 5 Jan 2023 14:04:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH 1/5] linux/minmax.h: add non-atomic version of xchg
Message-ID: <Y7bK8drngH/NIlOa@phenom.ffwll.local>
Mail-Followup-To: David Laight <David.Laight@aculab.com>,
 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <f58ab17e5c6c4a4e8b0d687b44618c51@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f58ab17e5c6c4a4e8b0d687b44618c51@AcuMS.aculab.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 09:38:12AM +0000, David Laight wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> > Sent: 09 December 2022 15:49
> > 
> > The pattern of setting variable with new value and returning old
> > one is very common in kernel. Usually atomicity of the operation
> > is not required, so xchg seems to be suboptimal and confusing in
> > such cases. Since name xchg is already in use and __xchg is used
> > in architecture code, proposition is to name the macro exchange.
> 
> Dunno, if it is non-atomic then two separate assignment statements
> is decidedly more obvious and needs less brain cells to process.
> Otherwise someone will assume 'something clever' is going on
> and the operation is atomic.

Yes, this also my take. The i915 code that uses this to excess is decidely
unreadable imo, and the macro should simply be replaced by open-coded
versions.

Not moved into shared headers where even more people can play funny games
with it.

I think swap() is a standard idiom in C, this one here just isn't.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
