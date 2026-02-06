Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GapODoohmmLKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C190101425
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8F810E865;
	Fri,  6 Feb 2026 17:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=multikernel-io.20230601.gappssmtp.com header.i=@multikernel-io.20230601.gappssmtp.com header.b="wyLjam4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84BD10E29E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 04:01:21 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-658f1fde4bfso4371054a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 20:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770350480; cv=none;
 d=google.com; s=arc-20240605;
 b=dL5WX5CV2XPw8zKW9dxFGwxtk+aizoTWqOKhnDGuJoir8m1Lnkc0d58PCg1prMXuAV
 oCAubdqxMjjhFkj0sD+eGMqg7UsM6OnacRjP3Xxmh1ed31/6vkMgnxK2HOSgIJ7fpsZO
 c/t/DiinXspDdLtB9r3IRo7PKrJUYKhPWX4jcZqPZXzj7uWx7VYRYFUwKZmc00HVYupL
 q05mq8jfgMasFJxocFEE+u1p7kW10f65mDNAQh+A/vFOTl8/vTGvxhkcA/xuk6cHrWho
 LCWArliHfJa1m7QrjBVXIMS1HxMSQ2WbwRuYxYbDd2r6lsPrBh+4hfwqcfCocKoXOZNO
 fTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MJ601fAsDIsKvp0R5YEF5N0VDMJm2LTPx6s6C0mxRJ4=;
 fh=rlKD72vtIQSATNMxe0n+oTdnxRhm59Lk3CF96nc5QQ4=;
 b=Vkur97p1QL3p7ieuyTcp19IdiB9iMVEHWsP+2nyDYe7AVbYl+2oRFzc9sNvqcZV+U9
 YNGe9YSRtrQLswDYBdFYS7MCCrWEEDLEF9YEfMxnYX57NS3G7ctjiHRUTBlj/MWQsVM4
 jS1myb+RCr+Xp5LsmgQ4teDMxUIkEzC9huHfJi4ZTglhpI7B3JQZP3z+dHhCuS+szmyT
 SpO69avS7LoPFxOJhK0lVtT1s2Omp0WsjXHT0f+5XHomjFHiKLy5RcW21QMnej2kMAQH
 E0j6FnX+Sf0nxCJeIQ7uPZyGuw3fRc2cg01kqT0DqD5Ofm8C73ajV8u3tAGExkXJCD6+
 m+QA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=multikernel-io.20230601.gappssmtp.com; s=20230601; t=1770350480; x=1770955280;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJ601fAsDIsKvp0R5YEF5N0VDMJm2LTPx6s6C0mxRJ4=;
 b=wyLjam4srselTwInGL8jFNTjDNK6PFHXDsHDlQmpkJuKdoQa/emIUIspNjOQilzb3Z
 YaG6jk+lbEQ4e187DMM299YFmsjJ1mRhhwuS4r687uyhtUFRyO15/fu9+fBTTp1v/XWy
 DjxVxCZHqO0PyaaUzem+We8qK8ppnXq/DmI7TF/xBKXdI9bZcBfK3KoYp8GgWRZL8zBi
 tWb104OPU/yOembs/SZyDet0py71oI05jE1yYqNWXdT/oqSUT1WUIenrkEpuQK10PVNW
 B+LepaS9C06xVmSXAZYnXyCIiAvODu6BU/aQE+wgUr+zOQNvyI/pNRsD5lWBt7eqtBsK
 meUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770350480; x=1770955280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MJ601fAsDIsKvp0R5YEF5N0VDMJm2LTPx6s6C0mxRJ4=;
 b=Q/Z3vGF9w+nzesT4nyW16fgL9xTjVFEpjXwmK9PekKlqTlZnY3O/PxPMQ5aRKSz2/Y
 Zsi6OR+quEraydy0vGbZ7tTxTbLeEBS71Wz4pkWRxzmwlnkt2LimYsst9Z6POHgR2Hu8
 NilyzLdT6pRGdh1NJakWejsgnRcyNgRjIEgcWL2ZGuovd8Lc0gvVzNkT+UeRmN9h8evv
 uKMy1e9YgKweg17dsEsbhfNRxlVZkuNkjwcRUBHCNJQKzMGH9QRAhUUSVWJ9lWYPHAR7
 HtgoxDpa1Ad2Ffa5MGudRBXc+EWKr/oRHZlV1ax5Md9hgvwzpDI4LKPmlOvtUlJzIOtj
 xbkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBD5R/GxOwA/gdTyBP0ShNrXWj1uCep3ty4LElXtWev1ait623xOhXpYgJn3tl8kEUZM9IsRV4BFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHMR+Ap4L+AEPn8HmPnUY6BPSaZYqfImFVU5VgeRXn3ngdkZen
 pYlpM0hPmzEclINdleXUlpy/68pDwbbqZlyU+xwvnhnkzyJksrG8mi+pTxWIj0nu8sCN66xE5iG
 GGP2uHrSY48x5IYvlSsAu3JwvLgGQhhsnx0RlJnIphw==
X-Gm-Gg: AZuq6aIWt48RxGCM0/Ri7N/yaotVkV2zlr8JlRF7dbtrvqhd8Gl5D77oPactnvtqj3x
 m/PCoQIFc7gevqE7vT2GF9hG3XNPHsie4LaWdjigj8z9d8iljuzQKCNa2jhbMWBbQ4gwk1Ar6iL
 ObRpjEm5RfUsF2R/ExuMUFYhOriYeujPheiGo6U4UsxOdZHgBMvETugKtuvheHagb0iB02daHnm
 xxF+xGqNAxBhWCEKll/g2RzWIRE0EkHoiyQhMi/qIxqhqgBbrjcMdQFq+Cqfy+anxqBUaMWseR8
 o9EgnDf6XP2YOH75gsuxAN0/FdDitn86wjlcAAMeQZnwd/VOGWiw++5rjBn1XV+/kA0X/E8=
X-Received: by 2002:a17:907:60cd:b0:b87:6839:6175 with SMTP id
 a640c23a62f3a-b8eba0e0fcamr374449066b.10.1770350479895; Thu, 05 Feb 2026
 20:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20260201170953.19800-1-xiyou.wangcong@gmail.com>
 <aYBENSqGtp0XUZBw@infradead.org>
In-Reply-To: <aYBENSqGtp0XUZBw@infradead.org>
From: Cong Wang <cwang@multikernel.io>
Date: Thu, 5 Feb 2026 20:01:08 -0800
X-Gm-Features: AZwV_Qg9VY77zJfA1bdquBWf1Lvd3VC-n4ZiDOq2gALrLvN6wt6DotXnQE0RnfY
Message-ID: <CAGHCLaRmMb9ge=KZucpXRkEbRS-VHxFQM0XyU26Y5Z6bVabLsw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add SB_I_NOEXEC flag to dmabuf pseudo-filesystem
To: Christoph Hellwig <hch@infradead.org>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 06 Feb 2026 17:43:15 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[multikernel-io.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:xiyou.wangcong@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:xiyouwangcong@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[cwang@multikernel.io,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[multikernel.io];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,linaro.org,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cwang@multikernel.io,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[multikernel-io.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,infradead.org:email,multikernel.io:email]
X-Rspamd-Queue-Id: 2C190101425
X-Rspamd-Action: no action

On Sun, Feb 1, 2026 at 10:29=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Sun, Feb 01, 2026 at 09:09:52AM -0800, Cong Wang wrote:
> > From: Cong Wang <cwang@multikernel.io>
> >
> > The dmabuf filesystem uses alloc_anon_inode() to create anonymous inode=
s
> > but does not set the SB_I_NOEXEC flag on its superblock. This triggers =
a
> > VFS warning in path_noexec() when userspace mmaps a dma-buf:
>
> As last time, I think it would be much preferable to set SB_I_NOEXEC and
> SB_I_NODEV by default in init_pseudo and just clear it if needed.
>
> I can't think of anything would need to clear them from a quick look.
>

I agree that setting SB_I_NOEXEC and SB_I_NODEV by default in
init_pseudo is a better approach.

I will send a v2 tomorrow.

Thanks,
Cong
