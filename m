Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25F7843EA3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 12:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76E9112D7B;
	Wed, 31 Jan 2024 11:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5B0112D7B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 11:41:04 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A32332FC004A;
 Wed, 31 Jan 2024 12:41:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1706701263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2SsJehYO30sr02LgW1i3XyRegpdTntKLXnN2eAseYrk=;
 b=ZxYtFrTDL35wTkktQPwdhDVYEOf8pW9ybpn7/klnIOy0ABz9s2wkDHJ500ZGK/X9L/hUNQ
 12LVdbNj7C9QpSeFB0m7MXclVlvHmle5/ZCdjQe56Bjoq9VS8viJv6tDuZnGG9dDYJebuD
 k0LFC/WFVpfDcbwzUp9vYywXrLB8dUM=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
Date: Wed, 31 Jan 2024 12:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Future handling of complex RGB devices on Linux
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
References: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

so I combined Hans last draft, with the discussion since then and the comments 
from the OpenRGB maintainers from here 
https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916 and my own experience 
and came up witrh this rough updated draft for the new uapi:

Future handling of complex RGB devices on Linux:

Optional: Provide a basic leds-subsystem driver:
     - The whole device is treated as a singular RGB led in the current leds uapi
         - Backwards compatibility
         - Have something work out-of-the-box and during boot time
     - The driver also registers a misc device with a singluar sysfs attribute 
select_uapi
         - reading this gives back "[leds] none"
         - the current active uapi can be selected by writing it to that attribute
         - switching the uapi means deregistering the device from that entirely 
and registering and initializing it with the new one froms scratch
         - selecting none only does the deregistering

If the device is already reachable by userspace directly, e.g. via hidraw, the 
kernel will only offer this basic implementation and a more complex driver has 
to be implemented in userspace.
     - This driver has to use the select_uapi attribute first and select "none" 
to avoid undefined behaviour caused by accessing the leds upai and hidraw to 
control the lighting at the same time
     - Question: How to best associate the select_uapi attribute to the 
corresponding hidraw (or other) direct access channel? So that a userspace 
driver can reliable check whether or not this has to be set.

Devices not reachable by userspace directly, e.g. because they are controled via 
a wmi interface, can also be implemented in the new rgbledstring-subsystem 
(working title) for more complex control
     - a rgbledstring device provides an ioctl interface (ioctl only no r/w) 
using /dev/rgbledstring0, /dev/rgbledstring1, etc. registered as a misc chardev.
         - get-device-info ioctl which returns in a single struct:
             - char name[64]                     /* Device model name / 
identifier, preferable human readable. For keyboards, if known to the driver, 
physical layout (or even printed layout) should be separated here */
             - enum device_type                  /* e.g. keyboard, mouse, 
lightbar, etc. */
             - char firmware_version_string[64]  /* if known to the driver, 
empty otherwise */
             - char serial_number[64]            /* if known to the driver, 
empty otherwise */
             - enum supported_modes[64]          /* modes supported by the 
firmware e.g. static/direct, breathing, scan, raindrops, etc. */
         - get-mode-info icotl, RFC here: Hans thinks it is better to have the 
modes and their inputs staticly defined and have, if required, something like 
breathing_clevo_1, breathing_clevo_2, breathing_tongfang_1 if the inputs vary 
between vendors. I think a dynamic approach could be useful where userspace just 
queries the struct required for each individual mode.
             - input: a mode from the supported_modes extracted from get-device-info
             - output: static information about the mode, e.g. 
max_animation_speed, max_brightness, etc.
             - output: the struct/a list of attributes and their types required 
to configure the mode
         - set-mode ioctl takes a single struct:
             - enum mode                         /* from supported_modes */
             - union data
                 - char raw[3072]
                 - <all structs returned by get-mode-info>
         - The driver also registers a singluar sysfs attribute select_uapi
             - reading this gives back "[leds] rgbledstring none" or 
"[rgbledstring] none" respectifly
             - Discussion question: should select_uapi instead be use_leds_uapi
                 - if 1: use basic leds driver
                 - if 0: if device is userspace accessible no kernel driver is 
active, if device ist not userspace accessible register rgbledstring (aka 
implicit separation between rgbledstring and none instead of explicit one)

Zone configuration would be seen as a subset of mode configuration, as I suspect 
not every mode needs the zone configuration even on devices that offer it?

The most simple mode would be static/direct and the set-mode struct would look 
like this:
{
     enum mode, /* = static */
     {
         uint8 brightness, /* global brightness, some keyboards offer this */
         uint8 color[<number_of_leds>*3]
     }
}

Question: Are there modes that have a separate setup command that is only 
required once and then a continuous stream of update information? If yes, should 
we reflect that by splitting set-mode into set-mode-setup and set-mode-update 
(with get-mode-info returning one struct for each)? Or should userspace just 
always send setup and update information and it's up to the kernel driver to 
only resend the setup command when something has changed? In the former case 
set-mode-update might be a noop in most cases.

Discussion on this might also happen here: 
https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_1751170108

Regards,

Werner

