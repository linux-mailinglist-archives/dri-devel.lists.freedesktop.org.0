Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192B13982B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 18:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60A26E106;
	Mon, 13 Jan 2020 17:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508D66E12F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 17:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578938352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nb8j+GFd6k9OPTxXI1Xxas/o4T4IzIui0F6wvqvv42s=;
 b=UQUnKRFppTbUilEmvRT2bJ0mKnjTphgCx5vz4nQBP8w4ZPfe9rMo2KQG7pPh41zAFOTPk8
 DKnOLuJNQcFtIzLK6YBqC2afSGRZqeATvhhZ7avByZXJdR3tLPAGEIvMeU2Cvj1LOr242P
 tucP3cLJlYpN24R0Szht0AsAD9qyhVA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-VhoJSGbCP5C8qpouDsdJXA-1; Mon, 13 Jan 2020 12:59:08 -0500
Received: by mail-qk1-f197.google.com with SMTP id j16so6447432qkk.17
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 09:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Nb8j+GFd6k9OPTxXI1Xxas/o4T4IzIui0F6wvqvv42s=;
 b=T0kNN60HOPS33PfwyXGUIe1XGhxZtZ9iob1N6jSJRKZ607DOFRXrStc1FU/gmkseNP
 v9nRHiB/JgiUkWH4m8hjmD/oWZEfRNgRElhqjaGgOqK3jOFPFDds8hdx51n9tbgI6Abb
 9X9jYd12M21Oy0vrhgRimBQ3lu4UZdMitMKenodtArkbU3DiATFBOAwraD0TnCajrPaM
 baNFRuYn18Sy5x1WwUJukij+GBoQDf2JuHwb3VRRWdMQZ7tphNRP32Tx+zeudbnx6oRi
 lNc8LJr0JJx9uMyM5MSTTjOZY04QPKhK2C7olDvnUt1rDKkTVc5kmcw44Fo1saU/7mfC
 CiiQ==
X-Gm-Message-State: APjAAAXxUUeaaYccTb+yp7BwN0JKHaD7i8ARPy1yG5uT+ZHHo/XwxxHb
 5v7Qy+NAjW4ghibUxkDPRi9llIC+VcrroC5lGARcsMTUiTLUGRSTkKpVX4hD1CogPg7n2AF7ICv
 3tc2sZqh+GDEiwEMwKOm3PF7M8Nl4
X-Received: by 2002:a05:620a:133a:: with SMTP id
 p26mr16957296qkj.233.1578938347647; 
 Mon, 13 Jan 2020 09:59:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZAy6Sg/8mBRMyIlzjZh6e3v0bG6ZuAIJ3fEAsCqVuWjZtPRgBJ3cxmnfskVSuKnuswz0viQ==
X-Received: by 2002:a05:620a:133a:: with SMTP id
 p26mr16957278qkj.233.1578938347327; 
 Mon, 13 Jan 2020 09:59:07 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id o6sm5250067qkk.53.2020.01.13.09.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 09:59:06 -0800 (PST)
Message-ID: <7e60f25010669799afe5bf77c943244809c744bf.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Have DP_Tx send one msg at a time
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Mon, 13 Jan 2020 12:59:05 -0500
In-Reply-To: <20200113093649.11755-1-Wayne.Lin@amd.com>
References: <20200113093649.11755-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: VhoJSGbCP5C8qpouDsdJXA-1
X-Mimecast-Spam-Score: 0
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey! Haven't taken a look at this patch yet but just wanted to let you know
I'm going to try to get to most of the stuff you've got pending for me. I came
down with a really nasty cold last week so sorry if you've had any other
patches waiting until now!

On Mon, 2020-01-13 at 17:36 +0800, Wayne Lin wrote:
> [Why]
> Noticed this while testing MST with the 4 ports MST hub from
> StarTech.com. Sometimes can't light up monitors normally and get the
> error message as 'sideband msg build failed'.
> 
> Look into aux transactions, found out that source sometimes will send
> out another down request before receiving the down reply of the
> previous down request. On the other hand, in drm_dp_get_one_sb_msg(),
> current code doesn't handle the interleaved replies case. Hence, source
> can't build up message completely and can't light up monitors.
> 
> [How]
> For good compatibility, enforce source to send out one down request at a
> time. Add a flag, is_waiting_for_dwn_reply, to determine if the source
> can send out a down request immediately or not.
> 
> - Check the flag before calling process_single_down_tx_qlock to send out
> a msg
> - Set the flag when successfully send out a down request
> - Clear the flag when successfully build up a down reply
> - Clear the flag when find erros during sending out a down request
> - Clear the flag when find errors during building up a down reply
> - Clear the flag when timeout occurs during waiting for a down reply
> - Use drm_dp_mst_kick_tx() to try to send another down request in queue
> at the end of drm_dp_mst_wait_tx_reply() (attempt to send out messages
> in queue when errors occur)
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++++++++++++--
>  include/drm/drm_dp_mst_helper.h       |  6 ++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 4395d5cc0645..3542af15387a 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1195,6 +1195,8 @@ static int drm_dp_mst_wait_tx_reply(struct
> drm_dp_mst_branch *mstb,
>  		    txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
>  			mstb->tx_slots[txmsg->seqno] = NULL;
>  		}
> +		mgr->is_waiting_for_dwn_reply = false;
> +
>  	}
>  out:
>  	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
> @@ -1204,6 +1206,7 @@ static int drm_dp_mst_wait_tx_reply(struct
> drm_dp_mst_branch *mstb,
>  	}
>  	mutex_unlock(&mgr->qlock);
>  
> +	drm_dp_mst_kick_tx(mgr);
>  	return ret;
>  }
>  
> @@ -2770,9 +2773,11 @@ static void process_single_down_tx_qlock(struct
> drm_dp_mst_topology_mgr *mgr)
>  	ret = process_single_tx_qlock(mgr, txmsg, false);
>  	if (ret == 1) {
>  		/* txmsg is sent it should be in the slots now */
> +		mgr->is_waiting_for_dwn_reply = true;
>  		list_del(&txmsg->next);
>  	} else if (ret) {
>  		DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
> +		mgr->is_waiting_for_dwn_reply = false;
>  		list_del(&txmsg->next);
>  		if (txmsg->seqno != -1)
>  			txmsg->dst->tx_slots[txmsg->seqno] = NULL;
> @@ -2812,7 +2817,8 @@ static void drm_dp_queue_down_tx(struct
> drm_dp_mst_topology_mgr *mgr,
>  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>  	}
>  
> -	if (list_is_singular(&mgr->tx_msg_downq))
> +	if (list_is_singular(&mgr->tx_msg_downq) &&
> +	    !mgr->is_waiting_for_dwn_reply)
>  		process_single_down_tx_qlock(mgr);
>  	mutex_unlock(&mgr->qlock);
>  }
> @@ -3743,6 +3749,7 @@ static int drm_dp_mst_handle_down_rep(struct
> drm_dp_mst_topology_mgr *mgr)
>  	mutex_lock(&mgr->qlock);
>  	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
>  	mstb->tx_slots[slot] = NULL;
> +	mgr->is_waiting_for_dwn_reply = false;
>  	mutex_unlock(&mgr->qlock);
>  
>  	wake_up_all(&mgr->tx_waitq);
> @@ -3752,6 +3759,9 @@ static int drm_dp_mst_handle_down_rep(struct
> drm_dp_mst_topology_mgr *mgr)
>  no_msg:
>  	drm_dp_mst_topology_put_mstb(mstb);
>  clear_down_rep_recv:
> +	mutex_lock(&mgr->qlock);
> +	mgr->is_waiting_for_dwn_reply = false;
> +	mutex_unlock(&mgr->qlock);
>  	memset(&mgr->down_rep_recv, 0, sizeof(struct drm_dp_sideband_msg_rx));
>  
>  	return 0;
> @@ -4591,7 +4601,7 @@ static void drm_dp_tx_work(struct work_struct *work)
>  	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct
> drm_dp_mst_topology_mgr, tx_work);
>  
>  	mutex_lock(&mgr->qlock);
> -	if (!list_empty(&mgr->tx_msg_downq))
> +	if (!list_empty(&mgr->tx_msg_downq) && !mgr->is_waiting_for_dwn_reply)
>  		process_single_down_tx_qlock(mgr);
>  	mutex_unlock(&mgr->qlock);
>  }
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index 942575de86a0..d0b45468135a 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -610,6 +610,12 @@ struct drm_dp_mst_topology_mgr {
>  	 * &drm_dp_sideband_msg_tx.state once they are queued
>  	 */
>  	struct mutex qlock;
> +
> +	/**
> +	 * @is_waiting_for_dwn_reply: indicate whether is waiting for down
> reply
> +	 */
> +	bool is_waiting_for_dwn_reply;
> +
>  	/**
>  	 * @tx_msg_downq: List of pending down replies.
>  	 */
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
