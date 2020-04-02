Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78819BCB9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED396E9DE;
	Thu,  2 Apr 2020 07:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0324B6E9DE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 07:32:31 +0000 (UTC)
IronPort-SDR: kuUqhhZA2UR3NXr0l+rxtrcaVbom1KRwwFc/szV8OpZ5/dETSriVRrsbKYCU38a86JhSlp/JOm
 dqe5Y4wmAQhw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 00:32:31 -0700
IronPort-SDR: gdOzEhnqEgsoR8sAYDzfV05CATH4fzVWWsS+k0boW8O/yu3Xfi3sJxeG235iqhxdcOZT0BRZiL
 Wb4kADP/oc4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,334,1580803200"; d="scan'208";a="328729980"
Received: from tronach-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.252.38.191])
 by orsmga001.jf.intel.com with ESMTP; 02 Apr 2020 00:32:28 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
 id E279321F19; Thu,  2 Apr 2020 10:32:20 +0300 (EEST)
Date: Thu, 2 Apr 2020 10:32:20 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Message-ID: <20200402073220.GB1522@kekkonen.localdomain>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
 <080ddddf-717e-61dc-8522-fbdbe52da94a@xs4all.nl>
 <20200401151332.GU1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401151332.GU1922688@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the review.

On Wed, Apr 01, 2020 at 06:13:32PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 01, 2020 at 04:13:51PM +0200, Hans Verkuil wrote:
> > On 4/1/20 4:05 PM, Sakari Ailus wrote:
> > > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > > the same implementation can be used.
> 
> %p4cc ?

Sounds good. Numbers have special handling but AFAIR only right after %
sign, so this should be possible.

> 
> > > +	char ch[2] = { 0 };
> > 
> > This can just be '{ };'
> 
> The latter is GCC extension, while above is C standard. Former is slightly
> better I think. Though see below.
> 
> > > +	unsigned int i;
> > > +
> > > +	if (check_pointer(&buf, end, fourcc, spec))
> > > +		return buf;
> > > +
> > > +	switch (fmt[1]) {
> > > +	case 'f':
> 
> > > +		for (i = 0; i < sizeof(*fourcc); i++) {
> > > +			ch[0] = *fourcc >> (i << 3);
> > 
> > You need to AND with 0x7f, otherwise a big endian fourcc (bit 31 is set)
> > will look wrong. Also, each character is standard 7 bit ascii, bit 7 isn't
> > used except to indicate a BE variant.
> 
> Why not to do it once by a flag and do reset it once?
> 
> 	u32 tmp = *fourcc;
> 	bool be4cc = tmp & BIT(31);
> 
> 	tmp &= BIT(31);

I had two extra temporary variables in a version I didn't send but I
figured they could be removed. :-)

> 
> On top of that, as promised above, why not simple do it in a simpler way, i.e.
> using standard idiom:
> 
> 	for (i = 0; i < sizeof(*fourcc); i++) {
> 		if (buf < end)
> 			*buf = tmp >> (i * 8);
> 		buf++;
> 	}
> ?

I guess that's at least more efficient, and comparing buf to end is
trivial. I'll do that in v2.

> 
> > > +			buf = string(buf, end, ch, spec);
> > > +		}
> > > +
> > > +		if (*fourcc & BIT(31))
> > > +			buf = string(buf, end, "-BE", spec);
> 
> Another possibility
> 
> 	u8 ch[8];
> 
> 	if (*fourcc & BIT(31)) {
> 		put_unaligned_be32(tmp, &ch[0]);
> 		strcpy(&ch[4], "-BE");
> 	} else {
> 		put_unaligned_le32(tmp, &ch[0]);
> 		strcpy(&ch[4], "-LE");
> 	}
> 	return string(buf, end, &ch[0], spec);

I think I prefer the loop. I figured you can only call string once,
otherwise field width handling will be broken. Let's see.

> 
> > > +		return buf;
> > > +	default:
> > > +		return error_string(buf, end, "(%pp?)", spec);
> > > +	}
> > > +}
> 

-- 
Kind regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
