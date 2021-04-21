Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940B366988
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 12:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD7C6E980;
	Wed, 21 Apr 2021 10:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB806E980
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 10:57:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1619002649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgVvXl99TxnibcW76eYvhg6wpPaOgg+p9bccUoVFxxs=;
 b=b6CyN9SxhFfZjTTdYIQvTKNt4IfcXFXUGqZZgtYgycjhCjHVTyJO+Nm64qI+MUFZEN89qx
 0/5HRjjPSgc/foprJoUiqhzBdLZ804nlBYre2Cj4o12VvXdtlo84o7vj4YaqOK/NMkvwKH
 sDC5MoXlQI3KrSGua6OjVjS8aBB6TAg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A8F7AEE7;
 Wed, 21 Apr 2021 10:57:29 +0000 (UTC)
Date: Wed, 21 Apr 2021 12:57:28 +0200
From: Michal Hocko <mhocko@suse.com>
To: Peter.Enderborg@sony.com
Subject: Re: [PATCH v5] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YIAFGF4QFX92WG/I@dhcp22.suse.cz>
References: <20210417163835.25064-1-peter.enderborg@sony.com>
 <YH6Xv00ddYfMA3Lg@phenom.ffwll.local>
 <176e7e71-59b7-b288-9483-10e0f42a7a3f@sony.com>
 <YH63iPzbGWzb676T@phenom.ffwll.local>
 <a60d1eaf-f9f8-e0f3-d214-15ce2c0635c2@sony.com>
 <YH/tHFBtIawBfGBl@phenom.ffwll.local>
 <cbde932e-8887-391f-4a1d-515e5c56c01d@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cbde932e-8887-391f-4a1d-515e5c56c01d@sony.com>
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
Cc: willy@infradead.org, neilb@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, adobriyan@gmail.com,
 linaro-mm-sig@lists.linaro.org, shakeelb@google.com, rppt@kernel.org,
 samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 christian.koenig@amd.com, guro@fb.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 21-04-21 10:37:11, Peter.Enderborg@sony.com wrote:
> On 4/21/21 11:15 AM, Daniel Vetter wrote:
[...]
> > We need to understand what the "correct" value is. Not in terms of kern=
el
> > code, but in terms of semantics. Like if userspace allocates a GL textu=
re,
> > is this supposed to show up in your metric or not. Stuff like that.
> That it like that would like to only one pointer type. You need to know w=
hat
> =

> you pointing at to know what it is. it might be a hardware or a other poi=
nter.
> =

> If there is a limitation on your pointers it is a good metric to count th=
em
> even if you don't=A0 know what they are. Same goes for dma-buf, they
> are generic, but they consume some resources that are counted in pages.
> =

> It would be very good if there a sub division where you could measure
> all possible types separately.=A0 We have the detailed in debugfs, but no=
thing
> for the user. A summary in meminfo seems to be the best place for such
> metric.

I strongly suspect that the main problem of this patch (and its previous
versions) is that you are failing to explain the purpose of the counter
to others. From what you have said so far it sounds like this is a
number which is nice to have because gives us more than nothing. And
while this is not really hard to agree with it doesn't really meet the
justification for exporting yet another counter to the userspace with
all the headache of the future maintenance. I think it would hugely help
to describe a typical scenario when the counter would be useful and the
conclusion you can draw from the exported value or a set of values over
time.

And please note that a mixed bag of different memory resources in a
single counter doesn't make this any easier because then it essentially
makes it impossible to know whether an excessive usage contribues to RAM
or device memory depletion - hence this is completely bogus for the OOM
report.
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
