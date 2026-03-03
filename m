Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK2/FD9Rp2nKggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:23:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1A1F7749
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C848D10E8D7;
	Tue,  3 Mar 2026 21:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.b="iQE4r96d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Tue, 03 Mar 2026 21:23:07 UTC
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAD510E8D7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 011.lax.mailroute.net (Postfix) with ESMTP id 4fQT9J0YHHz1XM0pS;
 Tue,  3 Mar 2026 21:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:subject
 :subject:from:from:content-language:user-agent:mime-version:date
 :date:message-id:received:received; s=mr01; t=1772572530; x=
 1775164531; bh=my+DCp3nPL5OORObucrakLk/d7lzUnoRMypKqsXwqu4=; b=i
 QE4r96dqb3gEmm+lPzkiKKeB5dGuTMeQ8IYbw+29T1G0gvQCODTXeXbJLGTtFWIc
 RoBPLhje6y7tf5KaPSXauK3KBE0RE+vuZ/Vh0hVhzn2k54d0poxSswwETbZCyX+T
 yHuMlhsWC7KYu8rC2MkHQh5QLXzG+MtTulWmd7PEj/hbClk/UfcR4G4SnmqgXsQP
 N0R14tlNpdleQrS3vUGVYipg1iGY7+hwEBsA9sU6culKZ5u3inuQgkVp+Vq4xzyO
 8YTJSlgo+98I0B/NlKIcHer1qXFSJgDV3M4vyFgxYQUilDBGEuy4ubkgt7hqESKl
 fmbqkKjKUXmLPrq49EXLA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id oaMveiLVheGW; Tue,  3 Mar 2026 21:15:30 +0000 (UTC)
Received: from [192.168.132.187] (unknown [12.150.89.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fQT9G1595z1XM0nm;
 Tue,  3 Mar 2026 21:15:29 +0000 (UTC)
Message-ID: <7dcaf8d7-ed5d-4bfb-8c35-1e5f0dfbae56@acm.org>
Date: Tue, 3 Mar 2026 15:15:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
From: Bart Van Assche <bvanassche@acm.org>
Subject: __drm_fb_helper_initial_config_and_unlock() question
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 73C1A1F7749
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[bvanassche@acm.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[acm.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi,

The comment above __drm_fb_helper_initial_config_and_unlock() says
"Drops fb_helper->lock before returning". However, there is an
error path in that function that does not drop fb_helper->lock:

         info = drm_fb_helper_alloc_info(fb_helper);
         if (IS_ERR(info))
                 return PTR_ERR(info);

Is the code correct or is the comment correct? I don't think that
both can be correct.

Thanks,

Bart.
