Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2F877BF0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 09:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB5710EBC2;
	Mon, 11 Mar 2024 08:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="sHrHGthp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A9610EBC2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:53:50 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4TtVtf1CRMz9sZh;
 Mon, 11 Mar 2024 09:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1710147226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBxxMeFHaNTIFVvrYkndR+gcWNWRWVLtfGRhdSP2/6o=;
 b=sHrHGthpynjybtW3iaYqn4VDz8W2mUnv6z71ZcETVBTQpDmc7sauHjv28wVIESNz/NT4JO
 /eVM/ApgVTwerUaZtR+crPq/PZ9QfQrPX1WDUb9R/U+hQMeqrmn84ffVdA6EYR8U8fVs6Q
 6MKWrZ3VMg106rd65FLMhOoNk88XdMcm1C0OOax6wn91vCLFoo+dRCog61XZh0FdNhLrDV
 G4ztOUTIEG0WWo+/ygkJP0lKF5CIN1zlM1Yx+VoYodoBkIzP1n5ZyULYJ9x4RqUUP0uzUp
 U3GKlswqNYL8bbUzk07xidLNJSJeVygSFU7YDvFnpK2JjH330jL778xHvnsOSw==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xnux.eu>
Cc: Maxime Ripard <mripard@kernel.org>,  Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>,  Daniel Vetter
 <daniel@ffwll.ch>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Icenowy Zheng <uwu@icenowy.me>,
 dri-devel@lists.freedesktop.org,  linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: tcon: Support keeping dclk rate upon
 ancestor clock changes
In-Reply-To: <s3iqqnqiqnlujncbb6vnip7hvofgbom54on7fx4hxmyfsk2v2w@gbvpkptsa5g3>
 (=?utf-8?Q?=22Ond=C5=99ej?= Jirman"'s message of "Sun, 10 Mar 2024 23:23:57
 +0100")
References: <20240310-tcon_keep_stable_rate-v1-1-0296b0a85c02@oltmanns.dev>
 <s3iqqnqiqnlujncbb6vnip7hvofgbom54on7fx4hxmyfsk2v2w@gbvpkptsa5g3>
Date: Mon, 11 Mar 2024 09:53:41 +0100
Message-ID: <87le6pcfoq.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4TtVtf1CRMz9sZh
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

Hello Ond=C5=99ej,

On 2024-03-10 at 23:23:57 +0100, Ond=C5=99ej Jirman <x@xnux.eu> wrote:
> Hello Frank,
>
> On Sun, Mar 10, 2024 at 02:32:29PM +0100, Frank Oltmanns wrote:
>> +static int sun4i_rate_reset_notifier_cb(struct notifier_block *nb,
>> +				      unsigned long event, void *data)
>> +{
>> +	struct sun4i_rate_reset_nb *rate_reset =3D to_sun4i_rate_reset_nb(nb);
>> +
>> +	if (event =3D=3D POST_RATE_CHANGE)
>> +		schedule_delayed_work(&rate_reset->reset_rate_work, msecs_to_jiffies(=
100));
>
> If you get multiple reset notifier calls within 100ms of the first one,
> the delay from the last one will not be 100ms, so this may violate expect=
ations
> you're describing in the commit message.

Let me start by saying, the implicit expectation is that the new user of
pll-video0 will get an exclusive lock on pll-video0 (otherwise,
data-clock would reset pll-video0 after those 100ms rendering the whole
endeavor of the new user pointless). This constraint makes the chances
that the above event (two consecutive rate changes within 100ms) occurs
very slim.

That being said, I don't see a problem with cancelling the delayed work
on PRE_RATE_CHANGE and restarting it on ABORT_RATE_CHANGE like this:

+static int sun4i_rate_reset_notifier_cb(struct notifier_block *nb,
+				      unsigned long event, void *data)
+{
+	struct sun4i_rate_reset_nb *rate_reset =3D to_sun4i_rate_reset_nb(nb);
+
+	if (event =3D=3D PRE_RATE_CHANGE) {
+		rate_reset->is_cancelled =3D cancel_delayed_work(&rate_reset->reset_rate=
_work);
+	} else if ((event =3D=3D POST_RATE_CHANGE) ||
+		 (event =3D=3D ABORT_RATE_CHANGE) && rate_reset->is_cancelled) {
+		schedule_delayed_work(&rate_reset->reset_rate_work, msecs_to_jiffies(100=
));
+		rate_reset->is_cancelled =3D false;
+	}
+
+	return NOTIFY_DONE;
+}

The need for this new code is slim (IMHO) but on the other hand it
doesn't add much complexity. I'll add it in V2 including the
is_cancelled member in sun4i_rate_reset_nb if I don't receive any
objections during this week.

Thanks,
  Frank

>
> schedule_delayed_work doesn't re-schedule the work if it's already pendin=
g.
>
> Kind regards,
> 	o.
