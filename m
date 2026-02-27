Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DmCLIVrToWlcwgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 18:24:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D7D1BB6C1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 18:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12A710E09E;
	Fri, 27 Feb 2026 17:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vBACnhPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A8910E09E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 17:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIfa7jg1NwC0Mf4GMw0FKAvuapXcNVJ/02gyLhteYNcYt81pyVuR/4LzVvsNR415ehI0LLB1ve8ThGyw/Y1t2ZCdxXjjF1mu/wMdM2aI2a8yxqq6ONMwBjixio0thIohpBU7AKh2HYRprVb4zOtbtxUImc6y16bZE0U+TIBx4Z2X4Gf7Le5If+yPGU1C0t8HX8gjHk/jZWhiF0NzRjzdVG7YwVacAWlz6Oh407WdqrDccDn8EPrzrzgL9OzwdTCcpKm/+yptGU6R50ykQiaOmfDIlyqPDMHH0zo3TzP+e7uvC3rSWyV/keoxQu71I/TAhs/04k4gS2yOLEkqzCMxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1tBfbqy5mJb7OBLVmgX8MSbq+9gtwOsdlnq0+UcoXU=;
 b=wTmCMrhg4lqr1QfmenDWTRqhKos0AWt3LARJrboyOwscstPDwb34XAIY1VljX9seIrO1Y2KDcWbnARn24p/osscpu5gCYYVOkS3lLN45lpLUjc9xIwLGZxZ1GLEiXhFPtDcHXVWj2kosnMid2ULvXX36fKW6OF8vpInzFA2DwtSOo2WtgUcVN9+M9QcOOdIbbFfmc0Msojr7XU6SP6ktAneb5kPy1wqIuCiNgt4Rp7+/S5Mv4AfPLM+lSEQq7YbyeKxbsBy9+a4uQtaP1CwRHQfTNrGYaLiSOD4hk6ka1uUh3w0NeyKdUqGqU63C4fCo/qzhdKj3qq4qRmVUrolo/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1tBfbqy5mJb7OBLVmgX8MSbq+9gtwOsdlnq0+UcoXU=;
 b=vBACnhPPrJivnJyjvy6h2wjmoGaqH25vcjVph9FnzSmuWDh0+sTYA0c6g8IgGEkbxkN3PLOzgE42a8gP9/NJBgKGWDOgbXLlJIQ9QQIT6LKT2k3l0hgVf6JNOPTGJMtOJzq83uu0YMgEJAV9lNkmZOZxEZTmPoO+T0dWlePRuMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB9777.jpnprd01.prod.outlook.com (2603:1096:400:22e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 17:24:27 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 17:24:22 +0000
Date: Fri, 27 Feb 2026 18:24:00 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
Message-ID: <aaHTMGQHZwutlBIv@tom-desktop>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0145.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::10) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c084b2-68d4-4ea2-8899-08de76250c11
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: 0uKuuXEVx5e9M0DoqXYoVMXBABS8eF9HNfXfLp0k2mRgdFjnlh7NNFJJbl2ygZd1WaO5P4qKNHd782B4xYsRQvuc1HkKLoW9siEa8GxRMorhHWIxeE8utUYt2KnCPJYQ+CzDlBbQMtVmi0wf8gEpYtpul+VmkksFRsJn4w+h+lp1IISofW1xAccbPpcp7fEfu/uQCWj+Pi52p76ydwpabEJivlqMkGjvyUuo2eewJWquNzNcyJn4Qp+Zdxn6mI/r1WFmb/hPfyMTzJkrWSBOu++jsOhCt7N9A2KaUMs15pPeXn3P7EEOXpONdJv4FiSxGrQheg16VmvOxNj+UjHD1KmoN7iUxR58zwCaLVsNlk5lARG2lboq/EFCEspsR9VdUQxTj2h1svIdPK2lWmcv6DOePC/aBvzbuTt5gDK5VDadSIl4JhdJjAe74gos8dylOGcTrtocxP2lGo1MCZNh5083WjdzpZF1eNxC7z5oVqi0/6p9JiLxRiCDvrcPIU2HQBTojBK2U1w9qnVfKuGiDBMEbKUBPNhWr73ETzTX0UbcAY75M/1k41H9l2LPuZDGBy2KSHZEFtYVZOPcbfjPi5WrK+M/rG00+74ofjdLo28hQg/H1T/DUCUrsOji/o+EJmguq2CwDEpPvctMnSUtdZuDqZA8r7ja5+/XjYrm5lIdfUo0B691IOb22tyM3P4CZUJHyQJVNc5WAJdKCwwNJhEK6ICdp6y7nMRSVprmHJgl03g+666I9LwF0ZYGwkGGJTVCFxYG6ATO9b3I6bFLVJSYuFryDneZnwfFgAMYD5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aK7Vz2d/IEzGic+xHuaCqb4a7Vet5Ww+nOf9YMAeVh1JIUxhMh/McyhwG8Y9?=
 =?us-ascii?Q?TRj1Fd1wDWG8xtn6u5NYVO5bkHt8BFTfqwQe1buSvQSLVjO7bBdLSn4MxuE7?=
 =?us-ascii?Q?uNzv2aXadbQpFDyNJZJWBRdegZS1zoB3udLC0D2wcfCN9V6SxingILqFjxbW?=
 =?us-ascii?Q?iL6m0ZBSp0ggcOtxd5J1PIhD9MC9nFU0DuT4D7hEiXvIRXmmLaBXmax78vcA?=
 =?us-ascii?Q?jBeV7fBreqiSY5cNxLI2WLc+Fjy+1CaffWUbKBBVnpQI20Z46eQ1KKSxFVAZ?=
 =?us-ascii?Q?3/CUp9KwBRphAP8+Sr7c0ZJTHDT1JYFSjmLAxdl6H7mFG8ylqaNSpPy5DJHO?=
 =?us-ascii?Q?BWVtNb6j77OfxNS9LFtqzKScC/v30wMHH7ofKHlsCYSYLTC6y21hoosNUofH?=
 =?us-ascii?Q?U/Q2F4jtlJyXkswNYxZVM42GaCxUDg6ypm+FtFj4sJchjli6zITBWcKDSbJV?=
 =?us-ascii?Q?9vlqB86ejy+lCyzx76OGDU7Bp9c4WRH9e1VoI/Z3wkbvWDCmU4mxfzX9SEEN?=
 =?us-ascii?Q?+IBGX21DFUs/+5azxZ7/8H1NWCvG2bc4Apn0fQy9hiLeb27su63WCNScfzFU?=
 =?us-ascii?Q?+bx6yLKrhGqvzqqqYpnr1jWMV1TmluyWotpAmBaPjseXipvaVl8KpuWl2oi4?=
 =?us-ascii?Q?keNPo949LiuVhf/QMyjp1xiZh+mZMVH9i7uJqM2j6pwu9jgr1e1Nb0gJaVxV?=
 =?us-ascii?Q?Pjsm10McMALIvCVodwbTxumuJ2lky2FFrum6XRUiN0p53Oh7LZkhqmwjKtz4?=
 =?us-ascii?Q?TYKyQteA5itGURb1Lo+KTvnBVX0JY+NajVl/wS8JMQdeSkqkn82hTi1cx9WX?=
 =?us-ascii?Q?1Kle2fdYXN7brvR9GgHSO57x+s6FT2tSXCXkuoLmTAgHwWXLoNC2YhW8zYnS?=
 =?us-ascii?Q?t3QLma2l1UsEvgZmqnAVog/5GxDEuhxa8zg0TQPi+yQkJhCdHQa6hu5wrOMV?=
 =?us-ascii?Q?zMatrJEBSS4j0chSfZR5AGDEJX0jVePgvit2BEI3t6gxT/VCSia0Usv0subv?=
 =?us-ascii?Q?jR2iJHV7TwLRhgHVZJRbXrcutfJd852ILk93sN4hn6ttDAKKQgUT+VusiT5V?=
 =?us-ascii?Q?Tplhg7ob6lwTBA53etJEc6hUzKE9VmACGK+gv6oitmApouKfpK+4/EJHdwCT?=
 =?us-ascii?Q?FsL+VJSIYvOmKp9RG9vItMnoK8NNyS5CLMdBA0ShYi30ogVVmYM2WilpQSZm?=
 =?us-ascii?Q?xJvS+NBG64X+ygo+RVp2pvv+xnEFVPKYXLfVqiTZ3qRAI4ln1ZjhV+sbcAqd?=
 =?us-ascii?Q?7l2HyS7uNonP8uG89aD1Y2QCVaTPFTUR89lbzwvRmpLoM+VGctXGaAZNlpWL?=
 =?us-ascii?Q?9oWeQd/gEnZkuiSCykSSFg+Dg8e+S3PulGGFpKMWEKPHPQwR0i9iPIuyvmqV?=
 =?us-ascii?Q?wAbEKcQhYyYHs1AibAbclVblU7L8YlC658zmGirpajn5Cpu23LVFEm1jikob?=
 =?us-ascii?Q?VlW6aNEgv8QTBMkn8lOx+riViKqTcWJgk1/7YNvxx2F6fSY5YG0rCy3f4XoT?=
 =?us-ascii?Q?LdnuQlgQAZqV6gAB5Y41AK+lbaqI8BCHrs5fgt1W+n3YP5za7e2MM+PJNfEM?=
 =?us-ascii?Q?X6v3UYTpqm23gXGMJFSa6jW3xb3mTjuGZdqwkgLt1+nIB/f0uhw6GEiMJ8PJ?=
 =?us-ascii?Q?8JuC+KbzyHKfKjUl4KHGpIwEqeE99Yp/gUROj7WZr3AMvaj+/O02yfLXFsod?=
 =?us-ascii?Q?dyIAJXmTrKFYgFK9sw627iLERwaUbXt9avPuqiN8SJnJ5ZwGNVhCPUjDe0CY?=
 =?us-ascii?Q?NaOQm0+BWTQJ4osvHTeaHJSC36PrRZG5FYmQ8TAIoq/jhOr21f6f?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c084b2-68d4-4ea2-8899-08de76250c11
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 17:24:22.5360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYJdhZYGmLZio7wMRoCPhyzfQ9k8SQnUzwv/cOIVQ9guWKZPP/hml8LO/39YatpIF6VMpJReRQsRRt/kZQM14eTaqAOeVZQ407hmNsD6c8rY4OblkclBZ3EmlRLln34I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9777
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tomm.merciai@gmail.com,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[init.name:url,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 00D7D1BB6C1
X-Rspamd-Action: no action

Hi Geert,
Thanks for your review!

On Fri, Feb 27, 2026 at 11:47:58AM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Fri, 13 Feb 2026 at 17:28, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Add PLLDSI clk mux support to select PLLDSI clock from different clock
> > sources.
> >
> > Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> > them in the clock driver.
> >
> > Extend the determine_rate callback to calculate and propagate PLL
> > parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> > using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
> >
> > The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
> > with different duty cycles:
> >
> > - CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
> > - CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)
> >
> > Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
> > allow the DRM driver to query and configure the appropriate clock path
> > based on the required output duty cycle.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> 
> > +static struct clk * __init
> > +rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
> > +                                  struct rzv2h_cpg_priv *priv)
> > +{
> > +       struct rzv2h_plldsi_mux_clk *clk_hw_data;
> > +       struct clk_init_data init;
> > +       struct clk_hw *clk_hw;
> > +       struct smuxed smux;
> > +       u8 width, mask;
> > +       int ret;
> > +
> > +       smux = core->cfg.smux;
> > +       mask = smux.width;
> > +       width = fls(mask) - ffs(mask) + 1;
> > +
> > +       if (width + smux.width > 16) {
> > +               dev_err(priv->dev, "mux value exceeds LOWORD field\n");
> > +               return ERR_PTR(-EINVAL);
> > +       }
> 
> I am totally confused by this: smux.width is not a mask, but the size
> of a register bitifield.
> Perhaps:
> 
>     if (smux.shift + smux.width > 16) { ... }
> 
> ?

Ouch, you are right.
Should be:

	if (smux.shift + smux.width > 16) {
		dev_err(priv->dev, "mux value exceeds LOWORD field\n");
		return ERR_PTR(-EINVAL);
	}

Will fix this in v6.

> 
> > +
> > +       clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
> > +       if (!clk_hw_data)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       clk_hw_data->priv = priv;
> > +
> > +       init.name = core->name;
> > +       init.ops = &rzv2h_cpg_plldsi_smux_ops;
> > +       init.flags = core->flag;
> > +       init.parent_names = core->parent_names;
> > +       init.num_parents = core->num_parents;
> > +
> > +       clk_hw_data->mux.reg = priv->base + smux.offset;
> > +
> > +       clk_hw_data->mux.shift = smux.shift;
> > +       clk_hw_data->mux.mask = smux.width;
> 
> Again, smux.width is not a mask.
> Perhaps GENMASK_U16(smux.shift - 1, 0)?

Or maybe we can use:

	clk_hw_data->mux.mask = clk_div_mask(smux.width);
?

I'll fix this in v6.
Thanks.

Kind Regards,
Tommaso

> 
> > +       clk_hw_data->mux.flags = core->mux_flags;
> > +       clk_hw_data->mux.lock = &priv->rmw_lock;
> > +
> > +       clk_hw = &clk_hw_data->mux.hw;
> > +       clk_hw->init = &init;
> > +
> > +       ret = devm_clk_hw_register(priv->dev, clk_hw);
> > +       if (ret)
> > +               return ERR_PTR(ret);
> > +
> > +       return clk_hw->clk;
> > +}
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
