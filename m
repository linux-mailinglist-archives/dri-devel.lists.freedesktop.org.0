Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A136607F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 21:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B076E8C3;
	Tue, 20 Apr 2021 19:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0228.hostedemail.com
 [216.40.44.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8719A6E8C4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 19:58:52 +0000 (UTC)
Received: from omf01.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 6E69C181D3030;
 Tue, 20 Apr 2021 19:58:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id F010F1727C; 
 Tue, 20 Apr 2021 19:58:49 +0000 (UTC)
Message-ID: <c5de33a3cd1dc18688fc2bb7cf6a84aedcc5a041.camel@perches.com>
Subject: Re: [PATCH 1/1] video: hyperv_fb: Add ratelimit on error message
From: Joe Perches <joe@perches.com>
To: Michael Kelley <mikelley@microsoft.com>, kys@microsoft.com, 
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org, 
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Tue, 20 Apr 2021 12:58:48 -0700
In-Reply-To: <1618933459-10585-1-git-send-email-mikelley@microsoft.com>
References: <1618933459-10585-1-git-send-email-mikelley@microsoft.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: F010F1727C
X-Spam-Status: No, score=0.10
X-Stat-Signature: wp7o7gzq7pg8kxru5xh3thy9zy7qob7b
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19dJn8qDTGT/B7MaqDP5Xqh09MwTqzF5cI=
X-HE-Tag: 1618948729-943129
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-04-20 at 08:44 -0700, Michael Kelley wrote:
> Due to a full ring buffer, the driver may be unable to send updates to
> the Hyper-V host.  But outputing the error message can make the problem
> worse because console output is also typically written to the frame
> buffer.  As a result, in some circumstances the error message is output
> continuously.
> =

> Break the cycle by rate limiting the error message.  Also output
> the error code for additional diagnosability.
> =

> Signed-off-by: Michael Kelley <mikelley@microsoft.com>

None of the callers of this function ever check the return status.
Why is important/useful to emit this message at all?

> ---
> =A0drivers/video/fbdev/hyperv_fb.c | 2 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index 4dc9077..a7e6eea 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -308,7 +308,7 @@ static inline int synthvid_send(struct hv_device *hde=
v,
> =A0			       VM_PKT_DATA_INBAND, 0);
> =A0
> =

> =A0	if (ret)
> -		pr_err("Unable to send packet via vmbus\n");
> +		pr_err_ratelimited("Unable to send packet via vmbus; error %d\n", ret);
> =A0
> =

> =A0	return ret;
> =A0}


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
