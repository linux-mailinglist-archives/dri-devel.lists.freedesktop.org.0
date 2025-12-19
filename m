Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79BACCF72C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1717B10ED34;
	Fri, 19 Dec 2025 10:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dC2TE71J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27BA10ED34
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766141255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=;
 b=dC2TE71J+YfHJewG58FwvcxeKkgfTh93hutbdh9GkWS3cPBgcoFmRCuDrbZk0Q7QNWVDNu
 0hn5R/RNi1GJ0zfJQYFs9w5HxadAT5iCjAGYSjZ4ABN5ubVF77pMXLoBqjBDwXDTIP93qG
 EX4zAKm9pvl4/Icv8FpiDVEFCACKE9o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312--Wey4SB3NzSDjJLKHkEMNQ-1; Fri, 19 Dec 2025 05:47:33 -0500
X-MC-Unique: -Wey4SB3NzSDjJLKHkEMNQ-1
X-Mimecast-MFC-AGG-ID: -Wey4SB3NzSDjJLKHkEMNQ_1766141252
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477a1e2b372so12108245e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766141252; x=1766746052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=;
 b=prEmoINmFllorTn2aaH12NtnnE2Inmt9rS0Wdo49KhUjNNpL11w+ArgL6pEqhGKeZV
 pP4zvDUai5q7wrOv3eCJKVwCZpQBb8/uFCfdnI9OYeXB80ZcMTd8zCvSIOug+R/66THZ
 0D/IYmKp7kNg6CvKKps0Ty7QSnPRQ8Ry69KnJmwESOvHj5v7YCQcuh6dOopnzT8HhTGT
 5Ums6Mn0aHdsnXx0sqK7XaohtQyWlNSTF6w5bzthl2OUoF7ElF2zfrDrIlYrEH7N6nw6
 KlEC4oOJeKlyVsbY1etm6/hcQQUSq/VZd9+W0LXnX0vx4BLBB26xFBGhDj4o/dFBc2wV
 wVtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuKl1U5HBK2n+mt6opoDyzDfIuuerLkDiDVYAV893vMrOpSciQkQyn/7IE6DuBXCQqedBi2IrcSTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXdo1zpkK0jgJeTjULnGLHURtOj9QfuRCAfHLl3WgEF8wV/UjZ
 33NVMsQ8NkOtPMoyqGqtTdzXkR6iykoVUYAqBnd0vbWLXjXpngIPKnlSeZnNPBuyUxYzmfoHfcE
 xZVjolyUe9yIhXxFosKLCrZZv78NWT9UqA9vJig4HkE8jRLycv8NQfvZNomxn317JKeFtXQ==
X-Gm-Gg: AY/fxX4hrl9OwEqqQoheHS4OGjx0UtrDZLJR/c/oqqYvKRuqdvLWmfKteglulsQ/T4R
 ZhkL6r32s6cq/h/0ovWq+48eVsGpdfP73k/GuQlhx6KQ5ieSQ9Rsq5pRm+jpfHJ0q+QOA/ZbMYa
 q2/svY0PE5/RL+rr6dZsAzFmd4LsShYafxmgO/2RFAOsvfUkWe4ntTaNayZf7emLFlB4IBvU6hT
 ZL1qsU739IECMLgcEfVJTQE+q0Vh34H10E/YDZrEcKSj3mZT2f+TPrzR8UCiNXn1OZ/73LiTJtC
 ie8zTFB3bUcyKUFTVPJCdO6NLy7oX1YbAyh34gAKmaPyrvG9qvQJPSzFSU3pZ4htb6qgv68eV9+
 glBnFhl1vWGe9
X-Received: by 2002:a05:600c:6812:b0:477:63b5:7148 with SMTP id
 5b1f17b1804b1-47d1955b97cmr21387395e9.6.1766141252216; 
 Fri, 19 Dec 2025 02:47:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0haeKdz6e1wVUfU68PetlUVJ262uD0U3xuzOT7CFHMjUWuxjHWC2bHGvwH3+5rKwg5RCnYg==
X-Received: by 2002:a05:600c:6812:b0:477:63b5:7148 with SMTP id
 5b1f17b1804b1-47d1955b97cmr21387045e9.6.1766141251798; 
 Fri, 19 Dec 2025 02:47:31 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.227])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be273f147sm92155575e9.7.2025.12.19.02.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 02:47:31 -0800 (PST)
Message-ID: <b547252f-9893-4c23-8b17-9808c8bdd0c9@redhat.com>
Date: Fri, 19 Dec 2025 11:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 Chris Lew <quic_clew@quicinc.com>, stable@vger.kernel.org
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q2bFsYtHln8owL_d_9jjW7dMLEXSXyXzjrzqyt3-ntY_1766141252
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

On 12/18/25 5:51 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

For net/...

Acked-by: Paolo Abeni <pabeni@redhat.com>

even if I don't see anything network specific there.

/P

