Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6887EC03
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2E710E35C;
	Mon, 18 Mar 2024 15:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="xOz+5+hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6821410E35C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:22:32 +0000 (UTC)
Message-ID: <cda22b0c-8d7c-4ce2-9a7c-3b5ab540fa1f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710775350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xy6k9xRVjS7ywoka2yI3ZucurvNu1EJ6Z2EBQrWjdzQ=;
 b=xOz+5+hcR3hKGDRU3ohsK+6VDQuGZv/ehTx44Lwrda532CNJzZ26SE81f1eaVswBP7xJgD
 OsKb59CCUyjuj86kKDxZmTPO9n5jD9j4wk2Rh+lLNorNhvJUa4E7GZcb/7Da0zhlDsDpHr
 qXRNLP+60xgxGa2ZVvXFCBCRs6HZsfg=
Date: Mon, 18 Mar 2024 11:22:26 -0400
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance
 testing
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
References: <20240315230916.1759060-1-sean.anderson@linux.dev>
 <20240315230916.1759060-7-sean.anderson@linux.dev>
 <CAA8EJpoh_5EB5H8yf2yQhRYovXPo0QgrzssDHUzcoFo7rik5Bw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CAA8EJpoh_5EB5H8yf2yQhRYovXPo0QgrzssDHUzcoFo7rik5Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 3/16/24 13:56, Dmitry Baryshkov wrote:
> On Sat, 16 Mar 2024 at 01:09, Sean Anderson <sean.anderson@linux.dev> wrote:
>>
>> Add a debugfs interface for exercising the various test modes supported
>> by the DisplayPort controller. This allows performing compliance
>> testing, or performing signal integrity measurements on a failing link.
>> At the moment, we do not support sink-driven link quality testing,
>> although such support would be fairly easy to add.
> 
> Could you please point out how this is used for compliance testing? We
> have been using the msm_dp_compliance tool [1].

Here's some quick documentation I wrote up. This probably could be put
under Documentation for v2.

The following files in /sys/kernel/debug/dri/1/DP-1/test/ control the
DisplayPort test modes:

active:
  Writing a 1 to this file will activate test mode, and writing a 0 will
  deactivate test mode. Writing a 1 or 0 when the test mode is already
  active/inactive will reactivate/re-deactivate test mode. When test mode
  is inactive, changes made to other files will have no effect. When
  test mode is active, changes made to other files will apply instantly.
  Additionally, hotplug events (as removing the cable or if the monitor
  requests link retraining) are ignored.
custom:
  Custom test pattern value
downspread:
  Enable/disable clock downspreading (spread-spectrum clocking) by
  writing 1/0
enhanced:
  Enable/disable enhanced framing
lane0_preemphasis:
  Preemphasis from 0 (lowest) to 2 (most) for lane 0
lane0_swing:
  Voltage swing from 0 (lowest) to 3 (most) for lane 0
lane1_preemphasis:
  Preemphasis from 0 (lowest) to 2 (most) for lane 1
lane1_swing:
  Voltage swing from 0 (lowest) to 3 (most) for lane 1
lanes:
  Number of lanes to use (1 or 2)
pattern:
  Test pattern. May be one of:
    - video: Use regular video input
    - symbol-error: Symbol error measurement pattern
    - prbs7: Output of the PRBS7 (x^7 + x^6 + 1) polynomial
    - 80bit-custom: A custom 80-bit pattern
    - cp2520: HBR2 compliance eye pattern
    - tps1: Link training symbol pattern TPS1 (/D10.2/)
    - tps2: Link training symbol pattern TPS2
    - tps3: Link training symbol pattern TPS3 (for HBR2)
rate:
  Rate in hertz. One of
    - 5400000000: HBR2
    - 2700000000: HBR
    - 1620000000: RBR

You can dump the displayport test settings with the following command:

for prop in /sys/kernel/debug/dri/1/DP-1/test/*; do
	printf '%-20s ' ${prop##*/}
	if [ ${prop##*/} = custom ]; then
		hexdump -C $prop | head -1
	else
		cat $prop
	fi
done

The output could look something like

active               1
custom               00000000  00 00 00 00 00 00 00 00  00 00                    |..........|
downspread           0
enhanced             1
lane0_preemphasis    0
lane0_swing          3
lane1_preemphasis    0
lane1_swing          3
lanes                2
pattern              prbs7
rate                 1620000000

The recommended test procedure is to connect the board to a monitor,
configure test mode, activate test mode, and then disconnect the cable
and connect it to your test equipment of choice. For example, one
sequence of commands could be:

echo 1 > /sys/kernel/debug/dri/1/DP-1/test/enhanced
echo tps1 > /sys/kernel/debug/dri/1/DP-1/test/pattern
echo 1620000000 > /sys/kernel/debug/dri/1/DP-1/test/rate
echo 1 > /sys/kernel/debug/dri/1/DP-1/test/active

at which point the cable could be disconnected from the monitor. When
the cable is disconnected there will be several errors while changing
the settings. This is expected.

> I think it would be nice to rework our drivers towards a common
> debugfs interface used for DP connectors, maybe defining generic
> internal interface/helpers like Maxime is implementing for HDMI
> connectors.
> 
> [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c?ref_type=heads

I was definitely inspired by the msm, intel, and amd approaches.
However, those debugfs implementations seem to be oriented towards
DisplayPort text fixtures which emulate DPRXs. In particular, both the
intel and msm debugfs interfaces provide no method for configuring test
parameters in userspace. As test fixtures supporting DPCD can run into
the thousands of dollars, I think it is more economical to support
userspace-driven testing. I was particularly inspired by the AMD
approach:

	/* Usage: set DP physical test pattern using debugfs with normal DP
	 * panel. Then plug out DP panel and connect a scope to measure
	 * For normal video mode and test pattern generated from CRCT,
	 * they are visibile to user. So do not disable HPD.
	 * Video Mode is also set to clear the test pattern, so enable HPD
	 * because it might have been disabled after a test pattern was set.
	 * AUX depends on HPD * sequence dependent, do not move!
	 */

But I chose to always disable HPD events and ignore DPCD
errors in test mode. I think this is pretty convenient, since you can
run the same commands regardless of whether you have a monitor attached.
Although the initial setup does need a monitor (which is likely since
not everything gets set up by activating test mode; definitely fixable
but I didn't need it).

--Sean
