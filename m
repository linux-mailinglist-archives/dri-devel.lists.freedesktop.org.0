Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNlCN+4vq2n6aQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 20:50:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35257227386
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 20:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB1810E367;
	Fri,  6 Mar 2026 19:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="I/fEYVgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2EE10E367
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=0qO9+QY++umfUmJGfFEVkr4r1pi/XXeRYwIJwqEAYoQ=; b=I/fEYVgbEogCcZuuWCTLQ5PMc7
 i9pIR7xPwEF5nv2+y7U3q7WsPpRQjwGiiuK+pdSx07OScwZtxXyVTaPHPySpQrVF7RKdeUkaLZR6v
 70jHUVL7P9AaJ2FHi9gWdaLZ0vIIgT5f07r3qQyHfcASOh5GRH1hNf3AYhdn0AQhQMw3sXp7EC3h5
 8GQAKsgEvOPGrTIOmZBUkkMeLYWvlAlbrj9uBI3MFzMAyeGBHiI3noab4LMVhZHZdGm7zwWvtNwV8
 YPsj2GbFXpbp8XiQSHx6VGipFCK/EIwMQRuFQsds9mQzDd2wa2DOurMLD/FWtZe5rEWSOPmGBb5aV
 NKatr0lw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vybBK-00000004QLS-20Q4; Fri, 06 Mar 2026 19:49:54 +0000
Message-ID: <934ca1e6-dfee-411e-890a-083dcfc9f6b1@infradead.org>
Date: Fri, 6 Mar 2026 11:49:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] serdev: add private data to serdev_device
To: Markus Probst <markus.probst@posteo.de>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Kari Argillander <kari.argillander@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Boqun Feng <boqun@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org,
 driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260306-rust_serdev-v2-0-e9b23b42b255@posteo.de>
 <20260306-rust_serdev-v2-2-e9b23b42b255@posteo.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260306-rust_serdev-v2-2-e9b23b42b255@posteo.de>
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
X-Rspamd-Queue-Id: 35257227386
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:robh@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:kari.argillander@gmail.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:boqun@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:kariargillander@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[posteo.de,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,linaro.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	NEURAL_HAM(-0.00)[-0.296];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,posteo.de:email]
X-Rspamd-Action: no action

Hi--

On 3/6/26 11:35 AM, Markus Probst wrote:
> Add private data to `struct serdev_device`, as it is required by the
> rust abstraction added in the following commit
> (rust: add basic serial device bus abstractions).
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  include/linux/serdev.h | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/serdev.h b/include/linux/serdev.h
> index 5654c58eb73c..b591af23faf0 100644
> --- a/include/linux/serdev.h
> +++ b/include/linux/serdev.h
> @@ -33,12 +33,13 @@ struct serdev_device_ops {
>  
>  /**
>   * struct serdev_device - Basic representation of an serdev device
> - * @dev:	Driver model representation of the device.
> - * @nr:		Device number on serdev bus.
> - * @ctrl:	serdev controller managing this device.
> - * @ops:	Device operations.
> - * @write_comp	Completion used by serdev_device_write() internally
> - * @write_lock	Lock to serialize access when writing data
> + * @dev:	 Driver model representation of the device.
> + * @nr:		 Device number on serdev bus.
> + * @ctrl:	 serdev controller managing this device.
> + * @ops:	 Device operations.
> + * @write_comp	 Completion used by serdev_device_write() internally
> + * @write_lock	 Lock to serialize access when writing data
> + * @private_data Private data for the device driver.
>   */

I don't quite get why each changed line has an extra tab added to it. ?
Also, struct member names in kernel-doc should with a colon  (':'), e.g.,

 * @private_data: Private data for the device driver.

Please correct that and the 2 lines above it also.
And maybe test it to check for warnings.

>  struct serdev_device {
>  	struct device dev;
> @@ -47,6 +48,7 @@ struct serdev_device {
>  	const struct serdev_device_ops *ops;
>  	struct completion write_comp;
>  	struct mutex write_lock;
> +	void *private_data;
>  };
>  
>  static inline struct serdev_device *to_serdev_device(struct device *d)
> 

thanks.
-- 
~Randy

