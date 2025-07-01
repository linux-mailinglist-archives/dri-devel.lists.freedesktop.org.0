Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1A9AEF3B1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4066210E581;
	Tue,  1 Jul 2025 09:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DPXIGDOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B693910E57A;
 Tue,  1 Jul 2025 09:45:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 28C2D45859;
 Tue,  1 Jul 2025 09:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88ABFC4CEEB;
 Tue,  1 Jul 2025 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751363131;
 bh=pVIhHa7BZghr6WPhnp4Wn0yHjQ+2eVAdSo3qe0WjfQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DPXIGDOKCY5VQCBVfcdtq4dHiYLiUBfIsvZ/Z4RHCvULXkAmAqPbk9cIkQC0N/8Y4
 tSWDkB+UU0HuytjPmwPH+11qNDnSXUWSEorXMYHzxuLtrgSLT/Tsp1UitgSeZvKYMU
 xisrDBMvHL6i3VEeUGN/MP1dwLcu06Q7ZmhodPU8=
Date: Tue, 1 Jul 2025 11:45:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Message-ID: <2025070140-dad-jaywalker-0774@gregkh>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062834-scraggly-barracuda-7ea6@gregkh>
 <205cc43a-4254-4d27-9b4f-139006e871e4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <205cc43a-4254-4d27-9b4f-139006e871e4@intel.com>
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

On Tue, Jul 01, 2025 at 02:02:15PM +0530, Nilawar, Badal wrote:
> On 28-06-2025 17:48, Greg KH wrote:
> > > + * @payload_size: size of the payload data in bytes
> > > + * @payload: data to be sent to the firmware
> > > + */
> > > +struct csc_heci_late_bind_req {
> > > +	struct mkhi_msg_hdr header;
> > > +	u32 type;
> > > +	u32 flags;
> > What is the endian of these fields?  And as this crosses the
> > kernel/hardware boundry, shouldn't these be __u32?
> 
> endian of these fields is little endian, all the headers are little endian. 
> I will add comment at top.

No, use the proper types if this is little endian.  Don't rely on a
comment to catch things when it goes wrong.

> On __u32 I doubt we need to do it as csc send copy it to internal buffer.

If this crosses the kernel boundry, it needs to use the proper type.

> > > +{
> > > +	struct mei_cl_device *cldev;
> > > +	struct csc_heci_late_bind_req *req = NULL;
> > > +	struct csc_heci_late_bind_rsp rsp;
> > > +	size_t req_size;
> > > +	ssize_t ret;
> > > +
> > > +	if (!dev || !payload || !payload_size)
> > > +		return -EINVAL;
> > How can any of these ever happen as you control the callers of this
> > function?
> I will add WARN here.

So you will end up crashing the machine and getting a CVE assigned for
it?

Please no.  If it can't happen, then don't check for it.  If it can
happen, great, handle it properly.  Don't just give up and cause a
system to reboot, that's a horrible way to write kernel code.

thanks,

greg k-h
