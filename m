Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDSKEcUNn2neYgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:57:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ADC199108
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA67010E7BC;
	Wed, 25 Feb 2026 14:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="omWGzgI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2043 seconds by postgrey-1.36 at gabe;
 Wed, 25 Feb 2026 14:57:05 UTC
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk
 [188.40.203.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E52710E7B9;
 Wed, 25 Feb 2026 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:In-Reply-To:
 References; bh=TCOo+utG6jX6dJ021kSiUbgIpjtTFK2RTNI1qlz41Vc=; b=omWGzgI7o2mWC4
 sR2f2i+X2MtLGj0uO5/veLy+oC2N5qDvyB/F+t584qMJujb5ol2XWlaFT8SuCc6DFKt1FlDVt//hA
 KmikPz0SygHKK0X1vD32zr5Y9UWqSEvZorPivl8FA72Yu0ik/r39WgB9HEaTzUhjY9DePri45+mJ+
 +vcVlj2uHreffVhT6IEoSSX+hB/SMJ2M1L0YeaSKVIKL7f5yUEr5rtaNyKkHzqQUPHodNsNd3GFrF
 2kE27Fz/NEHK7tXdblQm+n8SI/8GGUffsreart9gUJnPbYwl9zaJURsu1ZGfp/6h7WbprqCOV1/4L
 L4TT8viTXQAjmDlGqOsg==;
Received: from [63.135.74.212] (helo=[192.168.1.241])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1vvFn2-00G16Q-BX; Wed, 25 Feb 2026 14:23:00 +0000
Message-ID: <1a284543-9946-482d-a0ce-0d72304046f6@codethink.co.uk>
Date: Wed, 25 Feb 2026 14:22:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: adreno_gpu with multiple display-controllers
Organization: Codethink Limited.
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[codethink.co.uk : SPF not aligned (relaxed),reject,sampled_out];
	R_DKIM_REJECT(1.00)[codethink.co.uk:s=imap4-20230908];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codethink.co.uk:-];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,codethink.co.uk:url,codethink.co.uk:mid]
X-Rspamd-Queue-Id: 06ADC199108
X-Rspamd-Action: no action

I am currently looking at an SA8295P based device which has six eDP/DP
outputs and thus is configuring two of the qcom,sc8280xp-mdss devices.

This is failing as the device registration as the first one binds the
two output channel devices and the adreno_gpu to it, followed by then
attempting to do the same with the next which fails as the aggregagte
device code can't handle this and leaves the gpu unbound.

Fixing the aggregate device to then just causes the bind to fail as
the adreno_gpu is already bound to the first mdss with -EBUSY from
the irq code in the driver bind.

The two driver binds are as follows:

>> [   43.009894] adreno 3d00000.gpu: adreno_bind() bind as dev
>> [   43.020697] msm_dpu ae01000.display-controller: adreno_bind() bind as master
>> [   43.076995] adreno 3d00000.gpu: supply vdd not found, using dummy regulator
>> [   43.105257] adreno 3d00000.gpu: supply vddcx not found, using dummy regulator
>> [   43.208582] msm_dpu ae01000.display-controller: bound 3d00000.gpu (ops a3xx_ops)
>> [   43.233368] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x80000000
>> [   43.343842] [drm] Initialized msm 1.13.0 for ae01000.display-controller on minor 
> [   46.013271] adreno 3d00000.gpu: adreno_bind() bind as dev
> [   46.024075] msm_dpu 22001000.display-controller: adreno_bind() bind as master
> [   46.038039] genirq: Flags mismatch irq 243. 00000004 (gpu-irq) vs. 00000004 (gpu-irq)
> [   46.051349] adreno 3d00000.gpu: error -EBUSY: request_irq(243) irq_handler 0x0 gpu-irq

Looking into the adreno_bind() it then passes the drm instance from the
msm_dpu into the msm_gpu_init() and then I am not sure where that all
gets used to try and work out if we can make the resources local to
the adreno_gpu device and then have the two display controllers share
this.

Is there anyone looking into this? I have posted an RFC for the
aggregate device issue, but not sure how to deal with the adreno_gpu
side (and having other hw issues which means I can't even get the
driver to work with just one mdss node).

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

