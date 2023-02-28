Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751776A594E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A521610E69B;
	Tue, 28 Feb 2023 12:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E48A10E69B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:44:37 +0000 (UTC)
Date: Tue, 28 Feb 2023 12:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677588274; x=1677847474;
 bh=PD44GWN6rQfc3eB30HvlX8ukDHo4Xy2T41uyPPmZBGg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Mf5PhEUAVO0uUIaRxpqZTLlGTnUNfHUKbHQm7NsoRUmmQJcBJSvcFGbPI0ScLMSil
 7asCjs11jgx7blmpjbzUtlpYQMTgnS/MThxZP2jEci7nmcubAnvgazdEQmYB0yPaHA
 28r5RV1Dn295RIkPKYqIQgTDIXodoEd+2390uxSeDXAkU+arN/NNnGZOXf+NVftgBi
 /gAiWvaWbWMhFTNLM1Fb1I8eXDyTzs/b6slO8WcvIDE7BJ/oQAYnbiD0d8FhTnW7E+
 RMlAb7cU9V/ua3QAHQqR4jUbCef1AqapvWn/BQBEO3Wk2koodBVdiw7dJpoVx//vLk
 PLZWl3p1fiBXw==
To: Peter Stuge <peter@stuge.se>
From: Simon Ser <contact@emersion.fr>
Subject: Re: gud: set PATH connector property
Message-ID: <Rg-l1BDgSgbo04Mgca01xzLlg0MjL1P9SxE2GvPPQbOlkMLH1AtqvZ6zj6DItsDBfSIkScUbK4YIctzF57Y5Diinb99sXLqlgCCsAOEjNTc=@emersion.fr>
In-Reply-To: <20230228123134.1311.qmail@stuge.se>
References: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
 <20230228123134.1311.qmail@stuge.se>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 28th, 2023 at 13:31, Peter Stuge <peter@stuge.se> wrot=
e:

> > Would it be possible to set the PATH connector property based on the
> > USB port used by gud?
>=20
> Sadly not really easily.
>=20
> The physical topology underneath each host controller is stable but
> bus numbers (usb1, usb2 etc.) are not.

Oh, that's news to me. So if I unplug and replug a USB device, the bus
number and bus device number might change? Or does this happen after a
power-cycle? Or is this hardware-specific?

The guarantee we need for PATH is that the exact same hardware
configuration will always retain the same PATH.

> For onboard host controllers it could be possible to anchor to a
> PCI or platform bus device.

But the PCI bus device isn't enough I think? If I have a onboard host
controller with 2 physical USB ports, the PCI bus device isn't enough
to tell these 2 physical ports apart?

> But busses on expansion cards can't be recognized so easily without
> using maybe serial numbers - which may be cloned across multiple
> devices - we can't know.
>=20
> > This would give user-space a persistent identifier for the connector:
> > if the user plugs in a USB display on a given port, the PATH would be
> > the same even if the machine rebooted or the displays were plugged in
> > in a different order.
>=20
> How about using e.g. the serial number of the gud USB device instead
> of host topology, or maybe some other information from the panel
> behind it?

The PATH property is really about the port path, not the sink. IOW, if
I have two USB displays, one USB port, and switch between the two
displays on this one port, the PATH property isn't supposed to change.
