Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21BDA5FCFD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 18:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4D310E0BA;
	Thu, 13 Mar 2025 17:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S7k4GJAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCD010E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 17:05:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7A8F1A40C10;
 Thu, 13 Mar 2025 17:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D799DC4CEEA;
 Thu, 13 Mar 2025 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741885542;
 bh=wSphIq0AwTEWBRgbSG567LFZ6ToB/bMmr7vLR5oQ/M4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S7k4GJAoPfz8p6m8k15CyINZ1RDSnmgYRX4QysV3ngHMrg253s/TCBOgWSc/NFHx6
 Vjbj8UZ0xHq0ZCkO4MTQpWlekrA+gOQTdY2AOdTTV8HmYHElWW/fkbrJymQ25nX9IA
 and5y78HC0ObvHvoRZS4PNVzDauqbkCm5sLF+sSGe/YGJgWKB6hHBTpOrmhj+IBuzy
 qQ1Wa+SanwYTm5XWPRNL6RYIVS7plBRtAzrWKWj5qVDnp5pieIGrlasQrkLwLJWEzZ
 XgaydvJeF3FXPEtLMtF6f9Etr75KzsQLpOy+O4cvsuucsg5upfxSrOmHJkg1alkLBv
 z5Kq7xsYP/ARw==
Date: Thu, 13 Mar 2025 18:05:36 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Kosina <jikos@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH RFC 3/3] rust: hid: demo the core abstractions for probe
 and remove
Message-ID: <m2cm4c4m7teaca3tog774tl25ynngicg4eav4i7xiqyrxsqwju@leh5og5d6uba>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
 <20250313160220.6410-6-sergeantsagara@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313160220.6410-6-sergeantsagara@protonmail.com>
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

On Mar 13 2025, Rahul Rameshbabu wrote:
> This is a very basic "hello, world!" implementation to illustrate that the
> probe and remove callbacks are working as expected. I chose an arbitrary
> device I had on hand for populating in the HID device id table.

Nice to see this live :)

Though as I mentioned in the previous patch, I'd prefer having one full
driver in a single patch and one separate patch with the skeleton in the
docs.

Do you have any meaningful processing that needs to be done in the
report fixup or in the .raw_event or .event callbacks?

It would be much more interesting to show how this works together on a
minimalistic driver.

FWIW, the driver in itself, though incomplete, looks familiar, which is
a good thing: we've got a probe and a remove. This is common with all
the other HID drivers, so it's not a brand new thing.

I wonder however how and if we could enforce the remove() to be
automated by the binding or rust, to not have to deal with resource
leaking. Because the removal part, especially on failure, is the hardest
part.

Cheers,
Benjamin

> 
>   [  +0.012968] monitor_control: Probing HID device vendor: 2389 product: 29204 using Rust!
>   [  +0.000108] monitor_control: Removing HID device vendor: 2389 product: 29204 using Rust!
> 
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> ---
>  drivers/hid/hid_monitor_control.rs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid_monitor_control.rs b/drivers/hid/hid_monitor_control.rs
> index 18afd69a56d5..aeb6e4058a6b 100644
> --- a/drivers/hid/hid_monitor_control.rs
> +++ b/drivers/hid/hid_monitor_control.rs
> @@ -8,17 +8,22 @@
>      Driver,
>  };
>  
> +const USB_VENDOR_ID_NVIDIA: u32 = 0x0955;
> +const USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER: u32 = 0x7214;
> +
>  struct HidMonitorControl;
>  
>  #[vtable]
>  impl Driver for HidMonitorControl {
>      fn probe(dev: &mut hid::Device, id: &hid::DeviceId) -> Result<()> {
>          /* TODO implement */
> +        pr_info!("Probing HID device vendor: {} product: {} using Rust!\n", id.vendor(), id.product());
>          Ok(())
>      }
>  
>      fn remove(dev: &mut hid::Device) {
>          /* TODO implement */
> +        pr_info!("Removing HID device vendor: {} product: {} using Rust!\n", dev.vendor(), dev.product());
>      }
>  }
>  
> @@ -26,8 +31,8 @@ fn remove(dev: &mut hid::Device) {
>      driver: HidMonitorControl,
>      id_table: [
>          kernel::usb_device! {
> -            vendor: /* TODO fill in */,
> -            product: /* TODO fill in */,
> +            vendor: USB_VENDOR_ID_NVIDIA,
> +            product: USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER,
>          },
>      ],
>      name: "monitor_control",
> -- 
> 2.47.2
> 
> 
