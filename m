Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB51520B2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 20:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE62F6E8C0;
	Tue,  4 Feb 2020 19:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2230E6E8C0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580842816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jy3/WknZKcXoyQ8Ctf5hA6Q8cxOwETrXdgigIPAPWAo=;
 b=bEMGLjq8UU1sC309D+LMI/M1HFuhTJjTC/ljJI0/UDP5lVhBsLKrKrw4w4qc5mVclsSQjj
 h95+ck7GNnMOlyoHROR/E9I5OrfNOlkHgT7Xi9wsvSJ1ER9GrwnLmUuOFYHEsRyHBlall3
 fRMYXkkWUcGWMu74rH8FgzfS/iMzwQU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-VEf60_2FMAymgqLUGxfxSw-1; Tue, 04 Feb 2020 14:00:12 -0500
Received: by mail-qk1-f199.google.com with SMTP id s9so12507254qkg.21
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 11:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=jy3/WknZKcXoyQ8Ctf5hA6Q8cxOwETrXdgigIPAPWAo=;
 b=U6wE3R+nBKvK7Z06NsgTr9/ptzHIvne5lFN2i5FqdPfglFAztDzkndhjLzF9efZzDx
 aRd4Hcafl9wJXeZxSDUOoOdlm0WRK2dJ0ebzqJjtuWL8fr8n5ZJTdTttgE2R1h9dw8oL
 cg0v4WdSxtaDV4HWnCiytGsHjF07B9uGs51P4SX9D7z2qNH3TyZpDW/+3VB3LApepTWF
 mwkDzwesadTAfHO7+etucKFoRmEp85BHDzRUu3vzdL5ZCGMzZMq8mq+NlgGCtc3VzwJM
 68gahwElKyKzaugjyHhGsJIcfk3aMFzR5oUYWglj8RQtPNoNRKL+orVY4+g/ik9RMeeu
 PoKA==
X-Gm-Message-State: APjAAAWQIASKLV+rOzhzdiHY443iUxCf/MDrbtZm6Zy3u+3ZEO6RIdUb
 uLriliHfe3LLvBiPr/fcR/704qtds6PoEGusTt4BPdOtsYLCJVH+3t4HfsSYIUZnPt2VY66fUI/
 UeVW4R4Ibe++IqWtvWO4RcdPAxQqY
X-Received: by 2002:a37:4747:: with SMTP id u68mr8830706qka.12.1580842812068; 
 Tue, 04 Feb 2020 11:00:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfVxWGoPKvyTdEclTSIxPTHIC/Jkx8ggqXgfUxWEJ0NCBN9c5eHNh8ijv7eERd26CVyo4s2Q==
X-Received: by 2002:a37:4747:: with SMTP id u68mr8830681qka.12.1580842811741; 
 Tue, 04 Feb 2020 11:00:11 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id o7sm11551971qkd.119.2020.02.04.11.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 11:00:10 -0800 (PST)
Message-ID: <75b302aa739511b3cc2abf4360d5780a08e7c17a.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Check crc4 value while building sideband
 message
From: Lyude Paul <lyude@redhat.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie, 
 daniel@ffwll.ch
Date: Tue, 04 Feb 2020 14:00:09 -0500
In-Reply-To: <20200203121620.9002-1-benjamin.gaignard@st.com>
References: <20200203121620.9002-1-benjamin.gaignard@st.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: VEf60_2FMAymgqLUGxfxSw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2020-02-03 at 13:16 +0100, Benjamin Gaignard wrote:
> Check that computed crc value is matching the one encoded in the message.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> CC: lyude@redhat.com
> CC: airlied@linux.ie
> CC: jani.nikula@linux.intel.com
>  drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 822d2f177f90..eee899d6742b 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -736,6 +736,10 @@ static bool drm_dp_sideband_msg_build(struct
> drm_dp_sideband_msg_rx *msg,
>  	if (msg->curchunk_idx >= msg->curchunk_len) {
>  		/* do CRC */
>  		crc4 = drm_dp_msg_data_crc4(msg->chunk, msg->curchunk_len -
> 1);
> +		if (crc4 != msg->chunk[msg->curchunk_len - 1])
> +			print_hex_dump(KERN_DEBUG, "wrong crc",
> +				       DUMP_PREFIX_NONE, 16, 1,
> +				       msg->chunk,  msg->curchunk_len, false);
>  		/* copy chunk into bigger msg */
>  		memcpy(&msg->msg[msg->curlen], msg->chunk, msg->curchunk_len -
> 1);
>  		msg->curlen += msg->curchunk_len - 1;
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
