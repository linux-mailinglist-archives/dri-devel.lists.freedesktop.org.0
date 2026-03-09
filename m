Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDW8FRz9rmkxLQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:02:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0446323D480
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21B510E575;
	Mon,  9 Mar 2026 17:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xzj9+uTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010058.outbound.protection.outlook.com
 [52.101.193.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE9810E573;
 Mon,  9 Mar 2026 17:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sueoD5Sz4tCZW6wA23cm4KVsv4ttPSQMj9riBhm4BfBRnWac5a1muZVm7O938Ge61VrgbygJHkQsv0Hn9hBKDKJNnD2AuM20ZMBK/y78ct8HvNoKZ3nNVrCIJH5IJvOLf53DjgUIy8OG5nd0lBP6VAzjtftQVe/ofyJbJiG70zV2zUxu/EyjYYHEk8JncIdcwm3k3OIqCQNe2d739TuDBejHnxcatAcSUNq2uUJp+k+zwGLxvi9mw8XKtPlIRw9K2XafWCFgUFpn55lu3uh4fS+2zq2H9Z7xTFBPDJerG2w11e9sDImptDcstA6WF8n28HGvsZXqrgWQ/hicThpnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5Clsc8Xx8fywL06UyZ9ogksWuSLHSIGMRxPd6BPpaM=;
 b=ZlTFm9OAY2wTszC0v52kWF9/bgZYYyy2Tt2Lij3wkzW06sHV2yt4K1jbhSPzrCThrmkNp2sKj1rCdyZAP/agtBht5e1mSpJUDY3v/Wcpql4nDqJRgHJq6mIlQ/vlVQR/+7bBdBYWYAHi+V+masasQLM+53RHowsGHfsQ0mbB64Am0Ks/ZQnDoQKaRTxVGJISgI9W/ZhwhhSq8PNMlgodfR9fT4l6bNbVIXvgjMHUwHLGrJjdj7UL6TgMeyeIWFeVcRHkJCmwsZFcc7wbRWOVct4XvF1vHVSr690F3ytu7sL4yxhAB6aw1k/0AV66kZJ5c+QpcY+iGZRq0g15cwc30A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=rcpassos.me smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5Clsc8Xx8fywL06UyZ9ogksWuSLHSIGMRxPd6BPpaM=;
 b=Xzj9+uTKjIEOir11Br7xADC58l1ZmzdyW8YgWd2OL6vpBWQ0EYHqtkJIbb8/uwvpfSzh1+6CckafNFtvF+juarDiAUQr6h99whHfNbkbI3PcbkbeL7H1OIoW4jds5b9NnwtRC32Q39fIdhq+H6ta/Hj1EgkDBlHwcD6MTRR/CKA=
Received: from BL1PR13CA0330.namprd13.prod.outlook.com (2603:10b6:208:2c1::35)
 by DM4PR12MB7696.namprd12.prod.outlook.com (2603:10b6:8:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:02:10 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::a8) by BL1PR13CA0330.outlook.office365.com
 (2603:10b6:208:2c1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 17:02:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 17:02:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Mar
 2026 12:02:10 -0500
Received: from [10.254.95.155] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 9 Mar 2026 12:02:09 -0500
Message-ID: <ad3244e8-96a0-4d60-9047-cc20720c6dd2@amd.com>
Date: Mon, 9 Mar 2026 13:02:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix resuming from S3 sleep for Renoir
 iGPU
To: Rafael Passos <rafael@rcpassos.me>, <alexdeucher@gmail.com>
CC: <BhuvanaChandra.Pinninti@amd.com>, <Harry.Wentland@amd.com>,
 <Martin.Leung@amd.com>, <alexander.deucher@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <daniel.wheeler@amd.com>,
 <davidbtadokoro@ime.usp.br>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <ray.wu@amd.com>, <rcpassos@ime.usp.br>,
 <siqueira@igalia.com>, Ivan Lipski <IVAN.LIPSKI@amd.com>
References: <CADnq5_Msmohg3T5KLrqPwvJGbXPOMKeNN-ZcqgTS2pHb+GjuYQ@mail.gmail.com>
 <20260308000515.890688-1-rafael@rcpassos.me>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20260308000515.890688-1-rafael@rcpassos.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|DM4PR12MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd45c7c-0eed-4280-7e61-08de7dfd9a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|82310400026|36860700016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: tUBu9CB0rRw0t+2FKU5l6q3EOXR/xBoFEJfzwS9cf0kp/mzkSaAMSQTUPHahP9KRPcR7Gm2j9ZRMsKADDBxzG9vZi76upH3a3Vi7wgp5ME/3PQcNuzeU6QGlqobrt+SRJWoinzljJl15SjrcoHn7b7WSzHt4HFe39OFW7gdXhC3lnKEJoEVRWsVxMfrwqyEESs7Gv2Syub0HFBy7gmApb+gv/YJnj+Pjd5/INY9qqfe15+gQEJ5LwY04IbbCZUJxjBRUn3LNNIFLGhO4MXPWIeP+m2B2lQ2rfkyTDlQK4tYjFIYYAdNIJSfkySIe5Z06Dm8cCQou+TQdwNQa8DyuLcl4V+NOPXcebtC2xDbmj+7vWuJ7stvCUygJSmdaFqYpT7lZP2rowoTXYIWwpkNU6MufmgzU3IuOacISbvMBXuaxPbk0TxhmDkkQO5YCJ25ac43zfz0PvqRlsogn9zj0jhyrfwFwXZoPMyD+f9WSs/4vnKRBACui7ECU0AJ49WsSW9aVt5ppPGnvglZBMxSvJ02UTR69HbhTlOPuX+qgErN5tHD11qSUf0bOtSxExrRc13bSEBgYdcTB7y7o6F6o8pDKtyKHItWI1vuuUIWIfY7bnR9BWooJbAxcVUKjhVmFdarj2DgPNk9Py6L8NuXnu/2m6gvU8NOrtVzAsaaxElenuoc8AC+K4x43YLj00CcoC0q+IPKqcKgDYRtZoepVHUsl2mDOflxIoxn0ST/3Uaun7GNKLOufwPhX6z5sn8KvF8GWUhCZUIZGSwU+RHF6XLWoeA0qsezLDT0iAKfVTqw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(42112799006)(82310400026)(36860700016)(1800799024)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4vg+pFGoPWOSVEnRuiycbGsdcczZZzkNoXdJvGl6Feq4sUz+pdR7YC8xMTSTcEvbgcL86lbk23mDLUjdsAd71to+LbyFkAKB7gXlteISreZ++RFuyGDBTvL+T7QNoQkiPb2D/sWmhzpuDyLkVHybBrVNN1roV43/uELTq7KEhk9NJ7o7R75psbGCibvGqHnwdlchmKDowfWsrxR17P4bRkzpIZ91XmCmCT0ceQIh/smN/DmNrC9FQs789YWuZSx2PE32sKtAWOTjEhf0IYovx9bk6N2kUXFxuUJJRMavw+PxdN5HKcLeVy8YbHyTMdld75ppAMmG6r9jgiAuPVVQv0v1vR2ECfoXC6hNs0xIgDz5/WISFG4lYLg3/hIRNqCuI9j82UVhqfiJMPYvEqiHYqT2LKZZ/zcP6A8pNfZEpPomIvOU35r1kjaHQ56DismZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:02:10.3549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd45c7c-0eed-4280-7e61-08de7dfd9a68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7696
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
X-Rspamd-Queue-Id: 0446323D480
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,usp.br:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:mid,rcpassos.me:email];
	FREEMAIL_TO(0.00)[rcpassos.me,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026-03-07 19:04, Rafael Passos wrote:
> [You don't often get email from rafael@rcpassos.me. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> [WHAT]
> Set the register offset MICROSECOND_TIME_BASE_DIV in dccg_registers for DCN21.
> Introduce a new dccg21_init function, used in dccg_funcs.dccg_init for DCN21.
> The new dccg21_init sets 0x00120464 to set the MICROSECOND_TIME_BASE_DIV
> register instead of 0x00120264, set by dccg2_init.
> 
> [WHY]
> The previous commit introduced a change where the dcn21_s0i3_golden_init_wa
> function used to read the MICROSECOND_TIME_BASE_DIV reg from hwseq, and
> now started reading from dccg using dccg2_is_s0i3_golden_init_wa_done.
> However, this register is not properly initialized in dccg.
> Also, the value was initialized to 0x00120264 by dccg2_init, but
> compared to 0x00120464. For this reason, we created a new dccg21_init
> with the values specific to this card.
> 
> Fixes: 4c595e75110e ("drm/amd/display: Migrate DCCG registers access from hwseq to dccg component.")
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
> Co-developed-by: David Tadokoro <davidbtadokoro@ime.usp.br>
> Signed-off-by: David Tadokoro <davidbtadokoro@ime.usp.br>
> ---
> 
> It took a lot of debugging to get to this point.
> We are not sure this is the right fix, but it works.
> We found that when reading the MICROSECOND_TIME_BASE_DIV register,
> the offset was 13b in the old path and 0 in the new path.
> 
> The dcn21_s0i3_golden_init_wa is called when booting
> and when waking from sleep. It compares the value from
> MICROSECOND_TIME_BASE_DIV to 0x00120464.
> When booting, the value was different (and this function returns true).
> When waking from sleep, the value should be equal; thus,
> this function would return false.
> 
> After 4c595e75110e, the value was always different than 0x00120464, so
> this function always returned true, failing to wake the screen.
> This happened because the offset of MICROSECOND_TIME_BASE_DIV was 0,
> and READ_REG always returned 0x1186A0 (value from MILLISECOND_TIME_BASE_DIV?).
> 
> Things we are unsure of:
> - We used SR to set MICROSECOND_TIME_BASE_DIV direclty in the
>         dccg_registers struct. We did not find other examples of this.
>         Should we set MICROSECOND_TIME_BASE_DIV to the DCCG_COMMON_REG_LIST_DCN_BASE ?
>         I only added it to DCN21, because it is the hardware I have (and validated it works).
> - We changed 0x00120264 to 0x00120464 in the init, but dccg2 has the
>         same difference in setting and reading. We would like to know if this issue
>         also affects dccg2 (and other cards), or if we are missing something.
>         Maybe we should change this value in dccg2_is_s0i3_golden_init_wa_done.
> 
> It applies to the mainline master, amdgpu drm-next and amd-staging-drm-next.
> 
> Any feedback is appreciated. It was a fun-frustrating-veryfun journey. :)
> Code written only by humans.

Hi Rafael,

Thanks for bisecting and identifying the root cause. A fix has been submitted here:
https://lore.kernel.org/all/20260306031932.136179-14-alex.hung@amd.com/

Additionally, the offending change missed updating register definitions, which was
fixed here:
https://lore.kernel.org/all/20260306031932.136179-10-alex.hung@amd.com/

- Leo

> 
> 
>  .../drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c  | 17 ++++++++++++++++-
>  .../display/dc/resource/dcn21/dcn21_resource.c  |  3 ++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c b/drivers/gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c
> index 75c69348027e..6f96e9c189dc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c
> +++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c
> @@ -96,6 +96,21 @@ static void dccg21_update_dpp_dto(struct dccg *dccg, int dpp_inst, int req_dppcl
>         dccg->pipe_dppclk_khz[dpp_inst] = req_dppclk;
>  }
> 
> +void dccg21_init(struct dccg *dccg)
> +{
> +       struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
> +
> +       /* Hardcoded register values for DCN21
> +        * These are specific to 100Mhz refclk
> +        * Different ASICs with different refclk may override this in their own init
> +        */
> +       REG_WRITE(MICROSECOND_TIME_BASE_DIV, 0x00120464);
> +       REG_WRITE(MILLISECOND_TIME_BASE_DIV, 0x001186a0);
> +       REG_WRITE(DISPCLK_FREQ_CHANGE_CNTL, 0x0e01003c);
> +
> +       if (REG(REFCLK_CNTL))
> +               REG_WRITE(REFCLK_CNTL, 0);
> +}
> 
>  static const struct dccg_funcs dccg21_funcs = {
>         .update_dpp_dto = dccg21_update_dpp_dto,
> @@ -103,7 +118,7 @@ static const struct dccg_funcs dccg21_funcs = {
>         .set_fifo_errdet_ovr_en = dccg2_set_fifo_errdet_ovr_en,
>         .otg_add_pixel = dccg2_otg_add_pixel,
>         .otg_drop_pixel = dccg2_otg_drop_pixel,
> -       .dccg_init = dccg2_init,
> +       .dccg_init = dccg21_init,
>         .refclk_setup = dccg2_refclk_setup, /* Deprecated - for backward compatibility only */
>         .allow_clock_gating = dccg2_allow_clock_gating,
>         .enable_memory_low_power = dccg2_enable_memory_low_power,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
> index 0f4307f8f3dd..7f8f657eb0f2 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
> @@ -222,7 +222,8 @@ static const struct dce_audio_mask audio_mask = {
>  };
> 
>  static const struct dccg_registers dccg_regs = {
> -               DCCG_COMMON_REG_LIST_DCN_BASE()
> +               DCCG_COMMON_REG_LIST_DCN_BASE(),
> +               SR(MICROSECOND_TIME_BASE_DIV)
>  };
> 
>  static const struct dccg_shift dccg_shift = {
> --
> 2.53.0
> 

