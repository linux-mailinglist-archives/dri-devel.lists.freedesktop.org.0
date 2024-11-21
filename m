Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559239D4DC8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 14:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7096110E40B;
	Thu, 21 Nov 2024 13:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DntPCbB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112D310E40B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 13:30:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 548E65C5837;
 Thu, 21 Nov 2024 13:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D2EC4CECC;
 Thu, 21 Nov 2024 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1732195835;
 bh=ASgXHVNuV9rj2VXsDVEXv70EB7Y5fnU8w3EOoPXXK30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DntPCbB6E0le/iKyoX/744ERaY6tkAuSukHl3qFZyuZyBVJvGFTqqIO0GZ1s37VCg
 tKi39aE84OJMuJeOF/U/S7l69XWKA5FwRlVKGss4AK8TcVtLi2iSKoqqtU+6HjNZqb
 iQ7fYiqBwCOqoNKVqoKzZLYDa0ogxPPaQOIjgC+E=
Date: Thu, 21 Nov 2024 14:30:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <2024112120-sandal-reach-2e09@gregkh>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
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

On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> On 11/18/2024 7:32 PM, Greg KH wrote:
> > On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> >> +		/*
> >> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> >> +		 * domain_id in debugfs filename to create unique file name
> >> +		 */
> >> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> >> +			cur_comm, current->pid, fl->tgid, domain_id);
> >> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> >> +				debugfs_dir, fl, &fastrpc_debugfs_fops);
> > Why are you saving the debugfs file?  What do you need to do with it
> > that you can't just delete the whole directory, or look up the name
> > again in the future when removing it?
> fl structure is specific to a process using fastrpc driver. The reason to save
> this debugfs file is to delete is when the process releases fastrpc device.
> If the file is not deleted, it might flood multiple files in debugfs directory.
> 
> As part of this change, only the file that is getting created by a process is
> getting removed when process is releasing device and I don't think we
> can clean up the whole directory at this point.
> 
> Do you suggest that looking up the name is a better approach that saving
> the file?

Yes.

> >> +}
> >> +
> >> +struct dentry *fastrpc_create_debugfs_dir(const char *name)
> >> +{
> >> +	return debugfs_create_dir(name, NULL);
> > At the root of debugfs?  Why is this function even needed?
> creating a dir named "fastrpc_adsp", "fastrpc_cdsp" etc. to create debugfs
> file for the processes using adsp, cdsp etc.

Then just call debugfs_create_dir() you do not need a wrapper function
for this.

thanks,

greg k-h
