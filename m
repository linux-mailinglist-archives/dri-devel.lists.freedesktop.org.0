Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD9C071AC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C69710E210;
	Fri, 24 Oct 2025 15:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IvAFvNfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A63110E207;
 Fri, 24 Oct 2025 15:54:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DC29C432F4;
 Fri, 24 Oct 2025 15:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE852C4CEF1;
 Fri, 24 Oct 2025 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761321295;
 bh=JqnMh+5p4gimxlPXBBgYVudpI66hb0Yj008dLNRPMuI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IvAFvNfGiNpSsaNZYql90XJMUVb/2lkR2Pj6NQXPTtZ9xd7OTmQjSpxPZz3yfBAMM
 Np23ewISAbJg3Ibvn3rbe/XRXN9oRMgaH9HQvn/1rjTuKQvT+i28U2TxIvfHwHnnCb
 vjmf6rW08g9DBrcSznmqdO8F5b5iBcTMeZ8hkzQKSB9s/rXDUH92zxfZrtM+FEQTXa
 1shvHKJSUuViDur4SnjDoMWA57zXwHXniLH6yPtLWk/HYDP3EtenIWUlNlamtt3vgf
 m/cAFA535KyQ9YbsSMiTZ6bPL+wNBqGk0Za9MpfTYE5oxG+mmEzVlyy13qhajY9o28
 /0G7W3fN6Jr+A==
Message-ID: <314fb56c-54b6-48e8-a5dd-a615712003f1@kernel.org>
Date: Fri, 24 Oct 2025 10:54:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] platform/x86/amd/pmc: Add spurious_8042 to Xbox
 Ally
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Perry Yuan <perry.yuan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-3-lkml@antheas.dev>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251024152152.3981721-3-lkml@antheas.dev>
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



On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> The Xbox Ally features a Van Gogh SoC that has spurious interrupts
> during resume. We get the following logs:
> 
> atkbd_receive_byte: 20 callbacks suppressed
> atkbd serio0: Spurious ACK on isa0060/serio0. Some program might be trying to access hardware directly.
> 
> So, add the spurious_8042 quirk for it. It does not have a keyboard, so
> this does not result in any functional loss.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index d63aaad7ef59..eb641ce0e982 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -122,6 +122,14 @@ static const struct dmi_system_id fwbug_list[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "21A1"),
>   		}
>   	},
> +	{
> +		.ident = "ROG Xbox Ally RC73YA",
> +		.driver_data = &quirk_spurious_8042,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_BOARD_NAME, "RC73YA"),
> +		}
> +	},
>   	/* https://bugzilla.kernel.org/show_bug.cgi?id=218024 */
>   	{
>   		.ident = "V14 G4 AMN",

